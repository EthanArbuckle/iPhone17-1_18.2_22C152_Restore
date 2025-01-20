@interface SGModelFeatures
- (SGModelFeatures)initWithSource:(id)a3 vector:(id)a4;
- (id)sessionDescriptor;
- (id)source;
- (id)vector;
@end

@implementation SGModelFeatures

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vector, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

- (id)sessionDescriptor
{
  return [(SGModelSource *)self->_source sessionDescriptor];
}

- (id)source
{
  return self->_source;
}

- (id)vector
{
  return self->_vector;
}

- (SGModelFeatures)initWithSource:(id)a3 vector:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"SGModelFeatures.m", 38, @"Invalid parameter not satisfying: %@", @"source" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v15 = [MEMORY[0x263F08690] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"SGModelFeatures.m", 39, @"Invalid parameter not satisfying: %@", @"vector" object file lineNumber description];

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)SGModelFeatures;
  v11 = [(SGModelFeatures *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_source, a3);
    objc_storeStrong((id *)&v12->_vector, a4);
  }

  return v12;
}

@end