@interface HULocationDevice
+ (NAIdentity)na_identity;
- (BOOL)isCurrentDevice;
- (BOOL)isEqual:(id)a3;
- (HULocationDevice)initWithHMDevice:(id)a3;
- (HULocationDevice)initWithIdentifier:(id)a3 name:(id)a4 currentDevice:(BOOL)a5;
- (NSString)description;
- (NSString)identifier;
- (NSString)name;
- (unint64_t)hash;
@end

@implementation HULocationDevice

- (HULocationDevice)initWithHMDevice:(id)a3
{
  id v4 = a3;
  v5 = [v4 uniqueIdentifier];
  v6 = [v5 UUIDString];
  v7 = [v4 name];
  uint64_t v8 = [v4 isCurrentDevice];

  v9 = [(HULocationDevice *)self initWithIdentifier:v6 name:v7 currentDevice:v8];
  return v9;
}

- (HULocationDevice)initWithIdentifier:(id)a3 name:(id)a4 currentDevice:(BOOL)a5
{
  id v10 = a3;
  id v11 = a4;
  if (![v10 length])
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"HULocationDeviceManager.m", 31, @"Invalid parameter not satisfying: %@", @"identifier.length" object file lineNumber description];
  }
  v16.receiver = self;
  v16.super_class = (Class)HULocationDevice;
  v12 = [(HULocationDevice *)&v16 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    objc_storeStrong((id *)&v13->_name, a4);
    v13->_currentDevice = a5;
  }

  return v13;
}

+ (NAIdentity)na_identity
{
  if (_MergedGlobals_625 != -1) {
    dispatch_once(&_MergedGlobals_625, &__block_literal_global_85_0);
  }
  v2 = (void *)qword_1EBA47880;

  return (NAIdentity *)v2;
}

void __31__HULocationDevice_na_identity__block_invoke_2()
{
  v0 = [MEMORY[0x1E4F7A0E0] builder];
  id v1 = (id)[v0 appendCharacteristic:&__block_literal_global_92_0];
  id v2 = (id)[v0 appendCharacteristic:&__block_literal_global_94];
  id v3 = (id)[v0 appendCharacteristic:&__block_literal_global_96];
  uint64_t v4 = [v0 build];

  v5 = (void *)qword_1EBA47880;
  qword_1EBA47880 = v4;
}

uint64_t __31__HULocationDevice_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

uint64_t __31__HULocationDevice_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 name];
}

uint64_t __31__HULocationDevice_na_identity__block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  uint64_t v3 = [a2 isCurrentDevice];

  return [v2 numberWithBool:v3];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(), "na_identity");
  LOBYTE(self) = [v5 isObject:self equalToObject:v4];

  return (char)self;
}

- (unint64_t)hash
{
  uint64_t v3 = objc_msgSend((id)objc_opt_class(), "na_identity");
  unint64_t v4 = [v3 hashOfObject:self];

  return v4;
}

- (NSString)description
{
  uint64_t v3 = [MEMORY[0x1E4F7A0D0] builderWithObject:self];
  unint64_t v4 = [(HULocationDevice *)self identifier];
  [v3 appendString:v4 withName:@"ID"];

  v5 = [(HULocationDevice *)self name];
  [v3 appendString:v5 withName:@"name"];

  id v6 = (id)objc_msgSend(v3, "appendBool:withName:", -[HULocationDevice isCurrentDevice](self, "isCurrentDevice"), @"currentDevice");
  v7 = [v3 build];

  return (NSString *)v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)isCurrentDevice
{
  return self->_currentDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end