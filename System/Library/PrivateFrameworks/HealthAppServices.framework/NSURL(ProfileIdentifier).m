@interface NSURL(ProfileIdentifier)
- (id)_hk_appendProfileIdentifier:()ProfileIdentifier;
@end

@implementation NSURL(ProfileIdentifier)

- (id)_hk_appendProfileIdentifier:()ProfileIdentifier
{
  id v4 = a3;
  if ([v4 type] == 1)
  {
    id v5 = a1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F1CB10], "_hk_appendQueryParameterToURL:forHKProfileIdentifier:", a1, v4);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

@end