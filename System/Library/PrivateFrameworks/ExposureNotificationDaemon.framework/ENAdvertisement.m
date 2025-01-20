@interface ENAdvertisement
+ (id)decryptedMetadataForTemporaryExposureKey:(id)a3 encryptedAEM:(id *)a4 RPI:(id *)a5;
- ($8B507D830E6EE36862B76123793C2CB9)structRepresentation;
- (BOOL)saturated;
- (ENAdvertisement)initWithRPI:(id)a3 encryptedAEM:(id)a4 timestamp:(double)a5 scanInterval:(unsigned __int16)a6 typicalRSSI:(char)a7 maxRSSI:(char)a8 saturated:(BOOL)a9 counter:(unsigned __int8)a10;
- (ENAdvertisement)initWithStructRepresentation:(id *)a3;
- (NSData)encryptedAEM;
- (NSData)rpi;
- (char)maxRSSI;
- (char)typicalRSSI;
- (double)timestamp;
- (id)decryptedMetadataForTemporaryExposureKey:(id)a3;
- (id)description;
- (unsigned)counter;
- (unsigned)scanInterval;
- (void)combineWithAdvertisement:(id)a3;
- (void)setCounter:(unsigned __int8)a3;
- (void)setEncryptedAEM:(id)a3;
- (void)setMaxRSSI:(char)a3;
- (void)setRpi:(id)a3;
- (void)setSaturated:(BOOL)a3;
- (void)setScanInterval:(unsigned __int16)a3;
- (void)setTimestamp:(double)a3;
- (void)setTypicalRSSI:(char)a3;
@end

@implementation ENAdvertisement

- (ENAdvertisement)initWithStructRepresentation:(id *)a3
{
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B0]) initWithBytes:a3 length:16];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B0]) initWithBytes:&a3->var1 length:4];
  LOBYTE(v9) = HIBYTE(a3->var5);
  v7 = [(ENAdvertisement *)self initWithRPI:v5 encryptedAEM:v6 timestamp:HIWORD(a3->var3) scanInterval:SLOBYTE(a3->var4) typicalRSSI:SHIBYTE(a3->var4) maxRSSI:LOBYTE(a3->var5) saturated:*(double *)(&a3->var1 + 1) counter:v9];

  return v7;
}

- (ENAdvertisement)initWithRPI:(id)a3 encryptedAEM:(id)a4 timestamp:(double)a5 scanInterval:(unsigned __int16)a6 typicalRSSI:(char)a7 maxRSSI:(char)a8 saturated:(BOOL)a9 counter:(unsigned __int8)a10
{
  id v18 = a3;
  id v19 = a4;
  v23.receiver = self;
  v23.super_class = (Class)ENAdvertisement;
  v20 = [(ENAdvertisement *)&v23 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_rpi, a3);
    objc_storeStrong((id *)&v21->_encryptedAEM, a4);
    v21->_timestamp = a5;
    v21->_scanInterval = a6;
    v21->_typicalRSSI = a7;
    v21->_maxRSSI = a8;
    v21->_saturated = a9;
    v21->_counter = a10;
  }

  return v21;
}

- ($8B507D830E6EE36862B76123793C2CB9)structRepresentation
{
  *(void *)retstr->var0.var0 = 0;
  *(void *)&retstr->var0.var0[8] = 0;
  retstr->var1 = 0;
  p_var1 = &retstr->var1;
  *(double *)(&retstr->var1 + 1) = self->_timestamp;
  HIDWORD(retstr->var2) = 0;
  LOWORD(retstr->var3) = 0;
  HIWORD(retstr->var3) = self->_scanInterval;
  *(_DWORD *)&retstr->var4 = *(_DWORD *)&self->_typicalRSSI;
  -[NSData getBytes:length:](self->_rpi, "getBytes:length:");
  encryptedAEM = self->_encryptedAEM;

  return ($8B507D830E6EE36862B76123793C2CB9 *)[(NSData *)encryptedAEM getBytes:p_var1 length:4];
}

