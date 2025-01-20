@interface HUAccessoryDebugModuleController
- (BOOL)canSelectItem:(id)a3;
- (Class)cellClassForItem:(id)a3;
- (HUAccessoryDebugModuleController)initWithModule:(id)a3;
- (NSMapTable)cellToItemMap;
- (unint64_t)didSelectItem:(id)a3;
- (void)setCellToItemMap:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4;
- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4;
- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5;
@end

@implementation HUAccessoryDebugModuleController

- (HUAccessoryDebugModuleController)initWithModule:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
    v8 = v6;
    if (v7) {
      goto LABEL_8;
    }
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    v10 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v9 handleFailureInFunction:v10, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v5, objc_opt_class() file lineNumber description];
  }
  v8 = 0;
LABEL_8:

  v15.receiver = self;
  v15.super_class = (Class)HUAccessoryDebugModuleController;
  v11 = [(HUItemModuleController *)&v15 initWithModule:v6];
  if (v11)
  {
    uint64_t v12 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
    cellToItemMap = v11->_cellToItemMap;
    v11->_cellToItemMap = (NSMapTable *)v12;
  }
  return v11;
}

- (Class)cellClassForItem:(id)a3
{
  return (Class)objc_opt_class();
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HUAccessoryDebugModuleController *)self cellToItemMap];
  [v8 setObject:v6 forKey:v7];
}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  id v14 = v7;
  if (objc_opt_isKindOfClass()) {
    v9 = v14;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  [v10 setDelegate:self];
  v11 = [v8 latestResults];

  uint64_t v12 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F68BC0]];
  BOOL v13 = [v12 integerValue] == 2;

  [v10 setOn:v13 animated:1];
}

- (unint64_t)didSelectItem:(id)a3
{
  return 0;
}

