@interface SecureBackupEscrowOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)didFail;
- (BOOL)isComplete;
- (BOOL)isEqual:(id)a3;
- (BOOL)isStaleWithcontext:(id)a3;
- (NSDate)endTimestamp;
- (NSDate)finalCheckTimestamp;
- (NSDate)startTimestamp;
- (NSError)error;
- (NSString)activityLabel;
- (NSString)recordId;
- (NSUUID)id;
- (SecureBackupEscrowOperation)initWithCoder:(id)a3;
- (SecureBackupEscrowOperation)initWithEvent:(id)a3 parentActivity:(id)a4 context:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)updatedOperationWithAdditionalEvent:(id)a3 parentActivity:(id)a4 context:(id)a5;
- (id)updatedOperationWithParentActivity:(id)a3 context:(id)a4;
- (unint64_t)newStateWithContext:(id)a3 parentActivity:(id)a4;
- (unint64_t)state;
- (unint64_t)type;
- (void)_updateWithEvent:(id)a3 parentActivity:(id)a4 context:(id)a5;
- (void)encodeWithCoder:(id)a3;
- (void)setActivityLabel:(id)a3;
- (void)setEndTimestamp:(id)a3;
- (void)setError:(id)a3;
- (void)setFinalCheckTimestamp:(id)a3;
- (void)setId:(id)a3;
- (void)setRecordId:(id)a3;
- (void)setStartTimestamp:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation SecureBackupEscrowOperation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SecureBackupEscrowOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)SecureBackupEscrowOperation;
  v5 = [(SecureBackupEscrowOperation *)&v31 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"id"];
    if (v6)
    {
      uint64_t v7 = self;

      id = v5->_id;
      v5->_id = (NSUUID *)v7;

      v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activityLabel"];
      if (v6)
      {
        uint64_t v9 = self;

        activityLabel = v5->_activityLabel;
        v5->_activityLabel = (NSString *)v9;

        v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
        v6 = v11;
        if (v11)
        {
          unint64_t v12 = (int)[(SecureBackupEscrowOperation *)v11 intValue];

          v5->_type = v12;
          v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"state"];
          v6 = v13;
          if (v13)
          {
            unint64_t v14 = (int)[(SecureBackupEscrowOperation *)v13 intValue];

            v5->_state = v14;
            v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"error"];
            uint64_t v16 = self;

            error = v5->_error;
            v5->_error = (NSError *)v16;

            v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startTimestamp"];
            uint64_t v19 = self;

            startTimestamp = v5->_startTimestamp;
            v5->_startTimestamp = (NSDate *)v19;

            v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endTimestamp"];
            uint64_t v22 = self;

            endTimestamp = v5->_endTimestamp;
            v5->_endTimestamp = (NSDate *)v22;

            v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"finalCheckTimestamp"];
            uint64_t v25 = self;

            finalCheckTimestamp = v5->_finalCheckTimestamp;
            v5->_finalCheckTimestamp = (NSDate *)v25;

            v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recordId"];
            uint64_t v28 = self;

            recordId = v5->_recordId;
            v5->_recordId = (NSString *)v28;

            v6 = v5;
          }
        }
      }
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id = self->_id;
  id v7 = a3;
  [v7 encodeObject:id forKey:@"id"];
  [v7 encodeObject:self->_activityLabel forKey:@"activityLabel"];
  v5 = +[NSNumber numberWithUnsignedInteger:self->_type];
  [v7 encodeObject:v5 forKey:@"type"];

  v6 = +[NSNumber numberWithUnsignedInteger:self->_state];
  [v7 encodeObject:v6 forKey:@"state"];

  [v7 encodeObject:self->_error forKey:@"error"];
  [v7 encodeObject:self->_startTimestamp forKey:@"startTimestamp"];
  [v7 encodeObject:self->_endTimestamp forKey:@"endTimestamp"];
  [v7 encodeObject:self->_finalCheckTimestamp forKey:@"finalCheckTimestamp"];
  [v7 encodeObject:self->_recordId forKey:@"recordId"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = [(SecureBackupEscrowOperation *)self id];
  id v7 = [v6 copyWithZone:a3];
  [v5 setId:v7];

  v8 = [(SecureBackupEscrowOperation *)self activityLabel];
  id v9 = [v8 copyWithZone:a3];
  [v5 setActivityLabel:v9];

  objc_msgSend(v5, "setType:", -[SecureBackupEscrowOperation type](self, "type"));
  objc_msgSend(v5, "setState:", -[SecureBackupEscrowOperation state](self, "state"));
  v10 = [(SecureBackupEscrowOperation *)self error];
  id v11 = [v10 copyWithZone:a3];
  [v5 setError:v11];

  unint64_t v12 = [(SecureBackupEscrowOperation *)self startTimestamp];
  id v13 = [v12 copyWithZone:a3];
  [v5 setStartTimestamp:v13];

  unint64_t v14 = [(SecureBackupEscrowOperation *)self endTimestamp];
  id v15 = [v14 copyWithZone:a3];
  [v5 setEndTimestamp:v15];

  uint64_t v16 = [(SecureBackupEscrowOperation *)self finalCheckTimestamp];
  id v17 = [v16 copyWithZone:a3];
  [v5 setFinalCheckTimestamp:v17];

  v18 = [(SecureBackupEscrowOperation *)self recordId];
  [v5 setRecordId:v18];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(SecureBackupEscrowOperation *)self id];
    id v7 = [v5 id];
    if ([v6 isEqual:v7])
    {
    }
    else
    {
      id v9 = [(SecureBackupEscrowOperation *)self id];
      v10 = [v5 id];

      if (v9 != v10) {
        goto LABEL_23;
      }
    }
    id v11 = [(SecureBackupEscrowOperation *)self activityLabel];
    unint64_t v12 = [v5 activityLabel];
    if ([v11 isEqual:v12])
    {
    }
    else
    {
      id v13 = [(SecureBackupEscrowOperation *)self activityLabel];
      unint64_t v14 = [v5 activityLabel];

      if (v13 != v14) {
        goto LABEL_23;
      }
    }
    id v15 = [(SecureBackupEscrowOperation *)self type];
    if (v15 != [v5 type]) {
      goto LABEL_23;
    }
    id v16 = [(SecureBackupEscrowOperation *)self state];
    if (v16 != [v5 state]) {
      goto LABEL_23;
    }
    id v17 = [(SecureBackupEscrowOperation *)self error];
    v18 = [v5 error];
    if ([v17 isEqual:v18])
    {
    }
    else
    {
      uint64_t v19 = [(SecureBackupEscrowOperation *)self error];
      v20 = [v5 error];

      if (v19 != v20) {
        goto LABEL_23;
      }
    }
    v21 = [(SecureBackupEscrowOperation *)self startTimestamp];
    uint64_t v22 = [v5 startTimestamp];
    if ([v21 isEqual:v22])
    {
    }
    else
    {
      v23 = [(SecureBackupEscrowOperation *)self startTimestamp];
      v24 = [v5 startTimestamp];

      if (v23 != v24) {
        goto LABEL_23;
      }
    }
    uint64_t v25 = [(SecureBackupEscrowOperation *)self endTimestamp];
    v26 = [v5 endTimestamp];
    if ([v25 isEqual:v26])
    {
    }
    else
    {
      v27 = [(SecureBackupEscrowOperation *)self endTimestamp];
      uint64_t v28 = [v5 endTimestamp];

      if (v27 != v28) {
        goto LABEL_23;
      }
    }
    v29 = [(SecureBackupEscrowOperation *)self finalCheckTimestamp];
    v30 = [v5 finalCheckTimestamp];
    if ([v29 isEqual:v30])
    {

      goto LABEL_26;
    }
    objc_super v31 = [(SecureBackupEscrowOperation *)self finalCheckTimestamp];
    v32 = [v5 finalCheckTimestamp];

    if (v31 == v32)
    {
LABEL_26:
      v34 = [(SecureBackupEscrowOperation *)self recordId];
      v35 = [v5 recordId];
      if ([v34 isEqual:v35])
      {

        char v8 = 1;
      }
      else
      {
        v36 = [(SecureBackupEscrowOperation *)self recordId];
        v37 = [v5 recordId];
        BOOL v38 = v36 != v37;

        char v8 = !v38;
      }
      goto LABEL_24;
    }
