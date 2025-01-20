@interface CTCellularPlanTransferCrossPlatformRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CTCellularPlanTransferCrossPlatformRequest)initWithCoder:(id)a3;
- (CTCellularPlanTransferCrossPlatformRequest)initWithPhoneNumber:(id)a3 carrierName:(id)a4 mccMnc:(id)a5 gid1:(id)a6 gid2:(id)a7;
- (CTCellularPlanTransferCrossPlatformRequest)initWithPhoneNumber:(id)a3 carrierName:(id)a4 mccMnc:(id)a5 gid1:(id)a6 gid2:(id)a7 carrierID:(id)a8;
- (NSString)carrierID;
- (NSString)carrierName;
- (NSString)gid1;
- (NSString)gid2;
- (NSString)mccMnc;
- (NSString)phoneNumber;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CTCellularPlanTransferCrossPlatformRequest

- (CTCellularPlanTransferCrossPlatformRequest)initWithPhoneNumber:(id)a3 carrierName:(id)a4 mccMnc:(id)a5 gid1:(id)a6 gid2:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)CTCellularPlanTransferCrossPlatformRequest;
  v17 = [(CTCellularPlanTransferCrossPlatformRequest *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_phoneNumber, a3);
    objc_storeStrong((id *)&v18->_carrierName, a4);
    objc_storeStrong((id *)&v18->_mccMnc, a5);
    objc_storeStrong((id *)&v18->_gid1, a6);
    objc_storeStrong((id *)&v18->_gid2, a7);
  }

  return v18;
}

