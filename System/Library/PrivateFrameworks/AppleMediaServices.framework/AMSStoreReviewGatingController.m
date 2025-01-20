@interface AMSStoreReviewGatingController
- (AMSBagProtocol)bag;
- (AMSStoreReviewGatingController)init;
- (AMSStoreReviewGatingController)initWithBag:(id)a3;
- (void)canPromptWithCompletionHandler:(id)a3;
- (void)didEnterForegroundWithCompletionHandler:(id)a3;
- (void)didPromptWithCompletionHandler:(id)a3;
- (void)isEnabledWithCompletionHandler:(id)a3;
@end

@implementation AMSStoreReviewGatingController

- (AMSStoreReviewGatingController)initWithBag:(id)a3
{
  return (AMSStoreReviewGatingController *)StoreReviewGatingController.init(bag:)((uint64_t)a3);
}

- (void)didEnterForegroundWithCompletionHandler:(id)a3
{
}

- (AMSBagProtocol)bag
{
  v2 = (void *)StoreReviewGatingController.bag.getter();
  return (AMSBagProtocol *)v2;
}

- (void)didPromptWithCompletionHandler:(id)a3
{
}

- (void)isEnabledWithCompletionHandler:(id)a3
{
}

- (void)canPromptWithCompletionHandler:(id)a3
{
}

- (AMSStoreReviewGatingController)init
{
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_release();
}

@end