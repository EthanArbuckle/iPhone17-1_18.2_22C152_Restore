@interface CPLLibraryShareScopeChange
+ (BOOL)serverSupportsLibraryShareSettingsRecordSyncing;
+ (BOOL)serverSupportsLibraryShareSettingsUserViewedParticipantTrashNotificationDateSyncing;
+ (id)cplAdditionalSecureClassesForProperty:(id)a3;
+ (id)descriptionForExitState:(int64_t)a3;
+ (id)descriptionForExitType:(int64_t)a3;
+ (id)mappingForExitState;
+ (id)mappingForExitType;
- (BOOL)areSomeUsersExiting;
- (BOOL)isCurrentUserExiting;
- (BOOL)isUserWithIdentifierExiting:(id)a3;
- (NSArray)exitingUserIdentifiers;
- (NSData)userDefinedRules;
- (NSDate)userViewedParticipantTrashNotificationDate;
- (id)_additionalDescription;
- (int64_t)exitRetentionPolicy;
- (int64_t)exitSource;
- (int64_t)exitState;
- (int64_t)exitType;
- (void)addExitingUserIdentifiers:(id)a3;
- (void)removePendingParticipantIDs:(id)a3;
- (void)setExitRetentionPolicy:(int64_t)a3;
- (void)setExitSource:(int64_t)a3;
- (void)setExitType:(int64_t)a3;
- (void)setExitingUserIdentifiers:(id)a3;
- (void)setUserDefinedRules:(id)a3;
- (void)setUserViewedParticipantTrashNotificationDate:(id)a3;
- (void)updateScopeFromScopeChange:(id)a3 direction:(unint64_t)a4 didHaveChanges:(BOOL *)a5;
@end

@implementation CPLLibraryShareScopeChange

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userViewedParticipantTrashNotificationDate, 0);
  objc_storeStrong((id *)&self->_userDefinedRules, 0);
  objc_storeStrong((id *)&self->_exitingUserIdentifiers, 0);
}

- (void)setUserViewedParticipantTrashNotificationDate:(id)a3
{
}

- (NSDate)userViewedParticipantTrashNotificationDate
{
  return self->_userViewedParticipantTrashNotificationDate;
}

- (void)setUserDefinedRules:(id)a3
{
}

- (NSData)userDefinedRules
{
  return self->_userDefinedRules;
}

- (void)setExitSource:(int64_t)a3
{
  self->_exitSource = a3;
}

- (int64_t)exitSource
{
  return self->_exitSource;
}

- (void)setExitRetentionPolicy:(int64_t)a3
{
  self->_exitRetentionPolicy = a3;
}

- (int64_t)exitRetentionPolicy
{
  return self->_exitRetentionPolicy;
}

- (void)setExitType:(int64_t)a3
{
  self->_exitType = a3;
}

- (int64_t)exitType
{
  return self->_exitType;
}

- (id)_additionalDescription
{
  if ([(CPLLibraryShareScopeChange *)self exitState])
  {
    id v3 = [NSString alloc];
    v4 = objc_msgSend((id)objc_opt_class(), "descriptionForExitState:", -[CPLLibraryShareScopeChange exitState](self, "exitState"));
    v5 = objc_msgSend((id)objc_opt_class(), "descriptionForExitType:", -[CPLLibraryShareScopeChange exitType](self, "exitType"));
    v6 = +[CPLLibraryManager descriptionForExitSource:[(CPLLibraryShareScopeChange *)self exitSource]];
    v7 = (void *)[v3 initWithFormat:@" - exitState: %@, exitType: %@, exitSource: %@", v4, v5, v6];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CPLLibraryShareScopeChange;
    v7 = [(CPLScopeChange *)&v9 _additionalDescription];
  }
  return v7;
}

