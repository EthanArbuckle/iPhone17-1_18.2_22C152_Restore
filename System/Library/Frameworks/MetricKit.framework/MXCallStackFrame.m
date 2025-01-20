@interface MXCallStackFrame
+ (BOOL)supportsSecureCoding;
- (MXCallStackFrame)initWithBinaryName:(id)a3 binaryUUID:(id)a4 address:(id)a5 binaryOffset:(id)a6 sampleCount:(id)a7 withDepth:(unint64_t)a8 subFrameArray:(id)a9;
- (MXCallStackFrame)initWithCoder:(id)a3;
- (NSArray)subFrames;
- (NSNumber)address;
- (NSNumber)offsetInBinary;
- (NSNumber)sampleCount;
- (NSString)binaryName;
- (NSUUID)binaryUUID;
- (id)toDictionary;
- (void)encodeWithCoder:(id)a3;
- (void)setSubFrames:(id)a3;
@end

@implementation MXCallStackFrame

- (MXCallStackFrame)initWithBinaryName:(id)a3 binaryUUID:(id)a4 address:(id)a5 binaryOffset:(id)a6 sampleCount:(id)a7 withDepth:(unint64_t)a8 subFrameArray:(id)a9
{
  id v25 = a3;
  id v24 = a4;
  id v23 = a5;
  id v22 = a6;
  id v16 = a7;
  id v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)MXCallStackFrame;
  v18 = [(MXCallStackFrame *)&v26 init];
  p_isa = (id *)&v18->super.isa;
  if (!v18) {
    goto LABEL_5;
  }
  if (a8 <= 0x82)
  {
    objc_storeStrong((id *)&v18->_binaryName, a3);
    objc_storeStrong(p_isa + 3, a4);
    objc_storeStrong(p_isa + 2, a5);
    objc_storeStrong(p_isa + 4, a6);
    objc_storeStrong(p_isa + 5, a7);
    objc_storeStrong(p_isa + 6, a9);
LABEL_5:
    v20 = p_isa;
    goto LABEL_6;
  }
  v20 = 0;
LABEL_6:

  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  binaryName = self->_binaryName;
  id v5 = a3;
  [v5 encodeObject:binaryName forKey:@"binaryName"];
  [v5 encodeObject:self->_binaryUUID forKey:@"binaryUUID"];
  [v5 encodeObject:self->_address forKey:@"address"];
  [v5 encodeObject:self->_offsetInBinary forKey:@"offsetIntoBinaryTextSegment"];
  [v5 encodeObject:self->_sampleCount forKey:@"sampleCount"];
  [v5 encodeObject:self->_subFrames forKey:@"subFrames"];
}

- (MXCallStackFrame)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)MXCallStackFrame;
  id v5 = [(MXCallStackFrame *)&v22 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"binaryName"];
    binaryName = v5->_binaryName;
    v5->_binaryName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"binaryUUID"];
    binaryUUID = v5->_binaryUUID;
    v5->_binaryUUID = (NSUUID *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"address"];
    address = v5->_address;
    v5->_address = (NSNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"offsetIntoBinaryTextSegment"];
    offsetInBinary = v5->_offsetInBinary;
    v5->_offsetInBinary = (NSNumber *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sampleCount"];
    sampleCount = v5->_sampleCount;
    v5->_sampleCount = (NSNumber *)v14;

    id v16 = (void *)MEMORY[0x263EFFA08];
    uint64_t v17 = objc_opt_class();
    v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"subFrames"];
    subFrames = v5->_subFrames;
    v5->_subFrames = (NSArray *)v19;
  }
  return v5;
}

- (id)toDictionary
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = v3;
  sampleCount = self->_sampleCount;
  if (sampleCount) {
    [v3 setObject:sampleCount forKey:@"sampleCount"];
  }
  binaryName = self->_binaryName;
  if (binaryName) {
    [v4 setObject:binaryName forKey:@"binaryName"];
  }
  address = self->_address;
  if (address) {
    [v4 setObject:address forKey:@"address"];
  }
  binaryUUID = self->_binaryUUID;
  if (binaryUUID)
  {
    v9 = [(NSUUID *)binaryUUID UUIDString];
    [v4 setObject:v9 forKey:@"binaryUUID"];
  }
  offsetInBinary = self->_offsetInBinary;
  if (offsetInBinary) {
    [v4 setObject:offsetInBinary forKey:@"offsetIntoBinaryTextSegment"];
  }
  id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v12 = self->_subFrames;
  uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "toDictionary", (void)v19);
        [v11 addObject:v17];
      }
      uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }

  if ([v11 count]) {
    [v4 setObject:v11 forKey:@"subFrames"];
  }

  return v4;
}

- (NSString)binaryName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSNumber)address
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)binaryUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (NSNumber)offsetInBinary
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (NSNumber)sampleCount
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (NSArray)subFrames
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSubFrames:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subFrames, 0);
  objc_storeStrong((id *)&self->_sampleCount, 0);
  objc_storeStrong((id *)&self->_offsetInBinary, 0);
  objc_storeStrong((id *)&self->_binaryUUID, 0);
  objc_storeStrong((id *)&self->_address, 0);

  objc_storeStrong((id *)&self->_binaryName, 0);
}

@end