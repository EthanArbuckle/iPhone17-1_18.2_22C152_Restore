@interface AXSSActionManager
- (BOOL)handleEscapeKey;
- (BOOL)isInteractive;
- (void)activateAccessibilityShortcut;
- (void)activateSOS;
- (void)activateSiri;
- (void)activateTypeahead;
- (void)armApplePay;
- (void)begin3DTouch;
- (void)beginPinchIn;
- (void)beginPinchOut;
- (void)beginRotateLeft;
- (void)beginRotateRight;
- (void)beginSwipeDown;
- (void)beginSwipeLeft;
- (void)beginSwipeRight;
- (void)beginSwipeUp;
- (void)beginTwoFingerSwipeDown;
- (void)beginTwoFingerSwipeLeft;
- (void)beginTwoFingerSwipeRight;
- (void)beginTwoFingerSwipeUp;
- (void)end3DTouch;
- (void)endPinch;
- (void)endRotate;
- (void)endSwipe;
- (void)endTwoFingerSwipe;
- (void)enterContainer;
- (void)exitContainer;
- (void)goHome;
- (void)goToFirstElement;
- (void)goToLastElement;
- (void)goToNextElementOfType:(unint64_t)a3;
- (void)goToNextSection;
- (void)goToPreviousElementOfType:(unint64_t)a3;
- (void)goToPreviousSection;
- (void)handleEscapeKey;
- (void)lift;
- (void)lockScreen;
- (void)moveDown;
- (void)moveInsideNext;
- (void)moveInsidePrevious;
- (void)moveLeft;
- (void)movePointerToFocus;
- (void)moveRight;
- (void)moveUp;
- (void)nextButton;
- (void)nextCheckbox;
- (void)nextHeading;
- (void)nextImage;
- (void)nextLink;
- (void)nextTable;
- (void)nextTextField;
- (void)openContextualMenu;
- (void)performDefaultAction;
- (void)performEscape;
- (void)performSysdiagnose;
- (void)press;
- (void)previousButton;
- (void)previousCheckbox;
- (void)previousHeading;
- (void)previousImage;
- (void)previousLink;
- (void)previousTable;
- (void)previousTextField;
- (void)rebootDevice;
- (void)rotateDevice;
- (void)showAccessibilityActions;
- (void)toggleAppLibrary;
- (void)toggleAppSwitcher;
- (void)toggleApplicationList;
- (void)toggleControlCenter;
- (void)toggleDock;
- (void)toggleGesturesMode;
- (void)toggleHelp;
- (void)toggleMenuBar;
- (void)toggleNotificationCenter;
- (void)togglePassthroughMode;
- (void)toggleQuickNote;
- (void)toggleWindowList;
- (void)twoFingerLift;
- (void)twoFingerPress;
@end

@implementation AXSSActionManager

- (BOOL)isInteractive
{
  return 0;
}

- (void)goToNextElementOfType:(unint64_t)a3
{
  v4 = FKALogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[AXSSActionManager goToNextElementOfType:](a3, v4);
  }
}

- (void)goToPreviousElementOfType:(unint64_t)a3
{
  v4 = FKALogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[AXSSActionManager goToPreviousElementOfType:](a3, v4);
  }
}

- (void)goToFirstElement
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B3B9D000, v0, v1, "goToFirstElement", v2, v3, v4, v5, v6);
}

- (void)goToLastElement
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B3B9D000, v0, v1, "goToLastElement", v2, v3, v4, v5, v6);
}

- (void)goToNextSection
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B3B9D000, v0, v1, "goToNextSection", v2, v3, v4, v5, v6);
}

- (void)goToPreviousSection
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B3B9D000, v0, v1, "goToPreviousSection", v2, v3, v4, v5, v6);
}

- (void)enterContainer
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B3B9D000, v0, v1, "enterContainer", v2, v3, v4, v5, v6);
}

- (void)exitContainer
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B3B9D000, v0, v1, "exitContainer", v2, v3, v4, v5, v6);
}

- (void)moveLeft
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B3B9D000, v0, v1, "moveLeft", v2, v3, v4, v5, v6);
}

- (void)moveRight
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B3B9D000, v0, v1, "moveRight", v2, v3, v4, v5, v6);
}

- (void)moveUp
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B3B9D000, v0, v1, "moveUp", v2, v3, v4, v5, v6);
}

- (void)moveDown
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B3B9D000, v0, v1, "moveDown", v2, v3, v4, v5, v6);
}

- (void)moveInsideNext
{
  uint64_t v2 = FKALogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    -[AXSSActionManager moveDown]();
  }
}

