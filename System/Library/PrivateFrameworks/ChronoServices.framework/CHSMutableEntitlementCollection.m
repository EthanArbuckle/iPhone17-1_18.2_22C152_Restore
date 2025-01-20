@interface CHSMutableEntitlementCollection
- (void)setCanKeepAlive:(BOOL)a3;
- (void)setCanOpenSystemURLs:(BOOL)a3;
- (void)setInvalidatesOnStorefrontChange:(BOOL)a3;
- (void)setUsesEventService:(BOOL)a3;
@end

@implementation CHSMutableEntitlementCollection

- (void)setUsesEventService:(BOOL)a3
{
  self->super._usesEventService = a3;
}

- (void)setCanOpenSystemURLs:(BOOL)a3
{
  self->super._canOpenSystemURLs = a3;
}

- (void)setCanKeepAlive:(BOOL)a3
{
  self->super._canKeepAlive = a3;
}

- (void)setInvalidatesOnStorefrontChange:(BOOL)a3
{
  self->super._invalidatesOnStorefrontChange = a3;
}

@end