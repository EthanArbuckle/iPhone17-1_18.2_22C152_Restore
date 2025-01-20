@interface HearingTestPreEvaluationCoachingViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axIsPlayingTones;
- (id)_axPlayToneButton;
- (int)_axAnnouncementState;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axAnnouncementFinished;
- (void)_axBeforePlayingTones;
- (void)_axHandleElementFocusedNotification:(id)a3;
- (void)_axPlayToneButton;
- (void)_axSetAnnouncementState:(int)a3;
- (void)_axSetIsPlayingTones:(BOOL)a3;
- (void)_axSetupSubviews;
- (void)_axStartAnnouncement;
- (void)_axStopPlayingTones;
- (void)cleanUp;
- (void)didTapPlaySample;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation HearingTestPreEvaluationCoachingViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HearingTestUI.HearingTestPreEvaluationCoachingViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_axIsPlayingTones
{
  return MEMORY[0x270F0A438](self, &__HearingTestPreEvaluationCoachingViewControllerAccessibility___axIsPlayingTones);
}

- (void)_axSetIsPlayingTones:(BOOL)a3
{
}

- (int)_axAnnouncementState
{
  return MEMORY[0x270F0A450](self, &__HearingTestPreEvaluationCoachingViewControllerAccessibility___axAnnouncementState);
}

- (void)_axSetAnnouncementState:(int)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"HearingTestUI.HearingTestPreEvaluationCoachingViewController" isKindOfClass:@"OBWelcomeController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HearingTestUI.HearingTestPreEvaluationCoachingViewController", @"didTapPlaySample", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HearingTestUI.HearingTestPreEvaluationCoachingViewController", @"cleanUp", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"OBWelcomeController", @"secondaryContentView", "@", 0);
  [v3 validateClass:@"HearingTestUI.HearingTestPreEvaluationCoachingViewController" hasSwiftField:@"supportsSampleTone" withSwiftType:"Bool"];
  [v3 validateClass:@"HearingTestUI.HearingTestPreEvaluationCoachingViewController" hasSwiftFieldOfAnyClass:@"playToneImageView"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_2421AF000, v0, v1, "Coaching: supportsSampleTone %d", v2, v3, v4, v5, v6);
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HearingTestPreEvaluationCoachingViewControllerAccessibility;
  [(HearingTestPreEvaluationCoachingViewControllerAccessibility *)&v4 viewWillAppear:a3];
  [(HearingTestPreEvaluationCoachingViewControllerAccessibility *)self _axSetupSubviews];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HearingTestPreEvaluationCoachingViewControllerAccessibility;
  [(HearingTestPreEvaluationCoachingViewControllerAccessibility *)&v7 viewWillDisappear:a3];
  if ([(HearingTestPreEvaluationCoachingViewControllerAccessibility *)self safeSwiftBoolForKey:@"supportsSampleTone"])
  {
    [(HearingTestPreEvaluationCoachingViewControllerAccessibility *)self _axStopPlayingTones];
    objc_super v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 removeObserver:self name:*MEMORY[0x263F1CDF8] object:0];

    uint64_t v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 removeObserver:self name:*MEMORY[0x263F1CDB0] object:0];

    uint8_t v6 = AXLogHearingTest();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[HearingTestPreEvaluationCoachingViewControllerAccessibility viewWillDisappear:]();
    }
  }
}

- (void)didTapPlaySample
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2421AF000, v0, v1, "Coaching: didTapPlaySample", v2, v3, v4, v5, v6);
}

- (void)cleanUp
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2421AF000, v0, v1, "Coaching: cleanUp", v2, v3, v4, v5, v6);
}

- (void)_axStartAnnouncement
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2421AF000, v0, v1, "Coaching: Starting announcement", v2, v3, v4, v5, v6);
}

- (void)_axAnnouncementFinished
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_2421AF000, v0, v1, "Coaching: AnnouncementFinished isPlayingTones: %d", v2, v3, v4, v5, v6);
}

