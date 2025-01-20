@interface PDFKitPopupView
- (BOOL)becomeFirstResponder;
- (CGRect)_popoverControllerSourceRect;
- (PDFKitPopupView)initWithParentAnnotation:(id)a3 owningPageView:(id)a4 owningPDFView:(id)a5;
- (void)_presentPopupView_iOS;
- (void)_presentViewController:(id)a3;
- (void)_removeControlForAnnotation;
- (void)_setupPopupView;
- (void)_updateParentContents;
- (void)popoverPresentationController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5;
- (void)popoverPresentationControllerDidDismissPopover:(id)a3;
- (void)prepareForPopoverPresentation:(id)a3;
- (void)removeFromSuperview;
- (void)textViewDidChange:(id)a3;
@end

@implementation PDFKitPopupView

- (PDFKitPopupView)initWithParentAnnotation:(id)a3 owningPageView:(id)a4 owningPDFView:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)PDFKitPopupView;
  v11 = [(PDFKitPopupView *)&v20 init];
  if (v11)
  {
    v12 = objc_alloc_init(PDFKitPopupViewPrivate);
    v13 = v11->_private;
    v11->_private = v12;

    objc_storeWeak((id *)&v11->_private->parentAnnotation, v8);
    objc_storeWeak((id *)&v11->_private->pageView, v9);
    objc_storeWeak((id *)&v11->_private->view, v10);
    v14 = v11->_private;
    popupTextViewUndoManager = v14->popupTextViewUndoManager;
    v14->popupTextViewUndoManager = 0;

    uint64_t v16 = [v8 contents];
    v17 = v11->_private;
    contents = v17->contents;
    v17->contents = (NSString *)v16;

    v11->_private->deviceIsiPhone = PDFKitDeviceIsiPhone();
    v11->_private->deviceIsiPad = PDFKitDeviceIsiPad();
    [(PDFKitPopupView *)v11 _setupPopupView];
    [(PDFKitPopupView *)v11 _presentPopupView];
  }

  return v11;
}

- (void)_setupPopupView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->parentAnnotation);
  v3 = [WeakRetained contents];
  if ([WeakRetained isMarkupAnnotationSubtype])
  {
    v4 = +[PDFAnnotation PDFTextColors];
    uint64_t v5 = [WeakRetained markupStyle];
    v6 = v4;
  }
  else
  {
    v7 = [WeakRetained color];
    if (v7) {
      goto LABEL_6;
    }
    id v8 = [WeakRetained popup];
    v7 = [v8 color];

    if (v7) {
      goto LABEL_6;
    }
    v6 = +[PDFAnnotation PDFTextColors];
    v4 = v6;
    uint64_t v5 = 0;
  }
  v7 = [v6 objectAtIndex:v5];

LABEL_6:
  id v9 = +[PDFAnnotation PDFTextColors];
  uint64_t v10 = [v9 indexOfObject:v7];

  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = +[PDFAnnotationDrawing createLigtherColor:withIntensity:](PDFAnnotationDrawing, "createLigtherColor:withIntensity:", [v7 CGColor], 0.05);
  }
  else
  {
    v12 = +[PDFAnnotation PDFTextBorderColors];
    v11 = [v12 objectAtIndex:v10];
  }
  v13 = (UITextView *)objc_alloc_init(MEMORY[0x263F82D60]);
  v14 = self->_private;
  popupTextView = v14->popupTextView;
  v14->popupTextView = v13;

  [(UITextView *)self->_private->popupTextView setDelegate:self];
  if (v3) {
    [(UITextView *)self->_private->popupTextView setText:v3];
  }
  uint64_t v16 = self->_private;
  if (v16->deviceIsiPhone)
  {
    v17 = [MEMORY[0x263F825C8] systemBackgroundColor];
    [(PDFKitPopupView *)self setBackgroundColor:v17];

    [(PDFKitPopupView *)self addSubview:self->_private->popupTextView];
  }
  else if (v16->deviceIsiPad)
  {
    [(UITextView *)v16->popupTextView setBackgroundColor:v7];
    -[UITextView setTextContainerInset:](self->_private->popupTextView, "setTextContainerInset:", 14.0, 14.0, 14.0, 14.0);
    v18 = self->_private->popupTextView;
    v19 = [MEMORY[0x263F825C8] blackColor];
    [(UITextView *)v18 setTextColor:v19];
  }
}

