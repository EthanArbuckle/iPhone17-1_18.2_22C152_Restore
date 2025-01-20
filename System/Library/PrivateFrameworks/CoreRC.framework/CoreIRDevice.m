@interface CoreIRDevice
+ (BOOL)supportsSecureCoding;
- (BOOL)changeButtonCombination:(id)a3 delay:(double)a4 enabled:(BOOL)a5 error:(id *)a6;
- (BOOL)clearAllStoredCommands:(id *)a3;
- (BOOL)disableButtonCombination:(id)a3 delay:(double)a4 error:(id *)a5;
- (BOOL)enableButtonCombination:(id)a3 delay:(double)a4 error:(id *)a5;
- (BOOL)is3rdPartyRemote;
- (BOOL)isAppleRemote;
- (BOOL)isReceiver;
- (BOOL)isTransmitter;
- (BOOL)pairAppleRemote:(id *)a3;
- (BOOL)sendCommand:(id)a3 error:(id *)a4;
- (BOOL)setCommand:(unint64_t)a3 target:(id)a4 forButtonCombination:(id)a5 delay:(double)a6 error:(id *)a7;
- (BOOL)setOSDName:(id)a3 error:(id *)a4;
- (BOOL)setRemoteName:(id)a3 error:(id *)a4;
- (BOOL)unpairAppleRemote:(id *)a3;
- (BOOL)updateMappingWithSession:(id)a3 error:(id *)a4;
- (CoreIRDevice)initWithBus:(id)a3 local:(BOOL)a4;
- (CoreIRDevice)initWithBus:(id)a3 local:(BOOL)a4 deviceType:(unint64_t)a5;
- (CoreIRDevice)initWithCoder:(id)a3;
- (CoreIRDevice)initWithDevice:(id)a3;
- (CoreIRLearningSession)learningSession;
- (NSArray)buttons;
- (NSString)OSDName;
- (id)debugDescription;
- (id)description;
- (id)mergeProperties;
- (id)startLearningSessionWithReason:(unint64_t)a3 error:(id *)a4;
- (unint64_t)vendorID;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setButtons:(id)a3;
- (void)setIsReceiver:(BOOL)a3;
- (void)setIsTransmitter:(BOOL)a3;
- (void)setLearningSession:(id)a3;
- (void)setOSDName:(id)a3;
- (void)setVendorID:(unint64_t)a3;
@end

@implementation CoreIRDevice

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)setOSDName:(id)a3 error:(id *)a4
{
  if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    id v7 = a3;
    LogPrintF();
  }
  -[CoreIRDevice setOSDName:](self, "setOSDName:", a3, v7);
  if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    [(CoreIRDevice *)self OSDName];
    LogPrintF();
  }
  return 1;
}

- (void)dealloc
{
  [(CoreIRDevice *)self setLearningSession:0];

  v3.receiver = self;
  v3.super_class = (Class)CoreIRDevice;
  [(CoreRCDevice *)&v3 dealloc];
}

- (CoreIRDevice)initWithBus:(id)a3 local:(BOOL)a4 deviceType:(unint64_t)a5
{
  char v5 = a5;
  v7.receiver = self;
  v7.super_class = (Class)CoreIRDevice;
  result = [(CoreRCDevice *)&v7 initWithBus:a3 local:a4];
  if (result)
  {
    result->_learningSession = 0;
    result->_isTransmitter = v5 & 1;
    result->_isReceiver = (v5 & 0x10) != 0;
    result->_vendorID = -1;
    result->_buttons = 0;
    result->_OSDName = 0;
  }
  return result;
}

- (CoreIRDevice)initWithBus:(id)a3 local:(BOOL)a4
{
  BOOL v4 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    return [(CoreIRDevice *)self initWithBus:a3 local:v4 deviceType:0];
  }
  else
  {

    return 0;
  }
}

- (CoreIRDevice)initWithDevice:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7.receiver = self;
    v7.super_class = (Class)CoreIRDevice;
    char v5 = [(CoreRCDevice *)&v7 initWithDevice:a3];
    if (v5)
    {
      v5->_isTransmitter = [a3 isTransmitter];
      v5->_isReceiver = [a3 isReceiver];
      v5->_vendorID = [a3 vendorID];
      v5->_buttons = (NSArray *)objc_msgSend((id)objc_msgSend(a3, "buttons"), "copy");
      v5->_OSDName = (NSString *)objc_msgSend((id)objc_msgSend(a3, "OSDName"), "copy");
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

- (CoreIRDevice)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CoreIRDevice;
  BOOL v4 = -[CoreRCDevice initWithCoder:](&v8, sel_initWithCoder_);
  if (v4)
  {
    v4->_isTransmitter = [a3 decodeBoolForKey:@"isTransmitter"];
    v4->_isReceiver = [a3 decodeBoolForKey:@"isReceiver"];
    v4->_vendorID = (int)[a3 decodeIntForKey:@"vendorID"];
    char v5 = (void *)MEMORY[0x263EFFA08];
    uint64_t v6 = objc_opt_class();
    v4->_buttons = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), @"buttons");
    v4->_OSDName = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"OSDName"];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CoreIRDevice;
  -[CoreRCDevice encodeWithCoder:](&v5, sel_encodeWithCoder_);
  [a3 encodeBool:self->_isTransmitter forKey:@"isTransmitter"];
  [a3 encodeBool:self->_isReceiver forKey:@"isReceiver"];
  [a3 encodeInt:LODWORD(self->_vendorID) forKey:@"isReceiver"];
  [a3 encodeObject:self->_buttons forKey:@"buttons"];
  [a3 encodeObject:self->_OSDName forKey:@"OSDName"];
}

