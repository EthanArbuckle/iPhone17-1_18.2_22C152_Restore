@interface MPPlaybackSessionCommandInfo
+ (id)commandInfoWithIdentifier:(id)a3 revision:(id)a4 priority:(int64_t)a5;
- (BOOL)isEqual:(id)a3;
- (NSString)identifier;
- (NSString)revision;
- (int64_t)priority;
- (unint64_t)hash;
@end

@implementation MPPlaybackSessionCommandInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_revision, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (int64_t)priority
{
  return self->_priority;
}

- (NSString)revision
{
  return self->_revision;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = v4;
    v6 = (NSString *)v5[1];
    v7 = self->_identifier;
    v8 = v7;
    if (v7 == v6) {
      int v9 = 1;
    }
    else {
      int v9 = [(NSString *)v7 isEqual:v6];
    }

    v11 = (NSString *)v5[2];
    v12 = self->_revision;
    v13 = v12;
    if (v12 == v11) {
      char v14 = 1;
    }
    else {
      char v14 = [(NSString *)v12 isEqual:v11];
    }

    if (v9)
    {
      if (self->_priority == v5[3]) {
        BOOL v10 = v14;
      }
      else {
        BOOL v10 = 0;
      }
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3 = MSVHasherSharedSeed();
  uint64_t v5 = v4;
  uint64_t v6 = v3 ^ 0x736F6D6570736575;
  uint64_t v7 = v4 ^ 0x646F72616E646F6DLL;
  uint64_t v8 = v3 ^ 0x6C7967656E657261;
  NSUInteger v9 = [(NSString *)self->_identifier hash];
  uint64_t v10 = v5 ^ 0x7465646279746573 ^ v9;
  uint64_t v11 = (v6 + v7) ^ __ROR8__(v7, 51);
  uint64_t v12 = v8 + v10;
  uint64_t v13 = (v8 + v10) ^ __ROR8__(v10, 48);
  uint64_t v14 = v13 + __ROR8__(v6 + v7, 32);
  uint64_t v65 = __ROR8__(v12 + v11, 32);
  uint64_t v68 = v14 ^ __ROR8__(v13, 43);
  NSUInteger v15 = v14 ^ v9;
  uint64_t v62 = (v12 + v11) ^ __ROR8__(v11, 47);
  v16 = self->_revision;
  uint64_t v17 = [(NSString *)v16 hash];
  NSUInteger v18 = (v15 + v62) ^ __ROR8__(v62, 51);
  uint64_t v19 = v65 + (v68 ^ v17);
  uint64_t v20 = __ROR8__(v68 ^ v17, 48);
  uint64_t v21 = (v19 ^ v20) + __ROR8__(v15 + v62, 32);
  uint64_t v22 = v21 ^ __ROR8__(v19 ^ v20, 43);
  uint64_t v23 = v19 + v18;
  uint64_t v66 = __ROR8__(v23, 32);
  uint64_t v69 = v22;
  uint64_t v60 = v21 ^ v17;
  uint64_t v63 = v23 ^ __ROR8__(v18, 47);

  int64_t priority = self->_priority;
  uint64_t v25 = (v60 + v63) ^ __ROR8__(v63, 51);
  uint64_t v26 = v66 + (v69 ^ priority);
  uint64_t v27 = __ROR8__(v69 ^ priority, 48);
  uint64_t v28 = (v26 ^ v27) + __ROR8__(v60 + v63, 32);
  uint64_t v29 = v28 ^ __ROR8__(v26 ^ v27, 43);
  uint64_t v30 = v26 + v25;
  uint64_t v67 = __ROR8__(v30, 32);
  int64_t v61 = v28 ^ priority;
  uint64_t v64 = v30 ^ __ROR8__(v25, 47);
  int64_t v31 = ((v28 ^ priority) + v64) ^ __ROR8__(v64, 51);
  uint64_t v32 = v67 + (v29 ^ 0x1800000000000000);
  uint64_t v33 = __ROR8__(v29 ^ 0x1800000000000000, 48);
  uint64_t v34 = (v32 ^ v33) + __ROR8__(v61 + v64, 32);
  uint64_t v35 = v34 ^ __ROR8__(v32 ^ v33, 43);
  uint64_t v36 = v32 + v31;
  uint64_t v37 = v36 ^ __ROR8__(v31, 47);
  uint64_t v38 = (v34 ^ 0x1800000000000000) + v37;
  uint64_t v39 = v38 ^ __ROR8__(v37, 51);
  uint64_t v40 = (__ROR8__(v36, 32) ^ 0xFFLL) + v35;
  uint64_t v41 = __ROR8__(v35, 48);
  uint64_t v42 = __ROR8__(v38, 32) + (v40 ^ v41);
  uint64_t v43 = v42 ^ __ROR8__(v40 ^ v41, 43);
  uint64_t v44 = v39 + v40;
  uint64_t v45 = v44 ^ __ROR8__(v39, 47);
  uint64_t v46 = v45 + v42;
  uint64_t v47 = v46 ^ __ROR8__(v45, 51);
  uint64_t v48 = __ROR8__(v44, 32) + v43;
  uint64_t v49 = __ROR8__(v43, 48);
  uint64_t v50 = __ROR8__(v46, 32) + (v48 ^ v49);
  uint64_t v51 = v50 ^ __ROR8__(v48 ^ v49, 43);
  uint64_t v52 = v47 + v48;
  uint64_t v53 = v52 ^ __ROR8__(v47, 47);
  uint64_t v54 = v53 + v50;
  uint64_t v55 = v54 ^ __ROR8__(v53, 51);
  uint64_t v56 = __ROR8__(v52, 32) + v51;
  uint64_t v57 = __ROR8__(v51, 48);
  uint64_t v58 = __ROR8__(v54, 32) + (v56 ^ v57);
  return (v55 + v56) ^ __ROR8__(v55, 47) ^ v58 ^ __ROR8__(v55 + v56, 32) ^ v58 ^ __ROR8__(v56 ^ v57, 43);
}

+ (id)commandInfoWithIdentifier:(id)a3 revision:(id)a4 priority:(int64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  NSUInteger v9 = objc_alloc_init(MPPlaybackSessionCommandInfo);
  uint64_t v10 = [v8 copy];

  identifier = v9->_identifier;
  v9->_identifier = (NSString *)v10;

  uint64_t v12 = [v7 copy];
  revision = v9->_revision;
  v9->_revision = (NSString *)v12;

  v9->_int64_t priority = a5;

  return v9;
}

@end