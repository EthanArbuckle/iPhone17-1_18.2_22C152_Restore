@interface CBAudioLinkQualityInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CBAudioLinkQualityInfo)initWithCoder:(id)a3;
- (CBAudioLinkQualityInfo)initWithDictionary:(id)a3 error:(id *)a4;
- (CBAudioLinkQualityInfo)initWithXPCObject:(id)a3 error:(id *)a4;
- (NSString)deviceName;
- (char)codecType;
- (char)noiseFloor90;
- (char)rssiAverage;
- (char)signalToNoiseRatio;
- (double)jitterBufferSeconds;
- (double)retransmitRate;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)dictionaryRepresentation;
- (unsigned)aosState;
- (unsigned)bitRate;
- (unsigned)btBand;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCObject:(id)a3;
- (void)setAosState:(unsigned __int8)a3;
- (void)setBitRate:(unsigned int)a3;
- (void)setBtBand:(unsigned __int8)a3;
- (void)setCodecType:(char)a3;
- (void)setDeviceName:(id)a3;
- (void)setJitterBufferSeconds:(double)a3;
- (void)setNoiseFloor90:(char)a3;
- (void)setRetransmitRate:(double)a3;
- (void)setRssiAverage:(char)a3;
- (void)setSignalToNoiseRatio:(char)a3;
@end

@implementation CBAudioLinkQualityInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CBAudioLinkQualityInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  objc_opt_class();
  NSDecodeNSDictionaryOfClassesIfPresent();

  v5 = [(CBAudioLinkQualityInfo *)self initWithDictionary:0 error:0];
  return v5;
}

- (CBAudioLinkQualityInfo)initWithDictionary:(id)a3 error:(id *)a4
{
  v12 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  if (v12)
  {
    self = [(CBAudioLinkQualityInfo *)self initWithXPCObject:v12 error:a4];
    v13 = self;
  }
  else if (a4)
  {
    CBErrorF(-6700, (uint64_t)"CBControllerInfo convert XPC dict failed", v6, v7, v8, v9, v10, v11, v15);
    v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (CBAudioLinkQualityInfo)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(CBAudioLinkQualityInfo *)self init];
  if (!v7)
  {
    if (a4)
    {
      v23 = [(id)objc_opt_class() description];
      CBErrorF(-6756, (uint64_t)"%@ init failed", v24, v25, v26, v27, v28, v29, (uint64_t)v23);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_33;
  }
  if (MEMORY[0x1AD1120E0](v6) != MEMORY[0x1E4F14590])
  {
    if (a4)
    {
      CBErrorF(-6756, (uint64_t)"XPC non-dict", v8, v9, v10, v11, v12, v13, v30);
      v21 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    }
    goto LABEL_33;
  }
  int v14 = CUXPCDecodeUInt64RangedEx();
  if (v14 == 6)
  {
    v7->_aosState = 0;
  }
  else if (v14 == 5)
  {
    goto LABEL_33;
  }
  int v15 = CUXPCDecodeUInt64RangedEx();
  if (v15 == 6)
  {
    v7->_bitRate = 0;
  }
  else if (v15 == 5)
  {
    goto LABEL_33;
  }
  int v16 = CUXPCDecodeUInt64RangedEx();
  if (v16 == 6)
  {
    v7->_btBand = 0;
  }
  else if (v16 == 5)
  {
    goto LABEL_33;
  }
  int v17 = CUXPCDecodeSInt64RangedEx();
  if (v17 == 6)
  {
    v7->_codecType = 0;
  }
  else if (v17 == 5)
  {
    goto LABEL_33;
  }
  if (!CUXPCDecodeNSString() || !CUXPCDecodeDouble()) {
    goto LABEL_33;
  }
  int v18 = CUXPCDecodeSInt64RangedEx();
  if (v18 == 6)
  {
    v7->_noiseFloor90 = 0;
  }
  else if (v18 == 5)
  {
    goto LABEL_33;
  }
  if (!CUXPCDecodeDouble()) {
    goto LABEL_33;
  }
  int v19 = CUXPCDecodeSInt64RangedEx();
  if (v19 == 6)
  {
    v7->_rssiAverage = 0;
  }
  else if (v19 == 5)
  {
    goto LABEL_33;
  }
  int v20 = CUXPCDecodeSInt64RangedEx();
  if (v20 != 6)
  {
    if (v20 != 5) {
      goto LABEL_27;
    }
LABEL_33:
    v21 = 0;
    goto LABEL_28;
  }
  v7->_signalToNoiseRatio = 0;
LABEL_27:
  v21 = v7;
LABEL_28:

  return v21;
}

- (id)dictionaryRepresentation
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  [(CBAudioLinkQualityInfo *)self encodeWithXPCObject:v3];
  id v4 = (void *)CUXPCCreateCFObjectFromXPCObject();
  v5 = v4;
  if (!v4) {
    id v4 = (void *)MEMORY[0x1E4F1CC08];
  }
  id v6 = v4;

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(CBAudioLinkQualityInfo *)self dictionaryRepresentation];
  if (v4) {
    [v5 encodeObject:v4 forKey:@"auLQ"];
  }
}