- (CTCellularPlanTransferCrossPlatformRequest)initWithPhoneNumber:(id)a3 carrierName:(id)a4 mccMnc:(id)a5 gid1:(id)a6 gid2:(id)a7 carrierID:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)CTCellularPlanTransferCrossPlatformRequest;
  v18 = [(CTCellularPlanTransferCrossPlatformRequest *)&v24 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_phoneNumber, a3);
    objc_storeStrong((id *)&v19->_carrierName, a4);
    objc_storeStrong((id *)&v19->_mccMnc, a5);
    objc_storeStrong((id *)&v19->_gid1, a6);
    objc_storeStrong((id *)&v19->_gid2, a7);
    objc_storeStrong((id *)&v19->_carrierID, a8);
  }

  return v19;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTCellularPlanTransferCrossPlatformRequest *)self phoneNumber];

  if (v4)
  {
    v5 = [(CTCellularPlanTransferCrossPlatformRequest *)self phoneNumber];
    [v3 appendFormat:@" phoneNumber=%@", v5];
  }
  v6 = [(CTCellularPlanTransferCrossPlatformRequest *)self carrierName];

  if (v6)
  {
    v7 = [(CTCellularPlanTransferCrossPlatformRequest *)self carrierName];
    [v3 appendFormat:@" carrierName=%@", v7];
  }
  v8 = [(CTCellularPlanTransferCrossPlatformRequest *)self mccMnc];

  if (v8)
  {
    v9 = [(CTCellularPlanTransferCrossPlatformRequest *)self mccMnc];
    [v3 appendFormat:@" mccMnc=%@", v9];
  }
  v10 = [(CTCellularPlanTransferCrossPlatformRequest *)self gid1];

  if (v10)
  {
    v11 = [(CTCellularPlanTransferCrossPlatformRequest *)self gid1];
    [v3 appendFormat:@" gid1=%@", v11];
  }
  v12 = [(CTCellularPlanTransferCrossPlatformRequest *)self gid2];

  if (v12)
  {
    id v13 = [(CTCellularPlanTransferCrossPlatformRequest *)self gid2];
    [v3 appendFormat:@" gid2=%@", v13];
  }
  id v14 = [(CTCellularPlanTransferCrossPlatformRequest *)self carrierID];

  if (v14)
  {
    id v15 = [(CTCellularPlanTransferCrossPlatformRequest *)self carrierID];
    [v3 appendFormat:@" carrierID=%@", v15];
  }
  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CTCellularPlanTransferCrossPlatformRequest *)a3;
  if (v4 == self)
  {
    char v17 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(CTCellularPlanTransferCrossPlatformRequest *)self phoneNumber];
      v6 = [(CTCellularPlanTransferCrossPlatformRequest *)v4 phoneNumber];
      if ([v5 isEqualToString:v6])
      {
        v7 = [(CTCellularPlanTransferCrossPlatformRequest *)self carrierName];
        v8 = [(CTCellularPlanTransferCrossPlatformRequest *)v4 carrierName];
        if ([v7 isEqualToString:v8])
        {
          v9 = [(CTCellularPlanTransferCrossPlatformRequest *)self mccMnc];
          v10 = [(CTCellularPlanTransferCrossPlatformRequest *)v4 mccMnc];
          if ([v9 isEqualToString:v10])
          {
            v11 = [(CTCellularPlanTransferCrossPlatformRequest *)self gid1];
            v12 = [(CTCellularPlanTransferCrossPlatformRequest *)v4 gid1];
            if ([v11 isEqualToString:v12])
            {
              id v21 = v11;
              uint64_t v13 = [(CTCellularPlanTransferCrossPlatformRequest *)self gid2];
              uint64_t v14 = [(CTCellularPlanTransferCrossPlatformRequest *)v4 gid2];
              id v22 = (void *)v13;
              id v15 = (void *)v13;
              id v16 = (void *)v14;
              if ([v15 isEqualToString:v14])
              {
                id v20 = [(CTCellularPlanTransferCrossPlatformRequest *)self carrierID];
                v19 = [(CTCellularPlanTransferCrossPlatformRequest *)v4 carrierID];
                char v17 = [v20 isEqualToString:v19];
              }
              else
              {
                char v17 = 0;
              }

              v11 = v21;
            }
            else
            {
              char v17 = 0;
            }
          }
          else
          {
            char v17 = 0;
          }
        }
        else
        {
          char v17 = 0;
        }
      }
      else
      {
        char v17 = 0;
      }
    }
    else
    {
      char v17 = 0;
    }
  }

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTCellularPlanTransferCrossPlatformRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CTCellularPlanTransferCrossPlatformRequest;
  v5 = [(CTCellularPlanTransferCrossPlatformRequest *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"phoneNumber"];
    phoneNumber = v5->_phoneNumber;
    v5->_phoneNumber = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"carrierName"];
    carrierName = v5->_carrierName;
    v5->_carrierName = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mccMnc"];
    mccMnc = v5->_mccMnc;
    v5->_mccMnc = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"gid1"];
    gid1 = v5->_gid1;
    v5->_gid1 = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"gid2"];
    gid2 = v5->_gid2;
    v5->_gid2 = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"carrierID"];
    carrierID = v5->_carrierID;
    v5->_carrierID = (NSString *)v16;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CTCellularPlanTransferCrossPlatformRequest *)self phoneNumber];
  [v4 encodeObject:v5 forKey:@"phoneNumber"];

  uint64_t v6 = [(CTCellularPlanTransferCrossPlatformRequest *)self carrierName];
  [v4 encodeObject:v6 forKey:@"carrierName"];

  v7 = [(CTCellularPlanTransferCrossPlatformRequest *)self mccMnc];
  [v4 encodeObject:v7 forKey:@"mccMnc"];

  uint64_t v8 = [(CTCellularPlanTransferCrossPlatformRequest *)self gid1];
  [v4 encodeObject:v8 forKey:@"gid1"];

  v9 = [(CTCellularPlanTransferCrossPlatformRequest *)self gid2];
  [v4 encodeObject:v9 forKey:@"gid2"];

  id v10 = [(CTCellularPlanTransferCrossPlatformRequest *)self carrierID];
  [v4 encodeObject:v10 forKey:@"carrierID"];
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (NSString)carrierName
{
  return self->_carrierName;
}

- (NSString)mccMnc
{
  return self->_mccMnc;
}

- (NSString)gid1
{
  return self->_gid1;
}

- (NSString)gid2
{
  return self->_gid2;
}

- (NSString)carrierID
{
  return self->_carrierID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carrierID, 0);
  objc_storeStrong((id *)&self->_gid2, 0);
  objc_storeStrong((id *)&self->_gid1, 0);
  objc_storeStrong((id *)&self->_mccMnc, 0);
  objc_storeStrong((id *)&self->_carrierName, 0);

  objc_storeStrong((id *)&self->_phoneNumber, 0);
}

@end