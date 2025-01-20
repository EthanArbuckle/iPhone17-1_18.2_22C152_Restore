@interface GEOLogMsgEventPressureData
+ (BOOL)isValid:(id)a3;
- (BOOL)hasPressureData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgEventPressureData)initWithDictionary:(id)a3;
- (GEOLogMsgEventPressureData)initWithJSON:(id)a3;
- (NSData)pressureData;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setPressureData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgEventPressureData

- (BOOL)hasPressureData
{
  return self->_pressureData != 0;
}

- (NSData)pressureData
{
  return self->_pressureData;
}

- (void)setPressureData:(id)a3
{
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgEventPressureData;
  v4 = [(GEOLogMsgEventPressureData *)&v8 description];
  v5 = [(GEOLogMsgEventPressureData *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventPressureData _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 pressureData];
    v6 = v5;
    if (v5)
    {
      if (a2)
      {
        v7 = [v5 base64EncodedStringWithOptions:0];
        [v4 setObject:v7 forKey:@"pressureData"];
      }
      else
      {
        [v4 setObject:v5 forKey:@"pressure_data"];
      }
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
  return -[GEOLogMsgEventPressureData _dictionaryRepresentation:](self, 1);
}

- (GEOLogMsgEventPressureData)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventPressureData *)-[GEOLogMsgEventPressureData _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"pressureData";
      }
      else {
        v6 = @"pressure_data";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v7 options:0];
        [a1 setPressureData:v8];
      }
    }
  }

  return a1;
}

- (GEOLogMsgEventPressureData)initWithJSON:(id)a3
{
  return (GEOLogMsgEventPressureData *)-[GEOLogMsgEventPressureData _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventPressureDataIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventPressureDataReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  if (self->_pressureData) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [(GEOLogMsgEventPressureData *)self readAll:0];
  if (self->_pressureData) {
    objc_msgSend(v4, "setPressureData:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_pressureData copyWithZone:a3];
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
    [(GEOLogMsgEventPressureData *)self readAll:1];
    [v4 readAll:1];
    pressureData = self->_pressureData;
    if ((unint64_t)pressureData | v4[1]) {
      char v5 = -[NSData isEqual:](pressureData, "isEqual:");
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
  [(GEOLogMsgEventPressureData *)self readAll:1];
  pressureData = self->_pressureData;

  return [(NSData *)pressureData hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  [v4 readAll:0];
  uint64_t v5 = v4[1];

  if (v5)
  {
    [(GEOLogMsgEventPressureData *)self setPressureData:v5];
  }
}

- (void).cxx_destruct
{
}

@end