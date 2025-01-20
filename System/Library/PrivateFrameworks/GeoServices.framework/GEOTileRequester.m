@interface GEOTileRequester
+ (BOOL)requiresNetwork;
+ (unsigned)tileProviderIdentifier;
- (GEOResourceManifestManager)resourceManifestManager;
- (GEOTileRequest)tileRequest;
- (GEOTileRequester)init;
- (GEOTileRequester)initWithTileRequest:(id)a3 delegateQueue:(id)a4 delegate:(id)a5;
- (GEOTileRequesterDelegate)delegate;
- (NSString)deviceCountry;
- (NSString)deviceRegion;
- (OS_dispatch_queue)delegateQueue;
- (id)context;
- (uint64_t)activeTileSetForKey:;
- (uint64_t)tileSetForKey:(unsigned char *)a3;
- (void)setContext:(id)a3;
- (void)setDeviceCountry:(id)a3;
- (void)setDeviceRegion:(id)a3;
- (void)tearDown;
@end

@implementation GEOTileRequester

- (id)context
{
  return self->_context;
}

- (NSString)deviceRegion
{
  return self->_deviceRegion;
}

- (NSString)deviceCountry
{
  return self->_deviceCountry;
}

- (void)setDeviceRegion:(id)a3
{
}

- (void)setDeviceCountry:(id)a3
{
}

+ (BOOL)requiresNetwork
{
  return 1;
}

- (GEOTileRequest)tileRequest
{
  return self->_tileRequest;
}

- (GEOTileRequesterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GEOTileRequesterDelegate *)WeakRetained;
}

- (GEOResourceManifestManager)resourceManifestManager
{
  v2 = [(GEOTileRequester *)self tileRequest];
  v3 = [v2 manifestConfiguration];
  v4 = +[GEOResourceManifestManager modernManagerForConfiguration:v3];

  return (GEOResourceManifestManager *)v4;
}

- (uint64_t)tileSetForKey:(unsigned char *)a3
{
  return *a3 & 0x7F;
}

- (uint64_t)activeTileSetForKey:
{
  return 0;
}

- (void)setContext:(id)a3
{
}

- (void)tearDown
{
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__GEOTileRequester_tearDown__block_invoke;
  block[3] = &unk_1E53D79D8;
  block[4] = self;
  dispatch_async(delegateQueue, block);
}

- (GEOTileRequester)init
{
  result = (GEOTileRequester *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

id __28__GEOTileRequester_tearDown__block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(void *)(a1 + 32) + 16), 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceRegion, 0);
  objc_storeStrong((id *)&self->_deviceCountry, 0);
  objc_storeStrong((id *)&self->_thread, 0);
  objc_storeStrong(&self->_context, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_tileRequest, 0);
}

- (GEOTileRequester)initWithTileRequest:(id)a3 delegateQueue:(id)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)GEOTileRequester;
  v12 = [(GEOTileRequester *)&v20 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_tileRequest, a3);
    objc_storeWeak((id *)&v13->_delegate, v11);
    objc_storeStrong((id *)&v13->_delegateQueue, a4);
    v14 = +[GEOCountryConfiguration sharedConfiguration];
    uint64_t v15 = [v14 countryCode];
    deviceCountry = v13->_deviceCountry;
    v13->_deviceCountry = (NSString *)v15;

    uint64_t v17 = _postureRegion(0);
    deviceRegion = v13->_deviceRegion;
    v13->_deviceRegion = (NSString *)v17;
  }
  return v13;
}

+ (unsigned)tileProviderIdentifier
{
  return 1;
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

@end