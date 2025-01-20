@interface CorrectionsProfilesSyncHandler
- (void)_loadCorrectionProfiles;
- (void)beginSyncWithAnchor:(id)a3 validity:(id)a4 count:(int64_t)a5 forKey:(id)a6 beginInfo:(id)a7;
- (void)getChangeAfterAnchor:(id)a3 changeInfo:(id)a4;
- (void)syncDidEnd;
@end

@implementation CorrectionsProfilesSyncHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastState, 0);
  objc_storeStrong((id *)&self->_correctionProfileKeysToDelete, 0);
  objc_storeStrong((id *)&self->_correctionProfileKeysToSync, 0);

  objc_storeStrong((id *)&self->_correctionProfiles, 0);
}

- (void)_loadCorrectionProfiles
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F36658] defaultSynchedKnowledgeStore];
  id v32 = 0;
  v27 = [v3 dictionaryRepresentationAndReturnError:&v32];
  id v4 = v32;
  v5 = *MEMORY[0x263F28380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28380], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v34 = "-[CorrectionsProfilesSyncHandler _loadCorrectionProfiles]";
    __int16 v35 = 2112;
    id v36 = v27;
    _os_log_debug_impl(&dword_222E28000, v5, OS_LOG_TYPE_DEBUG, "%s Loaded data from db: %@", buf, 0x16u);
    if (v4) {
      goto LABEL_3;
    }
  }
  else if (v4)
  {
LABEL_3:
    v6 = (void *)*MEMORY[0x263F28380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28380], OS_LOG_TYPE_ERROR))
    {
      v22 = v6;
      v23 = [v3 name];
      *(_DWORD *)buf = 136315650;
      v34 = "-[CorrectionsProfilesSyncHandler _loadCorrectionProfiles]";
      __int16 v35 = 2112;
      id v36 = v4;
      __int16 v37 = 2112;
      v38 = v23;
      _os_log_error_impl(&dword_222E28000, v22, OS_LOG_TYPE_ERROR, "%s Failed to load corrections profiles %@ for name %@", buf, 0x20u);
    }
    correctionProfiles = self->_correctionProfiles;
    self->_correctionProfiles = 0;
    goto LABEL_21;
  }
  v24 = self;
  v25 = v3;
  v26 = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v27, "count"));
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v8 = [v27 allKeys];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v41 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v29;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v28 + 1) + 8 * v12);
        v14 = (void *)[objc_alloc(NSURL) initWithString:v13];
        v15 = [v14 scheme];
        int v16 = [v15 isEqualToString:@"Correction"];

        if (v16)
        {
          v17 = [v27 objectForKey:v13];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [(NSDictionary *)v26 setObject:v17 forKey:v14];
          }
          else
          {
            v18 = (void *)*MEMORY[0x263F28380];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28380], OS_LOG_TYPE_ERROR))
            {
              v19 = v18;
              v20 = objc_opt_class();
              *(_DWORD *)buf = 136315906;
              v34 = "-[CorrectionsProfilesSyncHandler _loadCorrectionProfiles]";
              __int16 v35 = 2112;
              id v36 = v13;
              __int16 v37 = 2112;
              v38 = v17;
              __int16 v39 = 2112;
              v40 = v20;
              id v21 = v20;
              _os_log_error_impl(&dword_222E28000, v19, OS_LOG_TYPE_ERROR, "%s Unexpected value type for key %@: %@ of type %@", buf, 0x2Au);
            }
          }
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v41 count:16];
    }
    while (v10);
  }

  v3 = v25;
  correctionProfiles = v24->_correctionProfiles;
  v24->_correctionProfiles = v26;
LABEL_21:
}

- (void)syncDidEnd
{
  [(CorrectionsProfilesLastState *)self->_lastState saveNewState:self->_correctionProfiles];
  correctionProfiles = self->_correctionProfiles;
  self->_correctionProfiles = 0;

  correctionProfileKeysToSync = self->_correctionProfileKeysToSync;
  self->_correctionProfileKeysToSync = 0;
}

