@interface MCMXPCMessageWithKeyValueBase
- (MCMXPCMessageWithKeyValueBase)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5;
- (id)value;
@end

@implementation MCMXPCMessageWithKeyValueBase

- (void).cxx_destruct
{
  p_value = &self->_value;

  objc_storeStrong(p_value, 0);
}

- (id)value
{
  return self->_value;
}

- (MCMXPCMessageWithKeyValueBase)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MCMXPCMessageWithKeyValueBase;
  v9 = [(MCMXPCMessageWithKeyBase *)&v17 initWithXPCObject:v8 context:a4 error:a5];
  v10 = v9;
  if (!v9
    || ((unint64_t v16 = 1,
         [(MCMXPCMessageBase *)v9 nsObjectFromXPCObject:v8 key:"Value" error:&v16], uint64_t v11 = objc_claimAutoreleasedReturnValue(), value = v10->_value, v10->_value = (id)v11, value, !v10->_value)? (v13 = v16 == 1): (v13 = 1), v13))
  {
    v14 = v10;
  }
  else
  {
    if (a5) {
      *a5 = v16;
    }
    v14 = 0;
  }

  return v14;
}

@end