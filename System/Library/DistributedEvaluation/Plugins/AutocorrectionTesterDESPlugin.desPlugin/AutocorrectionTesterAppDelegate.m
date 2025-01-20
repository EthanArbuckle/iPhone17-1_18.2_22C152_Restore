@interface AutocorrectionTesterAppDelegate
+ (id)reporterWithOptions:(id)a3;
+ (void)setupSingletonMocksWithOptions:(id)a3;
+ (void)teardownSingletonMocks:(id)a3;
- (AutocorrectionTesterAppDelegate)initWithLocale:(id)a3 andText:(id)a4;
- (AutocorrectionTesterAppDelegate)initWithOptions:(id)a3;
- (BOOL)runAndWriteReport;
- (BOOL)runAutocorrectionTester:(id)a3;
- (BOOL)runTestCasesForSource:(id)a3 errorMessage:(id)a4 reportObserver:(id)a5;
- (BOOL)runTests:(id)a3 withHarnessClass:(Class)a4 forLanguage:(id)a5 errorMessage:(id)a6 reportObserver:(id)a7;
- (BOOL)runWithObserver:(id)a3;
- (double)runDslTest:(id)a3 withHarnessClass:(Class)a4 forLanguage:(id)a5 errorMessage:(id)a6;
- (void)resetOptions:(id)a3;
@end

@implementation AutocorrectionTesterAppDelegate

- (AutocorrectionTesterAppDelegate)initWithOptions:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AutocorrectionTesterAppDelegate;
  v5 = [(AutocorrectionTesterAppDelegate *)&v9 init];
  if (v5)
  {
    uint64_t v6 = +[NSMutableDictionary dictionaryWithDictionary:v4];
    options = v5->_options;
    v5->_options = (NSMutableDictionary *)v6;
  }
  return v5;
}

- (AutocorrectionTesterAppDelegate)initWithLocale:(id)a3 andText:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AutocorrectionTesterAppDelegate;
  v8 = [(AutocorrectionTesterAppDelegate *)&v13 init];
  if (v8)
  {
    v14[0] = @"KEYBOARD_LANGUAGE";
    v14[1] = @"SENTENCE";
    v15[0] = v6;
    v15[1] = v7;
    v14[2] = @"USE_PREDICTION";
    v14[3] = @"MAX_PREDICTIONS_REPORTED";
    v15[2] = &__kCFBooleanTrue;
    v15[3] = &off_93FD0;
    v14[4] = @"USE_RETROCORRECTION";
    v14[5] = @"BASE_KEY_FOR_VARIANTS";
    v15[4] = &__kCFBooleanTrue;
    v15[5] = &__kCFBooleanFalse;
    objc_super v9 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:6];
    uint64_t v10 = +[NSMutableDictionary dictionaryWithDictionary:v9];
    options = v8->_options;
    v8->_options = (NSMutableDictionary *)v10;
  }
  return v8;
}

- (void)resetOptions:(id)a3
{
  id v4 = +[NSMutableDictionary dictionaryWithDictionary:a3];
  options = self->_options;
  self->_options = v4;

  _objc_release_x1(v4, options);
}

+ (void)setupSingletonMocksWithOptions:(id)a3
{
  id v3 = a3;
  uint64_t v14 = [v3 objectForKey:@"NAMEDENTITIES"];
  uint64_t v4 = [v3 objectForKey:@"PORTRAIT_NAMEDENTITIES"];
  v5 = [v3 objectForKey:@"ADDRESSBOOK"];
  id v6 = [v3 valueForKey:@"TEST_AUTO_FILL_FEATURE"];

  char v7 = [v6 BOOLValue];
  Class v8 = NSClassFromString(@"TITransientLexiconManager");
  if (v5)
  {
    if (!v8)
    {
      objc_super v9 = sub_47FA8((uint64_t)v5);
      _TIBeginMockingSingletonsWithResources(v9, &__NSArray0__struct, 0, 1, v7);

      goto LABEL_16;
    }
LABEL_6:
    if (v14)
    {
      uint64_t v10 = sub_47CE4(v14);
      if (v4)
      {
LABEL_8:
        v11 = sub_47E68((void *)v4);
LABEL_11:
        v12 = [v10 arrayByAddingObjectsFromArray:v11];

        if (v5)
        {
          objc_super v13 = sub_481DC((uint64_t)v5);
        }
        else
        {
          objc_super v13 = &__NSArray0__struct;
        }
        _TIBeginMockingSingletonsWithMockData(v13, v12, &__NSArray0__struct, 0, 0, v7);

        goto LABEL_16;
      }
    }
    else
    {
      uint64_t v10 = &__NSArray0__struct;
      if (v4) {
        goto LABEL_8;
      }
    }
    v11 = &__NSArray0__struct;
    goto LABEL_11;
  }
  if (v14 | v4 && v8) {
    goto LABEL_6;
  }
  _TIBeginMockingSingletonsWithData(0, 0, 0, 0, 0, v7);
LABEL_16:
}

