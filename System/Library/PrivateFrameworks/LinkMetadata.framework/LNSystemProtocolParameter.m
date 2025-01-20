@interface LNSystemProtocolParameter
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNSystemProtocolParameter)initWithCoder:(id)a3;
- (LNSystemProtocolParameter)initWithVocabularyModel:(int64_t)a3;
- (id)description;
- (int64_t)vocabularyModel;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNSystemProtocolParameter

- (LNSystemProtocolParameter)initWithVocabularyModel:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)LNSystemProtocolParameter;
  v4 = [(LNSystemProtocolParameter *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_vocabularyModel = a3;
    v6 = v4;
  }

  return v5;
}

- (int64_t)vocabularyModel
{
  return self->_vocabularyModel;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (LNSystemProtocolParameter *)a3;
  v5 = v4;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      int64_t v7 = [(LNSystemProtocolParameter *)self vocabularyModel];
      BOOL v8 = v7 == [(LNSystemProtocolParameter *)v6 vocabularyModel];
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[LNSystemProtocolParameter vocabularyModel](self, "vocabularyModel"), @"vocabularyModel");
}

- (LNSystemProtocolParameter)initWithCoder:(id)a3
{
  uint64_t v4 = [a3 decodeIntegerForKey:@"vocabularyModel"];
  return [(LNSystemProtocolParameter *)self initWithVocabularyModel:v4];
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  int64_t v6 = [(LNSystemProtocolParameter *)self vocabularyModel];
  int64_t v7 = @"AppSetting";
  if (!v6) {
    int64_t v7 = @"None";
  }
  BOOL v8 = [v3 stringWithFormat:@"<%@: %p, vocabularyModel: %@>", v5, self, v7];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end