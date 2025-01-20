@interface GEORPFeedbackDynamicForm
+ (BOOL)isValid:(id)a3;
+ (Class)formFieldsType;
+ (Class)userPathsType;
- (BOOL)hasAbBranchId;
- (BOOL)hasAbManifestVersion;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPFeedbackDynamicForm)init;
- (GEORPFeedbackDynamicForm)initWithData:(id)a3;
- (GEORPFeedbackDynamicForm)initWithDictionary:(id)a3;
- (GEORPFeedbackDynamicForm)initWithJSON:(id)a3;
- (NSMutableArray)formFields;
- (NSMutableArray)userPaths;
- (NSString)abBranchId;
- (NSString)abManifestVersion;
- (NSString)version;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)formFieldsAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (id)userPathsAtIndex:(unint64_t)a3;
- (unint64_t)formFieldsCount;
- (unint64_t)hash;
- (unint64_t)userPathsCount;
- (void)_addNoFlagsFormFields:(uint64_t)a1;
- (void)_addNoFlagsUserPaths:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readAbBranchId;
- (void)_readAbManifestVersion;
- (void)_readFormFields;
- (void)_readUserPaths;
- (void)_readVersion;
- (void)addFormFields:(id)a3;
- (void)addUserPaths:(id)a3;
- (void)clearFormFields;
- (void)clearUserPaths;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAbBranchId:(id)a3;
- (void)setAbManifestVersion:(id)a3;
- (void)setFormFields:(id)a3;
- (void)setUserPaths:(id)a3;
- (void)setVersion:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPFeedbackDynamicForm

- (GEORPFeedbackDynamicForm)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPFeedbackDynamicForm;
  v2 = [(GEORPFeedbackDynamicForm *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPFeedbackDynamicForm)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPFeedbackDynamicForm;
  v3 = [(GEORPFeedbackDynamicForm *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readVersion
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackDynamicFormReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readVersion_tags_2);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasVersion
{
  return self->_version != 0;
}

- (NSString)version
{
  -[GEORPFeedbackDynamicForm _readVersion]((uint64_t)self);
  version = self->_version;

  return version;
}

- (void)setVersion:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_version, a3);
}

- (void)_readUserPaths
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackDynamicFormReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUserPaths_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (NSMutableArray)userPaths
{
  -[GEORPFeedbackDynamicForm _readUserPaths]((uint64_t)self);
  userPaths = self->_userPaths;

  return userPaths;
}

- (void)setUserPaths:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  userPaths = self->_userPaths;
  self->_userPaths = v4;
}

- (void)clearUserPaths
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  userPaths = self->_userPaths;

  [(NSMutableArray *)userPaths removeAllObjects];
}

- (void)addUserPaths:(id)a3
{
  id v4 = a3;
  -[GEORPFeedbackDynamicForm _readUserPaths]((uint64_t)self);
  -[GEORPFeedbackDynamicForm _addNoFlagsUserPaths:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
}

- (void)_addNoFlagsUserPaths:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 40);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = v5;

      id v4 = *(void **)(a1 + 40);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)userPathsCount
{
  -[GEORPFeedbackDynamicForm _readUserPaths]((uint64_t)self);
  userPaths = self->_userPaths;

  return [(NSMutableArray *)userPaths count];
}

- (id)userPathsAtIndex:(unint64_t)a3
{
  -[GEORPFeedbackDynamicForm _readUserPaths]((uint64_t)self);
  userPaths = self->_userPaths;

  return (id)[(NSMutableArray *)userPaths objectAtIndex:a3];
}

+ (Class)userPathsType
{
  return (Class)objc_opt_class();
}

- (void)_readFormFields
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackDynamicFormReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFormFields_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (NSMutableArray)formFields
{
  -[GEORPFeedbackDynamicForm _readFormFields]((uint64_t)self);
  formFields = self->_formFields;

  return formFields;
}

- (void)setFormFields:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  formFields = self->_formFields;
  self->_formFields = v4;
}

- (void)clearFormFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  formFields = self->_formFields;

  [(NSMutableArray *)formFields removeAllObjects];
}

