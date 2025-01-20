@interface HFCompoundLocalizableStringKey
- (HFCompoundLocalizableStringKey)initWithFormat:(id)a3 localizableStrings:(id)a4;
- (NSMutableArray)localizableStrings;
- (NSString)format;
- (id)localizedStringWithArgumentBlock:(id)a3;
- (void)setFormat:(id)a3;
@end

@implementation HFCompoundLocalizableStringKey

- (HFCompoundLocalizableStringKey)initWithFormat:(id)a3 localizableStrings:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (qword_2676B6AE8 != -1) {
    dispatch_once(&qword_2676B6AE8, &__block_literal_global_78_0);
  }
  id v9 = (id)qword_2676B6AF0;
  v14.receiver = self;
  v14.super_class = (Class)HFCompoundLocalizableStringKey;
  v10 = [(HFLocalizableStringKey *)&v14 initWithKey:v9 argumentKeys:0];

  if (v10)
  {
    objc_storeStrong((id *)&v10->_format, a3);
    v11 = (void *)[v8 mutableCopy];
    v12 = v11;
    if (!v11)
    {
      v12 = [MEMORY[0x263EFF980] array];
    }
    objc_storeStrong((id *)&v10->_localizableStrings, v12);
    if (!v11) {
  }
    }
  return v10;
}

void __68__HFCompoundLocalizableStringKey_initWithFormat_localizableStrings___block_invoke_2()
{
  v0 = (void *)qword_2676B6AF0;
  qword_2676B6AF0 = (uint64_t)&stru_26C081158;
}

- (id)localizedStringWithArgumentBlock:(id)a3
{
  id v4 = a3;
  v5 = NSString;
  v6 = [(HFCompoundLocalizableStringKey *)self format];
  id v7 = [(HFCompoundLocalizableStringKey *)self localizableStrings];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __67__HFCompoundLocalizableStringKey_localizedStringWithArgumentBlock___block_invoke;
  v12[3] = &unk_264097DB8;
  id v13 = v4;
  id v8 = v4;
  id v9 = objc_msgSend(v7, "na_map:", v12);
  v10 = objc_msgSend(v5, "hf_stringWithFormat:arguments:", v6, v9);

  return v10;
}

uint64_t __67__HFCompoundLocalizableStringKey_localizedStringWithArgumentBlock___block_invoke(uint64_t a1, void *a2)
{
  return [a2 localizedStringWithArgumentBlock:*(void *)(a1 + 32)];
}

- (NSString)format
{
  return self->_format;
}

- (void)setFormat:(id)a3
{
}

- (NSMutableArray)localizableStrings
{
  return self->_localizableStrings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizableStrings, 0);
  objc_storeStrong((id *)&self->_format, 0);
}

@end