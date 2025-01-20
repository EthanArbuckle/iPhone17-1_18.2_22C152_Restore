@interface CKContextResponse
+ (BOOL)supportsSecureCoding;
+ (NSError)invalidProcessError;
+ (NSError)malformedRequestError;
+ (NSError)missingEntitlementError;
+ (NSError)serviceBusyError;
+ (NSError)serviceDisabledError;
+ (NSError)timeoutError;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPlaceholder;
- (BOOL)resultsNeedFiltering;
- (CGSize)availableLayoutSize;
- (CKContextFingerprintMinHash)requestFingerprint;
- (CKContextRequest)debugRequest;
- (CKContextResponse)initWithCoder:(id)a3;
- (CKContextResponse)initWithError:(id)a3 requestType:(unint64_t)a4;
- (CKContextResponse)initWithResults:(id)a3 requestType:(unint64_t)a4;
- (NSArray)donorBundleIdentifiers;
- (NSArray)level1Topics;
- (NSArray)level2Topics;
- (NSArray)results;
- (NSDate)hideCompletionsAfterDate;
- (NSDate)responseDate;
- (NSDictionary)partsOfSpeechToTexts;
- (NSError)error;
- (NSString)debug;
- (NSString)languageTag;
- (NSString)uuid;
- (id)completer;
- (id)initPlaceholderWithUUID:(id)a3 requestType:(unint64_t)a4;
- (id)responseSummary:(BOOL)a3 showHigherLevelTopics:(BOOL)a4 maxPrefix:(int64_t)a5;
- (id)resultByQuery:(id)a3;
- (id)toJSONSerializableDictionary;
- (unint64_t)hash;
- (unint64_t)mustPrefixMatchLength;
- (unint64_t)requestType;
- (void)addDebug:(id)a3;
- (void)appendToDebug:(id)a3;
- (void)dealloc;
- (void)discard;
- (void)discardAndLogCompleter:(id)a3 likelyUnsolicited:(BOOL)a4;
- (void)encodeWithCoder:(id)a3;
- (void)logEngagement:(id)a3 forInputLength:(unint64_t)a4 completion:(id)a5 likelyUnsolicited:(BOOL)a6;
- (void)logTransactionSuccessfulForInputLength:(unint64_t)a3 completion:(id)a4 likelyUnsolicited:(BOOL)a5;
- (void)markResultsShown:(unint64_t)a3 serverOverride:(BOOL)a4 forInputLength:(unint64_t)a5 results:(id)a6;
- (void)setAvailableLayoutSize:(CGSize)a3;
- (void)setDebug:(id)a3;
- (void)setDebugRequest:(id)a3;
- (void)setDonorBundleIdentifiers:(id)a3;
- (void)setError:(id)a3;
- (void)setHideCompletionsAfterDate:(id)a3;
- (void)setHideCompletionsTimeLimit:(double)a3;
- (void)setLanguageTag:(id)a3;
- (void)setLevel1Topics:(id)a3;
- (void)setLevel2Topics:(id)a3;
- (void)setMustPrefixMatchLength:(unint64_t)a3;
- (void)setPartsOfSpeechToTexts:(id)a3;
- (void)setRequestFingerprint:(id)a3;
- (void)setRequestType:(unint64_t)a3;
- (void)setResponseDate:(id)a3;
- (void)setResults:(id)a3;
- (void)setResultsNeedFiltering:(BOOL)a3;
- (void)setUuid:(id)a3;
@end

@implementation CKContextResponse

- (void)setAvailableLayoutSize:(CGSize)a3
{
  self->_availableLayoutSize = a3;
}

- (NSArray)level2Topics
{
  return self->_level2Topics;
}

- (NSArray)level1Topics
{
  return self->_level1Topics;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL resultsNeedFiltering = self->_resultsNeedFiltering;
  id v7 = a3;
  [v7 encodeBool:resultsNeedFiltering forKey:@"resultsNeedFiltering"];
  -[NSCoder encodeUInteger:forKey:](v7, (const char *)self->_requestType, @"requestType");
  -[NSCoder encodeUInteger:forKey:](v7, (const char *)self->_mustPrefixMatchLength, @"mustPrefixMatchLength");
  [v7 encodeObject:self->_uuid forKey:@"uuid"];
  [v7 encodeObject:self->_error forKey:@"error"];
  [v7 encodeObject:self->_languageTag forKey:@"languageTag"];
  [v7 encodeObject:self->_debug forKey:@"debug"];
  [v7 encodeObject:self->_results forKey:@"results"];
  [v7 encodeObject:self->_requestFingerprint forKey:@"requestFingerprint"];
  [v7 encodeObject:self->_level1Topics forKey:@"level1Topics"];
  [v7 encodeObject:self->_level2Topics forKey:@"level2Topics"];
  [v7 encodeObject:self->_donorBundleIdentifiers forKey:@"donorBundleIdentifiers"];
  [v7 encodeObject:self->_partsOfSpeechToTexts forKey:@"partsOfSpeechToTexts"];
  [v7 encodeObject:self->_debugRequest forKey:@"debugRequest"];
  CGFloat width = self->_availableLayoutSize.width;
  *(float *)&CGFloat width = width;
  [v7 encodeFloat:@"availableLayoutSize.width" forKey:width];
  CGFloat height = self->_availableLayoutSize.height;
  *(float *)&CGFloat height = height;
  [v7 encodeFloat:@"availableLayoutSize.height" forKey:height];
}

- (void)dealloc
{
  [(CKContextResponse *)self discard];
  v3.receiver = self;
  v3.super_class = (Class)CKContextResponse;
  [(CKContextResponse *)&v3 dealloc];
}

