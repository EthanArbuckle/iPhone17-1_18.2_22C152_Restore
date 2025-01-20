@interface MADTextInput
+ (BOOL)supportsSecureCoding;
+ (int64_t)csuTokenizerRevision;
+ (int64_t)csuTokenizerRevisionForEmbeddingVersion:(unint64_t)a3;
+ (int64_t)tokenizerRevision;
+ (void)tokenizerRevision;
- (MADTextInput)init;
- (MADTextInput)initWithCoder:(id)a3;
- (MADTextInput)initWithText:(id)a3;
- (NSArray)segments;
- (id)description;
- (void)addEntityUUID:(id)a3;
- (void)addText:(id)a3;
- (void)addTokenIDs:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MADTextInput

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADTextInput)init
{
  v6.receiver = self;
  v6.super_class = (Class)MADTextInput;
  v2 = [(MADTextInput *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    segments = v2->_segments;
    v2->_segments = (NSMutableArray *)v3;
  }
  return v2;
}

- (MADTextInput)initWithText:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MADTextInput;
  v5 = [(MADTextInput *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    segments = v5->_segments;
    v5->_segments = (NSMutableArray *)v6;

    v8 = v5->_segments;
    v9 = [[MADTextInputTextSegment alloc] initWithText:v4];
    [(NSMutableArray *)v8 addObject:v9];
  }
  return v5;
}

- (MADTextInput)initWithCoder:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MADTextInput;
  v5 = [(MADTextInput *)&v12 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
    v8 = [v6 setWithArray:v7];

    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"Segments"];
    segments = v5->_segments;
    v5->_segments = (NSMutableArray *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (NSArray)segments
{
  return (NSArray *)self->_segments;
}

- (void)addEntityUUID:(id)a3
{
  segments = self->_segments;
  id v4 = a3;
  v5 = [[MADTextInputEntitySegment alloc] initWithEntityUUID:v4];

  [(NSMutableArray *)segments addObject:v5];
}

- (void)addText:(id)a3
{
  segments = self->_segments;
  id v4 = a3;
  v5 = [[MADTextInputTextSegment alloc] initWithText:v4];

  [(NSMutableArray *)segments addObject:v5];
}

+ (int64_t)tokenizerRevision
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    +[MADTextInput tokenizerRevision]();
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

+ (int64_t)csuTokenizerRevision
{
  if (_os_feature_enabled_impl()) {
    return 9;
  }
  else {
    return 8;
  }
}

+ (int64_t)csuTokenizerRevisionForEmbeddingVersion:(unint64_t)a3
{
  if (a3 - 1 < 5) {
    return qword_1DCCC94E0[a3 - 1];
  }
  int v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    +[MADTextInput csuTokenizerRevisionForEmbeddingVersion:](v4);
  }
  return 0;
}

- (void)addTokenIDs:(id)a3
{
  segments = self->_segments;
  id v4 = a3;
  v5 = [[MADTextInputTokenSegment alloc] initWithTokenIDs:v4];

  [(NSMutableArray *)segments addObject:v5];
}

- (id)description
{
  uint64_t v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p, ", v5, self];

  [v3 appendFormat:@"segments: %@>", self->_segments];
  return v3;
}

- (void).cxx_destruct
{
}

+ (void)tokenizerRevision
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1DCC91000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "MD4 tokenization not supported through CSUSystemSearchTextEncoderV1", v0, 2u);
}

+ (void)csuTokenizerRevisionForEmbeddingVersion:(int)a1 .cold.1(int a1)
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_1DCC91000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Tokenizer revision unknown for specified embedding version (%d)", (uint8_t *)v1, 8u);
}

@end