@interface MADRequest
+ (BOOL)supportsSecureCoding;
+ (unint64_t)targetResolution;
- (MADRequest)initWithCoder:(id)a3;
- (NSArray)results;
- (NSError)error;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setError:(id)a3;
- (void)setResults:(id)a3;
@end

@implementation MADRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (unint64_t)targetResolution
{
  return 12192768;
}

- (MADRequest)initWithCoder:(id)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MADRequest;
  v5 = [(MADRequest *)&v14 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
    v8 = [v6 setWithArray:v7];

    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"Results"];
    results = v5->_results;
    v5->_results = (NSArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Error"];
    error = v5->_error;
    v5->_error = (NSError *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_results forKey:@"Results"];
  [v4 encodeObject:self->_error forKey:@"Error"];
}

- (void)setResults:(id)a3
{
}

- (void)setError:(id)a3
{
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p, ", v5, self];

  [v3 appendFormat:@"results: %@, ", self->_results];
  [v3 appendFormat:@"error: %@>", self->_error];
  return v3;
}

- (NSArray)results
{
  return self->_results;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_results, 0);
}

@end