@interface HDReadAuthorizationStatus
+ (id)notDerminedReadAuthorizationStatus;
+ (id)unrestrictedReadAuthorizationStatus;
- (BOOL)canRead;
- (BOOL)canWrite;
- (BOOL)isAuthorizationDetermined;
- (BOOL)isEqual:(id)a3;
- (HDReadAuthorizationStatus)initWithReadAuthorizationStatus:(int64_t)a3 authorizationRequest:(int64_t)a4 authorizationMode:(int64_t)a5 restrictedBundleIdentifier:(id)a6 restrictedSourceEntities:(id)a7 deletedObjectBaselineAnchor:(id)a8 objectLimitAnchor:(id)a9 objectLimitModifiedDate:(id)a10;
- (HDSQLitePredicate)authorizationPredicate;
- (NSDate)objectLimitModifiedDate;
- (NSNumber)deletedObjectBaselineAnchor;
- (NSNumber)objectLimitAnchor;
- (NSSet)restrictedSourceEntities;
- (NSString)restrictedBundleIdentifier;
- (_HKAuthorizationRecord)authorizationRecord;
- (id)description;
- (int64_t)authorizationMode;
- (int64_t)authorizationRequest;
- (int64_t)authorizationStatus;
- (unint64_t)hash;
- (void)disableReading;
- (void)disableSharing;
@end

@implementation HDReadAuthorizationStatus

- (NSSet)restrictedSourceEntities
{
  return self->_restrictedSourceEntities;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectLimitAnchor, 0);
  objc_storeStrong((id *)&self->_deletedObjectBaselineAnchor, 0);
  objc_storeStrong((id *)&self->_restrictedBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_restrictedSourceEntities, 0);

  objc_storeStrong((id *)&self->_authorizationRecord, 0);
}

- (HDReadAuthorizationStatus)initWithReadAuthorizationStatus:(int64_t)a3 authorizationRequest:(int64_t)a4 authorizationMode:(int64_t)a5 restrictedBundleIdentifier:(id)a6 restrictedSourceEntities:(id)a7 deletedObjectBaselineAnchor:(id)a8 objectLimitAnchor:(id)a9 objectLimitModifiedDate:(id)a10
{
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  if (a5 == 1 && !v20)
  {
    v34 = [MEMORY[0x1E4F28B00] currentHandler];
    [v34 handleFailureInMethod:a2, self, @"HDReadAuthorizationStatus.m", 34, @"Invalid parameter not satisfying: %@", @"objectLimitAnchor != nil" object file lineNumber description];
  }
  v35.receiver = self;
  v35.super_class = (Class)HDReadAuthorizationStatus;
  v22 = [(HDReadAuthorizationStatus *)&v35 init];
  if (v22)
  {
    uint64_t v23 = [MEMORY[0x1E4F2B858] recordWithStatus:a3 request:a4 mode:a5 anchorLimitModifiedDate:v21];
    authorizationRecord = v22->_authorizationRecord;
    v22->_authorizationRecord = (_HKAuthorizationRecord *)v23;

    uint64_t v25 = [v17 copy];
    restrictedBundleIdentifier = v22->_restrictedBundleIdentifier;
    v22->_restrictedBundleIdentifier = (NSString *)v25;

    uint64_t v27 = [v18 copy];
    restrictedSourceEntities = v22->_restrictedSourceEntities;
    v22->_restrictedSourceEntities = (NSSet *)v27;

    uint64_t v29 = [v19 copy];
    deletedObjectBaselineAnchor = v22->_deletedObjectBaselineAnchor;
    v22->_deletedObjectBaselineAnchor = (NSNumber *)v29;

    uint64_t v31 = [v20 copy];
    objectLimitAnchor = v22->_objectLimitAnchor;
    v22->_objectLimitAnchor = (NSNumber *)v31;
  }
  return v22;
}

+ (id)unrestrictedReadAuthorizationStatus
{
  v2 = (void *)[objc_alloc((Class)a1) initWithReadAuthorizationStatus:101 authorizationRequest:203 authorizationMode:0 restrictedBundleIdentifier:0 restrictedSourceEntities:0 deletedObjectBaselineAnchor:&unk_1F17EEB38 objectLimitAnchor:0 objectLimitModifiedDate:0];

  return v2;
}

+ (id)notDerminedReadAuthorizationStatus
{
  id v2 = objc_alloc((Class)a1);
  v3 = [MEMORY[0x1E4F1CAD0] set];
  v4 = (void *)[v2 initWithReadAuthorizationStatus:100 authorizationRequest:200 authorizationMode:0 restrictedBundleIdentifier:&stru_1F1728D60 restrictedSourceEntities:v3 deletedObjectBaselineAnchor:&unk_1F17EEB38 objectLimitAnchor:0 objectLimitModifiedDate:0];

  return v4;
}

- (int64_t)authorizationStatus
{
  return [(_HKAuthorizationRecord *)self->_authorizationRecord status];
}

- (int64_t)authorizationRequest
{
  return [(_HKAuthorizationRecord *)self->_authorizationRecord request];
}

- (int64_t)authorizationMode
{
  return [(_HKAuthorizationRecord *)self->_authorizationRecord mode];
}

- (NSDate)objectLimitModifiedDate
{
  return (NSDate *)[(_HKAuthorizationRecord *)self->_authorizationRecord anchorLimitModifiedDate];
}

- (BOOL)canRead
{
  int64_t v2 = [(HDReadAuthorizationStatus *)self authorizationStatus];
  return ((unint64_t)(v2 - 100) < 5) & (0xEu >> (v2 - 100));
}

