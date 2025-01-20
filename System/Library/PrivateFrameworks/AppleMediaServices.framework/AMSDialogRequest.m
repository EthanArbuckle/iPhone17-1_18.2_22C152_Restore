@interface AMSDialogRequest
+ (AMSDialogRequest)requestWithTitle:(id)a3 message:(id)a4;
+ (BOOL)supportsSecureCoding;
- (AMSDialogAction)cancelAction;
- (AMSDialogAction)defaultAction;
- (AMSDialogRequest)init;
- (AMSDialogRequest)initWithCoder:(id)a3;
- (AMSDialogRequest)initWithError:(id)a3;
- (AMSDialogRequest)initWithTitle:(id)a3 message:(id)a4;
- (AMSDialogRequest)initWithTitle:(id)a3 message:(id)a4 appearanceInfo:(id)a5;
- (AMSMetricsEvent)metricsEvent;
- (BOOL)allowsNativeWatchCancelPlacement;
- (BOOL)preventsCancelButtonStyle;
- (NSArray)buttonActions;
- (NSArray)textFields;
- (NSDictionary)appearanceInfo;
- (NSDictionary)clickstreamMetricsEvent;
- (NSDictionary)userInfo;
- (NSString)identifier;
- (NSString)logKey;
- (NSString)message;
- (NSString)messageAccessibilityLabel;
- (NSString)preferredButtonActionIdentifier;
- (NSString)systemSymbolName;
- (NSString)title;
- (NSString)titleAccessibilityLabel;
- (NSURL)iconBundleURL;
- (NSURL)iconURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)locateActionWithIdentifier:(id)a3;
- (int64_t)style;
- (void)addButtonAction:(id)a3;
- (void)addTextField:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)replaceAction:(id)a3;
- (void)setAllowsNativeWatchCancelPlacement:(BOOL)a3;
- (void)setButtonActions:(id)a3;
- (void)setCancelAction:(id)a3;
- (void)setClickstreamMetricsEvent:(id)a3;
- (void)setDefaultAction:(id)a3;
- (void)setIconBundleURL:(id)a3;
- (void)setIconURL:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLogKey:(id)a3;
- (void)setMessage:(id)a3;
- (void)setMessageAccessibilityLabel:(id)a3;
- (void)setMetricsEvent:(id)a3;
- (void)setPreferredButtonActionIdentifier:(id)a3;
- (void)setPreventsCancelButtonStyle:(BOOL)a3;
- (void)setStyle:(int64_t)a3;
- (void)setSystemSymbolName:(id)a3;
- (void)setTextFields:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleAccessibilityLabel:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation AMSDialogRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_titleAccessibilityLabel, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_textFields, 0);
  objc_storeStrong((id *)&self->_systemSymbolName, 0);
  objc_storeStrong((id *)&self->_preferredButtonActionIdentifier, 0);
  objc_storeStrong((id *)&self->_metricsEvent, 0);
  objc_storeStrong((id *)&self->_messageAccessibilityLabel, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_iconURL, 0);
  objc_storeStrong((id *)&self->_iconBundleURL, 0);
  objc_storeStrong((id *)&self->_defaultAction, 0);
  objc_storeStrong((id *)&self->_clickstreamMetricsEvent, 0);
  objc_storeStrong((id *)&self->_cancelAction, 0);
  objc_storeStrong((id *)&self->_buttonActions, 0);
  objc_storeStrong((id *)&self->_appearanceInfo, 0);
}

- (AMSDialogRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)AMSDialogRequest;
  v2 = [(AMSDialogRequest *)&v6 init];
  if (v2)
  {
    v3 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    userInfo = v2->_userInfo;
    v2->_userInfo = v3;
  }
  return v2;
}

- (AMSDialogRequest)initWithError:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(v4, "ams_title");
  objc_super v6 = objc_msgSend(v4, "ams_message");

  v7 = [(AMSDialogRequest *)self initWithTitle:v5 message:v6];
  return v7;
}

