@interface AKLoginRowData
- (AKLoginRowData)initWithIconImage:(id)a3 paneTitleText:(id)a4 titleText:(id)a5 detailText:(id)a6 authenticationType:(int64_t)a7;
- (NSString)loginRowDetailText;
- (NSString)loginRowPaneTitleText;
- (NSString)loginRowText;
- (UIImage)loginRowIconImage;
- (int64_t)loginRowAuthenticationType;
- (void)setLoginRowAuthenticationType:(int64_t)a3;
- (void)setLoginRowDetailText:(id)a3;
- (void)setLoginRowIconImage:(id)a3;
- (void)setLoginRowPaneTitleText:(id)a3;
- (void)setLoginRowText:(id)a3;
@end

@implementation AKLoginRowData

- (AKLoginRowData)initWithIconImage:(id)a3 paneTitleText:(id)a4 titleText:(id)a5 detailText:(id)a6 authenticationType:(int64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v21.receiver = self;
  v21.super_class = (Class)AKLoginRowData;
  v17 = [(AKLoginRowData *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_iconImage, a3);
    objc_storeStrong((id *)&v18->_paneTitleText, a4);
    objc_storeStrong((id *)&v18->_titleText, a5);
    objc_storeStrong((id *)&v18->_detailText, a6);
    v18->_authenticationType = a7;
    v19 = v18;
  }

  return v18;
}

- (UIImage)loginRowIconImage
{
  return self->_iconImage;
}

- (void)setLoginRowIconImage:(id)a3
{
}

- (NSString)loginRowPaneTitleText
{
  return self->_paneTitleText;
}

- (void)setLoginRowPaneTitleText:(id)a3
{
}

- (NSString)loginRowText
{
  return self->_titleText;
}

- (void)setLoginRowText:(id)a3
{
}

- (NSString)loginRowDetailText
{
  return self->_detailText;
}

- (void)setLoginRowDetailText:(id)a3
{
}

- (int64_t)loginRowAuthenticationType
{
  return self->_authenticationType;
}

- (void)setLoginRowAuthenticationType:(int64_t)a3
{
  self->_authenticationType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_paneTitleText, 0);

  objc_storeStrong((id *)&self->_iconImage, 0);
}

@end