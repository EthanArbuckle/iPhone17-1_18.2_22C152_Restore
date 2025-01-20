@interface CBActivityAttribution
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (BOOL)hasMatchingAttributedEntity:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSystemService;
- (CBActivityAttribution)initWithSTActivityAttribution:(id)a3;
- (NSString)activeEntityBundleIdentifier;
- (NSString)attributionGroup;
- (NSString)bundleIdentifier;
- (NSString)description;
- (NSString)displayName;
- (NSString)executableDisplayName;
- (NSString)website;
- (id)_activityAttribution;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
@end

@implementation CBActivityAttribution

- (CBActivityAttribution)initWithSTActivityAttribution:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CBActivityAttribution;
  v5 = [(CBActivityAttribution *)&v19 init];
  if (v5)
  {
    v6 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Creating CBActivityAttribution for STActivityAttribution %@", buf, 0xCu);
    }

    v7 = (STActivityAttribution *)[v4 copy];
    attribution = v5->_attribution;
    v5->_attribution = v7;

    v9 = [v4 attributedEntity];
    v10 = [v9 bundlePath];
    if (v10 || ([v9 executablePath], (v10 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      char v11 = BSPathExistsOnSystemPartition() ^ 1;
    }
    else
    {
      char v11 = 1;
    }
    v12 = [v9 localizedDisplayName];
    v13 = +[NSBundle bundleForClass:objc_opt_class()];
    v14 = [v13 localizedStringForKey:@"SYSTEM_ATTRIBUTION_STRING" value:0 table:@"SystemStatusServer"];
    v15 = [v13 localizedStringForKey:@"UNKNOWN_ATTRIBUTION_STRING" value:0 table:@"SystemStatusServer"];
    if ((v11 & 1) != 0
      || ([v12 isEqualToString:v15] & 1) != 0
      || ([v12 isEqualToString:v14] & 1) != 0)
    {
      v16 = [v9 bundleIdentifier];
    }
    else
    {
      v16 = v12;
    }
    attributionGroup = v5->_attributionGroup;
    v5->_attributionGroup = v16;
  }
  return v5;
}

- (id)_activityAttribution
{
  return self->_attribution;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  id v4 = [(STActivityAttribution *)self->_attribution attributedEntity];
  if (v4)
  {
    v6 = v4;
    [v4 auditToken];
    id v4 = v6;
  }
  else
  {
    *(_OWORD *)retstr->var0 = 0u;
    *(_OWORD *)&retstr->var0[4] = 0u;
  }

  return result;
}

- (NSString)bundleIdentifier
{
  v2 = [(STActivityAttribution *)self->_attribution attributedEntity];
  v3 = [v2 bundleIdentifier];

  return (NSString *)v3;
}

- (NSString)activeEntityBundleIdentifier
{
  v2 = [(STActivityAttribution *)self->_attribution activeEntity];
  v3 = [v2 bundleIdentifier];

  return (NSString *)v3;
}

- (NSString)displayName
{
  v2 = [(STActivityAttribution *)self->_attribution attributedEntity];
  v3 = [v2 localizedDisplayName];

  return (NSString *)v3;
}

- (NSString)executableDisplayName
{
  v2 = [(STActivityAttribution *)self->_attribution attributedEntity];
  v3 = [v2 localizedExecutableDisplayName];

  return (NSString *)v3;
}

- (NSString)website
{
  v2 = [(STActivityAttribution *)self->_attribution attributedEntity];
  v3 = [v2 website];

  return (NSString *)v3;
}

- (BOOL)isSystemService
{
  v2 = [(STActivityAttribution *)self->_attribution attributedEntity];
  unsigned __int8 v3 = [v2 isSystemService];

  return v3;
}

- (BOOL)hasMatchingAttributedEntity:(id)a3
{
  return [a3 isEqual:self->_attribution];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = +[BSEqualsBuilder builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  attribution = self->_attribution;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001D2F4;
  v10[3] = &unk_100079CE0;
  id v11 = v4;
  id v7 = v4;
  id v8 = [v5 appendObject:attribution counterpart:v10];
  LOBYTE(attribution) = [v5 isEqual];

  return (char)attribution;
}

- (unint64_t)hash
{
  unsigned __int8 v3 = +[BSHashBuilder builder];
  id v4 = [v3 appendObject:self->_attribution];
  id v5 = [v3 hash];

  return (unint64_t)v5;
}

- (NSString)description
{
  return (NSString *)[(CBActivityAttribution *)self succinctDescription];
}

- (id)succinctDescription
{
  v2 = [(CBActivityAttribution *)self succinctDescriptionBuilder];
  unsigned __int8 v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  unsigned __int8 v3 = +[BSDescriptionBuilder builderWithObject:self];
  id v4 = [(CBActivityAttribution *)self displayName];
  id v5 = [v3 appendObject:v4 withName:@"displayName"];

  v6 = [(CBActivityAttribution *)self bundleIdentifier];
  id v7 = [v3 appendObject:v6 withName:@"bundleIdentifier"];

  id v8 = [(CBActivityAttribution *)self website];
  id v9 = objc_msgSend(v3, "appendBool:withName:", objc_msgSend(v8, "length") != 0, @"website-non-nil");

  id v10 = [v3 appendBool:[self isSystemService] withName:@"isSystemService"];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  unsigned __int8 v3 = [(CBActivityAttribution *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  +[BSDescriptionBuilder builderWithObject:self];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001D5D4;
  v8[3] = &unk_1000795E0;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = v5;
  id v10 = self;
  [v5 appendBodySectionWithName:0 multilinePrefix:v4 block:v8];

  id v6 = v5;
  return v6;
}

- (NSString)attributionGroup
{
  return self->_attributionGroup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributionGroup, 0);

  objc_storeStrong((id *)&self->_attribution, 0);
}

@end