- (void)discard
{
  obj = self;
  objc_sync_enter(obj);
  if (!obj->_discarded) {
    obj->_discarded = 1;
  }
  objc_sync_exit(obj);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugRequest, 0);
  objc_storeStrong((id *)&self->_responseDate, 0);
  objc_storeStrong((id *)&self->_hideCompletionsAfterDate, 0);
  objc_storeStrong((id *)&self->_requestFingerprint, 0);
  objc_storeStrong((id *)&self->_partsOfSpeechToTexts, 0);
  objc_storeStrong((id *)&self->_debug, 0);
  objc_storeStrong((id *)&self->_languageTag, 0);
  objc_storeStrong((id *)&self->_donorBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_level2Topics, 0);
  objc_storeStrong((id *)&self->_level1Topics, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_loggingCouldHaveShown, 0);
}

- (CKContextResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)CKContextResponse;
  v5 = [(CKContextResponse *)&v45 init];
  if (v5)
  {
    v5->_BOOL resultsNeedFiltering = [v4 decodeBoolForKey:@"resultsNeedFiltering"];
    v5->_requestType = (unint64_t)-[NSCoder decodeUIntegerForKey:](v4, (const char *)@"requestType");
    v5->_mustPrefixMatchLength = (unint64_t)-[NSCoder decodeUIntegerForKey:](v4, (const char *)@"mustPrefixMatchLength");
    if (initWithCoder__onceToken_0 != -1) {
      dispatch_once(&initWithCoder__onceToken_0, &__block_literal_global_2);
    }
    id v6 = (id)initWithCoder__x_0;
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"uuid"];
    uuid = v5->_uuid;
    v5->_uuid = (NSString *)v7;

    if (initWithCoder__onceToken_17 != -1) {
      dispatch_once(&initWithCoder__onceToken_17, &__block_literal_global_19);
    }
    id v9 = (id)initWithCoder__x_16;
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"error"];
    error = v5->_error;
    v5->_error = (NSError *)v10;

    if (initWithCoder__onceToken_24 != -1) {
      dispatch_once(&initWithCoder__onceToken_24, &__block_literal_global_26);
    }
    id v12 = (id)initWithCoder__x_23;
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"languageTag"];
    languageTag = v5->_languageTag;
    v5->_languageTag = (NSString *)v13;

    if (initWithCoder__onceToken_31 != -1) {
      dispatch_once(&initWithCoder__onceToken_31, &__block_literal_global_33);
    }
    id v15 = (id)initWithCoder__x_30;
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"debug"];
    debug = v5->_debug;
    v5->_debug = (NSString *)v16;

    if (initWithCoder__onceToken_38 != -1) {
      dispatch_once(&initWithCoder__onceToken_38, &__block_literal_global_40);
    }
    id v18 = (id)initWithCoder__x_37;
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"results"];
    results = v5->_results;
    v5->_results = (NSArray *)v19;

    if (initWithCoder__onceToken_46 != -1) {
      dispatch_once(&initWithCoder__onceToken_46, &__block_literal_global_48);
    }
    id v21 = (id)initWithCoder__x_45;
    uint64_t v22 = [v4 decodeObjectOfClasses:v21 forKey:@"requestFingerprint"];
    requestFingerprint = v5->_requestFingerprint;
    v5->_requestFingerprint = (CKContextFingerprintMinHash *)v22;

    if (initWithCoder__onceToken_54 != -1) {
      dispatch_once(&initWithCoder__onceToken_54, &__block_literal_global_56);
    }
    id v24 = (id)initWithCoder__x_53;
    uint64_t v25 = [v4 decodeObjectOfClasses:v24 forKey:@"level1Topics"];
    level1Topics = v5->_level1Topics;
    v5->_level1Topics = (NSArray *)v25;

    if (initWithCoder__onceToken_61 != -1) {
      dispatch_once(&initWithCoder__onceToken_61, &__block_literal_global_63);
    }
    id v27 = (id)initWithCoder__x_60;
    uint64_t v28 = [v4 decodeObjectOfClasses:v27 forKey:@"level2Topics"];
    level2Topics = v5->_level2Topics;
    v5->_level2Topics = (NSArray *)v28;

    if (initWithCoder__onceToken_68 != -1) {
      dispatch_once(&initWithCoder__onceToken_68, &__block_literal_global_70);
    }
    id v30 = (id)initWithCoder__x_67;
    uint64_t v31 = [v4 decodeObjectOfClasses:v30 forKey:@"donorBundleIdentifiers"];
    donorBundleIdentifiers = v5->_donorBundleIdentifiers;
    v5->_donorBundleIdentifiers = (NSArray *)v31;

    if (initWithCoder__onceToken_75 != -1) {
      dispatch_once(&initWithCoder__onceToken_75, &__block_literal_global_77);
    }
    id v33 = (id)initWithCoder__x_74;
    uint64_t v34 = [v4 decodeObjectOfClasses:v33 forKey:@"partsOfSpeechToTexts"];
    partsOfSpeechToTexts = v5->_partsOfSpeechToTexts;
    v5->_partsOfSpeechToTexts = (NSDictionary *)v34;

    if (initWithCoder__onceToken_83 != -1) {
      dispatch_once(&initWithCoder__onceToken_83, &__block_literal_global_85);
    }
    id v36 = (id)initWithCoder__x_82;
    uint64_t v37 = [v4 decodeObjectOfClasses:v36 forKey:@"debugRequest"];
    debugRequest = v5->_debugRequest;
    v5->_debugRequest = (CKContextRequest *)v37;

    uint64_t v39 = [MEMORY[0x1E4F1C9C8] date];
    responseDate = v5->_responseDate;
    v5->_responseDate = (NSDate *)v39;

    [v4 decodeDoubleForKey:@"hideCompletionsTimeLimit"];
    -[CKContextResponse setHideCompletionsTimeLimit:](v5, "setHideCompletionsTimeLimit:");
    [v4 decodeFloatForKey:@"availableLayoutSize.width"];
    CGFloat v42 = v41;
    [v4 decodeFloatForKey:@"availableLayoutSize.height"];
    v5->_availableLayoutSize.CGFloat width = v42;
    v5->_availableLayoutSize.CGFloat height = v43;
  }

  return v5;
}

