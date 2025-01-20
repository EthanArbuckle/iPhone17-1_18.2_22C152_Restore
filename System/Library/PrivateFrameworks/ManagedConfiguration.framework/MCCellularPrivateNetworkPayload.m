@interface MCCellularPrivateNetworkPayload
+ (id)localizedPluralForm;
+ (id)localizedSingularForm;
+ (id)typeStrings;
- (BOOL)_checkForValidContents:(id)a3 outError:(id *)a4;
- (BOOL)cellularDataPreferred;
- (MCCellularPrivateNetworkPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5;
- (NSArray)geofenceList;
- (NSNumber)enableNRStandalone;
- (NSString)csgNetworkIdentifier;
- (NSString)dataSetName;
- (NSString)networkIdentifier;
- (NSString)versionNumber;
- (id)_validationErrorType:(int64_t)a3 forInvalidKey:(id)a4;
- (id)stubDictionary;
- (id)subtitle1Description;
- (id)subtitle1Label;
- (id)title;
- (void)_finishInitializationWithContents:(id)a3;
- (void)setCellularDataPreferred:(BOOL)a3;
- (void)setCsgNetworkIdentifier:(id)a3;
- (void)setDataSetName:(id)a3;
- (void)setEnableNRStandalone:(id)a3;
- (void)setGeofenceList:(id)a3;
- (void)setNetworkIdentifier:(id)a3;
- (void)setVersionNumber:(id)a3;
@end

@implementation MCCellularPrivateNetworkPayload

+ (id)typeStrings
{
  return (id)[MEMORY[0x1E4F1C978] arrayWithObject:@"com.apple.cellularprivatenetwork.managed"];
}

+ (id)localizedSingularForm
{
  return MCLocalizedFormat(@"CELLULAR_PRIVATE_NETWORK_SINGULAR_FORMAT", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)localizedPluralForm
{
  return MCLocalizedFormat(@"CELLULAR_PRIVATE_NETWORK_PLURAL_FORMAT", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (id)_validationErrorType:(int64_t)a3 forInvalidKey:(id)a4
{
  uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
  v10 = MCErrorArray(@"ERROR_PAYLOAD_FIELD_INVALID_P_FIELD", (uint64_t)a2, a3, (uint64_t)a4, v4, v5, v6, v7, a4);
  v11 = [v9 MCErrorWithDomain:@"MCPayloadErrorDomain" code:a3 descriptionArray:v10 errorType:@"MCFatalError"];

  return v11;
}

- (BOOL)_checkForValidContents:(id)a3 outError:(id *)a4
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!a4)
  {
    v41 = [MEMORY[0x1E4F28B00] currentHandler];
    [v41 handleFailureInMethod:a2 object:self file:@"MCCellularPrivateNetworkPayload.m" lineNumber:53 description:@"Invalid argument"];
  }
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id obj = v6;
  uint64_t v47 = [obj countByEnumeratingWithState:&v58 objects:v63 count:16];
  uint64_t v7 = 0;
  if (v47)
  {
    uint64_t v48 = *(void *)v59;
    v45 = a4;
    do
    {
      uint64_t v8 = 0;
      uint64_t v9 = v7;
      do
      {
        if (*(void *)v59 != v48) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v58 + 1) + 8 * v8);
        v11 = [v10 objectForKey:@"DataSetName"];
        if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          uint64_t v7 = [(MCCellularPrivateNetworkPayload *)self _validationErrorType:2002 forInvalidKey:@"DataSetName"];
LABEL_77:

LABEL_78:
          a4 = v45;
          goto LABEL_79;
        }
        uint64_t v12 = [v10 objectForKey:@"VersionNumber"];
        if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          uint64_t v7 = [(MCCellularPrivateNetworkPayload *)self _validationErrorType:2002 forInvalidKey:@"VersionNumber"];

          uint64_t v9 = (void *)v12;
          goto LABEL_77;
        }
        v13 = [v10 objectForKey:@"Geofences"];
        if (!v13) {
          goto LABEL_47;
        }
        id v52 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || (unint64_t)[v13 count] > 0x3E8)
        {
          v14 = v13;
          v15 = (void *)v12;
          uint64_t v7 = [(MCCellularPrivateNetworkPayload *)self _validationErrorType:2003 forInvalidKey:@"Geofences"];
          int v16 = 4;
          goto LABEL_68;
        }
        long long v56 = 0u;
        long long v57 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        id v46 = v13;
        uint64_t v51 = [v46 countByEnumeratingWithState:&v54 objects:v62 count:16];
        if (!v51) {
          goto LABEL_46;
        }
        uint64_t v50 = *(void *)v55;
        uint64_t v43 = v12;
        v44 = v11;
        v42 = v13;
        do
        {
          uint64_t v17 = 0;
          do
          {
            if (*(void *)v55 != v50) {
              objc_enumerationMutation(v46);
            }
            v18 = *(void **)(*((void *)&v54 + 1) + 8 * v17);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              uint64_t v29 = [(MCCellularPrivateNetworkPayload *)self _validationErrorType:2003 forInvalidKey:@"Geofences"];

              uint64_t v9 = (void *)v29;
LABEL_45:
              uint64_t v12 = v43;
              v11 = v44;
              v13 = v42;
              goto LABEL_46;
            }
            v19 = [v18 objectForKey:@"Longitude"];
            v20 = [v18 objectForKey:@"Latitude"];
            v21 = [v18 objectForKey:@"Radius"];
            v22 = [v18 objectForKey:@"GeofenceId"];
            if (!v19 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              v23 = self;
              uint64_t v24 = 2002;
              v25 = @"Longitude";
LABEL_37:
              uint64_t v26 = -[MCCellularPrivateNetworkPayload _validationErrorType:forInvalidKey:](v23, "_validationErrorType:forInvalidKey:", v24, v25, v42, v43, v44);

              int v27 = 0;
              uint64_t v9 = (void *)v26;
              goto LABEL_38;
            }
            if (!v20 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              v23 = self;
              uint64_t v24 = 2002;
              v25 = @"Latitude";
              goto LABEL_37;
            }
            if (!v21 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              v23 = self;
              uint64_t v24 = 2002;
              v25 = @"Radius";
              goto LABEL_37;
            }
            if (!v22 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              v23 = self;
              uint64_t v24 = 2002;
              goto LABEL_36;
            }
            if ([v52 containsObject:v22])
            {
              v23 = self;
              uint64_t v24 = 2000;
LABEL_36:
              v25 = @"GeofenceId";
              goto LABEL_37;
            }
            [v52 addObject:v22];
            int v27 = 1;
LABEL_38:

            if (!v27) {
              goto LABEL_45;
            }
            ++v17;
          }
          while (v51 != v17);
          uint64_t v28 = [v46 countByEnumeratingWithState:&v54 objects:v62 count:16];
          uint64_t v12 = v43;
          v11 = v44;
          v13 = v42;
          uint64_t v51 = v28;
        }
        while (v28);
