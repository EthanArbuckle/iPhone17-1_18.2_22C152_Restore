@interface AMSDialogAction
+ (BOOL)supportsSecureCoding;
+ (id)actionWithTitle:(id)a3;
+ (id)actionWithTitle:(id)a3 identifier:(id)a4;
+ (id)actionWithTitle:(id)a3 style:(int64_t)a4;
- (AMSDialogAction)init;
- (AMSDialogAction)initWithCoder:(id)a3;
- (AMSDialogRequest)dialogRequest;
- (AMSMetricsEvent)metricsEvent;
- (BOOL)ams_commerceUIURL;
- (BOOL)ams_resolvedInterruption;
- (BOOL)ams_shouldRetry;
- (BOOL)ams_tidContinue;
- (BOOL)inferLinkDestination;
- (BOOL)requiresDelegate;
- (BOOL)shouldRetry;
- (NSDictionary)ams_buttonDictionary;
- (NSDictionary)ams_formData;
- (NSDictionary)ams_metricsDictionary;
- (NSDictionary)clickstreamMetricsEvent;
- (NSDictionary)parameters;
- (NSMutableDictionary)userInfo;
- (NSString)accessibilityIdentifier;
- (NSString)ams_buyParams;
- (NSString)ams_subtarget;
- (NSString)identifier;
- (NSString)kind;
- (NSString)title;
- (NSURL)ams_rawURL;
- (NSURL)deepLink;
- (NSURL)iconURL;
- (NSURLRequest)request;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)ams_URLType;
- (int64_t)ams_actionType;
- (int64_t)style;
- (void)ams_setActionType:(int64_t)a3;
- (void)ams_setButtonDictionary:(id)a3;
- (void)ams_setBuyParams:(id)a3;
- (void)ams_setCommerceUIURL:(BOOL)a3;
- (void)ams_setFormData:(id)a3;
- (void)ams_setMetricsDictionary:(id)a3;
- (void)ams_setRawURL:(id)a3;
- (void)ams_setResolvedInterruption:(BOOL)a3;
- (void)ams_setShouldRetry:(BOOL)a3;
- (void)ams_setSubtarget:(id)a3;
- (void)ams_setTidContinue:(BOOL)a3;
- (void)ams_setURLType:(int64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessibilityIdentifier:(id)a3;
- (void)setClickstreamMetricsEvent:(id)a3;
- (void)setDeepLink:(id)a3;
- (void)setDialogRequest:(id)a3;
- (void)setIconURL:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setInferLinkDestination:(BOOL)a3;
- (void)setKind:(id)a3;
- (void)setMetricsEvent:(id)a3;
- (void)setParameters:(id)a3;
- (void)setRequest:(id)a3;
- (void)setRequiresDelegate:(BOOL)a3;
- (void)setShouldRetry:(BOOL)a3;
- (void)setStyle:(int64_t)a3;
- (void)setTitle:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation AMSDialogAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityIdentifier, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_iconURL, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_dialogRequest, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_metricsEvent, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_deepLink, 0);
  objc_storeStrong((id *)&self->_clickstreamMetricsEvent, 0);
}

- (AMSDialogAction)init
{
  v9.receiver = self;
  v9.super_class = (Class)AMSDialogAction;
  v2 = [(AMSDialogAction *)&v9 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v4 = [v3 UUIDString];
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)v4;

    v2->_inferLinkDestination = 1;
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    userInfo = v2->_userInfo;
    v2->_userInfo = v6;
  }
  return v2;
}

+ (id)actionWithTitle:(id)a3
{
  return (id)[a1 actionWithTitle:a3 identifier:0];
}

+ (id)actionWithTitle:(id)a3 style:(int64_t)a4
{
  v5 = [a1 actionWithTitle:a3];
  [v5 setStyle:a4];
  return v5;
}

+ (id)actionWithTitle:(id)a3 identifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)objc_opt_class());
  [v7 setTitle:v6];

  if ([v5 length]) {
    [v7 setIdentifier:v5];
  }

  return v7;
}

