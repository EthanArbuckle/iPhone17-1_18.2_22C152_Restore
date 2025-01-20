@interface INObjectSection
+ (BOOL)supportsSecureCoding;
- (INImage)image;
- (INObjectSection)initWithCoder:(id)a3;
- (INObjectSection)initWithIdentifier:(id)a3 title:(id)a4 subtitle:(id)a5 image:(id)a6 items:(id)a7;
- (INObjectSection)initWithTitle:(NSString *)title items:(NSArray *)items;
- (INObjectSection)initWithTitle:(id)a3 subtitle:(id)a4 image:(id)a5 items:(id)a6;
- (NSArray)items;
- (NSString)_identifier;
- (NSString)subtitle;
- (NSString)title;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INObjectSection

- (NSArray)items
{
  return self->_items;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (INImage)image
{
  return self->_image;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (INObjectSection)initWithTitle:(id)a3 subtitle:(id)a4 image:(id)a5 items:(id)a6
{
  if (a3)
  {
    id v11 = a6;
    id v12 = a5;
    id v13 = a4;
    v14 = (void *)[a3 copy];
  }
  else
  {
    v15 = (void *)MEMORY[0x1E4F29128];
    id v16 = a6;
    id v17 = a5;
    id v18 = a4;
    v19 = [v15 UUID];
    v20 = [v19 UUIDString];
    v14 = (void *)[v20 copy];
  }
  v21 = [(INObjectSection *)self initWithIdentifier:v14 title:a3 subtitle:a4 image:a5 items:a6];

  return v21;
}

- (INObjectSection)initWithTitle:(NSString *)title items:(NSArray *)items
{
  if (title)
  {
    v7 = items;
    v8 = (void *)[(NSString *)title copy];
  }
  else
  {
    v9 = (void *)MEMORY[0x1E4F29128];
    v10 = items;
    id v11 = [v9 UUID];
    id v12 = [v11 UUIDString];
    v8 = (void *)[v12 copy];
  }
  id v13 = [(INObjectSection *)self initWithIdentifier:v8 title:title subtitle:0 image:0 items:items];

  return v13;
}

- (INObjectSection)initWithIdentifier:(id)a3 title:(id)a4 subtitle:(id)a5 image:(id)a6 items:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)INObjectSection;
  id v17 = [(INObjectSection *)&v29 init];
  if (v17)
  {
    uint64_t v18 = [v13 copy];
    title = v17->_title;
    v17->_title = (NSString *)v18;

    uint64_t v20 = [v16 copy];
    items = v17->_items;
    v17->_items = (NSArray *)v20;

    uint64_t v22 = [v14 copy];
    subtitle = v17->_subtitle;
    v17->_subtitle = (NSString *)v22;

    uint64_t v24 = [v15 copy];
    image = v17->_image;
    v17->_image = (INImage *)v24;

    uint64_t v26 = [v12 copy];
    identifier = v17->_identifier;
    v17->_identifier = (NSString *)v26;
  }
  return v17;
}

- (NSString)_identifier
{
  return self->_identifier;
}

- (void)encodeWithCoder:(id)a3
{
  title = self->_title;
  id v5 = a3;
  [v5 encodeObject:title forKey:@"title"];
  [v5 encodeObject:self->_subtitle forKey:@"subtitle"];
  [v5 encodeObject:self->_image forKey:@"image"];
  [v5 encodeObject:self->_items forKey:@"items"];
  [v5 encodeObject:self->_identifier forKey:@"_identifier"];
}

- (INObjectSection)initWithCoder:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"title"];

  v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  id v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  id v12 = [v5 decodeObjectOfClasses:v11 forKey:@"subtitle"];

  id v13 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"image"];
  id v14 = +[INSchema _supportedClasses];
  uint64_t v24 = objc_opt_class();
  uint64_t v25 = objc_opt_class();
  uint64_t v26 = objc_opt_class();
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:3];
  id v16 = [v14 setByAddingObjectsFromArray:v15];
  id v17 = [v5 decodeObjectOfClasses:v16 forKey:@"items"];

  uint64_t v18 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v19 = objc_opt_class();
  uint64_t v20 = objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0, v24, v25);
  v21 = [v5 decodeObjectOfClasses:v20 forKey:@"_identifier"];

  if (v17)
  {
    self = [(INObjectSection *)self initWithIdentifier:v21 title:v8 subtitle:v12 image:v13 items:v17];
    uint64_t v22 = self;
  }
  else
  {
    uint64_t v22 = 0;
  }

  return v22;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end