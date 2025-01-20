@interface CKContextRequest
+ (BOOL)pingService;
+ (BOOL)shutdownService;
+ (BOOL)supportsSecureCoding;
+ (id)requestServiceSemaphore;
+ (id)requestWithText:(id)a3;
+ (void)findResultsForText:(id)a3 languageTag:(id)a4 requestType:(unint64_t)a5 withReply:(id)a6;
+ (void)findResultsForText:(id)a3 languageTag:(id)a4 withReply:(id)a5;
+ (void)findResultsForText:(id)a3 withReply:(id)a4;
+ (void)initialize;
+ (void)logEngagementForResponseId:(id)a3 result:(id)a4 rank:(unint64_t)a5 inputLength:(unint64_t)a6 completionLength:(unint64_t)a7 requestType:(unint64_t)a8 logType:(unint64_t)a9;
+ (void)logResultsShownForResponseId:(id)a3 shown:(unint64_t)a4 couldHaveShown:(unint64_t)a5 topicIds:(id)a6 serverOverride:(BOOL)a7 inputLength:(unint64_t)a8 requestType:(unint64_t)a9 logType:(unint64_t)a10;
+ (void)logTransactionSuccessfulForResponseId:(id)a3 inputLength:(unint64_t)a4 completionLength:(unint64_t)a5 requestType:(unint64_t)a6 logType:(unint64_t)a7;
+ (void)requestServiceSemaphoreWithReply:(id)a3;
+ (void)runOffMainThread:(id)a3;
+ (void)setDefaultRequestType:(unint64_t)a3;
+ (void)statusWithReply:(id)a3;
+ (void)warmUpForRequestType:(unint64_t)a3 withReply:(id)a4;
- (BOOL)debug;
- (BOOL)dontSkip;
- (BOOL)incPending;
- (BOOL)includeHigherLevelTopics;
- (BOOL)includeLeadImage;
- (BOOL)includePartsOfSpeech;
- (BOOL)includeRequestInResponse;
- (BOOL)includeStructuredExtractionResults;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRequestingContentFromActiveApplications;
- (BOOL)overrideEnableCoreNLPTagging;
- (BOOL)textIsRaw;
- (BOOL)timing;
- (CKContextRequest)initWithCoder:(id)a3;
- (CKContextRequest)initWithText:(id)a3;
- (NSArray)donorBundleIdentifiers;
- (NSArray)urls;
- (NSDictionary)itemIds;
- (NSNumber)overrideBlendAlpha;
- (NSNumber)overrideBlendBeta;
- (NSNumber)overrideBlendGamma;
- (NSOrderedSet)desiredLanguageTags;
- (NSSet)allowedTopicTypeTags;
- (NSSet)preferredSceneIdentifiers;
- (NSString)url;
- (double)donationTimeout;
- (double)execute;
- (id)copyWithZone:(_NSZone *)a3;
- (id)execute;
- (id)initForClient:(id)a3;
- (int)overrideConstellationMinCount;
- (int)overrideConstellationMinWeight;
- (int64_t)maxConstellationTopics;
- (unint64_t)fingerprintMax;
- (unint64_t)hash;
- (unint64_t)type;
- (unsigned)topk;
- (void)_executeCategorizationRequestWithReply:(id)a3;
- (void)_executeWithReply:(id)a3;
- (void)_postProcessResponse:(id)a3;
- (void)capabilitiesWithReply:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)executeCategorizationRequestWithReply:(id)a3;
- (void)executeWithReply:(id)a3;
- (void)setAllowedTopicTypeTags:(id)a3;
- (void)setDebug:(BOOL)a3;
- (void)setDesiredLanguageTags:(id)a3;
- (void)setDonationTimeout:(double)a3;
- (void)setDonorBundleIdentifiers:(id)a3;
- (void)setDontSkip:(BOOL)a3;
- (void)setFingerprintMax:(unint64_t)a3;
- (void)setIncPending:(BOOL)a3;
- (void)setIncludeHigherLevelTopics:(BOOL)a3;
- (void)setIncludeLeadImage:(BOOL)a3;
- (void)setIncludePartsOfSpeech:(BOOL)a3;
- (void)setIncludeRequestInResponse:(BOOL)a3;
- (void)setIncludeStructuredExtractionResults:(BOOL)a3;
- (void)setItemIds:(id)a3;
- (void)setMaxConstellationTopics:(int64_t)a3;
- (void)setOverrideBlendAlpha:(id)a3;
- (void)setOverrideBlendBeta:(id)a3;
- (void)setOverrideBlendGamma:(id)a3;
- (void)setOverrideConstellationMinCount:(int)a3;
- (void)setOverrideConstellationMinWeight:(int)a3;
- (void)setOverrideEnableCoreNLPTagging:(BOOL)a3;
- (void)setPreferredSceneIdentifiers:(id)a3;
- (void)setText:(id)a3;
- (void)setTextIsRaw:(BOOL)a3;
- (void)setTiming:(BOOL)a3;
- (void)setTopk:(unsigned int)a3;
- (void)setType:(unint64_t)a3;
- (void)setUrl:(id)a3;
- (void)setUrls:(id)a3;
@end

@implementation CKContextRequest

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CKContextRequest;
  id v4 = a3;
  [(CKContextDonationItem *)&v5 encodeWithCoder:v4];
  -[NSCoder encodeUInteger:forKey:](v4, (const char *)self->_type, @"type");
  objc_msgSend(v4, "encodeBool:forKey:", self->_debug, @"debug", v5.receiver, v5.super_class);
  [v4 encodeBool:self->_dontSkip forKey:@"dontSkip"];
  [v4 encodeBool:self->_incPending forKey:@"incPending"];
  [v4 encodeBool:self->_timing forKey:@"timing"];
  [v4 encodeBool:self->_overrideEnableCoreNLPTagging forKey:@"overrideEnableCoreNLPTagging"];
  [v4 encodeBool:self->_includeHigherLevelTopics forKey:@"includeHigherLevelTopics"];
  [v4 encodeBool:self->_includeStructuredExtractionResults forKey:@"includeStructuredExtractionResults"];
  [v4 encodeBool:self->_textIsRaw forKey:@"textIsRaw"];
  [v4 encodeBool:self->_includeRequestInResponse forKey:@"includeRequestInResponse"];
  -[NSCoder encodeUInt32:forKey:](v4, (const char *)self->_topk, @"topk");
  [v4 encodeInteger:self->_maxConstellationTopics forKey:@"maxConstellationTopics"];
  [v4 encodeInt32:self->_overrideConstellationMinCount forKey:@"overrideConstellationMinCount"];
  [v4 encodeInt32:self->_overrideConstellationMinWeight forKey:@"overrideConstellationMinWeight"];
  -[NSCoder encodeUInteger:forKey:](v4, (const char *)self->_fingerprintMax, @"fingerprintMax");
  [v4 encodeDouble:@"donationTimeout" forKey:self->_donationTimeout];
  [v4 encodeObject:self->_overrideBlendAlpha forKey:@"overrideBlendAlpha"];
  [v4 encodeObject:self->_overrideBlendBeta forKey:@"overrideBlendBeta"];
  [v4 encodeObject:self->_overrideBlendGamma forKey:@"overrideBlendGamma"];
  [v4 encodeObject:self->_urls forKey:@"urls"];
  [v4 encodeObject:self->_itemIds forKey:@"itemIds"];
  [v4 encodeObject:self->_desiredLanguageTags forKey:@"desiredLanguageTags"];
  [v4 encodeObject:self->_donorBundleIdentifiers forKey:@"donorBundleIdentifiers"];
  [v4 encodeObject:self->_allowedTopicTypeTags forKey:@"allowedTopicTypeTags"];
  [v4 encodeObject:self->_preferredSceneIdentifiers forKey:@"preferredSceneIdentifiers"];
  [v4 encodeBool:self->_includePartsOfSpeech forKey:@"includePartsOfSpeech"];
  [v4 encodeBool:self->_includeLeadImage forKey:@"includeLeadImage"];
}

- (void)executeCategorizationRequestWithReply:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__CKContextRequest_executeCategorizationRequestWithReply___block_invoke;
  v6[3] = &unk_1E5B485E0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  _os_activity_initiate(&dword_1A45F4000, "ContextRequest executeCategorizationRequest", OS_ACTIVITY_FLAG_DEFAULT, v6);
}

void __59__CKContextRequest__executeCategorizationRequestWithReply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  +[CKContextClient timeIntervalBetweenMachTime:mach_absolute_time() andMachTime:*(void *)(a1 + 40)];
  BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
  if (v7) {
    __59__CKContextRequest__executeCategorizationRequestWithReply___block_invoke_2_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)initForClient:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CKContextRequest;
  id v6 = [(CKContextRequest *)&v10 init];
  BOOL v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_client, a3);
    uint64_t v8 = [v5 defaultRequestType];
    v7->_type = v8;
    if (v8 == 14) {
      v7->_includeHigherLevelTopics = 1;
    }
  }

  return v7;
}

