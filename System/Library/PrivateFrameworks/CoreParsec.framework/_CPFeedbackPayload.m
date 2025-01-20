@interface _CPFeedbackPayload
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_CPCBAEngagementFeedback)cbaEngagementFeedback;
- (_CPCacheHitFeedback)cacheHitFeedback;
- (_CPCardSectionEngagementFeedback)cardSectionEngagementFeedback;
- (_CPCardSectionFeedback)cardSectionFeedback;
- (_CPCardViewAppearFeedback)cardViewAppearFeedback;
- (_CPCardViewDisappearFeedback)cardViewDisappearFeedback;
- (_CPClearInputFeedback)clearInputFeedback;
- (_CPClientTimingFeedback)clientTimingFeedback;
- (_CPCommandEngagementFeedback)commandEngagementFeedback;
- (_CPConnectionInvalidatedFeedback)connectionInvalidatedFeedback;
- (_CPCustomFeedback)customFeedback;
- (_CPDidGoToSearchFeedback)didGoToSearchFeedback;
- (_CPDidGoToSiteFeedback)didGoToSiteFeedback;
- (_CPDynamicButtonVisibilityFeedback)dynamicButtonVisibilityFeedback;
- (_CPEndLocalSearchFeedback)endLocalSearchFeedback;
- (_CPEndNetworkSearchFeedback)endNetworkSearchFeedback;
- (_CPEndSearchFeedback)endSearchFeedback;
- (_CPErrorFeedback)errorFeedback;
- (_CPExperimentTriggeredFeedback)experimentTriggeredFeedback;
- (_CPFeedback)feedback;
- (_CPFeedbackPayload)initWithCodable:(id)a3;
- (_CPFeedbackPayload)initWithFeedback:(id)a3;
- (_CPLateSectionsAppendedFeedback)lateSectionsAppendedFeedback;
- (_CPLookupHintRelevancyFeedback)lookupHintRelevancyFeedback;
- (_CPMapsCardSectionEngagementFeedback)mapsCardSectionEngagementFeedback;
- (_CPProcessableFeedback)codable;
- (_CPRankingFeedback)rankingFeedback;
- (_CPResultEngagementFeedback)resultEngagementFeedback;
- (_CPResultFeedback)resultFeedback;
- (_CPResultGradingFeedback)resultGradingFeedback;
- (_CPResultRankingFeedback)resultRankingFeedback;
- (_CPResultsReceivedAfterTimeoutFeedback)resultsReceivedAfterTimeoutFeedback;
- (_CPSearchViewAppearFeedback)searchViewAppearFeedback;
- (_CPSearchViewDisappearFeedback)searchViewDisappearFeedback;
- (_CPSectionEngagementFeedback)sectionEngagementFeedback;
- (_CPSectionRankingFeedback)sectionRankingFeedback;
- (_CPSessionEndFeedback)sessionEndFeedback;
- (_CPSessionMissingResultsFeedback)sessionMissingResultsFeedback;
- (_CPSessionMissingSuggestionsFeedback)sessionMissingSuggestionsFeedback;
- (_CPSkipSearchFeedback)skipSearchFeedback;
- (_CPStartLocalSearchFeedback)startLocalSearchFeedback;
- (_CPStartNetworkSearchFeedback)startNetworkSearchFeedback;
- (_CPStartSearchFeedback)startSearchFeedback;
- (_CPStoreCardSectionEngagementFeedback)storeCardSectionEngagementFeedback;
- (_CPSuggestionEngagementFeedback)suggestionEngagementFeedback;
- (_CPVisibleResultsFeedback)visibleResultsFeedback;
- (_CPVisibleSectionHeaderFeedback)visibleSectionHeaderFeedback;
- (_CPVisibleSuggestionsFeedback)visibleSuggestionsFeedback;
- (int)type;
- (unint64_t)hash;
- (unint64_t)queryId;
- (unint64_t)whichContained_Feedback;
- (void)clearContained_Feedback;
- (void)setCacheHitFeedback:(id)a3;
- (void)setCardSectionEngagementFeedback:(id)a3;
- (void)setCardSectionFeedback:(id)a3;
- (void)setCardViewAppearFeedback:(id)a3;
- (void)setCardViewDisappearFeedback:(id)a3;
- (void)setCbaEngagementFeedback:(id)a3;
- (void)setClearInputFeedback:(id)a3;
- (void)setClientTimingFeedback:(id)a3;
- (void)setCommandEngagementFeedback:(id)a3;
- (void)setConnectionInvalidatedFeedback:(id)a3;
- (void)setCustomFeedback:(id)a3;
- (void)setDidGoToSearchFeedback:(id)a3;
- (void)setDidGoToSiteFeedback:(id)a3;
- (void)setDynamicButtonVisibilityFeedback:(id)a3;
- (void)setEndLocalSearchFeedback:(id)a3;
- (void)setEndNetworkSearchFeedback:(id)a3;
- (void)setEndSearchFeedback:(id)a3;
- (void)setErrorFeedback:(id)a3;
- (void)setExperimentTriggeredFeedback:(id)a3;
- (void)setFeedback:(id)a3;
- (void)setLateSectionsAppendedFeedback:(id)a3;
- (void)setLookupHintRelevancyFeedback:(id)a3;
- (void)setMapsCardSectionEngagementFeedback:(id)a3;
- (void)setQueryId:(unint64_t)a3;
- (void)setRankingFeedback:(id)a3;
- (void)setResultEngagementFeedback:(id)a3;
- (void)setResultFeedback:(id)a3;
- (void)setResultGradingFeedback:(id)a3;
- (void)setResultRankingFeedback:(id)a3;
- (void)setResultsReceivedAfterTimeoutFeedback:(id)a3;
- (void)setSearchViewAppearFeedback:(id)a3;
- (void)setSearchViewDisappearFeedback:(id)a3;
- (void)setSectionEngagementFeedback:(id)a3;
- (void)setSectionRankingFeedback:(id)a3;
- (void)setSessionEndFeedback:(id)a3;
- (void)setSessionMissingResultsFeedback:(id)a3;
- (void)setSessionMissingSuggestionsFeedback:(id)a3;
- (void)setSkipSearchFeedback:(id)a3;
- (void)setStartLocalSearchFeedback:(id)a3;
- (void)setStartNetworkSearchFeedback:(id)a3;
- (void)setStartSearchFeedback:(id)a3;
- (void)setStoreCardSectionEngagementFeedback:(id)a3;
- (void)setSuggestionEngagementFeedback:(id)a3;
- (void)setVisibleResultsFeedback:(id)a3;
- (void)setVisibleSectionHeaderFeedback:(id)a3;
- (void)setVisibleSuggestionsFeedback:(id)a3;
- (void)updateQueryId:(unint64_t)a3;
- (void)updateResults:(id)a3 withId:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation _CPFeedbackPayload

- (_CPProcessableFeedback)codable
{
  feedback = self->_feedback;
  if (feedback) {
    goto LABEL_46;
  }
  feedback = self->_searchViewAppearFeedback;
  if (feedback) {
    goto LABEL_46;
  }
  feedback = self->_searchViewDisappearFeedback;
  if (feedback) {
    goto LABEL_46;
  }
  feedback = self->_rankingFeedback;
  if (feedback) {
    goto LABEL_46;
  }
  feedback = self->_sectionRankingFeedback;
  if (feedback) {
    goto LABEL_46;
  }
  feedback = self->_resultRankingFeedback;
  if (feedback) {
    goto LABEL_46;
  }
  feedback = self->_resultFeedback;
  if (feedback) {
    goto LABEL_46;
  }
  feedback = self->_resultEngagementFeedback;
  if (feedback) {
    goto LABEL_46;
  }
  feedback = self->_visibleResultsFeedback;
  if (feedback) {
    goto LABEL_46;
  }
  feedback = self->_cardSectionFeedback;
  if (feedback) {
    goto LABEL_46;
  }
  feedback = self->_mapsCardSectionEngagementFeedback;
  if (feedback) {
    goto LABEL_46;
  }
  feedback = self->_storeCardSectionEngagementFeedback;
  if (feedback) {
    goto LABEL_46;
  }
  feedback = self->_startSearchFeedback;
  if (feedback) {
    goto LABEL_46;
  }
  feedback = self->_endSearchFeedback;
  if (feedback) {
    goto LABEL_46;
  }
  feedback = self->_startNetworkSearchFeedback;
  if (feedback) {
    goto LABEL_46;
  }
  feedback = self->_endNetworkSearchFeedback;
  if (feedback) {
    goto LABEL_46;
  }
  feedback = self->_startLocalSearchFeedback;
  if (feedback) {
    goto LABEL_46;
  }
  feedback = self->_endLocalSearchFeedback;
  if (feedback) {
    goto LABEL_46;
  }
  feedback = self->_errorFeedback;
  if (feedback) {
    goto LABEL_46;
  }
  feedback = self->_customFeedback;
  if (feedback) {
    goto LABEL_46;
  }
  feedback = self->_suggestionEngagementFeedback;
  if (feedback) {
    goto LABEL_46;
  }
  feedback = self->_cardViewDisappearFeedback;
  if (feedback) {
    goto LABEL_46;
  }
  feedback = self->_visibleSuggestionsFeedback;
  if (feedback) {
    goto LABEL_46;
  }
  feedback = self->_resultsReceivedAfterTimeoutFeedback;
  if (feedback) {
    goto LABEL_46;
  }
  feedback = self->_lateSectionsAppendedFeedback;
  if (feedback) {
    goto LABEL_46;
  }
  feedback = self->_clearInputFeedback;
  if (feedback) {
    goto LABEL_46;
  }
  feedback = self->_sectionEngagementFeedback;
  if (feedback) {
    goto LABEL_46;
  }
  feedback = self->_visibleSectionHeaderFeedback;
  if (feedback) {
    goto LABEL_46;
  }
  feedback = self->_didGoToSiteFeedback;
  if (feedback) {
    goto LABEL_46;
  }
  feedback = self->_didGoToSearchFeedback;
  if (feedback) {
    goto LABEL_46;
  }
  feedback = self->_sessionMissingResultsFeedback;
  if (feedback) {
    goto LABEL_46;
  }
  feedback = self->_sessionMissingSuggestionsFeedback;
  if (feedback) {
    goto LABEL_46;
  }
  feedback = self->_resultGradingFeedback;
  if (feedback) {
    goto LABEL_46;
  }
  feedback = self->_lookupHintRelevancyFeedback;
  if (feedback) {
    goto LABEL_46;
  }
  feedback = self->_connectionInvalidatedFeedback;
  if (feedback) {
    goto LABEL_46;
  }
  feedback = self->_cardSectionEngagementFeedback;
  if (feedback) {
    goto LABEL_46;
  }
  feedback = self->_sessionEndFeedback;
  if (feedback) {
    goto LABEL_46;
  }
  feedback = self->_cardViewAppearFeedback;
  if (feedback
    || (feedback = self->_skipSearchFeedback) != 0
    || (feedback = self->_cacheHitFeedback) != 0
    || (feedback = self->_cbaEngagementFeedback) != 0
    || (feedback = self->_clientTimingFeedback) != 0
    || (feedback = self->_commandEngagementFeedback) != 0
    || (feedback = self->_dynamicButtonVisibilityFeedback) != 0
    || (feedback = self->_experimentTriggeredFeedback) != 0)
  {
LABEL_46:
    id v3 = feedback;
  }
  else
  {
    id v3 = 0;
  }

  return (_CPProcessableFeedback *)v3;
}

