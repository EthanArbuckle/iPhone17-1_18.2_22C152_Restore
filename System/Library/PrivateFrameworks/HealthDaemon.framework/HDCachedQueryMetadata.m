@interface HDCachedQueryMetadata
- (BOOL)isEqual:(id)a3;
- (HDCachedQueryMetadata)initWithCachingIdentifier:(id)a3 sourceEntityPersistentID:(int64_t)a4 buildVersion:(id)a5 anchorDate:(id)a6 intervalComponents:(id)a7;
- (HDCachedQueryMetadata)initWithCachingIdentifier:(id)a3 sourceEntityPersistentID:(int64_t)a4 maxAnchor:(int64_t)a5 queryStartIndex:(id)a6 queryEndIndex:(id)a7 generationNumber:(int64_t)a8 buildVersion:(id)a9 anchorDate:(id)a10 intervalComponents:(id)a11;
- (NSDate)anchorDate;
- (NSDateComponents)intervalComponents;
- (NSNumber)queryEndIndex;
- (NSNumber)queryStartIndex;
- (NSString)buildVersion;
- (NSString)cachingIdentifier;
- (int64_t)generationNumber;
- (int64_t)maxAnchor;
- (int64_t)sourceEntityPersistentID;
@end

@implementation HDCachedQueryMetadata

- (HDCachedQueryMetadata)initWithCachingIdentifier:(id)a3 sourceEntityPersistentID:(int64_t)a4 buildVersion:(id)a5 anchorDate:(id)a6 intervalComponents:(id)a7
{
  return [(HDCachedQueryMetadata *)self initWithCachingIdentifier:a3 sourceEntityPersistentID:a4 maxAnchor:0 queryStartIndex:0 queryEndIndex:0 generationNumber:0 buildVersion:a5 anchorDate:a6 intervalComponents:a7];
}

