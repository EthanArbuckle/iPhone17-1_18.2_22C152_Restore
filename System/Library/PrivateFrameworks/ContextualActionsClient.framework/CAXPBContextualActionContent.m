@interface CAXPBContextualActionContent
- (BOOL)hasContentMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)contentMetadata;
- (NSString)contentType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setContentMetadata:(id)a3;
- (void)setContentType:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CAXPBContextualActionContent

- (BOOL)hasContentMetadata
{
  return self->_contentMetadata != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CAXPBContextualActionContent;
  v4 = [(CAXPBContextualActionContent *)&v8 description];
  v5 = [(CAXPBContextualActionContent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  contentType = self->_contentType;
  if (contentType) {
    [v3 setObject:contentType forKey:@"contentType"];
  }
  contentMetadata = self->_contentMetadata;
  if (contentMetadata) {
    [v4 setObject:contentMetadata forKey:@"contentMetadata"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return CAXPBContextualActionContentReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_contentType) {
    -[CAXPBContextualActionContent writeTo:]();
  }
  id v5 = v4;
  PBDataWriterWriteStringField();
  if (self->_contentMetadata) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [v4 setContentType:self->_contentType];
  if (self->_contentMetadata) {
    objc_msgSend(v4, "setContentMetadata:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_contentType copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSData *)self->_contentMetadata copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((contentType = self->_contentType, !((unint64_t)contentType | v4[2]))
     || -[NSString isEqual:](contentType, "isEqual:")))
  {
    contentMetadata = self->_contentMetadata;
    if ((unint64_t)contentMetadata | v4[1]) {
      char v7 = -[NSData isEqual:](contentMetadata, "isEqual:");
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
  NSUInteger v3 = [(NSString *)self->_contentType hash];
  return [(NSData *)self->_contentMetadata hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[2])
  {
    -[CAXPBContextualActionContent setContentType:](self, "setContentType:");
    id v4 = v5;
  }
  if (v4[1])
  {
    -[CAXPBContextualActionContent setContentMetadata:](self, "setContentMetadata:");
    id v4 = v5;
  }
}

- (NSString)contentType
{
  return self->_contentType;
}

- (void)setContentType:(id)a3
{
}

- (NSData)contentMetadata
{
  return self->_contentMetadata;
}

- (void)setContentMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_contentMetadata, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[CAXPBContextualActionContent writeTo:]", "CAXPBContextualActionContent.m", 82, "nil != self->_contentType");
}

@end