- (void)writeTo:(id)a3
{
  a3;
  v4 = [(_CPFeedbackPayload *)self feedback];

  if (v4)
  {
    v5 = [(_CPFeedbackPayload *)self feedback];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(_CPFeedbackPayload *)self searchViewAppearFeedback];

  if (v6)
  {
    v7 = [(_CPFeedbackPayload *)self searchViewAppearFeedback];
    PBDataWriterWriteSubmessage();
  }
  v8 = [(_CPFeedbackPayload *)self searchViewDisappearFeedback];

  if (v8)
  {
    v9 = [(_CPFeedbackPayload *)self searchViewDisappearFeedback];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(_CPFeedbackPayload *)self rankingFeedback];

  if (v10)
  {
    v11 = [(_CPFeedbackPayload *)self rankingFeedback];
    PBDataWriterWriteSubmessage();
  }
  v12 = [(_CPFeedbackPayload *)self sectionRankingFeedback];

  if (v12)
  {
    v13 = [(_CPFeedbackPayload *)self sectionRankingFeedback];
    PBDataWriterWriteSubmessage();
  }
  v14 = [(_CPFeedbackPayload *)self resultRankingFeedback];

  if (v14)
  {
    v15 = [(_CPFeedbackPayload *)self resultRankingFeedback];
    PBDataWriterWriteSubmessage();
  }
  v16 = [(_CPFeedbackPayload *)self resultFeedback];

  if (v16)
  {
    v17 = [(_CPFeedbackPayload *)self resultFeedback];
    PBDataWriterWriteSubmessage();
  }
  v18 = [(_CPFeedbackPayload *)self resultEngagementFeedback];

  if (v18)
  {
    v19 = [(_CPFeedbackPayload *)self resultEngagementFeedback];
    PBDataWriterWriteSubmessage();
  }
  v20 = [(_CPFeedbackPayload *)self visibleResultsFeedback];

  if (v20)
  {
    v21 = [(_CPFeedbackPayload *)self visibleResultsFeedback];
    PBDataWriterWriteSubmessage();
  }
  v22 = [(_CPFeedbackPayload *)self cardSectionFeedback];

  if (v22)
  {
    v23 = [(_CPFeedbackPayload *)self cardSectionFeedback];
    PBDataWriterWriteSubmessage();
  }
  v24 = [(_CPFeedbackPayload *)self mapsCardSectionEngagementFeedback];

  if (v24)
  {
    v25 = [(_CPFeedbackPayload *)self mapsCardSectionEngagementFeedback];
    PBDataWriterWriteSubmessage();
  }
  v26 = [(_CPFeedbackPayload *)self storeCardSectionEngagementFeedback];

  if (v26)
  {
    v27 = [(_CPFeedbackPayload *)self storeCardSectionEngagementFeedback];
    PBDataWriterWriteSubmessage();
  }
  v28 = [(_CPFeedbackPayload *)self startSearchFeedback];

  if (v28)
  {
    v29 = [(_CPFeedbackPayload *)self startSearchFeedback];
    PBDataWriterWriteSubmessage();
  }
  v30 = [(_CPFeedbackPayload *)self endSearchFeedback];

  if (v30)
  {
    v31 = [(_CPFeedbackPayload *)self endSearchFeedback];
    PBDataWriterWriteSubmessage();
  }
  v32 = [(_CPFeedbackPayload *)self startNetworkSearchFeedback];

  if (v32)
  {
    v33 = [(_CPFeedbackPayload *)self startNetworkSearchFeedback];
    PBDataWriterWriteSubmessage();
  }
  v34 = [(_CPFeedbackPayload *)self endNetworkSearchFeedback];

  if (v34)
  {
    v35 = [(_CPFeedbackPayload *)self endNetworkSearchFeedback];
    PBDataWriterWriteSubmessage();
  }
  v36 = [(_CPFeedbackPayload *)self startLocalSearchFeedback];

  if (v36)
  {
    v37 = [(_CPFeedbackPayload *)self startLocalSearchFeedback];
    PBDataWriterWriteSubmessage();
  }
  v38 = [(_CPFeedbackPayload *)self endLocalSearchFeedback];

  if (v38)
  {
    v39 = [(_CPFeedbackPayload *)self endLocalSearchFeedback];
    PBDataWriterWriteSubmessage();
  }
  v40 = [(_CPFeedbackPayload *)self errorFeedback];

  if (v40)
  {
    v41 = [(_CPFeedbackPayload *)self errorFeedback];
    PBDataWriterWriteSubmessage();
  }
  v42 = [(_CPFeedbackPayload *)self customFeedback];

  if (v42)
  {
    v43 = [(_CPFeedbackPayload *)self customFeedback];
    PBDataWriterWriteSubmessage();
  }
  v44 = [(_CPFeedbackPayload *)self suggestionEngagementFeedback];

  if (v44)
  {
    v45 = [(_CPFeedbackPayload *)self suggestionEngagementFeedback];
    PBDataWriterWriteSubmessage();
  }
  v46 = [(_CPFeedbackPayload *)self cardViewDisappearFeedback];

  if (v46)
  {
    v47 = [(_CPFeedbackPayload *)self cardViewDisappearFeedback];
    PBDataWriterWriteSubmessage();
  }
  v48 = [(_CPFeedbackPayload *)self visibleSuggestionsFeedback];

  if (v48)
  {
    v49 = [(_CPFeedbackPayload *)self visibleSuggestionsFeedback];
    PBDataWriterWriteSubmessage();
  }
  v50 = [(_CPFeedbackPayload *)self resultsReceivedAfterTimeoutFeedback];

  if (v50)
  {
    v51 = [(_CPFeedbackPayload *)self resultsReceivedAfterTimeoutFeedback];
    PBDataWriterWriteSubmessage();
  }
  v52 = [(_CPFeedbackPayload *)self lateSectionsAppendedFeedback];

  if (v52)
  {
    v53 = [(_CPFeedbackPayload *)self lateSectionsAppendedFeedback];
    PBDataWriterWriteSubmessage();
  }
  v54 = [(_CPFeedbackPayload *)self clearInputFeedback];

  if (v54)
  {
    v55 = [(_CPFeedbackPayload *)self clearInputFeedback];
    PBDataWriterWriteSubmessage();
  }
  v56 = [(_CPFeedbackPayload *)self sectionEngagementFeedback];

  if (v56)
  {
    v57 = [(_CPFeedbackPayload *)self sectionEngagementFeedback];
    PBDataWriterWriteSubmessage();
  }
  v58 = [(_CPFeedbackPayload *)self visibleSectionHeaderFeedback];

  if (v58)
  {
    v59 = [(_CPFeedbackPayload *)self visibleSectionHeaderFeedback];
    PBDataWriterWriteSubmessage();
  }
  v60 = [(_CPFeedbackPayload *)self didGoToSiteFeedback];

  if (v60)
  {
    v61 = [(_CPFeedbackPayload *)self didGoToSiteFeedback];
    PBDataWriterWriteSubmessage();
  }
  v62 = [(_CPFeedbackPayload *)self didGoToSearchFeedback];

  if (v62)
  {
    v63 = [(_CPFeedbackPayload *)self didGoToSearchFeedback];
    PBDataWriterWriteSubmessage();
  }
  v64 = [(_CPFeedbackPayload *)self sessionMissingResultsFeedback];

  if (v64)
  {
    v65 = [(_CPFeedbackPayload *)self sessionMissingResultsFeedback];
    PBDataWriterWriteSubmessage();
  }
  v66 = [(_CPFeedbackPayload *)self sessionMissingSuggestionsFeedback];

  if (v66)
  {
    v67 = [(_CPFeedbackPayload *)self sessionMissingSuggestionsFeedback];
    PBDataWriterWriteSubmessage();
  }
  v68 = [(_CPFeedbackPayload *)self resultGradingFeedback];

  if (v68)
  {
    v69 = [(_CPFeedbackPayload *)self resultGradingFeedback];
    PBDataWriterWriteSubmessage();
  }
  v70 = [(_CPFeedbackPayload *)self lookupHintRelevancyFeedback];

  if (v70)
  {
    v71 = [(_CPFeedbackPayload *)self lookupHintRelevancyFeedback];
    PBDataWriterWriteSubmessage();
  }
  v72 = [(_CPFeedbackPayload *)self connectionInvalidatedFeedback];

  if (v72)
  {
    v73 = [(_CPFeedbackPayload *)self connectionInvalidatedFeedback];
    PBDataWriterWriteSubmessage();
  }
  v74 = [(_CPFeedbackPayload *)self cardSectionEngagementFeedback];

  if (v74)
  {
    v75 = [(_CPFeedbackPayload *)self cardSectionEngagementFeedback];
    PBDataWriterWriteSubmessage();
  }
  v76 = [(_CPFeedbackPayload *)self sessionEndFeedback];

  if (v76)
  {
    v77 = [(_CPFeedbackPayload *)self sessionEndFeedback];
    PBDataWriterWriteSubmessage();
  }
  v78 = [(_CPFeedbackPayload *)self cardViewAppearFeedback];

  if (v78)
  {
    v79 = [(_CPFeedbackPayload *)self cardViewAppearFeedback];
    PBDataWriterWriteSubmessage();
  }
  v80 = [(_CPFeedbackPayload *)self skipSearchFeedback];

  if (v80)
  {
    v81 = [(_CPFeedbackPayload *)self skipSearchFeedback];
    PBDataWriterWriteSubmessage();
  }
  v82 = [(_CPFeedbackPayload *)self cacheHitFeedback];

  if (v82)
  {
    v83 = [(_CPFeedbackPayload *)self cacheHitFeedback];
    PBDataWriterWriteSubmessage();
  }
  v84 = [(_CPFeedbackPayload *)self cbaEngagementFeedback];

  if (v84)
  {
    v85 = [(_CPFeedbackPayload *)self cbaEngagementFeedback];
    PBDataWriterWriteSubmessage();
  }
  v86 = [(_CPFeedbackPayload *)self clientTimingFeedback];

  if (v86)
  {
    v87 = [(_CPFeedbackPayload *)self clientTimingFeedback];
    PBDataWriterWriteSubmessage();
  }
  v88 = [(_CPFeedbackPayload *)self commandEngagementFeedback];

  if (v88)
  {
    v89 = [(_CPFeedbackPayload *)self commandEngagementFeedback];
    PBDataWriterWriteSubmessage();
  }
  v90 = [(_CPFeedbackPayload *)self dynamicButtonVisibilityFeedback];

  if (v90)
  {
    v91 = [(_CPFeedbackPayload *)self dynamicButtonVisibilityFeedback];
    PBDataWriterWriteSubmessage();
  }
  v92 = [(_CPFeedbackPayload *)self experimentTriggeredFeedback];

  if (v92)
  {
    v93 = [(_CPFeedbackPayload *)self experimentTriggeredFeedback];
    PBDataWriterWriteSubmessage();
  }
  if ([(_CPFeedbackPayload *)self queryId]) {
    PBDataWriterWriteUint64Field();
  }

  MEMORY[0x1F4181820]();
}

- (_CPSearchViewAppearFeedback)searchViewAppearFeedback
{
  if (self->_whichContained_Feedback == 2) {
    v2 = self->_searchViewAppearFeedback;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_experimentTriggeredFeedback, 0);
  objc_storeStrong((id *)&self->_dynamicButtonVisibilityFeedback, 0);
  objc_storeStrong((id *)&self->_commandEngagementFeedback, 0);
  objc_storeStrong((id *)&self->_clientTimingFeedback, 0);
  objc_storeStrong((id *)&self->_cbaEngagementFeedback, 0);
  objc_storeStrong((id *)&self->_cacheHitFeedback, 0);
  objc_storeStrong((id *)&self->_skipSearchFeedback, 0);
  objc_storeStrong((id *)&self->_cardViewAppearFeedback, 0);
  objc_storeStrong((id *)&self->_sessionEndFeedback, 0);
  objc_storeStrong((id *)&self->_cardSectionEngagementFeedback, 0);
  objc_storeStrong((id *)&self->_connectionInvalidatedFeedback, 0);
  objc_storeStrong((id *)&self->_lookupHintRelevancyFeedback, 0);
  objc_storeStrong((id *)&self->_resultGradingFeedback, 0);
  objc_storeStrong((id *)&self->_sessionMissingSuggestionsFeedback, 0);
  objc_storeStrong((id *)&self->_sessionMissingResultsFeedback, 0);
  objc_storeStrong((id *)&self->_didGoToSearchFeedback, 0);
  objc_storeStrong((id *)&self->_didGoToSiteFeedback, 0);
  objc_storeStrong((id *)&self->_visibleSectionHeaderFeedback, 0);
  objc_storeStrong((id *)&self->_sectionEngagementFeedback, 0);
  objc_storeStrong((id *)&self->_clearInputFeedback, 0);
  objc_storeStrong((id *)&self->_lateSectionsAppendedFeedback, 0);
  objc_storeStrong((id *)&self->_resultsReceivedAfterTimeoutFeedback, 0);
  objc_storeStrong((id *)&self->_visibleSuggestionsFeedback, 0);
  objc_storeStrong((id *)&self->_cardViewDisappearFeedback, 0);
  objc_storeStrong((id *)&self->_suggestionEngagementFeedback, 0);
  objc_storeStrong((id *)&self->_customFeedback, 0);
  objc_storeStrong((id *)&self->_errorFeedback, 0);
  objc_storeStrong((id *)&self->_endLocalSearchFeedback, 0);
  objc_storeStrong((id *)&self->_startLocalSearchFeedback, 0);
  objc_storeStrong((id *)&self->_endNetworkSearchFeedback, 0);
  objc_storeStrong((id *)&self->_startNetworkSearchFeedback, 0);
  objc_storeStrong((id *)&self->_endSearchFeedback, 0);
  objc_storeStrong((id *)&self->_startSearchFeedback, 0);
  objc_storeStrong((id *)&self->_storeCardSectionEngagementFeedback, 0);
  objc_storeStrong((id *)&self->_mapsCardSectionEngagementFeedback, 0);
  objc_storeStrong((id *)&self->_cardSectionFeedback, 0);
  objc_storeStrong((id *)&self->_visibleResultsFeedback, 0);
  objc_storeStrong((id *)&self->_resultEngagementFeedback, 0);
  objc_storeStrong((id *)&self->_resultFeedback, 0);
  objc_storeStrong((id *)&self->_resultRankingFeedback, 0);
  objc_storeStrong((id *)&self->_sectionRankingFeedback, 0);
  objc_storeStrong((id *)&self->_rankingFeedback, 0);
  objc_storeStrong((id *)&self->_searchViewDisappearFeedback, 0);
  objc_storeStrong((id *)&self->_searchViewAppearFeedback, 0);

  objc_storeStrong((id *)&self->_feedback, 0);
}

