@interface NTKSiderealCachedMTLTexture
- (MTLTexture)texture;
- (NSString)cacheKey;
- (NTKSiderealCachedMTLTexture)initWithCachedImageKey:(id)a3 isAlphaOnly:(BOOL)a4 imageGenerationBlock:(id)a5;
- (id)_alphaOnlyTexture;
- (id)_loadTexture:(id)a3 WithCommandBuffer:(id)a4;
- (id)_rgbaTexture;
- (id)loadTextureWithCommandBuffer:(id)a3 usingBlitEncoder:(id)a4;
@end

@implementation NTKSiderealCachedMTLTexture

- (NTKSiderealCachedMTLTexture)initWithCachedImageKey:(id)a3 isAlphaOnly:(BOOL)a4 imageGenerationBlock:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)NTKSiderealCachedMTLTexture;
  v11 = [(NTKSiderealCachedMTLTexture *)&v17 init];
  if (v11)
  {
    id v12 = objc_retainBlock(v10);
    id generateImageBlock = v11->_generateImageBlock;
    v11->_id generateImageBlock = v12;

    v11->_isAlphaOnly = a4;
    uint64_t v14 = +[CLKUIMetalResourceManager sharedDevice];
    device = v11->_device;
    v11->_device = (MTLDevice *)v14;

    objc_storeStrong((id *)&v11->_cacheKey, a3);
  }

  return v11;
}

- (MTLTexture)texture
{
  return self->_mtlTexture;
}

- (NSString)cacheKey
{
  return self->_cacheKey;
}

- (id)loadTextureWithCommandBuffer:(id)a3 usingBlitEncoder:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!self->_mtlTexture)
  {
    if (!v7)
    {
      v8 = [v6 blitCommandEncoder];
    }
    if (self->_isAlphaOnly) {
      [(NTKSiderealCachedMTLTexture *)self _alphaOnlyTexture];
    }
    else {
    id v9 = [(NTKSiderealCachedMTLTexture *)self _rgbaTexture];
    }
    ((void (**)(void, void *))v9)[2](v9, v8);
    id v10 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    mtlTexture = self->_mtlTexture;
    self->_mtlTexture = v10;

    id generateImageBlock = self->_generateImageBlock;
    self->_id generateImageBlock = 0;
  }
  id v13 = v8;

  return v13;
}

- (id)_loadTexture:(id)a3 WithCommandBuffer:(id)a4
{
  v5 = (void (**)(id, void *))a3;
  id v6 = a4;
  id v7 = v6;
  if (v5)
  {
    if (v6)
    {
      BOOL v8 = 1;
    }
    else
    {
      id v10 = +[CLKUIMetalResourceManager sharedCommandQueue];
      id v7 = [v10 commandBuffer];
      +[CLKUIMetalResourceManager addCompletedErrorCheckToCommandBuffer:v7 forCase:@"SiderealLoadTexture"];

      BOOL v8 = v10 == 0;
    }
    v11 = [v7 blitCommandEncoder];
    id v9 = v5[2](v5, v11);
    [v11 endEncoding];
    if (!v8)
    {
      [v7 commit];
      [v7 waitUntilScheduled];
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)_alphaOnlyTexture
{
  if (self->_generateImageBlock)
  {
    uint64_t v34 = 0;
    v35 = &v34;
    uint64_t v36 = 0x3032000000;
    v37 = sub_D0A4;
    v38 = sub_D0B4;
    id v39 = 0;
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x2020000000;
    uint64_t v33 = 0;
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x2020000000;
    uint64_t v29 = 0;
    objc_initWeak(&location, self);
    v3 = +[NTKSiderealCache sharedCache];
    cacheKey = self->_cacheKey;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_D0BC;
    v23[3] = &unk_2CA78;
    objc_copyWeak(&v24, &location);
    v23[4] = &v30;
    v23[5] = &v26;
    v23[6] = &v34;
    v5 = [v3 imageDataForKey:cacheKey generationBlock:v23];

    if (v5)
    {
      if (!v35[5])
      {
        id v6 = v5;
        id v7 = (uint64_t *)[v6 bytes];
        BOOL v8 = v31;
        v31[3] = *v7;
        uint64_t v9 = v7[1];
        v27[3] = v9;
        if (!(v8[3] | v9))
        {
          id v10 = _NTKLoggingObjectForDomain();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
            sub_1C8D4(v10);
          }
LABEL_12:
          id v12 = 0;
LABEL_15:

          objc_destroyWeak(&v24);
          objc_destroyWeak(&location);
          _Block_object_dispose(&v26, 8);
          _Block_object_dispose(&v30, 8);
          _Block_object_dispose(&v34, 8);

          goto LABEL_16;
        }
        id v13 = -[MTLDevice newBufferWithBytes:length:options:](self->_device, "newBufferWithBytes:length:options:", v7 + 2, (unint64_t)((double)(unint64_t)[v6 length] + -16.0), 0);
        uint64_t v14 = (void *)v35[5];
        v35[5] = (uint64_t)v13;
      }
      id v10 = +[MTLTextureDescriptor texture2DDescriptorWithPixelFormat:10 width:v31[3] height:v27[3] mipmapped:0];
      [v10 setStorageMode:2];
      [v10 setUsage:1];
      id v15 = [(MTLDevice *)self->_device newTextureWithDescriptor:v10];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_D474;
      v18[3] = &unk_2CAA0;
      v21 = &v30;
      v22 = &v26;
      id v19 = v15;
      v20 = &v34;
      id v16 = v15;
      id v12 = objc_retainBlock(v18);

      goto LABEL_15;
    }
    id v10 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1C868();
    }
    goto LABEL_12;
  }
  v11 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    sub_1C800();
  }

  id v12 = 0;
