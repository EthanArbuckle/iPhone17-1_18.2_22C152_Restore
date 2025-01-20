@interface PlaybackTest
+ (id)loadFromPlaybackFile:(id)a3;
+ (id)loadFromSentence:(id)a3 withCatenation:(BOOL)a4;
+ (id)loadFromTextInputFile:(id)a3 withCatenation:(BOOL)a4 addWordSpacing:(BOOL)a5;
+ (id)sentenceToTransliteratedPlaybackTest:(id)a3 withCatenation:(BOOL)a4 addWordSpacing:(BOOL)a5;
+ (id)testsWithIntendedOutput:(id)a3 expectedOutput:(id)a4;
+ (id)testsWithIntendedOutput:(id)a3 expectedOutput:(id)a4 corpusId:(id)a5;
- (id)expected;
- (id)intended;
@end

@implementation PlaybackTest

+ (id)testsWithIntendedOutput:(id)a3 expectedOutput:(id)a4 corpusId:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = objc_alloc_init(PlaybackTest);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_intended, a3);
    objc_storeStrong((id *)&v10->_expected, a4);
    uint64_t v11 = [v7 componentsJoinedByString:&stru_8DEF0];
    input = v10->super._input;
    v10->super._input = (NSString *)v11;
  }

  return v10;
}

+ (id)testsWithIntendedOutput:(id)a3 expectedOutput:(id)a4
{
  return _[a1 testsWithIntendedOutput:a3 expectedOutput:a4 corpusId:0];
}

+ (id)loadFromPlaybackFile:(id)a3
{
  id v3 = a3;
  v4 = +[TTKTestCaseReader loadFromPath:v3];
  if (v4)
  {
    id v24 = v3;
    id v27 = +[NSMutableArray array];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v23 = v4;
    id obj = v4;
    id v5 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v26 = *(void *)v33;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v33 != v26) {
            objc_enumerationMutation(obj);
          }
          id v8 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          v9 = +[NSMutableArray array];
          v10 = +[NSMutableArray array];
          long long v28 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          uint64_t v11 = [v8 records];
          id v12 = [v11 countByEnumeratingWithState:&v28 objects:v36 count:16];
          if (v12)
          {
            id v13 = v12;
            uint64_t v14 = *(void *)v29;
            do
            {
              for (j = 0; j != v13; j = (char *)j + 1)
              {
                if (*(void *)v29 != v14) {
                  objc_enumerationMutation(v11);
                }
                v16 = *(void **)(*((void *)&v28 + 1) + 8 * (void)j);
                v17 = [v16 inputText];
                [v9 addObject:v17];

                v18 = [v16 primaryIntendedText];
                [v10 addObject:v18];
              }
              id v13 = [v11 countByEnumeratingWithState:&v28 objects:v36 count:16];
            }
            while (v13);
          }

          id v19 = [v9 copy];
          id v20 = [v10 copy];
          v21 = +[PlaybackTest testsWithIntendedOutput:v19 expectedOutput:v20];

          [v27 addObject:v21];
        }
        id v6 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v6);
    }

    v4 = v23;
    id v3 = v24;
  }
  else
  {
    NSLog(@"Input path for playback not found: %@", v3);
    id v27 = 0;
  }

  return v27;
}

