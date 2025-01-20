@interface CPLEngineScope
+ (BOOL)supportsSecureCoding;
+ (id)separatorForStatusKey:(id)a3;
+ (void)formatStatusDictionary:(id)a3 forScopeWithIdentifier:(id)a4 appendString:(id)a5 appendTopLevelStatus:(id)a6 appendLineStatus:(id)a7;
- (BOOL)isEqual:(id)a3;
- (CPLEngineScope)initWithCoder:(id)a3;
- (CPLEngineScope)initWithScopeIdentifier:(id)a3 scopeType:(int64_t)a4;
- (NSDate)creationDate;
- (NSString)scopeIdentifier;
- (id)description;
- (id)statusDescription;
- (int64_t)cloudIndex;
- (int64_t)localIndex;
- (int64_t)scopeType;
- (int64_t)stableIndex;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCloudIndex:(int64_t)a3;
- (void)setCreationDate:(id)a3;
- (void)setLocalIndex:(int64_t)a3;
- (void)setStableIndex:(int64_t)a3;
@end

@implementation CPLEngineScope

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_scopeIdentifier, 0);
}

- (void)setStableIndex:(int64_t)a3
{
  self->_stableIndex = a3;
}

- (int64_t)stableIndex
{
  return self->_stableIndex;
}

- (void)setCloudIndex:(int64_t)a3
{
  self->_cloudIndex = a3;
}

- (int64_t)cloudIndex
{
  return self->_cloudIndex;
}

- (void)setLocalIndex:(int64_t)a3
{
  self->_localIndex = a3;
}

- (int64_t)localIndex
{
  return self->_localIndex;
}

- (void)setCreationDate:(id)a3
{
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (int64_t)scopeType
{
  return self->_scopeType;
}

- (NSString)scopeIdentifier
{
  return self->_scopeIdentifier;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CPLEngineScope *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = self->_scopeIdentifier;
      uint64_t v6 = [(CPLEngineScope *)v4 scopeIdentifier];
      uint64_t v7 = v6;
      BOOL v8 = v5 && v6 && ([(id)v5 isEqual:v6] & 1) != 0 || (v5 | v7) == 0;
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  return [(NSString *)self->_scopeIdentifier hash];
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<%@ %@ %ld/%ld/%ld>", objc_opt_class(), self->_scopeIdentifier, self->_localIndex, self->_cloudIndex, self->_stableIndex];
  return v2;
}

- (id)statusDescription
{
  id v3 = [NSString alloc];
  long long v8 = *(_OWORD *)&self->_localIndex;
  int64_t stableIndex = self->_stableIndex;
  unint64_t v5 = +[CPLDateFormatter stringFromDateAgo:self->_creationDate now:0];
  uint64_t v6 = (void *)[v3 initWithFormat:@"%ld/%ld/%ld - creat: %@", v8, stableIndex, v5];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  scopeIdentifier = self->_scopeIdentifier;
  id v5 = a3;
  [v5 encodeObject:scopeIdentifier forKey:@"scopeIdentifier"];
  [v5 encodeInteger:self->_scopeType forKey:@"scopeType"];
  [v5 encodeObject:self->_creationDate forKey:@"creationDate"];
  [v5 encodeInteger:self->_localIndex forKey:@"localIndex"];
  [v5 encodeInteger:self->_cloudIndex forKey:@"cloudIndex"];
  [v5 encodeInteger:self->_stableIndex forKey:@"stableIndex"];
}

- (CPLEngineScope)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"scopeIdentifier"];
  uint64_t v6 = -[CPLEngineScope initWithScopeIdentifier:scopeType:](self, "initWithScopeIdentifier:scopeType:", v5, [v4 decodeIntegerForKey:@"scopeType"]);
  if (v6)
  {
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"creationDate"];
    creationDate = v6->_creationDate;
    v6->_creationDate = (NSDate *)v7;

    v6->_localIndex = [v4 decodeIntegerForKey:@"localIndex"];
    v6->_cloudIndex = [v4 decodeIntegerForKey:@"cloudIndex"];
    v6->_int64_t stableIndex = [v4 decodeIntegerForKey:@"stableIndex"];
  }

  return v6;
}

