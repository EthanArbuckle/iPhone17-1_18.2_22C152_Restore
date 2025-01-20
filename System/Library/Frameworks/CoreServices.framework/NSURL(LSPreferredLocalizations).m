@interface NSURL(LSPreferredLocalizations)
- (id)ls_preferredLocalizations;
- (void)ls_setPreferredLocalizations:()LSPreferredLocalizations;
@end

@implementation NSURL(LSPreferredLocalizations)

- (id)ls_preferredLocalizations
{
  if ([(id)__LSDefaultsGetSharedInstance() isServer])
  {
    id v4 = 0;
    [a1 getResourceValue:&v4 forKey:@"com.apple.launchservices.preferredLocalizations" error:0];
    id v2 = v4;
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

- (void)ls_setPreferredLocalizations:()LSPreferredLocalizations
{
  id v4 = a3;
  if ([(id)__LSDefaultsGetSharedInstance() isServer]) {
    [a1 setTemporaryResourceValue:v4 forKey:@"com.apple.launchservices.preferredLocalizations"];
  }
}

@end