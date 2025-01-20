@interface _CPUsageSinceLookback
- (BOOL)isDiagnosticsAndUsageEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_CPDeviceContext)context;
- (int)activeDaysInCollectionPeriod;
- (int)client;
- (int)configuredLookbackTimeInDays;
- (int)invokedDays;
- (int)numSearchEngagements;
- (int)searchedDays;
- (int)suggestionOrAppleResultEngagedDays;
- (int)totalEngagements;
- (int)totalUsagesInCollectionPeriod;
- (int)voiceSearchDays;
- (int)webEngagedDays;
- (int)zkwEngagedDays;
- (int64_t)collectionEndTimestamp;
- (int64_t)collectionStartTimestamp;
- (unint64_t)hash;
- (void)setActiveDaysInCollectionPeriod:(int)a3;
- (void)setClient:(int)a3;
- (void)setCollectionEndTimestamp:(int64_t)a3;
- (void)setCollectionStartTimestamp:(int64_t)a3;
- (void)setConfiguredLookbackTimeInDays:(int)a3;
- (void)setContext:(id)a3;
- (void)setInvokedDays:(int)a3;
- (void)setIsDiagnosticsAndUsageEnabled:(BOOL)a3;
- (void)setNumSearchEngagements:(int)a3;
- (void)setSearchedDays:(int)a3;
- (void)setSuggestionOrAppleResultEngagedDays:(int)a3;
- (void)setTotalEngagements:(int)a3;
- (void)setTotalUsagesInCollectionPeriod:(int)a3;
- (void)setVoiceSearchDays:(int)a3;
- (void)setWebEngagedDays:(int)a3;
- (void)setZkwEngagedDays:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPUsageSinceLookback

- (void).cxx_destruct
{
}

- (void)setNumSearchEngagements:(int)a3
{
  self->_numSearchEngagements = a3;
}

- (int)numSearchEngagements
{
  return self->_numSearchEngagements;
}

- (void)setVoiceSearchDays:(int)a3
{
  self->_voiceSearchDays = a3;
}

- (int)voiceSearchDays
{
  return self->_voiceSearchDays;
}

- (void)setWebEngagedDays:(int)a3
{
  self->_webEngagedDays = a3;
}

- (int)webEngagedDays
{
  return self->_webEngagedDays;
}

- (void)setSuggestionOrAppleResultEngagedDays:(int)a3
{
  self->_suggestionOrAppleResultEngagedDays = a3;
}

- (int)suggestionOrAppleResultEngagedDays
{
  return self->_suggestionOrAppleResultEngagedDays;
}

- (void)setSearchedDays:(int)a3
{
  self->_searchedDays = a3;
}

- (int)searchedDays
{
  return self->_searchedDays;
}

- (void)setZkwEngagedDays:(int)a3
{
  self->_zkwEngagedDays = a3;
}

- (int)zkwEngagedDays
{
  return self->_zkwEngagedDays;
}

- (void)setInvokedDays:(int)a3
{
  self->_invokedDays = a3;
}

- (int)invokedDays
{
  return self->_invokedDays;
}

- (void)setIsDiagnosticsAndUsageEnabled:(BOOL)a3
{
  self->_isDiagnosticsAndUsageEnabled = a3;
}

- (BOOL)isDiagnosticsAndUsageEnabled
{
  return self->_isDiagnosticsAndUsageEnabled;
}

- (void)setTotalEngagements:(int)a3
{
  self->_totalEngagements = a3;
}

- (int)totalEngagements
{
  return self->_totalEngagements;
}

- (void)setActiveDaysInCollectionPeriod:(int)a3
{
  self->_activeDaysInCollectionPeriod = a3;
}

- (int)activeDaysInCollectionPeriod
{
  return self->_activeDaysInCollectionPeriod;
}

- (void)setConfiguredLookbackTimeInDays:(int)a3
{
  self->_configuredLookbackTimeInDays = a3;
}

- (int)configuredLookbackTimeInDays
{
  return self->_configuredLookbackTimeInDays;
}

- (void)setContext:(id)a3
{
}

- (_CPDeviceContext)context
{
  return self->_context;
}

- (void)setTotalUsagesInCollectionPeriod:(int)a3
{
  self->_totalUsagesInCollectionPeriod = a3;
}

- (int)totalUsagesInCollectionPeriod
{
  return self->_totalUsagesInCollectionPeriod;
}

- (void)setClient:(int)a3
{
  self->_client = a3;
}

- (int)client
{
  return self->_client;
}

- (void)setCollectionEndTimestamp:(int64_t)a3
{
  self->_collectionEndTimestamp = a3;
}

- (int64_t)collectionEndTimestamp
{
  return self->_collectionEndTimestamp;
}

- (void)setCollectionStartTimestamp:(int64_t)a3
{
  self->_collectionStartTimestamp = a3;
}

- (int64_t)collectionStartTimestamp
{
  return self->_collectionStartTimestamp;
}

