@interface IMNicknameEncryptionPlainRecordField
- (IMNicknameEncryptionPlainRecordField)initWithFieldName:(id)a3 plainData:(id)a4;
- (NSData)plainData;
- (NSString)fieldName;
- (id)description;
- (void)setFieldName:(id)a3;
- (void)setPlainData:(id)a3;
@end

@implementation IMNicknameEncryptionPlainRecordField

- (IMNicknameEncryptionPlainRecordField)initWithFieldName:(id)a3 plainData:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IMNicknameEncryptionPlainRecordField;
  v9 = [(IMNicknameEncryptionPlainRecordField *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fieldName, a3);
    objc_storeStrong((id *)&v10->_plainData, a4);
  }

  return v10;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(IMNicknameEncryptionPlainRecordField *)self fieldName];
  v6 = [(IMNicknameEncryptionPlainRecordField *)self plainData];
  id v7 = [v3 stringWithFormat:@"<%@: %p recordKey: %@, plainData: %@>", v4, self, v5, v6];

  return v7;
}

- (NSString)fieldName
{
  return self->_fieldName;
}

- (void)setFieldName:(id)a3
{
}

- (NSData)plainData
{
  return self->_plainData;
}

- (void)setPlainData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plainData, 0);

  objc_storeStrong((id *)&self->_fieldName, 0);
}

@end