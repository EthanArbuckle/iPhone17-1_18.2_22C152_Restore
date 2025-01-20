@interface HMBLocalSQLContextOutputBlock
+ (id)logCategory;
- (HMBLocalSQLContext)owner;
- (HMBLocalSQLContextOutputBlock)initWithOwner:(id)a3 identifier:(id)a4 zoneRow:(unint64_t)a5 blockRow:(unint64_t)a6;
- (HMFActivity)activity;
- (NSString)identifier;
- (id)abort;
- (id)commit:(id)a3;
- (id)logIdentifier;
- (id)updateModelID:(id)a3 modelEncoding:(unint64_t)a4 modelData:(id)a5;
- (unint64_t)blockRow;
- (unint64_t)zoneRow;
- (void)setBlockRow:(unint64_t)a3;
- (void)setOwner:(id)a3;
@end

@implementation HMBLocalSQLContextOutputBlock

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_owner);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (unint64_t)zoneRow
{
  return self->_zoneRow;
}

- (void)setOwner:(id)a3
{
}

- (HMBLocalSQLContext)owner
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  return (HMBLocalSQLContext *)WeakRetained;
}

- (HMFActivity)activity
{
  return self->_activity;
}

- (void)setBlockRow:(unint64_t)a3
{
  self->_blockRow = a3;
}

- (unint64_t)blockRow
{
  return self->_blockRow;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)logIdentifier
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%lu", -[HMBLocalSQLContextOutputBlock blockRow](self, "blockRow"));
}

- (id)abort
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(HMBLocalSQLContextOutputBlock *)self blockRow];
  v4 = (void *)MEMORY[0x1D944CB30]();
  v5 = self;
  v6 = HMFGetOSLogHandle();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v8 = HMFGetLogIdentifier();
      v9 = [(HMBLocalSQLContextOutputBlock *)v5 activity];
      v10 = [v9 identifier];
      v11 = [v10 shortDescription];
      *(_DWORD *)buf = 138543618;
      v35 = v8;
      __int16 v36 = 2114;
      v37 = v11;
      _os_log_impl(&dword_1D4693000, v7, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Aborting output block", buf, 0x16u);
    }
    v12 = [(HMBLocalSQLContextOutputBlock *)v5 owner];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __38__HMBLocalSQLContextOutputBlock_abort__block_invoke;
    v33[3] = &unk_1E69EB758;
    v33[4] = v5;
    v13 = [v12 sqlBlockWithActivity:0 block:v33];

    v14 = (void *)MEMORY[0x1D944CB30]();
    v15 = v5;
    v16 = HMFGetOSLogHandle();
    v17 = v16;
    if (v13)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v18 = HMFGetLogIdentifier();
        v19 = [(HMBLocalSQLContextOutputBlock *)v15 activity];
        v20 = [v19 identifier];
        v21 = [v20 shortDescription];
        *(_DWORD *)buf = 138543874;
        v35 = v18;
        __int16 v36 = 2114;
        v37 = v21;
        __int16 v38 = 2112;
        v39 = v13;
        _os_log_impl(&dword_1D4693000, v17, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to abort output block: %@", buf, 0x20u);
      }
      [(HMBLocalSQLContextOutputBlock *)v15 setBlockRow:0];
      id v22 = v13;
    }
    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        v27 = HMFGetLogIdentifier();
        v28 = [(HMBLocalSQLContextOutputBlock *)v15 activity];
        v29 = [v28 identifier];
        v30 = [v29 shortDescription];
        *(_DWORD *)buf = 138543618;
        v35 = v27;
        __int16 v36 = 2114;
        v37 = v30;
        _os_log_impl(&dword_1D4693000, v17, OS_LOG_TYPE_DEBUG, "%{public}@[%{public}@] Successfully aborted output block", buf, 0x16u);
      }
      [(HMBLocalSQLContextOutputBlock *)v15 setBlockRow:0];
      v31 = [(HMBLocalSQLContextOutputBlock *)v15 activity];
      [v31 invalidate];
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v23 = HMFGetLogIdentifier();
      v24 = [(HMBLocalSQLContextOutputBlock *)v5 activity];
      v25 = [v24 identifier];
      v26 = [v25 shortDescription];
      *(_DWORD *)buf = 138543618;
      v35 = v23;
      __int16 v36 = 2114;
      v37 = v26;
      _os_log_impl(&dword_1D4693000, v7, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Asked to abort invalid output block", buf, 0x16u);
    }
    v13 = 0;
  }
  return v13;
}

