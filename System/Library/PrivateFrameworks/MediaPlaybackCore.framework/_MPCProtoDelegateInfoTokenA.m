@interface _MPCProtoDelegateInfoTokenA
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (uint64_t)picRequestData;
- (unint64_t)hash;
- (void)setPicRequestData:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation _MPCProtoDelegateInfoTokenA

- (void).cxx_destruct
{
}

- (unint64_t)hash
{
  return [(NSData *)self->_picRequestData hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    picRequestData = self->_picRequestData;
    if ((unint64_t)picRequestData | v4[1]) {
      char v6 = -[NSData isEqual:](picRequestData, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_picRequestData copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (void)writeTo:(id)a3
{
  if (self->_picRequestData) {
    PBDataWriterWriteDataField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _MPCProtoDelegateInfoTokenAReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  picRequestData = self->_picRequestData;
  if (picRequestData) {
    [v3 setObject:picRequestData forKey:@"picRequestData"];
  }

  return v4;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MPCProtoDelegateInfoTokenA;
  v4 = [(_MPCProtoDelegateInfoTokenA *)&v8 description];
  v5 = [(_MPCProtoDelegateInfoTokenA *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (void)setPicRequestData:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 8), a2);
  }
}

- (uint64_t)picRequestData
{
  if (result) {
    return *(void *)(result + 8);
  }
  return result;
}

@end