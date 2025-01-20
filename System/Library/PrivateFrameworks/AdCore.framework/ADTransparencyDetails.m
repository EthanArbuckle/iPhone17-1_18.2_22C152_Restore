@interface ADTransparencyDetails
- (BOOL)hasTransparencyDetailsUnavailableMessage;
- (BOOL)hasTransparencyRendererPayload;
- (BOOL)hasTransparencyRendererURL;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)transparencyDetailsUnavailableMessage;
- (NSString)transparencyRendererPayload;
- (NSString)transparencyRendererURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setTransparencyDetailsUnavailableMessage:(id)a3;
- (void)setTransparencyRendererPayload:(id)a3;
- (void)setTransparencyRendererURL:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ADTransparencyDetails

- (BOOL)hasTransparencyDetailsUnavailableMessage
{
  return self->_transparencyDetailsUnavailableMessage != 0;
}

- (BOOL)hasTransparencyRendererPayload
{
  return self->_transparencyRendererPayload != 0;
}

- (BOOL)hasTransparencyRendererURL
{
  return self->_transparencyRendererURL != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ADTransparencyDetails;
  v4 = [(ADTransparencyDetails *)&v8 description];
  v5 = [(ADTransparencyDetails *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  transparencyDetailsUnavailableMessage = self->_transparencyDetailsUnavailableMessage;
  if (transparencyDetailsUnavailableMessage) {
    [v3 setObject:transparencyDetailsUnavailableMessage forKey:@"transparencyDetailsUnavailableMessage"];
  }
  transparencyRendererPayload = self->_transparencyRendererPayload;
  if (transparencyRendererPayload) {
    [v4 setObject:transparencyRendererPayload forKey:@"transparencyRendererPayload"];
  }
  transparencyRendererURL = self->_transparencyRendererURL;
  if (transparencyRendererURL) {
    [v4 setObject:transparencyRendererURL forKey:@"transparencyRendererURL"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ADTransparencyDetailsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_transparencyDetailsUnavailableMessage)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_transparencyRendererPayload)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_transparencyRendererURL)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_transparencyDetailsUnavailableMessage)
  {
    objc_msgSend(v4, "setTransparencyDetailsUnavailableMessage:");
    id v4 = v5;
  }
  if (self->_transparencyRendererPayload)
  {
    objc_msgSend(v5, "setTransparencyRendererPayload:");
    id v4 = v5;
  }
  if (self->_transparencyRendererURL)
  {
    objc_msgSend(v5, "setTransparencyRendererURL:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_transparencyDetailsUnavailableMessage copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_transparencyRendererPayload copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  uint64_t v10 = [(NSString *)self->_transparencyRendererURL copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((transparencyDetailsUnavailableMessage = self->_transparencyDetailsUnavailableMessage,
         !((unint64_t)transparencyDetailsUnavailableMessage | v4[1]))
     || -[NSString isEqual:](transparencyDetailsUnavailableMessage, "isEqual:"))
    && ((transparencyRendererPayload = self->_transparencyRendererPayload,
         !((unint64_t)transparencyRendererPayload | v4[2]))
     || -[NSString isEqual:](transparencyRendererPayload, "isEqual:")))
  {
    transparencyRendererURL = self->_transparencyRendererURL;
    if ((unint64_t)transparencyRendererURL | v4[3]) {
      char v8 = -[NSString isEqual:](transparencyRendererURL, "isEqual:");
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
  NSUInteger v3 = [(NSString *)self->_transparencyDetailsUnavailableMessage hash];
  NSUInteger v4 = [(NSString *)self->_transparencyRendererPayload hash] ^ v3;
  return v4 ^ [(NSString *)self->_transparencyRendererURL hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[1]) {
    -[ADTransparencyDetails setTransparencyDetailsUnavailableMessage:](self, "setTransparencyDetailsUnavailableMessage:");
  }
  if (v4[2]) {
    -[ADTransparencyDetails setTransparencyRendererPayload:](self, "setTransparencyRendererPayload:");
  }
  if (v4[3]) {
    -[ADTransparencyDetails setTransparencyRendererURL:](self, "setTransparencyRendererURL:");
  }
}

- (NSString)transparencyDetailsUnavailableMessage
{
  return self->_transparencyDetailsUnavailableMessage;
}

- (void)setTransparencyDetailsUnavailableMessage:(id)a3
{
}

- (NSString)transparencyRendererPayload
{
  return self->_transparencyRendererPayload;
}

- (void)setTransparencyRendererPayload:(id)a3
{
}

- (NSString)transparencyRendererURL
{
  return self->_transparencyRendererURL;
}

- (void)setTransparencyRendererURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transparencyRendererURL, 0);
  objc_storeStrong((id *)&self->_transparencyRendererPayload, 0);
  objc_storeStrong((id *)&self->_transparencyDetailsUnavailableMessage, 0);
}

@end