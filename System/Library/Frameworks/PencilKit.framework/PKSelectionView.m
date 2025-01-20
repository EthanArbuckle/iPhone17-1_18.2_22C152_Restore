@interface PKSelectionView
- (BOOL)_exactlyOneExternalElementSelected;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canConvertToShapeWithAction:(SEL)a3 withSender:(id)a4 handled:(BOOL *)a5;
- (BOOL)containsPoint:(CGPoint)a3 forInputType:(int64_t)a4;
- (BOOL)dragInteraction:(id)a3 prefersFullSizePreviewsForSession:(id)a4;
- (BOOL)isDragging;
- (BOOL)lassoContainsPoint:(CGPoint)a3;
- (BOOL)supportsSnapToShape;
- (BOOL)wantsDragPlatter;
- (CGAffineTransform)selectionDrawingStrokeTransform;
- (CGAffineTransform)selectionDrawingTransform;
- (CGAffineTransform)userTransform;
- (CGPoint)offsetInTouchView;
- (CGRect)editMenuTargetRect;
- (PKSelectionView)initWithFrame:(CGRect)a3 strokeSelection:(id)a4 selectionController:(id)a5 selectionType:(int64_t)a6;
- (UIDragInteraction)dragInteraction;
- (UILongPressGestureRecognizer)dragGR;
- (UITapGestureRecognizer)doubleTapGR;
- (UITapGestureRecognizer)editMenuGR;
- (id)_accessibilityUserTestingChildren;
- (id)_currentAttachment;
- (id)_selectionViewGestures;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4;
- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4;
- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)keyCommands;
- (id)shapeMenuActions;
- (id)shapeSupportCache;
- (id)targetForAction:(SEL)a3 withSender:(id)a4;
- (int64_t)editingInteractionConfiguration;
- (int64_t)selectionType;
- (void)_cleanupDragState;
- (void)_clearSelection:(id)a3;
- (void)_commitDragToAttachment;
- (void)_dragWillBegin;
- (void)_findTranscriptionWithCompletion:(id)a3;
- (void)_handleDoubleTapInputAtPoint:(CGPoint)a3;
- (void)_resetDragState;
- (void)_setupWindowNotificationsForScene:(id)a3;
- (void)animateViewToOriginalPosition;
- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)convertToShapes:(id)a3;
- (void)copy:(id)a3;
- (void)copyTranscription:(id)a3;
- (void)createSticker:(id)a3;
- (void)cut:(id)a3;
- (void)dealloc;
- (void)delete:(id)a3;
- (void)didBeginDraggingSelection;
- (void)didDoubleTap;
- (void)didEndGestureWithTranslation:(CGPoint)a3;
- (void)dragEnded:(CGPoint)a3;
- (void)dragInteraction:(id)a3 session:(id)a4 willEndWithOperation:(unint64_t)a5;
- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4;
- (void)dragSelection:(id)a3;
- (void)duplicate:(id)a3;
- (void)generateStrokeImageForPasteAndDND;
- (void)hideStrokeImageView;
- (void)insertSpace:(id)a3;
- (void)makeViewAliveAtLocation:(CGPoint)a3;
- (void)paste:(id)a3;
- (void)performDidEndGestureWithTranslation:(CGPoint)a3;
- (void)refine:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setSelectionDrawingStrokeTransform:(CGAffineTransform *)a3;
- (void)setSelectionDrawingTransform:(CGAffineTransform *)a3;
- (void)setSelectionType:(int64_t)a3;
- (void)setUserTransform:(CGAffineTransform *)a3;
- (void)setWantsDragPlatter:(BOOL)a3;
- (void)straighten:(id)a3;
- (void)toggleEditMenu;
- (void)transformBegan;
- (void)transformCancelled;
- (void)transformChanged:(CGAffineTransform *)a3;
- (void)transformEnded;
- (void)translate:(id)a3;
- (void)updateLocationForDrop:(CGPoint)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation PKSelectionView

- (PKSelectionView)initWithFrame:(CGRect)a3 strokeSelection:(id)a4 selectionController:(id)a5 selectionType:(int64_t)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v13 = a4;
  id v14 = a5;
  v42.receiver = self;
  v42.super_class = (Class)PKSelectionView;
  v15 = -[PKAdornmentView initWithFrame:strokeSelection:selectionController:selectionType:](&v42, sel_initWithFrame_strokeSelection_selectionController_selectionType_, v13, v14, a6, x, y, width, height);
  v16 = v15;
  v17 = v15;
  if (v15)
  {
    [(PKSelectionView *)v15 setAccessibilityIdentifier:@"com.apple.pencilkit.selectionView"];
    uint64_t v18 = [objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v17 action:sel_toggleEditMenu];
    editMenuGR = v17->_editMenuGR;
    v17->_editMenuGR = (UITapGestureRecognizer *)v18;

    [(UITapGestureRecognizer *)v17->_editMenuGR setNumberOfTapsRequired:1];
    uint64_t v20 = [objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v17 action:sel_didDoubleTap];
    doubleTapGR = v17->_doubleTapGR;
    v17->_doubleTapGR = (UITapGestureRecognizer *)v20;

    [(UITapGestureRecognizer *)v17->_doubleTapGR setNumberOfTapsRequired:2];
    if (a6) {
      BOOL v22 = a6 == 6;
    }
    else {
      BOOL v22 = 1;
    }
    uint64_t v23 = !v22;
    [(UITapGestureRecognizer *)v17->_doubleTapGR setEnabled:v23];
    v24 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v25 = [v24 userInterfaceIdiom];

    if (v25)
    {
      uint64_t v26 = [objc_alloc(MEMORY[0x1E4FB1708]) initWithDelegate:v17];
      dragInteraction = v17->_dragInteraction;
      v17->_dragInteraction = (UIDragInteraction *)v26;

      [(PKSelectionView *)v17 addInteraction:v17->_dragInteraction];
    }
    uint64_t v28 = [objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:v17 action:sel_dragSelection_];
    dragGR = v17->_dragGR;
    v17->_dragGR = (UILongPressGestureRecognizer *)v28;

    [(UILongPressGestureRecognizer *)v17->_dragGR setName:@"PKSelectionDragGesture"];
    [(UILongPressGestureRecognizer *)v17->_dragGR setMinimumPressDuration:0.0];
    if (PKIsDeviceLocked())
    {
      v30 = v17->_dragInteraction;
      if (v30) {
        [(UIDragInteraction *)v30 setEnabled:0];
      }
    }
    v17->_selectionType = a6;
    v31 = [(PKAdornmentView *)v17 selectionController];
    v32 = [v13 drawing];
    [(PKSelectionController *)(uint64_t)v31 _selectionDrawingTransformForDrawing:(uint64_t)v41];
    long long v34 = v41[1];
    long long v33 = v41[2];
    *(_OWORD *)&v16->_selectionDrawingTransform.a = v41[0];
    *(_OWORD *)&v16->_selectionDrawingTransform.c = v34;
    *(_OWORD *)&v16->_selectionDrawingTransform.tdouble x = v33;

    v35 = [(PKAdornmentView *)v17 selectionController];
    v36 = [v13 drawing];
    v16->_originalStrokeFrame.origin.double x = -[PKSelectionController calculateFrameForSelectionView:inDrawing:]((uint64_t)v35, v13, v36);
    v16->_originalStrokeFrame.origin.double y = v37;
    v16->_originalStrokeFrame.size.double width = v38;
    v16->_originalStrokeFrame.size.double height = v39;
  }
  return v17;
}

- (id)_selectionViewGestures
{
  v5[3] = *MEMORY[0x1E4F143B8];
  editMenuGR = self->_editMenuGR;
  v5[0] = self->_dragGR;
  v5[1] = editMenuGR;
  v5[2] = self->_doubleTapGR;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:3];

  return v3;
}

- (void)dealloc
{
  if (self->_dragInteraction) {
    -[PKSelectionView removeInteraction:](self, "removeInteraction:");
  }
  v3.receiver = self;
  v3.super_class = (Class)PKSelectionView;
  [(PKSelectionView *)&v3 dealloc];
}

- (void)willMoveToWindow:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKSelectionView;
  [(PKSelectionView *)&v11 willMoveToWindow:v4];
  v5 = [(PKAdornmentView *)self selectionRenderer];
  [v5 _setupSelectionAdornment];

  v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 removeObserver:self name:*MEMORY[0x1E4FB2E88] object:0];

  v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 removeObserver:self name:*MEMORY[0x1E4FB2EA8] object:0];

  v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 removeObserver:self name:*MEMORY[0x1E4FB2E90] object:0];

  if (v4)
  {
    [(PKSelectionView *)self becomeFirstResponder];
    v9 = [v4 windowScene];
    [(PKSelectionView *)self _setupWindowNotificationsForScene:v9];
  }
  else
  {
    v9 = [(PKAdornmentView *)self selectionController];
    v10 = -[PKSelectionController selectionInteraction](v9);
    [v10 _willRemoveSelectionView:self];
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(PKSelectionView *)self frame];
  v17.origin.double x = v8;
  v17.origin.double y = v9;
  v17.size.double width = v10;
  v17.size.double height = v11;
  v16.origin.double x = x;
  v16.origin.double y = y;
  v16.size.double width = width;
  v16.size.double height = height;
  BOOL v12 = CGRectEqualToRect(v16, v17);
  v15.receiver = self;
  v15.super_class = (Class)PKSelectionView;
  -[PKSelectionView setFrame:](&v15, sel_setFrame_, x, y, width, height);
  if (!v12)
  {
    id v13 = [(PKAdornmentView *)self selectionController];
    id v14 = -[PKSelectionController selectionInteraction](v13);
    [v14 _didEndDraggingSelection:self];
  }
}

- (void)_setupWindowNotificationsForScene:(id)a3
{
  id v7 = a3;
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel__clearSelection_ name:*MEMORY[0x1E4FB2E88] object:v7];

  v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 addObserver:self selector:sel__clearSelection_ name:*MEMORY[0x1E4FB2EA8] object:v7];

  v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 addObserver:self selector:sel__clearSelection_ name:*MEMORY[0x1E4FB2E90] object:v7];
}

