@interface AVTAvatarLibraryCollectionViewCell
+ (id)cellIdentifier;
- (AVTAvatarLibraryCollectionViewCell)initWithFrame:(CGRect)a3;
- (UIImageView)imageView;
- (void)updateAvatarImage:(id)a3;
@end

@implementation AVTAvatarLibraryCollectionViewCell

+ (id)cellIdentifier
{
  return @"AVTAvatarLibraryCollectionViewCell";
}

- (AVTAvatarLibraryCollectionViewCell)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)AVTAvatarLibraryCollectionViewCell;
  v3 = -[AVTAvatarLibraryCollectionViewCell initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F1C6D0]);
    v5 = [(AVTAvatarLibraryCollectionViewCell *)v3 contentView];
    [v5 bounds];
    v6 = (UIImageView *)objc_msgSend(v4, "initWithFrame:");

    [(UIImageView *)v6 setAutoresizingMask:18];
    v7 = [(AVTAvatarLibraryCollectionViewCell *)v3 contentView];
    [v7 addSubview:v6];

    imageView = v3->_imageView;
    v3->_imageView = v6;
  }
  return v3;
}

- (void)updateAvatarImage:(id)a3
{
  id v4 = a3;
  id v5 = [(AVTAvatarLibraryCollectionViewCell *)self imageView];
  [v5 setImage:v4];
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void).cxx_destruct
{
}

@end