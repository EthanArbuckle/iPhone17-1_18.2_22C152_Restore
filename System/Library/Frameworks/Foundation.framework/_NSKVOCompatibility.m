@interface _NSKVOCompatibility
+ (BOOL)_releasesObservationBlockOnInvalidation;
+ (void)_noteProcessHasUsedKVOSwiftOverlay;
+ (void)_setRequiresSilencingExceptions:(BOOL)a3;
@end

@implementation _NSKVOCompatibility

+ (void)_noteProcessHasUsedKVOSwiftOverlay
{
  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    [a1 _setRequiresSilencingExceptions:1];
  }
}

+ (void)_setRequiresSilencingExceptions:(BOOL)a3
{
}

+ (BOOL)_releasesObservationBlockOnInvalidation
{
  return dyld_program_sdk_at_least();
}

@end