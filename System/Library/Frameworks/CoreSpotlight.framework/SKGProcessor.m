@interface SKGProcessor
+ (BOOL)docContentExceedsMaxAllowedSize:(id)a3;
+ (BOOL)docIsTrashOrJunkMail:(id)a3;
+ (BOOL)recordHasHTMLContent:(id)a3;
+ (BOOL)recordHasTextContent:(id)a3;
+ (id)copyMailboxesFromRecord:(id)a3;
+ (id)embeddingVersionDataWithVersion:(id)a3;
+ (id)normalizeForEmbeddingGeneration:(id)a3 bundleID:(id)a4;
+ (id)sharedProcessor;
+ (unint64_t)getHTMLContentByteSizeForRecord:(id)a3;
+ (unint64_t)getTextContentByteSizeForRecord:(id)a3;
+ (unint64_t)textContentLengthForRecord:(id)a3;
- (BOOL)addEmbeddingsToProcessedItem:(id)a3 primaryTextInputs:(id)a4 secondaryTextInputs:(id)a5 firstChunkLength:(unint64_t)a6 workCost:(int64_t *)a7 cancelBlock:(id)a8;
- (BOOL)canGenerateEmbeddingsForFPRecord:(id)a3 bundleID:(id)a4;
- (BOOL)canGenerateEmbeddingsForMailRecord:(id)a3 bundleID:(id)a4;
- (BOOL)canProcessEvent;
- (BOOL)canProcessEventForRecord:(id)a3;
- (BOOL)docUnderstandingRecordNeedsProcessing:(id)a3 bundleID:(id)a4 isUpdate:(BOOL)a5 hasTextContent:(BOOL)a6 shouldClear:(BOOL *)a7 shouldMarkComplete:(BOOL *)a8;
- (BOOL)embeddingRecordNeedsProcessing:(id)a3 bundleID:(id)a4 isUpdate:(BOOL)a5 hasTextContent:(BOOL)a6 shouldClear:(BOOL *)a7 shouldMarkComplete:(BOOL *)a8;
- (BOOL)enumerateProcessedItemsFromRecord:(id)a3 referenceIdentifier:(id)a4 bundleIdentifier:(id)a5 protectionClass:(id)a6 processorFlags:(unint64_t)a7 processedItemBlock:(id)a8 cancelBlock:(id)a9;
- (BOOL)enumerateProcessedItemsFromRecord:(id)a3 referenceIdentifier:(id)a4 bundleIdentifier:(id)a5 protectionClass:(id)a6 processorFlags:(unint64_t)a7 workCost:(int64_t *)a8 fetchCachedLanguageBlock:(id)a9 cacheLanguageBlock:(id)a10 processedItemBlock:(id)a11 cancelBlock:(id)a12;
- (BOOL)extractContentFromRecord:(id)a3 bundleID:(id)a4 content:(id *)a5 maxChunkCountPtr:(unint64_t *)a6 textLength:(unint64_t *)a7;
- (BOOL)extractContentFromRecordForCalendar:(id)a3 bundleID:(id)a4 content:(id *)a5 maxChunkCountPtr:(unint64_t *)a6 textLength:(unint64_t *)a7;
- (BOOL)extractContentFromRecordForEvents:(id)a3 bundleID:(id)a4 content:(id *)a5 maxChunkCountPtr:(unint64_t *)a6 textLength:(unint64_t *)a7;
- (BOOL)extractContentFromRecordForMail:(id)a3 bundleID:(id)a4 content:(id *)a5 maxChunkCountPtr:(unint64_t *)a6 textLength:(unint64_t *)a7;
- (BOOL)extractContentFromRecordForMessages:(id)a3 bundleID:(id)a4 content:(id *)a5 maxChunkCountPtr:(unint64_t *)a6 textLength:(unint64_t *)a7;
- (BOOL)extractContentFromRecordForReminders:(id)a3 bundleID:(id)a4 content:(id *)a5 maxChunkCountPtr:(unint64_t *)a6 textLength:(unint64_t *)a7;
- (BOOL)extractContentFromRecordForSafari:(id)a3 bundleID:(id)a4 content:(id *)a5 maxChunkCountPtr:(unint64_t *)a6 textLength:(unint64_t *)a7;
- (BOOL)extractContentFromRecordForWallet:(id)a3 bundleID:(id)a4 content:(id *)a5 maxChunkCountPtr:(unint64_t *)a6 textLength:(unint64_t *)a7;
- (BOOL)forceEntityExtraction;
- (BOOL)generateCalendarEventTypesForProcessedItem:(id)a3;
- (BOOL)generateEmbeddingsForRecord:(id)a3 processedItem:(id)a4 isPriority:(BOOL)a5 cancelBlock:(id)a6;
- (BOOL)generateEmbeddingsForRecord:(id)a3 processedItem:(id)a4 isPriority:(BOOL)a5 workCost:(int64_t *)a6 cancelBlock:(id)a7;
- (BOOL)generateKeyphrasesForRecord:(id)a3 processedItem:(id)a4 fetchCachedLanguageBlock:(id)a5 cacheLanguageBlock:(id)a6 cancelBlock:(id)a7;
- (BOOL)generateLanguageForRecord:(id)a3 processedItem:(id)a4 fetchCachedLanguageBlock:(id)a5 cacheLanguageBlock:(id)a6 cancelBlock:(id)a7;
- (BOOL)generateMegadomePeopleUsingBlock:(id)a3 cancelBlock:(id)a4;
- (BOOL)generatePeopleForRecord:(id)a3 processedItem:(id)a4 processedItemBlock:(id)a5 cancelBlock:(id)a6;
- (BOOL)isStringOnlyNumbersOrPunctuationSpaces:(id)a3;
- (BOOL)itemForRecordHasTextContent:(id)a3;
- (BOOL)keyphraseRecordNeedsProcessing:(id)a3 bundleID:(id)a4 isUpdate:(BOOL)a5 hasTextContent:(BOOL)a6 shouldClear:(BOOL *)a7 shouldMarkComplete:(BOOL *)a8;
- (BOOL)loadEmbedder;
- (BOOL)loadKeyphraser;
- (BOOL)loadLanguageIdentifier;
- (BOOL)loadPeopleExtractor;
- (BOOL)needsDocumentUnderstandingForRecord:(id)a3 bundleID:(id)a4;
- (BOOL)needsEmbeddingsForRecord:(id)a3 bundleID:(id)a4;
- (BOOL)needsKeyphrasesForRecord:(id)a3 bundleID:(id)a4;
- (BOOL)needsPeopleForRecord:(id)a3;
- (BOOL)needsPriorityForRecord:(id)a3 bundleID:(id)a4;
- (BOOL)needsSuggestedEventsForRecord:(id)a3 bundleID:(id)a4;
- (BOOL)recordContainsValue:(id)a3 key:(id)a4;
- (BOOL)recordForItemHasTextContent:(id)a3;
- (BOOL)recordForItemWillHaveTextContent:(id)a3;
- (BOOL)recordIsCurrent:(id)a3 toCalendarUnit:(unint64_t)a4 maxOffset:(unint64_t)a5 checkFuture:(BOOL)a6 dateKeys:(id)a7;
- (BOOL)recordIsRecent:(id)a3 toCalendarUnit:(unint64_t)a4 maxOffset:(unint64_t)a5 dateKeys:(id)a6;
- (BOOL)recordIsValid:(id)a3;
- (BOOL)recordMatchesContentURLOnDisk:(id)a3 contentURL:(id)a4;
- (BOOL)shouldGenerateDocumentUnderstandingForRecord:(id)a3 bundleID:(id)a4;
- (BOOL)shouldGenerateEmbeddingsForRecord:(id)a3 bundleID:(id)a4;
- (BOOL)shouldGenerateKeyphrasesForRecord:(id)a3 bundleID:(id)a4;
- (BOOL)shouldGeneratePeopleForRecord:(id)a3;
- (BOOL)shouldGenerateSuggestedEventsForRecord:(id)a3 bundleID:(id)a4;
- (BOOL)updateChunks:(id)a3 firstChunkLength:(unint64_t *)a4 fromString:(id)a5 overlapSize:(unint64_t)a6 maxChunks:(unint64_t)a7 cancelBlock:(id)a8;
- (BOOL)updateSKGProcessorAttributes:(id)a3 record:(id)a4 bundleID:(id)a5 protectionClass:(id)a6 isUpdate:(BOOL)a7 processorFlags:(unint64_t)a8;
- (BOOL)updateSKGProcessorDocUnderstandingAttributes:(id)a3 record:(id)a4 bundleID:(id)a5 protectionClass:(id)a6 recordHasText:(BOOL)a7 itemHasText:(BOOL)a8 isUpdate:(BOOL)a9;
- (BOOL)updateSKGProcessorKeyphrasesAttributes:(id)a3 record:(id)a4 bundleID:(id)a5 protectionClass:(id)a6 recordHasText:(BOOL)a7 itemHasText:(BOOL)a8 isUpdate:(BOOL)a9;
- (BOOL)updateSKGReindexerAttributes:(id)a3 record:(id)a4 bundleID:(id)a5 processorFlags:(unint64_t)a6;
- (BOOL)updateSKGReindexerDocUnderstandingAttributes:(id)a3 record:(id)a4 bundleID:(id)a5 itemHasText:(BOOL)a6;
- (BOOL)updateSKGReindexerKeyphrasesAttributes:(id)a3 record:(id)a4 bundleID:(id)a5 itemHasText:(BOOL)a6;
- (NSArray)loadedLocales;
- (SKGProcessor)initWithOptions:(id)a3;
- (id)accountOwnerFromRecord:(id)a3;
- (id)authorFromMessageRecord:(id)a3;
- (id)authorsFromPhoneRecord:(id)a3;
- (id)availableLanguages;
- (id)contactFromRecord:(id)a3;
- (id)copyBundleIdentifierFromRecord:(id)a3;
- (id)copyContentTypeFromRecord:(id)a3;
- (id)copyContentURLFromRecord:(id)a3;
- (id)copyDateStringFromRecordWithFormat:(id)a3 key:(id)a4 formatString:(id)a5;
- (id)copyDescriptionContentFromRecord:(id)a3;
- (id)copyDocumentTypesFromRecord:(id)a3;
- (id)copyDocumentUnderstandingVersionFromRecord:(id)a3;
- (id)copyDomainIdentifierFromRecord:(id)a3;
- (id)copyEmbeddingModelVersionFromRecord:(id)a3;
- (id)copyEmbeddingVersionFromRecord:(id)a3;
- (id)copyExtraDataFromWalletRecord:(id)a3;
- (id)copyFilePathFromRecord:(id)a3;
- (id)copyFileProviderIDFromRecord:(id)a3;
- (id)copyKeyphraseVersionFromRecord:(id)a3;
- (id)copyLanguageFromRecord:(id)a3;
- (id)copyNumberValueFromRecord:(id)a3 key:(id)a4;
- (id)copyPeopleVersionFromRecord:(id)a3;
- (id)copyPersonaFromRecord:(id)a3;
- (id)copyProtectionClassFromRecord:(id)a3;
- (id)copyReferenceIdentifierFromRecord:(id)a3;
- (id)copySnippetFromRecord:(id)a3;
- (id)copyStringArrayFromRecordAndConcatnate:(id)a3 key:(id)a4;
- (id)copyStringValueFromRecord:(id)a3 key:(id)a4;
- (id)copySuggestedEventsVersionFromRecord:(id)a3;
- (id)copyTextContentFromRecord:(id)a3;
- (id)copyTitleFromRecord:(id)a3;
- (id)createdScoreFromRecord:(id)a3;
- (id)dateFromRecord:(id)a3 key:(id)a4;
- (id)itemFromRecord:(id)a3 referenceIdentifier:(id)a4 bundleIdentifier:(id)a5 protectionClass:(id)a6;
- (id)lastEditorFromRecord:(id)a3;
- (id)ownerFromRecord:(id)a3;
- (id)peopleForAttributeKey:(id)a3 fromRecord:(id)a4;
- (id)peopleForSharedAttributeKey:(id)a3 fromRecord:(id)a4;
- (id)peopleFromNotesRecord:(id)a3;
- (id)peopleFromPhotoRecord:(id)a3;
- (id)personWithName:(id)a3 alternateName:(id)a4 contactIdentifier:(id)a5 personIdentifier:(id)a6 emails:(id)a7 phones:(id)a8 addresses:(id)a9;
- (id)queue;
- (id)recipientsFromPhoneRecord:(id)a3;
- (id)referenceDateForRecord:(id)a3;
- (id)scoreFromDate:(id)a3;
- (id)viewedScoreFromRecord:(id)a3;
- (void)clearDocUnderstandingAttributes:(id)a3;
- (void)clearKeyphrasesAttributes:(id)a3;
- (void)completeDocUnderstandingAttributes:(id)a3;
- (void)completeKeyphrasesAttributes:(id)a3;
- (void)setForceEntityExtraction:(BOOL)a3;
- (void)setQueue:(id)a3;
@end

@implementation SKGProcessor

- (BOOL)recordForItemHasTextContent:(id)a3
{
  id v4 = a3;
  if ([(SKGProcessor *)self recordContainsValue:v4 key:@"kMDItemTextContent"]) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = [(SKGProcessor *)self recordContainsValue:v4 key:@"_kMDItemSnippet"];
  }

  return v5;
}

- (BOOL)recordForItemWillHaveTextContent:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(SKGProcessor *)self recordContainsValue:v4 key:@"kMDItemTextContent"];
  id v6 = [(SKGProcessor *)self copyFileProviderIDFromRecord:v4];
  v7 = v6;
  if ((v5 & 1) == 0 && v6)
  {
    id v8 = [(SKGProcessor *)self copyNumberValueFromRecord:v4 key:@"_kMDItemRequiresImport"];
    id v9 = [(SKGProcessor *)self copyContentTypeFromRecord:v4];
    v10 = v9;
    unsigned __int8 v5 = 0;
    if (v8 && v9)
    {
      if ([v8 BOOLValue]
        && ([v10 isEqualToString:@"public.folder"] & 1) == 0)
      {
        unsigned __int8 v5 = [v8 BOOLValue];
      }
      else
      {
        unsigned __int8 v5 = 0;
      }
    }
  }
  return v5;
}

- (BOOL)itemForRecordHasTextContent:(id)a3
{
  id v3 = [(SKGProcessor *)self copyNumberValueFromRecord:a3 key:@"_kMDItemTextContentIndexExists"];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)updateSKGProcessorAttributes:(id)a3 record:(id)a4 bundleID:(id)a5 protectionClass:(id)a6 isUpdate:(BOOL)a7 processorFlags:(unint64_t)a8
{
  char v8 = a8;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  if (![v15 count]) {
    goto LABEL_7;
  }
  v18 = +[SKGProcessor sharedProcessor];
  unsigned int v19 = [v18 recordIsValid:v15];

  if (!v19) {
    goto LABEL_7;
  }
  v20 = [v15 objectForKeyedSubscript:@"_kMDItemEmbeddingsSN"];
  if (v20
    || ([v15 objectForKeyedSubscript:@"_kMDItemKeyphrasesSN"],
        (v20 = objc_claimAutoreleasedReturnValue()) != 0)
    || ([v15 objectForKeyedSubscript:@"_kMDItemSuggestedEventsSN"],
        (v20 = objc_claimAutoreleasedReturnValue()) != 0))
  {

LABEL_7:
    LOBYTE(v21) = 0;
    goto LABEL_8;
  }
  v23 = [v15 objectForKeyedSubscript:@"_kMDItemDocumentUnderstandingSN"];

  if (v23) {
    goto LABEL_7;
  }
  if ([(SKGProcessor *)self recordForItemHasTextContent:v15]
    || [(SKGProcessor *)self recordForItemWillHaveTextContent:v15])
  {
    uint64_t v24 = 1;
    BOOL v25 = 1;
  }
  else
  {
    BOOL v25 = [(SKGProcessor *)self itemForRecordHasTextContent:v15];
    uint64_t v24 = 0;
  }
  if ((v8 & 4) != 0)
  {
    LOBYTE(v26) = a7;
    unsigned int v21 = [(SKGProcessor *)self updateSKGProcessorKeyphrasesAttributes:v14 record:v15 bundleID:v16 protectionClass:v17 recordHasText:v24 itemHasText:v25 isUpdate:v26];
  }
  else
  {
    unsigned int v21 = 0;
  }
  if ((v8 & 0x20) != 0)
  {
    LOBYTE(v26) = a7;
    v21 |= [(SKGProcessor *)self updateSKGProcessorDocUnderstandingAttributes:v14 record:v15 bundleID:v16 protectionClass:v17 recordHasText:v24 itemHasText:v25 isUpdate:v26];
  }
LABEL_8:

  return v21;
}

- (BOOL)updateSKGReindexerAttributes:(id)a3 record:(id)a4 bundleID:(id)a5 processorFlags:(unint64_t)a6
{
  char v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v11 count]
    && (+[SKGProcessor sharedProcessor],
        v13 = objc_claimAutoreleasedReturnValue(),
        unsigned int v14 = [v13 recordIsValid:v11],
        v13,
        v14))
  {
    BOOL v15 = [(SKGProcessor *)self itemForRecordHasTextContent:v11];
    if ((v6 & 4) != 0)
    {
      unsigned int v16 = [(SKGProcessor *)self updateSKGReindexerKeyphrasesAttributes:v10 record:v11 bundleID:v12 itemHasText:v15];
      if ((v6 & 0x20) != 0) {
LABEL_9:
      }
        v16 |= [(SKGProcessor *)self updateSKGReindexerDocUnderstandingAttributes:v10 record:v11 bundleID:v12 itemHasText:v15];
    }
    else
    {
      unsigned int v16 = 0;
      if ((v6 & 0x20) != 0) {
        goto LABEL_9;
      }
    }
  }
  else
  {
    LOBYTE(v16) = 0;
  }

  return v16;
}

- (BOOL)needsPriorityForRecord:(id)a3 bundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = v7;
  if (v7) {
    id v9 = v7;
  }
  else {
    id v9 = [(SKGProcessor *)self copyBundleIdentifierFromRecord:v6];
  }
  id v10 = v9;
  if (sub_10004A954(v9)) {
    id v11 = &off_1000E6F90;
  }
  else {
    id v11 = &off_1000E6FA8;
  }
  unsigned __int8 v12 = [(SKGProcessor *)self recordIsCurrent:v6 toCalendarUnit:16 maxOffset:3 checkFuture:0 dateKeys:v11];
  char v13 = v12 | [(SKGProcessor *)self recordIsCurrent:v6 toCalendarUnit:8 maxOffset:3 checkFuture:1 dateKeys:&off_1000E6FC0];

  return v13;
}

- (BOOL)loadEmbedder
{
  os_unfair_lock_lock(&stru_1000F882C);
  unsigned __int8 v3 = atomic_load(byte_1000F8828);
  if (v3)
  {
    unsigned __int8 v4 = 0;
  }
  else
  {
    unsigned __int8 v4 = dispatch_group_create();
    dispatch_group_enter(v4);
  }
  unsigned __int8 v5 = +[SPEmbeddingModel sharedInstance];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100022120;
  v15[3] = &unk_1000D97D8;
  id v6 = v4;
  unsigned int v16 = v6;
  [v5 preheatWithCompletionHandler:v15];

  id v7 = +[SKGProcessorContext sharedContext];
  unsigned int v8 = [v7 enableCalendarEventClassification];

  if (v8) {
    id v9 = +[CalendarEventClassificationModelManager sharedInstance];
  }
  if (v6)
  {
    dispatch_time_t v10 = dispatch_time(0, 5000000000);
    if (dispatch_group_wait(v6, v10))
    {
      id v11 = sub_1000507C8();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_10009FFD4(v11);
      }
    }
  }

  unsigned __int8 v12 = atomic_load(byte_1000F8828);
  BOOL v13 = v12 & 1;
  os_unfair_lock_unlock(&stru_1000F882C);
  return v13;
}

- (BOOL)updateChunks:(id)a3 firstChunkLength:(unint64_t *)a4 fromString:(id)a5 overlapSize:(unint64_t)a6 maxChunks:(unint64_t)a7 cancelBlock:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  unsigned int v16 = (uint64_t (**)(id, const __CFString *))a8;
  if (a7 && [v15 length])
  {
    id v17 = [(SKGProcessor *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100022304;
    block[3] = &unk_1000D9B10;
    id v21 = v15;
    id v22 = v14;
    unint64_t v23 = a7;
    unint64_t v24 = a6;
    BOOL v25 = a4;
    dispatch_sync(v17, block);

    if (v16) {
      int v18 = v16[2](v16, @"chunking") ^ 1;
    }
    else {
      LOBYTE(v18) = 1;
    }
  }
  else
  {
    LOBYTE(v18) = 1;
  }

  return v18;
}

- (BOOL)addEmbeddingsToProcessedItem:(id)a3 primaryTextInputs:(id)a4 secondaryTextInputs:(id)a5 firstChunkLength:(unint64_t)a6 workCost:(int64_t *)a7 cancelBlock:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = (unsigned int (**)(id, const __CFString *))a8;
  int v18 = +[SPEmbeddingModel sharedInstance];
  unsigned int v19 = [v14 bundleIdentifier];
  id v82 = 0;
  v72 = v18;
  v20 = [v18 generateEmbeddingForTextInputs:v15 extendedContextLength:1 bundleID:v19 queryID:0x7FFFFFFFFFFFFFFFLL timeout:5000 workCost:a7 error:&v82];
  id v69 = v82;

  if (v17 && v17[2](v17, @"chunking"))
  {
    id v21 = +[SKGActivityJournal sharedJournal];
    id v22 = [v14 bundleIdentifier];
    unint64_t v23 = [v14 referenceIdentifier];
    [v21 addVerboseEventForItem:206 bundleID:v22 identifier:v23];

    BOOL v24 = 0;
    BOOL v25 = v69;
LABEL_45:

    v63 = context;
LABEL_49:
    goto LABEL_50;
  }
  v65 = self;
  id v67 = v16;
  id v68 = v15;
  if ([v20 count])
  {
    unint64_t v66 = a6;
    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    id v26 = v20;
    id v27 = [v26 countByEnumeratingWithState:&v78 objects:v84 count:16];
    if (v27)
    {
      id v28 = v27;
      uint64_t v29 = *(void *)v79;
      do
      {
        for (i = 0; i != v28; i = (char *)i + 1)
        {
          if (*(void *)v79 != v29) {
            objc_enumerationMutation(v26);
          }
          v31 = *(void **)(*((void *)&v78 + 1) + 8 * i);
          v32 = [v31 embeddingData];
          [v14 addPrimaryEmbedding:v32];

          objc_msgSend(v14, "setEmbeddingSize:", objc_msgSend(v31, "elementCount"));
          objc_msgSend(v14, "setEmbeddingFormat:", objc_msgSend(v31, "elementType"));
          objc_msgSend(v14, "setEmbeddingVersion:", objc_msgSend(v31, "version"));
        }
        id v28 = [v26 countByEnumeratingWithState:&v78 objects:v84 count:16];
      }
      while (v28);
    }

    v33 = +[SKGActivityJournal sharedJournal];
    v34 = [v14 bundleIdentifier];
    v35 = [v14 referenceIdentifier];
    [v33 addEventForItem:6 bundleID:v34 identifier:v35];

    v36 = sub_1000507C8();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
      sub_1000A0240();
    }

    [v14 setChunkLength:v66];
    id v16 = v67;
    id v15 = v68;
  }
  else
  {
    id v54 = [v15 count];
    v55 = +[SKGActivityJournal sharedJournal];
    v56 = [v14 bundleIdentifier];
    v57 = [v14 referenceIdentifier];
    if (v54)
    {
      [v55 addEventForItem:7 bundleID:v56 identifier:v57];

      BOOL v25 = v69;
      if (v69)
      {
        v58 = sub_1000507C8();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
          sub_1000A01B4();
        }

        BOOL v24 = 1;
        [v14 setErrorProcessingEmbeddings:1];
      }
      else
      {
        BOOL v24 = 1;
      }
      goto LABEL_45;
    }
    [v55 addEventForItem:8 bundleID:v56 identifier:v57];
  }
  v38 = [v14 bundleIdentifier];
  id v77 = 0;
  v39 = [v72 generateEmbeddingForTextInputs:v16 extendedContextLength:1 bundleID:v38 queryID:0x7FFFFFFFFFFFFFFFLL timeout:5000 workCost:a7 error:&v77];
  id v40 = v77;

  if (v17 && (((uint64_t (*)(id, const __CFString *))v17[2])(v17, @"chunking") & 1) != 0)
  {
    BOOL v24 = 0;
LABEL_48:

    v63 = v37;
    goto LABEL_49;
  }
  contexta = v37;
  if ([v39 count])
  {
    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    id v41 = v39;
    id v42 = [v41 countByEnumeratingWithState:&v73 objects:v83 count:16];
    if (v42)
    {
      id v43 = v42;
      uint64_t v44 = *(void *)v74;
      do
      {
        for (j = 0; j != v43; j = (char *)j + 1)
        {
          if (*(void *)v74 != v44) {
            objc_enumerationMutation(v41);
          }
          v46 = *(void **)(*((void *)&v73 + 1) + 8 * (void)j);
          v47 = [v46 embeddingData];
          [v14 addSecondaryEmbedding:v47];

          objc_msgSend(v14, "setEmbeddingSize:", objc_msgSend(v46, "elementCount"));
          objc_msgSend(v14, "setEmbeddingFormat:", objc_msgSend(v46, "elementType"));
          objc_msgSend(v14, "setEmbeddingVersion:", objc_msgSend(v46, "version"));
        }
        id v43 = [v41 countByEnumeratingWithState:&v73 objects:v83 count:16];
      }
      while (v43);
    }

    v48 = +[SKGActivityJournal sharedJournal];
    v49 = [v14 bundleIdentifier];
    v50 = [v14 referenceIdentifier];
    [v48 addEventForItem:9 bundleID:v49 identifier:v50];

    v51 = sub_1000507C8();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG)) {
      sub_1000A011C();
    }
    id v16 = v67;
    id v15 = v68;
  }
  else
  {
    id v59 = [v16 count];
    v51 = +[SKGActivityJournal sharedJournal];
    v60 = [v14 bundleIdentifier];
    v61 = [v14 referenceIdentifier];
    if (v59)
    {
      [v51 addEventForItem:10 bundleID:v60 identifier:v61];

      if (v40)
      {
        v62 = sub_1000507C8();
        v37 = contexta;
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
          sub_1000A0090();
        }

        BOOL v24 = 1;
        [v14 setErrorProcessingEmbeddings:1];
      }
      else
      {
        BOOL v24 = 1;
        v37 = contexta;
      }
      goto LABEL_48;
    }
    [v51 addEventForItem:11 bundleID:v60 identifier:v61];
  }
  BOOL v24 = 1;
  [v14 setDidProcessEmbeddings:1];
  v52 = +[SKGProcessorContext sharedContext];
  unsigned int v53 = [v52 enableCalendarEventClassification];

  if (v53 && [v14 isCalendar] && objc_msgSend(v14, "didProcessEmbeddings")) {
    objc_msgSend(v14, "setDidProcessCalendarEvents:", -[SKGProcessor generateCalendarEventTypesForProcessedItem:](v65, "generateCalendarEventTypesForProcessedItem:", v14));
  }
