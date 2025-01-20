@interface UIBezierPath(AXAdditions)
+ (id)accessibilityBezierPathWithSCNVector3Points:()AXAdditions;
@end

@implementation UIBezierPath(AXAdditions)

+ (id)accessibilityBezierPathWithSCNVector3Points:()AXAdditions
{
  id v4 = a3;
  v5 = [a1 bezierPath];
  if ([v4 count])
  {
    v6 = [v4 firstObject];
    [v6 SCNVector3Value];
    double v8 = v7;
    v9 = [v4 firstObject];
    [v9 SCNVector3Value];
    objc_msgSend(v5, "moveToPoint:", v8, v10);

    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __73__UIBezierPath_AXAdditions__accessibilityBezierPathWithSCNVector3Points___block_invoke;
    v13[3] = &unk_26514BE78;
    id v11 = v5;
    id v14 = v11;
    [v4 enumerateObjectsUsingBlock:v13];
    [v11 closePath];
  }

  return v5;
}

@end