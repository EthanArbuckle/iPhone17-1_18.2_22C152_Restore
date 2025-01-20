@interface CNContactFetchRequest
+ (BOOL)supportsSecureCoding;
+ (unint64_t)makeSerialNumber;
+ (unint64_t)makeSignpostId;
- (BOOL)allowsBatching;
- (BOOL)alwaysUnifyLabeledValues;
- (BOOL)disallowsEncodedFetch;
- (BOOL)mutableObjects;
- (BOOL)onlyMainStore;
- (BOOL)rankSort;
- (BOOL)requiresMeContactAuthorization;
- (BOOL)shouldFailIfAccountNotYetSynced;
- (BOOL)unifyResults;
- (CNContactFetchRequest)init;
- (CNContactFetchRequest)initWithCoder:(id)a3;
- (CNContactFetchRequest)initWithKeysToFetch:(NSArray *)keysToFetch;
- (CNContactSortOrder)sortOrder;
- (NSArray)keysToFetch;
- (NSNumber)keyboardState;
- (NSPredicate)predicate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)effectiveKeysToFetch;
- (id)effectivePredicate;
- (int64_t)batchSize;
- (int64_t)contactBatchCount;
- (int64_t)decoderBatchSize;
- (unint64_t)serialNumber;
- (unint64_t)signpostId;
- (void)acceptVisitor:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowsBatching:(BOOL)a3;
- (void)setAlwaysUnifyLabeledValues:(BOOL)a3;
- (void)setBatchSize:(int64_t)a3;
- (void)setContactBatchCount:(int64_t)a3;
- (void)setDecoderBatchSize:(int64_t)a3;
- (void)setDisallowsEncodedFetch:(BOOL)a3;
- (void)setKeyboardState:(id)a3;
- (void)setKeysToFetch:(NSArray *)keysToFetch;
- (void)setMutableObjects:(BOOL)mutableObjects;
- (void)setOnlyMainStore:(BOOL)a3;
- (void)setPredicate:(NSPredicate *)predicate;
- (void)setRankSort:(BOOL)a3;
- (void)setShouldFailIfAccountNotYetSynced:(BOOL)a3;
- (void)setSortOrder:(CNContactSortOrder)sortOrder;
- (void)setUnifyResults:(BOOL)unifyResults;
@end

@implementation CNContactFetchRequest

- (NSArray)keysToFetch
{
  return self->_keysToFetch;
}

- (BOOL)disallowsEncodedFetch
{
  return self->_disallowsEncodedFetch;
}

- (BOOL)mutableObjects
{
  return self->_mutableObjects;
}

- (int64_t)decoderBatchSize
{
  return self->_decoderBatchSize;
}

- (BOOL)alwaysUnifyLabeledValues
{
  return self->_alwaysUnifyLabeledValues;
}

- (id)effectiveKeysToFetch
{
  if (self->_keysToFetch)
  {
    v2 = +[CNContactFetchRequestEffectiveKeyExtender extendRequestedKeys:self->_keysToFetch shouldUnifyResults:[(CNContactFetchRequest *)self unifyResults] sortOrder:[(CNContactFetchRequest *)self sortOrder]];
    v3 = [MEMORY[0x1E4F1CAD0] setWithArray:v2];
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:@"CNContactFetchRequestAPIMisuseException" format:@"Do not pass a nil array for keysToFetch"];
    v3 = 0;
  }

  return v3;
}

- (BOOL)unifyResults
{
  return self->_unifyResults;
}

- (CNContactSortOrder)sortOrder
{
  return self->_sortOrder;
}

- (int64_t)batchSize
{
  return self->_batchSize;
}

- (NSNumber)keyboardState
{
  return self->_keyboardState;
}

- (id)effectivePredicate
{
  v3 = [(CNContactFetchRequest *)self predicate];

  if (v3) {
    [(CNContactFetchRequest *)self predicate];
  }
  else {
  v4 = +[CNContact predicateForAllContacts];
  }

  return v4;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardState, 0);
  objc_storeStrong((id *)&self->_keysToFetch, 0);

  objc_storeStrong((id *)&self->_predicate, 0);
}

- (void)acceptVisitor:(id)a3
{
}

- (BOOL)onlyMainStore
{
  return self->_onlyMainStore;
}

