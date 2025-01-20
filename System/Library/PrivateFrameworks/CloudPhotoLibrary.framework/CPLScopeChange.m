@interface CPLScopeChange
+ (BOOL)cplShouldIgnorePropertyForEquality:(id)a3;
+ (BOOL)scopeWithTypeHasQuota:(int64_t)a3;
+ (BOOL)shouldAutoActivateScopeWithType:(int64_t)a3;
+ (BOOL)supportsDirectMinglingForScopeWithType:(int64_t)a3;
+ (BOOL)supportsSecureCoding;
+ (BOOL)supportsStagingScopeForScopeWithType:(int64_t)a3;
+ (Class)scopeChangeClassForType:(int64_t)a3;
+ (id)descriptionForBusyState:(int64_t)a3;
+ (id)descriptionForScopeType:(int64_t)a3;
+ (id)mappingForScopeBusyStateDescription;
+ (id)mappingForScopeTypeDescription;
+ (id)newDeleteScopeChangeWithScopeIdentifier:(id)a3 type:(int64_t)a4;
+ (id)newScopeChangeInferClassWithScopeIdentifier:(id)a3 type:(int64_t)a4;
+ (id)newScopeChangeWithAutomaticScopeIdentifierForScopeType:(int64_t)a3;
+ (id)newScopeChangeWithScopeIdentifier:(id)a3 type:(int64_t)a4;
- (BOOL)containerHasBeenWiped;
- (BOOL)isActivated;
- (BOOL)isDisabled;
- (BOOL)isLibraryShare;
- (BOOL)isScopeChange;
- (BOOL)needsToSetScopeIdentifier;
- (BOOL)shouldAlwaysUpdateScopeInfoWhenPossible;
- (CPLAccountFlags)accountFlags;
- (CPLEngineScope)scope;
- (CPLLibraryInfo)libraryInfo;
- (CPLLibraryState)libraryState;
- (CPLScopeChange)initWithCoder:(id)a3;
- (CPLScopeChange)initWithScopeIdentifier:(id)a3 type:(int64_t)a4;
- (CPLShare)share;
- (NSDate)deleteDate;
- (NSDate)disabledDate;
- (NSString)stagingScopeIdentifier;
- (NSString)title;
- (id)_additionalDescription;
- (id)_scopedIdentifier;
- (id)assetCountPerType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)redactedDescription;
- (id)scopeIdentifier;
- (int64_t)busyState;
- (int64_t)defaultFlags;
- (int64_t)scopeType;
- (unint64_t)pullTaskItem;
- (void)_setChangeType:(unint64_t)a3;
- (void)setActivated:(BOOL)a3;
- (void)setBusyState:(int64_t)a3;
- (void)setLibraryInfo:(id)a3;
- (void)setLibraryState:(id)a3;
- (void)setPullTaskItem:(unint64_t)a3;
- (void)setScope:(id)a3;
- (void)setScopeType:(int64_t)a3;
- (void)setShare:(id)a3;
- (void)setStagingScopeIdentifier:(id)a3;
- (void)setTitle:(id)a3;
- (void)updateScopeFromScopeChange:(id)a3 direction:(unint64_t)a4 didHaveChanges:(BOOL *)a5;
- (void)updateScopeIdentifier:(id)a3;
@end

@implementation CPLScopeChange

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scope, 0);
  objc_storeStrong((id *)&self->_stagingScopeIdentifier, 0);
  objc_storeStrong((id *)&self->_libraryInfo, 0);
  objc_storeStrong((id *)&self->_libraryState, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_share, 0);
}

- (void)setScope:(id)a3
{
}

- (CPLEngineScope)scope
{
  return self->_scope;
}

- (void)setPullTaskItem:(unint64_t)a3
{
  self->_pullTaskItem = a3;
}

- (unint64_t)pullTaskItem
{
  return self->_pullTaskItem;
}

- (void)setStagingScopeIdentifier:(id)a3
{
}

- (NSString)stagingScopeIdentifier
{
  return self->_stagingScopeIdentifier;
}

- (void)setLibraryInfo:(id)a3
{
}

- (CPLLibraryInfo)libraryInfo
{
  return self->_libraryInfo;
}

- (void)setLibraryState:(id)a3
{
}