- (void)_axHandleElementFocusedNotification:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  uint64_t v5 = __UIAccessibilityCastAsClass();
  uint8_t v6 = [v5 navigationController];
  objc_super v7 = [v6 viewControllers];
  v8 = [v5 navigationController];
  v9 = [v8 viewControllers];
  v10 = objc_msgSend(v7, "axSafeObjectAtIndex:", objc_msgSend(v9, "count") - 1);

  if (v10 == v5)
  {
    v11 = [v4 userInfo];
    v12 = [v11 objectForKeyedSubscript:*MEMORY[0x263F1CE00]];

    v13 = [v4 userInfo];
    v14 = [v13 objectForKeyedSubscript:*MEMORY[0x263F1CF70]];

    v15 = AXLogHearingTest();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      [(HearingTestPreEvaluationCoachingViewControllerAccessibility *)v12 _axHandleElementFocusedNotification:v15];
    }

    uint64_t v16 = [(HearingTestPreEvaluationCoachingViewControllerAccessibility *)self _axPlayToneButton];
    v17 = (void *)v16;
    if (v12)
    {
      v18 = [v5 presentedViewController];

      if (!v18)
      {
        v20 = AXLogHearingTest();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
          -[HearingTestPreEvaluationCoachingViewControllerAccessibility _axHandleElementFocusedNotification:]();
        }

        if (v12 == v17) {
          [(HearingTestPreEvaluationCoachingViewControllerAccessibility *)self _axStartAnnouncement];
        }
        else {
          [(HearingTestPreEvaluationCoachingViewControllerAccessibility *)self _axSetAnnouncementState:0];
        }
        goto LABEL_17;
      }
      [(HearingTestPreEvaluationCoachingViewControllerAccessibility *)self _axSetAnnouncementState:0];
      v19 = AXLogHearingTest();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        -[HearingTestPreEvaluationCoachingViewControllerAccessibility _axHandleElementFocusedNotification:]();
      }
    }
    else
    {
      if (v14 != (void *)v16)
      {
LABEL_17:

        goto LABEL_18;
      }
      [(HearingTestPreEvaluationCoachingViewControllerAccessibility *)self _axSetAnnouncementState:0];
      v19 = AXLogHearingTest();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        -[HearingTestPreEvaluationCoachingViewControllerAccessibility _axHandleElementFocusedNotification:]();
      }
    }

    goto LABEL_17;
  }
LABEL_18:
}

- (void)_axBeforePlayingTones
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2421AF000, v0, v1, "Coaching: BeforePlayingTones, VO silent", v2, v3, v4, v5, v6);
}

- (void)_axStopPlayingTones
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2421AF000, v0, v1, "Coaching: StopPlayingTones, VO will speak", v2, v3, v4, v5, v6);
}

- (void)_axSetupSubviews
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 titleLabel];
  uint64_t v4 = [v3 text];
  int v5 = 138412290;
  uint8_t v6 = v4;
  _os_log_debug_impl(&dword_2421AF000, a2, OS_LOG_TYPE_DEBUG, "Coaching setup playToneButton: %@", (uint8_t *)&v5, 0xCu);
}

- (id)_axPlayToneButton
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  char v27 = 0;
  objc_opt_class();
  uint64_t v4 = [(HearingTestPreEvaluationCoachingViewControllerAccessibility *)self safeValueForKey:@"secondaryContentView"];
  int v5 = __UIAccessibilityCastAsClass();

  uint8_t v6 = [v5 subviews];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    v8 = [(HearingTestPreEvaluationCoachingViewControllerAccessibility *)self safeSwiftValueForKey:@"playToneImageView"];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v21 = v5;
    id obj = [v5 subviews];
    uint64_t v9 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v24;
LABEL_4:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(obj);
        }
        char v27 = 0;
        objc_opt_class();
        v13 = __UIAccessibilityCastAsClass();
        if (v27) {
          abort();
        }
        v14 = v13;
        if (v8)
        {
          uint64_t v2 = [v13 imageView];
          if (v2 == v8) {
            break;
          }
        }
        v15 = [0 titleLabel];
        uint64_t v16 = [v15 text];
        v17 = accessibilityLocalizedString(@"HEARING_TEST_COACHING_PLAY_SAMPLE");
        char v18 = [v16 isEqualToString:v17];

        if (v8) {
        if (v18)
        }
          goto LABEL_18;

        if (v10 == ++v12)
        {
          uint64_t v10 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
          if (v10) {
            goto LABEL_4;
          }
          goto LABEL_15;
        }
      }

LABEL_18:
      int v5 = v21;
      if (v14) {
        goto LABEL_22;
      }
    }
    else
    {
LABEL_15:

      int v5 = v21;
    }
    v19 = AXLogHearingTest();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[HearingTestPreEvaluationCoachingViewControllerAccessibility _axPlayToneButton]();
    }

    v14 = 0;
LABEL_22:
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)viewWillDisappear:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2421AF000, v0, v1, "Coaching: viewWillDisappear, VO unsubscribe all", v2, v3, v4, v5, v6);
}

- (void)_axHandleElementFocusedNotification:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2421AF000, v0, v1, "Coaching: Unfocused element playToneButton, stopping coaching", v2, v3, v4, v5, v6);
}

- (void)_axHandleElementFocusedNotification:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_2421AF000, v0, v1, "Coaching: Focused element is playToneButton: %d", v2, v3, v4, v5, v6);
}

- (void)_axHandleElementFocusedNotification:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2421AF000, v0, v1, "Coaching: Other controller is presented", v2, v3, v4, v5, v6);
}

- (void)_axHandleElementFocusedNotification:(NSObject *)a3 .cold.4(void *a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a1 accessibilityLabel];
  uint8_t v6 = [a2 accessibilityLabel];
  int v7 = 138412546;
  v8 = v5;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  _os_log_debug_impl(&dword_2421AF000, a3, OS_LOG_TYPE_DEBUG, "Coaching: focused notification, element focused: %@, unfocused: %@", (uint8_t *)&v7, 0x16u);
}

- (void)_axPlayToneButton
{
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_2421AF000, v0, OS_LOG_TYPE_ERROR, "Didn't find playToneButton", v1, 2u);
}

@end