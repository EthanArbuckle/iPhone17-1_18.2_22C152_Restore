@interface TITester
+ (id)stringByReplacingCurlyQuotesWithStraightQuotes:(id)a3;
+ (void)runTestCasesForSource:(id)a3 options:(id)a4 reporter:(id)a5 reportObserver:(id)a6;
+ (void)runWithTests:(id)a3 inRange:(_NSRange)a4 testHarness:(id)a5 options:(id)a6 reporter:(id)a7 numTrials:(unint64_t)a8 reportObserver:(id)a9;
- (AutofillTestHarness)autofillTestHarness;
- (NSArray)tests;
- (TIReporter)reporter;
- (TITestHarness)testHarness;
- (TITester)initWithTests:(id)a3;
- (id)runTestBasedOnTestType:(id)a3 options:(id)a4 trialID:(unint64_t)a5 withError:(id)a6;
- (void)createAutofillTestHarnessInstance:(id)a3;
- (void)runTestsInRange:(_NSRange)a3 options:(id)a4 trialID:(unint64_t)a5;
- (void)setAutofillTestHarness:(id)a3;
- (void)setReporter:(id)a3;
- (void)setTestHarness:(id)a3;
@end

@implementation TITester

- (TITester)initWithTests:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TITester;
  v6 = [(TITester *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_tests, a3);
  }

  return v7;
}

- (void)runTestsInRange:(_NSRange)a3 options:(id)a4 trialID:(unint64_t)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v8 = a4;
  objc_super v9 = [(TITester *)self reporter];
  [v9 beginLogTrial];

  NSUInteger v39 = [(NSArray *)self->_tests count];
  v10 = [v8 valueForKey:@"TEST_AUTO_FILL_FEATURE"];
  unsigned int v11 = [v10 BOOLValue];

  CFStringRef v12 = @"NO";
  if (v11) {
    CFStringRef v12 = @"YES";
  }
  NSLog(@"Are we going to test AutoFillFeature = %@", v12);
  if (v11)
  {
    [(TITester *)self createAutofillTestHarnessInstance:v8];
    if (!v39)
    {
      v13 = [(AutofillTestHarness *)self->_autofillTestHarness runAutofillTestWithoutTyping:v8 testHarness:self->testHarness trialID:a5];
      v14 = [(TITester *)self reporter];
      [v14 logResult:v13];
    }
  }
  NSUInteger v38 = location + length;
  BOOL v15 = location >= location + length;
  unint64_t v16 = a5;
  if (!v15)
  {
    id v36 = v8;
    do
    {
      NSUInteger v18 = location + 1;
      fprintf(__stderrp, "Testing line: %lu/%lu\n", location + 1, v39);
      v19 = [(NSArray *)self->_tests objectAtIndexedSubscript:location];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v20 = [(TITester *)self testHarness];
        v21 = [v20 runConversationTest:v19 trialID:v16 withError:0];

        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id v22 = v21;
        id v23 = [v22 countByEnumeratingWithState:&v40 objects:v44 count:16];
        if (v23)
        {
          id v24 = v23;
          uint64_t v25 = *(void *)v41;
          do
          {
            for (i = 0; i != v24; i = (char *)i + 1)
            {
              if (*(void *)v41 != v25) {
                objc_enumerationMutation(v22);
              }
              uint64_t v27 = *(void *)(*((void *)&v40 + 1) + 8 * i);
              v28 = [(TITester *)self reporter];
              [v28 logResult:v27];
            }
            id v24 = [v22 countByEnumeratingWithState:&v40 objects:v44 count:16];
          }
          while (v24);
          v29 = v22;
          id v8 = v36;
          unint64_t v16 = a5;
        }
        else
        {
          v29 = v22;
        }
      }
      else
      {
        v29 = [(TITester *)self runTestBasedOnTestType:v19 options:v8 trialID:v16 withError:0];
        id v22 = [(TITester *)self reporter];
        [v22 logResult:v29];
      }

      v30 = [(TITester *)self testHarness];
      char v31 = objc_opt_respondsToSelector();

      if (v31)
      {
        v32 = [(TITester *)self testHarness];
        [v32 performSelector:"reset" withObject:0];
      }
      v33 = +[NSRunLoop currentRunLoop];
      v34 = +[NSDate dateWithTimeIntervalSinceNow:0.05];
      [v33 runUntilDate:v34];

      NSUInteger location = v18;
    }
    while (v18 != v38);
  }
  fputc(10, __stderrp);
  v35 = [(TITester *)self reporter];
  [v35 endLogTrial];
}

