@interface AKHighlightColorEditorController
- (AKCalloutBar)calloutBar;
- (BOOL)canPresentInPosition:(int)a3;
- (BOOL)p_shouldShowCompactMenu;
- (BOOL)p_shouldShowShareButton;
- (UIAlertController)alertController;
- (UIButton)addNoteButton;
- (UIButton)deleteButton;
- (UIButton)rightArrowButton;
- (UIButton)shareButton;
- (UIView)colorControls;
- (id)localizedAccessibilityStringForStyle:(int64_t)a3;
- (id)p_buildPaletteImageForFrontTag:(int64_t)a3 middleTag:(int64_t)a4 backTag:(int64_t)a5 pageTheme:(int)a6;
- (id)p_colorControlImageForColor:(id)a3;
- (id)p_colorControlImageForColor:(id)a3 withForegroundImage:(id)a4;
- (id)p_colorControlImageForTag:(int64_t)a3 pageTheme:(int)a4;
- (id)p_colorControlUnderlineImageForPageTheme:(int)a3;
- (id)p_colorForTag:(int64_t)a3 pageTheme:(int)a4;
- (id)p_monochromaticImageFromImage:(id)a3 withColor:(id)a4;
- (id)p_noteGlyphForTag:(int64_t)a3 pageTheme:(int)a4;
- (id)p_paletteImageForTag:(int64_t)a3 pageTheme:(int)a4;
- (id)p_paletteImageWithFrontColor:(id)a3 middleColor:(id)a4 backColor:(id)a5 frontForegroundImage:(id)a6;
- (id)p_themeForStyle:(int64_t)a3 pageTheme:(int)a4;
- (id)p_underlineForegroundImageForPageTheme:(int)a3;
- (int)pageTheme;
- (int64_t)p_buttonTagForTheme:(id)a3;
- (void)didShow;
- (void)handleAddNoteButton:(id)a3;
- (void)handleDeleteButtonTap:(id)a3;
- (void)handleRightArrowButton:(id)a3;
- (void)handleShareButton:(id)a3;
- (void)loadView;
- (void)p_drawColorControlCircleWithFrame:(CGRect)a3 color:(id)a4;
- (void)p_drawCrescentWithCircleRect:(CGRect)a3 color:(id)a4 leftShift:(double)a5 addRadius:(double)a6;
- (void)p_postDeleteConfirmation;
- (void)p_removeAnnotation:(id)a3;
- (void)p_setStyle:(int64_t)a3 forAnnotation:(id)a4;
- (void)p_updateAppearance;
- (void)presentFromRect:(CGRect)a3 view:(id)a4;
- (void)releaseOutlets;
- (void)setAddNoteButton:(id)a3;
- (void)setAlertController:(id)a3;
- (void)setCalloutBar:(id)a3;
- (void)setColorControls:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeleteButton:(id)a3;
- (void)setPageTheme:(int)a3;
- (void)setPosition:(int)a3;
- (void)setRightArrowButton:(id)a3;
- (void)setShareButton:(id)a3;
- (void)showColorControlsMenu:(id)a3;
- (void)useColorOf:(id)a3;
- (void)viewDidLoad;
- (void)willShow;
@end

@implementation AKHighlightColorEditorController

- (void)releaseOutlets
{
  v7.receiver = self;
  v7.super_class = (Class)AKHighlightColorEditorController;
  [(AKAnnotationPopoverViewController *)&v7 releaseOutlets];
  [(AKHighlightColorEditorController *)self setCalloutBar:0];
  [(AKHighlightColorEditorController *)self setColorControls:0];
  v3 = [(AKHighlightColorEditorController *)self addNoteButton];
  [v3 removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];

  [(AKHighlightColorEditorController *)self setAddNoteButton:0];
  v4 = [(AKHighlightColorEditorController *)self deleteButton];
  [v4 removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];

  [(AKHighlightColorEditorController *)self setDeleteButton:0];
  v5 = [(AKHighlightColorEditorController *)self rightArrowButton];
  [v5 removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];

  [(AKHighlightColorEditorController *)self setRightArrowButton:0];
  v6 = [(AKHighlightColorEditorController *)self shareButton];
  [v6 removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];

  [(AKHighlightColorEditorController *)self setShareButton:0];
  [(AKHighlightColorEditorController *)self setAlertController:0];
}

- (void)loadView
{
  id v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", 0.0, 0.0, 435.0, 55.0);
  [(AKHighlightColorEditorController *)self setView:v3];
}

