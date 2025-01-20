@interface UIKitWebAccessibilityObjectWrapper
+ (BOOL)_isSerializableAccessibilityElement;
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityAlwaysSpeakTableHeaders;
- (BOOL)_accessibilityHandlesArrowKeys;
- (BOOL)_accessibilityHasNativeFocus;
- (BOOL)_accessibilityHasOtherAccessibleChildElements:(id)a3;
- (BOOL)_accessibilityHasTextOperations;
- (BOOL)_accessibilityIsDataEmpty:(id)a3;
- (BOOL)_accessibilityIsFrameOutOfBounds;
- (BOOL)_accessibilityIsGroupedParent;
- (BOOL)_accessibilityIsScrollDivDescendent;
- (BOOL)_accessibilityIsScrollable;
- (BOOL)_accessibilityIsSpeakThisElement;
- (BOOL)_accessibilityIsTopMostWebElement;
- (BOOL)_accessibilityMoveFocusWithHeading:(unint64_t)a3 toElementMatchingQuery:(id)a4;
- (BOOL)_accessibilityOverridesPotentiallyAttributedAPISelector:(SEL)a3;
- (BOOL)_accessibilityReplaceTextInRange:(_NSRange)a3 withString:(id)a4;
- (BOOL)_accessibilityRequiresContextIdConversion;
- (BOOL)_accessibilityScrollToVisible;
- (BOOL)_accessibilitySetNativeFocus;
- (BOOL)_accessibilityShouldSpeakMathEquationTrait;
- (BOOL)_accessibilitySpeakThisCanBeHighlighted;
- (BOOL)_accessibilitySupportsActivateAction;
- (BOOL)_accessibilitySupportsTextInsertionAndDeletion;
- (BOOL)_accessibilityVisiblePointHonorsScreenBounds;
- (BOOL)_axAreChildrenFocused;
- (BOOL)_axHasMultipleAccessibleChildren:(int64_t *)a3;
- (BOOL)_axIsInteractiveVideo;
- (BOOL)_axIsWK2DataDetectorLink;
- (BOOL)_axIsWebKit2;
- (BOOL)_axSupportsWebKitNotificationRelay;
- (BOOL)_axWebKitIsAriaExpanded;
- (BOOL)_axWebKitIsAriaPressed;
- (BOOL)_axWebKitSupportsARIAExpanded;
- (BOOL)_axWebKitSupportsARIAPressed;
- (BOOL)_isCheckBox;
- (BOOL)_isIBooks;
- (BOOL)_prefersFocusContainment;
- (BOOL)_prepareAccessibilityCall;
- (BOOL)accessibilityActivate;
- (BOOL)accessibilityCanFuzzyHitTest;
- (BOOL)accessibilityIsMathTopObject;
- (BOOL)accessibilityRequired;
- (BOOL)accessibilityScroll:(int64_t)a3;
- (BOOL)accessibilityZoomInAtPoint:(CGPoint)a3;
- (BOOL)accessibilityZoomOutAtPoint:(CGPoint)a3;
- (BOOL)canBecomeFocused;
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)isAccessibilityElement;
- (BOOL)shouldUpdateFocusInContext:(id)a3;
- (CGPoint)_accessibilityScrollRectToVisible:(CGRect)a3;
- (CGPoint)accessibilityActivationPoint;
- (CGRect)_accessibilityBoundsForRange:(_NSRange)a3;
- (CGRect)_accessibilityClippingFrame;
- (CGRect)_accessibilityConvertSystemBoundedScreenRectToContextSpace:(CGRect)a3;
- (CGRect)_accessibilityVisibleFrame;
- (CGRect)_axGetClippingFrame;
- (CGRect)accessibilityBoundsForTextMarkers:(id)a3;
- (CGRect)accessibilityFrame;
- (CGRect)accessibilityFrameForScrolling;
- (CGRect)bounds;
- (CGRect)frame;
- (NSArray)preferredFocusEnvironments;
- (NSString)description;
- (NSString)focusGroupIdentifier;
- (UIFocusEnvironment)parentFocusEnvironment;
- (_NSRange)_accessibilityCharacterRangeForPosition:(unint64_t)a3;
- (_NSRange)_accessibilityCheckRowRangeForTrait:(unint64_t)a3;
- (_NSRange)_accessibilityLineRangeForPosition:(unint64_t)a3;
- (_NSRange)_accessibilityRangeForTextMarker:(id)a3;
- (_NSRange)_accessibilityRangeForTextMarkers:(id)a3;
- (_NSRange)_accessibilitySelectedNSRangeForObject;
- (_NSRange)_accessibilitySelectedTextRange;
- (_NSRange)_accessibilitySelectedTextRangeForHandwritingWithValue:(id)a3;
- (_NSRange)_rangeForWebTextMarkers:(id)a3;
- (_NSRange)accessibilityRowRange;
- (float)_accessibilityActivationDelay;
- (id)_accessibilityApplication;
- (id)_accessibilityAttributedValue:(id)a3;
- (id)_accessibilityAttributedValueForElement;
- (id)_accessibilityAttributedValueForRange:(_NSRange *)a3;
- (id)_accessibilityColorDescription;
- (id)_accessibilityContainerTypes;
- (id)_accessibilityConvertDataArrayToTextMarkerArray:(id)a3;
- (id)_accessibilityConvertTextMarkersToDataArray:(id)a3;
- (id)_accessibilityCurrentStatus;
- (id)_accessibilityCustomRotor:(int64_t)a3;
- (id)_accessibilityDOMAttributes;
- (id)_accessibilityDataDetectorScheme:(CGPoint)a3;
- (id)_accessibilityElementsForSearchParameter:(id)a3;
- (id)_accessibilityHeaderElementsForColumn:(unint64_t)a3;
- (id)_accessibilityHeaderElementsForRow:(unint64_t)a3;
- (id)_accessibilityLineEndMarker:(id)a3;
- (id)_accessibilityLinePosition:(BOOL)a3 withMarker:(id)a4;
- (id)_accessibilityLineStartMarker:(id)a3;
- (id)_accessibilityMakeScrollStatus;
- (id)_accessibilityMarkerForPoint:(CGPoint)a3;
- (id)_accessibilityMarkerPosition:(BOOL)a3 withMarker:(id)a4;
- (id)_accessibilityMathEquationRootObject;
- (id)_accessibilityNextElementsWithHeading:(unint64_t)a3 queryString:(id)a4 startingFrom:(id)a5;
- (id)_accessibilityNextMarker:(id)a3;
- (id)_accessibilityObjectForTextMarker:(id)a3;
- (id)_accessibilityParentForSubview:(id)a3;
- (id)_accessibilityParentLinkContainer;
- (id)_accessibilityParentView;
- (id)_accessibilityPreviousMarker:(id)a3;
- (id)_accessibilityProcessRootEquation;
- (id)_accessibilityResolvedEditingStyles;
- (id)_accessibilityRoleDescription;
- (id)_accessibilityScrollAncestor;
- (id)_accessibilityScrollStatus;
- (id)_accessibilitySpeakThisString;
- (id)_accessibilityTextMarkerForPosition:(int64_t)a3;
- (id)_accessibilityTextMarkerRange;
- (id)_accessibilityTextMarkerRangeForSelection;
- (id)_accessibilityTextRectsForSpeakThisStringRange:(_NSRange)a3 string:(id)a4 wantsSentences:(BOOL)a5;
- (id)_accessibilityTextViewTextOperationResponder;
- (id)_accessibilityUnignoredVisibleDescendant;
- (id)_accessibilityUserTestingElementBaseType;
- (id)_accessibilityValueForHandwriting;
- (id)_accessibilityWebAreaURL;
- (id)_accessibilityWebDocumentView;
- (id)_accessibilityWebPageObject;
- (id)_accessibilityWebPageParent;
- (id)_axAncestorTypes;
- (id)_axDataConvertForNotification:(id)a3;
- (id)_axWebAreaURL;
- (id)_axWebKitSearchKeyForCustomRotorType:(int64_t)a3;
- (id)_axWebKitTrueLinkParent;
- (id)_misspelledWordRotor;
- (id)_preferredFocusRegionCoordinateSpace;
- (id)accessibilityArrayOfTextForTextMarkers:(id)a3;
- (id)accessibilityAttributedValue;
- (id)accessibilityContainer;
- (id)accessibilityCustomActions;
- (id)accessibilityCustomRotors;
- (id)accessibilityHint;
- (id)accessibilityHitTest:(CGPoint)a3;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (id)accessibilityLanguage;
- (id)accessibilityLinkRelationshipType;
- (id)accessibilityMathBaseObject;
- (id)accessibilityMathDenominatorObject;
- (id)accessibilityMathEquation;
- (id)accessibilityMathFencedCloseString;
- (id)accessibilityMathFencedOpenString;
- (id)accessibilityMathNumeratorObject;
- (id)accessibilityMathOverObject;
- (id)accessibilityMathPostscripts;
- (id)accessibilityMathPrescripts;
- (id)accessibilityMathRadicand;
- (id)accessibilityMathRootIndexObject;
- (id)accessibilityMathSubscriptObject;
- (id)accessibilityMathSuperscriptObject;
- (id)accessibilityMathType;
- (id)accessibilityMathUnderObject;
- (id)accessibilityNextTextNavigationElement;
- (id)accessibilityPath;
- (id)accessibilityPlaceholderValue;
- (id)accessibilityPostProcessHitTest:(CGPoint)a3;
- (id)accessibilityPreviousTextNavigationElement;
- (id)accessibilitySortDirection;
- (id)accessibilitySpeechHint;
- (id)accessibilityStringForTextMarkers:(id)a3;
- (id)accessibilityTextNavigationElementInDirection:(int64_t)a3;
- (id)accessibilityURL;
- (id)accessibilityValue;
- (id)accessibilityVisibleText;
- (id)ariaLandmarkRoleDescription;
- (id)automationElements;
- (id)focusItemsInRect:(CGRect)a3;
- (id)screenReaderVersion;
- (int)_accessibilityHostPid;
- (int64_t)_accessibilityExpandedStatus;
- (int64_t)_accessibilityLineEndPosition;
- (int64_t)_accessibilityLineStartPosition;
- (unint64_t)_accessibilityAutomationType;
- (unint64_t)_accessibilityTraitsHelper;
- (unint64_t)_axAdjustableTrait;
- (unint64_t)_axButtonTrait;
- (unint64_t)_axHasTextCursorTrait;
- (unint64_t)_axHeaderTrait;
- (unint64_t)_axImageTrait;
- (unint64_t)_axLinkTrait;
- (unint64_t)_axMenuItemTrait;
- (unint64_t)_axNotEnabledTrait;
- (unint64_t)_axPopupButtonTrait;
- (unint64_t)_axRadioButtonTrait;
- (unint64_t)_axSearchFieldTrait;
- (unint64_t)_axSecureTextFieldTrait;
- (unint64_t)_axSelectedTrait;
- (unint64_t)_axStaticTextTrait;
- (unint64_t)_axTabBarTrait;
- (unint64_t)_axTextAreaTrait;
- (unint64_t)_axTextEntryTrait;
- (unint64_t)_axTextOperationsAvailableTrait;
- (unint64_t)_axToggleTrait;
- (unint64_t)_axUpdatesFrequentlyTrait;
- (unint64_t)_axVisitedTrait;
- (unint64_t)_axWebContentTrait;
- (unint64_t)accessibilityTraits;
- (unsigned)_accessibilityContextId;
- (void)_accessibilityClippingFrame;
- (void)_accessibilityDecreaseSelection:(id)a3;
- (void)_accessibilityIncreaseSelection:(id)a3;
- (void)_accessibilityInsertText:(id)a3;
- (void)_accessibilityModifySelection:(id)a3 increase:(BOOL)a4;
- (void)_accessibilityMoveSelectionToMarker:(id)a3;
- (void)_accessibilityRelayToChrome:(unsigned int)a3 object:(id)a4;
- (void)_accessibilityReplaceCharactersAtCursor:(unint64_t)a3 withString:(id)a4;
- (void)_accessibilityScrollToVisible;
- (void)_axBuildAXTreeFromElement:(id)a3 outArray:(id)a4;
- (void)_axHandleNotificationPosting:(unsigned int)a3 data:(id)a4;
- (void)_axSetAreChildrenFocused:(BOOL)a3;
- (void)_axSetWebAreaURL:(id)a3;
- (void)_axVideoEnterFullscreen;
- (void)_axVideoToggleMute;
- (void)_destroyFocusLayer;
- (void)_enqueReorderingNotification:(id)a3;
- (void)_performLiveRegionUpdate;
- (void)_performPostScrollStatus:(id)a3;
- (void)_repostFocusChangeNotification;
- (void)_repostWebNotification:(id)a3;
- (void)_setAXClippingFrame:(CGRect)a3;
- (void)_updateFocusLayerFrame;
- (void)accessibilityDecrement;
- (void)accessibilityElementDidBecomeFocused;
- (void)accessibilityIncrement;
- (void)accessibilityOverrideProcessNotification:(id)a3;
- (void)accessibilityOverrideProcessNotification:(id)a3 notificationData:(id)a4;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)postScreenChangeNotification;
- (void)setNeedsFocusUpdate;
- (void)updateFocusIfNeeded;
@end

@implementation UIKitWebAccessibilityObjectWrapper

+ (id)safeCategoryTargetClassName
{
  return @"WebAccessibilityObjectWrapper";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axWebAreaURL
{
}

- (void)_axSetWebAreaURL:(id)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIPeripheralHost", @"isOnScreen", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapperBase", @"ariaLandmarkRoleDescription", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"accessibilityMathPostscripts", "@", 0);
  [v3 validateClass:@"WebAccessibilityObjectWrapper" isKindOfClass:@"WebAccessibilityObjectWrapperBase"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityTextMarker", @"initWithData:accessibilityObject:", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"handleNotificationRelayToChrome:notificationData:", "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"accessibilityColorStringValue", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"_accessibilityScrollVisibleRect", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"_accessibilityScrollPosition", "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"_accessibilityScrollSize", "{CGSize=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"_accessibilityParentForSubview:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"_axAdjustableTrait", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"_axButtonTrait", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"_axHasTextCursorTrait", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"_axHeaderTrait", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"_axImageTrait", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"_axLinkTrait", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"_axMenuItemTrait", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"_axNotEnabledTrait", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"_axPopupButtonTrait", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"_axSecureTextFieldTrait", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"_axSearchFieldTrait", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"_axTextAreaTrait", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"_axSelectedTrait", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"_axStaticTextTrait", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"_axTabBarTrait", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"_axTextOperationsAvailableTrait", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"_axToggleTrait", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"_axVisitedTrait", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"_axWebContentTrait", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"accessibilityIsMathTopObject", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"accessibilityMathBaseObject", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"accessibilityMathDenominatorObject", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"accessibilityMathFencedCloseString", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"accessibilityMathFencedOpenString", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"accessibilityMathNumeratorObject", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"accessibilityIsComboBox", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"accessibilityMathLineThickness", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"accessibilityMathOverObject", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"accessibilityMathRadicand", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapperBase", @"accessibilityMathPostscriptPairs", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapperBase", @"accessibilityMathPrescriptPairs", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"accessibilityMathRootIndexObject", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"accessibilityMathSubscriptObject", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"accessibilityMathSuperscriptObject", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"accessibilityMathType", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"accessibilityMathUnderObject", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"accessibilityMoveSelectionToMarker:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"arrayOfTextForTextMarkers: attributed:", "@", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"accessibilitySupportsARIAExpanded", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"accessibilityIsExpanded", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"accessibilitySupportsARIAPressed", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"accessibilityIsPressed", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"accessibilityModifySelection: increase:", "v", "C", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"accessibilityIsAttachmentElement", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"accessibilityFindMatchingObjects:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"_accessibilityActivate", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"accessibilityRoleDescription", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"_accessibilityLandmarkAncestor", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"_accessibilityArticleAncestor", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"_accessibilityListAncestor", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"_accessibilityTableAncestor", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"_accessibilityFieldsetAncestor", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"_accessibilityFrameAncestor", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"_accessibilityTreeAncestor", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"accessibilityARIAIsBusy", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"accessibilityARIALiveRegionIsAtomic", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"accessibilityARIALiveRegionStatus", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"accessibilityARIARelevantStatus", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"accessibilityCanFuzzyHitTest", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"accessibilityDecreaseSelection:", "v", "C", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"accessibilityElementRect", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"accessibilityIncreaseSelection:", "v", "C", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"accessibilityPlaceholderValue", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"accessibilityHasPopup", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"elementTextRange", "{_NSRange=QQ}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"frameForTextMarkers:", "{CGRect={CGPoint=dd}{CGSize=dd}}", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"lineEndMarkerForMarker:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"lineStartMarkerForMarker:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"positionForTextMarker:", "q", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"selectedTextMarker", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"stringForTextMarkers:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"textMarkerForPosition:", "@", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"textMarkerRangeForSelection", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapperBase", @"_prepareAccessibilityCall", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"accessibilityReplaceRange:withText:", "B", "{_NSRange=QQ}", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"_accessibilityResolvedEditingStyles", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"accessibilityCanSetValue", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NSObject", @"_accessibilityPageTextMarkerRange", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"accessibilityCurrentState", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"accessibilitySortDirection", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"accessibilityRequired", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"accessibilityIsDialog", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"textRectsFromMarkers:withText:", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"accessibilityIsShowingValidationMessage", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"accessibilityIsWebInteractiveVideo", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"accessibilityToggleMuteForMedia", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"accessibilityVideoEnterFullscreen", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"accessibilityIsMediaPlaying", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"accessibilityIsMediaMuted", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"_accessibilityIsStrongPasswordField", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"attributedStringForElement", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"_accessibilitySetFocus:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"misspellingTextMarkerRange:forward:", "@", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"accessibilityInsertText:", "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"accessibilityReplaceRange:withText:", "B", "{_NSRange=QQ}", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"accessibilityIsIndeterminate", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"_accessibilityWebRoleAsString", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"accessibilityBrailleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"accessibilityBrailleRoleDescription", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"lineMarkersForMarker:", "@", "@", 0);
}

+ (BOOL)_isSerializableAccessibilityElement
{
  return 1;
}

- (BOOL)_prepareAccessibilityCall
{
  v2 = self;
  id v3 = (void *)MEMORY[0x2455E7590](self, a2);
  v5.receiver = v2;
  v5.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
  LOBYTE(v2) = [(UIKitWebAccessibilityObjectWrapper *)&v5 _prepareAccessibilityCall];
  return (char)v2;
}

- (id)_accessibilityParentView
{
  if ([(UIKitWebAccessibilityObjectWrapper *)self _axIsWebKit2])
  {
    id v3 = 0;
  }
  else
  {
    id v3 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityWebDocumentView];
  }

  return v3;
}

- (BOOL)_axIsWebKit2
{
  id v3 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityValueForKey:@"IsWebKit2"];
  if (!v3)
  {
    v4 = NSNumber;
    objc_super v5 = [NSClassFromString(&cfstr_Uiapplication.isa) safeValueForKey:@"sharedApplication"];
    id v3 = [v4 numberWithInt:v5 == 0];

    [(UIKitWebAccessibilityObjectWrapper *)self _accessibilitySetRetainedValue:v3 forKey:@"IsWebKit2"];
  }
  char v6 = [v3 BOOLValue];

  return v6;
}

- (id)_accessibilityWebPageParent
{
  if ([(UIKitWebAccessibilityObjectWrapper *)self _axIsWebKit2]) {
    [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityWebPageObject];
  }
  else {
  id v3 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityWebDocumentView];
  }

  return v3;
}

- (BOOL)_accessibilityRequiresContextIdConversion
{
  return 1;
}

- (unsigned)_accessibilityContextId
{
  if ([(UIKitWebAccessibilityObjectWrapper *)self _axIsWebKit2])
  {
    id v3 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityValueForKey:@"contextId"];
    unsigned int v4 = [v3 unsignedIntValue];

    if (!v4)
    {
      objc_super v5 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityAncestorIsKindOf:objc_opt_class()];
      char v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v5, "contextId"));
      [(UIKitWebAccessibilityObjectWrapper *)self _accessibilitySetRetainedValue:v6 forKey:@"contextId"];

      unsigned int v7 = [v5 contextId];
      return v7;
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
    return [(UIKitWebAccessibilityObjectWrapper *)&v9 _accessibilityContextId];
  }
  return v4;
}

- (BOOL)_axWebKitSupportsARIAExpanded
{
  if ([(UIKitWebAccessibilityObjectWrapper *)self safeBoolForKey:@"accessibilitySupportsARIAExpanded"])return 1; {
  unint64_t v4 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityTraits];
  }
  if ((*MEMORY[0x263F1CF10] & ~v4) != 0) {
    return 0;
  }
  objc_super v5 = [(UIKitWebAccessibilityObjectWrapper *)self _axWebKitTrueLinkParent];
  char v6 = [v5 safeBoolForKey:@"accessibilitySupportsARIAExpanded"];

  return v6;
}

- (id)_accessibilityResolvedEditingStyles
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v18.receiver = self;
  v18.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
  v2 = [(UIKitWebAccessibilityObjectWrapper *)&v18 _accessibilityResolvedEditingStyles];
  id v3 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_super v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v9, "isEqualToString:", @"bold", (void)v14))
        {
          v10 = @"bold";
          v11 = (void *)MEMORY[0x263F216F0];
        }
        else if ([v9 isEqualToString:@"italic"])
        {
          v10 = @"italic";
          v11 = (void *)MEMORY[0x263F217A0];
        }
        else if ([v9 isEqualToString:@"underline"])
        {
          v10 = @"underline";
          v11 = (void *)MEMORY[0x263F218F0];
        }
        else
        {
          if (![v9 isEqualToString:@"fontsize"]) {
            continue;
          }
          v10 = @"fontsize";
          v11 = (void *)MEMORY[0x263F21758];
        }
        v12 = [v4 objectForKeyedSubscript:v10];
        [v3 setObject:v12 forKeyedSubscript:*v11];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v6);
  }

  return v3;
}

- (unint64_t)_accessibilityAutomationType
{
  unint64_t v3 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityTraits];
  if ((*MEMORY[0x263F1CF10] & v3) != 0) {
    return 42;
  }
  if ((*MEMORY[0x263F1CF00] & v3) != 0) {
    return 43;
  }
  if ((*MEMORY[0x263F1CF48] & v3) != 0) {
    return 48;
  }
  if ((*MEMORY[0x263F1CEE8] & v3) != 0) {
    return 9;
  }
  uint64_t v5 = [(UIKitWebAccessibilityObjectWrapper *)self safeStringForKey:@"accessibilityColorStringValue"];
  uint64_t v6 = [v5 length];

  if (v6) {
    return 67;
  }
  v7.receiver = self;
  v7.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
  return [(UIKitWebAccessibilityObjectWrapper *)&v7 _accessibilityAutomationType];
}

- (BOOL)_axWebKitIsAriaExpanded
{
  unint64_t v3 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityTraits];
  if ((*MEMORY[0x263F1CF10] & ~v3) != 0)
  {
    return [(UIKitWebAccessibilityObjectWrapper *)self safeBoolForKey:@"accessibilityIsExpanded"];
  }
  else
  {
    id v4 = [(UIKitWebAccessibilityObjectWrapper *)self _axWebKitTrueLinkParent];
    char v5 = [v4 safeBoolForKey:@"accessibilityIsExpanded"];

    return v5;
  }
}

- (id)_accessibilityCurrentStatus
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  id v14 = 0;
  unint64_t v3 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityTraits];
  if ((*MEMORY[0x263F1CF10] & ~v3) != 0)
  {
    id v4 = self;
  }
  else
  {
    id v4 = [(UIKitWebAccessibilityObjectWrapper *)self _axWebKitTrueLinkParent];
  }
  char v5 = v4;
  if (objc_opt_respondsToSelector())
  {
    v8 = v5;
    AXPerformSafeBlock();
  }
  id v6 = (id)v10[5];

  _Block_object_dispose(&v9, 8);

  return v6;
}

