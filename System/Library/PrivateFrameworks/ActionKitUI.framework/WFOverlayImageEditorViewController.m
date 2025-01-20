@interface WFOverlayImageEditorViewController
- (BOOL)opacitySliderVisible;
- (BOOL)prefersStatusBarHidden;
- (BOOL)rotationEnabled;
- (NSArray)fileRepresentations;
- (NSLayoutConstraint)opacityViewVerticalConstraint;
- (NSMapTable)transforms;
- (WFFileRepresentation)currentFile;
- (WFImage)overlayImage;
- (WFOpacitySliderView)opacityView;
- (WFOverlayImageEditorCanvasView)canvasView;
- (WFOverlayImageEditorOptionsView)optionsView;
- (WFOverlayImageEditorViewController)initWithFileRepresentations:(id)a3 overlayImage:(id)a4 completionHandler:(id)a5;
- (id)completionHandler;
- (id)editorBackgroundColor;
- (void)cancelEditingImage;
- (void)didChangeOpacity:(id)a3;
- (void)finishEditingImage;
- (void)loadView;
- (void)resetOverlayImageViewTransformations;
- (void)setCanvasView:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setCurrentFile:(id)a3;
- (void)setFileRepresentations:(id)a3;
- (void)setOpacitySliderVisible:(BOOL)a3;
- (void)setOpacityView:(id)a3;
- (void)setOpacityViewVerticalConstraint:(id)a3;
- (void)setOptionsView:(id)a3;
- (void)setOverlayImage:(id)a3;
- (void)setRotationEnabled:(BOOL)a3;
- (void)setTransforms:(id)a3;
- (void)viewDidLoad;
@end

@implementation WFOverlayImageEditorViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_opacityViewVerticalConstraint, 0);
  objc_destroyWeak((id *)&self->_opacityView);
  objc_destroyWeak((id *)&self->_canvasView);
  objc_destroyWeak((id *)&self->_optionsView);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_transforms, 0);
  objc_storeStrong((id *)&self->_currentFile, 0);
  objc_storeStrong((id *)&self->_fileRepresentations, 0);
  objc_storeStrong((id *)&self->_overlayImage, 0);
}

- (void)setOpacityViewVerticalConstraint:(id)a3
{
}

- (NSLayoutConstraint)opacityViewVerticalConstraint
{
  return self->_opacityViewVerticalConstraint;
}

- (void)setOpacityView:(id)a3
{
}

- (WFOpacitySliderView)opacityView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_opacityView);
  return (WFOpacitySliderView *)WeakRetained;
}

- (void)setCanvasView:(id)a3
{
}

- (WFOverlayImageEditorCanvasView)canvasView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_canvasView);
  return (WFOverlayImageEditorCanvasView *)WeakRetained;
}

- (void)setOptionsView:(id)a3
{
}

- (WFOverlayImageEditorOptionsView)optionsView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_optionsView);
  return (WFOverlayImageEditorOptionsView *)WeakRetained;
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setTransforms:(id)a3
{
}

- (NSMapTable)transforms
{
  return self->_transforms;
}

- (WFFileRepresentation)currentFile
{
  return self->_currentFile;
}

- (void)setFileRepresentations:(id)a3
{
}

- (NSArray)fileRepresentations
{
  return self->_fileRepresentations;
}

- (void)setOverlayImage:(id)a3
{
}

- (WFImage)overlayImage
{
  return self->_overlayImage;
}