- (void)_clearSelection:(id)a3
{
  id v3 = [(PKAdornmentView *)self selectionController];
  -[PKSelectionController clearSelectionIfNecessaryWithCompletion:]((uint64_t)v3, 0);
}

- (void)generateStrokeImageForPasteAndDND
{
  id v3 = [(PKAdornmentView *)self selectionController];
  id v4 = [(PKAdornmentView *)self strokeSelection];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__PKSelectionView_generateStrokeImageForPasteAndDND__block_invoke;
  v5[3] = &unk_1E64C5618;
  void v5[4] = self;
  -[PKSelectionController generateImageForStrokeSelection:scaleStrategy:highlighted:withCompletion:]((uint64_t)v3, v4, 1, 0, v5);
}

void __52__PKSelectionView_generateStrokeImageForPasteAndDND__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [*(id *)(a1 + 32) strokeSelection];
  [v3 setStrokeImage:v4];
}

- (BOOL)containsPoint:(CGPoint)a3 forInputType:(int64_t)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  if ([(PKSelectionView *)self selectionType] == 6) {
    return 0;
  }
  [(PKSelectionView *)self bounds];
  v69.double x = x;
  v69.double y = y;
  if (!CGRectContainsPoint(v70, v69)) {
    return 0;
  }
  if ([(PKSelectionView *)self selectionType]
    && [(PKSelectionView *)self selectionType] != 6)
  {
    uint64_t v11 = [(PKAdornmentView *)self selectionController];
    BOOL v12 = (void *)v11;
    if (v11) {
      id WeakRetained = objc_loadWeakRetained((id *)(v11 + 120));
    }
    else {
      id WeakRetained = 0;
    }
    objc_msgSend(WeakRetained, "convertPoint:fromView:", self, x, y);
    double v52 = v15;
    double v53 = v14;

    float64x2_t v65 = 0u;
    float64x2_t v66 = 0u;
    float64x2_t v64 = 0u;
    uint64_t v16 = [(PKAdornmentView *)self selectionController];
    CGRect v17 = (void *)v16;
    if (v16) {
      id v18 = objc_loadWeakRetained((id *)(v16 + 120));
    }
    else {
      id v18 = 0;
    }
    v19 = [(PKAdornmentView *)self strokeSelection];
    uint64_t v20 = [v19 drawing];
    if (v18)
    {
      [v18 transformFromViewToStrokeSpaceInDrawing:v20];
    }
    else
    {
      float64x2_t v65 = 0u;
      float64x2_t v66 = 0u;
      float64x2_t v64 = 0u;
    }

    float64x2_t v49 = v65;
    float64x2_t v50 = v66;
    float64x2_t v51 = v64;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    v21 = [(PKAdornmentView *)self strokeSelection];
    BOOL v22 = [v21 strokes];

    uint64_t v23 = [v22 countByEnumeratingWithState:&v60 objects:v67 count:16];
    if (v23)
    {
      float64x2_t v24 = vaddq_f64(v50, vmlaq_n_f64(vmulq_n_f64(v49, v52), v51, v53));
      uint64_t v25 = *(void *)v61;
      if (a4) {
        double v26 = 10.0;
      }
      else {
        double v26 = 20.0;
      }
      float64x2_t v27 = v24;
      while (2)
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v61 != v25) {
            objc_enumerationMutation(v22);
          }
          if ([*(id *)(*((void *)&v60 + 1) + 8 * i) intersectsPoint:*(_OWORD *)&v27 boundsOutset:v26 minimumStrokeThreshold:v26])
          {
            BOOL v8 = 1;
            goto LABEL_28;
          }
        }
        uint64_t v23 = [v22 countByEnumeratingWithState:&v60 objects:v67 count:16];
        if (v23) {
          continue;
        }
        break;
      }
    }
    BOOL v8 = 0;
LABEL_28:
  }
  else
  {
    BOOL v8 = -[PKSelectionView lassoContainsPoint:](self, "lassoContainsPoint:", x, y);
  }
  unsigned __int8 v9 = v8;
  if (!v8)
  {
    uint64_t v29 = [(PKAdornmentView *)self selectionController];
    v30 = (void *)v29;
    if (v29) {
      id v31 = objc_loadWeakRetained((id *)(v29 + 120));
    }
    else {
      id v31 = 0;
    }
    -[PKSelectionView convertPoint:toView:](self, "convertPoint:toView:", v31, x, y);
    double v33 = v32;
    double v35 = v34;

    uint64_t v36 = [(PKAdornmentView *)self selectionController];
    CGFloat v37 = (void *)v36;
    if (v36) {
      id v38 = objc_loadWeakRetained((id *)(v36 + 120));
    }
    else {
      id v38 = 0;
    }
    CGFloat v39 = [(PKAdornmentView *)self strokeSelection];
    v40 = [v39 drawing];
    if (v38)
    {
      [v38 transformFromViewToStrokeSpaceInDrawing:v40];
      double v42 = v55;
      double v41 = v54;
      double v44 = v57;
      double v43 = v56;
      double v45 = v59;
      double v46 = v58;
    }
    else
    {
      double v45 = 0.0;
      double v44 = 0.0;
      double v42 = 0.0;
      double v46 = 0.0;
      double v43 = 0.0;
      double v41 = 0.0;
    }

    v47 = [(PKAdornmentView *)self selectionController];
    v48 = [(PKSelectionView *)self _currentAttachment];
    unsigned __int8 v9 = [(PKSelectionController *)v47 _selectedExternalElementsContainsPoint:v46 + v35 * v43 + v41 * v33 inAttachment:v45 + v35 * v44 + v42 * v33];
  }
  return v9;
}

- (BOOL)lassoContainsPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v6 = [(PKAdornmentView *)self strokeSelection];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;

  double v15 = [(PKAdornmentView *)self selectionController];
  uint64_t v16 = [(PKAdornmentView *)self strokeSelection];
  CGRect v17 = [v16 drawing];
  [(PKSelectionController *)(uint64_t)v15 _selectionDrawingTransformForDrawing:(uint64_t)&v30];
  CGAffineTransform v31 = v30;
  DKD_CGAffineTransformDecompose((uint64_t)&v31, (uint64_t)&v32);
  CGFloat a = v32.a;

  memset(&v32, 0, sizeof(v32));
  CGAffineTransformMakeTranslation(&v32, -v8, -v10);
  memset(&v31, 0, sizeof(v31));
  CGAffineTransformMakeScale(&v31, a, a);
  CGAffineTransform t1 = v32;
  memset(&v29, 0, sizeof(v29));
  CGAffineTransform t2 = v31;
  CGAffineTransformConcat(&v29, &t1, &t2);
  CGAffineTransform v26 = v29;
  v36.origin.CGFloat x = v8;
  v36.origin.CGFloat y = v10;
  v36.size.double width = v12;
  v36.size.double height = v14;
  CGRect v37 = CGRectApplyAffineTransform(v36, &v26);
  if (v37.size.width < 44.0 || v37.size.height < 44.0)
  {
    UIRectGetCenter();
    UIRectCenteredAboutPoint();
    v35.CGFloat x = x;
    v35.CGFloat y = y;
    return CGRectContainsPoint(v38, v35);
  }
  else
  {
    v19 = [(PKAdornmentView *)self selectionRenderer];
    BOOL v20 = v19 == 0;

    if (v20)
    {
      return 0;
    }
    else
    {
      v21 = [(PKAdornmentView *)self selectionRenderer];
      id v22 = [v21 lassoPath];
      uint64_t v23 = (const CGPath *)[v22 CGPath];
      v34.CGFloat x = x;
      v34.CGFloat y = y;
      BOOL v24 = CGPathContainsPoint(v23, 0, v34, 0);
    }
  }
  return v24;
}

- (int64_t)editingInteractionConfiguration
{
  return 0;
}

- (id)keyCommands
{
  v19[5] = *MEMORY[0x1E4F143B8];
  id v18 = _PencilKitBundle();
  CGRect v17 = [v18 localizedStringForKey:@"Copy strokes" value:@"Copy strokes" table:@"Localizable"];
  uint64_t v16 = __30__PKSelectionView_keyCommands__block_invoke(@"c", 0x100000, (uint64_t)sel_copy_, v17);
  v19[0] = v16;
  double v15 = _PencilKitBundle();
  CGFloat v14 = [v15 localizedStringForKey:@"Cut strokes" value:@"Cut strokes" table:@"Localizable"];
  double v13 = __30__PKSelectionView_keyCommands__block_invoke(@"x", 0x100000, (uint64_t)sel_cut_, v14);
  v19[1] = v13;
  v2 = _PencilKitBundle();
  id v3 = [v2 localizedStringForKey:@"Paste strokes" value:@"Paste strokes" table:@"Localizable"];
  id v4 = __30__PKSelectionView_keyCommands__block_invoke(@"v", 0x100000, (uint64_t)sel_paste_, v3);
  v19[2] = v4;
  v5 = _PencilKitBundle();
  v6 = [v5 localizedStringForKey:@"Duplicate strokes" value:@"Duplicate strokes" table:@"Localizable"];
  double v7 = __30__PKSelectionView_keyCommands__block_invoke(@"d", 0x100000, (uint64_t)sel_duplicate_, v6);
  v19[3] = v7;
  double v8 = _PencilKitBundle();
  double v9 = [v8 localizedStringForKey:@"Delete strokes" value:@"Delete strokes" table:@"Localizable"];
  double v10 = __30__PKSelectionView_keyCommands__block_invoke(@"\b", 0, (uint64_t)sel_delete_, v9);
  v19[4] = v10;
  double v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:5];

  return v11;
}

id __30__PKSelectionView_keyCommands__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  double v8 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:a1 modifierFlags:a2 action:a3];
  [v8 setDiscoverabilityTitle:v7];

  return v8;
}

- (BOOL)canBecomeFirstResponder
{
  return [(PKSelectionView *)self selectionType] != 6;
}