LABEL_50:

  return v24;
}

- (BOOL)generateCalendarEventTypesForProcessedItem:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = +[CalendarEventClassificationModelManager sharedInstance];
  unsigned __int8 v5 = [v3 referenceIdentifier];
  id v6 = [v3 embedding];
  id v7 = [v4 predictForReferenceItemId:v5 withEmbedding:v6];

  id v8 = [v7 count];
  if (v8) {
    [v3 addDetectedCalendarEventTypes:v7];
  }

  return v8 != 0;
}

- (BOOL)generateEmbeddingsForRecord:(id)a3 processedItem:(id)a4 isPriority:(BOOL)a5 cancelBlock:(id)a6
{
  return [(SKGProcessor *)self generateEmbeddingsForRecord:a3 processedItem:a4 isPriority:a5 workCost:0 cancelBlock:a6];
}

- (BOOL)generateEmbeddingsForRecord:(id)a3 processedItem:(id)a4 isPriority:(BOOL)a5 workCost:(int64_t *)a6 cancelBlock:(id)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x3032000000;
  v58 = sub_100012624;
  id v59 = sub_100012530;
  id v60 = 0;
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x2020000000;
  uint64_t v54 = 0;
  id v49 = 0;
  uint64_t v50 = 2;
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x3032000000;
  v47 = sub_100012624;
  v48 = sub_100012530;
  id v16 = [v13 bundleIdentifier];
  id v17 = (id *)(v45 + 5);
  id obj = (id)v45[5];
  unsigned int v18 = [(SKGProcessor *)self extractContentFromRecord:v12 bundleID:v16 content:&obj maxChunkCountPtr:&v50 textLength:0];
  objc_storeStrong(v17, obj);

  if (v18)
  {
    unsigned int v19 = +[SKGEventsProfiler sharedInstance];
    if (v9) {
      uint64_t v20 = 2;
    }
    else {
      uint64_t v20 = 1;
    }
    v32 = _NSConcreteStackBlock;
    uint64_t v33 = 3221225472;
    v34 = sub_10002322C;
    v35 = &unk_1000D9B38;
    v39 = &v44;
    id v21 = v13;
    id v36 = v21;
    v37 = self;
    id v40 = &v55;
    id v41 = &v51;
    uint64_t v42 = v50;
    id v38 = v14;
    unsigned __int8 v22 = [v19 profileCodeWithType:@"GenerateEmbeddings-Chunking" kind:v20 block:&v32];

    if (v22)
    {

      int v23 = 1;
    }
    else
    {
      id v27 = +[SKGActivityJournal sharedJournal];
      id v28 = [v21 bundleIdentifier];
      uint64_t v29 = [v21 referenceIdentifier];
      [v27 addVerboseEventForItem:205 bundleID:v28 identifier:v29];

      int v23 = 0;
    }
    BOOL v24 = v36;
  }
  else
  {
    BOOL v24 = +[SKGActivityJournal sharedJournal];
    BOOL v25 = [v13 bundleIdentifier];
    id v26 = [v13 referenceIdentifier];
    [v24 addVerboseEventForItem:204 bundleID:v25 identifier:v26];

    int v23 = 1;
  }

  _Block_object_dispose(&v44, 8);
  if (v23) {
    BOOL v30 = [(SKGProcessor *)self addEmbeddingsToProcessedItem:v13 primaryTextInputs:v56[5] secondaryTextInputs:0 firstChunkLength:v52[3] workCost:a6 cancelBlock:v14];
  }
  else {
    BOOL v30 = 0;
  }
  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v55, 8);

  return v30;
}

- (BOOL)loadLanguageIdentifier
{
  +[SKGLanguageIdentifier sharedIdentifier];
  return 1;
}

- (BOOL)generateLanguageForRecord:(id)a3 processedItem:(id)a4 fetchCachedLanguageBlock:(id)a5 cacheLanguageBlock:(id)a6 cancelBlock:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = (void (**)(void))a5;
  id v15 = (void (**)(id, id))a6;
  id v16 = a7;
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x2020000000;
  char v49 = 1;
  unsigned int v18 = [v13 textContentLanguage];
  if ([v18 length])
  {
    id v19 = [v13 textContentSize];

    if (v19)
    {
      LOBYTE(self) = *((unsigned char *)v47 + 24) != 0;
      int v20 = 1;
      goto LABEL_23;
    }
  }
  else
  {
  }
  id Copy = [(SKGProcessor *)self copyStringValueFromRecord:v12 key:@"kMDItemTextContentLanguage"];
  unsigned __int8 v22 = [(SKGProcessor *)self copyTextContentFromRecord:v12];
  if (!v22)
  {
    unsigned __int8 v22 = [(SKGProcessor *)self copySnippetFromRecord:v12];
    if (!v22)
    {
      LOBYTE(self) = *((unsigned char *)v47 + 24) != 0;
      goto LABEL_21;
    }
  }
  if (v14 && !Copy)
  {
    v14[2](v14);
    id Copy = (id)objc_claimAutoreleasedReturnValue();
  }
  if (Copy) {
    goto LABEL_11;
  }
  unsigned int v23 = [(SKGProcessor *)self loadLanguageIdentifier];
  *((unsigned char *)v47 + 24) = v23;
  if (!v23)
  {
    LOBYTE(self) = 0;
    id Copy = 0;
LABEL_21:
    int v20 = 1;
    goto LABEL_22;
  }
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_1000238FC;
  v43[3] = &unk_1000D9B60;
  v45 = &v46;
  id v38 = (uint64_t (**)(void))v16;
  uint64_t v44 = v38;
  v39 = objc_retainBlock(v43);
  BOOL v24 = +[SKGSystemListener sharedProcessorListener];
  unsigned int v25 = [v24 enableV2LanguageID];

  if (v25)
  {
    self = +[SKGLanguageIdentifier sharedIdentifier];
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_100023970;
    v40[3] = &unk_1000D9BB0;
    uint64_t v42 = &v46;
    id v26 = v38;
    id v41 = v26;
    id Copy = [(SKGProcessor *)self languageFromString:v22 normalizedChunkBlock:v40];

    if (v26)
    {
      char v27 = ((uint64_t (*)(uint64_t (**)(void), const __CFString *))v26[2])(v26, @"processTextContentFromRecord:cancel") ^ 1;
      id v28 = v47;
    }
    else
    {
      id v28 = v47;
      char v27 = *((unsigned char *)v47 + 24) != 0;
    }
    *((unsigned char *)v28 + 24) = v27;

    goto LABEL_46;
  }
  self = +[SKGSystemListener sharedProcessorListener];
  unsigned int v30 = [(SKGProcessor *)self currentLocaleIsCJK];

  if (v30)
  {
    if ((unint64_t)[(__CFString *)v22 length] <= 5)
    {
LABEL_28:

      int v20 = 0;
      id Copy = 0;
      goto LABEL_22;
    }
  }
  else if ((unint64_t)[(__CFString *)v22 length] < 0x10)
  {
    goto LABEL_28;
  }
  v31 = v39;
  CFIndex Length = CFStringGetLength(v22);
  LOBYTE(self) = Length;
  if (Length)
  {
    CFStringRef LanguageGuessUsingMontrealInString = (const __CFString *)SILanguageModelGetLanguageGuessUsingMontrealInString();
    if (!v31 || !v31[2](v31))
    {
      if (LanguageGuessUsingMontrealInString)
      {
        id Copy = (id)CFStringCreateCopy(kCFAllocatorDefault, LanguageGuessUsingMontrealInString);
        goto LABEL_41;
      }
      self = (SKGProcessor *)NLStringTokenizerCopyBestStringLanguage();
      if (self)
      {
        id Copy = (id)CFStringCreateCopy(kCFAllocatorDefault, (CFStringRef)self);
        CFRelease(self);
        goto LABEL_41;
      }
    }
    id Copy = 0;
LABEL_41:
    goto LABEL_42;
  }
  id Copy = 0;
LABEL_42:

  if (v38)
  {
    char v34 = v38[2]() ^ 1;
    v35 = v47;
  }
  else
  {
    v35 = v47;
    char v34 = *((unsigned char *)v47 + 24) != 0;
  }
  *((unsigned char *)v35 + 24) = v34;
LABEL_46:

  if (Copy)
  {
LABEL_11:
    if (*((unsigned char *)v47 + 24))
    {
      [v13 setTextContent:v22];
      [v13 setLanguage:Copy];
      if (v15) {
        v15[2](v15, Copy);
      }
    }
  }
  int v20 = 0;
LABEL_22:

LABEL_23:
  if (!v20) {
    LOBYTE(self) = *((unsigned char *)v47 + 24) != 0;
  }
  _Block_object_dispose(&v46, 8);

  return self & 1;
}

- (void)clearDocUnderstandingAttributes:(id)a3
{
  id v3 = a3;
  [v3 setObject:kCFNull forKey:@"_kMDItemNeedsDocumentUnderstanding"];
  [v3 setObject:kCFNull forKey:@"kMDItemDocumentUnderstandingVersion"];
}

- (void)completeDocUnderstandingAttributes:(id)a3
{
  id v3 = a3;
  id v5 = +[SKGProcessorContext sharedContext];
  unsigned __int8 v4 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v5 documentUnderstandingVersion]);
  [v3 setObject:v4 forKey:@"kMDItemDocumentUnderstandingVersion"];
}

- (BOOL)docUnderstandingRecordNeedsProcessing:(id)a3 bundleID:(id)a4 isUpdate:(BOOL)a5 hasTextContent:(BOOL)a6 shouldClear:(BOOL *)a7 shouldMarkComplete:(BOOL *)a8
{
  BOOL v10 = a5;
  id v12 = a3;
  BOOL v13 = [(SKGProcessor *)self recordContainsValue:v12 key:@"_kMDItemOCRContentLevel1"];
  if (v13)
  {
    if (a8)
    {
      id v14 = [(SKGProcessor *)self copyStringValueFromRecord:v12 key:@"_kMDItemOCRContentLevel1"];
      id v15 = +[NSCharacterSet whitespaceCharacterSet];
      id v16 = [v14 stringByTrimmingCharactersInSet:v15];

      if ((char *)[v16 length] - 1501 <= (char *)0xFFFFFFFFFFFFFA2CLL) {
        *a8 = 1;
      }
    }
    if (a7 && v10) {
      *a7 = 1;
    }
  }

  return v13;
}

- (BOOL)updateSKGProcessorDocUnderstandingAttributes:(id)a3 record:(id)a4 bundleID:(id)a5 protectionClass:(id)a6 recordHasText:(BOOL)a7 itemHasText:(BOOL)a8 isUpdate:(BOOL)a9
{
  BOOL v9 = a7;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = [v14 objectForKeyedSubscript:@"_kMDItemNeedsDocumentUnderstanding"];
  if (v16)
  {

LABEL_17:
    LOBYTE(v22) = 0;
    goto LABEL_18;
  }
  id v17 = [v14 objectForKeyedSubscript:@"kMDItemDocumentUnderstandingVersion"];

  if (v17) {
    goto LABEL_17;
  }
  if (v15)
  {
    id v18 = v15;
  }
  else
  {
    id v18 = [(SKGProcessor *)self copyBundleIdentifierFromRecord:v14];
    if (!v18)
    {
      id v18 = [(SKGProcessor *)self copyDomainIdentifierFromRecord:v14];
      if (v18)
      {
        unsigned int v23 = +[SKGProcessorContext sharedContext];
        BOOL v24 = [v23 docUnderstandingItemDomainIds];
        unsigned __int8 v25 = [v24 containsObject:v18];

        if (v25)
        {

          id v18 = 0;
          goto LABEL_8;
        }
      }
LABEL_16:
      [(SKGProcessor *)self clearDocUnderstandingAttributes:v13];

      goto LABEL_17;
    }
  }
  id v19 = +[SKGProcessorContext sharedContext];
  int v20 = [v19 docUnderstandingIncludeBundles];
  unsigned __int8 v21 = [v20 containsObject:v18];

  if ((v21 & 1) == 0) {
    goto LABEL_16;
  }
LABEL_8:
  __int16 v27 = 0;
  BOOL v22 = [(SKGProcessor *)self docUnderstandingRecordNeedsProcessing:v14 bundleID:v18 isUpdate:a9 hasTextContent:v9 shouldClear:(char *)&v27 + 1 shouldMarkComplete:&v27];
  if (v22)
  {
    if (HIBYTE(v27)) {
      [(SKGProcessor *)self clearDocUnderstandingAttributes:v13];
    }
    if ((_BYTE)v27) {
      [(SKGProcessor *)self completeDocUnderstandingAttributes:v13];
    }
    else {
      [v13 setObject:&off_1000E6150 forKey:@"_kMDItemNeedsDocumentUnderstanding"];
    }
  }

LABEL_18:
  return v22;
}

- (BOOL)updateSKGReindexerDocUnderstandingAttributes:(id)a3 record:(id)a4 bundleID:(id)a5 itemHasText:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([(SKGProcessor *)self recordContainsValue:v11 key:@"_kMDItemNeedsDocumentUnderstanding"])
  {
    goto LABEL_23;
  }
  if (v12)
  {
    id v13 = v12;
  }
  else
  {
    id v13 = [(SKGProcessor *)self copyBundleIdentifierFromRecord:v11];
    if (!v13)
    {
      id v13 = [(SKGProcessor *)self copyDomainIdentifierFromRecord:v11];
      if (v13)
      {
        id v28 = +[SKGProcessorContext sharedContext];
        uint64_t v29 = [v28 docUnderstandingItemDomainIds];
        unsigned __int8 v30 = [v29 containsObject:v13];

        if (v30)
        {

          id v13 = 0;
          goto LABEL_6;
        }
      }
      goto LABEL_22;
    }
  }
  id v14 = +[SKGProcessorContext sharedContext];
  id v15 = [v14 docUnderstandingIncludeBundles];
  unsigned __int8 v16 = [v15 containsObject:v13];

  if ((v16 & 1) == 0)
  {
LABEL_22:
    [(SKGProcessor *)self clearDocUnderstandingAttributes:v10];

LABEL_23:
    LOBYTE(v26) = 0;
    goto LABEL_24;
  }
LABEL_6:
  id v17 = [(SKGProcessor *)self copyDocumentUnderstandingVersionFromRecord:v11];
  id v32 = v17;
  if (v17)
  {
    signed int v18 = objc_msgSend(v17, "intValue", v17);
    id v19 = +[SKGProcessorContext sharedContext];
    BOOL v20 = [v19 documentUnderstandingVersion] == (id)v18;
  }
  else
  {
    BOOL v20 = 0;
  }
  id v21 = [(SKGProcessor *)self copyNumberValueFromRecord:v11, @"_kMDItemUpdaterVersion", v32 key];
  BOOL v22 = v21;
  if (v21)
  {
    signed int v23 = [v21 intValue];
    BOOL v24 = +[SKGProcessorContext sharedContext];
    BOOL v25 = [v24 textVersion] != (id)v23;
  }
  else
  {
    BOOL v25 = 0;
  }
  __int16 v34 = 0;
  unsigned int v26 = [(SKGProcessor *)self docUnderstandingRecordNeedsProcessing:v11 bundleID:v13 isUpdate:0 hasTextContent:v6 shouldClear:(char *)&v34 + 1 shouldMarkComplete:&v34]&& (!v20 || v25);
  if (HIBYTE(v34)) {
    [(SKGProcessor *)self clearDocUnderstandingAttributes:v10];
  }
  int v27 = v26 ^ 1;
  if (!(_BYTE)v34) {
    int v27 = 1;
  }
  if (((v27 | v20) & 1) == 0)
  {
    [(SKGProcessor *)self clearDocUnderstandingAttributes:v10];
    LOBYTE(v26) = 0;
  }

LABEL_24:
  return v26;
}

- (BOOL)needsDocumentUnderstandingForRecord:(id)a3 bundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    id v8 = +[SKGProcessor sharedProcessor];
    unsigned int v9 = [v8 recordIsValid:v6];

    if (v9)
    {
      id v10 = [(SKGProcessor *)self copyDocumentUnderstandingVersionFromRecord:v6];
      id v11 = v10;
      if (v10)
      {
        unsigned int v12 = [v10 intValue];
        id v13 = +[SKGProcessorContext sharedContext];
        id v14 = [v13 documentUnderstandingVersion];

        if (v14 == (id)(int)v12)
        {
          LOBYTE(v15) = 0;
LABEL_16:

          goto LABEL_17;
        }
      }
      if (v7)
      {
        id v16 = v7;
      }
      else
      {
        id v16 = [(SKGProcessor *)self copyBundleIdentifierFromRecord:v6];
        if (!v16)
        {
          id v15 = [(SKGProcessor *)self copyDomainIdentifierFromRecord:v6];
          if (!v15)
          {
            id v16 = 0;
            goto LABEL_15;
          }
          BOOL v20 = +[SKGProcessorContext sharedContext];
          id v21 = [v20 docUnderstandingItemDomainIds];
          unsigned int v22 = [v21 containsObject:v15];

          id v16 = 0;
          if (v22) {
            goto LABEL_11;
          }
          goto LABEL_14;
        }
      }
      id v17 = +[SKGProcessorContext sharedContext];
      signed int v18 = [v17 docUnderstandingIncludeBundles];
      unsigned __int8 v19 = [v18 containsObject:v16];

      if (v19)
      {
LABEL_11:
        LOBYTE(v15) = 1;
LABEL_15:

        goto LABEL_16;
      }
LABEL_14:
      LOBYTE(v15) = 0;
      goto LABEL_15;
    }
  }
  LOBYTE(v15) = 0;
LABEL_17:

  return (char)v15;
}

- (BOOL)shouldGenerateDocumentUnderstandingForRecord:(id)a3 bundleID:(id)a4
{
  id v5 = a3;
  id v6 = [(SKGProcessor *)self copyStringValueFromRecord:v5 key:@"_kMDItemOCRContentLevel1"];

  if (v6)
  {
    BOOL v7 = 1;
  }
  else
  {
    id v8 = [(SKGProcessor *)self copyDocumentTypesFromRecord:v5];
    unsigned int v9 = v8;
    if (v8)
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v10 = v8;
      id v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v20;
        while (2)
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v20 != v13) {
              objc_enumerationMutation(v10);
            }
            id v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
            if (v15)
            {
              int v16 = objc_msgSend(v15, "intValue", (void)v19);
              if (v16 > 11245)
              {
                if (v16 == 11246 || v16 == 12539)
                {
LABEL_21:
                  BOOL v7 = 1;
                  goto LABEL_24;
                }
              }
              else if (v16 == 492 || v16 == 960)
              {
                goto LABEL_21;
              }
            }
          }
          id v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
          BOOL v7 = 0;
          if (v12) {
            continue;
          }
          break;
        }
      }
      else
      {
        BOOL v7 = 0;
      }
LABEL_24:
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  return v7;
}

- (void)clearKeyphrasesAttributes:(id)a3
{
  id v3 = a3;
  [v3 setObject:kCFNull forKey:@"_kMDItemNeedsKeyphrases"];
  [v3 setObject:kCFNull forKey:@"kMDItemKeyphraseLabels"];
  [v3 setObject:kCFNull forKey:@"kMDItemKeyphraseConfidences"];
  [v3 setObject:kCFNull forKey:@"kMDItemKeyphraseVersion"];
}

- (void)completeKeyphrasesAttributes:(id)a3
{
  id v3 = a3;
  id v5 = +[SKGProcessorContext sharedContext];
  unsigned __int8 v4 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v5 keyphraseVersion]);
  [v3 setObject:v4 forKey:@"kMDItemKeyphraseVersion"];
}

- (BOOL)keyphraseRecordNeedsProcessing:(id)a3 bundleID:(id)a4 isUpdate:(BOOL)a5 hasTextContent:(BOOL)a6 shouldClear:(BOOL *)a7 shouldMarkComplete:(BOOL *)a8
{
  BOOL v10 = a6;
  id v13 = a3;
  id v14 = a4;
  if (!v10)
  {
    if (a5) {
      goto LABEL_8;
    }
LABEL_7:
    *a7 = 1;
    goto LABEL_8;
  }
  if (+[SKGProcessor textContentLengthForRecord:v13] <= 0x13) {
    *a8 = 1;
  }
  if (a5) {
    goto LABEL_7;
  }
LABEL_8:

  return v10;
}

- (BOOL)updateSKGProcessorKeyphrasesAttributes:(id)a3 record:(id)a4 bundleID:(id)a5 protectionClass:(id)a6 recordHasText:(BOOL)a7 itemHasText:(BOOL)a8 isUpdate:(BOOL)a9
{
  BOOL v9 = a7;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  signed int v18 = [v15 objectForKeyedSubscript:@"_kMDItemNeedsKeyphrases"];
  if (!v18)
  {
    long long v19 = [v15 objectForKeyedSubscript:@"kMDItemKeyphraseVersion"];

    if (v19) {
      goto LABEL_4;
    }
    long long v22 = +[SKGProcessorContext sharedContext];
    uint64_t v23 = [v22 enableExtractions];

    if (v17
      && (v23 & 1) == 0
      && (([v17 isEqualToString:NSFileProtectionComplete] & 1) != 0
       || [v17 isEqualToString:NSFileProtectionCompleteUnlessOpen]))
    {
      [(SKGProcessor *)self clearKeyphrasesAttributes:v14];
      goto LABEL_4;
    }
    if (v16)
    {
      id v24 = v16;
    }
    else
    {
      id v24 = [(SKGProcessor *)self copyBundleIdentifierFromRecord:v15];
      if (!v24) {
        goto LABEL_16;
      }
    }
    BOOL v25 = +[SKGProcessorContext sharedContext];
    unsigned int v26 = [v25 keyphraseExcludeBundles];
    unsigned int v27 = [v26 containsObject:v24];

    if (v27)
    {
      [(SKGProcessor *)self clearKeyphrasesAttributes:v14];
      LOBYTE(v20) = 0;
LABEL_22:

      goto LABEL_5;
    }
LABEL_16:
    __int16 v28 = 0;
    BOOL v20 = [(SKGProcessor *)self keyphraseRecordNeedsProcessing:v15 bundleID:v24 isUpdate:a9 hasTextContent:v9 shouldClear:(char *)&v28 + 1 shouldMarkComplete:&v28];
    if (v20)
    {
      if (HIBYTE(v28)) {
        [(SKGProcessor *)self clearKeyphrasesAttributes:v14];
      }
      if ((_BYTE)v28) {
        [(SKGProcessor *)self completeKeyphrasesAttributes:v14];
      }
      else {
        [v14 setObject:&off_1000E6168 forKey:@"_kMDItemNeedsKeyphrases"];
      }
    }
    goto LABEL_22;
  }

LABEL_4:
  LOBYTE(v20) = 0;
LABEL_5:

  return v20;
}

