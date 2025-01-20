@interface MPStoreItemMovieClip
- (MPStoreArtworkRequestToken)previewArtworkRequestToken;
- (MPStoreItemMovieClip)initWithLookupDictionary:(id)a3;
- (NSArray)assets;
- (NSDictionary)lookupDictionary;
- (NSString)title;
@end

@implementation MPStoreItemMovieClip

- (void).cxx_destruct
{
}

- (NSDictionary)lookupDictionary
{
  return self->_lookupDictionary;
}

- (NSString)title
{
  v2 = [(NSDictionary *)self->_lookupDictionary objectForKey:@"title"];
  if (_NSIsNSString()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (NSString *)v3;
}

- (MPStoreArtworkRequestToken)previewArtworkRequestToken
{
  v2 = [(NSDictionary *)self->_lookupDictionary objectForKey:@"previewArtwork"];
  if (v2)
  {
    id v3 = +[MPStoreItemMetadata artworkRequestTokenForStorePlatformArtworkValue:v2];
  }
  else
  {
    id v3 = 0;
  }

  return (MPStoreArtworkRequestToken *)v3;
}

- (NSArray)assets
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [(NSDictionary *)self->_lookupDictionary objectForKey:@"clipAssets"];
  if (_NSIsNSArray())
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v3 = v2;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      v6 = 0;
      uint64_t v7 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v3);
          }
          uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          if (_NSIsNSDictionary())
          {
            v10 = [MPStoreItemMovieClipAsset alloc];
            v11 = -[MPStoreItemMovieClipAsset initWithLookupDictionary:](v10, "initWithLookupDictionary:", v9, (void)v13);
            if (v11)
            {
              if (!v6) {
                v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
              }
              [v6 addObject:v11];
            }
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v5);
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }

  return (NSArray *)v6;
}

- (MPStoreItemMovieClip)initWithLookupDictionary:(id)a3
{
  id v5 = a3;
  v6 = [(MPStoreItemMovieClip *)self init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_lookupDictionary, a3);
  }

  return v7;
}

@end