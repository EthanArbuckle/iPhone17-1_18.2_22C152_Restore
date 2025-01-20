@interface WebViewController
- (BOOL)webViewController:(id)a3 handleDelegateAction:(id)a4 completion:(id)a5;
- (_TtC22SubscribePageExtension17WebViewController)initWithBag:(id)a3 account:(id)a4 clientInfo:(id)a5;
- (_TtC22SubscribePageExtension17WebViewController)initWithCoder:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)webViewController:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5;
- (void)webViewController:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5;
@end

@implementation WebViewController

- (_TtC22SubscribePageExtension17WebViewController)initWithBag:(id)a3 account:(id)a4 clientInfo:(id)a5
{
  result = (_TtC22SubscribePageExtension17WebViewController *)sub_100768A40();
  __break(1u);
  return result;
}

- (_TtC22SubscribePageExtension17WebViewController)initWithCoder:(id)a3
{
  result = (_TtC22SubscribePageExtension17WebViewController *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
}

- (void)viewDidDisappear:(BOOL)a3
{
}

- (void)webViewController:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5
{
}

- (BOOL)webViewController:(id)a3 handleDelegateAction:(id)a4 completion:(id)a5
{
  v5 = _Block_copy(a5);
  _Block_release(v5);
  return 0;
}

- (void)webViewController:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
}

- (void).cxx_destruct
{
}

@end