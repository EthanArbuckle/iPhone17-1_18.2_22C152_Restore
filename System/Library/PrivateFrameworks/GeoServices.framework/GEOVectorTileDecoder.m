@interface GEOVectorTileDecoder
- (GEOVectorTile)decodeTile:(void *)a3 forKey:(uint64_t)a4;
- (uint64_t)canDecodeTile:(uint64_t)a3 quickly:(unsigned char *)a4;
@end

@implementation GEOVectorTileDecoder

- (GEOVectorTile)decodeTile:(void *)a3 forKey:(uint64_t)a4
{
  id v9 = 0;
  id v10 = 0;
  GEOTileUnpackageBaseAndLocalization(a3, &v10, &v9);
  id v5 = v10;
  id v6 = v9;
  v7 = [[GEOVectorTile alloc] initWithVMP4:v5 localizationData:v6 tileKey:a4];

  return v7;
}

- (uint64_t)canDecodeTile:(uint64_t)a3 quickly:(unsigned char *)a4
{
  *a4 = 0;
  unsigned int v8 = 0;
  int v4 = GEOTileKeyStyle(a3, &v8);
  uint64_t result = 0;
  if (v4)
  {
    uint64_t result = 1;
    if ((v8 > 0x3E || ((1 << v8) & 0x40618020401C2802) == 0)
      && (v8 - 68 > 0x13 || ((1 << (v8 - 68)) & 0x80023) == 0))
    {
      return 0;
    }
  }
  return result;
}

@end