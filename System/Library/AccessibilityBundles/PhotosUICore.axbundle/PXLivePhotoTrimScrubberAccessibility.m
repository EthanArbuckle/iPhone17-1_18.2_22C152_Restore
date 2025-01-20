@interface PXLivePhotoTrimScrubberAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilitySupplementaryFooterViews;
- (id)_accessibilityTimeForCMTime:(id *)a3;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (void)_PXLivePhotoTrimScrubber_commonInit;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_loadEndTrimAX;
- (void)_loadKeyFrameAX;
- (void)_loadStartTrimAX;
@end

@implementation PXLivePhotoTrimScrubberAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PXLivePhotoTrimScrubber";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXLivePhotoTrimScrubber", @"_PXLivePhotoTrimScrubber_commonInit", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXLivePhotoTrimScrubber", @"keyTime", "{?=qiIq}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXLivePhotoTrimScrubber", @"trimStartTime", "{?=qiIq}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXLivePhotoTrimScrubber", @"trimEndTime", "{?=qiIq}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXLivePhotoTrimScrubber", @"setKeyTime:", "v", "{?=qiIq}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXLivePhotoTrimScrubber", @"setTrimStartTime:", "v", "{?=qiIq}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXLivePhotoTrimScrubber", @"setTrimEndTime:", "v", "{?=qiIq}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXLivePhotoTrimScrubber", @"handleEndTracking:", "v", "B", 0);
  [v3 validateClass:@"PXLivePhotoTrimScrubber" hasInstanceVariable:@"_trimEndHandle" withType:"UIImageView"];
  [v3 validateClass:@"PXLivePhotoTrimScrubber" hasInstanceVariable:@"_trimStartHandle" withType:"UIImageView"];
  [v3 validateClass:@"PXLivePhotoTrimScrubber" hasInstanceVariable:@"_photoLoupe" withType:"PXLivePhotoTrimScrubberLoupeView"];
  [v3 validateClass:@"PXLivePhotoTrimScrubber" hasInstanceVariable:@"_trimControlHiddenHelper" withType:"PXLivePhotoTrimScrubberHiddenAnimationHelper"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXLivePhotoTrimScrubberHiddenAnimationHelper", @"hidden", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXLivePhotoTrimScrubber", @"delegate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXLivePhotoTrimScrubber", @"delegate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXLivePhotoTrimScrubber", @"_trackingElement", "q", 0);
}

- (id)_accessibilityTimeForCMTime:(id *)a3
{
  CMTime v5 = *(CMTime *)a3;
  CMTimeGetSeconds(&v5);
  id v3 = UIAXTimeStringForDuration();

  return v3;
}

- (void)_loadStartTrimAX
{
  id v3 = [(PXLivePhotoTrimScrubberAccessibility *)self safeUIViewForKey:@"_trimStartHandle"];
  [v3 setIsAccessibilityElement:1];
  v4 = accessibilityPULocalizedString(@"start.trim.handle");
  [v3 setAccessibilityLabel:v4];

  uint64_t v5 = [v3 accessibilityTraits];
  [v3 setAccessibilityTraits:*MEMORY[0x263F1CED8] | v5];
  [v3 _accessibilitySetUserDefinedMediaAnalysisOptions:&unk_26F42DF88];
  objc_initWeak(&location, v3);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __56__PXLivePhotoTrimScrubberAccessibility__loadStartTrimAX__block_invoke;
  v17[3] = &unk_2650A62D0;
  objc_copyWeak(&v18, &location);
  [v3 _setAccessibilityActivationPointBlock:v17];
  objc_initWeak(&from, self);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __56__PXLivePhotoTrimScrubberAccessibility__loadStartTrimAX__block_invoke_2;
  v14[3] = &unk_2650A6320;
  objc_copyWeak(&v15, &from);
  [v3 _setAccessibilityValueBlock:v14];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __56__PXLivePhotoTrimScrubberAccessibility__loadStartTrimAX__block_invoke_4;
  v11[3] = &unk_2650A6370;
  objc_copyWeak(&v13, &from);
  v11[4] = self;
  id v6 = v3;
  id v12 = v6;
  [v6 _accessibilitySetActionBlock:v11 withValue:0 forKey:*MEMORY[0x263F812C0]];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __56__PXLivePhotoTrimScrubberAccessibility__loadStartTrimAX__block_invoke_8;
  v8[3] = &unk_2650A6370;
  objc_copyWeak(&v10, &from);
  v8[4] = self;
  id v7 = v6;
  id v9 = v7;
  [v7 _accessibilitySetActionBlock:v8 withValue:0 forKey:*MEMORY[0x263F81280]];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&from);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

double __56__PXLivePhotoTrimScrubberAccessibility__loadStartTrimAX__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained frame];
  double v4 = v3;
  id v5 = objc_loadWeakRetained(v1);
  [v5 center];

  return v4;
}

