@interface NSMutableURLRequest
@end

@implementation NSMutableURLRequest

void __73__NSMutableURLRequest_AppleAccount__aa_addMultiUserDeviceHeaderIfEnabled__block_invoke()
{
  id v1 = (id)MKBUserTypeDeviceMode();
  v0 = [v1 objectForKeyedSubscript:*MEMORY[0x1E4F78100]];
  if ([v0 isEqualToString:*MEMORY[0x1E4F78108]]) {
    aa_addMultiUserDeviceHeaderIfEnabled_isMultiUserDevice = 1;
  }
}

@end