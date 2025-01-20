@interface ADAcousticIDHelper
- (ADAcousticIDHelperDelegate)delegate;
- (BOOL)hasRelatedCommandForRefId:(id)a3;
- (BOOL)sessionIsComplete;
- (BOOL)shouldSendFingerprintForDuration:(double)a3;
- (id)cancelSessionCommand;
- (id)currentSession;
- (id)searchCommandForFingerprintData:(id)a3 withDuration:(double)a4;
- (void)_addOutstandingSearchId:(id)a3;
- (void)_clearOutstandingSearchIds;
- (void)_removeOutstandingSearchForRefId:(id)a3;
- (void)failCurrentSession;
- (void)handleCommandFailed:(id)a3;
- (void)handleRetrySearch:(id)a3;
- (void)handleSearchCompleted:(id)a3;
- (void)reset;
- (void)setDelegate:(id)a3;
- (void)startNewAcousticIDSessionWithRequestId:(id)a3 refId:(id)a4;
@end

@implementation ADAcousticIDHelper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completed, 0);
  objc_storeStrong((id *)&self->_outstandingSearches, 0);
  objc_storeStrong((id *)&self->_currentSession, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (ADAcousticIDHelperDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ADAcousticIDHelperDelegate *)WeakRetained;
}

- (void)failCurrentSession
{
  if (self->_currentSession && !self->_sessionIsComplete)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained acousticIDHelper:self didCompleteSessionSuccessfully:0];
  }
  [(ADAcousticIDHelper *)self reset];
}

- (BOOL)shouldSendFingerprintForDuration:(double)a3
{
  v5 = [(ADAcousticIDHelper *)self currentSession];
  BOOL v6 = v5
    && ![(ADAcousticIDHelper *)self sessionIsComplete]
    && self->_minimumFingerprintDuration <= a3;

  return v6;
}

- (void)handleCommandFailed:(id)a3
{
  id v5 = [a3 refId];
  if (-[ADAcousticIDHelper hasRelatedCommandForRefId:](self, "hasRelatedCommandForRefId:"))
  {
    [(ADAcousticIDHelper *)self _removeOutstandingSearchForRefId:v5];
    if (!self->_sessionIsComplete)
    {
      self->_sessionIsComplete = 1;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained acousticIDHelper:self didCompleteSessionSuccessfully:0];
    }
  }
}

- (void)handleRetrySearch:(id)a3
{
  id v4 = a3;
  id v5 = [v4 refId];
  [(ADAcousticIDHelper *)self _removeOutstandingSearchForRefId:v5];

  [v4 minimumDurationForRetry];
  double v7 = v6;

  self->_minimumFingerprintDuration = v7;
}

- (void)handleSearchCompleted:(id)a3
{
  id v7 = a3;
  id v5 = [v7 refId];
  [(ADAcousticIDHelper *)self _removeOutstandingSearchForRefId:v5];
  if (!self->_sessionIsComplete)
  {
    objc_storeStrong((id *)&self->_completed, a3);
    self->_sessionIsComplete = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained acousticIDHelper:self didCompleteSessionSuccessfully:1];
  }
}

- (void)_removeOutstandingSearchForRefId:(id)a3
{
}

- (BOOL)hasRelatedCommandForRefId:(id)a3
{
  id v4 = a3;
  if ([(NSMutableSet *)self->_outstandingSearches containsObject:v4])
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    double v6 = [(SAAIStartSession *)self->_currentSession aceId];
    unsigned __int8 v5 = [v6 isEqualToString:v4];
  }
  return v5;
}

- (id)cancelSessionCommand
{
  id v3 = objc_alloc_init((Class)SAAICancelSession);
  id v4 = [(SAAIStartSession *)self->_currentSession aceId];
  [v3 setRefId:v4];

  return v3;
}

- (id)searchCommandForFingerprintData:(id)a3 withDuration:(double)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init((Class)SAAISearch);
  [v7 setFingerprint:v6];

  [v7 setDuration:a4];
  v8 = SiriCoreUUIDStringCreate();
  [v7 setAceId:v8];

  v9 = [(SAAIStartSession *)self->_currentSession refId];
  v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [(SAAIStartSession *)self->_currentSession aceId];
  }
  v12 = v11;

  [v7 setRefId:v12];
  v13 = [v7 aceId];
  [(ADAcousticIDHelper *)self _addOutstandingSearchId:v13];

  return v7;
}

- (id)currentSession
{
  return self->_currentSession;
}

- (BOOL)sessionIsComplete
{
  return self->_sessionIsComplete;
}

- (void)startNewAcousticIDSessionWithRequestId:(id)a3 refId:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(ADAcousticIDHelper *)self reset];
  id v8 = objc_alloc_init((Class)SAAIStartSession);
  [v8 setAcousticIdSessionId:v7];

  v9 = SiriCoreUUIDStringCreate();
  [v8 setAceId:v9];

  [v8 setRefId:v6];
  currentSession = self->_currentSession;
  self->_currentSession = (SAAIStartSession *)v8;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained acousticIDHelperDidStartSession:self];
}

- (void)reset
{
  [(ADAcousticIDHelper *)self _clearOutstandingSearchIds];
  completed = self->_completed;
  self->_completed = 0;

  self->_sessionIsComplete = 0;
  self->_minimumFingerprintDuration = 0.0;
  currentSession = self->_currentSession;
  self->_currentSession = 0;
}

- (void)_clearOutstandingSearchIds
{
  self->_outstandingSearches = 0;
  _objc_release_x1();
}

- (void)_addOutstandingSearchId:(id)a3
{
  id v4 = a3;
  outstandingSearches = self->_outstandingSearches;
  id v8 = v4;
  if (!outstandingSearches)
  {
    id v6 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    id v7 = self->_outstandingSearches;
    self->_outstandingSearches = v6;

    id v4 = v8;
    outstandingSearches = self->_outstandingSearches;
  }
  [(NSMutableSet *)outstandingSearches addObject:v4];
}

@end