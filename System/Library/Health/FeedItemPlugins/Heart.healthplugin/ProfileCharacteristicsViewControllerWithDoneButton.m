@interface ProfileCharacteristicsViewControllerWithDoneButton
- (_TtC5HeartP33_D11295934EA630C16E68E651ADA1CA7C50ProfileCharacteristicsViewControllerWithDoneButton)initWithCoder:(id)a3;
- (_TtC5HeartP33_D11295934EA630C16E68E651ADA1CA7C50ProfileCharacteristicsViewControllerWithDoneButton)initWithHealthStore:(id)a3;
- (void)dismissNavigationViewController;
- (void)viewDidLoad;
@end

@implementation ProfileCharacteristicsViewControllerWithDoneButton

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ProfileCharacteristicsViewControllerWithDoneButton();
  id v2 = v6.receiver;
  [(ProfileCharacteristicsViewController *)&v6 viewDidLoad];
  id v3 = objc_allocWithZone(MEMORY[0x263F824A8]);
  id v4 = objc_msgSend(v3, sel_initWithBarButtonSystemItem_target_action_, 0, v2, sel_dismissNavigationViewController, v6.receiver, v6.super_class);
  id v5 = objc_msgSend(v2, sel_navigationItem);
  objc_msgSend(v5, sel_setLeftBarButtonItem_, v4);
}

- (void)dismissNavigationViewController
{
  id v5 = self;
  id v2 = (_TtC5HeartP33_D11295934EA630C16E68E651ADA1CA7C50ProfileCharacteristicsViewControllerWithDoneButton *)[(ProfileCharacteristicsViewControllerWithDoneButton *)v5 navigationController];
  if (v2)
  {
    id v3 = v2;
    [(ProfileCharacteristicsViewControllerWithDoneButton *)v2 dismissViewControllerAnimated:1 completion:0];

    id v4 = v3;
  }
  else
  {
    id v4 = v5;
  }
}

- (_TtC5HeartP33_D11295934EA630C16E68E651ADA1CA7C50ProfileCharacteristicsViewControllerWithDoneButton)initWithHealthStore:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ProfileCharacteristicsViewControllerWithDoneButton();
  return [(ProfileCharacteristicsViewController *)&v5 initWithHealthStore:a3];
}

- (_TtC5HeartP33_D11295934EA630C16E68E651ADA1CA7C50ProfileCharacteristicsViewControllerWithDoneButton)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ProfileCharacteristicsViewControllerWithDoneButton();
  return [(ProfileCharacteristicsViewController *)&v5 initWithCoder:a3];
}

@end