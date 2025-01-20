@interface FIFolderSize
- (NSError)error;
- (int64_t)compressionAdjustedLogicalBytes;
- (int64_t)folderCount;
- (int64_t)logicalBytes;
- (int64_t)physicalBytes;
- (int64_t)skippedItemCount;
- (int64_t)totalItems;
- (int64_t)userVisibleItems;
@end

@implementation FIFolderSize

- (int64_t)totalItems
{
  return self->_totalItems;
}

- (int64_t)userVisibleItems
{
  return self->_userVisibleItems;
}

- (int64_t)logicalBytes
{
  return self->_logicalBytes;
}

- (int64_t)compressionAdjustedLogicalBytes
{
  return self->_compressionAdjustedLogicalBytes;
}

- (int64_t)physicalBytes
{
  return self->_physicalBytes;
}

- (int64_t)skippedItemCount
{
  return self->_skippedItemCount;
}

- (int64_t)folderCount
{
  return self->_folderCount;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
}

@end