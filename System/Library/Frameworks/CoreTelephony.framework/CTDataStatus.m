@interface CTDataStatus
+ (BOOL)supportsSecureCoding;
- (BOOL)attached;
- (BOOL)cellularDataPossible;
- (BOOL)dataPlanSignalingReductionOverride;
- (BOOL)dataSim;
- (BOOL)inHomeCountry;
- (BOOL)newRadioCoverage;
- (BOOL)newRadioDataBearer;
- (BOOL)newRadioMmWaveDataBearer;
- (BOOL)newRadioNsaCoverage;
- (BOOL)newRadioNsaDataBearer;
- (BOOL)newRadioSaCoverage;
- (BOOL)newRadioSaDataBearer;
- (BOOL)newRadioSub6DataBearer;
- (BOOL)roamAllowed;
- (CTDataStatus)initWithCoder:(id)a3;
- (id)copyBasic;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)dataBearerTechnology;
- (int)dataMode;
- (int)indicator;
- (int)indicatorOverride;
- (int)radioTechnology;
- (int)reason;
- (unsigned)activeContexts;
- (unsigned)dataBearerSoMask;
- (unsigned)totalActiveContexts;
- (void)encodeWithCoder:(id)a3;
- (void)setActiveContexts:(unsigned int)a3;
- (void)setAttached:(BOOL)a3;
- (void)setCellularDataPossible:(BOOL)a3;
- (void)setDataBearerSoMask:(unsigned int)a3;
- (void)setDataBearerTechnology:(int)a3;
- (void)setDataMode:(int)a3;
- (void)setDataPlanSignalingReductionOverride:(BOOL)a3;
- (void)setDataSim:(BOOL)a3;
- (void)setInHomeCountry:(BOOL)a3;
- (void)setIndicator:(int)a3;
- (void)setIndicatorOverride:(int)a3;
- (void)setRadioTechnology:(int)a3;
- (void)setReason:(int)a3;
- (void)setRoamAllowed:(BOOL)a3;
- (void)setTotalActiveContexts:(unsigned int)a3;
@end

@implementation CTDataStatus

