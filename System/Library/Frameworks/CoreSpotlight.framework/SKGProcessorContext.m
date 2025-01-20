@interface SKGProcessorContext
+ (id)sharedContext;
- (BOOL)enableCalendarEventClassification;
- (BOOL)enableDocumentUnderstanding;
- (BOOL)enableEmbeddings;
- (BOOL)enableEventUpdater;
- (BOOL)enableExtractions;
- (BOOL)enableKeyphrases;
- (BOOL)enableMegadomePeople;
- (BOOL)enablePeople;
- (BOOL)enableSuggestedEvents;
- (SKGProcessorContext)init;
- (SKGProcessorContext)initWithPreferredLanguages:(id)a3 locale:(id)a4;
- (id)bundleIdentifier;
- (id)cleanupAttributes;
- (id)docUnderstandingExtractionAttributes;
- (id)docUnderstandingFetchAttributes;
- (id)docUnderstandingIncludeBundles;
- (id)docUnderstandingItemDomainIds;
- (id)docUnderstandingTrackingAttributes;
- (id)embeddingExcludeBundles;
- (id)embeddingExcludeContentTypes;
- (id)embeddingExcludeDomainIdentifier;
- (id)embeddingExtractionAttributes;
- (id)embeddingFetchAttributes;
- (id)embeddingTrackingAttributes;
- (id)excludeBundles;
- (id)fetchAttributes;
- (id)keyphraseExcludeBundles;
- (id)keyphraseExtractionAttributes;
- (id)keyphraseFetchAttributes;
- (id)keyphraseTrackingAttributes;
- (id)peopleExtractionAttributes;
- (id)peopleFetchAttributes;
- (id)peoplePreferredBundles;
- (id)suggestedEventsAllowListAttributes;
- (id)suggestedEventsExtractionAttributes;
- (id)suggestedEventsFetchAttributes;
- (id)suggestedEventsIncludeBundles;
- (id)suggestedEventsTrackingAttributes;
- (int64_t)documentUnderstandingVersion;
- (int64_t)embeddingModelVersion;
- (int64_t)embeddingVersion;
- (int64_t)graphVersion;
- (int64_t)keyphraseVersion;
- (int64_t)knowledgeVersion;
- (int64_t)maxArchiveSize;
- (int64_t)maxEntityCount;
- (int64_t)maxGraphSize;
- (int64_t)maxItemBatchCount;
- (int64_t)maxJournalItemCount;
- (int64_t)maxJournalSize;
- (int64_t)maxJournalSizeForPurge;
- (int64_t)maxQueryItemCount;
- (int64_t)releaseVersion;
- (int64_t)suggestedEventsVersion;
- (int64_t)textVersion;
- (void)commonInitWithBundleIdentifier:(id)a3;
- (void)setMaxArchiveSize:(int64_t)a3;
- (void)setMaxEntityCount:(int64_t)a3;
- (void)setMaxGraphSize:(int64_t)a3;
- (void)setMaxItemBatchCount:(int64_t)a3;
- (void)setMaxJournalItemCount:(int64_t)a3;
- (void)setMaxJournalSize:(int64_t)a3;
- (void)setMaxJournalSizeForPurge:(int64_t)a3;
- (void)setMaxQueryItemCount:(int64_t)a3;
@end

@implementation SKGProcessorContext

- (id)keyphraseExcludeBundles
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004B428;
  block[3] = &unk_1000DA128;
  block[4] = self;
  if (qword_1000F8FA0 != -1) {
    dispatch_once(&qword_1000F8FA0, block);
  }
  return (id)qword_1000F8F98;
}

- (id)excludeBundles
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004AC2C;
  block[3] = &unk_1000DA128;
  block[4] = self;
  if (qword_1000F8F30 != -1) {
    dispatch_once(&qword_1000F8F30, block);
  }
  return (id)qword_1000F8F28;
}

+ (id)sharedContext
{
  if (qword_1000F8F10 != -1) {
    dispatch_once(&qword_1000F8F10, &stru_1000DAD68);
  }
  v2 = (void *)qword_1000F8F08;

  return v2;
}

