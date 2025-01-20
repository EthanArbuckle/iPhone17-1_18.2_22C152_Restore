@interface LNTranscriptActionRecord
+ (BOOL)supportsSecureCoding;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (unsigned)datastoreVersion;
- (BMAppIntentInvocation)asBMAppIntentInvocation;
- (BOOL)hasNextAction;
- (BOOL)isEqual:(id)a3;
- (LNAction)action;
- (LNAction)resolvedAction;
- (LNActionOutput)actionOutput;
- (LNTranscriptActionRecord)initWithAction:(id)a3 resolvedAction:(id)a4 bundleIdentifier:(id)a5 actionOutput:(id)a6 executionUUID:(id)a7 source:(unsigned __int16)a8 executionDate:(id)a9 clientLabel:(id)a10 predictions:(id)a11;
- (LNTranscriptActionRecord)initWithBundleIdentifier:(id)a3 source:(unsigned __int16)a4 clientLabel:(id)a5 executionUUID:(id)a6 executionDate:(id)a7 action:(id)a8 resolvedAction:(id)a9 actionOutput:(id)a10 predictions:(id)a11;
- (LNTranscriptActionRecord)initWithBundleIdentifier:(id)a3 source:(unsigned __int16)a4 clientLabel:(id)a5 executionUUID:(id)a6 executionDate:(id)a7 actionData:(id)a8 resolvedActionData:(id)a9 actionOutputData:(id)a10 predictionsData:(id)a11 hasNextAction:(BOOL)a12;
- (LNTranscriptActionRecord)initWithCoder:(id)a3;
- (NSArray)predictions;
- (NSData)actionData;
- (NSData)actionOutputData;
- (NSData)predictionsData;
- (NSData)resolvedActionData;
- (NSDate)executionDate;
- (NSString)bundleIdentifier;
- (NSString)clientLabel;
- (NSString)description;
- (NSUUID)executionUUID;
- (id)serialize;
- (id)verboseDescription;
- (unint64_t)hash;
- (unsigned)dataVersion;
- (unsigned)source;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setSource:(unsigned __int16)a3;
@end