- (unint64_t)hash
{
  uint64_t v2 = (2654435761 * self->_collectionEndTimestamp) ^ (2654435761 * self->_collectionStartTimestamp) ^ (2654435761 * self->_client) ^ (2654435761 * self->_totalUsagesInCollectionPeriod);
  return v2 ^ [(_CPDeviceContext *)self->_context hash] ^ (2654435761 * self->_configuredLookbackTimeInDays) ^ (2654435761 * self->_activeDaysInCollectionPeriod) ^ (2654435761 * self->_totalEngagements) ^ (2654435761 * self->_isDiagnosticsAndUsageEnabled) ^ (2654435761 * self->_invokedDays) ^ (2654435761 * self->_zkwEngagedDays) ^ (2654435761 * self->_searchedDays) ^ (2654435761 * self->_suggestionOrAppleResultEngagedDays) ^ (2654435761 * self->_webEngagedDays) ^ (2654435761 * self->_voiceSearchDays) ^ (2654435761 * self->_numSearchEngagements);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  int64_t collectionStartTimestamp = self->_collectionStartTimestamp;
  if (collectionStartTimestamp != [v4 collectionStartTimestamp]) {
    goto LABEL_23;
  }
  int64_t collectionEndTimestamp = self->_collectionEndTimestamp;
  if (collectionEndTimestamp != [v4 collectionEndTimestamp]) {
    goto LABEL_23;
  }
  int client = self->_client;
  if (client != [v4 client]) {
    goto LABEL_23;
  }
  int totalUsagesInCollectionPeriod = self->_totalUsagesInCollectionPeriod;
  if (totalUsagesInCollectionPeriod != [v4 totalUsagesInCollectionPeriod]) {
    goto LABEL_23;
  }
  v9 = [(_CPUsageSinceLookback *)self context];
  v10 = [v4 context];
  v11 = v10;
  if ((v9 == 0) == (v10 != 0))
  {

LABEL_23:
    BOOL v28 = 0;
    goto LABEL_24;
  }
  uint64_t v12 = [(_CPUsageSinceLookback *)self context];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_CPUsageSinceLookback *)self context];
    v15 = [v4 context];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  int configuredLookbackTimeInDays = self->_configuredLookbackTimeInDays;
  if (configuredLookbackTimeInDays != [v4 configuredLookbackTimeInDays]) {
    goto LABEL_23;
  }
  int activeDaysInCollectionPeriod = self->_activeDaysInCollectionPeriod;
  if (activeDaysInCollectionPeriod != [v4 activeDaysInCollectionPeriod]) {
    goto LABEL_23;
  }
  int totalEngagements = self->_totalEngagements;
  if (totalEngagements != [v4 totalEngagements]) {
    goto LABEL_23;
  }
  int isDiagnosticsAndUsageEnabled = self->_isDiagnosticsAndUsageEnabled;
  if (isDiagnosticsAndUsageEnabled != [v4 isDiagnosticsAndUsageEnabled]) {
    goto LABEL_23;
  }
  int invokedDays = self->_invokedDays;
  if (invokedDays != [v4 invokedDays]) {
    goto LABEL_23;
  }
  int zkwEngagedDays = self->_zkwEngagedDays;
  if (zkwEngagedDays != [v4 zkwEngagedDays]) {
    goto LABEL_23;
  }
  int searchedDays = self->_searchedDays;
  if (searchedDays != [v4 searchedDays]) {
    goto LABEL_23;
  }
  int suggestionOrAppleResultEngagedDays = self->_suggestionOrAppleResultEngagedDays;
  if (suggestionOrAppleResultEngagedDays != [v4 suggestionOrAppleResultEngagedDays]) {
    goto LABEL_23;
  }
  int webEngagedDays = self->_webEngagedDays;
  if (webEngagedDays != [v4 webEngagedDays]) {
    goto LABEL_23;
  }
  int voiceSearchDays = self->_voiceSearchDays;
  if (voiceSearchDays != [v4 voiceSearchDays]) {
    goto LABEL_23;
  }
  int numSearchEngagements = self->_numSearchEngagements;
  BOOL v28 = numSearchEngagements == [v4 numSearchEngagements];
LABEL_24:

  return v28;
}

- (void)writeTo:(id)a3
{
  a3;
  if ([(_CPUsageSinceLookback *)self collectionStartTimestamp]) {
    PBDataWriterWriteInt64Field();
  }
  if ([(_CPUsageSinceLookback *)self collectionEndTimestamp]) {
    PBDataWriterWriteInt64Field();
  }
  if ([(_CPUsageSinceLookback *)self client]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_CPUsageSinceLookback *)self totalUsagesInCollectionPeriod]) {
    PBDataWriterWriteInt32Field();
  }
  id v4 = [(_CPUsageSinceLookback *)self context];

  if (v4)
  {
    v5 = [(_CPUsageSinceLookback *)self context];
    PBDataWriterWriteSubmessage();
  }
  if ([(_CPUsageSinceLookback *)self configuredLookbackTimeInDays]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_CPUsageSinceLookback *)self activeDaysInCollectionPeriod]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_CPUsageSinceLookback *)self totalEngagements]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_CPUsageSinceLookback *)self isDiagnosticsAndUsageEnabled]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_CPUsageSinceLookback *)self invokedDays]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_CPUsageSinceLookback *)self zkwEngagedDays]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_CPUsageSinceLookback *)self searchedDays]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_CPUsageSinceLookback *)self suggestionOrAppleResultEngagedDays]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_CPUsageSinceLookback *)self webEngagedDays]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_CPUsageSinceLookback *)self voiceSearchDays]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_CPUsageSinceLookback *)self numSearchEngagements]) {
    PBDataWriterWriteInt32Field();
  }

  MEMORY[0x1F4181820]();
}

- (BOOL)readFrom:(id)a3
{
  return _CPUsageSinceLookbackReadFrom(self, (uint64_t)a3);
}

@end