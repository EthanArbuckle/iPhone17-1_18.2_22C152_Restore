@interface CSSearchQueryContext
+ (BOOL)supportsSecureCoding;
+ (id)pommesSupportedBundleIDs;
- (BOOL)advancedQuery;
- (BOOL)attribute;
- (BOOL)computePhotosDerivedAttributes;
- (BOOL)counting;
- (BOOL)disableBlockingOnIndex;
- (BOOL)disableMetadataSearch;
- (BOOL)disableNLP;
- (BOOL)disableResultStreaming;
- (BOOL)disableSafetyCheck;
- (BOOL)disableSemanticSearch;
- (BOOL)disableU2;
- (BOOL)enableInstantAnswers;
- (BOOL)enablePhotosEntitySearch;
- (BOOL)enableRecentSuggestions;
- (BOOL)enableResultCountsPerSuggestion;
- (BOOL)enableSuggestionTokens;
- (BOOL)fetchl2Signals;
- (BOOL)filterTopHits;
- (BOOL)fsOnly;
- (BOOL)generateSuggestions;
- (BOOL)grouped;
- (BOOL)hasFreeTextQuery;
- (BOOL)includeUserActivities;
- (BOOL)internal;
- (BOOL)isDateQueryContext;
- (BOOL)isFinder;
- (BOOL)isMail;
- (BOOL)isMessages;
- (BOOL)isNotes;
- (BOOL)isPhotos;
- (BOOL)isPommesCtl;
- (BOOL)isSafari;
- (BOOL)live;
- (BOOL)lowPriority;
- (BOOL)parseUserQuery;
- (BOOL)playback;
- (BOOL)pommes;
- (BOOL)pommesSuggestions;
- (BOOL)pommesZKW;
- (BOOL)priorityIndexQuery;
- (BOOL)privateQuery;
- (CSSearchQueryContext)init;
- (CSSearchQueryContext)initWithCoder:(id)a3;
- (CSSearchQueryContext)initWithQoS:(unsigned int)a3;
- (CSSearchQueryContext)initWithXPCDictionary:(id)a3;
- (CSSearchQuerySourceOptions)sourceOptions;
- (CSSuggestion)suggestion;
- (NSArray)additionalBundleIDs;
- (NSArray)additionalQueries;
- (NSArray)answerAttributes;
- (NSArray)bundleIDs;
- (NSArray)completionAttributes;
- (NSArray)completionWeights;
- (NSArray)disableBundles;
- (NSArray)fetchAttributes;
- (NSArray)filterQueries;
- (NSArray)groupingRules;
- (NSArray)instantAnswersBundleIDs;
- (NSArray)instantAnswersQueries;
- (NSArray)markedTextArray;
- (NSArray)mountPoints;
- (NSArray)preferredLanguages;
- (NSArray)protectionClasses;
- (NSArray)rankingQueries;
- (NSArray)resultMatchingAttributes;
- (NSArray)resultMatchingSceneIdentifiers;
- (NSArray)scopes;
- (NSAttributedString)attributedUserQuery;
- (NSData)queryEmbedding;
- (NSDictionary)options;
- (NSDictionary)queryUnderstandingOutput;
- (NSString)clientBundleID;
- (NSString)completionString;
- (NSString)filterQuery;
- (NSString)keyboardLanguage;
- (NSString)reason;
- (NSString)userQuery;
- (_MDQueryRewriteContext)rewriteContext;
- (__CFBitVector)nonTopHitFetchAttributeIndexesBits;
- (double)currentTime;
- (double)embeddingRelevanceThreshold;
- (double)maxAge;
- (double)minL2Score;
- (id)copyWithZone:(_NSZone *)a3;
- (id)customFieldSpecifications;
- (id)customResourceDirectory;
- (id)debugDescription;
- (id)description;
- (id)instantAnswersOverrideDate;
- (id)normalizedSearchQuery;
- (id)pommesEnabledBundleID;
- (id)xpc_dictionary;
- (int)entitledAttributes;
- (int)rankingType;
- (int64_t)completionResultCount;
- (int64_t)currentTokenScope;
- (int64_t)dominantRankingQueryCount;
- (int64_t)dominatedRankingQueryCount;
- (int64_t)embeddingGenerationTimeout;
- (int64_t)feedbackQueryID;
- (int64_t)highMatchBit;
- (int64_t)highRecencyBit;
- (int64_t)lowMatchBit;
- (int64_t)lowRecencyBit;
- (int64_t)maxCount;
- (int64_t)maxDenseResultCount;
- (int64_t)maxItemCount;
- (int64_t)maxRankedResultCount;
- (int64_t)maxSuggestionCount;
- (int64_t)minCount;
- (int64_t)queryID;
- (int64_t)shortcutBit;
- (int64_t)strongRankingQueryCount;
- (int64_t)topHitExtraFetchAttributeCount;
- (uint64_t)fuzzyMask;
- (uint64_t)fuzzyMatch;
- (unint64_t)maximumBatchSize;
- (unsigned)completionOptions;
- (unsigned)flags;
- (unsigned)qos;
- (unsigned)userQueryOptions;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAdditionalBundleIDs:(id)a3;
- (void)setAdditionalQueries:(id)a3;
- (void)setAdvancedQuery:(BOOL)a3;
- (void)setAnswerAttributes:(id)a3;
- (void)setAttribute:(BOOL)a3;
- (void)setAttributedUserQuery:(id)a3;
- (void)setBundleIDs:(id)a3;
- (void)setClientBundleID:(id)a3;
- (void)setCompletionAttributes:(id)a3;
- (void)setCompletionOptions:(unsigned int)a3;
- (void)setCompletionResultCount:(int64_t)a3;
- (void)setCompletionString:(id)a3;
- (void)setCompletionWeights:(id)a3;
- (void)setComputePhotosDerivedAttributes:(BOOL)a3;
- (void)setCounting:(BOOL)a3;
- (void)setCurrentTime:(double)a3;
- (void)setCurrentTokenScope:(int64_t)a3;
- (void)setCustomFieldSpecifications:(id)a3;
- (void)setCustomResourceDirectory:(id)a3;
- (void)setDisableBlockingOnIndex:(BOOL)a3;
- (void)setDisableBundles:(id)a3;
- (void)setDisableMetadataSearch:(BOOL)a3;
- (void)setDisableNLP:(BOOL)a3;
- (void)setDisableResultStreaming:(BOOL)a3;
- (void)setDisableSafetyCheck:(BOOL)a3;
- (void)setDisableSemanticSearch:(BOOL)a3;
- (void)setDisableU2:(BOOL)a3;
- (void)setDominantRankingQueryCount:(int64_t)a3;
- (void)setDominatedRankingQueryCount:(int64_t)a3;
- (void)setEmbeddingGenerationTimeout:(int64_t)a3;
- (void)setEmbeddingRelevanceThreshold:(double)a3;
- (void)setEnableInstantAnswers:(BOOL)a3;
- (void)setEnablePhotosEntitySearch:(BOOL)a3;
- (void)setEnableRecentSuggestions:(BOOL)a3;
- (void)setEnableResultCountsPerSuggestion:(BOOL)a3;
- (void)setEnableSuggestionTokens:(BOOL)a3;
- (void)setEntitledAttributes:(int)a3;
- (void)setFeedbackQueryID:(int64_t)a3;
- (void)setFetchAttributes:(NSArray *)fetchAttributes;
- (void)setFetchl2Signals:(BOOL)a3;
- (void)setFilterQueries:(NSArray *)filterQueries;
- (void)setFilterQuery:(id)a3;
- (void)setFilterTopHits:(BOOL)a3;
- (void)setFlags:(unsigned int)a3;
- (void)setFsOnly:(BOOL)a3;
- (void)setFuzzyMask:(CSSearchQueryContext *)self;
- (void)setFuzzyMatch:(CSSearchQueryContext *)self;
- (void)setGenerateSuggestions:(BOOL)a3;
- (void)setGrouped:(BOOL)a3;
- (void)setGroupingRules:(id)a3;
- (void)setHasFreeTextQuery:(BOOL)a3;
- (void)setHighMatchBit:(int64_t)a3;
- (void)setHighRecencyBit:(int64_t)a3;
- (void)setIncludeUserActivities:(BOOL)a3;
- (void)setInstantAnswersBundleIDs:(id)a3;
- (void)setInstantAnswersOverrideDate:(id)a3;
- (void)setInstantAnswersQueries:(id)a3;
- (void)setInternal:(BOOL)a3;
- (void)setIsDateQueryContext:(BOOL)a3;
- (void)setKeyboardLanguage:(NSString *)keyboardLanguage;
- (void)setLive:(BOOL)a3;
- (void)setLowMatchBit:(int64_t)a3;
- (void)setLowPriority:(BOOL)a3;
- (void)setLowRecencyBit:(int64_t)a3;
- (void)setMarkedTextArray:(id)a3;
- (void)setMaxAge:(double)a3;
- (void)setMaxCount:(int64_t)a3;
- (void)setMaxDenseResultCount:(int64_t)a3;
- (void)setMaxItemCount:(int64_t)a3;
- (void)setMaxRankedResultCount:(int64_t)a3;
- (void)setMaxSuggestionCount:(int64_t)a3;
- (void)setMaximumBatchSize:(unint64_t)a3;
- (void)setMinCount:(int64_t)a3;
- (void)setMinL2Score:(double)a3;
- (void)setMountPoints:(id)a3;
- (void)setNonTopHitFetchAttributeIndexesBits:(__CFBitVector *)a3;
- (void)setNormalizedSearchQuery:(id)a3;
- (void)setOptions:(id)a3;
- (void)setParseUserQuery:(BOOL)a3;
- (void)setPlayback:(BOOL)a3;
- (void)setPommes:(BOOL)a3;
- (void)setPommesSuggestions:(BOOL)a3;
- (void)setPommesZKW:(BOOL)a3;
- (void)setPreferredLanguages:(id)a3;
- (void)setPriorityIndexQuery:(BOOL)a3;
- (void)setPrivateQuery:(BOOL)a3;
- (void)setProtectionClasses:(id)a3;
- (void)setQos:(unsigned int)a3;
- (void)setQueryEmbedding:(id)a3;
- (void)setQueryID:(int64_t)a3;
- (void)setQueryUnderstandingOutput:(id)a3;
- (void)setRankingQueries:(id)a3;
- (void)setRankingType:(int)a3;
- (void)setReason:(id)a3;
- (void)setResultMatchingAttributes:(id)a3;
- (void)setResultMatchingSceneIdentifiers:(id)a3;
- (void)setRewriteContext:(id)a3;
- (void)setScopes:(id)a3;
- (void)setShortcutBit:(int64_t)a3;
- (void)setSourceOptions:(CSSearchQuerySourceOptions)sourceOptions;
- (void)setStrongRankingQueryCount:(int64_t)a3;
- (void)setSuggestion:(id)a3;
- (void)setTopHitExtraFetchAttributeCount:(int64_t)a3;
- (void)setUserQuery:(id)a3;
- (void)setUserQueryOptions:(unsigned int)a3;
- (void)xpc_dictionary;
@end

@implementation CSSearchQueryContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedUserQuery, 0);
  objc_storeStrong((id *)&self->_queryEmbedding, 0);
  objc_storeStrong((id *)&self->_queryUnderstandingOutput, 0);
  objc_storeStrong((id *)&self->_resultMatchingSceneIdentifiers, 0);
  objc_storeStrong((id *)&self->_protectionClasses, 0);
  objc_storeStrong((id *)&self->_filterQueries, 0);
  objc_storeStrong((id *)&self->_customResourceDirectory, 0);
  objc_storeStrong((id *)&self->_instantAnswersOverrideDate, 0);
  objc_storeStrong((id *)&self->_customFieldSpecifications, 0);
  objc_storeStrong((id *)&self->_rewriteContext, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_scopes, 0);
  objc_storeStrong((id *)&self->_mountPoints, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_completionWeights, 0);
  objc_storeStrong((id *)&self->_completionAttributes, 0);
  objc_storeStrong((id *)&self->_normalizedSearchQuery, 0);
  objc_storeStrong((id *)&self->_completionString, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
  objc_storeStrong((id *)&self->_resultMatchingAttributes, 0);
  objc_storeStrong((id *)&self->_userQuery, 0);
  objc_storeStrong((id *)&self->_keyboardLanguage, 0);
  objc_storeStrong((id *)&self->_filterQuery, 0);
  objc_storeStrong((id *)&self->_groupingRules, 0);
  objc_storeStrong((id *)&self->_disableBundles, 0);
  objc_storeStrong((id *)&self->_markedTextArray, 0);
  objc_storeStrong((id *)&self->_preferredLanguages, 0);
  objc_storeStrong((id *)&self->_instantAnswersQueries, 0);
  objc_storeStrong((id *)&self->_additionalQueries, 0);
  objc_storeStrong((id *)&self->_rankingQueries, 0);
  objc_storeStrong((id *)&self->_answerAttributes, 0);
  objc_storeStrong((id *)&self->_instantAnswersBundleIDs, 0);
  objc_storeStrong((id *)&self->_additionalBundleIDs, 0);
  objc_storeStrong((id *)&self->_bundleIDs, 0);
  objc_storeStrong((id *)&self->_clientBundleID, 0);

  objc_storeStrong((id *)&self->_fetchAttributes, 0);
}

