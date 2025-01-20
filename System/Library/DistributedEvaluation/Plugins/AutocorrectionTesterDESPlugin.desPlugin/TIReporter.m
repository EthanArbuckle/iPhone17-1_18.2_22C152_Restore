@interface TIReporter
+ (id)fileURLForTrial:(unint64_t)a3 withOptions:(id)a4;
+ (id)languageForOptions:(id)a3;
+ (id)textCorpusForOptions:(id)a3;
- (BOOL)shouldConcatenateTokensAtBoundaryError;
- (NSDictionary)options;
- (NSMutableArray)resultLoggers;
- (NSString)buildVersion;
- (NSString)language;
- (NSString)localeIdentifierForLanguage;
- (NSString)textCorpus;
- (TIReporter)initWithBuildVersion:(id)a3;
- (id)alignedTypingSequenceForResult:(id)a3 keystrokeSegmentationMode:(unint64_t)a4;
- (id)alignedTypingSequenceForTransliteratedResult:(id)a3;
- (id)reportForAutocorrectionResults:(id)a3;
- (id)reportForTrial:(unint64_t)a3;
- (id)resultsForTrial:(unint64_t)a3;
- (void)beginLogTrial;
- (void)collectAggdStatisticsForResult:(id)a3;
- (void)logResult:(id)a3;
- (void)setOptions:(id)a3;
@end

@implementation TIReporter

- (TIReporter)initWithBuildVersion:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TIReporter;
  v6 = [(TIReporter *)&v10 init];
  if (v6)
  {
    v7 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    resultLoggers = v6->_resultLoggers;
    v6->_resultLoggers = v7;

    objc_storeStrong((id *)&v6->_buildVersion, a3);
  }

  return v6;
}

+ (id)languageForOptions:(id)a3
{
  v3 = [a3 objectForKey:@"KEYBOARD_LANGUAGE"];
  v4 = v3;
  if (!v3) {
    v3 = &stru_8DEF0;
  }
  id v5 = v3;

  return v5;
}

- (NSString)language
{
  v3 = objc_opt_class();
  v4 = [(TIReporter *)self options];
  id v5 = [v3 languageForOptions:v4];

  return (NSString *)v5;
}

- (NSString)localeIdentifierForLanguage
{
  v2 = [(TIReporter *)self language];
  id v3 = [v2 rangeOfString:@"-"];
  if (v3 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v4 = [v2 substringToIndex:v3];

    v2 = (void *)v4;
  }
  if ([v2 hasPrefix:@"zh"])
  {
    id v5 = [v2 rangeOfString:@"_"];
    if (v5 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v7 = objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:options:range:", @"_", @"-", 0, v5, v6);

      v2 = (void *)v7;
    }
  }

  return (NSString *)v2;
}

+ (id)textCorpusForOptions:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 valueForKey:@"TEXT"];
  if (!v4)
  {
    uint64_t v4 = [v3 valueForKey:@"CANDIDATE_SENTENCES"];
    if (!v4)
    {
      uint64_t v4 = [v3 valueForKey:@"CANDIDATE_PHRASES"];
      if (!v4)
      {
        id v5 = [v3 valueForKey:@"TESTCASE"];
        uint64_t v4 = [v5 lastPathComponent];
      }
    }
  }
  uint64_t v6 = [v4 lastPathComponent];

  id v7 = [v6 rangeOfString:@"." options:4];
  if (v7 && v7 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = [v6 substringToIndex:v7];

    uint64_t v6 = (void *)v8;
  }

  return v6;
}

- (NSString)textCorpus
{
  id v3 = objc_opt_class();
  uint64_t v4 = [(TIReporter *)self options];
  id v5 = [v3 textCorpusForOptions:v4];

  return (NSString *)v5;
}

- (void)beginLogTrial
{
  id v3 = [(TIReporter *)self options];
  uint64_t v4 = [v3 valueForKey:@"USE_PARTFILE"];
  unsigned int v5 = [v4 BOOLValue];

  if (v5)
  {
    uint64_t v6 = [(TIReporter *)self options];
    id v7 = [v6 valueForKey:@"PARTFILE_FLUSH_THRESHOLD"];

    uint64_t v8 = objc_opt_class();
    id v9 = [(NSMutableArray *)self->_resultLoggers count];
    objc_super v10 = [(TIReporter *)self options];
    v11 = [v8 fileURLForTrial:v9 withOptions:v10];

    v14 = [[TISerializingResultLogger alloc] initWithOutputURL:v11 flushThreshold:v7];
  }
  else
  {
    v14 = objc_alloc_init(TIInMemoryResultLogger);
  }
  [(NSMutableArray *)self->_resultLoggers addObject:v14];
  v12 = __stderrp;
  id v13 = [(TISerializingResultLogger *)v14 description];
  fprintf(v12, "The following result logger will be used for this trial %s\n", (const char *)[v13 cStringUsingEncoding:4]);
}

- (void)logResult:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [(TIReporter *)self options];
  unsigned int v5 = [v4 objectForKey:@"REPORT_AGGD_STATISTICS"];
  unsigned int v6 = [v5 BOOLValue];

  if (v6) {
    [(TIReporter *)self collectAggdStatisticsForResult:v9];
  }
  id v7 = [(TIReporter *)self resultLoggers];
  uint64_t v8 = [v7 lastObject];

  [v8 addResult:v9];
}

- (void)collectAggdStatisticsForResult:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  unsigned int v5 = _TIMockingAggdReporterDictionary();
  unsigned int v6 = +[NSKeyedArchiver archivedDataWithRootObject:v5 requiringSecureCoding:0 error:0];
  id v7 = +[NSKeyedUnarchiver unarchivedObjectOfClass:v4 fromData:v6 error:0];
  [v3 setAggdStatistics:v7];

  _TIMockingAggdReporterClear();
}