- (BOOL)canSelectItem:(id)a3
{
  return 0;
}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  id v8 = [(HUAccessoryDebugModuleController *)self cellToItemMap];
  id v32 = [v8 objectForKey:v7];

  v9 = [(HUItemModuleController *)self module];
  id v10 = [v9 fakeUnreachableItem];

  v11 = [(HUItemModuleController *)self module];
  if (v32 == v10)
  {
    [v11 setFakeUnreachableError:v4];
  }
  else
  {
    id v12 = [v11 fakeWiFiSymptomItem];

    v11 = [(HUItemModuleController *)self module];
    if (v32 == v12)
    {
      [v11 setFakeWiFiSymptom:v4];
    }
    else
    {
      id v13 = [v11 fakeWiFiPerformanceSymptomItem];

      v11 = [(HUItemModuleController *)self module];
      if (v32 == v13)
      {
        [v11 setFakeWiFiPerformanceSymptom:v4];
      }
      else
      {
        id v14 = [v11 fakeHardwareFixSymptomItem];

        v11 = [(HUItemModuleController *)self module];
        if (v32 == v14)
        {
          [v11 setFakeHardwareFixSymptom:v4];
        }
        else
        {
          id v15 = [v11 fakeGeneralFixSymptomItem];

          v11 = [(HUItemModuleController *)self module];
          if (v32 == v15)
          {
            [v11 setFakeGeneralFixSymptom:v4];
          }
          else
          {
            id v16 = [v11 fakeHomeKitSymptomItem];

            v11 = [(HUItemModuleController *)self module];
            if (v32 == v16)
            {
              [v11 setFakeHomeKitSymptom:v4];
            }
            else
            {
              id v17 = [v11 fakeInternetFixSymptomItem];

              v11 = [(HUItemModuleController *)self module];
              if (v32 == v17)
              {
                [v11 setFakeInternetFixSymptom:v4];
              }
              else
              {
                id v18 = [v11 fakeICloudSymptomItem];

                v11 = [(HUItemModuleController *)self module];
                if (v32 == v18)
                {
                  [v11 setFakeICloudSymptom:v4];
                }
                else
                {
                  id v19 = [v11 fakeITunesSymptomItem];

                  v11 = [(HUItemModuleController *)self module];
                  if (v32 == v19)
                  {
                    [v11 setFakeITunesSymptom:v4];
                  }
                  else
                  {
                    id v20 = [v11 fakeCDPSymptomItem];

                    v11 = [(HUItemModuleController *)self module];
                    if (v32 == v20)
                    {
                      [v11 setFakeCDPSymptom:v4];
                    }
                    else
                    {
                      id v21 = [v11 fakeStereoPairVersionMismatchSymptomItem];

                      v11 = [(HUItemModuleController *)self module];
                      if (v32 == v21)
                      {
                        [v11 setFakeStereoPairVersionMismatchSymptom:v4];
                      }
                      else
                      {
                        id v22 = [v11 fakeStereoPairGeneralSymptomItem];

                        v11 = [(HUItemModuleController *)self module];
                        if (v32 == v22)
                        {
                          [v11 setFakeStereoPairGeneralSymptom:v4];
                        }
                        else
                        {
                          id v23 = [v11 fakeStereoPairNotFoundSymptomItem];

                          v11 = [(HUItemModuleController *)self module];
                          if (v32 == v23)
                          {
                            [v11 setFakeStereoPairNotFoundSymptom:v4];
                          }
                          else
                          {
                            id v24 = [v11 fakeWifiNetworkMismatchSymptomItem];

                            v11 = [(HUItemModuleController *)self module];
                            if (v32 == v24)
                            {
                              [v11 setFakeWiFiNetworkMismatchSymptom:v4];
                            }
                            else
                            {
                              id v25 = [v11 fakeVPNProfileExpiredSymptomItem];

                              v11 = [(HUItemModuleController *)self module];
                              if (v32 == v25)
                              {
                                [v11 setFakeVPNProfileExpiredSymptom:v4];
                              }
                              else
                              {
                                id v26 = [v11 fake8021xNetworkSymptomItem];

                                v11 = [(HUItemModuleController *)self module];
                                if (v32 == v26)
                                {
                                  [v11 setFake8021xNetworkSymptom:v4];
                                }
                                else
                                {
                                  id v27 = [v11 fakeNetworkProfileFixSymptomItem];

                                  v11 = [(HUItemModuleController *)self module];
                                  if (v32 == v27)
                                  {
                                    [v11 setFakeNetworkProfileFixSymptom:v4];
                                  }
                                  else
                                  {
                                    id v28 = [v11 fakeNetworkProfileInstallSymptomItem];

                                    v11 = [(HUItemModuleController *)self module];
                                    if (v32 == v28)
                                    {
                                      [v11 setFakeNetworkProfileInstallSymptom:v4];
                                    }
                                    else
                                    {
                                      id v29 = [v11 fakeNetworkNotShareableSymptomItem];

                                      v11 = [(HUItemModuleController *)self module];
                                      if (v32 == v29)
                                      {
                                        [v11 setFakeNetworkNotShareableSymptom:v4];
                                      }
                                      else
                                      {
                                        id v30 = [v11 fakeNetworkStrengthErrorItem];

                                        v11 = [(HUItemModuleController *)self module];
                                        if (v32 == v30)
                                        {
                                          [v11 setFakeNetworkStrengthError:v4];
                                        }
                                        else
                                        {
                                          id v31 = [v11 fakeCaptiveLeaseRenewalSymptomItem];

                                          if (v32 == v31)
                                          {
                                            v11 = [(HUItemModuleController *)self module];
                                            [v11 setFakeCaptiveLeaseRenewalSymptom:v4];
                                          }
                                          else
                                          {
                                            v11 = [MEMORY[0x1E4F28B00] currentHandler];
                                            [v11 handleFailureInMethod:a2, self, @"HUAccessoryDebugModuleController.m", 136, @"Missing item check for: %@", v32 object file lineNumber description];
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

- (NSMapTable)cellToItemMap
{
  return (NSMapTable *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCellToItemMap:(id)a3
{
}

- (void).cxx_destruct
{
}

@end