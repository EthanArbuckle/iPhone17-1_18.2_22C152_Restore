@interface DebugStorefrontPickerViewController
- (_TtC22SubscribePageExtension35DebugStorefrontPickerViewController)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension35DebugStorefrontPickerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (double)pickerView:(id)a3 widthForComponent:(int64_t)a4;
- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5;
- (void)setStorefront;
- (void)setStorefrontToUS;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation DebugStorefrontPickerViewController

- (_TtC22SubscribePageExtension35DebugStorefrontPickerViewController)initWithCoder:(id)a3
{
  result = (_TtC22SubscribePageExtension35DebugStorefrontPickerViewController *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1000939D4();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_100093FA8();
}

- (void)setStorefront
{
  v2 = self;
  sub_100761B30();
}

- (void)setStorefrontToUS
{
  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension35DebugStorefrontPickerViewController_countryPicker);
  v3 = self;
  [v2 selectRow:157 inComponent:0 animated:1];
  sub_100761B70();
  [*(id *)((char *)&v3->super.super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtension35DebugStorefrontPickerViewController_languagePicker) selectRow:0 inComponent:0 animated:1];
  sub_100761B80();
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  id v5 = a3;
  v6 = self;
  int64_t v7 = sub_100094A70();

  return v7;
}

- (double)pickerView:(id)a3 widthForComponent:(int64_t)a4
{
  id v5 = a3;
  v6 = self;
  id v7 = [(DebugStorefrontPickerViewController *)v6 view];
  if (v7)
  {
    v9 = v7;
    sub_10001A860(0, (unint64_t *)&qword_100932C80);
    sub_10075C580();
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;

    v19.origin.x = v11;
    v19.origin.y = v13;
    v19.size.width = v15;
    v19.size.height = v17;
    double Width = CGRectGetWidth(v19);

    return Width;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  id v6 = a3;
  id v7 = self;
  sub_100094B14();
  uint64_t v9 = v8;

  if (v9)
  {
    NSString v10 = sub_1007675C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v10 = 0;
  }

  return v10;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  id v6 = a3;
  id v7 = self;
  sub_100094BD0();
}

- (_TtC22SubscribePageExtension35DebugStorefrontPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  double result = (_TtC22SubscribePageExtension35DebugStorefrontPickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension35DebugStorefrontPickerViewController_countryPicker));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension35DebugStorefrontPickerViewController_languagePicker));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension35DebugStorefrontPickerViewController_submitButton));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension35DebugStorefrontPickerViewController_backToUSButton);
}

@end