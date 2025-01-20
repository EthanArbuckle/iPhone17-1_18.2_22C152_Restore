@interface ATAudioTapDescription
+ (BOOL)supportsSecureCoding;
- (ATAudioTapDescription)initWithCoder:(id)a3;
- (AVAudioFormat)format;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPreSpatial;
- (BOOL)setProcessIdentifiersChecked:(id)a3;
- (NSArray)excludedPIDs;
- (NSArray)processIdentifiers;
- (NSString)name;
- (NSString)sceneIdentifier;
- (NSUUID)UUID;
- (id)description;
- (id)initBaseTapInternalWithFormat:(id)a3;
- (id)initPreSpatialAudioSessionTapWithFormat:(id)a3 sessionID:(unsigned int)a4;
- (id)initPreSpatialProcessTapWithFormat:(id)a3 PID:(int)a4;
- (id)initPreSpatialProcessTapWithFormat:(id)a3 PIDs:(id)a4;
- (id)initPreSpatialSceneIdentifierTapWithFormat:(id)a3 sceneIdentifier:(id)a4;
- (id)initPreSpatialSessionTypeTapWithFormat:(id)a3 sessionType:(unsigned int)a4;
- (id)initPreSpatialTapInternalWithFormat:(id)a3 PIDs:(id)a4 sessionID:(unsigned int)a5 sessionType:(unsigned int)a6 sceneID:(id)a7;
- (id)initProcessTapWithFormat:(id)a3 PID:(int)a4;
- (id)initScreenSharingTapWithFormat:(id)a3;
- (id)initSystemTapWithFormat:(id)a3;
- (id)initSystemTapWithFormat:(id)a3 excludePIDs:(id)a4;
- (id)initTapInternalWithFormat:(id)a3 PIDs:(id)a4;
- (int)processIdentifier;
- (int64_t)tapType;
- (unsigned)audioSessionID;
- (unsigned)sessionType;
- (void)encodeWithCoder:(id)a3;
- (void)setExcludedPIDs:(id)a3;
- (void)setProcessIdentifier:(int)a3;
- (void)setProcessIdentifiers:(id)a3;
@end

@implementation ATAudioTapDescription

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
  objc_storeStrong((id *)&self->_format, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_excludedPIDs, 0);

  objc_storeStrong((id *)&self->_processIdentifiers, 0);
}

- (NSString)sceneIdentifier
{
  return self->_sceneIdentifier;
}

- (unsigned)sessionType
{
  return self->_sessionType;
}

- (unsigned)audioSessionID
{
  return self->_audioSessionID;
}

- (BOOL)isPreSpatial
{
  return self->_preSpatial;
}