LABEL_46:

LABEL_47:
        uint64_t v7 = v9;
        uint64_t v30 = objc_msgSend(v10, "objectForKey:", @"CellularDataPreferred", v42, v43, v44);
        id v52 = (id)v30;
        if (!v30)
        {
LABEL_51:
          uint64_t v9 = [v10 objectForKey:@"EnableNRStandalone"];
          if (!v9) {
            goto LABEL_55;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if (([v9 isEqual:&unk_1EF4D07C0] & 1) != 0
              || ([v9 isEqual:&unk_1EF4D07D8] & 1) != 0)
            {
LABEL_55:
              v32 = [v10 objectForKey:@"CsgNetworkIdentifier"];
              if (v32 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
              {
                v14 = v13;
                v15 = (void *)v12;
                [(MCCellularPrivateNetworkPayload *)self _validationErrorType:2003 forInvalidKey:@"CsgNetworkIdentifier"];
                v33 = v7;
                uint64_t v7 = v16 = 4;
              }
              else
              {
                v14 = v13;
                v15 = (void *)v12;
                v33 = [v10 objectForKey:@"NetworkIdentifier"];
                if (v33 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                {
                  uint64_t v38 = [(MCCellularPrivateNetworkPayload *)self _validationErrorType:2003 forInvalidKey:@"NetworkIdentifier"];

                  int v16 = 4;
                  uint64_t v7 = (void *)v38;
                }
                else
                {
                  int v16 = 4 * (v7 != 0);
                }
              }

              goto LABEL_67;
            }
            v14 = v13;
            v15 = (void *)v12;
            v36 = self;
            uint64_t v37 = 2004;
          }
          else
          {
            v14 = v13;
            v15 = (void *)v12;
            v36 = self;
            uint64_t v37 = 2003;
          }
          [(MCCellularPrivateNetworkPayload *)v36 _validationErrorType:v37 forInvalidKey:@"EnableNRStandalone"];
          v32 = v7;
          uint64_t v7 = v16 = 4;
LABEL_67:

          goto LABEL_68;
        }
        v31 = (void *)v30;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (([v31 isEqual:&unk_1EF4D07C0] & 1) != 0
            || ([v31 isEqual:&unk_1EF4D07D8] & 1) != 0)
          {
            goto LABEL_51;
          }
          v14 = v13;
          v15 = (void *)v12;
          v34 = self;
          uint64_t v35 = 2004;
        }
        else
        {
          v14 = v13;
          v15 = (void *)v12;
          v34 = self;
          uint64_t v35 = 2003;
        }
        [(MCCellularPrivateNetworkPayload *)v34 _validationErrorType:v35 forInvalidKey:@"CellularDataPreferred"];
        uint64_t v7 = v16 = 4;
LABEL_68:

        if (v16) {
          goto LABEL_78;
        }
        ++v8;
        uint64_t v9 = v7;
      }
      while (v8 != v47);
      uint64_t v39 = [obj countByEnumeratingWithState:&v58 objects:v63 count:16];
      a4 = v45;
      uint64_t v47 = v39;
    }
    while (v39);
  }
