@interface CRImage(CoreRecognition)
- (id)imageByCroppingTextFeature:()CoreRecognition correctedBoundingBox:padding:networkInputSize:;
@end

@implementation CRImage(CoreRecognition)

- (id)imageByCroppingTextFeature:()CoreRecognition correctedBoundingBox:padding:networkInputSize:
{
  id v14 = a7;
  id v15 = a8;
  [a1 vImage];
  if (+[GeometricCutTools derotateContentsOf:inImage:andOutputTo:withPadding:networkInputSize:](GeometricCutTools, "derotateContentsOf:inImage:andOutputTo:withPadding:networkInputSize:", v15, v20, v21, a2, a3, a4, a5))
  {
    id v16 = objc_alloc(MEMORY[0x263F7ECB0]);
    v19[0] = *(_OWORD *)v21;
    v19[1] = v22;
    v17 = (void *)[v16 initWithVImageBuffer:v19 inColorSpace:0];
    free(v21[0]);
  }
  else
  {
    NSLog(&cfstr_CrimageImageby.isa, v14);
    v17 = 0;
  }

  return v17;
}

@end