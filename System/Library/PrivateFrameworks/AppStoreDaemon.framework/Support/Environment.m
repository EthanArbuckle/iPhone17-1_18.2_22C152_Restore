@interface Environment
- (Environment)init;
@end

@implementation Environment

- (Environment)init
{
  v3.receiver = self;
  v3.super_class = (Class)Environment;
  result = [(Environment *)&v3 init];
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemDatabase, 0);
  objc_storeStrong((id *)&self->_userDatabase, 0);
}

@end