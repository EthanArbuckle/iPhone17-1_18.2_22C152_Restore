@interface AFCompanionDeviceInfo
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFCompanionDeviceInfo)init;
- (AFCompanionDeviceInfo)initWithAssistantID:(id)a3 speechID:(id)a4 idsIdentifier:(id)a5 productPrefix:(id)a6 aceHost:(id)a7 syncMetadata:(id)a8 syncMetadataCapability:(BOOL)a9 peerToPeerHandoffCapability:(BOOL)a10 muxSupportCapability:(BOOL)a11 meDevice:(BOOL)a12 siriLanguage:(id)a13;
- (AFCompanionDeviceInfo)initWithBuilder:(id)a3;
- (AFCompanionDeviceInfo)initWithCoder:(id)a3;
- (AFCompanionDeviceInfo)initWithDictionaryRepresentation:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)meDevice;
- (BOOL)muxSupportCapability;
- (BOOL)peerToPeerHandoffCapability;
- (BOOL)syncMetadataCapability;
- (NSDictionary)syncMetadata;
- (NSString)aceHost;
- (NSString)assistantID;
- (NSString)description;
- (NSString)idsIdentifier;
- (NSString)productPrefix;
- (NSString)siriLanguage;
- (NSString)speechID;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)buildDictionaryRepresentation;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFCompanionDeviceInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriLanguage, 0);
  objc_storeStrong((id *)&self->_syncMetadata, 0);
  objc_storeStrong((id *)&self->_aceHost, 0);
  objc_storeStrong((id *)&self->_productPrefix, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
  objc_storeStrong((id *)&self->_speechID, 0);
  objc_storeStrong((id *)&self->_assistantID, 0);
}

- (NSString)siriLanguage
{
  return self->_siriLanguage;
}

- (BOOL)meDevice
{
  return self->_meDevice;
}

- (BOOL)muxSupportCapability
{
  return self->_muxSupportCapability;
}

- (BOOL)peerToPeerHandoffCapability
{
  return self->_peerToPeerHandoffCapability;
}

- (BOOL)syncMetadataCapability
{
  return self->_syncMetadataCapability;
}

- (NSDictionary)syncMetadata
{
  return self->_syncMetadata;
}

- (NSString)aceHost
{
  return self->_aceHost;
}

- (NSString)productPrefix
{
  return self->_productPrefix;
}

- (NSString)idsIdentifier
{
  return self->_idsIdentifier;
}

- (NSString)speechID
{
  return self->_speechID;
}

- (NSString)assistantID
{
  return self->_assistantID;
}

- (id)buildDictionaryRepresentation
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = v3;
  assistantID = self->_assistantID;
  if (assistantID) {
    [v3 setObject:assistantID forKey:@"assistantID"];
  }
  speechID = self->_speechID;
  if (speechID) {
    [v4 setObject:speechID forKey:@"speechID"];
  }
  idsIdentifier = self->_idsIdentifier;
  if (idsIdentifier) {
    [v4 setObject:idsIdentifier forKey:@"idsIdentifier"];
  }
  productPrefix = self->_productPrefix;
  if (productPrefix) {
    [v4 setObject:productPrefix forKey:@"productPrefix"];
  }
  aceHost = self->_aceHost;
  if (aceHost) {
    [v4 setObject:aceHost forKey:@"aceHost"];
  }
  if (self->_syncMetadata)
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[NSDictionary count](self->_syncMetadata, "count"));
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v11 = self->_syncMetadata;
    uint64_t v12 = [(NSDictionary *)v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v27 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          v17 = -[NSDictionary objectForKey:](self->_syncMetadata, "objectForKey:", v16, (void)v26);
          [v10 setObject:v17 forKey:v16];
        }
        uint64_t v13 = [(NSDictionary *)v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v13);
    }

    v18 = (void *)[v10 copy];
    [v4 setObject:v18 forKey:@"syncMetadata"];
  }
  v19 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", self->_syncMetadataCapability, (void)v26);
  [v4 setObject:v19 forKey:@"syncMetadataCapability"];

  v20 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_peerToPeerHandoffCapability];
  [v4 setObject:v20 forKey:@"peerToPeerHandoffCapability"];

  v21 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_muxSupportCapability];
  [v4 setObject:v21 forKey:@"muxSupportCapability"];

  v22 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_meDevice];
  [v4 setObject:v22 forKey:@"meDevice"];

  siriLanguage = self->_siriLanguage;
  if (siriLanguage) {
    [v4 setObject:siriLanguage forKey:@"siriLanguage"];
  }
  v24 = (void *)[v4 copy];

  return v24;
}

