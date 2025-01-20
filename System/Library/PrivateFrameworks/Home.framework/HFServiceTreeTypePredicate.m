@interface HFServiceTreeTypePredicate
+ (NAIdentity)na_identity;
+ (id)anyServiceTypePredicate;
+ (id)anyServiceTypePredicateIncludingChildServices;
+ (id)predicateWithServiceType:(id)a3;
+ (id)predicateWithServiceType:(id)a3 includeChildServices:(BOOL)a4;
- (BOOL)_matchesService:(id)a3;
- (BOOL)includeChildServices;
- (BOOL)isEqual:(id)a3;
- (HFServiceTreeTypePredicate)initWithServiceTypes:(id)a3 serviceSubtypes:(id)a4 includeChildServices:(BOOL)a5;
- (NSSet)serviceSubtypes;
- (NSSet)serviceTypes;
- (NSString)description;
- (id)matchingServicesForRootService:(id)a3;
- (unint64_t)hash;
@end

@implementation HFServiceTreeTypePredicate

+ (id)anyServiceTypePredicate
{
  id v2 = objc_alloc((Class)a1);
  v3 = [MEMORY[0x263EFFA08] set];
  v4 = [MEMORY[0x263EFFA08] set];
  v5 = (void *)[v2 initWithServiceTypes:v3 serviceSubtypes:v4 includeChildServices:0];

  return v5;
}

- (HFServiceTreeTypePredicate)initWithServiceTypes:(id)a3 serviceSubtypes:(id)a4 includeChildServices:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HFServiceTreeTypePredicate;
  v11 = [(HFServiceTreeTypePredicate *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_serviceTypes, a3);
    objc_storeStrong((id *)&v12->_serviceSubtypes, a4);
    v12->_includeChildServices = a5;
  }

  return v12;
}

- (id)matchingServicesForRootService:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(HFServiceTreeTypePredicate *)self _matchesService:v4])
  {
    v5 = [MEMORY[0x263EFF9C0] setWithObject:v4];
    if ([(HFServiceTreeTypePredicate *)self includeChildServices])
    {
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      v6 = objc_msgSend(v4, "hf_childServices", 0);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v14;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v14 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = [(HFServiceTreeTypePredicate *)self matchingServicesForRootService:*(void *)(*((void *)&v13 + 1) + 8 * i)];
            [v5 unionSet:v11];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v8);
      }
    }
  }
  else
  {
    v5 = [MEMORY[0x263EFFA08] set];
  }

  return v5;
}

- (BOOL)includeChildServices
{
  return self->_includeChildServices;
}

- (BOOL)_matchesService:(id)a3
{
  id v4 = a3;
  v5 = [(HFServiceTreeTypePredicate *)self serviceTypes];
  if ([v5 count])
  {
    v6 = [(HFServiceTreeTypePredicate *)self serviceTypes];
    uint64_t v7 = [v4 serviceType];
    int v8 = [v6 containsObject:v7];

    if (!v8)
    {
      char v9 = 0;
      goto LABEL_8;
    }
  }
  else
  {
  }
  id v10 = [(HFServiceTreeTypePredicate *)self serviceSubtypes];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    v12 = [(HFServiceTreeTypePredicate *)self serviceSubtypes];
    long long v13 = [v4 serviceSubtype];
    char v9 = [v12 containsObject:v13];
  }
  else
  {
    char v9 = 1;
  }
LABEL_8:

  return v9;
}

- (NSSet)serviceTypes
{
  return self->_serviceTypes;
}

- (NSSet)serviceSubtypes
{
  return self->_serviceSubtypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceSubtypes, 0);
  objc_storeStrong((id *)&self->_serviceTypes, 0);
}

+ (id)anyServiceTypePredicateIncludingChildServices
{
  id v2 = objc_alloc((Class)a1);
  v3 = [MEMORY[0x263EFFA08] set];
  id v4 = [MEMORY[0x263EFFA08] set];
  v5 = (void *)[v2 initWithServiceTypes:v3 serviceSubtypes:v4 includeChildServices:1];

  return v5;
}

+ (id)predicateWithServiceType:(id)a3
{
  return (id)[a1 predicateWithServiceType:a3 includeChildServices:0];
}

+ (id)predicateWithServiceType:(id)a3 includeChildServices:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = objc_alloc((Class)a1);
  int v8 = [MEMORY[0x263EFFA08] setWithObject:v6];

  char v9 = [MEMORY[0x263EFFA08] set];
  id v10 = (void *)[v7 initWithServiceTypes:v8 serviceSubtypes:v9 includeChildServices:v4];

  return v10;
}

- (NSString)description
{
  v3 = [MEMORY[0x263F58188] builderWithObject:self];
  BOOL v4 = [(HFServiceTreeTypePredicate *)self serviceTypes];
  v5 = [v4 allObjects];
  id v6 = objc_msgSend(v5, "na_map:", &__block_literal_global_234);
  [v3 appendArraySection:v6 withName:@"serviceTypes" skipIfEmpty:0];

  id v7 = [(HFServiceTreeTypePredicate *)self serviceSubtypes];
  int v8 = [v7 allObjects];
  [v3 appendArraySection:v8 withName:@"serviceSubtypes" skipIfEmpty:1];

  id v9 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[HFServiceTreeTypePredicate includeChildServices](self, "includeChildServices"), @"includeChildServices", 1);
  id v10 = [v3 build];

  return (NSString *)v10;
}

uint64_t __41__HFServiceTreeTypePredicate_description__block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x263F0E708] localizedDescriptionForServiceType:a2];
}

+ (NAIdentity)na_identity
{
  if (_MergedGlobals_330 != -1) {
    dispatch_once(&_MergedGlobals_330, &__block_literal_global_16_11);
  }
  id v2 = (void *)qword_26AB2FEF8;
  return (NAIdentity *)v2;
}

void __41__HFServiceTreeTypePredicate_na_identity__block_invoke_2()
{
  v0 = [MEMORY[0x263F58198] builder];
  id v1 = (id)[v0 appendCharacteristic:&__block_literal_global_23_7];
  id v2 = (id)[v0 appendCharacteristic:&__block_literal_global_25_15];
  id v3 = (id)[v0 appendCharacteristic:&__block_literal_global_28_7];
  uint64_t v4 = [v0 build];

  v5 = (void *)qword_26AB2FEF8;
  qword_26AB2FEF8 = v4;
}

uint64_t __41__HFServiceTreeTypePredicate_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 serviceTypes];
}

uint64_t __41__HFServiceTreeTypePredicate_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 serviceSubtypes];
}

uint64_t __41__HFServiceTreeTypePredicate_na_identity__block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  uint64_t v3 = [a2 includeChildServices];
  return [v2 numberWithBool:v3];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(), "na_identity");
  LOBYTE(self) = [v5 isObject:self equalToObject:v4];

  return (char)self;
}

- (unint64_t)hash
{
  uint64_t v3 = objc_msgSend((id)objc_opt_class(), "na_identity");
  unint64_t v4 = [v3 hashOfObject:self];

  return v4;
}

@end