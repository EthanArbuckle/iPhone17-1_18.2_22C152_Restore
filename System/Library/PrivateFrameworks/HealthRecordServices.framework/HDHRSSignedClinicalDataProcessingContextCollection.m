@interface HDHRSSignedClinicalDataProcessingContextCollection
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HDHRSSignedClinicalDataProcessingContextCollection)init;
- (HDHRSSignedClinicalDataProcessingContextCollection)initWithCoder:(id)a3;
- (HDHRSSignedClinicalDataProcessingContextCollection)initWithReceivedDate:(id)a3 countryCode:(id)a4 options:(unint64_t)a5 contextItems:(id)a6;
- (NSArray)contextItems;
- (NSDate)receivedDate;
- (NSString)countryCode;
- (unint64_t)hash;
- (unint64_t)options;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDHRSSignedClinicalDataProcessingContextCollection

- (HDHRSSignedClinicalDataProcessingContextCollection)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDHRSSignedClinicalDataProcessingContextCollection)initWithReceivedDate:(id)a3 countryCode:(id)a4 options:(unint64_t)a5 contextItems:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)HDHRSSignedClinicalDataProcessingContextCollection;
  v13 = [(HDHRSSignedClinicalDataProcessingContextCollection *)&v21 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    receivedDate = v13->_receivedDate;
    v13->_receivedDate = (NSDate *)v14;

    uint64_t v16 = [v11 copy];
    countryCode = v13->_countryCode;
    v13->_countryCode = (NSString *)v16;

    v13->_options = a5;
    uint64_t v18 = [v12 copy];
    contextItems = v13->_contextItems;
    v13->_contextItems = (NSArray *)v18;
  }
  return v13;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSDate *)self->_receivedDate hash];
  NSUInteger v4 = [(NSString *)self->_countryCode hash] ^ v3;
  unint64_t options = self->_options;
  return v4 ^ options ^ [(NSArray *)self->_contextItems hash];
}

- (BOOL)isEqual:(id)a3
{
  v6 = (HDHRSSignedClinicalDataProcessingContextCollection *)a3;
  v7 = v6;
  if (v6 != self)
  {
    v8 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      char v14 = 0;
LABEL_30:

      goto LABEL_31;
    }
    receivedDate = self->_receivedDate;
    id v10 = [(HDHRSSignedClinicalDataProcessingContextCollection *)v8 receivedDate];
    if (receivedDate != v10)
    {
      uint64_t v11 = [(HDHRSSignedClinicalDataProcessingContextCollection *)v8 receivedDate];
      if (!v11)
      {
        char v14 = 0;
        goto LABEL_29;
      }
      NSUInteger v4 = (void *)v11;
      id v12 = self->_receivedDate;
      v13 = [(HDHRSSignedClinicalDataProcessingContextCollection *)v8 receivedDate];
      if (![(NSDate *)v12 isEqual:v13])
      {
        char v14 = 0;
LABEL_28:

        goto LABEL_29;
      }
      v35 = v13;
    }
    countryCode = self->_countryCode;
    uint64_t v16 = [(HDHRSSignedClinicalDataProcessingContextCollection *)v8 countryCode];
    if (countryCode == v16)
    {
      unint64_t options = self->_options;
      if (options == [(HDHRSSignedClinicalDataProcessingContextCollection *)v8 options]) {
        goto LABEL_16;
      }
    }
    else
    {
      uint64_t v17 = [(HDHRSSignedClinicalDataProcessingContextCollection *)v8 countryCode];
      if (v17)
      {
        uint64_t v3 = (void *)v17;
        uint64_t v18 = self->_countryCode;
        uint64_t v19 = [(HDHRSSignedClinicalDataProcessingContextCollection *)v8 countryCode];
        v20 = v18;
        objc_super v21 = (void *)v19;
        if (![(NSString *)v20 isEqualToString:v19])
        {

          char v14 = 0;
          BOOL v30 = receivedDate == v10;
          goto LABEL_34;
        }
        v33 = v21;
        unint64_t v22 = self->_options;
        if (v22 != [(HDHRSSignedClinicalDataProcessingContextCollection *)v8 options])
        {
          char v14 = 0;
          v13 = v35;
LABEL_26:

LABEL_27:
          if (receivedDate != v10) {
            goto LABEL_28;
          }
LABEL_29:

          goto LABEL_30;
        }
LABEL_16:
        v34 = v4;
        contextItems = self->_contextItems;
        uint64_t v25 = [(HDHRSSignedClinicalDataProcessingContextCollection *)v8 contextItems];
        if (contextItems == (NSArray *)v25)
        {

          char v14 = 1;
        }
        else
        {
          v26 = (void *)v25;
          uint64_t v27 = [(HDHRSSignedClinicalDataProcessingContextCollection *)v8 contextItems];
          if (v27)
          {
            v28 = (void *)v27;
            v29 = self->_contextItems;
            v32 = [(HDHRSSignedClinicalDataProcessingContextCollection *)v8 contextItems];
            char v14 = [(NSArray *)v29 isEqualToArray:v32];

            if (countryCode == v16)
            {
            }
            else
            {
            }
            BOOL v30 = receivedDate == v10;
            NSUInteger v4 = v34;
LABEL_34:
            v13 = v35;
            if (v30) {
              goto LABEL_29;
            }
            goto LABEL_28;
          }

          char v14 = 0;
        }
        BOOL v30 = countryCode == v16;
        NSUInteger v4 = v34;
        v13 = v35;
        if (v30) {
          goto LABEL_27;
        }
        goto LABEL_26;
      }
    }
    char v14 = 0;
    v13 = v35;
    goto LABEL_27;
  }
  char v14 = 1;
LABEL_31:

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  receivedDate = self->_receivedDate;
  id v5 = a3;
  [v5 encodeObject:receivedDate forKey:@"ReceivedDate"];
  [v5 encodeObject:self->_countryCode forKey:@"CountryCode"];
  [v5 encodeInteger:self->_options forKey:@"Options"];
  [v5 encodeObject:self->_contextItems forKey:@"ContextItems"];
}

- (HDHRSSignedClinicalDataProcessingContextCollection)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ReceivedDate"];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CountryCode"];
    if ([v4 containsValueForKey:@"Options"])
    {
      uint64_t v7 = [v4 decodeIntegerForKey:@"Options"];
      v8 = objc_msgSend(MEMORY[0x263EFFA08], "hk_typesForArrayOf:", objc_opt_class());
      v9 = [v4 decodeObjectOfClasses:v8 forKey:@"ContextItems"];
      if (v9)
      {
        self = [(HDHRSSignedClinicalDataProcessingContextCollection *)self initWithReceivedDate:v5 countryCode:v6 options:v7 contextItems:v9];
        id v10 = self;
      }
      else
      {
        objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
        id v10 = 0;
      }
    }
    else
    {
      objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
      id v10 = 0;
    }
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    id v10 = 0;
  }

  return v10;
}

- (NSDate)receivedDate
{
  return self->_receivedDate;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (unint64_t)options
{
  return self->_options;
}

- (NSArray)contextItems
{
  return self->_contextItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextItems, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);

  objc_storeStrong((id *)&self->_receivedDate, 0);
}

@end