@interface ASMigrationDisplayItem
+ (BOOL)supportsSecureCoding;
- (ASMigrationDisplayItem)initWithCoder:(id)a3;
- (ASMigrationDisplayItem)initWithXPCObject:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)hotspotSSID;
- (NSUUID)peripheralIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithLevel:(int)a3;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCObject:(id)a3;
- (void)setHotspotSSID:(id)a3;
- (void)setPeripheralIdentifier:(id)a3;
@end

@implementation ASMigrationDisplayItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASMigrationDisplayItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ASMigrationDisplayItem;
  v5 = [(ASPickerDisplayItem *)&v18 initWithCoder:v4];
  if (v5)
  {
    id v6 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v7 = v6;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v8 = v5;
  }
  else
  {
    uint64_t v10 = objc_opt_class();
    v17 = ASErrorF(1, (uint64_t)"%@ init failed", v11, v12, v13, v14, v15, v16, v10);
    [v4 failWithError:v17];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ASMigrationDisplayItem;
  [(ASPickerDisplayItem *)&v7 encodeWithCoder:v4];
  peripheralIdentifier = self->_peripheralIdentifier;
  if (peripheralIdentifier) {
    [v4 encodeObject:peripheralIdentifier forKey:@"mPid"];
  }
  hotspotSSID = self->_hotspotSSID;
  if (hotspotSSID) {
    [v4 encodeObject:hotspotSSID forKey:@"mHSd"];
  }
}

- (ASMigrationDisplayItem)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)ASMigrationDisplayItem;
  objc_super v7 = [(ASPickerDisplayItem *)&v24 initWithXPCObject:v6 error:a4];
  if (!v7)
  {
    if (a4)
    {
      uint64_t v16 = [(id)objc_opt_class() description];
      ASErrorF(-6756, (uint64_t)"%@ init failed", v17, v18, v19, v20, v21, v22, (uint64_t)v16);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_9;
  }
  if (MEMORY[0x245670630](v6) != MEMORY[0x263EF8708])
  {
    if (a4)
    {
      ASErrorF(-6756, (uint64_t)"XPC non-dict", v8, v9, v10, v11, v12, v13, v23);
      uint64_t v14 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_4;
    }
LABEL_9:
    uint64_t v14 = 0;
    goto LABEL_4;
  }
  CUXPCDecodeNSUUID();
  CUXPCDecodeNSString();
  uint64_t v14 = v7;
LABEL_4:

  return v14;
}

- (void)encodeWithXPCObject:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASMigrationDisplayItem;
  [(ASPickerDisplayItem *)&v10 encodeWithXPCObject:v4];
  peripheralIdentifier = self->_peripheralIdentifier;
  if (peripheralIdentifier)
  {
    id v6 = v4;
    [(NSUUID *)peripheralIdentifier getUUIDBytes:uuid];
    xpc_dictionary_set_uuid(v6, "mPid", uuid);
  }
  hotspotSSID = self->_hotspotSSID;
  id v8 = v4;
  uint64_t v9 = [(NSString *)hotspotSSID UTF8String];
  if (v9) {
    xpc_dictionary_set_string(v8, "mHSd", v9);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)ASMigrationDisplayItem;
  id v4 = [(ASPickerDisplayItem *)&v10 copyWithZone:a3];
  uint64_t v5 = [(NSUUID *)self->_peripheralIdentifier copy];
  id v6 = (void *)v4[9];
  v4[9] = v5;

  uint64_t v7 = [(NSString *)self->_hotspotSSID copy];
  id v8 = (void *)v4[10];
  v4[10] = v7;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ASMigrationDisplayItem *)a3;
  uint64_t v5 = v4;
  if (self != v4)
  {
    id v6 = v4;
    if (![(ASMigrationDisplayItem *)v6 isMemberOfClass:objc_opt_class()])
    {
      char v13 = 0;
LABEL_19:

      goto LABEL_20;
    }
    peripheralIdentifier = self->_peripheralIdentifier;
    id v8 = [(ASMigrationDisplayItem *)v6 peripheralIdentifier];
    uint64_t v9 = peripheralIdentifier;
    objc_super v10 = v8;
    uint64_t v11 = v10;
    if (v9 == v10)
    {
    }
    else
    {
      if ((v9 == 0) == (v10 != 0))
      {
        char v13 = 0;
        p_isa = (NSString *)&v10->super.isa;
LABEL_17:

        goto LABEL_18;
      }
      int v12 = [(NSUUID *)v9 isEqual:v10];

      if (!v12)
      {
        char v13 = 0;
LABEL_18:

        goto LABEL_19;
      }
    }
    hotspotSSID = self->_hotspotSSID;
    uint64_t v15 = [(ASMigrationDisplayItem *)v6 hotspotSSID];
    p_isa = hotspotSSID;
    uint64_t v17 = v15;
    uint64_t v9 = v17;
    if (p_isa == (NSString *)v17)
    {
      char v13 = 1;
    }
    else if ((p_isa == 0) == (v17 != 0))
    {
      char v13 = 0;
    }
    else
    {
      char v13 = [(NSString *)p_isa isEqual:v17];
    }

    goto LABEL_17;
  }
  char v13 = 1;
LABEL_20:

  return v13;
}

- (id)descriptionWithLevel:(int)a3
{
  CUAppendF();
  id v14 = 0;
  CUAppendF();
  id v4 = (__CFString *)v14;

  peripheralIdentifier = self->_peripheralIdentifier;
  if (peripheralIdentifier)
  {
    int v12 = peripheralIdentifier;
    CUAppendF();
    id v6 = v4;

    id v4 = v6;
  }
  hotspotSSID = self->_hotspotSSID;
  if (hotspotSSID)
  {
    char v13 = hotspotSSID;
    CUAppendF();
    id v8 = v4;

    id v4 = v8;
  }
  uint64_t v9 = &stru_26F86DD88;
  if (v4) {
    uint64_t v9 = v4;
  }
  objc_super v10 = v9;

  return v10;
}

- (NSUUID)peripheralIdentifier
{
  return self->_peripheralIdentifier;
}

- (void)setPeripheralIdentifier:(id)a3
{
}

- (NSString)hotspotSSID
{
  return self->_hotspotSSID;
}

- (void)setHotspotSSID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hotspotSSID, 0);

  objc_storeStrong((id *)&self->_peripheralIdentifier, 0);
}

@end