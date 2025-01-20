@interface OTBottleIDs
- (NSArray)partialRecoveryBottleIDs;
- (NSArray)preferredBottleIDs;
- (void)setPartialRecoveryBottleIDs:(id)a3;
- (void)setPreferredBottleIDs:(id)a3;
@end

@implementation OTBottleIDs

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_partialRecoveryBottleIDs, 0);

  objc_storeStrong((id *)&self->_preferredBottleIDs, 0);
}

- (void)setPartialRecoveryBottleIDs:(id)a3
{
}

- (NSArray)partialRecoveryBottleIDs
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPreferredBottleIDs:(id)a3
{
}

- (NSArray)preferredBottleIDs
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

@end