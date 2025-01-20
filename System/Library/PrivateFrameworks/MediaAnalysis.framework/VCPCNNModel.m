@interface VCPCNNModel
- (VCPCNNData)output;
- (VCPCNNModel)init;
- (VCPCNNModel)initWithParameters:(signed __int16)a3 useGPU:(BOOL)a4;
- (id)getGPUContext;
- (int)add:(id)a3;
- (int)dynamicForward:(id)a3 paramFileUrl:(id)a4 cancel:(id)a5;
- (int)forward:(id)a3;
- (int)prepareNetworkFromURL:(id)a3 withInputSize:(id)a4;
- (int)size;
@end

@implementation VCPCNNModel

- (VCPCNNModel)init
{
  v6.receiver = self;
  v6.super_class = (Class)VCPCNNModel;
  v2 = [(VCPCNNModel *)&v6 init];
  v3 = v2;
  if (v2)
  {
    bzero(v2->_blocks, 0x640uLL);
    v3->_quantFactor = 1;
    v4 = v3;
  }

  return v3;
}

- (VCPCNNModel)initWithParameters:(signed __int16)a3 useGPU:(BOOL)a4
{
  BOOL v4 = a4;
  v13.receiver = self;
  v13.super_class = (Class)VCPCNNModel;
  objc_super v6 = [(VCPCNNModel *)&v13 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_4;
  }
  bzero(v6->_blocks, 0x640uLL);
  v7->_quantFactor = a3;
  v7->_useGPU = v4;
  if (!v4)
  {
    context = v7->_context;
    v7->_context = 0;

    goto LABEL_6;
  }
  v8 = [[VCPCNNMetalContext alloc] initNewContext:1];
  v9 = v7->_context;
  v7->_context = v8;

  if (v7->_context)
  {
LABEL_6:
    v10 = v7;
    goto LABEL_7;
  }
LABEL_4:
  v10 = 0;
LABEL_7:

  return v10;
}

- (int)size
{
  uint64_t v3 = 0;
  blocks = self->_blocks;
  do
  {
    if (!blocks[v3]) {
      break;
    }
    ++v3;
  }
  while (v3 != 200);
  return v3;
}

- (id)getGPUContext
{
  return self->_context;
}

- (int)add:(id)a3
{
  id v5 = a3;
  int v6 = [(VCPCNNModel *)self size];
  if (v6 <= 199)
  {
    objc_storeStrong((id *)&self->_blocks[v6], a3);
    int v7 = 0;
  }
  else
  {
    int v7 = -50;
  }

  return v7;
}

- (int)prepareNetworkFromURL:(id)a3 withInputSize:(id)a4
{
  id v6 = a4;
  id v7 = [a3 path];
  v8 = fopen((const char *)[v7 UTF8String], "rb");

  int v9 = [(VCPCNNModel *)self size];
  if (v8)
  {
    int v10 = v9;
    [*((id *)&self->super.isa + v9) setGenerateOutput:1];
    v11 = self->_blocks[0];
    if ([(VCPCNNBlock *)v11 supportGPU]) {
      context = self->_context;
    }
    else {
      context = 0;
    }
    int v13 = [(VCPCNNBlock *)v11 constructBlock:v6 context:context];
    if (!v13)
    {
      int v13 = [(VCPCNNBlock *)self->_blocks[0] readFromDisk:v8 quantFactor:self->_quantFactor];
      if (!v13)
      {
        if (v10 < 2)
        {
          int v13 = 0;
        }
        else
        {
          v14 = (id *)&self->_blocks[1];
          uint64_t v15 = v10 - 1;
          do
          {
            id v16 = *v14;
            v17 = [*(v14 - 1) outputSize];
            if ([*v14 supportGPU]) {
              v18 = self->_context;
            }
            else {
              v18 = 0;
            }
            int v13 = [v16 constructBlock:v17 context:v18];

            if (v13) {
              break;
            }
            int v13 = [*v14 readFromDisk:v8 quantFactor:self->_quantFactor];
            if (v13) {
              break;
            }
            ++v14;
            --v15;
          }
          while (v15);
        }
      }
    }
    fclose(v8);
  }
  else
  {
    int v13 = -23;
  }

  return v13;
}

- (int)forward:(id)a3
{
  id v4 = a3;
  id v5 = [v4 size];
  uint64_t v6 = [v5 count];

  if (v6 == 3)
  {
    if (self->_useGPU && (int v7 = [v4 convertCPUData2GPU]) != 0)
    {
      v8 = 0;
      int v9 = 0;
    }
    else
    {
      [(VCPCNNBlock *)self->_blocks[0] setInput:v4];
      uint64_t v10 = 0;
      v8 = 0;
      v11 = 0;
LABEL_7:
      int v9 = v11;
      while (v10 < [(VCPCNNModel *)self size])
      {
        v11 = self->_blocks[v10];

        int v7 = [(VCPCNNBlock *)v11 forward];
        if (v7)
        {
          int v9 = v11;
          goto LABEL_17;
        }
        ++v10;
        int v9 = v11;
        if ([(VCPCNNModel *)self size] > (int)v10)
        {
          v12 = self->_blocks[v10];

          int v13 = [(VCPCNNBlock *)v11 output];
          [(VCPCNNBlock *)v12 setInput:v13];

          v8 = v12;
          goto LABEL_7;
        }
      }
      if (!self->_useGPU
        || (int v7 = [(VCPCNNMetalContext *)self->_context execute]) == 0
        && (objc_msgSend(*((id *)&self->super.isa + -[VCPCNNModel size](self, "size")), "output"),
            v14 = objc_claimAutoreleasedReturnValue(),
            int v7 = [v14 convertGPUData2CPU],
            v14,
            !v7))
      {
        objc_msgSend(*((id *)&self->super.isa + -[VCPCNNModel size](self, "size")), "output");
        uint64_t v15 = (VCPCNNData *)objc_claimAutoreleasedReturnValue();
        output = self->_output;
        self->_output = v15;

        int v7 = 0;
      }
    }
  }
  else
  {
    v8 = 0;
    int v9 = 0;
    int v7 = -50;
  }
LABEL_17:

  return v7;
}

