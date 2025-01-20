@interface ATXMinimalSlotResolutionParameters
- (ATXMinimalSlotResolutionParameters)initWithAction:(id)a3 slots:(id)a4;
- (ATXMinimalSlotResolutionParameters)initWithParameterHash:(unint64_t)a3 slotHash:(unint64_t)a4 uuid:(id)a5 paramCount:(unint64_t)a6;
- (BOOL)isEqual:(id)a3;
- (id)actionAndSlotSet;
- (unint64_t)hash;
- (unint64_t)paramCount;
- (unint64_t)slotHash;
@end

@implementation ATXMinimalSlotResolutionParameters

- (ATXMinimalSlotResolutionParameters)initWithParameterHash:(unint64_t)a3 slotHash:(unint64_t)a4 uuid:(id)a5 paramCount:(unint64_t)a6
{
  id v12 = a5;
  if (!v12)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"ATXMinimalSlotResolutionParameters.m", 21, @"Invalid parameter not satisfying: %@", @"uuid" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)ATXMinimalSlotResolutionParameters;
  v13 = [(ATXMinimalSlotResolutionParameters *)&v17 init];
  v14 = v13;
  if (v13)
  {
    v13->_paramHash = a3;
    v13->_slotHash = a4;
    objc_storeStrong((id *)&v13->_slotSetUuid, a5);
    v14->_paramCount = a6;
  }

  return v14;
}

- (ATXMinimalSlotResolutionParameters)initWithAction:(id)a3 slots:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ATXMinimalSlotResolutionParameters;
  v8 = [(ATXMinimalSlotResolutionParameters *)&v16 init];
  v9 = v8;
  if (v8)
  {
    if (v6 && v7)
    {
      v10 = (void *)[objc_alloc(MEMORY[0x1E4F4B300]) initWithAction:v6 slots:v7];
      v9->_paramHash = [v10 hash];
    }
    else
    {
      v8->_paramHash = 0;
    }
    v9->_slotHash = [v7 hash];
    uint64_t v11 = [v7 uuid];
    slotSetUuid = v9->_slotSetUuid;
    v9->_slotSetUuid = (NSUUID *)v11;

    v13 = [v7 parameters];
    if (v13)
    {
      v14 = [v7 parameters];
      v9->_paramCount = [v14 count];
    }
    else
    {
      v9->_paramCount = 0;
    }
  }
  return v9;
}

- (id)actionAndSlotSet
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = +[_ATXDataStore sharedInstance];
  v4 = [v3 actionForSlotUUID:self->_slotSetUuid];

  v5 = [v4 first];
  [v4 second];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v12 = objc_msgSend(v11, "uuid", (void)v17);
        int v13 = [v12 isEqual:self->_slotSetUuid];

        if (v13)
        {
          id v14 = v11;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  id v14 = 0;
LABEL_11:

  v15 = (void *)[objc_alloc(MEMORY[0x1E4F93BB8]) initWithFirst:v5 second:v14];
  return v15;
}

- (unint64_t)hash
{
  return self->_paramHash;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ATXMinimalSlotResolutionParameters *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      unint64_t paramHash = self->_paramHash;
      if (paramHash == [(ATXMinimalSlotResolutionParameters *)v5 hash])
      {
        unint64_t slotHash = self->_slotHash;
        BOOL v8 = slotHash == [(ATXMinimalSlotResolutionParameters *)v5 slotHash];
      }
      else
      {
        BOOL v8 = 0;
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)slotHash
{
  return self->_slotHash;
}

- (unint64_t)paramCount
{
  return self->_paramCount;
}

- (void).cxx_destruct
{
}

@end