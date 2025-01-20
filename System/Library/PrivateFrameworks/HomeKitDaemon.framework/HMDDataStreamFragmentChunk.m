@interface HMDDataStreamFragmentChunk
- (BOOL)isEqual:(id)a3;
- (BOOL)isLast;
- (HMDDataStreamFragmentChunk)initWithData:(id)a3 sequenceNumber:(id)a4 fragmentSequenceNumber:(id)a5 type:(id)a6 isLast:(BOOL)a7;
- (HMDDataStreamFragmentChunk)initWithDictionaryRepresentation:(id)a3;
- (NSData)data;
- (NSDictionary)dictionaryRepresentation;
- (NSNumber)fragmentSequenceNumber;
- (NSNumber)sequenceNumber;
- (NSString)type;
- (id)attributeDescriptions;
- (unint64_t)hash;
@end

@implementation HMDDataStreamFragmentChunk

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_fragmentSequenceNumber, 0);
  objc_storeStrong((id *)&self->_sequenceNumber, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

- (BOOL)isLast
{
  return self->_last;
}

- (NSString)type
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSNumber)fragmentSequenceNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (NSNumber)sequenceNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)hash
{
  v3 = [(HMDDataStreamFragmentChunk *)self data];
  uint64_t v4 = [v3 hash];

  v5 = [(HMDDataStreamFragmentChunk *)self sequenceNumber];
  uint64_t v6 = [v5 hash] ^ v4;

  v7 = [(HMDDataStreamFragmentChunk *)self fragmentSequenceNumber];
  uint64_t v8 = [v7 hash];

  v9 = [(HMDDataStreamFragmentChunk *)self type];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];

  return v10 ^ [(HMDDataStreamFragmentChunk *)self isLast];
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
    uint64_t v8 = [v6 data];
    v9 = [(HMDDataStreamFragmentChunk *)self data];
    if ([v8 isEqualToData:v9])
    {
      uint64_t v10 = [v7 sequenceNumber];
      v11 = [(HMDDataStreamFragmentChunk *)self sequenceNumber];
      if ([v10 isEqualToNumber:v11])
      {
        v12 = [v7 fragmentSequenceNumber];
        v13 = [(HMDDataStreamFragmentChunk *)self fragmentSequenceNumber];
        if ([v12 isEqualToNumber:v13])
        {
          uint64_t v14 = [v7 type];
          uint64_t v15 = [(HMDDataStreamFragmentChunk *)self type];
          v21 = (void *)v14;
          v16 = (void *)v14;
          v17 = (void *)v15;
          if ([v16 isEqualToString:v15])
          {
            int v20 = [v7 isLast];
            int v18 = v20 ^ [(HMDDataStreamFragmentChunk *)self isLast] ^ 1;
          }
          else
          {
            LOBYTE(v18) = 0;
          }
        }
        else
        {
          LOBYTE(v18) = 0;
        }
      }
      else
      {
        LOBYTE(v18) = 0;
      }
    }
    else
    {
      LOBYTE(v18) = 0;
    }
  }
  else
  {
    LOBYTE(v18) = 0;
  }

  return v18;
}

- (id)attributeDescriptions
{
  v22[5] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  id v4 = NSNumber;
  v21 = [(HMDDataStreamFragmentChunk *)self data];
  int v20 = objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v21, "length"));
  v5 = (void *)[v3 initWithName:@"Data Length" value:v20];
  v22[0] = v5;
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  v7 = [(HMDDataStreamFragmentChunk *)self sequenceNumber];
  uint64_t v8 = (void *)[v6 initWithName:@"Sequence Number" value:v7];
  v22[1] = v8;
  id v9 = objc_alloc(MEMORY[0x263F424F8]);
  uint64_t v10 = [(HMDDataStreamFragmentChunk *)self fragmentSequenceNumber];
  v11 = (void *)[v9 initWithName:@"Fragment Sequence Number" value:v10];
  v22[2] = v11;
  id v12 = objc_alloc(MEMORY[0x263F424F8]);
  v13 = [(HMDDataStreamFragmentChunk *)self type];
  uint64_t v14 = (void *)[v12 initWithName:@"Type" value:v13];
  v22[3] = v14;
  id v15 = objc_alloc(MEMORY[0x263F424F8]);
  [(HMDDataStreamFragmentChunk *)self isLast];
  v16 = HMFBooleanToString();
  v17 = (void *)[v15 initWithName:@"Is Last" value:v16];
  v22[4] = v17;
  int v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:5];

  return v18;
}

- (NSDictionary)dictionaryRepresentation
{
  v14[2] = *MEMORY[0x263EF8340];
  v13[0] = @"metadata";
  v11[0] = @"dataChunkSequenceNumber";
  id v3 = [(HMDDataStreamFragmentChunk *)self sequenceNumber];
  v12[0] = v3;
  v11[1] = @"dataSequenceNumber";
  id v4 = [(HMDDataStreamFragmentChunk *)self fragmentSequenceNumber];
  v12[1] = v4;
  v11[2] = @"dataType";
  v5 = [(HMDDataStreamFragmentChunk *)self type];
  v12[2] = v5;
  v11[3] = @"isLastDataChunk";
  id v6 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDDataStreamFragmentChunk isLast](self, "isLast"));
  v12[3] = v6;
  v7 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:4];
  v13[1] = @"data";
  v14[0] = v7;
  uint64_t v8 = [(HMDDataStreamFragmentChunk *)self data];
  v14[1] = v8;
  id v9 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];

  return (NSDictionary *)v9;
}

