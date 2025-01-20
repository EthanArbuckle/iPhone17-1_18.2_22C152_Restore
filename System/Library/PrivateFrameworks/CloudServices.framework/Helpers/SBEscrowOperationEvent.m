@interface SBEscrowOperationEvent
+ (BOOL)supportsSecureCoding;
- (NSDate)timestamp;
- (NSString)activityLabel;
- (NSString)recordId;
- (NSUUID)activityId;
- (NSUUID)operationId;
- (SBEscrowOperationEvent)initWithCoder:(id)a3;
- (SBEscrowOperationEvent)initWithOperationId:(id)a3 activityId:(id)a4 activityLabel:(id)a5 recordId:(id)a6 type:(unint64_t)a7 context:(id)a8;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SBEscrowOperationEvent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SBEscrowOperationEvent)initWithOperationId:(id)a3 activityId:(id)a4 activityLabel:(id)a5 recordId:(id)a6 type:(unint64_t)a7 context:(id)a8
{
  id v24 = a3;
  id v23 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  v25.receiver = self;
  v25.super_class = (Class)SBEscrowOperationEvent;
  v18 = [(SBEscrowOperationEvent *)&v25 init];
  v19 = v18;
  if (v18)
  {
    v18->_type = a7;
    uint64_t v20 = objc_msgSend(v17, "currentTime", v23, v24);
    timestamp = v19->_timestamp;
    v19->_timestamp = (NSDate *)v20;

    objc_storeStrong((id *)&v19->_operationId, a3);
    objc_storeStrong((id *)&v19->_activityId, a4);
    objc_storeStrong((id *)&v19->_activityLabel, a5);
    objc_storeStrong((id *)&v19->_recordId, a6);
  }

  return v19;
}

- (SBEscrowOperationEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SBEscrowOperationEvent;
  v5 = [(SBEscrowOperationEvent *)&v21 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timestamp"];
    if (v6)
    {
      uint64_t v7 = self;

      timestamp = v5->_timestamp;
      v5->_timestamp = (NSDate *)v7;

      v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
      v6 = v9;
      if (v9)
      {
        unint64_t v10 = (int)[(SBEscrowOperationEvent *)v9 intValue];

        v5->_type = v10;
        v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"operationId"];
        if (v6)
        {
          uint64_t v11 = self;

          operationId = v5->_operationId;
          v5->_operationId = (NSUUID *)v11;

          v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activityLabel"];
          if (v6)
          {
            uint64_t v13 = self;

            activityLabel = v5->_activityLabel;
            v5->_activityLabel = (NSString *)v13;

            v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activityId"];
            if (v6)
            {
              uint64_t v15 = self;

              activityId = v5->_activityId;
              v5->_activityId = (NSUUID *)v15;

              id v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recordId"];
              uint64_t v18 = self;

              recordId = v5->_recordId;
              v5->_recordId = (NSString *)v18;

              v6 = v5;
            }
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
  timestamp = self->_timestamp;
  id v6 = a3;
  [v6 encodeObject:timestamp forKey:@"timestamp"];
  v5 = +[NSNumber numberWithUnsignedInteger:self->_type];
  [v6 encodeObject:v5 forKey:@"type"];

  [v6 encodeObject:self->_operationId forKey:@"operationId"];
  [v6 encodeObject:self->_activityLabel forKey:@"activityLabel"];
  [v6 encodeObject:self->_activityId forKey:@"activityId"];
  [v6 encodeObject:self->_recordId forKey:@"recordId"];
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSUUID)operationId
{
  return self->_operationId;
}

- (NSUUID)activityId
{
  return self->_activityId;
}

- (NSString)activityLabel
{
  return self->_activityLabel;
}

- (NSString)recordId
{
  return self->_recordId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordId, 0);
  objc_storeStrong((id *)&self->_activityLabel, 0);
  objc_storeStrong((id *)&self->_activityId, 0);
  objc_storeStrong((id *)&self->_operationId, 0);

  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end