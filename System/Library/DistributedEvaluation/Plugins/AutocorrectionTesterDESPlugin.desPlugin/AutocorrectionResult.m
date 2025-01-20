@interface AutocorrectionResult
+ (BOOL)supportsSecureCoding;
- (AutocorrectionResult)initWithCoder:(id)a3;
- (NSArray)corrected;
- (NSArray)documentStates;
- (NSArray)inlineCompletions;
- (NSArray)input;
- (NSArray)inserted;
- (NSArray)intended;
- (NSArray)intendedTransliteration;
- (NSArray)predicted;
- (NSArray)tags;
- (NSArray)touchEvents;
- (NSArray)touched;
- (NSDictionary)aggdStatistics;
- (NSDictionary)debugData;
- (NSDictionary)pathsForWords;
- (NSDictionary)sourceMetadata;
- (NSNumber)corpusId;
- (NSNumber)numberOfTouches;
- (NSNumber)rank;
- (NSString)context;
- (NSString)seed;
- (NSURL)typologyLogURL;
- (NSURL)typologyTraceLogURL;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)extractDataFromTypingLog:(id)a3;
- (void)setAggdStatistics:(id)a3;
- (void)setContext:(id)a3;
- (void)setCorpusId:(id)a3;
- (void)setCorrected:(id)a3;
- (void)setDebugData:(id)a3;
- (void)setDocumentStates:(id)a3;
- (void)setInlineCompletions:(id)a3;
- (void)setInput:(id)a3;
- (void)setInserted:(id)a3;
- (void)setIntended:(id)a3;
- (void)setIntendedTransliteration:(id)a3;
- (void)setNumberOfTouches:(id)a3;
- (void)setPathsForWords:(id)a3;
- (void)setPredicted:(id)a3;
- (void)setRank:(id)a3;
- (void)setSeed:(id)a3;
- (void)setSourceMetadata:(id)a3;
- (void)setTags:(id)a3;
- (void)setTagsFromClassifiers:(id)a3;
- (void)setTouchEvents:(id)a3;
- (void)setTouched:(id)a3;
- (void)setTypologyLogURL:(id)a3;
- (void)setTypologyTraceLogURL:(id)a3;
@end

@implementation AutocorrectionResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = +[NSMutableString string];
  v4 = [(AutocorrectionResult *)self context];
  [v3 appendFormat:@"context: [%@]\n", v4];

  v5 = [(AutocorrectionResult *)self touched];
  [v3 appendFormat:@"        touched: [%@]\n", v5];

  v6 = [(AutocorrectionResult *)self inserted];
  [v3 appendFormat:@"       inserted: [%@]\n", v6];

  v7 = [(AutocorrectionResult *)self corrected];
  [v3 appendFormat:@"      corrected: [%@]\n", v7];

  v8 = [(AutocorrectionResult *)self intended];
  [v3 appendFormat:@"       expected: [%@]\n", v8];

  v9 = [(AutocorrectionResult *)self intendedTransliteration];
  [v3 appendFormat:@" expected trans: [%@]\n", v9];

  v10 = [(AutocorrectionResult *)self input];
  [v3 appendFormat:@"          input: [%@]\n", v10];

  v11 = [(AutocorrectionResult *)self numberOfTouches];
  [v3 appendFormat:@"     numTouches: [%@]\n", v11];

  v12 = [(AutocorrectionResult *)self seed];
  [v3 appendFormat:@"           seed: %@\n", v12];

  v13 = [(AutocorrectionResult *)self rank];
  if ([v13 integerValue] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    [v3 appendFormat:@"           rank: %@\n", @"NSNotFound"];
  }
  else
  {
    v14 = [(AutocorrectionResult *)self rank];
    v15 = [v14 description];
    [v3 appendFormat:@"           rank: %@\n", v15];
  }
  v16 = [(AutocorrectionResult *)self aggdStatistics];
  [v3 appendFormat:@" aggdStatistics: %@\n", v16];

  [v3 appendString:@"       failures:"];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v17 = [(AutocorrectionResult *)self tags];
  id v18 = [v17 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v24;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v24 != v20) {
          objc_enumerationMutation(v17);
        }
        [v3 appendFormat:@" %@", *(void *)(*((void *)&v23 + 1) + 8 * i)];
      }
      id v19 = [v17 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v19);
  }

  [v3 appendString:@"\n"];

  return v3;
}