- (HMDDataStreamFragmentChunk)initWithDictionaryRepresentation:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_msgSend(v4, "hmf_dataForKey:", @"data");
  if (v5)
  {
    id v6 = objc_msgSend(v4, "hmf_dictionaryForKey:", @"metadata");
    v7 = v6;
    if (v6)
    {
      uint64_t v8 = objc_msgSend(v6, "hmf_numberForKey:", @"dataChunkSequenceNumber");
      if (v8)
      {
        id v9 = objc_msgSend(v7, "hmf_numberForKey:", @"dataSequenceNumber");
        if (v9)
        {
          uint64_t v10 = objc_msgSend(v7, "hmf_stringForKey:", @"dataType");
          if (v10)
          {
            v11 = objc_msgSend(v7, "hmf_numberForKey:", @"isLastDataChunk");
            id v12 = v11;
            if (v11)
            {
              v13 = -[HMDDataStreamFragmentChunk initWithData:sequenceNumber:fragmentSequenceNumber:type:isLast:](self, "initWithData:sequenceNumber:fragmentSequenceNumber:type:isLast:", v5, v8, v9, v10, [v11 BOOLValue]);
              uint64_t v14 = v13;
            }
            else
            {
              context = (void *)MEMORY[0x230FBD990]();
              v13 = self;
              v30 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
              {
                v32 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543874;
                v36 = v32;
                __int16 v37 = 2112;
                v38 = @"isLastDataChunk";
                __int16 v39 = 2112;
                id v40 = v4;
                _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_ERROR, "%{public}@Could not determine isLast (key=%@) from stream data dictionary: %@", buf, 0x20u);
              }
              uint64_t v14 = 0;
            }
          }
          else
          {
            v27 = (void *)MEMORY[0x230FBD990]();
            v13 = self;
            v28 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v29 = contexta = v27;
              *(_DWORD *)buf = 138543874;
              v36 = v29;
              __int16 v37 = 2112;
              v38 = @"dataType";
              __int16 v39 = 2112;
              id v40 = v4;
              _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_ERROR, "%{public}@Could not determine type (key=%@) from stream data dictionary: %@", buf, 0x20u);

              v27 = contexta;
            }

            uint64_t v14 = 0;
          }
        }
        else
        {
          v24 = (void *)MEMORY[0x230FBD990]();
          v13 = self;
          v25 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            v26 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            v36 = v26;
            __int16 v37 = 2112;
            v38 = @"dataSequenceNumber";
            __int16 v39 = 2112;
            id v40 = v4;
            _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@Could not determine fragment sequence number (key=%@) from stream data dictionary: %@", buf, 0x20u);
          }
          uint64_t v14 = 0;
        }
      }
      else
      {
        v21 = (void *)MEMORY[0x230FBD990]();
        v13 = self;
        v22 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v23 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          v36 = v23;
          __int16 v37 = 2112;
          v38 = @"dataChunkSequenceNumber";
          __int16 v39 = 2112;
          id v40 = v4;
          _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Could not determine sequence number (key=%@) from stream data dictionary: %@", buf, 0x20u);
        }
        uint64_t v14 = 0;
      }
    }
    else
    {
      int v18 = (void *)MEMORY[0x230FBD990]();
      v13 = self;
      v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        int v20 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v36 = v20;
        __int16 v37 = 2112;
        v38 = @"metadata";
        __int16 v39 = 2112;
        id v40 = v4;
        _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Could not determine metadata (key=%@) from stream data dictionary: %@", buf, 0x20u);
      }
      uint64_t v14 = 0;
    }
  }
  else
  {
    id v15 = (void *)MEMORY[0x230FBD990]();
    v13 = self;
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v36 = v17;
      __int16 v37 = 2112;
      v38 = @"data";
      __int16 v39 = 2112;
      id v40 = v4;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Could not determine data (key=%@) from stream data dictionary: %@", buf, 0x20u);
    }
    uint64_t v14 = 0;
  }

  return v14;
}

- (HMDDataStreamFragmentChunk)initWithData:(id)a3 sequenceNumber:(id)a4 fragmentSequenceNumber:(id)a5 type:(id)a6 isLast:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  if (!v13)
  {
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v14)
  {
LABEL_9:
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v15)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  v17 = v16;
  if (!v16)
  {
LABEL_11:
    v27 = (HMDAudioAnalysisBulletinNotificationManager *)_HMFPreconditionFailure();
    [(HMDAudioAnalysisBulletinNotificationManager *)v27 .cxx_destruct];
    return result;
  }
  v29.receiver = self;
  v29.super_class = (Class)HMDDataStreamFragmentChunk;
  int v18 = [(HMDDataStreamFragmentChunk *)&v29 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_data, a3);
    uint64_t v20 = [v14 copy];
    sequenceNumber = v19->_sequenceNumber;
    v19->_sequenceNumber = (NSNumber *)v20;

    uint64_t v22 = [v15 copy];
    fragmentSequenceNumber = v19->_fragmentSequenceNumber;
    v19->_fragmentSequenceNumber = (NSNumber *)v22;

    uint64_t v24 = [v17 copy];
    type = v19->_type;
    v19->_type = (NSString *)v24;

    v19->_last = a7;
  }

  return v19;
}

@end