- (BOOL)privateQuery
{
  return (BYTE2(self->_flags) >> 6) & 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setFlags:", -[CSSearchQueryContext flags](self, "flags"));
  v5 = [(CSSearchQueryContext *)self fetchAttributes];
  v6 = (void *)[v5 copy];
  [v4 setFetchAttributes:v6];

  v7 = [(CSSearchQueryContext *)self protectionClasses];
  v8 = (void *)[v7 copy];
  [v4 setProtectionClasses:v8];

  v9 = [(CSSearchQueryContext *)self keyboardLanguage];
  v10 = (void *)[v9 copy];
  [v4 setKeyboardLanguage:v10];

  v11 = [(CSSearchQueryContext *)self filterQueries];
  v12 = (void *)[v11 copy];
  [v4 setFilterQueries:v12];

  v13 = [(CSSearchQueryContext *)self clientBundleID];
  v14 = (void *)[v13 copy];
  [v4 setClientBundleID:v14];

  v15 = [(CSSearchQueryContext *)self bundleIDs];
  v16 = (void *)[v15 copy];
  [v4 setBundleIDs:v16];

  v17 = [(CSSearchQueryContext *)self additionalBundleIDs];
  v18 = (void *)[v17 copy];
  [v4 setAdditionalBundleIDs:v18];

  v19 = [(CSSearchQueryContext *)self instantAnswersBundleIDs];
  v20 = (void *)[v19 copy];
  [v4 setInstantAnswersBundleIDs:v20];

  v21 = [(CSSearchQueryContext *)self answerAttributes];
  v22 = (void *)[v21 copy];
  [v4 setAnswerAttributes:v22];

  v23 = [(CSSearchQueryContext *)self rankingQueries];
  v24 = (void *)[v23 copy];
  [v4 setRankingQueries:v24];

  v25 = [(CSSearchQueryContext *)self additionalQueries];
  v26 = (void *)[v25 copy];
  [v4 setAdditionalQueries:v26];

  v27 = [(CSSearchQueryContext *)self instantAnswersQueries];
  v28 = (void *)[v27 copy];
  [v4 setInstantAnswersQueries:v28];

  v29 = [(CSSearchQueryContext *)self preferredLanguages];
  v30 = (void *)[v29 copy];
  [v4 setPreferredLanguages:v30];

  v31 = [(CSSearchQueryContext *)self markedTextArray];
  v32 = (void *)[v31 copy];
  [v4 setMarkedTextArray:v32];

  v33 = [(CSSearchQueryContext *)self disableBundles];
  v34 = (void *)[v33 copy];
  [v4 setDisableBundles:v34];

  v35 = [(CSSearchQueryContext *)self userQuery];
  v36 = (void *)[v35 copy];
  [v4 setUserQuery:v36];

  v37 = [(CSSearchQueryContext *)self suggestion];
  v38 = (void *)[v37 copy];
  [v4 setSuggestion:v38];

  v39 = [(CSSearchQueryContext *)self groupingRules];
  v40 = (void *)[v39 copy];
  [v4 setGroupingRules:v40];

  objc_msgSend(v4, "setRankingType:", -[CSSearchQueryContext rankingType](self, "rankingType"));
  v41 = [(CSSearchQueryContext *)self filterQuery];
  v42 = (void *)[v41 copy];
  [v4 setFilterQuery:v42];

  objc_msgSend(v4, "setStrongRankingQueryCount:", -[CSSearchQueryContext strongRankingQueryCount](self, "strongRankingQueryCount"));
  objc_msgSend(v4, "setDominantRankingQueryCount:", -[CSSearchQueryContext dominantRankingQueryCount](self, "dominantRankingQueryCount"));
  objc_msgSend(v4, "setDominatedRankingQueryCount:", -[CSSearchQueryContext dominatedRankingQueryCount](self, "dominatedRankingQueryCount"));
  objc_msgSend(v4, "setShortcutBit:", -[CSSearchQueryContext shortcutBit](self, "shortcutBit"));
  objc_msgSend(v4, "setHighMatchBit:", -[CSSearchQueryContext highMatchBit](self, "highMatchBit"));
  objc_msgSend(v4, "setLowMatchBit:", -[CSSearchQueryContext lowMatchBit](self, "lowMatchBit"));
  objc_msgSend(v4, "setHighRecencyBit:", -[CSSearchQueryContext highRecencyBit](self, "highRecencyBit"));
  objc_msgSend(v4, "setLowRecencyBit:", -[CSSearchQueryContext lowRecencyBit](self, "lowRecencyBit"));
  objc_msgSend(v4, "setMaxCount:", -[CSSearchQueryContext maxCount](self, "maxCount"));
  objc_msgSend(v4, "setMinCount:", -[CSSearchQueryContext minCount](self, "minCount"));
  objc_msgSend(v4, "setMaxRankedResultCount:", -[CSSearchQueryContext maxRankedResultCount](self, "maxRankedResultCount"));
  objc_msgSend(v4, "setMaxSuggestionCount:", -[CSSearchQueryContext maxSuggestionCount](self, "maxSuggestionCount"));
  objc_msgSend(v4, "setQueryID:", -[CSSearchQueryContext queryID](self, "queryID"));
  [(CSSearchQueryContext *)self minL2Score];
  objc_msgSend(v4, "setMinL2Score:");
  [(CSSearchQueryContext *)self embeddingRelevanceThreshold];
  objc_msgSend(v4, "setEmbeddingRelevanceThreshold:");
  [(CSSearchQueryContext *)self maxAge];
  objc_msgSend(v4, "setMaxAge:");
  objc_msgSend(v4, "setEmbeddingGenerationTimeout:", -[CSSearchQueryContext embeddingGenerationTimeout](self, "embeddingGenerationTimeout"));
  objc_msgSend(v4, "setFsOnly:", -[CSSearchQueryContext fsOnly](self, "fsOnly"));
  objc_msgSend(v4, "setPlayback:", -[CSSearchQueryContext playback](self, "playback"));
  uint64_t v43 = [(CSSearchQueryContext *)self fuzzyMask];
  objc_msgSend(v4, "setFuzzyMask:", v43, v44);
  uint64_t v45 = [(CSSearchQueryContext *)self fuzzyMatch];
  objc_msgSend(v4, "setFuzzyMatch:", v45, v46);
  objc_msgSend(v4, "setUserQueryOptions:", -[CSSearchQueryContext userQueryOptions](self, "userQueryOptions"));
  objc_msgSend(v4, "setQos:", -[CSSearchQueryContext qos](self, "qos"));
  [(CSSearchQueryContext *)self currentTime];
  objc_msgSend(v4, "setCurrentTime:");
  v47 = [(CSSearchQueryContext *)self options];
  v48 = (void *)[v47 copy];
  [v4 setOptions:v48];

  v49 = [(CSSearchQueryContext *)self scopes];
  [v4 setScopes:v49];

  v50 = [(CSSearchQueryContext *)self mountPoints];
  [v4 setMountPoints:v50];

  objc_msgSend(v4, "setSourceOptions:", -[CSSearchQueryContext sourceOptions](self, "sourceOptions"));
  v51 = [(CSSearchQueryContext *)self reason];
  [v4 setReason:v51];

  v52 = [(CSSearchQueryContext *)self rewriteContext];
  [v4 setRewriteContext:v52];

  objc_msgSend(v4, "setEnableSuggestionTokens:", -[CSSearchQueryContext enableSuggestionTokens](self, "enableSuggestionTokens"));
  objc_msgSend(v4, "setEnableRecentSuggestions:", -[CSSearchQueryContext enableRecentSuggestions](self, "enableRecentSuggestions"));
  objc_msgSend(v4, "setEnableResultCountsPerSuggestion:", -[CSSearchQueryContext enableResultCountsPerSuggestion](self, "enableResultCountsPerSuggestion"));
  objc_msgSend(v4, "setCurrentTokenScope:", -[CSSearchQueryContext currentTokenScope](self, "currentTokenScope"));
  if (self->_completionResultCount
    && [(NSString *)self->_completionString length]
    && [(NSArray *)self->_completionAttributes count])
  {
    [v4 setCompletionOptions:self->_completionOptions];
    [v4 setCompletionResultCount:self->_completionResultCount];
    [v4 setCompletionString:self->_completionString];
    [v4 setCompletionAttributes:self->_completionAttributes];
    [v4 setCompletionWeights:self->_completionWeights];
  }
  objc_msgSend(v4, "setEntitledAttributes:", -[CSSearchQueryContext entitledAttributes](self, "entitledAttributes"));
  v53 = [(CSSearchQueryContext *)self rewriteContext];
  [v4 setRewriteContext:v53];

  v54 = [(CSSearchQueryContext *)self customFieldSpecifications];
  [v4 setCustomFieldSpecifications:v54];

  v55 = [(CSSearchQueryContext *)self instantAnswersOverrideDate];
  [v4 setInstantAnswersOverrideDate:v55];

  v56 = [(CSSearchQueryContext *)self customResourceDirectory];
  v57 = (void *)[v56 copy];
  [v4 setCustomResourceDirectory:v57];

  v58 = [(CSSearchQueryContext *)self resultMatchingAttributes];
  [v4 setResultMatchingAttributes:v58];

  v59 = [(CSSearchQueryContext *)self queryUnderstandingOutput];
  [v4 setQueryUnderstandingOutput:v59];

  v60 = [(CSSearchQueryContext *)self queryEmbedding];
  [v4 setQueryEmbedding:v60];

  objc_msgSend(v4, "setMaximumBatchSize:", -[CSSearchQueryContext maximumBatchSize](self, "maximumBatchSize"));
  objc_msgSend(v4, "setPriorityIndexQuery:", -[CSSearchQueryContext priorityIndexQuery](self, "priorityIndexQuery"));
  objc_msgSend(v4, "setDisableResultStreaming:", -[CSSearchQueryContext disableResultStreaming](self, "disableResultStreaming"));
  objc_msgSend(v4, "setFeedbackQueryID:", -[CSSearchQueryContext feedbackQueryID](self, "feedbackQueryID"));
  objc_msgSend(v4, "setAdvancedQuery:", -[CSSearchQueryContext advancedQuery](self, "advancedQuery"));
  objc_msgSend(v4, "setHasFreeTextQuery:", -[CSSearchQueryContext hasFreeTextQuery](self, "hasFreeTextQuery"));
  v61 = [(CSSearchQueryContext *)self attributedUserQuery];
  v62 = (void *)[v61 copy];
  [v4 setAttributedUserQuery:v62];

  objc_msgSend(v4, "setComputePhotosDerivedAttributes:", -[CSSearchQueryContext computePhotosDerivedAttributes](self, "computePhotosDerivedAttributes"));
  return v4;
}

- (NSString)clientBundleID
{
  return self->_clientBundleID;
}

- (NSArray)bundleIDs
{
  return self->_bundleIDs;
}

- (int64_t)queryID
{
  return self->_queryID;
}

- (void)setFetchAttributes:(NSArray *)fetchAttributes
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CAA0];
  v5 = fetchAttributes;
  id v8 = (id)[[v4 alloc] initWithArray:v5];

  v6 = [v8 array];
  v7 = self->_fetchAttributes;
  self->_fetchAttributes = v6;
}

- (unint64_t)maximumBatchSize
{
  return self->_maximumBatchSize;
}

- (int)rankingType
{
  return self->_rankingType;
}

- (_MDQueryRewriteContext)rewriteContext
{
  return self->_rewriteContext;
}

- (NSArray)scopes
{
  return self->_scopes;
}

- (NSArray)mountPoints
{
  return self->_mountPoints;
}

- (NSString)userQuery
{
  return self->_userQuery;
}

- (NSArray)instantAnswersBundleIDs
{
  return self->_instantAnswersBundleIDs;
}

- (NSArray)additionalBundleIDs
{
  return self->_additionalBundleIDs;
}

- (BOOL)disableResultStreaming
{
  return self->_disableResultStreaming;
}

- (void)setProtectionClasses:(id)a3
{
}

- (void)setRewriteContext:(id)a3
{
}

- (void)setMinL2Score:(double)a3
{
  self->_minL2Score = a3;
}

- (void)setMaxAge:(double)a3
{
  self->_maxAge = a3;
}

- (void)setCurrentTime:(double)a3
{
  self->_currentTime = a3;
}

- (unsigned)flags
{
  return self->_flags;
}

- (NSArray)protectionClasses
{
  return self->_protectionClasses;
}

- (void)setClientBundleID:(id)a3
{
}

- (NSString)reason
{
  return self->_reason;
}

- (BOOL)priorityIndexQuery
{
  return self->_priorityIndexQuery;
}

- (void)setReason:(id)a3
{
}

- (NSArray)disableBundles
{
  return self->_disableBundles;
}

- (NSArray)filterQueries
{
  return self->_filterQueries;
}

- (int64_t)strongRankingQueryCount
{
  return self->_strongRankingQueryCount;
}

- (int64_t)shortcutBit
{
  return self->_shortcutBit;
}

- (NSArray)resultMatchingAttributes
{
  return self->_resultMatchingAttributes;
}

- (NSArray)rankingQueries
{
  return self->_rankingQueries;
}

- (NSDictionary)queryUnderstandingOutput
{
  return self->_queryUnderstandingOutput;
}

- (NSData)queryEmbedding
{
  return self->_queryEmbedding;
}

- (NSArray)preferredLanguages
{
  return self->_preferredLanguages;
}

- (int64_t)maxRankedResultCount
{
  return self->_maxRankedResultCount;
}

- (int64_t)maxCount
{
  return self->_maxCount;
}

- (int64_t)lowRecencyBit
{
  return self->_lowRecencyBit;
}

- (int64_t)lowMatchBit
{
  return self->_lowMatchBit;
}

- (NSArray)instantAnswersQueries
{
  return self->_instantAnswersQueries;
}

- (int64_t)highRecencyBit
{
  return self->_highRecencyBit;
}

- (int64_t)highMatchBit
{
  return self->_highMatchBit;
}

