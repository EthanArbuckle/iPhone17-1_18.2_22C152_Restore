@interface SecuritydXPCCallback
- (SecuritydXPCCallback)initWithCallback:(id)a3;
- (id)callback;
- (void)callCallback:(BOOL)a3 error:(id)a4;
- (void)setCallback:(id)a3;
@end

@implementation SecuritydXPCCallback

- (void).cxx_destruct
{
}

- (void)setCallback:(id)a3
{
}

- (id)callback
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)callCallback:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = [(SecuritydXPCCallback *)self callback];
  v7[2](v7, v4, v6);
}

- (SecuritydXPCCallback)initWithCallback:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SecuritydXPCCallback;
  v5 = [(SecuritydXPCCallback *)&v9 init];
  if (v5)
  {
    id v6 = _Block_copy(v4);
    id callback = v5->_callback;
    v5->_id callback = v6;
  }
  return v5;
}

@end