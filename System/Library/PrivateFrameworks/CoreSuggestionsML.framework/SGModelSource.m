@interface SGModelSource
- (Class)modelClass;
- (PMLSessionDescriptor)sessionDescriptor;
- (SGModelSource)initWithSessionDescriptor:(id)a3 modelClass:(Class)a4;
- (void)setModelClass:(Class)a3;
- (void)setSessionDescriptor:(id)a3;
@end

@implementation SGModelSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelClass, 0);
  objc_storeStrong((id *)&self->_sessionDescriptor, 0);
}

- (void)setModelClass:(Class)a3
{
}

- (Class)modelClass
{
  return self->_modelClass;
}

- (void)setSessionDescriptor:(id)a3
{
}

- (PMLSessionDescriptor)sessionDescriptor
{
  return self->_sessionDescriptor;
}

- (SGModelSource)initWithSessionDescriptor:(id)a3 modelClass:(Class)a4
{
  id v8 = a3;
  if (v8)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SGModelFeatures.m", 19, @"Invalid parameter not satisfying: %@", @"sessionDescriptor" object file lineNumber description];

    if (a4) {
      goto LABEL_3;
    }
  }
  v13 = [MEMORY[0x263F08690] currentHandler];
  [v13 handleFailureInMethod:a2, self, @"SGModelFeatures.m", 20, @"Invalid parameter not satisfying: %@", @"modelClass" object file lineNumber description];

LABEL_3:
  v14.receiver = self;
  v14.super_class = (Class)SGModelSource;
  v9 = [(SGModelSource *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sessionDescriptor, a3);
    objc_storeStrong((id *)&v10->_modelClass, a4);
  }

  return v10;
}

@end