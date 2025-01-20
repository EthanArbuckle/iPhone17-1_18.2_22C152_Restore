@interface CLUIServer.SecureViewController
- (BOOL)_canShowWhileLocked;
- (_TtCC15ClarityUIServer10CLUIServer20SecureViewController)initWithCoder:(id)a3;
- (_TtCC15ClarityUIServer10CLUIServer20SecureViewController)initWithNibName:(id)a3 bundle:(id)a4;
@end

@implementation CLUIServer.SecureViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtCC15ClarityUIServer10CLUIServer20SecureViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_FE50();
    id v6 = a4;
    NSString v7 = sub_FE20();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for CLUIServer.SecureViewController();
  v9 = [(CLUIServer.SecureViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtCC15ClarityUIServer10CLUIServer20SecureViewController)initWithCoder:(id)a3
{
  return (_TtCC15ClarityUIServer10CLUIServer20SecureViewController *)sub_B620(self, (uint64_t)a2, (uint64_t)a3, v3, (uint64_t (*)(uint64_t))type metadata accessor for CLUIServer.SecureViewController);
}

@end