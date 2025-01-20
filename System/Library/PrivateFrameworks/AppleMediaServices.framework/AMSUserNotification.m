@interface AMSUserNotification
+ (AMSBagKeySet)bagKeySet;
+ (BOOL)_canParseNotificationWithIdentifier:(id)a3 userInfo:(id)a4;
+ (BOOL)shouldDeleteNotificationForPayload:(id)a3 outIdentifier:(id *)a4 scheduledOnly:(BOOL *)a5;
+ (BOOL)shouldHandleNotificationResponse:(id)a3;
+ (BOOL)shouldHandleServiceExtensionNotificationRequest:(id)a3;
+ (NSString)bagSubProfile;
+ (NSString)bagSubProfileVersion;
+ (id)_cachedImagePathForIdentifier:(id)a3 assetURL:(id)a4;
+ (id)_dateFromString:(id)a3;
+ (id)_downloadAssetAtUrl:(id)a3 withIdentifier:(id)a4 logKey:(id)a5 bag:(id)a6;
+ (id)_identifierFromPayload:(id)a3;
+ (id)createBagForSubProfile;
+ (id)handleNotificationResponse:(id)a3 bag:(id)a4;
+ (id)handleNotificationResponse:(id)a3 bagContract:(id)a4;
+ (id)notificationCenter:(id)a3 didChangeSettings:(id)a4 bag:(id)a5;
+ (id)notificationCenter:(id)a3 openSettingsForNotification:(id)a4 bag:(id)a5;
+ (id)notificationWithPayload:(id)a3 andConfig:(id)a4;
+ (void)handleServiceExtensionNotificationRequest:(id)a3 bag:(id)a4 withContentHandler:(id)a5;
+ (void)openAppUsingBundleIdentifier:(id)a3;
- (ACAccount)account;
- (AMSUserNotification)init;
- (AMSUserNotification)initWithPayload:(id)a3 andConfig:(id)a4;
- (AMSUserNotification)initWithTitle:(id)a3;
- (AMSUserNotification)initWithTitle:(id)a3 intent:(int64_t)a4;
- (AMSUserNotification)initWithUNNotification:(id)a3;
- (AMSUserNotificationAction)defaultAction;
- (BOOL)anonymizeMetrics;
- (BOOL)explicitContent;
- (BOOL)shouldSuppressDefaultAction;
- (NSArray)buttonActions;
- (NSDate)scheduledTime;
- (NSDictionary)metricsEvent;
- (NSMutableDictionary)userInfo;
- (NSSet)subsections;
- (NSString)categoryIdentifier;
- (NSString)centerBundleIdentifier;
- (NSString)identifier;
- (NSString)informativeText;
- (NSString)logKey;
- (NSString)subtitle;
- (NSString)threadIdentifier;
- (NSString)title;
- (NSURL)artworkUrl;
- (NSURL)videoUrl;
- (id)_generatePayloadWithBase:(id)a3;
- (id)createNSUserNotification;
- (id)createUNNotificationActions;
- (id)createUNNotificationContent;
- (id)createUNNotificationRequestFromContent:(id)a3;
- (id)determineSelectedActionFromResponse:(id)a3 error:(id *)a4;
- (id)handleSelectedButton:(id)a3 bag:(id)a4;
- (id)handleSelectedButton:(id)a3 bagContract:(id)a4;
- (int64_t)intent;
- (unint64_t)interruptionLevel;
- (void)addButtonAction:(id)a3;
- (void)setAccount:(id)a3;
- (void)setAnonymizeMetrics:(BOOL)a3;
- (void)setArtworkUrl:(id)a3;
- (void)setButtonActions:(id)a3;
- (void)setCategoryIdentifier:(id)a3;
- (void)setCenterBundleIdentifier:(id)a3;
- (void)setDefaultAction:(id)a3;
- (void)setExplicitContent:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setInformativeText:(id)a3;
- (void)setIntent:(int64_t)a3;
- (void)setInterruptionLevel:(unint64_t)a3;
- (void)setLogKey:(id)a3;
- (void)setMetricsEvent:(id)a3;
- (void)setScheduledTime:(id)a3;
- (void)setShouldSuppressDefaultAction:(BOOL)a3;
- (void)setSubsections:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setThreadIdentifier:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUserInfo:(id)a3;
- (void)setVideoUrl:(id)a3;
@end

@implementation AMSUserNotification

- (AMSUserNotification)init
{
  v3.receiver = self;
  v3.super_class = (Class)AMSUserNotification;
  result = [(AMSUserNotification *)&v3 init];
  if (result) {
    result->_interruptionLevel = *MEMORY[0x1E4F446E8];
  }
  return result;
}

- (AMSUserNotification)initWithTitle:(id)a3
{
  return [(AMSUserNotification *)self initWithTitle:a3 intent:0];
}

- (AMSUserNotification)initWithTitle:(id)a3 intent:(int64_t)a4
{
  id v7 = a3;
  v8 = [(AMSUserNotification *)self init];
  if (v8)
  {
    v9 = NSString;
    v10 = [MEMORY[0x1E4F29128] UUID];
    v11 = [v10 UUIDString];
    uint64_t v12 = [v9 stringWithFormat:@"%@%@", @"ams_", v11];
    categoryIdentifier = v8->_categoryIdentifier;
    v8->_categoryIdentifier = (NSString *)v12;

    v14 = NSString;
    v15 = [MEMORY[0x1E4F29128] UUID];
    v16 = [v15 UUIDString];
    uint64_t v17 = [v14 stringWithFormat:@"%@%@", @"ams_", v16];
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v17;

    v8->_intent = a4;
    uint64_t v19 = AMSGenerateLogCorrelationKey();
    logKey = v8->_logKey;
    v8->_logKey = (NSString *)v19;

    objc_storeStrong((id *)&v8->_title, a3);
    v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    userInfo = v8->_userInfo;
    v8->_userInfo = v21;
  }
  return v8;
}

+ (id)notificationWithPayload:(id)a3 andConfig:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[AMSUserNotification alloc] initWithPayload:v6 andConfig:v5];

  return v7;
}

