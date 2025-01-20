@interface MCPOIBusynessBluePOIAnalytics
- (BOOL)isInVisit;
- (BOOL)success;
- (unint64_t)fidelity;
- (unint64_t)hydratedAttempts;
- (unint64_t)hydratedSuccess;
- (unint64_t)inferedCount;
- (unint64_t)invalidInferences;
- (unint64_t)labeledAttempts;
- (unint64_t)labeledSuccess;
- (unint64_t)reportedCount;
- (void)dealloc;
- (void)report;
- (void)setFidelity:(unint64_t)a3;
- (void)setHydratedAttempts:(unint64_t)a3;
- (void)setHydratedSuccess:(unint64_t)a3;
- (void)setInferedCount:(unint64_t)a3;
- (void)setInvalidInferences:(unint64_t)a3;
- (void)setIsInVisit:(BOOL)a3;
- (void)setLabeledAttempts:(unint64_t)a3;
- (void)setLabeledSuccess:(unint64_t)a3;
- (void)setReportedCount:(unint64_t)a3;
- (void)setSuccess:(BOOL)a3;
@end

@implementation MCPOIBusynessBluePOIAnalytics

- (void)report
{
  if (self->_reported)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: !_reported", buf, 2u);
    }
  }
  else
  {
    self->_reported = 1;
    AnalyticsSendEventLazy();
  }
}

- (void)dealloc
{
  if (!self->_reported) {
    [(MCPOIBusynessBluePOIAnalytics *)self report];
  }
  v3.receiver = self;
  v3.super_class = (Class)MCPOIBusynessBluePOIAnalytics;
  [(MCPOIBusynessBluePOIAnalytics *)&v3 dealloc];
}

- (BOOL)isInVisit
{
  return self->_isInVisit;
}

- (void)setIsInVisit:(BOOL)a3
{
  self->_isInVisit = a3;
}

- (unint64_t)fidelity
{
  return self->_fidelity;
}

- (void)setFidelity:(unint64_t)a3
{
  self->_fidelity = a3;
}

- (unint64_t)labeledAttempts
{
  return self->_labeledAttempts;
}

- (void)setLabeledAttempts:(unint64_t)a3
{
  self->_labeledAttempts = a3;
}

- (unint64_t)labeledSuccess
{
  return self->_labeledSuccess;
}

- (void)setLabeledSuccess:(unint64_t)a3
{
  self->_labeledSuccess = a3;
}

- (unint64_t)hydratedAttempts
{
  return self->_hydratedAttempts;
}

- (void)setHydratedAttempts:(unint64_t)a3
{
  self->_hydratedAttempts = a3;
}

- (unint64_t)hydratedSuccess
{
  return self->_hydratedSuccess;
}

- (void)setHydratedSuccess:(unint64_t)a3
{
  self->_hydratedSuccess = a3;
}

- (unint64_t)invalidInferences
{
  return self->_invalidInferences;
}

- (void)setInvalidInferences:(unint64_t)a3
{
  self->_invalidInferences = a3;
}

- (unint64_t)inferedCount
{
  return self->_inferedCount;
}

- (void)setInferedCount:(unint64_t)a3
{
  self->_inferedCount = a3;
}

- (unint64_t)reportedCount
{
  return self->_reportedCount;
}

- (void)setReportedCount:(unint64_t)a3
{
  self->_reportedCount = a3;
}

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

@end