- (id)description
{
  if (os_variant_has_internal_content())
  {
    v3 = [(AMSDialogAction *)self kind];
    uint64_t v4 = [(AMSDialogAction *)self title];
    id v5 = [(AMSDialogAction *)self parameters];
    id v6 = [v5 description];

    id v7 = [(AMSDialogAction *)self deepLink];
    v8 = [v7 absoluteString];
  }
  else
  {
    v8 = @"<private>";
    uint64_t v4 = @"<private>";
    v3 = @"<private>";
    id v6 = @"<private>";
  }
  objc_super v9 = NSString;
  v10 = [(AMSDialogAction *)self identifier];
  v11 = [v9 stringWithFormat:@"{ id: %@, kind: %@, parameters: %@, title: %@, url: %@ }", v10, v3, v6, v4, v8];

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v30 = a3;
  uint64_t v4 = [(AMSDialogAction *)self clickstreamMetricsEvent];

  if (v4)
  {
    id v5 = [(AMSDialogAction *)self clickstreamMetricsEvent];
    [v30 encodeObject:v5 forKey:@"kCodingKeyClickstreamMetricsEvent"];
  }
  id v6 = [(AMSDialogAction *)self deepLink];

  if (v6)
  {
    id v7 = [(AMSDialogAction *)self deepLink];
    [v30 encodeObject:v7 forKey:@"kCodingKeyDeepLink"];
  }
  v8 = [(AMSDialogAction *)self dialogRequest];

  if (v8)
  {
    objc_super v9 = [(AMSDialogAction *)self dialogRequest];
    [v30 encodeObject:v9 forKey:@"kCodingKeyDialogRequest"];
  }
  v10 = [(AMSDialogAction *)self iconURL];

  if (v10)
  {
    v11 = [(AMSDialogAction *)self request];
    [v30 encodeObject:v11 forKey:@"kCodingKeyIconURL"];
  }
  v12 = [(AMSDialogAction *)self identifier];

  if (v12)
  {
    v13 = [(AMSDialogAction *)self identifier];
    [v30 encodeObject:v13 forKey:@"kCodingKeyIdentifier"];
  }
  v14 = [(AMSDialogAction *)self kind];

  if (v14)
  {
    v15 = [(AMSDialogAction *)self kind];
    [v30 encodeObject:v15 forKey:@"kCodingKeyKind"];
  }
  v16 = [(AMSDialogAction *)self metricsEvent];

  if (v16)
  {
    v17 = [(AMSDialogAction *)self metricsEvent];
    v18 = [v17 underlyingDictionary];
    [v30 encodeObject:v18 forKey:@"kCodingKeyMetrics"];
  }
  v19 = [(AMSDialogAction *)self parameters];

  if (v19)
  {
    v20 = [(AMSDialogAction *)self parameters];
    [v30 encodeObject:v20 forKey:@"kCodingKeyParameters"];
  }
  v21 = [(AMSDialogAction *)self request];

  if (v21)
  {
    v22 = [(AMSDialogAction *)self request];
    [v30 encodeObject:v22 forKey:@"kCodingKeyRequest"];
  }
  if ([(AMSDialogAction *)self requiresDelegate]) {
    objc_msgSend(v30, "encodeBool:forKey:", -[AMSDialogAction requiresDelegate](self, "requiresDelegate"), @"kCodingKeyRequiresDelegate");
  }
  objc_msgSend(v30, "encodeBool:forKey:", -[AMSDialogAction inferLinkDestination](self, "inferLinkDestination"), @"kCodingKeyInferLinkDest");
  objc_msgSend(v30, "encodeBool:forKey:", -[AMSDialogAction shouldRetry](self, "shouldRetry"), @"kCodingKeyRetry");
  objc_msgSend(v30, "encodeInteger:forKey:", -[AMSDialogAction style](self, "style"), @"kCodingKeyStyle");
  v23 = [(AMSDialogAction *)self title];

  if (v23)
  {
    v24 = [(AMSDialogAction *)self title];
    [v30 encodeObject:v24 forKey:@"kCodingKeyTitle"];
  }
  v25 = [(AMSDialogAction *)self userInfo];

  if (v25)
  {
    v26 = [(AMSDialogAction *)self userInfo];
    [v30 encodeObject:v26 forKey:@"kCodingKeyUserInfo"];
  }
  v27 = [(AMSDialogAction *)self accessibilityIdentifier];

  v28 = v30;
  if (v27)
  {
    v29 = [(AMSDialogAction *)self accessibilityIdentifier];
    [v30 encodeObject:v29 forKey:@"kCodingKeyAccessibilityIdentifier"];

    v28 = v30;
  }
}