- (void)getChangeAfterAnchor:(id)a3 changeInfo:(id)a4
{
  id v22 = a4;
  p_correctionProfileKeysToSync = &self->_correctionProfileKeysToSync;
  correctionProfileKeysToSync = self->_correctionProfileKeysToSync;
  id v8 = a3;
  uint64_t v9 = [(NSMutableArray *)correctionProfileKeysToSync count];
  p_correctionProfileKeysToDelete = &self->_correctionProfileKeysToDelete;
  if (v9 + [(NSMutableArray *)self->_correctionProfileKeysToDelete count])
  {
    uint64_t v11 = [v8 componentsSeparatedByString:@"Correction"];

    uint64_t v12 = [v11 lastObject];
    v13 = [(CorrectionsProfilesLastState *)self->_lastState digest];
    if (v13 && ([v12 isEqualToString:v13] & 1) != 0 || !objc_msgSend(v12, "length")) {
      uint64_t v14 = 0;
    }
    else {
      uint64_t v14 = [v12 integerValue] + 1;
    }
    v15 = [(NSMutableArray *)*p_correctionProfileKeysToSync lastObject];
    if (v15)
    {
      int v16 = [(NSDictionary *)self->_correctionProfiles objectForKey:v15];
      id v17 = objc_alloc_init(MEMORY[0x263F64750]);
      [v17 setIdentifier:v15];
      [v17 setCorrectionEntryData:v16];
      [v22 setObject:v17];
      v18 = &self->_correctionProfileKeysToSync;
    }
    else
    {
      int v16 = [(NSMutableArray *)*p_correctionProfileKeysToDelete lastObject];
      id v17 = objc_alloc_init(MEMORY[0x263F64750]);
      [v17 setIdentifier:v16];
      [v22 setObject:v17];
      [v22 setIsDelete:1];
      v18 = &self->_correctionProfileKeysToDelete;
    }
    [(NSMutableArray *)*v18 removeLastObject];

    if ([(NSMutableArray *)*p_correctionProfileKeysToSync count]
      || [(NSMutableArray *)*p_correctionProfileKeysToDelete count])
    {
      id v19 = [NSString alloc];
      v20 = [v11 firstObject];
      id v21 = (void *)[v19 initWithFormat:@"%@%@%tu", v20, @"Correction", v14];
    }
    else
    {
      id v21 = CorrectionsProfilesDigest(self->_correctionProfiles);
    }
    [v22 setPostAnchor:v21];
  }
  else
  {
    [v22 setPostAnchor:v8];

    [v22 setObject:0];
  }
}

- (void)beginSyncWithAnchor:(id)a3 validity:(id)a4 count:(int64_t)a5 forKey:(id)a6 beginInfo:(id)a7
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if (self->_lastState)
  {
    BOOL v16 = 1;
  }
  else
  {
    id v17 = objc_alloc_init(CorrectionsProfilesLastState);
    lastState = self->_lastState;
    self->_lastState = v17;

    BOOL v16 = [(CorrectionsProfilesLastState *)self->_lastState loadLastState];
  }
  [(CorrectionsProfilesSyncHandler *)self _loadCorrectionProfiles];
  BOOL v19 = a5 <= 0 && [(NSDictionary *)self->_correctionProfiles count] == 0;
  if (([v13 isEqualToString:@"CorrectionsProfiles-2.0"] & v16) != 1
    || [(CorrectionsProfilesLastState *)self->_lastState count] != a5)
  {
    goto LABEL_14;
  }
  v20 = [(CorrectionsProfilesLastState *)self->_lastState digest];
  if (([v20 isEqualToString:v12] | v19))
  {
    if (a5 <= 0)
    {
    }
    else
    {
      NSUInteger v21 = [(NSDictionary *)self->_correctionProfiles count];

      if (!v21) {
        goto LABEL_14;
      }
    }
    v27 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSDictionary count](self->_correctionProfiles, "count"));
    correctionProfiles = self->_correctionProfiles;
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = sub_222E2A56C;
    v35[3] = &unk_264674200;
    v35[4] = self;
    long long v29 = v27;
    id v36 = v29;
    [(NSDictionary *)correctionProfiles enumerateKeysAndObjectsUsingBlock:v35];
    correctionProfileKeysToSync = self->_correctionProfileKeysToSync;
    self->_correctionProfileKeysToSync = v29;
    v24 = v29;

    long long v31 = [(CorrectionsProfilesLastState *)self->_lastState correctionKeys];
    id v32 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v31, "count"));
    correctionProfileKeysToDelete = self->_correctionProfileKeysToDelete;
    self->_correctionProfileKeysToDelete = v32;

    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = sub_222E2A604;
    v34[3] = &unk_264674228;
    v34[4] = self;
    [v31 enumerateObjectsUsingBlock:v34];

    v26 = v36;
    goto LABEL_17;
  }

LABEL_14:
  id v22 = *MEMORY[0x263F28380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28380], OS_LOG_TYPE_INFO))
  {
    v23 = self->_lastState;
    *(_DWORD *)buf = 136315906;
    v38 = "-[CorrectionsProfilesSyncHandler beginSyncWithAnchor:validity:count:forKey:beginInfo:]";
    __int16 v39 = 2112;
    id v40 = v13;
    __int16 v41 = 2112;
    uint64_t v42 = v23;
    __int16 v43 = 1024;
    BOOL v44 = v16;
    _os_log_impl(&dword_222E28000, v22, OS_LOG_TYPE_INFO, "%s Reset sync for validity %@, last state: %@, loaded last state? %d", buf, 0x26u);
  }
  [v15 resetWithValidity:@"CorrectionsProfiles-2.0"];
  v24 = [(NSDictionary *)self->_correctionProfiles allKeys];
  v25 = (NSMutableArray *)[(NSMutableArray *)v24 mutableCopy];
  v26 = self->_correctionProfileKeysToSync;
  self->_correctionProfileKeysToSync = v25;
LABEL_17:
}

@end