- (int)dynamicForward:(id)a3 paramFileUrl:(id)a4 cancel:(id)a5
{
  id v8 = a3;
  int v9 = (uint64_t (**)(void))a5;
  id v10 = [a4 path];
  v11 = fopen((const char *)[v10 UTF8String], "rb");

  int v12 = [(VCPCNNModel *)self size];
  if (v11)
  {
    int v13 = v12;
    blocks = (id *)self->_blocks;
    uint64_t v15 = v12 - 1;
    [(VCPCNNBlock *)self->_blocks[v15] setGenerateOutput:1];
    id v16 = [v8 size];
    uint64_t v17 = [v16 count];

    if (v17 != 3)
    {
      int v18 = -50;
      goto LABEL_14;
    }
    if (self->_useGPU)
    {
      int v18 = [v8 convertCPUData2GPU];
      if (v18) {
        goto LABEL_14;
      }
    }
    id v19 = *blocks;
    if (*blocks)
    {
      v20 = [v8 size];
      int v18 = [v19 constructBlock:v20 context:self->_context];

      if (v18) {
        goto LABEL_14;
      }
      int v18 = [(VCPCNNBlock *)self->_blocks[0] readFromDisk:v11 quantFactor:self->_quantFactor];
      if (v18) {
        goto LABEL_14;
      }
      [*blocks setInput:v8];
      int v18 = [*blocks forward];
      if (v18) {
        goto LABEL_14;
      }
      if (v13 < 2)
      {
        int v22 = 0;
      }
      else
      {
        if (v9[2](v9))
        {
          int v18 = -128;
LABEL_14:
          fclose(v11);
          goto LABEL_15;
        }
        v26 = [*blocks output];
        [(VCPCNNBlock *)self->_blocks[1] setInput:v26];

        uint64_t v27 = 0;
        int v39 = 0;
        uint64_t v38 = v13 - 1;
        do
        {
          v28 = (void *)MEMORY[0x1C186D320]();
          v29 = &self->super.isa + v27;
          Class v30 = v29[2];
          if (v30)
          {
            context = v28;
            v31 = [(objc_class *)v29[1] outputSize];
            int v32 = [(objc_class *)v30 constructBlock:v31 context:self->_context];

            if (v32)
            {
              char v33 = 0;
              int v39 = v32;
            }
            else
            {
              int v34 = [(objc_class *)v29[2] readFromDisk:v11 quantFactor:self->_quantFactor];
              if (v34 || (int v34 = [(objc_class *)v29[2] forward]) != 0)
              {
                char v33 = 0;
                int v39 = v34;
              }
              else
              {
                if (v27 + 1 < v15)
                {
                  v35 = [(objc_class *)v29[2] output];
                  [(VCPCNNBlock *)self->_blocks[v27 + 2] setInput:v35];
                }
                Class v36 = v29[1];
                v29[1] = 0;

                char v33 = 1;
              }
            }
            v28 = context;
          }
          else
          {
            char v33 = 0;
            int v39 = -18;
          }
          if ((v33 & 1) == 0)
          {
            int v18 = v39;
            goto LABEL_14;
          }
          ++v27;
        }
        while (v38 != v27);
        if (!*blocks)
        {
          objc_storeStrong((id *)self->_blocks, blocks[v15]);
          id v37 = blocks[v15];
          blocks[v15] = 0;
        }
        int v22 = v39;
        if ([(VCPCNNModel *)self size] != 1) {
          goto LABEL_40;
        }
      }
      if (!self->_useGPU
        || (int v18 = [(VCPCNNMetalContext *)self->_context execute]) == 0
        && ([*blocks output],
            v23 = objc_claimAutoreleasedReturnValue(),
            int v18 = [v23 convertGPUData2CPU],
            v23,
            !v18))
      {
        v24 = [*blocks output];
        output = self->_output;
        self->_output = v24;

        int v18 = v22;
      }
      goto LABEL_14;
    }
LABEL_40:
    int v18 = -18;
    goto LABEL_14;
  }
  int v18 = -23;
LABEL_15:

  return v18;
}

- (VCPCNNData)output
{
  return (VCPCNNData *)objc_getProperty(self, a2, 1624, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_output, 0);
  objc_storeStrong((id *)&self->_context, 0);
  uint64_t v3 = 1600;
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + v3), 0);
    v3 -= 8;
  }
  while (v3);
}

@end