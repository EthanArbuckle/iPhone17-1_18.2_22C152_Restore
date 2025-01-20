@interface AMSBadgeRequest
+ (BOOL)supportsSecureCoding;
- (AMSBadgeRequest)initWithCoder:(id)a3;
- (AMSBadgeRequest)initWithPushPayload:(id)a3;
- (BOOL)enabled;
- (NSDictionary)actionMetricsEvent;
- (NSDictionary)metrics;
- (NSString)badgeIdentifier;
- (NSString)bundleIdentifier;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AMSBadgeRequest

- (AMSBadgeRequest)initWithPushPayload:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)AMSBadgeRequest;
  v5 = [(AMSBadgeRequest *)&v23 init];
  if (v5)
  {
    v6 = [v4 aps];
    uint64_t v7 = [v6 objectForKeyedSubscript:@"actionMetricsEvent"];
    actionMetricsEvent = v5->_actionMetricsEvent;
    v5->_actionMetricsEvent = (NSDictionary *)v7;

    uint64_t v9 = [v4 clientIdentifier];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v9;

    v11 = [v4 aps];
    uint64_t v12 = [v11 objectForKeyedSubscript:@"badgeId"];
    badgeIdentifier = v5->_badgeIdentifier;
    v5->_badgeIdentifier = (NSString *)v12;

    v14 = [v4 aps];
    v15 = [v14 objectForKeyedSubscript:@"metrics"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v16 = v15;
    }
    else {
      v16 = 0;
    }

    metrics = v5->_metrics;
    v5->_metrics = v16;

    v18 = [v4 aps];
    v19 = [v18 objectForKeyedSubscript:@"enabled"];
    if (objc_opt_respondsToSelector())
    {
      v20 = [v4 aps];
      v21 = [v20 objectForKeyedSubscript:@"enabled"];
      v5->_enabled = [v21 BOOLValue];
    }
    else
    {
      v5->_enabled = 0;
    }
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v12 = a3;
  id v4 = [(AMSBadgeRequest *)self actionMetricsEvent];

  if (v4)
  {
    v5 = [(AMSBadgeRequest *)self actionMetricsEvent];
    [v12 encodeObject:v5 forKey:@"actionMetricsEvent"];
  }
  v6 = [(AMSBadgeRequest *)self badgeIdentifier];

  if (v6)
  {
    uint64_t v7 = [(AMSBadgeRequest *)self badgeIdentifier];
    [v12 encodeObject:v7 forKey:@"badgeIdentifier"];
  }
  v8 = [(AMSBadgeRequest *)self bundleIdentifier];

  if (v8)
  {
    uint64_t v9 = [(AMSBadgeRequest *)self bundleIdentifier];
    [v12 encodeObject:v9 forKey:@"bundleIdentifier"];
  }
  v10 = [(AMSBadgeRequest *)self metrics];

  if (v10)
  {
    v11 = [(AMSBadgeRequest *)self metrics];
    [v12 encodeObject:v11 forKey:@"metrics"];
  }
  objc_msgSend(v12, "encodeBool:forKey:", -[AMSBadgeRequest enabled](self, "enabled"), @"enabled");
}

- (AMSBadgeRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)AMSBadgeRequest;
  v5 = [(AMSBadgeRequest *)&v17 init];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "ams_JSONClasses");
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"actionMetricsEvent"];
    actionMetricsEvent = v5->_actionMetricsEvent;
    v5->_actionMetricsEvent = (NSDictionary *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"badgeIdentifier"];
    badgeIdentifier = v5->_badgeIdentifier;
    v5->_badgeIdentifier = (NSString *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v11;

    v13 = objc_msgSend(MEMORY[0x1E4F1CAD0], "ams_JSONClasses");
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"metrics"];
    metrics = v5->_metrics;
    v5->_metrics = (NSDictionary *)v14;

    v5->_enabled = [v4 decodeBoolForKey:@"enabled"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDictionary)actionMetricsEvent
{
  return self->_actionMetricsEvent;
}

- (NSString)badgeIdentifier
{
  return self->_badgeIdentifier;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (NSDictionary)metrics
{
  return self->_metrics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_badgeIdentifier, 0);
  objc_storeStrong((id *)&self->_actionMetricsEvent, 0);
}

@end