- (void)viewDidLoad
{
  v52.receiver = self;
  v52.super_class = (Class)AKHighlightColorEditorController;
  [(AKAnnotationPopoverViewController *)&v52 viewDidLoad];
  id v3 = [AKCalloutBar alloc];
  v4 = [(AKHighlightColorEditorController *)self view];
  [v4 bounds];
  v5 = -[AKCalloutBar initWithFrame:](v3, "initWithFrame:");

  [(AKCalloutBar *)v5 setAutoresizingMask:18];
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  objc_super v7 = [(AKAnnotationPopoverViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    v8 = [(AKAnnotationPopoverViewController *)self annotation];
    int v51 = [v7 editorController:self isRightArrowEnabledForAnnotation:v8];
  }
  else
  {
    int v51 = 1;
  }
  if ([(AKHighlightColorEditorController *)self p_shouldShowCompactMenu])
  {
    v9 = [(AKAnnotationPopoverViewController *)self annotationTheme];
    int64_t v10 = [(AKHighlightColorEditorController *)self p_buttonTagForTheme:v9];

    v11 = [AKFingerPotView alloc];
    double v12 = *MEMORY[0x263F001A8];
    double v13 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v14 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v15 = *(double *)(MEMORY[0x263F001A8] + 24);
    v16 = -[AKFingerPotView initWithFrame:](v11, "initWithFrame:", *MEMORY[0x263F001A8], v13, v14, v15);
    v17 = [(AKHighlightColorEditorController *)self p_paletteImageForTag:v10 pageTheme:[(AKHighlightColorEditorController *)self pageTheme]];
    [(AKFingerPotView *)v16 setImage:v17 forState:0];

    [(AKFingerPotView *)v16 addTarget:self action:sel_showColorControlsMenu_ forControlEvents:64];
    -[AKFingerPotView setFrame:](v16, "setFrame:", 0.0, 0.0, 40.0, 38.0);
    v18 = +[AKController akBundle];
    v19 = [v18 localizedStringForKey:@"Selection_Menu_Colors" value:@"Colors…" table:@"AKHighlightColorEditorController"];
    [(AKFingerPotView *)v16 setAccessibilityLabel:v19];
  }
  else
  {
    v16 = [(AKHighlightColorEditorController *)self colorControls];
    double v12 = *MEMORY[0x263F001A8];
    double v13 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v14 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v15 = *(double *)(MEMORY[0x263F001A8] + 24);
  }
  [v6 addObject:v16];
  v20 = -[AKFingerPotView initWithFrame:]([AKFingerPotView alloc], "initWithFrame:", v12, v13, v14, v15);
  v21 = [MEMORY[0x263F1C6B0] akImageNamed:@"ib_text_pop_icon_trash"];
  [(AKFingerPotView *)v20 setImage:v21 forState:0];

  [(AKFingerPotView *)v20 addTarget:self action:sel_handleDeleteButtonTap_ forControlEvents:64];
  -[AKFingerPotView setFrame:](v20, "setFrame:", 0.0, 0.0, 40.0, 38.0);
  v22 = +[AKController akBundle];
  v23 = [v22 localizedStringForKey:@"Selection_Menu_Delete_Highlight" value:@"Remove Highlight" table:@"AKHighlightColorEditorController"];
  [(AKFingerPotView *)v20 setAccessibilityLabel:v23];

  [(AKHighlightColorEditorController *)self setDeleteButton:v20];
  [v6 addObject:v20];
  v24 = +[AKCalloutButton buttonWithType:0];
  mAddNoteButton = self->mAddNoteButton;
  self->mAddNoteButton = v24;

  v26 = self->mAddNoteButton;
  v27 = [(AKHighlightColorEditorController *)self p_noteGlyphForTag:1 pageTheme:[(AKHighlightColorEditorController *)self pageTheme]];
  [(UIButton *)v26 setImage:v27 forState:0];

  [(UIButton *)self->mAddNoteButton addTarget:self action:sel_handleAddNoteButton_ forControlEvents:64];
  -[UIButton setFrame:](self->mAddNoteButton, "setFrame:", 0.0, 0.0, 40.0, 38.0);
  v28 = +[AKController akBundle];
  v29 = [v28 localizedStringForKey:@"Selection_Menu_Annotate" value:@"Note" table:@"AKHighlightColorEditorController"];
  [(UIButton *)self->mAddNoteButton setAccessibilityLabel:v29];

  [v6 addObject:self->mAddNoteButton];
  if ([(AKHighlightColorEditorController *)self p_shouldShowShareButton])
  {
    v30 = +[AKCalloutButton buttonWithType:0];
    mShareButton = self->mShareButton;
    self->mShareButton = v30;

    v32 = [MEMORY[0x263F1C6B0] akImageNamed:@"ib_text_pop_icon_actions"];
    [(UIButton *)self->mShareButton setImage:v32 forState:0];
    [(UIButton *)self->mShareButton addTarget:self action:sel_handleShareButton_ forControlEvents:64];
    -[UIButton setFrame:](self->mShareButton, "setFrame:", 0.0, 0.0, 40.0, 38.0);
    v33 = +[AKController akBundle];
    v34 = [v33 localizedStringForKey:@"Selection_Menu_Share" value:@"Share" table:@"AKHighlightColorEditorController"];
    [(UIButton *)self->mShareButton setAccessibilityLabel:v34];

    [v6 addObject:self->mShareButton];
  }
  if (v51)
  {
    v35 = +[AKCalloutButton buttonWithType:0];
    v36 = [MEMORY[0x263F1C6B0] akImageNamed:@"ib_text_pop_icon_more"];
    [v35 setImage:v36 forState:0];

    [v35 addTarget:self action:sel_handleRightArrowButton_ forControlEvents:64];
    objc_msgSend(v35, "setFrame:", 0.0, 0.0, 40.0, 38.0);
    v37 = +[AKController akBundle];
    v38 = [v37 localizedStringForKey:@"Selection_Menu_More" value:@"More" table:@"AKHighlightColorEditorController"];
    [v35 setAccessibilityLabel:v38];

    [(AKHighlightColorEditorController *)self setRightArrowButton:v35];
    [v6 addObject:v35];
  }
  [(AKCalloutBar *)v5 setControls:v6];
  [(AKCalloutBar *)v5 sizeThatFitsControls:v6];
  double v40 = v39;
  double v42 = v41;
  if ([(AKHighlightColorEditorController *)self p_shouldShowCompactMenu])
  {
    id v43 = objc_alloc(MEMORY[0x263EFF8C0]);
    v44 = [(AKHighlightColorEditorController *)self colorControls];
    v45 = objc_msgSend(v43, "initWithObjects:", v44, 0);

    [(AKCalloutBar *)v5 sizeThatFitsControls:v45];
    if (v40 < v46) {
      double v40 = v46;
    }
  }
  -[AKCalloutBar setFrame:](v5, "setFrame:", 0.0, 0.0, v40, v42);
  [(AKCalloutBar *)v5 frame];
  double Width = CGRectGetWidth(v53);
  [(AKCalloutBar *)v5 frame];
  double Height = CGRectGetHeight(v54);
  v49 = [(AKHighlightColorEditorController *)self view];
  objc_msgSend(v49, "setFrame:", 0.0, 0.0, Width, Height);

  v50 = [(AKHighlightColorEditorController *)self view];
  [v50 addSubview:v5];

  [(AKHighlightColorEditorController *)self setCalloutBar:v5];
  [(AKHighlightColorEditorController *)self p_updateAppearance];
}

- (BOOL)p_shouldShowShareButton
{
  id v3 = [(AKAnnotationPopoverViewController *)self delegate];
  if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    v4 = [(AKAnnotationPopoverViewController *)self annotation];
    char v5 = [v3 editorController:self isSharingEnabledForAnnotation:v4];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)p_shouldShowCompactMenu
{
  id v3 = [MEMORY[0x263F1C920] mainScreen];
  v4 = [v3 traitCollection];

  BOOL v5 = 1;
  id v6 = [MEMORY[0x263F1CB00] traitCollectionWithHorizontalSizeClass:1];
  char v7 = [v4 containsTraitsInCollection:v6];

  if ((v7 & 1) == 0) {
    BOOL v5 = [(AKHighlightColorEditorController *)self p_shouldShowShareButton];
  }

  return v5;
}

- (UIView)colorControls
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  mColorControls = self->mColorControls;
  if (!mColorControls)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x263F1CB60]);
    BOOL v5 = self->mColorControls;
    self->mColorControls = v4;

    id v6 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"Yellow", @"Green", @"Blue", @"Pink", @"Purple", @"Underline", 0);
    long long v22 = 0u;
    long long v23 = 0u;
    if ([(AKHighlightColorEditorController *)self p_shouldShowCompactMenu]) {
      double v7 = 0.0;
    }
    else {
      double v7 = 2.0;
    }
    long long v24 = 0uLL;
    long long v25 = 0uLL;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v23;
      double v12 = *MEMORY[0x263F001A8];
      double v13 = *(double *)(MEMORY[0x263F001A8] + 8);
      double v14 = *(double *)(MEMORY[0x263F001A8] + 16);
      double v15 = *(double *)(MEMORY[0x263F001A8] + 24);
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v17 = [v8 indexOfObject:*(void *)(*((void *)&v22 + 1) + 8 * i)] + 1;
          v18 = -[AKFingerPotView initWithFrame:]([AKFingerPotView alloc], "initWithFrame:", v12, v13, v14, v15);
          v19 = [(AKHighlightColorEditorController *)self p_colorControlImageForTag:v17 pageTheme:[(AKHighlightColorEditorController *)self pageTheme]];
          [(AKFingerPotView *)v18 setMenuImage:v19];

          v20 = [(AKHighlightColorEditorController *)self localizedAccessibilityStringForStyle:v17];
          [(AKFingerPotView *)v18 setAccessibilityLabel:v20];

          [(AKFingerPotView *)v18 addTarget:self action:sel_useColorOf_ forControlEvents:64];
          -[AKFingerPotView setFrame:](v18, "setFrame:", v7, 0.0, 38.0, 38.0);
          [(AKFingerPotView *)v18 setTag:v17];
          [(UIView *)self->mColorControls addSubview:v18];
          double v7 = v7 + 42.0;
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v10);
    }

    -[UIView setFrame:](self->mColorControls, "setFrame:", 0.0, 0.0, v7 + -5.0, 38.0);
    mColorControls = self->mColorControls;
  }

  return mColorControls;
}

