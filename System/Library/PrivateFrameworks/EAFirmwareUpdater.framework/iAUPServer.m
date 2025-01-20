@interface iAUPServer
- (BOOL)ackAppReentry;
- (BOOL)byteEscape;
- (BOOL)personalizationComplete;
- (BOOL)restartRequired;
- (BOOL)sleepWakeRequired;
- (BOOL)urgentUpdate;
- (FirmwareBundle)firmwareBundle;
- (OS_dispatch_queue)dispatchQ;
- (char)assetTypeString:(int)a3;
- (char)commandString:(int)a3;
- (char)parserStateString:(int)a3;
- (char)serverStateString:(int)a3;
- (iAUPServerDelegate)delegate;
- (id)getNumberOfBytesDownloadedInCurrentSession;
- (id)initInstanceWithByteEscape:(BOOL)a3;
- (id)processManifestProperties:(char *)a3 length:(unsigned int)a4;
- (id)sendCommand:(unsigned __int8)a3 payload:(char *)a4 payload_length:(unsigned __int16)a5;
- (int)parserState;
- (int)serverState;
- (unsigned)appendByteWithEscaping:(unsigned __int8)a3 toObject:(id *)a4;
- (unsigned)currentAsset;
- (unsigned)iAUPVersion;
- (unsigned)supportedTargetProductIDCode;
- (void)accessoryDisconnected;
- (void)appendToLog:(id)a3;
- (void)dealloc;
- (void)logCommand:(unsigned __int8)a3 payload:(char *)a4 length:(unsigned int)a5;
- (void)processDataFromAccessory:(id)a3;
- (void)processDownloadCompleteCommand:(char *)a3 length:(unsigned int)a4;
- (void)processIdentifyCommand:(char *)a3 length:(unsigned int)a4;
- (void)processInByte:(unsigned __int8)a3;
- (void)processInTelegram;
- (void)processNotifyAccessoryErrorCommand:(char *)a3 length:(unsigned int)a4;
- (void)processPersonalizationInfo:(char *)a3 length:(unsigned int)a4;
- (void)processRequestDownloadCommand:(char *)a3 length:(unsigned int)a4;
- (void)resetParser;
- (void)setAckAppReentry:(BOOL)a3;
- (void)setBootloaderEntry;
- (void)setByteEscape:(BOOL)a3;
- (void)setCurrentAsset:(unsigned __int8)a3;
- (void)setDelegate:(id)a3;
- (void)setDispatchQ:(id)a3;
- (void)setFirmwareBundle:(id)a3;
- (void)setHSModel:(id)a3 fallbackModel:(id)a4 error:(id)a5;
- (void)setIAUPVersion:(unsigned __int8)a3;
- (void)setParserState:(int)a3;
- (void)setResumeInfo:(char *)a3 length:(unsigned int)a4;
- (void)setServerState:(int)a3;
@end

@implementation iAUPServer

- (id)initInstanceWithByteEscape:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)iAUPServer;
  v4 = [(iAUPServer *)&v6 init];
  if (v4)
  {
    *((void *)v4 + 7) = [objc_alloc(MEMORY[0x263EFF990]) initWithCapacity:32];
    *((void *)v4 + 1) = 0;
    *((void *)v4 + 4) = 0;
    v4[25] = a3;
    v4[26] = 0;
    *((_WORD *)v4 + 42) = 0;
    *(_WORD *)(v4 + 87) = 256;
    [v4 resetParser];
    [v4 setServerState:1];
    *((_DWORD *)v4 + 20) = 0;
    *((_DWORD *)v4 + 18) = 0;
    memset_pattern16(v4 + 64, &unk_23BCFA970, 8uLL);
    NSLog(&cfstr_SIaupserverIni.isa, "-[iAUPServer initInstanceWithByteEscape:]", v4[25], [v4 serverStateString:*((unsigned int *)v4 + 4)], objc_msgSend(v4, "parserStateString:", *((unsigned int *)v4 + 5)));
  }
  return v4;
}

- (id)getNumberOfBytesDownloadedInCurrentSession
{
  return (id)[NSNumber numberWithUnsignedInt:self->_totalBytesDownloadedInCurrentSession];
}

- (void)dealloc
{
  NSLog(&cfstr_SIaupserverDea.isa, a2, "-[iAUPServer dealloc]");

  self->_telegramDataIn = 0;
  v3.receiver = self;
  v3.super_class = (Class)iAUPServer;
  [(iAUPServer *)&v3 dealloc];
}

- (unsigned)supportedTargetProductIDCode
{
  return [(FirmwareBundle *)self->_firmwareBundle productIDCode];
}

- (void)resetParser
{
  self->_escapeInProgress = 0;
  [(NSMutableData *)self->_telegramDataIn setLength:0];
  if (self->_byteEscape) {
    uint64_t v3 = 4294967294;
  }
  else {
    uint64_t v3 = 0xFFFFFFFFLL;
  }
  [(iAUPServer *)self setParserState:v3];
}

- (void)setServerState:(int)a3
{
  self->_serverState = a3;
}

- (void)setParserState:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = [(iAUPServer *)self parserState];
  if ((int)v3 < 1 || v5 <= 0) {
    NSLog(&cfstr_ParserStateSS.isa, [(iAUPServer *)self parserStateString:self->_parserState], [(iAUPServer *)self parserStateString:v3]);
  }
  self->_parserState = v3;
}

- (void)appendToLog:(id)a3
{
  v4 = [(iAUPServer *)self delegate];
  [(iAUPServerDelegate *)v4 logStatusString:a3];
}

- (void)setFirmwareBundle:(id)a3
{
  firmwareBundle = self->_firmwareBundle;
  if (firmwareBundle)
  {

    self->_firmwareBundle = 0;
  }
  self->_firmwareBundle = (FirmwareBundle *)a3;
  if ([(iAUPServer *)self serverState] != 1 && [(iAUPServer *)self serverState] != 7)
  {
    [(iAUPServer *)self resetParser];
    [(iAUPServer *)self setServerState:6];
  }
}

