@interface GEOLogMsgStateImpressionObject
+ (BOOL)isValid:(id)a3;
- (BOOL)hasImpressionObjectId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOImpressionObjectId)impressionObjectId;
- (GEOLogMsgStateImpressionObject)initWithDictionary:(id)a3;
- (GEOLogMsgStateImpressionObject)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setImpressionObjectId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgStateImpressionObject

- (BOOL)hasImpressionObjectId
{
  return self->_impressionObjectId != 0;
}

- (GEOImpressionObjectId)impressionObjectId
{
  return self->_impressionObjectId;
}

- (void)setImpressionObjectId:(id)a3
{
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgStateImpressionObject;
  v4 = [(GEOLogMsgStateImpressionObject *)&v8 description];
  v5 = [(GEOLogMsgStateImpressionObject *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateImpressionObject _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 impressionObjectId];
    v6 = v5;
    if (v5)
    {
      if (a2)
      {
        v7 = [v5 jsonRepresentation];
        objc_super v8 = @"impressionObjectId";
      }
      else
      {
        v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"impression_object_id";
      }
      [v4 setObject:v7 forKey:v8];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgStateImpressionObject _dictionaryRepresentation:](self, 1);
}

- (GEOLogMsgStateImpressionObject)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateImpressionObject *)-[GEOLogMsgStateImpressionObject _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        v6 = @"impressionObjectId";
      }
      else {
        v6 = @"impression_object_id";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = [GEOImpressionObjectId alloc];
        if (a3) {
          uint64_t v9 = [(GEOImpressionObjectId *)v8 initWithJSON:v7];
        }
        else {
          uint64_t v9 = [(GEOImpressionObjectId *)v8 initWithDictionary:v7];
        }
        v10 = (void *)v9;
        [a1 setImpressionObjectId:v9];
      }
    }
  }

  return a1;
}

- (GEOLogMsgStateImpressionObject)initWithJSON:(id)a3
{
  return (GEOLogMsgStateImpressionObject *)-[GEOLogMsgStateImpressionObject _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateImpressionObjectIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateImpressionObjectReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  if (self->_impressionObjectId) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [(GEOLogMsgStateImpressionObject *)self readAll:0];
  if (self->_impressionObjectId) {
    objc_msgSend(v4, "setImpressionObjectId:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(GEOImpressionObjectId *)self->_impressionObjectId copyWithZone:a3];
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
    [(GEOLogMsgStateImpressionObject *)self readAll:1];
    [v4 readAll:1];
    impressionObjectId = self->_impressionObjectId;
    if ((unint64_t)impressionObjectId | v4[1]) {
      char v5 = -[GEOImpressionObjectId isEqual:](impressionObjectId, "isEqual:");
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
  [(GEOLogMsgStateImpressionObject *)self readAll:1];
  impressionObjectId = self->_impressionObjectId;

  return [(GEOImpressionObjectId *)impressionObjectId hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  [v4 readAll:0];
  impressionObjectId = self->_impressionObjectId;
  uint64_t v6 = v4[1];

  if (impressionObjectId)
  {
    if (v6)
    {
      [(GEOImpressionObjectId *)impressionObjectId mergeFrom:v6];
    }
  }
  else if (v6)
  {
    [(GEOLogMsgStateImpressionObject *)self setImpressionObjectId:v6];
  }
}

- (void).cxx_destruct
{
}

@end