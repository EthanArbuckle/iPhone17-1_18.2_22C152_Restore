@interface DKWalletLocalPaymentCardViewModel
- (NSString)subtitle;
- (NSString)title;
- (NSString)uniqueIdentifier;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUniqueIdentifier:(id)a3;
@end

@implementation DKWalletLocalPaymentCardViewModel

- (NSString)subtitle
{
  return self->subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)title
{
  return self->title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)uniqueIdentifier
{
  return self->uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->title, 0);
  objc_storeStrong((id *)&self->subtitle, 0);
}

@end