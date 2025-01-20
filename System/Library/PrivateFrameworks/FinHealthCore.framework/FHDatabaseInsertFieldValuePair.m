@interface FHDatabaseInsertFieldValuePair
- (FHDatabaseInsertFieldValuePair)initWithQuoteWrapOption:(id)a3 fieldValue:(id)a4 quoteWrap:(BOOL)a5;
- (NSString)fieldName;
- (NSString)fieldValue;
- (id)description;
- (void)setFieldName:(id)a3;
- (void)setFieldValue:(id)a3;
@end

@implementation FHDatabaseInsertFieldValuePair

- (FHDatabaseInsertFieldValuePair)initWithQuoteWrapOption:(id)a3 fieldValue:(id)a4 quoteWrap:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v20.receiver = self;
  v20.super_class = (Class)FHDatabaseInsertFieldValuePair;
  v10 = [(FHDatabaseInsertFieldValuePair *)&v20 init];
  if (v10)
  {
    v11 = (void *)[v8 copy];
    uint64_t v12 = [v11 lowercaseString];
    fieldName = v10->_fieldName;
    v10->_fieldName = (NSString *)v12;

    if (a5)
    {
      v14 = NSString;
      v15 = (NSString *)[v9 copy];
      uint64_t v16 = [v14 stringWithFormat:@"'%@'", v15];
      fieldValue = v10->_fieldValue;
      v10->_fieldValue = (NSString *)v16;
    }
    else
    {
      uint64_t v18 = [v9 copy];
      v15 = v10->_fieldValue;
      v10->_fieldValue = (NSString *)v18;
    }
  }
  return v10;
}

- (id)description
{
  v3 = [MEMORY[0x263F089D8] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"fieldName: '%@'; ", self->_fieldName];
  [v3 appendFormat:@"fieldValue: '%@'; ", self->_fieldValue];
  [v3 appendFormat:@">"];
  return v3;
}

- (NSString)fieldName
{
  return self->_fieldName;
}

- (void)setFieldName:(id)a3
{
}

- (NSString)fieldValue
{
  return self->_fieldValue;
}

- (void)setFieldValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldValue, 0);
  objc_storeStrong((id *)&self->_fieldName, 0);
}

@end