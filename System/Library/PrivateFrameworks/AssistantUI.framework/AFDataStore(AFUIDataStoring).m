@interface AFDataStore(AFUIDataStoring)
- (_AFUIDataStoringShim)afui_dataStoringShim;
- (id)imageForKey:()AFUIDataStoring;
- (void)setImage:()AFUIDataStoring forKey:;
@end

@implementation AFDataStore(AFUIDataStoring)

- (void)setImage:()AFUIDataStoring forKey:
{
  if (a3)
  {
    v6 = (objc_class *)MEMORY[0x263F28520];
    id v7 = a4;
    v8 = a3;
    id v12 = objc_alloc_init(v6);
    v9 = UIImagePNGRepresentation(v8);
    [v12 setImageData:v9];

    [(UIImage *)v8 scale];
    double v11 = v10;

    [v12 setScale:v11];
    [a1 setImageData:v12 forKey:v7];
  }
}

- (id)imageForKey:()AFUIDataStoring
{
  v1 = objc_msgSend(a1, "imageDataForKey:");
  id v2 = objc_alloc(MEMORY[0x263F827E8]);
  v3 = [v1 imageData];
  [v1 scale];
  v4 = objc_msgSend(v2, "initWithData:scale:", v3);

  return v4;
}

- (_AFUIDataStoringShim)afui_dataStoringShim
{
  id v2 = [_AFUIDataStoringShim alloc];
  v3 = [a1 propertyListRepresentation];
  v4 = [(_AFUIDataStoringShim *)v2 initWithPropertyListRepresentation:v3];

  return v4;
}

@end