void __65__UIKitWebAccessibilityObjectWrapper__accessibilityCurrentStatus__block_invoke(uint64_t a1)
{
  objc_opt_class();
  v2 = [*(id *)(a1 + 32) accessibilityCurrentState];
  uint64_t v3 = __UIAccessibilityCastAsClass();

  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  char v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)accessibilitySortDirection
{
  uint64_t v17 = 0;
  objc_super v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  id v22 = 0;
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  v13 = __64__UIKitWebAccessibilityObjectWrapper_accessibilitySortDirection__block_invoke;
  id v14 = &unk_2650B7C30;
  long long v15 = self;
  long long v16 = &v17;
  AXPerformSafeBlock();
  id v3 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  if (v3)
  {
    v10.receiver = self;
    v10.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
    uint64_t v4 = [(UIKitWebAccessibilityObjectWrapper *)&v10 accessibilitySortDirection];
    if ([(UIKitWebAccessibilityObjectWrapper *)self _accessibilityBoolValueForKey:@"IgnoreTreeForSortDirection"]|| v4|| ([(UIKitWebAccessibilityObjectWrapper *)self accessibilityContainer], (uint64_t v7 = objc_claimAutoreleasedReturnValue()) == 0))
    {
LABEL_4:
      id v5 = v4;
    }
    else
    {
      v8 = (void *)v7;
      while (1)
      {
        [v8 _accessibilitySetBoolValue:1 forKey:@"IgnoreTreeForRequired"];
        id v5 = [v8 accessibilitySortDirection];
        if ([v5 length]) {
          break;
        }
        [v8 _accessibilitySetBoolValue:0 forKey:@"IgnoreTreeForRequired"];
        uint64_t v9 = [v8 accessibilityContainer];

        v8 = (void *)v9;
        if (!v9) {
          goto LABEL_4;
        }
      }
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

uint64_t __64__UIKitWebAccessibilityObjectWrapper_accessibilitySortDirection__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _accessibilityTableAncestor];

  return MEMORY[0x270F9A758]();
}

- (BOOL)accessibilityRequired
{
  v9.receiver = self;
  v9.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
  unsigned __int8 v3 = [(UIKitWebAccessibilityObjectWrapper *)&v9 accessibilityRequired];
  char v4 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityBoolValueForKey:@"IgnoreTreeForRequired"];
  LOBYTE(v5) = v4 ^ 1 | v3;
  if ((v4 & 1) == 0 && (v3 & 1) == 0)
  {
    uint64_t v5 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityContainer];
    if (v5)
    {
      id v6 = (void *)v5;
      while (1)
      {
        [v6 _accessibilitySetBoolValue:1 forKey:@"IgnoreTreeForRequired"];
        if ([v6 accessibilityRequired]) {
          break;
        }
        [v6 _accessibilitySetBoolValue:0 forKey:@"IgnoreTreeForRequired"];
        uint64_t v7 = [v6 accessibilityContainer];

        id v6 = (void *)v7;
        if (!v7)
        {
          LOBYTE(v5) = 0;
          return v5;
        }
      }

      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (BOOL)_axWebKitSupportsARIAPressed
{
  if ([(UIKitWebAccessibilityObjectWrapper *)self safeBoolForKey:@"accessibilitySupportsARIAPressed"])return 1; {
  unint64_t v4 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityTraits];
  }
  if ((*MEMORY[0x263F1CF10] & ~v4) != 0) {
    return 0;
  }
  uint64_t v5 = [(UIKitWebAccessibilityObjectWrapper *)self _axWebKitTrueLinkParent];
  char v6 = [v5 safeBoolForKey:@"accessibilitySupportsARIAPressed"];

  return v6;
}

- (id)accessibilityLinkRelationshipType
{
  unint64_t v3 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityTraits];
  if ((*MEMORY[0x263F1CF10] & ~v3) == 0)
  {
    unint64_t v4 = [(UIKitWebAccessibilityObjectWrapper *)self _axWebKitTrueLinkParent];
    if (v4 != self)
    {
      uint64_t v5 = v4;
      char v6 = [(UIKitWebAccessibilityObjectWrapper *)v4 accessibilityLinkRelationshipType];

      goto LABEL_6;
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
  char v6 = [(UIKitWebAccessibilityObjectWrapper *)&v8 accessibilityLinkRelationshipType];
LABEL_6:

  return v6;
}

- (BOOL)_axWebKitIsAriaPressed
{
  unint64_t v3 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityTraits];
  if ((*MEMORY[0x263F1CF10] & ~v3) != 0)
  {
    return [(UIKitWebAccessibilityObjectWrapper *)self safeBoolForKey:@"accessibilityIsPressed"];
  }
  else
  {
    unint64_t v4 = [(UIKitWebAccessibilityObjectWrapper *)self _axWebKitTrueLinkParent];
    char v5 = [v4 safeBoolForKey:@"accessibilityIsPressed"];

    return v5;
  }
}

- (int64_t)_accessibilityExpandedStatus
{
  if ([(UIKitWebAccessibilityObjectWrapper *)self _axWebKitSupportsARIAExpanded])
  {
    if ([(UIKitWebAccessibilityObjectWrapper *)self _axWebKitIsAriaExpanded]) {
      return 1;
    }
    else {
      return 2;
    }
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
    return [(UIKitWebAccessibilityObjectWrapper *)&v4 _accessibilityExpandedStatus];
  }
}

- (id)_accessibilityRoleDescription
{
  if ([(UIKitWebAccessibilityObjectWrapper *)self _prepareAccessibilityCall])
  {
    uint64_t v15 = 0;
    long long v16 = &v15;
    uint64_t v17 = 0x3032000000;
    objc_super v18 = __Block_byref_object_copy_;
    uint64_t v19 = __Block_byref_object_dispose_;
    id v20 = 0;
    if (objc_opt_respondsToSelector())
    {
      uint64_t v9 = MEMORY[0x263EF8330];
      uint64_t v10 = 3221225472;
      uint64_t v11 = __67__UIKitWebAccessibilityObjectWrapper__accessibilityRoleDescription__block_invoke;
      uint64_t v12 = &unk_2650B7C30;
      v13 = self;
      id v14 = &v15;
      AXPerformSafeBlock();
    }
    unint64_t v3 = [(UIKitWebAccessibilityObjectWrapper *)self safeStringForKey:@"accessibilityBrailleRoleDescription", v9, v10, v11, v12, v13, v14];
    if ([v3 length])
    {
      uint64_t v4 = v16[5];
      if (!v4)
      {
        v16[5] = @" ";

        uint64_t v4 = v16[5];
      }
      char v5 = [MEMORY[0x263F21660] axAttributedStringWithString:v4];
      [v5 setAttribute:v3 forKey:*MEMORY[0x263F21700]];
      char v6 = (void *)v16[5];
      v16[5] = (uint64_t)v5;
    }
    id v7 = (id)v16[5];

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void __67__UIKitWebAccessibilityObjectWrapper__accessibilityRoleDescription__block_invoke(uint64_t a1)
{
  objc_opt_class();
  v2 = [*(id *)(a1 + 32) accessibilityRoleDescription];
  uint64_t v3 = __UIAccessibilityCastAsClass();

  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  char v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (_NSRange)_accessibilitySelectedTextRange
{
  v4.receiver = self;
  v4.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
  id v2 = [(UIKitWebAccessibilityObjectWrapper *)&v4 _accessibilitySelectedTextRange];
  if (v2 == (id)0x7FFFFFFFFFFFFFFFLL) {
    id v2 = 0;
  }
  result.length = v3;
  result.location = (NSUInteger)v2;
  return result;
}

- (id)_accessibilityWebPageObject
{
  return (id)[(UIKitWebAccessibilityObjectWrapper *)self _accessibilityFindAncestor:&__block_literal_global_741 startWithSelf:0];
}

uint64_t __65__UIKitWebAccessibilityObjectWrapper__accessibilityWebPageObject__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Wkaccessibilit.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_accessibilityWebDocumentView
{
  if ([(UIKitWebAccessibilityObjectWrapper *)self _axIsWebKit2])
  {
    id v3 = 0;
    goto LABEL_23;
  }
  char v16 = 0;
  objc_opt_class();
  objc_super v4 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityValueForKey:@"AXWebDocumentViewKey"];
  char v5 = __UIAccessibilityCastAsClass();

  if (v5)
  {
    id v3 = v5;
    goto LABEL_22;
  }
  NSClassFromString(&cfstr_Uiwebdocumentv.isa);
  NSClassFromString(&cfstr_Webview.isa);
  v15.receiver = self;
  v15.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
  id v6 = [(UIKitWebAccessibilityObjectWrapper *)&v15 _accessibilityWebDocumentView];
  id v7 = v6;
  if (!v6) {
    goto LABEL_20;
  }
  objc_super v8 = v6;
  while (1)
  {
    if (objc_opt_isKindOfClass())
    {
      id v9 = v8;

      id v7 = v9;
    }
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      break;
    }
    uint64_t v10 = [v8 accessibilityContainer];
LABEL_13:
    uint64_t v11 = (void *)v10;

    objc_super v8 = v11;
    if (!v11)
    {
      if (!v7) {
        goto LABEL_20;
      }
      goto LABEL_17;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = [v8 safeValueForKey:@"superview"];
    goto LABEL_13;
  }

  if (!v7) {
    goto LABEL_20;
  }
LABEL_17:
  uint64_t v12 = [v7 _accessibilityValueForKey:@"AXDocumentSeenChildren"];
  if (!v12)
  {
    uint64_t v12 = [MEMORY[0x263EFF980] array];
    [v7 _accessibilitySetRetainedValue:v12 forKey:@"AXDocumentSeenChildren"];
  }
  [v12 addObject:self];
  [(UIKitWebAccessibilityObjectWrapper *)self _accessibilitySetAssignedValue:v7 forKey:@"AXWebDocumentViewKey"];

LABEL_20:
  char v16 = 0;
  objc_opt_class();
  uint64_t v13 = __UIAccessibilityCastAsClass();
  if (v16) {
    abort();
  }
  id v3 = (id)v13;

LABEL_22:
LABEL_23:

  return v3;
}

- (BOOL)_accessibilityIsFrameOutOfBounds
{
  return 0;
}

- (id)_accessibilityColorDescription
{
  id v2 = [(UIKitWebAccessibilityObjectWrapper *)self safeStringForKey:@"accessibilityColorStringValue"];
  id v3 = [v2 componentsSeparatedByString:@" "];
  if ([v3 count] == 5)
  {
    objc_super v4 = [v3 objectAtIndexedSubscript:0];
    int v5 = [v4 isEqualToString:@"rgb"];

    id v6 = 0;
    if (v5)
    {
      id v7 = (void *)MEMORY[0x263F1C550];
      objc_super v8 = [v3 objectAtIndexedSubscript:1];
      [v8 doubleValue];
      double v10 = v9;
      uint64_t v11 = [v3 objectAtIndexedSubscript:2];
      [v11 doubleValue];
      double v13 = v12;
      id v14 = [v3 objectAtIndexedSubscript:3];
      [v14 doubleValue];
      double v16 = v15;
      uint64_t v17 = [v3 objectAtIndexedSubscript:4];
      [v17 doubleValue];
      id v6 = [v7 colorWithRed:v10 green:v13 blue:v16 alpha:v18];
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)accessibilityContainer
{
  id v3 = objc_msgSend(NSString, "stringWithFormat:", @"%p-_accessibilityContainer", self);
  objc_super v4 = (id *)MEMORY[0x263F81160];
  int v5 = [(id)*MEMORY[0x263F81160] objectForKeyedSubscript:v3];

  if (v5)
  {
    id v6 = [*v4 objectForKeyedSubscript:v3];
  }
  else if ([(UIKitWebAccessibilityObjectWrapper *)self _prepareAccessibilityCall])
  {
    id v6 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityUserDefinedContainer];
    if (!v6)
    {
      v8.receiver = self;
      v8.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
      id v6 = [(UIKitWebAccessibilityObjectWrapper *)&v8 accessibilityContainer];
    }
    [*v4 setObject:v6 forKeyedSubscript:v3];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_accessibilityDataDetectorScheme:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if ([(UIKitWebAccessibilityObjectWrapper *)self _axIsWebKit2]) {
    [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityWebPageObject];
  }
  else {
  id v6 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityWebDocumentView];
  }
  id v7 = objc_msgSend(v6, "_accessibilityDataDetectorScheme:", x, y);

  return v7;
}

- (BOOL)_axIsWK2DataDetectorLink
{
  if (![(UIKitWebAccessibilityObjectWrapper *)self _axIsWebKit2]) {
    return 0;
  }
  unint64_t v3 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityTraits];
  if ((*MEMORY[0x263F1CF10] & ~v3) != 0) {
    return 0;
  }
  objc_super v4 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityURL];
  int v5 = v4;
  if (v4)
  {
    id v6 = [v4 absoluteString];
    char v7 = [v6 hasPrefix:@"x-apple-data-detectors:"];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)isAccessibilityElement
{
  if ([(UIKitWebAccessibilityObjectWrapper *)self _prepareAccessibilityCall])
  {
    unint64_t v3 = objc_msgSend(NSString, "stringWithFormat:", @"%p-_axObjWrapperIsElement", self);
    uint64_t v31 = 0;
    PossiblyNilObjectForKedouble y = _AXServerCacheGetPossiblyNilObjectForKey();
    id v5 = 0;
    id v6 = v5;
    if (PossiblyNilObjectForKey)
    {
      LOBYTE(v7) = [v5 BOOLValue];
LABEL_29:

      return v7;
    }
    v30.receiver = self;
    v30.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
    int v8 = [(UIKitWebAccessibilityObjectWrapper *)&v30 isAccessibilityElement];
    unint64_t v9 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityTraits];
    if (v8)
    {
LABEL_6:
      LODWORD(v10) = 1;
      goto LABEL_23;
    }
    uint64_t v11 = *MEMORY[0x263F1CF10];
    if ((*MEMORY[0x263F1CF10] & v9) != 0)
    {
      double v12 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityContainer];
      uint64_t v13 = [v12 accessibilityTraits] & v11;

      if (!v13)
      {
        id v14 = self;
        double v15 = v14;
        while (v15
             && [(UIKitWebAccessibilityObjectWrapper *)v15 accessibilityElementCount] == 1)
        {
          double v16 = [(UIKitWebAccessibilityObjectWrapper *)v15 accessibilityElementAtIndex:0];

          double v15 = v16;
          if ([(UIKitWebAccessibilityObjectWrapper *)v16 _accessibilityIsFrameOutOfBounds])
          {
            LODWORD(v10) = 1;
            [(UIKitWebAccessibilityObjectWrapper *)v14 setIsAccessibilityElement:1];

            goto LABEL_23;
          }
        }
      }
      uint64_t v17 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityLabel];
      uint64_t v10 = [v17 length];

      if (!v10) {
        goto LABEL_23;
      }
      uint64_t v18 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityElementCount];
      if (v18 < 1) {
        goto LABEL_6;
      }
      uint64_t v19 = v18;
      uint64_t v20 = 0;
      while (1)
      {
        v21 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityElementAtIndex:v20];
        if (v21)
        {
          id v22 = v21;
          v23 = [v21 accessibilityLabel];
          uint64_t v24 = [v23 length];

          if (v24) {
            break;
          }
        }
        if (v19 == ++v20) {
          goto LABEL_6;
        }
      }
    }
    LODWORD(v10) = 0;
LABEL_23:
    [(UIKitWebAccessibilityObjectWrapper *)self accessibilityElementRect];
    uint64_t v7 = 0;
    if (v26 != 0.0 && v25 != 0.0)
    {
      v27 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityMathEquationRootObject];

      if (v27) {
        uint64_t v7 = 0;
      }
      else {
        uint64_t v7 = v10;
      }
    }
    v28 = [NSNumber numberWithBool:v7];
    _AXServerCacheInsertPossiblyNilObjectForKey();

    goto LABEL_29;
  }
  LOBYTE(v7) = 0;
  return v7;
}

- (id)_axAncestorTypes
{
  unint64_t v3 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityValueForKey:@"AXContainerTypes"];
  if (!v3)
  {
    unint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    [(UIKitWebAccessibilityObjectWrapper *)self _accessibilitySetRetainedValue:v3 forKey:@"AXContainerTypes"];
    uint64_t v100 = 0;
    v101 = &v100;
    uint64_t v102 = 0x3032000000;
    v103 = __Block_byref_object_copy_;
    v104 = __Block_byref_object_dispose_;
    id v105 = 0;
    uint64_t v94 = MEMORY[0x263EF8330];
    uint64_t v95 = 3221225472;
    v96 = __54__UIKitWebAccessibilityObjectWrapper__axAncestorTypes__block_invoke;
    v97 = &unk_2650B7C30;
    v98 = self;
    v99 = &v100;
    AXPerformSafeBlock();
    uint64_t v4 = v101[5];
    if (v4) {
      [v3 setObject:v4 forKey:&unk_26F4939B8];
    }
    uint64_t v88 = 0;
    v89 = &v88;
    uint64_t v90 = 0x3032000000;
    v91 = __Block_byref_object_copy_;
    v92 = __Block_byref_object_dispose_;
    id v93 = 0;
    uint64_t v82 = MEMORY[0x263EF8330];
    uint64_t v83 = 3221225472;
    v84 = __54__UIKitWebAccessibilityObjectWrapper__axAncestorTypes__block_invoke_784;
    v85 = &unk_2650B7C30;
    v86 = self;
    v87 = &v88;
    AXPerformSafeBlock();
    uint64_t v5 = v89[5];
    if (v5) {
      [v3 setObject:v5 forKey:&unk_26F4939D0];
    }
    uint64_t v76 = 0;
    v77 = &v76;
    uint64_t v78 = 0x3032000000;
    v79 = __Block_byref_object_copy_;
    v80 = __Block_byref_object_dispose_;
    id v81 = 0;
    uint64_t v70 = MEMORY[0x263EF8330];
    uint64_t v71 = 3221225472;
    v72 = __54__UIKitWebAccessibilityObjectWrapper__axAncestorTypes__block_invoke_787;
    v73 = &unk_2650B7C30;
    v75 = &v76;
    v74 = self;
    AXPerformSafeBlock();
    uint64_t v6 = v77[5];
    if (v6) {
      [v3 setObject:v6 forKey:&unk_26F4939E8];
    }
    uint64_t v64 = 0;
    v65 = &v64;
    uint64_t v66 = 0x3032000000;
    v67 = __Block_byref_object_copy_;
    v68 = __Block_byref_object_dispose_;
    id v69 = 0;
    uint64_t v58 = MEMORY[0x263EF8330];
    uint64_t v59 = 3221225472;
    v60 = __54__UIKitWebAccessibilityObjectWrapper__axAncestorTypes__block_invoke_790;
    v61 = &unk_2650B7C30;
    v62 = self;
    v63 = &v64;
    AXPerformSafeBlock();
    uint64_t v7 = v65[5];
    if (v7) {
      [v3 setObject:v7 forKey:&unk_26F493A00];
    }
    uint64_t v52 = 0;
    v53 = &v52;
    uint64_t v54 = 0x3032000000;
    v55 = __Block_byref_object_copy_;
    v56 = __Block_byref_object_dispose_;
    id v57 = 0;
    uint64_t v46 = MEMORY[0x263EF8330];
    uint64_t v47 = 3221225472;
    v48 = __54__UIKitWebAccessibilityObjectWrapper__axAncestorTypes__block_invoke_793;
    v49 = &unk_2650B7C30;
    v50 = self;
    v51 = &v52;
    AXPerformSafeBlock();
    uint64_t v8 = v53[5];
    if (v8) {
      [v3 setObject:v8 forKey:&unk_26F493A18];
    }
    uint64_t v40 = 0;
    v41 = &v40;
    uint64_t v42 = 0x3032000000;
    v43 = __Block_byref_object_copy_;
    v44 = __Block_byref_object_dispose_;
    id v45 = 0;
    uint64_t v34 = MEMORY[0x263EF8330];
    uint64_t v35 = 3221225472;
    v36 = __54__UIKitWebAccessibilityObjectWrapper__axAncestorTypes__block_invoke_796;
    v37 = &unk_2650B7C30;
    v38 = self;
    v39 = &v40;
    AXPerformSafeBlock();
    uint64_t v9 = v41[5];
    if (v9) {
      [v3 setObject:v9 forKey:&unk_26F493A30];
    }
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x3032000000;
    uint64_t v31 = __Block_byref_object_copy_;
    v32 = __Block_byref_object_dispose_;
    id v33 = 0;
    uint64_t v22 = MEMORY[0x263EF8330];
    uint64_t v23 = 3221225472;
    uint64_t v24 = __54__UIKitWebAccessibilityObjectWrapper__axAncestorTypes__block_invoke_799;
    double v25 = &unk_2650B7C30;
    double v26 = self;
    v27 = &v28;
    AXPerformSafeBlock();
    uint64_t v10 = v29[5];
    if (v10) {
      [v3 setObject:v10 forKey:&unk_26F493A48];
    }
    uint64_t v16 = 0;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x3032000000;
    uint64_t v19 = __Block_byref_object_copy_;
    uint64_t v20 = __Block_byref_object_dispose_;
    id v21 = 0;
    uint64_t v15 = MEMORY[0x263EF8330];
    AXPerformSafeBlock();
    uint64_t v11 = v17[5];
    if (v11) {
      objc_msgSend(v3, "setObject:forKey:", v11, &unk_26F493A60, v15, 3221225472, __54__UIKitWebAccessibilityObjectWrapper__axAncestorTypes__block_invoke_802, &unk_2650B7C30, self, &v16);
    }
    double v12 = self;
    if (v12)
    {
      do
      {
        NSClassFromString(&cfstr_Webaccessibili.isa);
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          break;
        }
        if ([(UIKitWebAccessibilityObjectWrapper *)v12 safeBoolForKey:@"accessibilityIsDialog"])
        {
          [v3 setObject:v12 forKey:&unk_26F493A78];
          break;
        }
        uint64_t v13 = [(UIKitWebAccessibilityObjectWrapper *)v12 accessibilityContainer];

        double v12 = (UIKitWebAccessibilityObjectWrapper *)v13;
      }
      while (v13);
    }

    _Block_object_dispose(&v16, 8);
    _Block_object_dispose(&v28, 8);

    _Block_object_dispose(&v40, 8);
    _Block_object_dispose(&v52, 8);

    _Block_object_dispose(&v64, 8);
    _Block_object_dispose(&v76, 8);

    _Block_object_dispose(&v88, 8);
    _Block_object_dispose(&v100, 8);
  }

  return v3;
}

uint64_t __54__UIKitWebAccessibilityObjectWrapper__axAncestorTypes__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _accessibilityListAncestor];

  return MEMORY[0x270F9A758]();
}

uint64_t __54__UIKitWebAccessibilityObjectWrapper__axAncestorTypes__block_invoke_784(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _accessibilityDescriptionListAncestor];

  return MEMORY[0x270F9A758]();
}

uint64_t __54__UIKitWebAccessibilityObjectWrapper__axAncestorTypes__block_invoke_787(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _accessibilityTableAncestor];

  return MEMORY[0x270F9A758]();
}

uint64_t __54__UIKitWebAccessibilityObjectWrapper__axAncestorTypes__block_invoke_790(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _accessibilityLandmarkAncestor];

  return MEMORY[0x270F9A758]();
}

uint64_t __54__UIKitWebAccessibilityObjectWrapper__axAncestorTypes__block_invoke_793(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _accessibilityArticleAncestor];

  return MEMORY[0x270F9A758]();
}

uint64_t __54__UIKitWebAccessibilityObjectWrapper__axAncestorTypes__block_invoke_796(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _accessibilityFieldsetAncestor];

  return MEMORY[0x270F9A758]();
}

uint64_t __54__UIKitWebAccessibilityObjectWrapper__axAncestorTypes__block_invoke_799(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _accessibilityFrameAncestor];

  return MEMORY[0x270F9A758]();
}

uint64_t __54__UIKitWebAccessibilityObjectWrapper__axAncestorTypes__block_invoke_802(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _accessibilityTreeAncestor];

  return MEMORY[0x270F9A758]();
}

- (id)_accessibilityContainerTypes
{
  if ([(UIKitWebAccessibilityObjectWrapper *)self _prepareAccessibilityCall])
  {
    unint64_t v3 = [(UIKitWebAccessibilityObjectWrapper *)self _axAncestorTypes];
    uint64_t v4 = [v3 allKeys];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (BOOL)_accessibilityIsGroupedParent
{
  if (_accessibilityIsGroupedParent_onceToken != -1) {
    dispatch_once(&_accessibilityIsGroupedParent_onceToken, &__block_literal_global_808);
  }
  v4.receiver = self;
  v4.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
  return [(UIKitWebAccessibilityObjectWrapper *)&v4 _accessibilityIsGroupedParent];
}

uint64_t __67__UIKitWebAccessibilityObjectWrapper__accessibilityIsGroupedParent__block_invoke()
{
  _accessibilityIsGroupedParent_predicateSet = [MEMORY[0x263EFFA08] setWithArray:&unk_26F493D78];

  return MEMORY[0x270F9A758]();
}

- (BOOL)_accessibilityIsDataEmpty:(id)a3
{
  id v3 = a3;
  objc_super v4 = (unsigned char *)[v3 bytes];
  unint64_t v5 = [v3 length];
  if (v5)
  {
    if (*v4)
    {
      BOOL v6 = 0;
    }
    else
    {
      uint64_t v7 = 1;
      do
      {
        unint64_t v8 = v7;
        if (v5 == v7) {
          break;
        }
        ++v7;
      }
      while (!v4[v8]);
      BOOL v6 = v8 >= v5;
    }
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

- (id)_accessibilityConvertDataArrayToTextMarkerArray:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(UIKitWebAccessibilityObjectWrapper *)self _prepareAccessibilityCall])
  {
    id v12 = [MEMORY[0x263EFF980] array];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v20 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && ![(UIKitWebAccessibilityObjectWrapper *)self _accessibilityIsDataEmpty:v9])
          {
            uint64_t v13 = 0;
            id v14 = &v13;
            uint64_t v15 = 0x3032000000;
            uint64_t v16 = __Block_byref_object_copy_;
            uint64_t v17 = __Block_byref_object_dispose_;
            id v18 = 0;
            AXPerformSafeBlock();
            id v10 = (id)v14[5];
            _Block_object_dispose(&v13, 8);

            if (v10) {
              [v12 addObject:v10];
            }
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v6);
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

uint64_t __86__UIKitWebAccessibilityObjectWrapper__accessibilityConvertDataArrayToTextMarkerArray___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [objc_allocWithZone(NSClassFromString(&cfstr_Webaccessibili_1.isa)) initWithData:a1[4] accessibilityObject:a1[5]];

  return MEMORY[0x270F9A758]();
}

- (id)_accessibilityConvertTextMarkersToDataArray:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF980] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "safeValueForKey:", @"dataRepresentation", (void)v12);
        if (v10) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)_accessibilityObjectForTextMarker:(id)a3
{
  id v4 = a3;
  if ([(UIKitWebAccessibilityObjectWrapper *)self _prepareAccessibilityCall])
  {
    id v5 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v4, 0);
    uint64_t v6 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityConvertDataArrayToTextMarkerArray:v5];

    uint64_t v7 = [v6 lastObject];
    uint64_t v8 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityObjectForTextMarker:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)_accessibilityTextRectsForSpeakThisStringRange:(_NSRange)a3 string:(id)a4 wantsSentences:(BOOL)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v43[2] = *MEMORY[0x263EF8340];
  id v8 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v8 length])
  {
    uint64_t v34 = 0;
    uint64_t v35 = &v34;
    uint64_t v36 = 0x3032000000;
    v37 = __Block_byref_object_copy_;
    v38 = __Block_byref_object_dispose_;
    id v39 = 0;
    uint64_t v9 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityTextMarkerForPosition:location];
    uint64_t v10 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityTextMarkerForPosition:location + length];
    uint64_t v11 = (void *)v10;
    if (v9 && v10)
    {
      long long v12 = AXLogSpeakScreen();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[UIKitWebAccessibilityObjectWrapper _accessibilityTextRectsForSpeakThisStringRange:string:wantsSentences:]();
      }

      long long v13 = [MEMORY[0x263F08708] whitespaceCharacterSet];
      long long v14 = [v8 stringByTrimmingCharactersInSet:v13];

      long long v15 = [MEMORY[0x263F08708] newlineCharacterSet];
      uint64_t v16 = [v14 stringByTrimmingCharactersInSet:v15];

      if ([v16 hasSuffix:@","]
        && (unint64_t)[v16 length] >= 2)
      {
        uint64_t v17 = objc_msgSend(v16, "substringToIndex:", objc_msgSend(v16, "length") - 1);

        uint64_t v16 = (void *)v17;
      }
      v43[0] = v9;
      v43[1] = v11;
      id v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:2];
      long long v19 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityConvertDataArrayToTextMarkerArray:v18];

      uint64_t v28 = MEMORY[0x263EF8330];
      uint64_t v29 = 3221225472;
      uint64_t v30 = __107__UIKitWebAccessibilityObjectWrapper__accessibilityTextRectsForSpeakThisStringRange_string_wantsSentences___block_invoke;
      uint64_t v31 = &unk_2650B7CA0;
      v32 = self;
      id v33 = v19;
      id v8 = v16;
      AXPerformSafeBlock();
    }
    if (!objc_msgSend((id)v35[5], "count", v28, v29, v30, v31, v32))
    {
      if ([(UIKitWebAccessibilityObjectWrapper *)self _isIBooks])
      {
        long long v20 = AXLogSpeakScreen();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
          -[UIKitWebAccessibilityObjectWrapper _accessibilityTextRectsForSpeakThisStringRange:string:wantsSentences:](v20);
        }

        long long v21 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
        uint64_t v42 = v21;
        uint64_t v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v42 count:1];
      }
      else
      {
        uint64_t v24 = AXLogSpeakScreen();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
          -[UIKitWebAccessibilityObjectWrapper _accessibilityTextRectsForSpeakThisStringRange:string:wantsSentences:](v24);
        }

        double v25 = (void *)MEMORY[0x263F08D40];
        [(UIKitWebAccessibilityObjectWrapper *)self accessibilityFrame];
        long long v21 = objc_msgSend(v25, "valueWithCGRect:");
        v41 = v21;
        uint64_t v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v41 count:1];
      }
      double v26 = (void *)v35[5];
      v35[5] = v22;
    }
    id v23 = (id)v35[5];

    _Block_object_dispose(&v34, 8);
  }
  else
  {
    v40.receiver = self;
    v40.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
    -[UIKitWebAccessibilityObjectWrapper _accessibilityTextRectsForSpeakThisStringRange:string:](&v40, sel__accessibilityTextRectsForSpeakThisStringRange_string_, location, length, v8);
    id v23 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v23;
}

