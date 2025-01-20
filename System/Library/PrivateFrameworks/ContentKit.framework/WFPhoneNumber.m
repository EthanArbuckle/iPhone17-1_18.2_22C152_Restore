@interface WFPhoneNumber
+ (BOOL)stringContainsPhoneNumbers:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (WFPhoneNumber)phoneNumberWithPhoneNumberString:(id)a3;
+ (WFPhoneNumber)phoneNumberWithPhoneNumberString:(id)a3 contactName:(id)a4 label:(id)a5;
+ (WFPhoneNumber)phoneNumberWithTextCheckingResult:(id)a3;
+ (id)objectWithWFSerializedRepresentation:(id)a3;
+ (id)phoneNumbersInString:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)contactName;
- (NSString)formattedPhoneNumber;
- (NSString)label;
- (NSString)localizedLabel;
- (NSString)normalizedPhoneNumber;
- (NSString)string;
- (NSString)wfName;
- (WFPhoneNumber)initWithCoder:(id)a3;
- (WFPhoneNumber)initWithPhoneNumberString:(id)a3 contactName:(id)a4 label:(id)a5;
- (id)wfSerializedRepresentation;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFPhoneNumber

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_contactName, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

- (NSString)label
{
  return self->_label;
}

- (NSString)contactName
{
  return self->_contactName;
}

- (NSString)string
{
  return self->_string;
}

- (id)wfSerializedRepresentation
{
  v3 = objc_opt_new();
  v4 = [(WFPhoneNumber *)self string];
  [v3 setObject:v4 forKey:@"link.contentkit.phonenumber"];

  [v3 setValue:self->_contactName forKey:@"link.contentkit.phonenumber.contactname"];
  [v3 setValue:self->_label forKey:@"link.contentkit.phonelabel"];
  return v3;
}

- (unint64_t)hash
{
  v3 = [(WFPhoneNumber *)self string];
  uint64_t v4 = [v3 hash];
  v5 = [(WFPhoneNumber *)self label];
  uint64_t v6 = [v5 hash];
  v7 = [(WFPhoneNumber *)self contactName];
  unint64_t v8 = v4 ^ v6 ^ [v7 hash] ^ 0x9811FA8CLL;

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v6 = (WFPhoneNumber *)a3;
  if (v6 == self)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [(WFPhoneNumber *)v6 string];
      unint64_t v8 = [(WFPhoneNumber *)self string];
      if (![v7 isEqualToString:v8])
      {
        char v11 = 0;
LABEL_21:

        goto LABEL_22;
      }
      v9 = [(WFPhoneNumber *)v6 label];
      if (v9 || ([(WFPhoneNumber *)self label], (v18 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v3 = [(WFPhoneNumber *)v6 label];
        uint64_t v4 = [(WFPhoneNumber *)self label];
        if (([v3 isEqualToString:v4] & 1) == 0)
        {

          char v11 = 0;
          goto LABEL_18;
        }
        int v10 = 1;
      }
      else
      {
        v18 = 0;
        int v10 = 0;
      }
      v12 = [(WFPhoneNumber *)v6 contactName];
      if (v12 || ([(WFPhoneNumber *)self contactName], (uint64_t v17 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        int v19 = v10;
        v13 = [(WFPhoneNumber *)v6 contactName];
        v14 = [(WFPhoneNumber *)self contactName];
        char v11 = [v13 isEqualToString:v14];

        if (v12)
        {

          if (v19)
          {
LABEL_17:
          }
LABEL_18:
          if (!v9) {

          }
          goto LABEL_21;
        }
        LOBYTE(v10) = v19;
        v16 = (void *)v17;
      }
      else
      {
        v16 = 0;
        char v11 = 1;
      }

      if ((v10 & 1) == 0) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
    char v11 = 0;
  }
LABEL_22:

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  [v6 encodeObject:self->_string forKey:@"string"];
  label = self->_label;
  if (label) {
    [v6 encodeObject:label forKey:@"phoneLabel"];
  }
  contactName = self->_contactName;
  if (contactName) {
    [v6 encodeObject:contactName forKey:@"contactName"];
  }
}

- (WFPhoneNumber)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"string"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contactName"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"phoneLabel"];

  unint64_t v8 = [(WFPhoneNumber *)self initWithPhoneNumberString:v5 contactName:v6 label:v7];
  return v8;
}

- (NSString)localizedLabel
{
  v2 = [(WFPhoneNumber *)self label];
  if (v2)
  {
    v3 = +[WFContactLabeledValue localizedStringForLabel:v2];
  }
  else
  {
    v3 = 0;
  }

  return (NSString *)v3;
}

- (NSString)wfName
{
  v3 = [(WFPhoneNumber *)self contactName];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v6 = [(WFPhoneNumber *)self formattedPhoneNumber];
    v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = [(WFPhoneNumber *)self string];
    }
    id v5 = v8;
  }
  return (NSString *)v5;
}

