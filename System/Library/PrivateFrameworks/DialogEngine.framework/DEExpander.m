@interface DEExpander
- (BOOL)shouldEvaluateConditions;
- (BOOL)shouldExpandOpts;
- (DEExpander)init;
- (NSDictionary)parameters;
- (id)expand:(id)a3 localeString:(id)a4 expansionType:(int)a5;
- (id)expandWithParamsString:(id)a3 localeString:(id)a4;
- (id)expandWithParamsString:(id)a3 localeString:(id)a4 evaluateConditions:(BOOL)a5;
- (id)expandWithParamsStringAsDAG:(id)a3 localeString:(id)a4;
- (void)setParameters:(id)a3;
- (void)setShouldEvaluateConditions:(BOOL)a3;
- (void)setShouldExpandOpts:(BOOL)a3;
@end

@implementation DEExpander

- (void).cxx_destruct
{
}

- (void)setShouldExpandOpts:(BOOL)a3
{
  self->_shouldExpandOpts = a3;
}

- (BOOL)shouldExpandOpts
{
  return self->_shouldExpandOpts;
}

- (void)setShouldEvaluateConditions:(BOOL)a3
{
  self->_shouldEvaluateConditions = a3;
}

- (BOOL)shouldEvaluateConditions
{
  return self->_shouldEvaluateConditions;
}

- (void)setParameters:(id)a3
{
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (id)expandWithParamsStringAsDAG:(id)a3 localeString:(id)a4
{
  v4 = [(DEExpander *)self expand:a3 localeString:a4 expansionType:1];
  return v4;
}

- (id)expandWithParamsString:(id)a3 localeString:(id)a4 evaluateConditions:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  [(DEExpander *)self setShouldEvaluateConditions:v5];
  v10 = [(DEExpander *)self expandWithParamsString:v8 localeString:v9];

  return v10;
}

- (id)expandWithParamsString:(id)a3 localeString:(id)a4
{
  v4 = [(DEExpander *)self expand:a3 localeString:a4 expansionType:0];
  return v4;
}

- (id)expand:(id)a3 localeString:(id)a4 expansionType:(int)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_opt_new();
  v10 = [(DEExpander *)self parameters];

  if (v10)
  {
    v11 = [(DEExpander *)self parameters];
    [v9 setValue:v11 forKey:@"parameters"];
  }
  id v21 = 0;
  uint64_t v12 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v9 options:3 error:&v21];
  id v14 = v21;
  if (v12)
  {
    std::string::basic_string[abi:ne180100]<0>(v20, (char *)objc_msgSend( objc_msgSend([NSString alloc], "initWithData:encoding:", v12, 4), "UTF8String"));
    std::string::basic_string[abi:ne180100]<0>(v19, (char *)[v7 UTF8String]);
    std::string::basic_string[abi:ne180100]<0>(v17, (char *)[v8 UTF8String]);
    std::string::basic_string[abi:ne180100]<0>(&__p, "");
    siri::dialogengine::PrepareRequestFromJson(&v18);
  }
  siri::dialogengine::Log::Error((siri::dialogengine::Log *)"Failed to parse input parameters for CAT request", v13);

  return 0;
}

- (DEExpander)init
{
  v5.receiver = self;
  v5.super_class = (Class)DEExpander;
  v2 = [(DEExpander *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(DEExpander *)v2 setShouldEvaluateConditions:0];
    [(DEExpander *)v3 setShouldExpandOpts:0];
  }
  return v3;
}

@end