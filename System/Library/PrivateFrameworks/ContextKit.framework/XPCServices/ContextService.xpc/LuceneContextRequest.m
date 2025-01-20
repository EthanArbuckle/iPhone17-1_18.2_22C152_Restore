@interface LuceneContextRequest
+ (BOOL)_looksLikeTitleBarUIElement:(id)a3;
+ (id)hostToCapitalizedName:(id)a3;
+ (id)lookupTreasureMapForDomainHierarchy:(id)a3 fromTreasureMap:(id)a4 intoSet:(id)a5 isRelaxedMatchOut:(BOOL *)a6;
+ (id)reverseFQDN:(id)a3;
+ (id)setOfLinewiseStringsFromFieldValue:(id)a3;
+ (id)stripHostToDomain:(id)a3 level:(unint64_t)a4;
+ (void)_addTopicsForUrl:(id)a3 withEngine:(id)a4 documentVisitor:(id)a5 toResponse:(id)a6;
+ (void)addTopicsForURL:(id)a3 withEngine:(id)a4 toResponse:(id)a5;
+ (void)initialize;
- (BOOL)_isIntermediateNameBigramCandidate:(id)a3 tokenB:(id)a4 bothStartUppercase:(BOOL)a5;
- (BOOL)_isLikelyLabel:(id)a3;
- (BOOL)_isRelevantUIForExtraction:(id)a3;
- (BOOL)debug;
- (BOOL)debugLogEnabled;
- (BOOL)forceNoResults;
- (BOOL)isLanguageSupported:(id)a3;
- (CKContextRequest)request;
- (CKContextResponse)response;
- (ContextConfiguration)config;
- (LuceneContextEngine)engine;
- (LuceneContextRequest)initWithEngine:(id)a3 forRequest:(id)a4;
- (OrgApacheLuceneDocumentDocumentStoredFieldVisitor)docVisitor;
- (char)charBuffer;
- (id)_addHomeAppExtractionResults:(id)a3;
- (id)_bestTypeVariantForTokenInfo:(id)a3 allowingAllCaps:(BOOL)a4;
- (id)_bigramInfoForTokenA:(id)a3 tokenB:(id)a4 bigram:(id)a5 bothStartUppercase:(BOOL)a6;
- (id)_computeHashesWithSeed:(int)a3 forBytesRef:(id)a4 reuse:(id)a5;
- (id)_constructQuery;
- (id)_determineTitleFromUIElements:(id)a3;
- (id)_getTagTypeForExtractionItemType:(unint64_t)a3;
- (id)_lookupBigramTermForTokenA:(id)a3 tokenB:(id)a4 tokenTypeOut:(unint64_t *)a5 docIdOut:(int *)a6;
- (id)_processResult:(int)a3 score:(float)a4 relativeScore:(float)a5;
- (id)_readTermInfo:(id)a3 tokenTypeOut:(unint64_t *)a4 weightOut:(float *)a5 docIdOut:(int *)a6;
- (id)_resultForBigramInfo:(id)a3 minPrefix:(int64_t)a4;
- (id)_resultForTokenInfo:(id)a3 minPrefix:(int64_t)a4;
- (id)_sortGroupFilterUIElements;
- (id)_tokenInfoForToken:(id)a3;
- (id)_tokenStringForText:(id)a3;
- (id)inspectTitle:(id)a3 titleForTokenization:(id)a4 conditionals:(id)a5;
- (id)mergeDuplicateResults:(id)a3;
- (id)simplifiedDesiredLanguageTags;
- (id)textTermsEnum;
- (void)_addTermResults;
- (void)_augmentResult:(id)a3 withDocId:(int)a4 checkLanguageRedirect:(BOOL)a5;
- (void)_blendResults;
- (void)_determineSurroundingEntities:(id)a3 withUIElementToResultsMapping:(id)a4;
- (void)_discardTokenInfos;
- (void)_processResults:(id)a3 topK:(unint64_t)a4;
- (void)_rerankFoldedResults:(id)a3;
- (void)_searchTopKWithQuery:(id)a3 topK:(unint64_t)a4;
- (void)_tokenizeText;
- (void)addCoreNLPTags;
- (void)addDebugStringTo:(id)a3 withPrefix:(id)a4 forQuery:(id)a5;
- (void)addExtraQueryCompletions;
- (void)addRequestFingerprint;
- (void)addStructuredExtraction;
- (void)augmentResultsWithTags;
- (void)configAnalyzerForLanguage:(id)a3;
- (void)dealloc;
- (void)discard;
- (void)filterResultsByTags:(id)a3;
- (void)findResultsWithReply:(id)a3;
- (void)postprocessAddQuery:(id)a3;
- (void)setCharBuffer:(char *)a3;
- (void)setConfig:(id)a3;
- (void)setDebug:(BOOL)a3;
- (void)setDebugLogEnabled:(BOOL)a3;
- (void)setDocVisitor:(id)a3;
- (void)setEngine:(id)a3;
- (void)setForceNoResults:(BOOL)a3;
- (void)setRequest:(id)a3;
- (void)setResponse:(id)a3;
@end

@implementation LuceneContextRequest

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v42 = +[OrgApacheLuceneSearchBooleanClause_OccurEnum values];
    uint64_t v2 = [v42 objectAtIndex:0];
    v3 = (void *)qword_1005630C0;
    qword_1005630C0 = v2;

    uint64_t v4 = [v42 objectAtIndex:1];
    v5 = (void *)qword_1005630C8;
    qword_1005630C8 = v4;

    uint64_t v6 = [v42 objectAtIndex:2];
    v7 = (void *)qword_1005630D0;
    qword_1005630D0 = v6;

    +[OrgApacheLuceneSearchBooleanQuery setMaxClauseCountWithInt:2048];
    uint64_t v8 = ContextKitErrorDomain;
    v9 = +[NSDictionary dictionaryWithObject:@"Input language is not supported" forKey:NSLocalizedFailureReasonErrorKey];
    uint64_t v10 = +[NSError errorWithDomain:v8 code:4 userInfo:v9];
    v11 = (void *)qword_1005630D8;
    qword_1005630D8 = v10;

    uint64_t v12 = +[NSCharacterSet lowercaseLetterCharacterSet];
    v13 = (void *)qword_1005630E0;
    qword_1005630E0 = v12;

    uint64_t v14 = +[NSCharacterSet uppercaseLetterCharacterSet];
    v15 = (void *)qword_1005630E8;
    qword_1005630E8 = v14;

    uint64_t v16 = +[NSCharacterSet alphanumericCharacterSet];
    v17 = (void *)qword_1005630B8;
    qword_1005630B8 = v16;

    v18 = +[NSMutableCharacterSet alphanumericCharacterSet];
    v19 = +[NSCharacterSet punctuationCharacterSet];
    [v18 formUnionWithCharacterSet:v19];

    v20 = (void *)qword_1005630F0;
    qword_1005630F0 = (uint64_t)v18;
    id v21 = v18;

    uint64_t v22 = +[NSMutableCharacterSet whitespaceAndNewlineCharacterSet];
    v23 = (void *)qword_1005630F8;
    qword_1005630F8 = v22;

    v24 = (void *)qword_1005630F8;
    v25 = +[NSCharacterSet punctuationCharacterSet];
    [v24 formUnionWithCharacterSet:v25];

    uint64_t v26 = +[TokenInfo ignoreUnknownTokenSentinel];
    v27 = (void *)qword_100563100;
    qword_100563100 = v26;

    uint64_t v28 = +[TokenInfo ignoreStopwordTokenSentinel];
    v29 = (void *)qword_100563108;
    qword_100563108 = v28;

    uint64_t v30 = +[BigramInfo ignoreUnknownBigramSentinel];
    v31 = (void *)qword_100563110;
    qword_100563110 = v30;

    uint64_t v32 = +[BigramInfo ignoreStopwordBigramSentinel];
    v33 = (void *)qword_100563118;
    qword_100563118 = v32;

    v34 = [[OrgApacheLuceneIndexTerm alloc] initWithNSString:@"text" withNSString:@"I"];
    v35 = (void *)qword_100563120;
    qword_100563120 = (uint64_t)v34;

    uint64_t v36 = +[NSSet setWithArray:&off_1004B1D08];
    v37 = (void *)qword_100563128;
    qword_100563128 = v36;

    uint64_t v38 = +[NSSet setWithArray:&off_1004B1D20];
    v39 = (void *)qword_100563130;
    qword_100563130 = v38;

    uint64_t v40 = +[NSSet setWithArray:&__NSArray0__struct];
    v41 = (void *)qword_100563138;
    qword_100563138 = v40;
  }
}

- (void)_discardTokenInfos
{
  [(NSMapTable *)self->_tokenInfos removeAllObjects];
  [(NSMapTable *)self->_bigramInfos removeAllObjects];
  tokenInfos = self->_tokenInfos;
  self->_tokenInfos = 0;

  bigramInfos = self->_bigramInfos;
  self->_bigramInfos = 0;

  tokenInfosSequence = self->_tokenInfosSequence;
  self->_tokenInfosSequence = 0;

  bigramInfosSequence = self->_bigramInfosSequence;
  self->_bigramInfosSequence = 0;
}

- (void)discard
{
  [(LuceneContextRequest *)self _discardTokenInfos];
  textTermsEnum = self->_textTermsEnum;
  self->_textTermsEnum = 0;

  request = self->_request;
  self->_request = 0;

  response = self->_response;
  self->_response = 0;

  objc_storeWeak((id *)&self->_engine, 0);
  searcher = self->_searcher;
  self->_searcher = 0;

  [(OrgApacheLuceneAnalysisAnalyzer *)self->_analyzer close];
  analyzer = self->_analyzer;
  self->_analyzer = 0;

  weakKeywordTermResults = self->_weakKeywordTermResults;
  if (weakKeywordTermResults)
  {
    [(NSMutableDictionary *)weakKeywordTermResults removeAllObjects];
    v9 = self->_weakKeywordTermResults;
    self->_weakKeywordTermResults = 0;
  }
  termResults = self->_termResults;
  if (termResults)
  {
    [(NSMutableArray *)termResults removeAllObjects];
    v11 = self->_termResults;
    self->_termResults = 0;
  }
  termResultsWithDocument = self->_termResultsWithDocument;
  if (termResultsWithDocument)
  {
    [(NSMutableArray *)termResultsWithDocument removeAllObjects];
    v13 = self->_termResultsWithDocument;
    self->_termResultsWithDocument = 0;
  }
  termQueryInterceptor = self->_termQueryInterceptor;
  self->_termQueryInterceptor = 0;

  phraseQueryInterceptor = self->_phraseQueryInterceptor;
  self->_phraseQueryInterceptor = 0;

  secondaryInterceptor = self->_secondaryInterceptor;
  self->_secondaryInterceptor = 0;

  perDocumentObjects = self->_perDocumentObjects;
  if (perDocumentObjects)
  {
    NSFreeMapTable(perDocumentObjects);
    v18 = self->_perDocumentObjects;
    self->_perDocumentObjects = 0;
  }
  hashesTokenReuse = self->_hashesTokenReuse;
  self->_hashesTokenReuse = 0;

  extractTermsReuse = self->_extractTermsReuse;
  if (extractTermsReuse)
  {
    [(NSMutableSet *)extractTermsReuse removeAllObjects];
    id v21 = self->_extractTermsReuse;
    self->_extractTermsReuse = 0;
  }
  fingerprints = self->_fingerprints;
  if (fingerprints)
  {
    [(NSMutableDictionary *)fingerprints removeAllObjects];
    v23 = self->_fingerprints;
    self->_fingerprints = 0;
  }
  fingerprintsPrimary = self->_fingerprintsPrimary;
  if (fingerprintsPrimary)
  {
    [(NSMutableDictionary *)fingerprintsPrimary removeAllObjects];
    v25 = self->_fingerprintsPrimary;
    self->_fingerprintsPrimary = 0;
  }
  free(self->_charBuffer);
  self->_charBuffer = 0;
}

- (void)dealloc
{
  [(LuceneContextRequest *)self discard];
  v3.receiver = self;
  v3.super_class = (Class)LuceneContextRequest;
  [(LuceneContextRequest *)&v3 dealloc];
}

- (LuceneContextRequest)initWithEngine:(id)a3 forRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v78.receiver = self;
  v78.super_class = (Class)LuceneContextRequest;
  uint64_t v8 = [(LuceneContextRequest *)&v78 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_request, a4);
    unsigned __int8 v10 = [v7 debug];
    v9->_debug = v10;
    if (v10) {
      unsigned __int8 v11 = 1;
    }
    else {
      unsigned __int8 v11 = [v7 timing];
    }
    v9->_timing = v11;
    v9->_debugLogEnabled = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    id v12 = objc_storeWeak((id *)&v9->_engine, v6);
    v9->_nMaxDoc = [v6 maxDoc];

    id WeakRetained = objc_loadWeakRetained((id *)&v9->_engine);
    v9->_nTerms = (int64_t)[WeakRetained numTerms];

    id v14 = objc_loadWeakRetained((id *)&v9->_engine);
    uint64_t v15 = [v14 bloomFilter];
    bloomFilter = v9->_bloomFilter;
    v9->_bloomFilter = (_PASBloomFilter *)v15;

    id v17 = objc_loadWeakRetained((id *)&v9->_engine);
    v9->_useBloomFilter = [v17 useBloomFilter];

    uint64_t v18 = +[ContextConfiguration sharedInstance];
    config = v9->_config;
    v9->_config = (ContextConfiguration *)v18;

    id v20 = [v7 fingerprintMax];
    id v21 = [(ContextConfiguration *)v9->_config maxFingerprints];
    if (v20 >= v21) {
      id v20 = v21;
    }
    if (v20)
    {
      uint64_t v22 = [(OrgApacheLuceneUtilPriorityQueue *)[LeastNumberPriorityQueue alloc] initWithInt:v20 withBoolean:1];
      minHashPriorityQueue = v9->_minHashPriorityQueue;
      v9->_minHashPriorityQueue = v22;
    }
    v24 = [[ComAppleContextkitUtilBytesRefPool alloc] initWithInt:0x8000];
    bytesRefPool = v9->_bytesRefPool;
    v9->_bytesRefPool = v24;

    uint64_t v26 = objc_alloc_init(OrgApacheLuceneDocumentDocumentStoredFieldVisitor);
    docVisitor = v9->_docVisitor;
    v9->_docVisitor = v26;

    uint64_t v28 = v9->_docVisitor;
    v29 = [[OrgApacheLuceneUtilBytesRef alloc] initWithInt:4096];
    [(OrgApacheLuceneIndexStoredFieldVisitor *)v28 setReusableBytesRefWithOrgApacheLuceneUtilBytesRef:v29];

    uint64_t v30 = (_PASBloomFilterHashArray *)[(_PASBloomFilter *)v9->_bloomFilter newHashesArray];
    hashesTokenReuse = v9->_hashesTokenReuse;
    v9->_hashesTokenReuse = v30;

    uint64_t v32 = [OrgApacheLuceneSearchIndexSearcher alloc];
    id v33 = objc_loadWeakRetained((id *)&v9->_engine);
    v34 = [v33 reader];
    v35 = [(OrgApacheLuceneSearchIndexSearcher *)v32 initWithOrgApacheLuceneIndexIndexReader:v34];
    searcher = v9->_searcher;
    v9->_searcher = v35;

    uint64_t v37 = +[NSMapTable mapTableWithKeyOptions:0 valueOptions:0];
    tokenInfos = v9->_tokenInfos;
    v9->_tokenInfos = (NSMapTable *)v37;

    uint64_t v39 = +[NSMapTable mapTableWithKeyOptions:0 valueOptions:0];
    bigramInfos = v9->_bigramInfos;
    v9->_bigramInfos = (NSMapTable *)v39;

    uint64_t v41 = objc_opt_new();
    tokenInfosSequence = v9->_tokenInfosSequence;
    v9->_tokenInfosSequence = (NSMutableArray *)v41;

    uint64_t v43 = objc_opt_new();
    bigramInfosSequence = v9->_bigramInfosSequence;
    v9->_bigramInfosSequence = (NSMutableArray *)v43;

    uint64_t v45 = objc_opt_new();
    termResults = v9->_termResults;
    v9->_termResults = (NSMutableArray *)v45;

    v47 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:5];
    weakKeywordTermResults = v9->_weakKeywordTermResults;
    v9->_weakKeywordTermResults = v47;

    uint64_t v49 = objc_opt_new();
    termResultsWithDocument = v9->_termResultsWithDocument;
    v9->_termResultsWithDocument = (NSMutableArray *)v49;

    v51 = [ScoreInterceptTargetWithCallback alloc];
    v76[0] = _NSConcreteStackBlock;
    v76[1] = 3221225472;
    v76[2] = sub_1002B8B80;
    v76[3] = &unk_10048BDE8;
    v52 = v9;
    v77 = v52;
    v53 = [(ScoreInterceptTargetWithCallback *)v51 initWithCallback:v76];
    phraseQueryInterceptor = v52->_phraseQueryInterceptor;
    v52->_phraseQueryInterceptor = v53;

    v55 = [ScoreInterceptTargetWithCallback alloc];
    v74[0] = _NSConcreteStackBlock;
    v74[1] = 3221225472;
    v74[2] = sub_1002B8C44;
    v74[3] = &unk_10048BDE8;
    v56 = v52;
    v75 = v56;
    v57 = [(ScoreInterceptTargetWithCallback *)v55 initWithCallback:v74];
    termQueryInterceptor = v56->_termQueryInterceptor;
    v56->_termQueryInterceptor = v57;

    v59 = [ScoreInterceptTargetWithCallback alloc];
    v72[0] = _NSConcreteStackBlock;
    v72[1] = 3221225472;
    v72[2] = sub_1002B8D08;
    v72[3] = &unk_10048BDE8;
    v60 = v56;
    v73 = v60;
    v61 = [(ScoreInterceptTargetWithCallback *)v59 initWithCallback:v72];
    secondaryInterceptor = v60->_secondaryInterceptor;
    v60->_secondaryInterceptor = v61;

    v60->_charBuffer = (char *)malloc_type_calloc(1uLL, 0x100uLL, 0x33D96854uLL);
    uint64_t v63 = [v6 nGramBreakingSeparators];
    nGramBreakingSeparators = v60->_nGramBreakingSeparators;
    v60->_nGramBreakingSeparators = (NSCharacterSet *)v63;

    uint64_t v65 = [v6 allowedNGramSeparators];
    allowedNGramSeparators = v60->_allowedNGramSeparators;
    v60->_allowedNGramSeparators = (NSCharacterSet *)v65;

    uint64_t v67 = [v6 quotedTokenCharacterSet];
    quotedTokenCharacterSet = v60->_quotedTokenCharacterSet;
    v60->_quotedTokenCharacterSet = (NSCharacterSet *)v67;

    uint64_t v69 = [v6 partialNGramCharacterSet];
    partialNGramCharacterSet = v60->_partialNGramCharacterSet;
    v60->_partialNGramCharacterSet = (NSCharacterSet *)v69;
  }
  return v9;
}

- (BOOL)isLanguageSupported:(id)a3
{
  id v4 = a3;
  v5 = [(ContextConfiguration *)self->_config luceneSupportedLanguages];
  if ([v5 count])
  {
    if (!v4)
    {
      unsigned __int8 v6 = 0;
      goto LABEL_7;
    }
    if (([v5 containsObject:v4] & 1) == 0)
    {
      uint64_t v7 = +[LanguageUtilities simplifyLanguageTag:v4];

      unsigned __int8 v6 = [v5 containsObject:v7];
      id v4 = (id)v7;
      goto LABEL_7;
    }
  }
  unsigned __int8 v6 = 1;
LABEL_7:

  return v6;
}

- (void)configAnalyzerForLanguage:(id)a3
{
  id v9 = a3;
  if (+[LanguageUtilities isChineseLanguageTag:](LanguageUtilities, "isChineseLanguageTag:")
    || +[LanguageUtilities isJapaneseLanguageTag:v9])
  {
    id v4 = (OrgApacheLuceneAnalysisAnalyzer *)objc_opt_new();
    analyzer = self->_analyzer;
    self->_analyzer = v4;

    *(void *)&self->_minTokenLength = 0x2000000001;
    unint64_t v6 = 2;
  }
  else
  {
    uint64_t v7 = (OrgApacheLuceneAnalysisAnalyzer *)objc_opt_new();
    uint64_t v8 = self->_analyzer;
    self->_analyzer = v7;

    *(void *)&self->_minTokenLength = 0x2000000003;
    unint64_t v6 = 5;
  }
  self->_minTokenLengthPrimary = v6;
}

- (id)simplifiedDesiredLanguageTags
{
  id v3 = objc_alloc_init((Class)NSMutableOrderedSet);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(CKContextRequest *)self->_request desiredLanguageTags];
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = +[LanguageUtilities simplifyLanguageTag:*(void *)(*((void *)&v11 + 1) + 8 * i)];
        [v3 addObject:v9];
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)findResultsWithReply:(id)a3
{
  v122 = (void (**)(id, void))a3;
  uint64_t v161 = mach_absolute_time();
  uint64_t v155 = 0;
  v156 = &v155;
  uint64_t v157 = 0x3032000000;
  v158 = sub_1002B7AA0;
  v159 = sub_1002B7AB0;
  v128 = self;
  id v160 = [(CKContextRequest *)self->_request languageTag];
  id v4 = self;
  id v5 = objc_alloc((Class)CKContextResponse);
  id v6 = objc_opt_new();
  uint64_t v7 = (CKContextResponse *)objc_msgSend(v5, "initWithResults:requestType:", v6, -[CKContextRequest type](v4->_request, "type"));
  response = v4->_response;
  v4->_response = v7;

  id v9 = v4;
  unsigned __int8 v10 = v4->_response;
  [(ContextConfiguration *)v4->_config hideCompletionsTimeLimit];
  -[CKContextResponse setHideCompletionsTimeLimit:](v10, "setHideCompletionsTimeLimit:");
  [(CKContextResponse *)v4->_response setMustPrefixMatchLength:[(ContextConfiguration *)v4->_config mustPrefixMatchLength]];
  if ([(CKContextRequest *)v4->_request textIsRaw]
    && ![(ContextConfiguration *)v4->_config rawTextEnabled]
    && [(CKContextRequest *)v4->_request type] != (id)2)
  {
    if (v4->_debug) {
      [(CKContextResponse *)v4->_response addDebug:@"RawText mode is disabled"];
    }
    id v11 = &_os_log_default;
    BOOL v12 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (v12) {
      sub_1002C9294(v12, v13, v14);
    }

    id v9 = v128;
    [(CKContextRequest *)v128->_request setText:0];
  }
  uint64_t v15 = [(CKContextRequest *)v9->_request text];
  id v16 = &_os_log_default;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    id v17 = [v15 length];
    id v18 = [(CKContextRequest *)v128->_request type];
    v19 = [(CKContextRequest *)v128->_request languageTag];
    sub_1002C9220(v19, v172, (uint64_t)v17, (uint64_t)v18);
  }

  uint64_t v149 = 0;
  v150 = &v149;
  uint64_t v151 = 0x3032000000;
  v152 = sub_1002B7AA0;
  v153 = sub_1002B7AB0;
  id v154 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&v128->_engine);
  if ([WeakRetained fallbackModeEnabled])
  {
    unsigned __int8 v21 = [(ContextConfiguration *)v128->_config fallbackModeQuerySuggestionsEnabled];

    if ((v21 & 1) == 0)
    {
      uint64_t v22 = v128;
      if (v128->_debug)
      {
        CFStringRef v23 = @"Fallback mode; query suggestions are disabled";
LABEL_28:
        [(CKContextResponse *)v22->_response addDebug:v23];
        unsigned int v123 = 0;
        goto LABEL_62;
      }
      goto LABEL_29;
    }
  }
  else
  {
  }
  uint64_t v22 = v128;
  if ((unint64_t)[v15 length] < 3)
  {
    if (v128->_timing)
    {
      CFStringRef v23 = @"tSearch:0";
      goto LABEL_28;
    }
LABEL_29:
    unsigned int v123 = 0;
    goto LABEL_62;
  }
  v25 = [(ContextConfiguration *)v128->_config debugForceLanguageTag];

  if (v25)
  {
    uint64_t v26 = [(ContextConfiguration *)v128->_config debugForceLanguageTag];
    v27 = (void *)v156[5];
    v156[5] = v26;
  }
  v145[0] = _NSConcreteStackBlock;
  v145[1] = 3221225472;
  v145[2] = sub_1002BA51C;
  v145[3] = &unk_10048BE10;
  BOOL v148 = v25 == 0;
  v147 = &v155;
  v145[4] = v128;
  id v28 = v15;
  id v146 = v28;
  +[Util elapsedMillisForBlock:v145 enableTiming:v128->_timing];
  double v30 = v29;
  unsigned int v123 = [(LuceneContextRequest *)v128 isLanguageSupported:v156[5]];
  id v31 = [(id)v156[5] copy];
  [(CKContextResponse *)v128->_response setLanguageTag:v31];

  uint64_t v32 = [(CKContextResponse *)v128->_response languageTag];
  [(LuceneContextRequest *)v128 configAnalyzerForLanguage:v32];

  float v33 = v30;
  if (v123)
  {
    v144[0] = _NSConcreteStackBlock;
    v144[1] = 3221225472;
    v144[2] = sub_1002BA62C;
    v144[3] = &unk_10048B808;
    v144[4] = v128;
    +[Util elapsedMillisForBlock:v144 enableTiming:v128->_timing];
    double v35 = v34;
    if (v128->_debugLogEnabled)
    {
      id v36 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      {
        +[Util elapsedMillisSinceMachAbsolute:v161 nowTarget:&v161];
        sub_1002C91DC((uint64_t)v171, v39, v37, v38);
      }
    }
    v143[0] = _NSConcreteStackBlock;
    v143[1] = 3221225472;
    v143[2] = sub_1002BA634;
    v143[3] = &unk_1003F1428;
    uint64_t v40 = v128;
    v143[4] = v128;
    v143[5] = &v149;
    +[Util elapsedMillisForBlock:v143 enableTiming:v128->_timing];
    if (v128->_timing)
    {
      float v42 = v35;
      float v43 = v41;
      [(CKContextResponse *)v128->_response addDebug:@"tLanguageDetect:%f (%@), tTokenize:%f, tConstructQuery:%f", v33, v156[5], v42, v43];
    }
  }
  else
  {
    [(CKContextResponse *)v128->_response setError:qword_1005630D8];
    id v44 = [(CKContextRequest *)v128->_request type];
    if (v44 == (id)15 || v44 == (id)1)
    {
      id v45 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Safari request with unsupported language", buf, 2u);
      }
    }
    uint64_t v40 = v128;
    if (v128->_timing) {
      [(CKContextResponse *)v128->_response addDebug:@"tLanguageDetect:%f (%@)", v33, v156[5]];
    }
  }
  [(LuceneContextRequest *)v40 addRequestFingerprint];
  if (v40->_debug && v128->_timing)
  {
    *(void *)buf = 0;
    v166 = buf;
    uint64_t v167 = 0x3032000000;
    v168 = sub_1002B7AA0;
    v169 = sub_1002B7AB0;
    id v170 = 0;
    v140[0] = _NSConcreteStackBlock;
    v140[1] = 3221225472;
    v140[2] = sub_1002BA680;
    v140[3] = &unk_1003F1428;
    v142 = buf;
    id v141 = v28;
    +[Util elapsedMillisForBlock:v140 enableTiming:v128->_timing];
    double v47 = v46;
    unsigned int v48 = [(LuceneContextRequest *)v128 isLanguageSupported:*((void *)v166 + 5)];
    float v49 = v47;
    [(CKContextResponse *)v128->_response addDebug:@"tLanguageDetectLangId:%f (%@) mismatch:%i", v49, *((void *)v166 + 5), v123 ^ v48];

    _Block_object_dispose(buf, 8);
  }

  v50 = v24;
  v51 = v128;
  if (v128->_debugLogEnabled)
  {
    id v52 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      +[Util elapsedMillisSinceMachAbsolute:v161 nowTarget:&v161];
      sub_1002C9198((uint64_t)buf, v55, v53, v54);
    }

    v51 = v128;
  }
  if (!v150[5])
  {
    if (v123)
    {
      [(LuceneContextRequest *)v51 _addTermResults];
      if (v51->_timing) {
        [(CKContextResponse *)v51->_response addDebug:@"tSearch:0"];
      }
    }
    goto LABEL_58;
  }
  LODWORD(v56) = [(CKContextRequest *)v51->_request topk];
  config = v51->_config;
  if (!v56)
  {
    unint64_t v58 = [(ContextConfiguration *)config luceneQueryDefaultNumResults];
    goto LABEL_52;
  }
  unint64_t v56 = v56;
  if ([(ContextConfiguration *)config luceneQueryMaxNumResults] < v56)
  {
    unint64_t v58 = [(ContextConfiguration *)v51->_config luceneQueryMaxNumResults];
LABEL_52:
    unint64_t v56 = v58;
  }
  [(LuceneContextRequest *)v51 _searchTopKWithQuery:v150[5] topK:v56 + 20];
  v59 = [(CKContextResponse *)v51->_response results];
  if ([(NSMutableArray *)v51->_termResultsWithDocument count])
  {
    [v59 addObjectsFromArray:v51->_termResultsWithDocument];
    uint64_t v60 = [(LuceneContextRequest *)v51 mergeDuplicateResults:v59];

    v51 = v128;
    [(CKContextResponse *)v128->_response setResults:v60];
    v59 = (void *)v60;
  }
  if ((unint64_t)[v59 count] > v56) {
    objc_msgSend(v59, "removeObjectsInRange:", v56, (char *)objc_msgSend(v59, "count") - v56);
  }
  [(LuceneContextRequest *)v51 _blendResults];
  [(LuceneContextRequest *)v51 _addTermResults];

  v51 = v128;
