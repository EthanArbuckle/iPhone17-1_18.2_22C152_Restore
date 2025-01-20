@interface _NSStringFormattingOptions
- (BOOL)isEqual:(id)a3;
- (NSNumber)pluralizationNumber;
- (_NSStringFormattingOptions)init;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)dealloc;
- (void)setPluralizationNumber:(id)a3;
@end

@implementation _NSStringFormattingOptions

- (NSNumber)pluralizationNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPluralizationNumber:(id)a3
{
}

- (_NSStringFormattingOptions)init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)_NSStringFormattingOptions;
  result = [(_NSStringFormattingOptions *)&v3 init];
  if (result) {
    result->_pluralizationNumber = 0;
  }
  return result;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)_NSStringFormattingOptions;
  [(_NSStringFormattingOptions *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_alloc_init(_NSStringFormattingOptions);
  [(_NSStringFormattingOptions *)v4 setPluralizationNumber:[(_NSStringFormattingOptions *)self pluralizationNumber]];
  return v4;
}

- (unint64_t)hash
{
  uint64_t v3 = [(id)objc_opt_class() hash];
  return [(NSNumber *)[(_NSStringFormattingOptions *)self pluralizationNumber] hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(_NSStringFormattingOptions *)self pluralizationNumber];
    if (v5 == (NSNumber *)[a3 pluralizationNumber])
    {
      LOBYTE(v6) = 1;
    }
    else
    {
      uint64_t v6 = [a3 pluralizationNumber];
      if (v6)
      {
        v7 = [(_NSStringFormattingOptions *)self pluralizationNumber];
        uint64_t v8 = [a3 pluralizationNumber];
        LOBYTE(v6) = [(NSNumber *)v7 isEqualToNumber:v8];
      }
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

@end