id __56__PXLivePhotoTrimScrubberAccessibility__loadStartTrimAX__block_invoke_2(uint64_t a1)
{
  *(void *)&long long v7 = 0;
  *((void *)&v7 + 1) = &v7;
  uint64_t v8 = 0x3810000000;
  id v9 = "";
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v5 = MEMORY[0x263EF8330];
  v1 = (id *)(a1 + 32);
  objc_copyWeak(&v6, (id *)(a1 + 32));
  AXPerformSafeBlock();
  long long v13 = *(_OWORD *)(*((void *)&v7 + 1) + 32);
  uint64_t v14 = *(void *)(*((void *)&v7 + 1) + 48);
  objc_destroyWeak(&v6);
  _Block_object_dispose(&v7, 8);
  id WeakRetained = objc_loadWeakRetained(v1);
  long long v7 = v13;
  uint64_t v8 = v14;
  double v3 = objc_msgSend(WeakRetained, "_accessibilityTimeForCMTime:", &v7, v5, 3221225472, __56__PXLivePhotoTrimScrubberAccessibility__loadStartTrimAX__block_invoke_3, &unk_2650A62F8, &v7);

  return v3;
}

void __56__PXLivePhotoTrimScrubberAccessibility__loadStartTrimAX__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained trimStartTime];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  *(_OWORD *)(v3 + 32) = v4;
  *(void *)(v3 + 48) = v5;
}

uint64_t __56__PXLivePhotoTrimScrubberAccessibility__loadStartTrimAX__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a2;
  time.value = 0;
  *(void *)&time.timescale = &time;
  time.epoch = 0x3810000000;
  v21 = "";
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  v18[1] = (id)MEMORY[0x263EF8330];
  v18[2] = (id)3221225472;
  v18[3] = __56__PXLivePhotoTrimScrubberAccessibility__loadStartTrimAX__block_invoke_5;
  v18[4] = &unk_2650A62F8;
  v18[5] = &time;
  objc_copyWeak(&v19, (id *)(a1 + 48));
  AXPerformSafeBlock();
  CMTime v25 = *(CMTime *)(*(void *)&time.timescale + 32);
  objc_destroyWeak(&v19);
  _Block_object_dispose(&time, 8);
  time.value = 0;
  *(void *)&time.timescale = &time;
  time.epoch = 0x3810000000;
  v21 = "";
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  id v15 = __56__PXLivePhotoTrimScrubberAccessibility__loadStartTrimAX__block_invoke_6;
  v16 = &unk_2650A62F8;
  p_CMTime time = &time;
  objc_copyWeak(v18, (id *)(a1 + 48));
  AXPerformSafeBlock();
  CMTimeValue v4 = *(void *)(*(void *)&time.timescale + 32);
  CMTimeScale v5 = *(_DWORD *)(*(void *)&time.timescale + 40);
  uint64_t v26 = *(void *)(*(void *)&time.timescale + 44);
  int v27 = *(_DWORD *)(*(void *)&time.timescale + 52);
  objc_destroyWeak(v18);
  _Block_object_dispose(&time, 8);
  time.value = v4;
  *(void *)&time.flags = v26;
  time.timescale = v5;
  HIDWORD(time.epoch) = v27;
  if (CMTimeGetSeconds(&time) <= 60.0) {
    double v6 = 0.1;
  }
  else {
    double v6 = 1.0;
  }
  memset(&time, 0, sizeof(time));
  CMTime v12 = v25;
  Float64 Seconds = CMTimeGetSeconds(&v12);
  CMTimeMakeWithSeconds(&time, v6 + Seconds, v5);
  objc_copyWeak(&v10, (id *)(a1 + 48));
  CMTime v11 = time;
  id v9 = *(id *)(a1 + 40);
  AXPerformSafeBlock();

  objc_destroyWeak(&v10);
  return 1;
}

void __56__PXLivePhotoTrimScrubberAccessibility__loadStartTrimAX__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained trimStartTime];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  *(_OWORD *)(v3 + 32) = v4;
  *(void *)(v3 + 48) = v5;
}

void __56__PXLivePhotoTrimScrubberAccessibility__loadStartTrimAX__block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained trimEndTime];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  *(_OWORD *)(v3 + 32) = v4;
  *(void *)(v3 + 48) = v5;
}

void __56__PXLivePhotoTrimScrubberAccessibility__loadStartTrimAX__block_invoke_7(uint64_t a1)
{
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  long long v9 = *(_OWORD *)(a1 + 56);
  uint64_t v10 = *(void *)(a1 + 72);
  [WeakRetained setTrimStartTime:&v9];

  id v4 = objc_loadWeakRetained(v2);
  uint64_t v5 = [v4 safeValueForKey:@"delegate"];

  id v6 = objc_loadWeakRetained(v2);
  [v5 trimScrubber:v6 didEndInteractivelyEditingElement:1 successful:1];

  long long v7 = *(void **)(a1 + 32);
  long long v9 = *(_OWORD *)(a1 + 56);
  uint64_t v10 = *(void *)(a1 + 72);
  uint64_t v8 = [v7 _accessibilityTimeForCMTime:&v9];
  UIAccessibilitySpeak();

  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], *(id *)(a1 + 40));
}

