@interface DOCDocumentPickerViewController
- (_TtC11SaveToFiles31DOCDocumentPickerViewController)initWithConfiguration:(id)a3 context:(id)a4;
- (_TtC11SaveToFiles31DOCDocumentPickerViewController)initWithConfiguration:(id)a3 sourceObserver:(id)a4;
- (_TtC11SaveToFiles31DOCDocumentPickerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC11SaveToFiles31DOCDocumentPickerViewController)initWithStyle:(int64_t)a3;
- (_TtP11SaveToFiles25DOCDocumentPickerDelegate_)pickerDelegate;
- (void)documentBrowser:(id)a3 didPickDocumentsAtURLs:(id)a4;
- (void)effectiveAppearanceDidChange:(id)a3;
- (void)setPickerDelegate:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation DOCDocumentPickerViewController

- (_TtP11SaveToFiles25DOCDocumentPickerDelegate_)pickerDelegate
{
  swift_beginAccess();
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  return (_TtP11SaveToFiles25DOCDocumentPickerDelegate_ *)Strong;
}

- (void)setPickerDelegate:(id)a3
{
}

- (_TtC11SaveToFiles31DOCDocumentPickerViewController)initWithConfiguration:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  return (_TtC11SaveToFiles31DOCDocumentPickerViewController *)DOCDocumentPickerViewController.init(configuration:context:)(v5, a4);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  DOCDocumentPickerViewController.viewDidDisappear(_:)(a3);
}

- (void)documentBrowser:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  sub_1004CE370();
  uint64_t v6 = sub_1004D1510();
  id v7 = a3;
  v8 = self;
  sub_1002445D0(v6);

  swift_bridgeObjectRelease();
}

- (_TtC11SaveToFiles31DOCDocumentPickerViewController)initWithConfiguration:(id)a3 sourceObserver:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  result = (_TtC11SaveToFiles31DOCDocumentPickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC11SaveToFiles31DOCDocumentPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC11SaveToFiles31DOCDocumentPickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC11SaveToFiles31DOCDocumentPickerViewController)initWithStyle:(int64_t)a3
{
  result = (_TtC11SaveToFiles31DOCDocumentPickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (void)effectiveAppearanceDidChange:(id)a3
{
  id v4 = a3;
  id v5 = self;
  DOCDocumentPickerViewController.effectiveAppearanceDidChange(_:)(v4);
}

@end