@implementation LNTranscriptActionRecord

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LNTranscriptActionRecord)initWithBundleIdentifier:(id)a3 source:(unsigned __int16)a4 clientLabel:(id)a5 executionUUID:(id)a6 executionDate:(id)a7 actionData:(id)a8 resolvedActionData:(id)a9 actionOutputData:(id)a10 predictionsData:(id)a11 hasNextAction:(BOOL)a12
{
  id v18 = a3;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  id v24 = a10;
  id v25 = a11;
  if (v22)
  {
    if (v23) {
      goto LABEL_3;
    }
LABEL_8:
    v46 = [MEMORY[0x1E4F28B00] currentHandler];
    [v46 handleFailureInMethod:a2, self, @"LNTranscriptActionRecord.m", 96, @"Invalid parameter not satisfying: %@", @"resolvedActionData" object file lineNumber description];

    if (v25) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v45 = [MEMORY[0x1E4F28B00] currentHandler];
  [v45 handleFailureInMethod:a2, self, @"LNTranscriptActionRecord.m", 95, @"Invalid parameter not satisfying: %@", @"actionData" object file lineNumber description];

  if (!v23) {
    goto LABEL_8;
  }
LABEL_3:
  if (v25) {
    goto LABEL_4;
  }
LABEL_9:
  v47 = [MEMORY[0x1E4F28B00] currentHandler];
  [v47 handleFailureInMethod:a2, self, @"LNTranscriptActionRecord.m", 97, @"Invalid parameter not satisfying: %@", @"predictionsData" object file lineNumber description];

LABEL_4:
  v49.receiver = self;
  v49.super_class = (Class)LNTranscriptActionRecord;
  v26 = [(LNTranscriptActionRecord *)&v49 init];
  if (v26)
  {
    uint64_t v27 = [v18 copy];
    bundleIdentifier = v26->_bundleIdentifier;
    v26->_bundleIdentifier = (NSString *)v27;

    v26->_source = a4;
    uint64_t v29 = [v19 copy];
    clientLabel = v26->_clientLabel;
    v26->_clientLabel = (NSString *)v29;

    uint64_t v31 = [v20 copy];
    executionUUID = v26->_executionUUID;
    v26->_executionUUID = (NSUUID *)v31;

    uint64_t v33 = [v21 copy];
    executionDate = v26->_executionDate;
    v26->_executionDate = (NSDate *)v33;

    uint64_t v35 = [v22 copy];
    actionData = v26->_actionData;
    v26->_actionData = (NSData *)v35;

    uint64_t v37 = [v23 copy];
    resolvedActionData = v26->_resolvedActionData;
    v26->_resolvedActionData = (NSData *)v37;

    uint64_t v39 = [v24 copy];
    actionOutputData = v26->_actionOutputData;
    v26->_actionOutputData = (NSData *)v39;

    uint64_t v41 = [v25 copy];
    predictionsData = v26->_predictionsData;
    v26->_predictionsData = (NSData *)v41;

    v26->_hasNextAction = a12;
    v43 = v26;
  }

  return v26;
}

- (LNTranscriptActionRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
  unsigned __int16 v6 = [v4 decodeIntegerForKey:@"source"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientLabel"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"executionUUID"];
  v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [MEMORY[0x1E4F29128] UUID];
  }
  id v42 = v10;

  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"executionDate"];
  v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    id v13 = [MEMORY[0x1E4F1C9C8] now];
  }
  v14 = v13;

  v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionData"];
  v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"resolvedActionData"];
  uint64_t v41 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionOutputData"];
  uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"predictionsData"];
  if (v15 && v16)
  {
    LOBYTE(v34) = [v4 decodeBoolForKey:@"hasNextAction"];
    uint64_t v33 = v17;
    uint64_t v18 = v6;
    id v19 = (void *)v5;
    id v20 = (void *)v17;
    id v21 = (void *)v41;
    id v22 = self;
    id v23 = v42;
    id v24 = [(LNTranscriptActionRecord *)v22 initWithBundleIdentifier:v19 source:v18 clientLabel:v7 executionUUID:v42 executionDate:v14 actionData:v15 resolvedActionData:v16 actionOutputData:v41 predictionsData:v33 hasNextAction:v34];
    v40 = v24;
  }
  else
  {
    uint64_t v39 = self;
    v36 = v14;
    uint64_t v37 = v7;
    v38 = (void *)v5;
    id v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"action"];
    v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"resolvedAction"];
    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionOutput"];
    v28 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v29 = objc_opt_class();
    v30 = objc_msgSend(v28, "setWithObjects:", v29, objc_opt_class(), 0);
    uint64_t v31 = [v4 decodeObjectOfClasses:v30 forKey:@"predictions"];

    uint64_t v35 = (void *)v17;
    if (v25 && v26)
    {
      uint64_t v39 = [(LNTranscriptActionRecord *)v39 initWithBundleIdentifier:v38 source:v6 clientLabel:v37 executionUUID:v42 executionDate:v36 action:v25 resolvedAction:v26 actionOutput:v27 predictions:v31];
      v40 = v39;
    }
    else
    {
      v40 = 0;
    }

    id v19 = v38;
    id v24 = v39;
    v14 = v36;
    v7 = v37;
    id v23 = v42;
    id v21 = (void *)v41;
    id v20 = v35;
  }

  return v40;
}

- (NSArray)predictions
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  predictions = self->_predictions;
  if (!predictions)
  {
    id v4 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    v7 = objc_msgSend(v4, "setWithObjects:", v5, v6, objc_opt_class(), 0);
    v8 = (void *)MEMORY[0x1E4F28DC0];
    v9 = [(LNTranscriptActionRecord *)self predictionsData];
    id v16 = 0;
    id v10 = [v8 unarchivedObjectOfClasses:v7 fromData:v9 error:&v16];
    id v11 = v16;

    if (v11 || !v10)
    {
      v12 = getLNLogCategoryGeneral();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v13 = [(LNTranscriptActionRecord *)self predictionsData];
        *(_DWORD *)buf = 138412802;
        uint64_t v18 = v7;
        __int16 v19 = 2112;
        id v20 = v13;
        __int16 v21 = 2112;
        id v22 = v11;
        _os_log_impl(&dword_1A4419000, v12, OS_LOG_TYPE_ERROR, "Object archival failed for %@ with %@: %@", buf, 0x20u);
      }
    }

    v14 = self->_predictions;
    self->_predictions = v10;

    predictions = self->_predictions;
  }
  return predictions;
}

- (NSData)predictionsData
{
  return self->_predictionsData;
}