- (BOOL)updateSKGReindexerKeyphrasesAttributes:(id)a3 record:(id)a4 bundleID:(id)a5 itemHasText:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (![(SKGProcessor *)self recordContainsValue:v11 key:@"_kMDItemNeedsKeyphrases"])
  {
    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      id v14 = [(SKGProcessor *)self copyBundleIdentifierFromRecord:v11];
      if (!v14) {
        goto LABEL_8;
      }
    }
    id v15 = +[SKGProcessorContext sharedContext];
    id v16 = [v15 keyphraseExcludeBundles];
    unsigned int v17 = [v16 containsObject:v14];

    if (v17)
    {
      [(SKGProcessor *)self clearKeyphrasesAttributes:v10];
      LOBYTE(v13) = 0;
LABEL_21:

      goto LABEL_22;
    }
LABEL_8:
    id v18 = [(SKGProcessor *)self copyKeyphraseVersionFromRecord:v11];
    id v29 = v18;
    if (v18)
    {
      signed int v19 = objc_msgSend(v18, "intValue", v18);
      BOOL v20 = +[SKGProcessorContext sharedContext];
      BOOL v21 = [v20 keyphraseVersion] == (id)v19;
    }
    else
    {
      BOOL v21 = 0;
    }
    id v22 = [(SKGProcessor *)self copyNumberValueFromRecord:v11, @"_kMDItemUpdaterVersion", v29 key];
    uint64_t v23 = v22;
    if (v22)
    {
      signed int v24 = [v22 intValue];
      BOOL v25 = +[SKGProcessorContext sharedContext];
      BOOL v26 = [v25 textVersion] != (id)v24;
    }
    else
    {
      BOOL v26 = 0;
    }
    __int16 v31 = 0;
    unsigned int v13 = [(SKGProcessor *)self keyphraseRecordNeedsProcessing:v11 bundleID:v14 isUpdate:0 hasTextContent:v6 shouldClear:(char *)&v31 + 1 shouldMarkComplete:&v31]&& (!v21 || v26);
    if (HIBYTE(v31)) {
      [(SKGProcessor *)self clearKeyphrasesAttributes:v10];
    }
    int v27 = v13 ^ 1;
    if (!(_BYTE)v31) {
      int v27 = 1;
    }
    if (((v27 | v21) & 1) == 0)
    {
      [(SKGProcessor *)self completeKeyphrasesAttributes:v10];
      LOBYTE(v13) = 0;
    }

    goto LABEL_21;
  }
  LOBYTE(v13) = 0;
LABEL_22:

  return v13;
}

- (BOOL)needsKeyphrasesForRecord:(id)a3 bundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    id v8 = +[SKGProcessor sharedProcessor];
    unsigned int v9 = [v8 recordIsValid:v6];

    if (v9)
    {
      id v10 = [(SKGProcessor *)self copyKeyphraseVersionFromRecord:v6];
      id v11 = v10;
      if (v10)
      {
        unsigned int v12 = [v10 intValue];
        unsigned int v13 = +[SKGProcessorContext sharedContext];
        id v14 = [v13 keyphraseVersion];

        if (v14 == (id)(int)v12)
        {
          BOOL v15 = 0;
LABEL_16:

          goto LABEL_17;
        }
      }
      if (v7)
      {
        id v16 = v7;
      }
      else
      {
        id v16 = [(SKGProcessor *)self copyBundleIdentifierFromRecord:v6];
        if (!v16) {
          goto LABEL_12;
        }
      }
      unsigned int v17 = +[SKGProcessorContext sharedContext];
      id v18 = [v17 keyphraseExcludeBundles];
      unsigned __int8 v19 = [v18 containsObject:v16];

      if (v19)
      {
        BOOL v15 = 0;
LABEL_15:

        goto LABEL_16;
      }
LABEL_12:
      if ([(SKGProcessor *)self recordContainsValue:v6 key:@"kMDItemTextContent"]) {
        BOOL v15 = 1;
      }
      else {
        BOOL v15 = [(SKGProcessor *)self recordContainsValue:v6 key:@"_kMDItemSnippet"];
      }
      goto LABEL_15;
    }
  }
  BOOL v15 = 0;
LABEL_17:

  return v15;
}

- (BOOL)shouldGenerateKeyphrasesForRecord:(id)a3 bundleID:(id)a4
{
  id v5 = a3;
  id v6 = [(SKGProcessor *)self copyFileProviderIDFromRecord:v5];

  if (v6)
  {
    id v7 = [(SKGProcessor *)self copyNumberValueFromRecord:v5 key:@"_kMDItemRequiresImport"];
    id v8 = [(SKGProcessor *)self copyContentTypeFromRecord:v5];
    unsigned int v9 = v8;
    BOOL v10 = v7
       && v8
       && [v7 BOOLValue]
       && ![v9 isEqualToString:@"public.folder"];
  }
  else
  {
    BOOL v10 = 1;
  }

  return v10;
}

- (void)setForceEntityExtraction:(BOOL)a3
{
  byte_1000F8A10 = 1;
}

- (BOOL)forceEntityExtraction
{
  return byte_1000F8A10;
}

- (BOOL)loadKeyphraser
{
  id v18 = +[SKGSystemListener sharedProcessorListener];
  id v2 = [v18 currentPreferredLocaleIdentifiers];
  +[SKGDataDetector sharedDetector];

  memset(v28, 0, 60);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v2;
  id v3 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v22;
    do
    {
      id v6 = 0;
      id v19 = v4;
      do
      {
        if (*(void *)v22 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = +[NSLocale localeWithLocaleIdentifier:*(void *)(*((void *)&v21 + 1) + 8 * (void)v6)];
        [v7 regionCode];
        uint64_t RegionID = SILanguagesGetRegionID();
        unsigned int LanguageID = SILanguagesGetLanguageID();
        if (LanguageID - 59 >= 0xFFFFFFC7)
        {
          unsigned int v10 = LanguageID;
          uint64_t v11 = v5;
          uint64_t v12 = LanguageID;
          unsigned int v13 = (os_unfair_lock_s *)((char *)&unk_1000F8A14 + 4 * LanguageID);
          os_unfair_lock_lock(v13);
          if (!*((unsigned char *)v28 + v10) && (!qword_1000F8B08[v12] || qword_1000F83B8[v12] != RegionID))
          {
            v25[0] = kSILanguageModelOptionEnableLanguageModel;
            v25[1] = kSILanguageModelOptionLocale;
            v26[0] = &__kCFBooleanTrue;
            v26[1] = v7;
            v25[2] = kSILanguageModelOptionReducedResources;
            v25[3] = kSILanguageModelOptionCacheResults;
            v26[2] = &__kCFBooleanFalse;
            v26[3] = &__kCFBooleanFalse;
            v25[4] = kSILanguageModelOptionNoTimeout;
            v26[4] = &__kCFBooleanTrue;
            id v14 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:5];
            if (qword_1000F8B08[v12])
            {
              SILanguageModelRelease();
              qword_1000F8B08[v12] = 0;
            }
            qword_1000F8B08[v12] = SILanguageModelCreateWithOptions();
            qword_1000F83B8[v12] = RegionID;
          }
          os_unfair_lock_unlock(v13);
          *((unsigned char *)v28 + v12) = 1;
          uint64_t v5 = v11;
          id v4 = v19;
        }

        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v4);
  }

  uint64_t v15 = 0;
  id v16 = (os_unfair_lock_s *)&unk_1000F8A14;
  do
  {
    if (!*((unsigned char *)v28 + v15))
    {
      os_unfair_lock_lock(v16);
      if (qword_1000F8B08[v15])
      {
        SILanguageModelRelease();
        qword_1000F8B08[v15] = 0;
      }
      qword_1000F83B8[v15] = -1;
      os_unfair_lock_unlock(v16);
    }
    ++v15;
    ++v16;
  }
  while (v15 != 59);

  return 1;
}

- (id)availableLanguages
{
  id v2 = +[SKGSystemListener sharedProcessorListener];
  id v3 = [v2 currentPreferredLanguages];

  return v3;
}

- (BOOL)generateKeyphrasesForRecord:(id)a3 processedItem:(id)a4 fetchCachedLanguageBlock:(id)a5 cacheLanguageBlock:(id)a6 cancelBlock:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v85 = a7;
  uint64_t v15 = [v12 textContentLanguage];

  LOBYTE(a6) = 1;
  if (!v15) {
    goto LABEL_81;
  }
  uint64_t v99 = 0;
  v100 = &v99;
  uint64_t v101 = 0x2020000000;
  char v102 = 1;
  unsigned int v17 = [v12 textContentLanguage];
  uint64_t v18 = +[NSLocale localeWithLocaleIdentifier:v17];

  v89 = (void *)v18;
  unsigned int LanguageID = SILanguagesGetLanguageID();
  uint64_t Language = SILanguagesGetLanguage();
  if (LanguageID - 59 >= 0xFFFFFFC7)
  {
    uint64_t v21 = Language;
    long long v22 = [(SKGProcessor *)self availableLanguages];
    LODWORD(v21) = [v22 containsObject:v21];

    if (v21)
    {
      id v77 = [(SKGProcessor *)self referenceDateForRecord:v11];
      if (v77)
      {
        long long v23 = +[SKGSystemListener sharedProcessorListener];
        long long v76 = [v23 currentTimezone];
      }
      else
      {
        long long v76 = 0;
      }
      a6 = (char *)&unk_1000F8A14 + 4 * LanguageID;
      os_unfair_lock_lock((os_unfair_lock_t)a6);
      uint64_t v25 = SILanguageModelRetain();
      os_unfair_lock_unlock((os_unfair_lock_t)a6);
      if (!v25)
      {
        int v24 = 1;
        LOBYTE(a6) = 1;
LABEL_77:

        goto LABEL_78;
      }
      id v26 = [(SKGProcessor *)self copyTextContentFromRecord:v11];
      id v73 = v26;
      if (!v26)
      {
        id v26 = [(SKGProcessor *)self copySnippetFromRecord:v11];
        if (!v26)
        {
          id v32 = 0;
          LOBYTE(a6) = *((unsigned char *)v100 + 24) != 0;
          int v24 = 1;
LABEL_76:

          goto LABEL_77;
        }
      }
      v65 = v26;
      if (![v26 length])
      {
LABEL_73:
        if (*((unsigned char *)v100 + 24)) {
          [v12 setDidProcessKeyphrases:1];
        }
        SILanguageModelRelease();
        int v24 = 0;
        id v32 = v65;
        goto LABEL_76;
      }
      uint64_t v86 = v25;
      id v66 = v11;
      id v67 = v12;
      v96[0] = _NSConcreteStackBlock;
      v96[1] = 3221225472;
      v96[2] = sub_1000336E4;
      v96[3] = &unk_1000D9B60;
      v98 = &v99;
      id v74 = v85;
      id v97 = v74;
      v72 = objc_retainBlock(v96);
      int v27 = +[SKGProcessorContext sharedContext];
      if ([v27 enableKeyphrases])
      {
        __int16 v28 = +[SKGProcessorContext sharedContext];
        id v29 = [v28 keyphraseExcludeBundles];
        unsigned __int8 v30 = [v12 bundleIdentifier];
        unsigned __int8 v31 = [v29 containsObject:v30];

        if (v31)
        {
          long long v75 = 0;
          goto LABEL_20;
        }
        v92[0] = _NSConcreteStackBlock;
        v92[1] = 3221225472;
        v92[2] = sub_10003375C;
        v92[3] = &unk_1000D9CB0;
        id v93 = v12;
        v95 = &v99;
        id v94 = v74;
        long long v75 = objc_retainBlock(v92);

        int v27 = v93;
      }
      else
      {
        long long v75 = 0;
      }

LABEL_20:
      +[SKGProcessorContext sharedContext];
      v33 = id v11 = v66;
      if ([v33 enableExtractions])
      {
      }
      else
      {
        unsigned __int8 v34 = [(SKGProcessor *)self forceEntityExtraction];

        if ((v34 & 1) == 0)
        {
          v71 = 0;
          goto LABEL_25;
        }
      }
      v90[0] = _NSConcreteStackBlock;
      v90[1] = 3221225472;
      v90[2] = sub_10003388C;
      v90[3] = &unk_1000D9CD8;
      id v91 = v12;
      v71 = objc_retainBlock(v90);

LABEL_25:
      a6 = [v65 componentsSeparatedByString:@"\n"];
      v35 = (char *)[a6 count];
      if (v35)
      {
        id v36 = 0;
        long long v79 = (uint64_t (**)(void *))(v72 + 2);
        long long v64 = xmmword_1000B6930;
        id v69 = v14;
        id v70 = v13;
        id v68 = a6;
        long long v78 = v35;
        while (1)
        {
          v84 = objc_msgSend(a6, "objectAtIndexedSubscript:", v36, v64);
          v37 = +[NSCharacterSet whitespaceCharacterSet];
          id v38 = [v84 stringByTrimmingCharactersInSet:v37];

          id v82 = v36 + 1;
          if ([v38 length])
          {
            if (v73) {
              BOOL v39 = 0;
            }
            else {
              BOOL v39 = v82 == v78;
            }
            char v40 = v39;
            char v83 = v40;
            v87 = v75;
            long long v80 = v71;
            id v41 = v72;
            uint64_t v121 = 0;
            v122 = &v121;
            uint64_t v123 = 0x2020000000;
            char v124 = 1;
            uint64_t v42 = (char *)[v38 length];
            id v43 = objc_alloc_init((Class)NSMutableArray);
            uint64_t v44 = +[SKGDataDetector sharedDetector];
            v118[0] = _NSConcreteStackBlock;
            v118[1] = 3221225472;
            v118[2] = sub_100033BBC;
            v118[3] = &unk_1000D9D00;
            id v45 = v43;
            id v119 = v45;
            v88 = v41;
            id v120 = v88;
            unsigned __int8 v46 = [v44 enumerateDataInString:v38 locale:v89 referenceDate:v77 referenceTimezone:v76 entityBlock:v80 rangeBlock:v118];

            if ((v46 & 1) == 0) {
              *((unsigned char *)v122 + 24) = 0;
            }

            if (!*((unsigned char *)v122 + 24))
            {
              int v48 = 0;
              goto LABEL_63;
            }
            int v47 = (*v79)(v88);
            int v48 = v47 == 0;
            if (!v47 && v75)
            {
              char v49 = [v45 firstObject];
              uint64_t v50 = 0;
              v116[0] = 0;
              v116[1] = v116;
              v116[2] = 0x3010000000;
              v116[3] = &unk_1000C6D0D;
              long long v117 = v64;
              while (v49)
              {
                uint64_t v51 = (char *)[v49 rangeValue];
                uint64_t v53 = v52;
                if (v51 != v50) {
                  goto LABEL_45;
                }
                [v45 removeObjectAtIndex:0];
                if ([v45 count])
                {
                  uint64_t v54 = [v45 objectAtIndexedSubscript:0];
                }
                else
                {
                  uint64_t v54 = 0;
                }
                v50 += v53;

                char v49 = (void *)v54;
LABEL_56:
                if (v50 >= v42) {
                  goto LABEL_62;
                }
              }
              uint64_t v53 = 0;
              uint64_t v51 = v42;
              if (v42 == v50)
              {
                char v49 = 0;
LABEL_62:
                int v48 = *((unsigned __int8 *)v122 + 24);
                _Block_object_dispose(v116, 8);

                id v11 = v66;
                id v12 = v67;
                goto LABEL_63;
              }
LABEL_45:
              uint64_t v55 = objc_msgSend(v38, "substringWithRange:", v50, v51 - v50);
              v103 = _NSConcreteStackBlock;
              uint64_t v104 = 3221225472;
              v105 = sub_100033C34;
              v106 = &unk_1000D9D50;
              v111 = v116;
              id v107 = 0;
              id v108 = 0;
              v109 = v87;
              v112 = &v121;
              uint64_t v113 = v86;
              v114 = v89;
              char v115 = v83;
              v56 = v88;
              id v110 = v56;
              int v57 = SITextTokenizerEnumerateTokensInString();
              v58 = v122;
              *((unsigned char *)v122 + 24) = v57;
              if (v57)
              {
                if ((*v79)(v56))
                {
                  v58 = v122;
                  goto LABEL_48;
                }
                if (v49)
                {
                  [v45 removeObjectAtIndex:0];
                  uint64_t v50 = &v51[v53];
                  if ([v45 count])
                  {
                    uint64_t v60 = [v45 objectAtIndexedSubscript:0];

                    char v59 = 1;
                    char v49 = (void *)v60;
                  }
                  else
                  {

                    char v49 = 0;
                    char v59 = 1;
                  }
                }
                else
                {
                  char v59 = 1;
                  uint64_t v50 = v51;
                }
              }
              else
              {
LABEL_48:
                char v59 = 0;
                *((unsigned char *)v58 + 24) = 0;
              }

              if ((v59 & 1) == 0) {
                goto LABEL_62;
              }
              goto LABEL_56;
            }
LABEL_63:

            _Block_object_dispose(&v121, 8);
            v61 = v100;
            int v62 = *((unsigned __int8 *)v100 + 24);
            a6 = v68;
            if (v74)
            {
              id v14 = v69;
              id v13 = v70;
              if (*((unsigned char *)v100 + 24))
              {
                int v62 = (*((uint64_t (**)(id, const __CFString *))v74 + 2))(v74, @"processTextContentFromRecord:keyphraser:text") ^ 1;
                v61 = v100;
              }
            }
            else
            {
              id v14 = v69;
              id v13 = v70;
            }
            *((unsigned char *)v61 + 24) = v62 != 0;
            if (!v48 || !v62) {
              break;
            }
          }

          id v36 = v82;
          if (v82 == v78) {
            goto LABEL_72;
          }
        }
        [v12 clearKeyphrases];
      }
LABEL_72:

      goto LABEL_73;
    }
  }
  int v24 = 1;
  LOBYTE(a6) = 1;
LABEL_78:

  if (!v24) {
    LOBYTE(a6) = *((unsigned char *)v100 + 24) != 0;
  }
  _Block_object_dispose(&v99, 8);
LABEL_81:

  return a6 & 1;
}

- (NSArray)loadedLocales
{
  id v2 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v3 = 0;
  id v4 = (os_unfair_lock_s *)&unk_1000F8A14;
  do
  {
    os_unfair_lock_lock(v4);
    if (qword_1000F8B08[v3])
    {
      uint64_t v5 = SILanguagesGetLanguage();
      SILanguagesGetRegion();
      id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v6) {
        CFStringRef v7 = v6;
      }
      else {
        CFStringRef v7 = @"US";
      }
      id v8 = +[NSString stringWithFormat:@"%@_%@", v5, v7];
      unsigned int v9 = +[NSLocale localeWithLocaleIdentifier:v8];

      [v2 addObject:v9];
    }
    os_unfair_lock_unlock(v4);
    ++v3;
    ++v4;
  }
  while (v3 != 59);

  return (NSArray *)v2;
}

+ (id)sharedProcessor
{
  if (qword_1000F8EA0 != -1) {
    dispatch_once(&qword_1000F8EA0, &stru_1000DA0C0);
  }
  id v2 = (void *)qword_1000F8E98;

  return v2;
}

- (SKGProcessor)initWithOptions:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SKGProcessor;
  uint64_t v3 = [(SKGProcessor *)&v7 init];
  if (v3)
  {
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.SpotlightKnowledge.processor", 0);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v4;
  }
  return v3;
}

- (void)setQueue:(id)a3
{
}

- (id)queue
{
  return self->_queue;
}

- (BOOL)recordIsValid:(id)a3
{
  return sub_10003A5F8((CFDictionaryRef)a3, @"_kMDItemUserActivityType") == 0;
}

- (id)copyReferenceIdentifierFromRecord:(id)a3
{
  CFDictionaryRef v3 = (const __CFDictionary *)a3;
  CFDictionaryRef v4 = v3;
  if (!v3) {
    goto LABEL_10;
  }
  value = 0;
  if (!CFDictionaryGetValueIfPresent(v3, @"_kMDItemExternalID", (const void **)&value)) {
    goto LABEL_10;
  }
  uint64_t v5 = value;
  if (value == kCFNull) {
    goto LABEL_10;
  }
  if (value)
  {
    CFTypeID v6 = CFGetTypeID(value);
    if (v6 == CFStringGetTypeID())
    {
      id v7 = [objc_alloc((Class)NSString) initWithString:v5];
LABEL_9:
      uint64_t v5 = v7;
      goto LABEL_11;
    }
    if (v6 == CFNumberGetTypeID())
    {
      id v7 = [objc_alloc((Class)NSString) initWithFormat:@"%@", v5];
      goto LABEL_9;
    }
LABEL_10:
    uint64_t v5 = 0;
  }
LABEL_11:

  return v5;
}

- (id)copyBundleIdentifierFromRecord:(id)a3
{
  CFDictionaryRef v3 = (const __CFDictionary *)a3;
  CFDictionaryRef v4 = v3;
  if (!v3) {
    goto LABEL_7;
  }
  value = 0;
  if (!CFDictionaryGetValueIfPresent(v3, @"_kMDItemBundleID", (const void **)&value)) {
    goto LABEL_7;
  }
  id v5 = value;
  if (value == kCFNull) {
    goto LABEL_7;
  }
  if (value)
  {
    CFTypeID v6 = CFGetTypeID(value);
    if (v6 == CFStringGetTypeID())
    {
      id v5 = [objc_alloc((Class)NSString) initWithString:v5];
      goto LABEL_8;
    }
LABEL_7:
    id v5 = 0;
  }
LABEL_8:

  return v5;
}

- (id)copyFileProviderIDFromRecord:(id)a3
{
  return [(SKGProcessor *)self copyStringValueFromRecord:a3 key:@"kMDItemFileProviderID"];
}

- (id)copyDomainIdentifierFromRecord:(id)a3
{
  return [(SKGProcessor *)self copyStringValueFromRecord:a3 key:@"_kMDItemDomainIdentifier"];
}

- (id)copyPersonaFromRecord:(id)a3
{
  return @"1";
}

- (id)copyEmbeddingVersionFromRecord:(id)a3
{
  CFDictionaryRef v3 = (const __CFDictionary *)a3;
  CFDictionaryRef v4 = v3;
  if (!v3) {
    goto LABEL_7;
  }
  value = 0;
  if (!CFDictionaryGetValueIfPresent(v3, @"kMDItemEmbeddingVersion", (const void **)&value)) {
    goto LABEL_7;
  }
  id v5 = value;
  if (value == kCFNull) {
    goto LABEL_7;
  }
  if (value)
  {
    CFTypeID v6 = CFGetTypeID(value);
    if (v6 == CFNumberGetTypeID())
    {
      id v5 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithInt:", objc_msgSend(v5, "intValue"));
      goto LABEL_8;
    }
LABEL_7:
    id v5 = 0;
  }
LABEL_8:

  return v5;
}

- (id)copyEmbeddingModelVersionFromRecord:(id)a3
{
  CFDictionaryRef v3 = (const __CFDictionary *)a3;
  CFDictionaryRef v4 = v3;
  if (!v3) {
    goto LABEL_7;
  }
  value = 0;
  if (!CFDictionaryGetValueIfPresent(v3, @"_kMDItemMediaEmbeddingVersion", (const void **)&value)) {
    goto LABEL_7;
  }
  id v5 = value;
  if (value == kCFNull) {
    goto LABEL_7;
  }
  if (value)
  {
    CFTypeID v6 = CFGetTypeID(value);
    if (v6 == CFNumberGetTypeID())
    {
      id v5 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithInt:", objc_msgSend(v5, "intValue"));
      goto LABEL_8;
    }
LABEL_7:
    id v5 = 0;
  }
LABEL_8:

  return v5;
}

- (id)copyKeyphraseVersionFromRecord:(id)a3
{
  CFDictionaryRef v3 = (const __CFDictionary *)a3;
  CFDictionaryRef v4 = v3;
  if (!v3) {
    goto LABEL_7;
  }
  value = 0;
  if (!CFDictionaryGetValueIfPresent(v3, @"kMDItemKeyphraseVersion", (const void **)&value)) {
    goto LABEL_7;
  }
  id v5 = value;
  if (value == kCFNull) {
    goto LABEL_7;
  }
  if (value)
  {
    CFTypeID v6 = CFGetTypeID(value);
    if (v6 == CFNumberGetTypeID())
    {
      id v5 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithInt:", objc_msgSend(v5, "intValue"));
      goto LABEL_8;
    }
LABEL_7:
    id v5 = 0;
  }
LABEL_8:

  return v5;
}

