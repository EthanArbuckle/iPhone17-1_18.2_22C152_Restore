@interface HUPrimaryUserAutomaticItem
- (HFMediaProfileContainer)mediaProfileContainer;
- (HUPrimaryUserAutomaticItem)initWithMediaProfileContainer:(id)a3;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation HUPrimaryUserAutomaticItem

- (HUPrimaryUserAutomaticItem)initWithMediaProfileContainer:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"HUPrimaryUserAutomaticItem.m", 17, @"Invalid parameter not satisfying: %@", @"mediaProfileContainer" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)HUPrimaryUserAutomaticItem;
  v7 = [(HUPrimaryUserAutomaticItem *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_mediaProfileContainer, a3);
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(HUPrimaryUserAutomaticItem *)self mediaProfileContainer];
  id v6 = (void *)[v4 initWithMediaProfileContainer:v5];

  [v6 copyLatestResultsFromItem:self];
  return v6;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v4 = objc_opt_new();
  [v4 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:*MEMORY[0x1E4F68B10]];
  v5 = NSNumber;
  id v6 = [(HUPrimaryUserAutomaticItem *)self mediaProfileContainer];
  v7 = [v6 settings];
  v8 = objc_msgSend(v5, "numberWithInt:", objc_msgSend(v7, "isControllable") ^ 1);
  [v4 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F68A08]];

  uint64_t v9 = 1;
  v10 = _HULocalizedStringWithDefaultValue(@"HUPrimaryUserSettingsAutomaticSection_Title", @"HUPrimaryUserSettingsAutomaticSection_Title", 1);
  [v4 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  objc_super v11 = [(HUPrimaryUserAutomaticItem *)self mediaProfileContainer];
  v12 = objc_msgSend(v11, "hf_preferredMediaUser");
  if (!v12)
  {
    v13 = [(HUPrimaryUserAutomaticItem *)self mediaProfileContainer];
    v14 = objc_msgSend(v13, "hf_appleMusicCurrentLoggedInAccount");
    if (v14) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = 2;
    }
  }
  v15 = [NSNumber numberWithInteger:v9];
  [v4 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F68BC0]];

  v16 = [(HUPrimaryUserAutomaticItem *)self mediaProfileContainer];
  v17 = objc_msgSend(v16, "hf_dependentHomeKitObjectsForDownstreamItems");
  [v4 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F68908]];

  v18 = [MEMORY[0x1E4F7A0D8] futureWithResult:v4];

  return v18;
}

- (HFMediaProfileContainer)mediaProfileContainer
{
  return self->_mediaProfileContainer;
}

- (void).cxx_destruct
{
}

@end