- (void)_presentPopupView_iOS
{
  v2 = self;
  v90[4] = *MEMORY[0x263EF8340];
  v3 = self->_private;
  if (v3->deviceIsiPad)
  {
    v4 = (UIViewController *)objc_alloc_init(MEMORY[0x263F82E10]);
    PDFSizeMake([(UIViewController *)v4 setModalPresentationStyle:7], 300.0, 180.0);
    -[UIViewController setPreferredContentSize:](v4, "setPreferredContentSize:");
    uint64_t v5 = [(UITextView *)v2->_private->popupTextView backgroundColor];
    v6 = [(UIViewController *)v4 view];
    [v6 setBackgroundColor:v5];

    v7 = v2->_private;
    popupController = v7->popupController;
    v7->popupController = v4;
    id v9 = v4;

    uint64_t v10 = [(UIViewController *)v9 popoverPresentationController];
    [v10 setDelegate:v2];
    id WeakRetained = objc_loadWeakRetained((id *)&v2->_private->view);
    [v10 setSourceView:WeakRetained];

    [(PDFKitPopupView *)v2 _popoverControllerSourceRect];
    v87 = v10;
    objc_msgSend(v10, "setSourceRect:");
    [v10 setPermittedArrowDirections:15];
    v12 = [(UIViewController *)v9 view];
    [v12 addSubview:v2->_private->popupTextView];

    v13 = [(UIViewController *)v9 view];
    [v13 setTranslatesAutoresizingMaskIntoConstraints:0];

    [(UITextView *)v2->_private->popupTextView setTranslatesAutoresizingMaskIntoConstraints:0];
    v69 = (void *)MEMORY[0x263F08938];
    v81 = [(UITextView *)v2->_private->popupTextView leadingAnchor];
    v85 = [(UIViewController *)v9 view];
    v83 = [v85 safeAreaLayoutGuide];
    v79 = [v83 leadingAnchor];
    v77 = [v81 constraintEqualToAnchor:v79 constant:0.0];
    v90[0] = v77;
    v73 = [(UITextView *)v2->_private->popupTextView trailingAnchor];
    v75 = [(UIViewController *)v9 view];
    v71 = [v75 safeAreaLayoutGuide];
    v67 = [v71 trailingAnchor];
    v65 = [v73 constraintEqualToAnchor:v67 constant:0.0];
    v90[1] = v65;
    v61 = [(UITextView *)v2->_private->popupTextView topAnchor];
    v63 = [(UIViewController *)v9 view];
    v59 = [v63 safeAreaLayoutGuide];
    v57 = [v59 topAnchor];
    v14 = [v61 constraintEqualToAnchor:v57 constant:0.0];
    v90[2] = v14;
    v15 = [(UITextView *)v2->_private->popupTextView bottomAnchor];
    uint64_t v16 = [(UIViewController *)v9 view];
    v17 = [v16 safeAreaLayoutGuide];
    v18 = [v17 bottomAnchor];
    v19 = [v15 constraintEqualToAnchor:v18 constant:0.0];
    v90[3] = v19;
    objc_super v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v90 count:4];
    [v69 activateConstraints:v20];

    v21 = v87;
    v22 = v9;
  }
  else
  {
    if (!v3->deviceIsiPhone) {
      goto LABEL_6;
    }
    id v23 = objc_alloc_init(MEMORY[0x263F82E10]);
    v24 = [v23 view];
    [v24 addSubview:v2];

    [(PDFKitPopupView *)v2 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UITextView *)v2->_private->popupTextView setTranslatesAutoresizingMaskIntoConstraints:0];
    v54 = (void *)MEMORY[0x263F08938];
    v82 = [(PDFKitPopupView *)v2 leadingAnchor];
    v84 = [v23 view];
    v80 = [v84 leadingAnchor];
    v78 = [v82 constraintEqualToAnchor:v80];
    v89[0] = v78;
    v74 = [(PDFKitPopupView *)v2 trailingAnchor];
    v76 = [v23 view];
    v72 = [v76 trailingAnchor];
    v70 = [v74 constraintEqualToAnchor:v72];
    v89[1] = v70;
    v66 = [(PDFKitPopupView *)v2 topAnchor];
    v68 = [v23 view];
    v64 = [v68 topAnchor];
    v62 = [v66 constraintEqualToAnchor:v64];
    v89[2] = v62;
    v58 = [(PDFKitPopupView *)v2 bottomAnchor];
    v60 = [v23 view];
    v56 = [v60 bottomAnchor];
    v55 = [v58 constraintEqualToAnchor:v56];
    v89[3] = v55;
    v51 = [(UITextView *)v2->_private->popupTextView leadingAnchor];
    v53 = [v23 view];
    v52 = [v53 safeAreaLayoutGuide];
    v50 = [v52 leadingAnchor];
    v49 = [v51 constraintEqualToAnchor:v50 constant:8.0];
    v89[4] = v49;
    v47 = [(UITextView *)v2->_private->popupTextView trailingAnchor];
    v48 = [v23 view];
    v46 = [v48 safeAreaLayoutGuide];
    v45 = [v46 trailingAnchor];
    v44 = [v47 constraintEqualToAnchor:v45 constant:8.0];
    v89[5] = v44;
    v42 = [(UITextView *)v2->_private->popupTextView topAnchor];
    v88 = v23;
    [v23 view];
    v43 = v86 = v2;
    v25 = [v43 safeAreaLayoutGuide];
    v26 = [v25 topAnchor];
    v27 = [v42 constraintEqualToAnchor:v26 constant:8.0];
    v89[6] = v27;
    v28 = [(UITextView *)v86->_private->popupTextView bottomAnchor];
    v29 = [v23 view];
    v30 = [v29 safeAreaLayoutGuide];
    v31 = [v30 bottomAnchor];
    v32 = [v28 constraintEqualToAnchor:v31 constant:8.0];
    v89[7] = v32;
    v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:v89 count:8];
    [v54 activateConstraints:v33];

    v2 = v86;
    id v34 = objc_alloc(MEMORY[0x263F824A8]);
    v35 = PDFKitLocalizedString(@"Done");
    v22 = (UIViewController *)[v34 initWithTitle:v35 style:0 target:v86 action:sel_doneButton_];

    v36 = [v88 navigationItem];
    [v36 setRightBarButtonItem:v22];

    v21 = v88;
    uint64_t v37 = [objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v88];
    v38 = v86->_private;
    v39 = v38->popupController;
    v38->popupController = (UIViewController *)v37;

    [(UIViewController *)v86->_private->popupController setModalPresentationStyle:1];
    id v9 = v86->_private->popupController;
  }
  [(PDFKitPopupView *)v2 _presentViewController:v9];

