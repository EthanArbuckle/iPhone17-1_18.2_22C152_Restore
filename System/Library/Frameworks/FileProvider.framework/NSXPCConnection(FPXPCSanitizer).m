@interface NSXPCConnection(FPXPCSanitizer)
- (void)fp_annotateWithXPCSanitizer:()FPXPCSanitizer;
@end

@implementation NSXPCConnection(FPXPCSanitizer)

- (void)fp_annotateWithXPCSanitizer:()FPXPCSanitizer
{
  id v4 = a3;
  objc_msgSend(a1, "fp_userInfo");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v4 forKey:@"FPXPCSanitizerKey"];
}

@end