- (int64_t)p_buttonTagForTheme:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int64_t v4 = 3;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int64_t v4 = 2;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int64_t v4 = 1;
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int64_t v4 = 4;
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            int64_t v4 = 5;
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              int64_t v4 = 6;
            }
            else {
              int64_t v4 = 0;
            }
          }
        }
      }
    }
  }

  return v4;
}

- (void)p_updateAppearance
{
  if ([(AKHighlightColorEditorController *)self isViewLoaded])
  {
    id v3 = [(AKAnnotationPopoverViewController *)self annotationTheme];
    int64_t v4 = [(AKHighlightColorEditorController *)self p_buttonTagForTheme:v3];

    for (uint64_t i = 1; i != 7; ++i)
    {
      id v6 = [(UIView *)self->mColorControls viewWithTag:i];
      [v6 setSelected:v4 == i];
    }
    mAddNoteButton = self->mAddNoteButton;
    id v8 = [(AKHighlightColorEditorController *)self p_noteGlyphForTag:v4 pageTheme:[(AKHighlightColorEditorController *)self pageTheme]];
    [(UIButton *)mAddNoteButton setImage:v8 forState:0];

    BOOL v9 = self->super.mPosition == 1;
    id v10 = [(AKHighlightColorEditorController *)self calloutBar];
    [v10 setUp:v9];
  }
}

