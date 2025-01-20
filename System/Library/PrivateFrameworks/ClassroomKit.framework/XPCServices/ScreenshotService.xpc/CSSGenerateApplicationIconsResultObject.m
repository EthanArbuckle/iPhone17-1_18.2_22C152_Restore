@interface CSSGenerateApplicationIconsResultObject
- (CSSGenerateApplicationIconsResultObject)init;
- (CSSGenerateApplicationIconsResultObject)initWithIconData:(id)a3 badgeIconData:(id)a4;
- (NSData)badgeIconData;
- (NSData)iconData;
@end

@implementation CSSGenerateApplicationIconsResultObject

- (CSSGenerateApplicationIconsResultObject)init
{
  return [(CSSGenerateApplicationIconsResultObject *)self initWithIconData:0 badgeIconData:0];
}

- (CSSGenerateApplicationIconsResultObject)initWithIconData:(id)a3 badgeIconData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CSSGenerateApplicationIconsResultObject;
  v8 = [(CSSGenerateApplicationIconsResultObject *)&v14 init];
  if (v8)
  {
    v9 = (NSData *)[v6 copy];
    iconData = v8->_iconData;
    v8->_iconData = v9;

    v11 = (NSData *)[v7 copy];
    badgeIconData = v8->_badgeIconData;
    v8->_badgeIconData = v11;
  }
  return v8;
}

- (NSData)iconData
{
  return self->_iconData;
}

- (NSData)badgeIconData
{
  return self->_badgeIconData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeIconData, 0);

  objc_storeStrong((id *)&self->_iconData, 0);
}

@end