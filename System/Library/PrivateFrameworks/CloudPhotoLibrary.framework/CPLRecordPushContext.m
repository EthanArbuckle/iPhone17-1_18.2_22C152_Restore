@interface CPLRecordPushContext
+ (BOOL)supportsSecureCoding;
+ (id)newEmptyPushContext;
+ (id)newPushContextForChange:(id)a3 overStoredRecord:(id)a4 initialUpload:(BOOL)a5;
+ (id)pushContextsFromStoredUploadIdentifiers:(id)a3;
+ (id)pushContextsFromStoredUploadIdentifiersInCoder:(id)a3 key:(id)a4;
+ (int64_t)mergingFlags:(int64_t)a3 previousFlags:(int64_t)a4 changeType:(unint64_t)a5;
+ (unint64_t)minimumPriorityForLocalConflictResolution;
+ (void)setMinimumPriorityForLocalConflictResolution:(unint64_t)a3;
- (CPLRecordPushContext)initWithCoder:(id)a3;
- (CPLRecordPushContext)initWithUploadIdentifier:(id)a3 flags:(int64_t)a4 priority:(unint64_t)a5;
- (NSString)uploadIdentifier;
- (id)copyContextWithPriority:(unint64_t)a3;
- (id)copyContextWithUploadIdentifier:(id)a3;
- (id)pushContextAddingUploadIdentifier;
- (id)pushContextMergingFlags:(int64_t)a3 changeType:(unint64_t)a4 uploadIdentifier:(id)a5 priority:(unint64_t)a6;
- (int64_t)flags;
- (unint64_t)priority;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CPLRecordPushContext

- (void).cxx_destruct
{
}

- (unint64_t)priority
{
  return self->_priority;
}

- (int64_t)flags
{
  return self->_flags;
}

- (NSString)uploadIdentifier
{
  return self->_uploadIdentifier;
}

- (id)pushContextMergingFlags:(int64_t)a3 changeType:(unint64_t)a4 uploadIdentifier:(id)a5 priority:(unint64_t)a6
{
  unint64_t v10 = (unint64_t)a5;
  int64_t v11 = +[CPLRecordPushContext mergingFlags:self->_flags previousFlags:a3 changeType:a4];
  if (v11 != self->_flags) {
    goto LABEL_5;
  }
  uploadIdentifier = self->_uploadIdentifier;
  if (v10 && uploadIdentifier)
  {
    if ((objc_msgSend((id)v10, "isEqual:") & 1) == 0)
    {
LABEL_5:
      v13 = [[CPLRecordPushContext alloc] initWithUploadIdentifier:v10 flags:v11 priority:a6];
      goto LABEL_8;
    }
  }
  else if (v10 | (unint64_t)uploadIdentifier)
  {
    goto LABEL_5;
  }
  v13 = self;
LABEL_8:
  v14 = v13;

  return v14;
}

- (id)pushContextAddingUploadIdentifier
{
  v3 = [MEMORY[0x1E4F29128] UUID];
  v4 = [v3 UUIDString];
  id v5 = [(CPLRecordPushContext *)self copyContextWithUploadIdentifier:v4];

  return v5;
}

- (id)copyContextWithPriority:(unint64_t)a3
{
  id v5 = [CPLRecordPushContext alloc];
  uploadIdentifier = self->_uploadIdentifier;
  int64_t flags = self->_flags;
  return [(CPLRecordPushContext *)v5 initWithUploadIdentifier:uploadIdentifier flags:flags priority:a3];
}

- (id)copyContextWithUploadIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [[CPLRecordPushContext alloc] initWithUploadIdentifier:v4 flags:self->_flags priority:self->_priority];

  return v5;
}

- (CPLRecordPushContext)initWithUploadIdentifier:(id)a3 flags:(int64_t)a4 priority:(unint64_t)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CPLRecordPushContext;
  v9 = [(CPLRecordPushContext *)&v13 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    uploadIdentifier = v9->_uploadIdentifier;
    v9->_uploadIdentifier = (NSString *)v10;

    v9->_int64_t flags = a4;
    v9->_priority = a5;
  }

  return v9;
}

- (CPLRecordPushContext)initWithCoder:(id)a3
{
  uint64_t v4 = initWithCoder__onceToken_5056;
  id v5 = a3;
  if (v4 != -1) {
    dispatch_once(&initWithCoder__onceToken_5056, &__block_literal_global_5057);
  }
  v6 = [v5 decodeObjectOfClass:initWithCoder___NSStringClass forKey:@"u"];
  uint64_t v7 = [v5 decodeIntegerForKey:@"f"];
  uint64_t v8 = [v5 decodeIntegerForKey:@"p"];

  v9 = [(CPLRecordPushContext *)self initWithUploadIdentifier:v6 flags:v7 priority:v8];
  return v9;
}

uint64_t __38__CPLRecordPushContext_initWithCoder___block_invoke()
{
  uint64_t result = objc_opt_class();
  initWithCoder___NSStringClass = result;
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  uploadIdentifier = self->_uploadIdentifier;
  id v5 = a3;
  [v5 encodeObject:uploadIdentifier forKey:@"u"];
  [v5 encodeInteger:self->_flags forKey:@"f"];
}

