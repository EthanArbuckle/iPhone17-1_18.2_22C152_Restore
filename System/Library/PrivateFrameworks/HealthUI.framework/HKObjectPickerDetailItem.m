@interface HKObjectPickerDetailItem
- (HKObjectPickerDetailItem)initWithPrimaryText:(id)a3 secondaryText:(id)a4;
- (NSString)primaryText;
- (NSString)secondaryText;
- (void)setPrimaryText:(id)a3;
- (void)setSecondaryText:(id)a3;
@end

@implementation HKObjectPickerDetailItem

- (HKObjectPickerDetailItem)initWithPrimaryText:(id)a3 secondaryText:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKObjectPickerDetailItem;
  v8 = [(HKObjectPickerDetailItem *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    primaryText = v8->_primaryText;
    v8->_primaryText = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    secondaryText = v8->_secondaryText;
    v8->_secondaryText = (NSString *)v11;
  }
  return v8;
}

- (NSString)primaryText
{
  return self->_primaryText;
}

- (void)setPrimaryText:(id)a3
{
}

- (NSString)secondaryText
{
  return self->_secondaryText;
}

- (void)setSecondaryText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryText, 0);
  objc_storeStrong((id *)&self->_primaryText, 0);
}

@end