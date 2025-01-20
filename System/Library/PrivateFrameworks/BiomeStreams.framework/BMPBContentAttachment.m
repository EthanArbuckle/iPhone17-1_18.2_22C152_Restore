@interface BMPBContentAttachment
- (BOOL)hasFilename;
- (BOOL)hasPath;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)filename;
- (NSString)path;
- (NSString)type;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFilename:(id)a3;
- (void)setPath:(id)a3;
- (void)setType:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPBContentAttachment

- (BOOL)hasType
{
  return self->_type != 0;
}

- (BOOL)hasFilename
{
  return self->_filename != 0;
}

- (BOOL)hasPath
{
  return self->_path != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BMPBContentAttachment;
  v4 = [(BMPBContentAttachment *)&v8 description];
  v5 = [(BMPBContentAttachment *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  type = self->_type;
  if (type) {
    [v3 setObject:type forKey:@"type"];
  }
  filename = self->_filename;
  if (filename) {
    [v4 setObject:filename forKey:@"filename"];
  }
  path = self->_path;
  if (path) {
    [v4 setObject:path forKey:@"path"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBContentAttachmentReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_type)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_filename)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_path)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_type)
  {
    objc_msgSend(v4, "setType:");
    id v4 = v5;
  }
  if (self->_filename)
  {
    objc_msgSend(v5, "setFilename:");
    id v4 = v5;
  }
  if (self->_path)
  {
    objc_msgSend(v5, "setPath:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_type copyWithZone:a3];
  v7 = (void *)v5[3];
  v5[3] = v6;

  uint64_t v8 = [(NSString *)self->_filename copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  uint64_t v10 = [(NSString *)self->_path copyWithZone:a3];
  v11 = (void *)v5[2];
  v5[2] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((type = self->_type, !((unint64_t)type | v4[3])) || -[NSString isEqual:](type, "isEqual:"))
    && ((filename = self->_filename, !((unint64_t)filename | v4[1]))
     || -[NSString isEqual:](filename, "isEqual:")))
  {
    path = self->_path;
    if ((unint64_t)path | v4[2]) {
      char v8 = -[NSString isEqual:](path, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_type hash];
  NSUInteger v4 = [(NSString *)self->_filename hash] ^ v3;
  return v4 ^ [(NSString *)self->_path hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[3]) {
    -[BMPBContentAttachment setType:](self, "setType:");
  }
  if (v4[1]) {
    -[BMPBContentAttachment setFilename:](self, "setFilename:");
  }
  if (v4[2]) {
    -[BMPBContentAttachment setPath:](self, "setPath:");
  }
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (NSString)filename
{
  return self->_filename;
}

- (void)setFilename:(id)a3
{
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_path, 0);

  objc_storeStrong((id *)&self->_filename, 0);
}

@end