LABEL_58:
  if (v51->_debugLogEnabled)
  {
    id v61 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      +[Util elapsedMillisSinceMachAbsolute:v161 nowTarget:&v161];
      sub_1002C90E4((uint64_t)v164, v64, v62, v63);
    }
  }
LABEL_62:
  _Block_object_dispose(&v149, 8);

  if (v128->_forceNoResults)
  {
    [(CKContextResponse *)v128->_response setResults:&__NSArray0__struct];
    if (v128->_debug) {
      [(CKContextResponse *)v128->_response addDebug:@"forceNoResults triggered"];
    }
  }
  [(CKContextResponse *)v128->_response results];
  long long v138 = 0u;
  long long v139 = 0u;
  long long v136 = 0u;
  long long v137 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  id v65 = [obj countByEnumeratingWithState:&v136 objects:v163 count:16];
  if (v65)
  {
    uint64_t v125 = *(void *)v137;
    do
    {
      id v126 = v65;
      for (i = 0; i != v126; i = (char *)i + 1)
      {
        if (*(void *)v137 != v125) {
          objc_enumerationMutation(obj);
        }
        uint64_t v67 = *(void **)(*((void *)&v136 + 1) + 8 * i);
        if ((uint64_t)[v67 minPrefix] >= 1) {
          [(CKContextResponse *)v128->_response setResultsNeedFiltering:1];
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v69 = v67;
          v70 = objc_opt_new();
          v71 = [v69 relatedItems];
          if (v71) {
            [v70 unionOrderedSet:v71];
          }
          v72 = objc_opt_class();
          v73 = [v69 relatedField];
          v74 = [v72 setOfLinewiseStringsFromFieldValue:v73];

          if (v74 && [v74 count]) {
            [v70 unionOrderedSet:v74];
          }
          v75 = [v69 topicId];
          if ([v75 length])
          {
            v76 = [v69 title];
            BOOL v77 = [v76 length] == 0;

            if (!v77)
            {
              v75 = [v69 title];
              objc_super v78 = +[NSCharacterSet URLPathAllowedCharacterSet];
              v79 = [v75 stringByAddingPercentEncodingWithAllowedCharacters:v78];
              v80 = +[NSString stringWithFormat:@"wiki\thttps://en.wikipedia.org/wiki/%@", v79];
              [v70 addObject:v80];

              goto LABEL_81;
            }
          }
          else
          {
LABEL_81:
          }
          if ([v70 count]) {
            v81 = v70;
          }
          else {
            v81 = 0;
          }
          [v69 setRelatedItems:v81];
        }
      }
      id v65 = [obj countByEnumeratingWithState:&v136 objects:v163 count:16];
    }
    while (v65);
  }

  v82 = v128;
  if ([(CKContextRequest *)v128->_request includeHigherLevelTopics])
  {
    v83 = [(CKContextRequest *)v128->_request url];
    if ([v83 length])
    {
      v84 = +[NSURL URLWithString:v83];
      v85 = objc_opt_class();
      id v86 = objc_loadWeakRetained((id *)&v128->_engine);
      [v85 _addTopicsForUrl:v84 withEngine:v86 documentVisitor:v128->_docVisitor toResponse:v128->_response];
    }
    v82 = v128;
  }
  if ((uint64_t)[(CKContextRequest *)v82->_request maxConstellationTopics] >= 1)
  {
    v127 = [(CKContextRequest *)v82->_request itemIds];
    id v87 = [v127 count];
    if (v87)
    {
      if ((unint64_t)v87 >= 0x1F5)
      {
        v88 = [v127 allKeys];
        id v89 = [v88 sortedArrayUsingSelector:"compare:"];

        id v90 = objc_alloc_init((Class)NSMutableDictionary);
        for (uint64_t j = 0; j != 500; ++j)
        {
          v92 = [v89 objectAtIndexedSubscript:j];
          v93 = [v127 objectForKeyedSubscript:v92];
          [v90 setObject:v93 forKeyedSubscript:v92];
        }
        id v94 = [v90 copy];

LABEL_112:
LABEL_114:
        if ([v94 count])
        {
          v130[0] = _NSConcreteStackBlock;
          v130[1] = 3221225472;
          v130[2] = sub_1002BA714;
          v130[3] = &unk_10048BA08;
          v130[4] = v128;
          id v131 = v94;
          +[Util elapsedMillisForBlock:v130 enableTiming:v128->_timing];
          if (v128->_timing)
          {
            float v107 = v106;
            [(CKContextResponse *)v128->_response addDebug:@"tConstellation:%f", v107];
          }
        }
        v82 = v128;
        goto LABEL_119;
      }
    }
    else
    {
      v95 = [(CKContextResponse *)v82->_response results];
      BOOL v96 = [v95 count] == 0;

      if (!v96)
      {
        v97 = objc_opt_new();
        long long v135 = 0u;
        long long v133 = 0u;
        long long v134 = 0u;
        long long v132 = 0u;
        v98 = [(CKContextResponse *)v128->_response results];
        id v99 = [v98 countByEnumeratingWithState:&v132 objects:v162 count:16];
        if (v99)
        {
          uint64_t v100 = *(void *)v133;
          do
          {
            for (k = 0; k != v99; k = (char *)k + 1)
            {
              if (*(void *)v133 != v100) {
                objc_enumerationMutation(v98);
              }
              v102 = [*(id *)(*((void *)&v132 + 1) + 8 * (void)k) topicId];
              if (v102)
              {
                v103 = [v97 objectForKey:v102];
                v104 = v103;
                if (v103)
                {
                  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v103 intValue] + 1);
                  v105 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v105 = &off_1004B1E38;
                }
                [v97 setObject:v105 forKey:v102];
              }
            }
            id v99 = [v98 countByEnumeratingWithState:&v132 objects:v162 count:16];
          }
          while (v99);
        }

        id v89 = v97;
        id v94 = v89;
        id v90 = v127;
        goto LABEL_112;
      }
    }
    id v94 = v127;
    goto LABEL_114;
  }
LABEL_119:
  if ([(ContextConfiguration *)v82->_config extraQueryCompletionsEnabled])
  {
    v82 = v128;
    [(LuceneContextRequest *)v128 addExtraQueryCompletions];
  }
  if ([(ContextConfiguration *)v82->_config coreNLPTaggingEnabled]
    || [(CKContextRequest *)v82->_request overrideEnableCoreNLPTagging])
  {
    v129[0] = _NSConcreteStackBlock;
    v129[1] = 3221225472;
    v129[2] = sub_1002BABC4;
    v129[3] = &unk_10048B808;
    v129[4] = v82;
    +[Util elapsedMillisForBlock:v129 enableTiming:v82->_timing];
    if (v82->_timing)
    {
      float v110 = v109;
      [(CKContextResponse *)v82->_response addDebug:@"tCoreNLP:%f", v110];
    }
  }
  if ([(ContextConfiguration *)v82->_config tagsEnabled]) {
    [(LuceneContextRequest *)v82 augmentResultsWithTags];
  }
  if ([(CKContextRequest *)v82->_request includeStructuredExtractionResults])[(LuceneContextRequest *)v82 addStructuredExtraction]; {
  v111 = [(CKContextRequest *)v82->_request allowedTopicTypeTags];
  }
  BOOL v112 = [v111 count] == 0;

  if (!v112)
  {
    v113 = [(CKContextRequest *)v128->_request allowedTopicTypeTags];
    [(LuceneContextRequest *)v128 filterResultsByTags:v113];
  }
  v114 = (void *)os_transaction_create();
  ((void (**)(id, CKContextResponse *))v122)[2](v122, v128->_response);
  v115 = +[MetricsLogging instance];
  v116 = [(CKContextRequest *)v128->_request text];
  id v117 = [v116 length];
  uint64_t v118 = v156[5];
  id v119 = [(CKContextRequest *)v128->_request type];
  id v120 = objc_loadWeakRetained((id *)&v128->_engine);
  v121 = [v120 indexId];
  [v115 recordInputLength:v117 languageTag:v118 languageSupported:v123 requestType:v119 indexId:v121];

  _Block_object_dispose(&v155, 8);
}

- (void)addExtraQueryCompletions
{
  unint64_t v3 = (unint64_t)[(CKContextRequest *)self->_request type];
  if (v3 <= 0xF && ((1 << v3) & 0x803A) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
    uint64_t v6 = [WeakRetained qidToQueriesMap];

    id v7 = objc_loadWeakRetained((id *)&self->_engine);
    uint64_t v8 = [v7 queriesArray];

    v72 = (void *)v6;
    if (v6)
    {
      if (v8)
      {
        id v9 = [(CKContextResponse *)self->_response results];
        id v10 = [v9 count];

        if (v10)
        {
          uint64_t v60 = v8;
          id v11 = [(CKContextResponse *)self->_response results];
          BOOL v12 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 3 * (void)[v11 count]);

          v73 = +[NSMutableSet set];
          uint64_t v67 = [(LuceneContextRequest *)self simplifiedDesiredLanguageTags];
          uint64_t v13 = self;
          unint64_t v14 = [(ContextConfiguration *)self->_config extraQueryCompletionsTopKLanguages];
          uint64_t v15 = [(CKContextResponse *)self->_response results];
          uint64_t v62 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v15 count]);

          long long v88 = 0u;
          long long v89 = 0u;
          long long v86 = 0u;
          long long v87 = 0u;
          v59 = v13;
          obuint64_t j = [(CKContextResponse *)v13->_response results];
          id v68 = [obj countByEnumeratingWithState:&v86 objects:v93 count:16];
          if (v68)
          {
            uint64_t v65 = *(void *)v87;
            do
            {
              for (i = 0; i != v68; i = (char *)i + 1)
              {
                if (*(void *)v87 != v65) {
                  objc_enumerationMutation(obj);
                }
                id v17 = *(void **)(*((void *)&v86 + 1) + 8 * i);
                id v18 = [v17 topicId];
                if ([v18 length])
                {
                  [v73 removeAllObjects];
                  id v19 = [v72 objectsForKey:v18 intoSet:v73 keepWalkingOut:0];
                  if ([v67 count])
                  {
                    uint64_t v63 = v17;
                    long long v84 = 0u;
                    long long v85 = 0u;
                    long long v82 = 0u;
                    long long v83 = 0u;
                    id v20 = v67;
                    id v21 = [v20 countByEnumeratingWithState:&v82 objects:v92 count:16];
                    if (v21)
                    {
                      id v22 = v21;
                      uint64_t v70 = 0;
                      uint64_t v23 = *(void *)v83;
LABEL_17:
                      uint64_t v24 = 0;
                      uint64_t v25 = v70 + 1;
                      v70 += (uint64_t)v22;
                      while (1)
                      {
                        if (*(void *)v83 != v23) {
                          objc_enumerationMutation(v20);
                        }
                        if (v25 + v24 > v14) {
                          break;
                        }
                        uint64_t v26 = +[NSString stringWithFormat:@"%@:%@", v18, *(void *)(*((void *)&v82 + 1) + 8 * v24)];
                        id v27 = [v72 objectsForKey:v26 intoSet:v73 keepWalkingOut:0];

                        if (v22 == (id)++v24)
                        {
                          id v22 = [v20 countByEnumeratingWithState:&v82 objects:v92 count:16];
                          if (v22) {
                            goto LABEL_17;
                          }
                          break;
                        }
                      }
                    }

                    id v17 = v63;
                  }
                  id v28 = [v17 title];

                  if (v28)
                  {
                    double v29 = [v17 title];
                    double v30 = [v29 lowercaseString];
                    [v62 addObject:v30];
                  }
                  long long v80 = 0u;
                  long long v81 = 0u;
                  long long v78 = 0u;
                  long long v79 = 0u;
                  id v31 = v73;
                  id v32 = [v31 countByEnumeratingWithState:&v78 objects:v91 count:16];
                  if (v32)
                  {
                    id v33 = v32;
                    uint64_t v34 = *(void *)v79;
                    do
                    {
                      for (uint64_t j = 0; j != v33; uint64_t j = (char *)j + 1)
                      {
                        if (*(void *)v79 != v34) {
                          objc_enumerationMutation(v31);
                        }
                        id v36 = *(void **)(*((void *)&v78 + 1) + 8 * (void)j);
                        uint64_t v37 = [v12 objectForKey:v36];

                        if (!v37)
                        {
                          id v38 = [v36 copy];
                          [v12 setObject:v18 forKey:v38];
                        }
                      }
                      id v33 = [v31 countByEnumeratingWithState:&v78 objects:v91 count:16];
                    }
                    while (v33);
                  }
                }
              }
              id v68 = [obj countByEnumeratingWithState:&v86 objects:v93 count:16];
            }
            while (v68);
          }

          uint64_t v8 = v60;
          double v39 = v62;
          if ([v12 count])
          {
            uint64_t v40 = [v12 allKeys];
            v66 = [v40 sortedArrayUsingSelector:"compare:"];

            double v41 = [(CKContextResponse *)v59->_response results];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              id v42 = [v41 mutableCopy];

              [(CKContextResponse *)v59->_response setResults:v42];
              double v41 = v42;
            }
            [(CKContextResponse *)v59->_response setResultsNeedFiltering:1];
            float v43 = [[ComAppleContextkitUtilObjcIterator alloc] initWithId:v66];
            id v44 = objc_msgSend(v60, "lookupWithComAppleContextkitUtilSpindleArray_State:withJavaUtilList:withJavaUtilIterator:", 0, 0, v43);

            id v45 = [v12 count];
            id v46 = [v44 size];
            long long v74 = 0u;
            long long v75 = 0u;
            long long v76 = 0u;
            long long v77 = 0u;
            id v47 = v44;
            id v71 = [v47 countByEnumeratingWithState:&v74 objects:v90 count:16];
            if (v71)
            {
              uint64_t v48 = *(void *)v75;
              uint64_t v69 = -1;
              uint64_t v64 = *(void *)v75;
              do
              {
                for (k = 0; k != v71; k = (char *)k + 1)
                {
                  if (*(void *)v75 != v48) {
                    objc_enumerationMutation(v47);
                  }
                  v50 = *(void **)(*((void *)&v74 + 1) + 8 * (void)k);
                  v51 = [v50 lowercaseString];
                  if (([v39 containsObject:v51] & 1) == 0)
                  {
                    [v39 addObject:v51];
                    id v52 = [objc_alloc((Class)CKContextResult) initWithTitle:v50 query:0 url:0 category:0];
                    [v52 setCategory:@"(query completion)"];
                    [v52 setMinPrefix:1];
                    if (v46 == v45)
                    {
                      uint64_t v53 = [v66 objectAtIndexedSubscript:(char *)k + v69 + 1];
                      [v12 objectForKey:v53];
                      id v54 = v47;
                      id v55 = v46;
                      id v56 = v45;
                      unint64_t v58 = v57 = v41;
                      [v52 setTopicId:v58];

                      double v41 = v57;
                      id v45 = v56;
                      id v46 = v55;
                      id v47 = v54;
                      uint64_t v48 = v64;

                      double v39 = v62;
                    }
                    [v41 addObject:v52];
                  }
                }
                v69 += (uint64_t)k;
                id v71 = [v47 countByEnumeratingWithState:&v74 objects:v90 count:16];
              }
              while (v71);
            }

            uint64_t v8 = v60;
          }
        }
      }
    }
  }
}

- (void)addCoreNLPTags
{
  uint64_t v2 = self;
  unint64_t v3 = (unint64_t)[(CKContextRequest *)self->_request type];
  if (v3 <= 0x14 && ((1 << v3) & 0x1A803A) != 0)
  {
    id v5 = [(CKContextRequest *)v2->_request text];
    if (v5)
    {
      uint64_t v62 = v5;
      uint64_t v65 = +[TopEntityHelper findNamedEntities:v5];
      uint64_t v6 = [(CKContextResponse *)v2->_response results];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v7 = v6;
      }
      else
      {
        id v8 = [v6 mutableCopy];

        [(CKContextResponse *)v2->_response setResults:v8];
        id v7 = v8;
      }
      long long v76 = v7;
      id v9 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v7 count]);
      uint64_t v70 = v9;
      if (!v2->_debug)
      {
        long long v93 = 0u;
        long long v94 = 0u;
        long long v91 = 0u;
        long long v92 = 0u;
        id v10 = v76;
        id v11 = [v10 countByEnumeratingWithState:&v91 objects:v99 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v92;
          do
          {
            for (i = 0; i != v12; i = (char *)i + 1)
            {
              if (*(void *)v92 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = [*(id *)(*((void *)&v91 + 1) + 8 * i) title];
              id v16 = [v15 lowercaseString];
              [v70 addObject:v16];
            }
            id v12 = [v10 countByEnumeratingWithState:&v91 objects:v99 count:16];
          }
          while (v12);
        }

        id v9 = v70;
      }
      long long v89 = 0u;
      long long v90 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      v97[0] = NSLinguisticTagOrganizationName;
      v97[1] = NSLinguisticTagPlaceName;
      v97[2] = NSLinguisticTagPersonalName;
      obuint64_t j = +[NSArray arrayWithObjects:v97 count:3];
      id v66 = [obj countByEnumeratingWithState:&v87 objects:v98 count:16];
      if (v66)
      {
        uint64_t v64 = *(void *)v88;
        uint64_t v69 = v2;
        do
        {
          for (uint64_t j = 0; j != v66; uint64_t j = (char *)j + 1)
          {
            if (*(void *)v88 != v64) {
              objc_enumerationMutation(obj);
            }
            id v18 = *(void **)(*((void *)&v87 + 1) + 8 * (void)j);
            id v19 = [v65 objectForKeyedSubscript:v18];
            if (v19)
            {
              id v68 = j;
              if ([v18 isEqual:NSLinguisticTagPersonalName]) {
                uint64_t v20 = 1;
              }
              else {
                uint64_t v20 = 2;
              }
              uint64_t v67 = v19;
              id v21 = [v19 allValues];
              id v22 = &ADClientSetValueForScalarKey_ptr;
              uint64_t v23 = +[TopEntityHelper mergeAndSort:v21 usingMergeType:v20];

              long long v85 = 0u;
              long long v86 = 0u;
              long long v83 = 0u;
              long long v84 = 0u;
              id v24 = v23;
              id v25 = [v24 countByEnumeratingWithState:&v83 objects:v96 count:16];
              if (v25)
              {
                id v26 = v25;
                uint64_t v27 = *(void *)v84;
                id v73 = v24;
                long long v74 = v18;
                uint64_t v72 = *(void *)v84;
                do
                {
                  id v28 = 0;
                  id v75 = v26;
                  do
                  {
                    if (*(void *)v84 != v27) {
                      objc_enumerationMutation(v24);
                    }
                    double v29 = *(void **)(*((void *)&v83 + 1) + 8 * (void)v28);
                    if (v2->_debug
                      || ([*(id *)(*((void *)&v83 + 1) + 8 * (void)v28) score],
                          float v31 = v30,
                          [(ContextConfiguration *)v2->_config coreNLPMinScore],
                          v31 >= v32))
                    {
                      long long v78 = v28;
                      id v33 = [v29 name];
                      uint64_t v34 = [v33 lowercaseString];

                      if (([v9 containsObject:v34] & 1) == 0)
                      {
                        long long v77 = v34;
                        [v9 addObject:v34];
                        id v35 = objc_alloc((Class)v22[462]);
                        id v36 = [v29 name];
                        id v37 = [v35 initWithTitle:v36 query:0 url:0 category:v18];

                        [v29 score];
                        float v39 = v38;
                        [(ContextConfiguration *)v2->_config coreNLPRelevantScore];
                        [v37 setMinPrefix:v39 <= v40];
                        double v41 = v76;
                        if (v2->_debug)
                        {
                          id v42 = [v29 count];
                          id v43 = [v29 firstOccurrence];
                          [v29 score];
                          double v45 = v44;
                          id v46 = [v29 sourceNamedEntities];
                          id v47 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"count: %lu, firstOccur: %lu, score: %f, sourceEntities: %lu", v42, v43, *(void *)&v45, [v46 count]);

                          uint64_t v48 = [v29 sourceNamedEntities];
                          id v49 = [v48 count];

                          if ((unint64_t)v49 >= 2)
                          {
                            id v71 = v37;
                            long long v81 = 0u;
                            long long v82 = 0u;
                            long long v79 = 0u;
                            long long v80 = 0u;
                            v50 = [v29 sourceNamedEntities];
                            id v51 = [v50 countByEnumeratingWithState:&v79 objects:v95 count:16];
                            if (v51)
                            {
                              id v52 = v51;
                              uint64_t v53 = *(void *)v80;
                              do
                              {
                                id v54 = 0;
                                id v55 = v47;
                                do
                                {
                                  if (*(void *)v80 != v53) {
                                    objc_enumerationMutation(v50);
                                  }
                                  id v56 = *(void **)(*((void *)&v79 + 1) + 8 * (void)v54);
                                  v57 = [v56 name];
                                  id v58 = [v56 count];
                                  id v59 = [v56 firstOccurrence];
                                  [v56 score];
                                  id v61 = +[NSString stringWithFormat:@"\n  sourceEntity: %@ \t count: %lu, firstOccur: %lu, score: %f", v57, v58, v59, v60];
                                  id v47 = [v55 stringByAppendingString:v61];

                                  id v54 = (char *)v54 + 1;
                                  id v55 = v47;
                                }
                                while (v52 != v54);
                                id v52 = [v50 countByEnumeratingWithState:&v79 objects:v95 count:16];
                              }
                              while (v52);
                            }

                            uint64_t v2 = v69;
                            id v9 = v70;
                            double v41 = v76;
                            id v22 = &ADClientSetValueForScalarKey_ptr;
                            id v37 = v71;
                          }
                          [v37 setDebug:v47];

                          id v24 = v73;
                          id v18 = v74;
                          uint64_t v27 = v72;
                        }
                        [v41 addObject:v37];

                        id v26 = v75;
                        uint64_t v34 = v77;
                      }

                      id v28 = v78;
                    }
                    id v28 = (char *)v28 + 1;
                  }
                  while (v28 != v26);
                  id v26 = [v24 countByEnumeratingWithState:&v83 objects:v96 count:16];
                }
                while (v26);
              }

              id v19 = v67;
              uint64_t j = v68;
            }
          }
          id v66 = [obj countByEnumeratingWithState:&v87 objects:v98 count:16];
        }
        while (v66);
      }

      id v5 = v62;
    }
  }
}

- (void)augmentResultsWithTags
{
  unint64_t v3 = (unint64_t)[(CKContextRequest *)self->_request type];
  if (v3 <= 0x14 && ((1 << v3) & 0x1B0438) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
    uint64_t v6 = [WeakRetained tagsMap];

    if (v6)
    {
      id v7 = [(CKContextResponse *)self->_response results];
      id v8 = [v7 count];

      if (v8)
      {
        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        obuint64_t j = [(CKContextResponse *)self->_response results];
        id v9 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = *(void *)v26;
          uint64_t v23 = CKContextTagTypePersonReal;
          do
          {
            for (i = 0; i != v10; i = (char *)i + 1)
            {
              if (*(void *)v26 != v11) {
                objc_enumerationMutation(obj);
              }
              uint64_t v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
              unint64_t v14 = objc_msgSend(v13, "topicId", v23);
              uint64_t v15 = [v13 title];
              if ([v14 length])
              {
                id v16 = [v6 objectsForKey:v14];
              }
              else if ([v15 length])
              {
                id v17 = [v15 lowercaseString];
                id v16 = [v6 objectsForKey:v17];
              }
              else
              {
                id v16 = 0;
              }
              id v18 = [v13 tags];
              id v19 = [v18 count];

              if (v19)
              {
                uint64_t v20 = [v13 tags];
                id v21 = [v20 mutableCopy];

                if ([v16 count]) {
                  [v21 unionSet:v16];
                }
                if ([v21 containsObject:@"CK_PERSON_GIVEN_SURNAME"])
                {
                  if ([v21 count] == (id)1)
                  {
                    uint64_t v22 = +[NSMutableSet setWithObject:v23];

                    id v21 = (id)v22;
                  }
                  else
                  {
                    [v21 removeObject:@"CK_PERSON_GIVEN_SURNAME"];
                  }
                }
                [v13 setTags:v21];
              }
              else if ([v16 count])
              {
                [v13 setTags:v16];
              }
            }
            id v10 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
          }
          while (v10);
        }
      }
    }
  }
}

- (void)addStructuredExtraction
{
  unint64_t v3 = (unint64_t)[(CKContextRequest *)self->_request type];
  if (v3 <= 0x14 && ((1 << v3) & 0x1B0438) != 0)
  {
    id v5 = [(CKContextRequest *)self->_request uiElements];
    if ([v5 count])
    {
      uint64_t v6 = [(LuceneContextRequest *)self _sortGroupFilterUIElements];
      id v7 = [(CKContextResponse *)self->_response results];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v8 = [v7 mutableCopy];

        [(CKContextResponse *)self->_response setResults:v8];
        id v7 = v8;
      }
      id v9 = objc_alloc_init((Class)NSMutableDictionary);
      id v10 = [(CKContextRequest *)self->_request uiElements];
      uint64_t v11 = [(LuceneContextRequest *)self _determineTitleFromUIElements:v10];

      if (v11)
      {
        [v7 addObject:v11];
        id v12 = [v11 sourceUIElement];
        if (v12)
        {
          uint64_t v13 = +[NSMutableArray arrayWithObject:v11];
          [v9 setObject:v13 forKeyedSubscript:v12];
        }
      }
      float v30 = v11;
      double v29 = +[CKStructuredExtractionUtils liveTextResultsFromUIElements:v5];
      objc_msgSend(v7, "addObjectsFromArray:");
      id v33 = v5;
      long long v28 = +[CKStructuredExtractionUtils personResultsFromUIElements:v5];
      objc_msgSend(v7, "addObjectsFromArray:");
      id v38 = 0;
      uint64_t v14 = +[NSDataDetector dataDetectorWithTypes:2104 error:&v38];
      id v26 = v38;
      long long v27 = (void *)v14;
      float v32 = (void *)v6;
      uint64_t v15 = +[CKStructuredExtractionUtils ddResultsForUIElements:v6 usingDataDetector:v14 withConfig:self->_config];
      float v31 = v7;
      [v7 addObjectsFromArray:v15];
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v16 = v15;
      id v17 = [v16 countByEnumeratingWithState:&v34 objects:v39 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v35;
        do
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(void *)v35 != v19) {
              objc_enumerationMutation(v16);
            }
            id v21 = *(void **)(*((void *)&v34 + 1) + 8 * i);
            uint64_t v22 = [v21 sourceUIElement];
            id v23 = [v9 objectForKeyedSubscript:v22];
            if (!v23) {
              id v23 = objc_alloc_init((Class)NSMutableArray);
            }
            [v23 addObject:v21];
            [v9 setObject:v23 forKeyedSubscript:v22];
          }
          id v18 = [v16 countByEnumeratingWithState:&v34 objects:v39 count:16];
        }
        while (v18);
      }

      [(LuceneContextRequest *)self _determineSurroundingEntities:v32 withUIElementToResultsMapping:v9];
      id v24 = [(CKContextRequest *)self->_request extractionItems];
      long long v25 = [(LuceneContextRequest *)self _addHomeAppExtractionResults:v24];

      [v31 addObjectsFromArray:v25];
      id v5 = v33;
    }
  }
}

