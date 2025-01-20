@interface UIImage(JSONSerializable)
+ (id)imageWithJSONObjectRepresentation:()JSONSerializable bundle:;
+ (uint64_t)_numberForRenderingMode:()JSONSerializable;
+ (uint64_t)_renderingModeForNumber:()JSONSerializable;
- (id)JSONObjectRepresentationWritingResourcesToBundlePath:()JSONSerializable;
@end

@implementation UIImage(JSONSerializable)

+ (id)imageWithJSONObjectRepresentation:()JSONSerializable bundle:
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x263EFF940] raise:@"CLKComplicationBundleException", @"must be a dictionary. Invalid value: %@", v5 format];
  }
  v7 = [v5 objectForKeyedSubscript:@"file name"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x263EFF940] raise:@"CLKComplicationBundleException", @"value for key '%@' must be a string - invalid value: %@", @"file name", v7 format];
  }
  v8 = [v5 objectForKeyedSubscript:@"scale"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x263EFF940] raise:@"CLKComplicationBundleException", @"value for key '%@' must be a number - invalid value: %@", @"scale", v8 format];
  }
  v9 = [v5 objectForKeyedSubscript:@"renderingMode"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x263EFF940] raise:@"CLKComplicationBundleException", @"value for key '%@' must be a number - invalid value: %@", @"renderingMode", v9 format];
  }
  uint64_t v10 = [(id)objc_opt_class() _renderingModeForNumber:v9];
  [v8 floatValue];
  double v12 = v11;
  v13 = [v6 bundlePath];

  v14 = [v13 stringByAppendingPathComponent:v7];

  v15 = [MEMORY[0x263F08850] defaultManager];
  v16 = [v15 contentsAtPath:v14];

  v17 = [MEMORY[0x263F827E8] imageWithData:v16 scale:v12];
  v18 = [v17 imageWithRenderingMode:v10];

  return v18;
}

- (id)JSONObjectRepresentationWritingResourcesToBundlePath:()JSONSerializable
{
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = objc_opt_new();
  v7 = [v6 UUIDString];
  v8 = [v7 stringByAppendingPathExtension:@"png"];

  [v5 setObject:v8 forKeyedSubscript:@"file name"];
  v9 = [v4 stringByAppendingPathComponent:v8];

  uint64_t v10 = UIImagePNGRepresentation(a1);
  id v18 = 0;
  char v11 = [v10 writeToFile:v9 options:1 error:&v18];
  id v12 = v18;

  if ((v11 & 1) == 0)
  {
    v13 = CLKLoggingObjectForDomain(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      [(UIImage(JSONSerializable) *)(uint64_t)v12 JSONObjectRepresentationWritingResourcesToBundlePath:v13];
    }
  }
  v14 = NSNumber;
  [(UIImage *)a1 scale];
  v15 = objc_msgSend(v14, "numberWithDouble:");
  [v5 setObject:v15 forKeyedSubscript:@"scale"];

  v16 = objc_msgSend((id)objc_opt_class(), "_numberForRenderingMode:", -[UIImage renderingMode](a1, "renderingMode"));
  [v5 setObject:v16 forKeyedSubscript:@"renderingMode"];

  return v5;
}

+ (uint64_t)_numberForRenderingMode:()JSONSerializable
{
  if (a3 == 2) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = a3 == 1;
  }
  return [NSNumber numberWithInt:v3];
}

+ (uint64_t)_renderingModeForNumber:()JSONSerializable
{
  int v3 = [a3 intValue];
  if (v3 == 2) {
    return 2;
  }
  else {
    return v3 == 1;
  }
}

- (void)JSONObjectRepresentationWritingResourcesToBundlePath:()JSONSerializable .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_21C599000, log, OS_LOG_TYPE_ERROR, "Error %@: failed to write CLKImageProvider onePieceImage to disk. Path: %@", (uint8_t *)&v3, 0x16u);
}

@end