@interface _EARCombinedResult
- (NSArray)nBestSourceIndexes;
- (NSArray)nBestStrings;
- (NSArray)originalRanks;
- (void)setNBestSourceIndexes:(id)a3;
- (void)setNBestStrings:(id)a3;
- (void)setOriginalRanks:(id)a3;
@end

@implementation _EARCombinedResult

- (NSArray)nBestStrings
{
  return self->_nBestStrings;
}

- (void)setNBestStrings:(id)a3
{
}

- (NSArray)nBestSourceIndexes
{
  return self->_nBestSourceIndexes;
}

- (void)setNBestSourceIndexes:(id)a3
{
}

- (NSArray)originalRanks
{
  return self->_originalRanks;
}

- (void)setOriginalRanks:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalRanks, 0);
  objc_storeStrong((id *)&self->_nBestSourceIndexes, 0);
  objc_storeStrong((id *)&self->_nBestStrings, 0);
}

@end