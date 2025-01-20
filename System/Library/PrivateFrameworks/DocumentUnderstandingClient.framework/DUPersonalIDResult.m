@interface DUPersonalIDResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isPartialExtraction;
- (DUPersonalIDResult)initWithCoder:(id)a3;
- (DUPersonalIDResult)initWithResultType:(int64_t)a3 attributes:(id)a4 isPartialExtraction:(BOOL)a5;
- (id)dateFromString:(id)a3 forAttributeKey:(id)a4;
- (id)spotlightOntologyAttributes;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DUPersonalIDResult

- (void).cxx_destruct
{
}

- (BOOL)isPartialExtraction
{
  return self->_isPartialExtraction;
}

- (int64_t)type
{
  return self->_type;
}

- (id)spotlightOntologyAttributes
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  unint64_t v4 = [(DUPersonalIDResult *)self type];
  if (v4 <= 0xC)
  {
    if (((1 << v4) & 0x1CFE) != 0)
    {
      v5 = (void *)MEMORY[0x263F01C08];
LABEL_4:
      [v3 setCardType:*v5];
      goto LABEL_5;
    }
    if (v4 == 8)
    {
      v5 = (void *)MEMORY[0x263F01C10];
      goto LABEL_4;
    }
    if (v4 == 9)
    {
      v5 = (void *)MEMORY[0x263F01C18];
      goto LABEL_4;
    }
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v50 = [(DUPersonalIDResult *)self type];
    _os_log_error_impl(&dword_24CF75000, &_os_log_internal, OS_LOG_TYPE_ERROR, "[DUInformationExtractor] Cannot convert unexpected CardType '%ld' to Spotlight Attributes ", buf, 0xCu);
  }
LABEL_5:
  int64_t v6 = [(DUPersonalIDResult *)self type];
  v7 = [(NSDictionary *)self->_extractedAttributes objectForKeyedSubscript:@"CardType"];
  [v3 setCardSubType:v7];

  extractedAttributes = self->_extractedAttributes;
  if (v6 == 3)
  {
    v9 = [(NSDictionary *)extractedAttributes objectForKeyedSubscript:@"BusinessName"];
    [v3 setCardProvider:v9];

    v10 = [(NSDictionary *)self->_extractedAttributes objectForKeyedSubscript:@"UnderName"];
    [v3 setCardUnderName:v10];

    v11 = [(NSDictionary *)self->_extractedAttributes objectForKeyedSubscript:@"Address"];
    if (v11)
    {
      v12 = [(NSDictionary *)self->_extractedAttributes objectForKeyedSubscript:@"Address"];
      v48 = v12;
      v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v48 count:1];
      [v3 setWorkAddresses:v13];
    }
    else
    {
      [v3 setWorkAddresses:0];
    }

    v32 = [(NSDictionary *)self->_extractedAttributes objectForKeyedSubscript:@"BusinessPhoneNumber"];
    if (v32)
    {
      v33 = [(NSDictionary *)self->_extractedAttributes objectForKeyedSubscript:@"BusinessPhoneNumber"];
      v47 = v33;
      v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v47 count:1];
      [v3 setPhoneNumbers:v34];
    }
    else
    {
      [v3 setPhoneNumbers:0];
    }

    v35 = [(NSDictionary *)self->_extractedAttributes objectForKeyedSubscript:@"BusinessEmail"];
    if (v35)
    {
      v36 = [(NSDictionary *)self->_extractedAttributes objectForKeyedSubscript:@"BusinessEmail"];
      v46 = v36;
      v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v46 count:1];
      [v3 setEmailAddresses:v37];
    }
    else
    {
      [v3 setEmailAddresses:0];
    }

    v38 = [(NSDictionary *)self->_extractedAttributes objectForKeyedSubscript:@"BusinessWebsite"];
    if (v38)
    {
      v39 = [(NSDictionary *)self->_extractedAttributes objectForKeyedSubscript:@"BusinessWebsite"];
      v45 = v39;
      v40 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v45 count:1];
      [v3 setLinks:v40];
    }
    else
    {
      [v3 setLinks:0];
    }

    v31 = [(NSDictionary *)self->_extractedAttributes objectForKeyedSubscript:@"BusinessHours"];
    if (v31)
    {
      v41 = [(NSDictionary *)self->_extractedAttributes objectForKeyedSubscript:@"BusinessHours"];
      v44 = v41;
      v42 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v44 count:1];
      [v3 setBusinessHours:v42];
    }
    else
    {
      [v3 setBusinessHours:0];
    }
  }
  else
  {
    v14 = [(NSDictionary *)extractedAttributes objectForKeyedSubscript:@"CardProvider"];
    [v3 setCardProvider:v14];

    v15 = [(NSDictionary *)self->_extractedAttributes objectForKeyedSubscript:@"UnderName"];
    [v3 setCardUnderName:v15];

    v16 = [(NSDictionary *)self->_extractedAttributes objectForKeyedSubscript:@"CardNumber"];
    [v3 setCardNumber:v16];

    v17 = [(NSDictionary *)self->_extractedAttributes objectForKeyedSubscript:@"CardGroupNumber"];
    [v3 setCardGroupNumber:v17];

    v18 = [(NSDictionary *)self->_extractedAttributes objectForKeyedSubscript:@"IssueDate"];
    v19 = [(DUPersonalIDResult *)self dateFromString:v18 forAttributeKey:@"IssueDate"];
    [v3 setCardIssueDate:v19];

    v20 = [(NSDictionary *)self->_extractedAttributes objectForKeyedSubscript:@"ExpirationDate"];
    v21 = [(DUPersonalIDResult *)self dateFromString:v20 forAttributeKey:@"ExpirationDate"];
    [v3 setCardExpirationDate:v21];

    v22 = [(NSDictionary *)self->_extractedAttributes objectForKeyedSubscript:@"IssuedBy"];
    [v3 setCardIssuedBy:v22];

    v23 = [(NSDictionary *)self->_extractedAttributes objectForKeyedSubscript:@"Region"];
    [v3 setCardRegion:v23];

    v24 = [(NSDictionary *)self->_extractedAttributes objectForKeyedSubscript:@"Country"];
    [v3 setCardCountry:v24];

    v25 = [(NSDictionary *)self->_extractedAttributes objectForKeyedSubscript:@"PlaceOfBirth"];
    [v3 setCardPlaceOfBirth:v25];

    v26 = [(NSDictionary *)self->_extractedAttributes objectForKeyedSubscript:@"Address"];
    [v3 setCardAddress:v26];

    v27 = [(NSDictionary *)self->_extractedAttributes objectForKeyedSubscript:@"Birthday"];
    v28 = [(DUPersonalIDResult *)self dateFromString:v27 forAttributeKey:@"Birthday"];
    [v3 setBirthday:v28];

    v29 = [(NSDictionary *)self->_extractedAttributes objectForKeyedSubscript:@"Sex"];
    [v3 setCardSex:v29];

    v30 = [(NSDictionary *)self->_extractedAttributes objectForKeyedSubscript:@"CardCategory"];
    [v3 setCardCategory:v30];

    v31 = [(NSDictionary *)self->_extractedAttributes objectForKeyedSubscript:@"CardRestrictions"];
    [v3 setCardRestrictions:v31];
  }

  return v3;
}