- (void)_executeCategorizationRequestWithReply:(id)a3
{
  id v4 = a3;
  uint64_t v5 = mach_absolute_time();
  if ([(CKContextClient *)self->_client tryAcquireServiceSemaphoreNeedsIncPending:!self->_incPending])
  {
    id v6 = +[CKContextXPCClient xpcConnection];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __59__CKContextRequest__executeCategorizationRequestWithReply___block_invoke;
    v13[3] = &unk_1E5B48540;
    id v7 = v4;
    id v14 = v7;
    uint64_t v8 = [v6 remoteObjectProxyWithErrorHandler:v13];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __59__CKContextRequest__executeCategorizationRequestWithReply___block_invoke_2;
    v10[3] = &unk_1E5B48828;
    uint64_t v12 = v5;
    id v11 = v7;
    [v8 findCategorizationsForRequest:self withReply:v10];
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.siri.context" code:6 userInfo:0];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v9);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_donorBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_desiredLanguageTags, 0);
  objc_storeStrong((id *)&self->_overrideBlendGamma, 0);
  objc_storeStrong((id *)&self->_overrideBlendBeta, 0);
  objc_storeStrong((id *)&self->_overrideBlendAlpha, 0);
  objc_storeStrong((id *)&self->_preferredSceneIdentifiers, 0);
  objc_storeStrong((id *)&self->_allowedTopicTypeTags, 0);
  objc_storeStrong((id *)&self->_itemIds, 0);
  objc_storeStrong((id *)&self->_urls, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

- (CKContextRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)CKContextRequest;
  uint64_t v5 = [(CKContextDonationItem *)&v35 initWithCoder:v4];
  if (v5)
  {
    v5->_type = (unint64_t)-[NSCoder decodeUIntegerForKey:](v4, (const char *)@"type");
    v5->_debug = [v4 decodeBoolForKey:@"debug"];
    v5->_dontSkip = [v4 decodeBoolForKey:@"dontSkip"];
    v5->_incPending = [v4 decodeBoolForKey:@"incPending"];
    v5->_timing = [v4 decodeBoolForKey:@"timing"];
    v5->_overrideEnableCoreNLPTagging = [v4 decodeBoolForKey:@"overrideEnableCoreNLPTagging"];
    v5->_includeHigherLevelTopics = [v4 decodeBoolForKey:@"includeHigherLevelTopics"];
    v5->_includeStructuredExtractionResults = [v4 decodeBoolForKey:@"includeStructuredExtractionResults"];
    v5->_textIsRaw = [v4 decodeBoolForKey:@"textIsRaw"];
    v5->_includeRequestInResponse = [v4 decodeBoolForKey:@"includeRequestInResponse"];
    v5->_topk = -[NSCoder decodeUInt32ForKey:](v4, (const char *)@"topk");
    v5->_maxConstellationTopics = [v4 decodeIntegerForKey:@"maxConstellationTopics"];
    v5->_overrideConstellationMinCount = [v4 decodeInt32ForKey:@"overrideConstellationMinCount"];
    v5->_overrideConstellationMinWeight = [v4 decodeInt32ForKey:@"overrideConstellationMinWeight"];
    v5->_fingerprintMax = (unint64_t)-[NSCoder decodeUIntegerForKey:](v4, (const char *)@"fingerprintMax");
    [v4 decodeDoubleForKey:@"donationTimeout"];
    v5->_donationTimeout = v6;
    if (initWithCoder__onceToken != -1) {
      dispatch_once(&initWithCoder__onceToken, &__block_literal_global_0);
    }
    id v7 = (id)initWithCoder__x;
    uint64_t v8 = [v4 decodeObjectOfClasses:v7 forKey:@"overrideBlendAlpha"];
    overrideBlendAlpha = v5->_overrideBlendAlpha;
    v5->_overrideBlendAlpha = (NSNumber *)v8;

    if (initWithCoder__onceToken_67 != -1) {
      dispatch_once(&initWithCoder__onceToken_67, &__block_literal_global_69);
    }
    id v10 = (id)initWithCoder__x_66;
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"overrideBlendBeta"];
    overrideBlendBeta = v5->_overrideBlendBeta;
    v5->_overrideBlendBeta = (NSNumber *)v11;

    if (initWithCoder__onceToken_74 != -1) {
      dispatch_once(&initWithCoder__onceToken_74, &__block_literal_global_76);
    }
    id v13 = (id)initWithCoder__x_73;
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"overrideBlendGamma"];
    overrideBlendGamma = v5->_overrideBlendGamma;
    v5->_overrideBlendGamma = (NSNumber *)v14;

    if (initWithCoder__onceToken_81 != -1) {
      dispatch_once(&initWithCoder__onceToken_81, &__block_literal_global_83);
    }
    id v16 = (id)initWithCoder__x_80;
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"urls"];
    urls = v5->_urls;
    v5->_urls = (NSArray *)v17;

    if (initWithCoder__onceToken_89 != -1) {
      dispatch_once(&initWithCoder__onceToken_89, &__block_literal_global_91);
    }
    id v19 = (id)initWithCoder__x_88;
    uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"itemIds"];
    itemIds = v5->_itemIds;
    v5->_itemIds = (NSDictionary *)v20;

    if (initWithCoder__onceToken_97 != -1) {
      dispatch_once(&initWithCoder__onceToken_97, &__block_literal_global_99);
    }
    id v22 = (id)initWithCoder__x_96;
    uint64_t v23 = [v4 decodeObjectOfClasses:v22 forKey:@"desiredLanguageTags"];
    desiredLanguageTags = v5->_desiredLanguageTags;
    v5->_desiredLanguageTags = (NSOrderedSet *)v23;

    if (initWithCoder__onceToken_105 != -1) {
      dispatch_once(&initWithCoder__onceToken_105, &__block_literal_global_107);
    }
    id v25 = (id)initWithCoder__x_104;
    uint64_t v26 = [v4 decodeObjectOfClasses:v25 forKey:@"donorBundleIdentifiers"];
    donorBundleIdentifiers = v5->_donorBundleIdentifiers;
    v5->_donorBundleIdentifiers = (NSArray *)v26;

    if (initWithCoder__onceToken_113 != -1) {
      dispatch_once(&initWithCoder__onceToken_113, &__block_literal_global_115);
    }
    id v28 = (id)initWithCoder__x_112;
    uint64_t v29 = [v4 decodeObjectOfClasses:v28 forKey:@"allowedTopicTypeTags"];
    allowedTopicTypeTags = v5->_allowedTopicTypeTags;
    v5->_allowedTopicTypeTags = (NSSet *)v29;

    if (initWithCoder__onceToken_120 != -1) {
      dispatch_once(&initWithCoder__onceToken_120, &__block_literal_global_122);
    }
    id v31 = (id)initWithCoder__x_119;
    uint64_t v32 = [v4 decodeObjectOfClasses:v31 forKey:@"preferredSceneIdentifiers"];
    preferredSceneIdentifiers = v5->_preferredSceneIdentifiers;
    v5->_preferredSceneIdentifiers = (NSSet *)v32;

    v5->_includePartsOfSpeech = [v4 decodeBoolForKey:@"includePartsOfSpeech"];
    v5->_includeLeadImage = [v4 decodeBoolForKey:@"includeLeadImage"];
  }

  return v5;
}

- (void)setUrls:(id)a3
{
}

- (NSArray)urls
{
  return self->_urls;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setIncludeHigherLevelTopics:(BOOL)a3
{
  self->_includeHigherLevelTopics = a3;
}

- (BOOL)incPending
{
  return self->_incPending;
}

uint64_t __58__CKContextRequest_executeCategorizationRequestWithReply___block_invoke(uint64_t a1)
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    __37__CKContextRequest_executeWithReply___block_invoke_cold_1(a1);
  }
  return [*(id *)(a1 + 32) _executeCategorizationRequestWithReply:*(void *)(a1 + 40)];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v2 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    v3 = (void *)kWhitespaceAndNewlines;
    kWhitespaceAndNewlines = v2;

    _defaultRequestType = 0;
  }
}

+ (void)setDefaultRequestType:(unint64_t)a3
{
  _defaultRequestType = a3;
}

+ (void)findResultsForText:(id)a3 withReply:(id)a4
{
}

+ (void)findResultsForText:(id)a3 languageTag:(id)a4 withReply:(id)a5
{
}

+ (void)findResultsForText:(id)a3 languageTag:(id)a4 requestType:(unint64_t)a5 withReply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = (void *)[a6 copy];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __73__CKContextRequest_findResultsForText_languageTag_requestType_withReply___block_invoke;
  v16[3] = &unk_1E5B48608;
  id v17 = v10;
  id v18 = v11;
  id v19 = v12;
  unint64_t v20 = a5;
  id v13 = v11;
  id v14 = v12;
  id v15 = v10;
  [a1 runOffMainThread:v16];
}

void __73__CKContextRequest_findResultsForText_languageTag_requestType_withReply___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) length])
  {
    uint64_t v2 = [[CKContextRequest alloc] initWithText:*(void *)(a1 + 32)];
    [(CKContextDonationItem *)v2 setLanguageTag:*(void *)(a1 + 40)];
    [(CKContextRequest *)v2 setType:*(void *)(a1 + 56)];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __73__CKContextRequest_findResultsForText_languageTag_requestType_withReply___block_invoke_2;
    v5[3] = &unk_1E5B485E0;
    double v6 = v2;
    id v7 = *(id *)(a1 + 48);
    v3 = v2;
    _os_activity_initiate(&dword_1A45F4000, "ContextRequest findResultsForText", OS_ACTIVITY_FLAG_DEFAULT, v5);
  }
  else
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v4();
  }
}

uint64_t __73__CKContextRequest_findResultsForText_languageTag_requestType_withReply___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _executeWithReply:*(void *)(a1 + 40)];
}

- (void)setUrl:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v11[0] = a3;
    uint64_t v5 = (void *)MEMORY[0x1E4F1C978];
    id v6 = a3;
    id v7 = [v5 arrayWithObjects:v11 count:1];
    urls = self->_urls;
    self->_urls = v7;
  }
  else
  {
    uint64_t v9 = self->_urls;
    self->_urls = (NSArray *)MEMORY[0x1E4F1CBF0];
    id v10 = 0;
  }
}

