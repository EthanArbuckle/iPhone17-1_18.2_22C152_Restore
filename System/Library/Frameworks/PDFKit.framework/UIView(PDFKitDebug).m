@interface UIView(PDFKitDebug)
- (id)_dumpLayer;
- (id)_encodedLayerTree;
@end

@implementation UIView(PDFKitDebug)

- (id)_encodedLayerTree
{
  v1 = [a1 layer];
  v2 = v1;
  if (v1) {
    v1 = (void *)CAEncodeLayerTree();
  }
  id v3 = v1;

  return v3;
}

- (id)_dumpLayer
{
  v2 = [a1 _encodedLayerTree];
  if (v2)
  {
    id v3 = [MEMORY[0x263F08AB0] processInfo];
    v4 = NSTemporaryDirectory();
    v5 = NSString;
    v6 = [v3 processName];
    uint64_t v7 = [v3 processIdentifier];
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    [v3 systemUptime];
    v11 = [v5 stringWithFormat:@"%@-%d-%@-%p-layer-%ld.caar", v6, v7, v9, a1, (unint64_t)(v10 * 100000.0)];
    v12 = [v4 stringByAppendingPathComponent:v11];

    [v2 writeToFile:v12 atomically:1];
    NSLog(&cfstr_ViewLayerTreeD.isa, v12);
  }
  else
  {
    NSLog(&cfstr_NoLayerTreeToD.isa);
    v12 = 0;
  }

  return v12;
}

@end