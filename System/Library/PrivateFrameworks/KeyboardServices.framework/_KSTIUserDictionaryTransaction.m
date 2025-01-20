@interface _KSTIUserDictionaryTransaction
+ (BOOL)supportsSecureCoding;
- (_KSTIUserDictionaryEntryValue)valueToDelete;
- (_KSTIUserDictionaryEntryValue)valueToInsert;
- (_KSTIUserDictionaryTransaction)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setValueToDelete:(id)a3;
- (void)setValueToInsert:(id)a3;
@end

@implementation _KSTIUserDictionaryTransaction

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_KSTIUserDictionaryTransaction)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_KSTIUserDictionaryTransaction;
  v5 = [(_KSTIUserDictionaryTransaction *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"valueToDelete"];
    valueToDelete = v5->_valueToDelete;
    v5->_valueToDelete = (_KSTIUserDictionaryEntryValue *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"valueToInsert"];
    valueToInsert = v5->_valueToInsert;
    v5->_valueToInsert = (_KSTIUserDictionaryEntryValue *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  valueToDelete = self->_valueToDelete;
  id v7 = v4;
  if (valueToDelete)
  {
    [v4 encodeObject:valueToDelete forKey:@"valueToDelete"];
    id v4 = v7;
  }
  valueToInsert = self->_valueToInsert;
  if (valueToInsert)
  {
    [v7 encodeObject:valueToInsert forKey:@"valueToInsert"];
    id v4 = v7;
  }
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(_KSTIUserDictionaryTransaction *)self valueToDelete];
  uint64_t v6 = [(_KSTIUserDictionaryTransaction *)self valueToInsert];
  id v7 = [v3 stringWithFormat:@"<%@: valueToDelete = %@, valueToInsert = %@>", v4, v5, v6];

  return v7;
}

- (_KSTIUserDictionaryEntryValue)valueToDelete
{
  return self->_valueToDelete;
}

- (void)setValueToDelete:(id)a3
{
}

- (_KSTIUserDictionaryEntryValue)valueToInsert
{
  return self->_valueToInsert;
}

- (void)setValueToInsert:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueToInsert, 0);
  objc_storeStrong((id *)&self->_valueToDelete, 0);
}

@end