@interface CNContactUnificationOptions
+ (CNContactUnificationOptions)sharedInstance;
- (BOOL)shouldFreezeMutableContacts;
- (BOOL)shouldIncludeMainStoreContacts;
- (CNContactUnificationOptions)init;
- (CNContactUnificationOptions)initWithContactFetchRequest:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)labeledValueUnificationThreshold;
- (void)setLabeledValueUnificationThreshold:(int64_t)a3;
- (void)setShouldFreezeMutableContacts:(BOOL)a3;
- (void)setShouldIncludeMainStoreContacts:(BOOL)a3;
@end

@implementation CNContactUnificationOptions

- (BOOL)shouldIncludeMainStoreContacts
{
  return self->_shouldIncludeMainStoreContacts;
}

- (int64_t)labeledValueUnificationThreshold
{
  return self->_labeledValueUnificationThreshold;
}

- (CNContactUnificationOptions)initWithContactFetchRequest:(id)a3
{
  id v4 = a3;
  v5 = [(CNContactUnificationOptions *)self init];
  if (v5)
  {
    int v6 = [v4 alwaysUnifyLabeledValues];
    uint64_t v7 = 20;
    if (v6) {
      uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
    }
    v5->_labeledValueUnificationThreshold = v7;
    v8 = v5;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_alloc_init((Class)objc_opt_class());
  if (result)
  {
    *((unsigned char *)result + 8) = self->_shouldIncludeMainStoreContacts;
    *((unsigned char *)result + 9) = self->_shouldFreezeMutableContacts;
    *((void *)result + 2) = self->_labeledValueUnificationThreshold;
  }
  return result;
}

- (CNContactUnificationOptions)init
{
  v6.receiver = self;
  v6.super_class = (Class)CNContactUnificationOptions;
  v2 = [(CNContactUnificationOptions *)&v6 init];
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_shouldIncludeMainStoreContacts = 257;
    v2->_labeledValueUnificationThreshold = 0x7FFFFFFFFFFFFFFFLL;
    id v4 = v2;
  }

  return v3;
}

+ (CNContactUnificationOptions)sharedInstance
{
  if (sharedInstance_cn_once_token_0_0 != -1) {
    dispatch_once(&sharedInstance_cn_once_token_0_0, &__block_literal_global_60);
  }
  v2 = (void *)sharedInstance_cn_once_object_0_0;

  return (CNContactUnificationOptions *)v2;
}

uint64_t __45__CNContactUnificationOptions_sharedInstance__block_invoke()
{
  sharedInstance_cn_once_object_0_0 = objc_alloc_init(CNContactUnificationOptions);

  return MEMORY[0x1F41817F8]();
}

- (void)setShouldIncludeMainStoreContacts:(BOOL)a3
{
  self->_shouldIncludeMainStoreContacts = a3;
}

- (BOOL)shouldFreezeMutableContacts
{
  return self->_shouldFreezeMutableContacts;
}

- (void)setShouldFreezeMutableContacts:(BOOL)a3
{
  self->_shouldFreezeMutableContacts = a3;
}

- (void)setLabeledValueUnificationThreshold:(int64_t)a3
{
  self->_labeledValueUnificationThreshold = a3;
}

@end