- (void)toggleEditMenu
{
  uint64_t v3 = [(PKAdornmentView *)self selectionController];
  id v22 = (id)v3;
  if (v3) {
    id WeakRetained = objc_loadWeakRetained((id *)(v3 + 120));
  }
  else {
    id WeakRetained = 0;
  }
  int v5 = [WeakRetained editMenuVisible];

  uint64_t v6 = [(PKAdornmentView *)self selectionController];
  if (v5)
  {
    id v23 = (id)v6;
    if (v6) {
      id v7 = objc_loadWeakRetained((id *)(v6 + 120));
    }
    else {
      id v7 = 0;
    }
    double v8 = [v7 editMenuInteraction];
    [v8 dismissMenu];
  }
  else
  {
    if (v6)
    {
      int v9 = *(unsigned __int8 *)(v6 + 112);

      if (v9) {
        return;
      }
    }
    if (([(PKSelectionView *)self isFirstResponder] & 1) == 0) {
      [(PKSelectionView *)self becomeFirstResponder];
    }
    id v24 = [(PKAdornmentView *)self selectionRenderer];
    [v24 editMenuLocation];
    double v11 = v10;
    double v13 = v12;

    uint64_t v14 = [(PKAdornmentView *)self selectionController];
    id v25 = (id)v14;
    if (v14) {
      id v15 = objc_loadWeakRetained((id *)(v14 + 120));
    }
    else {
      id v15 = 0;
    }
    -[PKSelectionView convertPoint:toView:](self, "convertPoint:toView:", v15, v11, v13);
    double v17 = v16;
    double v19 = v18;

    objc_msgSend(MEMORY[0x1E4FB1750], "configurationWithIdentifier:sourcePoint:", @"PKEditMenuConfigurationIdentifier", v17, v19);
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v20 = [(PKAdornmentView *)self selectionController];
    id v7 = (id)v20;
    if (v20) {
      double v8 = objc_loadWeakRetained((id *)(v20 + 120));
    }
    else {
      double v8 = 0;
    }
    v21 = [v8 editMenuInteraction];
    [v21 presentEditMenuWithConfiguration:v23];
  }
}

- (CGRect)editMenuTargetRect
{
  uint64_t v3 = [(PKAdornmentView *)self selectionRenderer];
  [v3 editMenuLocation];
  double v5 = v4;
  double v7 = v6;

  if (v5 == *MEMORY[0x1E4F1DAD8] && v7 == *(double *)(MEMORY[0x1E4F1DAD8] + 8)) {
    goto LABEL_8;
  }
  uint64_t v9 = [(PKAdornmentView *)self selectionController];
  double v10 = (void *)v9;
  double v11 = v9 ? *(void **)(v9 + 128) : 0;
  id v12 = v11;
  double v13 = [v12 externalElements];

  if (v13)
  {
LABEL_8:
    [(PKSelectionView *)self bounds];
  }
  else
  {
    double v14 = v5 + -2.5;
    double v15 = v7 + -2.5;
    double v16 = 5.0;
    double v17 = 5.0;
  }
  result.size.double height = v17;
  result.size.double width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (void)cut:(id)a3
{
  id v5 = a3;
  double v4 = [(PKAdornmentView *)self selectionController];
  -[PKSelectionController cut:](v4, v5);
}

- (void)copy:(id)a3
{
  id v5 = a3;
  double v4 = [(PKAdornmentView *)self selectionController];
  -[PKSelectionController copy:](v4, v5);
}

- (void)delete:(id)a3
{
  id v5 = a3;
  double v4 = [(PKAdornmentView *)self selectionController];
  -[PKSelectionController delete:]((uint64_t)v4, v5);
}

- (void)paste:(id)a3
{
  id v5 = a3;
  double v4 = [(PKAdornmentView *)self selectionController];
  -[PKSelectionController paste:]((uint64_t)v4, v5);
}

- (void)duplicate:(id)a3
{
  id v5 = a3;
  double v4 = [(PKAdornmentView *)self selectionController];
  -[PKSelectionController duplicate:](v4);
}

- (void)copyTranscription:(id)a3
{
  id v5 = a3;
  double v4 = [(PKAdornmentView *)self selectionController];
  -[PKSelectionController copyTranscription:]((uint64_t)v4);
}

- (void)createSticker:(id)a3
{
  id v5 = a3;
  double v4 = [(PKAdornmentView *)self selectionController];
  -[PKSelectionController createSticker:]((uint64_t)v4, v5);
}

- (void)translate:(id)a3
{
  id v5 = a3;
  double v4 = [(PKAdornmentView *)self selectionController];
  -[PKSelectionController translate:]((uint64_t)v4);
}

- (void)straighten:(id)a3
{
  id v5 = a3;
  double v4 = [(PKAdornmentView *)self selectionController];
  -[PKSelectionController straighten:]((uint64_t)v4, v5);
}

- (void)refine:(id)a3
{
  id v5 = a3;
  double v4 = [(PKAdornmentView *)self selectionController];
  -[PKSelectionController refine:]((uint64_t)v4, v5);
}

- (void)insertSpace:(id)a3
{
  id v5 = a3;
  double v4 = [(PKAdornmentView *)self selectionController];
  -[PKSelectionController insertSpace:](v4, v5);
}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  if ([(PKSelectionView *)self canPerformAction:a3 withSender:a4]) {
    id v5 = self;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if ([(PKSelectionView *)self selectionType] == 6 || self->_isDragging)
  {
    id v8 = 0;
    goto LABEL_4;
  }
  if (v7 && [v7 type] == 11)
  {
    v22.receiver = self;
    v22.super_class = (Class)PKSelectionView;
    -[PKSelectionView hitTest:withEvent:](&v22, sel_hitTest_withEvent_, v7, x, y);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  v21.receiver = self;
  v21.super_class = (Class)PKSelectionView;
  double v10 = -[PKSelectionView hitTest:withEvent:](&v21, sel_hitTest_withEvent_, v7, x, y);
  double v11 = [v7 touchesForView:v10];
  id v12 = [v11 anyObject];

  BOOL v13 = [v12 type] == 2;
  if (-[PKSelectionView containsPoint:forInputType:](self, "containsPoint:forInputType:", v13, x, y))
  {
    double v14 = self;
  }
  else
  {
    double v15 = [(PKAdornmentView *)self selectionController];
    double v16 = -[PKSelectionController selectionInteraction](v15);
    int v17 = objc_msgSend(v16, "knobsContainPoint:forInputType:", v13, x, y);

    if (v17)
    {
      uint64_t v18 = [(PKAdornmentView *)self selectionController];
      double v19 = (void *)v18;
      if (v18) {
        uint64_t v20 = *(void **)(v18 + 160);
      }
      else {
        uint64_t v20 = 0;
      }
      id v8 = v20;

      goto LABEL_18;
    }
    double v14 = v10;
  }
  id v8 = v14;
LABEL_18:

LABEL_4:

  return v8;
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  double v6 = [(PKAdornmentView *)self selectionController];
  id v7 = -[PKSelectionController selectionInteraction](v6);
  char v8 = [v7 _dragShouldBeginForSession:v5];

  if (v8)
  {
    [v5 locationInView:self];
    self->_offsetInTouchView.double x = v9;
    self->_offsetInTouchView.double y = v10;
    [(PKSelectionView *)self frame];
    self->_originalStrokeFrame.origin.double x = v11;
    self->_originalStrokeFrame.origin.double y = v12;
    self->_originalStrokeFrame.size.double width = v13;
    self->_originalStrokeFrame.size.double height = v14;
    double v15 = [(PKAdornmentView *)self selectionController];
    double v16 = [(PKAdornmentView *)self strokeSelection];
    int v17 = [v16 externalElements];
    uint64_t v18 = [(PKSelectionView *)self _currentAttachment];
    double v19 = -[PKSelectionController _itemProviderForExternalElements:inAttachment:](v15, v17, v18);
    uint64_t v20 = [(PKAdornmentView *)self strokeSelection];
    [v20 setExternalElementsItemProvider:v19];

    id v21 = objc_alloc(MEMORY[0x1E4F28D78]);
    objc_super v22 = [(PKAdornmentView *)self strokeSelection];
    id v23 = (void *)[v21 initWithObject:v22];

    id v24 = (void *)[objc_alloc(MEMORY[0x1E4FB1710]) initWithItemProvider:v23];
    id v25 = [(PKAdornmentView *)self strokeSelection];
    [v5 setLocalContext:v25];

    v28[0] = v24;
    CGAffineTransform v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
  }
  else
  {
    CGAffineTransform v26 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v26;
}

- (BOOL)dragInteraction:(id)a3 prefersFullSizePreviewsForSession:(id)a4
{
  return 1;
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  id v6 = objc_alloc(MEMORY[0x1E4FB1728]);
  [(PKSelectionView *)self bounds];
  CGFloat x = v23.origin.x;
  CGFloat y = v23.origin.y;
  CGFloat width = v23.size.width;
  CGFloat height = v23.size.height;
  double MidX = CGRectGetMidX(v23);
  v24.origin.CGFloat x = x;
  v24.origin.CGFloat y = y;
  v24.size.CGFloat width = width;
  v24.size.CGFloat height = height;
  CGFloat v12 = objc_msgSend(v6, "initWithContainer:center:", self, MidX, CGRectGetMidY(v24));
  id v13 = objc_alloc_init(MEMORY[0x1E4FB1720]);
  CGFloat v14 = [MEMORY[0x1E4FB1618] clearColor];
  [v13 setBackgroundColor:v14];

  id v15 = objc_alloc(MEMORY[0x1E4FB1838]);
  double v16 = [(PKAdornmentView *)self strokeSelection];
  int v17 = [v16 strokeImage];
  uint64_t v18 = [v17 combinedImage];
  double v19 = (void *)[v15 initWithImage:v18];

  [v19 _setContinuousCornerRadius:13.0];
  uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4FB1D40]) initWithView:v19 parameters:v13 target:v12];

  return v20;
}

