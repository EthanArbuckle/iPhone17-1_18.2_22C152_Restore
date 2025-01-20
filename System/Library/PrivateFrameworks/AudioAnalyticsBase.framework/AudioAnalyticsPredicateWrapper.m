@interface AudioAnalyticsPredicateWrapper
+ (BOOL)evaluatePredicate:(id)a3 with:(id)a4;
+ (id)buildPredicate:(id)a3;
+ (id)logger;
@end

@implementation AudioAnalyticsPredicateWrapper

+ (BOOL)evaluatePredicate:(id)a3 with:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  char v7 = [v5 evaluateWithObject:v6];

  return v7;
}

+ (id)logger
{
  if (+[AudioAnalyticsPredicateWrapper logger]::onceToken != -1) {
    dispatch_once(&+[AudioAnalyticsPredicateWrapper logger]::onceToken, &__block_literal_global);
  }
  v2 = (void *)+[AudioAnalyticsPredicateWrapper logger]::_logger;
  return v2;
}

uint64_t __40__AudioAnalyticsPredicateWrapper_logger__block_invoke()
{
  +[AudioAnalyticsPredicateWrapper logger]::_logger = (uint64_t)os_log_create("com.apple.coreaudio", "caro");
  return MEMORY[0x270F9A758]();
}

+ (id)buildPredicate:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x263F08A98] predicateWithFormat:v3 argumentArray:0];

  return v4;
}

@end