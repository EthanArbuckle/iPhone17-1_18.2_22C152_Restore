@interface SKGJobContext
+ (id)debugJobContextWithDeviceUnlocked:(BOOL)a3;
+ (id)debugJobContextWithDeviceUnlocked:(BOOL)a3 deviceProtected:(BOOL)a4 atResourcePath:(id)a5;
+ (id)defaultJobContextWithDeviceUnlocked:(BOOL)a3;
+ (id)reindexJobContextWithDeviceUnlocked:(BOOL)a3;
+ (id)testJobContextWithName:(id)a3 deviceUnlocked:(BOOL)a4 deviceProtected:(BOOL)a5;
- (BOOL)canDefer;
- (BOOL)canDoGraphAnalysis;
- (BOOL)canDoGraphScoring;
- (BOOL)debug;
- (BOOL)doArchiving;
- (BOOL)doJournals;
- (BOOL)done;
- (BOOL)finishedDeletes;
- (BOOL)finishedFileTextQueries;
- (BOOL)finishedGraphAnalysis;
- (BOOL)finishedGraphAnalysisJob;
- (BOOL)finishedGraphScoring;
- (BOOL)finishedItemUpdates;
- (BOOL)finishedItemUpdatesJob;
- (BOOL)finishedJournals;
- (BOOL)finishedMegadomeIndexing;
- (BOOL)finishedPeopleArchives;
- (BOOL)finishedPeopleIndexingJob;
- (BOOL)finishedPeopleQueries;
- (BOOL)finishedTextProcessingJob;
- (BOOL)finishedTextQueries;
- (BOOL)isCJK;
- (BOOL)shouldAnalyzeGraph;
- (BOOL)shouldDestroy;
- (BOOL)shouldIgnore;
- (BOOL)shouldIndexPeople;
- (BOOL)shouldProcessText;
- (BOOL)shouldProcessUpdates;
- (BOOL)shouldReportProgress;
- (BOOL)shouldReset;
- (BOOL)startDeletes;
- (BOOL)startFileTextQueries;
- (BOOL)startGraphAnalysis;
- (BOOL)startGraphAnalysisJob;
- (BOOL)startGraphScoring;
- (BOOL)startItemUpdates;
- (BOOL)startItemUpdatesJob;
- (BOOL)startJournals;
- (BOOL)startMegadomeIndexing;
- (BOOL)startPeopleArchives;
- (BOOL)startPeopleIndexingJob;
- (BOOL)startPeopleQueries;
- (BOOL)startTextProcessingJob;
- (BOOL)startTextQueries;
- (BOOL)upgradePathCleanupAll;
- (NSArray)currentPreferredLanguages;
- (NSArray)currentPreferredLocales;
- (NSArray)doNotUpdateDelegatesList;
- (NSArray)doNotUpdateList;
- (NSArray)excludeBundles;
- (NSArray)includeBundles;
- (NSArray)protectionClasses;
- (NSDate)documentUnderstandingGenStartTime;
- (NSDate)embeddingGenStartTime;
- (NSDate)suggestedEventsGenStartTime;
- (NSLocale)currentLocale;
- (NSString)corespotlightResourcesPath;
- (NSString)corespotlightResourcesRootPath;
- (NSString)currentLanguage;
- (NSString)currentMessage;
- (NSString)deleteArchivePath;
- (NSString)eventArchivePath;
- (NSString)jobIdentifier;
- (NSString)journalArchivePath;
- (NSString)keyphraseArchivePath;
- (NSString)knowledgeIndexIdentifier;
- (NSString)peopleArchivePath;
- (NSString)spotlightKnowledgeGraphConfigPath;
- (NSString)spotlightKnowledgeGraphPath;
- (NSString)spotlightKnowledgePath;
- (NSString)spotlightResourcesRootPath;
- (NSString)taskName;
- (NSString)updateArchivePath;
- (SKGJobContext)init;
- (SKGJobContext)initWithDebugResourceDirectoryPath:(id)a3 deviceProtected:(BOOL)a4 deviceUnlocked:(BOOL)a5;
- (SKGJobContext)initWithDeviceUnlocked:(BOOL)a3;
- (SKGJobContext)initWithTestName:(id)a3 deviceProtected:(BOOL)a4 deviceUnlocked:(BOOL)a5;
- (SKGKnowledgeFeedback)feedback;
- (id)allProtectionClasses;
- (id)deletesPathWithProtectionClass:(id)a3;
- (id)filterQuery;
- (id)journalsPathWithProtectionClass:(id)a3;
- (id)listener;
- (id)peopleArchivePathWithProtectionClass:(id)a3;
- (int64_t)getGenCompleteDayString:(id)a3 forBundle:(id)a4;
- (int64_t)graphVersion;
- (int64_t)maxItemCountPerBatch;
- (int64_t)maxItemCountPerJob;
- (int64_t)upgradePathIsOldThresInWeeks;
- (void)_resetWithGroup:(id)a3;
- (void)commonInitWithResourcePath:(id)a3 bundleIdentifier:(id)a4 isProtected:(BOOL)a5 isDeviceUnlocked:(BOOL)a6;
- (void)destroyWithGroup:(id)a3;
- (void)end;
- (void)ignoreWithGroup:(id)a3;
- (void)loadWithGroup:(id)a3;
- (void)logArchiveItemsProcessed:(id)a3;
- (void)logArchiveWithName:(id)a3 protectionClass:(id)a4;
- (void)logError:(int64_t)a3 message:(id)a4;
- (void)logEvent:(int64_t)a3 message:(id)a4;
- (void)logFlag:(int64_t)a3 message:(id)a4;
- (void)logJournalItemsProcessed:(id)a3;
- (void)logProcessedArchiveWithName:(id)a3 protectionClass:(id)a4;
- (void)logProcessedJournalWithName:(id)a3 protectionClass:(id)a4;
- (void)logQueryItemsArchived:(id)a3;
- (void)logQueryItemsProcessed:(id)a3;
- (void)logQueryItemsUpdated:(id)a3;
- (void)logReindexCount:(unint64_t)a3;
- (void)logSignpost:(int64_t)a3 message:(id)a4;
- (void)resetWithGroup:(id)a3;
- (void)setExcludeBundles:(id)a3;
- (void)setFilterQuery:(id)a3;
- (void)setGenCompleteDayString:(id)a3 forBundle:(id)a4 day:(int64_t)a5;
- (void)setIncludeBundles:(id)a3;
- (void)setIsDebug:(BOOL)a3;
- (void)setMaxItemCountPerBatch:(int64_t)a3;
- (void)setMaxItemCountPerJob:(int64_t)a3;
- (void)setTaskName:(id)a3;
- (void)start;
- (void)timeout;
@end

