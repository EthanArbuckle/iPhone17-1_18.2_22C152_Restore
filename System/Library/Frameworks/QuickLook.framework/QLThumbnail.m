@interface QLThumbnail
+ (id)defaultDescriptors;
+ (id)sharedQueue;
- (BOOL)provideImages:(id)a3 error:(id *)a4;
- (NSURL)url;
- (QLThumbnail)initWithURL:(id)a3;
- (id)imageForUseMode:(unint64_t)a3 descriptor:(id)a4 generateIfNeeded:(BOOL)a5 contentRect:(CGRect *)a6 error:(id *)a7;
- (id)thumbnailCreationOperationForUseMode:(unint64_t)a3 descriptor:(id)a4;
- (id)thumbnailCreationOperationForUseMode:(unint64_t)a3 descriptor:(id)a4 generateIfNeeded:(BOOL)a5;
- (void)setUrl:(id)a3;
@end

@implementation QLThumbnail

- (QLThumbnail)initWithURL:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)QLThumbnail;
  v5 = [(QLThumbnail *)&v8 init];
  v6 = v5;
  if (v5) {
    [(QLThumbnail *)v5 setUrl:v4];
  }

  return v6;
}

- (id)thumbnailCreationOperationForUseMode:(unint64_t)a3 descriptor:(id)a4 generateIfNeeded:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  v9 = objc_alloc_init(QLThumbnailCreationOperation);
  [(QLThumbnailCreationOperation *)v9 setUseMode:a3];
  [v8 size];
  double v11 = v10;
  [v8 size];
  if (v11 >= v12) {
    double v13 = v11;
  }
  else {
    double v13 = v12;
  }
  [(QLThumbnailCreationOperation *)v9 setMaximumDimension:v13];
  [v8 scaleFactor];
  double v15 = v14;

  [(QLThumbnailCreationOperation *)v9 setScaleFactor:v15];
  v16 = [(QLThumbnail *)self url];
  [(QLThumbnailCreationOperation *)v9 setDocumentURL:v16];

  [(QLThumbnailCreationOperation *)v9 setGenerateIfNeeded:v5];

  return v9;
}

- (id)thumbnailCreationOperationForUseMode:(unint64_t)a3 descriptor:(id)a4
{
  return [(QLThumbnail *)self thumbnailCreationOperationForUseMode:a3 descriptor:a4 generateIfNeeded:0];
}

+ (id)sharedQueue
{
  if (sharedQueue_once != -1) {
    dispatch_once(&sharedQueue_once, &__block_literal_global_104);
  }
  v2 = (void *)sharedQueue_queue;

  return v2;
}

uint64_t __26__QLThumbnail_sharedQueue__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08A48]);
  v1 = (void *)sharedQueue_queue;
  sharedQueue_queue = (uint64_t)v0;

  [(id)sharedQueue_queue setName:@"QLThumbnail"];
  v2 = (void *)sharedQueue_queue;

  return [v2 setMaxConcurrentOperationCount:4];
}

+ (id)defaultDescriptors
{
  v5[1] = *MEMORY[0x263EF8340];
  v2 = +[QLThumbnailDescriptor descriptorWithSize:scaleFactor:](QLThumbnailDescriptor, "descriptorWithSize:scaleFactor:", 225.0, 225.0, 1.0);
  v5[0] = v2;
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];

  return v3;
}

- (id)imageForUseMode:(unint64_t)a3 descriptor:(id)a4 generateIfNeeded:(BOOL)a5 contentRect:(CGRect *)a6 error:(id *)a7
{
  v9 = [(QLThumbnail *)self thumbnailCreationOperationForUseMode:a3 descriptor:a4 generateIfNeeded:a5];
  double v10 = [(id)objc_opt_class() sharedQueue];
  [v10 addOperation:v9];
  [v9 waitUntilFinished];
  if (a6)
  {
    [v9 contentRect];
    a6->origin.x = v11;
    a6->origin.y = v12;
    a6->size.width = v13;
    a6->size.height = v14;
  }
  if (a7)
  {
    *a7 = [v9 error];
  }
  double v15 = [v9 image];

  return v15;
}

- (BOOL)provideImages:(id)a3 error:(id *)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  v6 = (void (**)(id, void *))a3;
  v7 = [(id)objc_opt_class() defaultDescriptors];
  id v8 = v6[2](v6, v7);

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    CGFloat v12 = 0;
    uint64_t v13 = *(void *)v35;
    double v14 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v35 != v13) {
          objc_enumerationMutation(v9);
        }
        v16 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        objc_msgSend(v16, "size", (void)v34);
        double v18 = v17;
        [v16 size];
        if (v18 < v19) {
          double v18 = v19;
        }
        if (v18 > v14)
        {
          id v20 = v16;

          double v14 = v18;
          CGFloat v12 = v20;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v11);
  }
  else
  {
    CGFloat v12 = 0;
  }

  v21 = (void *)MEMORY[0x263F160C0];
  id v22 = v12;
  uint64_t v23 = [v22 CGImage];
  v24 = [(QLThumbnail *)self url];
  char v25 = [v21 associateImage:v23 metadata:0 automaticallyGenerated:0 withURL:v24 error:a4];

  v26 = (NSObject **)MEMORY[0x263F62940];
  v27 = *MEMORY[0x263F62940];
  if (v25)
  {
    if (!v27)
    {
      QLSInitLogging();
      v27 = *v26;
    }
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      url = self->_url;
      *(_DWORD *)buf = 138412290;
      v39 = url;
      v29 = "Saved thumbnail in additions for %@ #Thumbnail";
      v30 = v27;
      os_log_type_t v31 = OS_LOG_TYPE_DEFAULT;
LABEL_26:
      _os_log_impl(&dword_217F61000, v30, v31, v29, buf, 0xCu);
    }
  }
  else
  {
    if (!v27)
    {
      QLSInitLogging();
      v27 = *v26;
    }
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      if (a4) {
        v32 = (NSURL *)*a4;
      }
      else {
        v32 = 0;
      }
      *(_DWORD *)buf = 138412290;
      v39 = v32;
      v29 = "Could not save thumbnail in additions: %@ #Thumbnail";
      v30 = v27;
      os_log_type_t v31 = OS_LOG_TYPE_ERROR;
      goto LABEL_26;
    }
  }

  return v25;
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (void)setUrl:(id)a3
{
}

- (void).cxx_destruct
{
}

@end