- (AMSUserNotification)initWithPayload:(id)a3 andConfig:(id)a4
{
  uint64_t v197 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(AMSUserNotification *)self init];

  if (!v8) {
    goto LABEL_138;
  }
  v9 = [v6 aps];
  v10 = [v9 objectForKeyedSubscript:@"alert"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;

  if (v12)
  {
    v13 = [v12 objectForKeyedSubscript:@"body"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v14 = v13;
    }
    else {
      id v14 = 0;
    }
    id v18 = v14;

    informativeText = v8->_informativeText;
    v8->_informativeText = (NSString *)v18;

    v20 = [v12 objectForKeyedSubscript:@"level"];
    if (objc_opt_respondsToSelector())
    {
      v21 = [v12 objectForKeyedSubscript:@"level"];
      v8->_interruptionLevel = [v21 integerValue];
    }
    else
    {
      v8->_interruptionLevel = 1;
    }

    v22 = [v12 objectForKeyedSubscript:@"subtitle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v23 = v22;
    }
    else {
      id v23 = 0;
    }
    id v24 = v23;

    subtitle = v8->_subtitle;
    v8->_subtitle = (NSString *)v24;

    v26 = [v12 objectForKeyedSubscript:@"title"];
  }
  else
  {
    v15 = [v6 aps];
    v16 = [v15 objectForKeyedSubscript:@"text"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v17 = v16;
    }
    else {
      id v17 = 0;
    }
    id v27 = v17;

    v28 = v8->_informativeText;
    v8->_informativeText = (NSString *)v27;

    v29 = [v6 aps];
    v30 = [v29 objectForKeyedSubscript:@"_lv"];
    if (objc_opt_respondsToSelector())
    {
      v31 = [v6 aps];
      v32 = [v31 objectForKeyedSubscript:@"_lv"];
      v8->_interruptionLevel = [v32 integerValue];
    }
    else
    {
      v8->_interruptionLevel = 1;
    }

    v33 = [v6 aps];
    v34 = [v33 objectForKeyedSubscript:@"_sb"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v35 = v34;
    }
    else {
      id v35 = 0;
    }
    id v36 = v35;

    v37 = v8->_subtitle;
    v8->_subtitle = (NSString *)v36;

    v38 = [v6 aps];
    v26 = [v38 objectForKeyedSubscript:@"title"];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v39 = v26;
  }
  else {
    id v39 = 0;
  }
  v40 = (__CFString *)v39;

  v41 = &stru_1EDCA7308;
  if (v40) {
    v41 = v40;
  }
  v42 = v41;
  title = v8->_title;
  v8->_title = &v42->isa;

  uint64_t v44 = [v6 account];
  account = v8->_account;
  v8->_account = (ACAccount *)v44;

  uint64_t v46 = [v6 clientIdentifier];
  centerBundleIdentifier = v8->_centerBundleIdentifier;
  v8->_centerBundleIdentifier = (NSString *)v46;

  v48 = [v6 objectForKeyedSubscript:@"_logKey"];
  v49 = v48;
  if (v48)
  {
    v50 = v48;
    logKey = v8->_logKey;
    v8->_logKey = v50;
  }
  else
  {
    logKey = [v6 logKey];
    objc_storeStrong((id *)&v8->_logKey, logKey);
  }

  v52 = [v6 aps];
  uint64_t v53 = [v52 objectForKeyedSubscript:@"thread"];
  threadIdentifier = v8->_threadIdentifier;
  v8->_threadIdentifier = (NSString *)v53;

  v55 = [v6 aps];
  v56 = [v55 objectForKeyedSubscript:@"_st"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v57 = v56;
  }
  else {
    id v57 = 0;
  }
  id v58 = v57;

  if (v58)
  {
    uint64_t v59 = +[AMSUserNotification _dateFromString:v58];
    scheduledTime = v8->_scheduledTime;
    v8->_scheduledTime = (NSDate *)v59;
  }
  v61 = [v6 aps];
  v62 = [v61 objectForKeyedSubscript:@"_sd"];

  v183 = v58;
  if (objc_opt_respondsToSelector()) {
    char v63 = [v62 BOOLValue];
  }
  else {
    char v63 = 0;
  }
  v8->_shouldSuppressDefaultAction = v63;
  v64 = [v6 aps];
  uint64_t v65 = [v64 objectForKeyedSubscript:@"_ss"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v66 = [MEMORY[0x1E4F1CAD0] setWithObject:v65];
LABEL_46:
    subsections = v8->_subsections;
    v8->_subsections = (NSSet *)v66;

    goto LABEL_47;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v66 = [MEMORY[0x1E4F1CAD0] setWithArray:v65];
    goto LABEL_46;
  }
LABEL_47:
  v68 = [v6 aps];
  uint64_t v69 = [v68 objectForKeyedSubscript:@"category"];
  categoryIdentifier = v8->_categoryIdentifier;
  v8->_categoryIdentifier = (NSString *)v69;

  if (!v8->_categoryIdentifier)
  {
    uint64_t v71 = [v7 userNotificationExtensionId];
    v72 = v8->_categoryIdentifier;
    v8->_categoryIdentifier = (NSString *)v71;
  }
  uint64_t v73 = +[AMSUserNotification _identifierFromPayload:v6];
  identifier = v8->_identifier;
  v8->_identifier = (NSString *)v73;

  v75 = [v6 aps];
  v76 = [v75 objectForKeyedSubscript:@"_ex"];

  v179 = v12;
  v176 = v76;
  if (objc_opt_respondsToSelector()) {
    char v77 = [v76 BOOLValue];
  }
  else {
    char v77 = 0;
  }
  v177 = (void *)v65;
  v178 = v62;
  id v180 = v7;
  v8->_explicitContent = v77;
  v78 = [v6 aps];
  uint64_t v79 = [v78 objectForKeyedSubscript:@"_an"];
  v80 = (void *)v79;
  v81 = (void *)MEMORY[0x1E4F1CC28];
  if (v79) {
    v81 = (void *)v79;
  }
  id v82 = v81;

  v175 = v82;
  v8->_anonymizeMetrics = [v82 BOOLValue];
  v83 = [v6 aps];
  uint64_t v84 = [v83 objectForKeyedSubscript:@"_au"];
  v85 = (void *)v84;
  v86 = &stru_1EDCA7308;
  if (v84) {
    v86 = (__CFString *)v84;
  }
  v87 = v86;

  v174 = v87;
  uint64_t v88 = [MEMORY[0x1E4F1CB10] URLWithString:v87];
  artworkUrl = v8->_artworkUrl;
  v8->_artworkUrl = (NSURL *)v88;

  v90 = [v6 aps];
  id v91 = [v90 objectForKeyedSubscript:@"_vu"];

  v173 = v91;
  uint64_t v92 = [MEMORY[0x1E4F1CB10] URLWithString:v91];
  videoUrl = v8->_videoUrl;
  v184 = v8;
  v8->_videoUrl = (NSURL *)v92;

  id v181 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [MEMORY[0x1E4F1CA48] array];
  v186 = v185 = v6;
  v94 = [v6 aps];
  v95 = [v94 objectForKeyedSubscript:@"_ba"];

  long long v194 = 0u;
  long long v195 = 0u;
  long long v192 = 0u;
  long long v193 = 0u;
  id obj = v95;
  unint64_t v96 = 0x1E4F29000uLL;
  uint64_t v189 = [obj countByEnumeratingWithState:&v192 objects:v196 count:16];
  if (v189)
  {
    uint64_t v187 = *(void *)v193;
    v188 = 0;
    do
    {
      for (uint64_t i = 0; i != v189; ++i)
      {
        if (*(void *)v193 != v187) {
          objc_enumerationMutation(obj);
        }
        v98 = *(void **)(*((void *)&v192 + 1) + 8 * i);
        v99 = [v98 objectForKeyedSubscript:@"_tl"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v100 = v99;
        }
        else {
          id v100 = 0;
        }
        v101 = (__CFString *)v100;

        v102 = &stru_1EDCA7308;
        if (v101) {
          v102 = v101;
        }
        v103 = v102;

        v191 = v103;
        v104 = [[AMSUserNotificationAction alloc] initWithTitle:v103];
        v105 = [v98 objectForKeyedSubscript:@"_id"];
        [(AMSUserNotificationAction *)v104 setIdentifier:v105];

        v106 = [(AMSUserNotificationAction *)v104 identifier];

        if (!v106)
        {
          v107 = *(void **)(v96 + 24);
          v108 = [MEMORY[0x1E4F29128] UUID];
          v109 = [v108 UUIDString];
          v110 = [v107 stringWithFormat:@"%@%@", @"ams_", v109];
          [(AMSUserNotificationAction *)v104 setIdentifier:v110];
        }
        uint64_t v111 = [v98 objectForKeyedSubscript:@"_mt"];
        if (v111)
        {
          [v186 addObject:v111];
          v112 = [v185 clientIdentifier];
          v113 = +[AMSUserNotificationMetricsEvent eventFromMetricsDictionary:v111 centerBundleId:v112];

          objc_msgSend(v113, "setAnonymous:", -[AMSUserNotification anonymizeMetrics](v184, "anonymizeMetrics"));
          [v113 setDisplayScheduledTime:v183];
          [v113 setPostedSuccessfully:1];
          [(AMSUserNotificationAction *)v104 setMetricsEvent:v113];
        }
        v114 = [v98 objectForKeyedSubscript:@"_ru"];
        objc_opt_class();
        v190 = (void *)v111;
        if (objc_opt_isKindOfClass()) {
          id v115 = v114;
        }
        else {
          id v115 = 0;
        }
        id v116 = v115;

        if (v116)
        {
          id v117 = [MEMORY[0x1E4F1CB10] URLWithString:v116];

          if (v117)
          {
            v118 = [v98 objectForKeyedSubscript:@"_rm"];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              id v119 = v118;
            }
            else {
              id v119 = 0;
            }
            v120 = (__CFString *)v119;

            v121 = @"GET";
            if (v120) {
              v121 = v120;
            }
            v122 = v121;

            v123 = [v98 objectForKeyedSubscript:@"_rh"];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              id v124 = v123;
            }
            else {
              id v124 = 0;
            }
            id v125 = v124;

            v126 = (void *)MEMORY[0x1E4F1CC08];
            if (v125) {
              v126 = v125;
            }
            id v127 = v126;

            v128 = [v98 objectForKeyedSubscript:@"_rb"];
            v129 = (void *)[objc_alloc(MEMORY[0x1E4F18D50]) initWithURL:v117];
            [v129 setHTTPMethod:v122];
            [v129 setAllHTTPHeaderFields:v127];
            if (v128)
            {
              v130 = [v128 dataUsingEncoding:4];
              [v129 setHTTPBody:v130];
            }
            [(AMSUserNotificationAction *)v104 setRequest:v129];
          }
        }
        else
        {
          id v117 = 0;
        }
        v131 = [v98 objectForKeyedSubscript:@"_url"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v132 = v131;
        }
        else {
          id v132 = 0;
        }
        id v133 = v132;

        if (v133)
        {
          v134 = [MEMORY[0x1E4F1CB10] URLWithString:v133];
          [(AMSUserNotificationAction *)v104 setDefaultURL:v134];
        }
        v135 = [v98 objectForKeyedSubscript:@"_tp"];
        if (objc_opt_respondsToSelector()) {
          uint64_t v136 = [v135 integerValue];
        }
        else {
          uint64_t v136 = 0;
        }
        v137 = [v98 objectForKeyedSubscript:@"_gl"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v138 = v137;
        }
        else {
          id v138 = 0;
        }
        id v139 = v138;

        [(AMSUserNotificationAction *)v104 setSystemImageName:v139];
        v140 = [v98 objectForKeyedSubscript:@"_ci"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v141 = v140;
        }
        else {
          id v141 = 0;
        }
        id v142 = v141;

        [(AMSUserNotificationAction *)v104 setClientIdentifier:v142];
        v143 = [v98 objectForKeyedSubscript:@"_mru"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v144 = v143;
        }
        else {
          id v144 = 0;
        }
        id v145 = v144;

        if (v145)
        {
          v146 = [MEMORY[0x1E4F1CB10] URLWithString:v145];
          [(AMSUserNotificationAction *)v104 setMediaApiRequestURL:v146];
        }
        else
        {
          [(AMSUserNotificationAction *)v104 setMediaApiRequestURL:0];
        }
        if (v136 == 1)
        {
          v147 = v104;

          v188 = v147;
        }
        else
        {
          [v181 addObject:v104];
        }

        unint64_t v96 = 0x1E4F29000;
      }
      uint64_t v189 = [obj countByEnumeratingWithState:&v192 objects:v196 count:16];
    }
    while (v189);
  }
  else
  {
    v188 = 0;
  }

  id v6 = v185;
  v148 = [v185 aps];
  uint64_t v149 = [v148 objectForKeyedSubscript:@"_mt"];
  v8 = v184;
  p_metricsEvent = (id *)&v184->_metricsEvent;
  metricsEvent = v184->_metricsEvent;
  v184->_metricsEvent = (NSDictionary *)v149;

  if ([v186 count] && *p_metricsEvent)
  {
    v152 = (void *)[*p_metricsEvent mutableCopy];
    [v152 setObject:v186 forKeyedSubscript:@"options"];
    objc_storeStrong(p_metricsEvent, v152);
  }
  v153 = [v185 aps];
  v154 = [v153 objectForKeyedSubscript:@"tapUrl"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v155 = v154;
  }
  else {
    id v155 = 0;
  }
  id v156 = v155;

  id v7 = v180;
  v157 = v188;
  if (!v188 && v156)
  {
    v158 = [MEMORY[0x1E4F1CB10] URLWithString:v156];
    if (v158)
    {
      v159 = objc_alloc_init(AMSUserNotificationAction);
      [(AMSUserNotificationAction *)v159 setDefaultURL:v158];
    }
    else
    {
      v159 = 0;
    }

    v157 = v159;
  }
  v160 = v181;
  if (v157) {
    goto LABEL_129;
  }
  v162 = [v185 URLString];

  if (!v162
    || (v163 = (void *)MEMORY[0x1E4F1CB10],
        [v185 URLString],
        v164 = objc_claimAutoreleasedReturnValue(),
        [v163 URLWithString:v164],
        v165 = objc_claimAutoreleasedReturnValue(),
        v164,
        !v165))
  {
    v161 = 0;
    v160 = v181;
    goto LABEL_135;
  }
  v166 = objc_alloc_init(AMSUserNotificationAction);
  [(AMSUserNotificationAction *)v166 setDefaultURL:v165];

  v157 = v166;
  v160 = v181;
  if (v166)
  {
LABEL_129:
    v161 = v157;
    objc_storeStrong((id *)&v184->_defaultAction, v157);
  }
  else
  {
    v161 = 0;
  }
