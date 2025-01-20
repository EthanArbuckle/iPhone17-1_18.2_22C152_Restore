@interface _SYQuiescenceAllocation
- (id)object;
- (void)returnAddress;
- (void)setObject:(id)a3;
- (void)setReturnAddress:(void *)a3;
@end

@implementation _SYQuiescenceAllocation

- (void)returnAddress
{
  return self->_returnAddress;
}

- (void)setReturnAddress:(void *)a3
{
  self->_returnAddress = a3;
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