@interface TITypingDESPlugin
+ (id)stringForConfiderence:(int)a3;
- (id)evaluateRecipe:(id)a3 recordInfo:(id)a4 recordData:(id)a5 attachments:(id)a6 error:(id *)a7;
- (id)getAlignmentStats:(id)a3;
- (id)getTopStatisticsFromResults:(double)a3[4];
- (id)runExperimentCPEvalForSession:(id)a3 forRecipe:(id)a4;
- (id)summaryStatisticsEvalResults:(const void *)a3 ofEntries:(id)a4;
- (vector<TI::CP::ContinuousPathTestCase,)convertAlignedEntriesFromSession:(TITypingDESPlugin *)self;
- (void)cpEvalResult:(void *)a3 fromAlignedSession:(id)a4 forRecipe:(id)a5;
@end

@implementation TITypingDESPlugin

- (id)evaluateRecipe:(id)a3 recordInfo:(id)a4 recordData:(id)a5 attachments:(id)a6 error:(id *)a7
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a4;
  v13 = +[NSMutableDictionary dictionary];
  v14 = [v12 objectForKeyedSubscript:@"type"];

  LODWORD(v12) = [v14 isEqualToString:@"typingSession"];
  if (v12)
  {
    v15 = [v10 objectForKeyedSubscript:@"expName"];
    id v26 = 0;
    v16 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v11 error:&v26];
    id v17 = v26;
    if (v17)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v18 = [v17 description];
        *(_DWORD *)buf = 136315394;
        v28 = "-[TITypingDESPlugin evaluateRecipe:recordInfo:recordData:attachments:error:]";
        __int16 v29 = 2112;
        v30 = v18;
        _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s  Couldn't decode dodML typing session record: %@", buf, 0x16u);
      }
      v19 = [v17 description];
      CFStringRef v20 = @"error";
      v21 = v13;
      v22 = v19;
    }
    else
    {
      if (!v15) {
        goto LABEL_7;
      }
      if ([(__CFString *)v15 isEqualToString:@"alignmentStats"])
      {
        v24 = [(TITypingDESPlugin *)self getAlignmentStats:v16];
        [v13 setObject:v24 forKeyedSubscript:v15];

        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v28 = "-[TITypingDESPlugin evaluateRecipe:recordInfo:recordData:attachments:error:]";
          __int16 v29 = 2112;
          v30 = v13;
          _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s  result: %@", buf, 0x16u);
        }
        goto LABEL_7;
      }
      uint64_t v25 = [(TITypingDESPlugin *)self runExperimentCPEvalForSession:v16 forRecipe:v10];
      v19 = (void *)v25;
      if (v25) {
        v22 = (void *)v25;
      }
      else {
        v22 = &__NSDictionary0__struct;
      }
      v21 = v13;
      CFStringRef v20 = v15;
    }
    [v21 setObject:v22 forKeyedSubscript:v20];

LABEL_7:
  }

  return v13;
}

- (id)getAlignmentStats:(id)a3
{
  id v3 = a3;
  v4 = +[NSMutableDictionary dictionary];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v25 = v3;
  v5 = [v3 alignedEntries];
  id v6 = [v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v27;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend((id)objc_opt_class(), "stringForConfiderence:", objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * i), "inSessionAlignmentConfidence"));
        id v11 = [v4 objectForKeyedSubscript:v10];

        if (v11)
        {
          id v12 = [v4 objectForKeyedSubscript:v10];
          id v11 = (char *)[v12 integerValue];
        }
        v13 = +[NSNumber numberWithUnsignedInteger:v11 + 1];
        [v4 setObject:v13 forKeyedSubscript:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v7);
  }

  v14 = [v25 alignedEntries];
  id v15 = [v14 count];

  if (v15)
  {
    v16 = [v25 highConfAlignedSubSegment];
    id v17 = [v16 componentsSeparatedByString:@" "];
    float v18 = (float)(unint64_t)[v17 count];
    v19 = [v25 alignedEntries];
    float v20 = v18 / (float)(unint64_t)[v19 count];
  }
  else
  {
    float v20 = 0.0;
  }
  v21 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v25 success]);
  [v4 setObject:v21 forKeyedSubscript:@"successEntireSession"];

  *(float *)&double v22 = v20;
  v23 = +[NSNumber numberWithFloat:v22];
  [v4 setObject:v23 forKeyedSubscript:@"ratioContiguousHighConfAlignment"];

  return v4;
}