- (AFCompanionDeviceInfo)initWithDictionaryRepresentation:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 objectForKey:@"assistantID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v45 = v6;
    }
    else {
      id v45 = 0;
    }

    v8 = [v5 objectForKey:@"speechID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v44 = v8;
    }
    else {
      id v44 = 0;
    }

    v9 = [v5 objectForKey:@"idsIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v43 = v9;
    }
    else {
      id v43 = 0;
    }

    v10 = [v5 objectForKey:@"productPrefix"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v42 = v10;
    }
    else {
      id v42 = 0;
    }

    v11 = [v5 objectForKey:@"aceHost"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v41 = v11;
    }
    else {
      id v41 = 0;
    }

    uint64_t v12 = [v5 objectForKey:@"syncMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v40 = v5;
      uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v12, "count"));
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      v39 = v12;
      id v14 = v12;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v46 objects:v50 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v47;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v47 != v17) {
              objc_enumerationMutation(v14);
            }
            uint64_t v19 = *(void *)(*((void *)&v46 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v20 = [v14 objectForKey:v19];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v21 = v20;

                if (v21) {
                  [v13 setObject:v21 forKey:v19];
                }
              }
              else
              {

                id v21 = 0;
              }
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v46 objects:v50 count:16];
        }
        while (v16);
      }

      v22 = (void *)[v13 copy];
      uint64_t v12 = v39;
      v5 = v40;
    }
    else
    {
      v22 = 0;
    }

    v23 = [v5 objectForKey:@"syncMetadataCapability"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v24 = v23;
    }
    else {
      id v24 = 0;
    }

    char v25 = [v24 BOOLValue];
    long long v26 = [v5 objectForKey:@"peerToPeerHandoffCapability"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v27 = v26;
    }
    else {
      id v27 = 0;
    }

    char v28 = [v27 BOOLValue];
    long long v29 = [v5 objectForKey:@"muxSupportCapability"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v30 = v29;
    }
    else {
      id v30 = 0;
    }

    char v31 = [v30 BOOLValue];
    v32 = [v5 objectForKey:@"meDevice"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v33 = v32;
    }
    else {
      id v33 = 0;
    }

    char v34 = [v33 BOOLValue];
    v35 = [v5 objectForKey:@"siriLanguage"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v36 = v35;
    }
    else {
      id v36 = 0;
    }

    BYTE3(v38) = v34;
    BYTE2(v38) = v31;
    BYTE1(v38) = v28;
    LOBYTE(v38) = v25;
    self = -[AFCompanionDeviceInfo initWithAssistantID:speechID:idsIdentifier:productPrefix:aceHost:syncMetadata:syncMetadataCapability:peerToPeerHandoffCapability:muxSupportCapability:meDevice:siriLanguage:](self, "initWithAssistantID:speechID:idsIdentifier:productPrefix:aceHost:syncMetadata:syncMetadataCapability:peerToPeerHandoffCapability:muxSupportCapability:meDevice:siriLanguage:", v45, v44, v43, v42, v41, v22, v38, v36);

    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  assistantID = self->_assistantID;
  id v9 = a3;
  [v9 encodeObject:assistantID forKey:@"AFCompanionDeviceInfo::assistantID"];
  [v9 encodeObject:self->_speechID forKey:@"AFCompanionDeviceInfo::speechID"];
  [v9 encodeObject:self->_idsIdentifier forKey:@"AFCompanionDeviceInfo::idsIdentifier"];
  [v9 encodeObject:self->_productPrefix forKey:@"AFCompanionDeviceInfo::productPrefix"];
  [v9 encodeObject:self->_aceHost forKey:@"AFCompanionDeviceInfo::aceHost"];
  [v9 encodeObject:self->_syncMetadata forKey:@"AFCompanionDeviceInfo::syncMetadata"];
  v5 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_syncMetadataCapability];
  [v9 encodeObject:v5 forKey:@"AFCompanionDeviceInfo::syncMetadataCapability"];

  v6 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_peerToPeerHandoffCapability];
  [v9 encodeObject:v6 forKey:@"AFCompanionDeviceInfo::peerToPeerHandoffCapability"];

  v7 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_muxSupportCapability];
  [v9 encodeObject:v7 forKey:@"AFCompanionDeviceInfo::muxSupportCapability"];

  v8 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_meDevice];
  [v9 encodeObject:v8 forKey:@"AFCompanionDeviceInfo::meDevice"];

  [v9 encodeObject:self->_siriLanguage forKey:@"AFCompanionDeviceInfo::siriLanguage"];
}

