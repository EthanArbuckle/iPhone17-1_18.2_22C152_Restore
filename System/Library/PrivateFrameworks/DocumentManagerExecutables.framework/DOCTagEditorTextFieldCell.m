@interface DOCTagEditorTextFieldCell
- (DOCAddTagView)addTagView;
- (DOCTagEditorTextFieldCell)initWithFrame:(CGRect)a3;
- (void)updateHoverEffects;
@end

@implementation DOCTagEditorTextFieldCell

- (DOCTagEditorTextFieldCell)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)DOCTagEditorTextFieldCell;
  v3 = -[DOCTagEditorTextFieldCell initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = +[DOCTagAppearance pickerList];
    appearance = v3->_appearance;
    v3->_appearance = (DOCTagPickerCellAppearanceProviding *)v4;

    v6 = objc_alloc_init(DOCAddTagView);
    addTagView = v3->_addTagView;
    v3->_addTagView = v6;

    [(DOCAddTagView *)v3->_addTagView setTranslatesAutoresizingMaskIntoConstraints:0];
    v8 = [(DOCTagEditorTextFieldCell *)v3 contentView];
    v9 = [(DOCTagEditorTextFieldCell *)v3 addTagView];
    [v8 addSubview:v9];

    v10 = [(DOCTagEditorTextFieldCell *)v3 addTagView];
    [(DOCTagPickerCellAppearanceProviding *)v3->_appearance cellExternalMargins];
    v11 = DOCConstraintsToResizeWithSuperviewSafeArea();
    v12 = DOCConstraintsWithPriority();

    [MEMORY[0x263F08938] activateConstraints:v12];
    [(DOCTagEditorTextFieldCell *)v3 updateHoverEffects];
  }
  return v3;
}

- (void)updateHoverEffects
{
  [(DOCTagEditorTextFieldCell *)self setHoverStyle:0];
  addTagView = self->_addTagView;

  [(DOCAddTagView *)addTagView updateHoverEffects];
}

- (DOCAddTagView)addTagView
{
  return self->_addTagView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addTagView, 0);

  objc_storeStrong((id *)&self->_appearance, 0);
}

@end