- (void)combineWithAdvertisement:(id)a3
{
  id v4 = a3;
  unsigned __int8 counter = self->_counter;
  id v16 = v4;
  unsigned __int8 v6 = [v4 counter] + counter;
  if (!v6)
  {
    if (gLogCategory__ENAdvertisement <= 115
      && (gLogCategory__ENAdvertisement != -1 || _LogCategory_Initialize()))
    {
      uint64_t v14 = self->_counter;
      uint64_t v15 = [v16 counter];
      LogPrintF_safe();
    }
    unsigned __int8 v6 = 1;
  }
  int v7 = objc_msgSend(v16, "typicalRSSI", v14, v15);
  int typicalRSSI = self->_typicalRSSI;
  if (v7 == 127)
  {
    if (typicalRSSI < (int)[v16 typicalRSSI])
    {
      LOBYTE(v9) = self->_typicalRSSI;
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  if (typicalRSSI == 127)
  {
    [v16 typicalRSSI];
LABEL_12:
    LOBYTE(v9) = [v16 typicalRSSI];
    goto LABEL_14;
  }
  int v10 = self->_counter * typicalRSSI;
  int v11 = [v16 typicalRSSI];
  int v9 = (int)(v10 + [v16 counter] * v11) / v6;
LABEL_14:
  self->_int typicalRSSI = v9;
  int maxRSSI = self->_maxRSSI;
  if (maxRSSI <= (int)[v16 maxRSSI]) {
    uint64_t v13 = [v16 maxRSSI];
  }
  else {
    uint64_t v13 = self->_maxRSSI;
  }
  self->_int maxRSSI = v13;
  self->_saturated = self->_typicalRSSI == 127;
  self->_unsigned __int8 counter = v6;

  MEMORY[0x1F41817F8](v13, v16);
}

- (id)decryptedMetadataForTemporaryExposureKey:(id)a3
{
  v8[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NSData *)self->_encryptedAEM length] == 4 && [(NSData *)self->_rpi length] == 16)
  {
    v8[0] = 0;
    v8[1] = 0;
    [(NSData *)self->_rpi getBytes:v8 length:16];
    int v7 = 0;
    [(NSData *)self->_encryptedAEM getBytes:&v7 length:4];
    v5 = [(id)objc_opt_class() decryptedMetadataForTemporaryExposureKey:v4 encryptedAEM:&v7 RPI:v8];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)decryptedMetadataForTemporaryExposureKey:(id)a3 encryptedAEM:(id *)a4 RPI:(id *)a5
{
  uint64_t v9 = 0;
  [a3 getAEMBytes:&v9 input:a4 length:4 RPI:a5];
  ENRPIMetadataDeserialize();
  if (BYTE4(v9) == 1)
  {
    if (BYTE5(v9)) {
      uint64_t v5 = 2 * (BYTE5(v9) == 1);
    }
    else {
      uint64_t v5 = 1;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  unsigned __int8 v6 = [ENAdvertisementMetadata alloc];
  int v7 = [(ENAdvertisementMetadata *)v6 initWithVersion:v5 txPower:SBYTE6(v9) calibrationConfidence:HIBYTE(v9)];

  return v7;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v17 = NSStringFromClass(v3);
  NSAppendPrintF_safe();
  id v4 = 0;

  uint64_t v5 = [(NSData *)self->_rpi bytes];
  NSUInteger v6 = [(NSData *)self->_rpi length];
  NSUInteger v19 = [(NSData *)self->_rpi length];
  id v18 = v5;
  NSAppendPrintF();
  id v7 = v4;

  [(NSData *)self->_encryptedAEM bytes];
  [(NSData *)self->_encryptedAEM length];
  [(NSData *)self->_encryptedAEM length];
  NSAppendPrintF();
  id v8 = v7;

  uint64_t v9 = CUPrintDateCF();
  NSAppendPrintF_safe();
  id v10 = v8;

  NSAppendPrintF_safe();
  id v11 = v10;

  NSAppendPrintF_safe();
  id v12 = v11;

  NSAppendPrintF_safe();
  id v13 = v12;

  NSAppendPrintF_safe();
  id v14 = v13;

  if (self->_saturated)
  {
    NSAppendPrintF_safe();
    id v15 = v14;

    id v14 = v15;
  }

  return v14;
}

- (NSData)rpi
{
  return self->_rpi;
}

- (void)setRpi:(id)a3
{
}

- (NSData)encryptedAEM
{
  return self->_encryptedAEM;
}

- (void)setEncryptedAEM:(id)a3
{
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (unsigned)scanInterval
{
  return self->_scanInterval;
}

- (void)setScanInterval:(unsigned __int16)a3
{
  self->_scanInterval = a3;
}

- (char)typicalRSSI
{
  return self->_typicalRSSI;
}

- (void)setTypicalRSSI:(char)a3
{
  self->_int typicalRSSI = a3;
}

- (char)maxRSSI
{
  return self->_maxRSSI;
}

- (void)setMaxRSSI:(char)a3
{
  self->_int maxRSSI = a3;
}

- (BOOL)saturated
{
  return self->_saturated;
}

- (void)setSaturated:(BOOL)a3
{
  self->_saturated = a3;
}

- (unsigned)counter
{
  return self->_counter;
}

- (void)setCounter:(unsigned __int8)a3
{
  self->_unsigned __int8 counter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptedAEM, 0);

  objc_storeStrong((id *)&self->_rpi, 0);
}

@end