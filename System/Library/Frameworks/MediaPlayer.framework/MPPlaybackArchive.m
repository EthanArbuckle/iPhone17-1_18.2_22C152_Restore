@interface MPPlaybackArchive
+ (BOOL)supportsSecureCoding;
- (BOOL)BOOLValueForOption:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (MPPlaybackArchive)initWithBlock:(id)a3;
- (MPPlaybackArchive)initWithCoder:(id)a3;
- (MPPlaybackArchive)initWithType:(int64_t)a3 sessionIdentifier:(id)a4 data:(id)a5 dataType:(id)a6 bundleIdentifier:(id)a7 supportedOptions:(unint64_t)a8 displayProperties:(id)a9;
- (MPPlaybackArchiveDisplayProperties)displayProperties;
- (NSData)playbackSessionData;
- (NSMutableDictionary)storage;
- (NSString)bundleIdentifier;
- (NSString)description;
- (NSString)fallbackStoreIdentifier;
- (NSString)playbackSessionIdentifier;
- (NSString)playbackSessionType;
- (id)copyWithOptions:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)type;
- (unint64_t)copyOptions;
- (unint64_t)hash;
- (unint64_t)queueControlOptions;
- (unint64_t)supportedOptions;
- (void)encodeWithCoder:(id)a3;
- (void)setBOOLValue:(BOOL)a3 forOption:(int64_t)a4;
- (void)setBundleIdentifier:(id)a3;
- (void)setCopyOptions:(unint64_t)a3;
- (void)setDisplayProperties:(id)a3;
- (void)setFallbackStoreIdentifier:(id)a3;
- (void)setQueueControlOptions:(unint64_t)a3;
- (void)setSessionIdentifier:(id)a3 type:(id)a4 data:(id)a5;
- (void)setStorage:(id)a3;
- (void)setSupportedOptions:(unint64_t)a3;
- (void)setType:(int64_t)a3;
@end

@implementation MPPlaybackArchive

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackSessionData, 0);
  objc_storeStrong((id *)&self->_playbackSessionType, 0);
  objc_storeStrong((id *)&self->_playbackSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);

  objc_storeStrong((id *)&self->_displayProperties, 0);
}

- (NSData)playbackSessionData
{
  return self->_playbackSessionData;
}

- (NSString)playbackSessionType
{
  return self->_playbackSessionType;
}

- (NSString)playbackSessionIdentifier
{
  return self->_playbackSessionIdentifier;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setStorage:(id)a3
{
}

- (NSMutableDictionary)storage
{
  return self->_storage;
}

- (void)setQueueControlOptions:(unint64_t)a3
{
  self->_queueControlOptions = a3;
}

- (unint64_t)queueControlOptions
{
  return self->_queueControlOptions;
}

- (void)setCopyOptions:(unint64_t)a3
{
  self->_copyOptions = a3;
}

- (unint64_t)copyOptions
{
  return self->_copyOptions;
}

- (unint64_t)supportedOptions
{
  return self->_supportedOptions;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (MPPlaybackArchiveDisplayProperties)displayProperties
{
  return self->_displayProperties;
}

- (NSString)fallbackStoreIdentifier
{
  return (NSString *)[(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"fsi"];
}

- (void)setFallbackStoreIdentifier:(id)a3
{
  id v5 = a3;
  id v8 = v5;
  if (self->_final)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"MPPlaybackArchive.m" lineNumber:253 description:@"Attempt to mutate after finalization."];

    id v5 = v8;
  }
  v6 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->_storage setObject:v6 forKeyedSubscript:@"fsi"];
}

- (void)setDisplayProperties:(id)a3
{
  id v5 = a3;
  id v9 = v5;
  if (self->_final)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"MPPlaybackArchive.m" lineNumber:248 description:@"Attempt to mutate after finalization."];

    id v5 = v9;
  }
  v6 = (MPPlaybackArchiveDisplayProperties *)[v5 copy];
  displayProperties = self->_displayProperties;
  self->_displayProperties = v6;
}

- (void)setSupportedOptions:(unint64_t)a3
{
  if (self->_final)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"MPPlaybackArchive.m" lineNumber:243 description:@"Attempt to mutate after finalization."];
  }
  self->_supportedOptions = a3;
}