- (_CPVisibleSuggestionsFeedback)visibleSuggestionsFeedback
{
  if (self->_whichContained_Feedback == 23) {
    v2 = self->_visibleSuggestionsFeedback;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (_CPVisibleSectionHeaderFeedback)visibleSectionHeaderFeedback
{
  if (self->_whichContained_Feedback == 28) {
    v2 = self->_visibleSectionHeaderFeedback;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (_CPVisibleResultsFeedback)visibleResultsFeedback
{
  if (self->_whichContained_Feedback == 9) {
    v2 = self->_visibleResultsFeedback;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (_CPSuggestionEngagementFeedback)suggestionEngagementFeedback
{
  if (self->_whichContained_Feedback == 21) {
    v2 = self->_suggestionEngagementFeedback;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (_CPStoreCardSectionEngagementFeedback)storeCardSectionEngagementFeedback
{
  if (self->_whichContained_Feedback == 12) {
    v2 = self->_storeCardSectionEngagementFeedback;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (_CPStartSearchFeedback)startSearchFeedback
{
  if (self->_whichContained_Feedback == 13) {
    v2 = self->_startSearchFeedback;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (_CPStartNetworkSearchFeedback)startNetworkSearchFeedback
{
  if (self->_whichContained_Feedback == 15) {
    v2 = self->_startNetworkSearchFeedback;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (_CPStartLocalSearchFeedback)startLocalSearchFeedback
{
  if (self->_whichContained_Feedback == 17) {
    v2 = self->_startLocalSearchFeedback;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (_CPSkipSearchFeedback)skipSearchFeedback
{
  if (self->_whichContained_Feedback == 39) {
    v2 = self->_skipSearchFeedback;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (_CPSessionMissingSuggestionsFeedback)sessionMissingSuggestionsFeedback
{
  if (self->_whichContained_Feedback == 32) {
    v2 = self->_sessionMissingSuggestionsFeedback;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (_CPSessionMissingResultsFeedback)sessionMissingResultsFeedback
{
  if (self->_whichContained_Feedback == 31) {
    v2 = self->_sessionMissingResultsFeedback;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (_CPSessionEndFeedback)sessionEndFeedback
{
  if (self->_whichContained_Feedback == 37) {
    v2 = self->_sessionEndFeedback;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (_CPSectionRankingFeedback)sectionRankingFeedback
{
  if (self->_whichContained_Feedback == 5) {
    v2 = self->_sectionRankingFeedback;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (_CPSectionEngagementFeedback)sectionEngagementFeedback
{
  if (self->_whichContained_Feedback == 27) {
    v2 = self->_sectionEngagementFeedback;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (_CPSearchViewDisappearFeedback)searchViewDisappearFeedback
{
  if (self->_whichContained_Feedback == 3) {
    v2 = self->_searchViewDisappearFeedback;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (_CPResultsReceivedAfterTimeoutFeedback)resultsReceivedAfterTimeoutFeedback
{
  if (self->_whichContained_Feedback == 24) {
    v2 = self->_resultsReceivedAfterTimeoutFeedback;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (_CPResultRankingFeedback)resultRankingFeedback
{
  if (self->_whichContained_Feedback == 6) {
    v2 = self->_resultRankingFeedback;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (_CPResultGradingFeedback)resultGradingFeedback
{
  if (self->_whichContained_Feedback == 33) {
    v2 = self->_resultGradingFeedback;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (_CPResultFeedback)resultFeedback
{
  if (self->_whichContained_Feedback == 7) {
    v2 = self->_resultFeedback;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (_CPResultEngagementFeedback)resultEngagementFeedback
{
  if (self->_whichContained_Feedback == 8) {
    v2 = self->_resultEngagementFeedback;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (_CPRankingFeedback)rankingFeedback
{
  if (self->_whichContained_Feedback == 4) {
    v2 = self->_rankingFeedback;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (unint64_t)queryId
{
  return self->_queryId;
}

- (_CPMapsCardSectionEngagementFeedback)mapsCardSectionEngagementFeedback
{
  if (self->_whichContained_Feedback == 11) {
    v2 = self->_mapsCardSectionEngagementFeedback;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (_CPLookupHintRelevancyFeedback)lookupHintRelevancyFeedback
{
  if (self->_whichContained_Feedback == 34) {
    v2 = self->_lookupHintRelevancyFeedback;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (_CPLateSectionsAppendedFeedback)lateSectionsAppendedFeedback
{
  if (self->_whichContained_Feedback == 25) {
    v2 = self->_lateSectionsAppendedFeedback;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (_CPFeedback)feedback
{
  if (self->_whichContained_Feedback == 1) {
    v2 = self->_feedback;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (_CPExperimentTriggeredFeedback)experimentTriggeredFeedback
{
  if (self->_whichContained_Feedback == 45) {
    v2 = self->_experimentTriggeredFeedback;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (_CPErrorFeedback)errorFeedback
{
  if (self->_whichContained_Feedback == 19) {
    v2 = self->_errorFeedback;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (_CPEndSearchFeedback)endSearchFeedback
{
  if (self->_whichContained_Feedback == 14) {
    v2 = self->_endSearchFeedback;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (_CPEndNetworkSearchFeedback)endNetworkSearchFeedback
{
  if (self->_whichContained_Feedback == 16) {
    v2 = self->_endNetworkSearchFeedback;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (_CPEndLocalSearchFeedback)endLocalSearchFeedback
{
  if (self->_whichContained_Feedback == 18) {
    v2 = self->_endLocalSearchFeedback;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (_CPDynamicButtonVisibilityFeedback)dynamicButtonVisibilityFeedback
{
  if (self->_whichContained_Feedback == 44) {
    v2 = self->_dynamicButtonVisibilityFeedback;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (_CPDidGoToSiteFeedback)didGoToSiteFeedback
{
  if (self->_whichContained_Feedback == 29) {
    v2 = self->_didGoToSiteFeedback;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (_CPDidGoToSearchFeedback)didGoToSearchFeedback
{
  if (self->_whichContained_Feedback == 30) {
    v2 = self->_didGoToSearchFeedback;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (_CPCustomFeedback)customFeedback
{
  if (self->_whichContained_Feedback == 20) {
    v2 = self->_customFeedback;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (_CPConnectionInvalidatedFeedback)connectionInvalidatedFeedback
{
  if (self->_whichContained_Feedback == 35) {
    v2 = self->_connectionInvalidatedFeedback;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (_CPCommandEngagementFeedback)commandEngagementFeedback
{
  if (self->_whichContained_Feedback == 43) {
    v2 = self->_commandEngagementFeedback;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (_CPClientTimingFeedback)clientTimingFeedback
{
  if (self->_whichContained_Feedback == 42) {
    v2 = self->_clientTimingFeedback;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (_CPClearInputFeedback)clearInputFeedback
{
  if (self->_whichContained_Feedback == 26) {
    v2 = self->_clearInputFeedback;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (_CPCBAEngagementFeedback)cbaEngagementFeedback
{
  if (self->_whichContained_Feedback == 41) {
    v2 = self->_cbaEngagementFeedback;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (_CPCardViewDisappearFeedback)cardViewDisappearFeedback
{
  if (self->_whichContained_Feedback == 22) {
    v2 = self->_cardViewDisappearFeedback;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (_CPCardViewAppearFeedback)cardViewAppearFeedback
{
  if (self->_whichContained_Feedback == 38) {
    v2 = self->_cardViewAppearFeedback;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (_CPCardSectionFeedback)cardSectionFeedback
{
  if (self->_whichContained_Feedback == 10) {
    v2 = self->_cardSectionFeedback;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (_CPCardSectionEngagementFeedback)cardSectionEngagementFeedback
{
  if (self->_whichContained_Feedback == 36) {
    v2 = self->_cardSectionEngagementFeedback;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (_CPCacheHitFeedback)cacheHitFeedback
{
  if (self->_whichContained_Feedback == 40) {
    v2 = self->_cacheHitFeedback;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (int)type
{
  return [(_CPFeedbackPayload *)self whichContained_Feedback] - 1;
}

- (unint64_t)whichContained_Feedback
{
  return self->_whichContained_Feedback;
}

- (BOOL)readFrom:(id)a3
{
  return _CPFeedbackPayloadReadFrom(self, (uint64_t)a3);
}

- (void)setQueryId:(unint64_t)a3
{
  self->_queryId = a3;
}

- (_CPFeedbackPayload)initWithFeedback:(id)a3
{
  id v4 = a3;
  v84.receiver = self;
  v84.super_class = (Class)_CPFeedbackPayload;
  v5 = [(_CPFeedbackPayload *)&v84 init];

  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    if (v6 == objc_opt_class())
    {
      v7 = [[_CPFeedback alloc] initWithFacade:v4];
      [(_CPFeedbackPayload *)v5 setFeedback:v7];
    }
    uint64_t v8 = objc_opt_class();
    if (v8 == objc_opt_class())
    {
      v9 = [[_CPSearchViewAppearFeedback alloc] initWithFacade:v4];
      [(_CPFeedbackPayload *)v5 setSearchViewAppearFeedback:v9];
    }
    uint64_t v10 = objc_opt_class();
    if (v10 == objc_opt_class())
    {
      v11 = [[_CPSearchViewDisappearFeedback alloc] initWithFacade:v4];
      [(_CPFeedbackPayload *)v5 setSearchViewDisappearFeedback:v11];
    }
    uint64_t v12 = objc_opt_class();
    if (v12 == objc_opt_class())
    {
      v13 = [[_CPRankingFeedback alloc] initWithFacade:v4];
      [(_CPFeedbackPayload *)v5 setRankingFeedback:v13];
    }
    uint64_t v14 = objc_opt_class();
    if (v14 == objc_opt_class())
    {
      v15 = [[_CPSectionRankingFeedback alloc] initWithFacade:v4];
      [(_CPFeedbackPayload *)v5 setSectionRankingFeedback:v15];
    }
    uint64_t v16 = objc_opt_class();
    if (v16 == objc_opt_class())
    {
      v17 = [[_CPResultRankingFeedback alloc] initWithFacade:v4];
      [(_CPFeedbackPayload *)v5 setResultRankingFeedback:v17];
    }
    uint64_t v18 = objc_opt_class();
    if (v18 == objc_opt_class())
    {
      v19 = [[_CPResultFeedback alloc] initWithFacade:v4];
      [(_CPFeedbackPayload *)v5 setResultFeedback:v19];
    }
    uint64_t v20 = objc_opt_class();
    if (v20 == objc_opt_class())
    {
      v21 = [[_CPResultEngagementFeedback alloc] initWithFacade:v4];
      [(_CPFeedbackPayload *)v5 setResultEngagementFeedback:v21];
    }
    uint64_t v22 = objc_opt_class();
    if (v22 == objc_opt_class())
    {
      v23 = [[_CPVisibleResultsFeedback alloc] initWithFacade:v4];
      [(_CPFeedbackPayload *)v5 setVisibleResultsFeedback:v23];
    }
    uint64_t v24 = objc_opt_class();
    if (v24 == objc_opt_class())
    {
      v25 = [[_CPCardSectionFeedback alloc] initWithFacade:v4];
      [(_CPFeedbackPayload *)v5 setCardSectionFeedback:v25];
    }
    uint64_t v26 = objc_opt_class();
    if (v26 == objc_opt_class())
    {
      v27 = [[_CPMapsCardSectionEngagementFeedback alloc] initWithFacade:v4];
      [(_CPFeedbackPayload *)v5 setMapsCardSectionEngagementFeedback:v27];
    }
    uint64_t v28 = objc_opt_class();
    if (v28 == objc_opt_class())
    {
      v29 = [[_CPStoreCardSectionEngagementFeedback alloc] initWithFacade:v4];
      [(_CPFeedbackPayload *)v5 setStoreCardSectionEngagementFeedback:v29];
    }
    uint64_t v30 = objc_opt_class();
    if (v30 == objc_opt_class())
    {
      v31 = [[_CPStartSearchFeedback alloc] initWithFacade:v4];
      [(_CPFeedbackPayload *)v5 setStartSearchFeedback:v31];
    }
    uint64_t v32 = objc_opt_class();
    if (v32 == objc_opt_class())
    {
      v33 = [[_CPEndSearchFeedback alloc] initWithFacade:v4];
      [(_CPFeedbackPayload *)v5 setEndSearchFeedback:v33];
    }
    uint64_t v34 = objc_opt_class();
    if (v34 == objc_opt_class())
    {
      v35 = [[_CPStartNetworkSearchFeedback alloc] initWithFacade:v4];
      [(_CPFeedbackPayload *)v5 setStartNetworkSearchFeedback:v35];
    }
    uint64_t v36 = objc_opt_class();
    if (v36 == objc_opt_class())
    {
      v37 = [[_CPEndNetworkSearchFeedback alloc] initWithFacade:v4];
      [(_CPFeedbackPayload *)v5 setEndNetworkSearchFeedback:v37];
    }
    uint64_t v38 = objc_opt_class();
    if (v38 == objc_opt_class())
    {
      v39 = [[_CPStartLocalSearchFeedback alloc] initWithFacade:v4];
      [(_CPFeedbackPayload *)v5 setStartLocalSearchFeedback:v39];
    }
    uint64_t v40 = objc_opt_class();
    if (v40 == objc_opt_class())
    {
      v41 = [[_CPEndLocalSearchFeedback alloc] initWithFacade:v4];
      [(_CPFeedbackPayload *)v5 setEndLocalSearchFeedback:v41];
    }
    uint64_t v42 = objc_opt_class();
    if (v42 == objc_opt_class())
    {
      v43 = [[_CPErrorFeedback alloc] initWithFacade:v4];
      [(_CPFeedbackPayload *)v5 setErrorFeedback:v43];
    }
    uint64_t v44 = objc_opt_class();
    if (v44 == objc_opt_class())
    {
      v45 = [[_CPCustomFeedback alloc] initWithFacade:v4];
      [(_CPFeedbackPayload *)v5 setCustomFeedback:v45];
    }
    uint64_t v46 = objc_opt_class();
    if (v46 == objc_opt_class())
    {
      v47 = [[_CPSuggestionEngagementFeedback alloc] initWithFacade:v4];
      [(_CPFeedbackPayload *)v5 setSuggestionEngagementFeedback:v47];
    }
    uint64_t v48 = objc_opt_class();
    if (v48 == objc_opt_class())
    {
      v49 = [[_CPCardViewDisappearFeedback alloc] initWithFacade:v4];
      [(_CPFeedbackPayload *)v5 setCardViewDisappearFeedback:v49];
    }
    uint64_t v50 = objc_opt_class();
    if (v50 == objc_opt_class())
    {
      v51 = [[_CPVisibleSuggestionsFeedback alloc] initWithFacade:v4];
      [(_CPFeedbackPayload *)v5 setVisibleSuggestionsFeedback:v51];
    }
    uint64_t v52 = objc_opt_class();
    if (v52 == objc_opt_class())
    {
      v53 = [[_CPResultsReceivedAfterTimeoutFeedback alloc] initWithFacade:v4];
      [(_CPFeedbackPayload *)v5 setResultsReceivedAfterTimeoutFeedback:v53];
    }
    uint64_t v54 = objc_opt_class();
    if (v54 == objc_opt_class())
    {
      v55 = [[_CPLateSectionsAppendedFeedback alloc] initWithFacade:v4];
      [(_CPFeedbackPayload *)v5 setLateSectionsAppendedFeedback:v55];
    }
    uint64_t v56 = objc_opt_class();
    if (v56 == objc_opt_class())
    {
      v57 = [[_CPClearInputFeedback alloc] initWithFacade:v4];
      [(_CPFeedbackPayload *)v5 setClearInputFeedback:v57];
    }
    uint64_t v58 = objc_opt_class();
    if (v58 == objc_opt_class())
    {
      v59 = [[_CPSectionEngagementFeedback alloc] initWithFacade:v4];
      [(_CPFeedbackPayload *)v5 setSectionEngagementFeedback:v59];
    }
    uint64_t v60 = objc_opt_class();
    if (v60 == objc_opt_class())
    {
      v61 = [[_CPVisibleSectionHeaderFeedback alloc] initWithFacade:v4];
      [(_CPFeedbackPayload *)v5 setVisibleSectionHeaderFeedback:v61];
    }
    uint64_t v62 = objc_opt_class();
    if (v62 == objc_opt_class())
    {
      v63 = [[_CPDidGoToSiteFeedback alloc] initWithFacade:v4];
      [(_CPFeedbackPayload *)v5 setDidGoToSiteFeedback:v63];
    }
    uint64_t v64 = objc_opt_class();
    if (v64 == objc_opt_class())
    {
      v65 = [[_CPDidGoToSearchFeedback alloc] initWithFacade:v4];
      [(_CPFeedbackPayload *)v5 setDidGoToSearchFeedback:v65];
    }
    uint64_t v66 = objc_opt_class();
    if (v66 == objc_opt_class())
    {
      v67 = [[_CPResultGradingFeedback alloc] initWithFacade:v4];
      [(_CPFeedbackPayload *)v5 setResultGradingFeedback:v67];
    }
    uint64_t v68 = objc_opt_class();
    if (v68 == objc_opt_class())
    {
      v69 = [[_CPLookupHintRelevancyFeedback alloc] initWithFacade:v4];
      [(_CPFeedbackPayload *)v5 setLookupHintRelevancyFeedback:v69];
    }
    uint64_t v70 = objc_opt_class();
    if (v70 == objc_opt_class())
    {
      v71 = [[_CPCardSectionEngagementFeedback alloc] initWithFacade:v4];
      [(_CPFeedbackPayload *)v5 setCardSectionEngagementFeedback:v71];
    }
    uint64_t v72 = objc_opt_class();
    if (v72 == objc_opt_class())
    {
      v73 = [[_CPCardViewAppearFeedback alloc] initWithFacade:v4];
      [(_CPFeedbackPayload *)v5 setCardViewAppearFeedback:v73];
    }
    uint64_t v74 = objc_opt_class();
    if (v74 == objc_opt_class())
    {
      v75 = [[_CPClientTimingFeedback alloc] initWithFacade:v4];
      [(_CPFeedbackPayload *)v5 setClientTimingFeedback:v75];
    }
    uint64_t v76 = objc_opt_class();
    if (v76 == objc_opt_class())
    {
      v77 = [[_CPCommandEngagementFeedback alloc] initWithFacade:v4];
      [(_CPFeedbackPayload *)v5 setCommandEngagementFeedback:v77];
    }
    uint64_t v78 = objc_opt_class();
    if (v78 == objc_opt_class())
    {
      v79 = [[_CPDynamicButtonVisibilityFeedback alloc] initWithFacade:v4];
      [(_CPFeedbackPayload *)v5 setDynamicButtonVisibilityFeedback:v79];
    }
    uint64_t v80 = objc_opt_class();
    if (v80 == objc_opt_class())
    {
      v81 = [[_CPExperimentTriggeredFeedback alloc] initWithFacade:v4];
      [(_CPFeedbackPayload *)v5 setExperimentTriggeredFeedback:v81];
    }
    v82 = v5;
  }

  return v5;
}

- (_CPFeedbackPayload)initWithCodable:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_CPFeedbackPayload;
  v5 = [(_CPFeedbackPayload *)&v8 init];

  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(_CPFeedbackPayload *)v5 setFeedback:v4];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(_CPFeedbackPayload *)v5 setSearchViewAppearFeedback:v4];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(_CPFeedbackPayload *)v5 setSearchViewDisappearFeedback:v4];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(_CPFeedbackPayload *)v5 setRankingFeedback:v4];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(_CPFeedbackPayload *)v5 setSectionRankingFeedback:v4];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(_CPFeedbackPayload *)v5 setResultRankingFeedback:v4];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(_CPFeedbackPayload *)v5 setResultFeedback:v4];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(_CPFeedbackPayload *)v5 setResultEngagementFeedback:v4];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(_CPFeedbackPayload *)v5 setVisibleResultsFeedback:v4];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(_CPFeedbackPayload *)v5 setCardSectionFeedback:v4];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(_CPFeedbackPayload *)v5 setMapsCardSectionEngagementFeedback:v4];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(_CPFeedbackPayload *)v5 setStoreCardSectionEngagementFeedback:v4];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(_CPFeedbackPayload *)v5 setStartSearchFeedback:v4];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(_CPFeedbackPayload *)v5 setEndSearchFeedback:v4];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(_CPFeedbackPayload *)v5 setStartNetworkSearchFeedback:v4];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(_CPFeedbackPayload *)v5 setEndNetworkSearchFeedback:v4];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(_CPFeedbackPayload *)v5 setStartLocalSearchFeedback:v4];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(_CPFeedbackPayload *)v5 setEndLocalSearchFeedback:v4];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(_CPFeedbackPayload *)v5 setErrorFeedback:v4];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(_CPFeedbackPayload *)v5 setCustomFeedback:v4];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(_CPFeedbackPayload *)v5 setSuggestionEngagementFeedback:v4];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(_CPFeedbackPayload *)v5 setCardViewDisappearFeedback:v4];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(_CPFeedbackPayload *)v5 setVisibleSuggestionsFeedback:v4];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(_CPFeedbackPayload *)v5 setResultsReceivedAfterTimeoutFeedback:v4];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(_CPFeedbackPayload *)v5 setLateSectionsAppendedFeedback:v4];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(_CPFeedbackPayload *)v5 setClearInputFeedback:v4];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(_CPFeedbackPayload *)v5 setSectionEngagementFeedback:v4];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(_CPFeedbackPayload *)v5 setVisibleSectionHeaderFeedback:v4];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(_CPFeedbackPayload *)v5 setDidGoToSiteFeedback:v4];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(_CPFeedbackPayload *)v5 setDidGoToSearchFeedback:v4];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(_CPFeedbackPayload *)v5 setSessionMissingResultsFeedback:v4];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(_CPFeedbackPayload *)v5 setSessionMissingSuggestionsFeedback:v4];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(_CPFeedbackPayload *)v5 setResultGradingFeedback:v4];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(_CPFeedbackPayload *)v5 setLookupHintRelevancyFeedback:v4];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(_CPFeedbackPayload *)v5 setConnectionInvalidatedFeedback:v4];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(_CPFeedbackPayload *)v5 setCardSectionEngagementFeedback:v4];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(_CPFeedbackPayload *)v5 setSessionEndFeedback:v4];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(_CPFeedbackPayload *)v5 setCardViewAppearFeedback:v4];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(_CPFeedbackPayload *)v5 setSkipSearchFeedback:v4];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(_CPFeedbackPayload *)v5 setCacheHitFeedback:v4];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(_CPFeedbackPayload *)v5 setCbaEngagementFeedback:v4];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(_CPFeedbackPayload *)v5 setClientTimingFeedback:v4];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(_CPFeedbackPayload *)v5 setCommandEngagementFeedback:v4];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(_CPFeedbackPayload *)v5 setDynamicButtonVisibilityFeedback:v4];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(_CPFeedbackPayload *)v5 setExperimentTriggeredFeedback:v4];
    }
    uint64_t v6 = v5;
  }

  return v5;
}

- (void)setSearchViewAppearFeedback:(id)a3
{
  id v4 = (_CPSearchViewAppearFeedback *)a3;
  [(_CPFeedbackPayload *)self clearContained_Feedback];
  self->_whichContained_Feedback = 2 * (v4 != 0);
  searchViewAppearFeedback = self->_searchViewAppearFeedback;
  self->_searchViewAppearFeedback = v4;
}

- (void)clearContained_Feedback
{
  self->_whichContained_Feedback = 0;
  feedback = self->_feedback;
  self->_feedback = 0;

  searchViewAppearFeedback = self->_searchViewAppearFeedback;
  self->_searchViewAppearFeedback = 0;

  searchViewDisappearFeedback = self->_searchViewDisappearFeedback;
  self->_searchViewDisappearFeedback = 0;

  rankingFeedback = self->_rankingFeedback;
  self->_rankingFeedback = 0;

  sectionRankingFeedback = self->_sectionRankingFeedback;
  self->_sectionRankingFeedback = 0;

  resultRankingFeedback = self->_resultRankingFeedback;
  self->_resultRankingFeedback = 0;

  resultFeedback = self->_resultFeedback;
  self->_resultFeedback = 0;

  resultEngagementFeedback = self->_resultEngagementFeedback;
  self->_resultEngagementFeedback = 0;

  visibleResultsFeedback = self->_visibleResultsFeedback;
  self->_visibleResultsFeedback = 0;

  cardSectionFeedback = self->_cardSectionFeedback;
  self->_cardSectionFeedback = 0;

  mapsCardSectionEngagementFeedback = self->_mapsCardSectionEngagementFeedback;
  self->_mapsCardSectionEngagementFeedback = 0;

  storeCardSectionEngagementFeedback = self->_storeCardSectionEngagementFeedback;
  self->_storeCardSectionEngagementFeedback = 0;

  startSearchFeedback = self->_startSearchFeedback;
  self->_startSearchFeedback = 0;

  endSearchFeedback = self->_endSearchFeedback;
  self->_endSearchFeedback = 0;

  startNetworkSearchFeedback = self->_startNetworkSearchFeedback;
  self->_startNetworkSearchFeedback = 0;

  endNetworkSearchFeedback = self->_endNetworkSearchFeedback;
  self->_endNetworkSearchFeedback = 0;

  startLocalSearchFeedback = self->_startLocalSearchFeedback;
  self->_startLocalSearchFeedback = 0;

  endLocalSearchFeedback = self->_endLocalSearchFeedback;
  self->_endLocalSearchFeedback = 0;

  errorFeedback = self->_errorFeedback;
  self->_errorFeedback = 0;

  customFeedback = self->_customFeedback;
  self->_customFeedback = 0;

  suggestionEngagementFeedback = self->_suggestionEngagementFeedback;
  self->_suggestionEngagementFeedback = 0;

  cardViewDisappearFeedback = self->_cardViewDisappearFeedback;
  self->_cardViewDisappearFeedback = 0;

  visibleSuggestionsFeedback = self->_visibleSuggestionsFeedback;
  self->_visibleSuggestionsFeedback = 0;

  resultsReceivedAfterTimeoutFeedback = self->_resultsReceivedAfterTimeoutFeedback;
  self->_resultsReceivedAfterTimeoutFeedback = 0;

  lateSectionsAppendedFeedback = self->_lateSectionsAppendedFeedback;
  self->_lateSectionsAppendedFeedback = 0;

  clearInputFeedback = self->_clearInputFeedback;
  self->_clearInputFeedback = 0;

  sectionEngagementFeedback = self->_sectionEngagementFeedback;
  self->_sectionEngagementFeedback = 0;

  visibleSectionHeaderFeedback = self->_visibleSectionHeaderFeedback;
  self->_visibleSectionHeaderFeedback = 0;

  didGoToSiteFeedback = self->_didGoToSiteFeedback;
  self->_didGoToSiteFeedback = 0;

  didGoToSearchFeedback = self->_didGoToSearchFeedback;
  self->_didGoToSearchFeedback = 0;

  sessionMissingResultsFeedback = self->_sessionMissingResultsFeedback;
  self->_sessionMissingResultsFeedback = 0;

  sessionMissingSuggestionsFeedback = self->_sessionMissingSuggestionsFeedback;
  self->_sessionMissingSuggestionsFeedback = 0;

  resultGradingFeedback = self->_resultGradingFeedback;
  self->_resultGradingFeedback = 0;

  lookupHintRelevancyFeedback = self->_lookupHintRelevancyFeedback;
  self->_lookupHintRelevancyFeedback = 0;

  connectionInvalidatedFeedback = self->_connectionInvalidatedFeedback;
  self->_connectionInvalidatedFeedback = 0;

  cardSectionEngagementFeedback = self->_cardSectionEngagementFeedback;
  self->_cardSectionEngagementFeedback = 0;

  sessionEndFeedback = self->_sessionEndFeedback;
  self->_sessionEndFeedback = 0;

  cardViewAppearFeedback = self->_cardViewAppearFeedback;
  self->_cardViewAppearFeedback = 0;

  skipSearchFeedback = self->_skipSearchFeedback;
  self->_skipSearchFeedback = 0;

  cacheHitFeedback = self->_cacheHitFeedback;
  self->_cacheHitFeedback = 0;

  cbaEngagementFeedback = self->_cbaEngagementFeedback;
  self->_cbaEngagementFeedback = 0;

  clientTimingFeedback = self->_clientTimingFeedback;
  self->_clientTimingFeedback = 0;

  commandEngagementFeedback = self->_commandEngagementFeedback;
  self->_commandEngagementFeedback = 0;

  dynamicButtonVisibilityFeedback = self->_dynamicButtonVisibilityFeedback;
  self->_dynamicButtonVisibilityFeedback = 0;

  experimentTriggeredFeedback = self->_experimentTriggeredFeedback;
  self->_experimentTriggeredFeedback = 0;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_CPFeedback *)self->_feedback hash];
  unint64_t v4 = [(_CPSearchViewAppearFeedback *)self->_searchViewAppearFeedback hash] ^ v3;
  unint64_t v5 = [(_CPSearchViewDisappearFeedback *)self->_searchViewDisappearFeedback hash];
  unint64_t v6 = v4 ^ v5 ^ [(_CPRankingFeedback *)self->_rankingFeedback hash];
  unint64_t v7 = [(_CPSectionRankingFeedback *)self->_sectionRankingFeedback hash];
  unint64_t v8 = v7 ^ [(_CPResultRankingFeedback *)self->_resultRankingFeedback hash];
  unint64_t v9 = v6 ^ v8 ^ [(_CPResultFeedback *)self->_resultFeedback hash];
  unint64_t v10 = [(_CPResultEngagementFeedback *)self->_resultEngagementFeedback hash];
  unint64_t v11 = v10 ^ [(_CPVisibleResultsFeedback *)self->_visibleResultsFeedback hash];
  unint64_t v12 = v11 ^ [(_CPCardSectionFeedback *)self->_cardSectionFeedback hash];
  unint64_t v13 = v9 ^ v12 ^ [(_CPMapsCardSectionEngagementFeedback *)self->_mapsCardSectionEngagementFeedback hash];
  unint64_t v14 = [(_CPStoreCardSectionEngagementFeedback *)self->_storeCardSectionEngagementFeedback hash];
  unint64_t v15 = v14 ^ [(_CPStartSearchFeedback *)self->_startSearchFeedback hash];
  unint64_t v16 = v15 ^ [(_CPEndSearchFeedback *)self->_endSearchFeedback hash];
  unint64_t v17 = v16 ^ [(_CPStartNetworkSearchFeedback *)self->_startNetworkSearchFeedback hash];
  unint64_t v18 = v13 ^ v17 ^ [(_CPEndNetworkSearchFeedback *)self->_endNetworkSearchFeedback hash];
  unint64_t v19 = [(_CPStartLocalSearchFeedback *)self->_startLocalSearchFeedback hash];
  unint64_t v20 = v19 ^ [(_CPEndLocalSearchFeedback *)self->_endLocalSearchFeedback hash];
  unint64_t v21 = v20 ^ [(_CPErrorFeedback *)self->_errorFeedback hash];
  unint64_t v22 = v21 ^ [(_CPCustomFeedback *)self->_customFeedback hash];
  unint64_t v23 = v22 ^ [(_CPSuggestionEngagementFeedback *)self->_suggestionEngagementFeedback hash];
  unint64_t v24 = v18 ^ v23 ^ [(_CPCardViewDisappearFeedback *)self->_cardViewDisappearFeedback hash];
  unint64_t v25 = [(_CPVisibleSuggestionsFeedback *)self->_visibleSuggestionsFeedback hash];
  unint64_t v26 = v25 ^ [(_CPResultsReceivedAfterTimeoutFeedback *)self->_resultsReceivedAfterTimeoutFeedback hash];
  unint64_t v27 = v26 ^ [(_CPLateSectionsAppendedFeedback *)self->_lateSectionsAppendedFeedback hash];
  unint64_t v28 = v27 ^ [(_CPClearInputFeedback *)self->_clearInputFeedback hash];
  unint64_t v29 = v28 ^ [(_CPSectionEngagementFeedback *)self->_sectionEngagementFeedback hash];
  unint64_t v30 = v29 ^ [(_CPVisibleSectionHeaderFeedback *)self->_visibleSectionHeaderFeedback hash];
  unint64_t v31 = v24 ^ v30 ^ [(_CPDidGoToSiteFeedback *)self->_didGoToSiteFeedback hash];
  unint64_t v32 = [(_CPDidGoToSearchFeedback *)self->_didGoToSearchFeedback hash];
  unint64_t v33 = v32 ^ [(_CPSessionMissingResultsFeedback *)self->_sessionMissingResultsFeedback hash];
  unint64_t v34 = v33 ^ [(_CPSessionMissingSuggestionsFeedback *)self->_sessionMissingSuggestionsFeedback hash];
  unint64_t v35 = v34 ^ [(_CPResultGradingFeedback *)self->_resultGradingFeedback hash];
  unint64_t v36 = v35 ^ [(_CPLookupHintRelevancyFeedback *)self->_lookupHintRelevancyFeedback hash];
  unint64_t v37 = v36 ^ [(_CPConnectionInvalidatedFeedback *)self->_connectionInvalidatedFeedback hash];
  unint64_t v38 = v37 ^ [(_CPCardSectionEngagementFeedback *)self->_cardSectionEngagementFeedback hash];
  unint64_t v39 = v31 ^ v38 ^ [(_CPSessionEndFeedback *)self->_sessionEndFeedback hash];
  unint64_t v40 = [(_CPCardViewAppearFeedback *)self->_cardViewAppearFeedback hash];
  unint64_t v41 = v40 ^ [(_CPSkipSearchFeedback *)self->_skipSearchFeedback hash];
  unint64_t v42 = v41 ^ [(_CPCacheHitFeedback *)self->_cacheHitFeedback hash];
  unint64_t v43 = v42 ^ [(_CPCBAEngagementFeedback *)self->_cbaEngagementFeedback hash];
  unint64_t v44 = v43 ^ [(_CPClientTimingFeedback *)self->_clientTimingFeedback hash];
  unint64_t v45 = v44 ^ [(_CPCommandEngagementFeedback *)self->_commandEngagementFeedback hash];
  unint64_t v46 = v45 ^ [(_CPDynamicButtonVisibilityFeedback *)self->_dynamicButtonVisibilityFeedback hash];
  return v39 ^ v46 ^ [(_CPExperimentTriggeredFeedback *)self->_experimentTriggeredFeedback hash] ^ (2654435761u * self->_queryId);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_227;
  }
  unint64_t v5 = [(_CPFeedbackPayload *)self feedback];
  unint64_t v6 = [v4 feedback];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_226;
  }
  uint64_t v7 = [(_CPFeedbackPayload *)self feedback];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    unint64_t v9 = [(_CPFeedbackPayload *)self feedback];
    unint64_t v10 = [v4 feedback];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_227;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_CPFeedbackPayload *)self searchViewAppearFeedback];
  unint64_t v6 = [v4 searchViewAppearFeedback];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_226;
  }
  uint64_t v12 = [(_CPFeedbackPayload *)self searchViewAppearFeedback];
  if (v12)
  {
    unint64_t v13 = (void *)v12;
    unint64_t v14 = [(_CPFeedbackPayload *)self searchViewAppearFeedback];
    unint64_t v15 = [v4 searchViewAppearFeedback];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_227;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_CPFeedbackPayload *)self searchViewDisappearFeedback];
  unint64_t v6 = [v4 searchViewDisappearFeedback];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_226;
  }
  uint64_t v17 = [(_CPFeedbackPayload *)self searchViewDisappearFeedback];
  if (v17)
  {
    unint64_t v18 = (void *)v17;
    unint64_t v19 = [(_CPFeedbackPayload *)self searchViewDisappearFeedback];
    unint64_t v20 = [v4 searchViewDisappearFeedback];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_227;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_CPFeedbackPayload *)self rankingFeedback];
  unint64_t v6 = [v4 rankingFeedback];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_226;
  }
  uint64_t v22 = [(_CPFeedbackPayload *)self rankingFeedback];
  if (v22)
  {
    unint64_t v23 = (void *)v22;
    unint64_t v24 = [(_CPFeedbackPayload *)self rankingFeedback];
    unint64_t v25 = [v4 rankingFeedback];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_227;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_CPFeedbackPayload *)self sectionRankingFeedback];
  unint64_t v6 = [v4 sectionRankingFeedback];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_226;
  }
  uint64_t v27 = [(_CPFeedbackPayload *)self sectionRankingFeedback];
  if (v27)
  {
    unint64_t v28 = (void *)v27;
    unint64_t v29 = [(_CPFeedbackPayload *)self sectionRankingFeedback];
    unint64_t v30 = [v4 sectionRankingFeedback];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_227;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_CPFeedbackPayload *)self resultRankingFeedback];
  unint64_t v6 = [v4 resultRankingFeedback];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_226;
  }
  uint64_t v32 = [(_CPFeedbackPayload *)self resultRankingFeedback];
  if (v32)
  {
    unint64_t v33 = (void *)v32;
    unint64_t v34 = [(_CPFeedbackPayload *)self resultRankingFeedback];
    unint64_t v35 = [v4 resultRankingFeedback];
    int v36 = [v34 isEqual:v35];

    if (!v36) {
      goto LABEL_227;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_CPFeedbackPayload *)self resultFeedback];
  unint64_t v6 = [v4 resultFeedback];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_226;
  }
  uint64_t v37 = [(_CPFeedbackPayload *)self resultFeedback];
  if (v37)
  {
    unint64_t v38 = (void *)v37;
    unint64_t v39 = [(_CPFeedbackPayload *)self resultFeedback];
    unint64_t v40 = [v4 resultFeedback];
    int v41 = [v39 isEqual:v40];

    if (!v41) {
      goto LABEL_227;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_CPFeedbackPayload *)self resultEngagementFeedback];
  unint64_t v6 = [v4 resultEngagementFeedback];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_226;
  }
  uint64_t v42 = [(_CPFeedbackPayload *)self resultEngagementFeedback];
  if (v42)
  {
    unint64_t v43 = (void *)v42;
    unint64_t v44 = [(_CPFeedbackPayload *)self resultEngagementFeedback];
    unint64_t v45 = [v4 resultEngagementFeedback];
    int v46 = [v44 isEqual:v45];

    if (!v46) {
      goto LABEL_227;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_CPFeedbackPayload *)self visibleResultsFeedback];
  unint64_t v6 = [v4 visibleResultsFeedback];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_226;
  }
  uint64_t v47 = [(_CPFeedbackPayload *)self visibleResultsFeedback];
  if (v47)
  {
    uint64_t v48 = (void *)v47;
    v49 = [(_CPFeedbackPayload *)self visibleResultsFeedback];
    uint64_t v50 = [v4 visibleResultsFeedback];
    int v51 = [v49 isEqual:v50];

    if (!v51) {
      goto LABEL_227;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_CPFeedbackPayload *)self cardSectionFeedback];
  unint64_t v6 = [v4 cardSectionFeedback];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_226;
  }
  uint64_t v52 = [(_CPFeedbackPayload *)self cardSectionFeedback];
  if (v52)
  {
    v53 = (void *)v52;
    uint64_t v54 = [(_CPFeedbackPayload *)self cardSectionFeedback];
    v55 = [v4 cardSectionFeedback];
    int v56 = [v54 isEqual:v55];

    if (!v56) {
      goto LABEL_227;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_CPFeedbackPayload *)self mapsCardSectionEngagementFeedback];
  unint64_t v6 = [v4 mapsCardSectionEngagementFeedback];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_226;
  }
  uint64_t v57 = [(_CPFeedbackPayload *)self mapsCardSectionEngagementFeedback];
  if (v57)
  {
    uint64_t v58 = (void *)v57;
    v59 = [(_CPFeedbackPayload *)self mapsCardSectionEngagementFeedback];
    uint64_t v60 = [v4 mapsCardSectionEngagementFeedback];
    int v61 = [v59 isEqual:v60];

    if (!v61) {
      goto LABEL_227;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_CPFeedbackPayload *)self storeCardSectionEngagementFeedback];
  unint64_t v6 = [v4 storeCardSectionEngagementFeedback];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_226;
  }
  uint64_t v62 = [(_CPFeedbackPayload *)self storeCardSectionEngagementFeedback];
  if (v62)
  {
    v63 = (void *)v62;
    uint64_t v64 = [(_CPFeedbackPayload *)self storeCardSectionEngagementFeedback];
    v65 = [v4 storeCardSectionEngagementFeedback];
    int v66 = [v64 isEqual:v65];

    if (!v66) {
      goto LABEL_227;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_CPFeedbackPayload *)self startSearchFeedback];
  unint64_t v6 = [v4 startSearchFeedback];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_226;
  }
  uint64_t v67 = [(_CPFeedbackPayload *)self startSearchFeedback];
  if (v67)
  {
    uint64_t v68 = (void *)v67;
    v69 = [(_CPFeedbackPayload *)self startSearchFeedback];
    uint64_t v70 = [v4 startSearchFeedback];
    int v71 = [v69 isEqual:v70];

    if (!v71) {
      goto LABEL_227;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_CPFeedbackPayload *)self endSearchFeedback];
  unint64_t v6 = [v4 endSearchFeedback];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_226;
  }
  uint64_t v72 = [(_CPFeedbackPayload *)self endSearchFeedback];
  if (v72)
  {
    v73 = (void *)v72;
    uint64_t v74 = [(_CPFeedbackPayload *)self endSearchFeedback];
    v75 = [v4 endSearchFeedback];
    int v76 = [v74 isEqual:v75];

    if (!v76) {
      goto LABEL_227;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_CPFeedbackPayload *)self startNetworkSearchFeedback];
  unint64_t v6 = [v4 startNetworkSearchFeedback];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_226;
  }
  uint64_t v77 = [(_CPFeedbackPayload *)self startNetworkSearchFeedback];
  if (v77)
  {
    uint64_t v78 = (void *)v77;
    v79 = [(_CPFeedbackPayload *)self startNetworkSearchFeedback];
    uint64_t v80 = [v4 startNetworkSearchFeedback];
    int v81 = [v79 isEqual:v80];

    if (!v81) {
      goto LABEL_227;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_CPFeedbackPayload *)self endNetworkSearchFeedback];
  unint64_t v6 = [v4 endNetworkSearchFeedback];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_226;
  }
  uint64_t v82 = [(_CPFeedbackPayload *)self endNetworkSearchFeedback];
  if (v82)
  {
    v83 = (void *)v82;
    objc_super v84 = [(_CPFeedbackPayload *)self endNetworkSearchFeedback];
    v85 = [v4 endNetworkSearchFeedback];
    int v86 = [v84 isEqual:v85];

    if (!v86) {
      goto LABEL_227;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_CPFeedbackPayload *)self startLocalSearchFeedback];
  unint64_t v6 = [v4 startLocalSearchFeedback];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_226;
  }
  uint64_t v87 = [(_CPFeedbackPayload *)self startLocalSearchFeedback];
  if (v87)
  {
    v88 = (void *)v87;
    v89 = [(_CPFeedbackPayload *)self startLocalSearchFeedback];
    v90 = [v4 startLocalSearchFeedback];
    int v91 = [v89 isEqual:v90];

    if (!v91) {
      goto LABEL_227;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_CPFeedbackPayload *)self endLocalSearchFeedback];
  unint64_t v6 = [v4 endLocalSearchFeedback];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_226;
  }
  uint64_t v92 = [(_CPFeedbackPayload *)self endLocalSearchFeedback];
  if (v92)
  {
    v93 = (void *)v92;
    v94 = [(_CPFeedbackPayload *)self endLocalSearchFeedback];
    v95 = [v4 endLocalSearchFeedback];
    int v96 = [v94 isEqual:v95];

    if (!v96) {
      goto LABEL_227;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_CPFeedbackPayload *)self errorFeedback];
  unint64_t v6 = [v4 errorFeedback];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_226;
  }
  uint64_t v97 = [(_CPFeedbackPayload *)self errorFeedback];
  if (v97)
  {
    v98 = (void *)v97;
    v99 = [(_CPFeedbackPayload *)self errorFeedback];
    v100 = [v4 errorFeedback];
    int v101 = [v99 isEqual:v100];

    if (!v101) {
      goto LABEL_227;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_CPFeedbackPayload *)self customFeedback];
  unint64_t v6 = [v4 customFeedback];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_226;
  }
  uint64_t v102 = [(_CPFeedbackPayload *)self customFeedback];
  if (v102)
  {
    v103 = (void *)v102;
    v104 = [(_CPFeedbackPayload *)self customFeedback];
    v105 = [v4 customFeedback];
    int v106 = [v104 isEqual:v105];

    if (!v106) {
      goto LABEL_227;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_CPFeedbackPayload *)self suggestionEngagementFeedback];
  unint64_t v6 = [v4 suggestionEngagementFeedback];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_226;
  }
  uint64_t v107 = [(_CPFeedbackPayload *)self suggestionEngagementFeedback];
  if (v107)
  {
    v108 = (void *)v107;
    v109 = [(_CPFeedbackPayload *)self suggestionEngagementFeedback];
    v110 = [v4 suggestionEngagementFeedback];
    int v111 = [v109 isEqual:v110];

    if (!v111) {
      goto LABEL_227;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_CPFeedbackPayload *)self cardViewDisappearFeedback];
  unint64_t v6 = [v4 cardViewDisappearFeedback];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_226;
  }
  uint64_t v112 = [(_CPFeedbackPayload *)self cardViewDisappearFeedback];
  if (v112)
  {
    v113 = (void *)v112;
    v114 = [(_CPFeedbackPayload *)self cardViewDisappearFeedback];
    v115 = [v4 cardViewDisappearFeedback];
    int v116 = [v114 isEqual:v115];

    if (!v116) {
      goto LABEL_227;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_CPFeedbackPayload *)self visibleSuggestionsFeedback];
  unint64_t v6 = [v4 visibleSuggestionsFeedback];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_226;
  }
  uint64_t v117 = [(_CPFeedbackPayload *)self visibleSuggestionsFeedback];
  if (v117)
  {
    v118 = (void *)v117;
    v119 = [(_CPFeedbackPayload *)self visibleSuggestionsFeedback];
    v120 = [v4 visibleSuggestionsFeedback];
    int v121 = [v119 isEqual:v120];

    if (!v121) {
      goto LABEL_227;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_CPFeedbackPayload *)self resultsReceivedAfterTimeoutFeedback];
  unint64_t v6 = [v4 resultsReceivedAfterTimeoutFeedback];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_226;
  }
  uint64_t v122 = [(_CPFeedbackPayload *)self resultsReceivedAfterTimeoutFeedback];
  if (v122)
  {
    v123 = (void *)v122;
    v124 = [(_CPFeedbackPayload *)self resultsReceivedAfterTimeoutFeedback];
    v125 = [v4 resultsReceivedAfterTimeoutFeedback];
    int v126 = [v124 isEqual:v125];

    if (!v126) {
      goto LABEL_227;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_CPFeedbackPayload *)self lateSectionsAppendedFeedback];
  unint64_t v6 = [v4 lateSectionsAppendedFeedback];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_226;
  }
  uint64_t v127 = [(_CPFeedbackPayload *)self lateSectionsAppendedFeedback];
  if (v127)
  {
    v128 = (void *)v127;
    v129 = [(_CPFeedbackPayload *)self lateSectionsAppendedFeedback];
    v130 = [v4 lateSectionsAppendedFeedback];
    int v131 = [v129 isEqual:v130];

    if (!v131) {
      goto LABEL_227;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_CPFeedbackPayload *)self clearInputFeedback];
  unint64_t v6 = [v4 clearInputFeedback];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_226;
  }
  uint64_t v132 = [(_CPFeedbackPayload *)self clearInputFeedback];
  if (v132)
  {
    v133 = (void *)v132;
    v134 = [(_CPFeedbackPayload *)self clearInputFeedback];
    v135 = [v4 clearInputFeedback];
    int v136 = [v134 isEqual:v135];

    if (!v136) {
      goto LABEL_227;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_CPFeedbackPayload *)self sectionEngagementFeedback];
  unint64_t v6 = [v4 sectionEngagementFeedback];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_226;
  }
  uint64_t v137 = [(_CPFeedbackPayload *)self sectionEngagementFeedback];
  if (v137)
  {
    v138 = (void *)v137;
    v139 = [(_CPFeedbackPayload *)self sectionEngagementFeedback];
    v140 = [v4 sectionEngagementFeedback];
    int v141 = [v139 isEqual:v140];

    if (!v141) {
      goto LABEL_227;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_CPFeedbackPayload *)self visibleSectionHeaderFeedback];
  unint64_t v6 = [v4 visibleSectionHeaderFeedback];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_226;
  }
  uint64_t v142 = [(_CPFeedbackPayload *)self visibleSectionHeaderFeedback];
  if (v142)
  {
    v143 = (void *)v142;
    v144 = [(_CPFeedbackPayload *)self visibleSectionHeaderFeedback];
    v145 = [v4 visibleSectionHeaderFeedback];
    int v146 = [v144 isEqual:v145];

    if (!v146) {
      goto LABEL_227;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_CPFeedbackPayload *)self didGoToSiteFeedback];
  unint64_t v6 = [v4 didGoToSiteFeedback];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_226;
  }
  uint64_t v147 = [(_CPFeedbackPayload *)self didGoToSiteFeedback];
  if (v147)
  {
    v148 = (void *)v147;
    v149 = [(_CPFeedbackPayload *)self didGoToSiteFeedback];
    v150 = [v4 didGoToSiteFeedback];
    int v151 = [v149 isEqual:v150];

    if (!v151) {
      goto LABEL_227;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_CPFeedbackPayload *)self didGoToSearchFeedback];
  unint64_t v6 = [v4 didGoToSearchFeedback];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_226;
  }
  uint64_t v152 = [(_CPFeedbackPayload *)self didGoToSearchFeedback];
  if (v152)
  {
    v153 = (void *)v152;
    v154 = [(_CPFeedbackPayload *)self didGoToSearchFeedback];
    v155 = [v4 didGoToSearchFeedback];
    int v156 = [v154 isEqual:v155];

    if (!v156) {
      goto LABEL_227;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_CPFeedbackPayload *)self sessionMissingResultsFeedback];
  unint64_t v6 = [v4 sessionMissingResultsFeedback];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_226;
  }
  uint64_t v157 = [(_CPFeedbackPayload *)self sessionMissingResultsFeedback];
  if (v157)
  {
    v158 = (void *)v157;
    v159 = [(_CPFeedbackPayload *)self sessionMissingResultsFeedback];
    v160 = [v4 sessionMissingResultsFeedback];
    int v161 = [v159 isEqual:v160];

    if (!v161) {
      goto LABEL_227;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_CPFeedbackPayload *)self sessionMissingSuggestionsFeedback];
  unint64_t v6 = [v4 sessionMissingSuggestionsFeedback];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_226;
  }
  uint64_t v162 = [(_CPFeedbackPayload *)self sessionMissingSuggestionsFeedback];
  if (v162)
  {
    v163 = (void *)v162;
    v164 = [(_CPFeedbackPayload *)self sessionMissingSuggestionsFeedback];
    v165 = [v4 sessionMissingSuggestionsFeedback];
    int v166 = [v164 isEqual:v165];

    if (!v166) {
      goto LABEL_227;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_CPFeedbackPayload *)self resultGradingFeedback];
  unint64_t v6 = [v4 resultGradingFeedback];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_226;
  }
  uint64_t v167 = [(_CPFeedbackPayload *)self resultGradingFeedback];
  if (v167)
  {
    v168 = (void *)v167;
    v169 = [(_CPFeedbackPayload *)self resultGradingFeedback];
    v170 = [v4 resultGradingFeedback];
    int v171 = [v169 isEqual:v170];

    if (!v171) {
      goto LABEL_227;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_CPFeedbackPayload *)self lookupHintRelevancyFeedback];
  unint64_t v6 = [v4 lookupHintRelevancyFeedback];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_226;
  }
  uint64_t v172 = [(_CPFeedbackPayload *)self lookupHintRelevancyFeedback];
  if (v172)
  {
    v173 = (void *)v172;
    v174 = [(_CPFeedbackPayload *)self lookupHintRelevancyFeedback];
    v175 = [v4 lookupHintRelevancyFeedback];
    int v176 = [v174 isEqual:v175];

    if (!v176) {
      goto LABEL_227;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_CPFeedbackPayload *)self connectionInvalidatedFeedback];
  unint64_t v6 = [v4 connectionInvalidatedFeedback];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_226;
  }
  uint64_t v177 = [(_CPFeedbackPayload *)self connectionInvalidatedFeedback];
  if (v177)
  {
    v178 = (void *)v177;
    v179 = [(_CPFeedbackPayload *)self connectionInvalidatedFeedback];
    v180 = [v4 connectionInvalidatedFeedback];
    int v181 = [v179 isEqual:v180];

    if (!v181) {
      goto LABEL_227;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_CPFeedbackPayload *)self cardSectionEngagementFeedback];
  unint64_t v6 = [v4 cardSectionEngagementFeedback];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_226;
  }
  uint64_t v182 = [(_CPFeedbackPayload *)self cardSectionEngagementFeedback];
  if (v182)
  {
    v183 = (void *)v182;
    v184 = [(_CPFeedbackPayload *)self cardSectionEngagementFeedback];
    v185 = [v4 cardSectionEngagementFeedback];
    int v186 = [v184 isEqual:v185];

    if (!v186) {
      goto LABEL_227;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_CPFeedbackPayload *)self sessionEndFeedback];
  unint64_t v6 = [v4 sessionEndFeedback];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_226;
  }
  uint64_t v187 = [(_CPFeedbackPayload *)self sessionEndFeedback];
  if (v187)
  {
    v188 = (void *)v187;
    v189 = [(_CPFeedbackPayload *)self sessionEndFeedback];
    v190 = [v4 sessionEndFeedback];
    int v191 = [v189 isEqual:v190];

    if (!v191) {
      goto LABEL_227;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_CPFeedbackPayload *)self cardViewAppearFeedback];
  unint64_t v6 = [v4 cardViewAppearFeedback];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_226;
  }
  uint64_t v192 = [(_CPFeedbackPayload *)self cardViewAppearFeedback];
  if (v192)
  {
    v193 = (void *)v192;
    v194 = [(_CPFeedbackPayload *)self cardViewAppearFeedback];
    v195 = [v4 cardViewAppearFeedback];
    int v196 = [v194 isEqual:v195];

    if (!v196) {
      goto LABEL_227;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_CPFeedbackPayload *)self skipSearchFeedback];
  unint64_t v6 = [v4 skipSearchFeedback];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_226;
  }
  uint64_t v197 = [(_CPFeedbackPayload *)self skipSearchFeedback];
  if (v197)
  {
    v198 = (void *)v197;
    v199 = [(_CPFeedbackPayload *)self skipSearchFeedback];
    v200 = [v4 skipSearchFeedback];
    int v201 = [v199 isEqual:v200];

    if (!v201) {
      goto LABEL_227;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_CPFeedbackPayload *)self cacheHitFeedback];
  unint64_t v6 = [v4 cacheHitFeedback];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_226;
  }
  uint64_t v202 = [(_CPFeedbackPayload *)self cacheHitFeedback];
  if (v202)
  {
    v203 = (void *)v202;
    v204 = [(_CPFeedbackPayload *)self cacheHitFeedback];
    v205 = [v4 cacheHitFeedback];
    int v206 = [v204 isEqual:v205];

    if (!v206) {
      goto LABEL_227;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_CPFeedbackPayload *)self cbaEngagementFeedback];
  unint64_t v6 = [v4 cbaEngagementFeedback];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_226;
  }
  uint64_t v207 = [(_CPFeedbackPayload *)self cbaEngagementFeedback];
  if (v207)
  {
    v208 = (void *)v207;
    v209 = [(_CPFeedbackPayload *)self cbaEngagementFeedback];
    v210 = [v4 cbaEngagementFeedback];
    int v211 = [v209 isEqual:v210];

    if (!v211) {
      goto LABEL_227;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_CPFeedbackPayload *)self clientTimingFeedback];
  unint64_t v6 = [v4 clientTimingFeedback];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_226;
  }
  uint64_t v212 = [(_CPFeedbackPayload *)self clientTimingFeedback];
  if (v212)
  {
    v213 = (void *)v212;
    v214 = [(_CPFeedbackPayload *)self clientTimingFeedback];
    v215 = [v4 clientTimingFeedback];
    int v216 = [v214 isEqual:v215];

    if (!v216) {
      goto LABEL_227;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_CPFeedbackPayload *)self commandEngagementFeedback];
  unint64_t v6 = [v4 commandEngagementFeedback];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_226;
  }
  uint64_t v217 = [(_CPFeedbackPayload *)self commandEngagementFeedback];
  if (v217)
  {
    v218 = (void *)v217;
    v219 = [(_CPFeedbackPayload *)self commandEngagementFeedback];
    v220 = [v4 commandEngagementFeedback];
    int v221 = [v219 isEqual:v220];

    if (!v221) {
      goto LABEL_227;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_CPFeedbackPayload *)self dynamicButtonVisibilityFeedback];
  unint64_t v6 = [v4 dynamicButtonVisibilityFeedback];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_226;
  }
  uint64_t v222 = [(_CPFeedbackPayload *)self dynamicButtonVisibilityFeedback];
  if (v222)
  {
    v223 = (void *)v222;
    v224 = [(_CPFeedbackPayload *)self dynamicButtonVisibilityFeedback];
    v225 = [v4 dynamicButtonVisibilityFeedback];
    int v226 = [v224 isEqual:v225];

    if (!v226) {
      goto LABEL_227;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_CPFeedbackPayload *)self experimentTriggeredFeedback];
  unint64_t v6 = [v4 experimentTriggeredFeedback];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v227 = [(_CPFeedbackPayload *)self experimentTriggeredFeedback];
    if (!v227)
    {

LABEL_230:
      unint64_t queryId = self->_queryId;
      BOOL v232 = queryId == [v4 queryId];
      goto LABEL_228;
    }
    v228 = (void *)v227;
    v229 = [(_CPFeedbackPayload *)self experimentTriggeredFeedback];
    v230 = [v4 experimentTriggeredFeedback];
    int v231 = [v229 isEqual:v230];

    if (v231) {
      goto LABEL_230;
    }
  }
  else
  {
LABEL_226:
  }