- (void)setLevel2Topics:(id)a3
{
}

- (void)setLevel1Topics:(id)a3
{
}

- (void)setHideCompletionsTimeLimit:(double)a3
{
  self->_hideCompletionsTimeLimit = a3;
  if (a3 <= 0.0)
  {
    hideCompletionsAfterDate = self->_hideCompletionsAfterDate;
    self->_hideCompletionsAfterDate = 0;
  }
  else
  {
    v8 = [MEMORY[0x1E4F1C9C8] date];
    v5 = [(NSDate *)v8 dateByAddingTimeInterval:a3];
    id v6 = self->_hideCompletionsAfterDate;
    self->_hideCompletionsAfterDate = v5;

    hideCompletionsAfterDate = v8;
  }
}

- (NSError)error
{
  return self->_error;
}

- (CKContextResponse)initWithResults:(id)a3 requestType:(unint64_t)a4
{
  id v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CKContextResponse;
  v8 = [(CKContextResponse *)&v15 init];
  if (v8)
  {
    id v9 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v10 = [v9 UUIDString];
    [(CKContextResponse *)v8 setUuid:v10];

    v8->_requestType = a4;
    objc_storeStrong((id *)&v8->_results, a3);
    error = v8->_error;
    v8->_error = 0;

    v8->_availableLayoutSize.CGFloat width = 0.0;
    v8->_availableLayoutSize.CGFloat height = 0.0;
    uint64_t v12 = [MEMORY[0x1E4F1C9C8] date];
    responseDate = v8->_responseDate;
    v8->_responseDate = (NSDate *)v12;

    [(CKContextResponse *)v8 setHideCompletionsTimeLimit:900.0];
  }

  return v8;
}

- (CKContextResponse)initWithError:(id)a3 requestType:(unint64_t)a4
{
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CKContextResponse;
  id v7 = [(CKContextResponse *)&v16 init];
  if (v7)
  {
    v8 = [MEMORY[0x1E4F29128] UUID];
    id v9 = [v8 UUIDString];
    [(CKContextResponse *)v7 setUuid:v9];

    results = v7->_results;
    v7->_results = 0;

    v7->_availableLayoutSize.CGFloat width = 0.0;
    v7->_availableLayoutSize.CGFloat height = 0.0;
    v7->_requestType = a4;
    uint64_t v11 = [MEMORY[0x1E4F1C9C8] date];
    responseDate = v7->_responseDate;
    v7->_responseDate = (NSDate *)v11;

    if (v6)
    {
      uint64_t v13 = [v6 copy];
    }
    else
    {
      uint64_t v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.siri.context" code:8 userInfo:0];
    }
    error = v7->_error;
    v7->_error = (NSError *)v13;

    [(CKContextResponse *)v7 setHideCompletionsTimeLimit:900.0];
  }

  return v7;
}

- (id)initPlaceholderWithUUID:(id)a3 requestType:(unint64_t)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CKContextResponse;
  id v7 = [(CKContextResponse *)&v14 init];
  v8 = v7;
  if (v7)
  {
    [(CKContextResponse *)v7 setUuid:v6];
    results = v8->_results;
    v8->_results = 0;

    error = v8->_error;
    v8->_error = 0;

    v8->_availableLayoutSize.CGFloat width = 0.0;
    v8->_availableLayoutSize.CGFloat height = 0.0;
    v8->_requestType = a4;
    uint64_t v11 = [MEMORY[0x1E4F1C9C8] date];
    responseDate = v8->_responseDate;
    v8->_responseDate = (NSDate *)v11;
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __35__CKContextResponse_initWithCoder___block_invoke()
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  uint64_t v2 = [v0 setWithArray:v1];
  objc_super v3 = (void *)initWithCoder__x_0;
  initWithCoder__x_0 = v2;
}

void __35__CKContextResponse_initWithCoder___block_invoke_2()
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  uint64_t v2 = [v0 setWithArray:v1];
  objc_super v3 = (void *)initWithCoder__x_16;
  initWithCoder__x_16 = v2;
}

void __35__CKContextResponse_initWithCoder___block_invoke_3()
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  uint64_t v2 = [v0 setWithArray:v1];
  objc_super v3 = (void *)initWithCoder__x_23;
  initWithCoder__x_23 = v2;
}

void __35__CKContextResponse_initWithCoder___block_invoke_4()
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  uint64_t v2 = [v0 setWithArray:v1];
  objc_super v3 = (void *)initWithCoder__x_30;
  initWithCoder__x_30 = v2;
}

void __35__CKContextResponse_initWithCoder___block_invoke_5()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v4 count:3];
  uint64_t v2 = objc_msgSend(v0, "setWithArray:", v1, v4, v5);
  objc_super v3 = (void *)initWithCoder__x_37;
  initWithCoder__x_37 = v2;
}

