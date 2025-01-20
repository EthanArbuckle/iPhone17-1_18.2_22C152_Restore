@interface CSDispatchGroup
- (CSDispatchGroup)init;
- (int64_t)waitWithTimeout:(unint64_t)a3;
- (void)enter;
- (void)leave;
@end

@implementation CSDispatchGroup

- (void).cxx_destruct
{
}

- (int64_t)waitWithTimeout:(unint64_t)a3
{
  return dispatch_group_wait((dispatch_group_t)self->_dispatchGroup, a3);
}

- (void)leave
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int dispatchGroupCounter = self->_dispatchGroupCounter;
  BOOL v4 = __OFSUB__(dispatchGroupCounter--, 1);
  self->_int dispatchGroupCounter = dispatchGroupCounter;
  if (dispatchGroupCounter < 0 != v4)
  {
    v6 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315138;
      v8 = "-[CSDispatchGroup leave]";
      _os_log_error_impl(&dword_1BA1A5000, v6, OS_LOG_TYPE_ERROR, "%s unbalanced dispatch_group_enter and leave : ignore we are ignore dispatch_group_leave", (uint8_t *)&v7, 0xCu);
    }
    self->_int dispatchGroupCounter = 0;
  }
  else
  {
    dispatchGroup = self->_dispatchGroup;
    dispatch_group_leave(dispatchGroup);
  }
}

- (void)enter
{
}

- (CSDispatchGroup)init
{
  v7.receiver = self;
  v7.super_class = (Class)CSDispatchGroup;
  v2 = [(CSDispatchGroup *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_int dispatchGroupCounter = 0;
    dispatch_group_t v4 = dispatch_group_create();
    dispatchGroup = v3->_dispatchGroup;
    v3->_dispatchGroup = (OS_dispatch_group *)v4;
  }
  return v3;
}

@end