- (BOOL)canPresentInPosition:(int)a3
{
  return a3 == 0;
}

- (void)willShow
{
  v4.receiver = self;
  v4.super_class = (Class)AKHighlightColorEditorController;
  [(AKAnnotationPopoverViewController *)&v4 willShow];
  id v3 = [(AKHighlightColorEditorController *)self calloutBar];
  [v3 setBlurDisabled:1];
}

- (void)didShow
{
  v4.receiver = self;
  v4.super_class = (Class)AKHighlightColorEditorController;
  [(AKAnnotationPopoverViewController *)&v4 didShow];
  id v3 = [(AKHighlightColorEditorController *)self calloutBar];
  [v3 setBlurDisabled:0];
}

- (void)presentFromRect:(CGRect)a3 view:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v21.receiver = self;
  v21.super_class = (Class)AKHighlightColorEditorController;
  id v9 = a4;
  -[AKAnnotationPopoverViewController presentFromRect:view:](&v21, sel_presentFromRect_view_, v9, x, y, width, height);
  id v10 = [(AKHighlightColorEditorController *)self calloutBar];
  objc_msgSend(v9, "convertRect:toView:", v10, x, y, width, height);
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;

  v22.origin.double x = v12;
  v22.origin.double y = v14;
  v22.size.double width = v16;
  v22.size.double height = v18;
  double MidX = CGRectGetMidX(v22);
  v20 = [(AKHighlightColorEditorController *)self calloutBar];
  [v20 setArrowX:MidX];
}

- (void)setPosition:(int)a3
{
  self->super.mPosition = a3;
  [(AKHighlightColorEditorController *)self p_updateAppearance];
}

- (id)localizedAccessibilityStringForStyle:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      id v3 = +[AKController akBundle];
      objc_super v4 = v3;
      BOOL v5 = @"Highlight_Style_Yellow";
      id v6 = @"Yellow";
      goto LABEL_9;
    case 2:
      id v3 = +[AKController akBundle];
      objc_super v4 = v3;
      BOOL v5 = @"Highlight_Style_Green";
      id v6 = @"Green";
      goto LABEL_9;
    case 3:
      id v3 = +[AKController akBundle];
      objc_super v4 = v3;
      BOOL v5 = @"Highlight_Style_Blue";
      id v6 = @"Blue";
      goto LABEL_9;
    case 4:
      id v3 = +[AKController akBundle];
      objc_super v4 = v3;
      BOOL v5 = @"Highlight_Style_Pink";
      id v6 = @"Pink";
      goto LABEL_9;
    case 5:
      id v3 = +[AKController akBundle];
      objc_super v4 = v3;
      BOOL v5 = @"Highlight_Style_Purple";
      id v6 = @"Purple";
      goto LABEL_9;
    case 6:
      id v3 = +[AKController akBundle];
      objc_super v4 = v3;
      BOOL v5 = @"Highlight_Style_Underline";
      id v6 = @"Underline";
LABEL_9:
      double v7 = [v3 localizedStringForKey:v5 value:v6 table:@"AKHighlightColorEditorController"];

      break;
    default:
      double v7 = 0;
      break;
  }

  return v7;
}

- (id)p_themeForStyle:(int64_t)a3 pageTheme:(int)a4
{
  switch(a3)
  {
    case 1:
      id v6 = +[AKAnnotationTheme yellowTheme:](AKAnnotationTheme, "yellowTheme:", *(void *)&a4, v4);
      goto LABEL_11;
    case 2:
      id v6 = +[AKAnnotationTheme greenTheme:](AKAnnotationTheme, "greenTheme:", *(void *)&a4, v4);
      goto LABEL_11;
    case 3:
      id v6 = +[AKAnnotationTheme blueTheme:](AKAnnotationTheme, "blueTheme:", *(void *)&a4, v4);
      goto LABEL_11;
    case 4:
      id v6 = +[AKAnnotationTheme pinkTheme:](AKAnnotationTheme, "pinkTheme:", *(void *)&a4, v4);
      goto LABEL_11;
    case 5:
      id v6 = +[AKAnnotationTheme purpleTheme:](AKAnnotationTheme, "purpleTheme:", *(void *)&a4, v4);
      goto LABEL_11;
    case 6:
      id v6 = +[AKAnnotationTheme underlineTheme:](AKAnnotationTheme, "underlineTheme:", *(void *)&a4, v4);
LABEL_11:
      break;
    default:
      id v6 = 0;
      break;
  }
  return v6;
}

