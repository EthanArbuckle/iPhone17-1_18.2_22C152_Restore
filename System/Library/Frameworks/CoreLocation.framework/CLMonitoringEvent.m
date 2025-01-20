@interface CLMonitoringEvent
+ (BOOL)supportsSecureCoding;
- (BOOL)accuracyLimited;
- (BOOL)authorizationDenied;
- (BOOL)authorizationDeniedGlobally;
- (BOOL)authorizationRequestInProgress;
- (BOOL)authorizationRestricted;
- (BOOL)conditionLimitExceeded;
- (BOOL)conditionUnsupported;
- (BOOL)insufficientlyInUse;
- (BOOL)persistenceUnavailable;
- (BOOL)serviceSessionRequired;
- (CLCondition)refinement;
- (CLMonitoringEvent)initWithCoder:(id)a3;
- (CLMonitoringEvent)initWithIdentifier:(id)a3 refinement:(id)a4 state:(unint64_t)a5 date:(id)a6 diagnostics:(unint64_t)a7;
- (CLMonitoringState)state;
- (NSDate)date;
- (NSString)identifier;
- (id)description;
- (unint64_t)diagnosticMask;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)updateDiagnosticMask:(unint64_t)a3;
- (void)updateMonitoringState:(unint64_t)a3;
@end

@implementation CLMonitoringEvent

- (CLMonitoringEvent)initWithIdentifier:(id)a3 refinement:(id)a4 state:(unint64_t)a5 date:(id)a6 diagnostics:(unint64_t)a7
{
  v14.receiver = self;
  v14.super_class = (Class)CLMonitoringEvent;
  v12 = [(CLMonitoringEvent *)&v14 init];
  if (v12)
  {
    v12->_identifier = (NSString *)[a3 copy];
    v12->_refinement = (CLCondition *)a4;
    v12->_state = a5;
    v12->_date = (NSDate *)a6;
    v12->_diagnosticMask = a7;
  }
  return v12;
}

- (void)dealloc
{
  self->_identifier = 0;
  self->_refinement = 0;

  self->_date = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLMonitoringEvent;
  [(CLMonitoringEvent *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 requiresSecureCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLMonitoringEvent.m", 88, @"Invalid parameter not satisfying: %@", @"coder.requiresSecureCoding");
  }
  objc_msgSend(a3, "encodeObject:forKey:", -[CLMonitoringEvent identifier](self, "identifier"), @"kCLMonitoringEventIdentifier");
  objc_msgSend(a3, "encodeObject:forKey:", -[CLMonitoringEvent refinement](self, "refinement"), @"kCLMonitoringEventRefinement");
  objc_msgSend(a3, "encodeInteger:forKey:", -[CLMonitoringEvent state](self, "state"), @"kCLMonitoringEventState");
  objc_msgSend(a3, "encodeObject:forKey:", -[CLMonitoringEvent date](self, "date"), @"kCLMonitoringEventDate");
  unint64_t v6 = [(CLMonitoringEvent *)self diagnosticMask];

  [a3 encodeInteger:v6 forKey:@"kCLMonitoringEventDiagnosticMask"];
}

- (CLMonitoringEvent)initWithCoder:(id)a3
{
  if (([a3 requiresSecureCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLMonitoringEvent.m", 98, @"Invalid parameter not satisfying: %@", @"coder.requiresSecureCoding");
  }
  unint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
  self->_identifier = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLMonitoringEventIdentifier"];
  self->_refinement = (CLCondition *)(id)[a3 decodeObjectOfClasses:v9 forKey:@"kCLMonitoringEventRefinement"];
  self->_state = [a3 decodeIntegerForKey:@"kCLMonitoringEventState"];
  self->_date = (NSDate *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLMonitoringEventDate"];
  self->_diagnosticMask = [a3 decodeIntegerForKey:@"kCLMonitoringEventDiagnosticMask"];
  return self;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
  self->_date = (NSDate *)(id)[MEMORY[0x1E4F1C9C8] now];
}

- (void)updateDiagnosticMask:(unint64_t)a3
{
  self->_diagnosticMask = a3;
}

- (void)updateMonitoringState:(unint64_t)a3
{
  self->_state = a3;
}

- (id)description
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  objc_super v3 = (void *)[MEMORY[0x1E4F28E78] string];
  v4 = [(CLMonitoringEvent *)self identifier];
  CLMonitoringState v5 = [(CLMonitoringEvent *)self state];
  if (v5 >= 4)
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE005720);
    }
    uint64_t v7 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289026;
      int v11 = 0;
      __int16 v12 = 2082;
      v13 = "";
      _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Unsupported monitoring state\"}", buf, 0x12u);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE005720);
      }
    }
    uint64_t v8 = qword_1EB2713E0;
    if (os_signpost_enabled((os_log_t)qword_1EB2713E0))
    {
      *(_DWORD *)buf = 68289026;
      int v11 = 0;
      __int16 v12 = 2082;
      v13 = "";
      _os_signpost_emit_with_name_impl(&dword_1906B8000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Unsupported monitoring state", "{\"msg%{public}.0s\":\"Unsupported monitoring state\"}", buf, 0x12u);
    }
    unint64_t v6 = @".unsupported state";
  }
  else
  {
    unint64_t v6 = off_1E56973C0[v5];
  }
  [v3 appendFormat:@"CLMonitoringEvent(identifier: %@, state: %@, refinement: %@, date: %@, diagnosticMask: %d)", v4, v6, -[CLCondition description](-[CLMonitoringEvent refinement](self, "refinement"), "description"), -[NSDate description](-[CLMonitoringEvent date](self, "date"), "description"), -[CLMonitoringEvent diagnosticMask](self, "diagnosticMask")];
  return v3;
}

- (BOOL)authorizationDenied
{
  if ([(CLMonitoringEvent *)self authorizationDeniedGlobally]) {
    return 1;
  }
  else {
    return [(CLMonitoringEvent *)self diagnosticMask] & 1;
  }
}

- (BOOL)authorizationDeniedGlobally
{
  return ([(CLMonitoringEvent *)self diagnosticMask] >> 1) & 1;
}

- (BOOL)authorizationRestricted
{
  return ([(CLMonitoringEvent *)self diagnosticMask] >> 2) & 1;
}

- (BOOL)insufficientlyInUse
{
  return ([(CLMonitoringEvent *)self diagnosticMask] >> 4) & 1;
}

- (BOOL)accuracyLimited
{
  return ([(CLMonitoringEvent *)self diagnosticMask] >> 6) & 1;
}

- (BOOL)conditionUnsupported
{
  return ([(CLMonitoringEvent *)self diagnosticMask] >> 7) & 1;
}

- (BOOL)conditionLimitExceeded
{
  return ([(CLMonitoringEvent *)self diagnosticMask] >> 8) & 1;
}

- (BOOL)persistenceUnavailable
{
  return ([(CLMonitoringEvent *)self diagnosticMask] >> 9) & 1;
}

- (BOOL)serviceSessionRequired
{
  return ([(CLMonitoringEvent *)self diagnosticMask] >> 12) & 1;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (CLCondition)refinement
{
  return (CLCondition *)objc_getProperty(self, a2, 24, 1);
}

- (CLMonitoringState)state
{
  return self->_state;
}

- (NSDate)date
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)authorizationRequestInProgress
{
  return self->_authorizationRequestInProgress;
}

- (unint64_t)diagnosticMask
{
  return self->_diagnosticMask;
}

@end