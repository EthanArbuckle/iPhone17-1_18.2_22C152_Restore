@interface ErrorViewController
- (UINavigationItem)navigationItem;
- (_TtC19CoreDynamicUIPlugin19ErrorViewController)init;
- (_TtC19CoreDynamicUIPlugin19ErrorViewController)initWithCoder:(id)a3;
- (_TtC19CoreDynamicUIPlugin19ErrorViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)airplaneModeInquiryDidObserveChange:(id)a3;
- (void)dealloc;
- (void)loadView;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation ErrorViewController

- (_TtC19CoreDynamicUIPlugin19ErrorViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_37F40();
}

- (void)dealloc
{
  v2 = self;
  sub_3806C();
}

- (void).cxx_destruct
{
  swift_errorRelease();
  swift_release();
  sub_18234(*(void *)&self->AMSUICommonViewController_opaque[OBJC_IVAR____TtC19CoreDynamicUIPlugin19ErrorViewController_retryAction]);

  sub_616C((uint64_t)&self->AMSUICommonViewController_opaque[OBJC_IVAR____TtC19CoreDynamicUIPlugin19ErrorViewController_networkInquiry]);
  sub_3C708((uint64_t)&self->AMSUICommonViewController_opaque[OBJC_IVAR____TtC19CoreDynamicUIPlugin19ErrorViewController_networkObservation], &qword_BC800);
  id v3 = *(void **)&self->AMSUICommonViewController_opaque[OBJC_IVAR____TtC19CoreDynamicUIPlugin19ErrorViewController____lazy_storage___contentUnavailableView];
}

- (UINavigationItem)navigationItem
{
  v2 = self;
  id v3 = sub_38230();

  return (UINavigationItem *)v3;
}

- (void)loadView
{
  v2 = self;
  sub_38308();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_38FD4();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_39058();
}

- (_TtC19CoreDynamicUIPlugin19ErrorViewController)init
{
}

- (_TtC19CoreDynamicUIPlugin19ErrorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_8F9D0();
  }
  id v5 = a4;
  sub_3AAB4();
}

- (void)airplaneModeInquiryDidObserveChange:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_3AB30();
}

@end