@interface NTKCFaceDetailUltraCubeStyleSectionController
+ (BOOL)hasSectionForFace:(id)a3 forEditMode:(int64_t)a4;
@end

@implementation NTKCFaceDetailUltraCubeStyleSectionController

+ (BOOL)hasSectionForFace:(id)a3 forEditMode:(int64_t)a4
{
  id v5 = a3;
  v6 = +[NTKUltraCubeFaceBundle identifier];
  v7 = [v5 bundleIdentifier];

  unsigned __int8 v8 = [v7 isEqualToString:v6];
  if (a4 == 15) {
    BOOL v9 = v8;
  }
  else {
    BOOL v9 = 0;
  }

  return v9;
}

@end