void __107__UIKitWebAccessibilityObjectWrapper__accessibilityTextRectsForSpeakThisStringRange_string_wantsSentences___block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 64))
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = [*(id *)(a1 + 32) textRectsFromMarkers:*(void *)(a1 + 40) withText:*(void *)(a1 + 48)];
    MEMORY[0x270F9A758]();
  }
  else
  {
    id v2 = (void *)MEMORY[0x263F08D40];
    [*(id *)(a1 + 32) frameForTextMarkers:*(void *)(a1 + 40)];
    id v3 = objc_msgSend(v2, "valueWithRect:");
    v7[0] = v3;
    uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
    uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
}

- (CGRect)accessibilityBoundsForTextMarkers:(id)a3
{
  id v4 = a3;
  if ([(UIKitWebAccessibilityObjectWrapper *)self _prepareAccessibilityCall])
  {
    uint64_t v5 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityConvertDataArrayToTextMarkerArray:v4];
    [(UIKitWebAccessibilityObjectWrapper *)self frameForTextMarkers:v5];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
  }
  else
  {
    double v7 = *MEMORY[0x263F001A8];
    double v9 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v11 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v13 = *(double *)(MEMORY[0x263F001A8] + 24);
  }

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (id)accessibilityStringForTextMarkers:(id)a3
{
  id v4 = a3;
  if ([(UIKitWebAccessibilityObjectWrapper *)self _prepareAccessibilityCall])
  {
    uint64_t v5 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityConvertDataArrayToTextMarkerArray:v4];
    double v6 = [(UIKitWebAccessibilityObjectWrapper *)self stringForTextMarkers:v5];
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (id)accessibilityArrayOfTextForTextMarkers:(id)a3
{
  id v4 = a3;
  if ([(UIKitWebAccessibilityObjectWrapper *)self _prepareAccessibilityCall])
  {
    uint64_t v5 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityConvertDataArrayToTextMarkerArray:v4];
    double v6 = [(UIKitWebAccessibilityObjectWrapper *)self arrayOfTextForTextMarkers:v5 attributed:0];
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (id)_accessibilityTextMarkerRangeForSelection
{
  if ([(UIKitWebAccessibilityObjectWrapper *)self _prepareAccessibilityCall])
  {
    id v3 = [(UIKitWebAccessibilityObjectWrapper *)self safeValueForKey:@"textMarkerRangeForSelection"];
    id v4 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityConvertTextMarkersToDataArray:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)_accessibilityTextMarkerRange
{
  if ([(UIKitWebAccessibilityObjectWrapper *)self _prepareAccessibilityCall])
  {
    id v3 = [(UIKitWebAccessibilityObjectWrapper *)self safeValueForKey:@"textMarkerRange"];
    id v4 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityConvertTextMarkersToDataArray:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)_accessibilityMarkerPosition:(BOOL)a3 withMarker:(id)a4
{
  id v6 = a4;
  if ([(UIKitWebAccessibilityObjectWrapper *)self _prepareAccessibilityCall])
  {
    double v7 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v6, 0);
    double v8 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityConvertDataArrayToTextMarkerArray:v7];

    double v9 = [v8 lastObject];

    if (a3) {
      [(UIKitWebAccessibilityObjectWrapper *)self nextMarkerForMarker:v9];
    }
    else {
    double v11 = [(UIKitWebAccessibilityObjectWrapper *)self previousMarkerForMarker:v9];
    }
    double v10 = [v11 safeValueForKey:@"dataRepresentation"];
  }
  else
  {
    double v10 = 0;
    double v9 = v6;
  }

  return v10;
}

- (id)_accessibilityPreviousMarker:(id)a3
{
  return [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityMarkerPosition:0 withMarker:a3];
}

- (id)_accessibilityNextMarker:(id)a3
{
  return [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityMarkerPosition:1 withMarker:a3];
}

- (int64_t)_accessibilityLineEndPosition
{
  uint64_t v2 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityLineRangeForPosition:[(UIKitWebAccessibilityObjectWrapper *)self _accessibilitySelectedTextRange]];
  return v2 + v3;
}

- (int64_t)_accessibilityLineStartPosition
{
  uint64_t v3 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilitySelectedTextRange];

  return [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityLineRangeForPosition:v3];
}

- (id)_accessibilityLinePosition:(BOOL)a3 withMarker:(id)a4
{
  id v6 = a4;
  if ([(UIKitWebAccessibilityObjectWrapper *)self _prepareAccessibilityCall])
  {
    double v7 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v6, 0);
    double v8 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityConvertDataArrayToTextMarkerArray:v7];

    double v9 = [v8 lastObject];

    if (a3) {
      [(UIKitWebAccessibilityObjectWrapper *)self lineStartMarkerForMarker:v9];
    }
    else {
    double v11 = [(UIKitWebAccessibilityObjectWrapper *)self lineEndMarkerForMarker:v9];
    }
    double v10 = [v11 safeValueForKey:@"dataRepresentation"];
  }
  else
  {
    double v10 = 0;
    double v9 = v6;
  }

  return v10;
}

- (id)_accessibilityLineEndMarker:(id)a3
{
  return [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityLinePosition:0 withMarker:a3];
}

- (id)_accessibilityLineStartMarker:(id)a3
{
  return [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityLinePosition:1 withMarker:a3];
}

- (_NSRange)_accessibilityCharacterRangeForPosition:(unint64_t)a3
{
  id v4 = [(UIKitWebAccessibilityObjectWrapper *)self textMarkerForPosition:a3];
  if (v4)
  {
    uint64_t v5 = [(UIKitWebAccessibilityObjectWrapper *)self nextMarkerForMarker:v4];
    if (v5)
    {
      id v6 = [MEMORY[0x263EFF980] array];
      [v6 axSafelyAddObject:v4];
      [v6 axSafelyAddObject:v5];
      uint64_t v7 = [(UIKitWebAccessibilityObjectWrapper *)self _rangeForWebTextMarkers:v6];
      NSUInteger v9 = v8;
    }
    else
    {
      NSUInteger v9 = 0;
      uint64_t v7 = 0x7FFFFFFFLL;
    }
  }
  else
  {
    NSUInteger v9 = 0;
    uint64_t v7 = 0x7FFFFFFFLL;
  }

  NSUInteger v10 = v7;
  NSUInteger v11 = v9;
  result.NSUInteger length = v11;
  result.NSUInteger location = v10;
  return result;
}

- (_NSRange)_accessibilityLineRangeForPosition:(unint64_t)a3
{
  v40[2] = *MEMORY[0x263EF8340];
  uint64_t v5 = -[UIKitWebAccessibilityObjectWrapper _accessibilityTextMarkerForPosition:](self, "_accessibilityTextMarkerForPosition:");
  id v6 = v5;
  if (!v5)
  {
    v38.receiver = self;
    v38.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
    id v14 = [(UIKitWebAccessibilityObjectWrapper *)&v38 _accessibilityLineRangeForPosition:a3];
    NSUInteger v16 = v15;
    goto LABEL_22;
  }
  if (a3)
  {
    uint64_t v7 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityPreviousMarker:v5];
    NSUInteger v8 = (void *)v7;
    if (!v7) {
      goto LABEL_5;
    }
    v40[0] = v7;
    v40[1] = v6;
    NSUInteger v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v40 count:2];
    NSUInteger v10 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityStringForTextMarkers:v9];
    NSUInteger v11 = [MEMORY[0x263F08708] newlineCharacterSet];
    BOOL v12 = [v10 rangeOfCharacterFromSet:v11] == 0x7FFFFFFFFFFFFFFFLL;

    if (!v12) {
      id v13 = v6;
    }
    else {
LABEL_5:
    }
      id v13 = 0;
  }
  else
  {
    id v13 = v5;
  }
  uint64_t v17 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityNextMarker:v6];
  id v18 = (void *)v17;
  if (!v17) {
    goto LABEL_12;
  }
  v39[0] = v6;
  v39[1] = v17;
  long long v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:2];
  long long v20 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityStringForTextMarkers:v19];
  long long v21 = [MEMORY[0x263F08708] newlineCharacterSet];
  BOOL v22 = [v20 rangeOfCharacterFromSet:v21] == 0x7FFFFFFFFFFFFFFFLL;

  if (v22)
  {
LABEL_12:
    id v23 = 0;
    if (v13) {
      goto LABEL_13;
    }
LABEL_16:
    id v13 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityLineStartMarker:v6];
    if (v23) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  id v23 = v6;
  if (!v13) {
    goto LABEL_16;
  }
LABEL_13:
  if (v23) {
    goto LABEL_18;
  }
LABEL_17:
  id v23 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityLineEndMarker:v6];
LABEL_18:
  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x3032000000;
  uint64_t v35 = __Block_byref_object_copy_;
  uint64_t v36 = __Block_byref_object_dispose_;
  id v37 = 0;
  id v31 = v6;
  AXPerformSafeBlock();
  id v24 = (id)v33[5];

  _Block_object_dispose(&v32, 8);
  if (!v24) {
    goto LABEL_20;
  }
  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x3032000000;
  uint64_t v35 = __Block_byref_object_copy_;
  uint64_t v36 = __Block_byref_object_dispose_;
  id v37 = 0;
  id v30 = v24;
  AXPerformSafeBlock();
  id v25 = (id)v33[5];

  _Block_object_dispose(&v32, 8);
  double v26 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityConvertTextMarkersToDataArray:v25];

  if (!v26)
  {
LABEL_20:
    double v26 = [MEMORY[0x263EFF980] array];
    [v26 axSafelyAddObject:v13];
    [v26 axSafelyAddObject:v23];
  }
  id v14 = (id)[(UIKitWebAccessibilityObjectWrapper *)self _accessibilityRangeForTextMarkers:v26];
  NSUInteger v16 = v27;

LABEL_22:
  NSUInteger v28 = (NSUInteger)v14;
  NSUInteger v29 = v16;
  result.NSUInteger length = v29;
  result.NSUInteger location = v28;
  return result;
}

uint64_t __73__UIKitWebAccessibilityObjectWrapper__accessibilityLineRangeForPosition___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [objc_allocWithZone(NSClassFromString(&cfstr_Webaccessibili_1.isa)) initWithData:a1[4] accessibilityObject:a1[5]];

  return MEMORY[0x270F9A758]();
}

uint64_t __73__UIKitWebAccessibilityObjectWrapper__accessibilityLineRangeForPosition___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) lineMarkersForMarker:*(void *)(a1 + 40)];

  return MEMORY[0x270F9A758]();
}

- (id)_accessibilityMarkerForPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if ([(UIKitWebAccessibilityObjectWrapper *)self _prepareAccessibilityCall])
  {
    id v6 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityWebDocumentView];
    uint64_t v7 = [v6 safeValueForKey:@"_accessibilityDocumentView"];
    NSUInteger v8 = [v6 window];
    objc_msgSend(v8, "convertPoint:toView:", v6, x, y);
    double v10 = v9;
    double v12 = v11;

    objc_msgSend(v7, "convertPoint:fromView:", 0, v10, v12);
    id v13 = -[UIKitWebAccessibilityObjectWrapper textMarkerForPoint:](self, "textMarkerForPoint:");
    id v14 = [v13 safeValueForKey:@"dataRepresentation"];
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (BOOL)_isCheckBox
{
  uint64_t v3 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityValueForKey:@"AXCheckBoxValue"];
  if (!v3)
  {
    unint64_t v4 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityTraits];
    [(UIKitWebAccessibilityObjectWrapper *)self _accessibilitySetBoolValue:(*MEMORY[0x263F1CF60] & ~v4) == 0 forKey:@"AXCheckBoxValue"];
  }
  char v5 = [v3 BOOLValue];

  return v5;
}

- (float)_accessibilityActivationDelay
{
  if ([(UIKitWebAccessibilityObjectWrapper *)self safeBoolForKey:@"accessibilityIsAttachmentElement"])return 0.2; {
  v4.receiver = self;
  }
  v4.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
  [(UIKitWebAccessibilityObjectWrapper *)&v4 _accessibilityActivationDelay];
  return result;
}

- (void)accessibilityElementDidBecomeFocused
{
  unint64_t v3 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityTraits];
  if (((*MEMORY[0x263F81408] | *MEMORY[0x263F813C0]) & v3) == 0
    && ([(UIKitWebAccessibilityObjectWrapper *)self safeBoolForKey:@"accessibilityIsComboBox"] & 1) == 0
    && ([(UIKitWebAccessibilityObjectWrapper *)self safeBoolForKey:@"accessibilityIsShowingValidationMessage"] & 1) == 0)
  {
    objc_super v4 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityAssistiveTechnologyFocusedIdentifiers];
    int v5 = [v4 containsObject:*MEMORY[0x263F1CE28]];

    if (v5)
    {
      [(UIKitWebAccessibilityObjectWrapper *)self _accessibilitySetNativeFocus];
      v6.receiver = self;
      v6.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
      [(UIKitWebAccessibilityObjectWrapper *)&v6 accessibilityElementDidBecomeFocused];
    }
  }
}

- (BOOL)_accessibilitySupportsActivateAction
{
  unint64_t v3 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityTraits];
  if ((*MEMORY[0x263F1CF10] & v3) != 0)
  {
    [(UIKitWebAccessibilityObjectWrapper *)self accessibilityActivationPoint];
    UIAccessibilitySceneReferencePointForScreenPoint();
    objc_super v4 = -[UIKitWebAccessibilityObjectWrapper _accessibilityDataDetectorScheme:](self, "_accessibilityDataDetectorScheme:");
    if (v4)
    {

      return 0;
    }
    if ([(UIKitWebAccessibilityObjectWrapper *)self _axIsWK2DataDetectorLink]) {
      return 0;
    }
  }
  unint64_t v5 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityTraits];
  if ((*MEMORY[0x263F81408] & ~v5) == 0) {
    return 0;
  }
  unint64_t v7 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityTraits];
  return (*MEMORY[0x263F813C0] & ~v7) != 0;
}

- (id)accessibilityPath
{
  if ([(UIKitWebAccessibilityObjectWrapper *)self _prepareAccessibilityCall]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    unint64_t v3 = (void *)[(UIKitWebAccessibilityObjectWrapper *)self _accessibilityPath];
    if (v3)
    {
      unint64_t v3 = [MEMORY[0x263F1C478] bezierPathWithCGPath:v3];
    }
  }
  else
  {
    unint64_t v3 = 0;
  }

  return v3;
}

- (BOOL)accessibilityActivate
{
  int v3 = [(UIKitWebAccessibilityObjectWrapper *)self _prepareAccessibilityCall];
  if (v3)
  {
    if ([(UIKitWebAccessibilityObjectWrapper *)self _accessibilitySupportsActivateAction])
    {
      unint64_t v4 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityTraits];
      if ((*MEMORY[0x263F1CF10] & ~v4) != 0)
      {
        if ([(UIKitWebAccessibilityObjectWrapper *)self _axIsInteractiveVideo])
        {
          if ([(UIKitWebAccessibilityObjectWrapper *)self safeBoolForKey:@"accessibilityIsMediaPlaying"])unint64_t v7 = @"pause.video"; {
          else
          }
            unint64_t v7 = @"play.video";
          NSUInteger v8 = accessibilityLocalizedString(v7);
          UIAccessibilitySpeakAndDoNotBeInterrupted();
        }
        LOBYTE(v3) = [(UIKitWebAccessibilityObjectWrapper *)self safeBoolForKey:@"_accessibilityActivate"];
      }
      else
      {
        unint64_t v5 = [(UIKitWebAccessibilityObjectWrapper *)self _axWebKitTrueLinkParent];
        char v6 = [v5 safeBoolForKey:@"_accessibilityActivate"];

        LOBYTE(v3) = v6;
      }
    }
    else
    {
      v10.receiver = self;
      v10.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
      LOBYTE(v3) = [(UIKitWebAccessibilityObjectWrapper *)&v10 accessibilityActivate];
    }
  }
  return v3;
}

- (BOOL)accessibilityZoomInAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  unint64_t v5 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityWebDocumentView];
  char v6 = [v5 window];
  objc_msgSend(v6, "convertPoint:toView:", v5, x, y);
  double v8 = v7;
  double v10 = v9;

  LOBYTE(v6) = objc_msgSend(v5, "accessibilityZoomInAtPoint:", v8, v10);
  return (char)v6;
}

- (BOOL)accessibilityZoomOutAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  unint64_t v5 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityWebDocumentView];
  char v6 = [v5 window];
  objc_msgSend(v6, "convertPoint:toView:", v5, x, y);
  double v8 = v7;
  double v10 = v9;

  LOBYTE(v6) = objc_msgSend(v5, "accessibilityZoomOutAtPoint:", v8, v10);
  return (char)v6;
}

- (id)accessibilityLanguage
{
  if (([(UIKitWebAccessibilityObjectWrapper *)self _accessibilityBoolValueForKey:@"InSUWebView"] & 1) != 0|| ![(UIKitWebAccessibilityObjectWrapper *)self _prepareAccessibilityCall])
  {
    goto LABEL_10;
  }
  int v3 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityValueForKey:@"InSUWebView"];
  if (!v3)
  {
    char v6 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Suwebview.isa)];

    if (!v6) {
      goto LABEL_5;
    }
    [(UIKitWebAccessibilityObjectWrapper *)self _accessibilitySetBoolValue:1 forKey:@"InSUWebView"];
LABEL_10:
    unint64_t v5 = 0;
    goto LABEL_11;
  }

LABEL_5:
  v11.receiver = self;
  v11.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
  unint64_t v4 = [(UIKitWebAccessibilityObjectWrapper *)&v11 accessibilityLanguage];
  if ([v4 length])
  {
    if ([v4 isEqualToString:@" "]) {
      unint64_t v5 = 0;
    }
    else {
      unint64_t v5 = v4;
    }
  }
  else
  {
    double v8 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityWebPageParent];
    double v9 = [v8 accessibilityLanguage];
    unint64_t v5 = v9;
    if (v9) {
      double v10 = v9;
    }
    else {
      double v10 = @" ";
    }
    [(UIKitWebAccessibilityObjectWrapper *)self setAccessibilityLanguage:v10];
  }
LABEL_11:

  return v5;
}

- (BOOL)_isIBooks
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }

  return [(UIKitWebAccessibilityObjectWrapper *)self safeBoolForKey:@"_accessibilityIsInBookContent"];
}

- (id)_accessibilityTextMarkerForPosition:(int64_t)a3
{
  uint64_t v5 = [(UIKitWebAccessibilityObjectWrapper *)self elementTextRange];
  if ([(UIKitWebAccessibilityObjectWrapper *)self _isIBooks])
  {
    char v6 = [(UIKitWebAccessibilityObjectWrapper *)self safeValueForKey:@"_axStartRangeOfCurrentPage"];
    if (v6)
    {
      char v23 = 0;
      objc_opt_class();
      uint64_t v17 = 0;
      id v18 = &v17;
      uint64_t v19 = 0x3032000000;
      long long v20 = __Block_byref_object_copy_;
      long long v21 = __Block_byref_object_dispose_;
      id v22 = 0;
      id v16 = v6;
      AXPerformSafeBlock();
      id v7 = (id)v18[5];

      _Block_object_dispose(&v17, 8);
      double v8 = __UIAccessibilityCastAsClass();

      if (v23) {
        abort();
      }
      double v9 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Uiwebdocumentv.isa)];
      double v10 = [v9 beginningOfDocument];
      objc_super v11 = [v8 start];
      uint64_t v12 = [v9 offsetFromPosition:v10 toPosition:v11];
    }
    else
    {
      uint64_t v12 = 0;
    }
  }
  else if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v12 = v5;
  }
  id v13 = [(UIKitWebAccessibilityObjectWrapper *)self textMarkerForPosition:v12 + a3];
  id v14 = [v13 safeValueForKey:@"dataRepresentation"];

  return v14;
}

uint64_t __74__UIKitWebAccessibilityObjectWrapper__accessibilityTextMarkerForPosition___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [NSClassFromString(&cfstr_Uitextrangeimp.isa) wrapDOMRange:*(void *)(a1 + 32)];

  return MEMORY[0x270F9A758]();
}

- (CGRect)_accessibilityBoundsForRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if (objc_opt_respondsToSelector())
  {
    NSUInteger v6 = [(UIKitWebAccessibilityObjectWrapper *)self elementTextRange] + location;
    id v7 = [(UIKitWebAccessibilityObjectWrapper *)self textMarkerForPosition:v6];
    double v8 = [(UIKitWebAccessibilityObjectWrapper *)self textMarkerForPosition:v6 + length];
    double v9 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v7, v8, 0);
    [(UIKitWebAccessibilityObjectWrapper *)self frameForTextMarkers:v9];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
  }
  else
  {
    double v11 = *MEMORY[0x263F001A8];
    double v13 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v15 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v17 = *(double *)(MEMORY[0x263F001A8] + 24);
  }
  double v18 = v11;
  double v19 = v13;
  double v20 = v15;
  double v21 = v17;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.double y = v19;
  result.origin.double x = v18;
  return result;
}

- (BOOL)_accessibilityIsSpeakThisElement
{
  if ([(UIKitWebAccessibilityObjectWrapper *)self _isIBooks]) {
    return 1;
  }
  int v3 = [(UIKitWebAccessibilityObjectWrapper *)self safeValueForKey:@"_accessibilityScrollPosition"];
  [v3 pointValue];
  double v5 = v4;

  if (v5 < 5.0) {
    return 1;
  }
  id v7 = [(UIKitWebAccessibilityObjectWrapper *)self safeValueForKey:@"accessibilityElementRect"];
  [v7 rectValue];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  v17.origin.double x = v9;
  v17.origin.double y = v11;
  v17.size.width = v13;
  v17.size.height = v15;
  if (CGRectGetMaxY(v17) < v5) {
    return 0;
  }
  v16.receiver = self;
  v16.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
  return [(UIKitWebAccessibilityObjectWrapper *)&v16 _accessibilityIsSpeakThisElement];
}

- (id)_accessibilitySpeakThisString
{
  if ([(UIKitWebAccessibilityObjectWrapper *)self _isIBooks])
  {
    char v8 = 0;
    int v3 = [(UIKitWebAccessibilityObjectWrapper *)self safeValueForKey:@"_axStartRangeOfCurrentPage"];
    double v4 = __UIAccessibilitySafeClass();

    double v5 = [v4 text];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
    double v5 = [(UIKitWebAccessibilityObjectWrapper *)&v7 _accessibilitySpeakThisString];
  }

  return v5;
}

- (BOOL)_accessibilitySpeakThisCanBeHighlighted
{
  return 1;
}

- (CGRect)_accessibilityConvertSystemBoundedScreenRectToContextSpace:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (![(UIKitWebAccessibilityObjectWrapper *)self _axIsWebKit2])
  {
    v16.receiver = self;
    v16.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
    -[UIKitWebAccessibilityObjectWrapper _accessibilityConvertSystemBoundedScreenRectToContextSpace:](&v16, sel__accessibilityConvertSystemBoundedScreenRectToContextSpace_, x, y, width, height);
    double x = v8;
    double y = v9;
    double width = v10;
    double height = v11;
  }
  double v12 = x;
  double v13 = y;
  double v14 = width;
  double v15 = height;
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (id)automationElements
{
  unint64_t v3 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityTraits];
  if ((*MEMORY[0x263F81408] & ~v3) != 0)
  {
    v18.receiver = self;
    v18.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
    double v4 = [(UIKitWebAccessibilityObjectWrapper *)&v18 automationElements];
  }
  else
  {
    double v4 = [MEMORY[0x263EFF980] array];
    [(UIKitWebAccessibilityObjectWrapper *)self _axBuildAXTreeFromElement:self outArray:v4];
    if (![v4 count])
    {
      double v5 = [MEMORY[0x263EFF9C0] set];
      NSUInteger v6 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityAttributedValue];
      unint64_t v19 = 0;
      uint64_t v20 = 0;
      uint64_t v7 = [v6 length];
      if (v7)
      {
        unint64_t v8 = v7;
        unint64_t v9 = 0;
        double v10 = (void *)MEMORY[0x263F216E0];
        while (1)
        {
          double v11 = [v6 attributesAtIndex:v9 effectiveRange:&v19];
          double v12 = v11;
          if (v19 == 0x7FFFFFFFFFFFFFFFLL) {
            break;
          }
          double v13 = [v11 objectForKey:*v10];
          double v14 = v13;
          if (v13) {
            BOOL v15 = v13 == self;
          }
          else {
            BOOL v15 = 1;
          }
          if (!v15) {
            [v5 addObject:v13];
          }
          v19 += v20;

          unint64_t v9 = v19;
          if (v19 >= v8) {
            goto LABEL_15;
          }
        }
      }
LABEL_15:
      objc_super v16 = [v5 allObjects];
      [v4 addObjectsFromArray:v16];
    }
  }

  return v4;
}

- (void)_axBuildAXTreeFromElement:(id)a3 outArray:(id)a4
{
  double v14 = (UIKitWebAccessibilityObjectWrapper *)a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (v14 && v6)
  {
    uint64_t v8 = [(UIKitWebAccessibilityObjectWrapper *)v14 accessibilityElementCount];
    unint64_t v9 = v14;
    if (v8 <= 0)
    {
      BOOL v13 = [(UIKitWebAccessibilityObjectWrapper *)v14 isAccessibilityElement];
      if (v14 != self && v13) {
        [v7 addObject:v14];
      }
    }
    else
    {
      uint64_t v10 = v8;
      if (v14 != self)
      {
        [v7 addObject:v14];
        unint64_t v9 = v14;
      }
      for (uint64_t i = 0; i != v10; ++i)
      {
        double v12 = [(UIKitWebAccessibilityObjectWrapper *)v9 accessibilityElementAtIndex:i];
        [(UIKitWebAccessibilityObjectWrapper *)self _axBuildAXTreeFromElement:v12 outArray:v7];

        unint64_t v9 = v14;
      }
    }
  }
}

- (id)_accessibilityUserTestingElementBaseType
{
  unint64_t v3 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityTraits];
  if ((*MEMORY[0x263F1CED8] & v3) != 0)
  {
    double v4 = @"UISlider";
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
    double v4 = [(UIKitWebAccessibilityObjectWrapper *)&v6 _accessibilityUserTestingElementBaseType];
  }

  return v4;
}

