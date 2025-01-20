@interface WFEmailAddress
+ (BOOL)stringContainsEmailAddresses:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)addressWithEmailAddress:(id)a3;
+ (id)addressWithEmailAddress:(id)a3 label:(id)a4;
+ (id)addressesWithMailtoURL:(id)a3;
+ (id)addressesWithTextCheckingResult:(id)a3;
+ (id)emailAddressesInString:(id)a3 error:(id *)a4;
+ (id)objectWithWFSerializedRepresentation:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)address;
- (NSString)label;
- (NSString)localizedLabel;
- (WFEmailAddress)initWithAddress:(id)a3 label:(id)a4;
- (WFEmailAddress)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)wfSerializedRepresentation;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFEmailAddress

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_address, 0);
}

- (NSString)label
{
  return self->_label;
}

- (NSString)address
{
  return self->_address;
}

- (id)wfSerializedRepresentation
{
  v3 = objc_opt_new();
  v4 = [(WFEmailAddress *)self address];
  [v3 setObject:v4 forKey:@"link.contentkit.emailaddress"];

  [v3 setValue:self->_label forKey:@"link.contentkit.emaillabel"];
  return v3;
}

- (WFEmailAddress)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"address"];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"label"];
    self = [(WFEmailAddress *)self initWithAddress:v5 label:v6];

    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WFEmailAddress *)self address];
  [v4 encodeObject:v5 forKey:@"address"];

  id v6 = [(WFEmailAddress *)self label];
  [v4 encodeObject:v6 forKey:@"label"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(WFEmailAddress *)self address];
  id v6 = (void *)[v4 initWithAddress:v5 label:0];

  return v6;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  v5 = [(WFEmailAddress *)self address];
  id v6 = [v4 address];

  int64_t v7 = [v5 compare:v6];
  return v7;
}

- (unint64_t)hash
{
  v2 = [(WFEmailAddress *)self address];
  unint64_t v3 = [v2 hash] ^ 0xCAFEBEEFLL;

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WFEmailAddress *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(WFEmailAddress *)self address];
      id v6 = [(WFEmailAddress *)v4 address];
      char v7 = [v5 isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (NSString)localizedLabel
{
  v2 = [(WFEmailAddress *)self label];
  if (v2)
  {
    unint64_t v3 = +[WFContactLabeledValue localizedStringForLabel:v2];
  }
  else
  {
    unint64_t v3 = 0;
  }

  return (NSString *)v3;
}

- (WFEmailAddress)initWithAddress:(id)a3 label:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WFEmailAddress;
  v8 = [(WFEmailAddress *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    address = v8->_address;
    v8->_address = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    label = v8->_label;
    v8->_label = (NSString *)v11;

    v13 = v8;
  }

  return v8;
}

+ (id)objectWithWFSerializedRepresentation:(id)a3
{
  id v4 = a3;
  v5 = [v4 wfObjectOfClass:objc_opt_class() forKey:@"link.contentkit.emailaddress"];
  id v6 = [v4 wfObjectOfClass:objc_opt_class() forKey:@"link.contentkit.emaillabel"];

  id v7 = (void *)[objc_alloc((Class)a1) initWithAddress:v5 label:v6];
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)addressWithEmailAddress:(id)a3 label:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithAddress:v7 label:v6];

  return v8;
}

+ (id)addressWithEmailAddress:(id)a3
{
  return (id)[a1 addressWithEmailAddress:a3 label:0];
}

+ (id)addressesWithMailtoURL:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  id v6 = [v4 absoluteString];
  id v7 = [v4 scheme];

  v8 = objc_msgSend(v6, "substringFromIndex:", objc_msgSend(v7, "length") + 1);

  if ([v8 hasPrefix:@"//"])
  {
    uint64_t v9 = [v8 substringFromIndex:2];

    v8 = (void *)v9;
  }
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __41__WFEmailAddress_addressesWithMailtoURL___block_invoke;
  aBlock[3] = &unk_264288DF8;
  id v10 = v5;
  id v23 = v10;
  uint64_t v11 = (void (**)(void *, void *))_Block_copy(aBlock);
  if ([v8 rangeOfString:@"?"] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v11[2](v11, v8);
  }
  else
  {
    v12 = [v8 componentsSeparatedByString:@"?"];
    v13 = [v12 firstObject];
    if ((unint64_t)[v12 count] >= 2)
    {
      v14 = [v12 objectAtIndexedSubscript:0];
      v11[2](v11, v14);

      uint64_t v15 = [v12 objectAtIndexedSubscript:1];

      v13 = (void *)v15;
    }
    v16 = objc_msgSend(NSURL, "dc_dictionaryFromQueryString:", v13);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __41__WFEmailAddress_addressesWithMailtoURL___block_invoke_2;
    v20[3] = &unk_264288E20;
    v21 = v11;
    [v16 enumerateKeysAndObjectsUsingBlock:v20];
  }
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __41__WFEmailAddress_addressesWithMailtoURL___block_invoke_3;
  v19[3] = &__block_descriptor_40_e37___WFEmailAddress_24__0__NSString_8Q16l;
  v19[4] = a1;
  v17 = objc_msgSend(v10, "if_map:", v19);

  return v17;
}

void __41__WFEmailAddress_addressesWithMailtoURL___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  unint64_t v3 = [a2 componentsSeparatedByString:@","];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v11 + 1) + 8 * v7);
        uint64_t v9 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
        id v10 = [v8 stringByTrimmingCharactersInSet:v9];

        if ([v10 length]) {
          [*(id *)(a1 + 32) addObject:v10];
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

void __41__WFEmailAddress_addressesWithMailtoURL___block_invoke_2(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v11 = a3;
  uint64_t v7 = [a2 lowercaseString];
  int v8 = [v7 isEqualToString:@"to"];

  if (v8)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = [v11 stringByRemovingPercentEncoding];
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

    *a4 = 1;
  }
}

uint64_t __41__WFEmailAddress_addressesWithMailtoURL___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addressWithEmailAddress:a2];
}

+ (id)addressesWithTextCheckingResult:(id)a3
{
  uint64_t v4 = [a3 URL];
  uint64_t v5 = [v4 scheme];
  int v6 = [v5 isEqualToString:@"mailto"];

  if (v6)
  {
    uint64_t v7 = [a1 addressesWithMailtoURL:v4];
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x263EFFA68];
  }

  return v7;
}

+ (BOOL)stringContainsEmailAddresses:(id)a3
{
  unint64_t v3 = [a1 emailAddressesInString:a3 error:0];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

+ (id)emailAddressesInString:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = objc_opt_new();
    int v8 = +[WFDataDetector resultsForString:v6 ofTypes:32 error:a4];
    uint64_t v9 = [v8 textCheckingResults];

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = objc_msgSend(a1, "addressesWithTextCheckingResult:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
          [v7 addObjectsFromArray:v15];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v12);
    }
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x263EFFA68];
  }

  return v7;
}

@end