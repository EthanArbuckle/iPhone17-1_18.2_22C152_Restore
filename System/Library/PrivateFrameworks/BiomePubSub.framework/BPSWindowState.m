@interface BPSWindowState
+ (BOOL)supportsSecureCoding;
- (BOOL)completed;
- (BOOL)isEqual:(id)a3;
- (BPSWindowState)initWithCoder:(id)a3;
- (BPSWindowState)initWithIdentifier:(id)a3 aggregate:(id)a4 completed:(BOOL)a5;
- (NSString)identifier;
- (id)aggregate;
- (id)metadata;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAggregate:(id)a3;
- (void)setCompleted:(BOOL)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation BPSWindowState

- (BPSWindowState)initWithIdentifier:(id)a3 aggregate:(id)a4 completed:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BPSWindowState;
  v11 = [(BPSWindowState *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_identifier, a3);
    objc_storeStrong(&v12->_aggregate, a4);
    v12->_completed = a5;
  }

  return v12;
}

- (id)metadata
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"Override method %@ in subclass %@", v4, objc_opt_class() format];

  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 identifier];
    v6 = [(BPSWindowState *)self identifier];
    char v7 = [v5 isEqualToString:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(BPSWindowState *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(BPSWindowState *)self identifier];
  [v6 encodeObject:v4 forKey:@"identifier"];

  v5 = [(BPSWindowState *)self aggregate];
  [v6 encodeObject:v5 forKey:@"aggregate"];

  objc_msgSend(v6, "encodeBool:forKey:", -[BPSWindowState completed](self, "completed"), @"completed");
}

- (BPSWindowState)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  if (v5)
  {
    id v6 = objc_msgSend(MEMORY[0x1E4F28B90], "bm_allowedClassesForSecureCodingBMBookmark");
    char v7 = [v4 decodeObjectOfClasses:v6 forKey:@"aggregate"];

    if (v7)
    {
      self = -[BPSWindowState initWithIdentifier:aggregate:completed:](self, "initWithIdentifier:aggregate:completed:", v5, v7, [v4 decodeBoolForKey:@"completed"]);
      v8 = self;
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (id)aggregate
{
  return self->_aggregate;
}

- (void)setAggregate:(id)a3
{
}

- (BOOL)completed
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_aggregate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end