- (id)_accessibilityDOMAttributes
{
  unint64_t v3 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:1];
  v6.receiver = self;
  v6.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
  double v4 = [(UIKitWebAccessibilityObjectWrapper *)&v6 accessibilityIdentifier];
  [v3 setObject:v4 forKey:@"id"];

  return v3;
}

- (id)_accessibilityScrollAncestor
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  if ([(UIKitWebAccessibilityObjectWrapper *)self _axIsWebKit2])
  {
    unint64_t v3 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityWebPageObject];
    id v4 = [v3 accessibilityContainer];
  }
  else
  {
    double v21 = self;
    char v23 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityWebDocumentView];
    NSClassFromString(&cfstr_Uiwebbrowservi.isa);
    if (objc_opt_isKindOfClass())
    {
      uint64_t v20 = [v23 safeValueForKey:@"_overflowScrollViews"];
      if ([v20 count])
      {
        [(UIKitWebAccessibilityObjectWrapper *)self accessibilityActivationPoint];
        uint64_t v6 = v5;
        uint64_t v8 = v7;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        id obj = v20;
        uint64_t v9 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
        if (v9)
        {
          uint64_t v10 = *(void *)v41;
LABEL_7:
          uint64_t v11 = 0;
          while (1)
          {
            if (*(void *)v41 != v10) {
              objc_enumerationMutation(obj);
            }
            double v12 = *(void **)(*((void *)&v40 + 1) + 8 * v11);
            BOOL v13 = [v12 safeValueForKey:@"_overflowContentView"];
            double v14 = [v23 window];
            uint64_t v34 = 0;
            uint64_t v35 = (double *)&v34;
            uint64_t v36 = 0x3010000000;
            id v37 = &unk_2404B43F7;
            uint64_t v38 = 0;
            uint64_t v39 = 0;
            uint64_t v26 = MEMORY[0x263EF8330];
            uint64_t v27 = 3221225472;
            NSUInteger v28 = __66__UIKitWebAccessibilityObjectWrapper__accessibilityScrollAncestor__block_invoke;
            NSUInteger v29 = &unk_2650B7CC8;
            id v31 = &v34;
            id v15 = v14;
            id v30 = v15;
            uint64_t v32 = v6;
            uint64_t v33 = v8;
            AXPerformSafeBlock();
            double v16 = v35[4];
            double v17 = v35[5];

            _Block_object_dispose(&v34, 8);
            objc_msgSend(v15, "convertPoint:toView:", v13, v16, v17);
            objc_super v18 = objc_msgSend(v13, "hitTest:withEvent:", 0);
            if (v18) {
              break;
            }

            if (v9 == ++v11)
            {
              uint64_t v9 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
              if (v9) {
                goto LABEL_7;
              }
              goto LABEL_13;
            }
          }
          id v4 = v12;

          if (v4) {
            goto LABEL_17;
          }
        }
        else
        {
LABEL_13:
        }
      }
      v25.receiver = v21;
      v25.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
      id v4 = [(UIKitWebAccessibilityObjectWrapper *)&v25 _accessibilityScrollAncestor];
LABEL_17:
    }
    else
    {

      v24.receiver = self;
      v24.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
      id v4 = [(UIKitWebAccessibilityObjectWrapper *)&v24 _accessibilityScrollAncestor];
    }
  }

  return v4;
}

uint64_t __66__UIKitWebAccessibilityObjectWrapper__accessibilityScrollAncestor__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "convertDeviceToWindow:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  *(void *)(v3 + 32) = v4;
  *(void *)(v3 + 40) = v5;
  return result;
}

- (BOOL)_accessibilityAlwaysSpeakTableHeaders
{
  uint64_t v2 = [(UIKitWebAccessibilityObjectWrapper *)self safeValueForKey:@"accessibilitySpeakTableHeaders"];
  char v3 = [v2 isEqualToString:@"always"];

  return v3;
}

- (BOOL)_accessibilityScrollToVisible
{
  char v3 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityScrollAncestor];
  NSClassFromString(&cfstr_Uiweboverflows.isa);
  if (objc_opt_isKindOfClass())
  {
    [(UIKitWebAccessibilityObjectWrapper *)self accessibilityFrameForScrolling];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v12 = AXLogScrollToVisible();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      [(UIKitWebAccessibilityObjectWrapper *)v3 _accessibilityScrollToVisible];
    }

    objc_msgSend(v3, "_accessibilityScrollToFrame:forView:", 0, v5, v7, v9, v11);
    BOOL v13 = AXLogScrollToVisible();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      [(UIKitWebAccessibilityObjectWrapper *)v3 _accessibilityScrollToVisible];
    }

    unsigned __int8 v14 = 1;
LABEL_7:
    AXPerformBlockOnMainThreadAfterDelay();
    goto LABEL_8;
  }
  [(UIKitWebAccessibilityObjectWrapper *)self accessibilityElementRect];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  if ([(UIKitWebAccessibilityObjectWrapper *)self _accessibilityIsScrollDivDescendent]|| (unsigned __int8 v14 = 1, v17 >= 0.0) && v19 >= 0.0)
  {
    unsigned __int8 v14 = 1;
    if (v21 != 0.0 && v23 != 0.0)
    {
      if ([(UIKitWebAccessibilityObjectWrapper *)self _axIsWebKit2])
      {
        v42.receiver = self;
        v42.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
        [(UIKitWebAccessibilityObjectWrapper *)&v42 _accessibilityScrollToVisible];
      }
      else
      {
        objc_super v24 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityFindAncestor:&__block_literal_global_1082 startWithSelf:0];
        if (v24)
        {
          char v41 = 0;
          objc_opt_class();
          objc_super v25 = [v24 safeValueForKey:@"_scroller"];
          uint64_t v26 = __UIAccessibilityCastAsClass();

          [v26 contentOffset];
          CGFloat v28 = v27;
          CGFloat v30 = v29;
          [v26 contentSize];
          CGFloat v32 = v31;
          CGFloat v34 = v33;
          [v26 frame];
          v44.origin.double x = v35;
          v44.origin.double y = v36;
          v44.size.double width = v37;
          v44.size.double height = v38;
          v43.origin.double x = v28;
          v43.origin.double y = v30;
          v43.size.double width = v32;
          v43.size.double height = v34;
          LODWORD(v25) = CGRectEqualToRect(v43, v44);

          if (v25)
          {
            v40.receiver = self;
            v40.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
            [(UIKitWebAccessibilityObjectWrapper *)&v40 _accessibilityScrollToVisible];
          }
        }
        v39.receiver = self;
        v39.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
        unsigned __int8 v14 = [(UIKitWebAccessibilityObjectWrapper *)&v39 _accessibilityBaseScrollToVisible];
      }
      goto LABEL_7;
    }
  }
LABEL_8:

  return v14;
}

uint64_t __67__UIKitWebAccessibilityObjectWrapper__accessibilityScrollToVisible__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _accessibilityIsWebDocumentView];
}

void __67__UIKitWebAccessibilityObjectWrapper__accessibilityScrollToVisible__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Uifieldeditor.isa)];

  if (!v2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    MEMORY[0x270F80A60](v3);
  }
}

- (CGPoint)_accessibilityScrollRectToVisible:(CGRect)a3
{
  [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityScrollToVisible];
  double v3 = *MEMORY[0x263F00148];
  double v4 = *(double *)(MEMORY[0x263F00148] + 8);
  result.double y = v4;
  result.double x = v3;
  return result;
}

- (BOOL)_accessibilityIsScrollDivDescendent
{
  if (![(UIKitWebAccessibilityObjectWrapper *)self _axIsWebKit2]) {
    return 0;
  }
  double v3 = [(UIKitWebAccessibilityObjectWrapper *)self safeValueForKey:@"_accessibilityScrollSize"];
  [v3 CGSizeValue];
  double v5 = v4;
  double v7 = v6;

  uint64_t v8 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityContainer];
  if (!v8) {
    return 0;
  }
  double v9 = (void *)v8;
  double v10 = *MEMORY[0x263F001B0];
  double v11 = *(double *)(MEMORY[0x263F001B0] + 8);
  do
  {
    double v12 = [v9 safeValueForKey:@"_accessibilityScrollSize"];
    [v12 CGSizeValue];
    double v14 = v13;
    double v16 = v15;

    if (v14 == v10 && v16 == v11) {
      break;
    }
    if (v14 != v5 || v16 != v7)
    {
      BOOL v20 = 1;
      goto LABEL_16;
    }
    uint64_t v19 = [v9 accessibilityContainer];

    double v9 = (void *)v19;
    double v7 = v16;
    double v5 = v14;
  }
  while (v19);
  BOOL v20 = 0;
LABEL_16:

  return v20;
}

- (_NSRange)_accessibilityCheckRowRangeForTrait:(unint64_t)a3
{
  if ((a3 & ~[(UIKitWebAccessibilityObjectWrapper *)self accessibilityTraits]) != 0)
  {
    NSUInteger v13 = 0;
    uint64_t v10 = 0x7FFFFFFFLL;
  }
  else
  {
    double v5 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityContainer];
    uint64_t v6 = [v5 accessibilityElementCount];
    if (v6 < 1)
    {
      NSUInteger v13 = 0;
      uint64_t v10 = 0x7FFFFFFFLL;
    }
    else
    {
      uint64_t v7 = v6;
      uint64_t v8 = 0;
      uint64_t v9 = 0;
      uint64_t v10 = 0x7FFFFFFFLL;
      do
      {
        double v11 = [v5 accessibilityElementAtIndex:v8];
        uint64_t v12 = [(UIKitWebAccessibilityObjectWrapper *)v11 accessibilityTraits];
        if ((v12 & a3) != 0) {
          NSUInteger v13 = v9 + 1;
        }
        else {
          NSUInteger v13 = v9;
        }
        if (v11 == self && (v12 & a3) != 0) {
          uint64_t v10 = v9;
        }

        ++v8;
        uint64_t v9 = v13;
      }
      while (v7 != v8);
    }
  }
  NSUInteger v14 = v10;
  NSUInteger v15 = v13;
  result.NSUInteger length = v15;
  result.NSUInteger location = v14;
  return result;
}

- (_NSRange)accessibilityRowRange
{
  id v3 = (id)[(UIKitWebAccessibilityObjectWrapper *)self _accessibilityCheckRowRangeForTrait:*MEMORY[0x263F813F8]];
  if (v3 == (id)0x7FFFFFFF)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
    id v3 = [(UIKitWebAccessibilityObjectWrapper *)&v5 accessibilityRowRange];
  }
  result.NSUInteger length = v4;
  result.NSUInteger location = (NSUInteger)v3;
  return result;
}

- (BOOL)accessibilityCanFuzzyHitTest
{
  v6.receiver = self;
  v6.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
  BOOL v3 = [(UIKitWebAccessibilityObjectWrapper *)&v6 accessibilityCanFuzzyHitTest];
  if (!v3)
  {
    unint64_t v4 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityTraits];
    if ((*MEMORY[0x263F81408] & v4) != 0) {
      return 1;
    }
  }
  return v3;
}

- (id)accessibilityHitTest:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v9.receiver = self;
  v9.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
  objc_super v6 = -[UIKitWebAccessibilityObjectWrapper accessibilityHitTest:](&v9, sel_accessibilityHitTest_);
  if (([v6 isAccessibilityElement] & 1) == 0)
  {
    -[UIKitWebAccessibilityObjectWrapper accessibilityPostProcessHitTest:](self, "accessibilityPostProcessHitTest:", x, y);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if ([v7 isAccessibilityElement]) {
      goto LABEL_5;
    }
  }
  id v7 = v6;
LABEL_5:

  return v7;
}

- (id)_accessibilityMathEquationRootObject
{
  BOOL v3 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityValueForKey:@"MathTopObject"];
  if (v3)
  {
    unint64_t v4 = [MEMORY[0x263EFF9D0] null];

    if (v3 == v4) {
      id v5 = 0;
    }
    else {
      id v5 = v3;
    }
  }
  else
  {
    objc_super v6 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityContainer];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      while (![v6 safeBoolForKey:@"accessibilityIsMathTopObject"])
      {
        id v7 = [v6 accessibilityContainer];

        objc_opt_class();
        objc_super v6 = v7;
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_10;
        }
      }
      [(UIKitWebAccessibilityObjectWrapper *)self _accessibilitySetRetainedValue:v6 forKey:@"MathTopObject"];
      id v7 = v6;
      id v5 = v7;
    }
    else
    {
      id v7 = v6;
LABEL_10:
      uint64_t v8 = [MEMORY[0x263EFF9D0] null];
      [(UIKitWebAccessibilityObjectWrapper *)self _accessibilitySetRetainedValue:v8 forKey:@"MathTopObject"];

      id v5 = 0;
    }
  }

  return v5;
}

- (id)accessibilityPostProcessHitTest:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  objc_super v6 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityWebPageParent];
  int v7 = [v6 _accessibilityBoolValueForKey:@"AXIgnoreFuzzyHitTesting"];

  if (v7)
  {
    uint64_t v8 = self;
  }
  else
  {
    objc_super v9 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityMathEquationRootObject];
    uint64_t v10 = v9;
    if (v9)
    {
      uint64_t v8 = v9;
    }
    else
    {
      GSMainScreenScaleFactor();
      float v12 = v11 * 100.0;
      NSUInteger v13 = self;
      if (fuzzyAccessibilityHitTest_hitQueue)
      {
        [(id)fuzzyAccessibilityHitTest_hitQueue removeAllObjects];
      }
      else
      {
        id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
        NSUInteger v15 = (void *)fuzzyAccessibilityHitTest_hitQueue;
        fuzzyAccessibilityHitTest_hitQueue = (uint64_t)v14;
      }
      v36[0] = 0;
      v36[1] = v36;
      v36[2] = 0x2020000000;
      float v37 = v12;
      uint64_t v30 = 0;
      double v31 = &v30;
      uint64_t v32 = 0x3032000000;
      double v33 = __Block_byref_object_copy_;
      CGFloat v34 = __Block_byref_object_dispose_;
      id v35 = 0;
      [(id)fuzzyAccessibilityHitTest_hitQueue addObject:v13];
      Class v16 = NSClassFromString(&cfstr_Webaccessibili.isa);
      while ([(id)fuzzyAccessibilityHitTest_hitQueue count])
      {
        double v17 = [(id)fuzzyAccessibilityHitTest_hitQueue objectAtIndex:0];
        [(id)fuzzyAccessibilityHitTest_hitQueue removeObjectAtIndex:0];
        v22[0] = MEMORY[0x263EF8330];
        v22[1] = 3221225472;
        v22[2] = __fuzzyAccessibilityHitTest_block_invoke;
        v22[3] = &unk_2650B7F18;
        id v18 = v17;
        CGFloat v27 = x;
        CGFloat v28 = y;
        id v23 = v18;
        objc_super v24 = v36;
        objc_super v25 = &v30;
        Class v26 = v16;
        float v29 = v12;
        [v18 accessibilityEnumerateContainerElementsUsingBlock:v22];
      }
      uint64_t v19 = (UIKitWebAccessibilityObjectWrapper *)(id)v31[5];
      _Block_object_dispose(&v30, 8);

      _Block_object_dispose(v36, 8);
      if (v19) {
        BOOL v20 = v19;
      }
      else {
        BOOL v20 = v13;
      }
      uint64_t v8 = v20;
    }
  }

  return v8;
}

- (id)_accessibilityParentForSubview:(id)a3
{
  id v4 = a3;
  if ([(UIKitWebAccessibilityObjectWrapper *)self _prepareAccessibilityCall])
  {
    v7.receiver = self;
    v7.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
    id v5 = [(UIKitWebAccessibilityObjectWrapper *)&v7 _accessibilityParentForSubview:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)accessibilityPlaceholderValue
{
  if ([(UIKitWebAccessibilityObjectWrapper *)self _prepareAccessibilityCall])
  {
    v6.receiver = self;
    v6.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
    BOOL v3 = [(UIKitWebAccessibilityObjectWrapper *)&v6 accessibilityPlaceholderValue];
    if ([v3 length])
    {
      id v4 = [MEMORY[0x263F21660] axAttributedStringWithString:v3];

      [v4 setAttribute:*MEMORY[0x263EFFB40] forKey:*MEMORY[0x263F21820]];
      BOOL v3 = v4;
    }
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (BOOL)_accessibilityOverridesPotentiallyAttributedAPISelector:(SEL)a3
{
  if (sel_accessibilityAttributedValue == a3)
  {
    if (AXDoesRequestingClientDeserveAutomation())
    {
      return 1;
    }
    else
    {
      unint64_t v5 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityTraits];
      return (*MEMORY[0x263F81408] & ~v5) == 0;
    }
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
    return -[UIKitWebAccessibilityObjectWrapper _accessibilityOverridesPotentiallyAttributedAPISelector:](&v6, sel__accessibilityOverridesPotentiallyAttributedAPISelector_);
  }
}

- (id)accessibilityAttributedValue
{
  if ([(UIKitWebAccessibilityObjectWrapper *)self _prepareAccessibilityCall])
  {
    unint64_t v3 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityTraits];
    if ((*MEMORY[0x263F81408] & ~v3) == 0 || (*MEMORY[0x263F1CF48] & v3) == *MEMORY[0x263F1CF48])
    {
      if (objc_opt_respondsToSelector())
      {
        uint64_t v5 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityAttributedValueForElement];
      }
      else
      {
        [(UIKitWebAccessibilityObjectWrapper *)self elementTextRange];
        v12[0] = 0;
        v12[1] = v7;
        uint64_t v5 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityAttributedValueForRange:v12];
      }
      objc_super v6 = (void *)v5;
    }
    else
    {
      objc_super v6 = 0;
    }
    if (![v6 length])
    {
      v11.receiver = self;
      v11.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
      uint64_t v8 = [(UIKitWebAccessibilityObjectWrapper *)&v11 accessibilityValue];
      if (v8)
      {
        uint64_t v9 = [objc_alloc(MEMORY[0x263F086A0]) initWithString:v8];

        objc_super v6 = (void *)v9;
      }
    }
  }
  else
  {
    objc_super v6 = 0;
  }

  return v6;
}

- (id)_accessibilityAttributedValueForElement
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_5;
  }
  id v3 = objc_alloc(MEMORY[0x263F089B8]);
  id v4 = [(UIKitWebAccessibilityObjectWrapper *)self attributedStringForElement];
  uint64_t v5 = (void *)[v3 initWithAttributedString:v4];

  if ([v5 length] == 1)
  {
    objc_super v6 = [v5 attributesAtIndex:0 effectiveRange:0];
    uint64_t v7 = [v6 objectForKey:*MEMORY[0x263F216E0]];

    if (v7 == self)
    {

LABEL_5:
      uint64_t v5 = 0;
    }
  }
  if (![v5 length])
  {
    id v8 = objc_alloc(MEMORY[0x263F089B8]);
    uint64_t v9 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityValue];
    uint64_t v10 = [v8 initWithString:v9];

    uint64_t v5 = (void *)v10;
  }
  objc_super v11 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityAttributedValue:v5];

  return v11;
}

- (id)_accessibilityAttributedValueForRange:(_NSRange *)a3
{
  if (a3)
  {
    uint64_t v5 = [(UIKitWebAccessibilityObjectWrapper *)self elementTextRange];
    if (v5 != 0x7FFFFFFFFFFFFFFFLL) {
      a3->location += v5;
    }
    if (objc_opt_respondsToSelector())
    {
      id v6 = objc_alloc(MEMORY[0x263F089B8]);
      uint64_t v7 = -[UIKitWebAccessibilityObjectWrapper attributedStringForRange:](self, "attributedStringForRange:", a3->location, a3->length);
      id v8 = (void *)[v6 initWithAttributedString:v7];
    }
    else
    {
      id v8 = 0;
    }
    if (![v8 length])
    {
      uint64_t v10 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityValue];
      v17.NSUInteger length = [v10 length];
      v17.NSUInteger location = 0;
      NSRange v11 = NSIntersectionRange(*a3, v17);
      if (v11.length)
      {
        id v12 = objc_alloc(MEMORY[0x263F089B8]);
        NSUInteger v13 = objc_msgSend(v10, "substringWithRange:", v11.location, v11.length);
        uint64_t v14 = [v12 initWithString:v13];

        id v8 = (void *)v14;
      }
    }
    uint64_t v9 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityAttributedValue:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)_accessibilityAttributedValue:(id)a3
{
  id v4 = a3;
  [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityConvertStyleAttributesToAccessibility:v4];
  if (!AXDoesRequestingClientDeserveAutomation()) {
    [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityAddMispellingsToAttributedString:v4];
  }

  return v4;
}

- (id)accessibilityURL
{
  if ([(UIKitWebAccessibilityObjectWrapper *)self _prepareAccessibilityCall])
  {
    unint64_t v3 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityTraits];
    uint64_t v4 = *MEMORY[0x263F1CF10];
    if (((*MEMORY[0x263F1CF10] | *MEMORY[0x263F1CF00]) & v3) != 0
      && ([(UIKitWebAccessibilityObjectWrapper *)self accessibilityContainer],
          (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v6 = (void *)v5;
      while (([v6 accessibilityTraits] & v4) == 0)
      {
        uint64_t v7 = [v6 accessibilityContainer];

        id v6 = (void *)v7;
        if (!v7) {
          goto LABEL_7;
        }
      }
      id v8 = [v6 accessibilityURL];
    }
    else
    {
LABEL_7:
      v10.receiver = self;
      v10.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
      id v8 = [(UIKitWebAccessibilityObjectWrapper *)&v10 accessibilityURL];
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)accessibilityMathRootIndexObject
{
  if ([(UIKitWebAccessibilityObjectWrapper *)self _prepareAccessibilityCall])
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
    unint64_t v3 = [(UIKitWebAccessibilityObjectWrapper *)&v5 accessibilityMathRootIndexObject];
  }
  else
  {
    unint64_t v3 = 0;
  }

  return v3;
}

- (id)accessibilityMathRadicand
{
  if ([(UIKitWebAccessibilityObjectWrapper *)self _prepareAccessibilityCall])
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
    unint64_t v3 = [(UIKitWebAccessibilityObjectWrapper *)&v5 accessibilityMathRadicand];
  }
  else
  {
    unint64_t v3 = 0;
  }

  return v3;
}

- (id)accessibilityMathNumeratorObject
{
  if ([(UIKitWebAccessibilityObjectWrapper *)self _prepareAccessibilityCall])
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
    unint64_t v3 = [(UIKitWebAccessibilityObjectWrapper *)&v5 accessibilityMathNumeratorObject];
  }
  else
  {
    unint64_t v3 = 0;
  }

  return v3;
}

- (id)accessibilityMathDenominatorObject
{
  if ([(UIKitWebAccessibilityObjectWrapper *)self _prepareAccessibilityCall])
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
    unint64_t v3 = [(UIKitWebAccessibilityObjectWrapper *)&v5 accessibilityMathDenominatorObject];
  }
  else
  {
    unint64_t v3 = 0;
  }

  return v3;
}

- (id)accessibilityMathBaseObject
{
  if ([(UIKitWebAccessibilityObjectWrapper *)self _prepareAccessibilityCall])
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
    unint64_t v3 = [(UIKitWebAccessibilityObjectWrapper *)&v5 accessibilityMathBaseObject];
  }
  else
  {
    unint64_t v3 = 0;
  }

  return v3;
}

- (id)accessibilityMathSubscriptObject
{
  if ([(UIKitWebAccessibilityObjectWrapper *)self _prepareAccessibilityCall])
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
    unint64_t v3 = [(UIKitWebAccessibilityObjectWrapper *)&v5 accessibilityMathSubscriptObject];
  }
  else
  {
    unint64_t v3 = 0;
  }

  return v3;
}

- (id)accessibilityMathSuperscriptObject
{
  if ([(UIKitWebAccessibilityObjectWrapper *)self _prepareAccessibilityCall])
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
    unint64_t v3 = [(UIKitWebAccessibilityObjectWrapper *)&v5 accessibilityMathSuperscriptObject];
  }
  else
  {
    unint64_t v3 = 0;
  }

  return v3;
}

- (id)accessibilityMathUnderObject
{
  if ([(UIKitWebAccessibilityObjectWrapper *)self _prepareAccessibilityCall])
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
    unint64_t v3 = [(UIKitWebAccessibilityObjectWrapper *)&v5 accessibilityMathUnderObject];
  }
  else
  {
    unint64_t v3 = 0;
  }

  return v3;
}

- (id)accessibilityMathOverObject
{
  if ([(UIKitWebAccessibilityObjectWrapper *)self _prepareAccessibilityCall])
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
    unint64_t v3 = [(UIKitWebAccessibilityObjectWrapper *)&v5 accessibilityMathOverObject];
  }
  else
  {
    unint64_t v3 = 0;
  }

  return v3;
}

- (id)accessibilityMathFencedOpenString
{
  if ([(UIKitWebAccessibilityObjectWrapper *)self _prepareAccessibilityCall])
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
    unint64_t v3 = [(UIKitWebAccessibilityObjectWrapper *)&v5 accessibilityMathFencedOpenString];
  }
  else
  {
    unint64_t v3 = 0;
  }

  return v3;
}

- (id)accessibilityMathFencedCloseString
{
  if ([(UIKitWebAccessibilityObjectWrapper *)self _prepareAccessibilityCall])
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
    unint64_t v3 = [(UIKitWebAccessibilityObjectWrapper *)&v5 accessibilityMathFencedCloseString];
  }
  else
  {
    unint64_t v3 = 0;
  }

  return v3;
}

- (id)accessibilityMathPostscripts
{
  if ([(UIKitWebAccessibilityObjectWrapper *)self _prepareAccessibilityCall])
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
    unint64_t v3 = [(UIKitWebAccessibilityObjectWrapper *)&v5 accessibilityMathPostscripts];
  }
  else
  {
    unint64_t v3 = 0;
  }

  return v3;
}

- (id)accessibilityMathPrescripts
{
  if ([(UIKitWebAccessibilityObjectWrapper *)self _prepareAccessibilityCall])
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
    unint64_t v3 = [(UIKitWebAccessibilityObjectWrapper *)&v5 accessibilityMathPrescripts];
  }
  else
  {
    unint64_t v3 = 0;
  }

  return v3;
}

- (BOOL)accessibilityIsMathTopObject
{
  BOOL v3 = [(UIKitWebAccessibilityObjectWrapper *)self _prepareAccessibilityCall];
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
    LOBYTE(v3) = [(UIKitWebAccessibilityObjectWrapper *)&v5 accessibilityIsMathTopObject];
  }
  return v3;
}