@implementation SKGJobContext

- (SKGJobContext)initWithDeviceUnlocked:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SKGJobContext;
  v4 = [(SKGJobContext *)&v7 init];
  v5 = v4;
  if (v4) {
    [(SKGJobContext *)v4 commonInitWithResourcePath:0 bundleIdentifier:@"com.apple.spotlight.contacts" isProtected:1 isDeviceUnlocked:v3];
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskName, 0);
  objc_storeStrong((id *)&self->_filterQuery, 0);
  objc_storeStrong((id *)&self->_currentMessage, 0);
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_excludeBundles, 0);
  objc_storeStrong((id *)&self->_includeBundles, 0);
  objc_storeStrong((id *)&self->_spotlightResourcesRoot, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_feedback, 0);

  objc_storeStrong((id *)&self->_listener, 0);
}

- (int64_t)maxItemCountPerBatch
{
  return self->_maxItemCountPerBatch;
}

- (void)logSignpost:(int64_t)a3 message:(id)a4
{
  id v6 = a4;
  id v7 = [(SKGJobContext *)self feedback];
  [v7 logSignpost:a3 message:v6];
}

- (SKGKnowledgeFeedback)feedback
{
  return self->_feedback;
}

- (NSArray)protectionClasses
{
  if (self->_isProtectedActivity)
  {
    if (self->_isForTesting)
    {
      v8[0] = NSFileProtectionComplete;
      v8[1] = NSFileProtectionCompleteUntilFirstUserAuthentication;
      v8[2] = NSFileProtectionCompleteWhenUserInactive;
      v8[3] = NSFileProtectionCompleteUnlessOpen;
      v8[4] = @"Priority";
      v2 = v8;
      uint64_t v3 = 5;
    }
    else if (self->_isDeviceUnlocked)
    {
      v7[0] = NSFileProtectionComplete;
      v7[1] = NSFileProtectionCompleteUnlessOpen;
      v2 = v7;
      uint64_t v3 = 2;
    }
    else
    {
      v6[0] = NSFileProtectionCompleteUntilFirstUserAuthentication;
      v6[1] = NSFileProtectionCompleteWhenUserInactive;
      v6[2] = @"Priority";
      v2 = v6;
      uint64_t v3 = 3;
    }
    v4 = +[NSArray arrayWithObjects:v2 count:v3];
  }
  else
  {
    v4 = &off_1000E7548;
  }

  return (NSArray *)v4;
}

- (id)filterQuery
{
  return self->_filterQuery;
}

- (NSArray)doNotUpdateList
{
  return [(SKGSystemListener *)self->_listener doNotUpdateList];
}

- (NSArray)currentPreferredLanguages
{
  return [(SKGSystemListener *)self->_listener currentPreferredLanguages];
}

+ (id)defaultJobContextWithDeviceUnlocked:(BOOL)a3
{
  uint64_t v3 = [[SKGJobContext alloc] initWithDeviceUnlocked:a3];
  v4 = +[SKGProcessorContext sharedContext];
  v5 = [v4 excludeBundles];
  [(SKGJobContext *)v3 setExcludeBundles:v5];

  return v3;
}

+ (id)reindexJobContextWithDeviceUnlocked:(BOOL)a3
{
  uint64_t v3 = [[SKGJobContext alloc] initWithDeviceUnlocked:a3];
  v4 = +[SKGProcessorContext sharedContext];
  v5 = [v4 excludeBundles];
  id v6 = [v5 arrayByAddingObject:@"com.apple.mobilephone"];
  [(SKGJobContext *)v3 setExcludeBundles:v6];

  return v3;
}

+ (id)debugJobContextWithDeviceUnlocked:(BOOL)a3
{
  uint64_t v3 = [[SKGJobContext alloc] initWithDeviceUnlocked:a3];
  [(SKGJobContext *)v3 setIsDebug:1];

  return v3;
}

+ (id)debugJobContextWithDeviceUnlocked:(BOOL)a3 deviceProtected:(BOOL)a4 atResourcePath:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v7 = a5;
  v8 = [[SKGJobContext alloc] initWithDebugResourceDirectoryPath:v7 deviceProtected:v5 deviceUnlocked:v6];

  [(SKGJobContext *)v8 setIsDebug:1];

  return v8;
}

+ (id)testJobContextWithName:(id)a3 deviceUnlocked:(BOOL)a4 deviceProtected:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v7 = a3;
  v8 = [[SKGJobContext alloc] initWithTestName:v7 deviceProtected:v5 deviceUnlocked:v6];

  [(SKGJobContext *)v8 logEvent:6 message:@"resetting for testing"];
  [(SKGJobContext *)v8 logEvent:5 message:@"reporting for testing"];
  [(SKGJobContext *)v8 setIncludeBundles:&off_1000E74B8];
  [(SKGJobContext *)v8 setMaxItemCountPerJob:50];
  [(SKGJobContext *)v8 setIsDebug:1];

  return v8;
}

- (SKGJobContext)initWithDebugResourceDirectoryPath:(id)a3 deviceProtected:(BOOL)a4 deviceUnlocked:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SKGJobContext;
  v9 = [(SKGJobContext *)&v12 init];
  v10 = v9;
  if (v9) {
    [(SKGJobContext *)v9 commonInitWithResourcePath:v8 bundleIdentifier:@"com.apple.cslinguistics" isProtected:v6 isDeviceUnlocked:v5];
  }

  return v10;
}