- (id)_addHomeAppExtractionResults:(id)a3
{
  id v4 = objc_alloc((Class)NSMutableArray);
  id v5 = [(CKContextRequest *)self->_request extractionItems];
  id v24 = objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obuint64_t j = [(CKContextRequest *)self->_request extractionItems];
  id v6 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v26;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v11 = -[LuceneContextRequest _getTagTypeForExtractionItemType:](self, "_getTagTypeForExtractionItemType:", [v10 type]);
        if (v11)
        {
          id v12 = objc_alloc((Class)CKContextResult);
          uint64_t v13 = [v10 title];
          id v14 = [v12 initWithTitle:v13 query:0 url:0 category:0];

          uint64_t v15 = [v10 identifier];
          [v14 setTopicId:v15];

          id v16 = +[NSSet setWithObject:v11];
          [v14 setTags:v16];

          objc_msgSend(v14, "setOnScreen:", objc_msgSend(v10, "isOnScreen"));
          id v17 = [v10 identifier];
          id v18 = [v10 bundleIdentifier];
          unsigned int v19 = [v10 isOnScreen];
          CFStringRef v20 = @"NO";
          if (v19) {
            CFStringRef v20 = @"YES";
          }
          id v21 = +[NSString stringWithFormat:@"Identifier: %@, BundleIdentifier: %@, On Screen:%@", v17, v18, v20];
          [v14 setDebug:v21];

          [v24 addObject:v14];
        }
      }
      id v7 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v7);
  }

  return v24;
}

- (id)_getTagTypeForExtractionItemType:(unint64_t)a3
{
  if (a3 > 2)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = *(id *)*(&off_10048C1B8 + a3);
  }
  return v4;
}

- (void)_determineSurroundingEntities:(id)a3 withUIElementToResultsMapping:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  if ([v6 count])
  {
    unint64_t v9 = 0;
    id v35 = v7;
    uint64_t v36 = CKContextTagTypePlainTextLabel;
    id v38 = v8;
    do
    {
      id v10 = objc_msgSend(v6, "objectAtIndexedSubscript:", v9, v35);
      uint64_t v11 = [v7 objectForKeyedSubscript:v10];
      id v12 = v11;
      if (v11 && [v11 count])
      {
        unint64_t v13 = [(ContextConfiguration *)self->_config surroundingEntitiesSearchRange];
        if (v9 >= v13) {
          unint64_t v14 = v9 - v13;
        }
        else {
          unint64_t v14 = 0;
        }
        unint64_t v15 = v13 + v9;
        id v16 = [v6 count];
        if (v15 >= (unint64_t)v16) {
          unint64_t v17 = (unint64_t)v16;
        }
        else {
          unint64_t v17 = v15;
        }
        [v10 frameInWindow];
        double MidX = CGRectGetMidX(v44);
        long long v37 = v10;
        [v10 frameInWindow];
        double MidY = CGRectGetMidY(v45);
        id v20 = objc_alloc_init((Class)NSMutableArray);
        while (v14 < v17)
        {
          id v21 = [v6 objectAtIndexedSubscript:v14];
          if ([(LuceneContextRequest *)self _isLikelyLabel:v21])
          {
            [v21 frameInWindow];
            double v22 = CGRectGetMidX(v46);
            [v21 frameInWindow];
            CGFloat v23 = CGRectGetMidY(v47);
            double v24 = (MidY - v23) * (MidY - v23);
            [(ContextConfiguration *)self->_config surroundingEntitiesDistanceScoreHorizontalSkew];
            if (v24 + v25 * ((MidX - v22) * (MidX - v22)) < (double)[(ContextConfiguration *)self->_config surroundingEntitiesMaxDistanceScore])
            {
              id v26 = [v8 objectForKeyedSubscript:v21];
              if (!v26)
              {
                id v27 = objc_alloc((Class)CKContextResult);
                long long v28 = [v21 text];
                id v26 = [v27 initWithTitle:v28 query:0 url:0 category:0];

                [v21 absoluteOriginOnScreen];
                objc_msgSend(v26, "setAbsoluteOriginOnScreen:");
                objc_msgSend(v26, "setOnScreen:", objc_msgSend(v21, "isOnScreen"));
                [v21 frameInWindow];
                objc_msgSend(v26, "setFrameInWindow:");
                double v29 = +[NSSet setWithObject:v36];
                [v26 setTags:v29];

                id v8 = v38;
                [v38 setObject:v26 forKeyedSubscript:v21];
              }
              [v20 addObject:v26];
            }
          }

          ++v14;
        }
        if ([v20 count])
        {
          long long v41 = 0u;
          long long v42 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          id v30 = v12;
          id v31 = [v30 countByEnumeratingWithState:&v39 objects:v43 count:16];
          if (v31)
          {
            id v32 = v31;
            uint64_t v33 = *(void *)v40;
            do
            {
              long long v34 = 0;
              do
              {
                if (*(void *)v40 != v33) {
                  objc_enumerationMutation(v30);
                }
                [*(id *)(*((void *)&v39 + 1) + 8 * (void)v34) setAssociatedResults:v20];
                long long v34 = (char *)v34 + 1;
              }
              while (v32 != v34);
              id v32 = [v30 countByEnumeratingWithState:&v39 objects:v43 count:16];
            }
            while (v32);
          }

          id v8 = v38;
        }

        id v7 = v35;
        id v10 = v37;
      }

      ++v9;
    }
    while (v9 < (unint64_t)[v6 count]);
  }
}

- (id)_determineTitleFromUIElements:(id)a3
{
  id v4 = a3;
  [(ContextConfiguration *)self->_config minTitleUIFontSize];
  double v6 = v5;
  CGRect v47 = self;
  [(ContextConfiguration *)self->_config minTitleUIFontSize];
  double v8 = v7;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v9 = v4;
  id v10 = [v9 countByEnumeratingWithState:&v52 objects:v56 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v53;
    CGRect v46 = 0;
    CGRect v45 = v49;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v53 != v12) {
          objc_enumerationMutation(v9);
        }
        unint64_t v14 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        if (objc_msgSend(v14, "isOnScreen", v45))
        {
          unint64_t v15 = [v14 text];
          id v16 = +[NSCharacterSet newlineCharacterSet];
          id v17 = [v15 rangeOfCharacterFromSet:v16];

          if (v17 == (id)0x7FFFFFFFFFFFFFFFLL)
          {
            if ([(id)objc_opt_class() _looksLikeTitleBarUIElement:v14])
            {
              BOOL v28 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
              if (v28) {
                sub_1002C9344(v28, v29, v30);
              }
              id v27 = v14;
              goto LABEL_24;
            }
            [v14 fontSize];
            if (v6 <= v18)
            {
              unsigned int v19 = [v14 text];
              id v20 = [v19 length];
              unint64_t v21 = [(ContextConfiguration *)self->_config minUIContextLength];

              if ((unint64_t)v20 > v21)
              {
                double v22 = [v46 text];
                CGFloat v23 = [v14 text];
                unsigned int v24 = [v22 isEqualToString:v23];

                if (!v24) {
                  double v8 = v6;
                }
                id v25 = v14;

                [v25 fontSize];
                double v6 = v26;
                CGRect v46 = v25;
              }
            }
          }
          else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
          {
            sub_1002C9384(&v48, v45);
          }
        }
        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        {
          sub_1002C93B8(&v50, v51);
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v52 objects:v56 count:16];
      if (v11) {
        continue;
      }
      break;
    }
    id v27 = 0;
LABEL_24:
    id v31 = v46;
  }
  else
  {
    id v31 = 0;
    id v27 = 0;
  }

  id v32 = [v31 text];
  if ([v32 length])
  {
    [(ContextConfiguration *)v47->_config minFontDeltaForTitle];
    float v34 = v33;

    if (!v27)
    {
      double v35 = v6 - v8;
      if (v6 - v8 > v34) {
        id v27 = v31;
      }
    }
    if (v27) {
      goto LABEL_34;
    }
  }
  else
  {

    if (v27) {
      goto LABEL_34;
    }
  }
  uint64_t v36 = [(CKContextRequest *)v47->_request title];

  if (!v36)
  {
    long long v41 = 0;
    goto LABEL_40;
  }
LABEL_34:
  long long v37 = objc_msgSend(v27, "text", v35);
  id v38 = v37;
  if (v37)
  {
    id v39 = v37;
  }
  else
  {
    id v39 = [(CKContextRequest *)v47->_request title];
  }
  long long v40 = v39;

  long long v41 = [[LuceneContextResult alloc] initWithText:v40];
  if (v27)
  {
    [v27 frameInWindow];
    -[LuceneContextResult setFrameInWindow:](v41, "setFrameInWindow:");
    [v27 absoluteOriginOnScreen];
    -[LuceneContextResult setAbsoluteOriginOnScreen:](v41, "setAbsoluteOriginOnScreen:");
    -[LuceneContextResult setOnScreen:](v41, "setOnScreen:", [v27 isOnScreen]);
    long long v42 = +[CKStructuredExtractionUtils debugStringForStructuredResult:v41];
    [(LuceneContextResult *)v41 setDebug:v42];

    [(LuceneContextResult *)v41 setSourceUIElement:v27];
  }
  id v43 = +[NSSet setWithObject:CKContextTagTypeTitle];
  [(LuceneContextResult *)v41 setTags:v43];

  [(LuceneContextResult *)v41 setMinPrefix:[(ContextConfiguration *)v47->_config titleMinPrefix]];
LABEL_40:

  return v41;
}

+ (BOOL)_looksLikeTitleBarUIElement:(id)a3
{
  id v3 = a3;
  id v4 = [v3 className];
  unsigned int v5 = [v4 isEqualToString:@"UILabel"];

  if (v5
    && ([v3 superviewClassNames],
        double v6 = objc_claimAutoreleasedReturnValue(),
        id v7 = [v6 count],
        v6,
        v7))
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    double v8 = objc_msgSend(v3, "superviewClassNames", 0);
    id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v17;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          unint64_t v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if (([v13 isEqualToString:@"_UINavigationBarTitleControl"] & 1) != 0
            || ([v13 isEqualToString:@"_UINavigationBarContentView"] & 1) != 0)
          {
            BOOL v14 = 1;
            goto LABEL_16;
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        BOOL v14 = 0;
        if (v10) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v14 = 0;
    }
LABEL_16:
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (id)_sortGroupFilterUIElements
{
  BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v3) {
    sub_1002C9420(v3, v4, v5);
  }
  uint64_t v78 = [(CKContextRequest *)self->_request preferredSceneIdentifiers];
  double v6 = [(CKContextRequest *)self->_request uiElements];
  id v7 = [v6 sortedArrayUsingSelector:"compareByPosition:"];
  [(CKContextRequest *)self->_request setUiElements:v7];

  id v8 = objc_alloc_init((Class)NSMutableArray);
  [(CKContextRequest *)self->_request uiElements];
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  id v9 = [obj countByEnumeratingWithState:&v85 objects:v89 count:16];
  if (!v9)
  {
    uint64_t v11 = 0;
    unint64_t v13 = (void *)v78;
    goto LABEL_67;
  }
  id v10 = v9;
  uint64_t v11 = 0;
  uint64_t v12 = *(void *)v86;
  unint64_t v13 = (void *)v78;
  id v81 = v8;
  do
  {
    BOOL v14 = 0;
    do
    {
      if (*(void *)v86 != v12) {
        objc_enumerationMutation(obj);
      }
      unint64_t v15 = *(void **)(*((void *)&v85 + 1) + 8 * (void)v14);
      if (![(LuceneContextRequest *)self _isRelevantUIForExtraction:v15])
      {
        long long v17 = v11;
        uint64_t v11 = 0;
        goto LABEL_22;
      }
      long long v17 = [v15 sceneIdentifier];
      if ([v13 count] && (objc_msgSend(v13, "containsObject:", v17) & 1) == 0)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
          sub_1002C93EC(&v83, v84);
        }
        goto LABEL_22;
      }
      if (!v11
        || ([v11 frameInWindow], CGRectIsEmpty(v91))
        || ([v15 frameInWindow], CGRectIsEmpty(v92))
        || (unsigned int v18 = [v11 isOnScreen],
            BOOL v19 = v18 == [v15 isOnScreen],
            id v8 = v81,
            !v19))
      {
LABEL_15:
        if (self->_debug) {
          id v20 = [v15 copy];
        }
        else {
          id v20 = v15;
        }
        id v21 = v20;
        [v8 addObject:v20];

        uint64_t v11 = v21;
        goto LABEL_22;
      }
      [v11 frameInWindow];
      double v23 = v22;
      CGFloat v25 = v24;
      double v27 = v26;
      CGFloat v29 = v28;
      [v15 frameInWindow];
      double v31 = v30;
      double v33 = v32;
      double v35 = v34;
      v97.size.height = v36;
      v93.origin.x = v23;
      CGFloat v79 = v36;
      double v80 = v25;
      v93.origin.y = v25;
      v93.size.width = v27;
      v93.size.height = v29;
      v97.origin.x = v31;
      v97.origin.y = v33;
      v97.size.width = v35;
      if (CGRectEqualToRect(v93, v97))
      {
        long long v37 = [v11 text];
        id v38 = [v15 text];
        unsigned __int8 v75 = [v37 isEqualToString:v38];

        if (v75)
        {
          unint64_t v13 = (void *)v78;
          id v8 = v81;
          goto LABEL_22;
        }
      }
      double v39 = v29;
      if (v27 <= v35) {
        double v40 = v31;
      }
      else {
        double v40 = v23;
      }
      if (v27 >= v35) {
        double v41 = v31;
      }
      else {
        double v41 = v23;
      }
      long long v42 = [v15 superviewClassNames];
      id v43 = [v42 count];

      BOOL v44 = 0;
      if (v43 && v40 < v41 + 0.5)
      {
        if (v27 >= v35) {
          double v45 = v35;
        }
        else {
          double v45 = v27;
        }
        if (v27 <= v35) {
          double v46 = v35;
        }
        else {
          double v46 = v27;
        }
        BOOL v44 = v40 + v46 > v45 + v41 + -0.5
           && ([v11 fontSize], float v48 = v47, objc_msgSend(v15, "fontSize"), vabds_f32(v48, v49) < 0.5)
           && v33 - v80 - v39 < (double)[(ContextConfiguration *)self->_config verticalGroupBuffer];
      }
      CGFloat v50 = v39;
      if (vabdd_f64(v80, v33) >= 0.5
        || ([v11 fontSize], float v52 = v51, objc_msgSend(v15, "fontSize"), vabds_f32(v52, v53) >= 0.5))
      {
        BOOL v74 = 0;
      }
      else
      {
        CGFloat v50 = v39;
        BOOL v74 = v31 - v23 - v27 < (double)[(ContextConfiguration *)self->_config horizontalGroupBuffer];
      }
      v94.origin.x = v23;
      v98.size.height = v79;
      v94.origin.y = v80;
      v94.size.width = v27;
      v94.size.height = v50;
      v98.origin.x = v31;
      v98.origin.y = v33;
      v98.size.width = v35;
      if (CGRectIntersectsRect(v94, v98))
      {
        [v11 fontSize];
        float v55 = v54;
        [v15 fontSize];
        BOOL v73 = vabds_f32(v55, v56) < 0.5;
      }
      else
      {
        BOOL v73 = 0;
      }
      BOOL v76 = v44;
      v57 = [v11 className];
      if (v57)
      {

LABEL_55:
        id v59 = [v11 className];
        float v60 = [v15 className];
        unsigned int v72 = [v59 isEqualToString:v60];

        int v61 = v72;
        goto LABEL_56;
      }
      id v58 = [v15 className];

      if (v58) {
        goto LABEL_55;
      }
      int v61 = 1;
LABEL_56:
      unint64_t v13 = (void *)v78;
      id v8 = v81;
      if (!v61 || !v76 && !v74 && !v73) {
        goto LABEL_15;
      }
      uint64_t v62 = [v11 text];
      uint64_t v63 = [v15 text];
      long long v77 = +[NSString stringWithFormat:@"%@ %@", v62, v63];

      id v8 = v81;
      unint64_t v13 = (void *)v78;
      [v11 setText:v77];
      v95.origin.x = v23;
      v99.size.height = v79;
      v95.origin.y = v80;
      v95.size.width = v27;
      v95.size.height = v50;
      v99.origin.x = v31;
      v99.origin.y = v33;
      v99.size.width = v35;
      CGRect v96 = CGRectUnion(v95, v99);
      objc_msgSend(v11, "setFrameInWindow:", v96.origin.x, v96.origin.y, v96.size.width, v96.size.height);
      [v11 absoluteOriginOnScreen];
      double v65 = v64;
      [v15 absoluteOriginOnScreen];
      if (v65 >= v66) {
        double v65 = v66;
      }
      [v11 absoluteOriginOnScreen];
      double v68 = v67;
      [v15 absoluteOriginOnScreen];
      if (v68 < v69) {
        double v69 = v68;
      }
      objc_msgSend(v11, "setAbsoluteOriginOnScreen:", v65, v69);

LABEL_22:
      BOOL v14 = (char *)v14 + 1;
    }
    while (v10 != v14);
    id v70 = [obj countByEnumeratingWithState:&v85 objects:v89 count:16];
    id v10 = v70;
  }
  while (v70);
LABEL_67:

  return v8;
}

- (BOOL)_isRelevantUIForExtraction:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 text];
  id v6 = [v5 length];
  if (v6 < (id)[(ContextConfiguration *)self->_config minUIContextLength]) {
    goto LABEL_2;
  }
  id v8 = [v4 text];
  id v9 = [v8 length];
  unint64_t v10 = [(ContextConfiguration *)self->_config maxUIContextLength];

  if ((unint64_t)v9 > v10) {
    goto LABEL_5;
  }
  [v4 frameInWindow];
  double y = v20.origin.y;
  double height = v20.size.height;
  if (CGRectIsEmpty(v20))
  {
    char v7 = 1;
    goto LABEL_8;
  }
  if (y < (double)[(ContextConfiguration *)self->_config minUIPositionY]
    && height < (double)[(ContextConfiguration *)self->_config smallUIHeight])
  {
LABEL_5:
    char v7 = 0;
    goto LABEL_8;
  }
  uint64_t v5 = [v4 superviewClassNames];
  if (!v5)
  {
LABEL_14:
    char v7 = 1;
    goto LABEL_3;
  }
  BOOL v14 = [(ContextConfiguration *)self->_config structuredExtractionUIBlockList];
  unint64_t v15 = +[NSSet setWithArray:v5];
  unsigned __int8 v16 = [v14 intersectsSet:v15];

  if ((v16 & 1) == 0)
  {
    if (([v4 isOnScreen] & 1) == 0)
    {
      long long v17 = [(ContextConfiguration *)self->_config structuredExtractionUIOffScreenIgnoreList];
      unsigned int v18 = +[NSSet setWithArray:v5];
      unsigned __int8 v19 = [v17 intersectsSet:v18];

      char v7 = v19 ^ 1;
      goto LABEL_3;
    }
    goto LABEL_14;
  }
LABEL_2:
  char v7 = 0;
LABEL_3:

LABEL_8:
  return v7;
}

- (BOOL)_isLikelyLabel:(id)a3
{
  id v4 = [a3 text];
  id v5 = [v4 length];
  LOBYTE(self) = v5 <= (id)[(ContextConfiguration *)self->_config surroundingEntitiesMaxLabelLength];

  return (char)self;
}

- (void)filterResultsByTags:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (unint64_t)[(CKContextRequest *)self->_request type];
  if (v5 <= 0x14 && ((1 << v5) & 0x1B0438) != 0)
  {
    id v7 = objc_alloc_init((Class)NSMutableArray);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    unsigned int v18 = self;
    id v8 = [(CKContextResponse *)self->_response results];
    id v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v20;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          unint64_t v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          uint64_t v14 = [v13 tags];
          if (v14)
          {
            unint64_t v15 = (void *)v14;
            unsigned __int8 v16 = [v13 tags];
            unsigned int v17 = [v16 intersectsSet:v4];

            if (v17) {
              [v7 addObject:v13];
            }
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v10);
    }

    [(CKContextResponse *)v18->_response setResults:v7];
  }
}

+ (id)setOfLinewiseStringsFromFieldValue:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    +[NSMutableOrderedSet orderedSet];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1002BD7E4;
    v6[3] = &unk_10048BEA0;
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    id v7 = v4;
    [v3 enumerateLinesUsingBlock:v6];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)lookupTreasureMapForDomainHierarchy:(id)a3 fromTreasureMap:(id)a4 intoSet:(id)a5 isRelaxedMatchOut:(BOOL *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v9;
  if ([v12 length])
  {
    char v20 = 0;
    unint64_t v13 = [v10 objectsForKey:v12 intoSet:v11 keepWalkingOut:&v20];

    if (a6 && ![v13 count]) {
      *a6 = 1;
    }
    if (![v13 count] || v20)
    {
      unsigned int v17 = v12;
      while (1)
      {
        unsigned int v18 = [v17 indexOf:46];
        if ((v18 & 0x80000000) != 0)
        {
          uint64_t v14 = v13;
          unint64_t v15 = v17;
          goto LABEL_17;
        }
        unint64_t v15 = [v17 substring:v18 + 1];

        if (![v15 length]) {
          break;
        }
        uint64_t v14 = [v10 objectsForKey:v15 intoSet:v13 keepWalkingOut:&v20];

        unint64_t v13 = v14;
        unsigned int v17 = v15;
        if ([v14 count])
        {
          unint64_t v13 = v14;
          unsigned int v17 = v15;
          if (!v20) {
            goto LABEL_17;
          }
        }
      }
      uint64_t v14 = v13;
    }
    else
    {
      uint64_t v14 = v13;
      unint64_t v15 = v12;
    }
LABEL_17:
    id v16 = v14;
  }
  else
  {
    id v16 = v11;
    unint64_t v15 = v12;
  }

  return v16;
}

+ (void)addTopicsForURL:(id)a3 withEngine:(id)a4 toResponse:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = objc_alloc_init(OrgApacheLuceneDocumentDocumentStoredFieldVisitor);
  id v11 = [[OrgApacheLuceneUtilBytesRef alloc] initWithInt:4096];
  [(OrgApacheLuceneIndexStoredFieldVisitor *)v12 setReusableBytesRefWithOrgApacheLuceneUtilBytesRef:v11];

  [a1 _addTopicsForUrl:v10 withEngine:v9 documentVisitor:v12 toResponse:v8];
}

+ (void)_addTopicsForUrl:(id)a3 withEngine:(id)a4 documentVisitor:(id)a5 toResponse:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  unint64_t v13 = [v9 scheme];
  uint64_t v14 = [v9 host];
  v127 = [v10 treasureMap];
  id v141 = [v10 reader];
  id v126 = v14;
  if ([v13 length] && objc_msgSend(v14, "length") && v127 && v141)
  {
    char v158 = 0;
    id v131 = v13;
    unsigned int v119 = [(id)qword_100563128 containsObject:v13];
    if (v119)
    {
      unint64_t v15 = v14;
      if ([v14 hasSuffix:@"."])
      {
        uint64_t v16 = objc_msgSend(v14, "substringToIndex:", (char *)objc_msgSend(v14, "length") - 1);

        unint64_t v15 = (void *)v16;
      }
      uint64_t v17 = [v15 lowercaseString];

      unsigned int v18 = [(id)objc_opt_class() lookupTreasureMapForDomainHierarchy:v17 fromTreasureMap:v127 intoSet:0 isRelaxedMatchOut:&v158];
      uint64_t v120 = 0;
      uint64_t v125 = 0;
      id v126 = (void *)v17;
LABEL_16:
      uint64_t v128 = 0;
      uint64_t v130 = 0;
      int v117 = 0;
      int v118 = 0;
LABEL_72:
      id v54 = [v18 count];
      uint64_t v55 = 1;
      if (!v158) {
        uint64_t v55 = 2;
      }
      if (v54) {
        uint64_t v56 = v55;
      }
      else {
        uint64_t v56 = 0;
      }
      +[MetricsLogging instance];
      id v58 = v57 = v18;
      id v59 = [v10 indexId];
      [v58 recordURLLookupSucceeded:v56 bundleId:v119 ^ 1 indexId:v59 requestType:6];

      id v27 = v57;
      if ([v57 count] || v118)
      {
        id v60 = objc_alloc_init((Class)NSMutableArray);
        int v61 = [v12 level1Topics];
        id v62 = [v61 count];

        if (v62)
        {
          uint64_t v63 = [v12 level1Topics];
          [v60 addObjectsFromArray:v63];
        }
        id v132 = v60;
        id v116 = v9;
        id v64 = objc_alloc_init((Class)NSMutableArray);
        double v65 = [v12 level2Topics];
        id v66 = [v65 count];

        if (v66)
        {
          double v67 = [v12 level2Topics];
          [v64 addObjectsFromArray:v67];
        }
        v129 = v64;
        long long v152 = 0u;
        long long v153 = 0u;
        long long v150 = 0u;
        long long v151 = 0u;
        id v27 = v57;
        id v68 = [v27 countByEnumeratingWithState:&v150 objects:v165 count:16];
        if (v68)
        {
          id v69 = v68;
          id v115 = v12;
          uint64_t v148 = 0;
          int v70 = 0;
          char v135 = 0;
          uint64_t v71 = *(void *)v151;
          unsigned int v72 = &_os_log_default;
          id v137 = v11;
          long long v139 = v10;
          id v134 = v27;
          while (1)
          {
            for (i = 0; i != v69; i = (char *)i + 1)
            {
              if (*(void *)v151 != v71) {
                objc_enumerationMutation(v27);
              }
              unsigned int v74 = [*(id *)(*((void *)&v150 + 1) + 8 * i) intValue];
              unsigned int v75 = v74;
              if ((v74 & 0x80000000) != 0)
              {
                if (!os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT)) {
                  continue;
                }
                *(_DWORD *)buf = 67109120;
                int v164 = v75;
                BOOL v76 = v72;
                long long v77 = "Illegal topic value: %i";
LABEL_101:
                _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, v77, buf, 8u);
                continue;
              }
              switch(v74 & 7)
              {
                case 1u:
                  if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG)) {
                    sub_1002C94A4(v161, v75, v162);
                  }
                  break;
                case 2u:
                case 3u:
                case 4u:
                  int v70 = 0;
                  uint64_t v148 = v74 & 7;
                  break;
                case 5u:
                case 6u:
                case 7u:
                  uint64_t v148 = (v74 & 7) - 3;
                  int v70 = 1;
                  break;
                default:
                  break;
              }
              unsigned int v78 = v75 >> 3;
              if (v75 > 0x1FF)
              {
                CGFloat v79 = v72;
                int v80 = v78 - 64;
                if ((int)(v78 - 64) < (int)[v10 maxDoc])
                {
                  int v145 = v70;
                  id v81 = [v11 getDocument];
                  long long v82 = v81;
                  if (!v81) {
                    goto LABEL_131;
                  }
                  [v81 removeAllFields];
                  [v141 documentWithInt:v78 - 64 withOrgApacheLuceneIndexStoredFieldVisitor:v11];
                  uint64_t v83 = [v82 getWithNSString:@"title"];
                  v143 = [v82 getWithNSString:@"level1"];
                  v144 = [v82 getWithNSString:@"level2"];
                  long long v84 = [v82 getFieldWithNSString:@"parent"];
                  v142 = (void *)v83;
                  id v85 = [objc_alloc((Class)CKContextResult) initWithTitle:v83 query:0 url:0 category:0];
                  long long v86 = objc_opt_class();
                  long long v87 = [v82 getWithNSString:@"related"];
                  long long v88 = [v86 setOfLinewiseStringsFromFieldValue:v87];
                  [v85 setRelatedItems:v88];

                  if (!v85) {
                    goto LABEL_130;
                  }
                  v140 = v84;
                  if (v84)
                  {
                    long long v89 = [v84 numericValue];
                    long long v90 = v89;
                    if (!v89) {
                      goto LABEL_167;
                    }
                    id v91 = [v89 intValue];
                    if ((int)v91 < 1) {
                      goto LABEL_167;
                    }
                    id v92 = v91;
                    if ((int)v91 >= (int)[v139 maxDoc]) {
                      goto LABEL_167;
                    }
                    [v82 removeAllFields];
                    [v141 documentWithInt:v92 withOrgApacheLuceneIndexStoredFieldVisitor:v137];
                    uint64_t v93 = [v82 getWithNSString:@"title"];
                    CGRect v94 = [v82 getWithNSString:@"level1"];
                    unsigned int v123 = (void *)v93;
                    id v95 = [objc_alloc((Class)CKContextResult) initWithTitle:v93 query:0 url:0 category:0];
                    v124 = v94;
                    if ([v94 length]) {
                      [v95 setTopicId:v94];
                    }
                    v121 = objc_opt_class();
                    CGRect v96 = [v82 getWithNSString:@"related"];
                    v122 = [v121 setOfLinewiseStringsFromFieldValue:v96];
                    [v95 setRelatedItems:v122];

                    if (!v95)
                    {
LABEL_167:
                      if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 67109120;
                        int v164 = v80;
                        _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEFAULT, "Couldn't resolve parentResult from parentField referenced from docID: %i", buf, 8u);
                      }
                      id v95 = 0;
                    }

                    id v97 = [v144 length];
                    CGRect v98 = v144;
                    CGRect v99 = v129;
                    uint64_t v100 = v129;
                    if (!v97)
                    {
LABEL_126:
                      id v103 = v99;
                      [v103 addObject:v85];
                      if (v95 && v103 != v132) {
                        [v132 addObject:v95];
                      }

                      long long v84 = v140;
LABEL_130:

                      id v11 = v137;
                      id v10 = v139;
                      id v27 = v134;
LABEL_131:

                      int v70 = v145;
LABEL_132:
                      unsigned int v72 = v79;
                      continue;
                    }
                  }
                  else if ([v144 length])
                  {
                    id v95 = 0;
                    CGRect v98 = v144;
                    uint64_t v100 = v129;
                  }
                  else
                  {
                    v101 = [v85 title];

                    id v95 = 0;
                    CGRect v98 = v143;
                    uint64_t v100 = v132;
                    CGRect v99 = v129;
                    if (!v101) {
                      goto LABEL_126;
                    }
                  }
                  id v102 = [v98 copy];
                  [v85 setTopicId:v102];

                  CGRect v99 = v100;
                  goto LABEL_126;
                }
                if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109120;
                  int v164 = v78 - 64;
                  _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEFAULT, "Illegal topic docID: %i", buf, 8u);
                }
                goto LABEL_132;
              }
              if (v78 == 1)
              {
                char v135 = 1;
              }
              else
              {
                if (v78 == 2)
                {
                  if (!os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT)) {
                    continue;
                  }
                  *(_DWORD *)buf = 67109120;
                  int v164 = 2;
                  BOOL v76 = v72;
                  long long v77 = "Keep-walking value shouldn't be here: %i";
                  goto LABEL_101;
                }
                if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG)) {
                  sub_1002C9460(v159, v75 >> 3, v160);
                }
              }
            }
            id v69 = [v27 countByEnumeratingWithState:&v150 objects:v165 count:16];
            if (!v69)
            {
              char v104 = v70;

              id v12 = v115;
              id v9 = v116;
              unint64_t v13 = v131;
              id v60 = v132;
              uint64_t v105 = v148;
              if (v135) {
                goto LABEL_161;
              }
              goto LABEL_138;
            }
          }
        }

        char v104 = 0;
        uint64_t v105 = 0;
        unint64_t v13 = v131;