- (AFCompanionDeviceInfo)initWithCoder:(id)a3
{
  id v3 = a3;
  char v25 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFCompanionDeviceInfo::assistantID"];
  id v24 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFCompanionDeviceInfo::speechID"];
  v23 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFCompanionDeviceInfo::idsIdentifier"];
  v22 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFCompanionDeviceInfo::productPrefix"];
  id v21 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFCompanionDeviceInfo::aceHost"];
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  v11 = objc_msgSend(v4, "setWithObjects:", v5, v6, v7, v8, v9, v10, objc_opt_class(), 0);
  uint64_t v12 = [v3 decodeObjectOfClasses:v11 forKey:@"AFCompanionDeviceInfo::syncMetadata"];

  uint64_t v13 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFCompanionDeviceInfo::syncMetadataCapability"];
  LOBYTE(v5) = [v13 BOOLValue];

  id v14 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFCompanionDeviceInfo::peerToPeerHandoffCapability"];
  LOBYTE(v6) = [v14 BOOLValue];

  uint64_t v15 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFCompanionDeviceInfo::muxSupportCapability"];
  LOBYTE(v7) = [v15 BOOLValue];

  uint64_t v16 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFCompanionDeviceInfo::meDevice"];
  LOBYTE(v9) = [v16 BOOLValue];

  uint64_t v17 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFCompanionDeviceInfo::siriLanguage"];

  BYTE3(v20) = v9;
  BYTE2(v20) = v7;
  BYTE1(v20) = v6;
  LOBYTE(v20) = v5;
  v18 = -[AFCompanionDeviceInfo initWithAssistantID:speechID:idsIdentifier:productPrefix:aceHost:syncMetadata:syncMetadataCapability:peerToPeerHandoffCapability:muxSupportCapability:meDevice:siriLanguage:](self, "initWithAssistantID:speechID:idsIdentifier:productPrefix:aceHost:syncMetadata:syncMetadataCapability:peerToPeerHandoffCapability:muxSupportCapability:meDevice:siriLanguage:", v25, v24, v23, v22, v21, v12, v20, v17);

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AFCompanionDeviceInfo *)a3;
  if (self == v4)
  {
    BOOL v24 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      BOOL syncMetadataCapability = self->_syncMetadataCapability;
      if (syncMetadataCapability == [(AFCompanionDeviceInfo *)v5 syncMetadataCapability]
        && (BOOL peerToPeerHandoffCapability = self->_peerToPeerHandoffCapability,
            peerToPeerHandoffCapability == [(AFCompanionDeviceInfo *)v5 peerToPeerHandoffCapability])&& (BOOL muxSupportCapability = self->_muxSupportCapability, muxSupportCapability == [(AFCompanionDeviceInfo *)v5 muxSupportCapability]))
      {
        uint64_t v9 = [(AFCompanionDeviceInfo *)v5 assistantID];
        assistantID = self->_assistantID;
        if (assistantID == v9 || [(NSString *)assistantID isEqual:v9])
        {
          v11 = [(AFCompanionDeviceInfo *)v5 speechID];
          speechID = self->_speechID;
          if (speechID == v11 || [(NSString *)speechID isEqual:v11])
          {
            uint64_t v13 = [(AFCompanionDeviceInfo *)v5 idsIdentifier];
            idsIdentifier = self->_idsIdentifier;
            if (idsIdentifier == v13 || [(NSString *)idsIdentifier isEqual:v13])
            {
              uint64_t v15 = [(AFCompanionDeviceInfo *)v5 productPrefix];
              productPrefix = self->_productPrefix;
              if (productPrefix == v15 || [(NSString *)productPrefix isEqual:v15])
              {
                uint64_t v17 = [(AFCompanionDeviceInfo *)v5 aceHost];
                aceHost = self->_aceHost;
                if (aceHost == v17 || [(NSString *)aceHost isEqual:v17])
                {
                  uint64_t v19 = [(AFCompanionDeviceInfo *)v5 syncMetadata];
                  syncMetadata = self->_syncMetadata;
                  if ((syncMetadata == v19 || [(NSDictionary *)syncMetadata isEqual:v19])
                    && (BOOL meDevice = self->_meDevice, meDevice == [(AFCompanionDeviceInfo *)v5 meDevice]))
                  {
                    v22 = [(AFCompanionDeviceInfo *)v5 siriLanguage];
                    siriLanguage = self->_siriLanguage;
                    BOOL v24 = siriLanguage == v22 || [(NSString *)siriLanguage isEqual:v22];
                  }
                  else
                  {
                    BOOL v24 = 0;
                  }
                }
                else
                {
                  BOOL v24 = 0;
                }
              }
              else
              {
                BOOL v24 = 0;
              }
            }
            else
            {
              BOOL v24 = 0;
            }
          }
          else
          {
            BOOL v24 = 0;
          }
        }
        else
        {
          BOOL v24 = 0;
        }
      }
      else
      {
        BOOL v24 = 0;
      }
    }
    else
    {
      BOOL v24 = 0;
    }
  }

  return v24;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_assistantID hash];
  NSUInteger v4 = [(NSString *)self->_speechID hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_idsIdentifier hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_productPrefix hash];
  NSUInteger v7 = [(NSString *)self->_aceHost hash];
  uint64_t v8 = v6 ^ v7 ^ [(NSDictionary *)self->_syncMetadata hash];
  uint64_t v9 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_syncMetadataCapability];
  uint64_t v10 = [v9 hash];
  v11 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_peerToPeerHandoffCapability];
  uint64_t v12 = v8 ^ v10 ^ [v11 hash];
  uint64_t v13 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_muxSupportCapability];
  uint64_t v14 = [v13 hash];
  uint64_t v15 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_meDevice];
  uint64_t v16 = v14 ^ [v15 hash];
  NSUInteger v17 = v12 ^ v16 ^ [(NSString *)self->_siriLanguage hash];

  return v17;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v13.receiver = self;
  v13.super_class = (Class)AFCompanionDeviceInfo;
  uint64_t v5 = [(AFCompanionDeviceInfo *)&v13 description];
  NSUInteger v6 = (void *)v5;
  NSUInteger v7 = @"YES";
  if (self->_syncMetadataCapability) {
    uint64_t v8 = @"YES";
  }
  else {
    uint64_t v8 = @"NO";
  }
  if (self->_peerToPeerHandoffCapability) {
    uint64_t v9 = @"YES";
  }
  else {
    uint64_t v9 = @"NO";
  }
  if (self->_muxSupportCapability) {
    uint64_t v10 = @"YES";
  }
  else {
    uint64_t v10 = @"NO";
  }
  if (!self->_meDevice) {
    NSUInteger v7 = @"NO";
  }
  v11 = (void *)[v4 initWithFormat:@"%@ {assistantID = %@, speechID = %@, idsIdentifier = %@, productPrefix = %@, aceHost = %@, syncMetadata = %@, BOOL syncMetadataCapability = %@, peerToPeerHandoffCapability = %@, muxSupportCapability = %@, meDevice = %@, siriLanguage = %@}", v5, *(_OWORD *)&self->_assistantID, *(_OWORD *)&self->_idsIdentifier, self->_aceHost, self->_syncMetadata, v8, v9, v10, v7, self->_siriLanguage];

  return v11;
}

