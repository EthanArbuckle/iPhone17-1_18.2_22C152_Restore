@interface BLSHPresentationDateSpecifier
+ (BLSHPresentationDateSpecifier)specifierWithPresentationDate:(id)a3 specifiers:(id)a4;
- (BLSHPresentationDateSpecifier)initWithPresentationDate:(id)a3 specifiers:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSArray)specifiers;
- (NSDate)presentationDate;
- (id)bls_loggingString;
- (id)bls_shortLoggingString;
- (id)dateSpecifierForEnvironment:(id)a3;
- (id)filter:(id)a3;
- (unint64_t)encodedPresentationTime;
- (unint64_t)hash;
- (void)enumerateDateSpecifiersUsingBlock:(id)a3;
@end

@implementation BLSHPresentationDateSpecifier

+ (BLSHPresentationDateSpecifier)specifierWithPresentationDate:(id)a3 specifiers:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithPresentationDate:v7 specifiers:v6];

  return (BLSHPresentationDateSpecifier *)v8;
}

- (BLSHPresentationDateSpecifier)initWithPresentationDate:(id)a3 specifiers:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BLSHPresentationDateSpecifier;
  v9 = [(BLSHPresentationDateSpecifier *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_presentationDate, a3);
    objc_storeStrong((id *)&v10->_specifiers, a4);
  }

  return v10;
}

- (unint64_t)encodedPresentationTime
{
  unint64_t encodedPresentationTime = self->_encodedPresentationTime;
  if (!encodedPresentationTime)
  {
    uint64_t v4 = BLSHEncodePresentationTime_onceToken;
    v5 = self->_presentationDate;
    if (v4 != -1) {
      dispatch_once(&BLSHEncodePresentationTime_onceToken, &__block_literal_global_23);
    }
    id v6 = [(id)BLSHEncodePresentationTime_calendar components:32992 fromDate:v5];

    unint64_t v7 = [v6 hour];
    unint64_t v8 = [v6 minute];
    unint64_t v9 = [v6 second];
    uint64_t v10 = [v6 nanosecond];
    unint64_t encodedPresentationTime = ((v7 / 0xA) << 44) | ((v7 % 0xA) << 40) | ((v8 / 0xA) << 32) | ((v8 % 0xA) << 28) | ((v9 / 0xA) << 20) | ((v9 % 0xA) << 16) | ((v10 + 500000) / 0x5F5E1uLL) & 0xFFFFFFFFFFFFFF00 | ((v10 + 500000) / 0xF4240uLL - 10 * (((v10 + 500000) / 0xF4240uLL * (unsigned __int128)0x199999999999999AuLL) >> 64)) | (16 * ((v10 + 500000) / 0x989680uLL - 10 * (((v10 + 500000) / 0x989680uLL * (unsigned __int128)0x199999999999999AuLL) >> 64))) | 0xC00C00C000;

    self->_unint64_t encodedPresentationTime = encodedPresentationTime;
  }
  return encodedPresentationTime;
}

- (id)bls_loggingString
{
  v3 = objc_opt_new();
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __50__BLSHPresentationDateSpecifier_bls_loggingString__block_invoke;
  v14[3] = &unk_2645322D0;
  id v4 = v3;
  id v15 = v4;
  v16 = self;
  [v4 appendProem:0 block:v14];
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __50__BLSHPresentationDateSpecifier_bls_loggingString__block_invoke_2;
  v11 = &unk_2645322D0;
  objc_super v12 = self;
  id v13 = v4;
  id v5 = v4;
  [v5 appendBodySectionWithOpenDelimiter:@" {" closeDelimiter:@"} " block:&v8];
  id v6 = objc_msgSend(v5, "description", v8, v9, v10, v11, v12);

  return v6;
}

void __50__BLSHPresentationDateSpecifier_bls_loggingString__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(v1 + 16);
  if (v3)
  {
    objc_msgSend(*(id *)(v1 + 16), "bls_shortLoggingString");
    id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    uint64_t v1 = *(void *)(a1 + 40);
  }
  else
  {
    id v6 = @"<NULL>";
  }
  id v5 = objc_msgSend(NSString, "stringWithFormat:", @"%p", v1);
  [v2 appendString:v6 withName:v5];

  if (v3)
  {
  }
}

