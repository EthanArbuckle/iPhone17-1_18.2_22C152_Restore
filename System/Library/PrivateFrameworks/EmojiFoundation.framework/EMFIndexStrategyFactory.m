@interface EMFIndexStrategyFactory
+ (id)defaultStrategyWithTermIndex:(id)a3 andDocumentIndex:(id)a4;
+ (id)inferStrategyForIndex:(id)a3;
@end

@implementation EMFIndexStrategyFactory

+ (id)inferStrategyForIndex:(id)a3
{
  id v3 = a3;
  v4 = _strategyClassForIndex(v3);
  if (!v4)
  {
    v10 = emf_logging_get_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[EMFIndexStrategyFactory inferStrategyForIndex:](v10);
    }

    __assert_rtn("+[EMFIndexStrategyFactory inferStrategyForIndex:]", "EMFIndexStrategyFactory.m", 49, "strategyClass");
  }
  id v5 = [v4 alloc];
  v6 = [v3 termIndex];
  v7 = [v3 documentIndex];
  v8 = (void *)[v5 initWithTermIndex:v6 andDocumentIndex:v7];

  return v8;
}

+ (id)defaultStrategyWithTermIndex:(id)a3 andDocumentIndex:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [(EMFAbstractIndexStrategy *)[EMFIndexStrategyDefault alloc] initWithTermIndex:v6 andDocumentIndex:v5];

  return v7;
}

+ (void)inferStrategyForIndex:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B8C45000, log, OS_LOG_TYPE_ERROR, "Could not infer strategy for index", v1, 2u);
}

@end