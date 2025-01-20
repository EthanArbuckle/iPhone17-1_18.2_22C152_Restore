@interface BMPBNamedHandle
- (BOOL)hasContactIdentifier;
- (BOOL)hasHandle;
- (BOOL)hasHandleType;
- (BOOL)hasName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)contactIdentifier;
- (NSString)handle;
- (NSString)handleType;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setContactIdentifier:(id)a3;
- (void)setHandle:(id)a3;
- (void)setHandleType:(id)a3;
- (void)setName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPBNamedHandle

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)hasHandle
{
  return self->_handle != 0;
}

- (BOOL)hasContactIdentifier
{
  return self->_contactIdentifier != 0;
}

- (BOOL)hasHandleType
{
  return self->_handleType != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BMPBNamedHandle;
  v4 = [(BMPBNamedHandle *)&v8 description];
  v5 = [(BMPBNamedHandle *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"name"];
  }
  handle = self->_handle;
  if (handle) {
    [v4 setObject:handle forKey:@"handle"];
  }
  contactIdentifier = self->_contactIdentifier;
  if (contactIdentifier) {
    [v4 setObject:contactIdentifier forKey:@"contactIdentifier"];
  }
  handleType = self->_handleType;
  if (handleType) {
    [v4 setObject:handleType forKey:@"handleType"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBNamedHandleReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_handle)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_contactIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_handleType)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_name)
  {
    objc_msgSend(v4, "setName:");
    id v4 = v5;
  }
  if (self->_handle)
  {
    objc_msgSend(v5, "setHandle:");
    id v4 = v5;
  }
  if (self->_contactIdentifier)
  {
    objc_msgSend(v5, "setContactIdentifier:");
    id v4 = v5;
  }
  if (self->_handleType)
  {
    objc_msgSend(v5, "setHandleType:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_name copyWithZone:a3];
  v7 = (void *)v5[4];
  v5[4] = v6;

  uint64_t v8 = [(NSString *)self->_handle copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  uint64_t v10 = [(NSString *)self->_contactIdentifier copyWithZone:a3];
  v11 = (void *)v5[1];
  v5[1] = v10;

  uint64_t v12 = [(NSString *)self->_handleType copyWithZone:a3];
  v13 = (void *)v5[3];
  v5[3] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((name = self->_name, !((unint64_t)name | v4[4])) || -[NSString isEqual:](name, "isEqual:"))
    && ((handle = self->_handle, !((unint64_t)handle | v4[2]))
     || -[NSString isEqual:](handle, "isEqual:"))
    && ((contactIdentifier = self->_contactIdentifier, !((unint64_t)contactIdentifier | v4[1]))
     || -[NSString isEqual:](contactIdentifier, "isEqual:")))
  {
    handleType = self->_handleType;
    if ((unint64_t)handleType | v4[3]) {
      char v9 = -[NSString isEqual:](handleType, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  NSUInteger v4 = [(NSString *)self->_handle hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_contactIdentifier hash];
  return v4 ^ v5 ^ [(NSString *)self->_handleType hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[4]) {
    -[BMPBNamedHandle setName:](self, "setName:");
  }
  if (v4[2]) {
    -[BMPBNamedHandle setHandle:](self, "setHandle:");
  }
  if (v4[1]) {
    -[BMPBNamedHandle setContactIdentifier:](self, "setContactIdentifier:");
  }
  if (v4[3]) {
    -[BMPBNamedHandle setHandleType:](self, "setHandleType:");
  }
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (void)setContactIdentifier:(id)a3
{
}

- (NSString)handleType
{
  return self->_handleType;
}

- (void)setHandleType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_handleType, 0);
  objc_storeStrong((id *)&self->_handle, 0);

  objc_storeStrong((id *)&self->_contactIdentifier, 0);
}

@end