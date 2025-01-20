@interface IMPendingReplicatedMessage
- (NSArray)replicatedFallbackGUIDs;
- (NSDate)date;
- (NSString)messageGUID;
- (id)releaseBlock;
- (void)setDate:(id)a3;
- (void)setMessageGUID:(id)a3;
- (void)setReleaseBlock:(id)a3;
- (void)setReplicatedFallbackGUIDs:(id)a3;
@end

@implementation IMPendingReplicatedMessage

- (NSString)messageGUID
{
  return self->_messageGUID;
}

- (void)setMessageGUID:(id)a3
{
}

- (NSArray)replicatedFallbackGUIDs
{
  return self->_replicatedFallbackGUIDs;
}

- (void)setReplicatedFallbackGUIDs:(id)a3
{
}

- (id)releaseBlock
{
  return self->_releaseBlock;
}

- (void)setReleaseBlock:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong(&self->_releaseBlock, 0);
  objc_storeStrong((id *)&self->_replicatedFallbackGUIDs, 0);

  objc_storeStrong((id *)&self->_messageGUID, 0);
}

@end