@interface FHFeaturesResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (FHFeaturesResponse)initWithCoder:(id)a3;
- (FHFeaturesResponse)initWithSmartFeatures:(id)a3 aggregateFeatureswithProcessingWindow:(id)a4 compoundFeatures:(id)a5 transactionID:(id)a6;
- (NSArray)aggregateFeatures;
- (NSArray)aggregateFeaturesWithProcessingWindow;
- (NSArray)compoundFeatures;
- (NSString)transactionIdentifier;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FHFeaturesResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  aggregateFeatures = self->_aggregateFeatures;
  id v5 = a3;
  [v5 encodeObject:aggregateFeatures forKey:@"aggregateFeatures"];
  [v5 encodeObject:self->_aggregateFeaturesWithProcessingWindow forKey:@"aggregateFeaturesWithProcessingWindow"];
  [v5 encodeObject:self->_compoundFeatures forKey:@"compoundFeatures"];
  [v5 encodeObject:self->_transactionIdentifier forKey:@"identifier"];
}

- (FHFeaturesResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FHFeaturesResponse;
  id v5 = [(FHFeaturesResponse *)&v26 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    transactionIdentifier = v5->_transactionIdentifier;
    v5->_transactionIdentifier = (NSString *)v6;

    v8 = (void *)MEMORY[0x263EFFA08];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"aggregateFeatures"];
    aggregateFeatures = v5->_aggregateFeatures;
    v5->_aggregateFeatures = (NSArray *)v11;

    v13 = (void *)MEMORY[0x263EFFA08];
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    v17 = objc_msgSend(v13, "setWithObjects:", v14, v15, v16, objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"aggregateFeaturesWithProcessingWindow"];
    aggregateFeaturesWithProcessingWindow = v5->_aggregateFeaturesWithProcessingWindow;
    v5->_aggregateFeaturesWithProcessingWindow = (NSArray *)v18;

    v20 = (void *)MEMORY[0x263EFFA08];
    uint64_t v21 = objc_opt_class();
    v22 = objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
    uint64_t v23 = [v4 decodeObjectOfClasses:v22 forKey:@"compoundFeatures"];
    compoundFeatures = v5->_compoundFeatures;
    v5->_compoundFeatures = (NSArray *)v23;
  }
  return v5;
}

- (FHFeaturesResponse)initWithSmartFeatures:(id)a3 aggregateFeatureswithProcessingWindow:(id)a4 compoundFeatures:(id)a5 transactionID:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)FHFeaturesResponse;
  uint64_t v15 = [(FHFeaturesResponse *)&v18 init];
  uint64_t v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_aggregateFeatures, a3);
    objc_storeStrong((id *)&v16->_aggregateFeaturesWithProcessingWindow, a4);
    objc_storeStrong((id *)&v16->_compoundFeatures, a5);
    objc_storeStrong((id *)&v16->_transactionIdentifier, a6);
  }

  return v16;
}

- (id)description
{
  v3 = [MEMORY[0x263F089D8] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"%@: '%@'; ", @"aggregateFeatures", self->_aggregateFeatures];
  objc_msgSend(v3, "appendFormat:", @"%@: '%@'; ",
    @"aggregateFeaturesWithProcessingWindow",
    self->_aggregateFeaturesWithProcessingWindow);
  [v3 appendFormat:@"%@: '%@'; ", @"compoundFeatures", self->_compoundFeatures];
  [v3 appendFormat:@"%@: '%@'; ", @"identifier", self->_transactionIdentifier];
  [v3 appendFormat:@">"];
  id v4 = [NSString stringWithString:v3];

  return v4;
}

- (unint64_t)hash
{
  v3 = [(FHFeaturesResponse *)self aggregateFeatures];
  uint64_t v4 = [v3 hash];

  id v5 = [(FHFeaturesResponse *)self aggregateFeaturesWithProcessingWindow];
  uint64_t v6 = [v5 hash] - v4 + 32 * v4;

  v7 = [(FHFeaturesResponse *)self compoundFeatures];
  uint64_t v8 = [v7 hash] - v6 + 32 * v6;

  uint64_t v9 = [(FHFeaturesResponse *)self transactionIdentifier];
  unint64_t v10 = [v9 hash] - v8 + 32 * v8 + 923521;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (FHFeaturesResponse *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    char v14 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    aggregateFeatures = self->_aggregateFeatures;
    v7 = [(FHFeaturesResponse *)v5 aggregateFeatures];
    if ([(NSArray *)aggregateFeatures isEqual:v7])
    {
      aggregateFeaturesWithProcessingWindow = self->_aggregateFeaturesWithProcessingWindow;
      uint64_t v9 = [(FHFeaturesResponse *)v5 aggregateFeaturesWithProcessingWindow];
      if ([(NSArray *)aggregateFeaturesWithProcessingWindow isEqual:v9])
      {
        compoundFeatures = self->_compoundFeatures;
        id v11 = [(FHFeaturesResponse *)v5 compoundFeatures];
        if ([(NSArray *)compoundFeatures isEqual:v11])
        {
          transactionIdentifier = self->_transactionIdentifier;
          id v13 = [(FHFeaturesResponse *)v5 transactionIdentifier];
          char v14 = [(NSString *)transactionIdentifier isEqual:v13];
        }
        else
        {
          char v14 = 0;
        }
      }
      else
      {
        char v14 = 0;
      }
    }
    else
    {
      char v14 = 0;
    }
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

- (NSArray)aggregateFeatures
{
  return self->_aggregateFeatures;
}

- (NSArray)compoundFeatures
{
  return self->_compoundFeatures;
}

- (NSString)transactionIdentifier
{
  return self->_transactionIdentifier;
}

- (NSArray)aggregateFeaturesWithProcessingWindow
{
  return self->_aggregateFeaturesWithProcessingWindow;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aggregateFeaturesWithProcessingWindow, 0);
  objc_storeStrong((id *)&self->_transactionIdentifier, 0);
  objc_storeStrong((id *)&self->_compoundFeatures, 0);
  objc_storeStrong((id *)&self->_aggregateFeatures, 0);
}

@end