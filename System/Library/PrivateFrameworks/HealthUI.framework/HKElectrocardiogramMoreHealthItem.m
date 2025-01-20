@interface HKElectrocardiogramMoreHealthItem
- (HKElectrocardiogramMoreHealthItem)initWithView:(id)a3 identifier:(id)a4;
- (NSString)identifier;
- (UIView)view;
- (void)setIdentifier:(id)a3;
- (void)setView:(id)a3;
@end

@implementation HKElectrocardiogramMoreHealthItem

- (HKElectrocardiogramMoreHealthItem)initWithView:(id)a3 identifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKElectrocardiogramMoreHealthItem;
  v9 = [(HKElectrocardiogramMoreHealthItem *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_view, a3);
    objc_storeStrong((id *)&v10->_identifier, a4);
  }

  return v10;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (UIView)view
{
  return self->_view;
}

- (void)setView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end