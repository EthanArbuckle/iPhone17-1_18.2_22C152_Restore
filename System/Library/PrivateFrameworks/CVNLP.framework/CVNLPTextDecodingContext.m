@interface CVNLPTextDecodingContext
- (CVNLPTextDecodingContext)initWithHistory:(id)a3;
- (CVNLPTextDecodingContext)initWithHistory:(id)a3 activeRange:(_NSRange)a4;
- (NSString)history;
- (_NSRange)activeRange;
- (id)activeSubstring;
- (id)inactiveSubstring;
@end

@implementation CVNLPTextDecodingContext

- (CVNLPTextDecodingContext)initWithHistory:(id)a3 activeRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CVNLPTextDecodingContext;
  v9 = [(CVNLPTextDecodingContext *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_history, a3);
    v10->_activeRange.NSUInteger location = location;
    v10->_activeRange.NSUInteger length = length;
  }

  return v10;
}

- (CVNLPTextDecodingContext)initWithHistory:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_length(v4, v5, v6, v7);
  active = (CVNLPTextDecodingContext *)objc_msgSend_initWithHistory_activeRange_(self, v9, (uint64_t)v4, v8 - 1, 0);

  return active;
}

- (id)activeSubstring
{
  NSUInteger length = self->_activeRange.length;
  if (length)
  {
    objc_msgSend_substringWithRange_(self->_history, a2, self->_activeRange.location, length);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &stru_1F0D56340;
  }
  return v3;
}

- (id)inactiveSubstring
{
  id v4 = self->_history;
  if (self->_activeRange.length)
  {
    uint64_t v5 = objc_msgSend_substringWithRange_(self->_history, v3, 0, self->_activeRange.location);

    id v4 = (NSString *)v5;
  }
  return v4;
}

- (NSString)history
{
  return self->_history;
}

- (_NSRange)activeRange
{
  NSUInteger length = self->_activeRange.length;
  NSUInteger location = self->_activeRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void).cxx_destruct
{
}

@end