- (NSString)url
{
  return (NSString *)[(NSArray *)self->_urls firstObject];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithText:", &stru_1EF81F168);
  [v4 setType:self->_type];
  uint64_t v5 = [(CKContextDonationItem *)self text];
  id v6 = (void *)[v5 copy];
  [v4 setText:v6];

  id v7 = [(CKContextDonationItem *)self debugText];
  uint64_t v8 = (void *)[v7 copy];
  [v4 setDebugText:v8];

  uint64_t v9 = [(CKContextDonationItem *)self debugUrlString];
  id v10 = (void *)[v9 copy];
  [v4 setDebugUrlString:v10];

  id v11 = [(CKContextDonationItem *)self title];
  [v4 setTitle:v11];

  uint64_t v12 = [(CKContextDonationItem *)self contentAuthor];
  [v4 setContentAuthor:v12];

  id v13 = [(CKContextDonationItem *)self contentDescription];
  [v4 setContentDescription:v13];

  id v14 = [(CKContextDonationItem *)self contentKeywords];
  [v4 setContentKeywords:v14];

  id v15 = [(CKContextDonationItem *)self languageTag];
  [v4 setLanguageTag:v15];

  objc_msgSend(v4, "setType:", -[CKContextRequest type](self, "type"));
  id v16 = [(CKContextDonationItem *)self uiElements];
  [v4 setUiElements:v16];

  [v4 setTextIsRaw:self->_textIsRaw];
  [v4 setUrls:self->_urls];
  [v4 setIncludeHigherLevelTopics:self->_includeHigherLevelTopics];
  [v4 setIncludeStructuredExtractionResults:self->_includeStructuredExtractionResults];
  [v4 setIncludeLeadImage:self->_includeLeadImage];
  [v4 setItemIds:self->_itemIds];
  [v4 setMaxConstellationTopics:self->_maxConstellationTopics];
  [v4 setAllowedTopicTypeTags:self->_allowedTopicTypeTags];
  [v4 setDebug:self->_debug];
  [v4 setDontSkip:self->_dontSkip];
  [v4 setTiming:self->_timing];
  [v4 setOverrideBlendAlpha:self->_overrideBlendAlpha];
  [v4 setOverrideBlendBeta:self->_overrideBlendBeta];
  [v4 setOverrideBlendGamma:self->_overrideBlendGamma];
  [v4 setOverrideConstellationMinCount:self->_overrideConstellationMinCount];
  [v4 setOverrideConstellationMinWeight:self->_overrideConstellationMinWeight];
  [v4 setTopk:self->_topk];
  [v4 setOverrideEnableCoreNLPTagging:self->_overrideEnableCoreNLPTagging];
  [v4 setIncludeRequestInResponse:self->_includeRequestInResponse];
  [v4 setIncPending:self->_incPending];
  [v4 setDesiredLanguageTags:self->_desiredLanguageTags];
  [v4 setDonorBundleIdentifiers:self->_donorBundleIdentifiers];
  id v17 = [(CKContextDonationItem *)self leadImage];
  [v4 setLeadImage:v17];

  id v18 = [(CKContextDonationItem *)self snapshot];
  [v4 setSnapshot:v18];

  id v19 = [(CKContextDonationItem *)self rawHTML];
  [v4 setRawHTML:v19];

  unint64_t v20 = [(CKContextRequest *)self preferredSceneIdentifiers];
  v21 = (void *)[v20 copy];
  [v4 setPreferredSceneIdentifiers:v21];

  [v4 setIncludePartsOfSpeech:self->_includePartsOfSpeech];
  return v4;
}

+ (void)runOffMainThread:(id)a3
{
  block = (void (**)(void))a3;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    LODWORD(v3) = qos_class_self();
    if (v3 >= 0x19) {
      intptr_t v3 = 25;
    }
    else {
      intptr_t v3 = v3;
    }
    id v4 = dispatch_get_global_queue(v3, 0);
    dispatch_async(v4, block);
  }
  else
  {
    block[2]();
  }
}

+ (void)warmUpForRequestType:(unint64_t)a3 withReply:(id)a4
{
  uint64_t v5 = (void *)[a4 copy];
  id v6 = dispatch_get_global_queue(9, 0);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__CKContextRequest_warmUpForRequestType_withReply___block_invoke;
  v8[3] = &unk_1E5B48658;
  id v9 = v5;
  unint64_t v10 = a3;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __51__CKContextRequest_warmUpForRequestType_withReply___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__CKContextRequest_warmUpForRequestType_withReply___block_invoke_2;
  v4[3] = &unk_1E5B48658;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = v2;
  uint64_t v6 = v3;
  _os_activity_initiate(&dword_1A45F4000, "ContextRequest warmUpForRequestType", OS_ACTIVITY_FLAG_DEFAULT, v4);
}

void __51__CKContextRequest_warmUpForRequestType_withReply___block_invoke_2(uint64_t a1)
{
  id v2 = +[CKContextXPCClient xpcConnection];
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2810000000;
  v10[3] = &unk_1A460783D;
  char v11 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__CKContextRequest_warmUpForRequestType_withReply___block_invoke_3;
  v7[3] = &unk_1E5B48630;
  id v9 = v10;
  id v8 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 remoteObjectProxyWithErrorHandler:v7];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__CKContextRequest_warmUpForRequestType_withReply___block_invoke_4;
  v5[3] = &unk_1E5B48540;
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = *(id *)(a1 + 32);
  [v3 warmUpForRequestType:v4 withReply:v5];

  _Block_object_dispose(v10, 8);
}

uint64_t __51__CKContextRequest_warmUpForRequestType_withReply___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  uint64_t v4 = v3;
  if ((atomic_exchange((atomic_uchar *volatile)(*(void *)(*(void *)(a1 + 40) + 8) + 32), 1u) & 1) == 0)
  {
    uint64_t v3 = *(uint64_t (***)(void))(a1 + 32);
    if (v3)
    {
      id v6 = v4;
      uint64_t v3 = (uint64_t (**)(void))v3[2]();
      uint64_t v4 = v6;
    }
  }
  return MEMORY[0x1F41817F8](v3, v4);
}

uint64_t __51__CKContextRequest_warmUpForRequestType_withReply___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)capabilitiesWithReply:(id)a3
{
  uint64_t v4 = (void *)[a3 copy];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__CKContextRequest_capabilitiesWithReply___block_invoke;
  v6[3] = &unk_1E5B48590;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  _os_activity_initiate(&dword_1A45F4000, "ContextRequest capabilitiesWithReply", OS_ACTIVITY_FLAG_DEFAULT, v6);
}

void __42__CKContextRequest_capabilitiesWithReply___block_invoke(uint64_t a1)
{
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2810000000;
  v15[3] = &unk_1A460783D;
  char v16 = 0;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2810000000;
  v13[3] = &unk_1A460783D;
  char v14 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42__CKContextRequest_capabilitiesWithReply___block_invoke_2;
  v9[3] = &unk_1E5B48680;
  char v11 = v15;
  uint64_t v12 = v13;
  id v2 = *(id *)(a1 + 40);
  v9[4] = *(void *)(a1 + 32);
  id v10 = v2;
  uint64_t v3 = (void *)MEMORY[0x1A625EF90](v9);
  uint64_t v4 = +[CKContextXPCClient xpcConnection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__CKContextRequest_capabilitiesWithReply___block_invoke_4;
  v7[3] = &unk_1E5B48540;
  id v5 = v3;
  id v8 = v5;
  id v6 = [v4 remoteObjectProxyWithErrorHandler:v7];
  objc_msgSend(v6, "capabilitiesForRequestType:withReply:", objc_msgSend(*(id *)(a1 + 32), "type"), v5);

  _Block_object_dispose(v13, 8);
  _Block_object_dispose(v15, 8);
}

void __42__CKContextRequest_capabilitiesWithReply___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if ((atomic_exchange((atomic_uchar *volatile)(*(void *)(*(void *)(a1 + 48) + 8) + 32), 1u) & 1) == 0)
  {
    id v10 = +[CKContextXPCClient isXPCConnectionError:v9];
    if (!v10
      || (atomic_exchange((atomic_uchar *volatile)(*(void *)(*(void *)(a1 + 56) + 8) + 32), 1u) & 1) != 0)
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __42__CKContextRequest_capabilitiesWithReply___block_invoke_3;
      v12[3] = &unk_1E5B48540;
      id v13 = *(id *)(a1 + 40);
      char v11 = [v10 remoteObjectProxyWithErrorHandler:v12];
      objc_msgSend(v11, "capabilitiesForRequestType:withReply:", objc_msgSend(*(id *)(a1 + 32), "type"), *(void *)(a1 + 40));
    }
  }
}

void __42__CKContextRequest_capabilitiesWithReply___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = a2;
  id v5 = [v3 set];
  (*(void (**)(uint64_t, id, void, id))(v2 + 16))(v2, v5, 0, v4);
}

void __42__CKContextRequest_capabilitiesWithReply___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = a2;
  id v5 = [v3 set];
  (*(void (**)(uint64_t, id, void, id))(v2 + 16))(v2, v5, 0, v4);
}

