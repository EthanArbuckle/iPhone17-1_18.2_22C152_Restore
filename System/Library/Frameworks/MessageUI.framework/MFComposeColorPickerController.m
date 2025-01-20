@interface MFComposeColorPickerController
- (BOOL)shouldShowTitleBar;
- (MFComposeColorPickerController)initWithSelectedColor:(id)a3 shouldShowTitleBar:(BOOL)a4;
- (MFComposeColorPickerControllerDelegate)delegate;
- (PKColorPicker)colorPicker;
- (UIColor)selectedColor;
- (void)closeColorPicker:(id)a3;
- (void)colorPickerDidChangeSelectedColor:(id)a3;
- (void)loadView;
- (void)setColorPicker:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSelectedColor:(id)a3;
- (void)setShouldShowTitleBar:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation MFComposeColorPickerController

- (MFComposeColorPickerController)initWithSelectedColor:(id)a3 shouldShowTitleBar:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MFComposeColorPickerController;
  v8 = [(MFComposeColorPickerController *)&v11 initWithNibName:0 bundle:0];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_selectedColor, a3);
    v9->_shouldShowTitleBar = a4;
  }

  return v9;
}

- (void)loadView
{
  v42[4] = *MEMORY[0x1E4F143B8];
  v41.receiver = self;
  v41.super_class = (Class)MFComposeColorPickerController;
  [(MFComposeColorPickerController *)&v41 loadView];
  v3 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  v4 = [(MFComposeColorPickerController *)self view];
  [v4 setBackgroundColor:v3];

  v5 = (PKColorPicker *)objc_alloc_init(MEMORY[0x1E4F38DF0]);
  colorPicker = self->_colorPicker;
  self->_colorPicker = v5;

  [(PKColorPicker *)self->_colorPicker setDelegate:self];
  [(PKColorPicker *)self->_colorPicker setColorUserInterfaceStyle:1];
  id v7 = [(MFComposeColorPickerController *)self selectedColor];
  [(PKColorPicker *)self->_colorPicker setSelectedColor:v7];

  [(PKColorPicker *)self->_colorPicker setEdgesForExtendedLayout:0];
  v8 = [MEMORY[0x1E4FB1618] mailStyleSheetBackground];
  v9 = [(PKColorPicker *)self->_colorPicker view];
  [v9 setBackgroundColor:v8];

  v10 = [(PKColorPicker *)self->_colorPicker view];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

  [(MFComposeColorPickerController *)self addChildViewController:self->_colorPicker];
  objc_super v11 = [(MFComposeColorPickerController *)self view];
  v12 = [(PKColorPicker *)self->_colorPicker view];
  [v11 addSubview:v12];

  [(PKColorPicker *)self->_colorPicker didMoveToParentViewController:self];
  if ([(MFComposeColorPickerController *)self shouldShowTitleBar])
  {
    v13 = (void *)MEMORY[0x1E4F28DC8];
    v14 = [(PKColorPicker *)self->_colorPicker view];
    v40 = [v14 topAnchor];
    v37 = [(MFComposeColorPickerController *)self view];
    v36 = [v37 layoutMarginsGuide];
    v35 = [v36 topAnchor];
    v34 = objc_msgSend(v40, "constraintEqualToAnchor:");
    v42[0] = v34;
    v33 = [(PKColorPicker *)self->_colorPicker view];
    v39 = [v33 bottomAnchor];
    v32 = [(MFComposeColorPickerController *)self view];
    v31 = [v32 layoutMarginsGuide];
    v30 = [v31 bottomAnchor];
    v29 = objc_msgSend(v39, "constraintEqualToAnchor:");
    v42[1] = v29;
    v28 = [(PKColorPicker *)self->_colorPicker view];
    v38 = [v28 leadingAnchor];
    v27 = [(MFComposeColorPickerController *)self view];
    v26 = [v27 layoutMarginsGuide];
    v25 = [v26 leadingAnchor];
    v15 = objc_msgSend(v38, "constraintEqualToAnchor:constant:", -5.0);
    v42[2] = v15;
    v16 = [(PKColorPicker *)self->_colorPicker view];
    v17 = [v16 trailingAnchor];
    v18 = [(MFComposeColorPickerController *)self view];
    v19 = [v18 layoutMarginsGuide];
    v20 = [v19 trailingAnchor];
    v21 = [v17 constraintEqualToAnchor:v20 constant:5.0];
    v42[3] = v21;
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:4];
    [v13 activateConstraints:v22];
  }
  else
  {
    v23 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v24 = [v23 localizedStringForKey:@"FORMAT_COLOR_PALETTE_TITLE" value:&stru_1F0817A00 table:@"Main"];
    [(MFComposeColorPickerController *)self setTitle:v24];

    v14 = [(PKColorPicker *)self->_colorPicker view];
    v40 = [(MFComposeColorPickerController *)self view];
    objc_msgSend(v14, "mf_pinToView:usingLayoutMargins:");
  }
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)MFComposeColorPickerController;
  [(MFComposeColorPickerController *)&v12 viewDidLoad];
  if ([(MFComposeColorPickerController *)self shouldShowTitleBar])
  {
    v3 = [MFComposeActionCardTitleView alloc];
    v4 = -[MFComposeActionCardTitleView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v6 = [v5 localizedStringForKey:@"FORMAT_COLOR_PALETTE_TITLE" value:&stru_1F0817A00 table:@"Main"];
    id v7 = [(MFComposeActionCardTitleView *)v4 titleLabel];
    [v7 setText:v6];

    v8 = [(MFComposeActionCardTitleView *)v4 closeButton];
    [v8 addTarget:self action:sel_closeColorPicker_ forEvents:64];

    v9 = [(MFComposeColorPickerController *)self navigationItem];
    [v9 setTitleView:v4];

    v10 = [(MFComposeColorPickerController *)self navigationItem];
    [v10 _setManualScrollEdgeAppearanceProgress:0.0];

    objc_super v11 = [(MFComposeColorPickerController *)self navigationItem];
    [v11 _setManualScrollEdgeAppearanceEnabled:1];
  }
}

- (void)closeColorPicker:(id)a3
{
  id v4 = [(MFComposeColorPickerController *)self delegate];
  [v4 colorPickerDidCancel:self];
}

- (void)colorPickerDidChangeSelectedColor:(id)a3
{
  id v6 = a3;
  id v4 = [(MFComposeColorPickerController *)self delegate];
  v5 = [v6 selectedColor];
  [v4 colorPicker:self didChangeSelectedColor:v5];
}

- (MFComposeColorPickerControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MFComposeColorPickerControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIColor)selectedColor
{
  return self->_selectedColor;
}

- (void)setSelectedColor:(id)a3
{
}

- (PKColorPicker)colorPicker
{
  return self->_colorPicker;
}

- (void)setColorPicker:(id)a3
{
}

- (BOOL)shouldShowTitleBar
{
  return self->_shouldShowTitleBar;
}

- (void)setShouldShowTitleBar:(BOOL)a3
{
  self->_shouldShowTitleBar = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorPicker, 0);
  objc_storeStrong((id *)&self->_selectedColor, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end