- (void)addFormFields:(id)a3
{
  id v4 = a3;
  -[GEORPFeedbackDynamicForm _readFormFields]((uint64_t)self);
  -[GEORPFeedbackDynamicForm _addNoFlagsFormFields:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
}

- (void)_addNoFlagsFormFields:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 32);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v5;

      id v4 = *(void **)(a1 + 32);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)formFieldsCount
{
  -[GEORPFeedbackDynamicForm _readFormFields]((uint64_t)self);
  formFields = self->_formFields;

  return [(NSMutableArray *)formFields count];
}

- (id)formFieldsAtIndex:(unint64_t)a3
{
  -[GEORPFeedbackDynamicForm _readFormFields]((uint64_t)self);
  formFields = self->_formFields;

  return (id)[(NSMutableArray *)formFields objectAtIndex:a3];
}

+ (Class)formFieldsType
{
  return (Class)objc_opt_class();
}

- (void)_readAbBranchId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackDynamicFormReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAbBranchId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasAbBranchId
{
  return self->_abBranchId != 0;
}

- (NSString)abBranchId
{
  -[GEORPFeedbackDynamicForm _readAbBranchId]((uint64_t)self);
  abBranchId = self->_abBranchId;

  return abBranchId;
}

- (void)setAbBranchId:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x21u;
  objc_storeStrong((id *)&self->_abBranchId, a3);
}

- (void)_readAbManifestVersion
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackDynamicFormReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAbManifestVersion_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasAbManifestVersion
{
  return self->_abManifestVersion != 0;
}

- (NSString)abManifestVersion
{
  -[GEORPFeedbackDynamicForm _readAbManifestVersion]((uint64_t)self);
  abManifestVersion = self->_abManifestVersion;

  return abManifestVersion;
}

