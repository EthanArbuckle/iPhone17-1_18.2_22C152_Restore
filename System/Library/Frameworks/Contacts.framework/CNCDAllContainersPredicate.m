@interface CNCDAllContainersPredicate
+ (BOOL)supportsSecureCoding;
- (BOOL)includeDisabledContainers;
- (CNCDAllContainersPredicate)initWithCoder:(id)a3;
- (CNCDAllContainersPredicate)initWithIncludeDisabledContainers:(BOOL)a3;
- (id)cn_persistenceFilterRequest;
- (id)cn_topLevelFilter;
- (void)encodeWithCoder:(id)a3;
- (void)setIncludeDisabledContainers:(BOOL)a3;
@end

@implementation CNCDAllContainersPredicate

- (CNCDAllContainersPredicate)initWithIncludeDisabledContainers:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CNCDAllContainersPredicate;
  v4 = [(CNPredicate *)&v8 initWithPredicate:0];
  v5 = v4;
  if (v4)
  {
    v4->_includeDisabledContainers = a3;
    v6 = v4;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNCDAllContainersPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CNCDAllContainersPredicate;
  v5 = [(CNPredicate *)&v8 initWithCoder:v4];
  if (v5)
  {
    v5->_includeDisabledContainers = [v4 decodeBoolForKey:@"_includeDisabledContainers"];
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNCDAllContainersPredicate;
  id v4 = a3;
  [(CNPredicate *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", self->_includeDisabledContainers, @"_includeDisabledContainers", v5.receiver, v5.super_class);
}

- (id)cn_topLevelFilter
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithValue:1];
}

- (id)cn_persistenceFilterRequest
{
  return 0;
}

- (BOOL)includeDisabledContainers
{
  return self->_includeDisabledContainers;
}

- (void)setIncludeDisabledContainers:(BOOL)a3
{
  self->_includeDisabledContainers = a3;
}

@end