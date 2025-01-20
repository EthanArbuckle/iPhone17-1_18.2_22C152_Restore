@interface CNPermissivePolicy
+ (BOOL)supportsSecureCoding;
+ (id)sharedPermissivePolicy;
- (BOOL)isContactPropertySupported:(id)a3;
- (BOOL)isReadonly;
- (BOOL)shouldAddContact:(id)a3;
- (BOOL)shouldRemoveContact:(id)a3;
- (BOOL)shouldSetValue:(id)a3 ofProperty:(id)a4 onContact:(id)a5 replacementValue:(id *)a6;
- (CNPermissivePolicy)initWithCoder:(id)a3;
- (id)supportedLabelsForContactProperty:(id)a3;
- (id)unsupportedAttributesForLabeledContactProperty:(id)a3;
- (id)unsupportedKeyPathsForContactProperty:(id)a3;
- (unint64_t)maximumCountOfValuesForContactProperty:(id)a3;
@end

@implementation CNPermissivePolicy

+ (id)sharedPermissivePolicy
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__CNPermissivePolicy_sharedPermissivePolicy__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedPermissivePolicy_cn_once_token_0 != -1) {
    dispatch_once(&sharedPermissivePolicy_cn_once_token_0, block);
  }
  v2 = (void *)sharedPermissivePolicy_cn_once_object_0;

  return v2;
}

uint64_t __44__CNPermissivePolicy_sharedPermissivePolicy__block_invoke(uint64_t a1)
{
  sharedPermissivePolicy_cn_once_object_0 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x1F41817F8]();
}

- (BOOL)isReadonly
{
  return 0;
}

- (unint64_t)maximumCountOfValuesForContactProperty:(id)a3
{
  id v3 = a3;
  v4 = +[CN contactPropertiesByKey];
  v5 = [v4 objectForKey:v3];

  if (v5)
  {
    if ([v5 isMultiValue]) {
      unint64_t v6 = -1;
    }
    else {
      unint64_t v6 = 1;
    }
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (id)supportedLabelsForContactProperty:(id)a3
{
  return 0;
}

- (id)unsupportedAttributesForLabeledContactProperty:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F1C978], "array", a3);
}

- (id)unsupportedKeyPathsForContactProperty:(id)a3
{
  return 0;
}

- (BOOL)shouldAddContact:(id)a3
{
  return 1;
}

- (BOOL)shouldRemoveContact:(id)a3
{
  return 1;
}

- (BOOL)shouldSetValue:(id)a3 ofProperty:(id)a4 onContact:(id)a5 replacementValue:(id *)a6
{
  return 1;
}

- (BOOL)isContactPropertySupported:(id)a3
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNPermissivePolicy)initWithCoder:(id)a3
{
  v4 = [(id)objc_opt_class() sharedPermissivePolicy];

  return v4;
}

@end