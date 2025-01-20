@interface CRKFeatureDataStore_MCX
- (BOOL)isClassroomAutomaticClassJoiningForced;
- (BOOL)isClassroomInstructorRoleEnabled;
- (BOOL)isClassroomRequestPermissionToLeaveClassesForced;
- (BOOL)isClassroomStudentRoleEnabled;
- (BOOL)isClassroomUnpromptedScreenObservationForced;
- (BOOL)isFeatureForced:(id)a3;
- (BOOL)isRoleEnabled:(id)a3;
- (CRKFeatureDataStoreHeuristics_MCX)heuristicsManager;
- (CRKFeatureDataStore_MCX)initWithMCXPrimitives:(id)a3;
- (CRKMCXPrimitives)MCXPrimitives;
- (NSSet)activeClassroomRoles;
- (id)keyForFeature:(id)a3 configurationUUID:(id)a4 ask:(BOOL)a5;
- (unint64_t)BOOLRestrictionForFeature:(id)a3;
- (unint64_t)effectiveBoolValueForSetting:(id)a3 outAsk:(BOOL *)a4;
- (unint64_t)effectiveValueForSetting:(id)a3 configurationUUID:(id)a4 outAsk:(BOOL *)a5;
- (void)addActiveClassroomRole:(id)a3;
- (void)removeActiveClassroomRole:(id)a3;
- (void)removeDuplicateEntriesFromStoredClassroomRoles;
- (void)setActiveClassroomRoles:(id)a3;
- (void)setBoolValue:(BOOL)a3 ask:(BOOL)a4 forSetting:(id)a5;
- (void)setBoolValue:(BOOL)a3 ask:(BOOL)a4 forSetting:(id)a5 configurationUUID:(id)a6;
- (void)setClassroomInstructorRoleEnabled:(BOOL)a3;
- (void)setClassroomStudentRoleEnabled:(BOOL)a3;
- (void)setHeuristicsManager:(id)a3;
- (void)setRole:(id)a3 enabled:(BOOL)a4;
@end

@implementation CRKFeatureDataStore_MCX

- (CRKFeatureDataStore_MCX)initWithMCXPrimitives:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRKFeatureDataStore_MCX;
  v6 = [(CRKFeatureDataStore_MCX *)&v10 init];
  if (v6)
  {
    v7 = [[CRKFeatureDataStoreHeuristics_MCX alloc] initWithDataStore:v6];
    heuristicsManager = v6->_heuristicsManager;
    v6->_heuristicsManager = v7;

    objc_storeStrong((id *)&v6->_MCXPrimitives, a3);
    [(CRKFeatureDataStore_MCX *)v6 removeDuplicateEntriesFromStoredClassroomRoles];
  }

  return v6;
}

- (unint64_t)effectiveBoolValueForSetting:(id)a3 outAsk:(BOOL *)a4
{
  return [(CRKFeatureDataStore_MCX *)self effectiveValueForSetting:a3 configurationUUID:0 outAsk:a4];
}

- (void)setBoolValue:(BOOL)a3 ask:(BOOL)a4 forSetting:(id)a5
{
}

- (unint64_t)BOOLRestrictionForFeature:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CRKFeatureDataStore_MCX *)self isFeatureForced:v4];
  v6 = [(CRKFeatureDataStore_MCX *)self heuristicsManager];
  LODWORD(v5) = [v6 applyIsForcedHeuristicsToFeature:v4 isForced:v5];

  if (v5) {
    unint64_t v7 = [(CRKFeatureDataStore_MCX *)self effectiveValueForSetting:v4 configurationUUID:0 outAsk:0];
  }
  else {
    unint64_t v7 = 0;
  }

  return v7;
}

- (unint64_t)effectiveValueForSetting:(id)a3 configurationUUID:(id)a4 outAsk:(BOOL *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (a5)
  {
    objc_super v10 = [(CRKFeatureDataStore_MCX *)self keyForFeature:v8 configurationUUID:v9 ask:1];
    v11 = [(CRKFeatureDataStore_MCX *)self MCXPrimitives];
    v12 = [v11 numberForKey:v10];

    uint64_t v13 = objc_msgSend(NSNumber, "crk_featureBoolTypeFromNumber:", v12);
    if (v13) {
      BOOL v14 = v13 == 1;
    }
    else {
      BOOL v14 = +[CRKFeatureDataStoreDefaults_MCX defaultAskValueForFeature:v8];
    }
    *a5 = v14;
  }
  v15 = [(CRKFeatureDataStore_MCX *)self keyForFeature:v8 configurationUUID:v9 ask:0];
  v16 = [(CRKFeatureDataStore_MCX *)self MCXPrimitives];
  v17 = [v16 numberForKey:v15];

  uint64_t v18 = objc_msgSend(NSNumber, "crk_featureBoolTypeFromNumber:", v17);
  if (!v18) {
    uint64_t v18 = +[CRKFeatureDataStoreDefaults_MCX defaultValueForFeature:v8];
  }
  v19 = [(CRKFeatureDataStore_MCX *)self heuristicsManager];
  unint64_t v20 = [v19 applyHeuristicsToFeature:v8 BOOLType:v18];

  return v20;
}

