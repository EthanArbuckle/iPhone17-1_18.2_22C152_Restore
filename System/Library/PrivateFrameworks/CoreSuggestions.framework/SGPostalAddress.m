@interface SGPostalAddress
+ (BOOL)supportsSecureCoding;
+ (id)postalAddress:(id)a3 components:(id)a4 label:(id)a5 extractionInfo:(id)a6 recordId:(id)a7;
+ (id)postalAddress:(id)a3 components:(id)a4 label:(id)a5 extractionType:(unint64_t)a6 recordId:(id)a7;
+ (id)postalAddress:(id)a3 components:(id)a4 label:(id)a5 extractionType:(unint64_t)a6 recordId:(id)a7 origin:(id)a8;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPostalAddress:(id)a3;
- (NSString)address;
- (NSString)rawAddress;
- (SGPostalAddress)initWithAddress:(id)a3 components:(id)a4 label:(id)a5 extractionInfo:(id)a6 recordId:(id)a7;
- (SGPostalAddress)initWithCoder:(id)a3;
- (SGPostalAddressComponents)components;
- (id)description;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SGPostalAddress

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_components, 0);
  objc_storeStrong((id *)&self->_rawAddress, 0);

  objc_storeStrong((id *)&self->_cachedAddress, 0);
}

- (SGPostalAddressComponents)components
{
  return self->_components;
}

- (NSString)rawAddress
{
  return self->_rawAddress;
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = [(SGLabeledObject *)self label];
  if ([v4 length])
  {
    v5 = [(SGLabeledObject *)self label];
    v6 = (void *)[v3 initWithFormat:@"%@/'%@'", v5, self->_rawAddress];
  }
  else
  {
    v6 = (void *)[v3 initWithFormat:@"%@/'%@'", @"unlabeled", self->_rawAddress];
  }

  return v6;
}

- (unint64_t)hash
{
  return [(NSString *)self->_rawAddress hash];
}

- (BOOL)isEqualToPostalAddress:(id)a3
{
  v4 = (id *)a3;
  if (![(SGLabeledObject *)self isEqualToLabeledObject:v4]) {
    goto LABEL_4;
  }
  rawAddress = self->_rawAddress;
  v6 = (NSString *)v4[14];
  if (rawAddress == v6)
  {
  }
  else
  {
    v7 = v6;
    v8 = rawAddress;
    char v9 = [(NSString *)v8 isEqual:v7];

    if ((v9 & 1) == 0)
    {
LABEL_4:
      char v10 = 0;
      goto LABEL_10;
    }
  }
  v11 = self->_components;
  v12 = v11;
  if (v11 == v4[15]) {
    char v10 = 1;
  }
  else {
    char v10 = -[SGPostalAddressComponents isEqual:](v11, "isEqual:");
  }

LABEL_10:
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SGPostalAddress *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGPostalAddress *)self isEqualToPostalAddress:v5];

  return v6;
}

- (NSString)address
{
  p_cachedAddressLock = &self->_cachedAddressLock;
  pthread_mutex_lock(&self->_cachedAddressLock);
  if (!self->_cachedAddress)
  {
    collapseWhitespaceAndStrip(self->_rawAddress);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    cachedAddress = self->_cachedAddress;
    self->_cachedAddress = v4;
  }
  pthread_mutex_unlock(p_cachedAddressLock);
  BOOL v6 = self->_cachedAddress;

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SGPostalAddress;
  id v4 = a3;
  [(SGLabeledObject *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_rawAddress, @"rawAddress", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_components forKey:@"components"];
}

- (void)dealloc
{
  pthread_mutex_destroy(&self->_cachedAddressLock);
  v3.receiver = self;
  v3.super_class = (Class)SGPostalAddress;
  [(SGPostalAddress *)&v3 dealloc];
}

- (SGPostalAddress)initWithCoder:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SGPostalAddress;
  BOOL v6 = [(SGLabeledObject *)&v16 initWithCoder:v5];
  if (v6)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    v8 = [v5 decodeObjectOfClasses:v7 forKey:@"rawAddress"];

    if (v8)
    {
      char v9 = v8;
      rawAddress = v6->_rawAddress;
      v6->_rawAddress = v9;
    }
    else
    {
      rawAddress = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(rawAddress, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, @"SGPostalAddress.m", 163, @"nonnull property %s *%s was null when decoded", "NSString", "rawAddress");
    }

    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    v12 = [v5 decodeObjectOfClasses:v11 forKey:@"components"];

    if (v12)
    {
      v13 = v12;
      components = v6->_components;
      v6->_components = v13;
    }
    else
    {
      components = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(components, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, @"SGPostalAddress.m", 164, @"nonnull property %s *%s was null when decoded", "SGPostalAddressComponents", "components");
    }

    pthread_mutex_init(&v6->_cachedAddressLock, 0);
  }

  return v6;
}

- (SGPostalAddress)initWithAddress:(id)a3 components:(id)a4 label:(id)a5 extractionInfo:(id)a6 recordId:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SGPostalAddress;
  v14 = [(SGLabeledObject *)&v18 initWithLabel:a5 extractionInfo:a6 recordId:a7];
  if (v14)
  {
    uint64_t v15 = [v12 copy];
    rawAddress = v14->_rawAddress;
    v14->_rawAddress = (NSString *)v15;

    pthread_mutex_init(&v14->_cachedAddressLock, 0);
    objc_storeStrong((id *)&v14->_components, a4);
  }

  return v14;
}

+ (id)postalAddress:(id)a3 components:(id)a4 label:(id)a5 extractionType:(unint64_t)a6 recordId:(id)a7
{
  id v11 = a7;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  uint64_t v15 = +[SGExtractionInfo extractionInfoWithExtractionType:a6 modelVersion:0 confidence:0];
  objc_super v16 = +[SGPostalAddress postalAddress:v14 components:v13 label:v12 extractionInfo:v15 recordId:v11];

  return v16;
}

+ (id)postalAddress:(id)a3 components:(id)a4 label:(id)a5 extractionType:(unint64_t)a6 recordId:(id)a7 origin:(id)a8
{
  return +[SGPostalAddress postalAddress:components:label:extractionType:recordId:](SGPostalAddress, "postalAddress:components:label:extractionType:recordId:", a3, a4, a5, a6, a7, a8);
}

+ (id)postalAddress:(id)a3 components:(id)a4 label:(id)a5 extractionInfo:(id)a6 recordId:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  objc_super v16 = [[SGPostalAddress alloc] initWithAddress:v15 components:v14 label:v13 extractionInfo:v12 recordId:v11];

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end