- (void)cancelEditingImage
{
  v3 = [(WFOverlayImageEditorViewController *)self completionHandler];
  v4 = [MEMORY[0x263F087E8] userCancelledError];
  ((void (**)(void, void, void *))v3)[2](v3, 0, v4);

  [(WFOverlayImageEditorViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)finishEditingImage
{
  v3 = [(WFOverlayImageEditorViewController *)self transforms];
  v4 = [(WFOverlayImageEditorViewController *)self canvasView];
  v5 = [v4 imageTransform];
  v6 = [(WFOverlayImageEditorViewController *)self currentFile];
  [v3 setObject:v5 forKey:v6];

  v7 = [(WFOverlayImageEditorViewController *)self fileRepresentations];
  v8 = [(WFOverlayImageEditorViewController *)self currentFile];
  uint64_t v9 = [v7 indexOfObject:v8];

  v10 = [(WFOverlayImageEditorViewController *)self fileRepresentations];
  unint64_t v11 = [v10 count];

  if (v9 + 1 >= v11)
  {
    v20 = [WFOverlayImageEditorProcessingView alloc];
    v21 = [MEMORY[0x263F824D8] effectWithStyle:2];
    v22 = [(WFOverlayImageEditorProcessingView *)v20 initWithEffect:v21];

    [(WFOverlayImageEditorProcessingView *)v22 setTranslatesAutoresizingMaskIntoConstraints:0];
    v23 = [(WFOverlayImageEditorViewController *)self view];
    [v23 addSubview:v22];

    v24 = [(WFOverlayImageEditorViewController *)self view];
    v25 = (void *)MEMORY[0x263F08938];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_optionsView);
    v27 = _NSDictionaryOfVariableBindings(&cfstr_Processingview.isa, v22, WeakRetained, 0);
    v28 = [v25 constraintsWithVisualFormat:@"V:|[processingView][_optionsView]" options:0 metrics:0 views:v27];
    [v24 addConstraints:v28];

    v29 = [(WFOverlayImageEditorViewController *)self view];
    v30 = (void *)MEMORY[0x263F08938];
    v31 = _NSDictionaryOfVariableBindings(&cfstr_Processingview_0.isa, v22, 0);
    v32 = [v30 constraintsWithVisualFormat:@"H:|[processingView]|" options:0 metrics:0 views:v31];
    [v29 addConstraints:v32];

    v33 = [(WFOverlayImageEditorViewController *)self fileRepresentations];
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __56__WFOverlayImageEditorViewController_finishEditingImage__block_invoke;
    v36[3] = &unk_2649001D0;
    v36[4] = self;
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __56__WFOverlayImageEditorViewController_finishEditingImage__block_invoke_3;
    v35[3] = &unk_264900FC8;
    v35[4] = self;
    objc_msgSend(v33, "if_mapAsynchronously:completionHandler:", v36, v35);
  }
  else
  {
    v12 = [(WFOverlayImageEditorViewController *)self fileRepresentations];
    v13 = [v12 objectAtIndexedSubscript:v9 + 1];
    [(WFOverlayImageEditorViewController *)self setCurrentFile:v13];

    v14 = [(WFOverlayImageEditorViewController *)self optionsView];
    v15 = [v14 nextButton];
    [v15 setEnabled:1];

    v16 = [(WFOverlayImageEditorViewController *)self fileRepresentations];
    uint64_t v17 = [v16 count] - 2;

    if (v9 == v17)
    {
      id v34 = [(WFOverlayImageEditorViewController *)self optionsView];
      v18 = [v34 nextButton];
      v19 = WFLocalizedString(@"Done");
      [v18 setTitle:v19 forState:0];
    }
  }
}

void __56__WFOverlayImageEditorViewController_finishEditingImage__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  v7 = *(void **)(a1 + 32);
  id v8 = a2;
  uint64_t v9 = [v7 transforms];
  v10 = [v9 objectForKey:v8];
  uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 976);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __56__WFOverlayImageEditorViewController_finishEditingImage__block_invoke_2;
  v13[3] = &unk_2649001A8;
  id v14 = v6;
  id v12 = v6;
  [v10 applyToImageFile:v8 withOverlayImage:v11 completionHandler:v13];
}

void __56__WFOverlayImageEditorViewController_finishEditingImage__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __56__WFOverlayImageEditorViewController_finishEditingImage__block_invoke_4;
  v10[3] = &unk_264900940;
  v10[4] = v7;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  [v7 dismissViewControllerAnimated:1 completion:v10];
}

void __56__WFOverlayImageEditorViewController_finishEditingImage__block_invoke_4(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) completionHandler];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) completionHandler];
    (*((void (**)(id, void, void))v3 + 2))(v3, *(void *)(a1 + 40), *(void *)(a1 + 48));
  }
}

uint64_t __56__WFOverlayImageEditorViewController_finishEditingImage__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)resetOverlayImageViewTransformations
{
  id v2 = [(WFOverlayImageEditorViewController *)self canvasView];
  [v2 reset];
}

- (void)setRotationEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(WFOverlayImageEditorViewController *)self canvasView];
  [v4 setRotationEnabled:v3];
}

- (BOOL)rotationEnabled
{
  id v2 = [(WFOverlayImageEditorViewController *)self canvasView];
  char v3 = [v2 isRotationEnabled];

  return v3;
}

- (void)setOpacitySliderVisible:(BOOL)a3
{
  BOOL v4 = a3;
  if (a3)
  {
    char v3 = [(WFOverlayImageEditorViewController *)self opacityView];
    [v3 frame];
    double v7 = -v6;
  }
  else
  {
    double v7 = 0.0;
  }
  id v8 = [(WFOverlayImageEditorViewController *)self opacityViewVerticalConstraint];
  [v8 setConstant:v7];

  if (v4) {
  v9[0] = MEMORY[0x263EF8330];
  }
  v9[1] = 3221225472;
  v9[2] = __62__WFOverlayImageEditorViewController_setOpacitySliderVisible___block_invoke;
  v9[3] = &unk_264900E20;
  v9[4] = self;
  [MEMORY[0x263F82E00] animateWithDuration:v9 animations:0 completion:0.25];
}

