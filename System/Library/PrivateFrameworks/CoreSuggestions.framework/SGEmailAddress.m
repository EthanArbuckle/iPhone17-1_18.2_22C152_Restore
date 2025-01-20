@interface SGEmailAddress
+ (BOOL)supportsSecureCoding;
+ (id)emailAddress:(id)a3 label:(id)a4 extractionInfo:(id)a5 withRecordId:(id)a6;
+ (id)emailAddress:(id)a3 label:(id)a4 extractionType:(unint64_t)a5 withRecordId:(id)a6;
+ (id)emailAddress:(id)a3 label:(id)a4 extractionType:(unint64_t)a5 withRecordId:(id)a6 origin:(id)a7;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToEmailAddress:(id)a3;
- (NSString)emailAddress;
- (SGEmailAddress)initWithCoder:(id)a3;
- (SGEmailAddress)initWithEmailAddress:(id)a3 label:(id)a4 extractionInfo:(id)a5 recordId:(id)a6;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SGEmailAddress

- (void).cxx_destruct
{
}

- (NSString)emailAddress
{
  return self->_emailAddress;
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = [(SGLabeledObject *)self label];
  if ([v4 length])
  {
    v5 = [(SGLabeledObject *)self label];
    v6 = (void *)[v3 initWithFormat:@"%@/'%@'", v5, self->_emailAddress];
  }
  else
  {
    v6 = (void *)[v3 initWithFormat:@"%@/'%@'", @"unlabeled", self->_emailAddress];
  }

  return v6;
}

- (unint64_t)hash
{
  return [(NSString *)self->_emailAddress hash];
}

- (BOOL)isEqualToEmailAddress:(id)a3
{
  v4 = a3;
  if ([(SGLabeledObject *)self isEqualToLabeledObject:v4])
  {
    v5 = self->_emailAddress;
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
  v4 = (SGEmailAddress *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGEmailAddress *)self isEqualToEmailAddress:v5];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SGEmailAddress;
  id v4 = a3;
  [(SGLabeledObject *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_emailAddress, @"emailAddress", v5.receiver, v5.super_class);
}

- (SGEmailAddress)initWithCoder:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SGEmailAddress;
  BOOL v6 = [(SGLabeledObject *)&v12 initWithCoder:v5];
  if (v6)
  {
    char v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    v8 = [v5 decodeObjectOfClasses:v7 forKey:@"emailAddress"];

    if (v8)
    {
      v9 = v8;
      emailAddress = v6->_emailAddress;
      v6->_emailAddress = v9;
    }
    else
    {
      emailAddress = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(emailAddress, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, @"SGEmailAddress.m", 30, @"nonnull property %s *%s was null when decoded", "NSString", "emailAddress");
    }
  }
  return v6;
}

- (SGEmailAddress)initWithEmailAddress:(id)a3 label:(id)a4 extractionInfo:(id)a5 recordId:(id)a6
{
  id v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SGEmailAddress;
  v11 = [(SGLabeledObject *)&v15 initWithLabel:a4 extractionInfo:a5 recordId:a6];
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    emailAddress = v11->_emailAddress;
    v11->_emailAddress = (NSString *)v12;
  }
  return v11;
}

+ (id)emailAddress:(id)a3 label:(id)a4 extractionType:(unint64_t)a5 withRecordId:(id)a6
{
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = +[SGExtractionInfo extractionInfoWithExtractionType:a5 modelVersion:0 confidence:0];
  v13 = +[SGEmailAddress emailAddress:v11 label:v10 extractionInfo:v12 withRecordId:v9];

  return v13;
}

+ (id)emailAddress:(id)a3 label:(id)a4 extractionType:(unint64_t)a5 withRecordId:(id)a6 origin:(id)a7
{
  return +[SGEmailAddress emailAddress:label:extractionType:withRecordId:](SGEmailAddress, "emailAddress:label:extractionType:withRecordId:", a3, a4, a5, a6, a7);
}

+ (id)emailAddress:(id)a3 label:(id)a4 extractionInfo:(id)a5 withRecordId:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [[SGEmailAddress alloc] initWithEmailAddress:v12 label:v11 extractionInfo:v10 recordId:v9];

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end