- (AMSDialogAction)initWithCoder:(id)a3
{
  v42[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)AMSDialogAction;
  id v5 = [(AMSDialogAction *)&v41 init];
  if (v5)
  {
    id v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "ams_JSONClasses");
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"kCodingKeyClickstreamMetricsEvent"];
    clickstreamMetricsEvent = v5->_clickstreamMetricsEvent;
    v5->_clickstreamMetricsEvent = (NSDictionary *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCodingKeyDeepLink"];
    deepLink = v5->_deepLink;
    v5->_deepLink = (NSURL *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCodingKeyDialogRequest"];
    dialogRequest = v5->_dialogRequest;
    v5->_dialogRequest = (AMSDialogRequest *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCodingKeyIconURL"];
    iconURL = v5->_iconURL;
    v5->_iconURL = (NSURL *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCodingKeyIdentifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v15;

    v5->_inferLinkDestination = [v4 decodeBoolForKey:@"kCodingKeyInferLinkDest"];
    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCodingKeyKind"];
    kind = v5->_kind;
    v5->_kind = (NSString *)v17;

    v19 = objc_msgSend(MEMORY[0x1E4F1CAD0], "ams_JSONClasses");
    v20 = [v4 decodeObjectOfClasses:v19 forKey:@"kCodingKeyMetrics"];

    if (v20)
    {
      v21 = [[AMSMetricsEvent alloc] initWithUnderlyingDictionary:v20];
      metricsEvent = v5->_metricsEvent;
      v5->_metricsEvent = v21;
    }
    v23 = (void *)MEMORY[0x1E4F1CAD0];
    v42[0] = objc_opt_class();
    v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:1];
    v25 = [v23 setWithArray:v24];
    uint64_t v26 = [v4 decodeObjectOfClasses:v25 forKey:@"kCodingKeyParameters"];
    parameters = v5->_parameters;
    v5->_parameters = (NSDictionary *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCodingKeyRequest"];
    request = v5->_request;
    v5->_request = (NSURLRequest *)v28;

    v5->_requiresDelegate = [v4 decodeBoolForKey:@"kCodingKeyRequiresDelegate"];
    v5->_shouldRetry = [v4 decodeBoolForKey:@"kCodingKeyRetry"];
    v5->_style = [v4 decodeIntegerForKey:@"kCodingKeyStyle"];
    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCodingKeyTitle"];
    title = v5->_title;
    v5->_title = (NSString *)v30;

    v32 = objc_msgSend(MEMORY[0x1E4F1CAD0], "ams_JSONClasses");
    v33 = [v4 decodeObjectOfClasses:v32 forKey:@"kCodingKeyUserInfo"];
    v34 = (void *)[v33 mutableCopy];
    v35 = v34;
    if (v34) {
      v36 = v34;
    }
    else {
      v36 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    userInfo = v5->_userInfo;
    v5->_userInfo = v36;

    uint64_t v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCodingKeyAccessibilityIdentifier"];
    accessibilityIdentifier = v5->_accessibilityIdentifier;
    v5->_accessibilityIdentifier = (NSString *)v38;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[AMSDialogAction allocWithZone:](AMSDialogAction, "allocWithZone:") init];
  id v6 = [(AMSDialogAction *)self clickstreamMetricsEvent];

  if (v6)
  {
    uint64_t v7 = [(AMSDialogAction *)self clickstreamMetricsEvent];
    [(AMSDialogAction *)v5 setClickstreamMetricsEvent:v7];
  }
  v8 = [(AMSDialogAction *)self deepLink];

  if (v8)
  {
    uint64_t v9 = [(AMSDialogAction *)self deepLink];
    v10 = (void *)[v9 copyWithZone:a3];
    [(AMSDialogAction *)v5 setDeepLink:v10];
  }
  uint64_t v11 = [(AMSDialogAction *)self dialogRequest];

  if (v11)
  {
    v12 = [(AMSDialogAction *)self dialogRequest];
    uint64_t v13 = (void *)[v12 copyWithZone:a3];
    [(AMSDialogAction *)v5 setDialogRequest:v13];
  }
  v14 = [(AMSDialogAction *)self identifier];

  if (v14)
  {
    uint64_t v15 = [(AMSDialogAction *)self identifier];
    v16 = (void *)[v15 copyWithZone:a3];
    [(AMSDialogAction *)v5 setIdentifier:v16];
  }
  uint64_t v17 = [(AMSDialogAction *)self kind];

  if (v17)
  {
    v18 = [(AMSDialogAction *)self kind];
    v19 = (void *)[v18 copyWithZone:a3];
    [(AMSDialogAction *)v5 setKind:v19];
  }
  v20 = [(AMSDialogAction *)self metricsEvent];

  if (v20)
  {
    v21 = [(AMSDialogAction *)self metricsEvent];
    v22 = (void *)[v21 copyWithZone:a3];
    [(AMSDialogAction *)v5 setMetricsEvent:v22];
  }
  v23 = [(AMSDialogAction *)self parameters];

  if (v23)
  {
    v24 = [(AMSDialogAction *)self parameters];
    v25 = (void *)[v24 copyWithZone:a3];
    [(AMSDialogAction *)v5 setParameters:v25];
  }
  uint64_t v26 = [(AMSDialogAction *)self request];

  if (v26)
  {
    v27 = [(AMSDialogAction *)self request];
    uint64_t v28 = (void *)[v27 copyWithZone:a3];
    [(AMSDialogAction *)v5 setRequest:v28];
  }
  [(AMSDialogAction *)v5 setRequiresDelegate:[(AMSDialogAction *)self requiresDelegate]];
  [(AMSDialogAction *)v5 setInferLinkDestination:[(AMSDialogAction *)self inferLinkDestination]];
  [(AMSDialogAction *)v5 setShouldRetry:[(AMSDialogAction *)self shouldRetry]];
  [(AMSDialogAction *)v5 setStyle:[(AMSDialogAction *)self style]];
  v29 = [(AMSDialogAction *)self title];

  if (v29)
  {
    uint64_t v30 = [(AMSDialogAction *)self title];
    v31 = (void *)[v30 copyWithZone:a3];
    [(AMSDialogAction *)v5 setTitle:v31];
  }
  v32 = [(AMSDialogAction *)self userInfo];

  if (v32)
  {
    v33 = [(AMSDialogAction *)self userInfo];
    v34 = (void *)[v33 copyWithZone:a3];
    v35 = (void *)[v34 mutableCopy];
    [(AMSDialogAction *)v5 setUserInfo:v35];
  }
  v36 = [(AMSDialogAction *)self accessibilityIdentifier];

  if (v36)
  {
    v37 = [(AMSDialogAction *)self accessibilityIdentifier];
    uint64_t v38 = (void *)[v37 copyWithZone:a3];
    [(AMSDialogAction *)v5 setAccessibilityIdentifier:v38];
  }
  return v5;
}

- (NSDictionary)clickstreamMetricsEvent
{
  return self->_clickstreamMetricsEvent;
}

- (void)setClickstreamMetricsEvent:(id)a3
{
}

- (NSURL)deepLink
{
  return self->_deepLink;
}

- (void)setDeepLink:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (BOOL)inferLinkDestination
{
  return self->_inferLinkDestination;
}

- (void)setInferLinkDestination:(BOOL)a3
{
  self->_inferLinkDestination = a3;
}

- (NSString)kind
{
  return self->_kind;
}

- (void)setKind:(id)a3
{
}

- (AMSMetricsEvent)metricsEvent
{
  return self->_metricsEvent;
}

- (void)setMetricsEvent:(id)a3
{
}

- (NSURLRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (AMSDialogRequest)dialogRequest
{
  return self->_dialogRequest;
}

- (void)setDialogRequest:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSURL)iconURL
{
  return self->_iconURL;
}

- (void)setIconURL:(id)a3
{
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
}

- (BOOL)requiresDelegate
{
  return self->_requiresDelegate;
}

- (void)setRequiresDelegate:(BOOL)a3
{
  self->_requiresDelegate = a3;
}

- (NSMutableDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (NSString)accessibilityIdentifier
{
  return self->_accessibilityIdentifier;
}

- (void)setAccessibilityIdentifier:(id)a3
{
}

- (BOOL)shouldRetry
{
  return self->_shouldRetry;
}

- (void)setShouldRetry:(BOOL)a3
{
  self->_shouldRetry = a3;
}

- (int64_t)ams_actionType
{
  v2 = [(AMSDialogAction *)self userInfo];
  v3 = [v2 objectForKeyedSubscript:@"kActionUserInfoKeyType"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  int64_t v5 = [v4 integerValue];
  return v5;
}

- (void)ams_setActionType:(int64_t)a3
{
  id v5 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
  id v4 = [(AMSDialogAction *)self userInfo];
  [v4 setObject:v5 forKeyedSubscript:@"kActionUserInfoKeyType"];
}

- (NSDictionary)ams_formData
{
  v2 = [(AMSDialogAction *)self ams_buttonDictionary];
  v3 = [v2 objectForKeyedSubscript:@"form-data"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (NSDictionary *)v4;
}

- (NSString)ams_buyParams
{
  v2 = [(AMSDialogAction *)self ams_buttonDictionary];
  v3 = [v2 objectForKeyedSubscript:@"buyParams"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (NSString *)v4;
}

- (BOOL)ams_commerceUIURL
{
  v3 = [(AMSDialogAction *)self userInfo];
  id v4 = [v3 objectForKeyedSubscript:@"kActionUserInfoKeyCommerceUIURL"];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [(AMSDialogAction *)self userInfo];
    id v6 = [v5 objectForKeyedSubscript:@"kActionUserInfoKeyCommerceUIURL"];
    char v7 = [v6 BOOLValue];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (NSDictionary)ams_buttonDictionary
{
  v2 = [(AMSDialogAction *)self userInfo];
  v3 = [v2 objectForKeyedSubscript:@"AMSDialogRequestUserInfoKeyServerPayload"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (NSDictionary *)v4;
}

- (NSDictionary)ams_metricsDictionary
{
  v2 = [(AMSDialogAction *)self userInfo];
  v3 = [v2 objectForKeyedSubscript:@"kActionUserInfoKeyMetricsDictionary"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (NSDictionary *)v4;
}

- (NSURL)ams_rawURL
{
  v2 = [(AMSDialogAction *)self userInfo];
  v3 = [v2 objectForKeyedSubscript:@"kActionUserInfoKeyURL"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;

    if (v4)
    {
      id v5 = [MEMORY[0x1E4F1CB10] URLWithString:v4];
      goto LABEL_6;
    }
  }
  else
  {

    id v4 = 0;
  }
  id v5 = 0;
LABEL_6:

  return (NSURL *)v5;
}

- (BOOL)ams_resolvedInterruption
{
  v2 = [(AMSDialogAction *)self userInfo];
  v3 = [v2 objectForKeyedSubscript:@"kActionUserInfoKeyResolvedInterruption"];

  if (objc_opt_respondsToSelector()) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)ams_setFormData:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSDialogAction *)self ams_buttonDictionary];
  id v6 = (void *)[v5 mutableCopy];
  char v7 = v6;
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  id v9 = v8;

  [v9 setObject:v4 forKeyedSubscript:@"form-data"];
  [(AMSDialogAction *)self ams_setButtonDictionary:v9];
}

- (void)ams_setBuyParams:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSDialogAction *)self ams_buttonDictionary];
  id v6 = (void *)[v5 mutableCopy];
  char v7 = v6;
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  id v9 = v8;

  [v9 setObject:v4 forKeyedSubscript:@"buyParams"];
  [(AMSDialogAction *)self ams_setButtonDictionary:v9];
}

- (void)ams_setButtonDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSDialogAction *)self userInfo];
  [v5 setObject:v4 forKeyedSubscript:@"AMSDialogRequestUserInfoKeyServerPayload"];
}

- (void)ams_setCommerceUIURL:(BOOL)a3
{
  id v5 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  id v4 = [(AMSDialogAction *)self userInfo];
  [v4 setObject:v5 forKeyedSubscript:@"kActionUserInfoKeyCommerceUIURL"];
}

- (void)ams_setMetricsDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSDialogAction *)self userInfo];
  [v5 setObject:v4 forKeyedSubscript:@"kActionUserInfoKeyMetricsDictionary"];
}

