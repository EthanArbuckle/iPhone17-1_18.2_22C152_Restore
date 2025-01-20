@interface AFSyncSnapshot
+ (BOOL)supportsSecureCoding;
- (AFSyncSnapshot)initWithCoder:(id)a3;
- (NSString)anchor;
- (NSString)key;
- (NSString)validity;
- (int64_t)count;
- (void)encodeWithCoder:(id)a3;
- (void)setAnchor:(id)a3;
- (void)setCount:(int64_t)a3;
- (void)setKey:(id)a3;
- (void)setValidity:(id)a3;
@end

@implementation AFSyncSnapshot

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_validity, 0);
  objc_storeStrong((id *)&self->_anchor, 0);
}

- (void)setKey:(id)a3
{
}

- (NSString)key
{
  return self->_key;
}

- (void)setCount:(int64_t)a3
{
  self->_count = a3;
}

- (int64_t)count
{
  return self->_count;
}

- (void)setValidity:(id)a3
{
}

- (NSString)validity
{
  return self->_validity;
}

- (void)setAnchor:(id)a3
{
}

- (NSString)anchor
{
  return self->_anchor;
}

- (AFSyncSnapshot)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AFSyncSnapshot;
  v5 = [(AFSyncSnapshot *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_anchor"];
    anchor = v5->_anchor;
    v5->_anchor = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_validity"];
    validity = v5->_validity;
    v5->_validity = (NSString *)v8;

    v5->_count = [v4 decodeIntegerForKey:@"_count"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_key"];
    key = v5->_key;
    v5->_key = (NSString *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  anchor = self->_anchor;
  id v5 = a3;
  [v5 encodeObject:anchor forKey:@"_anchor"];
  [v5 encodeObject:self->_validity forKey:@"_validity"];
  [v5 encodeInteger:self->_count forKey:@"_count"];
  [v5 encodeObject:self->_key forKey:@"_key"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end