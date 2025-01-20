@interface CCIDDescriptorView
+ (unint64_t)length;
- (BOOL)acceptedNAD;
- (BOOL)automaticBaudRateChange;
- (BOOL)automaticICCActivation;
- (BOOL)automaticICCClockFrequency;
- (BOOL)automaticICCVoltageSelection;
- (BOOL)automaticIFSD;
- (BOOL)automaticPPS;
- (BOOL)automaticParameterConfigurationBasedOnATR;
- (BOOL)automaticParametersNegotation;
- (BOOL)canSetClockStop;
- (BOOL)isSupported:(unint64_t)a3;
- (CCIDDescriptorView)initWithBytes:(const void *)a3 length:(unint64_t)a4;
- (id)description;
- (id)levelExchangeToString:(int64_t)a3;
- (id)supportedProtocols;
- (id)trueOrFalse:(BOOL)a3;
- (id)voltageSupport;
- (int64_t)levelOfExchange;
- (unsigned)bClassEnvelope;
- (unsigned)bClassGetResponse;
- (unsigned)bDescriptorType;
- (unsigned)bLength;
- (unsigned)bMaxCCIDBusySlots;
- (unsigned)bMaxSlotIndex;
- (unsigned)bNumClockSupported;
- (unsigned)bNumDataRatesSupported;
- (unsigned)bPINSupport;
- (unsigned)bVoltageSupport;
- (unsigned)bcdCCID;
- (unsigned)dwDataRate;
- (unsigned)dwDefaultClock;
- (unsigned)dwFeatures;
- (unsigned)dwMaxCCIDMessageLength;
- (unsigned)dwMaxDataRate;
- (unsigned)dwMaxIFSD;
- (unsigned)dwMaximumClock;
- (unsigned)dwMechanical;
- (unsigned)dwProtocols;
- (unsigned)dwSynchProtocols;
- (unsigned)wLcdLayout;
@end

@implementation CCIDDescriptorView

- (CCIDDescriptorView)initWithBytes:(const void *)a3 length:(unint64_t)a4
{
  if (+[CCIDDescriptorView length] != a4) {
    +[NSException raise:NSInvalidArgumentException, @"Invalid length: %lu", a4 format];
  }
  v7 = +[NSData dataWithBytes:a3 length:a4];
  v10.receiver = self;
  v10.super_class = (Class)CCIDDescriptorView;
  v8 = [(TKDataView *)&v10 initWithData:v7];

  return v8;
}

+ (unint64_t)length
{
  return 54;
}

- (id)levelExchangeToString:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return 0;
  }
  else {
    return *(&off_100024AB0 + a3);
  }
}

- (id)trueOrFalse:(BOOL)a3
{
  if (a3) {
    return @"true";
  }
  else {
    return @"false";
  }
}

- (id)supportedProtocols
{
  v3 = +[NSMutableString string];
  [v3 appendString:@"{"];
  if ([(CCIDDescriptorView *)self isSupported:1]) {
    [v3 appendString:@" TKSmartCardProtocolT0"];
  }
  if ([(CCIDDescriptorView *)self isSupported:2]) {
    [v3 appendString:@" TKSmartCardProtocolT1"];
  }
  [v3 appendString:@" }"];

  return v3;
}

- (id)voltageSupport
{
  v3 = +[NSMutableString string];
  [v3 appendString:@"{"];
  if ([(CCIDDescriptorView *)self bVoltageSupport]) {
    [v3 appendString:@" ClassA"];
  }
  if ([(CCIDDescriptorView *)self bVoltageSupport]) {
    [v3 appendString:@" ClassB"];
  }
  if ([(CCIDDescriptorView *)self bVoltageSupport]) {
    [v3 appendString:@" ClassC"];
  }
  [v3 appendString:@" }"];

  return v3;
}

