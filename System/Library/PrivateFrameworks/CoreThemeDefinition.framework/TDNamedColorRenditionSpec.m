@interface TDNamedColorRenditionSpec
- (id)createCSIRepresentationWithCompression:(BOOL)a3 colorSpaceID:(unint64_t)a4 document:(id)a5;
- (void)setColorPropertiesFromCGColor:(CGColor *)a3;
@end

@implementation TDNamedColorRenditionSpec

- (void)setColorPropertiesFromCGColor:(CGColor *)a3
{
  if (TDColorSpaceGetExtendedRangeSRGB___once != -1) {
    dispatch_once(&TDColorSpaceGetExtendedRangeSRGB___once, &__block_literal_global_4);
  }
  CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace((CGColorSpaceRef)TDColorSpaceGetExtendedRangeSRGB_sExtendedRangeSRGBColorSpace, kCGRenderingIntentRelativeColorimetric, a3, 0);
  [(TDNamedColorRenditionSpec *)self willChangeValueForKey:@"colorSpaceID"];
  [(TDNamedColorRenditionSpec *)self setColorSpaceID:4];
  [(TDNamedColorRenditionSpec *)self didChangeValueForKey:@"colorSpaceID"];
  Components = CGColorGetComponents(CopyByMatchingToColorSpace);
  double v7 = 1.0;
  double v8 = 0.0;
  double v9 = 0.0;
  double v10 = 0.0;
  switch(CGColorGetNumberOfComponents(CopyByMatchingToColorSpace))
  {
    case 0uLL:
      break;
    case 1uLL:
      double v8 = *Components;
      goto LABEL_7;
    case 2uLL:
      double v8 = *Components;
      double v7 = Components[1];
LABEL_7:
      double v9 = v8;
      double v10 = v8;
      break;
    case 3uLL:
      double v8 = *Components;
      double v9 = Components[1];
      double v10 = Components[2];
      break;
    default:
      double v8 = *Components;
      double v9 = Components[1];
      double v10 = Components[2];
      double v7 = Components[3];
      break;
  }
  [(TDNamedColorRenditionSpec *)self willChangeValueForKey:@"red"];
  [(TDNamedColorRenditionSpec *)self willChangeValueForKey:@"green"];
  [(TDNamedColorRenditionSpec *)self willChangeValueForKey:@"blue"];
  [(TDNamedColorRenditionSpec *)self willChangeValueForKey:@"alpha"];
  [(TDNamedColorRenditionSpec *)self setRed:v8];
  [(TDNamedColorRenditionSpec *)self setGreen:v9];
  [(TDNamedColorRenditionSpec *)self setBlue:v10];
  [(TDNamedColorRenditionSpec *)self setAlpha:v7];
  [(TDNamedColorRenditionSpec *)self didChangeValueForKey:@"red"];
  [(TDNamedColorRenditionSpec *)self didChangeValueForKey:@"green"];
  [(TDNamedColorRenditionSpec *)self didChangeValueForKey:@"blue"];
  [(TDNamedColorRenditionSpec *)self didChangeValueForKey:@"alpha"];

  CGColorRelease(CopyByMatchingToColorSpace);
}

- (id)createCSIRepresentationWithCompression:(BOOL)a3 colorSpaceID:(unint64_t)a4 document:(id)a5
{
  v22[2] = *MEMORY[0x263EF8340];
  uint64_t v7 = objc_msgSend((id)objc_msgSend((id)-[TDNamedColorRenditionSpec production](self, "production", a3, a4), "name"), "name");
  if (([(TDNamedColorRenditionSpec *)self colorSpaceID] | 4) == 6)
  {
    double v8 = NSNumber;
    [(TDNamedColorRenditionSpec *)self red];
    v22[0] = objc_msgSend(v8, "numberWithDouble:");
    double v9 = NSNumber;
    [(TDNamedColorRenditionSpec *)self alpha];
    v22[1] = objc_msgSend(v9, "numberWithDouble:");
    double v10 = (void *)MEMORY[0x263EFF8C0];
    v11 = v22;
    uint64_t v12 = 2;
  }
  else
  {
    v13 = NSNumber;
    [(TDNamedColorRenditionSpec *)self red];
    v21[0] = objc_msgSend(v13, "numberWithDouble:");
    v14 = NSNumber;
    [(TDNamedColorRenditionSpec *)self green];
    v21[1] = objc_msgSend(v14, "numberWithDouble:");
    v15 = NSNumber;
    [(TDNamedColorRenditionSpec *)self blue];
    v21[2] = objc_msgSend(v15, "numberWithDouble:");
    v16 = NSNumber;
    [(TDNamedColorRenditionSpec *)self alpha];
    v21[3] = objc_msgSend(v16, "numberWithDouble:");
    double v10 = (void *)MEMORY[0x263EFF8C0];
    v11 = v21;
    uint64_t v12 = 4;
  }
  uint64_t v17 = [v10 arrayWithObjects:v11 count:v12];
  v18 = objc_msgSend(objc_alloc(MEMORY[0x263F38370]), "initWithColorNamed:colorSpaceID:components:linkedToSystemColorWithName:", v7, -[TDNamedColorRenditionSpec colorSpaceID](self, "colorSpaceID"), v17, -[TDNamedColorRenditionSpec systemColorName](self, "systemColorName"));
  objc_msgSend(v18, "setTargetPlatform:", objc_msgSend(a5, "targetPlatform"));
  objc_msgSend(v18, "setRenditionProperties:", -[TDRenditionSpec propertiesAsDictionary](self, "propertiesAsDictionary"));
  objc_msgSend(v18, "setPreserveForArchiveOnly:", -[TDNamedColorRenditionSpec preserveForArchiveOnly](self, "preserveForArchiveOnly"));
  v19 = (void *)[v18 CSIRepresentationWithCompression:0];

  return v19;
}

@end