+ (void)statusWithReply:(id)a3
{
  uint64_t v3 = (void *)[a3 copy];
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __36__CKContextRequest_statusWithReply___block_invoke;
  activity_block[3] = &unk_1E5B486D0;
  id v6 = v3;
  id v4 = v3;
  _os_activity_initiate(&dword_1A45F4000, "ContextRequest statusWithReply", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __36__CKContextRequest_statusWithReply___block_invoke(uint64_t a1)
{
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2810000000;
  v16[3] = &unk_1A460783D;
  char v17 = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2810000000;
  v14[3] = &unk_1A460783D;
  char v15 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __36__CKContextRequest_statusWithReply___block_invoke_2;
  v10[3] = &unk_1E5B486A8;
  uint64_t v12 = v16;
  id v13 = v14;
  id v11 = *(id *)(a1 + 32);
  v1 = (void *)MEMORY[0x1A625EF90](v10);
  uint64_t v2 = +[CKContextXPCClient xpcConnection];
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  id v7 = __36__CKContextRequest_statusWithReply___block_invoke_4;
  id v8 = &unk_1E5B48540;
  id v3 = v1;
  id v9 = v3;
  id v4 = [v2 remoteObjectProxyWithErrorHandler:&v5];
  objc_msgSend(v4, "statusWithReply:", v3, v5, v6, v7, v8);

  _Block_object_dispose(v14, 8);
  _Block_object_dispose(v16, 8);
}

void __36__CKContextRequest_statusWithReply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ((atomic_exchange((atomic_uchar *volatile)(*(void *)(*(void *)(a1 + 40) + 8) + 32), 1u) & 1) == 0)
  {
    id v7 = +[CKContextXPCClient isXPCConnectionError:v6];
    if (!v7 || (atomic_exchange((atomic_uchar *volatile)(*(void *)(*(void *)(a1 + 48) + 8) + 32), 1u) & 1) != 0)
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    else
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __36__CKContextRequest_statusWithReply___block_invoke_3;
      v9[3] = &unk_1E5B48540;
      id v10 = *(id *)(a1 + 32);
      id v8 = [v7 remoteObjectProxyWithErrorHandler:v9];
      [v8 statusWithReply:*(void *)(a1 + 32)];
    }
  }
}

uint64_t __36__CKContextRequest_statusWithReply___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __36__CKContextRequest_statusWithReply___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __34__CKContextRequest_initWithCoder___block_invoke()
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  uint64_t v2 = [v0 setWithArray:v1];
  id v3 = (void *)initWithCoder__x;
  initWithCoder__x = v2;
}

void __34__CKContextRequest_initWithCoder___block_invoke_2()
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  uint64_t v2 = [v0 setWithArray:v1];
  id v3 = (void *)initWithCoder__x_66;
  initWithCoder__x_66 = v2;
}

void __34__CKContextRequest_initWithCoder___block_invoke_3()
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  uint64_t v2 = [v0 setWithArray:v1];
  id v3 = (void *)initWithCoder__x_73;
  initWithCoder__x_73 = v2;
}

void __34__CKContextRequest_initWithCoder___block_invoke_4()
{
  void v4[2] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  uint64_t v2 = [v0 setWithArray:v1];
  id v3 = (void *)initWithCoder__x_80;
  initWithCoder__x_80 = v2;
}

void __34__CKContextRequest_initWithCoder___block_invoke_5()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v4 count:3];
  uint64_t v2 = objc_msgSend(v0, "setWithArray:", v1, v4, v5);
  id v3 = (void *)initWithCoder__x_88;
  initWithCoder__x_88 = v2;
}

void __34__CKContextRequest_initWithCoder___block_invoke_6()
{
  void v4[2] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  uint64_t v2 = [v0 setWithArray:v1];
  id v3 = (void *)initWithCoder__x_96;
  initWithCoder__x_96 = v2;
}

void __34__CKContextRequest_initWithCoder___block_invoke_7()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v4 count:3];
  uint64_t v2 = objc_msgSend(v0, "setWithArray:", v1, v4, v5);
  id v3 = (void *)initWithCoder__x_104;
  initWithCoder__x_104 = v2;
}

void __34__CKContextRequest_initWithCoder___block_invoke_8()
{
  void v4[2] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  uint64_t v2 = [v0 setWithArray:v1];
  id v3 = (void *)initWithCoder__x_112;
  initWithCoder__x_112 = v2;
}

void __34__CKContextRequest_initWithCoder___block_invoke_9()
{
  void v4[2] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  uint64_t v2 = [v0 setWithArray:v1];
  id v3 = (void *)initWithCoder__x_119;
  initWithCoder__x_119 = v2;
}