- (id)accessibilityMathType
{
  if ([(UIKitWebAccessibilityObjectWrapper *)self _prepareAccessibilityCall])
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
    BOOL v3 = [(UIKitWebAccessibilityObjectWrapper *)&v5 accessibilityMathType];
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (id)accessibilitySpeechHint
{
  if ([(UIKitWebAccessibilityObjectWrapper *)self _prepareAccessibilityCall])
  {
    v6.receiver = self;
    v6.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
    BOOL v3 = [(UIKitWebAccessibilityObjectWrapper *)&v6 accessibilitySpeechHint];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v4 = v3;
    }
    else {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)_axWebKitTrueLinkParent
{
  uint64_t v2 = self;
  if (v2)
  {
    BOOL v3 = 0;
    uint64_t v4 = *MEMORY[0x263F1CF10];
    while ((v4 & ~[(UIKitWebAccessibilityObjectWrapper *)v2 accessibilityTraits]) == 0)
    {
      objc_super v5 = v2;

      uint64_t v2 = [(UIKitWebAccessibilityObjectWrapper *)v5 accessibilityContainer];

      BOOL v3 = v5;
      if (!v2) {
        goto LABEL_8;
      }
    }
    objc_super v5 = v3;
  }
  else
  {
    objc_super v5 = 0;
  }
LABEL_8:

  return v5;
}

- (id)_accessibilityHeaderElementsForColumn:(unint64_t)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v4 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityElementForRow:0 andColumn:a3];
  objc_super v5 = v4;
  if (v4)
  {
    char v25 = 0;
    objc_super v6 = [v4 safeValueForKey:@"accessibilityHeaderElements"];
    uint64_t v7 = __UIAccessibilitySafeClass();

    id v8 = [MEMORY[0x263EFF980] array];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          unint64_t v15 = objc_msgSend(v14, "accessibilityColumnRange", (void)v21);
          if (a3 >= v15 && a3 - v15 < v16)
          {
            id v18 = [MEMORY[0x263F81198] defaultVoiceOverOptions];
            uint64_t v19 = [v14 _accessibilityLeafDescendantsWithOptions:v18];

            [v8 axSafelyAddObjectsFromArray:v19];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v11);
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)_accessibilityHeaderElementsForRow:(unint64_t)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v4 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityElementForRow:a3 andColumn:0];
  objc_super v5 = v4;
  if (v4)
  {
    char v25 = 0;
    objc_super v6 = [v4 safeValueForKey:@"accessibilityHeaderElements"];
    uint64_t v7 = __UIAccessibilitySafeClass();

    id v8 = [MEMORY[0x263EFF980] array];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          unint64_t v15 = objc_msgSend(v14, "accessibilityRowRange", (void)v21);
          if (a3 >= v15 && a3 - v15 < v16)
          {
            id v18 = [MEMORY[0x263F81198] defaultVoiceOverOptions];
            uint64_t v19 = [v14 _accessibilityLeafDescendantsWithOptions:v18];

            [v8 axSafelyAddObjectsFromArray:v19];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v11);
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)accessibilityHint
{
  v11.receiver = self;
  v11.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
  BOOL v3 = [(UIKitWebAccessibilityObjectWrapper *)&v11 accessibilityHint];
  if (![v3 length])
  {
    unint64_t v5 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityTraits];
    uint64_t v6 = *MEMORY[0x263F1CEF8] | *MEMORY[0x263F1CF10];
    if ((v6 & v5) != 0)
    {
      uint64_t v7 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityContainer];
      if (v7)
      {
        id v8 = (void *)v7;
        while (([v8 accessibilityTraits] & v6) != 0)
        {
          id v9 = [v8 accessibilityHint];

          if (![v9 length])
          {
            uint64_t v10 = [v8 accessibilityContainer];

            id v8 = (void *)v10;
            BOOL v3 = v9;
            if (v10) {
              continue;
            }
          }
          goto LABEL_13;
        }
        id v9 = v3;
LABEL_13:

        BOOL v3 = v9;
      }
    }
  }

  return v3;
}

- (id)accessibilityVisibleText
{
  unint64_t v3 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityTraits];
  if ((*MEMORY[0x263F21B68] & ~v3) != 0)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityValue];
  }

  return v4;
}

- (id)accessibilityValue
{
  v29.receiver = self;
  v29.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
  id v3 = [(UIKitWebAccessibilityObjectWrapper *)&v29 accessibilityValue];
  unint64_t v4 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityTraits];
  unint64_t v5 = v4;
  if (v3 && (*MEMORY[0x263F813D8] & ~v4) == 0)
  {
    int v6 = [(UIKitWebAccessibilityObjectWrapper *)self safeBoolForKey:@"_accessibilityIsStrongPasswordField"];
    uint64_t v7 = [MEMORY[0x263F21660] axAttributedStringWithString:v3];
    id v8 = v7;
    id v9 = (void *)MEMORY[0x263F21868];
    if (v6) {
      id v9 = (void *)MEMORY[0x263F217C8];
    }
    [v7 setAttribute:*MEMORY[0x263EFFB40] forKey:*v9];

    id v3 = v8;
  }
  if ((*MEMORY[0x263F1CF60] & ~v5) == 0
    && (([v3 isEqualToString:@"1"] & 1) != 0
     || ([v3 isEqualToString:@"0"] & 1) != 0
     || [v3 isEqualToString:@"2"]))
  {
    id v10 = v3;
    id v3 = v10;
LABEL_17:
    objc_super v11 = v10;
    goto LABEL_34;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [(UIKitWebAccessibilityObjectWrapper *)self safeBoolForKey:@"accessibilityIsIndeterminate"])
  {
    accessibilityLocalizedString(@"indeterminate.status");
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  if (-[UIKitWebAccessibilityObjectWrapper safeBoolForKey:](self, "safeBoolForKey:", @"accessibilityIsAttachmentElement")&& [v3 length])
  {
    [v3 floatValue];
    AXFormatFloatWithPercentage();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  unint64_t v12 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityTraits];
  if ((*MEMORY[0x263F1CED8] & v12) != 0 && [v3 length])
  {
    NSUInteger v13 = [MEMORY[0x263F08B08] scannerWithString:v3];
    if ([v13 scanFloat:0])
    {
      int v14 = [v13 isAtEnd];

      if (!v14) {
        goto LABEL_26;
      }
      [v3 floatValue];
      if (v15 == 0.0) {
        goto LABEL_26;
      }
      [v3 floatValue];
      float v17 = roundf(v16);
      [v3 floatValue];
      if (v17 != v18) {
        goto LABEL_26;
      }
      uint64_t v19 = NSString;
      [v3 floatValue];
      objc_msgSend(v19, "stringWithFormat:", @"%.0f", v20);
      NSUInteger v13 = v3;
      id v3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
LABEL_26:
  if ([(UIKitWebAccessibilityObjectWrapper *)self _axIsInteractiveVideo]
    && [v3 length])
  {
    long long v21 = NSString;
    long long v22 = accessibilityLocalizedString(@"video.current.time");
    uint64_t v23 = objc_msgSend(v21, "stringWithFormat:", v22, v3);

    id v3 = (id)v23;
  }
  if (![v3 length])
  {
    uint64_t v24 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityPlaceholderValue];

    id v3 = (id)v24;
  }
  char v25 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityColorDescription];
  if (v25)
  {
    CGFloat v28 = AXColorStringForColor();
    uint64_t v26 = __UIAXStringForVariables();

    id v3 = (id)v26;
  }
  id v3 = v3;

  objc_super v11 = v3;
LABEL_34:

  return v11;
}

- (NSString)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityLabel];
  int v6 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityValue];
  [(UIKitWebAccessibilityObjectWrapper *)self accessibilityFrame];
  uint64_t v7 = NSStringFromCGRect(v11);
  id v8 = [v3 stringWithFormat:@"%@[%p] L:[%@] V:[%@] F:[%@]", v4, self, v5, v6, v7];

  return (NSString *)v8;
}

- (id)ariaLandmarkRoleDescription
{
  unint64_t v3 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityTraits];
  if ((*MEMORY[0x263F21A58] & v3) != 0
    || (-[UIKitWebAccessibilityObjectWrapper safeValueForKey:](self, "safeValueForKey:", @"accessibilityRoleDescription"), v4 = objc_claimAutoreleasedReturnValue(), uint64_t v5 = [v4 length], v4, v5))
  {
    int v6 = 0;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
    int v6 = [(UIKitWebAccessibilityObjectWrapper *)&v8 ariaLandmarkRoleDescription];
  }

  return v6;
}

- (id)_accessibilityParentLinkContainer
{
  unint64_t v3 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityValueForKey:@"AXParentContainerLink"];
  if (v3)
  {
    uint64_t v4 = v3;
  }
  else
  {
    uint64_t v5 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityContainer];
    int v6 = self;
    uint64_t v7 = v6;
    if (v5)
    {
      uint64_t v8 = *MEMORY[0x263F1CF10];
      id v9 = v6;
      while (1)
      {
        if ((v8 & [v5 accessibilityTraits]) == 0)
        {
          id v10 = v9;
LABEL_10:
          if (v10 == v7) {
            goto LABEL_14;
          }
          if (v10) {
            [(UIKitWebAccessibilityObjectWrapper *)v7 _accessibilitySetRetainedValue:v10 forKey:@"AXParentContainerLink"];
          }
          goto LABEL_16;
        }
        if ([v5 _accessibilityHasOtherAccessibleChildElements:v9]) {
          break;
        }
        id v10 = v5;

        uint64_t v5 = [(UIKitWebAccessibilityObjectWrapper *)v10 accessibilityContainer];

        id v9 = v10;
        if (!v5) {
          goto LABEL_10;
        }
      }

      if (v7) {
        goto LABEL_15;
      }
    }
LABEL_14:

LABEL_15:
    id v10 = 0;
LABEL_16:
    uint64_t v4 = v10;
  }

  return v4;
}

- (BOOL)_accessibilityHasOtherAccessibleChildElements:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityElementCount];
  if (v5 < 1)
  {
    BOOL v8 = 0;
  }
  else
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    BOOL v8 = 1;
    while (1)
    {
      id v9 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityElementAtIndex:v7];
      if (([v4 isEqual:v9] & 1) == 0)
      {
        if ([v9 isAccessibilityElement]) {
          break;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ([v9 _accessibilityHasOtherAccessibleChildElements:0]) {
            break;
          }
        }
      }

      BOOL v8 = ++v7 < v6;
      if (v6 == v7) {
        goto LABEL_11;
      }
    }
  }
LABEL_11:

  return v8;
}

- (id)accessibilityLabel
{
  unint64_t v3 = objc_msgSend(NSString, "stringWithFormat:", @"%p-_axObjWrapperLabel", self);
  uint64_t v27 = 0;
  PossiblyNilObjectForKeCGFloat y = _AXServerCacheGetPossiblyNilObjectForKey();
  id v5 = 0;
  uint64_t v6 = v5;
  if (PossiblyNilObjectForKey)
  {
    uint64_t v7 = (__CFString *)v5;
  }
  else
  {
    v26.receiver = self;
    v26.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
    BOOL v8 = [(UIKitWebAccessibilityObjectWrapper *)&v26 accessibilityLabel];

    unint64_t v9 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityTraits];
    if ((*MEMORY[0x263F1CF10] & v9) != 0 && (*MEMORY[0x263F21A58] & v9) == 0 && (processingLabelLogic & 1) == 0)
    {
      processingLabelLogic = 1;
      id v10 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityParentLinkContainer];
      CGRect v11 = v10;
      if (v10)
      {
        unint64_t v12 = [v10 accessibilityLabel];
        if ([v12 length])
        {
          NSUInteger v13 = v12;

          BOOL v8 = v13;
        }
      }
      if ([(__CFString *)v8 length]
        || (uint64_t v15 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityElementCount],
            v15 < 1))
      {
        uint64_t v14 = (uint64_t)v8;
      }
      else
      {
        uint64_t v16 = v15;
        for (uint64_t i = 0; i != v16; ++i)
        {
          float v18 = -[UIKitWebAccessibilityObjectWrapper accessibilityElementAtIndex:](self, "accessibilityElementAtIndex:", i, v24, v25);
          uint64_t v24 = [v18 accessibilityLabel];
          char v25 = @"__AXStringForVariablesSentinel";
          uint64_t v14 = __UIAXStringForVariables();

          BOOL v8 = (__CFString *)v14;
        }
      }
      processingLabelLogic = 0;

      BOOL v8 = (__CFString *)v14;
    }
    uint64_t v19 = objc_msgSend(MEMORY[0x263F08708], "whitespaceCharacterSet", v24, v25);
    float v20 = [(__CFString *)v8 stringByTrimmingCharactersInSet:v19];

    if ([v20 length] == 1 && (objc_msgSend(v20, "characterAtIndex:", 0) & 0xFFFE) == 0x200E)
    {

      BOOL v8 = 0;
    }
    long long v21 = [(UIKitWebAccessibilityObjectWrapper *)self safeStringForKey:@"accessibilityBrailleLabel"];
    if ([v21 length])
    {
      if (v8) {
        long long v22 = v8;
      }
      else {
        long long v22 = @" ";
      }
      BOOL v8 = [MEMORY[0x263F21660] axAttributedStringWithString:v22];
      [(__CFString *)v8 setAttribute:v21 forKey:*MEMORY[0x263F21700]];
    }
    _AXServerCacheInsertPossiblyNilObjectForKey();
    uint64_t v7 = v8;
  }

  return v7;
}

- (id)_accessibilityProcessRootEquation
{
  uint64_t v3 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityElementCount];
  if (v3 == 1)
  {
    id v4 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityElementAtIndex:0];
    id v5 = _processEquationChild(v4);
LABEL_8:

    goto LABEL_10;
  }
  if (v3 >= 2)
  {
    id v5 = [MEMORY[0x263EFF9A0] dictionary];
    [v5 setObject:@"Row" forKey:@"AXMType"];
    id v4 = [MEMORY[0x263EFF980] array];
    uint64_t v6 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityElementCount];
    if (v6 >= 1)
    {
      uint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        unint64_t v9 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityElementAtIndex:i];
        id v10 = _processEquationChild(v9);
        [v4 addObject:v10];
      }
    }
    [v5 setObject:v4 forKey:@"AXMChildren"];
    goto LABEL_8;
  }
  id v5 = 0;
LABEL_10:

  return v5;
}

- (id)accessibilityMathEquation
{
  if ([(UIKitWebAccessibilityObjectWrapper *)self safeBoolForKey:@"accessibilityIsMathTopObject"])
  {
    uint64_t v3 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityProcessRootEquation];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (BOOL)_axIsInteractiveVideo
{
  return [(UIKitWebAccessibilityObjectWrapper *)self safeBoolForKey:@"accessibilityIsWebInteractiveVideo"];
}

- (void)_axVideoEnterFullscreen
{
  if ([(UIKitWebAccessibilityObjectWrapper *)self _axIsInteractiveVideo])
  {
    UIAccessibilitySpeakAndDoNotBeInterrupted();
    AXPerformSafeBlock();
  }
}

uint64_t __61__UIKitWebAccessibilityObjectWrapper__axVideoEnterFullscreen__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessibilityVideoEnterFullscreen];
}

- (void)_axVideoToggleMute
{
  if ([(UIKitWebAccessibilityObjectWrapper *)self _axIsInteractiveVideo])
  {
    if ([(UIKitWebAccessibilityObjectWrapper *)self safeBoolForKey:@"accessibilityIsMediaMuted"])uint64_t v3 = @"unmute.video"; {
    else
    }
      uint64_t v3 = @"mute.video";
    id v4 = accessibilityLocalizedString(v3);
    UIAccessibilitySpeakAndDoNotBeInterrupted();

    AXPerformSafeBlock();
  }
}

uint64_t __56__UIKitWebAccessibilityObjectWrapper__axVideoToggleMute__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessibilityToggleMuteForMedia];
}

- (void)accessibilityIncrement
{
  v4.receiver = self;
  v4.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
  [(UIKitWebAccessibilityObjectWrapper *)&v4 accessibilityIncrement];
  if ([(UIKitWebAccessibilityObjectWrapper *)self _axIsInteractiveVideo])
  {
    uint64_t v3 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityValue];
    UIAccessibilitySpeakAndDoNotBeInterrupted();
  }
}

- (void)accessibilityDecrement
{
  v4.receiver = self;
  v4.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
  [(UIKitWebAccessibilityObjectWrapper *)&v4 accessibilityDecrement];
  if ([(UIKitWebAccessibilityObjectWrapper *)self _axIsInteractiveVideo])
  {
    uint64_t v3 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityValue];
    UIAccessibilitySpeakAndDoNotBeInterrupted();
  }
}

- (int)_accessibilityHostPid
{
  if ([(UIKitWebAccessibilityObjectWrapper *)self _axIsWebKit2])
  {
    uint64_t v3 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityWebPageObject];
    int v4 = [v3 _accessibilityHostPid];

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
    return [(UIKitWebAccessibilityObjectWrapper *)&v6 _accessibilityHostPid];
  }
}

- (id)accessibilityCustomActions
{
  if ([(UIKitWebAccessibilityObjectWrapper *)self _axIsInteractiveVideo])
  {
    uint64_t v3 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityValueForKey:@"AXWebVideoActions"];
    if (!v3)
    {
      uint64_t v3 = [MEMORY[0x263EFF980] array];
      [(UIKitWebAccessibilityObjectWrapper *)self _accessibilitySetRetainedValue:v3 forKey:@"AXWebVideoActions"];
      id v4 = objc_alloc(MEMORY[0x263F1C390]);
      id v5 = accessibilityLocalizedString(@"video.action.fast.forward");
      objc_super v6 = (void *)[v4 initWithName:v5 target:self selector:sel_accessibilityIncrement];

      [v3 addObject:v6];
      id v7 = objc_alloc(MEMORY[0x263F1C390]);
      BOOL v8 = accessibilityLocalizedString(@"video.action.rewind");
      unint64_t v9 = (void *)[v7 initWithName:v8 target:self selector:sel_accessibilityDecrement];

      [v3 addObject:v9];
      id v10 = objc_alloc(MEMORY[0x263F1C390]);
      CGRect v11 = accessibilityLocalizedString(@"video.action.toggle.mute");
      unint64_t v12 = (void *)[v10 initWithName:v11 target:self selector:sel__axVideoToggleMute];

      [v3 addObject:v12];
      id v13 = objc_alloc(MEMORY[0x263F1C390]);
      uint64_t v14 = accessibilityLocalizedString(@"video.action.enter.fullscreen");
      uint64_t v15 = (void *)[v13 initWithName:v14 target:self selector:sel__axVideoEnterFullscreen];

      [v3 addObject:v15];
    }
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
    uint64_t v3 = [(UIKitWebAccessibilityObjectWrapper *)&v17 accessibilityCustomActions];
  }

  return v3;
}

- (id)_axWebKitSearchKeyForCustomRotorType:(int64_t)a3
{
  if (_axWebKitSearchKeyForCustomRotorType__onceToken != -1) {
    dispatch_once(&_axWebKitSearchKeyForCustomRotorType__onceToken, &__block_literal_global_1248);
  }
  id v4 = (void *)_axWebKitSearchKeyForCustomRotorType__ConvertType;
  id v5 = [NSNumber numberWithInteger:a3];
  objc_super v6 = [v4 objectForKeyedSubscript:v5];

  return v6;
}

void __75__UIKitWebAccessibilityObjectWrapper__axWebKitSearchKeyForCustomRotorType___block_invoke()
{
  v17[28] = *MEMORY[0x263EF8340];
  v16[0] = &unk_26F493A90;
  v16[1] = &unk_26F493AA8;
  v17[0] = @"AXBoldFontSearchKey";
  v17[1] = @"AXItalicFontSearchKey";
  v16[2] = &unk_26F493AC0;
  v17[2] = @"AXUnderlineSearchKey";
  v0 = (void *)MEMORY[0x263F81260];
  uint64_t v15 = [NSNumber numberWithInteger:*MEMORY[0x263F81260]];
  v16[3] = v15;
  v17[3] = @"AXPlainTextSearchKey";
  uint64_t v14 = [NSNumber numberWithInteger:*MEMORY[0x263F81238]];
  v16[4] = v14;
  v17[4] = @"AXFontColorChangeSearchKey";
  id v13 = [NSNumber numberWithInteger:*MEMORY[0x263F81248]];
  v16[5] = v13;
  v17[5] = @"AXFontChangeSearchKey";
  v1 = [NSNumber numberWithInteger:*MEMORY[0x263F81278]];
  v16[6] = v1;
  v17[6] = @"AXStyleChangeSearchKey";
  uint64_t v2 = [NSNumber numberWithInteger:*MEMORY[0x263F81268]];
  v16[7] = v2;
  v17[7] = @"AXBlockquoteSameLevelSearchKey";
  uint64_t v3 = [NSNumber numberWithInteger:*MEMORY[0x263F81228]];
  v16[8] = v3;
  v17[8] = @"AXBlockquoteSearchKey";
  id v4 = [NSNumber numberWithInteger:*MEMORY[0x263F81230]];
  v16[9] = v4;
  v17[9] = @"AXButtonSearchKey";
  id v5 = [NSNumber numberWithInteger:*MEMORY[0x263F81240]];
  v16[10] = v5;
  v17[10] = @"AXControlSearchKey";
  objc_super v6 = [NSNumber numberWithInteger:*MEMORY[0x263F81250]];
  v16[11] = v6;
  v16[12] = &unk_26F493AD8;
  v17[11] = @"AXFrameSearchKey";
  v17[12] = @"AXGraphicSearchKey";
  v16[13] = &unk_26F493AF0;
  v16[14] = &unk_26F493B08;
  v17[13] = @"AXHeadingLevel1SearchKey";
  v17[14] = @"AXHeadingLevel2SearchKey";
  v16[15] = &unk_26F493B20;
  v16[16] = &unk_26F493B38;
  v17[15] = @"AXHeadingLevel3SearchKey";
  v17[16] = @"AXHeadingLevel4SearchKey";
  v16[17] = &unk_26F493B50;
  v16[18] = &unk_26F493B68;
  v17[17] = @"AXHeadingLevel5SearchKey";
  v17[18] = @"AXHeadingLevel6SearchKey";
  id v7 = [NSNumber numberWithInteger:*MEMORY[0x263F81270]];
  v16[19] = v7;
  v16[20] = &unk_26F493B80;
  v17[19] = @"AXHeadingSameLevelSearchKey";
  v17[20] = @"AXHeadingSearchKey";
  v16[21] = &unk_26F493B98;
  v16[22] = &unk_26F493BB0;
  v17[21] = @"AXLinkSearchKey";
  v17[22] = @"AXListSearchKey";
  v16[23] = &unk_26F493BC8;
  v17[23] = @"AXMisspelledWordSearchKey";
  BOOL v8 = [NSNumber numberWithInteger:*v0];
  v16[24] = v8;
  v17[24] = @"AXStaticTextSearchKey";
  unint64_t v9 = [NSNumber numberWithInteger:*MEMORY[0x263F81258]];
  v16[25] = v9;
  v16[26] = &unk_26F493BE0;
  v17[25] = @"AXUnvisitedLinkSearchKey";
  v17[26] = @"AXVisitedLinkSearchKey";
  id v10 = [NSNumber numberWithInteger:*MEMORY[0x263F81220]];
  v16[27] = v10;
  v17[27] = @"AXArticleSearchKey";
  uint64_t v11 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:28];
  unint64_t v12 = (void *)_axWebKitSearchKeyForCustomRotorType__ConvertType;
  _axWebKitSearchKeyForCustomRotorType__ConvertType = v11;
}

- (id)_misspelledWordRotor
{
  id v3 = objc_alloc(MEMORY[0x263F1C398]);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __58__UIKitWebAccessibilityObjectWrapper__misspelledWordRotor__block_invoke;
  v6[3] = &unk_2650B7D40;
  v6[4] = self;
  id v4 = (void *)[v3 initWithSystemType:13 itemSearchBlock:v6];
  [v4 setVisibleInTouchRotor:1];

  return v4;
}

id __58__UIKitWebAccessibilityObjectWrapper__misspelledWordRotor__block_invoke(uint64_t a1, void *a2)
{
  v31[2] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 currentItem];
  id v5 = [v4 targetElement];

  objc_super v6 = *(void **)(a1 + 32);
  id v7 = [v3 currentItem];
  BOOL v8 = [v7 targetTextMarkerRange];
  unint64_t v9 = [v6 _accessibilityConvertDataArrayToTextMarkerArray:v8];

  _AXPrintMarkerRangeInfo(v9, v5);
  uint64_t v10 = [v3 searchDirection];
  uint64_t v11 = [MEMORY[0x263EFF8C0] array];
  if ([v9 count])
  {
    if (v10 == 1)
    {
      unint64_t v12 = [v9 lastObject];
      v31[0] = v12;
      id v13 = [v9 lastObject];
      v31[1] = v13;
      uint64_t v14 = v31;
    }
    else
    {
      unint64_t v12 = [v9 firstObject];
      v30[0] = v12;
      id v13 = [v9 firstObject];
      v30[1] = v13;
      uint64_t v14 = v30;
    }
    uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];

    uint64_t v11 = (void *)v15;
  }
  _AXPrintMarkerRangeInfo(v11, v5);
  uint64_t v24 = 0;
  char v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy_;
  CGFloat v28 = __Block_byref_object_dispose_;
  id v29 = 0;
  id v16 = v5;
  id v17 = v11;
  AXPerformSafeBlock();
  id v18 = (id)v25[5];

  _Block_object_dispose(&v24, 8);
  BOOL v19 = [v18 count] == 2;
  float v20 = VOTLogRotor();
  long long v21 = v20;
  if (v19)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      __58__UIKitWebAccessibilityObjectWrapper__misspelledWordRotor__block_invoke_cold_1(v18, v16);
    }

    long long v21 = [*(id *)(a1 + 32) _accessibilityConvertTextMarkersToDataArray:v18];
    long long v22 = (void *)[objc_alloc(MEMORY[0x263F1C3A0]) initWithTargetElement:v16 targetRange:0 targetTextMarkerRange:v21];
  }
  else
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      __58__UIKitWebAccessibilityObjectWrapper__misspelledWordRotor__block_invoke_cold_2(v18, v21);
    }
    long long v22 = 0;
  }

  return v22;
}

uint64_t __58__UIKitWebAccessibilityObjectWrapper__misspelledWordRotor__block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) misspellingTextMarkerRange:*(void *)(a1 + 40) forward:*(unsigned __int8 *)(a1 + 56)];

  return MEMORY[0x270F9A758]();
}

- (BOOL)_accessibilityReplaceTextInRange:(_NSRange)a3 withString:(id)a4
{
  uint64_t v7 = 0;
  BOOL v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  id v6 = a4;
  AXPerformSafeBlock();
  char v4 = *((unsigned char *)v8 + 24);

  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __82__UIKitWebAccessibilityObjectWrapper__accessibilityReplaceTextInRange_withString___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "accessibilityReplaceRange:withText:", *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 40));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (id)_accessibilityElementsForSearchParameter:(id)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy_;
  char v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  id v5 = a3;
  AXPerformSafeBlock();
  id v3 = (id)v7[5];

  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __79__UIKitWebAccessibilityObjectWrapper__accessibilityElementsForSearchParameter___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) accessibilityFindMatchingObjects:*(void *)(a1 + 40)];

  return MEMORY[0x270F9A758]();
}