- (void)logCommand:(unsigned __int8)a3 payload:(char *)a4 length:(unsigned int)a5
{
  if ((int)a3 > 95)
  {
    if ((int)a3 <= 191)
    {
      if ((a3 - 128) >= 8)
      {
        if ((a3 - 96) >= 4) {
          goto LABEL_29;
        }
        goto LABEL_22;
      }
    }
    else
    {
      if (a3 == 192)
      {
        v7 = @"Bootloader entry command acknowledged";
        goto LABEL_24;
      }
      if (a3 == 193)
      {
        v7 = @"App re-entry command acknowledged";
        goto LABEL_24;
      }
      if (a3 != 194) {
        goto LABEL_29;
      }
    }
LABEL_18:
    uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"Command: 0x%X %s", a3, -[iAUPServer commandString:](self, "commandString:", a3, a4, *(void *)&a5));
LABEL_23:
    v7 = (__CFString *)v8;
    goto LABEL_24;
  }
  if ((int)a3 > 4)
  {
    uint64_t v6 = (a3 - 6);
    if (v6 > 0x3C) {
      goto LABEL_27;
    }
    if (((1 << (a3 - 6)) & 0x3C000000) == 0)
    {
      if (((1 << (a3 - 6)) & 0x1400000000000003) == 0)
      {
        if (v6 == 59)
        {
          v7 = @"Setting app re-entry";
          goto LABEL_24;
        }
LABEL_27:
        if (a3 == 5)
        {
          uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"Downloading [%d] block 0x%04X", *a4, __rev16(*(unsigned __int16 *)(a4 + 1)));
          goto LABEL_23;
        }
LABEL_29:
        uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"Unknown command received (%02X)", a3, v9);
        goto LABEL_23;
      }
      goto LABEL_18;
    }
LABEL_22:
    uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"Command: %s", -[iAUPServer commandString:](self, "commandString:", a3, a4, *(void *)&a5), v9);
    goto LABEL_23;
  }
  if ((a3 - 2) < 3 || !a3) {
    goto LABEL_18;
  }
  if (a3 != 1) {
    goto LABEL_29;
  }
  switch(*a4)
  {
    case 0:
      v7 = @"Bootloader initialized";
      break;
    case 1:
      v7 = @"Metadata received";
      break;
    case 2:
      v7 = @"Certificate received";
      break;
    case 3:
      v7 = @"Certificate validated";
      break;
    case 4:
      v7 = @"Hash received";
      break;
    case 5:
      v7 = @"Signature verified";
      break;
    case 6:
      v7 = @"Firmware mass erased";
      break;
    case 7:
      v7 = @"Firmware image installed";
      break;
    case 8:
      v7 = @"Firmware image validated";
      break;
    default:
      JUMPOUT(0);
  }
LABEL_24:
  -[iAUPServer appendToLog:](self, "appendToLog:", v7, a4, *(void *)&a5);
}

- (void)processDataFromAccessory:(id)a3
{
  uint64_t v5 = [a3 bytes];
  if ([a3 length])
  {
    uint64_t v6 = 0;
    do
      [(iAUPServer *)self processInByte:*(unsigned __int8 *)(v5 + v6++)];
    while ([a3 length] > (unint64_t)v6);
  }
}

- (void)processInByte:(unsigned __int8)a3
{
  unsigned int v3 = a3;
  char v13 = a3;
  if (self->_byteEscape)
  {
    if (a3 == 125)
    {
      unsigned int parserState = self->_parserState;
      uint64_t v6 = [(iAUPServer *)self parserStateString:parserState];
      if (parserState < 0xFFFFFFFE)
      {
        NSLog(&cfstr_ParserEscaping.isa, v6);
        self->_escapeInProgress = 1;
        return;
      }
      NSLog(&cfstr_ParserInvalidS.isa, v6);
      goto LABEL_29;
    }
    if (self->_escapeInProgress)
    {
      if (self->_parserState >= 0xFFFFFFFE)
      {
        NSLog(&cfstr_ParserSWhenByt.isa, -[iAUPServer parserStateString:](self, "parserStateString:"), a3);
LABEL_29:
        [(iAUPServer *)self resetParser];
        return;
      }
      NSLog(&cfstr_ParserDeEscape.isa, a3, a3 ^ 0x20u, -[iAUPServer parserStateString:](self, "parserStateString:"));
      char v13 = v3 ^ 0x20;
      self->_escapeInProgress = 0;
      v3 ^= 0x20u;
    }
  }
  switch(self->_parserState)
  {
    case 0xFFFFFFFC:
      self->_telegramChecksum += v3;
      uint64_t v7 = self->_telegramLength | v3;
      self->_telegramLength = v7;
      uint64_t v8 = self;
      goto LABEL_24;
    case 0xFFFFFFFD:
      self->_telegramChecksum = v3;
      self->_telegramLength = v3 << 8;
      uint64_t v8 = self;
      uint64_t v7 = 4294967292;
      goto LABEL_24;
    case 0xFFFFFFFE:
      if (self->_byteEscape) {
        int v9 = 126;
      }
      else {
        int v9 = 92;
      }
      if (v3 == v9)
      {
        uint64_t v8 = self;
        uint64_t v7 = 4294967293;
        goto LABEL_24;
      }
      NSLog(&cfstr_ParserInvalid0.isa, v3, [(iAUPServer *)self parserStateString:4294967294], self->_byteEscape);
      goto LABEL_29;
    case 0xFFFFFFFF:
      if (self->_byteEscape)
      {
        NSLog(&cfstr_ParserSWhenByt_0.isa, [(iAUPServer *)self parserStateString:0xFFFFFFFFLL], v11, v12);
        goto LABEL_29;
      }
      if (v3 != 255)
      {
        NSLog(&cfstr_ParserInvalidB.isa, v3, [(iAUPServer *)self parserStateString:0xFFFFFFFFLL], v12);
        goto LABEL_29;
      }
      uint64_t v8 = self;
      uint64_t v7 = 4294967294;
LABEL_24:
      [(iAUPServer *)v8 setParserState:v7];
      break;
    case 0:
      unsigned __int8 v10 = self->_telegramChecksum + v3;
      self->_telegramChecksum = v10;
      if (v10) {
        NSLog(&cfstr_ParserInvalidC.isa, v3, v11, v12);
      }
      else {
        [(iAUPServer *)self processInTelegram];
      }
      goto LABEL_29;
    default:
      [(NSMutableData *)self->_telegramDataIn appendBytes:&v13 length:1];
      self->_telegramChecksum += v13;
      [(iAUPServer *)self setParserState:[(iAUPServer *)self parserState] - 1];
      return;
  }
}

