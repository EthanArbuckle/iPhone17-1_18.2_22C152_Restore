@interface MRUAsset
+ (id)image:(id)a3;
+ (id)packageAsset:(id)a3;
+ (id)packageAsset:(id)a3 symbolName:(id)a4 image:(id)a5;
+ (id)packageAssetNamed:(id)a3;
+ (id)symbolNamed:(id)a3;
+ (id)symbolNamed:(id)a3 symbolEffect:(id)a4 symbolEffectOptions:(id)a5;
- (BOOL)isEqual:(id)a3;
- (MRUAsset)initWithImage:(id)a3;
- (MRUAsset)initWithPackageAsset:(id)a3;
- (MRUAsset)initWithPackageAsset:(id)a3 symbolName:(id)a4 image:(id)a5;
- (MRUAsset)initWithPackageAsset:(id)a3 symbolName:(id)a4 symbolEffect:(id)a5 symbolEffectOptions:(id)a6 image:(id)a7;
- (MRUAsset)initWithPackageAssetNamed:(id)a3;
- (MRUAsset)initWithSymbolName:(id)a3;
- (MRUAsset)initWithSymbolName:(id)a3 symbolEffect:(id)a4 symbolEffectOptions:(id)a5;
- (MRUCAPackageAsset)packageAsset;
- (NSString)accessibilityIdentifier;
- (NSString)symbolName;
- (NSSymbolEffect)symbolEffect;
- (NSSymbolEffectOptions)symbolEffectOptions;
- (UIImage)image;
- (id)description;
- (void)setAccessibilityIdentifier:(id)a3;
@end

@implementation MRUAsset

+ (id)packageAsset:(id)a3 symbolName:(id)a4 image:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[objc_alloc((Class)a1) initWithPackageAsset:v10 symbolName:v9 image:v8];

  return v11;
}

+ (id)packageAsset:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithPackageAsset:v4];

  return v5;
}

+ (id)packageAssetNamed:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithPackageAssetNamed:v4];

  return v5;
}

+ (id)symbolNamed:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithSymbolName:v4];

  return v5;
}

+ (id)symbolNamed:(id)a3 symbolEffect:(id)a4 symbolEffectOptions:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[objc_alloc((Class)a1) initWithSymbolName:v10 symbolEffect:v9 symbolEffectOptions:v8];

  return v11;
}

+ (id)image:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithImage:v4];

  return v5;
}

- (MRUAsset)initWithPackageAsset:(id)a3 symbolName:(id)a4 image:(id)a5
{
  return [(MRUAsset *)self initWithPackageAsset:a3 symbolName:a4 symbolEffect:0 symbolEffectOptions:0 image:a5];
}

- (MRUAsset)initWithPackageAsset:(id)a3 symbolName:(id)a4 symbolEffect:(id)a5 symbolEffectOptions:(id)a6 image:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)MRUAsset;
  v17 = [(MRUAsset *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_packageAsset, a3);
    objc_storeStrong((id *)&v18->_symbolName, a4);
    objc_storeStrong((id *)&v18->_symbolEffect, a5);
    objc_storeStrong((id *)&v18->_symbolEffectOptions, a6);
    objc_storeStrong((id *)&v18->_image, a7);
  }

  return v18;
}

- (MRUAsset)initWithPackageAsset:(id)a3
{
  return [(MRUAsset *)self initWithPackageAsset:a3 symbolName:0 image:0];
}

- (MRUAsset)initWithPackageAssetNamed:(id)a3
{
  id v4 = +[MRUCAPackageAsset packageNamed:a3];
  v5 = [(MRUAsset *)self initWithPackageAsset:v4 symbolName:0 image:0];

  return v5;
}

- (MRUAsset)initWithSymbolName:(id)a3
{
  return [(MRUAsset *)self initWithPackageAsset:0 symbolName:a3 image:0];
}

- (MRUAsset)initWithSymbolName:(id)a3 symbolEffect:(id)a4 symbolEffectOptions:(id)a5
{
  return [(MRUAsset *)self initWithPackageAsset:0 symbolName:a3 symbolEffect:a4 symbolEffectOptions:a5 image:0];
}

- (MRUAsset)initWithImage:(id)a3
{
  return [(MRUAsset *)self initWithPackageAsset:0 symbolName:0 image:a3];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"%@ package: %@ | symbol: %@ | image: %@", objc_opt_class(), self->_packageAsset, self->_symbolName, self->_image];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MRUAsset *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [v5 packageAsset];
      v7 = v6;
      if (v6 == self->_packageAsset) {
        char v8 = 1;
      }
      else {
        char v8 = -[MRUCAPackageAsset isEqual:](v6, "isEqual:");
      }

      id v10 = [v5 symbolName];
      v11 = v10;
      if (v10 == self->_symbolName) {
        char v12 = 1;
      }
      else {
        char v12 = -[NSString isEqual:](v10, "isEqual:");
      }
      char v13 = v8 & v12;

      image = self->_image;
      id v15 = (UIImage *)v5[1];
      id v16 = v15;
      if (v15 == image) {
        char v17 = 1;
      }
      else {
        char v17 = [(UIImage *)v15 isEqual:image];
      }

      char v9 = v13 & v17;
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (UIImage)image
{
  if (self->_symbolName)
  {
    objc_msgSend(MEMORY[0x1E4FB1818], "_systemImageNamed:");
    v2 = (UIImage *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = self->_image;
  }

  return v2;
}

- (MRUCAPackageAsset)packageAsset
{
  return self->_packageAsset;
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (NSString)accessibilityIdentifier
{
  return self->_accessibilityIdentifier;
}

- (void)setAccessibilityIdentifier:(id)a3
{
}

- (NSSymbolEffect)symbolEffect
{
  return self->_symbolEffect;
}

- (NSSymbolEffectOptions)symbolEffectOptions
{
  return self->_symbolEffectOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbolEffectOptions, 0);
  objc_storeStrong((id *)&self->_symbolEffect, 0);
  objc_storeStrong((id *)&self->_accessibilityIdentifier, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_packageAsset, 0);

  objc_storeStrong((id *)&self->_image, 0);
}

@end