uint64_t __56__PXLivePhotoTrimScrubberAccessibility__loadStartTrimAX__block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = a2;
  time.value = 0;
  *(void *)&time.timescale = &time;
  time.epoch = 0x3810000000;
  uint64_t v23 = "";
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  v20[1] = (id)MEMORY[0x263EF8330];
  v20[2] = (id)3221225472;
  v20[3] = __56__PXLivePhotoTrimScrubberAccessibility__loadStartTrimAX__block_invoke_9;
  v20[4] = &unk_2650A62F8;
  v20[5] = &time;
  objc_copyWeak(&v21, (id *)(a1 + 48));
  AXPerformSafeBlock();
  CMTime v27 = *(CMTime *)(*(void *)&time.timescale + 32);
  objc_destroyWeak(&v21);
  _Block_object_dispose(&time, 8);
  time.value = 0;
  *(void *)&time.timescale = &time;
  time.epoch = 0x3810000000;
  uint64_t v23 = "";
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  v17 = __56__PXLivePhotoTrimScrubberAccessibility__loadStartTrimAX__block_invoke_10;
  id v18 = &unk_2650A62F8;
  p_CMTime time = &time;
  objc_copyWeak(v20, (id *)(a1 + 48));
  AXPerformSafeBlock();
  CMTimeValue v4 = *(void *)(*(void *)&time.timescale + 32);
  CMTimeScale v5 = *(_DWORD *)(*(void *)&time.timescale + 40);
  uint64_t v28 = *(void *)(*(void *)&time.timescale + 44);
  int v29 = *(_DWORD *)(*(void *)&time.timescale + 52);
  objc_destroyWeak(v20);
  _Block_object_dispose(&time, 8);
  time.value = v4;
  time.timescale = v5;
  *(void *)&time.flags = v28;
  HIDWORD(time.epoch) = v29;
  if (CMTimeGetSeconds(&time) <= 60.0) {
    double v6 = 0.1;
  }
  else {
    double v6 = 1.0;
  }
  memset(&time, 0, sizeof(time));
  CMTime v14 = v27;
  Float64 Seconds = CMTimeGetSeconds(&v14);
  CMTimeMakeWithSeconds(&time, Seconds - v6, v5);
  memset(&v14, 0, sizeof(v14));
  CMTimeMakeWithSeconds(&v14, 0.0, v5);
  CMTime time1 = time;
  CMTime time2 = v14;
  if (CMTimeCompare(&time1, &time2) < 0) {
    CMTime time = v14;
  }
  objc_copyWeak(&v10, (id *)(a1 + 48));
  CMTime v11 = time;
  id v9 = *(id *)(a1 + 40);
  AXPerformSafeBlock();

  objc_destroyWeak(&v10);
  return 1;
}

void __56__PXLivePhotoTrimScrubberAccessibility__loadStartTrimAX__block_invoke_9(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained trimStartTime];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  *(_OWORD *)(v3 + 32) = v4;
  *(void *)(v3 + 48) = v5;
}

void __56__PXLivePhotoTrimScrubberAccessibility__loadStartTrimAX__block_invoke_10(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained trimEndTime];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  *(_OWORD *)(v3 + 32) = v4;
  *(void *)(v3 + 48) = v5;
}

void __56__PXLivePhotoTrimScrubberAccessibility__loadStartTrimAX__block_invoke_11(uint64_t a1)
{
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  long long v9 = *(_OWORD *)(a1 + 56);
  uint64_t v10 = *(void *)(a1 + 72);
  [WeakRetained setTrimStartTime:&v9];

  id v4 = objc_loadWeakRetained(v2);
  uint64_t v5 = [v4 safeValueForKey:@"delegate"];

  id v6 = objc_loadWeakRetained(v2);
  [v5 trimScrubber:v6 didEndInteractivelyEditingElement:1 successful:1];

  long long v7 = *(void **)(a1 + 32);
  long long v9 = *(_OWORD *)(a1 + 56);
  uint64_t v10 = *(void *)(a1 + 72);
  uint64_t v8 = [v7 _accessibilityTimeForCMTime:&v9];
  UIAccessibilitySpeak();

  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], *(id *)(a1 + 40));
}

- (void)_loadEndTrimAX
{
  uint64_t v3 = [(PXLivePhotoTrimScrubberAccessibility *)self safeUIViewForKey:@"_trimEndHandle"];
  [v3 setIsAccessibilityElement:1];
  id v4 = accessibilityPULocalizedString(@"end.trim.handle");
  [v3 setAccessibilityLabel:v4];

  uint64_t v5 = [v3 accessibilityTraits];
  [v3 setAccessibilityTraits:*MEMORY[0x263F1CED8] | v5];
  [v3 _accessibilitySetUserDefinedMediaAnalysisOptions:&unk_26F42DF88];
  objc_initWeak(&location, v3);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __54__PXLivePhotoTrimScrubberAccessibility__loadEndTrimAX__block_invoke;
  v17[3] = &unk_2650A62D0;
  objc_copyWeak(&v18, &location);
  [v3 _setAccessibilityActivationPointBlock:v17];
  objc_initWeak(&from, self);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __54__PXLivePhotoTrimScrubberAccessibility__loadEndTrimAX__block_invoke_2;
  v14[3] = &unk_2650A6320;
  objc_copyWeak(&v15, &from);
  [v3 _setAccessibilityValueBlock:v14];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __54__PXLivePhotoTrimScrubberAccessibility__loadEndTrimAX__block_invoke_4;
  v11[3] = &unk_2650A6370;
  objc_copyWeak(&v13, &from);
  v11[4] = self;
  id v6 = v3;
  id v12 = v6;
  [v6 _accessibilitySetActionBlock:v11 withValue:0 forKey:*MEMORY[0x263F812C0]];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __54__PXLivePhotoTrimScrubberAccessibility__loadEndTrimAX__block_invoke_8;
  v8[3] = &unk_2650A6370;
  objc_copyWeak(&v10, &from);
  v8[4] = self;
  id v7 = v6;
  id v9 = v7;
  [v7 _accessibilitySetActionBlock:v8 withValue:0 forKey:*MEMORY[0x263F81280]];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&from);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

