@interface DIExecutionFeedback
+ (BOOL)supportsSecureCoding;
- (BOOL)consumed;
- (DIExecutionFeedback)init;
- (DIExecutionFeedback)initWithCoder:(id)a3;
- (NSDate)finishDate;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setConsumed:(BOOL)a3;
- (void)setFinishDate:(id)a3;
@end

@implementation DIExecutionFeedback

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [v5 encodeBool:self->_consumed forKey:@"consumed"];
  [v5 encodeObject:self->_finishDate forKey:@"finishDate"];

  os_unfair_lock_unlock(p_lock);
}

- (DIExecutionFeedback)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(DIExecutionFeedback *)self init];
  if (v5)
  {
    v5->_consumed = [v4 decodeBoolForKey:@"consumed"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"finishDate"];
    finishDate = v5->_finishDate;
    v5->_finishDate = (NSDate *)v6;
  }
  return v5;
}

- (DIExecutionFeedback)init
{
  v7.receiver = self;
  v7.super_class = (Class)DIExecutionFeedback;
  v2 = [(DIExecutionFeedback *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v2->_consumed = 1;
    uint64_t v4 = [MEMORY[0x263EFF910] distantPast];
    finishDate = v3->_finishDate;
    v3->_finishDate = (NSDate *)v4;
  }
  return v3;
}

- (BOOL)consumed
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_consumed;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setConsumed:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_consumed = a3;
  os_unfair_lock_unlock(p_lock);
}

- (NSDate)finishDate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = self->_finishDate;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setFinishDate:(id)a3
{
  uint64_t v6 = (NSDate *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_finishDate != v6)
  {
    uint64_t v4 = (NSDate *)[(NSDate *)v6 copyWithZone:0];
    finishDate = self->_finishDate;
    self->_finishDate = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (id)description
{
  v3 = [MEMORY[0x263F089D8] stringWithFormat:&stru_26C5761E0];
  v7.receiver = self;
  v7.super_class = (Class)DIExecutionFeedback;
  uint64_t v4 = [(DIExecutionFeedback *)&v7 description];
  [v3 appendFormat:@"%@", v4];

  os_unfair_lock_lock(&self->_lock);
  if (self->_consumed) {
    id v5 = @"YES";
  }
  else {
    id v5 = @"NO";
  }
  [v3 appendFormat:@"consumed: '%@'; ", v5];
  [v3 appendFormat:@"finishDate: '%@';", self->_finishDate];
  os_unfair_lock_unlock(&self->_lock);
  [v3 appendFormat:@">"];
  return v3;
}

- (void).cxx_destruct
{
}

@end