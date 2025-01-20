@interface FPTestingOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (FPTestingOperation)initWithCoder:(id)a3;
- (FPTestingOperation)initWithOperationIdentifier:(id)a3;
- (NSString)description;
- (id)asChildrenEnumeration;
- (id)asCollisionResolution;
- (id)asContentFetch;
- (id)asCreation;
- (id)asDeletion;
- (id)asIngestion;
- (id)asLookup;
- (id)asModification;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FPTestingOperation

- (FPTestingOperation)initWithOperationIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FPTestingOperation;
  v6 = [(FPTestingOperation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_operationIdentifier, a3);
  }

  return v7;
}

- (unint64_t)hash
{
  return [(NSString *)self->_operationIdentifier hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (id *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v5 = [v4[1] isEqualToString:self->_operationIdentifier];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (FPTestingOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  char v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_operationIdentifier"];

  if (v5)
  {
    self = [(FPTestingOperation *)self initWithOperationIdentifier:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)type
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = [NSString stringWithFormat:@"should be implemented by subclasses"];
  v3 = fp_current_or_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    int v4 = 138543362;
    char v5 = v2;
    _os_log_fault_impl(&dword_1A33AE000, v3, OS_LOG_TYPE_FAULT, "[CRIT] %{public}@", (uint8_t *)&v4, 0xCu);
  }

  __assert_rtn("-[FPTestingOperation type]", "/Library/Caches/com.apple.xbs/Sources/FileProvider/framework/FPTestingOperations.m", 67, (const char *)[v2 UTF8String]);
}

- (id)asIngestion
{
  return 0;
}

- (id)asLookup
{
  return 0;
}

- (id)asCreation
{
  return 0;
}

- (id)asModification
{
  return 0;
}

- (id)asDeletion
{
  return 0;
}

- (id)asContentFetch
{
  return 0;
}

- (id)asChildrenEnumeration
{
  return 0;
}

- (id)asCollisionResolution
{
  return 0;
}

- (NSString)description
{
  return self->_operationIdentifier;
}

- (void).cxx_destruct
{
}

@end