double __54__PXLivePhotoTrimScrubberAccessibility__loadEndTrimAX__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained frame];
  double MaxX = CGRectGetMaxX(v6);
  id v4 = objc_loadWeakRetained(v1);
  [v4 center];

  return MaxX;
}

id __54__PXLivePhotoTrimScrubberAccessibility__loadEndTrimAX__block_invoke_2(uint64_t a1)
{
  *(void *)&long long v7 = 0;
  *((void *)&v7 + 1) = &v7;
  uint64_t v8 = 0x3810000000;
  id v9 = "";
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v5 = MEMORY[0x263EF8330];
  v1 = (id *)(a1 + 32);
  objc_copyWeak(&v6, (id *)(a1 + 32));
  AXPerformSafeBlock();
  long long v13 = *(_OWORD *)(*((void *)&v7 + 1) + 32);
  uint64_t v14 = *(void *)(*((void *)&v7 + 1) + 48);
  objc_destroyWeak(&v6);
  _Block_object_dispose(&v7, 8);
  id WeakRetained = objc_loadWeakRetained(v1);
  long long v7 = v13;
  uint64_t v8 = v14;
  uint64_t v3 = objc_msgSend(WeakRetained, "_accessibilityTimeForCMTime:", &v7, v5, 3221225472, __54__PXLivePhotoTrimScrubberAccessibility__loadEndTrimAX__block_invoke_3, &unk_2650A62F8, &v7);

  return v3;
}

void __54__PXLivePhotoTrimScrubberAccessibility__loadEndTrimAX__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained trimEndTime];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  *(_OWORD *)(v3 + 32) = v4;
  *(void *)(v3 + 48) = v5;
}

uint64_t __54__PXLivePhotoTrimScrubberAccessibility__loadEndTrimAX__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v3 = a2;
  time.value = 0;
  *(void *)&time.timescale = &time;
  time.epoch = 0x3810000000;
  uint64_t v28 = "";
  uint64_t v29 = 0;
  uint64_t v30 = 0;
  uint64_t v31 = 0;
  uint64_t v21 = MEMORY[0x263EF8330];
  uint64_t v22 = 3221225472;
  uint64_t v23 = __54__PXLivePhotoTrimScrubberAccessibility__loadEndTrimAX__block_invoke_5;
  uint64_t v24 = &unk_2650A62F8;
  p_CMTime time = &time;
  objc_copyWeak(&v26, (id *)(a1 + 48));
  AXPerformSafeBlock();
  CMTimeValue v4 = *(void *)(*(void *)&time.timescale + 32);
  CMTimeScale v5 = *(_DWORD *)(*(void *)&time.timescale + 40);
  uint64_t v32 = *(void *)(*(void *)&time.timescale + 44);
  int v33 = *(_DWORD *)(*(void *)&time.timescale + 52);
  objc_destroyWeak(&v26);
  _Block_object_dispose(&time, 8);
  time.value = 0;
  *(void *)&time.timescale = &time;
  time.epoch = 0x3810000000;
  uint64_t v28 = "";
  uint64_t v29 = 0;
  uint64_t v30 = 0;
  uint64_t v31 = 0;
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  uint64_t v16 = __54__PXLivePhotoTrimScrubberAccessibility__loadEndTrimAX__block_invoke_6;
  v17 = &unk_2650A62F8;
  id v18 = &time;
  objc_copyWeak(&v19, (id *)(a1 + 48));
  AXPerformSafeBlock();
  CMTime v20 = *(CMTime *)(*(void *)&time.timescale + 32);
  objc_destroyWeak(&v19);
  _Block_object_dispose(&time, 8);
  time.value = v4;
  time.timescale = v5;
  *(void *)&time.flags = v32;
  HIDWORD(time.epoch) = v33;
  if (CMTimeGetSeconds(&time) <= 60.0) {
    double v6 = 0.1;
  }
  else {
    double v6 = 1.0;
  }
  memset(&time, 0, sizeof(time));
  time1.value = v4;
  time1.timescale = v5;
  *(void *)&time1.flags = v32;
  HIDWORD(time1.epoch) = v33;
  Float64 Seconds = CMTimeGetSeconds(&time1);
  CMTimeMakeWithSeconds(&time, v6 + Seconds, v5);
  CMTime time1 = time;
  CMTime time2 = v20;
  if (CMTimeCompare(&time1, &time2) >= 1) {
    CMTime time = v20;
  }
  objc_copyWeak(&v10, (id *)(a1 + 48));
  CMTime v11 = time;
  id v9 = *(id *)(a1 + 40);
  AXPerformSafeBlock();

  objc_destroyWeak(&v10);
  return 1;
}

void __54__PXLivePhotoTrimScrubberAccessibility__loadEndTrimAX__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained trimEndTime];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  *(_OWORD *)(v3 + 32) = v4;
  *(void *)(v3 + 48) = v5;
}

void __54__PXLivePhotoTrimScrubberAccessibility__loadEndTrimAX__block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained untrimmedDuration];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  *(_OWORD *)(v3 + 32) = v4;
  *(void *)(v3 + 48) = v5;
}