- (SKGJobContext)initWithTestName:(id)a3 deviceProtected:(BOOL)a4 deviceUnlocked:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SKGJobContext;
  v9 = [(SKGJobContext *)&v12 init];
  if (v9)
  {
    v10 = +[NSString stringWithFormat:@"/tmp/%@", v8];
    [(SKGJobContext *)v9 commonInitWithResourcePath:v10 bundleIdentifier:@"com.apple.skg.tests" isProtected:v6 isDeviceUnlocked:v5];
  }
  return v9;
}

- (SKGJobContext)init
{
  v5.receiver = self;
  v5.super_class = (Class)SKGJobContext;
  v2 = [(SKGJobContext *)&v5 init];
  uint64_t v3 = v2;
  if (v2) {
    [(SKGJobContext *)v2 commonInitWithResourcePath:0 bundleIdentifier:@"com.apple.spotlight.contacts" isProtected:1 isDeviceUnlocked:0];
  }
  return v3;
}

- (void)commonInitWithResourcePath:(id)a3 bundleIdentifier:(id)a4 isProtected:(BOOL)a5 isDeviceUnlocked:(BOOL)a6
{
  id v23 = a3;
  id v11 = a4;
  objc_super v12 = objc_alloc_init(SKGSystemListener);
  listener = self->_listener;
  self->_listener = v12;

  objc_storeStrong((id *)&self->_spotlightResourcesRoot, a3);
  objc_storeStrong((id *)&self->_bundleIdentifier, a4);
  currentMessage = self->_currentMessage;
  self->_currentMessage = 0;

  events = self->_events;
  self->_events = (NSArray *)&__NSArray0__struct;

  self->_isProtectedActivity = a5;
  self->_isDeviceUnlocked = a6;
  self->_isForTesting = 0;
  v16 = +[SKGProcessorContext sharedContext];
  self->_maxItemCountPerJob = (int64_t)[v16 maxQueryItemCount];

  v17 = +[SKGProcessorContext sharedContext];
  self->_maxItemCountPerBatch = (int64_t)[v17 maxItemBatchCount];

  self->_upgradePathIsOldThresInWeeks = 2;
  id v18 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"SKGJobContext"];
  v19 = [v18 objectForKey:@"upgradePathIsOldThresInWeeks"];

  if (v19) {
    self->_upgradePathIsOldThresInWeeks = (int64_t)[v18 integerForKey:@"upgradePathIsOldThresInWeeks"];
  }
  self->_upgradePathCleanupAll = 0;
  v20 = [v18 objectForKey:@"upgradePathCleanupAll"];

  if (v20) {
    self->_upgradePathCleanupAll = [v18 BOOLForKey:@"upgradePathCleanupAll"];
  }
  v21 = objc_alloc_init(SKGKnowledgeFeedback);
  feedback = self->_feedback;
  self->_feedback = v21;
}

- (id)listener
{
  return self->_listener;
}

- (NSLocale)currentLocale
{
  return [(SKGSystemListener *)self->_listener currentLocale];
}

- (NSArray)currentPreferredLocales
{
  return [(SKGSystemListener *)self->_listener currentPreferredLocales];
}

- (NSString)currentLanguage
{
  return [(SKGSystemListener *)self->_listener currentLanguage];
}

- (NSArray)doNotUpdateDelegatesList
{
  return (NSArray *)&off_1000E74D0;
}

- (NSString)knowledgeIndexIdentifier
{
  return (NSString *)@"com.apple.spotlight.contacts";
}

- (NSString)jobIdentifier
{
  if ([(SKGJobContext *)self debug]) {
    v2 = @"V2.debug";
  }
  else {
    v2 = @"V2";
  }

  return (NSString *)v2;
}

- (void)setIsDebug:(BOOL)a3
{
  self->_isForTesting = a3;
}

- (void)setFilterQuery:(id)a3
{
}

- (void)setIncludeBundles:(id)a3
{
}

- (NSArray)includeBundles
{
  return self->_includeBundles;
}

- (void)setExcludeBundles:(id)a3
{
}

- (NSArray)excludeBundles
{
  return self->_excludeBundles;
}

- (void)setMaxItemCountPerJob:(int64_t)a3
{
  self->_maxItemCountPerJob = a3;
}

- (int64_t)maxItemCountPerJob
{
  return self->_maxItemCountPerJob;
}

- (void)setMaxItemCountPerBatch:(int64_t)a3
{
  self->_maxItemCountPerBatch = a3;
}

- (NSString)corespotlightResourcesRootPath
{
  v2 = NSHomeDirectory();
  uint64_t v3 = +[NSString stringWithFormat:@"%@/%@", v2, @"Library/Spotlight"];

  return (NSString *)v3;
}

- (NSString)corespotlightResourcesPath
{
  v2 = [(SKGJobContext *)self corespotlightResourcesRootPath];
  uint64_t v3 = +[NSString stringWithFormat:@"%@/CoreSpotlight", v2];

  return (NSString *)v3;
}

- (NSString)spotlightResourcesRootPath
{
  spotlightResourcesRoot = self->_spotlightResourcesRoot;
  if (spotlightResourcesRoot)
  {
    uint64_t v3 = spotlightResourcesRoot;
  }
  else
  {
    uint64_t v3 = [(SKGJobContext *)self corespotlightResourcesPath];
  }

  return v3;
}

- (NSString)spotlightKnowledgePath
{
  v2 = [(SKGJobContext *)self spotlightResourcesRootPath];
  uint64_t v3 = +[NSString stringWithFormat:@"%@/SpotlightKnowledge/index.V2", v2];

  return (NSString *)v3;
}

- (NSString)spotlightKnowledgeGraphConfigPath
{
  v2 = [(SKGJobContext *)self spotlightKnowledgePath];
  uint64_t v3 = +[NSString stringWithFormat:@"%@/kg_config.mdplist", v2];

  return (NSString *)v3;
}

- (NSString)spotlightKnowledgeGraphPath
{
  v2 = [(SKGJobContext *)self spotlightKnowledgePath];
  uint64_t v3 = +[NSString stringWithFormat:@"%@/KG", v2];

  return (NSString *)v3;
}