void __62__WFOverlayImageEditorViewController_setOpacitySliderVisible___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 layoutIfNeeded];
}

- (BOOL)opacitySliderVisible
{
  id v2 = [(WFOverlayImageEditorViewController *)self opacityViewVerticalConstraint];
  [v2 constant];
  BOOL v4 = v3 == 0.0;

  return v4;
}

- (void)didChangeOpacity:(id)a3
{
  id v4 = a3;
  id v7 = [(WFOverlayImageEditorViewController *)self canvasView];
  [v4 opacity];
  double v6 = v5;

  [v7 setOverlayImageOpacity:v6];
}

- (void)setCurrentFile:(id)a3
{
  v88[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_storeStrong((id *)&self->_currentFile, a3);
  double v6 = (const void *)WFImageSourceCreateFromFile();
  id v7 = WFImageAtIndexFromImageSource();
  CFRelease(v6);
  id v8 = (void *)[objc_alloc(MEMORY[0x263F23230]) initForCenteringImage:self->_overlayImage inBackgroundImage:v7];
  id v9 = [WFOverlayImageEditorCanvasView alloc];
  v10 = [v7 UIImage];
  id v11 = [(WFImage *)self->_overlayImage UIImage];
  id v12 = [(WFOverlayImageEditorCanvasView *)v9 initWithBackgroundImage:v10 overlayImage:v11 transform:v8];

  [(WFOverlayImageEditorCanvasView *)v12 setTranslatesAutoresizingMaskIntoConstraints:0];
  v13 = [(WFOverlayImageEditorViewController *)self canvasView];

  if (!v13)
  {
    v60 = [(WFOverlayImageEditorViewController *)self view];
    [v60 insertSubview:v12 atIndex:0];

    id v61 = objc_storeWeak((id *)&self->_canvasView, v12);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_optionsView);
    v63 = _NSDictionaryOfVariableBindings(&cfstr_CanvasviewOpti.isa, v12, WeakRetained, 0);

    v64 = [(WFOverlayImageEditorViewController *)self view];
    v65 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|[_canvasView][_optionsView]" options:0 metrics:0 views:v63];
    [v64 addConstraints:v65];

    v66 = [(WFOverlayImageEditorViewController *)self view];
    v67 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|[_canvasView]|" options:0 metrics:0 views:v63];
    [v66 addConstraints:v67];

    v68 = [(WFOverlayImageEditorViewController *)self view];
    [v68 setNeedsLayout];

    goto LABEL_16;
  }
  v72 = v8;
  v73 = v7;
  id v74 = v5;
  id v14 = [(WFOverlayImageEditorViewController *)self canvasView];
  [v14 setUserInteractionEnabled:0];
  v15 = [(WFOverlayImageEditorViewController *)self view];
  [v15 insertSubview:v12 aboveSubview:v14];

  v87 = @"offset";
  v16 = NSNumber;
  uint64_t v17 = [(WFOverlayImageEditorViewController *)self view];
  [v17 frame];
  v19 = [v16 numberWithDouble:v18];
  v88[0] = v19;
  v71 = [NSDictionary dictionaryWithObjects:v88 forKeys:&v87 count:1];

  v20 = (void *)MEMORY[0x263F08938];
  v21 = [(WFOverlayImageEditorViewController *)self view];
  v22 = [(WFOverlayImageEditorViewController *)self view];
  [v22 frame];
  uint64_t v24 = [v20 constraintWithItem:v12 attribute:1 relatedBy:0 toItem:v21 attribute:1 multiplier:1.0 constant:v23];

  v25 = (void *)MEMORY[0x263F08938];
  v26 = [(WFOverlayImageEditorViewController *)self view];
  [v26 frame];
  uint64_t v28 = [v25 constraintWithItem:v12 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v27];

  v29 = [(WFOverlayImageEditorViewController *)self view];
  v70 = (void *)v24;
  [v29 addConstraint:v24];

  v30 = [(WFOverlayImageEditorViewController *)self view];
  v69 = (void *)v28;
  [v30 addConstraint:v28];

  v31 = [(WFOverlayImageEditorViewController *)self view];
  v32 = (void *)MEMORY[0x263F08938];
  id v33 = objc_loadWeakRetained((id *)&self->_optionsView);
  id v34 = _NSDictionaryOfVariableBindings(&cfstr_NewcanvasviewO.isa, v12, v33, 0);
  v35 = [v32 constraintsWithVisualFormat:@"V:|[newCanvasView][_optionsView]" options:0 metrics:0 views:v34];
  [v31 addConstraints:v35];

  v36 = [(WFOverlayImageEditorViewController *)self view];
  [v36 setNeedsLayout];

  v37 = [(WFOverlayImageEditorViewController *)self view];
  [v37 layoutIfNeeded];

  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  v38 = [(WFOverlayImageEditorViewController *)self view];
  v39 = [v38 constraints];

  uint64_t v40 = [v39 countByEnumeratingWithState:&v82 objects:v86 count:16];
  if (!v40) {
    goto LABEL_14;
  }
  uint64_t v41 = v40;
  uint64_t v42 = *(void *)v83;
  do
  {
    for (uint64_t i = 0; i != v41; ++i)
    {
      if (*(void *)v83 != v42) {
        objc_enumerationMutation(v39);
      }
      v44 = *(void **)(*((void *)&v82 + 1) + 8 * i);
      uint64_t v45 = [v44 firstItem];
      if ((void *)v45 == v14)
      {
      }
      else
      {
        v46 = (void *)v45;
        v47 = [v44 secondItem];

        if (v47 != v14) {
          continue;
        }
      }
      v48 = [(WFOverlayImageEditorViewController *)self view];
      [v48 removeConstraint:v44];
    }
    uint64_t v41 = [v39 countByEnumeratingWithState:&v82 objects:v86 count:16];
  }
  while (v41);
LABEL_14:

  id v49 = objc_loadWeakRetained((id *)&self->_optionsView);
  v50 = _NSDictionaryOfVariableBindings(&cfstr_OldcanvasviewO.isa, v14, v49, 0);

  v51 = [(WFOverlayImageEditorViewController *)self view];
  v52 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|[oldCanvasView][_optionsView]" options:0 metrics:0 views:v50];
  [v51 addConstraints:v52];

  v53 = [(WFOverlayImageEditorViewController *)self view];
  v54 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:[oldCanvasView(==offset)]-(offset)-|" options:0 metrics:v71 views:v50];
  [v53 addConstraints:v54];

  [v70 setConstant:0.0];
  v55 = [(WFOverlayImageEditorViewController *)self optionsView];
  [v55 setUserInteractionEnabled:0];

  v56 = (void *)MEMORY[0x263F82E00];
  v81[0] = MEMORY[0x263EF8330];
  v81[1] = 3221225472;
  v81[2] = __53__WFOverlayImageEditorViewController_setCurrentFile___block_invoke;
  v81[3] = &unk_264900E20;
  v81[4] = self;
  v75[0] = MEMORY[0x263EF8330];
  v75[1] = 3221225472;
  v75[2] = __53__WFOverlayImageEditorViewController_setCurrentFile___block_invoke_2;
  v75[3] = &unk_264900180;
  id v76 = v14;
  v77 = self;
  id v78 = v70;
  id v79 = v69;
  v80 = v12;
  id v57 = v69;
  id v58 = v70;
  id v59 = v14;
  [v56 animateWithDuration:v81 animations:v75 completion:0.3];

  id v7 = v73;
  id v5 = v74;
  id v8 = v72;
LABEL_16:
}

