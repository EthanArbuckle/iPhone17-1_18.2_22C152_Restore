@interface LSApplicationIdentity(FBSBundleInfo)
- (id)fbs_mediumDescription;
- (id)fbs_shortDescription;
@end

@implementation LSApplicationIdentity(FBSBundleInfo)

- (id)fbs_shortDescription
{
  objc_getAssociatedObject(a1, &__FBSShortDescription);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v3 = (void *)MEMORY[0x1E4F223B0];
    v4 = [a1 identityString];
    v5 = [v3 bundleIdentifierForIdentityString:v4 error:0];

    v6 = [a1 fbs_personaUniqueString];
    v7 = v6;
    if (v6)
    {
      v8 = [v6 componentsSeparatedByString:@"-"];
      v9 = [v8 lastObject];

      id v2 = [NSString stringWithFormat:@"%@:%@", v5, v9];
    }
    else
    {
      id v2 = v5;
    }
    objc_setAssociatedObject(a1, &__FBSShortDescription, v2, (void *)0x303);
  }

  return v2;
}

- (id)fbs_mediumDescription
{
  id v2 = objc_getAssociatedObject(a1, &__FBSMediumDescription);
  if (!v2)
  {
    v3 = (void *)MEMORY[0x1E4F223B0];
    v4 = [a1 identityString];
    v5 = [v3 bundleIdentifierForIdentityString:v4 error:0];

    v6 = [a1 fbs_personaUniqueString];
    if (v6)
    {
      id v7 = [NSString stringWithFormat:@"%@:%@", v5, v6];
    }
    else
    {
      id v7 = v5;
    }
    id v2 = v7;
    objc_setAssociatedObject(a1, &__FBSMediumDescription, v7, (void *)0x303);
  }

  return v2;
}

@end