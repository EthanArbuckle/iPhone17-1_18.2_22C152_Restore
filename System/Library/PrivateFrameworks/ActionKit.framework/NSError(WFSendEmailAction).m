@interface NSError(WFSendEmailAction)
+ (id)wf_mailComposerUnavailableError;
@end

@implementation NSError(WFSendEmailAction)

+ (id)wf_mailComposerUnavailableError
{
  v7[1] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263F087E8];
  uint64_t v1 = *MEMORY[0x263F07F70];
  uint64_t v6 = *MEMORY[0x263F08320];
  v2 = WFLocalizedString(@"Cannot send emails. Mail may not be set up.");
  v7[0] = v2;
  v3 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  v4 = [v0 errorWithDomain:v1 code:3328 userInfo:v3];

  return v4;
}

@end