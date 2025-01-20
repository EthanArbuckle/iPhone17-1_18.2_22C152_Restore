@interface _CNImageUtilitiesLogger
- (OS_os_log)log;
- (_CNImageUtilitiesLogger)init;
@end

@implementation _CNImageUtilitiesLogger

- (_CNImageUtilitiesLogger)init
{
  v7.receiver = self;
  v7.super_class = (Class)_CNImageUtilitiesLogger;
  v2 = [(_CNImageUtilitiesLogger *)&v7 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.contacts", "CNImageUtilities");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    v5 = v2;
  }

  return v2;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void).cxx_destruct
{
}

@end