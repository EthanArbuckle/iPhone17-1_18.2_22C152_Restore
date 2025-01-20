@interface DOCTagEditorTagCell
- (BOOL)mixedSelection;
- (DOCLargeTagView)tagView;
- (DOCTag)tagValue;
- (DOCTagEditorTagCell)initWithFrame:(CGRect)a3;
- (void)setMixedSelection:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)setTagValue:(id)a3;
- (void)setTagView:(id)a3;
- (void)updateStyle;
@end

@implementation DOCTagEditorTagCell

- (DOCTagEditorTagCell)initWithFrame:(CGRect)a3
{
  v15.receiver = self;
  v15.super_class = (Class)DOCTagEditorTagCell;
  v3 = -[DOCTagEditorTagCell initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(DOCLargeTagView);
    tagView = v3->_tagView;
    v3->_tagView = v4;

    [(DOCLargeTagView *)v3->_tagView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(DOCLargeTagView *)v3->_tagView setSelectionType:2];
    v6 = +[DOCTagAppearance pickerList];
    v7 = [v6 cellContentHoverStyle];
    [(DOCLargeTagView *)v3->_tagView setHoverStyle:v7];

    [(DOCTagEditorTagCell *)v3 setHoverStyle:0];
    v8 = [(DOCTagEditorTagCell *)v3 contentView];
    v9 = [(DOCTagEditorTagCell *)v3 tagView];
    [v8 addSubview:v9];

    v10 = +[DOCTagAppearance pickerList];
    [v10 cellExternalMargins];

    v11 = [(DOCTagEditorTagCell *)v3 tagView];
    v12 = DOCConstraintsToResizeWithSuperviewSafeArea();
    v13 = DOCConstraintsWithPriority();

    [MEMORY[0x263F08938] activateConstraints:v13];
  }
  return v3;
}

- (void)setTagValue:(id)a3
{
  id v4 = a3;
  id v5 = [(DOCTagEditorTagCell *)self tagView];
  [v5 setTagValue:v4];
}

- (DOCTag)tagValue
{
  v2 = [(DOCTagEditorTagCell *)self tagView];
  v3 = [v2 tagValue];

  return (DOCTag *)v3;
}

- (void)setSelected:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DOCTagEditorTagCell;
  [(DOCTagEditorTagCell *)&v4 setSelected:a3];
  [(DOCTagEditorTagCell *)self updateStyle];
}

- (void)setMixedSelection:(BOOL)a3
{
  if (self->_mixedSelection != a3)
  {
    self->_mixedSelection = a3;
    [(DOCTagEditorTagCell *)self updateStyle];
  }
}

- (void)updateStyle
{
  if ([(DOCTagEditorTagCell *)self isSelected])
  {
    v3 = [(DOCTagEditorTagCell *)self tagView];
    id v6 = v3;
    uint64_t v4 = 0;
  }
  else
  {
    BOOL v5 = [(DOCTagEditorTagCell *)self mixedSelection];
    v3 = [(DOCTagEditorTagCell *)self tagView];
    id v6 = v3;
    if (v5) {
      uint64_t v4 = 1;
    }
    else {
      uint64_t v4 = 2;
    }
  }
  [v3 setSelectionType:v4];
}

- (BOOL)mixedSelection
{
  return self->_mixedSelection;
}

- (DOCLargeTagView)tagView
{
  return self->_tagView;
}

- (void)setTagView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end