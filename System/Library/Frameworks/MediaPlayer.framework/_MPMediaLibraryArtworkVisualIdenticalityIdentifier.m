@interface _MPMediaLibraryArtworkVisualIdenticalityIdentifier
- (BOOL)isEqual:(id)a3;
- (NSString)availableArtworkToken;
- (NSString)description;
- (NSString)fetchableArtworkToken;
- (_MPMediaLibraryArtworkVisualIdenticalityIdentifier)init;
- (_MPMediaLibraryArtworkVisualIdenticalityIdentifier)initWithArtworkType:(int64_t)a3 availableArtworkToken:(id)a4 fetchableArtworkToken:(id)a5;
- (id)stringRepresentation;
- (int64_t)artworkType;
- (unint64_t)hash;
@end

@implementation _MPMediaLibraryArtworkVisualIdenticalityIdentifier

- (id)stringRepresentation
{
  v3 = [(_MPMediaLibraryArtworkVisualIdenticalityIdentifier *)self fetchableArtworkToken];
  if (![v3 length])
  {
    uint64_t v4 = [(_MPMediaLibraryArtworkVisualIdenticalityIdentifier *)self availableArtworkToken];

    v3 = (void *)v4;
  }
  v5 = (void *)[v3 copy];

  return v5;
}

- (_MPMediaLibraryArtworkVisualIdenticalityIdentifier)initWithArtworkType:(int64_t)a3 availableArtworkToken:(id)a4 fetchableArtworkToken:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)_MPMediaLibraryArtworkVisualIdenticalityIdentifier;
  v10 = [(_MPMediaLibraryArtworkVisualIdenticalityIdentifier *)&v17 init];
  v11 = v10;
  if (v10)
  {
    v10->_artworkType = a3;
    uint64_t v12 = [v8 copy];
    availableArtworkToken = v11->_availableArtworkToken;
    v11->_availableArtworkToken = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    fetchableArtworkToken = v11->_fetchableArtworkToken;
    v11->_fetchableArtworkToken = (NSString *)v14;
  }
  return v11;
}

- (NSString)fetchableArtworkToken
{
  return self->_fetchableArtworkToken;
}

- (NSString)availableArtworkToken
{
  return self->_availableArtworkToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchableArtworkToken, 0);

  objc_storeStrong((id *)&self->_availableArtworkToken, 0);
}

- (int64_t)artworkType
{
  return self->_artworkType;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (_MPMediaLibraryArtworkVisualIdenticalityIdentifier *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      if ([(NSString *)self->_availableArtworkToken length]) {
        availableArtworkToken = self->_availableArtworkToken;
      }
      else {
        availableArtworkToken = 0;
      }
      id v8 = availableArtworkToken;
      if ([(NSString *)self->_fetchableArtworkToken length]) {
        fetchableArtworkToken = self->_fetchableArtworkToken;
      }
      else {
        fetchableArtworkToken = 0;
      }
      v10 = fetchableArtworkToken;
      if ([v5[2] length]) {
        id v11 = v5[2];
      }
      else {
        id v11 = 0;
      }
      id v12 = v11;
      if ([v5[3] length]) {
        id v13 = v5[3];
      }
      else {
        id v13 = 0;
      }
      uint64_t v14 = (NSString *)v13;
      v15 = (NSString *)v12;
      if (v8 == v15)
      {
      }
      else
      {
        v16 = v8;
        int v17 = [(NSString *)v16 isEqual:v15];

        if (!v17)
        {
          v18 = v15;
          v19 = v18;
          if (v18 == v10) {
            char v20 = 1;
          }
          else {
            char v20 = [(NSString *)v18 isEqual:v10];
          }

          if (v14) {
            char v20 = 0;
          }
          v23 = v16;
          v24 = v23;
          if (v23 == v14) {
            char v25 = 1;
          }
          else {
            char v25 = [(NSString *)v23 isEqual:v14];
          }

          if (v10) {
            char v26 = 0;
          }
          else {
            char v26 = v25;
          }
          char v7 = v26 | v20;
          goto LABEL_36;
        }
      }
      v21 = v10;
      v22 = v21;
      if (v21 == v14) {
        char v7 = 1;
      }
      else {
        char v7 = [(NSString *)v21 isEqual:v14];
      }

LABEL_36:
      goto LABEL_37;
    }
    char v7 = 0;
  }