- (id)runTestBasedOnTestType:(id)a3 options:(id)a4 trialID:(unint64_t)a5 withError:(id)a6
{
  id v9 = a4;
  if (self->_autofillTestHarness)
  {
    id v10 = a3;
    id v11 = objc_alloc_init((Class)NSArray);
    CFStringRef v12 = [(AutofillTestHarness *)self->_autofillTestHarness configureAutofillAndGetAutocorrectionsOrCandidatesBeforeTyping:v9];

    v13 = [(TITester *)self testHarness];
    id v14 = [v13 runTest:v10 trialID:a5 withError:0];

    [(AutofillTestHarness *)self->_autofillTestHarness updateResultForAutoFill:v14 predictionCandidatesWithoutTyping:v12];
  }
  else
  {
    id v14 = a3;
    CFStringRef v12 = [(TITester *)self testHarness];
    [v12 runTest:v14 trialID:a5 withError:0];
  BOOL v15 = };

  return v15;
}

- (void)createAutofillTestHarnessInstance:(id)a3
{
  id v4 = a3;
  if (!self->_autofillTestHarness)
  {
    id v10 = v4;
    id v5 = self->testHarness;
    v6 = [(TITestHarness *)v5 testTyper];
    v7 = NSClassFromString(@"AutofillTestHarness");
    if (!v7)
    {
      fwrite("Error: Unable to load 'AutofillTestHarness' class\n\n", 0x33uLL, 1uLL, __stderrp);
      exit(1);
    }
    id v8 = (AutofillTestHarness *)[[v7 alloc] initWithOptionsAndTestTyper:v10 testTyper:v6];
    autofillTestHarness = self->_autofillTestHarness;
    self->_autofillTestHarness = v8;

    id v4 = v10;
  }
}

+ (void)runWithTests:(id)a3 inRange:(_NSRange)a4 testHarness:(id)a5 options:(id)a6 reporter:(id)a7 numTrials:(unint64_t)a8 reportObserver:(id)a9
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v25 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = (void (**)(id, void *, void))a9;
  id v18 = [objc_alloc((Class)a1) initWithTests:v25];
  id v24 = v16;
  [v18 setReporter:v16];
  [v18 setTestHarness:v14];
  if (a8)
  {
    for (uint64_t i = 0; i != a8; ++i)
    {
      fprintf(__stderrp, "Beginning trial %lu\n", i);
      objc_msgSend(v18, "runTestsInRange:options:trialID:", location, length, v15, i);
      if ([v14 requiresMaintenance])
      {
        +[TILanguageModelLoaderManager flushDynamicLearningCaches];
        +[TILanguageModelLoaderManager performMaintenance];
      }
      v21 = [v18 reporter];
      id v22 = [v21 reportForTrial:i];

      if (v17) {
        v17[2](v17, v22, i);
      }
    }
  }
}

+ (id)stringByReplacingCurlyQuotesWithStraightQuotes:(id)a3
{
  v3 = [a3 stringByReplacingOccurrencesOfString:@"‘" withString:@"'"];
  id v4 = [v3 stringByReplacingOccurrencesOfString:@"’" withString:@"'"];

  id v5 = [v4 stringByReplacingOccurrencesOfString:@"“" withString:@"\""];

  v6 = [v5 stringByReplacingOccurrencesOfString:@"”" withString:@"\""];

  return v6;
}

