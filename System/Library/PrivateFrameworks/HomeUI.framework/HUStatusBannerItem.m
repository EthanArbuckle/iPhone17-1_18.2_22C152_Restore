@interface HUStatusBannerItem
+ (id)_networkNameForHomeKitObjects:(id)a3;
+ (id)_sortedRoomNamesForHomeKitObjects:(id)a3;
- (HUStatusBannerItem)initWithSourceItem:(id)a3;
- (id)_descriptionForLocalizedStringKey:(id)a3 representedHomeKitObjects:(id)a4;
- (id)_descriptionForLocalizedStringKey:(id)a3 representedHomeKitObjects:(id)a4 options:(unint64_t)a5;
- (id)_sortedObjectDisplayNamesForHomeKitObjects:(id)a3;
- (id)_subclass_updateWithOptions:(id)a3;
@end

@implementation HUStatusBannerItem

- (HUStatusBannerItem)initWithSourceItem:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HUStatusBannerItem;
  return [(HFTransformItem *)&v4 initWithSourceItem:a3 resultKeyExclusionFilter:MEMORY[0x1E4F1CBF0]];
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F68720]];
  int v6 = [v5 BOOLValue];

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E4F7A0D8];
    v8 = (void *)MEMORY[0x1E4F69228];
    uint64_t v14 = *MEMORY[0x1E4F68B10];
    v15[0] = MEMORY[0x1E4F1CC38];
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    v10 = [v8 outcomeWithResults:v9];
    v11 = [v7 futureWithResult:v10];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)HUStatusBannerItem;
    v9 = [(HFTransformItem *)&v13 _subclass_updateWithOptions:v4];
    v11 = [v9 flatMap:&__block_literal_global_45];
  }

  return v11;
}

id __50__HUStatusBannerItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *MEMORY[0x1E4F68B10];
  id v3 = a2;
  id v4 = [v3 objectForKeyedSubscript:v2];
  char v5 = [v4 BOOLValue];

  if ((v5 & 1) == 0)
  {
    int v6 = (void *)[v3 mutableCopy];

    v7 = _HULocalizedStringWithDefaultValue(@"HUBannerStatus_ViewDetails", @"HUBannerStatus_ViewDetails", 1);
    [v6 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F68948]];

    id v3 = v6;
  }
  v8 = [MEMORY[0x1E4F7A0D8] futureWithResult:v3];

  return v8;
}

- (id)_descriptionForLocalizedStringKey:(id)a3 representedHomeKitObjects:(id)a4
{
  return [(HUStatusBannerItem *)self _descriptionForLocalizedStringKey:a3 representedHomeKitObjects:a4 options:0];
}

