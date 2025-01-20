@interface CTRadioFrequencyFrontEndScanData
+ (BOOL)supportsSecureCoding;
- (BOOL)rfcInitPass;
- (BOOL)rffeScanPass;
- (CTRadioFrequencyFrontEndScanData)init;
- (CTRadioFrequencyFrontEndScanData)initWithCoder:(id)a3;
- (NSMutableArray)missingAtDevices;
- (NSMutableArray)missingMmwDevices;
- (NSMutableArray)missingRffeDevices;
- (NSMutableArray)rffeScanInfo;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)fr2TrxRev;
- (unint64_t)hwHousing;
- (unint64_t)hwPrdId;
- (unint64_t)hwRev;
- (unint64_t)hwSku;
- (unint64_t)numDetectedDevices;
- (unint64_t)numExpectedDevices;
- (unint64_t)numMissingDevices;
- (unint64_t)rfcHwid;
- (unint64_t)rfcMmwHwid;
- (unint64_t)rfcMmwRev;
- (unint64_t)rfcRev;
- (unint64_t)version;
- (void)encodeWithCoder:(id)a3;
- (void)setFr2TrxRev:(unint64_t)a3;
- (void)setHwHousing:(unint64_t)a3;
- (void)setHwPrdId:(unint64_t)a3;
- (void)setHwRev:(unint64_t)a3;
- (void)setHwSku:(unint64_t)a3;
- (void)setMissingAtDevices:(id)a3;
- (void)setMissingMmwDevices:(id)a3;
- (void)setMissingRffeDevices:(id)a3;
- (void)setNumDetectedDevices:(unint64_t)a3;
- (void)setNumExpectedDevices:(unint64_t)a3;
- (void)setNumMissingDevices:(unint64_t)a3;
- (void)setRfcHwid:(unint64_t)a3;
- (void)setRfcInitPass:(BOOL)a3;
- (void)setRfcMmwHwid:(unint64_t)a3;
- (void)setRfcMmwRev:(unint64_t)a3;
- (void)setRfcRev:(unint64_t)a3;
- (void)setRffeScanInfo:(id)a3;
- (void)setRffeScanPass:(BOOL)a3;
- (void)setVersion:(unint64_t)a3;
@end

@implementation CTRadioFrequencyFrontEndScanData