LABEL_227:
  BOOL v232 = 0;
LABEL_228:

  return v232;
}

- (void)setExperimentTriggeredFeedback:(id)a3
{
  id v4 = (_CPExperimentTriggeredFeedback *)a3;
  [(_CPFeedbackPayload *)self clearContained_Feedback];
  unint64_t v5 = 45;
  if (!v4) {
    unint64_t v5 = 0;
  }
  self->_whichContained_Feedback = v5;
  experimentTriggeredFeedback = self->_experimentTriggeredFeedback;
  self->_experimentTriggeredFeedback = v4;
}

- (void)setDynamicButtonVisibilityFeedback:(id)a3
{
  id v4 = (_CPDynamicButtonVisibilityFeedback *)a3;
  [(_CPFeedbackPayload *)self clearContained_Feedback];
  unint64_t v5 = 44;
  if (!v4) {
    unint64_t v5 = 0;
  }
  self->_whichContained_Feedback = v5;
  dynamicButtonVisibilityFeedback = self->_dynamicButtonVisibilityFeedback;
  self->_dynamicButtonVisibilityFeedback = v4;
}

- (void)setCommandEngagementFeedback:(id)a3
{
  id v4 = (_CPCommandEngagementFeedback *)a3;
  [(_CPFeedbackPayload *)self clearContained_Feedback];
  unint64_t v5 = 43;
  if (!v4) {
    unint64_t v5 = 0;
  }
  self->_whichContained_Feedback = v5;
  commandEngagementFeedback = self->_commandEngagementFeedback;
  self->_commandEngagementFeedback = v4;
}