- (void)ams_setRawURL:(id)a3
{
  id v5 = [a3 absoluteString];
  id v4 = [(AMSDialogAction *)self userInfo];
  [v4 setObject:v5 forKeyedSubscript:@"kActionUserInfoKeyURL"];
}

- (void)ams_setResolvedInterruption:(BOOL)a3
{
  id v5 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  id v4 = [(AMSDialogAction *)self userInfo];
  [v4 setObject:v5 forKeyedSubscript:@"kActionUserInfoKeyResolvedInterruption"];
}

- (void)ams_setShouldRetry:(BOOL)a3
{
  id v5 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  id v4 = [(AMSDialogAction *)self userInfo];
  [v4 setObject:v5 forKeyedSubscript:@"kActionUserInfoKeyShouldRetry"];
}

- (void)ams_setSubtarget:(id)a3
{
  id v6 = a3;
  id v4 = [(AMSDialogAction *)self userInfo];
  id v5 = v4;
  if (v6) {
    [v4 setObject:v6 forKeyedSubscript:@"kActionUserInfoKeySubtarget"];
  }
  else {
    [v4 removeObjectForKey:@"kActionUserInfoKeySubtarget"];
  }
}

- (void)ams_setTidContinue:(BOOL)a3
{
  id v5 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  id v4 = [(AMSDialogAction *)self userInfo];
  [v4 setObject:v5 forKeyedSubscript:@"kActionUserInfoKeyTIDContinue"];
}

