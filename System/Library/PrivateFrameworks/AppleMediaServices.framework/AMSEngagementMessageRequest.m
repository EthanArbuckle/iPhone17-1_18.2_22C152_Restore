@interface AMSEngagementMessageRequest
- (AMSEngagementMessageAction)defaultAction;
- (AMSEngagementMessageRequest)initWithJSObject:(id)a3;
- (AMSEngagementRequest)engagementRequest;
- (AMSMetricsEvent)metricsEvent;
- (BOOL)isMessageCached;
- (NSArray)actions;
- (NSArray)debugInfo;
- (NSDictionary)appearanceInfo;
- (NSDictionary)clickstreamMetricsEvent;
- (NSString)identifier;
- (NSString)messageIdentifier;
- (NSString)subtitle;
- (NSString)subtitleAccessibilityLabel;
- (NSString)title;
- (NSString)titleAccessibilityLabel;
- (NSURL)iconURL;
- (id)makeDialogRequest;
- (int64_t)presentationAction;
- (int64_t)style;
- (void)setActions:(id)a3;
- (void)setAppearanceInfo:(id)a3;
- (void)setClickstreamMetricsEvent:(id)a3;
- (void)setDebugInfo:(id)a3;
- (void)setDefaultAction:(id)a3;
- (void)setEngagementRequest:(id)a3;
- (void)setIconURL:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsMessageCached:(BOOL)a3;
- (void)setMessageIdentifier:(id)a3;
- (void)setMetricsEvent:(id)a3;
- (void)setPresentationAction:(int64_t)a3;
- (void)setStyle:(int64_t)a3;
- (void)setSubtitle:(id)a3;
- (void)setSubtitleAccessibilityLabel:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleAccessibilityLabel:(id)a3;
@end

@implementation AMSEngagementMessageRequest

