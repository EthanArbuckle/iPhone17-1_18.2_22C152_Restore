@interface HMCameraUserSettings(HUAdditions)
- (__CFString)hu_currentAccessModeDescription;
- (__CFString)hu_indicatorImageNameForCurrentAccessMode;
- (__CFString)hu_indicatorImageNameForLiveStreaming;
- (id)hu_indicatorColorForCurrentAccessMode;
- (uint64_t)hu_indicatorColorForLiveStreaming;
@end

@implementation HMCameraUserSettings(HUAdditions)

- (__CFString)hu_indicatorImageNameForCurrentAccessMode
{
  if ([a1 currentAccessMode] == 2)
  {
    objc_msgSend(a1, "hu_indicatorImageNameForLiveStreaming");
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = @"circle.fill";
  }

  return v2;
}

- (id)hu_indicatorColorForCurrentAccessMode
{
  v1 = (void *)[a1 currentAccessMode];
  switch((unint64_t)v1)
  {
    case 0uLL:
    case 3uLL:
      v1 = [MEMORY[0x1E4F428B8] systemGrayColor];
      break;
    case 1uLL:
      v1 = [MEMORY[0x1E4F428B8] systemBlueColor];
      break;
    case 2uLL:
      v1 = [MEMORY[0x1E4F428B8] systemRedColor];
      break;
    default:
      break;
  }

  return v1;
}

- (uint64_t)hu_indicatorColorForLiveStreaming
{
  return [MEMORY[0x1E4F428B8] systemRedColor];
}

- (__CFString)hu_indicatorImageNameForLiveStreaming
{
  if (UIAccessibilityShouldDifferentiateWithoutColor()) {
    return @"triangle.fill";
  }
  else {
    return @"circle.fill";
  }
}

- (__CFString)hu_currentAccessModeDescription
{
  uint64_t v1 = [a1 currentAccessMode];
  if ((unint64_t)(v1 - 1) > 2) {
    return @"Off";
  }
  else {
    return off_1E638DAD0[v1 - 1];
  }
}

@end