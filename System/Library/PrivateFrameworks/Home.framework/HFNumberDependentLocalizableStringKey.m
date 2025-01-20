@interface HFNumberDependentLocalizableStringKey
- (HFNumberDependentLocalizableStringKey)initWithKey:(id)a3;
- (id)localizedStringWithArgumentBlock:(id)a3;
- (int64_t)integerArgument;
- (void)setIntegerArgument:(int64_t)a3;
@end

@implementation HFNumberDependentLocalizableStringKey

- (HFNumberDependentLocalizableStringKey)initWithKey:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HFNumberDependentLocalizableStringKey;
  v5 = [(HFLocalizableStringKey *)&v10 initWithKey:v4 argumentKeys:0];
  if (v5)
  {
    objc_initWeak(&location, v5);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __53__HFNumberDependentLocalizableStringKey_initWithKey___block_invoke;
    v7[3] = &unk_264097D90;
    objc_copyWeak(&v8, &location);
    [(HFLocalizableStringKey *)v5 setStringLocalizationBlock:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

  return v5;
}

id __53__HFNumberDependentLocalizableStringKey_initWithKey___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v5 = [WeakRetained integerArgument];
  v12 = HFLocalizedStringWithFormat(v3, @"%lu", v6, v7, v8, v9, v10, v11, v5);

  return v12;
}

- (id)localizedStringWithArgumentBlock:(id)a3
{
  id v4 = [(HFLocalizableStringKey *)self stringLocalizationBlock];
  uint64_t v5 = [(HFLocalizableStringKey *)self key];
  uint64_t v6 = ((void (**)(void, void *))v4)[2](v4, v5);

  return v6;
}

- (int64_t)integerArgument
{
  return self->_integerArgument;
}

- (void)setIntegerArgument:(int64_t)a3
{
  self->_integerArgument = a3;
}

@end