- (id)_descriptionForLocalizedStringKey:(id)a3 representedHomeKitObjects:(id)a4 options:(unint64_t)a5
{
  char v5 = a5;
  v35[3] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = objc_opt_new();
  if (v5) {
    [(id)objc_opt_class() _sortedRoomNamesForHomeKitObjects:v9];
  }
  else {
  v11 = [(HUStatusBannerItem *)self _sortedObjectDisplayNamesForHomeKitObjects:v9];
  }
  unint64_t v12 = 0x1E4F29000uLL;
  switch([v11 count])
  {
    case 0:
      if (v5) {
        objc_super v13 = @"%@_ZeroRooms";
      }
      else {
        objc_super v13 = @"%@_ZeroObjects";
      }
      uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", v13, v8);

      break;
    case 1:
      v20 = NSString;
      v21 = @"%@_OneRoom";
      v22 = @"%@_OneObject";
      goto LABEL_15;
    case 2:
      v20 = NSString;
      v21 = @"%@_TwoRooms";
      v22 = @"%@_TwoObjects";
LABEL_15:
      if (v5) {
        v23 = v21;
      }
      else {
        v23 = v22;
      }
      uint64_t v14 = objc_msgSend(v20, "stringWithFormat:", v23, v8);

      id v24 = v11;
      goto LABEL_23;
    case 3:
      if (v5) {
        v25 = @"%@_ThreeRooms";
      }
      else {
        v25 = @"%@_ThreeObjects";
      }
      uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", v25, v8);

      objc_msgSend(v11, "subarrayWithRange:", 0, 2);
      id v24 = (id)objc_claimAutoreleasedReturnValue();
LABEL_23:
      id v26 = v24;

      v10 = v26;
      break;
    default:
      if (v5) {
        v15 = @"%@_MoreThanThreeRooms";
      }
      else {
        v15 = @"%@_MoreThanThreeObjects";
      }
      uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", v15, v8);

      v16 = [v11 objectAtIndexedSubscript:0];
      v35[0] = v16;
      v17 = [v11 objectAtIndexedSubscript:1];
      v35[1] = v17;
      v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "count") - 2);
      v35[2] = v18;
      uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:3];

      unint64_t v12 = 0x1E4F29000;
      v10 = (void *)v19;
      break;
  }
  if ((v5 & 2) != 0)
  {
    v27 = [v14 stringByAppendingString:@"_NetworkName"];
    if (v27)
    {
      v28 = [(id)objc_opt_class() _networkNameForHomeKitObjects:v9];
      if ([v28 length])
      {
        id v29 = v27;

        uint64_t v30 = [v10 arrayByAddingObject:v28];

        v10 = (void *)v30;
        uint64_t v14 = v29;
      }
    }
  }
  v31 = *(void **)(v12 + 24);
  v32 = _HULocalizedStringWithDefaultValue(v14, v14, 1);
  v33 = objc_msgSend(v31, "hf_stringWithFormat:arguments:", v32, v10);

  return v33;
}

+ (id)_networkNameForHomeKitObjects:(id)a3
{
  id v3 = objc_msgSend(a3, "na_map:", &__block_literal_global_119);
  if ([v3 count] == 1)
  {
    id v4 = [v3 anyObject];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

id __52__HUStatusBannerItem__networkNameForHomeKitObjects___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  int v6 = [v5 wifiNetworkInfo];
  v7 = [v6 SSID];

  return v7;
}

+ (id)_sortedRoomNamesForHomeKitObjects:(id)a3
{
  id v3 = objc_msgSend(a3, "na_map:", &__block_literal_global_123);
  id v4 = [v3 allObjects];
  id v5 = [v4 sortedArrayUsingComparator:&__block_literal_global_247];

  return v5;
}

id __56__HUStatusBannerItem__sortedRoomNamesForHomeKitObjects___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = &unk_1F1AD8588;
  id v4 = v2;
  id v5 = v4;
  if (v4)
  {
    if ([v4 conformsToProtocol:v3]) {
      int v6 = v5;
    }
    else {
      int v6 = 0;
    }
    v7 = v5;
    if (v6) {
      goto LABEL_8;
    }
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    id v9 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertProtocolCast(Protocol * _Nonnull __strong, id  _Nonnull __strong)");
    v10 = NSStringFromProtocol((Protocol *)v3);
    [v8 handleFailureInFunction:v9, @"NSObject+NAAdditions.h", 71, @"Expected protocol %@", v10 file lineNumber description];
  }
  v7 = 0;
LABEL_8:

  v11 = objc_msgSend(v7, "hf_safeRoom");
  unint64_t v12 = [v11 name];

  return v12;
}

uint64_t __56__HUStatusBannerItem__sortedRoomNamesForHomeKitObjects___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localizedStandardCompare:");
}

- (id)_sortedObjectDisplayNamesForHomeKitObjects:(id)a3
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__HUStatusBannerItem__sortedObjectDisplayNamesForHomeKitObjects___block_invoke;
  v7[3] = &unk_1E6387968;
  v7[4] = self;
  id v3 = objc_msgSend(a3, "na_map:", v7);
  id v4 = [v3 allObjects];
  id v5 = [v4 sortedArrayUsingComparator:&__block_literal_global_249];

  return v5;
}

id __65__HUStatusBannerItem__sortedObjectDisplayNamesForHomeKitObjects___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 sourceItem];
  id v5 = [v4 displayNameForHomeKitObject:v3];

  return v5;
}

uint64_t __65__HUStatusBannerItem__sortedObjectDisplayNamesForHomeKitObjects___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localizedStandardCompare:");
}

@end