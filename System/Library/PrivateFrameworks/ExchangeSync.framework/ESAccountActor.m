@interface ESAccountActor
- (ESAccountActor)initWithDAAccount:(id)a3;
@end

@implementation ESAccountActor

- (ESAccountActor)initWithDAAccount:(id)a3
{
  id v4 = a3;
  v5 = +[ESAccountLoader sharedInstance];
  v6 = sharedDAAccountStore();
  v7 = [v6 accountTypeWithAccountTypeIdentifier:*MEMORY[0x263EFAEB0]];
  [v5 loadFrameworkForACAccountType:v7];

  v8 = (ESAccountActor *)[objc_alloc(NSClassFromString(&cfstr_Asconcreteacco.isa)) initWithDAAccount:v4];
  return v8;
}

@end