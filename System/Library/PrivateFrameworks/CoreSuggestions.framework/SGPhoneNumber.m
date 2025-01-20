@interface SGPhoneNumber
+ (BOOL)supportsSecureCoding;
+ (id)phoneNumber:(id)a3 label:(id)a4 extractionInfo:(id)a5 recordId:(id)a6;
+ (id)phoneNumber:(id)a3 label:(id)a4 extractionType:(unint64_t)a5 recordId:(id)a6;
+ (id)phoneNumber:(id)a3 label:(id)a4 extractionType:(unint64_t)a5 recordId:(id)a6 origin:(id)a7;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPhoneNumber:(id)a3;
- (NSString)phoneNumber;
- (SGPhoneNumber)initWithCoder:(id)a3;
- (SGPhoneNumber)initWithPhoneNumber:(id)a3 label:(id)a4 extractionInfo:(id)a5 recordId:(id)a6;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SGPhoneNumber

- (void).cxx_destruct
{
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = [(SGLabeledObject *)self label];
  if ([v4 length])
  {
    v5 = [(SGLabeledObject *)self label];
    v6 = (void *)[v3 initWithFormat:@"%@/'%@'", v5, self->_phoneNumber];
  }
  else
  {
    v6 = (void *)[v3 initWithFormat:@"%@/'%@'", @"unlabeled", self->_phoneNumber];
  }

  return v6;
}

- (unint64_t)hash
{
  return [(NSString *)self->_phoneNumber hash];
}

- (BOOL)isEqualToPhoneNumber:(id)a3
{
  v4 = a3;
  if ([(SGLabeledObject *)self isEqualToLabeledObject:v4])
  {
    v5 = self->_phoneNumber;
    v6 = v5;
    if (v5 == (NSString *)v4[5]) {
      char v7 = 1;
    }
    else {
      char v7 = -[NSString isEqual:](v5, "isEqual:");
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SGPhoneNumber *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGPhoneNumber *)self isEqualToPhoneNumber:v5];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SGPhoneNumber;
  id v4 = a3;
  [(SGLabeledObject *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_phoneNumber, @"phoneNumber", v5.receiver, v5.super_class);
}

- (SGPhoneNumber)initWithCoder:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SGPhoneNumber;
  BOOL v6 = [(SGLabeledObject *)&v12 initWithCoder:v5];
  if (v6)
  {
    char v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    v8 = [v5 decodeObjectOfClasses:v7 forKey:@"phoneNumber"];

    if (v8)
    {
      v9 = v8;
      phoneNumber = v6->_phoneNumber;
      v6->_phoneNumber = v9;
    }
    else
    {
      phoneNumber = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(phoneNumber, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, @"SGPhoneNumber.m", 30, @"nonnull property %s *%s was null when decoded", "NSString", "phoneNumber");
    }
  }
  return v6;
}

- (SGPhoneNumber)initWithPhoneNumber:(id)a3 label:(id)a4 extractionInfo:(id)a5 recordId:(id)a6
{
  id v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SGPhoneNumber;
  v11 = [(SGLabeledObject *)&v15 initWithLabel:a4 extractionInfo:a5 recordId:a6];
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    phoneNumber = v11->_phoneNumber;
    v11->_phoneNumber = (NSString *)v12;
  }
  return v11;
}

+ (id)phoneNumber:(id)a3 label:(id)a4 extractionType:(unint64_t)a5 recordId:(id)a6
{
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = +[SGExtractionInfo extractionInfoWithExtractionType:a5 modelVersion:0 confidence:0];
  v13 = +[SGPhoneNumber phoneNumber:v11 label:v10 extractionInfo:v12 recordId:v9];

  return v13;
}

+ (id)phoneNumber:(id)a3 label:(id)a4 extractionType:(unint64_t)a5 recordId:(id)a6 origin:(id)a7
{
  return +[SGPhoneNumber phoneNumber:label:extractionType:recordId:](SGPhoneNumber, "phoneNumber:label:extractionType:recordId:", a3, a4, a5, a6, a7);
}

+ (id)phoneNumber:(id)a3 label:(id)a4 extractionInfo:(id)a5 recordId:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [[SGPhoneNumber alloc] initWithPhoneNumber:v12 label:v11 extractionInfo:v10 recordId:v9];

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end