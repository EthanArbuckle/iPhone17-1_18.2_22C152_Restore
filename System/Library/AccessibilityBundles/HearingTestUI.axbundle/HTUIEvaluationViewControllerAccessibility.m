@interface HTUIEvaluationViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axIsSessionActive;
- (BOOL)_axIsSessionPaused;
- (BOOL)_axIsSessionStarted;
- (BOOL)_axIsSubscribed;
- (BOOL)accessibilityPerformEscape;
- (id)_axContentViewCategory;
- (id)_axSessionManagerCategory;
- (int)_axAnnouncementState;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axAnnouncementFinished;
- (void)_axHandleElementFocusedNotification:(id)a3;
- (void)_axIsSessionActive;
- (void)_axSetAnnouncementState:(int)a3;
- (void)_axSetIsSessionStarted:(BOOL)a3;
- (void)_axSetIsSubscribed:(BOOL)a3;
- (void)_axStartAnnouncement;
- (void)accessibilityPerformEscape;
- (void)didTapAction;
- (void)pauseHearingTestSession;
- (void)resumeHearingTestSession;
- (void)scheduleEvaluationStart;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation HTUIEvaluationViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HearingTestUI.HTUIEvaluationViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_axIsSubscribed
{
  return MEMORY[0x270F0A438](self, &__HTUIEvaluationViewControllerAccessibility___axIsSubscribed);
}

- (void)_axSetIsSubscribed:(BOOL)a3
{
}

- (BOOL)_axIsSessionStarted
{
  return MEMORY[0x270F0A438](self, &__HTUIEvaluationViewControllerAccessibility___axIsSessionStarted);
}

- (void)_axSetIsSessionStarted:(BOOL)a3
{
}

- (int)_axAnnouncementState
{
  return MEMORY[0x270F0A450](self, &__HTUIEvaluationViewControllerAccessibility___axAnnouncementState);
}

- (void)_axSetAnnouncementState:(int)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"HearingTestUI.HTUIEvaluationViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HearingTestUI.HTUIEvaluationViewController", @"scheduleEvaluationStart", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HearingTestUI.HTUIEvaluationViewController", @"pauseHearingTestSession", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HearingTestUI.HTUIEvaluationViewController", @"resumeHearingTestSession", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HearingTestUI.HTUIEvaluationViewController", @"didTapAction", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HearingTestUI.HTUIEvaluationViewController", @"didTapCancel", "v", 0);
  [v3 validateClass:@"HearingTestUI.HTUIEvaluationViewController" hasSwiftFieldOfAnyClass:@"sessionManager"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2421AF000, v0, v1, "Test: VO subscribed on Announcements and Focus", v2, v3, v4, v5, v6);
}

- (BOOL)accessibilityPerformEscape
{
  uint64_t v2 = AXLogHearingTest();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    -[HTUIEvaluationViewControllerAccessibility accessibilityPerformEscape]();
  }

  AXPerformSafeBlock();
  return 1;
}

uint64_t __71__HTUIEvaluationViewControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) didTapCancel];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HTUIEvaluationViewControllerAccessibility;
  [(HTUIEvaluationViewControllerAccessibility *)&v8 viewWillDisappear:a3];
  [(HTUIEvaluationViewControllerAccessibility *)self _axSetAnnouncementState:0];
  uint64_t v4 = [(HTUIEvaluationViewControllerAccessibility *)self _axContentViewCategory];
  [v4 _axStopPlayingTones];

  uint64_t v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 removeObserver:self name:*MEMORY[0x263F1CDF8] object:0];

  uint8_t v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 removeObserver:self name:*MEMORY[0x263F1CDB0] object:0];

  v7 = AXLogHearingTest();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[HTUIEvaluationViewControllerAccessibility viewWillDisappear:]();
  }

  [(HTUIEvaluationViewControllerAccessibility *)self _axSetIsSubscribed:0];
}

- (void)scheduleEvaluationStart
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2421AF000, v0, v1, "Test: scheduleEvaluationStart", v2, v3, v4, v5, v6);
}

