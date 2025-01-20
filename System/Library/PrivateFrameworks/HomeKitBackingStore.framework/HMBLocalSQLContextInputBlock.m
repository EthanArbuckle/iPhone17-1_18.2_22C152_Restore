@interface HMBLocalSQLContextInputBlock
+ (id)logCategory;
- (HMBLocalSQLContext)owner;
- (HMBLocalSQLContextInputBlock)initWithOwner:(id)a3 identifier:(id)a4 zoneRow:(unint64_t)a5 blockRow:(unint64_t)a6 type:(unint64_t)a7;
- (HMFActivity)activity;
- (NSString)identifier;
- (id)abort;
- (id)attributeDescriptions;
- (id)commit:(id)a3;
- (id)insertExternalID:(id)a3 externalData:(id)a4 modelEncoding:(unint64_t)a5 modelData:(id)a6;
- (id)logIdentifier;
- (id)updateExternalID:(id)a3 externalData:(id)a4 modelEncoding:(unint64_t)a5 modelData:(id)a6;
- (unint64_t)blockRow;
- (unint64_t)type;
- (unint64_t)zoneRow;
- (void)setBlockRow:(unint64_t)a3;
- (void)setOwner:(id)a3;
@end

@implementation HMBLocalSQLContextInputBlock

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_owner);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (unint64_t)type
{
  return self->_type;
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
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%lu/%lu", -[HMBLocalSQLContextInputBlock blockRow](self, "blockRow"), -[HMBLocalSQLContextInputBlock type](self, "type"));
}

- (id)abort
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(HMBLocalSQLContextInputBlock *)self blockRow];
  v4 = (void *)MEMORY[0x1D944CB30]();
  v5 = self;
  v6 = HMFGetOSLogHandle();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v8 = HMFGetLogIdentifier();
      v9 = [(HMBLocalSQLContextInputBlock *)v5 activity];
      v10 = [v9 identifier];
      v11 = [v10 shortDescription];
      *(_DWORD *)buf = 138543618;
      v37 = v8;
      __int16 v38 = 2114;
      v39 = v11;
      _os_log_impl(&dword_1D4693000, v7, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Aborting input block", buf, 0x16u);
    }
    v12 = [(HMBLocalSQLContextInputBlock *)v5 owner];
    v34[4] = v5;
    id v35 = 0;
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __37__HMBLocalSQLContextInputBlock_abort__block_invoke;
    v34[3] = &unk_1E69EB758;
    char v13 = [v12 sqlBlockWithActivity:0 error:&v35 block:v34];
    id v14 = v35;

    v15 = (void *)MEMORY[0x1D944CB30]();
    v16 = v5;
    v17 = HMFGetOSLogHandle();
    v18 = v17;
    if (v13)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        v19 = HMFGetLogIdentifier();
        v20 = [(HMBLocalSQLContextInputBlock *)v16 activity];
        v21 = [v20 identifier];
        v22 = [v21 shortDescription];
        *(_DWORD *)buf = 138543618;
        v37 = v19;
        __int16 v38 = 2114;
        v39 = v22;
        _os_log_impl(&dword_1D4693000, v18, OS_LOG_TYPE_DEBUG, "%{public}@[%{public}@] Successfully aborted input block", buf, 0x16u);
      }
      [(HMBLocalSQLContextInputBlock *)v16 setBlockRow:0];
      v23 = [(HMBLocalSQLContextInputBlock *)v16 activity];
      [v23 invalidate];

      id v24 = 0;
    }
    else
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v29 = HMFGetLogIdentifier();
        v30 = [(HMBLocalSQLContextInputBlock *)v16 activity];
        v31 = [v30 identifier];
        v32 = [v31 shortDescription];
        *(_DWORD *)buf = 138543874;
        v37 = v29;
        __int16 v38 = 2114;
        v39 = v32;
        __int16 v40 = 2112;
        id v41 = v14;
        _os_log_impl(&dword_1D4693000, v18, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to abort input block: %@", buf, 0x20u);
      }
      [(HMBLocalSQLContextInputBlock *)v16 setBlockRow:0];
      id v24 = v14;
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v25 = HMFGetLogIdentifier();
      v26 = [(HMBLocalSQLContextInputBlock *)v5 activity];
      v27 = [v26 identifier];
      v28 = [v27 shortDescription];
      *(_DWORD *)buf = 138543618;
      v37 = v25;
      __int16 v38 = 2114;
      v39 = v28;
      _os_log_impl(&dword_1D4693000, v7, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Asked to abort invalid input block", buf, 0x16u);
    }
    id v24 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:5];
  }
  return v24;
}

