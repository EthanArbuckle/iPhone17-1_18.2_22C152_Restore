@interface APTargetingDimensions
+ (BOOL)supportsSecureCoding;
- (APTargetingDimensions)initWithCoder:(id)a3;
- (NSArray)exclusionCriteria;
- (NSArray)inclusionCriteria;
- (void)encodeWithCoder:(id)a3;
- (void)setExclusionCriteria:(id)a3;
- (void)setInclusionCriteria:(id)a3;
@end

@implementation APTargetingDimensions

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (APTargetingDimensions)initWithCoder:(id)a3
{
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)APTargetingDimensions;
  v5 = [(APTargetingDimensions *)&v37 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v14 = objc_msgSend_setWithObjects_(v6, v9, v7, v10, v11, v12, v13, v8, 0);
    uint64_t v19 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v15, (uint64_t)v14, @"inclusionCriteria", v16, v17, v18);
    inclusionCriteria = v5->_inclusionCriteria;
    v5->_inclusionCriteria = (NSArray *)v19;

    v21 = (void *)MEMORY[0x263EFFA08];
    uint64_t v22 = objc_opt_class();
    uint64_t v23 = objc_opt_class();
    v29 = objc_msgSend_setWithObjects_(v21, v24, v22, v25, v26, v27, v28, v23, 0);
    uint64_t v34 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v30, (uint64_t)v29, @"exclusionCriteria", v31, v32, v33);
    exclusionCriteria = v5->_exclusionCriteria;
    v5->_exclusionCriteria = (NSArray *)v34;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  inclusionCriteria = self->_inclusionCriteria;
  id v13 = a3;
  objc_msgSend_encodeObject_forKey_(v13, v5, (uint64_t)inclusionCriteria, @"inclusionCriteria", v6, v7, v8);
  objc_msgSend_encodeObject_forKey_(v13, v9, (uint64_t)self->_exclusionCriteria, @"exclusionCriteria", v10, v11, v12);
}

- (NSArray)inclusionCriteria
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setInclusionCriteria:(id)a3
{
}

- (NSArray)exclusionCriteria
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setExclusionCriteria:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exclusionCriteria, 0);
  objc_storeStrong((id *)&self->_inclusionCriteria, 0);
}

@end