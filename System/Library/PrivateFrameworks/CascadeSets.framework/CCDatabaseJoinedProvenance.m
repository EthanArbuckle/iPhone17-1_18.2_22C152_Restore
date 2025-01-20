@interface CCDatabaseJoinedProvenance
+ (id)joinedProvenanceFromDatabaseValueRow:(id)a3;
- (CCDatabaseJoinedProvenance)initWithProvenance:(id)a3 contentData:(id)a4 metaContentData:(id)a5;
- (CCProvenanceRecord)provenance;
- (NSData)contentData;
- (NSData)metaContentData;
@end

@implementation CCDatabaseJoinedProvenance

+ (id)joinedProvenanceFromDatabaseValueRow:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = [(id)objc_opt_class() recordFromDatabaseValueRow:v3];
    if (v4)
    {
      v5 = objc_msgSend(v3, "dataValueAtColumnIndex:", objc_msgSend(v3, "count") - 2);
      v6 = objc_msgSend(v3, "dataValueAtColumnIndex:", objc_msgSend(v3, "count") - 1);
      v7 = [[CCDatabaseJoinedProvenance alloc] initWithProvenance:v4 contentData:v5 metaContentData:v6];
    }
    else
    {
      v8 = __biome_log_for_category();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        +[CCDatabaseJoinedProvenance joinedProvenanceFromDatabaseValueRow:]();
      }

      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (CCDatabaseJoinedProvenance)initWithProvenance:(id)a3 contentData:(id)a4 metaContentData:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CCDatabaseJoinedProvenance;
  v12 = [(CCDatabaseJoinedProvenance *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_provenance, a3);
    objc_storeStrong((id *)&v13->_contentData, a4);
    objc_storeStrong((id *)&v13->_metaContentData, a5);
  }

  return v13;
}

- (CCProvenanceRecord)provenance
{
  return self->_provenance;
}

- (NSData)contentData
{
  return self->_contentData;
}

- (NSData)metaContentData
{
  return self->_metaContentData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metaContentData, 0);
  objc_storeStrong((id *)&self->_contentData, 0);

  objc_storeStrong((id *)&self->_provenance, 0);
}

+ (void)joinedProvenanceFromDatabaseValueRow:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_249B92000, v0, v1, "joinedProvenanceFromDatabaseValueRow could not initialize provenance record from row: %@", v2, v3, v4, v5, v6);
}

@end