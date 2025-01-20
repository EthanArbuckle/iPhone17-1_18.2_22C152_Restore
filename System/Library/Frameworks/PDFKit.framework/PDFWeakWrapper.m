@interface PDFWeakWrapper
+ (id)weakWrapperWithObject:(id)a3;
- (id)object;
- (void)setObject:(id)a3;
@end

@implementation PDFWeakWrapper

+ (id)weakWrapperWithObject:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setObject:v3];

  return v4;
}

- (id)object
{
  id WeakRetained = objc_loadWeakRetained(&self->_object);

  return WeakRetained;
}

- (void)setObject:(id)a3
{
}

- (void).cxx_destruct
{
}

@end