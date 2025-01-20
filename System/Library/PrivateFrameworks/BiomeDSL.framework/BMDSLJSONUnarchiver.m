@interface BMDSLJSONUnarchiver
+ (id)unarchiveDSLFromData:(id)a3;
+ (id)unarchiveDSLFromString:(id)a3;
+ (id)unarchiveObjectFromData:(id)a3;
+ (id)unarchiveObjectFromString:(id)a3;
@end

@implementation BMDSLJSONUnarchiver

+ (id)unarchiveDSLFromString:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_class();
  v5 = [v3 dataUsingEncoding:4];

  v6 = [v4 unarchiveDSLFromData:v5];

  return v6;
}

+ (id)unarchiveDSLFromData:(id)a3
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() unarchiveObjectFromData:v3];

  v5 = [v4 objectForKeyedSubscript:@"dsl"];

  return v5;
}

+ (id)unarchiveObjectFromString:(id)a3
{
  v4 = [a3 dataUsingEncoding:4];
  v5 = [a1 unarchiveObjectFromData:v4];

  return v5;
}

+ (id)unarchiveObjectFromData:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(BMDSLJSONCoder);
  v5 = [(BMDSLJSONCoder *)v4 decodeRootObjectFromData:v3];

  return v5;
}

@end