LABEL_135:
  if ([v160 count]) {
    objc_storeStrong((id *)&v184->_buttonActions, v160);
  }
  [v185 payload];
  v168 = v167 = v160;
  uint64_t v169 = [v168 mutableCopy];
  userInfo = v184->_userInfo;
  v184->_userInfo = (NSMutableDictionary *)v169;

LABEL_138:
  v171 = v8;

  return v171;
}

- (AMSUserNotification)initWithUNNotification:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 request];
  id v6 = [v5 content];
  id v7 = [v6 userInfo];

  v8 = [[AMSPushPayload alloc] initWithPayload:v7];
  v9 = [(AMSUserNotification *)self initWithPayload:v8 andConfig:0];
  if (!v9)
  {
LABEL_6:
    id v18 = v9;
    goto LABEL_12;
  }
  if (+[AMSUserNotification _canParseNotificationWithIdentifier:v9->_identifier userInfo:v7])
  {
    v10 = [v4 request];
    id v11 = [v10 content];

    id v12 = [v11 attachments];
    uint64_t v13 = [v12 count];

    if (v13)
    {
      id v14 = [v11 attachments];
      v15 = [v14 objectAtIndexedSubscript:0];
      uint64_t v16 = [v15 URL];
      artworkUrl = v9->_artworkUrl;
      v9->_artworkUrl = (NSURL *)v16;
    }
    goto LABEL_6;
  }
  uint64_t v19 = +[AMSLogConfig sharedUserNotificationConfig];
  if (!v19)
  {
    uint64_t v19 = +[AMSLogConfig sharedConfig];
  }
  v20 = [v19 OSLogObject];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    v21 = objc_opt_class();
    logKey = v9->_logKey;
    identifier = v9->_identifier;
    int v26 = 138543874;
    id v27 = v21;
    __int16 v28 = 2114;
    v29 = logKey;
    __int16 v30 = 2114;
    v31 = identifier;
    id v24 = v21;
    _os_log_impl(&dword_18D554000, v20, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Not allowed to operate on a NSUserNotification that did not originate from AMS. Identifier: %{public}@", (uint8_t *)&v26, 0x20u);
  }
  id v18 = 0;
LABEL_12:

  return v18;
}

- (id)createNSUserNotification
{
  return 0;
}

- (id)createUNNotificationActions
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = [(AMSUserNotification *)self buttonActions];
  uint64_t v4 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v9 = [v8 systemImageName];

        if (v9)
        {
          v10 = (void *)MEMORY[0x1E4F445E8];
          id v11 = [v8 systemImageName];
          v9 = [v10 iconWithSystemImageName:v11];
        }
        id v12 = (void *)MEMORY[0x1E4F445D8];
        uint64_t v13 = [v8 identifier];
        id v14 = [v8 title];
        v15 = objc_msgSend(v12, "actionWithIdentifier:title:options:icon:", v13, v14, objc_msgSend(v8, "un_ActionOptions"), v9);

        [v3 addObject:v15];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v5);
  }

  uint64_t v16 = (void *)[v3 copy];
  return v16;
}

- (id)createUNNotificationContent
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F445B0]);
  uint64_t v4 = [(AMSUserNotification *)self informativeText];
  [v3 setBody:v4];

  uint64_t v5 = [(AMSUserNotification *)self categoryIdentifier];
  [v3 setCategoryIdentifier:v5];

  uint64_t v6 = [(AMSUserNotification *)self threadIdentifier];
  [v3 setThreadIdentifier:v6];

  id v7 = [(AMSUserNotification *)self title];
  [v3 setTitle:v7];

  v8 = [(AMSUserNotification *)self subtitle];
  [v3 setSubtitle:v8];

  v9 = [(AMSUserNotification *)self userInfo];
  v10 = [(AMSUserNotification *)self _generatePayloadWithBase:v9];
  [v3 setUserInfo:v10];

  objc_msgSend(v3, "setInterruptionLevel:", -[AMSUserNotification interruptionLevel](self, "interruptionLevel"));
  objc_msgSend(v3, "setShouldSuppressDefaultAction:", -[AMSUserNotification shouldSuppressDefaultAction](self, "shouldSuppressDefaultAction"));
  id v11 = [(AMSUserNotification *)self defaultAction];

  if (v11)
  {
    [v3 setShouldBackgroundDefaultAction:1];
    [v3 setShouldAuthenticateDefaultAction:1];
  }
  id v12 = [(AMSUserNotification *)self subsections];

  if (v12)
  {
    uint64_t v13 = [(AMSUserNotification *)self subsections];
    [v3 setTopicIdentifiers:v13];
  }
  return v3;
}

- (id)createUNNotificationRequestFromContent:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(AMSUserNotification *)self scheduledTime];

  if (v5)
  {
    uint64_t v6 = [(AMSUserNotification *)self scheduledTime];
    [v6 timeIntervalSinceNow];
    double v8 = v7;

    uint64_t v9 = +[AMSLogConfig sharedUserNotificationConfig];
    v10 = (void *)v9;
    if (v8 >= 0.0)
    {
      if (!v9)
      {
        v10 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v16 = [v10 OSLogObject];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = objc_opt_class();
        id v18 = AMSLogKey();
        long long v19 = [(AMSUserNotification *)self scheduledTime];
        int v26 = 138543874;
        uint64_t v27 = v17;
        __int16 v28 = 2114;
        v29 = v18;
        __int16 v30 = 2114;
        v31 = v19;
        _os_log_impl(&dword_18D554000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Scheduling notification for time: %{public}@", (uint8_t *)&v26, 0x20u);
      }
      long long v20 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      long long v21 = [(AMSUserNotification *)self scheduledTime];
      v10 = [v20 components:252 fromDate:v21];

      v15 = [MEMORY[0x1E4F44588] triggerWithDateMatchingComponents:v10 repeats:0];
    }
    else
    {
      if (!v9)
      {
        v10 = +[AMSLogConfig sharedConfig];
      }
      id v11 = [v10 OSLogObject];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = objc_opt_class();
        uint64_t v13 = AMSLogKey();
        id v14 = [(AMSUserNotification *)self scheduledTime];
        int v26 = 138543874;
        uint64_t v27 = v12;
        __int16 v28 = 2114;
        v29 = v13;
        __int16 v30 = 2114;
        v31 = v14;
        _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Notification scheduled time %{public}@ has passed, ignoring schedule.", (uint8_t *)&v26, 0x20u);
      }
      v15 = 0;
    }
  }
  else
  {
    v15 = 0;
  }
  long long v22 = (void *)MEMORY[0x1E4F44628];
  id v23 = [(AMSUserNotification *)self identifier];
  uint64_t v24 = [v22 requestWithIdentifier:v23 content:v4 trigger:v15];

  return v24;
}

- (void)addButtonAction:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AMSUserNotification *)self buttonActions];
  uint64_t v6 = (void *)[v5 mutableCopy];
  double v7 = v6;
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  id v9 = v8;

  [v9 addObject:v4];
  [(AMSUserNotification *)self setButtonActions:v9];
}

