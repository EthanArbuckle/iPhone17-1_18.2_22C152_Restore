@interface PackageViewController
- (UIActivityIndicatorView)activityIndicator;
- (UILabel)errorLabel;
- (_TtC32com_apple_MLKit_MLPackagePreview21PackageViewController)initWithCoder:(id)a3;
- (_TtC32com_apple_MLKit_MLPackagePreview21PackageViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)preparePreviewOfFileAtURL:(id)a3 completionHandler:(id)a4;
- (void)setActivityIndicator:(id)a3;
- (void)setErrorLabel:(id)a3;
- (void)viewDidLoad;
@end

@implementation PackageViewController

- (UIActivityIndicatorView)activityIndicator
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  return (UIActivityIndicatorView *)Strong;
}

- (void)setActivityIndicator:(id)a3
{
}

- (UILabel)errorLabel
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  return (UILabel *)Strong;
}

- (void)setErrorLabel:(id)a3
{
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10001B2D0();
}

- (_TtC32com_apple_MLKit_MLPackagePreview21PackageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_100025030();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC32com_apple_MLKit_MLPackagePreview21PackageViewController *)sub_10001B3B0(v5, v7, a4);
}

- (_TtC32com_apple_MLKit_MLPackagePreview21PackageViewController)initWithCoder:(id)a3
{
  return (_TtC32com_apple_MLKit_MLPackagePreview21PackageViewController *)sub_10001B50C(a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_release();
}

- (void)preparePreviewOfFileAtURL:(id)a3 completionHandler:(id)a4
{
  uint64_t v6 = sub_100024C60();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  sub_100024C40();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  v12 = self;
  sub_10001B6A8((uint64_t)v9, (uint64_t)sub_10001BF6C, v11);

  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

@end