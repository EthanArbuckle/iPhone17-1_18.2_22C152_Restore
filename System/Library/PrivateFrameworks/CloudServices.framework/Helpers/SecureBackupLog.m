@interface SecureBackupLog
+ (BOOL)supportsSecureCoding;
- (BOOL)allActivitiesComplete;
- (BOOL)isEqual:(id)a3;
- (NSArray)activities;
- (SecureBackupLog)initWithActivities:(id)a3 allComplete:(BOOL)a4 totalOperations:(unint64_t)a5;
- (SecureBackupLog)initWithCoder:(id)a3;
- (unint64_t)totalOperations;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateAllOperationsWithBlock:(id)a3;
@end

@implementation SecureBackupLog

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SecureBackupLog)initWithActivities:(id)a3 allComplete:(BOOL)a4 totalOperations:(unint64_t)a5
{
  id v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SecureBackupLog;
  v10 = [(SecureBackupLog *)&v14 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_activities, a3);
    v11->_allActivitiesComplete = a4;
    v11->_totalOperations = a5;
    v12 = v11;
  }

  return v11;
}

- (SecureBackupLog)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SecureBackupLog;
  v5 = [(SecureBackupLog *)&v14 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"allActivitiesComplete"];
    unsigned __int8 v7 = [v6 BOOLValue];

    v5->_allActivitiesComplete = v7;
    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalOperations"];
    id v9 = [v8 unsignedIntegerValue];

    v5->_totalOperations = (unint64_t)v9;
    v10 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"activities"];
    if (v10)
    {
      uint64_t v11 = self;

      activities = v5->_activities;
      v5->_activities = (NSArray *)v11;

      v10 = v5;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL allActivitiesComplete = self->_allActivitiesComplete;
  id v7 = a3;
  v5 = +[NSNumber numberWithBool:allActivitiesComplete];
  [v7 encodeObject:v5 forKey:@"allActivitiesComplete"];

  v6 = +[NSNumber numberWithUnsignedInteger:self->_totalOperations];
  [v7 encodeObject:v6 forKey:@"totalOperations"];

  [v7 encodeObject:self->_activities forKey:@"activities"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(SecureBackupLog *)self allActivitiesComplete];
  if (v5 == [v4 allActivitiesComplete]
    && (id v6 = -[SecureBackupLog totalOperations](self, "totalOperations"), v6 == [v4 totalOperations]))
  {
    id v7 = [(SecureBackupLog *)self activities];
    v8 = [v4 activities];
    if ([v7 isEqual:v8])
    {

      char v9 = 1;
    }
    else
    {
      uint64_t v11 = [(SecureBackupLog *)self activities];
      v12 = [v4 activities];
      BOOL v13 = v11 != v12;

      char v9 = !v13;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9 & 1;
}

- (void)enumerateAllOperationsWithBlock:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(SecureBackupLog *)self activities];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000344B8;
  v7[3] = &unk_100071BE0;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v7];
}

- (BOOL)allActivitiesComplete
{
  return self->_allActivitiesComplete;
}

- (unint64_t)totalOperations
{
  return self->_totalOperations;
}

- (NSArray)activities
{
  return self->_activities;
}

- (void).cxx_destruct
{
}

@end