- (id)_accessibilityCustomRotor:(int64_t)a3
{
  if (a3 == 13)
  {
    char v4 = [(UIKitWebAccessibilityObjectWrapper *)self _misspelledWordRotor];
  }
  else
  {
    id v6 = objc_alloc(MEMORY[0x263F1C398]);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __64__UIKitWebAccessibilityObjectWrapper__accessibilityCustomRotor___block_invoke;
    v8[3] = &unk_2650B7D90;
    v8[4] = self;
    v8[5] = a3;
    char v4 = (void *)[v6 initWithSystemType:a3 itemSearchBlock:v8];
    [v4 setVisibleInTouchRotor:0];
  }

  return v4;
}

id __64__UIKitWebAccessibilityObjectWrapper__accessibilityCustomRotor___block_invoke(uint64_t a1, void *a2)
{
  v40[6] = *MEMORY[0x263EF8340];
  id v3 = a2;
  char v4 = [*(id *)(a1 + 32) _axWebKitSearchKeyForCustomRotorType:*(void *)(a1 + 40)];
  if (v4)
  {
    v39[0] = @"AXDirection";
    uint64_t v5 = [v3 searchDirection];
    id v6 = @"AXDirectionPrevious";
    uint64_t v7 = MEMORY[0x263EFFA80];
    if (v5 == 1) {
      id v6 = @"AXDirectionNext";
    }
    v40[0] = v6;
    v40[1] = MEMORY[0x263EFFA80];
    v39[1] = @"AXImmediateDescendantsOnly";
    void v39[2] = @"AXResultsLimit";
    v40[2] = &unk_26F493BF8;
    v39[3] = @"AXStartElement";
    uint64_t v8 = [v3 currentItem];
    uint64_t v9 = [v8 targetElement];
    void v40[3] = v9;
    v39[4] = @"AXVisibleOnly";
    v39[5] = @"AXSearchKey";
    v40[4] = v7;
    v40[5] = v4;
    char v10 = [NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:6];

    uint64_t v32 = 0;
    double v33 = &v32;
    uint64_t v34 = 0x3032000000;
    id v35 = __Block_byref_object_copy_;
    CGFloat v36 = __Block_byref_object_dispose_;
    id v37 = 0;
    uint64_t v25 = MEMORY[0x263EF8330];
    uint64_t v26 = 3221225472;
    uint64_t v27 = __64__UIKitWebAccessibilityObjectWrapper__accessibilityCustomRotor___block_invoke_1398;
    CGFloat v28 = &unk_2650B7C78;
    uint64_t v11 = *(void *)(a1 + 32);
    double v31 = &v32;
    uint64_t v29 = v11;
    id v12 = v10;
    id v30 = v12;
    AXPerformSafeBlock();
    id v13 = (id)v33[5];

    _Block_object_dispose(&v32, 8);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v14 = v13;
    uint64_t v15 = (void *)[v14 countByEnumeratingWithState:&v21 objects:v38 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v15; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v22 != v16) {
            objc_enumerationMutation(v14);
          }
          id v18 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if ([v18 isAccessibilityElement])
          {
            id v19 = v18;

            if (!v19)
            {
              uint64_t v15 = 0;
              goto LABEL_21;
            }
            goto LABEL_19;
          }
          if ([v4 isEqualToString:@"AXArticleSearchKey"])
          {
            id v19 = [v18 _accessibilityUnignoredDescendant];
            if (v19)
            {

LABEL_19:
              uint64_t v15 = (void *)[objc_alloc(MEMORY[0x263F1C3A0]) initWithTargetElement:v19 targetRange:0];
              goto LABEL_20;
            }
          }
        }
        uint64_t v15 = (void *)[v14 countByEnumeratingWithState:&v21 objects:v38 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }
    id v19 = v14;
LABEL_20:

LABEL_21:
  }
  else
  {
    _AXAssert();
    uint64_t v15 = 0;
  }

  return v15;
}

uint64_t __64__UIKitWebAccessibilityObjectWrapper__accessibilityCustomRotor___block_invoke_1398(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) accessibilityFindMatchingObjects:*(void *)(a1 + 40)];

  return MEMORY[0x270F9A758]();
}

- (BOOL)_accessibilityIsTopMostWebElement
{
  id v3 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityValueForKey:@"_accessibilityIsTopMostWebElement"];
  if (!v3)
  {
    char v4 = NSNumber;
    uint64_t v5 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityContainer];
    id v6 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityWebPageParent];
    id v3 = [v4 numberWithInt:v5 == v6];

    [(UIKitWebAccessibilityObjectWrapper *)self _accessibilitySetRetainedValue:v3 forKey:@"_accessibilityIsTopMostWebElement"];
  }
  char v7 = [v3 BOOLValue];

  return v7;
}

- (id)accessibilityCustomRotors
{
  v37[27] = *MEMORY[0x263EF8340];
  if ([(UIKitWebAccessibilityObjectWrapper *)self _prepareAccessibilityCall])
  {
    if ([(UIKitWebAccessibilityObjectWrapper *)self _accessibilityIsTopMostWebElement])
    {
      id v3 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityValueForKey:@"AXRotors"];
      if (v3)
      {
        id v4 = v3;
      }
      else
      {
        v37[0] = &unk_26F493A90;
        v37[1] = &unk_26F493AA8;
        v37[2] = &unk_26F493AC0;
        char v7 = (void *)MEMORY[0x263F81260];
        uint64_t v29 = [NSNumber numberWithInteger:*MEMORY[0x263F81260]];
        v37[3] = v29;
        CGFloat v28 = [NSNumber numberWithInteger:*MEMORY[0x263F81238]];
        v37[4] = v28;
        uint64_t v27 = [NSNumber numberWithInteger:*MEMORY[0x263F81248]];
        v37[5] = v27;
        uint64_t v26 = [NSNumber numberWithInteger:*MEMORY[0x263F81278]];
        v37[6] = v26;
        uint64_t v25 = [NSNumber numberWithInteger:*MEMORY[0x263F81268]];
        v37[7] = v25;
        uint64_t v8 = [NSNumber numberWithInteger:*MEMORY[0x263F81228]];
        v37[8] = v8;
        uint64_t v9 = [NSNumber numberWithInteger:*MEMORY[0x263F81230]];
        v37[9] = v9;
        char v10 = [NSNumber numberWithInteger:*MEMORY[0x263F81240]];
        v37[10] = v10;
        uint64_t v11 = [NSNumber numberWithInteger:*MEMORY[0x263F81250]];
        v37[11] = v11;
        v37[12] = &unk_26F493AD8;
        v37[13] = &unk_26F493AF0;
        v37[14] = &unk_26F493B08;
        v37[15] = &unk_26F493B20;
        v37[16] = &unk_26F493B38;
        v37[17] = &unk_26F493B50;
        v37[18] = &unk_26F493B68;
        id v12 = [NSNumber numberWithInteger:*MEMORY[0x263F81270]];
        v37[19] = v12;
        v37[20] = &unk_26F493B80;
        v37[21] = &unk_26F493B98;
        v37[22] = &unk_26F493BB0;
        id v13 = [NSNumber numberWithInteger:*v7];
        v37[23] = v13;
        id v14 = [NSNumber numberWithInteger:*MEMORY[0x263F81258]];
        v37[24] = v14;
        v37[25] = &unk_26F493BE0;
        uint64_t v15 = [NSNumber numberWithInteger:*MEMORY[0x263F81220]];
        v37[26] = v15;
        uint64_t v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:27];

        id v17 = [MEMORY[0x263EFF980] array];
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id v18 = v16;
        uint64_t v19 = [v18 countByEnumeratingWithState:&v31 objects:v36 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v32;
          do
          {
            for (uint64_t i = 0; i != v20; ++i)
            {
              if (*(void *)v32 != v21) {
                objc_enumerationMutation(v18);
              }
              long long v23 = -[UIKitWebAccessibilityObjectWrapper _accessibilityCustomRotor:](self, "_accessibilityCustomRotor:", [*(id *)(*((void *)&v31 + 1) + 8 * i) integerValue]);
              [v17 axSafelyAddObject:v23];
            }
            uint64_t v20 = [v18 countByEnumeratingWithState:&v31 objects:v36 count:16];
          }
          while (v20);
        }

        [(UIKitWebAccessibilityObjectWrapper *)self _accessibilitySetRetainedValue:v17 forKey:@"AXRotors"];
        id v4 = v17;
      }
    }
    else
    {
      unint64_t v5 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityTraits];
      if ((*MEMORY[0x263F81408] & ~v5) != 0 || (*MEMORY[0x263F81398] & ~v5) != 0)
      {
        v30.receiver = self;
        v30.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
        id v4 = [(UIKitWebAccessibilityObjectWrapper *)&v30 accessibilityCustomRotors];
      }
      else
      {
        id v6 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityCustomRotor:13];
        id v35 = v6;
        id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v35 count:1];
      }
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (BOOL)_accessibilityShouldSpeakMathEquationTrait
{
  if ([(UIKitWebAccessibilityObjectWrapper *)self _prepareAccessibilityCall])
  {
    if ([(UIKitWebAccessibilityObjectWrapper *)self _axIsWebKit2])
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      id v4 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Uiwebview.isa)];
      int v3 = [v4 _accessibilityIsMathTouchExplorationView] ^ 1;
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (unint64_t)accessibilityTraits
{
  int v3 = (void *)MEMORY[0x2455E7590](self, a2);
  unint64_t v4 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityTraitsHelper];
  return v4;
}

- (unint64_t)_accessibilityTraitsHelper
{
  v13.receiver = self;
  v13.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
  uint64_t v3 = [(UIKitWebAccessibilityObjectWrapper *)&v13 accessibilityTraits];
  if (![(UIKitWebAccessibilityObjectWrapper *)self _axIsWebKit2])
  {
    unint64_t v4 = [NSClassFromString(&cfstr_Uiperipheralho.isa) safeValueForKey:@"sharedInstance"];
    unint64_t v5 = v4;
    if ((*MEMORY[0x263F21A30] & v3) != 0 && [v4 safeBoolForKey:@"isOffScreen"]) {
      uint64_t v3 = _AXTraitsRemoveTrait();
    }
  }
  BOOL v6 = [(UIKitWebAccessibilityObjectWrapper *)self _axIsInteractiveVideo];
  uint64_t v7 = *MEMORY[0x263F21C98];
  if (!v6) {
    uint64_t v7 = 0;
  }
  uint64_t v8 = v7 | v3;
  int v9 = [(UIKitWebAccessibilityObjectWrapper *)self safeBoolForKey:@"accessibilityIsMathTopObject"];
  uint64_t v10 = *MEMORY[0x263F21A58];
  if (!v9) {
    uint64_t v10 = 0;
  }
  unint64_t v11 = v8 | v10;
  if ((*MEMORY[0x263F21B68] & ~v11) == 0
    && ([(UIKitWebAccessibilityObjectWrapper *)self safeBoolForKey:@"accessibilityCanSetValue"] & 1) == 0)
  {
    v11 |= *MEMORY[0x263F21AA0];
  }
  if ((*MEMORY[0x263F21A88] & v11) != 0
    && [(UIKitWebAccessibilityObjectWrapper *)self safeBoolForKey:@"accessibilitySupportsARIAExpanded"])
  {
    return *MEMORY[0x263F219B8] | _AXTraitsRemoveTrait();
  }
  return v11;
}

- (void)_accessibilityModifySelection:(id)a3 increase:(BOOL)a4
{
  id v5 = a3;
  if ([(UIKitWebAccessibilityObjectWrapper *)self _prepareAccessibilityCall])
  {
    if (([v5 isEqualToString:@"word"] & 1) == 0
      && ([v5 isEqualToString:@"line"] & 1) == 0
      && ([v5 isEqualToString:@"page"] & 1) == 0)
    {
      [v5 isEqualToString:@"all"];
    }
    AXPerformSafeBlock();
  }
}

uint64_t __77__UIKitWebAccessibilityObjectWrapper__accessibilityModifySelection_increase___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessibilityModifySelection:*(unsigned __int8 *)(a1 + 40) increase:*(unsigned __int8 *)(a1 + 41)];
}

- (void)_accessibilityDecreaseSelection:(id)a3
{
}

- (void)_accessibilityIncreaseSelection:(id)a3
{
}

- (void)_accessibilityMoveSelectionToMarker:(id)a3
{
  unint64_t v4 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", a3, 0);
  id v5 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityConvertDataArrayToTextMarkerArray:v4];

  id v6 = [v5 lastObject];
  if (objc_opt_respondsToSelector()) {
    [(UIKitWebAccessibilityObjectWrapper *)self accessibilityMoveSelectionToMarker:v6];
  }
}

- (id)_accessibilityWebAreaURL
{
  uint64_t v2 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityContainer];
  if (v2)
  {
    uint64_t v3 = *MEMORY[0x263F1CF10];
    while (1)
    {
      if ((v3 & ~[v2 accessibilityTraits]) != 0)
      {
        uint64_t v4 = [v2 accessibilityURL];
        if (v4) {
          break;
        }
      }
      id v5 = [v2 accessibilityContainer];

      uint64_t v2 = v5;
      if (!v5) {
        goto LABEL_9;
      }
    }
    id v5 = (void *)v4;
  }
  else
  {
    id v5 = 0;
  }
LABEL_9:

  return v5;
}

- (void)_performLiveRegionUpdate
{
  uint64_t v2 = self;
  uint64_t v96 = *MEMORY[0x263EF8340];
  if ([(UIKitWebAccessibilityObjectWrapper *)self _prepareAccessibilityCall])
  {
    uint64_t v3 = [(UIKitWebAccessibilityObjectWrapper *)v2 safeValueForKey:@"accessibilityARIAIsBusy"];
    char v4 = [v3 BOOLValue];

    if ((v4 & 1) == 0)
    {
      id v5 = [(UIKitWebAccessibilityObjectWrapper *)v2 safeValueForKey:@"accessibilityARIALiveRegionStatus"];
      unsigned int v6 = [v5 isEqualToString:@"polite"];
      if ([v5 isEqualToString:@"off"])
      {
        uint64_t v7 = _UIAccessibilityFocusedElementForAssistiveTech();
        int v8 = [v7 _accessibilityIsDescendantOfElement:v2];

        if (!v8)
        {
LABEL_75:

          return;
        }
        unsigned int v58 = 1;
      }
      else
      {
        unsigned int v58 = v6;
      }
      int v9 = [(UIKitWebAccessibilityObjectWrapper *)v2 safeValueForKey:@"accessibilityARIALiveRegionIsAtomic"];
      int v10 = [v9 BOOLValue];

      unint64_t v11 = [(UIKitWebAccessibilityObjectWrapper *)v2 safeValueForKey:@"accessibilityARIARelevantStatus"];
      id v12 = [v11 componentsSeparatedByString:@" "];

      uint64_t v64 = v12;
      v65 = v5;
      if ([v12 count])
      {
        int v13 = [v12 containsObject:@"additions"];
        int v14 = [v12 containsObject:@"text"];
        int v15 = [v12 containsObject:@"removals"];
        if (![v12 containsObject:@"all"])
        {
          int v59 = v15;
          int v61 = v14;
          int v66 = v13;
          goto LABEL_13;
        }
        int v59 = 1;
        int v61 = 1;
      }
      else
      {
        int v59 = 0;
        int v61 = 1;
      }
      int v66 = 1;
LABEL_13:
      uint64_t v16 = [MEMORY[0x263EFF980] array];
      id v17 = [MEMORY[0x263EFF980] arrayWithObject:v2];
      while ([v17 count])
      {
        id v18 = [v17 lastObject];
        [v17 removeLastObject];
        if ([v18 isAccessibilityElement])
        {
          id v19 = +[AXLiveRegionNode createNodeFromObject:v18];
          if ([v16 count]) {
            [v16 insertObject:v19 atIndex:0];
          }
          else {
            [v16 addObject:v19];
          }
        }
        else
        {
          v90[0] = MEMORY[0x263EF8330];
          v90[1] = 3221225472;
          v90[2] = __62__UIKitWebAccessibilityObjectWrapper__performLiveRegionUpdate__block_invoke;
          v90[3] = &unk_2650B7DE0;
          id v91 = v17;
          [v18 accessibilityEnumerateContainerElementsUsingBlock:v90];
          id v19 = v91;
        }
      }
      uint64_t v20 = [MEMORY[0x263EFF980] array];
      uint64_t v21 = [(UIKitWebAccessibilityObjectWrapper *)v2 _accessibilityValueForKey:@"LiveRegionTree"];
      long long v22 = [v21 objectForKey:@"Nodes"];
      v62 = v21;
      [v21 objectForKey:@"Text"];
      id v69 = v68 = v2;
      v63 = v17;
      if (v59)
      {
        long long v88 = 0u;
        long long v89 = 0u;
        long long v86 = 0u;
        long long v87 = 0u;
        id v23 = v22;
        uint64_t v24 = [v23 countByEnumeratingWithState:&v86 objects:v95 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          char v26 = 0;
          uint64_t v27 = *(void *)v87;
          do
          {
            for (uint64_t i = 0; i != v25; ++i)
            {
              if (*(void *)v87 != v27) {
                objc_enumerationMutation(v23);
              }
              uint64_t v29 = *(void *)(*((void *)&v86 + 1) + 8 * i);
              if (([v16 containsObject:v29] ^ 1 | v10) == 1)
              {
                [v20 addObject:v29];
                char v26 = 1;
              }
            }
            uint64_t v25 = [v23 countByEnumeratingWithState:&v86 objects:v95 count:16];
          }
          while (v25);
        }
        else
        {
          char v26 = 0;
        }

        unsigned int v60 = v26 & 1;
        uint64_t v2 = v68;
      }
      else
      {
        unsigned int v60 = 0;
      }
      if (v66)
      {
        long long v84 = 0u;
        long long v85 = 0u;
        long long v82 = 0u;
        long long v83 = 0u;
        id v30 = v16;
        uint64_t v31 = [v30 countByEnumeratingWithState:&v82 objects:v94 count:16];
        if (v31)
        {
          uint64_t v32 = v31;
          uint64_t v33 = *(void *)v83;
          do
          {
            for (uint64_t j = 0; j != v32; ++j)
            {
              if (*(void *)v83 != v33) {
                objc_enumerationMutation(v30);
              }
              uint64_t v35 = *(void *)(*((void *)&v82 + 1) + 8 * j);
              if (([v20 containsObject:v35] & 1) == 0
                && ([v22 containsObject:v35] ^ 1 | v10) == 1)
              {
                [v20 addObject:v35];
              }
            }
            uint64_t v32 = [v30 countByEnumeratingWithState:&v82 objects:v94 count:16];
          }
          while (v32);
        }
      }
      CGFloat v36 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:2];
      [v36 setObject:v16 forKey:@"Nodes"];
      v67 = v36;
      if (v61)
      {
        uint64_t v37 = [v16 count];
        if (v37 == [v22 count] || !v22)
        {
          CGFloat v38 = [MEMORY[0x263EFF980] array];
          [v36 setObject:v38 forKey:@"Text"];
          if (v69)
          {
            v74[0] = MEMORY[0x263EF8330];
            v74[1] = 3221225472;
            v74[2] = __62__UIKitWebAccessibilityObjectWrapper__performLiveRegionUpdate__block_invoke_2;
            v74[3] = &unk_2650B7E08;
            id v75 = v16;
            id v76 = v20;
            id v77 = v38;
            [v69 enumerateObjectsUsingBlock:v74];

            id v39 = v75;
          }
          else
          {
            long long v80 = 0u;
            long long v81 = 0u;
            long long v78 = 0u;
            long long v79 = 0u;
            id v39 = v16;
            uint64_t v40 = [v39 countByEnumeratingWithState:&v78 objects:v93 count:16];
            if (v40)
            {
              uint64_t v41 = v40;
              uint64_t v42 = *(void *)v79;
              do
              {
                for (uint64_t k = 0; k != v41; ++k)
                {
                  if (*(void *)v79 != v42) {
                    objc_enumerationMutation(v39);
                  }
                  uint64_t v44 = [*(id *)(*((void *)&v78 + 1) + 8 * k) label];
                  if (v44) {
                    uint64_t v45 = (__CFString *)v44;
                  }
                  else {
                    uint64_t v45 = &stru_26F48F3B0;
                  }
                  [v38 addObject:v45];
                }
                uint64_t v41 = [v39 countByEnumeratingWithState:&v78 objects:v93 count:16];
              }
              while (v41);
              CGFloat v36 = v67;
              uint64_t v2 = v68;
            }
          }
        }
      }
      [(UIKitWebAccessibilityObjectWrapper *)v2 _accessibilitySetRetainedValue:v36 forKey:@"LiveRegionTree"];
      long long v72 = 0u;
      long long v73 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      id v46 = v20;
      uint64_t v47 = [v46 countByEnumeratingWithState:&v70 objects:v92 count:16];
      if (v47)
      {
        uint64_t v48 = v47;
        id v49 = 0;
        uint64_t v50 = *(void *)v71;
        do
        {
          uint64_t v51 = 0;
          uint64_t v52 = v49;
          do
          {
            if (*(void *)v71 != v50) {
              objc_enumerationMutation(v46);
            }
            v56 = objc_msgSend(*(id *)(*((void *)&v70 + 1) + 8 * v51), "label", v56, v57);
            id v57 = @"__AXStringForVariablesSentinel";
            __UIAXStringForVariables();
            id v49 = (id)objc_claimAutoreleasedReturnValue();

            ++v51;
            uint64_t v52 = v49;
          }
          while (v48 != v51);
          uint64_t v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v70, v92, 16, v56, @"__AXStringForVariablesSentinel");
        }
        while (v48);
      }
      else
      {
        id v49 = 0;
      }

      if ([v49 length])
      {
        v53 = [MEMORY[0x263F21660] axAttributedStringWithString:v49];

        uint64_t v54 = [NSNumber numberWithBool:v58];
        [v53 setAttribute:v54 forKey:*MEMORY[0x263F218F8]];

        [v53 setAttribute:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F217D0]];
        v55 = [NSNumber numberWithBool:v60];
        [v53 setAttribute:v55 forKey:*MEMORY[0x263F217D8]];

        id v49 = v53;
        AXPerformBlockOnMainThreadAfterDelay();
      }
      id v5 = v65;
      goto LABEL_75;
    }
  }
}

uint64_t __62__UIKitWebAccessibilityObjectWrapper__performLiveRegionUpdate__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void __62__UIKitWebAccessibilityObjectWrapper__performLiveRegionUpdate__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v8 = [v5 objectAtIndex:a3];
  uint64_t v7 = [v8 label];
  LOBYTE(v5) = [(__CFString *)v7 isEqualToString:v6];

  if ((v5 & 1) == 0 && ([*(id *)(a1 + 40) containsObject:v8] & 1) == 0) {
    [*(id *)(a1 + 40) addObject:v8];
  }
  if (!v7) {
    uint64_t v7 = &stru_26F48F3B0;
  }
  [*(id *)(a1 + 48) addObject:v7];
}

uint64_t __62__UIKitWebAccessibilityObjectWrapper__performLiveRegionUpdate__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _axHandleNotificationPosting:*MEMORY[0x263F1CDC8] data:*(void *)(a1 + 40)];
}

- (void)_axHandleNotificationPosting:(unsigned int)a3 data:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id argument = a4;
  if ((int)v4 <= 3031)
  {
    if (v4 != 1026)
    {
      if (v4 != 1046) {
        goto LABEL_37;
      }
      if ([(UIKitWebAccessibilityObjectWrapper *)self _accessibilityExpandedStatus] == 1) {
        id v6 = @"expanded";
      }
      else {
        id v6 = @"collapsed";
      }
      uint64_t v7 = accessibilityLocalizedString(v6);
      id v8 = argument;
      goto LABEL_36;
    }
    id v8 = [(UIKitWebAccessibilityObjectWrapper *)self safeStringForKey:@"accessibilityInvalidStatus"];
    if ([v8 length] && (objc_msgSend(v8, "isEqualToString:", @"false") & 1) == 0)
    {
      if ([v8 isEqualToString:@"grammar"])
      {
        int v9 = @"invalidStatusGrammar";
        goto LABEL_34;
      }
      int v10 = [v8 isEqualToString:@"spelling"];
      unint64_t v11 = @"invalidStatusGeneral";
      id v12 = @"invalidStatusSpelling";
LABEL_25:
      if (v10) {
        int v9 = v12;
      }
      else {
        int v9 = v11;
      }
      goto LABEL_34;
    }
    goto LABEL_18;
  }
  if (v4 == 3032)
  {
    id v8 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityCurrentStatus];
    if ([v8 length] && (objc_msgSend(v8, "isEqualToString:", @"false") & 1) == 0)
    {
      if ([v8 isEqualToString:@"page"])
      {
        int v9 = @"currentStatusPage";
        goto LABEL_34;
      }
      if ([v8 isEqualToString:@"step"])
      {
        int v9 = @"currentStatusStep";
        goto LABEL_34;
      }
      if ([v8 isEqualToString:@"location"])
      {
        int v9 = @"currentStatusLocation";
        goto LABEL_34;
      }
      if ([v8 isEqualToString:@"date"])
      {
        int v9 = @"currentStatusDate";
        goto LABEL_34;
      }
      int v10 = [v8 isEqualToString:@"time"];
      unint64_t v11 = @"currentStatusGeneral";
      id v12 = @"currentStatusTime";
      goto LABEL_25;
    }
LABEL_18:

    goto LABEL_40;
  }
  if (v4 != 3033) {
    goto LABEL_37;
  }
  id v8 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilitySortDirection];
  if ([v8 isEqualToString:@"AXAscendingSortDirection"])
  {
    int v9 = @"sortUp";
LABEL_34:
    uint64_t v7 = accessibilityLocalizedString(v9);
    goto LABEL_35;
  }
  if ([v8 isEqualToString:@"AXDescendingSortDirection"])
  {
    int v9 = @"sortDown";
    goto LABEL_34;
  }
  uint64_t v7 = 0;
LABEL_35:

LABEL_36:
  uint64_t v4 = 1008;
  id argument = (id)v7;
LABEL_37:
  if ([(UIKitWebAccessibilityObjectWrapper *)self _axSupportsWebKitNotificationRelay])
  {
    [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityRelayToChrome:v4 object:argument];
  }
  else
  {
    UIAccessibilityPostNotification(v4, argument);
  }
LABEL_40:
}

- (BOOL)_axSupportsWebKitNotificationRelay
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__UIKitWebAccessibilityObjectWrapper__axSupportsWebKitNotificationRelay__block_invoke;
  block[3] = &unk_2650B7CF0;
  block[4] = self;
  if (_axSupportsWebKitNotificationRelay_onceToken != -1) {
    dispatch_once(&_axSupportsWebKitNotificationRelay_onceToken, block);
  }
  return _axSupportsWebKitNotificationRelay_Supports;
}

