@interface FBKLaunchAction
+ (id)actionWithURL:(id)a3;
+ (id)formStubsWithIdentifier:(id)a3 bugFormStubs:(id)a4;
+ (id)hostBundleIdentifier;
+ (id)mappingForBundleID:(id)a3;
+ (id)preferredTeamForLaunchAction:(id)a3 withFormStubs:(id)a4;
+ (id)urlSchemeForFeedbackID:(id)a3;
+ (id)validateURLSchemeFilePathsDictionary:(id)a3;
- (BOOL)comesFromFeedbackd;
- (BOOL)handlesLogin;
- (BOOL)hasAttachments;
- (BOOL)hasFormItemTatToFetch;
- (BOOL)hasPendingSysdiagnoseInAttachments;
- (BOOL)isCaptive;
- (BOOL)isFFUAction;
- (BOOL)isShowContentItemAction;
- (BOOL)launchesBatchUI;
- (BOOL)launchesFeedback;
- (BOOL)launchesInbox;
- (BOOL)launchesSurvey;
- (BOOL)shouldMakeFBAVisible;
- (BOOL)shouldNotifyOnUpload;
- (BOOL)shouldUndoMakeFBAVisible;
- (BOOL)showsItem;
- (FBKBugFormStub)exactMatchFormStub;
- (FBKLaunchAction)initWithURL:(id)a3;
- (FBKSCustomBehavior)customBehavior;
- (FBKTeam)teamForExactMatchFormStub;
- (NSDictionary)queryItemsFromURL;
- (NSDictionary)questionAnswerPairs;
- (NSDictionary)questionAnswerPairsFromURL;
- (NSDictionary)questionAnswersPairsFromURLV2;
- (NSMutableDictionary)attachments;
- (NSNumber)bugFormID;
- (NSNumber)bugformIDFromURL;
- (NSNumber)ffuID;
- (NSNumber)itemID;
- (NSSet)extensions;
- (NSString)action;
- (NSString)bundleID;
- (NSString)configurationToken;
- (NSString)formIdentifier;
- (NSString)isCaptiveFromURL;
- (NSString)loginToken;
- (NSString)shouldMakeVisibleFromURL;
- (NSString)shouldNotifyOnUploadFromURL;
- (NSURL)url;
- (id)description;
- (unint64_t)teamType;
- (void)addCustomBehavior:(id)a3;
- (void)findExactMatchFormStubAndTeamWithFormStubs:(id)a3;
- (void)setAction:(id)a3;
- (void)setAttachments:(id)a3;
- (void)setBugformIDFromURL:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setCustomBehavior:(id)a3;
- (void)setExactMatchFormStub:(id)a3;
- (void)setExtensions:(id)a3;
- (void)setFfuID:(id)a3;
- (void)setFormIdentifier:(id)a3;
- (void)setIsCaptiveFromURL:(id)a3;
- (void)setItemID:(id)a3;
- (void)setQueryItemsFromURL:(id)a3;
- (void)setQuestionAnswerPairsFromURL:(id)a3;
- (void)setQuestionAnswersPairsFromURLV2:(id)a3;
- (void)setShouldMakeVisibleFromURL:(id)a3;
- (void)setShouldNotifyOnUploadFromURL:(id)a3;
- (void)setTeamForExactMatchFormStub:(id)a3;
- (void)setTeamType:(unint64_t)a3;
- (void)setUrl:(id)a3;
@end

@implementation FBKLaunchAction

+ (id)actionWithURL:(id)a3
{
  id v3 = a3;
  v4 = [[FBKLaunchAction alloc] initWithURL:v3];

  return v4;
}

+ (id)mappingForBundleID:(id)a3
{
  id v3 = a3;
  v4 = [@"bundle-mapping" stringByAppendingString:@"-iOS"];
  v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v6 = (void *)MEMORY[0x263EFF8F8];
  v7 = [v5 URLForResource:v4 withExtension:@"json"];
  v8 = [v6 dataWithContentsOfURL:v7];

  if (v8)
  {
    id v16 = 0;
    v9 = [MEMORY[0x263F08900] JSONObjectWithData:v8 options:0 error:&v16];
    id v10 = v16;
    v11 = &stru_26DDF6A30;
    if (v3 && ([v3 isEqualToString:&stru_26DDF6A30] & 1) == 0)
    {
      [v3 rangeOfString:@"com.apple." options:8];
      if (v12)
      {
        if (v10)
        {
          v13 = &stru_26DDF6A30;
        }
        else
        {
          v13 = [v9 valueForKey:v3];
        }
      }
      else
      {
        v13 = @"seedios:3rdpartyapps";
      }
      v11 = v13;
    }

    v14 = v11;
  }
  else
  {
    v14 = 0;
    v11 = &stru_26DDF6A30;
  }

  return v14;
}