- (LNAction)action
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  action = self->_action;
  if (!action)
  {
    id v4 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = [(LNTranscriptActionRecord *)self actionData];
    id v14 = 0;
    v7 = [v4 unarchivedObjectOfClass:v5 fromData:v6 error:&v14];
    id v8 = v14;

    if (v8 || !v7)
    {
      v9 = getLNLogCategoryGeneral();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v10 = objc_opt_class();
        id v11 = [(LNTranscriptActionRecord *)self actionData];
        *(_DWORD *)buf = 138412802;
        uint64_t v16 = v10;
        __int16 v17 = 2112;
        uint64_t v18 = v11;
        __int16 v19 = 2112;
        id v20 = v8;
        _os_log_impl(&dword_1A4419000, v9, OS_LOG_TYPE_ERROR, "Object archival failed for %@ with %@: %@", buf, 0x20u);
      }
    }

    v12 = self->_action;
    self->_action = v7;

    action = self->_action;
  }
  return action;
}

- (NSData)actionData
{
  return self->_actionData;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v11 = 0;
  uint64_t v5 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:&v11];
  id v6 = v11;
  v7 = v6;
  if (v5) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v6 == 0;
  }
  if (!v8)
  {
    v9 = getLNLogCategoryGeneral();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = v7;
      _os_log_impl(&dword_1A4419000, v9, OS_LOG_TYPE_ERROR, "Failed to unarchive LNTranscriptActionRecord: %{public}@", buf, 0xCu);
    }

    uint64_t v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictionsData, 0);
  objc_storeStrong((id *)&self->_actionOutputData, 0);
  objc_storeStrong((id *)&self->_resolvedActionData, 0);
  objc_storeStrong((id *)&self->_actionData, 0);
  objc_storeStrong((id *)&self->_executionDate, 0);
  objc_storeStrong((id *)&self->_executionUUID, 0);
  objc_storeStrong((id *)&self->_clientLabel, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_predictions, 0);
  objc_storeStrong((id *)&self->_actionOutput, 0);
  objc_storeStrong((id *)&self->_resolvedAction, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

- (BMAppIntentInvocation)asBMAppIntentInvocation
{
  v2 = self;
  id v3 = LNTranscriptActionRecord.asBMAppIntentInvocation.getter();

  return (BMAppIntentInvocation *)v3;
}

- (BOOL)hasNextAction
{
  return self->_hasNextAction;
}

- (NSData)actionOutputData
{
  return self->_actionOutputData;
}

- (NSData)resolvedActionData
{
  return self->_resolvedActionData;
}

- (NSDate)executionDate
{
  return self->_executionDate;
}

- (NSUUID)executionUUID
{
  return self->_executionUUID;
}

- (NSString)clientLabel
{
  return self->_clientLabel;
}

- (void)setSource:(unsigned __int16)a3
{
  self->_source = a3;
}

- (unsigned)source
{
  return self->_source;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (id)serialize
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v8 = 0;
  v2 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:&v8];
  id v3 = v8;
  id v4 = v3;
  if (v2) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v3 == 0;
  }
  if (!v5)
  {
    id v6 = getLNLogCategoryGeneral();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v10 = v4;
      _os_log_impl(&dword_1A4419000, v6, OS_LOG_TYPE_ERROR, "Failed to serialize LNTranscriptActionRecord: %{public}@", buf, 0xCu);
    }

    v2 = 0;
  }

  return v2;
}