- (CPLEngineScope)initWithScopeIdentifier:(id)a3 scopeType:(int64_t)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CPLEngineScope;
  uint64_t v7 = [(CPLEngineScope *)&v13 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    scopeIdentifier = v7->_scopeIdentifier;
    v7->_scopeIdentifier = (NSString *)v8;

    v7->_scopeType = a4;
    uint64_t v10 = [MEMORY[0x1E4F1C9C8] date];
    creationDate = v7->_creationDate;
    v7->_creationDate = (NSDate *)v10;
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)formatStatusDictionary:(id)a3 forScopeWithIdentifier:(id)a4 appendString:(id)a5 appendTopLevelStatus:(id)a6 appendLineStatus:(id)a7
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  objc_super v13 = (char *)a5;
  v14 = (char *)a6;
  v15 = (void (**)(id, __CFString *, void))a7;
  v16 = (void (**)(id, __CFString *))(v13 + 16);
  (*((void (**)(char *, id))v13 + 2))(v13, v12);
  (*((void (**)(char *, __CFString *))v13 + 2))(v13, @" (");
  uint64_t v17 = [v11 objectForKeyedSubscript:@"scope type"];
  v18 = (void *)v17;
  v19 = (void (**)(char *, __CFString *, void *))(v14 + 16);
  if (v17) {
    v20 = (__CFString *)v17;
  }
  else {
    v20 = @"invalid";
  }
  (*((void (**)(char *, __CFString *, __CFString *))v14 + 2))(v14, @"scope type", v20);

  (*v16)(v13, @" "));
  uint64_t v21 = [v11 objectForKeyedSubscript:@"indexes"];
  v22 = (void *)v21;
  if (v21) {
    v23 = (void *)v21;
  }
  else {
    v23 = &unk_1F0D91628;
  }
  (*v19)(v14, @"indexes", v23);

  (*v16)(v13, @" - creat: ");
  uint64_t v24 = [v11 objectForKeyedSubscript:@"creation date"];
  v25 = (void *)v24;
  if (v24) {
    v26 = (__CFString *)v24;
  }
  else {
    v26 = @"???";
  }
  (*v19)(v14, @"creation date", v26);

  uint64_t v27 = [v11 objectForKeyedSubscript:@"flags"];
  if (v27)
  {
    (*((void (**)(char *, __CFString *))v13 + 2))(v13, @" (");
    (*((void (**)(char *, __CFString *, uint64_t))v14 + 2))(v14, @"flags", v27);
    (*((void (**)(char *, __CFString *))v13 + 2))(v13, @""));
  }
  v77 = (void *)v27;
  v28 = [v11 objectForKeyedSubscript:@"busyState"];
  uint64_t v29 = [v28 integerValue];

  if (v29)
  {
    (*((void (**)(char *, __CFString *))v13 + 2))(v13, @" [");
    v30 = +[CPLScopeChange descriptionForBusyState:v29];
    (*((void (**)(char *, __CFString *, void *))v14 + 2))(v14, @"busyState", v30);

    (*((void (**)(char *, __CFString *))v13 + 2))(v13, @"]");
  }
  v78 = v14;
  v31 = [v11 objectForKeyedSubscript:@"zone"];
  v32 = v31;
  if (v31 && ([v31 isEqualToString:v12] & 1) == 0) {
    ((void (**)(id, __CFString *, void *))v15)[2](v15, @"zone", v32);
  }
  v76 = v32;
  v83[0] = MEMORY[0x1E4F143A8];
  v83[1] = 3221225472;
  v83[2] = __146__CPLEngineScope_CPLEngineScopeStatusFormatter__formatStatusDictionary_forScopeWithIdentifier_appendString_appendTopLevelStatus_appendLineStatus___block_invoke;
  v83[3] = &unk_1E60A7828;
  id v84 = v11;
  v33 = v15;
  id v34 = v84;
  v35 = (void (**)(id, void, id))v33;
  id v85 = v33;
  v36 = (void (**)(void, void))MEMORY[0x1BA994060](v83);
  ((void (**)(void, __CFString *))v36)[2](v36, @"disabled date");
  ((void (**)(void, __CFString *))v36)[2](v36, @"delete date");
  ((void (**)(void, __CFString *))v36)[2](v36, @"todo");
  ((void (**)(void, __CFString *))v36)[2](v36, @"init. est. size");
  ((void (**)(void, __CFString *))v36)[2](v36, @"last supported feature version");
  ((void (**)(void, __CFString *))v36)[2](v36, @"scope info");
  ((void (**)(void, __CFString *))v36)[2](v36, @"anch");
  ((void (**)(void, __CFString *))v36)[2](v36, @"queries");
  ((void (**)(void, __CFString *))v36)[2](v36, @"transient");
  ((void (**)(void, __CFString *))v36)[2](v36, @"upload group");
  ((void (**)(void, __CFString *))v36)[2](v36, @"download group");
  v37 = objc_alloc_init(_CPLEngineScopeDatesStack);
  v38 = [v34 objectForKeyedSubscript:@"initial sync"];
  -[_CPLEngineScopeDatesStack prependDate:forKey:]((uint64_t)v37, v38, @"initial sync");

  v39 = [v34 objectForKeyedSubscript:@"initial client download"];
  -[_CPLEngineScopeDatesStack prependDate:forKey:]((uint64_t)v37, v39, @"initial client download");

  v40 = [v34 objectForKeyedSubscript:@"initial mingle"];
  -[_CPLEngineScopeDatesStack prependDate:forKey:]((uint64_t)v37, v40, @"initial mingle");

  v41 = [v34 objectForKeyedSubscript:@"initial shared metadata download"];
  -[_CPLEngineScopeDatesStack prependDate:forKey:]((uint64_t)v37, v41, @"initial shared metadata download");

  v42 = [v34 objectForKeyedSubscript:@"initial metadata download"];
  -[_CPLEngineScopeDatesStack prependDate:forKey:]((uint64_t)v37, v42, @"initial metadata download");

  v43 = [v34 objectForKeyedSubscript:@"initial metadata queries"];
  -[_CPLEngineScopeDatesStack prependDate:forKey:]((uint64_t)v37, v43, @"initial metadata queries");

  v44 = [v34 objectForKeyedSubscript:@"activation"];
  -[_CPLEngineScopeDatesStack prependDate:forKey:]((uint64_t)v37, v44, @"activation");

  if (!v37) {
    goto LABEL_25;
  }
  if (![(NSMutableArray *)v37->_intermediateStatuses count])
  {
    v50 = v37->_lastDate;
    if (v50) {
      goto LABEL_23;
    }
    goto LABEL_25;
  }
  if (!v37->_proposedKey)
  {
    if (!_CPLSilentLogging)
    {
      v61 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B4CAC000, v61, OS_LOG_TYPE_ERROR, "missing proposed key", buf, 2u);
      }
    }
    v62 = [MEMORY[0x1E4F28B00] currentHandler];
    v63 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineScope.m"];
    v64 = @"missing proposed key";
    v65 = v62;
    v66 = v37;
    v67 = v63;
    uint64_t v68 = 412;