- (FBKLaunchAction)initWithURL:(id)a3
{
  uint64_t v114 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = +[FBKLog appHandle];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&buf[4] = v4;
    _os_log_impl(&dword_22A36D000, v5, OS_LOG_TYPE_DEFAULT, "Creating URL action with URL [%{public}@]", buf, 0xCu);
  }

  v109.receiver = self;
  v109.super_class = (Class)FBKLaunchAction;
  v6 = [(FBKLaunchAction *)&v109 init];
  v7 = v6;
  if (v6)
  {
    [(FBKLaunchAction *)v6 setUrl:v4];
    uint64_t v8 = [v4 host];
    p_action = (id *)&v7->_action;
    action = v7->_action;
    v7->_action = (NSString *)v8;

    attachments = v7->_attachments;
    v7->_attachments = 0;

    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x263F08BA0]) initWithURL:v4 resolvingAgainstBaseURL:1];
    v13 = [v12 queryItemsAsDictionary];
    p_queryItemsFromURL = (id *)&v7->_queryItemsFromURL;
    objc_storeStrong((id *)&v7->_queryItemsFromURL, v13);
    if (FBKIsInternalInstall(v15, v16))
    {
      uint64_t v17 = [v13 objectForKeyedSubscript:@"login_token"];
      loginToken = v7->_loginToken;
      v7->_loginToken = (NSString *)v17;
    }
    v19 = [*p_queryItemsFromURL objectForKeyedSubscript:@"is_captive"];
    if (v19)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_storeStrong((id *)&v7->_isCaptiveFromURL, v19);
      }
    }
    v20 = [*p_queryItemsFromURL objectForKeyedSubscript:@"make_visible"];
    if (v20)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_storeStrong((id *)&v7->_shouldMakeVisibleFromURL, v20);
      }
    }
    v21 = [*p_queryItemsFromURL objectForKeyedSubscript:@"notify_on_upload"];
    if (v21)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_storeStrong((id *)&v7->_shouldNotifyOnUploadFromURL, v21);
      }
    }
    v101 = v21;
    v22 = [(NSDictionary *)v7->_queryItemsFromURL objectForKeyedSubscript:@"team_type"];
    v7->_teamType = 1000;
    if (v22)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v7->_teamType = FBKTeamTypeFromString(v22);
      }
    }
    v104 = v22;
    uint64_t v23 = [v13 objectForKeyedSubscript:@"answers"];
    questionAnswerPairsFromURL = v7->_questionAnswerPairsFromURL;
    v7->_questionAnswerPairsFromURL = (NSDictionary *)v23;

    v25 = [v13 objectForKeyedSubscript:@"question"];
    v26 = [v13 objectForKeyedSubscript:@"questions"];
    if (v25)
    {
      v27 = [v25 transformValueToArray];

      v102 = v27;
      if (v26)
      {
        v28 = (NSDictionary *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:v27];
        [(NSDictionary *)v28 addEntriesFromDictionary:v26];
        uint64_t v29 = [NSDictionary dictionaryWithDictionary:v28];
        questionAnswersPairsFromURLV2 = v7->_questionAnswersPairsFromURLV2;
        v7->_questionAnswersPairsFromURLV2 = (NSDictionary *)v29;
      }
      else
      {
        v31 = v27;
        v28 = v7->_questionAnswersPairsFromURLV2;
        v7->_questionAnswersPairsFromURLV2 = v31;
      }
    }
    else
    {
      v102 = 0;
    }
    v103 = v20;
    v32 = v104;
    if (([*p_action isEqualToString:@"new"] & 1) != 0
      || [*p_action isEqualToString:@"launchFeedback"])
    {
      v98 = v26;
      uint64_t v33 = [v13 objectForKey:@"bundleID"];
      bundleID = v7->_bundleID;
      v7->_bundleID = (NSString *)v33;

      v35 = [v13 objectForKey:@"formID"];
      if (v35)
      {
        v36 = NSNumber;
        v37 = [v13 objectForKey:@"formID"];
        uint64_t v38 = objc_msgSend(v36, "numberWithInteger:", objc_msgSend(v37, "integerValue"));
        bugformIDFromURL = v7->_bugformIDFromURL;
        v7->_bugformIDFromURL = (NSNumber *)v38;
      }
      else
      {
        v37 = v7->_bugformIDFromURL;
        v7->_bugformIDFromURL = 0;
      }

      v40 = (void *)MEMORY[0x263EFF9A0];
      v41 = [v13 objectForKey:@"attach"];
      uint64_t v42 = [v40 dictionaryWithDictionary:v41];
      v43 = v7->_attachments;
      v7->_attachments = (NSMutableDictionary *)v42;

      uint64_t v44 = [v13 objectForKeyedSubscript:@"form_identifier"];
      formIdentifier = v7->_formIdentifier;
      v7->_formIdentifier = (NSString *)v44;

      id v46 = [v13 objectForKeyedSubscript:@"extension"];
      if (v46)
      {
        objc_opt_class();
        v32 = v104;
        if (objc_opt_isKindOfClass())
        {
          v47 = v46;
        }
        else
        {
          *(void *)buf = v46;
          v47 = [MEMORY[0x263EFF8C0] arrayWithObjects:buf count:1];
        }
        v48 = v47;
      }
      else
      {
        v48 = 0;
        v32 = v104;
      }

      v100 = v48;
      if ([v48 count])
      {
        v94 = v19;
        v95 = v12;
        v96 = v7;
        id v97 = v4;
        v58 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9C0]), "initWithCapacity:", -[NSObject count](v48, "count"));
        long long v105 = 0u;
        long long v106 = 0u;
        long long v107 = 0u;
        long long v108 = 0u;
        v59 = v48;
        uint64_t v60 = [v59 countByEnumeratingWithState:&v105 objects:v112 count:16];
        if (v60)
        {
          uint64_t v61 = v60;
          uint64_t v62 = *(void *)v106;
          do
          {
            for (uint64_t i = 0; i != v61; ++i)
            {
              if (*(void *)v106 != v62) {
                objc_enumerationMutation(v59);
              }
              uint64_t v64 = *(void *)(*((void *)&v105 + 1) + 8 * i);
              v65 = [FBKURLExtension alloc];
              v66 = [v13 objectForKeyedSubscript:v64];
              v67 = [(FBKURLExtension *)v65 initWithExtensionIdentifier:v64 parameters:v66];

              [v58 addObject:v67];
            }
            uint64_t v61 = [v59 countByEnumeratingWithState:&v105 objects:v112 count:16];
          }
          while (v61);
        }

        uint64_t v68 = [v58 copy];
        v7 = v96;
        extensions = v96->_extensions;
        v96->_extensions = (NSSet *)v68;

        id v4 = v97;
        v19 = v94;
        uint64_t v12 = v95;
        v20 = v103;
        v32 = v104;
        v48 = v100;
      }
      v70 = [(FBKLaunchAction *)v7 bundleID];

      if (v70)
      {
        v71 = objc_opt_class();
        v72 = [(FBKLaunchAction *)v7 bundleID];
        v73 = [v71 mappingForBundleID:v72];

        if (v73 && ([v73 isEqualToString:&stru_26DDF6A30] & 1) == 0)
        {
          v74 = (void *)[(NSDictionary *)v7->_questionAnswerPairsFromURL mutableCopy];
          v75 = v74;
          if (v74) {
            id v76 = v74;
          }
          else {
            id v76 = (id)objc_opt_new();
          }
          v80 = v76;

          v110 = @":area";
          v111 = v73;
          v81 = [NSDictionary dictionaryWithObjects:&v111 forKeys:&v110 count:1];
          [v80 addEntriesFromDictionary:v81];

          uint64_t v82 = [v80 copy];
          v83 = v7->_questionAnswerPairsFromURL;
          v7->_questionAnswerPairsFromURL = (NSDictionary *)v82;

          v48 = v100;
        }
      }
      if ([(FBKLaunchAction *)v7 hasPendingSysdiagnoseInAttachments])
      {
        v84 = v19;
        v85 = v12;
        v86 = [[FBKURLExtension alloc] initWithExtensionIdentifier:@"com.apple.DiagnosticExtensions.sysdiagnose" parameters:&unk_26DE1EAB0];
        v87 = [(FBKLaunchAction *)v7 extensions];
        v88 = v87;
        if (!v87) {
          v88 = objc_opt_new();
        }
        v89 = [v88 setByAddingObject:v86];
        [(FBKLaunchAction *)v7 setExtensions:v89];

        if (!v87) {
        v90 = [(FBKLaunchAction *)v7 attachments];
        }
        [v90 removeObjectForKey:@"com.apple.DiagnosticExtensions.sysdiagnose"];

        uint64_t v12 = v85;
        v19 = v84;
        v20 = v103;
        v32 = v104;
        v48 = v100;
        v57 = v101;
      }
      else
      {
        v57 = v101;
      }
      v26 = v98;
      goto LABEL_74;
    }
    if ([*p_action isEqualToString:@"show"])
    {
      v49 = [v13 objectForKey:@"item"];
      if (v49)
      {
        v50 = v49;
        if ([v49 hasPrefix:@"FB"])
        {
          uint64_t v51 = [v50 stringByReplacingOccurrencesOfString:@"FB" withString:&stru_26DDF6A30];

          v50 = (void *)v51;
        }
        uint64_t v52 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v50, "longLongValue"));
        itemID = v7->_itemID;
        v7->_itemID = (NSNumber *)v52;

        v32 = v104;
      }
      v54 = [v13 objectForKey:@"ffu"];
      v48 = v54;
      if (v54)
      {
        uint64_t v55 = objc_msgSend(NSNumber, "numberWithLongLong:", -[NSObject longLongValue](v54, "longLongValue"));
        ffuID = v7->_ffuID;
        v7->_ffuID = (NSNumber *)v55;
      }
    }
    else
    {
      if ([*p_action isEqualToString:@"login"])
      {
        uint64_t v77 = [v13 objectForKey:@"config"];
        configurationToken = v7->_configurationToken;
        v7->_configurationToken = (NSString *)v77;

        v57 = v101;
        if (v7->_configurationToken)
        {
LABEL_75:

          goto LABEL_76;
        }
        v48 = +[FBKLog appHandle];
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
          -[FBKLaunchAction initWithURL:](v48);
        }
LABEL_74:

        goto LABEL_75;
      }
      if ([*p_action isEqualToString:@"launchSurvey"])
      {
        uint64_t v79 = [v13 objectForKeyedSubscript:@"form_identifier"];
        v48 = v7->_formIdentifier;
        v7->_formIdentifier = (NSString *)v79;
      }
      else
      {
        v99 = v26;
        int v92 = [*p_action isEqualToString:@"evaluate"];
        v93 = +[FBKLog appHandle];
        v48 = v93;
        if (v92)
        {
          v26 = v99;
          if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22A36D000, v48, OS_LOG_TYPE_DEFAULT, "Parsed show batch UI launch action", buf, 2u);
          }
        }
        else
        {
          v26 = v99;
          if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR)) {
            -[FBKLaunchAction initWithURL:]((uint64_t *)&v7->_action, v48);
          }
        }
      }
    }
    v57 = v101;
    goto LABEL_74;
  }