LABEL_138:
        if (v118)
        {
          uint64_t v149 = v105;
          if (v117)
          {
            [v60 removeAllObjects];
            [v129 removeAllObjects];
            uint64_t v105 = v149;
          }
          if (v130 | v128)
          {
            id v106 = [objc_alloc((Class)CKContextResult) initWithTitle:v128 query:0 url:0 category:0];
            id v107 = [(id)v130 copy];
            [v106 setTopicId:v107];

            if (v106) {
              [v60 insertObject:v106 atIndex:0];
            }

            uint64_t v105 = v149;
          }
          if (v125 | v120)
          {
            id v108 = [objc_alloc((Class)CKContextResult) initWithTitle:v120 query:0 url:0 category:0];
            id v109 = [(id)v125 copy];
            [v108 setTopicId:v109];

            if (v108) {
              [v129 insertObject:v108 atIndex:0];
            }

            uint64_t v105 = v149;
          }
        }
        if (v105) {
          unsigned int v110 = v119;
        }
        else {
          unsigned int v110 = 0;
        }
        if (v110 == 1)
        {
          v111 = +[LuceneContextRequest stripHostToDomain:level:](LuceneContextRequest, "stripHostToDomain:level:", v126);
          if (v104)
          {
            uint64_t v112 = +[LuceneContextRequest hostToCapitalizedName:v111];

            v111 = (void *)v112;
          }
          if ([v111 length])
          {
            id v113 = [objc_alloc((Class)CKContextResult) initWithTitle:v111 query:0 url:0 category:0];
            if (v113) {
              [v129 addObject:v113];
            }
          }
        }
        [v12 setLevel1Topics:v60];
        [v12 setLevel2Topics:v129];
LABEL_161:
      }
      goto LABEL_163;
    }
    if (![(id)qword_100563130 containsObject:v13])
    {
      if (![(id)qword_100563138 containsObject:v13])
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
          sub_1002C94E8();
        }
        uint64_t v125 = 0;
        uint64_t v128 = 0;
        uint64_t v130 = 0;
        id v27 = 0;

LABEL_163:
        goto LABEL_164;
      }
      double v26 = +[NSString stringWithFormat:@"%@://%@", v13, v14];
      unsigned int v18 = [v127 objectsForKey:v26 intoSet:0 keepWalkingOut:0];

      uint64_t v120 = 0;
      uint64_t v125 = 0;
      goto LABEL_16;
    }
    long long v19 = +[NSString stringWithFormat:@"%@://%@", v13, v14];
    unsigned int v18 = [v127 objectsForKey:v19 intoSet:0 keepWalkingOut:0];
    if (![v18 count])
    {
      uint64_t v20 = [v126 lowercaseString];

      long long v21 = (void *)v20;
      uint64_t v22 = +[NSString stringWithFormat:@"%@://%@", v13, v20];

      uint64_t v23 = [v127 objectsForKey:v22 intoSet:v18 keepWalkingOut:0];

      long long v19 = (void *)v22;
      unsigned int v18 = (void *)v23;
      id v126 = v21;
    }
    id v136 = v11;
    if ([v18 count])
    {
      uint64_t v120 = 0;
      uint64_t v125 = 0;
      uint64_t v128 = 0;
      uint64_t v130 = 0;
      char v24 = 0;
      char v25 = 0;
LABEL_69:
      if (![v18 count])
      {
        char v50 = v24;
        float v51 = objc_opt_class();
        float v52 = [(id)objc_opt_class() reverseFQDN:v126];
        uint64_t v53 = [v51 lookupTreasureMapForDomainHierarchy:v52 fromTreasureMap:v127 intoSet:v18 isRelaxedMatchOut:&v158];

        unsigned int v18 = (void *)v53;
        char v24 = v50;
      }

      int v117 = v24 & 1;
      int v118 = v25 & 1;
      id v11 = v136;
      goto LABEL_72;
    }
    long long v133 = v18;
    if (![v13 isEqualToString:@"app"]
      || ([v9 query],
          double v28 = objc_claimAutoreleasedReturnValue(),
          id v29 = [v28 length],
          v28,
          !v29))
    {
      uint64_t v120 = 0;
      uint64_t v125 = 0;
      uint64_t v128 = 0;
      uint64_t v130 = 0;
      LOBYTE(v147) = 0;
      char v25 = 0;
LABEL_61:
      char v158 = 1;
      while (1)
      {
        id v47 = [v19 lastIndexOf:46];
        if ((v47 & 0x80000000) != 0)
        {
          unsigned int v18 = v133;
          goto LABEL_68;
        }
        float v48 = [v19 substring:0 endIndex:v47];

        unsigned int v18 = v133;
        if (![v48 length]) {
          break;
        }
        float v49 = [v127 objectsForKey:v48 intoSet:v133 keepWalkingOut:0];

        long long v19 = v48;
        long long v133 = v49;
        if ([v49 count])
        {
          long long v19 = v48;
          unsigned int v18 = v49;
          goto LABEL_68;
        }
      }
      long long v19 = v48;
LABEL_68:
      char v24 = v147;
      goto LABEL_69;
    }
    id v114 = v12;
    id v138 = v10;
    +[NSURLComponents componentsWithURL:v9 resolvingAgainstBaseURL:0];
    long long v154 = 0u;
    long long v155 = 0u;
    long long v156 = 0u;
    id v146 = v157 = 0u;
    double v30 = [v146 queryItems];
    id v31 = [v30 countByEnumeratingWithState:&v154 objects:v166 count:16];
    if (!v31)
    {
      uint64_t v120 = 0;
      uint64_t v125 = 0;
      uint64_t v128 = 0;
      uint64_t v130 = 0;
      LOBYTE(v147) = 0;
      char v25 = 0;
      goto LABEL_60;
    }
    id v32 = v31;
    uint64_t v120 = 0;
    uint64_t v125 = 0;
    uint64_t v128 = 0;
    uint64_t v130 = 0;
    int v147 = 0;
    char v25 = 0;
    uint64_t v33 = *(void *)v155;
LABEL_24:
    uint64_t v34 = 0;
    while (1)
    {
      if (*(void *)v155 != v33) {
        objc_enumerationMutation(v30);
      }
      double v35 = *(void **)(*((void *)&v154 + 1) + 8 * v34);
      CGFloat v36 = [v35 value];
      id v37 = [v36 length];

      if (v37) {
        break;
      }
      unint64_t v13 = v131;
LABEL_49:
      if (v32 == (id)++v34)
      {
        id v46 = [v30 countByEnumeratingWithState:&v154 objects:v166 count:16];
        id v32 = v46;
        if (!v46)
        {
LABEL_60:

          id v12 = v114;
          id v10 = v138;
          goto LABEL_61;
        }
        goto LABEL_24;
      }
    }
    id v38 = [v35 name];
    if ([v38 isEqualToString:@"level1.id"]) {
      BOOL v39 = v130 == 0;
    }
    else {
      BOOL v39 = 0;
    }
    if (v39)
    {
      uint64_t v130 = [v35 value];
      char v25 = 1;
      unint64_t v13 = v131;
    }
    else
    {
      if ([v38 isEqualToString:@"level1.title"]) {
        BOOL v40 = v128 == 0;
      }
      else {
        BOOL v40 = 0;
      }
      unint64_t v13 = v131;
      if (v40)
      {
        uint64_t v128 = [v35 value];
      }
      else
      {
        if ([v38 isEqualToString:@"level2.id"]) {
          BOOL v41 = v125 == 0;
        }
        else {
          BOOL v41 = 0;
        }
        if (v41)
        {
          uint64_t v125 = [v35 value];
        }
        else
        {
          if (![v38 isEqualToString:@"level2.title"] || v120)
          {
            if ([v38 isEqualToString:@"override"])
            {
              long long v42 = [v35 value];
              unsigned int v43 = [v42 isEqualToString:@"all"];

              BOOL v44 = v43 == 0;
              unint64_t v13 = v131;
              int v45 = v147;
              if (!v44) {
                int v45 = 1;
              }
              int v147 = v45;
              if (!v44) {
                char v25 = 1;
              }
            }
            goto LABEL_48;
          }
          uint64_t v120 = [v35 value];
        }
      }
      char v25 = 1;
    }
LABEL_48:

    goto LABEL_49;
  }
LABEL_164:
}

+ (id)stripHostToDomain:(id)a3 level:(unint64_t)a4
{
  id v5 = a3;
  unsigned int v6 = [v5 length];
  if (!a4)
  {
LABEL_5:
    id v8 = [v5 substringFromIndex:(int)(v6 + 1)];
LABEL_6:
    id v9 = v8;
    goto LABEL_7;
  }
  unint64_t v7 = 0;
  while (1)
  {
    unsigned int v6 = [v5 lastIndexOf:46 fromIndex:v6 - 1];
    if ((v6 & 0x80000000) != 0) {
      break;
    }
    if (a4 == ++v7) {
      goto LABEL_5;
    }
  }
  if (v7 >= a4 - 1)
  {
    id v8 = v5;
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134217984;
    unint64_t v12 = a4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Unexpected hostname for level %lu", (uint8_t *)&v11, 0xCu);
  }
  id v9 = 0;
LABEL_7:

  return v9;
}

+ (id)hostToCapitalizedName:(id)a3
{
  id v3 = a3;
  if (![v3 length]) {
    goto LABEL_6;
  }
  id v4 = [v3 indexOf:46];
  if ((v4 & 0x80000000) == 0)
  {
    uint64_t v5 = [v3 substring:0 endIndex:v4];

    id v3 = (id)v5;
  }
  if ([v3 length])
  {
    unsigned int v6 = [v3 capitalizedString];
  }
  else
  {
LABEL_6:
    unsigned int v6 = 0;
  }

  return v6;
}

- (void)_tokenizeText
{
  uint64_t v3 = [(CKContextRequest *)self->_request text];
  uint64_t v4 = [(CKContextResponse *)self->_response languageTag];
  uint64_t v5 = +[LanguageUtilities simplifyTextForSearch:v3 withLanguage:v4];
  unsigned int v6 = [v5 length];
  if (v5 && (unint64_t)[v5 length] >= 3)
  {
    unint64_t v7 = [(OrgApacheLuceneAnalysisAnalyzer *)self->_analyzer tokenStreamWithNSString:@"text" withNSString:v5];
  }
  else
  {
    unint64_t v7 = 0;
  }
  id v8 = OrgApacheLuceneAnalysisTokenattributesCharTermAttribute_class_();
  id v9 = [v7 addAttributeWithIOSClass:v8];

  id v10 = OrgApacheLuceneAnalysisTokenattributesOffsetAttribute_class_();
  int v11 = [v7 addAttributeWithIOSClass:v10];

  v94[0] = 0;
  v94[1] = v94;
  v94[2] = 0x3032000000;
  v94[3] = sub_1002B7AA0;
  v94[4] = sub_1002B7AB0;
  id v95 = [[BigramKey alloc] initWithTokenA:0 tokenB:0];
  uint64_t v91 = 0;
  v92[0] = &v91;
  v92[1] = 0x2020000000;
  int v93 = 0;
  uint64_t v87 = 0;
  long long v88 = (unsigned int *)&v87;
  uint64_t v89 = 0x2020000000;
  int v90 = 0;
  uint64_t v83 = 0;
  long long v84 = (unsigned int *)&v83;
  uint64_t v85 = 0x2020000000;
  int v86 = 0;
  v81[0] = 0;
  v81[1] = v81;
  v81[2] = 0x2020000000;
  int v82 = 0;
  v79[0] = 0;
  v79[1] = v79;
  v79[2] = 0x2020000000;
  int v80 = 0;
  uint64_t v75 = 0;
  BOOL v76 = (unsigned int *)&v75;
  uint64_t v77 = 0x2020000000;
  int v78 = 0;
  uint64_t v71 = 0;
  unsigned int v72 = (unsigned int *)&v71;
  uint64_t v73 = 0x2020000000;
  int v74 = 0;
  unint64_t v12 = [(ContextConfiguration *)self->_config luceneIgnoreAfterPosition];
  v69[0] = 0;
  v69[1] = v69;
  v69[2] = 0x2020000000;
  int v70 = 0;
  v67[0] = 0;
  v67[1] = v67;
  v67[2] = 0x2020000000;
  int v68 = 0;
  v65[0] = 0;
  v65[1] = v65;
  v65[2] = 0x2020000000;
  int v66 = 0;
  v63[0] = 0;
  v63[1] = v63;
  v63[2] = 0x2020000000;
  char v64 = 0;
  v61[0] = 0;
  v61[1] = v61;
  v61[2] = 0x2020000000;
  char v62 = 0;
  v59[0] = 0;
  v59[1] = v59;
  v59[2] = 0x2020000000;
  int v60 = 0;
  v57[0] = 0;
  v57[1] = v57;
  v57[2] = 0x3032000000;
  v57[3] = sub_1002B7AA0;
  v57[4] = sub_1002B7AB0;
  id v58 = 0;
  unint64_t v13 = [(ContextConfiguration *)self->_config luceneMaxUniqueTotalTokens];
  unint64_t v28 = [(ContextConfiguration *)self->_config luceneMaxUniqueNotSkippedTokens];
  unint64_t v27 = v13;
  unint64_t v26 = [(ContextConfiguration *)self->_config luceneMaxUniquePrimaryTokens];
  uint64_t v14 = v5;
  id v29 = v7;
  unint64_t v15 = [(ContextConfiguration *)self->_config bigramMaxEnclosedStopwords];
  char v24 = (void *)v4;
  char v25 = (void *)v3;
  unint64_t v16 = [(ContextConfiguration *)self->_config bigramMaxOffsetDelta];
  unsigned int v17 = v6 - 1;
  unint64_t v18 = v15 + 1;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1002BF3E8;
  v30[3] = &unk_10048BF18;
  double v35 = &v87;
  id v23 = v9;
  id v31 = v23;
  id v32 = self;
  CGFloat v36 = &v83;
  id v37 = &v75;
  id v38 = &v71;
  BOOL v39 = v65;
  BOOL v40 = v67;
  BOOL v41 = v63;
  long long v42 = v61;
  unsigned int v43 = v69;
  id v19 = v11;
  id v33 = v19;
  BOOL v44 = &v91;
  unint64_t v50 = v12;
  int v45 = v79;
  id v20 = v14;
  unsigned int v56 = v17;
  id v34 = v20;
  id v46 = v57;
  id v47 = v59;
  float v48 = v94;
  unint64_t v51 = v18;
  unint64_t v52 = v16;
  float v49 = v81;
  unint64_t v53 = v26;
  unint64_t v54 = v28;
  unint64_t v55 = v27;
  sub_1002BF30C(v29, v30);
  if (self->_debug)
  {
    [(CKContextResponse *)self->_response addDebug:@"tokenCount:%i, uniqueTokenCount:%i, uniqueTokenRatio:%f", v88[6], v84[6], (double)v84[6] / (double)v88[6]];
    [(CKContextResponse *)self->_response addDebug:@"skippedTokenCount:%i, skippedUniqueTokenCount:%i, skippedUniqueTokenRatio:%f, skippedRatio:%f, skippedUniqueRatio:%f", v76[6], v72[6], (float)((float)v72[6] / (float)v76[6]), (float)((float)v76[6] / (float)v88[6]), (float)((float)v72[6] / (float)v84[6])];
  }
  if (self->_debugLogEnabled && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_1002C955C((uint64_t)v92, v21, v22);
  }

  _Block_object_dispose(v57, 8);
  _Block_object_dispose(v59, 8);
  _Block_object_dispose(v61, 8);
  _Block_object_dispose(v63, 8);
  _Block_object_dispose(v65, 8);
  _Block_object_dispose(v67, 8);
  _Block_object_dispose(v69, 8);
  _Block_object_dispose(&v71, 8);
  _Block_object_dispose(&v75, 8);
  _Block_object_dispose(v79, 8);
  _Block_object_dispose(v81, 8);
  _Block_object_dispose(&v83, 8);
  _Block_object_dispose(&v87, 8);
  _Block_object_dispose(&v91, 8);
  _Block_object_dispose(v94, 8);
}

- (id)inspectTitle:(id)a3 titleForTokenization:(id)a4 conditionals:(id)a5
{
  id v7 = a3;
  id v30 = a4;
  id v29 = a5;
  id v8 = objc_opt_new();
  unint64_t v28 = v7;
  if (![v7 length])
  {
    id v10 = v8;
    goto LABEL_40;
  }
  unint64_t v27 = v8;
  [v8 setTitle:v7];
  uint64_t v62 = 0;
  uint64_t v63 = &v62;
  uint64_t v64 = 0x3032000000;
  double v65 = sub_1002B7AA0;
  int v66 = sub_1002B7AB0;
  id v67 = objc_alloc_init((Class)NSMutableSet);
  [v8 setImportantTokens:v63[5]];
  if (!v30) {
    id v30 = v7;
  }
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x3032000000;
  id v59 = sub_1002B7AA0;
  int v60 = sub_1002B7AB0;
  id v61 = (id)objc_opt_new();
  [v8 setTokenString:v57[5]];
  if (v30)
  {
    id v9 = -[OrgApacheLuceneAnalysisAnalyzer tokenStreamWithNSString:withNSString:](self->_analyzer, "tokenStreamWithNSString:withNSString:", @"text");
  }
  else
  {
    id v9 = 0;
  }
  int v11 = OrgApacheLuceneAnalysisTokenattributesCharTermAttribute_class_();
  unint64_t v12 = [v9 addAttributeWithIOSClass:v11];

  v54[0] = 0;
  v54[1] = v54;
  v54[2] = 0x3032000000;
  v54[3] = sub_1002B7AA0;
  v54[4] = sub_1002B7AB0;
  id v55 = 0;
  v52[0] = 0;
  v52[1] = v52;
  v52[2] = 0x3032000000;
  v52[3] = sub_1002B7AA0;
  v52[4] = sub_1002B7AB0;
  unint64_t v53 = [[BigramKey alloc] initWithTokenA:0 tokenB:0];
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_1002C07B4;
  v44[3] = &unk_10048BF40;
  id v13 = v12;
  id v45 = v13;
  id v46 = self;
  float v48 = &v56;
  id v14 = v27;
  id v47 = v14;
  float v49 = &v62;
  unint64_t v50 = v54;
  unint64_t v51 = v52;
  sub_1002BF30C(v9, v44);
  if (!v29 || ![v29 count]) {
    goto LABEL_38;
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v15 = v29;
  id v16 = [v15 countByEnumeratingWithState:&v40 objects:v68 count:16];
  if (!v16)
  {

    goto LABEL_38;
  }
  uint64_t v17 = *(void *)v41;
  BOOL v18 = 1;
  while (2)
  {
    for (i = 0; i != v16; i = (char *)i + 1)
    {
      if (*(void *)v41 != v17) {
        objc_enumerationMutation(v15);
      }
      id v20 = *(void **)(*((void *)&v40 + 1) + 8 * i);
      int v21 = [v20 characterAtIndex:1];
      if (v21 <= 61)
      {
        if (v21 == 33)
        {
          if ((unint64_t)[v20 length] < 2) {
            goto LABEL_35;
          }
          uint64_t v22 = [v20 substringFromIndex:2];
          if (v22)
          {
            id v23 = [(OrgApacheLuceneAnalysisAnalyzer *)self->_analyzer tokenStreamWithNSString:@"text" withNSString:v22];
          }
          else
          {
            id v23 = 0;
          }

          char v24 = OrgApacheLuceneAnalysisTokenattributesCharTermAttribute_class_();
          char v25 = [v23 addAttributeWithIOSClass:v24];

          uint64_t v36 = 0;
          id v37 = &v36;
          uint64_t v38 = 0x2020000000;
          char v39 = 0;
          v32[0] = _NSConcreteStackBlock;
          v32[1] = 3221225472;
          v32[2] = sub_1002C0C2C;
          v32[3] = &unk_10048BF68;
          id v13 = v25;
          id v33 = v13;
          id v34 = self;
          double v35 = &v36;
          sub_1002BF30C(v23, v32);
          BOOL v18 = *((unsigned char *)v37 + 24) == 0;

          _Block_object_dispose(&v36, 8);
          id v9 = v23;
        }
        else
        {
          if (v21 != 61 || (unint64_t)[v20 length] < 2)
          {
LABEL_35:

LABEL_36:
            id v10 = 0;
            goto LABEL_39;
          }
          uint64_t v22 = [v20 substringFromIndex:2];
          [v14 setTopicIdOverride:v22];
        }
        goto LABEL_30;
      }
      if (v21 == 62)
      {
        if ((unint64_t)[v20 length] < 2) {
          goto LABEL_35;
        }
        uint64_t v22 = [v20 substringFromIndex:2];
        objc_msgSend(v14, "setMinPrefix:", objc_msgSend(v22, "integerValue"));
LABEL_30:

        continue;
      }
      if (v21 != 118) {
        goto LABEL_35;
      }
      [v14 setForceBottomRank:1];
    }
    id v16 = [v15 countByEnumeratingWithState:&v40 objects:v68 count:16];
    if (v16) {
      continue;
    }
    break;
  }

  if (!v18) {
    goto LABEL_36;
  }
LABEL_38:
  id v10 = v14;
LABEL_39:

  _Block_object_dispose(v52, 8);
  _Block_object_dispose(v54, 8);

  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&v62, 8);

  id v8 = v27;
LABEL_40:

  return v10;
}