- (unint64_t)hash
{
  uint64_t v2 = [(CKContextDonationItem *)self text];
  unint64_t v3 = 31 * [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (CKContextRequest *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
    goto LABEL_84;
  }
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    uint64_t v7 = v4;
    unint64_t v8 = [(CKContextRequest *)self hash];
    if (v8 != [(CKContextRequest *)v7 hash])
    {
      BOOL v6 = 0;
LABEL_83:

      goto LABEL_84;
    }
    id v9 = [(CKContextDonationItem *)self text];
    uint64_t v10 = [(CKContextDonationItem *)v7 text];
    id v11 = (void *)v10;
    if (v9)
    {
      if ([v9 isEqual:v10]) {
        goto LABEL_8;
      }
    }
    else if (!v10)
    {
LABEL_8:
      uint64_t v12 = [(CKContextDonationItem *)self debugText];
      uint64_t v13 = [(CKContextDonationItem *)v7 debugText];
      char v14 = (void *)v13;
      if (v12)
      {
        if ([v12 isEqual:v13]) {
          goto LABEL_10;
        }
      }
      else if (!v13)
      {
LABEL_10:
        char v15 = [(CKContextDonationItem *)self debugUrlString];
        uint64_t v16 = [(CKContextDonationItem *)v7 debugUrlString];
        char v17 = (void *)v16;
        if (v15)
        {
          if ([v15 isEqual:v16]) {
            goto LABEL_12;
          }
        }
        else if (!v16)
        {
LABEL_12:
          id v18 = [(CKContextDonationItem *)self title];
          uint64_t v19 = [(CKContextDonationItem *)v7 title];
          v76 = (void *)v19;
          if (v18)
          {
            if ([v18 isEqual:v19]) {
              goto LABEL_14;
            }
          }
          else if (!v19)
          {
LABEL_14:
            v75 = v18;
            unint64_t v20 = [(CKContextDonationItem *)self contentAuthor];
            uint64_t v21 = [(CKContextDonationItem *)v7 contentAuthor];
            v73 = (void *)v21;
            v74 = v20;
            if (v20)
            {
              if ([v20 isEqual:v21]) {
                goto LABEL_16;
              }
            }
            else if (!v21)
            {
LABEL_16:
              id v22 = [(CKContextDonationItem *)self contentDescription];
              uint64_t v23 = [(CKContextDonationItem *)v7 contentDescription];
              v71 = (void *)v23;
              v72 = v22;
              if (v22)
              {
                if ([v22 isEqual:v23]) {
                  goto LABEL_18;
                }
              }
              else if (!v23)
              {
LABEL_18:
                v24 = [(CKContextDonationItem *)self contentKeywords];
                uint64_t v25 = [(CKContextDonationItem *)v7 contentKeywords];
                v69 = (void *)v25;
                v70 = v24;
                if (v24)
                {
                  if ([v24 isEqual:v25]) {
                    goto LABEL_20;
                  }
                }
                else if (!v25)
                {
LABEL_20:
                  uint64_t v26 = [(CKContextDonationItem *)self languageTag];
                  uint64_t v27 = [(CKContextDonationItem *)v7 languageTag];
                  id v28 = (void *)v27;
                  v68 = (void *)v26;
                  if (v26)
                  {
                    uint64_t v29 = (void *)v26;
                    v30 = v28;
                    if (([v29 isEqual:v28] & 1) == 0) {
                      goto LABEL_74;
                    }
                  }
                  else
                  {
                    v30 = (void *)v27;
                    if (v27)
                    {
LABEL_74:
                      BOOL v6 = 0;
LABEL_75:

                      goto LABEL_76;
                    }
                  }
                  unint64_t type = self->_type;
                  if (type != [(CKContextRequest *)v7 type]) {
                    goto LABEL_74;
                  }
                  BOOL debug = self->_debug;
                  if (debug != [(CKContextRequest *)v7 debug]) {
                    goto LABEL_74;
                  }
                  BOOL dontSkip = self->_dontSkip;
                  if (dontSkip != [(CKContextRequest *)v7 dontSkip]) {
                    goto LABEL_74;
                  }
                  BOOL incPending = self->_incPending;
                  if (incPending != [(CKContextRequest *)v7 incPending]) {
                    goto LABEL_74;
                  }
                  BOOL timing = self->_timing;
                  if (timing != [(CKContextRequest *)v7 timing]) {
                    goto LABEL_74;
                  }
                  BOOL overrideEnableCoreNLPTagging = self->_overrideEnableCoreNLPTagging;
                  if (overrideEnableCoreNLPTagging != [(CKContextRequest *)v7 overrideEnableCoreNLPTagging])goto LABEL_74; {
                  BOOL includeHigherLevelTopics = self->_includeHigherLevelTopics;
                  }
                  if (includeHigherLevelTopics != [(CKContextRequest *)v7 includeHigherLevelTopics])goto LABEL_74; {
                  BOOL includeStructuredExtractionResults = self->_includeStructuredExtractionResults;
                  }
                  if (includeStructuredExtractionResults != [(CKContextRequest *)v7 includeStructuredExtractionResults])goto LABEL_74; {
                  BOOL textIsRaw = self->_textIsRaw;
                  }
                  if (textIsRaw != [(CKContextRequest *)v7 textIsRaw]) {
                    goto LABEL_74;
                  }
                  BOOL includeRequestInResponse = self->_includeRequestInResponse;
                  if (includeRequestInResponse != [(CKContextRequest *)v7 includeRequestInResponse])goto LABEL_74; {
                  unsigned int topk = self->_topk;
                  }
                  if (topk != [(CKContextRequest *)v7 topk]) {
                    goto LABEL_74;
                  }
                  int64_t maxConstellationTopics = self->_maxConstellationTopics;
                  if (maxConstellationTopics != [(CKContextRequest *)v7 maxConstellationTopics])goto LABEL_74; {
                  int overrideConstellationMinCount = self->_overrideConstellationMinCount;
                  }
                  if (overrideConstellationMinCount != [(CKContextRequest *)v7 overrideConstellationMinCount])goto LABEL_74; {
                  int overrideConstellationMinWeight = self->_overrideConstellationMinWeight;
                  }
                  if (overrideConstellationMinWeight != [(CKContextRequest *)v7 overrideConstellationMinWeight])goto LABEL_74; {
                  unint64_t fingerprintMax = self->_fingerprintMax;
                  }
                  if (fingerprintMax != [(CKContextRequest *)v7 fingerprintMax]) {
                    goto LABEL_74;
                  }
                  double donationTimeout = self->_donationTimeout;
                  [(CKContextRequest *)v7 donationTimeout];
                  if (donationTimeout != v32) {
                    goto LABEL_74;
                  }
                  overrideBlendAlpha = self->_overrideBlendAlpha;
                  v67 = [(CKContextRequest *)v7 overrideBlendAlpha];
                  if (overrideBlendAlpha)
                  {
                    if ([(NSNumber *)overrideBlendAlpha isEqual:v67]) {
                      goto LABEL_57;
                    }
                  }
                  else if (!v67)
                  {
LABEL_57:
                    overrideBlendBeta = self->_overrideBlendBeta;
                    v51 = [(CKContextRequest *)v7 overrideBlendBeta];
                    if (overrideBlendBeta)
                    {
                      if ([(NSNumber *)overrideBlendBeta isEqual:v51]) {
                        goto LABEL_59;
                      }
                    }
                    else if (!v51)
                    {
LABEL_59:
                      overrideBlendGamma = self->_overrideBlendGamma;
                      v49 = [(CKContextRequest *)v7 overrideBlendGamma];
                      if (overrideBlendGamma)
                      {
                        if ([(NSNumber *)overrideBlendGamma isEqual:v49]) {
                          goto LABEL_61;
                        }
                      }
                      else if (!v49)
                      {
LABEL_61:
                        urls = self->_urls;
                        v47 = [(CKContextRequest *)v7 urls];
                        if (urls)
                        {
                          if ([(NSArray *)urls isEqual:v47]) {
                            goto LABEL_63;
                          }
                        }
                        else if (!v47)
                        {
LABEL_63:
                          itemIds = self->_itemIds;
                          v45 = [(CKContextRequest *)v7 itemIds];
                          if (itemIds)
                          {
                            if ([(NSDictionary *)itemIds isEqual:v45]) {
                              goto LABEL_65;
                            }
                          }
                          else if (!v45)
                          {
LABEL_65:
                            desiredLanguageTags = self->_desiredLanguageTags;
                            v43 = [(CKContextRequest *)v7 desiredLanguageTags];
                            if (desiredLanguageTags)
                            {
                              if ([(NSOrderedSet *)desiredLanguageTags isEqual:v43]) {
                                goto LABEL_67;
                              }
                            }
                            else if (!v43)
                            {
LABEL_67:
                              donorBundleIdentifiers = self->_donorBundleIdentifiers;
                              v41 = [(CKContextRequest *)v7 donorBundleIdentifiers];
                              if (donorBundleIdentifiers)
                              {
                                if ([(NSArray *)donorBundleIdentifiers isEqual:v41]) {
                                  goto LABEL_69;
                                }
                              }
                              else if (!v41)
                              {
LABEL_69:
                                allowedTopicTypeTags = self->_allowedTopicTypeTags;
                                v39 = [(CKContextRequest *)v7 allowedTopicTypeTags];
                                if (allowedTopicTypeTags)
                                {
                                  if ([(NSSet *)allowedTopicTypeTags isEqual:v39]) {
                                    goto LABEL_71;
                                  }
                                }
                                else if (!v39)
                                {
LABEL_71:
                                  v37 = [(CKContextRequest *)v7 preferredSceneIdentifiers];
                                  if (v35)
                                  {
                                    if ([v35 isEqual:v37])
                                    {
LABEL_73:
                                      BOOL includePartsOfSpeech = self->_includePartsOfSpeech;
                                      BOOL v6 = includePartsOfSpeech == [(CKContextRequest *)v7 includePartsOfSpeech];
LABEL_103:

                                      goto LABEL_104;
                                    }
                                  }
                                  else if (!v37)
                                  {
                                    goto LABEL_73;
                                  }
                                  BOOL v6 = 0;
                                  goto LABEL_103;
                                }
                                BOOL v6 = 0;
LABEL_104:

                                goto LABEL_105;
                              }
                              BOOL v6 = 0;
LABEL_105:

                              goto LABEL_106;
                            }
                            BOOL v6 = 0;
LABEL_106:

                            goto LABEL_107;
                          }
                          BOOL v6 = 0;
LABEL_107:

                          goto LABEL_108;
                        }
                        BOOL v6 = 0;
LABEL_108:

                        goto LABEL_109;
                      }
                      BOOL v6 = 0;
LABEL_109:

                      goto LABEL_110;
                    }
                    BOOL v6 = 0;
LABEL_110:

                    goto LABEL_111;
                  }
                  BOOL v6 = 0;
LABEL_111:

                  goto LABEL_75;
                }
                BOOL v6 = 0;
LABEL_76:

                goto LABEL_77;
              }
              BOOL v6 = 0;
LABEL_77:

              goto LABEL_78;
            }
            BOOL v6 = 0;
LABEL_78:

            id v18 = v75;
            goto LABEL_79;
          }
          BOOL v6 = 0;
LABEL_79:

          goto LABEL_80;
        }
        BOOL v6 = 0;
LABEL_80:

        goto LABEL_81;
      }
      BOOL v6 = 0;
LABEL_81:

      goto LABEL_82;
    }
    BOOL v6 = 0;
LABEL_82:

    goto LABEL_83;
  }
  BOOL v6 = 0;
LABEL_84:

  return v6;
}

- (CKContextRequest)initWithText:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CKContextRequest;
  uint64_t v5 = [(CKContextRequest *)&v8 init];
  BOOL v6 = v5;
  if (v5)
  {
    [(CKContextRequest *)v5 setText:v4];
    v6->_unint64_t type = _defaultRequestType;
  }

  return v6;
}

- (void)executeWithReply:(id)a3
{
  id v4 = (void *)[a3 copy];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__CKContextRequest_executeWithReply___block_invoke;
  v6[3] = &unk_1E5B485E0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  _os_activity_initiate(&dword_1A45F4000, "ContextRequest executeWithReply", OS_ACTIVITY_FLAG_DEFAULT, v6);
}

uint64_t __37__CKContextRequest_executeWithReply___block_invoke(uint64_t a1)
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    __37__CKContextRequest_executeWithReply___block_invoke_cold_1(a1);
  }
  return [*(id *)(a1 + 32) _executeWithReply:*(void *)(a1 + 40)];
}

- (id)execute
{
  uint64_t v3 = mach_absolute_time();
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__0;
  uint64_t v19 = __Block_byref_object_dispose__0;
  id v20 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __27__CKContextRequest_execute__block_invoke;
  v14[3] = &unk_1E5B48788;
  void v14[4] = self;
  v14[5] = &v15;
  _os_activity_initiate(&dword_1A45F4000, "ContextRequest execute", OS_ACTIVITY_FLAG_DEFAULT, v14);
  +[CKContextClient timeIntervalBetweenMachTime:mach_absolute_time() andMachTime:v3];
  BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
  if (v4) {
    [(CKContextRequest *)v4 execute];
  }
  id v12 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v12;
}

void __27__CKContextRequest_execute__block_invoke(uint64_t a1)
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    __37__CKContextRequest_executeWithReply___block_invoke_cold_1(a1);
  }
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 112) tryAcquireServiceSemaphoreNeedsIncPending:*(unsigned __int8 *)(*(void *)(a1 + 32) + 128) == 0];
  if (v2 != 2)
  {
    if (v2)
    {
      *(unsigned char *)(*(void *)(a1 + 32) + 128) = 1;
    }
    else
    {
      uint64_t v3 = [CKContextResponse alloc];
      BOOL v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.siri.context" code:6 userInfo:0];
      uint64_t v5 = -[CKContextResponse initWithError:requestType:](v3, "initWithError:requestType:", v4, [*(id *)(a1 + 32) type]);
      uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;
    }
  }
  uint64_t v8 = a1 + 40;
  uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (!v9)
  {
    uint64_t v10 = +[CKContextXPCClient xpcConnection];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __27__CKContextRequest_execute__block_invoke_138;
    v20[3] = &unk_1E5B48760;
    long long v21 = *(_OWORD *)(a1 + 32);
    uint64_t v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:v20];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __27__CKContextRequest_execute__block_invoke_2;
    v19[3] = &unk_1E5B48738;
    uint64_t v12 = *(void *)(a1 + 32);
    v19[4] = *(void *)(a1 + 40);
    [v11 findResultsForRequest:v12 withReply:v19];

    uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (!v9)
    {
      uint64_t v13 = [CKContextResponse alloc];
      char v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.siri.context" code:8 userInfo:0];
      uint64_t v15 = -[CKContextResponse initWithError:requestType:](v13, "initWithError:requestType:", v14, [*(id *)(a1 + 32) type]);
      uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v17 = *(void **)(v16 + 40);
      *(void *)(v16 + 40) = v15;

      uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    }
  }
  [*(id *)(a1 + 32) _postProcessResponse:v9];
  id v18 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) error];

  if (v18)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      __27__CKContextRequest_execute__block_invoke_cold_1(v8);
    }
  }
}

