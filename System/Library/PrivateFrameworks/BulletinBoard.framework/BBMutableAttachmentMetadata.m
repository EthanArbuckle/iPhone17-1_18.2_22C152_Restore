@interface BBMutableAttachmentMetadata
- (id)copyWithZone:(_NSZone *)a3;
- (void)setHiddenFromDefaultExpandedView:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setThumbnailGeneratorUserInfo:(id)a3;
- (void)setThumbnailHidden:(BOOL)a3;
- (void)setType:(int64_t)a3;
- (void)setURL:(id)a3;
- (void)setUniformType:(id)a3;
@end

@implementation BBMutableAttachmentMetadata

- (void)setType:(int64_t)a3
{
  self->super._type = a3;
}

- (void)setURL:(id)a3
{
  self->super._URL = (NSURL *)[a3 copy];
  MEMORY[0x270F9A758]();
}

- (void)setIdentifier:(id)a3
{
  self->super._identifier = (NSString *)[a3 copy];
  MEMORY[0x270F9A758]();
}

- (void)setUniformType:(id)a3
{
  self->super._uniformType = (NSString *)[a3 copy];
  MEMORY[0x270F9A758]();
}

- (void)setThumbnailGeneratorUserInfo:(id)a3
{
  self->super._thumbnailGeneratorUserInfo = (NSDictionary *)[a3 copy];
  MEMORY[0x270F9A758]();
}

- (void)setThumbnailHidden:(BOOL)a3
{
  self->super._thumbnailHidden = a3;
}

- (void)setHiddenFromDefaultExpandedView:(BOOL)a3
{
  self->super._hiddenFromDefaultExpandedView = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[BBAttachmentMetadata allocWithZone:a3];
  int64_t v5 = [(BBAttachmentMetadata *)self type];
  v6 = [(BBAttachmentMetadata *)self URL];
  v7 = [(BBAttachmentMetadata *)self identifier];
  v8 = [(BBAttachmentMetadata *)self uniformType];
  v9 = [(BBAttachmentMetadata *)self thumbnailGeneratorUserInfo];
  BOOL v10 = [(BBAttachmentMetadata *)self thumbnailHidden];
  LOBYTE(v13) = [(BBAttachmentMetadata *)self hiddenFromDefaultExpandedView];
  id v11 = [(BBAttachmentMetadata *)v4 _initWithType:v5 URL:v6 identifier:v7 uniformType:v8 thumbnailGeneratorUserInfo:v9 thumbnailHidden:v10 hiddenFromDefaultExpandedView:v13];

  return v11;
}

@end