- (AMSEngagementMessageRequest)initWithJSObject:(id)a3
{
  v116[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v113.receiver = self;
  v113.super_class = (Class)AMSEngagementMessageRequest;
  v5 = [(AMSEngagementMessageRequest *)&v113 init];

  if (!v5)
  {
LABEL_104:
    v88 = v5;
    goto LABEL_105;
  }
  v6 = [v4 objectForKeyedSubscript:@"action"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  if ([v8 isEqualToString:@"present"])
  {
    v9 = [v4 objectForKeyedSubscript:@"content"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }
    id v12 = v10;

    v13 = [v12 objectForKeyedSubscript:@"appearance"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v14 = v13;
    }
    else {
      id v14 = 0;
    }
    id v90 = v14;
    id v15 = v14;

    v16 = [v4 objectForKeyedSubscript:@"debugInfo"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v17 = v16;
    }
    else {
      id v17 = 0;
    }
    id obj = v17;
    id v18 = v17;

    v19 = [v4 objectForKeyedSubscript:@"engagementRequest"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v20 = v19;
    }
    else {
      id v20 = 0;
    }
    id v21 = v20;

    v22 = [v4 objectForKeyedSubscript:@"messageIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v23 = v22;
    }
    else {
      id v23 = 0;
    }
    id v94 = v23;
    id v97 = v23;

    v24 = [v12 objectForKeyedSubscript:@"iconURL"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v25 = v24;
    }
    else {
      id v25 = 0;
    }
    id v101 = v25;

    v26 = [v12 objectForKeyedSubscript:@"identifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v27 = v26;
    }
    else {
      id v27 = 0;
    }
    id v92 = v27;
    id v96 = v27;

    v28 = [v12 objectForKeyedSubscript:@"metricsEvent"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v29 = v28;
    }
    else {
      id v29 = 0;
    }
    id v100 = v29;

    v30 = [v12 objectForKeyedSubscript:@"actions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v31 = v30;
    }
    else {
      id v31 = 0;
    }
    id v107 = v31;

    v32 = [v12 objectForKeyedSubscript:@"defaultAction"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v33 = v32;
    }
    else {
      id v33 = 0;
    }
    id v105 = v33;

    v34 = [v12 objectForKeyedSubscript:@"style"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v35 = v34;
    }
    else {
      id v35 = 0;
    }
    id v104 = v35;

    v36 = [v12 objectForKeyedSubscript:@"subtitle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v37 = v36;
    }
    else {
      id v37 = 0;
    }
    id v108 = v37;

    v38 = [v12 objectForKeyedSubscript:@"title"];
    objc_opt_class();
    id v39 = v15;
    if (objc_opt_isKindOfClass()) {
      id v40 = v38;
    }
    else {
      id v40 = 0;
    }
    id v41 = v40;

    id v106 = v41;
    if (v41)
    {
      id v103 = 0;
      v42 = v39;
    }
    else
    {
      v43 = objc_msgSend(v12, "objectForKeyedSubscript:", @"title", v90, v92, v94, v96, v97);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v44 = v43;
      }
      else {
        id v44 = 0;
      }
      id v45 = v44;

      v46 = [v45 objectForKeyedSubscript:@"value"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v47 = v46;
      }
      else {
        id v47 = 0;
      }
      v42 = v39;
      id v106 = v47;

      v48 = [v45 objectForKeyedSubscript:@"accessibilityText"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v49 = v48;
      }
      else {
        id v49 = 0;
      }
      id v103 = v49;
    }
    id v98 = v21;
    if (v108)
    {
      id v102 = 0;
    }
    else
    {
      id v50 = v18;
      v51 = v42;
      v52 = [v12 objectForKeyedSubscript:@"subtitle"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v53 = v52;
      }
      else {
        id v53 = 0;
      }
      id v54 = v53;

      v55 = [v54 objectForKeyedSubscript:@"value"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v56 = v55;
      }
      else {
        id v56 = 0;
      }
      v42 = v51;
      id v108 = v56;

      v57 = [v54 objectForKeyedSubscript:@"accessibilityText"];
      objc_opt_class();
      id v18 = v50;
      if (objc_opt_isKindOfClass()) {
        id v58 = v57;
      }
      else {
        id v58 = 0;
      }
      id v21 = v98;
      id v102 = v58;
    }
    v59 = objc_msgSend(v12, "objectForKeyedSubscript:", @"clickstreamMetricsEvent", v90);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v60 = v59;
    }
    else {
      id v60 = 0;
    }
    v61 = (NSDictionary *)v60;

    clickstreamMetricsEvent = v5->_clickstreamMetricsEvent;
    v5->_clickstreamMetricsEvent = v61;

    objc_storeStrong((id *)&v5->_debugInfo, obj);
    objc_storeStrong((id *)&v5->_messageIdentifier, v94);
    v5->_presentationAction = 1;
    objc_storeStrong((id *)&v5->_title, v106);
    objc_storeStrong((id *)&v5->_titleAccessibilityLabel, v103);
    objc_storeStrong((id *)&v5->_subtitle, v108);
    objc_storeStrong((id *)&v5->_subtitleAccessibilityLabel, v102);
    objc_storeStrong((id *)&v5->_identifier, v92);
    v63 = [v4 objectForKeyedSubscript:@"isCached"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v64 = v63;
    }
    else {
      id v64 = 0;
    }
    id v65 = v64;

    v5->_isMessageCached = [v65 BOOLValue];
    v66 = [[AMSEngagementRequest alloc] initWithJSONDictionary:v21];
    engagementRequest = v5->_engagementRequest;
    v5->_engagementRequest = v66;

    if (v18)
    {
      v68 = [(AMSEngagementRequest *)v5->_engagementRequest clientData];
      v115 = @"debugInfo";
      v116[0] = v18;
      v69 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v116 forKeys:&v115 count:1];
      v70 = objc_msgSend(v68, "ams_dictionaryByAddingEntriesFromDictionary:", v69);
      [(AMSEngagementRequest *)v5->_engagementRequest setClientData:v70];
    }
    if ([v42 count]) {
      objc_storeStrong((id *)&v5->_appearanceInfo, v91);
    }
    v72 = v100;
    v71 = v101;
    v73 = v105;
    if (v101)
    {
      uint64_t v74 = [MEMORY[0x1E4F1CB10] URLWithString:v101];
      iconURL = v5->_iconURL;
      v5->_iconURL = (NSURL *)v74;
    }
    if (v104) {
      v5->_style = [v104 integerValue];
    }
    if (v100)
    {
      v76 = [[AMSMetricsEvent alloc] initWithUnderlyingDictionary:v100];
      metricsEvent = v5->_metricsEvent;
      v5->_metricsEvent = v76;
    }
    if (v107)
    {
      id v93 = v42;
      id v95 = v8;
      v78 = [MEMORY[0x1E4F1CA48] array];
      long long v109 = 0u;
      long long v110 = 0u;
      long long v111 = 0u;
      long long v112 = 0u;
      id v79 = v107;
      uint64_t v80 = [v79 countByEnumeratingWithState:&v109 objects:v114 count:16];
      if (v80)
      {
        uint64_t v81 = v80;
        uint64_t v82 = *(void *)v110;
        do
        {
          for (uint64_t i = 0; i != v81; ++i)
          {
            if (*(void *)v110 != v82) {
              objc_enumerationMutation(v79);
            }
            v84 = [[AMSEngagementMessageAction alloc] initWithJSObject:*(void *)(*((void *)&v109 + 1) + 8 * i)];
            if (v84) {
              [v78 addObject:v84];
            }
          }
          uint64_t v81 = [v79 countByEnumeratingWithState:&v109 objects:v114 count:16];
        }
        while (v81);
      }

      if ([v78 count])
      {
        uint64_t v85 = [MEMORY[0x1E4F1C978] arrayWithArray:v78];
        actions = v5->_actions;
        v5->_actions = (NSArray *)v85;
      }
      v42 = v93;
      id v8 = v95;
      id v21 = v98;
      v72 = v100;
      v71 = v101;
      v73 = v105;
    }
    if (v73)
    {
      v87 = [[AMSEngagementMessageAction alloc] initWithJSObject:v73];
      if (v87) {
        objc_storeStrong((id *)&v5->_defaultAction, v87);
      }

      v73 = v105;
    }

    goto LABEL_104;
  }
  v11 = v5;

