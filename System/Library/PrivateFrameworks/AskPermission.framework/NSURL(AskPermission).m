@interface NSURL(AskPermission)
- (id)ap_secureURL;
@end

@implementation NSURL(AskPermission)

- (id)ap_secureURL
{
  v1 = [MEMORY[0x263F08BA0] componentsWithURL:a1 resolvingAgainstBaseURL:1];
  [v1 setScheme:@"https"];
  v2 = [v1 URL];

  return v2;
}

@end