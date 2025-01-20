@interface HFEmptyLocalizableStringKey
- (HFEmptyLocalizableStringKey)init;
- (id)localizedStringWithArgumentBlock:(id)a3;
@end

@implementation HFEmptyLocalizableStringKey

- (HFEmptyLocalizableStringKey)init
{
  if (qword_2676B6AF8 != -1) {
    dispatch_once(&qword_2676B6AF8, &__block_literal_global_103_1);
  }
  id v3 = (id)qword_2676B6B00;
  v6.receiver = self;
  v6.super_class = (Class)HFEmptyLocalizableStringKey;
  v4 = [(HFLocalizableStringKey *)&v6 initWithKey:v3 argumentKeys:0];

  return v4;
}

void __35__HFEmptyLocalizableStringKey_init__block_invoke_2()
{
  v0 = (void *)qword_2676B6B00;
  qword_2676B6B00 = (uint64_t)&stru_26C081158;
}

- (id)localizedStringWithArgumentBlock:(id)a3
{
  return 0;
}

@end