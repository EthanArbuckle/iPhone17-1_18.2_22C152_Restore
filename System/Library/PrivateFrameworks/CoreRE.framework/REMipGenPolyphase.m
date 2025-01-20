@interface REMipGenPolyphase
+ (_REMipGenPolyphaseOptions)defaultOptions;
- (REMipGenPolyphase)initWithLibrary:(id)a3;
- (void)copyAndGenerateMipmapsFromTexture:(id)a3 toTexture:(id)a4 withComputeEncoder:(id)a5;
- (void)copyAndGenerateMipmapsFromTexture:(id)a3 toTexture:(id)a4 withComputeEncoder:(id)a5 withOptions:(_REMipGenPolyphaseOptions)a6;
- (void)dealloc;
- (void)generateMipmapsForTexture:(id)a3 withComputeEncoder:(id)a4;
- (void)generateMipmapsForTexture:(id)a3 withComputeEncoder:(id)a4 withOptions:(_REMipGenPolyphaseOptions)a5;
@end

@implementation REMipGenPolyphase

+ (_REMipGenPolyphaseOptions)defaultOptions
{
  return (_REMipGenPolyphaseOptions)0;
}

- (REMipGenPolyphase)initWithLibrary:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 device];
  v27.receiver = self;
  v27.super_class = (Class)REMipGenPolyphase;
  v6 = [(REMipGenPolyphase *)&v27 init];
  if (v6)
  {
    v28[0] = xmmword_264BE5638;
    v28[1] = *(_OWORD *)off_264BE5648;
    v29 = @"mipGenPolyphaseRef";
    if ([v5 supportsFamily:5001]) {
      char v7 = [v5 supportsFamily:1006] ^ 1;
    }
    else {
      char v7 = 1;
    }
    v24 = v6;
    v6->_useTextureViews = v7;
    p_useTextureViews = &v6->_useTextureViews;
    v9 = objc_opt_new();
    [v9 setConstantValue:p_useTextureViews type:53 withName:@"UseTextureViews"];
    uint64_t v10 = 0;
    id v11 = 0;
    id v12 = 0;
    v13 = p_useTextureViews - 152;
    do
    {
      v14 = v12;
      v15 = v11;
      uint64_t v16 = *(void *)((char *)v28 + v10);
      id v26 = v11;
      uint64_t v17 = [v4 newFunctionWithName:v16 constantValues:v9 error:&v26];
      id v11 = v26;

      v18 = *(void **)v13;
      *(void *)v13 = v17;

      v19 = *(void **)v13;
      id v25 = v14;
      uint64_t v20 = [v5 newComputePipelineStateWithFunction:v19 error:&v25];
      id v12 = v25;

      v21 = (void *)*((void *)v13 + 1);
      *((void *)v13 + 1) = v20;

      v10 += 8;
      v13 += 16;
    }
    while (v10 != 32);

    for (uint64_t i = 32; i != -8; i -= 8)
    v6 = v24;
    v24->_tileValid = 0;
  }
  return v6;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)REMipGenPolyphase;
  [(REMipGenPolyphase *)&v2 dealloc];
}

- (void)generateMipmapsForTexture:(id)a3 withComputeEncoder:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(REMipGenPolyphase *)self generateMipmapsForTexture:v7 withComputeEncoder:v6 withOptions:(unsigned __int16)+[REMipGenPolyphase defaultOptions]];
}

- (void)generateMipmapsForTexture:(id)a3 withComputeEncoder:(id)a4 withOptions:(_REMipGenPolyphaseOptions)a5
{
  id v15 = a3;
  id v8 = a4;
  if ((*(_WORD *)&a5 & 0x100) != 0)
  {
    bzero(self->_tileValid, self->_tileMaxCount);
    int v13 = [v15 mipmapLevelCount];
    generateMipmapsForTexture_HierarchicalTiling_traverse(v15, v8, *(unsigned __int16 *)&a5, self, v13 - 1, 0, 0, self->_useTextureViews, v14);
  }
  else if ((unint64_t)[v15 mipmapLevelCount] >= 2)
  {
    unint64_t v9 = 1;
    do
    {
      unint64_t v10 = objc_msgSend(v15, "width", v15);
      if (v10 >> v9 <= 1) {
        LOWORD(v11) = 1;
      }
      else {
        unint64_t v11 = v10 >> v9;
      }
      unint64_t v12 = (unint64_t)[v15 height] >> v9;
      if (v12 <= 1) {
        LOWORD(v12) = 1;
      }
      LOWORD(v16) = v11;
      HIWORD(v16) = v12;
      dispatchMipGenRect(v15, v15, v8, self, v9++, 0, v16, self->_useTextureViews);
    }
    while ([v15 mipmapLevelCount] > v9);
  }
}

- (void)copyAndGenerateMipmapsFromTexture:(id)a3 toTexture:(id)a4 withComputeEncoder:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [(REMipGenPolyphase *)self copyAndGenerateMipmapsFromTexture:v10 toTexture:v9 withComputeEncoder:v8 withOptions:(unsigned __int16)+[REMipGenPolyphase defaultOptions]];
}

- (void)copyAndGenerateMipmapsFromTexture:(id)a3 toTexture:(id)a4 withComputeEncoder:(id)a5 withOptions:(_REMipGenPolyphaseOptions)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  if ((unint64_t)[v9 mipmapLevelCount] >= 2)
  {
    unint64_t v11 = 1;
    do
    {
      unint64_t v12 = objc_msgSend(v16, "width", v16);
      if (v12 >> v11 <= 1) {
        LOWORD(v13) = 1;
      }
      else {
        unint64_t v13 = v12 >> v11;
      }
      unint64_t v14 = (unint64_t)[v16 height] >> v11;
      if (v14 <= 1) {
        LOWORD(v14) = 1;
      }
      id v15 = v16;
      if (v11 != 1) {
        id v15 = v9;
      }
      LOWORD(v17) = v13;
      HIWORD(v17) = v14;
      dispatchMipGenRect(v15, v9, v10, self, v11++, 0, v17, self->_useTextureViews);
    }
    while ([v9 mipmapLevelCount] > v11);
  }
}

- (void).cxx_destruct
{
  for (uint64_t i = 0; i != -5; --i)
  {
  }
}

@end