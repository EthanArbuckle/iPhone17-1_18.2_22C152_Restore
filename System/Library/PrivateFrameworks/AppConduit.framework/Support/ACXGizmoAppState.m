@interface ACXGizmoAppState
+ (BOOL)supportsSecureCoding;
- (ACXGizmoAppState)initWithCoder:(id)a3;
- (ACXGizmoAppState)initWithWatchBundleID:(id)a3 companionBundleID:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)companionAppBundleID;
- (NSString)uniqueInstallID;
- (NSString)watchAppBundleID;
- (NSString)watchKitAppExecutableHash;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)installStatus;
- (void)encodeWithCoder:(id)a3;
- (void)regenerateUniqueInstallID;
- (void)setCompanionAppBundleID:(id)a3;
- (void)setInstallStatus:(unint64_t)a3;
- (void)setWatchKitAppExecutableHash:(id)a3;
@end

@implementation ACXGizmoAppState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ACXGizmoAppState)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ACXGizmoAppState;
  v5 = [(ACXGizmoAppState *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"watchAppBundleID"];
    watchAppBundleID = v5->_watchAppBundleID;
    v5->_watchAppBundleID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"companionAppBundleID"];
    companionAppBundleID = v5->_companionAppBundleID;
    v5->_companionAppBundleID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uniqueInstallID"];
    uniqueInstallID = v5->_uniqueInstallID;
    v5->_uniqueInstallID = (NSString *)v10;

    v5->_installStatus = (unint64_t)[v4 decodeIntegerForKey:@"installStatus"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"watchKitAppExecutableHash"];
    watchKitAppExecutableHash = v5->_watchKitAppExecutableHash;
    v5->_watchKitAppExecutableHash = (NSString *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v11 = a3;
  id v4 = [(ACXGizmoAppState *)self watchAppBundleID];
  [v11 encodeObject:v4 forKey:@"watchAppBundleID"];

  v5 = [(ACXGizmoAppState *)self companionAppBundleID];

  if (v5)
  {
    uint64_t v6 = [(ACXGizmoAppState *)self companionAppBundleID];
    [v11 encodeObject:v6 forKey:@"companionAppBundleID"];
  }
  v7 = [(ACXGizmoAppState *)self uniqueInstallID];

  if (v7)
  {
    uint64_t v8 = [(ACXGizmoAppState *)self uniqueInstallID];
    [v11 encodeObject:v8 forKey:@"uniqueInstallID"];
  }
  v9 = [(ACXGizmoAppState *)self watchKitAppExecutableHash];

  if (v9)
  {
    uint64_t v10 = [(ACXGizmoAppState *)self watchKitAppExecutableHash];
    [v11 encodeObject:v10 forKey:@"watchKitAppExecutableHash"];
  }
  objc_msgSend(v11, "encodeInteger:forKey:", -[ACXGizmoAppState installStatus](self, "installStatus"), @"installStatus");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  v5 = [(ACXGizmoAppState *)self watchAppBundleID];
  uint64_t v6 = [(ACXGizmoAppState *)self companionAppBundleID];
  v7 = [v4 initWithWatchBundleID:v5 companionBundleID:v6];

  v7[3] = [(ACXGizmoAppState *)self installStatus];
  uint64_t v8 = [(ACXGizmoAppState *)self uniqueInstallID];
  v9 = (void *)v7[4];
  v7[4] = v8;

  uint64_t v10 = [(ACXGizmoAppState *)self watchKitAppExecutableHash];
  id v11 = (void *)v7[5];
  v7[5] = v10;

  return v7;
}

- (ACXGizmoAppState)initWithWatchBundleID:(id)a3 companionBundleID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ACXGizmoAppState;
  v9 = [(ACXGizmoAppState *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_watchAppBundleID, a3);
    objc_storeStrong((id *)&v10->_companionAppBundleID, a4);
    v10->_installStatus = 0;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ACXGizmoAppState *)a3;
  if (self == v4)
  {
    BOOL v21 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      id v6 = [(ACXGizmoAppState *)self installStatus];
      if (v6 == (id)[(ACXGizmoAppState *)v5 installStatus])
      {
        id v7 = [(ACXGizmoAppState *)self watchAppBundleID];
        id v8 = [(ACXGizmoAppState *)v5 watchAppBundleID];
        id v9 = v7;
        id v10 = v8;
        id v11 = v10;
        if ((v9 != 0) != (v10 != 0) || v9 && v10 && ![v9 isEqual:v10]) {
          goto LABEL_24;
        }

        objc_super v12 = [(ACXGizmoAppState *)self companionAppBundleID];
        v13 = [(ACXGizmoAppState *)v5 companionAppBundleID];
        id v9 = v12;
        id v14 = v13;
        id v11 = v14;
        if ((v9 != 0) != (v14 != 0) || v9 && v14 && ![v9 isEqual:v14]) {
          goto LABEL_24;
        }

        objc_super v15 = [(ACXGizmoAppState *)self uniqueInstallID];
        v16 = [(ACXGizmoAppState *)v5 uniqueInstallID];
        id v9 = v15;
        id v17 = v16;
        id v11 = v17;
        if ((v9 != 0) != (v17 != 0) || v9 && v17 && ![v9 isEqual:v17]) {
          goto LABEL_24;
        }

        v18 = [(ACXGizmoAppState *)self watchKitAppExecutableHash];
        v19 = [(ACXGizmoAppState *)v5 watchKitAppExecutableHash];
        id v9 = v18;
        id v20 = v19;
        id v11 = v20;
        if ((v9 != 0) != (v20 != 0) || v9 && v20 && ![v9 isEqual:v20]) {
LABEL_24:
        }
          BOOL v21 = 0;
        else {
          BOOL v21 = 1;
        }
      }
      else
      {
        BOOL v21 = 0;
      }
    }
    else
    {
      BOOL v21 = 0;
    }
  }

  return v21;
}

