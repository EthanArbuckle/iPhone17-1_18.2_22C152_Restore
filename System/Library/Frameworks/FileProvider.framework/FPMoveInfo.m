@interface FPMoveInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)byCopy;
- (BOOL)byMoving;
- (BOOL)shouldBounce;
- (FPActionOperationLocator)targetFolder;
- (FPMoveInfo)initWithCoder:(id)a3;
- (FPMoveInfo)initWithOperationID:(id)a3 roots:(id)a4 rootFilenames:(id)a5 targetFolder:(id)a6 lastUsedDatePolicy:(unint64_t)a7 bounce:(BOOL)a8 byCopy:(BOOL)a9;
- (NSArray)rootFilenames;
- (id)description;
- (unint64_t)lastUsedDatePolicy;
- (void)encodeWithCoder:(id)a3;
- (void)setByCopy:(BOOL)a3;
- (void)setLastUsedDatePolicy:(unint64_t)a3;
- (void)setRootFilenames:(id)a3;
- (void)setShouldBounce:(BOOL)a3;
- (void)setTargetFolder:(id)a3;
@end

@implementation FPMoveInfo

- (FPMoveInfo)initWithOperationID:(id)a3 roots:(id)a4 rootFilenames:(id)a5 targetFolder:(id)a6 lastUsedDatePolicy:(unint64_t)a7 bounce:(BOOL)a8 byCopy:(BOOL)a9
{
  id v16 = a5;
  id v17 = a6;
  v21.receiver = self;
  v21.super_class = (Class)FPMoveInfo;
  v18 = [(FPActionOperationInfo *)&v21 initWithOperationID:a3 roots:a4];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_targetFolder, a6);
    v19->_lastUsedDatePolicy = a7;
    v19->_shouldBounce = a8;
    v19->_byCopy = a9;
    objc_storeStrong((id *)&v19->_rootFilenames, a5);
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FPMoveInfo;
  id v4 = a3;
  [(FPActionOperationInfo *)&v5 encodeWithCoder:v4];
  if ([(FPActionOperationInfo *)self attachSandboxExtensionsOnXPCEncoding])
  {
    [(FPActionOperationLocator *)self->_targetFolder attachSandboxExtensionOnXPCEncoding];
  }
  [v4 encodeObject:self->_targetFolder forKey:@"_targetFolder"];
  [v4 encodeInteger:self->_lastUsedDatePolicy forKey:@"_lastUsedDatePolicy"];
  [v4 encodeBool:self->_shouldBounce forKey:@"_shouldBounce"];
  [v4 encodeBool:self->_byCopy forKey:@"_byCopy"];
  [v4 encodeObject:self->_rootFilenames forKey:@"_rootFilenames"];
}

- (FPMoveInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FPMoveInfo;
  objc_super v5 = [(FPActionOperationInfo *)&v14 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_targetFolder"];
    targetFolder = v5->_targetFolder;
    v5->_targetFolder = (FPActionOperationLocator *)v6;

    v5->_lastUsedDatePolicy = [v4 decodeIntegerForKey:@"_lastUsedDatePolicy"];
    v5->_shouldBounce = [v4 decodeBoolForKey:@"_shouldBounce"];
    v5->_byCopy = [v4 decodeBoolForKey:@"_byCopy"];
    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"_rootFilenames"];
    rootFilenames = v5->_rootFilenames;
    v5->_rootFilenames = (NSArray *)v11;
  }
  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"{ "];
  id v4 = v3;
  if (self->_byCopy) {
    objc_super v5 = @"copy ";
  }
  else {
    objc_super v5 = @"move ";
  }
  [v3 appendString:v5];
  uint64_t v6 = [(FPActionOperationInfo *)self roots];
  [v4 appendFormat:@"roots:%@ ", v6];

  v7 = [(FPMoveInfo *)self rootFilenames];
  [v4 appendFormat:@"dst-names:%@ ", v7];

  [v4 appendFormat:@"target:%@ ", self->_targetFolder];
  uint64_t v8 = 121;
  if (!self->_shouldBounce) {
    uint64_t v8 = 110;
  }
  objc_msgSend(v4, "appendFormat:", @"bounce:%c ", v8);
  objc_msgSend(v4, "appendFormat:", @"qos:%2.0x ", -[FPActionOperationInfo qos](self, "qos"));
  [v4 appendString:@"}"];

  return v4;
}

- (BOOL)byMoving
{
  return !self->_byCopy;
}

- (FPActionOperationLocator)targetFolder
{
  return self->_targetFolder;
}

- (void)setTargetFolder:(id)a3
{
}

- (NSArray)rootFilenames
{
  return self->_rootFilenames;
}

- (void)setRootFilenames:(id)a3
{
}

- (unint64_t)lastUsedDatePolicy
{
  return self->_lastUsedDatePolicy;
}

- (void)setLastUsedDatePolicy:(unint64_t)a3
{
  self->_lastUsedDatePolicy = a3;
}

- (BOOL)shouldBounce
{
  return self->_shouldBounce;
}

- (void)setShouldBounce:(BOOL)a3
{
  self->_shouldBounce = a3;
}

- (BOOL)byCopy
{
  return self->_byCopy;
}

- (void)setByCopy:(BOOL)a3
{
  self->_byCopy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootFilenames, 0);

  objc_storeStrong((id *)&self->_targetFolder, 0);
}

@end