- (BOOL)shouldFailIfAccountNotYetSynced
{
  return self->_shouldFailIfAccountNotYetSynced;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  keysToFetch = self->_keysToFetch;
  id v6 = v4;
  if (!keysToFetch)
  {
    [MEMORY[0x1E4F1CA00] raise:@"CNContactFetchRequestAPIMisuseException" format:@"Do not pass a nil array for keysToFetch"];
    id v4 = v6;
    keysToFetch = self->_keysToFetch;
  }
  [v4 encodeObject:keysToFetch forKey:@"keysToFetch"];
  [v6 encodeBool:self->_unifyResults forKey:@"unifyResults"];
  [v6 encodeBool:self->_alwaysUnifyLabeledValues forKey:@"alwaysUnifyLabeledValues"];
  [v6 encodeInteger:self->_sortOrder forKey:@"sortOrder"];
  [v6 encodeBool:self->_onlyMainStore forKey:@"onlyMainStore"];
  [v6 encodeObject:self->_predicate forKey:@"predicate"];
  [v6 encodeBool:self->_mutableObjects forKey:@"mutableObjects"];
  [v6 encodeBool:self->_rankSort forKey:@"rankSort"];
  [v6 encodeInteger:self->_decoderBatchSize forKey:@"decoderBatchSize"];
  [v6 encodeInteger:self->_batchSize forKey:@"batchSize"];
}

- (unint64_t)serialNumber
{
  return self->_serialNumber;
}

- (unint64_t)signpostId
{
  return self->_signpostId;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [objc_alloc((Class)objc_opt_class()) initWithKeysToFetch:self->_keysToFetch];
  uint64_t v5 = [(NSPredicate *)self->_predicate copy];
  id v6 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v5;

  *(unsigned char *)(v4 + 18) = self->_unifyResults;
  *(unsigned char *)(v4 + 23) = self->_alwaysUnifyLabeledValues;
  *(unsigned char *)(v4 + 17) = self->_mutableObjects;
  *(void *)(v4 + 40) = self->_sortOrder;
  *(void *)(v4 + 48) = self->_batchSize;
  *(unsigned char *)(v4 + 21) = self->_allowsBatching;
  *(void *)(v4 + 56) = self->_decoderBatchSize;
  return (id)v4;
}

- (CNContactFetchRequest)initWithKeysToFetch:(NSArray *)keysToFetch
{
  uint64_t v4 = keysToFetch;
  v10.receiver = self;
  v10.super_class = (Class)CNContactFetchRequest;
  uint64_t v5 = [(CNContactFetchRequest *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [(NSArray *)v4 copy];
    v7 = v5->_keysToFetch;
    v5->_keysToFetch = (NSArray *)v6;

    v5->_unifyResults = 1;
    v5->_alwaysUnifyLabeledValues = 1;
    v5->_sortOrder = 0;
    v5->_serialNumber = [(id)objc_opt_class() makeSerialNumber];
    v5->_signpostId = [(id)objc_opt_class() makeSignpostId];
    v8 = v5;
  }

  return v5;
}

+ (unint64_t)makeSignpostId
{
  v2 = os_log_create("com.apple.contacts", "api-triage");
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  return v3;
}

+ (unint64_t)makeSerialNumber
{
  if (makeSerialNumber_cn_once_token_0 != -1) {
    dispatch_once(&makeSerialNumber_cn_once_token_0, &__block_literal_global_110);
  }
  v2 = (void *)makeSerialNumber_cn_once_object_0;

  return [v2 nextUnsignedInteger];
}

- (void)setPredicate:(NSPredicate *)predicate
{
}

- (void)setUnifyResults:(BOOL)unifyResults
{
  self->_unifyResults = unifyResults;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)requiresMeContactAuthorization
{
  v2 = [(CNContactFetchRequest *)self effectivePredicate];
  os_signpost_id_t v3 = +[CNContact predicateForMeContact];
  char v4 = [v2 isEqual:v3];

  return v4;
}

- (CNContactFetchRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[CNSecureCodingClassSets keyDescriptorClasses];
  uint64_t v6 = [v4 decodeObjectOfClasses:v5 forKey:@"keysToFetch"];

  if (v6)
  {
    v7 = [(CNContactFetchRequest *)self initWithKeysToFetch:v6];
    if (v7)
    {
      v7->_unifyResults = [v4 decodeBoolForKey:@"unifyResults"];
      v7->_alwaysUnifyLabeledValues = [v4 decodeBoolForKey:@"alwaysUnifyLabeledValues"];
      v7->_sortOrder = [v4 decodeIntegerForKey:@"sortOrder"];
      v7->_rankSort = [v4 decodeIntegerForKey:@"rankSort"] != 0;
      v7->_onlyMainStore = [v4 decodeBoolForKey:@"onlyMainStore"];
      v7->_mutableObjects = [v4 decodeBoolForKey:@"mutableObjects"];
      v8 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
      v9 = [v4 decodeObjectOfClasses:v8 forKey:@"predicate"];
      uint64_t v10 = [v9 copy];
      predicate = v7->_predicate;
      v7->_predicate = (NSPredicate *)v10;

      v7->_batchSize = [v4 decodeIntegerForKey:@"batchSize"];
      v7->_decoderBatchSize = [v4 decodeIntegerForKey:@"decoderBatchSize"];
    }
  }
  else
  {
    v12 = os_log_create("com.apple.contacts", "data-access-error");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[CNContactFetchRequest initWithCoder:](v12);
    }

    v13 = +[CNErrorFactory errorWithCode:2 userInfo:0];
    [v4 failWithError:v13];

    v7 = 0;
  }

  return v7;
}