- (void)processInTelegram
{
  v67[1] = *MEMORY[0x263EF8340];
  unsigned int v3 = [(NSMutableData *)self->_telegramDataIn mutableBytes];
  v4 = (unsigned __int8 *)v3 + 1;
  uint64_t v5 = *(unsigned __int8 *)v3;
  uint64_t v6 = [(NSMutableData *)self->_telegramDataIn length] - 1;
  [(iAUPServer *)self logCommand:v5 payload:(char *)v3 + 1 length:v6];
  if ((int)v5 > 31)
  {
    switch((int)v5)
    {
      case ' ':
        [(iAUPServer *)self processIdentifyCommand:v4 length:v6];
        break;
      case '!':
        [(iAUPServer *)self processRequestDownloadCommand:v4 length:v6];
        break;
      case '""':
        [(iAUPServer *)self processDownloadCompleteCommand:v4 length:v6];
        break;
      case '#':
        [(iAUPServer *)self processNotifyAccessoryErrorCommand:v4 length:v6];
        break;
      default:
        if (v5 == 193)
        {
          if (self->_ackAppReentry)
          {
LABEL_55:
            delegate = self->_delegate;
            [(iAUPServerDelegate *)delegate firmwareUpdateComplete:0 error:0];
          }
        }
        else if (v5 == 194)
        {
          [(iAUPServer *)self processPersonalizationInfo:v4 length:v6];
        }
        break;
    }
    return;
  }
  switch((int)v5)
  {
    case 0:
      unsigned __int8 v48 = *v4;
      if (v48 == 1) {
        unsigned int v7 = bswap32([(FirmwareBundle *)self->_firmwareBundle productIDCode]);
      }
      else {
        unsigned int v7 = 0;
      }
      unsigned int v49 = v7;
      v28 = self;
      uint64_t v29 = 128;
      goto LABEL_78;
    case 1:
      if (*v4 == 136)
      {
        [(iAUPServer *)self appendToLog:@"ProcessAbort_GeneralFailure from accessory. Cleaning up."];
        uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"com.apple.iAUPServer.ErrorDomain" code:-1 userInfo:0];
        v66 = @"Event";
        v67[0] = @"com.apple.fud.updateFailed";
        int v9 = NSDictionary;
        unsigned __int8 v10 = (__CFString **)v67;
        uint64_t v11 = &v66;
        goto LABEL_105;
      }
      [(iAUPServer *)self sendCommand:129 payload:v4 payload_length:1];
      if (*v4 == 8 && self->_iAUPVersion == 1)
      {
        [(iAUPServer *)self sendCommand:65 payload:0 payload_length:0];
        if (!self->_ackAppReentry) {
          goto LABEL_55;
        }
      }
      return;
    case 2:
      unint64_t v12 = *v4;
      if (v12 > 3) {
        return;
      }
      self->objectBlockTransferSizes[v12] = bswap32(v3[1]) >> 16;
      char v13 = self;
      uint64_t v14 = 130;
      v15 = (char *)v3 + 1;
      uint64_t v16 = 3;
      goto LABEL_39;
    case 3:
      unsigned int v17 = bswap32(*(_DWORD *)v4);
      self->_unsigned int firmwareImageBaseTransferAddress = v17;
      if (v17 < [(FirmwareBundle *)self->_firmwareBundle firmwareImageBaseAddress]
        || (unsigned int firmwareImageBaseTransferAddress = self->_firmwareImageBaseTransferAddress,
            unsigned int v19 = firmwareImageBaseTransferAddress
                - [(FirmwareBundle *)self->_firmwareBundle firmwareImageBaseAddress],
            v19 >= [(FirmwareBundle *)self->_firmwareBundle firmwareImageSize]))
      {
        [(iAUPServer *)self appendToLog:@"COMMAND_SetBaseImageTransferAddress: Bound check failed"];
        uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"com.apple.iAUPServer.ErrorDomain" code:-2 userInfo:0];
        v64 = @"Event";
        v65 = @"com.apple.fud.updateFailed";
        int v9 = NSDictionary;
        unsigned __int8 v10 = &v65;
        uint64_t v11 = &v64;
        goto LABEL_105;
      }
      char v13 = self;
      uint64_t v14 = 131;
      v15 = (char *)v3 + 1;
      uint64_t v16 = 4;
LABEL_39:
      [(iAUPServer *)v13 sendCommand:v14 payload:v15 payload_length:v16];
      return;
    case 4:
      int v20 = *v4;
      if (*v4) {
        goto LABEL_22;
      }
      if ([(FirmwareBundle *)self->_firmwareBundle firmwareImage]
        || [(FirmwareBundle *)self->_firmwareBundle firmwareLocalURL])
      {
        goto LABEL_67;
      }
      int v20 = *v4;
LABEL_22:
      if (v20 != 2) {
        goto LABEL_25;
      }
      if ([(FirmwareBundle *)self->_firmwareBundle hash]) {
        goto LABEL_67;
      }
      int v20 = *v4;
LABEL_25:
      if (v20 != 1) {
        goto LABEL_28;
      }
      if (![(FirmwareBundle *)self->_firmwareBundle certificate])
      {
        int v20 = *v4;
LABEL_28:
        if (v20 != 3 || ![(FirmwareBundle *)self->_firmwareBundle signature])
        {
          [(iAUPServer *)self appendToLog:@"COMMAND_GetObjectSize: request for empty object."];
          uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"com.apple.iAUPServer.ErrorDomain" code:-4 userInfo:0];
          v62 = @"Event";
          v63 = @"com.apple.fud.updateFailed";
          int v9 = NSDictionary;
          unsigned __int8 v10 = &v63;
          uint64_t v11 = &v62;
          goto LABEL_105;
        }
      }
LABEL_67:
      switch(*v4)
      {
        case 0u:
          unsigned int v30 = bswap32([(FirmwareBundle *)self->_firmwareBundle firmwareImageSize]);
          break;
        case 1u:
          v33 = [(FirmwareBundle *)self->_firmwareBundle certificate];
          goto LABEL_76;
        case 2u:
          v33 = [(FirmwareBundle *)self->_firmwareBundle hash];
          goto LABEL_76;
        case 3u:
          v33 = [(FirmwareBundle *)self->_firmwareBundle signature];
LABEL_76:
          unsigned int v30 = bswap32([(NSData *)v33 length]);
          break;
        default:
          unsigned int v30 = 0;
          break;
      }
      unsigned __int8 v48 = *v4;
      unsigned int v49 = v30;
      v28 = self;
      uint64_t v29 = 132;
LABEL_78:
      [(iAUPServer *)v28 sendCommand:v29 payload:&v48 payload_length:5];
      return;
    case 5:
      uint64_t v21 = *v4;
      if (v21 > 3) {
        return;
      }
      unsigned int v22 = v3[1];
      LODWORD(v23) = self->objectBlockTransferSizes[v21];
      if (*v4)
      {
        if (v21 == 1)
        {
          if ([(FirmwareBundle *)self->_firmwareBundle certificate])
          {
            NSUInteger v24 = [(NSData *)[(FirmwareBundle *)self->_firmwareBundle certificate] length];
            v25 = [(FirmwareBundle *)self->_firmwareBundle certificate];
            goto LABEL_83;
          }
        }
        else if (v21 == 3)
        {
          if ([(FirmwareBundle *)self->_firmwareBundle signature])
          {
            NSUInteger v24 = [(NSData *)[(FirmwareBundle *)self->_firmwareBundle signature] length];
            v25 = [(FirmwareBundle *)self->_firmwareBundle signature];
            goto LABEL_83;
          }
        }
        else if (v21 == 2 && [(FirmwareBundle *)self->_firmwareBundle hash])
        {
          NSUInteger v24 = [(NSData *)[(FirmwareBundle *)self->_firmwareBundle hash] length];
          v25 = [(FirmwareBundle *)self->_firmwareBundle hash];
LABEL_83:
          uint64_t v32 = [(NSData *)v25 bytes];
          goto LABEL_84;
        }
LABEL_89:
        [(iAUPServer *)self appendToLog:@"COMMAND_GetObjectBlock: request for empty object."];
        uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"com.apple.iAUPServer.ErrorDomain" code:-4 userInfo:0];
        v60 = @"Event";
        v61 = @"com.apple.fud.updateFailed";
        int v9 = NSDictionary;
        unsigned __int8 v10 = &v61;
        uint64_t v11 = &v60;
        goto LABEL_105;
      }
      if (![(FirmwareBundle *)self->_firmwareBundle firmwareImage]
        && ![(FirmwareBundle *)self->_firmwareBundle firmwareLocalURL])
      {
        goto LABEL_89;
      }
      NSUInteger v24 = [(FirmwareBundle *)self->_firmwareBundle firmwareImageSize];
      v31 = [(NSData *)[(FirmwareBundle *)self->_firmwareBundle firmwareImage] bytes]
          + self->_firmwareImageBaseTransferAddress;
      uint64_t v32 = (uint64_t)v31 - [(FirmwareBundle *)self->_firmwareBundle firmwareImageBaseAddress];
