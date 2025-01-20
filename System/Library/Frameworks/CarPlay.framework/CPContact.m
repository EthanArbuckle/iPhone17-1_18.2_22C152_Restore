@interface CPContact
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CPContact)initWithCoder:(id)a3;
- (CPContact)initWithName:(NSString *)name image:(UIImage *)image;
- (CPContactEntity)contactEntity;
- (CPTemplate)associatedTemplate;
- (NSArray)actions;
- (NSString)informativeText;
- (NSString)name;
- (NSString)subtitle;
- (UIImage)image;
- (void)_associateControlsToTemplate:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setActions:(NSArray *)actions;
- (void)setAssociatedTemplate:(id)a3;
- (void)setContactEntity:(id)a3;
- (void)setImage:(UIImage *)image;
- (void)setInformativeText:(NSString *)informativeText;
- (void)setName:(NSString *)name;
- (void)setSubtitle:(NSString *)subtitle;
@end

@implementation CPContact

- (CPContact)initWithName:(NSString *)name image:(UIImage *)image
{
  v6 = name;
  v7 = image;
  v13.receiver = self;
  v13.super_class = (Class)CPContact;
  v8 = [(CPContact *)&v13 init];
  if (v8)
  {
    v9 = [[CPImageSet alloc] initWithImage:v7];
    v10 = [[CPContactEntity alloc] initWithName:v6 imageSet:v9];
    contactEntity = v8->_contactEntity;
    v8->_contactEntity = v10;
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPContact)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPContact;
  v5 = [(CPContact *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCPContactEntity"];
    contactEntity = v5->_contactEntity;
    v5->_contactEntity = (CPContactEntity *)v6;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CPContact *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(CPContact *)self contactEntity];
      uint64_t v6 = [(CPContact *)v4 contactEntity];
      char v7 = [v5 isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(CPContact *)self contactEntity];
  [v4 encodeObject:v5 forKey:@"kCPContactEntity"];
}

- (void)setName:(NSString *)name
{
  objc_super v9 = name;
  id v4 = [(CPContact *)self contactEntity];
  id v5 = [v4 name];
  char v6 = [v5 isEqual:v9];

  if ((v6 & 1) == 0)
  {
    char v7 = [(CPContact *)self contactEntity];
    [v7 setName:v9];

    v8 = [(CPContact *)self associatedTemplate];
    [v8 setNeedsUpdate];
  }
}

- (NSString)name
{
  v2 = [(CPContact *)self contactEntity];
  v3 = [v2 name];

  return (NSString *)v3;
}

- (void)setImage:(UIImage *)image
{
  id v4 = image;
  char v7 = [[CPImageSet alloc] initWithImage:v4];

  id v5 = [(CPContact *)self contactEntity];
  [v5 setImageSet:v7];

  char v6 = [(CPContact *)self associatedTemplate];
  [v6 setNeedsUpdate];
}

- (UIImage)image
{
  v2 = [(CPContact *)self contactEntity];
  v3 = [v2 imageSet];
  id v4 = [v3 image];

  return (UIImage *)v4;
}

- (void)setActions:(NSArray *)actions
{
  id v4 = actions;
  id v5 = [(CPContact *)self associatedTemplate];
  [(CPContact *)self _associateControlsToTemplate:v5];

  char v6 = [(CPContact *)self contactEntity];
  [v6 setActionButtons:v4];

  id v7 = [(CPContact *)self associatedTemplate];
  [v7 setNeedsUpdate];
}

- (NSArray)actions
{
  v2 = [(CPContact *)self contactEntity];
  v3 = [v2 actionButtons];

  return (NSArray *)v3;
}

- (void)setSubtitle:(NSString *)subtitle
{
  objc_super v9 = subtitle;
  id v4 = [(CPContact *)self contactEntity];
  id v5 = [v4 subtitle];
  char v6 = [v5 isEqual:v9];

  if ((v6 & 1) == 0)
  {
    id v7 = [(CPContact *)self contactEntity];
    [v7 setSubtitle:v9];

    v8 = [(CPContact *)self associatedTemplate];
    [v8 setNeedsUpdate];
  }
}

- (NSString)subtitle
{
  v2 = [(CPContact *)self contactEntity];
  v3 = [v2 subtitle];

  return (NSString *)v3;
}

- (void)setInformativeText:(NSString *)informativeText
{
  objc_super v9 = informativeText;
  id v4 = [(CPContact *)self contactEntity];
  id v5 = [v4 informativeText];
  char v6 = [v5 isEqual:v9];

  if ((v6 & 1) == 0)
  {
    id v7 = [(CPContact *)self contactEntity];
    [v7 setInformativeText:v9];

    v8 = [(CPContact *)self associatedTemplate];
    [v8 setNeedsUpdate];
  }
}

- (NSString)informativeText
{
  v2 = [(CPContact *)self contactEntity];
  v3 = [v2 informativeText];

  return (NSString *)v3;
}

- (void)setAssociatedTemplate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_associatedTemplate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_associatedTemplate, obj);
    [(CPContact *)self _associateControlsToTemplate:obj];
  }
}

- (void)_associateControlsToTemplate:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(CPContact *)self actions];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        [v10 setAssociatedTemplate:v4];
        [v10 setDelegate:v4];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (CPContactEntity)contactEntity
{
  return self->_contactEntity;
}

- (void)setContactEntity:(id)a3
{
}

- (CPTemplate)associatedTemplate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_associatedTemplate);

  return (CPTemplate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_associatedTemplate);

  objc_storeStrong((id *)&self->_contactEntity, 0);
}

@end