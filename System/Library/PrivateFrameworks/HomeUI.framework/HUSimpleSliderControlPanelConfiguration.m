@interface HUSimpleSliderControlPanelConfiguration
- (Class)cellClass;
- (HUControlPanelRule)rule;
- (void)setupControlsForCell:(id)a3 item:(id)a4;
@end

@implementation HUSimpleSliderControlPanelConfiguration

- (HUControlPanelRule)rule
{
  uint64_t v2 = objc_opt_class();

  return (HUControlPanelRule *)+[HUControlPanelClassRule ruleWithControlItemClass:v2];
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
  id v25 = v8;
  if (!v8) {
    goto LABEL_7;
  }
  if (objc_opt_isKindOfClass()) {
    v9 = v25;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;
  id v8 = v25;
  v11 = v25;
  if (!v10)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    v13 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v12 handleFailureInFunction:v13, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v7, objc_opt_class() file lineNumber description];

    id v8 = v25;
LABEL_7:
    v11 = 0;
  }

  uint64_t v14 = objc_opt_class();
  v15 = [v6 controlItems];
  id v16 = [v15 anyObject];
  if (v16)
  {
    if (objc_opt_isKindOfClass()) {
      v17 = v16;
    }
    else {
      v17 = 0;
    }
    v18 = v16;
    if (v17) {
      goto LABEL_15;
    }
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    v20 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v19 handleFailureInFunction:v20, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v14, objc_opt_class() file lineNumber description];
  }
  v18 = 0;
LABEL_15:

  v21 = objc_alloc_init(HUSimpleSliderControlView);
  v22 = [v6 identifierForControlItem:v18];
  [(HUSimpleSliderControlView *)v21 setIdentifier:v22];

  v23 = [v18 minValue];
  [v23 floatValue];
  -[HUSimpleSliderControlView setMinValue:](v21, "setMinValue:");

  v24 = [v18 maxValue];
  [v24 floatValue];
  -[HUSimpleSliderControlView setMaxValue:](v21, "setMaxValue:");

  [v11 setSliderView:v21];
}

@end