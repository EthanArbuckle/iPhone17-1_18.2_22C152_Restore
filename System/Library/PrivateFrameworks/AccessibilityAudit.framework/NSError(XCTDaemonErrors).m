@interface NSError(XCTDaemonErrors)
+ (id)_axAudit_error:()XCTDaemonErrors description:;
@end

@implementation NSError(XCTDaemonErrors)

+ (id)_axAudit_error:()XCTDaemonErrors description:
{
  v17[1] = *MEMORY[0x263EF8340];
  v10 = (objc_class *)NSString;
  id v11 = a4;
  v12 = (void *)[[v10 alloc] initWithFormat:v11 arguments:&a9];

  uint64_t v16 = *MEMORY[0x263F08320];
  v17[0] = v12;
  v13 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
  v14 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.accessibilityAudit" code:a3 userInfo:v13];

  return v14;
}

@end