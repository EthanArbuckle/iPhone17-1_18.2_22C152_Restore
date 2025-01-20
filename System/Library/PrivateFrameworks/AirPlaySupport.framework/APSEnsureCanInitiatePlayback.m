@interface APSEnsureCanInitiatePlayback
@end

@implementation APSEnsureCanInitiatePlayback

__CFBundle *__APSEnsureCanInitiatePlayback_block_invoke()
{
  result = CFBundleGetMainBundle();
  if (result)
  {
    result = (__CFBundle *)CFBundleGetIdentifier(result);
    APSEnsureCanInitiatePlayback_bundleID = (uint64_t)result;
    if (result)
    {
      return (__CFBundle *)CFRetain(result);
    }
  }
  return result;
}

@end