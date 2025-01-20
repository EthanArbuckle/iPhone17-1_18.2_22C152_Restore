@interface COHomeKitAdapter(COMeshAlarmAddOn)
@end

@implementation COHomeKitAdapter(COMeshAlarmAddOn)

- (void)addAlarm:()COMeshAlarmAddOn toAccessory:inHome:.cold.1(void *a1)
{
  v1 = [a1 uniqueIdentifier];
  OUTLINED_FUNCTION_3_0(&dword_2217C1000, v2, v3, "Alarm add failed to find the accessory settings on %@!", v4, v5, v6, v7, 2u);
}

- (void)updateAlarm:()COMeshAlarmAddOn onAccessory:inHome:.cold.1(void *a1)
{
  v1 = [a1 uniqueIdentifier];
  OUTLINED_FUNCTION_3_0(&dword_2217C1000, v2, v3, "Alarm remove failed to find the accessory settings on %@!", v4, v5, v6, v7, 2u);
}

@end