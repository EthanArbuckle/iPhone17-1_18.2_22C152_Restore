@interface GEOResourceManager
+ (id)sharedManager;
+ (id)sharedManagerForConfiguration:(id)a3;
- (BOOL)isDevResourceWithName:(id)a3 fallbackBundle:(id)a4 fallbackNameHandler:(id)a5;
- (GEOResourceManager)initWithConfiguration:(id)a3;
- (id)allResourceNames;
- (id)dataForResourceWithName:(id)a3 fallbackBundle:(id)a4;
- (id)dataForResourceWithName:(id)a3 fallbackBundle:(id)a4 fallbackNameHandler:(id)a5;
- (id)pathForResourceWithName:(id)a3 fallbackBundle:(id)a4;
- (id)pathForResourceWithName:(id)a3 fallbackBundle:(id)a4 fallbackNameHandler:(id)a5;
- (void)dataForSignedResourceWithName:(id)a3 fallbackBundle:(id)a4 fallbackNameHandler:(id)a5 resultHandler:(id)a6;
@end

@implementation GEOResourceManager

- (id)pathForResourceWithName:(id)a3 fallbackBundle:(id)a4 fallbackNameHandler:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, id))a5;
  v11 = +[GEOResourceManifestManager modernManagerForConfiguration:self->_configuration];
  v12 = [v11 pathForResourceWithName:v8];

  v13 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v14 = [v13 fileExistsAtPath:v12];

  if ((v14 & 1) == 0)
  {
    if (v9)
    {
      v15 = GEOGetResourceManifestLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v23 = 138412290;
        id v24 = v8;
        _os_log_impl(&dword_188D96000, v15, OS_LOG_TYPE_DEFAULT, "Did not find downloaded resource \"%@\", trying fallback", (uint8_t *)&v23, 0xCu);
      }

      if (v10)
      {
        v10[2](v10, v8);
        id v16 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v16 = v8;
      }
      v17 = v16;
      v18 = [v16 stringByDeletingPathExtension];
      v19 = [v17 pathExtension];
      uint64_t v20 = [v9 pathForResource:v18 ofType:v19];

      v12 = (void *)v20;
    }
    else
    {

      v12 = 0;
    }
  }
  if (![v12 length])
  {
    v21 = GEOGetResourceManifestLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      int v23 = 138412290;
      id v24 = v8;
      _os_log_impl(&dword_188D96000, v21, OS_LOG_TYPE_ERROR, "Failed to locate resource \"%@\"", (uint8_t *)&v23, 0xCu);
    }
  }

  return v12;
}

- (void)dataForSignedResourceWithName:(id)a3 fallbackBundle:(id)a4 fallbackNameHandler:(id)a5 resultHandler:(id)a6
{
  id v10 = a6;
  if (v10)
  {
    id v11 = v10;
    v12 = [(GEOResourceManager *)self pathForResourceWithName:a3 fallbackBundle:a4 fallbackNameHandler:a5];
    if (v12)
    {
      v13 = (void *)[v11 copy];

      qos_class_self();
      global_queue = geo_get_global_queue();
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __101__GEOResourceManager_dataForSignedResourceWithName_fallbackBundle_fallbackNameHandler_resultHandler___block_invoke;
      v16[3] = &unk_1E53D7ED0;
      id v17 = v12;
      id v11 = v13;
      id v18 = v11;
      dispatch_async(global_queue, v16);
    }
    else
    {
      v15 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:260 userInfo:0];
      (*((void (**)(id, void, void *))v11 + 2))(v11, 0, v15);
    }
  }
}

- (id)dataForResourceWithName:(id)a3 fallbackBundle:(id)a4
{
  return [(GEOResourceManager *)self dataForResourceWithName:a3 fallbackBundle:a4 fallbackNameHandler:0];
}

- (BOOL)isDevResourceWithName:(id)a3 fallbackBundle:(id)a4 fallbackNameHandler:(id)a5
{
  v5 = [(GEOResourceManager *)self pathForResourceWithName:a3 fallbackBundle:a4 fallbackNameHandler:a5];
  v6 = GEOResourceDevResourcesPath();
  char v7 = [v5 hasPrefix:v6];

  return v7;
}

- (id)dataForResourceWithName:(id)a3 fallbackBundle:(id)a4 fallbackNameHandler:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v5 = [(GEOResourceManager *)self pathForResourceWithName:a3 fallbackBundle:a4 fallbackNameHandler:a5];
  if (v5)
  {
    id v11 = 0;
    v6 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v5 options:0 error:&v11];
    id v7 = v11;
    if ([v6 length]) {
      BOOL v8 = v7 == 0;
    }
    else {
      BOOL v8 = 0;
    }
    if (!v8)
    {
      id v9 = GEOGetResourceManifestLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v13 = v5;
        __int16 v14 = 2112;
        id v15 = v7;
        _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_ERROR, "Failed to read resource at \"%@\": %@", buf, 0x16u);
      }
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __35__GEOResourceManager_sharedManager__block_invoke()
{
  v0 = [[GEOResourceManager alloc] initWithConfiguration:0];
  v1 = (void *)qword_1EB29FA60;
  qword_1EB29FA60 = (uint64_t)v0;
}

- (GEOResourceManager)initWithConfiguration:(id)a3
{
  v4 = (GEOResourceManifestConfiguration *)a3;
  v8.receiver = self;
  v8.super_class = (Class)GEOResourceManager;
  v5 = [(GEOResourceManager *)&v8 init];
  if (v5)
  {
    if (!v4) {
      v4 = objc_alloc_init(GEOResourceManifestConfiguration);
    }
    objc_storeStrong((id *)&v5->_configuration, v4);
    v6 = v5;
  }

  return v5;
}

+ (id)sharedManager
{
  if (qword_1EB29FA68 != -1) {
    dispatch_once(&qword_1EB29FA68, &__block_literal_global_80);
  }
  v2 = (void *)qword_1EB29FA60;

  return v2;
}

- (id)pathForResourceWithName:(id)a3 fallbackBundle:(id)a4
{
  return [(GEOResourceManager *)self pathForResourceWithName:a3 fallbackBundle:a4 fallbackNameHandler:0];
}

- (id)allResourceNames
{
  v2 = +[GEOResourceManifestManager modernManagerForConfiguration:self->_configuration];
  v3 = [v2 allResourceNames];

  return v3;
}

void __101__GEOResourceManager_dataForSignedResourceWithName_fallbackBundle_fallbackNameHandler_resultHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v5 = 0;
  v3 = +[GEOSignedResource loadResourceAtPath:v2 error:&v5];
  id v4 = v5;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (id)sharedManagerForConfiguration:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (qword_1EB29FA78 != -1) {
      dispatch_once(&qword_1EB29FA78, &__block_literal_global_4_1);
    }
    os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_233);
    id v5 = [(id)qword_1EB29FA70 objectForKey:v4];
    if (!v5)
    {
      id v5 = [[GEOResourceManager alloc] initWithConfiguration:v4];
      [(id)qword_1EB29FA70 setObject:v5 forKey:v4];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_233);
  }
  else
  {
    id v5 = [a1 sharedManager];
  }

  return v5;
}

void __52__GEOResourceManager_sharedManagerForConfiguration___block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:512 valueOptions:512 capacity:5];
  v1 = (void *)qword_1EB29FA70;
  qword_1EB29FA70 = v0;
}

- (void).cxx_destruct
{
}

@end