- (void)setBoolValue:(BOOL)a3 ask:(BOOL)a4 forSetting:(id)a5 configurationUUID:(id)a6
{
  BOOL v7 = a4;
  BOOL v8 = a3;
  id v10 = a6;
  id v11 = a5;
  id v17 = [(CRKFeatureDataStore_MCX *)self keyForFeature:v11 configurationUUID:v10 ask:0];
  v12 = [(CRKFeatureDataStore_MCX *)self MCXPrimitives];
  uint64_t v13 = [NSNumber numberWithBool:v8];
  [v12 setNumber:v13 forKey:v17];

  BOOL v14 = [(CRKFeatureDataStore_MCX *)self keyForFeature:v11 configurationUUID:v10 ask:1];

  v15 = [(CRKFeatureDataStore_MCX *)self MCXPrimitives];
  v16 = [NSNumber numberWithBool:v7];
  [v15 setNumber:v16 forKey:v14];
}

- (BOOL)isClassroomUnpromptedScreenObservationForced
{
  v3 = +[CRKRestrictions classroomUnpromptedScreenObservationForced];
  LOBYTE(self) = [(CRKFeatureDataStore_MCX *)self BOOLRestrictionForFeature:v3] == 1;

  return (char)self;
}

- (BOOL)isClassroomAutomaticClassJoiningForced
{
  v3 = +[CRKRestrictions classroomAutomaticallyJoinClassesForced];
  LOBYTE(self) = [(CRKFeatureDataStore_MCX *)self BOOLRestrictionForFeature:v3] == 1;

  return (char)self;
}

- (BOOL)isClassroomRequestPermissionToLeaveClassesForced
{
  v3 = +[CRKRestrictions classroomRequestPermissionToLeaveClassesForced];
  LOBYTE(self) = [(CRKFeatureDataStore_MCX *)self BOOLRestrictionForFeature:v3] == 1;

  return (char)self;
}

- (BOOL)isClassroomStudentRoleEnabled
{
  return [(CRKFeatureDataStore_MCX *)self isRoleEnabled:@"student"];
}

- (void)setClassroomStudentRoleEnabled:(BOOL)a3
{
}

- (BOOL)isClassroomInstructorRoleEnabled
{
  return [(CRKFeatureDataStore_MCX *)self isRoleEnabled:@"instructor"];
}

- (void)setClassroomInstructorRoleEnabled:(BOOL)a3
{
}

- (NSSet)activeClassroomRoles
{
  v2 = [(CRKFeatureDataStore_MCX *)self MCXPrimitives];
  v3 = +[CRKRestrictions classroomRoles];
  uint64_t v4 = [v2 arrayForKey:v3];
  uint64_t v5 = (void *)v4;
  v6 = (void *)MEMORY[0x263EFFA68];
  if (v4) {
    v6 = (void *)v4;
  }
  id v7 = v6;

  BOOL v8 = [MEMORY[0x263EFFA08] setWithArray:v7];

  return (NSSet *)v8;
}

- (BOOL)isFeatureForced:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CRKFeatureDataStore_MCX *)self MCXPrimitives];
  char v6 = [v5 isKeyUserModifiable:v4];

  return v6 ^ 1;
}

- (void)setActiveClassroomRoles:(id)a3
{
  id v7 = a3;
  if ([v7 count])
  {
    id v4 = [v7 allObjects];
  }
  else
  {
    id v4 = 0;
  }
  uint64_t v5 = [(CRKFeatureDataStore_MCX *)self MCXPrimitives];
  char v6 = +[CRKRestrictions classroomRoles];
  [v5 setArray:v4 forKey:v6];
}

- (void)addActiveClassroomRole:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CRKFeatureDataStore_MCX *)self activeClassroomRoles];
  id v6 = (id)[v5 mutableCopy];

  [v6 addObject:v4];
  [(CRKFeatureDataStore_MCX *)self setActiveClassroomRoles:v6];
}

- (void)removeActiveClassroomRole:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CRKFeatureDataStore_MCX *)self activeClassroomRoles];
  id v6 = (id)[v5 mutableCopy];

  [v6 removeObject:v4];
  [(CRKFeatureDataStore_MCX *)self setActiveClassroomRoles:v6];
}

- (BOOL)isRoleEnabled:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CRKFeatureDataStore_MCX *)self activeClassroomRoles];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (void)setRole:(id)a3 enabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  char v6 = [(CRKFeatureDataStore_MCX *)self activeClassroomRoles];
  char v7 = [v6 containsObject:v8];
  if (v4)
  {
    if (v7) {
      goto LABEL_7;
    }
    [(CRKFeatureDataStore_MCX *)self addActiveClassroomRole:v8];
  }
  else
  {
    if ((v7 & 1) == 0) {
      goto LABEL_7;
    }
    [(CRKFeatureDataStore_MCX *)self removeActiveClassroomRole:v8];
  }
  notify_post((const char *)[@"CRKStudentEnrollmentStatusDidChangeNotification" UTF8String]);
LABEL_7:
}

- (id)keyForFeature:(id)a3 configurationUUID:(id)a4 ask:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_opt_new();
  [v9 appendString:v8];

  if ([v7 length])
  {
    id v10 = [NSString stringWithFormat:@"%@%@", @"-", v7];
    [v9 appendString:v10];
  }
  if (v5)
  {
    id v11 = [NSString stringWithFormat:@"%@ask", @"-"];
    [v9 appendString:v11];
  }

  return v9;
}

- (void)removeDuplicateEntriesFromStoredClassroomRoles
{
  id v3 = [(CRKFeatureDataStore_MCX *)self activeClassroomRoles];
  [(CRKFeatureDataStore_MCX *)self setActiveClassroomRoles:v3];
}

- (CRKMCXPrimitives)MCXPrimitives
{
  return self->_MCXPrimitives;
}

- (CRKFeatureDataStoreHeuristics_MCX)heuristicsManager
{
  return self->_heuristicsManager;
}

- (void)setHeuristicsManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heuristicsManager, 0);

  objc_storeStrong((id *)&self->_MCXPrimitives, 0);
}

@end