- (unsigned)dataVersion
{
  return +[LNTranscriptActionRecord datastoreVersion];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (LNTranscriptActionRecord *)a3;
  BOOL v5 = v4;
  if (self != v4)
  {
    id v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_71:

      goto LABEL_72;
    }
    v7 = [(LNTranscriptActionRecord *)self bundleIdentifier];
    id v8 = [(LNTranscriptActionRecord *)v6 bundleIdentifier];
    id v9 = v7;
    id v10 = v8;
    uint64_t v11 = v10;
    if (v9 == v10)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      id v13 = v10;
      id v14 = v9;
      if (!v9 || !v10) {
        goto LABEL_69;
      }
      int v15 = [v9 isEqualToString:v10];

      if (!v15) {
        goto LABEL_18;
      }
    }
    int v16 = [(LNTranscriptActionRecord *)self source];
    if (v16 != [(LNTranscriptActionRecord *)v6 source])
    {
LABEL_18:
      LOBYTE(v12) = 0;
LABEL_70:

      goto LABEL_71;
    }
    __int16 v17 = [(LNTranscriptActionRecord *)self clientLabel];
    uint64_t v18 = [(LNTranscriptActionRecord *)v6 clientLabel];
    id v14 = v17;
    id v19 = v18;
    id v13 = v19;
    if (v14 == v19)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      id v20 = v19;
      id v21 = v14;
      if (!v14 || !v19) {
        goto LABEL_68;
      }
      int v22 = [v14 isEqualToString:v19];

      if (!v22)
      {
        LOBYTE(v12) = 0;
LABEL_69:

        goto LABEL_70;
      }
    }
    uint64_t v23 = [(LNTranscriptActionRecord *)self executionUUID];
    id v24 = [(LNTranscriptActionRecord *)v6 executionUUID];
    id v21 = v23;
    id v25 = v24;
    id v20 = v25;
    id v66 = v21;
    if (v21 == v25)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      v26 = v25;
      if (!v21 || !v25) {
        goto LABEL_67;
      }
      int v12 = [v21 isEqual:v25];

      if (!v12) {
        goto LABEL_68;
      }
    }
    v65 = v20;
    uint64_t v27 = [(LNTranscriptActionRecord *)self executionDate];
    v28 = [(LNTranscriptActionRecord *)v6 executionDate];
    id v29 = v27;
    id v30 = v28;
    v63 = v30;
    id v64 = v29;
    if (v29 == v30)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      if (!v29)
      {
        uint64_t v31 = v30;
        id v20 = v65;
        goto LABEL_65;
      }
      uint64_t v31 = v30;
      id v20 = v65;
      if (!v30)
      {
LABEL_65:

        goto LABEL_66;
      }
      int v32 = [v29 isEqual:v30];

      if (!v32)
      {
        LOBYTE(v12) = 0;
        id v20 = v65;
LABEL_66:
        v26 = v63;
        id v21 = v64;
LABEL_67:

        id v21 = v66;
LABEL_68:

        goto LABEL_69;
      }
    }
    uint64_t v33 = [(LNTranscriptActionRecord *)self actionData];
    uint64_t v34 = [(LNTranscriptActionRecord *)v6 actionData];
    id v29 = v33;
    id v35 = v34;
    id v61 = v29;
    v62 = v35;
    if (v29 != v35)
    {
      LOBYTE(v12) = 0;
      if (v29)
      {
        v36 = v35;
        id v20 = v65;
        if (v35)
        {
          int v37 = [v29 isEqual:v35];

          if (!v37)
          {
            LOBYTE(v12) = 0;
            id v20 = v65;
            uint64_t v31 = v62;
            goto LABEL_65;
          }
LABEL_38:
          v38 = [(LNTranscriptActionRecord *)self resolvedActionData];
          uint64_t v39 = [(LNTranscriptActionRecord *)v6 resolvedActionData];
          id v40 = v38;
          id v41 = v39;
          v59 = v41;
          id v60 = v40;
          if (v40 == v41)
          {
          }
          else
          {
            LOBYTE(v12) = 0;
            if (!v40)
            {
              id v42 = v41;
              id v20 = v65;
              goto LABEL_62;
            }
            id v42 = v41;
            id v20 = v65;
            if (!v41)
            {
LABEL_62:

              goto LABEL_63;
            }
            int v43 = [v40 isEqual:v41];

            if (!v43)
            {
              LOBYTE(v12) = 0;
              id v20 = v65;
LABEL_63:
              v36 = v59;
              id v29 = v60;
              goto LABEL_64;
            }
          }
          v44 = [(LNTranscriptActionRecord *)self actionOutputData];
          v45 = [(LNTranscriptActionRecord *)v6 actionOutputData];
          id v40 = v44;
          id v46 = v45;
          id v57 = v40;
          v58 = v46;
          if (v40 == v46)
          {
          }
          else
          {
            LOBYTE(v12) = 0;
            if (!v40)
            {
              v47 = v46;
              id v20 = v65;
              goto LABEL_61;
            }
            v47 = v46;
            id v20 = v65;
            if (!v46)
            {
LABEL_61:

              id v40 = v57;
              id v42 = v58;
              goto LABEL_62;
            }
            int v48 = [v40 isEqual:v46];

            if (!v48)
            {
              LOBYTE(v12) = 0;
              id v20 = v65;
              id v42 = v58;
              goto LABEL_62;
            }
          }
          objc_super v49 = [(LNTranscriptActionRecord *)self predictionsData];
          v50 = [(LNTranscriptActionRecord *)v6 predictionsData];
          id v51 = v49;
          id v52 = v50;
          v53 = v51;
          BOOL v54 = v51 == v52;
          v55 = v52;
          if (v54)
          {
            LOBYTE(v12) = 1;
          }
          else
          {
            LOBYTE(v12) = 0;
            if (v53)
            {
              id v20 = v65;
              if (v52) {
                LOBYTE(v12) = [v53 isEqual:v52];
              }
              goto LABEL_59;
            }
          }
          id v20 = v65;
LABEL_59:

          v47 = v55;
          id v40 = v53;
          goto LABEL_61;
        }
      }
      else
      {
        v36 = v35;
        id v20 = v65;
      }
LABEL_64:

      id v29 = v61;
      uint64_t v31 = v62;
      goto LABEL_65;
    }

    goto LABEL_38;
  }
  LOBYTE(v12) = 1;