- (CTRadioFrequencyFrontEndScanData)init
{
  v9.receiver = self;
  v9.super_class = (Class)CTRadioFrequencyFrontEndScanData;
  v2 = [(CTRadioFrequencyFrontEndScanData *)&v9 init];
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_rfcInitPass = 0;
    *(_OWORD *)&v2->_version = 0u;
    *(_OWORD *)&v2->_hwSku = 0u;
    *(_OWORD *)&v2->_hwHousing = 0u;
    *(_OWORD *)&v2->_rfcRev = 0u;
    *(_OWORD *)&v2->_rfcMmwRev = 0u;
    *(_OWORD *)&v2->_numExpectedDevices = 0u;
    rffeScanInfo = v2->_rffeScanInfo;
    v2->_numMissingDevices = 0;
    v2->_rffeScanInfo = 0;

    missingRffeDevices = v3->_missingRffeDevices;
    v3->_missingRffeDevices = 0;

    missingAtDevices = v3->_missingAtDevices;
    v3->_missingAtDevices = 0;

    missingMmwDevices = v3->_missingMmwDevices;
    v3->_missingMmwDevices = 0;
  }
  return v3;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p\n", objc_opt_class(), self];
  objc_msgSend(v3, "appendFormat:", @"version=%lu\n", -[CTRadioFrequencyFrontEndScanData version](self, "version"));
  objc_msgSend(v3, "appendFormat:", @"hwPrdId=%lu\n", -[CTRadioFrequencyFrontEndScanData hwPrdId](self, "hwPrdId"));
  objc_msgSend(v3, "appendFormat:", @"hwSku=%lu\n", -[CTRadioFrequencyFrontEndScanData hwSku](self, "hwSku"));
  objc_msgSend(v3, "appendFormat:", @"hwRev=%lu\n", -[CTRadioFrequencyFrontEndScanData hwRev](self, "hwRev"));
  objc_msgSend(v3, "appendFormat:", @"hwHousing=%lu\n", -[CTRadioFrequencyFrontEndScanData hwHousing](self, "hwHousing"));
  objc_msgSend(v3, "appendFormat:", @"rfcInitPass=%d\n", -[CTRadioFrequencyFrontEndScanData rfcInitPass](self, "rfcInitPass"));
  objc_msgSend(v3, "appendFormat:", @"rfcHwid=0x%02x\n", -[CTRadioFrequencyFrontEndScanData rfcHwid](self, "rfcHwid"));
  objc_msgSend(v3, "appendFormat:", @"rfcRev=%lu\n", -[CTRadioFrequencyFrontEndScanData rfcRev](self, "rfcRev"));
  objc_msgSend(v3, "appendFormat:", @"rfcMmwHwid=0x%02x\n", -[CTRadioFrequencyFrontEndScanData rfcMmwHwid](self, "rfcMmwHwid"));
  objc_msgSend(v3, "appendFormat:", @"rfcMmwRev=%lu\n", -[CTRadioFrequencyFrontEndScanData rfcMmwRev](self, "rfcMmwRev"));
  objc_msgSend(v3, "appendFormat:", @"fr2TrxRev=%lu\n", -[CTRadioFrequencyFrontEndScanData fr2TrxRev](self, "fr2TrxRev"));
  objc_msgSend(v3, "appendFormat:", @"rffeScanPass=%d\n", -[CTRadioFrequencyFrontEndScanData rffeScanPass](self, "rffeScanPass"));
  objc_msgSend(v3, "appendFormat:", @"numExpectedDevices=%lu\n", -[CTRadioFrequencyFrontEndScanData numExpectedDevices](self, "numExpectedDevices"));
  objc_msgSend(v3, "appendFormat:", @"numDetectedDevices=%lu\n", -[CTRadioFrequencyFrontEndScanData numDetectedDevices](self, "numDetectedDevices"));
  objc_msgSend(v3, "appendFormat:", @"numMissingDevices=%lu\n", -[CTRadioFrequencyFrontEndScanData numMissingDevices](self, "numMissingDevices"));
  v4 = [(CTRadioFrequencyFrontEndScanData *)self rffeScanInfo];
  [v3 appendFormat:@"rffeScanInfo=%@\n", v4];

  v5 = [(CTRadioFrequencyFrontEndScanData *)self missingRffeDevices];
  [v3 appendFormat:@"missingRffeDevices=%@\n", v5];

  v6 = [(CTRadioFrequencyFrontEndScanData *)self missingAtDevices];
  [v3 appendFormat:@"missingAtDevices=%@\n", v6];

  v7 = [(CTRadioFrequencyFrontEndScanData *)self missingMmwDevices];
  [v3 appendFormat:@"missingMmwDevices=%@\n", v7];

  [v3 appendString:@">"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setVersion:", -[CTRadioFrequencyFrontEndScanData version](self, "version"));
  objc_msgSend(v5, "setHwPrdId:", -[CTRadioFrequencyFrontEndScanData hwPrdId](self, "hwPrdId"));
  objc_msgSend(v5, "setHwSku:", -[CTRadioFrequencyFrontEndScanData hwSku](self, "hwSku"));
  objc_msgSend(v5, "setHwRev:", -[CTRadioFrequencyFrontEndScanData hwRev](self, "hwRev"));
  objc_msgSend(v5, "setHwHousing:", -[CTRadioFrequencyFrontEndScanData hwHousing](self, "hwHousing"));
  objc_msgSend(v5, "setRfcInitPass:", -[CTRadioFrequencyFrontEndScanData rfcInitPass](self, "rfcInitPass"));
  objc_msgSend(v5, "setRfcHwid:", -[CTRadioFrequencyFrontEndScanData rfcHwid](self, "rfcHwid"));
  objc_msgSend(v5, "setRfcRev:", -[CTRadioFrequencyFrontEndScanData rfcRev](self, "rfcRev"));
  objc_msgSend(v5, "setRfcMmwHwid:", -[CTRadioFrequencyFrontEndScanData rfcMmwHwid](self, "rfcMmwHwid"));
  objc_msgSend(v5, "setRfcMmwRev:", -[CTRadioFrequencyFrontEndScanData rfcMmwRev](self, "rfcMmwRev"));
  objc_msgSend(v5, "setFr2TrxRev:", -[CTRadioFrequencyFrontEndScanData fr2TrxRev](self, "fr2TrxRev"));
  objc_msgSend(v5, "setRffeScanPass:", -[CTRadioFrequencyFrontEndScanData rffeScanPass](self, "rffeScanPass"));
  objc_msgSend(v5, "setNumExpectedDevices:", -[CTRadioFrequencyFrontEndScanData numExpectedDevices](self, "numExpectedDevices"));
  objc_msgSend(v5, "setNumDetectedDevices:", -[CTRadioFrequencyFrontEndScanData numDetectedDevices](self, "numDetectedDevices"));
  objc_msgSend(v5, "setNumMissingDevices:", -[CTRadioFrequencyFrontEndScanData numMissingDevices](self, "numMissingDevices"));
  v6 = [(CTRadioFrequencyFrontEndScanData *)self rffeScanInfo];
  v7 = (void *)[v6 copyWithZone:a3];
  [v5 setRffeScanInfo:v7];

  v8 = [(CTRadioFrequencyFrontEndScanData *)self missingRffeDevices];
  objc_super v9 = (void *)[v8 copyWithZone:a3];
  [v5 setMissingRffeDevices:v9];

  v10 = [(CTRadioFrequencyFrontEndScanData *)self missingAtDevices];
  v11 = (void *)[v10 copyWithZone:a3];
  [v5 setMissingAtDevices:v11];

  v12 = [(CTRadioFrequencyFrontEndScanData *)self missingMmwDevices];
  v13 = (void *)[v12 copyWithZone:a3];
  [v5 setMissingMmwDevices:v13];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  id v5 = a3;
  v6 = objc_msgSend(v4, "numberWithUnsignedInteger:", -[CTRadioFrequencyFrontEndScanData version](self, "version"));
  [v5 encodeObject:v6 forKey:@"kVersionKey"];

  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CTRadioFrequencyFrontEndScanData hwPrdId](self, "hwPrdId"));
  [v5 encodeObject:v7 forKey:@"kHwPrdIdKey"];

  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CTRadioFrequencyFrontEndScanData hwSku](self, "hwSku"));
  [v5 encodeObject:v8 forKey:@"kHwSkuKey"];

  objc_super v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CTRadioFrequencyFrontEndScanData hwRev](self, "hwRev"));
  [v5 encodeObject:v9 forKey:@"kHwRevKey"];

  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CTRadioFrequencyFrontEndScanData hwHousing](self, "hwHousing"));
  [v5 encodeObject:v10 forKey:@"kHwHousingKey"];

  objc_msgSend(v5, "encodeBool:forKey:", -[CTRadioFrequencyFrontEndScanData rfcInitPass](self, "rfcInitPass"), @"kRfcInitPassKey");
  v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CTRadioFrequencyFrontEndScanData rfcHwid](self, "rfcHwid"));
  [v5 encodeObject:v11 forKey:@"kRfcHwidKey"];

  v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CTRadioFrequencyFrontEndScanData rfcRev](self, "rfcRev"));
  [v5 encodeObject:v12 forKey:@"kRfcRevKey"];

  v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CTRadioFrequencyFrontEndScanData rfcMmwHwid](self, "rfcMmwHwid"));
  [v5 encodeObject:v13 forKey:@"kRfcMmwHwidKey"];

  v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CTRadioFrequencyFrontEndScanData rfcMmwRev](self, "rfcMmwRev"));
  [v5 encodeObject:v14 forKey:@"kRfcMmwRevKey"];

  v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CTRadioFrequencyFrontEndScanData fr2TrxRev](self, "fr2TrxRev"));
  [v5 encodeObject:v15 forKey:@"kFr2TrxRevKey"];

  objc_msgSend(v5, "encodeBool:forKey:", -[CTRadioFrequencyFrontEndScanData rffeScanPass](self, "rffeScanPass"), @"kRffeScanPassKey");
  v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CTRadioFrequencyFrontEndScanData numExpectedDevices](self, "numExpectedDevices"));
  [v5 encodeObject:v16 forKey:@"kNumExpectedDevicesKey"];

  v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CTRadioFrequencyFrontEndScanData numDetectedDevices](self, "numDetectedDevices"));
  [v5 encodeObject:v17 forKey:@"kNumDetectedDevicesKey"];

  v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CTRadioFrequencyFrontEndScanData numMissingDevices](self, "numMissingDevices"));
  [v5 encodeObject:v18 forKey:@"kNumMissingDevicesKey"];

  v19 = [(CTRadioFrequencyFrontEndScanData *)self rffeScanInfo];
  [v5 encodeObject:v19 forKey:@"kRffeScanInfoKey"];

  v20 = [(CTRadioFrequencyFrontEndScanData *)self missingRffeDevices];
  [v5 encodeObject:v20 forKey:@"kMissingRffeDevicesKey"];

  v21 = [(CTRadioFrequencyFrontEndScanData *)self missingAtDevices];
  [v5 encodeObject:v21 forKey:@"kMissingAtDevicesKey"];

  id v22 = [(CTRadioFrequencyFrontEndScanData *)self missingMmwDevices];
  [v5 encodeObject:v22 forKey:@"kMissingMmwDevicesKey"];
}

