@interface HMDDataStreamFragmentAssembler
- (BOOL)addFragmentChunk:(id)a3 error:(id *)a4;
- (HMDDataStreamFragment)assembledFragment;
- (HMDDataStreamFragmentAssembler)initWithSequenceNumber:(id)a3 type:(id)a4;
- (NSMutableData)data;
- (NSNumber)currentChunkSequenceNumber;
- (NSNumber)sequenceNumber;
- (NSString)type;
- (id)attributeDescriptions;
- (void)setAssembledFragment:(id)a3;
- (void)setCurrentChunkSequenceNumber:(id)a3;
@end

@implementation HMDDataStreamFragmentAssembler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentChunkSequenceNumber, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_assembledFragment, 0);
  objc_storeStrong((id *)&self->_sequenceNumber, 0);
}

- (void)setCurrentChunkSequenceNumber:(id)a3
{
}

- (NSNumber)currentChunkSequenceNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (NSMutableData)data
{
  return (NSMutableData *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)type
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAssembledFragment:(id)a3
{
}

- (HMDDataStreamFragment)assembledFragment
{
  return (HMDDataStreamFragment *)objc_getProperty(self, a2, 16, 1);
}

- (NSNumber)sequenceNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (BOOL)addFragmentChunk:(id)a3 error:(id *)a4
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void *)MEMORY[0x230FBD990]();
  v8 = self;
  v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = HMFGetLogIdentifier();
    int v41 = 138543618;
    v42 = v10;
    __int16 v43 = 2112;
    id v44 = v6;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Adding chunk: %@", (uint8_t *)&v41, 0x16u);
  }
  v11 = [(HMDDataStreamFragmentAssembler *)v8 assembledFragment];

  if (v11)
  {
    v12 = (void *)MEMORY[0x230FBD990]();
    v13 = v8;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = HMFGetLogIdentifier();
      int v41 = 138543618;
      v42 = v15;
      __int16 v43 = 2112;
      id v44 = v6;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Asked to add fragment chunk %@ but the last data chunk has already been received", (uint8_t *)&v41, 0x16u);
    }
    if (a4)
    {
      v16 = (void *)MEMORY[0x263F087E8];
      uint64_t v17 = 1;
LABEL_18:
      [v16 errorWithDomain:@"HMDDataStreamFragmentAssemblerErrorDomain" code:v17 userInfo:0];
      BOOL v30 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  v18 = [(HMDDataStreamFragmentAssembler *)v8 currentChunkSequenceNumber];
  uint64_t v19 = [v18 unsignedLongLongValue];

  v20 = [v6 sequenceNumber];
  uint64_t v21 = [v20 unsignedLongLongValue];

  if (v21 != v19 + 1)
  {
    v31 = (void *)MEMORY[0x230FBD990]();
    v32 = v8;
    v33 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v34 = HMFGetLogIdentifier();
      v35 = [(HMDDataStreamFragmentAssembler *)v32 currentChunkSequenceNumber];
      int v41 = 138543874;
      v42 = v34;
      __int16 v43 = 2112;
      id v44 = v6;
      __int16 v45 = 2112;
      v46 = v35;
      _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_ERROR, "%{public}@Asked to add fragment chunk %@ with non-sequential sequence number compared to current stream data chunk sequence number %@", (uint8_t *)&v41, 0x20u);
    }
    if (a4)
    {
      v16 = (void *)MEMORY[0x263F087E8];
      uint64_t v17 = 2;
      goto LABEL_18;
    }