- (NSArray)groupingRules
{
  return self->_groupingRules;
}

- (uint64_t)fuzzyMatch
{
  return *(void *)(a1 + 368);
}

- (uint64_t)fuzzyMask
{
  return *(void *)(a1 + 352);
}

- (NSString)filterQuery
{
  return self->_filterQuery;
}

- (int)entitledAttributes
{
  return self->_entitledAttributes;
}

- (int64_t)dominatedRankingQueryCount
{
  return self->_dominatedRankingQueryCount;
}

- (int64_t)dominantRankingQueryCount
{
  return self->_dominantRankingQueryCount;
}

- (double)currentTime
{
  return self->_currentTime;
}

- (NSAttributedString)attributedUserQuery
{
  return self->_attributedUserQuery;
}

- (NSArray)additionalQueries
{
  return self->_additionalQueries;
}

- (void)setQueryID:(int64_t)a3
{
  self->_queryID = a3;
}

- (void)setInstantAnswersOverrideDate:(id)a3
{
}

- (id)instantAnswersOverrideDate
{
  return self->_instantAnswersOverrideDate;
}

- (void)setEntitledAttributes:(int)a3
{
  self->_entitledAttributes = a3;
}

- (BOOL)playback
{
  return BYTE1(self->_flags) & 1;
}

- (void)setQos:(unsigned int)a3
{
  self->_qos = a3;
}

- (void)setBundleIDs:(id)a3
{
}

- (CSSearchQueryContext)init
{
  v6.receiver = self;
  v6.super_class = (Class)CSSearchQueryContext;
  v2 = [(CSSearchQueryContext *)&v6 init];
  v3 = v2;
  if (v2)
  {
    protectionClasses = v2->_protectionClasses;
    v2->_protectionClasses = (NSArray *)MEMORY[0x1E4F1CBF0];

    v3->_currentTime = CFAbsoluteTimeGetCurrent();
    v3->_minL2Score = -1.79769313e308;
    *(_WORD *)&v3->_enableSuggestionTokens = 0;
    v3->_enableResultCountsPerSuggestion = 0;
    v3->_maximumBatchSize = 0;
    v3->_feedbackQueryID = -2147483647;
    v3->_currentTokenScope = -1;
  }
  [(CSSearchQueryContext *)v3 setFilterTopHits:1];
  return v3;
}

- (void)setFilterTopHits:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_flags = self->_flags & 0xFFDFFFFF | v3;
}

- (void)setDisableBundles:(id)a3
{
}

- (void)setMaximumBatchSize:(unint64_t)a3
{
  self->_maximumBatchSize = a3;
}

- (void)setFilterQueries:(NSArray *)filterQueries
{
}

- (void)setMaxCount:(int64_t)a3
{
  self->_maxCount = a3;
}

- (CSSearchQuerySourceOptions)sourceOptions
{
  return self->_sourceOptions;
}

- (void)setDisableResultStreaming:(BOOL)a3
{
  self->_disableResultStreaming = a3;
}

- (unsigned)userQueryOptions
{
  return self->_userQueryOptions;
}

- (CSSuggestion)suggestion
{
  return self->_suggestion;
}

- (void)setUserQueryOptions:(unsigned int)a3
{
  self->_userQueryOptions = a3;
}

- (void)setUserQuery:(id)a3
{
}

- (void)setSuggestion:(id)a3
{
}

- (void)setStrongRankingQueryCount:(int64_t)a3
{
  self->_strongRankingQueryCount = a3;
}

- (void)setSourceOptions:(CSSearchQuerySourceOptions)sourceOptions
{
  self->_sourceOptions = sourceOptions;
}

- (void)setShortcutBit:(int64_t)a3
{
  self->_shortcutBit = a3;
}

- (void)setScopes:(id)a3
{
}

- (void)setResultMatchingAttributes:(id)a3
{
}

- (void)setRankingType:(int)a3
{
  self->_rankingType = a3;
}

- (void)setRankingQueries:(id)a3
{
}

- (void)setQueryUnderstandingOutput:(id)a3
{
}

- (void)setQueryEmbedding:(id)a3
{
}

- (void)setPriorityIndexQuery:(BOOL)a3
{
  self->_priorityIndexQuery = a3;
}

- (void)setPreferredLanguages:(id)a3
{
}

- (void)setPlayback:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_flags = self->_flags & 0xFFFFFEFF | v3;
}