- (void)setTagsFromClassifiers:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        if (objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * (void)v10), "doesMatchResult:", self, (void)v13))
        {
          v11 = (objc_class *)objc_opt_class();
          v12 = NSStringFromClass(v11);
          [v5 addObject:v12];
        }
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  [(AutocorrectionResult *)self setTags:v5];
}

- (AutocorrectionResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)AutocorrectionResult;
  v5 = [(AutocorrectionResult *)&v26 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    id v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, objc_opt_class(), 0);
    id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ARContext"];
    [(AutocorrectionResult *)v5 setContext:v8];

    uint64_t v9 = [v4 decodeObjectOfClasses:v7 forKey:@"ARTouched"];
    [(AutocorrectionResult *)v5 setTouched:v9];

    v10 = [v4 decodeObjectOfClasses:v7 forKey:@"ARPredicted"];
    [(AutocorrectionResult *)v5 setPredicted:v10];

    v11 = [v4 decodeObjectOfClasses:v7 forKey:@"ARInlineCompletions"];
    [(AutocorrectionResult *)v5 setInlineCompletions:v11];

    v12 = [v4 decodeObjectOfClasses:v7 forKey:@"ARDocumentStates"];
    [(AutocorrectionResult *)v5 setDocumentStates:v12];

    long long v13 = [v4 decodeObjectOfClasses:v7 forKey:@"ARInserted"];
    [(AutocorrectionResult *)v5 setInserted:v13];

    long long v14 = [v4 decodeObjectOfClasses:v7 forKey:@"ARCorrected"];
    [(AutocorrectionResult *)v5 setCorrected:v14];

    long long v15 = [v4 decodeObjectOfClasses:v7 forKey:@"ARIntended"];
    [(AutocorrectionResult *)v5 setIntended:v15];

    long long v16 = [v4 decodeObjectOfClasses:v7 forKey:@"ARIntendedTransliteration"];
    [(AutocorrectionResult *)v5 setIntendedTransliteration:v16];

    v17 = [v4 decodeObjectOfClasses:v7 forKey:@"ARInput"];
    [(AutocorrectionResult *)v5 setInput:v17];

    id v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ARNumberOfTouches"];
    [(AutocorrectionResult *)v5 setNumberOfTouches:v18];

    id v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ARSeed"];
    [(AutocorrectionResult *)v5 setSeed:v19];

    uint64_t v20 = [v4 decodeObjectOfClasses:v7 forKey:@"ARTags"];
    [(AutocorrectionResult *)v5 setTags:v20];

    v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ARRank"];
    [(AutocorrectionResult *)v5 setRank:v21];

    [(AutocorrectionResult *)v5 setAggdStatistics:0];
    v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ARDebug"];
    uint64_t v25 = 0;
    long long v23 = +[NSJSONSerialization JSONObjectWithData:v22 options:0 error:&v25];
    if ([v23 count]) {
      [(AutocorrectionResult *)v5 setDebugData:v23];
    }
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(AutocorrectionResult *)self context];
  [v4 encodeObject:v5 forKey:@"ARContext"];

  uint64_t v6 = [(AutocorrectionResult *)self touched];
  [v4 encodeObject:v6 forKey:@"ARTouched"];

  id v7 = [(AutocorrectionResult *)self predicted];
  [v4 encodeObject:v7 forKey:@"ARPredicted"];

  id v8 = [(AutocorrectionResult *)self inlineCompletions];
  [v4 encodeObject:v8 forKey:@"ARInlineCompletions"];

  uint64_t v9 = [(AutocorrectionResult *)self documentStates];
  [v4 encodeObject:v9 forKey:@"ARDocumentStates"];

  v10 = [(AutocorrectionResult *)self inserted];
  [v4 encodeObject:v10 forKey:@"ARInserted"];

  v11 = [(AutocorrectionResult *)self corrected];
  [v4 encodeObject:v11 forKey:@"ARCorrected"];

  v12 = [(AutocorrectionResult *)self intended];
  [v4 encodeObject:v12 forKey:@"ARIntended"];

  long long v13 = [(AutocorrectionResult *)self intendedTransliteration];
  [v4 encodeObject:v13 forKey:@"ARIntendedTransliteration"];

  long long v14 = [(AutocorrectionResult *)self input];
  [v4 encodeObject:v14 forKey:@"ARInput"];

  long long v15 = [(AutocorrectionResult *)self numberOfTouches];
  [v4 encodeObject:v15 forKey:@"ARNumberOfTouches"];

  long long v16 = [(AutocorrectionResult *)self seed];
  [v4 encodeObject:v16 forKey:@"ARSeed"];

  v17 = [(AutocorrectionResult *)self tags];
  [v4 encodeObject:v17 forKey:@"ARTags"];

  id v18 = [(AutocorrectionResult *)self rank];
  [v4 encodeObject:v18 forKey:@"ARRank"];

  uint64_t v19 = [(AutocorrectionResult *)self debugData];
  uint64_t v20 = (void *)v19;
  if (v19) {
    v21 = (void *)v19;
  }
  else {
    v21 = &__NSDictionary0__struct;
  }
  uint64_t v23 = 0;
  v22 = +[NSJSONSerialization dataWithJSONObject:v21 options:0 error:&v23];

  [v4 encodeObject:v22 forKey:@"ARDebug"];
}

