@interface DESandboxExtension
- (id)attachmentList;
- (id)attachmentsForParameters:(id)a3;
@end

@implementation DESandboxExtension

- (id)attachmentList
{
  v3 = +[NSRegularExpression regularExpressionWithPattern:@".*Sandbox.*\\.(plist|ips).*" options:1 error:0];
  v4 = +[NSURL fileURLWithPath:@"/var/mobile/Library/Logs/CrashReporter"];
  v5 = [(DESandboxExtension *)self filesInDir:v4 matchingPattern:v3 excludingPattern:0];

  return v5;
}

- (id)attachmentsForParameters:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKey:@"DEExtensionAttachmentsParamDisplayNameKey"];

  if (v5
    && ([v4 objectForKeyedSubscript:@"DEExtensionAttachmentsParamDisplayNameKey"],
        (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v7 = (void *)v6;
    v8 = +[NSString stringWithFormat:@".*Sandbox.*%@.*\\.(plist|ips).*", v6];
  }
  else
  {
    v8 = @".*Sandbox.*\\.(plist|ips).*";
  }
  v9 = +[NSRegularExpression regularExpressionWithPattern:v8 options:1 error:0];
  v10 = +[NSURL fileURLWithPath:@"/var/mobile/Library/Logs/CrashReporter"];
  v11 = [(DESandboxExtension *)self filesInDir:v10 matchingPattern:v9 excludingPattern:0];

  return v11;
}

@end