LABEL_72:

  return v12;
}

- (unint64_t)hash
{
  id v3 = [(LNTranscriptActionRecord *)self bundleIdentifier];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = [(LNTranscriptActionRecord *)self source];
  id v6 = [(LNTranscriptActionRecord *)self clientLabel];
  uint64_t v7 = v4 ^ [v6 hash] ^ v5;
  id v8 = [(LNTranscriptActionRecord *)self executionUUID];
  uint64_t v9 = [v8 hash];
  id v10 = [(LNTranscriptActionRecord *)self executionDate];
  uint64_t v11 = v9 ^ [v10 hash];
  int v12 = [(LNTranscriptActionRecord *)self actionData];
  uint64_t v13 = v7 ^ v11 ^ [v12 hash];
  id v14 = [(LNTranscriptActionRecord *)self resolvedActionData];
  uint64_t v15 = [v14 hash];
  int v16 = [(LNTranscriptActionRecord *)self actionOutputData];
  uint64_t v17 = v15 ^ [v16 hash];
  uint64_t v18 = [(LNTranscriptActionRecord *)self predictionsData];
  unint64_t v19 = v13 ^ v17 ^ [v18 hash];

  return v19;
}

- (id)verboseDescription
{
  int v16 = NSString;
  id v3 = (objc_class *)objc_opt_class();
  uint64_t v17 = NSStringFromClass(v3);
  uint64_t v4 = [(LNTranscriptActionRecord *)self bundleIdentifier];
  unsigned int v5 = [(LNTranscriptActionRecord *)self source];
  if (v5 > 0xA) {
    id v6 = @"Application";
  }
  else {
    id v6 = off_1E5B38738[v5];
  }
  uint64_t v7 = [(LNTranscriptActionRecord *)self clientLabel];
  id v8 = [(LNTranscriptActionRecord *)self executionUUID];
  uint64_t v9 = [(LNTranscriptActionRecord *)self executionDate];
  id v10 = [(LNTranscriptActionRecord *)self action];
  uint64_t v11 = [(LNTranscriptActionRecord *)self resolvedAction];
  int v12 = [(LNTranscriptActionRecord *)self actionOutput];
  uint64_t v13 = [(LNTranscriptActionRecord *)self predictions];
  id v14 = [v16 stringWithFormat:@"<%@: %p, bundleIdentifier: %@, source: %@, clientLabel: %@, executionUUID: %@, executionDate: %@, action: %@, resolvedAction: %@, actionOutput: %@, predictions %@>", v17, self, v4, v6, v7, v8, v9, v10, v11, v12, v13];

  return v14;
}