- (NSString)normalizedPhoneNumber
{
  id CNPhoneNumberClass = getCNPhoneNumberClass();
  id v4 = [(WFPhoneNumber *)self string];
  id v5 = [CNPhoneNumberClass phoneNumberWithStringValue:v4];
  id v6 = [v5 unformattedInternationalStringValue];

  return (NSString *)v6;
}

- (NSString)formattedPhoneNumber
{
  id CNPhoneNumberClass = getCNPhoneNumberClass();
  id v4 = [(WFPhoneNumber *)self string];
  id v5 = [CNPhoneNumberClass phoneNumberWithStringValue:v4];
  id v6 = [v5 formattedStringValue];

  return (NSString *)v6;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  id v5 = [(WFPhoneNumber *)self normalizedPhoneNumber];
  id v6 = [v4 normalizedPhoneNumber];

  int64_t v7 = [v5 compare:v6];
  return v7;
}

- (WFPhoneNumber)initWithPhoneNumberString:(id)a3 contactName:(id)a4 label:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 length] && (self = -[WFPhoneNumber init](self, "init")) != 0)
  {
    char v11 = (NSString *)[v8 copy];
    string = self->_string;
    self->_string = v11;

    v13 = (NSString *)[v9 copy];
    contactName = self->_contactName;
    self->_contactName = v13;

    v15 = (NSString *)[v10 copy];
    label = self->_label;
    self->_label = v15;

    self = self;
    uint64_t v17 = self;
  }
  else
  {
    uint64_t v17 = 0;
  }

  return v17;
}

+ (id)objectWithWFSerializedRepresentation:(id)a3
{
  id v4 = a3;
  id v5 = [v4 wfObjectOfClass:objc_opt_class() forKey:@"link.contentkit.phonenumber"];
  id v6 = [v4 wfObjectOfClass:objc_opt_class() forKey:@"link.contentkit.phonenumber.contactname"];
  int64_t v7 = [v4 wfObjectOfClass:objc_opt_class() forKey:@"link.contentkit.phonelabel"];

  id v8 = (void *)[objc_alloc((Class)a1) initWithPhoneNumberString:v5 contactName:v6 label:v7];
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (WFPhoneNumber)phoneNumberWithPhoneNumberString:(id)a3 contactName:(id)a4 label:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  char v11 = (void *)[objc_alloc((Class)a1) initWithPhoneNumberString:v10 contactName:v9 label:v8];

  return (WFPhoneNumber *)v11;
}

+ (WFPhoneNumber)phoneNumberWithPhoneNumberString:(id)a3
{
  return (WFPhoneNumber *)[a1 phoneNumberWithPhoneNumberString:a3 contactName:0 label:0];
}

+ (WFPhoneNumber)phoneNumberWithTextCheckingResult:(id)a3
{
  id v4 = [a3 phoneNumber];
  id v5 = [a1 phoneNumberWithPhoneNumberString:v4];

  return (WFPhoneNumber *)v5;
}

+ (BOOL)stringContainsPhoneNumbers:(id)a3
{
  return +[WFDataDetector hasResultForString:a3 ofTypes:2048];
}

+ (id)phoneNumbersInString:(id)a3 error:(id *)a4
{
  id v4 = +[WFDataDetector resultsForString:a3 ofTypes:2048 error:a4];
  id v5 = [v4 phoneNumbers];

  return v5;
}

@end