- (void)updateScopeFromScopeChange:(id)a3 direction:(unint64_t)a4 didHaveChanges:(BOOL *)a5
{
  id v8 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CPLLibraryShareScopeChange;
  [(CPLScopeChange *)&v19 updateScopeFromScopeChange:v8 direction:a4 didHaveChanges:a5];
  if (a4 != 1) {
    goto LABEL_14;
  }
  uint64_t v9 = [v8 userDefinedRules];
  v10 = [(CPLLibraryShareScopeChange *)self userDefinedRules];
  unint64_t v11 = (unint64_t)v10;
  if (!v9 || !v10)
  {

    if (!(v9 | v11)) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  char v12 = [(id)v9 isEqual:v10];

  if ((v12 & 1) == 0)
  {
LABEL_7:
    v13 = [v8 userDefinedRules];
    [(CPLLibraryShareScopeChange *)self setUserDefinedRules:v13];

    *a5 = 1;
  }
LABEL_8:
  uint64_t v14 = [v8 userViewedParticipantTrashNotificationDate];
  v15 = [(CPLLibraryShareScopeChange *)self userViewedParticipantTrashNotificationDate];
  unint64_t v16 = (unint64_t)v15;
  if (v14 && v15)
  {
    char v17 = [(id)v14 isEqual:v15];

    if (v17) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }

  if (v14 | v16)
  {
LABEL_13:
    v18 = [v8 userViewedParticipantTrashNotificationDate];
    [(CPLLibraryShareScopeChange *)self setUserViewedParticipantTrashNotificationDate:v18];

    *a5 = 1;
  }
LABEL_14:
}

- (void)removePendingParticipantIDs:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    v5 = [(CPLScopeChange *)self share];
    v6 = [v5 participants];

    unint64_t v7 = [v4 count];
    if (v7 >= [v6 count]) {
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count") - objc_msgSend(v4, "count"));
    }
    uint64_t v9 = v8;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          unint64_t v16 = objc_msgSend(v15, "participantID", (void)v19);
          if (!v16 || ([v4 containsObject:v16] & 1) == 0) {
            [v9 addObject:v15];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v12);
    }

    char v17 = (void *)[v9 copy];
    v18 = [(CPLScopeChange *)self share];
    [v18 setParticipants:v17];
  }
}

- (void)addExitingUserIdentifiers:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v4, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v6 = [(CPLScopeChange *)self share];
    unint64_t v7 = [v6 participants];

    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = [*(id *)(*((void *)&v15 + 1) + 8 * v11) userIdentifier];
          if (v12 && [v4 containsObject:v12]) {
            [v5 addObject:v12];
          }

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }

    if ([(NSSet *)self->_exitingUserIdentifiers count])
    {
      uint64_t v13 = [(NSSet *)self->_exitingUserIdentifiers setByAddingObjectsFromSet:v5];
    }
    else
    {
      uint64_t v13 = (NSSet *)[v5 copy];
    }
    exitingUserIdentifiers = self->_exitingUserIdentifiers;
    self->_exitingUserIdentifiers = v13;
  }
}

- (int64_t)exitState
{
  id v3 = [(CPLScopeChange *)self stagingScopeIdentifier];

  if (v3) {
    return 2;
  }
  if (![(CPLLibraryShareScopeChange *)self isCurrentUserExiting]) {
    return 0;
  }
  if ([(CPLScopeChange *)self scopeType] != 4) {
    return 1;
  }
  v5 = [(CPLLibraryShareScopeChange *)self exitingUserIdentifiers];
  uint64_t v6 = [v5 count];

  if (v6 == 1) {
    return 2;
  }
  else {
    return 1;
  }
}

- (BOOL)areSomeUsersExiting
{
  return [(NSSet *)self->_exitingUserIdentifiers count] != 0;
}

- (BOOL)isUserWithIdentifierExiting:(id)a3
{
  return [(NSSet *)self->_exitingUserIdentifiers containsObject:a3];
}