- (NSString)description
{
  id v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  unsigned int v5 = NSStringFromClass(v4);
  id v6 = [(LNTranscriptActionRecord *)self bundleIdentifier];
  uint64_t v7 = [(LNTranscriptActionRecord *)self executionUUID];
  id v8 = [(LNTranscriptActionRecord *)self executionDate];
  uint64_t v9 = [v3 stringWithFormat:@"<%@: %p, bundleIdentifier: %@, executionUUID: %@, executionDate: %@>", v5, self, v6, v7, v8];

  return (NSString *)v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v12 = a3;
  uint64_t v4 = [(LNTranscriptActionRecord *)self bundleIdentifier];
  [v12 encodeObject:v4 forKey:@"bundleIdentifier"];

  objc_msgSend(v12, "encodeInteger:forKey:", -[LNTranscriptActionRecord source](self, "source"), @"source");
  unsigned int v5 = [(LNTranscriptActionRecord *)self clientLabel];
  [v12 encodeObject:v5 forKey:@"clientLabel"];

  id v6 = [(LNTranscriptActionRecord *)self executionUUID];
  [v12 encodeObject:v6 forKey:@"executionUUID"];

  uint64_t v7 = [(LNTranscriptActionRecord *)self executionDate];
  [v12 encodeObject:v7 forKey:@"executionDate"];

  id v8 = [(LNTranscriptActionRecord *)self actionData];
  [v12 encodeObject:v8 forKey:@"actionData"];

  uint64_t v9 = [(LNTranscriptActionRecord *)self resolvedActionData];
  [v12 encodeObject:v9 forKey:@"resolvedActionData"];

  id v10 = [(LNTranscriptActionRecord *)self actionOutputData];
  [v12 encodeObject:v10 forKey:@"actionOutputData"];

  uint64_t v11 = [(LNTranscriptActionRecord *)self predictionsData];
  [v12 encodeObject:v11 forKey:@"predictionsData"];

  objc_msgSend(v12, "encodeBool:forKey:", -[LNTranscriptActionRecord hasNextAction](self, "hasNextAction"), @"hasNextAction");
}

- (LNActionOutput)actionOutput
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (!self->_actionOutput)
  {
    id v3 = [(LNTranscriptActionRecord *)self actionOutputData];

    if (v3)
    {
      uint64_t v4 = (void *)MEMORY[0x1E4F28DC0];
      uint64_t v5 = objc_opt_class();
      id v6 = [(LNTranscriptActionRecord *)self actionOutputData];
      id v15 = 0;
      uint64_t v7 = [v4 unarchivedObjectOfClass:v5 fromData:v6 error:&v15];
      id v8 = v15;

      if (v8 || !v7)
      {
        uint64_t v9 = getLNLogCategoryGeneral();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          uint64_t v10 = objc_opt_class();
          uint64_t v11 = [(LNTranscriptActionRecord *)self actionOutputData];
          *(_DWORD *)buf = 138412802;
          uint64_t v17 = v10;
          __int16 v18 = 2112;
          unint64_t v19 = v11;
          __int16 v20 = 2112;
          id v21 = v8;
          _os_log_impl(&dword_1A4419000, v9, OS_LOG_TYPE_ERROR, "Object archival failed for %@ with %@: %@", buf, 0x20u);
        }
      }

      actionOutput = self->_actionOutput;
      self->_actionOutput = v7;
    }
  }
  uint64_t v13 = self->_actionOutput;
  return v13;
}

- (LNAction)resolvedAction
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  resolvedAction = self->_resolvedAction;
  if (!resolvedAction)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v5 = objc_opt_class();
    id v6 = [(LNTranscriptActionRecord *)self resolvedActionData];
    id v14 = 0;
    uint64_t v7 = [v4 unarchivedObjectOfClass:v5 fromData:v6 error:&v14];
    id v8 = v14;

    if (v8 || !v7)
    {
      uint64_t v9 = getLNLogCategoryGeneral();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v10 = objc_opt_class();
        uint64_t v11 = [(LNTranscriptActionRecord *)self resolvedActionData];
        *(_DWORD *)buf = 138412802;
        uint64_t v16 = v10;
        __int16 v17 = 2112;
        __int16 v18 = v11;
        __int16 v19 = 2112;
        id v20 = v8;
        _os_log_impl(&dword_1A4419000, v9, OS_LOG_TYPE_ERROR, "Object archival failed for %@ with %@: %@", buf, 0x20u);
      }
    }

    id v12 = self->_resolvedAction;
    self->_resolvedAction = v7;

    resolvedAction = self->_resolvedAction;
  }
  return resolvedAction;
}