void __50__BLSHPresentationDateSpecifier_bls_loggingString__block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 24);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        unint64_t v7 = *(void **)(a1 + 40);
        uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v6), "bls_shortLoggingString", (void)v10);
        id v9 = (id)[v7 appendObject:v8 withName:0];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

- (id)bls_shortLoggingString
{
  uint64_t v3 = objc_opt_new();
  presentationDate = self->_presentationDate;
  if (presentationDate)
  {
    uint64_t v5 = [(NSDate *)presentationDate bls_shortLoggingString];
    [v3 appendString:v5 withName:0];
  }
  else
  {
    [v3 appendString:@"<NULL>" withName:0];
  }
  id v6 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[NSArray count](self->_specifiers, "count"), @"env");
  unint64_t v7 = [(NSArray *)self->_specifiers firstObject];
  uint64_t v8 = [v7 environment];

  id v9 = [v8 identifier];
  id v10 = (id)[v3 appendObject:v9 withName:@"1st" skipIfNil:1];

  long long v11 = [v3 description];

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3 = [MEMORY[0x263F29C60] builder];
  id v4 = (id)[v3 appendObject:self->_presentationDate];
  specifiers = self->_specifiers;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __37__BLSHPresentationDateSpecifier_hash__block_invoke;
  v9[3] = &unk_264534088;
  id v10 = v3;
  id v6 = v3;
  [(NSArray *)specifiers enumerateObjectsUsingBlock:v9];
  unint64_t v7 = [v6 hash];

  return v7;
}

id __37__BLSHPresentationDateSpecifier_hash__block_invoke(uint64_t a1, uint64_t a2)
{
  return (id)[*(id *)(a1 + 32) appendObject:a2];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263F29C58] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  presentationDate = self->_presentationDate;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __41__BLSHPresentationDateSpecifier_isEqual___block_invoke;
  v13[3] = &unk_264532810;
  id v7 = v4;
  id v14 = v7;
  id v8 = (id)[v5 appendObject:presentationDate counterpart:v13];
  if ([v5 isEqual])
  {
    specifiers = self->_specifiers;
    id v10 = [v7 specifiers];
    BOOL v11 = [(NSArray *)specifiers isEqualToArray:v10];
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

uint64_t __41__BLSHPresentationDateSpecifier_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentationDate];
}

- (void)enumerateDateSpecifiersUsingBlock:(id)a3
{
  id v4 = a3;
  specifiers = self->_specifiers;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __67__BLSHPresentationDateSpecifier_enumerateDateSpecifiersUsingBlock___block_invoke;
  v7[3] = &unk_2645340B0;
  id v8 = v4;
  id v6 = v4;
  [(NSArray *)specifiers enumerateObjectsUsingBlock:v7];
}

void __67__BLSHPresentationDateSpecifier_enumerateDateSpecifiersUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  id v5 = [v3 dateSpecifier];
  id v4 = [v3 environment];

  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
}

- (id)dateSpecifierForEnvironment:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = self->_specifiers;
  id v6 = (void *)[(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        objc_msgSend(v9, "environment", (void)v12);
        id v10 = (id)objc_claimAutoreleasedReturnValue();

        if (v10 == v4)
        {
          id v6 = [v9 dateSpecifier];
          goto LABEL_11;
        }
      }
      id v6 = (void *)[(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)filter:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = (unsigned int (**)(id, void))a3;
  id v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSArray count](self->_specifiers, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = self->_specifiers;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if (v4[2](v4, v11)) {
          objc_msgSend(v5, "addObject:", v11, (void)v14);
        }
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  long long v12 = +[BLSHPresentationDateSpecifier specifierWithPresentationDate:self->_presentationDate specifiers:v5];

  return v12;
}

- (NSDate)presentationDate
{
  return self->_presentationDate;
}

- (NSArray)specifiers
{
  return self->_specifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifiers, 0);

  objc_storeStrong((id *)&self->_presentationDate, 0);
}

@end