- (void)setClientTimingFeedback:(id)a3
{
  id v4 = (_CPClientTimingFeedback *)a3;
  [(_CPFeedbackPayload *)self clearContained_Feedback];
  unint64_t v5 = 42;
  if (!v4) {
    unint64_t v5 = 0;
  }
  self->_whichContained_Feedback = v5;
  clientTimingFeedback = self->_clientTimingFeedback;
  self->_clientTimingFeedback = v4;
}

- (void)setCbaEngagementFeedback:(id)a3
{
  id v4 = (_CPCBAEngagementFeedback *)a3;
  [(_CPFeedbackPayload *)self clearContained_Feedback];
  unint64_t v5 = 41;
  if (!v4) {
    unint64_t v5 = 0;
  }
  self->_whichContained_Feedback = v5;
  cbaEngagementFeedback = self->_cbaEngagementFeedback;
  self->_cbaEngagementFeedback = v4;
}

- (void)setCacheHitFeedback:(id)a3
{
  id v4 = (_CPCacheHitFeedback *)a3;
  [(_CPFeedbackPayload *)self clearContained_Feedback];
  unint64_t v5 = 40;
  if (!v4) {
    unint64_t v5 = 0;
  }
  self->_whichContained_Feedback = v5;
  cacheHitFeedback = self->_cacheHitFeedback;
  self->_cacheHitFeedback = v4;
}

