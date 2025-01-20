@interface SHLyricLine
+ (BOOL)supportsSecureCoding;
+ (id)lyricLineWithText:(id)a3 offset:(double)a4;
- (NSString)text;
- (SHLyricLine)initWithCoder:(id)a3;
- (SHLyricLine)initWithLineWithText:(id)a3 offset:(double)a4;
- (double)offset;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setOffset:(double)a3;
- (void)setText:(id)a3;
@end

@implementation SHLyricLine

+ (id)lyricLineWithText:(id)a3 offset:(double)a4
{
  id v5 = a3;
  v6 = [[SHLyricLine alloc] initWithLineWithText:v5 offset:a4];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SHLyricLine)initWithLineWithText:(id)a3 offset:(double)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SHLyricLine;
  v8 = [(SHLyricLine *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_text, a3);
    v9->_offset = a4;
  }

  return v9;
}

- (SHLyricLine)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"text"];
  [v4 decodeDoubleForKey:@"offset"];
  double v7 = v6;

  v8 = [(SHLyricLine *)self initWithLineWithText:v5 offset:v7];
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  text = self->_text;
  id v5 = a3;
  [v5 encodeObject:text forKey:@"text"];
  [v5 encodeDouble:@"offset" forKey:self->_offset];
}

- (id)description
{
  v3 = NSString;
  id v4 = [(SHLyricLine *)self text];
  [(SHLyricLine *)self offset];
  double v6 = [v3 stringWithFormat:@"%@ : %f", v4, v5];

  return v6;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (double)offset
{
  return self->_offset;
}

- (void)setOffset:(double)a3
{
  self->_offset = a3;
}

- (void).cxx_destruct
{
}

@end