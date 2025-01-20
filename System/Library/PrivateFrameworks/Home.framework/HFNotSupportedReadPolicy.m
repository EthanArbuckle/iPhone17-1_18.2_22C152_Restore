@interface HFNotSupportedReadPolicy
- (BOOL)_requiresNotificationsForCharacteristic:(id)a3;
- (unint64_t)evaluateWithCharacteristic:(id)a3 traits:(id *)a4;
@end

@implementation HFNotSupportedReadPolicy

- (unint64_t)evaluateWithCharacteristic:(id)a3 traits:(id *)a4
{
  id v6 = a3;
  v7 = [MEMORY[0x263EFF9C0] set];
  v8 = [v6 properties];
  if ([v8 containsObject:*MEMORY[0x263F0BEE8]])
  {
  }
  else
  {
    BOOL v9 = [(HFNotSupportedReadPolicy *)self _requiresNotificationsForCharacteristic:v6];

    if (v9)
    {
      [v7 addObject:@"DoesNotSupportNotifications"];
      unsigned int v10 = 0;
      goto LABEL_6;
    }
  }
  unsigned int v10 = 1;
LABEL_6:
  v11 = [v6 properties];
  if ([v11 containsObject:*MEMORY[0x263F0BEE0]])
  {
    char v12 = [v6 hasAuthorizationData];

    if ((v12 & 1) == 0)
    {
      [v7 addObject:@"InvalidOrMissingAuthorizationData"];
      unsigned int v10 = 0;
    }
  }
  else
  {
  }
  v13 = [v6 service];
  v14 = [v13 accessory];
  int v15 = [v14 isAdditionalSetupRequired];

  if (v15)
  {
    [v7 addObject:@"AdditionalSetupRequired"];
    unsigned int v10 = 0;
  }
  if (a4) {
    *a4 = (id)[v7 copy];
  }

  return v10;
}

- (BOOL)_requiresNotificationsForCharacteristic:(id)a3
{
  v17[6] = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [v3 service];
  v5 = [v4 serviceType];
  char v6 = [v5 isEqualToString:*MEMORY[0x263F0D610]];

  if (v6) {
    goto LABEL_3;
  }
  uint64_t v7 = *MEMORY[0x263F0BFE8];
  v17[0] = *MEMORY[0x263F0BF58];
  v17[1] = v7;
  uint64_t v8 = *MEMORY[0x263F0C220];
  v17[2] = *MEMORY[0x263F0C228];
  v17[3] = v8;
  uint64_t v9 = *MEMORY[0x263F0C3B0];
  v17[4] = *MEMORY[0x263F0C460];
  v17[5] = v9;
  unsigned int v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:6];
  v11 = [v3 characteristicType];
  char v12 = [v10 containsObject:v11];

  if (v12)
  {
LABEL_3:
    char v13 = 0;
  }
  else
  {
    v14 = (void *)*MEMORY[0x263F0C1D8];
    int v15 = [v3 characteristicType];
    LOBYTE(v14) = [v14 isEqualToString:v15];

    char v13 = v14 ^ 1;
  }

  return v13;
}

@end