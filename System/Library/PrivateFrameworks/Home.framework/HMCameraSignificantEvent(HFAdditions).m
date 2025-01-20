@interface HMCameraSignificantEvent(HFAdditions)
- (__CFString)hf_reasonKey;
- (id)hf_faceClassificationName;
@end

@implementation HMCameraSignificantEvent(HFAdditions)

- (id)hf_faceClassificationName
{
  v1 = [a1 faceClassification];
  v2 = [v1 person];
  v3 = [v2 name];

  return v3;
}

- (__CFString)hf_reasonKey
{
  uint64_t v1 = [a1 reason];
  if ((unint64_t)(v1 - 2) > 3) {
    return @"AnyMotion";
  }
  else {
    return off_26409AB00[v1 - 2];
  }
}

@end