void __54__PXLivePhotoTrimScrubberAccessibility__loadEndTrimAX__block_invoke_7(uint64_t a1)
{
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  long long v9 = *(_OWORD *)(a1 + 56);
  uint64_t v10 = *(void *)(a1 + 72);
  [WeakRetained setTrimEndTime:&v9];

  id v4 = objc_loadWeakRetained(v2);
  uint64_t v5 = [v4 safeValueForKey:@"delegate"];

  id v6 = objc_loadWeakRetained(v2);
  [v5 trimScrubber:v6 didEndInteractivelyEditingElement:2 successful:1];

  long long v7 = *(void **)(a1 + 32);
  long long v9 = *(_OWORD *)(a1 + 56);
  uint64_t v10 = *(void *)(a1 + 72);
  uint64_t v8 = [v7 _accessibilityTimeForCMTime:&v9];
  UIAccessibilitySpeak();

  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], *(id *)(a1 + 40));
}

uint64_t __54__PXLivePhotoTrimScrubberAccessibility__loadEndTrimAX__block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a2;
  time.value = 0;
  *(void *)&time.timescale = &time;
  time.epoch = 0x3810000000;
  CMTime v20 = "";
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __54__PXLivePhotoTrimScrubberAccessibility__loadEndTrimAX__block_invoke_9;
  uint64_t v16 = &unk_2650A62F8;
  p_CMTime time = &time;
  objc_copyWeak(&v18, (id *)(a1 + 48));
  AXPerformSafeBlock();
  CMTimeValue v4 = *(void *)(*(void *)&time.timescale + 32);
  CMTimeScale v5 = *(_DWORD *)(*(void *)&time.timescale + 40);
  uint64_t v24 = *(void *)(*(void *)&time.timescale + 44);
  int v25 = *(_DWORD *)(*(void *)&time.timescale + 52);
  objc_destroyWeak(&v18);
  _Block_object_dispose(&time, 8);
  time.value = v4;
  *(void *)&time.flags = v24;
  time.timescale = v5;
  HIDWORD(time.epoch) = v25;
  if (CMTimeGetSeconds(&time) <= 60.0) {
    double v6 = 0.1;
  }
  else {
    double v6 = 1.0;
  }
  memset(&time, 0, sizeof(time));
  v12.value = v4;
  v12.timescale = v5;
  *(void *)&v12.flags = v24;
  HIDWORD(v12.epoch) = v25;
  Float64 Seconds = CMTimeGetSeconds(&v12);
  CMTimeMakeWithSeconds(&time, Seconds - v6, v5);
  objc_copyWeak(&v10, (id *)(a1 + 48));
  CMTime v11 = time;
  id v9 = *(id *)(a1 + 40);
  AXPerformSafeBlock();

  objc_destroyWeak(&v10);
  return 1;
}

void __54__PXLivePhotoTrimScrubberAccessibility__loadEndTrimAX__block_invoke_9(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained trimEndTime];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  *(_OWORD *)(v3 + 32) = v4;
  *(void *)(v3 + 48) = v5;
}

void __54__PXLivePhotoTrimScrubberAccessibility__loadEndTrimAX__block_invoke_10(uint64_t a1)
{
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  long long v9 = *(_OWORD *)(a1 + 56);
  uint64_t v10 = *(void *)(a1 + 72);
  [WeakRetained setTrimEndTime:&v9];

  id v4 = objc_loadWeakRetained(v2);
  uint64_t v5 = [v4 safeValueForKey:@"delegate"];

  id v6 = objc_loadWeakRetained(v2);
  [v5 trimScrubber:v6 didEndInteractivelyEditingElement:2 successful:1];

  long long v7 = *(void **)(a1 + 32);
  long long v9 = *(_OWORD *)(a1 + 56);
  uint64_t v10 = *(void *)(a1 + 72);
  uint64_t v8 = [v7 _accessibilityTimeForCMTime:&v9];
  UIAccessibilitySpeak();

  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], *(id *)(a1 + 40));
}

