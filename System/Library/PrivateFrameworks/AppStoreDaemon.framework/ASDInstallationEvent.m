@interface ASDInstallationEvent
+ (BOOL)supportsSecureCoding;
- (ASDInstallationEvent)initWithCoder:(id)a3;
- (ASDInstallationEvent)initWithPhase:(int64_t)a3 terminalPhase:(int64_t)a4 bundleID:(id)a5 itemID:(id)a6 appType:(int64_t)a7 installType:(int64_t)a8;
- (NSNumber)itemID;
- (NSString)bundleID;
- (int64_t)appType;
- (int64_t)installType;
- (int64_t)phase;
- (int64_t)source;
- (int64_t)terminalPhase;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASDInstallationEvent

- (ASDInstallationEvent)initWithPhase:(int64_t)a3 terminalPhase:(int64_t)a4 bundleID:(id)a5 itemID:(id)a6 appType:(int64_t)a7 installType:(int64_t)a8
{
  id v14 = a5;
  id v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)ASDInstallationEvent;
  v16 = [(ASDInstallationEvent *)&v19 init];
  v17 = v16;
  if (v16)
  {
    v16->_phase = a3;
    v16->_terminalPhase = a4;
    objc_storeStrong((id *)&v16->_bundleID, a5);
    objc_storeStrong((id *)&v17->_itemID, a6);
    v17->_installType = a8;
  }

  return v17;
}

- (int64_t)source
{
  return 1;
}

- (int64_t)appType
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDInstallationEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (ASDInstallationEvent *)[v4 decodeIntegerForKey:@"_phase"];
  if (v5)
  {
    uint64_t v6 = [v4 decodeIntegerForKey:@"_terminalPhase"];
    if (v6)
    {
      uint64_t v7 = v6;
      v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_bundleID"];
      if (v8)
      {
        v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_itemID"];
        if (v9 && (uint64_t v10 = [v4 decodeIntegerForKey:@"_installType"]) != 0)
        {
          self = [(ASDInstallationEvent *)self initWithPhase:v5 terminalPhase:v7 bundleID:v8 itemID:v9 appType:1 installType:v10];
          v5 = self;
        }
        else
        {
          v5 = 0;
        }
      }
      else
      {
        v5 = 0;
      }
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t phase = self->_phase;
  id v5 = a3;
  [v5 encodeInteger:phase forKey:@"_phase"];
  [v5 encodeInteger:self->_terminalPhase forKey:@"_terminalPhase"];
  [v5 encodeObject:self->_bundleID forKey:@"_bundleID"];
  [v5 encodeObject:self->_itemID forKey:@"_itemID"];
  [v5 encodeInteger:self->_installType forKey:@"_installType"];
}

- (int64_t)phase
{
  return self->_phase;
}

- (int64_t)terminalPhase
{
  return self->_terminalPhase;
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSNumber)itemID
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (int64_t)installType
{
  return self->_installType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end