+ (void)runTestCasesForSource:(id)a3 options:(id)a4 reporter:(id)a5 reportObserver:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  CFStringRef v12 = (void (**)(id, void *, void))a6;
  v13 = [v10 valueForKey:@"START_INDEX"];
  unsigned int v14 = [v13 intValue];

  if (v14) {
    signed int v15 = v14 - 1;
  }
  else {
    signed int v15 = 0;
  }
  id v16 = [v10 valueForKey:@"END_INDEX"];
  unsigned int v17 = [v16 intValue];

  v91 = v11;
  [v11 beginLogTrial];
  id v18 = [v9 getNextTestCase];
  if (v18)
  {
    unint64_t v95 = v17;
    unint64_t v19 = v15;
    uint64_t v20 = 0;
    id v86 = v10;
    id v87 = v9;
    v85 = v12;
    unint64_t v93 = v19;
    while (1)
    {
      unint64_t v21 = v20++;
      if (v21 >= v19)
      {
        id v22 = [v18 records];
        id v23 = [v22 count];

        if (v23)
        {
          fprintf(__stderrp, "Test case: %lu\n", v20);
          id v25 = [v10 mutableCopy];
          [v25 setObject:@"ACTRecordedActionStream" forKey:@"UserActionStream"];
          [v25 setObject:v18 forKey:@"TTKTestCase"];
          v26 = [v25 objectForKey:@"USE_RETROCORRECTION"];

          if (!v26) {
            [v25 setObject:&__kCFBooleanTrue forKey:@"USE_RETROCORRECTION"];
          }
          v98 = v24;
          uint64_t v27 = [v25 objectForKey:@"USE_PREDICTION"];

          if (!v27) {
            [v25 setObject:&__kCFBooleanTrue forKey:@"USE_PREDICTION"];
          }
          long long v106 = 0u;
          long long v107 = 0u;
          long long v104 = 0u;
          long long v105 = 0u;
          v28 = [v18 records];
          id v29 = [v28 countByEnumeratingWithState:&v104 objects:v111 count:16];
          if (v29)
          {
            id v30 = v29;
            v99 = v25;
            v96 = v18;
            uint64_t v97 = v21;
            uint64_t v94 = v20;
            uint64_t v31 = *(void *)v105;
LABEL_14:
            uint64_t v32 = 0;
            while (1)
            {
              if (*(void *)v105 != v31) {
                objc_enumerationMutation(v28);
              }
              v33 = *(void **)(*((void *)&v104 + 1) + 8 * v32);
              v34 = [v33 layoutName];
              objc_opt_class();
              char isKindOfClass = objc_opt_isKindOfClass();

              if (isKindOfClass) {
                break;
              }
              if (v30 == (id)++v32)
              {
                id v30 = [v28 countByEnumeratingWithState:&v104 objects:v111 count:16];
                if (v30) {
                  goto LABEL_14;
                }
                int v36 = 2;
                v37 = v28;
                id v18 = v96;
                unint64_t v21 = v97;
                unint64_t v19 = v93;
                uint64_t v20 = v94;
                NSUInteger v38 = v98;
                id v25 = v99;
                goto LABEL_53;
              }
            }
            uint64_t v39 = [v33 layoutName];

            id v25 = v99;
            if (!v39)
            {
              int v36 = 2;
              id v18 = v96;
              unint64_t v21 = v97;
              unint64_t v19 = v93;
              uint64_t v20 = v94;
              NSUInteger v38 = v98;
              goto LABEL_54;
            }
            long long v40 = [v9 layouts];
            v90 = (void *)v39;
            uint64_t v41 = [v40 objectForKey:v39];

            v92 = (void *)v41;
            [v99 setObject:v41 forKey:@"TTKKeyboardPlane"];
            id v18 = v96;
            long long v42 = [v96 metadata];
            uint64_t v43 = [v42 objectForKey:@"displayWidth"];
            unint64_t v19 = v93;
            unint64_t v21 = v97;
            if (v43)
            {
              v44 = (void *)v43;
              v45 = [v96 metadata];
              v46 = [v45 objectForKey:@"displayHeight"];

              if (v46)
              {
                v47 = [v96 metadata];
                v48 = [v47 objectForKey:@"displayWidth"];

                v49 = [v96 metadata];
                v50 = [v49 objectForKey:@"displayHeight"];

                v51 = (char *)[v48 compare:v50];
                v52 = @"Portrait";
                if (v51 == (unsigned char *)&def_3B118 + 1) {
                  v52 = @"Landscape";
                }
                v53 = v52;

LABEL_32:
                [v99 setObject:v48 forKey:@"KEYBOARD_WIDTH"];
                [v99 setObject:v53 forKey:@"KEYBOARD_ORIENTATION"];
                v54 = __stderrp;
                v89 = v48;
                unsigned int v55 = [v48 intValue];
                v88 = v53;
                fprintf(v54, "width = %d orientation = %s\n", v55, (const char *)[(__CFString *)v88 UTF8String]);
                v56 = objc_opt_new();
                v57 = objc_opt_new();
                long long v100 = 0u;
                long long v101 = 0u;
                long long v102 = 0u;
                long long v103 = 0u;
                v58 = [v96 records];
                id v59 = [v58 countByEnumeratingWithState:&v100 objects:v110 count:16];
                if (v59)
                {
                  id v60 = v59;
                  uint64_t v61 = *(void *)v101;
                  do
                  {
                    for (uint64_t i = 0; i != v60; uint64_t i = (char *)i + 1)
                    {
                      if (*(void *)v101 != v61) {
                        objc_enumerationMutation(v58);
                      }
                      v63 = *(void **)(*((void *)&v100 + 1) + 8 * i);
                      v64 = objc_opt_class();
                      v65 = [v63 primaryIntendedText];
                      v66 = [v64 stringByReplacingCurlyQuotesWithStraightQuotes:v65];

                      [v56 addObject:v66];
                      v67 = [v63 layoutName];
                      unsigned __int8 v68 = [v57 containsObject:v67];

                      if ((v68 & 1) == 0)
                      {
                        v69 = [v63 layoutName];
                        v70 = [v69 description];
                        [v57 addObject:v70];
                      }
                    }
                    id v60 = [v58 countByEnumeratingWithState:&v100 objects:v110 count:16];
                  }
                  while (v60);
                }

                v71 = [[AutocorrectionTestHarness alloc] initWithAttributes:v99];
                id v18 = v96;
                v72 = [v96 metadata];
                id v73 = [v72 mutableCopy];

                [v73 setValue:v57 forKey:@"layouts"];
                v74 = sub_4038();
                if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
                {
                  id v75 = [v73 objectForKeyedSubscript:@"recordIdentifier"];
                  id v76 = [v75 cStringUsingEncoding:4];
                  *(_DWORD *)buf = 136315138;
                  id v109 = v76;
                  _os_log_impl(&def_3B118, v74, OS_LOG_TYPE_INFO, "Running test case with recordIdentifier: %s", buf, 0xCu);
                }
                v77 = __stdoutp;
                id v78 = [v73 objectForKeyedSubscript:@"recordIdentifier"];
                fprintf(v77, "Running test case with recordIdentifier: %s\n", (const char *)[v78 cStringUsingEncoding:4]);

                v79 = +[AutocorrectionTest testWithInput:&stru_8DEF0 expectedOutput:v56 sourceMetadata:v73 withTouches:0 andCorpusId:0];
                unint64_t v21 = v97;
                v80 = [(AutocorrectionTestHarness *)v71 runTest:v79 trialID:v97 withError:0];
                [v91 logResult:v80];
                if (objc_opt_respondsToSelector()) {
                  [(AutocorrectionTestHarness *)v71 performSelector:"reset" withObject:0];
                }
                v81 = +[NSRunLoop currentRunLoop];
                v82 = +[NSDate dateWithTimeIntervalSinceNow:0.05];
                [v81 runUntilDate:v82];

                if ([(AutocorrectionTestHarness *)v71 requiresMaintenance])
                {
                  +[TILanguageModelLoaderManager flushDynamicLearningCaches];
                  unint64_t v21 = v97;
                  +[TILanguageModelLoaderManager performMaintenance];
                }

                int v36 = 0;
                id v10 = v86;
                id v9 = v87;
                CFStringRef v12 = v85;
                unint64_t v19 = v93;
                uint64_t v20 = v94;
                NSUInteger v38 = v98;
                id v25 = v99;
                goto LABEL_52;
              }
            }
            else
            {
            }
            if (v92)
            {
              [v92 keyboardWidth];
              v48 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
              v53 = [v92 keyboardOrientation];
              goto LABEL_32;
            }
            objc_opt_class();
            uint64_t v20 = v94;
            id v25 = v99;
            if (objc_opt_isKindOfClass()) {
              fwrite("Unable to find keyboard layout-- layoutName is null\n", 0x34uLL, 1uLL, __stderrp);
            }
            else {
              fprintf(__stderrp, "Unable to find keyboard layout for name='%s'\n", (const char *)[v90 UTF8String]);
            }
            int v36 = 2;
            NSUInteger v38 = v98;
LABEL_52:

            v37 = v90;
            goto LABEL_53;
          }
          int v36 = 2;
          v37 = v28;
          NSUInteger v38 = v98;
LABEL_53:

LABEL_54:
          if (!v36 && (int)v95 >= 1 && v21 >= v95) {
            break;
          }
        }
      }
      v83 = [v9 getNextTestCase];

      id v18 = v83;
      if (!v83) {
        goto LABEL_60;
      }
    }
  }
  v83 = v18;
LABEL_60:
  [v91 endLogTrial];
  v84 = [v91 reportForTrial:0];
  if (v12) {
    v12[2](v12, v84, 0);
  }
}

- (TIReporter)reporter
{
  return self->_reporter;
}

- (void)setReporter:(id)a3
{
}

- (NSArray)tests
{
  return self->_tests;
}

- (TITestHarness)testHarness
{
  return self->testHarness;
}

- (void)setTestHarness:(id)a3
{
}

- (AutofillTestHarness)autofillTestHarness
{
  return (AutofillTestHarness *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAutofillTestHarness:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autofillTestHarness, 0);
  objc_storeStrong((id *)&self->testHarness, 0);
  objc_storeStrong((id *)&self->_reporter, 0);

  objc_storeStrong((id *)&self->_tests, 0);
}

@end