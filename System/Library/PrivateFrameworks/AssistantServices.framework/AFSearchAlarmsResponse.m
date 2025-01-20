@interface AFSearchAlarmsResponse
+ (BOOL)supportsSecureCoding;
- (AFSearchAlarmsResponse)initWithCoder:(id)a3;
- (NSArray)results;
- (void)encodeWithCoder:(id)a3;
- (void)setResults:(id)a3;
@end

@implementation AFSearchAlarmsResponse

- (void).cxx_destruct
{
}

- (void)setResults:(id)a3
{
}

- (NSArray)results
{
  return self->_results;
}

- (AFSearchAlarmsResponse)initWithCoder:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AFSearchAlarmsResponse;
  v5 = [(AFSiriResponse *)&v12 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
    v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"Results"];
    results = v5->_results;
    v5->_results = (NSArray *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AFSearchAlarmsResponse;
  id v4 = a3;
  [(AFSiriResponse *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_results, @"Results", v5.receiver, v5.super_class);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end