- (id)determineSelectedActionFromResponse:(id)a3 error:(id *)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = [(AMSUserNotification *)self logKey];
  id v8 = AMSSetLogKey(v7);

  id v9 = [v6 actionIdentifier];
  int v10 = [v9 isEqualToString:*MEMORY[0x1E4F446D0]];

  if (v10)
  {
    uint64_t v11 = [(AMSUserNotification *)self defaultAction];
    uint64_t v12 = +[AMSLogConfig sharedUserNotificationConfig];
    uint64_t v13 = (void *)v12;
    if (v11)
    {
      if (!v12)
      {
        uint64_t v13 = +[AMSLogConfig sharedConfig];
      }
      id v14 = [v13 OSLogObject];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = [(AMSUserNotification *)self logKey];
        *(_DWORD *)buf = 138543618;
        v45 = self;
        __int16 v46 = 2114;
        v47 = v15;
        _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Default action selected", buf, 0x16u);
      }
      uint64_t v16 = 0;
      goto LABEL_39;
    }
    if (!v12)
    {
      uint64_t v13 = +[AMSLogConfig sharedConfig];
    }
    v31 = [v13 OSLogObject];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v32 = [(AMSUserNotification *)self logKey];
      *(_DWORD *)buf = 138543618;
      v45 = self;
      __int16 v46 = 2114;
      v47 = v32;
      _os_log_impl(&dword_18D554000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Default action selected, but action not defined", buf, 0x16u);
    }
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v17 = [v6 actionIdentifier];
    int v18 = [v17 isEqualToString:*MEMORY[0x1E4F446E0]];

    if (v18)
    {
      long long v19 = +[AMSLogConfig sharedUserNotificationConfig];
      if (!v19)
      {
        long long v19 = +[AMSLogConfig sharedConfig];
      }
      long long v20 = [v19 OSLogObject];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        long long v21 = [(AMSUserNotification *)self logKey];
        *(_DWORD *)buf = 138543618;
        v45 = self;
        __int16 v46 = 2114;
        v47 = v21;
        _os_log_impl(&dword_18D554000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] User dismissed alert", buf, 0x16u);
      }
      uint64_t v16 = AMSError(6, @"User Notification Cancelled", @"Cancel action selected", 0);
      uint64_t v11 = 0;
      goto LABEL_37;
    }
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v22 = [(AMSUserNotification *)self buttonActions];
    uint64_t v11 = [v22 countByEnumeratingWithState:&v40 objects:v50 count:16];
    if (v11)
    {
      v37 = self;
      v38 = a4;
      int v23 = 0;
      uint64_t v24 = *(void *)v41;
      while (2)
      {
        uint64_t v25 = 0;
        int v39 = v23 + v11;
        do
        {
          if (*(void *)v41 != v24) {
            objc_enumerationMutation(v22);
          }
          int v26 = *(void **)(*((void *)&v40 + 1) + 8 * v25);
          uint64_t v27 = [v26 identifier];
          __int16 v28 = [v6 actionIdentifier];
          int v29 = [v27 isEqualToString:v28];

          if (v29)
          {
            uint64_t v11 = v26;
            int v30 = v23 + v25;
            goto LABEL_29;
          }
          ++v25;
        }
        while (v11 != v25);
        uint64_t v11 = [v22 countByEnumeratingWithState:&v40 objects:v50 count:16];
        int v30 = v39;
        int v23 = v39;
        if (v11) {
          continue;
        }
        break;
      }
LABEL_29:
      self = v37;
      a4 = v38;
    }
    else
    {
      int v30 = 0;
    }

    v33 = +[AMSLogConfig sharedUserNotificationConfig];
    if (!v33)
    {
      v33 = +[AMSLogConfig sharedConfig];
    }
    v34 = [v33 OSLogObject];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      id v35 = [(AMSUserNotification *)self logKey];
      *(_DWORD *)buf = 138543874;
      v45 = self;
      __int16 v46 = 2114;
      v47 = v35;
      __int16 v48 = 1024;
      int v49 = v30;
      _os_log_impl(&dword_18D554000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] User selected button index: %d", buf, 0x1Cu);
    }
  }
  uint64_t v16 = 0;
LABEL_37:
  if (!(v11 | v16))
  {
    uint64_t v16 = AMSError(7, @"User Notification Failure", @"Action not found", 0);
    uint64_t v11 = 0;
  }
LABEL_39:
  if (a4) {
    *a4 = (id) v16;
  }

  return (id)v11;
}

+ (id)handleNotificationResponse:(id)a3 bag:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(AMSMutableBinaryPromise);
  id v9 = dispatch_get_global_queue(0, 0);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __54__AMSUserNotification_handleNotificationResponse_bag___block_invoke;
  v16[3] = &unk_1E55A3F18;
  id v20 = a1;
  id v17 = v6;
  int v10 = v8;
  int v18 = v10;
  id v19 = v7;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(v9, v16);

  uint64_t v13 = v19;
  id v14 = v10;

  return v14;
}

void __54__AMSUserNotification_handleNotificationResponse_bag___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 56) shouldHandleNotificationResponse:*(void *)(a1 + 32)])
  {
    v2 = [AMSUserNotification alloc];
    id v3 = [*(id *)(a1 + 32) notification];
    id v4 = [(AMSUserNotification *)v2 initWithUNNotification:v3];

    uint64_t v5 = *(void *)(a1 + 32);
    id v13 = 0;
    id v6 = [(AMSUserNotification *)v4 determineSelectedActionFromResponse:v5 error:&v13];
    id v7 = v13;
    if ([v7 code] != 6)
    {
      id v8 = [v6 request];
      if (v8)
      {
      }
      else
      {
        id v9 = [v6 defaultURL];

        if (!v9) {
          [*(id *)(a1 + 56) openAppUsingBundleIdentifier:v4];
        }
      }
    }
    if (v6)
    {
      int v10 = [(AMSUserNotification *)v4 handleSelectedButton:v6 bag:*(void *)(a1 + 48)];
      id v11 = [*(id *)(a1 + 40) completionHandlerAdapter];
      [v10 addFinishBlock:v11];
    }
    else
    {
      [*(id *)(a1 + 40) finishWithSuccess];
    }
  }
  else
  {
    AMSError(2, @"User Notification Failure", @"Unable to parse the notification response", 0);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 40) finishWithError:v12];
  }
}

- (id)handleSelectedButton:(id)a3 bag:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(AMSMutableBinaryPromise);
  if (!v7)
  {
    id v9 = +[AMSLogConfig sharedUserNotificationConfig];
    if (!v9)
    {
      id v9 = +[AMSLogConfig sharedConfig];
    }
    int v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = objc_opt_class();
      id v12 = v11;
      id v13 = [(AMSUserNotification *)self logKey];
      *(_DWORD *)buf = 138543618;
      int v26 = v11;
      __int16 v27 = 2114;
      __int16 v28 = v13;
      _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Handling button tap without a bag.", buf, 0x16u);
    }
  }
  id v14 = dispatch_get_global_queue(2, 0);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __48__AMSUserNotification_handleSelectedButton_bag___block_invoke;
  v21[3] = &unk_1E55A2280;
  v21[4] = self;
  id v22 = v6;
  id v23 = v7;
  v15 = v8;
  uint64_t v24 = v15;
  id v16 = v7;
  id v17 = v6;
  dispatch_async(v14, v21);

  int v18 = v24;
  id v19 = v15;

  return v19;
}

void __48__AMSUserNotification_handleSelectedButton_bag___block_invoke(uint64_t a1)
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) intent];
  if (v2 == 1)
  {
    id v3 = off_1E559C2D0;
  }
  else
  {
    if (v2 != 2) {
      goto LABEL_6;
    }
    id v3 = off_1E559C2D8;
  }
  [(__objc2_class *)*v3 userNotification:*(void *)(a1 + 32) selectedButtonAction:*(void *)(a1 + 40) bag:*(void *)(a1 + 48)];
