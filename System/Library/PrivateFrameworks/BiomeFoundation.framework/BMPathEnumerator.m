@interface BMPathEnumerator
- (BMPathEnumerator)initWithPath:(id)a3;
- (id)navigateDown;
- (id)navigateUp;
- (id)peekPath;
@end

@implementation BMPathEnumerator

- (void).cxx_destruct
{
}

- (id)peekPath
{
  if (self->_range.length)
  {
    v2 = [(NSString *)self->_path substringWithRange:self->_range.location];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (BMPathEnumerator)initWithPath:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    v11.receiver = self;
    v11.super_class = (Class)BMPathEnumerator;
    v5 = [(BMPathEnumerator *)&v11 init];
    if (v5)
    {
      if ([v4 hasSuffix:@"/"])
      {
        uint64_t v6 = objc_msgSend(v4, "substringToIndex:", objc_msgSend(v4, "length") - 1);
      }
      else
      {
        uint64_t v6 = [v4 copy];
      }
      path = v5->_path;
      v5->_path = (NSString *)v6;

      uint64_t v9 = [(NSString *)v5->_path length];
      v5->_range.location = 0;
      v5->_range.length = v9;
    }
    self = v5;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)navigateDown
{
  NSUInteger length = self->_range.length;
  if (length)
  {
    NSUInteger v4 = length + self->_range.location + 1;
    if (v4 > [(NSString *)self->_path length])
    {
      id v5 = 0;
      goto LABEL_11;
    }
  }
  else
  {
    [(NSString *)self->_path length];
    NSUInteger v4 = 0;
  }
  NSUInteger v6 = [(NSString *)self->_path length];
  uint64_t v7 = [(NSString *)self->_path rangeOfString:@"/", 2, v4, v6 - v4 options range];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL) {
    NSUInteger v6 = v7;
  }
  v8 = -[NSString substringWithRange:](self->_path, "substringWithRange:", v4, v6 - v4);
  self->_range.location = 0;
  self->_range.NSUInteger length = v6;
  if ([v8 length]) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  id v5 = v9;

LABEL_11:
  return v5;
}

- (id)navigateUp
{
  p_range = &self->_range;
  NSUInteger v4 = [(NSString *)self->_path rangeOfString:@"/", 6, self->_range.location, self->_range.length options range];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = 0;
    p_range->location = 0;
    p_range->NSUInteger length = 0;
  }
  else
  {
    self->_range.location = 0;
    self->_range.NSUInteger length = v4;
    NSUInteger v6 = -[NSString substringWithRange:](self->_path, "substringWithRange:", 0, v4);
    id v5 = [v6 lastPathComponent];
  }
  return v5;
}

@end