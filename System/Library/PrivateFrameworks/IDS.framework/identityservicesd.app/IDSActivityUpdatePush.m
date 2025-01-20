@interface IDSActivityUpdatePush
- (BOOL)activityStatus;
- (NSData)metadataBlob;
- (NSData)token;
- (NSString)activitySubActivity;
- (NSString)activityTopic;
- (int64_t)activityTimestamp;
- (void)setActivityStatus:(BOOL)a3;
- (void)setActivitySubActivity:(id)a3;
- (void)setActivityTimestamp:(int64_t)a3;
- (void)setActivityTopic:(id)a3;
- (void)setMetadataBlob:(id)a3;
- (void)setToken:(id)a3;
@end

@implementation IDSActivityUpdatePush

- (NSString)activityTopic
{
  return self->_activityTopic;
}

- (void)setActivityTopic:(id)a3
{
}

- (NSData)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
}

- (NSString)activitySubActivity
{
  return self->_activitySubActivity;
}

- (void)setActivitySubActivity:(id)a3
{
}

- (NSData)metadataBlob
{
  return self->_metadataBlob;
}

- (void)setMetadataBlob:(id)a3
{
}

- (BOOL)activityStatus
{
  return self->_activityStatus;
}

- (void)setActivityStatus:(BOOL)a3
{
  self->_activityStatus = a3;
}

- (int64_t)activityTimestamp
{
  return self->_activityTimestamp;
}

- (void)setActivityTimestamp:(int64_t)a3
{
  self->_activityTimestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataBlob, 0);
  objc_storeStrong((id *)&self->_activitySubActivity, 0);
  objc_storeStrong((id *)&self->_token, 0);

  objc_storeStrong((id *)&self->_activityTopic, 0);
}

@end