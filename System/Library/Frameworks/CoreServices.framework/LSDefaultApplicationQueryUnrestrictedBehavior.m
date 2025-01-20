@interface LSDefaultApplicationQueryUnrestrictedBehavior
- (id)URLOfDefaultAppForCategory:(unint64_t)a3;
- (id)entryForApplication:(id)a3 category:(unint64_t)a4;
@end

@implementation LSDefaultApplicationQueryUnrestrictedBehavior

- (id)URLOfDefaultAppForCategory:(unint64_t)a3
{
  v4 = objc_alloc_init(LSDefaultApplicationQueryDatabaseDefaultAppEvaluator);
  v5 = [(LSDefaultApplicationQueryDatabaseDefaultAppEvaluator *)v4 URLOfDefaultAppForCategory:a3];

  return v5;
}

- (id)entryForApplication:(id)a3 category:(unint64_t)a4
{
  return 0;
}

@end