- (void)setOptions:(id)a3
{
  id v32 = a3;
  if ([v32 count])
  {
    id v4 = [v32 objectForKeyedSubscript:@"MDSearchQueryOptionFetchAttributes"];
    if (v4
      || ([v32 objectForKeyedSubscript:@"SPQueryOptionFetchAttributes"],
          (id v4 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      [(CSSearchQueryContext *)self setFetchAttributes:v4];
    }
    v5 = [v32 objectForKeyedSubscript:@"MDSearchQueryOptionRankingQueries"];
    if (v5
      || ([v32 objectForKeyedSubscript:@"SPQueryOptionRankingQueries"],
          (v5 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      [(CSSearchQueryContext *)self setRankingQueries:v5];
    }
    objc_super v6 = [v32 objectForKeyedSubscript:@"MDSearchQueryOptionMaxCount"];
    v7 = v6;
    if (v6) {
      -[CSSearchQueryContext setMaxCount:](self, "setMaxCount:", [v6 integerValue]);
    }
    id v8 = [v32 objectForKeyedSubscript:@"SPQueryGroupingRules"];

    if (v8) {
      [(CSSearchQueryContext *)self setGroupingRules:v8];
    }
    v9 = [v32 objectForKeyedSubscript:@"SPQueryOptionMinL2Score"];

    if (v9)
    {
      [v9 doubleValue];
      -[CSSearchQueryContext setMinL2Score:](self, "setMinL2Score:");
    }
    v10 = [v32 objectForKeyedSubscript:@"SPQueryOptionMaxAge"];

    if (v10)
    {
      [v10 floatValue];
      [(CSSearchQueryContext *)self setMaxAge:v11];
    }
    v12 = [v32 objectForKeyedSubscript:@"SPQueryOptionMinCount"];

    if (v12) {
      -[CSSearchQueryContext setMinCount:](self, "setMinCount:", [v12 integerValue]);
    }
    v13 = [v32 objectForKeyedSubscript:@"MDSearchQueryOptionGrouped"];

    if (v13) {
      -[CSSearchQueryContext setGrouped:](self, "setGrouped:", [v13 BOOLValue]);
    }
    v14 = [v32 objectForKeyedSubscript:@"SPQueryOptionProtectionClasses"];

    if (v14) {
      [(CSSearchQueryContext *)self setProtectionClasses:v14];
    }
    v15 = [v32 objectForKeyedSubscript:@"SPQueryOptionStrongRankingQueryCount"];

    if (v15) {
      -[CSSearchQueryContext setStrongRankingQueryCount:](self, "setStrongRankingQueryCount:", [v15 integerValue]);
    }
    v16 = [v32 objectForKeyedSubscript:@"SPQueryOptionDominantRankingQueryCount"];

    if (v16) {
      -[CSSearchQueryContext setDominantRankingQueryCount:](self, "setDominantRankingQueryCount:", [v16 integerValue]);
    }
    v17 = [v32 objectForKeyedSubscript:@"SPQueryOptionDominatedRankingQueryCount"];

    if (v17) {
      -[CSSearchQueryContext setDominatedRankingQueryCount:](self, "setDominatedRankingQueryCount:", [v17 integerValue]);
    }
    v18 = [v32 objectForKeyedSubscript:@"SPQueryOptionShortcutBit"];

    if (v18) {
      -[CSSearchQueryContext setShortcutBit:](self, "setShortcutBit:", [v18 integerValue]);
    }
    v19 = [v32 objectForKeyedSubscript:@"SPQueryOptionHighMatchBit"];

    if (v19) {
      -[CSSearchQueryContext setHighMatchBit:](self, "setHighMatchBit:", [v19 integerValue]);
    }
    v20 = [v32 objectForKeyedSubscript:@"SPQueryOptionLowMatchBit"];

    if (v20) {
      -[CSSearchQueryContext setLowMatchBit:](self, "setLowMatchBit:", [v20 integerValue]);
    }
    v21 = [v32 objectForKeyedSubscript:@"SPQueryOptionHighRecencyBit"];

    if (v21) {
      -[CSSearchQueryContext setHighRecencyBit:](self, "setHighRecencyBit:", [v21 integerValue]);
    }
    v22 = [v32 objectForKeyedSubscript:@"SPQueryOptionLowRecencyBit"];

    if (v22) {
      -[CSSearchQueryContext setLowRecencyBit:](self, "setLowRecencyBit:", [v22 integerValue]);
    }
    v23 = [v32 objectForKeyedSubscript:@"SPQueryOptionPreferredLanguages"];

    if (v23) {
      [(CSSearchQueryContext *)self setPreferredLanguages:v23];
    }
    v24 = [v32 objectForKeyedSubscript:@"SPQueryOptionFilterQueries"];

    if (v24) {
      [(CSSearchQueryContext *)self setFilterQueries:v24];
    }
    v25 = [v32 objectForKeyedSubscript:@"SPQueryOptionFilterQuery"];

    if (v25) {
      [(CSSearchQueryContext *)self setFilterQuery:v25];
    }
    v26 = [v32 objectForKeyedSubscript:@"SPQueryOptionDisableBundles"];

    if (v26) {
      [(CSSearchQueryContext *)self setDisableBundles:v26];
    }
    v27 = [v32 objectForKeyedSubscript:@"SPQueryOptionCurrentTime"];

    if (v27)
    {
      [v27 doubleValue];
      -[CSSearchQueryContext setCurrentTime:](self, "setCurrentTime:");
    }
    v28 = [v32 objectForKeyedSubscript:@"SPQueryOptionScopes"];

    if (v28) {
      [(CSSearchQueryContext *)self setScopes:v28];
    }
    v29 = [v32 objectForKeyedSubscript:@"customResourceDirectory"];

    if (v29) {
      [(CSSearchQueryContext *)self setCustomResourceDirectory:v29];
    }
    v30 = [v32 objectForKeyedSubscript:@"SPQueryResultMatchingAttributes"];

    if (v30) {
      [(CSSearchQueryContext *)self setResultMatchingAttributes:v30];
    }
    v31 = [v32 objectForKeyedSubscript:@"SPQueryComputePhotosDerivedAttributes"];

    if (v31) {
      -[CSSearchQueryContext setComputePhotosDerivedAttributes:](self, "setComputePhotosDerivedAttributes:", [v31 BOOLValue]);
    }
  }

  MEMORY[0x1F41817F8]();
}

- (void)setMountPoints:(id)a3
{
}

- (void)setMinCount:(int64_t)a3
{
  self->_minCount = a3;
}

- (void)setMaxSuggestionCount:(int64_t)a3
{
  self->_maxSuggestionCount = a3;
}

- (void)setMaxRankedResultCount:(int64_t)a3
{
  self->_maxRankedResultCount = a3;
}

- (void)setMarkedTextArray:(id)a3
{
}

- (void)setLowRecencyBit:(int64_t)a3
{
  self->_lowRecencyBit = a3;
}

- (void)setLowMatchBit:(int64_t)a3
{
  self->_lowMatchBit = a3;
}

- (void)setKeyboardLanguage:(NSString *)keyboardLanguage
{
}

- (void)setInstantAnswersQueries:(id)a3
{
}

- (void)setInstantAnswersBundleIDs:(id)a3
{
}

- (void)setHighRecencyBit:(int64_t)a3
{
  self->_highRecencyBit = a3;
}

- (void)setHighMatchBit:(int64_t)a3
{
  self->_highMatchBit = a3;
}

- (void)setHasFreeTextQuery:(BOOL)a3
{
  self->_hasFreeTextQuery = a3;
}

- (void)setGroupingRules:(id)a3
{
}

- (void)setFuzzyMatch:(CSSearchQueryContext *)self
{
  *(void *)self->_fuzzyMatch = v2;
  *(void *)&self->_fuzzyMatch[8] = v3;
}

- (void)setFuzzyMask:(CSSearchQueryContext *)self
{
  *(void *)self->_fuzzyMask = v2;
  *(void *)&self->_fuzzyMask[8] = v3;
}

- (void)setFsOnly:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_flags = self->_flags & 0xFFFFFF7F | v3;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- (void)setFilterQuery:(id)a3
{
}

- (void)setFeedbackQueryID:(int64_t)a3
{
  self->_feedbackQueryID = a3;
}

- (void)setEnableSuggestionTokens:(BOOL)a3
{
  self->_enableSuggestionTokens = a3;
}

- (void)setEnableResultCountsPerSuggestion:(BOOL)a3
{
  self->_enableResultCountsPerSuggestion = a3;
}

- (void)setEnableRecentSuggestions:(BOOL)a3
{
  self->_enableRecentSuggestions = a3;
}

- (void)setEmbeddingRelevanceThreshold:(double)a3
{
  self->_embeddingRelevanceThreshold = a3;
}

- (void)setEmbeddingGenerationTimeout:(int64_t)a3
{
  self->_embeddingGenerationTimeout = a3;
}

- (void)setDominatedRankingQueryCount:(int64_t)a3
{
  self->_dominatedRankingQueryCount = a3;
}

- (void)setDominantRankingQueryCount:(int64_t)a3
{
  self->_dominantRankingQueryCount = a3;
}

- (void)setCustomResourceDirectory:(id)a3
{
}

- (void)setCustomFieldSpecifications:(id)a3
{
}

- (void)setCurrentTokenScope:(int64_t)a3
{
  self->_currentTokenScope = a3;
}

- (void)setComputePhotosDerivedAttributes:(BOOL)a3
{
  self->_computePhotosDerivedAttributes = a3;
}

- (void)setAttributedUserQuery:(id)a3
{
}

- (void)setAnswerAttributes:(id)a3
{
}

- (void)setAdvancedQuery:(BOOL)a3
{
  self->_advancedQuery = a3;
}

- (void)setAdditionalQueries:(id)a3
{
}

- (void)setAdditionalBundleIDs:(id)a3
{
}

- (double)minL2Score
{
  return self->_minL2Score;
}

- (int64_t)minCount
{
  return self->_minCount;
}

- (int64_t)maxSuggestionCount
{
  return self->_maxSuggestionCount;
}

- (double)maxAge
{
  return self->_maxAge;
}

- (NSArray)markedTextArray
{
  return self->_markedTextArray;
}

- (NSString)keyboardLanguage
{
  return self->_keyboardLanguage;
}

- (BOOL)hasFreeTextQuery
{
  return self->_hasFreeTextQuery;
}

- (BOOL)fsOnly
{
  return LOBYTE(self->_flags) >> 7;
}

- (int64_t)feedbackQueryID
{
  return self->_feedbackQueryID;
}

- (BOOL)enableSuggestionTokens
{
  return self->_enableSuggestionTokens;
}

- (BOOL)enableResultCountsPerSuggestion
{
  return self->_enableResultCountsPerSuggestion;
}

- (BOOL)enableRecentSuggestions
{
  return self->_enableRecentSuggestions;
}

- (double)embeddingRelevanceThreshold
{
  return self->_embeddingRelevanceThreshold;
}

- (int64_t)embeddingGenerationTimeout
{
  return self->_embeddingGenerationTimeout;
}

- (id)customResourceDirectory
{
  return self->_customResourceDirectory;
}

- (id)customFieldSpecifications
{
  return self->_customFieldSpecifications;
}

- (int64_t)currentTokenScope
{
  return self->_currentTokenScope;
}

- (NSArray)answerAttributes
{
  return self->_answerAttributes;
}

- (BOOL)advancedQuery
{
  return self->_advancedQuery;
}

- (BOOL)live
{
  return (LOBYTE(self->_flags) >> 2) & 1;
}

- (unsigned)qos
{
  return self->_qos;
}

- (BOOL)counting
{
  return (LOBYTE(self->_flags) >> 3) & 1;
}

- (BOOL)attribute
{
  return (LOBYTE(self->_flags) >> 4) & 1;
}

- (BOOL)lowPriority
{
  return (LOBYTE(self->_flags) >> 5) & 1;
}

- (BOOL)pommes
{
  return (BYTE1(self->_flags) >> 4) & 1;
}

- (__CFBitVector)nonTopHitFetchAttributeIndexesBits
{
  return self->_nonTopHitFetchAttributeIndexesBits;
}

- (NSString)completionString
{
  return self->_completionString;
}

- (int64_t)completionResultCount
{
  return self->_completionResultCount;
}

- (unsigned)completionOptions
{
  return self->_completionOptions;
}

- (BOOL)disableBlockingOnIndex
{
  return (BYTE1(self->_flags) >> 2) & 1;
}

- (BOOL)includeUserActivities
{
  return (BYTE1(self->_flags) >> 1) & 1;
}

- (CSSearchQueryContext)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  v104.receiver = self;
  v104.super_class = (Class)CSSearchQueryContext;
  v5 = [(CSSearchQueryContext *)&v104 init];
  if (v5)
  {
    objc_super v6 = +[CSXPCConnection copyNSStringForKey:"cbi" fromXPCDictionary:v4];
    clientBundleID = v5->_clientBundleID;
    v5->_clientBundleID = v6;

    id v8 = xpc_dictionary_get_value(v4, "fa");
    v9 = +[CSXPCConnection copyNSStringArrayFromXPCArray:v8];
    fetchAttributes = v5->_fetchAttributes;
    v5->_fetchAttributes = v9;

    size_t length = 0;
    data = (const UInt8 *)xpc_dictionary_get_data(v4, "tpefa", &length);
    int64_t int64 = xpc_dictionary_get_int64(v4, "ctpefa");
    if (data && int64) {
      v5->_nonTopHitFetchAttributeIndexesBits = CFBitVectorCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], data, int64);
    }
    v13 = xpc_dictionary_get_value(v4, "pcs");
    v14 = +[CSXPCConnection copyNSStringArrayFromXPCArray:v13];
    protectionClasses = v5->_protectionClasses;
    v5->_protectionClasses = v14;

    v16 = xpc_dictionary_get_value(v4, "bi");
    v17 = +[CSXPCConnection copyNSStringArrayFromXPCArray:v16];
    bundleIDs = v5->_bundleIDs;
    v5->_bundleIDs = v17;

    v19 = xpc_dictionary_get_value(v4, "abi");
    v20 = +[CSXPCConnection copyNSStringArrayFromXPCArray:v19];
    additionalBundleIDs = v5->_additionalBundleIDs;
    v5->_additionalBundleIDs = v20;

    v22 = xpc_dictionary_get_value(v4, "iab");
    v23 = +[CSXPCConnection copyNSStringArrayFromXPCArray:v22];
    instantAnswersBundleIDs = v5->_instantAnswersBundleIDs;
    v5->_instantAnswersBundleIDs = v23;

    v25 = xpc_dictionary_get_value(v4, "aai");
    v26 = +[CSXPCConnection copyNSStringArrayFromXPCArray:v25];
    answerAttributes = v5->_answerAttributes;
    v5->_answerAttributes = v26;

    v28 = xpc_dictionary_get_value(v4, "rq");
    v29 = +[CSXPCConnection copyNSStringOrDictArrayFromXPCArray:v28];
    rankingQueries = v5->_rankingQueries;
    v5->_rankingQueries = v29;

    v31 = xpc_dictionary_get_value(v4, "aq");
    id v32 = +[CSXPCConnection copyNSStringOrDictArrayFromXPCArray:v31];
    additionalQueries = v5->_additionalQueries;
    v5->_additionalQueries = v32;

    v34 = xpc_dictionary_get_value(v4, "iaq");
    v35 = +[CSXPCConnection copyNSStringOrDictArrayFromXPCArray:v34];
    instantAnswersQueries = v5->_instantAnswersQueries;
    v5->_instantAnswersQueries = v35;

    v37 = xpc_dictionary_get_value(v4, "pl");
    v38 = +[CSXPCConnection copyNSStringArrayFromXPCArray:v37];
    preferredLanguages = v5->_preferredLanguages;
    v5->_preferredLanguages = v38;

    v40 = xpc_dictionary_get_value(v4, "mt");
    v41 = +[CSXPCConnection copyNSStringArrayFromXPCArray:v40];
    markedTextArray = v5->_markedTextArray;
    v5->_markedTextArray = v41;

    uint64_t v43 = xpc_dictionary_get_value(v4, "db");
    uint64_t v44 = +[CSXPCConnection copyNSStringArrayFromXPCArray:v43];
    disableBundles = v5->_disableBundles;
    v5->_disableBundles = v44;

    uint64_t v46 = xpc_dictionary_get_value(v4, "gr");
    v47 = +[CSXPCConnection copyNSStringArrayFromXPCArray:v46];
    groupingRules = v5->_groupingRules;
    v5->_groupingRules = v47;

    v49 = +[CSXPCConnection copyNSStringForKey:"uq" fromXPCDictionary:v4];
    userQuery = v5->_userQuery;
    v5->_userQuery = v49;

    uint64_t int64 = xpc_dictionary_get_uint64(v4, "rt");
    v5->_rankingType = uint64;
    if (uint64 == 1)
    {
      v52 = logForCSLogCategoryQuery();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG)) {
        -[CSSearchQueryContext initWithXPCDictionary:]();
      }
    }
    v53 = +[CSXPCConnection copyNSStringForKey:"fq" fromXPCDictionary:v4];
    filterQuery = v5->_filterQuery;
    v5->_filterQuery = v53;

    v55 = xpc_dictionary_get_value(v4, "fqs");
    v56 = +[CSXPCConnection copyNSStringArrayFromXPCArray:v55];
    filterQueries = v5->_filterQueries;
    v5->_filterQueries = v56;

    v58 = +[CSXPCConnection copyNSStringForKey:"kl" fromXPCDictionary:v4];
    keyboardLanguage = v5->_keyboardLanguage;
    v5->_keyboardLanguage = v58;

    v5->_computePhotosDerivedAttributes = xpc_dictionary_get_BOOL(v4, "qdrvp");
    v5->_strongRankingQueryCount = xpc_dictionary_get_uint64(v4, "src");
    v5->_dominantRankingQueryCount = xpc_dictionary_get_uint64(v4, "drc");
    v5->_dominatedRankingQueryCount = xpc_dictionary_get_uint64(v4, "ddrc");
    v5->_shortcutBit = xpc_dictionary_get_uint64(v4, "sb");
    v5->_highMatchBit = xpc_dictionary_get_uint64(v4, "hmb");
    v5->_lowMatchBit = xpc_dictionary_get_uint64(v4, "lmb");
    v5->_highRecencyBit = xpc_dictionary_get_uint64(v4, "hrb");
    v5->_lowRecencyBit = xpc_dictionary_get_uint64(v4, "lrb");
    v5->_maxCount = xpc_dictionary_get_uint64(v4, "mxc");
    v5->_minCount = xpc_dictionary_get_uint64(v4, "mnc");
    v5->_maxRankedResultCount = xpc_dictionary_get_uint64(v4, "mrc");
    v5->_minL2Score = xpc_dictionary_get_double(v4, "ml2");
    v5->_maxAge = xpc_dictionary_get_double(v4, "mage");
    v5->_queryID = xpc_dictionary_get_uint64(v4, "qi");
    v5->_flags = xpc_dictionary_get_uint64(v4, "f");
    v5->_currentTime = xpc_dictionary_get_double(v4, "ct");
    v5->_qos = xpc_dictionary_get_uint64(v4, "qos");
    v5->_userQueryOptions = xpc_dictionary_get_uint64(v4, "uqo");
    v5->_sourceOptions = xpc_dictionary_get_uint64(v4, "so");
    v5->_maximumBatchSize = xpc_dictionary_get_uint64(v4, "batsz");
    v5->_priorityIndexQuery = xpc_dictionary_get_BOOL(v4, "piq");
    v5->_disableResultStreaming = xpc_dictionary_get_BOOL(v4, "qsd");
    v5->_advancedQuery = xpc_dictionary_get_BOOL(v4, "adv");
    v5->_hasFreeTextQuery = xpc_dictionary_get_BOOL(v4, "frex");
    uint64_t v60 = xpc_dictionary_get_uint64(v4, "cc");
    v5->_completionResultCount = v60;
    if (v60)
    {
      v61 = xpc_dictionary_get_value(v4, "ca");
      v62 = +[CSXPCConnection copyNSStringArrayFromXPCArray:v61];
      completionAttributes = v5->_completionAttributes;
      v5->_completionAttributes = v62;

      v64 = xpc_dictionary_get_value(v4, "cw");
      v65 = +[CSXPCConnection copyNSNumberArrayFromXPCArray:v64];
      completionWeights = v5->_completionWeights;
      v5->_completionWeights = v65;

      v67 = +[CSXPCConnection copyNSStringForKey:"cs" fromXPCDictionary:v4];
      completionString = v5->_completionString;
      v5->_completionString = v67;

      v5->_completionOptions = xpc_dictionary_get_uint64(v4, "co");
    }
    v69 = xpc_dictionary_get_value(v4, "sp");
    v70 = +[CSXPCConnection copyNSStringArrayFromXPCArray:v69];
    scopes = v5->_scopes;
    v5->_scopes = v70;

    v72 = xpc_dictionary_get_value(v4, "mp");
    v73 = +[CSXPCConnection copyNSStringArrayFromXPCArray:v72];
    mountPoints = v5->_mountPoints;
    v5->_mountPoints = v73;

    int64_t date = xpc_dictionary_get_date(v4, "ovda");
    if (date)
    {
      uint64_t v76 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)date];
      instantAnswersOverrideDate = v5->_instantAnswersOverrideDate;
      v5->_instantAnswersOverrideDate = (NSDate *)v76;
    }
    v78 = +[CSXPCConnection copyNSStringForKey:"crd" fromXPCDictionary:v4];
    customResourceDirectory = v5->_customResourceDirectory;
    v5->_customResourceDirectory = v78;

    id v80 = +[CSXPCConnection copyNSDataForKey:"pes" fromXPCDictionary:v4];
    if (v80)
    {
      uint64_t v81 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v80 error:0];
      attributedUserQuery = v5->_attributedUserQuery;
      v5->_attributedUserQuery = (NSAttributedString *)v81;
    }
    v83 = xpc_dictionary_get_value(v4, "rma");
    v84 = +[CSXPCConnection copyNSStringArrayFromXPCArray:v83];
    resultMatchingAttributes = v5->_resultMatchingAttributes;
    v5->_resultMatchingAttributes = v84;

    id v86 = +[CSXPCConnection copyNSDataForKey:"qu" fromXPCDictionary:v4];
    if (v86)
    {
      v101 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v87 = objc_opt_class();
      uint64_t v88 = objc_opt_class();
      uint64_t v89 = objc_opt_class();
      uint64_t v90 = objc_opt_class();
      uint64_t v91 = objc_opt_class();
      uint64_t v92 = objc_opt_class();
      v93 = objc_msgSend(v101, "setWithObjects:", v87, v88, v89, v90, v91, v92, objc_opt_class(), 0);
      id v102 = 0;
      uint64_t v94 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v93 fromData:v86 error:&v102];
      id v95 = v102;
      queryUnderstandingOutput = v5->_queryUnderstandingOutput;
      v5->_queryUnderstandingOutput = (NSDictionary *)v94;

      if (v95)
      {
        v97 = logForCSLogCategoryQuery();
        if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR)) {
          -[CSSearchQueryContext initWithXPCDictionary:]();
        }
      }
    }
    v98 = +[CSXPCConnection copyNSDataForKey:"qemb" fromXPCDictionary:v4];
    queryEmbedding = v5->_queryEmbedding;
    v5->_queryEmbedding = v98;
  }
  return v5;
}

