@interface APKeychainSettings
+ (id)settingsForThisDeviceOnly:(id)a3;
@end

@implementation APKeychainSettings

+ (id)settingsForThisDeviceOnly:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setObject:@"apple" forKeyedSubscript:*MEMORY[0x1E4F3B550]];
  [v5 setObject:*MEMORY[0x1E4F3B988] forKeyedSubscript:*MEMORY[0x1E4F3B978]];
  [v5 setObject:@"com.apple.iAdIDRecords" forKeyedSubscript:*MEMORY[0x1E4F3B850]];
  [v5 setObject:*MEMORY[0x1E4F3B578] forKeyedSubscript:*MEMORY[0x1E4F3B558]];
  v6 = [v4 dataUsingEncoding:4];

  [v5 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F3B688]];
  [v5 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F3B5C0]];

  return v5;
}

@end