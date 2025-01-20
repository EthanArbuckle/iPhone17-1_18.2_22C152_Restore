@interface GEOAPUploadPolicy
- (BOOL)sendImmediately;
- (NSArray)uploadStages;
- (double)ttl;
- (int)type;
- (void)setSendImmediately:(BOOL)a3;
- (void)setTtl:(double)a3;
- (void)setType:(int)a3;
- (void)setUploadStages:(id)a3;
@end

@implementation GEOAPUploadPolicy

- (double)ttl
{
  return self->_ttl;
}

- (BOOL)sendImmediately
{
  return self->_sendImmediately;
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (void)setSendImmediately:(BOOL)a3
{
  self->_sendImmediately = a3;
}

- (void)setTtl:(double)a3
{
  self->_ttl = a3;
}

- (NSArray)uploadStages
{
  return self->_uploadStages;
}

- (void)setUploadStages:(id)a3
{
}

- (void).cxx_destruct
{
}

@end