- (NSString)deleteArchivePath
{
  v2 = [(SKGJobContext *)self spotlightKnowledgePath];
  uint64_t v3 = +[NSString stringWithFormat:@"%@/deletes", v2];

  return (NSString *)v3;
}

- (NSString)journalArchivePath
{
  v2 = [(SKGJobContext *)self spotlightKnowledgePath];
  uint64_t v3 = +[NSString stringWithFormat:@"%@/journals", v2];

  return (NSString *)v3;
}

- (NSString)peopleArchivePath
{
  v2 = [(SKGJobContext *)self spotlightKnowledgePath];
  uint64_t v3 = +[NSString stringWithFormat:@"%@/archives", v2];

  return (NSString *)v3;
}

- (NSString)keyphraseArchivePath
{
  v2 = [(SKGJobContext *)self spotlightKnowledgePath];
  uint64_t v3 = +[NSString stringWithFormat:@"%@/keyphrases", v2];

  return (NSString *)v3;
}

- (NSString)eventArchivePath
{
  v2 = [(SKGJobContext *)self spotlightKnowledgePath];
  uint64_t v3 = +[NSString stringWithFormat:@"%@/events", v2];

  return (NSString *)v3;
}

- (id)deletesPathWithProtectionClass:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(SKGJobContext *)self deleteArchivePath];
  BOOL v6 = +[NSString stringWithFormat:@"%@/%@", v5, v4];

  return v6;
}

- (id)journalsPathWithProtectionClass:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(SKGJobContext *)self journalArchivePath];
  BOOL v6 = +[NSString stringWithFormat:@"%@/%@", v5, v4];

  return v6;
}

- (id)peopleArchivePathWithProtectionClass:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(SKGJobContext *)self peopleArchivePath];
  BOOL v6 = +[NSString stringWithFormat:@"%@/%@", v5, v4];

  return v6;
}

- (NSString)updateArchivePath
{
  v2 = [(SKGJobContext *)self spotlightKnowledgePath];
  uint64_t v3 = +[NSString stringWithFormat:@"%@/updates", v2];

  return (NSString *)v3;
}

- (void)logEvent:(int64_t)a3 message:(id)a4
{
  events = self->_events;
  id v7 = a4;
  id v8 = +[NSNumber numberWithInteger:a3];
  v9 = [(NSArray *)events arrayByAddingObject:v8];
  v10 = self->_events;
  self->_events = v9;

  id v11 = [(SKGJobContext *)self feedback];
  [v11 logEvent:a3 message:v7];
}

- (void)logError:(int64_t)a3 message:(id)a4
{
  id v6 = a4;
  id v7 = [(SKGJobContext *)self feedback];
  [v7 logError:a3 message:v6];
}

- (void)logFlag:(int64_t)a3 message:(id)a4
{
  id v6 = (NSString *)a4;
  id v7 = [(SKGJobContext *)self feedback];
  [v7 logFlag:a3 message:v6];

  currentMessage = self->_currentMessage;
  self->_currentMessage = v6;
}

- (void)logReindexCount:(unint64_t)a3
{
  if (a3)
  {
    objc_super v5 = [(SKGJobContext *)self taskName];
    id v6 = [v5 length];

    if (v6)
    {
      id v8 = [(SKGJobContext *)self feedback];
      id v7 = [(SKGJobContext *)self taskName];
      [v8 logUpdateTaskReindexCount:a3 taskName:v7];
    }
  }
}

- (BOOL)debug
{
  return self->_isForTesting;
}

- (int64_t)graphVersion
{
  v2 = [(SKGJobContext *)self feedback];
  id v3 = [v2 graphVersion];

  return (int64_t)v3;
}

- (void)start
{
  id v2 = [(SKGJobContext *)self feedback];
  [v2 logStart];
}

- (void)end
{
  id v2 = [(SKGJobContext *)self feedback];
  [v2 logEnd];
}

- (void)timeout
{
  id v2 = [(SKGJobContext *)self feedback];
  [v2 logFlag:17 message:@"didTimeout"];
}

- (void)loadWithGroup:(id)a3
{
  id v25 = a3;
  if ([(SKGJobContext *)self shouldIndexPeople]
    || [(SKGJobContext *)self shouldAnalyzeGraph])
  {
    id v4 = [[SKGDiskManager alloc] initWithJobContext:self];
    objc_super v5 = [(SKGJobContext *)self spotlightKnowledgeGraphConfigPath];
    id v6 = +[NSFileManager defaultManager];
    unsigned __int8 v7 = [v6 fileExistsAtPath:v5];

    if (v7)
    {
      id v8 = [[SKGConfig alloc] initWithConfigPath:v5];
      id v9 = [(SKGConfig *)v8 resourceVersion];
      if (v9 == (id)[(SKGJobContext *)self graphVersion])
      {
        id v10 = [(SKGConfig *)v8 releaseVersion];
        id v11 = +[SKGProcessorContext sharedContext];
        id v12 = [v11 releaseVersion];

        if (v10 == v12)
        {
LABEL_9:
          if (![(SKGJobContext *)self debug])
          {
            v13 = [(SKGJobContext *)self protectionClasses];
            [(SKGDiskManager *)v4 transferJournalsForProtectionClasses:v13];
          }
          [(SKGDiskManager *)v4 refresh];
          id v14 = [(SKGDiskManager *)v4 graphSize];
          v15 = +[SKGProcessorContext sharedContext];
          id v16 = [v15 maxGraphSize];

          if ((uint64_t)v14 > (uint64_t)v16) {
            [(SKGJobContext *)self logError:3 message:@"graph too large"];
          }
          id v17 = [(SKGDiskManager *)v4 peopleArchiveSize];
          id v18 = +[SKGProcessorContext sharedContext];
          id v19 = [v18 maxArchiveSize];

          if ((uint64_t)v17 > (uint64_t)v19) {
            [(SKGJobContext *)self logError:6 message:@"archive size too large"];
          }
          id v20 = [(SKGDiskManager *)v4 journalsSize];
          v21 = +[SKGProcessorContext sharedContext];
          if ((uint64_t)v20 <= (uint64_t)[v21 maxJournalSize])
          {
            id v22 = [(SKGDiskManager *)v4 deletesSize];
            id v23 = +[SKGProcessorContext sharedContext];
            id v24 = [v23 maxJournalSize];

            if ((uint64_t)v22 <= (uint64_t)v24)
            {
LABEL_19:

              goto LABEL_20;
            }
          }
          else
          {
          }
          [(SKGJobContext *)self logError:7 message:@"journal size too large"];
          goto LABEL_19;
        }
      }
      [(SKGJobContext *)self logError:5 message:@"graph too old"];
      [(SKGDiskManager *)v4 resetWithGroup:v25];
      [(SKGJobContext *)self _resetWithGroup:v25];
    }
    else
    {
      [(SKGDiskManager *)v4 resetWithGroup:v25];
      [(SKGJobContext *)self _resetWithGroup:v25];
    }
    id v8 = 0;
    goto LABEL_9;
  }
LABEL_20:
}