- (id)_readTermInfo:(id)a3 tokenTypeOut:(unint64_t *)a4 weightOut:(float *)a5 docIdOut:(int *)a6
{
  id v7 = (int *)a3;
  float v49 = self;
  unint64_t v50 = [(LuceneContextRequest *)self textTermsEnum];
  uint64_t v52 = 0;
  unint64_t v53 = &v52;
  uint64_t v54 = 0x2020000000;
  int v55 = -1082130432;
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_1002C1590;
  v51[3] = &unk_10048BF90;
  v51[4] = &v52;
  id v8 = objc_retainBlock(v51);
  char v48 = 1;
  unint64_t v9 = 3;
LABEL_2:
  id v10 = [v50 seekCeilWithOrgApacheLuceneUtilBytesRef:v7];
  unsigned int v11 = [v10 ordinal];

  if (v11 == 2)
  {
    uint64_t v12 = [v50 term];
    id v13 = (OrgApacheLuceneUtilBytesRef *)v12;
    if (!v12) {
      goto LABEL_76;
    }
    uint64_t v14 = *(int *)(v12 + 20);
    uint64_t v15 = v7[5];
    if ((int)v14 <= (int)v15) {
      goto LABEL_76;
    }
    uint64_t v16 = *(void *)(v12 + 8) + 12 + *(int *)(v12 + 16);
    int v17 = *(unsigned __int8 *)(v16 + v15);
    if ((v17 - 65) > 0x19
      || memcmp((const void *)(*((void *)v7 + 1) + 12 + v7[4]), (const void *)(*(void *)(v12 + 8) + 12 + *(int *)(v12 + 16)), v7[5]))
    {
      goto LABEL_76;
    }
    char v18 = 0;
    int v47 = v15 + 1;
    int v19 = v15 + 1;
    while (1)
    {
      switch(v17)
      {
        case 'A':
          if (*((float *)v53 + 6) < 0.0) {
            *((_DWORD *)v53 + 6) = 1058977874;
          }
          unint64_t v9 = 10;
          goto LABEL_54;
        case 'B':
          if (*((float *)v53 + 6) < 0.0) {
            *((_DWORD *)v53 + 6) = 1058977874;
          }
          unint64_t v9 = 11;
          goto LABEL_54;
        case 'C':
        case 'K':
        case 'Q':
          goto LABEL_54;
        case 'D':
          if (v19 >= (int)v14) {
            goto LABEL_54;
          }
          uint64_t v20 = 0;
          uint64_t v21 = 0;
          while (2)
          {
            int v22 = *(unsigned __int8 *)(v16 + v19 + v20);
            unsigned __int8 v23 = v22 - 48;
            if ((v22 - 48) < 0xA) {
              goto LABEL_28;
            }
            if ((v22 - 97) <= 0x19)
            {
              unsigned __int8 v23 = v22 - 87;
LABEL_28:
              uint64_t v21 = 36 * v21 + v23;
              int v24 = v20 + 1;
              if (v20 + 1 + v19 >= v14 || (BOOL v25 = v20 >= 5, ++v20, v25))
              {
                v19 += v24;
                goto LABEL_46;
              }
              continue;
            }
            break;
          }
          v19 += v20;
LABEL_46:
          if (a6 && (v21 & 0x8000000000000000) == 0 && v21 != 0x7FFFFFFFFFFFFFFFLL)
          {
            if (v49->_debugLogEnabled)
            {
              id v27 = &_os_log_default;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
              {
                id v29 = [(OrgApacheLuceneUtilBytesRef *)v13 utf8ToString];
                *(_DWORD *)buf = 67109378;
                int v57 = v21;
                __int16 v58 = 2112;
                id v59 = v29;
                _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Found docId reference to %i in %@", buf, 0x12u);
              }
            }
            *a6 = v21;
          }
LABEL_54:
          if ((v18 & 1) != 0 || v19 >= (int)v14)
          {
            if ((v18 & 1) == 0)
            {
LABEL_59:
              char v30 = 1;
              id v31 = v7;
              id v32 = v13;
              goto LABEL_60;
            }
LABEL_76:

LABEL_77:
            id v37 = v49;
LABEL_78:
            unint64_t v9 = v9 != 0;
            if (v7)
            {
              [(ComAppleContextkitUtilBytesRefPool *)v37->_bytesRefPool reclaimSpaceWithOrgApacheLuceneUtilBytesRef:v7];

              id v7 = 0;
            }
            goto LABEL_80;
          }
          int v17 = *(unsigned __int8 *)(v16 + v19++);
          if ((v17 - 65) >= 0x1A) {
            goto LABEL_59;
          }
          break;
        case 'G':
          if (*((float *)v53 + 6) < 0.0) {
            *((_DWORD *)v53 + 6) = 1058977874;
          }
          unint64_t v9 = 8;
          goto LABEL_54;
        case 'I':
          if (*((float *)v53 + 6) < 0.0)
          {
            *((_DWORD *)v53 + 6) = 1058977874;
            unint64_t v9 = 7;
          }
          goto LABEL_54;
        case 'L':
          ((void (*)(void *))v8[2])(v8);
          unint64_t v9 = 5;
          goto LABEL_54;
        case 'N':
          ((void (*)(void *))v8[2])(v8);
          unint64_t v9 = 4;
          goto LABEL_54;
        case 'S':
          unint64_t v9 = 0;
          *((_DWORD *)v53 + 6) = 0;
          goto LABEL_76;
        case 'T':
          ((void (*)(void *))v8[2])(v8);
          unint64_t v9 = 2;
          goto LABEL_54;
        case 'U':
          ((void (*)(void *))v8[2])(v8);
          unint64_t v9 = 6;
          goto LABEL_54;
        case 'W':
          if (*((float *)v53 + 6) < 0.0) {
            *((_DWORD *)v53 + 6) = 1058977874;
          }
          unint64_t v9 = 9;
          goto LABEL_54;
        case 'X':
          if (*((float *)v53 + 6) < 0.0) {
            *((_DWORD *)v53 + 6) = 1058977874;
          }
          unint64_t v9 = 12;
          goto LABEL_54;
        case 'Y':
          if ((v48 & 1) == 0)
          {
            if (v49->_debugLogEnabled)
            {
              id v42 = &_os_log_default;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
              {
                long long v43 = [v7 utf8ToString];
                sub_1002C9634(v43, buf, &v57);
              }
            }
            goto LABEL_76;
          }
          uint64_t v34 = v7[5];
          uint64_t v35 = v34 + 2;
          if ((int)v14 < (int)v34 + 2 || memchr((void *)(v16 + v35), 89, (int)v14 - (int)v35)) {
            goto LABEL_76;
          }
          [(ComAppleContextkitUtilBytesRefPool *)v49->_bytesRefPool reclaimSpaceWithOrgApacheLuceneUtilBytesRef:v7];
          id v32 = [[OrgApacheLuceneUtilBytesRef alloc] initWithByteArray:v13->bytes_ withInt:(v13->offset_ + v35) withInt:(v13->length_ - v35)];

          id v31 = [(ComAppleContextkitUtilBytesRefPool *)v49->_bytesRefPool tryAppendWithOrgApacheLuceneUtilBytesRef:v32];

          if (v18)
          {
            id v13 = v32;
            id v7 = v31;
            goto LABEL_76;
          }
          char v30 = 0;
LABEL_60:
          [(ComAppleContextkitUtilBytesRefPool *)v49->_bytesRefPool reclaimSpaceWithOrgApacheLuceneUtilBytesRef:v31];
          id v7 = [(ComAppleContextkitUtilBytesRefPool *)v49->_bytesRefPool tryAppendWithOrgApacheLuceneUtilBytesRef:v32];

          char v33 = v30 | ~v48;
          char v48 = 0;
          if (v33) {
            goto LABEL_69;
          }
          goto LABEL_2;
        default:
          if (v49->_debugLogEnabled)
          {
            id v26 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
            {
              unint64_t v28 = [(OrgApacheLuceneUtilBytesRef *)v13 utf8ToString];
              *(_DWORD *)buf = 67109378;
              int v57 = v17;
              __int16 v58 = 2112;
              id v59 = v28;
              _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Found unknown modifier %c in %@", buf, 0x12u);
            }
          }
          if (v19 == v47) {
            char v18 = 1;
          }
          goto LABEL_54;
      }
    }
  }
  if (v11 != 1) {
    goto LABEL_77;
  }
  ((void (*)(void *))v8[2])(v8);
LABEL_69:
  float v36 = *((float *)v53 + 6);
  if (v36 < 0.59) {
    unint64_t v9 = 1;
  }
  if (v36 < 0.0)
  {
    id v37 = v49;
    if (v49->_debugLogEnabled)
    {
      id v13 = (OrgApacheLuceneUtilBytesRef *)&_os_log_default;
      id v38 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      {
        char v39 = [v7 utf8ToString];
        sub_1002C95E0(v39, (uint64_t)buf, v40);
      }
      goto LABEL_76;
    }
    goto LABEL_78;
  }
LABEL_80:
  if (a4) {
    *a4 = v9;
  }
  if (a5) {
    *a5 = *((float *)v53 + 6);
  }

  _Block_object_dispose(&v52, 8);
  return v7;
}

- (id)_tokenInfoForToken:(id)a3
{
  id v4 = a3;
  if (![v4 length])
  {
    unsigned __int8 v23 = (TokenInfo *)(id)qword_100563100;
    goto LABEL_41;
  }
  unsigned int v31 = -1;
  float v32 = -1.0;
  uint64_t v30 = 3;
  unsigned int v6 = [(ComAppleContextkitUtilBytesRefPool *)self->_bytesRefPool tryAppendWithJavaLangCharSequence:v4];
  if (!self->_useBloomFilter && !self->_minHashPriorityQueue)
  {
    id v13 = 0;
    goto LABEL_7;
  }
  id v7 = -[LuceneContextRequest _computeHashesWithSeed:forBytesRef:reuse:](self, "_computeHashesWithSeed:forBytesRef:reuse:", 1, v6, self->_hashesTokenReuse, v30);
  objc_storeStrong((id *)&self->_hashesTokenReuse, v7);
  id v8 = v7;
  unint64_t v9 = (unsigned int *)[v8 hashes];
  minHashPriorityQueue = self->_minHashPriorityQueue;
  unsigned int v11 = +[NSNumber numberWithInt:*v9];
  id v12 = [(OrgApacheLuceneUtilPriorityQueue *)minHashPriorityQueue insertWithOverflowWithId:v11];

  if (!self->_useBloomFilter
    || ([(_PASBloomFilter *)self->_bloomFilter getWithHashes:v8] & 1) != 0)
  {
    id v13 = v8;
    goto LABEL_7;
  }
  id v13 = [(LuceneContextRequest *)self _computeHashesWithSeed:6 forBytesRef:v6 reuse:self->_hashesTokenReuse];

  objc_storeStrong((id *)&self->_hashesTokenReuse, v13);
  if ([(_PASBloomFilter *)self->_bloomFilter getWithHashes:v13])
  {
    [(ComAppleContextkitUtilBytesRefPool *)self->_bytesRefPool reclaimSpaceWithOrgApacheLuceneUtilBytesRef:v6];
    goto LABEL_31;
  }
  if ((unint64_t)[v4 length] >= 3)
  {
LABEL_7:
    id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
    uint64_t v15 = [WeakRetained wordlist];

    if (!v15) {
      goto LABEL_13;
    }
    id v16 = objc_loadWeakRetained((id *)&self->_engine);
    int v17 = [v16 wordlist];
    char v18 = [v17 words];
    int v19 = [v18 objectForKeyedSubscript:v4];

    if (!v19)
    {
LABEL_12:

LABEL_13:
      uint64_t v21 = [(LuceneContextRequest *)self _readTermInfo:v6 tokenTypeOut:&v30 weightOut:&v32 docIdOut:&v31];

      if (v21)
      {
        if (v21[5])
        {
          if (v30 != 3) {
            goto LABEL_34;
          }
          *(float *)&double v22 = v32;
          if (v32 >= 0.65)
          {
            if ((unint64_t)objc_msgSend(v4, "length", v22, v32) >= self->_minTokenLengthPrimary) {
              goto LABEL_34;
            }
            *(float *)&double v22 = v32;
          }
          if (*(float *)&v22 < 0.0)
          {
            unsigned __int8 v23 = (TokenInfo *)(id)qword_100563100;
LABEL_39:

            goto LABEL_40;
          }
          uint64_t v30 = 10;
          float v32 = 0.62;
LABEL_34:
          if (self->_debug
            && self->_debugLogEnabled
            && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
          {
            sub_1002C9688(&v30, (uint64_t)v4);
          }
          BOOL v25 = [[OrgApacheLuceneIndexTerm alloc] initWithNSString:@"text" withOrgApacheLuceneUtilBytesRef:v21];
          id v26 = [TokenInfo alloc];
          id v27 = [v13 copy];
          *(float *)&double v28 = v32;
          unsigned __int8 v23 = [(TokenInfo *)v26 initWithToken:v4 withHashes:v27 term:v25 type:v30 weight:v31 docId:v28];

          goto LABEL_39;
        }
        unsigned int v6 = v21;
      }
      else
      {
        unsigned int v6 = 0;
      }
      goto LABEL_29;
    }
    unsigned int v20 = [v19 intValue];
    if (v20 != -1)
    {
      if (!v20)
      {
        uint64_t v30 = 10;
        float v32 = 0.62;
      }
      goto LABEL_12;
    }
    float v32 = 0.0;

LABEL_31:
    int v24 = &qword_100563108;
    goto LABEL_32;
  }
  [(ComAppleContextkitUtilBytesRefPool *)self->_bytesRefPool reclaimSpaceWithOrgApacheLuceneUtilBytesRef:v6];
LABEL_29:

  int v24 = &qword_100563100;
LABEL_32:
  unsigned __int8 v23 = (TokenInfo *)(id)*v24;
LABEL_40:

LABEL_41:
  return v23;
}

- (id)_lookupBigramTermForTokenA:(id)a3 tokenB:(id)a4 tokenTypeOut:(unint64_t *)a5 docIdOut:(int *)a6
{
  bytesRefPool = self->_bytesRefPool;
  id v11 = a4;
  id v12 = [a3 token];
  id v13 = [v11 token];

  uint64_t v14 = [(ComAppleContextkitUtilBytesRefPool *)bytesRefPool tryAppendWithJavaLangCharSequence:v12 withChar:95 withJavaLangCharSequence:v13];

  uint64_t v15 = [(LuceneContextRequest *)self _readTermInfo:v14 tokenTypeOut:a5 weightOut:0 docIdOut:a6];

  if (!v15) {
    goto LABEL_4;
  }
  if (*a5 <= 1)
  {
    [(ComAppleContextkitUtilBytesRefPool *)self->_bytesRefPool reclaimSpaceWithOrgApacheLuceneUtilBytesRef:v15];
LABEL_4:
    id v16 = 0;
    goto LABEL_6;
  }
  id v16 = [[OrgApacheLuceneIndexTerm alloc] initWithNSString:@"text" withOrgApacheLuceneUtilBytesRef:v15];
LABEL_6:

  return v16;
}

- (BOOL)_isIntermediateNameBigramCandidate:(id)a3 tokenB:(id)a4 bothStartUppercase:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  BOOL v9 = v7 != v8;
  if (v7 != v8
    && [v7 count] <= 3
    && [v8 count] <= 3
    && [v7 startsQuotedCount]
    && [v8 endsQuotedCount])
  {
    BOOL v9 = 1;
  }
  else if (v7[1] != 8 {
         && (!+[TokenInfo isSurnameType:](TokenInfo, "isSurnameType:")
  }
          || !a5 && !+[TokenInfo isPrimaryType:v7[1]])
         || !+[TokenInfo isSurnameType:v8[1]]
         || !a5 && !+[TokenInfo isPrimaryType:v8[1]])
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)_bigramInfoForTokenA:(id)a3 tokenB:(id)a4 bigram:(id)a5 bothStartUppercase:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v10 || !v11)
  {
    float v32 = (void *)qword_100563110;
LABEL_12:
    char v33 = v32;
    goto LABEL_69;
  }
  [v10 weight];
  if (v13 <= 0.0)
  {
    [v11 weight];
    if (v14 <= 0.0 && !+[TokenInfo isSurnameType:v11[1]])
    {
      float v32 = (void *)qword_100563118;
      goto LABEL_12;
    }
  }
  unint64_t v75 = 3;
  unsigned int v74 = -1;
  if (!self->_useBloomFilter && !self->_minHashPriorityQueue)
  {
    id v19 = 0;
LABEL_25:
    id v47 = [(LuceneContextRequest *)self _lookupBigramTermForTokenA:v10 tokenB:v11 tokenTypeOut:&v75 docIdOut:&v74];
    LOBYTE(v43) = v47 == 0;
    if (!v47)
    {
      if (!v75)
      {
        uint64_t v64 = (void *)qword_100563118;
        goto LABEL_73;
      }
      if (![(LuceneContextRequest *)self _isIntermediateNameBigramCandidate:v10 tokenB:v11 bothStartUppercase:v6])
      {
LABEL_65:
        uint64_t v64 = (void *)qword_100563110;
LABEL_73:
        char v33 = v64;

        goto LABEL_69;
      }
      id v47 = (id)qword_100563120;
    }
    if (v75 <= 6) {
      float v45 = 0.75;
    }
    else {
      float v45 = 0.62;
    }
    goto LABEL_43;
  }
  bloomFilter = self->_bloomFilter;
  id v16 = [v10 hashes];
  int v17 = [v11 hashes];
  char v18 = [(_PASBloomFilter *)bloomFilter combineHashesWithSeed:2 hashA:v16 hashB:v17 reuse:self->_hashesTokenReuse];
  objc_storeStrong((id *)&self->_hashesTokenReuse, v18);

  id v19 = v18;
  unsigned int v20 = (unsigned int *)[v19 hashes];
  minHashPriorityQueue = self->_minHashPriorityQueue;
  double v22 = +[NSNumber numberWithInt:*v20];
  id v23 = [(OrgApacheLuceneUtilPriorityQueue *)minHashPriorityQueue insertWithOverflowWithId:v22];

  if (!self->_useBloomFilter) {
    goto LABEL_25;
  }
  BOOL v70 = v6;
  id v72 = v12;
  unsigned int v24 = [(_PASBloomFilter *)self->_bloomFilter getWithHashes:v19];
  BOOL v25 = self->_bloomFilter;
  id v26 = [v10 hashes];
  id v27 = [v11 hashes];
  uint64_t v71 = 3;
  double v28 = [(_PASBloomFilter *)v25 combineHashesWithSeed:3 hashA:v26 hashB:v27 reuse:self->_hashesTokenReuse];

  objc_storeStrong((id *)&self->_hashesTokenReuse, v28);
  unsigned int v29 = [(_PASBloomFilter *)self->_bloomFilter getWithHashes:v28];
  unsigned int v30 = v29;
  unsigned int v69 = v24;
  int v31 = v29 | v24;
  if ((v29 | v24))
  {
    unsigned int v68 = v29;
    goto LABEL_15;
  }

  unint64_t v75 = 1;
  if ([(LuceneContextRequest *)self _isIntermediateNameBigramCandidate:v10 tokenB:v11 bothStartUppercase:v70])
  {
    unsigned int v68 = v30;
    uint64_t v71 = 1;
    double v28 = 0;
LABEL_15:
    uint64_t v34 = self->_bloomFilter;
    uint64_t v35 = [v10 hashes];
    uint64_t v36 = [v11 hashes];
    id v37 = [(_PASBloomFilter *)v34 combineHashesWithSeed:5 hashA:v35 hashB:v36 reuse:self->_hashesTokenReuse];

    hashesTokenReuse = self->_hashesTokenReuse;
    self->_hashesTokenReuse = v37;
    char v39 = v37;

    LOBYTE(v36) = [(_PASBloomFilter *)self->_bloomFilter getWithHashes:v39];
    uint64_t v40 = self->_bloomFilter;
    long long v41 = [v10 hashes];
    id v42 = [v11 hashes];
    id v19 = [(_PASBloomFilter *)v40 combineHashesWithSeed:4 hashA:v41 hashB:v42 reuse:self->_hashesTokenReuse];

    int v43 = v31 ^ 1;
    objc_storeStrong((id *)&self->_hashesTokenReuse, v19);

    unsigned __int8 v44 = [(_PASBloomFilter *)self->_bloomFilter getWithHashes:v19];
    if ((v36 & 1) == 0 && (v44 & 1) == 0 && !v43)
    {
      if ((v68 ^ 1 | v69))
      {
        float v45 = -1.0;
        id v12 = v72;
        if (v69)
        {
          uint64_t v71 = 10;
          unint64_t v75 = 10;
          float v45 = 0.62;
        }
      }
      else
      {
        uint64_t v71 = 3;
        unint64_t v75 = 3;
        float v45 = 0.75;
        id v12 = v72;
      }
      if (self->_debug && self->_debugLogEnabled && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      {
        int v66 = [v10 token];
        id v67 = [v11 token];
        *(_DWORD *)buf = 134219522;
        uint64_t v77 = v71;
        __int16 v78 = 1024;
        unsigned int v79 = v68;
        __int16 v80 = 1024;
        unsigned int v81 = v69;
        __int16 v82 = 1024;
        int v83 = 0;
        __int16 v84 = 1024;
        int v85 = 0;
        __int16 v86 = 2112;
        uint64_t v87 = v66;
        __int16 v88 = 2112;
        uint64_t v89 = v67;
        _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "type:%lu primary:%i secondary:%i topic:%i name:%i bigram:%@ %@", buf, 0x38u);
      }
      LOBYTE(v43) = 0;
      id v47 = 0;
LABEL_43:
      p_engine = &self->_engine;
      id WeakRetained = objc_loadWeakRetained((id *)p_engine);
      unint64_t v50 = [WeakRetained wordlist];

      if (!v50) {
        goto LABEL_51;
      }
      id v73 = v19;
      char v51 = v43;
      id v52 = objc_loadWeakRetained((id *)p_engine);
      unint64_t v53 = [v52 wordlist];
      uint64_t v54 = [v53 words];
      int v55 = [v12 description];
      uint64_t v56 = [v54 objectForKeyedSubscript:v55];

      if (v56)
      {
        unsigned int v57 = [v56 intValue];
        if (v57)
        {
          LOBYTE(v43) = v51;
          if (v57 == -1)
          {
            unint64_t v75 = 0;
            float v45 = 0.0;
          }
          goto LABEL_50;
        }
        unint64_t v75 = 10;
        float v45 = 0.62;
      }
      LOBYTE(v43) = v51;
LABEL_50:

      id v19 = v73;
LABEL_51:
      uint64_t v58 = v75;
      if (v75 == 3)
      {
        if (v45 >= 0.65) {
          goto LABEL_63;
        }
        if (v45 >= 0.59)
        {
          unint64_t v75 = 10;
          goto LABEL_63;
        }
        uint64_t v58 = 1;
        unint64_t v75 = 1;
      }
      char v59 = v43 ^ 1;
      if (v58 != 1) {
        char v59 = 1;
      }
      if (v59)
      {
        if (v58 == 1)
        {
          int v60 = (void *)qword_100563110;
        }
        else
        {
          if (v58) {
            goto LABEL_63;
          }
          int v60 = (void *)qword_100563118;
        }
        uint64_t v63 = v60;
        goto LABEL_68;
      }
      unint64_t v75 = 13;
      float v45 = 0.62;
LABEL_63:
      id v61 = [BigramInfo alloc];
      *(float *)&double v62 = v45;
      uint64_t v63 = [(BigramInfo *)v61 initWithTerm:v47 bigramTokenA:v10 tokenB:v11 type:v75 weight:v74 docId:v62];
LABEL_68:
      char v33 = v63;

      goto LABEL_69;
    }
    uint64_t v46 = [(LuceneContextRequest *)self _lookupBigramTermForTokenA:v10 tokenB:v11 tokenTypeOut:&v75 docIdOut:&v74];
    float v45 = -1.0;
    if (v46)
    {
      id v47 = (id)v46;
      id v12 = v72;
      goto LABEL_43;
    }
    id v12 = v72;
    if ((v31 & 1) == 0)
    {
      id v47 = (id)qword_100563120;
      LOBYTE(v43) = 1;
      goto LABEL_43;
    }
    goto LABEL_65;
  }
  if (self->_debug && self->_debugLogEnabled && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_1002C9718(v10, v11);
  }
  char v33 = (BigramInfo *)(id)qword_100563110;
  id v12 = v72;
LABEL_69:

  return v33;
}

- (id)_constructQuery
{
  v127 = objc_opt_new();
  if (self->_debug)
  {
    long long v139 = objc_opt_new();
    id v138 = objc_opt_new();
  }
  else
  {
    id v138 = 0;
    long long v139 = 0;
  }
  uint64_t v3 = objc_opt_new();
  [v3 setMinimumNumberShouldMatchWithInt:2];
  uint64_t v128 = v3;
  uint64_t v130 = [v3 clauses];
  id v4 = objc_opt_new();
  [v4 setMinimumNumberShouldMatchWithInt:0];
  id v126 = v4;
  id v132 = [v4 clauses];
  unint64_t v129 = [(ContextConfiguration *)self->_config luceneForceSecondaryAfterPosition];
  long long v150 = 0u;
  long long v151 = 0u;
  long long v152 = 0u;
  long long v153 = 0u;
  uint64_t v5 = self->_tokenInfosSequence;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v150 objects:v155 count:16];
  v142 = self;
  if (!v6)
  {
    uint64_t v137 = 0;
    goto LABEL_55;
  }
  id v7 = v6;
  int v143 = 0;
  uint64_t v137 = 0;
  uint64_t v8 = *(void *)v151;
  uint64_t v140 = *(void *)v151;
  while (2)
  {
    BOOL v9 = 0;
    id v135 = v7;
    do
    {
      if (*(void *)v151 != v8) {
        objc_enumerationMutation(v5);
      }
      id v10 = *(void **)(*((void *)&v150 + 1) + 8 * (void)v9);
      if ([v10 valid])
      {
        unint64_t v11 = v10[1];
        if (v11 > 0xD) {
          goto LABEL_15;
        }
        if (((1 << v11) & 0x803) != 0) {
          goto LABEL_50;
        }
        if (((1 << v11) & 0x3000) != 0)
        {
          unsigned int v12 = [v10 isPrimary];
          float v13 = 0.0;
          int v14 = v143;
LABEL_27:
          unint64_t v30 = (unint64_t)[v10 isTermResultWithPrimary:v12 & (v14 ^ 1) config:self->_config];
          if ((v30 & 0x8000000000000000) == 0)
          {
            int v31 = [(LuceneContextRequest *)self _resultForTokenInfo:v10 minPrefix:v30];
            float v32 = v31;
            if (v31)
            {
              int v33 = v14;
              uint64_t v34 = [v31 docId];

              if (v34)
              {
                id v35 = [(NSMutableArray *)self->_termResultsWithDocument count];
                BOOL v36 = v35 >= (id)[(ContextConfiguration *)self->_config luceneMaxTermResultsWithDocument];
                int v14 = v33;
                if (!v36) {
                  [(NSMutableArray *)self->_termResultsWithDocument addObject:v32];
                }
              }
              else
              {
                id v37 = [(NSMutableArray *)self->_termResults count];
                BOOL v36 = v37 >= (id)[(ContextConfiguration *)self->_config luceneMaxTermResults];
                int v14 = v33;
                if (!v36)
                {
                  [(NSMutableArray *)self->_termResults addObject:v32];
                  if (v11 == 5 || v11 == 3)
                  {
                    weakKeywordTermResults = self->_weakKeywordTermResults;
                    uint64_t v40 = [v10 token];
                    long long v41 = weakKeywordTermResults;
                    int v14 = v33;
                    [(NSMutableDictionary *)v41 setObject:v32 forKey:v40];

                    self = v142;
                  }
                }
              }
            }
          }
          int v143 = v14;
          if (self->_debug)
          {
            CFStringRef v42 = @"+!";
            if (v14) {
              CFStringRef v42 = @"+?";
            }
            int v43 = v139;
            if (!v12) {
              int v43 = v138;
            }
            unsigned __int8 v44 = v5;
            if (v12) {
              CFStringRef v45 = v42;
            }
            else {
              CFStringRef v45 = @" ?";
            }
            id v46 = v43;
            [v10 weight];
            double v48 = v47;
            float v49 = [v10 token];
            id v50 = [v10 count];
            id v51 = [v10 firstOccurence];
            id v52 = [v10 firstOccurenceUnique];
            unint64_t v53 = [v10 term];
            uint64_t v54 = [v53 text];
            id v123 = v51;
            self = v142;
            CFStringRef v122 = v45;
            uint64_t v5 = v44;
            id v7 = v135;
            [v46 appendFormat:@"%@\t%f\t%f\t%@\n%4u\t%8u\t%8u\t%@\n", v122, *(void *)&v48, v13, v49, v50, v123, v52, v54];
          }
          uint64_t v8 = v140;
          goto LABEL_50;
        }
        if (v11 != 9)
        {
LABEL_15:
          [v10 weight];
          if (v15 <= 0.0) {
            goto LABEL_50;
          }
        }
        unsigned int v12 = [v10 isPrimary];
        id v16 = [ComAppleProactiveLuceneScoreInterceptTermQuery alloc];
        uint64_t v17 = [v10 term];
        char v18 = self;
        id v19 = (void *)v17;
        uint64_t v20 = 128;
        if (v12) {
          uint64_t v20 = 112;
        }
        uint64_t v21 = [(ComAppleProactiveLuceneScoreInterceptTermQuery *)v16 initWithOrgApacheLuceneIndexTerm:v17 withComAppleProactiveLuceneScoreInterceptTarget:*(Class *)((char *)&v18->super.isa + v20)];

        [(ComAppleProactiveLuceneScoreInterceptTermQuery *)v21 setUserObjectWithId:v10];
        unsigned int v22 = [v10 count];
        float v23 = (float)v22 + (float)v22;
        [v10 weight];
        float v13 = v23 * (float)((float)(v24 + 1.0) * (float)(v24 + 1.0));
        *(float *)&double v25 = v13;
        [(OrgApacheLuceneSearchQuery *)v21 setBoostWithFloat:v25];
        id v26 = [OrgApacheLuceneSearchBooleanClause alloc];
        id v27 = [(OrgApacheLuceneSearchBooleanClause *)v26 initWithOrgApacheLuceneSearchQuery:v21 withOrgApacheLuceneSearchBooleanClause_OccurEnum:qword_1005630D0];
        BOOL v28 = v143;
        if (((v12 ^ 1 | v143) & 1) == 0)
        {
          if (SHIDWORD(v137) > 63)
          {
            int v14 = 1;
            goto LABEL_23;
          }
          BOOL v28 = v129 <= [v10 firstOccurence];
        }
        int v14 = v28;
        if (((v12 ^ 1 | v28) & 1) == 0)
        {
          int v14 = 0;
          ++HIDWORD(v137);
          unsigned int v29 = v130;
          self = v142;
LABEL_26:
          [v29 addWithId:v27];

          goto LABEL_27;
        }
LABEL_23:
        self = v142;
        if ((int)v137 > 255)
        {

          goto LABEL_55;
        }
        LODWORD(v137) = v137 + 1;
        unsigned int v29 = v132;
        goto LABEL_26;
      }
LABEL_50:
      BOOL v9 = (char *)v9 + 1;
    }
    while (v7 != v9);
    id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v150 objects:v155 count:16];
    if (v7) {
      continue;
    }
    break;
  }
