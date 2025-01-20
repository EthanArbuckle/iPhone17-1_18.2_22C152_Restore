@interface CKSQLiteKeyValueTableEntry
- (NSCoding)object;
- (NSData)data;
- (NSDate)date;
- (NSNumber)number;
- (NSNumber)scope;
- (NSString)key;
- (NSString)scopeIdentifier;
- (NSString)string;
- (NSUUID)UUID;
- (void)setData:(id)a3;
- (void)setDate:(id)a3;
- (void)setKey:(id)a3;
- (void)setNumber:(id)a3;
- (void)setObject:(id)a3;
- (void)setScope:(id)a3;
- (void)setScopeIdentifier:(id)a3;
- (void)setString:(id)a3;
- (void)setUUID:(id)a3;
@end

@implementation CKSQLiteKeyValueTableEntry

- (NSNumber)scope
{
  return self->_scope;
}

- (void)setScope:(id)a3
{
}

- (NSString)scopeIdentifier
{
  return self->_scopeIdentifier;
}

- (void)setScopeIdentifier:(id)a3
{
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (NSNumber)number
{
  return self->_number;
}

- (void)setNumber:(id)a3
{
}

- (NSString)string
{
  return self->_string;
}

- (void)setString:(id)a3
{
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
}

- (NSCoding)object
{
  return self->_object;
}

- (void)setObject:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_object, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_string, 0);
  objc_storeStrong((id *)&self->_number, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_scopeIdentifier, 0);

  objc_storeStrong((id *)&self->_scope, 0);
}

@end