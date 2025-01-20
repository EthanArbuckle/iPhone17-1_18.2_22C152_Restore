@interface CIFeature
- (CGRect)bounds;
- (CIFeature)init;
- (NSString)type;
- (id)debugDescription;
@end

@implementation CIFeature

- (CIFeature)init
{
  v5.receiver = self;
  v5.super_class = (Class)CIFeature;
  v2 = [(CIFeature *)&v5 init];
  uint64_t v3 = objc_opt_class();
  if (v3 == objc_opt_class())
  {

    return 0;
  }
  return v2;
}

- (NSString)type
{
  return 0;
}

- (CGRect)bounds
{
  double v2 = *MEMORY[0x1E4F1DB20];
  double v3 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (id)debugDescription
{
  [(CIFeature *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  uint64_t v11 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
  v17.origin.x = v4;
  v17.origin.y = v6;
  v17.size.width = v8;
  v17.size.height = v10;
  if (CGRectIsInfinite(v17)) {
    return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%s: %p [infinite]>\n", v11, self, v13, v14, v15, v16);
  }
  v18.origin.x = v4;
  v18.origin.y = v6;
  v18.size.width = v8;
  v18.size.height = v10;
  if (CGRectIsEmpty(v18)) {
    return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%s: %p [empty]>\n", v11, self, v13, v14, v15, v16);
  }
  else {
    return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%s: %p [%g %g %g %g]>\n", v11, self, *(void *)&v4, *(void *)&v6, *(void *)&v8, *(void *)&v10);
  }
}

@end