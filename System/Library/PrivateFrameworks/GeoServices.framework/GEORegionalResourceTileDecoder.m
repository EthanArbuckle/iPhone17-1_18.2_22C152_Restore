@interface GEORegionalResourceTileDecoder
- (BOOL)canDecodeTile:(uint64_t)a3 quickly:(unsigned char *)a4;
- (GEORegionalResourceTileData)decodeTile:(void *)a3 forKey:;
@end

@implementation GEORegionalResourceTileDecoder

- (GEORegionalResourceTileData)decodeTile:(void *)a3 forKey:
{
  id v3 = a3;
  v4 = [[GEORegionalResourceTileData alloc] initWithData:v3];

  return v4;
}

- (BOOL)canDecodeTile:(uint64_t)a3 quickly:(unsigned char *)a4
{
  BOOL result = 0;
  *a4 = 0;
  if ((*(unsigned char *)a3 & 0x7F) == 8) {
    return (*(void *)(a3 + 1) & 0x3E0000000000) == 0;
  }
  return result;
}

@end