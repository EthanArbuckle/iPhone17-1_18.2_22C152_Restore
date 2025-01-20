@interface WKFormColorControl
- (WKFormColorControl)initWithView:(id)a3;
- (void)selectColor:(id)a3;
@end

@implementation WKFormColorControl

- (WKFormColorControl)initWithView:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WKFormColorControl;
  CFTypeRef cf = [[WKColorPicker alloc] initWithView:a3];
  v4 = [(WKFormPeripheralBase *)&v7 initWithView:a3 control:&cf];
  CFTypeRef v5 = cf;
  CFTypeRef cf = 0;
  if (v5) {
    CFRelease(v5);
  }
  return v4;
}

- (void)selectColor:(id)a3
{
  [(WKFormPeripheralBase *)self control];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CFTypeRef v5 = [(WKFormPeripheralBase *)self control];
    [(WKFormControl *)v5 selectColor:a3];
  }
}

@end