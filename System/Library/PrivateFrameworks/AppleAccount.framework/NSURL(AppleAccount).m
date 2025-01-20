@interface NSURL(AppleAccount)
+ (id)aa_URLWithEndpoint:()AppleAccount;
- (id)aa_endpoint;
@end

@implementation NSURL(AppleAccount)

+ (id)aa_URLWithEndpoint:()AppleAccount
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"NSURL+AppleAccount.m", 22, @"Invalid parameter not satisfying: %@", @"endpoint" object file lineNumber description];
  }
  v6 = NSString;
  v13[0] = @"endpoint";
  v13[1] = v5;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  v8 = [v6 pathWithComponents:v7];

  id v9 = objc_alloc_init(MEMORY[0x1E4F29088]);
  [v9 setPath:v8];
  [v9 setScheme:@"x-appleaccount"];
  v10 = [v9 URL];

  return v10;
}

- (id)aa_endpoint
{
  v1 = [MEMORY[0x1E4F29088] componentsWithURL:a1 resolvingAgainstBaseURL:0];
  v2 = [v1 path];
  v3 = [v2 pathComponents];

  uint64_t v4 = [v3 indexOfObjectPassingTest:&__block_literal_global_2];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL || [v3 count] <= (unint64_t)(v4 + 1))
  {
    id v5 = 0;
  }
  else
  {
    id v5 = objc_msgSend(v3, "objectAtIndexedSubscript:");
  }

  return v5;
}

@end