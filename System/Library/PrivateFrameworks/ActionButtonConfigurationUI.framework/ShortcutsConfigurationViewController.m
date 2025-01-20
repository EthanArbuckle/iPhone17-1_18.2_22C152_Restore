@interface ShortcutsConfigurationViewController
- (_TtC27ActionButtonConfigurationUI36ShortcutsConfigurationViewController)initWithCoder:(id)a3;
- (_TtC27ActionButtonConfigurationUI36ShortcutsConfigurationViewController)initWithConfigurationContext:(id)a3;
- (void)configurationController:(id)a3 didFinishWithAction:(id)a4 error:(id)a5;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ShortcutsConfigurationViewController

- (_TtC27ActionButtonConfigurationUI36ShortcutsConfigurationViewController)initWithConfigurationContext:(id)a3
{
  return (_TtC27ActionButtonConfigurationUI36ShortcutsConfigurationViewController *)sub_2473FDC0C(a3);
}

- (_TtC27ActionButtonConfigurationUI36ShortcutsConfigurationViewController)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  v5 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC27ActionButtonConfigurationUI36ShortcutsConfigurationViewController_completionHandler);
  void *v5 = 0;
  v5[1] = 0;
  id v6 = a3;

  result = (_TtC27ActionButtonConfigurationUI36ShortcutsConfigurationViewController *)sub_24740E480();
  __break(1u);
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_2473FDD6C(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_2473FDF50(a3);
}

- (void)configurationController:(id)a3 didFinishWithAction:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  id v11 = a5;
  sub_2473FE1BC(a4, a5);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC27ActionButtonConfigurationUI36ShortcutsConfigurationViewController_completionHandler);
  sub_2473D81A0(v3);
}

@end