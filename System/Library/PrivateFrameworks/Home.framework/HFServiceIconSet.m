@interface HFServiceIconSet
+ (id)placeholderIconSet;
+ (id)setWithDefaultIcon:(id)a3;
+ (id)setWithDefaultIcon:(id)a3 alternateIcons:(id)a4;
+ (id)setWithImageIdentifier:(id)a3;
- (HFIconDescriptor)defaultIcon;
- (NSSet)allIcons;
@end

@implementation HFServiceIconSet

- (HFIconDescriptor)defaultIcon
{
  return self->_defaultIcon;
}

+ (id)setWithDefaultIcon:(id)a3 alternateIcons:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  v8 = (void *)v7[2];
  v7[2] = v5;
  id v9 = v5;

  if (v6) {
    id v10 = v6;
  }
  else {
    id v10 = (id)MEMORY[0x263EFFA68];
  }
  v11 = [MEMORY[0x263EFFA08] setWithArray:v10];

  uint64_t v12 = [v11 setByAddingObject:v9];
  v13 = (void *)v7[1];
  v7[1] = v12;

  return v7;
}

+ (id)setWithDefaultIcon:(id)a3
{
  return (id)[a1 setWithDefaultIcon:a3 alternateIcons:MEMORY[0x263EFFA68]];
}

+ (id)placeholderIconSet
{
  v3 = [[HFImageIconDescriptor alloc] initWithImageIdentifier:@"HFImageIconIdentifierGeneric"];
  v4 = [a1 setWithDefaultIcon:v3];

  return v4;
}

+ (id)setWithImageIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [[HFImageIconDescriptor alloc] initWithImageIdentifier:v4];

  id v6 = [a1 setWithDefaultIcon:v5];

  return v6;
}

- (NSSet)allIcons
{
  return self->_allIcons;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultIcon, 0);
  objc_storeStrong((id *)&self->_allIcons, 0);
}

@end