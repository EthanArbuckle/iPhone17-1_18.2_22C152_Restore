@interface CSAttSiriIOSGazeNode
- (BOOL)hadSignalsFrom:(unint64_t)a3 to:(unint64_t)a4;
- (BOOL)isReady;
- (CSAsset)prefetchedAsset;
- (CSAttSiriController)attSiriController;
- (CSAttSiriIOSGazeNode)initWithAttSiriController:(id)a3;
- (NSArray)requiredNodes;
- (NSString)mhId;
- (unint64_t)type;
- (void)setAttSiriController:(id)a3;
- (void)setIsReady:(BOOL)a3;
- (void)setMhId:(id)a3;
- (void)setPrefetchedAsset:(id)a3;
- (void)setRequiredNodes:(id)a3;
@end

@implementation CSAttSiriIOSGazeNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mhId, 0);
  objc_destroyWeak((id *)&self->_attSiriController);
  objc_storeStrong((id *)&self->_requiredNodes, 0);
  objc_storeStrong((id *)&self->_prefetchedAsset, 0);
}

- (void)setMhId:(id)a3
{
}

- (NSString)mhId
{
  return self->_mhId;
}

- (void)setAttSiriController:(id)a3
{
}

- (CSAttSiriController)attSiriController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_attSiriController);
  return (CSAttSiriController *)WeakRetained;
}

- (void)setIsReady:(BOOL)a3
{
  self->_isReady = a3;
}

- (BOOL)isReady
{
  return self->_isReady;
}

- (void)setRequiredNodes:(id)a3
{
}

- (NSArray)requiredNodes
{
  return self->_requiredNodes;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setPrefetchedAsset:(id)a3
{
}

- (CSAsset)prefetchedAsset
{
  return self->_prefetchedAsset;
}

- (BOOL)hadSignalsFrom:(unint64_t)a3 to:(unint64_t)a4
{
  return 0;
}

- (CSAttSiriIOSGazeNode)initWithAttSiriController:(id)a3
{
  return 0;
}

@end