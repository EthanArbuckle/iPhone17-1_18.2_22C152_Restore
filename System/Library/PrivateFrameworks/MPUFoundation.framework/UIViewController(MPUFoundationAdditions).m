@interface UIViewController(MPUFoundationAdditions)
- (id)MPU_identifier;
- (void)MPU_setIdentifier:()MPUFoundationAdditions;
@end

@implementation UIViewController(MPUFoundationAdditions)

- (id)MPU_identifier
{
  return objc_getAssociatedObject(a1, @"_MPUViewControllerAdditionsIdentifierKey");
}

- (void)MPU_setIdentifier:()MPUFoundationAdditions
{
}

@end