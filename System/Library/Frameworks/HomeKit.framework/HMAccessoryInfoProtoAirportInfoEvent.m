@interface HMAccessoryInfoProtoAirportInfoEvent
- (BOOL)hasBssid;
- (BOOL)hasSsid;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)bssid;
- (NSData)ssid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBssid:(id)a3;
- (void)setSsid:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HMAccessoryInfoProtoAirportInfoEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ssid, 0);

  objc_storeStrong((id *)&self->_bssid, 0);
}

- (void)setBssid:(id)a3
{
}

- (NSData)bssid
{
  return self->_bssid;
}

- (void)setSsid:(id)a3
{
}

- (NSData)ssid
{
  return self->_ssid;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  v5 = v4;
  if (v4[2])
  {
    -[HMAccessoryInfoProtoAirportInfoEvent setSsid:](self, "setSsid:");
    v4 = v5;
  }
  if (v4[1])
  {
    -[HMAccessoryInfoProtoAirportInfoEvent setBssid:](self, "setBssid:");
    v4 = v5;
  }
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_ssid hash];
  return [(NSData *)self->_bssid hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((ssid = self->_ssid, !((unint64_t)ssid | v4[2])) || -[NSData isEqual:](ssid, "isEqual:")))
  {
    bssid = self->_bssid;
    if ((unint64_t)bssid | v4[1]) {
      char v7 = -[NSData isEqual:](bssid, "isEqual:");
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

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_ssid copyWithZone:a3];
  char v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSData *)self->_bssid copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_ssid)
  {
    objc_msgSend(v4, "setSsid:");
    id v4 = v5;
  }
  if (self->_bssid)
  {
    objc_msgSend(v5, "setBssid:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_ssid)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_bssid)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return HMAccessoryInfoProtoAirportInfoEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  ssid = self->_ssid;
  if (ssid) {
    [v3 setObject:ssid forKey:@"ssid"];
  }
  bssid = self->_bssid;
  if (bssid) {
    [v4 setObject:bssid forKey:@"bssid"];
  }

  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMAccessoryInfoProtoAirportInfoEvent;
  id v4 = [(HMAccessoryInfoProtoAirportInfoEvent *)&v8 description];
  id v5 = [(HMAccessoryInfoProtoAirportInfoEvent *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasBssid
{
  return self->_bssid != 0;
}

- (BOOL)hasSsid
{
  return self->_ssid != 0;
}

@end