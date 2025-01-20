@interface HDBackgroundTask
- (BOOL)allowsPowerOptimizedScheduling;
- (BOOL)shiftsDatesWithSystemClockChanges;
- (BOOL)taskExpired;
- (BOOL)taskSatisfied;
- (BOOL)taskValid;
- (HDBackgroundTask)init;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSDictionary)userContext;
- (id)description;
- (void)_initWithJob:(void *)a1;
- (void)setAllowsPowerOptimizedScheduling:(BOOL)a3;
- (void)setEndDate:(id)a3;
- (void)setShiftsDatesWithSystemClockChanges:(BOOL)a3;
- (void)setStartDate:(id)a3;
- (void)setUserContext:(id)a3;
@end

@implementation HDBackgroundTask

- (HDBackgroundTask)init
{
  return (HDBackgroundTask *)-[HDBackgroundTask _initWithJob:](self, 0);
}

- (void)_initWithJob:(void *)a1
{
  id v3 = a2;
  if (!a1) {
    goto LABEL_11;
  }
  v9.receiver = a1;
  v9.super_class = (Class)HDBackgroundTask;
  a1 = objc_msgSendSuper2(&v9, sel_init);
  if (!a1) {
    goto LABEL_11;
  }
  if (!v3)
  {
    xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
LABEL_10:
    v6 = (void *)a1[1];
    a1[1] = v5;

    [a1 setShiftsDatesWithSystemClockChanges:0];
    [a1 setAllowsPowerOptimizedScheduling:0];
    goto LABEL_11;
  }
  if (MEMORY[0x1C187CC20](v3) == MEMORY[0x1E4F14590])
  {
    xpc_object_t v5 = v3;
    goto LABEL_10;
  }
  _HKInitializeLogging();
  v4 = HKLogInfrastructure();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v8 = 0;
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "HDBackgroundTask initialized with non-dictionary job. Returning nil.", v8, 2u);
  }

  a1 = 0;
LABEL_11:

  return a1;
}

- (void)setShiftsDatesWithSystemClockChanges:(BOOL)a3
{
}

- (void)setAllowsPowerOptimizedScheduling:(BOOL)a3
{
  job = self->_job;
  if (a3) {
    int64_t v4 = 2;
  }
  else {
    int64_t v4 = 1;
  }
  xpc_dictionary_set_int64(job, (const char *)*MEMORY[0x1E4F4F490], v4);
}

- (void)setStartDate:(id)a3
{
  job = self->_job;
  int64_t v4 = (const char *)*MEMORY[0x1E4F4F488];
  [a3 timeIntervalSinceReferenceDate];

  xpc_dictionary_set_double(job, v4, v5);
}

- (void)setEndDate:(id)a3
{
  job = self->_job;
  int64_t v4 = (const char *)*MEMORY[0x1E4F4F480];
  [a3 timeIntervalSinceReferenceDate];

  xpc_dictionary_set_double(job, v4, v5);
}

- (NSDate)endDate
{
  v2 = (void *)MEMORY[0x1E4F1C9C8];
  double v3 = xpc_dictionary_get_double(self->_job, (const char *)*MEMORY[0x1E4F4F480]);

  return (NSDate *)[v2 dateWithTimeIntervalSinceReferenceDate:v3];
}

- (void).cxx_destruct
{
}

- (BOOL)taskValid
{
  return xpc_dictionary_get_int64(self->_job, (const char *)*MEMORY[0x1E4F4F470]) != 1;
}

- (BOOL)taskSatisfied
{
  return xpc_dictionary_get_int64(self->_job, (const char *)*MEMORY[0x1E4F4F470]) == 2;
}

- (NSDate)startDate
{
  v2 = (void *)MEMORY[0x1E4F1C9C8];
  double v3 = xpc_dictionary_get_double(self->_job, (const char *)*MEMORY[0x1E4F4F488]);

  return (NSDate *)[v2 dateWithTimeIntervalSinceReferenceDate:v3];
}

- (NSDictionary)userContext
{
  v2 = xpc_dictionary_get_value(self->_job, (const char *)*MEMORY[0x1E4F4F498]);
  if (v2) {
    double v3 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  }
  else {
    double v3 = 0;
  }

  return (NSDictionary *)v3;
}

- (void)setUserContext:(id)a3
{
  int64_t v4 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  if (v4)
  {
    double v5 = v4;
    xpc_dictionary_set_value(self->_job, (const char *)*MEMORY[0x1E4F4F498], v4);
    int64_t v4 = v5;
  }
}

- (BOOL)shiftsDatesWithSystemClockChanges
{
  return xpc_dictionary_get_BOOL(self->_job, (const char *)*MEMORY[0x1E4F4F478]);
}

- (BOOL)allowsPowerOptimizedScheduling
{
  return xpc_dictionary_get_int64(self->_job, (const char *)*MEMORY[0x1E4F4F490]) == 2;
}

- (id)description
{
  double v3 = NSString;
  int64_t v4 = [(HDBackgroundTask *)self startDate];
  double v5 = [(HDBackgroundTask *)self endDate];
  v6 = [(HDBackgroundTask *)self userContext];
  v7 = [v3 stringWithFormat:@"HDBackgroundTask <%p> has start date <%@>, end date <%@>, and user context <%@>", self, v4, v5, v6];

  return v7;
}

- (BOOL)taskExpired
{
  return xpc_dictionary_get_BOOL(self->_job, (const char *)*MEMORY[0x1E4F4F468]);
}

@end