- (AVAudioFormat)format
{
  return self->_format;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (NSString)name
{
  return self->_name;
}

- (void)setExcludedPIDs:(id)a3
{
}

- (NSArray)excludedPIDs
{
  return self->_excludedPIDs;
}

- (NSArray)processIdentifiers
{
  return self->_processIdentifiers;
}

- (int64_t)tapType
{
  return self->_tapType;
}

- (id)description
{
  switch([(ATAudioTapDescription *)self tapType])
  {
    case 1:
      v3 = NSString;
      v4 = (objc_class *)objc_opt_class();
      v5 = NSStringFromClass(v4);
      v6 = [(ATAudioTapDescription *)self name];
      v7 = [(ATAudioTapDescription *)self UUID];
      v8 = [(ATAudioTapDescription *)self format];
      v9 = [(ATAudioTapDescription *)self excludedPIDs];
      uint64_t v10 = [v3 stringWithFormat:@"<%@@%p: system tap - name:%@, UUID:%@, format:%@, excluded pids:%@>", v5, self, v6, v7, v8, v9];
      goto LABEL_8;
    case 2:
      v15 = NSString;
      v16 = (objc_class *)objc_opt_class();
      v5 = NSStringFromClass(v16);
      uint64_t v17 = [(ATAudioTapDescription *)self audioSessionID];
      v6 = [(ATAudioTapDescription *)self name];
      v7 = [(ATAudioTapDescription *)self UUID];
      v8 = [(ATAudioTapDescription *)self format];
      v9 = [(ATAudioTapDescription *)self excludedPIDs];
      uint64_t v10 = [v15 stringWithFormat:@"<%@@%p: audio session tap - sessionID:0x%x name:%@, UUID:%@, format:%@, excluded pids:%@>", v5, self, v17, v6, v7, v8, v9];
      goto LABEL_8;
    case 3:
      v18 = NSString;
      v19 = (objc_class *)objc_opt_class();
      v5 = NSStringFromClass(v19);
      v6 = [(ATAudioTapDescription *)self sceneIdentifier];
      v7 = [(ATAudioTapDescription *)self name];
      v8 = [(ATAudioTapDescription *)self UUID];
      v9 = [(ATAudioTapDescription *)self format];
      v13 = [(ATAudioTapDescription *)self excludedPIDs];
      uint64_t v14 = [v18 stringWithFormat:@"<%@@%p: scene identifier tap - sceneID:%@, name:%@, UUID:%@, format:%@, excluded pids:%@>", v5, self, v6, v7, v8, v9, v13];
      goto LABEL_6;
    case 4:
      v21 = NSString;
      v22 = (objc_class *)objc_opt_class();
      v5 = NSStringFromClass(v22);
      uint64_t v23 = [(ATAudioTapDescription *)self sessionType];
      v6 = [(ATAudioTapDescription *)self name];
      v7 = [(ATAudioTapDescription *)self UUID];
      v8 = [(ATAudioTapDescription *)self format];
      v9 = [(ATAudioTapDescription *)self excludedPIDs];
      uint64_t v10 = [v21 stringWithFormat:@"<%@@%p: session type tap - session type:%u, name:%@, UUID:%@, format:%@, excluded pids:%@>", v5, self, v23, v6, v7, v8, v9];
LABEL_8:
      v20 = (void *)v10;
      break;
    default:
      v11 = NSString;
      v12 = (objc_class *)objc_opt_class();
      v5 = NSStringFromClass(v12);
      v6 = [(ATAudioTapDescription *)self processIdentifiers];
      v7 = [(ATAudioTapDescription *)self name];
      v8 = [(ATAudioTapDescription *)self UUID];
      v9 = [(ATAudioTapDescription *)self format];
      v13 = [(ATAudioTapDescription *)self excludedPIDs];
      uint64_t v14 = [v11 stringWithFormat:@"<%@@%p: process tap - pids:%@, name:%@, UUID:%@, format:%@, excluded pids:%@>", v5, self, v6, v7, v8, v9, v13];
LABEL_6:
      v20 = (void *)v14;

      break;
  }

  return v20;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ATAudioTapDescription *)a3;
  if (v4 == self)
  {
    char v19 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = (void *)MEMORY[0x1E4F1CAD0];
      v7 = [(ATAudioTapDescription *)v5 processIdentifiers];
      v8 = [v6 setWithArray:v7];

      v9 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v10 = [(ATAudioTapDescription *)self processIdentifiers];
      v11 = [v9 setWithArray:v10];

      uint64_t v12 = [(ATAudioTapDescription *)v5 tapType];
      if (v12 == -[ATAudioTapDescription tapType](self, "tapType") && [v8 isEqual:v11])
      {
        v13 = [(ATAudioTapDescription *)v5 name];
        uint64_t v14 = [(ATAudioTapDescription *)self name];
        if (![v13 isEqual:v14])
        {
LABEL_13:
          char v19 = 0;
LABEL_14:

LABEL_19:
          goto LABEL_20;
        }
        v35 = [(ATAudioTapDescription *)v5 UUID];
        v15 = [(ATAudioTapDescription *)self UUID];
        if (![v35 isEqual:v15])
        {
LABEL_12:

          goto LABEL_13;
        }
        v34 = [(ATAudioTapDescription *)v5 format];
        v33 = [(ATAudioTapDescription *)self format];
        if (!objc_msgSend(v34, "isEqual:")
          || (unsigned int v16 = [(ATAudioTapDescription *)v5 audioSessionID],
              v16 != [(ATAudioTapDescription *)self audioSessionID])
          || (unsigned int v17 = [(ATAudioTapDescription *)v5 sessionType],
              v17 != [(ATAudioTapDescription *)self sessionType])
          || (BOOL v18 = [(ATAudioTapDescription *)v5 isPreSpatial],
              v18 != [(ATAudioTapDescription *)self isPreSpatial]))
        {

          goto LABEL_12;
        }
        v20 = [(ATAudioTapDescription *)v5 sceneIdentifier];
        v21 = [(ATAudioTapDescription *)self sceneIdentifier];
        char v32 = (v20 != 0) ^ (v21 != 0);

        if ((v32 & 1) == 0)
        {
          uint64_t v23 = [(ATAudioTapDescription *)v5 sceneIdentifier];
          if (!v23) {
            goto LABEL_24;
          }
          v24 = [(ATAudioTapDescription *)self sceneIdentifier];

          if (!v24
            || ([(ATAudioTapDescription *)v5 sceneIdentifier],
                v25 = objc_claimAutoreleasedReturnValue(),
                [(ATAudioTapDescription *)self sceneIdentifier],
                v26 = objc_claimAutoreleasedReturnValue(),
                char v27 = [v25 isEqual:v26],
                v26,
                v25,
                (v27 & 1) != 0))
          {
LABEL_24:
            v28 = (void *)MEMORY[0x1E4F1CAD0];
            v29 = [(ATAudioTapDescription *)v5 excludedPIDs];
            v13 = [v28 setWithArray:v29];

            v30 = (void *)MEMORY[0x1E4F1CAD0];
            v31 = [(ATAudioTapDescription *)self excludedPIDs];
            uint64_t v14 = [v30 setWithArray:v31];

            char v19 = [v13 isEqual:v14];
            goto LABEL_14;
          }
        }
      }
      char v19 = 0;
      goto LABEL_19;
    }
    char v19 = 0;
  }
