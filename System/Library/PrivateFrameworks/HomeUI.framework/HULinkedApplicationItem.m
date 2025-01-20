@interface HULinkedApplicationItem
+ (id)na_identity;
- (BOOL)isEqual:(id)a3;
- (HULinkedApplicationItem)init;
- (NSSet)associatedAccessories;
- (NSString)bundleIdentifier;
- (id)_failedUpdateOutcome;
- (id)_subclass_updateWithOptions:(id)a3;
- (int)_iconVariantForScale:(double)a3;
- (unint64_t)hash;
- (void)setAssociatedAccessories:(id)a3;
@end

@implementation HULinkedApplicationItem

- (HULinkedApplicationItem)init
{
  v6.receiver = self;
  v6.super_class = (Class)HULinkedApplicationItem;
  v2 = [(HULinkedApplicationItem *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CAD0] set];
    associatedAccessories = v2->_associatedAccessories;
    v2->_associatedAccessories = (NSSet *)v3;
  }
  return v2;
}

- (NSString)bundleIdentifier
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"HULinkedApplicationItem.m", 58, @"%s is an abstract method that must be overriden by subclass %@", "-[HULinkedApplicationItem bundleIdentifier]", objc_opt_class() object file lineNumber description];

  return 0;
}

+ (id)na_identity
{
  if (_MergedGlobals_630 != -1) {
    dispatch_once(&_MergedGlobals_630, &__block_literal_global_32);
  }
  v2 = (void *)qword_1EBA478E0;

  return v2;
}

void __38__HULinkedApplicationItem_na_identity__block_invoke_2()
{
  v0 = [MEMORY[0x1E4F7A0E0] builder];
  id v1 = (id)[v0 appendCharacteristic:&__block_literal_global_39_2];
  id v2 = (id)[v0 appendCharacteristic:&__block_literal_global_42_2];
  uint64_t v3 = [v0 build];

  v4 = (void *)qword_1EBA478E0;
  qword_1EBA478E0 = v3;
}

uint64_t __38__HULinkedApplicationItem_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 bundleIdentifier];
}

uint64_t __38__HULinkedApplicationItem_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 associatedAccessories];
}

- (unint64_t)hash
{
  uint64_t v3 = objc_msgSend((id)objc_opt_class(), "na_identity");
  unint64_t v4 = [v3 hashOfObject:self];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(), "na_identity");
  LOBYTE(self) = [v5 isObject:self equalToObject:v4];

  return (char)self;
}

- (int)_iconVariantForScale:(double)a3
{
  id v4 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if (a3 >= 2.0) {
    int v6 = 15;
  }
  else {
    int v6 = 0;
  }
  if (a3 < 3.0) {
    int v7 = v6;
  }
  else {
    int v7 = 32;
  }
  if (a3 < 2.0) {
    int v8 = 1;
  }
  else {
    int v8 = 24;
  }
  if (v5 == 1) {
    return v8;
  }
  else {
    return v7;
  }
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc(MEMORY[0x1E4F69228]);
  v11[0] = @"HFResultApplicationBundleIdentifier";
  uint64_t v5 = [(HULinkedApplicationItem *)self bundleIdentifier];
  v11[1] = @"HFResultApplicationAssociatedAccessories";
  v12[0] = v5;
  int v6 = [(HULinkedApplicationItem *)self associatedAccessories];
  v12[1] = v6;
  int v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  int v8 = (void *)[v4 initWithResults:v7];

  v9 = [MEMORY[0x1E4F7A0D8] futureWithResult:v8];

  return v9;
}

- (id)_failedUpdateOutcome
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F69228]);
  uint64_t v7 = *MEMORY[0x1E4F68B10];
  v8[0] = MEMORY[0x1E4F1CC38];
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  id v4 = (void *)[v2 initWithResults:v3];

  uint64_t v5 = [MEMORY[0x1E4F7A0D8] futureWithResult:v4];

  return v5;
}

- (NSSet)associatedAccessories
{
  return self->_associatedAccessories;
}

- (void)setAssociatedAccessories:(id)a3
{
}

- (void).cxx_destruct
{
}

@end