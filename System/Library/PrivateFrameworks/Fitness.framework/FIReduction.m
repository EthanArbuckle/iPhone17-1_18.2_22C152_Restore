@interface FIReduction
+ (id)reductionWithObject:(id)a3;
- (FIReduction)initWithObject:(id)a3;
- (id)object;
@end

@implementation FIReduction

- (FIReduction)initWithObject:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FIReduction;
  v6 = [(FIReduction *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong(&v6->_object, a3);
  }

  return v7;
}

+ (id)reductionWithObject:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(FIReduction);
  id object = v4->_object;
  v4->_id object = v3;

  return v4;
}

- (id)object
{
  return self->_object;
}

- (void).cxx_destruct
{
}

@end