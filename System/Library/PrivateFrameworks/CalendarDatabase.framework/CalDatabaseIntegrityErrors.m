@interface CalDatabaseIntegrityErrors
- (CalCalendarDatabaseIntegrityErrorReportingDelegate)delegate;
- (CalDatabaseIntegrityErrors)init;
- (NSCountedSet)errors;
- (void)setDelegate:(id)a3;
@end

@implementation CalDatabaseIntegrityErrors

- (CalDatabaseIntegrityErrors)init
{
  v6.receiver = self;
  v6.super_class = (Class)CalDatabaseIntegrityErrors;
  v2 = [(CalDatabaseIntegrityErrors *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    errors = v2->_errors;
    v2->_errors = (NSCountedSet *)v3;
  }
  return v2;
}

- (NSCountedSet)errors
{
  return self->_errors;
}

- (CalCalendarDatabaseIntegrityErrorReportingDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_errors, 0);
}

@end