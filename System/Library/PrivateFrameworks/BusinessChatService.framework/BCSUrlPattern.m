@interface BCSUrlPattern
- (BOOL)hasPath;
- (BOOL)hasQuery;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)path;
- (NSString)query;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setPath:(id)a3;
- (void)setQuery:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BCSUrlPattern

- (BOOL)hasPath
{
  return self->_path != 0;
}

- (BOOL)hasQuery
{
  return self->_query != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BCSUrlPattern;
  v4 = [(BCSUrlPattern *)&v8 description];
  v5 = [(BCSUrlPattern *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  path = self->_path;
  if (path) {
    [v3 setObject:path forKey:@"path"];
  }
  query = self->_query;
  if (query) {
    [v4 setObject:query forKey:@"query"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BCSUrlPatternReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_path)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_query)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_path)
  {
    objc_msgSend(v4, "setPath:");
    id v4 = v5;
  }
  if (self->_query)
  {
    objc_msgSend(v5, "setQuery:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_path copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_query copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((path = self->_path, !((unint64_t)path | v4[1])) || -[NSString isEqual:](path, "isEqual:")))
  {
    query = self->_query;
    if ((unint64_t)query | v4[2]) {
      char v7 = -[NSString isEqual:](query, "isEqual:");
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
  NSUInteger v3 = [(NSString *)self->_path hash];
  return [(NSString *)self->_query hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[1])
  {
    -[BCSUrlPattern setPath:](self, "setPath:");
    id v4 = v5;
  }
  if (v4[2])
  {
    -[BCSUrlPattern setQuery:](self, "setQuery:");
    id v4 = v5;
  }
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (NSString)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_query, 0);

  objc_storeStrong((id *)&self->_path, 0);
}

@end