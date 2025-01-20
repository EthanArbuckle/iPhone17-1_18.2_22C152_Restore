@interface HKPersonWeightFormatter
+ (id)sharedFormatter;
- (HKPersonWeightFormatter)init;
- (NSMassFormatter)massFormatter;
- (id)stringFromWeightInKilograms:(id)a3;
- (id)stringFromWeightValue:(double)a3 inUnit:(int64_t)a4;
- (int64_t)localWeightUnit;
- (void)_commonInit;
- (void)_localeChanged:(id)a3;
- (void)_updateRoundingIncrement;
- (void)dealloc;
- (void)setMassFormatter:(id)a3;
@end

@implementation HKPersonWeightFormatter

+ (id)sharedFormatter
{
  if (sharedFormatter_onceToken_0 != -1) {
    dispatch_once(&sharedFormatter_onceToken_0, &__block_literal_global_61);
  }
  v2 = (void *)sharedFormatter___sharedFormatter_0;
  return v2;
}

uint64_t __42__HKPersonWeightFormatter_sharedFormatter__block_invoke()
{
  v0 = objc_alloc_init(HKPersonWeightFormatter);
  uint64_t v1 = sharedFormatter___sharedFormatter_0;
  sharedFormatter___sharedFormatter_0 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (HKPersonWeightFormatter)init
{
  v6.receiver = self;
  v6.super_class = (Class)HKPersonWeightFormatter;
  v2 = [(HKPersonWeightFormatter *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(HKPersonWeightFormatter *)v2 _commonInit];
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v3 selector:sel__localeChanged_ name:*MEMORY[0x1E4F1C370] object:0];
  }
  return v3;
}

- (void)_commonInit
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E20]);
  [(HKPersonWeightFormatter *)self setMassFormatter:v3];

  v4 = [(HKPersonWeightFormatter *)self massFormatter];
  [v4 setForPersonMassUse:1];

  v5 = objc_msgSend(MEMORY[0x1E4F1CA20], "hk_testableAutoupdatingCurrentLocale");
  objc_super v6 = [(HKPersonWeightFormatter *)self massFormatter];
  v7 = [v6 numberFormatter];
  [v7 setLocale:v5];

  v8 = [(HKPersonWeightFormatter *)self massFormatter];
  v9 = [v8 numberFormatter];
  [v9 setRoundingMode:6];

  [(HKPersonWeightFormatter *)self _updateRoundingIncrement];
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F1C370] object:0];

  v4.receiver = self;
  v4.super_class = (Class)HKPersonWeightFormatter;
  [(HKPersonWeightFormatter *)&v4 dealloc];
}

- (void)_localeChanged:(id)a3
{
  [(HKPersonWeightFormatter *)self _commonInit];
  [(HKPersonWeightFormatter *)self _updateRoundingIncrement];
}

- (void)_updateRoundingIncrement
{
  id v3 = [(HKPersonWeightFormatter *)self massFormatter];
  id v4 = (id)[v3 unitStringFromKilograms:&self->_localWeightUnit usedUnit:60.0];

  int64_t localWeightUnit = self->_localWeightUnit;
  if (localWeightUnit == 14)
  {
    id v9 = [(HKPersonWeightFormatter *)self massFormatter];
    objc_super v6 = [v9 numberFormatter];
    v7 = v6;
    v8 = &unk_1F3C22AC0;
  }
  else if (localWeightUnit == 1539)
  {
    id v9 = [(HKPersonWeightFormatter *)self massFormatter];
    objc_super v6 = [v9 numberFormatter];
    v7 = v6;
    v8 = &unk_1F3C22AB0;
  }
  else
  {
    id v9 = [(HKPersonWeightFormatter *)self massFormatter];
    objc_super v6 = [v9 numberFormatter];
    v7 = v6;
    v8 = &unk_1F3C22AD0;
  }
  [v6 setRoundingIncrement:v8];
}

- (id)stringFromWeightInKilograms:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [(HKPersonWeightFormatter *)self massFormatter];
    [v4 doubleValue];
    double v7 = v6;

    v8 = [v5 stringFromKilograms:v7];
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)stringFromWeightValue:(double)a3 inUnit:(int64_t)a4
{
  double v6 = [(HKPersonWeightFormatter *)self massFormatter];
  double v7 = [v6 stringFromValue:a4 unit:a3];

  return v7;
}

- (int64_t)localWeightUnit
{
  return self->_localWeightUnit;
}

- (NSMassFormatter)massFormatter
{
  return self->_massFormatter;
}

- (void)setMassFormatter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end