LABEL_6:
  id v4 = +[AMSLogConfig sharedUserNotificationConfig];
  if (!v4)
  {
    id v4 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_opt_class();
    id v7 = *(void **)(a1 + 32);
    id v8 = v6;
    id v9 = [v7 logKey];
    *(_DWORD *)buf = 138543618;
    v86 = v6;
    __int16 v87 = 2114;
    uint64_t v88 = v9;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Handling RichNotification response.", buf, 0x16u);
  }
  int v10 = [*(id *)(a1 + 40) request];

  if (v10)
  {
    id v11 = +[AMSLogConfig sharedPushNotificationConfig];
    if (!v11)
    {
      id v11 = +[AMSLogConfig sharedConfig];
    }
    id v12 = [v11 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = objc_opt_class();
      id v14 = *(void **)(a1 + 32);
      id v15 = v13;
      id v16 = [v14 logKey];
      *(_DWORD *)buf = 138543618;
      v86 = v13;
      __int16 v87 = 2114;
      uint64_t v88 = v16;
      _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Performing request", buf, 0x16u);
    }
    id v17 = [[AMSURLRequestEncoder alloc] initWithBag:*(void *)(a1 + 48)];
    int v18 = [*(id *)(a1 + 32) account];
    [(AMSURLRequestEncoder *)v17 setAccount:v18];

    id v19 = [*(id *)(a1 + 32) logKey];
    [(AMSURLRequestEncoder *)v17 setLogUUID:v19];

    id v20 = [*(id *)(a1 + 40) request];
    long long v21 = [(AMSURLRequestEncoder *)v17 requestByEncodingRequest:v20 parameters:0];
    id v84 = 0;
    id v22 = [v21 resultWithError:&v84];
    id v23 = v84;

    if (v23)
    {
      uint64_t v24 = +[AMSLogConfig sharedPushNotificationConfig];
      if (!v24)
      {
        uint64_t v24 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v25 = [v24 OSLogObject];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        int v26 = objc_opt_class();
        __int16 v27 = *(void **)(a1 + 32);
        id v28 = v23;
        id v29 = v26;
        int v30 = [v27 logKey];
        *(_DWORD *)buf = 138543874;
        v86 = v26;
        __int16 v87 = 2114;
        uint64_t v88 = v30;
        __int16 v89 = 2114;
        v90 = v28;
        _os_log_impl(&dword_18D554000, v25, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error creating request: %{public}@", buf, 0x20u);

        id v23 = v28;
      }

      v31 = 0;
    }
    else
    {
      uint64_t v24 = +[AMSURLSession defaultSession];
      v31 = [v24 dataTaskPromiseWithRequest:v22];
    }
  }
  else
  {
    id v23 = 0;
    v31 = 0;
  }
  uint64_t v32 = [*(id *)(a1 + 40) mediaApiRequestURL];

  if (v32)
  {
    v33 = [*(id *)(a1 + 40) clientIdentifier];

    uint64_t v34 = +[AMSLogConfig sharedPushNotificationConfig];
    id v35 = (AMSMediaTokenService *)v34;
    if (v33)
    {
      if (!v34)
      {
        id v35 = +[AMSLogConfig sharedConfig];
      }
      id v36 = [(AMSMediaTokenService *)v35 OSLogObject];
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        v37 = objc_opt_class();
        v38 = *(void **)(a1 + 32);
        id v39 = v37;
        long long v40 = [v38 logKey];
        *(_DWORD *)buf = 138543618;
        v86 = v37;
        __int16 v87 = 2114;
        uint64_t v88 = v40;
        _os_log_impl(&dword_18D554000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Performing Media API request", buf, 0x16u);
      }
      long long v41 = [AMSMediaTokenService alloc];
      long long v42 = [*(id *)(a1 + 40) clientIdentifier];
      id v35 = [(AMSMediaTokenService *)v41 initWithClientIdentifier:v42 bag:*(void *)(a1 + 48)];

      long long v43 = [[AMSMediaRequestEncoder alloc] initWithTokenService:v35 bag:*(void *)(a1 + 48)];
      uint64_t v44 = objc_alloc_init(AMSMediaResponseDecoder);
      [(AMSMediaRequestEncoder *)v43 setResponseDecoder:v44];

      v45 = [*(id *)(a1 + 32) account];
      [(AMSMediaRequestEncoder *)v43 setAccount:v45];

      __int16 v46 = [*(id *)(a1 + 32) logKey];
      [(AMSMediaRequestEncoder *)v43 setLogKey:v46];

      v47 = +[AMSURLSession defaultSession];
      __int16 v48 = [[AMSMediaProtocolHandler alloc] initWithTokenService:v35];
      [v47 setProtocolHandler:v48];

      int v49 = [*(id *)(a1 + 40) mediaApiRequestURL];
      v50 = [(AMSMediaRequestEncoder *)v43 requestWithURL:v49];

      uint64_t v32 = [v47 dataTaskPromiseWithRequestPromise:v50];
      v83[0] = MEMORY[0x1E4F143A8];
      v83[1] = 3221225472;
      v83[2] = __48__AMSUserNotification_handleSelectedButton_bag___block_invoke_177;
      v83[3] = &unk_1E55A0F50;
      v83[4] = *(void *)(a1 + 32);
      [v32 addFinishBlock:v83];
    }
    else
    {
      if (!v34)
      {
        id v35 = +[AMSLogConfig sharedConfig];
      }
      long long v43 = [(AMSMediaTokenService *)v35 OSLogObject];
      if (os_log_type_enabled(&v43->super, OS_LOG_TYPE_ERROR))
      {
        uint64_t v51 = objc_opt_class();
        v52 = *(void **)(a1 + 32);
        id v53 = v51;
        v54 = [v52 logKey];
        *(_DWORD *)buf = 138543618;
        v86 = v51;
        __int16 v87 = 2114;
        uint64_t v88 = v54;
        _os_log_impl(&dword_18D554000, &v43->super, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Payload set mediaApiRequestURL but clientIdentifier is not set", buf, 0x16u);
      }
      uint64_t v32 = 0;
    }
  }
  v55 = [*(id *)(a1 + 40) defaultURL];

  if (v55)
  {
    v56 = +[AMSLogConfig sharedPushNotificationConfig];
    if (!v56)
    {
      v56 = +[AMSLogConfig sharedConfig];
    }
    id v57 = [v56 OSLogObject];
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      id v58 = objc_opt_class();
      uint64_t v59 = v32;
      v60 = v31;
      id v61 = v23;
      v62 = *(void **)(a1 + 32);
      id v78 = v58;
      char v63 = [v62 logKey];
      v64 = [*(id *)(a1 + 40) defaultURL];
      uint64_t v65 = AMSLogableURL(v64);
      *(_DWORD *)buf = 138543874;
      v86 = v58;
      __int16 v87 = 2114;
      uint64_t v88 = v63;
      __int16 v89 = 2112;
      v90 = v65;
      _os_log_impl(&dword_18D554000, v57, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Opening url: %@", buf, 0x20u);

      id v23 = v61;
      v31 = v60;
      uint64_t v32 = v59;
    }
    uint64_t v66 = [*(id *)(a1 + 40) defaultURL];
    +[AMSOpenURL openStandardURL:v66];
  }
  v67 = [*(id *)(a1 + 40) metricsEvent];

  if (v67)
  {
    v68 = [*(id *)(a1 + 32) metricsEvent];
    uint64_t v69 = (void *)[v68 mutableCopy];
    v70 = v69;
    if (v69)
    {
      id v71 = v69;
    }
    else
    {
      id v71 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    v72 = v71;

    uint64_t v73 = [*(id *)(a1 + 40) metricsEvent];
    v74 = [v73 underlyingDictionary];
    [v72 addEntriesFromDictionary:v74];

    v75 = [[AMSMetricsEvent alloc] initWithUnderlyingDictionary:v72];
    -[AMSMetricsEvent setAnonymous:](v75, "setAnonymous:", [*(id *)(a1 + 32) anonymizeMetrics]);
    v76 = +[AMSMetrics internalInstanceUsingBag:*(void *)(a1 + 48)];
    [v76 enqueueEvent:v75];
  }
  if (v31)
  {
    v81[0] = MEMORY[0x1E4F143A8];
    v81[1] = 3221225472;
    v81[2] = __48__AMSUserNotification_handleSelectedButton_bag___block_invoke_182;
    v81[3] = &unk_1E55A4E30;
    v81[4] = *(void *)(a1 + 32);
    id v82 = *(id *)(a1 + 56);
    [v31 addFinishBlock:v81];
    char v77 = v82;
  }
  else
  {
    if (v23)
    {
      [*(id *)(a1 + 56) finishWithError:v23];
      goto LABEL_53;
    }
    if (!v32)
    {
      [*(id *)(a1 + 56) finishWithSuccess];
      goto LABEL_53;
    }
    v79[0] = MEMORY[0x1E4F143A8];
    v79[1] = 3221225472;
    v79[2] = __48__AMSUserNotification_handleSelectedButton_bag___block_invoke_184;
    v79[3] = &unk_1E55A0F50;
    id v80 = *(id *)(a1 + 56);
    [v32 addFinishBlock:v79];
    char v77 = v80;
  }

LABEL_53:
}

void __48__AMSUserNotification_handleSelectedButton_bag___block_invoke_177(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[AMSLogConfig sharedPushNotificationConfig];
  id v6 = (void *)v5;
  if (v4)
  {
    if (!v5)
    {
      id v6 = +[AMSLogConfig sharedConfig];
    }
    id v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = objc_opt_class();
      id v9 = *(void **)(a1 + 32);
      id v10 = v8;
      id v11 = [v9 logKey];
      int v18 = 138543874;
      id v19 = v8;
      __int16 v20 = 2114;
      long long v21 = v11;
      __int16 v22 = 2114;
      id v23 = v4;
      id v12 = "%{public}@: [%{public}@] Finished Media API request with error %{public}@";
      id v13 = v7;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
      uint32_t v15 = 32;
LABEL_10:
      _os_log_impl(&dword_18D554000, v13, v14, v12, (uint8_t *)&v18, v15);
    }
  }
  else
  {
    if (!v5)
    {
      id v6 = +[AMSLogConfig sharedConfig];
    }
    id v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = objc_opt_class();
      id v17 = *(void **)(a1 + 32);
      id v10 = v16;
      id v11 = [v17 logKey];
      int v18 = 138543618;
      id v19 = v16;
      __int16 v20 = 2114;
      long long v21 = v11;
      id v12 = "%{public}@: [%{public}@] Finished Media API request successfully";
      id v13 = v7;
      os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
      uint32_t v15 = 22;
      goto LABEL_10;
    }
  }
}

void __48__AMSUserNotification_handleSelectedButton_bag___block_invoke_182(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = +[AMSLogConfig sharedPushNotificationConfig];
    if (!v5)
    {
      uint64_t v5 = +[AMSLogConfig sharedConfig];
    }
    id v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = objc_opt_class();
      id v8 = *(void **)(a1 + 32);
      id v9 = v7;
      id v10 = [v8 logKey];
      int v11 = 138543874;
      id v12 = v7;
      __int16 v13 = 2114;
      os_log_type_t v14 = v10;
      __int16 v15 = 2114;
      id v16 = v4;
      _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error performing request: %{public}@", (uint8_t *)&v11, 0x20u);
    }
  }
  [*(id *)(a1 + 40) finishWithSuccess:v4 == 0 error:v4];
}

uint64_t __48__AMSUserNotification_handleSelectedButton_bag___block_invoke_184(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finishWithSuccess:a3 == 0 error:a3];
}

