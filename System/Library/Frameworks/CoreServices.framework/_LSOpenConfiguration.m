@interface _LSOpenConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)allowURLOverrides;
- (BOOL)ignoreAppLinkEnabledProperty;
- (BOOL)isSensitive;
- (BSServiceConnectionEndpoint)targetConnectionEndpoint;
- (NSDictionary)frontBoardOptions;
- (NSURL)referrerURL;
- (UISClickAttribution)clickAttribution;
- (UISPasteSharingToken)pasteSharingToken;
- (_LSOpenConfiguration)init;
- (_LSOpenConfiguration)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowURLOverrides:(BOOL)a3;
- (void)setClickAttribution:(id)a3;
- (void)setFrontBoardOptions:(id)a3;
- (void)setIgnoreAppLinkEnabledProperty:(BOOL)a3;
- (void)setPasteSharingToken:(id)a3;
- (void)setReferrerURL:(id)a3;
- (void)setSensitive:(BOOL)a3;
- (void)setTargetConnectionEndpoint:(id)a3;
@end

@implementation _LSOpenConfiguration

- (_LSOpenConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)_LSOpenConfiguration;
  result = [(_LSOpenConfiguration *)&v3 init];
  if (result) {
    result->_allowURLOverrides = 1;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    uint64_t v5 = [(NSDictionary *)self->_frontBoardOptions copy];
    v6 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = v5;

    uint64_t v7 = [(BSServiceConnectionEndpoint *)self->_targetConnectionEndpoint copy];
    v8 = *(void **)(v4 + 32);
    *(void *)(v4 + 32) = v7;

    uint64_t v9 = [(UISClickAttribution *)self->_clickAttribution copy];
    v10 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v9;

    uint64_t v11 = [(UISPasteSharingToken *)self->_pasteSharingToken copy];
    v12 = *(void **)(v4 + 48);
    *(void *)(v4 + 48) = v11;

    *(unsigned char *)(v4 + 8) = self->_ignoreAppLinkEnabledProperty;
    uint64_t v13 = [(NSURL *)self->_referrerURL copy];
    v14 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = v13;

    *(unsigned char *)(v4 + 9) = self->_sensitive;
    *(unsigned char *)(v4 + 10) = self->_allowURLOverrides;
  }
  return (id)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_frontBoardOptions forKey:@"frontBoardOptions"];
  [v4 encodeObject:self->_targetConnectionEndpoint forKey:@"targetConnectionEndpoint"];
  [v4 encodeObject:self->_clickAttribution forKey:@"clickAttribution"];
  [v4 encodeObject:self->_pasteSharingToken forKey:@"pasteSharingToken"];
  [v4 encodeBool:self->_ignoreAppLinkEnabledProperty forKey:@"ignoreAppLinkEnabledProperty"];
  [v4 encodeObject:self->_referrerURL forKey:@"referrerURL"];
  [v4 encodeBool:self->_sensitive forKey:@"sensitive"];
  [v4 encodeBool:self->_allowURLOverrides forKey:@"allowURLOverrides"];
}

- (_LSOpenConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_LSOpenConfiguration *)self init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = _LSGetFrontBoardOptionsDictionaryClasses();
    uint64_t v8 = objc_msgSend(v4, "ls_decodeDictionaryWithKeysOfClass:valuesOfClasses:forKey:", v6, v7, @"frontBoardOptions");
    frontBoardOptions = v5->_frontBoardOptions;
    v5->_frontBoardOptions = (NSDictionary *)v8;

    uint64_t BSServiceConnectionEndpointClass = getBSServiceConnectionEndpointClass();
    if (BSServiceConnectionEndpointClass)
    {
      uint64_t v11 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", BSServiceConnectionEndpointClass, @"targetConnectionEndpoint");
      targetConnectionEndpoint = v5->_targetConnectionEndpoint;
      v5->_targetConnectionEndpoint = (BSServiceConnectionEndpoint *)v11;
    }
    uint64_t UISClickAttributionClass = getUISClickAttributionClass();
    if (UISClickAttributionClass)
    {
      uint64_t v14 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", UISClickAttributionClass, @"clickAttribution");
      clickAttribution = v5->_clickAttribution;
      v5->_clickAttribution = (UISClickAttribution *)v14;
    }
    uint64_t UISPasteSharingTokenClass = getUISPasteSharingTokenClass();
    if (UISPasteSharingTokenClass)
    {
      uint64_t v17 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", UISPasteSharingTokenClass, @"pasteSharingToken");
      pasteSharingToken = v5->_pasteSharingToken;
      v5->_pasteSharingToken = (UISPasteSharingToken *)v17;
    }
    v5->_ignoreAppLinkEnabledProperty = [v4 decodeBoolForKey:@"ignoreAppLinkEnabledProperty"];
    uint64_t v19 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"referrerURL");
    referrerURL = v5->_referrerURL;
    v5->_referrerURL = (NSURL *)v19;

    v5->_sensitive = [v4 decodeBoolForKey:@"sensitive"];
    v5->_allowURLOverrides = [v4 decodeBoolForKey:@"allowURLOverrides"];
  }

  return v5;
}

- (NSDictionary)frontBoardOptions
{
  return self->_frontBoardOptions;
}

- (void)setFrontBoardOptions:(id)a3
{
}

- (BOOL)ignoreAppLinkEnabledProperty
{
  return self->_ignoreAppLinkEnabledProperty;
}

- (void)setIgnoreAppLinkEnabledProperty:(BOOL)a3
{
  self->_ignoreAppLinkEnabledProperty = a3;
}

- (NSURL)referrerURL
{
  return self->_referrerURL;
}

- (void)setReferrerURL:(id)a3
{
}

- (BOOL)isSensitive
{
  return self->_sensitive;
}

- (void)setSensitive:(BOOL)a3
{
  self->_sensitive = a3;
}

- (BOOL)allowURLOverrides
{
  return self->_allowURLOverrides;
}

- (void)setAllowURLOverrides:(BOOL)a3
{
  self->_allowURLOverrides = a3;
}

- (BSServiceConnectionEndpoint)targetConnectionEndpoint
{
  return self->_targetConnectionEndpoint;
}

- (void)setTargetConnectionEndpoint:(id)a3
{
}

- (UISClickAttribution)clickAttribution
{
  return self->_clickAttribution;
}

- (void)setClickAttribution:(id)a3
{
}

- (UISPasteSharingToken)pasteSharingToken
{
  return self->_pasteSharingToken;
}

- (void)setPasteSharingToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pasteSharingToken, 0);
  objc_storeStrong((id *)&self->_clickAttribution, 0);
  objc_storeStrong((id *)&self->_targetConnectionEndpoint, 0);
  objc_storeStrong((id *)&self->_referrerURL, 0);

  objc_storeStrong((id *)&self->_frontBoardOptions, 0);
}

@end