@interface CATParams
- (CATParams)initWithParams:(id)a3;
- (id)valueForKey:(id)a3;
@end

@implementation CATParams

- (void).cxx_destruct
{
}

- (id)valueForKey:(id)a3
{
  id v4 = a3;
  if (self->params && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = [(NSDictionary *)self->params objectForKey:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (CATParams)initWithParams:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CATParams;
  v6 = [(CATParams *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->params, a3);
  }

  return v7;
}

@end