- (void)ignoreWithGroup:(id)a3
{
  id v3 = [(SKGJobContext *)self feedback];
  [v3 logFlag:10 message:@"didIgnore"];
}

- (void)_resetWithGroup:(id)a3
{
  id v4 = [(SKGJobContext *)self feedback];
  objc_super v5 = (char *)[v4 graphVersion];

  id v6 = [(SKGJobContext *)self feedback];
  [v6 clear];

  unsigned __int8 v7 = [(SKGJobContext *)self feedback];
  [v7 logGraphVersion:v5 + 1];

  id v8 = [(SKGJobContext *)self feedback];
  [v8 logFlag:11 message:@"didReset"];
}

- (void)resetWithGroup:(id)a3
{
  id v4 = a3;
  objc_super v5 = [[SKGDiskManager alloc] initWithJobContext:self];
  [(SKGDiskManager *)v5 resetWithGroup:v4];
  [(SKGJobContext *)self _resetWithGroup:v4];
}

- (void)destroyWithGroup:(id)a3
{
  id v4 = a3;
  objc_super v5 = [[SKGDiskManager alloc] initWithJobContext:self];
  [(SKGDiskManager *)v5 destroyWithGroup:v4];
}

- (BOOL)doArchiving
{
  return self->_isProtectedActivity && self->_isDeviceUnlocked;
}

- (BOOL)doJournals
{
  return ![(SKGJobContext *)self doArchiving];
}

- (BOOL)shouldAnalyzeGraph
{
  return [(NSArray *)self->_events containsObject:&off_1000E6330];
}

- (BOOL)shouldIndexPeople
{
  return [(NSArray *)self->_events containsObject:&off_1000E6348];
}

- (BOOL)shouldProcessText
{
  return [(NSArray *)self->_events containsObject:&off_1000E6360];
}

- (BOOL)shouldProcessUpdates
{
  return [(NSArray *)self->_events containsObject:&off_1000E6378];
}

- (BOOL)shouldReportProgress
{
  return [(NSArray *)self->_events containsObject:&off_1000E6390];
}

- (BOOL)shouldIgnore
{
  id v3 = [(SKGJobContext *)self feedback];
  BOOL v4 = 1;
  unsigned __int8 v5 = [v3 hasFlag:1];

  if ((v5 & 1) == 0)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = [&off_1000E74E8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v14;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(&off_1000E74E8);
          }
          id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          id v11 = [(SKGJobContext *)self feedback];
          LOBYTE(v10) = objc_msgSend(v11, "hasError:", (int)objc_msgSend(v10, "intValue"));

          if (v10) {
            return 1;
          }
        }
        id v7 = [&off_1000E74E8 countByEnumeratingWithState:&v13 objects:v17 count:16];
        BOOL v4 = 0;
        if (v7) {
          continue;
        }
        break;
      }
    }
    else
    {
      return 0;
    }
  }
  return v4;
}

- (BOOL)shouldReset
{
  id v3 = [(SKGJobContext *)self feedback];
  unsigned __int8 v4 = [v3 hasEvent:6];

  if ((v4 & 1) == 0)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = [&off_1000E7500 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (!v5) {
      return (char)v5;
    }
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
LABEL_6:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v13 != v7) {
        objc_enumerationMutation(&off_1000E7500);
      }
      id v9 = *(void **)(*((void *)&v12 + 1) + 8 * v8);
      id v10 = [(SKGJobContext *)self feedback];
      LOBYTE(v9) = objc_msgSend(v10, "hasError:", (int)objc_msgSend(v9, "intValue"));

      if (v9) {
        break;
      }
      if (v6 == (id)++v8)
      {
        id v6 = [&off_1000E7500 countByEnumeratingWithState:&v12 objects:v16 count:16];
        LOBYTE(v5) = 0;
        if (v6) {
          goto LABEL_6;
        }
        return (char)v5;
      }
    }
  }
  LOBYTE(v5) = 1;
  return (char)v5;
}

- (BOOL)shouldDestroy
{
  id v3 = [(SKGJobContext *)self feedback];
  unsigned __int8 v4 = [v3 hasFlag:3];

  if ((v4 & 1) == 0)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = [&off_1000E7518 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (!v6) {
      return ![(SKGSystemListener *)self->_listener hasDiskCapacity];
    }
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
LABEL_6:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v13 != v8) {
        objc_enumerationMutation(&off_1000E7518);
      }
      id v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
      id v11 = [(SKGJobContext *)self feedback];
      LOBYTE(v10) = objc_msgSend(v11, "hasError:", (int)objc_msgSend(v10, "intValue"));

      if (v10) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id v7 = [&off_1000E7518 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7) {
          goto LABEL_6;
        }
        return ![(SKGSystemListener *)self->_listener hasDiskCapacity];
      }
    }
  }
  return 1;
}

