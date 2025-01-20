@interface LNDynamicOptionsSection
+ (BOOL)supportsSecureCoding;
- (LNDeferredLocalizedString)subtitle;
- (LNDeferredLocalizedString)title;
- (LNDynamicOptionsSection)initWithCoder:(id)a3;
- (LNDynamicOptionsSection)initWithOptions:(id)a3 title:(id)a4;
- (LNDynamicOptionsSection)initWithOptions:(id)a3 title:(id)a4 subtitle:(id)a5 image:(id)a6;
- (LNImage)image;
- (NSArray)options;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNDynamicOptionsSection

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LNDynamicOptionsSection *)self options];
  [v4 encodeObject:v5 forKey:@"options"];

  v6 = [(LNDynamicOptionsSection *)self title];
  [v4 encodeObject:v6 forKey:@"title"];

  v7 = [(LNDynamicOptionsSection *)self subtitle];
  [v4 encodeObject:v7 forKey:@"subtitle"];

  id v8 = [(LNDynamicOptionsSection *)self image];
  [v4 encodeObject:v8 forKey:@"image"];
}

- (NSArray)options
{
  return self->_options;
}

- (LNDeferredLocalizedString)title
{
  return self->_title;
}

- (LNDeferredLocalizedString)subtitle
{
  return self->_subtitle;
}

- (LNImage)image
{
  return self->_image;
}

- (LNDynamicOptionsSection)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  id v8 = [v5 decodeObjectOfClasses:v7 forKey:@"options"];

  v9 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
  v10 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"subtitle"];
  v11 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"image"];

  v12 = [(LNDynamicOptionsSection *)self initWithOptions:v8 title:v9 subtitle:v10 image:v11];
  return v12;
}

- (LNDynamicOptionsSection)initWithOptions:(id)a3 title:(id)a4 subtitle:(id)a5 image:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v11)
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"LNDynamicOptionsResult.m", 103, @"Invalid parameter not satisfying: %@", @"options" object file lineNumber description];
  }
  v27.receiver = self;
  v27.super_class = (Class)LNDynamicOptionsSection;
  v15 = [(LNDynamicOptionsSection *)&v27 init];
  if (v15)
  {
    uint64_t v16 = [v11 copy];
    options = v15->_options;
    v15->_options = (NSArray *)v16;

    uint64_t v18 = [v12 copy];
    title = v15->_title;
    v15->_title = (LNDeferredLocalizedString *)v18;

    uint64_t v20 = [v13 copy];
    subtitle = v15->_subtitle;
    v15->_subtitle = (LNDeferredLocalizedString *)v20;

    uint64_t v22 = [v14 copy];
    image = v15->_image;
    v15->_image = (LNImage *)v22;

    v24 = v15;
  }

  return v15;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [(LNDynamicOptionsSection *)self title];
  v7 = [(LNDynamicOptionsSection *)self options];
  id v8 = [v3 stringWithFormat:@"<%@: %p titleKey=%@, optionsCount=%lu>", v5, self, v6, objc_msgSend(v7, "count")];

  return v8;
}

- (LNDynamicOptionsSection)initWithOptions:(id)a3 title:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"LNDynamicOptionsResult.m", 94, @"Invalid parameter not satisfying: %@", @"options" object file lineNumber description];
  }
  v9 = [(LNDynamicOptionsSection *)self initWithOptions:v7 title:v8 subtitle:0 image:0];

  return v9;
}

@end