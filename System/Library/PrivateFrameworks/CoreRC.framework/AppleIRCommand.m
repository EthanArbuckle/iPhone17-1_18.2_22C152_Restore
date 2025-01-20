@interface AppleIRCommand
+ (BOOL)matchNECVendorID:(unsigned __int16)a3;
- (AppleIRCommand)initWithPayload:(unint64_t)a3 repeat:(BOOL)a4;
- (BOOL)getVendorSpecificHIDUsagePage:(unsigned int *)a3 usageID:(unsigned int *)a4 ignoreRepeats:(BOOL *)a5;
- (BOOL)isA39PlayPauseSelect;
- (BOOL)isB39Command;
- (BOOL)isB39PlayPauseOrSelect;
- (BOOL)isBTLEDiscoveryModeRequest;
- (BOOL)isPairingRequest;
- (BOOL)isStackshotRequest;
- (BOOL)isUnpairingRequest;
- (id)description;
- (unint64_t)command;
- (unsigned)commandID;
- (unsigned)commandPage;
- (unsigned)deviceUID;
- (unsigned)token;
- (unsigned)vendorID;
@end

@implementation AppleIRCommand

+ (BOOL)matchNECVendorID:(unsigned __int16)a3
{
  return (a3 & 0xFFE0) == 34784;
}

- (unsigned)vendorID
{
  return [(IRCommand *)self payload] >> 21;
}

- (unsigned)commandPage
{
  return ([(IRCommand *)self payload] >> 16) & 0x1F;
}

- (unsigned)deviceUID
{
  return (unsigned __int16)[(IRCommand *)self payload] >> 8;
}

- (unsigned)commandID
{
  return [(IRCommand *)self payload] >> 1;
}

- (unsigned)token
{
  __int16 v3 = [(AppleIRCommand *)self commandPage];
  return [(AppleIRCommand *)self commandID] | (v3 << 8);
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)AppleIRCommand;
  __int16 v3 = objc_msgSend(objc_alloc(MEMORY[0x263F089D8]), "initWithString:", -[IRCommand description](&v7, sel_description));
  objc_msgSend(v3, "appendFormat:", @" UID: %x;", -[AppleIRCommand deviceUID](self, "deviceUID"));
  objc_msgSend(v3, "appendFormat:", @" Page: %x;", -[AppleIRCommand commandPage](self, "commandPage"));
  objc_msgSend(v3, "appendFormat:", @" Command: %x;", -[AppleIRCommand commandID](self, "commandID"));
  [(IRCommand *)self payload];
  int v4 = Parity32();
  v5 = "Bad";
  if (v4 == 1) {
    v5 = "Good";
  }
  objc_msgSend(v3, "appendFormat:", @" Parity: %s;", v5);
  return v3;
}

- (AppleIRCommand)initWithPayload:(unint64_t)a3 repeat:(BOOL)a4
{
  BOOL v4 = a4;
  objc_super v7 = +[IRProtocol protocolWithID:1 options:0];
  return [(IRCommand *)self initWithProtocol:v7 payload:a3 repeat:v4];
}

- (BOOL)isA39PlayPauseSelect
{
  return [(AppleIRCommand *)self token] == 3586;
}

- (BOOL)isB39PlayPauseOrSelect
{
  return ([(AppleIRCommand *)self token] & 0xFFFE) == 3630;
}

- (BOOL)isB39Command
{
  int v2 = [(AppleIRCommand *)self token];
  return (v2 - 3630) <= 7 && ((1 << (v2 - 46)) & 0xF3) != 0 || v2 == 7;
}

- (BOOL)isPairingRequest
{
  return [(AppleIRCommand *)self token] == 1;
}

- (BOOL)isUnpairingRequest
{
  return [(AppleIRCommand *)self token] == 2;
}

- (BOOL)isStackshotRequest
{
  int v2 = [(AppleIRCommand *)self token];
  return v2 == 3635 || v2 == 3592;
}

- (BOOL)isBTLEDiscoveryModeRequest
{
  return [(AppleIRCommand *)self token] == 263;
}

