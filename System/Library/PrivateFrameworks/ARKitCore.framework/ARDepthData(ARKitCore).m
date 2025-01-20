@interface ARDepthData(ARKitCore)
- (id)tracingEntry;
@end

@implementation ARDepthData(ARKitCore)

- (id)tracingEntry
{
  v2 = ARQATraceableDefaultEntryForResultData(a1);
  v3 = (void *)[v2 mutableCopy];

  [a1 cameraIntrinsics];
  v4 = +[ARQAHelper arrayWithMatrix3x3:](ARQAHelper, "arrayWithMatrix3x3:");
  [v3 setObject:v4 forKeyedSubscript:@"cameraIntrinsics"];

  [a1 extrinsicsToAppNode];
  v5 = +[ARQAHelper arrayWithMatrix4x4:](ARQAHelper, "arrayWithMatrix4x4:");
  [v3 setObject:v5 forKeyedSubscript:@"extrinsicsToAppNode"];

  [a1 deviceTransform];
  v6 = +[ARQAHelper arrayWithMatrix4x4:](ARQAHelper, "arrayWithMatrix4x4:");
  [v3 setObject:v6 forKeyedSubscript:@"deviceTransform"];

  v7 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "isValid"));
  [v3 setObject:v7 forKeyedSubscript:@"isValid"];

  return v3;
}

@end