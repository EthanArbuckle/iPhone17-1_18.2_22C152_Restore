@interface PRXCardContentViewController(HUAdditions)
- (uint64_t)addLearnMoreButtonWithTarget:()HUAdditions action:userInfo:;
- (uint64_t)addMoreOptionsButtonWithTarget:()HUAdditions action:userInfo:;
- (void)_handleSubtitleTouchForOpenURL:()HUAdditions;
- (void)addLearnMoreButtonWithURL:()HUAdditions;
- (void)appendButtonWithKey:()HUAdditions target:action:userInfo:;
- (void)openURL:()HUAdditions;
@end

@implementation PRXCardContentViewController(HUAdditions)

- (void)addLearnMoreButtonWithURL:()HUAdditions
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v7 = @"URL_KEY";
  v8[0] = a3;
  v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  v6 = [v4 dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [a1 addLearnMoreButtonWithTarget:a1 action:sel__handleSubtitleTouchForOpenURL_ userInfo:v6];
}

- (uint64_t)addLearnMoreButtonWithTarget:()HUAdditions action:userInfo:
{
  return [a1 appendButtonWithKey:@"HUProximityCardSubtitleLearnMoreButton" target:a3 action:a4 userInfo:a5];
}

- (uint64_t)addMoreOptionsButtonWithTarget:()HUAdditions action:userInfo:
{
  return [a1 appendButtonWithKey:@"HUProximityCardSubtitleMoreOptionsButton" target:a3 action:a4 userInfo:a5];
}

- (void)appendButtonWithKey:()HUAdditions target:action:userInfo:
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a6;
  id v11 = a4;
  v12 = [a1 subtitle];

  if (!v12) {
    [a1 setSubtitle:@" "];
  }
  v13 = [a1 contentView];
  v14 = [v13 subtitleLabel];

  if (v12)
  {
    v15 = _HULocalizedStringWithDefaultValue(v9, v9, 1);
  }
  else
  {
    v16 = [NSString stringWithFormat:@"%@_withNilSubtitle", v9];
    v15 = _HULocalizedStringWithDefaultValue(v16, v16, 1);
  }
  id v17 = objc_alloc(MEMORY[0x1E4F28B18]);
  uint64_t v27 = *MEMORY[0x1E4F42510];
  v18 = objc_msgSend(MEMORY[0x1E4F428B8], "hf_keyColor");
  v28[0] = v18;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
  v20 = (void *)[v17 initWithString:v15 attributes:v19];

  if (v12)
  {
    id v21 = objc_alloc(MEMORY[0x1E4F28E48]);
    v22 = [a1 subtitle];
    v23 = (void *)[v21 initWithString:v22];

    [v23 appendAttributedString:v20];
    v24 = (void *)[v23 copy];
    [v14 setAttributedText:v24];
  }
  else
  {
    [v14 setAttributedText:v20];
  }
  [v14 setUserInteractionEnabled:1];
  v25 = [[HUStringInLabelTapGestureRecognizer alloc] initWithTarget:v11 action:a5 hitBoxString:v15 userInfo:v10];

  [v14 addGestureRecognizer:v25];
}

- (void)openURL:()HUAdditions
{
  v4 = (objc_class *)MEMORY[0x1E4F3AEB8];
  id v5 = a3;
  id v7 = (id)[[v4 alloc] initWithURL:v5];

  [v7 setModalPresentationStyle:1];
  v6 = objc_msgSend(MEMORY[0x1E4F428B8], "hf_keyColor");
  [v7 setPreferredControlTintColor:v6];

  [a1 presentViewController:v7 animated:1 completion:0];
}

- (void)_handleSubtitleTouchForOpenURL:()HUAdditions
{
  v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"URL_KEY"];

  if (v5)
  {
    [a1 openURL:v5];
  }
  else
  {
    v6 = HFLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v7 = 0;
      _os_log_error_impl(&dword_1BE345000, v6, OS_LOG_TYPE_ERROR, "learn more pressed w/ url intention but no url found", v7, 2u);
    }

    NSLog(&cfstr_LearnMorePress.isa);
  }
}

@end