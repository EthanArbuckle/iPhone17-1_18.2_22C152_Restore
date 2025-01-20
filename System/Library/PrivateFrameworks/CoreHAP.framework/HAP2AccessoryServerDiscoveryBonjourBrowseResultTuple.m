@interface HAP2AccessoryServerDiscoveryBonjourBrowseResultTuple
- (HAP2AccessoryServerDiscoveryBonjourBrowseResultTuple)initWithPreviousResult:(id)a3 currentResult:(id)a4 changes:(unint64_t)a5;
- (OS_nw_browse_result)currentResult;
- (OS_nw_browse_result)previousResult;
- (unint64_t)changes;
@end

@implementation HAP2AccessoryServerDiscoveryBonjourBrowseResultTuple

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentResult, 0);

  objc_storeStrong((id *)&self->_previousResult, 0);
}

- (unint64_t)changes
{
  return self->_changes;
}

- (OS_nw_browse_result)currentResult
{
  return self->_currentResult;
}

- (OS_nw_browse_result)previousResult
{
  return self->_previousResult;
}

- (HAP2AccessoryServerDiscoveryBonjourBrowseResultTuple)initWithPreviousResult:(id)a3 currentResult:(id)a4 changes:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HAP2AccessoryServerDiscoveryBonjourBrowseResultTuple;
  v11 = [(HAP2AccessoryServerDiscoveryBonjourBrowseResultTuple *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_previousResult, a3);
    objc_storeStrong((id *)&v12->_currentResult, a4);
    v12->_changes = a5;
  }

  return v12;
}

@end