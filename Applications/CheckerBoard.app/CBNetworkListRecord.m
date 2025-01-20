@interface CBNetworkListRecord
- (BOOL)canBeDisplayedAsCurrent;
- (BOOL)iOSHotspot;
- (BOOL)isAdhoc;
- (BOOL)isBootIntentPasswordProtected;
- (BOOL)isBootIntentRecord;
- (BOOL)isEnterprise;
- (BOOL)isEquivalentRecord:(id)a3;
- (BOOL)isInstantHotspot;
- (BOOL)isKnown;
- (BOOL)isPopular;
- (BOOL)isSecure;
- (BOOL)isUnconfiguredAccessory;
- (BOOL)prominentDisplay;
- (CBNetworkListRecord)initWithBootIntentSSID:(id)a3 passwordProtected:(BOOL)a4;
- (CBNetworkListRecord)initWithScanResult:(id)a3;
- (CWFScanResult)scanResult;
- (NSString)bootIntentSSID;
- (float)scaledRSSI;
- (id)copyWithZone:(_NSZone *)a3;
- (id)hotspotBatteryLife;
- (id)hotspotCellularProtocol;
- (id)hotspotSignalStrength;
- (id)ssid;
- (int64_t)identifier;
- (int64_t)rssi;
- (unint64_t)signalBars;
@end

@implementation CBNetworkListRecord

- (CBNetworkListRecord)initWithScanResult:(id)a3
{
  int64_t v5 = qword_10008FE10++;
  self->_identifier = v5;
  objc_storeStrong((id *)&self->_scanResult, a3);
  id v6 = a3;
  self->_isBootIntentRecord = 0;
  bootIntentSSID = self->_bootIntentSSID;
  self->_bootIntentSSID = (NSString *)&stru_10007A9F8;

  self->_isBootIntentPasswordProtected = 0;
  return self;
}

- (CBNetworkListRecord)initWithBootIntentSSID:(id)a3 passwordProtected:(BOOL)a4
{
  id v6 = (NSString *)a3;
  int64_t v7 = qword_10008FE10++;
  scanResult = self->_scanResult;
  self->_identifier = v7;
  self->_scanResult = 0;

  self->_isBootIntentRecord = 1;
  bootIntentSSID = self->_bootIntentSSID;
  self->_bootIntentSSID = v6;

  self->_isBootIntentPasswordProtected = a4;
  return self;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [CBNetworkListRecord alloc];
  int64_t v5 = [(CBNetworkListRecord *)self scanResult];
  id v6 = [v5 copy];
  int64_t v7 = [(CBNetworkListRecord *)v4 initWithScanResult:v6];

  return v7;
}

- (BOOL)canBeDisplayedAsCurrent
{
  return 0;
}

- (id)hotspotBatteryLife
{
  return &off_10007CD08;
}

- (id)hotspotCellularProtocol
{
  return &stru_10007A9F8;
}

- (id)hotspotSignalStrength
{
  return 0;
}

- (BOOL)iOSHotspot
{
  if ([(CBNetworkListRecord *)self isBootIntentRecord]) {
    return 0;
  }
  v4 = [(CBNetworkListRecord *)self scanResult];
  unsigned __int8 v5 = [v4 isPersonalHotspot];

  return v5;
}

- (BOOL)isAdhoc
{
  return 0;
}

- (BOOL)isEnterprise
{
  return 0;
}

- (BOOL)isEquivalentRecord:(id)a3
{
  v4 = [a3 ssid];
  unsigned __int8 v5 = [(CBNetworkListRecord *)self ssid];
  unsigned __int8 v6 = [v4 isEqualToString:v5];

  return v6;
}

- (BOOL)isInstantHotspot
{
  return 0;
}

- (BOOL)isKnown
{
  return 0;
}

- (BOOL)isPopular
{
  return 0;
}

- (BOOL)isSecure
{
  if ([(CBNetworkListRecord *)self isBootIntentRecord])
  {
    return [(CBNetworkListRecord *)self isBootIntentPasswordProtected];
  }
  else
  {
    v3 = [(CBNetworkListRecord *)self scanResult];
    unsigned __int8 v4 = [v3 requiresPassword];

    return v4;
  }
}

- (BOOL)isUnconfiguredAccessory
{
  return 0;
}

- (BOOL)prominentDisplay
{
  return 0;
}

- (int64_t)rssi
{
  if ([(CBNetworkListRecord *)self isBootIntentRecord]) {
    return 0;
  }
  unsigned __int8 v4 = [(CBNetworkListRecord *)self scanResult];
  id v5 = [v4 RSSI];

  return (int64_t)v5;
}

- (float)scaledRSSI
{
  if ([(CBNetworkListRecord *)self isBootIntentRecord]) {
    return 0.0;
  }
  unsigned __int8 v4 = [(CBNetworkListRecord *)self scanResult];
  [v4 RSSI];
  WFScaleRSSI();
  float v6 = v5;

  return v6;
}

- (unint64_t)signalBars
{
  return 0;
}

- (id)ssid
{
  if ([(CBNetworkListRecord *)self isBootIntentRecord])
  {
    v3 = [(CBNetworkListRecord *)self bootIntentSSID];
  }
  else
  {
    unsigned __int8 v4 = [(CBNetworkListRecord *)self scanResult];
    v3 = [v4 networkName];
  }

  return v3;
}

- (int64_t)identifier
{
  return self->_identifier;
}

- (CWFScanResult)scanResult
{
  return self->_scanResult;
}

- (BOOL)isBootIntentRecord
{
  return self->_isBootIntentRecord;
}

- (NSString)bootIntentSSID
{
  return self->_bootIntentSSID;
}

- (BOOL)isBootIntentPasswordProtected
{
  return self->_isBootIntentPasswordProtected;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bootIntentSSID, 0);

  objc_storeStrong((id *)&self->_scanResult, 0);
}

@end