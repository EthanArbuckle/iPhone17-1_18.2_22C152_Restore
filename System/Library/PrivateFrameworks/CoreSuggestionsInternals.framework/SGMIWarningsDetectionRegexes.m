@interface SGMIWarningsDetectionRegexes
+ (id)_loadDataDetectorAdditionDict:(id)a3 compiledRegexCache:(id)a4;
- (NSDictionary)dataDetectorAdditions;
- (NSDictionary)dataDetectorMappedAdditions;
- (SGMIWarningsDetectionRegex)body;
- (SGMIWarningsDetectionRegex)subject;
- (SGMIWarningsDetectionRegexes)initWithDictionary:(id)a3;
- (SGMIWarningsDetectionRegexes)initWithDictionary:(id)a3 compiledRegexCache:(id)a4;
- (id)description;
@end

@implementation SGMIWarningsDetectionRegexes

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataDetectorAdditions, 0);
  objc_storeStrong((id *)&self->_dataDetectorMappedAdditions, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_subject, 0);
}

- (NSDictionary)dataDetectorAdditions
{
  return self->_dataDetectorAdditions;
}

- (NSDictionary)dataDetectorMappedAdditions
{
  return self->_dataDetectorMappedAdditions;
}

- (SGMIWarningsDetectionRegex)body
{
  return self->_body;
}

- (SGMIWarningsDetectionRegex)subject
{
  return self->_subject;
}

- (id)description
{
  id v5 = [NSString alloc];
  if (self->_subject) {
    subject = self->_subject;
  }
  else {
    subject = (SGMIWarningsDetectionRegex *)@"(null)";
  }
  if (self->_body) {
    body = self->_body;
  }
  else {
    body = (SGMIWarningsDetectionRegex *)@"(null)";
  }
  dataDetectorMappedAdditions = self->_dataDetectorMappedAdditions;
  if (dataDetectorMappedAdditions)
  {
    v2 = [(NSDictionary *)self->_dataDetectorMappedAdditions allKeys];
    v3 = objc_msgSend(v2, "_pas_mappedArrayWithTransform:", &__block_literal_global_35479);
    v9 = [v3 componentsJoinedByString:@","];
  }
  else
  {
    v9 = @"(null)";
  }
  dataDetectorAdditions = self->_dataDetectorAdditions;
  if (dataDetectorAdditions)
  {
    v11 = [(NSDictionary *)dataDetectorAdditions allKeys];
    v12 = objc_msgSend(v11, "_pas_mappedArrayWithTransform:", &__block_literal_global_47);
    v13 = [v12 componentsJoinedByString:@","];
    v14 = (void *)[v5 initWithFormat:@"<SGMIWarningsDetectionRegexes>\n  subject:%@\n  body:%@\n  dataDetectorMappedAdditions:'%@'\n  dataDetectorAdditions:'%@'\n", subject, body, v9, v13];

    if (!dataDetectorMappedAdditions) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  v14 = (void *)[v5 initWithFormat:@"<SGMIWarningsDetectionRegexes>\n  subject:%@\n  body:%@\n  dataDetectorMappedAdditions:'%@'\n  dataDetectorAdditions:'%@'\n", subject, body, v9, @"(null)"];
  if (dataDetectorMappedAdditions)
  {
LABEL_12:
  }
LABEL_13:
  return v14;
}

uint64_t __43__SGMIWarningsDetectionRegexes_description__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 pattern];
}

uint64_t __43__SGMIWarningsDetectionRegexes_description__block_invoke(uint64_t a1, void *a2)
{
  return [a2 pattern];
}

- (SGMIWarningsDetectionRegexes)initWithDictionary:(id)a3 compiledRegexCache:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)SGMIWarningsDetectionRegexes;
  v8 = [(SGMIWarningsDetectionRegexes *)&v26 init];
  if (v8)
  {
    v9 = [v6 objectForKeyedSubscript:@"subject"];

    if (v9)
    {
      v10 = [SGMIWarningsDetectionRegex alloc];
      v11 = [v6 objectForKeyedSubscript:@"subject"];
      uint64_t v12 = [(SGMIWarningsDetectionRegex *)v10 initWithPattern:v11 compiledRegexCache:v7];
      subject = v8->_subject;
      v8->_subject = (SGMIWarningsDetectionRegex *)v12;
    }
    v14 = [v6 objectForKeyedSubscript:@"body"];

    if (v14)
    {
      v15 = [SGMIWarningsDetectionRegex alloc];
      v16 = [v6 objectForKeyedSubscript:@"body"];
      uint64_t v17 = [(SGMIWarningsDetectionRegex *)v15 initWithPattern:v16 compiledRegexCache:v7];
      body = v8->_body;
      v8->_body = (SGMIWarningsDetectionRegex *)v17;
    }
    v19 = [v6 objectForKeyedSubscript:@"dataDetectorMappedAdditions"];
    uint64_t v20 = +[SGMIWarningsDetectionRegexes _loadDataDetectorAdditionDict:v19 compiledRegexCache:v7];
    dataDetectorMappedAdditions = v8->_dataDetectorMappedAdditions;
    v8->_dataDetectorMappedAdditions = (NSDictionary *)v20;

    v22 = [v6 objectForKeyedSubscript:@"dataDetectorAdditions"];
    uint64_t v23 = +[SGMIWarningsDetectionRegexes _loadDataDetectorAdditionDict:v22 compiledRegexCache:v7];
    dataDetectorAdditions = v8->_dataDetectorAdditions;
    v8->_dataDetectorAdditions = (NSDictionary *)v23;
  }
  return v8;
}

- (SGMIWarningsDetectionRegexes)initWithDictionary:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = [(SGMIWarningsDetectionRegexes *)self initWithDictionary:v4 compiledRegexCache:v5];

  return v6;
}

+ (id)_loadDataDetectorAdditionDict:(id)a3 compiledRegexCache:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_opt_new();
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __81__SGMIWarningsDetectionRegexes__loadDataDetectorAdditionDict_compiledRegexCache___block_invoke;
  v13[3] = &unk_1E65BF6D0;
  id v14 = v5;
  id v8 = v7;
  id v15 = v8;
  id v9 = v5;
  [v6 enumerateKeysAndObjectsUsingBlock:v13];

  v10 = v15;
  id v11 = v8;

  return v11;
}

void __81__SGMIWarningsDetectionRegexes__loadDataDetectorAdditionDict_compiledRegexCache___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [@"dataDetectorAddition-" stringByAppendingString:v5];
  uint64_t v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];
  if (v8)
  {
    id v9 = (void *)v8;
    id v10 = 0;
LABEL_4:
    [*(id *)(a1 + 40) setObject:v6 forKeyedSubscript:v9];

    goto LABEL_5;
  }
  id v11 = objc_alloc(MEMORY[0x1E4F28FD8]);
  uint64_t v12 = (void *)[[NSString alloc] initWithFormat:@"\\b%@\\b", v5];
  id v13 = 0;
  id v9 = (void *)[v11 initWithPattern:v12 options:1 error:&v13];
  id v10 = v13;

  [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v7];
  if (v9) {
    goto LABEL_4;
  }
LABEL_5:
}

@end