- (NSDictionary)options
{
  int v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  fetchAttributes = self->_fetchAttributes;
  if (fetchAttributes)
  {
    [v3 setObject:fetchAttributes forKeyedSubscript:@"MDSearchQueryOptionFetchAttributes"];
    [v4 setObject:self->_fetchAttributes forKeyedSubscript:@"SPQueryOptionFetchAttributes"];
  }
  protectionClasses = self->_protectionClasses;
  if (protectionClasses) {
    [v4 setObject:protectionClasses forKeyedSubscript:@"SPQueryOptionProtectionClasses"];
  }
  rankingQueries = self->_rankingQueries;
  if (rankingQueries)
  {
    [v4 setObject:rankingQueries forKeyedSubscript:@"MDSearchQueryOptionRankingQueries"];
    [v4 setObject:self->_rankingQueries forKeyedSubscript:@"SPQueryOptionRankingQueries"];
  }
  groupingRules = self->_groupingRules;
  if (groupingRules) {
    [v4 setObject:groupingRules forKeyedSubscript:@"SPQueryGroupingRules"];
  }
  preferredLanguages = self->_preferredLanguages;
  if (preferredLanguages) {
    [v4 setObject:preferredLanguages forKeyedSubscript:@"SPQueryOptionPreferredLanguages"];
  }
  disableBundles = self->_disableBundles;
  if (disableBundles) {
    [v4 setObject:disableBundles forKeyedSubscript:@"SPQueryOptionDisableBundles"];
  }
  filterQueries = self->_filterQueries;
  if (filterQueries) {
    [v4 setObject:filterQueries forKeyedSubscript:@"SPQueryOptionFilterQueries"];
  }
  filterQuery = self->_filterQuery;
  if (filterQuery) {
    [v4 setObject:filterQuery forKeyedSubscript:@"SPQueryOptionFilterQuery"];
  }
  if (self->_dominantRankingQueryCount)
  {
    v13 = objc_msgSend(NSNumber, "numberWithInteger:");
    [v4 setObject:v13 forKeyedSubscript:@"SPQueryOptionDominantRankingQueryCount"];
  }
  if (self->_dominatedRankingQueryCount)
  {
    v14 = objc_msgSend(NSNumber, "numberWithInteger:");
    [v4 setObject:v14 forKeyedSubscript:@"SPQueryOptionDominatedRankingQueryCount"];
  }
  if (self->_shortcutBit)
  {
    v15 = objc_msgSend(NSNumber, "numberWithInteger:");
    [v4 setObject:v15 forKeyedSubscript:@"SPQueryOptionShortcutBit"];
  }
  if (self->_highMatchBit)
  {
    v16 = objc_msgSend(NSNumber, "numberWithInteger:");
    [v4 setObject:v16 forKeyedSubscript:@"SPQueryOptionHighMatchBit"];
  }
  if (self->_lowMatchBit)
  {
    v17 = objc_msgSend(NSNumber, "numberWithInteger:");
    [v4 setObject:v17 forKeyedSubscript:@"SPQueryOptionLowMatchBit"];
  }
  if (self->_highRecencyBit)
  {
    v18 = objc_msgSend(NSNumber, "numberWithInteger:");
    [v4 setObject:v18 forKeyedSubscript:@"SPQueryOptionHighRecencyBit"];
  }
  if (self->_lowRecencyBit)
  {
    v19 = objc_msgSend(NSNumber, "numberWithInteger:");
    [v4 setObject:v19 forKeyedSubscript:@"SPQueryOptionLowRecencyBit"];
  }
  if (self->_strongRankingQueryCount)
  {
    v20 = objc_msgSend(NSNumber, "numberWithInteger:");
    [v4 setObject:v20 forKeyedSubscript:@"SPQueryOptionStrongRankingQueryCount"];
  }
  if (self->_maxCount)
  {
    v21 = objc_msgSend(NSNumber, "numberWithInteger:");
    [v4 setObject:v21 forKeyedSubscript:@"MDSearchQueryOptionMaxCount"];

    v22 = [NSNumber numberWithInteger:self->_maxCount];
    [v4 setObject:v22 forKeyedSubscript:@"SPQueryOptionMaxCount"];
  }
  if (self->_minCount)
  {
    v23 = objc_msgSend(NSNumber, "numberWithInteger:");
    [v4 setObject:v23 forKeyedSubscript:@"SPQueryOptionMinCount"];
  }
  [v4 setObject:self->_groupingRules forKeyedSubscript:@"SPQueryGroupingRules"];
  v24 = [NSNumber numberWithDouble:self->_minL2Score];
  [v4 setObject:v24 forKeyedSubscript:@"SPQueryOptionMinL2Score"];

  v25 = [NSNumber numberWithDouble:self->_maxAge];
  [v4 setObject:v25 forKeyedSubscript:@"SPQueryOptionMaxAge"];

  if ([(CSSearchQueryContext *)self grouped])
  {
    v26 = [NSNumber numberWithBool:1];
    [v4 setObject:v26 forKeyedSubscript:@"MDSearchQueryOptionGrouped"];

    v27 = [NSNumber numberWithBool:1];
    [v4 setObject:v27 forKeyedSubscript:@"SPQueryOptionGrouped"];
  }
  v28 = [NSNumber numberWithDouble:self->_currentTime];
  [v4 setObject:v28 forKeyedSubscript:@"SPQueryOptionCurrentTime"];

  scopes = self->_scopes;
  if (scopes) {
    [v4 setObject:scopes forKeyedSubscript:@"SPQueryOptionScopes"];
  }
  customResourceDirectory = self->_customResourceDirectory;
  if (customResourceDirectory) {
    [v4 setObject:customResourceDirectory forKeyedSubscript:@"customResourceDirectory"];
  }
  resultMatchingAttributes = self->_resultMatchingAttributes;
  if (resultMatchingAttributes) {
    [v4 setObject:resultMatchingAttributes forKeyedSubscript:@"SPQueryResultMatchingAttributes"];
  }
  if ([(CSSearchQueryContext *)self enablePhotosEntitySearch])
  {
    id v32 = objc_msgSend(NSNumber, "numberWithBool:", -[CSSearchQueryContext enablePhotosEntitySearch](self, "enablePhotosEntitySearch"));
    [v4 setObject:v32 forKeyedSubscript:@"SPQueryOptionEnablePhotosEntitySearch"];
  }
  if ([(CSSearchQueryContext *)self isDateQueryContext])
  {
    v33 = objc_msgSend(NSNumber, "numberWithBool:", -[CSSearchQueryContext isDateQueryContext](self, "isDateQueryContext"));
    [v4 setObject:v33 forKeyedSubscript:@"SPQueryOptionDateQueryContext"];
  }
  if ([(CSSearchQueryContext *)self disableMetadataSearch])
  {
    v34 = objc_msgSend(NSNumber, "numberWithBool:", -[CSSearchQueryContext disableMetadataSearch](self, "disableMetadataSearch"));
    [v4 setObject:v34 forKeyedSubscript:@"SPQueryOptionDisableMetadataSearch"];
  }
  if ([(CSSearchQueryContext *)self disableSemanticSearch])
  {
    v35 = objc_msgSend(NSNumber, "numberWithBool:", -[CSSearchQueryContext disableSemanticSearch](self, "disableSemanticSearch"));
    [v4 setObject:v35 forKeyedSubscript:@"SPQueryOptionDisableSemanticSearch"];
  }
  if ([(CSSearchQueryContext *)self disableU2])
  {
    v36 = objc_msgSend(NSNumber, "numberWithBool:", -[CSSearchQueryContext disableU2](self, "disableU2"));
    [v4 setObject:v36 forKeyedSubscript:@"SPQueryOptionDisableU2"];
  }
  if ([(CSSearchQueryContext *)self computePhotosDerivedAttributes]) {
    [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"SPQueryComputePhotosDerivedAttributes"];
  }

  return (NSDictionary *)v4;
}

- (BOOL)computePhotosDerivedAttributes
{
  return self->_computePhotosDerivedAttributes;
}

- (BOOL)grouped
{
  return (LOBYTE(self->_flags) >> 1) & 1;
}

- (BOOL)isDateQueryContext
{
  return (BYTE2(self->_flags) >> 2) & 1;
}

- (BOOL)enablePhotosEntitySearch
{
  return (BYTE2(self->_flags) >> 1) & 1;
}

- (BOOL)disableU2
{
  return HIBYTE(self->_flags) & 1;
}

- (BOOL)disableSemanticSearch
{
  return (BYTE2(self->_flags) >> 3) & 1;
}

- (BOOL)disableMetadataSearch
{
  return (BYTE2(self->_flags) >> 4) & 1;
}

- (void)setInternal:(BOOL)a3
{
  self->_flags = self->_flags & 0xFFFFFFFE | a3;
}

