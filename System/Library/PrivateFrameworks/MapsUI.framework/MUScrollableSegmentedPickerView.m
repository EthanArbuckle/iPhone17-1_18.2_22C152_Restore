@interface MUScrollableSegmentedPickerView
- (MUScrollableSegmentedPickerView)initWithFrame:(CGRect)a3;
- (MUScrollableSegmentedPickerViewDelegate)delegate;
- (NSArray)viewModels;
- (unint64_t)selectedIndex;
- (void)_setupContentView;
- (void)layoutSubviews;
- (void)segmentedPickerContentViewDidUpdateSelection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSelectedIndex:(unint64_t)a3;
- (void)setViewModels:(id)a3;
@end

@implementation MUScrollableSegmentedPickerView

- (MUScrollableSegmentedPickerView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MUScrollableSegmentedPickerView;
  v3 = -[MUScrollableSegmentedPickerView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(MUScrollableSegmentedPickerView *)v3 _setupContentView];
  }
  return v4;
}

- (void)_setupContentView
{
  v28[6] = *MEMORY[0x1E4F143B8];
  v3 = [MUScrollableSegmentedPickerContentView alloc];
  v4 = -[MUScrollableSegmentedPickerContentView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  contentView = self->_contentView;
  self->_contentView = v4;

  [(MUScrollableSegmentedPickerContentView *)self->_contentView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MUScrollableSegmentedPickerContentView *)self->_contentView setDelegate:self];
  [(MUScrollableSegmentedPickerView *)self addSubview:self->_contentView];
  objc_super v6 = [(MUScrollableSegmentedPickerContentView *)self->_contentView widthAnchor];
  v7 = [v6 constraintEqualToConstant:0.0];
  widthConstraint = self->_widthConstraint;
  self->_widthConstraint = v7;

  LODWORD(v9) = 1111752704;
  [(NSLayoutConstraint *)self->_widthConstraint setPriority:v9];
  v21 = (void *)MEMORY[0x1E4F28DC8];
  v27 = [(MUScrollableSegmentedPickerContentView *)self->_contentView centerXAnchor];
  v26 = [(MUScrollableSegmentedPickerView *)self centerXAnchor];
  v25 = [v27 constraintEqualToAnchor:v26];
  v28[0] = v25;
  v24 = [(MUScrollableSegmentedPickerContentView *)self->_contentView topAnchor];
  v23 = [(MUScrollableSegmentedPickerView *)self topAnchor];
  v22 = [v24 constraintEqualToAnchor:v23];
  v28[1] = v22;
  v20 = [(MUScrollableSegmentedPickerContentView *)self->_contentView bottomAnchor];
  v10 = [(MUScrollableSegmentedPickerView *)self bottomAnchor];
  v11 = [v20 constraintEqualToAnchor:v10];
  v28[2] = v11;
  v12 = [(MUScrollableSegmentedPickerContentView *)self->_contentView leadingAnchor];
  v13 = [(MUScrollableSegmentedPickerView *)self leadingAnchor];
  v14 = [v12 constraintGreaterThanOrEqualToAnchor:v13];
  v28[3] = v14;
  v15 = [(MUScrollableSegmentedPickerContentView *)self->_contentView trailingAnchor];
  v16 = [(MUScrollableSegmentedPickerView *)self trailingAnchor];
  v17 = [v15 constraintLessThanOrEqualToAnchor:v16];
  v18 = self->_widthConstraint;
  v28[4] = v17;
  v28[5] = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:6];
  [v21 activateConstraints:v19];
}

- (void)setViewModels:(id)a3
{
}

- (NSArray)viewModels
{
  return [(MUScrollableSegmentedPickerContentView *)self->_contentView viewModels];
}

- (void)setSelectedIndex:(unint64_t)a3
{
}

- (unint64_t)selectedIndex
{
  return [(MUScrollableSegmentedPickerContentView *)self->_contentView selectedIndex];
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)MUScrollableSegmentedPickerView;
  [(MUScrollableSegmentedPickerView *)&v6 layoutSubviews];
  contentView = self->_contentView;
  [(MUScrollableSegmentedPickerView *)self bounds];
  -[MUScrollableSegmentedPickerContentView idealWidthForProposedSize:](contentView, "idealWidthForProposedSize:", v4, v5);
  -[NSLayoutConstraint setConstant:](self->_widthConstraint, "setConstant:");
}

- (void)segmentedPickerContentViewDidUpdateSelection:(id)a3
{
  id v4 = [(MUScrollableSegmentedPickerView *)self delegate];
  objc_msgSend(v4, "scrollableSegmentedPickerView:didChangeSelectedIndex:", self, -[MUScrollableSegmentedPickerView selectedIndex](self, "selectedIndex"));
}

- (MUScrollableSegmentedPickerViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MUScrollableSegmentedPickerViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_widthConstraint, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end