@interface _DASFastPass
+ (BOOL)supportsSecureCoding;
- (NSArray)processingTaskIdentifiers;
- (_DASFastPass)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)semanticVersion;
- (void)encodeWithCoder:(id)a3;
- (void)setProcessingTaskIdentifiers:(id)a3;
- (void)setSemanticVersion:(int64_t)a3;
@end

@implementation _DASFastPass

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_DASFastPass)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_DASFastPass;
  v5 = [(_DASFastPass *)&v15 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v9 = [v4 decodeObjectOfClasses:v8 forKey:@"processingTaskIdentifiers"];
    v10 = (void *)[v9 mutableCopy];

    uint64_t v11 = [v10 copy];
    processingTaskIdentifiers = v5->_processingTaskIdentifiers;
    v5->_processingTaskIdentifiers = (NSArray *)v11;

    v5->_semanticVersion = [v4 decodeIntegerForKey:@"kSemanticIdentifier"];
    v13 = v5;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(_DASFastPass *)self processingTaskIdentifiers];

  if (v4) {
    [v5 encodeObject:self->_processingTaskIdentifiers forKey:@"processingTaskIdentifiers"];
  }
  objc_msgSend(v5, "encodeInteger:forKey:", -[_DASFastPass semanticVersion](self, "semanticVersion"), @"kSemanticIdentifier");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc_init(_DASFastPass);
  v6 = [(_DASFastPass *)self processingTaskIdentifiers];
  uint64_t v7 = (void *)[v6 copyWithZone:a3];
  [(_DASFastPass *)v5 setProcessingTaskIdentifiers:v7];

  [(_DASFastPass *)v5 setSemanticVersion:[(_DASFastPass *)self semanticVersion]];
  return v5;
}

- (NSArray)processingTaskIdentifiers
{
  return self->_processingTaskIdentifiers;
}

- (void)setProcessingTaskIdentifiers:(id)a3
{
}

- (int64_t)semanticVersion
{
  return self->_semanticVersion;
}

- (void)setSemanticVersion:(int64_t)a3
{
  self->_semanticVersion = a3;
}

- (void).cxx_destruct
{
}

@end