LABEL_20:

  return v19;
}

- (ATAudioTapDescription)initWithCoder:(id)a3
{
  v30[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)ATAudioTapDescription;
  v5 = [(ATAudioTapDescription *)&v24 init];
  if (v5)
  {
    v5->_tapType = (int)[v4 decodeIntForKey:@"tapType"];
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v30[0] = objc_opt_class();
    v30[1] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
    v8 = [v6 setWithArray:v7];

    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"processIdentifiers"];
    processIdentifiers = v5->_processIdentifiers;
    v5->_processIdentifiers = (NSArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClasses:v8 forKey:@"excludedPIDs"];
    excludedPIDs = v5->_excludedPIDs;
    v5->_excludedPIDs = (NSArray *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UUID"];
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v15;

    uint64_t v26 = 0;
    char v27 = &v26;
    uint64_t v28 = 0x2050000000;
    unsigned int v17 = (void *)getAVAudioFormatClass(void)::softClass;
    uint64_t v29 = getAVAudioFormatClass(void)::softClass;
    if (!getAVAudioFormatClass(void)::softClass)
    {
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = ___ZL21getAVAudioFormatClassv_block_invoke_10857;
      v25[3] = &unk_1E5B16400;
      v25[4] = &v26;
      ___ZL21getAVAudioFormatClassv_block_invoke_10857((uint64_t)v25);
      unsigned int v17 = (void *)v27[3];
    }
    id v18 = v17;
    _Block_object_dispose(&v26, 8);
    uint64_t v19 = [v4 decodeObjectOfClass:v18 forKey:@"format"];
    format = v5->_format;
    v5->_format = (AVAudioFormat *)v19;

    v5->_audioSessionID = [v4 decodeInt32ForKey:@"audioSessionID"];
    v5->_sessionType = [v4 decodeInt32ForKey:@"sessionType"];
    v5->_preSpatial = [v4 decodeBoolForKey:@"preSpatial"];
    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sceneIdentifier"];
    sceneIdentifier = v5->_sceneIdentifier;
    v5->_sceneIdentifier = (NSString *)v21;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInt:LODWORD(self->_tapType) forKey:@"tapType"];
  [v4 encodeObject:self->_processIdentifiers forKey:@"processIdentifiers"];
  [v4 encodeObject:self->_excludedPIDs forKey:@"excludedPIDs"];
  [v4 encodeObject:self->_name forKey:@"name"];
  [v4 encodeObject:self->_UUID forKey:@"UUID"];
  [v4 encodeObject:self->_format forKey:@"format"];
  [v4 encodeInt32:self->_audioSessionID forKey:@"audioSessionID"];
  [v4 encodeInt32:self->_sessionType forKey:@"sessionType"];
  [v4 encodeBool:self->_preSpatial forKey:@"preSpatial"];
  [v4 encodeObject:self->_sceneIdentifier forKey:@"sceneIdentifier"];
}

