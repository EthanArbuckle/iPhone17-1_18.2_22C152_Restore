@interface HUSwitchControlPanelConfiguration
- (BOOL)shouldShowSectionTitleForItem:(id)a3;
- (Class)cellClass;
- (HUControlPanelRule)rule;
- (id)valueTransformerForControlItem:(id)a3;
- (void)setupControlsForCell:(id)a3 item:(id)a4;
@end

@implementation HUSwitchControlPanelConfiguration

- (HUControlPanelRule)rule
{
  return (HUControlPanelRule *)+[HUControlPanelClassRule ruleWithControlItemProtocol:&unk_1F1AD9090];
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (void)setupControlsForCell:(id)a3 item:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = objc_opt_class();
  id v10 = v7;
  id v23 = v10;
  if (!v10) {
    goto LABEL_7;
  }
  if (objc_opt_isKindOfClass()) {
    v11 = v23;
  }
  else {
    v11 = 0;
  }
  id v12 = v11;
  id v10 = v23;
  v13 = v23;
  if (!v12)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    v15 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v14 handleFailureInFunction:v15, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v9, objc_opt_class() file lineNumber description];

    id v10 = v23;
LABEL_7:
    v13 = 0;
  }

  v16 = [v8 controlItems];
  v17 = [v16 anyObject];

  if (([v17 conformsToProtocol:&unk_1F1AD9090] & 1) == 0)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"HUControlPanelConfiguration.m", 227, @"Invalid parameter not satisfying: %@", @"[controlItem conformsToProtocol:@protocol(HFPrimaryStateWriter)]" object file lineNumber description];
  }
  v18 = objc_alloc_init(HUSwitchControlView);
  v19 = [v8 identifierForControlItem:v17];
  [(HUSwitchControlView *)v18 setIdentifier:v19];

  [v13 setControlView:v18];
  v20 = [v8 latestResults];
  v21 = [v20 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  [v13 setControlTitle:v21];
}

- (id)valueTransformerForControlItem:(id)a3
{
  if ([a3 conformsToProtocol:&unk_1F1AD9090])
  {
    v3 = [MEMORY[0x1E4F69760] transformerForValueClass:objc_opt_class() transformBlock:&__block_literal_global_148 reverseTransformBlock:&__block_literal_global_161];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

uint64_t __68__HUSwitchControlPanelConfiguration_valueTransformerForControlItem___block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  BOOL v3 = [a2 integerValue] == 2;

  return [v2 numberWithInt:v3];
}

uint64_t __68__HUSwitchControlPanelConfiguration_valueTransformerForControlItem___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  if ([a2 BOOLValue]) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 1;
  }

  return [v2 numberWithInteger:v3];
}

- (BOOL)shouldShowSectionTitleForItem:(id)a3
{
  return 0;
}

@end