- (CPLLibraryState)libraryState
{
  return self->_libraryState;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setActivated:(BOOL)a3
{
  self->_activated = a3;
}

- (BOOL)isActivated
{
  return self->_activated;
}

- (void)setShare:(id)a3
{
}

- (CPLShare)share
{
  return self->_share;
}

- (BOOL)containerHasBeenWiped
{
  return self->_containerHasBeenWiped;
}

- (void)setBusyState:(int64_t)a3
{
  self->_busyState = a3;
}

- (int64_t)busyState
{
  return self->_busyState;
}

- (void)setScopeType:(int64_t)a3
{
  self->_scopeType = a3;
}

- (int64_t)scopeType
{
  return self->_scopeType;
}

- (BOOL)shouldAlwaysUpdateScopeInfoWhenPossible
{
  return 0;
}

- (void)updateScopeIdentifier:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(CPLScopeChange *)self _scopedIdentifier];
  if (v5)
  {
    v6 = [CPLScopedIdentifier alloc];
    v7 = [v5 scopeIdentifier];
    v8 = [(CPLScopedIdentifier *)v6 initWithScopeIdentifier:v7 identifier:v4];
    v11.receiver = self;
    v11.super_class = (Class)CPLScopeChange;
    [(CPLRecordChange *)&v11 setScopedIdentifier:v8];
  }
  if (!_CPLSilentLogging)
  {
    v9 = __CPLGenericOSLogDomain();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = [(CPLScopeChange *)self _scopedIdentifier];
      *(_DWORD *)buf = 138412546;
      v13 = v5;
      __int16 v14 = 2112;
      v15 = v10;
      _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_DEFAULT, "Updating %@ -> %@", buf, 0x16u);
    }
  }
}

- (BOOL)needsToSetScopeIdentifier
{
  v2 = [(CPLScopeChange *)self scopeIdentifier];
  char v3 = [v2 isEqualToString:@"auto"];

  return v3;
}

- (BOOL)isLibraryShare
{
  return ([(CPLScopeChange *)self scopeType] & 0xFFFFFFFFFFFFFFFELL) == 4;
}

- (BOOL)isScopeChange
{
  return 1;
}

- (void)updateScopeFromScopeChange:(id)a3 direction:(unint64_t)a4 didHaveChanges:(BOOL *)a5
{
  if (a4 == 1)
  {
    *a5 = 0;
  }
  else
  {
    *a5 = 1;
    [self cplCopyPropertiesFromObject:a3 withCopyBlock:0];
  }
}

