@interface CSUSceneNetV5NetworkOutput(VNCoreSceneUnderstandingDetector)
- (id)VNRequiredBufferFromSelector:()VNCoreSceneUnderstandingDetector error:;
@end

@implementation CSUSceneNetV5NetworkOutput(VNCoreSceneUnderstandingDetector)

- (id)VNRequiredBufferFromSelector:()VNCoreSceneUnderstandingDetector error:
{
  v6 = objc_msgSend(a1, "performSelector:");
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else if (a4)
  {
    id v9 = [NSString alloc];
    v10 = NSStringFromSelector(a3);
    v11 = (void *)[v9 initWithFormat:@"%@ did not provide a buffer", v10];

    *a4 = +[VNError errorForDataUnavailableWithLocalizedDescription:v11];
  }

  return v7;
}

@end