void __35__CKContextResponse_initWithCoder___block_invoke_6()
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  uint64_t v2 = [v0 setWithArray:v1];
  objc_super v3 = (void *)initWithCoder__x_45;
  initWithCoder__x_45 = v2;
}

void __35__CKContextResponse_initWithCoder___block_invoke_7()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v4 count:3];
  uint64_t v2 = objc_msgSend(v0, "setWithArray:", v1, v4, v5);
  objc_super v3 = (void *)initWithCoder__x_53;
  initWithCoder__x_53 = v2;
}

void __35__CKContextResponse_initWithCoder___block_invoke_8()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v4 count:3];
  uint64_t v2 = objc_msgSend(v0, "setWithArray:", v1, v4, v5);
  objc_super v3 = (void *)initWithCoder__x_60;
  initWithCoder__x_60 = v2;
}

void __35__CKContextResponse_initWithCoder___block_invoke_9()
{
  void v4[2] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  uint64_t v2 = [v0 setWithArray:v1];
  objc_super v3 = (void *)initWithCoder__x_67;
  initWithCoder__x_67 = v2;
}

void __35__CKContextResponse_initWithCoder___block_invoke_10()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v4 count:3];
  uint64_t v2 = objc_msgSend(v0, "setWithArray:", v1, v4, v5);
  objc_super v3 = (void *)initWithCoder__x_74;
  initWithCoder__x_74 = v2;
}

void __35__CKContextResponse_initWithCoder___block_invoke_11()
{
  void v4[2] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  uint64_t v2 = [v0 setWithArray:v1];
  objc_super v3 = (void *)initWithCoder__x_82;
  initWithCoder__x_82 = v2;
}

+ (NSError)serviceDisabledError
{
  uint64_t v2 = (void *)MEMORY[0x1E4F28C58];
  objc_super v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:@"Feature is disabled or unavailable" forKey:*MEMORY[0x1E4F28588]];
  uint64_t v4 = [v2 errorWithDomain:@"com.apple.siri.context" code:7 userInfo:v3];

  return (NSError *)v4;
}

+ (NSError)serviceBusyError
{
  uint64_t v2 = (void *)MEMORY[0x1E4F28C58];
  objc_super v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:@"Too many concurrent requests at this time" forKey:*MEMORY[0x1E4F28588]];
  uint64_t v4 = [v2 errorWithDomain:@"com.apple.siri.context" code:6 userInfo:v3];

  return (NSError *)v4;
}

+ (NSError)missingEntitlementError
{
  uint64_t v2 = (void *)MEMORY[0x1E4F28C58];
  objc_super v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:@"Missing entitlement for request type" forKey:*MEMORY[0x1E4F28588]];
  uint64_t v4 = [v2 errorWithDomain:@"com.apple.siri.context" code:3 userInfo:v3];

  return (NSError *)v4;
}

+ (NSError)invalidProcessError
{
  uint64_t v2 = (void *)MEMORY[0x1E4F28C58];
  objc_super v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:@"This process is not allowed request via internal API" forKey:*MEMORY[0x1E4F28588]];
  uint64_t v4 = [v2 errorWithDomain:@"com.apple.siri.context" code:1 userInfo:v3];

  return (NSError *)v4;
}

+ (NSError)malformedRequestError
{
  uint64_t v2 = (void *)MEMORY[0x1E4F28C58];
  objc_super v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:@"Malformed request" forKey:*MEMORY[0x1E4F28588]];
  uint64_t v4 = [v2 errorWithDomain:@"com.apple.siri.context" code:10 userInfo:v3];

  return (NSError *)v4;
}

+ (NSError)timeoutError
{
  uint64_t v2 = (void *)MEMORY[0x1E4F28C58];
  objc_super v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:@"Request timeout" forKey:*MEMORY[0x1E4F28588]];
  uint64_t v4 = [v2 errorWithDomain:@"com.apple.siri.context" code:5 userInfo:v3];

  return (NSError *)v4;
}

- (BOOL)isPlaceholder
{
  return self->_uuid && !self->_results && self->_error == 0;
}

- (void)appendToDebug:(id)a3
{
  debug = self->_debug;
  if (debug)
  {
    uint64_t v5 = [NSString stringWithFormat:@"%@\n%@", debug, a3];
  }
  else
  {
    uint64_t v5 = (NSString *)[a3 copy];
  }
  uint64_t v6 = self->_debug;
  self->_debug = v5;
  MEMORY[0x1F41817F8](v5, v6);
}

- (void)addDebug:(id)a3
{
  uint64_t v4 = (objc_class *)NSString;
  id v5 = a3;
  uint64_t v6 = (void *)[[v4 alloc] initWithFormat:v5 arguments:&v9];

  if (self->_debug)
  {
    uint64_t v7 = [NSString stringWithFormat:@"%@\n%@", self->_debug, v6];
  }
  else
  {
    uint64_t v7 = (NSString *)[v6 copy];
  }
  debug = self->_debug;
  self->_debug = v7;
}

- (id)completer
{
  objc_super v3 = [(NSArray *)self->_results count];
  if (v3) {
    objc_super v3 = [[CKContextCompleter alloc] initWithResponse:self];
  }
  return v3;
}