LABEL_84:
      if (!v32 && ![(FirmwareBundle *)self->_firmwareBundle firmwareLocalURL] || !v24)
      {
        -[iAUPServer appendToLog:](self, "appendToLog:", [NSString stringWithFormat:@"COMMAND_GetObjectBlock Failed, Invalid object_type (%c) or Image (object_total_size = %u)", v21, v24]);
        uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"com.apple.iAUPServer.ErrorDomain" code:-4 userInfo:0];
        v58 = @"Event";
        v59 = @"com.apple.fud.updateFailed";
        int v9 = NSDictionary;
        unsigned __int8 v10 = &v59;
        uint64_t v11 = &v58;
        goto LABEL_105;
      }
      uint64_t v34 = (bswap32(v22) >> 16) * v23;
      unsigned int v35 = v24 - v34;
      if (v24 < v34)
      {
        [(iAUPServer *)self appendToLog:@"COMMAND_GetObjectBlock: bound check failed: block_offset * block_size > object_total_size"];
        uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"com.apple.iAUPServer.ErrorDomain" code:-2 userInfo:0];
        v56 = @"Event";
        v57 = @"com.apple.fud.updateFailed";
        int v9 = NSDictionary;
        unsigned __int8 v10 = &v57;
        uint64_t v11 = &v56;
LABEL_105:
        -[iAUPServerDelegate firmwareUpdateComplete:error:](self->_delegate, "firmwareUpdateComplete:error:", [v9 dictionaryWithObjects:v10 forKeys:v11 count:1], v8);

        return;
      }
      if (v35 >= v23) {
        size_t v23 = v23;
      }
      else {
        size_t v23 = v35;
      }
      v36 = malloc_type_malloc((v23 + 3), 0x475BFE6EuLL);
      if (!v36)
      {
        [(iAUPServer *)self appendToLog:@"COMMAND_GetObjectBlock: malloc failed."];
        uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"com.apple.iAUPServer.ErrorDomain" code:-3 userInfo:0];
        v54 = @"Event";
        v55 = @"com.apple.fud.updateFailed";
        int v9 = NSDictionary;
        unsigned __int8 v10 = &v55;
        uint64_t v11 = &v54;
        goto LABEL_105;
      }
      v37 = v36;
      if (v21 || ![(FirmwareBundle *)self->_firmwareBundle firmwareLocalURL])
      {
        __int16 v38 = *(_WORD *)v4;
        v39 = (const void *)(v32 + v34);
        v37[2] = v4[2];
        *(_WORD *)v37 = v38;
        v40 = v37 + 3;
        size_t v41 = v23;
      }
      else
      {
        id v43 = -[FirmwareBundle getFirmwareDataInRange:error:](self->_firmwareBundle, "getFirmwareDataInRange:error:", v34, v23, 0);
        if (!v43)
        {
          [(iAUPServer *)self appendToLog:@"COMMAND_GetObjectBlock: Failed to read firmware data from file"];
          v47 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"com.apple.iAUPServer.ErrorDomain" code:-4 userInfo:0];
          v52 = @"Event";
          v53 = @"com.apple.fud.updateFailed";
          -[iAUPServerDelegate firmwareUpdateComplete:error:](self->_delegate, "firmwareUpdateComplete:error:", [NSDictionary dictionaryWithObjects:&v53 forKeys:&v52 count:1], v47);

          free(v37);
          return;
        }
        v44 = v43;
        __int16 v45 = *(_WORD *)v4;
        v37[2] = v4[2];
        *(_WORD *)v37 = v45;
        uint64_t v46 = [v43 bytes];
        size_t v41 = [v44 length];
        v40 = v37 + 3;
        v39 = (const void *)v46;
      }
      memcpy(v40, v39, v41);
      [(iAUPServer *)self sendCommand:133 payload:v37 payload_length:(unsigned __int16)(v23 + 3)];
      free(v37);
      self->_totalBytesDownloadedInCurrentSession += v23;
      if ((self->_accessoryCapabilities & 1) == 0 && !self->_startEventSent)
      {
        v51[0] = @"com.apple.fud.updateStarted";
        v50[0] = @"Event";
        v50[1] = @"resumeCount";
        v51[1] = [NSNumber numberWithUnsignedInt:0];
        v50[2] = @"cumulativeUpdateTime";
        v51[2] = [NSNumber numberWithUnsignedInt:0];
        v50[3] = @"cumulativeCloakTime";
        v51[3] = [NSNumber numberWithUnsignedInt:0];
        v50[4] = @"totalBytesForCompleteUpdate";
        v51[4] = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[FirmwareBundle firmwareImageSize](self->_firmwareBundle, "firmwareImageSize"));
        v50[5] = @"totalBytesDownloadedSoFar";
        v51[5] = [NSNumber numberWithUnsignedInt:0];
        -[iAUPServerDelegate handleFirmwareUpdateStatus:](self->_delegate, "handleFirmwareUpdateStatus:", [NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:6]);
        self->_startEventSent = 1;
      }
      if (!v21)
      {
        v42 = self->_delegate;
        if (v42) {
          [(iAUPServerDelegate *)v42 updateProgress:(double)(v23 + v34) / (double)v24 * 100.0];
        }
      }
      return;
    case 6:
      uint64_t v26 = *(unsigned __int16 *)v4;
      self->_accessoryCapabilities = v26;
      NSLog(&cfstr_Accessorycapab.isa, v26);
      char v13 = self;
      uint64_t v14 = 134;
      v15 = 0;
      uint64_t v16 = 0;
      goto LABEL_39;
    case 7:
      [(iAUPServer *)self setResumeInfo:v4 length:v6];
      return;
    default:
      return;
  }
}

