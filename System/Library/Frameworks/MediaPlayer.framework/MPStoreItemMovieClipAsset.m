@interface MPStoreItemMovieClipAsset
- (MPStoreItemMovieClipAsset)initWithLookupDictionary:(id)a3;
- (NSDictionary)lookupDictionary;
- (NSString)flavor;
- (NSURL)hlsURL;
- (NSURL)url;
- (double)duration;
@end

@implementation MPStoreItemMovieClipAsset

- (void).cxx_destruct
{
}

- (NSDictionary)lookupDictionary
{
  return self->_lookupDictionary;
}

- (NSURL)url
{
  v2 = [(NSDictionary *)self->_lookupDictionary objectForKey:@"url"];
  if (_NSIsNSString())
  {
    v3 = [MEMORY[0x1E4F1CB10] URLWithString:v2];
  }
  else
  {
    v3 = 0;
  }

  return (NSURL *)v3;
}

- (NSURL)hlsURL
{
  v2 = [(NSDictionary *)self->_lookupDictionary objectForKey:@"hlsUrl"];
  if (_NSIsNSString())
  {
    v3 = [MEMORY[0x1E4F1CB10] URLWithString:v2];
  }
  else
  {
    v3 = 0;
  }

  return (NSURL *)v3;
}

- (NSString)flavor
{
  v2 = [(NSDictionary *)self->_lookupDictionary objectForKey:@"flavor"];
  if (_NSIsNSString()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (NSString *)v3;
}

- (double)duration
{
  v2 = [(NSDictionary *)self->_lookupDictionary objectForKey:@"duration"];
  double v3 = 0.0;
  if (objc_opt_respondsToSelector())
  {
    [v2 doubleValue];
    double v3 = v4;
  }

  return v3;
}

- (MPStoreItemMovieClipAsset)initWithLookupDictionary:(id)a3
{
  id v5 = a3;
  v6 = [(MPStoreItemMovieClipAsset *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_lookupDictionary, a3);
  }

  return v7;
}

@end