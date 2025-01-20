@interface BCMessageInfo
- (BCMessageInfo)initWithDictionary:(id)a3;
- (BCMessageInfo)initWithDictionary:(id)a3 imageDictionary:(id)a4;
- (BCMessageInfo)initWithTitle:(id)a3 subtitle:(id)a4 style:(id)a5 alternateTitle:(id)a6 imageIdentifier:(id)a7 imageDescription:(id)a8;
- (NSDictionary)dictionaryValue;
- (NSString)alternateTitle;
- (NSString)debugDescription;
- (NSString)imageDescription;
- (NSString)imageIdentifier;
- (NSString)style;
- (NSString)subtitle;
- (NSString)title;
- (UIImage)image;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)setAlternateTitle:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageDescription:(id)a3;
- (void)setImageIdentifier:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation BCMessageInfo

- (BCMessageInfo)initWithTitle:(id)a3 subtitle:(id)a4 style:(id)a5 alternateTitle:(id)a6 imageIdentifier:(id)a7 imageDescription:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v22.receiver = self;
  v22.super_class = (Class)BCMessageInfo;
  v19 = [(BCMessageInfo *)&v22 init];
  v20 = v19;
  if (v19)
  {
    [(BCMessageInfo *)v19 setTitle:v14];
    [(BCMessageInfo *)v20 setSubtitle:v15];
    v20->__style = (NSString *)a5;
    [(BCMessageInfo *)v20 setImageIdentifier:v17];
    [(BCMessageInfo *)v20 setImageDescription:v18];
    [(BCMessageInfo *)v20 setAlternateTitle:v16];
  }

  return v20;
}

- (BCMessageInfo)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"title"];
  v6 = [MEMORY[0x263EFF9D0] null];
  if (v5 == v6)
  {
    v7 = 0;
  }
  else
  {
    v7 = [v4 objectForKeyedSubscript:@"title"];
  }

  v8 = [v4 objectForKeyedSubscript:@"subtitle"];
  v9 = [MEMORY[0x263EFF9D0] null];
  if (v8 == v9)
  {
    v10 = 0;
  }
  else
  {
    v10 = [v4 objectForKeyedSubscript:@"subtitle"];
  }

  v11 = [v4 objectForKeyedSubscript:@"style"];
  v12 = [MEMORY[0x263EFF9D0] null];
  if (v11 == v12)
  {
    v13 = 0;
  }
  else
  {
    v13 = [v4 objectForKeyedSubscript:@"style"];
  }

  id v14 = [v4 objectForKeyedSubscript:@"alternateTitle"];
  id v15 = [MEMORY[0x263EFF9D0] null];
  if (v14 == v15)
  {
    id v16 = 0;
  }
  else
  {
    id v16 = [v4 objectForKeyedSubscript:@"alternateTitle"];
  }

  id v17 = [v4 objectForKeyedSubscript:@"imageIdentifier"];
  id v18 = [MEMORY[0x263EFF9D0] null];
  if (v17 == v18)
  {
    v19 = 0;
  }
  else
  {
    v19 = [v4 objectForKeyedSubscript:@"imageIdentifier"];
  }

  v20 = [v4 objectForKeyedSubscript:@"imageDescription"];
  v21 = [MEMORY[0x263EFF9D0] null];
  if (v20 == v21)
  {
    objc_super v22 = 0;
  }
  else
  {
    objc_super v22 = [v4 objectForKeyedSubscript:@"imageDescription"];
  }

  v23 = @"small";
  if (([v13 isEqualToString:@"small"] & 1) == 0)
  {
    v23 = @"large";
    if (![v13 isEqualToString:@"large"]) {
      v23 = @"icon";
    }
  }
  if (v7)
  {
    self = [(BCMessageInfo *)self initWithTitle:v7 subtitle:v10 style:v23 alternateTitle:v16 imageIdentifier:v19 imageDescription:v22];
    v24 = self;
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (BCMessageInfo)initWithDictionary:(id)a3 imageDictionary:(id)a4
{
  id v6 = a4;
  v7 = [(BCMessageInfo *)self initWithDictionary:a3];
  v8 = v7;
  if (v7)
  {
    v9 = [(BCMessageInfo *)v7 imageIdentifier];

    if (v9)
    {
      v10 = [(BCMessageInfo *)v8 imageIdentifier];
      v11 = [v6 objectForKeyedSubscript:v10];

      v12 = [v11 image];
      [(BCMessageInfo *)v8 setImage:v12];

      v13 = [v11 imageDescription];
      [(BCMessageInfo *)v8 setImageDescription:v13];
    }
  }

  return v8;
}

- (NSDictionary)dictionaryValue
{
  v3 = objc_opt_new();
  [v3 setObject:self->_title forKeyedSubscript:@"title"];
  [v3 setObject:self->_subtitle forKeyedSubscript:@"subtitle"];
  [v3 setObject:self->__style forKeyedSubscript:@"style"];
  [v3 setObject:self->_imageIdentifier forKeyedSubscript:@"imageIdentifier"];
  [v3 setObject:self->_imageDescription forKeyedSubscript:@"imageDescription"];
  [v3 setObject:self->_alternateTitle forKeyedSubscript:@"alternateTitle"];
  id v4 = (void *)[v3 copy];

  return (NSDictionary *)v4;
}

- (NSString)style
{
  return self->__style;
}

- (NSString)debugDescription
{
  return (NSString *)[(BCMessageInfo *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(BCMessageInfo *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = [(BCMessageInfo *)self title];
  id v5 = (id)[v3 appendObject:v4 withName:@"title"];

  id v6 = [(BCMessageInfo *)self subtitle];
  id v7 = (id)[v3 appendObject:v6 withName:@"subtitle" skipIfNil:1];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(BCMessageInfo *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [(BCMessageInfo *)self succinctDescriptionBuilder];
  id v5 = [(BCMessageInfo *)self alternateTitle];
  id v6 = (id)[v4 appendObject:v5 withName:@"alternateTitle" skipIfNil:1];

  id v7 = [(BCMessageInfo *)self imageIdentifier];
  id v8 = (id)[v4 appendObject:v7 withName:@"imageIdentifier" skipIfNil:1];

  v9 = [(BCMessageInfo *)self imageDescription];
  id v10 = (id)[v4 appendObject:v9 withName:@"imageDescription" skipIfNil:1];

  v11 = [(BCMessageInfo *)self style];
  id v12 = (id)[v4 appendObject:v11 withName:@"style"];

  return v4;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)alternateTitle
{
  return self->_alternateTitle;
}

- (void)setAlternateTitle:(id)a3
{
}

- (NSString)imageIdentifier
{
  return self->_imageIdentifier;
}

- (void)setImageIdentifier:(id)a3
{
}

- (NSString)imageDescription
{
  return self->_imageDescription;
}

- (void)setImageDescription:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_imageDescription, 0);
  objc_storeStrong((id *)&self->_imageIdentifier, 0);
  objc_storeStrong((id *)&self->_alternateTitle, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end