+ (void)handleServiceExtensionNotificationRequest:(id)a3 bag:(id)a4 withContentHandler:(id)a5
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void *))a5;
  id v10 = [AMSPushPayload alloc];
  int v11 = [v7 content];
  id v12 = [v11 userInfo];
  uint64_t v13 = [(AMSPushPayload *)v10 initWithPayload:v12];

  uint64_t v69 = (void *)v13;
  os_log_type_t v14 = [[AMSUserNotification alloc] initWithPayload:v13 andConfig:0];
  __int16 v15 = [(AMSUserNotification *)v14 logKey];
  id v16 = AMSSetLogKey(v15);

  uint64_t v17 = +[AMSLogConfig sharedPushNotificationConfig];
  if (!v17)
  {
    uint64_t v17 = +[AMSLogConfig sharedConfig];
  }
  int v18 = [v17 OSLogObject];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = objc_opt_class();
    id v20 = v19;
    long long v21 = [(AMSUserNotification *)v14 logKey];
    *(_DWORD *)buf = 138543874;
    id v74 = v19;
    __int16 v75 = 2114;
    v76 = v21;
    __int16 v77 = 2114;
    id v78 = v14;
    _os_log_impl(&dword_18D554000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Handling service extension for note: %{public}@", buf, 0x20u);
  }
  __int16 v22 = [(AMSUserNotification *)v14 logKey];
  if (!v22)
  {
    id v23 = AMSGenerateLogCorrelationKey();
    [(AMSUserNotification *)v14 setLogKey:v23];
  }
  uint64_t v24 = [(AMSUserNotification *)v14 centerBundleIdentifier];
  int64_t v25 = +[AMSRestrictions explicitContentSettingForBundleID:v24];

  if ([(AMSUserNotification *)v14 explicitContent] && !v25)
  {
    int v26 = +[AMSLogConfig sharedPushNotificationConfig];
    if (!v26)
    {
      int v26 = +[AMSLogConfig sharedConfig];
    }
    __int16 v27 = [(AMSUserNotification *)v26 OSLogObject];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v74 = a1;
      __int16 v75 = 2114;
      v76 = v22;
      _os_log_impl(&dword_18D554000, v27, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Explicit content disallowed", buf, 0x16u);
    }
LABEL_21:

    v33 = [(AMSUserNotification *)v14 centerBundleIdentifier];

    uint64_t v34 = +[AMSLogConfig sharedPushNotificationConfig];
    id v35 = (void *)v34;
    if (v33)
    {
      if (!v34)
      {
        id v35 = +[AMSLogConfig sharedConfig];
      }
      id v36 = [v35 OSLogObject];
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        v37 = objc_opt_class();
        id v38 = v37;
        id v39 = [(AMSUserNotification *)v14 logKey];
        *(_DWORD *)buf = 138543618;
        id v74 = v37;
        __int16 v75 = 2114;
        v76 = v39;
        _os_log_impl(&dword_18D554000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Removing notification", buf, 0x16u);
      }
      id v35 = [(AMSUserNotification *)v14 centerBundleIdentifier];
      long long v40 = [objc_alloc(MEMORY[0x1E4F44680]) initWithBundleIdentifier:v35];
      long long v41 = [v7 identifier];
      v72 = v41;
      long long v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v72 count:1];
      [v40 removePendingNotificationRequestsWithIdentifiers:v42];
    }
    else
    {
      if (!v34)
      {
        id v35 = +[AMSLogConfig sharedConfig];
      }
      long long v40 = [v35 OSLogObject];
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v74 = a1;
        __int16 v75 = 2114;
        v76 = v22;
        _os_log_impl(&dword_18D554000, v40, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to remove notification for nil bundle identifier", buf, 0x16u);
      }
    }

    goto LABEL_49;
  }
  id v28 = [(AMSUserNotification *)v14 account];
  int v26 = v28;
  if (v28)
  {
    if (([(AMSUserNotification *)v28 isActive] & 1) == 0)
    {
      id v29 = [(AMSUserNotification *)v14 centerBundleIdentifier];

      if (v29)
      {
        __int16 v27 = +[AMSLogConfig sharedPushNotificationConfig];
        if (!v27)
        {
          __int16 v27 = +[AMSLogConfig sharedConfig];
        }
        int v30 = [v27 OSLogObject];
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          v31 = objc_opt_class();
          *(_DWORD *)buf = 138543874;
          id v74 = v31;
          __int16 v75 = 2114;
          v76 = v22;
          __int16 v77 = 2114;
          id v78 = v26;
          id v32 = v31;
          _os_log_impl(&dword_18D554000, v30, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Ignoring notification for inactive account: %{public}@", buf, 0x20u);
        }
        goto LABEL_21;
      }
    }
  }

  long long v43 = [(AMSUserNotification *)v14 metricsEvent];

  if (v43)
  {
    uint64_t v44 = +[AMSUserNotificationMetricsEvent eventForPostedNotification:v14];
    [v44 setPostedSuccessfully:1];
    objc_msgSend(v44, "setAnonymous:", -[AMSUserNotification anonymizeMetrics](v14, "anonymizeMetrics"));
    v45 = [(AMSUserNotification *)v14 scheduledTime];

    if (v45)
    {
      __int16 v46 = objc_msgSend(MEMORY[0x1E4F28C10], "ams_serverFriendlyFormatter");
      v47 = [(AMSUserNotification *)v14 scheduledTime];
      __int16 v48 = [v46 stringFromDate:v47];
      [v44 setDisplayScheduledTime:v48];
    }
    int v49 = +[AMSMetrics internalInstanceUsingBag:v8];
    [v49 enqueueEvent:v44];
  }
  v50 = [(AMSUserNotification *)v14 createUNNotificationContent];
  id v35 = (void *)[v50 mutableCopy];

  uint64_t v51 = [(AMSUserNotification *)v14 artworkUrl];
  v52 = [v51 absoluteString];
  uint64_t v53 = [v52 length];

  if (v53)
  {
    v67 = v9;
    v54 = [MEMORY[0x1E4F29128] UUID];
    v55 = [v54 UUIDString];

    v56 = [(AMSUserNotification *)v14 artworkUrl];
    id v68 = v8;
    id v57 = [a1 _downloadAssetAtUrl:v56 withIdentifier:v55 logKey:v22 bag:v8];

    if (v57)
    {
      id v58 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v71 = 0;
      uint64_t v59 = [MEMORY[0x1E4F445F0] attachmentWithIdentifier:v55 URL:v57 options:0 error:&v71];
      v60 = (AMSUserNotification *)v71;
      if (v60)
      {
        uint64_t v65 = v59;
        id v66 = v58;
        id v61 = +[AMSLogConfig sharedUserNotificationConfig];
        if (!v61)
        {
          id v61 = +[AMSLogConfig sharedConfig];
        }
        v62 = [v61 OSLogObject];
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
        {
          char v63 = objc_opt_class();
          *(_DWORD *)buf = 138543874;
          id v74 = v63;
          __int16 v75 = 2114;
          v76 = v22;
          __int16 v77 = 2114;
          id v78 = v60;
          id v64 = v63;
          _os_log_impl(&dword_18D554000, v62, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error generating attachment: %{public}@", buf, 0x20u);
        }
        uint64_t v59 = v65;
        id v58 = v66;
      }
      else if (v59)
      {
        [v58 addObject:v59];
        [v35 setAttachments:v58];
      }
    }
    id v9 = v67;
    id v8 = v68;
  }
  v9[2](v9, v35);
LABEL_49:
}

+ (void)openAppUsingBundleIdentifier:(id)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F224A0]);
  uint64_t v6 = *MEMORY[0x1E4F626A0];
  v14[0] = *MEMORY[0x1E4F62688];
  v14[1] = v6;
  v15[0] = MEMORY[0x1E4F1CC38];
  v15[1] = MEMORY[0x1E4F1CC38];
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
  [v5 setFrontBoardOptions:v7];

  id v8 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  id v9 = [v4 centerBundleIdentifier];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__AMSUserNotification_openAppUsingBundleIdentifier___block_invoke;
  v11[3] = &unk_1E55A8490;
  id v12 = v4;
  id v13 = a1;
  id v10 = v4;
  [v8 openApplicationWithBundleIdentifier:v9 configuration:v5 completionHandler:v11];
}

void __52__AMSUserNotification_openAppUsingBundleIdentifier___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = +[AMSLogConfig sharedUserNotificationConfig];
  id v7 = (void *)v6;
  if (a2)
  {
    if (!v6)
    {
      id v7 = +[AMSLogConfig sharedConfig];
    }
    id v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      id v10 = [*(id *)(a1 + 32) logKey];
      int v11 = [*(id *)(a1 + 32) centerBundleIdentifier];
      int v17 = 138543874;
      uint64_t v18 = v9;
      __int16 v19 = 2114;
      id v20 = v10;
      __int16 v21 = 2112;
      __int16 v22 = v11;
      id v12 = "%{public}@: [%{public}@] No default action - Opened via %@ instead";
      id v13 = v8;
      os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
      uint32_t v15 = 32;
LABEL_10:
      _os_log_impl(&dword_18D554000, v13, v14, v12, (uint8_t *)&v17, v15);
    }
  }
  else
  {
    if (!v6)
    {
      id v7 = +[AMSLogConfig sharedConfig];
    }
    id v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = *(void *)(a1 + 40);
      id v10 = [*(id *)(a1 + 32) logKey];
      int v11 = [*(id *)(a1 + 32) centerBundleIdentifier];
      int v17 = 138544130;
      uint64_t v18 = v16;
      __int16 v19 = 2114;
      id v20 = v10;
      __int16 v21 = 2112;
      __int16 v22 = v11;
      __int16 v23 = 2112;
      id v24 = v5;
      id v12 = "%{public}@: [%{public}@] No default action - Failed to open via %@ - %@";
      id v13 = v8;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
      uint32_t v15 = 42;
      goto LABEL_10;
    }
  }
}

+ (id)notificationCenter:(id)a3 didChangeSettings:(id)a4 bag:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  id v8 = objc_alloc_init(AMSMutableBinaryPromise);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __64__AMSUserNotification_notificationCenter_didChangeSettings_bag___block_invoke;
  void v15[3] = &unk_1E55A84E0;
  id v16 = v6;
  id v17 = v7;
  uint64_t v9 = v8;
  uint64_t v18 = v9;
  id v10 = v7;
  id v11 = v6;
  [v11 getNotificationSettingsWithCompletionHandler:v15];
  id v12 = v18;
  id v13 = v9;

  return v13;
}

void __64__AMSUserNotification_notificationCenter_didChangeSettings_bag___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v4 = [a1[4] bundleIdentifier];
  }
  else
  {
    id v4 = 0;
  }
  id v5 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
  id v6 = objc_msgSend(v5, "ams_activeiTunesAccountForMediaType:", AMSAccountMediaTypeProduction);

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __64__AMSUserNotification_notificationCenter_didChangeSettings_bag___block_invoke_2;
  v12[3] = &unk_1E55A84B8;
  id v13 = v3;
  id v14 = v4;
  id v15 = a1[5];
  id v7 = v4;
  id v8 = v3;
  uint64_t v9 = [v6 continueWithBlock:v12];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__AMSUserNotification_notificationCenter_didChangeSettings_bag___block_invoke_3;
  v10[3] = &unk_1E559EE78;
  id v11 = a1[6];
  [v9 addFinishBlock:v10];
}

id __64__AMSUserNotification_notificationCenter_didChangeSettings_bag___block_invoke_2(void *a1, uint64_t a2)
{
  id v3 = +[AMSUserNotificationMetricsEvent eventForSettingsChangedWithSettings:a1[4] bundleID:a1[5] account:a2];
  id v4 = +[AMSMetrics internalInstanceUsingBag:a1[6]];
  [v4 enqueueEvent:v3];
  id v5 = [v4 flush];

  return v5;
}

