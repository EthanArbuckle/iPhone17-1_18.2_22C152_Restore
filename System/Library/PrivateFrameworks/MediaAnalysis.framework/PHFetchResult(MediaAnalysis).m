@interface PHFetchResult(MediaAnalysis)
- (id)resultsAsArray;
- (id)resultsAsSet;
@end

@implementation PHFetchResult(MediaAnalysis)

- (id)resultsAsArray
{
  v2 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__PHFetchResult_MediaAnalysis__resultsAsArray__block_invoke;
  v5[3] = &unk_1E62991F8;
  id v3 = v2;
  id v6 = v3;
  [a1 enumerateObjectsUsingBlock:v5];

  return v3;
}

- (id)resultsAsSet
{
  v2 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(a1, "count"));
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__PHFetchResult_MediaAnalysis__resultsAsSet__block_invoke;
  v5[3] = &unk_1E62991F8;
  id v3 = v2;
  id v6 = v3;
  [a1 enumerateObjectsUsingBlock:v5];

  return v3;
}

@end