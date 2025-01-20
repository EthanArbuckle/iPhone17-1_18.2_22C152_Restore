@interface IRReplayEventRunner
+ (id)historyEventsContainerDO:(id)a3 RemovingEventsAfter:(id)a4;
- (IRContextInspection)contextsInspection;
- (IRReplayEventRunner)initWithServicePackage:(int64_t)a3;
- (NSDictionary)contexts;
- (void)runSingleReplayEvent:(id)a3 withHistoryEventsContainer:(id)a4;
@end

@implementation IRReplayEventRunner

+ (id)historyEventsContainerDO:(id)a3 RemovingEventsAfter:(id)a4
{
  id v4 = a3;

  return v4;
}

- (IRReplayEventRunner)initWithServicePackage:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)IRReplayEventRunner;
  id v4 = [(IRReplayEventRunner *)&v8 init];
  if (v4)
  {
    v5 = [[IRPolicyEngine alloc] initWithServicePackage:a3];
    policyEngine = v4->_policyEngine;
    v4->_policyEngine = v5;
  }
  return v4;
}

- (void)runSingleReplayEvent:(id)a3 withHistoryEventsContainer:(id)a4
{
  policyEngine = self->_policyEngine;
  id v7 = a4;
  id v8 = a3;
  v9 = [v8 date];
  v10 = [v8 candidatesContainer];
  v11 = [v8 systemState];
  v12 = [v8 miloLslPrediction];
  v13 = [v8 nearbyDeviceContainerDO];
  LOBYTE(v20) = 1;
  [(IRPolicyEngine *)policyEngine updateContextWithDate:v9 candidatesContainer:v10 historyEventsContainer:v7 systemState:v11 miloProviderLslPredictionResults:v12 nearbyDeviceContainer:v13 fillInspection:v20];

  v14 = [IRContextInspection alloc];
  id v21 = [v8 date];
  v15 = [(IRPolicyEngine *)self->_policyEngine policyInspections];
  v16 = [v8 systemState];

  v17 = [v16 appInFocusBundleID];
  v18 = [(IRContextInspection *)v14 initWithDate:v21 policies:v15 foregroundApp:v17];
  contextsInspection = self->_contextsInspection;
  self->_contextsInspection = v18;
}

- (NSDictionary)contexts
{
  return [(IRPolicyEngine *)self->_policyEngine contexts];
}

- (IRContextInspection)contextsInspection
{
  return self->_contextsInspection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextsInspection, 0);

  objc_storeStrong((id *)&self->_policyEngine, 0);
}

@end