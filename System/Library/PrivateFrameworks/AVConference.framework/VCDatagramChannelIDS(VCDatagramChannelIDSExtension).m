@interface VCDatagramChannelIDS(VCDatagramChannelIDSExtension)
- (id)idsDatagramChannel;
@end

@implementation VCDatagramChannelIDS(VCDatagramChannelIDSExtension)

- (id)idsDatagramChannel
{
  return self->_idsChannel;
}

@end