- (unint64_t)command
{
  int v2 = [(AppleIRCommand *)self token];
  unint64_t v3 = 0;
  if (v2 <= 3584)
  {
    switch(v2)
    {
      case 1281:
        goto LABEL_21;
      case 1282:
        goto LABEL_24;
      case 1283:
        goto LABEL_18;
      case 1284:
        goto LABEL_15;
      case 1285:
        goto LABEL_27;
      case 1288:
        if (gLogCategory_CoreRCDevice > 40) {
          return 43;
        }
        if (gLogCategory_CoreRCDevice != -1)
        {
          unint64_t v3 = 43;
          goto LABEL_95;
        }
        unint64_t v3 = 43;
        if (_LogCategory_Initialize()) {
          goto LABEL_95;
        }
        return v3;
      case 1289:
        if (gLogCategory_CoreRCDevice > 40) {
          return 44;
        }
        if (gLogCategory_CoreRCDevice != -1)
        {
          unint64_t v3 = 44;
          goto LABEL_95;
        }
        unint64_t v3 = 44;
        if (_LogCategory_Initialize()) {
          goto LABEL_95;
        }
        return v3;
      case 1291:
        if (gLogCategory_CoreRCDevice > 40) {
          return 67;
        }
        if (gLogCategory_CoreRCDevice != -1)
        {
          unint64_t v3 = 67;
          goto LABEL_95;
        }
        unint64_t v3 = 67;
        if (_LogCategory_Initialize()) {
          goto LABEL_95;
        }
        return v3;
      case 1293:
        if (gLogCategory_CoreRCDevice > 40) {
          return 49;
        }
        if (gLogCategory_CoreRCDevice != -1)
        {
          unint64_t v3 = 49;
          goto LABEL_95;
        }
        unint64_t v3 = 49;
        if (_LogCategory_Initialize()) {
          goto LABEL_95;
        }
        return v3;
      case 1294:
        if (gLogCategory_CoreRCDevice > 40) {
          return 48;
        }
        if (gLogCategory_CoreRCDevice != -1)
        {
          unint64_t v3 = 48;
          goto LABEL_95;
        }
        unint64_t v3 = 48;
        if (_LogCategory_Initialize()) {
          goto LABEL_95;
        }
        return v3;
      case 1297:
        if (gLogCategory_CoreRCDevice > 40) {
          return 83;
        }
        if (gLogCategory_CoreRCDevice != -1)
        {
          unint64_t v3 = 83;
          goto LABEL_95;
        }
        unint64_t v3 = 83;
        if (_LogCategory_Initialize()) {
          goto LABEL_95;
        }
        return v3;
      case 1298:
        if (gLogCategory_CoreRCDevice > 40) {
          return 82;
        }
        if (gLogCategory_CoreRCDevice != -1)
        {
          unint64_t v3 = 82;
          goto LABEL_95;
        }
        unint64_t v3 = 82;
        if (_LogCategory_Initialize()) {
          goto LABEL_95;
        }
        return v3;
      case 1299:
        if (gLogCategory_CoreRCDevice > 40) {
          return 52;
        }
        if (gLogCategory_CoreRCDevice != -1)
        {
          unint64_t v3 = 52;
          goto LABEL_95;
        }
        unint64_t v3 = 52;
        if (_LogCategory_Initialize()) {
          goto LABEL_95;
        }
        return v3;
      case 1300:
        if (gLogCategory_CoreRCDevice > 40) {
          return 45;
        }
        if (gLogCategory_CoreRCDevice != -1)
        {
          unint64_t v3 = 45;
          goto LABEL_95;
        }
        unint64_t v3 = 45;
        if (_LogCategory_Initialize()) {
          goto LABEL_95;
        }
        return v3;
      case 1301:
        if (gLogCategory_CoreRCDevice > 40) {
          return 74;
        }
        if (gLogCategory_CoreRCDevice != -1)
        {
          unint64_t v3 = 74;
          goto LABEL_95;
        }
        unint64_t v3 = 74;
        if (_LogCategory_Initialize()) {
          goto LABEL_95;
        }
        return v3;
      case 1302:
        if (gLogCategory_CoreRCDevice > 40) {
          return 75;
        }
        if (gLogCategory_CoreRCDevice != -1)
        {
          unint64_t v3 = 75;
          goto LABEL_95;
        }
        unint64_t v3 = 75;
        if (_LogCategory_Initialize()) {
          goto LABEL_95;
        }
        return v3;
      case 1303:
        if (gLogCategory_CoreRCDevice > 40) {
          return 51;
        }
        if (gLogCategory_CoreRCDevice != -1)
        {
          unint64_t v3 = 51;
          goto LABEL_95;
        }
        unint64_t v3 = 51;
        if (_LogCategory_Initialize()) {
          goto LABEL_95;
        }
        return v3;
      case 1304:
        if (gLogCategory_CoreRCDevice > 40) {
          return 72;
        }
        if (gLogCategory_CoreRCDevice != -1)
        {
          unint64_t v3 = 72;
          goto LABEL_95;
        }
        unint64_t v3 = 72;
        if (_LogCategory_Initialize()) {
          goto LABEL_95;
        }
        return v3;
      case 1305:
        if (gLogCategory_CoreRCDevice > 40) {
          return 47;
        }
        if (gLogCategory_CoreRCDevice != -1)
        {
          unint64_t v3 = 47;
          goto LABEL_95;
        }
        unint64_t v3 = 47;
        if (_LogCategory_Initialize()) {
          goto LABEL_95;
        }
        return v3;
      case 1312:
        if (gLogCategory_CoreRCDevice > 40) {
          return 84;
        }
        if (gLogCategory_CoreRCDevice != -1)
        {
          unint64_t v3 = 84;
          goto LABEL_95;
        }
        unint64_t v3 = 84;
        if (_LogCategory_Initialize()) {
          goto LABEL_95;
        }
        return v3;
      case 1313:
        if (gLogCategory_CoreRCDevice > 40) {
          return 85;
        }
        if (gLogCategory_CoreRCDevice != -1)
        {
          unint64_t v3 = 85;
          goto LABEL_95;
        }
        unint64_t v3 = 85;
        if (_LogCategory_Initialize()) {
          goto LABEL_95;
        }
        return v3;
      case 1314:
        if (gLogCategory_CoreRCDevice > 40) {
          return 64;
        }
        if (gLogCategory_CoreRCDevice != -1)
        {
          unint64_t v3 = 64;
          goto LABEL_95;
        }
        unint64_t v3 = 64;
        if (_LogCategory_Initialize()) {
          goto LABEL_95;
        }
        return v3;
      case 1315:
        if (gLogCategory_CoreRCDevice > 40) {
          return 34;
        }
        if (gLogCategory_CoreRCDevice != -1)
        {
          unint64_t v3 = 34;
          goto LABEL_95;
        }
        unint64_t v3 = 34;
        if (_LogCategory_Initialize()) {
          goto LABEL_95;
        }
        return v3;
      case 1316:
        if (gLogCategory_CoreRCDevice > 40) {
          return 35;
        }
        if (gLogCategory_CoreRCDevice != -1)
        {
          unint64_t v3 = 35;
          goto LABEL_95;
        }
        unint64_t v3 = 35;
        if (_LogCategory_Initialize()) {
          goto LABEL_95;
        }
        return v3;
      case 1317:
        if (gLogCategory_CoreRCDevice > 40) {
          return 90;
        }
        if (gLogCategory_CoreRCDevice != -1)
        {
          unint64_t v3 = 90;
          goto LABEL_95;
        }
        unint64_t v3 = 90;
        if (_LogCategory_Initialize()) {
          goto LABEL_95;
        }
        return v3;
      default:
        return v3;
    }
  }
  switch(v2)
  {
    case 3585:
      if (gLogCategory_CoreRCDevice > 40) {
        return 15;
      }
      if (gLogCategory_CoreRCDevice != -1)
      {
        unint64_t v3 = 15;
        goto LABEL_95;
      }
      unint64_t v3 = 15;
      if (_LogCategory_Initialize()) {
        goto LABEL_95;
      }
      return v3;
    case 3586:
      if (gLogCategory_CoreRCDevice > 40) {
        return 81;
      }
      if (gLogCategory_CoreRCDevice != -1)
      {
        unint64_t v3 = 81;
        goto LABEL_95;
      }
      unint64_t v3 = 81;
      if (_LogCategory_Initialize()) {
        goto LABEL_95;
      }
      return v3;
    case 3587:
LABEL_15:
      if (gLogCategory_CoreRCDevice > 40) {
        return 5;
      }
      if (gLogCategory_CoreRCDevice != -1)
      {
        unint64_t v3 = 5;
        goto LABEL_95;
      }
      unint64_t v3 = 5;
      if (_LogCategory_Initialize()) {
        goto LABEL_95;
      }
      return v3;
    case 3588:
LABEL_18:
      if (gLogCategory_CoreRCDevice > 40) {
        return 4;
      }
      if (gLogCategory_CoreRCDevice != -1)
      {
        unint64_t v3 = 4;
        goto LABEL_95;
      }
      unint64_t v3 = 4;
      if (_LogCategory_Initialize()) {
        goto LABEL_95;
      }
      return v3;
    case 3589:
LABEL_21:
      if (gLogCategory_CoreRCDevice > 40) {
        return 2;
      }
      if (gLogCategory_CoreRCDevice != -1)
      {
        unint64_t v3 = 2;
        goto LABEL_95;
      }
      unint64_t v3 = 2;
      if (_LogCategory_Initialize()) {
        goto LABEL_95;
      }
      return v3;
    case 3590:
LABEL_24:
      if (gLogCategory_CoreRCDevice > 40) {
        return 3;
      }
      if (gLogCategory_CoreRCDevice != -1)
      {
        unint64_t v3 = 3;
        goto LABEL_95;
      }
      unint64_t v3 = 3;
      if (_LogCategory_Initialize()) {
        goto LABEL_95;
      }
      return v3;
    default:
      if (v2 == 3630)
      {
LABEL_27:
        if (gLogCategory_CoreRCDevice <= 40)
        {
          if (gLogCategory_CoreRCDevice == -1)
          {
            unint64_t v3 = 1;
            if (!_LogCategory_Initialize()) {
              return v3;
            }
          }
          else
          {
            unint64_t v3 = 1;
          }
LABEL_95:
          LogPrintF();
          return v3;
        }
        return 1;
      }
      else if (v2 == 3631)
      {
        if (gLogCategory_CoreRCDevice > 40) {
          return 46;
        }
        if (gLogCategory_CoreRCDevice == -1)
        {
          unint64_t v3 = 46;
          if (!_LogCategory_Initialize()) {
            return v3;
          }
        }
        else
        {
          unint64_t v3 = 46;
        }
        goto LABEL_95;
      }
      return v3;
  }
}