- (void)setInstallStatus:(unint64_t)a3
{
  unint64_t installStatus = self->_installStatus;
  if (installStatus != a3)
  {
    if (a3 - 1 > 1 || installStatus - 3 > 0xFFFFFFFFFFFFFFFDLL)
    {
      if (a3 != 5) {
        goto LABEL_14;
      }
      uniqueInstallID = self->_uniqueInstallID;
      if (!uniqueInstallID) {
        goto LABEL_14;
      }
      self->_uniqueInstallID = 0;

      if (qword_1000A5608)
      {
        if (*(int *)(qword_1000A5608 + 44) < 5) {
          goto LABEL_14;
        }
      }
      id v9 = [(ACXGizmoAppState *)self watchAppBundleID];
      MOLogWrite();
    }
    else
    {
      if (self->_uniqueInstallID) {
        goto LABEL_14;
      }
      id v6 = [(ACXGizmoAppState *)self watchAppBundleID];
      sub_100013CBC(v6);
      id v7 = (NSString *)objc_claimAutoreleasedReturnValue();
      id v8 = self->_uniqueInstallID;
      self->_uniqueInstallID = v7;

      if (qword_1000A5608)
      {
        if (*(int *)(qword_1000A5608 + 44) < 5) {
          goto LABEL_14;
        }
      }
      id v9 = [(ACXGizmoAppState *)self watchAppBundleID];
      id v11 = [(ACXGizmoAppState *)self uniqueInstallID];
      MOLogWrite();
    }
LABEL_14:
    self->_unint64_t installStatus = a3;
  }
}

- (void)regenerateUniqueInstallID
{
  if (self->_uniqueInstallID)
  {
    v3 = [(ACXGizmoAppState *)self watchAppBundleID];
    sub_100013CBC(v3);
    id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    uniqueInstallID = self->_uniqueInstallID;
    self->_uniqueInstallID = v4;

    if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 5) {
      return;
    }
    id v7 = [(ACXGizmoAppState *)self watchAppBundleID];
    id v6 = [(ACXGizmoAppState *)self uniqueInstallID];
    [(ACXGizmoAppState *)self installStatus];
  }
  else
  {
    if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 5) {
      return;
    }
    id v7 = [(ACXGizmoAppState *)self watchAppBundleID];
    id v6 = [(ACXGizmoAppState *)self uniqueInstallID];
    [(ACXGizmoAppState *)self installStatus];
  }
  MOLogWrite();
}

- (id)description
{
  return +[NSString stringWithFormat:@"<ACXGizmoAppState %p companionAppBundleID=%@ installStatus=%lu watchKitAppExecutableHash=%@>", self, self->_companionAppBundleID, self->_installStatus, self->_watchKitAppExecutableHash];
}

- (NSString)watchAppBundleID
{
  return self->_watchAppBundleID;
}

- (NSString)companionAppBundleID
{
  return self->_companionAppBundleID;
}

- (void)setCompanionAppBundleID:(id)a3
{
}

- (unint64_t)installStatus
{
  return self->_installStatus;
}

- (NSString)uniqueInstallID
{
  return self->_uniqueInstallID;
}

- (NSString)watchKitAppExecutableHash
{
  return self->_watchKitAppExecutableHash;
}

- (void)setWatchKitAppExecutableHash:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchKitAppExecutableHash, 0);
  objc_storeStrong((id *)&self->_uniqueInstallID, 0);
  objc_storeStrong((id *)&self->_companionAppBundleID, 0);

  objc_storeStrong((id *)&self->_watchAppBundleID, 0);
}

@end