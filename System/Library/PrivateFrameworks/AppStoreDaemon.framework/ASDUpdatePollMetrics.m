@interface ASDUpdatePollMetrics
- (ASDUpdatePollMetrics)initWithDictionary:(id)a3;
- (NSArray)bundleIDs;
- (NSDate)pollTime;
- (NSString)reason;
- (id)description;
- (id)dictionary;
- (void)setBundleIDs:(id)a3;
- (void)setPollTime:(id)a3;
- (void)setReason:(id)a3;
@end

@implementation ASDUpdatePollMetrics

- (ASDUpdatePollMetrics)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ASDUpdatePollMetrics;
  v5 = [(ASDUpdatePollMetrics *)&v15 init];
  if (v5)
  {
    v6 = [v4 objectForKey:@"date"];
    if (objc_opt_respondsToSelector())
    {
      v7 = (void *)MEMORY[0x1E4F1C9C8];
      [v6 doubleValue];
      uint64_t v8 = objc_msgSend(v7, "dateWithTimeIntervalSinceReferenceDate:");
      pollTime = v5->_pollTime;
      v5->_pollTime = (NSDate *)v8;
    }
    uint64_t v10 = [v4 objectForKey:@"reason"];
    reason = v5->_reason;
    v5->_reason = (NSString *)v10;

    uint64_t v12 = [v4 objectForKey:@"bundleIDs"];
    bundleIDs = v5->_bundleIDs;
    v5->_bundleIDs = (NSArray *)v12;
  }
  return v5;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(ASDUpdatePollMetrics *)self pollTime];
  v5 = [(ASDUpdatePollMetrics *)self reason];
  v6 = [(ASDUpdatePollMetrics *)self bundleIDs];
  v7 = [v6 componentsJoinedByString:@", "];
  uint64_t v8 = [v3 stringWithFormat:@"{ %@: %@, %@: %@, %@ : [%@] }", @"date", v4, @"reason", v5, @"bundleIDs", v7];

  return v8;
}

- (id)dictionary
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = NSNumber;
  v5 = [(ASDUpdatePollMetrics *)self pollTime];
  [v5 timeIntervalSinceReferenceDate];
  v6 = objc_msgSend(v4, "numberWithDouble:");
  [v3 setObject:v6 forKeyedSubscript:@"date"];

  v7 = [(ASDUpdatePollMetrics *)self reason];
  [v3 setObject:v7 forKeyedSubscript:@"reason"];

  uint64_t v8 = [(ASDUpdatePollMetrics *)self bundleIDs];
  [v3 setObject:v8 forKeyedSubscript:@"bundleIDs"];

  return v3;
}

- (NSDate)pollTime
{
  return self->_pollTime;
}

- (void)setPollTime:(id)a3
{
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
}

- (NSArray)bundleIDs
{
  return self->_bundleIDs;
}

- (void)setBundleIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIDs, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_pollTime, 0);
}

@end