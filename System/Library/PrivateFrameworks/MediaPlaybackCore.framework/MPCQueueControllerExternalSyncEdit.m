@interface MPCQueueControllerExternalSyncEdit
- (NSString)targetContentItemID;
- (void)setTargetContentItemID:(id)a3;
@end

@implementation MPCQueueControllerExternalSyncEdit

- (void).cxx_destruct
{
}

- (NSString)targetContentItemID
{
  return self->_targetContentItemID;
}

- (void)setTargetContentItemID:(id)a3
{
  v4 = (NSString *)[a3 copy];
  targetContentItemID = self->_targetContentItemID;
  self->_targetContentItemID = v4;
}

@end