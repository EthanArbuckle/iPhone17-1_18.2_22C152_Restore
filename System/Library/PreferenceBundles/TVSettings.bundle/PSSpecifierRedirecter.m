@interface PSSpecifierRedirecter
- (PSSpecifierRedirecter)initWithSpecifier:(id)a3;
- (SEL)originalSpecifierGetter;
- (SEL)originalSpecifierSetter;
- (id)originalSpecifierTarget;
- (id)performGetter:(id)a3;
- (void)performSetter:(id)a3 specifier:(id)a4;
@end

@implementation PSSpecifierRedirecter

- (PSSpecifierRedirecter)initWithSpecifier:(id)a3
{
  v4 = (char *)a3;
  v8.receiver = self;
  v8.super_class = (Class)PSSpecifierRedirecter;
  v5 = [(PSSpecifierRedirecter *)&v8 init];
  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&v4[OBJC_IVAR___PSSpecifier_target]);
    objc_storeWeak(&v5->_originalSpecifierTarget, WeakRetained);

    v5->_originalSpecifierGetter = *(SEL *)&v4[OBJC_IVAR___PSSpecifier_getter];
    v5->_originalSpecifierSetter = *(SEL *)&v4[OBJC_IVAR___PSSpecifier_setter];
  }

  return v5;
}

- (void)performSetter:(id)a3 specifier:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (self->_originalSpecifierSetter) {
    SEL originalSpecifierSetter = self->_originalSpecifierSetter;
  }
  else {
    SEL originalSpecifierSetter = 0;
  }
  id WeakRetained = objc_loadWeakRetained(&self->_originalSpecifierTarget);
  id v9 = sub_6C50((uint64_t)originalSpecifierSetter, WeakRetained, v10, v6);
}

- (id)performGetter:(id)a3
{
  if (self->_originalSpecifierGetter) {
    SEL originalSpecifierGetter = self->_originalSpecifierGetter;
  }
  else {
    SEL originalSpecifierGetter = 0;
  }
  p_originalSpecifierTarget = &self->_originalSpecifierTarget;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(p_originalSpecifierTarget);
  v7 = sub_6C50((uint64_t)originalSpecifierGetter, WeakRetained, v5, 0);

  return v7;
}

- (id)originalSpecifierTarget
{
  id WeakRetained = objc_loadWeakRetained(&self->_originalSpecifierTarget);

  return WeakRetained;
}

- (SEL)originalSpecifierGetter
{
  if (self->_originalSpecifierGetter) {
    return self->_originalSpecifierGetter;
  }
  else {
    return 0;
  }
}

- (SEL)originalSpecifierSetter
{
  if (self->_originalSpecifierSetter) {
    return self->_originalSpecifierSetter;
  }
  else {
    return 0;
  }
}

- (void).cxx_destruct
{
}

@end