id __38__HMBLocalSQLContextOutputBlock_abort__block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v10 = 0;
  objc_msgSend(v4, "_deleteItemsWithBlockRow:error:", objc_msgSend(v3, "blockRow"), &v10);
  id v5 = v10;
  uint64_t v6 = [*(id *)(a1 + 32) blockRow];
  id v9 = v5;
  [v4 _deleteBlockWithRow:v6 error:&v9];

  id v7 = v9;
  return v7;
}

- (id)commit:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(HMBLocalSQLContextOutputBlock *)self blockRow];
  uint64_t v6 = (void *)MEMORY[0x1D944CB30]();
  id v7 = self;
  v8 = HMFGetOSLogHandle();
  id v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      v11 = [(HMBLocalSQLContextOutputBlock *)v7 activity];
      v12 = [v11 identifier];
      v13 = [v12 shortDescription];
      *(_DWORD *)buf = 138543618;
      v49 = v10;
      __int16 v50 = 2114;
      v51 = v13;
      _os_log_impl(&dword_1D4693000, v9, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Committing output block.", buf, 0x16u);
    }
    v14 = [(HMBLocalSQLContextOutputBlock *)v7 activity];
    [v14 markWithReason:@"committing block."];

    v15 = [(HMBLocalSQLContextOutputBlock *)v7 owner];
    uint64_t v42 = MEMORY[0x1E4F143A8];
    uint64_t v43 = 3221225472;
    v44 = __40__HMBLocalSQLContextOutputBlock_commit___block_invoke;
    v45 = &unk_1E69EADA8;
    v46 = v7;
    id v47 = v4;
    v16 = [v15 sqlBlockWithActivity:0 block:&v42];

    id v22 = (void *)MEMORY[0x1D944CB30](v17, v18, v19, v20, v21);
    v23 = v7;
    v24 = HMFGetOSLogHandle();
    v25 = v24;
    if (v16)
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v26 = HMFGetLogIdentifier();
        v27 = [(HMBLocalSQLContextOutputBlock *)v23 activity];
        v28 = [v27 identifier];
        v29 = [v28 shortDescription];
        *(_DWORD *)buf = 138543874;
        v49 = v26;
        __int16 v50 = 2114;
        v51 = v29;
        __int16 v52 = 2112;
        v53 = v16;
        _os_log_impl(&dword_1D4693000, v25, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to commit output block: %@", buf, 0x20u);
      }
      id v30 = [(HMBLocalSQLContextOutputBlock *)v23 abort];
      [(HMBLocalSQLContextOutputBlock *)v23 setBlockRow:0];
      id v31 = v16;
    }
    else
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        __int16 v36 = HMFGetLogIdentifier();
        v37 = [(HMBLocalSQLContextOutputBlock *)v23 activity];
        __int16 v38 = [v37 identifier];
        v39 = [v38 shortDescription];
        *(_DWORD *)buf = 138543618;
        v49 = v36;
        __int16 v50 = 2114;
        v51 = v39;
        _os_log_impl(&dword_1D4693000, v25, OS_LOG_TYPE_DEBUG, "%{public}@[%{public}@] Successfully committed input block", buf, 0x16u);
      }
      [(HMBLocalSQLContextOutputBlock *)v23 setBlockRow:0];
      uint64_t v40 = [(HMBLocalSQLContextOutputBlock *)v23 activity];
      [v40 invalidate];
    }
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v32 = HMFGetLogIdentifier();
      v33 = [(HMBLocalSQLContextOutputBlock *)v7 activity];
      v34 = [v33 identifier];
      v35 = [v34 shortDescription];
      *(_DWORD *)buf = 138543618;
      v49 = v32;
      __int16 v50 = 2114;
      v51 = v35;
      _os_log_impl(&dword_1D4693000, v9, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Asked to commit invalid output block", buf, 0x16u);
    }
    v16 = 0;
  }

  return v16;
}

id __40__HMBLocalSQLContextOutputBlock_commit___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 blockRow];
  uint64_t v6 = *(void *)(a1 + 40);
  id v9 = 0;
  [v4 _updateBlockWithRow:v5 options:v6 error:&v9];

  id v7 = v9;
  return v7;
}