LABEL_76:

  return v7;
}

- (BOOL)isShowContentItemAction
{
  if (![(FBKLaunchAction *)self showsItem]) {
    return 0;
  }
  id v3 = [(FBKLaunchAction *)self itemID];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)isFFUAction
{
  if (![(FBKLaunchAction *)self isShowContentItemAction]) {
    return 0;
  }
  id v3 = [(FBKLaunchAction *)self ffuID];
  BOOL v4 = v3 != 0;

  return v4;
}

- (NSString)loginToken
{
  if (FBKIsInternalInstall(self, a2)) {
    id v3 = self->_loginToken;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (BOOL)handlesLogin
{
  id v3 = [(FBKLaunchAction *)self action];
  if ([v3 isEqualToString:@"login"])
  {
    BOOL v4 = [(FBKLaunchAction *)self configurationToken];

    if (v4) {
      return 1;
    }
  }
  else
  {
  }
  if (!FBKIsInternalInstall(v5, v6)) {
    return 0;
  }
  uint64_t v8 = [(FBKLaunchAction *)self loginToken];
  BOOL v7 = v8 != 0;

  return v7;
}

- (void)addCustomBehavior:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = +[FBKLog appHandle];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = [(FBKLaunchAction *)self customBehavior];
    int v7 = 138543618;
    uint64_t v8 = v6;
    __int16 v9 = 2114;
    id v10 = self;
    _os_log_impl(&dword_22A36D000, v5, OS_LOG_TYPE_INFO, "Adding [%{public}@] to Launch Action [%{public}@]", (uint8_t *)&v7, 0x16u);
  }
  [(FBKLaunchAction *)self setCustomBehavior:v4];
}

