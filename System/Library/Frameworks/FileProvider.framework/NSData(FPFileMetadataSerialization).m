@interface NSData(FPFileMetadataSerialization)
+ (id)fp_dataWithFavoriteRank:()FPFileMetadataSerialization;
+ (id)fp_dataWithLastUsedDate:()FPFileMetadataSerialization;
- (id)fp_favoriteRank;
- (id)fp_lastUsedDate;
@end

@implementation NSData(FPFileMetadataSerialization)

+ (id)fp_dataWithLastUsedDate:()FPFileMetadataSerialization
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v7[0] = 0;
  v7[1] = 0;
  [a3 timeIntervalSince1970];
  v6[0] = (uint64_t)v3;
  v6[1] = 0;
  if ((fpfs_serialize_last_use_date(v6, (UInt8 *)v7, 0x10uLL, 1) & 0x80000000) != 0)
  {
    v4 = 0;
  }
  else
  {
    v4 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v7 length:16];
  }

  return v4;
}

- (id)fp_lastUsedDate
{
  v4[0] = 0;
  v4[1] = 0;
  id v1 = a1;
  if ((fpfs_deserialize_last_use_date(v4, (const UInt8 *)[v1 bytes], objc_msgSend(v1, "length"), 1) & 0x80000000) != 0)
  {
    v2 = 0;
  }
  else
  {
    v2 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)v4[0]];
  }

  return v2;
}

+ (id)fp_dataWithFavoriteRank:()FPFileMetadataSerialization
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = fpfs_serialize_favorite_rank(objc_msgSend(a3, "unsignedLongLongValue", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         (UInt8 *)&v6,
         0x80uLL);
  if (v3 < 1)
  {
    v4 = 0;
  }
  else
  {
    v4 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v6 length:v3];
  }

  return v4;
}

- (id)fp_favoriteRank
{
  uint64_t v5 = 0;
  id v1 = a1;
  int v2 = fpfs_deserialize_favorite_rank(&v5, (const UInt8 *)[v1 bytes], objc_msgSend(v1, "length"));
  int v3 = 0;
  if ((v2 & 0x80000000) == 0 && v5)
  {
    int v3 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
  }

  return v3;
}

@end