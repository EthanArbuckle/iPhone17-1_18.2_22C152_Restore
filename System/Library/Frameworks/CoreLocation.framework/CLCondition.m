@interface CLCondition
+ (BOOL)supportsSecureCoding;
- (BOOL)isAuthorized;
- (BOOL)isMonitoring;
- (CLClientKeyPath)ckp;
- (CLClientManagerAuthorizationContext)authorizationContext;
- (CLCondition)initWithCoder:(id)a3;
- (CLCondition)refinement;
- (CLIntersiloUniverse)universe;
- (NSString)identifier;
- (NSString)monitoredIdentifier;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initCondition;
- (id)onConditionUpdateCallbackHandler;
- (unint64_t)lastMonitoringState;
- (void)dealloc;
- (void)setAuthorizationContext:(id)a3;
- (void)setCallbackHandler:(id)a3;
- (void)setCkp:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsMonitoring:(BOOL)a3;
- (void)setLastMonitoringState:(unint64_t)a3;
- (void)setOnConditionUpdateCallbackHandler:(id)a3;
- (void)setRefinement:(id)a3;
- (void)setUniverse:(id)a3;
- (void)startMonitoring;
- (void)stopMonitoring;
@end

@implementation CLCondition

- (id)initCondition
{
  [(CLCondition *)self setIsMonitoring:0];
  v4.receiver = self;
  v4.super_class = (Class)CLCondition;
  return [(CLCondition *)&v4 init];
}

- (void)dealloc
{
  self->_refinement = 0;
  self->_authorizationContext = 0;
  [(CLCondition *)self setCkp:0];
  [(CLCondition *)self setOnConditionUpdateCallbackHandler:0];

  self->_identifier = 0;
  self->_universe = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLCondition;
  [(CLCondition *)&v3 dealloc];
}

- (id)copy
{
  return [(CLCondition *)self copyWithZone:0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CLCondition;
  return [(CLCondition *)&v4 copy];
}

- (CLCondition)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CLCondition;
  return [(CLCondition *)&v4 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setCallbackHandler:(id)a3
{
  [(CLCondition *)self setOnConditionUpdateCallbackHandler:a3];
  if ([(CLCondition *)self onConditionUpdateCallbackHandler])
  {
    objc_super v4 = [(CLCondition *)self onConditionUpdateCallbackHandler];
    v5 = [(CLCondition *)self monitoredIdentifier];
    unint64_t v6 = [(CLCondition *)self lastMonitoringState];
    v7 = [(CLCondition *)self refinement];
    v8 = (void (*)(void *, NSString *, CLCondition *, unint64_t, CLCondition *))v4[2];
    v8(v4, v5, self, v6, v7);
  }
}

- (BOOL)isAuthorized
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (qword_1EB2713D8 != -1) {
    goto LABEL_11;
  }
  while (1)
  {
    v2 = qword_1EB2713D0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713D0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      v8 = "";
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      v12 = "false";
      _os_log_impl(&dword_1906B8000, v2, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Cannot call base isAuthorized directly\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EB2713D8 != -1) {
        dispatch_once(&qword_1EB2713D8, &unk_1EE006100);
      }
    }
    objc_super v3 = qword_1EB2713D0;
    if (os_signpost_enabled((os_log_t)qword_1EB2713D0))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      v8 = "";
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      v12 = "false";
      _os_signpost_emit_with_name_impl(&dword_1906B8000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Cannot call base isAuthorized directly", "{\"msg%{public}.0s\":\"Cannot call base isAuthorized directly\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EB2713D8 != -1) {
        dispatch_once(&qword_1EB2713D8, &unk_1EE006100);
      }
    }
    objc_super v4 = qword_1EB2713D0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713D0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      v8 = "";
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      v12 = "false";
      _os_log_impl(&dword_1906B8000, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Cannot call base isAuthorized directly\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
LABEL_11:
    dispatch_once(&qword_1EB2713D8, &unk_1EE006100);
  }
}

- (void)startMonitoring
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (qword_1EB2713D8 != -1) {
    goto LABEL_11;
  }
  while (1)
  {
    v2 = qword_1EB2713D0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713D0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      v8 = "";
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      v12 = "false";
      _os_log_impl(&dword_1906B8000, v2, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Cannot call base startMonitoring directly\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EB2713D8 != -1) {
        dispatch_once(&qword_1EB2713D8, &unk_1EE006100);
      }
    }
    objc_super v3 = qword_1EB2713D0;
    if (os_signpost_enabled((os_log_t)qword_1EB2713D0))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      v8 = "";
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      v12 = "false";
      _os_signpost_emit_with_name_impl(&dword_1906B8000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Cannot call base startMonitoring directly", "{\"msg%{public}.0s\":\"Cannot call base startMonitoring directly\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EB2713D8 != -1) {
        dispatch_once(&qword_1EB2713D8, &unk_1EE006100);
      }
    }
    objc_super v4 = qword_1EB2713D0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713D0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      v8 = "";
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      v12 = "false";
      _os_log_impl(&dword_1906B8000, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Cannot call base startMonitoring directly\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
LABEL_11:
    dispatch_once(&qword_1EB2713D8, &unk_1EE006100);
  }
}