LABEL_53:
    [v65 handleFailureInMethod:sel_finalStatus object:v66 file:v67 lineNumber:v68 description:v64];

    abort();
  }
  if (!v37->_lastDate)
  {
    if (!_CPLSilentLogging)
    {
      v69 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B4CAC000, v69, OS_LOG_TYPE_ERROR, "missing last date", buf, 2u);
      }
    }
    v62 = [MEMORY[0x1E4F28B00] currentHandler];
    v63 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineScope.m"];
    v64 = @"missing last date";
    v65 = v62;
    v66 = v37;
    v67 = v63;
    uint64_t v68 = 413;
    goto LABEL_53;
  }
  if (!v37->_now)
  {
    if (!_CPLSilentLogging)
    {
      v70 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B4CAC000, v70, OS_LOG_TYPE_ERROR, "missing now", buf, 2u);
      }
    }
    v62 = [MEMORY[0x1E4F28B00] currentHandler];
    v63 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineScope.m"];
    v64 = @"missing now";
    v65 = v62;
    v66 = v37;
    v67 = v63;
    uint64_t v68 = 414;
    goto LABEL_53;
  }
  id v45 = [NSString alloc];
  v46 = [(NSMutableArray *)v37->_intermediateStatuses componentsJoinedByString:@" "];
  _displayableKey(v37->_proposedKey);
  v48 = v47 = v35;
  v49 = +[CPLDateFormatter stringFromDateAgo:v37->_lastDate now:v37->_now];
  v50 = (NSDate *)[v45 initWithFormat:@"%@ %@ [%@]", v46, v48, v49];

  v35 = v47;
  if (v50)
  {
LABEL_23:
    v75 = v50;
    ((void (**)(id, NSString *, id))v35)[2](v35, v37->_proposedKey, v50);
    goto LABEL_26;
  }
LABEL_25:
  v75 = 0;
LABEL_26:
  v51 = [v34 objectForKeyedSubscript:@"storages"];
  if (v51)
  {
    id v71 = v34;
    v72 = v37;
    v73 = v13;
    id v74 = v12;
    id v52 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    v53 = +[CPLEngineStore storageNames];
    uint64_t v54 = [v53 countByEnumeratingWithState:&v79 objects:v87 count:16];
    if (v54)
    {
      uint64_t v55 = v54;
      uint64_t v56 = *(void *)v80;
      do
      {
        for (uint64_t i = 0; i != v55; ++i)
        {
          if (*(void *)v80 != v56) {
            objc_enumerationMutation(v53);
          }
          uint64_t v58 = *(void *)(*((void *)&v79 + 1) + 8 * i);
          uint64_t v59 = [v51 objectForKeyedSubscript:v58];
          v60 = (void *)v59;
          if (v59) {
            [v52 appendFormat:@"\n%@: %@", v58, v59];
          }
        }
        uint64_t v55 = [v53 countByEnumeratingWithState:&v79 objects:v87 count:16];
      }
      while (v55);
    }

    ((void (**)(id, __CFString *, id))v35)[2](v35, @"storages", v52);
    objc_super v13 = v73;
    id v12 = v74;
    id v34 = v71;
    v37 = v72;
  }
}

void __146__CPLEngineScope_CPLEngineScopeStatusFormatter__formatStatusDictionary_forScopeWithIdentifier_appendString_appendTopLevelStatus_appendLineStatus___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  if (v3) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

+ (id)separatorForStatusKey:(id)a3
{
  if ([a3 isEqualToString:@"indexes"]) {
    id v3 = @"/";
  }
  else {
    id v3 = @", ";
  }
  return v3;
}

@end