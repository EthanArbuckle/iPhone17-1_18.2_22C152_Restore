@interface HMAccessory(CUPeerIdentifier)
- (void)setPeerIdentifier:()CUPeerIdentifier;
@end

@implementation HMAccessory(CUPeerIdentifier)

- (void)setPeerIdentifier:()CUPeerIdentifier
{
  v4 = (NSUUID *)[a3 copy];
  peerIdentifier = self->_peerIdentifier;
  self->_peerIdentifier = v4;

  MEMORY[0x1F41817F8](v4, peerIdentifier);
}

@end