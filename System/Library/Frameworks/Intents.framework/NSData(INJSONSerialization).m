@interface NSData(INJSONSerialization)
+ (id)_intents_decodeWithJSONDecoder:()INJSONSerialization codableDescription:from:;
- (uint64_t)_intents_encodeWithJSONEncoder:()INJSONSerialization codableDescription:;
@end

@implementation NSData(INJSONSerialization)

- (uint64_t)_intents_encodeWithJSONEncoder:()INJSONSerialization codableDescription:
{
  return [a1 base64EncodedStringWithOptions:0];
}

+ (id)_intents_decodeWithJSONDecoder:()INJSONSerialization codableDescription:from:
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v9 options:0];
  }
  else {
    v10 = 0;
  }

  return v10;
}

@end