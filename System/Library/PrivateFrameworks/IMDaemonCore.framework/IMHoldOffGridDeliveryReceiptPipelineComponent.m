@interface IMHoldOffGridDeliveryReceiptPipelineComponent
- (id)runIndividuallyWithInput:(id)a3;
@end

@implementation IMHoldOffGridDeliveryReceiptPipelineComponent

- (id)runIndividuallyWithInput:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 wantsDeliveryReceipt])
  {
    v4 = [MEMORY[0x1E4F6E7B0] sharedInstance];
    uint64_t v5 = [v4 personalOffGridMode];

    unsigned int v6 = [v3 wantsDeliveryReceipt];
    uint64_t v7 = v5 == 2 ? 0 : v6;
    [v3 setWantsDeliveryReceipt:v7];
    if (IMOSLoggingEnabled())
    {
      v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v9 = [v3 wantsDeliveryReceipt];
        v10 = @"NO";
        if (v9) {
          v10 = @"YES";
        }
        v13[0] = 67109378;
        v13[1] = v5;
        __int16 v14 = 2112;
        v15 = v10;
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "<IMHoldOffGridDeliveryReceiptPipelineComponent> Personal off grid status is %d, wantsDeliveryReceipt: %@", (uint8_t *)v13, 0x12u);
      }
    }
  }
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F6BE98]) initWithValue:v3];

  return v11;
}

@end