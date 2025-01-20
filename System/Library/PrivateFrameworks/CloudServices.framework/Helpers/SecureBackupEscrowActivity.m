@interface SecureBackupEscrowActivity
+ (BOOL)supportsSecureCoding;
- (BOOL)allOperationsComplete;
- (BOOL)isEqual:(id)a3;
- (BOOL)someOperationsReaped;
- (NSArray)operations;
- (NSString)activityLabel;
- (NSUUID)bootId;
- (NSUUID)id;
- (SecureBackupEscrowActivity)initWithCoder:(id)a3;
- (SecureBackupEscrowActivity)initWithInitialEvent:(id)a3 context:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (int)pid;
- (void)encodeWithCoder:(id)a3;
- (void)setAllOperationsComplete:(BOOL)a3;
- (void)setBootId:(id)a3;
- (void)setId:(id)a3;
- (void)setOperations:(id)a3;
- (void)setPid:(int)a3;
- (void)setSomeOperationsReaped:(BOOL)a3;
@end

@implementation SecureBackupEscrowActivity

- (SecureBackupEscrowActivity)initWithInitialEvent:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SecureBackupEscrowActivity;
  v8 = [(SecureBackupEscrowActivity *)&v15 init];
  if (v8)
  {
    v9 = [v6 activityId];
    [(SecureBackupEscrowActivity *)v8 setId:v9];

    v10 = [v7 currentBootId];
    [(SecureBackupEscrowActivity *)v8 setBootId:v10];

    -[SecureBackupEscrowActivity setPid:](v8, "setPid:", [v7 currentPID]);
    v11 = [[SecureBackupEscrowOperation alloc] initWithEvent:v6 parentActivity:v8 context:v7];
    v16 = v11;
    v12 = +[NSArray arrayWithObjects:&v16 count:1];
    [(SecureBackupEscrowActivity *)v8 setOperations:v12];

    [(SecureBackupEscrowActivity *)v8 setAllOperationsComplete:[(SecureBackupEscrowOperation *)v11 isComplete]];
    v13 = v8;
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SecureBackupEscrowActivity)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SecureBackupEscrowActivity;
  v5 = [(SecureBackupEscrowActivity *)&v20 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"id"];
    if (v6)
    {
      uint64_t v7 = self;

      id = v5->_id;
      v5->_id = (NSUUID *)v7;

      id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bootId"];
      if (v6)
      {
        uint64_t v9 = self;

        bootId = v5->_bootId;
        v5->_bootId = (NSUUID *)v9;

        v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pid"];
        id v6 = v11;
        if (v11)
        {
          unsigned int v12 = [(SecureBackupEscrowActivity *)v11 intValue];

          v5->_pid = v12;
          v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"allOperationsComplete"];
          id v6 = v13;
          if (v13)
          {
            unsigned __int8 v14 = [(SecureBackupEscrowActivity *)v13 BOOLValue];

            v5->_allOperationsComplete = v14;
            objc_super v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"someOperationsReaped"];
            id v6 = v15;
            if (v15)
            {
              unsigned __int8 v16 = [(SecureBackupEscrowActivity *)v15 BOOLValue];

              v5->_someOperationsReaped = v16;
              id v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"operations"];
              if (v6)
              {
                uint64_t v17 = self;

                operations = v5->_operations;
                v5->_operations = (NSArray *)v17;

                id v6 = v5;
              }
            }
          }
        }
      }
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id = self->_id;
  id v8 = a3;
  [v8 encodeObject:id forKey:@"id"];
  [v8 encodeObject:self->_bootId forKey:@"bootId"];
  v5 = +[NSNumber numberWithInt:self->_pid];
  [v8 encodeObject:v5 forKey:@"pid"];

  id v6 = +[NSNumber numberWithBool:self->_allOperationsComplete];
  [v8 encodeObject:v6 forKey:@"allOperationsComplete"];

  uint64_t v7 = +[NSNumber numberWithBool:self->_someOperationsReaped];
  [v8 encodeObject:v7 forKey:@"someOperationsReaped"];

  [v8 encodeObject:self->_operations forKey:@"operations"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(SecureBackupEscrowActivity *)self id];
  id v7 = [v6 copyWithZone:a3];
  [v5 setId:v7];

  id v8 = [(SecureBackupEscrowActivity *)self bootId];
  id v9 = [v8 copyWithZone:a3];
  [v5 setBootId:v9];

  objc_msgSend(v5, "setPid:", -[SecureBackupEscrowActivity pid](self, "pid"));
  objc_msgSend(v5, "setAllOperationsComplete:", -[SecureBackupEscrowActivity allOperationsComplete](self, "allOperationsComplete"));
  objc_msgSend(v5, "setSomeOperationsReaped:", -[SecureBackupEscrowActivity someOperationsReaped](self, "someOperationsReaped"));
  v10 = [(SecureBackupEscrowActivity *)self operations];
  id v11 = [v10 copyWithZone:a3];
  [v5 setOperations:v11];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(SecureBackupEscrowActivity *)self id];
    id v7 = [v5 id];
    if ([v6 isEqual:v7])
    {
    }
    else
    {
      id v9 = [(SecureBackupEscrowActivity *)self id];
      v10 = [v5 id];

      if (v9 != v10) {
        goto LABEL_12;
      }
    }
    id v11 = [(SecureBackupEscrowActivity *)self bootId];
    unsigned int v12 = [v5 bootId];
    if ([v11 isEqual:v12])
    {
    }
    else
    {
      v13 = [(SecureBackupEscrowActivity *)self bootId];
      unsigned __int8 v14 = [v5 bootId];

      if (v13 != v14) {
        goto LABEL_12;
      }
    }
    unsigned int v15 = [(SecureBackupEscrowActivity *)self pid];
    if (v15 == [v5 pid])
    {
      unsigned int v16 = [(SecureBackupEscrowActivity *)self allOperationsComplete];
      if (v16 == [v5 allOperationsComplete])
      {
        unsigned int v17 = [(SecureBackupEscrowActivity *)self someOperationsReaped];
        if (v17 == [v5 someOperationsReaped])
        {
          v19 = [(SecureBackupEscrowActivity *)self operations];
          objc_super v20 = [v5 operations];
          if ([v19 isEqual:v20])
          {

            char v8 = 1;
          }
          else
          {
            v21 = [(SecureBackupEscrowActivity *)self operations];
            v22 = [v5 operations];
            BOOL v23 = v21 != v22;

            char v8 = !v23;
          }
          goto LABEL_13;
        }
      }
    }
LABEL_12:
    char v8 = 0;
LABEL_13:

    goto LABEL_14;
  }
  char v8 = 0;
LABEL_14:

  return v8 & 1;
}

- (NSUUID)id
{
  return self->_id;
}

- (void)setId:(id)a3
{
}

- (NSUUID)bootId
{
  return self->_bootId;
}

- (void)setBootId:(id)a3
{
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (BOOL)allOperationsComplete
{
  return self->_allOperationsComplete;
}

- (void)setAllOperationsComplete:(BOOL)a3
{
  self->_allOperationsComplete = a3;
}

- (BOOL)someOperationsReaped
{
  return self->_someOperationsReaped;
}

- (void)setSomeOperationsReaped:(BOOL)a3
{
  self->_someOperationsReaped = a3;
}

- (NSArray)operations
{
  return self->_operations;
}

- (void)setOperations:(id)a3
{
}

- (NSString)activityLabel
{
  return self->_activityLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityLabel, 0);
  objc_storeStrong((id *)&self->_operations, 0);
  objc_storeStrong((id *)&self->_bootId, 0);

  objc_storeStrong((id *)&self->_id, 0);
}

@end