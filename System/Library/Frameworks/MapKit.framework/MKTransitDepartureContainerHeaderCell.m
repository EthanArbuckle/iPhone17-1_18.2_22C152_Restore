@interface MKTransitDepartureContainerHeaderCell
- (MKTransitDepartureContainerHeaderCell)initWithReuseIdentifier:(id)a3;
- (MKTransitDepartureContainerHeaderViewModel)viewModel;
- (void)_commonInit;
- (void)setViewModel:(id)a3;
@end

@implementation MKTransitDepartureContainerHeaderCell

- (MKTransitDepartureContainerHeaderCell)initWithReuseIdentifier:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MKTransitDepartureContainerHeaderCell;
  v3 = [(MKCustomSeparatorCell *)&v6 initWithStyle:0 reuseIdentifier:a3];
  v4 = v3;
  if (v3) {
    [(MKTransitDepartureContainerHeaderCell *)v3 _commonInit];
  }
  return v4;
}

- (void)_commonInit
{
  v27[4] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F428B8] secondarySystemGroupedBackgroundColor];
  v4 = [(MKTransitDepartureContainerHeaderCell *)self contentView];
  [v4 setBackgroundColor:v3];

  v5 = [MKTransitDepartureContainerHeaderView alloc];
  objc_super v6 = -[MKTransitDepartureContainerHeaderView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  headerView = self->_headerView;
  self->_headerView = v6;

  [(MKTransitDepartureContainerHeaderView *)self->_headerView setTranslatesAutoresizingMaskIntoConstraints:0];
  v8 = [(MKTransitDepartureContainerHeaderCell *)self contentView];
  [v8 addSubview:self->_headerView];

  v19 = (void *)MEMORY[0x1E4F28DC8];
  v25 = [(MKTransitDepartureContainerHeaderView *)self->_headerView leadingAnchor];
  v26 = [(MKTransitDepartureContainerHeaderCell *)self contentView];
  v24 = [v26 leadingAnchor];
  v23 = [v25 constraintEqualToAnchor:v24];
  v27[0] = v23;
  v21 = [(MKTransitDepartureContainerHeaderView *)self->_headerView trailingAnchor];
  v22 = [(MKTransitDepartureContainerHeaderCell *)self contentView];
  v20 = [v22 trailingAnchor];
  v9 = [v21 constraintEqualToAnchor:v20];
  v27[1] = v9;
  v10 = [(MKTransitDepartureContainerHeaderView *)self->_headerView topAnchor];
  v11 = [(MKTransitDepartureContainerHeaderCell *)self contentView];
  v12 = [v11 topAnchor];
  v13 = [v10 constraintEqualToAnchor:v12];
  v27[2] = v13;
  v14 = [(MKTransitDepartureContainerHeaderView *)self->_headerView bottomAnchor];
  v15 = [(MKTransitDepartureContainerHeaderCell *)self contentView];
  v16 = [v15 bottomAnchor];
  v17 = [v14 constraintEqualToAnchor:v16];
  v27[3] = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:4];
  [v19 activateConstraints:v18];
}

- (void)setViewModel:(id)a3
{
}

- (MKTransitDepartureContainerHeaderViewModel)viewModel
{
  return [(MKTransitDepartureContainerHeaderView *)self->_headerView viewModel];
}

- (void).cxx_destruct
{
}

@end