void __53__WFOverlayImageEditorViewController_setCurrentFile___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 layoutIfNeeded];
}

void __53__WFOverlayImageEditorViewController_setCurrentFile___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  id v2 = [*(id *)(a1 + 40) view];
  [v2 removeConstraint:*(void *)(a1 + 48)];

  double v3 = [*(id *)(a1 + 40) view];
  [v3 removeConstraint:*(void *)(a1 + 56)];

  id v4 = [*(id *)(a1 + 40) view];
  id v5 = (void *)MEMORY[0x263F08938];
  double v6 = _NSDictionaryOfVariableBindings(&cfstr_Newcanvasview.isa, *(id *)(a1 + 64), 0);
  id v7 = [v5 constraintsWithVisualFormat:@"H:|[newCanvasView]|" options:0 metrics:0 views:v6];
  [v4 addConstraints:v7];

  objc_storeWeak((id *)(*(void *)(a1 + 40) + 1024), *(id *)(a1 + 64));
  id v8 = [*(id *)(a1 + 40) optionsView];
  [v8 setUserInteractionEnabled:1];

  id v9 = [*(id *)(a1 + 40) opacityView];
  [v9 reset];
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (id)editorBackgroundColor
{
  return (id)[MEMORY[0x263F825C8] colorWithRed:0.149019608 green:0.196078431 blue:0.219607843 alpha:1.0];
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)WFOverlayImageEditorViewController;
  [(WFOverlayImageEditorViewController *)&v9 viewDidLoad];
  [(WFOverlayImageEditorViewController *)self setNeedsStatusBarAppearanceUpdate];
  double v3 = [(WFOverlayImageEditorViewController *)self fileRepresentations];
  unint64_t v4 = [v3 count];

  id v5 = [(WFOverlayImageEditorViewController *)self optionsView];
  double v6 = [v5 nextButton];
  if (v4 >= 2) {
    id v7 = @"Next";
  }
  else {
    id v7 = @"Done";
  }
  id v8 = WFLocalizedString(v7);
  [v6 setTitle:v8 forState:0];
}