- (id)resultByQuery:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 length])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = self->_results;
    id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          uint64_t v10 = objc_msgSend(v9, "query", (void)v13);
          char v11 = [v10 isEqualToString:v4];

          if (v11)
          {
            id v6 = v9;
            goto LABEL_12;
          }
        }
        id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CKContextResponse *)a3;
  if (self == v4)
  {
    char v6 = 1;
    goto LABEL_32;
  }
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    uint64_t v7 = v4;
    unint64_t v8 = [(CKContextResponse *)self hash];
    if (v8 != [(CKContextResponse *)v7 hash])
    {
      char v6 = 0;
LABEL_31:

      goto LABEL_32;
    }
    uuid = self->_uuid;
    uint64_t v10 = [(CKContextResponse *)v7 uuid];
    char v11 = (void *)v10;
    if (uuid)
    {
      if ([(NSString *)uuid isEqual:v10]) {
        goto LABEL_8;
      }
    }
    else if (!v10)
    {
LABEL_8:
      error = self->_error;
      uint64_t v13 = [(CKContextResponse *)v7 error];
      long long v14 = (void *)v13;
      if (error)
      {
        if ([(NSError *)error isEqual:v13]) {
          goto LABEL_10;
        }
      }
      else if (!v13)
      {
LABEL_10:
        results = self->_results;
        uint64_t v16 = [(CKContextResponse *)v7 results];
        v17 = (void *)v16;
        if (results)
        {
          if ([(NSArray *)results isEqual:v16]) {
            goto LABEL_12;
          }
        }
        else if (!v16)
        {
LABEL_12:
          languageTag = self->_languageTag;
          uint64_t v19 = [(CKContextResponse *)v7 languageTag];
          v20 = (void *)v19;
          if (languageTag)
          {
            if ([(NSString *)languageTag isEqual:v19])
            {
LABEL_14:
              debug = self->_debug;
              uint64_t v22 = [(CKContextResponse *)v7 debug];
              v23 = (void *)v22;
              if (debug) {
                char v6 = [(NSString *)debug isEqual:v22];
              }
              else {
                char v6 = v22 == 0;
              }

              goto LABEL_27;
            }
          }
          else if (!v19)
          {
            goto LABEL_14;
          }
          char v6 = 0;
LABEL_27:

          goto LABEL_28;
        }
        char v6 = 0;
LABEL_28:

        goto LABEL_29;
      }
      char v6 = 0;
LABEL_29:

      goto LABEL_30;
    }
    char v6 = 0;
LABEL_30:

    goto LABEL_31;
  }
  char v6 = 0;
LABEL_32:

  return v6;
}

- (unint64_t)hash
{
  return 31 * [(NSString *)self->_uuid hash];
}

- (void)markResultsShown:(unint64_t)a3 serverOverride:(BOOL)a4 forInputLength:(unint64_t)a5 results:(id)a6
{
  id v20 = a6;
  atomic_store(1u, (unsigned __int8 *)&self->_shown);
  p_loggingCouldHaveShown = &self->_loggingCouldHaveShown;
  uint64_t v12 = self->_loggingCouldHaveShown;
  objc_sync_enter(v12);
  if (v20)
  {
    objc_storeStrong((id *)&self->_loggingCouldHaveShown, a6);
    unint64_t v13 = atomic_load(&self->_loggingShownMax);
    unint64_t v14 = [v20 count];
    if (v14 <= v13) {
      unsigned int v15 = v13;
    }
    else {
      unsigned int v15 = v14;
    }
    atomic_store(v15, &self->_loggingCouldHaveShownMax);
  }
  else
  {
    uint64_t v16 = *p_loggingCouldHaveShown;
    *p_loggingCouldHaveShown = 0;
  }
  objc_sync_exit(v12);

  unint64_t v17 = atomic_load(&self->_loggingShownMax);
  if (v17 < a3) {
    LODWORD(v17) = a3;
  }
  atomic_store(v17, &self->_loggingShownMax);
  LOBYTE(v17) = atomic_load((unsigned __int8 *)&self->_loggingServerOverride);
  do
  {
    LODWORD(v17) = v17 & 1;
    int v18 = v17;
    atomic_compare_exchange_strong((atomic_uchar *volatile)&self->_loggingServerOverride, (unsigned __int8 *)&v17, v17 | a4);
  }
  while (v17 != v18);
  unint64_t v19 = atomic_load(&self->_loggingInputLengthMax);
  if (v19 < a5) {
    LODWORD(v19) = a5;
  }
  atomic_store(v19, &self->_loggingInputLengthMax);
}

- (void)logEngagement:(id)a3 forInputLength:(unint64_t)a4 completion:(id)a5 likelyUnsolicited:(BOOL)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  unsigned __int8 v12 = atomic_load((unsigned __int8 *)&self->_engaged);
  uint64_t v13 = 1;
  if ((v12 & 1) == 0)
  {
    atomic_store(1u, (unsigned __int8 *)&self->_engaged);
    unsigned __int8 v14 = atomic_load((unsigned __int8 *)&self->_engagementLogged);
    if ((v14 & 1) == 0)
    {
      uint64_t v13 = 0;
      atomic_store(1u, (unsigned __int8 *)&self->_engagementLogged);
    }
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  unsigned int v15 = self->_results;
  uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v16)
  {
    BOOL v24 = a6;
    unint64_t v25 = a4;
    uint64_t v17 = 0;
    uint64_t v18 = *(void *)v27;
    while (2)
    {
      uint64_t v19 = 0;
      uint64_t v20 = v17 + v16;
      do
      {
        if (*(void *)v27 != v18) {
          objc_enumerationMutation(v15);
        }
        if ([v10 isEqual:*(void *)(*((void *)&v26 + 1) + 8 * v19)])
        {
          uint64_t v16 = v17 + v19 + 1;
          goto LABEL_14;
        }
        ++v19;
      }
      while (v16 != v19);
      uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
      uint64_t v17 = v20;
      if (v16) {
        continue;
      }
      break;
    }
LABEL_14:
    a4 = v25;
    a6 = v24;
  }

  uuid = self->_uuid;
  uint64_t v22 = [v11 length];
  if (self->_requestType == 1 && a6) {
    unint64_t requestType = 15;
  }
  else {
    unint64_t requestType = self->_requestType;
  }
  +[CKContextRequest logEngagementForResponseId:uuid result:v10 rank:v16 inputLength:a4 completionLength:v22 requestType:requestType logType:v13];
}

