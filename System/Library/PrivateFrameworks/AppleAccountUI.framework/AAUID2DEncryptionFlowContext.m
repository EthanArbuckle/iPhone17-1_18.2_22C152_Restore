@interface AAUID2DEncryptionFlowContext
+ (id)contextWithType:(unint64_t)a3;
+ (id)contextWithType:(unint64_t)a3 altDSID:(id)a4;
- (AAUID2DEncryptionFlowContext)initWithType:(unint64_t)a3;
- (AAUID2DEncryptionFlowContext)initWithType:(unint64_t)a3 altDSID:(id)a4;
- (BOOL)requiresSynchronousRepair;
- (int64_t)deviceToDeviceEncryptionUpgradeType;
- (int64_t)deviceToDeviceEncryptionUpgradeUIStyle;
- (unint64_t)contextType;
- (void)setContextType:(unint64_t)a3;
@end

@implementation AAUID2DEncryptionFlowContext

- (AAUID2DEncryptionFlowContext)initWithType:(unint64_t)a3 altDSID:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)AAUID2DEncryptionFlowContext;
  v5 = [(CDPUIDeviceToDeviceEncryptionFlowContext *)&v8 initWithAltDSID:a4];
  v6 = v5;
  if (v5) {
    [(AAUID2DEncryptionFlowContext *)v5 setContextType:a3];
  }
  return v6;
}

- (AAUID2DEncryptionFlowContext)initWithType:(unint64_t)a3
{
  v5 = [MEMORY[0x263F34328] sharedInstance];
  v6 = [v5 primaryAccountAltDSID];
  v7 = [(AAUID2DEncryptionFlowContext *)self initWithType:a3 altDSID:v6];

  return v7;
}

+ (id)contextWithType:(unint64_t)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithType:a3];
  return v3;
}

+ (id)contextWithType:(unint64_t)a3 altDSID:(id)a4
{
  id v6 = a4;
  v7 = (void *)[objc_alloc((Class)a1) initWithType:a3 altDSID:v6];

  return v7;
}

- (int64_t)deviceToDeviceEncryptionUpgradeUIStyle
{
  unint64_t v2 = [(AAUID2DEncryptionFlowContext *)self contextType];
  if (v2 - 2 > 5) {
    return 1;
  }
  else {
    return qword_2098C9048[v2 - 2];
  }
}

- (BOOL)requiresSynchronousRepair
{
  return [(AAUID2DEncryptionFlowContext *)self contextType] - 5 < 3;
}

- (int64_t)deviceToDeviceEncryptionUpgradeType
{
  return 2 * ([(AAUID2DEncryptionFlowContext *)self contextType] == 7);
}

- (unint64_t)contextType
{
  return self->_contextType;
}

- (void)setContextType:(unint64_t)a3
{
  self->_contextType = a3;
}

@end