+ (id)hostBundleIdentifier
{
  if (hostBundleIdentifier_onceToken != -1) {
    dispatch_once(&hostBundleIdentifier_onceToken, &__block_literal_global_25);
  }
  v2 = (void *)hostBundleIdentifier__hostBundleID;

  return v2;
}

void __39__FBKLaunchAction_hostBundleIdentifier__block_invoke()
{
  id v3 = [MEMORY[0x263F086E0] mainBundle];
  v0 = [v3 infoDictionary];
  uint64_t v1 = [v0 objectForKey:*MEMORY[0x263EFFB58]];
  v2 = (void *)hostBundleIdentifier__hostBundleID;
  hostBundleIdentifier__hostBundleID = v1;
}

- (id)description
{
  id v3 = NSString;
  id v4 = [(FBKLaunchAction *)self url];
  uint64_t v5 = [(FBKLaunchAction *)self customBehavior];
  uint64_t v6 = [v3 stringWithFormat:@"FBKLaunchAction %@, customBehavior: %@", v4, v5];

  return v6;
}

- (BOOL)isCaptive
{
  id v3 = [(FBKLaunchAction *)self isCaptiveFromURL];

  if (v3)
  {
    id v4 = [(FBKLaunchAction *)self isCaptiveFromURL];
    char v5 = [v4 isEqualToString:@"1"];
LABEL_5:
    LOBYTE(v6) = v5;

    return (char)v6;
  }
  uint64_t v6 = [(FBKLaunchAction *)self customBehavior];

  if (v6)
  {
    id v4 = [(FBKLaunchAction *)self customBehavior];
    char v5 = [v4 isCaptive];
    goto LABEL_5;
  }
  return (char)v6;
}

