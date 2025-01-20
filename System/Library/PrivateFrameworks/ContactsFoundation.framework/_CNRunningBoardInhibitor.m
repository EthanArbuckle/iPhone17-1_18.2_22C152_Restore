@interface _CNRunningBoardInhibitor
+ (id)os_log;
+ (id)runningBoardTarget;
- (NSString)explanation;
- (RBSAssertion)assertion;
- (_CNRunningBoardInhibitor)initWithExplanation:(id)a3;
- (id)description;
- (void)setAssertion:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation _CNRunningBoardInhibitor

+ (id)os_log
{
  if (os_log_cn_once_token_1_16 != -1) {
    dispatch_once(&os_log_cn_once_token_1_16, &__block_literal_global_86);
  }
  v2 = (void *)os_log_cn_once_object_1_16;

  return v2;
}

- (_CNRunningBoardInhibitor)initWithExplanation:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CNRunningBoardInhibitor;
  v5 = [(_CNRunningBoardInhibitor *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    explanation = v5->_explanation;
    v5->_explanation = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (id)description
{
  v3 = +[CNDescriptionBuilder descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"explanation" object:self->_explanation];
  id v5 = (id)[v3 appendName:@"assertion" object:self->_assertion];
  uint64_t v6 = [v3 build];

  return v6;
}

- (void)start
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19091D000, a2, OS_LOG_TYPE_ERROR, "Failed to take runningboard assertion, error: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)stop
{
  v4.receiver = self;
  v4.super_class = (Class)_CNRunningBoardInhibitor;
  [(CNInhibitor *)&v4 stop];
  uint64_t v3 = [(_CNRunningBoardInhibitor *)self assertion];
  [v3 invalidate];

  [(_CNRunningBoardInhibitor *)self setAssertion:0];
}

+ (id)runningBoardTarget
{
  if (runningBoardTarget_cn_once_token_5 != -1) {
    dispatch_once(&runningBoardTarget_cn_once_token_5, &__block_literal_global_24);
  }
  int v2 = (void *)runningBoardTarget_cn_once_object_5;

  return v2;
}

- (NSString)explanation
{
  return self->_explanation;
}

- (RBSAssertion)assertion
{
  return self->_assertion;
}

- (void)setAssertion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertion, 0);

  objc_storeStrong((id *)&self->_explanation, 0);
}

@end