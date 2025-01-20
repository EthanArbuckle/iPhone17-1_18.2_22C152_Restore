@interface GEOLogMsgStateMarket
+ (BOOL)isValid:(id)a3;
- (BOOL)hasMarket;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgStateMarket)initWithDictionary:(id)a3;
- (GEOLogMsgStateMarket)initWithJSON:(id)a3;
- (NSString)market;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setMarket:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgStateMarket

- (void)setMarket:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)writeTo:(id)a3
{
  if (self->_market) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)hasMarket
{
  return self->_market != 0;
}

- (NSString)market
{
  return self->_market;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgStateMarket;
  v4 = [(GEOLogMsgStateMarket *)&v8 description];
  v5 = [(GEOLogMsgStateMarket *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v2 = [MEMORY[0x1E4F1CA60] dictionary];
    v3 = [a1 market];
    if (v3) {
      [v2 setObject:v3 forKey:@"market"];
    }
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (GEOLogMsgStateMarket)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateMarket *)-[GEOLogMsgStateMarket _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      v4 = [v3 objectForKeyedSubscript:@"market"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v5 = (void *)[v4 copy];
        [a1 setMarket:v5];
      }
    }
  }

  return a1;
}

- (GEOLogMsgStateMarket)initWithJSON:(id)a3
{
  return (GEOLogMsgStateMarket *)-[GEOLogMsgStateMarket _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateMarketIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateMarketReadAllFrom((uint64_t)self, a3);
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [(GEOLogMsgStateMarket *)self readAll:0];
  if (self->_market) {
    objc_msgSend(v4, "setMarket:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_market copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    char v5 = 1;
    [(GEOLogMsgStateMarket *)self readAll:1];
    [v4 readAll:1];
    market = self->_market;
    if ((unint64_t)market | v4[1]) {
      char v5 = -[NSString isEqual:](market, "isEqual:");
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  [(GEOLogMsgStateMarket *)self readAll:1];
  market = self->_market;

  return [(NSString *)market hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  [v4 readAll:0];
  uint64_t v5 = v4[1];

  if (v5)
  {
    [(GEOLogMsgStateMarket *)self setMarket:v5];
  }
}

@end