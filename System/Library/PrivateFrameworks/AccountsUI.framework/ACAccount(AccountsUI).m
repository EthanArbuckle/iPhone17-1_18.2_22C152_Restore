@interface ACAccount(AccountsUI)
- (id)displayUsername;
@end

@implementation ACAccount(AccountsUI)

- (id)displayUsername
{
  id v6 = a1;
  v5[1] = a2;
  id v4 = (id)[a1 accountProperties];
  v5[0] = (id)[v4 objectForKey:@"ACUIDisplayUsername"];

  if (!v5[0])
  {
    v5[0] = (id)[v6 username];
  }
  id v3 = v5[0];
  objc_storeStrong(v5, 0);
  return v3;
}

@end