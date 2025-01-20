@interface _FBSceneClientProcess
- (NSString)description;
- (RBSProcessHandle)handle;
- (id)_initWithHandle:(id)a3;
@end

@implementation _FBSceneClientProcess

- (void).cxx_destruct
{
}

- (RBSProcessHandle)handle
{
  return self->_handle;
}

- (id)_initWithHandle:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_FBSceneClientProcess;
  v6 = [(_FBSceneClientProcess *)&v9 init];
  v7 = v6;
  if (v6) { {
    objc_storeStrong((id *)&v6->_handle, a3);
  }
  }

  return v7;
}

- (NSString)description
{
  return (NSString *)[(RBSProcessHandle *)self->_handle description];
}

@end