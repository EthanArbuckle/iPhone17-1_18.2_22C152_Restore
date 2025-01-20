@interface HFCameraClipSignificantEventItem
- (HFCameraClipSignificantEventItem)initWithSignificantEvent:(id)a3 home:(id)a4;
- (HMCameraProfile)cameraProfile;
- (HMHome)home;
- (id)_homeKitObjectFetch;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
@end

@implementation HFCameraClipSignificantEventItem

- (HFCameraClipSignificantEventItem)initWithSignificantEvent:(id)a3 home:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HFCameraClipSignificantEventItem;
  v8 = [(HFFetchedHomeKitObjectItem *)&v12 initWithHomeKitObject:v6];
  if (v8)
  {
    uint64_t v9 = objc_msgSend(v7, "hf_cameraProfileForSignificantEvent:", v6);
    cameraProfile = v8->_cameraProfile;
    v8->_cameraProfile = (HMCameraProfile *)v9;

    objc_storeStrong((id *)&v8->_home, a4);
  }

  return v8;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)HFCameraClipSignificantEventItem;
  v3 = [(HFItem *)&v8 description];
  v4 = NSString;
  v5 = [(HFCameraClipSignificantEventItem *)self event];
  id v6 = [v4 stringWithFormat:@"%@ event:%@", v3, v5];

  return v6;
}

- (id)debugDescription
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(HFFetchedHomeKitObjectItem *)self homeKitObject];
  id v7 = [v3 stringWithFormat:@"<%@: %p, %@>", v5, self, v6];

  return v7;
}

- (id)_homeKitObjectFetch
{
  v3 = [(HFCameraClipSignificantEventItem *)self cameraProfile];
  v4 = [(HFCameraClipSignificantEventItem *)self event];
  v5 = [v4 uniqueIdentifier];
  id v6 = objc_msgSend(v3, "hf_significantEventWithIdentifier:", v5);

  return v6;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HFCameraClipSignificantEventItem;
  v4 = [(HFFetchedHomeKitObjectItem *)&v8 _subclass_updateWithOptions:a3];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__HFCameraClipSignificantEventItem__subclass_updateWithOptions___block_invoke;
  v7[3] = &unk_26408E470;
  v7[4] = self;
  v5 = [v4 flatMap:v7];

  return v5;
}

id __64__HFCameraClipSignificantEventItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)[a2 mutableCopy];
  v4 = NSNumber;
  v5 = [*(id *)(a1 + 32) event];
  id v6 = objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v5, "reason"));
  [v3 setObject:v6 forKeyedSubscript:@"HFResultCameraSignificantEventReasonKey"];

  id v7 = [*(id *)(a1 + 32) event];
  objc_super v8 = [v7 dateOfOccurrence];
  [v3 setObject:v8 forKeyedSubscript:@"HFResultCameraSignificantEventDateKey"];

  uint64_t v9 = NSNumber;
  v10 = [*(id *)(a1 + 32) event];
  v11 = objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v10, "confidenceLevel"));
  [v3 setObject:v11 forKeyedSubscript:@"HFResultCameraSignificantEventConfidenceLevelKey"];

  [v3 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:@"shouldDisableForNonAdminUsers"];
  objc_super v12 = [*(id *)(a1 + 32) event];
  v13 = [v12 faceClassification];

  if (v13)
  {
    v14 = [*(id *)(a1 + 32) event];
    v15 = [v14 faceClassification];
    [v3 setObject:v15 forKeyedSubscript:@"HFResultCameraSignificantEventFaceClassificationKey"];
  }
  v16 = [MEMORY[0x263F58190] futureWithResult:v3];

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(HFCameraClipSignificantEventItem *)self event];
  id v6 = [(HFCameraClipSignificantEventItem *)self home];
  id v7 = (void *)[v4 initWithSignificantEvent:v5 home:v6];

  [v7 copyLatestResultsFromItem:self];
  return v7;
}

- (HMCameraProfile)cameraProfile
{
  return self->_cameraProfile;
}

- (HMHome)home
{
  return self->_home;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_cameraProfile, 0);
}

@end