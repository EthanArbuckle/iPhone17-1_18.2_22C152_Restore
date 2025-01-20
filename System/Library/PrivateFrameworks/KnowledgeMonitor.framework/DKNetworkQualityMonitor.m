@interface DKNetworkQualityMonitor
@end

@implementation DKNetworkQualityMonitor

uint64_t __48___DKNetworkQualityMonitor_didStartTrackingNOI___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) updateInstantQuality];
  [*(id *)(a1 + 32) updatePredictionAsync];
  v2 = *(void **)(a1 + 32);
  return [v2 updateInterfaceClass];
}

uint64_t __75___DKNetworkQualityMonitor_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isEqualToString:@"predictionsGeneratedAt"])
  {
    v2 = *(void **)(a1 + 40);
    return [v2 updatePredictionAsync];
  }
  else if ([*(id *)(a1 + 32) isEqualToString:@"discretionaryTrafficInvited"])
  {
    v4 = *(void **)(a1 + 40);
    return [v4 updateDiscretionaryTrafficInvited];
  }
  else if ([*(id *)(a1 + 32) isEqualToString:@"linkQuality"])
  {
    v5 = *(void **)(a1 + 40);
    return [v5 updateInstantQuality];
  }
  else if ([*(id *)(a1 + 32) isEqualToString:@"powerCostDL"])
  {
    v6 = *(void **)(a1 + 40);
    return [v6 updatePowerCostDL];
  }
  else if ([*(id *)(a1 + 32) isEqualToString:@"powerCostUL"])
  {
    v7 = *(void **)(a1 + 40);
    return [v7 updatePowerCostUL];
  }
  else
  {
    uint64_t result = [*(id *)(a1 + 32) isEqualToString:@"interfaceClass"];
    if (result)
    {
      v8 = *(void **)(a1 + 40);
      return [v8 updateInterfaceClass];
    }
  }
  return result;
}

uint64_t __60___DKNetworkQualityMonitor_synchronouslyReflectCurrentValue__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateInstantQuality];
}

@end