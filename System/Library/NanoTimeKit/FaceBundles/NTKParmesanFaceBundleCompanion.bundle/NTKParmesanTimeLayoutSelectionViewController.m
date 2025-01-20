@interface NTKParmesanTimeLayoutSelectionViewController
+ (double)bottomPadding;
+ (double)idealHeightForPreviewHeight:(double)a3;
+ (double)topPadding;
+ (double)totalHeightForPreviewHeight:(double)a3;
- (NTKParmesanTimeLayout)selectedLayout;
- (NTKParmesanTimeLayoutSelectionDelegate)delegate;
- (NTKParmesanTimeLayoutSelectionViewController)initWithCoder:(id)a3;
- (NTKParmesanTimeLayoutSelectionViewController)initWithLayoutOptions:(id)a3 itemHeight:(double)a4 deviceSize:(CGSize)a5 deviceScreenRadius:(double)a6;
- (NTKParmesanTimeLayoutSelectionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)loadView;
- (void)setDelegate:(id)a3;
- (void)setSelectedLayout:(id)a3;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation NTKParmesanTimeLayoutSelectionViewController

+ (double)totalHeightForPreviewHeight:(double)a3
{
  if (qword_2691D6350 != -1) {
    swift_once();
  }
  objc_msgSend((id)qword_2691E0238, sel_lineHeight);
  return a3 + 12.0 + v4 + v4 + 12.0 + 4.0 + 12.0;
}

+ (double)idealHeightForPreviewHeight:(double)a3
{
  if (qword_2691D6350 != -1) {
    swift_once();
  }
  objc_msgSend((id)qword_2691E0238, sel_lineHeight);
  return a3 + 12.0 + v4 + v4 + 12.0;
}

+ (double)topPadding
{
  return 4.0;
}

+ (double)bottomPadding
{
  return 12.0;
}

- (NTKParmesanTimeLayout)selectedLayout
{
  return (NTKParmesanTimeLayout *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                          + OBJC_IVAR___NTKParmesanTimeLayoutSelectionViewController_selectedLayout));
}

- (void)setSelectedLayout:(id)a3
{
  double v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___NTKParmesanTimeLayoutSelectionViewController_selectedLayout);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR___NTKParmesanTimeLayoutSelectionViewController_selectedLayout) = (Class)a3;
  id v6 = a3;
  v5 = self;

  sub_246C0B658();
}

- (NTKParmesanTimeLayoutSelectionDelegate)delegate
{
  v2 = (void *)MEMORY[0x24C545A70]((char *)self + OBJC_IVAR___NTKParmesanTimeLayoutSelectionViewController_delegate, a2);

  return (NTKParmesanTimeLayoutSelectionDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
}

- (NTKParmesanTimeLayoutSelectionViewController)initWithLayoutOptions:(id)a3 itemHeight:(double)a4 deviceSize:(CGSize)a5 deviceScreenRadius:(double)a6
{
  double height = a5.height;
  double width = a5.width;
  type metadata accessor for ParmesanTimeLayout();
  uint64_t v10 = sub_246C2CD38();
  return (NTKParmesanTimeLayoutSelectionViewController *)sub_246C0A404(v10, a4, width, height, a6);
}

- (NTKParmesanTimeLayoutSelectionViewController)initWithCoder:(id)a3
{
  v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR___NTKParmesanTimeLayoutSelectionViewController_mainSectionIdentifier);
  void *v5 = 0x746365536E69614DLL;
  v5[1] = 0xEB000000006E6F69;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___NTKParmesanTimeLayoutSelectionViewController_dataSource) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR___NTKParmesanTimeLayoutSelectionViewController_selectedLayout) = 0;
  swift_unknownObjectWeakInit();
  id v6 = a3;

  result = (NTKParmesanTimeLayoutSelectionViewController *)sub_246C2D3A8();
  __break(1u);
  return result;
}

- (void)loadView
{
  v2 = self;
  sub_246C0A62C();
}

- (void)viewIsAppearing:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ParmesanTimeLayoutSelectionViewController();
  id v4 = v5.receiver;
  [(NTKParmesanTimeLayoutSelectionViewController *)&v5 viewIsAppearing:v3];
  sub_246C0B27C();
  sub_246C0B658();
  sub_246C0BE80(0);
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_246C0B114();
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_246C2BCD8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_246C2BC88();
  id v10 = a3;
  v11 = self;
  sub_246C0B460(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (NTKParmesanTimeLayoutSelectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (NTKParmesanTimeLayoutSelectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___NTKParmesanTimeLayoutSelectionViewController_dataSource));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___NTKParmesanTimeLayoutSelectionViewController_selectedLayout));
  BOOL v3 = (char *)self + OBJC_IVAR___NTKParmesanTimeLayoutSelectionViewController_delegate;

  sub_246B98F78((uint64_t)v3);
}

@end