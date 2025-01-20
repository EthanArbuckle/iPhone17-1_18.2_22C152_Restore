@interface MUICachingSVGConverter
+ (id)_keyForData:(double)a3 size:(uint64_t)a4 scale:(void *)a5;
- (MUICachingSVGConverter)init;
- (NSCache)cache;
- (void)imageForSVGData:(id)a3 size:(CGSize)a4 scale:(double)a5 completionHandler:(id)a6;
@end

@implementation MUICachingSVGConverter

- (MUICachingSVGConverter)init
{
  v6.receiver = self;
  v6.super_class = (Class)MUICachingSVGConverter;
  v2 = [(MUICachingSVGConverter *)&v6 init];
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    cache = v2->_cache;
    v2->_cache = v3;
  }
  return v2;
}

- (void)imageForSVGData:(id)a3 size:(CGSize)a4 scale:(double)a5 completionHandler:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  id v11 = a3;
  v12 = (void (**)(id, void *))a6;
  v13 = +[MUICachingSVGConverter _keyForData:a5 size:(uint64_t)MUICachingSVGConverter scale:v11];
  v14 = [(MUICachingSVGConverter *)self cache];
  v15 = [v14 objectForKey:v13];

  if (v15)
  {
    v16 = [v15 UIImage];
    v12[2](v12, v16);
  }
  else
  {
    v17 = [MEMORY[0x1E4F28CB8] defaultManager];
    v18 = [v17 temporaryDirectory];
    v16 = [v18 URLByAppendingPathComponent:@"MailBrandIndicators"];

    v19 = [v16 path];
    char v20 = [v17 fileExistsAtPath:v19];

    if ((v20 & 1) == 0)
    {
      v21 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v21 createDirectoryAtURL:v16 withIntermediateDirectories:1 attributes:0 error:0];
    }
    v22 = objc_msgSend(NSString, "ef_UUID");
    v23 = [v16 URLByAppendingPathComponent:v22];
    v24 = [v23 URLByAppendingPathExtension:@"svg"];

    [v11 writeToURL:v24 atomically:0];
    v25 = [MEMORY[0x1E4F3A6C8] sharedGenerator];
    v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4F3A6C0]), "initWithFileAtURL:size:scale:representationTypes:", v24, 4, width, height, a5);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __71__MUICachingSVGConverter_imageForSVGData_size_scale_completionHandler___block_invoke;
    v29[3] = &unk_1E6D12C78;
    id v30 = v17;
    id v31 = v24;
    v32 = self;
    id v33 = v13;
    v34 = v12;
    id v27 = v24;
    id v28 = v17;
    [v25 generateBestRepresentationForRequest:v26 completionHandler:v29];
  }
}

+ (id)_keyForData:(double)a3 size:(uint64_t)a4 scale:(void *)a5
{
  id v8 = a5;
  self;
  id v9 = [NSString alloc];
  v10 = objc_msgSend(v8, "ef_md5Digest");

  id v11 = objc_msgSend(v10, "ef_hexString");
  v12 = (void *)[v9 initWithFormat:@"%@.%f.%f.%f", v11, *(void *)&a2, *(void *)&a1, *(void *)&a3];

  return v12;
}

void __71__MUICachingSVGConverter_imageForSVGData_size_scale_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  [*(id *)(a1 + 32) removeItemAtURL:*(void *)(a1 + 40) error:0];
  if (v6)
  {
    v3 = [*(id *)(a1 + 48) cache];
    [v3 setObject:v6 forKey:*(void *)(a1 + 56)];
  }
  uint64_t v4 = *(void *)(a1 + 64);
  v5 = [v6 UIImage];
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
}

- (NSCache)cache
{
  return self->_cache;
}

- (void).cxx_destruct
{
}

@end