id __37__HMBLocalSQLContextInputBlock_abort__block_invoke(uint64_t a1, void *a2)
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
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(HMBLocalSQLContextInputBlock *)self blockRow];
  uint64_t v6 = (void *)MEMORY[0x1D944CB30]();
  id v7 = self;
  v8 = HMFGetOSLogHandle();
  id v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      v11 = [(HMBLocalSQLContextInputBlock *)v7 activity];
      v12 = [v11 identifier];
      char v13 = [v12 shortDescription];
      *(_DWORD *)buf = 138543618;
      id v41 = v10;
      __int16 v42 = 2114;
      v43 = v13;
      _os_log_impl(&dword_1D4693000, v9, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Committing input block.", buf, 0x16u);
    }
    id v14 = [(HMBLocalSQLContextInputBlock *)v7 owner];
    id v39 = 0;
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __39__HMBLocalSQLContextInputBlock_commit___block_invoke;
    v37[3] = &unk_1E69EADA8;
    v37[4] = v7;
    id v38 = v4;
    char v15 = [v14 sqlBlockWithActivity:0 error:&v39 block:v37];
    id v16 = v39;

    v17 = (void *)MEMORY[0x1D944CB30]();
    v18 = v7;
    v19 = HMFGetOSLogHandle();
    v20 = v19;
    if (v15)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        v21 = HMFGetLogIdentifier();
        v22 = [(HMBLocalSQLContextInputBlock *)v18 activity];
        v23 = [v22 identifier];
        id v24 = [v23 shortDescription];
        *(_DWORD *)buf = 138543618;
        id v41 = v21;
        __int16 v42 = 2114;
        v43 = v24;
        _os_log_impl(&dword_1D4693000, v20, OS_LOG_TYPE_DEBUG, "%{public}@[%{public}@] Successfully committed input block", buf, 0x16u);
      }
      [(HMBLocalSQLContextInputBlock *)v18 setBlockRow:0];
      v25 = [(HMBLocalSQLContextInputBlock *)v18 activity];
      [v25 invalidate];

      id v26 = 0;
    }
    else
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v31 = HMFGetLogIdentifier();
        v32 = [(HMBLocalSQLContextInputBlock *)v18 activity];
        v33 = [v32 identifier];
        v34 = [v33 shortDescription];
        *(_DWORD *)buf = 138543874;
        id v41 = v31;
        __int16 v42 = 2114;
        v43 = v34;
        __int16 v44 = 2112;
        id v45 = v16;
        _os_log_impl(&dword_1D4693000, v20, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to commit input block: %@", buf, 0x20u);
      }
      id v35 = [(HMBLocalSQLContextInputBlock *)v18 abort];
      id v26 = v16;
    }
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v27 = HMFGetLogIdentifier();
      v28 = [(HMBLocalSQLContextInputBlock *)v7 activity];
      v29 = [v28 identifier];
      v30 = [v29 shortDescription];
      *(_DWORD *)buf = 138543618;
      id v41 = v27;
      __int16 v42 = 2114;
      v43 = v30;
      _os_log_impl(&dword_1D4693000, v9, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Asked to commit invalid input block", buf, 0x16u);
    }
    id v26 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:5];
  }

  return v26;
}

id __39__HMBLocalSQLContextInputBlock_commit___block_invoke(uint64_t a1, void *a2)
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