- (CTRadioFrequencyFrontEndScanData)initWithCoder:(id)a3
{
  id v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)CTRadioFrequencyFrontEndScanData;
  id v5 = [(CTRadioFrequencyFrontEndScanData *)&v40 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kVersionKey"];
    v5->_version = [v6 unsignedIntegerValue];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kHwPrdIdKey"];
    v5->_hwPrdId = [v7 unsignedIntegerValue];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kHwSkuKey"];
    v5->_hwSku = [v8 unsignedIntegerValue];

    objc_super v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kHwRevKey"];
    v5->_hwRev = [v9 unsignedIntegerValue];

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kHwHousingKey"];
    v5->_hwHousing = [v10 unsignedIntegerValue];

    v5->_rfcInitPass = [v4 decodeBoolForKey:@"kRfcInitPassKey"];
    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kRfcHwidKey"];
    v5->_rfcHwid = [v11 unsignedIntegerValue];

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kRfcRevKey"];
    v5->_rfcRev = [v12 unsignedIntegerValue];

    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kRfcMmwHwidKey"];
    v5->_rfcMmwHwid = [v13 unsignedIntegerValue];

    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kRfcMmwRevKey"];
    v5->_rfcMmwRev = [v14 unsignedIntegerValue];

    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kFr2TrxRevKey"];
    v5->_fr2TrxRev = [v15 unsignedIntegerValue];

    v5->_rffeScanPass = [v4 decodeBoolForKey:@"kRffeScanPassKey"];
    v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNumExpectedDevicesKey"];
    v5->_numExpectedDevices = [v16 unsignedIntegerValue];

    v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNumDetectedDevicesKey"];
    v5->_numDetectedDevices = [v17 unsignedIntegerValue];

    v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNumMissingDevicesKey"];
    v5->_numMissingDevices = [v18 unsignedIntegerValue];

    v19 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v20 = objc_opt_class();
    v21 = objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
    uint64_t v22 = [v4 decodeObjectOfClasses:v21 forKey:@"kRffeScanInfoKey"];
    rffeScanInfo = v5->_rffeScanInfo;
    v5->_rffeScanInfo = (NSMutableArray *)v22;

    v24 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v25 = objc_opt_class();
    v26 = objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0);
    uint64_t v27 = [v4 decodeObjectOfClasses:v26 forKey:@"kMissingRffeDevicesKey"];
    missingRffeDevices = v5->_missingRffeDevices;
    v5->_missingRffeDevices = (NSMutableArray *)v27;

    v29 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v30 = objc_opt_class();
    v31 = objc_msgSend(v29, "setWithObjects:", v30, objc_opt_class(), 0);
    uint64_t v32 = [v4 decodeObjectOfClasses:v31 forKey:@"kMissingAtDevicesKey"];
    missingAtDevices = v5->_missingAtDevices;
    v5->_missingAtDevices = (NSMutableArray *)v32;

    v34 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v35 = objc_opt_class();
    v36 = objc_msgSend(v34, "setWithObjects:", v35, objc_opt_class(), 0);
    uint64_t v37 = [v4 decodeObjectOfClasses:v36 forKey:@"kMissingMmwDevicesKey"];
    missingMmwDevices = v5->_missingMmwDevices;
    v5->_missingMmwDevices = (NSMutableArray *)v37;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (unint64_t)hwPrdId
{
  return self->_hwPrdId;
}

