@interface IMBalloonPlugin(CKAppMenuItem)
- (id)__ck_imageForTraitCollection:()CKAppMenuItem;
@end

@implementation IMBalloonPlugin(CKAppMenuItem)

- (id)__ck_imageForTraitCollection:()CKAppMenuItem
{
  id v4 = a3;
  v5 = [a1 identifier];
  v6 = +[CKAppMenuDataSource imageForIdentifier:v5 traitCollection:v4];

  return v6;
}

@end