@interface MFDateHeaderCollectionViewCell
+ (NSString)reusableIdentifier;
- (MFDateHeaderCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)updateSecondaryTextWithDate:(id)a3;
@end

@implementation MFDateHeaderCollectionViewCell

+ (NSString)reusableIdentifier
{
  return (NSString *)@"MFDateHeaderCollectionViewCellIdentifier";
}

- (MFDateHeaderCollectionViewCell)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)MFDateHeaderCollectionViewCell;
  v3 = -[MFDateHeaderCollectionViewCell initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    v5 = [(MFDateHeaderCollectionViewCell *)v3 contentView];
    [v5 setBackgroundColor:v4];

    v6 = [(MFDateHeaderCollectionViewCell *)v3 defaultContentConfiguration];
    v7 = _EFLocalizedString();
    [v6 setText:v7];

    v8 = [MEMORY[0x1E4FB1818] systemImageNamed:@"calendar"];
    [v6 setImage:v8];

    v9 = [MEMORY[0x1E4FB1618] datePickerHeaderColor];
    v10 = [v6 secondaryTextProperties];
    [v10 setColor:v9];

    [(MFDateHeaderCollectionViewCell *)v3 setContentConfiguration:v6];
  }
  return v3;
}

- (void)updateSecondaryTextWithDate:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28C10], "ef_formatDate:style:", a3, 3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = [(MFDateHeaderCollectionViewCell *)self contentConfiguration];
  [v4 setSecondaryText:v5];
  [(MFDateHeaderCollectionViewCell *)self setContentConfiguration:v4];
}

@end