- (BOOL)shouldNotifyOnUpload
{
  id v3 = [(FBKLaunchAction *)self shouldNotifyOnUploadFromURL];

  if (v3)
  {
    id v4 = [(FBKLaunchAction *)self shouldNotifyOnUploadFromURL];
    char v5 = [v4 isEqualToString:@"1"];
LABEL_5:
    LOBYTE(v6) = v5;

    return (char)v6;
  }
  uint64_t v6 = [(FBKLaunchAction *)self customBehavior];

  if (v6)
  {
    id v4 = [(FBKLaunchAction *)self customBehavior];
    char v5 = [v4 notifyOnUpload];
    goto LABEL_5;
  }
  return (char)v6;
}

- (BOOL)shouldMakeFBAVisible
{
  id v3 = [(FBKLaunchAction *)self shouldMakeVisibleFromURL];

  if (v3)
  {
    id v4 = [(FBKLaunchAction *)self shouldMakeVisibleFromURL];
    char v5 = [v4 isEqualToString:@"1"];
LABEL_5:
    LOBYTE(v6) = v5;

    return (char)v6;
  }
  uint64_t v6 = [(FBKLaunchAction *)self customBehavior];

  if (v6)
  {
    id v4 = [(FBKLaunchAction *)self customBehavior];
    char v5 = [v4 makeVisible];
    goto LABEL_5;
  }
  return (char)v6;
}

- (NSNumber)bugFormID
{
  id v3 = [(FBKLaunchAction *)self bugformIDFromURL];

  if (v3)
  {
    id v4 = [(FBKLaunchAction *)self bugformIDFromURL];
  }
  else
  {
    char v5 = [(FBKLaunchAction *)self customBehavior];

    if (v5)
    {
      uint64_t v6 = [(FBKLaunchAction *)self customBehavior];
      id v4 = [v6 formId];
    }
    else
    {
      id v4 = 0;
    }
  }

  return (NSNumber *)v4;
}

- (NSDictionary)questionAnswerPairs
{
  id v3 = [(FBKLaunchAction *)self questionAnswerPairsFromURL];

  if (v3)
  {
    id v4 = [(FBKLaunchAction *)self questionAnswerPairsFromURL];
LABEL_5:
    int v7 = [v4 transformValueToArray];

    goto LABEL_6;
  }
  char v5 = [(FBKLaunchAction *)self customBehavior];

  if (v5)
  {
    uint64_t v6 = [(FBKLaunchAction *)self customBehavior];
    id v4 = [v6 answers];

    goto LABEL_5;
  }
  __int16 v9 = [(FBKLaunchAction *)self questionAnswersPairsFromURLV2];

  if (!v9)
  {
    id v4 = 0;
    goto LABEL_5;
  }
  int v7 = [(FBKLaunchAction *)self questionAnswersPairsFromURLV2];
LABEL_6:

  return (NSDictionary *)v7;
}

- (BOOL)shouldUndoMakeFBAVisible
{
  v2 = [(FBKLaunchAction *)self shouldMakeVisibleFromURL];
  char v3 = [v2 isEqualToString:@"0"];

  return v3;
}

- (BOOL)launchesInbox
{
  v2 = [(FBKLaunchAction *)self action];
  char v3 = [v2 isEqualToString:@"inbox"];

  return v3;
}

