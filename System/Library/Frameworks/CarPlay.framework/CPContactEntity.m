@interface CPContactEntity
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CPContactEntity)initWithCoder:(id)a3;
- (CPContactEntity)initWithName:(id)a3 imageSet:(id)a4;
- (CPImageSet)imageSet;
- (NSArray)actionButtons;
- (NSString)description;
- (NSString)informativeText;
- (NSString)name;
- (NSString)subtitle;
- (id)objectForIdentifier:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setActionButtons:(id)a3;
- (void)setImageSet:(id)a3;
- (void)setInformativeText:(id)a3;
- (void)setName:(id)a3;
- (void)setSubtitle:(id)a3;
@end

@implementation CPContactEntity

- (CPContactEntity)initWithName:(id)a3 imageSet:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CPContactEntity;
  v8 = [(CPEntity *)&v12 _init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    name = v8->_name;
    v8->_name = (NSString *)v9;

    objc_storeStrong((id *)&v8->_imageSet, a4);
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(CPContactEntity *)self name];
    id v7 = [v5 name];
    int v8 = [v6 isEqual:v7];

    if (!v8) {
      goto LABEL_7;
    }
    uint64_t v9 = [(CPContactEntity *)self name];
    v10 = [v5 name];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_7;
    }
    objc_super v12 = [(CPContactEntity *)self subtitle];
    v13 = [v5 subtitle];
    int v14 = [v12 isEqual:v13];

    if (!v14) {
      goto LABEL_7;
    }
    v15 = [(CPContactEntity *)self informativeText];
    v16 = [v5 informativeText];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_7;
    }
    v18 = [(CPContactEntity *)self imageSet];
    v19 = [v5 imageSet];

    if (v18 == v19)
    {
      v22 = [(CPContactEntity *)self actionButtons];
      v23 = [v5 actionButtons];
      char v20 = [v22 isEqualToArray:v23];
    }
    else
    {
LABEL_7:
      char v20 = 0;
    }
  }
  else
  {
    char v20 = 0;
  }

  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPContactEntity)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CPContactEntity;
  id v5 = [(CPEntity *)&v23 _init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CPContactEntityName"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CPContactEntitySubtitle"];
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CPContactEntityInformative"];
    informativeText = v5->_informativeText;
    v5->_informativeText = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CPContactEntityImageSet"];
    imageSet = v5->_imageSet;
    v5->_imageSet = (CPImageSet *)v12;

    int v14 = (void *)MEMORY[0x263EFFA08];
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    v19 = objc_msgSend(v14, "setWithObjects:", v15, v16, v17, v18, objc_opt_class(), 0);
    uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"CPContactEntityActionButtons"];
    actionButtons = v5->_actionButtons;
    v5->_actionButtons = (NSArray *)v20;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CPContactEntity;
  id v4 = a3;
  [(CPEntity *)&v10 encodeWithCoder:v4];
  id v5 = [(CPContactEntity *)self name];
  [v4 encodeObject:v5 forKey:@"CPContactEntityName"];

  uint64_t v6 = [(CPContactEntity *)self subtitle];
  [v4 encodeObject:v6 forKey:@"CPContactEntitySubtitle"];

  id v7 = [(CPContactEntity *)self informativeText];
  [v4 encodeObject:v7 forKey:@"CPContactEntityInformative"];

  uint64_t v8 = [(CPContactEntity *)self imageSet];
  [v4 encodeObject:v8 forKey:@"CPContactEntityImageSet"];

  uint64_t v9 = [(CPContactEntity *)self actionButtons];
  [v4 encodeObject:v9 forKey:@"CPContactEntityActionButtons"];
}

- (NSString)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CPContactEntity;
  id v4 = [(CPEntity *)&v8 description];
  id v5 = [(CPContactEntity *)self name];
  uint64_t v6 = [v3 stringWithFormat:@"%@: name: %@", v4, v5];

  return (NSString *)v6;
}

- (id)objectForIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(CPContactEntity *)self actionButtons];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        objc_super v10 = [v9 identifier];
        int v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (CPImageSet)imageSet
{
  return self->_imageSet;
}

- (void)setImageSet:(id)a3
{
}

- (NSArray)actionButtons
{
  return self->_actionButtons;
}

- (void)setActionButtons:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)informativeText
{
  return self->_informativeText;
}

- (void)setInformativeText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_informativeText, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_actionButtons, 0);
  objc_storeStrong((id *)&self->_imageSet, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end