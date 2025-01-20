@interface _DKPRValueType
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (uint64_t)setType:(uint64_t)result;
- (uint64_t)setTypeCode:(uint64_t)result;
- (uint64_t)type;
- (uint64_t)typeCode;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation _DKPRValueType

- (uint64_t)setType:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 16) = a2;
  }
  return result;
}

- (uint64_t)setTypeCode:(uint64_t)result
{
  if (result) {
    *(void *)(result + 8) = a2;
  }
  return result;
}

- (void)writeTo:(id)a3
{
  id v3 = a3;
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt64Field();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_DKPRValueType;
  v4 = [(_DKPRValueType *)&v8 description];
  v5 = [(_DKPRValueType *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t type = self->_type;
  if (type >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_type);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_1E560F868[type];
  }
  [v3 setObject:v5 forKey:@"type"];

  v6 = [NSNumber numberWithLongLong:self->_typeCode];
  [v3 setObject:v6 forKey:@"typeCode"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _DKPRValueTypeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 4) = self->_type;
  *((void *)result + 1) = self->_typeCode;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 isMemberOfClass:objc_opt_class()]
    && self->_type == *((_DWORD *)v4 + 4)
    && self->_typeCode == *((void *)v4 + 1);

  return v5;
}

- (unint64_t)hash
{
  return (2654435761 * self->_typeCode) ^ (2654435761 * self->_type);
}

- (uint64_t)type
{
  if (result) {
    return *(unsigned int *)(result + 16);
  }
  return result;
}

- (uint64_t)typeCode
{
  if (result) {
    return *(void *)(result + 8);
  }
  return result;
}

@end