- (int64_t)defaultFlags
{
  v2 = [(CPLScopeChange *)self share];
  char v3 = v2;
  if (v2)
  {
    id v4 = [v2 currentUserParticipant];
    v5 = v4;
    if (v4) {
      uint64_t v6 = [v4 permission];
    }
    else {
      uint64_t v6 = [v3 publicPermission];
    }
    int64_t v7 = v6 == 2;
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

- (id)redactedDescription
{
  char v3 = [(CPLScopeChange *)self share];
  id v4 = [NSString alloc];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [(CPLScopeChange *)self scopeIdentifier];
  if (([(CPLRecordChange *)self changeType] & 0x400) != 0) {
    int64_t v7 = " [D]";
  }
  else {
    int64_t v7 = "";
  }
  uint64_t v8 = objc_msgSend((id)objc_opt_class(), "descriptionForScopeType:", -[CPLScopeChange scopeType](self, "scopeType"));
  v9 = (void *)v8;
  if (v3) {
    uint64_t v10 = [v4 initWithFormat:@"<%@ %@%s (%@) - %@>", v5, v6, v7, v8, v3];
  }
  else {
    uint64_t v10 = [v4 initWithFormat:@"<%@ %@%s (%@)>", v5, v6, v7, v8, v13];
  }
  objc_super v11 = (void *)v10;

  return v11;
}

- (id)description
{
  char v3 = [(CPLScopeChange *)self share];
  if (v3)
  {
    stagingScopeIdentifier = self->_stagingScopeIdentifier;
    id v5 = [NSString alloc];
    uint64_t v6 = objc_opt_class();
    int64_t v7 = [(CPLScopeChange *)self scopeIdentifier];
    uint64_t v8 = "";
    if (([(CPLRecordChange *)self changeType] & 0x400) != 0) {
      v9 = " [D]";
    }
    else {
      v9 = "";
    }
    uint64_t v10 = objc_msgSend((id)objc_opt_class(), "descriptionForScopeType:", -[CPLScopeChange scopeType](self, "scopeType"));
    if (stagingScopeIdentifier)
    {
      objc_super v11 = self->_stagingScopeIdentifier;
      if (!self->_activated) {
        uint64_t v8 = " not-active";
      }
      v12 = [(CPLScopeChange *)self _additionalDescription];
      v27 = v8;
      v28 = v12;
      v24 = v3;
      v25 = v11;
      v22 = v9;
      v23 = v10;
      uint64_t v13 = @"<%@ %@%s (%@) - %@ (staged to %@)%s%@>";
    }
    else
    {
      if (self->_activated) {
        v19 = "";
      }
      else {
        v19 = " not-active";
      }
      v12 = [(CPLScopeChange *)self _additionalDescription];
      v25 = (void *)v19;
      v27 = (const char *)v12;
      v23 = v10;
      v24 = v3;
      v22 = v9;
      uint64_t v13 = @"<%@ %@%s (%@) - %@%s%@>";
    }
    uint64_t v18 = objc_msgSend(v5, "initWithFormat:", v13, v6, v7, v22, v23, v24, v25, v27, v28);
  }
  else
  {
    id v14 = [NSString alloc];
    uint64_t v15 = objc_opt_class();
    int64_t v7 = [(CPLScopeChange *)self scopeIdentifier];
    uint64_t v16 = "";
    if (([(CPLRecordChange *)self changeType] & 0x400) != 0) {
      v17 = " [D]";
    }
    else {
      v17 = "";
    }
    uint64_t v10 = objc_msgSend((id)objc_opt_class(), "descriptionForScopeType:", -[CPLScopeChange scopeType](self, "scopeType"));
    if (!self->_activated) {
      uint64_t v16 = " not-active";
    }
    v12 = [(CPLScopeChange *)self _additionalDescription];
    uint64_t v18 = [v14 initWithFormat:@"<%@ %@%s (%@)%s%@>", v15, v7, v17, v10, v16, v12, v26, v28];
  }
  v20 = (void *)v18;

  return v20;
}

- (id)_additionalDescription
{
  return &stru_1F0D5F858;
}

- (CPLAccountFlags)accountFlags
{
  return [(CPLLibraryInfo *)self->_libraryInfo accountFlags];
}

- (NSDate)deleteDate
{
  return [(CPLLibraryState *)self->_libraryState deleteDate];
}

- (NSDate)disabledDate
{
  return [(CPLLibraryState *)self->_libraryState disabledDate];
}

- (BOOL)isDisabled
{
  return [(CPLLibraryState *)self->_libraryState isDisabled];
}

- (id)assetCountPerType
{
  return [(CPLLibraryInfo *)self->_libraryInfo assetCounts];
}

- (id)scopeIdentifier
{
  v2 = [(CPLScopeChange *)self _scopedIdentifier];
  char v3 = [v2 identifier];

  return v3;
}

- (id)_scopedIdentifier
{
  v4.receiver = self;
  v4.super_class = (Class)CPLScopeChange;
  v2 = [(CPLRecordChange *)&v4 scopedIdentifier];
  return v2;
}

- (CPLScopeChange)initWithScopeIdentifier:(id)a3 type:(int64_t)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = objc_opt_class();
  if (v8 == objc_opt_class())
  {
    uint64_t v13 = +[CPLScopeChange scopeChangeClassForType:a4];
    if (v13 != (objc_class *)objc_opt_class())
    {
      v12 = (CPLScopeChange *)[[v13 alloc] initWithScopeIdentifier:v7 type:a4];
      goto LABEL_8;
    }
  }
  else if ((objc_msgSend((id)objc_opt_class(), "isSubclassOfClass:", +[CPLScopeChange scopeChangeClassForType:](CPLScopeChange, "scopeChangeClassForType:", a4)) & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v16 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = objc_opt_class();
        id v18 = v17;
        v19 = +[CPLScopeChange descriptionForScopeType:a4];
        *(_DWORD *)buf = 138412546;
        v27 = v17;
        __int16 v28 = 2112;
        v29 = v19;
        _os_log_impl(&dword_1B4CAC000, v16, OS_LOG_TYPE_ERROR, "Invalid class %@ for scope type %@", buf, 0x16u);
      }
    }
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    v21 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLScopeChange.m"];
    uint64_t v22 = objc_opt_class();
    v23 = +[CPLScopeChange descriptionForScopeType:a4];
    [v20 handleFailureInMethod:a2, self, v21, 203, @"Invalid class %@ for scope type %@", v22, v23 object file lineNumber description];

    abort();
  }
  v25.receiver = self;
  v25.super_class = (Class)CPLScopeChange;
  v9 = [(CPLScopeChange *)&v25 init];
  uint64_t v10 = v9;
  if (v9)
  {
    v9->_scopeType = a4;
    objc_super v11 = [[CPLScopedIdentifier alloc] initWithScopeIdentifier:@"__SCOPE__" identifier:v7];
    v24.receiver = v10;
    v24.super_class = (Class)CPLScopeChange;
    [(CPLRecordChange *)&v24 setScopedIdentifier:v11];
    v10->_activated = 1;
  }
  v12 = v10;
  self = v12;
LABEL_8:
  id v14 = v12;

  return v14;
}

