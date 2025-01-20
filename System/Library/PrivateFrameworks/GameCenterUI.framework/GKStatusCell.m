@interface GKStatusCell
- (BOOL)canRemoveItem;
- (GKStatusCell)initWithFrame:(CGRect)a3;
- (UILabel)statusLabel;
- (void)prepareForReuse;
- (void)setStatus:(id)a3;
- (void)setStatusLabel:(id)a3;
@end

@implementation GKStatusCell

- (GKStatusCell)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)GKStatusCell;
  v3 = -[GKCollectionViewCell initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = [(UICollectionReusableView *)v3 _gkNewStandardInfoLabel];
    statusLabel = v4->_statusLabel;
    v4->_statusLabel = (UILabel *)v5;

    [(UILabel *)v4->_statusLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(GKStatusCell *)v4 addSubview:v4->_statusLabel];
    v7 = [MEMORY[0x1E4F28DC8] constraintWithItem:v4->_statusLabel attribute:10 relatedBy:0 toItem:v4 attribute:10 multiplier:1.0 constant:0.0];
    [(GKStatusCell *)v4 addConstraint:v7];

    v8 = [MEMORY[0x1E4F28DC8] constraintWithItem:v4->_statusLabel attribute:9 relatedBy:0 toItem:v4 attribute:9 multiplier:1.0 constant:0.0];
    [(GKStatusCell *)v4 addConstraint:v8];

    [(GKStatusCell *)v4 setStatus:&stru_1F07B2408];
  }
  return v4;
}

- (void)setStatus:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F639F8];
  id v5 = a3;
  id v8 = [v4 textStyle];
  v6 = [v8 caption];
  v7 = [v5 _gkAttributedStringByApplyingStyle:v6];

  [(UILabel *)self->_statusLabel setAttributedText:v7];
}

- (BOOL)canRemoveItem
{
  return 0;
}

- (void)prepareForReuse
{
  v2.receiver = self;
  v2.super_class = (Class)GKStatusCell;
  [(GKCollectionViewCell *)&v2 prepareForReuse];
}

- (UILabel)statusLabel
{
  return self->_statusLabel;
}

- (void)setStatusLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end