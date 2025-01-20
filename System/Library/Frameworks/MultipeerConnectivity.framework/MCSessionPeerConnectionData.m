@interface MCSessionPeerConnectionData
+ (id)connectionDataSegmentWithEncryptionPreference:(int64_t)a3 identitySet:(BOOL)a4 gckSessionConnectionDataBytes:(void *)a5 gckSessionConnectionDataLength:(unint64_t)a6;
- (BOOL)hasIdentitySet;
- (BOOL)parseConnectionDataBlob:(id)a3;
- (BOOL)parseConnectionDataSegmentWithBytes:(char *)a3 withLength:(unint64_t)a4;
- (MCSessionPeerConnectionData)initWithConnectionDataBlob:(id)a3;
- (NSData)gckSessionConnectionData;
- (int64_t)encryptionPreference;
- (void)dealloc;
- (void)setEncryptionPreference:(int64_t)a3;
- (void)setGckSessionConnectionData:(id)a3;
- (void)setHasIdentitySet:(BOOL)a3;
@end

@implementation MCSessionPeerConnectionData

- (MCSessionPeerConnectionData)initWithConnectionDataBlob:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MCSessionPeerConnectionData;
  v4 = [(MCSessionPeerConnectionData *)&v7 init];
  v5 = v4;
  if (v4 && ![(MCSessionPeerConnectionData *)v4 parseConnectionDataBlob:a3])
  {

    return 0;
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MCSessionPeerConnectionData;
  [(MCSessionPeerConnectionData *)&v3 dealloc];
}

+ (id)connectionDataSegmentWithEncryptionPreference:(int64_t)a3 identitySet:(BOOL)a4 gckSessionConnectionDataBytes:(void *)a5 gckSessionConnectionDataLength:(unint64_t)a6
{
  v11[0] = 0x80;
  char v8 = a3 & 3;
  if (a4) {
    char v8 = a3 & 3 | 4;
  }
  v11[1] = v8;
  __int16 v12 = bswap32(a6 + 4) >> 16;
  v9 = objc_msgSend(MEMORY[0x263EFF990], "dataWithCapacity:");
  [v9 appendBytes:v11 length:4];
  [v9 appendBytes:a5 length:a6];
  return v9;
}

- (BOOL)parseConnectionDataSegmentWithBytes:(char *)a3 withLength:(unint64_t)a4
{
  [(MCSessionPeerConnectionData *)self setEncryptionPreference:a3[1] & 3];
  [(MCSessionPeerConnectionData *)self setHasIdentitySet:(a3[1] >> 2) & 1];
  if (a4 <= 3)
  {
    objc_super v7 = mcs_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[MCSessionPeerConnectionData parseConnectionDataSegmentWithBytes:withLength:]();
    }
  }
  else
  {
    -[MCSessionPeerConnectionData setGckSessionConnectionData:](self, "setGckSessionConnectionData:", [MEMORY[0x263EFF8F8] dataWithBytes:a3 + 4 length:a4 - 4]);
  }
  return a4 > 3;
}

- (BOOL)parseConnectionDataBlob:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  unint64_t v5 = [a3 length];
  LOBYTE(v6) = 0;
  if (a3 && v5)
  {
    uint64_t v7 = [a3 bytes];
    unint64_t v8 = 0;
    while (1)
    {
      if (v5 - v8 <= 3)
      {
        v14 = mcs_log();
        BOOL v6 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
        if (!v6) {
          return v6;
        }
        [(MCSessionPeerConnectionData *)v5 - v8 parseConnectionDataBlob:v15];
        goto LABEL_18;
      }
      unsigned int v9 = bswap32(*(unsigned __int16 *)(v7 + 2));
      unint64_t v10 = HIWORD(v9);
      if (v5 - v8 < v10) {
        break;
      }
      char v11 = *(unsigned char *)v7;
      int v12 = *(unsigned char *)v7 & 0x7F;
      if ((*(unsigned char *)v7 & 0x7F) != 0)
      {
        v13 = mcs_log();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          int v19 = v12;
          _os_log_impl(&dword_218756000, v13, OS_LOG_TYPE_DEFAULT, "Unrecognized segmentID [%d] in connection data blob.", buf, 8u);
        }
        if (v11 < 0) {
          goto LABEL_18;
        }
      }
      else if (![(MCSessionPeerConnectionData *)self parseConnectionDataSegmentWithBytes:v7 withLength:HIWORD(v9)])
      {
        goto LABEL_18;
      }
      v8 += v10;
      v7 += v10;
      if (v8 >= v5)
      {
        LOBYTE(v6) = 1;
        return v6;
      }
    }
    v16 = mcs_log();
    BOOL v6 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (!v6) {
      return v6;
    }
    -[MCSessionPeerConnectionData parseConnectionDataBlob:]();
LABEL_18:
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (NSData)gckSessionConnectionData
{
  return self->_gckSessionConnectionData;
}

- (void)setGckSessionConnectionData:(id)a3
{
}

- (int64_t)encryptionPreference
{
  return self->_encryptionPreference;
}

- (void)setEncryptionPreference:(int64_t)a3
{
  self->_encryptionPreference = a3;
}

- (BOOL)hasIdentitySet
{
  return self->_hasIdentitySet;
}

- (void)setHasIdentitySet:(BOOL)a3
{
  self->_hasIdentitySet = a3;
}

- (void)parseConnectionDataSegmentWithBytes:withLength:.cold.1()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_14();
  uint64_t v3 = 4;
  OUTLINED_FUNCTION_15(&dword_218756000, v0, v1, "Data segment length [%ld] is smaller than the data segment header size [%ld].", v2);
}

- (void)parseConnectionDataBlob:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 134218240;
  uint64_t v4 = 4;
  __int16 v5 = 2048;
  uint64_t v6 = a1;
  OUTLINED_FUNCTION_15(&dword_218756000, a2, a3, "SegmentLengthSize [%ld] is larger then buffer length [%ld].", (uint8_t *)&v3);
}

- (void)parseConnectionDataBlob:.cold.2()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_14();
  uint64_t v3 = v0;
  OUTLINED_FUNCTION_15(&dword_218756000, v1, (uint64_t)v1, "SegmentLength [%ld] is larger then buffer length [%ld].", v2);
}

@end