- (id)allProtectionClasses
{
  if (self->_isProtectedActivity)
  {
    v4[0] = NSFileProtectionCompleteUntilFirstUserAuthentication;
    v4[1] = NSFileProtectionComplete;
    v4[2] = NSFileProtectionCompleteUnlessOpen;
    v4[3] = @"Priority";
    id v2 = +[NSArray arrayWithObjects:v4 count:4];
  }
  else
  {
    id v2 = &off_1000E7530;
  }

  return v2;
}

- (BOOL)startTextProcessingJob
{
  currentMessage = self->_currentMessage;
  self->_currentMessage = (NSString *)@"textProcessingJob";

  unsigned __int8 v4 = [(SKGJobContext *)self feedback];
  [v4 logSignpost:1 message:self->_currentMessage];

  return 1;
}

- (BOOL)finishedTextProcessingJob
{
  currentMessage = self->_currentMessage;
  self->_currentMessage = (NSString *)@"textProcessingJob";

  unsigned __int8 v4 = [(SKGJobContext *)self feedback];
  [v4 logSignpost:2 message:self->_currentMessage];

  return 1;
}

- (BOOL)startItemUpdatesJob
{
  currentMessage = self->_currentMessage;
  self->_currentMessage = (NSString *)@"itemUpdatesJob";

  unsigned __int8 v4 = [(SKGJobContext *)self feedback];
  [v4 logSignpost:3 message:self->_currentMessage];

  return 1;
}

- (BOOL)finishedItemUpdatesJob
{
  currentMessage = self->_currentMessage;
  self->_currentMessage = (NSString *)@"itemUpdatesJob";

  unsigned __int8 v4 = [(SKGJobContext *)self feedback];
  [v4 logSignpost:4 message:self->_currentMessage];

  return 1;
}

- (BOOL)startPeopleIndexingJob
{
  currentMessage = self->_currentMessage;
  self->_currentMessage = (NSString *)@"peopleIndexingJob";

  unsigned __int8 v4 = [(SKGJobContext *)self feedback];
  [v4 logSignpost:9 message:self->_currentMessage];

  return 1;
}

- (BOOL)finishedPeopleIndexingJob
{
  currentMessage = self->_currentMessage;
  self->_currentMessage = (NSString *)@"peopleIndexingJob";

  unsigned __int8 v4 = [(SKGJobContext *)self feedback];
  [v4 logSignpost:10 message:self->_currentMessage];

  return 1;
}

- (BOOL)startGraphAnalysisJob
{
  currentMessage = self->_currentMessage;
  self->_currentMessage = (NSString *)@"graphAnalysisJob";

  unsigned __int8 v4 = [(SKGJobContext *)self feedback];
  [v4 logSignpost:11 message:self->_currentMessage];

  return 1;
}

- (BOOL)finishedGraphAnalysisJob
{
  currentMessage = self->_currentMessage;
  self->_currentMessage = (NSString *)@"graphAnalysisJob";

  unsigned __int8 v4 = [(SKGJobContext *)self feedback];
  [v4 logSignpost:12 message:self->_currentMessage];

  return 1;
}

- (BOOL)startDeletes
{
  currentMessage = self->_currentMessage;
  self->_currentMessage = (NSString *)@"readDeleteJournals";

  unsigned __int8 v4 = [(SKGJobContext *)self feedback];
  [v4 logSignpost:15 message:self->_currentMessage];

  return 1;
}

- (BOOL)finishedDeletes
{
  currentMessage = self->_currentMessage;
  self->_currentMessage = (NSString *)@"readDeleteJournals";

  unsigned __int8 v4 = [(SKGJobContext *)self feedback];
  [v4 logSignpost:16 message:self->_currentMessage];

  return 1;
}

- (BOOL)startJournals
{
  currentMessage = self->_currentMessage;
  self->_currentMessage = (NSString *)@"readJournals";

  unsigned __int8 v4 = [(SKGJobContext *)self feedback];
  [v4 logSignpost:13 message:self->_currentMessage];

  return 1;
}

- (BOOL)finishedJournals
{
  currentMessage = self->_currentMessage;
  self->_currentMessage = (NSString *)@"readJournals";

  unsigned __int8 v4 = [(SKGJobContext *)self feedback];
  [v4 logSignpost:14 message:self->_currentMessage];

  return 1;
}

- (BOOL)startItemUpdates
{
  currentMessage = self->_currentMessage;
  self->_currentMessage = (NSString *)@"itemUpdates";

  unsigned __int8 v4 = [(SKGJobContext *)self feedback];
  [v4 logSignpost:3 message:self->_currentMessage];

  return 1;
}

- (BOOL)finishedItemUpdates
{
  currentMessage = self->_currentMessage;
  self->_currentMessage = (NSString *)@"itemUpdates";

  unsigned __int8 v4 = [(SKGJobContext *)self feedback];
  [v4 logSignpost:4 message:self->_currentMessage];

  return 1;
}

- (BOOL)startTextQueries
{
  currentMessage = self->_currentMessage;
  self->_currentMessage = (NSString *)@"textQueries";

  unsigned __int8 v4 = [(SKGJobContext *)self feedback];
  [v4 logSignpost:19 message:self->_currentMessage];

  return 1;
}

- (BOOL)finishedTextQueries
{
  currentMessage = self->_currentMessage;
  self->_currentMessage = (NSString *)@"textQueries";

  unsigned __int8 v4 = [(SKGJobContext *)self feedback];
  [v4 logSignpost:20 message:self->_currentMessage];

  id v5 = [(SKGJobContext *)self feedback];
  id v6 = [v5 queryItemExtractedCount];
  int64_t v7 = [(SKGJobContext *)self maxItemCountPerJob];

  if ((uint64_t)v6 >= v7)
  {
    uint64_t v8 = [(SKGJobContext *)self feedback];
    [v8 logFlag:28 message:@"didHitMax"];
  }
  return 1;
}

- (BOOL)startFileTextQueries
{
  currentMessage = self->_currentMessage;
  self->_currentMessage = (NSString *)@"fileTextQueries";

  unsigned __int8 v4 = [(SKGJobContext *)self feedback];
  [v4 logSignpost:19 message:self->_currentMessage];

  return 1;
}