void __27__CKContextRequest_execute__block_invoke_138(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v3;
    _os_log_impl(&dword_1A45F4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Error in execute: %@", buf, 0xCu);
  }
  BOOL v4 = +[CKContextXPCClient isXPCConnectionError:v3];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_141];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = __27__CKContextRequest_execute__block_invoke_142;
    v11[3] = &unk_1E5B48738;
    uint64_t v7 = *(void *)(a1 + 32);
    v11[4] = *(void *)(a1 + 40);
    [v6 findResultsForRequest:v7 withReply:v11];
  }
  uint64_t v8 = -[CKContextResponse initWithError:requestType:]([CKContextResponse alloc], "initWithError:requestType:", v3, [*(id *)(a1 + 32) type]);
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

void __27__CKContextRequest_execute__block_invoke_139()
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __27__CKContextRequest_execute__block_invoke_139_cold_1();
  }
}

void __27__CKContextRequest_execute__block_invoke_142(uint64_t a1, void *a2)
{
}

void __27__CKContextRequest_execute__block_invoke_2(uint64_t a1, void *a2)
{
}

- (void)_postProcessResponse:(id)a3
{
  id v10 = a3;
  BOOL v4 = [v10 error];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 code];
    if (v6 == 7 || v6 == 4)
    {
      unint64_t v7 = [(CKContextRequest *)self type];
      if (v7 == 1 || v7 == 15 || [(CKContextRequest *)self type] == 10)
      {
        uint64_t v8 = [v5 domain];
        int v9 = [v8 isEqualToString:@"com.apple.siri.context"];

        if (v9) {
          [v10 setError:0];
        }
      }
    }
  }
}

- (void)_executeWithReply:(id)a3
{
  id v4 = a3;
  uint64_t v5 = mach_absolute_time();
  int64_t v6 = [(CKContextClient *)self->_client tryAcquireServiceSemaphoreNeedsIncPending:!self->_incPending];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __38__CKContextRequest__executeWithReply___block_invoke;
  v28[3] = &unk_1E5B487B0;
  uint64_t v30 = v5;
  v28[4] = self;
  id v7 = v4;
  id v29 = v7;
  uint64_t v8 = (void (**)(void, void))MEMORY[0x1A625EF90](v28);
  int v9 = v8;
  if (v6)
  {
    v26[0] = 0;
    v26[1] = v26;
    v26[2] = 0x2810000000;
    v26[3] = &unk_1A460783D;
    char v27 = 0;
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x2810000000;
    v24[3] = &unk_1A460783D;
    char v25 = 0;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __38__CKContextRequest__executeWithReply___block_invoke_147;
    v20[3] = &unk_1E5B48800;
    id v22 = v26;
    uint64_t v23 = v24;
    id v10 = v8;
    void v20[4] = self;
    id v21 = v10;
    uint64_t v11 = (void *)MEMORY[0x1A625EF90](v20);
    uint64_t v12 = +[CKContextXPCClient xpcConnection];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __38__CKContextRequest__executeWithReply___block_invoke_3;
    v18[3] = &unk_1E5B487D8;
    id v13 = v11;
    v18[4] = self;
    id v19 = v13;
    uint64_t v14 = [v12 remoteObjectProxyWithErrorHandler:v18];
    [v14 findResultsForRequest:self withReply:v10];

    _Block_object_dispose(v24, 8);
    _Block_object_dispose(v26, 8);
  }
  else
  {
    uint64_t v15 = [CKContextResponse alloc];
    uint64_t v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.siri.context" code:6 userInfo:0];
    uint64_t v17 = [(CKContextResponse *)v15 initWithError:v16 requestType:[(CKContextRequest *)self type]];

    ((void (**)(void, CKContextResponse *))v9)[2](v9, v17);
  }
}

void __38__CKContextRequest__executeWithReply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  +[CKContextClient timeIntervalBetweenMachTime:mach_absolute_time() andMachTime:*(void *)(a1 + 48)];
  BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
  if (v4) {
    __38__CKContextRequest__executeWithReply___block_invoke_cold_2(v4, v5, v6, v7, v8, v9, v10, v11);
  }
  [*(id *)(a1 + 32) _postProcessResponse:v3];
  uint64_t v12 = [v3 error];

  if (v12 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __38__CKContextRequest__executeWithReply___block_invoke_cold_1(v3);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __38__CKContextRequest__executeWithReply___block_invoke_147(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((atomic_exchange((atomic_uchar *volatile)(*(void *)(*(void *)(a1 + 48) + 8) + 32), 1u) & 1) == 0)
  {
    BOOL v4 = +[CKContextXPCClient xpcConnection];
    if (!v4 || (atomic_exchange((atomic_uchar *volatile)(*(void *)(*(void *)(a1 + 56) + 8) + 32), 1u) & 1) != 0)
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      uint64_t v7 = MEMORY[0x1E4F143A8];
      uint64_t v8 = 3221225472;
      uint64_t v9 = __38__CKContextRequest__executeWithReply___block_invoke_2;
      uint64_t v10 = &unk_1E5B487D8;
      id v5 = *(id *)(a1 + 40);
      uint64_t v11 = *(void *)(a1 + 32);
      id v12 = v5;
      uint64_t v6 = [v4 remoteObjectProxyWithErrorHandler:&v7];
      objc_msgSend(v6, "findResultsForRequest:withReply:", *(void *)(a1 + 32), *(void *)(a1 + 40), v7, v8, v9, v10);
    }
  }
}

void __38__CKContextRequest__executeWithReply___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  id v5 = -[CKContextResponse initWithError:requestType:]([CKContextResponse alloc], "initWithError:requestType:", v4, [*(id *)(a1 + 32) type]);

  (*(void (**)(uint64_t, CKContextResponse *))(v3 + 16))(v3, v5);
}

void __38__CKContextRequest__executeWithReply___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  id v5 = -[CKContextResponse initWithError:requestType:]([CKContextResponse alloc], "initWithError:requestType:", v4, [*(id *)(a1 + 32) type]);

  (*(void (**)(uint64_t, CKContextResponse *))(v3 + 16))(v3, v5);
}

uint64_t __59__CKContextRequest__executeCategorizationRequestWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)requestWithText:(id)a3
{
  id v3 = a3;
  id v4 = [[CKContextRequest alloc] initWithText:v3];

  return v4;
}

+ (BOOL)pingService
{
  int v2 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  char v3 = 1;
  do
  {
    id v4 = +[CKContextXPCClient xpcConnection];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __31__CKContextRequest_pingService__block_invoke;
    v10[3] = &unk_1E5B48850;
    int v11 = v2;
    void v10[4] = &v16;
    uint64_t v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v10];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __31__CKContextRequest_pingService__block_invoke_148;
    v9[3] = &unk_1E5B48878;
    void v9[4] = &v12;
    [(id)v5 pingServiceWithReply:v9];

    LOBYTE(v5) = *((unsigned char *)v13 + 24) == 0;
    char v6 = v5 & v3;
    int v2 = 1;
    char v3 = 0;
  }
  while ((v6 & 1) != 0);
  BOOL v7 = *((unsigned char *)v17 + 24) == 0;
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
  return v7;
}

void __31__CKContextRequest_pingService__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 domain];
  if (v4 == (void *)*MEMORY[0x1E4F281F8])
  {
    int v5 = *(_DWORD *)(a1 + 40);

    if (!v5)
    {
      +[CKContextXPCClient invalidateXpcConnection];
      goto LABEL_6;
    }
  }
  else
  {
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __31__CKContextRequest_pingService__block_invoke_cold_1();
  }
LABEL_6:
}

uint64_t __31__CKContextRequest_pingService__block_invoke_148(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

+ (BOOL)shutdownService
{
  int v2 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  char v3 = 1;
  do
  {
    id v4 = +[CKContextXPCClient xpcConnection];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __35__CKContextRequest_shutdownService__block_invoke;
    v10[3] = &unk_1E5B48850;
    int v11 = v2;
    void v10[4] = &v16;
    uint64_t v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v10];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __35__CKContextRequest_shutdownService__block_invoke_149;
    v9[3] = &unk_1E5B48878;
    void v9[4] = &v12;
    [(id)v5 shutdownServiceWithReply:v9];

    LOBYTE(v5) = *((unsigned char *)v13 + 24) == 0;
    char v6 = v5 & v3;
    int v2 = 1;
    char v3 = 0;
  }
  while ((v6 & 1) != 0);
  BOOL v7 = *((unsigned char *)v17 + 24) == 0;
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
  return v7;
}

void __35__CKContextRequest_shutdownService__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 domain];
  if (v4 == (void *)*MEMORY[0x1E4F281F8])
  {
    int v5 = *(_DWORD *)(a1 + 40);

    if (!v5)
    {
      +[CKContextXPCClient invalidateXpcConnection];
      goto LABEL_6;
    }
  }
  else
  {
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __35__CKContextRequest_shutdownService__block_invoke_cold_1();
  }
LABEL_6:
}

void __35__CKContextRequest_shutdownService__block_invoke_149(uint64_t a1)
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v2 = 0;
    _os_log_impl(&dword_1A45F4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "shutdown returned OK", v2, 2u);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
}