- (void)setSkipSearchFeedback:(id)a3
{
  id v4 = (_CPSkipSearchFeedback *)a3;
  [(_CPFeedbackPayload *)self clearContained_Feedback];
  unint64_t v5 = 39;
  if (!v4) {
    unint64_t v5 = 0;
  }
  self->_whichContained_Feedback = v5;
  skipSearchFeedback = self->_skipSearchFeedback;
  self->_skipSearchFeedback = v4;
}

- (void)setCardViewAppearFeedback:(id)a3
{
  id v4 = (_CPCardViewAppearFeedback *)a3;
  [(_CPFeedbackPayload *)self clearContained_Feedback];
  unint64_t v5 = 38;
  if (!v4) {
    unint64_t v5 = 0;
  }
  self->_whichContained_Feedback = v5;
  cardViewAppearFeedback = self->_cardViewAppearFeedback;
  self->_cardViewAppearFeedback = v4;
}

- (void)setSessionEndFeedback:(id)a3
{
  id v4 = (_CPSessionEndFeedback *)a3;
  [(_CPFeedbackPayload *)self clearContained_Feedback];
  unint64_t v5 = 37;
  if (!v4) {
    unint64_t v5 = 0;
  }
  self->_whichContained_Feedback = v5;
  sessionEndFeedback = self->_sessionEndFeedback;
  self->_sessionEndFeedback = v4;
}

