@interface GKMultiCircleImageBrush
- (CGSize)sizeForInput:(id)a3;
- (void)drawInRect:(CGRect)a3 withContext:(CGContext *)a4 input:(id)a5;
@end

@implementation GKMultiCircleImageBrush

- (CGSize)sizeForInput:(id)a3
{
  v3 = objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice", a3);
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4 != 1 || ((double v5 = 57.0, *MEMORY[0x263F402F8]) ? (v6 = _GKIsRemoteUIUsingPadIdiom == 0) : (v6 = 0), v6)) {
    double v5 = 42.0;
  }
  double v7 = v5;
  result.height = v7;
  result.width = v5;
  return result;
}

- (void)drawInRect:(CGRect)a3 withContext:(CGContext *)a4 input:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v19 = a5;
  if ((unint64_t)[v19 count] < 2)
  {
    v14 = [v19 firstObject];
    objc_msgSend(v14, "drawInRect:", x, y, width, height);
  }
  else
  {
    v10 = [MEMORY[0x263F1C5C0] currentDevice];
    uint64_t v11 = [v10 userInterfaceIdiom];

    if (v11 != 1 || (*MEMORY[0x263F402F8] ? (BOOL v12 = _GKIsRemoteUIUsingPadIdiom == 0) : (BOOL v12 = 0), v12)) {
      double v13 = 26.0;
    }
    else {
      double v13 = 40.0;
    }
    v15 = [v19 objectAtIndex:0];
    objc_msgSend(v15, "drawInRect:", x, y, v13, v13);

    CGContextSaveGState(a4);
    v16 = (void *)MEMORY[0x263F1C478];
    v21.origin.double x = x + 16.0;
    v21.origin.double y = y + 16.0;
    v21.size.double width = v13;
    v21.size.double height = v13;
    CGRect v22 = CGRectInset(v21, -2.0, -2.0);
    v14 = objc_msgSend(v16, "bezierPathWithOvalInRect:", v22.origin.x, v22.origin.y, v22.size.width, v22.size.height);
    [v14 setLineWidth:2.0];
    v17 = [MEMORY[0x263F1C550] blackColor];
    [v17 set];

    CGContextSetBlendMode(a4, kCGBlendModeClear);
    [v14 fill];
    CGContextRestoreGState(a4);
    v18 = [v19 objectAtIndex:1];
    objc_msgSend(v18, "drawInRect:", x + 16.0, y + 16.0, v13, v13);
  }
}

@end