- (NSString)description
{
  return (NSString *)[(AFCompanionDeviceInfo *)self _descriptionWithIndent:0];
}

- (AFCompanionDeviceInfo)initWithAssistantID:(id)a3 speechID:(id)a4 idsIdentifier:(id)a5 productPrefix:(id)a6 aceHost:(id)a7 syncMetadata:(id)a8 syncMetadataCapability:(BOOL)a9 peerToPeerHandoffCapability:(BOOL)a10 muxSupportCapability:(BOOL)a11 meDevice:(BOOL)a12 siriLanguage:(id)a13
{
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a7;
  id v23 = a8;
  id v24 = a13;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __197__AFCompanionDeviceInfo_initWithAssistantID_speechID_idsIdentifier_productPrefix_aceHost_syncMetadata_syncMetadataCapability_peerToPeerHandoffCapability_muxSupportCapability_meDevice_siriLanguage___block_invoke;
  v35[3] = &unk_1E592B348;
  id v36 = v18;
  id v37 = v19;
  id v38 = v20;
  id v39 = v21;
  id v40 = v22;
  id v41 = v23;
  BOOL v43 = a9;
  BOOL v44 = a10;
  BOOL v45 = a11;
  BOOL v46 = a12;
  id v42 = v24;
  id v25 = v24;
  id v26 = v23;
  id v27 = v22;
  id v28 = v21;
  id v29 = v20;
  id v30 = v19;
  id v31 = v18;
  v32 = [(AFCompanionDeviceInfo *)self initWithBuilder:v35];

  return v32;
}