- (void)transformBegan
{
  uint64_t v3 = [(PKAdornmentView *)self selectionController];
  double v4 = [(PKAdornmentView *)self strokeSelection];
  id v5 = [(PKAdornmentView *)self strokeSelection];
  id v6 = [v5 drawing];
  self->_originalStrokeFrame.origin.CGFloat x = -[PKSelectionController calculateFrameForSelectionView:inDrawing:]((uint64_t)v3, v4, v6);
  self->_originalStrokeFrame.origin.CGFloat y = v7;
  self->_originalStrokeFrame.size.CGFloat width = v8;
  self->_originalStrokeFrame.size.CGFloat height = v9;

  CGFloat v10 = (CGPoint *)MEMORY[0x1E4F1DAD8];
  self->_offsetInTouchView = (CGPoint)*MEMORY[0x1E4F1DAD8];
  long long v11 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  long long v12 = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&self->_resizeTransform.c = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&self->_resizeTransform.tCGFloat x = v11;
  *(_OWORD *)&self->_resizeTransform.CGFloat a = v12;
  self->_currentScrollOffset = *v10;
  [(PKSelectionView *)self _dragWillBegin];
  id v13 = [(PKAdornmentView *)self selectionController];
  -[PKSelectionController didBeginDraggingSelection](v13);

  [(PKSelectionView *)self didBeginDraggingSelection];
}

- (void)transformChanged:(CGAffineTransform *)a3
{
  long long v5 = *(_OWORD *)&a3->c;
  long long v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_resizeTransform.CGFloat a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_resizeTransform.c = v5;
  *(_OWORD *)&self->_resizeTransform.tCGFloat x = v4;
  long long v6 = *(_OWORD *)&a3->c;
  v16[0] = *(_OWORD *)&a3->a;
  v16[1] = v6;
  v16[2] = *(_OWORD *)&a3->tx;
  p_originalStrokeFrame = &self->_originalStrokeFrame;
  *(CGFloat *)&long long v4 = self->_originalStrokeFrame.origin.x;
  *(CGFloat *)&long long v6 = self->_originalStrokeFrame.origin.y;
  CGFloat width = self->_originalStrokeFrame.size.width;
  CGFloat height = self->_originalStrokeFrame.size.height;
  CGFloat MidX = CGRectGetMidX(*(CGRect *)&v4);
  CGFloat MidY = CGRectGetMidY(*p_originalStrokeFrame);
  CGAffineTransformMakeTranslation(&t1, MidX, MidY);
  [(PKSelectionView *)self selectionDrawingStrokeTransform];
  CGAffineTransformConcat(&v15, &t1, &t2);
  DKDTransformInTransformSpace(v16, &v15, &v17);
  CGAffineTransform v12 = v17;
  [(PKSelectionView *)self setTransform:&v12];
}

- (void)transformEnded
{
  +[PKStatisticsManager sharedStatisticsManager]();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PKStatisticsManager recordDragSelection]((uint64_t)v6);

  id v7 = +[PKSelectionStatisticsManager sharedStatisticsManager];
  [v7 logSelectionAction:1];

  uint64_t v3 = [(PKAdornmentView *)self selectionController];
  if (v3)
  {
    long long v5 = *(_OWORD *)&self->_resizeTransform.c;
    long long v4 = *(_OWORD *)&self->_resizeTransform.tx;
    *(_OWORD *)(v3 + 168) = *(_OWORD *)&self->_resizeTransform.a;
    *(_OWORD *)(v3 + 184) = v5;
    *(_OWORD *)(v3 + 200) = v4;
  }

  [(PKSelectionView *)self _cleanupDragState];
  CGFloat v8 = [(PKAdornmentView *)self selectionController];
  -[PKSelectionController didEndDraggingSelection](v8);
}

- (void)dragEnded:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  +[PKStatisticsManager sharedStatisticsManager]();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PKStatisticsManager recordDragSelection]((uint64_t)v6);

  id v7 = +[PKSelectionStatisticsManager sharedStatisticsManager];
  [v7 logSelectionAction:1];

  -[PKSelectionView didEndGestureWithTranslation:](self, "didEndGestureWithTranslation:", x, y);
  CGFloat v8 = [(PKAdornmentView *)self selectionController];
  -[PKSelectionController didEndDraggingSelection](v8);
}

- (void)transformCancelled
{
  [(PKSelectionView *)self _resetDragState];
  uint64_t v3 = [(PKAdornmentView *)self selectionController];
  -[PKSelectionController didEndDraggingSelection](v3);
}

- (void)hideStrokeImageView
{
  v11.receiver = self;
  v11.super_class = (Class)PKSelectionView;
  [(PKAdornmentView *)&v11 hideStrokeImageView];
  uint64_t v3 = [(PKAdornmentView *)self selectionController];
  long long v4 = [(PKAdornmentView *)self strokeSelection];
  -[PKSelectionController setImageOnSelectionViewForStrokeSelection:withCompletion:](v3, v4, 0);

  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v10[0] = *MEMORY[0x1E4F1DAB8];
  v10[1] = v5;
  v10[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [(PKSelectionView *)self setTransform:v10];
  id v6 = [(PKAdornmentView *)self selectionController];
  id v7 = [(PKAdornmentView *)self strokeSelection];
  CGFloat v8 = [(PKAdornmentView *)self strokeSelection];
  CGFloat v9 = [v8 drawing];
  -[PKSelectionView setFrame:](self, "setFrame:", -[PKSelectionController calculateFrameForSelectionView:inDrawing:]((uint64_t)v6, v7, v9));
}

- (void)dragSelection:(id)a3
{
  id v4 = a3;
  long long v5 = [(PKAdornmentView *)self selectionController];
  if (!v5 || (int v6 = v5[112], v5, !v6))
  {
    id v7 = [(PKAdornmentView *)self selectionController];
    CGFloat v8 = -[PKSelectionController topView](v7);

    [v4 locationInView:v8];
    double v10 = v9;
    double v12 = v11;
    double x = self->_initialDragPosition.x;
    double y = self->_initialDragPosition.y;
    CGAffineTransform v15 = [(PKSelectionView *)self _currentAttachment];
    if ([v4 state] == 1)
    {
      self->_initialDragPosition.double x = v10;
      self->_initialDragPosition.double y = v12;
      [(PKSelectionView *)self transformBegan];
    }
    else
    {
      double v16 = v10 - x;
      double v17 = v12 - y;
      if ([v4 state] == 2)
      {
        double v18 = self->_originalStrokeFrame.origin.x;
        double v19 = self->_originalStrokeFrame.origin.y;
        [(PKSelectionView *)self frame];
        CGFloat v21 = v20;
        double v46 = v17;
        [(PKSelectionView *)self frame];
        CGFloat height = v51.size.height;
        CGFloat v23 = v16 + v18;
        CGFloat v24 = v46 + v19;
        v51.origin.double x = v16 + v18;
        v51.origin.double y = v24;
        v51.size.CGFloat width = v21;
        double MidX = CGRectGetMidX(v51);
        v52.origin.double x = v23;
        v52.origin.double y = v24;
        v52.size.CGFloat width = v21;
        v52.size.CGFloat height = height;
        -[PKSelectionView setCenter:](self, "setCenter:", MidX, CGRectGetMidY(v52));
        CGAffineTransform v26 = [(PKAdornmentView *)self selectionController];
        double v27 = [(PKSelectionController *)(uint64_t)v26 autoscrollForPointIfNecessary:v12];
        double v29 = v28;

        double v30 = v29 + self->_currentScrollOffset.y;
        self->_currentScrollOffset.double x = v27 + self->_currentScrollOffset.x;
        self->_currentScrollOffset.double y = v30;
        if (v15) {
          [v15 drawingTransform];
        }
        else {
          memset(&v49, 0, sizeof(v49));
        }
        CGAffineTransformInvert(&v50, &v49);
        double a = v50.a;
        double b = v50.b;
        double c = v50.c;
        double d = v50.d;
        tdouble x = v50.tx;
        tdouble y = v50.ty;
        double v42 = [(PKAdornmentView *)self selectionController];
        double v43 = [(PKAdornmentView *)self strokeSelection];
        double v44 = [v43 externalElements];
        long long v45 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
        *(_OWORD *)&v47.double a = *MEMORY[0x1E4F1DAB8];
        *(_OWORD *)&v47.double c = v45;
        *(_OWORD *)&v47.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
        CGAffineTransformTranslate(&v48, &v47, tx + (v46 - v30) * c + a * v16, ty + (v46 - v30) * d + b * v16);
        -[PKSelectionController _didDragExternalElements:withTransform:inAttachment:](v42, v44, &v48, v15);
      }
      else if ([v4 state] == 3)
      {
        -[PKSelectionView dragEnded:](self, "dragEnded:", v16, v12 - y);
        if (v16 == *MEMORY[0x1E4F1DAD8] && v17 == *(double *)(MEMORY[0x1E4F1DAD8] + 8))
        {
          uint64_t v32 = [(PKAdornmentView *)self selectionController];
          uint64_t v33 = (void *)v32;
          id v34 = v32 ? objc_loadWeakRetained((id *)(v32 + 120)) : 0;
          char v35 = [v34 editMenuVisible];

          if ((v35 & 1) == 0) {
            [(PKSelectionView *)self toggleEditMenu];
          }
        }
      }
      else if ([v4 state] == 4 || objc_msgSend(v4, "state") == 5)
      {
        [(PKSelectionView *)self transformCancelled];
      }
    }
  }
}

- (void)performDidEndGestureWithTranslation:(CGPoint)a3
{
  v77[5] = *MEMORY[0x1E4F143B8];
  double y = self->_originalStrokeFrame.origin.y;
  double x = self->_originalStrokeFrame.origin.x;
  double c = self->_resizeTransform.c;
  double b = self->_resizeTransform.b;
  tdouble x = self->_resizeTransform.tx;
  double d = self->_resizeTransform.d;
  double a = self->_resizeTransform.a;
  tdouble y = self->_resizeTransform.ty;
  id v7 = (void *)MEMORY[0x1E4F29238];
  [(PKSelectionView *)self center];
  v75[0] = v8;
  v75[1] = v9;
  double v10 = [v7 valueWithBytes:v75 objCType:"{CGPoint=dd}"];
  v77[0] = v10;
  double v11 = (void *)MEMORY[0x1E4F29238];
  [(PKSelectionView *)self frame];
  CGFloat v12 = v78.origin.x;
  CGFloat v13 = v78.origin.y;
  CGFloat width = v78.size.width;
  CGFloat height = v78.size.height;
  CGFloat MaxX = CGRectGetMaxX(v78);
  v79.origin.double x = v12;
  v79.origin.double y = v13;
  v79.size.CGFloat width = width;
  v79.size.CGFloat height = height;
  *(CGFloat *)v74 = MaxX;
  v74[1] = CGRectGetMaxY(v79);
  double v17 = [v11 valueWithBytes:v74 objCType:"{CGPoint=dd}"];
  v77[1] = v17;
  double v18 = (void *)MEMORY[0x1E4F29238];
  [(PKSelectionView *)self frame];
  CGFloat v19 = v80.origin.x;
  CGFloat v20 = v80.origin.y;
  CGFloat v21 = v80.size.width;
  CGFloat v22 = v80.size.height;
  CGFloat v23 = CGRectGetMaxX(v80);
  v81.origin.double x = v19;
  v81.origin.double y = v20;
  v81.size.CGFloat width = v21;
  v81.size.CGFloat height = v22;
  *(CGFloat *)v73 = v23;
  v73[1] = CGRectGetMinY(v81);
  CGFloat v24 = [v18 valueWithBytes:v73 objCType:"{CGPoint=dd}"];
  v77[2] = v24;
  id v25 = (void *)MEMORY[0x1E4F29238];
  [(PKSelectionView *)self frame];
  CGFloat v26 = v82.origin.x;
  CGFloat v27 = v82.origin.y;
  CGFloat v28 = v82.size.width;
  CGFloat v29 = v82.size.height;
  CGFloat MinX = CGRectGetMinX(v82);
  v83.origin.double x = v26;
  v83.origin.double y = v27;
  v83.size.CGFloat width = v28;
  v83.size.CGFloat height = v29;
  *(CGFloat *)v72 = MinX;
  v72[1] = CGRectGetMinY(v83);
  CGAffineTransform v31 = [v25 valueWithBytes:v72 objCType:"{CGPoint=dd}"];
  v77[3] = v31;
  uint64_t v32 = (void *)MEMORY[0x1E4F29238];
  [(PKSelectionView *)self frame];
  CGFloat v33 = v84.origin.x;
  CGFloat v34 = v84.origin.y;
  CGFloat v35 = v84.size.width;
  CGFloat v36 = v84.size.height;
  CGFloat v37 = CGRectGetMinX(v84);
  v85.origin.double x = v33;
  v85.origin.double y = v34;
  v85.size.CGFloat width = v35;
  v85.size.CGFloat height = v36;
  *(CGFloat *)v71 = v37;
  v71[1] = CGRectGetMaxY(v85);
  CGRect v38 = [v32 valueWithBytes:v71 objCType:"{CGPoint=dd}"];
  v77[4] = v38;
  CGFloat v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v77 count:5];

  char v70 = 0;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v40 = v39;
  uint64_t v41 = [v40 countByEnumeratingWithState:&v66 objects:v76 count:16];
  if (v41)
  {
    uint64_t v42 = *(void *)v67;
    while (2)
    {
      for (uint64_t i = 0; i != v41; ++i)
      {
        if (*(void *)v67 != v42) {
          objc_enumerationMutation(v40);
        }
        double v44 = *(void **)(*((void *)&v66 + 1) + 8 * i);
        long long v45 = [(PKAdornmentView *)self selectionController];
        [v44 CGPointValue];
        LOBYTE(v44) = [(PKSelectionController *)(uint64_t)v45 _isValidDropPointForStrokes:v46 didInsertNewAttachment:v47];

        if (v44)
        {
          int v48 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v41 = [v40 countByEnumeratingWithState:&v66 objects:v76 count:16];
      if (v41) {
        continue;
      }
      break;
    }
  }
  int v48 = 0;
LABEL_11:

  CGAffineTransform v49 = [(PKSelectionView *)self _currentAttachment];
  if (!v48) {
    goto LABEL_13;
  }
  CGAffineTransform v50 = [(PKAdornmentView *)self selectionController];
  CGRect v51 = [(PKAdornmentView *)self strokeSelection];
  CGRect v52 = [v51 externalElements];
  double v53 = tx + (a3.y + y) * c + a * (a3.x + x);
  char v54 = [(PKSelectionController *)(uint64_t)v50 _externalElements:v49 locationOutOfBounds:v53 inAttachment:ty + (a3.y + y) * d + b * (a3.x + x)];

  if ((v54 & 1) == 0)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__PKSelectionView_performDidEndGestureWithTranslation___block_invoke;
    block[3] = &unk_1E64C55F0;
    block[4] = self;
    *(double *)&block[5] = v53;
    *(double *)&block[6] = ty + (a3.y + y) * d + b * (a3.x + x);
    dispatch_block_t v55 = dispatch_block_create((dispatch_block_flags_t)0, block);
    id finishDragToAttachmentBlock = self->_finishDragToAttachmentBlock;
    self->_id finishDragToAttachmentBlock = v55;

    if (v70)
    {
      dispatch_time_t v57 = dispatch_time(0, 1000000000);
      v64[0] = MEMORY[0x1E4F143A8];
      v64[1] = 3221225472;
      v64[2] = __55__PKSelectionView_performDidEndGestureWithTranslation___block_invoke_2;
      v64[3] = &unk_1E64C5368;
      v64[4] = self;
      dispatch_after(v57, MEMORY[0x1E4F14428], v64);
    }
    else
    {
      [(PKSelectionView *)self _commitDragToAttachment];
    }
  }
  else
  {
LABEL_13:
    [(PKSelectionView *)self _resetDragState];
  }
}

uint64_t __55__PKSelectionView_performDidEndGestureWithTranslation___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) selectionController];
  [(PKSelectionController *)(uint64_t)v2 didMoveStrokeSelectionToLocation:*(double *)(a1 + 48)];

  uint64_t v3 = [*(id *)(a1 + 32) selectionController];
  id v4 = [*(id *)(a1 + 32) strokeSelection];
  long long v5 = [v4 externalElements];
  int v6 = [*(id *)(a1 + 32) _currentAttachment];
  -[PKSelectionController _didEndDraggingExternalElements:inAttachment:](v3, v5, v6);

  id v7 = *(void **)(a1 + 32);

  return [v7 _cleanupDragState];
}