- (id)runExperimentCPEvalForSession:(id)a3 forRecipe:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v6 objectForKeyedSubscript:@"expName"];
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  unsigned int v17 = -1;
  [(TITypingDESPlugin *)self cpEvalResult:&v14 fromAlignedSession:v7 forRecipe:v6];

  v9 = [v7 alignedEntries];

  id v10 = [(TITypingDESPlugin *)self summaryStatisticsEvalResults:&v14 ofEntries:v9];

  id v11 = +[NSNumber numberWithInt:v17];
  [v10 setObject:v11 forKeyedSubscript:@"db_records_size"];

  [v10 setObject:v8 forKeyedSubscript:@"algorithm"];
  id v12 = +[NSNumber numberWithUnsignedLong:0x34F72C234F72C235 * ((v15 - v14) >> 3)];
  [v10 setObject:v12 forKeyedSubscript:@"num_evaluated_entries"];

  float v18 = (void **)&v14;
  sub_8608(&v18);

  return v10;
}

- (void)cpEvalResult:(void *)a3 fromAlignedSession:(id)a4 forRecipe:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [v9 objectForKeyedSubscript:@"expName"];
  id v11 = [v9 objectForKeyedSubscript:@"sources"];
  int v30 = 4;
  uint64_t v32 = 0;
  long long v31 = xmmword_ED70;
  long long v33 = xmmword_ED88;
  uint64_t v34 = 0x3FF0000000000000;
  uint64_t v36 = 0;
  long long v35 = xmmword_EDA0;
  int v37 = 1056964608;
  uint64_t v38 = 0x200000001;
  char v39 = 1;
  unsigned int v40 = 3;
  long long v41 = 0u;
  long long v42 = 0u;
  memset(v43, 0, sizeof(v43));
  KB::String::String((KB::String *)v44);
  v44[8] = 1050253722;
  char v54 = 1;
  long long v45 = xmmword_ECF0;
  long long v46 = xmmword_ED00;
  long long v47 = xmmword_ED10;
  long long v48 = xmmword_ED20;
  uint64_t v49 = 0x4010000000000000;
  long long v50 = xmmword_ED30;
  long long v51 = xmmword_ED40;
  long long v52 = xmmword_ECE0;
  long long v53 = xmmword_ED50;
  uint64_t v55 = 0x404B30CB295E9E1BLL;
  uint64_t v56 = 0x4019D81D7DBF4880;
  sub_9AD8((uint64_t)v27);
  [(TITypingDESPlugin *)self convertAlignedEntriesFromSession:v8];
  if ([v10 isEqualToString:@"shapeMatching"])
  {
    int v28 = 1;
    int v12 = 2;
    goto LABEL_14;
  }
  v13 = [v8 locale];
  uint64_t v14 = [v13 localeIdentifier];
  TI::CP::CPEval::load_language_resources((TI::CP::CPEval *)v27, v14, 0, 0.4);

  if (![v10 isEqualToString:@"cp-ensemble"])
  {
    int v12 = [v10 isEqualToString:@"cp-ml"];
    goto LABEL_14;
  }
  if (!v11)
  {
    int v12 = 3;
    goto LABEL_14;
  }
  double v22 = v11;
  unsigned int v40 = [v11 integerValue];
  uint64_t v15 = [v9 objectForKeyedSubscript:@"sourceWeights"];
  if ((unint64_t)[v15 count] > 2)
  {
    int v16 = 3;
LABEL_11:
    uint64_t v17 = 0;
    uint64_t v18 = v16;
    do
    {
      v19 = [v15 objectAtIndexedSubscript:v17];
      [v19 floatValue];
      *((double *)&v31 + v17) = v20;

      ++v17;
    }
    while (v18 != v17);
    goto LABEL_13;
  }
  int v16 = [v15 count];
  if (v16 >= 1) {
    goto LABEL_11;
  }
LABEL_13:

  int v12 = 3;
  id v11 = v22;
LABEL_14:
  TI::CP::CPEval::evaluate_records(v27, v26, v12, (uint64_t)&v30, (uint64_t)&v23);
  sub_9C48((void **)a3);
  *(_OWORD *)a3 = v23;
  *((void *)a3 + 2) = v24;
  uint64_t v24 = 0;
  long long v23 = 0uLL;
  *((_DWORD *)a3 + 6) = v25;
  long long v29 = (void **)&v23;
  sub_8608(&v29);
  *(void *)&long long v23 = v26;
  sub_9CB0((void ***)&v23);
  sub_9D34((uint64_t)v27);
  KB::String::~String((KB::String *)v44);
  if ((v43[15] & 0x80000000) != 0) {
    operator delete(*((void **)&v42 + 1));
  }
  if (SBYTE7(v42) < 0) {
    operator delete((void *)v41);
  }
}

- (vector<TI::CP::ContinuousPathTestCase,)convertAlignedEntriesFromSession:(TITypingDESPlugin *)self
{
  id v5 = a4;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  retstr->var0 = 0;
  [v5 locale];
  id v7 = [(id)objc_claimAutoreleasedReturnValue() localeIdentifier];
  TI::CP::TestCaseConverter::create_testcase_converter(v7, 0);
}