+ (void)teardownSingletonMocks:(id)a3
{
  id v3 = [a3 valueForKey:@"TEST_AUTO_FILL_FEATURE"];
  char v4 = [v3 BOOLValue];

  _TIEndMockingSingletonsWithData(v4);
}

+ (id)reporterWithOptions:(id)a3
{
  id v3 = a3;
  char v4 = (void *)MGCopyAnswer();
  v5 = [[TIReporter alloc] initWithBuildVersion:v4];
  [(TIReporter *)v5 setOptions:v3];

  return v5;
}

- (double)runDslTest:(id)a3 withHarnessClass:(Class)a4 forLanguage:(id)a5 errorMessage:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v36 = a6;
  double Current = CFAbsoluteTimeGetCurrent();
  v37 = v11;
  NSLog(@"Current language being tested: %@\n", v11);
  NSLog(@"Current DSL file tested: %@\n", v10);
  [(id)objc_opt_class() setupSingletonMocksWithOptions:self->_options];
  id v13 = [[a4 alloc] initWithAttributes:self->_options];
  uint64_t v14 = +[NSRunLoop currentRunLoop];
  v15 = +[NSDate dateWithTimeIntervalSinceNow:2.0];
  [v14 runUntilDate:v15];

  v16 = [v13 dslTestDriver];
  [v16 consumeTestFile:v10];

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  v17 = [v13 dslTestDriver];
  v18 = [v17 syntaxErrors];

  id v19 = [v18 countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (v19)
  {
    id v20 = v19;
    id v21 = 0;
    uint64_t v22 = *(void *)v43;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v43 != v22) {
          objc_enumerationMutation(v18);
        }
        id v24 = *(id *)(*((void *)&v42 + 1) + 8 * i);

        id v21 = v24;
        printf("Syntax Error: %s\n", (const char *)[v21 UTF8String]);
      }
      id v20 = [v18 countByEnumeratingWithState:&v42 objects:v47 count:16];
    }
    while (v20);
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v25 = [v13 dslTestDriver];
  v26 = [v25 failedTests];

  id v27 = [v26 countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v27)
  {
    id v28 = v27;
    id v29 = 0;
    uint64_t v30 = *(void *)v39;
    do
    {
      for (j = 0; j != v28; j = (char *)j + 1)
      {
        if (*(void *)v39 != v30) {
          objc_enumerationMutation(v26);
        }
        id v32 = *(id *)(*((void *)&v38 + 1) + 8 * (void)j);

        id v29 = v32;
        printf("Failed Test: %s\n", (const char *)[v29 UTF8String]);
      }
      id v28 = [v26 countByEnumeratingWithState:&v38 objects:v46 count:16];
    }
    while (v28);
  }
  [(id)objc_opt_class() teardownSingletonMocks:self->_options];
  double v33 = CFAbsoluteTimeGetCurrent() - Current;
  fprintf(__stderrp, "Testing time: %.2f s\n", v33);

  return v33;
}

