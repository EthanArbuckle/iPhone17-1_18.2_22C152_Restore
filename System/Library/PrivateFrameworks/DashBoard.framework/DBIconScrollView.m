@interface DBIconScrollView
- (BOOL)touchesShouldCancelInContentView:(id)a3;
@end

@implementation DBIconScrollView

- (BOOL)touchesShouldCancelInContentView:(id)a3
{
  return 1;
}

@end