- (void)ams_setURLType:(int64_t)a3
{
  id v5 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
  id v4 = [(AMSDialogAction *)self userInfo];
  [v4 setObject:v5 forKeyedSubscript:@"kActionUserInfoKeyURLType"];
}

- (BOOL)ams_shouldRetry
{
  v3 = [(AMSDialogAction *)self userInfo];
  id v4 = [v3 objectForKeyedSubscript:@"kActionUserInfoKeyShouldRetry"];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [(AMSDialogAction *)self userInfo];
    id v6 = [v5 objectForKeyedSubscript:@"kActionUserInfoKeyShouldRetry"];
    char v7 = [v6 BOOLValue];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (NSString)ams_subtarget
{
  v2 = [(AMSDialogAction *)self userInfo];
  v3 = [v2 objectForKeyedSubscript:@"kActionUserInfoKeySubtarget"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (NSString *)v4;
}

- (BOOL)ams_tidContinue
{
  v3 = [(AMSDialogAction *)self userInfo];
  id v4 = [v3 objectForKeyedSubscript:@"kActionUserInfoKeyTIDContinue"];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [(AMSDialogAction *)self userInfo];
    id v6 = [v5 objectForKeyedSubscript:@"kActionUserInfoKeyTIDContinue"];
    char v7 = [v6 BOOLValue];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (int64_t)ams_URLType
{
  v2 = [(AMSDialogAction *)self userInfo];
  v3 = [v2 objectForKeyedSubscript:@"kActionUserInfoKeyURLType"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  int64_t v5 = [v4 integerValue];
  return v5;
}

@end