LABEL_79:

  if (a4) {
    *a4 = v7;
  }

  return v7 == 0;
}

- (void)_finishInitializationWithContents:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = v4;
  uint64_t v32 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v32)
  {
    uint64_t v30 = *(void *)v40;
    v31 = self;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v40 != v30) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v39 + 1) + 8 * v6);
        uint64_t v8 = [v7 objectForKey:@"DataSetName"];
        dataSetName = self->_dataSetName;
        self->_dataSetName = v8;

        v10 = [v7 objectForKey:@"VersionNumber"];
        versionNumber = self->_versionNumber;
        self->_versionNumber = v10;

        self->_enableNRStandalone = (NSNumber *)(id)[v7 objectForKey:@"EnableNRStandalone"];
        uint64_t v12 = [v7 objectForKey:@"CsgNetworkIdentifier"];
        csgNetworkIdentifier = self->_csgNetworkIdentifier;
        self->_csgNetworkIdentifier = v12;

        v14 = [v7 objectForKey:@"NetworkIdentifier"];
        networkIdentifier = self->_networkIdentifier;
        self->_networkIdentifier = v14;

        v33 = [v7 objectForKey:@"CellularDataPreferred"];
        uint64_t v34 = v6;
        if (v33)
        {
          int v16 = [v7 objectForKey:@"CellularDataPreferred"];
          self->_cellularDataPreferred = [v16 BOOLValue];
        }
        else
        {
          self->_cellularDataPreferred = 0;
        }
        uint64_t v17 = [v7 objectForKey:@"Geofences"];
        v18 = v17;
        if (v17)
        {
          long long v37 = 0u;
          long long v38 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          uint64_t v19 = [v17 countByEnumeratingWithState:&v35 objects:v43 count:16];
          if (v19)
          {
            uint64_t v20 = v19;
            uint64_t v21 = *(void *)v36;
            do
            {
              for (uint64_t i = 0; i != v20; ++i)
              {
                if (*(void *)v36 != v21) {
                  objc_enumerationMutation(v18);
                }
                v23 = *(void **)(*((void *)&v35 + 1) + 8 * i);
                uint64_t v24 = objc_alloc_init(MCGeofenceInfo);
                v25 = [v23 objectForKey:@"Longitude"];
                uint64_t v26 = [v23 objectForKey:@"Latitude"];
                int v27 = [v23 objectForKey:@"Radius"];
                uint64_t v28 = [v23 objectForKey:@"GeofenceId"];
                [(MCGeofenceInfo *)v24 setLongitude:v25];
                [(MCGeofenceInfo *)v24 setLatitude:v26];
                [(MCGeofenceInfo *)v24 setRadius:v27];
                [(MCGeofenceInfo *)v24 setGeofenceId:v28];
                [v5 addObject:v24];
              }
              uint64_t v20 = [v18 countByEnumeratingWithState:&v35 objects:v43 count:16];
            }
            while (v20);
          }
        }

        uint64_t v6 = v34 + 1;
        self = v31;
      }
      while (v34 + 1 != v32);
      uint64_t v32 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v32);
  }

  if ([v5 count]) {
    objc_storeStrong((id *)&self->_geofenceList, v5);
  }
}

- (MCCellularPrivateNetworkPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v45.receiver = self;
  v45.super_class = (Class)MCCellularPrivateNetworkPayload;
  uint64_t v9 = [(MCPayload *)&v45 initWithDictionary:v8 profile:a4 outError:a5];
  if (!v9) {
    goto LABEL_25;
  }
  id v44 = 0;
  v10 = +[MCProfile removeOptionalObjectInDictionary:v8 key:@"PayloadContent" type:objc_opt_class() errorDomain:@"MCPayloadErrorDomain" invalidDataCode:2003 invalidDataErrorString:@"ERROR_PAYLOAD_FIELD_INVALID_P_FIELD" outError:&v44];
  id v11 = v44;
  if (!v11 && v10)
  {
    id v43 = 0;
    [(MCCellularPrivateNetworkPayload *)v9 _checkForValidContents:v10 outError:&v43];
    id v11 = v43;
  }
  uint64_t v12 = [(MCPayload *)v9 profile];
  int v13 = [v12 isStub];

  if (v13)
  {
    if (v11)
    {
      v14 = 0;
      v15 = 0;
    }
    else
    {
      id v42 = 0;
      v15 = +[MCProfile removeOptionalObjectInDictionary:v8 key:@"DataSetName" type:objc_opt_class() errorDomain:@"MCPayloadErrorDomain" invalidDataCode:2003 invalidDataErrorString:@"ERROR_PAYLOAD_FIELD_INVALID_P_FIELD" outError:&v42];
      id v16 = v42;
      if (!v16)
      {
        id v41 = 0;
        uint64_t v17 = +[MCProfile removeOptionalObjectInDictionary:v8 key:@"VersionNumber" type:objc_opt_class() errorDomain:@"MCPayloadErrorDomain" invalidDataCode:2003 invalidDataErrorString:@"ERROR_PAYLOAD_FIELD_INVALID_P_FIELD" outError:&v41];
        id v37 = v41;
        if (v37)
        {
          id v11 = v37;
          v14 = 0;
        }
        else
        {
          id v40 = 0;
          v14 = +[MCProfile removeOptionalObjectInDictionary:v8 key:@"CsgNetworkIdentifier" type:objc_opt_class() errorDomain:@"MCPayloadErrorDomain" invalidDataCode:2003 invalidDataErrorString:@"ERROR_PAYLOAD_FIELD_INVALID_P_FIELD" outError:&v40];
          id v38 = v40;
          if (!v38)
          {
            id v39 = 0;
            uint64_t v18 = +[MCProfile removeOptionalObjectInDictionary:v8 key:@"NetworkIdentifier" type:objc_opt_class() errorDomain:@"MCPayloadErrorDomain" invalidDataCode:2003 invalidDataErrorString:@"ERROR_PAYLOAD_FIELD_INVALID_P_FIELD" outError:&v39];
            id v11 = v39;
            goto LABEL_12;
          }
          id v11 = v38;
        }
LABEL_11:
        uint64_t v18 = 0;
LABEL_12:
        dataSetName = v9->_dataSetName;
        v9->_dataSetName = v15;
        uint64_t v20 = v15;

        versionNumber = v9->_versionNumber;
        v9->_versionNumber = v17;
        v22 = v17;

        csgNetworkIdentifier = v9->_csgNetworkIdentifier;
        v9->_csgNetworkIdentifier = v14;
        uint64_t v24 = v14;

        networkIdentifier = v9->_networkIdentifier;
        v9->_networkIdentifier = (NSString *)v18;

        goto LABEL_13;
      }
      id v11 = v16;
      v14 = 0;
    }
    uint64_t v17 = 0;
    goto LABEL_11;
  }
LABEL_13:
  if (v11)
  {
    uint64_t v26 = [(MCPayload *)v9 malformedPayloadErrorWithError:v11];
    int v27 = v26;
    if (a5) {
      *a5 = v26;
    }
    uint64_t v28 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      uint64_t v29 = v28;
      uint64_t v30 = objc_opt_class();
      id v31 = v30;
      uint64_t v32 = [v27 MCVerboseDescription];
      *(_DWORD *)buf = 138543618;
      uint64_t v47 = v30;
      __int16 v48 = 2114;
      id v49 = v32;
      _os_log_impl(&dword_1A13F0000, v29, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);
    }
    uint64_t v9 = 0;
  }
  if ([v8 count])
  {
    v33 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
    {
      uint64_t v34 = v33;
      long long v35 = [(MCPayload *)v9 friendlyName];
      *(_DWORD *)buf = 138543618;
      uint64_t v47 = v35;
      __int16 v48 = 2114;
      id v49 = v8;
      _os_log_impl(&dword_1A13F0000, v34, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);
    }
  }
  if (!v11) {
    [(MCCellularPrivateNetworkPayload *)v9 _finishInitializationWithContents:v10];
  }

