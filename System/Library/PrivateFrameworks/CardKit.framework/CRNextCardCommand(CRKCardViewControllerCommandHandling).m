@interface CRNextCardCommand(CRKCardViewControllerCommandHandling)
- (uint64_t)handleForCardViewController:()CRKCardViewControllerCommandHandling;
@end

@implementation CRNextCardCommand(CRKCardViewControllerCommandHandling)

- (uint64_t)handleForCardViewController:()CRKCardViewControllerCommandHandling
{
  id v4 = a3;
  v5 = [v4 cardViewControllerDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x263F31640]);
    v8 = [v4 card];
    v9 = [a1 nextCard];
    [v7 setBaseCard:v8];
    [v7 setRequestedCard:v9];
    v10 = [v4 cardViewControllerDelegate];
    [v10 controllerForCard:v8 didRequestAsyncCard:v9 withAsyncCardRequestFeedback:v7];
  }
  v15.receiver = a1;
  v15.super_class = (Class)&off_26D87E2E0;
  unsigned int v11 = objc_msgSendSuper2(&v15, sel_handleForCardViewController_, v4);
  v12 = [v4 cardViewControllerDelegate];
  if (v11 && (objc_opt_respondsToSelector() & 1) != 0) {
    uint64_t v13 = [v12 performNextCardCommand:a1 forCardViewController:v4];
  }
  else {
    uint64_t v13 = 0;
  }

  return v13;
}

@end