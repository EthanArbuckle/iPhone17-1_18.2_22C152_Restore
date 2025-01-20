@interface DTOPolicyEvaluationIdentifierFactory
- (id)_callerIDForClient:(id)a3;
- (id)evaluationIdentifierForClient:(id)a3 ratchetIdentifier:(id)a4;
@end

@implementation DTOPolicyEvaluationIdentifierFactory

- (id)evaluationIdentifierForClient:(id)a3 ratchetIdentifier:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(DTOPolicyEvaluationIdentifierFactory *)self _callerIDForClient:a3];
  v8 = (void *)v7;
  v9 = @"<UNKNOWN>";
  if (v7) {
    v9 = (__CFString *)v7;
  }
  v10 = v9;

  if (v6)
  {
    id v11 = v6;
  }
  else
  {
    v12 = +[NSUUID UUID];
    id v11 = [v12 UUIDString];
  }
  v13 = +[NSString stringWithFormat:@"%@:%@", v10, v11];

  return v13;
}

- (id)_callerIDForClient:(id)a3
{
  id v3 = a3;
  id v4 = [v3 processId];
  if (v3) {
    [v3 auditToken];
  }
  else {
    memset(v7, 0, sizeof(v7));
  }
  v5 = +[DaemonUtils callerIdWithPid:v4 auditToken:v7];

  return v5;
}

@end