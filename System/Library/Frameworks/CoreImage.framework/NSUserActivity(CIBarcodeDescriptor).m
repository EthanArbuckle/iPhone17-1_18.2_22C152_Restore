@interface NSUserActivity(CIBarcodeDescriptor)
- (uint64_t)detectedBarcodeDescriptor;
- (uint64_t)setDetectedCode:()CIBarcodeDescriptor;
@end

@implementation NSUserActivity(CIBarcodeDescriptor)

- (uint64_t)detectedBarcodeDescriptor
{
  uint64_t result = [a1 _objectForIdentifier:@"com.apple.DetectedBarcode.UserActivityPayload"];
  if (!result)
  {
    uint64_t result = [a1 _payloadForIdentifier:@"com.apple.DetectedBarcode.UserActivityPayload"];
    if (result)
    {
      uint64_t v3 = result;
      uint64_t v4 = self;
      return unarchiveObjectOfClass(v4, v3);
    }
  }
  return result;
}

- (uint64_t)setDetectedCode:()CIBarcodeDescriptor
{
  objc_opt_class();
  uint64_t result = objc_opt_isKindOfClass();
  if (result)
  {
    if (a3)
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __55__NSUserActivity_CIBarcodeDescriptor__setDetectedCode___block_invoke;
      v6[3] = &unk_1E5770F50;
      v6[4] = a3;
      return [a1 _setPayloadIdentifier:@"com.apple.DetectedBarcode.UserActivityPayload" object:a3 withBlock:v6];
    }
    else
    {
      return [a1 _setPayloadIdentifier:@"com.apple.DetectedBarcode.UserActivityPayload" object:0 withBlock:0];
    }
  }
  return result;
}

@end