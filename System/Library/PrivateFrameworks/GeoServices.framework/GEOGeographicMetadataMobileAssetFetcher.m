@interface GEOGeographicMetadataMobileAssetFetcher
- (id)initForType:(unint64_t)a3 parameters:(id)a4;
- (void)fetchMetadataForLocation:(id)a3 responseQueue:(id)a4 block:(id)a5;
- (void)reportCorrupt:(id)a3;
@end

@implementation GEOGeographicMetadataMobileAssetFetcher

- (id)initForType:(unint64_t)a3 parameters:(id)a4
{
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)GEOGeographicMetadataMobileAssetFetcher;
  v7 = [(GEOGeographicMetadataMobileAssetFetcher *)&v13 init];
  v8 = v7;
  if (v7)
  {
    v7->_type = a3;
    uint64_t v9 = [v6 copy];
    parameters = v8->_parameters;
    v8->_parameters = (NSDictionary *)v9;

    v11 = v8;
  }

  return v8;
}

- (void)fetchMetadataForLocation:(id)a3 responseQueue:(id)a4 block:(id)a5
{
  id v6 = a5;
  v7 = +[GEOMobileAssetResourceManager sharedManager];
  unint64_t type = self->_type;
  parameters = self->_parameters;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __88__GEOGeographicMetadataMobileAssetFetcher_fetchMetadataForLocation_responseQueue_block___block_invoke;
  v11[3] = &unk_1E53ECE78;
  v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  [v7 fetchResourceOfType:type extraParameters:parameters options:0 result:v11];
}

void __88__GEOGeographicMetadataMobileAssetFetcher_fetchMetadataForLocation_responseQueue_block___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  v8 = [v6 fileURL];
  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), a2);
    uint64_t v9 = *(void *)(a1 + 40);
    v11 = &unk_1ED73E230;
    v12[0] = v8;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    (*(void (**)(uint64_t, void *, void))(v9 + 16))(v9, v10, 0);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong(&self->_responseBlock, 0);

  objc_storeStrong((id *)&self->_parameters, 0);
}

- (void)reportCorrupt:(id)a3
{
  id v4 = +[GEOMobileAssetResourceManager sharedManager];
  [v4 notifyResourceIsCorrupt:self->_result];
}

@end