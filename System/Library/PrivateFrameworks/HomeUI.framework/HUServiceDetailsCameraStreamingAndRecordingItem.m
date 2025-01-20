@interface HUServiceDetailsCameraStreamingAndRecordingItem
- (id)_subclass_updateWithOptions:(id)a3;
@end

@implementation HUServiceDetailsCameraStreamingAndRecordingItem

- (id)_subclass_updateWithOptions:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  v4 = [(HUServiceDetailsAbstractItem *)self sourceServiceItem];
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  v7 = _HULocalizedStringWithDefaultValue(@"HUServiceDetailsCameraStreamingAndRecordingItemDisplayTitle", @"HUServiceDetailsCameraStreamingAndRecordingItemDisplayTitle", 1);
  v8 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v17 = *MEMORY[0x1E4F68AB8];
  v18[0] = v7;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
  v10 = [v8 dictionaryWithDictionary:v9];

  if (!v6
    || ([v6 profile],
        v11 = objc_claimAutoreleasedReturnValue(),
        char v12 = objc_msgSend(v11, "hf_supportsRecordingEvents"),
        v11,
        (v12 & 1) == 0))
  {
    [v10 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68B10]];
  }
  v13 = (void *)MEMORY[0x1E4F7A0D8];
  v14 = [MEMORY[0x1E4F69228] outcomeWithResults:v10];
  v15 = [v13 futureWithResult:v14];

  return v15;
}

@end