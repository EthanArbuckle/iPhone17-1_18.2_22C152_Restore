@interface ARFaceAnchor(DebugOutput)
- (uint64_t)description;
@end

@implementation ARFaceAnchor(DebugOutput)

- (uint64_t)description
{
  v2 = NSString;
  if ([a1 isTracked]) {
    v3 = @"YES";
  }
  else {
    v3 = @"NO";
  }
  [a1 transform];
  double v5 = v4;
  [a1 transform];
  double v7 = v6;
  [a1 transform];
  return [v2 stringWithFormat:@"face anchor: isTracked=%@, position=(%f,%f,%f)", v3, *(void *)&v5, *(void *)&v7, v8];
}

@end