- (void)p_setStyle:(int64_t)a3 forAnnotation:(id)a4
{
  id v6 = a4;
  double v7 = [(AKAnnotationPopoverViewController *)self annotationTheme];
  uint64_t v8 = [v7 pageTheme];

  id v10 = [(AKHighlightColorEditorController *)self p_themeForStyle:a3 pageTheme:v8];
  [(AKAnnotationPopoverViewController *)self setAnnotationTheme:v10];
  id v9 = [(AKAnnotationPopoverViewController *)self delegate];
  [v9 editorController:self setTheme:v10 forAnnotation:v6];
}

- (void)p_removeAnnotation:(id)a3
{
  id v4 = a3;
  id v5 = [(AKAnnotationPopoverViewController *)self delegate];
  [v5 editorController:self deleteAnnotation:v4];
}

- (void)p_postDeleteConfirmation
{
  id v3 = +[AKController akBundle];
  id v4 = [v3 localizedStringForKey:@"Delete_Highlight_Title" value:@"Delete Highlight" table:@"AKHighlightColorEditorController"];

  id v5 = +[AKController akBundle];
  id v6 = [v5 localizedStringForKey:@"Delete_Highlight_Message" value:@"The associated note will also be deleted." table:@"AKHighlightColorEditorController"];

  double v7 = +[AKController akBundle];
  uint64_t v8 = [v7 localizedStringForKey:@"Delete_Highlight_Cancel" value:@"Cancel" table:@"AKHighlightColorEditorController"];

  id v9 = +[AKController akBundle];
  id v10 = [v9 localizedStringForKey:@"Delete_Highlight_Delete" value:@"Delete" table:@"AKHighlightColorEditorController"];

  double v11 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:v4 message:v6 preferredStyle:1];
  [(AKHighlightColorEditorController *)self setAlertController:v11];
  CGFloat v12 = [MEMORY[0x263F1C3F0] actionWithTitle:v8 style:1 handler:0];
  [v11 addAction:v12];

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = sub_237681594;
  v14[3] = &unk_264CDB730;
  v14[4] = self;
  double v13 = [MEMORY[0x263F1C3F0] actionWithTitle:v10 style:2 handler:v14];
  [v11 addAction:v13];

  [(AKHighlightColorEditorController *)self presentViewController:v11 animated:1 completion:0];
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(AKHighlightColorEditorController *)self alertController];
  [v5 dismissViewControllerAnimated:1 completion:0];

  [(AKHighlightColorEditorController *)self setAlertController:0];
  v6.receiver = self;
  v6.super_class = (Class)AKHighlightColorEditorController;
  [(AKAnnotationPopoverViewController *)&v6 setDelegate:v4];
}

- (void)useColorOf:(id)a3
{
  uint64_t v4 = [a3 tag];
  id v5 = [(AKAnnotationPopoverViewController *)self annotation];
  [(AKHighlightColorEditorController *)self p_setStyle:v4 forAnnotation:v5];

  [(AKHighlightColorEditorController *)self p_updateAppearance];
}

- (void)showColorControlsMenu:(id)a3
{
  id v4 = objc_alloc(MEMORY[0x263EFF8C0]);
  id v5 = [(AKHighlightColorEditorController *)self colorControls];
  id v7 = (id)objc_msgSend(v4, "initWithObjects:", v5, 0);

  objc_super v6 = [(AKHighlightColorEditorController *)self calloutBar];
  [v6 setControls:v7];
}

- (void)handleAddNoteButton:(id)a3
{
  [(AKAnnotationPopoverViewController *)self hide];
  id v5 = [(AKAnnotationPopoverViewController *)self delegate];
  id v4 = [(AKAnnotationPopoverViewController *)self annotation];
  [v5 editorController:self editNote:v4];
}

