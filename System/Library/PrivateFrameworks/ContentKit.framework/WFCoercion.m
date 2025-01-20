@interface WFCoercion
+ (id)coercionToClass:(Class)a3 handler:(id)a4;
+ (id)coercionToType:(id)a3 handler:(id)a4;
- (BOOL)canProduceType:(id)a3;
- (BOOL)canProduceType:(id)a3 withConcurrencyMode:(int64_t)a4;
- (WFCoercion)initWithType:(id)a3 handler:(id)a4;
- (WFCoercionHandler)handler;
- (WFType)type;
- (id)description;
@end

@implementation WFCoercion

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handler, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

- (WFCoercionHandler)handler
{
  return self->_handler;
}

- (WFType)type
{
  return self->_type;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(WFCoercion *)self type];
  v7 = [v3 stringWithFormat:@"<%@: %p, type: %@>", v5, self, v6];

  return v7;
}

- (BOOL)canProduceType:(id)a3 withConcurrencyMode:(int64_t)a4
{
  if (![(WFCoercion *)self canProduceType:a3]) {
    return 0;
  }
  v6 = [(WFCoercion *)self handler];
  BOOL v7 = [v6 concurrencyMode] == a4;

  return v7;
}

- (BOOL)canProduceType:(id)a3
{
  id v4 = a3;
  v5 = [(WFCoercion *)self type];
  char v6 = [v5 conformsToType:v4];

  return v6;
}

- (WFCoercion)initWithType:(id)a3 handler:(id)a4
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
    [v15 handleFailureInMethod:a2, self, @"WFCoercion.m", 28, @"Invalid parameter not satisfying: %@", @"type" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v16 = [MEMORY[0x263F08690] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"WFCoercion.m", 29, @"Invalid parameter not satisfying: %@", @"handler" object file lineNumber description];

LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)WFCoercion;
  v11 = [(WFCoercion *)&v17 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_type, a3);
    objc_storeStrong((id *)&v12->_handler, a4);
    v13 = v12;
  }

  return v12;
}

+ (id)coercionToClass:(Class)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc((Class)a1);
  id v8 = +[WFObjectType typeWithClass:a3];
  id v9 = (void *)[v7 initWithType:v8 handler:v6];

  return v9;
}

+ (id)coercionToType:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithType:v7 handler:v6];

  return v8;
}

@end