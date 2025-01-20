@interface UNMutableNotificationAttachmentOptions
- (id)copyWithZone:(_NSZone *)a3;
- (void)setDisplayLocation:(unint64_t)a3;
- (void)setThumbnailGeneratorUserInfo:(id)a3;
@end

@implementation UNMutableNotificationAttachmentOptions

- (void)setDisplayLocation:(unint64_t)a3
{
  self->super._displayLocation = a3;
}

- (void)setThumbnailGeneratorUserInfo:(id)a3
{
  self->super._thumbnailGeneratorUserInfo = (NSDictionary *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [UNNotificationAttachmentOptions alloc];

  return [(UNNotificationAttachmentOptions *)v4 _initWithOptions:self];
}

@end