- (void)handleShareButton:(id)a3
{
  id v4 = [(AKAnnotationPopoverViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    objc_super v6 = [(AKAnnotationPopoverViewController *)self delegate];
    id v7 = [(AKAnnotationPopoverViewController *)self annotation];
    [v6 editorController:self shareAnnotation:v7];
  }

  [(AKAnnotationPopoverViewController *)self hide];
}

- (void)handleDeleteButtonTap:(id)a3
{
  id v4 = [(AKAnnotationPopoverViewController *)self annotation];
  [(AKHighlightColorEditorController *)self p_removeAnnotation:v4];

  [(AKAnnotationPopoverViewController *)self hide];
}

- (void)handleRightArrowButton:(id)a3
{
  id v5 = [(AKAnnotationPopoverViewController *)self delegate];
  [(AKAnnotationPopoverViewController *)self hide];
  id v4 = [(AKAnnotationPopoverViewController *)self annotation];
  [v5 editorController:self showEditMenuForAnnotation:v4];
}

- (id)p_colorForTag:(int64_t)a3 pageTheme:(int)a4
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_237681ABC;
  block[3] = &unk_264CDAE40;
  block[4] = self;
  if (qword_268925250 != -1) {
    dispatch_once(&qword_268925250, block);
  }
  objc_super v6 = 0;
  if (a3 && a3 <= 6)
  {
    switch(a4)
    {
      case 0:
        id v7 = (void *)qword_268925230;
        goto LABEL_12;
      case 1:
        id v7 = (void *)qword_268925238;
        goto LABEL_12;
      case 2:
        id v7 = (void *)qword_268925240;
        goto LABEL_12;
      case 3:
        id v7 = (void *)qword_268925248;
        goto LABEL_12;
      case 4:
        id v7 = (void *)qword_268925228;
LABEL_12:
        uint64_t v8 = [NSNumber numberWithInteger:a3];
        objc_super v6 = [v7 objectForKeyedSubscript:v8];

        break;
      default:
        objc_super v6 = 0;
        break;
    }
  }

  return v6;
}

- (void)p_drawColorControlCircleWithFrame:(CGRect)a3 color:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = a4;
  v15.origin.double x = x;
  v15.origin.double y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  double v9 = CGRectGetWidth(v15);
  v16.origin.double x = x;
  v16.origin.double y = y;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  double v10 = CGRectGetHeight(v16);
  if (v9 >= v10) {
    double v11 = v10;
  }
  else {
    double v11 = v9;
  }
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  [v8 setStroke];
  [v8 setFill];

  double v13 = objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithOvalInRect:", x, y, v11, v11);
  [v13 stroke];
  [v13 fill];

  CGContextRestoreGState(CurrentContext);
}

- (id)p_colorControlImageForColor:(id)a3 withForegroundImage:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v11.CGFloat width = 38.0;
  v11.CGFloat height = 38.0;
  UIGraphicsBeginImageContextWithOptions(v11, 0, 0.0);
  -[AKHighlightColorEditorController p_drawColorControlCircleWithFrame:color:](self, "p_drawColorControlCircleWithFrame:color:", v7, 6.0, 6.0, 26.0, 26.0);

  objc_msgSend(v6, "drawAtPoint:", 6.0, 6.0);
  id v8 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v8;
}

- (id)p_colorControlImageForColor:(id)a3
{
  return [(AKHighlightColorEditorController *)self p_colorControlImageForColor:a3 withForegroundImage:0];
}

- (id)p_underlineForegroundImageForPageTheme:(int)a3
{
  if (a3 == 3) {
    id v3 = @"ib_text_pop_icon_highlight_underline_night";
  }
  else {
    id v3 = @"ib_text_pop_icon_highlight_underline";
  }
  return (id)[MEMORY[0x263F1C6B0] akImageNamed:v3];
}

- (id)p_colorControlUnderlineImageForPageTheme:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = [(AKHighlightColorEditorController *)self p_colorForTag:6 pageTheme:*(void *)&a3];
  id v6 = [(AKHighlightColorEditorController *)self p_underlineForegroundImageForPageTheme:v3];
  id v7 = [(AKHighlightColorEditorController *)self p_colorControlImageForColor:v5 withForegroundImage:v6];

  return v7;
}

- (id)p_colorControlImageForTag:(int64_t)a3 pageTheme:(int)a4
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2376821CC;
  block[3] = &unk_264CDAE40;
  block[4] = self;
  if (qword_268925280 != -1) {
    dispatch_once(&qword_268925280, block);
  }
  id v6 = 0;
  if (a3 && a3 <= 6)
  {
    switch(a4)
    {
      case 0:
        id v7 = (void *)qword_268925260;
        goto LABEL_12;
      case 1:
        id v7 = (void *)qword_268925268;
        goto LABEL_12;
      case 2:
        id v7 = (void *)qword_268925270;
        goto LABEL_12;
      case 3:
        id v7 = (void *)qword_268925278;
        goto LABEL_12;
      case 4:
        id v7 = (void *)qword_268925258;
LABEL_12:
        id v8 = [NSNumber numberWithInteger:a3];
        id v6 = [v7 objectForKeyedSubscript:v8];

        break;
      default:
        id v6 = 0;
        break;
    }
  }

  return v6;
}

