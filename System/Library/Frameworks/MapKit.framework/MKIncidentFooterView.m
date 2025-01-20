@interface MKIncidentFooterView
- (MKIncidentFooterView)initWithCoder:(id)a3;
- (MKIncidentFooterView)initWithReuseIdentifier:(id)a3;
- (UIColor)separatorColor;
- (void)_commonInit;
- (void)setSeparatorColor:(id)a3;
@end

@implementation MKIncidentFooterView

- (MKIncidentFooterView)initWithReuseIdentifier:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MKIncidentFooterView;
  v3 = [(MKIncidentFooterView *)&v6 initWithReuseIdentifier:a3];
  v4 = v3;
  if (v3) {
    [(MKIncidentFooterView *)v3 _commonInit];
  }
  return v4;
}

- (MKIncidentFooterView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MKIncidentFooterView;
  v3 = [(MKIncidentFooterView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(MKIncidentFooterView *)v3 _commonInit];
  }
  return v4;
}

- (void)_commonInit
{
  v3 = [MKViewWithHairline alloc];
  v4 = [(MKIncidentFooterView *)self contentView];
  [v4 bounds];
  v5 = -[MKViewWithHairline initWithFrame:](v3, "initWithFrame:", 0.0, 0.0);
  hairlineView = self->_hairlineView;
  self->_hairlineView = v5;

  v7 = [MEMORY[0x1E4F428B8] colorWithWhite:0.0 alpha:0.0500000007];
  [(MKViewWithHairline *)self->_hairlineView setBackgroundColor:v7];

  [(MKViewWithHairline *)self->_hairlineView setAutoresizingMask:2];
  id v8 = [(MKIncidentFooterView *)self contentView];
  [v8 addSubview:self->_hairlineView];
}

- (void)setSeparatorColor:(id)a3
{
}

- (UIColor)separatorColor
{
  return [(MKViewWithHairline *)self->_hairlineView hairlineColor];
}

- (void).cxx_destruct
{
}

@end