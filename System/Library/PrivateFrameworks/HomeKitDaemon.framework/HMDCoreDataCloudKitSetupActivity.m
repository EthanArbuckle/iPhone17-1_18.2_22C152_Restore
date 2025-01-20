@interface HMDCoreDataCloudKitSetupActivity
- (BOOL)succeeded;
- (HMDCoreDataCloudKitSetupActivity)initWithDictionary:(id)a3;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSError)error;
- (NSString)activityType;
- (NSString)phase;
- (NSUUID)identifier;
- (NSUUID)parentActivityIdentifier;
- (NSUUID)storeIdentifier;
- (id)description;
- (int64_t)eventType;
- (void)dealloc;
@end

@implementation HMDCoreDataCloudKitSetupActivity

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_phase, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_parentActivityIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
}

- (NSError)error
{
  return self->_error;
}

- (BOOL)succeeded
{
  return self->_succeeded;
}

- (NSString)phase
{
  return self->_phase;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (NSUUID)storeIdentifier
{
  return self->_storeIdentifier;
}

- (NSUUID)parentActivityIdentifier
{
  return self->_parentActivityIdentifier;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSString)activityType
{
  return self->_activityType;
}

- (id)description
{
  v3 = NSString;
  v4 = [(HMDCoreDataCloudKitSetupActivity *)self activityType];
  v5 = [(HMDCoreDataCloudKitSetupActivity *)self phase];
  v6 = [v3 stringWithFormat:@"activityType: %@ phase: %@ succeeded: %{BOOL}d", v4, v5, -[HMDCoreDataCloudKitSetupActivity succeeded](self, "succeeded")];

  return v6;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)HMDCoreDataCloudKitSetupActivity;
  [(HMDCoreDataCloudKitSetupActivity *)&v2 dealloc];
}

- (HMDCoreDataCloudKitSetupActivity)initWithDictionary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = v4;
    v27.receiver = self;
    v27.super_class = (Class)HMDCoreDataCloudKitSetupActivity;
    v6 = [(HMDCoreDataCloudKitSetupActivity *)&v27 init];
    if (v6)
    {
      uint64_t v7 = objc_msgSend(v5, "hmf_stringForKey:", @"activityType");
      activityType = v6->_activityType;
      v6->_activityType = (NSString *)v7;

      v9 = objc_msgSend(v5, "hmf_numberForKey:", @"eventType");
      v6->_eventType = [v9 integerValue];

      uint64_t v10 = objc_msgSend(v5, "hmf_UUIDForKey:", @"identifier");
      identifier = v6->_identifier;
      v6->_identifier = (NSUUID *)v10;

      uint64_t v12 = objc_msgSend(v5, "hmf_UUIDForKey:", @"storeIdentifier");
      storeIdentifier = v6->_storeIdentifier;
      v6->_storeIdentifier = (NSUUID *)v12;

      uint64_t v14 = objc_msgSend(v5, "hmf_UUIDForKey:", @"parentActivityIdentifier");
      parentActivityIdentifier = v6->_parentActivityIdentifier;
      v6->_parentActivityIdentifier = (NSUUID *)v14;

      uint64_t v16 = objc_msgSend(v5, "hmf_dateForKey:", @"startDate");
      startDate = v6->_startDate;
      v6->_startDate = (NSDate *)v16;

      uint64_t v18 = objc_msgSend(v5, "hmf_dateForKey:", @"endDate");
      endDate = v6->_endDate;
      v6->_endDate = (NSDate *)v18;

      uint64_t v20 = objc_msgSend(v5, "hmf_stringForKey:", @"phase");
      phase = v6->_phase;
      v6->_phase = (NSString *)v20;

      v6->_succeeded = objc_msgSend(v5, "hmf_BOOLForKey:", @"succeeded");
      uint64_t v22 = objc_msgSend(v5, "hmf_errorForKey:", @"error");
      error = v6->_error;
      v6->_error = (NSError *)v22;
    }
    return v6;
  }
  else
  {
    v25 = (HMDEventTriggerUserConfirmationSession *)_HMFPreconditionFailure();
    [(HMDEventTriggerUserConfirmationSession *)v25 .cxx_destruct];
  }
  return result;
}

@end