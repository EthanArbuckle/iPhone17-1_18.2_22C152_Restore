@interface NSDecimalNumber(INJSONSerialization)
+ (id)_intents_decodeWithJSONDecoder:()INJSONSerialization codableDescription:from:;
@end

@implementation NSDecimalNumber(INJSONSerialization)

+ (id)_intents_decodeWithJSONDecoder:()INJSONSerialization codableDescription:from:
{
  id v5 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [MEMORY[0x1E4F28C28] decimalNumberWithString:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end