- (void)_loadKeyFrameAX
{
  uint64_t v3 = [(PXLivePhotoTrimScrubberAccessibility *)self safeUIViewForKey:@"_photoLoupe"];
  [v3 setIsAccessibilityElement:1];
  id v4 = accessibilityPULocalizedString(@"live.photo.keytime");
  [v3 setAccessibilityLabel:v4];

  uint64_t v5 = [v3 accessibilityTraits];
  [v3 setAccessibilityTraits:*MEMORY[0x263F1CED8] | v5];
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __55__PXLivePhotoTrimScrubberAccessibility__loadKeyFrameAX__block_invoke;
  v14[3] = &unk_2650A6320;
  objc_copyWeak(&v15, &location);
  [v3 _setAccessibilityValueBlock:v14];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __55__PXLivePhotoTrimScrubberAccessibility__loadKeyFrameAX__block_invoke_3;
  v11[3] = &unk_2650A6370;
  objc_copyWeak(&v13, &location);
  v11[4] = self;
  id v6 = v3;
  id v12 = v6;
  [v6 _accessibilitySetActionBlock:v11 withValue:0 forKey:*MEMORY[0x263F812C0]];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __55__PXLivePhotoTrimScrubberAccessibility__loadKeyFrameAX__block_invoke_7;
  v8[3] = &unk_2650A6370;
  objc_copyWeak(&v10, &location);
  v8[4] = self;
  id v7 = v6;
  id v9 = v7;
  [v7 _accessibilitySetActionBlock:v8 withValue:0 forKey:*MEMORY[0x263F81280]];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

id __55__PXLivePhotoTrimScrubberAccessibility__loadKeyFrameAX__block_invoke(uint64_t a1)
{
  *(void *)&long long v7 = 0;
  *((void *)&v7 + 1) = &v7;
  uint64_t v8 = 0x3810000000;
  id v9 = "";
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v5 = MEMORY[0x263EF8330];
  v1 = (id *)(a1 + 32);
  objc_copyWeak(&v6, (id *)(a1 + 32));
  AXPerformSafeBlock();
  long long v13 = *(_OWORD *)(*((void *)&v7 + 1) + 32);
  uint64_t v14 = *(void *)(*((void *)&v7 + 1) + 48);
  objc_destroyWeak(&v6);
  _Block_object_dispose(&v7, 8);
  id WeakRetained = objc_loadWeakRetained(v1);
  long long v7 = v13;
  uint64_t v8 = v14;
  uint64_t v3 = objc_msgSend(WeakRetained, "_accessibilityTimeForCMTime:", &v7, v5, 3221225472, __55__PXLivePhotoTrimScrubberAccessibility__loadKeyFrameAX__block_invoke_2, &unk_2650A62F8, &v7);

  return v3;
}

void __55__PXLivePhotoTrimScrubberAccessibility__loadKeyFrameAX__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained keyTime];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  *(_OWORD *)(v3 + 32) = v4;
  *(void *)(v3 + 48) = v5;
}

BOOL __55__PXLivePhotoTrimScrubberAccessibility__loadKeyFrameAX__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  time.value = 0;
  *(void *)&time.timescale = &time;
  time.epoch = 0x3810000000;
  CMTime v27 = "";
  uint64_t v28 = 0;
  uint64_t v29 = 0;
  uint64_t v30 = 0;
  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 3221225472;
  uint64_t v22 = __55__PXLivePhotoTrimScrubberAccessibility__loadKeyFrameAX__block_invoke_4;
  uint64_t v23 = &unk_2650A62F8;
  p_CMTime time = &time;
  objc_copyWeak(&v25, (id *)(a1 + 48));
  AXPerformSafeBlock();
  CMTime v31 = *(CMTime *)(*(void *)&time.timescale + 32);
  objc_destroyWeak(&v25);
  _Block_object_dispose(&time, 8);
  time.value = 0;
  *(void *)&time.timescale = &time;
  time.epoch = 0x3810000000;
  CMTime v27 = "";
  uint64_t v28 = 0;
  uint64_t v29 = 0;
  uint64_t v30 = 0;
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  id v15 = __55__PXLivePhotoTrimScrubberAccessibility__loadKeyFrameAX__block_invoke_5;
  uint64_t v16 = &unk_2650A62F8;
  v17 = &time;
  objc_copyWeak(&v18, (id *)(a1 + 48));
  AXPerformSafeBlock();
  CMTime v19 = *(CMTime *)(*(void *)&time.timescale + 32);
  objc_destroyWeak(&v18);
  _Block_object_dispose(&time, 8);
  CMTime time = v19;
  if (CMTimeGetSeconds(&time) <= 60.0) {
    double v4 = 0.1;
  }
  else {
    double v4 = 1.0;
  }
  memset(&time, 0, sizeof(time));
  CMTime time1 = v31;
  Float64 Seconds = CMTimeGetSeconds(&time1);
  CMTimeMake(&time, (uint64_t)((v4 + Seconds) * 1000.0), 1000);
  CMTime time1 = time;
  CMTime time2 = v19;
  if (CMTimeCompare(&time1, &time2) >= 1) {
    CMTime time = v19;
  }
  CMTime time1 = time;
  CMTime time2 = v19;
  int32_t v6 = CMTimeCompare(&time1, &time2);
  if (v6 <= 0)
  {
    objc_copyWeak(&v9, (id *)(a1 + 48));
    CMTime v10 = time;
    id v8 = *(id *)(a1 + 40);
    AXPerformSafeBlock();

    objc_destroyWeak(&v9);
  }

  return v6 < 1;
}

void __55__PXLivePhotoTrimScrubberAccessibility__loadKeyFrameAX__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained keyTime];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  *(_OWORD *)(v3 + 32) = v4;
  *(void *)(v3 + 48) = v5;
}

void __55__PXLivePhotoTrimScrubberAccessibility__loadKeyFrameAX__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained trimEndTime];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  *(_OWORD *)(v3 + 32) = v4;
  *(void *)(v3 + 48) = v5;
}

void __55__PXLivePhotoTrimScrubberAccessibility__loadKeyFrameAX__block_invoke_6(uint64_t a1)
{
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  long long v4 = [WeakRetained safeValueForKey:@"delegate"];

  id v5 = objc_loadWeakRetained(v2);
  [v4 trimScrubber:v5 didBeginInteractivelyEditingElement:3];

  id v6 = objc_loadWeakRetained(v2);
  long long v10 = *(_OWORD *)(a1 + 56);
  uint64_t v11 = *(void *)(a1 + 72);
  [v6 setKeyTime:&v10];

  id v7 = objc_loadWeakRetained(v2);
  [v7 handleEndTracking:1];

  id v8 = *(void **)(a1 + 32);
  long long v10 = *(_OWORD *)(a1 + 56);
  uint64_t v11 = *(void *)(a1 + 72);
  id v9 = [v8 _accessibilityTimeForCMTime:&v10];
  UIAccessibilitySpeakIfNotSpeaking();

  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], *(id *)(a1 + 40));
}