- (id)xpc_dictionary
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  clientBundleID = self->_clientBundleID;
  if (clientBundleID) {
    xpc_dictionary_set_string(v3, "cbi", [(NSString *)clientBundleID UTF8String]);
  }
  +[CSXPCConnection dictionary:v3 setStringArray:self->_fetchAttributes forKey:"fa"];
  nonTopHitFetchAttributeIndexesBits = self->_nonTopHitFetchAttributeIndexesBits;
  if (nonTopHitFetchAttributeIndexesBits)
  {
    CFIndex Count = CFBitVectorGetCount(nonTopHitFetchAttributeIndexesBits);
    if (Count >= 1)
    {
      CFIndex v7 = Count;
      size_t v8 = (unint64_t)(Count + 7) >> 3;
      v9 = (UInt8 *)malloc_type_malloc(v8, 0x6762EF9EuLL);
      if (v9)
      {
        v10 = v9;
        v35.location = 0;
        v35.size_t length = v7;
        CFBitVectorGetBits(self->_nonTopHitFetchAttributeIndexesBits, v35, v9);
        xpc_dictionary_set_data(v3, "tpefa", v10, v8);
        free(v10);
        int64_t v11 = CFBitVectorGetCount(self->_nonTopHitFetchAttributeIndexesBits);
        xpc_dictionary_set_int64(v3, "ctpefa", v11);
      }
    }
  }
  +[CSXPCConnection dictionary:v3 setStringArray:self->_protectionClasses forKey:"pcs"];
  +[CSXPCConnection dictionary:v3 setStringArray:self->_bundleIDs forKey:"bi"];
  +[CSXPCConnection dictionary:v3 setStringArray:self->_additionalBundleIDs forKey:"abi"];
  +[CSXPCConnection dictionary:v3 setStringArray:self->_instantAnswersBundleIDs forKey:"iab"];
  +[CSXPCConnection dictionary:v3 setStringArray:self->_answerAttributes forKey:"aai"];
  +[CSXPCConnection dictionary:v3 setStringOrDictionaryArray:self->_rankingQueries forKey:"rq"];
  +[CSXPCConnection dictionary:v3 setStringOrDictionaryArray:self->_additionalQueries forKey:"aq"];
  +[CSXPCConnection dictionary:v3 setStringOrDictionaryArray:self->_instantAnswersQueries forKey:"iaq"];
  +[CSXPCConnection dictionary:v3 setStringArray:self->_preferredLanguages forKey:"pl"];
  +[CSXPCConnection dictionary:v3 setStringArray:self->_markedTextArray forKey:"mt"];
  +[CSXPCConnection dictionary:v3 setStringArray:self->_disableBundles forKey:"db"];
  v12 = [(NSString *)self->_userQuery UTF8String];
  if (v12) {
    xpc_dictionary_set_string(v3, "uq", v12);
  }
  uint64_t rankingType = self->_rankingType;
  if (rankingType) {
    xpc_dictionary_set_uint64(v3, "rt", rankingType);
  }
  if ([(NSString *)self->_keyboardLanguage length]) {
    xpc_dictionary_set_string(v3, "kl", [(NSString *)self->_keyboardLanguage UTF8String]);
  }
  filterQueries = self->_filterQueries;
  if (filterQueries) {
    +[CSXPCConnection dictionary:v3 setStringArray:filterQueries forKey:"fqs"];
  }
  filterQuery = self->_filterQuery;
  if (filterQuery) {
    xpc_dictionary_set_string(v3, "fq", [(NSString *)filterQuery UTF8String]);
  }
  groupingRules = self->_groupingRules;
  if (groupingRules) {
    +[CSXPCConnection dictionary:v3 setStringArray:groupingRules forKey:"gr"];
  }
  if (self->_completionResultCount
    && [(NSString *)self->_completionString length]
    && [(NSString *)self->_completionString UTF8String]
    && [(NSArray *)self->_completionAttributes count])
  {
    uint64_t completionOptions = self->_completionOptions;
    if (completionOptions) {
      xpc_dictionary_set_uint64(v3, "co", completionOptions);
    }
    xpc_dictionary_set_uint64(v3, "cc", self->_completionResultCount);
    xpc_dictionary_set_string(v3, "cs", [(NSString *)self->_completionString UTF8String]);
    +[CSXPCConnection dictionary:v3 setStringArray:self->_completionAttributes forKey:"ca"];
    completionWeights = self->_completionWeights;
    if (completionWeights) {
      +[CSXPCConnection dictionary:v3 setNumberArray:completionWeights forKey:"cw"];
    }
  }
  xpc_dictionary_set_BOOL(v3, "qdrvp", self->_computePhotosDerivedAttributes);
  xpc_dictionary_set_uint64(v3, "src", self->_strongRankingQueryCount);
  xpc_dictionary_set_uint64(v3, "drc", self->_dominantRankingQueryCount);
  xpc_dictionary_set_uint64(v3, "ddrc", self->_dominatedRankingQueryCount);
  xpc_dictionary_set_uint64(v3, "sb", self->_shortcutBit);
  xpc_dictionary_set_uint64(v3, "hmb", self->_highMatchBit);
  xpc_dictionary_set_uint64(v3, "lmb", self->_lowMatchBit);
  xpc_dictionary_set_uint64(v3, "hrb", self->_highRecencyBit);
  xpc_dictionary_set_uint64(v3, "lrb", self->_lowRecencyBit);
  xpc_dictionary_set_uint64(v3, "mxc", self->_maxCount);
  xpc_dictionary_set_uint64(v3, "mnc", self->_minCount);
  xpc_dictionary_set_uint64(v3, "mrc", self->_maxRankedResultCount);
  xpc_dictionary_set_double(v3, "ml2", self->_minL2Score);
  xpc_dictionary_set_double(v3, "mage", self->_maxAge);
  xpc_dictionary_set_uint64(v3, "qi", self->_queryID);
  xpc_dictionary_set_uint64(v3, "f", self->_flags);
  xpc_dictionary_set_double(v3, "ct", self->_currentTime);
  xpc_dictionary_set_uint64(v3, "qos", self->_qos);
  xpc_dictionary_set_uint64(v3, "uqo", self->_userQueryOptions);
  xpc_dictionary_set_uint64(v3, "batsz", self->_maximumBatchSize);
  xpc_dictionary_set_BOOL(v3, "piq", self->_priorityIndexQuery);
  xpc_dictionary_set_BOOL(v3, "qsd", self->_disableResultStreaming);
  xpc_dictionary_set_BOOL(v3, "adv", self->_advancedQuery);
  xpc_dictionary_set_BOOL(v3, "frex", self->_hasFreeTextQuery);
  uint64_t sourceOptions = self->_sourceOptions;
  if (sourceOptions) {
    xpc_dictionary_set_uint64(v3, "so", sourceOptions);
  }
  if ([(NSArray *)self->_scopes count]) {
    +[CSXPCConnection dictionary:v3 setStringArray:self->_scopes forKey:"sp"];
  }
  if ([(NSArray *)self->_mountPoints count]) {
    +[CSXPCConnection dictionary:v3 setStringArray:self->_mountPoints forKey:"mp"];
  }
  instantAnswersOverrideDate = self->_instantAnswersOverrideDate;
  if (instantAnswersOverrideDate)
  {
    [(NSDate *)instantAnswersOverrideDate timeIntervalSince1970];
    xpc_dictionary_set_date(v3, "ovda", (uint64_t)v21);
  }
  customResourceDirectory = self->_customResourceDirectory;
  if (customResourceDirectory) {
    xpc_dictionary_set_string(v3, "crd", [(NSString *)customResourceDirectory UTF8String]);
  }
  attributedUserQuery = self->_attributedUserQuery;
  if (attributedUserQuery)
  {
    id v24 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:attributedUserQuery requiringSecureCoding:1 error:0];
    xpc_dictionary_set_data(v3, "pes", (const void *)[v24 bytes], objc_msgSend(v24, "length"));
  }
  resultMatchingAttributes = self->_resultMatchingAttributes;
  if (resultMatchingAttributes) {
    +[CSXPCConnection dictionary:v3 setStringArray:resultMatchingAttributes forKey:"rma"];
  }
  queryUnderstandingOutput = self->_queryUnderstandingOutput;
  if (queryUnderstandingOutput)
  {
    id v33 = 0;
    v27 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:queryUnderstandingOutput requiringSecureCoding:1 error:&v33];
    id v28 = v33;
    if (v28)
    {
      v29 = logForCSLogCategoryQuery();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        -[CSSearchQueryContext xpc_dictionary]();
      }
    }
    else
    {
      id v30 = v27;
      xpc_dictionary_set_data(v3, "qu", (const void *)[v30 bytes], objc_msgSend(v30, "length"));
    }
  }
  queryEmbedding = self->_queryEmbedding;
  if (queryEmbedding) {
    xpc_dictionary_set_data(v3, "qemb", [(NSData *)queryEmbedding bytes], [(NSData *)self->_queryEmbedding length]);
  }

  return v3;
}

- (NSArray)fetchAttributes
{
  if (self->_fetchAttributes) {
    return self->_fetchAttributes;
  }
  else {
    return (NSArray *)MEMORY[0x1E4F1CBF0];
  }
}

- (NSArray)completionWeights
{
  return self->_completionWeights;
}

- (NSArray)completionAttributes
{
  return self->_completionAttributes;
}

- (void)setLowPriority:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_flags = self->_flags & 0xFFFFFFDF | v3;
}

- (void)setDisableBlockingOnIndex:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_flags = self->_flags & 0xFFFFFBFF | v3;
}

- (void)dealloc
{
  nonTopHitFetchAttributeIndexesBits = self->_nonTopHitFetchAttributeIndexesBits;
  if (nonTopHitFetchAttributeIndexesBits) {
    CFRelease(nonTopHitFetchAttributeIndexesBits);
  }
  v4.receiver = self;
  v4.super_class = (Class)CSSearchQueryContext;
  [(CSSearchQueryContext *)&v4 dealloc];
}

- (BOOL)internal
{
  return self->_flags & 1;
}

- (BOOL)generateSuggestions
{
  return (BYTE1(self->_flags) >> 3) & 1;
}

- (BOOL)enableInstantAnswers
{
  return BYTE2(self->_flags) & 1;
}

- (void)setLive:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_flags = self->_flags & 0xFFFFFFFB | v3;
}

- (void)setPrivateQuery:(BOOL)a3
{
  if (a3) {
    int v3 = 0x400000;
  }
  else {
    int v3 = 0;
  }
  self->_flags = self->_flags & 0xFFBFFFFF | v3;
}

- (CSSearchQueryContext)initWithQoS:(unsigned int)a3
{
  result = [(CSSearchQueryContext *)self init];
  if (result) {
    result->_qos = a3;
  }
  return result;
}

- (void)setTopHitExtraFetchAttributeCount:(int64_t)a3
{
  self->_topHitExtraFetchAttributeCFIndex Count = a3;
}

- (int64_t)topHitExtraFetchAttributeCount
{
  return self->_topHitExtraFetchAttributeCount;
}

- (void)setNonTopHitFetchAttributeIndexesBits:(__CFBitVector *)a3
{
  if (a3) {
    CFRetain(a3);
  }
  nonTopHitFetchAttributeIndexesBits = self->_nonTopHitFetchAttributeIndexesBits;
  if (nonTopHitFetchAttributeIndexesBits) {
    CFRelease(nonTopHitFetchAttributeIndexesBits);
  }
  self->_nonTopHitFetchAttributeIndexesBits = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setMaxItemCount:(int64_t)a3
{
  self->_maxCFIndex Count = a3;
}

- (int64_t)maxItemCount
{
  return self->_maxCount;
}

- (void)setMaxDenseResultCount:(int64_t)a3
{
  self->_maxDenseResultCFIndex Count = a3;
}

- (int64_t)maxDenseResultCount
{
  return self->_maxDenseResultCount;
}

- (void)setCompletionResultCount:(int64_t)a3
{
  self->_completionResultCFIndex Count = a3;
}

- (void)setGrouped:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_flags = self->_flags & 0xFFFFFFFD | v3;
}

- (void)setCounting:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_flags = self->_flags & 0xFFFFFFF7 | v3;
}

- (void)setAttribute:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_flags = self->_flags & 0xFFFFFFEF | v3;
}

- (BOOL)parseUserQuery
{
  return (LOBYTE(self->_flags) >> 6) & 1;
}

- (void)setParseUserQuery:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_flags = self->_flags & 0xFFFFFFBF | v3;
}

- (BOOL)disableNLP
{
  return (BYTE1(self->_flags) >> 6) & 1;
}

- (void)setDisableNLP:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_flags = self->_flags & 0xFFFFBFFF | v3;
}

- (void)setEnableInstantAnswers:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_flags = self->_flags & 0xFFFEFFFF | v3;
}

- (void)setGenerateSuggestions:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_flags = self->_flags & 0xFFFFF7FF | v3;
}

- (void)setDisableSemanticSearch:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_flags = self->_flags & 0xFFF7FFFF | v3;
}

- (BOOL)disableSafetyCheck
{
  return BYTE2(self->_flags) >> 7;
}

- (void)setDisableSafetyCheck:(BOOL)a3
{
  if (a3) {
    int v3 = 0x800000;
  }
  else {
    int v3 = 0;
  }
  self->_flags = self->_flags & 0xFF7FFFFF | v3;
}

- (void)setDisableMetadataSearch:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_flags = self->_flags & 0xFFEFFFFF | v3;
}

- (void)setDisableU2:(BOOL)a3
{
  if (a3) {
    int v3 = 0x1000000;
  }
  else {
    int v3 = 0;
  }
  self->_flags = self->_flags & 0xFEFFFFFF | v3;
}

- (BOOL)filterTopHits
{
  return (BYTE2(self->_flags) >> 5) & 1;
}

- (void)setIncludeUserActivities:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_flags = self->_flags & 0xFFFFFDFF | v3;
}

- (void)setPommes:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_flags = self->_flags & 0xFFFFEFFF | v3;
}

- (BOOL)pommesSuggestions
{
  return (BYTE1(self->_flags) >> 5) & 1;
}

- (void)setPommesSuggestions:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_flags = self->_flags & 0xFFFFDFFF | v3;
}

- (BOOL)pommesZKW
{
  return BYTE1(self->_flags) >> 7;
}

- (void)setPommesZKW:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_flags = self->_flags & 0xFFFF7FFF | v3;
}

- (void)setEnablePhotosEntitySearch:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_flags = self->_flags & 0xFFFDFFFF | v3;
}

- (void)setIsDateQueryContext:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_flags = self->_flags & 0xFFFBFFFF | v3;
}

+ (id)pommesSupportedBundleIDs
{
  if (pommesSupportedBundleIDs_onceToken != -1) {
    dispatch_once(&pommesSupportedBundleIDs_onceToken, &__block_literal_global_18);
  }
  uint64_t v2 = (void *)pommesSupportedBundleIDs_pommesSupportedBundleIDs;

  return v2;
}

uint64_t __48__CSSearchQueryContext_pommesSupportedBundleIDs__block_invoke()
{
  pommesSupportedBundleIDs_pommesSupportedBundleIDs = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1EDBD61F0];

  return MEMORY[0x1F41817F8]();
}

- (BOOL)isMail
{
  int v3 = [MEMORY[0x1E4F28B50] mainBundle];
  objc_super v4 = [v3 bundleIdentifier];
  if ([v4 isEqualToString:@"com.apple.mobilemail"])
  {
    char v5 = 1;
  }
  else
  {
    objc_super v6 = [(CSSearchQueryContext *)self bundleIDs];
    char v5 = [v6 containsObject:@"com.apple.mobilemail"];
  }
  return v5;
}

- (BOOL)isPhotos
{
  int v3 = [MEMORY[0x1E4F28B50] mainBundle];
  objc_super v4 = [v3 bundleIdentifier];
  if ([v4 isEqualToString:@"com.apple.mobileslideshow"])
  {
    char v5 = 1;
  }
  else
  {
    objc_super v6 = [(CSSearchQueryContext *)self bundleIDs];
    char v5 = [v6 containsObject:@"com.apple.mobileslideshow"];
  }
  return v5;
}

- (BOOL)isNotes
{
  int v3 = [MEMORY[0x1E4F28B50] mainBundle];
  objc_super v4 = [v3 bundleIdentifier];
  if ([v4 isEqualToString:@"com.apple.mobilenotes"])
  {
    char v5 = 1;
  }
  else
  {
    objc_super v6 = [(CSSearchQueryContext *)self bundleIDs];
    char v5 = [v6 containsObject:@"com.apple.mobilenotes"];
  }
  return v5;
}

- (BOOL)isMessages
{
  int v3 = [MEMORY[0x1E4F28B50] mainBundle];
  objc_super v4 = [v3 bundleIdentifier];
  if ([v4 isEqualToString:@"com.apple.MobileSMS"])
  {
    char v5 = 1;
  }
  else
  {
    objc_super v6 = [(CSSearchQueryContext *)self bundleIDs];
    char v5 = [v6 containsObject:@"com.apple.MobileSMS"];
  }
  return v5;
}

- (BOOL)isSafari
{
  int v3 = [MEMORY[0x1E4F28B50] mainBundle];
  objc_super v4 = [v3 bundleIdentifier];
  if ([v4 isEqualToString:@"com.apple.mobilesafari"])
  {
    char v5 = 1;
  }
  else
  {
    objc_super v6 = [(CSSearchQueryContext *)self bundleIDs];
    if ([v6 containsObject:@"com.apple.mobilesafari"])
    {
      char v5 = 1;
    }
    else
    {
      CFIndex v7 = [MEMORY[0x1E4F28B50] mainBundle];
      size_t v8 = [v7 bundleIdentifier];
      if ([v8 isEqualToString:@"com.argos.BlendABApp2"])
      {
        char v5 = 1;
      }
      else
      {
        v9 = [(CSSearchQueryContext *)self bundleIDs];
        char v5 = [v9 containsObject:@"com.argos.BlendABApp2"];
      }
    }
  }
  return v5;
}

