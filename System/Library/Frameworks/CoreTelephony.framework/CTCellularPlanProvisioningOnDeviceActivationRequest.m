@interface CTCellularPlanProvisioningOnDeviceActivationRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)isESim;
- (BOOL)isEqual:(id)a3;
- (BOOL)useDS;
- (CTCellularPlanProvisioningOnDeviceActivationRequest)init;
- (CTCellularPlanProvisioningOnDeviceActivationRequest)initWithCoder:(id)a3;
- (CTCellularPlanProvisioningOnDeviceActivationRequest)initWithDetails:(id)a3 installIccid:(id)a4 sourceIccid:(id)a5 unusableIccid:(id)a6 phoneNumber:(id)a7 mcc:(id)a8 mnc:(id)a9 gid1:(id)a10 gid2:(id)a11 smdp:(id)a12 useDS:(BOOL)a13 esim:(BOOL)a14;
- (CTCellularPlanProvisioningOnDeviceActivationRequest)initWithDetails:(id)a3 installIccid:(id)a4 sourceIccid:(id)a5 unusableIccid:(id)a6 phoneNumber:(id)a7 mcc:(id)a8 mnc:(id)a9 gid1:(id)a10 gid2:(id)a11 smdp:(id)a12 useDS:(BOOL)a13 esim:(BOOL)a14 flowType:(id)a15;
- (CTCellularPlanProvisioningOnDeviceActivationRequest)initWithEid:(id)a3 installIccid:(id)a4 sourceIccid:(id)a5 phoneNumber:(id)a6 mcc:(id)a7 mnc:(id)a8 gid1:(id)a9 gid2:(id)a10 smdp:(id)a11 useDS:(BOOL)a12 esim:(BOOL)a13;
- (NSString)eid;
- (NSString)flowType;
- (NSString)gid1;
- (NSString)gid2;
- (NSString)iccid;
- (NSString)mcc;
- (NSString)mnc;
- (NSString)phoneNumber;
- (NSString)smdpAddress;
- (NSString)sourceIccid;
- (NSString)unusableIccid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setEid:(id)a3;
- (void)setFlowType:(id)a3;
- (void)setGid1:(id)a3;
- (void)setGid2:(id)a3;
- (void)setIccid:(id)a3;
- (void)setIsESim:(BOOL)a3;
- (void)setMcc:(id)a3;
- (void)setMnc:(id)a3;
- (void)setPhoneNumber:(id)a3;
- (void)setSmdpAddress:(id)a3;
- (void)setSourceIccid:(id)a3;
- (void)setUnusableIccid:(id)a3;
- (void)setUseDS:(BOOL)a3;
@end

@implementation CTCellularPlanProvisioningOnDeviceActivationRequest

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"\n<%@ %p", objc_opt_class(), self];
  v4 = [(CTCellularPlanProvisioningOnDeviceActivationRequest *)self eid];
  [v3 appendFormat:@"\n\t EID          = %@", v4];

  v5 = [(CTCellularPlanProvisioningOnDeviceActivationRequest *)self iccid];
  [v3 appendFormat:@"\n\t ICCID        = %@", v5];

  v6 = [(CTCellularPlanProvisioningOnDeviceActivationRequest *)self sourceIccid];
  [v3 appendFormat:@"\n\t Source ICCID = %@", v6];

  v7 = [(CTCellularPlanProvisioningOnDeviceActivationRequest *)self unusableIccid];
  [v3 appendFormat:@"\n\t Unusable ICCID = %@", v7];

  v8 = [(CTCellularPlanProvisioningOnDeviceActivationRequest *)self phoneNumber];
  [v3 appendFormat:@"\n\t Phone Number = %@", v8];

  v9 = [(CTCellularPlanProvisioningOnDeviceActivationRequest *)self mcc];
  [v3 appendFormat:@"\n\t MCC          = %@", v9];

  v10 = [(CTCellularPlanProvisioningOnDeviceActivationRequest *)self mnc];
  [v3 appendFormat:@"\n\t MNC          = %@", v10];

  v11 = [(CTCellularPlanProvisioningOnDeviceActivationRequest *)self gid1];
  [v3 appendFormat:@"\n\t GID1         = %@", v11];

  v12 = [(CTCellularPlanProvisioningOnDeviceActivationRequest *)self gid2];
  [v3 appendFormat:@"\n\t GID2         = %@", v12];

  v13 = [(CTCellularPlanProvisioningOnDeviceActivationRequest *)self smdpAddress];
  [v3 appendFormat:@"\n\t SMDP Address = %@", v13];

  if ([(CTCellularPlanProvisioningOnDeviceActivationRequest *)self useDS]) {
    v14 = @"YES";
  }
  else {
    v14 = @"NO";
  }
  [v3 appendFormat:@"\n\t DS           = %@", v14];
  if ([(CTCellularPlanProvisioningOnDeviceActivationRequest *)self isESim]) {
    v15 = @"YES";
  }
  else {
    v15 = @"NO";
  }
  [v3 appendFormat:@"\n\t ESIM         = %@", v15];
  v16 = [(CTCellularPlanProvisioningOnDeviceActivationRequest *)self flowType];
  [v3 appendFormat:@"\n\t Flow Type    = %@", v16];

  [v3 appendString:@"\n\t>"];

  return v3;
}