LABEL_23:
    char v8 = 0;
LABEL_24:

    goto LABEL_25;
  }
  char v8 = 0;
LABEL_25:

  return v8 & 1;
}

- (id)description
{
  v2 = [(SecureBackupEscrowOperation *)self id];
  v3 = [v2 UUIDString];

  return v3;
}

- (NSUUID)id
{
  return self->_id;
}

- (void)setId:(id)a3
{
}

- (NSString)activityLabel
{
  return self->_activityLabel;
}

- (void)setActivityLabel:(id)a3
{
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (NSDate)startTimestamp
{
  return self->_startTimestamp;
}

- (void)setStartTimestamp:(id)a3
{
}

- (NSDate)endTimestamp
{
  return self->_endTimestamp;
}

- (void)setEndTimestamp:(id)a3
{
}

- (NSDate)finalCheckTimestamp
{
  return self->_finalCheckTimestamp;
}

- (void)setFinalCheckTimestamp:(id)a3
{
}

- (NSString)recordId
{
  return self->_recordId;
}

- (void)setRecordId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordId, 0);
  objc_storeStrong((id *)&self->_finalCheckTimestamp, 0);
  objc_storeStrong((id *)&self->_endTimestamp, 0);
  objc_storeStrong((id *)&self->_startTimestamp, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_activityLabel, 0);

  objc_storeStrong((id *)&self->_id, 0);
}