- (void)p_drawCrescentWithCircleRect:(CGRect)a3 color:(id)a4 leftShift:(double)a5 addRadius:(double)a6
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  double x = a3.origin.x;
  id v12 = a4;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  v32.origin.double x = x;
  v32.origin.CGFloat y = y;
  v32.size.CGFloat width = width;
  v32.size.CGFloat height = height;
  double v28 = CGRectGetMidX(v32) - a5;
  v33.origin.double x = x;
  v33.origin.CGFloat y = y;
  v33.size.CGFloat width = width;
  v33.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v33);
  v34.origin.double x = x;
  v34.origin.CGFloat y = y;
  v34.size.CGFloat width = width;
  v34.size.CGFloat height = height;
  double v27 = a6;
  double v29 = height;
  double v30 = CGRectGetHeight(v34) * 0.5 + a6;
  v35.origin.double x = x - a5;
  v35.origin.CGFloat y = y;
  double v14 = y;
  v35.size.CGFloat width = width;
  double v15 = width;
  v35.size.CGFloat height = height;
  CGRect v36 = CGRectInset(v35, -a6, -a6);
  CGFloat v16 = v36.origin.x;
  CGFloat v17 = v36.origin.y;
  CGFloat v18 = v36.size.height;
  double MaxX = CGRectGetMaxX(v36);
  v37.origin.double x = x;
  v37.origin.CGFloat y = v14;
  v37.size.CGFloat width = v15;
  v37.size.CGFloat height = height;
  double v20 = CGRectGetMaxX(v37);
  if (MaxX < v20) {
    double MaxX = v20;
  }
  objc_super v21 = objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v28, MidY, v30, -1.57079633, 1.57079633, *(void *)&MidY);
  v38.origin.double x = v16;
  v38.origin.CGFloat y = v17;
  v38.size.CGFloat width = MaxX;
  v38.size.CGFloat height = v18;
  CGFloat v22 = CGRectGetMaxX(v38) + v27;
  v39.origin.double x = v16;
  v39.origin.CGFloat y = v17;
  v39.size.CGFloat width = MaxX;
  v39.size.CGFloat height = v18;
  objc_msgSend(v21, "addLineToPoint:", v22, CGRectGetMaxY(v39));
  v40.origin.double x = v16;
  v40.origin.CGFloat y = v17;
  v40.size.CGFloat width = MaxX;
  v40.size.CGFloat height = v18;
  CGFloat v23 = CGRectGetMaxX(v40) + v27;
  v41.origin.double x = v16;
  v41.origin.CGFloat y = v17;
  v41.size.CGFloat width = MaxX;
  v41.size.CGFloat height = v18;
  objc_msgSend(v21, "addLineToPoint:", v23, CGRectGetMinY(v41));
  v42.origin.double x = v16;
  v42.origin.CGFloat y = v17;
  v42.size.CGFloat width = MaxX;
  v42.size.CGFloat height = v18;
  double v24 = v30 + CGRectGetMinX(v42);
  v43.origin.double x = v16;
  v43.origin.CGFloat y = v17;
  v43.size.CGFloat width = MaxX;
  v43.size.CGFloat height = v18;
  objc_msgSend(v21, "addLineToPoint:", v24, CGRectGetMinY(v43));
  [v21 closePath];
  [v21 addClip];
  [v12 setStroke];
  [v12 setFill];

  long long v25 = objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithOvalInRect:", x, v14, v15, v29);
  [v25 stroke];
  [v25 fill];

  CGContextRestoreGState(CurrentContext);
}

- (id)p_paletteImageWithFrontColor:(id)a3 middleColor:(id)a4 backColor:(id)a5 frontForegroundImage:(id)a6
{
  double v10 = (void *)MEMORY[0x263F1C920];
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  double v15 = [v10 mainScreen];
  if (objc_opt_respondsToSelector())
  {
    [v15 scale];
    double v17 = v16;

    if (v17 <= 1.0) {
      double v18 = 2.0;
    }
    else {
      double v18 = 1.5;
    }
  }
  else
  {

    double v18 = 2.0;
  }
  v22.CGFloat width = 40.0;
  v22.CGFloat height = 38.0;
  UIGraphicsBeginImageContextWithOptions(v22, 0, 0.0);
  -[AKHighlightColorEditorController p_drawCrescentWithCircleRect:color:leftShift:addRadius:](self, "p_drawCrescentWithCircleRect:color:leftShift:addRadius:", v12, 11.5, 5.0, 27.0, 27.0, 5.0, v18);

  -[AKHighlightColorEditorController p_drawCrescentWithCircleRect:color:leftShift:addRadius:](self, "p_drawCrescentWithCircleRect:color:leftShift:addRadius:", v13, 6.5, 5.0, 27.0, 27.0, 5.0, v18);
  -[AKHighlightColorEditorController p_drawColorControlCircleWithFrame:color:](self, "p_drawColorControlCircleWithFrame:color:", v14, 1.5, 5.0, 27.0, 27.0);

  objc_msgSend(v11, "drawInRect:", 1.5, 5.0, 27.0, 27.0);
  v19 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v19;
}