- (CTCellularPlanProvisioningOnDeviceActivationRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)CTCellularPlanProvisioningOnDeviceActivationRequest;
  result = [(CTCellularPlanProvisioningOnDeviceActivationRequest *)&v3 init];
  if (result) {
    *(_WORD *)&result->_useDS = 1;
  }
  return result;
}

- (CTCellularPlanProvisioningOnDeviceActivationRequest)initWithEid:(id)a3 installIccid:(id)a4 sourceIccid:(id)a5 phoneNumber:(id)a6 mcc:(id)a7 mnc:(id)a8 gid1:(id)a9 gid2:(id)a10 smdp:(id)a11 useDS:(BOOL)a12 esim:(BOOL)a13
{
  id v19 = a3;
  id v20 = a4;
  id v21 = a5;
  id v22 = a6;
  id v23 = a7;
  id v24 = a8;
  id v25 = a9;
  id v26 = a10;
  id v27 = a11;
  v48.receiver = self;
  v48.super_class = (Class)CTCellularPlanProvisioningOnDeviceActivationRequest;
  v28 = [(CTCellularPlanProvisioningOnDeviceActivationRequest *)&v48 init];
  if (v28)
  {
    uint64_t v29 = [v20 copy];
    iccid = v28->_iccid;
    v28->_iccid = (NSString *)v29;

    uint64_t v31 = [v19 copy];
    eid = v28->_eid;
    v28->_eid = (NSString *)v31;

    uint64_t v33 = [v22 copy];
    phoneNumber = v28->_phoneNumber;
    v28->_phoneNumber = (NSString *)v33;

    uint64_t v35 = [v21 copy];
    sourceIccid = v28->_sourceIccid;
    v28->_sourceIccid = (NSString *)v35;

    uint64_t v37 = [v23 copy];
    mcc = v28->_mcc;
    v28->_mcc = (NSString *)v37;

    uint64_t v39 = [v24 copy];
    mnc = v28->_mnc;
    v28->_mnc = (NSString *)v39;

    uint64_t v41 = [v25 copy];
    gid1 = v28->_gid1;
    v28->_gid1 = (NSString *)v41;

    uint64_t v43 = [v26 copy];
    gid2 = v28->_gid2;
    v28->_gid2 = (NSString *)v43;

    uint64_t v45 = [v27 copy];
    smdpAddress = v28->_smdpAddress;
    v28->_smdpAddress = (NSString *)v45;

    v28->_useDS = a12;
    v28->_isESim = a13;
  }

  return v28;
}

- (CTCellularPlanProvisioningOnDeviceActivationRequest)initWithDetails:(id)a3 installIccid:(id)a4 sourceIccid:(id)a5 unusableIccid:(id)a6 phoneNumber:(id)a7 mcc:(id)a8 mnc:(id)a9 gid1:(id)a10 gid2:(id)a11 smdp:(id)a12 useDS:(BOOL)a13 esim:(BOOL)a14
{
  id v19 = a3;
  id v51 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a7;
  id v23 = a8;
  id v24 = a9;
  id v25 = a10;
  id v26 = a11;
  id v27 = a12;
  v52.receiver = self;
  v52.super_class = (Class)CTCellularPlanProvisioningOnDeviceActivationRequest;
  v28 = [(CTCellularPlanProvisioningOnDeviceActivationRequest *)&v52 init];
  if (v28)
  {
    uint64_t v29 = [v51 copy];
    iccid = v28->_iccid;
    v28->_iccid = (NSString *)v29;

    uint64_t v31 = [v19 copy];
    eid = v28->_eid;
    v28->_eid = (NSString *)v31;

    uint64_t v33 = [v22 copy];
    phoneNumber = v28->_phoneNumber;
    v28->_phoneNumber = (NSString *)v33;

    uint64_t v35 = [v20 copy];
    sourceIccid = v28->_sourceIccid;
    v28->_sourceIccid = (NSString *)v35;

    uint64_t v37 = [v21 copy];
    unusableIccid = v28->_unusableIccid;
    v28->_unusableIccid = (NSString *)v37;

    uint64_t v39 = [v23 copy];
    mcc = v28->_mcc;
    v28->_mcc = (NSString *)v39;

    uint64_t v41 = [v24 copy];
    mnc = v28->_mnc;
    v28->_mnc = (NSString *)v41;

    uint64_t v43 = [v25 copy];
    gid1 = v28->_gid1;
    v28->_gid1 = (NSString *)v43;

    uint64_t v45 = [v26 copy];
    gid2 = v28->_gid2;
    v28->_gid2 = (NSString *)v45;

    uint64_t v47 = [v27 copy];
    smdpAddress = v28->_smdpAddress;
    v28->_smdpAddress = (NSString *)v47;

    v28->_useDS = a13;
    v28->_isESim = a14;
  }

  return v28;
}