- (BOOL)isComplete
{
  return (char *)[(SecureBackupEscrowOperation *)self state] - 2 < (char *)6;
}

- (BOOL)didFail
{
  return (char *)[(SecureBackupEscrowOperation *)self state] - 3 < (char *)5;
}

- (SecureBackupEscrowOperation)initWithEvent:(id)a3 parentActivity:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SecureBackupEscrowOperation;
  id v11 = [(SecureBackupEscrowOperation *)&v15 init];
  unint64_t v12 = v11;
  if (v11)
  {
    [(SecureBackupEscrowOperation *)v11 _updateWithEvent:v8 parentActivity:v9 context:v10];
    id v13 = v12;
  }

  return v12;
}

- (void)_updateWithEvent:(id)a3 parentActivity:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    uint64_t v11 = [(SecureBackupEscrowOperation *)self id];
    if (v11)
    {
      unint64_t v12 = (void *)v11;
      id v13 = [(SecureBackupEscrowOperation *)self id];
      unint64_t v14 = [v8 operationId];
      unsigned __int8 v15 = [v13 isEqual:v14];

      if ((v15 & 1) == 0)
      {
        v20 = CloudServicesLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          sub_10004D528(self, v8, v20);
        }
LABEL_25:

        goto LABEL_27;
      }
    }
    id v16 = [v8 operationId];
    [(SecureBackupEscrowOperation *)self setId:v16];

    id v17 = [v8 activityLabel];
    [(SecureBackupEscrowOperation *)self setActivityLabel:v17];

    -[SecureBackupEscrowOperation setType:](self, "setType:", [v8 type]);
    v18 = [(SecureBackupEscrowOperation *)self recordId];
    if (v18)
    {
      [(SecureBackupEscrowOperation *)self setRecordId:v18];
    }
    else
    {
      v21 = [v8 recordId];
      [(SecureBackupEscrowOperation *)self setRecordId:v21];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v22 = [v8 timestamp];
      [(SecureBackupEscrowOperation *)self setStartTimestamp:v22];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_20:
        v26 = [(SecureBackupEscrowOperation *)self endTimestamp];

        if (!v26)
        {
          [(SecureBackupEscrowOperation *)self setState:1];
          goto LABEL_27;
        }
        v27 = [(SecureBackupEscrowOperation *)self error];

        if (v27) {
          uint64_t v28 = 3;
        }
        else {
          uint64_t v28 = 2;
        }
        [(SecureBackupEscrowOperation *)self setState:v28];
        v20 = [v10 currentTime];
        [(SecureBackupEscrowOperation *)self setFinalCheckTimestamp:v20];
        goto LABEL_25;
      }
      v23 = [(SecureBackupEscrowOperation *)self startTimestamp];
      if (v23)
      {
        [(SecureBackupEscrowOperation *)self setStartTimestamp:v23];
      }
      else
      {
        v24 = [v8 timestamp];
        [(SecureBackupEscrowOperation *)self setStartTimestamp:v24];
      }
      uint64_t v25 = [v8 timestamp];
      [(SecureBackupEscrowOperation *)self setEndTimestamp:v25];

      uint64_t v22 = [v8 error];
      [(SecureBackupEscrowOperation *)self setError:v22];
    }

    goto LABEL_20;
  }
  uint64_t v19 = CloudServicesLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    sub_10004D4E4(v19);
  }