LABEL_16:

  return v12;
}

- (id)_rgbaTexture
{
  if (self->_generateImageBlock)
  {
    uint64_t v34 = 0;
    v35 = &v34;
    uint64_t v36 = 0x3032000000;
    v37 = sub_D0A4;
    v38 = sub_D0B4;
    id v39 = 0;
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x2020000000;
    uint64_t v33 = 0;
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x2020000000;
    uint64_t v29 = 0;
    objc_initWeak(&location, self);
    v3 = +[NTKSiderealCache sharedCache];
    cacheKey = self->_cacheKey;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_D900;
    v23[3] = &unk_2CA78;
    objc_copyWeak(&v24, &location);
    v23[4] = &v30;
    v23[5] = &v26;
    v23[6] = &v34;
    v5 = [v3 imageDataForKey:cacheKey generationBlock:v23];

    if (v5)
    {
      if (!v35[5])
      {
        id v6 = v5;
        id v7 = (uint64_t *)[v6 bytes];
        BOOL v8 = v31;
        v31[3] = *v7;
        uint64_t v9 = v7[1];
        v27[3] = v9;
        if (!(v8[3] | v9))
        {
          id v10 = _NTKLoggingObjectForDomain();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
            sub_1C8D4(v10);
          }
LABEL_12:
          id v12 = 0;
LABEL_15:

          objc_destroyWeak(&v24);
          objc_destroyWeak(&location);
          _Block_object_dispose(&v26, 8);
          _Block_object_dispose(&v30, 8);
          _Block_object_dispose(&v34, 8);

          goto LABEL_16;
        }
        id v13 = -[MTLDevice newBufferWithBytes:length:options:](self->_device, "newBufferWithBytes:length:options:", v7 + 2, (unint64_t)((double)(unint64_t)[v6 length] + -16.0), 0);
        uint64_t v14 = (void *)v35[5];
        v35[5] = (uint64_t)v13;
      }
      id v10 = +[MTLTextureDescriptor texture2DDescriptorWithPixelFormat:81 width:v31[3] height:v27[3] mipmapped:0];
      [v10 setStorageMode:2];
      [v10 setUsage:1];
      id v15 = [(MTLDevice *)self->_device newTextureWithDescriptor:v10];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_DC34;
      v18[3] = &unk_2CAA0;
      v21 = &v30;
      v22 = &v26;
      id v19 = v15;
      v20 = &v34;
      id v16 = v15;
      id v12 = objc_retainBlock(v18);

      goto LABEL_15;
    }
    id v10 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1C868();
    }
    goto LABEL_12;
  }
  v11 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    sub_1C800();
  }

  id v12 = 0;
LABEL_16:

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_generateImageBlock, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_mtlTexture, 0);

  objc_storeStrong((id *)&self->_cacheKey, 0);
}

@end