- (BOOL)isPommesCtl
{
  int v3 = [MEMORY[0x1E4F28B50] mainBundle];
  objc_super v4 = [v3 bundleIdentifier];
  if ([v4 isEqualToString:@"com.apple.pommesctl"])
  {
    char v5 = 1;
  }
  else
  {
    objc_super v6 = [(CSSearchQueryContext *)self bundleIDs];
    char v5 = [v6 containsObject:@"com.apple.pommesctl"];
  }
  return v5;
}

- (BOOL)isFinder
{
  return 0;
}

- (id)pommesEnabledBundleID
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v3 = [(CSSearchQueryContext *)self bundleIDs];
  objc_super v4 = (void *)v3;
  if (v3) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = MEMORY[0x1E4F1CBF0];
  }
  objc_super v6 = [v2 setWithArray:v5];

  CFIndex v7 = +[CSSearchQueryContext pommesSupportedBundleIDs];
  [v6 intersectSet:v7];

  if ([v6 count] == 1)
  {
    size_t v8 = [v6 anyObject];
  }
  else
  {
    v9 = [MEMORY[0x1E4F28B50] mainBundle];
    size_t v8 = [v9 bundleIdentifier];
  }

  return v8;
}

- (void)setNormalizedSearchQuery:(id)a3
{
}

- (id)normalizedSearchQuery
{
  return self->_normalizedSearchQuery;
}

- (void)setCompletionString:(id)a3
{
}

- (void)setCompletionAttributes:(id)a3
{
}

- (void)setCompletionWeights:(id)a3
{
}

- (void)setCompletionOptions:(unsigned int)a3
{
  self->_uint64_t completionOptions = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v28 = a3;
  objc_super v4 = (void *)MEMORY[0x192F99810]();
  uint64_t v5 = [(CSSearchQueryContext *)self fetchAttributes];
  [v28 encodeObject:v5 forKey:@"fetchAttributes"];

  objc_super v6 = [(CSSearchQueryContext *)self protectionClasses];
  [v28 encodeObject:v6 forKey:@"protectionClasses"];

  CFIndex v7 = [(CSSearchQueryContext *)self bundleIDs];
  [v28 encodeObject:v7 forKey:@"bundleIDs"];

  size_t v8 = [(CSSearchQueryContext *)self additionalBundleIDs];
  [v28 encodeObject:v8 forKey:@"additionalBundleIDs"];

  v9 = [(CSSearchQueryContext *)self instantAnswersBundleIDs];
  [v28 encodeObject:v9 forKey:@"instantAnswersBundleIDs"];

  v10 = [(CSSearchQueryContext *)self answerAttributes];
  [v28 encodeObject:v10 forKey:@"answerAttributes"];

  int64_t v11 = [(CSSearchQueryContext *)self rankingQueries];
  [v28 encodeObject:v11 forKey:@"rankingQueries"];

  v12 = [(CSSearchQueryContext *)self groupingRules];
  [v28 encodeObject:v12 forKey:@"groupingRules"];

  v13 = [(CSSearchQueryContext *)self additionalQueries];
  [v28 encodeObject:v13 forKey:@"additionalQueries"];

  v14 = [(CSSearchQueryContext *)self instantAnswersQueries];
  [v28 encodeObject:v14 forKey:@"instantAnswersQueries"];

  v15 = [(CSSearchQueryContext *)self preferredLanguages];
  [v28 encodeObject:v15 forKey:@"preferredLanguages"];

  v16 = [(CSSearchQueryContext *)self keyboardLanguage];
  [v28 encodeObject:v16 forKey:@"keyboardLanguage"];

  v17 = [(CSSearchQueryContext *)self markedTextArray];
  [v28 encodeObject:v17 forKey:@"markedTextArray"];

  v18 = [(CSSearchQueryContext *)self disableBundles];
  [v28 encodeObject:v18 forKey:@"disableBundles"];

  v19 = [(CSSearchQueryContext *)self userQuery];
  [v28 encodeObject:v19 forKey:@"userQuery"];

  objc_msgSend(v28, "encodeInteger:forKey:", -[CSSearchQueryContext rankingType](self, "rankingType"), @"rankingType");
  v20 = [(CSSearchQueryContext *)self filterQueries];
  [v28 encodeObject:v20 forKey:@"filterQueries"];

  double v21 = [(CSSearchQueryContext *)self filterQuery];
  [v28 encodeObject:v21 forKey:@"filterQuery"];

  objc_msgSend(v28, "encodeInteger:forKey:", -[CSSearchQueryContext currentTokenScope](self, "currentTokenScope"), @"currentTokenScope");
  objc_msgSend(v28, "encodeInteger:forKey:", -[CSSearchQueryContext strongRankingQueryCount](self, "strongRankingQueryCount"), @"strongRankingQueryCount");
  objc_msgSend(v28, "encodeInteger:forKey:", -[CSSearchQueryContext dominantRankingQueryCount](self, "dominantRankingQueryCount"), @"dominantRankingQueryCount");
  objc_msgSend(v28, "encodeInteger:forKey:", -[CSSearchQueryContext dominatedRankingQueryCount](self, "dominatedRankingQueryCount"), @"dominatedRankingQueryCount");
  objc_msgSend(v28, "encodeInteger:forKey:", -[CSSearchQueryContext shortcutBit](self, "shortcutBit"), @"shortcutBit");
  objc_msgSend(v28, "encodeInteger:forKey:", -[CSSearchQueryContext highMatchBit](self, "highMatchBit"), @"highMatchBit");
  objc_msgSend(v28, "encodeInteger:forKey:", -[CSSearchQueryContext lowMatchBit](self, "lowMatchBit"), @"lowMatchBit");
  objc_msgSend(v28, "encodeInteger:forKey:", -[CSSearchQueryContext highRecencyBit](self, "highRecencyBit"), @"highRecencyBit");
  objc_msgSend(v28, "encodeInteger:forKey:", -[CSSearchQueryContext lowRecencyBit](self, "lowRecencyBit"), @"lowRecencyBit");
  objc_msgSend(v28, "encodeInteger:forKey:", -[CSSearchQueryContext maxCount](self, "maxCount"), @"maxCount");
  objc_msgSend(v28, "encodeInteger:forKey:", -[CSSearchQueryContext minCount](self, "minCount"), @"minCount");
  [(CSSearchQueryContext *)self minL2Score];
  objc_msgSend(v28, "encodeDouble:forKey:", @"minL2Score");
  [(CSSearchQueryContext *)self maxAge];
  *(float *)&double v22 = v22;
  [v28 encodeFloat:@"maxAge" forKey:v22];
  objc_msgSend(v28, "encodeInteger:forKey:", -[CSSearchQueryContext queryID](self, "queryID"), @"queryID");
  objc_msgSend(v28, "encodeInteger:forKey:", -[CSSearchQueryContext flags](self, "flags"), @"flags");
  [(CSSearchQueryContext *)self currentTime];
  objc_msgSend(v28, "encodeDouble:forKey:", @"currentTime");
  v23 = [(CSSearchQueryContext *)self scopes];
  [v28 encodeObject:v23 forKey:@"scopes"];

  objc_msgSend(v28, "encodeInteger:forKey:", -[CSSearchQueryContext qos](self, "qos"), @"qos");
  objc_msgSend(v28, "encodeInteger:forKey:", -[CSSearchQueryContext userQueryOptions](self, "userQueryOptions"), @"userQueryOptions");
  objc_msgSend(v28, "encodeInteger:forKey:", -[CSSearchQueryContext sourceOptions](self, "sourceOptions"), @"so");
  objc_msgSend(v28, "encodeInteger:forKey:", -[CSSearchQueryContext maximumBatchSize](self, "maximumBatchSize"), @"maximumBatchSize");
  id v24 = [(CSSearchQueryContext *)self customFieldSpecifications];
  [v28 encodeObject:v24 forKey:@"customFieldSpecifications"];

  v25 = [(CSSearchQueryContext *)self instantAnswersOverrideDate];
  [v28 encodeObject:v25 forKey:@"instantAnswersOverrideDate"];

  v26 = [(CSSearchQueryContext *)self customResourceDirectory];
  [v28 encodeObject:v26 forKey:@"customResourceDirectory"];

  v27 = [(CSSearchQueryContext *)self resultMatchingAttributes];
  [v28 encodeObject:v27 forKey:@"resultMatchingAttributes"];

  objc_msgSend(v28, "encodeBool:forKey:", -[CSSearchQueryContext computePhotosDerivedAttributes](self, "computePhotosDerivedAttributes"), @"computePhotosDerivedAttributes");
}