- (id)updateModelID:(id)a3 modelEncoding:(unint64_t)a4 modelData:(id)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if ([(HMBLocalSQLContextOutputBlock *)self blockRow])
  {
    id v10 = [(HMBLocalSQLContextOutputBlock *)self owner];
    uint64_t v34 = MEMORY[0x1E4F143A8];
    uint64_t v35 = 3221225472;
    __int16 v36 = __71__HMBLocalSQLContextOutputBlock_updateModelID_modelEncoding_modelData___block_invoke;
    v37 = &unk_1E69EAD80;
    __int16 v38 = self;
    id v39 = v8;
    unint64_t v41 = a4;
    id v40 = v9;
    v11 = [v10 sqlBlockWithActivity:0 block:&v34];

    if (v11)
    {
      uint64_t v18 = (void *)MEMORY[0x1D944CB30](v12, v13, v14, v15, v16, v17);
      uint64_t v19 = self;
      uint64_t v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        uint64_t v21 = HMFGetLogIdentifier();
        id v22 = [(HMBLocalSQLContextOutputBlock *)v19 activity];
        v23 = [v22 identifier];
        v24 = [v23 shortDescription];
        *(_DWORD *)buf = 138543874;
        uint64_t v43 = v21;
        __int16 v44 = 2114;
        v45 = v24;
        __int16 v46 = 2112;
        id v47 = v11;
        _os_log_impl(&dword_1D4693000, v20, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to add additional entries on output block: %@", buf, 0x20u);
      }
      id v25 = [(HMBLocalSQLContextOutputBlock *)v19 abort];
    }
  }
  else
  {
    v26 = (void *)MEMORY[0x1D944CB30]();
    v27 = self;
    v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = HMFGetLogIdentifier();
      id v30 = [(HMBLocalSQLContextOutputBlock *)v27 activity];
      id v31 = [v30 identifier];
      v32 = [v31 shortDescription];
      *(_DWORD *)buf = 138543618;
      uint64_t v43 = v29;
      __int16 v44 = 2114;
      v45 = v32;
      _os_log_impl(&dword_1D4693000, v28, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Asked to add additional entries on invalid output block", buf, 0x16u);
    }
    v11 = 0;
  }

  return v11;
}

id __71__HMBLocalSQLContextOutputBlock_updateModelID_modelEncoding_modelData___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 zoneRow];
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 40);
  id v9 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "blockRow"));
  id v12 = 0;
  [v4 _updateRecordWithZoneRow:v5 modelID:v8 pushEncoding:v6 pushData:v7 pushBlockRow:v9 error:&v12];

  id v10 = v12;
  return v10;
}

- (HMBLocalSQLContextOutputBlock)initWithOwner:(id)a3 identifier:(id)a4 zoneRow:(unint64_t)a5 blockRow:(unint64_t)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  v31.receiver = self;
  v31.super_class = (Class)HMBLocalSQLContextOutputBlock;
  id v12 = [(HMBLocalSQLContextOutputBlock *)&v31 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a4);
    objc_storeWeak((id *)&v13->_owner, v10);
    v13->_blockRow = a6;
    v13->_zoneRow = a5;
    id v14 = objc_alloc(MEMORY[0x1E4F653F0]);
    uint64_t v15 = NSString;
    uint64_t v16 = [(HMBLocalSQLContextOutputBlock *)v13 logIdentifier];
    uint64_t v17 = [v15 stringWithFormat:@"HMBLocalSQLContextOutputBlock.%@", v16];
    uint64_t v18 = [v14 initWithName:v17];
    activity = v13->_activity;
    v13->_activity = (HMFActivity *)v18;

    uint64_t v20 = (void *)MEMORY[0x1D944CB30]();
    uint64_t v21 = v13;
    id v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = id v30 = v10;
      v24 = [(HMBLocalSQLContextOutputBlock *)v21 activity];
      id v25 = [v24 identifier];
      v26 = [v25 shortDescription];
      [(HMBLocalSQLContextOutputBlock *)v21 identifier];
      v28 = id v27 = v11;
      *(_DWORD *)buf = 138543874;
      v33 = v23;
      __int16 v34 = 2114;
      uint64_t v35 = v26;
      __int16 v36 = 2112;
      v37 = v28;
      _os_log_impl(&dword_1D4693000, v22, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Creating Output Block for %@", buf, 0x20u);

      id v11 = v27;
      id v10 = v30;
    }
  }

  return v13;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t11 != -1) {
    dispatch_once(&logCategory__hmf_once_t11, &__block_literal_global_5987);
  }
  v2 = (void *)logCategory__hmf_once_v12;
  return v2;
}

uint64_t __44__HMBLocalSQLContextOutputBlock_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v12;
  logCategory__hmf_once_id v12 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end