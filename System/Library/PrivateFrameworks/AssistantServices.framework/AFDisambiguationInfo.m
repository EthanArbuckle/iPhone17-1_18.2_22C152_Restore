@interface AFDisambiguationInfo
+ (BOOL)supportsSecureCoding;
- (AFDisambiguationInfo)init;
- (AFDisambiguationInfo)initWithCoder:(id)a3;
- (NSArray)history;
- (int64_t)version;
- (void)encodeWithCoder:(id)a3;
- (void)setHistory:(id)a3;
@end

@implementation AFDisambiguationInfo

- (void).cxx_destruct
{
}

- (void)setHistory:(id)a3
{
}

- (NSArray)history
{
  return self->_history;
}

- (int64_t)version
{
  return self->_version;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t version = self->_version;
  id v5 = a3;
  [v5 encodeInteger:version forKey:@"_version"];
  [v5 encodeObject:self->_history forKey:@"_history"];
}

- (AFDisambiguationInfo)initWithCoder:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AFDisambiguationInfo;
  id v5 = [(AFDisambiguationInfo *)&v12 init];
  if (v5)
  {
    v5->_int64_t version = [v4 decodeIntegerForKey:@"_version"];
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
    v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"_history"];
    history = v5->_history;
    v5->_history = (NSArray *)v9;
  }
  return v5;
}

- (AFDisambiguationInfo)init
{
  v3.receiver = self;
  v3.super_class = (Class)AFDisambiguationInfo;
  result = [(AFDisambiguationInfo *)&v3 init];
  if (result) {
    result->_int64_t version = 0;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end