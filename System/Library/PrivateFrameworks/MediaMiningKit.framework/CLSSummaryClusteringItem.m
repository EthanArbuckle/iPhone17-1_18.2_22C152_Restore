@interface CLSSummaryClusteringItem
- (CLSSummaryClusteringItem)initWithCluster:(id)a3 numberOfItemsToElect:(unint64_t)a4;
- (PLDataCluster)cluster;
- (unint64_t)numberOfItemsToElect;
@end

@implementation CLSSummaryClusteringItem

- (void).cxx_destruct
{
}

- (unint64_t)numberOfItemsToElect
{
  return self->_numberOfItemsToElect;
}

- (PLDataCluster)cluster
{
  return (PLDataCluster *)objc_getProperty(self, a2, 8, 1);
}

- (CLSSummaryClusteringItem)initWithCluster:(id)a3 numberOfItemsToElect:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CLSSummaryClusteringItem;
  v8 = [(CLSSummaryClusteringItem *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_cluster, a3);
    v9->_numberOfItemsToElect = a4;
  }

  return v9;
}

@end