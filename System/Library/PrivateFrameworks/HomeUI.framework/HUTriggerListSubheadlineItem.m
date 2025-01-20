@interface HUTriggerListSubheadlineItem
- (Class)mapsToViewClass;
- (HUTriggerListSubheadlineItem)init;
- (HUTriggerListSubheadlineItem)initWithRemoteAccessInfo:(id)a3;
- (HasRemoteAccessState)remoteAccessInfo;
- (id)_attributedDescription;
- (id)_attributedDescriptionForNoRemoteAccess;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)resultsForRemoteAccessState:(unint64_t)a3;
@end

@implementation HUTriggerListSubheadlineItem

- (HUTriggerListSubheadlineItem)initWithRemoteAccessInfo:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HUTriggerListSubheadlineItem;
  v6 = [(HUTriggerListSubheadlineItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_remoteAccessInfo, a3);
  }

  return v7;
}

- (HUTriggerListSubheadlineItem)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"HUTriggerListSubheadlineItem.m" lineNumber:31 description:@"Use -initWithHome:"];

  return 0;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v4 = [(HUTriggerListSubheadlineItem *)self remoteAccessInfo];

  if (!v4) {
    NSLog(&cfstr_Remoteaccessin.isa);
  }
  id v5 = [(HUTriggerListSubheadlineItem *)self remoteAccessInfo];

  v6 = (void *)MEMORY[0x1E4F7A0D8];
  if (v5)
  {
    v7 = (void *)MEMORY[0x1E4F69228];
    v8 = [(HUTriggerListSubheadlineItem *)self remoteAccessInfo];
    objc_super v9 = -[HUTriggerListSubheadlineItem resultsForRemoteAccessState:](self, "resultsForRemoteAccessState:", objc_msgSend(v8, "hf_remoteAccessState"));
    v10 = [v7 outcomeWithResults:v9];
    v11 = [v6 futureWithResult:v10];
  }
  else
  {
    v8 = objc_msgSend(MEMORY[0x1E4F28C58], "hf_errorWithCode:", 30);
    v11 = [v6 futureWithError:v8];
  }

  return v11;
}

- (id)resultsForRemoteAccessState:(unint64_t)a3
{
  v8[2] = *MEMORY[0x1E4F143B8];
  if (a3 == 1) {
    [(HUTriggerListSubheadlineItem *)self _attributedDescriptionForNoRemoteAccess];
  }
  else {
  v3 = [(HUTriggerListSubheadlineItem *)self _attributedDescription];
  }
  uint64_t v4 = *MEMORY[0x1E4F68AF0];
  v7[0] = *MEMORY[0x1E4F68980];
  v7[1] = v4;
  v8[0] = v3;
  v8[1] = MEMORY[0x1E4F1CC38];
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

- (id)_attributedDescriptionForNoRemoteAccess
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v11 = *MEMORY[0x1E4F42530];
  v2 = [MEMORY[0x1E4F696F8] aboutResidentDeviceURL];
  v12[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];

  id v4 = objc_alloc(MEMORY[0x1E4F28E48]);
  id v5 = _HULocalizedStringWithDefaultValue(@"HUTriggerListHeadlineDescriptionWithoutResident", @"HUTriggerListHeadlineDescriptionWithoutResident", 1);
  v6 = (void *)[v4 initWithString:v5];

  id v7 = objc_alloc(MEMORY[0x1E4F28B18]);
  v8 = _HULocalizedStringWithDefaultValue(@"HUTriggerListHeadlineDescriptionLearnMore", @"HUTriggerListHeadlineDescriptionLearnMore", 1);
  objc_super v9 = (void *)[v7 initWithString:v8 attributes:v3];

  [v6 appendAttributedString:v9];

  return v6;
}

- (id)_attributedDescription
{
  return _HULocalizedStringWithDefaultValue(@"HUTriggerListHeadlineDescription", @"HUTriggerListHeadlineDescription", 1);
}

- (Class)mapsToViewClass
{
  return (Class)objc_opt_class();
}

- (HasRemoteAccessState)remoteAccessInfo
{
  return self->_remoteAccessInfo;
}

- (void).cxx_destruct
{
}

@end