- (void)_setChangeType:(unint64_t)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CPLScopeChange;
  [(CPLRecordChange *)&v3 setChangeType:a3];
}

+ (id)newScopeChangeWithAutomaticScopeIdentifierForScopeType:(int64_t)a3
{
  return (id)[a1 newScopeChangeWithScopeIdentifier:@"auto" type:a3];
}

+ (id)newDeleteScopeChangeWithScopeIdentifier:(id)a3 type:(int64_t)a4
{
  id v6 = a3;
  id v7 = (void *)[objc_alloc((Class)a1) initWithScopeIdentifier:v6 type:a4];

  [v7 _setChangeType:1024];
  return v7;
}

+ (id)newScopeChangeInferClassWithScopeIdentifier:(id)a3 type:(int64_t)a4
{
  id v6 = a3;
  id v7 = objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "scopeChangeClassForType:", a4)), "initWithScopeIdentifier:type:", v6, a4);

  return v7;
}

+ (id)newScopeChangeWithScopeIdentifier:(id)a3 type:(int64_t)a4
{
  id v6 = a3;
  id v7 = (void *)[objc_alloc((Class)a1) initWithScopeIdentifier:v6 type:a4];

  return v7;
}

+ (BOOL)supportsDirectMinglingForScopeWithType:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) != 4;
}

+ (BOOL)scopeWithTypeHasQuota:(int64_t)a3
{
  return ((unint64_t)a3 < 6) & (0x32u >> a3);
}

+ (BOOL)supportsStagingScopeForScopeWithType:(int64_t)a3
{
  return a3 == 5;
}

+ (BOOL)shouldAutoActivateScopeWithType:(int64_t)a3
{
  BOOL result = 0;
  if ((unint64_t)a3 > 6)
  {
    if (a3 != 0x7FFFFFFF)
    {
      uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
      v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLScopeChange.m"];
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, v9, 127, @"unknown scope type %ld", a3);

      abort();
    }
  }
  else if (((1 << a3) & 0x43) == 0)
  {
    if (((1 << a3) & 0xC) != 0)
    {
      return 1;
    }
    else if (overridesFeatureFlag == 1 && isFeatureEnabled == 0)
    {
      return 0;
    }
    else
    {
      if (CPLAllowsInactiveSharedLibraryScope_onceToken != -1) {
        dispatch_once(&CPLAllowsInactiveSharedLibraryScope_onceToken, &__block_literal_global_2_23628);
      }
      return CPLAllowsInactiveSharedLibraryScope_allowsInactiveSharedLibraryScope == 0;
    }
  }
  return result;
}

+ (Class)scopeChangeClassForType:(int64_t)a3
{
  switch(a3)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
      break;
    default:
      if (a3 != 0x7FFFFFFF)
      {
        id v6 = [MEMORY[0x1E4F28B00] currentHandler];
        id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLScopeChange.m"];
        objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, v7, 99, @"unknown scope type %ld", a3);

        abort();
      }
      return result;
  }
  uint64_t v8 = objc_opt_class();
  return (Class)v8;
}