- (CSSearchQueryContext)initWithCoder:(id)a3
{
  v121[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v104.receiver = self;
  v104.super_class = (Class)CSSearchQueryContext;
  uint64_t v5 = [(CSSearchQueryContext *)&v104 init];
  if (v5)
  {
    objc_super v6 = (void *)MEMORY[0x192F99810]();
    CFIndex v7 = (void *)MEMORY[0x1E4F1CAD0];
    v121[0] = objc_opt_class();
    v121[1] = objc_opt_class();
    size_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v121 count:2];
    v9 = [v7 setWithArray:v8];
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"fetchAttributes"];
    fetchAttributes = v5->_fetchAttributes;
    v5->_fetchAttributes = (NSArray *)v10;

    v12 = (void *)MEMORY[0x1E4F1CAD0];
    v120[0] = objc_opt_class();
    v120[1] = objc_opt_class();
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v120 count:2];
    v14 = [v12 setWithArray:v13];
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"protectionClasses"];
    protectionClasses = v5->_protectionClasses;
    v5->_protectionClasses = (NSArray *)v15;

    v17 = (void *)MEMORY[0x1E4F1CAD0];
    v119[0] = objc_opt_class();
    v119[1] = objc_opt_class();
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v119 count:2];
    v19 = [v17 setWithArray:v18];
    uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"bundleIDs"];
    bundleIDs = v5->_bundleIDs;
    v5->_bundleIDs = (NSArray *)v20;

    double v22 = (void *)MEMORY[0x1E4F1CAD0];
    v118[0] = objc_opt_class();
    v118[1] = objc_opt_class();
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v118 count:2];
    id v24 = [v22 setWithArray:v23];
    uint64_t v25 = [v4 decodeObjectOfClasses:v24 forKey:@"additionalBundleIDs"];
    additionalBundleIDs = v5->_additionalBundleIDs;
    v5->_additionalBundleIDs = (NSArray *)v25;

    v27 = (void *)MEMORY[0x1E4F1CAD0];
    v117[0] = objc_opt_class();
    v117[1] = objc_opt_class();
    id v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v117 count:2];
    v29 = [v27 setWithArray:v28];
    uint64_t v30 = [v4 decodeObjectOfClasses:v29 forKey:@"instantAnswersBundleIDs"];
    instantAnswersBundleIDs = v5->_instantAnswersBundleIDs;
    v5->_instantAnswersBundleIDs = (NSArray *)v30;

    id v32 = (void *)MEMORY[0x1E4F1CAD0];
    v116[0] = objc_opt_class();
    v116[1] = objc_opt_class();
    id v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v116 count:2];
    v34 = [v32 setWithArray:v33];
    uint64_t v35 = [v4 decodeObjectOfClasses:v34 forKey:@"answerAttributes"];
    answerAttributes = v5->_answerAttributes;
    v5->_answerAttributes = (NSArray *)v35;

    v37 = (void *)MEMORY[0x1E4F1CAD0];
    v115[0] = objc_opt_class();
    v115[1] = objc_opt_class();
    v115[2] = objc_opt_class();
    v115[3] = objc_opt_class();
    v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v115 count:4];
    v39 = [v37 setWithArray:v38];
    uint64_t v40 = [v4 decodeObjectOfClasses:v39 forKey:@"rankingQueries"];
    rankingQueries = v5->_rankingQueries;
    v5->_rankingQueries = (NSArray *)v40;

    v42 = (void *)MEMORY[0x1E4F1CAD0];
    v114[0] = objc_opt_class();
    v114[1] = objc_opt_class();
    uint64_t v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v114 count:2];
    uint64_t v44 = [v42 setWithArray:v43];
    uint64_t v45 = [v4 decodeObjectOfClasses:v44 forKey:@"groupingRules"];
    groupingRules = v5->_groupingRules;
    v5->_groupingRules = (NSArray *)v45;

    v47 = (void *)MEMORY[0x1E4F1CAD0];
    v113[0] = objc_opt_class();
    v113[1] = objc_opt_class();
    v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:v113 count:2];
    v49 = [v47 setWithArray:v48];
    uint64_t v50 = [v4 decodeObjectOfClasses:v49 forKey:@"additionalQueries"];
    additionalQueries = v5->_additionalQueries;
    v5->_additionalQueries = (NSArray *)v50;

    v52 = (void *)MEMORY[0x1E4F1CAD0];
    v112[0] = objc_opt_class();
    v112[1] = objc_opt_class();
    v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:v112 count:2];
    v54 = [v52 setWithArray:v53];
    uint64_t v55 = [v4 decodeObjectOfClasses:v54 forKey:@"instantAnswersQueries"];
    instantAnswersQueries = v5->_instantAnswersQueries;
    v5->_instantAnswersQueries = (NSArray *)v55;

    v5->_currentTokenScope = [v4 decodeIntegerForKey:@"currentTokenScope"];
    v57 = (void *)MEMORY[0x1E4F1CAD0];
    v111[0] = objc_opt_class();
    v111[1] = objc_opt_class();
    v58 = [MEMORY[0x1E4F1C978] arrayWithObjects:v111 count:2];
    v59 = [v57 setWithArray:v58];
    uint64_t v60 = [v4 decodeObjectOfClasses:v59 forKey:@"preferredLanguages"];
    preferredLanguages = v5->_preferredLanguages;
    v5->_preferredLanguages = (NSArray *)v60;

    uint64_t v62 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keyboardLanguage"];
    keyboardLanguage = v5->_keyboardLanguage;
    v5->_keyboardLanguage = (NSString *)v62;

    v64 = (void *)MEMORY[0x1E4F1CAD0];
    v110[0] = objc_opt_class();
    v110[1] = objc_opt_class();
    v65 = [MEMORY[0x1E4F1C978] arrayWithObjects:v110 count:2];
    v66 = [v64 setWithArray:v65];
    uint64_t v67 = [v4 decodeObjectOfClasses:v66 forKey:@"markedTextArray"];
    markedTextArray = v5->_markedTextArray;
    v5->_markedTextArray = (NSArray *)v67;

    v69 = (void *)MEMORY[0x1E4F1CAD0];
    v109[0] = objc_opt_class();
    v109[1] = objc_opt_class();
    v70 = [MEMORY[0x1E4F1C978] arrayWithObjects:v109 count:2];
    v71 = [v69 setWithArray:v70];
    uint64_t v72 = [v4 decodeObjectOfClasses:v71 forKey:@"disableBundles"];
    disableBundles = v5->_disableBundles;
    v5->_disableBundles = (NSArray *)v72;

    uint64_t v74 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userQuery"];
    userQuery = v5->_userQuery;
    v5->_userQuery = (NSString *)v74;

    v5->_uint64_t rankingType = [v4 decodeIntegerForKey:@"rankingType"];
    uint64_t v76 = (void *)MEMORY[0x1E4F1CAD0];
    v108[0] = objc_opt_class();
    v108[1] = objc_opt_class();
    v77 = [MEMORY[0x1E4F1C978] arrayWithObjects:v108 count:2];
    v78 = [v76 setWithArray:v77];
    uint64_t v79 = [v4 decodeObjectOfClasses:v78 forKey:@"filterQueries"];
    filterQueries = v5->_filterQueries;
    v5->_filterQueries = (NSArray *)v79;

    uint64_t v81 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"filterQuery"];
    filterQuery = v5->_filterQuery;
    v5->_filterQuery = (NSString *)v81;

    v5->_dominantRankingQueryCFIndex Count = [v4 decodeIntegerForKey:@"dominantRankingQueryCount"];
    v5->_dominatedRankingQueryCFIndex Count = [v4 decodeIntegerForKey:@"dominatedRankingQueryCount"];
    v5->_shortcutBit = [v4 decodeIntegerForKey:@"shortcutBit"];
    v5->_highMatchBit = [v4 decodeIntegerForKey:@"highMatchBit"];
    v5->_lowMatchBit = [v4 decodeIntegerForKey:@"lowMatchBit"];
    v5->_highRecencyBit = [v4 decodeIntegerForKey:@"highRecencyBit"];
    v5->_lowRecencyBit = [v4 decodeIntegerForKey:@"lowRecencyBit"];
    v5->_strongRankingQueryCFIndex Count = [v4 decodeIntegerForKey:@"strongRankingQueryCount"];
    v5->_maxCFIndex Count = [v4 decodeIntegerForKey:@"maxCount"];
    v5->_minCFIndex Count = [v4 decodeIntegerForKey:@"minCount"];
    v5->_minL2Score = (double)[v4 decodeIntegerForKey:@"minL2Score"];
    v5->_maxAge = (double)[v4 decodeIntegerForKey:@"maxAge"];
    v5->_queryID = [v4 decodeIntegerForKey:@"queryID"];
    v5->_flags = [v4 decodeIntegerForKey:@"flags"];
    [v4 decodeDoubleForKey:@"currentTime"];
    v5->_currentTime = v83;
    v84 = (void *)MEMORY[0x1E4F1CAD0];
    v107[0] = objc_opt_class();
    v107[1] = objc_opt_class();
    v85 = [MEMORY[0x1E4F1C978] arrayWithObjects:v107 count:2];
    id v86 = [v84 setWithArray:v85];
    uint64_t v87 = [v4 decodeObjectOfClasses:v86 forKey:@"scopes"];
    scopes = v5->_scopes;
    v5->_scopes = (NSArray *)v87;

    v5->_qos = [v4 decodeIntegerForKey:@"qos"];
    v5->_userQueryOptions = [v4 decodeIntegerForKey:@"userQueryOptions"];
    v5->_uint64_t sourceOptions = [v4 decodeIntegerForKey:@"so"];
    v5->_maximumBatchSize = [v4 decodeIntegerForKey:@"maximumBatchSize"];
    uint64_t v89 = (void *)MEMORY[0x1E4F1CAD0];
    v106[0] = objc_opt_class();
    v106[1] = objc_opt_class();
    uint64_t v90 = [MEMORY[0x1E4F1C978] arrayWithObjects:v106 count:2];
    uint64_t v91 = [v89 setWithArray:v90];
    uint64_t v92 = [v4 decodeObjectOfClasses:v91 forKey:@"customFieldSpecifications"];
    customFieldSpecifications = v5->_customFieldSpecifications;
    v5->_customFieldSpecifications = (NSArray *)v92;

    uint64_t v94 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"instantAnswersOverrideDate"];
    instantAnswersOverrideDate = v5->_instantAnswersOverrideDate;
    v5->_instantAnswersOverrideDate = (NSDate *)v94;

    uint64_t v96 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"customResourceDirectory"];
    customResourceDirectory = v5->_customResourceDirectory;
    v5->_customResourceDirectory = (NSString *)v96;

    v98 = (void *)MEMORY[0x1E4F1CAD0];
    v105[0] = objc_opt_class();
    v105[1] = objc_opt_class();
    v99 = [MEMORY[0x1E4F1C978] arrayWithObjects:v105 count:2];
    v100 = [v98 setWithArray:v99];
    uint64_t v101 = [v4 decodeObjectOfClasses:v100 forKey:@"resultMatchingAttributes"];
    resultMatchingAttributes = v5->_resultMatchingAttributes;
    v5->_resultMatchingAttributes = (NSArray *)v101;

    v5->_computePhotosDerivedAttributes = [v4 decodeBoolForKey:@"computePhotosDerivedAttributes"];
  }

  return v5;
}

- (id)description
{
  uint64_t v2 = (void *)[[NSString alloc] initWithFormat:@"<%@:%p qid=%ld flag=0x%4.4x>", objc_opt_class(), self, self->_queryID, self->_flags];

  return v2;
}

- (id)debugDescription
{
  uint64_t v3 = (void *)MEMORY[0x192F99810](self, a2);
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"<%@:%p", objc_opt_class(), self];
  uint64_t v5 = v4;
  if (self->_queryID) {
    objc_msgSend(v4, "appendFormat:", @" queryID=%ld", self->_queryID);
  }
  if (self->_clientBundleID) {
    [v5 appendFormat:@" clientBundleID=%@", self->_clientBundleID];
  }
  if ([(NSArray *)self->_bundleIDs count])
  {
    objc_super v6 = [(NSArray *)self->_bundleIDs componentsJoinedByString:@", "];
    [v5 appendFormat:@" bundleIDs=(%@)", v6];
  }
  if ([(NSArray *)self->_protectionClasses count])
  {
    CFIndex v7 = [(NSArray *)self->_protectionClasses componentsJoinedByString:@", "];
    [v5 appendFormat:@" protectionClasses=(%@)", v7];
  }
  if ([(NSArray *)self->_mountPoints count])
  {
    size_t v8 = [(NSArray *)self->_mountPoints componentsJoinedByString:@", "];
    [v5 appendFormat:@" mount=(%@)", v8];
  }
  preferredLanguages = self->_preferredLanguages;
  if (preferredLanguages)
  {
    uint64_t v10 = [(NSArray *)preferredLanguages componentsJoinedByString:@", "];
    [v5 appendFormat:@" preferredLanguages=(%@)", v10];
  }
  if (self->_keyboardLanguage) {
    [v5 appendFormat:@" keyboardLanguage=%@", self->_keyboardLanguage];
  }
  markedTextArray = self->_markedTextArray;
  if (markedTextArray)
  {
    v12 = [(NSArray *)markedTextArray componentsJoinedByString:@", "];
    [v5 appendFormat:@" markedTextArray=(%@)", v12];
  }
  if (self->_maxCount) {
    objc_msgSend(v5, "appendFormat:", @" maxCount=%ld", self->_maxCount);
  }
  if (self->_minCount) {
    objc_msgSend(v5, "appendFormat:", @" minCount=%ld", self->_minCount);
  }
  double minL2Score = self->_minL2Score;
  if (minL2Score != 0.0 && minL2Score != -1.79769313e308) {
    objc_msgSend(v5, "appendFormat:", @" minL2Score=%f", *(void *)&self->_minL2Score);
  }
  if (self->_maxAge != 0.0) {
    objc_msgSend(v5, "appendFormat:", @" maxAge=%f", *(void *)&self->_maxAge);
  }
  if ([(CSSearchQueryContext *)self internal]) {
    [v5 appendString:@" internal=true"];
  }
  if ([(CSSearchQueryContext *)self grouped]) {
    [v5 appendString:@" grouped=true"];
  }
  if ([(CSSearchQueryContext *)self disableNLP]) {
    [v5 appendString:@" disableNLP=true"];
  }
  if ([(CSSearchQueryContext *)self pommesZKW]) {
    [v5 appendString:@" pommesZKW=true"];
  }
  if ([(CSSearchQueryContext *)self live]) {
    [v5 appendString:@" live=true"];
  }
  if ([(CSSearchQueryContext *)self counting]) {
    [v5 appendString:@" counting=true"];
  }
  if ([(CSSearchQueryContext *)self attribute]) {
    [v5 appendString:@" attribute=true"];
  }
  if (self->_userQuery) {
    [v5 appendFormat:@" userQuery=%@", self->_userQuery];
  }
  if (self->_userQueryOptions) {
    objc_msgSend(v5, "appendFormat:", @" userQueryOptions=0x%x", self->_userQueryOptions);
  }
  if (self->_qos) {
    objc_msgSend(v5, "appendFormat:", @" qos=%u", self->_qos);
  }
  objc_msgSend(v5, "appendFormat:", @" batchSize=%zd", self->_maximumBatchSize);
  if (self->_sourceOptions) {
    objc_msgSend(v5, "appendFormat:", @" source=%u", self->_sourceOptions);
  }
  objc_msgSend(v5, "appendFormat:", @" currentTime=%lf", *(void *)&self->_currentTime);
  NSUInteger v14 = [(NSArray *)self->_rankingQueries count];
  if (v14)
  {
    NSUInteger v15 = v14;
    for (uint64_t i = 0; i != v15; ++i)
    {
      v17 = [(NSArray *)self->_rankingQueries objectAtIndexedSubscript:i];
      [v5 appendFormat:@"\n   rankingQueries[%d]=%@", i, v17];
    }
    [v5 appendString:@"\n"];
  }
  NSUInteger v18 = [(NSArray *)self->_groupingRules count];
  if ([(NSArray *)self->_groupingRules count])
  {
    if (v18)
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        uint64_t v20 = [(NSArray *)self->_groupingRules objectAtIndexedSubscript:j];
        [v5 appendFormat:@"\n   groupingRules[%d]=%@", j, v20];
      }
    }
    [v5 appendString:@"\n"];
  }
  NSUInteger v21 = [(NSArray *)self->_resultMatchingAttributes count];
  if (v21)
  {
    NSUInteger v22 = v21;
    for (uint64_t k = 0; k != v22; ++k)
    {
      id v24 = [(NSArray *)self->_resultMatchingAttributes objectAtIndexedSubscript:k];
      [v5 appendFormat:@"\n   resultMatchingAttributes[%d]=%@", k, v24];
    }
    [v5 appendString:@"\n"];
  }
  NSUInteger v25 = [(NSArray *)self->_fetchAttributes count];
  if (v25)
  {
    unint64_t v26 = v25;
    v27 = [(NSArray *)self->_fetchAttributes componentsJoinedByString:@", "];
    [v5 appendFormat:@" fetchAttributes=(%@)", v27];

    if (v26 >= 6) {
      [v5 appendString:@"\n"];
    }
  }
  if ([(NSArray *)self->_scopes count])
  {
    id v28 = [(NSArray *)self->_scopes componentsJoinedByString:@", "];
    [v5 appendFormat:@" scopes=(%@)", v28];
  }
  [v5 appendString:@">"];

  return v5;
}

- (NSArray)resultMatchingSceneIdentifiers
{
  return self->_resultMatchingSceneIdentifiers;
}

- (void)setResultMatchingSceneIdentifiers:(id)a3
{
}

- (BOOL)fetchl2Signals
{
  return self->_fetchl2Signals;
}

- (void)setFetchl2Signals:(BOOL)a3
{
  self->_fetchl2Signals = a3;
}

- (void)xpc_dictionary
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_18D0E3000, v0, OS_LOG_TYPE_ERROR, "[Pommes] Could not archive queryUnderstandingOutput %@", v1, 0xCu);
}

- (void)initWithXPCDictionary:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_18D0E3000, v0, OS_LOG_TYPE_ERROR, "[Pommes] Could not unarchive queryUnderstandingOutput %@", v1, 0xCu);
}

- (void)initWithXPCDictionary:.cold.2()
{
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_1_3(&dword_18D0E3000, v0, v1, "Received top hits query for %@", v2, v3, v4, v5, v6);
}

@end