uint64_t __64__AMSUserNotification_notificationCenter_didChangeSettings_bag___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithSuccess];
}

+ (id)notificationCenter:(id)a3 openSettingsForNotification:(id)a4 bag:(id)a5
{
  return +[AMSBinaryPromise promiseWithSuccess];
}

+ (BOOL)shouldDeleteNotificationForPayload:(id)a3 outIdentifier:(id *)a4 scheduledOnly:(BOOL *)a5
{
  id v8 = a3;
  uint64_t v9 = [v8 aps];
  id v10 = [v9 objectForKeyedSubscript:@"_delAll"];

  if (objc_opt_respondsToSelector()) {
    int v11 = [v10 BOOLValue];
  }
  else {
    int v11 = 0;
  }
  id v12 = [v8 aps];
  id v13 = [v12 objectForKeyedSubscript:@"_del"];

  if (objc_opt_respondsToSelector())
  {
    int v14 = [v13 BOOLValue];
    if (((v14 | v11) & 1) == 0)
    {
      BOOL v15 = 0;
      goto LABEL_13;
    }
  }
  else
  {
    LOBYTE(v14) = 0;
    BOOL v15 = 0;
    if (!v11) {
      goto LABEL_13;
    }
  }
  if (a5) {
    *a5 = v14;
  }
  if (a4)
  {
    *a4 = [a1 _identifierFromPayload:v8];
  }
  BOOL v15 = 1;
LABEL_13:

  return v15;
}

+ (BOOL)shouldHandleNotificationResponse:(id)a3
{
  id v4 = [a3 notification];
  id v5 = [v4 request];

  id v6 = [v5 identifier];
  id v7 = [v5 content];
  id v8 = [v7 userInfo];
  LOBYTE(a1) = [a1 _canParseNotificationWithIdentifier:v6 userInfo:v8];

  return (char)a1;
}

+ (BOOL)shouldHandleServiceExtensionNotificationRequest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifier];
  id v6 = [v4 content];

  id v7 = [v6 userInfo];
  LOBYTE(a1) = [a1 _canParseNotificationWithIdentifier:v5 userInfo:v7];

  return (char)a1;
}

+ (NSString)bagSubProfile
{
  if (_MergedGlobals_157 != -1) {
    dispatch_once(&_MergedGlobals_157, &__block_literal_global_140);
  }
  uint64_t v2 = (void *)qword_1EB38E0E8;
  return (NSString *)v2;
}

void __36__AMSUserNotification_bagSubProfile__block_invoke()
{
  v0 = (void *)qword_1EB38E0E8;
  qword_1EB38E0E8 = @"AMSUserNotifications";
}

+ (NSString)bagSubProfileVersion
{
  if (qword_1EB38E0F0 != -1) {
    dispatch_once(&qword_1EB38E0F0, &__block_literal_global_203);
  }
  uint64_t v2 = (void *)qword_1EB38E0F8;
  return (NSString *)v2;
}

void __43__AMSUserNotification_bagSubProfileVersion__block_invoke()
{
  v0 = (void *)qword_1EB38E0F8;
  qword_1EB38E0F8 = @"1";
}

+ (id)createBagForSubProfile
{
  uint64_t v2 = [(id)objc_opt_class() bagSubProfile];
  id v3 = [(id)objc_opt_class() bagSubProfileVersion];
  id v4 = +[AMSBag bagForProfile:v2 profileVersion:v3];

  return v4;
}

+ (BOOL)_canParseNotificationWithIdentifier:(id)a3 userInfo:(id)a4
{
  id v5 = a4;
  char v6 = [a3 hasPrefix:@"ams_"];
  id v7 = [v5 objectForKeyedSubscript:@"aps"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  if ((v6 & 1) != 0
    || (([v8 objectForKeyedSubscript:@"_id"],
         uint64_t v9 = objc_claimAutoreleasedReturnValue(),
         objc_opt_class(),
         (objc_opt_isKindOfClass() & 1) == 0)
      ? (id v10 = 0)
      : (id v10 = v9),
        v9,
        char v11 = [v10 hasPrefix:@"ams_"],
        v10,
        (v11 & 1) != 0))
  {
    char v12 = 1;
  }
  else
  {
    id v13 = [v8 objectForKeyedSubscript:@"uuid"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v14 = v13;
    }
    else {
      id v14 = 0;
    }

    char v12 = [v14 hasPrefix:@"ams_"];
  }

  return v12;
}

+ (id)_cachedImagePathForIdentifier:(id)a3 assetURL:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc(MEMORY[0x1E4F1C978]);
  id v8 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  uint64_t v9 = [v8 lastObject];
  id v10 = objc_msgSend(v7, "initWithObjects:", v9, @"com.apple.AppleMediaServices", @"UserNotificationImageCache", 0);

  char v11 = [NSString pathWithComponents:v10];
  char v12 = 0;
  if (objc_msgSend(MEMORY[0x1E4F28CB8], "ams_ensureDirectoryExists:", v11))
  {
    id v13 = [v6 pathExtension];
    if (v13)
    {
      id v14 = [NSString stringWithFormat:@"%@.%@", v5, v13];
    }
    else
    {
      id v14 = v5;
    }
    BOOL v15 = v14;
    char v12 = [v11 stringByAppendingPathComponent:v14];
  }
  return v12;
}

+ (id)_identifierFromPayload:(id)a3
{
  id v3 = a3;
  id v4 = [v3 aps];
  id v5 = [v4 objectForKeyedSubscript:@"_id"];

  if (![v5 length])
  {
    id v6 = [v3 aps];
    uint64_t v7 = [v6 objectForKeyedSubscript:@"uuid"];

    id v5 = (void *)v7;
  }
  if (![v5 length])
  {
    id v8 = NSString;
    uint64_t v9 = [MEMORY[0x1E4F29128] UUID];
    id v10 = [v9 UUIDString];
    uint64_t v11 = [v8 stringWithFormat:@"%@%@", @"ams_", v10];

    id v5 = (void *)v11;
  }
  if (([v5 hasPrefix:@"ams_"] & 1) == 0)
  {
    uint64_t v12 = [NSString stringWithFormat:@"%@%@", @"ams_", v5];

    id v5 = (void *)v12;
  }

  return v5;
}

