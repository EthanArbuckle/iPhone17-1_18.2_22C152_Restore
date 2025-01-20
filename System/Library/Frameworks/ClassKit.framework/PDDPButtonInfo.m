@interface PDDPButtonInfo
- (BOOL)hasTitle;
- (BOOL)hasUrl;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)title;
- (NSString)url;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUrl:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPButtonInfo

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasUrl
{
  return self->_url != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPButtonInfo;
  v3 = [(PDDPButtonInfo *)&v7 description];
  v4 = [(PDDPButtonInfo *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  title = self->_title;
  if (title) {
    [v3 setObject:title forKey:@"title"];
  }
  url = self->_url;
  if (url) {
    [v4 setObject:url forKey:@"url"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100162B40((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_title)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_url)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_title)
  {
    objc_msgSend(v4, "setTitle:");
    id v4 = v5;
  }
  if (self->_url)
  {
    objc_msgSend(v5, "setUrl:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_title copyWithZone:a3];
  objc_super v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(NSString *)self->_url copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((title = self->_title, !((unint64_t)title | v4[1]))
     || -[NSString isEqual:](title, "isEqual:")))
  {
    url = self->_url;
    if ((unint64_t)url | v4[2]) {
      unsigned __int8 v7 = -[NSString isEqual:](url, "isEqual:");
    }
    else {
      unsigned __int8 v7 = 1;
    }
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_title hash];
  return [(NSString *)self->_url hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[1])
  {
    -[PDDPButtonInfo setTitle:](self, "setTitle:");
    id v4 = v5;
  }
  if (v4[2])
  {
    -[PDDPButtonInfo setUrl:](self, "setUrl:");
    id v4 = v5;
  }
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end