- (void)pauseHearingTestSession
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2421AF000, v0, v1, "Test: pauseHearingTestSession", v2, v3, v4, v5, v6);
}

- (void)resumeHearingTestSession
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2421AF000, v0, v1, "Test: resumeHearingTestSession", v2, v3, v4, v5, v6);
}

- (void)didTapAction
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_2421AF000, v0, v1, "Test: didTapAction inBetween: %d", v2, v3, v4, v5, v6);
}

- (void)_axStartAnnouncement
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [NSNumber numberWithInteger:a1];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl(&dword_2421AF000, a2, OS_LOG_TYPE_DEBUG, "Test: StartAnnouncement announcementState %@", (uint8_t *)&v4, 0xCu);
}

- (void)_axAnnouncementFinished
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2421AF000, v0, v1, "Test: Finished announcement", v2, v3, v4, v5, v6);
}

- (void)_axHandleElementFocusedNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HTUIEvaluationViewControllerAccessibility *)self _axContentViewCategory];
  char v6 = [v5 _axIsStateInProgress];

  if (v6)
  {
    v7 = [v4 userInfo];
    objc_super v8 = [v7 objectForKeyedSubscript:*MEMORY[0x263F1CE00]];

    v9 = [v4 userInfo];
    v10 = [v9 objectForKeyedSubscript:*MEMORY[0x263F1CF70]];

    v11 = AXLogHearingTest();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      [(HTUIEvaluationViewControllerAccessibility *)v8 _axHandleElementFocusedNotification:v11];
    }

    v12 = [(HTUIEvaluationViewControllerAccessibility *)self _axContentViewCategory];
    v13 = [v12 _axTapHearButton];

    if (v8)
    {
      objc_opt_class();
      v14 = __UIAccessibilityCastAsClass();
      v15 = [v14 presentedViewController];

      if (v15)
      {
        [(HTUIEvaluationViewControllerAccessibility *)self _axSetAnnouncementState:0];
        v16 = [(HTUIEvaluationViewControllerAccessibility *)self _axContentViewCategory];
        [v16 _axStopPlayingTones];

        v17 = AXLogHearingTest();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
          -[HTUIEvaluationViewControllerAccessibility _axHandleElementFocusedNotification:].cold.6();
        }
      }
      else
      {
        v18 = AXLogHearingTest();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
          -[HTUIEvaluationViewControllerAccessibility _axHandleElementFocusedNotification:].cold.5();
        }

        if (v8 == v13)
        {
          if ([(HTUIEvaluationViewControllerAccessibility *)self _axIsSessionPaused])
          {
            v20 = AXLogHearingTest();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
              -[HTUIEvaluationViewControllerAccessibility _axHandleElementFocusedNotification:]();
            }

            [(HTUIEvaluationViewControllerAccessibility *)self resumeHearingTestSession];
          }
          else if (![(HTUIEvaluationViewControllerAccessibility *)self _axIsSessionStarted])
          {
            v21 = [(HTUIEvaluationViewControllerAccessibility *)self _axContentViewCategory];
            int v22 = [v21 _axIsStateInProgress];

            if (v22)
            {
              v23 = AXLogHearingTest();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
                -[HTUIEvaluationViewControllerAccessibility _axHandleElementFocusedNotification:]();
              }

              [(HTUIEvaluationViewControllerAccessibility *)self _axStartAnnouncement];
            }
          }
        }
        else
        {
          [(HTUIEvaluationViewControllerAccessibility *)self _axSetAnnouncementState:0];
          if ([(HTUIEvaluationViewControllerAccessibility *)self _axIsSessionActive])
          {
            v19 = AXLogHearingTest();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
              -[HTUIEvaluationViewControllerAccessibility _accessibilityLoadAccessibilityInformation]();
            }

            [(HTUIEvaluationViewControllerAccessibility *)self pauseHearingTestSession];
          }
        }
      }
    }
    else
    {
      if (v10 != v13)
      {
LABEL_33:

        goto LABEL_34;
      }
      [(HTUIEvaluationViewControllerAccessibility *)self _axSetAnnouncementState:0];
      if ([(HTUIEvaluationViewControllerAccessibility *)self _axIsSessionActive]) {
        [(HTUIEvaluationViewControllerAccessibility *)self pauseHearingTestSession];
      }
      v14 = AXLogHearingTest();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[HTUIEvaluationViewControllerAccessibility _axHandleElementFocusedNotification:]();
      }
    }

    goto LABEL_33;
  }
  objc_super v8 = AXLogHearingTest();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[HTUIEvaluationViewControllerAccessibility _axHandleElementFocusedNotification:].cold.8();
  }
