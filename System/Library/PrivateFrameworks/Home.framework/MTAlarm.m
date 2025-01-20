@interface MTAlarm
@end

@implementation MTAlarm

uint64_t __49__MTAlarm_HFAdditions__hf_targetAccessoryInHome___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 uniqueIdentifier];
  uint64_t v4 = objc_msgSend(v3, "hmf_isEqualToUUID:", *(void *)(a1 + 32));

  return v4;
}

uint64_t __70__MTAlarm_HFAlarmUtilities__hf_buildAlarmsFromCollectionSettingItems___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x263F55D40], "hf_buildAlarmFromCollectionSettingItem:", a2);
}

uint64_t __80__MTAlarm_HFAlarmUtilities__hf_areAlarms_equalToAlarms_includeModificationDate___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 alarmID];
  uint64_t v4 = [*(id *)(a1 + 32) alarmID];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

uint64_t __70__MTAlarm_HFAlarmUtilities__hf_alarmsMatchingAlarmId_withinItemArray___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = objc_msgSend(MEMORY[0x263F55D40], "hf_buildAlarmFromCollectionSettingItem:", a2);
  uint64_t v4 = [v3 alarmID];
  uint64_t v5 = [v4 isEqual:*(void *)(a1 + 32)];

  return v5;
}

uint64_t __62__MTAlarm_HFAlarmUtilities__hf_verifyThatAlarmsAreConsistent___block_invoke(uint64_t a1, void *a2)
{
  return [a2 alarmID];
}

@end