@interface ASDSoftwareUpdateMetrics
+ (BOOL)supportsSecureCoding;
- (ASDSoftwareUpdateMetrics)initWithCoder:(id)a3;
- (BOOL)usingModernUpdatesCheck;
- (NSDate)lastUpdateCheck;
- (NSDate)nextUpdateCheck;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setLastUpdateCheck:(id)a3;
- (void)setNextUpdateCheck:(id)a3;
- (void)setUsingModernUpdatesCheck:(BOOL)a3;
@end

@implementation ASDSoftwareUpdateMetrics

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[ASDSoftwareUpdateMetrics allocWithZone:](ASDSoftwareUpdateMetrics, "allocWithZone:") init];
  uint64_t v6 = [(NSDate *)self->_lastUpdateCheck copyWithZone:a3];
  lastUpdateCheck = v5->_lastUpdateCheck;
  v5->_lastUpdateCheck = (NSDate *)v6;

  uint64_t v8 = [(NSDate *)self->_nextUpdateCheck copyWithZone:a3];
  nextUpdateCheck = v5->_nextUpdateCheck;
  v5->_nextUpdateCheck = (NSDate *)v8;

  v5->_usingModernUpdatesCheck = self->_usingModernUpdatesCheck;
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDSoftwareUpdateMetrics)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ASDSoftwareUpdateMetrics *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastUpdateCheck"];
    lastUpdateCheck = v5->_lastUpdateCheck;
    v5->_lastUpdateCheck = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nextUpdateCheck"];
    nextUpdateCheck = v5->_nextUpdateCheck;
    v5->_nextUpdateCheck = (NSDate *)v8;

    v5->_usingModernUpdatesCheck = [v4 decodeBoolForKey:@"usingModernUpdateCheck"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  lastUpdateCheck = self->_lastUpdateCheck;
  id v5 = a3;
  [v5 encodeObject:lastUpdateCheck forKey:@"lastUpdateCheck"];
  [v5 encodeObject:self->_nextUpdateCheck forKey:@"nextUpdateCheck"];
  [v5 encodeBool:self->_usingModernUpdatesCheck forKey:@"usingModernUpdateCheck"];
}

- (NSDate)lastUpdateCheck
{
  return self->_lastUpdateCheck;
}

- (void)setLastUpdateCheck:(id)a3
{
}

- (NSDate)nextUpdateCheck
{
  return self->_nextUpdateCheck;
}

- (void)setNextUpdateCheck:(id)a3
{
}

- (BOOL)usingModernUpdatesCheck
{
  return self->_usingModernUpdatesCheck;
}

- (void)setUsingModernUpdatesCheck:(BOOL)a3
{
  self->_usingModernUpdatesCheck = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextUpdateCheck, 0);
  objc_storeStrong((id *)&self->_lastUpdateCheck, 0);
}

@end