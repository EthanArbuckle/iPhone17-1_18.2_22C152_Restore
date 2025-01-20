@interface _CRMatchTextPredicate
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)key;
- (NSString)text;
- (_CRMatchTextPredicate)initWithCoder:(id)a3;
- (_CRMatchTextPredicate)initWithKey:(id)a3 text:(id)a4 comparison:(unint64_t)a5;
- (id)asNSPredicate;
- (unint64_t)comparison;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _CRMatchTextPredicate

- (_CRMatchTextPredicate)initWithKey:(id)a3 text:(id)a4 comparison:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_CRMatchTextPredicate;
  v10 = [(CRSearchPredicate *)&v17 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    key = v10->_key;
    v10->_key = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    text = v10->_text;
    v10->_text = (NSString *)v13;

    v10->_comparison = a5;
    v15 = v10;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_CRMatchTextPredicate *)a3;
  if (self == v4)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v7 = (objc_opt_isKindOfClass() & 1) != 0
      && ((key = self->_key, !((unint64_t)key | (unint64_t)v4->_key))
       || -[NSString isEqual:](key, "isEqual:"))
      && ((text = self->_text, !((unint64_t)text | (unint64_t)v4->_text))
       || -[NSString isEqual:](text, "isEqual:"))
      && self->_comparison == v4->_comparison;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = [MEMORY[0x1E4F5A418] objectHash:self->_key];
  uint64_t v4 = [MEMORY[0x1E4F5A418] objectHash:self->_text];
  return self->_comparison - (v4 - v3 + 32 * v3) + 32 * (v4 - v3 + 32 * v3) + 506447;
}

- (id)asNSPredicate
{
  unint64_t v2 = self->_comparison - 1;
  if (v2 > 2) {
    uint64_t v3 = @"%K ==[cd] %@";
  }
  else {
    uint64_t v3 = off_1E5CFBBC8[v2];
  }
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", v3, self->_key, self->_text);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_CRMatchTextPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"key"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"text"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"comparison"];

  id v8 = [(_CRMatchTextPredicate *)self initWithKey:v5 text:v6 comparison:v7];
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  key = self->_key;
  id v5 = a3;
  [v5 encodeObject:key forKey:@"key"];
  [v5 encodeObject:self->_text forKey:@"text"];
  [v5 encodeInteger:self->_comparison forKey:@"comparison"];
}

- (NSString)key
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)text
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)comparison
{
  return self->_comparison;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end