- (void)setProcessIdentifiers:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(ATAudioTapDescription *)self setProcessIdentifiersChecked:v4])
  {
    v5 = gATAudioTapLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315650;
      v7 = "ATAudioTap.mm";
      __int16 v8 = 1024;
      int v9 = 272;
      __int16 v10 = 2112;
      id v11 = v4;
      _os_log_impl(&dword_1A3931000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d Error setting processIdentifiers: %@", (uint8_t *)&v6, 0x1Cu);
    }
  }
}

- (void)setProcessIdentifier:(int)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v4 = [NSNumber numberWithInt:*(void *)&a3];
  v6[0] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  [(ATAudioTapDescription *)self setProcessIdentifiers:v5];
}

- (int)processIdentifier
{
  if (![(NSArray *)self->_processIdentifiers count]) {
    return 0;
  }
  v3 = [(NSArray *)self->_processIdentifiers firstObject];
  int v4 = [v3 intValue];

  return v4;
}

- (id)initScreenSharingTapWithFormat:(id)a3
{
  id result = [(ATAudioTapDescription *)self initBaseTapInternalWithFormat:a3];
  if (result)
  {
    *((void *)result + 3) = 5;
    *((unsigned char *)result + 8) = 0;
  }
  return result;
}

- (id)initPreSpatialSceneIdentifierTapWithFormat:(id)a3 sceneIdentifier:(id)a4
{
  return [(ATAudioTapDescription *)self initPreSpatialTapInternalWithFormat:a3 PIDs:0 sessionID:0 sessionType:0 sceneID:a4];
}

- (id)initPreSpatialSessionTypeTapWithFormat:(id)a3 sessionType:(unsigned int)a4
{
  id v6 = a3;
  if (a4 == 1)
  {
    self = (ATAudioTapDescription *)[(ATAudioTapDescription *)self initPreSpatialTapInternalWithFormat:v6 PIDs:0 sessionID:0 sessionType:1 sceneID:0];
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)initPreSpatialAudioSessionTapWithFormat:(id)a3 sessionID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  if ((v4 - 1) > 0xFFFFFFFD)
  {
    v7 = 0;
  }
  else
  {
    self = (ATAudioTapDescription *)[(ATAudioTapDescription *)self initPreSpatialTapInternalWithFormat:v6 PIDs:0 sessionID:v4 sessionType:0 sceneID:0];
    v7 = self;
  }

  return v7;
}

- (id)initPreSpatialProcessTapWithFormat:(id)a3 PIDs:(id)a4
{
  return [(ATAudioTapDescription *)self initPreSpatialTapInternalWithFormat:a3 PIDs:a4 sessionID:0 sessionType:0 sceneID:0];
}

- (id)initPreSpatialProcessTapWithFormat:(id)a3 PID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [NSNumber numberWithInt:v4];
  v11[0] = v7;
  __int16 v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v9 = [(ATAudioTapDescription *)self initPreSpatialTapInternalWithFormat:v6 PIDs:v8 sessionID:0 sessionType:0 sceneID:0];

  return v9;
}