- (BOOL)launchesFeedback
{
  id v4 = [(FBKLaunchAction *)self action];
  if (([v4 isEqualToString:@"new"] & 1) == 0)
  {
    uint64_t v6 = [(FBKLaunchAction *)self action];
    if ([v6 isEqualToString:@"launchFeedback"])
    {
      char v5 = 1;
LABEL_12:

      goto LABEL_13;
    }
    int v7 = [(FBKLaunchAction *)self customBehavior];
    if (v7
      && ([(FBKLaunchAction *)self customBehavior],
          v2 = objc_claimAutoreleasedReturnValue(),
          ([v2 launchNewDraft] & 1) != 0))
    {
      char v5 = 1;
    }
    else
    {
      uint64_t v8 = [(FBKLaunchAction *)self customBehavior];
      if (v8)
      {
        __int16 v9 = (void *)v8;
        id v10 = [(FBKLaunchAction *)self customBehavior];
        char v5 = [v10 isCaptive];

        if (!v7)
        {
LABEL_11:

          goto LABEL_12;
        }
      }
      else
      {
        char v5 = 0;
        if (!v7) {
          goto LABEL_11;
        }
      }
    }

    goto LABEL_11;
  }
  char v5 = 1;
LABEL_13:

  return v5;
}

- (BOOL)launchesSurvey
{
  v2 = [(FBKLaunchAction *)self action];
  char v3 = [v2 isEqualToString:@"launchSurvey"];

  return v3;
}

- (BOOL)launchesBatchUI
{
  v2 = [(FBKLaunchAction *)self action];
  char v3 = [v2 isEqualToString:@"evaluate"];

  return v3;
}

+ (id)validateURLSchemeFilePathsDictionary:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    v21 = objc_opt_new();
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id obj = [v3 allKeys];
    uint64_t v4 = [obj countByEnumeratingWithState:&v24 objects:v34 count:16];
    if (v4)
    {
      uint64_t v6 = v4;
      uint64_t v7 = *(void *)v25;
      *(void *)&long long v5 = 138412802;
      long long v20 = v5;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v25 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          id v10 = objc_msgSend(v3, "objectForKeyedSubscript:", v9, v20);
          uint64_t v11 = [NSURL fileURLWithPath:v10];
          id v23 = 0;
          int v12 = [v11 checkResourceIsReachableAndReturnError:&v23];
          id v13 = v23;
          if (v12)
          {
            [v21 setObject:v11 forKey:v9];
          }
          else
          {
            v14 = +[FBKLog appHandle];
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v20;
              uint64_t v29 = v10;
              __int16 v30 = 2112;
              v31 = v11;
              __int16 v32 = 2112;
              id v33 = v13;
              _os_log_error_impl(&dword_22A36D000, v14, OS_LOG_TYPE_ERROR, "Cannot attach local file path [%@] url: [%@] error? [%@]", buf, 0x20u);
            }
          }
          uint64_t v15 = +[FBKLog appHandle];
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v20;
            uint64_t v29 = v10;
            __int16 v30 = 2112;
            v31 = v11;
            __int16 v32 = 2112;
            id v33 = v13;
            _os_log_debug_impl(&dword_22A36D000, v15, OS_LOG_TYPE_DEBUG, "Validated local file path [%@] url: [%@] error? [%@]", buf, 0x20u);
          }
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v34 count:16];
      }
      while (v6);
    }

    uint64_t v16 = [v21 allKeys];
    if (v16)
    {
      uint64_t v17 = [v21 allKeys];
      uint64_t v18 = [v17 count];

      if (v18) {
        uint64_t v16 = (void *)[v21 copy];
      }
      else {
        uint64_t v16 = 0;
      }
    }
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

- (BOOL)hasPendingSysdiagnoseInAttachments
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F08850] defaultManager];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v4 = [(FBKLaunchAction *)self attachments];
  long long v5 = [v4 allKeys];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v10 isEqualToString:@"com.apple.DiagnosticExtensions.sysdiagnose"])
        {
          uint64_t v11 = [(FBKLaunchAction *)self attachments];
          int v12 = [v11 objectForKeyedSubscript:v10];

          if (v12 && ([v3 fileExistsAtPath:v12] & 1) == 0)
          {
            v14 = +[FBKLog attachHandle];
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v21 = v12;
              _os_log_impl(&dword_22A36D000, v14, OS_LOG_TYPE_DEFAULT, "Found key-chord sysdiagnose [%{public}@]", buf, 0xCu);
            }

            BOOL v13 = 1;
            goto LABEL_16;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v22 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 0;
LABEL_16:

  return v13;
}

+ (id)urlSchemeForFeedbackID:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = [NSString stringWithFormat:@"%@://%@?item=%@", @"applefeedback", @"show", a3];
  uint64_t v4 = +[FBKLog appHandle];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v8 = v3;
    _os_log_impl(&dword_22A36D000, v4, OS_LOG_TYPE_INFO, "Building URL from string [%{public}@]", buf, 0xCu);
  }

  long long v5 = [NSURL URLWithString:v3];

  return v5;
}