- (void)setHwPrdId:(unint64_t)a3
{
  self->_hwPrdId = a3;
}

- (unint64_t)hwSku
{
  return self->_hwSku;
}

- (void)setHwSku:(unint64_t)a3
{
  self->_hwSku = a3;
}

- (unint64_t)hwRev
{
  return self->_hwRev;
}

- (void)setHwRev:(unint64_t)a3
{
  self->_hwRev = a3;
}

- (unint64_t)hwHousing
{
  return self->_hwHousing;
}

- (void)setHwHousing:(unint64_t)a3
{
  self->_hwHousing = a3;
}

- (BOOL)rfcInitPass
{
  return self->_rfcInitPass;
}

- (void)setRfcInitPass:(BOOL)a3
{
  self->_rfcInitPass = a3;
}

- (unint64_t)rfcHwid
{
  return self->_rfcHwid;
}

- (void)setRfcHwid:(unint64_t)a3
{
  self->_rfcHwid = a3;
}

- (unint64_t)rfcRev
{
  return self->_rfcRev;
}

- (void)setRfcRev:(unint64_t)a3
{
  self->_rfcRev = a3;
}

- (unint64_t)rfcMmwHwid
{
  return self->_rfcMmwHwid;
}

- (void)setRfcMmwHwid:(unint64_t)a3
{
  self->_rfcMmwHwid = a3;
}

