@interface AVTAvatarLibraryCollectionViewAddCell
+ (id)cellIdentifier;
- (AVTAvatarLibraryCollectionViewAddCell)initWithFrame:(CGRect)a3;
@end

@implementation AVTAvatarLibraryCollectionViewAddCell

+ (id)cellIdentifier
{
  return @"AVTAvatarLibraryCollectionViewAddCell";
}

- (AVTAvatarLibraryCollectionViewAddCell)initWithFrame:(CGRect)a3
{
  v18.receiver = self;
  v18.super_class = (Class)AVTAvatarLibraryCollectionViewAddCell;
  v3 = -[AVTAvatarLibraryCollectionViewAddCell initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)MEMORY[0x263F1C6B0];
    v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v6 = [v4 imageNamed:@"silhouetteHead" inBundle:v5 compatibleWithTraitCollection:0];

    id v7 = objc_alloc(MEMORY[0x263F1C6D0]);
    v8 = [(AVTAvatarLibraryCollectionViewAddCell *)v3 contentView];
    [v8 bounds];
    v9 = objc_msgSend(v7, "initWithFrame:");

    [v9 setImage:v6];
    [v9 setAutoresizingMask:18];
    v10 = [(AVTAvatarLibraryCollectionViewAddCell *)v3 contentView];
    [v10 addSubview:v9];

    id v11 = objc_alloc(MEMORY[0x263F1C768]);
    v12 = [(AVTAvatarLibraryCollectionViewAddCell *)v3 contentView];
    [v12 bounds];
    v13 = objc_msgSend(v11, "initWithFrame:");

    [v13 setText:@"+"];
    v14 = [MEMORY[0x263F1C658] systemFontOfSize:60.0];
    [v13 setFont:v14];

    v15 = [MEMORY[0x263F1C550] colorWithRed:0.0 green:0.46 blue:1.0 alpha:1.0];
    [v13 setTextColor:v15];

    [v13 setTextAlignment:1];
    [v13 setAutoresizingMask:18];
    v16 = [(AVTAvatarLibraryCollectionViewAddCell *)v3 contentView];
    [v16 addSubview:v13];
  }
  return v3;
}

@end