- (void)setSortOrder:(CNContactSortOrder)sortOrder
{
  self->_sortOrder = sortOrder;
}

- (void)setAlwaysUnifyLabeledValues:(BOOL)a3
{
  self->_alwaysUnifyLabeledValues = a3;
}

uint64_t __41__CNContactFetchRequest_makeSerialNumber__block_invoke()
{
  makeSerialNumber_cn_once_object_0 = (uint64_t)objc_alloc_init(MEMORY[0x1E4F5A338]);

  return MEMORY[0x1F41817F8]();
}

- (void)setKeyboardState:(id)a3
{
}

- (CNContactFetchRequest)init
{
  v2 = self;
  CNInitializerUnavailableException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (void)setContactBatchCount:(int64_t)a3
{
  if (self->_contactBatchCount != a3)
  {
    self->_contactBatchCount = a3;
    -[CNContactFetchRequest setBatchSize:](self, "setBatchSize:");
    [(CNContactFetchRequest *)self setDecoderBatchSize:a3];
  }
}

- (int64_t)contactBatchCount
{
  return self->_contactBatchCount;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = [(CNContactFetchRequest *)self predicate];
  id v5 = (id)[v3 appendName:@"predicate" object:v4];

  uint64_t v6 = [(CNContactFetchRequest *)self keysToFetch];
  id v7 = (id)[v3 appendName:@"keysToFetch" object:v6];

  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[CNContactFetchRequest unifyResults](self, "unifyResults"));
  id v9 = (id)[v3 appendName:@"unifyResults" object:v8];

  uint64_t v10 = objc_msgSend(NSNumber, "numberWithInteger:", -[CNContactFetchRequest sortOrder](self, "sortOrder"));
  id v11 = (id)[v3 appendName:@"sortOrder" object:v10];

  id v12 = (id)objc_msgSend(v3, "appendName:u_int64_t:", @"serialNumber", self->_serialNumber);
  id v13 = (id)objc_msgSend(v3, "appendName:BOOLValue:", @"alwaysUnifyLabeledValues", -[CNContactFetchRequest alwaysUnifyLabeledValues](self, "alwaysUnifyLabeledValues"));
  v14 = [v3 build];

  return v14;
}

- (BOOL)rankSort
{
  return self->_rankSort;
}

- (void)setRankSort:(BOOL)a3
{
  self->_rankSort = a3;
}

- (void)setKeysToFetch:(NSArray *)keysToFetch
{
}

- (void)setMutableObjects:(BOOL)mutableObjects
{
  self->_mutableObjects = mutableObjects;
}

- (void)setDisallowsEncodedFetch:(BOOL)a3
{
  self->_disallowsEncodedFetch = a3;
}

- (void)setBatchSize:(int64_t)a3
{
  self->_batchSize = a3;
}

- (void)setDecoderBatchSize:(int64_t)a3
{
  self->_decoderBatchSize = a3;
}

- (void)setOnlyMainStore:(BOOL)a3
{
  self->_onlyMainStore = a3;
}

- (BOOL)allowsBatching
{
  return self->_allowsBatching;
}

- (void)setAllowsBatching:(BOOL)a3
{
  self->_allowsBatching = a3;
}

- (void)setShouldFailIfAccountNotYetSynced:(BOOL)a3
{
  self->_shouldFailIfAccountNotYetSynced = a3;
}

- (void)initWithCoder:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1909E3000, log, OS_LOG_TYPE_ERROR, "Error decoding fetch request: no keys to fetch", v1, 2u);
}

@end