uint64_t __55__PKSelectionView_performDidEndGestureWithTranslation___block_invoke_2(uint64_t result)
{
  if (*(void *)(*(void *)(result + 32) + 584))
  {
    uint64_t v1 = result;
    v2 = os_log_create("com.apple.pencilkit", "");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v3 = 0;
      _os_log_fault_impl(&dword_1C44F8000, v2, OS_LOG_TYPE_FAULT, "Text attachment was not created at the bottom of the note in time for the selection drag to finish", v3, 2u);
    }

    return [*(id *)(v1 + 32) _commitDragToAttachment];
  }
  return result;
}

- (void)didEndGestureWithTranslation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  int v6 = [(PKAdornmentView *)self selectionRenderer];

  if (v6)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __48__PKSelectionView_didEndGestureWithTranslation___block_invoke;
    v8[3] = &unk_1E64C5368;
    v8[4] = self;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __48__PKSelectionView_didEndGestureWithTranslation___block_invoke_2;
    v7[3] = &unk_1E64C54D8;
    v7[4] = self;
    *(double *)&v7[5] = x;
    *(double *)&v7[6] = y;
    [MEMORY[0x1E4FB1EB0] _animateUsingDefaultTimingWithOptions:4 animations:v8 completion:v7];
  }
  else
  {
    -[PKSelectionView performDidEndGestureWithTranslation:](self, "performDidEndGestureWithTranslation:", x, y);
  }
}

void __48__PKSelectionView_didEndGestureWithTranslation___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) selectionRenderer];
  [v1 _didEndDraggingSelection];
}

uint64_t __48__PKSelectionView_didEndGestureWithTranslation___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performDidEndGestureWithTranslation:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (void)_commitDragToAttachment
{
  id finishDragToAttachmentBlock = (void (**)(id, SEL))self->_finishDragToAttachmentBlock;
  if (finishDragToAttachmentBlock)
  {
    finishDragToAttachmentBlock[2](finishDragToAttachmentBlock, a2);
    id v4 = self->_finishDragToAttachmentBlock;
    self->_id finishDragToAttachmentBlock = 0;
  }
}

- (void)_resetDragState
{
  uint64_t v3 = (long long *)MEMORY[0x1E4F1DAB8];
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v13[0] = *MEMORY[0x1E4F1DAB8];
  v13[1] = v4;
  v13[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [(PKSelectionView *)self setTransform:v13];
  -[PKSelectionView setFrame:](self, "setFrame:", self->_originalStrokeFrame.origin.x, self->_originalStrokeFrame.origin.y, self->_originalStrokeFrame.size.width, self->_originalStrokeFrame.size.height);
  long long v10 = *v3;
  long long v11 = v3[1];
  long long v12 = v3[2];
  uint64_t v5 = [(PKAdornmentView *)self selectionController];
  if (v5)
  {
    *(_OWORD *)(v5 + 168) = v10;
    *(_OWORD *)(v5 + 184) = v11;
    *(_OWORD *)(v5 + 200) = v12;
  }

  int v6 = [(PKAdornmentView *)self selectionController];
  id v7 = [(PKAdornmentView *)self strokeSelection];
  uint64_t v8 = [v7 externalElements];
  uint64_t v9 = [(PKSelectionView *)self _currentAttachment];
  -[PKSelectionController _resetExternalElements:inAttachment:](v6, v8, v9);

  [(PKSelectionView *)self _cleanupDragState];
}

- (void)_cleanupDragState
{
  self->_isDragging = 0;
}

- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4
{
  -[PKSelectionView setAlpha:](self, "setAlpha:", a3, a4, 0.3);
  uint64_t v5 = +[PKStatisticsManager sharedStatisticsManager]();
  -[PKStatisticsManager recordDragAndDropSelection]((uint64_t)v5);

  [(PKSelectionView *)self _resetDragState];
  int v6 = [(PKAdornmentView *)self selectionController];
  id v7 = [(PKAdornmentView *)self strokeSelection];
  uint64_t v8 = [v7 externalElements];
  uint64_t v9 = [(PKSelectionView *)self _currentAttachment];
  -[PKSelectionController _dragInteractionWillBeginForExternalElements:inAttachment:](v6, v8, v9);

  [(PKSelectionView *)self _dragWillBegin];
}

- (void)_dragWillBegin
{
  uint64_t v3 = [(PKAdornmentView *)self selectionController];
  long long v4 = (void *)v3;
  if (v3) {
    id WeakRetained = objc_loadWeakRetained((id *)(v3 + 120));
  }
  else {
    id WeakRetained = 0;
  }
  int v6 = [WeakRetained editMenuVisible];

  if (v6) {
    [(PKSelectionView *)self toggleEditMenu];
  }
  [(PKAdornmentView *)self _liftStrokesOutOfTiledView];
  id v7 = [(PKAdornmentView *)self selectionRenderer];
  [v7 _didBeginDraggingSelection];

  self->_isDragging = 1;
}

- (void)makeViewAliveAtLocation:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(PKSelectionView *)self frame];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __43__PKSelectionView_makeViewAliveAtLocation___block_invoke;
  _OWORD v10[3] = &unk_1E64C5500;
  v10[4] = self;
  *(CGFloat *)&v10[5] = x;
  *(CGFloat *)&v10[6] = y;
  v10[7] = v6;
  v10[8] = v7;
  v10[9] = v8;
  v10[10] = v9;
  [MEMORY[0x1E4FB1EB0] _animateUsingDefaultTimingWithOptions:4 animations:v10 completion:0];
}