- (CTCellularPlanProvisioningOnDeviceActivationRequest)initWithDetails:(id)a3 installIccid:(id)a4 sourceIccid:(id)a5 unusableIccid:(id)a6 phoneNumber:(id)a7 mcc:(id)a8 mnc:(id)a9 gid1:(id)a10 gid2:(id)a11 smdp:(id)a12 useDS:(BOOL)a13 esim:(BOOL)a14 flowType:(id)a15
{
  id v20 = a3;
  id v21 = a4;
  id v53 = a5;
  id v52 = a6;
  id v22 = a7;
  id v23 = a8;
  id v24 = a9;
  id v25 = a10;
  id v26 = a11;
  id v27 = a12;
  id v28 = a15;
  v54.receiver = self;
  v54.super_class = (Class)CTCellularPlanProvisioningOnDeviceActivationRequest;
  uint64_t v29 = [(CTCellularPlanProvisioningOnDeviceActivationRequest *)&v54 init];
  if (v29)
  {
    uint64_t v30 = [v21 copy];
    iccid = v29->_iccid;
    v29->_iccid = (NSString *)v30;

    uint64_t v32 = [v20 copy];
    eid = v29->_eid;
    v29->_eid = (NSString *)v32;

    uint64_t v34 = [v22 copy];
    phoneNumber = v29->_phoneNumber;
    v29->_phoneNumber = (NSString *)v34;

    uint64_t v36 = [v53 copy];
    sourceIccid = v29->_sourceIccid;
    v29->_sourceIccid = (NSString *)v36;

    uint64_t v38 = [v52 copy];
    unusableIccid = v29->_unusableIccid;
    v29->_unusableIccid = (NSString *)v38;

    uint64_t v40 = [v23 copy];
    mcc = v29->_mcc;
    v29->_mcc = (NSString *)v40;

    uint64_t v42 = [v24 copy];
    mnc = v29->_mnc;
    v29->_mnc = (NSString *)v42;

    uint64_t v44 = [v25 copy];
    gid1 = v29->_gid1;
    v29->_gid1 = (NSString *)v44;

    uint64_t v46 = [v26 copy];
    gid2 = v29->_gid2;
    v29->_gid2 = (NSString *)v46;

    uint64_t v48 = [v27 copy];
    smdpAddress = v29->_smdpAddress;
    v29->_smdpAddress = (NSString *)v48;

    v29->_useDS = a13;
    v29->_isESim = a14;
    objc_storeStrong((id *)&v29->_flowType, a15);
  }

  return v29;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v18 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v4 = (void *)[(NSString *)self->_eid copy];
  v5 = (void *)[(NSString *)self->_iccid copy];
  v17 = (void *)[(NSString *)self->_sourceIccid copy];
  v16 = (void *)[(NSString *)self->_unusableIccid copy];
  v6 = (void *)[(NSString *)self->_phoneNumber copy];
  v7 = (void *)[(NSString *)self->_mcc copy];
  v15 = (void *)[(NSString *)self->_mnc copy];
  v8 = (void *)[(NSString *)self->_gid1 copy];
  v9 = (void *)[(NSString *)self->_gid2 copy];
  v10 = (void *)[(NSString *)self->_smdpAddress copy];
  __int16 v11 = *(_WORD *)&self->_useDS;
  v12 = (void *)[(NSString *)self->_flowType copy];
  LOWORD(v14) = v11;
  id v19 = objc_msgSend(v18, "initWithDetails:installIccid:sourceIccid:unusableIccid:phoneNumber:mcc:mnc:gid1:gid2:smdp:useDS:esim:flowType:", v4, v5, v17, v16, v6, v7, v15, v8, v9, v10, v14, v12);

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CTCellularPlanProvisioningOnDeviceActivationRequest *)a3;
  if (self == v4)
  {
    char v30 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      eid = self->_eid;
      v6 = [(CTCellularPlanProvisioningOnDeviceActivationRequest *)v4 eid];
      if ([(NSString *)eid isEqualToString:v6])
      {
        iccid = self->_iccid;
        v8 = [(CTCellularPlanProvisioningOnDeviceActivationRequest *)v4 iccid];
        if ([(NSString *)iccid isEqualToString:v8])
        {
          sourceIccid = self->_sourceIccid;
          v10 = [(CTCellularPlanProvisioningOnDeviceActivationRequest *)v4 sourceIccid];
          if ([(NSString *)sourceIccid isEqualToString:v10])
          {
            unusableIccid = self->_unusableIccid;
            v12 = [(CTCellularPlanProvisioningOnDeviceActivationRequest *)v4 unusableIccid];
            if ([(NSString *)unusableIccid isEqualToString:v12])
            {
              phoneNumber = self->_phoneNumber;
              uint64_t v14 = [(CTCellularPlanProvisioningOnDeviceActivationRequest *)v4 phoneNumber];
              if ([(NSString *)phoneNumber isEqualToString:v14])
              {
                mcc = self->_mcc;
                v16 = [(CTCellularPlanProvisioningOnDeviceActivationRequest *)v4 mcc];
                if ([(NSString *)mcc isEqualToString:v16])
                {
                  mnc = self->_mnc;
                  v18 = [(CTCellularPlanProvisioningOnDeviceActivationRequest *)v4 mnc];
                  if ([(NSString *)mnc isEqualToString:v18])
                  {
                    gid1 = self->_gid1;
                    uint64_t v20 = [(CTCellularPlanProvisioningOnDeviceActivationRequest *)v4 gid1];
                    id v21 = gid1;
                    id v22 = (void *)v20;
                    if ([(NSString *)v21 isEqualToString:v20])
                    {
                      uint64_t v35 = v22;
                      gid2 = self->_gid2;
                      uint64_t v36 = [(CTCellularPlanProvisioningOnDeviceActivationRequest *)v4 gid2];
                      if (-[NSString isEqualToString:](gid2, "isEqualToString:"))
                      {
                        smdpAddress = self->_smdpAddress;
                        uint64_t v25 = [(CTCellularPlanProvisioningOnDeviceActivationRequest *)v4 smdpAddress];
                        id v26 = smdpAddress;
                        id v27 = (void *)v25;
                        if ([(NSString *)v26 isEqualToString:v25])
                        {
                          uint64_t v34 = v27;
                          BOOL v28 = [(CTCellularPlanProvisioningOnDeviceActivationRequest *)self useDS];
                          if (v28 == [(CTCellularPlanProvisioningOnDeviceActivationRequest *)v4 useDS]
                            && (BOOL v29 = [(CTCellularPlanProvisioningOnDeviceActivationRequest *)self isESim],
                                v29 == [(CTCellularPlanProvisioningOnDeviceActivationRequest *)v4 isESim]))
                          {
                            flowType = self->_flowType;
                            uint64_t v32 = [(CTCellularPlanProvisioningOnDeviceActivationRequest *)v4 flowType];
                            char v30 = [(NSString *)flowType isEqualToString:v32];
                          }
                          else
                          {
                            char v30 = 0;
                          }
                          id v27 = v34;
                        }
                        else
                        {
                          char v30 = 0;
                        }
                      }
                      else
                      {
                        char v30 = 0;
                      }
                      id v22 = v35;
                    }
                    else
                    {
                      char v30 = 0;
                    }
                  }
                  else
                  {
                    char v30 = 0;
                  }
                }
                else
                {
                  char v30 = 0;
                }
              }
              else
              {
                char v30 = 0;
              }
            }
            else
            {
              char v30 = 0;
            }
          }
          else
          {
            char v30 = 0;
          }
        }
        else
        {
          char v30 = 0;
        }
      }
      else
      {
        char v30 = 0;
      }
    }
    else
    {
      char v30 = 0;
    }
  }

  return v30;
}

