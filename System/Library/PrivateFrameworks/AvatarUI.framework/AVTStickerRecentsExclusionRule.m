@interface AVTStickerRecentsExclusionRule
- (NSString)avatarRecordIdentifier;
- (NSString)stickerConfigurationIdentifier;
- (void)setAvatarRecordIdentifier:(id)a3;
- (void)setStickerConfigurationIdentifier:(id)a3;
@end

@implementation AVTStickerRecentsExclusionRule

- (NSString)avatarRecordIdentifier
{
  return self->_avatarRecordIdentifier;
}

- (void)setAvatarRecordIdentifier:(id)a3
{
}

- (NSString)stickerConfigurationIdentifier
{
  return self->_stickerConfigurationIdentifier;
}

- (void)setStickerConfigurationIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stickerConfigurationIdentifier, 0);
  objc_storeStrong((id *)&self->_avatarRecordIdentifier, 0);
}

@end