uint64_t __43__PKSelectionView_makeViewAliveAtLocation___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40) - *(double *)(*(void *)(a1 + 32) + 640), *(double *)(a1 + 48) - *(double *)(*(void *)(a1 + 32) + 648), *(double *)(a1 + 72), *(double *)(a1 + 80));
  v2 = *(void **)(a1 + 32);

  return [v2 setAlpha:1.0];
}

- (void)animateViewToOriginalPosition
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __48__PKSelectionView_animateViewToOriginalPosition__block_invoke;
  v2[3] = &unk_1E64C5368;
  v2[4] = self;
  [MEMORY[0x1E4FB1EB0] _animateUsingDefaultTimingWithOptions:4 animations:v2 completion:0];
}

uint64_t __48__PKSelectionView_animateViewToOriginalPosition__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(*(void *)(a1 + 32) + 464), *(double *)(*(void *)(a1 + 32) + 472), *(double *)(*(void *)(a1 + 32) + 480), *(double *)(*(void *)(a1 + 32) + 488));
}

- (void)dragInteraction:(id)a3 session:(id)a4 willEndWithOperation:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  self->_isDragging = 0;
  if ((a5 & 0xFFFFFFFFFFFFFFFDLL) != 0)
  {
    v14[4] = self;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __64__PKSelectionView_dragInteraction_session_willEndWithOperation___block_invoke_3;
    v15[3] = &unk_1E64C5368;
    v15[4] = self;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __64__PKSelectionView_dragInteraction_session_willEndWithOperation___block_invoke_4;
    v14[3] = &unk_1E64C5528;
    [MEMORY[0x1E4FB1EB0] _animateUsingDefaultTimingWithOptions:4 animations:v15 completion:v14];
  }
  else
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __64__PKSelectionView_dragInteraction_session_willEndWithOperation___block_invoke;
    v17[3] = &unk_1E64C5368;
    v17[4] = self;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __64__PKSelectionView_dragInteraction_session_willEndWithOperation___block_invoke_2;
    _OWORD v16[3] = &unk_1E64C5528;
    v16[4] = self;
    [MEMORY[0x1E4FB1EB0] _animateUsingDefaultTimingWithOptions:4 animations:v17 completion:v16];
  }
  long long v10 = [(PKAdornmentView *)self selectionController];
  long long v11 = [(PKAdornmentView *)self strokeSelection];
  long long v12 = [v11 externalElements];
  CGFloat v13 = [(PKSelectionView *)self _currentAttachment];
  -[PKSelectionController _dragInteractionWillEndForExternalElements:withOperation:inAttachment:](v10, v12, a5, v13);
}

void __64__PKSelectionView_dragInteraction_session_willEndWithOperation___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(*(void *)(a1 + 32) + 464), *(double *)(*(void *)(a1 + 32) + 472), *(double *)(*(void *)(a1 + 32) + 480), *(double *)(*(void *)(a1 + 32) + 488));
  [*(id *)(a1 + 32) setAlpha:1.0];
  id v2 = [*(id *)(a1 + 32) selectionRenderer];
  [v2 _didEndDraggingSelection];
}

uint64_t __64__PKSelectionView_dragInteraction_session_willEndWithOperation___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cleanupDragState];
}

void __64__PKSelectionView_dragInteraction_session_willEndWithOperation___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  id v2 = [*(id *)(a1 + 32) selectionRenderer];
  [v2 _didEndDraggingSelection];
}

uint64_t __64__PKSelectionView_dragInteraction_session_willEndWithOperation___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cleanupDragState];
}

- (void)updateLocationForDrop:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(PKSelectionView *)self frame];
  double v6 = x - self->_offsetInTouchView.x;
  double v7 = y - self->_offsetInTouchView.y;

  -[PKSelectionView setFrame:](self, "setFrame:", v6, v7);
}

- (void)didBeginDraggingSelection
{
  uint64_t v2 = [(PKAdornmentView *)self selectionController];
  uint64_t v3 = (void *)v2;
  if (v2) {
    id WeakRetained = objc_loadWeakRetained((id *)(v2 + 120));
  }
  else {
    id WeakRetained = 0;
  }
  id v9 = [WeakRetained scrollView];

  uint64_t v5 = [v9 panGestureRecognizer];
  uint64_t v6 = [v5 state];

  if (v6 != 2)
  {
    double v7 = [v9 panGestureRecognizer];
    [v7 setEnabled:0];

    id v8 = [v9 panGestureRecognizer];
    [v8 setEnabled:1];
  }
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5 = a3;
  uint64_t v6 = [(PKAdornmentView *)self strokeSelection];
  double v7 = [v6 externalElements];

  if (v7)
  {
    if ([(PKSelectionView *)self _exactlyOneExternalElementSelected])
    {
      id v8 = [(PKAdornmentView *)self selectionController];
      id v9 = [(PKAdornmentView *)self strokeSelection];
      long long v10 = [v9 externalElements];
      long long v11 = [v10 firstObject];
      long long v12 = [(PKSelectionView *)self _currentAttachment];
      CGFloat v13 = -[PKSelectionController _contextMenuInteraction:configurationForExternalElement:inAttachment:](v8, v5, v11, v12);
    }
    else
    {
      CGFloat v14 = (void *)MEMORY[0x1E4FB13F0];
      CGAffineTransform v15 = _PencilKitBundle();
      double v16 = [v15 localizedStringForKey:@"Copy" value:@"Copy" table:@"Localizable"];
      double v17 = [MEMORY[0x1E4FB1818] systemImageNamed:@"doc.on.doc"];
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __73__PKSelectionView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
      v40[3] = &unk_1E64C5550;
      v40[4] = self;
      double v18 = [v14 actionWithTitle:v16 image:v17 identifier:0 handler:v40];

      CGFloat v19 = (void *)MEMORY[0x1E4FB13F0];
      CGFloat v20 = _PencilKitBundle();
      CGFloat v21 = [v20 localizedStringForKey:@"Share" value:@"Share" table:@"Localizable"];
      CGFloat v22 = [MEMORY[0x1E4FB1818] systemImageNamed:@"square.and.arrow.up"];
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __73__PKSelectionView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2;
      v39[3] = &unk_1E64C5550;
      v39[4] = self;
      CGFloat v23 = [v19 actionWithTitle:v21 image:v22 identifier:0 handler:v39];

      CGFloat v24 = (void *)MEMORY[0x1E4FB13F0];
      id v25 = _PencilKitBundle();
      CGFloat v26 = [v25 localizedStringForKey:@"Delete" value:@"Delete" table:@"Localizable"];
      CGFloat v27 = [MEMORY[0x1E4FB1818] systemImageNamed:@"trash"];
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __73__PKSelectionView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_4;
      v38[3] = &unk_1E64C5550;
      v38[4] = self;
      CGFloat v28 = [v24 actionWithTitle:v26 image:v27 identifier:0 handler:v38];

      [v28 setAttributes:2];
      CGFloat v29 = (void *)MEMORY[0x1E4FB1678];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __73__PKSelectionView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_5;
      v34[3] = &unk_1E64C5578;
      id v30 = v18;
      id v35 = v30;
      id v31 = v23;
      id v36 = v31;
      id v32 = v28;
      id v37 = v32;
      CGFloat v13 = [v29 configurationWithIdentifier:0 previewProvider:0 actionProvider:v34];
    }
    self->_displayingContextMenu = v13 != 0;
  }
  else
  {
    CGFloat v13 = 0;
  }

  return v13;
}

void __73__PKSelectionView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) selectionController];
  -[PKSelectionController copy:](v2, *(void **)(a1 + 32));
}

void __73__PKSelectionView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2(uint64_t a1)
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__PKSelectionView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_3;
  aBlock[3] = &unk_1E64C5368;
  aBlock[4] = *(void *)(a1 + 32);
  id v1 = (void (**)(void))_Block_copy(aBlock);
  if ([MEMORY[0x1E4F29060] isMainThread]) {
    v1[2](v1);
  }
  else {
    dispatch_sync(MEMORY[0x1E4F14428], v1);
  }
}

void __73__PKSelectionView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_3(uint64_t a1)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F42718]);
  uint64_t v3 = [*(id *)(a1 + 32) strokeSelection];
  long long v4 = [v3 strokeImage];
  id v5 = [v4 combinedImage];
  v12[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  double v7 = (void *)[v2 initWithActivityItems:v6 applicationActivities:0];

  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = [v7 popoverPresentationController];
  [v9 setSourceView:v8];

  [v7 setModalTransitionStyle:0];
  long long v10 = [*(id *)(a1 + 32) window];
  long long v11 = [v10 rootViewController];
  [v11 presentViewController:v7 animated:1 completion:0];
}

void __73__PKSelectionView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) selectionController];
  -[PKSelectionController delete:]((uint64_t)v2, *(void **)(a1 + 32));
}

id __73__PKSelectionView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_5(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v1 = (void *)MEMORY[0x1E4FB1970];
  long long v5 = *(_OWORD *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v5 count:3];
  uint64_t v3 = [v1 menuWithTitle:@"Edit Selection" children:v2];

  return v3;
}

- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PKSelectionView *)self _exactlyOneExternalElementSelected])
  {
    uint64_t v8 = [(PKAdornmentView *)self selectionController];
    id v9 = [(PKAdornmentView *)self strokeSelection];
    long long v10 = [v9 externalElements];
    long long v11 = [v10 firstObject];
    long long v12 = [(PKSelectionView *)self _currentAttachment];
    CGFloat v13 = -[PKSelectionController _contextMenuInteraction:previewForHighlightingMenuWithConfiguration:forExternalElement:inAttachment:](v8, v6, v7, v11, v12);
  }
  else
  {
    id v14 = objc_alloc(MEMORY[0x1E4FB1B38]);
    [(PKSelectionView *)self bounds];
    CGFloat x = v26.origin.x;
    CGFloat y = v26.origin.y;
    CGFloat width = v26.size.width;
    CGFloat height = v26.size.height;
    double MidX = CGRectGetMidX(v26);
    v27.origin.CGFloat x = x;
    v27.origin.CGFloat y = y;
    v27.size.CGFloat width = width;
    v27.size.CGFloat height = height;
    uint64_t v8 = (id *)objc_msgSend(v14, "initWithContainer:center:", self, MidX, CGRectGetMidY(v27));
    id v9 = objc_alloc_init(MEMORY[0x1E4FB1B28]);
    id v20 = objc_alloc(MEMORY[0x1E4FB1838]);
    CGFloat v21 = [(PKAdornmentView *)self strokeSelection];
    CGFloat v22 = [v21 strokeImage];
    CGFloat v23 = [v22 combinedImage];
    long long v10 = (void *)[v20 initWithImage:v23];

    [v10 _setContinuousCornerRadius:13.0];
    CGFloat v13 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:v10 parameters:v9 target:v8];
  }

  return v13;
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v15 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([(PKSelectionView *)self _exactlyOneExternalElementSelected])
  {
    long long v10 = [(PKAdornmentView *)self selectionController];
    long long v11 = [(PKAdornmentView *)self strokeSelection];
    long long v12 = [v11 externalElements];
    CGFloat v13 = [v12 firstObject];
    id v14 = [(PKSelectionView *)self _currentAttachment];
    -[PKSelectionController _contextMenuInteraction:willDisplayMenuForConfiguration:animator:forExternalElement:inAttachment:](v10, v15, v8, v9, v13, v14);
  }
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v15 = a3;
  id v8 = a4;
  id v9 = a5;
  self->_displayingContextMenu = 0;
  if ([(PKSelectionView *)self _exactlyOneExternalElementSelected])
  {
    long long v10 = [(PKAdornmentView *)self selectionController];
    long long v11 = [(PKAdornmentView *)self strokeSelection];
    long long v12 = [v11 externalElements];
    CGFloat v13 = [v12 firstObject];
    id v14 = [(PKSelectionView *)self _currentAttachment];
    -[PKSelectionController _contextMenuInteraction:willEndForConfiguration:animator:forExternalElement:inAttachment:](v10, v15, v8, v9, v13, v14);
  }
}

- (BOOL)_exactlyOneExternalElementSelected
{
  uint64_t v3 = [(PKAdornmentView *)self strokeSelection];
  long long v4 = [v3 strokes];
  if ([v4 count])
  {
    BOOL v5 = 0;
  }
  else
  {
    id v6 = [(PKAdornmentView *)self strokeSelection];
    id v7 = [v6 externalElements];
    BOOL v5 = [v7 count] == 1;
  }
  return v5;
}

- (void)didDoubleTap
{
  doubleTapGR = self->_doubleTapGR;
  uint64_t v4 = [(PKAdornmentView *)self selectionController];
  BOOL v5 = (void *)v4;
  if (v4) {
    id WeakRetained = objc_loadWeakRetained((id *)(v4 + 120));
  }
  else {
    id WeakRetained = 0;
  }
  [(UITapGestureRecognizer *)doubleTapGR locationInView:WeakRetained];
  double v8 = v7;
  double v10 = v9;

  -[PKSelectionView _handleDoubleTapInputAtPoint:](self, "_handleDoubleTapInputAtPoint:", v8, v10);
}

- (void)_handleDoubleTapInputAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(UITapGestureRecognizer *)self->_doubleTapGR touches];
  double v7 = [v6 firstObject];
  uint64_t v8 = [v7 type];

  BOOL v9 = v8 == 2;
  double v10 = [(PKAdornmentView *)self selectionController];
  long long v11 = -[PKSelectionController _drawingForSelectionRect:]((uint64_t)v10, x, y, 5.0, 5.0);

  uint64_t v12 = [(PKAdornmentView *)self selectionController];
  CGFloat v13 = (void *)v12;
  if (v12) {
    id WeakRetained = objc_loadWeakRetained((id *)(v12 + 120));
  }
  else {
    id WeakRetained = 0;
  }
  objc_msgSend(WeakRetained, "pointInStrokeSpace:inDrawing:", v11, x, y);
  double v16 = v15;
  double v18 = v17;

  int64_t selectionType = self->_selectionType;
  if (selectionType != 5)
  {
    id v20 = [(PKAdornmentView *)self selectionController];
    CGFloat v21 = [(PKAdornmentView *)self strokeSelection];
    CGFloat v22 = [v21 strokes];
    CGFloat v23 = [v22 array];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __48__PKSelectionView__handleDoubleTapInputAtPoint___block_invoke;
    v24[3] = &unk_1E64C55A0;
    uint64_t v26 = (int)selectionType + 1;
    v24[4] = self;
    id v25 = v11;
    [(PKSelectionController *)(uint64_t)v20 fetchStrokesToSelectAtPoint:v26 inDrawing:v9 withSelectionType:v23 inputType:v24 existingSelection:v16 completion:v18];
  }
}

void __48__PKSelectionView__handleDoubleTapInputAtPoint___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = +[PKSelectionStatisticsManager sharedStatisticsManager];
  objc_msgSend(v3, "recordSmartSelectionEventWithType:contentType:gestureInvoked:", *(void *)(a1 + 48), objc_msgSend(v6, "contentType"), 1);

  uint64_t v4 = [*(id *)(a1 + 32) selectionController];
  BOOL v5 = [v6 intersectedStrokes];
  -[PKSelectionController selectStrokes:forSelectionType:inDrawing:](v4, v5, *(void *)(a1 + 48), *(void **)(a1 + 40));
}

- (id)_currentAttachment
{
  uint64_t v3 = [(PKAdornmentView *)self selectionController];
  uint64_t v4 = (void *)v3;
  if (v3) {
    id WeakRetained = objc_loadWeakRetained((id *)(v3 + 120));
  }
  else {
    id WeakRetained = 0;
  }
  id v6 = [(PKAdornmentView *)self strokeSelection];
  double v7 = [v6 drawing];
  uint64_t v8 = [v7 uuid];
  BOOL v9 = [WeakRetained attachmentForUUID:v8];

  return v9;
}

- (void)_findTranscriptionWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PKAdornmentView *)self selectionController];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__PKSelectionView__findTranscriptionWithCompletion___block_invoke;
  v7[3] = &unk_1E64C55C8;
  v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  -[PKSelectionController findTranscriptionWithCompletion:]((uint64_t)v5, v7);
}

void __52__PKSelectionView__findTranscriptionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 transcription];
  [*(id *)(a1 + 32) setAccessibilityValue:v3];

  uint64_t v4 = *(void *)(a1 + 40);
  BOOL v5 = [v6 transcription];
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
}

- (id)_accessibilityUserTestingChildren
{
  uint64_t v3 = [(PKAdornmentView *)self selectionRenderer];

  if (v3)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F1CA48];
    v11.receiver = self;
    v11.super_class = (Class)PKSelectionView;
    BOOL v5 = [(PKSelectionView *)&v11 _accessibilityUserTestingChildren];
    id v6 = [v4 arrayWithArray:v5];

    double v7 = [(PKAdornmentView *)self selectionRenderer];
    id v8 = [v7 _accessibilityUserTestingChildren];
    [v6 addObjectsFromArray:v8];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)PKSelectionView;
    id v6 = [(PKSelectionView *)&v10 _accessibilityUserTestingChildren];
  }

  return v6;
}

- (BOOL)isDragging
{
  return self->_isDragging;
}

- (CGPoint)offsetInTouchView
{
  double x = self->_offsetInTouchView.x;
  double y = self->_offsetInTouchView.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGAffineTransform)selectionDrawingTransform
{
  long long v3 = *(_OWORD *)&self[14].a;
  *(_OWORD *)&retstr->double a = *(_OWORD *)&self[13].tx;
  *(_OWORD *)&retstr->double c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[14].c;
  return self;
}

- (void)setSelectionDrawingTransform:(CGAffineTransform *)a3
{
  long long v4 = *(_OWORD *)&a3->c;
  long long v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_selectionDrawingTransform.double a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_selectionDrawingTransform.double c = v4;
  *(_OWORD *)&self->_selectionDrawingTransform.tdouble x = v3;
}

- (CGAffineTransform)selectionDrawingStrokeTransform
{
  long long v3 = *(_OWORD *)&self[15].a;
  *(_OWORD *)&retstr->double a = *(_OWORD *)&self[14].tx;
  *(_OWORD *)&retstr->double c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[15].c;
  return self;
}

- (void)setSelectionDrawingStrokeTransform:(CGAffineTransform *)a3
{
  long long v4 = *(_OWORD *)&a3->c;
  long long v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_selectionDrawingStrokeTransform.double a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_selectionDrawingStrokeTransform.double c = v4;
  *(_OWORD *)&self->_selectionDrawingStrokeTransform.tdouble x = v3;
}

- (BOOL)wantsDragPlatter
{
  return self->_wantsDragPlatter;
}

- (void)setWantsDragPlatter:(BOOL)a3
{
  self->_wantsDragPlatter = a3;
}

- (UILongPressGestureRecognizer)dragGR
{
  return self->_dragGR;
}

- (UITapGestureRecognizer)editMenuGR
{
  return self->_editMenuGR;
}

- (UITapGestureRecognizer)doubleTapGR
{
  return self->_doubleTapGR;
}

- (UIDragInteraction)dragInteraction
{
  return self->_dragInteraction;
}

