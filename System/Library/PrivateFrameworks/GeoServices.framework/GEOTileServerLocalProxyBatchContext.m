@interface GEOTileServerLocalProxyBatchContext
- (BOOL)proactivelyLoadOnFailure;
- (GEOTileKeyList)cacheMissNoDataList;
- (GEOTileKeyList)cacheMissStaleDataList;
- (GEOTileKeyList)cacheMissStaleUnusableDataList;
- (GEOTileKeyList)fullList;
- (GEOTileKeyList)interestList;
- (GEOTileKeyList)pendingRequesterList;
- (GEOTileKeyList)requesterList;
- (GEOTileRequester)tileRequester;
- (unsigned)loadReason;
- (void)setCacheMissNoDataList:(id)a3;
- (void)setCacheMissStaleDataList:(id)a3;
- (void)setCacheMissStaleUnusableDataList:(id)a3;
- (void)setFullList:(id)a3;
- (void)setInterestList:(id)a3;
- (void)setLoadReason:(unsigned __int8)a3;
- (void)setPendingRequesterList:(id)a3;
- (void)setProactivelyLoadOnFailure:(BOOL)a3;
- (void)setRequesterList:(id)a3;
- (void)setTileRequester:(id)a3;
@end

@implementation GEOTileServerLocalProxyBatchContext

- (GEOTileKeyList)pendingRequesterList
{
  return self->_pendingRequesterList;
}

- (unsigned)loadReason
{
  return self->_loadReason;
}

- (GEOTileKeyList)interestList
{
  return self->_interestList;
}

- (void)setRequesterList:(id)a3
{
}

- (void)setProactivelyLoadOnFailure:(BOOL)a3
{
  self->_proactivelyLoadOnFailure = a3;
}

- (void)setLoadReason:(unsigned __int8)a3
{
  self->_loadReason = a3;
}

- (void)setInterestList:(id)a3
{
}

- (void)setFullList:(id)a3
{
}

- (void)setCacheMissStaleUnusableDataList:(id)a3
{
}

- (void)setCacheMissStaleDataList:(id)a3
{
}

- (void)setCacheMissNoDataList:(id)a3
{
}

- (void)setPendingRequesterList:(id)a3
{
}

- (void)setTileRequester:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tileRequester, 0);
  objc_storeStrong((id *)&self->_cacheMissStaleUnusableDataList, 0);
  objc_storeStrong((id *)&self->_cacheMissStaleDataList, 0);
  objc_storeStrong((id *)&self->_cacheMissNoDataList, 0);
  objc_storeStrong((id *)&self->_pendingRequesterList, 0);
  objc_storeStrong((id *)&self->_requesterList, 0);
  objc_storeStrong((id *)&self->_interestList, 0);

  objc_storeStrong((id *)&self->_fullList, 0);
}

- (GEOTileKeyList)fullList
{
  return self->_fullList;
}

- (GEOTileKeyList)requesterList
{
  return self->_requesterList;
}

- (GEOTileKeyList)cacheMissNoDataList
{
  return self->_cacheMissNoDataList;
}

- (GEOTileKeyList)cacheMissStaleDataList
{
  return self->_cacheMissStaleDataList;
}

- (GEOTileKeyList)cacheMissStaleUnusableDataList
{
  return self->_cacheMissStaleUnusableDataList;
}

- (BOOL)proactivelyLoadOnFailure
{
  return self->_proactivelyLoadOnFailure;
}

- (GEOTileRequester)tileRequester
{
  return self->_tileRequester;
}

@end