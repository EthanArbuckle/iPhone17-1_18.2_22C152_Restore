@interface CFPrefsGetPathForManagedBundleID
@end

@implementation CFPrefsGetPathForManagedBundleID

void ___CFPrefsGetPathForManagedBundleID_block_invoke()
{
  _CFPrefsGetPathForManagedBundleID_containingDirectoryPath = @"/Library/Managed Preferences/";
}

CFURLRef ___CFPrefsGetPathForManagedBundleID_block_invoke_2()
{
  CFURLRef result = _CFPreferencesCopyManagedPreferencesContainerURL();
  _CFPrefsGetPathForManagedBundleID_containerizedContainingDirectoryURL = (uint64_t)result;
  return result;
}

uint64_t ___CFPrefsGetPathForManagedBundleID_block_invoke_3()
{
  uint64_t result = _CFPrefsCurrentProcessIsCFPrefsD();
  if (result)
  {
    uint64_t result = (uint64_t)CFCopyUserName();
    _CFPrefsGetPathForManagedBundleID_ourUserName = result;
  }
  return result;
}

@end