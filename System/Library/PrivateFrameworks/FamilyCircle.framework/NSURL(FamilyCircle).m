@interface NSURL(FamilyCircle)
- (id)fa_URLByAddingAirdropInviteParams;
- (id)fa_URLByAddingQueryParams:()FamilyCircle;
@end

@implementation NSURL(FamilyCircle)

- (id)fa_URLByAddingQueryParams:()FamilyCircle
{
  id v4 = a3;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:a1 resolvingAgainstBaseURL:0];
  v6 = [v5 queryItems];
  v7 = (void *)[v6 mutableCopy];
  v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __49__NSURL_FamilyCircle__fa_URLByAddingQueryParams___block_invoke;
  v14[3] = &unk_1E6925518;
  id v15 = v10;
  id v11 = v10;
  [v4 enumerateKeysAndObjectsUsingBlock:v14];
  [v5 setQueryItems:v11];
  v12 = [v5 URL];

  return v12;
}

- (id)fa_URLByAddingAirdropInviteParams
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"familyInviteSource";
  v6[0] = @"airdrop";
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  v3 = objc_msgSend(a1, "fa_URLByAddingQueryParams:", v2);

  return v3;
}

@end