- (id)resultsForTrial:(unint64_t)a3
{
  uint64_t v4 = [(TIReporter *)self resultLoggers];
  unsigned int v5 = [v4 objectAtIndex:a3];
  unsigned int v6 = [v5 allResults];

  return v6;
}

- (BOOL)shouldConcatenateTokensAtBoundaryError
{
  [(TIReporter *)self localeIdentifierForLanguage];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_31330;
  v6[3] = &unk_8D718;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = v7;
  id v3 = [&off_94500 indexesOfObjectsPassingTest:v6];
  BOOL v4 = [v3 count] == 0;

  return v4;
}

- (id)alignedTypingSequenceForResult:(id)a3 keystrokeSegmentationMode:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [v6 intended];
  uint64_t v8 = TICharSequenceForTokenSequence(v7);

  id v9 = [v6 corrected];
  objc_super v10 = TICharSequenceForTokenSequence(v9);

  v11 = [(TIReporter *)self language];
  v12 = +[NSLocale localeWithLocaleIdentifier:v11];

  v121[0] = _NSConcreteStackBlock;
  v121[1] = 3221225472;
  v121[2] = sub_31C54;
  v121[3] = &unk_8D740;
  id v13 = v12;
  id v122 = v13;
  v14 = objc_retainBlock(v121);
  v15 = TIOptimalSequenceAlignment(v8, v10, v14);
  id v16 = [v6 intended];
  v86 = [v6 corrected];
  TITokenAlignmentForKeyAlignment(v15, v8, v10, v16, v86);
  v92 = id v91 = v6;
  id v89 = v13;
  id v90 = v8;
  id v87 = v15;
  id v88 = v14;
  if (a4 == 2)
  {
    v84 = self;
    v85 = v10;
    v26 = +[NSMutableArray array];
    long long v117 = 0u;
    long long v118 = 0u;
    long long v119 = 0u;
    long long v120 = 0u;
    v27 = [v6 inserted];
    id v28 = [v27 countByEnumeratingWithState:&v117 objects:v127 count:16];
    if (v28)
    {
      id v29 = v28;
      uint64_t v30 = *(void *)v118;
      do
      {
        for (i = 0; i != v29; i = (char *)i + 1)
        {
          if (*(void *)v118 != v30) {
            objc_enumerationMutation(v27);
          }
          [v26 addObjectsFromArray:*(void *)(*((void *)&v117 + 1) + 8 * i)];
        }
        id v29 = [v27 countByEnumeratingWithState:&v117 objects:v127 count:16];
      }
      while (v29);
    }

    v32 = TICharSequenceForTokenSequence(v26);
    v33 = TIOptimalSequenceAlignment(v8, v32, v14);
    v81 = &v79;
    id v82 = v32;
    id v83 = v33;
    v100 = &v79 - 2 * (void)[v16 count] - 2;
    TITargetKeyRangesForSourceTokens(v33, v8, v82, v16, v82, (uint64_t)v100);
    v34 = +[NSMutableArray array];
    long long v113 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    long long v116 = 0u;
    v35 = [v6 touched];
    id v36 = [v35 countByEnumeratingWithState:&v113 objects:v126 count:16];
    if (v36)
    {
      id v37 = v36;
      uint64_t v38 = *(void *)v114;
      do
      {
        for (j = 0; j != v37; j = (char *)j + 1)
        {
          if (*(void *)v114 != v38) {
            objc_enumerationMutation(v35);
          }
          [v34 addObjectsFromArray:*(void *)(*((void *)&v113 + 1) + 8 * (void)j)];
        }
        id v37 = [v35 countByEnumeratingWithState:&v113 objects:v126 count:16];
      }
      while (v37);
    }

    v40 = +[NSMutableArray array];
    long long v109 = 0u;
    long long v110 = 0u;
    long long v111 = 0u;
    long long v112 = 0u;
    v41 = [v6 predicted];
    id v42 = [v41 countByEnumeratingWithState:&v109 objects:v125 count:16];
    if (v42)
    {
      id v43 = v42;
      uint64_t v44 = *(void *)v110;
      do
      {
        for (k = 0; k != v43; k = (char *)k + 1)
        {
          if (*(void *)v110 != v44) {
            objc_enumerationMutation(v41);
          }
          [v40 addObjectsFromArray:*(void *)(*((void *)&v109 + 1) + 8 * (void)k)];
        }
        id v43 = [v41 countByEnumeratingWithState:&v109 objects:v125 count:16];
      }
      while (v43);
    }
    id v93 = v16;

    v46 = +[NSMutableArray array];
    long long v105 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    long long v108 = 0u;
    v47 = [v6 inlineCompletions];
    id v48 = [v47 countByEnumeratingWithState:&v105 objects:v124 count:16];
    if (v48)
    {
      id v49 = v48;
      uint64_t v50 = *(void *)v106;
      do
      {
        for (m = 0; m != v49; m = (char *)m + 1)
        {
          if (*(void *)v106 != v50) {
            objc_enumerationMutation(v47);
          }
          [v46 addObjectsFromArray:*(void *)(*((void *)&v105 + 1) + 8 * (void)m)];
        }
        id v49 = [v47 countByEnumeratingWithState:&v105 objects:v124 count:16];
      }
      while (v49);
    }

    v52 = +[NSMutableArray array];
    long long v101 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    long long v104 = 0u;
    v53 = [v91 documentStates];
    id v54 = [v53 countByEnumeratingWithState:&v101 objects:v123 count:16];
    if (v54)
    {
      id v55 = v54;
      uint64_t v56 = *(void *)v102;
      do
      {
        for (n = 0; n != v55; n = (char *)n + 1)
        {
          if (*(void *)v102 != v56) {
            objc_enumerationMutation(v53);
          }
          [v52 addObjectsFromArray:*(void *)(*((void *)&v101 + 1) + 8 * (void)n)];
        }
        id v55 = [v53 countByEnumeratingWithState:&v101 objects:v123 count:16];
      }
      while (v55);
    }

    id v99 = +[NSMutableArray array];
    id v98 = +[NSMutableArray array];
    id v97 = +[NSMutableArray array];
    id v96 = +[NSMutableArray array];
    id v95 = +[NSMutableArray array];
    id v16 = v93;
    if ([v93 count])
    {
      unint64_t v58 = 0;
      v59 = (uint64_t **)(v100 + 1);
      do
      {
        uint64_t v60 = (uint64_t)*(v59 - 1);
        if (v60 == 0x7FFFFFFFFFFFFFFFLL)
        {
          [v99 addObject:&__NSArray0__struct];
          [v98 addObject:&__NSArray0__struct];
          [v97 addObject:&__NSArray0__struct];
          [v95 addObject:&__NSArray0__struct];
          [v96 addObject:&__NSArray0__struct];
        }
        else
        {
          v100 = *v59;
          v61 = [v26 subarrayWithRange:v60];
          [v99 addObject:v61];

          v62 = objc_msgSend(v34, "subarrayWithRange:", v60, v100);
          [v98 addObject:v62];

          id v94 = (id)v58;
          v63 = v100;
          v64 = objc_msgSend(v40, "subarrayWithRange:", v60, v100);
          [v97 addObject:v64];

          v65 = objc_msgSend(v46, "subarrayWithRange:", v60, v63);
          [v96 addObject:v65];

          v66 = v63;
          id v16 = v93;
          unint64_t v58 = (unint64_t)v94;
          v67 = objc_msgSend(v52, "subarrayWithRange:", v60, v66);
          [v95 addObject:v67];
        }
        ++v58;
        v59 += 2;
      }
      while (v58 < (unint64_t)[v16 count]);
    }
    v100 = (uint64_t *)[v99 copy];
    id v94 = [v98 copy];
    id v93 = [v97 copy];
    id v68 = v96;
    id v80 = [v96 copy];
    id v69 = v95;
    id v25 = [v95 copy];

    v70 = v82;
    v17 = v100;

    v22 = v80;
    id v23 = v93;
    v24 = v94;
    self = v84;
    objc_super v10 = v85;
  }
  else if (a4 == 1)
  {
    v17 = [v6 inserted];
    uint64_t v18 = [v6 touched];
    uint64_t v19 = [v6 predicted];
    uint64_t v20 = [v6 inlineCompletions];
    uint64_t v21 = [v6 documentStates];
    v22 = (void *)v20;
    id v23 = (id)v19;
    v24 = (void *)v18;
    id v25 = (id)v21;
  }
  else
  {
    id v25 = &__NSArray0__struct;
    v22 = &__NSArray0__struct;
    id v23 = &__NSArray0__struct;
    v24 = &__NSArray0__struct;
    v17 = &__NSArray0__struct;
  }
  v71 = v17;
  v72 = v24;
  v73 = v23;
  v74 = v22;
  v75 = TIAlignedTypingSequenceForAlignedTokenSequence(v92, v17, v24, v23, v22, v25);
  if (v75 && [(TIReporter *)self shouldConcatenateTokensAtBoundaryError])
  {
    TIConcatenateAlignedTypingAtBoundaryErrors(v75);
    v77 = id v76 = v16;

    v75 = (void *)v77;
    id v16 = v76;
  }

  return v75;
}