- (unsigned)appendByteWithEscaping:(unsigned __int8)a3 toObject:(id *)a4
{
  unsigned __int8 v8 = a3;
  if ((a3 - 125) > 1 || !self->_byteEscape)
  {
    [*a4 appendBytes:&v8 length:1];
    return v8;
  }
  else
  {
    unsigned __int8 v5 = a3;
    v7[0] = 125;
    v7[1] = a3 ^ 0x20;
    [*a4 appendBytes:v7 length:2];
  }
  return v5;
}

- (id)sendCommand:(unsigned __int8)a3 payload:(char *)a4 payload_length:(unsigned __int16)a5
{
  LODWORD(v5) = a5;
  uint64_t v7 = a3;
  -[iAUPServer logCommand:payload:length:](self, "logCommand:payload:length:");
  int v9 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithCapacity:(v5 + 4)];
  unsigned __int8 v10 = v9;
  id v18 = v9;
  if (self->_byteEscape)
  {
    char v11 = 126;
  }
  else
  {
    char v19 = -1;
    [v9 appendBytes:&v19 length:1];
    char v11 = 92;
  }
  char v19 = v11;
  objc_msgSend(v10, "appendBytes:length:", &v19, 1, v18);
  int v12 = [(iAUPServer *)self appendByteWithEscaping:((unsigned __int16)(v5 + 1) >> 8) toObject:&v18];
  int v13 = [(iAUPServer *)self appendByteWithEscaping:(v5 + 1) toObject:&v18]+ v12;
  int v14 = v13 + [(iAUPServer *)self appendByteWithEscaping:v7 toObject:&v18];
  if (v5)
  {
    uint64_t v5 = v5;
    do
    {
      unsigned int v15 = *a4++;
      v14 += [(iAUPServer *)self appendByteWithEscaping:v15 toObject:&v18];
      --v5;
    }
    while (v5);
  }
  [(iAUPServer *)self appendByteWithEscaping:-(char)v14 toObject:&v18];
  uint64_t v16 = (void *)[(iAUPServerDelegate *)self->_delegate writeData:v18];

  return v16;
}

- (void)setBootloaderEntry
{
}

- (id)processManifestProperties:(char *)a3 length:(unsigned int)a4
{
  v29[9] = *MEMORY[0x263EF8340];
  uint64_t serverState = self->_serverState;
  if (serverState != 7)
  {
    NSLog(&cfstr_Processmanifes.isa, -[iAUPServer serverStateString:](self, "serverStateString:", serverState, *(void *)&a4));
    return 0;
  }
  if (a4 - 1 <= 3)
  {
    NSLog(&cfstr_SInvalidPayloa.isa, "-[iAUPServer processManifestProperties:length:]", a4);
    return 0;
  }
  unsigned int v7 = bswap32(*(_DWORD *)(a3 + 1));
  int v8 = [(iAUPServerDelegate *)self->_delegate getWhitelistedPersonalizationFields];
  __int16 v9 = v7 & v8;
  if ((~(v7 & v8) & 0x5F) != 0)
  {
    NSLog(&cfstr_SInvalidPerson.isa, "-[iAUPServer processManifestProperties:length:]", v7 & v8);
    return 0;
  }
  if (a4 - 5 <= 3)
  {
    NSLog(&cfstr_SBoardidNotPre.isa, "-[iAUPServer processManifestProperties:length:]", a4 - 5);
    return 0;
  }
  uint64_t v10 = bswap32(*(_DWORD *)(a3 + 5));
  if (!v10)
  {
    NSLog(&cfstr_SInvalidBoardi.isa, "-[iAUPServer processManifestProperties:length:]", 0);
    return 0;
  }
  if (a4 - 9 <= 3)
  {
    NSLog(&cfstr_SChipidNotPres.isa, "-[iAUPServer processManifestProperties:length:]", a4 - 9);
    return 0;
  }
  uint64_t v11 = bswap32(*(_DWORD *)(a3 + 9));
  if (!v11)
  {
    NSLog(&cfstr_SInvalidChipid.isa, "-[iAUPServer processManifestProperties:length:]", 0);
    return 0;
  }
  if (a4 - 13 <= 7)
  {
    NSLog(&cfstr_SEcidNotPresen.isa, "-[iAUPServer processManifestProperties:length:]", a4 - 13);
    return 0;
  }
  unint64_t v12 = bswap64(*(void *)(a3 + 13));
  if (!v12)
  {
    NSLog(&cfstr_SInvalidEcidLl.isa, "-[iAUPServer processManifestProperties:length:]", 0);
    return 0;
  }
  if (a4 == 21)
  {
    NSLog(&cfstr_SSecuritydomai.isa, "-[iAUPServer processManifestProperties:length:]", 0);
    return 0;
  }
  if (a4 == 22)
  {
    NSLog(&cfstr_SProductionmod.isa, "-[iAUPServer processManifestProperties:length:]", 0);
    return 0;
  }
  uint64_t v13 = a3[21];
  int v14 = a3[22];
  if ((v9 & 0x20) != 0)
  {
    if (a4 == 23)
    {
LABEL_46:
      NSLog(&cfstr_SSecuritymodeN.isa, "-[iAUPServer processManifestProperties:length:]", 0);
      return 0;
    }
    BOOL v15 = a3[23] != 0;
    unsigned int v16 = 24;
  }
  else
  {
    BOOL v15 = 0;
    unsigned int v16 = 23;
  }
  if (a4 - v16 <= 0x1F)
  {
    NSLog(&cfstr_SNonceNotPrese.isa, "-[iAUPServer processManifestProperties:length:]", a4 - v16);
    return 0;
  }
  BOOL v27 = v15;
  uint64_t v17 = [MEMORY[0x263EFF8F8] dataWithBytes:&a3[v16] length:32];
  if (!v17)
  {
    NSLog(&cfstr_SInvalidNonceF.isa, "-[iAUPServer processManifestProperties:length:]");
    return 0;
  }
  uint64_t v18 = v17;
  uint64_t v19 = v16 | 0x20;
  if ((v9 & 0x80) != 0)
  {
    if (v19 == a4)
    {
      NSLog(&cfstr_SChipepochNotP.isa, "-[iAUPServer processManifestProperties:length:]", 0);
      return 0;
    }
    uint64_t v22 = a3[v19];
    LODWORD(v19) = v16 + 33;
    uint64_t v20 = v22;
    if ((v9 & 0x100) == 0) {
      goto LABEL_20;
    }
    goto LABEL_23;
  }
  uint64_t v20 = 0;
  if ((v9 & 0x100) != 0)
  {
LABEL_23:
    if (v19 != a4)
    {
      BOOL v21 = a3[v19] != 0;
      goto LABEL_25;
    }
    goto LABEL_46;
  }
LABEL_20:
  BOOL v21 = 0;
LABEL_25:
  v28[0] = @"BoardID";
  v29[0] = [NSNumber numberWithUnsignedInt:v10];
  v28[1] = @"ChipID";
  v29[1] = [NSNumber numberWithUnsignedInt:v11];
  v28[2] = @"ECID";
  v29[2] = [NSNumber numberWithUnsignedLong:v12];
  v28[3] = @"securityDomain";
  v29[3] = [NSNumber numberWithUnsignedInt:v13];
  v28[4] = @"productionMode";
  v29[4] = [NSNumber numberWithBool:v14 != 0];
  v28[5] = @"securityMode";
  if ((v9 & 0x20) != 0) {
    uint64_t v23 = [NSNumber numberWithBool:v27];
  }
  else {
    uint64_t v23 = [MEMORY[0x263EFF9D0] null];
  }
  v29[5] = v23;
  v29[6] = v18;
  v28[6] = @"nonceHash";
  v28[7] = @"chipEpoch";
  if ((v9 & 0x80) != 0) {
    uint64_t v24 = [NSNumber numberWithUnsignedInt:v20];
  }
  else {
    uint64_t v24 = [MEMORY[0x263EFF9D0] null];
  }
  v29[7] = v24;
  v28[8] = @"enableMixMatch";
  v29[8] = [NSNumber numberWithBool:v21];
  v25 = (void *)[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:9];
  NSLog(&cfstr_ManifestInfodi.isa, v25);
  return v25;
}

