@interface AMSEngagementMessageAction
- (AMSEngagementMessageAction)initWithJSObject:(id)a3;
- (AMSMetricsEvent)metricsEvent;
- (BOOL)requiresDelegate;
- (NSDictionary)clickstreamMetricsEvent;
- (NSDictionary)parameters;
- (NSString)identifier;
- (NSString)kind;
- (NSString)title;
- (NSURL)deepLink;
- (NSURL)iconURL;
- (id)makeDialogAction;
- (int64_t)style;
- (void)setClickstreamMetricsEvent:(id)a3;
- (void)setDeepLink:(id)a3;
- (void)setIconURL:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setKind:(id)a3;
- (void)setMetricsEvent:(id)a3;
- (void)setParameters:(id)a3;
- (void)setRequiresDelegate:(BOOL)a3;
- (void)setStyle:(int64_t)a3;
- (void)setTitle:(id)a3;
@end

@implementation AMSEngagementMessageAction

- (AMSEngagementMessageAction)initWithJSObject:(id)a3
{
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)AMSEngagementMessageAction;
  v5 = [(AMSEngagementMessageAction *)&v37 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"clickstreamMetricsEvent"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v33 = v6;
    }
    else {
      id v33 = 0;
    }

    v7 = [v4 objectForKeyedSubscript:@"deepLink"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v36 = v7;
    }
    else {
      id v36 = 0;
    }

    v8 = [v4 objectForKeyedSubscript:@"identifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id obj = v8;
    }
    else {
      id obj = 0;
    }

    v9 = [v4 objectForKeyedSubscript:@"kind"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v34 = v9;
    }
    else {
      id v34 = 0;
    }

    v10 = [v4 objectForKeyedSubscript:@"iconURL"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v11 = v10;
    }
    else {
      id v11 = 0;
    }

    v12 = [v4 objectForKeyedSubscript:@"requiresDelegate"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v13 = v12;
    }
    else {
      id v13 = 0;
    }

    v14 = [v4 objectForKeyedSubscript:@"metricsEvent"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v15 = v14;
    }
    else {
      id v15 = 0;
    }

    v16 = [v4 objectForKeyedSubscript:@"parameters"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v17 = v16;
    }
    else {
      id v17 = 0;
    }

    v18 = [v4 objectForKeyedSubscript:@"style"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v19 = v18;
    }
    else {
      id v19 = 0;
    }

    v20 = [v4 objectForKeyedSubscript:@"title"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v21 = v20;
    }
    else {
      v21 = 0;
    }
    v22 = v33;

    if (v33) {
      objc_storeStrong((id *)&v5->_clickstreamMetricsEvent, v33);
    }
    if (v36)
    {
      uint64_t v23 = objc_msgSend(MEMORY[0x1E4F1CB10], "URLWithString:");
      deepLink = v5->_deepLink;
      v5->_deepLink = (NSURL *)v23;
    }
    objc_storeStrong((id *)&v5->_identifier, obj);
    if (v11)
    {
      uint64_t v25 = [MEMORY[0x1E4F1CB10] URLWithString:v11];
      iconURL = v5->_iconURL;
      v5->_iconURL = (NSURL *)v25;
    }
    objc_storeStrong((id *)&v5->_kind, v34);
    if (v15)
    {
      v27 = [[AMSMetricsEvent alloc] initWithUnderlyingDictionary:v15];
      metricsEvent = v5->_metricsEvent;
      v5->_metricsEvent = v27;
    }
    v5->_requiresDelegate = objc_msgSend(v13, "BOOLValue", v33);
    objc_storeStrong((id *)&v5->_parameters, v17);
    if (v19) {
      int64_t v29 = (int)[v19 intValue];
    }
    else {
      int64_t v29 = 0;
    }
    title = v5->_title;
    v5->_style = v29;
    v5->_title = v21;

    if (!v5->_deepLink && !v5->_requiresDelegate)
    {

      v31 = 0;
      goto LABEL_47;
    }
  }
  v31 = v5;
LABEL_47:

  return v31;
}

- (id)makeDialogAction
{
  v3 = [(AMSEngagementMessageAction *)self title];
  id v4 = +[AMSDialogAction actionWithTitle:v3];

  v5 = [(AMSEngagementMessageAction *)self clickstreamMetricsEvent];
  [v4 setClickstreamMetricsEvent:v5];

  v6 = [(AMSEngagementMessageAction *)self deepLink];
  [v4 setDeepLink:v6];

  v7 = [(AMSEngagementMessageAction *)self iconURL];
  [v4 setIconURL:v7];

  v8 = [(AMSEngagementMessageAction *)self kind];
  [v4 setKind:v8];

  v9 = [(AMSEngagementMessageAction *)self metricsEvent];
  [v4 setMetricsEvent:v9];

  v10 = [(AMSEngagementMessageAction *)self parameters];
  [v4 setParameters:v10];

  objc_msgSend(v4, "setRequiresDelegate:", -[AMSEngagementMessageAction requiresDelegate](self, "requiresDelegate"));
  objc_msgSend(v4, "setStyle:", -[AMSEngagementMessageAction style](self, "style"));
  id v11 = [(AMSEngagementMessageAction *)self identifier];

  if (v11)
  {
    v12 = [(AMSEngagementMessageAction *)self identifier];
    [v4 setIdentifier:v12];
  }
  return v4;
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

- (NSURL)iconURL
{
  return self->_iconURL;
}

- (void)setIconURL:(id)a3
{
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

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_metricsEvent, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_iconURL, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_deepLink, 0);
  objc_storeStrong((id *)&self->_clickstreamMetricsEvent, 0);
}

@end