- (int64_t)textVersion
{
  return 2;
}

- (int64_t)keyphraseVersion
{
  return 13;
}

- (id)keyphraseFetchAttributes
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004B374;
  block[3] = &unk_1000DA128;
  block[4] = self;
  if (qword_1000F8F90 != -1) {
    dispatch_once(&qword_1000F8F90, block);
  }
  return (id)qword_1000F8F88;
}

- (id)keyphraseExtractionAttributes
{
  return &off_1000E7230;
}

- (id)fetchAttributes
{
  return &off_1000E71B8;
}

- (BOOL)enableSuggestedEvents
{
  return _os_feature_enabled_impl();
}

- (BOOL)enableKeyphrases
{
  return 1;
}

- (BOOL)enableEmbeddings
{
  if (!_os_feature_enabled_impl() || !_os_feature_enabled_impl()) {
    return 0;
  }
  v2 = +[SPEmbeddingModel sharedInstance];
  unsigned __int8 v3 = [v2 deviceCanGenerateEmbeddings];

  return v3;
}

- (BOOL)enableDocumentUnderstanding
{
  return _os_feature_enabled_impl();
}

- (id)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)commonInitWithBundleIdentifier:(id)a3
{
}

- (SKGProcessorContext)init
{
  v5.receiver = self;
  v5.super_class = (Class)SKGProcessorContext;
  v2 = [(SKGProcessorContext *)&v5 init];
  unsigned __int8 v3 = v2;
  if (v2) {
    [(SKGProcessorContext *)v2 commonInitWithBundleIdentifier:@"com.apple.spotlight.contacts"];
  }
  return v3;
}

- (SKGProcessorContext)initWithPreferredLanguages:(id)a3 locale:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SKGProcessorContext;
  v4 = [(SKGProcessorContext *)&v7 init];
  objc_super v5 = v4;
  if (v4) {
    [(SKGProcessorContext *)v4 commonInitWithBundleIdentifier:@"com.apple.cslinguistics"];
  }
  return v5;
}

- (BOOL)enablePeople
{
  return _os_feature_enabled_impl();
}

- (BOOL)enableCalendarEventClassification
{
  if (qword_1000F8F20 != -1) {
    dispatch_once(&qword_1000F8F20, &stru_1000DAD88);
  }
  return byte_1000F8F18;
}

- (BOOL)enableExtractions
{
  return _os_feature_enabled_impl();
}

- (BOOL)enableMegadomePeople
{
  return _os_feature_enabled_impl();
}

- (BOOL)enableEventUpdater
{
  return _os_feature_enabled_impl();
}

- (int64_t)knowledgeVersion
{
  return 2;
}

- (int64_t)embeddingVersion
{
  return 3;
}

- (int64_t)embeddingModelVersion
{
  return (int64_t)+[SPEmbeddingModel version];
}

- (int64_t)suggestedEventsVersion
{
  return 1;
}

- (int64_t)documentUnderstandingVersion
{
  return 1;
}

- (int64_t)releaseVersion
{
  return 3;
}

- (int64_t)graphVersion
{
  return 26;
}

- (int64_t)maxGraphSize
{
  return 1000000000;
}

- (int64_t)maxArchiveSize
{
  return 1000000000;
}

- (int64_t)maxJournalSize
{
  return 1000000000;
}

- (int64_t)maxJournalSizeForPurge
{
  return (int64_t)&_mh_execute_header;
}

- (int64_t)maxEntityCount
{
  return 10;
}

- (int64_t)maxQueryItemCount
{
  return 100000;
}

- (int64_t)maxItemBatchCount
{
  return 500;
}

- (int64_t)maxJournalItemCount
{
  return 60000;
}

- (id)cleanupAttributes
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004ADC8;
  block[3] = &unk_1000DA128;
  block[4] = self;
  if (qword_1000F8F40 != -1) {
    dispatch_once(&qword_1000F8F40, block);
  }
  return (id)qword_1000F8F38;
}

