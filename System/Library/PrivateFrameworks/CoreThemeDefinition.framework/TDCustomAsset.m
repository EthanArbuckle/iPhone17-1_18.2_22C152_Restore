@interface TDCustomAsset
- (CGSize)sourceImageSizeWithDocument:(id)a3;
- (id)sourceImageWithDocument:(id)a3;
@end

@implementation TDCustomAsset

- (CGSize)sourceImageSizeWithDocument:(id)a3
{
  v3 = objc_msgSend((id)objc_msgSend(a3, "customAssetProvider"), "document:willProvideAssetForCustomRendition:withReferenceData:", a3, objc_msgSend((id)-[TDCustomAsset renditions](self, "renditions"), "anyObject"), -[TDCustomAsset referenceData](self, "referenceData"));

  [v3 customAssetSize];
  result.height = v5;
  result.width = v4;
  return result;
}

- (id)sourceImageWithDocument:(id)a3
{
  v3 = (CGImage *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "customAssetProvider"), "document:willProvideAssetForCustomRendition:withReferenceData:", a3, objc_msgSend((id)-[TDCustomAsset renditions](self, "renditions"), "anyObject"), -[TDCustomAsset referenceData](self, "referenceData")), "customAssetImage");
  double v4 = (void *)[MEMORY[0x263F38388] imageWithCGImage:v3];
  CGImageRelease(v3);
  return v4;
}

@end