LABEL_34:
}

- (BOOL)_axIsSessionPaused
{
  BOOL v3 = [(HTUIEvaluationViewControllerAccessibility *)self _axIsSessionStarted];
  if (v3) {
    LOBYTE(v3) = ![(HTUIEvaluationViewControllerAccessibility *)self _axIsSessionActive];
  }
  return v3;
}

- (BOOL)_axIsSessionActive
{
  uint64_t v2 = [(HTUIEvaluationViewControllerAccessibility *)self safeSwiftValueForKey:@"sessionManager"];
  char v3 = [v2 safeSwiftBoolForKey:@"_sessionIsActive"];

  id v4 = AXLogHearingTest();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[HTUIEvaluationViewControllerAccessibility _axIsSessionActive]();
  }

  return v3;
}

- (id)_axSessionManagerCategory
{
  objc_opt_class();
  char v3 = [(HTUIEvaluationViewControllerAccessibility *)self safeSwiftValueForKey:@"sessionManager"];
  id v4 = __UIAccessibilityCastAsSafeCategory();

  return v4;
}

- (id)_axContentViewCategory
{
  objc_opt_class();
  uint64_t v2 = __UIAccessibilityCastAsClass();
  objc_opt_class();
  char v3 = [v2 view];
  id v4 = __UIAccessibilityCastAsSafeCategory();

  return v4;
}

- (void)accessibilityPerformEscape
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2421AF000, v0, v1, "Test: accessibilityPerformEscape", v2, v3, v4, v5, v6);
}

- (void)viewWillDisappear:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2421AF000, v0, v1, "Test: viewWillDisappear, VO unsubscribe all", v2, v3, v4, v5, v6);
}

- (void)_axHandleElementFocusedNotification:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2421AF000, v0, v1, "Test: Unfocused element tapHearButton, stopping test", v2, v3, v4, v5, v6);
}

- (void)_axHandleElementFocusedNotification:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2421AF000, v0, v1, "Test: Session was paused, resuming", v2, v3, v4, v5, v6);
}

- (void)_axHandleElementFocusedNotification:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2421AF000, v0, v1, "Test: Session wasn't started, starting", v2, v3, v4, v5, v6);
}

- (void)_axHandleElementFocusedNotification:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_2421AF000, v0, v1, "Test: Focused element is tapHearButton: %d", v2, v3, v4, v5, v6);
}

- (void)_axHandleElementFocusedNotification:.cold.6()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2421AF000, v0, v1, "Test: Focused element from other controller or process, stopping test", v2, v3, v4, v5, v6);
}

- (void)_axHandleElementFocusedNotification:(NSObject *)a3 .cold.7(void *a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a1 accessibilityLabel];
  uint8_t v6 = [a2 accessibilityLabel];
  int v7 = 138412546;
  objc_super v8 = v5;
  __int16 v9 = 2112;
  v10 = v6;
  _os_log_debug_impl(&dword_2421AF000, a3, OS_LOG_TYPE_DEBUG, "Test: focused notification, element focused: %@, unfocused: %@", (uint8_t *)&v7, 0x16u);
}

- (void)_axHandleElementFocusedNotification:.cold.8()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2421AF000, v0, v1, "Test: focused notification, test is not in Progress, skip", v2, v3, v4, v5, v6);
}

- (void)_axIsSessionActive
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_2421AF000, v0, v1, "Test: Session is active: %d", v2, v3, v4, v5, v6);
}

@end