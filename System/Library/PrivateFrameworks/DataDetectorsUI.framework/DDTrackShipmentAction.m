@interface DDTrackShipmentAction
- (BOOL)canBePerformedByOpeningURL;
- (id)iconName;
- (id)localizedName;
- (id)notificationIconBundleIdentifier;
- (id)notificationTitle;
- (id)notificationURL;
- (id)quickActionTitle;
- (void)performFromView:(id)a3;
@end

@implementation DDTrackShipmentAction

- (id)localizedName
{
  return DDLocalizedString(@"Track Shipment");
}

- (id)iconName
{
  return @"cube.box";
}

- (id)quickActionTitle
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v3 = [(NSDictionary *)self->super._context objectForKeyedSubscript:@"AllResults", 0, 0];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (!v4) {
    goto LABEL_15;
  }
  uint64_t v5 = v4;
  uint64_t v6 = 0;
  uint64_t v7 = *(void *)v17;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v17 != v7) {
      objc_enumerationMutation(v3);
    }
    if (!DDResultHasType()) {
      goto LABEL_9;
    }
    if (v6) {
      break;
    }
    uint64_t v6 = 1;
LABEL_9:
    if (v5 == ++v8)
    {
      uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v5) {
        goto LABEL_3;
      }
      goto LABEL_15;
    }
  }
  if (DDResultHasType())
  {
    CFArrayRef SubResults = (const __CFArray *)DDResultGetSubResults();
    if (CFArrayGetCount(SubResults) == 1)
    {
      CFArrayGetValueAtIndex(SubResults, 0);
      v10 = DDResultGetMatchedString();
      v11 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"];
      v12 = [v11 invertedSet];
      v13 = [v10 componentsSeparatedByCharactersInSet:v12];
      v14 = [v13 componentsJoinedByString:&stru_1EF5023D8];

      goto LABEL_16;
    }
  }
LABEL_15:

  v14 = [(DDTrackShipmentAction *)self localizedName];
LABEL_16:
  return v14;
}

- (void)performFromView:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [(DDTrackShipmentAction *)self notificationURL];
  if (v4) {
    [(DDAction *)self _performFromView:v5 byOpeningURL:v4];
  }
}

- (id)notificationTitle
{
  v2 = NSString;
  v3 = DDLocalizedString(@"Track shipment “%@” in Safari");
  uint64_t v4 = objc_msgSend(v2, "stringWithFormat:", v3, DDResultGetMatchedString());

  return v4;
}

- (id)notificationIconBundleIdentifier
{
  return @"com.apple.mobilesafari";
}

- (id)notificationURL
{
  if (!self->super._result) {
    DDUILogAssertionFailure((uint64_t)"_result != NULL", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/MobileDataDetectorsUI/Actions/DDAction.m", (uint64_t)"-[DDTrackShipmentAction notificationURL]", 1614, @"Expecting a result", v2, v3, v4, v6);
  }
  return DDShipmentTrackingUrlForResult();
}

- (BOOL)canBePerformedByOpeningURL
{
  return 1;
}

@end