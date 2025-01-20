@interface _HKDocumentQueryServerConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)includeDocumentData;
- (NSArray)sortDescriptors;
- (_HKDocumentQueryServerConfiguration)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)limit;
- (void)encodeWithCoder:(id)a3;
- (void)setIncludeDocumentData:(BOOL)a3;
- (void)setLimit:(unint64_t)a3;
- (void)setSortDescriptors:(id)a3;
@end

@implementation _HKDocumentQueryServerConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_HKDocumentQueryServerConfiguration;
  id v4 = [(HKQueryServerConfiguration *)&v6 copyWithZone:a3];
  [v4 setSortDescriptors:self->_sortDescriptors];
  [v4 setLimit:self->_limit];
  [v4 setIncludeDocumentData:self->_includeDocumentData];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HKDocumentQueryServerConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_HKDocumentQueryServerConfiguration;
  v5 = [(HKQueryServerConfiguration *)&v12 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"sortDescriptors"];
    sortDescriptors = v5->_sortDescriptors;
    v5->_sortDescriptors = (NSArray *)v9;

    v5->_limit = [v4 decodeIntegerForKey:@"limit"];
    v5->_includeDocumentData = [v4 decodeBoolForKey:@"includeDocumentData"];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_HKDocumentQueryServerConfiguration;
  id v4 = a3;
  [(HKQueryServerConfiguration *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_sortDescriptors, @"sortDescriptors", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_limit forKey:@"limit"];
  [v4 encodeBool:self->_includeDocumentData forKey:@"includeDocumentData"];
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (void)setSortDescriptors:(id)a3
{
}

- (unint64_t)limit
{
  return self->_limit;
}

- (void)setLimit:(unint64_t)a3
{
  self->_limit = a3;
}

- (BOOL)includeDocumentData
{
  return self->_includeDocumentData;
}

- (void)setIncludeDocumentData:(BOOL)a3
{
  self->_includeDocumentData = a3;
}

- (void).cxx_destruct
{
}

@end