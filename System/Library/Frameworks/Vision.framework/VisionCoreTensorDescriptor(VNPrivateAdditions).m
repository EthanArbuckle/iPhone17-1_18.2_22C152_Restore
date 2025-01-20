@interface VisionCoreTensorDescriptor(VNPrivateAdditions)
- (uint64_t)getVNElementType:()VNPrivateAdditions error:;
@end

@implementation VisionCoreTensorDescriptor(VNPrivateAdditions)

- (uint64_t)getVNElementType:()VNPrivateAdditions error:
{
  if (a1)
  {
    uint64_t v7 = [a1 dataType];
    if (v7 == 65568)
    {
      uint64_t v8 = 1;
      if (!a3) {
        return 1;
      }
LABEL_7:
      *a3 = v8;
      return 1;
    }
    if (v7 == 65600)
    {
      uint64_t v8 = 2;
      if (!a3) {
        return 1;
      }
      goto LABEL_7;
    }
  }
  if (a4)
  {
    id v10 = [NSString alloc];
    [a1 dataType];
    v11 = NSStringFromVisionCoreTensorDataType();
    v12 = (void *)[v10 initWithFormat:@"tensor data type %@ is not supported", v11];

    *a4 = +[VNError errorForInvalidArgumentWithLocalizedDescription:v12];
  }
  return 0;
}

@end