- (BOOL)finishedFileTextQueries
{
  currentMessage = self->_currentMessage;
  self->_currentMessage = (NSString *)@"fileTextQueries";

  unsigned __int8 v4 = [(SKGJobContext *)self feedback];
  [v4 logSignpost:20 message:self->_currentMessage];

  id v5 = [(SKGJobContext *)self feedback];
  id v6 = [v5 queryItemExtractedCount];
  int64_t v7 = [(SKGJobContext *)self maxItemCountPerJob];

  if ((uint64_t)v6 >= v7)
  {
    uint64_t v8 = [(SKGJobContext *)self feedback];
    [v8 logFlag:28 message:@"didHitMax"];
  }
  return 1;
}

- (BOOL)startPeopleArchives
{
  currentMessage = self->_currentMessage;
  self->_currentMessage = (NSString *)@"readPeopleArchives";

  unsigned __int8 v4 = [(SKGJobContext *)self feedback];
  [v4 logSignpost:17 message:self->_currentMessage];

  return 1;
}

- (BOOL)finishedPeopleArchives
{
  currentMessage = self->_currentMessage;
  self->_currentMessage = (NSString *)@"readPeopleArchives";

  unsigned __int8 v4 = [(SKGJobContext *)self feedback];
  [v4 logSignpost:18 message:self->_currentMessage];

  return 1;
}

- (BOOL)startPeopleQueries
{
  currentMessage = self->_currentMessage;
  self->_currentMessage = (NSString *)@"peopleQueries";

  unsigned __int8 v4 = [(SKGJobContext *)self feedback];
  [v4 logSignpost:19 message:self->_currentMessage];

  return 1;
}

- (BOOL)finishedPeopleQueries
{
  currentMessage = self->_currentMessage;
  self->_currentMessage = (NSString *)@"peopleQueries";

  unsigned __int8 v4 = [(SKGJobContext *)self feedback];
  [v4 logSignpost:20 message:self->_currentMessage];

  id v5 = [(SKGJobContext *)self feedback];
  id v6 = [v5 queryItemExtractedCount];
  int64_t v7 = [(SKGJobContext *)self maxItemCountPerJob];

  if ((uint64_t)v6 >= v7)
  {
    uint64_t v8 = [(SKGJobContext *)self feedback];
    [v8 logFlag:28 message:@"didHitMax"];
  }
  return 1;
}

- (BOOL)startMegadomeIndexing
{
  currentMessage = self->_currentMessage;
  self->_currentMessage = (NSString *)@"megadomeIndexing";

  unsigned __int8 v4 = [(SKGJobContext *)self feedback];
  [v4 logSignpost:21 message:self->_currentMessage];

  return 1;
}

- (BOOL)finishedMegadomeIndexing
{
  currentMessage = self->_currentMessage;
  self->_currentMessage = (NSString *)@"megadomeIndexing";

  unsigned __int8 v4 = [(SKGJobContext *)self feedback];
  [v4 logSignpost:22 message:self->_currentMessage];

  return 1;
}

- (BOOL)startGraphAnalysis
{
  currentMessage = self->_currentMessage;
  self->_currentMessage = (NSString *)@"analyzingGraph";

  unsigned __int8 v4 = [(SKGJobContext *)self feedback];
  [v4 logSignpost:23 message:self->_currentMessage];

  return 1;
}

- (BOOL)finishedGraphAnalysis
{
  currentMessage = self->_currentMessage;
  self->_currentMessage = (NSString *)@"analyzingGraph";

  unsigned __int8 v4 = [(SKGJobContext *)self feedback];
  [v4 logSignpost:24 message:self->_currentMessage];

  return 1;
}

- (BOOL)canDoGraphAnalysis
{
  id v2 = [(SKGJobContext *)self feedback];
  char v3 = [v2 hasCurrentFlagWithName:@"didAnalyzeGraph"] ^ 1;

  return v3;
}

- (BOOL)startGraphScoring
{
  currentMessage = self->_currentMessage;
  self->_currentMessage = (NSString *)@"scoringGraph";

  unsigned __int8 v4 = [(SKGJobContext *)self feedback];
  [v4 logSignpost:23 message:self->_currentMessage];

  return 1;
}

- (BOOL)finishedGraphScoring
{
  char v3 = [(SKGJobContext *)self feedback];
  [v3 logSignpost:26 message:self->_currentMessage];

  unsigned __int8 v4 = [(SKGJobContext *)self feedback];
  [v4 logFlag:21 message:@"didScoreGraph"];

  return 1;
}

- (BOOL)canDoGraphScoring
{
  id v2 = [(SKGJobContext *)self feedback];
  char v3 = [v2 hasCurrentFlagWithName:@"didScoreGraph"] ^ 1;

  return v3;
}

- (BOOL)canDefer
{
  if ([(SKGJobContext *)self debug]) {
    return 0;
  }
  if ([(SKGJobContext *)self shouldProcessUpdates])
  {
    id v5 = [(SKGJobContext *)self taskName];
    id v6 = [v5 length];

    if (v6)
    {
      int64_t v7 = [(SKGJobContext *)self feedback];
      uint64_t v8 = [(SKGJobContext *)self taskName];
      id v9 = [v7 getReindexCountForTask:v8];

      return v9 < (id)[(SKGJobContext *)self maxItemCountPerJob];
    }
    return 0;
  }
  if ([(SKGJobContext *)self shouldProcessText])
  {
    id v10 = +[SKGProcessorContext sharedContext];
    unsigned __int8 v11 = [v10 enableEventUpdater];

    if (v11) {
      return 0;
    }
    long long v12 = [(SKGJobContext *)self journalArchivePath];
    long long v13 = [(SKGJobContext *)self protectionClasses];
    long long v14 = &off_1000E7560;
LABEL_12:
    long long v15 = sub_10007B414(v12, v13, v14, 0);

    long long v16 = [v15 objectForKeyedSubscript:@"fileCount"];
    unsigned int v17 = [v16 intValue];

    BOOL v3 = v17 != 0;
    return v3;
  }
  if ([(SKGJobContext *)self shouldIndexPeople])
  {
    long long v12 = [(SKGJobContext *)self peopleArchivePath];
    long long v13 = [(SKGJobContext *)self protectionClasses];
    long long v14 = &off_1000E7578;
    goto LABEL_12;
  }
  if ([(SKGJobContext *)self shouldReportProgress]) {
    return 1;
  }
  id v18 = [(SKGJobContext *)self feedback];
  [v18 elapsedTime];
  BOOL v3 = v19 < 600.0;

  return v3;
}

