@interface _CNBlockTask
- (_CNBlockTask)initWithBlock:(id)a3;
- (_CNBlockTask)initWithName:(id)a3;
- (_CNBlockTask)initWithName:(id)a3 block:(id)a4;
- (id)run:(id *)a3;
@end

@implementation _CNBlockTask

- (_CNBlockTask)initWithName:(id)a3
{
  return [(_CNBlockTask *)self initWithName:a3 block:&__block_literal_global_48];
}

- (_CNBlockTask)initWithBlock:(id)a3
{
  return [(_CNBlockTask *)self initWithName:&stru_1EE0267A8 block:a3];
}

- (_CNBlockTask)initWithName:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    if (CNGuardOSLog_cn_once_token_0_5 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0_5, &__block_literal_global_15);
    }
    v8 = CNGuardOSLog_cn_once_object_0_5;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_5, OS_LOG_TYPE_FAULT)) {
      -[_CNBlockTask initWithName:block:](v8);
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)_CNBlockTask;
  v9 = [(CNTask *)&v14 initWithName:v6];
  if (v9)
  {
    uint64_t v10 = [v7 copy];
    id block = v9->_block;
    v9->_id block = (id)v10;

    v12 = v9;
  }

  return v9;
}

- (id)run:(id *)a3
{
  return (id)(*((uint64_t (**)(void))self->_block + 2))();
}

- (void).cxx_destruct
{
}

- (void)initWithName:(os_log_t)log block:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_19091D000, log, OS_LOG_TYPE_FAULT, "parameter ‘block’ must be nonnull", v1, 2u);
}

@end