+ (id)descriptionForBusyState:(int64_t)a3
{
  objc_super v4 = [a1 mappingForScopeBusyStateDescription];
  id v5 = [NSNumber numberWithInteger:a3];
  id v6 = [v4 objectForKeyedSubscript:v5];

  if (v6) {
    id v7 = v6;
  }
  else {
    id v7 = (id)objc_msgSend([NSString alloc], "initWithFormat:", @"Unknown busy state (%ld)", a3);
  }
  uint64_t v8 = v7;

  return v8;
}

+ (id)mappingForScopeBusyStateDescription
{
  if (mappingForScopeBusyStateDescription_onceToken != -1) {
    dispatch_once(&mappingForScopeBusyStateDescription_onceToken, &__block_literal_global_47);
  }
  v2 = (void *)mappingForScopeBusyStateDescription_mapping;
  return v2;
}

void __53__CPLScopeChange_mappingForScopeBusyStateDescription__block_invoke()
{
  v3[3] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1F0D910D0;
  v2[1] = &unk_1F0D910E8;
  v3[0] = @"none";
  v3[1] = @"busy";
  v2[2] = &unk_1F0D91100;
  v3[2] = @"snapshot";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:3];
  v1 = (void *)mappingForScopeBusyStateDescription_mapping;
  mappingForScopeBusyStateDescription_mapping = v0;
}

+ (id)descriptionForScopeType:(int64_t)a3
{
  objc_super v4 = [a1 mappingForScopeTypeDescription];
  id v5 = [NSNumber numberWithInteger:a3];
  id v6 = [v4 objectForKeyedSubscript:v5];

  if (v6) {
    id v7 = v6;
  }
  else {
    id v7 = (id)objc_msgSend([NSString alloc], "initWithFormat:", @"Unknown type (%ld)", a3);
  }
  uint64_t v8 = v7;

  return v8;
}

+ (id)mappingForScopeTypeDescription
{
  if (mappingForScopeTypeDescription_onceToken != -1) {
    dispatch_once(&mappingForScopeTypeDescription_onceToken, &__block_literal_global_3615);
  }
  v2 = (void *)mappingForScopeTypeDescription_mapping;
  return v2;
}

void __48__CPLScopeChange_mappingForScopeTypeDescription__block_invoke()
{
  v3[8] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1F0D910D0;
  v2[1] = &unk_1F0D910E8;
  v3[0] = @"unknown";
  v3[1] = @"library";
  v2[2] = &unk_1F0D91100;
  void v2[3] = &unk_1F0D91118;
  v3[2] = @"owned-moment-share";
  v3[3] = @"accepted-moment-share";
  v2[4] = &unk_1F0D91130;
  v2[5] = &unk_1F0D91148;
  void v3[4] = @"owned-library-share";
  v3[5] = @"accepted-library-share";
  v2[6] = &unk_1F0D91160;
  v2[7] = &unk_1F0D91178;
  v3[6] = @"staging";
  v3[7] = @"ignored";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:8];
  v1 = (void *)mappingForScopeTypeDescription_mapping;
  mappingForScopeTypeDescription_mapping = v0;
}

- (CPLScopeChange)initWithCoder:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class()
    || (id v7 = +[CPLScopeChange scopeChangeClassForType:](CPLScopeChange, "scopeChangeClassForType:", [v4 decodeIntegerForKey:@"scopeType"]), v7 == (objc_class *)v5))
  {
    v11.receiver = self;
    v11.super_class = (Class)CPLScopeChange;
    self = [(CPLRecordChange *)&v11 initWithCoder:v4];
    id v6 = self;
  }
  else
  {
    uint64_t v8 = v7;
    id v6 = (CPLScopeChange *)[[v7 alloc] initWithCoder:v4];
    if (!_CPLSilentLogging)
    {
      v9 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v13 = v6;
        __int16 v14 = 2112;
        uint64_t v15 = v8;
        _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_DEFAULT, "Automatically upgrading %@ to %@", buf, 0x16u);
      }
    }
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 cplCopyPropertiesFromObject:self withCopyBlock:0];
  return v4;
}

+ (BOOL)cplShouldIgnorePropertyForEquality:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:@"scope"] & 1) != 0
    || ([v4 isEqualToString:@"pullTaskItem"] & 1) != 0
    || ([v4 isEqualToString:@"recordModificationDate"] & 1) != 0)
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___CPLScopeChange;
    unsigned __int8 v5 = objc_msgSendSuper2(&v7, sel_cplShouldIgnorePropertyForEquality_, v4);
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end