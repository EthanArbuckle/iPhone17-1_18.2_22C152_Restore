@interface CHSProactiveService
- (CHSProactiveService)init;
- (CHSProactiveService)initWithConnection:(id)a3;
- (void)loadSuggestedWidget:(id)a3 metrics:(id)a4 stackIdentifier:(id)a5 completion:(id)a6;
- (void)loadSuggestedWidget:(id)a3 withMetrics:(id)a4 completion:(id)a5;
- (void)suggestionBudgetsForStackIdentifiers:(id)a3 completion:(id)a4;
@end

@implementation CHSProactiveService

- (CHSProactiveService)init
{
  v3 = +[CHSChronoServicesConnection sharedInstance];
  v4 = [(CHSProactiveService *)self initWithConnection:v3];

  return v4;
}

- (CHSProactiveService)initWithConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHSProactiveService;
  v6 = [(CHSProactiveService *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_connection, a3);
  }

  return v7;
}

- (void)loadSuggestedWidget:(id)a3 metrics:(id)a4 stackIdentifier:(id)a5 completion:(id)a6
{
}

- (void)suggestionBudgetsForStackIdentifiers:(id)a3 completion:(id)a4
{
}

- (void)loadSuggestedWidget:(id)a3 withMetrics:(id)a4 completion:(id)a5
{
  id v8 = a5;
  connection = self->_connection;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__CHSProactiveService_loadSuggestedWidget_withMetrics_completion___block_invoke;
  v11[3] = &unk_1E56C94D8;
  id v12 = v8;
  id v10 = v8;
  [(CHSChronoServicesConnection *)connection loadSuggestedWidget:a3 metrics:a4 stackIdentifier:@"deprecatedMethodUsed" reason:@"ProactiveService" completion:v11];
}

uint64_t __66__CHSProactiveService_loadSuggestedWidget_withMetrics_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
}

@end