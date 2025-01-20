@interface PSSpecifier(App)
- (id)app;
- (uint64_t)setApp:()App;
@end

@implementation PSSpecifier(App)

- (uint64_t)setApp:()App
{
  return [a1 setProperty:a3 forKey:@"CSLPRFApp"];
}

- (id)app
{
  v2 = objc_msgSend(a1, "cslprf_settings");
  v3 = [v2 application];

  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    id v4 = [a1 propertyForKey:@"CSLPRFApp"];
  }
  v5 = v4;

  return v5;
}

@end