- (id)updateExternalID:(id)a3 externalData:(id)a4 modelEncoding:(unint64_t)a5 modelData:(id)a6
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if ([(HMBLocalSQLContextInputBlock *)self blockRow])
  {
    char v13 = [(HMBLocalSQLContextInputBlock *)self owner];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __86__HMBLocalSQLContextInputBlock_updateExternalID_externalData_modelEncoding_modelData___block_invoke;
    v33[3] = &unk_1E69E9758;
    v33[4] = self;
    id v34 = v10;
    id v35 = v11;
    unint64_t v37 = a5;
    id v36 = v12;
    id v14 = [v13 sqlBlockWithActivity:0 block:v33];

    if (v14)
    {
      char v15 = (void *)MEMORY[0x1D944CB30]();
      id v16 = self;
      v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = HMFGetLogIdentifier();
        v19 = [(HMBLocalSQLContextInputBlock *)v16 activity];
        v20 = [v19 identifier];
        [v20 shortDescription];
        v21 = v32 = v15;
        *(_DWORD *)buf = 138543874;
        id v39 = v18;
        __int16 v40 = 2114;
        id v41 = v21;
        __int16 v42 = 2112;
        v43 = v14;
        _os_log_impl(&dword_1D4693000, v17, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to update additional entries on input block: %@", buf, 0x20u);

        char v15 = v32;
      }

      id v22 = [(HMBLocalSQLContextInputBlock *)v16 abort];
      id v23 = v14;
    }
  }
  else
  {
    id v24 = (void *)MEMORY[0x1D944CB30]();
    v25 = self;
    id v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = HMFGetLogIdentifier();
      v28 = [(HMBLocalSQLContextInputBlock *)v25 activity];
      v29 = [v28 identifier];
      v30 = [v29 shortDescription];
      *(_DWORD *)buf = 138543618;
      id v39 = v27;
      __int16 v40 = 2114;
      id v41 = v30;
      _os_log_impl(&dword_1D4693000, v26, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Asked to update additional entries on invalid input block", buf, 0x16u);
    }
    id v14 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:5];
  }

  return v14;
}

id __86__HMBLocalSQLContextInputBlock_updateExternalID_externalData_modelEncoding_modelData___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 zoneRow];
  uint64_t v6 = [*(id *)(a1 + 32) blockRow];
  uint64_t v7 = [*(id *)(a1 + 32) type];
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 56);
  uint64_t v10 = *(void *)(a1 + 64);
  id v14 = 0;
  [v4 _updateItemWithZoneRow:v5 blockRow:v6 type:v7 externalID:v8 externalData:v9 modelEncoding:v10 modelData:v11 error:&v14];

  id v12 = v14;
  return v12;
}

- (id)insertExternalID:(id)a3 externalData:(id)a4 modelEncoding:(unint64_t)a5 modelData:(id)a6
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if ([(HMBLocalSQLContextInputBlock *)self blockRow])
  {
    char v13 = [(HMBLocalSQLContextInputBlock *)self owner];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __86__HMBLocalSQLContextInputBlock_insertExternalID_externalData_modelEncoding_modelData___block_invoke;
    v33[3] = &unk_1E69E9758;
    v33[4] = self;
    id v34 = v10;
    id v35 = v11;
    unint64_t v37 = a5;
    id v36 = v12;
    id v14 = [v13 sqlBlockWithActivity:0 block:v33];

    if (v14)
    {
      char v15 = (void *)MEMORY[0x1D944CB30]();
      id v16 = self;
      v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = HMFGetLogIdentifier();
        v19 = [(HMBLocalSQLContextInputBlock *)v16 activity];
        v20 = [v19 identifier];
        [v20 shortDescription];
        v21 = v32 = v15;
        *(_DWORD *)buf = 138543874;
        id v39 = v18;
        __int16 v40 = 2114;
        id v41 = v21;
        __int16 v42 = 2112;
        v43 = v14;
        _os_log_impl(&dword_1D4693000, v17, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to add additional entries on input block: %@", buf, 0x20u);

        char v15 = v32;
      }

      id v22 = [(HMBLocalSQLContextInputBlock *)v16 abort];
      id v23 = v14;
    }
  }
  else
  {
    id v24 = (void *)MEMORY[0x1D944CB30]();
    v25 = self;
    id v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = HMFGetLogIdentifier();
      v28 = [(HMBLocalSQLContextInputBlock *)v25 activity];
      v29 = [v28 identifier];
      v30 = [v29 shortDescription];
      *(_DWORD *)buf = 138543618;
      id v39 = v27;
      __int16 v40 = 2114;
      id v41 = v30;
      _os_log_impl(&dword_1D4693000, v26, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Asked to add additional entries on invalid input block", buf, 0x16u);
    }
    id v14 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:5];
  }

  return v14;
}

