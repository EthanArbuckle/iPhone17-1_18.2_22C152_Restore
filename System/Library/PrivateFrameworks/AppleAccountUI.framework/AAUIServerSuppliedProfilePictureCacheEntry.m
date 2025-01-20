@interface AAUIServerSuppliedProfilePictureCacheEntry
- (BOOL)expired;
- (BOOL)updating;
- (NSString)serverCacheTag;
- (UIImage)picture;
- (id)description;
- (void)expire;
- (void)extendExpirationDate;
- (void)setPicture:(id)a3;
- (void)setServerCacheTag:(id)a3;
- (void)setUpdating:(BOOL)a3;
@end

@implementation AAUIServerSuppliedProfilePictureCacheEntry

- (void)setPicture:(id)a3
{
  v4 = (UIImage *)a3;
  v5 = [MEMORY[0x263EFF910] date];
  v6 = [v5 dateByAddingTimeInterval:3600.0];
  expirationDate = self->_expirationDate;
  self->_expirationDate = v6;

  picture = self->_picture;
  self->_picture = v4;
}

- (BOOL)expired
{
  if (!self->_expirationDate) {
    return 1;
  }
  v3 = [MEMORY[0x263EFF910] date];
  BOOL v4 = [v3 compare:self->_expirationDate] == 1;

  return v4;
}

- (void)extendExpirationDate
{
  id v5 = [MEMORY[0x263EFF910] date];
  v3 = [v5 dateByAddingTimeInterval:3600.0];
  expirationDate = self->_expirationDate;
  self->_expirationDate = v3;
}

- (void)expire
{
  self->_expirationDate = 0;
  MEMORY[0x270F9A758]();
}

- (id)description
{
  v3 = NSString;
  picture = self->_picture;
  serverCacheTag = self->_serverCacheTag;
  v6 = [NSNumber numberWithBool:self->_updating];
  v7 = [v3 stringWithFormat:@"<AAUIServerSuppliedProfilePictureCacheEntry: %p picture %@ serverCacheTag %@ updating %@ _expirationDate %@ >", self, picture, serverCacheTag, v6, self->_expirationDate];

  return v7;
}

- (UIImage)picture
{
  return self->_picture;
}

- (NSString)serverCacheTag
{
  return self->_serverCacheTag;
}

- (void)setServerCacheTag:(id)a3
{
}

- (BOOL)updating
{
  return self->_updating;
}

- (void)setUpdating:(BOOL)a3
{
  self->_updating = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverCacheTag, 0);
  objc_storeStrong((id *)&self->_picture, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
}

@end