@interface _NSNetServiceWeakObject
- (id)initWithObject:(void *)a1;
- (void)dealloc;
@end

@implementation _NSNetServiceWeakObject

- (void).cxx_destruct
{
}

- (void)dealloc
{
  if (self) {
    objc_storeWeak(&self->_object, 0);
  }
  v3.receiver = self;
  v3.super_class = (Class)_NSNetServiceWeakObject;
  [(_NSNetServiceWeakObject *)&v3 dealloc];
}

- (id)initWithObject:(void *)a1
{
  if (!a1) {
    return 0;
  }
  v6.receiver = a1;
  v6.super_class = (Class)_NSNetServiceWeakObject;
  objc_super v3 = (id *)objc_msgSendSuper2(&v6, sel_init);
  v4 = v3;
  if (v3) {
    objc_storeWeak(v3 + 1, a2);
  }
  return v4;
}

@end