- (void)logTransactionSuccessfulForInputLength:(unint64_t)a3 completion:(id)a4 likelyUnsolicited:(BOOL)a5
{
  unsigned __int8 v8 = atomic_load((unsigned __int8 *)&self->_transactionSuccessful);
  uint64_t v9 = 1;
  if ((v8 & 1) == 0)
  {
    atomic_store(1u, (unsigned __int8 *)&self->_transactionSuccessful);
    unsigned __int8 v10 = atomic_load((unsigned __int8 *)&self->_transactionLogged);
    if ((v10 & 1) == 0)
    {
      uint64_t v9 = 0;
      atomic_store(1u, (unsigned __int8 *)&self->_transactionLogged);
    }
  }
  uuid = self->_uuid;
  uint64_t v12 = [a4 length];
  if (self->_requestType == 1 && a5) {
    unint64_t requestType = 15;
  }
  else {
    unint64_t requestType = self->_requestType;
  }
  +[CKContextRequest logTransactionSuccessfulForResponseId:uuid inputLength:a3 completionLength:v12 requestType:requestType logType:v9];
}

- (void)discardAndLogCompleter:(id)a3 likelyUnsolicited:(BOOL)a4
{
  id v6 = a3;
  unsigned __int8 v7 = atomic_load((unsigned __int8 *)&self->_shown);
  if (v7)
  {
    id v20 = v6;
    unsigned __int8 v8 = self->_loggingCouldHaveShown;
    objc_sync_enter(v8);
    loggingCouldHaveShown = self->_loggingCouldHaveShown;
    if (loggingCouldHaveShown)
    {
      unsigned __int8 v10 = [(NSArray *)loggingCouldHaveShown valueForKey:@"topicId"];
      id v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF != nil"];
      uint64_t v12 = [v10 filteredArrayUsingPredicate:v11];
    }
    else
    {
      uint64_t v12 = 0;
    }
    objc_sync_exit(v8);

    uint64_t v13 = atomic_exchange((atomic_uchar *volatile)&self->_shownLogged, 1u) & 1;
    uint64_t v14 = atomic_load(&self->_loggingShownMax);
    uint64_t v15 = atomic_load(&self->_loggingCouldHaveShownMax);
    unsigned __int8 v16 = atomic_load((unsigned __int8 *)&self->_loggingServerOverride);
    uint64_t v17 = v16 & 1;
    uint64_t v18 = atomic_load(&self->_loggingInputLengthMax);
    unint64_t requestType = self->_requestType;
    if (requestType == 1 && a4) {
      unint64_t requestType = 15;
    }
    +[CKContextRequest logResultsShownForResponseId:self->_uuid shown:v14 couldHaveShown:v15 topicIds:v12 serverOverride:v17 inputLength:v18 requestType:requestType logType:v13];

    id v6 = v20;
  }
}