LABEL_37:

  return v7;
}

- (unint64_t)hash
{
  v81[18] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = MSVHasherSharedSeed();
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  uint64_t v80 = 0;
  uint64_t v5 = v3 ^ 0x6C7967656E657261;
  uint64_t v6 = ((v3 ^ 0x736F6D6570736575) + (v4 ^ 0x646F72616E646F6DLL)) ^ __ROR8__(v4 ^ 0x646F72616E646F6DLL, 51);
  uint64_t v7 = __ROR8__((v3 ^ 0x736F6D6570736575) + (v4 ^ 0x646F72616E646F6DLL), 32);
  int64_t artworkType = self->_artworkType;
  availableArtworkToken = self->_availableArtworkToken;
  uint64_t v10 = v4 ^ 0x7465646279746573 ^ artworkType;
  uint64_t v11 = v5 + v10;
  uint64_t v12 = __ROR8__(v10, 48);
  uint64_t v13 = (v11 ^ v12) + v7;
  NSUInteger v14 = v13 ^ __ROR8__(v11 ^ v12, 43);
  NSUInteger v15 = v13 ^ artworkType;
  uint64_t v16 = v11 + v6;
  NSUInteger v17 = v16 ^ __ROR8__(v6, 47);
  uint64_t v18 = __ROR8__(v16, 32);
  NSUInteger v66 = v17;
  uint64_t v67 = v18;
  NSUInteger v65 = v13 ^ artworkType;
  NSUInteger v68 = v14;
  uint64_t v69 = 0x800000000000000;
  uint64_t v19 = 0x1000000000000000;
  if ([(NSString *)availableArtworkToken length])
  {
    NSUInteger v20 = [(NSString *)self->_availableArtworkToken hash];
    NSUInteger v21 = (v15 + v17) ^ __ROR8__(v17, 51);
    NSUInteger v22 = v18 + (v14 ^ v20);
    uint64_t v23 = __ROR8__(v14 ^ v20, 48);
    NSUInteger v24 = (v22 ^ v23) + __ROR8__(v15 + v17, 32);
    NSUInteger v14 = v24 ^ __ROR8__(v22 ^ v23, 43);
    NSUInteger v17 = (v22 + v21) ^ __ROR8__(v21, 47);
    uint64_t v18 = __ROR8__(v22 + v21, 32);
    uint64_t v67 = v18;
    NSUInteger v68 = v14;
    NSUInteger v15 = v24 ^ v20;
    NSUInteger v65 = v24 ^ v20;
    NSUInteger v66 = v17;
    uint64_t v69 = 0x1000000000000000;
    uint64_t v19 = 0x1800000000000000;
  }
  if ([(NSString *)self->_fetchableArtworkToken length])
  {
    char v25 = self->_fetchableArtworkToken;
    uint64_t v26 = [(NSString *)v25 hash];
    NSUInteger v27 = (v15 + v17) ^ __ROR8__(v17, 51);
    uint64_t v28 = v18 + (v14 ^ v26);
    uint64_t v29 = __ROR8__(v14 ^ v26, 48);
    uint64_t v30 = (v28 ^ v29) + __ROR8__(v15 + v17, 32);
    uint64_t v31 = v30 ^ __ROR8__(v28 ^ v29, 43);
    uint64_t v32 = v28 + v27;
    uint64_t v67 = __ROR8__(v32, 32);
    NSUInteger v68 = v31;
    NSUInteger v65 = v30 ^ v26;
    NSUInteger v66 = v32 ^ __ROR8__(v27, 47);
    uint64_t v69 = v19;
  }
  memset(&v81[1], 0, 64);
  v81[0] = 1000;
  NSUInteger v33 = (v65 + v66) ^ __ROR8__(v66, 51);
  uint64_t v34 = v67 + (v68 ^ v69);
  uint64_t v35 = __ROR8__(v68 ^ v69, 48);
  uint64_t v36 = (v34 ^ v35) + __ROR8__(v65 + v66, 32);
  uint64_t v37 = v36 ^ __ROR8__(v34 ^ v35, 43);
  uint64_t v38 = v34 + v33;
  uint64_t v39 = v38 ^ __ROR8__(v33, 47);
  uint64_t v40 = (v36 ^ v69) + v39;
  uint64_t v41 = v40 ^ __ROR8__(v39, 51);
  uint64_t v42 = (__ROR8__(v38, 32) ^ 0xFFLL) + v37;
  uint64_t v43 = __ROR8__(v37, 48);
  uint64_t v44 = __ROR8__(v40, 32) + (v42 ^ v43);
  uint64_t v45 = v44 ^ __ROR8__(v42 ^ v43, 43);
  uint64_t v46 = v41 + v42;
  uint64_t v47 = v46 ^ __ROR8__(v41, 47);
  uint64_t v48 = v47 + v44;
  uint64_t v49 = v48 ^ __ROR8__(v47, 51);
  uint64_t v50 = __ROR8__(v46, 32) + v45;
  uint64_t v51 = __ROR8__(v45, 48);
  uint64_t v52 = __ROR8__(v48, 32) + (v50 ^ v51);
  uint64_t v53 = v52 ^ __ROR8__(v50 ^ v51, 43);
  uint64_t v54 = v49 + v50;
  uint64_t v55 = v54 ^ __ROR8__(v49, 47);
  uint64_t v56 = v55 + v52;
  uint64_t v57 = v56 ^ __ROR8__(v55, 51);
  uint64_t v58 = __ROR8__(v54, 32) + v53;
  uint64_t v59 = __ROR8__(v53, 48);
  NSUInteger v60 = __ROR8__(v56, 32) + (v58 ^ v59);
  NSUInteger v61 = v60 ^ __ROR8__(v58 ^ v59, 43);
  uint64_t v62 = v57 + v58;
  NSUInteger v65 = v60;
  uint64_t v67 = __ROR8__(v62, 32);
  NSUInteger v68 = v61;
  unint64_t v63 = v62 ^ __ROR8__(v57, 47) ^ v60 ^ v67 ^ v61;
  v81[1] = v63;
  *(_OWORD *)&v81[9] = *(_OWORD *)v81;
  *(_OWORD *)&v81[11] = *(_OWORD *)&v81[2];
  *(_OWORD *)&v81[13] = *(_OWORD *)&v81[4];
  *(_OWORD *)&v81[15] = *(_OWORD *)&v81[6];
  v81[17] = 0;
  return v63;
}

- (NSString)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = (void *)[v3 initWithFormat:@"<%@: %p", v5, self];

  unint64_t artworkType = self->_artworkType;
  if (artworkType > 5) {
    id v8 = 0;
  }
  else {
    id v8 = off_1E57F8220[artworkType];
  }
  [v6 appendFormat:@"; unint64_t artworkType = %@", v8];
  if (self->_availableArtworkToken) {
    [v6 appendFormat:@"; availableArtworkToken = %@", self->_availableArtworkToken];
  }
  if (self->_fetchableArtworkToken) {
    [v6 appendFormat:@"; fetchableArtworkToken = %@", self->_fetchableArtworkToken];
  }
  [v6 appendString:@">"];

  return (NSString *)v6;
}

- (_MPMediaLibraryArtworkVisualIdenticalityIdentifier)init
{
  return [(_MPMediaLibraryArtworkVisualIdenticalityIdentifier *)self initWithArtworkType:0 availableArtworkToken:0 fetchableArtworkToken:0];
}

@end