LABEL_23:
    BOOL v30 = 0;
    goto LABEL_24;
  }
  if (v21 == -1 && ([v6 isLast] & 1) == 0)
  {
    v36 = (void *)MEMORY[0x230FBD990]();
    v37 = v8;
    v38 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v39 = HMFGetLogIdentifier();
      int v41 = 138543618;
      v42 = v39;
      __int16 v43 = 2112;
      id v44 = v6;
      _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_ERROR, "%{public}@Asked to add non-last fragment chunk with maximum allowed sequence number: %@", (uint8_t *)&v41, 0x16u);
    }
    if (a4)
    {
      v16 = (void *)MEMORY[0x263F087E8];
      uint64_t v17 = 3;
      goto LABEL_18;
    }
    goto LABEL_23;
  }
  v22 = [v6 sequenceNumber];
  [(HMDDataStreamFragmentAssembler *)v8 setCurrentChunkSequenceNumber:v22];

  v23 = [(HMDDataStreamFragmentAssembler *)v8 data];
  v24 = [v6 data];
  [v23 appendData:v24];

  if ([v6 isLast])
  {
    v25 = [HMDDataStreamFragment alloc];
    v26 = [(HMDDataStreamFragmentAssembler *)v8 data];
    v27 = [(HMDDataStreamFragmentAssembler *)v8 sequenceNumber];
    v28 = [(HMDDataStreamFragmentAssembler *)v8 type];
    v29 = [(HMDDataStreamFragment *)v25 initWithData:v26 sequenceNumber:v27 type:v28];
    [(HMDDataStreamFragmentAssembler *)v8 setAssembledFragment:v29];
  }
  BOOL v30 = 1;
LABEL_24:

  return v30;
}

- (id)attributeDescriptions
{
  v22[5] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  uint64_t v21 = [(HMDDataStreamFragmentAssembler *)self sequenceNumber];
  v20 = (void *)[v3 initWithName:@"Sequence Number" value:v21];
  v22[0] = v20;
  id v4 = objc_alloc(MEMORY[0x263F424F8]);
  v5 = [(HMDDataStreamFragmentAssembler *)self type];
  id v6 = (void *)[v4 initWithName:@"Type" value:v5];
  v22[1] = v6;
  id v7 = objc_alloc(MEMORY[0x263F424F8]);
  v8 = NSNumber;
  v9 = [(HMDDataStreamFragmentAssembler *)self data];
  v10 = objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v9, "length"));
  v11 = (void *)[v7 initWithName:@"Data Length" value:v10];
  v22[2] = v11;
  id v12 = objc_alloc(MEMORY[0x263F424F8]);
  v13 = [(HMDDataStreamFragmentAssembler *)self currentChunkSequenceNumber];
  v14 = (void *)[v12 initWithName:@"Current Chunk Sequence Number" value:v13];
  v22[3] = v14;
  id v15 = objc_alloc(MEMORY[0x263F424F8]);
  v16 = [(HMDDataStreamFragmentAssembler *)self assembledFragment];
  uint64_t v17 = (void *)[v15 initWithName:@"Assembled Fragment" value:v16];
  v22[4] = v17;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:5];

  return v18;
}

- (HMDDataStreamFragmentAssembler)initWithSequenceNumber:(id)a3 type:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    _HMFPreconditionFailure();
LABEL_9:
    _HMFPreconditionFailure();
  }
  v9 = v8;
  if (!v8) {
    goto LABEL_9;
  }
  v22.receiver = self;
  v22.super_class = (Class)HMDDataStreamFragmentAssembler;
  v10 = [(HMDDataStreamFragmentAssembler *)&v22 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_sequenceNumber, a3);
    uint64_t v12 = [v9 copy];
    type = v11->_type;
    v11->_type = (NSString *)v12;

    uint64_t v14 = [MEMORY[0x263EFF990] data];
    data = v11->_data;
    v11->_data = (NSMutableData *)v14;

    currentChunkSequenceNumber = v11->_currentChunkSequenceNumber;
    v11->_currentChunkSequenceNumber = (NSNumber *)&unk_26E470AF8;

    uint64_t v17 = (void *)MEMORY[0x230FBD990]();
    v18 = v11;
    uint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v24 = v20;
      __int16 v25 = 2112;
      id v26 = v7;
      __int16 v27 = 2112;
      v28 = v9;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_DEBUG, "%{public}@Initialized data chunk assembler with sequence number: %@ type: %@", buf, 0x20u);
    }
  }

  return v11;
}

@end