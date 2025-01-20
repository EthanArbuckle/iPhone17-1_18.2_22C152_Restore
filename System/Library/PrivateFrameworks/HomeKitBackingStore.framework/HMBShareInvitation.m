@interface HMBShareInvitation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CKDeviceToDeviceShareInvitationToken)token;
- (HMBCloudZoneID)cloudZoneID;
- (HMBShareInvitation)initWithCoder:(id)a3;
- (HMBShareInvitation)initWithURL:(id)a3 token:(id)a4 context:(id)a5 cloudZoneID:(id)a6;
- (HMBShareInvitation)initWithURL:(id)a3 token:(id)a4 context:(id)a5 cloudZoneID:(id)a6 dateCreated:(id)a7;
- (HMBShareInvitationContext)context;
- (NSDate)dateCreated;
- (NSURL)shareURL;
- (id)attributeDescriptions;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMBShareInvitation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_shareURL, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_cloudZoneID, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (CKDeviceToDeviceShareInvitationToken)token
{
  return self->_token;
}

- (NSURL)shareURL
{
  return self->_shareURL;
}

- (NSDate)dateCreated
{
  return self->_dateCreated;
}

- (HMBCloudZoneID)cloudZoneID
{
  return self->_cloudZoneID;
}

- (HMBShareInvitationContext)context
{
  return self->_context;
}

- (HMBShareInvitation)initWithCoder:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMBUI.u"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMBUI.t"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMBUI.c"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMBUI.czi"];
  uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMBUI.dc"];
  v10 = (void *)v9;
  if (v5 && v6 && v7 && v8 && v9)
  {
    v11 = [(HMBShareInvitation *)self initWithURL:v5 token:v6 context:v7 cloudZoneID:v8 dateCreated:v9];
    v12 = v11;
  }
  else
  {
    v13 = (void *)MEMORY[0x1D944CB30]();
    v11 = self;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = HMFGetLogIdentifier();
      int v17 = 138544642;
      v18 = v15;
      __int16 v19 = 2112;
      v20 = v5;
      __int16 v21 = 2112;
      v22 = v6;
      __int16 v23 = 2112;
      v24 = v7;
      __int16 v25 = 2112;
      v26 = v8;
      __int16 v27 = 2112;
      v28 = v10;
      _os_log_impl(&dword_1D4693000, v14, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded shareURL: %@ token: %@ context: %@ cloudZoneID: %@ dateCreated: %@", (uint8_t *)&v17, 0x3Eu);
    }
    v12 = 0;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMBShareInvitation *)self shareURL];
  [v4 encodeObject:v5 forKey:@"HMBUI.u"];

  v6 = [(HMBShareInvitation *)self token];
  [v4 encodeObject:v6 forKey:@"HMBUI.t"];

  v7 = [(HMBShareInvitation *)self context];
  [v4 encodeObject:v7 forKey:@"HMBUI.c"];

  v8 = [(HMBShareInvitation *)self cloudZoneID];
  [v4 encodeObject:v8 forKey:@"HMBUI.czi"];

  id v9 = [(HMBShareInvitation *)self dateCreated];
  [v4 encodeObject:v9 forKey:@"HMBUI.dc"];
}

- (unint64_t)hash
{
  v3 = [(HMBShareInvitation *)self shareURL];
  uint64_t v4 = [v3 hash];

  v5 = [(HMBShareInvitation *)self token];
  uint64_t v6 = [v5 hash] ^ v4;

  v7 = [(HMBShareInvitation *)self context];
  uint64_t v8 = [v7 hash];

  id v9 = [(HMBShareInvitation *)self cloudZoneID];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];

  v11 = [(HMBShareInvitation *)self dateCreated];
  unint64_t v12 = v10 ^ [v11 hash];

  return v12;
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
  if (v6)
  {
    v7 = [(HMBShareInvitation *)self shareURL];
    uint64_t v8 = [v6 shareURL];
    if ([v7 isEqual:v8])
    {
      id v9 = [(HMBShareInvitation *)self token];
      uint64_t v10 = [v6 token];
      if ([v9 isEqual:v10])
      {
        v11 = [(HMBShareInvitation *)self context];
        unint64_t v12 = [v6 context];
        if ([v11 isEqual:v12])
        {
          v13 = [(HMBShareInvitation *)self cloudZoneID];
          __int16 v19 = [v6 cloudZoneID];
          if (objc_msgSend(v13, "isEqual:"))
          {
            int v17 = [(HMBShareInvitation *)self dateCreated];
            [v6 dateCreated];
            v14 = v18 = v13;
            char v15 = [v17 isEqualToDate:v14];

            v13 = v18;
          }
          else
          {
            char v15 = 0;
          }
        }
        else
        {
          char v15 = 0;
        }
      }
      else
      {
        char v15 = 0;
      }
    }
    else
    {
      char v15 = 0;
    }
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

- (id)attributeDescriptions
{
  v20[5] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  __int16 v19 = [(HMBShareInvitation *)self shareURL];
  id v4 = (void *)[v3 initWithName:@"Share URL" value:v19];
  v20[0] = v4;
  id v5 = objc_alloc(MEMORY[0x1E4F653F8]);
  id v6 = [(HMBShareInvitation *)self token];
  v7 = (void *)[v5 initWithName:@"Token" value:v6];
  v20[1] = v7;
  id v8 = objc_alloc(MEMORY[0x1E4F653F8]);
  id v9 = [(HMBShareInvitation *)self context];
  uint64_t v10 = (void *)[v8 initWithName:@"Context" value:v9];
  v20[2] = v10;
  id v11 = objc_alloc(MEMORY[0x1E4F653F8]);
  unint64_t v12 = [(HMBShareInvitation *)self cloudZoneID];
  v13 = (void *)[v11 initWithName:@"Cloud Zone ID" value:v12];
  v20[3] = v13;
  id v14 = objc_alloc(MEMORY[0x1E4F653F8]);
  char v15 = [(HMBShareInvitation *)self dateCreated];
  v16 = (void *)[v14 initWithName:@"Date Created" value:v15];
  v20[4] = v16;
  int v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:5];

  return v17;
}

- (HMBShareInvitation)initWithURL:(id)a3 token:(id)a4 context:(id)a5 cloudZoneID:(id)a6 dateCreated:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HMBShareInvitation;
  int v17 = [(HMBShareInvitation *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_shareURL, a3);
    objc_storeStrong((id *)&v18->_token, a4);
    objc_storeStrong((id *)&v18->_context, a5);
    objc_storeStrong((id *)&v18->_cloudZoneID, a6);
    objc_storeStrong((id *)&v18->_dateCreated, a7);
  }

  return v18;
}

- (HMBShareInvitation)initWithURL:(id)a3 token:(id)a4 context:(id)a5 cloudZoneID:(id)a6
{
  uint64_t v10 = (void *)MEMORY[0x1E4F1C9C8];
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = [v10 date];
  id v16 = [(HMBShareInvitation *)self initWithURL:v14 token:v13 context:v12 cloudZoneID:v11 dateCreated:v15];

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end