- (unint64_t)rfcMmwRev
{
  return self->_rfcMmwRev;
}

- (void)setRfcMmwRev:(unint64_t)a3
{
  self->_rfcMmwRev = a3;
}

- (unint64_t)fr2TrxRev
{
  return self->_fr2TrxRev;
}

- (void)setFr2TrxRev:(unint64_t)a3
{
  self->_fr2TrxRev = a3;
}

- (BOOL)rffeScanPass
{
  return self->_rffeScanPass;
}

- (void)setRffeScanPass:(BOOL)a3
{
  self->_rffeScanPass = a3;
}

- (unint64_t)numExpectedDevices
{
  return self->_numExpectedDevices;
}

- (void)setNumExpectedDevices:(unint64_t)a3
{
  self->_numExpectedDevices = a3;
}

- (unint64_t)numDetectedDevices
{
  return self->_numDetectedDevices;
}

- (void)setNumDetectedDevices:(unint64_t)a3
{
  self->_numDetectedDevices = a3;
}

- (unint64_t)numMissingDevices
{
  return self->_numMissingDevices;
}

- (void)setNumMissingDevices:(unint64_t)a3
{
  self->_numMissingDevices = a3;
}

- (NSMutableArray)rffeScanInfo
{
  return self->_rffeScanInfo;
}

- (void)setRffeScanInfo:(id)a3
{
}

- (NSMutableArray)missingRffeDevices
{
  return self->_missingRffeDevices;
}

- (void)setMissingRffeDevices:(id)a3
{
}

- (NSMutableArray)missingAtDevices
{
  return self->_missingAtDevices;
}

- (void)setMissingAtDevices:(id)a3
{
}

- (NSMutableArray)missingMmwDevices
{
  return self->_missingMmwDevices;
}

- (void)setMissingMmwDevices:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_missingMmwDevices, 0);
  objc_storeStrong((id *)&self->_missingAtDevices, 0);
  objc_storeStrong((id *)&self->_missingRffeDevices, 0);

  objc_storeStrong((id *)&self->_rffeScanInfo, 0);
}

@end