@interface DIStackParams
- (BOOL)appendWithURL:(id)a3 isCache:(BOOL)a4 error:(id *)a5;
- (BOOL)appendWithURL:(id)a3 isCache:(BOOL)a4 numBlocks:(unint64_t)a5 error:(id *)a6;
- (BOOL)supportsPstack;
- (DIStackParams)initWithURL:(id)a3 error:(id *)a4;
@end

@implementation DIStackParams

- (DIStackParams)initWithURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DIStackParams;
  v7 = [(DIBaseParams *)&v11 initWithURL:v6 error:a4];
  v8 = v7;
  if (v7 && ![(DIBaseParams *)v7 openExistingImageWithFlags:0 error:a4]) {
    v9 = 0;
  }
  else {
    v9 = v8;
  }

  return v9;
}

- (BOOL)supportsPstack
{
  return 0;
}

- (BOOL)appendWithURL:(id)a3 isCache:(BOOL)a4 error:(id *)a5
{
  return [(DIStackParams *)self appendWithURL:a3 isCache:a4 numBlocks:0 error:a5];
}

- (BOOL)appendWithURL:(id)a3 isCache:(BOOL)a4 numBlocks:(unint64_t)a5 error:(id *)a6
{
  BOOL v8 = a4;
  v21[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  objc_super v11 = [[DIShadowNode alloc] initWithURL:v10 isCache:v8];
  [(DIShadowNode *)v11 setNumBlocks:a5];
  v12 = [(DIBaseParams *)self shadowChain];
  v21[0] = v11;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:1];
  char v14 = [v12 addShadowNodes:v13 error:a6];

  if (v14)
  {
    v15 = objc_alloc_init(DIClient2Controller_XPCHandler);
    if ([(DIClient2Controller_XPCHandler *)v15 connectWithError:a6]
      && [(DIBaseParams *)self prepareImageWithXpcHandler:v15 fileMode:3 error:a6])
    {
      v16 = [(DIBaseParams *)self diskImageParamsXPC];
      v17 = v16;
      if (v16)
      {
        [v16 createDiskImageWithCache:0 shadowValidation:0];

        if (v20) {
          (*(void (**)())(*(void *)v20 + 16))();
        }
      }
      else
      {
      }
      BOOL v18 = 1;
    }
    else
    {
      BOOL v18 = 0;
    }
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

@end