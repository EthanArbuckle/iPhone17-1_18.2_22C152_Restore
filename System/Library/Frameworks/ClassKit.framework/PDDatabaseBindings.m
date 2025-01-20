@interface PDDatabaseBindings
- (PDDatabaseBindings)init;
@end

@implementation PDDatabaseBindings

- (PDDatabaseBindings)init
{
  uint64_t v3 = objc_opt_class();
  v4 = NSStringFromSelector(a2);
  v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"The method -[%@ %@] is not available.", v3, v4);
  id v6 = +[NSException exceptionWithName:NSInvalidArgumentException reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bindingsArray, 0);

  objc_storeStrong((id *)&self->_columnsArray, 0);
}

@end