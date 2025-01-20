@interface PHResourceChooserList
- (BOOL)reversed;
- (PHResourceChooserList)init;
- (void)continueEnumeratingWithSourceOptions:(unint64_t)a3;
@end

@implementation PHResourceChooserList

- (void)continueEnumeratingWithSourceOptions:(unint64_t)a3
{
}

- (BOOL)reversed
{
  return self->_enumerationDirection == -1;
}

- (PHResourceChooserList)init
{
  v7.receiver = self;
  v7.super_class = (Class)PHResourceChooserList;
  v2 = [(PHResourceChooserList *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    visitedKeys = v2->_visitedKeys;
    v2->_visitedKeys = (NSMutableArray *)v3;

    sortDescriptor = v2->_sortDescriptor;
    v2->_sortDescriptor = 0;

    PHChooserListMoveFirst((uint64_t)v2);
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visitedKeys, 0);
  objc_storeStrong((id *)&self->_unvisitedNonHintResourcesInfos, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_sortDescriptor, 0);
  objc_storeStrong((id *)&self->_nonHintResourceInfos, 0);
  objc_storeStrong(&self->_endOfListHandler, 0);
  objc_storeStrong(&self->_itemHandler, 0);

  objc_storeStrong((id *)&self->_asset, 0);
}

@end