LABEL_6:
  v40 = [(UITextView *)v2->_private->popupTextView text];
  uint64_t v41 = [v40 length];

  if (!v41) {
    [(UITextView *)v2->_private->popupTextView becomeFirstResponder];
  }
}

- (void)_presentViewController:(id)a3
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->view);
  uint64_t v5 = [WeakRetained parentViewController];

  if (v5) {
    [v5 presentViewController:v6 animated:1 completion:0];
  }
}

- (CGRect)_popoverControllerSourceRect
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->view);
  id v4 = objc_loadWeakRetained((id *)&self->_private->pageView);
  id v5 = objc_loadWeakRetained((id *)&self->_private->parentAnnotation);
  [v5 noteBounds];
  objc_msgSend(v4, "convertRectToPageView:");
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  [WeakRetained visibleRectForPageView:v4];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  v43.size.double height = v20;
  v40.origin.x = v7;
  v40.origin.y = v9;
  v40.size.width = v11;
  v40.size.double height = v13;
  v43.origin.x = v15;
  v43.origin.y = v17;
  v43.size.width = v19;
  double height = v43.size.height;
  CGRect v44 = PDFRectIntersection(v40, v43);
  v41.origin.x = v7;
  v41.origin.y = v9;
  v41.size.width = v11;
  v41.size.double height = v13;
  if (PDFRectEqualToRect(v41, v44)) {
    goto LABEL_12;
  }
  double MinX = PDFRectGetMinX(v7, v9, v11);
  if (MinX < PDFRectGetMinX(v15, v17, v19))
  {
    double v22 = PDFRectGetMinX(v15, v17, v19);
LABEL_6:
    double v7 = v22;
    goto LABEL_7;
  }
  double MaxX = PDFRectGetMaxX(v7, v9, v11);
  if (MaxX > PDFRectGetMaxX(v15, v17, v19))
  {
    double v22 = PDFRectGetMaxX(v15, v17, v19);
    goto LABEL_6;
  }