- (int64_t)selectionType
{
  return self->_selectionType;
}

- (void)setSelectionType:(int64_t)a3
{
  self->_int64_t selectionType = a3;
}

- (CGAffineTransform)userTransform
{
  long long v3 = *(_OWORD *)&self[16].a;
  *(_OWORD *)&retstr->double a = *(_OWORD *)&self[15].tx;
  *(_OWORD *)&retstr->double c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[16].c;
  return self;
}

- (void)setUserTransform:(CGAffineTransform *)a3
{
  long long v4 = *(_OWORD *)&a3->c;
  long long v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_userTransform.double a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_userTransform.double c = v4;
  *(_OWORD *)&self->_userTransform.tdouble x = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dragInteraction, 0);
  objc_storeStrong((id *)&self->_doubleTapGR, 0);
  objc_storeStrong((id *)&self->_editMenuGR, 0);
  objc_storeStrong((id *)&self->_dragGR, 0);
  objc_storeStrong(&self->_finishDragToAttachmentBlock, 0);

  objc_storeStrong((id *)&self->_previewProvider, 0);
}

- (BOOL)supportsSnapToShape
{
  id v2 = [(PKSelectionView *)self shapeSupportCache];
  long long v3 = v2;
  if (v2) {
    id v2 = (void *)v2[1];
  }
  BOOL v4 = [v2 count] != 0;

  return v4;
}

- (id)shapeMenuActions
{
  long long v3 = [MEMORY[0x1E4F1CA48] array];
  BOOL v4 = [(PKSelectionView *)self shapeSupportCache];
  BOOL v5 = v4;
  if (v4) {
    BOOL v4 = (void *)v4[1];
  }
  if ([v4 count])
  {
    if (v5) {
      id v6 = (void *)v5[1];
    }
    else {
      id v6 = 0;
    }
    double v7 = +[PKShape snapToShapeActionNameForNumShapes:](PKShape, "snapToShapeActionNameForNumShapes:", [v6 count]);
    id v8 = (void *)MEMORY[0x1E4FB13F0];
    BOOL v9 = [MEMORY[0x1E4FB1818] systemImageNamed:@"star"];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __49__PKSelectionView_ShapeSupport__shapeMenuActions__block_invoke;
    v12[3] = &unk_1E64CAE68;
    v12[4] = self;
    objc_super v10 = [v8 actionWithTitle:v7 image:v9 identifier:0 handler:v12];

    [v3 addObject:v10];
  }

  return v3;
}

uint64_t __49__PKSelectionView_ShapeSupport__shapeMenuActions__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) convertToShapes:0];
}

- (id)shapeSupportCache
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PKAdornmentView *)self selectionController];
  BOOL v4 = (void *)v3;
  if (v3) {
    id WeakRetained = objc_loadWeakRetained((id *)(v3 + 120));
  }
  else {
    id WeakRetained = 0;
  }

  if (![WeakRetained allowSnapToShape])
  {
    id v8 = 0;
    goto LABEL_37;
  }
  id v6 = [(PKAdornmentView *)self strokeSelection];
  double v7 = [v6 strokes];

  if ([v7 count] && (unint64_t)objc_msgSend(v7, "count") <= 8)
  {
    id v8 = objc_getAssociatedObject(self, (const void *)shapeSupportCache_kAssociatedObjectKey);
    if (v8) {
      goto LABEL_36;
    }
    object = self;
    [WeakRetained inputScale];
    double v10 = v9;
    value = objc_alloc_init(PKSelectionViewShapeSupportCache);
    objc_super v11 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    uint64_t v12 = objc_alloc_init(PKShapeDrawingController);
    CGFloat v13 = v12;
    if (v12) {
      v12->_shapeRecognitionOn = 1;
    }
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    CGFloat v29 = v7;
    id v14 = v7;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (!v15)
    {
LABEL_24:

      uint64_t v22 = [v11 count];
      id v8 = value;
      if (v22 == [v14 count])
      {
        CGFloat v23 = (void *)[v11 copy];
        if (value) {
          objc_storeStrong((id *)&value->_shapes, v23);
        }

        CGFloat v24 = [v14 array];
        if (value) {
          objc_storeStrong((id *)&value->_originalStrokes, v24);
        }

        if ([v11 count] == 1)
        {
          id v25 = [v11 firstObject];
          uint64_t v26 = [v25 type];
          if (value) {
            value->_shapeType = v26;
          }
        }
        else if (value)
        {
          value->_shapeType = 0;
        }
      }
      objc_setAssociatedObject(object, (const void *)shapeSupportCache_kAssociatedObjectKey, value, (void *)0x301);

      double v7 = v29;
      goto LABEL_36;
    }
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v33;
LABEL_13:
    uint64_t v18 = 0;
    while (1)
    {
      if (*(void *)v33 != v17) {
        objc_enumerationMutation(v14);
      }
      CGFloat v19 = *(void **)(*((void *)&v32 + 1) + 8 * v18);
      if ([v19 _shapeType]) {
        goto LABEL_22;
      }
      id v20 = [v19 _strokeData];
      if (![v20 hasValidPointTimestampData]) {
        goto LABEL_21;
      }
      CGFloat v21 = [v19 _strokeMask];

      if (!v21) {
        break;
      }
LABEL_22:
      if (v16 == ++v18)
      {
        uint64_t v16 = [v14 countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (!v16) {
          goto LABEL_24;
        }
        goto LABEL_13;
      }
    }
    memset(v31, 0, sizeof(v31));
    id v20 = -[PKShapeDrawingController shapeFromStroke:inputScale:averageInputPoint:allowedShapeTypes:]((uint64_t)v13, v19, v31, 0, v10);
    if (v20) {
      [v11 addObject:v20];
    }
LABEL_21:

    goto LABEL_22;
  }
  id v8 = 0;
LABEL_36:

LABEL_37:

  return v8;
}

- (BOOL)canConvertToShapeWithAction:(SEL)a3 withSender:(id)a4 handled:(BOOL *)a5
{
  id v8 = a4;
  if (sel_convertToShapes_ == a3)
  {
    objc_super v11 = [(PKSelectionView *)self shapeSupportCache];
    uint64_t v12 = v11;
    if (v11) {
      objc_super v11 = (void *)v11[1];
    }
    BOOL v9 = [v11 count] != 0;

    if (a5) {
      goto LABEL_3;
    }
  }
  else
  {
    BOOL v9 = 0;
    if (a5) {
LABEL_3:
    }
      *a5 = sel_convertToShapes_ == a3;
  }

  return v9;
}

- (void)convertToShapes:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(PKSelectionView *)self shapeSupportCache];
  BOOL v5 = (void *)v4;
  if (v4)
  {
    id v6 = *(id *)(v4 + 16);
    double v7 = (void *)v5[1];
  }
  else
  {
    id v6 = 0;
    double v7 = 0;
  }
  id v8 = v7;
  uint64_t v9 = [(PKAdornmentView *)self selectionController];
  double v10 = (void *)v9;
  if (v9) {
    id WeakRetained = objc_loadWeakRetained((id *)(v9 + 120));
  }
  else {
    id WeakRetained = 0;
  }

  uint64_t v12 = [(PKAdornmentView *)self strokeSelection];
  CGFloat v13 = [v12 drawing];

  if ([v6 count])
  {
    uint64_t v14 = [v6 count];
    if (v14 == [v8 count] && v13 && WeakRetained)
    {
      long long v34 = v5;
      id v31 = v13;
      long long v32 = WeakRetained;
      if (v5) {
        uint64_t v15 = (void *)v5[1];
      }
      else {
        uint64_t v15 = 0;
      }
      id v16 = v15;
      id v30 = +[PKShape snapToShapeActionNameForNumShapes:](PKShape, "snapToShapeActionNameForNumShapes:", [v16 count]);

      uint64_t v17 = +[PKSelectionStatisticsManager sharedStatisticsManager];
      [v17 logSelectionAction:8];

      uint64_t v18 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v33 = v8;
      id v19 = v8;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v41 objects:v45 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v42;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v42 != v22) {
              objc_enumerationMutation(v19);
            }
            CGFloat v24 = *(void **)(*((void *)&v41 + 1) + 8 * i);
            id v25 = +[PKStatisticsManager sharedStatisticsManager]();
            -[PKStatisticsManager recordCreateShapeWithType:fromMenu:multiple:]((uint64_t)v25, [v24 type], 1, (unint64_t)objc_msgSend(v19, "count") > 1);

            uint64_t v26 = [v24 strokes];
            [v18 addObjectsFromArray:v26];
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v41 objects:v45 count:16];
        }
        while (v21);
      }

      CGRect v27 = [(PKAdornmentView *)self selectionController];
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __49__PKSelectionView_ShapeSupport__convertToShapes___block_invoke;
      v35[3] = &unk_1E64C9280;
      CGFloat v13 = v31;
      id v36 = v31;
      id v37 = v6;
      id v38 = v18;
      id v39 = v30;
      id WeakRetained = v32;
      id v40 = v32;
      id v28 = v30;
      id v29 = v18;
      -[PKSelectionController clearSelectionIfNecessaryWithCompletion:]((uint64_t)v27, v35);

      BOOL v5 = v34;
      id v8 = v33;
    }
  }
}

void __49__PKSelectionView_ShapeSupport__convertToShapes___block_invoke(uint64_t a1)
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) undoableDeleteStrokes:*(void *)(a1 + 40)];
  uint64_t v3 = [*(id *)(a1 + 32) undoableAddNewStrokes:*(void *)(a1 + 48)];
  [v2 setActionName:*(void *)(a1 + 56)];
  [v3 setActionName:*(void *)(a1 + 56)];
  uint64_t v4 = *(void **)(a1 + 64);
  BOOL v5 = [v4 canvasView];
  v10[0] = v3;
  v10[1] = v2;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  [v4 canvasView:v5 registerUndoCommands:v6];

  [*(id *)(a1 + 64) didChangeDrawing:*(void *)(a1 + 32)];
  double v7 = *(void **)(a1 + 64);
  uint64_t v9 = *(void *)(a1 + 32);
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:1];
  [v7 _selectionRefreshWithChangeToDrawings:v8 completion:&__block_literal_global_80];
}

@end