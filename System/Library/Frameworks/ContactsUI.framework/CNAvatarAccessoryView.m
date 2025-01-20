@interface CNAvatarAccessoryView
+ (id)badgeWithSystemImageNamed:(id)a3;
+ (id)mediaContextBadgeWithImageData:(id)a3;
@end

@implementation CNAvatarAccessoryView

+ (id)badgeWithSystemImageNamed:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F5A6D0];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithSystemImageNamed:v4];

  return v5;
}

+ (id)mediaContextBadgeWithImageData:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F5A6B8];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithImageData:v4];

  return v5;
}

@end