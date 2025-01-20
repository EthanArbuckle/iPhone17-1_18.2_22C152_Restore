@interface HMMTRReportDescription
- (HMMTRReportDescription)initWithClusterId:(id)a3 attributeIds:(id)a4 eventIds:(id)a5;
- (NSArray)attributeIds;
- (NSArray)eventIds;
- (NSNumber)clusterId;
- (NSString)clusterClass;
- (NSString)clusterSelector;
- (id)mapEvent;
- (id)mapValue;
- (void)setClusterClass:(id)a3;
- (void)setClusterSelector:(id)a3;
- (void)setMapEvent:(id)a3;
- (void)setMapValue:(id)a3;
@end

@implementation HMMTRReportDescription

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clusterSelector, 0);
  objc_storeStrong((id *)&self->_clusterClass, 0);
  objc_storeStrong(&self->_mapEvent, 0);
  objc_storeStrong(&self->_mapValue, 0);
  objc_storeStrong((id *)&self->_eventIds, 0);
  objc_storeStrong((id *)&self->_attributeIds, 0);
  objc_storeStrong((id *)&self->_clusterId, 0);
}

- (void)setClusterSelector:(id)a3
{
}

- (NSString)clusterSelector
{
  return self->_clusterSelector;
}

- (void)setClusterClass:(id)a3
{
}

- (NSString)clusterClass
{
  return self->_clusterClass;
}

- (void)setMapEvent:(id)a3
{
}

- (id)mapEvent
{
  return self->_mapEvent;
}

- (void)setMapValue:(id)a3
{
}

- (id)mapValue
{
  return self->_mapValue;
}

- (NSArray)eventIds
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)attributeIds
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSNumber)clusterId
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (HMMTRReportDescription)initWithClusterId:(id)a3 attributeIds:(id)a4 eventIds:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMMTRReportDescription;
  v12 = [(HMMTRReportDescription *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_clusterId, a3);
    objc_storeStrong((id *)&v13->_attributeIds, a4);
    objc_storeStrong((id *)&v13->_eventIds, a5);
  }

  return v13;
}

@end