- (void)extractDataFromTypingLog:(id)a3
{
  id v4 = a3;
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x2020000000;
  uint64_t v44 = 0;
  v5 = +[NSMutableArray array];
  uint64_t v6 = +[NSMutableArray array];
  id v7 = +[NSMutableArray array];
  id v8 = +[NSMutableArray array];
  uint64_t v9 = +[NSMutableArray array];
  v10 = +[NSMutableArray array];
  v11 = +[NSMutableDictionary dictionary];
  v29 = _NSConcreteStackBlock;
  uint64_t v30 = 3221225472;
  v31 = sub_837C;
  v32 = &unk_8CD50;
  v40 = &v41;
  id v12 = v5;
  id v33 = v12;
  id v13 = v9;
  id v34 = v13;
  id v14 = v7;
  id v35 = v14;
  id v15 = v8;
  id v36 = v15;
  id v16 = v10;
  id v37 = v16;
  id v17 = v6;
  id v38 = v17;
  id v18 = v11;
  id v39 = v18;
  [v4 enumerateKeystrokesAndPathsForTokensWithBlock:&v29];
  id v19 = objc_msgSend(v12, "copy", v29, v30, v31, v32);
  [(AutocorrectionResult *)self setTouched:v19];

  id v20 = [v14 copy];
  [(AutocorrectionResult *)self setPredicted:v20];

  id v21 = [v15 copy];
  [(AutocorrectionResult *)self setInlineCompletions:v21];

  id v22 = [v13 copy];
  [(AutocorrectionResult *)self setInserted:v22];

  id v23 = [v16 copy];
  [(AutocorrectionResult *)self setDocumentStates:v23];

  long long v24 = +[NSNumber numberWithUnsignedInteger:v42[3]];
  [(AutocorrectionResult *)self setNumberOfTouches:v24];

  uint64_t v25 = [v4 getDebugData];
  [(AutocorrectionResult *)self setDebugData:v25];

  id v26 = [v17 copy];
  [(AutocorrectionResult *)self setTouchEvents:v26];

  id v27 = [v18 copy];
  [(AutocorrectionResult *)self setPathsForWords:v27];

  v28 = [v4 intendedTransliterationSequence];
  if (v28) {
    [(AutocorrectionResult *)self setIntendedTransliteration:v28];
  }

  _Block_object_dispose(&v41, 8);
}