uint64_t __72__UIKitWebAccessibilityObjectWrapper__axSupportsWebKitNotificationRelay__block_invoke()
{
  uint64_t result = objc_opt_respondsToSelector();
  _axSupportsWebKitNotificationRelay_Supports = result & 1;
  return result;
}

- (id)_axDataConvertForNotification:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 attributedString];
LABEL_6:
    Data = v5;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v5 = v4;
    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    Data = (void *)[v4 mutableCopy];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v8 = v4;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v27 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          int v14 = [v8 objectForKey:v13];
          int v15 = [(UIKitWebAccessibilityObjectWrapper *)self _axDataConvertForNotification:v14];

          [Data setObject:v15 forKeyedSubscript:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v10);
    }
LABEL_27:

    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    Data = (void *)[v4 mutableCopy];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v8 = v4;
    uint64_t v16 = [v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v23;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v23 != v18) {
            objc_enumerationMutation(v8);
          }
          uint64_t v20 = -[UIKitWebAccessibilityObjectWrapper _axDataConvertForNotification:](self, "_axDataConvertForNotification:", *(void *)(*((void *)&v22 + 1) + 8 * j), (void)v22);
          [Data setObject:v20 atIndexedSubscript:0];
        }
        uint64_t v17 = [v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v17);
    }
    goto LABEL_27;
  }
  if (v4)
  {
    uint64_t v21 = (const void *)_AXCreateAXUIElementWithElement();
    Data = (void *)_AXUIElementCreateData();
    if (v21) {
      CFRelease(v21);
    }
  }
  else
  {
    Data = 0;
  }
LABEL_7:

  return Data;
}

- (void)_accessibilityRelayToChrome:(unsigned int)a3 object:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = [(UIKitWebAccessibilityObjectWrapper *)self _axDataConvertForNotification:a4];
  id v12 = 0;
  uint64_t v7 = [MEMORY[0x263F08910] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v12];
  id v8 = v12;
  if (v8)
  {
    uint64_t v9 = AXLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[UIKitWebAccessibilityObjectWrapper _accessibilityRelayToChrome:object:]();
    }
  }
  uint64_t v10 = [NSNumber numberWithUnsignedInt:v4];
  uint64_t v11 = AXWebNotificationName(v10);
  [(UIKitWebAccessibilityObjectWrapper *)self handleNotificationRelayToChrome:v11 notificationData:v7];
}

- (id)_accessibilityValueForHandwriting
{
  v4.receiver = self;
  v4.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
  uint64_t v2 = [(UIKitWebAccessibilityObjectWrapper *)&v4 accessibilityValue];

  return v2;
}

- (_NSRange)_accessibilitySelectedTextRangeForHandwritingWithValue:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityTraits];
  if ((*MEMORY[0x263F21AE0] & ~v5) != 0)
  {
    id v6 = (id)[(UIKitWebAccessibilityObjectWrapper *)self _accessibilitySelectedTextRange];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
    id v6 = [(UIKitWebAccessibilityObjectWrapper *)&v12 _accessibilitySelectedTextRange];
  }
  uint64_t v8 = (uint64_t)v6;
  NSUInteger v9 = v7;
  if (v6 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = [v4 length];
    NSUInteger v9 = 0;
  }

  NSUInteger v10 = v8;
  NSUInteger v11 = v9;
  result.NSUInteger length = v11;
  result.NSUInteger location = v10;
  return result;
}

- (void)_accessibilityInsertText:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
    AXPerformSafeBlock();
  }
}

uint64_t __63__UIKitWebAccessibilityObjectWrapper__accessibilityInsertText___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessibilityInsertText:*(void *)(a1 + 40)];
}

- (void)_accessibilityReplaceCharactersAtCursor:(unint64_t)a3 withString:(id)a4
{
  id v4 = (__CFString *)a4;
  id v5 = &stru_26F48F3B0;
  if (v4) {
    id v5 = v4;
  }
  NSUInteger v7 = v5;
  id v6 = v5;
  AXPerformSafeBlock();
}

void __89__UIKitWebAccessibilityObjectWrapper__accessibilityReplaceCharactersAtCursor_withString___block_invoke(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) _accessibilitySelectedTextRange];
  unint64_t v4 = v3;
  uint64_t v5 = [*(id *)(a1 + 32) accessibilityTraits];
  uint64_t v6 = *MEMORY[0x263F813D8];
  uint64_t v7 = *MEMORY[0x263F813D8] & v5;
  if (v7 == *MEMORY[0x263F813D8])
  {
    uint64_t v8 = [*(id *)(a1 + 32) accessibilityValue];
    unint64_t v2 = [v8 length];

    unint64_t v4 = 0;
  }
  if (!v4)
  {
    if (v2 >= *(void *)(a1 + 48)) {
      unint64_t v4 = *(void *)(a1 + 48);
    }
    else {
      unint64_t v4 = v2;
    }
    v2 -= v4;
  }
  objc_msgSend(*(id *)(a1 + 32), "accessibilityReplaceRange:withText:", v2, v4, *(void *)(a1 + 40));
  if (v7 == v6)
  {
    NSUInteger v9 = *(void **)(a1 + 32);
    id v10 = [v9 accessibilityValue];
    objc_msgSend(v9, "_accessibilitySetSelectedTextRange:", objc_msgSend(v10, "length"), 0);
  }
}

- (id)_accessibilityTextViewTextOperationResponder
{
  unint64_t v2 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityWebPageParent];
  unint64_t v3 = [v2 _accessibilityTextViewTextOperationResponder];

  return v3;
}

- (BOOL)_accessibilityHasTextOperations
{
  if ([(UIKitWebAccessibilityObjectWrapper *)self _axIsWebKit2]) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
  return [(UIKitWebAccessibilityObjectWrapper *)&v4 _accessibilityHasTextOperations];
}

- (BOOL)_accessibilitySupportsTextInsertionAndDeletion
{
  unint64_t v3 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityTraits];
  if (((*MEMORY[0x263F219B8] | *MEMORY[0x263F21A48]) & v3) != 0) {
    return 0;
  }
  uint64_t v5 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityWebPageParent];
  uint64_t v6 = [v5 _accessibilityResponderElement];
  BOOL v4 = v6 == self;

  return v4;
}

- (id)accessibilityIdentifier
{
  if (_AXSAutomationEnabled())
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __61__UIKitWebAccessibilityObjectWrapper_accessibilityIdentifier__block_invoke;
    block[3] = &unk_2650B7CF0;
    uint64_t v7 = @"AXEnableWebKitDOMIdentifier";
    if (accessibilityIdentifier_onceToken != -1) {
      dispatch_once(&accessibilityIdentifier_onceToken, block);
    }
    if (accessibilityIdentifier_UsesDOMAsIdentifier)
    {
      v5.receiver = self;
      v5.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
      unint64_t v3 = [(UIKitWebAccessibilityObjectWrapper *)&v5 accessibilityIdentifier];
    }
    else
    {
      unint64_t v3 = 0;
    }
  }
  else
  {
    unint64_t v3 = 0;
  }

  return v3;
}

uint64_t __61__UIKitWebAccessibilityObjectWrapper_accessibilityIdentifier__block_invoke(uint64_t a1)
{
  uint64_t result = CFPreferencesGetAppBooleanValue(*(CFStringRef *)(a1 + 32), (CFStringRef)*MEMORY[0x263F8B0F8], 0);
  accessibilityIdentifier_UsesDOMAsIdentifier = result != 0;
  return result;
}

- (void)_performPostScrollStatus:(id)a3
{
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  BOOL v5 = [(UIKitWebAccessibilityObjectWrapper *)self _axIsWebKit2];
  if (v5)
  {
    LastScrollDirection = a3;
    v7.receiver = self;
    v7.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
    LOBYTE(v5) = [(UIKitWebAccessibilityObjectWrapper *)&v7 accessibilityScroll:a3];
  }
  return v5;
}

- (id)_accessibilityScrollStatus
{
  if ([(UIKitWebAccessibilityObjectWrapper *)self _prepareAccessibilityCall])
  {
    unint64_t v3 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityMakeScrollStatus];
  }
  else
  {
    unint64_t v3 = 0;
  }

  return v3;
}

- (id)_accessibilityMakeScrollStatus
{
  unint64_t v3 = [(UIKitWebAccessibilityObjectWrapper *)self safeValueForKey:@"_accessibilityScrollVisibleRect"];
  [v3 CGRectValue];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  double v9 = v8;
  double v11 = v10;

  objc_super v12 = [(UIKitWebAccessibilityObjectWrapper *)self safeValueForKey:@"_accessibilityScrollSize"];
  [v12 CGSizeValue];
  double v14 = v13;
  double v16 = v15;

  if ((unint64_t)LastScrollDirection > 4 || ((1 << LastScrollDirection) & 0x19) == 0)
  {
    if ((unint64_t)(LastScrollDirection - 1) <= 1 && v14 > v9)
    {
      v26.origin.CGFloat x = v5;
      v26.origin.CGFloat y = v7;
      v26.size.double width = v9;
      v26.size.double height = v11;
      CGRectGetMidX(v26);
    }
  }
  else if (v16 > v11)
  {
    v25.origin.CGFloat x = v5;
    v25.origin.CGFloat y = v7;
    v25.size.double width = v9;
    v25.size.double height = v11;
    CGRectGetMidY(v25);
  }
  uint64_t v18 = NSString;
  id v19 = UIKitAccessibilityLocalizedString();
  uint64_t v20 = AXFormatInteger();
  uint64_t v21 = AXFormatInteger();
  long long v22 = objc_msgSend(v18, "stringWithFormat:", v19, v20, v21);

  return v22;
}

- (void)_repostWebNotification:(id)a3
{
  uint64_t v4 = [a3 unsignedIntValue];

  [(UIKitWebAccessibilityObjectWrapper *)self _axHandleNotificationPosting:v4 data:0];
}

- (void)_enqueReorderingNotification:(id)a3
{
  id v4 = a3;
  if (!TextEditingReorderQueue)
  {
    uint64_t v5 = [MEMORY[0x263EFF980] array];
    double v6 = (void *)TextEditingReorderQueue;
    TextEditingReorderQueue = v5;

    id v7 = objc_alloc(MEMORY[0x263F21398]);
    uint64_t v8 = [v7 initWithTargetSerialQueue:MEMORY[0x263EF83A0]];
    double v9 = (void *)TextEditingReorderTimer;
    TextEditingReorderTimer = v8;
  }
  double v10 = [v4 objectForKey:@"notification"];
  int v11 = [v10 unsignedIntValue];

  if (v11 == 1017)
  {
    objc_super v12 = self;
    if (v12)
    {
      double v13 = v12;
      double v14 = v12;
      do
      {
        if ([v13 isAccessibilityElement])
        {
          double v15 = v13;

          double v14 = v15;
        }
        uint64_t v16 = [v13 accessibilityContainer];

        double v13 = (void *)v16;
      }
      while (v16);
    }
    else
    {
      double v14 = 0;
    }
    uint64_t v17 = [(UIKitWebAccessibilityObjectWrapper *)v14 accessibilityTraits];
    if ((*MEMORY[0x263F21A30] & v17) != 0) {
      uint64_t v18 = &unk_26F493D90;
    }
    else {
      uint64_t v18 = &unk_26F493DB8;
    }
    [(id)TextEditingReorderQueue addObject:v18];
  }
  else
  {
    [(id)TextEditingReorderQueue addObject:v4];
  }
  [(id)TextEditingReorderTimer cancel];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __67__UIKitWebAccessibilityObjectWrapper__enqueReorderingNotification___block_invoke;
  v19[3] = &unk_2650B7CF0;
  v19[4] = self;
  [(id)TextEditingReorderTimer afterDelay:v19 processBlock:0.05];
}

void __67__UIKitWebAccessibilityObjectWrapper__enqueReorderingNotification___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) _prepareAccessibilityCall])
  {
    v1 = objc_opt_new();
    if ([(id)TextEditingReorderQueue count])
    {
      unint64_t v2 = 0;
      do
      {
        unint64_t v3 = [(id)TextEditingReorderQueue objectAtIndexedSubscript:v2];
        id v4 = [v3 objectForKey:@"notification"];

        uint64_t v5 = [(id)TextEditingReorderQueue objectAtIndexedSubscript:v2];
        [v1 setObject:v5 forKeyedSubscript:v4];

        ++v2;
      }
      while (v2 < [(id)TextEditingReorderQueue count]);
    }
    double v6 = (void *)TextEditingReorderQueue;
    id v19 = v1;
    id v7 = [v1 allValues];
    [v6 setArray:v7];

    [(id)TextEditingReorderQueue sortUsingComparator:&__block_literal_global_1561];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id obj = (id)TextEditingReorderQueue;
    uint64_t v8 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(obj);
          }
          objc_super v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          double v13 = [v12 objectForKey:@"notification"];
          uint64_t v14 = [v13 unsignedIntValue];

          double v15 = [v12 objectForKey:@"info"];
          uint64_t v16 = [v12 objectForKey:@"associatedElement"];
          if (v16) {
            _UIAccessibilitySetAssociatedElementContextForNextNotification();
          }
          uint64_t v17 = *(void **)(a1 + 32);
          if ([v17 _axSupportsWebKitNotificationRelay]) {
            uint64_t v18 = v12;
          }
          else {
            uint64_t v18 = v15;
          }
          [v17 _axHandleNotificationPosting:v14 data:v18];
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v9);
    }

    [(id)TextEditingReorderQueue removeAllObjects];
  }
}

uint64_t __67__UIKitWebAccessibilityObjectWrapper__enqueReorderingNotification___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 objectForKey:@"notification"];
  int v6 = [v5 unsignedIntValue];

  id v7 = [v4 objectForKey:@"notification"];

  int v8 = [v7 unsignedIntValue];
  if (v6 == 1005) {
    return -1;
  }
  if (v6 == 1017 || v6 == 1022 || v8 == 1005) {
    return 1;
  }
  if (v8 == 1017 || v8 == 1022) {
    return -1;
  }
  return 0;
}

- (void)postScreenChangeNotification
{
  id v3 = [NSNumber numberWithInteger:*MEMORY[0x263F1CE68]];
  [(UIKitWebAccessibilityObjectWrapper *)self performSelectorOnMainThread:sel__repostWebNotification_ withObject:v3 waitUntilDone:0];
}

- (id)screenReaderVersion
{
  return (id)MEMORY[0x270F80AF0](self, a2);
}

- (BOOL)_accessibilityVisiblePointHonorsScreenBounds
{
  return 1;
}

- (CGRect)accessibilityFrameForScrolling
{
  id v3 = objc_msgSend(NSString, "stringWithFormat:", @"%p-_accessibilityFrameForScrolling", self);
  id v4 = (id *)MEMORY[0x263F81160];
  uint64_t v5 = [(id)*MEMORY[0x263F81160] objectForKeyedSubscript:v3];

  if (v5)
  {
    int v6 = [*v4 objectForKeyedSubscript:v3];
    [v6 CGRectValue];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
LABEL_21:

    goto LABEL_22;
  }
  if ([(UIKitWebAccessibilityObjectWrapper *)self _prepareAccessibilityCall])
  {
    if ((didInitIAdCheck & 1) == 0)
    {
      double v15 = [NSClassFromString(&cfstr_Uiapplication.isa) safeValueForKey:@"sharedApplication"];
      NSClassFromString(&cfstr_Adsheetapplica.isa);
      isIADs = objc_opt_isKindOfClass() & 1;

      didInitIAdChecuint64_t k = 1;
    }
    BOOL v16 = [(UIKitWebAccessibilityObjectWrapper *)self _axIsWebKit2];
    if (v16)
    {
      int v6 = 0;
    }
    else
    {
      int v6 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityWebDocumentView];
    }
    if (isIADs)
    {
      [(UIKitWebAccessibilityObjectWrapper *)self accessibilityElementRect];
LABEL_12:
      UIAccessibilityFrameForBounds();
      double v8 = v17;
      double v10 = v18;
      double v12 = v19;
      double v14 = v20;
      uint64_t v21 = (void *)MEMORY[0x263F08D40];
LABEL_20:
      CGFloat v36 = objc_msgSend(v21, "valueWithCGRect:");
      [*v4 setObject:v36 forKeyedSubscript:v3];

      goto LABEL_21;
    }
    unint64_t v22 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityTraits];
    if ((*MEMORY[0x263F1CF10] & v22) != 0
      && [(UIKitWebAccessibilityObjectWrapper *)self accessibilityElementCount] == 1)
    {
      long long v23 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityElementAtIndex:0];
      [v23 accessibilityFrame];
      double v8 = v24;
      double v10 = v25;
      double v12 = v26;
      double v14 = v27;
    }
    else
    {
      v49.receiver = self;
      v49.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
      [(UIKitWebAccessibilityObjectWrapper *)&v49 accessibilityFrame];
      double v8 = v28;
      double v10 = v29;
      double v12 = v30;
      double v14 = v31;
      if (!v16)
      {
        uint64_t v41 = [v6 window];
        objc_msgSend(v6, "convertRect:fromView:", v41, v8, v10, v12, v14);
        double v43 = v42;
        double v45 = v44;

        double v46 = -0.0;
        if (v43 < 0.0) {
          double v46 = v43;
        }
        double v47 = v45 + v46;
        if (v43 < 0.0) {
          double v43 = 0.0;
        }
        [v6 bounds];
        if (v43 > v48 - v47) {
          [v6 bounds];
        }
        goto LABEL_12;
      }
      if (CGRectIsEmpty(*(CGRect *)&v28))
      {
        [(UIKitWebAccessibilityObjectWrapper *)self accessibilityElementRect];
        double v8 = v32;
        double v10 = v33;
        double v12 = v34;
        double v14 = v35;
      }
    }
    uint64_t v21 = (void *)MEMORY[0x263F08D40];
    goto LABEL_20;
  }
  double v8 = *MEMORY[0x263F001A8];
  double v10 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v12 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v14 = *(double *)(MEMORY[0x263F001A8] + 24);
LABEL_22:

  double v37 = v8;
  double v38 = v10;
  double v39 = v12;
  double v40 = v14;
  result.size.double height = v40;
  result.size.double width = v39;
  result.origin.CGFloat y = v38;
  result.origin.CGFloat x = v37;
  return result;
}

- (CGRect)accessibilityFrame
{
  [(UIKitWebAccessibilityObjectWrapper *)self accessibilityFrameForScrolling];
  if (v2 < 0.0) {
    double v2 = 0.0;
  }
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

- (CGRect)_axGetClippingFrame
{
  MEMORY[0x270F09630](self, &__UIKitWebAccessibilityObjectWrapper___axGetClippingFrame);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

- (void)_setAXClippingFrame:(CGRect)a3
{
}

- (CGRect)_accessibilityClippingFrame
{
  if ([(UIKitWebAccessibilityObjectWrapper *)self _prepareAccessibilityCall])
  {
    [(UIKitWebAccessibilityObjectWrapper *)self _axGetClippingFrame];
    if (CGRectIsEmpty(v25))
    {
      double v3 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityContainer];
      double v4 = *MEMORY[0x263F001A8];
      double v5 = *(double *)(MEMORY[0x263F001A8] + 8);
      double v6 = *(double *)(MEMORY[0x263F001A8] + 16);
      double v7 = *(double *)(MEMORY[0x263F001A8] + 24);
      if (objc_opt_respondsToSelector())
      {
        [v3 _accessibilityClippingFrame];
        double v9 = v8;
        double v11 = v10;
        double v13 = v12;
        double v15 = v14;
      }
      else
      {
        double v11 = v5;
        double v13 = v6;
        double v15 = v7;
        double v9 = v4;
        if (v3)
        {
          BOOL v16 = AXLogCommon();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            -[UIKitWebAccessibilityObjectWrapper _accessibilityClippingFrame]();
          }

          double v11 = v5;
          double v13 = v6;
          double v15 = v7;
          double v9 = v4;
        }
      }
      v26.origin.CGFloat x = v9;
      v26.origin.CGFloat y = v11;
      v26.size.double width = v13;
      v26.size.double height = v15;
      if (CGRectIsEmpty(v26))
      {

        goto LABEL_14;
      }
      -[UIKitWebAccessibilityObjectWrapper _setAXClippingFrame:](self, "_setAXClippingFrame:", v9, v11, v13, v15);
    }
    [(UIKitWebAccessibilityObjectWrapper *)self _axGetClippingFrame];
    double v4 = v17;
    double v5 = v18;
    double v6 = v19;
    double v7 = v20;
    goto LABEL_14;
  }
  double v4 = *MEMORY[0x263F001A8];
  double v5 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v7 = *(double *)(MEMORY[0x263F001A8] + 24);
LABEL_14:
  double v21 = v4;
  double v22 = v5;
  double v23 = v6;
  double v24 = v7;
  result.size.double height = v24;
  result.size.double width = v23;
  result.origin.CGFloat y = v22;
  result.origin.CGFloat x = v21;
  return result;
}

- (CGRect)_accessibilityVisibleFrame
{
  [(UIKitWebAccessibilityObjectWrapper *)self accessibilityFrame];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  NSClassFromString(&cfstr_Wkaccessibilit.isa);
  double v11 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityContainer];
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    CGFloat v13 = *MEMORY[0x263F00148];
    double v14 = *(double *)(MEMORY[0x263F00148] + 8);
  }
  else
  {
    [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityClippingFrame];
    v25.origin.CGFloat x = v15;
    v25.origin.CGFloat y = v16;
    v25.size.double width = v17;
    v25.size.double height = v18;
    v23.origin.CGFloat x = v4;
    v23.origin.CGFloat y = v6;
    v23.size.double width = v8;
    v23.size.double height = v10;
    *(CGRect *)&CGFloat v13 = CGRectIntersection(v23, v25);
    CGFloat v8 = v19;
    CGFloat v10 = v20;
  }
  double v21 = v8;
  double v22 = v10;
  result.size.double height = v22;
  result.size.double width = v21;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- (id)_accessibilityApplication
{
  double v2 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityWebPageParent];
  double v3 = [v2 _accessibilityApplication];

  return v3;
}

- (_NSRange)_accessibilityRangeForTextMarker:(id)a3
{
  CGFloat v4 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", a3, 0);
  double v5 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityConvertDataArrayToTextMarkerArray:v4];

  CGFloat v6 = [v5 lastObject];
  uint64_t v7 = [(UIKitWebAccessibilityObjectWrapper *)self positionForTextMarker:v6];

  NSUInteger v8 = v7;
  NSUInteger v9 = 0;
  result.NSUInteger length = v9;
  result.NSUInteger location = v8;
  return result;
}

- (_NSRange)_accessibilityRangeForTextMarkers:(id)a3
{
  CGFloat v4 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityConvertDataArrayToTextMarkerArray:a3];
  if ([v4 count] == 2)
  {
    uint64_t v5 = [(UIKitWebAccessibilityObjectWrapper *)self _rangeForWebTextMarkers:v4];
    NSUInteger v7 = v6;
  }
  else
  {
    NSUInteger v7 = 0;
    uint64_t v5 = 0x7FFFFFFFLL;
  }

  NSUInteger v8 = v5;
  NSUInteger v9 = v7;
  result.NSUInteger length = v9;
  result.NSUInteger location = v8;
  return result;
}

- (_NSRange)_rangeForWebTextMarkers:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 firstObject];
  unint64_t v6 = [(UIKitWebAccessibilityObjectWrapper *)self positionForTextMarker:v5];

  NSUInteger v7 = [v4 lastObject];

  unint64_t v8 = [(UIKitWebAccessibilityObjectWrapper *)self positionForTextMarker:v7];
  if (v8 >= v6) {
    NSUInteger v9 = v8 - v6;
  }
  else {
    NSUInteger v9 = 0;
  }
  if (v8 >= v6) {
    NSUInteger v10 = v6;
  }
  else {
    NSUInteger v10 = 0x7FFFFFFFLL;
  }
  result.NSUInteger length = v9;
  result.NSUInteger location = v10;
  return result;
}

- (_NSRange)_accessibilitySelectedNSRangeForObject
{
  double v3 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityTextMarkerRangeForSelection];
  id v4 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityConvertDataArrayToTextMarkerArray:v3];

  if ([v4 count] == 2)
  {
    uint64_t v5 = [v4 objectAtIndex:0];
    unint64_t v6 = [v4 objectAtIndex:1];
    char v7 = [v5 isEqual:v6];

    if ((v7 & 1) == 0)
    {
      NSUInteger v10 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityTextMarkerRange];
      double v11 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityConvertDataArrayToTextMarkerArray:v10];

      if ([v11 count] == 2
        && ([v11 objectAtIndex:0],
            double v12 = objc_claimAutoreleasedReturnValue(),
            [v11 objectAtIndex:1],
            CGFloat v13 = objc_claimAutoreleasedReturnValue(),
            char v14 = [v12 isEqual:v13],
            v13,
            v12,
            (v14 & 1) == 0))
      {
        CGFloat v17 = [v4 objectAtIndex:0];
        NSUInteger v18 = [(UIKitWebAccessibilityObjectWrapper *)self positionForTextMarker:v17];

        double v19 = [v4 objectAtIndex:1];
        uint64_t v20 = [(UIKitWebAccessibilityObjectWrapper *)self positionForTextMarker:v19];

        double v21 = [v11 objectAtIndex:0];
        NSUInteger v22 = [(UIKitWebAccessibilityObjectWrapper *)self positionForTextMarker:v21];

        CGRect v23 = [v11 objectAtIndex:1];
        uint64_t v24 = [(UIKitWebAccessibilityObjectWrapper *)self positionForTextMarker:v23];

        v26.NSUInteger length = v20 - v18;
        v28.NSUInteger length = v24 - v22;
        v26.NSUInteger location = v18;
        v28.NSUInteger location = v22;
        NSRange v25 = NSIntersectionRange(v26, v28);
        NSUInteger length = v25.length;
        if (v25.length)
        {
          uint64_t v9 = v25.location - v22;
          goto LABEL_8;
        }
      }
      else
      {
        NSUInteger length = 0;
      }
      uint64_t v9 = 0x7FFFFFFFLL;
LABEL_8:

      goto LABEL_9;
    }
  }
  NSUInteger length = 0;
  uint64_t v9 = 0x7FFFFFFFLL;
LABEL_9:

  NSUInteger v15 = v9;
  NSUInteger v16 = length;
  result.NSUInteger length = v16;
  result.NSUInteger location = v15;
  return result;
}