- (id)dateFromString:(id)a3 forAttributeKey:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a4;
  int64_t v6 = (objc_class *)MEMORY[0x263F08790];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  [v8 setDateFormat:@"yyyy-MM-dd"];
  v9 = [v8 dateFromString:v7];

  if (!v9 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    int v11 = 138412290;
    id v12 = v5;
    _os_log_error_impl(&dword_24CF75000, &_os_log_internal, OS_LOG_TYPE_ERROR, "[DUInformationExtractor] failed to convert '%@' value to NSDate", (uint8_t *)&v11, 0xCu);
  }

  return v9;
}

- (DUPersonalIDResult)initWithCoder:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"resultType"];
  uint64_t v6 = [v4 decodeBoolForKey:@"isPartialExtraction"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"extractedAttributes"];

  id v16 = 0;
  id v8 = (void *)[objc_alloc(MEMORY[0x263F08928]) initForReadingFromData:v7 error:&v16];
  id v9 = v16;
  v10 = v9;
  if (v9 || !v8)
  {
    if (!v9)
    {
      v10 = [v8 error];
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v10;
      _os_log_error_impl(&dword_24CF75000, &_os_log_internal, OS_LOG_TYPE_ERROR, "[DUInformationExtractor] failed to decode DUPersonalIDResult: %@", buf, 0xCu);
    }
    v14 = 0;
  }
  else
  {
    id v11 = objc_alloc(MEMORY[0x263EFFA08]);
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    v17[2] = objc_opt_class();
    id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:3];
    v10 = (void *)[v11 initWithArray:v12];

    uint64_t v13 = [v8 decodeObjectOfClasses:v10 forKey:*MEMORY[0x263F081D0]];
    [v8 finishDecoding];
    self = [(DUPersonalIDResult *)self initWithResultType:v5 attributes:v13 isPartialExtraction:v6];

    v14 = self;
  }

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [v4 encodeInteger:self->_type forKey:@"resultType"];
  [v4 encodeBool:self->_isPartialExtraction forKey:@"isPartialExtraction"];
  extractedAttributes = self->_extractedAttributes;
  id v8 = 0;
  uint64_t v6 = [MEMORY[0x263F08910] archivedDataWithRootObject:extractedAttributes requiringSecureCoding:1 error:&v8];
  id v7 = v8;
  if (v7 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v7;
    _os_log_error_impl(&dword_24CF75000, &_os_log_internal, OS_LOG_TYPE_ERROR, "[DUInformationExtractor] failed to decode DUPersonalIDResult: %@", buf, 0xCu);
  }
  [v4 encodeObject:v6 forKey:@"extractedAttributes"];
}

- (DUPersonalIDResult)initWithResultType:(int64_t)a3 attributes:(id)a4 isPartialExtraction:(BOOL)a5
{
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DUPersonalIDResult;
  id v9 = [(DUPersonalIDResult *)&v14 init];
  id v10 = v9;
  if (v9)
  {
    v9->_type = a3;
    v9->_isPartialExtraction = a5;
    uint64_t v11 = [v8 copy];
    extractedAttributes = v10->_extractedAttributes;
    v10->_extractedAttributes = (NSDictionary *)v11;
  }
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end