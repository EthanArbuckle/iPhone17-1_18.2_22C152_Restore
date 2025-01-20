@interface WKPDFConfiguration
+ (BOOL)accessInstanceVariablesDirectly;
- (BOOL)allowTransparentBackground;
- (CGRect)rect;
- (WKPDFConfiguration)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAllowTransparentBackground:(BOOL)allowTransparentBackground;
- (void)setRect:(CGRect)rect;
@end

@implementation WKPDFConfiguration

+ (BOOL)accessInstanceVariablesDirectly
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  char v3 = WTF::linkedOnOrAfterSDKWithBehavior();
  if ((v3 & 1) == 0 && (+[WKPDFConfiguration accessInstanceVariablesDirectly]::didLogFault & 1) == 0)
  {
    +[WKPDFConfiguration accessInstanceVariablesDirectly]::didLogFault = 1;
    v4 = qword_1EB357B50;
    if (os_log_type_enabled((os_log_t)qword_1EB357B50, OS_LOG_TYPE_FAULT))
    {
      int v6 = 136446210;
      Name = class_getName((Class)a1);
      _os_log_fault_impl(&dword_1985F2000, v4, OS_LOG_TYPE_FAULT, "Do not access private instance variables of %{public}s via key-value coding. This will raise an exception when linking against newer SDKs.", (uint8_t *)&v6, 0xCu);
    }
  }
  return v3 ^ 1;
}

- (WKPDFConfiguration)init
{
  v5.receiver = self;
  v5.super_class = (Class)WKPDFConfiguration;
  v2 = [(WKPDFConfiguration *)&v5 init];
  char v3 = v2;
  if (v2)
  {
    -[WKPDFConfiguration setRect:](v2, "setRect:", *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
    [(WKPDFConfiguration *)v3 setAllowTransparentBackground:0];
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [(WKPDFConfiguration *)self rect];
  objc_msgSend(v4, "setRect:");
  objc_msgSend(v4, "setAllowTransparentBackground:", -[WKPDFConfiguration allowTransparentBackground](self, "allowTransparentBackground"));
  return v4;
}

- (CGRect)rect
{
  double x = self->_rect.origin.x;
  double y = self->_rect.origin.y;
  double width = self->_rect.size.width;
  double height = self->_rect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setRect:(CGRect)rect
{
  self->_rect = rect;
}

- (BOOL)allowTransparentBackground
{
  return self->_allowTransparentBackground;
}

- (void)setAllowTransparentBackground:(BOOL)allowTransparentBackground
{
  self->_allowTransparentBackground = allowTransparentBackground;
}

@end