@interface HMFaceCrop(HFAdditions)
- (id)hf_imageRepresentation;
@end

@implementation HMFaceCrop(HFAdditions)

- (id)hf_imageRepresentation
{
  v1 = (void *)MEMORY[0x263F1C6B0];
  v2 = [a1 dataRepresentation];
  v3 = [v1 imageWithData:v2];

  return v3;
}

@end