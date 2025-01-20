@interface CRPunchoutCommand(CRKCardViewControllerCommandHandling)
- (uint64_t)handleForCardViewController:()CRKCardViewControllerCommandHandling;
@end

@implementation CRPunchoutCommand(CRKCardViewControllerCommandHandling)

- (uint64_t)handleForCardViewController:()CRKCardViewControllerCommandHandling
{
  id v4 = a3;
  v9.receiver = a1;
  v9.super_class = (Class)&off_26D8783E0;
  unsigned int v5 = objc_msgSendSuper2(&v9, sel_handleForCardViewController_, v4);
  v6 = [v4 cardViewControllerDelegate];
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0) {
    uint64_t v7 = [v6 performPunchoutCommand:a1 forCardViewController:v4];
  }
  else {
    uint64_t v7 = 0;
  }

  return v7;
}

@end