- (CTDataStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CTDataStatus;
  v5 = [(CTDataStatus *)&v8 init];
  if (v5)
  {
    char v6 = [v4 decodeIntForKey:@"DataStatusFlags"];
    v5->_attached = v6 & 1;
    v5->_dataPlanSignalingReductionOverride = v6 < 0;
    v5->_inHomeCountry = (v6 & 4) != 0;
    v5->_roamAllowed = (v6 & 8) != 0;
    v5->_cellularDataPossible = (v6 & 0x10) != 0;
    v5->_dataSim = (v6 & 0x40) != 0;
    v5->_indicator = [v4 decodeIntForKey:@"indicator"];
    v5->_indicatorOverride = [v4 decodeIntForKey:@"indicatorOverride"];
    v5->_radioTechnology = [v4 decodeIntForKey:@"radioTechnology"];
    v5->_dataMode = [v4 decodeIntForKey:@"dataMode"];
    v5->_dataBearerTechnology = [v4 decodeIntForKey:@"dataBearerTechnology"];
    v5->_dataBearerSoMask = [v4 decodeIntForKey:@"dataBearerSoMask"];
    v5->_activeContexts = [v4 decodeIntForKey:@"activeContexts"];
    v5->_totalActiveContexts = [v4 decodeIntForKey:@"totalActiveContexts"];
    v5->_reason = [v4 decodeIntForKey:@"reason"];
  }

  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  [v3 appendFormat:@", attached=%d", -[CTDataStatus attached](self, "attached")];
  [v3 appendFormat:@", dataSim=%d", -[CTDataStatus dataSim](self, "dataSim")];
  [v3 appendFormat:@", indicator=%s (%d)", indicatorToString(-[CTDataStatus indicator](self, "indicator")), -[CTDataStatus indicator](self, "indicator")];
  [v3 appendFormat:@", indicatorOverride=%s (%d)", indicatorToString(-[CTDataStatus indicatorOverride](self, "indicatorOverride")), -[CTDataStatus indicatorOverride](self, "indicatorOverride")];
  [v3 appendFormat:@", roamAllowed=%d", -[CTDataStatus roamAllowed](self, "roamAllowed")];
  unsigned int v4 = [(CTDataStatus *)self radioTechnology];
  if (v4 > 0xA) {
    v5 = "unknown";
  }
  else {
    v5 = off_1E5263408[v4];
  }
  [v3 appendFormat:@", radioTechnology=%s (%d)", v5, -[CTDataStatus radioTechnology](self, "radioTechnology")];
  [v3 appendFormat:@", reg.dataMode=%s (%d)", dataModeToString(-[CTDataStatus dataMode](self, "dataMode")), -[CTDataStatus dataMode](self, "dataMode")];
  unsigned int v6 = [(CTDataStatus *)self dataBearerTechnology] - 1;
  if (v6 > 5) {
    v7 = "unknown";
  }
  else {
    v7 = off_1E5263460[v6];
  }
  [v3 appendFormat:@", dataBearerTechnology=%s (%d)", v7, -[CTDataStatus dataBearerTechnology](self, "dataBearerTechnology")];
  [v3 appendFormat:@", dataBearerSoMask=0x%x", -[CTDataStatus dataBearerSoMask](self, "dataBearerSoMask")];
  [v3 appendFormat:@", signalingReduction=%d", -[CTDataStatus dataPlanSignalingReductionOverride](self, "dataPlanSignalingReductionOverride")];
  [v3 appendFormat:@", cellularDataPossible=%d", -[CTDataStatus cellularDataPossible](self, "cellularDataPossible")];
  [v3 appendFormat:@", activeContexts=%d", -[CTDataStatus activeContexts](self, "activeContexts")];
  [v3 appendFormat:@", totalActiveContexts=%d", -[CTDataStatus totalActiveContexts](self, "totalActiveContexts")];
  [v3 appendFormat:@", inHomeCountry=%d", -[CTDataStatus inHomeCountry](self, "inHomeCountry")];
  [v3 appendFormat:@", newRadioCoverage=%d", -[CTDataStatus newRadioCoverage](self, "newRadioCoverage")];
  unsigned int v8 = [(CTDataStatus *)self reason] - 1;
  if (v8 > 0xA) {
    v9 = "unknown";
  }
  else {
    v9 = off_1E5263490[v8];
  }
  [v3 appendFormat:@", reason=%s (%d)", v9, -[CTDataStatus reason](self, "reason")];
  [v3 appendString:@">"];

  return v3;
}

- (int)indicator
{
  return self->_indicator;
}

- (int)radioTechnology
{
  return self->_radioTechnology;
}

- (int)indicatorOverride
{
  return self->_indicatorOverride;
}

- (int)dataBearerTechnology
{
  return self->_dataBearerTechnology;
}

- (int)reason
{
  return self->_reason;
}

- (int)dataMode
{
  return self->_dataMode;
}

- (BOOL)newRadioCoverage
{
  if ([(CTDataStatus *)self radioTechnology] == 10) {
    return 1;
  }
  if ([(CTDataStatus *)self newRadioDataBearer]) {
    return 1;
  }
  unsigned int v3 = [(CTDataStatus *)self indicator] - 8;
  if (v3 < 0xC && ((0xF01u >> v3) & 1) != 0) {
    return 1;
  }
  unsigned int v4 = [(CTDataStatus *)self indicatorOverride];
  if (v4 >= 0x14) {
    return 0;
  }
  else {
    return (0xF0100u >> v4) & 1;
  }
}

