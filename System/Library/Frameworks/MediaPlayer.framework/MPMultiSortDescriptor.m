@interface MPMultiSortDescriptor
+ (BOOL)supportsSecureCoding;
+ (id)sortDescriptorWithRelatedProperties:(id)a3 ascending:(BOOL)a4;
- (MPMultiSortDescriptor)initWithCoder:(id)a3;
- (NSDictionary)relatedProperties;
- (void)encodeWithCoder:(id)a3;
- (void)setRelatedProperties:(id)a3;
@end

@implementation MPMultiSortDescriptor

- (void).cxx_destruct
{
}

- (void)setRelatedProperties:(id)a3
{
}

- (NSDictionary)relatedProperties
{
  return self->_relatedProperties;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MPMultiSortDescriptor;
  id v4 = a3;
  [(MPMultiSortDescriptor *)&v6 encodeWithCoder:v4];
  v5 = [(MPMultiSortDescriptor *)self relatedProperties];
  [v4 encodeObject:v5 forKey:@"relatedProperties"];
}

- (MPMultiSortDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MPMultiSortDescriptor;
  v5 = [(MPMultiSortDescriptor *)&v11 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v9 = [v4 decodeObjectOfClasses:v8 forKey:@"relatedProperties"];
    [(MPMultiSortDescriptor *)v5 setRelatedProperties:v9];
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)sortDescriptorWithRelatedProperties:(id)a3 ascending:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = objc_alloc((Class)objc_opt_class());
  uint64_t v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  v9 = (void *)[v6 initWithKey:v8 ascending:v4];

  [v9 setRelatedProperties:v5];

  return v9;
}

@end