- (BOOL)runTests:(id)a3 withHarnessClass:(Class)a4 forLanguage:(id)a5 errorMessage:(id)a6 reportObserver:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  double Current = CFAbsoluteTimeGetCurrent();
  NSLog(@"Current language being tested: %@\n", v13);
  if (v12)
  {
    id v33 = v14;
    [(id)objc_opt_class() setupSingletonMocksWithOptions:self->_options];
    v17 = [(id)objc_opt_class() reporterWithOptions:self->_options];
    id v18 = [[a4 alloc] initWithAttributes:self->_options];
    id v19 = +[NSRunLoop currentRunLoop];
    id v20 = +[NSDate dateWithTimeIntervalSinceNow:2.0];
    [v19 runUntilDate:v20];

    id v21 = [(NSMutableDictionary *)self->_options valueForKey:@"NUM_TRIALS"];
    int v22 = [v21 intValue];

    if (v22 <= 1) {
      uint64_t v23 = 1;
    }
    else {
      uint64_t v23 = v22;
    }
    id v24 = [(NSMutableDictionary *)self->_options valueForKey:@"START_INDEX"];
    unsigned int v25 = [v24 intValue];

    if (v25) {
      signed int v26 = v25 - 1;
    }
    else {
      signed int v26 = 0;
    }
    id v27 = [(NSMutableDictionary *)self->_options valueForKey:@"END_INDEX"];
    unsigned int v28 = [v27 intValue];

    if (!v28) {
      unsigned int v28 = [v12 count];
    }
    +[TITester runWithTests:inRange:testHarness:options:reporter:numTrials:reportObserver:](TITester, "runWithTests:inRange:testHarness:options:reporter:numTrials:reportObserver:", v12, v26, (int)(v28 - v26), v18, self->_options, v17, v23, v15);

    [(id)objc_opt_class() teardownSingletonMocks:self->_options];
    CFAbsoluteTime v29 = CFAbsoluteTimeGetCurrent() - Current;
    fprintf(__stderrp, "Testing time: %.2f s\n", v29);
    BOOL v30 = v29 != 0.0;
    id v14 = v33;
  }
  else
  {
    if (v14) {
      NSLog(@"%@", v14);
    }
    BOOL v30 = 0;
  }

  return v30;
}

- (BOOL)runTestCasesForSource:(id)a3 errorMessage:(id)a4 reportObserver:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double Current = CFAbsoluteTimeGetCurrent();
  if (v8)
  {
    double v12 = Current;
    [(id)objc_opt_class() setupSingletonMocksWithOptions:self->_options];
    id v14 = [(id)objc_opt_class() reporterWithOptions:self->_options];
    id v15 = +[NSRunLoop currentRunLoop];
    v16 = +[NSDate dateWithTimeIntervalSinceNow:2.0];
    [v15 runUntilDate:v16];

    +[TITester runTestCasesForSource:v8 options:self->_options reporter:v14 reportObserver:v10];
    [(id)objc_opt_class() teardownSingletonMocks:self->_options];
    CFAbsoluteTime v17 = CFAbsoluteTimeGetCurrent() - v12;
    fprintf(__stderrp, "Testing time: %.2f s\n", v17);
    BOOL v18 = v17 != 0.0;
  }
  else
  {
    if (v9) {
      NSLog(@"%@", Current, v9);
    }
    BOOL v18 = 0;
  }

  return v18;
}