- (BOOL)newRadioDataBearer
{
  return [(CTDataStatus *)self dataBearerTechnology] - 5 < 2;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  unsigned int v4 = [(CTDataStatus *)self attached];
  if ([(CTDataStatus *)self dataSim]) {
    v4 |= 0x40u;
  }
  if ([(CTDataStatus *)self inHomeCountry]) {
    v4 |= 4u;
  }
  if ([(CTDataStatus *)self roamAllowed]) {
    v4 |= 8u;
  }
  if ([(CTDataStatus *)self dataPlanSignalingReductionOverride]) {
    v4 |= 0x80u;
  }
  if ([(CTDataStatus *)self cellularDataPossible]) {
    uint64_t v5 = v4 | 0x10;
  }
  else {
    uint64_t v5 = v4;
  }
  [v6 encodeInt:v5 forKey:@"DataStatusFlags"];
  objc_msgSend(v6, "encodeInt:forKey:", -[CTDataStatus indicator](self, "indicator"), @"indicator");
  objc_msgSend(v6, "encodeInt:forKey:", -[CTDataStatus indicatorOverride](self, "indicatorOverride"), @"indicatorOverride");
  objc_msgSend(v6, "encodeInt:forKey:", -[CTDataStatus radioTechnology](self, "radioTechnology"), @"radioTechnology");
  objc_msgSend(v6, "encodeInt:forKey:", -[CTDataStatus dataMode](self, "dataMode"), @"dataMode");
  objc_msgSend(v6, "encodeInt:forKey:", -[CTDataStatus dataBearerTechnology](self, "dataBearerTechnology"), @"dataBearerTechnology");
  objc_msgSend(v6, "encodeInt:forKey:", -[CTDataStatus dataBearerSoMask](self, "dataBearerSoMask"), @"dataBearerSoMask");
  objc_msgSend(v6, "encodeInt:forKey:", -[CTDataStatus activeContexts](self, "activeContexts"), @"activeContexts");
  objc_msgSend(v6, "encodeInt:forKey:", -[CTDataStatus totalActiveContexts](self, "totalActiveContexts"), @"totalActiveContexts");
  objc_msgSend(v6, "encodeInt:forKey:", -[CTDataStatus reason](self, "reason"), @"reason");
}

- (BOOL)roamAllowed
{
  return self->_roamAllowed;
}

- (BOOL)inHomeCountry
{
  return self->_inHomeCountry;
}

- (BOOL)attached
{
  return self->_attached;
}

- (BOOL)cellularDataPossible
{
  return self->_cellularDataPossible;
}

- (unsigned)totalActiveContexts
{
  return self->_totalActiveContexts;
}

- (BOOL)dataSim
{
  return self->_dataSim;
}

- (BOOL)dataPlanSignalingReductionOverride
{
  return self->_dataPlanSignalingReductionOverride;
}

- (unsigned)dataBearerSoMask
{
  return self->_dataBearerSoMask;
}

- (unsigned)activeContexts
{
  return self->_activeContexts;
}

- (void)setTotalActiveContexts:(unsigned int)a3
{
  self->_totalActiveContexts = a3;
}

- (void)setRoamAllowed:(BOOL)a3
{
  self->_roamAllowed = a3;
}

- (void)setReason:(int)a3
{
  self->_reason = a3;
}

- (void)setRadioTechnology:(int)a3
{
  self->_radioTechnology = a3;
}

- (void)setIndicatorOverride:(int)a3
{
  self->_indicatorOverride = a3;
}

- (void)setIndicator:(int)a3
{
  self->_indicator = a3;
}

- (void)setInHomeCountry:(BOOL)a3
{
  self->_inHomeCountry = a3;
}

- (void)setDataSim:(BOOL)a3
{
  self->_dataSim = a3;
}

- (void)setDataPlanSignalingReductionOverride:(BOOL)a3
{
  self->_dataPlanSignalingReductionOverride = a3;
}

- (void)setDataMode:(int)a3
{
  self->_dataMode = a3;
}

- (void)setDataBearerTechnology:(int)a3
{
  self->_dataBearerTechnology = a3;
}

- (void)setDataBearerSoMask:(unsigned int)a3
{
  self->_dataBearerSoMask = a3;
}

- (void)setCellularDataPossible:(BOOL)a3
{
  self->_cellularDataPossible = a3;
}

- (void)setAttached:(BOOL)a3
{
  self->_attached = a3;
}

