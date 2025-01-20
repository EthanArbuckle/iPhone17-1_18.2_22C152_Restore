@interface HUAppleMusicItem
- (HFMediaProfileContainer)mediaProfileContainer;
- (HUAppleMusicItem)init;
- (HUAppleMusicItem)initWithMediaProfileContainer:(id)a3;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation HUAppleMusicItem

- (HUAppleMusicItem)initWithMediaProfileContainer:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"HUAppleMusicItem.m", 22, @"Invalid parameter not satisfying: %@", @"mediaProfileContainer" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)HUAppleMusicItem;
  v7 = [(HUAppleMusicItem *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_mediaProfileContainer, a3);
  }

  return v8;
}

- (HUAppleMusicItem)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = NSStringFromSelector(sel_initWithMediaProfileContainer_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUAppleMusicItem.m", 33, @"%s is unavailable; use %@ instead",
    "-[HUAppleMusicItem init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(HUAppleMusicItem *)self mediaProfileContainer];
  id v6 = (void *)[v4 initWithMediaProfileContainer:v5];

  [v6 copyLatestResultsFromItem:self];
  return v6;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v4 = [(HUAppleMusicItem *)self mediaProfileContainer];
  v5 = objc_msgSend(v4, "hf_appleMusicCurrentLoggedInAccount");

  id v6 = objc_opt_new();
  if (v5)
  {
    v7 = [v5 username];
    [v6 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

    [v6 setObject:v5 forKeyedSubscript:@"HOAppleMusicAccountKey"];
  }
  v8 = NSNumber;
  v9 = [(HUAppleMusicItem *)self mediaProfileContainer];
  v10 = [v9 settings];
  objc_super v11 = objc_msgSend(v8, "numberWithInt:", objc_msgSend(v10, "isControllable") ^ 1);
  [v6 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F68A08]];

  v12 = [(HUAppleMusicItem *)self mediaProfileContainer];
  v13 = objc_msgSend(v12, "hf_dependentHomeKitObjectsForDownstreamItems");
  [v6 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F68908]];

  v14 = [MEMORY[0x1E4F7A0D8] futureWithResult:v6];

  return v14;
}

- (HFMediaProfileContainer)mediaProfileContainer
{
  return self->_mediaProfileContainer;
}

- (void).cxx_destruct
{
}

@end