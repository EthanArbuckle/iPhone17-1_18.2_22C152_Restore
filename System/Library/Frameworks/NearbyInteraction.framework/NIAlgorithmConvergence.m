@interface NIAlgorithmConvergence
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NIAlgorithmConvergence)initWithCoder:(id)a3;
- (NIAlgorithmConvergence)initWithStatus:(int64_t)a3 andReasons:(id)a4;
- (NIAlgorithmConvergenceStatus)status;
- (NSArray)reasons;
- (id)copyWithZone:(_NSZone *)a3;
- (id)reasonsPrivate;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setReasons:(id)a3;
- (void)setStatus:(int64_t)a3;
@end

@implementation NIAlgorithmConvergence

- (NIAlgorithmConvergence)initWithStatus:(int64_t)a3 andReasons:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)NIAlgorithmConvergence;
  v8 = [(NIAlgorithmConvergence *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_status = a3;
    objc_storeStrong((id *)&v8->_reasons, a4);
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (self->_reasons) {
    v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "allocWithZone:", a3), "initWithArray:copyItems:", self->_reasons, 1);
  }
  else {
    v4 = 0;
  }
  v5 = [[NIAlgorithmConvergence alloc] initWithStatus:self->_status andReasons:v4];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeInteger:self->_status forKey:@"status"];
  reasons = self->_reasons;
  if (reasons) {
    [v5 encodeObject:reasons forKey:@"reasons"];
  }
}

- (NIAlgorithmConvergence)initWithCoder:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"status"];
  if (![v4 containsValueForKey:@"reasons"])
  {
    v9 = 0;
    goto LABEL_5;
  }
  v6 = (void *)MEMORY[0x1E4F1CAD0];
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  v8 = [v6 setWithArray:v7];
  v9 = [v4 decodeObjectOfClasses:v8 forKey:@"reasons"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
LABEL_5:
    v10 = [[NIAlgorithmConvergence alloc] initWithStatus:v5 andReasons:v9];
    goto LABEL_6;
  }
  v10 = 0;
LABEL_6:

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [v5 status];
    int64_t status = self->_status;
    v8 = [v5 reasons];
    if (v8) {
      BOOL v9 = 0;
    }
    else {
      BOOL v9 = self->_reasons == 0;
    }

    objc_super v11 = [v5 reasons];
    char v12 = [v11 isEqualToArray:self->_reasons];

    if (v6 == status) {
      char v10 = v9 | v12;
    }
    else {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  v3 = [NSNumber numberWithInteger:self->_status];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(NSArray *)self->_reasons hash] ^ v4;

  return v5;
}

- (id)reasonsPrivate
{
  return self->_reasons;
}

- (NIAlgorithmConvergenceStatus)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_int64_t status = a3;
}

- (NSArray)reasons
{
  return self->_reasons;
}

- (void)setReasons:(id)a3
{
}

- (void).cxx_destruct
{
}

@end