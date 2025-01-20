@interface HKUIIconUtilties
+ (id)appleDeviceIconForHardwareVersion:(id)a3;
@end

@implementation HKUIIconUtilties

+ (id)appleDeviceIconForHardwareVersion:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (([v3 hasPrefix:*MEMORY[0x1E4F2A570]] & 1) != 0
    || ([v3 hasPrefix:*MEMORY[0x1E4F2A578]] & 1) != 0
    || ([v3 hasPrefix:*MEMORY[0x1E4F2A588]] & 1) != 0
    || [v3 hasPrefix:*MEMORY[0x1E4F2A580]])
  {
    v4 = [MEMORY[0x1E4F442D8] _typeWithDeviceModelCode:v3];
    v5 = (void *)MEMORY[0x1E4F6F260];
    v6 = [v4 identifier];
    id v17 = 0;
    v7 = [v5 symbolForTypeIdentifier:v6 error:&v17];
    id v8 = v17;

    v9 = (void *)MEMORY[0x1E4FB1830];
    v10 = [MEMORY[0x1E4FB1618] systemBlueColor];
    v18[0] = v10;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    v12 = [v9 _configurationWithHierarchicalColors:v11];

    if (v7)
    {
      v13 = (void *)MEMORY[0x1E4FB1818];
      v14 = [v7 name];
      v15 = [v13 _systemImageNamed:v14 withConfiguration:v12];
    }
    else
    {
      v15 = 0;
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

@end