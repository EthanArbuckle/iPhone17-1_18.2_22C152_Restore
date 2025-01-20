@interface AVTStickerCamera
+ (id)cameraFromDictionary:(id)a3 assetsPath:(id)a4;
+ (id)stickerCameraCache;
- (AVTStickerCamera)initWithCameraNode:(id)a3;
- (SCNNode)node;
- (id)buildNode;
- (void)setNode:(id)a3;
@end

@implementation AVTStickerCamera

+ (id)stickerCameraCache
{
  if (stickerCameraCache_onceToken != -1) {
    dispatch_once(&stickerCameraCache_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)stickerCameraCache_kCache;
  return v2;
}

uint64_t __38__AVTStickerCamera_stickerCameraCache__block_invoke()
{
  stickerCameraCache_kCache = (uint64_t)objc_alloc_init(MEMORY[0x263EFF8E0]);
  return MEMORY[0x270F9A758]();
}

+ (id)cameraFromDictionary:(id)a3 assetsPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 objectForKey:@"scene"];
  v9 = [v7 objectForKey:@"name"];

  v10 = [v6 stringByAppendingPathComponent:v8];

  v11 = [NSURL fileURLWithPath:v10 isDirectory:0];
  v12 = NSString;
  v13 = [v11 standardizedURL];
  v14 = [v12 stringWithFormat:@"%@.%@", v13, v9];

  v15 = [a1 stickerCameraCache];
  v16 = [v15 objectForKey:v14];
  if (!v16)
  {
    id v22 = 0;
    v17 = objc_msgSend(MEMORY[0x263F16AD8], "avt_nodeNamed:forSceneAtURL:options:error:", v9, v11, 0, &v22);
    id v18 = v22;
    v19 = v18;
    if (!v17 || v18)
    {
      v20 = avt_default_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        +[AVTStickerCamera cameraFromDictionary:assetsPath:]((uint64_t)v10, v19, v20);
      }

      v16 = 0;
    }
    else
    {
      v16 = [[AVTStickerCamera alloc] initWithCameraNode:v17];
      [v15 setObject:v16 forKey:v14];
      v19 = v17;
    }
  }
  return v16;
}

- (AVTStickerCamera)initWithCameraNode:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AVTStickerCamera;
  id v6 = [(AVTStickerCamera *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_node, a3);
  }

  return v7;
}

- (id)buildNode
{
  v2 = [(AVTStickerCamera *)self node];
  v3 = [v2 clone];

  [v3 enumerateHierarchyUsingBlock:&__block_literal_global_35];
  return v3;
}

void __29__AVTStickerCamera_buildNode__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v4 = [v2 camera];
  v3 = (void *)[v4 copy];
  [v2 setCamera:v3];
}

- (SCNNode)node
{
  return self->_node;
}

- (void)setNode:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (void)cameraFromDictionary:(NSObject *)a3 assetsPath:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = [a2 description];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  objc_super v9 = v5;
  _os_log_error_impl(&dword_20B819000, a3, OS_LOG_TYPE_ERROR, "Error: could not load sticker camera scene at %@ with error: %@", (uint8_t *)&v6, 0x16u);
}

@end