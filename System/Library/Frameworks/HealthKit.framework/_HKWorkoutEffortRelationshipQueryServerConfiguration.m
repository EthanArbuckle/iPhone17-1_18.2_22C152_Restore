@interface _HKWorkoutEffortRelationshipQueryServerConfiguration
+ (BOOL)supportsSecureCoding;
- (HKQueryAnchor)anchor;
- (_HKWorkoutEffortRelationshipQueryServerConfiguration)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)options;
- (void)encodeWithCoder:(id)a3;
- (void)setAnchor:(id)a3;
- (void)setOptions:(int64_t)a3;
@end

@implementation _HKWorkoutEffortRelationshipQueryServerConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_HKWorkoutEffortRelationshipQueryServerConfiguration;
  id v4 = [(HKQueryServerConfiguration *)&v6 copyWithZone:a3];
  [v4 setAnchor:self->_anchor];
  [v4 setOptions:self->_options];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HKWorkoutEffortRelationshipQueryServerConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_HKWorkoutEffortRelationshipQueryServerConfiguration;
  v5 = [(HKQueryServerConfiguration *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"query_anchor"];
    anchor = v5->_anchor;
    v5->_anchor = (HKQueryAnchor *)v6;

    v5->_options = [v4 decodeInt64ForKey:@"query_options"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_HKWorkoutEffortRelationshipQueryServerConfiguration;
  id v4 = a3;
  [(HKQueryServerConfiguration *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_anchor, @"query_anchor", v5.receiver, v5.super_class);
  [v4 encodeInt64:self->_options forKey:@"query_options"];
}

- (HKQueryAnchor)anchor
{
  return self->_anchor;
}

- (void)setAnchor:(id)a3
{
}

- (int64_t)options
{
  return self->_options;
}

- (void)setOptions:(int64_t)a3
{
  self->_options = a3;
}

- (void).cxx_destruct
{
}

@end