- (void)processPersonalizationInfo:(char *)a3 length:(unsigned int)a4
{
  if (a3 && a4)
  {
    if ((*a3 & 0xF) == 1)
    {
      id v5 = -[iAUPServer processManifestProperties:length:](self, "processManifestProperties:length:");
      goto LABEL_7;
    }
    NSLog(&cfstr_Processpersona_0.isa, a2, *a3);
  }
  else
  {
    NSLog(&cfstr_Processpersona.isa, a2, a4);
  }
  id v5 = 0;
LABEL_7:
  delegate = self->_delegate;
  [(iAUPServerDelegate *)delegate processPersonalizationInfoFromAccessory:v5];
}

- (BOOL)personalizationComplete
{
  if (!self->_firmwareBundle)
  {
    NSLog(&cfstr_Personalizatio.isa, a2);
    goto LABEL_12;
  }
  if (self->_currentAsset != 1)
  {
    NSLog(&cfstr_Personalizatio_0.isa, a2);
    goto LABEL_12;
  }
  if ([(iAUPServerDelegate *)self->_delegate getPersonalizationID] >= 0x10)
  {
    unsigned __int8 currentAsset = [(iAUPServerDelegate *)self->_delegate getPersonalizationID];
    NSLog(&cfstr_Requestdownloa.isa);
    BOOL v4 = 1;
    if (![(iAUPServer *)self sendCommand:66 payload:&currentAsset payload_length:1])return v4; {
    NSLog(&cfstr_Personalizatio_1.isa, v5);
    }
LABEL_12:
    unsigned __int8 currentAsset = -1;
    [(iAUPServer *)self sendCommand:99 payload:&currentAsset payload_length:1];
    return 0;
  }
  unsigned __int8 currentAsset = self->_currentAsset;
  if ([(iAUPServer *)self sendCommand:97 payload:&currentAsset payload_length:1])
  {
    NSLog(&cfstr_Personalizatio_2.isa, v3);
    goto LABEL_12;
  }
  [(iAUPServer *)self setServerState:6];
  return 1;
}

- (void)setResumeInfo:(char *)a3 length:(unsigned int)a4
{
  v25[5] = *MEMORY[0x263EF8340];
  if (self->_accessoryCapabilities)
  {
    if (self->_startEventSent)
    {
      NSLog(&cfstr_SetresumeinfoI.isa, a2, a3, *(void *)&a4);
    }
    else if (a4 == 18)
    {
      unsigned int v6 = *(unsigned __int16 *)a3;
      unsigned int v7 = *(_DWORD *)(a3 + 2);
      unsigned int v8 = *(_DWORD *)(a3 + 6);
      uint64_t v9 = bswap32(*(_DWORD *)(a3 + 10));
      if (v9 > [(FirmwareBundle *)self->_firmwareBundle firmwareImageSize])
      {
        uint64_t v23 = [(FirmwareBundle *)self->_firmwareBundle firmwareImageSize];
        NSLog(&cfstr_SetresumeinfoI_1.isa, v20, v21, v22, v9, v23);
      }
      else
      {
        uint64_t v13 = bswap32(*(_DWORD *)(a3 + 14));
        if (v13 >= v9)
        {
          NSLog(&cfstr_SetresumeinfoI_2.isa, v10, v11, v12, v13, v9);
        }
        else
        {
          uint64_t v14 = __rev16(v6);
          uint64_t v15 = bswap32(v8);
          unsigned int v16 = (void *)MEMORY[0x263EFF9A0];
          v24[0] = @"resumeCount";
          v25[0] = [NSNumber numberWithUnsignedInt:v14];
          v24[1] = @"cumulativeUpdateTime";
          v25[1] = [NSNumber numberWithUnsignedInt:bswap32(v7)];
          v24[2] = @"cumulativeCloakTime";
          v25[2] = [NSNumber numberWithUnsignedInt:v15];
          v24[3] = @"totalBytesForCompleteUpdate";
          v25[3] = [NSNumber numberWithUnsignedInt:v9];
          v24[4] = @"totalBytesDownloadedSoFar";
          v25[4] = [NSNumber numberWithUnsignedInt:v13];
          uint64_t v17 = objc_msgSend(v16, "dictionaryWithDictionary:", objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v25, v24, 5));
          uint64_t v18 = v17;
          if (v14) {
            uint64_t v19 = @"com.apple.fud.updateResumed";
          }
          else {
            uint64_t v19 = @"com.apple.fud.updateStarted";
          }
          [v17 setObject:v19 forKey:@"Event"];
          [(iAUPServerDelegate *)self->_delegate handleFirmwareUpdateStatus:v18];
          self->_startEventSent = 1;
          [(iAUPServer *)self sendCommand:135 payload:0 payload_length:0];
        }
      }
    }
    else
    {
      NSLog(&cfstr_SetresumeinfoI_0.isa, a2, a3, *(void *)&a4, a4);
    }
  }
  else
  {
    NSLog(&cfstr_SetresumeinfoA.isa, a2, a3, *(void *)&a4);
  }
}

