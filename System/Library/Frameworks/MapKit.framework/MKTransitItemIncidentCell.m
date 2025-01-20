@interface MKTransitItemIncidentCell
- (BOOL)padBottom;
- (MKTransitItemIncidentCell)initWithReuseIdentifier:(id)a3;
- (MKTransitItemIncidentCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (int64_t)cellPosition;
- (void)_configureViews;
- (void)_updateIncidentViewBottomOffset;
- (void)configureWithIncident:(id)a3 referenceDate:(id)a4 shouldShowImage:(BOOL)a5 inSiri:(BOOL)a6;
- (void)configureWithIncidentMessage:(id)a3 referenceDate:(id)a4 shouldShowImage:(BOOL)a5 inSiri:(BOOL)a6;
- (void)configureWithMessage:(id)a3 incident:(id)a4 referenceDate:(id)a5 shouldShowImage:(BOOL)a6 inSiri:(BOOL)a7;
- (void)setCellPosition:(int64_t)a3;
- (void)setLeadingSeparatorInset:(double)a3;
- (void)setPadBottom:(BOOL)a3;
- (void)setSeparatorHidden:(BOOL)a3;
- (void)setTrailingSeparatorInset:(double)a3;
@end

@implementation MKTransitItemIncidentCell

- (MKTransitItemIncidentCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MKTransitItemIncidentCell;
  v4 = [(MKCustomSeparatorCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4) {
    [(MKTransitItemIncidentCell *)v4 _configureViews];
  }
  return v5;
}

- (MKTransitItemIncidentCell)initWithReuseIdentifier:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MKTransitItemIncidentCell;
  v3 = [(MKCustomSeparatorCell *)&v6 initWithStyle:0 reuseIdentifier:a3];
  v4 = v3;
  if (v3) {
    [(MKTransitItemIncidentCell *)v3 _configureViews];
  }
  return v4;
}

- (void)_configureViews
{
  v26[4] = *MEMORY[0x1E4F143B8];
  [(MKTransitItemIncidentCell *)self setSelectionStyle:0];
  [(MKTransitItemIncidentCell *)self setSeparatorHidden:1];
  v3 = [MKTransitItemIncidentView alloc];
  v4 = [(MKTransitItemIncidentCell *)self contentView];
  [v4 bounds];
  v5 = -[MKTransitItemIncidentView initWithFrame:](v3, "initWithFrame:");
  incidentView = self->_incidentView;
  self->_incidentView = v5;

  [(MKTransitItemIncidentView *)self->_incidentView setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_super v7 = [(MKTransitItemIncidentCell *)self contentView];
  [v7 addSubview:self->_incidentView];

  v18 = (void *)MEMORY[0x1E4F28DC8];
  v24 = [(MKTransitItemIncidentView *)self->_incidentView topAnchor];
  v25 = [(MKTransitItemIncidentCell *)self contentView];
  v23 = [v25 topAnchor];
  v22 = [v24 constraintEqualToAnchor:v23];
  v26[0] = v22;
  v20 = [(MKTransitItemIncidentView *)self->_incidentView leadingAnchor];
  v21 = [(MKTransitItemIncidentCell *)self contentView];
  v19 = [v21 leadingAnchor];
  v17 = [v20 constraintEqualToAnchor:v19];
  v26[1] = v17;
  v8 = [(MKTransitItemIncidentCell *)self contentView];
  v9 = [v8 trailingAnchor];
  v10 = [(MKTransitItemIncidentView *)self->_incidentView trailingAnchor];
  v11 = [v9 constraintEqualToAnchor:v10];
  v26[2] = v11;
  v12 = [(MKTransitItemIncidentCell *)self contentView];
  v13 = [v12 bottomAnchor];
  v14 = [(MKTransitItemIncidentView *)self->_incidentView bottomAnchor];
  v15 = [v13 constraintEqualToAnchor:v14];
  v26[3] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:4];
  [v18 activateConstraints:v16];

  [(MKTransitItemIncidentCell *)self _updateIncidentViewBottomOffset];
}

- (void)setLeadingSeparatorInset:(double)a3
{
  [(MKTransitItemIncidentView *)self->_incidentView contentInsets];
  v6.receiver = self;
  v6.super_class = (Class)MKTransitItemIncidentCell;
  [(MKCustomSeparatorCell *)&v6 setLeadingSeparatorInset:v5 + a3];
}

- (void)setTrailingSeparatorInset:(double)a3
{
  [(MKTransitItemIncidentView *)self->_incidentView contentInsets];
  v6.receiver = self;
  v6.super_class = (Class)MKTransitItemIncidentCell;
  [(MKCustomSeparatorCell *)&v6 setTrailingSeparatorInset:v5 + a3];
}

- (void)setSeparatorHidden:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(MKCustomSeparatorCell *)self isSeparatorHidden];
  v6.receiver = self;
  v6.super_class = (Class)MKTransitItemIncidentCell;
  [(MKCustomSeparatorCell *)&v6 setSeparatorHidden:v3];
  if (v5 != v3) {
    [(MKTransitItemIncidentCell *)self _updateIncidentViewBottomOffset];
  }
}

- (void)_updateIncidentViewBottomOffset
{
  BOOL v3 = [(MKCustomSeparatorCell *)self isSeparatorHidden];
  double v4 = 0.0;
  if (!v3)
  {
    [(MKCustomSeparatorCell *)self _separatorFrame];
    double v4 = -v5;
  }
  incidentView = self->_incidentView;

  [(MKTransitItemIncidentView *)incidentView _updateBottomConstraintWithOffset:v4];
}

- (void)configureWithIncident:(id)a3 referenceDate:(id)a4 shouldShowImage:(BOOL)a5 inSiri:(BOOL)a6
{
}

- (void)configureWithIncidentMessage:(id)a3 referenceDate:(id)a4 shouldShowImage:(BOOL)a5 inSiri:(BOOL)a6
{
}

- (void)configureWithMessage:(id)a3 incident:(id)a4 referenceDate:(id)a5 shouldShowImage:(BOOL)a6 inSiri:(BOOL)a7
{
}

- (BOOL)padBottom
{
  return [(MKTransitItemIncidentView *)self->_incidentView padBottom];
}

- (void)setPadBottom:(BOOL)a3
{
}

- (int64_t)cellPosition
{
  return [(MKTransitItemIncidentView *)self->_incidentView cellPosition];
}

- (void)setCellPosition:(int64_t)a3
{
}

- (void).cxx_destruct
{
}

@end