- (void)loadView
{
  v25.receiver = self;
  v25.super_class = (Class)WFOverlayImageEditorViewController;
  [(WFOverlayImageEditorViewController *)&v25 loadView];
  double v3 = [(WFOverlayImageEditorViewController *)self editorBackgroundColor];
  unint64_t v4 = [(WFOverlayImageEditorViewController *)self view];
  [v4 setBackgroundColor:v3];

  id v5 = objc_alloc_init(WFOverlayImageEditorOptionsView);
  double v6 = [(WFOverlayImageEditorViewController *)self editorBackgroundColor];
  [(WFOverlayImageEditorOptionsView *)v5 setBackgroundColor:v6];

  [(WFOverlayImageEditorOptionsView *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(WFOverlayImageEditorOptionsView *)v5 setDelegate:self];
  id v7 = [(WFOverlayImageEditorViewController *)self view];
  [v7 addSubview:v5];

  objc_storeWeak((id *)&self->_optionsView, v5);
  id v8 = objc_alloc_init(WFOpacitySliderView);
  [(WFOpacitySliderView *)v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(WFOpacitySliderView *)v8 addTarget:self action:sel_didChangeOpacity_ forControlEvents:4096];
  objc_super v9 = [(WFOverlayImageEditorViewController *)self view];
  [v9 insertSubview:v8 belowSubview:v5];

  objc_storeWeak((id *)&self->_opacityView, v8);
  v10 = _NSDictionaryOfVariableBindings(&cfstr_OptionsviewOpa.isa, v5, v8, 0);
  id v11 = [MEMORY[0x263F08938] constraintWithItem:v8 attribute:3 relatedBy:0 toItem:v5 attribute:3 multiplier:1.0 constant:0.0];
  [(WFOverlayImageEditorViewController *)self setOpacityViewVerticalConstraint:v11];

  id v12 = [(WFOverlayImageEditorViewController *)self view];
  v13 = [(WFOverlayImageEditorViewController *)self opacityViewVerticalConstraint];
  [v12 addConstraint:v13];

  id v14 = [(WFOverlayImageEditorViewController *)self view];
  v15 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|[opacitySliderView]|" options:0 metrics:0 views:v10];
  [v14 addConstraints:v15];

  v16 = [(WFOverlayImageEditorViewController *)self view];
  uint64_t v17 = (void *)MEMORY[0x263F08938];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_opacityView);
  v19 = [v17 constraintWithItem:WeakRetained attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:90.0];
  [v16 addConstraint:v19];

  v20 = [(WFOverlayImageEditorViewController *)self view];
  v21 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:[optionsView]|" options:0 metrics:0 views:v10];
  [v20 addConstraints:v21];

  v22 = [(WFOverlayImageEditorViewController *)self view];
  double v23 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|[optionsView]|" options:0 metrics:0 views:v10];
  [v22 addConstraints:v23];

  uint64_t v24 = [(NSArray *)self->_fileRepresentations firstObject];
  [(WFOverlayImageEditorViewController *)self setCurrentFile:v24];
}

- (WFOverlayImageEditorViewController)initWithFileRepresentations:(id)a3 overlayImage:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)WFOverlayImageEditorViewController;
  id v11 = [(WFOverlayImageEditorViewController *)&v20 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    fileRepresentations = v11->_fileRepresentations;
    v11->_fileRepresentations = (NSArray *)v12;

    id v14 = _Block_copy(v10);
    id completionHandler = v11->_completionHandler;
    v11->_id completionHandler = v14;

    objc_storeStrong((id *)&v11->_overlayImage, a4);
    uint64_t v16 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    transforms = v11->_transforms;
    v11->_transforms = (NSMapTable *)v16;

    [(WFOverlayImageEditorViewController *)v11 setModalPresentationStyle:0];
    double v18 = v11;
  }

  return v11;
}

@end