@interface AVStringPair
- (AVStringPair)initWithString:(id)a3 separatedByString:(id)a4;
- (BOOL)keyEquals:(id)a3;
- (NSString)first;
- (NSString)key;
- (NSString)second;
- (NSString)value;
@end

@implementation AVStringPair

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_second, 0);

  objc_storeStrong((id *)&self->_first, 0);
}

- (NSString)second
{
  return self->_second;
}

- (NSString)first
{
  return self->_first;
}

- (BOOL)keyEquals:(id)a3
{
  id v4 = a3;
  v5 = [(AVStringPair *)self key];
  if (v5)
  {
    v6 = [(AVStringPair *)self key];
    BOOL v7 = [v4 caseInsensitiveCompare:v6] == 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (NSString)value
{
  return self->_second;
}

- (NSString)key
{
  return self->_first;
}

- (AVStringPair)initWithString:(id)a3 separatedByString:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v19.receiver = self;
    v19.super_class = (Class)AVStringPair;
    v8 = [(AVStringPair *)&v19 init];
    if (v8)
    {
      if ([v7 length])
      {
        uint64_t v9 = [v6 rangeOfString:v7];
        uint64_t v11 = v10;
      }
      else
      {
        uint64_t v11 = 0;
        uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
      }
      if (v11)
      {
        uint64_t v13 = [v6 substringToIndex:v9];
        first = v8->_first;
        v8->_first = (NSString *)v13;

        uint64_t v15 = [v6 substringFromIndex:v9 + v11];
        second = v8->_second;
        v8->_second = (NSString *)v15;
      }
      else
      {
        uint64_t v17 = [v6 copy];
        second = v8->_first;
        v8->_first = (NSString *)v17;
      }
    }
    self = v8;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

@end