BOOL __55__PXLivePhotoTrimScrubberAccessibility__loadKeyFrameAX__block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  time.value = 0;
  *(void *)&time.timescale = &time;
  time.epoch = 0x3810000000;
  uint64_t v34 = "";
  uint64_t v35 = 0;
  uint64_t v36 = 0;
  uint64_t v37 = 0;
  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  uint64_t v29 = __55__PXLivePhotoTrimScrubberAccessibility__loadKeyFrameAX__block_invoke_8;
  uint64_t v30 = &unk_2650A62F8;
  p_CMTime time = &time;
  objc_copyWeak(&v32, (id *)(a1 + 48));
  AXPerformSafeBlock();
  CMTime v38 = *(CMTime *)(*(void *)&time.timescale + 32);
  objc_destroyWeak(&v32);
  _Block_object_dispose(&time, 8);
  time.value = 0;
  *(void *)&time.timescale = &time;
  time.epoch = 0x3810000000;
  uint64_t v34 = "";
  uint64_t v35 = 0;
  uint64_t v36 = 0;
  uint64_t v37 = 0;
  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 3221225472;
  uint64_t v22 = __55__PXLivePhotoTrimScrubberAccessibility__loadKeyFrameAX__block_invoke_9;
  uint64_t v23 = &unk_2650A62F8;
  uint64_t v24 = &time;
  objc_copyWeak(&v25, (id *)(a1 + 48));
  AXPerformSafeBlock();
  CMTime v26 = *(CMTime *)(*(void *)&time.timescale + 32);
  objc_destroyWeak(&v25);
  _Block_object_dispose(&time, 8);
  CMTime time = v26;
  if (CMTimeGetSeconds(&time) <= 60.0) {
    double v4 = 0.1;
  }
  else {
    double v4 = 1.0;
  }
  memset(&v19, 0, sizeof(v19));
  CMTime time = v38;
  Float64 Seconds = CMTimeGetSeconds(&time);
  CMTimeMake(&v19, (uint64_t)((Seconds - v4) * 1000.0), 1000);
  time.value = 0;
  *(void *)&time.timescale = &time;
  time.epoch = 0x3810000000;
  uint64_t v34 = "";
  uint64_t v35 = 0;
  uint64_t v36 = 0;
  uint64_t v37 = 0;
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __55__PXLivePhotoTrimScrubberAccessibility__loadKeyFrameAX__block_invoke_10;
  id v15 = &unk_2650A62F8;
  uint64_t v16 = &time;
  objc_copyWeak(&v17, (id *)(a1 + 48));
  AXPerformSafeBlock();
  CMTime v18 = *(CMTime *)(*(void *)&time.timescale + 32);
  objc_destroyWeak(&v17);
  _Block_object_dispose(&time, 8);
  CMTime time = v19;
  CMTime time2 = v18;
  if (CMTimeCompare(&time, &time2) < 0) {
    CMTime v19 = v18;
  }
  CMTime time = v19;
  CMTime time2 = v18;
  int32_t v6 = CMTimeCompare(&time, &time2);
  if ((v6 & 0x80000000) == 0)
  {
    objc_copyWeak(&v9, (id *)(a1 + 48));
    CMTime v10 = v19;
    id v8 = *(id *)(a1 + 40);
    AXPerformSafeBlock();

    objc_destroyWeak(&v9);
  }

  return v6 >= 0;
}

void __55__PXLivePhotoTrimScrubberAccessibility__loadKeyFrameAX__block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained keyTime];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  *(_OWORD *)(v3 + 32) = v4;
  *(void *)(v3 + 48) = v5;
}

void __55__PXLivePhotoTrimScrubberAccessibility__loadKeyFrameAX__block_invoke_9(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained trimEndTime];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  *(_OWORD *)(v3 + 32) = v4;
  *(void *)(v3 + 48) = v5;
}

void __55__PXLivePhotoTrimScrubberAccessibility__loadKeyFrameAX__block_invoke_10(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained trimStartTime];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  *(_OWORD *)(v3 + 32) = v4;
  *(void *)(v3 + 48) = v5;
}

void __55__PXLivePhotoTrimScrubberAccessibility__loadKeyFrameAX__block_invoke_11(uint64_t a1)
{
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  long long v4 = [WeakRetained safeValueForKey:@"delegate"];

  id v5 = objc_loadWeakRetained(v2);
  [v4 trimScrubber:v5 didBeginInteractivelyEditingElement:3];

  id v6 = objc_loadWeakRetained(v2);
  long long v10 = *(_OWORD *)(a1 + 56);
  uint64_t v11 = *(void *)(a1 + 72);
  [v6 setKeyTime:&v10];

  id v7 = objc_loadWeakRetained(v2);
  [v7 handleEndTracking:1];

  id v8 = *(void **)(a1 + 32);
  long long v10 = *(_OWORD *)(a1 + 56);
  uint64_t v11 = *(void *)(a1 + 72);
  id v9 = [v8 _accessibilityTimeForCMTime:&v10];
  UIAccessibilitySpeakIfNotSpeaking();

  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], *(id *)(a1 + 40));
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)PXLivePhotoTrimScrubberAccessibility;
  [(PXLivePhotoTrimScrubberAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(PXLivePhotoTrimScrubberAccessibility *)self _loadStartTrimAX];
  [(PXLivePhotoTrimScrubberAccessibility *)self _loadEndTrimAX];
  [(PXLivePhotoTrimScrubberAccessibility *)self _loadKeyFrameAX];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityPULocalizedString(@"live.photo.scrubber");
}

