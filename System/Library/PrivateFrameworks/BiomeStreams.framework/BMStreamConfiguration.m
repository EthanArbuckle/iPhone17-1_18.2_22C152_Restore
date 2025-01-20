@interface BMStreamConfiguration
+ (id)_libraryStreamConfigurationWithUUID:(id)a3 streamIdentifier:(id)a4 eventClass:(Class)a5 storeConfig:(id)a6 syncPolicy:(id)a7 legacyNames:(id)a8 internalMetadata:(id)a9 enableSubscriptions:(BOOL)a10 enableSubscriptionSubstream:(BOOL)a11 enableTombstoneSubstream:(BOOL)a12 allowedClients:(id)a13 pruningTriggers:(id)a14 spaceAttributionOwner:(id)a15;
- (BMStoreConfig)storeConfig;
- (BMStreamConfiguration)initWithStreamIdentifier:(id)a3 eventClass:(Class)a4 storeConfig:(id)a5;
- (BMStreamConfiguration)initWithStreamIdentifier:(id)a3 eventClass:(Class)a4 storeConfig:(id)a5 syncPolicy:(id)a6 alternativeNames:(id)a7;
- (BMStreamConfiguration)initWithStreamIdentifier:(id)a3 eventClass:(Class)a4 storeConfig:(id)a5 syncPolicy:(id)a6 alternativeNames:(id)a7 internalMetadata:(id)a8;
- (BMStreamInternalMetadata)internalMetadata;
- (BMStreamSyncPolicy)syncPolicy;
- (BOOL)enableSubscriptionSubstream;
- (BOOL)enableSubscriptions;
- (BOOL)enableTombstoneSubstream;
- (Class)eventClass;
- (NSArray)allowedClients;
- (NSArray)legacyNames;
- (NSArray)pruningTriggers;
- (NSString)spaceAttribution;
- (NSString)streamIdentifier;
- (NSUUID)streamUUID;
- (id)description;
@end

@implementation BMStreamConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spaceAttribution, 0);
  objc_storeStrong((id *)&self->_pruningTriggers, 0);
  objc_storeStrong((id *)&self->_allowedClients, 0);
  objc_storeStrong((id *)&self->_internalMetadata, 0);
  objc_storeStrong((id *)&self->_syncPolicy, 0);
  objc_storeStrong((id *)&self->_legacyNames, 0);
  objc_storeStrong((id *)&self->_storeConfig, 0);
  objc_storeStrong((id *)&self->_eventClass, 0);
  objc_storeStrong((id *)&self->_streamUUID, 0);

  objc_storeStrong((id *)&self->_streamIdentifier, 0);
}

+ (id)_libraryStreamConfigurationWithUUID:(id)a3 streamIdentifier:(id)a4 eventClass:(Class)a5 storeConfig:(id)a6 syncPolicy:(id)a7 legacyNames:(id)a8 internalMetadata:(id)a9 enableSubscriptions:(BOOL)a10 enableSubscriptionSubstream:(BOOL)a11 enableTombstoneSubstream:(BOOL)a12 allowedClients:(id)a13 pruningTriggers:(id)a14 spaceAttributionOwner:(id)a15
{
  id v33 = a3;
  id v20 = a4;
  id v29 = a6;
  id v21 = a6;
  id v32 = a7;
  id v31 = a8;
  id v30 = a9;
  id v22 = a13;
  id v23 = a14;
  id v24 = a15;
  v25 = [BMStreamConfiguration alloc];
  v26 = v25;
  if (v25)
  {
    objc_storeStrong((id *)&v25->_streamUUID, a3);
    objc_storeStrong((id *)&v26->_streamIdentifier, a4);
    objc_storeStrong((id *)&v26->_eventClass, a5);
    objc_storeStrong((id *)&v26->_storeConfig, v29);
    objc_storeStrong((id *)&v26->_syncPolicy, a7);
    objc_storeStrong((id *)&v26->_legacyNames, a8);
    objc_storeStrong((id *)&v26->_internalMetadata, a9);
    v26->_enableSubscriptions = a10;
    v26->_enableSubscriptionSubstream = a11;
    v26->_enableTombstoneSubstream = a12;
    objc_storeStrong((id *)&v26->_allowedClients, a13);
    objc_storeStrong((id *)&v26->_pruningTriggers, a14);
    objc_storeStrong((id *)&v26->_spaceAttribution, a15);
  }

  return v26;
}

- (BMStoreConfig)storeConfig
{
  return self->_storeConfig;
}

- (Class)eventClass
{
  return self->_eventClass;
}

- (NSString)streamIdentifier
{
  return self->_streamIdentifier;
}

- (NSUUID)streamUUID
{
  return self->_streamUUID;
}

- (NSArray)legacyNames
{
  return self->_legacyNames;
}

