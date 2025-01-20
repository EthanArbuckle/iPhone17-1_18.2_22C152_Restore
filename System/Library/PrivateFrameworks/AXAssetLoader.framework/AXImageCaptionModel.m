@interface AXImageCaptionModel
- (AXImageCaptionModel)initWithModelProperties:(id)a3;
- (NSString)language;
- (NSString)stage;
- (NSString)version;
- (id)description;
@end

@implementation AXImageCaptionModel

- (AXImageCaptionModel)initWithModelProperties:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AXImageCaptionModel;
  v6 = [(AXImageCaptionModel *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_modelProperties, a3);
  }

  return v7;
}

- (id)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)AXImageCaptionModel;
  v4 = [(AXImageCaptionModel *)&v9 description];
  id v5 = [(AXImageCaptionModel *)self version];
  v6 = [(AXImageCaptionModel *)self stage];
  v7 = [v3 stringWithFormat:@"%@ [v%@ - %@]", v4, v5, v6];

  return v7;
}

- (NSString)version
{
  return (NSString *)[(NSDictionary *)self->_modelProperties objectForKey:@"Version"];
}

- (NSString)language
{
  return (NSString *)[(NSDictionary *)self->_modelProperties objectForKey:@"Language"];
}

- (NSString)stage
{
  return (NSString *)[(NSDictionary *)self->_modelProperties objectForKey:@"Stage"];
}

- (void).cxx_destruct
{
}

@end