- (id)p_buildPaletteImageForFrontTag:(int64_t)a3 middleTag:(int64_t)a4 backTag:(int64_t)a5 pageTheme:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v11 = [(AKHighlightColorEditorController *)self p_colorForTag:a3 pageTheme:*(void *)&a6];
  id v12 = [(AKHighlightColorEditorController *)self p_colorForTag:a4 pageTheme:v6];
  id v13 = [(AKHighlightColorEditorController *)self p_colorForTag:a5 pageTheme:v6];
  if (a3 == 6)
  {
    id v14 = [(AKHighlightColorEditorController *)self p_underlineForegroundImageForPageTheme:v6];
  }
  else
  {
    id v14 = 0;
  }
  double v15 = [(AKHighlightColorEditorController *)self p_paletteImageWithFrontColor:v11 middleColor:v12 backColor:v13 frontForegroundImage:v14];

  return v15;
}

- (id)p_paletteImageForTag:(int64_t)a3 pageTheme:(int)a4
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_237682BB4;
  block[3] = &unk_264CDAE40;
  block[4] = self;
  if (qword_2689252B0 != -1) {
    dispatch_once(&qword_2689252B0, block);
  }
  uint64_t v6 = 0;
  if (a3 && a3 <= 6)
  {
    switch(a4)
    {
      case 0:
        id v7 = (void *)qword_268925290;
        goto LABEL_12;
      case 1:
        id v7 = (void *)qword_268925298;
        goto LABEL_12;
      case 2:
        id v7 = (void *)qword_2689252A0;
        goto LABEL_12;
      case 3:
        id v7 = (void *)qword_2689252A8;
        goto LABEL_12;
      case 4:
        id v7 = (void *)qword_268925288;
LABEL_12:
        id v8 = [NSNumber numberWithInteger:a3];
        uint64_t v6 = [v7 objectForKeyedSubscript:v8];

        break;
      default:
        uint64_t v6 = 0;
        break;
    }
  }

  return v6;
}

- (id)p_monochromaticImageFromImage:(id)a3 withColor:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [v6 size];
  UIGraphicsBeginImageContextWithOptions(v18, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  [v6 size];
  CGFloat v9 = v8;
  [v6 size];
  CGFloat v11 = v10;
  [v6 size];
  CGContextTranslateCTM(CurrentContext, 0.0, v12);
  CGContextScaleCTM(CurrentContext, 1.0, -1.0);
  id v13 = v6;
  id v14 = (CGImage *)[v13 CGImage];

  v19.origin.double x = 0.0;
  v19.origin.CGFloat y = 0.0;
  v19.size.CGFloat width = v9;
  v19.size.CGFloat height = v11;
  CGContextClipToMask(CurrentContext, v19, v14);
  [v5 setFill];

  v20.origin.double x = 0.0;
  v20.origin.CGFloat y = 0.0;
  v20.size.CGFloat width = v9;
  v20.size.CGFloat height = v11;
  CGContextFillRect(CurrentContext, v20);
  double v15 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v15;
}

- (id)p_noteGlyphForTag:(int64_t)a3 pageTheme:(int)a4
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_237683148;
  block[3] = &unk_264CDAE40;
  block[4] = self;
  if (qword_2689252E0 != -1) {
    dispatch_once(&qword_2689252E0, block);
  }
  id v6 = 0;
  if (a3 && a3 <= 6)
  {
    switch(a4)
    {
      case 0:
        id v7 = (void *)qword_2689252C0;
        goto LABEL_12;
      case 1:
        id v7 = (void *)qword_2689252C8;
        goto LABEL_12;
      case 2:
        id v7 = (void *)qword_2689252D0;
        goto LABEL_12;
      case 3:
        id v7 = (void *)qword_2689252D8;
        goto LABEL_12;
      case 4:
        id v7 = (void *)qword_2689252B8;
LABEL_12:
        double v8 = [NSNumber numberWithInteger:a3];
        id v6 = [v7 objectForKeyedSubscript:v8];

        break;
      default:
        id v6 = 0;
        break;
    }
  }

  return v6;
}

- (AKCalloutBar)calloutBar
{
  return self->mCalloutBar;
}

- (void)setCalloutBar:(id)a3
{
}

- (void)setColorControls:(id)a3
{
}

- (UIButton)addNoteButton
{
  return self->mAddNoteButton;
}

- (void)setAddNoteButton:(id)a3
{
}

- (UIButton)deleteButton
{
  return self->mDeleteButton;
}

- (void)setDeleteButton:(id)a3
{
}

- (UIButton)rightArrowButton
{
  return self->mRightArrowButton;
}

- (void)setRightArrowButton:(id)a3
{
}

- (UIButton)shareButton
{
  return self->mShareButton;
}

- (void)setShareButton:(id)a3
{
}

- (int)pageTheme
{
  return self->_pageTheme;
}

- (void)setPageTheme:(int)a3
{
  self->_pageTheme = a3;
}

- (UIAlertController)alertController
{
  return self->_alertController;
}

- (void)setAlertController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong((id *)&self->mShareButton, 0);
  objc_storeStrong((id *)&self->mRightArrowButton, 0);
  objc_storeStrong((id *)&self->mDeleteButton, 0);
  objc_storeStrong((id *)&self->mAddNoteButton, 0);
  objc_storeStrong((id *)&self->mColorControls, 0);

  objc_storeStrong((id *)&self->mCalloutBar, 0);
}

@end