- (id)description
{
  v3 = +[NSMutableString string];
  [v3 appendString:@"{\n"];
  objc_msgSend(v3, "appendFormat:", @"    bLength: 0x%.2x\n", -[CCIDDescriptorView bLength](self, "bLength"));
  objc_msgSend(v3, "appendFormat:", @"    bDescriptorType: 0x%.2x\n", -[CCIDDescriptorView bDescriptorType](self, "bDescriptorType"));
  objc_msgSend(v3, "appendFormat:", @"    bcdCCID: 0x%.4x\n", -[CCIDDescriptorView bcdCCID](self, "bcdCCID"));
  objc_msgSend(v3, "appendFormat:", @"    bMaxSlotIndex: %d\n", -[CCIDDescriptorView bMaxSlotIndex](self, "bMaxSlotIndex"));
  v4 = [(CCIDDescriptorView *)self voltageSupport];
  [v3 appendFormat:@"    bVoltageSupport: %@\n", v4];

  v5 = [(CCIDDescriptorView *)self supportedProtocols];
  [v3 appendFormat:@"    dwProtocols: %@\n", v5];

  objc_msgSend(v3, "appendFormat:", @"    bNumClockSupported: %d\n", -[CCIDDescriptorView bNumClockSupported](self, "bNumClockSupported"));
  objc_msgSend(v3, "appendFormat:", @"    defaultClock: %.1f MHz\n", (double)-[CCIDDescriptorView dwDefaultClock](self, "dwDefaultClock") * 0.001);
  objc_msgSend(v3, "appendFormat:", @"    dwMaximumClock: %.1f MHz\n", (double)-[CCIDDescriptorView dwMaximumClock](self, "dwMaximumClock") * 0.001);
  objc_msgSend(v3, "appendFormat:", @"    bNumDataRatesSupported: %d\n", -[CCIDDescriptorView bNumDataRatesSupported](self, "bNumDataRatesSupported"));
  objc_msgSend(v3, "appendFormat:", @"    dwDataRate: %.3f kbps\n", (double)-[CCIDDescriptorView dwDataRate](self, "dwDataRate") * 0.001);
  objc_msgSend(v3, "appendFormat:", @"    dwMaxDataRate: %.3f kbps\n", (double)-[CCIDDescriptorView dwMaxDataRate](self, "dwMaxDataRate") * 0.001);
  objc_msgSend(v3, "appendFormat:", @"    dwMaxIFSD: %d\n", -[CCIDDescriptorView dwMaxIFSD](self, "dwMaxIFSD"));
  objc_msgSend(v3, "appendFormat:", @"    dwSynchProtocols: %d\n", -[CCIDDescriptorView dwSynchProtocols](self, "dwSynchProtocols"));
  objc_msgSend(v3, "appendFormat:", @"    dwMechanical: %d\n\n", -[CCIDDescriptorView dwMechanical](self, "dwMechanical"));
  objc_msgSend(v3, "appendFormat:", @"    dwFeatures 0x%.8x\n", -[CCIDDescriptorView dwFeatures](self, "dwFeatures"));
  v6 = [(CCIDDescriptorView *)self levelExchangeToString:[(CCIDDescriptorView *)self levelOfExchange]];
  [v3 appendFormat:@"        levelOfExchange %@\n", v6];

  v7 = [(CCIDDescriptorView *)self trueOrFalse:[(CCIDDescriptorView *)self automaticParameterConfigurationBasedOnATR]];
  [v3 appendFormat:@"        automaticParameterConfigurationBasedOnATR %@\n", v7];

  v8 = [(CCIDDescriptorView *)self trueOrFalse:[(CCIDDescriptorView *)self automaticICCActivation]];
  [v3 appendFormat:@"        automaticActivation %@\n", v8];

  v9 = [(CCIDDescriptorView *)self trueOrFalse:[(CCIDDescriptorView *)self automaticICCVoltageSelection]];
  [v3 appendFormat:@"        automaticICCVoltageSelection %@\n", v9];

  objc_super v10 = [(CCIDDescriptorView *)self trueOrFalse:[(CCIDDescriptorView *)self automaticICCClockFrequency]];
  [v3 appendFormat:@"        automaticICCClockFrequency %@\n", v10];

  v11 = [(CCIDDescriptorView *)self trueOrFalse:[(CCIDDescriptorView *)self automaticBaudRateChange]];
  [v3 appendFormat:@"        automaticBaudRateChange %@\n", v11];

  v12 = [(CCIDDescriptorView *)self trueOrFalse:[(CCIDDescriptorView *)self automaticParametersNegotation]];
  [v3 appendFormat:@"        automaticParametersNegotation %@\n", v12];

  v13 = [(CCIDDescriptorView *)self trueOrFalse:[(CCIDDescriptorView *)self automaticPPS]];
  [v3 appendFormat:@"        automaticPPS %@\n", v13];

  v14 = [(CCIDDescriptorView *)self trueOrFalse:[(CCIDDescriptorView *)self canSetClockStop]];
  [v3 appendFormat:@"        canSetClockStop %@\n", v14];

  v15 = [(CCIDDescriptorView *)self trueOrFalse:[(CCIDDescriptorView *)self acceptedNAD]];
  [v3 appendFormat:@"        acceptedNAD %@\n", v15];

  v16 = [(CCIDDescriptorView *)self trueOrFalse:[(CCIDDescriptorView *)self automaticIFSD]];
  [v3 appendFormat:@"        automaticIFSD %@\n\n", v16];

  objc_msgSend(v3, "appendFormat:", @"    dwMaxCCIDMessageLength: %d\n", -[CCIDDescriptorView dwMaxCCIDMessageLength](self, "dwMaxCCIDMessageLength"));
  objc_msgSend(v3, "appendFormat:", @"    bClassGetResponse: %d\n", -[CCIDDescriptorView bClassGetResponse](self, "bClassGetResponse"));
  objc_msgSend(v3, "appendFormat:", @"    bClassEnvelope: %d\n", -[CCIDDescriptorView bClassEnvelope](self, "bClassEnvelope"));
  objc_msgSend(v3, "appendFormat:", @"    wLcdLayout: %d\n", -[CCIDDescriptorView wLcdLayout](self, "wLcdLayout"));
  objc_msgSend(v3, "appendFormat:", @"    bPINSupport: %d\n", -[CCIDDescriptorView bPINSupport](self, "bPINSupport"));
  objc_msgSend(v3, "appendFormat:", @"    bMaxCCIDBusySlots: %d\n", -[CCIDDescriptorView bMaxCCIDBusySlots](self, "bMaxCCIDBusySlots"));
  [v3 appendString:@"}\n"];

  return v3;
}

