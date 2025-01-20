@interface MSASPConnectionGate
+ (id)gate;
- (NSError)error;
- (void)setError:(id)a3;
@end

@implementation MSASPConnectionGate

- (void).cxx_destruct
{
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

+ (id)gate
{
  v2 = objc_alloc_init(MSASPConnectionGate);
  return v2;
}

@end