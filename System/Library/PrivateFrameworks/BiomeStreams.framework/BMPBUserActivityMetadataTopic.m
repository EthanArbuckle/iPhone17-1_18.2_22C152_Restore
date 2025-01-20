@interface BMPBUserActivityMetadataTopic
- (BOOL)hasTitle;
- (BOOL)hasTopicIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)title;
- (NSString)topicIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTopicIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPBUserActivityMetadataTopic

- (BOOL)hasTopicIdentifier
{
  return self->_topicIdentifier != 0;
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BMPBUserActivityMetadataTopic;
  v4 = [(BMPBUserActivityMetadataTopic *)&v8 description];
  v5 = [(BMPBUserActivityMetadataTopic *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  topicIdentifier = self->_topicIdentifier;
  if (topicIdentifier) {
    [v3 setObject:topicIdentifier forKey:@"topicIdentifier"];
  }
  title = self->_title;
  if (title) {
    [v4 setObject:title forKey:@"title"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBUserActivityMetadataTopicReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_topicIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_title)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_topicIdentifier)
  {
    objc_msgSend(v4, "setTopicIdentifier:");
    id v4 = v5;
  }
  if (self->_title)
  {
    objc_msgSend(v5, "setTitle:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_topicIdentifier copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSString *)self->_title copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((topicIdentifier = self->_topicIdentifier, !((unint64_t)topicIdentifier | v4[2]))
     || -[NSString isEqual:](topicIdentifier, "isEqual:")))
  {
    title = self->_title;
    if ((unint64_t)title | v4[1]) {
      char v7 = -[NSString isEqual:](title, "isEqual:");
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
  NSUInteger v3 = [(NSString *)self->_topicIdentifier hash];
  return [(NSString *)self->_title hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[2])
  {
    -[BMPBUserActivityMetadataTopic setTopicIdentifier:](self, "setTopicIdentifier:");
    id v4 = v5;
  }
  if (v4[1])
  {
    -[BMPBUserActivityMetadataTopic setTitle:](self, "setTitle:");
    id v4 = v5;
  }
}

- (NSString)topicIdentifier
{
  return self->_topicIdentifier;
}

- (void)setTopicIdentifier:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topicIdentifier, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end