LABEL_27:
}

- (id)updatedOperationWithAdditionalEvent:(id)a3 parentActivity:(id)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(SecureBackupEscrowOperation *)self copy];
  [v11 _updateWithEvent:v10 parentActivity:v9 context:v8];

  return v11;
}

- (id)updatedOperationWithParentActivity:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = [(SecureBackupEscrowOperation *)self isComplete];
  id v9 = [(SecureBackupEscrowOperation *)self copy];
  if ((v8 & 1) == 0)
  {
    uint64_t v10 = [(SecureBackupEscrowOperation *)self newStateWithContext:v7 parentActivity:v6];
    if (sub_100004E00(v10))
    {
      id v11 = [v7 currentTime];
      [(SecureBackupEscrowOperation *)self setFinalCheckTimestamp:v11];
    }
    [v9 setState:v10];
  }

  return v9;
}

- (BOOL)isStaleWithcontext:(id)a3
{
  id v4 = a3;
  id v5 = [(SecureBackupEscrowOperation *)self finalCheckTimestamp];
  if (v5)
  {
    id v6 = [v4 currentTime];
    [v6 timeIntervalSinceDate:v5];
    double v8 = v7;

    [v4 activityRecordRetentionInterval];
    BOOL v10 = v8 > v9;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (unint64_t)newStateWithContext:(id)a3 parentActivity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = [(SecureBackupEscrowOperation *)self isComplete];
  unint64_t v9 = [(SecureBackupEscrowOperation *)self state];
  unint64_t v10 = v9;
  if ((v8 & 1) == 0)
  {
    if (v9)
    {
      id v11 = [v6 currentBootId];
      unint64_t v12 = [v7 bootId];
      unsigned int v13 = [v11 isEqual:v12];

      if (v13)
      {
        unsigned int v14 = [v6 currentPID];
        if (v14 == [v7 pid])
        {
          unsigned __int8 v15 = [v6 currentTime];
          id v16 = [(SecureBackupEscrowOperation *)self startTimestamp];
          if (v16)
          {
            [v15 timeIntervalSinceDate:v16];
            double v18 = v17;
          }
          else
          {
            uint64_t v19 = [v6 currentTime];
            [v15 timeIntervalSinceDate:v19];
            double v18 = v20;
          }
          [v6 operationTimeoutInterval];
          if (v18 <= v21) {
            unint64_t v10 = [(SecureBackupEscrowOperation *)self state];
          }
          else {
            unint64_t v10 = 6;
          }
        }
        else
        {
          unint64_t v10 = 4;
        }
      }
      else
      {
        unint64_t v10 = 5;
      }
    }
    else
    {
      unint64_t v10 = 7;
    }
  }

  return v10;
}

@end