- (AMSDialogRequest)initWithTitle:(id)a3 message:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(AMSDialogRequest *)self init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_title, a3);
    uint64_t v11 = AMSSetLogKeyIfNeeded();
    logKey = v10->_logKey;
    v10->_logKey = (NSString *)v11;

    objc_storeStrong((id *)&v10->_message, a4);
  }

  return v10;
}

+ (AMSDialogRequest)requestWithTitle:(id)a3 message:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithTitle:v6 message:v5];

  return (AMSDialogRequest *)v7;
}

- (AMSDialogRequest)initWithTitle:(id)a3 message:(id)a4 appearanceInfo:(id)a5
{
  id v9 = a5;
  v10 = [(AMSDialogRequest *)self initWithTitle:a3 message:a4];
  uint64_t v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_appearanceInfo, a5);
  }

  return v11;
}

- (id)description
{
  if (os_variant_has_internal_content())
  {
    v3 = [(AMSDialogRequest *)self title];
  }
  else
  {
    v3 = @"<private>";
  }
  id v4 = NSString;
  id v5 = [(AMSDialogRequest *)self identifier];
  id v6 = [(AMSDialogRequest *)self defaultAction];
  id v7 = [(AMSDialogRequest *)self buttonActions];
  id v8 = [v4 stringWithFormat:@"{ id: %@, title: %@, default: %@, actions: %@ }", v5, v3, v6, v7];

  return v8;
}

- (void)addButtonAction:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSDialogRequest *)self buttonActions];
  id v6 = (void *)[v5 mutableCopy];
  id v7 = v6;
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  id v9 = v8;

  [v9 addObject:v4];
  [(AMSDialogRequest *)self setButtonActions:v9];
}

- (void)addTextField:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSDialogRequest *)self textFields];
  id v6 = (void *)[v5 mutableCopy];
  id v7 = v6;
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  id v9 = v8;

  [v9 addObject:v4];
  [(AMSDialogRequest *)self setTextFields:v9];
}

- (id)locateActionWithIdentifier:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = [(AMSDialogRequest *)self defaultAction];
    id v6 = [v5 identifier];
    int v7 = [v6 isEqualToString:v4];

    if (v7)
    {
      id v8 = [(AMSDialogRequest *)self defaultAction];
      goto LABEL_15;
    }
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = [(AMSDialogRequest *)self buttonActions];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          v15 = [v14 identifier];
          char v16 = [v15 isEqualToString:v4];

          if (v16)
          {
            id v8 = v14;

            goto LABEL_15;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
  }
  id v8 = 0;
LABEL_15:

  return v8;
}

- (void)replaceAction:(id)a3
{
  id v19 = a3;
  id v4 = [v19 identifier];
  if (v4)
  {
    id v5 = [(AMSDialogRequest *)self defaultAction];
    id v6 = [v5 identifier];
    int v7 = [v6 isEqualToString:v4];

    if (v7) {
      [(AMSDialogRequest *)self setDefaultAction:v19];
    }
    id v8 = [(AMSDialogRequest *)self buttonActions];
    uint64_t v9 = [v8 count];

    if (v9)
    {
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = [(AMSDialogRequest *)self buttonActions];
        uint64_t v12 = [v11 objectAtIndexedSubscript:v10];

        v13 = [v12 identifier];
        int v14 = [v13 isEqualToString:v4];

        if (v14) {
          break;
        }

        ++v10;
        v15 = [(AMSDialogRequest *)self buttonActions];
        unint64_t v16 = [v15 count];

        if (v10 >= v16) {
          goto LABEL_10;
        }
      }
      v17 = [(AMSDialogRequest *)self buttonActions];
      long long v18 = (void *)[v17 mutableCopy];

      [v18 setObject:v19 atIndexedSubscript:v10];
      [(AMSDialogRequest *)self setButtonActions:v18];
    }
  }
LABEL_10:
}