- (BOOL)runAutocorrectionTester:(id)a3
{
  id v117 = a3;
  char v4 = [(NSMutableDictionary *)self->_options objectForKey:@"WORDS"];
  v115 = [(NSMutableDictionary *)self->_options objectForKey:@"DICTS"];
  v5 = [(NSMutableDictionary *)self->_options objectForKey:@"PLAYBACK"];
  v112 = [(NSMutableDictionary *)self->_options objectForKey:@"TEXT"];
  v113 = [(NSMutableDictionary *)self->_options objectForKey:@"TESTCASE"];
  uint64_t v114 = [(NSMutableDictionary *)self->_options objectForKey:@"TYPOLOGY"];
  v108 = [(NSMutableDictionary *)self->_options objectForKey:@"CANDIDATE_SENTENCES"];
  id v6 = [(NSMutableDictionary *)self->_options objectForKey:@"USER_DIRECTORY"];
  char v7 = [(NSMutableDictionary *)self->_options objectForKey:@"CUSTOM_DIALECT_LANGUAGE_MODEL_PATH"];
  id v8 = [(NSMutableDictionary *)self->_options valueForKey:@"RUN_DSL_TEST"];

  id v109 = [(NSMutableDictionary *)self->_options objectForKey:@"CONVERSATION_TESTS_FILE"];
  id v9 = [(NSMutableDictionary *)self->_options objectForKey:@"CONVERSATION_TESTS"];
  v111 = [(NSMutableDictionary *)self->_options objectForKey:@"SENTENCE"];
  id v10 = [(NSMutableDictionary *)self->_options objectForKey:@"PREFERS_TRANSLITERATION"];
  id v11 = v10;
  if (!v10) {
    id v10 = @"0";
  }
  unsigned int v12 = [(__CFString *)v10 BOOLValue];

  v110 = [(NSMutableDictionary *)self->_options objectForKey:@"INPUT_SAMPLES"];
  if (v6)
  {
    id v13 = v7;
    id v14 = [(NSMutableDictionary *)self->_options objectForKey:@"CLEAN_USER_DIRECTORY"];
    unsigned int v15 = [v14 intValue];

    if (v15) {
      sub_2EC8C(v6);
    }
    else {
      sub_2E21C(v6);
    }
    TI_SET_KB_USER_DIRECTORY();
    char v7 = v13;
  }
  v16 = [(NSMutableDictionary *)self->_options valueForKey:@"KEYBOARD_LANGUAGE"];
  if (v16 && (sub_48948() & 1) == 0)
  {
    NSLog(@"unsupported language '%@'. You must specify a valid language!.\n", v16);
    unsigned __int8 v24 = 0;
    unsigned int v25 = (void *)v114;
LABEL_38:
    v47 = v109;
LABEL_39:
    v46 = v115;
    goto LABEL_40;
  }
  unsigned int context = v12;
  CFAbsoluteTime v17 = [(NSMutableDictionary *)self->_options objectForKey:@"TOUCAN_LM_MODE"];

  if (v17)
  {
    BOOL v18 = v4;
    id v19 = v9;
    id v20 = v16;
    id v21 = v7;
    int v22 = [(NSMutableDictionary *)self->_options objectForKey:@"TOUCAN_LM_MODE"];
    unsigned int v23 = [v22 intValue];

    if (v23 > 2)
    {
      signed int v26 = [(NSMutableDictionary *)self->_options objectForKey:@"TOUCAN_LM_MODE"];
      NSLog(@"unsupported value for TOUCAN_LM_MODE option '%@'.\n", v26);
    }
    else
    {
      TI_SET_USING_TOUCAN_LM();
    }
    char v7 = v21;
    v16 = v20;
    id v9 = v19;
    char v4 = v18;
  }
  if (v7)
  {
    TI_SET_IS_USING_CUSTOM_DIALECT_LM();
    TI_SET_DIALECT_LM_PATH();
  }
  uint64_t v27 = objc_opt_class();
  unsigned int v25 = (void *)v114;
  if (v114) {
    uint64_t v27 = objc_opt_class();
  }
  uint64_t v28 = v27;
  if (!v16)
  {
    if (!v115) {
      goto LABEL_37;
    }
    sub_48748();
    long long v118 = 0u;
    long long v119 = 0u;
    long long v120 = 0u;
    long long v121 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v36 = [obj countByEnumeratingWithState:&v118 objects:v134 count:16];
    if (v36)
    {
      id v37 = v36;
      long long v38 = v7;
      long long v39 = self;
      id v98 = v9;
      v100 = v38;
      v102 = v4;
      v104 = v5;
      long long v40 = 0;
      uint64_t v41 = *(void *)v119;
      double v42 = 0.0;
      do
      {
        long long v43 = 0;
        long long v44 = v40;
        do
        {
          if (*(void *)v119 != v41) {
            objc_enumerationMutation(obj);
          }
          long long v45 = *(void **)(*((void *)&v118 + 1) + 8 * (void)v43);
          [(NSMutableDictionary *)v39->_options setObject:v45 forKey:@"INPUT_MODE"];
          long long v40 = sub_47844(v115, v45);

          double v42 = v42
              + (double)[(AutocorrectionTesterAppDelegate *)v39 runTests:v40 withHarnessClass:v28 forLanguage:v45 errorMessage:@"Unable to read the dictionary file.\n" reportObserver:v117];
          long long v43 = (char *)v43 + 1;
          long long v44 = v40;
        }
        while (v37 != v43);
        id v37 = [obj countByEnumeratingWithState:&v118 objects:v134 count:16];
      }
      while (v37);

      char v4 = v102;
      v46 = v115;
      v5 = v104;
      unsigned int v25 = (void *)v114;
      v16 = 0;
      char v7 = v100;
      id v9 = v98;
    }
    else
    {
      double v42 = 0.0;
      v46 = v115;
    }
    double v50 = v42 / 60.0;
    if (v42 > 0.0) {
      double v50 = v42;
    }
    fprintf(__stderrp, "Total testing time: %.2f s\n", v50);

    unsigned __int8 v24 = 1;
LABEL_47:
    v47 = v109;
    goto LABEL_40;
  }
  if (!sub_48948())
  {
    NSLog(@"unsupported language '%@'. You must specify a valid language!.\n", v16);
    goto LABEL_37;
  }
  [(NSMutableDictionary *)self->_options setObject:v16 forKey:@"INPUT_MODE"];
  if (v4)
  {
    sub_471D0((uint64_t)v4);
    id v29 = (id)objc_claimAutoreleasedReturnValue();
    CFStringRef v30 = @"Unable to read the word list file.\n";
    v31 = self;
    id v32 = v29;
    uint64_t v33 = v28;
    v34 = v16;
LABEL_24:
    unsigned __int8 v35 = [(AutocorrectionTesterAppDelegate *)v31 runTests:v32 withHarnessClass:v33 forLanguage:v34 errorMessage:v30 reportObserver:v117];
    goto LABEL_25;
  }
  v105 = v5;
  if (v115)
  {
    v49 = sub_47844(v115, v16);
    unsigned __int8 v24 = [(AutocorrectionTesterAppDelegate *)self runTests:v49 withHarnessClass:v28 forLanguage:v16 errorMessage:@"Unable to read the dictionary file.\n" reportObserver:v117];

    v47 = v109;
    v46 = v115;
    goto LABEL_40;
  }
  if (v8)
  {
    [(NSMutableDictionary *)self->_options setObject:@"YES" forKey:@"RUN_DSL_TEST"];
    v51 = [(NSMutableDictionary *)self->_options valueForKey:@"DSL_TEST_FILE"];
    [(AutocorrectionTesterAppDelegate *)self runDslTest:v51 withHarnessClass:v28 forLanguage:v16 errorMessage:0];
    unsigned __int8 v24 = v52 != 0.0;

    v47 = v109;
    v46 = 0;
    goto LABEL_40;
  }
  if (v113) {
    char v53 = context;
  }
  else {
    char v53 = 1;
  }
  if ((v53 & 1) == 0)
  {
    id v29 = +[TTKTestCaseReader loadFromPath:v113];
    if (!v29)
    {
      NSLog(@"Could not open: %@", v113);
      unsigned __int8 v24 = 0;
      goto LABEL_26;
    }
    v61 = [(NSMutableDictionary *)self->_options objectForKey:@"KEYSTROKE_SEGMENTATION_MODE"];

    if (!v61) {
      [(NSMutableDictionary *)self->_options setValue:@"alignment" forKey:@"KEYSTROKE_SEGMENTATION_MODE"];
    }
    unsigned __int8 v35 = [(AutocorrectionTesterAppDelegate *)self runTestCasesForSource:v29 errorMessage:0 reportObserver:v117];
LABEL_25:
    unsigned __int8 v24 = v35;
LABEL_26:

    goto LABEL_38;
  }
  uint64_t v97 = v28;
  if (context)
  {
    v54 = v7;
    [(NSMutableDictionary *)self->_options setObject:@"YES" forKey:@"PREFERS_PREDICTION_SELECTION"];
    v55 = [(NSMutableDictionary *)self->_options objectForKey:@"TEST_SENTENCE_TRANSLITERATION"];
    v56 = v55;
    if (!v55) {
      v55 = @"0";
    }
    id v57 = [(__CFString *)v55 BOOLValue];

    v58 = [(NSMutableDictionary *)self->_options objectForKey:@"TRANSLITERATE_WITH_SPACES"];
    v59 = v58;
    if (!v58) {
      v58 = @"0";
    }
    id v60 = [(__CFString *)v58 BOOLValue];

    char v7 = v54;
    if (v111)
    {
      id v29 = +[PlaybackTest loadFromSentence:v111 withCatenation:v57];
      char v4 = 0;
    }
    else
    {
      char v4 = 0;
      if (!v112) {
        goto LABEL_37;
      }
      id v29 = +[PlaybackTest loadFromTextInputFile:v112 withCatenation:v57 addWordSpacing:v60];
    }
    uint64_t v33 = v97;
    if (v29)
    {
      v31 = self;
      id v32 = v29;
      v34 = v16;
      CFStringRef v30 = 0;
      goto LABEL_24;
    }
LABEL_37:
    unsigned __int8 v24 = 0;
    goto LABEL_38;
  }
  if (v112)
  {
    uint64_t v133 = 0;
    v62 = sub_47A78((uint64_t)v112, (uint64_t)&v133);
    if (v62)
    {
      unsigned __int8 v24 = [(AutocorrectionTesterAppDelegate *)self runTests:v62 withHarnessClass:v28 forLanguage:v16 errorMessage:0 reportObserver:v117];
    }
    else
    {
      NSLog(@"Could not open: %@", v112);
      unsigned __int8 v24 = 0;
    }
    v46 = 0;

    goto LABEL_47;
  }
  if (v110)
  {
    +[NSMutableArray array];
    v131[0] = _NSConcreteStackBlock;
    v131[1] = 3221225472;
    v131[2] = sub_4A488;
    v131[3] = &unk_8D9D8;
    id v132 = (id)objc_claimAutoreleasedReturnValue();
    id v29 = v132;
    [v110 enumerateObjectsUsingBlock:v131];
    unsigned __int8 v24 = [(AutocorrectionTesterAppDelegate *)self runTests:v29 withHarnessClass:v28 forLanguage:v16 errorMessage:0 reportObserver:v117];

    goto LABEL_26;
  }
  v103 = v6;
  v101 = v7;
  if (v109)
  {
    v63 = v9;
    v64 = +[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:");
    id v130 = 0;
    v65 = +[NSJSONSerialization JSONObjectWithData:v64 options:4 error:&v130];
    id v66 = v130;
    if (!v65)
    {
      v94 = __stderrp;
      v95 = (const char *)[v109 cStringUsingEncoding:4];
      id v96 = [v66 localizedDescription];
      fprintf(v94, "Error: Unable to parse JSON config file '%s': %s\n\n", v95, (const char *)[v96 cStringUsingEncoding:4]);

      exit(1);
    }
    v67 = [v65 objectForKeyedSubscript:@"conversationTests"];
    uint64_t v68 = sub_1A884(v67);

    id v9 = (id)v68;
    unsigned int v25 = (void *)v114;
    id v6 = v103;
    char v7 = v101;
  }
  if (!v9)
  {
    if (v111)
    {
      v88 = v7;
      v89 = +[AutocorrectionTest testWithInput:](AutocorrectionTest, "testWithInput:");
      v135 = v89;
      v90 = +[NSArray arrayWithObjects:&v135 count:1];

      unsigned __int8 v24 = [(AutocorrectionTesterAppDelegate *)self runTests:v90 withHarnessClass:v97 forLanguage:v16 errorMessage:0 reportObserver:v117];
      id v9 = 0;
      v47 = v109;
      char v7 = v88;
      char v4 = 0;
      goto LABEL_39;
    }
    v91 = self;
    v46 = 0;
    if (v25)
    {
      unsigned int v25 = (void *)v114;
      v92 = sub_48400(v114);
      unsigned __int8 v24 = [(AutocorrectionTesterAppDelegate *)v91 runTests:v92 withHarnessClass:v97 forLanguage:v16 errorMessage:0 reportObserver:v117];

      id v9 = 0;
      char v4 = 0;
    }
    else
    {
      if (v108)
      {
        v93 = sub_47398((uint64_t)v108);
        unsigned __int8 v24 = [(AutocorrectionTesterAppDelegate *)v91 runTests:v93 withHarnessClass:v97 forLanguage:v16 errorMessage:@"Unable to read candidates\n" reportObserver:v117];

        id v9 = 0;
      }
      else
      {
        id v9 = 0;
        unsigned __int8 v24 = 0;
      }
      char v4 = 0;
      unsigned int v25 = (void *)v114;
    }
    char v7 = v101;
    goto LABEL_47;
  }
  v99 = v16;
  id v69 = objc_alloc_init((Class)NSMutableDictionary);
  v138[0] = @"CONVERSATION_SENDERS_TO_TEST";
  v138[1] = @"CONVERSATION_ADAPT_TO_SENT_MESSAGES";
  v139[0] = @"sendersToTest";
  v139[1] = @"adaptToSentMessages";
  v138[2] = @"CONVERSATION_ADAPT_TO_RECEIVED_MESSAGES";
  v139[2] = @"adaptToReceivedMessages";
  +[NSDictionary dictionaryWithObjects:v139 forKeys:v138 count:3];
  long long v126 = 0u;
  long long v127 = 0u;
  long long v128 = 0u;
  long long v129 = 0u;
  id v70 = (id)objc_claimAutoreleasedReturnValue();
  id v71 = [v70 countByEnumeratingWithState:&v126 objects:v137 count:16];
  if (v71)
  {
    id v72 = v71;
    uint64_t v73 = *(void *)v127;
    do
    {
      for (i = 0; i != v72; i = (char *)i + 1)
      {
        if (*(void *)v127 != v73) {
          objc_enumerationMutation(v70);
        }
        uint64_t v75 = *(void *)(*((void *)&v126 + 1) + 8 * i);
        v76 = [(NSMutableDictionary *)self->_options objectForKeyedSubscript:v75];

        if (v76)
        {
          v77 = [v70 objectForKeyedSubscript:v75];
          v78 = [(NSMutableDictionary *)self->_options objectForKeyedSubscript:v75];
          [v69 setObject:v78 forKeyedSubscript:v77];
        }
      }
      id v72 = [v70 countByEnumeratingWithState:&v126 objects:v137 count:16];
    }
    while (v72);
  }
  v79 = v70;
  v80 = self;
  v81 = v79;

  id v82 = objc_alloc_init((Class)NSMutableArray);
  long long v122 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  id v9 = v9;
  id v83 = [v9 countByEnumeratingWithState:&v122 objects:v136 count:16];
  if (v83)
  {
    id v84 = v83;
    uint64_t v85 = *(void *)v123;
    do
    {
      for (j = 0; j != v84; j = (char *)j + 1)
      {
        if (*(void *)v123 != v85) {
          objc_enumerationMutation(v9);
        }
        v87 = [*(id *)(*((void *)&v122 + 1) + 8 * (void)j) overridingJsonKeys:v69];
        [v82 addObject:v87];
      }
      id v84 = [v9 countByEnumeratingWithState:&v122 objects:v136 count:16];
    }
    while (v84);
  }

  unsigned __int8 v24 = [(AutocorrectionTesterAppDelegate *)v80 runTests:v82 withHarnessClass:v97 forLanguage:v99 errorMessage:0 reportObserver:v117];
  char v4 = 0;
  id v6 = v103;
  unsigned int v25 = (void *)v114;
  v46 = 0;
  v16 = v99;
  v5 = v105;
  v47 = v109;
  char v7 = v101;
LABEL_40:

  return v24;
}

- (BOOL)runWithObserver:(id)a3
{
  id v57 = a3;
  char v4 = [(NSMutableDictionary *)self->_options objectForKey:@"STEP_INDEX"];

  if (v4)
  {
    v58 = +[TISweepSource sharedInstance];
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    v5 = self;
    id obj = self->_options;
    id v6 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v66 objects:v71 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v67;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v67 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v66 + 1) + 8 * i);
          id v11 = [(NSMutableDictionary *)self->_options objectForKey:v10];
          unsigned int v12 = +[NSCharacterSet characterSetWithCharactersInString:@"[],"];
          id v13 = [v11 componentsSeparatedByCharactersInSet:v12];

          if ((unint64_t)[v13 count] >= 2)
          {
            id v14 = [v13 objectAtIndex:1];
            [v14 floatValue];
            int v16 = v15;

            LODWORD(v17) = v16;
            [v58 addValue:v10 withValue:v17];
          }
        }
        id v7 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v66 objects:v71 count:16];
      }
      while (v7);
    }

    BOOL v18 = [v58 debugValues];
    id v19 = [v18 count];

    if (v19)
    {
      id v20 = v57;
      unsigned __int8 v21 = [(AutocorrectionTesterAppDelegate *)v5 runAutocorrectionTester:v57];

      goto LABEL_33;
    }

    self = v5;
  }
  int v22 = [(NSMutableDictionary *)self->_options objectForKey:@"STEP_COUNT"];

  if (!v22)
  {
LABEL_30:
    id v20 = v57;
    unsigned __int8 v21 = [(AutocorrectionTesterAppDelegate *)self runAutocorrectionTester:v57];
    goto LABEL_33;
  }
  unsigned int v23 = +[TISweepSource sharedInstance];
  unsigned __int8 v24 = [(NSMutableDictionary *)self->_options objectForKey:@"STEP_COUNT"];
  v59 = v23;
  objc_msgSend(v23, "setStepCount:", objc_msgSend(v24, "intValue"));

  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  unsigned int v25 = self;
  obja = self->_options;
  id v26 = [(NSMutableDictionary *)obja countByEnumeratingWithState:&v62 objects:v70 count:16];
  if (v26)
  {
    id v27 = v26;
    uint64_t v28 = *(void *)v63;
    do
    {
      for (j = 0; j != v27; j = (char *)j + 1)
      {
        if (*(void *)v63 != v28) {
          objc_enumerationMutation(obja);
        }
        uint64_t v30 = *(void *)(*((void *)&v62 + 1) + 8 * (void)j);
        v31 = [(NSMutableDictionary *)self->_options objectForKey:v30];
        id v32 = +[NSCharacterSet characterSetWithCharactersInString:@"[],"];
        uint64_t v33 = [v31 componentsSeparatedByCharactersInSet:v32];

        if ((unint64_t)[v33 count] >= 2)
        {
          v34 = [v33 objectAtIndex:1];
          [v34 floatValue];
          int v36 = v35;

          id v37 = [v33 objectAtIndex:2];
          [v37 floatValue];
          int v39 = v38;

          LODWORD(v40) = v36;
          LODWORD(v41) = v39;
          [v59 addValue:v30 withMin:v40 withMax:v41];
        }
      }
      id v27 = [(NSMutableDictionary *)obja countByEnumeratingWithState:&v62 objects:v70 count:16];
    }
    while (v27);
  }

  double v42 = [v59 debugValues];
  id v43 = [v42 count];

  if (!v43)
  {

    self = v25;
    goto LABEL_30;
  }
  long long v44 = +[NSMutableString string];
  long long v45 = [v59 sweepStateHeader];
  [v44 appendFormat:@"%@results,\n", v45];

  v46 = [(NSMutableDictionary *)v25->_options valueForKey:@"OUTPATH"];
  v47 = [(NSMutableDictionary *)v25->_options objectForKey:@"SWEEP_EXTRACT"];
  v48 = [v46 stringByDeletingLastPathComponent];
  v49 = [v48 stringByAppendingPathComponent:v47];

  double v50 = [v49 stringByAppendingFormat:@" %@ > /tmp/sweep_value.txt", v46];

  v51 = +[NSString stringWithFormat:@"sh %@", v50];

  id v20 = v57;
  if ([v59 finished])
  {
LABEL_28:
    v55 = [v46 stringByDeletingPathExtension];

    v46 = [v55 stringByAppendingString:@"_sweep.csv"];

    unsigned __int8 v21 = 1;
    [v44 writeToFile:v46 atomically:1 encoding:4 error:0];
  }
  else
  {
    while ([(AutocorrectionTesterAppDelegate *)v25 runAutocorrectionTester:v57])
    {
      system((const char *)[v51 cStringUsingEncoding:4]);
      double v52 = +[NSString stringWithContentsOfFile:@"/tmp/sweep_value.txt" encoding:4 error:0];
      char v53 = [v59 sweepStateValues];
      [v52 floatValue];
      [v44 appendFormat:@"%@%f,\n", v53, v54];

      [v59 advanceSweep];
      if ([v59 finished]) {
        goto LABEL_28;
      }
    }
    unsigned __int8 v21 = 0;
  }

LABEL_33:
  return v21;
}

- (BOOL)runAndWriteReport
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_4ABB4;
  v3[3] = &unk_8DA00;
  v3[4] = self;
  return [(AutocorrectionTesterAppDelegate *)self runWithObserver:v3];
}

- (void).cxx_destruct
{
}

@end