- (void)encodeWithXPCObject:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_aosState) {
    xpc_dictionary_set_uint64(v4, "aos", self->_aosState);
  }
  uint64_t bitRate = self->_bitRate;
  if (bitRate) {
    xpc_dictionary_set_uint64(v5, "auBR", bitRate);
  }
  if (self->_btBand) {
    xpc_dictionary_set_uint64(v5, "btBd", self->_btBand);
  }
  if (self->_codecType) {
    xpc_dictionary_set_int64(v5, "auCT", self->_codecType);
  }
  deviceName = self->_deviceName;
  xpc_object_t xdict = v5;
  uint64_t v8 = [(NSString *)deviceName UTF8String];
  if (v8) {
    xpc_dictionary_set_string(xdict, "dvNm", v8);
  }

  double jitterBufferSeconds = self->_jitterBufferSeconds;
  if (jitterBufferSeconds != 0.0) {
    xpc_dictionary_set_double(xdict, "jtBf", jitterBufferSeconds);
  }
  if (self->_noiseFloor90) {
    xpc_dictionary_set_int64(xdict, "noFl", self->_noiseFloor90);
  }
  double retransmitRate = self->_retransmitRate;
  uint64_t v11 = xdict;
  if (retransmitRate != 0.0)
  {
    xpc_dictionary_set_double(xdict, "rtmR", retransmitRate);
    uint64_t v11 = xdict;
  }
  if (self->_rssiAverage)
  {
    xpc_dictionary_set_int64(xdict, "rsAv", self->_rssiAverage);
    uint64_t v11 = xdict;
  }
  if (self->_signalToNoiseRatio)
  {
    xpc_dictionary_set_int64(xdict, "snr", self->_signalToNoiseRatio);
    uint64_t v11 = xdict;
  }
}

- (id)description
{
  return [(CBAudioLinkQualityInfo *)self descriptionWithLevel:50];
}

- (id)descriptionWithLevel:(int)a3
{
  unsigned int v3 = a3;
  if (qword_1EB479220 != -1) {
    dispatch_once(&qword_1EB479220, &__block_literal_global_411);
  }
  id v4 = (void *)qword_1EB479218;
  id v5 = [MEMORY[0x1E4F1C9C8] date];
  id v6 = [v4 stringFromDate:v5];

  if (v3 > 0x14)
  {
    uint64_t v30 = 0;
    NSAppendPrintF_safe();
    id v29 = 0;
    NSAppendPrintF_safe();
    id v9 = v29;

    v28[8] = v9;
    NSAppendPrintF_safe();
    id v10 = v9;

    v28[7] = v10;
    NSAppendPrintF_safe();
    id v12 = v10;

    v28[6] = v12;
    NSAppendPrintF_safe();
    id v19 = v12;

    v28[5] = v19;
    NSAppendPrintF_safe();
    id v20 = v19;

    v28[4] = v20;
    NSAppendPrintF_safe();
    id v21 = v20;

    v28[3] = v21;
    NSAppendPrintF_safe();
    id v22 = v21;

    v28[2] = v22;
    NSAppendPrintF_safe();
    id v23 = v22;

    v28[1] = v23;
    NSAppendPrintF_safe();
    id v17 = v23;

    v28[0] = v17;
    int v18 = (id *)v28;
  }
  else
  {
    uint64_t v33 = 0;
    NSAppendPrintF_safe();
    id v32 = 0;
    NSAppendPrintF_safe();
    id v7 = v32;

    v31[7] = v7;
    NSAppendPrintF_safe();
    id v8 = v7;

    v31[6] = v8;
    NSAppendPrintF_safe();
    id v11 = v8;

    v31[5] = v11;
    NSAppendPrintF_safe();
    id v13 = v11;

    v31[4] = v13;
    NSAppendPrintF_safe();
    id v14 = v13;

    v31[3] = v14;
    NSAppendPrintF_safe();
    id v15 = v14;

    v31[2] = v15;
    NSAppendPrintF_safe();
    id v16 = v15;

    v31[1] = v16;
    NSAppendPrintF_safe();
    id v17 = v16;

    v31[0] = v17;
    int v18 = (id *)v31;
  }
  NSAppendPrintF_safe();
  uint64_t v24 = (__CFString *)*v18;

  if (v24) {
    uint64_t v25 = v24;
  }
  else {
    uint64_t v25 = &stru_1F02E5F20;
  }
  uint64_t v26 = v25;

  return v26;
}

