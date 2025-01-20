@interface NSDate(INJSONSerialization)
+ (id)_intents_decodeWithJSONDecoder:()INJSONSerialization codableDescription:from:;
- (id)_intents_encodeWithJSONEncoder:()INJSONSerialization codableDescription:;
@end

@implementation NSDate(INJSONSerialization)

- (id)_intents_encodeWithJSONEncoder:()INJSONSerialization codableDescription:
{
  v8[2] = *MEMORY[0x1E4F143B8];
  [a1 timeIntervalSince1970];
  uint64_t v2 = (uint64_t)((v1 - floor(v1)) * 1000000000.0);
  v7[0] = @"seconds";
  v3 = [NSNumber numberWithInteger:vcvtmd_s64_f64(v1)];
  v7[1] = @"nanos";
  v8[0] = v3;
  v4 = [NSNumber numberWithInteger:v2];
  v8[1] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

+ (id)_intents_decodeWithJSONDecoder:()INJSONSerialization codableDescription:from:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v11 = [v10 objectForKeyedSubscript:@"seconds"];
    uint64_t v12 = [v11 integerValue];

    v13 = [v10 objectForKeyedSubscript:@"nanos"];
    uint64_t v14 = [v13 integerValue];

    double v15 = (double)v12;
    if (v14 >= 1) {
      double v15 = (double)v14 / 1000000000.0 + v15;
    }
    v16 = [a1 dateWithTimeIntervalSince1970:v15];
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

@end