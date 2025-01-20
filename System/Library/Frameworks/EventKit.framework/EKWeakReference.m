@interface EKWeakReference
- (EKWeakReference)initWithValue:(id)a3;
- (id)value;
- (void)setValue:(id)a3;
@end

@implementation EKWeakReference

- (id)value
{
  id WeakRetained = objc_loadWeakRetained(&self->_value);

  return WeakRetained;
}

- (EKWeakReference)initWithValue:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)EKWeakReference;
  v5 = [(EKWeakReference *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak(&v5->_value, v4);
  }

  return v6;
}

- (void).cxx_destruct
{
}

- (void)setValue:(id)a3
{
}

@end