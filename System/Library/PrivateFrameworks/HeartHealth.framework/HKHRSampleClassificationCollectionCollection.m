@interface HKHRSampleClassificationCollectionCollection
+ (BOOL)supportsSecureCoding;
- (HKHRSampleClassificationCollectionCollection)initWithClassificationCollections:(id)a3;
- (HKHRSampleClassificationCollectionCollection)initWithCoder:(id)a3;
- (NSArray)classificationCollections;
- (void)encodeWithCoder:(id)a3;
- (void)setClassificationCollections:(id)a3;
@end

@implementation HKHRSampleClassificationCollectionCollection

- (HKHRSampleClassificationCollectionCollection)initWithClassificationCollections:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKHRSampleClassificationCollectionCollection;
  v6 = [(HKHRSampleClassificationCollectionCollection *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_classificationCollections, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (HKHRSampleClassificationCollectionCollection)initWithCoder:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKHRSampleClassificationCollectionCollection;
  id v5 = [(HKHRSampleClassificationCollectionCollection *)&v12 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
    v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"ClassificationCollections"];
    classificationCollections = v5->_classificationCollections;
    v5->_classificationCollections = (NSArray *)v9;
  }
  return v5;
}

- (NSArray)classificationCollections
{
  return self->_classificationCollections;
}

- (void)setClassificationCollections:(id)a3
{
}

- (void).cxx_destruct
{
}

@end