- (void)findExactMatchFormStubAndTeamWithFormStubs:(id)a3
{
  id v4 = a3;
  long long v5 = [(FBKLaunchAction *)self formIdentifier];
  uint64_t v6 = +[FBKLaunchAction formStubsWithIdentifier:v5 bugFormStubs:v4];

  if (v6)
  {
    uint64_t v7 = +[FBKLaunchAction preferredTeamForLaunchAction:self withFormStubs:v6];
    [(FBKLaunchAction *)self setTeamForExactMatchFormStub:v7];

    uint64_t v8 = [(FBKLaunchAction *)self teamForExactMatchFormStub];
    uint64_t v9 = [v8 forms];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __62__FBKLaunchAction_findExactMatchFormStubAndTeamWithFormStubs___block_invoke;
    v11[3] = &unk_264875A60;
    id v12 = v6;
    id v10 = objc_msgSend(v9, "ded_findWithBlock:", v11);
    [(FBKLaunchAction *)self setExactMatchFormStub:v10];
  }
}

uint64_t __62__FBKLaunchAction_findExactMatchFormStubAndTeamWithFormStubs___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

+ (id)formStubsWithIdentifier:(id)a3 bugFormStubs:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __56__FBKLaunchAction_formStubsWithIdentifier_bugFormStubs___block_invoke;
  v26[3] = &unk_264875A60;
  id v6 = v5;
  id v27 = v6;
  uint64_t v7 = objc_msgSend(a4, "ded_selectItemsPassingTest:", v26);
  uint64_t v8 = [v7 valueForKeyPath:@"serverID"];
  if ((unint64_t)[v8 count] < 2)
  {
    id v20 = v7;
  }
  else
  {
    uint64_t v9 = [v8 allObjects];
    id v10 = [v9 componentsJoinedByString:@", "];

    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:5];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v12 = objc_msgSend(v7, "valueForKeyPath:", @"teams.ID", 0);
    BOOL v13 = [v12 allObjects];

    uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v34 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(v13);
          }
          if (*(void *)(*((void *)&v22 + 1) + 8 * i)) {
            objc_msgSend(v11, "addObjectsFromArray:");
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v34 count:16];
      }
      while (v15);
    }

    long long v18 = [v11 componentsJoinedByString:@", "];
    long long v19 = +[FBKLog model];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      id v29 = v6;
      __int16 v30 = 2114;
      v31 = v10;
      __int16 v32 = 2114;
      id v33 = v18;
      _os_log_error_impl(&dword_22A36D000, v19, OS_LOG_TYPE_ERROR, "form_identifier [%{public}@] matched more than one From Stub [%{public}@] in teams [%{public}@]", buf, 0x20u);
    }

    id v20 = 0;
  }

  return v20;
}

uint64_t __56__FBKLaunchAction_formStubsWithIdentifier_bugFormStubs___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 tat];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

+ (id)preferredTeamForLaunchAction:(id)a3 withFormStubs:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263EFF9C0]) initWithCapacity:4];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        BOOL v13 = [*(id *)(*((void *)&v21 + 1) + 8 * i) teams];
        [v7 unionSet:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  if ([v7 count] == 1 || (unint64_t)objc_msgSend(v7, "count") < 2) {
    goto LABEL_14;
  }
  if ([v5 teamType] == 1000)
  {
    uint64_t v14 = objc_msgSend(v7, "ded_findWithBlock:", &__block_literal_global_167);
    uint64_t v15 = 0;
  }
  else
  {
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __62__FBKLaunchAction_preferredTeamForLaunchAction_withFormStubs___block_invoke;
    v19[3] = &unk_264875A88;
    id v20 = v5;
    uint64_t v15 = objc_msgSend(v7, "ded_findWithBlock:", v19);

    uint64_t v14 = 0;
  }
  if (v15 | v14)
  {
    if (v15) {
      long long v18 = (void *)v15;
    }
    else {
      long long v18 = (void *)v14;
    }
    id v16 = v18;
  }
  else
  {
LABEL_14:
    id v16 = [v7 anyObject];
  }

  return v16;
}

BOOL __62__FBKLaunchAction_preferredTeamForLaunchAction_withFormStubs___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 teamType];
  return v3 == [*(id *)(a1 + 32) teamType];
}

BOOL __62__FBKLaunchAction_preferredTeamForLaunchAction_withFormStubs___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 teamType] == 0;
}

- (BOOL)hasFormItemTatToFetch
{
  if (![(FBKLaunchAction *)self launchesFeedback]) {
    return 0;
  }
  uint64_t v3 = [(FBKLaunchAction *)self formIdentifier];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)hasAttachments
{
  v2 = [(FBKLaunchAction *)self attachments];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)showsItem
{
  v2 = [(FBKLaunchAction *)self action];
  char v3 = [v2 isEqualToString:@"show"];

  return v3;
}

