@interface NSNumber(HMB)
+ (id)hmbDecodeQueryableParameter:()HMB;
+ (id)hmbDescriptionForEncodedQueryableVariable:()HMB;
+ (id)hmbEncodeQueryableParameter:()HMB;
@end

@implementation NSNumber(HMB)

+ (id)hmbDescriptionForEncodedQueryableVariable:()HMB
{
  id v3 = a3;
  if ([v3 length] == 8)
  {
    id v4 = v3;
    v5 = (unint64_t *)[v4 bytes];

    v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:bswap64(*v5)];
    [v6 description];
  }
  else
  {
    v7 = NSString;
    v6 = [v3 hmbDescription];

    [v7 stringWithFormat:@"<MALFORMED NUMBER: %@>", v6];
  v8 = };

  return v8;
}

+ (id)hmbDecodeQueryableParameter:()HMB
{
  id v3 = a3;
  if ([v3 length] == 8)
  {
    id v4 = (unint64_t *)[v3 bytes];
    v5 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:bswap64(*v4)];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)hmbEncodeQueryableParameter:()HMB
{
  id v3 = a3;
  if ([v3 integerValue] < 0)
  {

    id v3 = &unk_1F2C4CAE0;
  }
  unint64_t v6 = bswap64([v3 unsignedIntegerValue]);
  id v4 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v6 length:8];

  return v4;
}

@end