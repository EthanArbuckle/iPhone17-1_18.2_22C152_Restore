@interface HUCameraErrorContent
+ (id)errorWithTitle:(id)a3 description:(id)a4;
- (NSString)descriptionText;
- (NSString)titleText;
- (void)setDescriptionText:(id)a3;
- (void)setTitleText:(id)a3;
@end

@implementation HUCameraErrorContent

- (NSString)titleText
{
  return self->_titleText;
}

- (NSString)descriptionText
{
  return self->_descriptionText;
}

+ (id)errorWithTitle:(id)a3 description:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(HUCameraErrorContent);
  [(HUCameraErrorContent *)v7 setTitleText:v6];

  [(HUCameraErrorContent *)v7 setDescriptionText:v5];

  return v7;
}

- (void)setTitleText:(id)a3
{
}

- (void)setDescriptionText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionText, 0);

  objc_storeStrong((id *)&self->_titleText, 0);
}

@end