- (BOOL)comesFromFeedbackd
{
  char v3 = [(FBKLaunchAction *)self action];
  if ([v3 isEqualToString:@"launchSurvey"])
  {
    char v4 = 1;
  }
  else
  {
    id v5 = [(FBKLaunchAction *)self action];
    char v4 = [v5 isEqualToString:@"launchFeedback"];
  }
  return v4;
}

- (NSString)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSNumber)itemID
{
  return self->_itemID;
}

- (void)setItemID:(id)a3
{
}

- (NSNumber)ffuID
{
  return self->_ffuID;
}

- (void)setFfuID:(id)a3
{
}

- (NSSet)extensions
{
  return self->_extensions;
}

- (void)setExtensions:(id)a3
{
}

- (NSMutableDictionary)attachments
{
  return self->_attachments;
}

- (void)setAttachments:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSString)configurationToken
{
  return self->_configurationToken;
}

- (NSString)formIdentifier
{
  return self->_formIdentifier;
}

- (void)setFormIdentifier:(id)a3
{
}

- (unint64_t)teamType
{
  return self->_teamType;
}

- (void)setTeamType:(unint64_t)a3
{
  self->_teamType = a3;
}

- (FBKBugFormStub)exactMatchFormStub
{
  return self->_exactMatchFormStub;
}

- (void)setExactMatchFormStub:(id)a3
{
}

- (FBKTeam)teamForExactMatchFormStub
{
  return self->_teamForExactMatchFormStub;
}

- (void)setTeamForExactMatchFormStub:(id)a3
{
}

- (NSDictionary)queryItemsFromURL
{
  return self->_queryItemsFromURL;
}

- (void)setQueryItemsFromURL:(id)a3
{
}

- (NSString)shouldMakeVisibleFromURL
{
  return self->_shouldMakeVisibleFromURL;
}

- (void)setShouldMakeVisibleFromURL:(id)a3
{
}

- (NSString)isCaptiveFromURL
{
  return self->_isCaptiveFromURL;
}

- (void)setIsCaptiveFromURL:(id)a3
{
}

- (NSString)shouldNotifyOnUploadFromURL
{
  return self->_shouldNotifyOnUploadFromURL;
}

- (void)setShouldNotifyOnUploadFromURL:(id)a3
{
}

- (NSNumber)bugformIDFromURL
{
  return self->_bugformIDFromURL;
}

- (void)setBugformIDFromURL:(id)a3
{
}

- (NSDictionary)questionAnswerPairsFromURL
{
  return self->_questionAnswerPairsFromURL;
}

- (void)setQuestionAnswerPairsFromURL:(id)a3
{
}

- (NSDictionary)questionAnswersPairsFromURLV2
{
  return self->_questionAnswersPairsFromURLV2;
}

- (void)setQuestionAnswersPairsFromURLV2:(id)a3
{
}

- (FBKSCustomBehavior)customBehavior
{
  return self->_customBehavior;
}

- (void)setCustomBehavior:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customBehavior, 0);
  objc_storeStrong((id *)&self->_questionAnswersPairsFromURLV2, 0);
  objc_storeStrong((id *)&self->_questionAnswerPairsFromURL, 0);
  objc_storeStrong((id *)&self->_bugformIDFromURL, 0);
  objc_storeStrong((id *)&self->_shouldNotifyOnUploadFromURL, 0);
  objc_storeStrong((id *)&self->_isCaptiveFromURL, 0);
  objc_storeStrong((id *)&self->_shouldMakeVisibleFromURL, 0);
  objc_storeStrong((id *)&self->_queryItemsFromURL, 0);
  objc_storeStrong((id *)&self->_teamForExactMatchFormStub, 0);
  objc_storeStrong((id *)&self->_exactMatchFormStub, 0);
  objc_storeStrong((id *)&self->_formIdentifier, 0);
  objc_storeStrong((id *)&self->_configurationToken, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_extensions, 0);
  objc_storeStrong((id *)&self->_ffuID, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_action, 0);

  objc_storeStrong((id *)&self->_loginToken, 0);
}

- (void)initWithURL:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_22A36D000, log, OS_LOG_TYPE_ERROR, "No configuration token found. Will not login", v1, 2u);
}

- (void)initWithURL:(uint64_t *)a1 .cold.2(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_22A36D000, a2, OS_LOG_TYPE_ERROR, "Action [%@] in URL not supported", (uint8_t *)&v3, 0xCu);
}

@end