- (id)embeddingFetchAttributes
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004AF44;
  block[3] = &unk_1000DA128;
  block[4] = self;
  if (qword_1000F8F50 != -1) {
    dispatch_once(&qword_1000F8F50, block);
  }
  return (id)qword_1000F8F48;
}

- (id)embeddingExtractionAttributes
{
  return &off_1000E71D0;
}

- (id)embeddingTrackingAttributes
{
  return &off_1000E71E8;
}

- (id)embeddingExcludeBundles
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004B098;
  block[3] = &unk_1000DA128;
  block[4] = self;
  if (qword_1000F8F60 != -1) {
    dispatch_once(&qword_1000F8F60, block);
  }
  return (id)qword_1000F8F58;
}

- (id)embeddingExcludeContentTypes
{
  if (qword_1000F8F70 != -1) {
    dispatch_once(&qword_1000F8F70, &stru_1000DADA8);
  }
  v2 = (void *)qword_1000F8F68;

  return v2;
}

- (id)embeddingExcludeDomainIdentifier
{
  if (qword_1000F8F80 != -1) {
    dispatch_once(&qword_1000F8F80, &stru_1000DADC8);
  }
  v2 = (void *)qword_1000F8F78;

  return v2;
}

- (id)keyphraseTrackingAttributes
{
  return &off_1000E7248;
}

- (id)suggestedEventsExtractionAttributes
{
  return &off_1000E7278;
}

- (id)suggestedEventsFetchAttributes
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004B560;
  block[3] = &unk_1000DA128;
  block[4] = self;
  if (qword_1000F8FB0 != -1) {
    dispatch_once(&qword_1000F8FB0, block);
  }
  return (id)qword_1000F8FA8;
}

- (id)suggestedEventsTrackingAttributes
{
  return &off_1000E7290;
}

- (id)suggestedEventsAllowListAttributes
{
  if (qword_1000F8FC0 != -1) {
    dispatch_once(&qword_1000F8FC0, &stru_1000DADE8);
  }
  v2 = (void *)qword_1000F8FB8;

  return v2;
}

- (id)suggestedEventsIncludeBundles
{
  return &off_1000E72A8;
}

- (id)peopleExtractionAttributes
{
  return &off_1000E72C0;
}

- (id)peopleFetchAttributes
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004B744;
  block[3] = &unk_1000DA128;
  block[4] = self;
  if (qword_1000F8FD0 != -1) {
    dispatch_once(&qword_1000F8FD0, block);
  }
  return (id)qword_1000F8FC8;
}

- (id)peoplePreferredBundles
{
  return &off_1000E72F0;
}

- (id)docUnderstandingFetchAttributes
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004B8A0;
  block[3] = &unk_1000DA128;
  block[4] = self;
  if (qword_1000F8FE0 != -1) {
    dispatch_once(&qword_1000F8FE0, block);
  }
  return (id)qword_1000F8FD8;
}

- (id)docUnderstandingExtractionAttributes
{
  return &off_1000E7320;
}

- (id)docUnderstandingTrackingAttributes
{
  return &off_1000E7338;
}

- (id)docUnderstandingIncludeBundles
{
  return &off_1000E7350;
}

- (id)docUnderstandingItemDomainIds
{
  return &off_1000E7368;
}

- (void)setMaxGraphSize:(int64_t)a3
{
  self->_maxGraphSize = a3;
}

- (void)setMaxArchiveSize:(int64_t)a3
{
  self->_maxArchiveSize = a3;
}

- (void)setMaxJournalSize:(int64_t)a3
{
  self->_maxJournalSize = a3;
}

- (void)setMaxJournalSizeForPurge:(int64_t)a3
{
  self->_maxJournalSizeForPurge = a3;
}

- (void)setMaxEntityCount:(int64_t)a3
{
  self->_maxEntityCount = a3;
}

- (void)setMaxQueryItemCount:(int64_t)a3
{
  self->_maxQueryItemCount = a3;
}

- (void)setMaxItemBatchCount:(int64_t)a3
{
  self->_maxItemBatchCount = a3;
}

- (void)setMaxJournalItemCount:(int64_t)a3
{
  self->_maxJournalItemCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spotlightResourcesRoot, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end