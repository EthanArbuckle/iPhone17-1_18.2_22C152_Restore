@interface SGLabeledObject
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToLabeledObject:(id)a3;
- (NSString)label;
- (SGExtractionInfo)extractionInfo;
- (SGLabeledObject)initWithCoder:(id)a3;
- (SGLabeledObject)initWithLabel:(id)a3 extractionInfo:(id)a4 recordId:(id)a5;
- (SGLabeledObject)initWithLabel:(id)a3 extractionType:(unint64_t)a4 recordId:(id)a5 origin:(id)a6;
- (unint64_t)extractionType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SGLabeledObject

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extractionInfo, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

- (SGExtractionInfo)extractionInfo
{
  return self->_extractionInfo;
}

- (NSString)label
{
  return self->_label;
}

- (unint64_t)extractionType
{
  return [(SGExtractionInfo *)self->_extractionInfo extractionType];
}

- (BOOL)isEqualToLabeledObject:(id)a3
{
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v9.receiver = self,
        v9.super_class = (Class)SGLabeledObject,
        [(SGObject *)&v9 isEqualToSuggestion:v4]))
  {
    v5 = self->_label;
    v6 = v5;
    if (v5 == (NSString *)v4[3]) {
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
  v4 = (SGLabeledObject *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGLabeledObject *)self isEqualToLabeledObject:v5];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SGLabeledObject;
  id v4 = a3;
  [(SGObject *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_label, @"label", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_extractionInfo forKey:@"extractionInfo"];
}

- (SGLabeledObject)initWithCoder:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SGLabeledObject;
  BOOL v6 = [(SGObject *)&v15 initWithCoder:v5];
  if (v6)
  {
    char v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v8 = [v5 decodeObjectOfClasses:v7 forKey:@"label"];
    label = v6->_label;
    v6->_label = (NSString *)v8;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    v11 = [v5 decodeObjectOfClasses:v10 forKey:@"extractionInfo"];

    if (v11)
    {
      v12 = v11;
      extractionInfo = v6->_extractionInfo;
      v6->_extractionInfo = v12;
    }
    else
    {
      extractionInfo = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(extractionInfo, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, @"SGLabeledObject.m", 49, @"nonnull property %s *%s was null when decoded", "SGExtractionInfo", "extractionInfo");
    }
  }
  return v6;
}

- (SGLabeledObject)initWithLabel:(id)a3 extractionType:(unint64_t)a4 recordId:(id)a5 origin:(id)a6
{
  id v9 = a5;
  id v10 = a3;
  v11 = +[SGExtractionInfo extractionInfoWithExtractionType:a4 modelVersion:0 confidence:0];
  v12 = [(SGLabeledObject *)self initWithLabel:v10 extractionInfo:v11 recordId:v9];

  return v12;
}

- (SGLabeledObject)initWithLabel:(id)a3 extractionInfo:(id)a4 recordId:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = +[SGOrigin originWithType:0 sourceKey:0 externalKey:0 fromForwardedMessage:0];
  v16.receiver = self;
  v16.super_class = (Class)SGLabeledObject;
  v12 = [(SGObject *)&v16 initWithRecordId:v10 origin:v11];

  if (v12)
  {
    uint64_t v13 = [v8 copy];
    label = v12->_label;
    v12->_label = (NSString *)v13;

    objc_storeStrong((id *)&v12->_extractionInfo, a4);
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end