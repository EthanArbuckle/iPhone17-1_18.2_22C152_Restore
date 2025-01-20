@interface NTKParmesanShuffleSelectionFlowController
- (NTKParmesanShuffleSelectionDelegate)delegate;
- (NTKParmesanShuffleSelectionFlowController)initWithCoder:(id)a3;
- (NTKParmesanShuffleSelectionFlowController)initWithEditor:(id)a3 face:(id)a4 inGallery:(BOOL)a5;
- (NTKParmesanShuffleSelectionFlowController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)setDelegate:(id)a3;
- (void)userDidSelectCancel:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation NTKParmesanShuffleSelectionFlowController

- (NTKParmesanShuffleSelectionDelegate)delegate
{
  v2 = (void *)MEMORY[0x24C545A70]((char *)self + OBJC_IVAR___NTKParmesanShuffleSelectionFlowController_delegate, a2);

  return (NTKParmesanShuffleSelectionDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_246C2447C();

  swift_unknownObjectRelease();
}

- (NTKParmesanShuffleSelectionFlowController)initWithEditor:(id)a3 face:(id)a4 inGallery:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = (NTKParmesanShuffleSelectionFlowController *)sub_246C24550(v7, v8, a5);

  return v9;
}

- (NTKParmesanShuffleSelectionFlowController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_246C24678();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_246C23AB0(a3);
}

- (void)userDidSelectCancel:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_246C2D1F8();
  swift_unknownObjectRelease();
  [(NTKParmesanShuffleSelectionFlowController *)v4 dismissViewControllerAnimated:1 completion:0];

  sub_246B8EB94((uint64_t)&v5);
}

- (NTKParmesanShuffleSelectionFlowController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (NTKParmesanShuffleSelectionFlowController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___NTKParmesanShuffleSelectionFlowController_suggestionsDataSource));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___NTKParmesanShuffleSelectionFlowController_editor));

  sub_246B98F78((uint64_t)self + OBJC_IVAR___NTKParmesanShuffleSelectionFlowController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___NTKParmesanShuffleSelectionFlowController_shuffleSelectionViewController));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___NTKParmesanShuffleSelectionFlowController_noContentViewController);
}

@end