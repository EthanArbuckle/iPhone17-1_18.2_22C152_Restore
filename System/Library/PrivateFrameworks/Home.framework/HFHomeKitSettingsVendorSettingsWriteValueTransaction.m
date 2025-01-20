@interface HFHomeKitSettingsVendorSettingsWriteValueTransaction
@end

@implementation HFHomeKitSettingsVendorSettingsWriteValueTransaction

__CFString *__75___HFHomeKitSettingsVendorSettingsWriteValueTransaction_descriptionBuilder__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) hasStarted])
  {
    v2 = [*(id *)(a1 + 32) settingWriteFuture];
    int v3 = [v2 isFinished];

    if (v3)
    {
      v4 = [*(id *)(a1 + 32) error];

      if (v4)
      {
        v5 = [*(id *)(a1 + 32) error];
        char v6 = objc_msgSend(v5, "na_isCancelledError");

        if (v6)
        {
          v7 = @"Cancelled";
        }
        else
        {
          v8 = NSString;
          v9 = [*(id *)(a1 + 32) error];
          v10 = [v9 localizedDescription];
          v7 = [v8 stringWithFormat:@"Failed (Error: %@)", v10];
        }
      }
      else
      {
        v7 = @"Succeeded";
      }
    }
    else
    {
      v7 = @"In Progress";
    }
  }
  else
  {
    v7 = @"Queued";
  }
  return v7;
}

@end