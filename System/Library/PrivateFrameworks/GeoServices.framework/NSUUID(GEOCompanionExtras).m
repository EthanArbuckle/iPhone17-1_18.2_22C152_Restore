@interface NSUUID(GEOCompanionExtras)
+ (id)_maps_UUIDWithData:()GEOCompanionExtras;
- (id)_maps_data;
@end

@implementation NSUUID(GEOCompanionExtras)

+ (id)_maps_UUIDWithData:()GEOCompanionExtras
{
  v7[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    v7[0] = 0;
    v7[1] = 0;
    objc_msgSend(v3, "getBytes:length:", v7, objc_msgSend(v3, "length"));
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v7];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_maps_data
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  v3[1] = 0;
  [a1 getUUIDBytes:v3];
  v1 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v3 length:16];

  return v1;
}

@end