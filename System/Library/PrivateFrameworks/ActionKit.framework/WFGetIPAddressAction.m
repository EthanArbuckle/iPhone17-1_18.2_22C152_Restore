@interface WFGetIPAddressAction
+ (BOOL)outputIsExemptFromTaintTrackingInheritance;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFGetIPAddressAction

+ (BOOL)outputIsExemptFromTaintTrackingInheritance
{
  return 1;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  v5 = [(WFGetIPAddressAction *)self parameterValueForKey:@"WFIPAddressSourceOption" ofClass:objc_opt_class()];
  v6 = [(WFGetIPAddressAction *)self parameterValueForKey:@"WFIPAddressTypeOption" ofClass:objc_opt_class()];
  uint64_t v7 = [v6 isEqualToString:@"IPv6"];
  if ([v5 isEqualToString:@"External"])
  {
    v8 = objc_opt_new();
    [v8 setUseIPv6:v7];
    objc_initWeak(&location, v8);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __51__WFGetIPAddressAction_runAsynchronouslyWithInput___block_invoke;
    v16[3] = &unk_264E5A250;
    objc_copyWeak(&v17, &location);
    v16[4] = self;
    [v8 setCompletionBlock:v16];
    v9 = [MEMORY[0x263F08A48] mainQueue];
    [v9 addOperation:v8];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
LABEL_10:

    goto LABEL_11;
  }
  if ([v5 isEqualToString:@"Local"])
  {
    v10 = +[WFNetworkInterface activeNetworkInterface];
    v8 = v10;
    if (v7) {
      [v10 IPv6Address];
    }
    else {
    v11 = [v10 IPv4Address];
    }
    if (v11)
    {
      v12 = (void *)MEMORY[0x263F337C8];
      v13 = [MEMORY[0x263F337E8] networkLocation];
      v14 = [v12 itemWithObject:v11 origin:v13 disclosureLevel:1];

      v15 = [(WFGetIPAddressAction *)self output];
      [v15 addItem:v14];
    }
    [(WFGetIPAddressAction *)self finishRunningWithError:0];

    goto LABEL_10;
  }
LABEL_11:
}

void __51__WFGetIPAddressAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained result];

  if (v2)
  {
    v3 = (void *)MEMORY[0x263F337C8];
    id v4 = [WeakRetained result];
    v5 = [MEMORY[0x263F337E8] networkLocation];
    v6 = [v3 itemWithObject:v4 origin:v5 disclosureLevel:1];

    uint64_t v7 = [*(id *)(a1 + 32) output];
    [v7 addItem:v6];
  }
  v8 = [WeakRetained error];
  v9 = [v8 domain];
  if ([v9 isEqualToString:*MEMORY[0x263F08438]])
  {
    if ([v8 code] == 65)
    {
    }
    else
    {
      uint64_t v10 = [v8 code];

      if (v10 != 50) {
        goto LABEL_9;
      }
    }
    v9 = v8;
    v8 = 0;
  }

LABEL_9:
  [*(id *)(a1 + 32) finishRunningWithError:v8];
}

@end