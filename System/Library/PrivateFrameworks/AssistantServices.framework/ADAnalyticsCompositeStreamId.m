@interface ADAnalyticsCompositeStreamId
- (NSString)speechId;
- (NSString)streamUID;
- (void)setSpeechId:(id)a3;
- (void)setStreamUID:(id)a3;
@end

@implementation ADAnalyticsCompositeStreamId

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speechId, 0);
  objc_storeStrong((id *)&self->_streamUID, 0);
}

- (void)setSpeechId:(id)a3
{
}

- (NSString)speechId
{
  return self->_speechId;
}

- (void)setStreamUID:(id)a3
{
}

- (NSString)streamUID
{
  return self->_streamUID;
}

@end