- (void)encodeWithCoder:(id)a3
{
  eid = self->_eid;
  id v5 = a3;
  [v5 encodeObject:eid forKey:@"eid"];
  [v5 encodeObject:self->_iccid forKey:@"iccid"];
  [v5 encodeObject:self->_sourceIccid forKey:@"sourceIccid"];
  [v5 encodeObject:self->_unusableIccid forKey:@"unusableIccid"];
  [v5 encodeObject:self->_phoneNumber forKey:@"phoneNumber"];
  [v5 encodeObject:self->_mcc forKey:@"mcc"];
  [v5 encodeObject:self->_mnc forKey:@"mnc"];
  [v5 encodeObject:self->_gid1 forKey:@"gid1"];
  [v5 encodeObject:self->_gid2 forKey:@"gid2"];
  [v5 encodeObject:self->_smdpAddress forKey:@"smdpAddress"];
  [v5 encodeBool:self->_useDS forKey:@"useDS"];
  [v5 encodeBool:self->_isESim forKey:@"isESim"];
  [v5 encodeObject:self->_flowType forKey:@"flowType"];
}

- (CTCellularPlanProvisioningOnDeviceActivationRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CTCellularPlanProvisioningOnDeviceActivationRequest;
  id v5 = [(CTCellularPlanProvisioningOnDeviceActivationRequest *)&v29 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"eid"];
    eid = v5->_eid;
    v5->_eid = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"iccid"];
    iccid = v5->_iccid;
    v5->_iccid = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sourceIccid"];
    sourceIccid = v5->_sourceIccid;
    v5->_sourceIccid = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"unusableIccid"];
    unusableIccid = v5->_unusableIccid;
    v5->_unusableIccid = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"phoneNumber"];
    phoneNumber = v5->_phoneNumber;
    v5->_phoneNumber = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mcc"];
    mcc = v5->_mcc;
    v5->_mcc = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mnc"];
    mnc = v5->_mnc;
    v5->_mnc = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"gid1"];
    gid1 = v5->_gid1;
    v5->_gid1 = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"gid2"];
    gid2 = v5->_gid2;
    v5->_gid2 = (NSString *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"smdpAddress"];
    smdpAddress = v5->_smdpAddress;
    v5->_smdpAddress = (NSString *)v24;

    v5->_useDS = [v4 decodeBoolForKey:@"useDS"];
    v5->_isESim = [v4 decodeBoolForKey:@"isESim"];
    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"flowType"];
    flowType = v5->_flowType;
    v5->_flowType = (NSString *)v26;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)eid
{
  return self->_eid;
}

