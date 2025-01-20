@interface _DASActivityDependency
+ (BOOL)supportsSecureCoding;
- (BOOL)isActivityCompletionBased;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSatisfiedByAvailableResultCount:(int64_t)a3;
- (BOOL)isSatisfiedByResult:(id)a3;
- (NSString)identifier;
- (_DASActivityDependency)initWithCoder:(id)a3;
- (id)description;
- (id)dictionary;
- (id)initActivityCompletionDependencyWithIdentifier:(id)a3;
- (id)initResultDependencyWithIdentifier:(id)a3 batchSize:(int64_t)a4;
- (int64_t)batchSize;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBatchSize:(int64_t)a3;
@end

@implementation _DASActivityDependency

- (id)initResultDependencyWithIdentifier:(id)a3 batchSize:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_DASActivityDependency;
  v8 = [(_DASActivityDependency *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_identifier, a3);
    v9->_batchSize = a4;
  }

  return v9;
}

- (id)initActivityCompletionDependencyWithIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_DASActivityDependency;
  v6 = [(_DASActivityDependency *)&v9 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identifier, a3);
    v7->_batchSize = -1;
  }

  return v7;
}

- (BOOL)isActivityCompletionBased
{
  return self->_batchSize == -1;
}

- (BOOL)isSatisfiedByResult:(id)a3
{
  uint64_t v4 = [a3 count];

  return [(_DASActivityDependency *)self isSatisfiedByAvailableResultCount:v4];
}

- (BOOL)isSatisfiedByAvailableResultCount:(int64_t)a3
{
  return self->_batchSize <= a3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (_DASActivityDependency *)a3;
  if (v4 == self)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      v6 = [(_DASActivityDependency *)v5 identifier];
      if ([v6 isEqual:self->_identifier]) {
        BOOL v7 = [(_DASActivityDependency *)v5 batchSize] == self->_batchSize;
      }
      else {
        BOOL v7 = 0;
      }
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  return [(NSString *)self->_identifier hash];
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  identifier = self->_identifier;
  int64_t batchSize = self->_batchSize;
  BOOL v7 = [(_DASActivityDependency *)self isActivityCompletionBased];
  v8 = @"NO";
  if (v7) {
    v8 = @"YES";
  }
  return (id)[v3 stringWithFormat:@"<%@: %@: batchSize: %ld, isActivityCompletion: %@>", v4, identifier, batchSize, v8];
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  id v6 = [NSNumber numberWithInteger:self->_batchSize];
  [v5 encodeObject:v6 forKey:@"batchSize"];
}

- (_DASActivityDependency)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"batchSize"];

  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    v8 = 0;
  }
  else
  {
    int v9 = [v6 intValue];
    id v10 = objc_alloc((Class)objc_opt_class());
    if (v9 == -1) {
      uint64_t v11 = [v10 initActivityCompletionDependencyWithIdentifier:v5];
    }
    else {
      uint64_t v11 = objc_msgSend(v10, "initResultDependencyWithIdentifier:batchSize:", v5, (int)objc_msgSend(v6, "intValue"));
    }
    v8 = (_DASActivityDependency *)v11;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(int64_t)a3
{
  self->_int64_t batchSize = a3;
}

- (void).cxx_destruct
{
}

- (id)dictionary
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if ([(_DASActivityDependency *)self isActivityCompletionBased])
  {
    identifier = self->_identifier;
    v12[0] = &unk_1F0E6EC00;
    v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&identifier count:1];
  }
  else
  {
    int v9 = self->_identifier;
    BOOL v7 = @"BatchSize";
    id v4 = [NSNumber numberWithInteger:self->_batchSize];
    v8 = v4;
    id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v8 forKeys:&v7 count:1];
    id v10 = v5;
    v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  }

  return v3;
}

@end