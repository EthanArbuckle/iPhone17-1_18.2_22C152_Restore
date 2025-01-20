@interface HMDDataStreamFragment
- (BOOL)isEqual:(id)a3;
- (BOOL)isInitial;
- (HMDDataStreamFragment)initWithData:(id)a3 sequenceNumber:(id)a4 type:(id)a5;
- (NSData)data;
- (NSNumber)sequenceNumber;
- (NSString)type;
- (id)attributeDescriptions;
- (unint64_t)hash;
@end

@implementation HMDDataStreamFragment

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_sequenceNumber, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

- (NSString)type
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSNumber)sequenceNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)hash
{
  v3 = [(HMDDataStreamFragment *)self data];
  uint64_t v4 = [v3 hash];

  v5 = [(HMDDataStreamFragment *)self sequenceNumber];
  uint64_t v6 = [v5 hash] ^ v4;

  v7 = [(HMDDataStreamFragment *)self type];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  v7 = v6;
  if (v6)
  {
    unint64_t v8 = [v6 data];
    v9 = [(HMDDataStreamFragment *)self data];
    if ([v8 isEqualToData:v9])
    {
      v10 = [v7 sequenceNumber];
      v11 = [(HMDDataStreamFragment *)self sequenceNumber];
      if ([v10 isEqualToNumber:v11])
      {
        v12 = [v7 type];
        v13 = [(HMDDataStreamFragment *)self type];
        char v14 = [v12 isEqualToString:v13];
      }
      else
      {
        char v14 = 0;
      }
    }
    else
    {
      char v14 = 0;
    }
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

- (BOOL)isInitial
{
  v2 = [(HMDDataStreamFragment *)self sequenceNumber];
  BOOL v3 = [v2 unsignedLongLongValue] == 1;

  return v3;
}

- (id)attributeDescriptions
{
  v16[3] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  id v4 = NSNumber;
  v5 = [(HMDDataStreamFragment *)self data];
  id v6 = objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v5, "length"));
  v7 = (void *)[v3 initWithName:@"Data Length" value:v6];
  id v8 = objc_alloc(MEMORY[0x263F424F8]);
  v9 = [(HMDDataStreamFragment *)self sequenceNumber];
  v10 = (void *)[v8 initWithName:@"Sequence Number" value:v9];
  v16[1] = v10;
  id v11 = objc_alloc(MEMORY[0x263F424F8]);
  v12 = [(HMDDataStreamFragment *)self type];
  v13 = (void *)[v11 initWithName:@"Type" value:v12];
  v16[2] = v13;
  char v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:3];

  return v14;
}

- (HMDDataStreamFragment)initWithData:(id)a3 sequenceNumber:(id)a4 type:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v10)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  v12 = v11;
  if (!v11)
  {
LABEL_9:
    v20 = (HMDBulletinBoardNotification *)_HMFPreconditionFailure();
    [(HMDBulletinBoardNotification *)v20 .cxx_destruct];
    return result;
  }
  v22.receiver = self;
  v22.super_class = (Class)HMDDataStreamFragment;
  v13 = [(HMDDataStreamFragment *)&v22 init];
  char v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_data, a3);
    uint64_t v15 = [v10 copy];
    sequenceNumber = v14->_sequenceNumber;
    v14->_sequenceNumber = (NSNumber *)v15;

    uint64_t v17 = [v12 copy];
    type = v14->_type;
    v14->_type = (NSString *)v17;
  }
  return v14;
}

@end