id __86__HMBLocalSQLContextInputBlock_insertExternalID_externalData_modelEncoding_modelData___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 zoneRow];
  uint64_t v6 = [*(id *)(a1 + 32) blockRow];
  uint64_t v7 = [*(id *)(a1 + 32) type];
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 56);
  uint64_t v10 = *(void *)(a1 + 64);
  id v14 = 0;
  [v4 _insertItemWithZoneRow:v5 blockRow:v6 type:v7 externalID:v8 externalData:v9 modelEncoding:v10 modelData:v11 error:&v14];

  id v12 = v14;
  return v12;
}

- (id)attributeDescriptions
{
  v14[3] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  id v4 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[HMBLocalSQLContextInputBlock blockRow](self, "blockRow"));
  uint64_t v5 = (void *)[v3 initWithName:@"Block Row" value:v4];
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[HMBLocalSQLContextInputBlock zoneRow](self, "zoneRow", v5));
  uint64_t v8 = (void *)[v6 initWithName:@"Zone Row" value:v7];
  v14[1] = v8;
  id v9 = objc_alloc(MEMORY[0x1E4F653F8]);
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[HMBLocalSQLContextInputBlock type](self, "type"));
  uint64_t v11 = (void *)[v9 initWithName:@"Type" value:v10];
  v14[2] = v11;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:3];

  return v12;
}

- (HMBLocalSQLContextInputBlock)initWithOwner:(id)a3 identifier:(id)a4 zoneRow:(unint64_t)a5 blockRow:(unint64_t)a6 type:(unint64_t)a7
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  v33.receiver = self;
  v33.super_class = (Class)HMBLocalSQLContextInputBlock;
  id v14 = [(HMBLocalSQLContextInputBlock *)&v33 init];
  char v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_identifier, a4);
    objc_storeWeak((id *)&v15->_owner, v12);
    v15->_blockRow = a6;
    v15->_zoneRow = a5;
    v15->_type = a7;
    id v16 = objc_alloc(MEMORY[0x1E4F653F0]);
    v17 = NSString;
    v18 = [(HMBLocalSQLContextInputBlock *)v15 logIdentifier];
    v19 = [v17 stringWithFormat:@"HMBLocalSQLContextInputBlock.%@", v18];
    uint64_t v20 = [v16 initWithName:v19];
    activity = v15->_activity;
    v15->_activity = (HMFActivity *)v20;

    id v22 = (void *)MEMORY[0x1D944CB30]();
    id v23 = v15;
    id v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v25 = id v32 = v12;
      id v26 = [(HMBLocalSQLContextInputBlock *)v23 activity];
      v27 = [v26 identifier];
      v28 = [v27 shortDescription];
      [(HMBLocalSQLContextInputBlock *)v23 identifier];
      v30 = id v29 = v13;
      *(_DWORD *)buf = 138543874;
      id v35 = v25;
      __int16 v36 = 2114;
      unint64_t v37 = v28;
      __int16 v38 = 2112;
      id v39 = v30;
      _os_log_impl(&dword_1D4693000, v24, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Creating Input Block for %@", buf, 0x20u);

      id v13 = v29;
      id v12 = v32;
    }
  }

  return v15;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t13 != -1) {
    dispatch_once(&logCategory__hmf_once_t13, &__block_literal_global_837);
  }
  v2 = (void *)logCategory__hmf_once_v14;
  return v2;
}

uint64_t __43__HMBLocalSQLContextInputBlock_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v14;
  logCategory__hmf_once_id v14 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end