- (LNTranscriptActionRecord)initWithBundleIdentifier:(id)a3 source:(unsigned __int16)a4 clientLabel:(id)a5 executionUUID:(id)a6 executionDate:(id)a7 action:(id)a8 resolvedAction:(id)a9 actionOutput:(id)a10 predictions:(id)a11
{
  unsigned int v43 = a4;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v15 = a8;
  id v16 = a9;
  id v17 = a10;
  id v18 = a11;
  __int16 v19 = (void *)MEMORY[0x1E4F28DB0];
  id v47 = 0;
  id v40 = a7;
  id v39 = a6;
  id v38 = a5;
  id v20 = a3;
  uint64_t v21 = [v19 archivedDataWithRootObject:v15 requiringSecureCoding:1 error:&v47];
  id v22 = v47;
  if (v22 || !v21)
  {
    uint64_t v23 = getLNLogCategoryGeneral();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v49 = v15;
      __int16 v50 = 2112;
      id v51 = v22;
      _os_log_impl(&dword_1A4419000, v23, OS_LOG_TYPE_ERROR, "Object archival failed for %@: %@", buf, 0x16u);
    }
  }
  id v46 = 0;
  id v24 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v16 requiringSecureCoding:1 error:&v46];
  id v25 = v46;
  if (v25 || !v24)
  {
    v26 = getLNLogCategoryGeneral();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v49 = v16;
      __int16 v50 = 2112;
      id v51 = v25;
      _os_log_impl(&dword_1A4419000, v26, OS_LOG_TYPE_ERROR, "Object archival failed for %@: %@", buf, 0x16u);
    }
  }
  uint64_t v27 = (void *)v21;

  id v45 = 0;
  v28 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v17 requiringSecureCoding:1 error:&v45];
  id v29 = v45;
  if (v29 || !v28)
  {
    id v30 = getLNLogCategoryGeneral();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v49 = v17;
      __int16 v50 = 2112;
      id v51 = v29;
      _os_log_impl(&dword_1A4419000, v30, OS_LOG_TYPE_ERROR, "Object archival failed for %@: %@", buf, 0x16u);
    }
  }
  int v37 = v16;

  id v44 = 0;
  uint64_t v31 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v18 requiringSecureCoding:1 error:&v44];
  id v32 = v44;
  if (v32 || !v31)
  {
    uint64_t v33 = getLNLogCategoryGeneral();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v49 = v18;
      __int16 v50 = 2112;
      id v51 = v32;
      _os_log_impl(&dword_1A4419000, v33, OS_LOG_TYPE_ERROR, "Object archival failed for %@: %@", buf, 0x16u);
    }
  }
  uint64_t v34 = [v17 nextAction];
  LOBYTE(v36) = v34 != 0;
  id v42 = [(LNTranscriptActionRecord *)self initWithBundleIdentifier:v20 source:v43 clientLabel:v38 executionUUID:v39 executionDate:v40 actionData:v27 resolvedActionData:v24 actionOutputData:v28 predictionsData:v31 hasNextAction:v36];

  return v42;
}

+ (unsigned)datastoreVersion
{
  return 1;
}

- (LNTranscriptActionRecord)initWithAction:(id)a3 resolvedAction:(id)a4 bundleIdentifier:(id)a5 actionOutput:(id)a6 executionUUID:(id)a7 source:(unsigned __int16)a8 executionDate:(id)a9 clientLabel:(id)a10 predictions:(id)a11
{
  unsigned int v28 = a8;
  id v29 = a3;
  id v16 = a4;
  id v17 = (__CFString *)a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a9;
  id v21 = a10;
  id v22 = a11;
  if (!v17)
  {
    uint64_t v23 = getLNLogCategoryGeneral();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4419000, v23, OS_LOG_TYPE_ERROR, "Bundle identifier not provided for action transcript record.", buf, 2u);
    }

    id v17 = @"com.apple.example";
  }
  id v24 = v19;
  if (v19)
  {
    if (v20) {
      goto LABEL_7;
    }
LABEL_11:
    uint64_t v27 = [MEMORY[0x1E4F1C9C8] now];
    id v25 = [(LNTranscriptActionRecord *)self initWithBundleIdentifier:v17 source:v28 clientLabel:v21 executionUUID:v24 executionDate:v27 action:v29 resolvedAction:v16 actionOutput:v18 predictions:v22];

    if (v19) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  id v24 = [MEMORY[0x1E4F29128] UUID];
  if (!v20) {
    goto LABEL_11;
  }
LABEL_7:
  id v25 = [(LNTranscriptActionRecord *)self initWithBundleIdentifier:v17 source:v28 clientLabel:v21 executionUUID:v24 executionDate:v20 action:v29 resolvedAction:v16 actionOutput:v18 predictions:v22];
  if (!v19) {
LABEL_8:
  }

LABEL_9:
  return v25;
}

@end