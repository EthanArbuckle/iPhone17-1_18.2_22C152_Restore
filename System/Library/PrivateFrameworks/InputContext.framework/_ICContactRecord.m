@interface _ICContactRecord
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToContactRecord:(id)a3;
- (NSString)identifier;
- (_ICContact)contact;
- (_ICContactRecord)initWithIdentifier:(id)a3 contact:(id)a4 changeType:(unsigned __int8)a5 source:(unsigned __int8)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unsigned)changeType;
- (unsigned)source;
@end

@implementation _ICContactRecord

- (_ICContactRecord)initWithIdentifier:(id)a3 contact:(id)a4 changeType:(unsigned __int8)a5 source:(unsigned __int8)a6
{
  id v11 = a3;
  id v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_ICContactRecord;
  v13 = [(_ICContactRecord *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_identifier, a3);
    objc_storeStrong((id *)&v14->_contact, a4);
    v14->_changeType = a5;
    v14->_source = a6;
  }

  return v14;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<_ICContactRecord ct:%d c:'%@' id:%@, source:%d>", self->_changeType, self->_contact, self->_identifier, self->_source];
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  unint64_t v4 = [(_ICContact *)self->_contact hash];
  uint64_t v5 = self->_changeType - (v4 - v3 + 32 * v3) + 32 * (v4 - v3 + 32 * v3);
  return self->_source - v5 + 32 * v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v4 = [_ICContactRecord alloc];
  identifier = self->_identifier;
  contact = self->_contact;
  uint64_t changeType = self->_changeType;
  uint64_t source = self->_source;
  return [(_ICContactRecord *)v4 initWithIdentifier:identifier contact:contact changeType:changeType source:source];
}

- (BOOL)isEqualToContactRecord:(id)a3
{
  unint64_t v4 = a3;
  BOOL v5 = [(NSString *)self->_identifier isEqualToString:v4[2]]
    && [(_ICContact *)self->_contact isEqual:v4[3]]
    && self->_changeType == *((unsigned __int8 *)v4 + 8);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (_ICContactRecord *)a3;
  BOOL v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(_ICContactRecord *)self isEqualToContactRecord:v5];

  return v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (_ICContact)contact
{
  return self->_contact;
}

- (unsigned)changeType
{
  return self->_changeType;
}

- (unsigned)source
{
  return self->_source;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end