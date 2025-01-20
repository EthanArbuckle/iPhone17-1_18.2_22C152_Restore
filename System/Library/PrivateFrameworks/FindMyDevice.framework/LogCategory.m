@interface LogCategory
@end

@implementation LogCategory

uint64_t __LogCategory_Unspecified_block_invoke()
{
  LogCategory_Unspecified_log = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "_");

  return MEMORY[0x1F41817F8]();
}

uint64_t __LogCategory_Locations_block_invoke()
{
  LogCategory_Locations_log = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "locations");

  return MEMORY[0x1F41817F8]();
}

uint64_t __LogCategory_Accessory_block_invoke()
{
  LogCategory_Accessory_log = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "accessory");

  return MEMORY[0x1F41817F8]();
}

uint64_t __LogCategory_Traffic_block_invoke()
{
  LogCategory_Traffic_log = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "traffic");

  return MEMORY[0x1F41817F8]();
}

uint64_t __LogCategory_Encoder_block_invoke()
{
  LogCategory_Encoder_log = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "encoder");

  return MEMORY[0x1F41817F8]();
}

uint64_t __LogCategory_Bluetooth_Session_block_invoke()
{
  LogCategory_Bluetooth_Session_log = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "bluetoothsession");

  return MEMORY[0x1F41817F8]();
}

uint64_t __LogCategory_Extensions_block_invoke()
{
  LogCategory_Extensions_log = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "extensions");

  return MEMORY[0x1F41817F8]();
}

uint64_t __LogCategory_Extensions_PlaySound_block_invoke()
{
  LogCategory_Extensions_PlaySound_log = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "extensions_playSound");

  return MEMORY[0x1F41817F8]();
}

uint64_t __LogCategory_SecureLocations_block_invoke()
{
  LogCategory_SecureLocations_log = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "secureLocations");

  return MEMORY[0x1F41817F8]();
}

uint64_t __LogCategory_HealUCRT_block_invoke()
{
  LogCategory_HealUCRT_log = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "healUCRT");

  return MEMORY[0x1F41817F8]();
}

uint64_t __LogCategory_RepairDevice_block_invoke()
{
  LogCategory_RepairDevice_log = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "repairDevice");

  return MEMORY[0x1F41817F8]();
}

uint64_t __LogCategory_ALFailureAnalytics_block_invoke()
{
  LogCategory_ALFailureAnalytics_log = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "ALFailureAnalytics");

  return MEMORY[0x1F41817F8]();
}

uint64_t __LogCategory_DisableLocationDisplay_block_invoke()
{
  LogCategory_DisableLocationDisplay_log = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "disableLocationDisplay");

  return MEMORY[0x1F41817F8]();
}

uint64_t __LogCategory_AccountRatchet_block_invoke()
{
  LogCategory_AccountRatchet_log = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "accountRatchet");

  return MEMORY[0x1F41817F8]();
}

uint64_t __LogCategory_OwnerAuthentication_block_invoke()
{
  LogCategory_OwnerAuthentication_log = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "ownerAuthentication");

  return MEMORY[0x1F41817F8]();
}

uint64_t __LogCategory_Automation_block_invoke()
{
  uint64_t result = [MEMORY[0x1E4F61550] BOOLForKey:@"ShowAutomationLogs" inDomain:@"com.apple.icloud.findmydeviced.notbackedup"];
  if (result)
  {
    LogCategory_Automation_log = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "automation");
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

@end