- (unsigned)bLength
{
  unsigned __int8 v4 = 0;
  v2 = [(TKDataView *)self buffer];
  objc_msgSend(v2, "getBytes:range:", &v4, 0, 1);

  return v4;
}

- (unsigned)bDescriptorType
{
  unsigned __int8 v4 = 0;
  v2 = [(TKDataView *)self buffer];
  objc_msgSend(v2, "getBytes:range:", &v4, 1, 1);

  return v4;
}

- (unsigned)bcdCCID
{
  unsigned __int16 v4 = 0;
  v2 = [(TKDataView *)self buffer];
  objc_msgSend(v2, "getBytes:range:", &v4, 2, 2);

  return v4;
}

- (unsigned)bMaxSlotIndex
{
  unsigned __int8 v4 = 0;
  v2 = [(TKDataView *)self buffer];
  objc_msgSend(v2, "getBytes:range:", &v4, 4, 1);

  return v4;
}

- (unsigned)bVoltageSupport
{
  unsigned __int8 v4 = 0;
  v2 = [(TKDataView *)self buffer];
  objc_msgSend(v2, "getBytes:range:", &v4, 5, 1);

  return v4;
}

- (unsigned)dwProtocols
{
  unsigned int v4 = 0;
  v2 = [(TKDataView *)self buffer];
  objc_msgSend(v2, "getBytes:range:", &v4, 6, 4);

  return v4;
}

- (unsigned)dwDefaultClock
{
  unsigned int v4 = 0;
  v2 = [(TKDataView *)self buffer];
  objc_msgSend(v2, "getBytes:range:", &v4, 10, 4);

  return v4;
}

- (unsigned)dwMaximumClock
{
  unsigned int v4 = 0;
  v2 = [(TKDataView *)self buffer];
  objc_msgSend(v2, "getBytes:range:", &v4, 14, 4);

  return v4;
}

- (unsigned)bNumClockSupported
{
  unsigned __int8 v4 = 0;
  v2 = [(TKDataView *)self buffer];
  objc_msgSend(v2, "getBytes:range:", &v4, 18, 1);

  return v4;
}

- (unsigned)dwDataRate
{
  unsigned int v4 = 0;
  v2 = [(TKDataView *)self buffer];
  objc_msgSend(v2, "getBytes:range:", &v4, 19, 4);

  return v4;
}

- (unsigned)dwMaxDataRate
{
  unsigned int v4 = 0;
  v2 = [(TKDataView *)self buffer];
  objc_msgSend(v2, "getBytes:range:", &v4, 23, 4);

  return v4;
}

- (unsigned)bNumDataRatesSupported
{
  unsigned __int8 v4 = 0;
  v2 = [(TKDataView *)self buffer];
  objc_msgSend(v2, "getBytes:range:", &v4, 27, 1);

  return v4;
}

