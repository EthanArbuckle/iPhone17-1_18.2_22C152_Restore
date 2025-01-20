@interface SGM2PerfSuggestdLaunched
- (BOOL)hasKey;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)key;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setKey:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SGM2PerfSuggestdLaunched

- (void).cxx_destruct
{
}

- (void)setKey:(id)a3
{
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[SGM2PerfSuggestdLaunched setKey:](self, "setKey:");
  }
}

- (unint64_t)hash
{
  return [(NSString *)self->_key hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    key = self->_key;
    if ((unint64_t)key | v4[1]) {
      unsigned __int8 v6 = -[NSString isEqual:](key, "isEqual:");
    }
    else {
      unsigned __int8 v6 = 1;
    }
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_key copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (void)copyTo:(id)a3
{
  key = self->_key;
  if (key) {
    [a3 setKey:key];
  }
}

- (void)writeTo:(id)a3
{
  if (self->_key) {
    _PBDataWriterWriteStringField(a3);
  }
}

- (BOOL)readFrom:(id)a3
{
  return SGM2PerfSuggestdLaunchedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  key = self->_key;
  if (key) {
    [v3 setObject:key forKey:@"key"];
  }

  return v4;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)SGM2PerfSuggestdLaunched;
  v3 = [(SGM2PerfSuggestdLaunched *)&v7 description];
  v4 = [(SGM2PerfSuggestdLaunched *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (NSString)key
{
  if (self->_key) {
    return self->_key;
  }
  else {
    return (NSString *)@"PerfSuggestdLaunched";
  }
}

@end