@interface AVTCoreModelMulticolorAuxilaryPickerItem
- (AVTCoreModelMulticolorAuxilaryPickerItem)initWithIdentifier:(id)a3 title:(id)a4 message:(id)a5;
- (NSString)identifier;
- (NSString)message;
- (NSString)title;
@end

@implementation AVTCoreModelMulticolorAuxilaryPickerItem

- (AVTCoreModelMulticolorAuxilaryPickerItem)initWithIdentifier:(id)a3 title:(id)a4 message:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AVTCoreModelMulticolorAuxilaryPickerItem;
  v12 = [(AVTCoreModelMulticolorAuxilaryPickerItem *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    objc_storeStrong((id *)&v13->_title, a4);
    objc_storeStrong((id *)&v13->_message, a5);
  }

  return v13;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)message
{
  return self->_message;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end