LABEL_105:
  return v5;
}

- (id)makeDialogRequest
{
  v36[1] = *MEMORY[0x1E4F143B8];
  if ([(AMSEngagementMessageRequest *)self presentationAction])
  {
    v3 = [AMSDialogRequest alloc];
    id v4 = [(AMSEngagementMessageRequest *)self title];
    v5 = [(AMSEngagementMessageRequest *)self subtitle];
    v6 = [(AMSEngagementMessageRequest *)self appearanceInfo];
    id v7 = [(AMSDialogRequest *)v3 initWithTitle:v4 message:v5 appearanceInfo:v6];

    id v8 = [(AMSEngagementMessageRequest *)self debugInfo];

    if (v8)
    {
      v9 = [(AMSDialogRequest *)v7 userInfo];
      id v35 = @"debugInfo";
      id v10 = [(AMSEngagementMessageRequest *)self debugInfo];
      v36[0] = v10;
      v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:&v35 count:1];
      id v12 = objc_msgSend(v9, "ams_dictionaryByAddingEntriesFromDictionary:", v11);
      [(AMSDialogRequest *)v7 setUserInfo:v12];
    }
    v13 = [(AMSEngagementMessageRequest *)self titleAccessibilityLabel];
    [(AMSDialogRequest *)v7 setTitleAccessibilityLabel:v13];

    id v14 = [(AMSEngagementMessageRequest *)self subtitleAccessibilityLabel];
    [(AMSDialogRequest *)v7 setMessageAccessibilityLabel:v14];

    id v15 = [(AMSEngagementMessageRequest *)self iconURL];
    [(AMSDialogRequest *)v7 setIconURL:v15];

    [(AMSDialogRequest *)v7 setStyle:[(AMSEngagementMessageRequest *)self style]];
    v16 = [(AMSEngagementMessageRequest *)self clickstreamMetricsEvent];
    [(AMSDialogRequest *)v7 setClickstreamMetricsEvent:v16];

    id v17 = [(AMSEngagementMessageRequest *)self metricsEvent];
    [(AMSDialogRequest *)v7 setMetricsEvent:v17];

    id v18 = [(AMSEngagementMessageRequest *)self identifier];
    [(AMSDialogRequest *)v7 setIdentifier:v18];

    v19 = [(AMSEngagementMessageRequest *)self actions];

    if (v19)
    {
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v20 = [(AMSEngagementMessageRequest *)self actions];
      uint64_t v21 = [v20 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v31 != v23) {
              objc_enumerationMutation(v20);
            }
            id v25 = [*(id *)(*((void *)&v30 + 1) + 8 * i) makeDialogAction];
            if (v25) {
              [(AMSDialogRequest *)v7 addButtonAction:v25];
            }
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v30 objects:v34 count:16];
        }
        while (v22);
      }
    }
    v26 = [(AMSEngagementMessageRequest *)self defaultAction];

    if (v26)
    {
      id v27 = [(AMSEngagementMessageRequest *)self defaultAction];
      v28 = [v27 makeDialogAction];

      [(AMSDialogRequest *)v7 setDefaultAction:v28];
    }
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
}

