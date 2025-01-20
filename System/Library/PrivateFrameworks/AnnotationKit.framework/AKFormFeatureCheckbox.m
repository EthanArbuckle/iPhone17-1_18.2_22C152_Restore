@interface AKFormFeatureCheckbox
+ (id)checkboxWithRect:(CGRect)a3 onPage:(id)a4;
@end

@implementation AKFormFeatureCheckbox

+ (id)checkboxWithRect:(CGRect)a3 onPage:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v10 = objc_msgSend(objc_alloc((Class)a1), "initWithRect:onPage:", v9, x, y, width, height);

  return v10;
}

@end