- (id)responseSummary:(BOOL)a3 showHigherLevelTopics:(BOOL)a4 maxPrefix:(int64_t)a5
{
  BOOL v86 = a4;
  BOOL v96 = a3;
  uint64_t v122 = *MEMORY[0x1E4F143B8];
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  objc_msgSend(v7, "appendFormat:", @"Number of results: %lu\n", -[NSArray count](self->_results, "count"));
  if ([(NSArray *)self->_donorBundleIdentifiers count])
  {
    unsigned __int8 v8 = [(NSArray *)self->_donorBundleIdentifiers componentsJoinedByString:@", "];
    [v7 appendFormat:@"Donor bundle identifiers: %@", v8];
  }
  [v7 appendString:@"\n"];
  double height = self->_availableLayoutSize.height;
  if (self->_availableLayoutSize.width != 0.0 || height != 0.0)
  {
    [v7 appendFormat:@"Available layout size: (%.f, %.f)", *(void *)&self->_availableLayoutSize.width, *(void *)&height];
    [v7 appendString:@"\n"];
  }
  long long v115 = 0u;
  long long v116 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  v87 = self;
  obuint64_t j = self->_results;
  uint64_t v10 = [(NSArray *)obj countByEnumeratingWithState:&v113 objects:v121 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v114;
    uint64_t v88 = *(void *)v114;
    int64_t v89 = a5;
    do
    {
      uint64_t v13 = 0;
      id v90 = (id)v11;
      do
      {
        if (*(void *)v114 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v113 + 1) + 8 * v13);
        if ([v14 minPrefix] <= a5)
        {
          uint64_t v94 = v13;
          uint64_t v15 = [v14 title];
          [v7 appendFormat:@"* %@\n", v15];

          if (v96)
          {
            unsigned __int8 v16 = [v14 topicId];
            [v7 appendFormat:@"  %@\n", v16];
          }
          uint64_t v17 = [v14 url];

          if (v17)
          {
            uint64_t v18 = [v14 url];
            [v7 appendFormat:@"  %@\n", v18];
          }
          uint64_t v19 = [v14 category];

          if (v19)
          {
            id v20 = [v14 category];
            [v7 appendFormat:@"  %@\n", v20];
          }
          id v21 = [v14 debug];

          if (v21)
          {
            uint64_t v22 = [v14 debug];
            [v7 appendFormat:@"  %@\n", v22];
          }
          v23 = [v14 tags];

          if (v23)
          {
            BOOL v24 = [v14 tags];
            [v7 appendFormat:@"  tags: %@\n", v24];
          }
          unint64_t v25 = [v14 relatedItems];

          if (v25)
          {
            long long v26 = [v14 relatedItems];
            [v7 appendFormat:@"  relatedItems: %@\n", v26];
          }
          long long v27 = [v14 associatedResults];

          if (v27)
          {
            [v7 appendFormat:@"  associatedResults: {\n"];
            long long v111 = 0u;
            long long v112 = 0u;
            long long v109 = 0u;
            long long v110 = 0u;
            long long v28 = [v14 associatedResults];
            uint64_t v29 = [v28 countByEnumeratingWithState:&v109 objects:v120 count:16];
            if (v29)
            {
              uint64_t v30 = v29;
              uint64_t v31 = *(void *)v110;
              do
              {
                for (uint64_t i = 0; i != v30; ++i)
                {
                  if (*(void *)v110 != v31) {
                    objc_enumerationMutation(v28);
                  }
                  id v33 = *(void **)(*((void *)&v109 + 1) + 8 * i);
                  uint64_t v34 = NSString;
                  [v33 frameInWindow];
                  uint64_t v36 = v35;
                  [v33 frameInWindow];
                  uint64_t v38 = v37;
                  [v33 absoluteOriginOnScreen];
                  uint64_t v40 = v39;
                  [v33 absoluteOriginOnScreen];
                  uint64_t v42 = v41;
                  [v33 frameInWindow];
                  uint64_t v44 = v43;
                  [v33 frameInWindow];
                  uint64_t v46 = v45;
                  int v47 = [v33 isOnScreen];
                  v48 = @"NO";
                  if (v47) {
                    v48 = @"YES";
                  }
                  v49 = [v34 stringWithFormat:@"Origin:(%.f, %.f), AbsoluteOrigin:(%.f,%.f), Size:(%.f, %.f), On Screen:%@", v36, v38, v40, v42, v44, v46, v48];
                  v50 = [v33 title];
                  [v7 appendFormat:@"\t %@\t|| %@\n", v50, v49];
                }
                uint64_t v30 = [v28 countByEnumeratingWithState:&v109 objects:v120 count:16];
              }
              while (v30);
            }

            [v7 appendFormat:@"}\n"];
            a5 = v89;
            uint64_t v11 = (uint64_t)v90;
            uint64_t v12 = v88;
          }
          [v7 appendString:@"\n"];
          uint64_t v13 = v94;
        }
        ++v13;
      }
      while (v13 != v11);
      uint64_t v11 = [(NSArray *)obj countByEnumeratingWithState:&v113 objects:v121 count:16];
    }
    while (v11);
  }

  if (v86)
  {
    objc_msgSend(v7, "appendFormat:", @"Number of level-1 topics: %lu\n\n", -[NSArray count](v87->_level1Topics, "count"));
    long long v107 = 0u;
    long long v108 = 0u;
    long long v105 = 0u;
    long long v106 = 0u;
    v51 = v87->_level1Topics;
    uint64_t v52 = [(NSArray *)v51 countByEnumeratingWithState:&v105 objects:v119 count:16];
    if (v52)
    {
      uint64_t v53 = v52;
      uint64_t v54 = *(void *)v106;
      do
      {
        for (uint64_t j = 0; j != v53; ++j)
        {
          if (*(void *)v106 != v54) {
            objc_enumerationMutation(v51);
          }
          v56 = *(void **)(*((void *)&v105 + 1) + 8 * j);
          v57 = [v56 title];
          [v7 appendFormat:@"= %@\n", v57];

          if (v96)
          {
            v58 = [v56 topicId];
            [v7 appendFormat:@"  %@\n", v58];
          }
          v59 = [v56 url];

          if (v59)
          {
            v60 = [v56 url];
            [v7 appendFormat:@"  %@\n", v60];
          }
          v61 = [v56 category];

          if (v61)
          {
            v62 = [v56 category];
            [v7 appendFormat:@"  %@\n", v62];
          }
          v63 = [v56 debug];

          if (v63)
          {
            v64 = [v56 debug];
            [v7 appendFormat:@"  %@\n", v64];
          }
          v65 = [v56 relatedItems];

          if (v65)
          {
            v66 = [v56 relatedItems];
            [v7 appendFormat:@"  relatedItems: %@\n", v66];
          }
          [v7 appendString:@"\n"];
        }
        uint64_t v53 = [(NSArray *)v51 countByEnumeratingWithState:&v105 objects:v119 count:16];
      }
      while (v53);
    }

    objc_msgSend(v7, "appendFormat:", @"Number of level-2 topics: %lu\n\n", -[NSArray count](v87->_level2Topics, "count"));
    long long v103 = 0u;
    long long v104 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    v91 = v87->_level2Topics;
    uint64_t v95 = [(NSArray *)v91 countByEnumeratingWithState:&v101 objects:v118 count:16];
    if (v95)
    {
      id obja = *(id *)v102;
      do
      {
        for (uint64_t k = 0; k != v95; ++k)
        {
          if (*(id *)v102 != obja) {
            objc_enumerationMutation(v91);
          }
          v68 = *(void **)(*((void *)&v101 + 1) + 8 * k);
          v69 = [v68 title];
          [v7 appendFormat:@"= %@\n", v69];

          if (v96)
          {
            v70 = [v68 topicId];
            [v7 appendFormat:@"  %@\n", v70];
          }
          v71 = [v68 url];

          if (v71)
          {
            v72 = [v68 url];
            [v7 appendFormat:@"  %@\n", v72];
          }
          v73 = [v68 category];

          if (v73)
          {
            v74 = [v68 category];
            [v7 appendFormat:@"  %@\n", v74];
          }
          v75 = [v68 debug];

          if (v75)
          {
            v76 = [v68 debug];
            [v7 appendFormat:@"  %@\n", v76];
          }
          v77 = [v68 relatedItems];

          if (v77)
          {
            [v7 appendString:@"  relatedItems: ["];
            long long v99 = 0u;
            long long v100 = 0u;
            long long v97 = 0u;
            long long v98 = 0u;
            v78 = [v68 relatedItems];
            uint64_t v79 = [v78 countByEnumeratingWithState:&v97 objects:v117 count:16];
            if (v79)
            {
              uint64_t v80 = v79;
              uint64_t v81 = *(void *)v98;
              char v82 = 1;
              do
              {
                for (uint64_t m = 0; m != v80; ++m)
                {
                  if (*(void *)v98 != v81) {
                    objc_enumerationMutation(v78);
                  }
                  uint64_t v84 = *(void *)(*((void *)&v97 + 1) + 8 * m);
                  if ((v82 & 1) == 0) {
                    [v7 appendString:@", "];
                  }
                  [v7 appendFormat:@"%@", v84];
                  char v82 = 0;
                }
                uint64_t v80 = [v78 countByEnumeratingWithState:&v97 objects:v117 count:16];
                char v82 = 0;
              }
              while (v80);
            }

            [v7 appendString:@"]\n"];
          }
          [v7 appendString:@"\n"];
        }
        uint64_t v95 = [(NSArray *)v91 countByEnumeratingWithState:&v101 objects:v118 count:16];
      }
      while (v95);
    }
  }
  return v7;
}

