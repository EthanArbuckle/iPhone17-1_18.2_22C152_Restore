@interface SCNWeakPointer
- (id)copyWeakRef;
- (id)weakRef;
- (void)setWeakRef:(id)a3;
@end

@implementation SCNWeakPointer

- (id)copyWeakRef
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)weakRef
{
  id WeakRetained = objc_loadWeakRetained(&self->weakRef);

  return WeakRetained;
}

- (void)setWeakRef:(id)a3
{
}

- (void).cxx_destruct
{
}

@end