- (void)encodeWithCoder:(id)a3
{
  id v35 = a3;
  id v4 = [(AMSDialogRequest *)self appearanceInfo];

  if (v4)
  {
    id v5 = [(AMSDialogRequest *)self appearanceInfo];
    [v35 encodeObject:v5 forKey:@"kCodingKeyAppearanceInfo"];
  }
  id v6 = [(AMSDialogRequest *)self buttonActions];

  if (v6)
  {
    int v7 = [(AMSDialogRequest *)self buttonActions];
    [v35 encodeObject:v7 forKey:@"kCodingKeyButtonActions"];
  }
  id v8 = [(AMSDialogRequest *)self clickstreamMetricsEvent];

  if (v8)
  {
    uint64_t v9 = [(AMSDialogRequest *)self clickstreamMetricsEvent];
    [v35 encodeObject:v9 forKey:@"kCodingKeyClickstreamMetricsEvent"];
  }
  unint64_t v10 = [(AMSDialogRequest *)self defaultAction];

  if (v10)
  {
    uint64_t v11 = [(AMSDialogRequest *)self defaultAction];
    [v35 encodeObject:v11 forKey:@"kCodingKeyDefaultAction"];
  }
  uint64_t v12 = [(AMSDialogRequest *)self iconURL];

  if (v12)
  {
    v13 = [(AMSDialogRequest *)self iconURL];
    [v35 encodeObject:v13 forKey:@"kCodingKeyIconURL"];
  }
  int v14 = [(AMSDialogRequest *)self identifier];

  if (v14)
  {
    v15 = [(AMSDialogRequest *)self identifier];
    [v35 encodeObject:v15 forKey:@"kCodingKeyIdentifier"];
  }
  unint64_t v16 = [(AMSDialogRequest *)self logKey];

  if (v16)
  {
    v17 = [(AMSDialogRequest *)self logKey];
    [v35 encodeObject:v17 forKey:@"kCodingKeyLogKey"];
  }
  long long v18 = [(AMSDialogRequest *)self message];

  if (v18)
  {
    id v19 = [(AMSDialogRequest *)self message];
    [v35 encodeObject:v19 forKey:@"kCodingKeyMessage"];
  }
  long long v20 = [(AMSDialogRequest *)self messageAccessibilityLabel];

  if (v20)
  {
    long long v21 = [(AMSDialogRequest *)self messageAccessibilityLabel];
    [v35 encodeObject:v21 forKey:@"kCodingKeyMessageAccessibilityLabel"];
  }
  v22 = [(AMSDialogRequest *)self metricsEvent];

  if (v22)
  {
    uint64_t v23 = [(AMSDialogRequest *)self metricsEvent];
    v24 = [v23 underlyingDictionary];
    [v35 encodeObject:v24 forKey:@"kCodingKeyMetrics"];
  }
  objc_msgSend(v35, "encodeInteger:forKey:", -[AMSDialogRequest style](self, "style"), @"kCodingKeyStyle");
  v25 = [(AMSDialogRequest *)self preferredButtonActionIdentifier];

  if (v25)
  {
    v26 = [(AMSDialogRequest *)self preferredButtonActionIdentifier];
    [v35 encodeObject:v26 forKey:@"preferredButtonActionIdentifier"];
  }
  objc_msgSend(v35, "encodeBool:forKey:", -[AMSDialogRequest preventsCancelButtonStyle](self, "preventsCancelButtonStyle"), @"kPreventsCancelButtonStyle");
  v27 = [(AMSDialogRequest *)self textFields];

  if (v27)
  {
    v28 = [(AMSDialogRequest *)self textFields];
    [v35 encodeObject:v28 forKey:@"kCodingKeyTextFields"];
  }
  v29 = [(AMSDialogRequest *)self title];

  if (v29)
  {
    v30 = [(AMSDialogRequest *)self title];
    [v35 encodeObject:v30 forKey:@"kCodingKeyTitle"];
  }
  v31 = [(AMSDialogRequest *)self titleAccessibilityLabel];

  if (v31)
  {
    v32 = [(AMSDialogRequest *)self titleAccessibilityLabel];
    [v35 encodeObject:v32 forKey:@"kCodingKeyTitleAccessibilityLabel"];
  }
  v33 = [(AMSDialogRequest *)self userInfo];

  if (v33)
  {
    v34 = [(AMSDialogRequest *)self userInfo];
    [v35 encodeObject:v34 forKey:@"kCodingKeyUserInfo"];
  }
}

