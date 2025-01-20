@interface AAUIReviewCustodianListViewFactory
+ (id)createWithAccountManager:(id)a3 repairHelper:(id)a4;
- (AAUIReviewCustodianListViewFactory)init;
@end

@implementation AAUIReviewCustodianListViewFactory

+ (id)createWithAccountManager:(id)a3 repairHelper:(id)a4
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = a4;
  swift_getObjCClassMetadata();
  id v9 = (id)static ReviewCustodianListViewFactory.create(accountManager:repairHelper:)(a3, a4);

  return v9;
}

- (AAUIReviewCustodianListViewFactory)init
{
  return (AAUIReviewCustodianListViewFactory *)ReviewCustodianListViewFactory.init()();
}

@end