@interface NSSmartQuoteOptions
+ (BOOL)supportsSecureCoding;
+ (id)smartQuoteOptionsForLocale:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSSmartQuoteOptions)initWithCoder:(id)a3;
- (NSSmartQuoteOptions)initWithLeftSingleQuote:(id)a3 rightSingleQuote:(id)a4 apostrophe:(id)a5 leftDoubleQuote:(id)a6 rightDoubleQuote:(id)a7;
- (NSString)apostrophe;
- (NSString)leftDoubleQuote;
- (NSString)leftSingleQuote;
- (NSString)rightDoubleQuote;
- (NSString)rightSingleQuote;
- (id)description;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSSmartQuoteOptions

- (NSSmartQuoteOptions)initWithLeftSingleQuote:(id)a3 rightSingleQuote:(id)a4 apostrophe:(id)a5 leftDoubleQuote:(id)a6 rightDoubleQuote:(id)a7
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)NSSmartQuoteOptions;
  v12 = [(NSSmartQuoteOptions *)&v14 init];
  if (v12)
  {
    v12->_leftSingleQuote = (NSString *)[a3 copy];
    v12->_rightSingleQuote = (NSString *)[a4 copy];
    v12->_apostrophe = (NSString *)[a5 copy];
    v12->_leftDoubleQuote = (NSString *)[a6 copy];
    v12->_rightDoubleQuote = (NSString *)[a7 copy];
  }
  return v12;
}

+ (id)smartQuoteOptionsForLocale:(id)a3
{
  v3 = [[NSSmartQuoteOptions alloc] initWithLeftSingleQuote:@"‘" rightSingleQuote:@"’" apostrophe:@"’" leftDoubleQuote:@"“" rightDoubleQuote:@"”"];

  return v3;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSSmartQuoteOptions;
  [(NSSmartQuoteOptions *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v5 = -[NSString isEqualToString:](self->_leftSingleQuote, "isEqualToString:", [a3 leftSingleQuote]);
      if (v5)
      {
        BOOL v5 = -[NSString isEqualToString:](self->_rightSingleQuote, "isEqualToString:", [a3 rightSingleQuote]);
        if (v5)
        {
          BOOL v5 = -[NSString isEqualToString:](self->_apostrophe, "isEqualToString:", [a3 apostrophe]);
          if (v5)
          {
            BOOL v5 = -[NSString isEqualToString:](self->_leftDoubleQuote, "isEqualToString:", [a3 leftDoubleQuote]);
            if (v5)
            {
              rightDoubleQuote = self->_rightDoubleQuote;
              uint64_t v7 = [a3 rightDoubleQuote];
              LOBYTE(v5) = [(NSString *)rightDoubleQuote isEqualToString:v7];
            }
          }
        }
      }
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_leftSingleQuote hash];
  NSUInteger v4 = [(NSString *)self->_rightSingleQuote hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_apostrophe hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_leftDoubleQuote hash];
  return v6 ^ [(NSString *)self->_rightDoubleQuote hash];
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)NSSmartQuoteOptions;
  return +[NSString stringWithFormat:@"%@{%@xy%@/x%@y/%@xy%@}", [(NSSmartQuoteOptions *)&v3 description], [(NSSmartQuoteOptions *)self leftSingleQuote], [(NSSmartQuoteOptions *)self rightSingleQuote], [(NSSmartQuoteOptions *)self apostrophe], [(NSSmartQuoteOptions *)self leftDoubleQuote], [(NSSmartQuoteOptions *)self rightDoubleQuote]];
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {
    NSUInteger v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ requires keyed coding", objc_opt_class()), 0 reason userInfo];
    objc_exception_throw(v6);
  }
  objc_msgSend(a3, "encodeObject:forKey:", -[NSSmartQuoteOptions leftSingleQuote](self, "leftSingleQuote"), @"NSLeftSingleQuote");
  objc_msgSend(a3, "encodeObject:forKey:", -[NSSmartQuoteOptions rightSingleQuote](self, "rightSingleQuote"), @"NSRightSingleQuote");
  objc_msgSend(a3, "encodeObject:forKey:", -[NSSmartQuoteOptions apostrophe](self, "apostrophe"), @"NSApostrophe");
  objc_msgSend(a3, "encodeObject:forKey:", -[NSSmartQuoteOptions leftDoubleQuote](self, "leftDoubleQuote"), @"NSLeftDoubleQuote");
  NSUInteger v5 = [(NSSmartQuoteOptions *)self rightDoubleQuote];

  [a3 encodeObject:v5 forKey:@"NSRightDoubleQuote"];
}

- (NSSmartQuoteOptions)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {
    v12 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ requires keyed coding", objc_opt_class()), 0 reason userInfo];
    objc_exception_throw(v12);
  }
  uint64_t v5 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSLeftSingleQuote"];
  if ((_NSIsNSString() & 1) == 0)
  {

    v11 = @"Smart quote left single quote is not a string";
LABEL_15:
    objc_msgSend(a3, "failWithError:", +[NSError _readCorruptErrorWithFormat:](NSError, "_readCorruptErrorWithFormat:", v11));
    return 0;
  }
  uint64_t v6 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSRightSingleQuote"];
  if ((_NSIsNSString() & 1) == 0)
  {

    v11 = @"Smart quote right single quote is not a string";
    goto LABEL_15;
  }
  uint64_t v7 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSApostrophe"];
  if ((_NSIsNSString() & 1) == 0)
  {

    v11 = @"Smart quote apostrophe is not a string";
    goto LABEL_15;
  }
  uint64_t v8 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSLeftDoubleQuote"];
  if ((_NSIsNSString() & 1) == 0)
  {

    v11 = @"Smart quote left double quote is not a string";
    goto LABEL_15;
  }
  uint64_t v9 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSRightDoubleQuote"];
  if ((_NSIsNSString() & 1) == 0)
  {

    v11 = @"Smart quote right double quote is not a string";
    goto LABEL_15;
  }

  return [(NSSmartQuoteOptions *)self initWithLeftSingleQuote:v5 rightSingleQuote:v6 apostrophe:v7 leftDoubleQuote:v8 rightDoubleQuote:v9];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)leftSingleQuote
{
  return self->_leftSingleQuote;
}

- (NSString)rightSingleQuote
{
  return self->_rightSingleQuote;
}

- (NSString)apostrophe
{
  return self->_apostrophe;
}

- (NSString)leftDoubleQuote
{
  return self->_leftDoubleQuote;
}

- (NSString)rightDoubleQuote
{
  return self->_rightDoubleQuote;
}

@end