- (void)setCardSectionEngagementFeedback:(id)a3
{
  id v4 = (_CPCardSectionEngagementFeedback *)a3;
  [(_CPFeedbackPayload *)self clearContained_Feedback];
  unint64_t v5 = 36;
  if (!v4) {
    unint64_t v5 = 0;
  }
  self->_whichContained_Feedback = v5;
  cardSectionEngagementFeedback = self->_cardSectionEngagementFeedback;
  self->_cardSectionEngagementFeedback = v4;
}

- (void)setConnectionInvalidatedFeedback:(id)a3
{
  id v4 = (_CPConnectionInvalidatedFeedback *)a3;
  [(_CPFeedbackPayload *)self clearContained_Feedback];
  unint64_t v5 = 35;
  if (!v4) {
    unint64_t v5 = 0;
  }
  self->_whichContained_Feedback = v5;
  connectionInvalidatedFeedback = self->_connectionInvalidatedFeedback;
  self->_connectionInvalidatedFeedback = v4;
}

- (void)setLookupHintRelevancyFeedback:(id)a3
{
  id v4 = (_CPLookupHintRelevancyFeedback *)a3;
  [(_CPFeedbackPayload *)self clearContained_Feedback];
  unint64_t v5 = 34;
  if (!v4) {
    unint64_t v5 = 0;
  }
  self->_whichContained_Feedback = v5;
  lookupHintRelevancyFeedback = self->_lookupHintRelevancyFeedback;
  self->_lookupHintRelevancyFeedback = v4;
}

- (void)setResultGradingFeedback:(id)a3
{
  id v4 = (_CPResultGradingFeedback *)a3;
  [(_CPFeedbackPayload *)self clearContained_Feedback];
  unint64_t v5 = 33;
  if (!v4) {
    unint64_t v5 = 0;
  }
  self->_whichContained_Feedback = v5;
  resultGradingFeedback = self->_resultGradingFeedback;
  self->_resultGradingFeedback = v4;
}

- (void)setSessionMissingSuggestionsFeedback:(id)a3
{
  id v4 = (_CPSessionMissingSuggestionsFeedback *)a3;
  [(_CPFeedbackPayload *)self clearContained_Feedback];
  self->_whichContained_Feedback = 32 * (v4 != 0);
  sessionMissingSuggestionsFeedback = self->_sessionMissingSuggestionsFeedback;
  self->_sessionMissingSuggestionsFeedback = v4;
}

- (void)setSessionMissingResultsFeedback:(id)a3
{
  id v4 = (_CPSessionMissingResultsFeedback *)a3;
  [(_CPFeedbackPayload *)self clearContained_Feedback];
  unint64_t v5 = 31;
  if (!v4) {
    unint64_t v5 = 0;
  }
  self->_whichContained_Feedback = v5;
  sessionMissingResultsFeedback = self->_sessionMissingResultsFeedback;
  self->_sessionMissingResultsFeedback = v4;
}

- (void)setDidGoToSearchFeedback:(id)a3
{
  id v4 = (_CPDidGoToSearchFeedback *)a3;
  [(_CPFeedbackPayload *)self clearContained_Feedback];
  unint64_t v5 = 30;
  if (!v4) {
    unint64_t v5 = 0;
  }
  self->_whichContained_Feedback = v5;
  didGoToSearchFeedback = self->_didGoToSearchFeedback;
  self->_didGoToSearchFeedback = v4;
}

- (void)setDidGoToSiteFeedback:(id)a3
{
  id v4 = (_CPDidGoToSiteFeedback *)a3;
  [(_CPFeedbackPayload *)self clearContained_Feedback];
  unint64_t v5 = 29;
  if (!v4) {
    unint64_t v5 = 0;
  }
  self->_whichContained_Feedback = v5;
  didGoToSiteFeedback = self->_didGoToSiteFeedback;
  self->_didGoToSiteFeedback = v4;
}

- (void)setVisibleSectionHeaderFeedback:(id)a3
{
  id v4 = (_CPVisibleSectionHeaderFeedback *)a3;
  [(_CPFeedbackPayload *)self clearContained_Feedback];
  unint64_t v5 = 28;
  if (!v4) {
    unint64_t v5 = 0;
  }
  self->_whichContained_Feedback = v5;
  visibleSectionHeaderFeedback = self->_visibleSectionHeaderFeedback;
  self->_visibleSectionHeaderFeedback = v4;
}

- (void)setSectionEngagementFeedback:(id)a3
{
  id v4 = (_CPSectionEngagementFeedback *)a3;
  [(_CPFeedbackPayload *)self clearContained_Feedback];
  unint64_t v5 = 27;
  if (!v4) {
    unint64_t v5 = 0;
  }
  self->_whichContained_Feedback = v5;
  sectionEngagementFeedback = self->_sectionEngagementFeedback;
  self->_sectionEngagementFeedback = v4;
}

- (void)setClearInputFeedback:(id)a3
{
  id v4 = (_CPClearInputFeedback *)a3;
  [(_CPFeedbackPayload *)self clearContained_Feedback];
  unint64_t v5 = 26;
  if (!v4) {
    unint64_t v5 = 0;
  }
  self->_whichContained_Feedback = v5;
  clearInputFeedback = self->_clearInputFeedback;
  self->_clearInputFeedback = v4;
}