LABEL_7:
  double MinY = PDFRectGetMinY(v7, v9, v11, v13);
  if (MinY < PDFRectGetMinY(v15, v17, v19, height))
  {
    double v25 = PDFRectGetMinY(v15, v17, v19, height);
LABEL_11:
    double v9 = v25;
    goto LABEL_12;
  }
  double MaxY = PDFRectGetMaxY(v7, v9, v11, v13);
  if (MaxY > PDFRectGetMaxY(v15, v17, v19, height))
  {
    double v25 = PDFRectGetMaxY(v15, v17, v19, height);
    goto LABEL_11;
  }
LABEL_12:
  objc_msgSend(v4, "convertRect:toView:", WeakRetained, v7, v9, v11, v13);
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;

  double v35 = v28;
  double v36 = v30;
  double v37 = v32;
  double v38 = v34;
  result.size.double height = v38;
  result.size.width = v37;
  result.origin.y = v36;
  result.origin.x = v35;
  return result;
}

- (void)prepareForPopoverPresentation:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->view);
  id v4 = [WeakRetained findFirstResponder];
  objc_storeWeak(&self->_private->savedFirstResponder, v4);
}

- (void)popoverPresentationControllerDidDismissPopover:(id)a3
{
  [(PDFKitPopupView *)self _removeControlForAnnotation];
  id WeakRetained = objc_loadWeakRetained(&self->_private->savedFirstResponder);
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    [WeakRetained becomeFirstResponder];
    id WeakRetained = v5;
  }
}

- (void)popoverPresentationController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5
{
  [(PDFKitPopupView *)self _popoverControllerSourceRect];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  v14.origin.x = v6;
  v14.origin.y = v8;
  v14.size.width = v10;
  v14.size.double height = v12;
  if (!PDFRectEqualToRect(*a4, v14))
  {
    a4->origin.x = v7;
    a4->origin.y = v9;
    a4->size.width = v11;
    a4->size.double height = v13;
  }
}

- (BOOL)becomeFirstResponder
{
  return 1;
}

- (void)removeFromSuperview
{
  [(PDFKitPopupView *)self _updateParentContents];
  v3 = self->_private;
  if (v3->deviceIsiPhone)
  {
    popupController = v3->popupController;
    [(UIViewController *)popupController dismissViewControllerAnimated:1 completion:0];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PDFKitPopupView;
    [(PDFKitPopupView *)&v5 removeFromSuperview];
  }
}

- (void)_removeControlForAnnotation
{
  [(PDFKitPopupView *)self _updateParentContents];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->view);
  id v3 = objc_loadWeakRetained((id *)&self->_private->parentAnnotation);
  [WeakRetained removeControlForAnnotation:v3];
}

- (void)_updateParentContents
{
  if (![(NSString *)self->_private->contents length])
  {
    id v3 = self->_private;
    contents = v3->contents;
    v3->contents = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->parentAnnotation);
  [WeakRetained setContents:self->_private->contents withUndo:1];
}

- (void)textViewDidChange:(id)a3
{
  uint64_t v4 = [(UITextView *)self->_private->popupTextView text];
  objc_super v5 = self->_private;
  contents = v5->contents;
  v5->contents = (NSString *)v4;

  MEMORY[0x270F9A758](v4, contents);
}

- (void).cxx_destruct
{
}

@end