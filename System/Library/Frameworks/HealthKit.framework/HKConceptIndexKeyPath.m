@interface HKConceptIndexKeyPath
+ (id)conceptIndexKeyPathWithFullKeyPath:(id)a3 error:(id *)a4;
- (HKConceptIndexKeyPath)init;
- (HKConceptIndexKeyPath)initWithFullKeyPath:(id)a3 range:(_NSRange)a4;
- (NSString)fullKeyPath;
- (_NSRange)range;
- (id)head;
- (id)tail;
@end

@implementation HKConceptIndexKeyPath

- (HKConceptIndexKeyPath)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

+ (id)conceptIndexKeyPathWithFullKeyPath:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (!v7)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"HKConceptIndexKeyPath.m", 22, @"Invalid parameter not satisfying: %@", @"fullKeyPath" object file lineNumber description];
  }
  if (![v7 length])
  {
    v11 = (void *)MEMORY[0x1E4F28C58];
    v12 = @"Key Path is an empty string. Please provide a key path with at least length 1";
    goto LABEL_7;
  }
  uint64_t v8 = [v7 rangeOfString:@"."];
  uint64_t v10 = v9;
  if ([v7 length] == v8 + 1)
  {
    v11 = (void *)MEMORY[0x1E4F28C58];
    v12 = @"Key Path ends in a period and is invalid.";
LABEL_7:
    objc_msgSend(v11, "hk_assignError:code:format:", a4, 3, v12);
    v13 = 0;
    goto LABEL_9;
  }
  v13 = objc_msgSend(objc_alloc((Class)a1), "initWithFullKeyPath:range:", v7, v8, v10);
LABEL_9:

  return v13;
}

- (HKConceptIndexKeyPath)initWithFullKeyPath:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKConceptIndexKeyPath;
  uint64_t v8 = [(HKConceptIndexKeyPath *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v7 copy];
    fullKeyPath = v8->_fullKeyPath;
    v8->_fullKeyPath = (NSString *)v9;

    v8->_range.NSUInteger location = location;
    v8->_range.NSUInteger length = length;
  }

  return v8;
}

- (id)head
{
  p_fullKeyPath = &self->_fullKeyPath;
  fullKeyPath = self->_fullKeyPath;
  if (p_fullKeyPath[1] == (NSString *)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v4 = fullKeyPath;
  }
  else
  {
    -[NSString substringToIndex:](fullKeyPath, "substringToIndex:");
    uint64_t v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (id)tail
{
  NSUInteger location = self->_range.location;
  if (location == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = 0;
  }
  else
  {
    v3 = [(NSString *)self->_fullKeyPath substringFromIndex:self->_range.length + location];
  }

  return v3;
}

- (NSString)fullKeyPath
{
  return self->_fullKeyPath;
}

- (_NSRange)range
{
  NSUInteger length = self->_range.length;
  NSUInteger location = self->_range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void).cxx_destruct
{
}

@end