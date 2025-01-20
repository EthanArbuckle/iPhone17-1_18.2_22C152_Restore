@interface HMBModelFieldOptionExternalRecordField
- (BOOL)encrypted;
- (HMBModelFieldOptionExternalRecordField)initWithExternalRecordField:(id)a3 encrypted:(BOOL)a4;
- (NSString)fieldName;
- (void)applyTo:(id)a3;
@end

@implementation HMBModelFieldOptionExternalRecordField

- (void).cxx_destruct
{
}

- (BOOL)encrypted
{
  return self->_encrypted;
}

- (NSString)fieldName
{
  return self->_fieldName;
}

- (void)applyTo:(id)a3
{
  id v5 = a3;
  v4 = [(HMBModelFieldOptionExternalRecordField *)self fieldName];
  [v5 setExternalRecordField:v4];

  objc_msgSend(v5, "setEncrypted:", -[HMBModelFieldOptionExternalRecordField encrypted](self, "encrypted"));
}

- (HMBModelFieldOptionExternalRecordField)initWithExternalRecordField:(id)a3 encrypted:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMBModelFieldOptionExternalRecordField;
  v8 = [(HMBModelFieldOptionExternalRecordField *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_fieldName, a3);
    v9->_encrypted = a4;
  }

  return v9;
}

@end