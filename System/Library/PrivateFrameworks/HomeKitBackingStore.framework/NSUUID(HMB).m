@interface NSUUID(HMB)
+ (id)hmbDecodeQueryableParameter:()HMB;
+ (id)hmbDescriptionForEncodedQueryableVariable:()HMB;
+ (id)hmbUUIDFromData:()HMB;
+ (uint64_t)hmbEncodeQueryableParameter:()HMB;
- (id)data;
@end

@implementation NSUUID(HMB)

- (id)data
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  v3[1] = 0;
  [a1 getUUIDBytes:v3];
  v1 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v3 length:16];
  return v1;
}

+ (id)hmbUUIDFromData:()HMB
{
  id v3 = a3;
  if (v3)
  {
    v4 = v3;
    if ([v3 length] == 16) {
      v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F29128]), "initWithUUIDBytes:", objc_msgSend(v4, "bytes"));
    }
    else {
      v5 = 0;
    }

    return v5;
  }
  else
  {
    uint64_t v7 = _HMFPreconditionFailure();
    return (id)+[NSUUID(HMB) hmbDescriptionForEncodedQueryableVariable:](v7);
  }
}

+ (id)hmbDescriptionForEncodedQueryableVariable:()HMB
{
  id v3 = a3;
  if ([v3 length] == 16)
  {
    v4 = [MEMORY[0x1E4F29128] hmbUUIDFromData:v3];

    [v4 UUIDString];
  }
  else
  {
    v5 = NSString;
    v4 = [v3 hmbDescription];

    [v5 stringWithFormat:@"<MALFORMED UUID: %@>", v4];
  v6 = };

  return v6;
}

+ (id)hmbDecodeQueryableParameter:()HMB
{
  v0 = objc_msgSend(MEMORY[0x1E4F29128], "hmbUUIDFromData:");
  v1 = v0;
  if (v0) {
    id v2 = v0;
  }

  return v1;
}

+ (uint64_t)hmbEncodeQueryableParameter:()HMB
{
  return [a3 data];
}

@end