- (id)accessibilityValue
{
  lhs.value = 0;
  *(void *)&lhs.timescale = &lhs;
  lhs.epoch = 0x3810000000;
  id v25 = "";
  uint64_t v26 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  uint64_t v20 = __58__PXLivePhotoTrimScrubberAccessibility_accessibilityValue__block_invoke;
  uint64_t v21 = &unk_2650A5F20;
  uint64_t v22 = self;
  p_CMTime lhs = &lhs;
  AXPerformSafeBlock();
  CMTime v29 = *(CMTime *)(*(void *)&lhs.timescale + 32);
  _Block_object_dispose(&lhs, 8);
  lhs.value = 0;
  *(void *)&lhs.timescale = &lhs;
  lhs.epoch = 0x3810000000;
  id v25 = "";
  uint64_t v26 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __58__PXLivePhotoTrimScrubberAccessibility_accessibilityValue__block_invoke_2;
  uint64_t v14 = &unk_2650A5F20;
  id v15 = self;
  uint64_t v16 = &lhs;
  AXPerformSafeBlock();
  CMTime v17 = *(CMTime *)(*(void *)&lhs.timescale + 32);
  _Block_object_dispose(&lhs, 8);
  memset(&v10, 0, sizeof(v10));
  CMTime lhs = v17;
  CMTime rhs = v29;
  CMTimeSubtract(&v10, &lhs, &rhs);
  CMTime lhs = v10;
  objc_super v3 = [(PXLivePhotoTrimScrubberAccessibility *)self _accessibilityTimeForCMTime:&lhs];
  lhs.value = 0;
  *(void *)&lhs.timescale = &lhs;
  lhs.epoch = 0x3810000000;
  id v25 = "";
  uint64_t v26 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  AXPerformSafeBlock();
  CMTime rhs = *(CMTime *)(*(void *)&lhs.timescale + 32);
  _Block_object_dispose(&lhs, 8);
  CMTime lhs = rhs;
  long long v4 = [(PXLivePhotoTrimScrubberAccessibility *)self _accessibilityTimeForCMTime:&lhs];
  id v5 = accessibilityPULocalizedString(@"live.photo.duration");
  id v8 = accessibilityPULocalizedString(@"live.photo.keytime");
  id v6 = __UIAXStringForVariables();

  return v6;
}

double __58__PXLivePhotoTrimScrubberAccessibility_accessibilityValue__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) trimStartTime];
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  double result = *(double *)&v4;
  *(_OWORD *)(v2 + 32) = v4;
  *(void *)(v2 + 48) = v5;
  return result;
}

double __58__PXLivePhotoTrimScrubberAccessibility_accessibilityValue__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) trimEndTime];
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  double result = *(double *)&v4;
  *(_OWORD *)(v2 + 32) = v4;
  *(void *)(v2 + 48) = v5;
  return result;
}

double __58__PXLivePhotoTrimScrubberAccessibility_accessibilityValue__block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) keyTime];
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  double result = *(double *)&v4;
  *(_OWORD *)(v2 + 32) = v4;
  *(void *)(v2 + 48) = v5;
  return result;
}

- (id)accessibilityHint
{
  uint64_t v2 = [(PXLivePhotoTrimScrubberAccessibility *)self safeValueForKey:@"_trimControlHiddenHelper"];
  int v3 = [v2 safeBoolForKey:@"hidden"];

  if (v3)
  {
    long long v4 = accessibilityPULocalizedString(@"scrubber.hint");
  }
  else
  {
    long long v4 = 0;
  }

  return v4;
}

- (id)_accessibilitySupplementaryFooterViews
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v4 = [(PXLivePhotoTrimScrubberAccessibility *)self accessibilityTraits];
  if ((*MEMORY[0x263F1CF20] & v4) == 0)
  {
    uint64_t v5 = [(PXLivePhotoTrimScrubberAccessibility *)self safeUIViewForKey:@"_trimStartHandle"];
    [v3 axSafelyAddObject:v5];

    id v6 = [(PXLivePhotoTrimScrubberAccessibility *)self safeUIViewForKey:@"_photoLoupe"];
    [v3 axSafelyAddObject:v6];

    id v7 = [(PXLivePhotoTrimScrubberAccessibility *)self safeUIViewForKey:@"_trimEndHandle"];
    [v3 axSafelyAddObject:v7];
  }

  return v3;
}

- (void)_PXLivePhotoTrimScrubber_commonInit
{
  v3.receiver = self;
  v3.super_class = (Class)PXLivePhotoTrimScrubberAccessibility;
  [(PXLivePhotoTrimScrubberAccessibility *)&v3 _PXLivePhotoTrimScrubber_commonInit];
  [(PXLivePhotoTrimScrubberAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end