LABEL_25:
  return v9;
}

- (id)stubDictionary
{
  v9.receiver = self;
  v9.super_class = (Class)MCCellularPrivateNetworkPayload;
  uint64_t v3 = [(MCPayload *)&v9 stubDictionary];
  id v4 = [(MCCellularPrivateNetworkPayload *)self dataSetName];
  [v3 setObject:v4 forKeyedSubscript:@"DataSetName"];

  uint64_t v5 = [(MCCellularPrivateNetworkPayload *)self versionNumber];
  [v3 setObject:v5 forKeyedSubscript:@"VersionNumber"];

  uint64_t v6 = [(MCCellularPrivateNetworkPayload *)self csgNetworkIdentifier];
  [v3 setObject:v6 forKeyedSubscript:@"CsgNetworkIdentifier"];

  uint64_t v7 = [(MCCellularPrivateNetworkPayload *)self networkIdentifier];
  [v3 setObject:v7 forKeyedSubscript:@"NetworkIdentifier"];

  return v3;
}

- (id)title
{
  dataSetName = self->_dataSetName;
  if (dataSetName)
  {
    uint64_t v3 = dataSetName;
  }
  else
  {
    MCLocalizedString(@"NAME_MISSING");
    uint64_t v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)subtitle1Label
{
  return MCLocalizedString(@"VERSION_COLON");
}

- (id)subtitle1Description
{
  versionNumber = self->_versionNumber;
  if (versionNumber)
  {
    uint64_t v3 = versionNumber;
  }
  else
  {
    MCLocalizedString(@"VERSION_MISSING");
    uint64_t v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (NSString)dataSetName
{
  return self->_dataSetName;
}

- (void)setDataSetName:(id)a3
{
}

- (NSString)versionNumber
{
  return self->_versionNumber;
}

- (void)setVersionNumber:(id)a3
{
}

- (NSArray)geofenceList
{
  return self->_geofenceList;
}

- (void)setGeofenceList:(id)a3
{
}

- (NSString)csgNetworkIdentifier
{
  return self->_csgNetworkIdentifier;
}

- (void)setCsgNetworkIdentifier:(id)a3
{
}

- (NSString)networkIdentifier
{
  return self->_networkIdentifier;
}

- (void)setNetworkIdentifier:(id)a3
{
}

- (BOOL)cellularDataPreferred
{
  return self->_cellularDataPreferred;
}

- (void)setCellularDataPreferred:(BOOL)a3
{
  self->_cellularDataPreferred = a3;
}

- (NSNumber)enableNRStandalone
{
  return self->_enableNRStandalone;
}

- (void)setEnableNRStandalone:(id)a3
{
  self->_enableNRStandalone = (NSNumber *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkIdentifier, 0);
  objc_storeStrong((id *)&self->_csgNetworkIdentifier, 0);
  objc_storeStrong((id *)&self->_geofenceList, 0);
  objc_storeStrong((id *)&self->_versionNumber, 0);
  objc_storeStrong((id *)&self->_dataSetName, 0);
}

@end