void __197__AFCompanionDeviceInfo_initWithAssistantID_speechID_idsIdentifier_productPrefix_aceHost_syncMetadata_syncMetadataCapability_peerToPeerHandoffCapability_muxSupportCapability_meDevice_siriLanguage___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setAssistantID:v3];
  [v4 setSpeechID:*(void *)(a1 + 40)];
  [v4 setIdsIdentifier:*(void *)(a1 + 48)];
  [v4 setProductPrefix:*(void *)(a1 + 56)];
  [v4 setAceHost:*(void *)(a1 + 64)];
  [v4 setSyncMetadata:*(void *)(a1 + 72)];
  [v4 setSyncMetadataCapability:*(unsigned __int8 *)(a1 + 88)];
  [v4 setPeerToPeerHandoffCapability:*(unsigned __int8 *)(a1 + 89)];
  [v4 setMuxSupportCapability:*(unsigned __int8 *)(a1 + 90)];
  [v4 setMeDevice:*(unsigned __int8 *)(a1 + 91)];
  [v4 setSiriLanguage:*(void *)(a1 + 80)];
}

- (AFCompanionDeviceInfo)init
{
  return [(AFCompanionDeviceInfo *)self initWithBuilder:0];
}

- (AFCompanionDeviceInfo)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _AFCompanionDeviceInfoMutation *))a3;
  v30.receiver = self;
  v30.super_class = (Class)AFCompanionDeviceInfo;
  uint64_t v5 = [(AFCompanionDeviceInfo *)&v30 init];
  NSUInteger v6 = v5;
  if (v4 && v5)
  {
    NSUInteger v7 = [[_AFCompanionDeviceInfoMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_AFCompanionDeviceInfoMutation *)v7 isDirty])
    {
      uint64_t v8 = [(_AFCompanionDeviceInfoMutation *)v7 getAssistantID];
      uint64_t v9 = [v8 copy];
      assistantID = v6->_assistantID;
      v6->_assistantID = (NSString *)v9;

      v11 = [(_AFCompanionDeviceInfoMutation *)v7 getSpeechID];
      uint64_t v12 = [v11 copy];
      speechID = v6->_speechID;
      v6->_speechID = (NSString *)v12;

      uint64_t v14 = [(_AFCompanionDeviceInfoMutation *)v7 getIdsIdentifier];
      uint64_t v15 = [v14 copy];
      idsIdentifier = v6->_idsIdentifier;
      v6->_idsIdentifier = (NSString *)v15;

      NSUInteger v17 = [(_AFCompanionDeviceInfoMutation *)v7 getProductPrefix];
      uint64_t v18 = [v17 copy];
      productPrefix = v6->_productPrefix;
      v6->_productPrefix = (NSString *)v18;

      id v20 = [(_AFCompanionDeviceInfoMutation *)v7 getAceHost];
      uint64_t v21 = [v20 copy];
      aceHost = v6->_aceHost;
      v6->_aceHost = (NSString *)v21;

      id v23 = [(_AFCompanionDeviceInfoMutation *)v7 getSyncMetadata];
      uint64_t v24 = [v23 copy];
      syncMetadata = v6->_syncMetadata;
      v6->_syncMetadata = (NSDictionary *)v24;

      v6->_BOOL syncMetadataCapability = [(_AFCompanionDeviceInfoMutation *)v7 getSyncMetadataCapability];
      v6->_BOOL peerToPeerHandoffCapability = [(_AFCompanionDeviceInfoMutation *)v7 getPeerToPeerHandoffCapability];
      v6->_BOOL muxSupportCapability = [(_AFCompanionDeviceInfoMutation *)v7 getMuxSupportCapability];
      v6->_BOOL meDevice = [(_AFCompanionDeviceInfoMutation *)v7 getMeDevice];
      id v26 = [(_AFCompanionDeviceInfoMutation *)v7 getSiriLanguage];
      uint64_t v27 = [v26 copy];
      siriLanguage = v6->_siriLanguage;
      v6->_siriLanguage = (NSString *)v27;
    }
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)newWithBuilder:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBuilder:v3];

  return v4;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _AFCompanionDeviceInfoMutation *))a3;
  if (v4)
  {
    uint64_t v5 = [[_AFCompanionDeviceInfoMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_AFCompanionDeviceInfoMutation *)v5 isDirty])
    {
      NSUInteger v6 = objc_alloc_init(AFCompanionDeviceInfo);
      NSUInteger v7 = [(_AFCompanionDeviceInfoMutation *)v5 getAssistantID];
      uint64_t v8 = [v7 copy];
      assistantID = v6->_assistantID;
      v6->_assistantID = (NSString *)v8;

      uint64_t v10 = [(_AFCompanionDeviceInfoMutation *)v5 getSpeechID];
      uint64_t v11 = [v10 copy];
      speechID = v6->_speechID;
      v6->_speechID = (NSString *)v11;

      objc_super v13 = [(_AFCompanionDeviceInfoMutation *)v5 getIdsIdentifier];
      uint64_t v14 = [v13 copy];
      idsIdentifier = v6->_idsIdentifier;
      v6->_idsIdentifier = (NSString *)v14;

      uint64_t v16 = [(_AFCompanionDeviceInfoMutation *)v5 getProductPrefix];
      uint64_t v17 = [v16 copy];
      productPrefix = v6->_productPrefix;
      v6->_productPrefix = (NSString *)v17;

      id v19 = [(_AFCompanionDeviceInfoMutation *)v5 getAceHost];
      uint64_t v20 = [v19 copy];
      aceHost = v6->_aceHost;
      v6->_aceHost = (NSString *)v20;

      id v22 = [(_AFCompanionDeviceInfoMutation *)v5 getSyncMetadata];
      uint64_t v23 = [v22 copy];
      syncMetadata = v6->_syncMetadata;
      v6->_syncMetadata = (NSDictionary *)v23;

      v6->_BOOL syncMetadataCapability = [(_AFCompanionDeviceInfoMutation *)v5 getSyncMetadataCapability];
      v6->_BOOL peerToPeerHandoffCapability = [(_AFCompanionDeviceInfoMutation *)v5 getPeerToPeerHandoffCapability];
      v6->_BOOL muxSupportCapability = [(_AFCompanionDeviceInfoMutation *)v5 getMuxSupportCapability];
      v6->_BOOL meDevice = [(_AFCompanionDeviceInfoMutation *)v5 getMeDevice];
      id v25 = [(_AFCompanionDeviceInfoMutation *)v5 getSiriLanguage];
      uint64_t v26 = [v25 copy];
      siriLanguage = v6->_siriLanguage;
      v6->_siriLanguage = (NSString *)v26;
    }
    else
    {
      NSUInteger v6 = (AFCompanionDeviceInfo *)[(AFCompanionDeviceInfo *)self copy];
    }
  }
  else
  {
    NSUInteger v6 = (AFCompanionDeviceInfo *)[(AFCompanionDeviceInfo *)self copy];
  }

  return v6;
}

@end