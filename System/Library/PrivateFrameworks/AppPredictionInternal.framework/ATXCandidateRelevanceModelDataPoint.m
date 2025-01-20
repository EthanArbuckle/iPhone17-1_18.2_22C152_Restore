@interface ATXCandidateRelevanceModelDataPoint
- (ATXCandidate)candidate;
- (ATXCandidateRelevanceModelDataPoint)initWithContext:(id)a3 candidate:(id)a4 engaged:(BOOL)a5 contextDefinedSessionId:(id)a6;
- (ATXPredictionContext)context;
- (BOOL)engaged;
- (NSUUID)contextDefinedSessionId;
- (void)setCandidate:(id)a3;
- (void)setEngaged:(BOOL)a3;
@end

@implementation ATXCandidateRelevanceModelDataPoint

- (ATXCandidateRelevanceModelDataPoint)initWithContext:(id)a3 candidate:(id)a4 engaged:(BOOL)a5 contextDefinedSessionId:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)ATXCandidateRelevanceModelDataPoint;
  v14 = [(ATXCandidateRelevanceModelDataPoint *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_context, a3);
    objc_storeStrong((id *)&v15->_candidate, a4);
    v15->_engaged = a5;
    objc_storeStrong((id *)&v15->_contextDefinedSessionId, a6);
  }

  return v15;
}

- (ATXPredictionContext)context
{
  return self->_context;
}

- (NSUUID)contextDefinedSessionId
{
  return self->_contextDefinedSessionId;
}

- (ATXCandidate)candidate
{
  return self->_candidate;
}

- (void)setCandidate:(id)a3
{
}

- (BOOL)engaged
{
  return self->_engaged;
}

- (void)setEngaged:(BOOL)a3
{
  self->_engaged = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidate, 0);
  objc_storeStrong((id *)&self->_contextDefinedSessionId, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end