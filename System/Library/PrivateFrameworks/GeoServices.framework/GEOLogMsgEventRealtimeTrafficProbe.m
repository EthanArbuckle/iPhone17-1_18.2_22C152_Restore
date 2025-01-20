@interface GEOLogMsgEventRealtimeTrafficProbe
+ (BOOL)isValid:(id)a3;
- (BOOL)hasLocationCollection;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgEventRealtimeTrafficProbe)initWithDictionary:(id)a3;
- (GEOLogMsgEventRealtimeTrafficProbe)initWithJSON:(id)a3;
- (NSData)locationCollection;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setLocationCollection:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgEventRealtimeTrafficProbe

- (BOOL)hasLocationCollection
{
  return self->_locationCollection != 0;
}

- (NSData)locationCollection
{
  return self->_locationCollection;
}

- (void)setLocationCollection:(id)a3
{
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgEventRealtimeTrafficProbe;
  v4 = [(GEOLogMsgEventRealtimeTrafficProbe *)&v8 description];
  v5 = [(GEOLogMsgEventRealtimeTrafficProbe *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventBatchTrafficProbe _dictionaryRepresentation:](self, 0);
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgEventBatchTrafficProbe _dictionaryRepresentation:](self, 1);
}

- (GEOLogMsgEventRealtimeTrafficProbe)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventRealtimeTrafficProbe *)-[GEOLogMsgEventBatchTrafficProbe _initWithDictionary:isJSON:](self, a3, 0);
}

- (GEOLogMsgEventRealtimeTrafficProbe)initWithJSON:(id)a3
{
  return (GEOLogMsgEventRealtimeTrafficProbe *)-[GEOLogMsgEventBatchTrafficProbe _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventRealtimeTrafficProbeIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventRealtimeTrafficProbeReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  if (self->_locationCollection) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [(GEOLogMsgEventRealtimeTrafficProbe *)self readAll:0];
  if (self->_locationCollection) {
    objc_msgSend(v4, "setLocationCollection:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_locationCollection copyWithZone:a3];
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
    [(GEOLogMsgEventRealtimeTrafficProbe *)self readAll:1];
    [v4 readAll:1];
    locationCollection = self->_locationCollection;
    if ((unint64_t)locationCollection | v4[1]) {
      char v5 = -[NSData isEqual:](locationCollection, "isEqual:");
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
  [(GEOLogMsgEventRealtimeTrafficProbe *)self readAll:1];
  locationCollection = self->_locationCollection;

  return [(NSData *)locationCollection hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  [v4 readAll:0];
  uint64_t v5 = v4[1];

  if (v5)
  {
    [(GEOLogMsgEventRealtimeTrafficProbe *)self setLocationCollection:v5];
  }
}

- (void).cxx_destruct
{
}

@end