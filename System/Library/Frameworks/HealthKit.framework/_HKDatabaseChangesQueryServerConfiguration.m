@interface _HKDatabaseChangesQueryServerConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)includeChangeDetails;
- (HKQueryAnchor)anchor;
- (NSSet)sampleTypes;
- (_HKDatabaseChangesQueryServerConfiguration)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)anchorStrategyChangeCountLimit;
- (int64_t)changeDetailsQueryStrategy;
- (void)encodeWithCoder:(id)a3;
- (void)setAnchor:(id)a3;
- (void)setAnchorStrategyChangeCountLimit:(int64_t)a3;
- (void)setChangeDetailsQueryStrategy:(int64_t)a3;
- (void)setIncludeChangeDetails:(BOOL)a3;
- (void)setSampleTypes:(id)a3;
@end

@implementation _HKDatabaseChangesQueryServerConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_HKDatabaseChangesQueryServerConfiguration;
  id v4 = [(HKQueryServerConfiguration *)&v6 copyWithZone:a3];
  [v4 setAnchor:self->_anchor];
  [v4 setSampleTypes:self->_sampleTypes];
  [v4 setIncludeChangeDetails:self->_includeChangeDetails];
  [v4 setChangeDetailsQueryStrategy:self->_changeDetailsQueryStrategy];
  [v4 setAnchorStrategyChangeCountLimit:self->_anchorStrategyChangeCountLimit];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HKDatabaseChangesQueryServerConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_HKDatabaseChangesQueryServerConfiguration;
  v5 = [(HKQueryServerConfiguration *)&v14 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"queryAnchor"];
    anchor = v5->_anchor;
    v5->_anchor = (HKQueryAnchor *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"sampleTypes"];
    sampleTypes = v5->_sampleTypes;
    v5->_sampleTypes = (NSSet *)v11;

    v5->_includeChangeDetails = [v4 decodeBoolForKey:@"includeChangeDetails"];
    v5->_changeDetailsQueryStrategy = [v4 decodeIntegerForKey:@"queryStrategy"];
    v5->_anchorStrategyChangeCountLimit = [v4 decodeIntegerForKey:@"anchorLimit"];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_HKDatabaseChangesQueryServerConfiguration;
  id v4 = a3;
  [(HKQueryServerConfiguration *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_anchor, @"queryAnchor", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_sampleTypes forKey:@"sampleTypes"];
  [v4 encodeBool:self->_includeChangeDetails forKey:@"includeChangeDetails"];
  [v4 encodeInteger:self->_changeDetailsQueryStrategy forKey:@"queryStrategy"];
  [v4 encodeInteger:self->_anchorStrategyChangeCountLimit forKey:@"anchorLimit"];
}

- (NSSet)sampleTypes
{
  return self->_sampleTypes;
}

- (void)setSampleTypes:(id)a3
{
}

- (HKQueryAnchor)anchor
{
  return self->_anchor;
}

- (void)setAnchor:(id)a3
{
}

- (BOOL)includeChangeDetails
{
  return self->_includeChangeDetails;
}

- (void)setIncludeChangeDetails:(BOOL)a3
{
  self->_includeChangeDetails = a3;
}

- (int64_t)changeDetailsQueryStrategy
{
  return self->_changeDetailsQueryStrategy;
}

- (void)setChangeDetailsQueryStrategy:(int64_t)a3
{
  self->_changeDetailsQueryStrategy = a3;
}

- (int64_t)anchorStrategyChangeCountLimit
{
  return self->_anchorStrategyChangeCountLimit;
}

- (void)setAnchorStrategyChangeCountLimit:(int64_t)a3
{
  self->_anchorStrategyChangeCountLimit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchor, 0);

  objc_storeStrong((id *)&self->_sampleTypes, 0);
}

@end