- (void)moveInsidePrevious
{
  uint64_t v2 = FKALogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    -[AXSSActionManager moveDown]();
  }
}

- (void)performDefaultAction
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B3B9D000, v0, v1, "performDefaultAction", v2, v3, v4, v5, v6);
}

- (void)toggleHelp
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B3B9D000, v0, v1, "toggleHelp", v2, v3, v4, v5, v6);
}

- (void)openContextualMenu
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B3B9D000, v0, v1, "openContexualMenu", v2, v3, v4, v5, v6);
}

- (void)activateSiri
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B3B9D000, v0, v1, "activateSiri", v2, v3, v4, v5, v6);
}

- (void)goHome
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B3B9D000, v0, v1, "goHome", v2, v3, v4, v5, v6);
}

- (void)toggleAppSwitcher
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B3B9D000, v0, v1, "toggleAppSwitcher", v2, v3, v4, v5, v6);
}

- (void)toggleAppLibrary
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B3B9D000, v0, v1, "toggleAppLibrary", v2, v3, v4, v5, v6);
}

- (void)toggleQuickNote
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B3B9D000, v0, v1, "toggleQuickNote", v2, v3, v4, v5, v6);
}

- (void)lockScreen
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B3B9D000, v0, v1, "lockScreen", v2, v3, v4, v5, v6);
}

- (void)activateAccessibilityShortcut
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B3B9D000, v0, v1, "activateAccessibilityShortcut", v2, v3, v4, v5, v6);
}

- (void)armApplePay
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B3B9D000, v0, v1, "armApplePay", v2, v3, v4, v5, v6);
}

- (void)rebootDevice
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B3B9D000, v0, v1, "rebootDevice", v2, v3, v4, v5, v6);
}

- (void)activateSOS
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B3B9D000, v0, v1, "activateSOS", v2, v3, v4, v5, v6);
}

- (void)toggleMenuBar
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B3B9D000, v0, v1, "toggleMenuBar", v2, v3, v4, v5, v6);
}

- (void)toggleNotificationCenter
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B3B9D000, v0, v1, "toggleNotificationCenter", v2, v3, v4, v5, v6);
}

- (void)toggleControlCenter
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B3B9D000, v0, v1, "toggleControlCenter", v2, v3, v4, v5, v6);
}

- (void)toggleDock
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B3B9D000, v0, v1, "toggleDock", v2, v3, v4, v5, v6);
}

- (void)rotateDevice
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B3B9D000, v0, v1, "rotateDevice", v2, v3, v4, v5, v6);
}

- (void)showAccessibilityActions
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B3B9D000, v0, v1, "showAccessibilityActions", v2, v3, v4, v5, v6);
}

- (void)performEscape
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B3B9D000, v0, v1, "performEscape", v2, v3, v4, v5, v6);
}

- (BOOL)handleEscapeKey
{
  uint64_t v2 = FKALogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    -[AXSSActionManager handleEscapeKey]();
  }

  return 0;
}

- (void)performSysdiagnose
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B3B9D000, v0, v1, "performSysdiagnose", v2, v3, v4, v5, v6);
}

- (void)activateTypeahead
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B3B9D000, v0, v1, "typeahead", v2, v3, v4, v5, v6);
}

- (void)togglePassthroughMode
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B3B9D000, v0, v1, "togglePassthroughMode", v2, v3, v4, v5, v6);
}

- (void)toggleWindowList
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B3B9D000, v0, v1, "toggleWindowList", v2, v3, v4, v5, v6);
}

- (void)toggleApplicationList
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B3B9D000, v0, v1, "toggleApplicationList", v2, v3, v4, v5, v6);
}

- (void)nextButton
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B3B9D000, v0, v1, "nextButton", v2, v3, v4, v5, v6);
}

- (void)previousButton
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B3B9D000, v0, v1, "previousButton", v2, v3, v4, v5, v6);
}

- (void)nextCheckbox
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B3B9D000, v0, v1, "nextCheckbox", v2, v3, v4, v5, v6);
}

- (void)previousCheckbox
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B3B9D000, v0, v1, "previousCheckbox", v2, v3, v4, v5, v6);
}

- (void)nextTable
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B3B9D000, v0, v1, "nextTable", v2, v3, v4, v5, v6);
}

- (void)previousTable
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B3B9D000, v0, v1, "previousTable", v2, v3, v4, v5, v6);
}

- (void)nextImage
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B3B9D000, v0, v1, "nextImage", v2, v3, v4, v5, v6);
}

- (void)previousImage
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B3B9D000, v0, v1, "previousImage", v2, v3, v4, v5, v6);
}