- (void)setBundleIdentifier:(id)a3
{
  id v5 = a3;
  id v9 = v5;
  if (self->_final)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"MPPlaybackArchive.m" lineNumber:238 description:@"Attempt to mutate after finalization."];

    id v5 = v9;
  }
  v6 = (NSString *)[v5 copy];
  bundleIdentifier = self->_bundleIdentifier;
  self->_bundleIdentifier = v6;
}

- (void)setSessionIdentifier:(id)a3 type:(id)a4 data:(id)a5
{
  id v18 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_final)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"MPPlaybackArchive.m" lineNumber:231 description:@"Attempt to mutate after finalization."];
  }
  v11 = (NSString *)[v18 copy];
  playbackSessionIdentifier = self->_playbackSessionIdentifier;
  self->_playbackSessionIdentifier = v11;

  v13 = (NSString *)[v9 copy];
  playbackSessionType = self->_playbackSessionType;
  self->_playbackSessionType = v13;

  v15 = (NSData *)[v10 copy];
  playbackSessionData = self->_playbackSessionData;
  self->_playbackSessionData = v15;
}

- (void)setType:(int64_t)a3
{
  if (self->_final)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"MPPlaybackArchive.m" lineNumber:226 description:@"Attempt to mutate after finalization."];
  }
  self->_type = a3;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInteger:type forKey:@"archiveType"];
  [v5 encodeObject:self->_playbackSessionIdentifier forKey:@"sessionID"];
  [v5 encodeObject:self->_playbackSessionData forKey:@"data"];
  [v5 encodeObject:self->_playbackSessionType forKey:@"sessionType"];
  [v5 encodeObject:self->_bundleIdentifier forKey:@"bundleID"];
  [v5 encodeInteger:self->_supportedOptions forKey:@"supportedOptions"];
  [v5 encodeObject:self->_displayProperties forKey:@"displayProperties"];
  [v5 encodeInteger:self->_copyOptions forKey:@"copyOptions"];
  [v5 encodeInteger:self->_queueControlOptions forKey:@"queueControlOptions"];
  [v5 encodeObject:self->_storage forKey:@"storage"];
}

- (MPPlaybackArchive)initWithCoder:(id)a3
{
  id v4 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __35__MPPlaybackArchive_initWithCoder___block_invoke;
  v11[3] = &unk_1E57EF620;
  id v12 = v4;
  id v5 = v4;
  v6 = [(MPPlaybackArchive *)self initWithBlock:v11];
  v6->_copyOptions = [v5 decodeIntegerForKey:@"copyOptions"];
  v6->_queueControlOptions = [v5 decodeIntegerForKey:@"queueControlOptions"];
  v7 = [v5 decodePropertyListForKey:@"storage"];
  uint64_t v8 = [v7 mutableCopy];
  storage = v6->_storage;
  v6->_storage = (NSMutableDictionary *)v8;

  return v6;
}

void __35__MPPlaybackArchive_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  objc_msgSend(v8, "setType:", objc_msgSend(*(id *)(a1 + 32), "decodeIntegerForKey:", @"archiveType"));
  v3 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class() forKey:@"bundleID"];
  [v8 setBundleIdentifier:v3];

  objc_msgSend(v8, "setSupportedOptions:", objc_msgSend(*(id *)(a1 + 32), "decodeIntegerForKey:", @"supportedOptions"));
  id v4 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class() forKey:@"sessionID"];
  id v5 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class() forKey:@"sessionType"];
  v6 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class() forKey:@"data"];
  if (v4) {
    [v8 setSessionIdentifier:v4 type:v5 data:v6];
  }
  v7 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class() forKey:@"displayProperties"];
  [v8 setDisplayProperties:v7];
}