- (BOOL)getVendorSpecificHIDUsagePage:(unsigned int *)a3 usageID:(unsigned int *)a4 ignoreRepeats:(BOOL *)a5
{
  int v8 = [(AppleIRCommand *)self token];
  LOBYTE(v9) = 0;
  if (v8 <= 3590)
  {
    if (v8 == 3 || v8 == 7)
    {
      if (gLogCategory_CoreRCDevice <= 50)
      {
        if (gLogCategory_CoreRCDevice == -1)
        {
          BOOL v10 = 1;
          unsigned int v11 = 3;
          unsigned int v12 = 65294;
          if (!_LogCategory_Initialize()) {
            goto LABEL_46;
          }
        }
        else
        {
          BOOL v10 = 1;
          unsigned int v11 = 3;
          unsigned int v12 = 65294;
        }
        goto LABEL_15;
      }
      BOOL v10 = 1;
      unsigned int v11 = 3;
    }
    else
    {
      if (v8 != 263) {
        return v9;
      }
      if (gLogCategory_CoreRCDevice <= 50)
      {
        if (gLogCategory_CoreRCDevice == -1)
        {
          BOOL v10 = 0;
          unsigned int v11 = 4;
          unsigned int v12 = 65294;
          if (!_LogCategory_Initialize()) {
            goto LABEL_46;
          }
        }
        else
        {
          BOOL v10 = 0;
          unsigned int v11 = 4;
          unsigned int v12 = 65294;
        }
        goto LABEL_15;
      }
      BOOL v10 = 0;
      unsigned int v11 = 4;
    }
    unsigned int v12 = 65294;
    goto LABEL_46;
  }
  switch(v8)
  {
    case 3634:
      if (gLogCategory_CoreRCDevice > 50)
      {
        unsigned int v11 = 1;
        unsigned int v12 = 65295;
LABEL_40:
        BOOL v10 = 1;
        goto LABEL_46;
      }
      if (gLogCategory_CoreRCDevice != -1)
      {
        unsigned int v11 = 1;
        unsigned int v12 = 65295;
        BOOL v10 = 1;
        goto LABEL_15;
      }
      unsigned int v11 = 1;
      unsigned int v12 = 65295;
      if (!_LogCategory_Initialize()) {
        goto LABEL_40;
      }
      BOOL v10 = 1;
LABEL_15:
      LogPrintF();
LABEL_46:
      if (a3) {
        *a3 = v12;
      }
      if (a4) {
        *a4 = v11;
      }
      if (a5) {
        *a5 = v10;
      }
      LOBYTE(v9) = 1;
      return v9;
    case 3635:
      if (gLogCategory_CoreRCDevice > 50)
      {
        BOOL v10 = 1;
        unsigned int v11 = 2;
        goto LABEL_38;
      }
      if (gLogCategory_CoreRCDevice != -1)
      {
        BOOL v10 = 1;
        unsigned int v11 = 2;
        unsigned int v12 = 65295;
        goto LABEL_15;
      }
      BOOL v10 = 1;
      unsigned int v11 = 2;
      unsigned int v12 = 65295;
      if (_LogCategory_Initialize()) {
        goto LABEL_15;
      }
      goto LABEL_46;
    case 3636:
      if (gLogCategory_CoreRCDevice > 50) {
        goto LABEL_28;
      }
      if (gLogCategory_CoreRCDevice != -1 || (int v9 = _LogCategory_Initialize()) != 0)
      {
        LogPrintF();
LABEL_28:
        LOBYTE(v9) = 0;
      }
      return v9;
    case 3637:
      if (gLogCategory_CoreRCDevice > 50)
      {
        BOOL v10 = 1;
        unsigned int v11 = 3;
LABEL_38:
        unsigned int v12 = 65295;
        goto LABEL_46;
      }
      if (gLogCategory_CoreRCDevice != -1)
      {
        BOOL v10 = 1;
        unsigned int v11 = 3;
        unsigned int v12 = 65295;
        goto LABEL_15;
      }
      BOOL v10 = 1;
      unsigned int v11 = 3;
      unsigned int v12 = 65295;
      if (!_LogCategory_Initialize()) {
        goto LABEL_46;
      }
      goto LABEL_15;
    default:
      return v9;
  }
}

@end