@interface AFBluetoothWirelessSplitterSessionInfo
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFBluetoothWirelessSplitterSessionInfo)init;
- (AFBluetoothWirelessSplitterSessionInfo)initWithBuilder:(id)a3;
- (AFBluetoothWirelessSplitterSessionInfo)initWithCoder:(id)a3;
- (AFBluetoothWirelessSplitterSessionInfo)initWithState:(int64_t)a3 deviceAddresses:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSArray)deviceAddresses;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (int64_t)state;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFBluetoothWirelessSplitterSessionInfo

- (void).cxx_destruct
{
}

- (NSArray)deviceAddresses
{
  return self->_deviceAddresses;
}

- (int64_t)state
{
  return self->_state;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F28ED0];
  int64_t state = self->_state;
  id v7 = a3;
  v6 = [v4 numberWithInteger:state];
  [v7 encodeObject:v6 forKey:@"AFBluetoothWirelessSplitterSessionInfo::state"];

  [v7 encodeObject:self->_deviceAddresses forKey:@"AFBluetoothWirelessSplitterSessionInfo::deviceAddresses"];
}

- (AFBluetoothWirelessSplitterSessionInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFBluetoothWirelessSplitterSessionInfo::state"];
  uint64_t v6 = [v5 integerValue];

  id v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v10 = [v4 decodeObjectOfClasses:v9 forKey:@"AFBluetoothWirelessSplitterSessionInfo::deviceAddresses"];

  v11 = [(AFBluetoothWirelessSplitterSessionInfo *)self initWithState:v6 deviceAddresses:v10];
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AFBluetoothWirelessSplitterSessionInfo *)a3;
  if (self == v4)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      int64_t state = self->_state;
      if (state == [(AFBluetoothWirelessSplitterSessionInfo *)v5 state])
      {
        id v7 = [(AFBluetoothWirelessSplitterSessionInfo *)v5 deviceAddresses];
        deviceAddresses = self->_deviceAddresses;
        BOOL v9 = deviceAddresses == v7 || [(NSArray *)deviceAddresses isEqual:v7];
      }
      else
      {
        BOOL v9 = 0;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_state];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(NSArray *)self->_deviceAddresses hash] ^ v4;

  return v5;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v11.receiver = self;
  v11.super_class = (Class)AFBluetoothWirelessSplitterSessionInfo;
  unint64_t v5 = [(AFBluetoothWirelessSplitterSessionInfo *)&v11 description];
  unint64_t state = self->_state;
  if (state > 2) {
    id v7 = @"(unknown)";
  }
  else {
    id v7 = off_1E59273F0[state];
  }
  uint64_t v8 = v7;
  v9 = (void *)[v4 initWithFormat:@"%@ {unint64_t state = %@, deviceAddresses = %@}", v5, v8, self->_deviceAddresses];

  return v9;
}

- (id)description
{
  return [(AFBluetoothWirelessSplitterSessionInfo *)self _descriptionWithIndent:0];
}

- (AFBluetoothWirelessSplitterSessionInfo)initWithState:(int64_t)a3 deviceAddresses:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__AFBluetoothWirelessSplitterSessionInfo_initWithState_deviceAddresses___block_invoke;
  v10[3] = &unk_1E5924D48;
  id v11 = v6;
  int64_t v12 = a3;
  id v7 = v6;
  uint64_t v8 = [(AFBluetoothWirelessSplitterSessionInfo *)self initWithBuilder:v10];

  return v8;
}

void __72__AFBluetoothWirelessSplitterSessionInfo_initWithState_deviceAddresses___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  [v4 setState:v3];
  [v4 setDeviceAddresses:*(void *)(a1 + 32)];
}

- (AFBluetoothWirelessSplitterSessionInfo)init
{
  return [(AFBluetoothWirelessSplitterSessionInfo *)self initWithBuilder:0];
}

- (AFBluetoothWirelessSplitterSessionInfo)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _AFBluetoothWirelessSplitterSessionInfoMutation *))a3;
  v12.receiver = self;
  v12.super_class = (Class)AFBluetoothWirelessSplitterSessionInfo;
  unint64_t v5 = [(AFBluetoothWirelessSplitterSessionInfo *)&v12 init];
  id v6 = v5;
  if (v4 && v5)
  {
    id v7 = [[_AFBluetoothWirelessSplitterSessionInfoMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_AFBluetoothWirelessSplitterSessionInfoMutation *)v7 isDirty])
    {
      v6->_unint64_t state = [(_AFBluetoothWirelessSplitterSessionInfoMutation *)v7 getState];
      uint64_t v8 = [(_AFBluetoothWirelessSplitterSessionInfoMutation *)v7 getDeviceAddresses];
      uint64_t v9 = [v8 copy];
      deviceAddresses = v6->_deviceAddresses;
      v6->_deviceAddresses = (NSArray *)v9;
    }
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)newWithBuilder:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBuilder:v3];

  return v4;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _AFBluetoothWirelessSplitterSessionInfoMutation *))a3;
  if (v4)
  {
    unint64_t v5 = [[_AFBluetoothWirelessSplitterSessionInfoMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_AFBluetoothWirelessSplitterSessionInfoMutation *)v5 isDirty])
    {
      id v6 = objc_alloc_init(AFBluetoothWirelessSplitterSessionInfo);
      v6->_unint64_t state = [(_AFBluetoothWirelessSplitterSessionInfoMutation *)v5 getState];
      id v7 = [(_AFBluetoothWirelessSplitterSessionInfoMutation *)v5 getDeviceAddresses];
      uint64_t v8 = [v7 copy];
      deviceAddresses = v6->_deviceAddresses;
      v6->_deviceAddresses = (NSArray *)v8;
    }
    else
    {
      id v6 = (AFBluetoothWirelessSplitterSessionInfo *)[(AFBluetoothWirelessSplitterSessionInfo *)self copy];
    }
  }
  else
  {
    id v6 = (AFBluetoothWirelessSplitterSessionInfo *)[(AFBluetoothWirelessSplitterSessionInfo *)self copy];
  }

  return v6;
}

@end