- (void)setActiveContexts:(unsigned int)a3
{
  self->_activeContexts = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyBasic
{
  unsigned int v3 = objc_opt_new();
  objc_msgSend(v3, "setAttached:", -[CTDataStatus attached](self, "attached"));
  objc_msgSend(v3, "setHasIndicator:", -[CTDataStatus indicator](self, "indicator") != 0);
  objc_msgSend(v3, "setInHomeCountry:", -[CTDataStatus inHomeCountry](self, "inHomeCountry"));
  objc_msgSend(v3, "setRoamAllowed:", -[CTDataStatus roamAllowed](self, "roamAllowed"));
  objc_msgSend(v3, "setCellularDataPossible:", -[CTDataStatus cellularDataPossible](self, "cellularDataPossible"));
  objc_msgSend(v3, "setNewRadioCoverage:", -[CTDataStatus newRadioCoverage](self, "newRadioCoverage"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unsigned int v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setAttached:", -[CTDataStatus attached](self, "attached"));
  objc_msgSend(v4, "setDataSim:", -[CTDataStatus dataSim](self, "dataSim"));
  objc_msgSend(v4, "setIndicator:", -[CTDataStatus indicator](self, "indicator"));
  objc_msgSend(v4, "setIndicatorOverride:", -[CTDataStatus indicatorOverride](self, "indicatorOverride"));
  objc_msgSend(v4, "setRoamAllowed:", -[CTDataStatus roamAllowed](self, "roamAllowed"));
  objc_msgSend(v4, "setRadioTechnology:", -[CTDataStatus radioTechnology](self, "radioTechnology"));
  objc_msgSend(v4, "setDataMode:", -[CTDataStatus dataMode](self, "dataMode"));
  objc_msgSend(v4, "setDataBearerTechnology:", -[CTDataStatus dataBearerTechnology](self, "dataBearerTechnology"));
  objc_msgSend(v4, "setDataBearerSoMask:", -[CTDataStatus dataBearerSoMask](self, "dataBearerSoMask"));
  objc_msgSend(v4, "setDataPlanSignalingReductionOverride:", -[CTDataStatus dataPlanSignalingReductionOverride](self, "dataPlanSignalingReductionOverride"));
  objc_msgSend(v4, "setCellularDataPossible:", -[CTDataStatus cellularDataPossible](self, "cellularDataPossible"));
  objc_msgSend(v4, "setActiveContexts:", -[CTDataStatus activeContexts](self, "activeContexts"));
  objc_msgSend(v4, "setTotalActiveContexts:", -[CTDataStatus totalActiveContexts](self, "totalActiveContexts"));
  objc_msgSend(v4, "setInHomeCountry:", -[CTDataStatus inHomeCountry](self, "inHomeCountry"));
  objc_msgSend(v4, "setReason:", -[CTDataStatus reason](self, "reason"));
  return v4;
}

- (BOOL)newRadioSaCoverage
{
  BOOL v3 = [(CTDataStatus *)self newRadioCoverage];
  if (v3) {
    LOBYTE(v3) = [(CTDataStatus *)self radioTechnology] == 10;
  }
  return v3;
}

- (BOOL)newRadioNsaCoverage
{
  BOOL v3 = [(CTDataStatus *)self newRadioCoverage];
  if (v3) {
    LOBYTE(v3) = ![(CTDataStatus *)self newRadioSaCoverage];
  }
  return v3;
}

- (BOOL)newRadioMmWaveDataBearer
{
  BOOL v3 = [(CTDataStatus *)self newRadioDataBearer];
  if (v3) {
    return ([(CTDataStatus *)self dataBearerSoMask] >> 3) & 1;
  }
  return v3;
}

- (BOOL)newRadioSub6DataBearer
{
  BOOL v3 = [(CTDataStatus *)self newRadioDataBearer];
  if (v3) {
    return ([(CTDataStatus *)self dataBearerSoMask] >> 2) & 1;
  }
  return v3;
}

- (BOOL)newRadioNsaDataBearer
{
  return [(CTDataStatus *)self dataBearerTechnology] == 5;
}

- (BOOL)newRadioSaDataBearer
{
  return [(CTDataStatus *)self dataBearerTechnology] == 6;
}

@end