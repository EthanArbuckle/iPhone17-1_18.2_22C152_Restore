@interface ErrorViewController
- (UINavigationItem)navigationItem;
- (_TtC27AppleMediaServicesUIDynamic19ErrorViewController)init;
- (_TtC27AppleMediaServicesUIDynamic19ErrorViewController)initWithCoder:(id)a3;
- (_TtC27AppleMediaServicesUIDynamic19ErrorViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)airplaneModeInquiryDidObserveChange:(id)a3;
- (void)dealloc;
- (void)loadView;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation ErrorViewController

- (_TtC27AppleMediaServicesUIDynamic19ErrorViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1BF416220();
}

- (void)dealloc
{
  v2 = self;
  sub_1BF41634C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic19ErrorViewController_error));
  swift_release();
  sub_1BF3CBCFC(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic19ErrorViewController_retryAction));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic19ErrorViewController_airplaneModeInquiry));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic19ErrorViewController_cellularDataInquiry));
  __swift_destroy_boxed_opaque_existential_2((uint64_t)self + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic19ErrorViewController_networkInquiry);
  sub_1BF3F5450((uint64_t)self + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic19ErrorViewController_networkObservation, &qword_1EBA92E80);
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic19ErrorViewController____lazy_storage___contentUnavailableView);
}

- (UINavigationItem)navigationItem
{
  v2 = self;
  id v3 = sub_1BF416510();

  return (UINavigationItem *)v3;
}

- (void)loadView
{
  v2 = self;
  sub_1BF4165E8();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1BF4172B8();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1BF41733C();
}

- (_TtC27AppleMediaServicesUIDynamic19ErrorViewController)init
{
}

- (_TtC27AppleMediaServicesUIDynamic19ErrorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1BF465FA8();
  }
  id v5 = a4;
  sub_1BF418DE0();
}

- (void)airplaneModeInquiryDidObserveChange:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1BF418E5C();
}

@end