- (BOOL)isCurrentUserExiting
{
  id v3 = [(CPLScopeChange *)self share];
  id v4 = [v3 currentUserParticipant];

  if (v4)
  {
    v5 = [v4 userIdentifier];
    if (v5)
    {
      uint64_t v6 = [v4 userIdentifier];
      BOOL v7 = [(CPLLibraryShareScopeChange *)self isUserWithIdentifierExiting:v6];
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)setExitingUserIdentifiers:(id)a3
{
  id v6 = a3;
  if ([v6 count])
  {
    id v4 = (NSSet *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v6];
    exitingUserIdentifiers = self->_exitingUserIdentifiers;
    self->_exitingUserIdentifiers = v4;
  }
  else
  {
    exitingUserIdentifiers = self->_exitingUserIdentifiers;
    self->_exitingUserIdentifiers = 0;
  }
}

- (NSArray)exitingUserIdentifiers
{
  if ([(NSSet *)self->_exitingUserIdentifiers count])
  {
    id v3 = [(NSSet *)self->_exitingUserIdentifiers allObjects];
    id v4 = [v3 sortedArrayUsingSelector:sel_compare_];
  }
  else
  {
    id v4 = 0;
  }
  return (NSArray *)v4;
}

+ (id)descriptionForExitType:(int64_t)a3
{
  id v4 = [a1 mappingForExitType];
  v5 = [NSNumber numberWithInteger:a3];
  id v6 = [v4 objectForKeyedSubscript:v5];

  if (v6) {
    id v7 = v6;
  }
  else {
    id v7 = (id)objc_msgSend([NSString alloc], "initWithFormat:", @"Unknown exit type (%ld)", a3);
  }
  uint64_t v8 = v7;

  return v8;
}

+ (id)mappingForExitType
{
  if (mappingForExitType_onceToken != -1) {
    dispatch_once(&mappingForExitType_onceToken, &__block_literal_global_329_3589);
  }
  v2 = (void *)mappingForExitType_mapping;
  return v2;
}

void __48__CPLLibraryShareScopeChange_mappingForExitType__block_invoke()
{
  v3[4] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1F0D910D0;
  v2[1] = &unk_1F0D91118;
  v3[0] = @"unknown";
  v3[1] = @"owner-dismantle";
  v2[2] = &unk_1F0D91100;
  v2[3] = &unk_1F0D910E8;
  v3[2] = @"removed";
  v3[3] = @"self-exit";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:4];
  v1 = (void *)mappingForExitType_mapping;
  mappingForExitType_mapping = v0;
}

+ (id)descriptionForExitState:(int64_t)a3
{
  id v4 = [a1 mappingForExitState];
  v5 = [NSNumber numberWithInteger:a3];
  id v6 = [v4 objectForKeyedSubscript:v5];

  if (v6) {
    id v7 = v6;
  }
  else {
    id v7 = (id)objc_msgSend([NSString alloc], "initWithFormat:", @"Unknown exit state (%ld)", a3);
  }
  uint64_t v8 = v7;

  return v8;
}

+ (id)mappingForExitState
{
  if (mappingForExitState_onceToken != -1) {
    dispatch_once(&mappingForExitState_onceToken, &__block_literal_global_318);
  }
  v2 = (void *)mappingForExitState_mapping;
  return v2;
}

void __49__CPLLibraryShareScopeChange_mappingForExitState__block_invoke()
{
  v3[3] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1F0D910D0;
  v2[1] = &unk_1F0D910E8;
  v3[0] = @"none";
  v3[1] = @"preparing";
  v2[2] = &unk_1F0D91100;
  v3[2] = @"exiting";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:3];
  v1 = (void *)mappingForExitState_mapping;
  mappingForExitState_mapping = v0;
}

+ (BOOL)serverSupportsLibraryShareSettingsUserViewedParticipantTrashNotificationDateSyncing
{
  return 1;
}

+ (BOOL)serverSupportsLibraryShareSettingsRecordSyncing
{
  return 1;
}

+ (id)cplAdditionalSecureClassesForProperty:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"exitingUserIdentifiers"])
  {
    if (cplAdditionalSecureClassesForProperty__onceToken_152 != -1) {
      dispatch_once(&cplAdditionalSecureClassesForProperty__onceToken_152, &__block_literal_global_154);
    }
    id v5 = (id)cplAdditionalSecureClassesForProperty__classes;
  }
  else
  {
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___CPLLibraryShareScopeChange;
    objc_msgSendSuper2(&v8, sel_cplAdditionalSecureClassesForProperty_, v4);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v6 = v5;

  return v6;
}

uint64_t __81__CPLLibraryShareScopeChange_CPLNSCoding__cplAdditionalSecureClassesForProperty___block_invoke()
{
  uint64_t v0 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  uint64_t v1 = cplAdditionalSecureClassesForProperty__classes;
  cplAdditionalSecureClassesForProperty__classes = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end