@interface HUCameraStreamAndRecordStateInfoProvider
- (HUCameraStreamAndRecordStateInfoProvider)initWithDisplayStyle:(unint64_t)a3;
@end

@implementation HUCameraStreamAndRecordStateInfoProvider

- (HUCameraStreamAndRecordStateInfoProvider)initWithDisplayStyle:(unint64_t)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v4 = objc_opt_new();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__HUCameraStreamAndRecordStateInfoProvider_initWithDisplayStyle___block_invoke;
  aBlock[3] = &__block_descriptor_40_e38___NSAttributedString_16__0__NSNumber_8l;
  aBlock[4] = a3;
  v5 = _Block_copy(aBlock);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v6 = [&unk_1F19B58B8 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    uint64_t v9 = 1;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(&unk_1F19B58B8);
        }
        uint64_t v11 = *(void *)(*((void *)&v22 + 1) + 8 * v10);
        id v12 = objc_alloc(MEMORY[0x1E4F695C0]);
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __65__HUCameraStreamAndRecordStateInfoProvider_initWithDisplayStyle___block_invoke_2;
        v19[3] = &unk_1E63895B0;
        uint64_t v21 = v9 + v10;
        id v13 = v5;
        v19[4] = v11;
        id v20 = v13;
        v14 = (void *)[v12 initWithResultsBlock:v19];
        [v4 addObject:v14];

        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [&unk_1F19B58B8 countByEnumeratingWithState:&v22 objects:v27 count:16];
      v9 += v10;
    }
    while (v7);
  }
  v18.receiver = self;
  v18.super_class = (Class)HUCameraStreamAndRecordStateInfoProvider;
  v15 = -[HFStaticItemProvider initWithItems:](&v18, sel_initWithItems_, v4, self);

  return v15;
}

id __65__HUCameraStreamAndRecordStateInfoProvider_initWithDisplayStyle___block_invoke(uint64_t a1, void *a2)
{
  v3 = HUImageIdentifierForStreamingOption([a2 unsignedIntegerValue]);
  v4 = [NSString stringWithFormat:@"HUCameraStreamingSettingsHeaderDisplayStyleServiceDetails_%@_Title", v3];
  v5 = _HULocalizedStringWithDefaultValue(v4, v4, 1);

  uint64_t v6 = [NSString stringWithFormat:@"HUCameraStreamingSettingsHeaderDisplayStyleServiceDetails_%@_Body", v3];
  uint64_t v7 = _HULocalizedStringWithDefaultValue(v6, v6, 1);

  uint64_t v8 = HUCameraBuildFeatureDescriptionAttributedString(*(void *)(a1 + 32), v5, v7);

  return v8;
}

id __65__HUCameraStreamAndRecordStateInfoProvider_initWithDisplayStyle___block_invoke_2(uint64_t a1)
{
  v2 = objc_opt_new();
  v3 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
  [v2 setObject:v3 forKeyedSubscript:*MEMORY[0x1E4F68B48]];

  v4 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [v2 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F68980]];

  id v5 = objc_alloc(MEMORY[0x1E4F691D0]);
  uint64_t v6 = HUImageIdentifierForStreamingOption([*(id *)(a1 + 32) unsignedIntegerValue]);
  uint64_t v7 = (void *)[v5 initWithImageIdentifier:v6];
  [v2 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F689E8]];

  uint64_t v8 = [MEMORY[0x1E4F7A0D8] futureWithResult:v2];

  return v8;
}

@end