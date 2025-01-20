@interface CERuleCriteria
+ (BOOL)supportsSecureCoding;
- (CERuleCriteria)initWithCoder:(id)a3;
- (CERuleCriteria)initWithDictionary:(id)a3;
- (NSNumber)max;
- (NSNumber)min;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setMax:(id)a3;
- (void)setMin:(id)a3;
@end

@implementation CERuleCriteria

- (CERuleCriteria)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CERuleCriteria;
  v5 = [(CERuleCriteria *)&v14 init];
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    v7 = [v4 objectForKeyedSubscript:@"min"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = v7;
      p_super = &v6->_min->super.super;
      v6->_min = v8;
    }
    else
    {
      p_super = _CELogSystem();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG)) {
        -[CERuleCriteria initWithDictionary:]();
      }
    }

    v10 = [v4 objectForKeyedSubscript:@"max"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = v10;
      v12 = &v6->_max->super.super;
      v6->_max = v11;
    }
    else
    {
      v12 = _CELogSystem();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[CERuleCriteria initWithDictionary:]();
      }
    }
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CERuleCriteria *)self min];
  [v4 encodeObject:v5 forKey:@"min"];

  id v6 = [(CERuleCriteria *)self max];
  [v4 encodeObject:v6 forKey:@"max"];
}

- (CERuleCriteria)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CERuleCriteria;
  v5 = [(CERuleCriteria *)&v12 init];
  id v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"min"];
    min = v6->_min;
    v6->_min = (NSNumber *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"max"];
    max = v6->_max;
    v6->_max = (NSNumber *)v9;
  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[CERuleCriteria allocWithZone:a3] init];
  v4->_lock._os_unfair_lock_opaque = 0;
  v5 = [(CERuleCriteria *)self min];
  [(CERuleCriteria *)v4 setMin:v5];

  id v6 = [(CERuleCriteria *)self max];
  [(CERuleCriteria *)v4 setMax:v6];

  return v4;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(CERuleCriteria *)self min];
  v5 = [(CERuleCriteria *)self max];
  id v6 = [v3 stringWithFormat:@"Criteria with min: %@, max: %@", v4, v5];

  return v6;
}

- (NSNumber)min
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_min;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSNumber)max
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_max;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setMin:(id)a3
{
  id v4 = (NSNumber *)a3;
  os_unfair_lock_lock(&self->_lock);
  min = self->_min;
  self->_min = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setMax:(id)a3
{
  id v4 = (NSNumber *)a3;
  os_unfair_lock_lock(&self->_lock);
  max = self->_max;
  self->_max = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_max, 0);
  objc_storeStrong((id *)&self->_min, 0);
}

- (void)initWithDictionary:.cold.1()
{
  id v0 = (id)objc_opt_class();
  OUTLINED_FUNCTION_0(&dword_24A2CB000, v1, v2, "%@ unable to parse max from dictionary.", v3, v4, v5, v6, 2u);
}

- (void)initWithDictionary:.cold.2()
{
  id v0 = (id)objc_opt_class();
  OUTLINED_FUNCTION_0(&dword_24A2CB000, v1, v2, "%@ unable to parse min from dictionary.", v3, v4, v5, v6, 2u);
}

@end