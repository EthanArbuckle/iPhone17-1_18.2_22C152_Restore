@interface CNContactClassifiedHandleStringInterpreter
- (BOOL)hasBeenInterpreted;
- (CNContactClassifiedHandleStringInterpreter)init;
- (CNContactClassifiedHandleStringInterpreter)initWithHandleStringClassification:(id)a3;
- (CNHandleStringClassification)classification;
- (NSArray)emailAddresses;
- (NSArray)phoneNumbers;
- (NSMutableArray)emailAddressesImpl;
- (NSMutableArray)phoneNumbersImpl;
- (NSMutableArray)unconvertableHandles;
- (id)description;
- (void)interpretEmailAddresses;
- (void)interpretPhoneNumbers;
- (void)interpretUnknownsAsEmailAddresses;
- (void)interpretValues;
- (void)setHasBeenInterpreted:(BOOL)a3;
@end

@implementation CNContactClassifiedHandleStringInterpreter

- (CNContactClassifiedHandleStringInterpreter)init
{
  v2 = self;
  CNInitializerUnavailableException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNContactClassifiedHandleStringInterpreter)initWithHandleStringClassification:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CNContactClassifiedHandleStringInterpreter;
  v6 = [(CNContactClassifiedHandleStringInterpreter *)&v16 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_classification, a3);
    v7->_hasBeenInterpreted = 0;
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    emailAddressesImpl = v7->_emailAddressesImpl;
    v7->_emailAddressesImpl = v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    phoneNumbersImpl = v7->_phoneNumbersImpl;
    v7->_phoneNumbersImpl = v10;

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    unconvertableHandles = v7->_unconvertableHandles;
    v7->_unconvertableHandles = v12;

    v14 = v7;
  }

  return v7;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"classification" object:self->_classification];
  id v5 = [v3 build];

  return v5;
}

- (void)interpretValues
{
  [(CNContactClassifiedHandleStringInterpreter *)self interpretEmailAddresses];
  [(CNContactClassifiedHandleStringInterpreter *)self interpretPhoneNumbers];
  [(CNContactClassifiedHandleStringInterpreter *)self interpretUnknownsAsEmailAddresses];

  [(CNContactClassifiedHandleStringInterpreter *)self setHasBeenInterpreted:1];
}

- (void)interpretEmailAddresses
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = [(CNHandleStringClassification *)self->_classification emailAddresses];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = +[CNLabeledValue labeledValueWithLabel:0 value:*(void *)(*((void *)&v9 + 1) + 8 * v7)];
        [(NSMutableArray *)self->_emailAddressesImpl addObject:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)interpretPhoneNumbers
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = [(CNHandleStringClassification *)self->_classification phoneNumbers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v15;
    *(void *)&long long v5 = 138412290;
    long long v13 = v5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        long long v10 = +[CNPhoneNumber phoneNumberWithStringValue:](CNPhoneNumber, "phoneNumberWithStringValue:", v9, v13);
        if (v10)
        {
          long long v11 = +[CNLabeledValue labeledValueWithLabel:0 value:v10];
          [(NSMutableArray *)self->_phoneNumbersImpl addObject:v11];
        }
        else
        {
          long long v12 = +[CNContact os_log];
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v13;
            uint64_t v19 = v9;
            _os_log_error_impl(&dword_1909E3000, v12, OS_LOG_TYPE_ERROR, "Handle “%@” was classified as a phone number, but could not be converted to CNPhoneNumber. Will be treated as an email address.", buf, 0xCu);
          }

          [(NSMutableArray *)self->_unconvertableHandles addObject:v9];
        }
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v6);
  }
}

- (void)interpretUnknownsAsEmailAddresses
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v3 = [(CNHandleStringClassification *)self->_classification unknown];
  objc_msgSend(v3, "_cn_each:", &__block_literal_global_86);

  uint64_t v4 = [(CNHandleStringClassification *)self->_classification unknown];
  unconvertableHandles = self->_unconvertableHandles;
  v19[0] = v4;
  v19[1] = unconvertableHandles;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  uint64_t v7 = objc_msgSend(v6, "_cn_flatten");

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = +[CNLabeledValue labeledValueWithLabel:value:](CNLabeledValue, "labeledValueWithLabel:value:", 0, *(void *)(*((void *)&v14 + 1) + 8 * v12), (void)v14);
        [(NSMutableArray *)self->_emailAddressesImpl addObject:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

void __79__CNContactClassifiedHandleStringInterpreter_interpretUnknownsAsEmailAddresses__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = +[CNContact os_log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_1909E3000, v3, OS_LOG_TYPE_DEFAULT, "Handle “%@” could not be classified; it will be included as an email address.",
      (uint8_t *)&v4,
      0xCu);
  }
}

- (NSArray)emailAddresses
{
  if (!self->_hasBeenInterpreted) {
    [(CNContactClassifiedHandleStringInterpreter *)self interpretValues];
  }
  emailAddressesImpl = self->_emailAddressesImpl;

  return (NSArray *)emailAddressesImpl;
}

- (NSArray)phoneNumbers
{
  if (!self->_hasBeenInterpreted) {
    [(CNContactClassifiedHandleStringInterpreter *)self interpretValues];
  }
  phoneNumbersImpl = self->_phoneNumbersImpl;

  return (NSArray *)phoneNumbersImpl;
}

- (CNHandleStringClassification)classification
{
  return self->_classification;
}

- (NSMutableArray)emailAddressesImpl
{
  return self->_emailAddressesImpl;
}

- (NSMutableArray)phoneNumbersImpl
{
  return self->_phoneNumbersImpl;
}

- (NSMutableArray)unconvertableHandles
{
  return self->_unconvertableHandles;
}

- (BOOL)hasBeenInterpreted
{
  return self->_hasBeenInterpreted;
}

- (void)setHasBeenInterpreted:(BOOL)a3
{
  self->_hasBeenInterpreted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unconvertableHandles, 0);
  objc_storeStrong((id *)&self->_phoneNumbersImpl, 0);
  objc_storeStrong((id *)&self->_emailAddressesImpl, 0);

  objc_storeStrong((id *)&self->_classification, 0);
}

@end