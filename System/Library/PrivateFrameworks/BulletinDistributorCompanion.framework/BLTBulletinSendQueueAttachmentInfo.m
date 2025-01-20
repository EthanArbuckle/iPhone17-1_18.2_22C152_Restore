@interface BLTBulletinSendQueueAttachmentInfo
- (NSString)key;
- (NSURL)url;
- (void)setKey:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation BLTBulletinSendQueueAttachmentInfo

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end