+ (id)_downloadAssetAtUrl:(id)a3 withIdentifier:(id)a4 logKey:(id)a5 bag:(id)a6
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = [a1 _cachedImagePathForIdentifier:a4 assetURL:v10];
  if (v13)
  {
    id v14 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v13];
  }
  else
  {
    id v14 = 0;
  }

  BOOL v15 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v16 = [v14 absoluteString];
  char v17 = [v15 fileExistsAtPath:v16];

  if (v17) {
    goto LABEL_16;
  }
  uint64_t v18 = [[AMSURLRequestEncoder alloc] initWithBag:v12];
  [(AMSURLRequestEncoder *)v18 setLogUUID:v11];
  [(AMSURLRequestEncoder *)v18 setUrlKnownToBeTrusted:1];
  __int16 v19 = [(AMSURLRequestEncoder *)v18 requestWithMethod:2 URL:v10 parameters:0];
  id v34 = 0;
  v31 = [v19 resultWithError:&v34];
  id v20 = v34;

  if (v20) {
    goto LABEL_8;
  }
  __int16 v21 = +[AMSURLSession defaultSession];
  __int16 v22 = [v21 dataTaskPromiseWithRequest:v31];
  id v33 = 0;
  __int16 v23 = [v22 resultWithError:&v33];
  id v20 = v33;

  if (v20)
  {

LABEL_8:
    id v24 = +[AMSLogConfig sharedPushNotificationConfig];
    if (!v24)
    {
      id v24 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v25 = [v24 OSLogObject];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      id v36 = a1;
      __int16 v37 = 2114;
      id v38 = v11;
      __int16 v39 = 2114;
      id v40 = v20;
      _os_log_impl(&dword_18D554000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Error downloading asset: %{public}@", buf, 0x20u);
    }
    int v26 = 0;
LABEL_13:

    goto LABEL_14;
  }
  id v28 = [v23 data];

  if (v28)
  {
    int v26 = [v23 data];
  }
  else
  {
    int v26 = 0;
  }

  if (v14)
  {
    id v32 = 0;
    char v29 = [v26 writeToURL:v14 options:1 error:&v32];
    id v30 = v32;
    id v20 = v30;
    if ((v29 & 1) == 0 && v30)
    {
      id v24 = +[AMSLogConfig sharedPushNotificationConfig];
      if (!v24)
      {
        id v24 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v25 = objc_msgSend(v24, "OSLogObject", v31);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        id v36 = a1;
        __int16 v37 = 2114;
        id v38 = v11;
        __int16 v39 = 2114;
        id v40 = v20;
        _os_log_impl(&dword_18D554000, v25, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to cache asset data: %{public}@", buf, 0x20u);
      }
      goto LABEL_13;
    }
  }
  else
  {
    id v20 = 0;
  }
LABEL_14:

  if (v20)
  {

    id v14 = 0;
  }
LABEL_16:

  return v14;
}

- (id)_generatePayloadWithBase:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v4];
  id v6 = [(AMSUserNotification *)self account];
  uint64_t v7 = objc_msgSend(v6, "ams_DSID");
  [v5 setObject:v7 forKeyedSubscript:@"0"];

  id v8 = [(AMSUserNotification *)self centerBundleIdentifier];
  [v5 setObject:v8 forKeyedSubscript:@"2"];

  uint64_t v9 = [(AMSUserNotification *)self logKey];
  [v5 setObject:v9 forKeyedSubscript:@"_logKey"];

  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v12 = [(AMSUserNotification *)self informativeText];
  [v11 setObject:v12 forKeyedSubscript:@"body"];

  id v13 = [(AMSUserNotification *)self title];
  [v11 setObject:v13 forKeyedSubscript:@"title"];

  id v14 = [(AMSUserNotification *)self subtitle];
  [v11 setObject:v14 forKeyedSubscript:@"subtitle"];

  BOOL v15 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[AMSUserNotification interruptionLevel](self, "interruptionLevel"));
  [v11 setObject:v15 forKeyedSubscript:@"level"];

  [v10 setObject:v11 forKeyedSubscript:@"alert"];
  id v16 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[AMSUserNotification anonymizeMetrics](self, "anonymizeMetrics"));
  [v10 setObject:v16 forKeyedSubscript:@"_an"];

  char v17 = [(AMSUserNotification *)self artworkUrl];
  uint64_t v18 = [v17 absoluteString];
  [v10 setObject:v18 forKeyedSubscript:@"_au"];

  __int16 v19 = [(AMSUserNotification *)self videoUrl];
  id v20 = [v19 absoluteString];
  [v10 setObject:v20 forKeyedSubscript:@"_vu"];

  __int16 v21 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[AMSUserNotification shouldSuppressDefaultAction](self, "shouldSuppressDefaultAction"));
  [v10 setObject:v21 forKeyedSubscript:@"_sd"];

  __int16 v22 = [(AMSUserNotification *)self categoryIdentifier];
  [v10 setObject:v22 forKeyedSubscript:@"category"];

  __int16 v23 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[AMSUserNotification explicitContent](self, "explicitContent"));
  [v10 setObject:v23 forKeyedSubscript:@"_ex"];

  id v24 = [(AMSUserNotification *)self metricsEvent];
  [v10 setObject:v24 forKeyedSubscript:@"_mt"];

  uint64_t v25 = [(AMSUserNotification *)self subsections];
  int v26 = [v25 allObjects];
  [v10 setObject:v26 forKeyedSubscript:@"_ss"];

  __int16 v27 = [(AMSUserNotification *)self threadIdentifier];
  [v10 setObject:v27 forKeyedSubscript:@"thread"];

  id v28 = [(AMSUserNotification *)self identifier];
  [v10 setObject:v28 forKeyedSubscript:@"_id"];

  char v29 = [(AMSUserNotification *)self scheduledTime];

  if (v29)
  {
    id v30 = objc_msgSend(MEMORY[0x1E4F28C10], "ams_serverFriendlyFormatter");
    v31 = [(AMSUserNotification *)self scheduledTime];
    id v32 = [v30 stringFromDate:v31];

    [v10 setObject:v32 forKeyedSubscript:@"_st"];
  }
  id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v34 = [(AMSUserNotification *)self defaultAction];
  id v35 = __48__AMSUserNotification__generatePayloadWithBase___block_invoke(v34, 1);
  objc_msgSend(v33, "ams_addNullableObject:", v35);

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v36 = [(AMSUserNotification *)self buttonActions];
  uint64_t v37 = [v36 countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v38; ++i)
      {
        if (*(void *)v44 != v39) {
          objc_enumerationMutation(v36);
        }
        uint64_t v41 = __48__AMSUserNotification__generatePayloadWithBase___block_invoke(*(void **)(*((void *)&v43 + 1) + 8 * i), 0);
        objc_msgSend(v33, "ams_addNullableObject:", v41);
      }
      uint64_t v38 = [v36 countByEnumeratingWithState:&v43 objects:v47 count:16];
    }
    while (v38);
  }

  [v10 setObject:v33 forKeyedSubscript:@"_ba"];
  [v5 setObject:v10 forKeyedSubscript:@"aps"];

  return v5;
}

id __48__AMSUserNotification__generatePayloadWithBase___block_invoke(void *a1, int a2)
{
  id v3 = a1;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v5 = v4;
  if (a2) {
    id v6 = &unk_1EDD018D0;
  }
  else {
    id v6 = &unk_1EDD018E8;
  }
  [v4 setObject:v6 forKeyedSubscript:@"_tp"];
  uint64_t v7 = [v3 defaultURL];
  id v8 = [v7 absoluteString];
  [v5 setObject:v8 forKeyedSubscript:@"_url"];

  uint64_t v9 = [v3 identifier];
  [v5 setObject:v9 forKeyedSubscript:@"_id"];

  id v10 = [v3 metricsEvent];
  id v11 = [v10 underlyingDictionary];
  [v5 setObject:v11 forKeyedSubscript:@"_mt"];

  id v12 = [v3 request];

  if (v12)
  {
    id v13 = [v3 request];
    id v14 = [v13 HTTPBody];

    if (v14)
    {
      id v15 = [NSString alloc];
      id v16 = [v3 request];
      char v17 = [v16 HTTPBody];
      uint64_t v18 = (void *)[v15 initWithData:v17 encoding:4];

      [v5 setObject:v18 forKeyedSubscript:@"_rb"];
    }
    __int16 v19 = [v3 request];
    id v20 = [v19 HTTPMethod];
    [v5 setObject:v20 forKeyedSubscript:@"_rm"];

    __int16 v21 = [v3 request];
    __int16 v22 = [v21 allHTTPHeaderFields];
    [v5 setObject:v22 forKeyedSubscript:@"_rh"];

    __int16 v23 = [v3 request];
    id v24 = [v23 URL];
    uint64_t v25 = [v24 absoluteString];
    [v5 setObject:v25 forKeyedSubscript:@"_ru"];
  }
  int v26 = [v3 clientIdentifier];
  [v5 setObject:v26 forKeyedSubscript:@"_ci"];

  __int16 v27 = [v3 mediaApiRequestURL];
  id v28 = [v27 absoluteString];
  [v5 setObject:v28 forKeyedSubscript:@"_mru"];

  char v29 = [v3 title];
  [v5 setObject:v29 forKeyedSubscript:@"_tl"];

  id v30 = [v3 systemImageName];
  [v5 setObject:v30 forKeyedSubscript:@"_gl"];

  return v5;
}

+ (id)_dateFromString:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x1E4F28C10], "ams_serverFriendlyFormatter");
  id v5 = [v4 dateFromString:v3];

  if (!v5)
  {
    id v6 = objc_msgSend(MEMORY[0x1E4F28C10], "ams_serverFriendlyLocalTimeZoneFormatter");
    id v5 = [v6 dateFromString:v3];
  }
  return v5;
}

+ (AMSBagKeySet)bagKeySet
{
  uint64_t v2 = objc_alloc_init(AMSBagKeySet);
  return v2;
}

+ (id)handleNotificationResponse:(id)a3 bagContract:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[AMSContractBagShim alloc] initWithBagContract:v6];

  uint64_t v9 = [a1 handleNotificationResponse:v7 bag:v8];

  return v9;
}

- (id)handleSelectedButton:(id)a3 bagContract:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[AMSContractBagShim alloc] initWithBagContract:v6];

  uint64_t v9 = [(AMSUserNotification *)self handleSelectedButton:v7 bag:v8];

  return v9;
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (NSURL)artworkUrl
{
  return self->_artworkUrl;
}

- (void)setArtworkUrl:(id)a3
{
}

- (NSURL)videoUrl
{
  return self->_videoUrl;
}

- (void)setVideoUrl:(id)a3
{
}

- (NSArray)buttonActions
{
  return self->_buttonActions;
}

- (void)setButtonActions:(id)a3
{
}

- (NSString)centerBundleIdentifier
{
  return self->_centerBundleIdentifier;
}

- (void)setCenterBundleIdentifier:(id)a3
{
}

- (AMSUserNotificationAction)defaultAction
{
  return self->_defaultAction;
}

- (void)setDefaultAction:(id)a3
{
}

- (BOOL)explicitContent
{
  return self->_explicitContent;
}

- (void)setExplicitContent:(BOOL)a3
{
  self->_explicitContent = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)informativeText
{
  return self->_informativeText;
}

- (void)setInformativeText:(id)a3
{
}

- (NSString)logKey
{
  return self->_logKey;
}

- (void)setLogKey:(id)a3
{
}

- (NSDictionary)metricsEvent
{
  return self->_metricsEvent;
}

- (void)setMetricsEvent:(id)a3
{
}

- (NSDate)scheduledTime
{
  return self->_scheduledTime;
}

- (void)setScheduledTime:(id)a3
{
}

- (NSSet)subsections
{
  return self->_subsections;
}

- (void)setSubsections:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSMutableDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (unint64_t)interruptionLevel
{
  return self->_interruptionLevel;
}

- (void)setInterruptionLevel:(unint64_t)a3
{
  self->_interruptionLevel = a3;
}

- (BOOL)anonymizeMetrics
{
  return self->_anonymizeMetrics;
}

- (void)setAnonymizeMetrics:(BOOL)a3
{
  self->_anonymizeMetrics = a3;
}

- (int64_t)intent
{
  return self->_intent;
}

- (void)setIntent:(int64_t)a3
{
  self->_intent = a3;
}

- (NSString)categoryIdentifier
{
  return self->_categoryIdentifier;
}

- (void)setCategoryIdentifier:(id)a3
{
}

- (BOOL)shouldSuppressDefaultAction
{
  return self->_shouldSuppressDefaultAction;
}

- (void)setShouldSuppressDefaultAction:(BOOL)a3
{
  self->_shouldSuppressDefaultAction = a3;
}

- (NSString)threadIdentifier
{
  return self->_threadIdentifier;
}

- (void)setThreadIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threadIdentifier, 0);
  objc_storeStrong((id *)&self->_categoryIdentifier, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_subsections, 0);
  objc_storeStrong((id *)&self->_scheduledTime, 0);
  objc_storeStrong((id *)&self->_metricsEvent, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_informativeText, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_defaultAction, 0);
  objc_storeStrong((id *)&self->_centerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_buttonActions, 0);
  objc_storeStrong((id *)&self->_videoUrl, 0);
  objc_storeStrong((id *)&self->_artworkUrl, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end