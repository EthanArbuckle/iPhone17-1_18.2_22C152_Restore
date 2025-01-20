@interface SGPostalAddressExtraction
- (BOOL)hasExtraction;
- (NSString)plainText;
- (SGPostalAddressComponents)components;
- (SGPostalAddressExtraction)initWithPlainText:(id)a3 components:(id)a4;
@end

@implementation SGPostalAddressExtraction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_components, 0);
  objc_storeStrong((id *)&self->_plainText, 0);
}

- (SGPostalAddressComponents)components
{
  return self->_components;
}

- (NSString)plainText
{
  return self->_plainText;
}

- (BOOL)hasExtraction
{
  return self->_plainText || self->_components != 0;
}

- (SGPostalAddressExtraction)initWithPlainText:(id)a3 components:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SGPostalAddressExtraction;
  v9 = [(SGPostalAddressExtraction *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_plainText, a3);
    objc_storeStrong((id *)&v10->_components, a4);
  }

  return v10;
}

@end