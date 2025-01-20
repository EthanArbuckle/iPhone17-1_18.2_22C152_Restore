@interface UIView(CKPopover)
- (void)ck_setBoundsHeight:()CKPopover;
- (void)ck_setBoundsWidth:()CKPopover;
- (void)ck_setPositionX:()CKPopover;
- (void)ck_setPositionY:()CKPopover;
- (void)ck_setScaleX:()CKPopover;
- (void)ck_setScaleY:()CKPopover;
@end

@implementation UIView(CKPopover)

- (void)ck_setBoundsWidth:()CKPopover
{
  id v4 = [a1 layer];
  v3 = [NSNumber numberWithDouble:a2];
  [v4 setValue:v3 forKeyPath:@"bounds.size.width"];
}

- (void)ck_setBoundsHeight:()CKPopover
{
  id v4 = [a1 layer];
  v3 = [NSNumber numberWithDouble:a2];
  [v4 setValue:v3 forKeyPath:@"bounds.size.height"];
}

- (void)ck_setPositionX:()CKPopover
{
  id v4 = [a1 layer];
  v3 = [NSNumber numberWithDouble:a2];
  [v4 setValue:v3 forKeyPath:@"position.x"];
}

- (void)ck_setPositionY:()CKPopover
{
  id v4 = [a1 layer];
  v3 = [NSNumber numberWithDouble:a2];
  [v4 setValue:v3 forKeyPath:@"position.y"];
}

- (void)ck_setScaleX:()CKPopover
{
  id v4 = [a1 layer];
  v3 = [NSNumber numberWithDouble:a2];
  [v4 setValue:v3 forKeyPath:@"transform.scale.x"];
}

- (void)ck_setScaleY:()CKPopover
{
  id v4 = [a1 layer];
  v3 = [NSNumber numberWithDouble:a2];
  [v4 setValue:v3 forKeyPath:@"transform.scale.y"];
}

@end