+ (void)setMinimumPriorityForLocalConflictResolution:(unint64_t)a3
{
  overriddenMinimumPriorityForLocalConflictResolution = a3;
}

+ (unint64_t)minimumPriorityForLocalConflictResolution
{
  unint64_t v2 = overriddenMinimumPriorityForLocalConflictResolution;
  if (overriddenMinimumPriorityForLocalConflictResolution == -1)
  {
    v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v4 = [v3 objectForKey:@"CPLMinimumPriorityForLocalConflictResolution"];

    if (v4) {
      unint64_t v2 = [v4 unsignedIntegerValue];
    }
    else {
      unint64_t v2 = 1000;
    }
  }
  return v2;
}

+ (int64_t)mergingFlags:(int64_t)a3 previousFlags:(int64_t)a4 changeType:(unint64_t)a5
{
  int64_t result = a3;
  if (a5 != 1024 && (!a5 || (a5 & 0x40) != 0))
  {
    int64_t v6 = a4 & 3 | a3;
    unint64_t v7 = a3 & 0xFFFFFFFFFFFFFFFDLL;
    if ((a4 & 1) == 0) {
      unint64_t v7 = a3;
    }
    if ((a3 & 2) != 0) {
      int64_t v6 = v7;
    }
    unint64_t v8 = a3 & 0xFFFFFFFFFFFFFFFELL;
    if ((a4 & 2) == 0) {
      unint64_t v8 = a3;
    }
    if (a3) {
      int64_t v6 = v8;
    }
    return v6 | a4 & 4;
  }
  return result;
}

+ (id)newPushContextForChange:(id)a3 overStoredRecord:(id)a4 initialUpload:(BOOL)a5
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isAssetChange] && objc_msgSend(v6, "hasChangeType:", 64))
  {
    unint64_t v8 = [v6 sharingScopeIdentifier];
    if (v7)
    {
      v9 = [v7 sharingScopeIdentifier];
      uint64_t v10 = v9;
      if (v8)
      {
        if (v9 && ([v8 isEqual:v9] & 1) != 0)
        {

          uint64_t v11 = 0;
        }
        else
        {

          uint64_t v11 = 1;
        }
      }
      else
      {
        BOOL v14 = v9 != 0;

        uint64_t v11 = 2 * v14;
      }
    }
    else
    {
      objc_super v13 = [v6 sharingScopeIdentifier];

      uint64_t v11 = v13 != 0;
    }
    v15 = [v6 updateSharingContributorUserIdentifiers];
    uint64_t v16 = [v15 count];

    if (v16) {
      uint64_t v12 = v11 | 4;
    }
    else {
      uint64_t v12 = v11;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }
  v17 = [[CPLRecordPushContext alloc] initWithUploadIdentifier:0 flags:v12 priority:0];

  return v17;
}

+ (id)pushContextsFromStoredUploadIdentifiersInCoder:(id)a3 key:(id)a4
{
  uint64_t v5 = pushContextsFromStoredUploadIdentifiersInCoder_key__onceToken;
  id v6 = a4;
  id v7 = a3;
  if (v5 != -1) {
    dispatch_once(&pushContextsFromStoredUploadIdentifiersInCoder_key__onceToken, &__block_literal_global_14);
  }
  unint64_t v8 = [v7 decodeObjectOfClasses:pushContextsFromStoredUploadIdentifiersInCoder_key__uploadIdentifiersClasses forKey:v6];

  v9 = +[CPLRecordPushContext pushContextsFromStoredUploadIdentifiers:v8];

  return v9;
}

uint64_t __75__CPLRecordPushContext_pushContextsFromStoredUploadIdentifiersInCoder_key___block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_msgSend(v0, "setWithObjects:", v1, v2, objc_opt_class(), 0);
  uint64_t v4 = pushContextsFromStoredUploadIdentifiersInCoder_key__uploadIdentifiersClasses;
  pushContextsFromStoredUploadIdentifiersInCoder_key__uploadIdentifiersClasses = v3;
  return MEMORY[0x1F41817F8](v3, v4);
}

+ (id)pushContextsFromStoredUploadIdentifiers:(id)a3
{
  uint64_t v3 = +[CPLScopedIdentifier scopedIdentifiersFromDictionaryOfUnknownIdentifiers:a3];
  if ([v3 count])
  {
    uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v3, "count"));
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __64__CPLRecordPushContext_pushContextsFromStoredUploadIdentifiers___block_invoke;
    v8[3] = &unk_1E60A7448;
    id v9 = v4;
    id v5 = v4;
    [v3 enumerateKeysAndObjectsUsingBlock:v8];
    id v6 = (void *)[v5 copy];
  }
  else
  {
    id v6 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v6;
}

void __64__CPLRecordPushContext_pushContextsFromStoredUploadIdentifiers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = [[CPLRecordPushContext alloc] initWithUploadIdentifier:v5 flags:0 priority:0];

  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)newEmptyPushContext
{
  uint64_t v2 = [CPLRecordPushContext alloc];
  return [(CPLRecordPushContext *)v2 initWithUploadIdentifier:0 flags:0 priority:0];
}

@end