- (id)copySuggestedEventsVersionFromRecord:(id)a3
{
  CFDictionaryRef v3 = (const __CFDictionary *)a3;
  CFDictionaryRef v4 = v3;
  if (!v3) {
    goto LABEL_7;
  }
  value = 0;
  if (!CFDictionaryGetValueIfPresent(v3, @"kMDItemSuggestedEventsVersion", (const void **)&value)) {
    goto LABEL_7;
  }
  id v5 = value;
  if (value == kCFNull) {
    goto LABEL_7;
  }
  if (value)
  {
    CFTypeID v6 = CFGetTypeID(value);
    if (v6 == CFNumberGetTypeID())
    {
      id v5 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithInt:", objc_msgSend(v5, "intValue"));
      goto LABEL_8;
    }
LABEL_7:
    id v5 = 0;
  }
LABEL_8:

  return v5;
}

- (id)copyDocumentUnderstandingVersionFromRecord:(id)a3
{
  CFDictionaryRef v3 = (const __CFDictionary *)a3;
  CFDictionaryRef v4 = v3;
  if (!v3) {
    goto LABEL_7;
  }
  value = 0;
  if (!CFDictionaryGetValueIfPresent(v3, @"kMDItemDocumentUnderstandingVersion", (const void **)&value)) {
    goto LABEL_7;
  }
  id v5 = value;
  if (value == kCFNull) {
    goto LABEL_7;
  }
  if (value)
  {
    CFTypeID v6 = CFGetTypeID(value);
    if (v6 == CFNumberGetTypeID())
    {
      id v5 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithInt:", objc_msgSend(v5, "intValue"));
      goto LABEL_8;
    }
LABEL_7:
    id v5 = 0;
  }
LABEL_8:

  return v5;
}

- (id)copyDocumentTypesFromRecord:(id)a3
{
  if (a3) {
    return sub_10003A788((const __CFDictionary *)a3, @"kMDItemPhotosSceneClassificationIdentifiers");
  }
  else {
    return 0;
  }
}

- (id)copyPeopleVersionFromRecord:(id)a3
{
  CFDictionaryRef v3 = (const __CFDictionary *)a3;
  CFDictionaryRef v4 = v3;
  if (!v3) {
    goto LABEL_7;
  }
  value = 0;
  if (!CFDictionaryGetValueIfPresent(v3, @"_kMDItemKnowledgeIndexVersion", (const void **)&value)) {
    goto LABEL_7;
  }
  id v5 = value;
  if (value == kCFNull) {
    goto LABEL_7;
  }
  if (value)
  {
    CFTypeID v6 = CFGetTypeID(value);
    if (v6 == CFNumberGetTypeID())
    {
      id v5 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithInt:", objc_msgSend(v5, "intValue"));
      goto LABEL_8;
    }
LABEL_7:
    id v5 = 0;
  }
LABEL_8:

  return v5;
}

- (id)copyProtectionClassFromRecord:(id)a3
{
  CFDictionaryRef v3 = (const __CFDictionary *)a3;
  CFDictionaryRef v4 = v3;
  if (!v3) {
    goto LABEL_8;
  }
  value = 0;
  if (!CFDictionaryGetValueIfPresent(v3, @"_kMDItemProtectionClass", (const void **)&value)
    || (id v5 = value, value == kCFNull)
    || !value)
  {
    CFStringRef v7 = @"Default";
    goto LABEL_9;
  }
  CFTypeID v6 = CFGetTypeID(value);
  if (v6 != CFStringGetTypeID())
  {
LABEL_8:
    CFStringRef v7 = 0;
    goto LABEL_9;
  }
  CFStringRef v7 = (const __CFString *)[objc_alloc((Class)NSString) initWithString:v5];
LABEL_9:

  return (id)v7;
}

- (id)copyLanguageFromRecord:(id)a3
{
  CFDictionaryRef v3 = (const __CFDictionary *)a3;
  CFDictionaryRef v4 = v3;
  if (!v3) {
    goto LABEL_7;
  }
  value = 0;
  if (!CFDictionaryGetValueIfPresent(v3, @"kMDItemTextContentLanguage", (const void **)&value)) {
    goto LABEL_7;
  }
  id v5 = value;
  if (value == kCFNull) {
    goto LABEL_7;
  }
  if (value)
  {
    CFTypeID v6 = CFGetTypeID(value);
    if (v6 == CFStringGetTypeID())
    {
      id v7 = [objc_alloc((Class)NSString) initWithString:v5];
      id v8 = +[NSCharacterSet whitespaceCharacterSet];
      id v5 = [v7 stringByTrimmingCharactersInSet:v8];

      goto LABEL_8;
    }
LABEL_7:
    id v5 = 0;
  }
LABEL_8:

  return v5;
}

- (id)copyTextContentFromRecord:(id)a3
{
  CFDictionaryRef v3 = (const __CFDictionary *)a3;
  CFDictionaryRef v4 = v3;
  if (!v3) {
    goto LABEL_7;
  }
  value = 0;
  if (!CFDictionaryGetValueIfPresent(v3, @"kMDItemTextContent", (const void **)&value)) {
    goto LABEL_7;
  }
  id v5 = value;
  if (value == kCFNull) {
    goto LABEL_7;
  }
  if (value)
  {
    CFTypeID v6 = CFGetTypeID(value);
    if (v6 == CFStringGetTypeID())
    {
      id v7 = [objc_alloc((Class)NSString) initWithString:v5];
      id v8 = +[NSCharacterSet whitespaceCharacterSet];
      id v5 = [v7 stringByTrimmingCharactersInSet:v8];

      goto LABEL_8;
    }
LABEL_7:
    id v5 = 0;
  }
LABEL_8:

  return v5;
}

- (id)copyDescriptionContentFromRecord:(id)a3
{
  CFDictionaryRef v3 = (const __CFDictionary *)a3;
  CFDictionaryRef v4 = v3;
  if (!v3) {
    goto LABEL_7;
  }
  value = 0;
  if (!CFDictionaryGetValueIfPresent(v3, @"kMDItemDescription", (const void **)&value)) {
    goto LABEL_7;
  }
  id v5 = value;
  if (value == kCFNull) {
    goto LABEL_7;
  }
  if (value)
  {
    CFTypeID v6 = CFGetTypeID(value);
    if (v6 == CFStringGetTypeID())
    {
      id v7 = [objc_alloc((Class)NSString) initWithString:v5];
      id v8 = +[NSCharacterSet whitespaceCharacterSet];
      id v5 = [v7 stringByTrimmingCharactersInSet:v8];

      goto LABEL_8;
    }
LABEL_7:
    id v5 = 0;
  }
LABEL_8:

  return v5;
}

- (id)copyContentURLFromRecord:(id)a3
{
  CFDictionaryRef v3 = (const __CFDictionary *)a3;
  CFDictionaryRef v4 = v3;
  if (!v3) {
    goto LABEL_9;
  }
  value = 0;
  if (!CFDictionaryGetValueIfPresent(v3, @"kMDItemContentURL", (const void **)&value)) {
    goto LABEL_9;
  }
  id v5 = value;
  if (value == kCFNull) {
    goto LABEL_9;
  }
  if (value)
  {
    CFTypeID v6 = CFGetTypeID(value);
    if (v6 == CFStringGetTypeID())
    {
      id v7 = +[NSString stringWithString:v5];
      id v5 = [objc_alloc((Class)NSURL) initWithString:v7];

      goto LABEL_10;
    }
    if (v6 == CFURLGetTypeID())
    {
      id v5 = [v5 copy];
      goto LABEL_10;
    }
LABEL_9:
    id v5 = 0;
  }
LABEL_10:

  return v5;
}

- (id)copyContentTypeFromRecord:(id)a3
{
  CFDictionaryRef v3 = (const __CFDictionary *)a3;
  CFDictionaryRef v4 = v3;
  if (!v3) {
    goto LABEL_7;
  }
  value = 0;
  if (!CFDictionaryGetValueIfPresent(v3, @"kMDItemContentType", (const void **)&value)) {
    goto LABEL_7;
  }
  id v5 = value;
  if (value == kCFNull) {
    goto LABEL_7;
  }
  if (value)
  {
    CFTypeID v6 = CFGetTypeID(value);
    if (v6 == CFStringGetTypeID())
    {
      id v5 = [objc_alloc((Class)NSString) initWithString:v5];
      goto LABEL_8;
    }
LABEL_7:
    id v5 = 0;
  }
LABEL_8:

  return v5;
}

- (id)copySnippetFromRecord:(id)a3
{
  CFDictionaryRef v3 = (const __CFDictionary *)a3;
  CFDictionaryRef v4 = v3;
  if (!v3) {
    goto LABEL_7;
  }
  value = 0;
  if (!CFDictionaryGetValueIfPresent(v3, @"_kMDItemSnippet", (const void **)&value)) {
    goto LABEL_7;
  }
  id v5 = value;
  if (value == kCFNull) {
    goto LABEL_7;
  }
  if (value)
  {
    CFTypeID v6 = CFGetTypeID(value);
    if (v6 == CFStringGetTypeID())
    {
      id v5 = [objc_alloc((Class)NSString) initWithString:v5];
      goto LABEL_8;
    }
LABEL_7:
    id v5 = 0;
  }
LABEL_8:

  return v5;
}

- (id)copyStringValueFromRecord:(id)a3 key:(id)a4
{
  CFDictionaryRef v5 = (const __CFDictionary *)a3;
  id v6 = a4;
  if (!v5) {
    goto LABEL_7;
  }
  id v7 = sub_10003A5F8(v5, v6);
  id v8 = v7;
  if (v7)
  {
    CFTypeID v9 = CFGetTypeID(v7);
    if (v9 == CFStringGetTypeID())
    {
      id v8 = [objc_alloc((Class)NSString) initWithString:v8];
      goto LABEL_8;
    }
    if (v9 == CFURLGetTypeID())
    {
      id v10 = objc_alloc((Class)NSString);
      id v11 = [v8 absoluteString];
      id v8 = [v10 initWithString:v11];

      goto LABEL_8;
    }
LABEL_7:
    id v8 = 0;
  }
LABEL_8:

  return v8;
}

- (id)copyNumberValueFromRecord:(id)a3 key:(id)a4
{
  CFDictionaryRef v5 = (const __CFDictionary *)a3;
  id v6 = a4;
  if (!v5) {
    goto LABEL_8;
  }
  id v7 = sub_10003A5F8(v5, v6);
  id v8 = v7;
  if (v7)
  {
    CFTypeID v9 = CFGetTypeID(v7);
    if (v9 == CFNumberGetTypeID())
    {
      id v10 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithInt:", objc_msgSend(v8, "intValue"));
LABEL_7:
      id v8 = v10;
      goto LABEL_9;
    }
    if (v9 == CFBooleanGetTypeID())
    {
      id v10 = [objc_alloc((Class)NSNumber) initWithBool:CFBooleanGetValue((CFBooleanRef)v8) != 0];
      goto LABEL_7;
    }
LABEL_8:
    id v8 = 0;
  }
LABEL_9:

  return v8;
}

- (id)copyTitleFromRecord:(id)a3
{
  CFDictionaryRef v3 = (const __CFDictionary *)a3;
  CFDictionaryRef v4 = v3;
  if (!v3) {
    goto LABEL_13;
  }
  value = 0;
  if (CFDictionaryGetValueIfPresent(v3, @"kMDItemSubject", (const void **)&value))
  {
    CFDictionaryRef v5 = value;
    if (value != kCFNull)
    {
      if (value) {
        goto LABEL_11;
      }
    }
  }
  value = 0;
  if (CFDictionaryGetValueIfPresent(v4, @"kMDItemTitle", (const void **)&value))
  {
    CFDictionaryRef v5 = value;
    if (value != kCFNull)
    {
      if (value) {
        goto LABEL_11;
      }
    }
  }
  value = 0;
  if (!CFDictionaryGetValueIfPresent(v4, @"kMDItemDisplayName", (const void **)&value)) {
    goto LABEL_13;
  }
  CFDictionaryRef v5 = value;
  if (value == kCFNull) {
    goto LABEL_13;
  }
  if (value)
  {
LABEL_11:
    CFTypeID v6 = CFGetTypeID(v5);
    if (v6 == CFStringGetTypeID())
    {
      id v7 = [objc_alloc((Class)NSString) initWithString:v5];
      id v8 = +[NSCharacterSet whitespaceCharacterSet];
      CFDictionaryRef v5 = [v7 stringByTrimmingCharactersInSet:v8];

      goto LABEL_14;
    }
LABEL_13:
    CFDictionaryRef v5 = 0;
  }
LABEL_14:

  return (id)v5;
}

- (id)copyStringArrayFromRecordAndConcatnate:(id)a3 key:(id)a4
{
  if (!a3) {
    return 0;
  }
  CFDictionaryRef v4 = sub_10003A788((const __CFDictionary *)a3, a4);
  if ([(__CFArray *)v4 count])
  {
    id v5 = objc_alloc((Class)NSString);
    CFTypeID v6 = [(__CFArray *)v4 componentsJoinedByString:@", "];
    id v7 = [v5 initWithString:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)copyExtraDataFromWalletRecord:(id)a3
{
  CFDictionaryRef v3 = (const __CFDictionary *)a3;
  CFDictionaryRef v4 = v3;
  if (!v3) {
    goto LABEL_9;
  }
  value = 0;
  if (!CFDictionaryGetValueIfPresent(v3, @"kMDItemExtraData", (const void **)&value)) {
    goto LABEL_9;
  }
  CFArrayRef v5 = (const __CFArray *)value;
  if (value == kCFNull) {
    goto LABEL_9;
  }
  if (value)
  {
    CFTypeID v6 = CFGetTypeID(value);
    if (v6 == CFArrayGetTypeID() && CFArrayGetCount(v5) >= 2)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v5, 1);
      CFTypeID v8 = CFGetTypeID(ValueAtIndex);
      if (v8 == CFDataGetTypeID())
      {
        CFArrayRef v5 = (const __CFArray *)[objc_alloc((Class)NSData) initWithData:ValueAtIndex];
        goto LABEL_10;
      }
    }
LABEL_9:
    CFArrayRef v5 = 0;
  }
LABEL_10:

  return v5;
}

- (id)dateFromRecord:(id)a3 key:(id)a4
{
  CFDictionaryRef v5 = (const __CFDictionary *)a3;
  id v6 = a4;
  if (!v5) {
    goto LABEL_5;
  }
  id v7 = sub_10003A5F8(v5, v6);
  id v8 = v7;
  if (!v7) {
    goto LABEL_6;
  }
  CFTypeID v9 = CFGetTypeID(v7);
  if (v9 == CFDateGetTypeID()) {
    id v8 = v8;
  }
  else {
LABEL_5:
  }
    id v8 = 0;
LABEL_6:

  return v8;
}

- (id)referenceDateForRecord:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    CFDictionaryRef v5 = [(SKGProcessor *)self dateFromRecord:v4 key:@"com_apple_mail_dateReceived"];
    if (v5) {
      goto LABEL_6;
    }
    uint64_t v6 = [(SKGProcessor *)self dateFromRecord:v4 key:@"kMDItemContentCreationDate"];
  }
  else
  {
    uint64_t v6 = +[NSDate now];
  }
  CFDictionaryRef v5 = (void *)v6;
LABEL_6:

  return v5;
}

- (id)copyDateStringFromRecordWithFormat:(id)a3 key:(id)a4 formatString:(id)a5
{
  id v8 = a5;
  if (a3)
  {
    CFTypeID v9 = [(SKGProcessor *)self dateFromRecord:a3 key:a4];
    if (v9)
    {
      id v10 = +[SKGSystemListener sharedProcessorListener];
      id v11 = [v10 currentTimezone];

      id v12 = objc_alloc_init((Class)NSDateFormatter);
      [v12 setDateFormat:v8];
      [v12 setTimeZone:v11];
      a3 = [v12 stringFromDate:v9];
    }
    else
    {
      a3 = 0;
    }
  }
  return a3;
}

- (id)copyFilePathFromRecord:(id)a3
{
  CFDictionaryRef v3 = (const __CFDictionary *)a3;
  CFDictionaryRef v4 = v3;
  if (!v3) {
    goto LABEL_7;
  }
  value = 0;
  if (!CFDictionaryGetValueIfPresent(v3, @"kMDItemPath", (const void **)&value)) {
    goto LABEL_7;
  }
  CFDictionaryRef v5 = value;
  if (value == kCFNull) {
    goto LABEL_7;
  }
  if (value)
  {
    CFTypeID v6 = CFGetTypeID(value);
    if (v6 == CFStringGetTypeID())
    {
      id v7 = [objc_alloc((Class)NSString) initWithString:v5];
      id v8 = +[NSCharacterSet whitespaceCharacterSet];
      CFDictionaryRef v5 = [v7 stringByTrimmingCharactersInSet:v8];

      goto LABEL_8;
    }
LABEL_7:
    CFDictionaryRef v5 = 0;
  }
LABEL_8:

  return v5;
}

+ (id)copyMailboxesFromRecord:(id)a3
{
  if (a3) {
    return sub_10003A788((const __CFDictionary *)a3, @"kMDItemMailboxes");
  }
  else {
    return 0;
  }
}

- (BOOL)recordIsRecent:(id)a3 toCalendarUnit:(unint64_t)a4 maxOffset:(unint64_t)a5 dateKeys:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v12 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (!v12) {
    goto LABEL_16;
  }
  id v13 = v12;
  unint64_t v26 = a5;
  id v14 = 0;
  uint64_t v15 = *(void *)v28;
  do
  {
    for (i = 0; i != v13; i = (char *)i + 1)
    {
      if (*(void *)v28 != v15) {
        objc_enumerationMutation(v11);
      }
      unsigned int v17 = [(SKGProcessor *)self dateFromRecord:v10 key:*(void *)(*((void *)&v27 + 1) + 8 * i)];
      if (!v14 || [v14 compare:v17] == (id)-1)
      {
        id v18 = v17;

        id v14 = v18;
      }
    }
    id v13 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
  }
  while (v13);
  if (v14)
  {
    id v19 = +[NSCalendar currentCalendar];
    BOOL v20 = +[NSDate now];
    uint64_t v21 = [v19 components:a4 fromDate:v14 toDate:v20 options:0];

    if (v21)
    {
      if (a4 == 4)
      {
        id v23 = [v21 year];
        unint64_t v22 = v26;
      }
      else
      {
        unint64_t v22 = v26;
        if (a4 == 16) {
          id v23 = [v21 day];
        }
        else {
          id v23 = [v21 month];
        }
      }
      BOOL v24 = (unint64_t)v23 <= v22;
    }
    else
    {
      BOOL v24 = 1;
    }
  }
  else
  {
LABEL_16:
    BOOL v24 = 1;
  }

  return v24;
}

- (BOOL)recordIsCurrent:(id)a3 toCalendarUnit:(unint64_t)a4 maxOffset:(unint64_t)a5 checkFuture:(BOOL)a6 dateKeys:(id)a7
{
  id v12 = a3;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = a7;
  id v13 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (!v13)
  {
    id v16 = 0;
    goto LABEL_21;
  }
  id v14 = v13;
  BOOL v38 = a6;
  unint64_t v39 = a4;
  unint64_t v37 = a5;
  uint64_t v15 = 0;
  id v16 = 0;
  uint64_t v17 = *(void *)v42;
  do
  {
    for (i = 0; i != v14; i = (char *)i + 1)
    {
      if (*(void *)v42 != v17) {
        objc_enumerationMutation(obj);
      }
      uint64_t v19 = *(void *)(*((void *)&v41 + 1) + 8 * i);
      BOOL v20 = -[SKGProcessor dateFromRecord:key:](self, "dateFromRecord:key:", v12, v19, v37);
      if ([&off_1000E7038 containsObject:v19])
      {
        id v21 = v20;

        uint64_t v15 = v21;
      }
      if (!v16 || [v16 compare:v20] == (id)-1)
      {
        id v22 = v20;

        id v16 = v22;
      }
    }
    id v14 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
  }
  while (v14);
  if (!v15)
  {
    unint64_t v26 = v39;
    if (v16)
    {
      long long v27 = +[NSCalendar currentCalendar];
      long long v28 = +[NSDate now];
      long long v29 = v27;
      unint64_t v30 = v39;
      unsigned __int8 v31 = v16;
      id v32 = v28;
LABEL_24:
      uint64_t v33 = [v29 components:v30 fromDate:v31 toDate:v32 options:0];

      if (v33)
      {
        if (v26 == 4)
        {
          id v35 = [v33 year];
          unint64_t v34 = v37;
        }
        else
        {
          unint64_t v34 = v37;
          if (v26 == 0x2000)
          {
            id v35 = [v33 weekOfYear];
          }
          else if (v26 == 16)
          {
            id v35 = [v33 day];
          }
          else
          {
            id v35 = [v33 month];
          }
        }
        BOOL v25 = (unint64_t)v35 <= v34;

        goto LABEL_34;
      }
LABEL_29:
      BOOL v25 = 0;
      goto LABEL_34;
    }
LABEL_21:
    uint64_t v15 = 0;
    goto LABEL_29;
  }
  double AbsoluteTime = CFDateGetAbsoluteTime((CFDateRef)v15);
  double Current = CFAbsoluteTimeGetCurrent();
  BOOL v25 = AbsoluteTime < Current && !v38;
  unint64_t v26 = v39;
  if (v38 && AbsoluteTime >= Current)
  {
    long long v27 = +[NSCalendar currentCalendar];
    long long v28 = +[NSDate now];
    long long v29 = v27;
    unint64_t v30 = v39;
    unsigned __int8 v31 = v28;
    id v32 = v15;
    goto LABEL_24;
  }
LABEL_34:

  return v25;
}