LABEL_55:

  [(NSMutableArray *)self->_tokenInfosSequence removeAllObjects];
  if (SHIDWORD(v137) < 64 || (int)v137 <= 255)
  {
    uint64_t v125 = objc_opt_new();
    long long v146 = 0u;
    long long v147 = 0u;
    long long v148 = 0u;
    long long v149 = 0u;
    obuint64_t j = self->_bigramInfosSequence;
    id v141 = [(NSMutableArray *)obj countByEnumeratingWithState:&v146 objects:v154 count:16];
    if (!v141) {
      goto LABEL_133;
    }
    int v55 = 0;
    uint64_t v136 = *(void *)v147;
    while (1)
    {
      uint64_t v56 = 0;
      do
      {
        if (*(void *)v147 != v136) {
          objc_enumerationMutation(obj);
        }
        unsigned int v57 = *(void **)(*((void *)&v146 + 1) + 8 * (void)v56);
        uint64_t v145 = 0;
        uint64_t v58 = v57[1];
        uint64_t v145 = v58;
        if (v58 <= 5)
        {
          if (!v58) {
            goto LABEL_123;
          }
          if (v58 != 1) {
            goto LABEL_67;
          }
        }
        else
        {
          if ((unint64_t)(v58 - 6) < 2) {
            goto LABEL_64;
          }
          if (v58 != 13)
          {
LABEL_67:
            [v57 weight];
            if (v60 <= 0.0) {
              goto LABEL_123;
            }
LABEL_64:
            int v59 = 1;
            goto LABEL_71;
          }
        }
        int v59 = 0;
LABEL_71:
        unsigned int v61 = [v57 isPrimary];
        double v62 = [v57 term];
        uint64_t v63 = [v62 text];

        float v64 = 0.0;
        v144 = v56;
        if (!v59) {
          goto LABEL_100;
        }
        [v57 adjustCounts];
        uint64_t v65 = [v57 term];
        if (v65)
        {
          int v66 = (void *)v65;
        }
        else
        {
          id v67 = [v57 tokenA];
          unsigned int v68 = [v57 tokenB];
          int v66 = [(LuceneContextRequest *)self _lookupBigramTermForTokenA:v67 tokenB:v68 tokenTypeOut:&v145 docIdOut:0];

          if (!v66)
          {

            goto LABEL_123;
          }
          uint64_t v69 = [v66 text];

          uint64_t v63 = (void *)v69;
        }
        long long v133 = v63;
        if (v61) {
          unsigned int v61 = +[TokenInfo isPrimaryType:v145];
        }
        BOOL v70 = [ComAppleProactiveLuceneScoreInterceptTermQuery alloc];
        uint64_t v71 = 120;
        if (!v61) {
          uint64_t v71 = 128;
        }
        id v72 = [(ComAppleProactiveLuceneScoreInterceptTermQuery *)v70 initWithOrgApacheLuceneIndexTerm:v66 withComAppleProactiveLuceneScoreInterceptTarget:*(Class *)((char *)&self->super.isa + v71)];
        [(ComAppleProactiveLuceneScoreInterceptTermQuery *)v72 setUserObjectWithId:v57];
        id v73 = v72;
        float v64 = (float)[v57 count];
        if (v61)
        {
          [v57 weight];
          float v64 = (float)((float)(*(float *)&v74 + 1.0) * (float)(*(float *)&v74 + 1.0)) * v64;
          char v75 = v55;
        }
        else
        {
          char v75 = 1;
        }
        *(float *)&double v74 = v64;
        [(OrgApacheLuceneSearchQuery *)v73 setBoostWithFloat:v74];
        BOOL v76 = [OrgApacheLuceneSearchBooleanClause alloc];
        uint64_t v77 = [(OrgApacheLuceneSearchBooleanClause *)v76 initWithOrgApacheLuceneSearchQuery:v73 withOrgApacheLuceneSearchBooleanClause_OccurEnum:qword_1005630D0];
        if ((v75 & 1) == 0)
        {
          if (SHIDWORD(v137) > 63)
          {
            int v55 = 1;
            int v78 = v137;
            goto LABEL_94;
          }
          if (v129 <= [v57 firstOccurence])
          {
            unsigned int v79 = [v57 tokenA];
            unsigned int v80 = [v79 firstOccurence];

            unsigned int v81 = [v57 tokenB];
            int v82 = v55;
            unsigned int v83 = [v81 firstOccurence];

            if (v80 >= v83) {
              unint64_t v84 = v83;
            }
            else {
              unint64_t v84 = v80;
            }
            self = v142;
            int v55 = (v129 <= v84) | v82;
          }
        }
        int v78 = v137;
        if (v61 && (v55 & 1) == 0)
        {
          int v55 = 0;
          ++HIDWORD(v137);
          int v85 = v130;
          goto LABEL_96;
        }
LABEL_94:
        if (v78 > 255)
        {
          int v86 = 0;
          goto LABEL_98;
        }
        LODWORD(v137) = v78 + 1;
        int v85 = v132;
LABEL_96:
        [v85 addWithId:v77];
        int v86 = 1;
LABEL_98:

        unsigned int v61 = v61 != 0;
        if (!v86)
        {

          goto LABEL_133;
        }
        uint64_t v63 = v133;
LABEL_100:
        unint64_t v87 = (unint64_t)[v57 isTermResultWithPrimary:v61 & (v55 ^ 1) config:self->_config];
        if ((v87 & 0x8000000000000000) == 0)
        {
          __int16 v88 = [(LuceneContextRequest *)self _resultForBigramInfo:v57 minPrefix:v87];
          if (v88)
          {
            uint64_t v89 = v63;
            int v90 = [v57 tokenA];
            uint64_t v91 = [v90 token];

            id v92 = [v57 tokenB];
            int v93 = [v92 token];

            CGRect v94 = [v88 docId];

            if (v94)
            {
              id v95 = [(NSMutableArray *)self->_termResultsWithDocument count];
              CGRect v96 = self;
              if (v95 < (id)[(ContextConfiguration *)self->_config luceneMaxTermAndBigramResultsWithDocument])
              {
                termResultsWithDocument = self->_termResultsWithDocument;
                goto LABEL_109;
              }
              goto LABEL_110;
            }
            id v98 = [(NSMutableArray *)self->_termResults count];
            CGRect v96 = self;
            if (v98 >= (id)[(ContextConfiguration *)self->_config luceneMaxTermAndBigramResults])goto LABEL_110; {
            CGRect v99 = [v57 tokenB];
            }
            uint64_t v100 = v99;
            if (v99[1] == 5)
            {

              CGRect v96 = v142;
              goto LABEL_108;
            }
            if ([v125 containsObject:v91])
            {

              CGRect v96 = v142;
              goto LABEL_110;
            }
            unsigned __int8 v112 = [v125 containsObject:v93];

            CGRect v96 = v142;
            if ((v112 & 1) == 0)
            {
LABEL_108:
              [v125 addObject:v91];
              [v125 addObject:v93];
              termResultsWithDocument = v96->_termResults;
LABEL_109:
              [(NSMutableArray *)termResultsWithDocument addObject:v88];
            }
LABEL_110:
            v101 = [(NSMutableDictionary *)v96->_weakKeywordTermResults objectForKey:v91];
            if (v101)
            {
              [(NSMutableDictionary *)v96->_weakKeywordTermResults removeObjectForKey:v91];
              [(NSMutableArray *)v96->_termResults removeObject:v101];
            }
            id v102 = [(NSMutableDictionary *)v96->_weakKeywordTermResults objectForKey:v93];

            if (v102)
            {
              [(NSMutableDictionary *)v96->_weakKeywordTermResults removeObjectForKey:v93];
              [(NSMutableArray *)v96->_termResults removeObject:v102];
            }

            self = v96;
            uint64_t v63 = v89;
          }
        }
        if (self->_debug)
        {
          CFStringRef v103 = @"+!";
          if (v55) {
            CFStringRef v103 = @"+?";
          }
          char v104 = v139;
          if (!v61)
          {
            char v104 = v138;
            CFStringRef v103 = @" ?";
          }
          CFStringRef v134 = v103;
          id v105 = v104;
          [v57 weight];
          double v107 = v106;
          id v108 = [v57 tokenA];
          id v109 = [v108 token];
          unsigned int v110 = [v57 tokenB];
          v111 = [v110 token];
          [v105 appendFormat:@"%@\t%f\t%f\t%@ %@\n%4u\t%8u\t%8u\t%@\n", v134, *(void *)&v107, v64, v109, v111, objc_msgSend(v57, "count"), objc_msgSend(v57, "firstOccurence"), objc_msgSend(v57, "firstOccurenceUnique"), v63];

          self = v142;
        }

        uint64_t v56 = v144;
LABEL_123:
        uint64_t v56 = (char *)v56 + 1;
      }
      while (v141 != v56);
      id v113 = [(NSMutableArray *)obj countByEnumeratingWithState:&v146 objects:v154 count:16];
      id v141 = v113;
      if (!v113)
      {
LABEL_133:

        break;
      }
    }
  }
  [(NSMutableArray *)self->_bigramInfosSequence removeAllObjects];
  objc_msgSend(v127, "addWithOrgApacheLuceneSearchQuery:withOrgApacheLuceneSearchBooleanClause_OccurEnum:", v128, qword_1005630C0);
  if (([v132 isEmpty] & 1) == 0) {
    objc_msgSend(v127, "addWithOrgApacheLuceneSearchQuery:withOrgApacheLuceneSearchBooleanClause_OccurEnum:", v126, qword_1005630D0);
  }
  if (self->_debug)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_1002C97F4((uint64_t)self, v128, v126);
    }
    [(CKContextResponse *)self->_response appendToDebug:v139];
    [(CKContextResponse *)self->_response appendToDebug:v138];
    response = self->_response;
    NSUInteger v115 = [(NSMapTable *)self->_tokenInfos count];
    NSUInteger v116 = [(NSMapTable *)self->_bigramInfos count];
    int v117 = [v128 clauses];
    uint64_t v118 = (int)[v117 size];
    unsigned int v119 = [v126 clauses];
    -[CKContextResponse addDebug:](response, "addDebug:", @"Tokens: %lu, Phrases: %lu, Primary queries: %lu, Secondary queries: %lu", v115, v116, v118, (int)[v119 size]);
  }
  if (HIDWORD(v137)) {
    id v120 = v127;
  }
  else {
    id v120 = 0;
  }

  return v120;
}

- (id)_bestTypeVariantForTokenInfo:(id)a3 allowingAllCaps:(BOOL)a4
{
  id v6 = a3;
  id v7 = [v6 offsets];
  id v8 = [v7 count];

  if (!v8)
  {
    int v33 = [v6 token];
    uint64_t v34 = [v33 localizedCapitalizedString];

    goto LABEL_39;
  }
  BOOL v38 = a4;
  int v43 = [(CKContextRequest *)self->_request text];
  BOOL v9 = objc_opt_new();
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v10 = [v6 offsets];
  id v11 = [v10 countByEnumeratingWithState:&v48 objects:v53 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v49;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v49 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = [*(id *)(*((void *)&v48 + 1) + 8 * i) rangeValue];
        uint64_t v17 = [v43 substring:v15 endIndex:v16];
        [v9 addObject:v17];
      }
      id v12 = [v10 countByEnumeratingWithState:&v48 objects:v53 count:16];
    }
    while (v12);
  }

  id v39 = v6;
  CFStringRef v42 = [v6 token];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v18 = v9;
  id v19 = [v18 countByEnumeratingWithState:&v44 objects:v52 count:16];
  if (v19)
  {
    id v20 = v19;
    id v40 = 0;
    long long v41 = 0;
    id v21 = 0;
    uint64_t v22 = *(void *)v45;
    do
    {
      for (uint64_t j = 0; j != v20; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v45 != v22) {
          objc_enumerationMutation(v18);
        }
        float v24 = *(void **)(*((void *)&v44 + 1) + 8 * (void)j);
        id v25 = [v18 countForObject:v24];
        id v26 = [v24 rangeOfCharacterFromSet:qword_1005630E0];
        id v27 = [v24 rangeOfCharacterFromSet:qword_1005630E8];
        if (v25 > v21)
        {
          id v28 = v27;
          BOOL v29 = (unint64_t)[v24 length] >= 6 && v26 == (id)0x7FFFFFFFFFFFFFFFLL;
          if (!v29 && v28 != (id)0x7FFFFFFFFFFFFFFFLL)
          {
            if (v26 != (id)0x7FFFFFFFFFFFFFFFLL)
            {
              id v31 = v24;

              long long v41 = v31;
              id v21 = v25;
            }
            id v32 = v24;

            id v40 = v25;
            CFStringRef v42 = v32;
          }
        }
      }
      id v20 = [v18 countByEnumeratingWithState:&v44 objects:v52 count:16];
    }
    while (v20);
  }
  else
  {
    id v40 = 0;
    long long v41 = 0;
    id v21 = 0;
  }

  if (v40 && v21 && v21 < v40)
  {
    id v35 = v41;
    id v36 = v41;
    uint64_t v34 = v42;
  }
  else
  {
    id v35 = v41;
    uint64_t v34 = v42;
    if (v40 && v38) {
      goto LABEL_38;
    }
    id v36 = [v42 localizedCapitalizedString];
  }

  uint64_t v34 = v36;
LABEL_38:

  id v6 = v39;
LABEL_39:

  return v34;
}

- (id)_resultForTokenInfo:(id)a3 minPrefix:(int64_t)a4
{
  id v6 = a3;
  BOOL v76 = self;
  uint64_t v77 = v6;
  if (!+[TokenInfo isSurnameType:v6[1]])
  {
    unsigned int v51 = [v6 count];
    if (self->_config->_luceneTermResultMinCount <= v51 - [v6 partialNgramCount]) {
      goto LABEL_43;
    }
    BOOL v29 = 0;
    goto LABEL_55;
  }
  if (!self->_config->_luceneTermResultGivenSurnameEnabled)
  {
LABEL_40:
    BOOL v29 = 0;
    goto LABEL_55;
  }
  id v7 = [v6 precedingTokens];
  if (![v7 count])
  {
LABEL_37:
    if (([v6 isQuoted] & 1) == 0)
    {
      if (a4 >= 1)
      {

        goto LABEL_40;
      }
      a4 = 1;
    }

    goto LABEL_43;
  }
  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v80 objects:v84 count:16];
  if (!v9)
  {

    goto LABEL_37;
  }
  id v10 = v9;
  id v73 = v7;
  int64_t v75 = a4;
  id v11 = 0;
  int v78 = v8;
  unsigned int v79 = 0;
  uint64_t v12 = *(void *)v81;
  do
  {
    for (i = 0; i != v10; i = (char *)i + 1)
    {
      if (*(void *)v81 != v12) {
        objc_enumerationMutation(v8);
      }
      int v14 = *(void **)(*((void *)&v80 + 1) + 8 * i);
      id v15 = [v8 countForObject:v14];
      uint64_t v16 = [v14 nonretainedObjectValue];
      if (v16)
      {
        if ((uint64_t)v15 >= (int64_t)self->_config->_luceneGivenSurnameMinGivenCount
          || self->_config->_luceneGivenSurnameEarlyMentionLimit >= [v6 firstOccurence])
        {
LABEL_15:
          if ((uint64_t)v15 <= (uint64_t)v11) {
            goto LABEL_19;
          }
          id v20 = v79;
          id v11 = v15;
          unsigned int v79 = v16;
        }
        else
        {
          uint64_t v17 = [BigramKey alloc];
          id v18 = [v16 token];
          id v19 = [v6 token];
          id v20 = [(BigramKey *)v17 initWithTokenA:v18 tokenB:v19];

          self = v76;
          id v21 = [(NSMapTable *)v76->_bigramInfos objectForKey:v20];
          uint64_t v22 = v21;
          if (v21 && [v21 isPrimary])
          {

            id v6 = v77;
            id v8 = v78;
            goto LABEL_15;
          }

          id v6 = v77;
        }

        id v8 = v78;
      }
LABEL_19:
    }
    id v10 = [v8 countByEnumeratingWithState:&v80 objects:v84 count:16];
  }
  while (v10);

  id v7 = v73;
  a4 = v75;
  if (!v79) {
    goto LABEL_37;
  }
  uint64_t v23 = [(LuceneContextRequest *)self _bestTypeVariantForTokenInfo:v79 allowingAllCaps:0];
  uint64_t v24 = [(LuceneContextRequest *)self _bestTypeVariantForTokenInfo:v6 allowingAllCaps:0];
  id v25 = v6;
  id v26 = [LuceneContextResult alloc];
  id v72 = (void *)v24;
  double v74 = (void *)v23;
  id v27 = +[NSString stringWithFormat:@"%@ %@", v23, v24];
  id v28 = self;
  BOOL v29 = [(LuceneContextResult *)v26 initWithText:v27];

  unint64_t v30 = [(BigramKey *)v79 term];
  id v31 = [v30 text];
  id v32 = [v25 term];
  int v33 = [v32 text];
  uint64_t v34 = +[NSString stringWithFormat:@"%@ %@", v31, v33];
  [(LuceneContextResult *)v29 setTerm:v34];

  float v35 = (float)[(ContextConfiguration *)v28->_config luceneTermResultUnigramScoreMultiplier];
  float v36 = powf((float)([v25 firstOccurenceUnique] + 1), (float)-[ContextConfiguration luceneTermResultFirstOccurrencePowerLawDecay](v28->_config, "luceneTermResultFirstOccurrencePowerLawDecay"))* v35;
  float v37 = (float)[(BigramKey *)v79 count];
  [(BigramKey *)v79 weight];
  float v39 = (float)((float)(v38 + 1.0) * (float)(v38 + 1.0)) * v37;
  float v40 = (float)[v25 count];
  [v25 weight];
  *(float *)&double v41 = (float)((float)(*(float *)&v41 + 1.0) * (float)(*(float *)&v41 + 1.0)) * v40;
  if (v39 >= *(float *)&v41) {
    *(float *)&double v41 = v39;
  }
  *(float *)&double v41 = v36 * *(float *)&v41;
  [(LuceneContextResult *)v29 setLuceneScore:v41];
  if ([(ContextConfiguration *)v28->_config tagsEnabled])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&v28->_engine);
    int v43 = [WeakRetained tagsMap];

    if (v43)
    {
      long long v44 = +[NSSet setWithObject:@"CK_PERSON_GIVEN_SURNAME"];
      [(LuceneContextResult *)v29 setTags:v44];
    }
  }
  if (v28->_debug)
  {
    if ([(BigramKey *)v79 isPrimary]) {
      CFStringRef v45 = @"+";
    }
    else {
      CFStringRef v45 = @"?";
    }
    long long v46 = [(BigramKey *)v79 term];
    long long v47 = [v46 text];
    long long v48 = [v77 term];
    long long v49 = [v48 text];
    long long v50 = +[NSString stringWithFormat:@"%@%@ +%@", v45, v47, v49];
    [(LuceneContextResult *)v29 setDebug:v50];
  }
  a4 = v75;
  if (!v29)
  {
LABEL_43:
    id v52 = [LuceneContextResult alloc];
    unint64_t v53 = [(LuceneContextRequest *)v76 _bestTypeVariantForTokenInfo:v77 allowingAllCaps:1];
    BOOL v29 = [(LuceneContextResult *)v52 initWithText:v53];

    uint64_t v54 = [v77 term];
    int v55 = [v54 text];
    [(LuceneContextResult *)v29 setTerm:v55];

    float v56 = (float)[(ContextConfiguration *)v76->_config luceneTermResultUnigramScoreMultiplier];
    float v57 = powf((float)([v77 firstOccurenceUnique] + 1), (float)-[ContextConfiguration luceneTermResultFirstOccurrencePowerLawDecay](v76->_config, "luceneTermResultFirstOccurrencePowerLawDecay"))* v56;
    float v58 = v57 * (float)[v77 count];
    [v77 weight];
    *(float *)&double v60 = v58 * (float)((float)(v59 + 1.0) * (float)(v59 + 1.0));
    [(LuceneContextResult *)v29 setLuceneScore:v60];
    if (v76->_debug)
    {
      unsigned int v61 = [v77 term];
      uint64_t v62 = qword_100563120;

      if (v61 == (void *)v62)
      {
        uint64_t v63 = [v77 token];
        +[NSString stringWithFormat:@"?%@", v63];
      }
      else
      {
        uint64_t v63 = [(LuceneContextResult *)v29 term];
        +[NSString stringWithFormat:@"+%@", v63];
      float v64 = };
      [(LuceneContextResult *)v29 setDebug:v64];
    }
  }
  [(LuceneContextResult *)v29 setMinPrefix:a4];
  id v6 = v77;
  id v65 = [v77 docId];
  if ((v65 & 0x80000000) == 0)
  {
    id v66 = v65;
    unsigned int v67 = [v77 count];
    BOOL v68 = [(ContextConfiguration *)v76->_config minTokenCountToAugment] <= v67;
    id v6 = v77;
    if (v68) {
      [(LuceneContextRequest *)v76 _augmentResult:v29 withDocId:v66 checkLanguageRedirect:1];
    }
  }
  if (v76->_debug)
  {
    [(LuceneContextResult *)v29 luceneScore];
    BOOL v70 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"0 %f T (token result, count:%u, minPrefix:%li, docId:%i)", v69, [v77 count], a4, objc_msgSend(v77, "docId"));
    [(LuceneContextResult *)v29 setCategory:v70];

    id v6 = v77;
  }
  [(LuceneContextResult *)v29 setExactMatch:1];
LABEL_55:

  return v29;
}

- (id)_resultForBigramInfo:(id)a3 minPrefix:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = v6[1];
  if (!+[TokenInfo isTopicType:v7]) {
    goto LABEL_4;
  }
  if (v7 != 3) {
    goto LABEL_5;
  }
  unsigned int v8 = [v6 count];
  id v9 = [v6 tokenA];
  unsigned int v10 = [v9 partialNgramCount];
  id v11 = [v6 tokenB];
  int v12 = v8 - (v10 + [v11 partialNgramCount]);

  if (v12 >= 2)
  {
LABEL_5:
    int v14 = [v6 tokenA];
    id v15 = [(LuceneContextRequest *)self _bestTypeVariantForTokenInfo:v14 allowingAllCaps:1];

    uint64_t v16 = [v6 tokenB];
    uint64_t v17 = [(LuceneContextRequest *)self _bestTypeVariantForTokenInfo:v16 allowingAllCaps:1];

    CFStringRef v18 = @"%@ %@";
    if (+[LanguageUtilities isChineseJapaneseToken:v15]
      && +[LanguageUtilities isChineseJapaneseToken:v17])
    {
      CFStringRef v18 = @"%@%@";
    }
    id v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v18, v15, v17);
    uint64_t v13 = [[LuceneContextResult alloc] initWithText:v19];
    id v20 = [v6 term];
    id v21 = [v20 text];
    if (v21)
    {
      [(LuceneContextResult *)v13 setTerm:v21];
    }
    else
    {
      int64_t v46 = a4;
      uint64_t v22 = v15;
      uint64_t v23 = v17;
      uint64_t v24 = v19;
      id v25 = [v6 termSequence];
      id v26 = +[NSString stringWithFormat:@"\"%@\"", v25];
      [(LuceneContextResult *)v13 setTerm:v26];

      id v19 = v24;
      uint64_t v17 = v23;
      id v15 = v22;
      a4 = v46;
    }
    [(LuceneContextResult *)v13 setMinPrefix:a4];
    id v27 = [v6 docId];
    if ((v27 & 0x80000000) == 0)
    {
      id v28 = v27;
      unsigned int v29 = [v6 count];
      if ([(ContextConfiguration *)self->_config minTokenCountToAugment] <= v29) {
        [(LuceneContextRequest *)self _augmentResult:v13 withDocId:v28 checkLanguageRedirect:1];
      }
    }
    float v30 = (float)[(ContextConfiguration *)self->_config luceneTermResultBigramScoreMultiplier];
    float v31 = powf((float)([v6 firstOccurenceUnique] + 1), (float)-[ContextConfiguration luceneTermResultFirstOccurrencePowerLawDecay](self->_config, "luceneTermResultFirstOccurrencePowerLawDecay"))* v30;
    float v32 = v31 * (float)[v6 count];
    [v6 weight];
    float v33 = *(float *)&v35 + 1.0;
    BOOL v34 = *(float *)&v35 <= 1.0;
    LODWORD(v35) = 2.0;
    if (!v34) {
      *(float *)&double v35 = v33;
    }
    *(float *)&double v35 = v32 * (float)(*(float *)&v35 * *(float *)&v35);
    [(LuceneContextResult *)v13 setLuceneScore:v35];
    if (self->_debug)
    {
      [(LuceneContextResult *)v13 luceneScore];
      float v37 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"0 %f B (token bigram result, count:%u, minPrefix:%li, docId:%i)", v36, [v6 count], a4, objc_msgSend(v6, "docId"));
      [(LuceneContextResult *)v13 setCategory:v37];

      float v38 = [v6 term];
      uint64_t v39 = qword_100563120;

      if (v38 == (void *)v39)
      {
        float v40 = [v6 tokenA];
        double v41 = [v40 token];
        CFStringRef v42 = [v6 tokenB];
        int v43 = [v42 token];
        long long v44 = +[NSString stringWithFormat:@"?%@_%@", v41, v43];
        [(LuceneContextResult *)v13 setDebug:v44];
      }
      else
      {
        float v40 = [(LuceneContextResult *)v13 term];
        double v41 = +[NSString stringWithFormat:@"+%@", v40];
        [(LuceneContextResult *)v13 setDebug:v41];
      }
    }
    [(LuceneContextResult *)v13 setExactMatch:1];
  }
  else
  {
LABEL_4:
    uint64_t v13 = 0;
  }

  return v13;
}

- (void)_augmentResult:(id)a3 withDocId:(int)a4 checkLanguageRedirect:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  if ((v6 & 0x80000000) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
    int v10 = [WeakRetained maxDoc];

    if (v10 > (int)v6)
    {
      id v11 = [[LuceneResultDocument alloc] initWithDocId:v6 withLuceneContextRequest:self];
      int v12 = [(LuceneResultDocument *)v11 getDocument];
      int v31 = 0;
      if (v5) {
        uint64_t v13 = &v31;
      }
      else {
        uint64_t v13 = 0;
      }
      int v14 = [(LuceneResultDocument *)v11 bestTitleWithSeeOtherDocIdRelative:v13];
      id v15 = [v14 title];

      if (v15)
      {
        uint64_t v16 = [v8 title];
        uint64_t v29 = [v8 docId];
        if (v31 + (int)v6 >= (int)v6) {
          uint64_t v17 = v6;
        }
        else {
          uint64_t v17 = (v31 + v6);
        }
        CFStringRef v18 = objc_msgSend(v8, "docId", v29);

        if (v18)
        {
          id v19 = [v8 docId];
          int v20 = [v19 intValue];

          if (v20 >= (int)v17) {
            uint64_t v17 = v17;
          }
          else {
            uint64_t v17 = v20;
          }
        }
        id v21 = +[NSNumber numberWithInt:v17];
        [v8 setDocId:v21];

        [v8 setTitle:v15];
        if (v16 && ([v16 isEqualToString:v15] & 1) == 0)
        {
          uint64_t v22 = [[LuceneContextResult alloc] initWithText:v16];
          uint64_t v23 = [v8 topicId];
          [(LuceneContextResult *)v22 setTopicId:v23];

          LODWORD(v23) = self->_debug;
          uint64_t v24 = [v8 category];
          id v25 = v24;
          if (v23)
          {
            id v26 = [v24 stringByAppendingString:@" (alternative title)"];
            [(LuceneContextResult *)v22 setCategory:v26];
          }
          else
          {
            [(LuceneContextResult *)v22 setCategory:v24];
          }

          [(LuceneContextResult *)v22 setDocId:v30];
          id v27 = [v8 debug];
          [(LuceneContextResult *)v22 setDebug:v27];

          [(LuceneContextResult *)v22 setForceBottomRank:1];
          [(LuceneContextResult *)v22 setFoldScore:0x8000000000000000];
          [(LuceneContextResult *)v22 setMinPrefix:3];
          [v8 addToFoldedResults:v22];
        }
      }
      id v28 = [v12 getWithNSString:@"portrait"];
      if (v28) {
        [v8 setTopicId:v28];
      }
      if (v31) {
        [(LuceneContextRequest *)self _augmentResult:v8 withDocId:(v31 + v6) checkLanguageRedirect:0];
      }
      [(LuceneContextRequest *)self postprocessAddQuery:v8];
    }
  }
}

