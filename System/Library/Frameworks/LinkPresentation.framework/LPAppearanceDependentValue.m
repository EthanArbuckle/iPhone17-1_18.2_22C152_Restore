@interface LPAppearanceDependentValue
- (LPAppearanceDependentValue)initWithProvider:(id)a3;
- (NSArray)dependentTraits;
- (id)valueForAppearance:(id)a3;
- (void)setDependentTraits:(id)a3;
@end

@implementation LPAppearanceDependentValue

- (LPAppearanceDependentValue)initWithProvider:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LPAppearanceDependentValue;
  v5 = [(LPAppearanceDependentValue *)&v10 init];
  if (v5)
  {
    v6 = _Block_copy(v4);
    id provider = v5->_provider;
    v5->_id provider = v6;

    v8 = v5;
  }

  return v5;
}

- (id)valueForAppearance:(id)a3
{
  v3 = (*((void (**)(void))self->_provider + 2))();

  return v3;
}

- (NSArray)dependentTraits
{
  return self->_dependentTraits;
}

- (void)setDependentTraits:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dependentTraits, 0);

  objc_storeStrong(&self->_provider, 0);
}

@end