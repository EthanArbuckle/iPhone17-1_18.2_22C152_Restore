@interface CHSBezierPath
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CGPath)cgPath;
- (CHSBezierPath)initWithBSXPCCoder:(id)a3;
- (CHSBezierPath)initWithCGPath:(CGPath *)a3;
- (CHSBezierPath)initWithCoder:(id)a3;
- (id)_initWithCGPathNoCopy:(CGPath *)a3;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHSBezierPath

- (CHSBezierPath)initWithCGPath:(CGPath *)a3
{
  if (!a3)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"CHSBezierPath.m" lineNumber:147 description:@"CHSBezierPath created with a nil path reference. path is non-optional!"];
  }
  Mutable = CGPathCreateMutable();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ____copyPathByApplying_block_invoke;
  block[3] = &__block_descriptor_40_e36_v16__0r__CGPathElement_i__CGPoint__8l;
  block[4] = Mutable;
  CGPathApplyWithBlock(a3, block);
  uint64_t v6 = MEMORY[0x192FD6BD0](Mutable);
  CGPathRelease(Mutable);
  return (CHSBezierPath *)[(CHSBezierPath *)self _initWithCGPathNoCopy:v6];
}

- (id)_initWithCGPathNoCopy:(CGPath *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CHSBezierPath;
  id result = [(CHSBezierPath *)&v5 init];
  if (result) {
    *((void *)result + 1) = a3;
  }
  return result;
}

- (void)dealloc
{
  CGPathRelease(self->_path);
  v3.receiver = self;
  v3.super_class = (Class)CHSBezierPath;
  [(CHSBezierPath *)&v3 dealloc];
}

- (CGPath)cgPath
{
  return self->_path;
}

- (unint64_t)hash
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CGPathRef *)a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && CGPathEqualToPath(self->_path, v4[1]);

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = __encodePathIntoData(self->_path);
  if (!v5)
  {
    uint64_t v6 = CHSLogChronoServices();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CHSBezierPath encodeWithCoder:]();
    }
  }
  [v4 encodeObject:v5 forKey:@"data"];
}

- (CHSBezierPath)initWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
  if (!v5)
  {
    uint64_t v6 = CHSLogChronoServices();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CHSBezierPath initWithCoder:]();
    }
  }
  unint64_t PathByDecodingData = __createPathByDecodingData(v5);
  if (!PathByDecodingData)
  {
    v8 = CHSLogChronoServices();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CHSBezierPath initWithCoder:]();
    }
  }
  v9 = [(CHSBezierPath *)self _initWithCGPathNoCopy:PathByDecodingData];

  return v9;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = __encodePathIntoData(self->_path);
  if (!v5)
  {
    uint64_t v6 = CHSLogChronoServices();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CHSBezierPath encodeWithCoder:]();
    }
  }
  [v4 encodeObject:v5 forKey:@"data"];
}

- (CHSBezierPath)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
  if (!v5)
  {
    uint64_t v6 = CHSLogChronoServices();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CHSBezierPath initWithCoder:]();
    }
  }
  unint64_t PathByDecodingData = __createPathByDecodingData(v5);
  if (!PathByDecodingData)
  {
    v8 = CHSLogChronoServices();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CHSBezierPath initWithCoder:]();
    }
  }
  v9 = [(CHSBezierPath *)self _initWithCGPathNoCopy:PathByDecodingData];

  return v9;
}

- (void)encodeWithCoder:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_190C6F000, v0, v1, "Unexpected got nil data encoding CHSBezierPath", v2, v3, v4, v5, v6);
}

- (void)initWithCoder:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_190C6F000, v0, v1, "Unexpected got nil path decoding CHSBezierPath", v2, v3, v4, v5, v6);
}

- (void)initWithCoder:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_190C6F000, v0, v1, "Unexpected got nil data decoding CHSBezierPath", v2, v3, v4, v5, v6);
}

@end