- (unint64_t)hash
{
  uint64_t v3 = MSVHasherSharedSeed();
  uint64_t v4 = v3 ^ 0x736F6D6570736575;
  uint64_t v6 = v5 ^ 0x646F72616E646F6DLL;
  uint64_t v7 = v3 ^ 0x6C7967656E657261;
  uint64_t v8 = v5 ^ 0x7465646279746573;
  id v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  id v10 = objc_claimAutoreleasedReturnValue();
  [v10 UTF8String];
  [v10 length];

  int64_t type = self->_type;
  uint64_t v12 = (v4 + v6) ^ __ROR8__(v6, 51);
  uint64_t v13 = v7 + (v8 ^ type);
  uint64_t v14 = __ROR8__(v8 ^ type, 48);
  uint64_t v15 = (v13 ^ v14) + __ROR8__(v4 + v6, 32);
  uint64_t v16 = v15 ^ __ROR8__(v13 ^ v14, 43);
  uint64_t v17 = v13 + v12;
  uint64_t v100 = __ROR8__(v17, 32);
  uint64_t v105 = v16;
  int64_t v88 = v15 ^ type;
  uint64_t v94 = v17 ^ __ROR8__(v12, 47);
  id v18 = self->_playbackSessionIdentifier;
  [(NSString *)v18 UTF8String];
  [(NSString *)v18 length];

  v19 = self->_playbackSessionData;
  [(NSData *)v19 bytes];
  [(NSData *)v19 length];

  v20 = self->_playbackSessionType;
  [(NSString *)v20 UTF8String];
  [(NSString *)v20 length];

  v21 = self->_bundleIdentifier;
  [(NSString *)v21 UTF8String];
  [(NSString *)v21 length];

  unint64_t supportedOptions = self->_supportedOptions;
  int64_t v23 = (v88 + v94) ^ __ROR8__(v94, 51);
  uint64_t v24 = v100 + (v105 ^ supportedOptions);
  uint64_t v25 = __ROR8__(v105 ^ supportedOptions, 48);
  uint64_t v26 = (v24 ^ v25) + __ROR8__(v88 + v94, 32);
  uint64_t v27 = v26 ^ __ROR8__(v24 ^ v25, 43);
  uint64_t v28 = v24 + v23;
  uint64_t v101 = __ROR8__(v28, 32);
  uint64_t v106 = v27;
  unint64_t v89 = v26 ^ supportedOptions;
  uint64_t v95 = v28 ^ __ROR8__(v23, 47);
  v29 = self->_displayProperties;
  uint64_t v30 = [(MPPlaybackArchiveDisplayProperties *)v29 hash];
  unint64_t v31 = (v89 + v95) ^ __ROR8__(v95, 51);
  uint64_t v32 = v101 + (v106 ^ v30);
  uint64_t v33 = __ROR8__(v106 ^ v30, 48);
  uint64_t v34 = (v32 ^ v33) + __ROR8__(v89 + v95, 32);
  uint64_t v35 = v34 ^ __ROR8__(v32 ^ v33, 43);
  uint64_t v36 = v32 + v31;
  uint64_t v102 = __ROR8__(v36, 32);
  uint64_t v107 = v35;
  uint64_t v90 = v34 ^ v30;
  uint64_t v96 = v36 ^ __ROR8__(v31, 47);

  unint64_t copyOptions = self->_copyOptions;
  uint64_t v38 = (v90 + v96) ^ __ROR8__(v96, 51);
  uint64_t v39 = v102 + (v107 ^ copyOptions);
  uint64_t v40 = __ROR8__(v107 ^ copyOptions, 48);
  uint64_t v41 = (v39 ^ v40) + __ROR8__(v90 + v96, 32);
  uint64_t v42 = v41 ^ __ROR8__(v39 ^ v40, 43);
  uint64_t v43 = v39 + v38;
  unint64_t v91 = v41 ^ copyOptions;
  uint64_t v97 = v43 ^ __ROR8__(v38, 47);
  unint64_t queueControlOptions = self->_queueControlOptions;
  unint64_t v45 = (v91 + v97) ^ __ROR8__(v97, 51);
  unint64_t v46 = __ROR8__(v43, 32) + (v42 ^ queueControlOptions);
  uint64_t v47 = __ROR8__(v42 ^ queueControlOptions, 48);
  unint64_t v48 = (v46 ^ v47) + __ROR8__(v91 + v97, 32);
  unint64_t v49 = v48 ^ __ROR8__(v46 ^ v47, 43);
  unint64_t v50 = v46 + v45;
  uint64_t v103 = __ROR8__(v50, 32);
  unint64_t v108 = v49;
  unint64_t v92 = v48 ^ queueControlOptions;
  uint64_t v98 = v50 ^ __ROR8__(v45, 47);
  v51 = self->_storage;
  uint64_t v52 = [(NSMutableDictionary *)v51 hash];
  unint64_t v53 = (v92 + v98) ^ __ROR8__(v98, 51);
  uint64_t v54 = v103 + (v108 ^ v52);
  uint64_t v55 = __ROR8__(v108 ^ v52, 48);
  uint64_t v56 = (v54 ^ v55) + __ROR8__(v92 + v98, 32);
  uint64_t v57 = v56 ^ __ROR8__(v54 ^ v55, 43);
  uint64_t v58 = v54 + v53;
  uint64_t v104 = __ROR8__(v58, 32);
  uint64_t v109 = v57;
  uint64_t v93 = v56 ^ v52;
  uint64_t v99 = v58 ^ __ROR8__(v53, 47);

  uint64_t v59 = (v93 + v99) ^ __ROR8__(v99, 51);
  uint64_t v60 = v104 + (v109 ^ 0x3000000000000000);
  uint64_t v61 = __ROR8__(v109 ^ 0x3000000000000000, 48);
  uint64_t v62 = (v60 ^ v61) + __ROR8__(v93 + v99, 32);
  uint64_t v63 = v62 ^ __ROR8__(v60 ^ v61, 43);
  uint64_t v64 = v60 + v59;
  uint64_t v65 = v64 ^ __ROR8__(v59, 47);
  uint64_t v66 = (v62 ^ 0x3000000000000000) + v65;
  uint64_t v67 = v66 ^ __ROR8__(v65, 51);
  uint64_t v68 = (__ROR8__(v64, 32) ^ 0xFFLL) + v63;
  uint64_t v69 = __ROR8__(v63, 48);
  uint64_t v70 = __ROR8__(v66, 32) + (v68 ^ v69);
  uint64_t v71 = v70 ^ __ROR8__(v68 ^ v69, 43);
  uint64_t v72 = v67 + v68;
  uint64_t v73 = v72 ^ __ROR8__(v67, 47);
  uint64_t v74 = v73 + v70;
  uint64_t v75 = v74 ^ __ROR8__(v73, 51);
  uint64_t v76 = __ROR8__(v72, 32) + v71;
  uint64_t v77 = __ROR8__(v71, 48);
  uint64_t v78 = __ROR8__(v74, 32) + (v76 ^ v77);
  uint64_t v79 = v78 ^ __ROR8__(v76 ^ v77, 43);
  uint64_t v80 = v75 + v76;
  uint64_t v81 = v80 ^ __ROR8__(v75, 47);
  uint64_t v82 = v81 + v78;
  uint64_t v83 = v82 ^ __ROR8__(v81, 51);
  uint64_t v84 = __ROR8__(v80, 32) + v79;
  uint64_t v85 = __ROR8__(v79, 48);
  uint64_t v86 = __ROR8__(v82, 32) + (v84 ^ v85);
  return (v83 + v84) ^ __ROR8__(v83, 47) ^ v86 ^ __ROR8__(v83 + v84, 32) ^ v86 ^ __ROR8__(v84 ^ v85, 43);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (MPPlaybackArchive *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      int64_t type = self->_type;
      if (type != [(MPPlaybackArchive *)v5 type])
      {
        char v10 = 0;
LABEL_39:

        goto LABEL_40;
      }
      playbackSessionIdentifier = self->_playbackSessionIdentifier;
      uint64_t v8 = [(MPPlaybackArchive *)v5 playbackSessionIdentifier];
      if (playbackSessionIdentifier == v8)
      {
      }
      else
      {
        int v9 = [(NSString *)playbackSessionIdentifier isEqual:v8];

        if (!v9)
        {
          char v10 = 0;
LABEL_38:

          goto LABEL_39;
        }
      }
      playbackSessionData = self->_playbackSessionData;
      uint64_t v12 = [(MPPlaybackArchive *)v5 playbackSessionData];
      if (playbackSessionData == v12)
      {
      }
      else
      {
        int v13 = [(NSData *)playbackSessionData isEqual:v12];

        if (!v13)
        {
          char v10 = 0;
LABEL_37:

          goto LABEL_38;
        }
      }
      playbackSessionType = self->_playbackSessionType;
      uint64_t v15 = [(MPPlaybackArchive *)v5 playbackSessionType];
      if (playbackSessionType == v15)
      {
      }
      else
      {
        int v16 = [(NSString *)playbackSessionType isEqual:v15];

        if (!v16)
        {
          char v10 = 0;
LABEL_36:

          goto LABEL_37;
        }
      }
      bundleIdentifier = self->_bundleIdentifier;
      id v18 = [(MPPlaybackArchive *)v5 bundleIdentifier];
      if (bundleIdentifier == v18)
      {
      }
      else
      {
        int v19 = [(NSString *)bundleIdentifier isEqual:v18];

        if (!v19) {
          goto LABEL_27;
        }
      }
      unint64_t supportedOptions = self->_supportedOptions;
      if (supportedOptions != [(MPPlaybackArchive *)v5 supportedOptions])
      {
LABEL_27:
        char v10 = 0;
LABEL_35:

        goto LABEL_36;
      }
      displayProperties = self->_displayProperties;
      v22 = [(MPPlaybackArchive *)v5 displayProperties];
      if (displayProperties == v22)
      {
      }
      else
      {
        BOOL v23 = [(MPPlaybackArchiveDisplayProperties *)displayProperties isEqual:v22];

        if (!v23) {
          goto LABEL_33;
        }
      }
      unint64_t copyOptions = self->_copyOptions;
      if (copyOptions == [(MPPlaybackArchive *)v5 copyOptions])
      {
        unint64_t queueControlOptions = self->_queueControlOptions;
        if (queueControlOptions == [(MPPlaybackArchive *)v5 queueControlOptions])
        {
          storage = self->_storage;
          uint64_t v27 = [(MPPlaybackArchive *)v5 storage];
          if (storage == v27) {
            char v10 = 1;
          }
          else {
            char v10 = [(NSMutableDictionary *)storage isEqual:v27];
          }

          goto LABEL_34;
        }
      }
LABEL_33:
      char v10 = 0;
LABEL_34:

      goto LABEL_35;
    }
    char v10 = 0;
  }