- (HDCachedQueryMetadata)initWithCachingIdentifier:(id)a3 sourceEntityPersistentID:(int64_t)a4 maxAnchor:(int64_t)a5 queryStartIndex:(id)a6 queryEndIndex:(id)a7 generationNumber:(int64_t)a8 buildVersion:(id)a9 anchorDate:(id)a10 intervalComponents:(id)a11
{
  id v17 = a3;
  id v34 = a6;
  id v33 = a7;
  id v18 = a9;
  id v19 = a10;
  id v20 = a11;
  if (!v17)
  {
    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"HDCachedQueryMetadataEntity.m", 86, @"Invalid parameter not satisfying: %@", @"cachingIdentifier != nil" object file lineNumber description];
  }
  v35.receiver = self;
  v35.super_class = (Class)HDCachedQueryMetadata;
  v21 = [(HDCachedQueryMetadata *)&v35 init];
  if (v21)
  {
    uint64_t v22 = [v17 copy];
    cachingIdentifier = v21->_cachingIdentifier;
    v21->_cachingIdentifier = (NSString *)v22;

    v21->_sourceEntityPersistentID = a4;
    v21->_maxAnchor = a5;
    objc_storeStrong((id *)&v21->_queryStartIndex, a6);
    objc_storeStrong((id *)&v21->_queryEndIndex, a7);
    v21->_generationNumber = a8;
    uint64_t v24 = [v18 copy];
    buildVersion = v21->_buildVersion;
    v21->_buildVersion = (NSString *)v24;

    uint64_t v26 = [v19 copy];
    anchorDate = v21->_anchorDate;
    v21->_anchorDate = (NSDate *)v26;

    uint64_t v28 = [v20 copy];
    intervalComponents = v21->_intervalComponents;
    v21->_intervalComponents = (NSDateComponents *)v28;
  }
  return v21;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HDCachedQueryMetadata *)a3;
  if (self == v4)
  {
    BOOL v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(HDCachedQueryMetadata *)self cachingIdentifier];
      uint64_t v7 = [(HDCachedQueryMetadata *)v5 cachingIdentifier];
      if (v6 == (void *)v7)
      {
      }
      else
      {
        v8 = (void *)v7;
        uint64_t v9 = [(HDCachedQueryMetadata *)v5 cachingIdentifier];
        if (!v9) {
          goto LABEL_37;
        }
        v10 = (void *)v9;
        v11 = [(HDCachedQueryMetadata *)self cachingIdentifier];
        v12 = [(HDCachedQueryMetadata *)v5 cachingIdentifier];
        int v13 = [v11 isEqual:v12];

        if (!v13) {
          goto LABEL_38;
        }
      }
      int64_t v15 = [(HDCachedQueryMetadata *)self sourceEntityPersistentID];
      if (v15 != [(HDCachedQueryMetadata *)v5 sourceEntityPersistentID]) {
        goto LABEL_38;
      }
      int64_t v16 = [(HDCachedQueryMetadata *)self maxAnchor];
      if (v16 != [(HDCachedQueryMetadata *)v5 maxAnchor]) {
        goto LABEL_38;
      }
      v6 = [(HDCachedQueryMetadata *)self queryStartIndex];
      uint64_t v17 = [(HDCachedQueryMetadata *)v5 queryStartIndex];
      if (v6 == (void *)v17)
      {
      }
      else
      {
        v8 = (void *)v17;
        uint64_t v18 = [(HDCachedQueryMetadata *)v5 queryStartIndex];
        if (!v18) {
          goto LABEL_37;
        }
        id v19 = (void *)v18;
        id v20 = [(HDCachedQueryMetadata *)self queryStartIndex];
        v21 = [(HDCachedQueryMetadata *)v5 queryStartIndex];
        int v22 = [v20 isEqual:v21];

        if (!v22) {
          goto LABEL_38;
        }
      }
      v6 = [(HDCachedQueryMetadata *)self queryEndIndex];
      uint64_t v23 = [(HDCachedQueryMetadata *)v5 queryEndIndex];
      if (v6 == (void *)v23)
      {
      }
      else
      {
        v8 = (void *)v23;
        uint64_t v24 = [(HDCachedQueryMetadata *)v5 queryEndIndex];
        if (!v24) {
          goto LABEL_37;
        }
        v25 = (void *)v24;
        uint64_t v26 = [(HDCachedQueryMetadata *)self queryEndIndex];
        v27 = [(HDCachedQueryMetadata *)v5 queryEndIndex];
        int v28 = [v26 isEqual:v27];

        if (!v28) {
          goto LABEL_38;
        }
      }
      int64_t v29 = [(HDCachedQueryMetadata *)self generationNumber];
      if (v29 != [(HDCachedQueryMetadata *)v5 generationNumber]) {
        goto LABEL_38;
      }
      v6 = [(HDCachedQueryMetadata *)self buildVersion];
      uint64_t v30 = [(HDCachedQueryMetadata *)v5 buildVersion];
      if (v6 == (void *)v30)
      {
      }
      else
      {
        v8 = (void *)v30;
        uint64_t v31 = [(HDCachedQueryMetadata *)v5 buildVersion];
        if (!v31) {
          goto LABEL_37;
        }
        v32 = (void *)v31;
        id v33 = [(HDCachedQueryMetadata *)self buildVersion];
        id v34 = [(HDCachedQueryMetadata *)v5 buildVersion];
        int v35 = [v33 isEqualToString:v34];

        if (!v35) {
          goto LABEL_38;
        }
      }
      v6 = [(HDCachedQueryMetadata *)self anchorDate];
      uint64_t v36 = [(HDCachedQueryMetadata *)v5 anchorDate];
      if (v6 == (void *)v36)
      {
      }
      else
      {
        v8 = (void *)v36;
        uint64_t v37 = [(HDCachedQueryMetadata *)v5 anchorDate];
        if (!v37) {
          goto LABEL_37;
        }
        v38 = (void *)v37;
        v39 = [(HDCachedQueryMetadata *)self anchorDate];
        v40 = [(HDCachedQueryMetadata *)v5 anchorDate];
        int v41 = [v39 isEqualToDate:v40];

        if (!v41) {
          goto LABEL_38;
        }
      }
      v6 = [(HDCachedQueryMetadata *)self intervalComponents];
      uint64_t v42 = [(HDCachedQueryMetadata *)v5 intervalComponents];
      if (v6 == (void *)v42)
      {

LABEL_42:
        BOOL v14 = 1;
        goto LABEL_39;
      }
      v8 = (void *)v42;
      uint64_t v43 = [(HDCachedQueryMetadata *)v5 intervalComponents];
      if (v43)
      {
        v44 = (void *)v43;
        v45 = [(HDCachedQueryMetadata *)self intervalComponents];
        v46 = [(HDCachedQueryMetadata *)v5 intervalComponents];
        char v47 = [v45 isEqual:v46];

        if (v47) {
          goto LABEL_42;
        }
LABEL_38:
        BOOL v14 = 0;
LABEL_39:

        goto LABEL_40;
      }
LABEL_37:

      goto LABEL_38;
    }
    BOOL v14 = 0;
  }
LABEL_40:

  return v14;
}

- (NSString)cachingIdentifier
{
  return self->_cachingIdentifier;
}

- (int64_t)sourceEntityPersistentID
{
  return self->_sourceEntityPersistentID;
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (int64_t)maxAnchor
{
  return self->_maxAnchor;
}

- (NSNumber)queryStartIndex
{
  return self->_queryStartIndex;
}

- (NSNumber)queryEndIndex
{
  return self->_queryEndIndex;
}

- (int64_t)generationNumber
{
  return self->_generationNumber;
}

- (NSDate)anchorDate
{
  return self->_anchorDate;
}

- (NSDateComponents)intervalComponents
{
  return self->_intervalComponents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intervalComponents, 0);
  objc_storeStrong((id *)&self->_anchorDate, 0);
  objc_storeStrong((id *)&self->_queryEndIndex, 0);
  objc_storeStrong((id *)&self->_queryStartIndex, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);

  objc_storeStrong((id *)&self->_cachingIdentifier, 0);
}

@end