- (unsigned)dwMaxIFSD
{
  unsigned int v4 = 0;
  v2 = [(TKDataView *)self buffer];
  objc_msgSend(v2, "getBytes:range:", &v4, 28, 4);

  return v4;
}

- (unsigned)dwSynchProtocols
{
  unsigned int v4 = 0;
  v2 = [(TKDataView *)self buffer];
  objc_msgSend(v2, "getBytes:range:", &v4, 32, 4);

  return v4;
}

- (unsigned)dwMechanical
{
  unsigned int v4 = 0;
  v2 = [(TKDataView *)self buffer];
  objc_msgSend(v2, "getBytes:range:", &v4, 36, 4);

  return v4;
}

- (unsigned)dwFeatures
{
  unsigned int v4 = 0;
  v2 = [(TKDataView *)self buffer];
  objc_msgSend(v2, "getBytes:range:", &v4, 40, 4);

  return v4;
}

- (unsigned)dwMaxCCIDMessageLength
{
  unsigned int v4 = 0;
  v2 = [(TKDataView *)self buffer];
  objc_msgSend(v2, "getBytes:range:", &v4, 44, 4);

  return v4;
}

- (unsigned)bClassGetResponse
{
  unsigned __int8 v4 = 0;
  v2 = [(TKDataView *)self buffer];
  objc_msgSend(v2, "getBytes:range:", &v4, 48, 1);

  return v4;
}

- (unsigned)bClassEnvelope
{
  unsigned __int8 v4 = 0;
  v2 = [(TKDataView *)self buffer];
  objc_msgSend(v2, "getBytes:range:", &v4, 49, 1);

  return v4;
}

- (unsigned)wLcdLayout
{
  unsigned __int16 v4 = 0;
  v2 = [(TKDataView *)self buffer];
  objc_msgSend(v2, "getBytes:range:", &v4, 50, 2);

  return v4;
}

- (unsigned)bPINSupport
{
  unsigned __int8 v4 = 0;
  v2 = [(TKDataView *)self buffer];
  objc_msgSend(v2, "getBytes:range:", &v4, 52, 1);

  return v4;
}

- (unsigned)bMaxCCIDBusySlots
{
  unsigned __int8 v4 = 0;
  v2 = [(TKDataView *)self buffer];
  objc_msgSend(v2, "getBytes:range:", &v4, 53, 1);

  return v4;
}

- (int64_t)levelOfExchange
{
  if (([(CCIDDescriptorView *)self dwFeatures] & 0x10000) != 0) {
    return 1;
  }
  if (([(CCIDDescriptorView *)self dwFeatures] & 0x20000) != 0) {
    return 2;
  }
  if (([(CCIDDescriptorView *)self dwFeatures] & 0x40000) != 0) {
    return 3;
  }
  return 0;
}

- (BOOL)automaticParameterConfigurationBasedOnATR
{
  return ([(CCIDDescriptorView *)self dwFeatures] >> 1) & 1;
}

- (BOOL)automaticICCActivation
{
  return ([(CCIDDescriptorView *)self dwFeatures] >> 2) & 1;
}

- (BOOL)automaticICCVoltageSelection
{
  return ([(CCIDDescriptorView *)self dwFeatures] >> 3) & 1;
}

- (BOOL)automaticICCClockFrequency
{
  return ([(CCIDDescriptorView *)self dwFeatures] >> 4) & 1;
}

- (BOOL)automaticBaudRateChange
{
  return ([(CCIDDescriptorView *)self dwFeatures] >> 5) & 1;
}

- (BOOL)automaticParametersNegotation
{
  return ([(CCIDDescriptorView *)self dwFeatures] >> 6) & 1;
}

- (BOOL)automaticPPS
{
  return ([(CCIDDescriptorView *)self dwFeatures] >> 7) & 1;
}

- (BOOL)canSetClockStop
{
  return ([(CCIDDescriptorView *)self dwFeatures] >> 8) & 1;
}

- (BOOL)acceptedNAD
{
  return ([(CCIDDescriptorView *)self dwFeatures] >> 9) & 1;
}

- (BOOL)automaticIFSD
{
  return ([(CCIDDescriptorView *)self dwFeatures] >> 10) & 1;
}

- (BOOL)isSupported:(unint64_t)a3
{
  return ([(CCIDDescriptorView *)self dwProtocols] & a3) != 0;
}

@end