- (id)toJSONSerializableDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:self->_uuid forKeyedSubscript:@"uuid"];
  error = self->_error;
  if (error)
  {
    uint64_t v5 = [(NSError *)error description];
    [v3 setObject:v5 forKeyedSubscript:@"error"];

    id v6 = self->_error;
    if (v6)
    {
      id v7 = [(NSError *)v6 description];
      [v3 setObject:v7 forKeyedSubscript:@"error"];
    }
  }
  results = self->_results;
  if (results)
  {
    uint64_t v9 = [(NSArray *)results valueForKey:@"toJSONSerializableDictionary"];
    [v3 setObject:v9 forKeyedSubscript:@"results"];
  }
  level1Topics = self->_level1Topics;
  if (level1Topics)
  {
    uint64_t v11 = [(NSArray *)level1Topics valueForKey:@"toJSONSerializableDictionary"];
    [v3 setObject:v11 forKeyedSubscript:@"level1Topics"];
  }
  level2Topics = self->_level2Topics;
  if (level2Topics)
  {
    uint64_t v13 = [(NSArray *)level2Topics valueForKey:@"toJSONSerializableDictionary"];
    [v3 setObject:v13 forKeyedSubscript:@"level2Topics"];
  }
  donorBundleIdentifiers = self->_donorBundleIdentifiers;
  if (donorBundleIdentifiers) {
    [v3 setObject:donorBundleIdentifiers forKeyedSubscript:@"donorBundleIdentifiers"];
  }
  languageTag = self->_languageTag;
  if (languageTag) {
    [v3 setObject:languageTag forKeyedSubscript:@"languageTag"];
  }
  debug = self->_debug;
  if (debug) {
    [v3 setObject:debug forKeyedSubscript:@"debug"];
  }
  return v3;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (void)setError:(id)a3
{
}

- (NSArray)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
}

- (NSArray)donorBundleIdentifiers
{
  return self->_donorBundleIdentifiers;
}

- (void)setDonorBundleIdentifiers:(id)a3
{
}

- (NSString)languageTag
{
  return self->_languageTag;
}

- (void)setLanguageTag:(id)a3
{
}

- (NSString)debug
{
  return self->_debug;
}

- (void)setDebug:(id)a3
{
}

- (unint64_t)requestType
{
  return self->_requestType;
}

- (void)setRequestType:(unint64_t)a3
{
  self->_unint64_t requestType = a3;
}

- (CGSize)availableLayoutSize
{
  double width = self->_availableLayoutSize.width;
  double height = self->_availableLayoutSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSDictionary)partsOfSpeechToTexts
{
  return self->_partsOfSpeechToTexts;
}

- (void)setPartsOfSpeechToTexts:(id)a3
{
}

- (CKContextFingerprintMinHash)requestFingerprint
{
  return self->_requestFingerprint;
}

- (void)setRequestFingerprint:(id)a3
{
}

- (BOOL)resultsNeedFiltering
{
  return self->_resultsNeedFiltering;
}

- (void)setResultsNeedFiltering:(BOOL)a3
{
  self->_BOOL resultsNeedFiltering = a3;
}

- (unint64_t)mustPrefixMatchLength
{
  return self->_mustPrefixMatchLength;
}

- (void)setMustPrefixMatchLength:(unint64_t)a3
{
  self->_mustPrefixMatchLength = a3;
}

- (NSDate)hideCompletionsAfterDate
{
  return self->_hideCompletionsAfterDate;
}

- (void)setHideCompletionsAfterDate:(id)a3
{
}

- (NSDate)responseDate
{
  return self->_responseDate;
}

- (void)setResponseDate:(id)a3
{
}

- (CKContextRequest)debugRequest
{
  return self->_debugRequest;
}

- (void)setDebugRequest:(id)a3
{
}

@end