- (void)setLateSectionsAppendedFeedback:(id)a3
{
  id v4 = (_CPLateSectionsAppendedFeedback *)a3;
  [(_CPFeedbackPayload *)self clearContained_Feedback];
  unint64_t v5 = 25;
  if (!v4) {
    unint64_t v5 = 0;
  }
  self->_whichContained_Feedback = v5;
  lateSectionsAppendedFeedback = self->_lateSectionsAppendedFeedback;
  self->_lateSectionsAppendedFeedback = v4;
}

- (void)setResultsReceivedAfterTimeoutFeedback:(id)a3
{
  id v4 = (_CPResultsReceivedAfterTimeoutFeedback *)a3;
  [(_CPFeedbackPayload *)self clearContained_Feedback];
  unint64_t v5 = 24;
  if (!v4) {
    unint64_t v5 = 0;
  }
  self->_whichContained_Feedback = v5;
  resultsReceivedAfterTimeoutFeedback = self->_resultsReceivedAfterTimeoutFeedback;
  self->_resultsReceivedAfterTimeoutFeedback = v4;
}

- (void)setVisibleSuggestionsFeedback:(id)a3
{
  id v4 = (_CPVisibleSuggestionsFeedback *)a3;
  [(_CPFeedbackPayload *)self clearContained_Feedback];
  unint64_t v5 = 23;
  if (!v4) {
    unint64_t v5 = 0;
  }
  self->_whichContained_Feedback = v5;
  visibleSuggestionsFeedback = self->_visibleSuggestionsFeedback;
  self->_visibleSuggestionsFeedback = v4;
}

- (void)setCardViewDisappearFeedback:(id)a3
{
  id v4 = (_CPCardViewDisappearFeedback *)a3;
  [(_CPFeedbackPayload *)self clearContained_Feedback];
  unint64_t v5 = 22;
  if (!v4) {
    unint64_t v5 = 0;
  }
  self->_whichContained_Feedback = v5;
  cardViewDisappearFeedback = self->_cardViewDisappearFeedback;
  self->_cardViewDisappearFeedback = v4;
}

- (void)setSuggestionEngagementFeedback:(id)a3
{
  id v4 = (_CPSuggestionEngagementFeedback *)a3;
  [(_CPFeedbackPayload *)self clearContained_Feedback];
  unint64_t v5 = 21;
  if (!v4) {
    unint64_t v5 = 0;
  }
  self->_whichContained_Feedback = v5;
  suggestionEngagementFeedback = self->_suggestionEngagementFeedback;
  self->_suggestionEngagementFeedback = v4;
}

- (void)setCustomFeedback:(id)a3
{
  id v4 = (_CPCustomFeedback *)a3;
  [(_CPFeedbackPayload *)self clearContained_Feedback];
  unint64_t v5 = 20;
  if (!v4) {
    unint64_t v5 = 0;
  }
  self->_whichContained_Feedback = v5;
  customFeedback = self->_customFeedback;
  self->_customFeedback = v4;
}

- (void)setErrorFeedback:(id)a3
{
  id v4 = (_CPErrorFeedback *)a3;
  [(_CPFeedbackPayload *)self clearContained_Feedback];
  unint64_t v5 = 19;
  if (!v4) {
    unint64_t v5 = 0;
  }
  self->_whichContained_Feedback = v5;
  errorFeedback = self->_errorFeedback;
  self->_errorFeedback = v4;
}

- (void)setEndLocalSearchFeedback:(id)a3
{
  id v4 = (_CPEndLocalSearchFeedback *)a3;
  [(_CPFeedbackPayload *)self clearContained_Feedback];
  unint64_t v5 = 18;
  if (!v4) {
    unint64_t v5 = 0;
  }
  self->_whichContained_Feedback = v5;
  endLocalSearchFeedback = self->_endLocalSearchFeedback;
  self->_endLocalSearchFeedback = v4;
}

- (void)setStartLocalSearchFeedback:(id)a3
{
  id v4 = (_CPStartLocalSearchFeedback *)a3;
  [(_CPFeedbackPayload *)self clearContained_Feedback];
  unint64_t v5 = 17;
  if (!v4) {
    unint64_t v5 = 0;
  }
  self->_whichContained_Feedback = v5;
  startLocalSearchFeedback = self->_startLocalSearchFeedback;
  self->_startLocalSearchFeedback = v4;
}

- (void)setEndNetworkSearchFeedback:(id)a3
{
  id v4 = (_CPEndNetworkSearchFeedback *)a3;
  [(_CPFeedbackPayload *)self clearContained_Feedback];
  self->_whichContained_Feedback = 16 * (v4 != 0);
  endNetworkSearchFeedback = self->_endNetworkSearchFeedback;
  self->_endNetworkSearchFeedback = v4;
}

- (void)setStartNetworkSearchFeedback:(id)a3
{
  id v4 = (_CPStartNetworkSearchFeedback *)a3;
  [(_CPFeedbackPayload *)self clearContained_Feedback];
  unint64_t v5 = 15;
  if (!v4) {
    unint64_t v5 = 0;
  }
  self->_whichContained_Feedback = v5;
  startNetworkSearchFeedback = self->_startNetworkSearchFeedback;
  self->_startNetworkSearchFeedback = v4;
}

- (void)setEndSearchFeedback:(id)a3
{
  id v4 = (_CPEndSearchFeedback *)a3;
  [(_CPFeedbackPayload *)self clearContained_Feedback];
  unint64_t v5 = 14;
  if (!v4) {
    unint64_t v5 = 0;
  }
  self->_whichContained_Feedback = v5;
  endSearchFeedback = self->_endSearchFeedback;
  self->_endSearchFeedback = v4;
}

- (void)setStartSearchFeedback:(id)a3
{
  id v4 = (_CPStartSearchFeedback *)a3;
  [(_CPFeedbackPayload *)self clearContained_Feedback];
  unint64_t v5 = 13;
  if (!v4) {
    unint64_t v5 = 0;
  }
  self->_whichContained_Feedback = v5;
  startSearchFeedback = self->_startSearchFeedback;
  self->_startSearchFeedback = v4;
}

- (void)setStoreCardSectionEngagementFeedback:(id)a3
{
  id v4 = (_CPStoreCardSectionEngagementFeedback *)a3;
  [(_CPFeedbackPayload *)self clearContained_Feedback];
  unint64_t v5 = 12;
  if (!v4) {
    unint64_t v5 = 0;
  }
  self->_whichContained_Feedback = v5;
  storeCardSectionEngagementFeedback = self->_storeCardSectionEngagementFeedback;
  self->_storeCardSectionEngagementFeedback = v4;
}

- (void)setMapsCardSectionEngagementFeedback:(id)a3
{
  id v4 = (_CPMapsCardSectionEngagementFeedback *)a3;
  [(_CPFeedbackPayload *)self clearContained_Feedback];
  unint64_t v5 = 11;
  if (!v4) {
    unint64_t v5 = 0;
  }
  self->_whichContained_Feedback = v5;
  mapsCardSectionEngagementFeedback = self->_mapsCardSectionEngagementFeedback;
  self->_mapsCardSectionEngagementFeedback = v4;
}

- (void)setCardSectionFeedback:(id)a3
{
  id v4 = (_CPCardSectionFeedback *)a3;
  [(_CPFeedbackPayload *)self clearContained_Feedback];
  unint64_t v5 = 10;
  if (!v4) {
    unint64_t v5 = 0;
  }
  self->_whichContained_Feedback = v5;
  cardSectionFeedback = self->_cardSectionFeedback;
  self->_cardSectionFeedback = v4;
}

- (void)setVisibleResultsFeedback:(id)a3
{
  id v4 = (_CPVisibleResultsFeedback *)a3;
  [(_CPFeedbackPayload *)self clearContained_Feedback];
  unint64_t v5 = 9;
  if (!v4) {
    unint64_t v5 = 0;
  }
  self->_whichContained_Feedback = v5;
  visibleResultsFeedback = self->_visibleResultsFeedback;
  self->_visibleResultsFeedback = v4;
}

- (void)setResultEngagementFeedback:(id)a3
{
  id v4 = (_CPResultEngagementFeedback *)a3;
  [(_CPFeedbackPayload *)self clearContained_Feedback];
  self->_whichContained_Feedback = 8 * (v4 != 0);
  resultEngagementFeedback = self->_resultEngagementFeedback;
  self->_resultEngagementFeedback = v4;
}

- (void)setResultFeedback:(id)a3
{
  id v4 = (_CPResultFeedback *)a3;
  [(_CPFeedbackPayload *)self clearContained_Feedback];
  unint64_t v5 = 7;
  if (!v4) {
    unint64_t v5 = 0;
  }
  self->_whichContained_Feedback = v5;
  resultFeedback = self->_resultFeedback;
  self->_resultFeedback = v4;
}

- (void)setResultRankingFeedback:(id)a3
{
  id v4 = (_CPResultRankingFeedback *)a3;
  [(_CPFeedbackPayload *)self clearContained_Feedback];
  unint64_t v5 = 6;
  if (!v4) {
    unint64_t v5 = 0;
  }
  self->_whichContained_Feedback = v5;
  resultRankingFeedback = self->_resultRankingFeedback;
  self->_resultRankingFeedback = v4;
}

- (void)setSectionRankingFeedback:(id)a3
{
  id v4 = (_CPSectionRankingFeedback *)a3;
  [(_CPFeedbackPayload *)self clearContained_Feedback];
  unint64_t v5 = 5;
  if (!v4) {
    unint64_t v5 = 0;
  }
  self->_whichContained_Feedback = v5;
  sectionRankingFeedback = self->_sectionRankingFeedback;
  self->_sectionRankingFeedback = v4;
}

- (void)setRankingFeedback:(id)a3
{
  id v4 = (_CPRankingFeedback *)a3;
  [(_CPFeedbackPayload *)self clearContained_Feedback];
  self->_whichContained_Feedback = 4 * (v4 != 0);
  rankingFeedback = self->_rankingFeedback;
  self->_rankingFeedback = v4;
}

- (void)setSearchViewDisappearFeedback:(id)a3
{
  id v4 = (_CPSearchViewDisappearFeedback *)a3;
  [(_CPFeedbackPayload *)self clearContained_Feedback];
  unint64_t v5 = 3;
  if (!v4) {
    unint64_t v5 = 0;
  }
  self->_whichContained_Feedback = v5;
  searchViewDisappearFeedback = self->_searchViewDisappearFeedback;
  self->_searchViewDisappearFeedback = v4;
}

- (void)setFeedback:(id)a3
{
  id v4 = (_CPFeedback *)a3;
  [(_CPFeedbackPayload *)self clearContained_Feedback];
  self->_whichContained_Feedback = v4 != 0;
  feedback = self->_feedback;
  self->_feedback = v4;
}

- (void)updateResults:(id)a3 withId:(unint64_t)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) setQueryId:a4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)updateQueryId:(unint64_t)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  -[_CPFeedbackPayload setQueryId:](self, "setQueryId:");
  id v5 = [(_CPFeedbackPayload *)self startLocalSearchFeedback];
  [v5 setQueryId:a3];

  uint64_t v6 = [(_CPFeedbackPayload *)self startNetworkSearchFeedback];
  [v6 setQueryId:a3];

  uint64_t v7 = [(_CPFeedbackPayload *)self clientTimingFeedback];
  [v7 setQueryId:a3];

  uint64_t v8 = [(_CPFeedbackPayload *)self cbaEngagementFeedback];
  [v8 setQueryId:a3];

  uint64_t v9 = [(_CPFeedbackPayload *)self commandEngagementFeedback];
  long long v10 = [v9 result];
  [v10 setQueryId:a3];

  long long v11 = [(_CPFeedbackPayload *)self resultEngagementFeedback];
  long long v12 = [v11 result];
  [v12 setQueryId:a3];

  long long v13 = [(_CPFeedbackPayload *)self startSearchFeedback];
  [v13 setQueryId:a3];

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  unint64_t v14 = [(_CPFeedbackPayload *)self rankingFeedback];
  uint64_t v15 = [v14 sections];

  obuint64_t j = v15;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v36 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v42 != v36) {
          objc_enumerationMutation(obj);
        }
        unint64_t v19 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        unint64_t v20 = [v19 results];
        uint64_t v21 = [v20 countByEnumeratingWithState:&v37 objects:v45 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v38;
          do
          {
            for (uint64_t j = 0; j != v22; ++j)
            {
              if (*(void *)v38 != v23) {
                objc_enumerationMutation(v20);
              }
              unint64_t v25 = *(void **)(*((void *)&v37 + 1) + 8 * j);
              int v26 = [v25 result];
              [v26 setQueryId:a3];

              uint64_t v27 = [v25 hiddenResults];
              [(_CPFeedbackPayload *)self updateResults:v27 withId:a3];

              unint64_t v28 = [v25 duplicateResults];
              [(_CPFeedbackPayload *)self updateResults:v28 withId:a3];
            }
            uint64_t v22 = [v20 countByEnumeratingWithState:&v37 objects:v45 count:16];
          }
          while (v22);
        }
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
    }
    while (v17);
  }

  unint64_t v29 = [(_CPFeedbackPayload *)self sessionMissingResultsFeedback];
  unint64_t v30 = [v29 results];
  [(_CPFeedbackPayload *)self updateResults:v30 withId:a3];

  int v31 = [(_CPFeedbackPayload *)self visibleResultsFeedback];
  uint64_t v32 = [v31 results];
  [(_CPFeedbackPayload *)self updateResults:v32 withId:a3];

  unint64_t v33 = [(_CPFeedbackPayload *)self resultsReceivedAfterTimeoutFeedback];
  unint64_t v34 = [v33 results];
  [(_CPFeedbackPayload *)self updateResults:v34 withId:a3];
}

@end