- (id)initPreSpatialTapInternalWithFormat:(id)a3 PIDs:(id)a4 sessionID:(unsigned int)a5 sessionType:(unsigned int)a6 sceneID:(id)a7
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  uint64_t v13 = (NSArray *)a4;
  id v14 = a7;
  id v15 = [(ATAudioTapDescription *)self initBaseTapInternalWithFormat:v12];
  if (v15)
  {
    if (v13)
    {
      if (ValidatePIDs(v13))
      {
        unsigned int v16 = [(NSArray *)v13 firstObject];
        int v17 = [v16 intValue];

        if (v17 != -1)
        {
          uint64_t v18 = [(NSArray *)v13 copy];
          uint64_t v19 = (void *)*((void *)v15 + 4);
          *((void *)v15 + 4) = v18;

          uint64_t v20 = 0;
LABEL_20:
          *((void *)v15 + 3) = v20;
          *((_DWORD *)v15 + 3) = a5;
          *((_DWORD *)v15 + 4) = a6;
          objc_storeStrong((id *)v15 + 9, a7);
          *((unsigned char *)v15 + 8) = 1;
          goto LABEL_23;
        }
        uint64_t v21 = gATAudioTapLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          int v23 = 136315394;
          objc_super v24 = "ATAudioTap.mm";
          __int16 v25 = 1024;
          int v26 = 137;
          _os_log_impl(&dword_1A3931000, v21, OS_LOG_TYPE_ERROR, "%25s:%-5d Pre-spatial sytstem tap is not supported", (uint8_t *)&v23, 0x12u);
        }

LABEL_22:
        id v15 = 0;
        goto LABEL_23;
      }
    }
    else
    {
      if (!(a6 | a5) && v14)
      {
        uint64_t v20 = 3;
        goto LABEL_20;
      }
      if (a5 - 1 <= 0xFFFFFFFD && !a6 && !v14)
      {
        uint64_t v20 = 2;
        goto LABEL_20;
      }
      if (!a5 && a6 && !v14)
      {
        uint64_t v20 = 4;
        goto LABEL_20;
      }
    }

    goto LABEL_22;
  }
LABEL_23:

  return v15;
}

- (id)initSystemTapWithFormat:(id)a3 excludePIDs:(id)a4
{
  id v7 = a4;
  __int16 v8 = [(ATAudioTapDescription *)self initSystemTapWithFormat:a3];
  id v9 = v8;
  if (v8) {
    objc_storeStrong(v8 + 5, a4);
  }

  return v9;
}

- (id)initSystemTapWithFormat:(id)a3
{
  v3 = [(ATAudioTapDescription *)self initBaseTapInternalWithFormat:a3];
  uint64_t v4 = v3;
  if (v3)
  {
    v5 = (void *)v3[4];
    v3[3] = 1;
    v3[4] = &unk_1EF7402B0;
  }
  return v4;
}

- (id)initProcessTapWithFormat:(id)a3 PID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [NSNumber numberWithInt:v4];
  v11[0] = v7;
  __int16 v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v9 = [(ATAudioTapDescription *)self initTapInternalWithFormat:v6 PIDs:v8];

  return v9;
}

- (id)initTapInternalWithFormat:(id)a3 PIDs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ATAudioTapDescription *)self initBaseTapInternalWithFormat:v6];
  id v9 = v8;
  if (v8 && ([v8 setProcessIdentifiersChecked:v7] & 1) == 0)
  {

    id v9 = 0;
  }

  return v9;
}

- (BOOL)setProcessIdentifiersChecked:(id)a3
{
  uint64_t v4 = (NSArray *)a3;
  char v5 = ValidatePIDs(v4);
  if (v5)
  {
    id v6 = [(NSArray *)v4 firstObject];
    int64_t v7 = [v6 intValue] == -1;

    self->_tapType = v7;
    id v8 = (NSArray *)[(NSArray *)v4 copy];
    processIdentifiers = self->_processIdentifiers;
    self->_processIdentifiers = v8;
  }
  return v5;
}

- (id)initBaseTapInternalWithFormat:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ATAudioTapDescription;
  id v6 = [(ATAudioTapDescription *)&v16 init];
  int64_t v7 = v6;
  if (v6)
  {
    processIdentifiers = v6->_processIdentifiers;
    id v9 = (NSArray *)MEMORY[0x1E4F1CBF0];
    v6->_tapType = 0;
    v6->_processIdentifiers = v9;

    objc_storeStrong((id *)&v7->_format, a3);
    uint64_t v10 = [MEMORY[0x1E4F29128] UUID];
    UUID = v7->_UUID;
    v7->_UUID = (NSUUID *)v10;

    uint64_t v12 = [(NSUUID *)v7->_UUID UUIDString];
    name = v7->_name;
    v7->_name = (NSString *)v12;

    v7->_audioSessionID = 0;
    v7->_sessionType = 0;
    sceneIdentifier = v7->_sceneIdentifier;
    v7->_sceneIdentifier = 0;

    v7->_preSpatial = 0;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end