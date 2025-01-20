@interface DMFRefreshStatusResultObject
+ (BOOL)supportsSecureCoding;
- (DMFRefreshStatusResultObject)initWithCoder:(id)a3;
- (NSNumber)numberOfUpdates;
- (void)encodeWithCoder:(id)a3;
- (void)setNumberOfUpdates:(id)a3;
@end

@implementation DMFRefreshStatusResultObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFRefreshStatusResultObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)DMFRefreshStatusResultObject;
  v5 = [(CATTaskResultObject *)&v21 initWithCoder:v4];
  if (v5)
  {
    v20 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v19 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v20, "setWithObjects:", v19, v18, v6, v7, v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"numberOfUpdates"];
    numberOfUpdates = v5->_numberOfUpdates;
    v5->_numberOfUpdates = (NSNumber *)v15;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DMFRefreshStatusResultObject;
  id v4 = a3;
  [(CATTaskResultObject *)&v6 encodeWithCoder:v4];
  v5 = [(DMFRefreshStatusResultObject *)self numberOfUpdates];
  [v4 encodeObject:v5 forKey:@"numberOfUpdates"];
}

- (NSNumber)numberOfUpdates
{
  return self->_numberOfUpdates;
}

- (void)setNumberOfUpdates:(id)a3
{
}

- (void).cxx_destruct
{
}

@end