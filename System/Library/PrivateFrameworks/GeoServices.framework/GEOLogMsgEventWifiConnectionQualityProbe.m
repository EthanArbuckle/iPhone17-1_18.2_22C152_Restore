@interface GEOLogMsgEventWifiConnectionQualityProbe
+ (BOOL)isValid:(id)a3;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasWifiConnectionQuality;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgEventWifiConnectionQualityProbe)initWithDictionary:(id)a3;
- (GEOLogMsgEventWifiConnectionQualityProbe)initWithJSON:(id)a3;
- (GEOWiFiConnectionQuality)wifiConnectionQuality;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setWifiConnectionQuality:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgEventWifiConnectionQualityProbe

- (BOOL)hasWifiConnectionQuality
{
  return self->_wifiConnectionQuality != 0;
}

- (GEOWiFiConnectionQuality)wifiConnectionQuality
{
  return self->_wifiConnectionQuality;
}

- (void)setWifiConnectionQuality:(id)a3
{
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgEventWifiConnectionQualityProbe;
  v4 = [(GEOLogMsgEventWifiConnectionQualityProbe *)&v8 description];
  v5 = [(GEOLogMsgEventWifiConnectionQualityProbe *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventWifiConnectionQualityProbe _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 wifiConnectionQuality];
    v6 = v5;
    if (v5)
    {
      if (a2)
      {
        v7 = [v5 jsonRepresentation];
        objc_super v8 = @"wifiConnectionQuality";
      }
      else
      {
        v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"wifi_connection_quality";
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
  return -[GEOLogMsgEventWifiConnectionQualityProbe _dictionaryRepresentation:](self, 1);
}

- (GEOLogMsgEventWifiConnectionQualityProbe)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventWifiConnectionQualityProbe *)-[GEOLogMsgEventWifiConnectionQualityProbe _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"wifiConnectionQuality";
      }
      else {
        v6 = @"wifi_connection_quality";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = [GEOWiFiConnectionQuality alloc];
        if (a3) {
          uint64_t v9 = [(GEOWiFiConnectionQuality *)v8 initWithJSON:v7];
        }
        else {
          uint64_t v9 = [(GEOWiFiConnectionQuality *)v8 initWithDictionary:v7];
        }
        v10 = (void *)v9;
        [a1 setWifiConnectionQuality:v9];
      }
    }
  }

  return a1;
}

- (GEOLogMsgEventWifiConnectionQualityProbe)initWithJSON:(id)a3
{
  return (GEOLogMsgEventWifiConnectionQualityProbe *)-[GEOLogMsgEventWifiConnectionQualityProbe _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventWifiConnectionQualityProbeIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventWifiConnectionQualityProbeReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  if (self->_wifiConnectionQuality) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  return [(GEOWiFiConnectionQuality *)self->_wifiConnectionQuality hasGreenTeaWithValue:a3];
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [(GEOLogMsgEventWifiConnectionQualityProbe *)self readAll:0];
  if (self->_wifiConnectionQuality) {
    objc_msgSend(v4, "setWifiConnectionQuality:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(GEOWiFiConnectionQuality *)self->_wifiConnectionQuality copyWithZone:a3];
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
    [(GEOLogMsgEventWifiConnectionQualityProbe *)self readAll:1];
    [v4 readAll:1];
    wifiConnectionQuality = self->_wifiConnectionQuality;
    if ((unint64_t)wifiConnectionQuality | v4[1]) {
      char v5 = -[GEOWiFiConnectionQuality isEqual:](wifiConnectionQuality, "isEqual:");
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
  [(GEOLogMsgEventWifiConnectionQualityProbe *)self readAll:1];
  wifiConnectionQuality = self->_wifiConnectionQuality;

  return [(GEOWiFiConnectionQuality *)wifiConnectionQuality hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  [v4 readAll:0];
  wifiConnectionQuality = self->_wifiConnectionQuality;
  uint64_t v6 = v4[1];

  if (wifiConnectionQuality)
  {
    if (v6)
    {
      [(GEOWiFiConnectionQuality *)wifiConnectionQuality mergeFrom:v6];
    }
  }
  else if (v6)
  {
    [(GEOLogMsgEventWifiConnectionQualityProbe *)self setWifiConnectionQuality:v6];
  }
}

- (void).cxx_destruct
{
}

@end