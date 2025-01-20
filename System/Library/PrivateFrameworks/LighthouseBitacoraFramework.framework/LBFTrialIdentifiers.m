@interface LBFTrialIdentifiers
- (LBFTrialIdentifiers)initWithBMLTTaskID:(id)a3 deploymentID:(int)a4;
- (LBFTrialIdentifiers)initWithExperimentID:(id)a3 deploymentID:(int)a4 treatmentID:(id)a5;
- (NSString)deploymentID;
- (NSString)experimentID;
- (NSString)treatmentID;
- (NSString)trialTaskID;
- (int64_t)identifierType;
@end

@implementation LBFTrialIdentifiers

- (LBFTrialIdentifiers)initWithExperimentID:(id)a3 deploymentID:(int)a4 treatmentID:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v9 = a3;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)LBFTrialIdentifiers;
  v11 = [(LBFTrialIdentifiers *)&v19 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_experimentID, a3);
    uint64_t v16 = objc_msgSend_stringWithFormat_(NSString, v13, @"%d", v14, v15, v6);
    deploymentID = v12->_deploymentID;
    v12->_deploymentID = (NSString *)v16;

    objc_storeStrong((id *)&v12->_treatmentID, a5);
    v12->_identifierType = 1;
  }

  return v12;
}

- (LBFTrialIdentifiers)initWithBMLTTaskID:(id)a3 deploymentID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)LBFTrialIdentifiers;
  v8 = [(LBFTrialIdentifiers *)&v16 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_trialTaskID, a3);
    uint64_t v13 = objc_msgSend_stringWithFormat_(NSString, v10, @"%d", v11, v12, v4);
    deploymentID = v9->_deploymentID;
    v9->_deploymentID = (NSString *)v13;

    v9->_identifierType = 2;
  }

  return v9;
}

- (NSString)experimentID
{
  return self->_experimentID;
}

- (NSString)deploymentID
{
  return self->_deploymentID;
}

- (NSString)treatmentID
{
  return self->_treatmentID;
}

- (NSString)trialTaskID
{
  return self->_trialTaskID;
}

- (int64_t)identifierType
{
  return self->_identifierType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialTaskID, 0);
  objc_storeStrong((id *)&self->_treatmentID, 0);
  objc_storeStrong((id *)&self->_deploymentID, 0);
  objc_storeStrong((id *)&self->_experimentID, 0);
}

@end