- (BOOL)done
{
  if ([(SKGJobContext *)self debug]) {
    goto LABEL_2;
  }
  if ([(SKGJobContext *)self shouldProcessText])
  {
    unsigned __int8 v4 = [(SKGJobContext *)self feedback];
    id v5 = v4;
    uint64_t v6 = 23;
  }
  else if ([(SKGJobContext *)self shouldIndexPeople])
  {
    unsigned __int8 v4 = [(SKGJobContext *)self feedback];
    id v5 = v4;
    uint64_t v6 = 25;
  }
  else if ([(SKGJobContext *)self shouldAnalyzeGraph])
  {
    unsigned __int8 v4 = [(SKGJobContext *)self feedback];
    id v5 = v4;
    uint64_t v6 = 26;
  }
  else if ([(SKGJobContext *)self shouldProcessUpdates])
  {
    unsigned __int8 v4 = [(SKGJobContext *)self feedback];
    id v5 = v4;
    uint64_t v6 = 24;
  }
  else
  {
    if (![(SKGJobContext *)self shouldReportProgress])
    {
LABEL_2:
      LOBYTE(v3) = 1;
      return v3;
    }
    unsigned __int8 v4 = [(SKGJobContext *)self feedback];
    id v5 = v4;
    uint64_t v6 = 27;
  }
  if ([v4 hasFlag:v6]) {
    LOBYTE(v3) = 1;
  }
  else {
    unsigned int v3 = ![(SKGJobContext *)self canDefer];
  }

  return v3;
}

- (void)logQueryItemsUpdated:(id)a3
{
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        id v10 = [v4 objectForKeyedSubscript:v9];
        unsigned __int8 v11 = [(SKGJobContext *)self feedback];
        objc_msgSend(v11, "logUpdatedQueryItemCount:bundleIdentifier:", (int)objc_msgSend(v10, "intValue"), v9);
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (void)logQueryItemsArchived:(id)a3
{
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        id v10 = [v4 objectForKeyedSubscript:v9];
        unsigned __int8 v11 = [(SKGJobContext *)self feedback];
        objc_msgSend(v11, "logArchivedQueryItemCount:bundleIdentifier:", (int)objc_msgSend(v10, "intValue"), v9);
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (void)logQueryItemsProcessed:(id)a3
{
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        id v10 = [v4 objectForKeyedSubscript:v9];
        unsigned __int8 v11 = [(SKGJobContext *)self feedback];
        objc_msgSend(v11, "logExtractedQueryItemCount:bundleIdentifier:", (int)objc_msgSend(v10, "intValue"), v9);
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (void)logJournalItemsProcessed:(id)a3
{
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        id v10 = [v4 objectForKeyedSubscript:v9];
        unsigned __int8 v11 = [(SKGJobContext *)self feedback];
        objc_msgSend(v11, "logExtractedJournalItemCount:bundleIdentifier:", (int)objc_msgSend(v10, "intValue"), v9);
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (void)logArchiveItemsProcessed:(id)a3
{
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        id v10 = [v4 objectForKeyedSubscript:v9];
        unsigned __int8 v11 = [(SKGJobContext *)self feedback];
        objc_msgSend(v11, "logExtractedArchiveItemCount:bundleIdentifier:", (int)objc_msgSend(v10, "intValue"), v9);
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (void)logArchiveWithName:(id)a3 protectionClass:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SKGJobContext *)self feedback];
  [v8 logArchiveWithIdentifier:v7 protectionClass:v6];
}

- (void)logProcessedArchiveWithName:(id)a3 protectionClass:(id)a4
{
  id v5 = a3;
  id v6 = [(SKGJobContext *)self feedback];
  [v6 logProcessedArchiveWithName:v5];
}

- (void)logProcessedJournalWithName:(id)a3 protectionClass:(id)a4
{
  id v5 = a3;
  id v6 = [(SKGJobContext *)self feedback];
  [v6 logProcessedJournalWithName:v5];
}

- (int64_t)getGenCompleteDayString:(id)a3 forBundle:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SKGJobContext *)self feedback];
  id v9 = [v8 getGenCompleteDayString:v7 forBundle:v6];

  return (int64_t)v9;
}

- (void)setGenCompleteDayString:(id)a3 forBundle:(id)a4 day:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(SKGJobContext *)self feedback];
  [v10 setGenCompleteDayString:v9 forBundle:v8 day:a5];
}

- (NSDate)embeddingGenStartTime
{
  id v2 = [(SKGJobContext *)self feedback];
  unsigned int v3 = [v2 embeddingGenStartTime];

  return (NSDate *)v3;
}

- (NSDate)suggestedEventsGenStartTime
{
  id v2 = [(SKGJobContext *)self feedback];
  unsigned int v3 = [v2 suggestedEventsGenStartTime];

  return (NSDate *)v3;
}

- (NSDate)documentUnderstandingGenStartTime
{
  id v2 = [(SKGJobContext *)self feedback];
  unsigned int v3 = [v2 documentUnderstandingGenStartTime];

  return (NSDate *)v3;
}

- (int64_t)upgradePathIsOldThresInWeeks
{
  return self->_upgradePathIsOldThresInWeeks;
}

- (BOOL)upgradePathCleanupAll
{
  return self->_upgradePathCleanupAll;
}

- (BOOL)isCJK
{
  return self->_isCJK;
}

- (NSString)currentMessage
{
  return self->_currentMessage;
}

- (NSString)taskName
{
  return self->_taskName;
}

- (void)setTaskName:(id)a3
{
}

@end