@interface CVACMWiFiData
+ (BOOL)supportsSecureCoding;
+ (id)classes;
- (CVACMWiFiData)initWithCoder:(id)a3;
- (NSString)BSSID;
- (double)timestamp;
- (id)debugDescription;
- (id)dictionary;
- (int)RSSI;
- (int)channel;
- (void)encodeWithCoder:(id)a3;
- (void)setBSSID:(id)a3;
- (void)setChannel:(int)a3;
- (void)setRSSI:(int)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation CVACMWiFiData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)classes
{
  if (qword_267C58C68 == -1)
  {
    v2 = (void *)qword_267C58C60;
  }
  else
  {
    dispatch_once(&qword_267C58C68, &unk_26CB5E4B8);
    v2 = (void *)qword_267C58C60;
  }
  return v2;
}

- (CVACMWiFiData)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CVACMWiFiData;
  v5 = [(CVACMWiFiData *)&v11 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x21D490BF0]();
    uint64_t v7 = [v4 decodeObjectForKey:@"BSSID"];
    BSSID = v5->_BSSID;
    v5->_BSSID = (NSString *)v7;

    v5->_RSSI = [v4 decodeIntForKey:@"RSSI"];
    v5->_channel = [v4 decodeIntForKey:@"channel"];
    [v4 decodeDoubleForKey:@"timestamp"];
    v5->_timestamp = v9;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = (void *)MEMORY[0x21D490BF0]();
  [v5 encodeObject:self->_BSSID forKey:@"BSSID"];
  [v5 encodeInt:self->_RSSI forKey:@"RSSI"];
  [v5 encodeInt:self->_channel forKey:@"channel"];
  [v5 encodeDouble:@"timestamp" forKey:self->_timestamp];
}

- (id)dictionary
{
  v9[4] = *MEMORY[0x263EF8340];
  v9[0] = self->_BSSID;
  v8[0] = @"BSSID";
  v8[1] = @"RSSI";
  v3 = [NSNumber numberWithInt:self->_RSSI];
  v9[1] = v3;
  v8[2] = @"channel";
  id v4 = [NSNumber numberWithInt:self->_channel];
  v9[2] = v4;
  v8[3] = @"timestamp";
  id v5 = [NSNumber numberWithDouble:self->_timestamp];
  v9[3] = v5;
  v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:4];

  return v6;
}

- (id)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(CVACMWiFiData *)self dictionary];
  v6 = [v3 stringWithFormat:@"<%@: %@>", v4, v5];

  return v6;
}

- (NSString)BSSID
{
  return self->_BSSID;
}

- (void)setBSSID:(id)a3
{
}

- (int)RSSI
{
  return self->_RSSI;
}

- (void)setRSSI:(int)a3
{
  self->_RSSI = a3;
}

- (int)channel
{
  return self->_channel;
}

- (void)setChannel:(int)a3
{
  self->_channel = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (void).cxx_destruct
{
}

@end