LABEL_40:

  return v10;
}

- (NSString)description
{
  int v16 = NSString;
  uint64_t v15 = objc_opt_class();
  int64_t v14 = [(MPPlaybackArchive *)self type];
  uint64_t v3 = [(MPPlaybackArchive *)self playbackSessionIdentifier];
  uint64_t v4 = [(MPPlaybackArchive *)self playbackSessionData];
  uint64_t v5 = [(MPPlaybackArchive *)self playbackSessionType];
  uint64_t v6 = [(MPPlaybackArchive *)self bundleIdentifier];
  unint64_t v7 = [(MPPlaybackArchive *)self supportedOptions];
  unint64_t v8 = [(MPPlaybackArchive *)self queueControlOptions];
  int v9 = [(MPPlaybackArchive *)self displayProperties];
  unint64_t v10 = [(MPPlaybackArchive *)self copyOptions];
  v11 = [(MPPlaybackArchive *)self storage];
  uint64_t v12 = [v16 stringWithFormat:@"<%@: %p type=%ld playbackSessionIdentifier=%@ playbackSessionData=%@ playbackSessionType=%@ bundleIdentifier=%@ supportedOptions=%lu queueControlOptions=%lu displayProperties=%@ copyOptions=%lu> storage=%@", v15, self, v14, v3, v4, v5, v6, v7, v8, v9, v10, v11];

  return (NSString *)v12;
}