- (BOOL)canWrite
{
  int64_t v2 = [(HDReadAuthorizationStatus *)self authorizationStatus];
  return ((unint64_t)(v2 - 100) < 5) & (6u >> (v2 - 100));
}

- (void)disableReading
{
  v3 = [(_HKAuthorizationRecord *)self->_authorizationRecord recordWithReadingDisabled];
  authorizationRecord = self->_authorizationRecord;
  self->_authorizationRecord = v3;
}

- (void)disableSharing
{
  v3 = [(_HKAuthorizationRecord *)self->_authorizationRecord recordWithSharingDisabled];
  authorizationRecord = self->_authorizationRecord;
  self->_authorizationRecord = v3;
}

- (BOOL)isAuthorizationDetermined
{
  return [(HDReadAuthorizationStatus *)self authorizationStatus] != 100;
}

- (HDSQLitePredicate)authorizationPredicate
{
  if ([(HDReadAuthorizationStatus *)self canRead])
  {
    if ([(HDReadAuthorizationStatus *)self authorizationMode] == 1) {
      [MEMORY[0x1E4F65D00] predicateWithProperty:@"data_id" lessThanOrEqualToValue:self->_objectLimitAnchor];
    }
    else {
    v3 = [MEMORY[0x1E4F65D58] truePredicate];
    }
  }
  else
  {
    v3 = [MEMORY[0x1E4F65D58] falsePredicate];
  }

  return (HDSQLitePredicate *)v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HDReadAuthorizationStatus *)a3;
  if (v4 == self)
  {
    char v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      if (![(_HKAuthorizationRecord *)self->_authorizationRecord isEqual:v5->_authorizationRecord])goto LABEL_18; {
      restrictedBundleIdentifier = self->_restrictedBundleIdentifier;
      }
      v7 = v5->_restrictedBundleIdentifier;
      if (restrictedBundleIdentifier != v7
        && (!v7 || !-[NSString isEqualToString:](restrictedBundleIdentifier, "isEqualToString:")))
      {
        goto LABEL_18;
      }
      restrictedSourceEntities = self->_restrictedSourceEntities;
      v9 = v5->_restrictedSourceEntities;
      if (restrictedSourceEntities != v9 && (!v9 || !-[NSSet isEqualToSet:](restrictedSourceEntities, "isEqualToSet:"))) {
        goto LABEL_18;
      }
      deletedObjectBaselineAnchor = self->_deletedObjectBaselineAnchor;
      v11 = v5->_deletedObjectBaselineAnchor;
      if (deletedObjectBaselineAnchor != v11
        && (!v11 || !-[NSNumber isEqual:](deletedObjectBaselineAnchor, "isEqual:")))
      {
        goto LABEL_18;
      }
      objectLimitAnchor = self->_objectLimitAnchor;
      v13 = v5->_objectLimitAnchor;
      if (objectLimitAnchor == v13)
      {
        char v14 = 1;
        goto LABEL_19;
      }
      if (v13) {
        char v14 = -[NSNumber isEqual:](objectLimitAnchor, "isEqual:");
      }
      else {
LABEL_18:
      }
        char v14 = 0;
LABEL_19:

      goto LABEL_20;
    }
    char v14 = 0;
  }
LABEL_20:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v3 = [(_HKAuthorizationRecord *)self->_authorizationRecord hash];
  return [(NSString *)self->_restrictedBundleIdentifier hash] ^ v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  [(HDReadAuthorizationStatus *)self authorizationStatus];
  uint64_t v20 = HKAuthorizationStatusToString();
  [(HDReadAuthorizationStatus *)self authorizationMode];
  v5 = HKSelectedAuthorizationModeToString();
  deletedObjectBaselineAnchor = self->_deletedObjectBaselineAnchor;
  objectLimitAnchor = self->_objectLimitAnchor;
  if (objectLimitAnchor)
  {
    v8 = [NSString stringWithFormat:@" object-limit:%@", self->_objectLimitAnchor];
  }
  else
  {
    v8 = &stru_1F1728D60;
  }
  restrictedSourceEntities = self->_restrictedSourceEntities;
  if (restrictedSourceEntities)
  {
    v10 = NSString;
    restrictedBundleIdentifier = self->_restrictedBundleIdentifier;
    v12 = [(NSSet *)restrictedSourceEntities allObjects];
    v13 = [v12 componentsJoinedByString:@", "];
    char v14 = [v10 stringWithFormat:@" RESTRICTED to %@ (%@)", restrictedBundleIdentifier, v13];
    id v18 = deletedObjectBaselineAnchor;
    v15 = (void *)v20;
    v16 = [v3 stringWithFormat:@"<%@: %@ %@ deleted-object-baseline:%@%@%@>", v4, v20, v5, v18, v8, v14];

    if (!objectLimitAnchor) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  id v19 = deletedObjectBaselineAnchor;
  v15 = (void *)v20;
  v16 = [v3 stringWithFormat:@"<%@: %@ %@ deleted-object-baseline:%@%@%@>", v4, v20, v5, v19, v8, &stru_1F1728D60];
  if (objectLimitAnchor) {
LABEL_6:
  }

LABEL_7:

  return v16;
}

- (_HKAuthorizationRecord)authorizationRecord
{
  return self->_authorizationRecord;
}

- (NSString)restrictedBundleIdentifier
{
  return self->_restrictedBundleIdentifier;
}

- (NSNumber)deletedObjectBaselineAnchor
{
  return self->_deletedObjectBaselineAnchor;
}

- (NSNumber)objectLimitAnchor
{
  return self->_objectLimitAnchor;
}

@end