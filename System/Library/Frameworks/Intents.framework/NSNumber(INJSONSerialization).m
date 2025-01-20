@interface NSNumber(INJSONSerialization)
+ (id)_intents_decodeWithJSONDecoder:()INJSONSerialization codableDescription:from:;
@end

@implementation NSNumber(INJSONSerialization)

+ (id)_intents_decodeWithJSONDecoder:()INJSONSerialization codableDescription:from:
{
  id v5 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  return v7;
}

@end