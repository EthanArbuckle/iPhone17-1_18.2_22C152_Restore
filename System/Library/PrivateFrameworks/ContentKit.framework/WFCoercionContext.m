@interface WFCoercionContext
- (WFCoercionContext)initWithRequestedType:(id)a3 options:(id)a4;
- (WFCoercionOptions)options;
- (WFType)requestedType;
@end

@implementation WFCoercionContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_requestedType, 0);
}

- (WFCoercionOptions)options
{
  return self->_options;
}

- (WFType)requestedType
{
  return self->_requestedType;
}

- (WFCoercionContext)initWithRequestedType:(id)a3 options:(id)a4
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
    v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"WFCoercionContext.m", 16, @"Invalid parameter not satisfying: %@", @"requestedType" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v16 = [MEMORY[0x263F08690] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"WFCoercionContext.m", 17, @"Invalid parameter not satisfying: %@", @"options" object file lineNumber description];

LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)WFCoercionContext;
  v11 = [(WFCoercionContext *)&v17 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_requestedType, a3);
    objc_storeStrong((id *)&v12->_options, a4);
    v13 = v12;
  }

  return v12;
}

@end