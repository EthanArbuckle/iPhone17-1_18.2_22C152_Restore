@interface DNDMutableAppInfo
- (id)copyWithZone:(_NSZone *)a3;
- (void)setApplicationIdentifier:(id)a3;
- (void)setCachedIconURL:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setSource:(int64_t)a3;
- (void)setStoreIconURL:(id)a3;
@end

@implementation DNDMutableAppInfo

- (void)setSource:(int64_t)a3
{
  self->super._source = a3;
}

- (void)setStoreIconURL:(id)a3
{
  v4 = (NSURL *)[a3 copy];
  storeIconURL = self->super._storeIconURL;
  self->super._storeIconURL = v4;
  MEMORY[0x1F41817F8](v4, storeIconURL);
}

- (void)setCachedIconURL:(id)a3
{
  v4 = (NSURL *)[a3 copy];
  cachedIconURL = self->super._cachedIconURL;
  self->super._cachedIconURL = v4;
  MEMORY[0x1F41817F8](v4, cachedIconURL);
}

- (void)setDisplayName:(id)a3
{
  v4 = (NSString *)[a3 copy];
  displayName = self->super._displayName;
  self->super._displayName = v4;
  MEMORY[0x1F41817F8](v4, displayName);
}

- (void)setApplicationIdentifier:(id)a3
{
  v4 = (DNDApplicationIdentifier *)[a3 copy];
  applicationIdentifier = self->super._applicationIdentifier;
  self->super._applicationIdentifier = v4;
  MEMORY[0x1F41817F8](v4, applicationIdentifier);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[DNDAppInfo allocWithZone:a3];
  return [(DNDAppInfo *)v4 _initWithAppInfo:self];
}

@end