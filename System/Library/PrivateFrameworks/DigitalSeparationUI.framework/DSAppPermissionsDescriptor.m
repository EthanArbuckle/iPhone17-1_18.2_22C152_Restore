@interface DSAppPermissionsDescriptor
@end

@implementation DSAppPermissionsDescriptor

uint64_t __78__DSAppPermissionsDescriptor_DigitalSeparationUI__iconAppBundleForPermission___block_invoke()
{
  uint64_t v0 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", @"com.apple.camera", *MEMORY[0x263F7C510], @"com.apple.mobileslideshow", *MEMORY[0x263F7C5B8], @"com.apple.Music", *MEMORY[0x263F7C590], @"com.apple.Home", *MEMORY[0x263F7C688], @"com.apple.mobilecal", *MEMORY[0x263F7C508], @"com.apple.reminders", *MEMORY[0x263F7C5C8], @"com.apple.MobileAddressBook", @"DSContacts", @"com.apple.Health", @"DSHealth", 0);
  uint64_t v1 = iconAppBundleForPermission__icons;
  iconAppBundleForPermission__icons = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t __78__DSAppPermissionsDescriptor_DigitalSeparationUI__iconAssetNameForPermission___block_invoke()
{
  objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", @"camera", *MEMORY[0x263F7C510], @"photos", *MEMORY[0x263F7C5B8], @"music", *MEMORY[0x263F7C590], @"home", *MEMORY[0x263F7C688], @"calendar", *MEMORY[0x263F7C508], @"reminders", *MEMORY[0x263F7C5C8], @"contacts", @"DSContacts", @"health", @"DSHealth", @"location",
    @"DSLocationAlways",
    @"bluetooth",
    *MEMORY[0x263F7C500],
    @"location",
    @"DSLocationWhenInUse",
    @"microphone",
    *MEMORY[0x263F7C598],
    @"localNetwork",
    @"DSLocalNetwork",
    @"nearbyInteraction",
    *MEMORY[0x263F7C5A8],
    @"sensorKit",
    *MEMORY[0x263F7C5F0],
  uint64_t v0 = 0);
  uint64_t v1 = iconAssetNameForPermission__icons;
  iconAssetNameForPermission__icons = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t __74__DSAppPermissionsDescriptor_DigitalSeparationUI__stringKeyForPermission___block_invoke()
{
  objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", @"DSLocationAlways", @"BLUETOOTH", *MEMORY[0x263F7C500], @"LOCATION", @"DSLocationWhenInUse", @"MICROPHONE", *MEMORY[0x263F7C598], @"CAMERA", *MEMORY[0x263F7C510], @"PHOTOS", *MEMORY[0x263F7C5B8], @"MEDIA", *MEMORY[0x263F7C590], @"HOME", *MEMORY[0x263F7C688], @"CALENDAR", *MEMORY[0x263F7C508],
    @"REMINDERS",
    *MEMORY[0x263F7C5C8],
    @"CONTACTS",
    @"DSContacts",
    @"HEALTH",
    @"DSHealth",
    @"LOCALNETWORK",
    @"DSLocalNetwork",
    @"NEARBYINTERACTION",
    *MEMORY[0x263F7C5A8],
    @"SENSORKIT",
    *MEMORY[0x263F7C5F0],
  uint64_t v0 = 0);
  uint64_t v1 = stringKeyForPermission__icons;
  stringKeyForPermission__icons = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

@end