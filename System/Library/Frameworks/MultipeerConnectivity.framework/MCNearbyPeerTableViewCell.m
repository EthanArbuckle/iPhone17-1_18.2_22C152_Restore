@interface MCNearbyPeerTableViewCell
- (MCNearbyPeerTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation MCNearbyPeerTableViewCell

- (MCNearbyPeerTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  result = (MCNearbyPeerTableViewCell *)(id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "loadNibNamed:owner:options:", @"MCNearbyPeerTableViewCell", self, 0), "objectAtIndex:", 0);
  if (!result)
  {
    v7.receiver = 0;
    v7.super_class = (Class)MCNearbyPeerTableViewCell;
    return [(MCNearbyPeerTableViewCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  }
  return result;
}

@end