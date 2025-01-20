@interface BMPBPersonName
- (BMPBNameComponents)nameComponents;
- (BOOL)hasName;
- (BOOL)hasNameComponents;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setName:(id)a3;
- (void)setNameComponents:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPBPersonName

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)hasNameComponents
{
  return self->_nameComponents != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BMPBPersonName;
  v4 = [(BMPBPersonName *)&v8 description];
  v5 = [(BMPBPersonName *)self dictionaryRepresentation];
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
  nameComponents = self->_nameComponents;
  if (nameComponents)
  {
    v7 = [(BMPBNameComponents *)nameComponents dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"nameComponents"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBPersonNameReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_nameComponents)
  {
    PBDataWriterWriteSubmessage();
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
  if (self->_nameComponents)
  {
    objc_msgSend(v5, "setNameComponents:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_name copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(BMPBNameComponents *)self->_nameComponents copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((name = self->_name, !((unint64_t)name | v4[1])) || -[NSString isEqual:](name, "isEqual:")))
  {
    nameComponents = self->_nameComponents;
    if ((unint64_t)nameComponents | v4[2]) {
      char v7 = -[BMPBNameComponents isEqual:](nameComponents, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  return [(BMPBNameComponents *)self->_nameComponents hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v7 = v4;
  if (v4[1])
  {
    -[BMPBPersonName setName:](self, "setName:");
    id v4 = v7;
  }
  nameComponents = self->_nameComponents;
  uint64_t v6 = v4[2];
  if (nameComponents)
  {
    if (v6) {
      -[BMPBNameComponents mergeFrom:](nameComponents, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[BMPBPersonName setNameComponents:](self, "setNameComponents:");
  }

  MEMORY[0x1F41817F8]();
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (BMPBNameComponents)nameComponents
{
  return self->_nameComponents;
}

- (void)setNameComponents:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameComponents, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end