- (AMSDialogRequest)initWithCoder:(id)a3
{
  v54[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v52.receiver = self;
  v52.super_class = (Class)AMSDialogRequest;
  id v5 = [(AMSDialogRequest *)&v52 init];
  if (v5)
  {
    id v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "ams_JSONClasses");
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"kCodingKeyAppearanceInfo"];
    appearanceInfo = v5->_appearanceInfo;
    v5->_appearanceInfo = (NSDictionary *)v7;

    uint64_t v9 = (void *)MEMORY[0x1E4F1CAD0];
    v54[0] = objc_opt_class();
    v54[1] = objc_opt_class();
    unint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:2];
    uint64_t v11 = [v9 setWithArray:v10];
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"kCodingKeyButtonActions"];
    buttonActions = v5->_buttonActions;
    v5->_buttonActions = (NSArray *)v12;

    int v14 = objc_msgSend(MEMORY[0x1E4F1CAD0], "ams_JSONClasses");
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"kCodingKeyClickstreamMetricsEvent"];
    clickstreamMetricsEvent = v5->_clickstreamMetricsEvent;
    v5->_clickstreamMetricsEvent = (NSDictionary *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCodingKeyDefaultAction"];
    defaultAction = v5->_defaultAction;
    v5->_defaultAction = (AMSDialogAction *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCodingKeyIconURL"];
    iconURL = v5->_iconURL;
    v5->_iconURL = (NSURL *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCodingKeyIdentifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCodingKeyLogKey"];
    logKey = v5->_logKey;
    v5->_logKey = (NSString *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCodingKeyMessage"];
    message = v5->_message;
    v5->_message = (NSString *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCodingKeyMessageAccessibilityLabel"];
    messageAccessibilityLabel = v5->_messageAccessibilityLabel;
    v5->_messageAccessibilityLabel = (NSString *)v27;

    v29 = objc_msgSend(MEMORY[0x1E4F1CAD0], "ams_JSONClasses");
    v30 = [v4 decodeObjectOfClasses:v29 forKey:@"kCodingKeyMetrics"];

    if (v30)
    {
      v31 = [[AMSMetricsEvent alloc] initWithUnderlyingDictionary:v30];
      metricsEvent = v5->_metricsEvent;
      v5->_metricsEvent = v31;
    }
    uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"preferredButtonActionIdentifier"];
    preferredButtonActionIdentifier = v5->_preferredButtonActionIdentifier;
    v5->_preferredButtonActionIdentifier = (NSString *)v33;

    v5->_preventsCancelButtonStyle = [v4 decodeBoolForKey:@"kPreventsCancelButtonStyle"];
    v5->_style = [v4 decodeIntegerForKey:@"kCodingKeyStyle"];
    uint64_t v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCodingKeySystemSymbolName"];
    systemSymbolName = v5->_systemSymbolName;
    v5->_systemSymbolName = (NSString *)v35;

    v37 = (void *)MEMORY[0x1E4F1CAD0];
    v53[0] = objc_opt_class();
    v53[1] = objc_opt_class();
    v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:2];
    v39 = [v37 setWithArray:v38];
    uint64_t v40 = [v4 decodeObjectOfClasses:v39 forKey:@"kCodingKeyTextFields"];
    textFields = v5->_textFields;
    v5->_textFields = (NSArray *)v40;

    uint64_t v42 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCodingKeyTitle"];
    title = v5->_title;
    v5->_title = (NSString *)v42;

    uint64_t v44 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCodingKeyTitleAccessibilityLabel"];
    titleAccessibilityLabel = v5->_titleAccessibilityLabel;
    v5->_titleAccessibilityLabel = (NSString *)v44;

    v46 = objc_msgSend(MEMORY[0x1E4F1CAD0], "ams_JSONClasses");
    v47 = [v4 decodeObjectOfClasses:v46 forKey:@"kCodingKeyUserInfo"];
    v48 = v47;
    if (v47) {
      v49 = v47;
    }
    else {
      v49 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    userInfo = v5->_userInfo;
    v5->_userInfo = v49;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[AMSDialogRequest allocWithZone:](AMSDialogRequest, "allocWithZone:") init];
  uint64_t v6 = [(AMSDialogRequest *)self appearanceInfo];
  appearanceInfo = v5->_appearanceInfo;
  v5->_appearanceInfo = (NSDictionary *)v6;

  id v8 = [(AMSDialogRequest *)self buttonActions];

  if (v8)
  {
    uint64_t v9 = [(AMSDialogRequest *)self buttonActions];
    unint64_t v10 = (void *)[v9 copyWithZone:a3];
    [(AMSDialogRequest *)v5 setButtonActions:v10];
  }
  uint64_t v11 = [(AMSDialogRequest *)self clickstreamMetricsEvent];

  if (v11)
  {
    uint64_t v12 = [(AMSDialogRequest *)self clickstreamMetricsEvent];
    v13 = (void *)[v12 copyWithZone:a3];
    [(AMSDialogRequest *)v5 setClickstreamMetricsEvent:v13];
  }
  int v14 = [(AMSDialogRequest *)self defaultAction];

  if (v14)
  {
    uint64_t v15 = [(AMSDialogRequest *)self defaultAction];
    unint64_t v16 = (void *)[v15 copyWithZone:a3];
    [(AMSDialogRequest *)v5 setDefaultAction:v16];
  }
  uint64_t v17 = [(AMSDialogRequest *)self iconURL];

  if (v17)
  {
    long long v18 = [(AMSDialogRequest *)self iconURL];
    uint64_t v19 = (void *)[v18 copyWithZone:a3];
    [(AMSDialogRequest *)v5 setIconURL:v19];
  }
  long long v20 = [(AMSDialogRequest *)self identifier];

  if (v20)
  {
    uint64_t v21 = [(AMSDialogRequest *)self identifier];
    v22 = (void *)[v21 copyWithZone:a3];
    [(AMSDialogRequest *)v5 setIdentifier:v22];
  }
  uint64_t v23 = [(AMSDialogRequest *)self logKey];

  if (v23)
  {
    v24 = [(AMSDialogRequest *)self logKey];
    uint64_t v25 = (void *)[v24 copyWithZone:a3];
    [(AMSDialogRequest *)v5 setLogKey:v25];
  }
  v26 = [(AMSDialogRequest *)self message];

  if (v26)
  {
    uint64_t v27 = [(AMSDialogRequest *)self message];
    v28 = (void *)[v27 copyWithZone:a3];
    [(AMSDialogRequest *)v5 setMessage:v28];
  }
  v29 = [(AMSDialogRequest *)self messageAccessibilityLabel];

  if (v29)
  {
    v30 = [(AMSDialogRequest *)self messageAccessibilityLabel];
    v31 = (void *)[v30 copyWithZone:a3];
    [(AMSDialogRequest *)v5 setMessage:v31];
  }
  v32 = [(AMSDialogRequest *)self metricsEvent];

  if (v32)
  {
    uint64_t v33 = [(AMSDialogRequest *)self metricsEvent];
    v34 = (void *)[v33 copyWithZone:a3];
    [(AMSDialogRequest *)v5 setMetricsEvent:v34];
  }
  uint64_t v35 = [(AMSDialogRequest *)self preferredButtonActionIdentifier];

  if (v35)
  {
    v36 = [(AMSDialogRequest *)self preferredButtonActionIdentifier];
    v37 = (void *)[v36 copyWithZone:a3];
    [(AMSDialogRequest *)v5 setPreferredButtonActionIdentifier:v37];
  }
  [(AMSDialogRequest *)v5 setPreventsCancelButtonStyle:[(AMSDialogRequest *)self preventsCancelButtonStyle]];
  [(AMSDialogRequest *)v5 setStyle:[(AMSDialogRequest *)self style]];
  v38 = [(AMSDialogRequest *)self textFields];

  if (v38)
  {
    v39 = [(AMSDialogRequest *)self textFields];
    uint64_t v40 = (void *)[v39 copyWithZone:a3];
    [(AMSDialogRequest *)v5 setTextFields:v40];
  }
  v41 = [(AMSDialogRequest *)self title];

  if (v41)
  {
    uint64_t v42 = [(AMSDialogRequest *)self title];
    v43 = (void *)[v42 copyWithZone:a3];
    [(AMSDialogRequest *)v5 setTitle:v43];
  }
  uint64_t v44 = [(AMSDialogRequest *)self titleAccessibilityLabel];

  if (v44)
  {
    v45 = [(AMSDialogRequest *)self titleAccessibilityLabel];
    v46 = (void *)[v45 copyWithZone:a3];
    [(AMSDialogRequest *)v5 setTitle:v46];
  }
  v47 = [(AMSDialogRequest *)self userInfo];

  if (v47)
  {
    v48 = [(AMSDialogRequest *)self userInfo];
    v49 = (void *)[v48 copyWithZone:a3];
    [(AMSDialogRequest *)v5 setUserInfo:v49];
  }
  return v5;
}

- (BOOL)allowsNativeWatchCancelPlacement
{
  return self->_allowsNativeWatchCancelPlacement;
}

- (void)setAllowsNativeWatchCancelPlacement:(BOOL)a3
{
  self->_allowsNativeWatchCancelPlacement = a3;
}

- (NSDictionary)appearanceInfo
{
  return self->_appearanceInfo;
}

- (NSArray)buttonActions
{
  return self->_buttonActions;
}

- (void)setButtonActions:(id)a3
{
}

- (AMSDialogAction)cancelAction
{
  return self->_cancelAction;
}

- (void)setCancelAction:(id)a3
{
}

- (NSDictionary)clickstreamMetricsEvent
{
  return self->_clickstreamMetricsEvent;
}

- (void)setClickstreamMetricsEvent:(id)a3
{
}

- (AMSDialogAction)defaultAction
{
  return self->_defaultAction;
}

- (void)setDefaultAction:(id)a3
{
}

- (NSURL)iconBundleURL
{
  return self->_iconBundleURL;
}

- (void)setIconBundleURL:(id)a3
{
}

- (NSURL)iconURL
{
  return self->_iconURL;
}

- (void)setIconURL:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)logKey
{
  return self->_logKey;
}

- (void)setLogKey:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (NSString)messageAccessibilityLabel
{
  return self->_messageAccessibilityLabel;
}

- (void)setMessageAccessibilityLabel:(id)a3
{
}

- (AMSMetricsEvent)metricsEvent
{
  return self->_metricsEvent;
}

- (void)setMetricsEvent:(id)a3
{
}

- (NSString)preferredButtonActionIdentifier
{
  return self->_preferredButtonActionIdentifier;
}

- (void)setPreferredButtonActionIdentifier:(id)a3
{
}

- (BOOL)preventsCancelButtonStyle
{
  return self->_preventsCancelButtonStyle;
}

- (void)setPreventsCancelButtonStyle:(BOOL)a3
{
  self->_preventsCancelButtonStyle = a3;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (NSString)systemSymbolName
{
  return self->_systemSymbolName;
}

- (void)setSystemSymbolName:(id)a3
{
}

- (NSArray)textFields
{
  return self->_textFields;
}

- (void)setTextFields:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)titleAccessibilityLabel
{
  return self->_titleAccessibilityLabel;
}

- (void)setTitleAccessibilityLabel:(id)a3
{
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

@end