+ (void)logResultsShownForResponseId:(id)a3 shown:(unint64_t)a4 couldHaveShown:(unint64_t)a5 topicIds:(id)a6 serverOverride:(BOOL)a7 inputLength:(unint64_t)a8 requestType:(unint64_t)a9 logType:(unint64_t)a10
{
  id v15 = a3;
  id v16 = a6;
  uint64_t v17 = dispatch_get_global_queue(9, 0);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __126__CKContextRequest_logResultsShownForResponseId_shown_couldHaveShown_topicIds_serverOverride_inputLength_requestType_logType___block_invoke;
  v20[3] = &unk_1E5B488A0;
  unint64_t v23 = a4;
  unint64_t v24 = a5;
  id v21 = v15;
  id v22 = v16;
  BOOL v28 = a7;
  unint64_t v25 = a8;
  unint64_t v26 = a9;
  unint64_t v27 = a10;
  id v18 = v16;
  id v19 = v15;
  dispatch_async(v17, v20);
}

void __126__CKContextRequest_logResultsShownForResponseId_shown_couldHaveShown_topicIds_serverOverride_inputLength_requestType_logType___block_invoke(uint64_t a1)
{
  id v3 = +[CKContextXPCClient xpcConnection];
  int v2 = [v3 remoteObjectProxyWithErrorHandler:&__block_literal_global_151];
  [v2 logResultsShownForResponseId:*(void *)(a1 + 32) shown:*(void *)(a1 + 48) couldHaveShown:*(void *)(a1 + 56) topicIds:*(void *)(a1 + 40) serverOverride:*(unsigned __int8 *)(a1 + 88) inputLength:*(void *)(a1 + 64) requestType:*(void *)(a1 + 72) logType:*(void *)(a1 + 80)];
}

void __126__CKContextRequest_logResultsShownForResponseId_shown_couldHaveShown_topicIds_serverOverride_inputLength_requestType_logType___block_invoke_2()
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __126__CKContextRequest_logResultsShownForResponseId_shown_couldHaveShown_topicIds_serverOverride_inputLength_requestType_logType___block_invoke_2_cold_1();
  }
}

+ (void)logEngagementForResponseId:(id)a3 result:(id)a4 rank:(unint64_t)a5 inputLength:(unint64_t)a6 completionLength:(unint64_t)a7 requestType:(unint64_t)a8 logType:(unint64_t)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = dispatch_get_global_queue(9, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __108__CKContextRequest_logEngagementForResponseId_result_rank_inputLength_completionLength_requestType_logType___block_invoke;
  block[3] = &unk_1E5B488F0;
  id v20 = v14;
  id v21 = v15;
  unint64_t v22 = a5;
  unint64_t v23 = a6;
  unint64_t v24 = a7;
  unint64_t v25 = a8;
  unint64_t v26 = a9;
  id v17 = v15;
  id v18 = v14;
  dispatch_async(v16, block);
}

void __108__CKContextRequest_logEngagementForResponseId_result_rank_inputLength_completionLength_requestType_logType___block_invoke(uint64_t a1)
{
  int v2 = +[CKContextXPCClient xpcConnection];
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  BOOL v7 = __108__CKContextRequest_logEngagementForResponseId_result_rank_inputLength_completionLength_requestType_logType___block_invoke_2;
  uint64_t v8 = &unk_1E5B488C8;
  id v9 = *(id *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  long long v3 = *(_OWORD *)(a1 + 64);
  long long v11 = *(_OWORD *)(a1 + 48);
  long long v12 = v3;
  uint64_t v13 = *(void *)(a1 + 80);
  id v4 = [v2 remoteObjectProxyWithErrorHandler:&v5];
  objc_msgSend(v4, "logEngagementForResponseId:result:rank:inputLength:completionLength:requestType:logType:", *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), v5, v6, v7, v8);
}

void __108__CKContextRequest_logEngagementForResponseId_result_rank_inputLength_completionLength_requestType_logType___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __108__CKContextRequest_logEngagementForResponseId_result_rank_inputLength_completionLength_requestType_logType___block_invoke_2_cold_1();
  }
  id v4 = +[CKContextXPCClient isXPCConnectionError:v3];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 remoteObjectProxyWithErrorHandler:&__block_literal_global_154];
    [v6 logEngagementForResponseId:a1[4] result:a1[5] rank:a1[6] inputLength:a1[7] completionLength:a1[8] requestType:a1[9] logType:a1[10]];
  }
}

void __108__CKContextRequest_logEngagementForResponseId_result_rank_inputLength_completionLength_requestType_logType___block_invoke_152()
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __108__CKContextRequest_logEngagementForResponseId_result_rank_inputLength_completionLength_requestType_logType___block_invoke_152_cold_1();
  }
}

+ (void)logTransactionSuccessfulForResponseId:(id)a3 inputLength:(unint64_t)a4 completionLength:(unint64_t)a5 requestType:(unint64_t)a6 logType:(unint64_t)a7
{
  id v11 = a3;
  long long v12 = dispatch_get_global_queue(9, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __107__CKContextRequest_logTransactionSuccessfulForResponseId_inputLength_completionLength_requestType_logType___block_invoke;
  block[3] = &unk_1E5B48940;
  id v15 = v11;
  unint64_t v16 = a4;
  unint64_t v17 = a5;
  unint64_t v18 = a6;
  unint64_t v19 = a7;
  id v13 = v11;
  dispatch_async(v12, block);
}

void __107__CKContextRequest_logTransactionSuccessfulForResponseId_inputLength_completionLength_requestType_logType___block_invoke(uint64_t a1)
{
  int v2 = +[CKContextXPCClient xpcConnection];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __107__CKContextRequest_logTransactionSuccessfulForResponseId_inputLength_completionLength_requestType_logType___block_invoke_2;
  v5[3] = &unk_1E5B48918;
  id v6 = *(id *)(a1 + 32);
  long long v3 = *(_OWORD *)(a1 + 56);
  long long v7 = *(_OWORD *)(a1 + 40);
  long long v8 = v3;
  id v4 = [v2 remoteObjectProxyWithErrorHandler:v5];
  [v4 logTransactionSuccessfulForResponseId:*(void *)(a1 + 32) inputLength:*(void *)(a1 + 40) completionLength:*(void *)(a1 + 48) requestType:*(void *)(a1 + 56) logType:*(void *)(a1 + 64)];
}

void __107__CKContextRequest_logTransactionSuccessfulForResponseId_inputLength_completionLength_requestType_logType___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __107__CKContextRequest_logTransactionSuccessfulForResponseId_inputLength_completionLength_requestType_logType___block_invoke_2_cold_1();
  }
  id v4 = +[CKContextXPCClient isXPCConnectionError:v3];
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = [v4 remoteObjectProxyWithErrorHandler:&__block_literal_global_157];
    [v6 logTransactionSuccessfulForResponseId:a1[4] inputLength:a1[5] completionLength:a1[6] requestType:a1[7] logType:a1[8]];
  }
}

void __107__CKContextRequest_logTransactionSuccessfulForResponseId_inputLength_completionLength_requestType_logType___block_invoke_155()
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __107__CKContextRequest_logTransactionSuccessfulForResponseId_inputLength_completionLength_requestType_logType___block_invoke_155_cold_1();
  }
}

- (void)setText:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(CKContextRequest *)self type];
  if ((v5 == 15 || v5 == 1) && ![v4 length])
  {
    BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO);
    if (v4)
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        long long v7 = MEMORY[0x1E4F14500];
        long long v8 = "Tried to set empty request.text";
LABEL_9:
        _os_log_impl(&dword_1A45F4000, v7, OS_LOG_TYPE_INFO, v8, buf, 2u);
      }
    }
    else if (v6)
    {
      *(_WORD *)buf = 0;
      long long v7 = MEMORY[0x1E4F14500];
      long long v8 = "Tried to set nil request.text";
      goto LABEL_9;
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)CKContextRequest;
  [(CKContextDonationItem *)&v9 setText:v4];
}

- (BOOL)isRequestingContentFromActiveApplications
{
  BOOL result = ([(CKContextRequest *)self type] == 10
         || [(CKContextRequest *)self type] == 16
         || [(CKContextRequest *)self type] == 20)
        && ([(CKContextDonationItem *)self text],
            id v3 = objc_claimAutoreleasedReturnValue(),
            v3,
            !v3)
        && [(NSArray *)self->_urls count] == 0;
  return result;
}

+ (void)requestServiceSemaphoreWithReply:(id)a3
{
  id v3 = a3;
  id v5 = +[CKContextXPCClient xpcConnection];
  id v4 = [v5 remoteObjectProxyWithErrorHandler:&__block_literal_global_161];
  [v4 semaphoreWithReply:v3];
}

void __53__CKContextRequest_requestServiceSemaphoreWithReply___block_invoke()
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __53__CKContextRequest_requestServiceSemaphoreWithReply___block_invoke_cold_1();
  }
}

+ (id)requestServiceSemaphore
{
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  unint64_t v17 = __Block_byref_object_copy__0;
  unint64_t v18 = __Block_byref_object_dispose__0;
  id v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __43__CKContextRequest_requestServiceSemaphore__block_invoke;
  v13[3] = &unk_1E5B48968;
  void v13[4] = &v14;
  int v2 = (void *)MEMORY[0x1A625EF90](v13, a2);
  id v3 = +[CKContextXPCClient xpcConnection];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __43__CKContextRequest_requestServiceSemaphore__block_invoke_2;
  id v11 = &unk_1E5B48540;
  id v4 = v2;
  id v12 = v4;
  id v5 = [v3 synchronousRemoteObjectProxyWithErrorHandler:&v8];
  objc_msgSend(v5, "semaphoreWithReply:", v4, v8, v9, v10, v11);

  id v6 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v6;
}

