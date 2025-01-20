@interface NSTimeZone(NSTimeZone)
+ (uint64_t)supportsSecureCoding;
- (uint64_t)classForCoder;
- (uint64_t)encodeWithCoder:()NSTimeZone;
- (uint64_t)initWithCoder:()NSTimeZone;
@end

@implementation NSTimeZone(NSTimeZone)

- (uint64_t)initWithCoder:()NSTimeZone
{
  v13[1] = *(id *)MEMORY[0x1E4F143B8];
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {
    if ([a3 versionForClassName:@"NSTimeZone"])
    {
      v12 = 0;
      v13[0] = 0;
      [a3 decodeValueOfObjCType:"@" at:v13 size:8];
      [a3 decodeValueOfObjCType:"@" at:&v12 size:8];
      if (_NSIsNSString())
      {
        if (!v12)
        {
          v8 = 0;
          goto LABEL_18;
        }
        if (_NSIsNSData())
        {
          v8 = v12;
LABEL_18:
          uint64_t v10 = [a1 initWithName:v13[0] data:v8];

          id v11 = v12;
LABEL_21:

          return v10;
        }
      }
    }
    else
    {
      v13[0] = 0;
      [a3 decodeValueOfObjCType:"@" at:v13 size:8];
      if (_NSIsNSString())
      {
        id v9 = (id)[(id)objc_opt_class() timeZoneWithAbbreviation:v13[0]];
        if (v9)
        {
          uint64_t v10 = (uint64_t)v9;
        }
        else
        {
          uint64_t v10 = [a1 initWithName:v13[0]];
        }
        id v11 = v13[0];
        goto LABEL_21;
      }
    }
LABEL_16:
    objc_msgSend(a3, "failWithError:", +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"NSCocoaErrorDomain", 4864, 0));

    return 0;
  }
  uint64_t v5 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NS.name"];
  uint64_t v6 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NS.data"];
  if (!_NSIsNSString() || v6 && (_NSIsNSData() & 1) == 0) {
    goto LABEL_16;
  }

  return [a1 initWithName:v5 data:v6];
}

+ (uint64_t)supportsSecureCoding
{
  return 1;
}

- (uint64_t)encodeWithCoder:()NSTimeZone
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if ([a3 allowsKeyedCoding])
  {
    objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(a1, "name"), @"NS.name");
    uint64_t v5 = [a1 data];
    return [a3 encodeObject:v5 forKey:@"NS.data"];
  }
  else
  {
    v7[0] = [a1 name];
    return [a3 encodeValueOfObjCType:"@" at:v7];
  }
}

- (uint64_t)classForCoder
{
  return self;
}

@end