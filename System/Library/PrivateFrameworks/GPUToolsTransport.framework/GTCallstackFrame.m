@interface GTCallstackFrame
+ (BOOL)supportsSecureCoding;
- (GTCallstackFrame)initWithCoder:(id)a3;
- (NSString)functionName;
- (NSURL)file;
- (unsigned)column;
- (unsigned)line;
- (void)encodeWithCoder:(id)a3;
- (void)setColumn:(unsigned int)a3;
- (void)setFile:(id)a3;
- (void)setFunctionName:(id)a3;
- (void)setLine:(unsigned int)a3;
@end

@implementation GTCallstackFrame

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTCallstackFrame)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GTCallstackFrame;
  v5 = [(GTCallstackFrame *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"file"];
    file = v5->_file;
    v5->_file = (NSURL *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"functionName"];
    functionName = v5->_functionName;
    v5->_functionName = (NSString *)v8;

    v5->_line = [v4 decodeInt32ForKey:@"line"];
    v5->_column = [v4 decodeInt32ForKey:@"column"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  file = self->_file;
  id v5 = a3;
  [v5 encodeObject:file forKey:@"file"];
  [v5 encodeObject:self->_functionName forKey:@"functionName"];
  [v5 encodeInt32:self->_line forKey:@"line"];
  [v5 encodeInt32:self->_column forKey:@"column"];
}

- (NSURL)file
{
  return self->_file;
}

- (void)setFile:(id)a3
{
}

- (unsigned)line
{
  return self->_line;
}

- (void)setLine:(unsigned int)a3
{
  self->_line = a3;
}

- (unsigned)column
{
  return self->_column;
}

- (void)setColumn:(unsigned int)a3
{
  self->_column = a3;
}

- (NSString)functionName
{
  return self->_functionName;
}

- (void)setFunctionName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_functionName, 0);
  objc_storeStrong((id *)&self->_file, 0);
}

@end