- (CGPoint)accessibilityActivationPoint
{
  if ([(UIKitWebAccessibilityObjectWrapper *)self _prepareAccessibilityCall])
  {
    [(UIKitWebAccessibilityObjectWrapper *)self accessibilityFrame];
    double v7 = v3;
    double v8 = v4;
    CGFloat v9 = v5;
    CGFloat v10 = v6;
    if (!isIADs)
    {
      unint64_t v13 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityTraits];
      if ((*MEMORY[0x263F813C8] & v13) != 0)
      {
        AX_CGRectGetCenter();
      }
      else
      {
        unint64_t v15 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityTraits];
        if ((*MEMORY[0x263F81408] & ~v15) == 0)
        {
          NSUInteger v16 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityValue];
          uint64_t v17 = [v16 length];

          if (v17)
          {
            double MidX = v7 + 5.0;
            double MidY = v8 + 5.0;
            goto LABEL_12;
          }
        }
        v19.receiver = self;
        v19.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
        [(UIKitWebAccessibilityObjectWrapper *)&v19 accessibilityActivationPoint];
      }
      double MidX = v14;
      goto LABEL_12;
    }
    double MidX = CGRectGetMidX(*(CGRect *)&v3);
    v21.origin.CGFloat x = v7;
    v21.origin.CGFloat y = v8;
    v21.size.double width = v9;
    v21.size.double height = v10;
    double MidY = CGRectGetMidY(v21);
  }
  else
  {
    double MidX = *MEMORY[0x263F00148];
    double MidY = *(double *)(MEMORY[0x263F00148] + 8);
  }
LABEL_12:
  double v18 = MidX;
  result.CGFloat y = MidY;
  result.CGFloat x = v18;
  return result;
}

- (BOOL)_accessibilityIsScrollable
{
  return 1;
}

- (BOOL)_axHasMultipleAccessibleChildren:(int64_t *)a3
{
  uint64_t v5 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityElementCount];
  if (v5 < 1)
  {
    return 0;
  }
  else
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    BOOL v8 = 1;
    do
    {
      CGFloat v9 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityElementAtIndex:v7];
      if ([v9 isAccessibilityElement])
      {
        int64_t v10 = *a3 + 1;
        *a3 = v10;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          [v9 _axHasMultipleAccessibleChildren:a3];
        }
        int64_t v10 = *a3;
      }

      if (v10 >= 2) {
        break;
      }
      BOOL v8 = ++v7 < v6;
    }
    while (v6 != v7);
  }
  return v8;
}

- (id)_accessibilityUnignoredVisibleDescendant
{
  return (id)[(UIKitWebAccessibilityObjectWrapper *)self _accessibilityFindDescendant:&__block_literal_global_1585];
}

BOOL __78__UIKitWebAccessibilityObjectWrapper__accessibilityUnignoredVisibleDescendant__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isAccessibilityElement])
  {
    [v2 _accessibilityVisibleFrame];
    BOOL v5 = v4 > 0.0 && v3 > 0.0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)accessibilityPreviousTextNavigationElement
{
  return [(UIKitWebAccessibilityObjectWrapper *)self accessibilityTextNavigationElementInDirection:2];
}

- (id)accessibilityTextNavigationElementInDirection:(int64_t)a3
{
  if ([(UIKitWebAccessibilityObjectWrapper *)self _prepareAccessibilityCall]
    && (unint64_t v5 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityTraits],
        (*MEMORY[0x263F81408] & v5) == 0))
  {
    uint64_t v7 = [MEMORY[0x263F81198] defaultVoiceOverOptions];
    [v7 setDirection:a3];
    BOOL v8 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityElementsInDirectionWithCount:1 options:v7];
    uint64_t v6 = [v8 firstObject];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)accessibilityNextTextNavigationElement
{
  return [(UIKitWebAccessibilityObjectWrapper *)self accessibilityTextNavigationElementInDirection:1];
}

- (void)_repostFocusChangeNotification
{
  double v3 = [NSClassFromString(&cfstr_Uiperipheralho.isa) safeValueForKey:@"sharedInstance"];
  if (([v3 safeBoolForKey:@"isOnScreen"] & 1) == 0
    && [(UIKitWebAccessibilityObjectWrapper *)self _prepareAccessibilityCall])
  {
    double v4 = [(UIKitWebAccessibilityObjectWrapper *)self safeValueForKey:@"accessibilityFocusedUIElement"];
    uint64_t v14 = 0;
    unint64_t v5 = [v4 _accessibilityUnignoredDescendant];
    if ((objc_opt_respondsToSelector() & 1) != 0
      && [v4 _axHasMultipleAccessibleChildren:&v14]
      && ([(UIKitWebAccessibilityObjectWrapper *)self safeBoolForKey:@"accessibilityIsDialog"] & 1) == 0
      && (v14 > 4 || !v5))
    {
      id v10 = v4;
    }
    else
    {
      uint64_t v6 = v4;
      if (v4 != v5)
      {
        uint64_t v7 = [v4 _accessibilityUnignoredVisibleDescendant];
        BOOL v8 = v7;
        if (v7)
        {
          id v9 = v7;

          unint64_t v5 = v9;
        }

        uint64_t v6 = v5;
      }
      id v10 = v6;

      if (([v10 accessibilityElementIsFocused] & 1) == 0)
      {
        if ([v10 safeBoolForKey:@"accessibilityIsShowingValidationMessage"]
          && (unint64_t v11 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityTraits],
              ((*MEMORY[0x263F81408] | *MEMORY[0x263F81398]) & v11) != 0))
        {
          id v12 = 0;
          unint64_t v13 = (unsigned int *)MEMORY[0x263F1CE68];
        }
        else
        {
          unint64_t v13 = (unsigned int *)MEMORY[0x263F812F8];
          id v12 = v10;
        }
        [(UIKitWebAccessibilityObjectWrapper *)self _axHandleNotificationPosting:*v13 data:v12];
      }
      unint64_t v5 = v10;
    }
  }
}

- (void)accessibilityOverrideProcessNotification:(id)a3
{
}

- (void)accessibilityOverrideProcessNotification:(id)a3 notificationData:(id)a4
{
  v17[2] = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = AXWebNotificationWithName(a3);
  int v8 = [v7 unsignedIntValue];
  if (v8 > 1025)
  {
    if (v8 <= 3031)
    {
      if (v8 != 1026)
      {
        if (v8 != 1046) {
          goto LABEL_28;
        }
        unint64_t v13 = [NSNumber numberWithInteger:1046];
        [(UIKitWebAccessibilityObjectWrapper *)self performSelectorOnMainThread:sel__repostWebNotification_ withObject:v13 waitUntilDone:0];
LABEL_26:

        goto LABEL_28;
      }
    }
    else if (v8 != 3032 && v8 != 3033)
    {
      if (v8 != 3034) {
        goto LABEL_28;
      }
      id v9 = sel__performLiveRegionUpdate;
      id v10 = self;
      unint64_t v11 = 0;
      goto LABEL_22;
    }
    AXPerformBlockOnMainThread();
    goto LABEL_28;
  }
  if (v8 > 1008)
  {
    if (v8 == 1009)
    {
      uint64_t v14 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityMakeScrollStatus];
      LastScrollDirection = 0;
      [(UIKitWebAccessibilityObjectWrapper *)self performSelectorOnMainThread:sel__performPostScrollStatus_ withObject:v14 waitUntilDone:0];

      goto LABEL_28;
    }
    if (v8 != 1017)
    {
      if (v8 == 1020) {
        AXPerformBlockOnMainThreadAfterDelay();
      }
      goto LABEL_28;
    }
    id v9 = sel__enqueReorderingNotification_;
    unint64_t v11 = &unk_26F493DE0;
    id v10 = self;
LABEL_22:
    [(UIKitWebAccessibilityObjectWrapper *)v10 performSelectorOnMainThread:v9 withObject:v11 waitUntilDone:0];
    goto LABEL_28;
  }
  if (v8 == 1005)
  {
    v16[0] = @"notification";
    unint64_t v13 = [NSNumber numberWithUnsignedInt:*MEMORY[0x263F81438]];
    v16[1] = @"associatedElement";
    v17[0] = v13;
    v17[1] = self;
    unint64_t v15 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
    [(UIKitWebAccessibilityObjectWrapper *)self performSelectorOnMainThread:sel__enqueReorderingNotification_ withObject:v15 waitUntilDone:0];

    goto LABEL_26;
  }
  if (v8 == 1008)
  {
    id v12 = (void *)[[NSString alloc] initWithData:v6 encoding:4];
    if ([v12 length]) {
      UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v12);
    }
  }
LABEL_28:
}

uint64_t __96__UIKitWebAccessibilityObjectWrapper_accessibilityOverrideProcessNotification_notificationData___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _repostFocusChangeNotification];
}

uint64_t __96__UIKitWebAccessibilityObjectWrapper_accessibilityOverrideProcessNotification_notificationData___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _axHandleNotificationPosting:1026 data:*(void *)(a1 + 32)];
}

uint64_t __96__UIKitWebAccessibilityObjectWrapper_accessibilityOverrideProcessNotification_notificationData___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _axHandleNotificationPosting:3032 data:*(void *)(a1 + 32)];
}

uint64_t __96__UIKitWebAccessibilityObjectWrapper_accessibilityOverrideProcessNotification_notificationData___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _axHandleNotificationPosting:3033 data:*(void *)(a1 + 32)];
}

- (CGRect)bounds
{
  double v2 = *MEMORY[0x263F001A8];
  double v3 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v4 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v5 = *(double *)(MEMORY[0x263F001A8] + 24);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

- (unint64_t)_axLinkTrait
{
  return *MEMORY[0x263F1CF10];
}

- (unint64_t)_axVisitedTrait
{
  return *MEMORY[0x263F81420];
}

- (unint64_t)_axHeaderTrait
{
  return *MEMORY[0x263F1CEF8];
}

- (unint64_t)_axWebContentTrait
{
  return *MEMORY[0x263F81428];
}

- (unint64_t)_axSecureTextFieldTrait
{
  return *MEMORY[0x263F813D8];
}

- (unint64_t)_axTextEntryTrait
{
  return *MEMORY[0x263F81408];
}

- (unint64_t)_axHasTextCursorTrait
{
  return *MEMORY[0x263F81398];
}

- (unint64_t)_axTextOperationsAvailableTrait
{
  return *MEMORY[0x263F81410];
}

- (unint64_t)_axImageTrait
{
  return *MEMORY[0x263F1CF00];
}

- (unint64_t)_axTabBarTrait
{
  return *MEMORY[0x263F1CF58];
}

- (unint64_t)_axButtonTrait
{
  return *MEMORY[0x263F1CEE8];
}

- (unint64_t)_axToggleTrait
{
  return *MEMORY[0x263F1CF60];
}

- (unint64_t)_axPopupButtonTrait
{
  return *MEMORY[0x263F813C0];
}

- (unint64_t)_axStaticTextTrait
{
  return *MEMORY[0x263F1CF48];
}

- (unint64_t)_axAdjustableTrait
{
  return *MEMORY[0x263F1CED8];
}

- (unint64_t)_axMenuItemTrait
{
  return *MEMORY[0x263F813B0];
}

- (unint64_t)_axSelectedTrait
{
  return *MEMORY[0x263F1CF38];
}

- (unint64_t)_axNotEnabledTrait
{
  return *MEMORY[0x263F1CF20];
}

- (unint64_t)_axRadioButtonTrait
{
  return *MEMORY[0x263F813C8];
}

- (unint64_t)_axSearchFieldTrait
{
  return *MEMORY[0x263F1CF30];
}

- (unint64_t)_axTextAreaTrait
{
  return *MEMORY[0x263F21B60];
}

- (unint64_t)_axUpdatesFrequentlyTrait
{
  return *MEMORY[0x263F1CF68];
}

- (BOOL)_accessibilityMoveFocusWithHeading:(unint64_t)a3 toElementMatchingQuery:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityWebPageParent];
  int v8 = [v7 safeValueForKey:@"accessibilityFocusedUIElement"];

  id v9 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityNextElementsWithHeading:a3 queryString:v6 startingFrom:v8];
  uint64_t v15 = 0;
  NSUInteger v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  void v12[2] = __96__UIKitWebAccessibilityObjectWrapper__accessibilityMoveFocusWithHeading_toElementMatchingQuery___block_invoke;
  v12[3] = &unk_2650B7EA0;
  v12[4] = self;
  uint64_t v14 = &v15;
  id v10 = v8;
  id v13 = v10;
  [v9 enumerateObjectsUsingBlock:v12];
  LOBYTE(v7) = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return (char)v7;
}

void __96__UIKitWebAccessibilityObjectWrapper__accessibilityMoveFocusWithHeading_toElementMatchingQuery___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  AXPerformSafeBlock();
  uint64_t v7 = [*(id *)(a1 + 32) _accessibilityWebPageParent];
  int v8 = [v7 safeValueForKey:@"accessibilityFocusedUIElement"];

  if (v8)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v8 isEqual:*(void *)(a1 + 40)] ^ 1;
    *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
}

uint64_t __96__UIKitWebAccessibilityObjectWrapper__accessibilityMoveFocusWithHeading_toElementMatchingQuery___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _accessibilitySetFocus:1];
}

- (id)_accessibilityNextElementsWithHeading:(unint64_t)a3 queryString:(id)a4 startingFrom:(id)a5
{
  __int16 v6 = a3;
  v22[5] = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  if ((v6 & 0x330) != 0)
  {
    id v9 = @"AXDirectionNext";
    if ((v6 & 0x110) == 0) {
      id v9 = @"AXDirectionPrevious";
    }
    v21[0] = @"AXDirection";
    v21[1] = @"AXImmediateDescendantsOnly";
    v22[0] = v9;
    v22[1] = MEMORY[0x263EFFA80];
    v21[2] = @"AXResultsLimit";
    v21[3] = @"AXVisibleOnly";
    v22[2] = &unk_26F493C40;
    v22[3] = MEMORY[0x263EFFA80];
    v21[4] = @"AXSearchKey";
    void v22[4] = @"AXKeyboardFocusableSearchKey";
    id v10 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:5];
    unint64_t v11 = (void *)[v10 mutableCopy];

    if ((v6 & 0x30) != 0 && v8) {
      [v11 setObject:v8 forKey:@"AXStartElement"];
    }
    if (v7) {
      [v11 setObject:v7 forKey:@"AXSearchText"];
    }
    uint64_t v15 = 0;
    NSUInteger v16 = &v15;
    uint64_t v17 = 0x3032000000;
    char v18 = __Block_byref_object_copy_;
    objc_super v19 = __Block_byref_object_dispose_;
    id v20 = 0;
    id v14 = v11;
    AXPerformSafeBlock();
    id v12 = (id)v16[5];

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

uint64_t __101__UIKitWebAccessibilityObjectWrapper__accessibilityNextElementsWithHeading_queryString_startingFrom___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) accessibilityFindMatchingObjects:*(void *)(a1 + 40)];

  return MEMORY[0x270F9A758]();
}

- (BOOL)_accessibilityHasNativeFocus
{
  double v2 = self;
  double v3 = [(UIKitWebAccessibilityObjectWrapper *)v2 _accessibilityWebPageParent];
  double v4 = [v3 safeValueForKey:@"accessibilityFocusedUIElement"];

  if (v2)
  {
    do
    {
      char v5 = [v4 isEqual:v2];
      if (v5) {
        break;
      }
      __int16 v6 = [(UIKitWebAccessibilityObjectWrapper *)v2 accessibilityContainer];
      uint64_t v7 = __UIAccessibilitySafeClass();

      double v2 = (UIKitWebAccessibilityObjectWrapper *)v7;
    }
    while (v7);
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)_accessibilitySetNativeFocus
{
  double v2 = self;
  double v3 = [(UIKitWebAccessibilityObjectWrapper *)v2 _accessibilityWebPageParent];
  double v4 = [v3 safeValueForKey:@"accessibilityFocusedUIElement"];

  if (v2)
  {
    char v5 = v2;
    while (1)
    {
      char v6 = [v4 _accessibilityIsDescendantOfElement:v5];
      if (v6)
      {
        id v7 = v5;
        id v12 = v4;
        goto LABEL_12;
      }
      id v7 = v5;
      AXPerformSafeBlock();
      uint64_t v8 = AXRequestingClient();
      BOOL v9 = v8 == 10;
      if (v8 != 10) {
        break;
      }
      id v10 = [(UIKitWebAccessibilityObjectWrapper *)v2 _accessibilityWebPageParent];
      id v12 = [v10 safeValueForKey:@"accessibilityFocusedUIElement"];

      if ([v12 isEqual:v7]) {
        goto LABEL_11;
      }
      unint64_t v11 = [v7 accessibilityContainer];
      char v5 = __UIAccessibilitySafeClass();

      double v4 = v12;
      if (!v5)
      {
        id v7 = 0;
        goto LABEL_12;
      }
    }
    id v12 = v4;
LABEL_11:

    char v6 = v9;
LABEL_12:

    double v4 = v12;
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

uint64_t __66__UIKitWebAccessibilityObjectWrapper__accessibilitySetNativeFocus__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _accessibilitySetFocus:1];
}

- (BOOL)_accessibilityHandlesArrowKeys
{
  return 1;
}

- (BOOL)_axAreChildrenFocused
{
  return MEMORY[0x270F09620](self, &__UIKitWebAccessibilityObjectWrapper___axAreChildrenFocused);
}

- (void)_axSetAreChildrenFocused:(BOOL)a3
{
}

- (NSArray)preferredFocusEnvironments
{
  return (NSArray *)MEMORY[0x263EFFA68];
}

- (UIFocusEnvironment)parentFocusEnvironment
{
  return (UIFocusEnvironment *)[(UIKitWebAccessibilityObjectWrapper *)self _accessibilityFindAncestor:&__block_literal_global_1837 startWithSelf:0];
}

uint64_t __80__UIKitWebAccessibilityObjectWrapper_UIFocusConformance__parentFocusEnvironment__block_invoke(uint64_t a1, void *a2)
{
  return [a2 conformsToProtocol:&unk_26F4950F0];
}

- (NSString)focusGroupIdentifier
{
  v9.receiver = self;
  v9.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
  double v3 = [(UIKitWebAccessibilityObjectWrapper *)&v9 focusGroupIdentifier];
  if (v3
    || ([(UIKitWebAccessibilityObjectWrapper *)self _accessibilityParentView],
        double v4 = objc_claimAutoreleasedReturnValue(),
        [v4 safeValueForKey:@"_containingScrollView"],
        char v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    id v6 = v3;
  }
  else
  {
    id v6 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityDefaultFocusGroupIdentifier];
  }
  id v7 = v6;

  return (NSString *)v7;
}

- (void)setNeedsFocusUpdate
{
  id v3 = [MEMORY[0x263F1C650] focusSystemForEnvironment:self];
  [v3 requestFocusUpdateToEnvironment:self];
  [(UIKitWebAccessibilityObjectWrapper *)self _updateFocusLayerFrame];
}

- (void)updateFocusIfNeeded
{
  id v3 = [MEMORY[0x263F1C650] focusSystemForEnvironment:self];
  [v3 updateFocusIfNeeded];
  [(UIKitWebAccessibilityObjectWrapper *)self _updateFocusLayerFrame];
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  return 1;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __107__UIKitWebAccessibilityObjectWrapper_UIFocusConformance__didUpdateFocusInContext_withAnimationCoordinator___block_invoke;
  v8[3] = &unk_2650B7E30;
  id v9 = v6;
  id v10 = self;
  id v7 = v6;
  [a4 addCoordinatedAnimations:v8 completion:0];
}

uint64_t __107__UIKitWebAccessibilityObjectWrapper_UIFocusConformance__didUpdateFocusInContext_withAnimationCoordinator___block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) nextFocusedItem];
  id v3 = v2;
  if (v2 != *(void **)(a1 + 40))
  {

LABEL_7:
    id v9 = (void *)MEMORY[0x263F1C648];
    uint64_t v10 = *(void *)(a1 + 40);
    return [v9 removeRingFromFocusItem:v10];
  }
  double v4 = [v2 _accessibilityParentView];
  int v5 = [v4 _accessibilityIsFKARunningForFocusItem];

  if (!v5) {
    goto LABEL_7;
  }
  id v6 = (void *)MEMORY[0x263F1C648];
  uint64_t v7 = *(void *)(a1 + 40);

  return [v6 moveRingToFocusItem:v7];
}

- (void)_destroyFocusLayer
{
}

- (void)_updateFocusLayerFrame
{
}

- (BOOL)canBecomeFocused
{
  int v3 = [(UIKitWebAccessibilityObjectWrapper *)self isAccessibilityElement];
  if (v3)
  {
    LOBYTE(v3) = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityRespondsToUserInteraction];
  }
  return v3;
}

- (id)_preferredFocusRegionCoordinateSpace
{
  double v2 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityParentView];
  int v3 = [v2 _screen];
  double v4 = [v3 coordinateSpace];

  return v4;
}

- (id)focusItemsInRect:(CGRect)a3
{
  double v4 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityElements];
  if (v4)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    void v12[2] = __75__UIKitWebAccessibilityObjectWrapper_UIFocusConformance__focusItemsInRect___block_invoke;
    v12[3] = &unk_2650B7EF0;
    v12[4] = self;
    int v5 = [MEMORY[0x263F08A98] predicateWithBlock:v12];
    id v6 = [v4 filteredArrayUsingPredicate:v5];
  }
  else if ([(UIKitWebAccessibilityObjectWrapper *)self accessibilityElementCount] == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[UIKitWebAccessibilityObjectWrapper accessibilityElementCount](self, "accessibilityElementCount"));
    if ([(UIKitWebAccessibilityObjectWrapper *)self accessibilityElementCount])
    {
      unint64_t v7 = 0;
      do
      {
        uint64_t v8 = [(UIKitWebAccessibilityObjectWrapper *)self accessibilityElementAtIndex:v7];
        if ([v8 conformsToProtocol:&unk_26F495440])
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0
            || [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityFKAShouldIncludeViewsAsElements])
          {
            [v6 axSafelyAddObject:v8];
          }
        }

        ++v7;
      }
      while (v7 < [(UIKitWebAccessibilityObjectWrapper *)self accessibilityElementCount]);
    }
  }
  if (v6) {
    id v9 = v6;
  }
  else {
    id v9 = (void *)MEMORY[0x263EFFA68];
  }
  id v10 = v9;

  return v10;
}

uint64_t __75__UIKitWebAccessibilityObjectWrapper_UIFocusConformance__focusItemsInRect___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 conformsToProtocol:&unk_26F495440])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v4 = [*(id *)(a1 + 32) _accessibilityFKAShouldIncludeViewsAsElements];
    }
    else {
      uint64_t v4 = 1;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (BOOL)_prefersFocusContainment
{
  if ([(UIKitWebAccessibilityObjectWrapper *)self conformsToProtocol:&unk_26F49AA98]
    || ([(UIKitWebAccessibilityObjectWrapper *)self _accessibilityIsTouchContainer] & 1) != 0)
  {
    return 1;
  }

  return [(UIKitWebAccessibilityObjectWrapper *)self shouldGroupAccessibilityChildren];
}

- (BOOL)conformsToProtocol:(id)a3
{
  if (&unk_26F495440 == a3 || &unk_26F4950F0 == a3 || &unk_26F4955A0 == a3 || &unk_26F495A90 == a3) {
    return 1;
  }
  v7.receiver = self;
  v7.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
  return -[UIKitWebAccessibilityObjectWrapper conformsToProtocol:](&v7, sel_conformsToProtocol_);
}

- (CGRect)frame
{
  [(UIKitWebAccessibilityObjectWrapper *)self accessibilityFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  unint64_t v11 = [(UIKitWebAccessibilityObjectWrapper *)self coordinateSpace];
  id v12 = [(UIKitWebAccessibilityObjectWrapper *)self _accessibilityWindow];
  id v13 = [v12 coordinateSpace];

  if (v13)
  {
    objc_msgSend(v13, "convertRect:fromCoordinateSpace:", 0, v4, v6, v8, v10);
    objc_msgSend(v11, "convertRect:fromCoordinateSpace:", v13);
    double v4 = v14;
    double v6 = v15;
    double v8 = v16;
    double v10 = v17;
  }

  double v18 = v4;
  double v19 = v6;
  double v20 = v8;
  double v21 = v10;
  result.size.double height = v21;
  result.size.double width = v20;
  result.origin.CGFloat y = v19;
  result.origin.CGFloat x = v18;
  return result;
}

- (void)_accessibilityTextRectsForSpeakThisStringRange:(os_log_t)log string:wantsSentences:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_24049D000, log, OS_LOG_TYPE_DEBUG, "Could not find rects, we are probably on a different page of the book, so returning CGRectZero", v1, 2u);
}

- (void)_accessibilityTextRectsForSpeakThisStringRange:(os_log_t)log string:wantsSentences:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_24049D000, log, OS_LOG_TYPE_DEBUG, "Could not find rects, using entire frame", v1, 2u);
}

- (void)_accessibilityTextRectsForSpeakThisStringRange:string:wantsSentences:.cold.3()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_24049D000, v1, OS_LOG_TYPE_DEBUG, "Found text markers %{public}@ and %{public}@", v2, 0x16u);
}

- (void)_accessibilityScrollToVisible
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  [a1 _accessibilityContentOffset];
  double v6 = NSStringFromCGPoint(v22);
  [a2 accessibilityFrameForScrolling];
  double v7 = NSStringFromCGRect(v24);
  [a1 bounds];
  double v8 = NSStringFromCGRect(v25);
  [a1 contentSize];
  double v9 = NSStringFromCGSize(v23);
  [a1 contentInset];
  double v10 = NSStringFromUIEdgeInsets(v26);
  int v11 = 138544386;
  id v12 = v6;
  __int16 v13 = 2114;
  double v14 = v7;
  __int16 v15 = 2114;
  double v16 = v8;
  __int16 v17 = 2114;
  double v18 = v9;
  __int16 v19 = 2114;
  double v20 = v10;
  _os_log_debug_impl(&dword_24049D000, a3, OS_LOG_TYPE_DEBUG, "This is a web overflow scroll view.  Starting with content offset %{public}@, trying to scroll to %{public}@.  Bounds were %{public}@, content size %{public}@, content inset %{public}@.", (uint8_t *)&v11, 0x34u);
}

void __58__UIKitWebAccessibilityObjectWrapper__misspelledWordRotor__block_invoke_cold_1(void *a1, void *a2)
{
  uint64_t v4 = [a1 firstObject];
  [a2 positionForTextMarker:v4];
  uint64_t v5 = [a1 lastObject];
  [a2 positionForTextMarker:v5];
  double v6 = [a2 stringForTextMarkers:a1];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_24049D000, v7, v8, "textMarkerRange.start = %d, textMarkerRange.end = %d, textMarkerRange.string = %{public}@", v9, v10, v11, v12, 2u);
}

void __58__UIKitWebAccessibilityObjectWrapper__misspelledWordRotor__block_invoke_cold_2(void *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v3[0] = 67109120;
  v3[1] = [a1 count];
  _os_log_error_impl(&dword_24049D000, a2, OS_LOG_TYPE_ERROR, "textMarkerRange.count = %d, should've been 2, returning nil.", (uint8_t *)v3, 8u);
}

- (void)_accessibilityRelayToChrome:object:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_24049D000, v0, OS_LOG_TYPE_ERROR, "Could not encode data: %@", v1, 0xCu);
}

- (void)_accessibilityClippingFrame
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_24049D000, v0, OS_LOG_TYPE_ERROR, "Could not find clipping frame from container: %@", v1, 0xCu);
}

@end