- (BMStreamConfiguration)initWithStreamIdentifier:(id)a3 eventClass:(Class)a4 storeConfig:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  BYTE2(v12) = 1;
  LOWORD(v12) = 1;
  v10 = (BMStreamConfiguration *)objc_msgSend((id)objc_opt_class(), "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", 0, v9, a4, v8, 0, MEMORY[0x1E4F1CBF0], 0, v12, 0, 0, 0);

  return v10;
}

- (BMStreamConfiguration)initWithStreamIdentifier:(id)a3 eventClass:(Class)a4 storeConfig:(id)a5 syncPolicy:(id)a6 alternativeNames:(id)a7
{
  return [(BMStreamConfiguration *)self initWithStreamIdentifier:a3 eventClass:a4 storeConfig:a5 syncPolicy:a6 alternativeNames:a7 internalMetadata:0];
}

- (BMStreamConfiguration)initWithStreamIdentifier:(id)a3 eventClass:(Class)a4 storeConfig:(id)a5 syncPolicy:(id)a6 alternativeNames:(id)a7 internalMetadata:(id)a8
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v37 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v18 = v16;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    v35 = a4;
    id v36 = v15;
    id v21 = self;
    uint64_t v22 = *(void *)v39;
    while (2)
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v39 != v22) {
          objc_enumerationMutation(v18);
        }
        uint64_t v24 = *(void *)(*((void *)&v38 + 1) + 8 * v23);
        uint64_t v25 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v24];
        if (v25)
        {
          v26 = (void *)v25;
          v28 = (void *)[v18 mutableCopy];
          [v28 removeObject:v24];
          v27 = (void *)[v28 copy];

          goto LABEL_11;
        }
        ++v23;
      }
      while (v20 != v23);
      uint64_t v20 = [v18 countByEnumeratingWithState:&v38 objects:v42 count:16];
      if (v20) {
        continue;
      }
      break;
    }
    v26 = 0;
    v27 = v18;
LABEL_11:
    self = v21;
    a4 = v35;
    id v15 = v36;
  }
  else
  {
    v26 = 0;
    v27 = v18;
  }

  char v29 = [v14 hasPrefix:@"SoundAnalysis."];
  BOOL v30 = ([v14 hasPrefix:@"MLSE."] & 1) == 0
     && ([v14 hasPrefix:@"ProactiveHarvesting."] & 1) == 0
     && ![v14 hasPrefix:@"SoundAnalysis."];
  if ([v14 hasPrefix:@"Photos."])
  {
    id v31 = @"com.apple.mobileslideshow";
  }
  else if ([v14 hasPrefix:@"Safari."])
  {
    id v31 = @"com.apple.mobilesafari";
  }
  else
  {
    id v31 = 0;
  }
  BYTE2(v34) = v30;
  BYTE1(v34) = v29;
  LOBYTE(v34) = 1;
  id v32 = (BMStreamConfiguration *)objc_msgSend((id)objc_opt_class(), "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v26, v14, a4, v37, v15, v27, v17, v34, 0, 0, v31);

  return v32;
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = @"YES";
  if (self->_enableSubscriptions) {
    v5 = @"YES";
  }
  else {
    v5 = @"NO";
  }
  if (self->_enableSubscriptionSubstream) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  if (!self->_enableTombstoneSubstream) {
    v4 = @"NO";
  }
  v7 = (void *)[v3 initWithFormat:@"BMStreamConfiguration {\n\tstreamIdentifier = %@\n\tstreamUUID = %@\n\teventClass = %@\n\tstoreConfig = %@\n\tsyncPolicy = %@\n\tlegacyNames = %@\n\tinternalMetadata = %@\n\tenableSubscriptions = %@\n\tenableSubscriptionSubstream = %@\n\tenableTombstoneSubstream = %@\n\tallowedClients = %@\n\tpruningTriggers = %@\n\tspaceAttribution = %@\n}", *(_OWORD *)&self->_streamIdentifier, *(_OWORD *)&self->_eventClass, self->_syncPolicy, self->_legacyNames, self->_internalMetadata, v5, v6, v4, self->_allowedClients, self->_pruningTriggers, self->_spaceAttribution];

  return v7;
}

- (BMStreamSyncPolicy)syncPolicy
{
  return self->_syncPolicy;
}

- (BMStreamInternalMetadata)internalMetadata
{
  return self->_internalMetadata;
}

- (BOOL)enableSubscriptions
{
  return self->_enableSubscriptions;
}

- (BOOL)enableSubscriptionSubstream
{
  return self->_enableSubscriptionSubstream;
}

- (BOOL)enableTombstoneSubstream
{
  return self->_enableTombstoneSubstream;
}

- (NSArray)allowedClients
{
  return self->_allowedClients;
}

- (NSArray)pruningTriggers
{
  return self->_pruningTriggers;
}

- (NSString)spaceAttribution
{
  return self->_spaceAttribution;
}

@end