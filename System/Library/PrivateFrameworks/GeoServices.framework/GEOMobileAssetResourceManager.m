@interface GEOMobileAssetResourceManager
+ (GEOMobileAssetResourceManager)sharedManager;
- (void)fetchResourceOfType:(unint64_t)a3 extraParameters:(id)a4 options:(unint64_t)a5 result:(id)a6;
- (void)notifyResourceIsCorrupt:(id)a3;
- (void)updateNow;
@end

@implementation GEOMobileAssetResourceManager

- (void)fetchResourceOfType:(unint64_t)a3 extraParameters:(id)a4 options:(unint64_t)a5 result:(id)a6
{
  id v9 = a6;
  id v10 = a4;
  v11 = [[GEOMAResourceFetchRequest alloc] initWithTraits:0 auditToken:0 throttleToken:0];
  [(GEOMAResourceFetchRequest *)v11 setType:a3];
  [(GEOMAResourceFetchRequest *)v11 setExtras:v10];

  [(GEOMAResourceFetchRequest *)v11 setOptions:a5];
  qos_class_self();
  global_queue = (void *)geo_get_global_queue();
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __84__GEOMobileAssetResourceManager_fetchResourceOfType_extraParameters_options_result___block_invoke;
  v14[3] = &unk_1E53E3480;
  id v15 = v9;
  id v13 = v9;
  [(GEOXPCRequest *)v11 send:0 withReply:global_queue handler:v14];
}

+ (GEOMobileAssetResourceManager)sharedManager
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__GEOMobileAssetResourceManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB29FBE8 != -1) {
    dispatch_once(&qword_1EB29FBE8, block);
  }
  v2 = (void *)_MergedGlobals_240;

  return (GEOMobileAssetResourceManager *)v2;
}

void __84__GEOMobileAssetResourceManager_fetchResourceOfType_extraParameters_options_result___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  v6 = [v15 url];
  if (v6)
  {
    v7 = [v15 sandBoxToken];

    if (v7)
    {
      v8 = [GEOMobileAssetResource alloc];
      id v9 = [v15 url];
      id v10 = [v15 sandBoxToken];
      v6 = [(GEOMobileAssetResource *)v8 initWithURL:v9 sandboxExtensionData:v10];
    }
    else
    {
      v6 = 0;
    }
  }
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = [v15 error];
  id v13 = (void *)v12;
  if (v12) {
    id v14 = (id)v12;
  }
  else {
    id v14 = v5;
  }
  (*(void (**)(uint64_t, GEOMobileAssetResource *, id))(v11 + 16))(v11, v6, v14);
}

void __46__GEOMobileAssetResourceManager_sharedManager__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)_MergedGlobals_240;
  _MergedGlobals_240 = (uint64_t)v1;
}

- (void)updateNow
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = +[GEOXPCConnection createServerConnectionFor:21 debugIdentifier:@"MAResources" eventHandler:0];
  v4 = @"message";
  v5[0] = @"MAResources.update";
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  [v2 sendDictionarySync:v3];
}

- (void)notifyResourceIsCorrupt:(id)a3
{
  id v3 = a3;
  id v5 = [[GEOMAResourceReportCorrupt alloc] initWithTraits:0 auditToken:0 throttleToken:0];
  v4 = [v3 fileURL];

  [(GEOMAResourceReportCorrupt *)v5 setUrl:v4];
  [(GEOXPCRequest *)v5 send:0];
}

@end