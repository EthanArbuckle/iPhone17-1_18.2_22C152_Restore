@interface QLLivePhotoItemTransformer
+ (id)allowedOutputClasses;
- (id)transformedContentsFromURL:(id)a3 context:(id)a4 error:(id *)a5;
@end

@implementation QLLivePhotoItemTransformer

+ (id)allowedOutputClasses
{
  v3 = (void *)MEMORY[0x263EFFA08];
  gotLoadHelper_x8__OBJC_CLASS___PHLivePhoto(v2);
  return (id)objc_msgSend(v3, "setWithObjects:", objc_opt_class(), 0);
}

- (id)transformedContentsFromURL:(id)a3 context:(id)a4 error:(id *)a5
{
  v39[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  gotLoadHelper_x8__OBJC_CLASS___PFVideoComplement(v7);
  v9 = (void *)[objc_alloc(*(Class *)(v8 + 4016)) initWithBundleAtURL:v6];
  uint64_t v10 = [v9 imagePath];
  v11 = (NSObject **)MEMORY[0x263F62940];
  if (v10
    && (v12 = (void *)v10,
        [v9 videoPath],
        v13 = objc_claimAutoreleasedReturnValue(),
        v13,
        v12,
        v13))
  {
    v14 = NSURL;
    v15 = [v9 imagePath];
    v16 = [v14 fileURLWithPath:v15];

    v17 = NSURL;
    v18 = [v9 videoPath];
    v19 = [v17 fileURLWithPath:v18];

    gotLoadHelper_x24__OBJC_CLASS___PHLivePhoto(v20);
    if ((objc_opt_respondsToSelector() & 1) != 0 && _os_feature_enabled_impl())
    {
      v21 = (void *)v18[458];
      v39[0] = v16;
      v39[1] = v19;
      v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:2];
      uint64_t v33 = 0;
      v23 = (id *)&v33;
      uint64_t v24 = [v21 livePhotoWithResourceFileURLs:v22 prefersHDR:1 error:&v33];
    }
    else
    {
      v30 = (void *)v18[458];
      v38[0] = v16;
      v38[1] = v19;
      v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:2];
      uint64_t v32 = 0;
      v23 = (id *)&v32;
      uint64_t v24 = [v30 livePhotoWithResourceFileURLs:v22 error:&v32];
    }
    id v27 = (id)v24;
    id v26 = *v23;

    if (!v26 && v27)
    {
      id v27 = v27;
      id v26 = 0;
      v29 = v27;
      goto LABEL_22;
    }
  }
  else
  {
    v25 = *v11;
    if (!*v11)
    {
      QLSInitLogging();
      v25 = *v11;
    }
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v35 = v6;
      _os_log_impl(&dword_217F61000, v25, OS_LOG_TYPE_INFO, "Could not generate a PFVideoComplement from the given url: %@ #PreviewItem", buf, 0xCu);
    }
    id v26 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.quicklook.QLLivePhotoItemTransformer" code:0 userInfo:0];
    v16 = 0;
    id v27 = 0;
    v19 = 0;
  }
  v28 = *v11;
  if (!*v11)
  {
    QLSInitLogging();
    v28 = *v11;
  }
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    id v35 = v6;
    __int16 v36 = 2112;
    id v37 = v26;
    _os_log_impl(&dword_217F61000, v28, OS_LOG_TYPE_ERROR, "Error creating PHLivePhoto for url(%@) error (%@) #PreviewItem", buf, 0x16u);
  }
  if (a5)
  {
    id v26 = v26;
    v29 = 0;
    *a5 = v26;
  }
  else
  {
    v29 = 0;
  }
LABEL_22:

  return v29;
}

@end