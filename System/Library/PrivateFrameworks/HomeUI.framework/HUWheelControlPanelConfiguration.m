@interface HUWheelControlPanelConfiguration
- (Class)cellClass;
- (HUControlPanelRule)rule;
- (void)setupControlsForCell:(id)a3 item:(id)a4;
@end

@implementation HUWheelControlPanelConfiguration

- (HUControlPanelRule)rule
{
  v2 = +[HUControlPanelFilterRule ruleWithFilter:&__block_literal_global_178];
  [v2 setPriority:100.0];

  return (HUControlPanelRule *)v2;
}

uint64_t __40__HUWheelControlPanelConfiguration_rule__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 controlItems];
  v3 = [v2 anyObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [v3 incrementalCharacteristicType];
    uint64_t v5 = [v4 isEqualToString:*MEMORY[0x1E4F2D020]];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (void)setupControlsForCell:(id)a3 item:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_class();
  id v8 = v5;
  id v15 = v8;
  if (!v8) {
    goto LABEL_7;
  }
  if (objc_opt_isKindOfClass()) {
    v9 = v15;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;
  id v8 = v15;
  v11 = v15;
  if (!v10)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    v13 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v12 handleFailureInFunction:v13, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v7, objc_opt_class() file lineNumber description];

    id v8 = v15;
LABEL_7:
    v11 = 0;
  }

  [v11 setItem:v6];
  if (([MEMORY[0x1E4F69758] useMacIdiom] & 1) == 0)
  {
    v14 = objc_alloc_init(HUWheelControlView);
    [v11 setWheelView:v14];
  }
}

@end