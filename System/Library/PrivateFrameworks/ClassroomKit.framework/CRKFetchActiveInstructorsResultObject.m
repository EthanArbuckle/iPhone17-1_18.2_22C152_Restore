@interface CRKFetchActiveInstructorsResultObject
+ (BOOL)supportsSecureCoding;
- (CRKFetchActiveInstructorsResultObject)initWithCoder:(id)a3;
- (NSArray)instructors;
- (void)encodeWithCoder:(id)a3;
- (void)setInstructors:(id)a3;
@end

@implementation CRKFetchActiveInstructorsResultObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKFetchActiveInstructorsResultObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CRKFetchActiveInstructorsResultObject;
  v5 = [(CATTaskResultObject *)&v12 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"instructors"];
    instructors = v5->_instructors;
    v5->_instructors = (NSArray *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRKFetchActiveInstructorsResultObject;
  id v4 = a3;
  [(CATTaskResultObject *)&v6 encodeWithCoder:v4];
  v5 = [(CRKFetchActiveInstructorsResultObject *)self instructors];
  [v4 encodeObject:v5 forKey:@"instructors"];
}

- (NSArray)instructors
{
  return self->_instructors;
}

- (void)setInstructors:(id)a3
{
}

- (void).cxx_destruct
{
}

@end