- (void)setAbManifestVersion:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x22u;
  objc_storeStrong((id *)&self->_abManifestVersion, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPFeedbackDynamicForm;
  id v4 = [(GEORPFeedbackDynamicForm *)&v8 description];
  id v5 = [(GEORPFeedbackDynamicForm *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPFeedbackDynamicForm _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [(id)a1 version];
    if (v5) {
      [v4 setObject:v5 forKey:@"version"];
    }

    if (*(void *)(a1 + 40))
    {
      objc_super v6 = [(id)a1 userPaths];
      if (a2) {
        id v7 = @"userPaths";
      }
      else {
        id v7 = @"user_paths";
      }
      [v4 setObject:v6 forKey:v7];
    }
    if ([*(id *)(a1 + 32) count])
    {
      objc_super v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v9 = *(id *)(a1 + 32);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v23 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            if (a2) {
              [v14 jsonRepresentation];
            }
            else {
            v15 = objc_msgSend(v14, "dictionaryRepresentation", (void)v22);
            }
            objc_msgSend(v8, "addObject:", v15, (void)v22);
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
        }
        while (v11);
      }

      if (a2) {
        v16 = @"formFields";
      }
      else {
        v16 = @"form_fields";
      }
      objc_msgSend(v4, "setObject:forKey:", v8, v16, (void)v22);
    }
    v17 = [(id)a1 abBranchId];
    if (v17)
    {
      if (a2) {
        v18 = @"abBranchId";
      }
      else {
        v18 = @"ab_branch_id";
      }
      [v4 setObject:v17 forKey:v18];
    }

    v19 = [(id)a1 abManifestVersion];
    if (v19)
    {
      if (a2) {
        v20 = @"abManifestVersion";
      }
      else {
        v20 = @"ab_manifest_version";
      }
      [v4 setObject:v19 forKey:v20];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPFeedbackDynamicForm _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPFeedbackDynamicForm)initWithDictionary:(id)a3
{
  return (GEORPFeedbackDynamicForm *)-[GEORPFeedbackDynamicForm _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      objc_super v6 = [v5 objectForKeyedSubscript:@"version"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v7 = (void *)[v6 copy];
        [a1 setVersion:v7];
      }
      if (a3) {
        objc_super v8 = @"userPaths";
      }
      else {
        objc_super v8 = @"user_paths";
      }
      id v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      id v36 = v5;
      if (objc_opt_isKindOfClass())
      {
        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        id v10 = v9;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v41 objects:v46 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v42;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v42 != v13) {
                objc_enumerationMutation(v10);
              }
              v15 = *(void **)(*((void *)&v41 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v16 = (void *)[v15 copy];
                [a1 addUserPaths:v16];
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v41 objects:v46 count:16];
          }
          while (v12);
        }

        id v5 = v36;
      }

      if (a3) {
        v17 = @"formFields";
      }
      else {
        v17 = @"form_fields";
      }
      v18 = [v5 objectForKeyedSubscript:v17];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v39 = 0u;
        long long v40 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        v35 = v18;
        id v19 = v18;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v37 objects:v45 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v38;
          do
          {
            for (uint64_t j = 0; j != v21; ++j)
            {
              if (*(void *)v38 != v22) {
                objc_enumerationMutation(v19);
              }
              uint64_t v24 = *(void *)(*((void *)&v37 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v25 = [GEORPFeedbackFormField alloc];
                if (a3) {
                  uint64_t v26 = [(GEORPFeedbackFormField *)v25 initWithJSON:v24];
                }
                else {
                  uint64_t v26 = [(GEORPFeedbackFormField *)v25 initWithDictionary:v24];
                }
                uint64_t v27 = (void *)v26;
                objc_msgSend(a1, "addFormFields:", v26, v35);
              }
            }
            uint64_t v21 = [v19 countByEnumeratingWithState:&v37 objects:v45 count:16];
          }
          while (v21);
        }

        v18 = v35;
        id v5 = v36;
      }

      if (a3) {
        v28 = @"abBranchId";
      }
      else {
        v28 = @"ab_branch_id";
      }
      v29 = objc_msgSend(v5, "objectForKeyedSubscript:", v28, v35);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v30 = (void *)[v29 copy];
        [a1 setAbBranchId:v30];
      }
      if (a3) {
        v31 = @"abManifestVersion";
      }
      else {
        v31 = @"ab_manifest_version";
      }
      v32 = [v5 objectForKeyedSubscript:v31];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v33 = (void *)[v32 copy];
        [a1 setAbManifestVersion:v33];
      }
    }
  }

  return a1;
}

