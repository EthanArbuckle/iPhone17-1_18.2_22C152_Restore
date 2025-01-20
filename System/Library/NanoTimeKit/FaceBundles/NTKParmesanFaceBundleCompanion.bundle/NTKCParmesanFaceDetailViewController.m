@interface NTKCParmesanFaceDetailViewController
- (BOOL)_isShareButtonEnabled;
- (NSString)reasonFaceCanNotBeAddedToLibrary;
- (NTKCParmesanFaceDetailViewController)initWithCandidateFace:(id)a3 externalAssets:(id)a4;
- (NTKCParmesanFaceDetailViewController)initWithLibraryFace:(id)a3;
- (id)_sectionForEditOptionCollection:(id)a3;
- (void)_addFace;
- (void)hideLoadingIndicator;
- (void)hideSpinnerIfNeeded;
- (void)sectionDidUpdate:(id)a3;
- (void)showLoadingIndicator;
- (void)showLoadingIndicatorWithProgress:(double)a3;
- (void)showSpinner;
- (void)viewDidLayoutSubviews;
@end

@implementation NTKCParmesanFaceDetailViewController

- (NTKCParmesanFaceDetailViewController)initWithLibraryFace:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___NTKCParmesanFaceDetailViewController_contentSection) = 0;
  id v5 = objc_allocWithZone(MEMORY[0x263F5E438]);
  id v6 = a3;
  v7 = self;
  result = (NTKCParmesanFaceDetailViewController *)objc_msgSend(v5, sel_initWithStyle_, 1);
  if (result)
  {
    *(Class *)((char *)&v7->super.super.super.super.isa
             + OBJC_IVAR___NTKCParmesanFaceDetailViewController_progressIndicator) = (Class)result;

    v10.receiver = v7;
    v10.super_class = (Class)type metadata accessor for ParmesanFaceDetailViewController();
    v9 = [(NTKCFaceDetailViewController *)&v10 initWithLibraryFace:v6];

    return v9;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (NTKCParmesanFaceDetailViewController)initWithCandidateFace:(id)a3 externalAssets:(id)a4
{
  if (a4) {
    uint64_t v5 = sub_246C2CD38();
  }
  else {
    uint64_t v5 = 0;
  }
  return (NTKCParmesanFaceDetailViewController *)sub_246C0848C(a3, v5);
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_246C08760();
}

- (id)_sectionForEditOptionCollection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_246C08A50(v4);
  v7 = v6;

  return v7;
}

- (BOOL)_isShareButtonEnabled
{
  v2 = self;
  unsigned __int8 v3 = sub_246C08D7C();

  return v3 & 1;
}

- (void)_addFace
{
  v2 = self;
  sub_246C08F14();
}

- (NSString)reasonFaceCanNotBeAddedToLibrary
{
  v2 = self;
  sub_246C090FC();
  uint64_t v4 = v3;

  if (v4)
  {
    uint64_t v5 = (void *)sub_246C2CC08();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = 0;
  }

  return (NSString *)v5;
}

- (void)showSpinner
{
  v2 = self;
  sub_246C0924C();
}

- (void)hideSpinnerIfNeeded
{
  v2 = self;
  sub_246C093F8();
}

- (void)showLoadingIndicator
{
  v2 = self;
  sub_246C0924C();
}

- (void)showLoadingIndicatorWithProgress:(double)a3
{
  uint64_t v5 = OBJC_IVAR___NTKCParmesanFaceDetailViewController_progressIndicator;
  id v6 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR___NTKCParmesanFaceDetailViewController_progressIndicator);
  v8 = self;
  objc_msgSend(v6, sel_currentProgress);
  if (v7 < a3) {
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v5), sel_setCurrentProgress_, a3);
  }
}

- (void)hideLoadingIndicator
{
  v2 = self;
  sub_246C093F8();
}

- (void)sectionDidUpdate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  [(NTKCFaceDetailViewController *)v5 _updateAddButton];
  [(NTKCFaceDetailViewController *)v5 _updateShareButton];
  sub_246C09900((id)0xE);
  sub_246C09900((id)0xF);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___NTKCParmesanFaceDetailViewController_contentSection));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR___NTKCParmesanFaceDetailViewController_progressIndicator);
}

@end