- (void)setEid:(id)a3
{
}

- (NSString)iccid
{
  return self->_iccid;
}

- (void)setIccid:(id)a3
{
}

- (NSString)sourceIccid
{
  return self->_sourceIccid;
}

- (void)setSourceIccid:(id)a3
{
}

- (NSString)unusableIccid
{
  return self->_unusableIccid;
}

- (void)setUnusableIccid:(id)a3
{
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
}

- (NSString)mcc
{
  return self->_mcc;
}

- (void)setMcc:(id)a3
{
}

- (NSString)mnc
{
  return self->_mnc;
}

- (void)setMnc:(id)a3
{
}

- (NSString)gid1
{
  return self->_gid1;
}

- (void)setGid1:(id)a3
{
}

- (NSString)gid2
{
  return self->_gid2;
}

- (void)setGid2:(id)a3
{
}

- (NSString)smdpAddress
{
  return self->_smdpAddress;
}

- (void)setSmdpAddress:(id)a3
{
}

- (BOOL)useDS
{
  return self->_useDS;
}

- (void)setUseDS:(BOOL)a3
{
  self->_useDS = a3;
}

- (BOOL)isESim
{
  return self->_isESim;
}

- (void)setIsESim:(BOOL)a3
{
  self->_isESim = a3;
}

- (NSString)flowType
{
  return self->_flowType;
}

- (void)setFlowType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flowType, 0);
  objc_storeStrong((id *)&self->_smdpAddress, 0);
  objc_storeStrong((id *)&self->_gid2, 0);
  objc_storeStrong((id *)&self->_gid1, 0);
  objc_storeStrong((id *)&self->_mnc, 0);
  objc_storeStrong((id *)&self->_mcc, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_unusableIccid, 0);
  objc_storeStrong((id *)&self->_sourceIccid, 0);
  objc_storeStrong((id *)&self->_iccid, 0);

  objc_storeStrong((id *)&self->_eid, 0);
}

@end