- (id)copyWithOptions:(unint64_t)a3
{
  uint64_t v5 = [MPPlaybackArchive alloc];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __37__MPPlaybackArchive_copyWithOptions___block_invoke;
  v9[3] = &unk_1E57EF5F8;
  v9[4] = self;
  v9[5] = a3;
  uint64_t v6 = [(MPPlaybackArchive *)v5 initWithBlock:v9];
  [(MPPlaybackArchive *)v6 setCopyOptions:a3];
  [(MPPlaybackArchive *)v6 setQueueControlOptions:self->_queueControlOptions];
  unint64_t v7 = (void *)[(NSMutableDictionary *)self->_storage copy];
  [(MPPlaybackArchive *)v6 setStorage:v7];

  return v6;
}

void __37__MPPlaybackArchive_copyWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  objc_msgSend(v9, "setType:", objc_msgSend(*(id *)(a1 + 32), "type"));
  uint64_t v3 = [*(id *)(a1 + 32) bundleIdentifier];
  [v9 setBundleIdentifier:v3];

  objc_msgSend(v9, "setSupportedOptions:", objc_msgSend(*(id *)(a1 + 32), "supportedOptions"));
  if ((*(unsigned char *)(a1 + 40) & 2) == 0)
  {
    uint64_t v4 = [*(id *)(a1 + 32) playbackSessionIdentifier];
    uint64_t v5 = [*(id *)(a1 + 32) playbackSessionType];
    uint64_t v6 = [*(id *)(a1 + 32) playbackSessionData];
    [v9 setSessionIdentifier:v4 type:v5 data:v6];
  }
  unint64_t v7 = [*(id *)(a1 + 32) displayProperties];
  unint64_t v8 = (void *)[v7 copyWithOptions:*(void *)(a1 + 40)];
  [v9 setDisplayProperties:v8];
}

