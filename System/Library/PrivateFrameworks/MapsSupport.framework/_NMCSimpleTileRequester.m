@interface _NMCSimpleTileRequester
- (_NMCSimpleTileRequester)initWithTileRequest:(id)a3 forOriginalRequests:(id)a4 delegateQueue:(id)a5 delegate:(id)a6;
- (id)checksumMethodForIncomingTileDataWithKey:(uint64_t)a1;
- (id)localizationURLForTileKey:(uint64_t)a1;
- (id)urlForTileKey:(uint64_t)a1;
- (uint64_t)tileSetForKey:(uint64_t)a3;
- (uint64_t)useProxyAuthForTileKey:;
@end

@implementation _NMCSimpleTileRequester

- (_NMCSimpleTileRequester)initWithTileRequest:(id)a3 forOriginalRequests:(id)a4 delegateQueue:(id)a5 delegate:(id)a6
{
  id v11 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_NMCSimpleTileRequester;
  v12 = [(_NMCSimpleTileRequester *)&v16 initWithTileRequest:a3 delegateQueue:a5 delegate:a6];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_requests, a4);
    v14 = v13;
  }

  return v13;
}

- (uint64_t)useProxyAuthForTileKey:
{
  return 0;
}

- (id)urlForTileKey:(uint64_t)a1
{
  v1 = objc_msgSend(*(id *)(a1 + 144), "objectForKey:");
  v2 = v1;
  if (v1)
  {
    v3 = [v1 baseURL];
    v4 = +[NSURL URLWithString:v3];

    if (v4)
    {
      id v5 = objc_alloc((Class)GEOURLWithHeaders);
      v6 = [v2 baseHeaders];
      v7 = sub_10000B858(v6);
      id v8 = [v5 initWithURL:v4 headerFields:v7];
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)localizationURLForTileKey:(uint64_t)a1
{
  v1 = objc_msgSend(*(id *)(a1 + 144), "objectForKey:");
  v2 = v1;
  if (v1 && [v1 hasLocalizationURL])
  {
    v3 = [v2 localizationURL];
    v4 = +[NSURL URLWithString:v3];

    if (v4)
    {
      id v5 = objc_alloc((Class)GEOURLWithHeaders);
      v6 = [v2 localizationHeaders];
      v7 = sub_10000B858(v6);
      id v8 = [v5 initWithURL:v4 headerFields:v7];
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)checksumMethodForIncomingTileDataWithKey:(uint64_t)a1
{
  v1 = objc_msgSend(*(id *)(a1 + 144), "objectForKey:");
  v2 = v1;
  if (v1) {
    id v3 = [v1 checksumMethod];
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (uint64_t)tileSetForKey:(uint64_t)a3
{
  return ((*(unsigned __int16 *)(a3 + 13) << 6) | (*(unsigned __int8 *)(a3 + 15) << 22)) & 0x3FFFFF00 | 1u;
}

- (void).cxx_destruct
{
}

@end