- (NSString)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (NSDictionary)sourceMetadata
{
  return self->_sourceMetadata;
}

- (void)setSourceMetadata:(id)a3
{
}

- (NSArray)touched
{
  return self->_touched;
}

- (void)setTouched:(id)a3
{
}

- (NSArray)touchEvents
{
  return self->_touchEvents;
}

- (void)setTouchEvents:(id)a3
{
}

- (NSDictionary)pathsForWords
{
  return self->_pathsForWords;
}

- (void)setPathsForWords:(id)a3
{
}

- (NSArray)inserted
{
  return self->_inserted;
}

- (void)setInserted:(id)a3
{
}

- (NSArray)predicted
{
  return self->_predicted;
}

- (void)setPredicted:(id)a3
{
}

- (NSArray)inlineCompletions
{
  return self->_inlineCompletions;
}

- (void)setInlineCompletions:(id)a3
{
}

- (NSArray)corrected
{
  return self->_corrected;
}

- (void)setCorrected:(id)a3
{
}

- (NSArray)intended
{
  return self->_intended;
}

- (void)setIntended:(id)a3
{
}

- (NSArray)intendedTransliteration
{
  return self->_intendedTransliteration;
}

- (void)setIntendedTransliteration:(id)a3
{
}

- (NSArray)input
{
  return self->_input;
}

- (void)setInput:(id)a3
{
}

- (NSArray)documentStates
{
  return self->_documentStates;
}

- (void)setDocumentStates:(id)a3
{
}

- (NSNumber)numberOfTouches
{
  return self->_numberOfTouches;
}

- (void)setNumberOfTouches:(id)a3
{
}

- (NSNumber)corpusId
{
  return self->_corpusId;
}

- (void)setCorpusId:(id)a3
{
}

- (NSURL)typologyLogURL
{
  return self->_typologyLogURL;
}

- (void)setTypologyLogURL:(id)a3
{
}

- (NSURL)typologyTraceLogURL
{
  return self->_typologyTraceLogURL;
}

- (void)setTypologyTraceLogURL:(id)a3
{
}

- (NSString)seed
{
  return self->_seed;
}

- (void)setSeed:(id)a3
{
}

- (NSDictionary)debugData
{
  return self->_debugData;
}

- (void)setDebugData:(id)a3
{
}

- (NSArray)tags
{
  return self->_tags;
}

- (void)setTags:(id)a3
{
}

- (NSNumber)rank
{
  return self->_rank;
}

- (void)setRank:(id)a3
{
}

- (NSDictionary)aggdStatistics
{
  return self->_aggdStatistics;
}

- (void)setAggdStatistics:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aggdStatistics, 0);
  objc_storeStrong((id *)&self->_rank, 0);
  objc_storeStrong((id *)&self->_tags, 0);
  objc_storeStrong((id *)&self->_debugData, 0);
  objc_storeStrong((id *)&self->_seed, 0);
  objc_storeStrong((id *)&self->_typologyTraceLogURL, 0);
  objc_storeStrong((id *)&self->_typologyLogURL, 0);
  objc_storeStrong((id *)&self->_corpusId, 0);
  objc_storeStrong((id *)&self->_numberOfTouches, 0);
  objc_storeStrong((id *)&self->_documentStates, 0);
  objc_storeStrong((id *)&self->_input, 0);
  objc_storeStrong((id *)&self->_intendedTransliteration, 0);
  objc_storeStrong((id *)&self->_intended, 0);
  objc_storeStrong((id *)&self->_corrected, 0);
  objc_storeStrong((id *)&self->_inlineCompletions, 0);
  objc_storeStrong((id *)&self->_predicted, 0);
  objc_storeStrong((id *)&self->_inserted, 0);
  objc_storeStrong((id *)&self->_pathsForWords, 0);
  objc_storeStrong((id *)&self->_touchEvents, 0);
  objc_storeStrong((id *)&self->_touched, 0);
  objc_storeStrong((id *)&self->_sourceMetadata, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

@end