- (id)alignedTypingSequenceForTransliteratedResult:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[NSMutableArray array];
  unsigned int v5 = [v3 intended];
  id v6 = [v5 count];

  if (v6)
  {
    unint64_t v7 = 0;
    do
    {
      uint64_t v8 = objc_alloc_init(TIAlignedTyping);
      id v9 = [v3 intendedTransliteration];
      objc_super v10 = [v9 objectAtIndex:v7];
      [(TIAlignedTokens *)v8 setSource:v10];

      v11 = [v3 intended];
      v12 = [v11 objectAtIndex:v7];
      [(TIAlignedTokens *)v8 setSourceTransliteration:v12];

      id v13 = [v3 touched];
      v14 = [v13 objectAtIndex:v7];
      [(TIAlignedTyping *)v8 setTouched:v14];

      v15 = [v3 inserted];
      id v16 = [v15 objectAtIndex:v7];
      [(TIAlignedTyping *)v8 setInserted:v16];

      v17 = [v3 corrected];
      uint64_t v18 = [v17 objectAtIndex:v7];
      [(TIAlignedTokens *)v8 setTarget:v18];

      uint64_t v19 = [v3 predicted];
      uint64_t v20 = [v19 objectAtIndex:v7];
      [(TIAlignedTyping *)v8 setPredicted:v20];

      uint64_t v21 = [v3 inlineCompletions];
      v22 = [v21 objectAtIndex:v7];
      [(TIAlignedTyping *)v8 setInlineCompletions:v22];

      id v23 = +[NSNumber numberWithInteger:v7];
      v24 = [v3 pathsForWords];
      id v25 = [v24 objectForKey:v23];

      if (v25)
      {
        v26 = [v3 pathsForWords];
        v27 = [v26 objectForKeyedSubscript:v23];

        [(TIAlignedTyping *)v8 setPath:v27];
      }
      [v4 addObject:v8];

      ++v7;
      id v28 = [v3 intended];
      id v29 = [v28 count];
    }
    while (v7 < (unint64_t)v29);
  }

  return v4;
}

- (id)reportForTrial:(unint64_t)a3
{
  unsigned int v5 = [(TIReporter *)self resultLoggers];
  id v6 = [v5 objectAtIndex:a3];

  unint64_t v7 = [v6 allResults];
  uint64_t v8 = [(TIReporter *)self reportForAutocorrectionResults:v7];
  CFStringRef v12 = @"TrialIndex";
  id v9 = +[NSNumber numberWithUnsignedInteger:a3];
  id v13 = v9;
  objc_super v10 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  [v8 addEntriesFromDictionary:v10];

  return v8;
}

