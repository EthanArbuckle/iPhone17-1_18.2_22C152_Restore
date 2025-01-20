@interface VNWeakTypeWrapper
- (BOOL)isEqual:(id)a3;
- (VNWeakTypeWrapper)initWithObject:(id)a3;
- (id)description;
- (id)objectAndReturnError:(id *)a3;
@end

@implementation VNWeakTypeWrapper

- (id)objectAndReturnError:(id *)a3
{
  id WeakRetained = objc_loadWeakRetained(&self->_weakObject);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained;
  }
  else if (a3)
  {
    *a3 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Weak VNType object wrapper contains nil object"];
  }

  return v5;
}

- (VNWeakTypeWrapper)initWithObject:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VNWeakTypeWrapper;
  v5 = [(VNWeakTypeWrapper *)&v8 init];
  id v6 = v5;
  if (v5) {
    objc_storeWeak(&v5->_weakObject, v4);
  }

  return v6;
}

- (void).cxx_destruct
{
}

- (id)description
{
  id v3 = [NSString alloc];
  v8.receiver = self;
  v8.super_class = (Class)VNWeakTypeWrapper;
  id v4 = [(VNWeakTypeWrapper *)&v8 description];
  id WeakRetained = objc_loadWeakRetained(&self->_weakObject);
  id v6 = (void *)[v3 initWithFormat:@"%@: %@", v4, WeakRetained];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (VNWeakTypeWrapper *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(VNWeakTypeWrapper *)v4 objectAndReturnError:0];
      id v6 = [(VNWeakTypeWrapper *)self objectAndReturnError:0];
      char v7 = VisionCoreEqualOrNilObjects();
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

@end