+ (id)sentenceToTransliteratedPlaybackTest:(id)a3 withCatenation:(BOOL)a4 addWordSpacing:(BOOL)a5
{
  BOOL v5 = a5;
  id v6 = a3;
  id v7 = [v6 componentsSeparatedByString:@"|"];
  id v8 = [v7 objectAtIndex:1];
  v9 = [v7 objectAtIndex:0];
  v10 = [v8 componentsSeparatedByString:@" "];
  uint64_t v11 = +[NSMutableArray arrayWithArray:v10];

  id v12 = [v9 componentsSeparatedByString:@" "];
  id v13 = +[NSMutableArray arrayWithArray:v12];

  [v11 removeObjectsInArray:&off_94518];
  [v13 removeObjectsInArray:&off_94530];
  if (v5)
  {
    uint64_t v14 = [v11 arrayInterspersingSpaceStringsBetweenObjects];
    id v15 = [v14 mutableCopy];

    v16 = [v13 arrayInterspersingSpaceStringsBetweenObjects];
    id v17 = [v16 mutableCopy];

    id v13 = v17;
    uint64_t v11 = v15;
  }
  id v18 = [v13 count];
  if (v18 == [v11 count])
  {
    v60 = v9;
    v55 = v8;
    v56 = v7;
    id v57 = v6;
    id v19 = [v11 objectAtIndex:0];
    uint64_t v20 = [v13 objectAtIndex:0];
    if ((unint64_t)[v11 count] >= 2 && objc_msgSend(v19, "length") == (char *)&def_3B118 + 1)
    {
      if ([v19 caseInsensitiveCompare:v20])
      {
        v21 = [v11 objectAtIndex:1];
        v22 = [v13 objectAtIndex:1];
        id v23 = [v21 caseInsensitiveCompare:v22];

        if (v23)
        {
          id v24 = +[NSMutableString stringWithString:v19];
          v25 = [v11 objectAtIndex:1];
          [v24 appendString:v25];

          uint64_t v26 = +[NSMutableString stringWithString:v20];
          id v27 = [v13 objectAtIndex:1];
          [v26 appendString:v27];

          [v11 replaceObjectAtIndex:0 withObject:v24];
          [v11 removeObjectAtIndex:1];
          [v13 replaceObjectAtIndex:0 withObject:v26];
          [v13 removeObjectAtIndex:1];
        }
      }
    }
    v58 = (void *)v20;
    v59 = v19;
    if ([v11 count])
    {
      unint64_t v28 = 0;
      long long v29 = &CFAbsoluteTimeGetCurrent_ptr;
      do
      {
        long long v30 = [v11 objectAtIndex:v28];
        long long v31 = [v13 objectAtIndex:v28];
        long long v32 = (char *)[v30 length] - 1;
        long long v33 = (char *)[v31 length];
        if ((uint64_t)v32 >= 1)
        {
          long long v34 = v33;
          long long v35 = [v29[278] punctuationCharacterSet];
          if (objc_msgSend(v35, "characterIsMember:", objc_msgSend(v30, "characterAtIndex:", v32)))
          {
            v36 = v34 - 1;
            v37 = [v29[278] punctuationCharacterSet];
            unsigned int v38 = objc_msgSend(v37, "characterIsMember:", objc_msgSend(v31, "characterAtIndex:", v36));

            if (!v38)
            {
              long long v29 = &CFAbsoluteTimeGetCurrent_ptr;
              goto LABEL_17;
            }
            long long v35 = [v30 substringToIndex:v32];
            v39 = [v30 substringFromIndex:v32];
            v40 = [v31 substringToIndex:v36];
            v41 = [v31 substringFromIndex:v36];
            [v11 replaceObjectAtIndex:v28 withObject:v39];
            [v11 insertObject:v35 atIndex:v28];
            [v13 replaceObjectAtIndex:v28 withObject:v41];
            [v13 insertObject:v40 atIndex:v28++];

            long long v29 = &CFAbsoluteTimeGetCurrent_ptr;
          }
        }
LABEL_17:

        ++v28;
      }
      while (v28 < (unint64_t)[v11 count]);
    }
    if (a4)
    {
      v42 = +[NSMutableArray array];
      v43 = +[NSMutableArray array];
      if ([v11 count])
      {
        unint64_t v44 = 0;
        BOOL v45 = 0;
        do
        {
          v46 = [v11 objectAtIndex:v44];
          v47 = [v13 objectAtIndex:v44];
          id v48 = [v46 caseInsensitiveCompare:v47];
          BOOL v49 = v48 != 0;
          if (v48)
          {
            if (v45)
            {
              v50 = [v42 lastObject];
              [v50 appendString:v46];

              v51 = [v43 lastObject];
              [v51 appendString:v47];
            }
            else
            {
              v52 = +[NSMutableString stringWithString:v46];
              [v42 addObject:v52];

              v51 = +[NSMutableString stringWithString:v47];
              [v43 addObject:v51];
            }
          }
          else
          {
            [v42 addObject:v46];
            [v43 addObject:v47];
          }

          ++v44;
          BOOL v45 = v49;
        }
        while (v44 < (unint64_t)[v11 count]);
      }

      id v13 = v43;
      uint64_t v11 = v42;
    }
    else
    {
      v43 = v13;
      v42 = v11;
    }
    id v7 = v56;
    id v6 = v57;
    id v8 = v55;
    v53 = +[PlaybackTest testsWithIntendedOutput:v43 expectedOutput:v42];

    v9 = v60;
  }
  else
  {
    NSLog(@"transliteration and native text differ - unable to align: %@", v6);
    v53 = 0;
  }

  return v53;
}

+ (id)loadFromSentence:(id)a3 withCatenation:(BOOL)a4
{
  v4 = +[PlaybackTest sentenceToTransliteratedPlaybackTest:a3 withCatenation:a4 addWordSpacing:0];
  if (v4)
  {
    BOOL v5 = +[NSArray arrayWithObject:v4];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

+ (id)loadFromTextInputFile:(id)a3 withCatenation:(BOOL)a4 addWordSpacing:(BOOL)a5
{
  id v15 = 0;
  id v7 = +[NSString stringWithContentsOfFile:a3 encoding:4 error:&v15];
  id v8 = v15;
  if (v7)
  {
    +[NSMutableArray array];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_3F200;
    v11[3] = &unk_8D7E0;
    BOOL v13 = a4;
    BOOL v14 = a5;
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    id v12 = v9;
    [v7 enumerateLinesUsingBlock:v11];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)intended
{
  return self->_intended;
}

- (id)expected
{
  return self->_expected;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expected, 0);

  objc_storeStrong((id *)&self->_intended, 0);
}

@end