void __43__CKContextRequest_requestServiceSemaphore__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

void __43__CKContextRequest_requestServiceSemaphore__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __43__CKContextRequest_requestServiceSemaphore__block_invoke_2_cold_1();
  }
  id v4 = +[CKContextXPCClient isXPCConnectionError:v3];
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_165];
    [v6 semaphoreWithReply:*(void *)(a1 + 32)];
  }
}

void __43__CKContextRequest_requestServiceSemaphore__block_invoke_163()
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __43__CKContextRequest_requestServiceSemaphore__block_invoke_163_cold_1();
  }
}

- (void)setType:(unint64_t)a3
{
  self->_unint64_t type = a3;
}

- (BOOL)textIsRaw
{
  return self->_textIsRaw;
}

- (void)setTextIsRaw:(BOOL)a3
{
  self->_BOOL textIsRaw = a3;
}

- (BOOL)includeHigherLevelTopics
{
  return self->_includeHigherLevelTopics;
}

- (NSDictionary)itemIds
{
  return self->_itemIds;
}

- (void)setItemIds:(id)a3
{
}

- (int64_t)maxConstellationTopics
{
  return self->_maxConstellationTopics;
}

- (void)setMaxConstellationTopics:(int64_t)a3
{
  self->_int64_t maxConstellationTopics = a3;
}

- (NSSet)allowedTopicTypeTags
{
  return self->_allowedTopicTypeTags;
}

- (void)setAllowedTopicTypeTags:(id)a3
{
}

- (BOOL)includeStructuredExtractionResults
{
  return self->_includeStructuredExtractionResults;
}

- (void)setIncludeStructuredExtractionResults:(BOOL)a3
{
  self->_BOOL includeStructuredExtractionResults = a3;
}

- (BOOL)includeLeadImage
{
  return self->_includeLeadImage;
}

- (void)setIncludeLeadImage:(BOOL)a3
{
  self->_includeLeadImage = a3;
}

- (BOOL)includePartsOfSpeech
{
  return self->_includePartsOfSpeech;
}

- (void)setIncludePartsOfSpeech:(BOOL)a3
{
  self->_BOOL includePartsOfSpeech = a3;
}

- (unint64_t)fingerprintMax
{
  return self->_fingerprintMax;
}

- (void)setFingerprintMax:(unint64_t)a3
{
  self->_unint64_t fingerprintMax = a3;
}

- (double)donationTimeout
{
  return self->_donationTimeout;
}

- (void)setDonationTimeout:(double)a3
{
  self->_double donationTimeout = a3;
}

- (NSSet)preferredSceneIdentifiers
{
  return self->_preferredSceneIdentifiers;
}

- (void)setPreferredSceneIdentifiers:(id)a3
{
}

- (BOOL)dontSkip
{
  return self->_dontSkip;
}

- (void)setDontSkip:(BOOL)a3
{
  self->_BOOL dontSkip = a3;
}

- (BOOL)timing
{
  return self->_timing;
}

- (void)setTiming:(BOOL)a3
{
  self->_BOOL timing = a3;
}

- (NSNumber)overrideBlendAlpha
{
  return self->_overrideBlendAlpha;
}

- (void)setOverrideBlendAlpha:(id)a3
{
}

- (NSNumber)overrideBlendBeta
{
  return self->_overrideBlendBeta;
}

- (void)setOverrideBlendBeta:(id)a3
{
}

- (NSNumber)overrideBlendGamma
{
  return self->_overrideBlendGamma;
}

- (void)setOverrideBlendGamma:(id)a3
{
}

- (int)overrideConstellationMinCount
{
  return self->_overrideConstellationMinCount;
}

- (void)setOverrideConstellationMinCount:(int)a3
{
  self->_int overrideConstellationMinCount = a3;
}

- (int)overrideConstellationMinWeight
{
  return self->_overrideConstellationMinWeight;
}

- (void)setOverrideConstellationMinWeight:(int)a3
{
  self->_int overrideConstellationMinWeight = a3;
}

- (unsigned)topk
{
  return self->_topk;
}

- (void)setTopk:(unsigned int)a3
{
  self->_unsigned int topk = a3;
}

- (BOOL)overrideEnableCoreNLPTagging
{
  return self->_overrideEnableCoreNLPTagging;
}

- (void)setOverrideEnableCoreNLPTagging:(BOOL)a3
{
  self->_BOOL overrideEnableCoreNLPTagging = a3;
}

- (void)setIncPending:(BOOL)a3
{
  self->_BOOL incPending = a3;
}

- (BOOL)debug
{
  return self->_debug;
}

- (void)setDebug:(BOOL)a3
{
  self->_BOOL debug = a3;
}

- (BOOL)includeRequestInResponse
{
  return self->_includeRequestInResponse;
}

- (void)setIncludeRequestInResponse:(BOOL)a3
{
  self->_BOOL includeRequestInResponse = a3;
}

- (NSOrderedSet)desiredLanguageTags
{
  return self->_desiredLanguageTags;
}

- (void)setDesiredLanguageTags:(id)a3
{
}

- (NSArray)donorBundleIdentifiers
{
  return self->_donorBundleIdentifiers;
}

- (void)setDonorBundleIdentifiers:(id)a3
{
}

void __37__CKContextRequest_executeWithReply___block_invoke_cold_1(uint64_t a1)
{
  [*(id *)(a1 + 32) type];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_0(&dword_1A45F4000, MEMORY[0x1E4F14500], v1, "ContextRequest type: %lu", v2, v3, v4, v5, v6);
}

- (double)execute
{
  OUTLINED_FUNCTION_2_0(&dword_1A45F4000, MEMORY[0x1E4F14500], a3, "ContextRequest round trip time for synchronous request: %f Msec", a5, a6, a7, a8, 0);
  return result;
}

void __27__CKContextRequest_execute__block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = [*(id *)(*(void *)(*(void *)a1 + 8) + 40) error];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A45F4000, MEMORY[0x1E4F14500], v2, "Error in execute: %@", v3, v4, v5, v6, v7);
}

void __27__CKContextRequest_execute__block_invoke_139_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A45F4000, MEMORY[0x1E4F14500], v0, "Error in execute (second attempt): %@", v1, v2, v3, v4, v5);
}

void __38__CKContextRequest__executeWithReply___block_invoke_cold_1(void *a1)
{
  uint64_t v1 = [a1 error];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A45F4000, MEMORY[0x1E4F14500], v2, "Error in executeWithReply: %@", v3, v4, v5, v6, v7);
}

double __38__CKContextRequest__executeWithReply___block_invoke_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_1A45F4000, MEMORY[0x1E4F14500], a3, "ContextRequest round trip time for async request: %f Msec", a5, a6, a7, a8, 0);
  return result;
}

double __59__CKContextRequest__executeCategorizationRequestWithReply___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_1A45F4000, MEMORY[0x1E4F14500], a3, "ContextRequest round trip time for async batch categorization request: %f Msec", a5, a6, a7, a8, 0);
  return result;
}

void __31__CKContextRequest_pingService__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A45F4000, MEMORY[0x1E4F14500], v0, "Error in pingService: %@", v1, v2, v3, v4, v5);
}

void __35__CKContextRequest_shutdownService__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A45F4000, MEMORY[0x1E4F14500], v0, "Error in shutdownService: %@", v1, v2, v3, v4, v5);
}

void __126__CKContextRequest_logResultsShownForResponseId_shown_couldHaveShown_topicIds_serverOverride_inputLength_requestType_logType___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A45F4000, MEMORY[0x1E4F14500], v0, "Error in logResultsShownForResponseId: %@", v1, v2, v3, v4, v5);
}

void __108__CKContextRequest_logEngagementForResponseId_result_rank_inputLength_completionLength_requestType_logType___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A45F4000, MEMORY[0x1E4F14500], v0, "Error in logEngagementForResponseId: %@", v1, v2, v3, v4, v5);
}

void __108__CKContextRequest_logEngagementForResponseId_result_rank_inputLength_completionLength_requestType_logType___block_invoke_152_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A45F4000, MEMORY[0x1E4F14500], v0, "Error in logEngagementForResponseId (second attempt): %@", v1, v2, v3, v4, v5);
}

void __107__CKContextRequest_logTransactionSuccessfulForResponseId_inputLength_completionLength_requestType_logType___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A45F4000, MEMORY[0x1E4F14500], v0, "Error in logTransactionSuccessfulForResponseId: %@", v1, v2, v3, v4, v5);
}

void __107__CKContextRequest_logTransactionSuccessfulForResponseId_inputLength_completionLength_requestType_logType___block_invoke_155_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A45F4000, MEMORY[0x1E4F14500], v0, "Error in logTransactionSuccessfulForResponseId (second attempt): %@", v1, v2, v3, v4, v5);
}

void __53__CKContextRequest_requestServiceSemaphoreWithReply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A45F4000, MEMORY[0x1E4F14500], v0, "Error retrieving service semaphore asynchronously: %@", v1, v2, v3, v4, v5);
}

void __43__CKContextRequest_requestServiceSemaphore__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A45F4000, MEMORY[0x1E4F14500], v0, "Error in requestSemaphore: %@", v1, v2, v3, v4, v5);
}

void __43__CKContextRequest_requestServiceSemaphore__block_invoke_163_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A45F4000, MEMORY[0x1E4F14500], v0, "Error in requestSemaphore (second attempt): %@", v1, v2, v3, v4, v5);
}

@end