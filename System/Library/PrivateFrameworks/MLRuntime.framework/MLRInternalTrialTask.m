@interface MLRInternalTrialTask
+ (BOOL)supportsSecureCoding;
- (MLRInternalTrialTask)initWithCoder:(id)a3;
- (MLRInternalTrialTask)initWithEvaluationState:(id)a3 runtimeEvaluation:(id)a4;
- (MLRInternalTrialTask)initWithEvaluationState:(id)a3 runtimeEvaluation:(id)a4 pluginProjectId:(int)a5;
- (MLRInternalTrialTask)initWithEvaluationState:(id)a3 schedulingPolicy:(id)a4 pluginProjectId:(int)a5;
- (MLRTrialTaskSchedulingPolicy)policy;
- (NSString)evaluationID;
- (TRIFactorsState)evaluationState;
- (id)description;
- (int)projectId;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MLRInternalTrialTask

- (MLRInternalTrialTask)initWithEvaluationState:(id)a3 runtimeEvaluation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v7 && [v7 hasPluginId]) {
    uint64_t v9 = [v8 pluginProjectId];
  }
  else {
    uint64_t v9 = 0;
  }
  v10 = [(MLRInternalTrialTask *)self initWithEvaluationState:v6 runtimeEvaluation:v8 pluginProjectId:v9];

  return v10;
}

- (MLRInternalTrialTask)initWithEvaluationState:(id)a3 runtimeEvaluation:(id)a4 pluginProjectId:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[MLRTrialTaskSchedulingPolicy alloc] initWithTRIMLRuntimeEvaluation:v8];

  v11 = [(MLRInternalTrialTask *)self initWithEvaluationState:v9 schedulingPolicy:v10 pluginProjectId:v5];
  return v11;
}

- (MLRInternalTrialTask)initWithEvaluationState:(id)a3 schedulingPolicy:(id)a4 pluginProjectId:(int)a5
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = objc_opt_class();
  v12 = 0;
  if (v9 && v11)
  {
    v24.receiver = self;
    v24.super_class = (Class)MLRInternalTrialTask;
    v13 = [(MLRInternalTrialTask *)&v24 init];
    v14 = v13;
    if (!v13)
    {
LABEL_10:
      self = v14;
      v12 = self;
      goto LABEL_11;
    }
    objc_storeStrong((id *)&v13->_evaluationState, a3);
    objc_storeStrong((id *)&v14->_policy, a4);
    v14->_projectId = a5;
    v15 = [v9 experimentIdentifiers];
    v16 = [v9 rolloutIdentifiers];
    v17 = [v15 experimentId];

    if (v17)
    {
      evaluationID = [v15 experimentId];
      v19 = v15;
    }
    else
    {
      v20 = [v16 rolloutId];

      if (!v20)
      {
        evaluationID = v14->_evaluationID;
        v14->_evaluationID = (NSString *)@"Unknown";
        goto LABEL_9;
      }
      evaluationID = [v16 rolloutId];
      v19 = v16;
    }
    uint64_t v21 = objc_msgSend(evaluationID, "stringByAppendingFormat:", @"_%d", objc_msgSend(v19, "deploymentId"));
    v22 = v14->_evaluationID;
    v14->_evaluationID = (NSString *)v21;

LABEL_9:
    goto LABEL_10;
  }
LABEL_11:

  return v12;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"%@(%@, %@, %ld)", v5, self->_evaluationState, self->_policy, self->_projectId];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  evaluationState = self->_evaluationState;
  id v5 = a3;
  [v5 encodeObject:evaluationState forKey:@"evaluationState"];
  [v5 encodeInt32:self->_projectId forKey:@"projectId"];
}

- (MLRInternalTrialTask)initWithCoder:(id)a3
{
  id v4 = a3;
  if (objc_opt_class())
  {
    id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"evaluationState"];
    if (v5)
    {
      uint64_t v6 = [v4 decodeInt32ForKey:@"projectId"];
      id v7 = objc_opt_new();
      self = [(MLRInternalTrialTask *)self initWithEvaluationState:v5 runtimeEvaluation:v7 pluginProjectId:v6];

      id v8 = self;
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (TRIFactorsState)evaluationState
{
  return self->_evaluationState;
}

- (MLRTrialTaskSchedulingPolicy)policy
{
  return self->_policy;
}

- (int)projectId
{
  return self->_projectId;
}

- (NSString)evaluationID
{
  return self->_evaluationID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_evaluationID, 0);
  objc_storeStrong((id *)&self->_policy, 0);

  objc_storeStrong((id *)&self->_evaluationState, 0);
}

@end