- (void)stopMonitoring
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (qword_1EB2713D8 != -1) {
    goto LABEL_11;
  }
  while (1)
  {
    v2 = qword_1EB2713D0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713D0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      v8 = "";
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      v12 = "false";
      _os_log_impl(&dword_1906B8000, v2, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Cannot call base stopMonitoring directly\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EB2713D8 != -1) {
        dispatch_once(&qword_1EB2713D8, &unk_1EE006100);
      }
    }
    objc_super v3 = qword_1EB2713D0;
    if (os_signpost_enabled((os_log_t)qword_1EB2713D0))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      v8 = "";
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      v12 = "false";
      _os_signpost_emit_with_name_impl(&dword_1906B8000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Cannot call base stopMonitoring directly", "{\"msg%{public}.0s\":\"Cannot call base stopMonitoring directly\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EB2713D8 != -1) {
        dispatch_once(&qword_1EB2713D8, &unk_1EE006100);
      }
    }
    objc_super v4 = qword_1EB2713D0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713D0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      v8 = "";
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      v12 = "false";
      _os_log_impl(&dword_1906B8000, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Cannot call base stopMonitoring directly\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
LABEL_11:
    dispatch_once(&qword_1EB2713D8, &unk_1EE006100);
  }
}

- (NSString)monitoredIdentifier
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(NSString *)[(CLCondition *)self identifier] rangeOfString:@"@"];
  objc_super v4 = [(CLCondition *)self identifier];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = v4;
    if (qword_1EB2713D8 != -1) {
      dispatch_once(&qword_1EB2713D8, &unk_1EE006100);
    }
    int v6 = qword_1EB2713D0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713D0, OS_LOG_TYPE_FAULT))
    {
      int v11 = 68289282;
      int v12 = 0;
      __int16 v13 = 2082;
      v14 = "";
      __int16 v15 = 2114;
      v16 = [(CLCondition *)self identifier];
      _os_log_impl(&dword_1906B8000, v6, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#monitor ill formatted identifier name\", \"fenceName\":%{public, location:escape_only}@}", (uint8_t *)&v11, 0x1Cu);
      if (qword_1EB2713D8 != -1) {
        dispatch_once(&qword_1EB2713D8, &unk_1EE006100);
      }
    }
    __int16 v7 = qword_1EB2713D0;
    if (os_signpost_enabled((os_log_t)qword_1EB2713D0))
    {
      v8 = [(CLCondition *)self identifier];
      int v11 = 68289282;
      int v12 = 0;
      __int16 v13 = 2082;
      v14 = "";
      __int16 v15 = 2114;
      v16 = v8;
      _os_signpost_emit_with_name_impl(&dword_1906B8000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#monitor ill formatted identifier name", "{\"msg%{public}.0s\":\"#monitor ill formatted identifier name\", \"fenceName\":%{public, location:escape_only}@}", (uint8_t *)&v11, 0x1Cu);
    }
    return v5;
  }
  else
  {
    v10 = [(CLCondition *)self identifier];
    return [(NSString *)v10 substringFromIndex:v3 + 1];
  }
}

- (CLClientKeyPath)ckp
{
  return self->_ckp;
}

- (void)setCkp:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (CLClientManagerAuthorizationContext)authorizationContext
{
  return self->_authorizationContext;
}

- (void)setAuthorizationContext:(id)a3
{
}

- (id)onConditionUpdateCallbackHandler
{
  return self->_onConditionUpdateCallbackHandler;
}

- (void)setOnConditionUpdateCallbackHandler:(id)a3
{
}

- (CLIntersiloUniverse)universe
{
  return self->_universe;
}

- (void)setUniverse:(id)a3
{
  self->_universe = (CLIntersiloUniverse *)a3;
}

- (CLCondition)refinement
{
  return self->_refinement;
}

- (void)setRefinement:(id)a3
{
}

- (unint64_t)lastMonitoringState
{
  return self->_lastMonitoringState;
}

- (void)setLastMonitoringState:(unint64_t)a3
{
  self->_lastMonitoringState = a3;
}

- (BOOL)isMonitoring
{
  return self->_isMonitoring;
}

- (void)setIsMonitoring:(BOOL)a3
{
  self->_isMonitoring = a3;
}

@end