- (void)_searchTopKWithQuery:(id)a3 topK:(unint64_t)a4
{
  id v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  id v11 = sub_1002C4470;
  int v12 = &unk_10048BFE0;
  id v6 = a3;
  id v13 = v6;
  int v14 = self;
  unint64_t v15 = a4;
  +[Util elapsedMillisForBlock:&v9 enableTiming:self->_timing];
  if (self->_timing)
  {
    float v8 = v7;
    [(CKContextResponse *)self->_response addDebug:@"tSearch:%f", v8, v9, v10, v11, v12];
  }
}

- (void)_processResults:(id)a3 topK:(unint64_t)a4
{
  id v6 = (id *)a3;
  BOOL v76 = [(CKContextResponse *)self->_response results];
  double v7 = (NSMutableDictionary *)objc_opt_new();
  fingerprints = self->_fingerprints;
  self->_fingerprints = v7;

  id v9 = (NSMutableDictionary *)objc_opt_new();
  fingerprintsPrimardouble y = self->_fingerprintsPrimary;
  self->_fingerprintsPrimardouble y = v9;

  id v11 = +[NSMutableSet setWithCapacity:6];
  extractTermsReuse = self->_extractTermsReuse;
  self->_extractTermsReuse = v11;

  *(_WORD *)&self->_haveFingerprintDupes = 0;
  long long v80 = self;
  [(ContextConfiguration *)self->_config luceneMinRelativeScore];
  float v14 = v13;
  long long v109 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  int64_t v75 = v6;
  uint64_t v15 = (uint64_t)v6[2];
  id v16 = [(id)v15 countByEnumeratingWithState:&v109 objects:v118 count:16];
  if (v16)
  {
    id v17 = v16;
    self = 0;
    uint64_t v18 = *(void *)v110;
    float v19 = -1.0;
    while (2)
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v110 != v18) {
          objc_enumerationMutation((id)v15);
        }
        uint64_t v21 = *(void *)(*((void *)&v109 + 1) + 8 * i);
        if ((*(_DWORD *)(v21 + 12) & 0x80000000) == 0)
        {
          if (v19 < 0.0) {
            float v19 = *(float *)(v21 + 8);
          }
          if ((float)(*(float *)(v21 + 8) / v19) < v14) {
            goto LABEL_17;
          }
          uint64_t v22 = -[LuceneContextRequest _processResult:score:relativeScore:](v80, "_processResult:score:relativeScore:");
          if (v22)
          {
            [v76 addObject:v22];
            self = (LuceneContextRequest *)((char *)self + 1);
            if ((unint64_t)self >= a4)
            {

              goto LABEL_17;
            }
          }
        }
      }
      id v17 = [(id)v15 countByEnumeratingWithState:&v109 objects:v118 count:16];
      if (v17) {
        continue;
      }
      break;
    }
  }
LABEL_17:

  uint64_t v23 = v80;
  NSFreeMapTable(v80->_perDocumentObjects);
  perDocumentObjects = v80->_perDocumentObjects;
  v80->_perDocumentObjects = 0;

  uint64_t v77 = objc_opt_new();
  LODWORD(v15) = [(CKContextRequest *)v80->_request dontSkip];
  int64_t v25 = [(ContextConfiguration *)v80->_config minPrefixAdditionalResults];
  long long v83 = 0;
  uint64_t v74 = v25;
  if ((v15 & 1) == 0 && (v25 & 0x8000000000000000) == 0) {
    long long v83 = objc_opt_new();
  }
  int v85 = v15;
  if (v80->_haveFingerprintDupes || v80->_needFingerprintPostprocessing)
  {
    long long v107 = 0u;
    long long v108 = 0u;
    long long v105 = 0u;
    long long v106 = 0u;
    id v26 = v76;
    id v27 = (LuceneContextRequest *)[v26 countByEnumeratingWithState:&v105 objects:v117 count:16];
    if (v27)
    {
      id v28 = v27;
      uint64_t v29 = *(void *)v106;
      do
      {
        self = 0;
        do
        {
          if (*(void *)v106 != v29) {
            objc_enumerationMutation(v26);
          }
          float v30 = *(void **)(*((void *)&v105 + 1) + 8 * (void)self);
          int v31 = [v30 fingerprintPrimary];
          if (v80->_needFingerprintPostprocessing && ([v30 skip] & 1) == 0 && v31)
          {
            uint64_t v32 = [(NSMutableDictionary *)v80->_fingerprintsPrimary objectForKey:v31];
            float v33 = (void *)v32;
            if (v32) {
              BOOL v34 = v30 == (void *)v32;
            }
            else {
              BOOL v34 = 1;
            }
            if (!v34 && ([v30 titlePrimary] & 1) == 0) {
              [v30 setSkip:1];
            }
          }
          double v35 = [v30 foldedResults];
          if (v35)
          {
            [(LuceneContextRequest *)v80 _rerankFoldedResults:v35];
            [v30 finalizeFoldedResult];
            if ((v15 & 1) == 0)
            {
              [v83 addObjectsFromArray:v35];
              [v30 setFoldedResults:0];
            }
          }
          if ([v30 skip])
          {
            if ([v30 titlePrimary])
            {
              [v30 setSkip:0];
            }
            else if (v15)
            {
              float v36 = [v30 category];
              uint64_t v15 = [v36 stringByAppendingString:@" (would skip)"];
              [v30 setCategory:v15];

              LODWORD(v15) = v85;
            }
            else if (v80->_needFingerprintPostprocessing)
            {
              [v77 addObject:v30];
            }
          }

          self = (LuceneContextRequest *)((char *)self + 1);
        }
        while (v28 != self);
        id v28 = (LuceneContextRequest *)[v26 countByEnumeratingWithState:&v105 objects:v117 count:16];
      }
      while (v28);
    }

    if (v15)
    {
      if (v80->_haveFingerprintDupes)
      {
        float v37 = objc_opt_new();
        long long v101 = 0u;
        long long v102 = 0u;
        long long v103 = 0u;
        long long v104 = 0u;
        obuint64_t j = v26;
        unint64_t v84 = (LuceneContextRequest *)[obj countByEnumeratingWithState:&v101 objects:v116 count:16];
        if (v84)
        {
          uint64_t v81 = *(void *)v102;
          do
          {
            self = 0;
            do
            {
              if (*(void *)v102 != v81) {
                objc_enumerationMutation(obj);
              }
              float v38 = *(void **)(*((void *)&v101 + 1) + 8 * (void)self);
              uint64_t v39 = [v38 foldedResults];

              if (v39)
              {
                long long v99 = 0u;
                long long v100 = 0u;
                long long v97 = 0u;
                long long v98 = 0u;
                unint64_t v87 = v38;
                float v40 = [v38 foldedResults];
                id v41 = [v40 countByEnumeratingWithState:&v97 objects:v115 count:16];
                if (v41)
                {
                  id v42 = v41;
                  uint64_t v43 = *(void *)v98;
                  char v44 = 1;
                  do
                  {
                    for (uint64_t j = 0; j != v42; uint64_t j = (char *)j + 1)
                    {
                      if (*(void *)v98 != v43) {
                        objc_enumerationMutation(v40);
                      }
                      int64_t v46 = *(void **)(*((void *)&v97 + 1) + 8 * (void)j);
                      if ((v44 & 1) == 0)
                      {
                        long long v47 = [*(id *)(*((void *)&v97 + 1) + 8 * (void)j) category];
                        long long v48 = [v47 stringByAppendingString:@" (would skip)"];
                        [v46 setCategory:v48];
                      }
                      [v37 addObject:v46];
                      char v44 = 0;
                    }
                    id v42 = [v40 countByEnumeratingWithState:&v97 objects:v115 count:16];
                    char v44 = 0;
                  }
                  while (v42);
                }

                [v87 setFoldedResults:0];
                uint64_t v23 = v80;
                LOBYTE(v15) = v85;
              }
              else
              {
                [v37 addObject:v38];
              }
              self = (LuceneContextRequest *)((char *)self + 1);
            }
            while (self != v84);
            unint64_t v84 = (LuceneContextRequest *)[obj countByEnumeratingWithState:&v101 objects:v116 count:16];
          }
          while (v84);
        }

        [(CKContextResponse *)v23->_response setResults:v37];
      }
    }
    else if ([v77 count])
    {
      [v26 removeObjectsInArray:v77];
    }
  }
  if ([v83 count])
  {
    long long v95 = 0u;
    long long v96 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    uint64_t v15 = v83;
    id v49 = [(id)v15 countByEnumeratingWithState:&v93 objects:v114 count:16];
    if (v49)
    {
      id v50 = v49;
      self = *(LuceneContextRequest **)v94;
      do
      {
        for (k = 0; k != v50; k = (char *)k + 1)
        {
          if (*(LuceneContextRequest **)v94 != self) {
            objc_enumerationMutation((id)v15);
          }
          id v52 = *(void **)(*((void *)&v93 + 1) + 8 * (void)k);
          [v52 setForceBottomRank:1];
          id v53 = [v52 minPrefix];
          if ((uint64_t)v53 <= v74) {
            id v54 = (id)v74;
          }
          else {
            id v54 = v53;
          }
          [v52 setMinPrefix:v54];
        }
        id v50 = [(id)v15 countByEnumeratingWithState:&v93 objects:v114 count:16];
      }
      while (v50);
    }

    [v76 addObjectsFromArray:v15];
    LOBYTE(v15) = v85;
  }
  if (v15) {
    goto LABEL_117;
  }
  int v55 = [(CKContextResponse *)v23->_response results];
  id v56 = [v55 count];

  if ((unint64_t)v56 < 2) {
    goto LABEL_117;
  }
  id v88 = objc_alloc_init((Class)NSMutableSet);
  [v77 removeAllObjects];
  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  id v57 = v76;
  id v58 = [v57 countByEnumeratingWithState:&v89 objects:v113 count:16];
  if (!v58) {
    goto LABEL_113;
  }
  id v59 = v58;
  id v60 = *(id *)v90;
  id obja = *(id *)v90;
  do
  {
    unsigned int v61 = 0;
    id v82 = v59;
    do
    {
      if (*(id *)v90 != v60) {
        objc_enumerationMutation(v57);
      }
      uint64_t v62 = *(void **)(*((void *)&v89 + 1) + 8 * (void)v61);
      uint64_t v63 = [v62 title];
      float v64 = [v62 topicId];
      if (!v63 || ([v88 containsObject:v63] & 1) != 0) {
        goto LABEL_108;
      }
      int v86 = self;
      id v65 = v80;
      id v66 = [(ContextConfiguration *)v80->_config blacklistTitles];
      if (v66)
      {
        self = [(ContextConfiguration *)v80->_config blacklistTitles];
        unsigned int v67 = [v62 title];
        unint64_t v84 = v67;
        if ([(LuceneContextRequest *)self containsObject:v67])
        {

          goto LABEL_107;
        }
        int v86 = self;
        id v65 = v80;
      }
      id v68 = v57;
      float v69 = [(ContextConfiguration *)v65->_config blacklistPortrait];
      BOOL v70 = v69;
      if (v69 && v64)
      {
        uint64_t v71 = [(ContextConfiguration *)v80->_config blacklistPortrait];
        unsigned int v72 = [v71 containsObject:v64];

        if (v66)
        {

          self = v86;
          id v57 = v68;
          if (v72) {
            goto LABEL_106;
          }
        }
        else
        {
          id v57 = v68;
          self = v86;
          if (v72)
          {
LABEL_106:
            id v60 = obja;
            id v59 = v82;
LABEL_107:
            if (v80->_config->_blacklistRemoveAllOnMatch)
            {

              [v57 removeAllObjects];
              goto LABEL_116;
            }
LABEL_108:
            [v77 addObject:v62];
            goto LABEL_109;
          }
        }
      }
      else
      {

        id v57 = v68;
        self = v86;
        if (v66)
        {
        }
      }
      [v88 addObject:v63];
      id v60 = obja;
      id v59 = v82;
LABEL_109:

      unsigned int v61 = (char *)v61 + 1;
    }
    while (v59 != v61);
    id v73 = [v57 countByEnumeratingWithState:&v89 objects:v113 count:16];
    id v59 = v73;
  }
  while (v73);
LABEL_113:

  if ([v77 count]) {
    [v57 removeObjectsInArray:v77];
  }
LABEL_116:

LABEL_117:
}

- (void)_blendResults
{
  [(ContextConfiguration *)self->_config luceneBlendAlpha];
  float v4 = v3;
  BOOL v5 = [(CKContextRequest *)self->_request overrideBlendAlpha];

  if (v5)
  {
    id v6 = [(CKContextRequest *)self->_request overrideBlendAlpha];
    [v6 floatValue];
    float v4 = v7;
  }
  float v8 = [(CKContextResponse *)self->_response results];
  id v9 = [v8 count];

  if ((unint64_t)v9 >= 2 && v4 != 1.0)
  {
    [(ContextConfiguration *)self->_config luceneBlendBeta];
    float v12 = v11;
    float v13 = [(CKContextRequest *)self->_request overrideBlendBeta];

    if (v13)
    {
      float v14 = [(CKContextRequest *)self->_request overrideBlendBeta];
      [v14 floatValue];
      float v12 = v15;
    }
    [(ContextConfiguration *)self->_config luceneBlendGamma];
    float v17 = v16;
    uint64_t v18 = [(CKContextRequest *)self->_request overrideBlendGamma];

    if (v18)
    {
      float v19 = [(CKContextRequest *)self->_request overrideBlendGamma];
      [v19 floatValue];
      float v17 = v20;
    }
    uint64_t v21 = [(CKContextResponse *)self->_response results];
    uint64_t v22 = [v21 sortedArrayUsingComparator:&stru_10048C020];
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id v23 = [v22 countByEnumeratingWithState:&v62 objects:v81 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = 0;
      uint64_t v26 = *(void *)v63;
      do
      {
        for (i = 0; i != v24; [v28 setDocIdRank:(char *)i + v25])
        {
          if (*(void *)v63 != v26) {
            objc_enumerationMutation(v22);
          }
          id v28 = *(void **)(*((void *)&v62 + 1) + 8 * i);
          i = (char *)i + 1;
        }
        id v24 = [v22 countByEnumeratingWithState:&v62 objects:v81 count:16];
        v25 += (uint64_t)i;
      }
      while (v24);
    }
    int nMaxDoc = self->_nMaxDoc;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    obuint64_t j = v21;
    id v30 = [obj countByEnumeratingWithState:&v58 objects:v80 count:16];
    if (v30)
    {
      id v31 = v30;
      float v32 = v4;
      float v57 = 1.0 - v4;
      float v33 = (float)nMaxDoc;
      uint64_t v34 = *(void *)v59;
      char v35 = 1;
      float v36 = INFINITY;
      do
      {
        for (uint64_t j = 0; j != v31; uint64_t j = (char *)j + 1)
        {
          float v38 = v36;
          if (*(void *)v59 != v34) {
            objc_enumerationMutation(obj);
          }
          uint64_t v39 = *(void **)(*((void *)&v58 + 1) + 8 * (void)j);
          [v39 relativeScore];
          float v41 = v40;
          id v42 = [v39 docId];
          float v43 = (float)(unint64_t)[v42 unsignedLongValue] / v33;

          float v44 = v17;
          float v45 = (1.0 - (float)(v17 * v43)) / log2f(v12 + (float)(unint64_t)[v39 docIdRank]);
          if ([v39 forceBottomRank]) {
            float v36 = 1.1755e-38;
          }
          else {
            float v36 = (float)(v57 * v45) + (float)(v32 * v41);
          }
          if (self->_debug
            && self->_debugLogEnabled
            && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
          {
            long long v48 = [v39 title];
            id v54 = [v39 docIdRank];
            int v55 = [v39 docId];
            id v49 = [v55 unsignedLongValue];
            unsigned int v50 = [v39 forceBottomRank];
            *(_DWORD *)buf = 138413826;
            unsigned int v67 = v48;
            __int16 v68 = 2048;
            id v69 = v54;
            __int16 v70 = 2048;
            id v71 = v49;
            __int16 v72 = 2048;
            double v73 = v43;
            __int16 v74 = 2048;
            double v75 = v45;
            __int16 v76 = 2048;
            double v77 = v36;
            __int16 v78 = 1024;
            unsigned int v79 = v50;
            _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Result: %@, docIdRank:%lu docId:%lu relativeDocId:%f relativePopScore:%f newScore:%f forceBottom:%i", buf, 0x44u);
          }
          v35 &= v35 ^ 1 | (v36 <= v38);
          *(float *)&double v46 = v36;
          long long v47 = +[NSNumber numberWithFloat:v46];
          [v39 setBlendedScore:v47];

          float v17 = v44;
        }
        id v31 = [obj countByEnumeratingWithState:&v58 objects:v80 count:16];
      }
      while (v31);
    }
    else
    {
      char v35 = 1;
    }

    if (self->_debugLogEnabled && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      sub_1002C9994(v35 & 1, v51, v52);
      if (v35) {
        goto LABEL_38;
      }
    }
    else if (v35)
    {
LABEL_38:

      return;
    }
    id v53 = [obj sortedArrayUsingComparator:&stru_10048C040];
    [(CKContextResponse *)self->_response setResults:v53];

    goto LABEL_38;
  }
}

- (id)mergeDuplicateResults:(id)a3
{
  id v3 = a3;
  float v4 = +[NSMutableArray array];
  BOOL v5 = +[NSMutableDictionary dictionary];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v3;
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        float v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        float v12 = objc_msgSend(v11, "title", (void)v18);
        float v13 = [v5 objectForKeyedSubscript:v12];

        if (v13)
        {
          float v14 = objc_msgSend(v4, "objectAtIndex:", objc_msgSend(v13, "unsignedIntegerValue"));
          [v14 mergeWithResult:v11];
        }
        else
        {
          float v15 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v4 count]);
          float v16 = [v11 title];
          [v5 setObject:v15 forKeyedSubscript:v16];

          [v4 addObject:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  return v4;
}

- (void)_addTermResults
{
  id v3 = self->_termResults;
  if ([(NSMutableArray *)v3 count])
  {
    float v41 = self;
    float v4 = [(CKContextResponse *)self->_response results];
    id v5 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v4, "count"));
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v52 objects:v58 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v53;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v53 != v9) {
            objc_enumerationMutation(v6);
          }
          float v11 = *(void **)(*((void *)&v52 + 1) + 8 * i);
          float v12 = [v11 titleTokenString];
          if (v12) {
            [v5 addObject:v12];
          }
          float v13 = [v11 query];
          if (v13) {
            [v5 addObject:v13];
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v52 objects:v58 count:16];
      }
      while (v8);
    }
    float v43 = v5;

    [(NSMutableArray *)v3 sortUsingComparator:&stru_10048C060];
    float v14 = v41;
    float v15 = [(LuceneContextRequest *)v41 mergeDuplicateResults:v3];

    id v16 = v6;
    objc_opt_class();
    objc_opt_class();
    float v17 = v16;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      float v17 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", (char *)[v16 count] + (void)objc_msgSend(v15, "count"));

      [(CKContextResponse *)v41->_response setResults:v17];
      if ([v16 count]) {
        [v17 addObjectsFromArray:v16];
      }
    }
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v18 = objc_msgSend(v15, "reverseObjectEnumerator", v15);
    id v19 = [v18 countByEnumeratingWithState:&v48 objects:v57 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v49;
      uint64_t v39 = v17;
      id v40 = v16;
      uint64_t v37 = *(void *)v49;
      float v38 = v18;
      do
      {
        uint64_t v22 = 0;
        id v42 = v20;
        do
        {
          if (*(void *)v49 != v21) {
            objc_enumerationMutation(v18);
          }
          id v23 = *(void **)(*((void *)&v48 + 1) + 8 * (void)v22);
          if (v23)
          {
            [*(id *)(*((void *)&v48 + 1) + 8 * (void)v22) luceneScore];
            float v25 = v24;
            uint64_t v26 = [v23 title];
            if (v26)
            {
              id v27 = [(LuceneContextRequest *)v14 _tokenStringForText:v26];
              if (([v43 containsObject:v27] & 1) == 0)
              {
                long long v46 = 0u;
                long long v47 = 0u;
                long long v44 = 0u;
                long long v45 = 0u;
                id v28 = v16;
                uint64_t v29 = (char *)[v28 countByEnumeratingWithState:&v44 objects:v56 count:16];
                if (v29)
                {
                  id v30 = v29;
                  id v31 = 0;
                  uint64_t v32 = *(void *)v45;
                  while (2)
                  {
                    float v33 = 0;
                    uint64_t v34 = &v30[(void)v31];
                    do
                    {
                      if (*(void *)v45 != v32) {
                        objc_enumerationMutation(v28);
                      }
                      [*(id *)(*((void *)&v44 + 1) + 8 * (void)v33) luceneScore];
                      if (v35 < v25)
                      {
                        uint64_t v34 = &v33[(void)v31];
                        goto LABEL_35;
                      }
                      ++v33;
                    }
                    while (v30 != v33);
                    id v30 = (char *)[v28 countByEnumeratingWithState:&v44 objects:v56 count:16];
                    id v31 = v34;
                    if (v30) {
                      continue;
                    }
                    break;
                  }
                }
                else
                {
                  uint64_t v34 = 0;
                }
LABEL_35:

                float v17 = v39;
                [v39 insertObject:v23 atIndex:v34];
                id v16 = v40;
                float v14 = v41;
                uint64_t v21 = v37;
                long long v18 = v38;
                id v20 = v42;
              }
            }
          }
          uint64_t v22 = (char *)v22 + 1;
        }
        while (v22 != v20);
        id v20 = [v18 countByEnumeratingWithState:&v48 objects:v57 count:16];
      }
      while (v20);
    }

    id v3 = v36;
    [(NSMutableArray *)v36 removeAllObjects];
  }
}

- (id)_tokenStringForText:(id)a3
{
  id v4 = a3;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = sub_1002B7AA0;
  uint64_t v22 = sub_1002B7AB0;
  id v23 = (id)objc_opt_new();
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  char v17 = 1;
  if (v4)
  {
    id v5 = [(OrgApacheLuceneAnalysisAnalyzer *)self->_analyzer tokenStreamWithNSString:@"text" withNSString:v4];
  }
  else
  {
    id v5 = 0;
  }
  id v6 = OrgApacheLuceneAnalysisTokenattributesCharTermAttribute_class_();
  id v7 = [v5 addAttributeWithIOSClass:v6];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1002C629C;
  v11[3] = &unk_10048C088;
  id v8 = v7;
  id v12 = v8;
  float v13 = self;
  float v14 = v16;
  float v15 = &v18;
  sub_1002BF30C(v5, v11);
  id v9 = (id)v19[5];

  _Block_object_dispose(v16, 8);
  _Block_object_dispose(&v18, 8);

  return v9;
}

