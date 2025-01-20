@interface MFTimezoneCollectionViewCell
+ (NSString)reusableIdentifier;
- (MFTimezoneCollectionViewCell)initWithFrame:(CGRect)a3;
- (NSString)currentCityName;
- (UICellAccessoryLabel)timeZoneLabel;
- (void)_configureWithCityName:(id)a3;
- (void)setCurrentCityName:(id)a3;
- (void)setTimeZoneLabel:(id)a3;
@end

@implementation MFTimezoneCollectionViewCell

+ (NSString)reusableIdentifier
{
  return (NSString *)@"MFTimezoneCollectionViewCellIdentifier";
}

- (MFTimezoneCollectionViewCell)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)MFTimezoneCollectionViewCell;
  v3 = -[MFTimezoneCollectionViewCell initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    v5 = [(MFTimezoneCollectionViewCell *)v3 contentView];
    [v5 setBackgroundColor:v4];

    v6 = [(MFTimezoneCollectionViewCell *)v3 defaultContentConfiguration];
    v7 = _EFLocalizedString();
    [v6 setText:v7];

    [(MFTimezoneCollectionViewCell *)v3 setContentConfiguration:v6];
    v8 = [MEMORY[0x1E4F1CAF0] localTimeZone];
    v9 = +[MFTimezoneHelper cityForTimeZone:v8];
    v10 = [v9 displayName];
    [(MFTimezoneCollectionViewCell *)v3 setCurrentCityName:v10];
  }
  return v3;
}

- (void)setCurrentCityName:(id)a3
{
  v5 = (NSString *)a3;
  if (self->_currentCityName != v5)
  {
    objc_storeStrong((id *)&self->_currentCityName, a3);
    [(MFTimezoneCollectionViewCell *)self _configureWithCityName:v5];
  }
}

- (void)_configureWithCityName:(id)a3
{
  v8[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4FB1528]) initWithText:v4];
  id v6 = objc_alloc_init(MEMORY[0x1E4FB1518]);
  v8[0] = v6;
  v8[1] = v5;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  [(MFTimezoneCollectionViewCell *)self setAccessories:v7];
}

- (NSString)currentCityName
{
  return self->_currentCityName;
}

- (UICellAccessoryLabel)timeZoneLabel
{
  return self->_timeZoneLabel;
}

- (void)setTimeZoneLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZoneLabel, 0);

  objc_storeStrong((id *)&self->_currentCityName, 0);
}

@end