- (GEORPFeedbackDynamicForm)initWithJSON:(id)a3
{
  return (GEORPFeedbackDynamicForm *)-[GEORPFeedbackDynamicForm _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      objc_super v8 = (int *)&readAll__recursiveTag_145;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_146;
    }
    GEORPFeedbackDynamicFormReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEORPFeedbackDynamicFormCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackDynamicFormIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackDynamicFormReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x3F) == 0))
  {
    v14 = self->_reader;
    objc_sync_enter(v14);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v15 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v15];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v14);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPFeedbackDynamicForm *)self readAll:0];
    if (self->_version) {
      PBDataWriterWriteStringField();
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    objc_super v6 = self->_userPaths;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v21;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteStringField();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v7);
    }

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v10 = self->_formFields;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v17;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteSubmessage();
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }
      while (v11);
    }

    if (self->_abBranchId) {
      PBDataWriterWriteStringField();
    }
    if (self->_abManifestVersion) {
      PBDataWriterWriteStringField();
    }
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  -[GEORPFeedbackDynamicForm _readFormFields]((uint64_t)self);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_formFields;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "hasGreenTeaWithValue:", v3, (void)v12))
        {
          BOOL v10 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (void)copyTo:(id)a3
{
  long long v13 = (id *)a3;
  [(GEORPFeedbackDynamicForm *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v13 + 1, self->_reader);
  *((_DWORD *)v13 + 14) = self->_readerMarkPos;
  *((_DWORD *)v13 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_version) {
    objc_msgSend(v13, "setVersion:");
  }
  if ([(GEORPFeedbackDynamicForm *)self userPathsCount])
  {
    [v13 clearUserPaths];
    unint64_t v4 = [(GEORPFeedbackDynamicForm *)self userPathsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEORPFeedbackDynamicForm *)self userPathsAtIndex:i];
        [v13 addUserPaths:v7];
      }
    }
  }
  if ([(GEORPFeedbackDynamicForm *)self formFieldsCount])
  {
    [v13 clearFormFields];
    unint64_t v8 = [(GEORPFeedbackDynamicForm *)self formFieldsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEORPFeedbackDynamicForm *)self formFieldsAtIndex:j];
        [v13 addFormFields:v11];
      }
    }
  }
  if (self->_abBranchId) {
    objc_msgSend(v13, "setAbBranchId:");
  }
  long long v12 = v13;
  if (self->_abManifestVersion)
  {
    objc_msgSend(v13, "setAbManifestVersion:");
    long long v12 = v13;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x20) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEORPFeedbackDynamicFormReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPFeedbackDynamicForm *)self readAll:0];
  uint64_t v8 = [(NSString *)self->_version copyWithZone:a3];
  unint64_t v9 = (void *)v5[6];
  v5[6] = v8;

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  BOOL v10 = self->_userPaths;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v30;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v30 != v12) {
          objc_enumerationMutation(v10);
        }
        long long v14 = (void *)[*(id *)(*((void *)&v29 + 1) + 8 * v13) copyWithZone:a3];
        [v5 addUserPaths:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v11);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v15 = self->_formFields;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v26;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(v15);
        }
        long long v19 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * v18), "copyWithZone:", a3, (void)v25);
        [v5 addFormFields:v19];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v16);
  }

  uint64_t v20 = [(NSString *)self->_abBranchId copyWithZone:a3];
  long long v21 = (void *)v5[2];
  v5[2] = v20;

  uint64_t v22 = [(NSString *)self->_abManifestVersion copyWithZone:a3];
  long long v23 = (void *)v5[3];
  v5[3] = v22;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEORPFeedbackDynamicForm *)self readAll:1],
         [v4 readAll:1],
         version = self->_version,
         !((unint64_t)version | v4[6]))
     || -[NSString isEqual:](version, "isEqual:"))
    && ((userPaths = self->_userPaths, !((unint64_t)userPaths | v4[5]))
     || -[NSMutableArray isEqual:](userPaths, "isEqual:"))
    && ((formFields = self->_formFields, !((unint64_t)formFields | v4[4]))
     || -[NSMutableArray isEqual:](formFields, "isEqual:"))
    && ((abBranchId = self->_abBranchId, !((unint64_t)abBranchId | v4[2]))
     || -[NSString isEqual:](abBranchId, "isEqual:")))
  {
    abManifestVersion = self->_abManifestVersion;
    if ((unint64_t)abManifestVersion | v4[3]) {
      char v10 = -[NSString isEqual:](abManifestVersion, "isEqual:");
    }
    else {
      char v10 = 1;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  [(GEORPFeedbackDynamicForm *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_version hash];
  uint64_t v4 = [(NSMutableArray *)self->_userPaths hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_formFields hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_abBranchId hash];
  return v6 ^ [(NSString *)self->_abManifestVersion hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (id *)a3;
  [v4 readAll:0];
  if (v4[6]) {
    -[GEORPFeedbackDynamicForm setVersion:](self, "setVersion:");
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v4[5];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [(GEORPFeedbackDynamicForm *)self addUserPaths:*(void *)(*((void *)&v19 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = v4[4];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        -[GEORPFeedbackDynamicForm addFormFields:](self, "addFormFields:", *(void *)(*((void *)&v15 + 1) + 8 * j), (void)v15);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }

  if (v4[2]) {
    -[GEORPFeedbackDynamicForm setAbBranchId:](self, "setAbBranchId:");
  }
  if (v4[3]) {
    -[GEORPFeedbackDynamicForm setAbManifestVersion:](self, "setAbManifestVersion:");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_userPaths, 0);
  objc_storeStrong((id *)&self->_formFields, 0);
  objc_storeStrong((id *)&self->_abManifestVersion, 0);
  objc_storeStrong((id *)&self->_abBranchId, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end