- (NSDictionary)appearanceInfo
{
  return self->_appearanceInfo;
}

- (void)setAppearanceInfo:(id)a3
{
}

- (NSDictionary)clickstreamMetricsEvent
{
  return self->_clickstreamMetricsEvent;
}

- (void)setClickstreamMetricsEvent:(id)a3
{
}

- (AMSEngagementMessageAction)defaultAction
{
  return self->_defaultAction;
}

- (void)setDefaultAction:(id)a3
{
}

- (AMSEngagementRequest)engagementRequest
{
  return self->_engagementRequest;
}

- (void)setEngagementRequest:(id)a3
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

- (BOOL)isMessageCached
{
  return self->_isMessageCached;
}

- (void)setIsMessageCached:(BOOL)a3
{
  self->_isMessageCached = a3;
}

- (NSString)messageIdentifier
{
  return self->_messageIdentifier;
}

- (void)setMessageIdentifier:(id)a3
{
}

- (AMSMetricsEvent)metricsEvent
{
  return self->_metricsEvent;
}

- (void)setMetricsEvent:(id)a3
{
}

- (int64_t)presentationAction
{
  return self->_presentationAction;
}

- (void)setPresentationAction:(int64_t)a3
{
  self->_presentationAction = a3;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)subtitleAccessibilityLabel
{
  return self->_subtitleAccessibilityLabel;
}

- (void)setSubtitleAccessibilityLabel:(id)a3
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

- (NSArray)debugInfo
{
  return self->_debugInfo;
}

- (void)setDebugInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugInfo, 0);
  objc_storeStrong((id *)&self->_titleAccessibilityLabel, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_subtitleAccessibilityLabel, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_metricsEvent, 0);
  objc_storeStrong((id *)&self->_messageIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_iconURL, 0);
  objc_storeStrong((id *)&self->_engagementRequest, 0);
  objc_storeStrong((id *)&self->_defaultAction, 0);
  objc_storeStrong((id *)&self->_clickstreamMetricsEvent, 0);
  objc_storeStrong((id *)&self->_appearanceInfo, 0);
  objc_storeStrong((id *)&self->_actions, 0);
}

@end