- (id)reportForAutocorrectionResults:(id)a3
{
  id v203 = a3;
  v195 = +[NSMutableDictionary dictionary];
  v254 = objc_opt_new();
  v201 = +[NSMutableArray array];
  BOOL v4 = [(TIReporter *)self options];
  unsigned int v5 = [v4 objectForKey:@"MAX_PREDICTIONS_REPORTED"];
  id v6 = v5;
  if (!v5) {
    unsigned int v5 = @"0";
  }
  signed int v200 = [(__CFString *)v5 intValue];

  unint64_t v7 = [(TIReporter *)self options];
  uint64_t v8 = [v7 objectForKey:@"MAX_INLINE_COMPLETIONS_REPORTED"];
  id v9 = v8;
  if (!v8) {
    uint64_t v8 = @"0";
  }
  signed int v199 = [(__CFString *)v8 intValue];

  objc_super v10 = [(TIReporter *)self options];
  v11 = [v10 objectForKey:@"REPORT_AGGD_STATISTICS"];
  CFStringRef v12 = v11;
  if (!v11) {
    v11 = @"0";
  }
  unsigned int v198 = [(__CFString *)v11 BOOLValue];

  id v13 = [(TIReporter *)self options];
  v14 = [v13 objectForKey:@"LOG_DOCUMENT_CONTEXT"];
  v15 = v14;
  if (!v14) {
    v14 = &__kCFBooleanFalse;
  }
  char v197 = [v14 BOOLValue];

  id v16 = [(TIReporter *)self options];
  v17 = [v16 objectForKey:@"PREFERS_TRANSLITERATION"];
  uint64_t v18 = v17;
  if (!v17) {
    v17 = @"0";
  }
  self->_isTransliterating = [(__CFString *)v17 BOOLValue];

  uint64_t v19 = [(TIReporter *)self options];
  uint64_t v20 = [v19 objectForKey:@"KEYSTROKE_SEGMENTATION_MODE"];

  if (v20)
  {
    uint64_t v21 = self;
    v22 = [(TIReporter *)self options];
    id v23 = [v22 objectForKey:@"KEYSTROKE_SEGMENTATION_MODE"];

    v24 = [v23 lowercaseString];
    id v25 = +[NSCharacterSet whitespaceCharacterSet];
    v26 = [v24 stringByTrimmingCharactersInSet:v25];

    if ([v26 isEqualToString:@"none"])
    {
      uint64_t v196 = 0;
    }
    else
    {
      if ([v26 isEqualToString:@"typinglog"])
      {
        uint64_t v27 = 1;
      }
      else
      {
        unsigned int v28 = [v26 isEqualToString:@"alignment"];
        uint64_t v27 = 1;
        if (v28) {
          uint64_t v27 = 2;
        }
      }
      uint64_t v196 = v27;
    }
    self = v21;
  }
  else
  {
    uint64_t v196 = 1;
  }
  id v29 = (char *)[v203 count];
  uint64_t v30 = v29;
  if (!v29)
  {
    fputc(10, __stderrp);
    uint64_t v216 = 0;
    uint64_t v217 = 0;
    uint64_t v215 = 0;
    uint64_t v31 = 0;
    uint64_t v160 = 0;
    uint64_t v161 = 0;
    v162 = 0;
    uint64_t v245 = 0;
    uint64_t v240 = 0;
    uint64_t v163 = 0;
    float v164 = 1.0;
    float v165 = 0.0;
    float v157 = 1.0;
    float v159 = 0.0;
    float v166 = 0.0;
    float v167 = 0.0;
    goto LABEL_154;
  }
  v231 = 0;
  uint64_t v259 = 0;
  uint64_t v264 = 0;
  uint64_t v240 = 0;
  uint64_t v245 = 0;
  uint64_t v228 = 0;
  uint64_t v229 = 0;
  uint64_t v31 = 0;
  uint64_t v215 = 0;
  uint64_t v216 = 0;
  uint64_t v217 = 0;
  v32 = 0;
  v202 = v29;
  do
  {
    v227 = v32 + 1;
    fprintf(__stderrp, "Processing result %lu/%lu\r", v32 + 1, v30);
    v33 = [v203 objectAtIndexedSubscript:v32];
    v234 = [v33 intendedTransliteration];

    v34 = [v33 numberOfTouches];
    id v225 = [v34 integerValue];

    v35 = [(TIReporter *)self localeIdentifierForLanguage];
    if ([v35 isEqualToString:@"ko_KR"])
    {
      id v36 = [v33 intended];
      id v37 = [v36 componentsJoinedByString:&stru_8DEF0];
      id v38 = +[TITesterUtils decomposeHangulSequence:v37];
    }
    else
    {
      id v36 = [v33 intended];
      id v37 = [v36 componentsJoinedByString:&stru_8DEF0];
      id v38 = v37;
    }

    id v230 = v38;
    id v224 = [v38 length];
    v238 = +[NSString string];
    long long v305 = 0u;
    long long v306 = 0u;
    long long v307 = 0u;
    long long v308 = 0u;
    v232 = v33;
    v39 = [v33 inserted];
    id v40 = [v39 countByEnumeratingWithState:&v305 objects:v320 count:16];
    if (v40)
    {
      id v41 = v40;
      uint64_t v42 = *(void *)v306;
      do
      {
        id v43 = 0;
        uint64_t v44 = v238;
        do
        {
          if (*(void *)v306 != v42) {
            objc_enumerationMutation(v39);
          }
          v45 = [*(id *)(*((void *)&v305 + 1) + 8 * (void)v43) componentsJoinedByString:&stru_8DEF0];
          uint64_t v46 = [v44 stringByAppendingString:v45];

          id v43 = (char *)v43 + 1;
          uint64_t v44 = (void *)v46;
        }
        while (v41 != v43);
        v238 = (void *)v46;
        id v41 = [v39 countByEnumeratingWithState:&v305 objects:v320 count:16];
      }
      while (v41);
    }

    v47 = [v238 stringByReplacingOccurrencesOfString:@"\\b" withString:@"\b"];
    id v48 = [v47 stringByReplacingOccurrencesOfString:@"\\B" withString:@"\b"];
    id v223 = [v48 length];

    id v49 = [v232 intended];
    long long v301 = 0u;
    long long v302 = 0u;
    long long v303 = 0u;
    long long v304 = 0u;
    id obj = v49;
    id v50 = [obj countByEnumeratingWithState:&v301 objects:v319 count:16];
    if (!v50)
    {
      uint64_t v261 = 0;
      uint64_t v266 = 0;
      v52 = &CFAbsoluteTimeGetCurrent_ptr;
      goto LABEL_47;
    }
    id v51 = v50;
    uint64_t v261 = 0;
    uint64_t v266 = 0;
    id v269 = *(id *)v302;
    v52 = &CFAbsoluteTimeGetCurrent_ptr;
    do
    {
      for (i = 0; i != v51; i = (char *)i + 1)
      {
        if (*(id *)v302 != v269) {
          objc_enumerationMutation(obj);
        }
        id v54 = *(void **)(*((void *)&v301 + 1) + 8 * i);
        id v55 = [v52[278] whitespaceAndNewlineCharacterSet];
        uint64_t v56 = [v54 stringByTrimmingCharactersInSet:v55];
        if ([v56 length])
        {
          v57 = [v52[278] punctuationCharacterSet];
          unint64_t v58 = [v54 stringByTrimmingCharactersInSet:v57];
          id v59 = [v58 length];

          if (v59)
          {
            ++v259;
            ++v261;
            goto LABEL_43;
          }
        }
        else
        {
        }
        v264 += (uint64_t)[v54 length];
        v266 += (uint64_t)[v54 length];
LABEL_43:
        v52 = &CFAbsoluteTimeGetCurrent_ptr;
      }
      id v51 = [obj countByEnumeratingWithState:&v301 objects:v319 count:16];
    }
    while (v51);
LABEL_47:

    if (v234) {
      [(TIReporter *)self alignedTypingSequenceForTransliteratedResult:v232];
    }
    else {
      [(TIReporter *)self alignedTypingSequenceForResult:v232 keystrokeSegmentationMode:v196];
    }
    v61 = v230;
    uint64_t v60 = v231;
    id v62 = (id)objc_claimAutoreleasedReturnValue();

    if (!v62) {
      goto LABEL_134;
    }
    long long v299 = 0u;
    long long v300 = 0u;
    long long v297 = 0u;
    long long v298 = 0u;
    id v214 = v62;
    id v249 = v62;
    id v63 = [v249 countByEnumeratingWithState:&v297 objects:v318 count:16];
    if (!v63)
    {
      uint64_t v242 = 0;
      uint64_t v246 = 0;
      goto LABEL_68;
    }
    id v64 = v63;
    uint64_t v242 = 0;
    uint64_t v246 = 0;
    uint64_t v65 = *(void *)v298;
    uint64_t v256 = *(void *)v298;
    while (2)
    {
      uint64_t v66 = 0;
      id v270 = v64;
      while (2)
      {
        if (*(void *)v298 != v65) {
          objc_enumerationMutation(v249);
        }
        v67 = *(void **)(*((void *)&v297 + 1) + 8 * v66);
        id v68 = [v67 source];
        id v69 = [v67 target];
        if ([v68 length] && objc_msgSend(v69, "isEqualToString:", v68))
        {
          v70 = [v52[278] whitespaceAndNewlineCharacterSet];
          v71 = [v68 stringByTrimmingCharactersInSet:v70];
          if ([v71 length])
          {
            v72 = [v52[278] punctuationCharacterSet];
            v73 = [v68 stringByTrimmingCharactersInSet:v72];
            id v74 = [v73 length];

            v52 = &CFAbsoluteTimeGetCurrent_ptr;
            if (v74)
            {
              ++v240;
              ++v242;
              goto LABEL_63;
            }
          }
          else
          {
          }
          v245 += (uint64_t)[v68 length];
          v246 += (uint64_t)[v68 length];
LABEL_63:
          uint64_t v65 = v256;
          id v64 = v270;
        }

        if (v64 != (id)++v66) {
          continue;
        }
        break;
      }
      id v64 = [v249 countByEnumeratingWithState:&v297 objects:v318 count:16];
      if (v64) {
        continue;
      }
      break;
    }
LABEL_68:

    v75 = [(TIReporter *)self localeIdentifierForLanguage];
    if ([v75 isEqualToString:@"ko_KR"])
    {
      id v76 = [v232 intended];
      id v77 = [v76 componentsJoinedByString:&stru_8DEF0];
      id v78 = +[TITesterUtils decomposeHangulSequence:v77];
    }
    else
    {
      id v76 = [v232 intended];
      id v77 = [v76 componentsJoinedByString:&stru_8DEF0];
      id v78 = v77;
    }

    id v212 = [v78 length];
    uint64_t v79 = [v78 stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"];

    if (v234)
    {
      id v80 = v79;
      v81 = v232;
      id v82 = [v232 intendedTransliteration];
      [v82 componentsJoinedByString:&stru_8DEF0];
      v222 = v221 = v80;
    }
    else
    {
      v221 = &stru_8DEF0;
      v222 = v79;
      v81 = v232;
    }
    id v83 = [v81 input];
    v84 = [v83 componentsJoinedByString:&stru_8DEF0];

    v220 = [v84 stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"];

    v257 = +[NSMutableString string];
    long long v293 = 0u;
    long long v294 = 0u;
    long long v295 = 0u;
    long long v296 = 0u;
    id v271 = [v81 touched];
    id v85 = [v271 countByEnumeratingWithState:&v293 objects:v317 count:16];
    if (v85)
    {
      id v86 = v85;
      uint64_t v87 = 0;
      uint64_t v88 = *(void *)v294;
      do
      {
        for (j = 0; j != v86; j = (char *)j + 1)
        {
          if (*(void *)v294 != v88) {
            objc_enumerationMutation(v271);
          }
          id v90 = *(void **)(*((void *)&v293 + 1) + 8 * (void)j);
          id v91 = [v90 componentsJoinedByString:&stru_8DEF0];
          [v257 appendString:v91];

          long long v291 = 0u;
          long long v292 = 0u;
          long long v289 = 0u;
          long long v290 = 0u;
          id v92 = v90;
          id v93 = [v92 countByEnumeratingWithState:&v289 objects:v316 count:16];
          if (v93)
          {
            id v94 = v93;
            uint64_t v95 = *(void *)v290;
            do
            {
              for (k = 0; k != v94; k = (char *)k + 1)
              {
                if (*(void *)v290 != v95) {
                  objc_enumerationMutation(v92);
                }
                unsigned int v97 = [*(id *)(*((void *)&v289 + 1) + 8 * (void)k) isEqualToString:@"<Delete>"];
                v87 += v97;
                v31 += v97;
              }
              id v94 = [v92 countByEnumeratingWithState:&v289 objects:v316 count:16];
            }
            while (v94);
          }
        }
        id v86 = [v271 countByEnumeratingWithState:&v293 objects:v317 count:16];
      }
      while (v86);
    }
    else
    {
      uint64_t v87 = 0;
    }

    v219 = [v257 stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"];
    id v272 = +[NSMutableString string];
    id v98 = v232;
    id v99 = [v232 touchEvents];
    id v100 = [v99 count];

    if (v100)
    {
      unint64_t v101 = 0;
      do
      {
        long long v102 = [v98 touchEvents];
        long long v103 = [v102 objectAtIndexedSubscript:v101];

        long long v104 = +[NSNumber numberWithInt:v101];
        long long v105 = [v98 pathsForWords];
        long long v106 = [v105 objectForKey:v104];

        v235 = v103;
        if (v106)
        {
          long long v107 = [v98 pathsForWords];
          id v108 = [v107 objectForKeyedSubscript:v104];

          long long v109 = [v108 toJsonDictionary];
          [v272 appendFormat:@"<CP; %@ >", v109];
        }
        else
        {
          long long v287 = 0u;
          long long v288 = 0u;
          long long v285 = 0u;
          long long v286 = 0u;
          id v108 = v103;
          id v110 = [v108 countByEnumeratingWithState:&v285 objects:v315 count:16];
          if (v110)
          {
            id v111 = v110;
            uint64_t v112 = *(void *)v286;
            do
            {
              for (m = 0; m != v111; m = (char *)m + 1)
              {
                if (*(void *)v286 != v112) {
                  objc_enumerationMutation(v108);
                }
                long long v114 = [*(id *)(*((void *)&v285 + 1) + 8 * (void)m) shortDescription];
                [v272 appendString:v114];
              }
              id v111 = [v108 countByEnumeratingWithState:&v285 objects:v315 count:16];
            }
            while (v111);
            id v98 = v232;
          }
        }

        ++v101;
        long long v115 = [v98 touchEvents];
        id v116 = [v115 count];
      }
      while ((unint64_t)v116 > v101);
    }
    long long v117 = +[NSString string];
    long long v281 = 0u;
    long long v282 = 0u;
    long long v283 = 0u;
    long long v284 = 0u;
    long long v118 = [v98 inserted];
    id v119 = [v118 countByEnumeratingWithState:&v281 objects:v314 count:16];
    if (v119)
    {
      id v120 = v119;
      uint64_t v121 = *(void *)v282;
      do
      {
        id v122 = 0;
        v123 = v117;
        do
        {
          if (*(void *)v282 != v121) {
            objc_enumerationMutation(v118);
          }
          v124 = [*(id *)(*((void *)&v281 + 1) + 8 * (void)v122) componentsJoinedByString:&stru_8DEF0];
          long long v117 = [v123 stringByAppendingString:v124];

          id v122 = (char *)v122 + 1;
          v123 = v117;
        }
        while (v120 != v122);
        id v120 = [v118 countByEnumeratingWithState:&v281 objects:v314 count:16];
      }
      while (v120);
    }

    v125 = [v117 stringByReplacingOccurrencesOfString:@"\\b" withString:@"\b"];
    v126 = [v125 stringByReplacingOccurrencesOfString:@"\\B" withString:@"\b"];
    id v127 = [v126 length];

    v236 = [v117 stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"];

    v128 = [v232 corrected];
    v129 = [v128 componentsJoinedByString:&stru_8DEF0];

    v218 = [v129 stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"];

    v130 = TIPlistFormattedAlignedTypingSequence(v249, v200 > 0, v197, v199 > 0);
    long long v277 = 0u;
    long long v278 = 0u;
    long long v279 = 0u;
    long long v280 = 0u;
    id v250 = v130;
    id v131 = [v250 countByEnumeratingWithState:&v277 objects:v313 count:16];
    id v210 = v127;
    if (v131)
    {
      id v132 = v131;
      uint64_t v133 = 0;
      uint64_t v134 = 0;
      uint64_t v135 = 0;
      uint64_t v136 = *(void *)v278;
      do
      {
        for (n = 0; n != v132; n = (char *)n + 1)
        {
          if (*(void *)v278 != v136) {
            objc_enumerationMutation(v250);
          }
          v138 = [*(id *)(*((void *)&v277 + 1) + 8 * (void)n) objectForKeyedSubscript:@"autocorrectionType"];
          v133 += TIAutoCorrectionTypeCorrectedIsNotIntended(v138);
          v134 += TIAutoCorrectionTypeCorrectedIsNotIntendedAndInserted(v138);
          v135 += TIAutoCorrectionTypeCorrectedIsNotInserted(v138);
          [v254 addObject:v138];
        }
        id v132 = [v250 countByEnumeratingWithState:&v277 objects:v313 count:16];
      }
      while (v132);
    }
    else
    {
      uint64_t v133 = 0;
      uint64_t v134 = 0;
      uint64_t v135 = 0;
    }

    v311[0] = @"Seed";
    v209 = [v232 seed];
    v312[0] = v209;
    v311[1] = @"CorpusId";
    uint64_t v139 = [v232 corpusId];
    v208 = (void *)v139;
    if (v139) {
      CFStringRef v140 = (const __CFString *)v139;
    }
    else {
      CFStringRef v140 = &stru_8DEF0;
    }
    v312[1] = v140;
    v311[2] = @"Metadata";
    uint64_t v141 = [v232 sourceMetadata];
    v207 = (void *)v141;
    v142 = &__NSDictionary0__struct;
    if (v141) {
      v142 = (void *)v141;
    }
    v312[2] = v142;
    v312[3] = v222;
    v311[3] = @"Intended";
    v311[4] = @"Input";
    v312[4] = v220;
    v312[5] = v219;
    v311[5] = @"Touched";
    v311[6] = @"TouchPoints";
    v312[6] = v272;
    v312[7] = v236;
    v311[7] = @"Inserted";
    v311[8] = @"Corrected";
    v312[8] = v218;
    v312[9] = v221;
    v311[9] = @"IntendedTransliteration";
    v311[10] = @"WordCount";
    v206 = +[NSNumber numberWithInteger:v261];
    v312[10] = v206;
    v311[11] = @"WordErrorCount";
    v262 = +[NSNumber numberWithInteger:v261 - v242];
    v312[11] = v262;
    v311[12] = @"SeparatorCount";
    v243 = +[NSNumber numberWithInteger:v266];
    v312[12] = v243;
    v311[13] = @"SeparatorErrorCount";
    v267 = +[NSNumber numberWithUnsignedInteger:v266 - v246];
    v312[13] = v267;
    v311[14] = @"KeystrokeCount";
    v247 = [v232 numberOfTouches];
    v312[14] = v247;
    v311[15] = @"CharacterCount";
    v213 = +[NSNumber numberWithUnsignedInteger:v212];
    v312[15] = v213;
    v311[16] = @"DeleteCount";
    v205 = +[NSNumber numberWithInteger:v87];
    v312[16] = v205;
    v311[17] = @"InsertedCharacterCount";
    v211 = +[NSNumber numberWithUnsignedInteger:v210];
    v312[17] = v211;
    v312[18] = v250;
    v311[18] = @"Alignment";
    v311[19] = @"incorrectCount";
    v204 = +[NSNumber numberWithInteger:v133];
    v312[19] = v204;
    v311[20] = @"badAutocorrectionCount";
    v143 = +[NSNumber numberWithInteger:v134];
    v312[20] = v143;
    v311[21] = @"autocorrectionCount";
    v144 = +[NSNumber numberWithInteger:v135];
    v312[21] = v144;
    v145 = +[NSDictionary dictionaryWithObjects:v312 forKeys:v311 count:22];
    v146 = +[NSMutableDictionary dictionaryWithDictionary:v145];

    v147 = [v232 debugData];

    if (v147)
    {
      v148 = [v232 debugData];
      [v146 setObject:v148 forKey:@"DebugData"];
    }
    if (v198)
    {
      v149 = [v232 aggdStatistics];

      if (v149)
      {
        v150 = [v232 aggdStatistics];
        [v146 setObject:v150 forKey:@"AggdStatistics"];
      }
    }
    v151 = [v232 typologyLogURL];

    if (v151)
    {
      v152 = [v232 typologyLogURL];
      v153 = [v152 path];
      [v146 setObject:v153 forKey:@"typologyLogPath"];
    }
    v154 = [v232 typologyTraceLogURL];

    if (v154)
    {
      v155 = [v232 typologyTraceLogURL];
      v156 = [v155 path];
      [v146 setObject:v156 forKey:@"typologyTraceLogPath"];
    }
    v215 += v133;
    v216 += v134;
    v217 += v135;
    [v201 addObject:v146];

    v61 = v230;
    uint64_t v60 = v231;
    id v62 = v214;
LABEL_134:
    v231 = &v60[(void)v225];
    v228 += (uint64_t)v224;
    v229 += (uint64_t)v223;

    v32 = v227;
    uint64_t v30 = v202;
  }
  while (v227 != v202);
  fputc(10, __stderrp);
  float v157 = 1.0;
  uint64_t v30 = (char *)v264;
  if (v228 > v264)
  {
    float v157 = 0.0;
    if (v228 > v229) {
      float v157 = (float)(v228 - v229) / (float)(v228 - v264);
    }
  }
  float v158 = (float)v259;
  if (v259 < 1) {
    float v159 = 0.0;
  }
  else {
    float v159 = (float)v240 / v158;
  }
  if (v264 >= 1) {
    float v164 = (float)v245 / (float)v264;
  }
  else {
    float v164 = 1.0;
  }
  if (v228 < 1)
  {
    float v166 = 0.0;
    float v165 = 0.0;
    if (v259 >= 1) {
      goto LABEL_149;
    }
  }
  else
  {
    float v166 = (float)v31 / (float)v228;
    if (v259 <= 0)
    {
      float v165 = 0.0;
      goto LABEL_150;
    }
LABEL_149:
    float v165 = (float)v215 / v158;
  }
LABEL_150:
  if (v217 >= 1) {
    float v167 = (float)v216 / (float)v217;
  }
  else {
    float v167 = 0.0;
  }
  uint64_t v163 = v259;
  uint64_t v160 = v229;
  uint64_t v161 = v228;
  v162 = v231;
LABEL_154:
  v168 = +[NSMutableDictionary dictionary];
  v274[0] = _NSConcreteStackBlock;
  v274[1] = 3221225472;
  v274[2] = sub_33CE4;
  v274[3] = &unk_8D768;
  id v273 = v254;
  id v275 = v273;
  id v169 = v168;
  id v276 = v169;
  v237 = v169;
  [v273 enumerateObjectsUsingBlock:v274];
  v309[0] = @"Language";
  uint64_t v170 = [(TIReporter *)self language];
  v268 = (void *)v170;
  if (v170) {
    CFStringRef v171 = (const __CFString *)v170;
  }
  else {
    CFStringRef v171 = &stru_8DEF0;
  }
  v310[0] = v171;
  v309[1] = @"TextCorpus";
  uint64_t v172 = [(TIReporter *)self textCorpus];
  v265 = (void *)v172;
  if (v172) {
    CFStringRef v173 = (const __CFString *)v172;
  }
  else {
    CFStringRef v173 = &stru_8DEF0;
  }
  v310[1] = v173;
  v309[2] = @"BuildVersion";
  uint64_t v174 = [(TIReporter *)self buildVersion];
  v263 = (void *)v174;
  if (v174) {
    CFStringRef v175 = (const __CFString *)v174;
  }
  else {
    CFStringRef v175 = &stru_8DEF0;
  }
  v310[2] = v175;
  v309[3] = @"Options";
  uint64_t v176 = [(TIReporter *)self options];
  v260 = (void *)v176;
  v177 = &__NSDictionary0__struct;
  if (v176) {
    v177 = (void *)v176;
  }
  v310[3] = v177;
  v309[4] = @"KeystrokeCount";
  v258 = +[NSNumber numberWithInteger:v162];
  v310[4] = v258;
  v309[5] = @"CharacterCount";
  v255 = +[NSNumber numberWithInteger:v161];
  v310[5] = v255;
  v309[6] = @"DeleteCount";
  id obja = +[NSNumber numberWithInteger:v31];
  v310[6] = obja;
  v309[7] = @"DeleteRatio";
  *(float *)&double v178 = v166;
  id v251 = +[NSNumber numberWithFloat:v178];
  v310[7] = v251;
  v309[8] = @"InsertedCharacterCount";
  v248 = +[NSNumber numberWithInteger:v160];
  v310[8] = v248;
  v310[9] = v201;
  v309[9] = @"Results";
  v309[10] = @"KeystrokeSavingsRatio";
  *(float *)&double v179 = v157;
  v244 = +[NSNumber numberWithFloat:v179];
  v310[10] = v244;
  v309[11] = @"WordCount";
  v239 = +[NSNumber numberWithInteger:v163];
  v310[11] = v239;
  v309[12] = @"WordErrorCount";
  v241 = +[NSNumber numberWithInteger:v163 - v240];
  v310[12] = v241;
  v309[13] = @"WordAccuracy";
  *(float *)&double v180 = v159;
  v233 = +[NSNumber numberWithFloat:v180];
  v310[13] = v233;
  v309[14] = @"SeparatorCount";
  v181 = +[NSNumber numberWithInteger:v30];
  v310[14] = v181;
  v309[15] = @"SeparatorErrorCount";
  v182 = +[NSNumber numberWithInteger:&v30[-v245]];
  v310[15] = v182;
  v309[16] = @"SeparatorAccuracy";
  *(float *)&double v183 = v164;
  v184 = +[NSNumber numberWithFloat:v183];
  v310[16] = v184;
  v310[17] = @"1.14";
  v309[17] = @"ActVersion";
  v309[18] = @"TotalRevisionCount";
  v185 = +[NSNumber numberWithInteger:v215];
  v310[18] = v185;
  v309[19] = @"TotalRevisionRate";
  *(float *)&double v186 = v165;
  v187 = +[NSNumber numberWithFloat:v186];
  v310[19] = v187;
  v309[20] = @"TotalBadAutocorrectionCount";
  v188 = +[NSNumber numberWithInteger:v216];
  v310[20] = v188;
  v310[21] = v169;
  v309[21] = @"AutocorrectionTypeCounts";
  v309[22] = @"TotalAutocorrectionCount";
  v189 = +[NSNumber numberWithInteger:v217];
  v310[22] = v189;
  v309[23] = @"AutoCorrectionRevisionRate";
  *(float *)&double v190 = v167;
  v191 = +[NSNumber numberWithFloat:v190];
  v310[23] = v191;
  v192 = +[NSDictionary dictionaryWithObjects:v310 forKeys:v309 count:24];
  [v195 addEntriesFromDictionary:v192];

  id v193 = v195;
  return v193;
}

+ (id)fileURLForTrial:(unint64_t)a3 withOptions:(id)a4
{
  id v5 = a4;
  id v6 = [(id)objc_opt_class() languageForOptions:v5];
  unint64_t v7 = [(id)objc_opt_class() textCorpusForOptions:v5];
  uint64_t v8 = [v5 valueForKey:@"OUTPATH"];

  id v9 = @"./";
  if (v8) {
    id v9 = v8;
  }
  objc_super v10 = v9;

  v11 = +[NSString stringWithFormat:@"test-typer-%@-%@-trial%03lu.json", v6, v7, a3];
  CFStringRef v12 = [(__CFString *)v10 stringByAppendingPathComponent:v11];

  id v13 = +[NSURL fileURLWithPath:v12];

  return v13;
}

- (NSMutableArray)resultLoggers
{
  return self->_resultLoggers;
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_logSerializationQueue, 0);

  objc_storeStrong((id *)&self->_resultLoggers, 0);
}

@end