- (id)mergeProperties
{
  return &unk_26FEDA918;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)CoreIRDevice;
  objc_super v3 = objc_msgSend(objc_alloc(MEMORY[0x263F089D8]), "initWithString:", -[CoreRCDevice description](&v8, sel_description));
  BOOL v4 = v3;
  if (self->_isReceiver) {
    objc_super v5 = "Y";
  }
  else {
    objc_super v5 = "N";
  }
  objc_msgSend(v3, "appendFormat:", @" Rx: %s;", v5);
  if (self->_isTransmitter) {
    uint64_t v6 = "Y";
  }
  else {
    uint64_t v6 = "N";
  }
  objc_msgSend(v4, "appendFormat:", @" Tx: %s;", v6);
  objc_msgSend(v4, "appendFormat:", @" VendorID: %u;", self->_vendorID);
  objc_msgSend(v4, "appendFormat:", @" #Buttons: %u;", -[NSArray count](self->_buttons, "count"));
  [v4 appendFormat:@" Name: %@;", self->_OSDName];
  return v4;
}

- (id)debugDescription
{
  objc_super v3 = objc_msgSend(objc_alloc(MEMORY[0x263F089D8]), "initWithString:", -[CoreIRDevice description](self, "description"));
  if ([(NSArray *)self->_buttons count]) {
    [v3 appendFormat:@" Buttons:\n%@;", self->_buttons];
  }
  return v3;
}

- (BOOL)is3rdPartyRemote
{
  BOOL v3 = [(CoreIRDevice *)self isTransmitter];
  if (v3)
  {
    if ([(CoreRCDevice *)self isLocalDevice]) {
      LOBYTE(v3) = 0;
    }
    else {
      LOBYTE(v3) = ![(CoreIRDevice *)self isAppleRemote];
    }
  }
  return v3;
}

- (BOOL)isAppleRemote
{
  return 0;
}

- (void)setLearningSession:(id)a3
{
  id v5 = a3;
  [(CoreIRLearningSession *)self->_learningSession setOwningDevice:0];

  self->_learningSession = (CoreIRLearningSession *)a3;
  [a3 setOwningDevice:self];
}

- (BOOL)sendCommand:(id)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)clearAllStoredCommands:(id *)a3
{
  return 0;
}

- (BOOL)setCommand:(unint64_t)a3 target:(id)a4 forButtonCombination:(id)a5 delay:(double)a6 error:(id *)a7
{
  return 0;
}

- (BOOL)enableButtonCombination:(id)a3 delay:(double)a4 error:(id *)a5
{
  return 0;
}

- (BOOL)disableButtonCombination:(id)a3 delay:(double)a4 error:(id *)a5
{
  return 0;
}

- (BOOL)changeButtonCombination:(id)a3 delay:(double)a4 enabled:(BOOL)a5 error:(id *)a6
{
  return 0;
}

- (id)startLearningSessionWithReason:(unint64_t)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)updateMappingWithSession:(id)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)setRemoteName:(id)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)pairAppleRemote:(id *)a3
{
  if (a3) {
    *a3 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6756 userInfo:0];
  }
  return 0;
}

- (BOOL)unpairAppleRemote:(id *)a3
{
  if (a3) {
    *a3 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6756 userInfo:0];
  }
  return 0;
}

- (BOOL)isTransmitter
{
  return self->_isTransmitter;
}

- (void)setIsTransmitter:(BOOL)a3
{
  self->_isTransmitter = a3;
}

- (BOOL)isReceiver
{
  return self->_isReceiver;
}

- (void)setIsReceiver:(BOOL)a3
{
  self->_isReceiver = a3;
}

- (unint64_t)vendorID
{
  return self->_vendorID;
}

- (void)setVendorID:(unint64_t)a3
{
  self->_vendorID = a3;
}

- (NSArray)buttons
{
  return self->_buttons;
}

- (void)setButtons:(id)a3
{
}

- (CoreIRLearningSession)learningSession
{
  return self->_learningSession;
}

- (NSString)OSDName
{
  return self->_OSDName;
}

- (void)setOSDName:(id)a3
{
}

@end