void __47__CBAudioLinkQualityInfo_descriptionWithLevel___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)qword_1EB479218;
  qword_1EB479218 = (uint64_t)v0;

  [(id)qword_1EB479218 setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];
  v2 = (void *)qword_1EB479218;
  id v3 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  [v2 setTimeZone:v3];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v23 = 0;
    goto LABEL_19;
  }
  id v5 = v4;
  int aosState = self->_aosState;
  if (aosState != [v5 aosState]) {
    goto LABEL_17;
  }
  unsigned int bitRate = self->_bitRate;
  if (bitRate != [v5 bitRate]) {
    goto LABEL_17;
  }
  int btBand = self->_btBand;
  if (btBand != [v5 btBand]) {
    goto LABEL_17;
  }
  int codecType = self->_codecType;
  if (codecType != [v5 codecType]) {
    goto LABEL_17;
  }
  deviceName = self->_deviceName;
  id v11 = [v5 deviceName];
  id v12 = deviceName;
  id v13 = v11;
  if (v12 == v13)
  {
  }
  else
  {
    id v14 = v13;
    if ((v12 == 0) == (v13 != 0))
    {

LABEL_17:
      BOOL v23 = 0;
      goto LABEL_18;
    }
    int v15 = [(NSString *)v12 isEqual:v13];

    if (!v15) {
      goto LABEL_17;
    }
  }
  double jitterBufferSeconds = self->_jitterBufferSeconds;
  [v5 jitterBufferSeconds];
  if (jitterBufferSeconds != v17) {
    goto LABEL_17;
  }
  int noiseFloor90 = self->_noiseFloor90;
  if (noiseFloor90 != [v5 noiseFloor90]) {
    goto LABEL_17;
  }
  double retransmitRate = self->_retransmitRate;
  [v5 retransmitRate];
  if (retransmitRate != v20) {
    goto LABEL_17;
  }
  int rssiAverage = self->_rssiAverage;
  if (rssiAverage != [v5 rssiAverage]) {
    goto LABEL_17;
  }
  int signalToNoiseRatio = self->_signalToNoiseRatio;
  BOOL v23 = signalToNoiseRatio == [v5 signalToNoiseRatio];
LABEL_18:

LABEL_19:
  return v23;
}

- (unsigned)aosState
{
  return self->_aosState;
}

- (void)setAosState:(unsigned __int8)a3
{
  self->_int aosState = a3;
}

- (unsigned)bitRate
{
  return self->_bitRate;
}

- (void)setBitRate:(unsigned int)a3
{
  self->_unsigned int bitRate = a3;
}

- (unsigned)btBand
{
  return self->_btBand;
}

- (void)setBtBand:(unsigned __int8)a3
{
  self->_int btBand = a3;
}

- (char)codecType
{
  return self->_codecType;
}

- (void)setCodecType:(char)a3
{
  self->_int codecType = a3;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (double)jitterBufferSeconds
{
  return self->_jitterBufferSeconds;
}

- (void)setJitterBufferSeconds:(double)a3
{
  self->_double jitterBufferSeconds = a3;
}

- (char)noiseFloor90
{
  return self->_noiseFloor90;
}

- (void)setNoiseFloor90:(char)a3
{
  self->_int noiseFloor90 = a3;
}

- (double)retransmitRate
{
  return self->_retransmitRate;
}

- (void)setRetransmitRate:(double)a3
{
  self->_double retransmitRate = a3;
}

- (char)rssiAverage
{
  return self->_rssiAverage;
}

- (void)setRssiAverage:(char)a3
{
  self->_int rssiAverage = a3;
}

- (char)signalToNoiseRatio
{
  return self->_signalToNoiseRatio;
}

- (void)setSignalToNoiseRatio:(char)a3
{
  self->_int signalToNoiseRatio = a3;
}

- (void).cxx_destruct
{
}

@end