- (void)processIdentifyCommand:(char *)a3 length:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  v10[1] = *MEMORY[0x263EF8340];
  unsigned int v7 = "valid";
  if (!a3) {
    unsigned int v7 = "nil";
  }
  NSLog(&cfstr_SPayloadSLengt.isa, a2, "-[iAUPServer processIdentifyCommand:length:]", v7, a4);
  if (self->_serverState != 1)
  {
    NSLog(&cfstr_IdentifyInvali.isa, -[iAUPServer serverStateString:](self, "serverStateString:"));
LABEL_12:
    [(iAUPServer *)self setIAUPVersion:2];
    [(iAUPServer *)self setServerState:0];
    unsigned int v8 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"com.apple.iAUPServer.ErrorDomain" code:-1 userInfo:0];
    uint64_t v9 = @"Event";
    v10[0] = @"com.apple.fud.updateFailed";
    -[iAUPServerDelegate firmwareUpdateComplete:error:](self->_delegate, "firmwareUpdateComplete:error:", [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1], v8);

    return;
  }
  if (v4 != 1)
  {
    NSLog(&cfstr_IdentifyInvali_0.isa, v4);
    goto LABEL_12;
  }
  if (*a3 != 2)
  {
    NSLog(&cfstr_IdentifyInvali_1.isa, *a3);
    goto LABEL_12;
  }
  [(iAUPServer *)self setIAUPVersion:2];
  [(iAUPServer *)self setServerState:2];
  [(iAUPServer *)self sendCommand:96 payload:0 payload_length:0];
  [(iAUPServer *)self setServerState:3];
}

- (void)processRequestDownloadCommand:(char *)a3 length:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  unsigned int v7 = "valid";
  if (!a3) {
    unsigned int v7 = "nil";
  }
  NSLog(&cfstr_SPayloadSLengt.isa, a2, "-[iAUPServer processRequestDownloadCommand:length:]", v7, a4);
  if (!v4)
  {
    NSLog(&cfstr_Requestdownloa_0.isa, 0);
    return;
  }
  if (*a3 >= 2u)
  {
    NSLog(&cfstr_Requestdownloa_1.isa, *a3);
    return;
  }
  if (self->_serverState != 3)
  {
    NSLog(&cfstr_Requestdownloa_2.isa, -[iAUPServer serverStateString:](self, "serverStateString:"));
    goto LABEL_27;
  }
  [(iAUPServer *)self setServerState:4];
  if (*a3 != 1)
  {
    if (!*a3)
    {
      if (v4 <= 5)
      {
        NSLog(&cfstr_Requestdownloa_3.isa, v4);
      }
      else
      {
        uint64_t serverState = self->_serverState;
        uint64_t v9 = a3[1];
        uint64_t v10 = a3[2];
        uint64_t v11 = a3[3];
        uint64_t v12 = a3[4];
        uint64_t v13 = a3[5];
        uint64_t v14 = objc_alloc_init(HSModel);
        self->_hsModel = v14;
        if (v14)
        {
          [(HSModel *)v14 setDelegate:self];
          [(iAUPServer *)self setServerState:5];
          [(iAUPServer *)self setCurrentAsset:0];
          if ([(HSModel *)self->_hsModel getHSModelForEngineMajorVersion:v10 | (v9 << 8) minorVersion:v12 | (v11 << 8) numHSModels:v13 modelBuffer:a3 + 6 length:(v4 - 6)])
          {
            return;
          }
          NSLog(&cfstr_Requestdownloa_4.isa);
          [(iAUPServer *)self setServerState:serverState];
        }
        else
        {
          NSLog(&cfstr_Requestdownloa_4.isa, v18);
        }
      }
    }
    goto LABEL_27;
  }
  if ([(iAUPServer *)self iAUPVersion] <= 1)
  {
    NSLog(&cfstr_Requestdownloa_5.isa, v18);
    goto LABEL_27;
  }
  if ([(iAUPServer *)self iAUPVersion] != 2)
  {
LABEL_27:
    unsigned int v16 = 0;
    uint64_t v17 = 0;
    goto LABEL_28;
  }
  if ([(iAUPServerDelegate *)self->_delegate updateRequiresPersonalization])
  {
    char v19 = [(iAUPServerDelegate *)self->_delegate getPersonalizationID];
    NSLog(&cfstr_Requestdownloa.isa);
    if (![(iAUPServer *)self sendCommand:66 payload:&v19 payload_length:1])
    {
      uint64_t v15 = 7;
LABEL_19:
      [(iAUPServer *)self setServerState:v15];
      [(iAUPServer *)self setCurrentAsset:1];
      return;
    }
    unsigned int v16 = @"Failed to send Personalization Request";
    uint64_t v17 = 4294967291;
  }
  else
  {
    char v19 = 1;
    if (![(iAUPServer *)self sendCommand:97 payload:&v19 payload_length:1])
    {
      uint64_t v15 = 6;
      goto LABEL_19;
    }
    NSLog(&cfstr_Requestdownloa_6.isa);
    uint64_t v17 = 0;
    unsigned int v16 = 0;
  }
LABEL_28:
  [(iAUPServer *)self setCurrentAsset:4];
  if (*a3 == 1)
  {
    v20[0] = -1;
    [(iAUPServer *)self sendCommand:99 payload:v20 payload_length:1];
    [(iAUPServerDelegate *)self->_delegate handleSessionError:v17 message:v16];
  }
  else if (!*a3)
  {
    [(iAUPServer *)self setServerState:3];
    v20[0] = *a3;
    v20[1] = 0;
    [(iAUPServer *)self sendCommand:97 payload:v20 payload_length:2];

    self->_hsModel = 0;
  }
}

- (void)processDownloadCompleteCommand:(char *)a3 length:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  v16[1] = *MEMORY[0x263EF8340];
  unsigned int v7 = "valid";
  if (!a3) {
    unsigned int v7 = "nil";
  }
  NSLog(&cfstr_SPayloadSLengt.isa, a2, "-[iAUPServer processDownloadCompleteCommand:length:]", v7, a4);
  int serverState = self->_serverState;
  if (serverState != 3 && serverState != 6)
  {
    NSLog(&cfstr_Downloadcomple.isa, -[iAUPServer serverStateString:](self, "serverStateString:"));
LABEL_11:
    [(iAUPServer *)self setServerState:0];
    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"com.apple.iAUPServer.ErrorDomain" code:-1 userInfo:0];
    uint64_t v13 = @"Event";
    uint64_t v14 = @"com.apple.fud.updateFailed";
    -[iAUPServerDelegate firmwareUpdateComplete:error:](self->_delegate, "firmwareUpdateComplete:error:", [NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1], v12);

    return;
  }
  if (v4 != 2)
  {
    NSLog(&cfstr_Downloadcomple_0.isa, v4);
    goto LABEL_11;
  }
  unsigned __int8 v10 = a3[1];
  self->_restartRequired |= v10 >> 7;
  self->_sleepWakeRequired |= (a3[1] & 0x40) != 0;
  uint64_t v11 = (a3[1] >> 5) & 1 | self->_urgentUpdate;
  self->_urgentUpdate |= (a3[1] & 0x20) != 0;
  NSLog(&cfstr_Downloadcomple_1.isa, *a3, v10 & 1, v11);
  if (v10)
  {
    [(iAUPServer *)self setServerState:0];
    uint64_t v15 = @"Event";
    v16[0] = @"com.apple.fud.updateCompleted";
    -[iAUPServerDelegate firmwareUpdateComplete:error:](self->_delegate, "firmwareUpdateComplete:error:", [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1], 0);
  }
  else
  {
    [(iAUPServer *)self setServerState:3];
    [(iAUPServer *)self sendCommand:98 payload:0 payload_length:0];
  }
  self->_unsigned __int8 currentAsset = 4;

  self->_firmwareBundle = 0;
}