+ (BOOL)recordHasTextContent:(id)a3
{
  CFDictionaryRef v3 = (const __CFDictionary *)a3;
  CFDictionaryRef v4 = v3;
  if (v3
    && (value = 0, CFDictionaryGetValueIfPresent(v3, @"kMDItemTextContent", (const void **)&value))
    && value != kCFNull
    && value)
  {
    CFTypeID v5 = CFGetTypeID(value);
    BOOL v6 = v5 == CFStringGetTypeID();
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

+ (BOOL)recordHasHTMLContent:(id)a3
{
  CFDictionaryRef v3 = (const __CFDictionary *)a3;
  CFDictionaryRef v4 = v3;
  if (v3
    && (value = 0, CFDictionaryGetValueIfPresent(v3, @"kMDItemHTMLContentData", (const void **)&value))
    && value != kCFNull
    && value)
  {
    CFTypeID v5 = CFGetTypeID(value);
    BOOL v6 = v5 == CFDataGetTypeID();
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)recordContainsValue:(id)a3 key:(id)a4
{
  return a3 && sub_10003A5F8((CFDictionaryRef)a3, a4) != 0;
}

+ (unint64_t)getHTMLContentByteSizeForRecord:(id)a3
{
  CFDictionaryRef v3 = (const __CFDictionary *)a3;
  CFDictionaryRef v4 = v3;
  if (!v3) {
    goto LABEL_7;
  }
  value = 0;
  if (!CFDictionaryGetValueIfPresent(v3, @"kMDItemHTMLContentData", (const void **)&value)) {
    goto LABEL_7;
  }
  CFDataRef Length = (const __CFData *)value;
  if (value == kCFNull) {
    goto LABEL_7;
  }
  if (value)
  {
    CFTypeID v6 = CFGetTypeID(value);
    if (v6 == CFDataGetTypeID())
    {
      CFDataRef Length = (const __CFData *)CFDataGetLength(Length);
      goto LABEL_8;
    }
LABEL_7:
    CFDataRef Length = 0;
  }
LABEL_8:

  return (unint64_t)Length;
}

+ (unint64_t)getTextContentByteSizeForRecord:(id)a3
{
  CFDictionaryRef v3 = (const __CFDictionary *)a3;
  CFDictionaryRef v4 = v3;
  if (!v3) {
    goto LABEL_7;
  }
  value = 0;
  if (!CFDictionaryGetValueIfPresent(v3, @"kMDItemTextContent", (const void **)&value)) {
    goto LABEL_7;
  }
  id v5 = value;
  if (value == kCFNull) {
    goto LABEL_7;
  }
  if (value)
  {
    CFTypeID v6 = CFGetTypeID(value);
    if (v6 == CFStringGetTypeID())
    {
      id v5 = [v5 lengthOfBytesUsingEncoding:4];
      goto LABEL_8;
    }
LABEL_7:
    id v5 = 0;
  }
LABEL_8:

  return (unint64_t)v5;
}

+ (unint64_t)textContentLengthForRecord:(id)a3
{
  CFDictionaryRef v3 = (const __CFDictionary *)a3;
  CFDictionaryRef v4 = v3;
  if (v3
    && (value = 0, CFDictionaryGetValueIfPresent(v3, @"_kMDItemTextContentLength", (const void **)&value))
    && (id v5 = value, value != kCFNull)
    && value
    && (CFTypeID v6 = CFGetTypeID(value), v6 == CFNumberGetTypeID()))
  {
    unint64_t v7 = [v5 unsignedIntValue];
  }
  else
  {
    unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (void).cxx_destruct
{
}

- (BOOL)loadPeopleExtractor
{
  id v2 = sub_10006A7C0();
  return 1;
}

- (id)scoreFromDate:(id)a3
{
  if (a3)
  {
    CFDictionaryRef v4 = +[NSNumber numberWithDouble:CFDateGetAbsoluteTime((CFDateRef)a3)];
  }
  else
  {
    CFDictionaryRef v4 = &off_1000E75E8;
  }
  return v4;
}

- (id)createdScoreFromRecord:(id)a3
{
  CFDictionaryRef v4 = (const __CFDictionary *)a3;
  CFDictionaryRef v5 = v4;
  if (v4
    && ((CFDateRef v6 = sub_10003A658(v4, @"com_apple_mail_dateReceived")) != 0
     || (CFDateRef v6 = sub_10003A658(v5, @"com_apple_mail_dateSent")) != 0
     || (CFDateRef v6 = sub_10003A658(v5, @"kMDItemStartDate")) != 0
     || (CFDateRef v6 = sub_10003A658(v5, @"kMDItemContentCreationDate")) != 0))
  {
    unint64_t v7 = [(SKGProcessor *)self scoreFromDate:v6];
  }
  else
  {
    unint64_t v7 = &off_1000E75E8;
  }

  return v7;
}

- (id)viewedScoreFromRecord:(id)a3
{
  CFDictionaryRef v4 = (const __CFDictionary *)a3;
  CFDictionaryRef v5 = v4;
  if (v4
    && ((CFDateRef v6 = sub_10003A658(v4, @"com_apple_mail_viewedDate")) != 0
     || (CFDateRef v6 = sub_10003A658(v5, @"kMDItemLastUsedDate")) != 0))
  {
    unint64_t v7 = [(SKGProcessor *)self scoreFromDate:v6];
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (id)contactFromRecord:(id)a3
{
  CFDictionaryRef v4 = (const __CFDictionary *)a3;
  CFDateRef v6 = (__CFString *)sub_10003A6EC(v4, @"_kMDItemExternalID");
  unint64_t v7 = (__CFString *)sub_10003A6EC(v4, @"kMDItemDisplayName");
  id v8 = sub_10003A788(v4, @"kMDItemAlternateNames");
  CFTypeID v9 = sub_10003A788(v4, @"kMDItemEmailAddresses");
  id v10 = sub_10003A788(v4, @"kMDItemPhoneNumbers");
  id v11 = 0;
  if (v6 && v7 && v8)
  {
    if ((unint64_t)[(__CFArray *)v8 count] < 2
      || ![(__CFArray *)v9 count] && ![(__CFArray *)v10 count])
    {
      id v11 = 0;
      goto LABEL_16;
    }
    id v11 = [(SKGProcessor *)self personWithName:v7 alternateName:0 contactIdentifier:v6 personIdentifier:0 emails:v9 phones:v10 addresses:0];
    id v12 = [v11 nameComponents];
    id v13 = [v12 firstObject];

    uint64_t v14 = [v13 givenName];
    if (v14)
    {
      unint64_t v26 = (void *)v14;
      uint64_t v15 = [v13 givenName];
      uint64_t v16 = [(__CFArray *)v8 firstObject];
      BOOL v25 = (void *)v15;
      uint64_t v17 = (void *)v15;
      id v18 = (void *)v16;
      if ([v17 isEqualToString:v16]
        && ([v13 familyName], (uint64_t v19 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        id v23 = (void *)v19;
        BOOL v24 = [v13 familyName];
        id v21 = [(__CFArray *)v8 lastObject];
        unsigned __int8 v22 = [v24 isEqualToString:v21];

        if (v22) {
          goto LABEL_15;
        }
      }
      else
      {
      }
    }

    id v13 = v11;
    id v11 = 0;
LABEL_15:
  }
LABEL_16:

  return v11;
}

- (id)authorFromMessageRecord:(id)a3
{
  CFDictionaryRef v4 = (const __CFDictionary *)a3;
  CFDateRef v6 = (__CFString *)sub_10003A6EC(v4, @"com_apple_mobilesms_suggested_contact_name");
  unint64_t v7 = sub_10003A788(v4, @"kMDItemAuthors");
  id v8 = sub_10003A788(v4, @"kMDItemAuthorEmailAddresses");
  CFTypeID v9 = sub_10003A788(v4, @"kMDItemAuthorPhoneNumbers");
  id v10 = sub_10003A788(v4, @"kMDItemAuthorAddresses");
  id v11 = sub_10003A788(v4, @"kMDItemAuthorContactIdentifiers");
  id v12 = v11;
  if (!v6 && !v7 && !v8 && !v10 && !v11)
  {
    id v13 = 0;
    goto LABEL_13;
  }
  id v14 = [(__CFArray *)v7 count];
  if (v14)
  {
    id v18 = [(__CFArray *)v7 firstObject];
  }
  else
  {
    id v18 = 0;
  }
  if ([(__CFArray *)v12 count])
  {
    [(__CFArray *)v12 firstObject];
    uint64_t v15 = v17 = v5;
    id v13 = [(SKGProcessor *)self personWithName:v18 alternateName:v6 contactIdentifier:v15 personIdentifier:0 emails:v8 phones:v9 addresses:v10];

    CFDictionaryRef v5 = v17;
    if (!v14) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  id v13 = [(SKGProcessor *)self personWithName:v18 alternateName:v6 contactIdentifier:0 personIdentifier:0 emails:v8 phones:v9 addresses:v10];
  if (v14) {
LABEL_12:
  }

LABEL_13:

  return v13;
}

- (id)peopleFromPhotoRecord:(id)a3
{
  CFDictionaryRef v4 = (const __CFDictionary *)a3;
  CFDateRef v6 = sub_10003A788(v4, @"kMDItemPhotosPeopleNames");
  unint64_t v7 = sub_10003A788(v4, @"kMDItemPhotosPeopleEmailAddresses");
  id v8 = sub_10003A788(v4, @"kMDItemPhotosPeoplePhoneNumbers");
  CFTypeID v9 = sub_10003A788(v4, @"kMDItemPhotosPeopleContactIdentifiers");
  id v10 = sub_10003A788(v4, @"kMDItemPhotosPeoplePersonIdentifiers");
  CFArrayRef v11 = v10;
  if (v6 || v7 || v8 || v9 || v10)
  {
    uint64_t v16 = 0;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x3032000000;
    uint64_t v19 = sub_1000126D4;
    BOOL v20 = sub_100012588;
    id v21 = 0;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10006B3DC;
    v15[3] = &unk_1000DBAD8;
    void v15[4] = self;
    v15[5] = &v16;
    sub_10006B018(v6, v7, v8, 0, v9, v11, v15);
    id v12 = (id)v17[5];
    _Block_object_dispose(&v16, 8);
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)authorsFromPhoneRecord:(id)a3
{
  CFDictionaryRef v4 = (const __CFDictionary *)a3;
  CFDateRef v6 = sub_10003A788(v4, @"kMDItemAuthors");
  unint64_t v7 = sub_10003A788(v4, @"kMDItemPhoneNumbers");
  id v8 = sub_10003A788(v4, @"kMDItemAuthorContactIdentifiers");
  id v9 = 0;
  if (v6 && v7)
  {
    id v10 = [(__CFArray *)v6 count];
    if (v10 == [(__CFArray *)v7 count])
    {
      uint64_t v14 = 0;
      uint64_t v15 = &v14;
      uint64_t v16 = 0x3032000000;
      uint64_t v17 = sub_1000126D4;
      uint64_t v18 = sub_100012588;
      id v19 = 0;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10006B78C;
      v13[3] = &unk_1000DBAD8;
      v13[4] = self;
      v13[5] = &v14;
      sub_10006B018(v6, v7, 0, 0, v8, 0, v13);
      id v9 = (id)v15[5];
      _Block_object_dispose(&v14, 8);
    }
    else
    {
      id v9 = 0;
    }
  }

  return v9;
}

- (id)recipientsFromPhoneRecord:(id)a3
{
  CFDictionaryRef v4 = (const __CFDictionary *)a3;
  CFDateRef v6 = sub_10003A788(v4, @"kMDItemRecipients");
  unint64_t v7 = sub_10003A788(v4, @"kMDItemPhoneNumbers");
  id v8 = sub_10003A788(v4, @"kMDItemRecipientContactIdentifiers");
  id v9 = 0;
  if (v6 && v7)
  {
    id v10 = [(__CFArray *)v6 count];
    if (v10 == [(__CFArray *)v7 count])
    {
      uint64_t v14 = 0;
      uint64_t v15 = &v14;
      uint64_t v16 = 0x3032000000;
      uint64_t v17 = sub_1000126D4;
      uint64_t v18 = sub_100012588;
      id v19 = 0;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10006BB70;
      v13[3] = &unk_1000DBAD8;
      v13[4] = self;
      v13[5] = &v14;
      sub_10006B018(v6, v7, 0, 0, v8, 0, v13);
      id v9 = (id)v15[5];
      _Block_object_dispose(&v14, 8);
    }
    else
    {
      id v9 = 0;
    }
  }

  return v9;
}

- (id)peopleFromNotesRecord:(id)a3
{
  CFDictionaryRef v4 = (const __CFDictionary *)a3;
  CFDateRef v6 = sub_10003A788(v4, @"kMDItemAuthors");
  unint64_t v7 = sub_10003A788(v4, @"kMDItemEmailAddresses");
  id v8 = sub_10003A788(v4, @"kMDItemPhoneNumbers");
  CFArrayRef v9 = v8;
  if (v6 || v7 || v8)
  {
    uint64_t v14 = 0;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x3032000000;
    uint64_t v17 = sub_1000126D4;
    uint64_t v18 = sub_100012588;
    id v19 = 0;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10006BF38;
    v13[3] = &unk_1000DBAD8;
    v13[4] = self;
    v13[5] = &v14;
    sub_10006B018(v6, v7, v9, 0, 0, 0, v13);
    id v10 = (id)v15[5];
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)accountOwnerFromRecord:(id)a3
{
  CFDictionaryRef v4 = (const __CFDictionary *)a3;
  CFDateRef v6 = sub_10003A788(v4, @"kMDItemAccountHandles");
  if (v6)
  {
    unint64_t v7 = [(SKGProcessor *)self personWithName:0 alternateName:0 contactIdentifier:0 personIdentifier:0 emails:v6 phones:0 addresses:0];
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (id)ownerFromRecord:(id)a3
{
  CFDictionaryRef v4 = (const __CFDictionary *)a3;
  CFDateRef v6 = (__CFString *)sub_10003A6EC(v4, @"kMDItemOwnerName");
  if (v6)
  {
    unint64_t v7 = [(SKGProcessor *)self personWithName:v6 alternateName:0 contactIdentifier:0 personIdentifier:0 emails:0 phones:0 addresses:0];
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (id)lastEditorFromRecord:(id)a3
{
  CFDictionaryRef v4 = (const __CFDictionary *)a3;
  CFDateRef v6 = (__CFString *)sub_10003A6EC(v4, @"kMDItemLastEditorName");
  if (v6)
  {
    unint64_t v7 = [(SKGProcessor *)self personWithName:v6 alternateName:0 contactIdentifier:0 personIdentifier:0 emails:0 phones:0 addresses:0];
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (id)peopleForAttributeKey:(id)a3 fromRecord:(id)a4
{
  id v5 = a3;
  CFDictionaryRef v6 = (const __CFDictionary *)a4;
  unsigned int v8 = [v5 isEqualToString:@"People"];
  CFArrayRef v9 = @"s";
  if (v8) {
    CFArrayRef v9 = &stru_1000DD7E8;
  }
  id v10 = v9;
  CFArrayRef v11 = sub_10003A788(v6, +[NSString stringWithFormat:@"kMDItem%@%@", v5, v10]);
  id v12 = sub_10003A788(v6, +[NSString stringWithFormat:@"kMDItem%@EmailAddresses", v5]);
  id v13 = sub_10003A788(v6, +[NSString stringWithFormat:@"kMDItem%@PhoneNumbers", v5]);
  uint64_t v33 = sub_10003A788(v6, +[NSString stringWithFormat:@"kMDItem%@Addresses", v5]);
  uint64_t v14 = sub_10003A788(v6, +[NSString stringWithFormat:@"kMDItem%@ContactIdentifiers", v5]);
  id v32 = v10;
  if ([v5 isEqualToString:@"Recipient"])
  {
    unint64_t v30 = v7;
    uint64_t v15 = sub_10003A788(v6, +[NSString stringWithFormat:@"kMDItemPrimary%@EmailAddresses", v5]);
    uint64_t v16 = v15;
    if (v15)
    {
      if (!v11 || (id v17 = [(__CFArray *)v15 count], v17 == [(__CFArray *)v11 count]))
      {
        uint64_t v18 = v16;

        id v12 = v18;
      }
    }
    id v19 = sub_10003A788(v6, +[NSString stringWithFormat:@"kMDItemPrimary%@PhoneNumbers", v5]);
    BOOL v20 = v19;
    if (v19)
    {
      if (!v11 || (id v21 = [(__CFArray *)v19 count], v21 == [(__CFArray *)v11 count]))
      {
        unsigned __int8 v22 = v20;

        id v13 = v22;
      }
    }
    id v23 = sub_10003A788(v6, +[NSString stringWithFormat:@"kMDItemPrimary%@Addresses", v5]);
    BOOL v24 = v23;
    if (v23 && (!v11 || (id v25 = [(__CFArray *)v23 count], v25 == [(__CFArray *)v11 count])))
    {
      CFArrayRef v26 = v24;
    }
    else
    {
      CFArrayRef v26 = v33;
    }

    unint64_t v7 = v30;
    if (v11) {
      goto LABEL_24;
    }
  }
  else
  {
    CFArrayRef v26 = v33;
    if (v11) {
      goto LABEL_24;
    }
  }
  if (!v12 && !v13 && !v14)
  {
    id v27 = 0;
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v35 = 0;
  id v36 = &v35;
  uint64_t v37 = 0x3032000000;
  BOOL v38 = sub_1000126D4;
  unint64_t v39 = sub_100012588;
  id v40 = 0;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_10006C700;
  v34[3] = &unk_1000DBAD8;
  v34[4] = self;
  v34[5] = &v35;
  sub_10006B018(v11, v12, v13, v26, v14, 0, v34);
  id v27 = (id)v36[5];
  _Block_object_dispose(&v35, 8);

LABEL_25:

  return v27;
}

- (id)peopleForSharedAttributeKey:(id)a3 fromRecord:(id)a4
{
  id v6 = a3;
  CFDictionaryRef v7 = (const __CFDictionary *)a4;
  CFArrayRef v9 = sub_10003A788(v7, +[NSString stringWithFormat:@"kMDItemUserShared%@", v6]);
  id v10 = sub_10003A788(v7, +[NSString stringWithFormat:@"kMDItemUserShared%@Handle", v6]);
  if ((unint64_t)v9 | (unint64_t)v10)
  {
    uint64_t v15 = 0;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x3032000000;
    uint64_t v18 = sub_1000126D4;
    id v19 = sub_100012588;
    id v20 = 0;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10006CAE0;
    v14[3] = &unk_1000DBAD8;
    v14[4] = self;
    v14[5] = &v15;
    sub_10006B018(v9, v10, 0, 0, 0, 0, v14);
    id v11 = (id)v16[5];
    _Block_object_dispose(&v15, 8);
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)personWithName:(id)a3 alternateName:(id)a4 contactIdentifier:(id)a5 personIdentifier:(id)a6 emails:(id)a7 phones:(id)a8 addresses:(id)a9
{
  id v46 = a3;
  id v14 = a4;
  id v44 = a5;
  id v45 = a6;
  id v15 = a7;
  id v16 = a8;
  id v17 = a9;
  uint64_t v84 = 0;
  id v85 = &v84;
  uint64_t v86 = 0x3032000000;
  v87 = sub_1000126D4;
  v88 = sub_100012588;
  id v89 = 0;
  uint64_t v78 = 0;
  long long v79 = &v78;
  uint64_t v80 = 0x3032000000;
  long long v81 = sub_1000126D4;
  id v82 = sub_100012588;
  id v83 = 0;
  uint64_t v72 = 0;
  id v73 = &v72;
  uint64_t v74 = 0x3032000000;
  long long v75 = sub_1000126D4;
  long long v76 = sub_100012588;
  id v77 = 0;
  uint64_t v66 = 0;
  id v67 = &v66;
  uint64_t v68 = 0x3032000000;
  id v69 = sub_1000126D4;
  id v70 = sub_100012588;
  id v71 = 0;
  uint64_t v60 = 0;
  v61 = &v60;
  uint64_t v62 = 0x3032000000;
  v63 = sub_1000126D4;
  long long v64 = sub_100012588;
  id v65 = 0;
  v59[0] = _NSConcreteStackBlock;
  v59[1] = 3221225472;
  v59[2] = sub_10006D354;
  v59[3] = &unk_1000DBB00;
  v59[4] = &v84;
  v59[5] = &v78;
  v59[6] = &v72;
  v59[7] = &v66;
  v59[8] = &v60;
  uint64_t v18 = objc_retainBlock(v59);
  sub_10006D53C(v46, v18);
  sub_10006D53C(v14, v18);
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v19 = v15;
  id v20 = [v19 countByEnumeratingWithState:&v55 objects:v92 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v56;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v56 != v21) {
          objc_enumerationMutation(v19);
        }
        sub_10006D53C(*(void **)(*((void *)&v55 + 1) + 8 * i), v18);
      }
      id v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v55, v92, 16, context);
    }
    while (v20);
  }

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v23 = v16;
  id v24 = [v23 countByEnumeratingWithState:&v51 objects:v91 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v52;
    do
    {
      for (j = 0; j != v24; j = (char *)j + 1)
      {
        if (*(void *)v52 != v25) {
          objc_enumerationMutation(v23);
        }
        sub_10006D53C(*(void **)(*((void *)&v51 + 1) + 8 * (void)j), v18);
      }
      id v24 = [v23 countByEnumeratingWithState:&v51 objects:v91 count:16];
    }
    while (v24);
  }

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v27 = v17;
  id v28 = [v27 countByEnumeratingWithState:&v47 objects:v90 count:16];
  if (v28)
  {
    uint64_t v29 = *(void *)v48;
    do
    {
      for (k = 0; k != v28; k = (char *)k + 1)
      {
        if (*(void *)v48 != v29) {
          objc_enumerationMutation(v27);
        }
        sub_10006D53C(*(void **)(*((void *)&v47 + 1) + 8 * (void)k), v18);
      }
      id v28 = [v27 countByEnumeratingWithState:&v47 objects:v90 count:16];
    }
    while (v28);
  }

  if (v79[5] && v85[5] && v73[5] || objc_msgSend((id)v67[5], "count", context) || objc_msgSend((id)v61[5], "count"))
  {
    unsigned __int8 v31 = [SKGPersonComponents alloc];
    id v32 = [(SKGPersonComponents *)v31 initWithEmailAddresses:v67[5] phoneNumbers:v61[5]];
    if ([(id)v79[5] count])
    {
      id v33 = [(id)v79[5] count];
      if (v33 == [(id)v73[5] count])
      {
        id v34 = [(id)v79[5] count];
        if (v34 == [(id)v85[5] count])
        {
          for (unint64_t m = 0; m < (unint64_t)objc_msgSend((id)v79[5], "count", context); ++m)
          {
            id v36 = [(id)v79[5] objectAtIndexedSubscript:m];
            uint64_t v37 = [(id)v73[5] objectAtIndexedSubscript:m];
            uint64_t v38 = [(id)v85[5] objectAtIndexedSubscript:m];
            unint64_t v39 = (void *)v38;
            if (v36) {
              BOOL v40 = v38 == 0;
            }
            else {
              BOOL v40 = 1;
            }
            if (!v40 && v37 != 0) {
              [(SKGPersonComponents *)v32 addName:v36 nameComponents:v38 displayName:v37];
            }
          }
        }
      }
    }
    -[SKGPersonComponents setContactIdentifier:](v32, "setContactIdentifier:", v44, context);
    [(SKGPersonComponents *)v32 setPhotosPersonIdentifier:v45];
  }
  else
  {
    id v32 = 0;
  }

  _Block_object_dispose(&v60, 8);
  _Block_object_dispose(&v66, 8);

  _Block_object_dispose(&v72, 8);
  _Block_object_dispose(&v78, 8);

  _Block_object_dispose(&v84, 8);

  return v32;
}

- (BOOL)generatePeopleForRecord:(id)a3 processedItem:(id)a4 processedItemBlock:(id)a5 cancelBlock:(id)a6
{
  CFDictionaryRef v10 = (const __CFDictionary *)a3;
  id v11 = a4;
  id v12 = (uint64_t (**)(id, id))a5;
  id v13 = a6;
  if (v11)
  {
    id v15 = [v11 bundleIdentifier];
    unsigned int v16 = [v15 isEqualToString:@"com.apple.MobileAddressBook"];

    if (v16)
    {
      uint64_t v17 = [(SKGProcessor *)self contactFromRecord:v10];
      uint64_t v18 = (void *)v17;
      if (v17)
      {
        uint64_t v124 = v17;
        id v19 = +[NSArray arrayWithObjects:&v124 count:1];
        [v11 addParticipants:v19];
      }
      id v20 = [v11 participants];

      if (!v20) {
        goto LABEL_43;
      }
      uint64_t v21 = [(SKGProcessor *)self viewedScoreFromRecord:v10];
      if (!v21) {
        goto LABEL_15;
      }
LABEL_14:
      [v11 addInteraction:@"viewedDate" score:v21];
LABEL_15:

LABEL_43:
      goto LABEL_44;
    }
    id v23 = [v11 bundleIdentifier];
    unsigned int v24 = [v23 isEqualToString:@"com.apple.mobilenotes"];

    if (v24)
    {
      uint64_t v25 = [(SKGProcessor *)self peopleFromNotesRecord:v10];
      goto LABEL_11;
    }
    uint64_t v29 = [v11 bundleIdentifier];
    unsigned int v30 = [v29 isEqualToString:@"com.apple.mobilephone"];

    if (v30)
    {
      uint64_t v18 = [(SKGProcessor *)self authorsFromPhoneRecord:v10];
      if ([v18 count])
      {
        [v11 addAuthors:v18];
      }
      else
      {
        id v45 = [(SKGProcessor *)self recipientsFromPhoneRecord:v10];
        if ([v45 count]) {
          [v11 addRecipients:v45];
        }
      }
      id v46 = [v11 authors];
      if ([v46 count])
      {
      }
      else
      {
        long long v47 = [v11 recipients];
        id v48 = [v47 count];

        if (!v48) {
          goto LABEL_43;
        }
      }
      id v36 = [(SKGProcessor *)self createdScoreFromRecord:v10];
      [v11 addInteraction:@"creationDate" score:v36];
      long long v49 = [(SKGProcessor *)self viewedScoreFromRecord:v10];
      long long v50 = v49;
      if (v49 && ([v49 isEqualToNumber:v36] & 1) == 0) {
        [v11 addInteraction:@"viewedDate" score:v50];
      }

LABEL_42:
      goto LABEL_43;
    }
    unsigned __int8 v31 = [v11 bundleIdentifier];
    unsigned int v32 = [v31 isEqualToString:@"com.apple.MobileSMS"];

    if (v32)
    {
      uint64_t v33 = [(SKGProcessor *)self accountOwnerFromRecord:v10];
      uint64_t v18 = (void *)v33;
      if (v33)
      {
        uint64_t v123 = v33;
        id v34 = +[NSArray arrayWithObjects:&v123 count:1];
        [v11 addOwners:v34];
      }
      uint64_t v35 = [(SKGProcessor *)self authorFromMessageRecord:v10];
      id v36 = (void *)v35;
      if (v35)
      {
        uint64_t v122 = v35;
        uint64_t v37 = +[NSArray arrayWithObjects:&v122 count:1];
        [v11 addAuthors:v37];
      }
      uint64_t v38 = [(SKGProcessor *)self peopleForAttributeKey:@"Recipient" fromRecord:v10];
      [v11 addRecipients:v38];

      unint64_t v39 = [v11 owners];
      if (v39)
      {
      }
      else
      {
        uint64_t v72 = [v11 authors];
        if (!v72) {
          goto LABEL_42;
        }
        id v73 = (void *)v72;
        uint64_t v74 = [v11 recipients];

        if (!v74) {
          goto LABEL_42;
        }
      }
      BOOL v40 = [(SKGProcessor *)self createdScoreFromRecord:v10];
      [v11 addInteraction:@"creationDate" score:v40];
      long long v41 = [(SKGProcessor *)self viewedScoreFromRecord:v10];
      long long v42 = v41;
      if (v41 && ([v41 isEqualToNumber:v40] & 1) == 0) {
        [v11 addInteraction:@"viewedDate" score:v42];
      }

      goto LABEL_42;
    }
    long long v43 = [v11 bundleIdentifier];
    unsigned int v44 = [v43 isEqualToString:@"com.apple.mobileslideshow"];

    if (v44)
    {
      uint64_t v25 = [(SKGProcessor *)self peopleFromPhotoRecord:v10];
LABEL_11:
      CFArrayRef v26 = (void *)v25;
      [v11 addParticipants:v25];

      id v27 = [v11 participants];

      if (!v27)
      {
LABEL_44:
        char v22 = v12[2](v12, v11);
        goto LABEL_45;
      }
      uint64_t v18 = [(SKGProcessor *)self createdScoreFromRecord:v10];
      [v11 addInteraction:@"creationDate" score:v18];
      id v28 = [(SKGProcessor *)self viewedScoreFromRecord:v10];
      uint64_t v21 = v28;
      if (!v28 || ([v28 isEqualToNumber:v18] & 1) != 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
    uint64_t v52 = [(SKGProcessor *)self peopleForSharedAttributeKey:@"ReceivedSender" fromRecord:v10];
    long long v53 = [(SKGProcessor *)self peopleForSharedAttributeKey:@"ReceivedRecipient" fromRecord:v10];
    uint64_t v54 = [(SKGProcessor *)self peopleForSharedAttributeKey:@"SentSender" fromRecord:v10];
    uint64_t v113 = [(SKGProcessor *)self peopleForSharedAttributeKey:@"SentRecipient" fromRecord:v10];
    context = v14;
    v106 = (void *)v54;
    if (v52)
    {
      id v55 = [(id)v52 count];
      if (v55 == [v53 count])
      {
        id v108 = sub_10003A788(v10, @"kMDItemUserSharedReceivedDate");
        id v107 = sub_10003A788(v10, @"kMDItemUserSharedReceivedTransport");
        id v89 = (char *)[(__CFArray *)v108 count];
        if (-[__CFArray count](v107, "count") == v89 && v89 == [(id)v52 count] && v89)
        {
          long long v56 = 0;
          uint64_t v101 = v53;
          v103 = (void *)v52;
          do
          {
            id v110 = [(id)v52 objectAtIndexedSubscript:v56];
            id v93 = [v53 objectAtIndexedSubscript:v56];
            id v97 = [(__CFArray *)v107 objectAtIndexedSubscript:v56];
            uint64_t v99 = [(__CFArray *)v108 objectAtIndexedSubscript:v56];
            v95 = [(SKGProcessor *)self scoreFromDate:v99];
            long long v57 = [v11 referenceIdentifier];
            long long v58 = [v11 bundleIdentifier];
            char v59 = [v11 protectionClass];
            uint64_t v60 = [(SKGProcessor *)self itemFromRecord:v10 referenceIdentifier:v57 bundleIdentifier:v58 protectionClass:v59];

            uint64_t v121 = v110;
            v61 = +[NSArray arrayWithObjects:&v121 count:1];
            [v60 addAuthors:v61];

            id v120 = v93;
            uint64_t v62 = +[NSArray arrayWithObjects:&v120 count:1];
            [v60 addRecipients:v62];

            [v60 addInteraction:v97 score:v95];
            char v91 = v12[2](v12, v60);

            if ((v91 & 1) == 0) {
              goto LABEL_84;
            }
            ++v56;
            long long v53 = v101;
            uint64_t v52 = (uint64_t)v103;
          }
          while (v89 != v56);
        }

        id v14 = context;
        uint64_t v54 = (uint64_t)v106;
      }
    }
    if (v54)
    {
      id v63 = [(id)v54 count];
      BOOL v64 = v63 == [v113 count];
      id v14 = context;
      if (!v64) {
        goto LABEL_66;
      }
      uint64_t v101 = v53;
      v103 = (void *)v52;
      id v108 = sub_10003A788(v10, @"kMDItemUserSharedSentDate");
      id v107 = sub_10003A788(v10, @"kMDItemUserSharedSentTransport");
      id v90 = [(__CFArray *)v108 count];
      if (-[__CFArray count](v107, "count") == v90 && v90 == [v106 count] && v90)
      {
        uint64_t v65 = 0;
        while (1)
        {
          v111 = [v106 objectAtIndexedSubscript:v65];
          id v94 = [v113 objectAtIndexedSubscript:v65];
          v98 = [(__CFArray *)v107 objectAtIndexedSubscript:v65];
          v100 = [(__CFArray *)v108 objectAtIndexedSubscript:v65];
          v96 = [(SKGProcessor *)self scoreFromDate:v100];
          uint64_t v66 = [v11 referenceIdentifier];
          id v67 = [v11 bundleIdentifier];
          uint64_t v68 = [v11 protectionClass];
          id v69 = [(SKGProcessor *)self itemFromRecord:v10 referenceIdentifier:v66 bundleIdentifier:v67 protectionClass:v68];

          id v119 = v111;
          id v70 = +[NSArray arrayWithObjects:&v119 count:1];
          [v69 addAuthors:v70];

          v118 = v94;
          id v71 = +[NSArray arrayWithObjects:&v118 count:1];
          [v69 addRecipients:v71];

          [v69 addInteraction:v98 score:v96];
          char v92 = v12[2](v12, v69);

          if ((v92 & 1) == 0) {
            break;
          }
          if (v90 == (id)++v65) {
            goto LABEL_64;
          }
        }
LABEL_84:

        char v22 = 0;
        goto LABEL_45;
      }
LABEL_64:

      uint64_t v52 = (uint64_t)v103;
      id v14 = context;
      long long v53 = v101;
      uint64_t v54 = (uint64_t)v106;
    }
    if (v52 | v54)
    {
LABEL_66:

      goto LABEL_44;
    }
    char v102 = v53;
    v112 = [(SKGProcessor *)self peopleForAttributeKey:@"Author" fromRecord:v10];
    objc_msgSend(v11, "addAuthors:");
    v109 = [(SKGProcessor *)self peopleForAttributeKey:@"Recipient" fromRecord:v10];
    objc_msgSend(v11, "addRecipients:");
    uint64_t v75 = [(SKGProcessor *)self accountOwnerFromRecord:v10];
    long long v76 = (void *)v75;
    if (v75)
    {
      uint64_t v117 = v75;
      id v77 = +[NSArray arrayWithObjects:&v117 count:1];
      [v11 addOwners:v77];

      id v14 = context;
    }
    uint64_t v104 = (void *)v52;
    uint64_t v78 = [(SKGProcessor *)self ownerFromRecord:v10];
    long long v79 = (void *)v78;
    if (v78)
    {
      uint64_t v116 = v78;
      uint64_t v80 = +[NSArray arrayWithObjects:&v116 count:1];
      [v11 addParticipants:v80];

      id v14 = context;
    }
    uint64_t v81 = [(SKGProcessor *)self lastEditorFromRecord:v10];
    id v82 = (void *)v81;
    if (v79 && v81)
    {
      v115[0] = v79;
      v115[1] = v81;
      id v83 = v115;
      uint64_t v84 = 2;
    }
    else
    {
      if (!v81) {
        goto LABEL_80;
      }
      uint64_t v114 = v81;
      id v83 = &v114;
      uint64_t v84 = 1;
    }
    id v85 = +[NSArray arrayWithObjects:v83 count:v84];
    [v11 addParticipants:v85];

LABEL_80:
    uint64_t v86 = [(SKGProcessor *)self createdScoreFromRecord:v10];
    [v11 addInteraction:@"creationDate" score:v86];
    v87 = [(SKGProcessor *)self viewedScoreFromRecord:v10];
    v88 = v87;
    if (v87 && ([v87 isEqualToNumber:v86] & 1) == 0) {
      [v11 addInteraction:@"viewedDate" score:v88];
    }

    goto LABEL_44;
  }
  char v22 = 1;
LABEL_45:

  return v22;
}

- (BOOL)generateMegadomePeopleUsingBlock:(id)a3 cancelBlock:(id)a4
{
  id v5 = a3;
  id v6 = (uint64_t (**)(id, const __CFString *))a4;
  uint64_t v23 = 0;
  unsigned int v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 1;
  unsigned int v8 = +[GDViewService defaultService];
  id v22 = 0;
  CFArrayRef v9 = [v8 visualIdentifierViewWithError:&v22];
  id v10 = v22;
  id v11 = v24;
  if (v6)
  {
    if (!*((unsigned char *)v24 + 24))
    {
      *((unsigned char *)v24 + 24) = 0;
      goto LABEL_9;
    }
    int v12 = v6[2](v6, @"processPeopleFromRecord:megadome") ^ 1;
    id v11 = v24;
  }
  else
  {
    int v12 = *((unsigned __int8 *)v24 + 24) != 0;
  }
  *((unsigned char *)v11 + 24) = v12;
  if (!v10 && v12)
  {
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x2020000000;
    char v21 = 0;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10006EB94;
    v15[3] = &unk_1000DBB28;
    id v16 = v5;
    uint64_t v18 = v20;
    id v19 = &v23;
    uint64_t v17 = v6;
    [v9 enumeratePeopleWithBlock:v15];

    _Block_object_dispose(v20, 8);
  }
LABEL_9:

  char v13 = *((unsigned char *)v24 + 24);
  _Block_object_dispose(&v23, 8);

  return v13;
}

- (BOOL)canProcessEvent
{
  id v2 = +[SKGSystemListener sharedProcessorListener];
  unsigned __int8 v3 = [v2 hasDiskCapacity];

  return v3;
}

- (BOOL)canProcessEventForRecord:(id)a3
{
  id v4 = a3;
  id v5 = [(SKGProcessor *)self copyFileProviderIDFromRecord:v4];

  if (v5)
  {
    BOOL v6 = 0;
  }
  else if (+[SKGProcessor recordHasTextContent:v4])
  {
    id v7 = [(SKGProcessor *)self copyContentURLFromRecord:v4];
    if (v7
      && [(SKGProcessor *)self recordContainsValue:v4 key:@"_kMDItemContentURLFileID"])
    {
      BOOL v6 = [(SKGProcessor *)self recordMatchesContentURLOnDisk:v4 contentURL:v7];
    }
    else
    {
      BOOL v6 = 1;
    }
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

- (BOOL)recordMatchesContentURLOnDisk:(id)a3 contentURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CFNullRef v8 = [(SKGProcessor *)self copyNumberValueFromRecord:v6 key:@"_kMDItemContentURLFileID"];
  CFNullRef v9 = v8;
  BOOL v10 = 0;
  if (v8 && v8 != kCFNull)
  {
    CFNullRef v11 = [(SKGProcessor *)self copyNumberValueFromRecord:v6 key:@"_kMDItemContentURLFileVersion"];
    CFNullRef v12 = v11;
    BOOL v10 = 0;
    if (!v11 || v11 == kCFNull) {
      goto LABEL_15;
    }
    id v13 = [(SKGProcessor *)self copyContentTypeFromRecord:v6];
    if (!v13)
    {
      BOOL v10 = 0;
LABEL_14:

LABEL_15:
      goto LABEL_16;
    }
    memset(v20, 0, sizeof(v20));
    id v14 = +[UTType typeWithIdentifier:v13];
    uint64_t v19 = 0;
    if (sub_10002045C(v7, v14, (uint64_t)v20, &v19))
    {
      id v15 = +[NSNumber numberWithUnsignedLongLong:*((void *)&v20[0] + 1)];
      if ([(__CFNull *)v12 isEqualToNumber:v15])
      {
        id v16 = +[NSNumber numberWithUnsignedLongLong:*(void *)&v20[0]];
        unsigned __int8 v17 = [(__CFNull *)v9 isEqualToNumber:v16];

        if (v17)
        {
          BOOL v10 = 1;
LABEL_13:

          goto LABEL_14;
        }
      }
      else
      {
      }
    }
    BOOL v10 = 0;
    goto LABEL_13;
  }
LABEL_16:

  return v10;
}

- (id)itemFromRecord:(id)a3 referenceIdentifier:(id)a4 bundleIdentifier:(id)a5 protectionClass:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v11)
  {
    id v14 = v11;
    if (v13) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v18 = +[SKGProcessor sharedProcessor];
    id v15 = [v18 copyProtectionClassFromRecord:v10];

    if (v12) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  unsigned __int8 v17 = +[SKGProcessor sharedProcessor];
  id v14 = [v17 copyReferenceIdentifierFromRecord:v10];

  if (!v13) {
    goto LABEL_6;
  }
LABEL_3:
  id v15 = v13;
  if (v12)
  {
LABEL_4:
    id v16 = (__CFString *)v12;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v19 = +[SKGProcessor sharedProcessor];
  id v16 = (__CFString *)[v19 copyBundleIdentifierFromRecord:v10];

LABEL_8:
  id v20 = [(SKGProcessor *)self copyPersonaFromRecord:v10];
  if ([v15 isEqualToString:@"Default"])
  {
    if (!v16) {
      id v16 = @"com.apple.Metadata";
    }
    goto LABEL_11;
  }
  if ([v14 length]
    && [v15 length]
    && [(__CFString *)v16 length]
    && [v20 length])
  {
LABEL_11:
    char v21 = [[SKGProcessedItem alloc] initWithReferenceIdentifier:v14 personaIdentifier:v20 bundleIdentifier:v16 protectionClass:v15];
    id v22 = [(SKGProcessor *)self copyFilePathFromRecord:v10];
    [(SKGProcessedItem *)v21 setFilePath:v22];

    goto LABEL_17;
  }
  char v21 = 0;
LABEL_17:

  return v21;
}

- (BOOL)enumerateProcessedItemsFromRecord:(id)a3 referenceIdentifier:(id)a4 bundleIdentifier:(id)a5 protectionClass:(id)a6 processorFlags:(unint64_t)a7 processedItemBlock:(id)a8 cancelBlock:(id)a9
{
  return [(SKGProcessor *)self enumerateProcessedItemsFromRecord:a3 referenceIdentifier:a4 bundleIdentifier:a5 protectionClass:a6 processorFlags:a7 workCost:0 fetchCachedLanguageBlock:0 cacheLanguageBlock:0 processedItemBlock:a8 cancelBlock:a9];
}

- (BOOL)enumerateProcessedItemsFromRecord:(id)a3 referenceIdentifier:(id)a4 bundleIdentifier:(id)a5 protectionClass:(id)a6 processorFlags:(unint64_t)a7 workCost:(int64_t *)a8 fetchCachedLanguageBlock:(id)a9 cacheLanguageBlock:(id)a10 processedItemBlock:(id)a11 cancelBlock:(id)a12
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v49 = a9;
  id v48 = a10;
  long long v47 = (uint64_t (**)(id, void *))a11;
  id v21 = a12;
  uint64_t v59 = 0;
  uint64_t v60 = &v59;
  uint64_t v61 = 0x2020000000;
  char v62 = 1;
  id v22 = [(SKGProcessor *)self itemFromRecord:v17 referenceIdentifier:v18 bundleIdentifier:v19 protectionClass:v20];
  if (!v22)
  {
    uint64_t v33 = +[SKGActivityJournal sharedJournal];
    [v33 addVerboseEventForItem:201 bundleID:v19 identifier:v18];

    int v34 = 0;
    char v35 = 1;
    goto LABEL_38;
  }
  if ((a7 & 0x86) != 0)
  {
    uint64_t v23 = +[SKGEventsProfiler sharedInstance];
    if ((a7 & 0x40) != 0) {
      uint64_t v24 = 2;
    }
    else {
      uint64_t v24 = 1;
    }
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_10007E3F0;
    v50[3] = &unk_1000DC218;
    long long v58 = &v59;
    v50[4] = self;
    id v51 = v17;
    id v52 = v22;
    id v55 = v49;
    id v56 = v48;
    id v57 = v21;
    id v53 = v19;
    id v54 = v18;
    [v23 profileCodeWithType:@"GenerateEmbeddings-LID" kind:v24 block:v50];
  }
  if (!*((unsigned char *)v60 + 24)) {
    goto LABEL_37;
  }
  if ((a7 & 2) == 0) {
    goto LABEL_28;
  }
  uint64_t v25 = +[SKGSystemListener sharedProcessorListener];
  unsigned __int8 v26 = [v25 semanticSearchEnabled];

  if ((v26 & 1) == 0)
  {
    id v36 = +[SKGActivityJournal sharedJournal];
    [v36 addVerboseEventForItem:202 bundleID:v19 identifier:v18];

    if (!*((unsigned char *)v60 + 24)) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  id v27 = +[SKGSystemListener sharedProcessorListener];
  unsigned int v28 = [v27 enableLanguageCheckForEmbedding];

  if (!v28)
  {
    int v32 = 1;
    goto LABEL_23;
  }
  uint64_t v29 = +[SKGSystemListener sharedProcessorListener];
  long long v43 = [v29 supportedSemanticLanguages];

  unsigned int v44 = [v22 textContentLanguage];
  if (![v44 length] || !objc_msgSend(v43, "count"))
  {
    int v32 = 1;
LABEL_21:

    goto LABEL_22;
  }
  unsigned int v30 = [v22 textContentLanguage];
  unsigned __int8 v31 = [v43 containsObject:v30];

  if ((v31 & 1) == 0)
  {
    unsigned int v44 = +[SKGActivityJournal sharedJournal];
    [v44 addEventForItem:14 bundleID:v19 identifier:v18];
    int v32 = 0;
    goto LABEL_21;
  }
  int v32 = 1;
LABEL_22:

LABEL_23:
  if (*((unsigned char *)v60 + 24))
  {
    if (v32)
    {
      uint64_t v37 = +[SKGActivityJournal sharedJournal];
      [v37 addEventForItem:5 bundleID:v19 identifier:v18];

      unsigned __int8 v38 = [(SKGProcessor *)self generateEmbeddingsForRecord:v17 processedItem:v22 isPriority:(a7 >> 6) & 1 workCost:a8 cancelBlock:v21];
      *((unsigned char *)v60 + 24) = v38;
      if ((v38 & 1) == 0) {
        goto LABEL_37;
      }
      goto LABEL_28;
    }
LABEL_27:
    [v22 setDidProcessEmbeddings:1];
  }
LABEL_28:
  if ((a7 & 4) == 0) {
    goto LABEL_32;
  }
  dispatch_time_t v39 = dispatch_time(0, 0);
  unsigned int v40 = [(SKGProcessor *)self generateKeyphrasesForRecord:v17 processedItem:v22 fetchCachedLanguageBlock:v49 cacheLanguageBlock:v48 cancelBlock:v21];
  *((unsigned char *)v60 + 24) = v40;
  if (a8)
  {
    *a8 += dispatch_time(0, 0) - v39;
    unsigned int v40 = *((unsigned __int8 *)v60 + 24);
  }
  if (v40)
  {
LABEL_32:
    if ((a7 & 8) != 0)
    {
      if (*((unsigned char *)v60 + 24))
      {
        unsigned __int8 v41 = [(SKGProcessor *)self generatePeopleForRecord:v17 processedItem:v22 processedItemBlock:v47 cancelBlock:v21];
        char v35 = 0;
        *((unsigned char *)v60 + 24) = v41;
        int v34 = 1;
        goto LABEL_38;
      }
    }
    else if (*((unsigned char *)v60 + 24))
    {
      char v35 = v47[2](v47, v22);
      int v34 = 0;
      *((unsigned char *)v60 + 24) = v35;
      goto LABEL_38;
    }
  }
LABEL_37:
  char v35 = 0;
  int v34 = 0;
LABEL_38:

  if (v34) {
    char v35 = *((unsigned char *)v60 + 24) != 0;
  }
  _Block_object_dispose(&v59, 8);

  return v35;
}

- (BOOL)needsPeopleForRecord:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = +[SKGProcessor sharedProcessor];
    signed int v5 = [v4 recordIsValid:v3];

    if (v5)
    {
      id v6 = +[SKGProcessor sharedProcessor];
      id v7 = [v6 copyPeopleVersionFromRecord:v3];

      if (v7)
      {
        signed int v5 = [v7 intValue];
        CFNullRef v8 = +[SKGProcessorContext sharedContext];
        LOBYTE(v5) = [v8 knowledgeVersion] != (id)v5;
      }
      else
      {
        LOBYTE(v5) = 1;
      }
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)shouldGeneratePeopleForRecord:(id)a3
{
  id v3 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = +[SKGProcessorContext sharedContext];
  signed int v5 = [v4 peopleExtractionAttributes];

  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        CFNullRef v9 = [v3 objectForKeyedSubscript:*(void *)(*((void *)&v11 + 1) + 8 * i)];

        if (v9)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v6;
}

+ (id)embeddingVersionDataWithVersion:(id)a3
{
  v8[0] = @"SPOTLIGHT_CURRENT_MODEL_EMBEDDING_VERSION";
  v8[1] = @"SPOTLIGHT_CURRENT_EMBEDDING_VERSION";
  v9[0] = a3;
  v9[1] = &off_1000E6300;
  v8[2] = @"SPOTLIGHT_CURRENT_RELEASE_VERSION";
  v9[2] = &off_1000E6300;
  id v3 = a3;
  id v4 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:3];
  uint64_t v7 = 0;
  signed int v5 = +[NSKeyedArchiver archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v7];

  return v5;
}

+ (id)normalizeForEmbeddingGeneration:(id)a3 bundleID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length])
  {
    if (qword_1000F92A8 != -1) {
      dispatch_once(&qword_1000F92A8, &stru_1000DCA60);
    }
    unsigned int v8 = sub_10004A918(v6, v7);
    CFNullRef v9 = &qword_1000F92B8;
    if (!v8) {
      CFNullRef v9 = &qword_1000F92B0;
    }
    id v10 = objc_msgSend((id)*v9, "stringByReplacingMatchesInString:options:range:withTemplate:", v5, 0, 0, objc_msgSend(v5, "length"), @" ");
    long long v11 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
    long long v12 = [v10 stringByTrimmingCharactersInSet:v11];
  }
  else
  {
    long long v12 = 0;
  }

  return v12;
}

- (BOOL)embeddingRecordNeedsProcessing:(id)a3 bundleID:(id)a4 isUpdate:(BOOL)a5 hasTextContent:(BOOL)a6 shouldClear:(BOOL *)a7 shouldMarkComplete:(BOOL *)a8
{
  int v9 = a6;
  LODWORD(v10) = a5;
  id v13 = a3;
  id v14 = a4;
  id v15 = v14;
  id v16 = a8;
  if (v14) {
    id v17 = v14;
  }
  else {
    id v17 = [(SKGProcessor *)self copyBundleIdentifierFromRecord:v13];
  }
  id v18 = v17;
  unint64_t v19 = [(SKGProcessor *)self copyTitleFromRecord:v13];

  if ((sub_10004A954(v18) & 1) != 0 || sub_10004A9D0(v18, v20))
  {
    int v22 = v10;
    uint64_t v23 = self;
    unsigned int v24 = [(SKGProcessor *)self recordContainsValue:v13 key:@"kMDItemAuthors"];
    id v25 = +[SKGProcessor copyMailboxesFromRecord:v13];
    unsigned __int8 v26 = v25;
    if (v19) {
      int v27 = 1;
    }
    else {
      int v27 = v24;
    }
    v9 |= v27;
    LOBYTE(v10) = v22;
    unsigned int v28 = v16;
    if (v9 == 1 && v22) {
      int v9 = [v25 count] != 0;
    }
    if (v16 && v9)
    {
      if ([v26 count])
      {
        unsigned int v74 = [v26 containsObject:@"mailbox.junk"];
        uint64_t v10 = [v13 objectForKeyedSubscript:@"kMDItemIsLikelyJunk"];
        if (v10)
        {
          [v13 objectForKeyedSubscript:@"kMDItemIsLikelyJunk"];
          uint64_t v72 = v16;
          uint64_t v29 = v18;
          v31 = unsigned int v30 = v15;
          unsigned int v32 = [v31 isEqualToNumber:&off_1000E6318] ^ 1;

          id v15 = v30;
          id v18 = v29;
          unsigned int v28 = v72;
        }
        else
        {
          unsigned int v32 = 0;
        }

        LOBYTE(v10) = v22;
        if ((v74 | v32) == 1) {
          *unsigned int v28 = 1;
        }
      }
      if (![(SKGProcessor *)v23 extractContentFromRecordForMail:v13 bundleID:v18 content:0 maxChunkCountPtr:0 textLength:0])*unsigned int v28 = 1; {
    }
      }
    goto LABEL_33;
  }
  if (!sub_10004A9AC(v18, v21))
  {
    if (sub_10004A9C4(v18, v33))
    {
      char v75 = v10;
      id v36 = self;
      uint64_t v37 = v15;
      unsigned int v38 = [(SKGProcessor *)v36 recordContainsValue:v13 key:@"redirectSourceTitle"];
      unsigned int v39 = [(SKGProcessor *)v36 recordContainsValue:v13 key:@"kMDItemContentURL"];
      unsigned int v40 = [(SKGProcessor *)v36 recordContainsValue:v13 key:@"redirectSourceURL"];
      unsigned int v41 = [(SKGProcessor *)v36 recordContainsValue:v13 key:@"kMDItemDescription"];
      if (v19) {
        int v42 = 1;
      }
      else {
        int v42 = v38;
      }
      int v9 = v42 | v39 | v40 | v41;
      id v15 = v37;
      if (!v16)
      {
        LOBYTE(v10) = v75;
        goto LABEL_34;
      }
      LOBYTE(v10) = v75;
      if (!v9) {
        goto LABEL_34;
      }
      unsigned __int8 v34 = [(SKGProcessor *)v36 extractContentFromRecordForSafari:v13 bundleID:v18 content:0 maxChunkCountPtr:0 textLength:0];
LABEL_51:
      LOBYTE(v9) = 1;
      if (v34) {
        goto LABEL_39;
      }
      goto LABEL_38;
    }
    if (sub_10004A918(v18, v35))
    {
      char v45 = v10;
      unsigned int v76 = [(SKGProcessor *)self recordContainsValue:v13 key:@"kMDItemAuthors"];
      unsigned int v46 = [(SKGProcessor *)self recordContainsValue:v13 key:@"kMDItemNamedLocation"];
      unsigned int v47 = [(SKGProcessor *)self recordContainsValue:v13 key:@"kMDItemComment"];
      id v48 = self;
      id v49 = [(SKGProcessor *)self copyStringValueFromRecord:v13 key:@"kMDItemCalendarHolidayIdentifier"];
      unsigned __int8 v26 = v49;
      if (v49 && ([v49 isEqualToString:@"Y"] & 1) != 0)
      {
        LOBYTE(v9) = 0;
      }
      else
      {
        if (v19) {
          int v55 = 1;
        }
        else {
          int v55 = v76;
        }
        int v9 = v55 | v46 | v47;
        if (v16)
        {
          LOBYTE(v10) = v45;
          if (v9)
          {
            LOBYTE(v9) = 1;
            if (![(SKGProcessor *)v48 extractContentFromRecordForCalendar:v13 bundleID:v18 content:0 maxChunkCountPtr:0 textLength:0])*id v16 = 1; {
          }
            }
          goto LABEL_33;
        }
      }
      LOBYTE(v10) = v45;
LABEL_33:

      goto LABEL_34;
    }
    if (sub_10004A924(v18, v44))
    {
      LOBYTE(v51) = v10;
      unsigned int v52 = [(SKGProcessor *)self recordContainsValue:v13 key:@"kMDItemNamedLocation"];
      unsigned int v53 = [(SKGProcessor *)self recordContainsValue:v13 key:@"kMDItemComment"];
      if (v19) {
        int v54 = 1;
      }
      else {
        int v54 = v52;
      }
      int v9 = v54 | v53;
      if (a8)
      {
        LOBYTE(v10) = v51;
        if (!v9) {
          goto LABEL_34;
        }
        unsigned __int8 v34 = [(SKGProcessor *)self extractContentFromRecordForReminders:v13 bundleID:v18 content:0 maxChunkCountPtr:0 textLength:0];
        goto LABEL_51;
      }
LABEL_105:
      LOBYTE(v10) = v51;
      goto LABEL_34;
    }
    int v51 = v10;
    if (sub_10004A930(v18, v50))
    {
      unint64_t v57 = [(SKGProcessor *)self copyExtraDataFromWalletRecord:v13];
      if (v19 | v57) {
        int v9 = 1;
      }
      if (a8
        && v9
        && ![(SKGProcessor *)self extractContentFromRecordForWallet:v13 bundleID:v18 content:0 maxChunkCountPtr:0 textLength:0])
      {
        *a8 = 1;
      }

      goto LABEL_105;
    }
    if (sub_10004A93C(v18, v56))
    {
      unint64_t v58 = [(SKGProcessor *)self copyStringValueFromRecord:v13 key:@"kMDItemEventType"];
      unint64_t v59 = [(SKGProcessor *)self copyStringValueFromRecord:v13 key:@"kMDItemTitle"];
      LOBYTE(v9) = (v58 | v59) != 0;
      if (a8
        && v58 | v59
        && ![(SKGProcessor *)self extractContentFromRecordForEvents:v13 bundleID:v18 content:0 maxChunkCountPtr:0 textLength:0])
      {
        *a8 = 1;
      }

      goto LABEL_105;
    }
    uint64_t v60 = self;
    unsigned int v61 = [(SKGProcessor *)self recordContainsValue:v13 key:@"kMDItemDescription"];
    unsigned int v62 = [v18 hasPrefix:@"com.apple."];
    unsigned int v63 = v62;
    if (v19) {
      int v64 = v9;
    }
    else {
      int v64 = 0;
    }
    int v65 = v62 ^ 1;
    if (v19) {
      int v65 = 1;
    }
    int v66 = v62 | v64;
    unsigned int v77 = v61;
    if (v65) {
      int v67 = v66;
    }
    else {
      int v67 = v9 | v61;
    }
    if (v67 == 1)
    {
      if (v9)
      {
        unint64_t v68 = +[SKGProcessor textContentLengthForRecord:v13];
        if (v68 == 0x7FFFFFFFFFFFFFFFLL)
        {
          if (![(SKGProcessor *)v60 recordContainsValue:v13 key:@"_kMDItemTextContentIndexExists"]&& ![(SKGProcessor *)v60 recordContainsValue:v13 key:@"_kMDItemSnippet"])
          {
            id v73 = [(SKGProcessor *)v60 copyFileProviderIDFromRecord:v13];
            if (v73)
            {
              id v71 = v15;
              id v69 = [(SKGProcessor *)v60 copyContentURLFromRecord:v13];
              unsigned __int8 v70 = [v69 isFileURL];

              id v15 = v71;
              if (v70) {
                goto LABEL_95;
              }
            }
          }
          if ([(SKGProcessor *)v60 extractContentFromRecord:v13 bundleID:v18 content:0 maxChunkCountPtr:0 textLength:0])
          {
            goto LABEL_95;
          }
        }
        else if (v68 >= 0x14)
        {
          goto LABEL_95;
        }
      }
      *id v16 = 1;
    }
LABEL_95:
    if (!a7)
    {
      LOBYTE(v9) = v67;
      goto LABEL_39;
    }
    if (v19 || (v9 & 1) != 0)
    {
      if (!v51)
      {
LABEL_104:
        LOBYTE(v9) = v67;
        goto LABEL_105;
      }
    }
    else if ((v63 & v77) != 1 || (v51 & 1) == 0)
    {
      goto LABEL_104;
    }
    *a7 = 1;
    goto LABEL_104;
  }
  if (a8 && v9)
  {
    unsigned __int8 v34 = [(SKGProcessor *)self extractContentFromRecordForMessages:v13 bundleID:v18 content:0 maxChunkCountPtr:0 textLength:0];
    goto LABEL_51;
  }
LABEL_34:
  if (a7 && (v10 & 1) == 0 && (v9 & 1) == 0)
  {
    LOBYTE(v9) = 0;
    id v16 = a7;
LABEL_38:
    *id v16 = 1;
  }
LABEL_39:

  return v9;
}

- (BOOL)extractContentFromRecordForMail:(id)a3 bundleID:(id)a4 content:(id *)a5 maxChunkCountPtr:(unint64_t *)a6 textLength:(unint64_t *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = v13;
  if (v13) {
    id v15 = v13;
  }
  else {
    id v15 = [(SKGProcessor *)self copyBundleIdentifierFromRecord:v12];
  }
  id v16 = v15;
  if ((sub_10004A954(v15) & 1) != 0 || sub_10004A9D0(v16, v17))
  {
    id v18 = [(SKGProcessor *)self copyNumberValueFromRecord:v12 key:@"_kMDItemTextContentLength"];
    id v19 = [v18 unsignedIntegerValue];

    if (a7) {
      *a7 = (unint64_t)v19;
    }
    if (a5 || (unint64_t)v19 <= 0x13)
    {
      if (a5 || !v19)
      {
        id v21 = [(SKGProcessor *)self copyTextContentFromRecord:v12];
        if (!v21) {
          id v21 = [(SKGProcessor *)self copySnippetFromRecord:v12];
        }
        id v19 = (id)sub_10008FC9C(v21);
      }
      else
      {
        id v21 = 0;
      }
      int v22 = [(SKGProcessor *)self copyTitleFromRecord:v12];
      unint64_t v23 = (unint64_t)v19 + sub_10008FC9C(v22);
      if (a7) {
        *a7 = v23;
      }
      BOOL v20 = v23 > 0x13;
      if (v23 >= 0x14)
      {
        if (a5)
        {
          unsigned int v24 = [(SKGProcessor *)self copyStringArrayFromRecordAndConcatnate:v12 key:@"kMDItemAuthors"];
          CFStringRef v25 = &stru_1000DD7E8;
          if (v22) {
            CFStringRef v26 = v22;
          }
          else {
            CFStringRef v26 = &stru_1000DD7E8;
          }
          if (v24) {
            CFStringRef v27 = v24;
          }
          else {
            CFStringRef v27 = &stru_1000DD7E8;
          }
          if (v21) {
            CFStringRef v25 = v21;
          }
          *a5 = +[NSString stringWithFormat:@"%@ %@ %@", v26, v27, v25];
        }
        if (a6) {
          *a6 = 2;
        }
      }
    }
    else
    {
      BOOL v20 = 1;
    }
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

- (BOOL)extractContentFromRecordForSafari:(id)a3 bundleID:(id)a4 content:(id *)a5 maxChunkCountPtr:(unint64_t *)a6 textLength:(unint64_t *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = v13;
  if (v13) {
    id v15 = v13;
  }
  else {
    id v15 = [(SKGProcessor *)self copyBundleIdentifierFromRecord:v12];
  }
  id v17 = v15;
  if (sub_10004A9C4(v15, v16))
  {
    id v18 = [(SKGProcessor *)self copyTitleFromRecord:v12];
    id v19 = [(SKGProcessor *)self copyStringValueFromRecord:v12 key:@"redirectSourceTitle"];
    id v20 = v19;
    long long v50 = a6;
    if (v19 && v18 && ([v19 isEqualToString:v18] & 1) == 0)
    {
      uint64_t v21 = +[NSString stringWithFormat:@"%@ %@", v20, v18];

      id v18 = (__CFString *)v21;
    }
    unsigned int v47 = a5;
    id v49 = v20;
    id v22 = [(SKGProcessor *)self copyStringValueFromRecord:v12 key:@"kMDItemContentURL"];
    id v48 = v22;
    if ([v22 length])
    {
      unint64_t v23 = +[NSURLComponents componentsWithString:v22];
      unsigned int v24 = [v23 percentEncodedPath];
      CFStringRef v25 = [v24 stringByReplacingOccurrencesOfString:@"/" withString:@" "];

      [v23 host];
      v27 = CFStringRef v26 = a7;
      unsigned int v28 = +[NSString stringWithFormat:@"%@%@", v27, v25];

      a7 = v26;
    }
    else
    {
      unsigned int v28 = 0;
    }
    id v30 = [(SKGProcessor *)self copyStringValueFromRecord:v12 key:@"redirectSourceURL"];
    if ([v30 length])
    {
      char v45 = a7;
      unsigned int v46 = v17;
      unsigned __int8 v31 = +[NSURLComponents componentsWithString:v30];
      unsigned int v32 = [v31 percentEncodedPath];
      uint64_t v33 = [v32 stringByReplacingOccurrencesOfString:@"/" withString:@" "];

      unsigned __int8 v34 = [v31 host];
      char v35 = +[NSString stringWithFormat:@"%@ %@", v34, v33];

      if (v35 && v28 && ([v35 isEqualToString:v28] & 1) == 0)
      {
        uint64_t v36 = +[NSString stringWithFormat:@"%@%@", v35, v28];

        unsigned int v28 = (__CFString *)v36;
      }

      a7 = v45;
      id v17 = v46;
    }
    uint64_t v37 = [(SKGProcessor *)self copyStringValueFromRecord:v12 key:@"kMDItemDescription"];
    uint64_t v38 = sub_10008FC9C(v18);
    uint64_t v39 = sub_10008FC9C(v28) + v38;
    unint64_t v40 = v39 + sub_10008FC9C(v37);
    if (a7) {
      *a7 = v40;
    }
    BOOL v29 = v40 > 0x13;
    if (v40 >= 0x14)
    {
      if (v47)
      {
        CFStringRef v41 = &stru_1000DD7E8;
        if (v18) {
          CFStringRef v42 = v18;
        }
        else {
          CFStringRef v42 = &stru_1000DD7E8;
        }
        if (v28) {
          CFStringRef v43 = v28;
        }
        else {
          CFStringRef v43 = &stru_1000DD7E8;
        }
        if (v37) {
          CFStringRef v41 = v37;
        }
        id *v47 = +[NSString stringWithFormat:@"%@ %@ %@", v42, v43, v41];
      }
      if (v50) {
        unint64_t *v50 = 1;
      }
    }
  }
  else
  {
    BOOL v29 = 0;
  }

  return v29;
}

- (BOOL)extractContentFromRecordForCalendar:(id)a3 bundleID:(id)a4 content:(id *)a5 maxChunkCountPtr:(unint64_t *)a6 textLength:(unint64_t *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = v13;
  if (v13) {
    id v15 = v13;
  }
  else {
    id v15 = [(SKGProcessor *)self copyBundleIdentifierFromRecord:v12];
  }
  id v17 = v15;
  if (sub_10004A918(v15, v16))
  {
    unsigned __int8 v34 = a5;
    id v18 = [(SKGProcessor *)self copyTitleFromRecord:v12];
    char v35 = [(SKGProcessor *)self copyStringArrayFromRecordAndConcatnate:v12 key:@"kMDItemAuthors"];
    id v19 = [(SKGProcessor *)self copyStringValueFromRecord:v12 key:@"kMDItemNamedLocation"];
    id v20 = [(SKGProcessor *)self copyStringValueFromRecord:v12 key:@"kMDItemComment"];
    uint64_t v21 = [v20 stringByReplacingOccurrencesOfString:@"\n" withString:@" "];

    id v22 = +[SKGProcessor sharedProcessor];
    unint64_t v23 = (__CFString *)[v22 copyDateStringFromRecordWithFormat:v12, @"kMDItemStartDate", @"MMMM d, Y" key formatString];

    uint64_t v24 = sub_10008FC9C(v18);
    uint64_t v25 = sub_10008FC9C(v19) + v24;
    unint64_t v26 = v25 + sub_10008FC9C(v21);
    if (a7) {
      *a7 = v26;
    }
    BOOL v27 = v26 > 0x13;
    if (v26 >= 0x14)
    {
      if (v34)
      {
        CFStringRef v28 = &stru_1000DD7E8;
        if (v18) {
          CFStringRef v29 = v18;
        }
        else {
          CFStringRef v29 = &stru_1000DD7E8;
        }
        if (v23) {
          CFStringRef v30 = v23;
        }
        else {
          CFStringRef v30 = &stru_1000DD7E8;
        }
        CFStringRef v31 = v35;
        if (!v35) {
          CFStringRef v31 = &stru_1000DD7E8;
        }
        if (v19) {
          CFStringRef v32 = v19;
        }
        else {
          CFStringRef v32 = &stru_1000DD7E8;
        }
        if (v21) {
          CFStringRef v28 = v21;
        }
        id *v34 = +[NSString stringWithFormat:@"%@\n%@\n%@\n%@\n%@", v29, v30, v31, v32, v28];
      }
      if (a6) {
        *a6 = 1;
      }
    }
  }
  else
  {
    BOOL v27 = 0;
  }

  return v27;
}

- (BOOL)extractContentFromRecordForReminders:(id)a3 bundleID:(id)a4 content:(id *)a5 maxChunkCountPtr:(unint64_t *)a6 textLength:(unint64_t *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = v13;
  if (v13) {
    id v15 = v13;
  }
  else {
    id v15 = [(SKGProcessor *)self copyBundleIdentifierFromRecord:v12];
  }
  id v17 = v15;
  if (sub_10004A924(v15, v16))
  {
    id v18 = [(SKGProcessor *)self copyTitleFromRecord:v12];
    id v19 = [(SKGProcessor *)self copyStringValueFromRecord:v12 key:@"kMDItemNamedLocation"];
    id v20 = [(SKGProcessor *)self copyStringValueFromRecord:v12 key:@"kMDItemComment"];
    uint64_t v21 = sub_10008FC9C(v18);
    uint64_t v22 = sub_10008FC9C(v19) + v21;
    unint64_t v23 = v22 + sub_10008FC9C(v20);
    if (a7) {
      *a7 = v23;
    }
    BOOL v24 = v23 > 0x13;
    if (v23 >= 0x14)
    {
      if (a5)
      {
        CFStringRef v25 = &stru_1000DD7E8;
        if (v18) {
          CFStringRef v26 = v18;
        }
        else {
          CFStringRef v26 = &stru_1000DD7E8;
        }
        if (v19) {
          CFStringRef v27 = v19;
        }
        else {
          CFStringRef v27 = &stru_1000DD7E8;
        }
        if (v20) {
          CFStringRef v25 = v20;
        }
        *a5 = +[NSString stringWithFormat:@"%@ %@ %@", v26, v27, v25];
      }
      if (a6) {
        *a6 = 1;
      }
    }
  }
  else
  {
    BOOL v24 = 0;
  }

  return v24;
}

- (BOOL)extractContentFromRecordForWallet:(id)a3 bundleID:(id)a4 content:(id *)a5 maxChunkCountPtr:(unint64_t *)a6 textLength:(unint64_t *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = v13;
  if (v13) {
    id v15 = v13;
  }
  else {
    id v15 = [(SKGProcessor *)self copyBundleIdentifierFromRecord:v12];
  }
  id v17 = v15;
  if (sub_10004A930(v15, v16))
  {
    CFStringRef v31 = a6;
    id v18 = [(SKGProcessor *)self copyTitleFromRecord:v12];
    id v19 = [(SKGProcessor *)self copyExtraDataFromWalletRecord:v12];
    uint64_t v34 = 0;
    char v35 = &v34;
    uint64_t v36 = 0x3032000000;
    uint64_t v37 = sub_100012724;
    uint64_t v38 = sub_1000125B0;
    id v39 = 0;
    id v39 = objc_alloc_init((Class)NSMutableString);
    if (v19)
    {
      id v33 = 0;
      id v20 = +[NSJSONSerialization JSONObjectWithData:v19 options:1 error:&v33];
      id v21 = v33;
      uint64_t v22 = v21;
      if (v20 && !v21)
      {
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472;
        v32[2] = sub_100090798;
        v32[3] = &unk_1000DCA88;
        v32[4] = &v34;
        [v20 enumerateKeysAndObjectsUsingBlock:v32];
      }
    }
    unint64_t v23 = +[SKGProcessor normalizeForEmbeddingGeneration:v35[5] bundleID:v14];
    if (![v23 length])
    {
      id v24 = [(SKGProcessor *)self copyTextContentFromRecord:v12];
      if (!v24) {
        id v24 = [(SKGProcessor *)self copySnippetFromRecord:v12];
      }

      unint64_t v23 = v24;
    }
    uint64_t v25 = sub_10008FC9C(v18);
    unint64_t v26 = sub_10008FC9C(v23) + v25;
    if (a7) {
      *a7 = v26;
    }
    BOOL v27 = v26 > 0x13;
    if (v26 >= 0x14)
    {
      if (a5)
      {
        CFStringRef v28 = &stru_1000DD7E8;
        if (v18) {
          CFStringRef v29 = v18;
        }
        else {
          CFStringRef v29 = &stru_1000DD7E8;
        }
        if (v35[5]) {
          CFStringRef v28 = (const __CFString *)v35[5];
        }
        *a5 = +[NSString stringWithFormat:@"%@ %@", v29, v28];
      }
      if (v31) {
        unint64_t *v31 = 1;
      }
    }

    _Block_object_dispose(&v34, 8);
  }
  else
  {
    BOOL v27 = 0;
  }

  return v27;
}

- (BOOL)extractContentFromRecordForEvents:(id)a3 bundleID:(id)a4 content:(id *)a5 maxChunkCountPtr:(unint64_t *)a6 textLength:(unint64_t *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = v13;
  if (v13) {
    id v15 = v13;
  }
  else {
    id v15 = [(SKGProcessor *)self copyBundleIdentifierFromRecord:v12];
  }
  id v17 = v15;
  if (!sub_10004A93C(v15, v16))
  {
    BOOL v20 = 0;
    goto LABEL_78;
  }
  id v18 = [(SKGProcessor *)self copyNumberValueFromRecord:v12 key:@"_kMDItemTextContentLength"];
  id v19 = [v18 unsignedIntegerValue];

  if (a7) {
    *a7 = (unint64_t)v19;
  }
  if (!a5 && (unint64_t)v19 > 0x13)
  {
    BOOL v20 = 1;
    goto LABEL_78;
  }
  id v21 = [(SKGProcessor *)self copyStringValueFromRecord:v12 key:@"kMDItemEventType"];
  CFStringRef v22 = [(SKGProcessor *)self copyStringValueFromRecord:v12 key:@"kMDItemTitle"];
  unint64_t v59 = a6;
  uint64_t v60 = (__CFString *)v22;
  if ([(__CFString *)v21 isEqualToString:@"hotel"])
  {
    unint64_t v23 = [(SKGProcessor *)self copyStringValueFromRecord:v12 key:@"kMDItemEventHotelUnderName"];
    id v24 = [(SKGProcessor *)self copyStringValueFromRecord:v12 key:@"kMDItemEventHotelReservationForAddress"];
    CFStringRef v25 = &stru_1000DD7E8;
    if (v21) {
      CFStringRef v26 = v21;
    }
    else {
      CFStringRef v26 = &stru_1000DD7E8;
    }
    if (v22) {
      CFStringRef v27 = v22;
    }
    else {
      CFStringRef v27 = &stru_1000DD7E8;
    }
    if (v23) {
      CFStringRef v28 = v23;
    }
    else {
      CFStringRef v28 = &stru_1000DD7E8;
    }
    if (v24) {
      CFStringRef v25 = v24;
    }
    CFStringRef v29 = +[NSString stringWithFormat:@"This is %@ event document. Document title: %@. Customer name: %@. Event location: %@.", v26, v27, v28, v25];
  }
  else
  {
    if ([(__CFString *)v21 isEqualToString:@"flight"])
    {
      unint64_t v58 = [(SKGProcessor *)self copyStringArrayFromRecordAndConcatnate:v12 key:@"kMDItemEventCustomerNames"];
      unint64_t v57 = [(SKGProcessor *)self copyStringValueFromRecord:v12 key:@"kMDItemEventProvider"];
      id v56 = [(SKGProcessor *)self copyStringValueFromRecord:v12 key:@"kMDItemEventFlightDepartureAirportCode"];
      int v55 = [(SKGProcessor *)self copyStringValueFromRecord:v12 key:@"kMDItemEventFlightDepartureAirportLocality"];
      CFStringRef v30 = [(SKGProcessor *)self copyStringValueFromRecord:v12 key:@"kMDItemEventFlightArrivalAirportCode"];
      CFStringRef v31 = [(SKGProcessor *)self copyStringValueFromRecord:v12 key:@"kMDItemEventFlightArrivalAirportLocality"];
      CFStringRef v32 = &stru_1000DD7E8;
      if (v21) {
        CFStringRef v33 = v21;
      }
      else {
        CFStringRef v33 = &stru_1000DD7E8;
      }
      if (v22) {
        CFStringRef v34 = v22;
      }
      else {
        CFStringRef v34 = &stru_1000DD7E8;
      }
      CFStringRef v36 = v57;
      CFStringRef v35 = v58;
      if (!v58) {
        CFStringRef v35 = &stru_1000DD7E8;
      }
      if (!v57) {
        CFStringRef v36 = &stru_1000DD7E8;
      }
      CFStringRef v38 = v55;
      CFStringRef v37 = v56;
      if (!v56) {
        CFStringRef v37 = &stru_1000DD7E8;
      }
      if (!v55) {
        CFStringRef v38 = &stru_1000DD7E8;
      }
      if (v30) {
        CFStringRef v39 = v30;
      }
      else {
        CFStringRef v39 = &stru_1000DD7E8;
      }
      if (v31) {
        CFStringRef v32 = v31;
      }
      CFStringRef v29 = +[NSString stringWithFormat:@"This is %@ event document. Document title: %@. Customer name: %@. Airline: %@. Departure airport: %@. Departure location: %@. Arrival airport: %@. Arrival location: %@.", v33, v34, v35, v36, v37, v38, v39, v32];
    }
    else
    {
      if (![(__CFString *)v21 isEqualToString:@"restaurant"])
      {
        CFStringRef v47 = &stru_1000DD7E8;
        if (v21) {
          CFStringRef v48 = v21;
        }
        else {
          CFStringRef v48 = &stru_1000DD7E8;
        }
        if (v22) {
          CFStringRef v47 = v22;
        }
        CFStringRef v29 = +[NSString stringWithFormat:@"This is %@ event document. Document title: %@.", v48, v47];
        goto LABEL_67;
      }
      unint64_t v58 = [(SKGProcessor *)self copyStringArrayFromRecordAndConcatnate:v12 key:@"kMDItemEventCustomerNames"];
      unint64_t v40 = [(SKGProcessor *)self copyStringValueFromRecord:v12 key:@"kMDItemEventProvider"];
      CFStringRef v41 = [(SKGProcessor *)self copyStringValueFromRecord:v12 key:@"kMDItemEventStartLocationAddress"];
      CFStringRef v42 = &stru_1000DD7E8;
      if (v21) {
        CFStringRef v43 = v21;
      }
      else {
        CFStringRef v43 = &stru_1000DD7E8;
      }
      if (v22) {
        CFStringRef v44 = v22;
      }
      else {
        CFStringRef v44 = &stru_1000DD7E8;
      }
      CFStringRef v45 = v58;
      if (!v58) {
        CFStringRef v45 = &stru_1000DD7E8;
      }
      if (v40) {
        CFStringRef v46 = v40;
      }
      else {
        CFStringRef v46 = &stru_1000DD7E8;
      }
      if (v41) {
        CFStringRef v42 = v41;
      }
      CFStringRef v29 = +[NSString stringWithFormat:@"This is %@ event document. Document title: %@. Customer name: %@. Event provider: %@. Event location: %@.", v43, v44, v45, v46, v42];
    }
  }
LABEL_67:
  id v49 = [(SKGProcessor *)self copyDateStringFromRecordWithFormat:v12 key:@"kMDItemStartDate" formatString:@"MMMM d, Y HH:mm"];
  id v50 = [(SKGProcessor *)self copyDateStringFromRecordWithFormat:v12 key:@"kMDItemEndDate" formatString:@"MMMM d, Y HH:mm"];
  int v51 = v50;
  if (v49 && v50)
  {
    uint64_t v52 = +[NSString stringWithFormat:@"%@ Event time range: %@ to %@.", v29, v49, v50];

    CFStringRef v29 = (void *)v52;
  }
  unint64_t v53 = sub_10008FC9C(v29);
  if (a7) {
    *a7 = v53;
  }
  BOOL v20 = v53 > 0x13;
  if (v53 >= 0x14)
  {
    if (a5) {
      *a5 = [v29 copy];
    }
    if (v59) {
      *unint64_t v59 = 1;
    }
  }

LABEL_78:
  return v20;
}

- (BOOL)extractContentFromRecordForMessages:(id)a3 bundleID:(id)a4 content:(id *)a5 maxChunkCountPtr:(unint64_t *)a6 textLength:(unint64_t *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = v13;
  if (v13) {
    id v15 = v13;
  }
  else {
    id v15 = [(SKGProcessor *)self copyBundleIdentifierFromRecord:v12];
  }
  id v17 = v15;
  if (sub_10004A9AC(v15, v16))
  {
    id v18 = [(SKGProcessor *)self copyNumberValueFromRecord:v12 key:@"_kMDItemTextContentLength"];
    id v19 = [v18 unsignedIntegerValue];

    if (a7) {
      *a7 = (unint64_t)v19;
    }
    if (a5 || (unint64_t)v19 <= 0x13)
    {
      if (a5 || !v19)
      {
        id v21 = [(SKGProcessor *)self copyTextContentFromRecord:v12];
        if (!v21) {
          id v21 = [(SKGProcessor *)self copySnippetFromRecord:v12];
        }
      }
      else
      {
        id v21 = 0;
      }
      CFStringRef v22 = [(SKGProcessor *)self copyStringArrayFromRecordAndConcatnate:v12 key:@"kMDItemAuthors"];
      if ([(SKGProcessor *)self isStringOnlyNumbersOrPunctuationSpaces:v22])
      {

        CFStringRef v22 = 0;
      }
      unint64_t v23 = sub_10008FC9C(v21);
      if (a7) {
        *a7 = v23;
      }
      BOOL v20 = v23 > 0x13;
      if (v23 >= 0x14)
      {
        if (a5)
        {
          CFStringRef v24 = &stru_1000DD7E8;
          if (v22) {
            CFStringRef v25 = v22;
          }
          else {
            CFStringRef v25 = &stru_1000DD7E8;
          }
          if (v21) {
            CFStringRef v24 = v21;
          }
          *a5 = +[NSString stringWithFormat:@"%@ %@", v25, v24];
        }
        if (a6) {
          *a6 = 1;
        }
      }
    }
    else
    {
      BOOL v20 = 1;
    }
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

- (BOOL)extractContentFromRecord:(id)a3 bundleID:(id)a4 content:(id *)a5 maxChunkCountPtr:(unint64_t *)a6 textLength:(unint64_t *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = v13;
  if (v13) {
    id v15 = v13;
  }
  else {
    id v15 = [(SKGProcessor *)self copyBundleIdentifierFromRecord:v12];
  }
  id v16 = v15;
  if ((sub_10004A954(v15) & 1) != 0 || sub_10004A9D0(v16, v17))
  {
    unsigned __int8 v19 = [(SKGProcessor *)self extractContentFromRecordForMail:v12 bundleID:v16 content:a5 maxChunkCountPtr:a6 textLength:a7];
LABEL_7:
    BOOL v20 = v19;
    goto LABEL_8;
  }
  if (sub_10004A9C4(v16, v18))
  {
    unsigned __int8 v19 = [(SKGProcessor *)self extractContentFromRecordForSafari:v12 bundleID:v16 content:a5 maxChunkCountPtr:a6 textLength:a7];
    goto LABEL_7;
  }
  if (sub_10004A918(v16, v22))
  {
    unsigned __int8 v19 = [(SKGProcessor *)self extractContentFromRecordForCalendar:v12 bundleID:v16 content:a5 maxChunkCountPtr:a6 textLength:a7];
    goto LABEL_7;
  }
  if (sub_10004A924(v16, v23))
  {
    unsigned __int8 v19 = [(SKGProcessor *)self extractContentFromRecordForReminders:v12 bundleID:v16 content:a5 maxChunkCountPtr:a6 textLength:a7];
    goto LABEL_7;
  }
  if (sub_10004A930(v16, v24))
  {
    unsigned __int8 v19 = [(SKGProcessor *)self extractContentFromRecordForWallet:v12 bundleID:v16 content:a5 maxChunkCountPtr:a6 textLength:a7];
    goto LABEL_7;
  }
  if (sub_10004A9AC(v16, v25))
  {
    unsigned __int8 v19 = [(SKGProcessor *)self extractContentFromRecordForMessages:v12 bundleID:v16 content:a5 maxChunkCountPtr:a6 textLength:a7];
    goto LABEL_7;
  }
  if (sub_10004A93C(v16, v26))
  {
    unsigned __int8 v19 = [(SKGProcessor *)self extractContentFromRecordForEvents:v12 bundleID:v16 content:a5 maxChunkCountPtr:a6 textLength:a7];
    goto LABEL_7;
  }
  id v27 = [(SKGProcessor *)self copyNumberValueFromRecord:v12 key:@"_kMDItemTextContentLength"];
  id v28 = [v27 unsignedIntegerValue];

  if (a7) {
    *a7 = (unint64_t)v28;
  }
  if (a5 || (unint64_t)v28 <= 0x13)
  {
    if (a5 || !v28)
    {
      CFStringRef v30 = [(SKGProcessor *)self copyTextContentFromRecord:v12];
      if (v30)
      {
        CFStringRef v29 = v30;
        [v16 containsString:@"com.apple"];
      }
      else
      {
        CFStringRef v29 = [(SKGProcessor *)self copySnippetFromRecord:v12];
        unsigned int v31 = [v16 containsString:@"com.apple"];
        if (!v29 && v31) {
          CFStringRef v29 = [(SKGProcessor *)self copyDescriptionContentFromRecord:v12];
        }
      }
      id v28 = (id)sub_10008FC9C(v29);
    }
    else
    {
      CFStringRef v29 = 0;
    }
    CFStringRef v32 = [(SKGProcessor *)self copyTitleFromRecord:v12];
    unint64_t v33 = (unint64_t)v28 + sub_10008FC9C(v32);
    if (a7) {
      *a7 = v33;
    }
    BOOL v20 = v33 > 0x13;
    if (v33 >= 0x14)
    {
      if (a5)
      {
        CFStringRef v34 = &stru_1000DD7E8;
        if (v32) {
          CFStringRef v35 = v32;
        }
        else {
          CFStringRef v35 = &stru_1000DD7E8;
        }
        if (v29) {
          CFStringRef v34 = v29;
        }
        *a5 = +[NSString stringWithFormat:@"%@ %@", v35, v34];
      }
      if (a6) {
        *a6 = 2;
      }
    }
  }
  else
  {
    BOOL v20 = 1;
  }
LABEL_8:

  return v20;
}

- (BOOL)needsEmbeddingsForRecord:(id)a3 bundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = +[SPEmbeddingModel sharedInstance];
  unsigned int v9 = [v8 deviceCanGenerateEmbeddings];

  if (v9)
  {
    if ([v6 count])
    {
      uint64_t v10 = +[SKGProcessor sharedProcessor];
      unsigned int v11 = [v10 recordIsValid:v6];

      if (v11)
      {
        id v12 = [(SKGProcessor *)self copyEmbeddingVersionFromRecord:v6];
        id v13 = [(SKGProcessor *)self copyEmbeddingModelVersionFromRecord:v6];
        if (v12)
        {
          signed int v14 = [v12 intValue];
          id v15 = +[SKGProcessorContext sharedContext];
          if ([v15 embeddingVersion] == (id)v14 && v13)
          {
            unsigned int v16 = [v13 intValue];
            id v17 = +[SKGProcessorContext sharedContext];
            id v18 = [v17 embeddingModelVersion];

            if (v18 == (id)(int)v16)
            {
              unsigned __int8 v19 = +[SKGActivityJournal sharedJournal];
              BOOL v20 = [v6 objectForKeyedSubscript:@"_kMDItemBundleID"];
              id v21 = [v6 objectForKeyedSubscript:@"kMDItemIdentifier"];
              [v19 addVerboseEventForItem:207 bundleID:v20 identifier:v21];

              BOOL v22 = 0;
LABEL_44:

              goto LABEL_10;
            }
          }
          else
          {
          }
        }
        if (v7)
        {
          id v24 = v7;
        }
        else
        {
          id v24 = [(SKGProcessor *)self copyBundleIdentifierFromRecord:v6];
          if (!v24) {
            goto LABEL_17;
          }
        }
        CFStringRef v25 = +[SKGProcessorContext sharedContext];
        CFStringRef v26 = [v25 embeddingExcludeBundles];
        unsigned int v27 = [v26 containsObject:v24];

        if (v27)
        {
          id v28 = +[SKGActivityJournal sharedJournal];
          CFStringRef v29 = [v6 objectForKeyedSubscript:@"_kMDItemBundleID"];
          CFStringRef v30 = [v6 objectForKeyedSubscript:@"kMDItemIdentifier"];
          [v28 addVerboseEventForItem:208 bundleID:v29 identifier:v30];

          BOOL v22 = 0;
LABEL_43:

          goto LABEL_44;
        }
LABEL_17:
        id v31 = [(SKGProcessor *)self copyContentTypeFromRecord:v6];
        CFStringRef v32 = v31;
        if (v31)
        {
          id v51 = v31;
          id v52 = v13;
          unint64_t v33 = +[UTType typeWithIdentifier:v31];
          if (v33)
          {
            long long v59 = 0u;
            long long v60 = 0u;
            long long v57 = 0u;
            long long v58 = 0u;
            CFStringRef v34 = +[SKGProcessorContext sharedContext];
            CFStringRef v35 = [v34 embeddingExcludeContentTypes];

            id v36 = [v35 countByEnumeratingWithState:&v57 objects:v62 count:16];
            if (v36)
            {
              id v37 = v36;
              uint64_t v38 = *(void *)v58;
              while (2)
              {
                for (i = 0; i != v37; i = (char *)i + 1)
                {
                  if (*(void *)v58 != v38) {
                    objc_enumerationMutation(v35);
                  }
                  if ([v33 conformsToType:*(void *)(*((void *)&v57 + 1) + 8 * i)])
                  {
                    CFStringRef v45 = +[SKGActivityJournal sharedJournal];
                    CFStringRef v46 = [v6 objectForKeyedSubscript:@"_kMDItemBundleID"];
                    id v50 = [v6 objectForKeyedSubscript:@"kMDItemIdentifier"];
                    [v45 addVerboseEventForItem:208 bundleID:v46 identifier:v50];

                    goto LABEL_39;
                  }
                }
                id v37 = [v35 countByEnumeratingWithState:&v57 objects:v62 count:16];
                if (v37) {
                  continue;
                }
                break;
              }
            }
          }
          long long v55 = 0u;
          long long v56 = 0u;
          long long v53 = 0u;
          long long v54 = 0u;
          unint64_t v40 = +[SKGProcessorContext sharedContext];
          CFStringRef v35 = [v40 embeddingExtractionAttributes];

          id v41 = [v35 countByEnumeratingWithState:&v53 objects:v61 count:16];
          if (v41)
          {
            id v42 = v41;
            uint64_t v43 = *(void *)v54;
            while (2)
            {
              for (j = 0; j != v42; j = (char *)j + 1)
              {
                if (*(void *)v54 != v43) {
                  objc_enumerationMutation(v35);
                }
                if ([(SKGProcessor *)self recordContainsValue:v6 key:*(void *)(*((void *)&v53 + 1) + 8 * (void)j)])
                {
                  BOOL v22 = 1;
                  id v13 = v52;
                  goto LABEL_41;
                }
              }
              id v42 = [v35 countByEnumeratingWithState:&v53 objects:v61 count:16];
              if (v42) {
                continue;
              }
              break;
            }
          }

          CFStringRef v35 = +[SKGActivityJournal sharedJournal];
          CFStringRef v45 = [v6 objectForKeyedSubscript:@"_kMDItemBundleID"];
          CFStringRef v46 = [v6 objectForKeyedSubscript:@"kMDItemIdentifier"];
          [v35 addVerboseEventForItem:209 bundleID:v45 identifier:v46];
LABEL_39:
          id v13 = v52;

          BOOL v22 = 0;
LABEL_41:
          CFStringRef v32 = v51;
        }
        else
        {
          CFStringRef v47 = +[SKGActivityJournal sharedJournal];
          CFStringRef v48 = [v6 objectForKeyedSubscript:@"_kMDItemBundleID"];
          id v49 = [v6 objectForKeyedSubscript:@"kMDItemIdentifier"];
          [v47 addVerboseEventForItem:208 bundleID:v48 identifier:v49];

          BOOL v22 = 0;
        }

        goto LABEL_43;
      }
    }
  }
  BOOL v22 = 0;
LABEL_10:

  return v22;
}

- (BOOL)canGenerateEmbeddingsForMailRecord:(id)a3 bundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = v7;
  if (v7) {
    id v9 = v7;
  }
  else {
    id v9 = [(SKGProcessor *)self copyBundleIdentifierFromRecord:v6];
  }
  uint64_t v10 = v9;
  if ((sub_10004A954(v9) & 1) != 0 || sub_10004A9D0(v10, v11))
  {
    id v12 = +[SKGProcessor copyMailboxesFromRecord:v6];
    unsigned __int8 v13 = [v12 containsObject:@"mailbox.junk"];
    signed int v14 = [v6 objectForKeyedSubscript:@"kMDItemIsLikelyJunk"];
    if (v14)
    {
      id v15 = [v6 objectForKeyedSubscript:@"kMDItemIsLikelyJunk"];
      unsigned __int8 v16 = [v15 isEqualToNumber:&off_1000E6318];
    }
    else
    {
      unsigned __int8 v16 = 1;
    }

    char v17 = v16 & ~v13;
  }
  else
  {
    char v17 = 1;
  }

  return v17;
}

- (BOOL)canGenerateEmbeddingsForFPRecord:(id)a3 bundleID:(id)a4
{
  id v5 = a3;
  id v6 = [(SKGProcessor *)self copyFileProviderIDFromRecord:v5];
  if (v6)
  {
    id v7 = [(SKGProcessor *)self copyNumberValueFromRecord:v5 key:@"_kMDItemRequiresImport"];
    unsigned int v8 = v7;
    if (v7) {
      unsigned __int8 v9 = [v7 BOOLValue];
    }
    else {
      unsigned __int8 v9 = 0;
    }
  }
  else
  {
    unsigned __int8 v9 = 1;
  }

  return v9;
}

- (BOOL)shouldGenerateEmbeddingsForRecord:(id)a3 bundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = v7;
  if (v7) {
    id v9 = v7;
  }
  else {
    id v9 = [(SKGProcessor *)self copyBundleIdentifierFromRecord:v6];
  }
  uint64_t v10 = v9;
  unsigned int v11 = +[SKGProcessorContext sharedContext];
  id v12 = [v11 embeddingExcludeBundles];
  unsigned __int8 v13 = [v12 containsObject:v10];

  if ((v13 & 1) == 0)
  {
    id v15 = [(SKGProcessor *)self copyDomainIdentifierFromRecord:v6];
    unsigned __int8 v16 = +[SKGProcessorContext sharedContext];
    char v17 = [v16 embeddingExcludeDomainIdentifier];
    unsigned __int8 v18 = [v17 containsObject:v15];

    if ((v18 & 1) != 0
      || ![(SKGProcessor *)self canGenerateEmbeddingsForFPRecord:v6 bundleID:v10]|| ![(SKGProcessor *)self canGenerateEmbeddingsForMailRecord:v6 bundleID:v10])
    {
      goto LABEL_21;
    }
    if (sub_10004A918(v10, v19))
    {
      id v20 = [(SKGProcessor *)self copyStringValueFromRecord:v6 key:@"kMDItemCalendarHolidayIdentifier"];
      id v21 = v20;
      if (v20 && ([v20 isEqualToString:@"Y"] & 1) != 0)
      {

LABEL_21:
        BOOL v14 = 0;
        goto LABEL_22;
      }
    }
    uint64_t v31 = 0;
    id v22 = [(SKGProcessor *)self copyNumberValueFromRecord:v6 key:@"_kMDItemTextContentIndexExists"];
    if (v22
      || (id v22 = [(SKGProcessor *)self copySnippetFromRecord:v6]) != 0
      || (id v22 = [(SKGProcessor *)self copyTextContentFromRecord:v6]) != 0)
    {
    }
    else
    {
      id v27 = [(SKGProcessor *)self copyFileProviderIDFromRecord:v6];
      if (v27)
      {
        id v28 = v27;
        id v29 = [(SKGProcessor *)self copyContentURLFromRecord:v6];
        unsigned __int8 v30 = [v29 isFileURL];

        if (v30) {
          goto LABEL_19;
        }
      }
    }
    if (![(SKGProcessor *)self extractContentFromRecord:v6 bundleID:v10 content:0 maxChunkCountPtr:0 textLength:&v31])
    {
      unint64_t v23 = +[SKGActivityJournal sharedJournal];
      id v24 = [v6 objectForKeyedSubscript:@"_kMDItemBundleID"];
      CFStringRef v25 = [v6 objectForKeyedSubscript:@"kMDItemIdentifier"];
      [v23 addVerboseEventForItem:210 bundleID:v24 identifier:v25];

      goto LABEL_21;
    }
LABEL_19:
    BOOL v14 = 1;
LABEL_22:

    goto LABEL_23;
  }
  BOOL v14 = 0;
LABEL_23:

  return v14;
}

- (BOOL)isStringOnlyNumbersOrPunctuationSpaces:(id)a3
{
  id v3 = a3;
  id v4 = +[NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"^[0-9[:punct:]\\s]+$"];
  unsigned __int8 v5 = [v4 evaluateWithObject:v3];

  return v5;
}

+ (BOOL)docContentExceedsMaxAllowedSize:(id)a3
{
  id v3 = a3;
  unint64_t v4 = +[SKGProcessor getHTMLContentByteSizeForRecord:v3];
  unint64_t v5 = +[SKGProcessor getTextContentByteSizeForRecord:v3];

  return v5 + v4 > 0x100000;
}

+ (BOOL)docIsTrashOrJunkMail:(id)a3
{
  id v3 = +[SKGProcessor copyMailboxesFromRecord:a3];
  if ([v3 containsObject:CSMailboxTrash]) {
    unsigned __int8 v4 = 1;
  }
  else {
    unsigned __int8 v4 = [v3 containsObject:CSMailboxJunk];
  }

  return v4;
}

- (BOOL)needsSuggestedEventsForRecord:(id)a3 bundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    unsigned int v8 = +[SKGProcessor sharedProcessor];
    unsigned int v9 = [v8 recordIsValid:v6];

    if (v9)
    {
      id v10 = [(SKGProcessor *)self copySuggestedEventsVersionFromRecord:v6];
      unsigned int v11 = v10;
      if (v10
        && (unsigned int v12 = [v10 intValue],
            +[SKGProcessorContext sharedContext],
            unsigned __int8 v13 = objc_claimAutoreleasedReturnValue(),
            id v14 = [v13 suggestedEventsVersion],
            v13,
            v14 == (id)(int)v12))
      {
        unsigned __int8 v15 = 0;
      }
      else
      {
        if (v7)
        {
          id v16 = v7;
        }
        else
        {
          id v16 = [(SKGProcessor *)self copyBundleIdentifierFromRecord:v6];
          if (!v16)
          {
            unsigned __int8 v15 = 1;
            goto LABEL_11;
          }
        }
        char v17 = +[SKGProcessorContext sharedContext];
        unsigned __int8 v18 = [v17 suggestedEventsIncludeBundles];
        unsigned __int8 v15 = [v18 containsObject:v16];
      }
LABEL_11:

      goto LABEL_12;
    }
  }
  unsigned __int8 v15 = 0;
LABEL_12:

  return v15;
}

- (BOOL)shouldGenerateSuggestedEventsForRecord:(id)a3 bundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [(SKGProcessor *)self copyBundleIdentifierFromRecord:v6];
    if (!v9) {
      goto LABEL_5;
    }
  }
  id v10 = +[SKGProcessorContext sharedContext];
  unsigned int v11 = [v10 suggestedEventsIncludeBundles];
  unsigned int v12 = [v11 containsObject:v9];

  if (!v12) {
    goto LABEL_14;
  }
LABEL_5:
  if (!+[SKGProcessor recordHasTextContent:v6]
    && !+[SKGProcessor recordHasHTMLContent:v6])
  {
    goto LABEL_14;
  }
  if (+[SKGProcessor docContentExceedsMaxAllowedSize:v6])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v26 = 0;
      unsigned __int8 v13 = "**** shouldGenerateSuggestedEventsForRecord: ignoring doc as content exceeds max allowed size";
      id v14 = (uint8_t *)&v26;
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v13, v14, 2u);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  if (+[SKGProcessor docIsTrashOrJunkMail:v6])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v25 = 0;
      unsigned __int8 v13 = "**** shouldGenerateSuggestedEventsForRecord: ignoring doc as trash or spam email";
      id v14 = (uint8_t *)&v25;
      goto LABEL_13;
    }
LABEL_14:
    BOOL v15 = 0;
    goto LABEL_15;
  }
  id v17 = [(SKGProcessor *)self copyFileProviderIDFromRecord:v6];

  if (v17)
  {
    id v18 = [(SKGProcessor *)self copyNumberValueFromRecord:v6 key:@"_kMDItemRequiresImport"];
    id v19 = [(SKGProcessor *)self copyContentTypeFromRecord:v6];
    id v20 = v19;
    BOOL v15 = v18
       && v19
       && [v18 BOOLValue]
       && ![v20 isEqualToString:@"public.folder"];
  }
  else
  {
    id v21 = [(SKGProcessor *)self copyNumberValueFromRecord:v6 key:@"_kMDItemTextContentIndexExists"];
    id v18 = v21;
    if (v21 && [v21 intValue])
    {
      BOOL v22 = 0;
    }
    else
    {
      id v23 = [(SKGProcessor *)self copySnippetFromRecord:v6];
      if (v23)
      {
        BOOL v22 = 0;
      }
      else
      {
        id v24 = [(SKGProcessor *)self copyTextContentFromRecord:v6];
        BOOL v22 = v24 == 0;
      }
    }
    BOOL v15 = !v22;
  }

LABEL_15:
  return v15;
}

@end