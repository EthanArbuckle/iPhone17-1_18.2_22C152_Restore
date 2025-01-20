@interface CALayer(PDFKitDebugging)
- (id)PDFKitDumpToFile;
@end

@implementation CALayer(PDFKitDebugging)

- (id)PDFKitDumpToFile
{
  v2 = (void *)CAEncodeLayerTree();
  if (v2)
  {
    v3 = [MEMORY[0x263F08AB0] processInfo];
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
    NSLog(&cfstr_LayerTreeDumpe.isa, v12);
  }
  else
  {
    NSLog(&cfstr_NoLayerTreeToD.isa);
    v12 = 0;
  }

  return v12;
}

@end