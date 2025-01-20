@interface CoreIRBus
+ (BOOL)supportsSecureCoding;
- (BOOL)deleteDevice:(id)a3 error:(id *)a4;
- (BOOL)setPairedAppleRemote:(id)a3 error:(id *)a4;
- (CoreIRBus)init;
- (CoreIRBus)initWithBus:(id)a3;
- (CoreIRBus)initWithCoder:(id)a3;
- (CoreIRDevice)lastAppleRemote;
- (CoreIRDevice)pairedAppleRemote;
- (id)addDeviceWithType:(unint64_t)a3 matching:(id)a4 error:(id *)a5;
- (id)addDeviceWithType:(unint64_t)a3 matching:(id)a4 learningSession:(id)a5 error:(id *)a6;
- (id)description;
- (id)mergeProperties;
- (void)dealloc;
- (void)didDispatchCommandFromAppleRemote:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setLastAppleRemote:(id)a3;
- (void)setPairedAppleRemote:(id)a3;
- (void)willRemoveDevice:(id)a3;
@end

@implementation CoreIRBus

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CoreIRBus)init
{
  v3.receiver = self;
  v3.super_class = (Class)CoreIRBus;
  result = [(CoreRCBus *)&v3 init];
  if (result)
  {
    result->_pairedAppleRemote = 0;
    result->_lastAppleRemote = 0;
  }
  return result;
}

- (CoreIRBus)initWithBus:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7.receiver = self;
    v7.super_class = (Class)CoreIRBus;
    v5 = [(CoreRCBus *)&v7 initWithBus:a3];
    if (v5)
    {
      -[CoreIRBus setPairedAppleRemote:](v5, "setPairedAppleRemote:", [a3 pairedAppleRemote]);
      -[CoreIRBus setLastAppleRemote:](v5, "setLastAppleRemote:", [a3 lastAppleRemote]);
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

- (CoreIRBus)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CoreIRBus;
  v4 = -[CoreRCBus initWithCoder:](&v6, sel_initWithCoder_);
  if (v4)
  {
    -[CoreIRBus setPairedAppleRemote:](v4, "setPairedAppleRemote:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"pairedAppleRemote"]);
    -[CoreIRBus setLastAppleRemote:](v4, "setLastAppleRemote:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"lastAppleRemote"]);
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CoreIRBus;
  -[CoreRCBus encodeWithCoder:](&v5, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeObject:forKey:", -[CoreIRBus pairedAppleRemote](self, "pairedAppleRemote"), @"pairedAppleRemote");
  objc_msgSend(a3, "encodeObject:forKey:", -[CoreIRBus lastAppleRemote](self, "lastAppleRemote"), @"lastAppleRemote");
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CoreIRBus;
  [(CoreRCBus *)&v3 dealloc];
}

- (id)mergeProperties
{
  return &unk_26FEDA930;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)CoreIRBus;
  objc_super v3 = objc_msgSend(objc_alloc(MEMORY[0x263F089D8]), "initWithString:", -[CoreRCBus description](&v6, sel_description));
  if ([(CoreIRBus *)self pairedAppleRemote]) {
    v4 = [(CoreIRBus *)self pairedAppleRemote];
  }
  else {
    v4 = (CoreIRDevice *)@"N";
  }
  [v3 appendFormat:@" Paired: %@;", v4];
  if ([(CoreIRBus *)self lastAppleRemote]) {
    objc_msgSend(v3, "appendFormat:", @" Last Apple Remote: %@;",
  }
      [(CoreIRBus *)self lastAppleRemote]);
  return v3;
}

- (void)willRemoveDevice:(id)a3
{
  if ([(CoreRCDevice *)[(CoreIRBus *)self lastAppleRemote] isEqual:a3]) {
    [(CoreIRBus *)self setLastAppleRemote:0];
  }
  if ([(CoreRCDevice *)[(CoreIRBus *)self pairedAppleRemote] isEqual:a3]) {
    [(CoreIRBus *)self setPairedAppleRemote:0];
  }
  v5.receiver = self;
  v5.super_class = (Class)CoreIRBus;
  [(CoreRCBus *)&v5 willRemoveDevice:a3];
}

- (void)setLastAppleRemote:(id)a3
{
  v4 = (CoreIRDevice *)[(CoreRCBus *)self deviceOnBusEquivalentTo:a3];

  self->_lastAppleRemote = v4;
}

- (void)setPairedAppleRemote:(id)a3
{
  v4 = (CoreIRDevice *)[(CoreRCBus *)self deviceOnBusEquivalentTo:a3];

  self->_pairedAppleRemote = v4;
}

- (BOOL)setPairedAppleRemote:(id)a3 error:(id *)a4
{
  return 1;
}

- (void)didDispatchCommandFromAppleRemote:(id)a3
{
  if ([(CoreIRBus *)self lastAppleRemote] != a3)
  {
    [(CoreIRBus *)self setLastAppleRemote:a3];
    [(CoreRCBus *)self didUpdateProperties:&unk_26FEDA960];
  }
}

- (id)addDeviceWithType:(unint64_t)a3 matching:(id)a4 error:(id *)a5
{
  return 0;
}

- (id)addDeviceWithType:(unint64_t)a3 matching:(id)a4 learningSession:(id)a5 error:(id *)a6
{
  return 0;
}

- (BOOL)deleteDevice:(id)a3 error:(id *)a4
{
  return 0;
}

- (CoreIRDevice)pairedAppleRemote
{
  return self->_pairedAppleRemote;
}

- (CoreIRDevice)lastAppleRemote
{
  return self->_lastAppleRemote;
}

@end