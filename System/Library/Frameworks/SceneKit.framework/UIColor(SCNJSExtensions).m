@interface UIColor(SCNJSExtensions)
+ (uint64_t)color:()SCNJSExtensions :::;
- (double)a;
- (double)b;
- (double)g;
- (double)r;
@end

@implementation UIColor(SCNJSExtensions)

+ (uint64_t)color:()SCNJSExtensions :::
{
  return objc_msgSend(MEMORY[0x263F1C550], "colorWithRed:green:blue:alpha:");
}

- (double)r
{
  return COERCE_FLOAT(objc_msgSend(a1, "scn_C3DColorIgnoringColorSpace:success:", 0, 0));
}

- (double)g
{
  return COERCE_FLOAT((unint64_t)objc_msgSend(a1, "scn_C3DColorIgnoringColorSpace:success:", 0, 0) >> 32);
}

- (double)b
{
  objc_msgSend(a1, "scn_C3DColorIgnoringColorSpace:success:", 0, 0);
  return v1;
}

- (double)a
{
  objc_msgSend(a1, "scn_C3DColorIgnoringColorSpace:success:", 0, 0);
  return v1;
}

@end