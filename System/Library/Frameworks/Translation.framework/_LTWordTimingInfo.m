@interface _LTWordTimingInfo
+ (BOOL)supportsSecureCoding;
- (NSString)unredactedDescription;
- (NSString)word;
- (_LTWordTimingInfo)initWithCoder:(id)a3;
- (_NSRange)textRange;
- (double)startTime;
- (id)description;
- (unsigned)length;
- (unsigned)offset;
- (unsigned)sampleIndex;
- (void)encodeWithCoder:(id)a3;
- (void)setLength:(unsigned int)a3;
- (void)setOffset:(unsigned int)a3;
- (void)setSampleIndex:(unsigned int)a3;
- (void)setStartTime:(double)a3;
- (void)setTextRange:(_NSRange)a3;
- (void)setWord:(id)a3;
@end

@implementation _LTWordTimingInfo

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_word forKey:@"word"];
  uint64_t sampleIndex = self->_sampleIndex;
  if ((sampleIndex & 0x80000000) != 0)
  {
    v6 = _LTOSLogXPC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[_LTWordTimingInfo encodeWithCoder:](v6, v7, v8, v9, v10, v11, v12, v13);
    }
    uint64_t sampleIndex = self->_sampleIndex;
  }
  [v4 encodeInt32:sampleIndex forKey:@"sampleIndex"];
  uint64_t offset = self->_offset;
  if ((offset & 0x80000000) != 0)
  {
    v15 = _LTOSLogXPC();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      -[_LTWordTimingInfo encodeWithCoder:](v15, v16, v17, v18, v19, v20, v21, v22);
    }
    uint64_t offset = self->_offset;
  }
  [v4 encodeInt32:offset forKey:@"offset"];
  uint64_t length = self->_length;
  if ((length & 0x80000000) != 0)
  {
    v24 = _LTOSLogXPC();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
      -[_LTWordTimingInfo encodeWithCoder:](v24, v25, v26, v27, v28, v29, v30, v31);
    }
    uint64_t length = self->_length;
  }
  [v4 encodeInt32:length forKey:@"length"];
  [v4 encodeDouble:@"startTime" forKey:self->_startTime];
  v32 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", self->_textRange.location, self->_textRange.length);
  [v4 encodeObject:v32 forKey:@"textRange"];
}

- (_LTWordTimingInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_LTWordTimingInfo;
  v5 = [(_LTWordTimingInfo *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"word"];
    word = v5->_word;
    v5->_word = (NSString *)v6;

    v5->_uint64_t sampleIndex = [v4 decodeInt32ForKey:@"sampleIndex"];
    v5->_uint64_t offset = [v4 decodeInt32ForKey:@"offset"];
    v5->_uint64_t length = [v4 decodeInt32ForKey:@"length"];
    [v4 decodeDoubleForKey:@"startTime"];
    v5->_startTime = v8;
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"textRange"];
    v5->_textRange.location = [v9 rangeValue];
    v5->_textRange.uint64_t length = v10;

    uint64_t v11 = v5;
  }

  return v5;
}

- (NSString)unredactedDescription
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  word = self->_word;
  uint64_t sampleIndex = self->_sampleIndex;
  double v8 = NSStringFromRange(self->_textRange);
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; _sampleIndex: [%u]; _word: \"%@\"; _textRange: %@; _length: %u; _offset %u; _startTime %f>",
    v5,
    self,
    sampleIndex,
    word,
    v8,
    self->_length,
    self->_offset,
  uint64_t v9 = *(void *)&self->_startTime);

  return (NSString *)v9;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t sampleIndex = self->_sampleIndex;
  NSUInteger v7 = [(NSString *)self->_word length];
  double v8 = NSStringFromRange(self->_textRange);
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; _sampleIndex: [%u]; _word length: %zu; _textRange: %@; _length: %u; _offset %u; _startTime %f>",
    v5,
    self,
    sampleIndex,
    v7,
    v8,
    self->_length,
    self->_offset,
  uint64_t v9 = *(void *)&self->_startTime);

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)word
{
  return self->_word;
}

- (void)setWord:(id)a3
{
}

- (unsigned)sampleIndex
{
  return self->_sampleIndex;
}

- (void)setSampleIndex:(unsigned int)a3
{
  self->_uint64_t sampleIndex = a3;
}

- (unsigned)offset
{
  return self->_offset;
}

- (void)setOffset:(unsigned int)a3
{
  self->_uint64_t offset = a3;
}

- (unsigned)length
{
  return self->_length;
}

- (void)setLength:(unsigned int)a3
{
  self->_uint64_t length = a3;
}

- (_NSRange)textRange
{
  NSUInteger length = self->_textRange.length;
  NSUInteger location = self->_textRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setTextRange:(_NSRange)a3
{
  self->_textRange = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (void).cxx_destruct
{
}

- (void)encodeWithCoder:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)encodeWithCoder:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)encodeWithCoder:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end