- (id)_processResult:(int)a3 score:(float)a4 relativeScore:(float)a5
{
  uint64_t v7 = *(void *)&a3;
  unsigned int v146 = [(CKContextRequest *)self->_request dontSkip];
  int v148 = v7;
  long long v149 = self;
  v194[0] = _NSConcreteStackBlock;
  v194[1] = 3221225472;
  v194[2] = sub_1002C78D0;
  v194[3] = &unk_10048C0B0;
  id v9 = [[LuceneResultDocument alloc] initWithDocId:v7 withLuceneContextRequest:self];
  v195 = v9;
  uint64_t v10 = sub_1002C77C0(v194);
  [(ContextConfiguration *)v149->_config luceneMinAbsoluteScore];
  float v12 = v11;
  v192[0] = _NSConcreteStackBlock;
  v192[1] = 3221225472;
  v192[2] = sub_1002C78D8;
  v192[3] = &unk_10048C0D8;
  id v141 = v10;
  v193 = v141;
  sub_1002C77C0(v192);
  uint64_t v140 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v190[0] = _NSConcreteStackBlock;
  v190[1] = 3221225472;
  v190[2] = sub_1002C7938;
  v190[3] = &unk_10048C100;
  long long v147 = v9;
  v191 = v147;
  sub_1002C77C0(v190);
  int v143 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  uint64_t v184 = 0;
  v185 = &v184;
  uint64_t v186 = 0x3032000000;
  v187 = sub_1002B7AA0;
  v188 = sub_1002B7AB0;
  NSMapGet(v149->_perDocumentObjects, (const void *)v148);
  id v189 = (id)objc_claimAutoreleasedReturnValue();
  v183[0] = _NSConcreteStackBlock;
  v183[1] = 3221225472;
  v183[2] = sub_1002C7998;
  v183[3] = &unk_10048C128;
  v183[4] = v149;
  v183[5] = &v184;
  sub_1002C77C0(v183);
  v142 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  float v13 = [(id)v185[5] phrases];
  if ([v13 count] != (id)1)
  {

LABEL_7:
    uint64_t v21 = [(id)v185[5] phrases];
    if ([v21 count])
    {
      int v144 = 0;
LABEL_9:

      goto LABEL_15;
    }
    uint64_t v22 = [(id)v185[5] terms];
    BOOL v23 = [v22 count] == (id)2;

    if (!v23) {
      goto LABEL_14;
    }
    float v24 = [(id)v185[5] terms];
    float v25 = [v24 objectAtIndexedSubscript:0];
    uint64_t v26 = [v25 getQuery];
    id v27 = [v26 getTerm];
    uint64_t v21 = [v27 text];

    id v28 = [(id)v185[5] terms];
    uint64_t v29 = [v28 objectAtIndexedSubscript:1];
    id v30 = [v29 getQuery];
    id v31 = [v30 getTerm];
    uint64_t v32 = [v31 text];

    if ([v21 hasPrefix:v32])
    {
      if (v146)
      {
        int v144 = 1;
LABEL_73:

        goto LABEL_9;
      }
    }
    else
    {
      int v144 = [v32 hasPrefix:v21];
      if ((v144 ^ 1 | v146)) {
        goto LABEL_73;
      }
    }
    __int16 v68 = 0;
LABEL_183:

    goto LABEL_184;
  }
  float v14 = [(id)v185[5] terms];
  BOOL v15 = (unint64_t)[v14 count] < 3;

  if (!v15) {
    goto LABEL_7;
  }
  id v16 = v142[2]();
  BOOL v17 = (unint64_t)[v16 count] < 3;

  if (!v17)
  {
LABEL_14:
    int v144 = 0;
    goto LABEL_15;
  }
  uint64_t v18 = v143[2]();
  id v19 = [v18 importantTokens];
  BOOL v20 = [v19 count] != 0;

  if (((v20 | v146) & 1) == 0)
  {
LABEL_68:
    __int16 v68 = 0;
    goto LABEL_69;
  }
  int v144 = !v20;
LABEL_15:
  float v33 = [(id)v185[5] terms];
  id v34 = [v33 count];

  if (!v34)
  {
LABEL_32:
    unint64_t v38 = 0;
    int v44 = 0;
    goto LABEL_33;
  }
  long long v181 = 0u;
  long long v182 = 0u;
  long long v179 = 0u;
  long long v180 = 0u;
  float v35 = [(id)v185[5] terms];
  id v36 = [v35 countByEnumeratingWithState:&v179 objects:v203 count:16];
  if (!v36)
  {

    goto LABEL_32;
  }
  char v37 = 0;
  unint64_t v38 = 0;
  uint64_t v39 = *(void *)v180;
  while (2)
  {
    for (i = 0; i != v36; i = (char *)i + 1)
    {
      if (*(void *)v180 != v39) {
        objc_enumerationMutation(v35);
      }
      float v41 = [*(id *)(*((void *)&v179 + 1) + 8 * i) getQuery];
      id v42 = [v41 getUserObject];

      if (v42)
      {
        if ([v42 docId] == v148) {
          ++v38;
        }
        uint64_t v43 = v42[1];
        if (!+[TokenInfo isNameType:v43])
        {

          int v45 = 0;
          int v44 = v37 & 1;
          goto LABEL_50;
        }
        if (!+[TokenInfo isSurnameType:v43]) {
          char v37 = 1;
        }
      }
    }
    id v36 = [v35 countByEnumeratingWithState:&v179 objects:v203 count:16];
    if (v36) {
      continue;
    }
    break;
  }

  int v44 = v37 & 1;
LABEL_33:
  long long v46 = [(id)v185[5] phrases];
  BOOL v47 = [v46 count] == 0;

  if (v47)
  {
    int v45 = 1;
  }
  else
  {
    long long v177 = 0u;
    long long v178 = 0u;
    long long v175 = 0u;
    long long v176 = 0u;
    long long v48 = [(id)v185[5] phrases];
    id v49 = [v48 countByEnumeratingWithState:&v175 objects:v202 count:16];
    if (v49)
    {
      uint64_t v50 = *(void *)v176;
      while (2)
      {
        for (uint64_t j = 0; j != v49; uint64_t j = (char *)j + 1)
        {
          if (*(void *)v176 != v50) {
            objc_enumerationMutation(v48);
          }
          long long v52 = [*(id *)(*((void *)&v175 + 1) + 8 * (void)j) getQuery];
          long long v53 = [v52 getUserObject];

          if (v53)
          {
            if ([v53 docId] == v148) {
              ++v38;
            }
            uint64_t v54 = v53[1];
            if (!+[TokenInfo isNameType:v54])
            {

              int v45 = 0;
              goto LABEL_49;
            }
            v44 |= !+[TokenInfo isSurnameType:v54];
          }
        }
        id v49 = [v48 countByEnumeratingWithState:&v175 objects:v202 count:16];
        if (v49) {
          continue;
        }
        break;
      }
    }
    int v45 = 1;
LABEL_49:
  }
LABEL_50:
  if ((v144 ^ 1 | v146) != 1) {
    goto LABEL_68;
  }
  long long v55 = [(LuceneResultDocument *)v147 titleField];
  BOOL v56 = [v55 length] == 0;

  if (v56) {
    goto LABEL_68;
  }
  if ([(LuceneResultDocument *)v147 titleMinTermsRequired])
  {
    float v57 = v143[2]();
    long long v58 = [v57 importantTokens];
    id v59 = [v58 count];

    id v60 = [(LuceneResultDocument *)v147 titleMinTermsRequired];
    int v61 = v144;
    if (v59 >= v60) {
      char v62 = 1;
    }
    else {
      char v62 = v146;
    }
    if (v59 < v60) {
      int v61 = 1;
    }
    int v144 = v61;
    if ((v62 & 1) == 0) {
      goto LABEL_68;
    }
  }
  if ([(LuceneResultDocument *)v147 minPrimaryTermsRequired])
  {
    id v63 = [(id)v185[5] primaryCount];
    id v64 = [(LuceneResultDocument *)v147 minPrimaryTermsRequired];
    int v66 = v144;
    char v65 = v146;
    if (v63 < v64) {
      int v66 = 1;
    }
    else {
      char v65 = 1;
    }
    int v144 = v66;
    if ((v65 & 1) == 0) {
      goto LABEL_68;
    }
  }
  uint64_t v21 = v143[2]();
  long long v139 = (char *)[v21 tokenCountMatching];
  int v67 = 0;
  if ([v21 tokenCountPrimary] && (unint64_t)v139 >= 2)
  {
    if (v139 >= (char *)[v21 tokenCount] - 1)
    {
      if (v45 & v44) {
        goto LABEL_76;
      }
      __int16 v76 = [(id)v185[5] terms];
      if ((unint64_t)[v76 count] >= 3)
      {

        goto LABEL_67;
      }
      double v77 = [(id)v185[5] phrases];
      BOOL v78 = (unint64_t)[v77 count] < 2;

      if (v78)
      {
LABEL_76:
        int v144 = 0;
        int v67 = 1;
        goto LABEL_77;
      }
    }
LABEL_67:
    int v67 = 0;
  }
LABEL_77:
  __int16 v70 = [(ContextConfiguration *)v149->_config luceneMinTitleMatchAllNamesOK];
  id v71 = v70;
  if ((v45 & v44) == 1 && v139 >= v70)
  {
    id v72 = [v21 tokenCountPrimary];
    if (v72 >= (id)[(ContextConfiguration *)v149->_config luceneMinTitleMatchPrimaryAllNamesOK])int v67 = 1; {
  }
    }
  int v73 = v45 ^ 1 | v67;
  if (v38 >= (unint64_t)v71) {
    int v73 = 1;
  }
  if ((v73 | v146) != 1) {
    goto LABEL_148;
  }
  if ((v73 ^ 1 | v144))
  {
    if (v146)
    {
      int v74 = 1;
      goto LABEL_102;
    }
    goto LABEL_148;
  }
  if (v67)
  {
    [(ContextConfiguration *)v149->_config luceneMinScoreTitlePrimary];
LABEL_94:
    BOOL v79 = v75 <= a4;
    goto LABEL_95;
  }
  if (v139)
  {
    [(ContextConfiguration *)v149->_config luceneMinScoreTitleMatch];
    goto LABEL_94;
  }
  BOOL v79 = v12 <= a4;
LABEL_95:
  int v74 = !v79;
  char v80 = v146;
  if (v79) {
    char v80 = 1;
  }
  if (v80)
  {
LABEL_102:
    if (v139 >= (char *)-[ContextConfiguration luceneMinTitleMatchForScoreBoost](v149->_config, "luceneMinTitleMatchForScoreBoost"))a5 = (float)((float)((float)(unint64_t)v139 / (float)(unint64_t)[v21 tokenCount])+ 1.0)* a5; {
    int v145 = v74;
    }
    unsigned int v138 = v67;
    if (v149->_debug)
    {
      uint64_t v32 = objc_opt_new();
      uint64_t v81 = objc_opt_new();
      long long v173 = 0u;
      long long v174 = 0u;
      long long v171 = 0u;
      long long v172 = 0u;
      id v82 = [(id)v185[5] phrases];
      id v83 = [v82 countByEnumeratingWithState:&v171 objects:v201 count:16];
      if (v83)
      {
        uint64_t v84 = *(void *)v172;
        do
        {
          for (k = 0; k != v83; k = (char *)k + 1)
          {
            if (*(void *)v172 != v84) {
              objc_enumerationMutation(v82);
            }
            int v86 = [*(id *)(*((void *)&v171 + 1) + 8 * (void)k) getQuery];
            [(LuceneContextRequest *)v149 addDebugStringTo:v81 withPrefix:@"+" forQuery:v86];
          }
          id v83 = [v82 countByEnumeratingWithState:&v171 objects:v201 count:16];
        }
        while (v83);
      }

      long long v169 = 0u;
      long long v170 = 0u;
      long long v167 = 0u;
      long long v168 = 0u;
      unint64_t v87 = objc_msgSend(v81, "sortedArrayUsingSelector:");
      id v88 = [v87 countByEnumeratingWithState:&v167 objects:v200 count:16];
      if (v88)
      {
        uint64_t v89 = *(void *)v168;
        do
        {
          for (m = 0; m != v88; m = (char *)m + 1)
          {
            if (*(void *)v168 != v89) {
              objc_enumerationMutation(v87);
            }
            [v32 appendString:*(void *)(*((void *)&v167 + 1) + 8 * (void)m)];
          }
          id v88 = [v87 countByEnumeratingWithState:&v167 objects:v200 count:16];
        }
        while (v88);
      }

      long long v91 = objc_opt_new();
      long long v165 = 0u;
      long long v166 = 0u;
      long long v163 = 0u;
      long long v164 = 0u;
      long long v92 = [(id)v185[5] terms];
      id v93 = [v92 countByEnumeratingWithState:&v163 objects:v199 count:16];
      if (v93)
      {
        uint64_t v94 = *(void *)v164;
        do
        {
          for (n = 0; n != v93; n = (char *)n + 1)
          {
            if (*(void *)v164 != v94) {
              objc_enumerationMutation(v92);
            }
            long long v96 = [*(id *)(*((void *)&v163 + 1) + 8 * (void)n) getQuery];
            [(LuceneContextRequest *)v149 addDebugStringTo:v91 withPrefix:@"+" forQuery:v96];
          }
          id v93 = [v92 countByEnumeratingWithState:&v163 objects:v199 count:16];
        }
        while (v93);
      }

      long long v161 = 0u;
      long long v162 = 0u;
      long long v159 = 0u;
      long long v160 = 0u;
      long long v97 = [v91 sortedArrayUsingSelector:"compare:"];
      id v98 = [v97 countByEnumeratingWithState:&v159 objects:v198 count:16];
      if (v98)
      {
        uint64_t v99 = *(void *)v160;
        do
        {
          for (ii = 0; ii != v98; ii = (char *)ii + 1)
          {
            if (*(void *)v160 != v99) {
              objc_enumerationMutation(v97);
            }
            [v32 appendString:*(void *)(*((void *)&v159 + 1) + 8 * (void)ii)];
          }
          id v98 = [v97 countByEnumeratingWithState:&v159 objects:v198 count:16];
        }
        while (v98);
      }

      long long v101 = objc_opt_new();
      long long v157 = 0u;
      long long v158 = 0u;
      long long v155 = 0u;
      long long v156 = 0u;
      long long v102 = [(id)v185[5] secondary];
      id v103 = [v102 countByEnumeratingWithState:&v155 objects:v197 count:16];
      if (v103)
      {
        uint64_t v104 = *(void *)v156;
        do
        {
          for (juint64_t j = 0; jj != v103; juint64_t j = (char *)jj + 1)
          {
            if (*(void *)v156 != v104) {
              objc_enumerationMutation(v102);
            }
            long long v106 = [*(id *)(*((void *)&v155 + 1) + 8 * (void)jj) getQuery];
            [(LuceneContextRequest *)v149 addDebugStringTo:v101 withPrefix:@"?" forQuery:v106];
          }
          id v103 = [v102 countByEnumeratingWithState:&v155 objects:v197 count:16];
        }
        while (v103);
      }

      long long v153 = 0u;
      long long v154 = 0u;
      long long v151 = 0u;
      long long v152 = 0u;
      long long v107 = [v101 sortedArrayUsingSelector:"compare:"];
      id v108 = [v107 countByEnumeratingWithState:&v151 objects:v196 count:16];
      if (v108)
      {
        uint64_t v109 = *(void *)v152;
        do
        {
          for (kk = 0; kk != v108; kk = (char *)kk + 1)
          {
            if (*(void *)v152 != v109) {
              objc_enumerationMutation(v107);
            }
            [v32 appendString:*(void *)(*((void *)&v151 + 1) + 8 * (void)kk)];
          }
          id v108 = [v107 countByEnumeratingWithState:&v151 objects:v196 count:16];
        }
        while (v108);
      }

      long long v111 = +[NSString stringWithFormat:@"%i %5.3f 🆑", (int)(float)(a5 * 100.0), a4];
    }
    else
    {
      uint64_t v32 = 0;
      long long v111 = 0;
    }
    long long v112 = [LuceneContextResult alloc];
    id v113 = [v21 title];
    id v114 = [(LuceneContextResult *)v112 initWithDocId:v148 title:v113 query:0 url:0 category:v111];

    *(float *)&double v115 = a4;
    [(LuceneContextResult *)v114 setLuceneScore:v115];
    *(float *)&double v116 = a5;
    [(LuceneContextResult *)v114 setRelativeScore:v116];
    [(LuceneContextResult *)v114 setDebug:v32];
    int v117 = [v21 topicIdOverride];
    uint64_t v118 = v117;
    if (!v117)
    {
      uint64_t v118 = v140[2]();
    }
    [(LuceneContextResult *)v114 setTopicId:v118];
    if (!v117) {

    }
    [(LuceneContextResult *)v114 setTitleMatch:v139];
    [(LuceneContextResult *)v114 setTitlePrimary:v138];
    id v119 = [(LuceneContextResult *)v114 minPrefix];
    id v120 = [v21 minPrefix];
    if ((uint64_t)v119 <= (uint64_t)v120) {
      id v121 = v120;
    }
    else {
      id v121 = v119;
    }
    [(LuceneContextResult *)v114 setMinPrefix:v121];
    -[LuceneContextResult setForceBottomRank:](v114, "setForceBottomRank:", [v21 forceBottomRank]);
    CFStringRef v122 = v141[2]();
    id v123 = [v122 getWithNSString:@"related"];
    [(LuceneContextResult *)v114 setRelatedField:v123];

    -[LuceneContextResult setExactMatch:](v114, "setExactMatch:", (id)-[LuceneContextResult titleMatch](v114, "titleMatch") == [v21 tokenCount]);
    if (v149->_debug)
    {
      if (v145)
      {
        v124 = [(LuceneContextResult *)v114 category];
        uint64_t v125 = [v124 stringByAppendingString:@" (would skip)"];
        [(LuceneContextResult *)v114 setCategory:v125];
      }
      if ([(LuceneContextResult *)v114 titleMatch])
      {
        id v126 = [(LuceneContextResult *)v114 category];
        v127 = objc_msgSend(v126, "stringByAppendingFormat:", @" (title match:%lu/%lu)", -[LuceneContextResult titleMatch](v114, "titleMatch"), objc_msgSend(v21, "tokenCount"));
        [(LuceneContextResult *)v114 setCategory:v127];
      }
    }
    uint64_t v128 = [v21 tokenString];
    [(LuceneContextResult *)v114 setTitleTokenString:v128];

    [(LuceneContextRequest *)v149 postprocessAddQuery:v114];
    [(id)v185[5] seal];
    uint64_t v150 = 0;
    unint64_t v129 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [(id)v185[5] queryFingerprintWithPrimaryOut:&v150]);
    uint64_t v130 = +[NSNumber numberWithUnsignedInteger:v150];
    [(LuceneContextResult *)v114 setFingerprintPrimary:v130];
    if (v138)
    {
      v149->_needFingerprintPostprocessing = 1;
      if (v149->_debug)
      {
        id v131 = [(LuceneContextResult *)v114 category];
        id v132 = [v131 stringByAppendingString:@" (title primary)"];
        [(LuceneContextResult *)v114 setCategory:v132];
      }
      long long v133 = [(NSMutableDictionary *)v149->_fingerprintsPrimary objectForKey:v130];
      if (v133)
      {
        [(LuceneContextResult *)v114 setSkip:1];
        v149->_haveFingerprintDupes = 1;
        [v133 addToFoldedResults:v114];
      }
      else
      {
        [(NSMutableDictionary *)v149->_fingerprintsPrimary setObject:v114 forKey:v130];
      }
    }
    if ([(LuceneResultDocument *)v147 seeOtherDocIdRelative]) {
      [(LuceneContextRequest *)v149 _augmentResult:v114 withDocId:[(LuceneResultDocument *)v147 seeOtherDocIdRelative] + v148 checkLanguageRedirect:0];
    }
    CFStringRef v134 = [(LuceneContextResult *)v114 title];
    BOOL v135 = v134 == 0;

    if (v135)
    {
      __int16 v68 = 0;
LABEL_182:

      goto LABEL_183;
    }
    uint64_t v136 = [(NSMutableDictionary *)v149->_fingerprints objectForKey:v129];
    uint64_t v137 = v136;
    if (v136)
    {
      if (!v138)
      {
        v149->_haveFingerprintDupes = 1;
        [v136 addToFoldedResults:v114];
        __int16 v68 = 0;
        goto LABEL_181;
      }
      [v136 setSkip:1];
    }
    else
    {
      [(NSMutableDictionary *)v149->_fingerprints setObject:v114 forKey:v129];
    }
    __int16 v68 = v114;
LABEL_181:

    goto LABEL_182;
  }
LABEL_148:
  __int16 v68 = 0;
LABEL_184:

LABEL_69:
  _Block_object_dispose(&v184, 8);

  return v68;
}

- (void)postprocessAddQuery:(id)a3
{
  id v8 = a3;
  id v3 = [v8 title];
  id v4 = [v3 indexOf:3];
  if ((v4 & 0x80000000) == 0 {
    || (id v4 = objc_msgSend(v3, "indexOfString:", @" ("), v4, v5 = v3, (v4 & 0x80000000) == 0))
  }
  {
    id v5 = [v3 substring:0 endIndex:v4];

    id v6 = [v3 replace:3 withChar:32];
    [v8 setTitle:v6];
  }
  uint64_t v7 = [v5 lowercaseString];
  [v8 setQuery:v7];
}

- (void)_rerankFoldedResults:(id)a3
{
  id v3 = a3;
  uint64_t v69 = 0;
  __int16 v70 = &v69;
  uint64_t v71 = 0x3032000000;
  id v72 = sub_1002B7AA0;
  int v73 = sub_1002B7AB0;
  int v74 = [[BigramKey alloc] initWithTokenA:0 tokenB:0];
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  obuint64_t j = v3;
  id v4 = [obj countByEnumeratingWithState:&v65 objects:v75 count:16];
  id v5 = self;
  if (v4)
  {
    uint64_t v6 = 0;
    char v28 = 0;
    uint64_t v24 = *(void *)v66;
    int v7 = 5;
    int v8 = 1;
LABEL_3:
    id v9 = 0;
    uint64_t v25 = v8;
    uint64_t v26 = (void *)(v7 & ~(v7 >> 31));
    id v23 = v4;
    int v21 = v7 - v4;
    uint64_t v10 = v6;
    while (1)
    {
      if (*(void *)v66 != v24) {
        objc_enumerationMutation(obj);
      }
      if (v26 == v9) {
        break;
      }
      float v11 = *(void **)(*((void *)&v65 + 1) + 8 * (void)v9);
      [v11 setFoldCurrentRank:(char *)v9 + v25];
      float v12 = [v11 title];
      uint64_t v27 = v10;
      if (v12)
      {
        float v13 = [(OrgApacheLuceneAnalysisAnalyzer *)v5->_analyzer tokenStreamWithNSString:@"text" withNSString:v12];
      }
      else
      {
        float v13 = 0;
      }
      float v14 = OrgApacheLuceneAnalysisTokenattributesCharTermAttribute_class_();
      BOOL v15 = [v13 addAttributeWithIOSClass:v14];

      v63[0] = 0;
      v63[1] = v63;
      v63[2] = 0x2020000000;
      int v64 = 0;
      v61[0] = 0;
      v61[1] = v61;
      v61[2] = 0x3032000000;
      void v61[3] = sub_1002B7AA0;
      v61[4] = sub_1002B7AB0;
      id v62 = 0;
      uint64_t v57 = 0;
      long long v58 = &v57;
      uint64_t v59 = 0x2020000000;
      uint64_t v60 = 0;
      uint64_t v53 = 0;
      uint64_t v54 = &v53;
      uint64_t v55 = 0x2020000000;
      uint64_t v56 = 0;
      uint64_t v49 = 0;
      uint64_t v50 = &v49;
      uint64_t v51 = 0x2020000000;
      uint64_t v52 = 0;
      uint64_t v45 = 0;
      long long v46 = &v45;
      uint64_t v47 = 0x2020000000;
      uint64_t v48 = 0;
      uint64_t v41 = 0;
      id v42 = &v41;
      uint64_t v43 = 0x2020000000;
      uint64_t v44 = 0;
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_1002C8370;
      v30[3] = &unk_10048C150;
      float v33 = v63;
      id v16 = v15;
      id v31 = v16;
      uint64_t v32 = self;
      id v34 = &v53;
      float v35 = &v45;
      id v36 = v61;
      char v37 = &v69;
      unint64_t v38 = &v57;
      uint64_t v39 = &v49;
      id v40 = &v41;
      sub_1002BF30C(v13, v30);
      uint64_t v6 = 4 * v54[3] + 8 * v58[3] + 2 * v50[3] + v46[3] - v42[3];
      if (self->_debug && [(CKContextRequest *)self->_request dontSkip])
      {
        BOOL v17 = [v11 debug];
        uint64_t v18 = [v11 fingerprintPrimary];
        id v19 = [v18 integerValue];
        BOOL v20 = +[NSString stringWithFormat:@"%@ %lu %li <- %li %li %li %li -%li", v17, v19, v6, v58[3], v54[3], v50[3], v46[3], v42[3]];
        [v11 setDebug:v20];
      }
      [v11 setFoldScore:v6];
      [(id)v70[5] recycle];

      _Block_object_dispose(&v41, 8);
      _Block_object_dispose(&v45, 8);
      _Block_object_dispose(&v49, 8);
      _Block_object_dispose(&v53, 8);
      _Block_object_dispose(&v57, 8);
      _Block_object_dispose(v61, 8);

      _Block_object_dispose(v63, 8);
      v28 |= v6 > v27;
      id v9 = (char *)v9 + 1;
      uint64_t v10 = v6;
      id v5 = self;
      if (v23 == v9)
      {
        id v4 = [obj countByEnumeratingWithState:&v65 objects:v75 count:16];
        int v8 = v25 + v9;
        int v7 = v21;
        if (v4) {
          goto LABEL_3;
        }
        break;
      }
    }

    if (v28) {
      [obj sortUsingComparator:&stru_10048C170];
    }
  }
  else
  {
  }
  _Block_object_dispose(&v69, 8);
}

- (id)_computeHashesWithSeed:(int)a3 forBytesRef:(id)a4 reuse:(id)a5
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v7 = *((void *)a4 + 1) + 12 + *((int *)a4 + 4);
  uint64_t v8 = *((int *)a4 + 5);
  id v9 = a5;
  uint64_t v10 = +[NSData dataWithBytesNoCopy:v7 length:v8 freeWhenDone:0];
  float v11 = [(_PASBloomFilter *)self->_bloomFilter computeHashesWithSeed:v5 forData:v10 reuse:v9];

  return v11;
}

- (void)addDebugStringTo:(id)a3 withPrefix:(id)a4 forQuery:(id)a5
{
  id v17 = a3;
  id v7 = a4;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [v8 getTerms];
    uint64_t v10 = [v9 objectAtIndex:0];
    float v11 = [v9 objectAtIndex:1];
    float v12 = [v10 text];
    float v13 = [v11 text];
    float v14 = +[NSString stringWithFormat:@"%@\"%@ %@\" ", v7, v12, v13];
    [v17 addObject:v14];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = [v8 getTerm];
      BOOL v15 = [v9 text];
      id v16 = +[NSString stringWithFormat:@"%@%@ ", v7, v15];
      [v17 addObject:v16];
    }
    else
    {
      id v9 = +[NSString stringWithFormat:@"%@(%@) ", v7, v8];
      [v17 addObject:v9];
    }
  }
}

- (id)textTermsEnum
{
  textTermsEnum = self->_textTermsEnum;
  if (!textTermsEnum)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
    uint64_t v5 = [WeakRetained reader];
    uint64_t v6 = +[OrgApacheLuceneIndexMultiFields getTermsWithOrgApacheLuceneIndexIndexReader:v5 withNSString:@"text"];
    id v7 = [v6 iterator];
    id v8 = self->_textTermsEnum;
    self->_textTermsEnum = v7;

    textTermsEnum = self->_textTermsEnum;
  }
  return textTermsEnum;
}

+ (id)reverseFQDN:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v4 = objc_msgSend(v3, "componentsSeparatedByString:", @".", 0);
    uint64_t v5 = [v4 reverseObjectEnumerator];

    id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      id v7 = v6;
      id v8 = 0;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v5);
          }
          uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          if (v8)
          {
            [(__CFString *)v8 appendString:@"."];
          }
          else
          {
            +[NSMutableString stringWithCapacity:](NSMutableString, "stringWithCapacity:", [v3 length]);
            id v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          [(__CFString *)v8 appendString:v11];
        }
        id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    float v12 = &stru_10048C1F8;
    if (!v3) {
      float v12 = 0;
    }
    id v8 = v12;
  }

  return v8;
}

- (void)addRequestFingerprint
{
  uint64_t v3 = [(OrgApacheLuceneUtilPriorityQueue *)self->_minHashPriorityQueue size];
  if ((int)v3 >= 1)
  {
    unsigned int v4 = v3;
    id v5 = [objc_alloc((Class)CKContextFingerprintMinHash) initWithHashes:0 count:v3];
    [v5 setType:1];
    id v9 = v5;
    id v6 = [v9 hashes];
    unint64_t v7 = v4 + 1;
    do
    {
      id v8 = [(OrgApacheLuceneUtilPriorityQueue *)self->_minHashPriorityQueue pop];
      v6[(v7 - 2)] = [v8 intValue];

      --v7;
    }
    while (v7 > 1);
    [(CKContextResponse *)self->_response setRequestFingerprint:v9];
  }
}

- (CKContextRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (OrgApacheLuceneDocumentDocumentStoredFieldVisitor)docVisitor
{
  return self->_docVisitor;
}

- (void)setDocVisitor:(id)a3
{
}

- (LuceneContextEngine)engine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  return (LuceneContextEngine *)WeakRetained;
}

- (void)setEngine:(id)a3
{
}

- (BOOL)forceNoResults
{
  return self->_forceNoResults;
}

- (void)setForceNoResults:(BOOL)a3
{
  self->_forceNoResults = a3;
}

- (BOOL)debug
{
  return self->_debug;
}

- (void)setDebug:(BOOL)a3
{
  self->_debug = a3;
}

- (BOOL)debugLogEnabled
{
  return self->_debugLogEnabled;
}

- (void)setDebugLogEnabled:(BOOL)a3
{
  self->_debugLogEnabled = a3;
}

- (char)charBuffer
{
  return self->_charBuffer;
}

- (void)setCharBuffer:(char *)a3
{
  self->_charBuffer = a3;
}

- (CKContextResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
}

- (ContextConfiguration)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_destroyWeak((id *)&self->_engine);
  objc_storeStrong((id *)&self->_docVisitor, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_minHashPriorityQueue, 0);
  objc_storeStrong((id *)&self->_partialNGramCharacterSet, 0);
  objc_storeStrong((id *)&self->_quotedTokenCharacterSet, 0);
  objc_storeStrong((id *)&self->_allowedNGramSeparators, 0);
  objc_storeStrong((id *)&self->_nGramBreakingSeparators, 0);
  objc_storeStrong((id *)&self->_bytesRefPool, 0);
  objc_storeStrong((id *)&self->_termResultsWithDocument, 0);
  objc_storeStrong((id *)&self->_weakKeywordTermResults, 0);
  objc_storeStrong((id *)&self->_termResults, 0);
  objc_storeStrong((id *)&self->_textTermsEnum, 0);
  objc_storeStrong((id *)&self->_fingerprintsPrimary, 0);
  objc_storeStrong((id *)&self->_fingerprints, 0);
  objc_storeStrong((id *)&self->_extractTermsReuse, 0);
  objc_storeStrong((id *)&self->_hashesTokenReuse, 0);
  objc_storeStrong((id *)&self->_perDocumentObjects, 0);
  objc_storeStrong((id *)&self->_secondaryInterceptor, 0);
  objc_storeStrong((id *)&self->_phraseQueryInterceptor, 0);
  objc_storeStrong((id *)&self->_termQueryInterceptor, 0);
  objc_storeStrong((id *)&self->_bigramInfosSequence, 0);
  objc_storeStrong((id *)&self->_tokenInfosSequence, 0);
  objc_storeStrong((id *)&self->_bigramInfos, 0);
  objc_storeStrong((id *)&self->_tokenInfos, 0);
  objc_storeStrong((id *)&self->_bloomFilter, 0);
  objc_storeStrong((id *)&self->_analyzer, 0);
  objc_storeStrong((id *)&self->_searcher, 0);
}

@end