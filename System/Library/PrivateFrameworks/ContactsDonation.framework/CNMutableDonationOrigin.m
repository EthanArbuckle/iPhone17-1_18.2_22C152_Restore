@interface CNMutableDonationOrigin
- (CNMutableDonationOrigin)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setClusterIdentifier:(id)a3;
- (void)setDonationDate:(id)a3;
- (void)setDonationIdentifier:(id)a3;
- (void)setExpirationDate:(id)a3;
@end

@implementation CNMutableDonationOrigin

- (CNMutableDonationOrigin)init
{
  return [(CNDonationOrigin *)self initWithBundleIdentifier:&stru_26C4F6B38 donationIdentifier:&stru_26C4F6B38 donationDate:0 expirationDate:0];
}

- (void)setBundleIdentifier:(id)a3
{
  if (self->super._bundleIdentifier != a3)
  {
    self->super._bundleIdentifier = (NSString *)[a3 copy];
    MEMORY[0x270F9A758]();
  }
}

- (void)setDonationIdentifier:(id)a3
{
  if (self->super._donationIdentifier != a3)
  {
    self->super._donationIdentifier = (NSString *)[a3 copy];
    MEMORY[0x270F9A758]();
  }
}

- (void)setClusterIdentifier:(id)a3
{
  if (self->super._clusterIdentifier != a3)
  {
    self->super._clusterIdentifier = (NSString *)[a3 copy];
    MEMORY[0x270F9A758]();
  }
}

- (void)setDonationDate:(id)a3
{
  if (self->super._donationDate != a3)
  {
    self->super._donationDate = (NSDate *)[a3 copy];
    MEMORY[0x270F9A758]();
  }
}

- (void)setExpirationDate:(id)a3
{
  if (self->super._expirationDate != a3)
  {
    self->super._expirationDate = (NSDate *)[a3 copy];
    MEMORY[0x270F9A758]();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [CNDonationOrigin alloc];

  return [(CNDonationOrigin *)v4 initWithDonationOrigin:self];
}

@end