- (void)processNotifyAccessoryErrorCommand:(char *)a3 length:(unsigned int)a4
{
  v9[1] = *MEMORY[0x263EF8340];
  unsigned int v6 = "valid";
  if (!a3) {
    unsigned int v6 = "nil";
  }
  NSLog(&cfstr_SPayloadSLengt.isa, a2, "-[iAUPServer processNotifyAccessoryErrorCommand:length:]", v6, a4);
  NSLog(&cfstr_Notifyaccessor.isa, *a3);
  [(iAUPServer *)self setServerState:0];
  unsigned int v7 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"com.apple.iAUPServer.ErrorDomain" code:-1 userInfo:0];
  unsigned int v8 = @"Event";
  v9[0] = @"com.apple.fud.updateFailed";
  -[iAUPServerDelegate firmwareUpdateComplete:error:](self->_delegate, "firmwareUpdateComplete:error:", [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1], v7);

  self->_firmwareBundle = 0;
}

- (void)accessoryDisconnected
{
  NSLog(&cfstr_S_0.isa, a2, "-[iAUPServer accessoryDisconnected]");
  hsModel = self->_hsModel;
  if (hsModel)
  {
    [(HSModel *)hsModel setDelegate:0];

    self->_hsModel = 0;
  }
}

- (void)setHSModel:(id)a3 fallbackModel:(id)a4 error:(id)a5
{
  dispatchQ = self->_dispatchQ;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __45__iAUPServer_setHSModel_fallbackModel_error___block_invoke;
  v6[3] = &unk_264E10AD8;
  v6[4] = a3;
  v6[5] = a4;
  v6[6] = a5;
  v6[7] = self;
  dispatch_async(dispatchQ, v6);
}

- (char)commandString:(int)a3
{
  if (a3 <= 65)
  {
    switch(a3)
    {
      case 0:
        result = "COMMAND_GetMetadata";
        break;
      case 1:
        result = "COMMAND_NotifyProcessStatus";
        break;
      case 2:
        result = "COMMAND_SetBlockTransferSize";
        break;
      case 3:
        result = "COMMAND_SetBaseImageTransferAddress";
        break;
      case 4:
        result = "COMMAND_GetObjectSize";
        break;
      case 5:
        result = "COMMAND_GetObjectBlock";
        break;
      case 6:
        result = "COMMAND_SetAccessoryCapabilities";
        break;
      case 7:
        result = "COMMAND_SetResumeInfo";
        break;
      default:
        result = "COMMAND_iAUPv2_Identify";
        switch(a3)
        {
          case ' ':
            return result;
          case '!':
            result = "COMMAND_iAUPv2_RequestDownload";
            break;
          case '""':
            result = "COMMAND_iAUPv2_DownloadComplete";
            break;
          case '#':
            result = "COMMAND_iAUPv2_NotifyAccessoryError";
            break;
          default:
LABEL_31:
            result = "unknown";
            break;
        }
        break;
    }
  }
  else
  {
    switch(a3)
    {
      case 128:
        result = "COMMAND_RetMetadata";
        break;
      case 129:
        result = "COMMAND_AckNotifyProcessStatus";
        break;
      case 130:
        result = "COMMAND_AckSetBlockTransferSize";
        break;
      case 131:
        result = "COMMAND_AckSetBaseImageTransferAddress";
        break;
      case 132:
        result = "COMMAND_RetObjectSize";
        break;
      case 133:
        result = "COMMAND_RetObjectBlock";
        break;
      case 134:
        result = "COMMAND_AckAccessoryCapabilities";
        break;
      case 135:
        result = "COMMAND_AckResumeInfo";
        break;
      default:
        switch(a3)
        {
            result = "COMMAND_iAUPv2_AckIdentify";
            break;
          case 'a':
            result = "COMMAND_iAUPv2_AckRequestDownload";
            break;
          case 'b':
            result = "COMMAND_iAUPv2_AckDownloadComplete";
            break;
          case 'c':
            result = "COMMAND_iAUPv2_NotifyDeviceError";
            break;
          default:
            if (a3 != 66) {
              goto LABEL_31;
            }
            result = "COMMAND_GetPersonalizationInfo";
            break;
        }
        break;
    }
  }
  return result;
}

- (char)assetTypeString:(int)a3
{
  if (a3 > 2) {
    return "unknown";
  }
  else {
    return off_264E10AF8[a3];
  }
}

- (char)serverStateString:(int)a3
{
  if (a3 > 7) {
    return "Unknown";
  }
  else {
    return off_264E10B10[a3];
  }
}

- (char)parserStateString:(int)a3
{
  if (a3 != 0 && a3 < 0xFFFFFFFC) {
    return "PayloadCountdown";
  }
  else {
    return off_264E10B50[a3 + 4];
  }
}

- (iAUPServerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (iAUPServerDelegate *)a3;
}

- (FirmwareBundle)firmwareBundle
{
  return self->_firmwareBundle;
}

- (BOOL)byteEscape
{
  return self->_byteEscape;
}

- (void)setByteEscape:(BOOL)a3
{
  self->_byteEscape = a3;
}

- (int)serverState
{
  return self->_serverState;
}

- (int)parserState
{
  return self->_parserState;
}

- (BOOL)restartRequired
{
  return self->_restartRequired;
}

- (BOOL)sleepWakeRequired
{
  return self->_sleepWakeRequired;
}

- (BOOL)urgentUpdate
{
  return self->_urgentUpdate;
}

- (BOOL)ackAppReentry
{
  return self->_ackAppReentry;
}

- (void)setAckAppReentry:(BOOL)a3
{
  self->_ackAppReentry = a3;
}

- (OS_dispatch_queue)dispatchQ
{
  return self->_dispatchQ;
}

- (void)setDispatchQ:(id)a3
{
}

- (unsigned)iAUPVersion
{
  return self->_iAUPVersion;
}

- (void)setIAUPVersion:(unsigned __int8)a3
{
  self->_iAUPVersion = a3;
}

- (unsigned)currentAsset
{
  return self->_currentAsset;
}

- (void)setCurrentAsset:(unsigned __int8)a3
{
  self->_unsigned __int8 currentAsset = a3;
}

@end