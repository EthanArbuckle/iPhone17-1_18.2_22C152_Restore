@interface NSData(CLKUtilities)
+ (id)dataWithJSONObjectRepresentation:()CLKUtilities bundle:;
- (id)JSONObjectRepresentationWritingResourcesToBundlePath:()CLKUtilities;
- (id)clk_hexEncodedString;
@end

@implementation NSData(CLKUtilities)

+ (id)dataWithJSONObjectRepresentation:()CLKUtilities bundle:
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x263EFF940] raise:@"CLKComplicationBundleException", @"must be a dictionary. Invalid value: %@", v6 format];
  }
  v8 = [v6 objectForKeyedSubscript:@"file name"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x263EFF940] raise:@"CLKComplicationBundleException", @"value for key '%@' must be a string - invalid value: %@", @"file name", v8 format];
  }
  v9 = [v7 bundlePath];
  v10 = [v9 stringByAppendingPathComponent:v8];

  v11 = [a1 dataWithContentsOfFile:v10];

  return v11;
}

- (id)JSONObjectRepresentationWritingResourcesToBundlePath:()CLKUtilities
{
  id v4 = a3;
  v5 = objc_opt_new();
  id v6 = objc_opt_new();
  id v7 = [v6 UUIDString];
  v8 = [v7 stringByAppendingPathExtension:@"sui"];

  [v5 setObject:v8 forKeyedSubscript:@"file name"];
  v9 = [v4 stringByAppendingPathComponent:v8];

  id v13 = 0;
  LOBYTE(v4) = [a1 writeToFile:v9 options:1 error:&v13];
  id v10 = v13;
  if ((v4 & 1) == 0)
  {
    v11 = CLKLoggingObjectForDomain(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      [(NSData(CLKUtilities) *)(uint64_t)v10 JSONObjectRepresentationWritingResourcesToBundlePath:v11];
    }
  }

  return v5;
}

- (id)clk_hexEncodedString
{
  v2 = objc_msgSend(MEMORY[0x263F089D8], "stringWithCapacity:", 2 * objc_msgSend(a1, "length"));
  id v3 = a1;
  uint64_t v4 = [v3 bytes];
  if ([v3 length])
  {
    unint64_t v5 = 0;
    do
      objc_msgSend(v2, "appendFormat:", @"%02x", *(unsigned __int8 *)(v4 + v5++));
    while (v5 < [v3 length]);
  }
  id v6 = (void *)[v2 copy];

  return v6;
}

- (void)JSONObjectRepresentationWritingResourcesToBundlePath:()CLKUtilities .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_21C599000, log, OS_LOG_TYPE_ERROR, "Error %@: failed to write SwiftUI data to disk. Path: %@", (uint8_t *)&v3, 0x16u);
}

@end