- (id)summaryStatisticsEvalResults:(const void *)a3 ofEntries:(id)a4
{
  uint64_t v24 = self;
  id v5 = a4;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  int v25 = +[NSMutableDictionary dictionary];
  id v6 = *(unsigned int **)a3;
  id v7 = (unsigned int *)*((void *)a3 + 1);
  if (*(unsigned int **)a3 != v7)
  {
    while (1)
    {
      id v8 = objc_msgSend(v5, "objectAtIndexedSubscript:", *v6, v24);
      id v9 = v8;
      unsigned int v10 = v6[36];
      int v27 = 0;
      uint64_t v26 = 0;
      if ((v10 & 0x80000000) == 0) {
        break;
      }
LABEL_10:
      unsigned int v11 = [v8 inSessionAlignmentConfidence];
      int v12 = *((unsigned __int8 *)v6 + 220);
      if (v11 == 3)
      {
        for (uint64_t i = 0; i != 3; ++i)
        {
          while (1)
          {
            int v14 = *((_DWORD *)&v26 + i);
            *((double *)&v34 + i) = *((double *)&v34 + i) + (double)v14;
            if (!v12) {
              break;
            }
            *((double *)&v30 + i) = *((double *)&v30 + i) + (double)v14;
            if (++i == 3)
            {
              *((double *)&v35 + 1) = *((double *)&v35 + 1) + 1.0;
              int v12 = 1;
              uint64_t v15 = (double *)&v31 + 1;
              goto LABEL_17;
            }
          }
        }
        int v12 = 0;
        uint64_t v15 = (double *)&v35 + 1;
LABEL_17:
        double *v15 = *v15 + 1.0;
      }
      for (uint64_t j = 0; j != 3; ++j)
      {
        while (1)
        {
          int v17 = *((_DWORD *)&v26 + j);
          *((double *)&v32 + j) = *((double *)&v32 + j) + (double)v17;
          if (v12) {
            break;
          }
          if (++j == 3) {
            goto LABEL_23;
          }
        }
        *((double *)&v28 + j) = *((double *)&v28 + j) + (double)v17;
      }
      *((double *)&v29 + 1) = *((double *)&v29 + 1) + 1.0;
LABEL_23:
      *((double *)&v33 + 1) = *((double *)&v33 + 1) + 1.0;

      v6 += 58;
      if (v6 == v7) {
        goto LABEL_24;
      }
    }
    if (v10)
    {
      if (v10 > 3)
      {
        if (v10 > 0x27) {
          goto LABEL_10;
        }
        goto LABEL_9;
      }
    }
    else
    {
      LODWORD(v26) = 1;
    }
    HIDWORD(v26) = 1;
LABEL_9:
    int v27 = 1;
    goto LABEL_10;
  }
LABEL_24:
  uint64_t v18 = v24;
  v19 = -[TITypingDESPlugin getTopStatisticsFromResults:](v24, "getTopStatisticsFromResults:", &v32, v24);
  [v25 setObject:v19 forKeyedSubscript:@"entireSession"];

  float v20 = [(TITypingDESPlugin *)v18 getTopStatisticsFromResults:&v34];
  [v25 setObject:v20 forKeyedSubscript:@"highConfSession"];

  v21 = [(TITypingDESPlugin *)v18 getTopStatisticsFromResults:&v28];
  [v25 setObject:v21 forKeyedSubscript:@"inShapeDbEntireSession"];

  double v22 = [(TITypingDESPlugin *)v18 getTopStatisticsFromResults:&v30];
  [v25 setObject:v22 forKeyedSubscript:@"inShapeDBHighConfSession"];

  return v25;
}

- (id)getTopStatisticsFromResults:(double)a3[4]
{
  if (a3[3] > 0.0)
  {
    for (uint64_t i = 0; i != 3; ++i)
      a3[i] = a3[i] * 100.0 / a3[3];
  }
  v10[0] = @"top1";
  id v5 = +[NSNumber numberWithDouble:*a3];
  v11[0] = v5;
  v10[1] = @"top4";
  id v6 = +[NSNumber numberWithDouble:a3[1]];
  v11[1] = v6;
  v10[2] = @"top40";
  id v7 = +[NSNumber numberWithDouble:a3[2]];
  v11[2] = v7;
  id v8 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:3];

  return v8;
}

+ (id)stringForConfiderence:(int)a3
{
  if ((a3 - 1) > 2) {
    return @"AlignmentConfidenceUnknown";
  }
  else {
    return off_10638[a3 - 1];
  }
}

@end