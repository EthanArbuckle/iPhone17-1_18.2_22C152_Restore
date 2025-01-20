@interface GEOLogMsgEventFullNavTrace
+ (BOOL)isValid:(id)a3;
- (BOOL)hasNavTraceData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgEventFullNavTrace)initWithDictionary:(id)a3;
- (GEOLogMsgEventFullNavTrace)initWithJSON:(id)a3;
- (NSData)navTraceData;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setNavTraceData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgEventFullNavTrace

- (BOOL)hasNavTraceData
{
  return self->_navTraceData != 0;
}

- (NSData)navTraceData
{
  return self->_navTraceData;
}

- (void)setNavTraceData:(id)a3
{
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgEventFullNavTrace;
  v4 = [(GEOLogMsgEventFullNavTrace *)&v8 description];
  v5 = [(GEOLogMsgEventFullNavTrace *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventFullNavTrace _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 navTraceData];
    v6 = v5;
    if (v5)
    {
      if (a2)
      {
        v7 = [v5 base64EncodedStringWithOptions:0];
        [v4 setObject:v7 forKey:@"navTraceData"];
      }
      else
      {
        [v4 setObject:v5 forKey:@"nav_trace_data"];
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
  return -[GEOLogMsgEventFullNavTrace _dictionaryRepresentation:](self, 1);
}

- (GEOLogMsgEventFullNavTrace)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventFullNavTrace *)-[GEOLogMsgEventFullNavTrace _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"navTraceData";
      }
      else {
        v6 = @"nav_trace_data";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v7 options:0];
        [a1 setNavTraceData:v8];
      }
    }
  }

  return a1;
}

- (GEOLogMsgEventFullNavTrace)initWithJSON:(id)a3
{
  return (GEOLogMsgEventFullNavTrace *)-[GEOLogMsgEventFullNavTrace _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventFullNavTraceIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventFullNavTraceReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  if (self->_navTraceData) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [(GEOLogMsgEventFullNavTrace *)self readAll:0];
  if (self->_navTraceData) {
    objc_msgSend(v4, "setNavTraceData:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_navTraceData copyWithZone:a3];
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
    [(GEOLogMsgEventFullNavTrace *)self readAll:1];
    [v4 readAll:1];
    navTraceData = self->_navTraceData;
    if ((unint64_t)navTraceData | v4[1]) {
      char v5 = -[NSData isEqual:](navTraceData, "isEqual:");
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
  [(GEOLogMsgEventFullNavTrace *)self readAll:1];
  navTraceData = self->_navTraceData;

  return [(NSData *)navTraceData hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  [v4 readAll:0];
  uint64_t v5 = v4[1];

  if (v5)
  {
    [(GEOLogMsgEventFullNavTrace *)self setNavTraceData:v5];
  }
}

- (void).cxx_destruct
{
}

@end