- (id)copyWithZone:(_NSZone *)a3
{
  return [(MPPlaybackArchive *)self copyWithOptions:0];
}

- (BOOL)BOOLValueForOption:(int64_t)a3
{
  return ((1 << a3) & ~[(MPPlaybackArchive *)self queueControlOptions]) == 0;
}

- (void)setBOOLValue:(BOOL)a3 forOption:(int64_t)a4
{
  int v5 = 1 << a4;
  if (a3) {
    unint64_t v6 = [(MPPlaybackArchive *)self queueControlOptions] | v5;
  }
  else {
    unint64_t v6 = [(MPPlaybackArchive *)self queueControlOptions] & ~v5;
  }

  [(MPPlaybackArchive *)self setQueueControlOptions:v6];
}

- (MPPlaybackArchive)initWithType:(int64_t)a3 sessionIdentifier:(id)a4 data:(id)a5 dataType:(id)a6 bundleIdentifier:(id)a7 supportedOptions:(unint64_t)a8 displayProperties:(id)a9
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a9;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __118__MPPlaybackArchive_initWithType_sessionIdentifier_data_dataType_bundleIdentifier_supportedOptions_displayProperties___block_invoke;
  v27[3] = &unk_1E57EF5D0;
  id v28 = v15;
  id v29 = v17;
  id v30 = v16;
  id v31 = v18;
  int64_t v33 = a3;
  unint64_t v34 = a8;
  id v32 = v19;
  id v20 = v19;
  id v21 = v18;
  id v22 = v16;
  id v23 = v17;
  id v24 = v15;
  uint64_t v25 = [(MPPlaybackArchive *)self initWithBlock:v27];

  return v25;
}

void __118__MPPlaybackArchive_initWithType_sessionIdentifier_data_dataType_bundleIdentifier_supportedOptions_displayProperties___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[9];
  id v4 = a2;
  [v4 setType:v3];
  [v4 setSessionIdentifier:a1[4] type:a1[5] data:a1[6]];
  [v4 setBundleIdentifier:a1[7]];
  [v4 setSupportedOptions:a1[10]];
  [v4 setDisplayProperties:a1[8]];
}

- (MPPlaybackArchive)initWithBlock:(id)a3
{
  id v4 = (void (**)(id, MPPlaybackArchive *))a3;
  v9.receiver = self;
  v9.super_class = (Class)MPPlaybackArchive;
  int v5 = [(MPPlaybackArchive *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    storage = v5->_storage;
    v5->_storage = (NSMutableDictionary *)v6;

    v4[2](v4, v5);
    v5->_final = 1;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end