- (void)nextLink
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B3B9D000, v0, v1, "nextLink", v2, v3, v4, v5, v6);
}

- (void)previousLink
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B3B9D000, v0, v1, "previousLink", v2, v3, v4, v5, v6);
}

- (void)nextHeading
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B3B9D000, v0, v1, "nextHeading", v2, v3, v4, v5, v6);
}

- (void)previousHeading
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B3B9D000, v0, v1, "previousHeading", v2, v3, v4, v5, v6);
}

- (void)nextTextField
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B3B9D000, v0, v1, "nextTextField", v2, v3, v4, v5, v6);
}

- (void)previousTextField
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B3B9D000, v0, v1, "previousTextField", v2, v3, v4, v5, v6);
}

- (void)movePointerToFocus
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B3B9D000, v0, v1, "movePointerToFocus", v2, v3, v4, v5, v6);
}

- (void)toggleGesturesMode
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B3B9D000, v0, v1, "toggleGesturesMode", v2, v3, v4, v5, v6);
}

- (void)press
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B3B9D000, v0, v1, "press", v2, v3, v4, v5, v6);
}

- (void)lift
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B3B9D000, v0, v1, "lift", v2, v3, v4, v5, v6);
}

- (void)twoFingerPress
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B3B9D000, v0, v1, "twoFingerPress", v2, v3, v4, v5, v6);
}

- (void)twoFingerLift
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B3B9D000, v0, v1, "twoFingerLift", v2, v3, v4, v5, v6);
}

- (void)beginSwipeLeft
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B3B9D000, v0, v1, "beginSwipeLeft", v2, v3, v4, v5, v6);
}

- (void)beginSwipeRight
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B3B9D000, v0, v1, "beginSwipeRight", v2, v3, v4, v5, v6);
}

- (void)beginSwipeUp
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B3B9D000, v0, v1, "beginSwipeUp", v2, v3, v4, v5, v6);
}

- (void)beginSwipeDown
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B3B9D000, v0, v1, "beginSwipeDown", v2, v3, v4, v5, v6);
}

- (void)endSwipe
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B3B9D000, v0, v1, "endSwipe", v2, v3, v4, v5, v6);
}

- (void)beginTwoFingerSwipeLeft
{
  uint64_t v2 = FKALogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    -[AXSSActionManager beginSwipeLeft]();
  }
}

- (void)beginTwoFingerSwipeRight
{
  uint64_t v2 = FKALogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    -[AXSSActionManager beginSwipeRight]();
  }
}

- (void)beginTwoFingerSwipeUp
{
  uint64_t v2 = FKALogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    -[AXSSActionManager beginSwipeUp]();
  }
}

- (void)beginTwoFingerSwipeDown
{
  uint64_t v2 = FKALogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    -[AXSSActionManager beginSwipeDown]();
  }
}

- (void)endTwoFingerSwipe
{
  uint64_t v2 = FKALogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    -[AXSSActionManager endSwipe]();
  }
}

- (void)beginPinchIn
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B3B9D000, v0, v1, "beginPinchIn", v2, v3, v4, v5, v6);
}

- (void)beginPinchOut
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B3B9D000, v0, v1, "beginPinchOut", v2, v3, v4, v5, v6);
}

- (void)endPinch
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B3B9D000, v0, v1, "endPinch", v2, v3, v4, v5, v6);
}

- (void)beginRotateRight
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B3B9D000, v0, v1, "beginRotateRight", v2, v3, v4, v5, v6);
}

- (void)beginRotateLeft
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B3B9D000, v0, v1, "beginRotateLeft", v2, v3, v4, v5, v6);
}

- (void)endRotate
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B3B9D000, v0, v1, "endRotate", v2, v3, v4, v5, v6);
}

- (void)begin3DTouch
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B3B9D000, v0, v1, "begin3DTouch", v2, v3, v4, v5, v6);
}

- (void)end3DTouch
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B3B9D000, v0, v1, "end3DTouch", v2, v3, v4, v5, v6);
}

- (void)goToNextElementOfType:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1B3B9D000, a2, OS_LOG_TYPE_DEBUG, "goToNextElementOfType %ld", (uint8_t *)&v2, 0xCu);
}

- (void)goToPreviousElementOfType:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1B3B9D000, a2, OS_LOG_TYPE_DEBUG, "goToPreviousElementOfType %ld", (uint8_t *)&v2, 0xCu);
}

- (void)handleEscapeKey
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B3B9D000, v0, v1, "handleEscapeKey", v2, v3, v4, v5, v6);
}

@end