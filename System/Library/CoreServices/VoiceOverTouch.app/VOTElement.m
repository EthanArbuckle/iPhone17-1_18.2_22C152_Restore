@interface VOTElement
+ (VOTElement)elementWithUIElement:(id)a3;
+ (id)_elementWithAXUIElementRef:(__AXUIElement *)a3;
+ (id)_elementWithAXUIElementRef:(__AXUIElement *)a3 cache:(id)a4 identification:(id)a5 initializeAssociatedPids:(BOOL)a6;
+ (id)customPublicRotorDictionaryForRotorId:(id)a3 startRange:(_NSRange)a4 direction:(int64_t)a5;
+ (id)defaultCustomActionCategory;
+ (id)elementAtPointIntercept;
+ (id)inputUIApplication;
+ (id)iosSystemAppApplication;
+ (id)organizedActionsByCategory:(id)a3;
+ (id)systemAppApplication;
+ (id)systemWideElement;
+ (void)initialize;
+ (void)resetInputUIAppElement;
+ (void)resetSystemAppElement;
+ (void)setElementAtPointIntercept:(id)a3;
+ (void)setSystemAppApplication:(id)a3;
- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)nonPersistentUniqueId;
- (AXUIElement)uiElement;
- (BOOL)_attemptPerformActivateActionWithElement:(id)a3;
- (BOOL)_elementActionsEquivalent:(id)a3 withElement:(id)a4;
- (BOOL)_ignoreCustomActionIndicator:(id)a3 withElement:(id)a4;
- (BOOL)_scrollForAction:(int)a3;
- (BOOL)activateDragWithDescriptorDictionary:(id)a3;
- (BOOL)activateIfSupported;
- (BOOL)activateKeyboardReturnKey;
- (BOOL)activatedDirectTouchThatRequiredActivation;
- (BOOL)allowCustomActionHintSpeakOverride;
- (BOOL)allowsActivationWithoutBeingNativeFocused;
- (BOOL)allowsAutoAlternativeCharacterActivation;
- (BOOL)applicationHandleRemoteDownButton;
- (BOOL)applicationHandleRemoteLeftButton;
- (BOOL)applicationHandleRemoteRightButton;
- (BOOL)applicationHandleRemoteUpButton;
- (BOOL)applicationIsRTL;
- (BOOL)applySelectedText:(id)a3 language:(id)a4;
- (BOOL)areMediaLegibilityEventsBeingTapped;
- (BOOL)attemptToShowContextMenuWithTargetPointValue:(id)a3;
- (BOOL)avoidAnnouncingDirectTouchArea;
- (BOOL)brailleTextEntrySupported;
- (BOOL)canBecomeNativeFocused;
- (BOOL)canExpandMathEquation;
- (BOOL)canNavigateMathSegments;
- (BOOL)checkedImmediateRemoteParent;
- (BOOL)checkedRemoteParent;
- (BOOL)containedIn:(unint64_t)a3;
- (BOOL)customPublicRotorIsVisibleInTouchRotor:(id)a3;
- (BOOL)dismissAlternativeKeyboardPicker;
- (BOOL)dispatchKeyboardEvent:(id)a3;
- (BOOL)doesHaveAllTraits:(unint64_t)a3;
- (BOOL)doesHaveTraits:(unint64_t)a3;
- (BOOL)doesHaveTraitsForGesturedTextInput;
- (BOOL)elementActsAsTitleElement:(id)a3;
- (BOOL)elementIsAncestor:(id)a3;
- (BOOL)elementIsDescendant:(id)a3;
- (BOOL)elementOnSameLine:(id)a3;
- (BOOL)elementVisibilityAffectsLayout;
- (BOOL)expandedStatusTogglesOnActivate;
- (BOOL)finishSetupIfAppropriate;
- (BOOL)fullscreenVideoViewIsVisible;
- (BOOL)handlesGestureArea;
- (BOOL)hasBadge;
- (BOOL)hasExplicitColumnInfo;
- (BOOL)hasExplicitRowInfo;
- (BOOL)hasImage;
- (BOOL)hasNativeFocus;
- (BOOL)hasPopup;
- (BOOL)includeDuringContentReading;
- (BOOL)includeRoleDescription;
- (BOOL)includeRoleOnlyForGroupNavigation;
- (BOOL)includeURLLabelInLabel;
- (BOOL)includesTrendlineInSonification;
- (BOOL)includesTrendlineSonification;
- (BOOL)isAccessibilityOpaqueElementProvider;
- (BOOL)isAccessibilitySystemUIServer;
- (BOOL)isAccessibleElement;
- (BOOL)isAccessibleGroup;
- (BOOL)isAlarmRinging;
- (BOOL)isAlive;
- (BOOL)isApplication;
- (BOOL)isAssistiveTouch;
- (BOOL)isAwayAlertItem;
- (BOOL)isAwayAlertItemNew;
- (BOOL)isBannerNotification;
- (BOOL)isCameraIrisOpen;
- (BOOL)isChronod;
- (BOOL)isClipViewService;
- (BOOL)isClockFace;
- (BOOL)isComboBox;
- (BOOL)isContainedByPreferredNativeFocusElement;
- (BOOL)isContainedByVideoElement;
- (BOOL)isDataSeriesElement;
- (BOOL)isDictationListening;
- (BOOL)isEditableTextArea;
- (BOOL)isElementFirstElement:(BOOL)a3 orLastElement:(BOOL)a4 withType:(unint64_t)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFirstItemInDescriptionList;
- (BOOL)isFirstItemInFieldset;
- (BOOL)isFirstItemInLandmark;
- (BOOL)isFirstItemInList;
- (BOOL)isFirstItemInTable;
- (BOOL)isFirstItemInTree;
- (BOOL)isGoogleChrome;
- (BOOL)isHandUI;
- (BOOL)isHeadBoard;
- (BOOL)isHeader;
- (BOOL)isIBooks;
- (BOOL)isInAlert;
- (BOOL)isInAppSwitcher;
- (BOOL)isInDescriptionDefinition;
- (BOOL)isInDescriptionTerm;
- (BOOL)isInFolder;
- (BOOL)isInJindoWindow;
- (BOOL)isInStatusBar;
- (BOOL)isInTableCell;
- (BOOL)isInternationalKeyboardKey;
- (BOOL)isKeyboardActiveOrAttached;
- (BOOL)isKeyboardContinuousPathAvailable;
- (BOOL)isKeyboardContinuousPathTracking;
- (BOOL)isKeyboardEmojiInputMode;
- (BOOL)isLiveCaptionsParagraphView;
- (BOOL)isLiveCaptionsTextView;
- (BOOL)isMail;
- (BOOL)isMapItem;
- (BOOL)isMaps;
- (BOOL)isMobilePhone;
- (BOOL)isPHAssetLocallyAvailable;
- (BOOL)isPineBoard;
- (BOOL)isPressed;
- (BOOL)isQuietModeEnabled;
- (BOOL)isRTL;
- (BOOL)isReadingContent;
- (BOOL)isRemoteElement;
- (BOOL)isRequired;
- (BOOL)isSafari;
- (BOOL)isSafariScribbleActive;
- (BOOL)isSetupBuddy;
- (BOOL)isSiriTalkingOrListening;
- (BOOL)isSoftwareKeyboardActive;
- (BOOL)isSoftwareKeyboardMimic;
- (BOOL)isSpotlight;
- (BOOL)isSpringBoard;
- (BOOL)isStrongPasswordField;
- (BOOL)isSwitch;
- (BOOL)isSystemApp;
- (BOOL)isSystemBatteryLow;
- (BOOL)isSystemLocked;
- (BOOL)isSystemSleeping;
- (BOOL)isSystemWideGestureInProgress;
- (BOOL)isTouchContainer;
- (BOOL)isTourGuideRunning;
- (BOOL)isValid;
- (BOOL)isValidForApplication:(id)a3;
- (BOOL)isVisible;
- (BOOL)isVoiceControlRunning;
- (BOOL)isWesternTextForNonWesternLanguage:(id)a3 language:(id)a4;
- (BOOL)keyboardKeyAllowsTouchTyping;
- (BOOL)lastHitTestNearBorder;
- (BOOL)longPressHostContextId;
- (BOOL)mapsExplorationIsActive;
- (BOOL)mapsExplorationIsPending;
- (BOOL)onlyHasTraits:(unint64_t)a3;
- (BOOL)overridesVoiceOverInstructions;
- (BOOL)performCustomActionWithIdentifier:(id)a3;
- (BOOL)performCustomActionWithIdentifier:(id)a3 data:(id)a4;
- (BOOL)performEscape;
- (BOOL)performScribbleAction;
- (BOOL)performSimpleTap;
- (BOOL)performSimpleTap:(BOOL)a3;
- (BOOL)performSimpleTapAtPoint:(CGPoint)a3 forElement:(id)a4;
- (BOOL)performSimpleTapAtPoint:(CGPoint)a3 withForce:(double)a4 withContextId:(unsigned int)a5 withDelay:(float)a6 forElement:(id)a7;
- (BOOL)performTapAtPoint:(CGPoint)a3 withForce:(double)a4 playSound:(BOOL)a5;
- (BOOL)prefersContextlessPassthrough;
- (BOOL)readingContentCausesPageTurn;
- (BOOL)realtimeElementCompleted;
- (BOOL)realtimeElementUnread;
- (BOOL)remoteParentIsViewHost;
- (BOOL)replaceTextInRange:(_NSRange)a3 withString:(id)a4;
- (BOOL)requiresLaTeXInput;
- (BOOL)retainsCustomRotorActionSetting;
- (BOOL)roadContainsTrackingPoint:(CGPoint)a3;
- (BOOL)savePhotoLabeliCloud:(id)a3;
- (BOOL)scribbleRotorActive;
- (BOOL)scrollNextPage;
- (BOOL)scrollPreviousPage;
- (BOOL)scrollToBottom;
- (BOOL)scrollToTop;
- (BOOL)servesAsHeadingLandmark;
- (BOOL)setNativeFocus;
- (BOOL)shouldAddAlternateActionForLinkElement;
- (BOOL)shouldAnnounceFontInfo;
- (BOOL)shouldAnnounceTableInfo;
- (BOOL)shouldExpandMathEquation;
- (BOOL)shouldIgnoreTextEditingTrait;
- (BOOL)shouldIncludeMediaDescriptionsRotor;
- (BOOL)shouldIncludeRegionDescription;
- (BOOL)shouldIncludeRemoteParentCustomActions;
- (BOOL)shouldIncludeRowRangeInDescription;
- (BOOL)shouldPlaySoundWhenFocused;
- (BOOL)shouldSetNativeFocusWhenBecomingCurrentElement;
- (BOOL)shouldSkipImageTraitDescription;
- (BOOL)shouldSkipValidateElement;
- (BOOL)shouldSpeakExplorerElementsAfterFocus;
- (BOOL)shouldSpeakHelpInGestureArea;
- (BOOL)shouldSpeakMathEquationTrait;
- (BOOL)shouldSpeakScrollStatusOnEntry;
- (BOOL)shouldStartReadAllOnFocus;
- (BOOL)showBulletinBoard:(BOOL)a3;
- (BOOL)showControlCenter:(BOOL)a3;
- (BOOL)showsDualPages;
- (BOOL)softwareKeyboardSupportsGestureKeyboard;
- (BOOL)startStopToggle;
- (BOOL)supportsActivate;
- (BOOL)supportsAudiographActions;
- (BOOL)supportsAudiographs;
- (BOOL)supportsDataSeriesSonification;
- (BOOL)supportsDataSeriesSummarization;
- (BOOL)supportsDirectionOrbManipulation;
- (BOOL)supportsFrameForRange;
- (BOOL)supportsHeaderElementOutput;
- (BOOL)supportsMediaAnalysis;
- (BOOL)supportsPressedState;
- (BOOL)supportsRangeForLineNumber;
- (BOOL)supportsSecondaryActivate;
- (BOOL)supportsTextSelection;
- (BOOL)suppressCustomActionHint;
- (BOOL)tapHostContextId;
- (BOOL)textOperationsAvailable;
- (BOOL)touchContainerShouldOutputBraille;
- (BOOL)useElementAtPositionAfterActivation;
- (BOOL)usingBrailleHardwareKeyboard;
- (BOOL)usingHardwareKeyboard;
- (BOOL)verifyElementExists:(CGPoint *)a3;
- (BOOL)webSearchResultsActive;
- (CGPath)convertPath:(CGPath *)a3 fromContextId:(unsigned int)a4;
- (CGPath)convertPath:(CGPath *)a3 fromContextId:(unsigned int)a4 fromDisplayId:(unsigned int)a5;
- (CGPath)path;
- (CGPoint)centerPoint;
- (CGPoint)centerPointOfScreen;
- (CGPoint)contentOffset;
- (CGPoint)convertPoint:(CGPoint)a3 fromContextId:(unsigned int)a4;
- (CGPoint)convertPoint:(CGPoint)a3 toContextId:(unsigned int)a4;
- (CGPoint)elementFrameLocation:(int)a3;
- (CGPoint)mapsExplorationCurrentLocation;
- (CGPoint)visiblePoint;
- (CGRect)adaptFrameForSystemElement:(CGRect)a3;
- (CGRect)boundsForRange:(_NSRange)a3;
- (CGRect)braille2DRenderRegion;
- (CGRect)convertAccessibilityFrameToScreenCoordinates:(CGRect)a3;
- (CGRect)convertFrame:(CGRect)a3 fromContextId:(unsigned int)a4 fromDisplayId:(unsigned int)a5;
- (CGRect)convertRect:(CGRect)a3 fromContextId:(unsigned int)a4;
- (CGRect)frame;
- (CGRect)frameForDirectInteraction;
- (CGRect)frameForLineNumber:(int64_t)a3;
- (CGRect)frameForRange:(_NSRange)a3;
- (CGRect)gesturePracticeRegion;
- (CGRect)mediaAnalysisFrame;
- (CGRect)textCursorFrame;
- (CGRect)textMarkerFrame:(id)a3;
- (CGRect)visibleFrame;
- (NSArray)headerElements;
- (NSArray)linkedUIElements;
- (NSSet)previousSpokenValueParts;
- (NSString)chartStructureDescription;
- (NSString)definedLabel;
- (NSString)description;
- (NSString)guideElementHeaderText;
- (NSString)label;
- (NSString)supplementalBrailleDescription;
- (NSString)toggleStatusLabel;
- (NSString)userDefinedLabel;
- (NSString)value;
- (NSString)visibleText;
- (NSURL)photoLibraryURL;
- (VOTElement)cachedImmediateRemoteParent;
- (VOTElement)cachedRemoteApplication;
- (VOTElement)cachedRemoteParent;
- (VOTElement)chartElement;
- (VOTElement)elementForGesturedTextInput;
- (VOTElement)initWithAXElement:(__AXUIElement *)a3;
- (VOTElement)initWithPosition:(CGPoint)a3;
- (VOTElement)initWithPosition:(CGPoint)a3 application:(id)a4 contextId:(unsigned int)a5;
- (VOTElement)initWithPosition:(CGPoint)a3 startWithElement:(id)a4;
- (VOTElement)initWithUIElement:(id)a3;
- (VOTElement)initWithUIElement:(id)a3 initializeAssociatedPids:(BOOL)a4;
- (VOTElement)mediaAnalysisElement;
- (VOTElement)nextGuideElement;
- (VOTElement)previousGuideElement;
- (VOTElementSnapshot)snapshot;
- (VOTElementUniqueIdentification)uniqueIdentification;
- (_NSRange)_brailleLineRangeForDescription:(id)a3 position:(unint64_t)a4;
- (_NSRange)characterRangeForPosition:(unint64_t)a3;
- (_NSRange)columnRange;
- (_NSRange)indexPathAsRange;
- (_NSRange)lineRangeForPosition:(unint64_t)a3;
- (_NSRange)rangeForLineNumber:(int64_t)a3;
- (_NSRange)rangeForLineNumberAndColumn:(id)a3;
- (_NSRange)rangeForTextMarker:(id)a3;
- (_NSRange)rowRange;
- (_NSRange)selectedTextRange;
- (_NSRange)textInputElementRange;
- (_NSRange)textMarkerSelectionRange;
- (__AXUIElement)touchContainerAXElement;
- (__AXUIElement)touchContainerParentAXElement;
- (double)absoluteValue;
- (double)dataSeriesMaximumValueForAxis:(int64_t)a3;
- (double)dataSeriesMinimumValueForAxis:(int64_t)a3;
- (double)dataSeriesSonificationPlaybackDuration;
- (double)delayBeforeUpdatingOnActivation;
- (double)maxValue;
- (double)minValue;
- (float)activationDelay;
- (float)distanceToEndOfRoad:(CGPoint)a3 withDirection:(float)a4;
- (float)distanceToOtherRoad:(CGPoint)a3 withDirection:(float)a4 otherRoad:(id)a5;
- (id)_copyMathTextualInformationWithBrailleLineRange:(_NSRange *)a3 brailleDescriptionRange:(_NSRange *)a4 position:(unint64_t)a5 rotorSelection:(id)a6 shouldPreferRotorSelection:(BOOL)a7;
- (id)_elementForAttribute:(int64_t)a3 shouldUpdateCache:(BOOL)a4;
- (id)_elementForAttribute:(int64_t)a3 shouldUpdateCache:(BOOL)a4 shouldFetchAttributes:(BOOL)a5;
- (id)_initWithUIElement:(id)a3 identification:(id)a4 initializeAssociatedPids:(BOOL)a5;
- (id)_languageRangesForText:(id)a3;
- (id)_lastContainedElementIncludingRemotes:(BOOL)a3;
- (id)_mathAXStringFromAttributedString:(id)a3;
- (id)_mathExpression;
- (id)_rawMathEquation;
- (id)_removeBadDeveloperDecisions:(id)a3;
- (id)_resolvedOutputLanguage:(BOOL *)a3;
- (id)_roleDescriptionWithInteractOption:(int64_t)a3 language:(id)a4;
- (id)_selectionStringForSegment:(int64_t)a3;
- (id)_sourceNameForChangeOriginator:(int64_t)a3;
- (id)accessibleAncestor;
- (id)accessibleDescendants;
- (id)activeKeyboard;
- (id)ancestryForTraits:(unint64_t)a3;
- (id)appSwitcherApps;
- (id)application;
- (id)applicationProvidedOCRText;
- (id)arrayForParameterizedAttribute:(int64_t)a3 parameter:(id)a4;
- (id)arrayOfTraitsAsStrings;
- (id)arrayOfTraitsAsStringsWithTraitOrder:(id)a3;
- (id)arrayOfTraitsAsStringsWithTraitOrder:(id)a3 language:(id)a4;
- (id)attachmentFilenameForCID:(id)a3;
- (id)attributedValueForRange:(_NSRange)a3;
- (id)autoSpeakWatchElements;
- (id)braille2DCanvasElement;
- (id)brailleMap;
- (id)bundleIdentifier;
- (id)cachedCustomRotorActions;
- (id)cachedDragCustomActions;
- (id)cachedDropCustomActions;
- (id)cellWithRowIndexPath:(_NSRange)a3 parentView:(id)a4;
- (id)chartDescriptor;
- (id)concatenateLabelsWithLinebreaksBasedOnFrame:(id)a3;
- (id)containerTypes;
- (id)contextDescriptors;
- (id)copyWithCache;
- (id)copyWithZone:(_NSZone *)a3;
- (id)currentHardwareKeyboardLayout;
- (id)currentLocalization;
- (id)currentOpaqueElement;
- (id)currentSoftwareKeyboardLanguage;
- (id)currentSoftwareKeyboardLayout;
- (id)currentStatus;
- (id)customActionGroupIdentifier;
- (id)customContent;
- (id)customPublicRotorForSystemType:(id)a3;
- (id)customPublicRotorName:(id)a3;
- (id)customPublicRotorNames;
- (id)customPublicRotorResultWithItem:(id)a3 startElement:(id)a4;
- (id)customPublicRotors;
- (id)customRotorActions;
- (id)dataDetectorURL:(CGPoint)a3;
- (id)dataSeriesAxesDescription;
- (id)dataSeriesCategoryLabelsForAxis:(int64_t)a3;
- (id)dataSeriesElement;
- (id)dataSeriesGridlinePositionsForAxis:(int64_t)a3;
- (id)dataSeriesName;
- (id)dataSeriesTitleForAxis:(int64_t)a3;
- (id)dataSeriesUnitsLabelForAxis:(int64_t)a3;
- (id)dataSeriesValuesForAxis:(int64_t)a3;
- (id)dataSeriesXAxisValueDescriptionForPosition:(double)a3;
- (id)dataSeriesYAxisValueDescriptionForPosition:(double)a3;
- (id)directParent;
- (id)dragCustomActions;
- (id)dragSourceDescriptorDictionaries;
- (id)dropCustomActions;
- (id)dropPointDescriptorDictionaries;
- (id)elementAtRow:(int64_t)a3 andColumn:(int64_t)a4;
- (id)elementCommunity;
- (id)elementCommunityIdentifier;
- (id)elementForAttribute:(int64_t)a3;
- (id)elementForParameterizedAttribute:(int64_t)a3 parameter:(id)a4;
- (id)elementForTextMarker:(id)a3;
- (id)elementStoredUserLabel;
- (id)elementsForAttribute:(int64_t)a3;
- (id)elementsForAttribute:(int64_t)a3 withParameter:(id)a4;
- (id)elementsInDirection:(int64_t)a3 withCount:(unint64_t)a4;
- (id)equivalenceTag;
- (id)errorMessageElements;
- (id)expandedTextValue;
- (id)explorerElements;
- (id)fbSceneIdentifier;
- (id)firstContainedElement;
- (id)firstElementInApplication;
- (id)firstElementInApplicationForFocus;
- (id)firstElementInApplicationForReadFromTop;
- (id)firstElementInStatusBar;
- (id)firstResponderElement;
- (id)firstResponderElementForFocus;
- (id)firstResponderElementWithoutCache;
- (id)firstVisibleElementInList;
- (id)firstWebElement;
- (id)flowToElements;
- (id)focusModeActivityName;
- (id)focusedApplications;
- (id)formattedDatetime;
- (id)generateCVMLContentForBraille;
- (id)gesturedTextInputAttributes;
- (id)groupedParent;
- (id)headerElementsForColumn:(unint64_t)a3;
- (id)headerElementsForRow:(unint64_t)a3;
- (id)headingLevelValue;
- (id)hint;
- (id)identifier;
- (id)imageAssetLocalIdentifier;
- (id)imageData;
- (id)imageOverlayElements;
- (id)immediateRemoteParent;
- (id)initApplicationWithPid:(int)a3;
- (id)initApplicationWithPosition:(CGPoint)a3;
- (id)instructions;
- (id)invalidStatus;
- (id)isolatedWindow;
- (id)itemChooserName;
- (id)labeledTouchContainer;
- (id)language;
- (id)lastContainedElement;
- (id)lastElementInApplication;
- (id)lastElementInStatusBar;
- (id)launchableApps;
- (id)lineNumberAndColumnForPoint:(CGPoint)a3;
- (id)linkRelationshipType;
- (id)linkedElement;
- (id)localOpaqueParent;
- (id)mapDetailedInformationAtPoint:(CGPoint)a3;
- (id)mapsExplorationChangeVerbosity:(BOOL)a3;
- (id)mapsExplorationCurrentIntersectionDescription;
- (id)mapsExplorationCurrentRoadsWithAngles;
- (id)mathBrailleDescription;
- (id)mathEquationDescription;
- (id)mathSegmentsWithGranularityLevel:(unint64_t)a3;
- (id)mathSummary;
- (id)nativeFocusElement;
- (id)nativeFocusPreferredElement;
- (id)nextContainer;
- (id)nextElement;
- (id)nextTextNavigationElement;
- (id)notificationSummary:(unint64_t)a3;
- (id)objectForRange:(_NSRange)a3 withParameterizedAttribute:(int64_t)a4;
- (id)opaqueElementInDirection:(int64_t)a3 searchType:(int64_t)a4 range:(_NSRange *)a5;
- (id)opaqueElementInDirection:(int64_t)a3 searchType:(int64_t)a4 range:(_NSRange *)a5 peeking:(BOOL)a6 startOpaqueElement:(id)a7;
- (id)opaqueParent;
- (id)originalLabel;
- (id)outermostLocalOpaqueParent;
- (id)pageContent;
- (id)pageTextMarkerRange;
- (id)parentTableOrCollectionView;
- (id)photoDescription;
- (id)popupValue;
- (id)previousContainer;
- (id)previousElement;
- (id)previousTextNavigationElement;
- (id)realtimeElements;
- (id)regionDescriptionWithFrame:(CGRect)a3;
- (id)remoteApplication;
- (id)remoteParent;
- (id)resolvedEditingStyles;
- (id)roleDescription;
- (id)scribbleAreaForSearchPoint:(int64_t)a3;
- (id)scrollStatus;
- (id)sortDirection;
- (id)staticRecognitionText;
- (id)staticTextString;
- (id)statusBarElements;
- (id)stringForLineNumber:(int64_t)a3;
- (id)stringForParameterizedAttribute:(int64_t)a3 parameter:(id)a4;
- (id)stringForTextMarkers:(id)a3;
- (id)summaryElement;
- (id)supportedLanguageIfNecessary;
- (id)tableDimensionStringWithRow:(unint64_t)a3 andColumn:(unint64_t)a4;
- (id)textInputElement;
- (id)textLineEndMarker:(id)a3;
- (id)textLineStartMarker:(id)a3;
- (id)textMarkerArrayOfText:(id)a3;
- (id)textMarkerForPoint:(CGPoint)a3;
- (id)textMarkerRange;
- (id)textMarkerRangeForSelection;
- (id)textMarkersForPoints:(id)a3;
- (id)textMarkersForRange:(_NSRange)a3;
- (id)textNextMarker:(id)a3;
- (id)textOperations;
- (id)textOperationsOperator;
- (id)textPreviousMarker:(id)a3;
- (id)textReplacements;
- (id)textualContext;
- (id)titleElements;
- (id)touchContainer;
- (id)touchContainerParent;
- (id)typingCandidateElements;
- (id)upcomingRoadsAtPoint:(CGPoint)a3 withDirection:(float)a4;
- (id)url;
- (id)urlLabel;
- (id)valueForRange:(_NSRange)a3;
- (id)valueWithUpdate:(BOOL)a3;
- (id)visibleOpaqueElements;
- (id)visionFeatureDescriptionOptions;
- (id)webAreaURL;
- (id)window;
- (id)windowContextIDs;
- (id)windowSceneIdentifier;
- (int)applicationInterfaceOrientation;
- (int)pid;
- (int64_t)_changeOriginatorForSourceName:(id)a3;
- (int64_t)applicationOrientation;
- (int64_t)aspectMask;
- (int64_t)customPublicRotorLinkCountForRotor:(id)a3;
- (int64_t)dataSeriesType;
- (int64_t)differenceAspectMask:(id)a3;
- (int64_t)expandedStatus;
- (int64_t)lineEndPosition;
- (int64_t)lineNumberForPoint:(CGPoint)a3;
- (int64_t)lineStartPosition;
- (int64_t)mapFeatureType;
- (int64_t)overriddenInterpretationForCommand:(int64_t)a3;
- (int64_t)temporaryVoiceOverStatus;
- (int64_t)valueChangeOriginationSource;
- (int64_t)versionedPID;
- (unint64_t)_minimumSegmentDepth;
- (unint64_t)_minimumSegmentDepthForExpression:(id)a3 withMaximumDepth:(unint64_t)a4;
- (unint64_t)ariaColumnCount;
- (unint64_t)ariaColumnIndex;
- (unint64_t)ariaRowCount;
- (unint64_t)ariaRowIndex;
- (unint64_t)blockquoteLevel;
- (unint64_t)columnCount;
- (unint64_t)containerType;
- (unint64_t)directTouchOptions;
- (unint64_t)groupedChildrenCount;
- (unint64_t)hash;
- (unint64_t)notificationCount;
- (unint64_t)rowCount;
- (unint64_t)traits;
- (unsigned)cachedDisplayId;
- (unsigned)displayId;
- (unsigned)mediaAnalysisOptions;
- (unsigned)secureName;
- (unsigned)windowContextId;
- (unsigned)windowContextIdForPress;
- (unsigned)windowContextIdImmediateRemoteParent:(unsigned int)a3;
- (void)_addErrorMessageElement:(id)a3 toRequest:(id)a4;
- (void)_addHeaderElement:(id)a3 toRequest:(id)a4;
- (void)_applyAttributesFromText:(id)a3 toRequest:(id)a4 withLanguage:(id)a5;
- (void)_applyBrailleTextFormattingAndInlineCompletionOptions:(id)a3 attributedString:(id)a4 brailleLineRange:(_NSRange)a5 rangeOffset:(unint64_t)a6;
- (void)_applyCurrentStatus:(id)a3 language:(id)a4;
- (void)_applyCustomContent:(id)a3 language:(id)a4;
- (void)_applyDatetimeAttribute:(id)a3 language:(id)a4;
- (void)_applyExpandedStatus:(id)a3 language:(id)a4;
- (void)_applyHasPopupAttribute:(id)a3 withLanguage:(id)a4;
- (void)_applyHeaderStatus:(id)a3 language:(id)a4;
- (void)_applyInvalidStatus:(id)a3 language:(id)a4;
- (void)_applyLabelToRequest:(id)a3 includeBlockQuote:(BOOL)a4 language:(id)a5 isWebLanguageChoice:(BOOL)a6 interactOption:(int64_t)a7;
- (void)_applyLanguageTokens:(id)a3 attributedString:(id)a4;
- (void)_applyLinkRelationshipType:(id)a3 language:(id)a4;
- (void)_applyRoleDescription:(id)a3 language:(id)a4 interactOption:(int64_t)a5;
- (void)_applySelectedTrait:(id)a3 language:(id)a4;
- (void)_applySortDirection:(id)a3 language:(id)a4;
- (void)_applyStickyCustomActions:(id)a3 customAction:(id)a4 language:(id)a5;
- (void)_applyTableColumnIndex:(id)a3 options:(unint64_t)a4 language:(id)a5;
- (void)_applyTableRowColumnSpan:(id)a3 language:(id)a4;
- (void)_applyTableRowIndex:(id)a3 options:(unint64_t)a4 language:(id)a5;
- (void)_applyTraitsToRequest:(id)a3 options:(unint64_t)a4 numHeaderActions:(unint64_t)a5 language:(id)a6;
- (void)_applyValueToRequest:(id)a3 options:(unint64_t)a4 lastSeenLineAndColumn:(id)a5 language:(id)a6;
- (void)_configureAsSingleLinkElementWithRequest:(id)a3 linkTraitTitle:(id)a4 hint:(id)a5;
- (void)_copyInternalsToElement:(id)a3;
- (void)_iterateSelfAndRemoteParentsUsingBlock:(id)a3;
- (void)_updateFocusForFKA:(BOOL)a3;
- (void)_updateValueChangeOriginatorForApplication:(int64_t)a3;
- (void)addTextualInformationToBrailleLine:(id)a3 forPosition:(unint64_t)a4 rotorSelection:(id)a5 shouldPreferRotorSelection:(BOOL)a6 lineRange:(_NSRange *)a7 descriptionRange:(_NSRange *)a8 lineRangeKnown:(BOOL)a9 isNewTouchContainer:(BOOL)a10 previousElement:(id)a11;
- (void)addTextualInformationToBrailleLine:(id)a3 forPosition:(unint64_t)a4 rotorSelection:(id)a5 shouldPreferRotorSelection:(BOOL)a6 lineRange:(_NSRange *)a7 descriptionRange:(_NSRange *)a8 lineRangeKnown:(BOOL)a9 isNewTouchContainer:(BOOL)a10 previousElement:(id)a11 updateValue:(BOOL)a12 singleLine:(BOOL)a13;
- (void)addTextualInformationToRequest:(id)a3 options:(unint64_t)a4 dataPackage:(id)a5;
- (void)addTitleElementToCache:(id)a3;
- (void)announceAdditionalTextualInformation:(id)a3;
- (void)announceTableInfo:(id)a3 options:(unint64_t)a4 language:(id)a5;
- (void)applyCVMLGeneratedContentToRequest:(id)a3 explicitUserRequest:(BOOL)a4;
- (void)applyGroupChildrenCountToRequest:(id)a3;
- (void)applyHeaderElementsToRequest:(id)a3;
- (void)applyInvalidStatusToRequest:(id)a3;
- (void)applyRowHeadersToRequest:(id)a3;
- (void)applyTableDimension:(id)a3 language:(id)a4;
- (void)applyTextEditingInformation:(id)a3 request:(id)a4 options:(unint64_t)a5;
- (void)clearElementForGesturedTextInput;
- (void)clearSelectedScribbleElement;
- (void)decreaseTrackingDetail;
- (void)decreaseWebSelection:(int64_t)a3;
- (void)decrementAction;
- (void)deleteCharacterAtCursorWithSource:(int64_t)a3;
- (void)expandMathEquation;
- (void)findSearchResult:(BOOL)a3 withSearchText:(id)a4;
- (void)handwritingSendCarriageReturn;
- (void)increaseTrackingDetail;
- (void)increaseWebSelection:(int64_t)a3;
- (void)incrementAction;
- (void)initializeAssociatedPids;
- (void)insertText:(id)a3 source:(int64_t)a4;
- (void)jumpToTableIndex:(id)a3;
- (void)launchAppWithDisplayID:(id)a3;
- (void)mapsExplorationBeginFromCurrentElement:(BOOL)a3;
- (void)mapsExplorationContinueWithVertexIndex:(unint64_t)a3;
- (void)mapsExplorationEnd;
- (void)mapsExplorationRecordTouchpoint:(CGPoint)a3;
- (void)notifyAnnouncementFinishedWithString:(id)a3 didFinishSuccessfully:(BOOL)a4;
- (void)performDoubleTap;
- (void)performTextOperation:(id)a3;
- (void)postFingerDragAtPoint:(CGPoint)a3 withForce:(double)a4 withContextId:(unsigned int)a5;
- (void)postFingerLiftAtPoint:(CGPoint)a3 withContextId:(unsigned int)a4;
- (void)postFingerTouchAtPoint:(CGPoint)a3 withForce:(double)a4 withContextId:(unsigned int)a5;
- (void)postStylusDragAtPoint:(CGPoint)a3 withForce:(double)a4 altitude:(double)a5 azimuth:(double)a6 withContextId:(unsigned int)a7;
- (void)postStylusLiftAtPoint:(CGPoint)a3 withContextId:(unsigned int)a4;
- (void)postStylusTouchAtPoint:(CGPoint)a3 withForce:(double)a4 altitude:(double)a5 azimuth:(double)a6 withContextId:(unsigned int)a7;
- (void)regionDescriptionWithCompletion:(id)a3;
- (void)replaceCharactersAtCursor:(unint64_t)a3 withString:(id)a4 source:(int64_t)a5;
- (void)repostEvent:(id)a3;
- (void)resetAspectMask;
- (void)resetBannerTimer;
- (void)restoreUserPreferencesChangedByHandwriting;
- (void)scrollDownPage;
- (void)scrollLeftPage;
- (void)scrollRectToVisible:(CGRect)a3 withCompletion:(id)a4;
- (void)scrollRightPage;
- (void)scrollToElementForDirectional:(int64_t)a3 withCompletion:(id)a4;
- (void)scrollToPoint:(CGPoint)a3;
- (void)scrollUpPage;
- (void)sendBrightnessEvent:(id)a3;
- (void)sendTouchCancelledEvent;
- (void)sendUserEventOccurred;
- (void)setAccelemoterDisabled:(BOOL)a3;
- (void)setActivatedDirectTouchThatRequiredActivation:(BOOL)a3;
- (void)setAspectMask:(int64_t)a3;
- (void)setCachedDisplayId:(unsigned int)a3;
- (void)setCachedImmediateRemoteParent:(id)a3;
- (void)setCachedRemoteApplication:(id)a3;
- (void)setCachedRemoteParent:(id)a3;
- (void)setCheckedImmediateRemoteParent:(BOOL)a3;
- (void)setCheckedRemoteParent:(BOOL)a3;
- (void)setContentOffset:(CGPoint)a3;
- (void)setCurrentWordContextForBook:(id)a3;
- (void)setDefinedLabel:(id)a3;
- (void)setDeviceOrientation:(int64_t)a3;
- (void)setElementForGesturedTextInput:(id)a3;
- (void)setEventCaptureMode:(int)a3;
- (void)setFirstResponder:(id)a3;
- (void)setGesturePracticeInfo:(id)a3;
- (void)setIsFirstItemInDescriptionList:(BOOL)a3;
- (void)setIsFirstItemInFieldset:(BOOL)a3;
- (void)setIsFirstItemInLandmark:(BOOL)a3;
- (void)setIsFirstItemInList:(BOOL)a3;
- (void)setIsFirstItemInTable:(BOOL)a3;
- (void)setIsFirstItemInTree:(BOOL)a3;
- (void)setNavigationDirectionMode:(int64_t)a3;
- (void)setPreviousSpokenValueParts:(id)a3;
- (void)setRotationCapabilityEnabled:(BOOL)a3;
- (void)setSelectedTextRange:(_NSRange)a3 refreshBraille:(BOOL)a4;
- (void)setSelectedTextRange:(_NSRange)a3 refreshBraille:(BOOL)a4 isVoiceOverSelectionMovement:(BOOL)a5;
- (void)setSelectionToTextMarker:(id)a3;
- (void)setShouldSkipValidateElement:(BOOL)a3;
- (void)setSupplementalBrailleDescription:(id)a3;
- (void)setTemporaryVoiceOverStatus:(int64_t)a3;
- (void)setUserDefinedLabel:(id)a3;
- (void)setVoiceOverFocused:(BOOL)a3;
- (void)showEditingHUD;
- (void)unsetEventCaptureMode:(int)a3;
- (void)updateCache;
- (void)updateCenterPoint;
- (void)updateCustomPublicRotors;
- (void)updateEquivalenceTag;
- (void)updateExpandedStatus;
- (void)updateFlowToElements;
- (void)updateFocusActiveActivityDisplayName;
- (void)updateFrame;
- (void)updateGesturedTextInputAttributes;
- (void)updateHint;
- (void)updateIsVisible;
- (void)updateLabel;
- (void)updateLanguage;
- (void)updatePageContent;
- (void)updatePaths;
- (void)updateRTL;
- (void)updateRoleDescription;
- (void)updateTitleElements;
- (void)updateTouchForceSounds:(double)a3;
- (void)updateTraits;
- (void)updateValue;
- (void)updateVisiblePoint;
- (void)updateWindowContextId;
- (void)zoomInAtLocation:(CGPoint)a3;
- (void)zoomOutAtLocation:(CGPoint)a3;
@end

@implementation VOTElement

+ (void)initialize
{
  if (qword_1001EB6F0 != -1) {
    dispatch_once(&qword_1001EB6F0, &stru_1001B35F0);
  }
}

+ (id)systemWideElement
{
  if (![(id)VOTSharedWorkspace inUnitTestMode])
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100014BAC;
    block[3] = &unk_1001B3580;
    block[4] = a1;
    if (qword_1001EB700 == -1) {
      goto LABEL_5;
    }
    v5 = &qword_1001EB700;
    v6 = (Block_layout *)block;
    goto LABEL_10;
  }
  if (qword_1001EB6F8 != -1)
  {
    v5 = &qword_1001EB6F8;
    v6 = &stru_1001B3610;
LABEL_10:
    dispatch_once(v5, v6);
  }
LABEL_5:
  v3 = (void *)qword_1001EB6C8;

  return v3;
}

+ (void)setSystemAppApplication:(id)a3
{
}

+ (id)systemAppApplication
{
  if ([(id)VOTSharedWorkspace inUnitTestMode])
  {
    v2 = &qword_1001EB708;
  }
  else
  {
    if (AXDeviceIsAudioAccessory())
    {
      id v3 = 0;
      goto LABEL_13;
    }
    [(id)qword_1001EB6E0 lock];
    if (!qword_1001EB6D0 && (AXInPreboardScenario() & 1) == 0 && (AXInCheckerBoardScenario() & 1) == 0)
    {
      v4 = +[VOTElement systemWideElement];
      v5 = [v4 uiElement];

      v6 = [v5 uiElementsWithAttribute:1001];
      v7 = [v6 lastObject];

      uint64_t v8 = +[VOTElement elementWithUIElement:v7];
      v9 = (void *)qword_1001EB6D0;
      qword_1001EB6D0 = v8;

      v10 = [(id)qword_1001EB6D0 uiElement];
      id v11 = [v10 axElement];

      if (v11) {
        AXUIElementRegisterForApplicationDeath();
      }
    }
    [(id)qword_1001EB6E0 unlock];
    v2 = &qword_1001EB6D0;
  }
  id v3 = (id)*v2;
LABEL_13:

  return v3;
}

+ (id)inputUIApplication
{
  [(id)qword_1001EB6E8 lock];
  if ((!qword_1001EB6D8 || ([(id)qword_1001EB6D8 isValid] & 1) == 0)
    && (AXInPreboardScenario() & 1) == 0
    && (AXInCheckerBoardScenario() & 1) == 0)
  {
    v2 = +[VOTElement systemWideElement];
    id v3 = [v2 uiElement];

    v4 = [v3 uiElementsWithAttribute:1011];
    v5 = [v4 lastObject];

    uint64_t v6 = +[VOTElement elementWithUIElement:v5];
    v7 = (void *)qword_1001EB6D8;
    qword_1001EB6D8 = v6;

    uint64_t v8 = [(id)qword_1001EB6D8 uiElement];
    id v9 = [v8 axElement];

    if (v9) {
      AXUIElementRegisterForApplicationDeath();
    }
  }
  [(id)qword_1001EB6E8 unlock];
  v10 = (void *)qword_1001EB6D8;

  return v10;
}

+ (id)iosSystemAppApplication
{
  if ([(id)VOTSharedWorkspace inUnitTestMode])
  {
    id v3 = (id)qword_1001EB708;
  }
  else
  {
    id v3 = [a1 systemAppApplication];
  }

  return v3;
}

+ (void)resetSystemAppElement
{
  [(id)qword_1001EB6E0 lock];
  v2 = (void *)qword_1001EB6D0;
  qword_1001EB6D0 = 0;

  id v3 = (void *)qword_1001EB6E0;

  [v3 unlock];
}

+ (void)resetInputUIAppElement
{
  [(id)qword_1001EB6E8 lock];
  v2 = (void *)qword_1001EB6D8;
  qword_1001EB6D8 = 0;

  id v3 = (void *)qword_1001EB6E8;

  [v3 unlock];
}

+ (VOTElement)elementWithUIElement:(id)a3
{
  id v4 = a3;
  id v5 = [objc_allocWithZone((Class)a1) initWithUIElement:v4];

  return (VOTElement *)v5;
}

+ (id)_elementWithAXUIElementRef:(__AXUIElement *)a3 cache:(id)a4 identification:(id)a5 initializeAssociatedPids:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = objc_allocWithZone((Class)a1);
  v13 = +[AXUIElement uiElementWithAXElement:a3 cache:v11];

  id v14 = [v12 _initWithUIElement:v13 identification:v10 initializeAssociatedPids:v6];

  return v14;
}

+ (id)_elementWithAXUIElementRef:(__AXUIElement *)a3
{
  id v4 = +[AXUIElement uiElementWithAXElement:a3];
  id v5 = [a1 elementWithUIElement:v4];

  return v5;
}

+ (id)elementAtPointIntercept
{
  id v2 = objc_retainBlock((id)qword_1001EB710);

  return v2;
}

+ (void)setElementAtPointIntercept:(id)a3
{
  qword_1001EB710 = (uint64_t)objc_retainBlock(a3);

  _objc_release_x1();
}

- (id)initApplicationWithPid:(int)a3
{
  id v4 = +[AXUIElement uiApplicationWithPid:*(void *)&a3];
  id v5 = [(VOTElement *)self initWithUIElement:v4];

  return v5;
}

- (id)initApplicationWithPosition:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if ([(id)VOTSharedWorkspace inUnitTestMode])
  {
    BOOL v6 = 0;
  }
  else
  {
    v7 = +[AXUIElement uiApplicationAtCoordinate:](AXUIElement, "uiApplicationAtCoordinate:", x, y);
    self = [(VOTElement *)self initWithUIElement:v7];

    BOOL v6 = self;
  }

  return v6;
}

- (VOTElement)initWithAXElement:(__AXUIElement *)a3
{
  id v4 = +[AXUIElement uiElementWithAXElement:a3];
  id v5 = [(VOTElement *)self initWithUIElement:v4];

  return v5;
}

- (VOTElement)initWithUIElement:(id)a3
{
  return [(VOTElement *)self initWithUIElement:a3 initializeAssociatedPids:1];
}

- (VOTElement)initWithUIElement:(id)a3 initializeAssociatedPids:(BOOL)a4
{
  return (VOTElement *)[(VOTElement *)self _initWithUIElement:a3 identification:0 initializeAssociatedPids:a4];
}

- (id)_initWithUIElement:(id)a3 identification:(id)a4 initializeAssociatedPids:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)VOTElement;
  id v11 = [(VOTElement *)&v15 init];
  id v12 = v11;
  v13 = 0;
  if (v9 && v11)
  {
    objc_storeStrong((id *)&v11->_uiElement, a3);
    v12->_lastOrbSoundLevel = 0;
    v12->_aspectMask = 31;
    if (![(VOTElement *)v12 isApplication]) {
      objc_storeStrong((id *)&v12->_uniqueIdentification, a4);
    }
    if (v5) {
      [(VOTElement *)v12 initializeAssociatedPids];
    }
    v13 = v12;
  }

  return v13;
}

- (void)initializeAssociatedPids
{
  if (![(VOTElement *)self isApplication])
  {
    [(VOTElement *)self pid];
    if (!_AXIsPidAssociated())
    {
      id v3 = [(VOTElement *)self application];
      [v3 pid];
      _AXAddAssociatedPid();
    }
  }
}

- (VOTElement)initWithPosition:(CGPoint)a3 startWithElement:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  v7 = [a4 uiElement];
  uint64_t v8 = +[AXUIElement uiElementAtCoordinate:startWithElement:](AXUIElement, "uiElementAtCoordinate:startWithElement:", v7, x, y);

  id v9 = [(VOTElement *)self initWithUIElement:v8];
  return v9;
}

- (VOTElement)initWithPosition:(CGPoint)a3 application:(id)a4 contextId:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  double y = a3.y;
  double x = a3.x;
  id v9 = [a4 uiElement];
  id v10 = +[AXUIElement uiElementAtCoordinate:forApplication:contextId:](AXUIElement, "uiElementAtCoordinate:forApplication:contextId:", [v9 axElement], v5, x, y);

  id v11 = [(VOTElement *)self initWithUIElement:v10];
  return v11;
}

- (VOTElement)initWithPosition:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (![(id)VOTSharedWorkspace inUnitTestMode])
  {
    +[AXUIElement uiElementAtCoordinate:](AXUIElement, "uiElementAtCoordinate:", x, y);
    v7 = (void (**)(double, double))objc_claimAutoreleasedReturnValue();
    if (v7) {
      goto LABEL_5;
    }
    id v10 = +[AXBackBoardServer server];
    id v11 = objc_msgSend(v10, "contextIdForPosition:", x, y);

    id v12 = +[AXBackBoardServer server];
    id v13 = [v12 contextIdHostingContextId:v11];

    if (v13)
    {
      id v14 = +[AXUIElement uiApplicationForContext:v13];
      +[AXUIElement uiElementAtCoordinate:forApplication:contextId:](AXUIElement, "uiElementAtCoordinate:forApplication:contextId:", [v14 axElement], v13, x, y);
      v7 = (void (**)(double, double))objc_claimAutoreleasedReturnValue();

      if (v7)
      {
LABEL_5:
        uint64_t v8 = [(VOTElement *)self initWithUIElement:v7];
        self = v8;
        goto LABEL_6;
      }
    }
LABEL_9:
    id v9 = 0;
    goto LABEL_10;
  }
  BOOL v6 = +[VOTElement elementAtPointIntercept];

  if (!v6) {
    goto LABEL_9;
  }
  v7 = +[VOTElement elementAtPointIntercept];
  v7[2](x, y);
  uint64_t v8 = (VOTElement *)objc_claimAutoreleasedReturnValue();
LABEL_6:
  id v9 = v8;

LABEL_10:
  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (objc_msgSend((id)VOTSharedWorkspace, "inUnitTestMode", a3)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v4 = +[VOTElement elementWithUIElement:self->_uiElement];
  }
  else
  {
    id v5 = [(UIElementProtocol *)self->_uiElement axElement];
    BOOL v6 = [(VOTElement *)self uniqueIdentification];
    id v4 = +[VOTElement _elementWithAXUIElementRef:v5 cache:0 identification:v6 initializeAssociatedPids:0];
  }
  [(VOTElement *)self _copyInternalsToElement:v4];
  return v4;
}

- (id)copyWithCache
{
  id v3 = [(UIElementProtocol *)self->_uiElement copyCachedAttributes];
  if ([(id)VOTSharedWorkspace inUnitTestMode]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v4 = [(UIElementProtocol *)self->_uiElement copyWithZone:0];
    [v4 setAttributes:v3];
    uint64_t v5 = +[VOTElement elementWithUIElement:v4];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v7 = 0;
      goto LABEL_8;
    }
    id v6 = [(UIElementProtocol *)self->_uiElement axElement];
    id v4 = [(VOTElement *)self uniqueIdentification];
    uint64_t v5 = +[VOTElement _elementWithAXUIElementRef:v6 cache:v3 identification:v4 initializeAssociatedPids:0];
  }
  v7 = (void *)v5;

LABEL_8:
  [(VOTElement *)self _copyInternalsToElement:v7];

  return v7;
}

- (void)_copyInternalsToElement:(id)a3
{
  id v10 = a3;
  objc_msgSend(v10, "setCachedDisplayId:", -[VOTElement cachedDisplayId](self, "cachedDisplayId"));
  id v4 = [(VOTElement *)self definedLabel];
  id v5 = [v4 copy];
  [v10 setDefinedLabel:v5];

  id v6 = [(VOTElement *)self userDefinedLabel];
  id v7 = [v6 copy];
  [v10 setUserDefinedLabel:v7];

  objc_msgSend(v10, "setIsFirstItemInList:", -[VOTElement isFirstItemInList](self, "isFirstItemInList"));
  objc_msgSend(v10, "setIsFirstItemInTable:", -[VOTElement isFirstItemInTable](self, "isFirstItemInTable"));
  objc_msgSend(v10, "setIsFirstItemInLandmark:", -[VOTElement isFirstItemInLandmark](self, "isFirstItemInLandmark"));
  objc_msgSend(v10, "setIsFirstItemInFieldset:", -[VOTElement isFirstItemInFieldset](self, "isFirstItemInFieldset"));
  objc_msgSend(v10, "setIsFirstItemInTree:", -[VOTElement isFirstItemInTree](self, "isFirstItemInTree"));
  objc_msgSend(v10, "setIsFirstItemInDescriptionList:", -[VOTElement isFirstItemInDescriptionList](self, "isFirstItemInDescriptionList"));
  objc_msgSend(v10, "setActivatedDirectTouchThatRequiredActivation:", -[VOTElement activatedDirectTouchThatRequiredActivation](self, "activatedDirectTouchThatRequiredActivation"));
  elementForGesturedTextInput = self->_elementForGesturedTextInput;
  if (elementForGesturedTextInput != self)
  {
    id v9 = [(VOTElement *)elementForGesturedTextInput copyWithCache];
    [v10 setElementForGesturedTextInput:v9];
  }
}

- (int)pid
{
  return [(UIElementProtocol *)self->_uiElement pid];
}

- (BOOL)isValid
{
  return [(UIElementProtocol *)self->_uiElement isValid];
}

- (BOOL)isAlive
{
  [(UIElementProtocol *)self->_uiElement updateCache:2088];
  uiElement = self->_uiElement;

  return [(UIElementProtocol *)uiElement BOOLWithAXAttribute:2088];
}

- (BOOL)isValidForApplication:(id)a3
{
  uiElement = self->_uiElement;
  id v4 = [a3 uiElement];
  LOBYTE(uiElement) = [(UIElementProtocol *)uiElement isValidForApplication:v4];

  return (char)uiElement;
}

- (AXUIElement)uiElement
{
  return self->_uiElement;
}

- (id)language
{
  return [(UIElementProtocol *)self->_uiElement stringWithAXAttribute:2008];
}

- (void)updateRTL
{
}

- (void)setNavigationDirectionMode:(int64_t)a3
{
  uiElement = self->_uiElement;
  id v4 = +[NSNumber numberWithInteger:a3];
  [(UIElementProtocol *)uiElement setAXAttribute:3026 withNumber:v4];
}

- (BOOL)isRTL
{
  return [(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:3026];
}

- (BOOL)applicationIsRTL
{
  return [(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:3066];
}

- (CGPoint)centerPoint
{
  [(UIElementProtocol *)self->_uiElement pointWithAXAttribute:2007];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (CGPoint)visiblePoint
{
  [(UIElementProtocol *)self->_uiElement pointWithAXAttribute:2062];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (BOOL)containedIn:(unint64_t)a3
{
  id v4 = [(VOTElement *)self containerTypes];
  id v5 = +[NSNumber numberWithUnsignedLong:a3];
  unsigned __int8 v6 = [v4 containsObject:v5];

  return v6;
}

- (BOOL)tapHostContextId
{
  return [(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:2234];
}

- (BOOL)longPressHostContextId
{
  return [(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:2235];
}

- (id)containerTypes
{
  if (sub_100050E5C())
  {
    double v3 = [(UIElementProtocol *)self->_uiElement arrayWithAXAttribute:2145];
  }
  else
  {
    double v3 = &__NSArray0__struct;
  }

  return v3;
}

- (unint64_t)containerType
{
  double v2 = [(UIElementProtocol *)self->_uiElement numberWithAXAttribute:2187];
  id v3 = [v2 integerValue];

  return (unint64_t)v3;
}

- (id)formattedDatetime
{
  double v2 = [(UIElementProtocol *)self->_uiElement stringWithAXAttribute:2170];
  if (v2)
  {
    id v3 = +[SCRCWebDateTimeParser sharedInstance];
    id v4 = [v3 spokenStringForDateTimeAttribute:v2];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)supportedLanguageIfNecessary
{
  id v3 = [(id)VOTSharedWorkspace systemSpokenLanguage];

  if (v3)
  {
    id v4 = objc_getAssociatedObject(self, &unk_1001EB718);
    id v5 = v4;
    if (v4)
    {
      if ([v4 length]) {
        unsigned __int8 v6 = v5;
      }
      else {
        unsigned __int8 v6 = 0;
      }
      id v7 = v6;
    }
    else
    {
      uint64_t v8 = [(UIElementProtocol *)self->_uiElement arrayWithAXAttribute:3014];
      if ([v8 count])
      {
        id v9 = [(id)VOTSharedWorkspace systemSpokenLanguage];
        id v10 = [v9 lowercaseString];

        if ([v10 length])
        {
          id v11 = [v10 rangeOfString:@"-"];
          if (v11 != (id)0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v12 = [v10 substringToIndex:v11];

            id v10 = (void *)v12;
          }
          long long v25 = 0u;
          long long v26 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          id v13 = v8;
          id v14 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
          if (v14)
          {
            id v15 = v14;
            uint64_t v16 = *(void *)v24;
            while (2)
            {
              for (i = 0; i != v15; i = (char *)i + 1)
              {
                if (*(void *)v24 != v16) {
                  objc_enumerationMutation(v13);
                }
                v18 = *(void **)(*((void *)&v23 + 1) + 8 * i);
                AXLanguageConvertToCanonicalForm();
                id v19 = (id)objc_claimAutoreleasedReturnValue();
                if (!v19) {
                  id v19 = v18;
                }
                unsigned __int8 v20 = objc_msgSend(v19, "hasPrefix:", v10, (void)v23);

                if (v20)
                {
                  id v7 = 0;
                  goto LABEL_26;
                }
              }
              id v15 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
              if (v15) {
                continue;
              }
              break;
            }
          }
        }
        objc_msgSend(v8, "objectAtIndex:", 0, (void)v23);
        id v13 = (id)objc_claimAutoreleasedReturnValue();
        AXLanguageConvertToCanonicalForm();
        id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_26:
      }
      else
      {
        id v7 = 0;
      }
      if (v7) {
        v21 = v7;
      }
      else {
        v21 = &stru_1001B7888;
      }
      objc_setAssociatedObject(self, &unk_1001EB718, v21, (void *)1);
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (BOOL)isRemoteElement
{
  return [(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:2046];
}

- (CGRect)frame
{
  [(UIElementProtocol *)self->_uiElement rectWithAXAttribute:2003];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (CGRect)visibleFrame
{
  [(UIElementProtocol *)self->_uiElement rectWithAXAttribute:2057];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (CGPath)path
{
  return (CGPath *)[(UIElementProtocol *)self->_uiElement pathWithAXAttribute:2042];
}

- (unsigned)displayId
{
  if ([(VOTElement *)self cachedDisplayId])
  {
    return [(VOTElement *)self cachedDisplayId];
  }
  else
  {
    double v4 = [(UIElementProtocol *)self->_uiElement numberWithAXAttribute:2123];
    id v5 = [v4 unsignedIntValue];

    if (!v5)
    {
      unsigned __int8 v6 = [(VOTElement *)self immediateRemoteParent];
      id v7 = v6;
      if (v6)
      {
        uint64_t v8 = [v6 uiElement];
        id v9 = [v8 numberWithAXAttribute:2123];
        id v5 = [v9 unsignedIntValue];
      }
      else
      {
        id v5 = 0;
      }
    }
    [(VOTElement *)self setCachedDisplayId:v5];
    return v5;
  }
}

- (void)updateWindowContextId
{
}

- (unsigned)windowContextId
{
  double v3 = [(UIElementProtocol *)self->_uiElement numberWithAXAttribute:2021];
  unsigned int v4 = [v3 unsignedIntValue];

  if (!v4)
  {
    id v5 = [(VOTElement *)self immediateRemoteParent];
    unsigned __int8 v6 = v5;
    if (v5)
    {
      id v7 = [v5 uiElement];
      uint64_t v8 = [v7 numberWithAXAttribute:2021];
      unsigned int v4 = [v8 unsignedIntValue];
    }
    else
    {
      unsigned int v4 = 0;
    }
  }
  return v4;
}

- (unsigned)windowContextIdForPress
{
  double v3 = [(UIElementProtocol *)self->_uiElement numberWithAXAttribute:2021];
  id v4 = [v3 unsignedIntValue];

  if (v4
    && ![(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:2224])
  {
    return v4;
  }

  return [(VOTElement *)self windowContextIdImmediateRemoteParent:v4];
}

- (unsigned)windowContextIdImmediateRemoteParent:(unsigned int)a3
{
  id v4 = [(VOTElement *)self immediateRemoteParent];
  id v5 = v4;
  if (v4)
  {
    unsigned __int8 v6 = [v4 uiElement];
    id v7 = [v6 numberWithAXAttribute:2021];
    a3 = [v7 unsignedIntValue];
  }
  return a3;
}

- (id)fbSceneIdentifier
{
  double v3 = [(UIElementProtocol *)self->_uiElement stringWithAXAttribute:2721];
  if (!v3)
  {
    id v4 = [(VOTElement *)self immediateRemoteParent];
    id v5 = v4;
    if (v4)
    {
      unsigned __int8 v6 = [v4 uiElement];
      double v3 = [v6 stringWithAXAttribute:2721];
    }
    else
    {
      double v3 = 0;
    }
  }

  return v3;
}

- (void)updateIsVisible
{
}

- (BOOL)isVisible
{
  return [(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:2025];
}

- (int64_t)expandedStatus
{
  double v2 = [(UIElementProtocol *)self->_uiElement numberWithAXAttribute:2114];
  int64_t v3 = (int)[v2 intValue];

  return v3;
}

- (BOOL)expandedStatusTogglesOnActivate
{
  return [(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:2214];
}

- (id)contextDescriptors
{
  return [(UIElementProtocol *)self->_uiElement arrayWithAXAttribute:2125];
}

- (BOOL)isRequired
{
  return [(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:2029];
}

- (BOOL)hasPopup
{
  return [(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:2200];
}

- (id)popupValue
{
  return [(UIElementProtocol *)self->_uiElement stringWithAXAttribute:2201];
}

- (id)invalidStatus
{
  return [(UIElementProtocol *)self->_uiElement stringWithAXAttribute:2045];
}

- (id)currentStatus
{
  return [(UIElementProtocol *)self->_uiElement stringWithAXAttribute:2116];
}

- (id)sortDirection
{
  return [(UIElementProtocol *)self->_uiElement stringWithAXAttribute:2152];
}

- (unint64_t)rowCount
{
  double v2 = [(UIElementProtocol *)self->_uiElement numberWithAXAttribute:2121];
  id v3 = [v2 unsignedIntegerValue];

  return (unint64_t)v3;
}

- (unint64_t)columnCount
{
  double v2 = [(UIElementProtocol *)self->_uiElement numberWithAXAttribute:2122];
  id v3 = [v2 unsignedIntegerValue];

  return (unint64_t)v3;
}

- (unint64_t)ariaRowCount
{
  double v2 = [(UIElementProtocol *)self->_uiElement numberWithAXAttribute:2119];
  id v3 = [v2 unsignedIntegerValue];

  return (unint64_t)v3;
}

- (unint64_t)ariaColumnCount
{
  double v2 = [(UIElementProtocol *)self->_uiElement numberWithAXAttribute:2120];
  id v3 = [v2 unsignedIntegerValue];

  return (unint64_t)v3;
}

- (unint64_t)ariaRowIndex
{
  double v2 = [(UIElementProtocol *)self->_uiElement numberWithAXAttribute:2117];
  id v3 = [v2 unsignedIntegerValue];

  return (unint64_t)v3;
}

- (unint64_t)ariaColumnIndex
{
  double v2 = [(UIElementProtocol *)self->_uiElement numberWithAXAttribute:2118];
  id v3 = [v2 unsignedIntegerValue];

  return (unint64_t)v3;
}

- (CGRect)textCursorFrame
{
  [(UIElementProtocol *)self->_uiElement updateCache:2050];
  uiElement = self->_uiElement;

  [(UIElementProtocol *)uiElement rectWithAXAttribute:2050];
  result.size.height = v7;
  result.size.width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

- (BOOL)isComboBox
{
  return [(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:2030];
}

- (BOOL)isInDescriptionTerm
{
  return [(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:2212];
}

- (BOOL)isInDescriptionDefinition
{
  return [(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:2213];
}

- (BOOL)isInTableCell
{
  return [(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:2034];
}

- (BOOL)dismissAlternativeKeyboardPicker
{
  return [(UIElementProtocol *)self->_uiElement performAXAction:2035];
}

- (BOOL)keyboardKeyAllowsTouchTyping
{
  if ([(VOTElement *)self doesHaveTraits:kAXKeyboardKeyTrait]
    && ![(VOTElement *)self doesHaveTraits:kAXButtonTrait])
  {
    return 1;
  }
  uiElement = self->_uiElement;

  return [(UIElementProtocol *)uiElement BOOLWithAXAttribute:2059];
}

- (BOOL)overridesVoiceOverInstructions
{
  return [(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:2069];
}

- (BOOL)elementVisibilityAffectsLayout
{
  return [(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:2075];
}

- (CGRect)frameForDirectInteraction
{
  [(UIElementProtocol *)self->_uiElement rectWithAXAttribute:2130];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (double)delayBeforeUpdatingOnActivation
{
  double v2 = [(UIElementProtocol *)self->_uiElement numberWithAXAttribute:2068];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (BOOL)useElementAtPositionAfterActivation
{
  return [(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:2190];
}

- (BOOL)isStrongPasswordField
{
  return [(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:2191];
}

- (id)directParent
{
  return [(VOTElement *)self _elementForAttribute:5002 shouldUpdateCache:0];
}

- (id)windowSceneIdentifier
{
  return [(UIElementProtocol *)self->_uiElement stringWithAXAttribute:3056];
}

- (id)window
{
  return [(VOTElement *)self _elementForAttribute:3055 shouldUpdateCache:0];
}

- (id)opaqueParent
{
  uint64_t v5 = 0;
  double v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = sub_1000167B0;
  id v9 = sub_1000167C0;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000167C8;
  v4[3] = &unk_1001B3678;
  v4[4] = &v5;
  [(VOTElement *)self _iterateSelfAndRemoteParentsUsingBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (id)outermostLocalOpaqueParent
{
  uint64_t v2 = [(VOTElement *)self localOpaqueParent];
  if (v2)
  {
    double v3 = (void *)v2;
    double v4 = 0;
    do
    {
      id v5 = v3;

      double v3 = [v5 localOpaqueParent];

      double v4 = v5;
    }
    while (v3);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)localOpaqueParent
{
  return [(VOTElement *)self _elementForAttribute:2066 shouldUpdateCache:0];
}

- (BOOL)isAccessibilityOpaqueElementProvider
{
  return [(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:2065];
}

- (id)visibleOpaqueElements
{
  return [(VOTElement *)self elementsForAttribute:2113];
}

- (id)currentOpaqueElement
{
  return [(VOTElement *)self elementForParameterizedAttribute:95226 parameter:@"UIAccessibilityNotificationVoiceOverIdentifier"];
}

- (BOOL)isAwayAlertItem
{
  return [(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:2039];
}

- (BOOL)isAwayAlertItemNew
{
  return [(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:2040];
}

- (BOOL)isBannerNotification
{
  return [(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:2207];
}

- (void)resetBannerTimer
{
}

- (unint64_t)notificationCount
{
  [(UIElementProtocol *)self->_uiElement updateCache:2192];
  double v3 = [(UIElementProtocol *)self->_uiElement numberWithAXAttribute:2192];
  id v4 = [v3 unsignedIntegerValue];

  return (unint64_t)v4;
}

- (id)notificationSummary:(unint64_t)a3
{
  if ([(id)VOTSharedWorkspace inUnitTestMode])
  {
    if (a3)
    {
      id v5 = +[NSString stringWithFormat:@"%lu summaries", a3];
    }
    else
    {
      id v5 = @"all summaries";
    }
  }
  else
  {
    id v5 = [(UIElementProtocol *)self->_uiElement objectWithAXAttribute:95238 parameter:+[NSNumber numberWithUnsignedInteger:a3]];
  }

  return v5;
}

- (CGRect)gesturePracticeRegion
{
  [(UIElementProtocol *)self->_uiElement updateCache:9000];
  uiElement = self->_uiElement;

  [(UIElementProtocol *)uiElement rectWithAXAttribute:9000];
  result.size.height = v7;
  result.size.width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

- (NSString)value
{
  return (NSString *)[(VOTElement *)self valueWithUpdate:1];
}

- (id)valueWithUpdate:(BOOL)a3
{
  if (a3
    && [(VOTElement *)self doesHaveTraits:kAXIsEditingTrait | kAXUpdatesFrequentlyTrait | kAXAdjustableTrait])
  {
    [(VOTElement *)self updateValue];
  }
  double v4 = [(UIElementProtocol *)self->_uiElement stringWithAXAttribute:2006];
  if ([v4 isAXAttributedString]
    && [v4 hasAttribute:UIAccessibilityTokenReplaceWithWiFiSSID])
  {
    id v5 = [v4 copy];
    uint64_t v6 = sub_100052D08();
    double v7 = (void *)v6;
    uint64_t v8 = &stru_1001B7888;
    if (v6) {
      uint64_t v8 = (__CFString *)v6;
    }
    id v9 = v8;

    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x2020000000;
    v18[3] = 0;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100016C1C;
    v14[3] = &unk_1001B36A0;
    id v10 = v5;
    id v15 = v10;
    v17 = v18;
    id v11 = v9;
    uint64_t v16 = v11;
    [v4 enumerateAttributesUsingBlock:v14];
    id v12 = v10;

    _Block_object_dispose(v18, 8);
    double v4 = v12;
  }

  return v4;
}

- (id)itemChooserName
{
  id v3 = [objc_allocWithZone((Class)NSMutableString) init];
  double v4 = [(VOTElement *)self label];
  id v5 = [(VOTElement *)self value];
  if ([v4 length]) {
    [v3 appendString:v4];
  }
  if ([v5 length])
  {
    if ([v3 length]) {
      [v3 appendString:@", "];
    }
    if (![(VOTElement *)self doesHaveTraits:kAXToggleTrait])
    {
      [v3 appendString:v5];
      goto LABEL_15;
    }
    if ([v5 isEqualToString:@"1"])
    {
      uint64_t v6 = off_1001EA9E8;
      double v7 = @"element.nonweb.on.text";
      uint64_t v8 = @"on";
    }
    else if ([v5 isEqualToString:@"0"])
    {
      uint64_t v6 = off_1001EA9E8;
      double v7 = @"element.nonweb.off.text";
      uint64_t v8 = @"off";
    }
    else
    {
      if (![v5 isEqualToString:@"2"]) {
        goto LABEL_15;
      }
      uint64_t v6 = off_1001EA9E8;
      double v7 = @"element.mixed.text";
      uint64_t v8 = @"mixed";
    }
    id v9 = sub_100051804(v6, v7, v8);
    [v3 appendString:v9];
  }
LABEL_15:

  return v3;
}

- (id)linkRelationshipType
{
  return [(UIElementProtocol *)self->_uiElement stringWithAXAttribute:3042];
}

- (id)headingLevelValue
{
  return [(UIElementProtocol *)self->_uiElement numberWithAXAttribute:2180];
}

- (id)originalLabel
{
  if ([(VOTElement *)self doesHaveTraits:kAXUpdatesFrequentlyTrait]) {
    [(VOTElement *)self updateLabel];
  }
  uiElement = self->_uiElement;

  return [(UIElementProtocol *)uiElement stringWithAXAttribute:2001];
}

- (id)identifier
{
  return [(UIElementProtocol *)self->_uiElement stringWithAXAttribute:5019];
}

- (id)equivalenceTag
{
  return [(UIElementProtocol *)self->_uiElement stringWithAXAttribute:2071];
}

- (id)urlLabel
{
  id v3 = [(VOTElement *)self url];
  double v4 = [v3 path];
  id v5 = [v4 lastPathComponent];

  if ([(VOTElement *)self doesHaveTraits:kAXButtonTrait | kAXImageTrait])
  {
    uint64_t v6 = [v3 scheme];
    unsigned int v7 = [v6 isEqualToString:@"cid"];

    if (v7)
    {
      uint64_t v8 = [(VOTElement *)self application];
      unsigned int v9 = [v8 isMail];

      if (v9)
      {
        id v10 = sub_100051804(off_1001EA9E8, @"attachment", 0);
        id v11 = [(VOTElement *)self application];
        id v12 = [v3 resourceSpecifier];
        id v13 = [v11 attachmentFilenameForCID:v12];

        if ([v13 length])
        {
          v21 = v10;
          CFStringRef v22 = @"__AXStringForVariablesSentinel";
          uint64_t v14 = __AXStringForVariables();

          id v5 = (void *)v14;
        }
      }
      if (!objc_msgSend(v5, "length", v21, v22))
      {
        id v15 = [v3 resourceSpecifier];
        uint64_t v16 = [v15 lastPathComponent];

        v17 = sub_100051804(off_1001EA9E8, @"attachment", 0);
        id v5 = +[NSString stringWithFormat:@"%@, %@", v17, v16];
      }
    }
  }
  v18 = [v5 stringByReplacingOccurrencesOfString:@"_" withString:&stru_1001B7888];

  id v19 = [v18 stringByReplacingOccurrencesOfString:@"-" withString:@" "];

  return v19;
}

- (void)setDefinedLabel:(id)a3
{
}

- (NSString)definedLabel
{
  return (NSString *)objc_getAssociatedObject(self, @"DefinedLabel");
}

- (void)setUserDefinedLabel:(id)a3
{
}

- (BOOL)savePhotoLabeliCloud:(id)a3
{
  return [(UIElementProtocol *)self->_uiElement performAXAction:2046 withValue:a3];
}

- (id)elementStoredUserLabel
{
  return [(UIElementProtocol *)self->_uiElement stringWithAXAttribute:2060];
}

- (NSString)userDefinedLabel
{
  uint64_t v3 = objc_getAssociatedObject(self, @"UserDefinedLabel");
  if (v3)
  {
    double v4 = (void *)v3;
    id v5 = +[NSNull null];
    unsigned __int8 v6 = [v4 isEqual:v5];

    if (v6)
    {
      id v7 = 0;
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v8 = +[VOTElementLabelCache sharedManager];
    unsigned int v9 = [(VOTElement *)self uniqueIdentification];
    double v4 = [v8 userLabelForIdentification:v9];

    if (v4)
    {
      [(VOTElement *)self setUserDefinedLabel:v4];
    }
    else
    {
      id v10 = +[NSNull null];
      [(VOTElement *)self setUserDefinedLabel:v10];

      double v4 = 0;
    }
  }
  id v7 = v4;
  double v4 = v7;
LABEL_8:

  return (NSString *)v7;
}

- (BOOL)isFirstItemInList
{
  uint64_t v2 = objc_getAssociatedObject(self, &unk_1001EB719);
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)setIsFirstItemInList:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  objc_setAssociatedObject(self, &unk_1001EB719, v4, (void *)1);
}

- (BOOL)isFirstItemInTable
{
  uint64_t v2 = objc_getAssociatedObject(self, &unk_1001EB71A);
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)setIsFirstItemInTable:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  objc_setAssociatedObject(self, &unk_1001EB71A, v4, (void *)1);
}

- (BOOL)isFirstItemInLandmark
{
  uint64_t v2 = objc_getAssociatedObject(self, &unk_1001EB71B);
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)setIsFirstItemInLandmark:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  objc_setAssociatedObject(self, &unk_1001EB71B, v4, (void *)1);
}

- (BOOL)isFirstItemInFieldset
{
  uint64_t v2 = objc_getAssociatedObject(self, &unk_1001EB71C);
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)setIsFirstItemInFieldset:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  objc_setAssociatedObject(self, &unk_1001EB71C, v4, (void *)1);
}

- (BOOL)isFirstItemInTree
{
  uint64_t v2 = objc_getAssociatedObject(self, &unk_1001EB71D);
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)setIsFirstItemInTree:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  objc_setAssociatedObject(self, &unk_1001EB71D, v4, (void *)1);
}

- (NSString)label
{
  unsigned __int8 v3 = [(VOTElement *)self userDefinedLabel];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    unsigned __int8 v6 = [(VOTElement *)self definedLabel];
    id v7 = v6;
    if (v6)
    {
      id v5 = v6;
    }
    else
    {
      uint64_t v8 = [(VOTElement *)self originalLabel];
      if (![v8 length] && -[VOTElement includeURLLabelInLabel](self, "includeURLLabelInLabel"))
      {
        uint64_t v9 = [(VOTElement *)self urlLabel];

        uint64_t v8 = (void *)v9;
      }
      if ([v8 isAXAttributedString]
        && [v8 hasAttribute:UIAccessibilityTokenReplaceWithActiveActivity])
      {
        [(id)qword_1001EB6D0 updateFocusActiveActivityDisplayName];
        id v10 = +[VOTElement springBoardApplication];
        id v11 = [v10 focusModeActivityName];

        if ([v11 length])
        {
          v21[0] = 0;
          v21[1] = v21;
          v21[2] = 0x2020000000;
          v21[3] = 0;
          v17[0] = _NSConcreteStackBlock;
          v17[1] = 3221225472;
          v17[2] = sub_100017844;
          v17[3] = &unk_1001B36A0;
          id v12 = [v8 copy];
          id v18 = v12;
          unsigned __int8 v20 = v21;
          id v19 = v11;
          [v8 enumerateAttributesUsingBlock:v17];
          id v13 = v12;

          _Block_object_dispose(v21, 8);
          uint64_t v8 = v13;
        }
      }
      if ([v8 length]
        || ![(VOTElement *)self doesHaveTraits:kAXAllowsDirectInteractionTrait])
      {
        id v5 = v8;
      }
      else
      {
        uint64_t v14 = off_1001EA9E8;
        id v15 = [(id)VOTSharedWorkspace selectedLanguage];
        sub_100051D04(v14, @"default.direct.interact.label", 0, v15);
        id v5 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
  }

  return (NSString *)v5;
}

- (id)hint
{
  return [(UIElementProtocol *)self->_uiElement stringWithAXAttribute:2002];
}

- (BOOL)isTouchContainer
{
  int v3 = sub_100050E5C();
  if (v3)
  {
    unint64_t v4 = [(VOTElement *)self traits];
    if ((kAXTouchContainerTrait & v4) != 0)
    {
      if (AXIsInternalInstall())
      {
        id v5 = VOTLogElement();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
          sub_10011C0EC(self, v5);
        }
      }
      goto LABEL_8;
    }
    if ((id)[(VOTElement *)self containerType] == (id)256)
    {
LABEL_8:
      LOBYTE(v3) = 1;
      return v3;
    }
    LOBYTE(v3) = (id)[(VOTElement *)self containerType] == (id)0x2000;
  }
  return v3;
}

- (BOOL)isHeader
{
  unint64_t v2 = [(VOTElement *)self traits];
  return (kAXHeaderTrait & ~v2) == 0;
}

- (BOOL)isAccessibleElement
{
  unsigned int v3 = [(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:2016];
  unsigned int v4 = ![(VOTElement *)self isHandUI];
  if ((v4 & 1) != 0 || !v3) {
    return v4 & v3;
  }

  return [(VOTElement *)self isVisible];
}

- (BOOL)isAccessibleGroup
{
  return [(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:2219];
}

- (BOOL)supportsMediaAnalysis
{
  return ([(VOTElement *)self mediaAnalysisOptions] >> 15) & 1;
}

- (unsigned)mediaAnalysisOptions
{
  [(UIElementProtocol *)self->_uiElement updateCache:2701];
  unsigned int v3 = [(UIElementProtocol *)self->_uiElement numberWithAXAttribute:2701];
  unsigned int v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (CGRect)mediaAnalysisFrame
{
  [(UIElementProtocol *)self->_uiElement updateCache:2709];
  uiElement = self->_uiElement;

  [(UIElementProtocol *)uiElement rectWithAXAttribute:2709];
  result.size.height = v7;
  result.size.width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

- (BOOL)shouldSkipImageTraitDescription
{
  return [(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:2209];
}

- (CGRect)braille2DRenderRegion
{
  [(UIElementProtocol *)self->_uiElement rectWithAXAttribute:3058];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (id)braille2DCanvasElement
{
  return [(VOTElement *)self elementForAttribute:3057];
}

- (id)brailleMap
{
  double v2 = [(UIElementProtocol *)self->_uiElement objectWithAXAttribute:2319];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v3 = +[NSKeyedUnarchiver secureUnarchiveData:v2 withExpectedClass:objc_opt_class() otherAllowedClasses:0];
  }
  else
  {
    double v3 = 0;
  }

  return v3;
}

- (VOTElement)mediaAnalysisElement
{
  return (VOTElement *)[(VOTElement *)self elementForAttribute:2710];
}

- (id)imageAssetLocalIdentifier
{
  return [(UIElementProtocol *)self->_uiElement stringWithAXAttribute:2717];
}

- (BOOL)isPHAssetLocallyAvailable
{
  return [(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:2719];
}

- (NSURL)photoLibraryURL
{
  double v2 = [(UIElementProtocol *)self->_uiElement objectWithAXAttribute:2720];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (NSURL *)v3;
}

- (id)elementForParameterizedAttribute:(int64_t)a3 parameter:(id)a4
{
  double v4 = [(UIElementProtocol *)self->_uiElement objectWithAXAttribute:a3 parameter:a4];
  double v5 = v4;
  if (v4)
  {
    CFTypeID v6 = CFGetTypeID(v4);
    if (v6 == AXUIElementGetTypeID())
    {
      id v7 = +[VOTElement _elementWithAXUIElementRef:v5];
LABEL_6:
      uint64_t v8 = v7;
      goto LABEL_8;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v5;
    goto LABEL_6;
  }
  uint64_t v8 = 0;
LABEL_8:

  return v8;
}

- (id)arrayForParameterizedAttribute:(int64_t)a3 parameter:(id)a4
{
  double v4 = [(UIElementProtocol *)self->_uiElement objectWithAXAttribute:a3 parameter:a4];
  double v5 = v4;
  if (v4 && (CFTypeID v6 = CFGetTypeID(v4), v6 == CFArrayGetTypeID())) {
    id v7 = v5;
  }
  else {
    id v7 = 0;
  }

  return v7;
}

- (id)stringForParameterizedAttribute:(int64_t)a3 parameter:(id)a4
{
  double v4 = [(UIElementProtocol *)self->_uiElement objectWithAXAttribute:a3 parameter:a4];
  double v5 = v4;
  if (v4 && (CFTypeID v6 = CFGetTypeID(v4), v6 == CFStringGetTypeID())) {
    id v7 = v5;
  }
  else {
    id v7 = 0;
  }

  return v7;
}

- (id)focusedApplications
{
  if ([(id)VOTSharedWorkspace inUnitTestMode])
  {
    if (qword_1001EB720 != -1) {
      dispatch_once(&qword_1001EB720, &stru_1001B36C0);
    }
    uint64_t v6 = qword_1001EB728;
    id v3 = +[NSArray arrayWithObjects:&v6 count:1];
  }
  else
  {
    double v4 = [(VOTElement *)self uiElement];
    [v4 updateCache:1102];

    id v3 = [(VOTElement *)self elementsForAttribute:1102];
  }

  return v3;
}

- (float)activationDelay
{
  double v2 = [(UIElementProtocol *)self->_uiElement numberWithAXAttribute:2052];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (BOOL)supportsTextSelection
{
  return [(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:2316];
}

- (id)opaqueElementInDirection:(int64_t)a3 searchType:(int64_t)a4 range:(_NSRange *)a5
{
  return [(VOTElement *)self opaqueElementInDirection:a3 searchType:a4 range:a5 peeking:1 startOpaqueElement:0];
}

- (id)opaqueElementInDirection:(int64_t)a3 searchType:(int64_t)a4 range:(_NSRange *)a5 peeking:(BOOL)a6 startOpaqueElement:(id)a7
{
  BOOL v7 = a6;
  id v11 = a7;
  if (a5)
  {
    NSUInteger location = a5->location;
    NSUInteger length = a5->length;
  }
  else
  {
    NSUInteger length = 0;
    NSUInteger location = 0x7FFFFFFFLL;
  }
  uint64_t v14 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", location, length);
  BOOL v28 = v7;
  int64_t v27 = a4;
  if (!v7)
  {
    uint64_t v16 = +[NSNumber numberWithLong:a3];
    v30[0] = v16;
    v17 = +[NSNumber numberWithLong:a4];
    v30[1] = v17;
    v30[2] = v14;
    v30[3] = @"UIAccessibilityNotificationVoiceOverIdentifier";
    v30[4] = &__kCFBooleanTrue;
    id v18 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [(id)VOTSharedWorkspace navigationStyleHonorsGroups]);
    v30[5] = v18;
    id v19 = +[NSArray arrayWithObjects:v30 count:6];
    uint64_t v22 = 95225;
    long long v23 = self;
LABEL_9:
    v21 = -[VOTElement elementForParameterizedAttribute:parameter:](v23, "elementForParameterizedAttribute:parameter:", v22, v19, a4);
    goto LABEL_10;
  }
  uint64_t v15 = +[NSNumber numberWithLong:a3];
  uint64_t v16 = (void *)v15;
  if (!v11)
  {
    v32[0] = v15;
    v17 = +[NSNumber numberWithLong:a4];
    v32[1] = v17;
    v32[2] = v14;
    v32[3] = @"UIAccessibilityNotificationVoiceOverIdentifier";
    v32[4] = &__kCFBooleanFalse;
    id v18 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [(id)VOTSharedWorkspace navigationStyleHonorsGroups]);
    v32[5] = v18;
    id v19 = +[NSArray arrayWithObjects:v32 count:6];
    long long v23 = self;
    uint64_t v22 = 92517;
    goto LABEL_9;
  }
  v31[0] = v15;
  v17 = +[NSNumber numberWithLong:a4];
  v31[1] = v17;
  v31[2] = v14;
  v31[3] = @"UIAccessibilityNotificationVoiceOverIdentifier";
  v31[4] = &__kCFBooleanFalse;
  id v18 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [(id)VOTSharedWorkspace navigationStyleHonorsGroups]);
  v31[5] = v18;
  id v19 = [v11 uiElement];
  v31[6] = [v19 axElement];
  unsigned __int8 v20 = +[NSArray arrayWithObjects:v31 count:7];
  v21 = [(VOTElement *)self elementForParameterizedAttribute:92517 parameter:v20];

LABEL_10:
  if ([v21 isRemoteElement])
  {
    uint64_t v24 = [v21 opaqueElementInDirection:a3 searchType:v27 range:a5 peeking:v28 startOpaqueElement:0];

    v21 = (void *)v24;
    if (!v24)
    {
      long long v25 = [0 uiElement];
      v21 = -[VOTElement opaqueElementInDirection:searchType:range:peeking:startOpaqueElement:](self, "opaqueElementInDirection:searchType:range:peeking:startOpaqueElement:", a3, v27, a5, v28, [v25 axElement]);
    }
  }

  return v21;
}

- (BOOL)servesAsHeadingLandmark
{
  return [(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:2318];
}

- (id)elementForAttribute:(int64_t)a3
{
  return [(VOTElement *)self _elementForAttribute:a3 shouldUpdateCache:1];
}

- (id)_elementForAttribute:(int64_t)a3 shouldUpdateCache:(BOOL)a4
{
  return [(VOTElement *)self _elementForAttribute:a3 shouldUpdateCache:a4 shouldFetchAttributes:1];
}

- (id)_elementForAttribute:(int64_t)a3 shouldUpdateCache:(BOOL)a4 shouldFetchAttributes:(BOOL)a5
{
  BOOL v5 = a5;
  if (a4) {
    [(UIElementProtocol *)self->_uiElement updateCache:a3];
  }
  uint64_t v8 = [(UIElementProtocol *)self->_uiElement objectWithAXAttribute:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v8;
    goto LABEL_10;
  }
  objc_opt_class();
  id v10 = v8;
  if (objc_opt_isKindOfClass()) {
    id v10 = [v8 axElement];
  }
  if (v10)
  {
    if (![v10 conformsToProtocol:&OBJC_PROTOCOL___UIElementProtocol])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v5) {
          +[AXUIElement uiElementWithAXElement:v10];
        }
        else {
        id v13 = +[AXUIElement uiElementWithAXElement:v10 cache:0];
        }
        id v12 = +[VOTElement elementWithUIElement:v13];

        goto LABEL_19;
      }
      id v11 = v10;
      goto LABEL_11;
    }
    id v9 = v10;
LABEL_10:
    id v11 = +[VOTElement elementWithUIElement:v9];
LABEL_11:
    id v12 = v11;
    goto LABEL_19;
  }
  id v12 = 0;
LABEL_19:

  return v12;
}

- (id)elementsForAttribute:(int64_t)a3 withParameter:(id)a4
{
  float v4 = [(UIElementProtocol *)self->_uiElement uiElementsWithAttribute:a3 parameter:a4];
  BOOL v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v12 = v11;
        }
        else
        {
          +[VOTElement elementWithUIElement:](VOTElement, "elementWithUIElement:", v11, (void)v15);
          id v12 = (id)objc_claimAutoreleasedReturnValue();
        }
        id v13 = v12;
        if (v12) {
          [v5 addObject:v12];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)elementsForAttribute:(int64_t)a3
{
  return [(VOTElement *)self elementsForAttribute:a3 withParameter:0];
}

- (__AXUIElement)touchContainerParentAXElement
{
  if (!sub_100050E5C()) {
    return 0;
  }
  [(UIElementProtocol *)self->_uiElement updateCache:2202];
  id v3 = [(UIElementProtocol *)self->_uiElement objectWithAXAttribute:2202];
  if (!v3)
  {
    float v4 = [(VOTElement *)self remoteParent];
    BOOL v5 = [v4 uiElement];
    id v3 = [v5 objectWithAXAttribute:2012];

    if (!v3) {
      return 0;
    }
  }
  CFTypeID v6 = CFGetTypeID(v3);
  if (v6 == AXUIElementGetTypeID()) {
    return (__AXUIElement *)v3;
  }
  else {
    return 0;
  }
}

- (__AXUIElement)touchContainerAXElement
{
  if (!sub_100050E5C()) {
    return 0;
  }
  id v3 = [(VOTElement *)self containerTypes];
  float v4 = &off_1001C4FF0;
  if (([v3 containsObject:&off_1001C4FF0] & 1) == 0)
  {
    float v4 = &off_1001C5008;
    if (([v3 containsObject:&off_1001C5008] & 1) == 0)
    {
      float v4 = &off_1001C5020;
      if (([v3 containsObject:&off_1001C5020] & 1) == 0)
      {
        float v4 = &off_1001C5038;
        if (([v3 containsObject:&off_1001C5038] & 1) == 0)
        {
          float v4 = &off_1001C5050;
          if (([v3 containsObject:&off_1001C5050] & 1) == 0)
          {
            float v4 = &off_1001C5068;
            if (([v3 containsObject:&off_1001C5068] & 1) == 0)
            {
              float v4 = &off_1001C5080;
              if (![v3 containsObject:&off_1001C5080]) {
                goto LABEL_25;
              }
            }
          }
        }
      }
    }
  }
  id v5 = [(UIElementProtocol *)self->_uiElement objectWithAXAttribute:92515 parameter:v4];
  if (!v5 || (id v6 = v5, v7 = CFGetTypeID(v5), v7 != AXUIElementGetTypeID()))
  {
LABEL_25:
    id v6 = [(UIElementProtocol *)self->_uiElement objectWithAXAttribute:2012];
    if (v6
      || (![(VOTElement *)self remoteParentIsViewHost]
        ? (id v8 = 0)
        : ([(VOTElement *)self remoteParent], id v8 = objc_claimAutoreleasedReturnValue()),
          [v8 uiElement],
          uint64_t v9 = objc_claimAutoreleasedReturnValue(),
          id v6 = [v9 objectWithAXAttribute:2012],
          v9,
          v8,
          v6))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v6 = [v6 axElement];
      }
      CFTypeID v10 = CFGetTypeID(v6);
      if (v10 != AXUIElementGetTypeID()) {
        id v6 = 0;
      }
    }
  }

  return (__AXUIElement *)v6;
}

- (id)touchContainerParent
{
  if (sub_100050E5C())
  {
    if (!_AXSInUnitTestMode()
      || ([(UIElementProtocol *)self->_uiElement objectWithAXAttribute:2202],
          id v3 = objc_claimAutoreleasedReturnValue(),
          +[VOTElement elementWithUIElement:v3],
          float v4 = objc_claimAutoreleasedReturnValue(),
          v3,
          !v4))
    {
      id v5 = +[AXUIElement uiElementWithAXElement:[(VOTElement *)self touchContainerParentAXElement]];
      float v4 = +[VOTElement elementWithUIElement:v5];
    }
  }
  else
  {
    float v4 = 0;
  }

  return v4;
}

- (id)touchContainer
{
  if (sub_100050E5C())
  {
    if (!_AXSInUnitTestMode()
      || ([(UIElementProtocol *)self->_uiElement objectWithAXAttribute:2012],
          id v3 = objc_claimAutoreleasedReturnValue(),
          +[VOTElement elementWithUIElement:v3],
          float v4 = objc_claimAutoreleasedReturnValue(),
          v3,
          !v4))
    {
      id v5 = +[AXUIElement uiElementWithAXElement:[(VOTElement *)self touchContainerAXElement]];
      float v4 = +[VOTElement elementWithUIElement:v5];
    }
  }
  else
  {
    float v4 = 0;
  }

  return v4;
}

- (id)labeledTouchContainer
{
  double v2 = [(VOTElement *)self touchContainer];
  if (v2)
  {
    do
    {
      id v3 = [v2 label];

      if (v3) {
        break;
      }
      uint64_t v4 = [v2 touchContainerParent];

      double v2 = (void *)v4;
    }
    while (v4);
  }

  return v2;
}

- (BOOL)touchContainerShouldOutputBraille
{
  return [(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:2314];
}

- (id)imageData
{
  return [(UIElementProtocol *)self->_uiElement arrayWithAXAttribute:2315];
}

- (BOOL)shouldIncludeMediaDescriptionsRotor
{
  return [(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:2203];
}

- (id)linkedElement
{
  return [(VOTElement *)self elementForAttribute:2024];
}

- (void)updateFlowToElements
{
}

- (id)flowToElements
{
  return [(VOTElement *)self elementsForAttribute:2033];
}

- (id)errorMessageElements
{
  return [(VOTElement *)self elementsForAttribute:2156];
}

- (id)nextContainer
{
  id v3 = [(VOTElement *)self elementForAttribute:2014];
  if (!v3)
  {
    uint64_t v4 = [(VOTElement *)self remoteParent];
    id v3 = [v4 elementForAttribute:2014];
  }

  return v3;
}

- (id)previousContainer
{
  id v3 = [(VOTElement *)self elementForAttribute:2015];
  if (!v3)
  {
    uint64_t v4 = [(VOTElement *)self remoteParent];
    id v3 = [v4 elementForAttribute:2015];
  }

  return v3;
}

- (VOTElement)previousGuideElement
{
  id v3 = [(VOTElement *)self elementForAttribute:2154];
  if (!v3)
  {
    uint64_t v4 = [(VOTElement *)self remoteParent];
    id v3 = [v4 elementForAttribute:2154];
  }

  return (VOTElement *)v3;
}

- (VOTElement)nextGuideElement
{
  id v3 = [(VOTElement *)self elementForAttribute:2155];
  if (!v3)
  {
    uint64_t v4 = [(VOTElement *)self remoteParent];
    id v3 = [v4 elementForAttribute:2155];
  }

  return (VOTElement *)v3;
}

- (NSString)guideElementHeaderText
{
  [(UIElementProtocol *)self->_uiElement updateCache:2169];
  uiElement = self->_uiElement;

  return (NSString *)[(UIElementProtocol *)uiElement stringWithAXAttribute:2169];
}

- (id)ancestryForTraits:(unint64_t)a3
{
  uint64_t v4 = +[NSNumber numberWithUnsignedLong:a3];
  id v5 = [(VOTElement *)self elementForParameterizedAttribute:92515 parameter:v4];

  return v5;
}

- (BOOL)supportsPressedState
{
  return [(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:2110];
}

- (BOOL)isPressed
{
  [(UIElementProtocol *)self->_uiElement updateCache:2111];
  uiElement = self->_uiElement;

  return [(UIElementProtocol *)uiElement BOOLWithAXAttribute:2111];
}

- (BOOL)isSwitch
{
  return [(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:2320];
}

- (BOOL)handlesGestureArea
{
  return [(VOTElement *)self doesHaveTraits:kAXGestureHandlerRegionTrait | kAXGesturePracticeRegionTrait];
}

- (BOOL)shouldSpeakHelpInGestureArea
{
  BOOL v3 = [(VOTElement *)self doesHaveTraits:kAXGesturePracticeRegionTrait];
  if (v3) {
    LOBYTE(v3) = ![(VOTElement *)self doesHaveTraits:kAXGestureHandlerRegionTrait];
  }
  return v3;
}

- (id)instructions
{
  if ([(VOTElement *)self overridesVoiceOverInstructions]
    || (unint64_t v3 = [(VOTElement *)self traits], (kAXNotEnabledTrait & v3) != 0))
  {
    uint64_t v4 = 0;
    goto LABEL_4;
  }
  unint64_t v6 = v3;
  CFTypeID v7 = [(id)VOTSharedWorkspace selectedLanguage];
  if ((kAXMathEquationTrait & v6) != 0 && [(VOTElement *)self canExpandMathEquation])
  {
    unsigned int v8 = [(id)VOTSharedWorkspace brailleInputActive];
    uint64_t v9 = off_1001EA9F0;
    if (v8) {
      CFTypeID v10 = @"mathequation.instructions.bsi.command";
    }
    else {
      CFTypeID v10 = @"mathequation.instructions";
    }
  }
  else
  {
    if ((kAXToggleTrait & v6) != 0 && (kAXRadioButtonTrait & v6) == 0)
    {
      unsigned int v12 = [(id)VOTSharedWorkspace brailleInputActive];
      uint64_t v9 = off_1001EA9F0;
      if (v12) {
        CFTypeID v10 = @"switch.instructions.bsi.command";
      }
      else {
        CFTypeID v10 = @"switch.instructions";
      }
      goto LABEL_32;
    }
    if ((kAXTextEntryTrait & v6) != 0
      && (kAXStaticTextTrait & v6) == 0
      && ((kAXIsEditingTrait & v6) == 0
       || [(VOTElement *)self shouldIgnoreTextEditingTrait]))
    {
      unsigned int v13 = [(id)VOTSharedWorkspace brailleInputActive];
      uint64_t v9 = off_1001EA9F0;
      if (v13) {
        CFTypeID v10 = @"textview.instructions.bsi.command";
      }
      else {
        CFTypeID v10 = @"textview.instructions";
      }
      goto LABEL_32;
    }
    if (((kAXPickerElementTrait | kAXAdjustableTrait) & v6) != 0)
    {
      unsigned int v11 = [(id)VOTSharedWorkspace brailleInputActive];
      uint64_t v9 = off_1001EA9F0;
      if (v11) {
        CFTypeID v10 = @"adjustable.instructions.bsi.command";
      }
      else {
        CFTypeID v10 = @"adjustable.instructions";
      }
    }
    else if ((kAXTableIndexTrait & v6) != 0)
    {
      uint64_t v9 = off_1001EA9F0;
      CFTypeID v10 = @"table.index.instructions";
    }
    else if ((kAXDraggableTrait & v6) != 0)
    {
      uint64_t v9 = off_1001EA9F0;
      CFTypeID v10 = @"draggable.instructions";
    }
    else if ((kAXPopupButtonTrait & v6) != 0)
    {
      unsigned int v15 = [(id)VOTSharedWorkspace brailleInputActive];
      uint64_t v9 = off_1001EA9F0;
      if (v15) {
        CFTypeID v10 = @"popupbutton.instructions.bsi.command";
      }
      else {
        CFTypeID v10 = @"popupbutton.instructions";
      }
    }
    else if ((kAXWebInteractiveVideoTrait & v6) != 0)
    {
      unsigned int v16 = [(id)VOTSharedWorkspace brailleInputActive];
      uint64_t v9 = off_1001EA9F0;
      if (v16) {
        CFTypeID v10 = @"web.interactive.video.instructions.bsi.command";
      }
      else {
        CFTypeID v10 = @"web.interactive.video.instructions";
      }
    }
    else if ((kAXAllowsDirectInteractionTrait & v6) != 0)
    {
      if (([(VOTElement *)self directTouchOptions] & 2) != 0
        && ![(VOTElement *)self activatedDirectTouchThatRequiredActivation])
      {
        uint64_t v9 = off_1001EA9F0;
        CFTypeID v10 = @"direct.interact.hint.requires.activation";
        uint64_t v14 = 0;
        goto LABEL_33;
      }
      uint64_t v9 = off_1001EA9F0;
      CFTypeID v10 = @"default.direct.interact.hint";
    }
    else
    {
      if (![(VOTElement *)self expandedStatus]
        || ![(VOTElement *)self expandedStatusTogglesOnActivate])
      {
        goto LABEL_53;
      }
      int64_t v17 = [(VOTElement *)self expandedStatus];
      if (v17 == 2)
      {
        unsigned int v19 = [(id)VOTSharedWorkspace brailleInputActive];
        uint64_t v9 = off_1001EA9F0;
        if (v19) {
          CFTypeID v10 = @"expand.instructions.bsi.command";
        }
        else {
          CFTypeID v10 = @"expand.instructions";
        }
        goto LABEL_32;
      }
      if (v17 != 1)
      {
LABEL_53:
        uint64_t v4 = 0;
        goto LABEL_34;
      }
      unsigned int v18 = [(id)VOTSharedWorkspace brailleInputActive];
      uint64_t v9 = off_1001EA9F0;
      if (v18) {
        CFTypeID v10 = @"collapse.instructions.bsi.command";
      }
      else {
        CFTypeID v10 = @"collapse.instructions";
      }
    }
  }
LABEL_32:
  uint64_t v14 = v10;
LABEL_33:
  uint64_t v4 = sub_100051D04(v9, v10, v14, v7);
LABEL_34:

LABEL_4:

  return v4;
}

- (unint64_t)hash
{
  return (unint64_t)[(UIElementProtocol *)self->_uiElement hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uiElement = self->_uiElement;
    unint64_t v6 = [v4 uiElement];
    unsigned __int8 v7 = [(UIElementProtocol *)uiElement isEqual:v6];
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (id)dataDetectorURL:(CGPoint)a3
{
  CGPoint v8 = a3;
  AXValueRef v4 = AXValueCreate(kAXValueTypeCGPoint, &v8);
  id v5 = [(UIElementProtocol *)self->_uiElement objectWithAXAttribute:92513 parameter:v4];
  if (v4) {
    CFRelease(v4);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (void)updateCache
{
  if (!qword_1001EB730)
  {
    id v3 = objc_allocWithZone((Class)NSArray);
    AXValueRef v4 = +[NSNumber numberWithUnsignedInt:2003];
    id v5 = +[NSNumber numberWithUnsignedInt:2007];
    id v6 = +[NSNumber numberWithUnsignedInt:2001];
    unsigned __int8 v7 = +[NSNumber numberWithUnsignedInt:2006];
    CGPoint v8 = +[NSNumber numberWithUnsignedInt:2004];
    uint64_t v9 = +[NSNumber numberWithUnsignedInt:2071];
    id v10 = objc_msgSend(v3, "initWithObjects:", v4, v5, v6, v7, v8, v9, 0);
    unsigned int v11 = (void *)qword_1001EB730;
    qword_1001EB730 = (uint64_t)v10;
  }
  uiElement = self->_uiElement;

  -[UIElementProtocol updateCacheWithAttributes:](uiElement, "updateCacheWithAttributes:");
}

- (void)updateFrame
{
}

- (void)updatePaths
{
}

- (void)updateLabel
{
}

- (void)updateCenterPoint
{
}

- (void)updateVisiblePoint
{
}

- (void)updateExpandedStatus
{
}

- (void)updateRoleDescription
{
}

- (void)updateValue
{
}

- (void)updateTraits
{
}

- (void)updateHint
{
}

- (void)updateLanguage
{
}

- (void)updateEquivalenceTag
{
}

- (void)updateFocusActiveActivityDisplayName
{
}

- (id)application
{
  return [(id)VOTSharedWorkspace applicationForElement:self];
}

- (id)remoteApplication
{
  id v3 = [(VOTElement *)self cachedRemoteApplication];

  if (!v3)
  {
    AXValueRef v4 = [(VOTElement *)self _elementForAttribute:2142 shouldUpdateCache:0 shouldFetchAttributes:0];
    [(VOTElement *)self setCachedRemoteApplication:v4];
  }

  return [(VOTElement *)self cachedRemoteApplication];
}

- (id)nextElement
{
  if (![(VOTElement *)self isAccessibilityOpaqueElementProvider]
    || [(id)VOTSharedWorkspace navigationStyleHonorsGroups]
    && [(VOTElement *)self isAccessibleGroup])
  {
    id v3 = [(VOTElement *)self elementsInDirection:1 withCount:1];
    AXValueRef v4 = [v3 lastObject];
  }
  else
  {
    _AXAssert();
    AXValueRef v4 = [(VOTElement *)self opaqueElementInDirection:1 searchType:0 range:0];
  }

  return v4;
}

- (id)previousElement
{
  if (![(VOTElement *)self isAccessibilityOpaqueElementProvider]
    || [(id)VOTSharedWorkspace navigationStyleHonorsGroups]
    && [(VOTElement *)self isAccessibleGroup])
  {
    id v3 = [(VOTElement *)self elementsInDirection:2 withCount:1];
    AXValueRef v4 = [v3 lastObject];
  }
  else
  {
    _AXAssert();
    AXValueRef v4 = [(VOTElement *)self opaqueElementInDirection:2 searchType:0 range:0];
  }

  return v4;
}

- (id)autoSpeakWatchElements
{
  return [(VOTElement *)self elementsForAttribute:2132];
}

- (id)realtimeElements
{
  return [(VOTElement *)self elementsForAttribute:3037];
}

- (BOOL)realtimeElementUnread
{
  return [(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:3039];
}

- (BOOL)realtimeElementCompleted
{
  return [(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:3038];
}

- (BOOL)supportsHeaderElementOutput
{
  if ([(VOTElement *)self doesHaveTraits:kAXKeyboardKeyTrait | kAXAutoCorrectCandidateTrait]) {
    return 1;
  }

  return [(VOTElement *)self containedIn:2];
}

- (id)firstContainedElement
{
  double v2 = self;
  id v3 = 0;
  uint64_t v4 = AXUIAccessibilityAssistiveTechnologyKey;
  uint64_t v5 = AXUIAccessibilityIncludeRemoteElements;
  uint64_t v6 = AXUIAccessibilityShouldAlwaysScrollKey;
  do
  {
    unsigned __int8 v7 = v3;
    id v3 = v2;

    v10[0] = v4;
    v10[1] = v5;
    v11[0] = @"UIAccessibilityNotificationVoiceOverIdentifier";
    v11[1] = &__kCFBooleanFalse;
    v10[2] = v6;
    v11[2] = &__kCFBooleanTrue;
    CGPoint v8 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:3];
    double v2 = [(VOTElement *)v3 elementForParameterizedAttribute:95230 parameter:v8];
  }
  while ([(VOTElement *)v2 isAccessibilityOpaqueElementProvider]
       && ![(VOTElement *)v3 isEqual:v2]);
  if ([(VOTElement *)v2 isAccessibilityOpaqueElementProvider]) {
    _AXAssert();
  }

  return v2;
}

- (unint64_t)groupedChildrenCount
{
  double v2 = [(UIElementProtocol *)self->_uiElement numberWithAXAttribute:2220];
  id v3 = [v2 unsignedIntegerValue];

  return (unint64_t)v3;
}

- (id)groupedParent
{
  id v3 = [(VOTElement *)self elementForAttribute:2184];
  if (!v3)
  {
    uint64_t v4 = [(VOTElement *)self remoteParent];
    unsigned int v5 = [(VOTElement *)self isEqual:v4];

    if (v5)
    {
      uint64_t v6 = [(VOTElement *)self remoteParent];
      id v3 = [v6 groupedParent];
    }
    else
    {
      id v3 = 0;
    }
  }

  return v3;
}

- (BOOL)elementIsDescendant:(id)a3
{
  id v4 = a3;
  unsigned int v5 = v4;
  if (v4)
  {
    uint64_t v6 = v4;
    while (([v6 isEqual:self] & 1) == 0)
    {
      uint64_t v7 = [v6 directParent];

      uint64_t v6 = (void *)v7;
      if (!v7) {
        goto LABEL_5;
      }
    }

    BOOL v8 = 1;
  }
  else
  {
LABEL_5:
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)elementIsAncestor:(id)a3
{
  return [a3 elementIsDescendant:self];
}

- (id)_lastContainedElementIncludingRemotes:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = self;
  unsigned int v5 = 0;
  uint64_t v6 = AXUIAccessibilityAssistiveTechnologyKey;
  uint64_t v7 = AXUIAccessibilityIncludeRemoteElements;
  uint64_t v8 = AXUIAccessibilityShouldAlwaysScrollKey;
  do
  {
    uint64_t v9 = v5;
    unsigned int v5 = v4;

    v14[0] = @"UIAccessibilityNotificationVoiceOverIdentifier";
    v13[0] = v6;
    v13[1] = v7;
    id v10 = +[NSNumber numberWithBool:v3];
    v13[2] = v8;
    v14[1] = v10;
    v14[2] = &__kCFBooleanTrue;
    unsigned int v11 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];
    id v4 = [(VOTElement *)v5 elementForParameterizedAttribute:95231 parameter:v11];
  }
  while ([(VOTElement *)v4 isAccessibilityOpaqueElementProvider]
       && ![(VOTElement *)v5 isEqual:v4]);
  if ([(VOTElement *)v4 isAccessibilityOpaqueElementProvider]) {
    _AXAssert();
  }

  return v4;
}

- (id)lastContainedElement
{
  BOOL v3 = [(VOTElement *)self _lastContainedElementIncludingRemotes:1];
  id v4 = v3;
  if (v3
    && ([v3 uiElement],
        unsigned int v5 = objc_claimAutoreleasedReturnValue(),
        [v5 axElement],
        _AXUIElementIDForElement(),
        uint64_t v7 = v6,
        v5,
        v7 != 9999))
  {
    id v8 = v4;
  }
  else
  {
    id v8 = [(VOTElement *)self _lastContainedElementIncludingRemotes:0];
  }
  uint64_t v9 = v8;

  return v9;
}

- (id)elementsInDirection:(int64_t)a3 withCount:(unint64_t)a4
{
  BOOL v6 = [(id)VOTSharedWorkspace navigationStyle] == (id)1;
  v40[0] = AXUIAccessibilityHonorsGroupsKey;
  uint64_t v7 = +[NSNumber numberWithBool:v6];
  v41[0] = v7;
  v40[1] = AXUIAccessibilityElementCountKey;
  id v8 = +[NSNumber numberWithUnsignedInteger:a4];
  v41[1] = v8;
  v40[2] = AXUIAccessibilityNavigationDirection;
  uint64_t v9 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [(id)VOTSharedWorkspace navigationDirection]);
  v41[2] = v9;
  v29 = +[NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:3];

  if (a3 == 2)
  {
    id v10 = self;
    uint64_t v11 = [(UIElementProtocol *)self->_uiElement previousElementsWithParameters:v29];
  }
  else
  {
    if (a3 != 1)
    {
      unsigned int v12 = 0;
      id v10 = self;
      goto LABEL_7;
    }
    id v10 = self;
    uint64_t v11 = [(UIElementProtocol *)self->_uiElement nextElementsWithParameters:v29];
  }
  unsigned int v12 = (void *)v11;
LABEL_7:
  +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v12 count]);
  id v32 = (id)objc_claimAutoreleasedReturnValue();
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v12;
  id v13 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (!v13) {
    goto LABEL_21;
  }
  id v14 = v13;
  uint64_t v15 = *(void *)v36;
  unsigned int v16 = &OBJC_IVAR___VOTHandwritingManager__allowedCharacterModes;
  do
  {
    for (i = 0; i != v14; i = (char *)i + 1)
    {
      if (*(void *)v36 != v15) {
        objc_enumerationMutation(obj);
      }
      id v18 = [objc_allocWithZone((Class)(v16 + 378)) initWithUIElement:*(void *)(*((void *)&v35 + 1) + 8 * i)];
      unsigned int v19 = [(VOTElement *)v10 window];
      uint64_t v20 = [v19 isolatedWindow];
      if (!v20)
      {

LABEL_17:
        [v32 addObject:v18];
        goto LABEL_19;
      }
      v21 = (void *)v20;
      uint64_t v22 = [(VOTElement *)v10 window];
      long long v23 = [v22 isolatedWindow];
      if (v23)
      {
        [(VOTElement *)v10 window];
        v25 = uint64_t v24 = v15;
        unsigned int v34 = [v25 windowContextId];
        [v18 window];
        v27 = id v26 = v14;
        unsigned int v33 = [v27 windowContextId];

        id v14 = v26;
        uint64_t v15 = v24;
        unsigned int v16 = &OBJC_IVAR___VOTHandwritingManager__allowedCharacterModes;

        id v10 = self;
        if (v34 == v33) {
          goto LABEL_17;
        }
      }
      else
      {
      }
LABEL_19:
    }
    id v14 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  }
  while (v14);
LABEL_21:

  return v32;
}

- (unint64_t)blockquoteLevel
{
  double v2 = [(UIElementProtocol *)self->_uiElement numberWithAXAttribute:2157];
  id v3 = [v2 unsignedIntegerValue];

  return (unint64_t)v3;
}

- (id)roleDescription
{
  return [(UIElementProtocol *)self->_uiElement stringWithAXAttribute:2077];
}

- (BOOL)suppressCustomActionHint
{
  return [(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:2103];
}

- (id)textInputElement
{
  return [(VOTElement *)self _elementForAttribute:2104 shouldUpdateCache:0];
}

- (_NSRange)textInputElementRange
{
  double v2 = [(VOTElement *)self uiElement];
  id v3 = [v2 rangeWithAXAttribute:2124];
  NSUInteger v5 = v4;

  NSUInteger v6 = (NSUInteger)v3;
  NSUInteger v7 = v5;
  result.NSUInteger length = v7;
  result.NSUInteger location = v6;
  return result;
}

- (BOOL)isEditableTextArea
{
  BOOL v3 = [(VOTElement *)self doesHaveTraits:kAXTextAreaTrait];
  if (v3) {
    LOBYTE(v3) = ![(VOTElement *)self doesHaveTraits:kAXStaticTextTrait];
  }
  return v3;
}

- (BOOL)brailleTextEntrySupported
{
  BOOL v3 = [(VOTElement *)self doesHaveAllTraits:kAXTextEntryTrait | kAXIsEditingTrait];
  if (v3) {
    LOBYTE(v3) = ![(VOTElement *)self shouldIgnoreTextEditingTrait];
  }
  return v3;
}

- (BOOL)doesHaveTraits:(unint64_t)a3
{
  return ([(VOTElement *)self traits] & a3) != 0;
}

- (BOOL)doesHaveAllTraits:(unint64_t)a3
{
  return (a3 & ~[(VOTElement *)self traits]) == 0;
}

- (BOOL)onlyHasTraits:(unint64_t)a3
{
  unint64_t v4 = [(VOTElement *)self traits] & a3;
  return v4 == [(VOTElement *)self traits];
}

- (BOOL)doesHaveTraitsForGesturedTextInput
{
  double v2 = [(VOTElement *)self elementForGesturedTextInput];
  BOOL v3 = v2 != 0;

  return v3;
}

- (unint64_t)traits
{
  double v2 = [(UIElementProtocol *)self->_uiElement numberWithAXAttribute:2004];
  id v3 = [v2 unsignedLongLongValue];

  return (unint64_t)v3;
}

- (BOOL)shouldIgnoreTextEditingTrait
{
  if (![(VOTElement *)self doesHaveTraits:kAXWebContentTrait])
  {
    LOBYTE(v3) = 0;
    goto LABEL_5;
  }
  unsigned int v3 = ![(VOTElement *)self isKeyboardActiveOrAttached];
  unint64_t v4 = [(VOTElement *)self remoteParent];

  if (!v4)
  {
LABEL_5:
    char v8 = 0;
    return v3 | v8;
  }
  NSUInteger v5 = [(VOTElement *)self application];
  NSUInteger v6 = [v5 firstResponderElementWithoutCache];
  unsigned __int8 v7 = [v6 isEqual:self];

  char v8 = v7 ^ 1;
  return v3 | v8;
}

- (void)scrollToElementForDirectional:(int64_t)a3 withCompletion:(id)a4
{
  id v5 = [a4 copy];
  char v8 = self;
  id v6 = v5;
  unsigned __int8 v7 = v8;
  AXPerformBlockOnMainThreadAfterDelay();
}

- (void)incrementAction
{
}

- (void)setGesturePracticeInfo:(id)a3
{
}

- (void)decrementAction
{
}

- (void)zoomInAtLocation:(CGPoint)a3
{
  uiElement = self->_uiElement;
  +[NSValue valueWithPoint:](NSValue, "valueWithPoint:", a3.x, a3.y);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(UIElementProtocol *)uiElement performAXAction:2001 withValue:v4];
}

- (id)imageOverlayElements
{
  return [(VOTElement *)self elementsForAttribute:2080];
}

- (id)photoDescription
{
  return [(UIElementProtocol *)self->_uiElement stringWithAXAttribute:2058];
}

- (BOOL)isMapItem
{
  return [(VOTElement *)self mapFeatureType] != 0;
}

- (int64_t)mapFeatureType
{
  double v2 = [(UIElementProtocol *)self->_uiElement numberWithAXAttribute:2048];
  int64_t v3 = (int)[v2 intValue];

  return v3;
}

- (id)mapDetailedInformationAtPoint:(CGPoint)a3
{
  uiElement = self->_uiElement;
  id v4 = +[NSValue valueWithPoint:](NSValue, "valueWithPoint:", a3.x, a3.y);

  return [(UIElementProtocol *)uiElement objectWithAXAttribute:95219 parameter:v4];
}

- (BOOL)lastHitTestNearBorder
{
  [(UIElementProtocol *)self->_uiElement updateCache:2049];
  uiElement = self->_uiElement;

  return [(UIElementProtocol *)uiElement BOOLWithAXAttribute:2049];
}

- (float)distanceToOtherRoad:(CGPoint)a3 withDirection:(float)a4 otherRoad:(id)a5
{
  CGPoint v17 = a3;
  id v7 = a5;
  AXValueRef v8 = AXValueCreate(kAXValueTypeCGPoint, &v17);
  uiElement = self->_uiElement;
  *(float *)&double v10 = a4;
  uint64_t v11 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v10, *(void *)&v17.x, *(void *)&v17.y, v8);
  v18[1] = v11;
  unsigned int v12 = [v7 uiElement];

  v18[2] = [v12 axElement];
  id v13 = [(UIElementProtocol *)uiElement objectWithAXAttribute:95220 parameter:+[NSArray arrayWithObjects:v18 count:3]];

  if (v8) {
    CFRelease(v8);
  }
  objc_opt_class();
  float v14 = -1.0;
  if (objc_opt_isKindOfClass())
  {
    [v13 floatValue];
    float v14 = v15;
  }

  return v14;
}

- (float)distanceToEndOfRoad:(CGPoint)a3 withDirection:(float)a4
{
  CGPoint valuePtr = a3;
  AXValueRef v6 = AXValueCreate(kAXValueTypeCGPoint, &valuePtr);
  uiElement = self->_uiElement;
  v15[0] = v6;
  *(float *)&double v8 = a4;
  uint64_t v9 = +[NSNumber numberWithFloat:v8];
  v15[1] = v9;
  double v10 = [(UIElementProtocol *)uiElement objectWithAXAttribute:95220 parameter:+[NSArray arrayWithObjects:v15 count:2]];

  if (v6) {
    CFRelease(v6);
  }
  objc_opt_class();
  float v11 = -1.0;
  if (objc_opt_isKindOfClass())
  {
    [v10 floatValue];
    float v11 = v12;
  }

  return v11;
}

- (id)upcomingRoadsAtPoint:(CGPoint)a3 withDirection:(float)a4
{
  CGPoint valuePtr = a3;
  AXValueRef v6 = AXValueCreate(kAXValueTypeCGPoint, &valuePtr);
  uiElement = self->_uiElement;
  v25[0] = v6;
  *(float *)&double v8 = a4;
  uint64_t v9 = +[NSNumber numberWithFloat:v8];
  v25[1] = v9;
  double v10 = [(UIElementProtocol *)uiElement uiElementsWithAttribute:95217 parameter:+[NSArray arrayWithObjects:v25 count:2]];

  if (v6) {
    CFRelease(v6);
  }
  float v11 = +[NSMutableArray array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v12 = v10;
  id v13 = [v12 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        CGPoint v17 = +[VOTElement elementWithUIElement:](VOTElement, "elementWithUIElement:", *(void *)(*((void *)&v19 + 1) + 8 * i), (void)v19);
        [v11 axSafelyAddObject:v17];
      }
      id v14 = [v12 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v14);
  }

  return v11;
}

- (void)mapsExplorationRecordTouchpoint:(CGPoint)a3
{
  uiElement = self->_uiElement;
  +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", a3.x, a3.y);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(UIElementProtocol *)uiElement performAXAction:4023 withValue:v4];
}

- (void)mapsExplorationBeginFromCurrentElement:(BOOL)a3
{
  if (a3) {
    [(UIElementProtocol *)self->_uiElement performAXAction:4020];
  }
}

- (void)mapsExplorationContinueWithVertexIndex:(unint64_t)a3
{
  uiElement = self->_uiElement;
  id v4 = +[NSNumber numberWithUnsignedInteger:a3];
  [(UIElementProtocol *)uiElement performAXAction:4021 withValue:v4];
}

- (void)mapsExplorationEnd
{
}

- (BOOL)mapsExplorationIsActive
{
  return [(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:2506];
}

- (BOOL)mapsExplorationIsPending
{
  return [(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:2507];
}

- (id)mapsExplorationCurrentRoadsWithAngles
{
  return [(UIElementProtocol *)self->_uiElement arrayWithAXAttribute:2501];
}

- (CGPoint)mapsExplorationCurrentLocation
{
  [(UIElementProtocol *)self->_uiElement pointWithAXAttribute:2502];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (id)mapsExplorationCurrentIntersectionDescription
{
  return [(UIElementProtocol *)self->_uiElement stringWithAXAttribute:2503];
}

- (id)mapsExplorationChangeVerbosity:(BOOL)a3
{
  uiElement = self->_uiElement;
  if (a3) {
    uint64_t v4 = 2504;
  }
  else {
    uint64_t v4 = 2505;
  }
  return [(UIElementProtocol *)uiElement stringWithAXAttribute:v4];
}

- (BOOL)roadContainsTrackingPoint:(CGPoint)a3
{
  CGPoint v8 = a3;
  AXValueRef v4 = AXValueCreate(kAXValueTypeCGPoint, &v8);
  id v5 = [(UIElementProtocol *)self->_uiElement objectWithAXAttribute:95218 parameter:v4];
  unsigned __int8 v6 = [v5 BOOLValue];

  if (v4) {
    CFRelease(v4);
  }
  return v6;
}

- (void)zoomOutAtLocation:(CGPoint)a3
{
  uiElement = self->_uiElement;
  +[NSValue valueWithPoint:](NSValue, "valueWithPoint:", a3.x, a3.y);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(UIElementProtocol *)uiElement performAXAction:2002 withValue:v4];
}

- (void)decreaseTrackingDetail
{
}

- (void)increaseTrackingDetail
{
}

- (id)textOperationsOperator
{
  return [(VOTElement *)self elementForAttribute:2011];
}

- (id)textOperations
{
  [(UIElementProtocol *)self->_uiElement updateCache:2010];
  uiElement = self->_uiElement;

  return [(UIElementProtocol *)uiElement objectWithAXAttribute:2010];
}

- (void)performTextOperation:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:kAXTextOperationActionPaste])
  {
    id v5 = +[UIPasteboard generalPasteboard];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10001AE94;
    v6[3] = &unk_1001B3710;
    v6[4] = self;
    objc_msgSend(v5, "_requestSecurePasteAuthenticationMessageWithContext:forClientVersionedPID:completionBlock:", 0x95DD33C9595B8B0ALL, -[VOTElement versionedPID](self, "versionedPID"), v6);
  }
  else
  {
    [(UIElementProtocol *)self->_uiElement performAXAction:2012 withValue:v4];
  }
}

- (CGPoint)elementFrameLocation:(int)a3
{
  double x = CGPointZero.x;
  double y = CGPointZero.y;
  [(VOTElement *)self frame];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  uint64_t v15 = +[VOTElement systemWideElement];
  objc_msgSend(v15, "convertRect:fromContextId:", -[VOTElement windowContextId](self, "windowContextId"), v8, v10, v12, v14);
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;

  id v24 = [(id)VOTSharedWorkspace deviceOrientation];
  if (v24 == (id)2)
  {
    switch(a3)
    {
      case 1:
        v34.origin.double x = v17;
        v34.origin.double y = v19;
        v34.size.width = v21;
        v34.size.height = v23;
        double x = CGRectGetMidX(v34);
        v35.origin.double x = v17;
        v35.origin.double y = v19;
        v35.size.width = v21;
        v35.size.height = v23;
        double MinY = CGRectGetMinY(v35);
        goto LABEL_20;
      case 2:
        v46.origin.double x = v17;
        v46.origin.double y = v19;
        v46.size.width = v21;
        v46.size.height = v23;
        double x = CGRectGetMidX(v46);
        v47.origin.double x = v17;
        v47.origin.double y = v19;
        v47.size.width = v21;
        v47.size.height = v23;
        double MinY = CGRectGetMaxY(v47);
        goto LABEL_20;
      case 3:
LABEL_16:
        v43.origin.double x = v17;
        v43.origin.double y = v19;
        v43.size.width = v21;
        v43.size.height = v23;
        double MaxX = CGRectGetMaxX(v43);
        double v30 = -3.0;
        goto LABEL_18;
      case 4:
LABEL_17:
        v44.origin.double x = v17;
        v44.origin.double y = v19;
        v44.size.width = v21;
        v44.size.height = v23;
        double MaxX = CGRectGetMinX(v44);
        double v30 = 3.0;
LABEL_18:
        double x = MaxX + v30;
        goto LABEL_19;
      case 5:
LABEL_11:
        v39.origin.double x = v17;
        v39.origin.double y = v19;
        v39.size.width = v21;
        v39.size.height = v23;
        double MidX = CGRectGetMidX(v39);
LABEL_15:
        double x = MidX;
LABEL_19:
        v45.origin.double x = v17;
        v45.origin.double y = v19;
        v45.size.width = v21;
        v45.size.height = v23;
        double MinY = CGRectGetMidY(v45);
LABEL_20:
        double y = MinY;
        break;
      default:
        break;
    }
  }
  else if (v24 == (id)4)
  {
    switch(a3)
    {
      case 1:
LABEL_8:
        v36.origin.double x = v17;
        v36.origin.double y = v19;
        v36.size.width = v21;
        v36.size.height = v23;
        double MidX = CGRectGetMaxX(v36);
        goto LABEL_15;
      case 2:
LABEL_14:
        v42.origin.double x = v17;
        v42.origin.double y = v19;
        v42.size.width = v21;
        v42.size.height = v23;
        double MidX = CGRectGetMinX(v42);
        goto LABEL_15;
      case 3:
LABEL_10:
        v37.origin.double x = v17;
        v37.origin.double y = v19;
        v37.size.width = v21;
        v37.size.height = v23;
        double x = CGRectGetMidX(v37);
        v38.origin.double x = v17;
        v38.origin.double y = v19;
        v38.size.width = v21;
        v38.size.height = v23;
        double MaxY = CGRectGetMaxY(v38);
        double v28 = -3.0;
        goto LABEL_13;
      case 4:
LABEL_12:
        v40.origin.double x = v17;
        v40.origin.double y = v19;
        v40.size.width = v21;
        v40.size.height = v23;
        double x = CGRectGetMidX(v40);
        v41.origin.double x = v17;
        v41.origin.double y = v19;
        v41.size.width = v21;
        v41.size.height = v23;
        double MaxY = CGRectGetMinY(v41);
        double v28 = 3.0;
LABEL_13:
        double y = MaxY + v28;
        break;
      case 5:
        goto LABEL_11;
      default:
        break;
    }
  }
  else if (v24 == (id)3)
  {
    switch(a3)
    {
      case 1:
        goto LABEL_14;
      case 2:
        goto LABEL_8;
      case 3:
        goto LABEL_12;
      case 4:
        goto LABEL_10;
      case 5:
        goto LABEL_11;
      default:
        break;
    }
  }
  else
  {
    switch(a3)
    {
      case 1:
        goto LABEL_10;
      case 2:
        goto LABEL_12;
      case 3:
        goto LABEL_17;
      case 4:
        goto LABEL_16;
      case 5:
        goto LABEL_11;
      default:
        break;
    }
  }
  double v31 = x;
  double v32 = y;
  result.double y = v32;
  result.double x = v31;
  return result;
}

- (BOOL)performEscape
{
  uint64_t v5 = 0;
  unsigned __int8 v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001B2FC;
  v4[3] = &unk_1001B3678;
  v4[4] = &v5;
  [(VOTElement *)self _iterateSelfAndRemoteParentsUsingBlock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)findSearchResult:(BOOL)a3 withSearchText:(id)a4
{
  uint64_t v5 = &kCFBooleanFalse;
  if (a3) {
    uint64_t v5 = &kCFBooleanTrue;
  }
  +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", *v5, a4, 0);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(UIElementProtocol *)self->_uiElement performAXAction:2017 withValue:v6];
}

- (BOOL)supportsActivate
{
  if ([(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:2019]) {
    return 1;
  }
  if (![(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:2101]) {
    return 0;
  }
  id v4 = [(VOTElement *)self remoteParent];
  uint64_t v5 = v4;
  if (v4) {
    unsigned __int8 v3 = [v4 supportsActivate];
  }
  else {
    unsigned __int8 v3 = 0;
  }

  return v3;
}

- (BOOL)supportsSecondaryActivate
{
  return [(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:2079];
}

- (BOOL)verifyElementExists:(CGPoint *)a3
{
  [(VOTElement *)self centerPoint];
  double v6 = v5;
  double v8 = v7;
  uint64_t v9 = [(VOTElement *)self windowContextId];
  if (v9)
  {
    double v10 = +[VOTElement systemWideElement];
    objc_msgSend(v10, "convertPoint:fromContextId:", v9, v6, v8);
    double v6 = v11;
    double v8 = v12;
  }
  double v13 = 1.0;
  double v14 = 1.0;
  if (v6 > 0.0)
  {
    double v14 = v6;
    if (v6 >= *(double *)&xmmword_1001EBE30) {
      double v14 = *(double *)&xmmword_1001EBE30 + -1.0;
    }
  }
  if (v8 > 0.0)
  {
    double v13 = v8;
    if (v8 >= *((double *)&xmmword_1001EBE30 + 1)) {
      double v13 = *((double *)&xmmword_1001EBE30 + 1) + -1.0;
    }
  }
  if (v9)
  {
    uint64_t v15 = +[VOTElement systemWideElement];
    objc_msgSend(v15, "convertPoint:toContextId:", v9, v14, v13);
    double v17 = v16;
    double v19 = v18;

    double v20 = v14;
    double v21 = v13;
    double v13 = v19;
    double v14 = v17;
  }
  else
  {
    double v20 = v14;
    double v21 = v13;
  }
  double v22 = (VOTElement *)objc_msgSend(objc_allocWithZone((Class)VOTElement), "initWithPosition:", v20, v21);
  if (_AXSZoomTouchEnabled())
  {
    CGFloat v23 = [(VOTElement *)v22 application];
    id v24 = v23;
    if (v22)
    {
      if ([v23 isAccessibilitySystemUIServer])
      {
        long long v25 = [(VOTElement *)self application];
        unsigned __int8 v26 = [v25 isEqual:v24];

        if ((v26 & 1) == 0)
        {
          int64_t v27 = [VOTElement alloc];
          double v28 = [(VOTElement *)self application];
          v29 = -[VOTElement initWithPosition:application:contextId:](v27, "initWithPosition:application:contextId:", v28, [(VOTElement *)self windowContextId], v20, v21);

          double v22 = v29;
        }
      }
    }
    else
    {
      double v22 = self;
    }
  }
  if (_AXSAssistiveTouchEnabled())
  {
    double v30 = [(VOTElement *)v22 application];
    unsigned int v31 = [v30 isAssistiveTouch];

    if (v31)
    {
      if (!a3) {
        goto LABEL_39;
      }
      goto LABEL_38;
    }
  }
  if (![(VOTElement *)v22 isEqual:self])
  {
    [(VOTElement *)self elementFrameLocation:2];
    double v14 = v33;
    double v13 = v34;
    double v35 = v34;
    double v36 = v33;
    if (v9)
    {
      CGRect v37 = +[VOTElement systemWideElement];
      objc_msgSend(v37, "convertPoint:fromContextId:", v9, v14, v13);
      double v36 = v38;
      double v35 = v39;
    }
    CGRect v40 = (VOTElement *)objc_msgSend(objc_allocWithZone((Class)VOTElement), "initWithPosition:", v36, v35);

    if ([(VOTElement *)v40 isEqual:self])
    {
      unsigned int v32 = 1;
      double v22 = v40;
      if (!a3) {
        goto LABEL_40;
      }
      goto LABEL_37;
    }
    [(VOTElement *)self elementFrameLocation:1];
    double v14 = v41;
    double v13 = v42;
    double v43 = v42;
    double v44 = v41;
    if (v9)
    {
      CGRect v45 = +[VOTElement systemWideElement];
      objc_msgSend(v45, "convertPoint:fromContextId:", v9, v14, v13);
      double v44 = v46;
      double v43 = v47;
    }
    double v22 = (VOTElement *)objc_msgSend(objc_allocWithZone((Class)VOTElement), "initWithPosition:", v44, v43);

    if (![(VOTElement *)v22 isEqual:self])
    {
      [(VOTElement *)self visiblePoint];
      double v14 = v48;
      double v13 = v49;
      double v50 = v49;
      double v51 = v48;
      if (v9)
      {
        v52 = +[VOTElement systemWideElement];
        objc_msgSend(v52, "convertPoint:fromContextId:", v9, v14, v13);
        double v51 = v53;
        double v50 = v54;
      }
      v55 = (VOTElement *)objc_msgSend(objc_allocWithZone((Class)VOTElement), "initWithPosition:", v51, v50);

      unsigned int v32 = [(VOTElement *)v55 isEqual:self];
      double v22 = v55;
      if (!a3) {
        goto LABEL_40;
      }
      goto LABEL_37;
    }
  }
  unsigned int v32 = 1;
  if (!a3) {
    goto LABEL_40;
  }
LABEL_37:
  if (v32)
  {
LABEL_38:
    a3->double x = v14;
    a3->double y = v13;
LABEL_39:
    LOBYTE(v32) = 1;
  }
LABEL_40:

  return v32;
}

- (id)resolvedEditingStyles
{
  [(UIElementProtocol *)self->_uiElement updateCache:2215];
  unsigned __int8 v3 = [(UIElementProtocol *)self->_uiElement objectWithAXAttribute:2215];
  id v4 = __UIAccessibilitySafeClass();

  return v4;
}

- (BOOL)performTapAtPoint:(CGPoint)a3 withForce:(double)a4 playSound:(BOOL)a5
{
  double y = a3.y;
  double x = a3.x;
  if (a5)
  {
    uint64_t v9 = +[VOTOutputManager outputManager];
    double v10 = +[VOSOutputEvent DidActivateElement];
    [v9 sendEvent:v10];
  }
  double v11 = +[VOTElement systemWideElement];
  objc_msgSend(v11, "convertPoint:toContextId:", -[VOTElement windowContextId](self, "windowContextId"), x, y);
  double v13 = v12;
  double v15 = v14;

  double v16 = +[VOTElement systemWideElement];
  uint64_t v17 = [(VOTElement *)self windowContextIdForPress];
  LODWORD(v18) = 1028443341;
  unsigned __int8 v19 = objc_msgSend(v16, "performSimpleTapAtPoint:withForce:withContextId:withDelay:forElement:", v17, self, v13, v15, a4, v18);

  return v19;
}

- (BOOL)allowsAutoAlternativeCharacterActivation
{
  return [(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:2073];
}

- (void)performDoubleTap
{
  [(UIElementProtocol *)self->_uiElement updateCache:2079];
  if ([(VOTElement *)self supportsSecondaryActivate])
  {
    uiElement = self->_uiElement;
    [(UIElementProtocol *)uiElement performAXAction:2036];
  }
}

- (BOOL)performSimpleTap
{
  return [(VOTElement *)self performSimpleTap:0];
}

- (BOOL)activateIfSupported
{
  [(UIElementProtocol *)self->_uiElement updateCache:2019];
  if (![(VOTElement *)self supportsActivate]) {
    return 0;
  }
  if ([(VOTElement *)self _attemptPerformActivateActionWithElement:self->_uiElement])
  {
    return 1;
  }
  if (![(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:2101]) {
    return 0;
  }
  id v4 = [(VOTElement *)self remoteParent];
  double v5 = v4;
  if (v4 && [v4 supportsActivate])
  {
    double v6 = [v5 uiElement];
    BOOL v3 = [(VOTElement *)self _attemptPerformActivateActionWithElement:v6];
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (BOOL)performSimpleTap:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = VOTLogSimpleTap();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10011C454();
  }

  if (AXDeviceIsPad())
  {
    double v6 = [(VOTElement *)self application];
    unsigned __int8 v7 = [v6 isSpringBoard];

    if ((v7 & 1) == 0) {
      AXPerformBlockOnMainThreadAfterDelay();
    }
  }
  if (AXDeviceHasJindo() && ![(VOTElement *)self isInJindoWindow]) {
    AXPerformBlockOnMainThreadAfterDelay();
  }
  uint64_t v8 = kAXWebContentTrait;
  if ([(VOTElement *)self doesHaveTraits:kAXWebContentTrait]
    && [(VOTElement *)self isSafariScribbleActive]
    && [(VOTElement *)self scribbleRotorActive])
  {
    uint64_t v9 = [(VOTElement *)self application];
    unsigned __int8 v10 = [v9 performScribbleAction];

    return v10;
  }
  if ([(VOTElement *)self doesHaveTraits:v8]
    && [(VOTElement *)self isSafariScribbleActive])
  {
    return 0;
  }
  if (([(VOTElement *)self directTouchOptions] & 2) != 0
    && ![(VOTElement *)self activatedDirectTouchThatRequiredActivation])
  {
    double v12 = +[VOTOutputManager outputManager];
    double v13 = +[VOSOutputEvent DidActivateElement];
    [v12 sendEvent:v13];

    double v14 = sub_100051804(off_1001EA9E8, @"activated.direct.touch", 0);
    double v15 = [(id)VOTSharedWorkspace selectedLanguage];
    id v16 = sub_10000ABF8(v14, 0, v15);

    unsigned __int8 v10 = 1;
    [(VOTElement *)self setActivatedDirectTouchThatRequiredActivation:1];
    return v10;
  }
  if ([(VOTElement *)self canExpandMathEquation])
  {
    [(VOTElement *)self expandMathEquation];
    return 0;
  }
  uint64_t v11 = kAXTextEntryTrait;
  if ([(VOTElement *)self doesHaveAllTraits:kAXTextEntryTrait | kAXNotEnabledTrait]) {
    return 0;
  }
  if (![(VOTElement *)self activateIfSupported])
  {
    [(VOTElement *)self centerPoint];
    CGFloat v27 = v26;
    CGFloat v29 = v28;
    v80.double x = v26;
    v80.double y = v28;
    id v30 = [(VOTElement *)self indexPathAsRange];
    uint64_t v32 = v31;
    double v33 = VOTLogSimpleTap();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      v84.double x = v27;
      v84.double y = v29;
      v72 = NSStringFromCGPoint(v84);
      v82.NSUInteger location = (NSUInteger)[(VOTElement *)self indexPathAsRange];
      v73 = NSStringFromRange(v82);
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v72;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v73;
      _os_log_debug_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "Old center point(%@) %@", buf, 0x16u);
    }
    [(VOTElement *)self updateCenterPoint];
    [(UIElementProtocol *)self->_uiElement updateCache:2078];
    [(VOTElement *)self centerPoint];
    double v35 = v34;
    double v37 = v36;
    id v38 = [(VOTElement *)self indexPathAsRange];
    uint64_t v40 = v39;
    double v41 = VOTLogSimpleTap();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
    {
      v85.double x = v35;
      v85.double y = v37;
      v74 = NSStringFromCGPoint(v85);
      v83.NSUInteger location = (NSUInteger)[(VOTElement *)self indexPathAsRange];
      v75 = NSStringFromRange(v83);
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v74;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v75;
      _os_log_debug_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEBUG, "NEW center point(%@) %@", buf, 0x16u);
    }
    if (v30 != v38 || v32 != v40)
    {
      double v42 = VOTLogSimpleTap();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
        sub_10011C420();
      }

      double v43 = [(VOTElement *)self parentTableOrCollectionView];
      double v44 = VOTLogSimpleTap();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG)) {
        sub_10011C3B8();
      }

      if (v43)
      {
        CGRect v45 = [v43 elementAtRow:v30 andColumn:v32];
        double v46 = VOTLogSimpleTap();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG)) {
          sub_10011C350();
        }

        if (![v45 isEqual:self])
        {
          unsigned __int8 v10 = [v45 performSimpleTap:v3];

          return v10;
        }
      }
    }
    uint64_t v47 = [(VOTElement *)self windowContextIdForPress];
    v79.double x = v35;
    v79.double y = v37;
    if (v47)
    {
      double v48 = +[VOTElement systemWideElement];
      objc_msgSend(v48, "convertPoint:fromContextId:", v47, v35, v37);
      double v35 = v49;
      double v37 = v50;
    }
    double v51 = VOTLogSimpleTap();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG)) {
      sub_10011C2B4(&v79, (uint64_t)&v79.y, v51);
    }

    unsigned int v52 = [(VOTElement *)self verifyElementExists:&v79];
    double v53 = VOTLogSimpleTap();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
    {
      v76 = NSStringFromCGPoint(v79);
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&buf[4] = v52;
      *(_WORD *)&buf[8] = 2112;
      *(void *)&buf[10] = v76;
      _os_log_debug_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEBUG, "Is same element: %i.  Updated dispatch point: %@", buf, 0x12u);
    }
    if (sub_100050E64() && [(VOTElement *)self isTouchContainer])
    {
      double v54 = VOTLogSimpleTap();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG)) {
        sub_10011C280();
      }

      unsigned int v55 = [(UIElementProtocol *)self->_uiElement performAXAction:2010];
      v56 = VOTLogSimpleTap();
      BOOL v57 = os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG);
      if (v55)
      {
        if (v57) {
          sub_10011C1B0();
        }
        unsigned __int8 v10 = 1;
        goto LABEL_89;
      }
      if (v57) {
        sub_10011C24C();
      }
    }
    if ([(VOTElement *)self doesHaveAllTraits:kAXIsEditingTrait | v11]
      && ![(VOTElement *)self shouldIgnoreTextEditingTrait])
    {
      v62 = VOTLogSimpleTap();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG)) {
        sub_10011C218();
      }

      unsigned __int8 v10 = 0;
      goto LABEL_87;
    }
    [(VOTElement *)self activationDelay];
    float v59 = v58;
    if ([(VOTElement *)self tapHostContextId])
    {
      v79.double x = v35;
      v79.double y = v37;
      uint64_t v47 = [(VOTElement *)self windowContextIdImmediateRemoteParent:v47];
    }
    else if ((v52 & 1) == 0)
    {
      if ([(VOTElement *)self verifyElementExists:&v80])
      {
        v60 = VOTLogSimpleTap();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG)) {
          sub_10011C1E4();
        }

        CGPoint v61 = v80;
      }
      else
      {
        [(VOTElement *)self visiblePoint];
        *(void *)buf = v63;
        *(void *)&buf[8] = v64;
        [(VOTElement *)self updateVisiblePoint];
        [(VOTElement *)self visiblePoint];
        v78.double x = v65;
        v78.double y = v66;
        if ([(VOTElement *)self verifyElementExists:&v78]) {
          CGPoint v79 = v78;
        }
        if (![(VOTElement *)self verifyElementExists:buf]) {
          goto LABEL_83;
        }
        CGPoint v61 = *(CGPoint *)buf;
      }
      CGPoint v79 = v61;
    }
LABEL_83:
    v67 = +[VOTElement systemWideElement];
    *(float *)&double v68 = v59;
    unsigned __int8 v10 = [v67 performSimpleTapAtPoint:v47 withForce:self withContextId:v79 withDelay:0.0 forElement:v68];

    v69 = VOTLogSimpleTap();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
    {
      v77 = NSStringFromCGPoint(v79);
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = v77;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v47;
      *(_WORD *)&buf[18] = 2048;
      *(double *)&buf[20] = v59;
      _os_log_debug_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEBUG, "Performed simple tap at dispatch point %@, context id %u, delay %1.1f .", buf, 0x1Cu);
    }
    if ([(VOTElement *)self doesHaveTraits:v11])
    {
      +[NSThread sleepForTimeInterval:0.5];
      [(VOTElement *)self updateFrame];
      [(VOTElement *)self updateCenterPoint];
      [(VOTElement *)self updateTraits];
      [(VOTElement *)self updateCustomPublicRotors];
    }
LABEL_87:
    if ([(VOTElement *)self doesHaveTraits:kAXPlaysSoundTrait]) {
      return v10;
    }
    v56 = +[VOTOutputManager outputManager];
    v70 = +[VOSOutputEvent DidActivateElement];
    [v56 sendEvent:v70];

LABEL_89:
    return v10;
  }
  [(VOTElement *)self updateFrame];
  uint64_t v17 = +[AXSubsystemVoiceOver sharedInstance];
  unsigned __int8 v18 = [v17 ignoreLogging];

  if ((v18 & 1) == 0)
  {
    unsigned __int8 v19 = +[AXSubsystemVoiceOver identifier];
    double v20 = AXLoggerForFacility();

    os_log_type_t v21 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v20, v21))
    {
      double v22 = AXColorizeFormatLog();
      CGFloat v23 = _AXStringForArgs();
      if (os_log_type_enabled(v20, v21))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v23;
        _os_log_impl((void *)&_mh_execute_header, v20, v21, "%{public}@", buf, 0xCu);
      }
    }
  }
  if (![(VOTElement *)self doesHaveTraits:kAXPlaysSoundTrait])
  {
    id v24 = +[VOTOutputManager outputManager];
    long long v25 = +[VOSOutputEvent DidActivateElement];
    [v24 sendEvent:v25];
  }
  return 1;
}

- (int64_t)temporaryVoiceOverStatus
{
  char v2 = [(UIElementProtocol *)self->_uiElement numberWithAXAttribute:5067];
  id v3 = [v2 integerValue];

  return (int64_t)v3;
}

- (void)setTemporaryVoiceOverStatus:(int64_t)a3
{
  uiElement = self->_uiElement;
  id v4 = +[NSNumber numberWithLong:a3];
  [(UIElementProtocol *)uiElement setAXAttribute:5067 withNumber:v4];
}

- (BOOL)_attemptPerformActivateActionWithElement:(id)a3
{
  id v4 = a3;
  uint64_t v5 = kAXWebContentTrait;
  unsigned int v6 = [(VOTElement *)self doesHaveAllTraits:kAXLinkTrait | kAXWebContentTrait];
  if (![(VOTElement *)self doesHaveTraits:v5])
  {
    unsigned __int8 v8 = [v4 performAXAction:2010];
    goto LABEL_13;
  }
  if ([(VOTElement *)self isComboBox])
  {
    unsigned __int8 v7 = VOTLogSimpleTap();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_10011C4BC();
    }
LABEL_24:

    unsigned __int8 v8 = 0;
    goto LABEL_25;
  }
  uint64_t v9 = [(VOTElement *)self uiElement];
  AXUIElementSetMessagingTimeout((AXUIElementRef)[v9 axElement], 0.25);

  if ([v4 performAXAction:2010]) {
    goto LABEL_11;
  }
  if (AXUIElementLastGlobalError() == -25216)
  {
    unsigned __int8 v10 = VOTLogSimpleTap();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Web element timed out trying to activate, assuming that we got blocked on modal alert and moving on", v16, 2u);
    }

LABEL_11:
    unsigned __int8 v8 = 1;
    goto LABEL_13;
  }
  unsigned __int8 v8 = 0;
LABEL_13:
  uint64_t v11 = VOTLogSimpleTap();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_10011C558(v8, v11);
  }

  if ([(VOTElement *)self doesHaveTraits:kAXTextEntryTrait])
  {
    +[NSThread sleepForTimeInterval:0.5];
    [(VOTElement *)self updateTraits];
    if (![(VOTElement *)self doesHaveTraits:kAXIsEditingTrait])
    {
      double v12 = VOTLogSimpleTap();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        sub_10011C524();
      }

      unsigned __int8 v8 = 0;
    }
  }
  if (v6)
  {
    +[NSThread sleepForTimeInterval:0.25];
    double v13 = [(VOTElement *)self application];
    unsigned int v14 = [(VOTElement *)self isValidForApplication:v13];

    if (v14)
    {
      unsigned __int8 v7 = VOTLogSimpleTap();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        sub_10011C4F0();
      }
      goto LABEL_24;
    }
  }
LABEL_25:

  return v8;
}

- (double)minValue
{
  char v2 = [(UIElementProtocol *)self->_uiElement numberWithAXAttribute:5005];
  [v2 floatValue];
  double v4 = v3;

  return v4;
}

- (double)maxValue
{
  char v2 = [(UIElementProtocol *)self->_uiElement numberWithAXAttribute:5006];
  [v2 floatValue];
  double v4 = v3;

  return v4;
}

- (double)absoluteValue
{
  [(UIElementProtocol *)self->_uiElement updateCache:5011];
  float v3 = [(UIElementProtocol *)self->_uiElement numberWithAXAttribute:5011];
  [v3 floatValue];
  double v5 = v4;

  return v5;
}

- (id)remoteParent
{
  char v2 = self;
  objc_sync_enter(v2);
  float v3 = [(VOTElement *)v2 cachedRemoteParent];
  if (v3)
  {
  }
  else if (![(VOTElement *)v2 checkedRemoteParent])
  {
    float v4 = [(VOTElement *)v2 _elementForAttribute:2092 shouldUpdateCache:0 shouldFetchAttributes:0];
    [(VOTElement *)v2 setCachedRemoteParent:v4];

    [(VOTElement *)v2 setCheckedRemoteParent:1];
  }
  objc_sync_exit(v2);

  return [(VOTElement *)v2 cachedRemoteParent];
}

- (BOOL)remoteParentIsViewHost
{
  return [(UIElementProtocol *)self->_uiElement isMLElement] ^ 1;
}

- (id)textualContext
{
  return [(UIElementProtocol *)self->_uiElement stringWithAXAttribute:2193];
}

- (id)immediateRemoteParent
{
  char v2 = self;
  objc_sync_enter(v2);
  float v3 = [(VOTElement *)v2 cachedImmediateRemoteParent];
  if (v3)
  {
  }
  else if (![(VOTElement *)v2 checkedImmediateRemoteParent])
  {
    float v4 = [(VOTElement *)v2 _elementForAttribute:2310 shouldUpdateCache:0 shouldFetchAttributes:0];
    [(VOTElement *)v2 setCachedImmediateRemoteParent:v4];

    [(VOTElement *)v2 setCheckedImmediateRemoteParent:1];
  }
  objc_sync_exit(v2);

  return [(VOTElement *)v2 cachedImmediateRemoteParent];
}

- (void)_iterateSelfAndRemoteParentsUsingBlock:(id)a3
{
  float v4 = (void (**)(id, void *, unsigned char *))a3;
  char v8 = 0;
  double v5 = self;
  if (v5)
  {
    unsigned int v6 = v5;
    while (1)
    {
      v4[2](v4, v6, &v8);
      if (v8) {
        break;
      }
      unsigned __int8 v7 = [(VOTElement *)v6 immediateRemoteParent];
      if ([(VOTElement *)v7 isEqual:v6])
      {

        break;
      }

      if (!v8)
      {
        unsigned int v6 = v7;
        if (v7) {
          continue;
        }
      }
      goto LABEL_10;
    }
    unsigned __int8 v7 = v6;
LABEL_10:
  }
}

- (BOOL)_scrollForAction:(int)a3
{
  uint64_t v7 = 0;
  char v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001CCBC;
  v5[3] = &unk_1001B3778;
  v5[4] = &v7;
  int v6 = a3;
  [(VOTElement *)self _iterateSelfAndRemoteParentsUsingBlock:v5];
  char v3 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v3;
}

- (BOOL)scrollToTop
{
  return [(VOTElement *)self _scrollForAction:2068];
}

- (BOOL)scrollToBottom
{
  return [(VOTElement *)self _scrollForAction:2069];
}

- (void)scrollUpPage
{
}

- (void)scrollDownPage
{
}

- (void)scrollRightPage
{
}

- (void)scrollLeftPage
{
}

- (BOOL)scrollNextPage
{
  return [(VOTElement *)self _scrollForAction:2019];
}

- (BOOL)scrollPreviousPage
{
  return [(VOTElement *)self _scrollForAction:2020];
}

- (void)scrollToPoint:(CGPoint)a3
{
  uiElement = self->_uiElement;
  +[NSValue valueWithPoint:](NSValue, "valueWithPoint:", a3.x, a3.y);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(UIElementProtocol *)uiElement performAXAction:2014 withValue:v4];
}

- (void)scrollRectToVisible:(CGRect)a3 withCompletion:(id)a4
{
  id v5 = [a4 copy];
  id v4 = v5;
  AXPerformBlockOnMainThreadAfterDelay();
}

- (id)scrollStatus
{
  [(UIElementProtocol *)self->_uiElement updateCache:2009];
  uiElement = self->_uiElement;

  return [(UIElementProtocol *)uiElement stringWithAXAttribute:2009];
}

- (BOOL)showsDualPages
{
  [(UIElementProtocol *)self->_uiElement updateCache:2304];
  uiElement = self->_uiElement;

  return [(UIElementProtocol *)uiElement BOOLWithAXAttribute:2304];
}

- (BOOL)readingContentCausesPageTurn
{
  unint64_t v2 = [(VOTElement *)self traits];
  return (kAXCausesPageTurnTrait & ~v2) == 0;
}

- (id)firstVisibleElementInList
{
  return [(VOTElement *)self elementForAttribute:2013];
}

- (id)firstResponderElement
{
  unint64_t v2 = [(VOTElement *)self elementForAttribute:3002];
  if ([v2 isRemoteElement])
  {
    uint64_t v3 = [v2 elementForAttribute:3002];

    unint64_t v2 = (void *)v3;
  }
  if ([v2 isRemoteElement]) {
    id v4 = 0;
  }
  else {
    id v4 = v2;
  }
  id v5 = v4;

  return v5;
}

- (id)firstResponderElementWithoutCache
{
  unint64_t v2 = [(VOTElement *)self _elementForAttribute:3002 shouldUpdateCache:0 shouldFetchAttributes:0];
  if ([v2 isRemoteElement])
  {
    uint64_t v3 = [v2 _elementForAttribute:3002 shouldUpdateCache:0 shouldFetchAttributes:0];

    unint64_t v2 = (void *)v3;
  }
  if ([v2 isRemoteElement]) {
    id v4 = 0;
  }
  else {
    id v4 = v2;
  }
  id v5 = v4;

  return v5;
}

- (id)nativeFocusElement
{
  unint64_t v2 = [(VOTElement *)self elementForAttribute:3024];
  if ([v2 isRemoteElement]) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = v2;
  }
  id v4 = v3;

  return v4;
}

- (id)nativeFocusPreferredElement
{
  unint64_t v2 = [(VOTElement *)self elementForAttribute:3027];
  if ([v2 isRemoteElement]) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = v2;
  }
  id v4 = v3;

  return v4;
}

- (id)firstResponderElementForFocus
{
  unint64_t v2 = [(VOTElement *)self elementForAttribute:3023];
  if ([v2 isRemoteElement])
  {
    uint64_t v3 = [v2 elementForAttribute:3023];

    unint64_t v2 = (void *)v3;
  }
  if ([v2 isRemoteElement]) {
    id v4 = 0;
  }
  else {
    id v4 = v2;
  }
  id v5 = v4;

  return v5;
}

- (id)firstElementInApplication
{
  id v3 = [(id)VOTSharedWorkspace navigationStyle];
  uint64_t v4 = AXUIAccessibilityHonorsGroupsKey;
  v19[0] = AXUIAccessibilityHonorsGroupsKey;
  id v5 = +[NSNumber numberWithBool:v3 == (id)1];
  v20[0] = v5;
  uint64_t v6 = AXUIAccessibilityNavigationDirection;
  v19[1] = AXUIAccessibilityNavigationDirection;
  uint64_t v7 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [(id)VOTSharedWorkspace navigationDirection]);
  v20[1] = v7;
  char v8 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
  uint64_t v9 = [(VOTElement *)self elementForParameterizedAttribute:95253 parameter:v8];

  if ([v9 isRemoteElement])
  {
    v17[0] = v4;
    char v10 = +[NSNumber numberWithBool:v3 == (id)1];
    v17[1] = v6;
    v18[0] = v10;
    uint64_t v11 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [(id)VOTSharedWorkspace navigationDirection]);
    v18[1] = v11;
    double v12 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
    uint64_t v13 = [v9 elementForParameterizedAttribute:95253 parameter:v12];

    uint64_t v9 = (void *)v13;
  }
  if ([v9 isRemoteElement]) {
    unsigned int v14 = 0;
  }
  else {
    unsigned int v14 = v9;
  }
  id v15 = v14;

  return v15;
}

- (id)lastElementInApplication
{
  id v3 = [(id)VOTSharedWorkspace navigationStyle];
  uint64_t v4 = AXUIAccessibilityHonorsGroupsKey;
  v19[0] = AXUIAccessibilityHonorsGroupsKey;
  id v5 = +[NSNumber numberWithBool:v3 == (id)1];
  v20[0] = v5;
  uint64_t v6 = AXUIAccessibilityNavigationDirection;
  v19[1] = AXUIAccessibilityNavigationDirection;
  uint64_t v7 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [(id)VOTSharedWorkspace navigationDirection]);
  v20[1] = v7;
  char v8 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
  uint64_t v9 = [(VOTElement *)self elementForParameterizedAttribute:95254 parameter:v8];

  if ([v9 isRemoteElement])
  {
    v17[0] = v4;
    char v10 = +[NSNumber numberWithBool:v3 == (id)1];
    v17[1] = v6;
    v18[0] = v10;
    uint64_t v11 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [(id)VOTSharedWorkspace navigationDirection]);
    v18[1] = v11;
    double v12 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
    uint64_t v13 = [v9 elementForParameterizedAttribute:95254 parameter:v12];

    uint64_t v9 = (void *)v13;
  }
  if ([v9 isRemoteElement]) {
    unsigned int v14 = 0;
  }
  else {
    unsigned int v14 = v9;
  }
  id v15 = v14;

  return v15;
}

- (id)firstElementInApplicationForFocus
{
  BOOL v3 = [(id)VOTSharedWorkspace navigationStyle] == (id)1;
  v26[0] = AXUIAccessibilityHonorsGroupsKey;
  uint64_t v4 = +[NSNumber numberWithBool:v3];
  v27[0] = v4;
  v26[1] = AXUIAccessibilityNavigationDirection;
  id v5 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [(id)VOTSharedWorkspace navigationDirection]);
  v27[1] = v5;
  uint64_t v6 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];
  uint64_t v7 = [(VOTElement *)self elementForParameterizedAttribute:95250 parameter:v6];

  char v8 = VOTLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "First element in app focus: %@", buf, 0xCu);
  }

  if ([v7 isRemoteElement])
  {
    [v7 accessibleDescendants];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    id v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v20;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if (objc_msgSend(v13, "isVisible", (void)v19))
          {
            id v10 = v13;
            goto LABEL_14;
          }
        }
        id v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
LABEL_14:

    unsigned int v14 = VOTLogCommon();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v10;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "First remote element in app focus: %@", buf, 0xCu);
    }

    if (v10)
    {
      id v15 = v10;

      uint64_t v7 = v15;
    }
  }
  if (objc_msgSend(v7, "isRemoteElement", (void)v19)) {
    id v16 = 0;
  }
  else {
    id v16 = v7;
  }
  id v17 = v16;

  return v17;
}

- (id)elementCommunity
{
  BOOL v3 = [(VOTElement *)self application];
  uint64_t v4 = [(VOTElement *)self isolatedWindow];
  if (v4)
  {
    id v5 = v4;

    uint64_t v6 = [v5 application];
    unsigned __int8 v7 = [v6 isSpringBoard];

    if (v7)
    {
      BOOL v3 = v5;
      goto LABEL_13;
    }
    BOOL v3 = [v5 application];
    id v9 = v5;
  }
  else
  {
    id v5 = [(VOTElement *)self remoteParent];
    if (v5 && [(VOTElement *)self remoteParentIsViewHost])
    {
      char v8 = [v5 isolatedWindow];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = (uint64_t)v9;
      }
      else
      {
        uint64_t v10 = [v5 application];
        id v9 = 0;
      }

      BOOL v3 = (void *)v10;
    }
    else
    {
      id v9 = 0;
    }
  }

  id v5 = v9;
LABEL_13:

  return v3;
}

- (id)firstElementInApplicationForReadFromTop
{
  unint64_t v2 = [(VOTElement *)self elementForAttribute:3050];
  if ([v2 isRemoteElement])
  {
    uint64_t v3 = [v2 elementForAttribute:3050];

    unint64_t v2 = (void *)v3;
  }
  if ([v2 isRemoteElement]) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = v2;
  }
  id v5 = v4;

  return v5;
}

- (id)firstWebElement
{
  return [(VOTElement *)self elementForAttribute:2231];
}

- (BOOL)elementOnSameLine:(id)a3
{
  id v4 = a3;
  [(VOTElement *)self frame];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  double v12 = v11;
  [v4 frame];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  double v20 = v19;
  id v21 = [(id)VOTSharedWorkspace deviceOrientation];
  unsigned int v22 = [(VOTElement *)self doesHaveTraits:kAXToggleTrait | kAXRadioButtonTrait];
  if (v22) {
    LOBYTE(v22) = [v4 doesHaveTraits:kAXStaticTextTrait];
  }
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10001DC9C;
  v32[3] = &unk_1001B37C0;
  char v33 = v22;
  CGFloat v23 = objc_retainBlock(v32);
  switch((unint64_t)v21)
  {
    case 0uLL:
    case 1uLL:
      v34.origin.double x = v6;
      v34.origin.double y = v8;
      v34.size.width = v10;
      v34.size.height = v12;
      double MinY = CGRectGetMinY(v34);
      v35.origin.double x = v14;
      v35.origin.double y = v16;
      v35.size.width = v18;
      v35.size.height = v20;
      double MaxY = CGRectGetMinY(v35);
      goto LABEL_10;
    case 2uLL:
      v36.origin.double x = v6;
      v36.origin.double y = v8;
      v36.size.width = v10;
      v36.size.height = v12;
      double MinY = CGRectGetMaxY(v36);
      v37.origin.double x = v14;
      v37.origin.double y = v16;
      v37.size.width = v18;
      v37.size.height = v20;
      double MaxY = CGRectGetMaxY(v37);
      goto LABEL_10;
    case 3uLL:
      v38.origin.double x = v6;
      v38.origin.double y = v8;
      v38.size.width = v10;
      v38.size.height = v12;
      double MinY = CGRectGetMaxX(v38);
      v39.origin.double x = v14;
      v39.origin.double y = v16;
      v39.size.width = v18;
      v39.size.height = v20;
      double MaxY = CGRectGetMaxX(v39);
      goto LABEL_9;
    case 4uLL:
      v40.origin.double x = v6;
      v40.origin.double y = v8;
      v40.size.width = v10;
      v40.size.height = v12;
      double MinY = CGRectGetMinX(v40);
      v41.origin.double x = v14;
      v41.origin.double y = v16;
      v41.size.width = v18;
      v41.size.height = v20;
      double MaxY = CGRectGetMinX(v41);
LABEL_9:
      double v12 = v10;
      double v20 = v18;
LABEL_10:
      float v27 = MinY;
      float v28 = MaxY;
      float v29 = v12;
      float v30 = v20;
      char v26 = ((uint64_t (*)(void *, float, float, float, float))v23[2])(v23, v27, v28, v29, v30);
      break;
    default:
      char v26 = 0;
      break;
  }

  return v26;
}

- (id)cellWithRowIndexPath:(_NSRange)a3 parentView:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  CGFloat v8 = [v7 uiElement];
  id v9 = [v8 axElement];

  if (v9)
  {
    *(void *)&long long valuePtr = location;
    *((void *)&valuePtr + 1) = length;
    AXValueRef v10 = AXValueCreate(kAXValueTypeCFRange, &valuePtr);
    v21[0] = v10;
    v21[1] = v9;
    double v11 = +[NSArray arrayWithObjects:v21 count:2];
    double v12 = [(VOTElement *)self elementForParameterizedAttribute:92600 parameter:v11];

    CFRelease(v10);
  }
  else
  {
    double v13 = +[AXSubsystemVoiceOver sharedInstance];
    unsigned __int8 v14 = [v13 ignoreLogging];

    if ((v14 & 1) == 0)
    {
      double v15 = +[AXSubsystemVoiceOver identifier];
      CGFloat v16 = AXLoggerForFacility();

      os_log_type_t v17 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v16, v17))
      {
        CGFloat v18 = AXColorizeFormatLog();
        double v19 = _AXStringForArgs();
        if (os_log_type_enabled(v16, v17))
        {
          LODWORD(valuePtr) = 138543362;
          *(void *)((char *)&valuePtr + 4) = v19;
          _os_log_impl((void *)&_mh_execute_header, v16, v17, "%{public}@", (uint8_t *)&valuePtr, 0xCu);
        }
      }
    }
    double v12 = 0;
  }

  return v12;
}

- (BOOL)allowCustomActionHintSpeakOverride
{
  return [(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:2047];
}

- (BOOL)retainsCustomRotorActionSetting
{
  return [(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:2067];
}

- (BOOL)includeURLLabelInLabel
{
  if (![(VOTElement *)self doesHaveTraits:kAXImageTrait]) {
    return 1;
  }
  uint64_t v3 = [(id)VOTSharedWorkspace elementManager];
  unsigned __int8 v4 = [v3 determineFullImageDescriptionsEnabled:self];

  return v4 ^ 1;
}

- (BOOL)shouldAddAlternateActionForLinkElement
{
  uint64_t v3 = [(VOTElement *)self application];
  if ([(VOTElement *)self doesHaveAllTraits:kAXLinkTrait | kAXWebContentTrait])
  {
    unsigned __int8 v4 = [v3 uiElement];
    unsigned __int8 v5 = [v4 BOOLWithAXAttribute:2148];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (id)customContent
{
  uint64_t v3 = [(UIElementProtocol *)self->_uiElement objectWithAXAttribute:2210];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    unsigned __int8 v5 = +[NSArray arrayWithObjects:&v14 count:1];
    CGFloat v6 = +[NSSet setWithArray:v5];
    id v7 = +[NSKeyedUnarchiver secureUnarchiveData:v3 withExpectedClass:v4 otherAllowedClasses:v6];
  }
  else
  {
    id v7 = 0;
  }
  if (![(VOTElement *)self includeURLLabelInLabel])
  {
    CGFloat v8 = [(VOTElement *)self urlLabel];

    if (v8)
    {
      if (!v7) {
        id v7 = objc_opt_new();
      }
      id v9 = sub_100051804(off_1001EA9E8, @"URL", 0);
      AXValueRef v10 = [(VOTElement *)self urlLabel];
      double v11 = +[AXCustomContent customContentWithLabel:v9 value:v10];
      uint64_t v12 = [v7 arrayByAddingObject:v11];

      id v7 = (void *)v12;
    }
  }

  return v7;
}

- (BOOL)shouldIncludeRemoteParentCustomActions
{
  return [(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:2217];
}

- (BOOL)shouldIncludeRegionDescription
{
  return [(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:2218];
}

- (id)cachedCustomRotorActions
{
  uint64_t v3 = +[NSMutableArray array];
  uint64_t v4 = [(VOTElement *)self remoteParent];
  if (v4)
  {
    unsigned __int8 v5 = [(VOTElement *)self remoteParent];
    if (([v5 isEqual:self] & 1) != 0
      || ![(VOTElement *)self remoteParentIsViewHost])
    {
    }
    else
    {
      unsigned int v6 = [(VOTElement *)self shouldIncludeRemoteParentCustomActions];

      if (!v6) {
        goto LABEL_9;
      }
      id v7 = [(VOTElement *)self remoteParent];
      uint64_t v4 = [v7 cachedCustomRotorActions];

      if (v4) {
        [v3 addObjectsFromArray:v4];
      }
    }
  }
LABEL_9:
  CGFloat v8 = [(UIElementProtocol *)self->_uiElement arrayWithAXAttribute:2036];
  if (v8) {
    [v3 addObjectsFromArray:v8];
  }
  if ([(VOTElement *)self remoteParentIsViewHost])
  {
    id v9 = [(VOTElement *)self application];
    AXValueRef v10 = [v9 uiElement];
    [v10 updateCache:2148];

    if ([(VOTElement *)self shouldAddAlternateActionForLinkElement])
    {
      double v11 = [(id)VOTSharedWorkspace selectedLanguage];
      uint64_t v12 = sub_100051D04(off_1001EA9E8, @"action.open.other.side", @"action.open.other.side", v11);
      v32[0] = @"CustomActionName";
      v32[1] = @"CustomActionIdentifier";
      v33[0] = v12;
      v33[1] = @"alternateActionForURLIdentifier";
      double v13 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:2];
      uint64_t v14 = +[NSMutableDictionary dictionaryWithDictionary:v13];

      [v3 addObject:v14];
    }
  }
  double v15 = [(id)VOTSharedWorkspace visionEngine];
  CGFloat v16 = [v15 resultsForElement:self];

  uint64_t v28 = 0;
  float v29 = &v28;
  uint64_t v30 = 0x2020000000;
  BOOL v31 = 0;
  os_log_type_t v17 = [(VOTElement *)self imageAssetLocalIdentifier];
  BOOL v18 = v17 != 0;

  BOOL v31 = v18;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  void v27[2] = sub_10001E5D8;
  v27[3] = &unk_1001B37E8;
  v27[4] = &v28;
  [v16 enumerateObjectsUsingBlock:v27];
  if (*((unsigned char *)v29 + 24))
  {
    double v19 = objc_alloc_init(VOTImageExplorerCustomAction);
    [v3 addObject:v19];
  }
  double v20 = [v3 axMapObjectsUsingBlock:&stru_1001B3828];
  id v21 = [(VOTElement *)self cachedDragCustomActions];
  unsigned int v22 = [v20 arrayByAddingObjectsFromArray:v21];

  CGFloat v23 = [(VOTElement *)self cachedDropCustomActions];
  id v24 = [v22 arrayByAddingObjectsFromArray:v23];

  id v25 = [v24 sortedArrayUsingComparator:&stru_1001B3868];

  _Block_object_dispose(&v28, 8);

  return v25;
}

+ (id)defaultCustomActionCategory
{
  return sub_100051804(off_1001EA9E8, @"custom.actions.title", 0);
}

+ (id)organizedActionsByCategory:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[NSMutableArray array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        AXValueRef v10 = [v9 categoryName];
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        void v17[2] = sub_10001E928;
        v17[3] = &unk_1001B3890;
        id v11 = v10;
        id v18 = v11;
        uint64_t v12 = objc_msgSend(v4, "ax_filteredArrayUsingBlock:", v17);
        double v13 = [v12 firstObject];

        if (!v13)
        {
          double v13 = objc_opt_new();
          [v13 setCategoryName:v11];
          [v4 addObject:v13];
        }
        uint64_t v14 = [v13 actions];
        [v14 addObject:v9];
      }
      id v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);
  }

  [v4 sortUsingComparator:&stru_1001B38D0];

  return v4;
}

- (id)customRotorActions
{
  uint64_t v3 = [(VOTElement *)self remoteParent];
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    unsigned int v5 = [(VOTElement *)self remoteParentIsViewHost];

    if (v5)
    {
      id v6 = [(VOTElement *)self remoteParent];
      uint64_t v7 = [v6 uiElement];
      [v7 updateCache:2036];
    }
  }
  [(UIElementProtocol *)self->_uiElement updateCache:2036];
  [(UIElementProtocol *)self->_uiElement updateCache:2175];
  [(UIElementProtocol *)self->_uiElement updateCache:2176];

  return [(VOTElement *)self cachedCustomRotorActions];
}

- (BOOL)setNativeFocus
{
  return [(UIElementProtocol *)self->_uiElement performAXAction:2044];
}

- (BOOL)hasNativeFocus
{
  return [(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:2094];
}

- (BOOL)canBecomeNativeFocused
{
  return [(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:2204];
}

- (BOOL)shouldPlaySoundWhenFocused
{
  return 1;
}

- (BOOL)shouldSetNativeFocusWhenBecomingCurrentElement
{
  return [(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:2153];
}

- (BOOL)shouldSpeakExplorerElementsAfterFocus
{
  return [(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:2131];
}

- (BOOL)fullscreenVideoViewIsVisible
{
  return [(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:2151];
}

- (int64_t)overriddenInterpretationForCommand:(int64_t)a3
{
  uint64_t v3 = [(UIElementProtocol *)self->_uiElement objectWithAXAttribute:95235 parameter:+[NSNumber numberWithInteger:a3]];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = [v3 integerValue];
  }
  else {
    id v4 = 0;
  }

  return (int64_t)v4;
}

- (BOOL)performCustomActionWithIdentifier:(id)a3
{
  return [(VOTElement *)self performCustomActionWithIdentifier:a3 data:0];
}

- (BOOL)performCustomActionWithIdentifier:(id)a3 data:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:@"alternateActionForURLIdentifier"])
  {
    CGFloat v8 = [(VOTElement *)self application];
    id v9 = [v8 uiElement];
    AXValueRef v10 = [(VOTElement *)self url];
    id v11 = [v10 absoluteString];
    unsigned __int8 v12 = [v9 performAXAction:2048 withValue:v11];

LABEL_9:
    goto LABEL_10;
  }
  if (!v7)
  {
    id v7 = (id)objc_opt_new();
    [v7 setObject:v6 forKeyedSubscript:@"CustomActionIdentifier"];
  }
  if (([(UIElementProtocol *)self->_uiElement performAXAction:2021 withValue:v7] & 1) == 0)
  {
    double v13 = [(VOTElement *)self remoteParent];

    if (!v13)
    {
      unsigned __int8 v12 = 0;
      goto LABEL_10;
    }
    CGFloat v8 = [(VOTElement *)self remoteParent];
    unsigned __int8 v12 = [v8 performCustomActionWithIdentifier:v6 data:v7];
    goto LABEL_9;
  }
  unsigned __int8 v12 = 1;
LABEL_10:

  return v12;
}

- (BOOL)attemptToShowContextMenuWithTargetPointValue:(id)a3
{
  id v4 = a3;
  if ([(UIElementProtocol *)self->_uiElement performAXAction:2051 withValue:v4])
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    id v6 = [(VOTElement *)self remoteParent];

    if (v6)
    {
      id v7 = [(VOTElement *)self remoteParent];
      unsigned __int8 v5 = [v7 attemptToShowContextMenuWithTargetPointValue:v4];
    }
    else
    {
      unsigned __int8 v5 = 0;
    }
  }

  return v5;
}

- (id)customPublicRotors
{
  uint64_t v3 = +[NSMutableArray array];
  uint64_t v4 = [(VOTElement *)self remoteParent];
  if (v4)
  {
    unsigned __int8 v5 = (void *)v4;
    unsigned int v6 = [(VOTElement *)self remoteParentIsViewHost];

    if (v6)
    {
      id v7 = [(VOTElement *)self remoteParent];
      CGFloat v8 = [v7 uiElement];
      id v9 = [v8 arrayWithAXAttribute:2128];
      [v3 axSafelyAddObjectsFromArray:v9];
    }
  }
  AXValueRef v10 = [(VOTElement *)self uiElement];
  id v11 = [v10 arrayWithAXAttribute:2128];
  [v3 axSafelyAddObjectsFromArray:v11];

  return v3;
}

- (void)updateCustomPublicRotors
{
}

- (id)customPublicRotorNames
{
  uint64_t v3 = +[NSMutableArray array];
  uint64_t v4 = [(VOTElement *)self remoteParent];

  if (v4)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    unsigned __int8 v5 = [(VOTElement *)self remoteParent];
    unsigned int v6 = [v5 customPublicRotors];

    id v7 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v24;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v24 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = [(VOTElement *)self customPublicRotorName:*(void *)(*((void *)&v23 + 1) + 8 * i)];
          [v3 axSafelyAddObject:v11];
        }
        id v8 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v8);
    }
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  unsigned __int8 v12 = [(VOTElement *)self customPublicRotors];
  id v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        os_log_type_t v17 = [(VOTElement *)self customPublicRotorName:*(void *)(*((void *)&v19 + 1) + 8 * (void)j)];
        [v3 axSafelyAddObject:v17];
      }
      id v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v14);
  }

  return v3;
}

- (id)customPublicRotorForSystemType:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(VOTElement *)self uiElement];
  unsigned int v6 = [v5 objectWithAXAttribute:95232 parameter:v4];

  if (!v6)
  {
    unsigned int v6 = [(VOTElement *)self remoteParent];

    if (v6)
    {
      id v7 = [(VOTElement *)self remoteParent];
      id v8 = [v7 uiElement];
      unsigned int v6 = [v8 objectWithAXAttribute:95232 parameter:v4];
    }
  }

  return v6;
}

- (BOOL)customPublicRotorIsVisibleInTouchRotor:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(VOTElement *)self uiElement];
  unsigned int v6 = [v5 objectWithAXAttribute:95228 parameter:v4];

  if (!v6)
  {
    unsigned int v6 = [(VOTElement *)self remoteParent];

    if (v6)
    {
      id v7 = [(VOTElement *)self remoteParent];
      id v8 = [v7 uiElement];
      unsigned int v6 = [v8 objectWithAXAttribute:95228 parameter:v4];
    }
  }
  uint64_t v9 = [v6 objectForKeyedSubscript:@"visibleInTouchRotor"];

  if (v9)
  {
    AXValueRef v10 = [v6 objectForKeyedSubscript:@"visibleInTouchRotor"];
    unsigned __int8 v11 = [v10 BOOLValue];
  }
  else
  {
    unsigned __int8 v11 = 1;
  }

  return v11;
}

- (int64_t)customPublicRotorLinkCountForRotor:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(VOTElement *)self uiElement];
  unsigned int v6 = [v5 objectWithAXAttribute:95228 parameter:v4];

  if (!v6)
  {
    unsigned int v6 = [(VOTElement *)self remoteParent];

    if (v6)
    {
      id v7 = [(VOTElement *)self remoteParent];
      id v8 = [v7 uiElement];
      unsigned int v6 = [v8 objectWithAXAttribute:95228 parameter:v4];
    }
  }
  objc_opt_class();
  uint64_t v9 = [v6 objectForKeyedSubscript:AXUIAccessibilityCustomRotorLinkCount];
  AXValueRef v10 = __UIAccessibilityCastAsClass();

  id v11 = [v10 integerValue];
  return (int64_t)v11;
}

- (id)customPublicRotorName:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(VOTElement *)self uiElement];
  unsigned int v6 = [v5 objectWithAXAttribute:95228 parameter:v4];

  if (!v6)
  {
    unsigned int v6 = [(VOTElement *)self remoteParent];

    if (v6)
    {
      id v7 = [(VOTElement *)self remoteParent];
      id v8 = [v7 uiElement];
      unsigned int v6 = [v8 objectWithAXAttribute:95228 parameter:v4];
    }
  }
  uint64_t v9 = [v6 objectForKeyedSubscript:@"name"];

  return v9;
}

+ (id)customPublicRotorDictionaryForRotorId:(id)a3 startRange:(_NSRange)a4 direction:(int64_t)a5
{
  NSUInteger location = a4.location;
  _NSRange v14 = a4;
  id v7 = a3;
  id v8 = +[NSMutableDictionary dictionary];
  [v8 setObject:v7 forKeyedSubscript:@"uuid"];

  uint64_t v9 = +[NSMutableDictionary dictionary];
  [v8 setObject:v9 forKeyedSubscript:@"currentItem"];

  if (location != 0x7FFFFFFF)
  {
    AXValueRef v10 = AXValueCreate(kAXValueTypeCFRange, &v14);
    id v11 = [v8 objectForKeyedSubscript:@"currentItem"];
    [v11 setObject:v10 forKeyedSubscript:@"targetRange"];

    if (v10) {
      CFRelease(v10);
    }
  }
  unsigned __int8 v12 = +[NSNumber numberWithInteger:a5 == 1];
  [v8 setObject:v12 forKeyedSubscript:@"direction"];

  return v8;
}

- (id)customPublicRotorResultWithItem:(id)a3 startElement:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 uiElement];
  id v9 = [v8 axElement];
  AXValueRef v10 = [v6 objectForKeyedSubscript:@"currentItem"];
  [v10 setObject:v9 forKeyedSubscript:@"targetElement"];

  id v11 = [(VOTElement *)self uiElement];
  unsigned __int8 v12 = [v11 objectWithAXAttribute:95227 parameter:v6];

  if (!v12)
  {
    id v13 = [(VOTElement *)self remoteParent];

    if (v13)
    {
      _NSRange v14 = [(VOTElement *)self remoteParent];

      uint64_t v15 = [v14 uiElement];
      id v16 = [v15 axElement];
      os_log_type_t v17 = [v6 objectForKeyedSubscript:@"currentItem"];
      [v17 setObject:v16 forKeyedSubscript:@"targetElement"];

      id v18 = [(VOTElement *)self remoteParent];
      long long v19 = [v18 uiElement];
      unsigned __int8 v12 = [v19 objectWithAXAttribute:95227 parameter:v6];

      id v7 = v14;
    }
    else
    {
      unsigned __int8 v12 = 0;
    }
  }

  return v12;
}

- (_NSRange)selectedTextRange
{
  [(UIElementProtocol *)self->_uiElement updateCache:2005];
  uiElement = self->_uiElement;

  id v4 = [(UIElementProtocol *)uiElement rangeWithAXAttribute:2005];
  result.NSUInteger length = v5;
  result.NSUInteger location = (NSUInteger)v4;
  return result;
}

- (void)setFirstResponder:(id)a3
{
  uiElement = self->_uiElement;
  id v4 = [a3 uiElement];
  -[UIElementProtocol setAXAttribute:withObject:](uiElement, "setAXAttribute:withObject:", 3002, [v4 axElement]);
}

- (void)setSelectedTextRange:(_NSRange)a3 refreshBraille:(BOOL)a4
{
}

- (void)setSelectedTextRange:(_NSRange)a3 refreshBraille:(BOOL)a4 isVoiceOverSelectionMovement:(BOOL)a5
{
  BOOL v5 = a4;
  _NSRange v9 = a3;
  if (!a5)
  {
    -[UIElementProtocol setAXAttribute:withRange:](self->_uiElement, "setAXAttribute:withRange:", 2005, a3.location, a3.length, v9.location, v9.length);
    if (!v5) {
      return;
    }
    goto LABEL_5;
  }
  id v7 = objc_alloc_init((Class)NSMutableArray);
  AXValueRef v8 = AXValueCreate(kAXValueTypeCFRange, &v9);
  objc_msgSend(v7, "addObject:", v8, v9.location, v9.length);
  CFRelease(v8);
  [v7 addObject:&off_1001C50B0];
  [(UIElementProtocol *)self->_uiElement setAXAttribute:2005 withArray:v7];

  if (v5) {
LABEL_5:
  }
    [(id)VOTSharedWorkspace refreshBraille:1 rotorSelection:0];
}

- (void)_updateValueChangeOriginatorForApplication:(int64_t)a3
{
  unsigned int v5 = [(VOTElement *)self pid];
  id v6 = [(VOTElement *)self application];
  unsigned int v7 = [v6 pid];

  if (v5 != v7)
  {
    id v10 = [(VOTElement *)self application];
    AXValueRef v8 = [v10 uiElement];
    _NSRange v9 = [(VOTElement *)self _sourceNameForChangeOriginator:a3];
    [v8 setAXAttribute:3007 withString:v9];
  }
}

- (BOOL)includeRoleOnlyForGroupNavigation
{
  unint64_t v2 = [(VOTElement *)self uiElement];
  unsigned __int8 v3 = [v2 BOOLWithAXAttribute:2221];

  return v3;
}

- (BOOL)includeRoleDescription
{
  unint64_t v2 = [(VOTElement *)self uiElement];
  unsigned __int8 v3 = [v2 BOOLWithAXAttribute:2222];

  return v3;
}

- (void)insertText:(id)a3 source:(int64_t)a4
{
  id v6 = a3;
  [(VOTElement *)self _updateValueChangeOriginatorForApplication:a4];
  uint64_t v7 = [(VOTElement *)self _sourceNameForChangeOriginator:a4];
  AXValueRef v8 = (void *)v7;
  uiElement = self->_uiElement;
  if (v7)
  {
    v11[0] = kAXInsertTextActionKeyText;
    v11[1] = kAXInsertTextActionKeySource;
    v12[0] = v6;
    v12[1] = v7;
    id v10 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
    [(UIElementProtocol *)uiElement performAXAction:2056 withValue:v10];
  }
  else
  {
    [(UIElementProtocol *)uiElement performAXAction:2056 withValue:v6];
  }
}

- (void)clearElementForGesturedTextInput
{
  self->_elementForGesturedTextInput = 0;
  _objc_release_x1();
}

- (VOTElement)elementForGesturedTextInput
{
  elementForGesturedTextInput = self->_elementForGesturedTextInput;
  if (!elementForGesturedTextInput)
  {
    [(UIElementProtocol *)self->_uiElement updateCache:2600];
    id v4 = [(UIElementProtocol *)self->_uiElement objectWithAXAttribute:2600];
    unsigned int v5 = +[AXUIElement uiElementWithAXElement:v4];

    if (!v5)
    {
      unsigned int v5 = [(VOTElement *)self remoteParent];

      if (v5)
      {
        id v6 = [(VOTElement *)self remoteParent];
        uint64_t v7 = [v6 uiElement];
        AXValueRef v8 = [v7 objectWithAXAttribute:2600];
        unsigned int v5 = +[AXUIElement uiElementWithAXElement:v8];
      }
    }
    _NSRange v9 = [[VOTElement alloc] initWithUIElement:v5];
    [(VOTElement *)self setElementForGesturedTextInput:v9];

    elementForGesturedTextInput = self->_elementForGesturedTextInput;
  }

  return elementForGesturedTextInput;
}

- (id)gesturedTextInputAttributes
{
  unsigned __int8 v3 = [(UIElementProtocol *)self->_uiElement objectWithAXAttribute:2601];
  id v4 = [v3 mutableCopy];

  unsigned int v5 = +[NSNumber numberWithBool:[(VOTElement *)self doesHaveAllTraits:kAXTextEntryTrait | kAXIsEditingTrait]];
  [v4 setObject:v5 forKeyedSubscript:@"AXIsActiveResponder"];

  id v6 = [[VOTElementGesturedTextInputAttributes alloc] initWithAttributes:v4];

  return v6;
}

- (BOOL)hasImage
{
  return [(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:3059];
}

- (void)updateGesturedTextInputAttributes
{
}

- (BOOL)requiresLaTeXInput
{
  return [(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:2602];
}

- (BOOL)activateKeyboardReturnKey
{
  if (AXUIKeyboardIsOOP())
  {
    unsigned __int8 v3 = +[VOTElement inputUIApplication];
    id v4 = [v3 uiElement];
    unsigned __int8 v5 = [v4 performAXAction:2054];

    return v5;
  }
  else
  {
    uint64_t v10 = 0;
    id v11 = &v10;
    uint64_t v12 = 0x3032000000;
    id v13 = sub_1000167B0;
    _NSRange v14 = sub_1000167C0;
    id v15 = 0;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10001FEA0;
    v9[3] = &unk_1001B3678;
    v9[4] = &v10;
    [(VOTElement *)self _iterateSelfAndRemoteParentsUsingBlock:v9];
    uint64_t v7 = [(id)v11[5] uiElement];
    unsigned __int8 v8 = [v7 performAXAction:2054];

    _Block_object_dispose(&v10, 8);
    return v8;
  }
}

- (void)handwritingSendCarriageReturn
{
  id v7 = +[AXEventRepresentation keyRepresentationWithType:10];
  unint64_t v2 = [v7 keyInfo];
  [v2 setKeyCode:40];

  unsigned __int8 v3 = +[VOTWorkspace sharedWorkspace];
  [v3 handleKeyboardKeyEvent:v7 eventOrigin:1];

  id v4 = +[AXEventRepresentation keyRepresentationWithType:11];
  unsigned __int8 v5 = [v4 keyInfo];
  [v5 setKeyCode:40];

  id v6 = +[VOTWorkspace sharedWorkspace];
  [v6 handleKeyboardKeyEvent:v4 eventOrigin:1];
}

- (void)setVoiceOverFocused:(BOOL)a3
{
  BOOL v3 = a3;
  v16[0] = @"focused";
  unsigned __int8 v5 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:");
  v16[1] = @"assistiveTech";
  v17[0] = v5;
  v17[1] = @"UIAccessibilityNotificationVoiceOverIdentifier";
  id v6 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];

  id v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  id v13 = sub_1000201B0;
  _NSRange v14 = &unk_1001B38F8;
  id v7 = v6;
  id v15 = v7;
  [(VOTElement *)self _iterateSelfAndRemoteParentsUsingBlock:&v11];
  if (AXDeviceSupportsSonification())
  {
    if ([(VOTElement *)self supportsAudiographs])
    {
      if (!v3) {
        goto LABEL_8;
      }
LABEL_7:
      _NSRange v9 = [(VOTElement *)self chartElement];
      uint64_t v10 = +[VOTAudiographManager sharedManager];
      [v10 setCurrentChartElement:v9];

      goto LABEL_8;
    }
    unsigned __int8 v8 = [(VOTElement *)self chartElement];
    if (v8)
    {

      if (v3) {
        goto LABEL_7;
      }
    }
  }
LABEL_8:
  if (_UIAccessibilityFullKeyboardAccessEnabled()) {
    [(VOTElement *)self _updateFocusForFKA:v3];
  }
  if (v3) {
    [(VOTElement *)self setPreviousSpokenValueParts:0];
  }
}

- (void)_updateFocusForFKA:(BOOL)a3
{
  if (a3)
  {
    id v4 = +[AXElement systemWideElement];
    unsigned __int8 v5 = [v4 systemApplication];
    id v6 = [(VOTElement *)self application];
    id v7 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v6 pid]);
    unsigned __int8 v8 = [(VOTElement *)self fbSceneIdentifier];
    _NSRange v9 = +[NSArray axArrayByIgnoringNilElementsWithCount:](NSArray, "axArrayByIgnoringNilElementsWithCount:", 2, v7, v8);
    [v5 performAction:5303 withValue:v9];

    uint64_t v10 = [(VOTElement *)self remoteParent];

    if (v10)
    {
      id v11 = [(VOTElement *)self remoteParent];
      [v11 setNativeFocus];
    }
    uint64_t v12 = [(VOTElement *)self remoteApplication];

    if (v12)
    {
      id v13 = [(VOTElement *)self remoteParent];
      _NSRange v14 = [v13 uiElement];
      [v14 performAXAction:5308 withValue:&__kCFBooleanTrue];
    }
    [(VOTElement *)self setNativeFocus];
  }
  else
  {
    id v15 = [(VOTElement *)self remoteApplication];

    if (v15)
    {
      id v17 = [(VOTElement *)self remoteParent];
      id v16 = [v17 uiElement];
      [v16 performAXAction:5308 withValue:&__kCFBooleanFalse];
    }
  }
}

- (int64_t)lineStartPosition
{
  [(UIElementProtocol *)self->_uiElement updateCache:4001];
  BOOL v3 = [(UIElementProtocol *)self->_uiElement numberWithAXAttribute:4001];
  id v4 = [v3 integerValue];

  return (int64_t)v4;
}

- (int64_t)lineEndPosition
{
  [(UIElementProtocol *)self->_uiElement updateCache:4002];
  BOOL v3 = [(UIElementProtocol *)self->_uiElement numberWithAXAttribute:4002];
  id v4 = [v3 integerValue];

  return (int64_t)v4;
}

- (_NSRange)characterRangeForPosition:(unint64_t)a3
{
  long long v8 = xmmword_10016E510;
  BOOL v3 = (const __AXValue *)[(UIElementProtocol *)self->_uiElement objectWithAXAttribute:94016 parameter:+[NSNumber numberWithUnsignedInteger:a3]];
  if (v3 && (id v4 = v3, v5 = CFGetTypeID(v3), v5 == AXValueGetTypeID()) && AXValueGetType(v4) == kAXValueTypeCFRange)
  {
    AXValueGetValue(v4, kAXValueTypeCFRange, &v8);
    NSUInteger v7 = *((void *)&v8 + 1);
    NSUInteger v6 = v8;
  }
  else
  {
    NSUInteger v7 = 0;
    NSUInteger v6 = 0x7FFFFFFFLL;
  }
  result.NSUInteger length = v7;
  result.NSUInteger location = v6;
  return result;
}

- (_NSRange)lineRangeForPosition:(unint64_t)a3
{
  long long v8 = xmmword_10016E510;
  BOOL v3 = (const __AXValue *)[(UIElementProtocol *)self->_uiElement objectWithAXAttribute:94009 parameter:+[NSNumber numberWithUnsignedInteger:a3]];
  if (v3 && (id v4 = v3, v5 = CFGetTypeID(v3), v5 == AXValueGetTypeID()) && AXValueGetType(v4) == kAXValueTypeCFRange)
  {
    AXValueGetValue(v4, kAXValueTypeCFRange, &v8);
    NSUInteger v7 = *((void *)&v8 + 1);
    NSUInteger v6 = v8;
  }
  else
  {
    NSUInteger v7 = 0;
    NSUInteger v6 = 0x7FFFFFFFLL;
  }
  result.NSUInteger length = v7;
  result.NSUInteger location = v6;
  return result;
}

- (BOOL)shouldSpeakScrollStatusOnEntry
{
  return [(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:2074];
}

- (BOOL)includeDuringContentReading
{
  return [(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:2306];
}

- (BOOL)isReadingContent
{
  return [(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:2301];
}

- (void)updatePageContent
{
}

- (id)pageContent
{
  return [(UIElementProtocol *)self->_uiElement stringWithAXAttribute:2302];
}

- (BOOL)supportsRangeForLineNumber
{
  return [(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:2308];
}

- (_NSRange)rangeForLineNumber:(int64_t)a3
{
  long long v8 = xmmword_10016E510;
  BOOL v3 = (const __AXValue *)[(UIElementProtocol *)self->_uiElement objectWithAXAttribute:92704 parameter:+[NSNumber numberWithInteger:a3]];
  if (v3 && (id v4 = v3, v5 = CFGetTypeID(v3), v5 == AXValueGetTypeID()) && AXValueGetType(v4) == kAXValueTypeCFRange)
  {
    AXValueGetValue(v4, kAXValueTypeCFRange, &v8);
    NSUInteger v7 = *((void *)&v8 + 1);
    NSUInteger v6 = v8;
  }
  else
  {
    NSUInteger v7 = 0;
    NSUInteger v6 = 0x7FFFFFFFLL;
  }
  result.NSUInteger length = v7;
  result.NSUInteger location = v6;
  return result;
}

- (id)stringForLineNumber:(int64_t)a3
{
  BOOL v3 = [(UIElementProtocol *)self->_uiElement objectWithAXAttribute:92702 parameter:+[NSNumber numberWithInteger:a3]];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (CGRect)frameForLineNumber:(int64_t)a3
{
  BOOL v3 = (const __AXValue *)[(UIElementProtocol *)self->_uiElement objectWithAXAttribute:92701 parameter:+[NSNumber numberWithInteger:a3]];
  if (v3 && (id v4 = v3, v5 = CFGetTypeID(v3), v5 == AXValueGetTypeID()))
  {
    CGPoint origin = (CGPoint)0;
    CGSize v12 = (CGSize)0;
    AXValueGetValue(v4, kAXValueTypeCGRect, &origin);
  }
  else
  {
    CGSize size = CGRectZero.size;
    CGPoint origin = CGRectZero.origin;
    CGSize v12 = size;
  }
  double y = origin.y;
  double x = origin.x;
  double height = v12.height;
  double width = v12.width;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)supportsFrameForRange
{
  return [(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:2307];
}

- (CGRect)frameForRange:(_NSRange)a3
{
  CGSize size = CGRectZero.size;
  CGPoint origin = CGRectZero.origin;
  CGSize v12 = size;
  id v4 = -[VOTElement objectForRange:withParameterizedAttribute:](self, "objectForRange:withParameterizedAttribute:", a3.location, a3.length, 92703);
  if (v4)
  {
    CFTypeID v5 = v4;
    CFTypeID v6 = CFGetTypeID(v4);
    if (v6 == AXValueGetTypeID() && AXValueGetType(v5) == kAXValueTypeCGRect) {
      AXValueGetValue(v5, kAXValueTypeCGRect, &origin);
    }
  }
  double y = origin.y;
  double x = origin.x;
  double height = v12.height;
  double width = v12.width;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (int64_t)lineNumberForPoint:(CGPoint)a3
{
  [(VOTElement *)self windowContextId];
  [(VOTElement *)self displayId];
  AXConvertPointToHostedCoordinates();
  v10[0] = v4;
  v10[1] = v5;
  AXValueRef v6 = AXValueCreate(kAXValueTypeCGPoint, v10);
  NSUInteger v7 = [(UIElementProtocol *)self->_uiElement objectWithAXAttribute:92700 parameter:v6];
  CFRelease(v6);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int64_t v8 = (int64_t)[v7 integerValue];
  }
  else {
    int64_t v8 = 0x7FFFFFFFLL;
  }

  return v8;
}

- (void)setCurrentWordContextForBook:(id)a3
{
}

- (id)lineNumberAndColumnForPoint:(CGPoint)a3
{
  CGPoint v9 = a3;
  AXValueRef v4 = AXValueCreate(kAXValueTypeCGPoint, &v9);
  if (v4)
  {
    AXValueRef v5 = v4;
    AXValueRef v6 = [(UIElementProtocol *)self->_uiElement objectWithAXAttribute:92503 parameter:v4];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (_NSRange)rangeForLineNumberAndColumn:(id)a3
{
  id v4 = a3;
  long long v10 = xmmword_10016E510;
  if (v4)
  {
    AXValueRef v5 = (const __AXValue *)[(UIElementProtocol *)self->_uiElement objectWithAXAttribute:92504 parameter:v4];
    if (v5)
    {
      AXValueRef v6 = v5;
      CFTypeID v7 = CFGetTypeID(v5);
      if (v7 == AXValueGetTypeID() && AXValueGetType(v6) == kAXValueTypeCFRange) {
        AXValueGetValue(v6, kAXValueTypeCFRange, &v10);
      }
    }
  }

  NSUInteger v9 = *((void *)&v10 + 1);
  NSUInteger v8 = v10;
  result.NSUInteger length = v9;
  result.NSUInteger location = v8;
  return result;
}

- (id)previousTextNavigationElement
{
  return [(VOTElement *)self elementForAttribute:2312];
}

- (id)nextTextNavigationElement
{
  return [(VOTElement *)self elementForAttribute:2313];
}

- (id)valueForRange:(_NSRange)a3
{
  BOOL v3 = -[VOTElement objectForRange:withParameterizedAttribute:](self, "objectForRange:withParameterizedAttribute:", a3.location, a3.length, 92505);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)attributedValueForRange:(_NSRange)a3
{
  BOOL v3 = -[VOTElement objectForRange:withParameterizedAttribute:](self, "objectForRange:withParameterizedAttribute:", a3.location, a3.length, 92508);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)objectForRange:(_NSRange)a3 withParameterizedAttribute:(int64_t)a4
{
  _NSRange v10 = a3;
  AXValueRef v6 = AXValueCreate(kAXValueTypeCFRange, &v10);
  if (v6)
  {
    AXValueRef v7 = v6;
    NSUInteger v8 = [(UIElementProtocol *)self->_uiElement objectWithAXAttribute:a4 parameter:v6];
    CFRelease(v7);
  }
  else
  {
    NSUInteger v8 = 0;
  }

  return v8;
}

- (id)_selectionStringForSegment:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 6) {
    return 0;
  }
  else {
    return off_1001B39E0[a3 - 1];
  }
}

- (void)increaseWebSelection:(int64_t)a3
{
  uiElement = self->_uiElement;
  id v4 = [(VOTElement *)self _selectionStringForSegment:a3];
  [(UIElementProtocol *)uiElement performAXAction:2015 withValue:v4];
}

- (void)decreaseWebSelection:(int64_t)a3
{
  uiElement = self->_uiElement;
  id v4 = [(VOTElement *)self _selectionStringForSegment:a3];
  [(UIElementProtocol *)uiElement performAXAction:2016 withValue:v4];
}

- (void)deleteCharacterAtCursorWithSource:(int64_t)a3
{
  uint64_t v4 = [(VOTElement *)self _sourceNameForChangeOriginator:a3];
  uiElement = self->_uiElement;
  id v6 = (id)v4;
  if (v4) {
    [(UIElementProtocol *)uiElement performAXAction:2052 withValue:v4];
  }
  else {
    [(UIElementProtocol *)uiElement performAXAction:2052];
  }
}

- (int64_t)_changeOriginatorForSourceName:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"hardware"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"braillehardware"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"braillegestures"])
  {
    int64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"handwriting"])
  {
    int64_t v4 = 4;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (id)_sourceNameForChangeOriginator:(int64_t)a3
{
  if ((unint64_t)a3 > 4) {
    return @"software";
  }
  else {
    return (id)qword_1001B3A18[a3];
  }
}

- (void)replaceCharactersAtCursor:(unint64_t)a3 withString:(id)a4 source:(int64_t)a5
{
  id v11 = a4;
  NSUInteger v8 = +[NSMutableDictionary dictionary];
  NSUInteger v9 = +[NSNumber numberWithUnsignedInteger:a3];
  [v8 setValue:v9 forKey:@"numberofcharacters"];

  if (v11) {
    [v8 setValue:v11 forKey:@"replacement"];
  }
  _NSRange v10 = [(VOTElement *)self _sourceNameForChangeOriginator:a5];
  if (v10) {
    [v8 setValue:v10 forKey:@"source"];
  }
  [(UIElementProtocol *)self->_uiElement performAXAction:2053 withValue:v8];
}

- (BOOL)replaceTextInRange:(_NSRange)a3 withString:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v11[0] = @"range";
  id v7 = a4;
  v13.NSUInteger location = location;
  v13.NSUInteger length = length;
  NSUInteger v8 = NSStringFromRange(v13);
  v11[1] = @"replacement";
  v12[0] = v8;
  v12[1] = v7;
  NSUInteger v9 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];

  LOBYTE(v8) = [(UIElementProtocol *)self->_uiElement performAXAction:2505 withValue:v9];
  return (char)v8;
}

- (CGRect)boundsForRange:(_NSRange)a3
{
  CGSize size = CGRectZero.size;
  CGPoint origin = CGRectZero.origin;
  CGSize v12 = size;
  int64_t v4 = -[VOTElement objectForRange:withParameterizedAttribute:](self, "objectForRange:withParameterizedAttribute:", a3.location, a3.length, 92506);
  if (v4)
  {
    AXValueRef v5 = v4;
    CFTypeID v6 = CFGetTypeID(v4);
    if (v6 == AXValueGetTypeID() && AXValueGetType(v5) == kAXValueTypeCGRect) {
      AXValueGetValue(v5, kAXValueTypeCGRect, &origin);
    }
  }
  double y = origin.y;
  double x = origin.x;
  double height = v12.height;
  double width = v12.width;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)expandedTextValue
{
  return [(UIElementProtocol *)self->_uiElement stringWithAXAttribute:3033];
}

- (id)textMarkerRangeForSelection
{
  [(UIElementProtocol *)self->_uiElement updateCache:4004];
  uiElement = self->_uiElement;

  return [(UIElementProtocol *)uiElement arrayWithAXAttribute:4004];
}

- (_NSRange)textMarkerSelectionRange
{
  [(UIElementProtocol *)self->_uiElement updateCache:4005];
  uiElement = self->_uiElement;

  id v4 = [(UIElementProtocol *)uiElement rangeWithAXAttribute:4005];
  result.NSUInteger length = v5;
  result.NSUInteger location = (NSUInteger)v4;
  return result;
}

- (id)textMarkerRange
{
  return [(UIElementProtocol *)self->_uiElement arrayWithAXAttribute:4003];
}

- (id)webAreaURL
{
  unint64_t v2 = [(UIElementProtocol *)self->_uiElement objectWithAXAttribute:2105];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)attachmentFilenameForCID:(id)a3
{
  return [(UIElementProtocol *)self->_uiElement objectWithAXAttribute:95229 parameter:a3];
}

- (id)url
{
  unint64_t v2 = [(UIElementProtocol *)self->_uiElement objectWithAXAttribute:2020];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)textMarkerForPoint:(CGPoint)a3
{
  CGPoint v7 = a3;
  AXValueRef v4 = AXValueCreate(kAXValueTypeCGPoint, &v7);
  NSUInteger v5 = [(UIElementProtocol *)self->_uiElement objectWithAXAttribute:94007 parameter:v4];
  CFRelease(v4);

  return v5;
}

- (id)textMarkersForPoints:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "pointValue", 0, 0, (void)v17);
        v16[0] = v11;
        v16[1] = v12;
        AXValueRef v13 = AXValueCreate(kAXValueTypeCGPoint, v16);
        [v5 addObject:v13];
        CFRelease(v13);
      }
      id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  _NSRange v14 = [(UIElementProtocol *)self->_uiElement objectWithAXAttribute:94010 parameter:v5];

  return v14;
}

- (id)textNextMarker:(id)a3
{
  return [(UIElementProtocol *)self->_uiElement objectWithAXAttribute:94004 parameter:a3];
}

- (id)textPreviousMarker:(id)a3
{
  return [(UIElementProtocol *)self->_uiElement objectWithAXAttribute:94005 parameter:a3];
}

- (id)pageTextMarkerRange
{
  [(UIElementProtocol *)self->_uiElement updateCache:2305];
  id v3 = [(UIElementProtocol *)self->_uiElement objectWithAXAttribute:2305];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)textLineEndMarker:(id)a3
{
  uiElement = self->_uiElement;
  id v5 = a3;
  [(UIElementProtocol *)uiElement updateCache:94003];
  id v6 = [(UIElementProtocol *)self->_uiElement objectWithAXAttribute:94003 parameter:v5];

  return v6;
}

- (_NSRange)rangeForTextMarker:(id)a3
{
  long long v8 = xmmword_10016E510;
  id v3 = (const __AXValue *)[(UIElementProtocol *)self->_uiElement objectWithAXAttribute:94012 parameter:a3];
  if (v3)
  {
    id v4 = v3;
    CFTypeID v5 = CFGetTypeID(v3);
    if (v5 == AXValueGetTypeID() && AXValueGetType(v4) == kAXValueTypeCFRange) {
      AXValueGetValue(v4, kAXValueTypeCFRange, &v8);
    }
  }
  NSUInteger v7 = *((void *)&v8 + 1);
  NSUInteger v6 = v8;
  result.NSUInteger length = v7;
  result.NSUInteger location = v6;
  return result;
}

- (BOOL)shouldAnnounceFontInfo
{
  return [(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:2051];
}

- (BOOL)isCameraIrisOpen
{
  [(UIElementProtocol *)self->_uiElement updateCache:3008];
  uiElement = self->_uiElement;

  return [(UIElementProtocol *)uiElement BOOLWithAXAttribute:3008];
}

- (BOOL)isTourGuideRunning
{
  [(UIElementProtocol *)self->_uiElement updateCache:2500];
  uiElement = self->_uiElement;

  return [(UIElementProtocol *)uiElement BOOLWithAXAttribute:2500];
}

- (id)textMarkersForRange:(_NSRange)a3
{
  id v3 = -[VOTElement objectForRange:withParameterizedAttribute:](self, "objectForRange:withParameterizedAttribute:", a3.location, a3.length, 94014);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (BOOL)textOperationsAvailable
{
  if ([(VOTElement *)self doesHaveTraits:kAXTextOperationsAvailableTrait]) {
    return 1;
  }
  uint64_t v4 = kAXWebContentTrait;
  if (![(VOTElement *)self doesHaveTraits:kAXWebContentTrait]) {
    return 0;
  }
  CFTypeID v5 = [(VOTElement *)self elementForAttribute:2011];
  if ([v5 doesHaveTraits:v4]) {
    unsigned __int8 v3 = 0;
  }
  else {
    unsigned __int8 v3 = [v5 textOperationsAvailable];
  }

  return v3;
}

- (void)setSelectionToTextMarker:(id)a3
{
  id v3 = [(UIElementProtocol *)self->_uiElement objectWithAXAttribute:94013 parameter:a3];
}

- (id)textLineStartMarker:(id)a3
{
  return [(UIElementProtocol *)self->_uiElement objectWithAXAttribute:94002 parameter:a3];
}

- (CGRect)textMarkerFrame:(id)a3
{
  id v3 = (const __AXValue *)[(UIElementProtocol *)self->_uiElement objectWithAXAttribute:94000 parameter:a3];
  if (v3 && (uint64_t v4 = v3, v5 = CFGetTypeID(v3), v5 == AXValueGetTypeID()))
  {
    CGPoint origin = (CGPoint)0;
    CGSize v12 = (CGSize)0;
    AXValueGetValue(v4, kAXValueTypeCGRect, &origin);
  }
  else
  {
    CGSize size = CGRectZero.size;
    CGPoint origin = CGRectZero.origin;
    CGSize v12 = size;
  }
  double y = origin.y;
  double x = origin.x;
  double height = v12.height;
  double width = v12.width;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)elementForTextMarker:(id)a3
{
  return [(VOTElement *)self elementForParameterizedAttribute:94006 parameter:a3];
}

- (id)stringForTextMarkers:(id)a3
{
  return [(UIElementProtocol *)self->_uiElement objectWithAXAttribute:94008 parameter:a3];
}

- (id)textMarkerArrayOfText:(id)a3
{
  id v3 = [(UIElementProtocol *)self->_uiElement objectWithAXAttribute:94001 parameter:a3];
  uint64_t v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    id v7 = v6;
    BOOL v8 = 0;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        BOOL v11 = v8;
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v5);
        }
        CGSize v12 = *(const void **)(*((void *)&v19 + 1) + 8 * i);
        CFTypeID v13 = CFGetTypeID(v12);
        CFTypeID TypeID = AXUIElementGetTypeID();
        BOOL v8 = v13 != TypeID;
        if (v13 == TypeID)
        {
          long long v17 = +[VOTElement _elementWithAXUIElementRef:](VOTElement, "_elementWithAXUIElementRef:", v12, (void)v19);
          [v4 addObject:v17];
        }
        else if (v11)
        {
          id v15 = [v4 lastObject];
          id v16 = [v15 stringByAppendingString:v12];
          objc_msgSend(v4, "replaceObjectAtIndex:withObject:", (char *)objc_msgSend(v4, "count") - 1, v16);
        }
        else
        {
          [v4 addObject:v12];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)summaryElement
{
  return [(VOTElement *)self elementForAttribute:3001];
}

- (NSArray)headerElements
{
  return (NSArray *)[(VOTElement *)self elementsForAttribute:2026];
}

- (NSArray)linkedUIElements
{
  return (NSArray *)[(VOTElement *)self elementsForAttribute:2167];
}

- (id)headerElementsForColumn:(unint64_t)a3
{
  uint64_t v4 = +[NSNumber numberWithUnsignedInteger:a3];
  id v5 = [(VOTElement *)self elementsForAttribute:95233 withParameter:v4];

  return v5;
}

- (id)headerElementsForRow:(unint64_t)a3
{
  uint64_t v4 = +[NSNumber numberWithUnsignedInteger:a3];
  id v5 = [(VOTElement *)self elementsForAttribute:95234 withParameter:v4];

  return v5;
}

- (void)addTitleElementToCache:(id)a3
{
  id v5 = a3;
  objc_getAssociatedObject(self, &unk_1001EB738);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    id v4 = [objc_allocWithZone((Class)NSMutableSet) init];
    objc_setAssociatedObject(self, &unk_1001EB738, v4, (void *)1);
  }
  [v4 addObject:v5];
}

- (BOOL)elementActsAsTitleElement:(id)a3
{
  id v4 = a3;
  id v5 = objc_getAssociatedObject(self, &unk_1001EB738);
  unsigned __int8 v6 = [v5 containsObject:v4];

  return v6;
}

- (void)updateTitleElements
{
}

- (id)titleElements
{
  return [(VOTElement *)self elementsForAttribute:3006];
}

- (id)explorerElements
{
  return [(VOTElement *)self elementsForAttribute:3022];
}

- (id)accessibleDescendants
{
  return [(VOTElement *)self elementsForAttribute:2095];
}

- (id)accessibleAncestor
{
  return [(VOTElement *)self elementForAttribute:2096];
}

- (id)bundleIdentifier
{
  id v3 = [(UIElementProtocol *)self->_uiElement stringWithAXAttribute:3003];
  if (!v3)
  {
    id v4 = [(VOTElement *)self application];
    if ([v4 isEqual:self])
    {
      id v3 = 0;
    }
    else
    {
      id v3 = [v4 bundleIdentifier];
    }
  }

  return v3;
}

- (BOOL)isLiveCaptionsTextView
{
  id v3 = [(VOTElement *)self identifier];
  if ([v3 isEqualToString:@"AXLCCaptionText"])
  {
    unsigned __int8 v4 = 1;
  }
  else
  {
    id v5 = [(VOTElement *)self identifier];
    if ([v5 isEqualToString:@"AXLCCaptionParagraphText"])
    {
      unsigned __int8 v4 = 1;
    }
    else
    {
      unsigned __int8 v6 = [(VOTElement *)self identifier];
      unsigned __int8 v4 = [v6 isEqualToString:@"AXLCAppName"];
    }
  }

  return v4;
}

- (BOOL)isLiveCaptionsParagraphView
{
  unint64_t v2 = [(VOTElement *)self identifier];
  unsigned __int8 v3 = [v2 isEqualToString:@"AXLCCaptionParagraphText"];

  return v3;
}

- (BOOL)isInAppSwitcher
{
  return [(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:2044];
}

- (BOOL)isInStatusBar
{
  return [(VOTElement *)self doesHaveTraits:kAXStatusBarElementTrait];
}

- (BOOL)isInAlert
{
  return [(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:2311];
}

- (BOOL)isInFolder
{
  return [(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:2081];
}

- (BOOL)hasBadge
{
  return [(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:2144];
}

- (BOOL)isSpringBoard
{
  unint64_t v2 = [(VOTElement *)self bundleIdentifier];
  unsigned __int8 v3 = [v2 isEqualToString:@"com.apple.springboard"];

  return v3;
}

- (BOOL)isChronod
{
  unint64_t v2 = [(VOTElement *)self bundleIdentifier];
  unsigned __int8 v3 = [v2 isEqualToString:@"com.apple.chronod"];

  return v3;
}

- (BOOL)isPineBoard
{
  unint64_t v2 = [(VOTElement *)self bundleIdentifier];
  unsigned __int8 v3 = [v2 isEqualToString:@"com.apple.PineBoard"];

  return v3;
}

- (BOOL)isHeadBoard
{
  unint64_t v2 = [(VOTElement *)self bundleIdentifier];
  unsigned __int8 v3 = [v2 isEqualToString:@"com.apple.HeadBoard"];

  return v3;
}

- (BOOL)isSystemApp
{
  unint64_t v2 = [(VOTElement *)self bundleIdentifier];
  unsigned __int8 v3 = [v2 isEqualToString:@"com.apple.springboard"];

  return v3;
}

- (BOOL)isSetupBuddy
{
  unint64_t v2 = [(VOTElement *)self bundleIdentifier];
  unsigned __int8 v3 = [v2 isEqualToString:@"com.apple.purplebuddy"];

  return v3;
}

- (BOOL)isClockFace
{
  return 0;
}

- (BOOL)isMobilePhone
{
  unint64_t v2 = [(VOTElement *)self bundleIdentifier];
  unsigned __int8 v3 = [v2 isEqualToString:@"com.apple.mobilephone"];

  return v3;
}

- (BOOL)isSafari
{
  unint64_t v2 = [(VOTElement *)self bundleIdentifier];
  unsigned __int8 v3 = [v2 isEqualToString:@"com.apple.mobilesafari"];

  return v3;
}

- (BOOL)isGoogleChrome
{
  unint64_t v2 = [(VOTElement *)self bundleIdentifier];
  unsigned __int8 v3 = [v2 isEqualToString:@"com.google.chrome.ios"];

  return v3;
}

- (BOOL)isAssistiveTouch
{
  unint64_t v2 = [(VOTElement *)self bundleIdentifier];
  unsigned __int8 v3 = [v2 isEqualToString:@"com.apple.assistivetouchd"];

  return v3;
}

- (BOOL)isAccessibilitySystemUIServer
{
  unint64_t v2 = [(VOTElement *)self bundleIdentifier];
  unsigned __int8 v3 = [v2 isEqualToString:@"com.apple.AccessibilityUIServer"];

  return v3;
}

- (BOOL)isMail
{
  unint64_t v2 = [(VOTElement *)self bundleIdentifier];
  unsigned __int8 v3 = [v2 isEqualToString:AX_MobileMailBundleName];

  return v3;
}

- (BOOL)isMaps
{
  unint64_t v2 = [(VOTElement *)self bundleIdentifier];
  unsigned __int8 v3 = [v2 isEqualToString:@"com.apple.Maps"];

  return v3;
}

- (BOOL)isIBooks
{
  unint64_t v2 = [(VOTElement *)self bundleIdentifier];
  unsigned __int8 v3 = [v2 isEqualToString:@"com.apple.iBooks"];

  return v3;
}

- (BOOL)isSpotlight
{
  unint64_t v2 = [(VOTElement *)self bundleIdentifier];
  unsigned __int8 v3 = [v2 isEqualToString:AX_SpotlightBundleName];

  return v3;
}

- (BOOL)isClipViewService
{
  unint64_t v2 = [(VOTElement *)self bundleIdentifier];
  unsigned __int8 v3 = [v2 isEqualToString:AX_ClipViewServiceName];

  return v3;
}

- (BOOL)isHandUI
{
  unint64_t v2 = [(VOTElement *)self windowSceneIdentifier];
  unsigned __int8 v3 = [v2 hasPrefix:@"com.apple.RealityHUD.HandScene"];

  return v3;
}

- (BOOL)isInJindoWindow
{
  return [(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:2229];
}

- (BOOL)isSafariScribbleActive
{
  BOOL v3 = [(VOTElement *)self isSafari];
  if (v3)
  {
    unsigned __int8 v4 = [(VOTElement *)self application];
    id v5 = [v4 uiElement];
    unsigned __int8 v6 = [v5 BOOLWithAXAttribute:5073];

    LOBYTE(v3) = v6;
  }
  return v3;
}

- (BOOL)scribbleRotorActive
{
  return [(id)VOTSharedWorkspace rotorType] == (id)95;
}

- (BOOL)performScribbleAction
{
  BOOL v3 = VOTLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[Scribble] hiding element", buf, 2u);
  }

  unsigned __int8 v4 = [(id)VOTSharedWorkspace elementManager];
  id v5 = [v4 safariScribbleManager];

  unsigned __int8 v6 = [v5 lastFetchedElement];

  if (v6)
  {
    [(UIElementProtocol *)self->_uiElement performAXAction:4200];
    id v7 = +[VOTOutputManager outputManager];
    BOOL v8 = +[VOSOutputEvent FolderDidClose];
    [v7 sendEvent:v8];

    uint64_t v9 = +[AXHapticFeedbackManager sharedManager];
    [v9 playHapticFeedbackForType:12];

    [v5 hideSelectedElement];
  }
  else
  {
    _NSRange v10 = VOTLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CGSize v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[Scribble] cannot hide element, none selected", v12, 2u);
    }
  }
  return v6 != 0;
}

- (void)clearSelectedScribbleElement
{
  BOOL v3 = [(id)VOTSharedWorkspace elementManager];
  id v10 = [v3 safariScribbleManager];

  unsigned __int8 v4 = [v10 lastFetchedElement];

  if (v4)
  {
    id v5 = [(VOTElement *)self application];
    unsigned __int8 v6 = [v5 uiElement];
    [v6 performAXAction:4201];

    [v10 setLastFetchedElement:0];
    id v7 = sub_100051804(off_1001EA9F8, @"scribble.cleared.selection", 0);
    BOOL v8 = [(id)VOTSharedWorkspace selectedLanguage];
    id v9 = sub_10000ABF8(v7, 1, v8);
  }
}

- (id)scribbleAreaForSearchPoint:(int64_t)a3
{
  if (![(VOTElement *)self isSafari]) {
    goto LABEL_16;
  }
  CGPoint valuePtr = CGPointZero;
  switch(a3)
  {
    case 0:
      [(VOTElement *)self centerPoint];
      goto LABEL_5;
    case 1:
      [(VOTElement *)self frame];
LABEL_5:
      CGFloat v7 = v5;
      double MinY = v6;
      valuePtr.CGFloat x = v7;
      goto LABEL_11;
    case 2:
      [(VOTElement *)self frame];
      CGFloat x = v31.origin.x;
      CGFloat y = v31.origin.y;
      CGFloat width = v31.size.width;
      CGFloat height = v31.size.height;
      CGFloat MaxX = CGRectGetMaxX(v31);
      v32.origin.CGFloat x = x;
      v32.origin.CGFloat y = y;
      v32.size.CGFloat width = width;
      v32.size.CGFloat height = height;
      double MinY = CGRectGetMinY(v32);
      goto LABEL_10;
    case 3:
      [(VOTElement *)self frame];
      CGFloat v14 = v33.origin.x;
      CGFloat v15 = v33.origin.y;
      CGFloat v16 = v33.size.width;
      CGFloat v17 = v33.size.height;
      double MinX = CGRectGetMinX(v33);
      goto LABEL_9;
    case 4:
      [(VOTElement *)self frame];
      CGFloat v14 = v34.origin.x;
      CGFloat v15 = v34.origin.y;
      CGFloat v16 = v34.size.width;
      CGFloat v17 = v34.size.height;
      double MinX = CGRectGetMaxX(v34);
LABEL_9:
      CGFloat MaxX = MinX;
      v35.origin.CGFloat x = v14;
      v35.origin.CGFloat y = v15;
      v35.size.CGFloat width = v16;
      v35.size.CGFloat height = v17;
      double MinY = CGRectGetMaxY(v35);
LABEL_10:
      valuePtr.CGFloat x = MaxX;
LABEL_11:
      valuePtr.CGFloat y = MinY;
      break;
    default:
      break;
  }
  long long v19 = [(VOTElement *)self remoteParent];

  if (v19)
  {
    long long v20 = [(VOTElement *)self application];
    long long v21 = [v20 uiElement];
    long long v22 = objc_msgSend(v21, "objectWithAXAttribute:parameter:", 94100, AXValueCreate(kAXValueTypeCGPoint, &valuePtr));

    if (v22)
    {
      if ([v22 objectForKey:@"AXScribbleGeometryKey"])
      {
        long long v27 = 0u;
        long long v28 = 0u;
        AXValueGetValue((AXValueRef)[v22 objectForKey:@"AXScribbleGeometryKey"], kAXValueTypeCGRect, &v27);
        id v23 = objc_alloc((Class)AXScribbleElement);
        long long v24 = [v22 objectForKey:@"AXScribbleRenderedTextKey"];
        id v25 = objc_msgSend(v23, "initWithText:geometry:", v24, v27, v28);
      }
      else
      {
        id v25 = 0;
      }
    }
    else
    {
      id v25 = 0;
    }
  }
  else
  {
LABEL_16:
    id v25 = 0;
  }

  return v25;
}

- (id)textReplacements
{
  return [(UIElementProtocol *)self->_uiElement arrayWithAXAttribute:3043];
}

- (id)typingCandidateElements
{
  return [(VOTElement *)self elementsForAttribute:3004];
}

- (id)elementAtRow:(int64_t)a3 andColumn:(int64_t)a4
{
  id v7 = objc_allocWithZone((Class)NSArray);
  BOOL v8 = +[NSNumber numberWithInteger:a3];
  id v9 = +[NSNumber numberWithInteger:a4];
  id v10 = objc_msgSend(v7, "initWithObjects:", v8, v9, 0);

  BOOL v11 = [(VOTElement *)self elementForParameterizedAttribute:92511 parameter:v10];

  return v11;
}

- (void)jumpToTableIndex:(id)a3
{
}

- (_NSRange)rowRange
{
  id v2 = [(UIElementProtocol *)self->_uiElement rangeWithAXAttribute:2027];
  result.NSUInteger length = v3;
  result.NSUInteger location = (NSUInteger)v2;
  return result;
}

- (BOOL)shouldIncludeRowRangeInDescription
{
  return [(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:2161];
}

- (BOOL)isContainedByPreferredNativeFocusElement
{
  [(UIElementProtocol *)self->_uiElement updateCache:2162];
  uiElement = self->_uiElement;

  return [(UIElementProtocol *)uiElement BOOLWithAXAttribute:2162];
}

- (BOOL)allowsActivationWithoutBeingNativeFocused
{
  [(UIElementProtocol *)self->_uiElement updateCache:2199];
  uiElement = self->_uiElement;

  return [(UIElementProtocol *)uiElement BOOLWithAXAttribute:2199];
}

- (BOOL)isContainedByVideoElement
{
  return [(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:2166];
}

- (BOOL)areMediaLegibilityEventsBeingTapped
{
  return [(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:3036];
}

- (_NSRange)columnRange
{
  id v2 = [(UIElementProtocol *)self->_uiElement rangeWithAXAttribute:2028];
  result.NSUInteger length = v3;
  result.NSUInteger location = (NSUInteger)v2;
  return result;
}

- (_NSRange)indexPathAsRange
{
  id v2 = [(UIElementProtocol *)self->_uiElement rangeWithAXAttribute:2078];
  result.NSUInteger length = v3;
  result.NSUInteger location = (NSUInteger)v2;
  return result;
}

- (id)parentTableOrCollectionView
{
  return [(VOTElement *)self elementForAttribute:2143];
}

- (BOOL)startStopToggle
{
  return [(UIElementProtocol *)self->_uiElement performAXAction:2011];
}

- (BOOL)softwareKeyboardSupportsGestureKeyboard
{
  return [(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:5035];
}

- (BOOL)isSoftwareKeyboardMimic
{
  return [(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:3028];
}

- (BOOL)isSoftwareKeyboardActive
{
  [(UIElementProtocol *)self->_uiElement updateCache:3005];
  uiElement = self->_uiElement;

  return [(UIElementProtocol *)uiElement BOOLWithAXAttribute:3005];
}

- (BOOL)usingHardwareKeyboard
{
  [(UIElementProtocol *)self->_uiElement updateCache:3007];
  NSUInteger v3 = [(UIElementProtocol *)self->_uiElement stringWithAXAttribute:3007];
  unsigned __int8 v4 = [v3 isEqualToString:@"hardware"];

  return v4;
}

- (int64_t)valueChangeOriginationSource
{
  [(UIElementProtocol *)self->_uiElement updateCache:3007];
  NSUInteger v3 = [(UIElementProtocol *)self->_uiElement stringWithAXAttribute:3007];
  int64_t v4 = [(VOTElement *)self _changeOriginatorForSourceName:v3];

  return v4;
}

- (BOOL)usingBrailleHardwareKeyboard
{
  [(UIElementProtocol *)self->_uiElement updateCache:3007];
  NSUInteger v3 = [(UIElementProtocol *)self->_uiElement stringWithAXAttribute:3007];
  unsigned __int8 v4 = [v3 isEqualToString:@"braillehardware"];

  return v4;
}

- (BOOL)isKeyboardActiveOrAttached
{
  id v2 = [(VOTElement *)self application];
  BOOL v3 = ([v2 isSoftwareKeyboardActive] & 1) != 0
    || GSEventIsHardwareKeyboardAttached() != 0;

  return v3;
}

- (int64_t)applicationOrientation
{
  [(UIElementProtocol *)self->_uiElement updateCache:1503];
  BOOL v3 = [(UIElementProtocol *)self->_uiElement numberWithAXAttribute:1503];
  int64_t v4 = (int)[v3 intValue];

  return v4;
}

- (BOOL)isSystemSleeping
{
  [(UIElementProtocol *)self->_uiElement updateCache:1507];
  uiElement = self->_uiElement;

  return [(UIElementProtocol *)uiElement BOOLWithAXAttribute:1507];
}

- (BOOL)isAlarmRinging
{
  [(UIElementProtocol *)self->_uiElement updateCache:1515];
  uiElement = self->_uiElement;

  return [(UIElementProtocol *)uiElement BOOLWithAXAttribute:1515];
}

- (BOOL)isSystemLocked
{
  [(UIElementProtocol *)self->_uiElement updateCache:1500];
  uiElement = self->_uiElement;

  return [(UIElementProtocol *)uiElement BOOLWithAXAttribute:1500];
}

- (BOOL)isSystemBatteryLow
{
  [(UIElementProtocol *)self->_uiElement updateCache:1504];
  uiElement = self->_uiElement;

  return [(UIElementProtocol *)uiElement BOOLWithAXAttribute:1504];
}

- (id)launchableApps
{
  [(UIElementProtocol *)self->_uiElement updateCache:1508];
  uiElement = self->_uiElement;

  return [(UIElementProtocol *)uiElement objectWithAXAttribute:1508];
}

- (id)appSwitcherApps
{
  [(UIElementProtocol *)self->_uiElement updateCache:1509];
  uiElement = self->_uiElement;

  return [(UIElementProtocol *)uiElement objectWithAXAttribute:1509];
}

- (void)launchAppWithDisplayID:(id)a3
{
}

- (id)focusModeActivityName
{
  return [(UIElementProtocol *)self->_uiElement stringWithAXAttribute:1517];
}

- (BOOL)isQuietModeEnabled
{
  return 0;
}

- (CGPoint)centerPointOfScreen
{
  [(UIElementProtocol *)self->_uiElement pointWithAXAttribute:1512];
  result.CGFloat y = v3;
  result.CGFloat x = v2;
  return result;
}

- (BOOL)isVoiceControlRunning
{
  [(UIElementProtocol *)self->_uiElement updateCache:1501];
  uiElement = self->_uiElement;

  return [(UIElementProtocol *)uiElement BOOLWithAXAttribute:1501];
}

- (BOOL)isDictationListening
{
  [(UIElementProtocol *)self->_uiElement updateCache:3010];
  uiElement = self->_uiElement;

  return [(UIElementProtocol *)uiElement BOOLWithAXAttribute:3010];
}

- (id)currentHardwareKeyboardLayout
{
  [(UIElementProtocol *)self->_uiElement updateCache:3013];
  uiElement = self->_uiElement;

  return [(UIElementProtocol *)uiElement stringWithAXAttribute:3013];
}

- (id)currentSoftwareKeyboardLanguage
{
  [(UIElementProtocol *)self->_uiElement updateCache:3019];
  uiElement = self->_uiElement;

  return [(UIElementProtocol *)uiElement stringWithAXAttribute:3019];
}

- (id)currentSoftwareKeyboardLayout
{
  if (![(VOTElement *)self isApplication]) {
    _AXAssert();
  }
  [(UIElementProtocol *)self->_uiElement updateCache:3018];
  uiElement = self->_uiElement;

  return [(UIElementProtocol *)uiElement stringWithAXAttribute:3018];
}

- (void)setContentOffset:(CGPoint)a3
{
}

- (CGPoint)contentOffset
{
  [(UIElementProtocol *)self->_uiElement updateCache:5064];
  uiElement = self->_uiElement;

  [(UIElementProtocol *)uiElement pointWithAXAttribute:5064];
  result.CGFloat y = v5;
  result.CGFloat x = v4;
  return result;
}

- (BOOL)isSiriTalkingOrListening
{
  if (AXDeviceIsAudioAccessory()) {
    return [(id)VOTSharedWorkspace systemVisualizationState] == (id)14;
  }
  if ([(id)VOTSharedWorkspace isSiriTalking]) {
    return 1;
  }
  double v3 = (void *)VOTSharedWorkspace;

  return _[v3 isSiriListening];
}

- (BOOL)isSystemWideGestureInProgress
{
  [(UIElementProtocol *)self->_uiElement updateCache:1506];
  uiElement = self->_uiElement;

  return [(UIElementProtocol *)uiElement BOOLWithAXAttribute:1506];
}

- (BOOL)showBulletinBoard:(BOOL)a3
{
  uiElement = self->_uiElement;
  double v4 = +[NSNumber numberWithBool:a3];
  LOBYTE(uiElement) = [(UIElementProtocol *)uiElement performAXAction:5000 withValue:v4];

  return (char)uiElement;
}

- (BOOL)showControlCenter:(BOOL)a3
{
  uiElement = self->_uiElement;
  double v4 = +[NSNumber numberWithBool:a3];
  LOBYTE(uiElement) = [(UIElementProtocol *)uiElement performAXAction:5014 withValue:v4];

  return (char)uiElement;
}

- (void)restoreUserPreferencesChangedByHandwriting
{
}

- (id)firstElementInStatusBar
{
  [(UIElementProtocol *)self->_uiElement updateCache:3011];
  double v3 = [(UIElementProtocol *)self->_uiElement objectWithAXAttribute:3011];
  double v4 = +[AXUIElement uiElementWithAXElement:v3];

  id v5 = [objc_allocWithZone((Class)VOTElement) initWithUIElement:v4];

  return v5;
}

- (id)statusBarElements
{
  return [(VOTElement *)self elementsForAttribute:3054];
}

- (BOOL)avoidAnnouncingDirectTouchArea
{
  return [(VOTElement *)self directTouchOptions] & 1;
}

- (CGRect)convertRect:(CGRect)a3 fromContextId:(unsigned int)a4
{
  CGRect valuePtr = a3;
  AXValueRef v6 = AXValueCreate(kAXValueTypeCGRect, &valuePtr);
  uiElement = self->_uiElement;
  BOOL v8 = +[NSNumber numberWithUnsignedInteger:a4];
  id v9 = (const __AXValue *)[(UIElementProtocol *)uiElement objectWithAXAttribute:91505 parameter:+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v6, v8, 0)];

  if (v6) {
    CFRelease(v6);
  }
  if (v9) {
    AXValueGetValue(v9, kAXValueTypeCGRect, &valuePtr);
  }
  double width = valuePtr.size.width;
  double height = valuePtr.size.height;
  double x = valuePtr.origin.x;
  double y = valuePtr.origin.y;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 toContextId:(unsigned int)a4
{
  AXConvertPointToHostedCoordinates();
  result.double y = v5;
  result.double x = v4;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromContextId:(unsigned int)a4
{
  AXConvertPointFromHostedCoordinates();
  result.double y = v5;
  result.double x = v4;
  return result;
}

- (CGPath)convertPath:(CGPath *)a3 fromContextId:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  AXValueRef v6 = +[AXElement systemWideElement];
  id v7 = (CGPath *)[v6 convertPath:a3 fromContextId:v4];

  return v7;
}

- (CGRect)convertFrame:(CGRect)a3 fromContextId:(unsigned int)a4 fromDisplayId:(unsigned int)a5
{
  _AXConvertRectToHostedCoordinates(*(void *)&a4, *(void *)&a5, (__n128)a3.origin, *(__n128 *)&a3.origin.y, (__n128)a3.size, *(__n128 *)&a3.size.height);
  result.size.double height = v8;
  result.size.double width = v7;
  result.origin.double y = v6;
  result.origin.double x = v5;
  return result;
}

- (CGPath)convertPath:(CGPath *)a3 fromContextId:(unsigned int)a4 fromDisplayId:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  double v8 = +[AXElement systemWideElement];
  id v9 = (CGPath *)[v8 convertPath:a3 fromContextId:v6 displayId:v5];

  return v9;
}

- (BOOL)finishSetupIfAppropriate
{
  return [(UIElementProtocol *)self->_uiElement performAXAction:4019];
}

- (id)lastElementInStatusBar
{
  [(UIElementProtocol *)self->_uiElement updateCache:3012];
  double v3 = [(UIElementProtocol *)self->_uiElement objectWithAXAttribute:3012];
  uint64_t v4 = +[AXUIElement uiElementWithAXElement:v3];

  id v5 = [objc_allocWithZone((Class)VOTElement) initWithUIElement:v4];

  return v5;
}

- (BOOL)isElementFirstElement:(BOOL)a3 orLastElement:(BOOL)a4 withType:(unint64_t)a5
{
  BOOL v6 = a4;
  if (a3)
  {
    double v8 = [(UIElementProtocol *)self->_uiElement objectWithAXAttribute:92509 parameter:+[NSNumber numberWithUnsignedLong:a5]];
    unsigned __int8 v9 = [v8 BOOLValue];

    if (v9) {
      return v9;
    }
  }
  else
  {
    unsigned __int8 v9 = 0;
  }
  if (v6)
  {
    id v10 = [(UIElementProtocol *)self->_uiElement objectWithAXAttribute:92510 parameter:+[NSNumber numberWithUnsignedLong:a5]];
    unsigned __int8 v11 = [v10 BOOLValue];

    return v11;
  }
  return v9;
}

- (NSString)description
{
  uiElement = self->_uiElement;
  uint64_t v4 = [(VOTElement *)self label];
  [(VOTElement *)self frame];
  id v5 = NSStringFromRect(v11);
  BOOL v6 = [(VOTElement *)self application];
  double v7 = [v6 bundleIdentifier];
  double v8 = +[NSString stringWithFormat:@"VOTElement %p { %@ } %@ %@ %@", self, uiElement, v4, v5, v7];

  return (NSString *)v8;
}

- (NSString)toggleStatusLabel
{
  if (![(VOTElement *)self doesHaveTraits:kAXToggleTrait])
  {
    CGSize v12 = 0;
    goto LABEL_20;
  }
  unsigned int v3 = [(VOTElement *)self isSwitch];
  unsigned int v4 = [(VOTElement *)self doesHaveTraits:kAXWebContentTrait];
  id v5 = [(VOTElement *)self value];
  BOOL v6 = [(id)VOTSharedWorkspace selectedLanguage];
  if (([v5 isEqualToString:@"0"] & 1) != 0
    || v3 && [v5 isEqualToString:@"2"])
  {
    double v7 = off_1001EA9E8;
    BOOL v8 = (v4 & (v3 ^ 1)) == 0;
    if ((v4 & (v3 ^ 1)) != 0) {
      unsigned __int8 v9 = @"element.unchecked.text";
    }
    else {
      unsigned __int8 v9 = @"element.off.text";
    }
    CFStringRef v10 = @"off";
    CFStringRef v11 = @"unchecked";
    goto LABEL_15;
  }
  if ([v5 isEqualToString:@"1"])
  {
    double v7 = off_1001EA9E8;
    BOOL v8 = (v4 & (v3 ^ 1)) == 0;
    if ((v4 & (v3 ^ 1)) != 0) {
      unsigned __int8 v9 = @"element.checked.text";
    }
    else {
      unsigned __int8 v9 = @"element.on.text";
    }
    CFStringRef v10 = @"on";
    CFStringRef v11 = @"checked";
LABEL_15:
    if (v8) {
      CFTypeID v13 = (__CFString *)v10;
    }
    else {
      CFTypeID v13 = (__CFString *)v11;
    }
    goto LABEL_18;
  }
  if (![v5 isEqualToString:@"2"])
  {
    id v14 = v5;
    goto LABEL_19;
  }
  double v7 = off_1001EA9E8;
  unsigned __int8 v9 = @"element.mixed.text";
  CFTypeID v13 = @"mixed";
LABEL_18:
  sub_100051D04(v7, v9, v13, v6);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:
  CGSize v12 = v14;

LABEL_20:

  return (NSString *)v12;
}

- (BOOL)shouldStartReadAllOnFocus
{
  return [(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:2038];
}

- (VOTElementUniqueIdentification)uniqueIdentification
{
  double v2 = self;
  objc_sync_enter(v2);
  uniqueIdentification = v2->_uniqueIdentification;
  if (uniqueIdentification) {
    id v4 = [(VOTElementUniqueIdentification *)uniqueIdentification copy];
  }
  else {
    id v4 = 0;
  }
  objc_sync_exit(v2);

  if (!v4)
  {
    id v4 = +[VOTElementUniqueIdentification identificationFromElement:v2];
    id v5 = v2;
    objc_sync_enter(v5);
    BOOL v6 = (VOTElementUniqueIdentification *)[v4 copy];
    double v7 = v2->_uniqueIdentification;
    v2->_uniqueIdentification = v6;

    objc_sync_exit(v5);
  }

  return (VOTElementUniqueIdentification *)v4;
}

- (BOOL)webSearchResultsActive
{
  [(UIElementProtocol *)self->_uiElement updateCache:2032];
  uiElement = self->_uiElement;

  return [(UIElementProtocol *)uiElement BOOLWithAXAttribute:2032];
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)nonPersistentUniqueId
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(UIElementProtocol *)self->_uiElement axElement];
    unint64_t v3 = _AXUIElementIDForElement();
  }
  else
  {
    unint64_t v3 = 0;
    unint64_t v4 = 0;
  }
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

- (BOOL)isApplication
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uiElement = self->_uiElement;
    return [(UIElementProtocol *)uiElement isApplication];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = (const __AXUIElement *)[(UIElementProtocol *)self->_uiElement axElement];
      _AXUIElementIDForElement();
      uint64_t v7 = v6;
      pid_t pid = 0;
      AXUIElementGetPid(v5, &pid);
      return v7 == kAXApplicationUID && pid >= 0;
    }
    else
    {
      return 0;
    }
  }
}

- (BOOL)applicationHandleRemoteUpButton
{
  return [(UIElementProtocol *)self->_uiElement performAXAction:4100];
}

- (BOOL)applicationHandleRemoteDownButton
{
  return [(UIElementProtocol *)self->_uiElement performAXAction:4101];
}

- (BOOL)applicationHandleRemoteLeftButton
{
  return [(UIElementProtocol *)self->_uiElement performAXAction:4103];
}

- (BOOL)applicationHandleRemoteRightButton
{
  return [(UIElementProtocol *)self->_uiElement performAXAction:4102];
}

- (int)applicationInterfaceOrientation
{
  [(UIElementProtocol *)self->_uiElement updateCache:3035];
  unint64_t v3 = [(UIElementProtocol *)self->_uiElement numberWithAXAttribute:3035];
  int v4 = [v3 integerValue];

  return v4;
}

- (CGRect)convertAccessibilityFrameToScreenCoordinates:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIElementProtocol *)self->_uiElement updateCache:2021];
  uint64_t v8 = [(VOTElement *)self windowContextId];
  unsigned __int8 v9 = +[VOTElement systemWideElement];
  objc_msgSend(v9, "convertRect:fromContextId:", v8, x, y, width, height);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  double v18 = v11;
  double v19 = v13;
  double v20 = v15;
  double v21 = v17;
  result.size.double height = v21;
  result.size.double width = v20;
  result.origin.double y = v19;
  result.origin.double x = v18;
  return result;
}

- (NSString)visibleText
{
  unint64_t v3 = [(VOTElement *)self uiElement];
  int v4 = [v3 stringWithAXAttribute:3053];

  if (![v4 length])
  {
    uint64_t v5 = [(VOTElement *)self staticTextString];

    int v4 = (void *)v5;
  }

  return (NSString *)v4;
}

- (id)staticTextString
{
  unint64_t v3 = +[NSMutableString string];
  int v4 = [(VOTElement *)self value];
  if ([(VOTElement *)self doesHaveTraits:kAXToggleTrait])
  {
    uint64_t v5 = [(VOTElement *)self toggleStatusLabel];
    if ([v5 length])
    {
      id v6 = v5;

      int v4 = v6;
    }
  }
  if (!-[VOTElement doesHaveTraits:](self, "doesHaveTraits:", kAXTextAreaTrait) || ![v4 length])
  {
    uint64_t v7 = [(VOTElement *)self label];
    [v3 appendStringWithComma:v7];
  }
  [v3 appendStringWithComma:v4];
  uint64_t v8 = [(VOTElement *)self staticRecognitionText];
  [v3 appendStringWithComma:v8];

  return v3;
}

- (id)visionFeatureDescriptionOptions
{
  double v2 = +[AXSettings sharedInstance];
  id v3 = [v2 voiceOverDiscoveredSensitiveContentFeedback];

  v8[0] = AXMFeatureDescriptionOptionLocale;
  int v4 = +[NSLocale localeWithLocaleIdentifier:@"en_US"];
  v9[0] = v4;
  v8[1] = AXMFeatureDescriptionOptionModifyForSensitiveContent;
  uint64_t v5 = +[NSNumber numberWithInt:v3 == 0];
  v9[1] = v5;
  id v6 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];

  return v6;
}

- (id)staticRecognitionText
{
  id v18 = +[NSMutableString string];
  id v3 = [(id)VOTSharedWorkspace visionEngine];
  int v4 = [v3 resultsForElement:self];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        double v11 = [(VOTElement *)self visionFeatureDescriptionOptions];
        double v12 = [v10 detectedFeatureDescriptionWithOptions:v11];

        if ([v12 length])
        {
          id v13 = [objc_alloc((Class)AXAttributedString) initWithString:v12];
          double v14 = [v10 captionFeatures];
          id v15 = [v14 count];

          if (AXRuntimeCheck_MediaAnalysisSupport())
          {
            double v16 = [v10 mediaAnalysisImageCaptionFeatures];
            id v15 = [v16 count];
          }
          if (v15) {
            [v13 setAttribute:@"en" forKey:UIAccessibilityTokenLanguage];
          }
          [v18 appendStringWithComma:v13];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }

  return v18;
}

- (id)dragSourceDescriptorDictionaries
{
  double v2 = [(VOTElement *)self uiElement];
  id v3 = [v2 arrayWithAXAttribute:2175];
  int v4 = [v3 axFilterObjectsUsingBlock:&stru_1001B3938];

  return v4;
}

- (id)cachedDragCustomActions
{
  id v3 = [(VOTElement *)self dragSourceDescriptorDictionaries];
  unsigned int v4 = [(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:2177];
  if ([(VOTElement *)self doesHaveTraits:kAXWebContentTrait]
    && ([(VOTElement *)self doesHaveTraits:kAXLinkTrait]
     || ([(VOTElement *)self doesHaveTraits:kAXImageTrait] | v4) == 1))
  {
    id v5 = [(VOTElement *)self remoteParent];

    if (v5)
    {
      id v6 = [(VOTElement *)self remoteParent];
      id v7 = [v6 touchContainer];
      uint64_t v8 = [v7 uiElement];
      id v5 = +[VOTElement elementWithUIElement:v8];

      uint64_t v9 = [v5 dragSourceDescriptorDictionaries];

      char v10 = 1;
      id v3 = (void *)v9;
    }
    else
    {
      char v10 = 1;
    }
  }
  else
  {
    char v10 = 0;
    id v5 = 0;
  }
  double v11 = +[NSMutableArray array];
  AXNamesForDrags();
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  void v18[2] = sub_100024320;
  void v18[3] = &unk_1001B3960;
  char v23 = v10;
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  long long v20 = self;
  id v21 = v5;
  id v12 = v11;
  id v22 = v12;
  id v13 = v5;
  id v14 = v19;
  [v3 enumerateObjectsUsingBlock:v18];
  id v15 = v22;
  id v16 = v12;

  return v16;
}

- (id)dragCustomActions
{
  [(UIElementProtocol *)self->_uiElement updateCache:2175];

  return [(VOTElement *)self cachedDragCustomActions];
}

- (id)dropPointDescriptorDictionaries
{
  double v2 = [(VOTElement *)self uiElement];
  id v3 = [v2 arrayWithAXAttribute:2176];
  unsigned int v4 = [v3 axFilterObjectsUsingBlock:&stru_1001B3980];

  return v4;
}

- (id)cachedDropCustomActions
{
  double v2 = [(VOTElement *)self dropPointDescriptorDictionaries];
  id v3 = +[NSMutableArray array];
  AXNamesForDrops();
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  void v9[2] = sub_10002484C;
  v9[3] = &unk_1001B39A8;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = v3;
  id v11 = v4;
  id v5 = v10;
  [v2 enumerateObjectsUsingBlock:v9];
  id v6 = v11;
  id v7 = v4;

  return v7;
}

- (id)dropCustomActions
{
  [(UIElementProtocol *)self->_uiElement updateCache:2176];

  return [(VOTElement *)self cachedDropCustomActions];
}

- (BOOL)activateDragWithDescriptorDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [(VOTElement *)self uiElement];
  v8[0] = AXDragServiceNameVoiceOver;
  v8[1] = v4;
  id v6 = +[NSArray arrayWithObjects:v8 count:2];

  LOBYTE(self) = [v5 performAXAction:2050 withValue:v6];
  return (char)self;
}

- (BOOL)prefersContextlessPassthrough
{
  double v2 = [(VOTElement *)self uiElement];
  unsigned __int8 v3 = [v2 BOOLWithAXAttribute:2174];

  return v3;
}

- (BOOL)shouldSpeakMathEquationTrait
{
  double v2 = [(VOTElement *)self uiElement];
  unsigned __int8 v3 = [v2 BOOLWithAXAttribute:2402];

  return v3;
}

- (BOOL)shouldExpandMathEquation
{
  double v2 = [(VOTElement *)self uiElement];
  unsigned __int8 v3 = [v2 BOOLWithAXAttribute:2403];

  return v3;
}

- (id)elementCommunityIdentifier
{
  double v2 = [(VOTElement *)self uiElement];
  unsigned __int8 v3 = [v2 stringWithAXAttribute:2100];

  return v3;
}

- (id)isolatedWindow
{
  return [(VOTElement *)self elementForAttribute:2099];
}

- (id)chartDescriptor
{
  double v2 = [(VOTElement *)self chartElement];
  objc_opt_class();
  unsigned __int8 v3 = [v2 uiElement];
  id v4 = [v3 objectWithAXAttribute:2711];
  id v5 = __UIAccessibilityCastAsClass();

  id v6 = [objc_alloc((Class)AXMChartDescriptor) initWithDictionary:v5];

  return v6;
}

- (VOTElement)chartElement
{
  return (VOTElement *)[(VOTElement *)self elementForAttribute:2714];
}

- (NSString)chartStructureDescription
{
  double v2 = [(VOTElement *)self chartElement];
  unsigned __int8 v3 = [v2 uiElement];
  id v4 = [v3 stringWithAXAttribute:2718];

  return (NSString *)v4;
}

- (id)dataSeriesName
{
  double v2 = [(VOTElement *)self dataSeriesElement];
  unsigned __int8 v3 = [v2 uiElement];
  id v4 = [v3 stringWithAXAttribute:2702];

  return v4;
}

- (int64_t)dataSeriesType
{
  double v2 = [(VOTElement *)self dataSeriesElement];
  unsigned __int8 v3 = [v2 uiElement];
  id v4 = [v3 numberWithAXAttribute:2703];
  id v5 = [v4 unsignedIntegerValue];

  return (int64_t)v5;
}

- (BOOL)supportsAudiographActions
{
  int v3 = AXDeviceSupportsSonification();
  if (v3)
  {
    if ([(VOTElement *)self supportsDataSeriesSonification]
      || [(VOTElement *)self supportsDataSeriesSummarization])
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      LOBYTE(v3) = [(VOTElement *)self supportsAudiographs];
    }
  }
  return v3;
}

- (BOOL)supportsDataSeriesSummarization
{
  double v2 = [(VOTElement *)self dataSeriesElement];
  int v3 = [v2 uiElement];
  unsigned __int8 v4 = [v3 BOOLWithAXAttribute:2705];

  return v4;
}

- (BOOL)supportsDataSeriesSonification
{
  double v2 = [(VOTElement *)self dataSeriesElement];
  int v3 = [v2 uiElement];
  unsigned __int8 v4 = [v3 BOOLWithAXAttribute:2706];

  return v4;
}

- (BOOL)supportsAudiographs
{
  int v3 = [(VOTElement *)self uiElement];
  unsigned __int8 v4 = [v3 BOOLWithAXAttribute:2713];

  id v5 = [(VOTElement *)self uiElement];
  id v6 = [v5 objectWithAXAttribute:2714];

  if (v6) {
    return 1;
  }
  else {
    return v4;
  }
}

- (BOOL)includesTrendlineInSonification
{
  double v2 = [(VOTElement *)self dataSeriesElement];
  int v3 = [v2 uiElement];
  unsigned __int8 v4 = [v3 BOOLWithAXAttribute:2707];

  return v4;
}

- (double)dataSeriesSonificationPlaybackDuration
{
  double v2 = [(VOTElement *)self dataSeriesElement];
  int v3 = [v2 uiElement];
  unsigned __int8 v4 = [v3 numberWithAXAttribute:2704];
  [v4 floatValue];
  double v6 = v5;

  return v6;
}

- (id)dataSeriesValuesForAxis:(int64_t)a3
{
  unsigned __int8 v4 = [(VOTElement *)self dataSeriesElement];
  float v5 = +[NSNumber numberWithLong:a3];
  double v6 = [v4 arrayForParameterizedAttribute:95239 parameter:v5];

  return v6;
}

- (id)dataSeriesTitleForAxis:(int64_t)a3
{
  unsigned __int8 v4 = [(VOTElement *)self dataSeriesElement];
  float v5 = +[NSNumber numberWithLong:a3];
  double v6 = [v4 stringForParameterizedAttribute:95240 parameter:v5];

  if (![v6 length])
  {
    if (a3) {
      id v7 = @"search.rotor.audiograph.axis.y";
    }
    else {
      id v7 = @"search.rotor.audiograph.axis.x";
    }
    uint64_t v8 = sub_100051804(off_1001EA9E8, v7, 0);

    double v6 = (void *)v8;
  }

  return v6;
}

- (double)dataSeriesMinimumValueForAxis:(int64_t)a3
{
  unsigned __int8 v4 = [(VOTElement *)self dataSeriesElement];
  float v5 = [v4 uiElement];
  double v6 = objc_msgSend(v5, "objectWithAXAttribute:parameter:", 95241, +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", a3));

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v6 doubleValue];
    double v8 = v7;
  }
  else
  {
    double v8 = -1.79769313e308;
  }

  return v8;
}

- (double)dataSeriesMaximumValueForAxis:(int64_t)a3
{
  unsigned __int8 v4 = [(VOTElement *)self dataSeriesElement];
  float v5 = [v4 uiElement];
  double v6 = objc_msgSend(v5, "objectWithAXAttribute:parameter:", 95242, +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", a3));

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v6 doubleValue];
    double v8 = v7;
  }
  else
  {
    double v8 = 1.79769313e308;
  }

  return v8;
}

- (id)dataSeriesUnitsLabelForAxis:(int64_t)a3
{
  unsigned __int8 v4 = [(VOTElement *)self dataSeriesElement];
  float v5 = [v4 uiElement];
  double v6 = objc_msgSend(v5, "objectWithAXAttribute:parameter:", 95244, +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", a3));

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  return v7;
}

- (id)dataSeriesGridlinePositionsForAxis:(int64_t)a3
{
  unsigned __int8 v4 = [(VOTElement *)self dataSeriesElement];
  float v5 = +[NSNumber numberWithLong:a3];
  double v6 = [v4 arrayForParameterizedAttribute:95243 parameter:v5];

  return v6;
}

- (id)dataSeriesCategoryLabelsForAxis:(int64_t)a3
{
  unsigned __int8 v4 = [(VOTElement *)self dataSeriesElement];
  float v5 = +[NSNumber numberWithLong:a3];
  double v6 = [v4 arrayForParameterizedAttribute:95245 parameter:v5];

  return v6;
}

- (id)dataSeriesXAxisValueDescriptionForPosition:(double)a3
{
  unsigned __int8 v4 = [(VOTElement *)self dataSeriesElement];
  float v5 = objc_msgSend(v4, "stringForParameterizedAttribute:parameter:", 95247, +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));

  return v5;
}

- (id)dataSeriesYAxisValueDescriptionForPosition:(double)a3
{
  unsigned __int8 v4 = [(VOTElement *)self dataSeriesElement];
  float v5 = objc_msgSend(v4, "stringForParameterizedAttribute:parameter:", 95248, +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));

  return v5;
}

- (id)dataSeriesAxesDescription
{
  int v3 = [(VOTElement *)self dataSeriesElement];
  uint64_t v4 = [v3 dataSeriesTitleForAxis:0];
  uint64_t v5 = [v3 dataSeriesTitleForAxis:1];
  double v6 = [v3 dataSeriesUnitsLabelForAxis:0];
  CGRect v37 = [v3 dataSeriesUnitsLabelForAxis:1];
  [v3 dataSeriesMinimumValueForAxis:0];
  uint64_t v35 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v3 dataSeriesMaximumValueForAxis:0];
  uint64_t v7 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v3 dataSeriesMinimumValueForAxis:1];
  uint64_t v34 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v3 dataSeriesMaximumValueForAxis:1];
  uint64_t v8 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  uint64_t v9 = [(VOTElement *)self language];
  sub_100051804(off_1001EA9E8, @"search.rotor.audiograph.axes.description.format", v9);
  v33 = id v10 = (void *)v4;
  CGRect v32 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, v5);
  id v11 = [v3 dataSeriesXAxisValueDescriptionForPosition:0.0];
  id v12 = [v3 dataSeriesXAxisValueDescriptionForPosition:1.0];
  CGRect v36 = v6;
  CGRect v31 = (void *)v5;
  float v29 = v9;
  uint64_t v30 = (void *)v7;
  if ([v11 length] && objc_msgSend(v12, "length"))
  {
    id v13 = sub_100051804(off_1001EA9E8, @"search.rotor.audiograph.axes.hint.format.no.units", v9);
    id v14 = (void *)v8;
    id v15 = (void *)v34;
    id v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v5, v34, v8, v10, v11, v12);
    double v17 = (void *)v35;
  }
  else
  {
    if ([v6 length] && objc_msgSend(v37, "length"))
    {
      id v13 = sub_100051804(off_1001EA9E8, @"search.rotor.audiograph.axes.hint.format", v9);
      uint64_t v27 = v7;
      long long v28 = v6;
      long long v26 = v6;
      double v17 = (void *)v35;
      long long v24 = v10;
      uint64_t v25 = v35;
      id v22 = (void *)v8;
      char v23 = v37;
      id v14 = (void *)v8;
      id v21 = v37;
    }
    else
    {
      id v13 = sub_100051804(off_1001EA9E8, @"search.rotor.audiograph.axes.hint.format.no.units", v9);
      long long v24 = (void *)v7;
      double v17 = (void *)v35;
      id v22 = v10;
      char v23 = (void *)v35;
      id v14 = (void *)v8;
      id v21 = (void *)v8;
    }
    id v15 = (void *)v34;
    id v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v5, v34, v21, v22, v23, v24, v25, v26, v27, v28);
  }

  v38[0] = v32;
  v38[1] = v16;
  id v18 = +[NSArray arrayWithObjects:v38 count:2];
  id v19 = [v18 componentsJoinedByString:@", "];

  return v19;
}

- (void)setDeviceOrientation:(int64_t)a3
{
  id v4 = +[AXSpringBoardServer server];
  [v4 setOrientation:a3];
}

- (void)setAccelemoterDisabled:(BOOL)a3
{
}

- (void)setRotationCapabilityEnabled:(BOOL)a3
{
  id v4 = [objc_allocWithZone((Class)NSNumber) initWithBool:a3];
  [(UIElementProtocol *)self->_uiElement performAXAction:5009 withValue:v4];
}

- (id)customActionGroupIdentifier
{
  return [(UIElementProtocol *)self->_uiElement stringWithAXAttribute:2178];
}

- (void)setEventCaptureMode:(int)a3
{
  id v4 = [objc_allocWithZone((Class)NSNumber) initWithInt:*(void *)&a3];
  [(UIElementProtocol *)self->_uiElement performAXAction:5003 withValue:v4];
}

- (void)unsetEventCaptureMode:(int)a3
{
  id v4 = [objc_allocWithZone((Class)NSNumber) initWithInt:*(void *)&a3];
  [(UIElementProtocol *)self->_uiElement performAXAction:5022 withValue:v4];
}

- (BOOL)dispatchKeyboardEvent:(id)a3
{
  uiElement = self->_uiElement;
  id v4 = [a3 dataRepresentation];
  LOBYTE(uiElement) = [(UIElementProtocol *)uiElement performAXAction:2034 withValue:v4];

  return (char)uiElement;
}

- (id)windowContextIDs
{
  return [(UIElementProtocol *)self->_uiElement arrayWithAXAttribute:3040];
}

- (void)repostEvent:(id)a3
{
  id v7 = a3;
  if ([(id)VOTSharedWorkspace inUnitTestMode])
  {
    id v4 = +[VOTWorkspace sharedWorkspace];
    [v4 notePostedEventForUnitTesting:v7];
  }
  [v7 setSenderID:0x8000000817319373];
  uiElement = self->_uiElement;
  double v6 = [v7 dataRepresentation];
  [(UIElementProtocol *)uiElement performAXAction:5002 withValue:v6];
}

- (void)sendBrightnessEvent:(id)a3
{
}

- (void)sendTouchCancelledEvent
{
}

- (void)sendUserEventOccurred
{
}

- (void)notifyAnnouncementFinishedWithString:(id)a3 didFinishSuccessfully:(BOOL)a4
{
  BOOL v4 = a4;
  double v6 = (__CFString *)a3;
  if (v6) {
    id v7 = v6;
  }
  else {
    id v7 = &stru_1001B7888;
  }
  v10[0] = @"String";
  v10[1] = @"DidFinish";
  v11[0] = v7;
  uint64_t v8 = +[NSNumber numberWithBool:v4];
  v11[1] = v8;
  uint64_t v9 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];

  [(UIElementProtocol *)self->_uiElement performAXAction:2025 withValue:v9];
}

- (BOOL)supportsDirectionOrbManipulation
{
  return [(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:3030];
}

- (BOOL)performSimpleTapAtPoint:(CGPoint)a3 forElement:(id)a4
{
  LODWORD(v4) = 1028443341;
  return -[VOTElement performSimpleTapAtPoint:withForce:withContextId:withDelay:forElement:](self, "performSimpleTapAtPoint:withForce:withContextId:withDelay:forElement:", 0, a4, a3.x, a3.y, 0.0, v4);
}

- (BOOL)performSimpleTapAtPoint:(CGPoint)a3 withForce:(double)a4 withContextId:(unsigned int)a5 withDelay:(float)a6 forElement:(id)a7
{
  uint64_t v8 = *(void *)&a5;
  CGPoint v29 = a3;
  id v11 = a7;
  AXValueRef v12 = AXValueCreate(kAXValueTypeCGPoint, &v29);
  -[VOTElement updateTouchForceSounds:](self, "updateTouchForceSounds:", a4, *(void *)&v29.x, *(void *)&v29.y);
  id v13 = [v11 secureName];
  if (!v13)
  {
    unsigned int v18 = 0;
    goto LABEL_14;
  }
  id v14 = [v11 uiElement];
  id v15 = [v14 stringWithAXAttribute:2001];

  if ((byte_1001EB739 & 1) == 0)
  {
    v30[0] = 0;
    if (!qword_1001EB748)
    {
      v30[1] = _NSConcreteStackBlock;
      v30[2] = (void *)3221225472;
      v30[3] = sub_100026F84;
      v30[4] = &unk_1001B3580;
      v30[5] = v30;
      long long v33 = off_1001B39C8;
      uint64_t v34 = 0;
      qword_1001EB748 = _sl_dlopen();
    }
    id v19 = (void *)qword_1001EB748;
    if (!qword_1001EB748) {
      sub_10011C5D4(v30);
    }
    if (v30[0]) {
      free(v30[0]);
    }
    off_1001EB740 = (uint64_t (*)(void, void))dlsym(v19, "UISLocalizedStringForSecureName");
    byte_1001EB739 = 1;
    if (off_1001EB740) {
      goto LABEL_4;
    }
LABEL_12:
    unsigned int v18 = 0;
    goto LABEL_13;
  }
  if (!off_1001EB740) {
    goto LABEL_12;
  }
LABEL_4:
  id v16 = [v11 currentLocalization];
  double v17 = off_1001EB740(v13, v16);
  unsigned int v18 = [v15 isEqualToString:v17];

LABEL_13:
LABEL_14:
  v32[0] = v12;
  v31[0] = kAXSimulatePressAtPointActionKeyPoint;
  v31[1] = kAXSimulatePressAtPointActionKeyForce;
  long long v20 = +[NSNumber numberWithDouble:a4];
  v32[1] = v20;
  v31[2] = kAXSimulatePressAtPointActionKeyWindowContextID;
  id v21 = +[NSNumber numberWithUnsignedInt:v8];
  void v32[2] = v21;
  v31[3] = kAXSimulatePressAtPointActionKeyDelay;
  *(float *)&double v22 = a6;
  char v23 = +[NSNumber numberWithFloat:v22];
  v32[3] = v23;
  v31[4] = kAXSimulatePressAtPointActionKeySecureName;
  if (v18) {
    uint64_t v24 = v13;
  }
  else {
    uint64_t v24 = 0;
  }
  uint64_t v25 = +[NSNumber numberWithUnsignedInt:v24];
  void v32[4] = v25;
  long long v26 = +[NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:5];

  unsigned __int8 v27 = [(UIElementProtocol *)self->_uiElement performAXAction:5008 withValue:v26];
  if (v12) {
    CFRelease(v12);
  }

  return v27;
}

- (void)postStylusTouchAtPoint:(CGPoint)a3 withForce:(double)a4 altitude:(double)a5 azimuth:(double)a6 withContextId:(unsigned int)a7
{
  uint64_t v7 = *(void *)&a7;
  CGPoint v21 = a3;
  AXValueRef v12 = AXValueCreate(kAXValueTypeCGPoint, &v21);
  v22[0] = v12;
  *(float *)&double v13 = a4;
  id v14 = +[NSNumber numberWithFloat:v13];
  v22[1] = v14;
  *(float *)&double v15 = a5;
  id v16 = +[NSNumber numberWithFloat:v15];
  v22[2] = v16;
  *(float *)&double v17 = a6;
  unsigned int v18 = +[NSNumber numberWithFloat:v17];
  v22[3] = v18;
  id v19 = +[NSNumber numberWithUnsignedInt:v7];
  v22[4] = v19;
  long long v20 = +[NSArray arrayWithObjects:v22 count:5];

  [(UIElementProtocol *)self->_uiElement performAXAction:5017 withValue:v20];
  if (v12) {
    CFRelease(v12);
  }
}

- (void)postStylusDragAtPoint:(CGPoint)a3 withForce:(double)a4 altitude:(double)a5 azimuth:(double)a6 withContextId:(unsigned int)a7
{
  uint64_t v7 = *(void *)&a7;
  CGPoint v21 = a3;
  AXValueRef v12 = AXValueCreate(kAXValueTypeCGPoint, &v21);
  v22[0] = v12;
  *(float *)&double v13 = a4;
  id v14 = +[NSNumber numberWithFloat:v13];
  v22[1] = v14;
  *(float *)&double v15 = a5;
  id v16 = +[NSNumber numberWithFloat:v15];
  v22[2] = v16;
  *(float *)&double v17 = a6;
  unsigned int v18 = +[NSNumber numberWithFloat:v17];
  v22[3] = v18;
  id v19 = +[NSNumber numberWithUnsignedInt:v7];
  v22[4] = v19;
  long long v20 = +[NSArray arrayWithObjects:v22 count:5];

  [(UIElementProtocol *)self->_uiElement performAXAction:5018 withValue:v20];
  if (v12) {
    CFRelease(v12);
  }
}

- (void)postStylusLiftAtPoint:(CGPoint)a3 withContextId:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  CGPoint valuePtr = a3;
  AXValueRef v6 = AXValueCreate(kAXValueTypeCGPoint, &valuePtr);
  v10[0] = v6;
  uint64_t v7 = +[NSNumber numberWithUnsignedInt:v4];
  v10[1] = v7;
  uint64_t v8 = +[NSArray arrayWithObjects:v10 count:2];

  [(UIElementProtocol *)self->_uiElement performAXAction:5019 withValue:v8];
  if (v6) {
    CFRelease(v6);
  }
}

- (void)postFingerTouchAtPoint:(CGPoint)a3 withForce:(double)a4 withContextId:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  CGPoint v13 = a3;
  AXValueRef v8 = AXValueCreate(kAXValueTypeCGPoint, &v13);
  v14[0] = v8;
  *(float *)&double v9 = a4;
  id v10 = +[NSNumber numberWithFloat:v9];
  v14[1] = v10;
  id v11 = +[NSNumber numberWithUnsignedInt:v5];
  v14[2] = v11;
  AXValueRef v12 = +[NSArray arrayWithObjects:v14 count:3];

  [(VOTElement *)self updateTouchForceSounds:a4];
  [(UIElementProtocol *)self->_uiElement performAXAction:5004 withValue:v12];
  if (v8) {
    CFRelease(v8);
  }
}

- (void)postFingerDragAtPoint:(CGPoint)a3 withForce:(double)a4 withContextId:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  CGPoint v13 = a3;
  AXValueRef v8 = AXValueCreate(kAXValueTypeCGPoint, &v13);
  [(VOTElement *)self updateTouchForceSounds:a4];
  v14[0] = v8;
  *(float *)&double v9 = a4;
  id v10 = +[NSNumber numberWithFloat:v9];
  v14[1] = v10;
  id v11 = +[NSNumber numberWithUnsignedInt:v5];
  v14[2] = v11;
  AXValueRef v12 = +[NSArray arrayWithObjects:v14 count:3];

  [(UIElementProtocol *)self->_uiElement performAXAction:5005 withValue:v12];
  if (v8) {
    CFRelease(v8);
  }
}

- (void)postFingerLiftAtPoint:(CGPoint)a3 withContextId:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  CGPoint valuePtr = a3;
  AXValueRef v6 = AXValueCreate(kAXValueTypeCGPoint, &valuePtr);
  [(VOTElement *)self updateTouchForceSounds:0.0];
  v10[0] = v6;
  uint64_t v7 = +[NSNumber numberWithUnsignedInt:v4];
  v10[1] = v7;
  AXValueRef v8 = +[NSArray arrayWithObjects:v10 count:2];

  [(UIElementProtocol *)self->_uiElement performAXAction:5006 withValue:v8];
  if (v6) {
    CFRelease(v6);
  }
}

- (void)updateTouchForceSounds:(double)a3
{
  int lastOrbSoundLevel = self->_lastOrbSoundLevel;
  if (!lastOrbSoundLevel)
  {
    AXForceTouchThresholdPeek();
    if (v6 < a3)
    {
      self->_int lastOrbSoundLevel = 1;
      uint64_t v7 = +[VOTOutputManager outputManager];
      id v13 = v7;
      CFStringRef v8 = @"Sounds/VOTOrbSound1-OrbHW.aiff";
LABEL_8:
      [v7 playSoundFast:v8];

      return;
    }
    int lastOrbSoundLevel = self->_lastOrbSoundLevel;
  }
  if (lastOrbSoundLevel == 1)
  {
    AXForceTouchThresholdPeekPopMidpoint();
    if (v9 < a3)
    {
      self->_int lastOrbSoundLevel = 2;
      uint64_t v7 = +[VOTOutputManager outputManager];
      id v13 = v7;
      CFStringRef v8 = @"Sounds/VOTOrbSound2-OrbHW.aiff";
      goto LABEL_8;
    }
    int lastOrbSoundLevel = self->_lastOrbSoundLevel;
  }
  if (lastOrbSoundLevel == 2)
  {
    AXForceTouchThresholdPop();
    if (v10 < a3)
    {
      id v11 = +[VOTOutputManager outputManager];
      [v11 playSoundFast:@"Sounds/VOTOrbSound3-OrbHW.aiff"];

      self->_int lastOrbSoundLevel = 3;
      return;
    }
    int lastOrbSoundLevel = self->_lastOrbSoundLevel;
  }
  if (lastOrbSoundLevel == 3)
  {
    AXForceTouchThresholdPeek();
    if (v12 > a3) {
      self->_int lastOrbSoundLevel = 0;
    }
  }
}

- (unint64_t)directTouchOptions
{
  [(UIElementProtocol *)self->_uiElement updateCache:2233];
  int v3 = [(UIElementProtocol *)self->_uiElement numberWithAXAttribute:2233];
  id v4 = [v3 integerValue];

  return (unint64_t)v4;
}

- (BOOL)isKeyboardContinuousPathAvailable
{
  return [(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:2195];
}

- (BOOL)isKeyboardContinuousPathTracking
{
  [(UIElementProtocol *)self->_uiElement updateCache:2194];
  uiElement = self->_uiElement;

  return [(UIElementProtocol *)uiElement BOOLWithAXAttribute:2194];
}

- (BOOL)isKeyboardEmojiInputMode
{
  return [(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:2240];
}

- (BOOL)isInternationalKeyboardKey
{
  return [(UIElementProtocol *)self->_uiElement BOOLWithAXAttribute:3020];
}

- (id)activeKeyboard
{
  return [(VOTElement *)self elementForAttribute:2076];
}

- (BOOL)isDataSeriesElement
{
  double v2 = [(VOTElement *)self containerTypes];
  unsigned __int8 v3 = [v2 containsObject:&off_1001C50C8];

  return v3;
}

- (id)dataSeriesElement
{
  return [(VOTElement *)self ancestryForTraits:4096];
}

- (BOOL)includesTrendlineSonification
{
  return 1;
}

- (void)resetAspectMask
{
}

- (int64_t)differenceAspectMask:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(VOTElement *)self label];
    uint64_t v6 = [v4 label];
    if (v5 | v6 && ![(id)v5 isEqualToString:v6]) {
      uint64_t v7 = 31;
    }
    else {
      uint64_t v7 = 30;
    }
    uint64_t v9 = [(VOTElement *)self value];

    uint64_t v10 = [v4 value];

    if (!(v9 | v10) || [(id)v9 isEqualToString:v10]) {
      v7 &= ~2uLL;
    }
    id v11 = [(VOTElement *)self traits];
    if (v11 == [v4 traits]) {
      unint64_t v12 = v7 & 0xFFFFFFFFFFFFFFFBLL;
    }
    else {
      unint64_t v12 = v7;
    }
    id v13 = [(VOTElement *)self rowRange];
    uint64_t v15 = v14;
    id v16 = [v4 rowRange];
    if (v15 == v17 && v13 == v16) {
      unint64_t v19 = v12 & 0xFFFFFFFFFFFFFFF7;
    }
    else {
      unint64_t v19 = v12;
    }
    [(VOTElement *)self frame];
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    CGFloat v27 = v26;
    [v4 frame];
    v34.origin.double x = v28;
    v34.origin.double y = v29;
    v34.size.double width = v30;
    v34.size.double height = v31;
    v33.origin.double x = v21;
    v33.origin.double y = v23;
    v33.size.double width = v25;
    v33.size.double height = v27;
    if (CGRectEqualToRect(v33, v34)) {
      unint64_t v8 = v19 & 0xFFFFFFFFFFFFFFEFLL;
    }
    else {
      unint64_t v8 = v19;
    }
  }
  else
  {
    unint64_t v8 = 31;
  }

  return v8;
}

- (VOTElementSnapshot)snapshot
{
  unsigned __int8 v3 = [VOTElementSnapshot alloc];
  id v4 = [(VOTElement *)self label];
  uint64_t v5 = [(VOTElement *)self value];
  unint64_t v6 = [(VOTElement *)self traits];
  id v7 = [(VOTElement *)self rowRange];
  uint64_t v9 = v8;
  [(VOTElement *)self frame];
  uint64_t v10 = [(VOTElementSnapshot *)v3 initWithLabel:v4 value:v5 traits:v6 rowRange:v7 frame:v9];

  return v10;
}

- (void)showEditingHUD
{
}

- (unsigned)secureName
{
  double v2 = [(UIElementProtocol *)self->_uiElement numberWithAXAttribute:2223];
  unsigned int v3 = [v2 unsignedIntValue];

  return v3;
}

- (id)currentLocalization
{
  return [(UIElementProtocol *)self->_uiElement stringWithAXAttribute:3064];
}

- (int64_t)versionedPID
{
  double v2 = [(UIElementProtocol *)self->_uiElement numberWithAXAttribute:3065];
  id v3 = [v2 longLongValue];

  return (int64_t)v3;
}

- (BOOL)shouldSkipValidateElement
{
  return self->shouldSkipValidateElement;
}

- (void)setShouldSkipValidateElement:(BOOL)a3
{
  self->shouldSkipValidateElement = a3;
}

- (BOOL)activatedDirectTouchThatRequiredActivation
{
  return self->_activatedDirectTouchThatRequiredActivation;
}

- (void)setActivatedDirectTouchThatRequiredActivation:(BOOL)a3
{
  self->_activatedDirectTouchThatRequiredActivation = a3;
}

- (NSString)supplementalBrailleDescription
{
  return self->_supplementalBrailleDescription;
}

- (void)setSupplementalBrailleDescription:(id)a3
{
}

- (BOOL)isFirstItemInDescriptionList
{
  return self->_isFirstItemInDescriptionList;
}

- (void)setIsFirstItemInDescriptionList:(BOOL)a3
{
  self->_isFirstItemInDescriptionList = a3;
}

- (int64_t)aspectMask
{
  return self->_aspectMask;
}

- (void)setAspectMask:(int64_t)a3
{
  self->_aspectMask = a3;
}

- (NSSet)previousSpokenValueParts
{
  return self->_previousSpokenValueParts;
}

- (void)setPreviousSpokenValueParts:(id)a3
{
}

- (unsigned)cachedDisplayId
{
  return self->_cachedDisplayId;
}

- (void)setCachedDisplayId:(unsigned int)a3
{
  self->_cachedDisplayId = a3;
}

- (VOTElement)cachedRemoteParent
{
  return self->_cachedRemoteParent;
}

- (void)setCachedRemoteParent:(id)a3
{
}

- (BOOL)checkedRemoteParent
{
  return self->_checkedRemoteParent;
}

- (void)setCheckedRemoteParent:(BOOL)a3
{
  self->_checkedRemoteParent = a3;
}

- (VOTElement)cachedImmediateRemoteParent
{
  return self->_cachedImmediateRemoteParent;
}

- (void)setCachedImmediateRemoteParent:(id)a3
{
}

- (BOOL)checkedImmediateRemoteParent
{
  return self->_checkedImmediateRemoteParent;
}

- (void)setCheckedImmediateRemoteParent:(BOOL)a3
{
  self->_checkedImmediateRemoteParent = a3;
}

- (VOTElement)cachedRemoteApplication
{
  return self->_cachedRemoteApplication;
}

- (void)setCachedRemoteApplication:(id)a3
{
}

- (void)setElementForGesturedTextInput:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementForGesturedTextInput, 0);
  objc_storeStrong((id *)&self->_cachedRemoteApplication, 0);
  objc_storeStrong((id *)&self->_cachedImmediateRemoteParent, 0);
  objc_storeStrong((id *)&self->_cachedRemoteParent, 0);
  objc_storeStrong((id *)&self->_previousSpokenValueParts, 0);
  objc_storeStrong((id *)&self->_supplementalBrailleDescription, 0);
  objc_storeStrong((id *)&self->_uniqueIdentification, 0);

  objc_storeStrong((id *)&self->_uiElement, 0);
}

- (id)arrayOfTraitsAsStringsWithTraitOrder:(id)a3 language:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [objc_allocWithZone((Class)NSMutableArray) init];
  unint64_t v9 = [(VOTElement *)self traits];
  uint64_t v10 = kAXSelectedTrait;
  if ((kAXSelectedTrait & v9) != 0)
  {
    id v11 = sub_100051D04(off_1001EA9E8, @"element.selected.text", @"selected", v7);
    [v8 addObject:v11];

    unint64_t v12 = +[NSNumber numberWithUnsignedLongLong:v10];
    [v6 addObject:v12];
  }
  uint64_t v13 = kAXMenuItemTrait;
  if ((kAXMenuItemTrait & v9) != 0)
  {
    uint64_t v14 = sub_100051D04(off_1001EA9E8, @"element.menu.item", @"menu item", v7);
    [v8 addObject:v14];

    uint64_t v15 = +[NSNumber numberWithUnsignedLongLong:v13];
    [v6 addObject:v15];
  }
  uint64_t v16 = kAXNotEnabledTrait;
  if ((kAXNotEnabledTrait & v9) != 0)
  {
    uint64_t v17 = sub_100051D04(off_1001EA9E8, @"element.disabled.text", @"dimmed", v7);
    [v8 addObject:v17];

    unsigned int v18 = +[NSNumber numberWithUnsignedLongLong:v16];
    [v6 addObject:v18];
  }
  v139 = self;
  uint64_t v19 = kAXInactiveTrait;
  if ((kAXInactiveTrait & v9) != 0)
  {
    double v20 = sub_100051D04(off_1001EA9E8, @"element.inactive.text", @"inactive", v7);
    [v8 addObject:v20];

    CGFloat v21 = +[NSNumber numberWithUnsignedLongLong:v19];
    [v6 addObject:v21];
  }
  uint64_t v22 = kAXButtonTrait;
  uint64_t v23 = kAXToggleTrait;
  uint64_t v24 = kAXBackButtonTrait;
  if (((kAXToggleTrait | kAXButtonTrait | kAXBackButtonTrait) & v9) != 0 && (kAXKeyboardKeyTrait & v9) == 0)
  {
    if ((kAXBackButtonTrait & v9) != 0)
    {
      CGFloat v25 = off_1001EA9E8;
      double v26 = @"back.button.element.text";
      CGFloat v27 = @"back button";
LABEL_13:
      CGFloat v28 = sub_100051D04(v25, v26, v27, v7);
LABEL_17:
      [v8 addObject:v28];

      CGFloat v30 = +[NSNumber numberWithUnsignedLongLong:v24];
      [v6 addObject:v30];

      goto LABEL_18;
    }
    unint64_t v29 = kAXWebContentTrait & v9;
    if ((kAXToggleTrait & v9) != 0 && !v29)
    {
      CGFloat v28 = sub_100051D04(off_1001EA9E8, @"switch.button.element.text", @"button", v7);
      uint64_t v24 = v23;
      goto LABEL_17;
    }
    uint64_t v24 = kAXTabButtonTrait;
    if ((kAXTabButtonTrait & v9) != 0)
    {
      CGFloat v25 = off_1001EA9E8;
      double v26 = @"tab.button.element.text";
      CGFloat v27 = @"tab";
      goto LABEL_13;
    }
    if ((kAXRadioButtonTrait & v9) == 0)
    {
      if ((kAXToggleTrait & v9) != 0 && v29)
      {
        if ([(VOTElement *)self supportsPressedState])
        {
          v133 = off_1001EA9E8;
          v134 = @"toggle.button.element.text";
        }
        else
        {
          unsigned int v135 = [(VOTElement *)self isSwitch];
          v133 = off_1001EA9E8;
          if (v135) {
            v134 = @"switch.button.element.text";
          }
          else {
            v134 = @"checkbox.element.text";
          }
        }
      }
      else
      {
        v133 = off_1001EA9E8;
        v134 = @"button.element.text";
      }
      CGFloat v28 = sub_100051D04(v133, v134, @"button", v7);
      uint64_t v24 = v22;
      goto LABEL_17;
    }
  }
LABEL_18:
  uint64_t v31 = kAXRadioButtonTrait;
  if ((kAXRadioButtonTrait & v9) != 0)
  {
    CGRect v32 = sub_100051D04(off_1001EA9E8, @"radio.button.text", @"button", v7);
    [v8 addObject:v32];

    CGRect v33 = +[NSNumber numberWithUnsignedLongLong:v31];
    [v6 addObject:v33];
  }
  CGRect v34 = v139;
  if ((v22 & v9) == 0)
  {
    uint64_t v35 = kAXTabButtonTrait;
    if ((kAXTabButtonTrait & v9) == kAXTabButtonTrait)
    {
      CGRect v36 = sub_100051D04(off_1001EA9E8, @"tab.button.element.text", @"tab", v7);
      [v8 addObject:v36];

      CGRect v37 = +[NSNumber numberWithUnsignedLongLong:v35];
      [v6 addObject:v37];
    }
  }
  uint64_t v38 = kAXPopupButtonTrait;
  if ((kAXPopupButtonTrait & v9) != 0)
  {
    CGRect v39 = sub_100051D04(off_1001EA9E8, @"popup.button.element.text", @"popup", v7);
    [v8 addObject:v39];

    CGRect v40 = +[NSNumber numberWithUnsignedLongLong:v38];
    [v6 addObject:v40];
  }
  if ((v23 & v9) != 0)
  {
    if ([(VOTElement *)v139 supportsPressedState])
    {
      CGRect v41 = off_1001EA9E8;
      if ([(VOTElement *)v139 isPressed]) {
        double v42 = @"pressed.button";
      }
      else {
        double v42 = @"not.pressed.button";
      }
      if ([(VOTElement *)v139 isPressed]) {
        double v43 = @"pressed";
      }
      else {
        double v43 = @"not pressed";
      }
      double v44 = sub_100051D04(v41, v42, v43, v7);
      [v8 addObject:v44];

      CGRect v45 = +[NSNumber numberWithUnsignedLongLong:v23];
      [v6 addObject:v45];
    }
    else
    {
      CGRect v45 = [(VOTElement *)v139 toggleStatusLabel];
      if (v45)
      {
        [v8 addObject:v45];
        double v46 = +[NSNumber numberWithUnsignedLongLong:v23];
        [v6 addObject:v46];
      }
    }
  }
  uint64_t v47 = kAXHeaderTrait;
  if ((kAXHeaderTrait & v9) != 0)
  {
    if ((kAXWebContentTrait & v9) != 0) {
      [(VOTElement *)v139 value];
    }
    else {
    double v48 = [(VOTElement *)v139 headingLevelValue];
    }
    unsigned int v49 = [v48 intValue];

    if (v49)
    {
      double v50 = sub_100051D04(off_1001EA9E8, @"element.header.text", @"heading", v7);
      double v51 = AXFormatInteger();
      unsigned int v52 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v50, v51);
      [v8 addObject:v52];
    }
    else
    {
      double v50 = sub_100051D04(off_1001EA9E8, @"element.header.text.nolevel", @"heading", v7);
      [v8 addObject:v50];
    }

    double v53 = +[NSNumber numberWithUnsignedLongLong:v47];
    [v6 addObject:v53];
  }
  uint64_t v54 = kAXFooterTrait;
  if ((kAXFooterTrait & v9) != 0)
  {
    unsigned int v55 = sub_100051D04(off_1001EA9E8, @"element.footer.text", @"footer", v7);
    [v8 addObject:v55];

    v56 = +[NSNumber numberWithUnsignedLongLong:v54];
    [v6 addObject:v56];
  }
  uint64_t v57 = kAXVisitedTrait;
  if ((kAXVisitedTrait & v9) != 0)
  {
    float v58 = sub_100051D04(off_1001EA9E8, @"element.visited.text", @"visited", v7);
    [v8 addObject:v58];

    float v59 = +[NSNumber numberWithUnsignedLongLong:v57];
    [v6 addObject:v59];
  }
  uint64_t v60 = kAXLinkTrait;
  if ((kAXLinkTrait & v9) != 0)
  {
    CGPoint v61 = [(VOTElement *)v139 linkedElement];

    if (v61) {
      v62 = @"element.link.internal.text";
    }
    else {
      v62 = @"element.link.text";
    }
    uint64_t v63 = sub_100051D04(off_1001EA9E8, v62, @"link", v7);
    [v8 addObject:v63];

    uint64_t v64 = +[NSNumber numberWithUnsignedLongLong:v60];
    [v6 addObject:v64];
  }
  uint64_t v65 = kAXPickerElementTrait;
  if ((kAXPickerElementTrait & v9) != 0)
  {
    CGFloat v66 = sub_100051D04(off_1001EA9E8, @"picker.element.text", @"picker", v7);
    [v8 addObject:v66];

    v67 = +[NSNumber numberWithUnsignedLongLong:v65];
    [v6 addObject:v67];
  }
  uint64_t v68 = kAXAdjustableTrait;
  if ((kAXAdjustableTrait & v9) != 0)
  {
    v69 = sub_100051D04(off_1001EA9E8, @"incrementable.element.text", @"adjustable", v7);
    [v8 addObject:v69];

    v70 = +[NSNumber numberWithUnsignedLongLong:v68];
    [v6 addObject:v70];
  }
  uint64_t v71 = kAXImageTrait;
  if ((kAXImageTrait & v9) != 0
    && ![(VOTElement *)v139 shouldSkipImageTraitDescription])
  {
    v72 = sub_100051D04(off_1001EA9E8, @"image.element.text", @"image", v7);
    [v8 addObject:v72];

    v73 = +[NSNumber numberWithUnsignedLongLong:v71];
    [v6 addObject:v73];
  }
  uint64_t v74 = kAXMathEquationTrait;
  if ((kAXMathEquationTrait & v9) != 0
    && [(VOTElement *)v139 shouldSpeakMathEquationTrait])
  {
    v75 = sub_100051D04(off_1001EA9E8, @"mathequation.element.text", @"math", v7);
    [v8 addObject:v75];

    v76 = +[NSNumber numberWithUnsignedLongLong:v74];
    [v6 addObject:v76];
  }
  uint64_t v77 = kAXSearchFieldTrait;
  if ((kAXSearchFieldTrait & v9) != 0)
  {
    CGPoint v78 = sub_100051D04(off_1001EA9E8, @"element.status.search.field", @"search", v7);
    [v8 addObject:v78];

    CGPoint v79 = +[NSNumber numberWithUnsignedLongLong:v77];
    [v6 addObject:v79];
  }
  uint64_t v80 = kAXTextEntryTrait;
  if ((kAXTextEntryTrait & v9) != 0 && ((kAXStaticTextTrait | v77) & v9) == 0)
  {
    if (((kAXTextAreaTrait | kAXWebContentTrait) & ~v9) != 0)
    {
      CGPoint v84 = off_1001EA9E8;
      if ((kAXSecureTextFieldTrait & v9) != 0)
      {
        if ([(VOTElement *)v139 isStrongPasswordField]) {
          NSRange v82 = @"element.strongpasswordfield.text";
        }
        else {
          NSRange v82 = @"element.securetextfield.text";
        }
        NSRange v83 = @"secure";
      }
      else
      {
        NSRange v82 = @"element.textentry.text";
        NSRange v83 = @"text field";
      }
      v81 = v84;
    }
    else
    {
      v81 = off_1001EA9E8;
      NSRange v82 = @"element.multiline.text";
      NSRange v83 = @"multi-line text field";
    }
    CGPoint v85 = sub_100051D04(v81, v82, v83, v7);
    [v8 addObject:v85];

    v86 = +[NSNumber numberWithUnsignedLongLong:v80];
    [v6 addObject:v86];
  }
  uint64_t v87 = kAXIsEditingTrait;
  if ((kAXIsEditingTrait & v9) != 0
    && ![(VOTElement *)v139 isReadingContent]
    && (kAXStaticTextTrait & v9) == 0
    && ![(VOTElement *)v139 shouldIgnoreTextEditingTrait])
  {
    v88 = sub_100051D04(off_1001EA9E8, @"element.is.editing.text", @"is editing", v7);
    [v8 addObject:v88];

    v89 = +[NSNumber numberWithUnsignedLongLong:v87];
    [v6 addObject:v89];
  }
  uint64_t v90 = kAXReadOnlyTrait;
  if ((kAXReadOnlyTrait & v9) != 0 && (kAXStaticTextTrait & v9) == 0)
  {
    v91 = sub_100051D04(off_1001EA9E8, @"element.is.read.only", @"is read only", v7);
    [v8 addObject:v91];

    v92 = +[NSNumber numberWithUnsignedLongLong:v90];
    [v6 addObject:v92];
  }
  uint64_t v93 = kAXStatusBarElementTrait;
  if ((kAXStatusBarElementTrait & v9) != 0)
  {
    v94 = sub_100051D04(off_1001EA9E8, @"element.status.bar.item", @"status bar item", v7);
    [v8 addObject:v94];

    v95 = +[NSNumber numberWithUnsignedLongLong:v93];
    [v6 addObject:v95];
  }
  uint64_t v96 = kAXDraggableTrait;
  if ((kAXDraggableTrait & v9) != 0)
  {
    v97 = sub_100051D04(off_1001EA9E8, @"element.draggable.item", @"draggable", v7);
    [v8 addObject:v97];

    v98 = +[NSNumber numberWithUnsignedLongLong:v96];
    [v6 addObject:v98];
  }
  uint64_t v99 = kAXFolderIconTrait;
  if ((kAXFolderIconTrait & v9) != 0)
  {
    v100 = sub_100051D04(off_1001EA9E8, @"element.folder.text", @"folder", v7);
    [v8 addObject:v100];

    v101 = +[NSNumber numberWithUnsignedLongLong:v99];
    [v6 addObject:v101];
  }
  uint64_t v102 = kAXWebInteractiveVideoTrait;
  if ((kAXWebInteractiveVideoTrait & v9) != 0)
  {
    v103 = sub_100051D04(off_1001EA9E8, @"web.interactive.video.control.text", @"video playback", v7);
    [v8 addObject:v103];

    v104 = +[NSNumber numberWithUnsignedLongLong:v102];
    [v6 addObject:v104];
  }
  uint64_t v105 = kAXProminentIconTrait;
  if ((kAXProminentIconTrait & v9) != 0)
  {
    v106 = sub_100051D04(off_1001EA9E8, @"element.prominent.icon", @"icon", v7);
    [v8 addObject:v106];

    v107 = +[NSNumber numberWithUnsignedLongLong:v105];
    [v6 addObject:v107];
  }
  v108 = [(VOTElement *)v139 containerTypes];
  if ([v108 containsObject:&off_1001C5608])
  {
    v109 = [(id)VOTSharedWorkspace elementManager];
    unsigned int v110 = [v109 speakTableHeadersForElement:v139];

    if (v110)
    {
      if ([(VOTElement *)v139 isElementFirstElement:1 orLastElement:0 withType:2])
      {
        v111 = sub_100051D04(off_1001EA9E8, @"element.startOfTable.item", @"table", v7);
        [v8 addObject:v111];

        [v6 addObject:&off_1001C5620];
        [(VOTElement *)v139 setIsFirstItemInTable:1];
      }
      else if ([(VOTElement *)v139 isElementFirstElement:0 orLastElement:1 withType:2])
      {
        v112 = sub_100051D04(off_1001EA9E8, @"element.endOfTable.item", @"table", v7);
        [v8 addObject:v112];

        [v6 addObject:&off_1001C5620];
      }
    }
  }
  if (([v108 containsObject:&off_1001C5638] & 1) != 0
    || [v108 containsObject:&off_1001C5650])
  {
    if ([(VOTElement *)v139 isElementFirstElement:1 orLastElement:0 withType:4]|| [(VOTElement *)v139 isElementFirstElement:1 orLastElement:0 withType:0x2000])
    {
      v113 = sub_100051D04(off_1001EA9E8, @"element.startOfList.item", @"list start", v7);
      [v8 addObject:v113];

      [(VOTElement *)v139 setIsFirstItemInList:1];
LABEL_109:
      [v6 addObject:&off_1001C5620];
      goto LABEL_110;
    }
    if ([(VOTElement *)v139 isElementFirstElement:0 orLastElement:1 withType:4]|| [(VOTElement *)v139 isElementFirstElement:0 orLastElement:1 withType:0x2000])
    {
      v124 = sub_100051D04(off_1001EA9E8, @"element.endOfList.item", @"list end", v7);
      [v8 addObject:v124];

      goto LABEL_109;
    }
  }
LABEL_110:
  if (![v108 containsObject:&off_1001C5668]) {
    goto LABEL_126;
  }
  v114 = [(VOTElement *)v139 touchContainer];
  if ([(VOTElement *)v139 isElementFirstElement:1 orLastElement:0 withType:1])
  {
    v115 = [v114 label];
    v136 = sub_100051D04(off_1001EA9E8, @"element.startOfLandmark.item", @"landmark", v7);
    v116 = __AXStringForVariables();

    objc_msgSend(v8, "addObject:", v116, v136, @"__AXStringForVariablesSentinel");
    [(VOTElement *)v139 setIsFirstItemInLandmark:1];
LABEL_124:
    [v6 addObject:&off_1001C5620];

    goto LABEL_125;
  }
  if ([(VOTElement *)v139 isElementFirstElement:0 orLastElement:1 withType:1])
  {
    v117 = sub_100051D04(off_1001EA9E8, @"element.endOfLandmark.short.item", @"end", v7);
    v137 = [v114 label];
    CFStringRef v138 = @"__AXStringForVariablesSentinel";
    v116 = __AXStringForVariables();

    if (v114)
    {
      while (objc_msgSend(v114, "isElementFirstElement:orLastElement:withType:", 0, 1, 1, v137, v138))
      {
        v118 = [v114 touchContainer];
        if ([v114 isEqual:v118])
        {

          break;
        }
        v119 = sub_100051D04(off_1001EA9E8, @"element.endOfLandmark.short.item", @"end", v7);
        v120 = [v118 label];
        __AXStringForVariables();
        v121 = (__CFString *)objc_claimAutoreleasedReturnValue();

        CGRect v34 = v139;
        v137 = v116;
        CFStringRef v138 = v121;
        uint64_t v122 = +[NSString stringWithFormat:@"%@, %@"];

        id v123 = v118;
        v116 = (void *)v122;
        v114 = v123;
        if (!v123)
        {
          v116 = (void *)v122;
          break;
        }
      }
    }
    objc_msgSend(v8, "addObject:", v116, v137);
    goto LABEL_124;
  }
LABEL_125:

LABEL_126:
  if (![v108 containsObject:&off_1001C5680]) {
    goto LABEL_132;
  }
  if ([(VOTElement *)v34 isElementFirstElement:1 orLastElement:0 withType:8])
  {
    v125 = sub_100051D04(off_1001EA9E8, @"element.startOfFieldset.item", @"form start", v7);
    [v8 addObject:v125];

    [(VOTElement *)v34 setIsFirstItemInFieldset:1];
  }
  else
  {
    if (![(VOTElement *)v34 isElementFirstElement:0 orLastElement:1 withType:8])goto LABEL_132; {
    v126 = sub_100051D04(off_1001EA9E8, @"element.endOfFieldset.item", @"form end", v7);
    }
    [v8 addObject:v126];
  }
  [v6 addObject:&off_1001C5620];
LABEL_132:
  if (![v108 containsObject:&off_1001C5698]) {
    goto LABEL_138;
  }
  if ([(VOTElement *)v34 isElementFirstElement:1 orLastElement:0 withType:0x8000])
  {
    v127 = sub_100051D04(off_1001EA9E8, @"element.startOfDefinitionList.item", 0, v7);
    [v8 addObject:v127];

    [(VOTElement *)v34 setIsFirstItemInDescriptionList:1];
  }
  else
  {
    if (![(VOTElement *)v34 isElementFirstElement:0 orLastElement:1 withType:0x8000])goto LABEL_138; {
    v128 = sub_100051D04(off_1001EA9E8, @"element.endOfDefinitionList.item", @"form end", v7);
    }
    [v8 addObject:v128];
  }
  [v6 addObject:&off_1001C5620];
LABEL_138:
  if ([v108 containsObject:&off_1001C56B0])
  {
    if ([(VOTElement *)v34 isElementFirstElement:1 orLastElement:0 withType:32])
    {
      v129 = sub_100051D04(off_1001EA9E8, @"element.startOfTree.item", @"tree start", v7);
      [v8 addObject:v129];

      [(VOTElement *)v34 setIsFirstItemInTree:1];
LABEL_143:
      [v6 addObject:&off_1001C5620];
      goto LABEL_144;
    }
    if ([(VOTElement *)v34 isElementFirstElement:0 orLastElement:1 withType:32])
    {
      v130 = sub_100051D04(off_1001EA9E8, @"element.endOfTree.item", @"tree end", v7);
      [v8 addObject:v130];

      goto LABEL_143;
    }
  }
LABEL_144:
  id v131 = v8;

  return v131;
}

- (id)arrayOfTraitsAsStrings
{
  return [(VOTElement *)self arrayOfTraitsAsStringsWithTraitOrder:0];
}

- (id)arrayOfTraitsAsStringsWithTraitOrder:(id)a3
{
  id v4 = (void *)VOTSharedWorkspace;
  id v5 = a3;
  id v6 = [v4 selectedLanguage];
  id v7 = [(VOTElement *)self arrayOfTraitsAsStringsWithTraitOrder:v5 language:v6];

  return v7;
}

- (void)_applyAttributesFromText:(id)a3 toRequest:(id)a4 withLanguage:(id)a5
{
  id v5 = [a4 addAttributedString:a3 withLanguage:a5 category:@"TextAttributes"];
}

- (id)_removeBadDeveloperDecisions:(id)a3
{
  id v4 = a3;
  if ([(VOTElement *)self doesHaveTraits:kAXBackButtonTrait])
  {
    id v5 = sub_100051804(off_1001EA9E8, @"back.button.element.text", @"back button");
    id v6 = [v5 lowercaseString];

    if ([v4 length])
    {
      id v7 = [v4 lowercaseString];
      unsigned int v8 = [v6 containsString:v7];

      if (v8)
      {

        id v4 = 0;
      }
    }
  }
  if ([(VOTElement *)self doesHaveTraits:kAXImageTrait]
    && [v4 hasSuffix:@"image"])
  {
    unint64_t v9 = [v4 substringToIndex:(unsigned char *)objc_msgSend(v4, "length") - (unsigned char *)objc_msgSend(@"image", "length")];

    uint64_t v10 = +[NSCharacterSet whitespaceCharacterSet];
    id v4 = [v9 stringByTrimmingCharactersInSet:v10];
  }
  if ([(VOTElement *)self doesHaveTraits:kAXButtonTrait]
    && [v4 hasSuffix:@"button"])
  {
    id v11 = [v4 substringToIndex:(unsigned char *)objc_msgSend(v4, "length") - (unsigned char *)objc_msgSend(@"button", "length")];

    unint64_t v12 = +[NSCharacterSet whitespaceCharacterSet];
    id v4 = [v11 stringByTrimmingCharactersInSet:v12];
  }

  return v4;
}

- (BOOL)isWesternTextForNonWesternLanguage:(id)a3 language:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = sub_100038290(v6);
  int v8 = sub_1000382E8();

  if (v7)
  {
    sub_10003838C();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    id v9 = [v5 rangeOfCharacterFromSet:v6];
    BOOL v10 = v9 != (id)0x7FFFFFFFFFFFFFFFLL;
    if (v9 != (id)0x7FFFFFFFFFFFFFFFLL || ((v8 ^ 1) & 1) != 0) {
      goto LABEL_7;
    }
  }
  else if (!v8)
  {
    BOOL v10 = 0;
    goto LABEL_9;
  }
  id v11 = sub_1000382F0();
  BOOL v10 = [v5 rangeOfCharacterFromSet:v11] != (id)0x7FFFFFFFFFFFFFFFLL;

  if (v7) {
LABEL_7:
  }

LABEL_9:
  return v10;
}

- (void)_applyLabelToRequest:(id)a3 includeBlockQuote:(BOOL)a4 language:(id)a5 isWebLanguageChoice:(BOOL)a6 interactOption:(int64_t)a7
{
  BOOL v8 = a6;
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a5;
  uint64_t v14 = [(VOTElement *)self label];
  if (!v13 || !v8) {
    goto LABEL_12;
  }
  uint64_t v15 = +[AXLanguageManager sharedInstance];
  uint64_t v16 = [v15 dialectForLanguageID:v13];

  uint64_t v17 = [v16 speakableCharacters];
  if (v17 && ![v16 canSpeakString:v14])
  {

    goto LABEL_8;
  }
  unsigned __int8 v18 = [(VOTElement *)self isWesternTextForNonWesternLanguage:v14 language:v13];

  if (v18)
  {
LABEL_8:
    uint64_t v19 = VOTLogCommon();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v44 = v13;
      __int16 v45 = 2112;
      double v46 = v14;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Web told us to use: %@, but that dialect can't speak: %@", buf, 0x16u);
    }

    id v13 = 0;
  }

LABEL_12:
  double v20 = +[AXSettings sharedInstance];
  id v21 = [v20 voiceOverPhoneticsFeedback];

  if ([v14 length] != (id)1
    || ([(VOTElement *)self doesHaveTraits:kAXKeyboardKeyTrait] ? (BOOL v22 = v21 == 0) : (BOOL v22 = 1), v22))
  {
    uint64_t v23 = 0;
    id v24 = 0;
  }
  else
  {
    if (![v14 isAXAttributedString]
      || ([v14 attributeValueForKey:UIAccessibilityTokenLanguage],
          (id v24 = (id)objc_claimAutoreleasedReturnValue()) == 0))
    {
      id v24 = v13;
    }
    uint64_t v23 = sub_100052754(v14, v24, 0);
  }
  id v25 = [v23 length];
  if (v25) {
    BOOL v26 = v21 == 0;
  }
  else {
    BOOL v26 = 1;
  }
  char v27 = !v26;
  if (v25 && v21 == (id)2)
  {
    if ((v27 & 1) == 0) {
      goto LABEL_51;
    }
    goto LABEL_50;
  }
  if ([v14 isAXAttributedString] && objc_msgSend(v14, "hasAttributes"))
  {
    [(VOTElement *)self _applyAttributesFromText:v14 toRequest:v12 withLanguage:v13];
    if (!v10) {
      goto LABEL_48;
    }
    uint64_t v29 = [v14 attributeValueForKey:UIAccessibilityTokenBlockquoteLevel];
    if (v29) {
      CGFloat v30 = (_UNKNOWN **)v29;
    }
    else {
      CGFloat v30 = &off_1001C56C8;
    }
    uint64_t v31 = sub_100051804(off_1001EA9E8, @"blockquote.level", 0);
    CGRect v32 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v31, v30);
    id v33 = [v12 addString:v32];

    goto LABEL_47;
  }
  CGRect v34 = +[NSCharacterSet whitespaceCharacterSet];
  uint64_t v35 = [v14 stringByTrimmingCharactersInSet:v34];

  uint64_t v14 = [(VOTElement *)self _removeBadDeveloperDecisions:v35];

  if (![v14 length]) {
    goto LABEL_48;
  }
  if (a7 == 2)
  {
    CGRect v36 = off_1001EA9E8;
    CGRect v37 = @"InteractOut";
    goto LABEL_45;
  }
  if (a7 == 1)
  {
    CGRect v36 = off_1001EA9E8;
    CGRect v37 = @"InteractIn";
LABEL_45:
    uint64_t v38 = sub_100051804(v36, v37, 0);
    uint64_t v39 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v38, v14);

    uint64_t v14 = (void *)v39;
  }
  id v40 = [v12 addString:v14 breakWords:1 withLanguage:v13 atIndex:0x7FFFFFFFFFFFFFFFLL];
  CGRect v41 = [v12 lastAction];
  [v41 setPerformPunctuationTranslation:1];

  CGFloat v30 = [v12 lastAction];
  [v30 setReplaceCommas:0];
LABEL_47:

LABEL_48:
  if (v27)
  {
    LODWORD(v28) = 0.75;
    [v12 addPause:v28];
LABEL_50:
    id v42 = [v12 addString:v23];
  }
LABEL_51:
}

- (void)_addHeaderElement:(id)a3 toRequest:(id)a4
{
  id v21 = a4;
  id v6 = a3;
  int v7 = [v6 label];
  BOOL v8 = +[NSCharacterSet whitespaceCharacterSet];
  id v9 = [v7 stringByTrimmingCharactersInSet:v8];

  BOOL v10 = [v6 value];

  id v11 = +[NSCharacterSet whitespaceCharacterSet];
  id v12 = [v10 stringByTrimmingCharactersInSet:v11];

  id v13 = __AXStringForVariables();
  if (objc_msgSend(v13, "length", v12, @"__AXStringForVariablesSentinel"))
  {
    uint64_t v14 = [(VOTElement *)self language];
    id v15 = [v21 addString:v13 withLanguage:v14];

    uint64_t v16 = [v21 lastAction];
    [v16 setPerformPunctuationTranslation:1];

    uint64_t v17 = [v21 lastAction];
    [v17 setReplaceCommas:0];
  }
  if ([(id)VOTSharedWorkspace typingPitchChangeEnabled])
  {
    unsigned __int8 v18 = [v21 lastAction];
    LODWORD(v19) = 1062836634;
    double v20 = +[NSNumber numberWithFloat:v19];
    [v18 setObject:v20 forVariant:32];
  }
}

- (void)applyRowHeadersToRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(VOTElement *)self headerElementsForRow:[(VOTElement *)self rowRange]];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [(VOTElement *)self _addHeaderElement:*(void *)(*((void *)&v10 + 1) + 8 * (void)v9) toRequest:v4];
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)applyHeaderElementsToRequest:(id)a3
{
  id v4 = a3;
  if ([(VOTElement *)self supportsHeaderElementOutput])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v5 = objc_msgSend(v4, "elementHeadersForOutput", 0);
    id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          long long v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          if (([v10 isEqual:self] & 1) == 0) {
            [(VOTElement *)self _addHeaderElement:v10 toRequest:v4];
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
}

- (void)_applyValueToRequest:(id)a3 options:(unint64_t)a4 lastSeenLineAndColumn:(id)a5 language:(id)a6
{
  int v9 = ~a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  unsigned int v13 = [(VOTElement *)self doesHaveTraits:kAXIsEditingTrait];
  unsigned int v14 = [(VOTElement *)self doesHaveTraits:kAXTextAreaTrait];
  BOOL v15 = [(VOTElement *)self doesHaveTraits:kAXTextEntryTrait];
  if ((*(void *)&v9 & 0x80040) == 0)
  {
    unsigned int v16 = v11 ? v14 : 0;
    if ((v13 | v16) == 1)
    {
      if (v13)
      {
        id v17 = [(VOTElement *)self selectedTextRange];
      }
      else
      {
        if (!v16)
        {
          uint64_t v26 = 0;
          uint64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
          goto LABEL_33;
        }
        id v17 = [(VOTElement *)self rangeForLineNumberAndColumn:v11];
      }
      uint64_t v25 = (uint64_t)v17;
      uint64_t v26 = v18;
LABEL_33:
      uint64_t v38 = [(VOTElement *)self value];
      if (v25 + v26 >= (unint64_t)[v38 length]) {
        uint64_t v39 = 0;
      }
      else {
        uint64_t v39 = v25;
      }
      id v40 = [v38 substringFromIndex:v39];

      id v41 = [v10 addString:v40 withLanguage:v12];
      id v42 = [v10 lastAction];
      [v42 setPerformPunctuationTranslation:1];

      double v43 = [v10 lastAction];
      [v43 setReplaceCommas:1];

      id v44 = [v10 lastAction];
      [v44 setObject:kCFBooleanTrue forVariant:50];

      goto LABEL_68;
    }
  }
  uint64_t v19 = kAXWebContentTrait;
  if ([(VOTElement *)self doesHaveAllTraits:kAXWebContentTrait | kAXHeaderTrait])
  {
    double v20 = [(VOTElement *)self label];
    if (v20)
    {

      goto LABEL_68;
    }
    id v21 = [(VOTElement *)self value];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      goto LABEL_68;
    }
  }
  if ([(VOTElement *)self doesHaveTraits:kAXToggleTrait]) {
    goto LABEL_68;
  }
  uint64_t v23 = [(VOTElement *)self value];
  if ([(VOTElement *)self isReadingContent])
  {
    [(VOTElement *)self updatePageContent];
    uint64_t v24 = [(VOTElement *)self pageContent];
LABEL_22:
    double v28 = (void *)v24;

    uint64_t v23 = v28;
    goto LABEL_23;
  }
  if ((unint64_t)[v23 length] >= 0xC351)
  {
    char v27 = VOTLogElement();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
      sub_1001215EC(v27);
    }

    uint64_t v24 = objc_msgSend(v23, "substringWithRange:", 0, 50000);
    goto LABEL_22;
  }
LABEL_23:
  [(VOTElement *)self minValue];
  double v30 = v29;
  [(VOTElement *)self maxValue];
  double v32 = v31;
  if (![(VOTElement *)self doesHaveTraits:v19] || v30 <= 0.0 && v32 <= 0.0) {
    goto LABEL_41;
  }
  id v33 = +[NSScanner localizedScannerWithString:v23];
  float v88 = 0.0;
  if ([v33 scanFloat:&v88] && objc_msgSend(v33, "isAtEnd"))
  {
    double v34 = (v88 - v30) / (v32 - v30);
    uint64_t v35 = AXFormatFloatWithPercentage();
    CGRect v36 = v35;
    if (fabs(-(v88 - v34 * 100.0)) >= 0.001)
    {
      v75 = v35;
      CFStringRef v76 = @"__AXStringForVariablesSentinel";
      __AXStringForVariables();
      id v37 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v30 != 0.0 || v32 != 100.0) {
        goto LABEL_39;
      }
      id v37 = v35;
    }
    id v45 = v37;

    uint64_t v23 = v45;
LABEL_39:
  }
LABEL_41:
  unsigned __int8 v46 = -[VOTElement applySelectedText:language:](self, "applySelectedText:language:", v10, v12, v75, v76);
  if ([v23 length] && (v46 & 1) == 0)
  {
    if ([v23 isAXAttributedString])
    {
      id v47 = v23;
      if ([(VOTElement *)self doesHaveTraits:kAXLinkTrait])
      {
        uint64_t v90 = UIAccessibilityTokenLink;
        double v48 = +[NSArray arrayWithObjects:&v90 count:1];
        [v47 removeAttributes:v48];
      }
      uint64_t v49 = UIAccessibilityTokenSpeakValuePartOnDifference;
      if ([v47 hasAttribute:UIAccessibilityTokenSpeakValuePartOnDifference])
      {
        CGPoint v78 = v23;
        id v79 = v11;
        id v80 = v10;
        double v50 = +[NSMutableSet set];
        id v51 = [v47 length];
        v85[0] = _NSConcreteStackBlock;
        v85[1] = 3221225472;
        v85[2] = sub_1000B6FB0;
        v85[3] = &unk_1001B32E0;
        id v52 = v50;
        id v86 = v52;
        id v77 = v47;
        id v53 = v47;
        id v87 = v53;
        objc_msgSend(v53, "enumerateAttribute:inRange:options:usingBlock:", v49, 0, v51, 0, v85);
        long long v83 = 0u;
        long long v84 = 0u;
        long long v81 = 0u;
        long long v82 = 0u;
        id v54 = v52;
        id v55 = [v54 countByEnumeratingWithState:&v81 objects:v89 count:16];
        if (v55)
        {
          id v56 = v55;
          uint64_t v57 = *(void *)v82;
          do
          {
            for (i = 0; i != v56; i = (char *)i + 1)
            {
              if (*(void *)v82 != v57) {
                objc_enumerationMutation(v54);
              }
              uint64_t v59 = *(void *)(*((void *)&v81 + 1) + 8 * i);
              uint64_t v60 = [(VOTElement *)self previousSpokenValueParts];
              unsigned int v61 = [v60 containsObject:v59];

              if (v61)
              {
                v62 = [v53 string];
                id v63 = [v62 rangeOfString:v59];
                uint64_t v65 = v64;

                if (v63 != (id)0x7FFFFFFFFFFFFFFFLL) {
                  objc_msgSend(v53, "deleteCharactersInRange:", v63, v65);
                }
              }
            }
            id v56 = [v54 countByEnumeratingWithState:&v81 objects:v89 count:16];
          }
          while (v56);
        }

        [(VOTElement *)self setPreviousSpokenValueParts:v54];
        id v11 = v79;
        id v10 = v80;
        uint64_t v23 = v78;
        id v47 = v77;
      }
      [(VOTElement *)self _applyAttributesFromText:v47 toRequest:v10 withLanguage:v12];
    }
    else
    {
      id v66 = [v10 addString:v23 withLanguage:v12];
      v67 = [v10 lastAction];
      [v67 setPerformPunctuationTranslation:1];

      id v47 = [v10 lastAction];
      [v47 setReplaceCommas:v15];
    }
  }
  if (-[VOTElement doesHaveTraits:](self, "doesHaveTraits:", kAXImageTrait) && ![v23 length])
  {
    LOWORD(v88) = 160;
    uint64_t v68 = +[NSString stringWithCharacters:&v88 length:1];
    id v69 = [v10 addString:v68];

    v70 = [v10 lastAction];
    uint64_t v71 = [(VOTElement *)self uiElement];
    objc_msgSend(v70, "setObject:forVariant:", objc_msgSend(v71, "axElement"), 67);
  }
  if ([(VOTElement *)self readingContentCausesPageTurn])
  {
    v72 = [v10 lastAction];
    CFBooleanRef v73 = kCFBooleanTrue;
    [v72 setObject:kCFBooleanTrue forVariant:59];
  }
  else
  {
    CFBooleanRef v73 = kCFBooleanTrue;
  }
  uint64_t v74 = [v10 lastAction];
  [v74 setObject:v73 forVariant:37];

LABEL_68:
}

- (BOOL)applySelectedText:(id)a3 language:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(VOTElement *)self doesHaveAllTraits:kAXTextEntryTrait | kAXIsEditingTrait]
    && (id v8 = [(VOTElement *)self selectedTextRange], v9))
  {
    id v10 = -[VOTElement valueForRange:](self, "valueForRange:", v8, v9);
    id v11 = [v10 length];
    BOOL v12 = v11 != 0;
    if (v11)
    {
      unsigned int v13 = sub_100051D04(off_1001EA9E8, @"element.selected.text", 0, v7);
      unsigned int v14 = +[NSString stringWithFormat:@"%@ %@", v10, v13];
      id v15 = [v6 addString:v14];
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (void)_applyHasPopupAttribute:(id)a3 withLanguage:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = [(VOTElement *)self popupValue];
  id v8 = v7;
  if (v7)
  {
    if ([v7 isEqualToString:@"menu"])
    {
      uint64_t v9 = @"element.has.popup.menu";
    }
    else if ([v8 isEqualToString:@"listbox"])
    {
      uint64_t v9 = @"element.has.popup.listbox";
    }
    else if ([v8 isEqualToString:@"tree"])
    {
      uint64_t v9 = @"element.has.popup.tree";
    }
    else if ([v8 isEqualToString:@"grid"])
    {
      uint64_t v9 = @"element.has.popup.grid";
    }
    else
    {
      if (![v8 isEqualToString:@"dialog"]) {
        goto LABEL_13;
      }
      uint64_t v9 = @"element.has.popup.dialog";
    }
    id v10 = sub_100051D04(off_1001EA9E8, v9, 0, v6);
    id v11 = [v13 addString:v10 withLanguage:v6];

    BOOL v12 = [v13 lastAction];
    [v12 setIsVoiceOverGeneratedContent:1];
  }
LABEL_13:
}

- (void)_applyTraitsToRequest:(id)a3 options:(unint64_t)a4 numHeaderActions:(unint64_t)a5 language:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  id v11 = [objc_allocWithZone((Class)NSMutableArray) init];
  BOOL v12 = [(VOTElement *)self arrayOfTraitsAsStringsWithTraitOrder:v11 language:v10];
  id v13 = [v12 count];
  if (v13 != [v11 count])
  {
    double v28 = v12;
    id v29 = v11;
    _AXAssert();
  }
  unsigned __int8 v14 = objc_msgSend((id)VOTSharedWorkspace, "typingPitchChangeEnabled", v28, v29);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1000B75F4;
  v30[3] = &unk_1001B6160;
  id v15 = v11;
  id v31 = v15;
  BOOL v36 = (a4 & 4) != 0;
  BOOL v37 = (a4 & 0x80000000) != 0;
  id v16 = v9;
  id v32 = v16;
  id v33 = self;
  id v17 = v10;
  id v34 = v17;
  unint64_t v35 = a4;
  unsigned __int8 v38 = v14;
  [v12 enumerateObjectsUsingBlock:v30];
  uint64_t v18 = kAXWebContentTrait;
  if ([(VOTElement *)self doesHaveTraits:kAXWebContentTrait]
    && [(VOTElement *)self isComboBox])
  {
    uint64_t v19 = sub_100051D04(off_1001EA9E8, @"element.combobox", 0, v17);
    id v20 = [v16 addString:v19 withLanguage:v17];

    id v21 = [v16 lastAction];
    [v21 setIsVoiceOverGeneratedContent:1];
  }
  if ([(VOTElement *)self doesHaveTraits:v18]
    && [(VOTElement *)self isInDescriptionDefinition])
  {
    BOOL v22 = sub_100051D04(off_1001EA9E8, @"element.definition", 0, v17);
    id v23 = [v16 addString:v22 withLanguage:v17];

    uint64_t v24 = [v16 lastAction];
    [v24 setIsVoiceOverGeneratedContent:1];
  }
  if ([(VOTElement *)self doesHaveTraits:v18]
    && [(VOTElement *)self isInDescriptionTerm])
  {
    uint64_t v25 = sub_100051D04(off_1001EA9E8, @"element.definition.term", 0, v17);
    id v26 = [v16 addString:v25 withLanguage:v17];

    char v27 = [v16 lastAction];
    [v27 setIsVoiceOverGeneratedContent:1];
  }
}

- (void)_addErrorMessageElement:(id)a3 toRequest:(id)a4
{
  id v18 = a4;
  id v6 = a3;
  id v7 = [v6 label];
  id v8 = +[NSCharacterSet whitespaceCharacterSet];
  id v9 = [v7 stringByTrimmingCharactersInSet:v8];

  id v10 = [v6 value];

  id v11 = +[NSCharacterSet whitespaceCharacterSet];
  BOOL v12 = [v10 stringByTrimmingCharactersInSet:v11];

  id v13 = __AXStringForVariables();
  if (objc_msgSend(v13, "length", v12, @"__AXStringForVariablesSentinel"))
  {
    unsigned __int8 v14 = [(VOTElement *)self language];
    id v15 = [v18 addString:v13 withLanguage:v14];

    id v16 = [v18 lastAction];
    [v16 setPerformPunctuationTranslation:1];

    id v17 = [v18 lastAction];
    [v17 setReplaceCommas:0];
  }
}

- (void)_applyInvalidStatus:(id)a3 language:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(VOTElement *)self invalidStatus];
  if ([v8 length] && (objc_msgSend(v8, "isEqualToString:", @"false") & 1) == 0)
  {
    if ([v8 isEqualToString:@"grammar"])
    {
      id v9 = off_1001EA9E8;
      id v10 = @"invalidStatusGrammar";
    }
    else
    {
      unsigned int v11 = [v8 isEqualToString:@"spelling"];
      id v9 = off_1001EA9E8;
      if (v11) {
        id v10 = @"invalidStatusSpelling";
      }
      else {
        id v10 = @"invalidStatusGeneral";
      }
    }
    BOOL v12 = sub_100051D04(v9, v10, 0, v7);
    if ([v12 length])
    {
      LODWORD(v13) = 1061997773;
      [v6 addPause:v13];
      id v14 = [v6 addString:v12 withLanguage:v7];
      id v15 = [(VOTElement *)self errorMessageElements];
      if ([v15 count])
      {
        LODWORD(v16) = 1061997773;
        [v6 addPause:v16];
      }
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v17 = v15;
      id v18 = [v17 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v18)
      {
        id v19 = v18;
        uint64_t v20 = *(void *)v24;
        do
        {
          id v21 = 0;
          do
          {
            if (*(void *)v24 != v20) {
              objc_enumerationMutation(v17);
            }
            -[VOTElement _addErrorMessageElement:toRequest:](self, "_addErrorMessageElement:toRequest:", *(void *)(*((void *)&v23 + 1) + 8 * (void)v21), v6, (void)v23);
            id v21 = (char *)v21 + 1;
          }
          while (v19 != v21);
          id v19 = [v17 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v19);
      }

      BOOL v22 = [v6 lastAction];
      [v22 setIsVoiceOverGeneratedContent:0];
    }
  }
}

- (void)applyInvalidStatusToRequest:(id)a3
{
  char v6 = 0;
  id v4 = a3;
  id v5 = [(VOTElement *)self _resolvedOutputLanguage:&v6];
  [(VOTElement *)self _applyInvalidStatus:v4 language:v5];
}

- (void)_applyCurrentStatus:(id)a3 language:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  id v7 = [(VOTElement *)self currentStatus];
  if ([v7 length] && (objc_msgSend(v7, "isEqualToString:", @"false") & 1) == 0)
  {
    if ([v7 isEqualToString:@"page"])
    {
      id v8 = off_1001EA9E8;
      id v9 = @"currentStatusPage";
    }
    else if ([v7 isEqualToString:@"step"])
    {
      id v8 = off_1001EA9E8;
      id v9 = @"currentStatusStep";
    }
    else if ([v7 isEqualToString:@"location"])
    {
      id v8 = off_1001EA9E8;
      id v9 = @"currentStatusLocation";
    }
    else if ([v7 isEqualToString:@"date"])
    {
      id v8 = off_1001EA9E8;
      id v9 = @"currentStatusDate";
    }
    else
    {
      unsigned int v10 = [v7 isEqualToString:@"time"];
      id v8 = off_1001EA9E8;
      if (v10) {
        id v9 = @"currentStatusTime";
      }
      else {
        id v9 = @"currentStatusGeneral";
      }
    }
    unsigned int v11 = sub_100051D04(v8, v9, 0, v6);
    if ([v11 length])
    {
      id v12 = [v14 addString:v11 withLanguage:v6];
      double v13 = [v14 lastAction];
      [v13 setIsVoiceOverGeneratedContent:1];
    }
  }
}

- (void)_applyDatetimeAttribute:(id)a3 language:(id)a4
{
  id v10 = a3;
  id v5 = [(VOTElement *)self formattedDatetime];
  if (v5)
  {
    id v6 = [v10 addString:v5];
    if ([(id)VOTSharedWorkspace typingPitchChangeEnabled])
    {
      id v7 = [v10 lastAction];
      LODWORD(v8) = 1062836634;
      id v9 = +[NSNumber numberWithFloat:v8];
      [v7 setObject:v9 forVariant:32];
    }
  }
}

- (void)_applySortDirection:(id)a3 language:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = [(VOTElement *)self sortDirection];
  if (![v7 length]) {
    goto LABEL_11;
  }
  if ([v7 isEqualToString:@"AXAscendingSortDirection"])
  {
    double v8 = @"sortUp";
  }
  else
  {
    if (![v7 isEqualToString:@"AXDescendingSortDirection"])
    {
      id v9 = 0;
      goto LABEL_8;
    }
    double v8 = @"sortDown";
  }
  id v9 = sub_100051D04(off_1001EA9E8, v8, 0, v6);
LABEL_8:
  if ([v9 length])
  {
    id v10 = [v12 addString:v9 withLanguage:v6];
    unsigned int v11 = [v12 lastAction];
    [v11 setIsVoiceOverGeneratedContent:1];
  }
LABEL_11:
}

- (_NSRange)_brailleLineRangeForDescription:(id)a3 position:(unint64_t)a4
{
  id v5 = a3;
  id v6 = [v5 length];
  if ((unint64_t)v6 >= a4) {
    unint64_t v7 = a4;
  }
  else {
    unint64_t v7 = (unint64_t)v6;
  }
  double v8 = (char *)objc_msgSend(v5, "lineRangeForRange:", v7, 0);
  NSUInteger v10 = v9;
  if (v9)
  {
    unsigned int v11 = +[NSCharacterSet newlineCharacterSet];
    unsigned int v12 = objc_msgSend(v11, "characterIsMember:", objc_msgSend(v5, "characterAtIndex:", &v8[v10 - 1]));

    v10 -= v12;
  }

  NSUInteger v13 = (NSUInteger)v8;
  NSUInteger v14 = v10;
  result.NSUInteger length = v14;
  result.NSUInteger location = v13;
  return result;
}

- (id)_copyMathTextualInformationWithBrailleLineRange:(_NSRange *)a3 brailleDescriptionRange:(_NSRange *)a4 position:(unint64_t)a5 rotorSelection:(id)a6 shouldPreferRotorSelection:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a6;
  NSUInteger v13 = [(VOTElement *)self mathBrailleDescription];
  NSUInteger v14 = [v13 string];
  if ([v14 length])
  {
    id v15 = [v14 length];
    a4->NSUInteger location = 0;
    a4->NSUInteger length = (NSUInteger)v15;
    a3->NSUInteger location = (NSUInteger)[(VOTElement *)self _brailleLineRangeForDescription:v14 position:a5];
    a3->NSUInteger length = v16;
    if (v12)
    {
      id v17 = v12;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        _AXAssert();
      }
      uint64_t v41 = 0;
      id v42 = &v41;
      uint64_t v43 = 0x2020000000;
      uint64_t v44 = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v37 = 0;
      unsigned __int8 v38 = &v37;
      uint64_t v39 = 0x2020000000;
      char v40 = 0;
      id v18 = objc_alloc((Class)NSMutableAttributedString);
      uint64_t v47 = kSCROTechnicalContextAttribute;
      double v48 = &__kCFBooleanTrue;
      id v19 = +[NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];
      id v20 = [v18 initWithString:v14 attributes:v19];

      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_1000B860C;
      v31[3] = &unk_1001B6188;
      id v21 = v17;
      id v32 = v21;
      id v22 = v20;
      id v33 = v22;
      id v34 = &v41;
      unint64_t v35 = &v37;
      BOOL v36 = a3;
      [v13 enumerateAttributesUsingBlock:v31];
      if (v7 && !*((unsigned char *)v38 + 24) && v42[3] != 0x7FFFFFFFFFFFFFFFLL)
      {
        a3->NSUInteger location = (NSUInteger)-[VOTElement _brailleLineRangeForDescription:position:](self, "_brailleLineRangeForDescription:position:", v14);
        a3->NSUInteger length = v23;
      }
      id v24 = objc_alloc((Class)NSMutableAttributedString);
      long long v25 = objc_msgSend(v22, "attributedSubstringFromRange:", a3->location, a3->length);
      id v26 = [v24 initWithAttributedString:v25];

      _Block_object_dispose(&v37, 8);
      _Block_object_dispose(&v41, 8);
    }
    else
    {
      id v27 = objc_alloc((Class)NSMutableAttributedString);
      double v28 = objc_msgSend(v14, "substringWithRange:", a3->location, a3->length);
      uint64_t v45 = kSCROTechnicalContextAttribute;
      unsigned __int8 v46 = &__kCFBooleanTrue;
      id v29 = +[NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
      id v26 = [v27 initWithString:v28 attributes:v29];
    }
  }
  else
  {
    id v26 = [objc_alloc((Class)NSMutableAttributedString) initWithString:@" "];
  }

  return v26;
}

- (void)addTextualInformationToBrailleLine:(id)a3 forPosition:(unint64_t)a4 rotorSelection:(id)a5 shouldPreferRotorSelection:(BOOL)a6 lineRange:(_NSRange *)a7 descriptionRange:(_NSRange *)a8 lineRangeKnown:(BOOL)a9 isNewTouchContainer:(BOOL)a10 previousElement:(id)a11
{
  LOWORD(v12) = 257;
  LOWORD(v11) = __PAIR16__(a10, a9);
  -[VOTElement addTextualInformationToBrailleLine:forPosition:rotorSelection:shouldPreferRotorSelection:lineRange:descriptionRange:lineRangeKnown:isNewTouchContainer:previousElement:updateValue:singleLine:](self, "addTextualInformationToBrailleLine:forPosition:rotorSelection:shouldPreferRotorSelection:lineRange:descriptionRange:lineRangeKnown:isNewTouchContainer:previousElement:updateValue:singleLine:", a3, a4, a5, a6, a7, a8, v11, a11, v12);
}

- (void)addTextualInformationToBrailleLine:(id)a3 forPosition:(unint64_t)a4 rotorSelection:(id)a5 shouldPreferRotorSelection:(BOOL)a6 lineRange:(_NSRange *)a7 descriptionRange:(_NSRange *)a8 lineRangeKnown:(BOOL)a9 isNewTouchContainer:(BOOL)a10 previousElement:(id)a11 updateValue:(BOOL)a12 singleLine:(BOOL)a13
{
  BOOL v13 = a6;
  id v167 = a3;
  id v17 = a5;
  id v165 = a11;
  _NSRange v202 = (_NSRange)xmmword_10016E510;
  long long v203 = xmmword_10016E510;
  v163 = v17;
  if ([(VOTElement *)self doesHaveTraits:kAXMathEquationTrait])
  {
    id v18 = [(VOTElement *)self _copyMathTextualInformationWithBrailleLineRange:&v203 brailleDescriptionRange:&v202 position:a4 rotorSelection:v17 shouldPreferRotorSelection:v13];
    long long v19 = v203;
    if (*((void *)&v19 + 1) + (void)v19 <= (unint64_t)[v18 length]) {
      [v18 addAttribute:kSCROEditableTextAttribute value:&__kCFBooleanFalse range:v203];
    }
    goto LABEL_171;
  }
  NSUInteger v162 = a4;
  v168 = self;
  if ([(VOTElement *)self doesHaveAllTraits:kAXTextEntryTrait | kAXIsEditingTrait]
    && ![(VOTElement *)self shouldIgnoreTextEditingTrait])
  {
    id v36 = [(VOTElement *)self selectedTextRange];
    id obj = v37;
    NSUInteger range1 = (NSUInteger)v36;
    unsigned __int8 v38 = [(VOTElement *)self valueWithUpdate:a12];
    if ([(__CFString *)v38 isAXAttributedString])
    {
      uint64_t v39 = v38;
      if ([(__CFString *)v39 hasAttribute:UIAccessibilityTokenPlaceholder])
      {
        char v40 = &stru_1001B7888;
      }
      else
      {
        char v40 = [(__CFString *)v39 string];
      }
      unint64_t v42 = a4;
    }
    else
    {
      if (v38) {
        char v40 = v38;
      }
      else {
        char v40 = &stru_1001B7888;
      }
      unint64_t v42 = a4;
    }
    id v48 = [(__CFString *)v40 length];
    v202.NSUInteger location = 0;
    v202.NSUInteger length = (NSUInteger)v48;
    if (a13)
    {
      if ((unint64_t)v48 >= v42) {
        id v49 = (id)v42;
      }
      else {
        id v49 = v48;
      }
      id v50 = -[__CFString lineRangeForRange:](v40, "lineRangeForRange:", v49, 0);
      NSUInteger length = v51;
      *(void *)&long long v203 = v50;
      *((void *)&v203 + 1) = v51;
      if (v51)
      {
LABEL_49:
        id v53 = +[NSCharacterSet newlineCharacterSet];
        NSUInteger v54 = v203;
        unsigned int v55 = objc_msgSend(v53, "characterIsMember:", -[__CFString characterAtIndex:](v40, "characterAtIndex:", (void)v203 + length - 1));

        if (v55) {
          *((void *)&v203 + 1) = --length;
        }
LABEL_53:
        range1_8a = -[__CFString substringWithRange:](v40, "substringWithRange:", v54, length);
        BOOL v56 = 0;
        if (range1 != 0x7FFFFFFFFFFFFFFFLL && (unint64_t)obj + range1 >= v54) {
          BOOL v56 = (unint64_t)obj + range1 <= length + v54;
        }
        id v57 = [objc_allocWithZone((Class)NSMutableAttributedString) initWithString:range1_8a];
        float v58 = [(VOTElement *)v168 valueWithUpdate:a12];
        -[VOTElement _applyBrailleTextFormattingAndInlineCompletionOptions:attributedString:brailleLineRange:rangeOffset:](v168, "_applyBrailleTextFormattingAndInlineCompletionOptions:attributedString:brailleLineRange:rangeOffset:", v58, v57, v54, length, 0);

        id v59 = [objc_alloc((Class)AXAttributedString) initWithStringOrAttributedString:v57];
        id v201 = 0;
        uint64_t v60 = sub_100053D00(v59, &v201);
        id v61 = v201;

        id v62 = objc_alloc((Class)NSMutableAttributedString);
        id v63 = [v60 attributedString];
        id v18 = [v62 initWithAttributedString:v63];

        if (v56) {
          objc_msgSend(v18, "addAttribute:value:range:", kSCROEditableTextAttribute, &__kCFBooleanTrue, 0, objc_msgSend(v18, "length"));
        }
        id v64 = [objc_allocWithZone((Class)NSMutableAttributedString) initWithString:@" "];
        objc_msgSend(v64, "addAttribute:value:range:", kSCROEditableTextPaddingAttribute, &__kCFBooleanTrue, 0, 1);
        [v18 appendAttributedString:v64];
        if (!v56) {
          goto LABEL_86;
        }
        v65.NSUInteger length = (NSUInteger)obj;
        if (obj)
        {
          v65.NSUInteger location = range1;
          v212.NSUInteger location = v54;
          v212.NSUInteger length = length;
          NSRange v66 = NSIntersectionRange(v65, v212);
          if (!v66.length) {
            goto LABEL_86;
          }
          unint64_t v67 = sub_100054130(v66.location - v54, v66.length, v61);
          uint64_t v69 = v68;
          if (v67 + v68 > (unint64_t)[v18 length]) {
            goto LABEL_86;
          }
          v70 = &kSCROSelectionAttribute;
        }
        else
        {
          unint64_t v67 = sub_100054130(range1 - v54, 0, v61);
          if (v67 + 1 > (unint64_t)[v18 length])
          {
LABEL_86:

            goto LABEL_171;
          }
          v70 = &kSCROCursorAttribute;
          uint64_t v69 = 1;
        }
        objc_msgSend(v18, "addAttribute:value:range:", *v70, kCFBooleanTrue, v67, v69);
        goto LABEL_86;
      }
    }
    else
    {
      long long v203 = (__int128)v202;
      NSUInteger length = v202.length;
      if (v202.length) {
        goto LABEL_49;
      }
    }
    NSUInteger v54 = v203;
    goto LABEL_53;
  }
  v161 = [(id)VOTSharedWorkspace selectedLanguage];
  id range1_8 = [objc_allocWithZone((Class)NSMutableString) init];
  if (![(VOTElement *)self isReadingContent])
  {
    id v28 = [(VOTElement *)self label];
    if ([v28 isAXAttributedString])
    {
      id v29 = v28;
      double v30 = [v29 attributeValueForKey:UIAccessibilityTokenBrailleOverride];
      id v28 = v29;
      if ([v30 length])
      {
        id v28 = v30;
      }
    }
    v159 = [(VOTElement *)self _removeBadDeveloperDecisions:v28];

    v154 = [(VOTElement *)self _languageRangesForText:v159];
    id v31 = [v159 length];
    if (v31)
    {
      NSUInteger v32 = (NSUInteger)v31;
      id v33 = self;
      NSUInteger location = 0x7FFFFFFFFFFFFFFFLL;
      if ([(VOTElement *)self doesHaveTraits:kAXWebContentTrait])
      {
        v209.NSUInteger location = (NSUInteger)[(VOTElement *)self textMarkerSelectionRange];
        v211.NSUInteger location = 0;
        v211.NSUInteger length = v32;
        NSRange v35 = NSIntersectionRange(v209, v211);
        NSUInteger v157 = v35.length;
        if (v35.length) {
          NSUInteger location = v35.location;
        }
      }
      else
      {
        NSUInteger v157 = 0;
      }
      uint64_t v41 = range1_8;
      uint64_t v160 = location;
      if ([v159 isAXAttributedString])
      {
        uint64_t v44 = [v159 string];
        uint64_t v41 = range1_8;
        [range1_8 appendFormat:@"%@ ", v44];

        id v33 = self;
      }
      else
      {
        [range1_8 appendFormat:@"%@ ", v159];
      }
    }
    else
    {
      NSUInteger v157 = 0;
      uint64_t v160 = 0x7FFFFFFFFFFFFFFFLL;
      id v33 = self;
      uint64_t v41 = range1_8;
    }
    range1a = (char *)[v41 length];
    v156 = [(VOTElement *)v33 touchContainer];
    unsigned __int8 v45 = [(id)VOTSharedWorkspace containerOutputFeedback];
    if ((((v45 & 0x10) == 0) & ~[v156 touchContainerShouldOutputBraille]) == 0 && a10)
    {
      unsigned __int8 v46 = [v156 label];
      if ([v46 length])
      {
        if ([v46 isAXAttributedString])
        {
          uint64_t v47 = [v46 string];
          [range1_8 appendFormat:@"%@ ", v47];
        }
        else
        {
          [range1_8 appendFormat:@"%@ ", v46];
        }
      }
    }
    uint64_t v71 = self;
    if ([(id)VOTSharedWorkspace navigationStyleHonorsGroups]
      && [(VOTElement *)self includeRoleOnlyForGroupNavigation]
      && [(VOTElement *)self isAccessibleGroup])
    {
      v72 = [(VOTElement *)self _roleDescriptionWithInteractOption:0 language:0];
      if ([v72 length]) {
        [range1_8 appendFormat:@"%@ ", v72];
      }

      uint64_t v71 = self;
    }
    if ([(VOTElement *)v71 doesHaveTraits:kAXImageTrait])
    {
      CFBooleanRef v73 = [(VOTElement *)v71 photoDescription];
      if ([v73 length]) {
        [range1_8 appendFormat:@"%@ ", v73];
      }

      uint64_t v71 = self;
    }
    if ([(VOTElement *)v71 doesHaveTraits:kAXToggleTrait])
    {
      id v74 = 0;
    }
    else
    {
      id v74 = [(VOTElement *)v71 valueWithUpdate:a12];

      uint64_t v71 = self;
    }
    v155 = v74;
    v75 = [(VOTElement *)v71 _languageRangesForText:v74];
    if ([v155 length])
    {
      unsigned int v76 = [v155 isAXAttributedString];
      id v77 = v155;
      CGPoint v78 = v77;
      if (v76)
      {
        id v79 = [v77 attributeValueForKey:UIAccessibilityTokenBrailleOverride];
        id v80 = v79;
        if (v79)
        {
          id v81 = v79;
        }
        else
        {
          id v81 = [v78 string];
        }
        CGPoint v78 = v81;
      }
      long long v82 = self;
      uint64_t v158 = (uint64_t)[range1_8 length];
      [range1_8 appendFormat:@"%@ ", v78];
      [range1_8 length];
    }
    else
    {
      uint64_t v158 = 0x7FFFFFFFFFFFFFFFLL;
      long long v82 = self;
    }
    long long v83 = [(VOTElement *)v82 generateCVMLContentForBraille];
    [range1_8 appendString:v83];

    long long v84 = [(VOTElement *)self customContent];
    id v85 = [(id)VOTSharedWorkspace customContentImportance];
    long long v197 = 0u;
    long long v198 = 0u;
    long long v199 = 0u;
    long long v200 = 0u;
    id obja = v84;
    id v86 = [obja countByEnumeratingWithState:&v197 objects:v207 count:16];
    if (v86)
    {
      uint64_t v87 = *(void *)v198;
      do
      {
        for (i = 0; i != v86; i = (char *)i + 1)
        {
          if (*(void *)v198 != v87) {
            objc_enumerationMutation(obja);
          }
          v89 = *(void **)(*((void *)&v197 + 1) + 8 * i);
          if ([v89 importance] == v85)
          {
            uint64_t v90 = [v89 label];
            v91 = [v89 value];
            [range1_8 appendFormat:@"%@, %@ ", v90, v91];
          }
        }
        id v86 = [obja countByEnumeratingWithState:&v197 objects:v207 count:16];
      }
      while (v86);
    }

    id v92 = [v154 mutableCopy];
    long long v195 = 0u;
    long long v196 = 0u;
    long long v193 = 0u;
    long long v194 = 0u;
    id v169 = v75;
    id v93 = [v169 countByEnumeratingWithState:&v193 objects:v206 count:16];
    if (v93)
    {
      uint64_t v94 = *(void *)v194;
      do
      {
        for (j = 0; j != v93; j = (char *)j + 1)
        {
          if (*(void *)v194 != v94) {
            objc_enumerationMutation(v169);
          }
          uint64_t v96 = *(void **)(*((void *)&v193 + 1) + 8 * (void)j);
          v97 = [v96 objectAtIndexedSubscript:1];
          id v98 = [v97 rangeValue];
          uint64_t v100 = v99;

          v101 = [v96 objectAtIndexedSubscript:0];
          v205[0] = v101;
          uint64_t v102 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", &range1a[(void)v98], v100);
          v205[1] = v102;
          v103 = +[NSArray arrayWithObjects:v205 count:2];
          [v92 addObject:v103];
        }
        id v93 = [v169 countByEnumeratingWithState:&v193 objects:v206 count:16];
      }
      while (v93);
    }

    id v21 = v92;
    long long v189 = 0u;
    long long v190 = 0u;
    long long v191 = 0u;
    long long v192 = 0u;
    v104 = [(VOTElement *)v168 arrayOfTraitsAsStrings];
    id v105 = [v104 countByEnumeratingWithState:&v189 objects:v204 count:16];
    if (v105)
    {
      uint64_t v106 = *(void *)v190;
      do
      {
        for (k = 0; k != v105; k = (char *)k + 1)
        {
          if (*(void *)v190 != v106) {
            objc_enumerationMutation(v104);
          }
          id v108 = [*(id *)(*((void *)&v189 + 1) + 8 * (void)k) mutableCopyWithZone:0];
          v109 = +[VOTBrailleManager manager];
          [v109 applyBrailleSubstitutions:v108];

          [range1_8 appendFormat:@"%@ ", v108];
        }
        id v105 = [v104 countByEnumeratingWithState:&v189 objects:v204 count:16];
      }
      while (v105);
    }

    v111 = (char *)[(VOTElement *)v168 rowRange];
    if (v111 != (char *)0x7FFFFFFF)
    {
      uint64_t v112 = v110;
      if (v110)
      {
        if ([(VOTElement *)v168 containedIn:2]
          || [(VOTElement *)v168 hasExplicitRowInfo])
        {
          v113 = sub_100051D04(off_1001EA9E8, @"one.of.many.abbreviated", 0, v161);
          uint64_t v153 = v112;
          v114 = AXCFormattedString();
          if ((objc_msgSend(range1_8, "containsString:", v114, v111 + 1, v153) & 1) == 0) {
            [range1_8 appendFormat:@"%@ ", v114];
          }
        }
      }
    }
    id v115 = [(VOTElement *)v168 expandedStatus];
    if (v115)
    {
      if (v115 == (id)1) {
        v116 = @"expanded";
      }
      else {
        v116 = @"collapsed";
      }
      v117 = sub_100051D04(off_1001EA9E8, v116, 0, v161);
      [range1_8 appendFormat:@"%@ ", v117];
    }
    v118 = +[AXSettings sharedInstance];
    BOOL v119 = ((unint64_t)[v118 voiceOverActionsFeedback] & 0x10) == 0;

    v120 = v168;
    if (v119) {
      goto LABEL_139;
    }
    v120 = v168;
    if ([(VOTElement *)v168 _ignoreCustomActionIndicator:v165 withElement:v168])
    {
      goto LABEL_139;
    }
    uint64_t v185 = 0;
    v186 = &v185;
    uint64_t v187 = 0x2020000000;
    uint64_t v188 = 0;
    uint64_t v181 = 0;
    v182 = &v181;
    uint64_t v183 = 0x2020000000;
    uint64_t v184 = 0;
    uint64_t v177 = 0;
    v178 = &v177;
    uint64_t v179 = 0x2020000000;
    uint64_t v180 = 0;
    v121 = [(VOTElement *)v168 customRotorActions];
    v176[0] = _NSConcreteStackBlock;
    v176[1] = 3221225472;
    v176[2] = sub_1000B9BCC;
    v176[3] = &unk_1001B61B0;
    v176[4] = &v181;
    v176[5] = &v177;
    v176[6] = &v185;
    [v121 enumerateObjectsUsingBlock:v176];

    v120 = v168;
    if (![(VOTElement *)v168 doesHaveTraits:kAXLaunchIconTrait])
    {
      uint64_t v122 = v186[3];
      if (v122 != v178[3])
      {
LABEL_131:
        if (v122)
        {
          id v123 = sub_100051804(off_1001EA9F0, @"custom.actions.hint.short", 0);
          [range1_8 appendFormat:@" %@", v123];

          v120 = v168;
        }
        uint64_t v124 = v182[3];
        if (v124)
        {
          if (v124 == 1) {
            v125 = @"drops.available.hint.singular";
          }
          else {
            v125 = @"drops.available.hint.plural";
          }
          v126 = sub_100051D04(off_1001EA9E8, v125, 0, v161);
          v127 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v126, v182[3]);

          [range1_8 appendFormat:@" %@", v127];
          v120 = v168;
        }
        goto LABEL_138;
      }
      if (![(VOTElement *)v168 isAccessibleGroup])
      {
        uint64_t v122 = v186[3];
        goto LABEL_131;
      }
    }
LABEL_138:
    _Block_object_dispose(&v177, 8);
    _Block_object_dispose(&v181, 8);
    _Block_object_dispose(&v185, 8);
LABEL_139:
    v128 = [(VOTElement *)v120 supplementalBrailleDescription];
    BOOL v129 = [v128 length] == 0;

    if (!v129)
    {
      v130 = off_1001EA9E8;
      id v131 = [(id)VOTSharedWorkspace selectedLanguage];
      v132 = sub_100051D04(v130, @"braille.supplemental.description.format", 0, v131);
      v133 = [(VOTElement *)v168 supplementalBrailleDescription];
      objc_msgSend(range1_8, "appendFormat:", v132, v133);
    }
    id v24 = v168;
    goto LABEL_142;
  }
  [(VOTElement *)self updatePageContent];
  id v20 = [(VOTElement *)self pageContent];
  id v21 = [(VOTElement *)self _languageRangesForText:v20];
  id v22 = [v20 length];
  if (v22)
  {
    NSUInteger v23 = (NSUInteger)v22;
    id v24 = self;
    v208.NSUInteger location = (NSUInteger)[(VOTElement *)self textMarkerSelectionRange];
    v210.NSUInteger location = 0;
    v210.NSUInteger length = v23;
    NSRange v25 = NSIntersectionRange(v208, v210);
    NSUInteger v26 = v25.location;
    NSUInteger v157 = v25.length;
    if ([v20 isAXAttributedString])
    {
      id v27 = [v20 string];
      [range1_8 appendString:v27];

      id v24 = self;
      NSUInteger v26 = v25.location;
    }
    else
    {
      [range1_8 appendString:v20];
    }
    if (!v25.length || v26 == 0x7FFFFFFFFFFFFFFFLL)
    {
      NSUInteger v26 = (NSUInteger)[(VOTElement *)v24 selectedTextRange];
      NSUInteger v157 = v43;
    }
  }
  else
  {
    NSUInteger v157 = 0;
    NSUInteger v26 = 0x7FFFFFFFFFFFFFFFLL;
    id v24 = self;
  }
  uint64_t v160 = v26;

  uint64_t v158 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_142:
  id v134 = [(VOTElement *)v24 roleDescription];
  if ([v134 length] && objc_msgSend(v134, "isAXAttributedString"))
  {
    id v135 = v134;
    v136 = [v135 attributeValueForKey:UIAccessibilityTokenBrailleOverride];
    id v134 = v135;
    if ([v136 length])
    {
      id v134 = v136;
    }
    [range1_8 appendFormat:@"%@ ", v134];
  }
  if ((unint64_t)[range1_8 length] >= 2
    && objc_msgSend(range1_8, "characterAtIndex:", (char *)objc_msgSend(range1_8, "length") - 1) == 32)
  {
    objc_msgSend(range1_8, "replaceCharactersInRange:withString:", (char *)objc_msgSend(range1_8, "length") - 1, 1, &stru_1001B7888);
  }
  v137.NSUInteger location = (NSUInteger)[range1_8 length];
  v137.NSUInteger length = v137.location;
  v202.NSUInteger location = 0;
  v202.NSUInteger length = v137.location;
  if (a7 && a9 && a7->length)
  {
    long long v203 = (__int128)*a7;
    v213.NSUInteger length = *((void *)&v203 + 1);
    v213.NSUInteger location = v203 + v158;
    v137.NSUInteger location = 0;
    NSRange v140 = NSIntersectionRange(v137, v213);
    NSUInteger v139 = v140.length;
    CFStringRef v138 = (char *)v140.location;
  }
  else
  {
    if (v137.location >= v162) {
      NSUInteger v141 = v162;
    }
    else {
      NSUInteger v141 = v137.location;
    }
    CFStringRef v138 = (char *)objc_msgSend(range1_8, "lineRangeForRange:", v141, 0);
  }
  v142 = v138;
  NSUInteger v143 = v139;
  *(void *)&long long v203 = v138;
  *((void *)&v203 + 1) = v139;
  if (v139)
  {
    v144 = +[NSCharacterSet newlineCharacterSet];
    unsigned int v145 = objc_msgSend(v144, "characterIsMember:", objc_msgSend(range1_8, "characterAtIndex:", &v142[v143 - 1]));

    if (v145) {
      *((void *)&v203 + 1) = --v143;
    }
  }
  objc_msgSend(range1_8, "substringWithRange:", v142, v143);
  v146 = (__CFString *)objc_claimAutoreleasedReturnValue();
  id v147 = objc_allocWithZone((Class)NSMutableAttributedString);
  if ([(__CFString *)v146 length]) {
    CFStringRef v148 = v146;
  }
  else {
    CFStringRef v148 = @" ";
  }
  id v149 = [v147 initWithString:v148];
  id v18 = v149;
  if (v160 == 0x7FFFFFFFFFFFFFFFLL || v160 + v157 > (unint64_t)[v149 length])
  {
    if (v162 + 1 >= (unint64_t)&v142[v143])
    {
      v150 = +[VOTBrailleManager manager];
      BOOL v151 = [v150 lastRefreshTrigger] == 1;

      if (!v151) {
        objc_msgSend(v18, "addAttribute:value:range:", kSCROLineFocusAttribute, &off_1001C56E0, 0, objc_msgSend(v18, "length"));
      }
    }
  }
  else
  {
    objc_msgSend(v18, "addAttribute:value:range:", kSCROSelectionAttribute, kCFBooleanTrue);
  }
  objc_msgSend(v18, "addAttribute:value:range:", kSCROEditableTextAttribute, &__kCFBooleanFalse, 0, objc_msgSend(v18, "length"));
  v152 = [(VOTElement *)v168 valueWithUpdate:a12];
  -[VOTElement _applyBrailleTextFormattingAndInlineCompletionOptions:attributedString:brailleLineRange:rangeOffset:](v168, "_applyBrailleTextFormattingAndInlineCompletionOptions:attributedString:brailleLineRange:rangeOffset:", v152, v18, v142, v143, v158);

  [(VOTElement *)v168 _applyLanguageTokens:v21 attributedString:v18];
LABEL_171:
  [v167 appendAttributedString:v18];
  if (a7) {
    *a7 = (_NSRange)v203;
  }
  if (a8) {
    *a8 = v202;
  }
}

- (void)_applyBrailleTextFormattingAndInlineCompletionOptions:(id)a3 attributedString:(id)a4 brailleLineRange:(_NSRange)a5 rangeOffset:(unint64_t)a6
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v10 = a3;
  id v11 = a4;
  if ([v10 isAXAttributedString])
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    void v16[2] = sub_1000B9DA4;
    v16[3] = &unk_1001B61D8;
    unint64_t v18 = a6;
    NSUInteger v19 = location;
    NSUInteger v20 = length;
    id v12 = v11;
    id v17 = v12;
    [v10 enumerateAttributesUsingBlock:v16];
    BOOL v13 = +[AXSettings sharedInstance];
    unsigned __int8 v14 = [v13 voiceOverInlineTextCompletionAppearanceFeedback];

    if ((v14 & 0x10) == 0)
    {
      long long v15 = xmmword_10016E5C0;
      [v12 getRange:&v15 ofAttribute:kSCROSuggestionTextAttribute];
      if ((void)v15 != 0x7FFFFFFFFFFFFFFFLL) {
        [v12 deleteCharactersInRange:v15];
      }
    }
  }
}

- (void)_applyLanguageTokens:(id)a3 attributedString:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v19 = kSCROLanguageAttribute;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v12 = [v11 objectAtIndexedSubscript:0];
        BOOL v13 = +[NSNull null];
        unsigned __int8 v14 = [v12 isEqual:v13];

        if ((v14 & 1) == 0)
        {
          long long v15 = [v11 objectAtIndexedSubscript:1];
          NSUInteger v16 = (char *)[v15 rangeValue];
          uint64_t v18 = v17;

          if (&v16[v18] <= [v6 length]) {
            objc_msgSend(v6, "addAttribute:value:range:", v19, v12, v16, v18);
          }
        }
      }
      id v8 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }
}

- (id)_languageRangesForText:(id)a3
{
  id v4 = a3;
  if (![v4 length])
  {
    id v6 = &__NSArray0__struct;
    goto LABEL_15;
  }
  id v5 = [(VOTElement *)self language];
  if (v5)
  {
  }
  else
  {
    id v7 = [(id)VOTSharedWorkspace selectedLanguage];

    if (!v7)
    {
      id v10 = +[VOTOutputRequest stringShouldSeparateDueToLanguage:v4 language:0 keyboardLanguageHint:0];
      if (v10) {
        goto LABEL_7;
      }
    }
  }
  v30[1] = @"language";
  v31[0] = v4;
  v30[0] = @"string";
  id v8 = +[NSNull null];
  v31[1] = v8;
  uint64_t v9 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:2];
  NSUInteger v32 = v9;
  id v10 = +[NSArray arrayWithObjects:&v32 count:1];

LABEL_7:
  id v6 = +[NSMutableArray array];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v10;
  id v11 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = 0;
    uint64_t v14 = *(void *)v25;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(obj);
        }
        NSUInteger v16 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v17 = [v16 objectForKeyedSubscript:@"string"];
        uint64_t v18 = [v16 objectForKeyedSubscript:@"language"];
        v28[0] = v18;
        id v19 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", v13, [v17 length]);
        v28[1] = v19;
        long long v20 = +[NSArray arrayWithObjects:v28 count:2];
        [v6 addObject:v20];

        v13 += (uint64_t)[v17 length];
      }
      id v12 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v12);
  }

  id v4 = v22;
LABEL_15:

  return v6;
}

- (void)_applyLinkRelationshipType:(id)a3 language:(id)a4
{
  id v8 = a3;
  id v5 = [(VOTElement *)self linkRelationshipType];
  id v6 = SCRCLinkRelationshipStringForType();
  if ([v6 length]) {
    id v7 = [v8 addString:v6];
  }
}

- (void)_applyExpandedStatus:(id)a3 language:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  int64_t v7 = [(VOTElement *)self expandedStatus];
  if (v7)
  {
    if (v7 == 1) {
      id v8 = @"expanded";
    }
    else {
      id v8 = @"collapsed";
    }
    uint64_t v9 = sub_100051D04(off_1001EA9E8, v8, 0, v6);
    id v10 = [v11 addString:v9 withLanguage:v6];
  }
}

- (void)_applySelectedTrait:(id)a3 language:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  unint64_t v7 = [(VOTElement *)self traits];
  if ((kAXSelectedTrait & v7) != 0)
  {
    id v8 = sub_100051D04(off_1001EA9E8, @"element.selected.text", @"selected", v6);
    if ([(VOTElement *)self doesHaveTraits:kAXPickerElementTrait])
    {
      uint64_t v9 = [v14 outputActions];
      id v10 = [v9 count];
    }
    else
    {
      id v10 = 0;
    }
    id v11 = [v14 addString:v8 breakWords:0 withLanguage:v6 atIndex:v10];
    id v12 = [v14 outputActions];
    uint64_t v13 = [v12 objectAtIndexedSubscript:v10];
    [v13 setIsVoiceOverGeneratedContent:1];
  }
}

- (id)_resolvedOutputLanguage:(BOOL *)a3
{
  id v5 = [(id)VOTSharedWorkspace selectedLanguage];
  if ([(VOTElement *)self isInStatusBar]
    && ([(id)VOTSharedWorkspace systemSpokenLanguage],
        id v6 = objc_claimAutoreleasedReturnValue(),
        AXLanguageCanonicalFormToGeneralLanguage(),
        unint64_t v7 = objc_claimAutoreleasedReturnValue(),
        unsigned int v8 = [v5 hasPrefix:v7],
        v7,
        v6,
        !v8))
  {
    uint64_t v17 = 0;
  }
  else
  {
    if (!v5)
    {
      uint64_t v9 = [(VOTElement *)self language];
      AXLanguageConvertToCanonicalForm();
      id v5 = (id)objc_claimAutoreleasedReturnValue();

      if ([(VOTElement *)self doesHaveTraits:kAXWebContentTrait])
      {
        id v10 = +[AXSettings sharedInstance];
        unsigned int v11 = [v10 voiceOverLanguageDetectionEnabled];

        if (v11)
        {
          id v12 = [(id)VOTSharedWorkspace websiteLanguageMappingOverrides];
          if ([v12 count])
          {
            uint64_t v13 = [(VOTElement *)self webAreaURL];
            id v14 = [v13 absoluteString];
            long long v15 = [v12 objectForKey:v14];

            if (v15)
            {
              id v16 = v15;

              id v5 = v16;
            }
            else
            {
              *a3 = 1;
            }
          }
          else
          {
            *a3 = 1;
          }
        }
        else
        {
          id v12 = v5;
          id v5 = 0;
        }
      }
    }
    id v5 = v5;
    uint64_t v17 = v5;
  }

  return v17;
}

- (void)addTextualInformationToRequest:(id)a3 options:(unint64_t)a4 dataPackage:(id)a5
{
  id v293 = a3;
  id v284 = a5;
  v295 = [v284 lastSeenContextDescriptors];
  v280 = [v284 lastSeenLineAndColumn];
  BOOL v279 = (a4 & 0x102) != 0;
  uint64_t v331 = 0;
  v332 = &v331;
  unint64_t v6 = a4 & 0x40108;
  int v285 = v6 == 0;
  uint64_t v333 = 0x2020000000;
  char v334 = 0;
  BOOL v283 = (a4 & 0x2001180) == 0;
  uint64_t v327 = 0;
  v328 = &v327;
  uint64_t v329 = 0x2020000000;
  char v330 = 0;
  unint64_t v7 = [v293 outputActions];
  id v277 = [v7 count];

  id v8 = (id)(a4 & 0x2004188);
  if ((a4 & 0x1000000) != 0)
  {
    uint64_t v9 = self;
    if (![(VOTElement *)self doesHaveTraits:kAXWebContentTrait]) {
      goto LABEL_5;
    }
    id v10 = [(VOTElement *)self roleDescription];
    id v8 = [v10 length];
  }
  uint64_t v9 = self;
LABEL_5:
  unsigned int v282 = v8 == 0;
  if ((a4 & 0x100000) != 0)
  {
    unint64_t v12 = [(VOTElement *)v9 aspectMask];
    BOOL v14 = (v12 & 9) != 0 && v6 == 0;
    int v285 = v14;
    uint64_t v15 = (v12 >> 1) & 1;
    if ((a4 & 0x2001180) != 0) {
      LODWORD(v15) = 0;
    }
    unsigned int v282 = (v8 == 0) & (v12 >> 2);
    BOOL v283 = v15;
    uint64_t v11 = (v12 >> 3) & 1;
  }
  else
  {
    LODWORD(v11) = 1;
  }
  int v278 = v11;
  unsigned __int8 v326 = 0;
  v288 = [(VOTElement *)v9 _resolvedOutputLanguage:&v326];
  if ((a4 & 0x20) != 0)
  {
    id v16 = [(VOTElement *)self labeledTouchContainer];
    if ([(VOTElement *)self containedIn:1] && ![(VOTElement *)self containedIn:4]) {
      unsigned int v17 = ![(VOTElement *)self containedIn:2];
    }
    else {
      unsigned int v17 = 0;
    }
    if ((([v16 isEqual:self] | v17) & 1) == 0)
    {
      uint64_t v18 = [v16 label];
      id v19 = [(VOTElement *)self label];
      unsigned int v20 = [v18 isEqualToString:v19];

      long long v21 = [v16 label];
      LODWORD(v19) = [v21 length] == 0;

      if (v19) {
        uint64_t v22 = [v16 includeRoleOnlyForGroupNavigation] ? 0 : 0x1000000;
      }
      else {
        uint64_t v22 = 0;
      }
      uint64_t v23 = [v16 doesHaveTraits:kAXWebContentTrait] ? v22 | 2 : v22;
      unsigned __int8 v24 = [(id)VOTSharedWorkspace containerOutputFeedback];
      v285 &= ~v20;
      if ((v24 & 2) != 0)
      {
        long long v25 = [v293 outputActions];
        id v26 = [v25 count];

        [v16 addTextualInformationToRequest:v293 options:v23 dataPackage:0];
        long long v27 = [v293 outputActions];
        id v28 = [v27 count];

        if ((uint64_t)v28 > (uint64_t)v26)
        {
          if ((v24 & 8) != 0)
          {
            id v29 = [v293 lastAction];
            [v29 setObject:&off_1001C4EE8 forVariant:32];
          }
          double v30 = [v293 lastAction];
          [v30 setObject:&__kCFBooleanTrue forVariant:68];
        }
      }
    }
  }
  id v31 = self;
  if ((a4 & 0x8000000000) != 0)
  {
    unsigned int v32 = [(VOTElement *)self applicationIsRTL];
    id v33 = off_1001EA9E8;
    if (v32)
    {
      id v34 = [(id)VOTSharedWorkspace selectedLanguage];
      sub_100051804(v33, @"element.directionality-change.rtl", v34);
    }
    else
    {
      id v34 = [(id)VOTSharedWorkspace selectedLanguage];
      sub_100051804(v33, @"element.directionality-change.ltr", v34);
    NSRange v35 = };
    id v36 = [v293 addString:v35];

    id v31 = self;
  }
  uint64_t v287 = kAXWebContentTrait;
  if (-[VOTElement doesHaveTraits:](v31, "doesHaveTraits:"))
  {
    uint64_t v37 = [(VOTElement *)self uiElement];
    if (([v37 BOOLWithAXAttribute:2237] & 1) == 0)
    {
      unsigned __int8 v38 = [v284 previousElement];
      uint64_t v39 = [v38 uiElement];
      unsigned int v40 = [v39 BOOLWithAXAttribute:2237];

      if (!v40) {
        goto LABEL_46;
      }
      uint64_t v41 = sub_100051D04(off_1001EA9E8, @"element.contenteditable.end", 0, v288);
      id v42 = [v293 addString:v41];

      uint64_t v37 = [v293 lastAction];
      [v37 setIsVoiceOverGeneratedContent:1];
    }
  }
LABEL_46:
  NSUInteger v43 = [v293 elementHeadersForOutput];
  BOOL v44 = [v43 count] == 0;

  if (!v44) {
    [(VOTElement *)self applyHeaderElementsToRequest:v293];
  }
  if ((a4 & 0x4000000) != 0) {
    [(VOTElement *)self applyRowHeadersToRequest:v293];
  }
  if ((a4 & 0x800000) != 0)
  {
    unsigned __int8 v45 = [(VOTElement *)self contextDescriptors];
    BOOL v46 = [v45 count] == 0;

    if (!v46)
    {
      long long v324 = 0u;
      long long v325 = 0u;
      long long v322 = 0u;
      long long v323 = 0u;
      uint64_t v47 = [(VOTElement *)self contextDescriptors];
      id v48 = [v47 countByEnumeratingWithState:&v322 objects:v339 count:16];
      if (v48)
      {
        uint64_t v49 = *(void *)v323;
        do
        {
          for (i = 0; i != v48; i = (char *)i + 1)
          {
            if (*(void *)v323 != v49) {
              objc_enumerationMutation(v47);
            }
            NSUInteger v51 = *(void **)(*((void *)&v322 + 1) + 8 * i);
            id v52 = [v51 objectForKeyedSubscript:@"category"];
            id v53 = [v51 objectForKeyedSubscript:@"value"];
            NSUInteger v54 = [v51 objectForKeyedSubscript:@"isDefault"];
            unsigned int v55 = [v54 BOOLValue];

            BOOL v56 = [v295 objectForKeyedSubscript:v52];
            unsigned int v57 = [v56 isEqualToString:v53];
            if (v56) {
              unsigned int v58 = 0;
            }
            else {
              unsigned int v58 = v55;
            }
            if (((v57 | v58) & 1) == 0)
            {
              id v59 = [v293 addString:v53];
              if ([(id)VOTSharedWorkspace typingPitchChangeEnabled])
              {
                uint64_t v60 = [v293 lastAction];
                LODWORD(v61) = 1062836634;
                id v62 = +[NSNumber numberWithFloat:v61];
                [v60 setObject:v62 forVariant:32];
              }
            }
          }
          id v48 = [v47 countByEnumeratingWithState:&v322 objects:v339 count:16];
        }
        while (v48);
      }
    }
  }
  if ((a4 & 0x10008) == 0x10008 && ![(VOTElement *)self doesHaveTraits:kAXPickerElementTrait]) {
    [(VOTElement *)self _applySelectedTrait:v293 language:v288];
  }
  unint64_t v63 = a4 & 0x2000000000;
  if (v285)
  {
    id v64 = [v293 numberOfActions];
    if ((a4 & 0x1000000000) != 0) {
      uint64_t v65 = 1;
    }
    else {
      uint64_t v65 = v63 >> 36;
    }
    [(VOTElement *)self _applyLabelToRequest:v293 includeBlockQuote:(a4 >> 17) & 1 language:v288 isWebLanguageChoice:v326 interactOption:v65];
    BOOL v66 = (uint64_t)[v293 numberOfActions] > (uint64_t)v64;
    *((unsigned char *)v332 + 24) = v66;
    unsigned int v67 = [v293 containsActions];
    if ((a4 & 0x80) != 0 && [(id)VOTSharedWorkspace typingPitchChangeEnabled])
    {
      uint64_t v68 = [v293 lastAction];
      LODWORD(v69) = 1062836634;
      v70 = +[NSNumber numberWithFloat:v69];
      [v68 setObject:v70 forVariant:32];
    }
    if ([(VOTElement *)self doesHaveTraits:kAXKeyboardKeyTrait])
    {
      uint64_t v71 = [v293 lastAction];
      [v71 setObject:&__kCFBooleanTrue forVariant:58];
    }
    [(VOTElement *)self _applyCustomContent:v293 language:v288];
  }
  else
  {
    unsigned int v67 = 0;
  }
  if ((a4 & 0x400000000) == 0)
  {
    v72 = [v284 customAction];
    [(VOTElement *)self _applyStickyCustomActions:v293 customAction:v72 language:v288];
  }
  if ([(VOTElement *)self doesHaveTraits:kAXMathEquationTrait])
  {
    CFBooleanRef v73 = [(VOTElement *)self mathSummary];
    if ([v73 length]) {
      id v74 = [v293 addString:v73];
    }
    v75 = [(VOTElement *)self mathEquationDescription];
    id v76 = [v293 addAttributedString:v75];
  }
  if (((v67 | v285 ^ 1) & 1) == 0)
  {
    id v77 = [(VOTElement *)self value];
    if (![v77 length])
    {
      CGPoint v78 = [(VOTElement *)self hint];
      BOOL v79 = [v78 length] == 0;

      if (v79) {
        goto LABEL_91;
      }
      id v77 = [(VOTElement *)self hint];
      id v80 = [v293 addString:v77 withLanguage:v288];
      id v81 = [v293 lastAction];
      [v81 setIsVoiceOverGeneratedContent:1];

      BOOL v279 = 0;
    }
  }
LABEL_91:
  unsigned int v82 = [(VOTElement *)self doesHaveTraits:kAXImageTrait];
  if (v82)
  {
    long long v83 = [(VOTElement *)self photoDescription];
    if ([v83 length]) {
      id v84 = [v293 addString:v83 withLanguage:v288];
    }
  }
  if ((([v293 containsActions] | v82 ^ 1) & 1) == 0)
  {
    id v85 = [(id)VOTSharedWorkspace elementManager];
    unsigned __int8 v86 = [v85 determineFullImageDescriptionsEnabled:self];

    if ((v86 & 1) == 0)
    {
      uint64_t v87 = [(VOTElement *)self identifier];
      if ([v87 length]) {
        id v88 = [v293 addString:v87];
      }
    }
  }
  if ([(VOTElement *)self doesHaveTraits:v287])
  {
    [(VOTElement *)self _applyCurrentStatus:v293 language:v288];
    [(VOTElement *)self _applySortDirection:v293 language:v288];
    [(VOTElement *)self _applyDatetimeAttribute:v293 language:v288];
  }
  unint64_t v89 = [(VOTElement *)self traits];
  BOOL v91 = 0;
  if ((kAXIsEditingTrait & v89) == 0)
  {
    unint64_t v90 = [(VOTElement *)self traits];
    if ((kAXWebInteractiveVideoTrait & v90) == 0) {
      BOOL v91 = 1;
    }
  }
  v319[0] = _NSConcreteStackBlock;
  v319[1] = 3221225472;
  v319[2] = sub_1000BD110;
  v319[3] = &unk_1001B6200;
  v319[4] = self;
  v319[5] = &v331;
  v319[6] = &v327;
  char v320 = v285;
  BOOL v321 = v283;
  v281 = objc_retainBlock(v319);
  v314[0] = _NSConcreteStackBlock;
  v314[1] = 3221225472;
  v314[2] = sub_1000BD2C8;
  v314[3] = &unk_1001B6228;
  BOOL v318 = (a4 & 0x10000000) != 0;
  v314[4] = self;
  id v294 = v293;
  id v315 = v294;
  unint64_t v317 = a4;
  id v289 = v288;
  id v316 = v289;
  v286 = objc_retainBlock(v314);
  if (v91)
  {
    if (v283)
    {
      id v92 = [v294 numberOfActions];
      [(VOTElement *)self _applyValueToRequest:v294 options:a4 lastSeenLineAndColumn:v280 language:v289];
      BOOL v93 = (uint64_t)[v294 numberOfActions] > (uint64_t)v92;
      *((unsigned char *)v328 + 24) = v93;
    }
    if ((a4 & 0x800000000) == 0) {
      ((void (*)(void))v281[2])();
    }
    ((void (*)(void))v286[2])();
    if (v282) {
      [(VOTElement *)self _applyTraitsToRequest:v294 options:a4 numHeaderActions:v277 language:v289];
    }
  }
  else
  {
    if (v282) {
      [(VOTElement *)self _applyTraitsToRequest:v294 options:a4 numHeaderActions:v277 language:v289];
    }
    if (v283)
    {
      id v94 = [v294 numberOfActions];
      [(VOTElement *)self _applyValueToRequest:v294 options:a4 lastSeenLineAndColumn:v280 language:v289];
      BOOL v95 = (uint64_t)[v294 numberOfActions] > (uint64_t)v94;
      *((unsigned char *)v328 + 24) = v95;
    }
    ((void (*)(void))v281[2])();
    ((void (*)(void))v286[2])();
  }
  uint64_t v96 = +[AXSettings sharedInstance];
  unint64_t v97 = (unint64_t)[v96 voiceOverLinkFeedback];

  id v98 = v294;
  if (([(VOTElement *)self doesHaveTraits:kAXLinkTrait] & (v97 >> 3) & 1) == 1 && (v97 & 2) == 0)
  {
    uint64_t v99 = [v294 outputActions];
    [v99 enumerateObjectsUsingBlock:&stru_1001B6248];

    id v98 = v294;
  }
  if ((a4 & 0x1000000) != 0
    || [(id)VOTSharedWorkspace navigationStyleHonorsGroups]
    && [(VOTElement *)self includeRoleOnlyForGroupNavigation]
    && [(VOTElement *)self isAccessibleGroup])
  {
    if ((a4 & 0x1000000000) != 0)
    {
      unsigned int v101 = [v98 containsActions];
      if (v63) {
        char v102 = v101;
      }
      else {
        char v102 = 0;
      }
      if ((v102 & 1) == 0)
      {
        uint64_t v100 = v101 ^ 1;
        goto LABEL_136;
      }
    }
    else if (!v63)
    {
      uint64_t v100 = 0;
LABEL_136:
      [(VOTElement *)self _applyRoleDescription:v98 language:v289 interactOption:v100];
      goto LABEL_137;
    }
    if ([v98 containsActions]) {
      uint64_t v100 = 0;
    }
    else {
      uint64_t v100 = 2;
    }
    goto LABEL_136;
  }
LABEL_137:
  if (v278)
  {
    if ([(VOTElement *)self shouldIncludeRowRangeInDescription])
    {
      v103 = (char *)[(VOTElement *)self rowRange];
      uint64_t v105 = v104;
      if (v104)
      {
        uint64_t v106 = v103;
        if (v103 != (char *)0x7FFFFFFF && v103 != (char *)0x7FFFFFFFFFFFFFFFLL)
        {
          if ([(VOTElement *)self doesHaveTraits:kAXKeyboardKeyTrait])
          {
            v107 = AXFormatInteger();
            id v108 = [v98 addString:v107];

            v109 = [v294 lastAction];
            [v109 setIsVoiceOverGeneratedContent:1];
LABEL_148:

            id v98 = v294;
            goto LABEL_149;
          }
          v109 = sub_100051D04(off_1001EA9E8, @"one.of.many", 0, v289);
          if ([v109 length])
          {
            uint64_t v110 = v106 + 1;
            v111 = AXCFormattedString();
            uint64_t v112 = sub_100051D04(off_1001EA9E8, @"one.of.many.abbreviated", 0, v289);
            uint64_t v276 = v105;
            v113 = AXCFormattedString();
            id v114 = objc_msgSend(v294, "addString:brailleString:withLanguage:", v111, v113, v289, v110, v276);
            id v115 = [v294 lastAction];
            [v115 setIsVoiceOverGeneratedContent:1];
          }
          else
          {
            v271 = +[AXSubsystemVoiceOver sharedInstance];
            unsigned __int8 v272 = [v271 ignoreLogging];

            if (v272) {
              goto LABEL_148;
            }
            v273 = +[AXSubsystemVoiceOver identifier];
            v111 = AXLoggerForFacility();

            os_log_type_t v274 = AXOSLogLevelFromAXLogLevel();
            if (!os_log_type_enabled(v111, v274)) {
              goto LABEL_147;
            }
            uint64_t v112 = AXColorizeFormatLog();
            id v275 = v289;
            v113 = _AXStringForArgs();
            id v115 = v111;
            if (os_log_type_enabled(v115, v274))
            {
              LODWORD(buf) = 138543362;
              *(void *)((char *)&buf + 4) = v113;
              _os_log_impl((void *)&_mh_execute_header, v115, v274, "%{public}@", (uint8_t *)&buf, 0xCu);
            }
            v111 = v115;
          }

LABEL_147:
          goto LABEL_148;
        }
      }
    }
  }
LABEL_149:
  if (-[VOTElement doesHaveTraits:](self, "doesHaveTraits:", v287, v275)) {
    [(VOTElement *)self _applyHasPopupAttribute:v98 withLanguage:v289];
  }
  if ([(VOTElement *)self isRequired])
  {
    v116 = sub_100051D04(off_1001EA9E8, @"element.required", 0, v289);
    id v117 = [v98 addString:v116 withLanguage:v289];

    v118 = [v294 lastAction];
    [v118 setIsVoiceOverGeneratedContent:1];

    id v98 = v294;
  }
  if ([(VOTElement *)self shouldAnnounceTableInfo]
    && [(VOTElement *)self isElementFirstElement:1 orLastElement:0 withType:2])
  {
    [(VOTElement *)self applyTableDimension:v98 language:v289];
  }
  if ((a4 & 0x10008) == 0x10008 && [(VOTElement *)self doesHaveTraits:kAXPickerElementTrait]) {
    [(VOTElement *)self _applySelectedTrait:v98 language:v289];
  }
  if (v282)
  {
    [(VOTElement *)self _applyExpandedStatus:v98 language:v289];
    [(VOTElement *)self _applyLinkRelationshipType:v98 language:v289];
  }
  BOOL v119 = self;
  v120 = v119;
  if (![(VOTElement *)v119 doesHaveTraits:v287])
  {
LABEL_171:

    goto LABEL_172;
  }
  unsigned int v121 = [(VOTElement *)v119 doesHaveTraits:kAXRadioButtonTrait | kAXTextEntryTrait | kAXToggleTrait];

  if (v121)
  {
    uint64_t v122 = v119;
    if (v122)
    {
      v120 = v122;
      id v123 = v294;
      while ([v120 doesHaveTraits:v287])
      {
        uint64_t v124 = [v120 invalidStatus];
        if ([v124 length]
          && ([v124 isEqualToString:@"false"] & 1) == 0)
        {
          [v120 _applyInvalidStatus:v123 language:v289];

          goto LABEL_171;
        }
        uint64_t v125 = [v120 directParent];

        v120 = (void *)v125;
        id v123 = v294;
        if (!v125) {
          goto LABEL_171;
        }
      }
      goto LABEL_171;
    }
  }
LABEL_172:
  v126 = v294;
  if ((a4 & 0x20000000) == 0) {
    [(VOTElement *)v119 applyTextEditingInformation:v289 request:v294 options:a4];
  }
  if ((a4 & 0x8000) != 0)
  {
    v127 = [(VOTElement *)v119 scrollStatus];
    if (v127)
    {
      id v128 = [v294 addString:v127];
      if ([(id)VOTSharedWorkspace typingPitchChangeEnabled])
      {
        BOOL v129 = [v294 lastAction];
        [v129 setObject:&off_1001C4EE8 forVariant:32];
      }
    }

    v126 = v294;
  }
  [(VOTElement *)v119 applyCVMLGeneratedContentToRequest:v126 explicitUserRequest:0];
  if (v279 && [(id)VOTSharedWorkspace hintsEnabled])
  {
    v130 = [(VOTElement *)v119 hint];
    if ([v130 length]
      && ([(VOTElement *)v119 label],
          id v131 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v132 = [v130 isEqualToString:v131],
          v131,
          (v132 & 1) == 0))
    {
      id v135 = v294;
      if ([(id)VOTSharedWorkspace brailleInputActive])
      {
        v136 = +[NSLocale currentLocale];
        NSRange v137 = [v136 languageCode];
        unsigned int v138 = [v137 hasPrefix:@"en"];

        if (v138)
        {
          uint64_t v139 = [v130 stringByReplacingOccurrencesOfString:@"Double tap to" withString:@"Tap Dots 3 6 to"];

          v130 = (void *)v139;
        }
        id v135 = v294;
      }
      if ([v130 isAXAttributedString])
      {
        LODWORD(v140) = 1061997773;
        [v135 addPause:v140];
        id v141 = [v135 addAttributedString:v130 withLanguage:v289];
      }
      else
      {
        LODWORD(v140) = 1061997773;
        [v135 addPause:v140];
        id v143 = [v135 addString:v130 withLanguage:v289];
      }
      v142 = [v135 lastAction];
      [v142 setIsVoiceOverGeneratedContent:1];

      int v133 = 1;
    }
    else
    {
      int v133 = 0;
    }
    v144 = [(VOTElement *)v119 instructions];
    if ([v144 length])
    {
      if ((v133 & 1) == 0)
      {
        LODWORD(v145) = 1061997773;
        [v294 addPause:v145];
      }
      id v146 = [v294 addString:v144 withLanguage:v289];
      id v147 = [v294 lastAction];
      [v147 setIsVoiceOverGeneratedContent:1];

      int v133 = 1;
    }

    BOOL v134 = v133 != 0;
    v126 = v294;
  }
  else
  {
    BOOL v134 = 0;
  }
  id v148 = [(VOTElement *)v119 mapFeatureType];
  unsigned int v149 = [(VOTElement *)v119 suppressCustomActionHint];
  BOOL v150 = v148 != (id)1;
  if (AXDeviceSupportsSonification())
  {
    if ((a4 & 0x100000000) != 0
      && ([(VOTElement *)v119 supportsAudiographActions]
       || [(VOTElement *)v119 supportsAudiographs]))
    {
      if (![(id)VOTSharedWorkspace hintsEnabled]) {
        goto LABEL_205;
      }
      BOOL v151 = [(id)VOTSharedWorkspace elementManager];
      v152 = [v151 elementRotor];
      BOOL v153 = [v152 currentRotorType] == (id)66;

      v126 = v294;
      if (v153)
      {
        v154 = sub_100051D04(off_1001EA9F0, @"audiograph.actions.hint", 0, v289);
        id v155 = [v294 addString:v154 withLanguage:v289];

        v156 = [v294 lastAction];
        [v156 setIsVoiceOverGeneratedContent:1];
      }
      else
      {
LABEL_205:
        NSUInteger v157 = sub_100051D04(off_1001EA9F0, @"audiograph.actions.hint.short", 0, v289);
        id v158 = [v126 addString:v157 withLanguage:v289];

        v156 = [v294 lastAction];
        [v156 setIsVoiceOverGeneratedContent:1];
      }

      v126 = v294;
    }
    if ((a4 & 0x4000000000) != 0
      && ([(VOTElement *)v119 supportsAudiographActions]
       || [(VOTElement *)v119 supportsAudiographs]))
    {
      v159 = [(VOTElement *)v119 chartStructureDescription];
      if ([v159 length]) {
        id v160 = [v126 addString:v159];
      }

      v126 = v294;
    }
  }
  if ((v150 & (a4 >> 11) & ~v149) == 0) {
    goto LABEL_288;
  }
  v161 = [(VOTElement *)v119 customRotorActions];
  BOOL v162 = [v161 count] == 0;

  if (!v162)
  {
    if (!v134)
    {
      LODWORD(v163) = 1061997773;
      [v294 addPause:v163];
    }
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v337 = 0x2020000000;
    uint64_t v338 = 0;
    uint64_t v310 = 0;
    v311 = &v310;
    uint64_t v312 = 0x2020000000;
    uint64_t v313 = 0;
    uint64_t v306 = 0;
    v307 = &v306;
    uint64_t v308 = 0x2020000000;
    uint64_t v309 = 0;
    v164 = [(VOTElement *)v119 customRotorActions];
    v305[0] = _NSConcreteStackBlock;
    v305[1] = 3221225472;
    v305[2] = sub_1000BD334;
    v305[3] = &unk_1001B6270;
    v305[4] = v119;
    v305[5] = &v310;
    v305[6] = &v306;
    v305[7] = &buf;
    [v164 enumerateObjectsUsingBlock:v305];

    unsigned int v165 = [(VOTElement *)v119 doesHaveTraits:kAXLaunchIconTrait];
    v166 = +[AXSettings sharedInstance];
    unsigned __int8 v167 = [v166 voiceOverActionsFeedback];

    v168 = +[AXSettings sharedInstance];
    unsigned __int8 v169 = [v168 voiceOverActionsFeedback];

    v170 = +[AXSettings sharedInstance];
    unsigned __int8 v171 = [v170 voiceOverActionsFeedback];

    v172 = [v284 previousElement];
    unsigned int v173 = [(VOTElement *)v119 _ignoreCustomActionIndicator:v172 withElement:v119];

    if ((v167 & 2) != 0) {
      int v174 = v173;
    }
    else {
      int v174 = 1;
    }
    if ((v169 & 8) != 0) {
      char v175 = v173;
    }
    else {
      char v175 = 1;
    }
    if ((v171 & 4) != 0) {
      int v176 = v173;
    }
    else {
      int v176 = 1;
    }
    uint64_t v177 = [(id)VOTSharedWorkspace elementManager];
    v178 = [v177 elementRotor];
    BOOL v179 = [v178 currentRotorType] == (id)55;

    if (v179)
    {
      if ((v174 & 1) == 0 && (a4 & 0x40000000) != 0)
      {
        uint64_t v180 = v311[3];
        if (v180)
        {
          if (v180 == 1) {
            uint64_t v181 = @"drops.available.hint.singular";
          }
          else {
            uint64_t v181 = @"drops.available.hint.plural";
          }
          v182 = sub_100051D04(off_1001EA9E8, v181, 0, v289);
          uint64_t v183 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v182, v311[3]);

          id v184 = [v294 addString:v183 withLanguage:v289];
          if ((v175 & 1) == 0)
          {
            uint64_t v185 = [v294 lastAction];
            [v185 setObject:&off_1001C4EE8 forVariant:32];
          }
          v186 = [v294 lastAction];
          [v186 setIsVoiceOverGeneratedContent:1];
        }
      }
      if ([(id)VOTSharedWorkspace hintsEnabled])
      {
        unsigned int v187 = [(id)VOTSharedWorkspace brailleInputActive];
        uint64_t v188 = @"custom.actions.hint";
        if (v187) {
          uint64_t v188 = @"custom.actions.hint.bsi.command";
        }
      }
      else
      {
        uint64_t v188 = @"custom.actions.hint.short";
      }
      long long v190 = v188;
      if ((v176 & 1) == 0 && [v294 containsActions])
      {
        long long v191 = [v294 lastAction];
        [v191 setObject:@"Sounds/ActionsAvailable.aiff" forVariant:75];
LABEL_255:

LABEL_256:
        goto LABEL_257;
      }
      if ((v165 | v174)) {
        goto LABEL_256;
      }
      long long v192 = sub_100051D04(off_1001EA9F0, v190, 0, v289);
      id v193 = [v294 addString:v192 withLanguage:v289];

      long long v194 = [v294 lastAction];
      [v194 setIsVoiceOverGeneratedContent:1];

      if (v175) {
        goto LABEL_256;
      }
LABEL_254:
      long long v191 = [v294 lastAction];
      [v191 setObject:&off_1001C4EE8 forVariant:32];
      goto LABEL_255;
    }
    if ((v165 & 1) == 0)
    {
      uint64_t v189 = *(void *)(*((void *)&buf + 1) + 24);
      if (v189 != v307[3]) {
        goto LABEL_244;
      }
      if (![(VOTElement *)v119 isAccessibleGroup])
      {
        uint64_t v189 = *(void *)(*((void *)&buf + 1) + 24);
LABEL_244:
        if (v189)
        {
          if ((v176 & 1) != 0 || ![v294 containsActions])
          {
            if (v174)
            {
              if ((a4 & 0x40000000) == 0 || !v311[3]) {
                goto LABEL_257;
              }
              LODWORD(v189) = 0;
              goto LABEL_331;
            }
            v262 = sub_100051D04(off_1001EA9F0, @"custom.actions.hint.short", 0, v289);
            id v263 = [v294 addString:v262 withLanguage:v289];

            v264 = [v294 lastAction];
            [v264 setIsVoiceOverGeneratedContent:1];

            if ((v175 & 1) == 0)
            {
              v265 = [v294 lastAction];
              [v265 setObject:&off_1001C4EE8 forVariant:32];
            }
            LODWORD(v189) = 0;
          }
          else
          {
            [v294 addSound:@"Sounds/ActionsAvailable.aiff"];
            LODWORD(v189) = 1;
          }
        }
        if ((a4 & 0x40000000) == 0) {
          goto LABEL_257;
        }
        uint64_t v266 = v311[3];
        if (!v266) {
          goto LABEL_257;
        }
        if ((v174 & 1) == 0)
        {
          if (v266 == 1) {
            v267 = @"drops.available.hint.singular";
          }
          else {
            v267 = @"drops.available.hint.plural";
          }
          v268 = sub_100051D04(off_1001EA9E8, v267, 0, v289);
          +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v268, v311[3]);
          long long v190 = (__CFString *)objc_claimAutoreleasedReturnValue();

          id v269 = [v294 addString:v190 withLanguage:v289];
          v270 = [v294 lastAction];
          [v270 setIsVoiceOverGeneratedContent:1];

          if (v175) {
            goto LABEL_256;
          }
          goto LABEL_254;
        }
LABEL_331:
        if (((v176 | v189) & 1) == 0 && [v294 containsActions]) {
          [v294 addSound:@"Sounds/ActionsAvailable.aiff"];
        }
      }
    }
LABEL_257:
    _Block_object_dispose(&v306, 8);
    _Block_object_dispose(&v310, 8);
    _Block_object_dispose(&buf, 8);
    BOOL v134 = 1;
  }
  v292 = [(VOTElement *)v119 customPublicRotors];
  if ([(id)VOTSharedWorkspace hintsEnabled] && objc_msgSend(v292, "count"))
  {
    if (!v134)
    {
      LODWORD(v195) = 1061997773;
      [v294 addPause:v195];
    }
    long long v196 = [v292 firstObject];
    long long v197 = [(VOTElement *)v119 customPublicRotorName:v196];

    if ((id)+[VOTRotor rotorTypeForSystemRotorType:v197] == (id)9)
    {
      long long v198 = [v292 firstObject];
      BOOL v199 = (id)[(VOTElement *)v119 customPublicRotorLinkCountForRotor:v198] == (id)1;

      if (v199)
      {
        long long v200 = sub_100051D04(off_1001EA9E8, @"element.link.text", @"link", v289);
        id v201 = off_1001EA9F0;
        if ([(id)VOTSharedWorkspace brailleInputActive]) {
          _NSRange v202 = @"element.containing.single.link.hint.bsi.command";
        }
        else {
          _NSRange v202 = @"element.containing.single.link.hint";
        }
        uint64_t v203 = sub_100051D04(v201, v202, 0, v289);
        [(VOTElement *)v119 _configureAsSingleLinkElementWithRequest:v294 linkTraitTitle:v200 hint:v203 & ((uint64_t)(a4 << 30) >> 63)];
        goto LABEL_285;
      }
    }
    if ((a4 & 0x200000000) != 0)
    {
      long long v200 = +[NSMutableArray array];
      long long v303 = 0u;
      long long v304 = 0u;
      long long v301 = 0u;
      long long v302 = 0u;
      id v204 = v292;
      id v205 = [v204 countByEnumeratingWithState:&v301 objects:v335 count:16];
      if (!v205) {
        goto LABEL_282;
      }
      uint64_t v206 = *(void *)v302;
      while (1)
      {
        for (j = 0; j != v205; j = (char *)j + 1)
        {
          if (*(void *)v302 != v206) {
            objc_enumerationMutation(v204);
          }
          uint64_t v208 = *(void *)(*((void *)&v301 + 1) + 8 * (void)j);
          if ([(VOTElement *)v119 customPublicRotorIsVisibleInTouchRotor:v208])
          {
            NSRange v209 = [(VOTElement *)v119 customPublicRotorName:v208];

            int64_t v210 = +[VOTRotor rotorTypeForSystemRotorType:v209];
            if (!v210)
            {
              long long v197 = v209;
              if (!v209) {
                continue;
              }
LABEL_279:
              [v200 addObject:v197];
              continue;
            }
            long long v197 = +[VOTRotor stringForRotorType:v210];

            if (v197) {
              goto LABEL_279;
            }
          }
        }
        id v205 = [v204 countByEnumeratingWithState:&v301 objects:v335 count:16];
        if (!v205)
        {
LABEL_282:

          uint64_t v203 = sub_100051D04(off_1001EA9F0, @"custom.rotor.items.hint", 0, v289);
          NSRange v211 = [v200 componentsJoinedByString:@", "];
          if ([v211 length])
          {
            NSRange v212 = AXCFormattedString();
            id v213 = objc_msgSend(v294, "addString:withLanguage:", v212, v289, v211);

            v214 = [v294 lastAction];
            [v214 setIsVoiceOverGeneratedContent:1];
          }
LABEL_285:

          break;
        }
      }
    }
  }
  v126 = v294;
LABEL_288:
  if ([(VOTElement *)v119 doesHaveTraits:v287])
  {
    v215 = [(VOTElement *)v119 uiElement];
    unsigned int v216 = [v215 BOOLWithAXAttribute:2227];

    if (v216)
    {
      v217 = sub_100051D04(off_1001EA9E8, @"element.insertion.text", 0, v289);
      id v218 = [v294 addString:v217 breakWords:0 withLanguage:v289 atIndex:0];

      v219 = [v294 lastAction];
      [v219 setIsVoiceOverGeneratedContent:1];
    }
    v220 = [(VOTElement *)v119 uiElement];
    unsigned int v221 = [v220 BOOLWithAXAttribute:2228];

    if (v221)
    {
      v222 = sub_100051D04(off_1001EA9E8, @"element.deletion.text", 0, v289);
      id v223 = [v294 addString:v222 breakWords:0 withLanguage:v289 atIndex:0];

      v224 = [v294 lastAction];
      [v224 setIsVoiceOverGeneratedContent:1];
    }
    v225 = [(VOTElement *)v119 uiElement];
    unsigned int v226 = [v225 BOOLWithAXAttribute:2225];

    if (v226)
    {
      v227 = sub_100051D04(off_1001EA9E8, @"element.startOfSuggestion.item", 0, v289);
      id v228 = [v294 addString:v227 breakWords:0 withLanguage:v289 atIndex:0];

      v229 = [v294 lastAction];
      [v229 setIsVoiceOverGeneratedContent:1];
    }
    v230 = [(VOTElement *)v119 uiElement];
    unsigned int v231 = [v230 BOOLWithAXAttribute:2226];

    if (v231)
    {
      v232 = sub_100051D04(off_1001EA9E8, @"element.endOfSuggestion.item", 0, v289);
      id v233 = [v294 addString:v232];

      v234 = [v294 lastAction];
      [v234 setIsVoiceOverGeneratedContent:1];
    }
    v235 = [(VOTElement *)v119 uiElement];
    unsigned int v236 = [v235 BOOLWithAXAttribute:2230];

    if (v236)
    {
      v237 = sub_100051D04(off_1001EA9E8, @"highlighted", 0, v289);
      id v238 = [v294 addString:v237];

      v239 = [v294 lastAction];
      [v239 setIsVoiceOverGeneratedContent:1];
    }
    v240 = [(VOTElement *)v119 uiElement];
    if (![v240 BOOLWithAXAttribute:2237]) {
      goto LABEL_302;
    }
    v241 = [v284 previousElement];
    v242 = [v241 uiElement];
    unsigned __int8 v243 = [v242 BOOLWithAXAttribute:2237];

    v126 = v294;
    if ((v243 & 1) == 0)
    {
      v244 = sub_100051D04(off_1001EA9E8, @"element.contenteditable.start", 0, v289);
      id v245 = [v294 addString:v244];

      v240 = [v294 lastAction];
      [v240 setIsVoiceOverGeneratedContent:1];
LABEL_302:

      v126 = v294;
    }
  }
  id v246 = [(id)VOTSharedWorkspace moreContentOutputFeedback];
  char v247 = (char)v246;
  if (v246 != (id)1)
  {
    v248 = [(VOTElement *)v119 customContent];
    BOOL v249 = [v248 count] == 0;

    v126 = v294;
    if (!v249)
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v337 = 0x2020000000;
      LOBYTE(v338) = 0;
      v250 = [(VOTElement *)v119 customContent];
      v300[0] = _NSConcreteStackBlock;
      v300[1] = 3221225472;
      v300[2] = sub_1000BD458;
      v300[3] = &unk_1001B6298;
      v300[4] = &buf;
      [v250 enumerateObjectsUsingBlock:v300];

      if (*(unsigned char *)(*((void *)&buf + 1) + 24) && (v247 & 2) != 0)
      {
        v251 = sub_100051D04(off_1001EA9E8, @"more.custom.content.available", 0, v289);
        id v252 = [v294 addString:v251 withLanguage:v289];
        v253 = [v294 lastAction];
        [v253 setIsVoiceOverGeneratedContent:1];

        if ((v247 & 8) != 0)
        {
          v254 = [v294 lastAction];
          [v254 setObject:&off_1001C4EE8 forVariant:32];
        }
      }
      v126 = v294;
      if ((v247 & 4) != 0)
      {
        v255 = [v294 outputActions];
        v256 = [v255 firstObject];
        [v256 setObject:@"Sounds/MoreContentAvailable.aiff" forVariant:75];

        v126 = v294;
      }
      _Block_object_dispose(&buf, 8);
    }
  }
  v298[0] = _NSConcreteStackBlock;
  v298[1] = 3221225472;
  v298[2] = sub_1000BD4A0;
  v298[3] = &unk_1001B3448;
  v298[4] = v119;
  id v257 = v126;
  id v299 = v257;
  v258 = objc_retainBlock(v298);
  if ((a4 & 0x400) != 0)
  {
    LODWORD(v259) = 1061997773;
    [v257 addPause:v259];
    v261 = (id *)v297;
    v297[0] = _NSConcreteStackBlock;
    v297[1] = 3221225472;
    v297[2] = sub_1000BD6E4;
    v297[3] = &unk_1001B6308;
    v297[4] = v257;
    v297[5] = v289;
    v297[6] = v258;
    [(VOTElement *)v119 regionDescriptionWithCompletion:v297];
  }
  else
  {
    if (![(VOTElement *)v119 doesHaveTraits:v287]
      || ![(id)VOTSharedWorkspace hintsEnabled])
    {
      ((void (*)(void *))v258[2])(v258);
      goto LABEL_320;
    }
    v260 = [(id)VOTSharedWorkspace elementManager];
    v261 = (id *)v296;
    v296[0] = _NSConcreteStackBlock;
    v296[1] = 3221225472;
    v296[2] = sub_1000BD770;
    v296[3] = &unk_1001B6330;
    v296[4] = v257;
    v296[5] = v289;
    v296[6] = v258;
    [v260 updateRotorForCurrentElement:1 completion:v296];
  }
LABEL_320:

  _Block_object_dispose(&v327, 8);
  _Block_object_dispose(&v331, 8);
}

- (BOOL)_ignoreCustomActionIndicator:(id)a3 withElement:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = +[AXSettings sharedInstance];
  if ([v9 voiceOverActionFeedbackFirstInListOnly])
  {
    id v10 = [v7 touchContainer];
    uint64_t v11 = [v8 touchContainer];
    if ([v10 isEqual:v11])
    {
      BOOL v12 = [(VOTElement *)self _elementActionsEquivalent:v7 withElement:v8];
LABEL_16:

      goto LABEL_17;
    }
    uint64_t v13 = [v7 touchContainer];
    if (v13 || ([v8 touchContainer], (id v4 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v14 = kAXWebContentTrait;
      if ([v7 doesHaveTraits:kAXWebContentTrait]
        && [v8 doesHaveTraits:v14])
      {
        unsigned __int8 v15 = [(VOTElement *)self _elementActionsEquivalent:v7 withElement:v8];
        BOOL v12 = v15;
        if (!v13) {
          goto LABEL_14;
        }
      }
      else
      {
        unsigned __int8 v15 = 0;
        BOOL v12 = 0;
        if (!v13) {
          goto LABEL_14;
        }
      }
LABEL_15:

      goto LABEL_16;
    }
    unsigned __int8 v15 = [(VOTElement *)self _elementActionsEquivalent:v7 withElement:v8];
LABEL_14:

    BOOL v12 = v15;
    goto LABEL_15;
  }
  BOOL v12 = 0;
LABEL_17:

  return v12;
}

- (BOOL)_elementActionsEquivalent:(id)a3 withElement:(id)a4
{
  id v5 = a4;
  unint64_t v6 = [a3 customRotorActions];
  id v7 = objc_msgSend(v6, "ax_filteredArrayUsingBlock:", &stru_1001B6350);
  id v8 = [v5 customRotorActions];

  uint64_t v9 = objc_msgSend(v8, "ax_filteredArrayUsingBlock:", &stru_1001B6370);
  unsigned __int8 v10 = [v7 isEqualToArray:v9];

  return v10;
}

- (void)_applyCustomContent:(id)a3 language:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(VOTElement *)self customContent];
  id v9 = [(id)VOTSharedWorkspace customContentImportance];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        unsigned __int8 v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v15, "importance", (void)v20) == v9)
        {
          id v16 = [v15 label];
          id v17 = [v6 addString:v16 withLanguage:v7];

          uint64_t v18 = [v15 value];
          id v19 = [v6 addString:v18 withLanguage:v7];
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v12);
  }
}

- (void)_applyStickyCustomActions:(id)a3 customAction:(id)a4 language:(id)a5
{
  id v15 = a3;
  id v8 = a5;
  id v9 = [a4 name];
  if ([(VOTElement *)self retainsCustomRotorActionSetting])
  {
    if ([v9 length])
    {
      id v10 = sub_100051804(off_1001EA9E8, @"current.custom.action", v8);
      id v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v9);
      id v12 = [v15 addString:v11 withLanguage:v8];

      uint64_t v13 = [v15 lastAction];
      [v13 setIsVoiceOverGeneratedContent:1];

      if ([(id)VOTSharedWorkspace typingPitchChangeEnabled])
      {
        uint64_t v14 = [v15 lastAction];
        [v14 setObject:&off_1001C4EE8 forVariant:32];
      }
    }
  }
}

- (void)announceAdditionalTextualInformation:(id)a3
{
  id v6 = a3;
  id v4 = [(VOTElement *)self expandedTextValue];
  if ([v4 length]) {
    id v5 = [v6 addString:v4];
  }
}

- (void)announceTableInfo:(id)a3 options:(unint64_t)a4 language:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  [(VOTElement *)self _applyHeaderStatus:v9 language:v8];
  [(VOTElement *)self _applyTableRowColumnSpan:v9 language:v8];
  [(VOTElement *)self _applyTableRowIndex:v9 options:a4 language:v8];
  [(VOTElement *)self _applyTableColumnIndex:v9 options:a4 language:v8];
}

- (void)applyTextEditingInformation:(id)a3 request:(id)a4 options:(unint64_t)a5
{
  char v5 = a5;
  id v78 = a3;
  id v8 = a4;
  if (![(VOTElement *)self shouldIgnoreTextEditingTrait])
  {
    uint64_t v9 = kAXIsEditingTrait;
    unsigned int v10 = [(VOTElement *)self doesHaveTraits:kAXIsEditingTrait];
    if ((v5 & 0x40) == 0)
    {
      if (v10)
      {
        id v11 = (char *)[(id)VOTSharedWorkspace rotorType];
        if ((unint64_t)(v11 - 3) <= 2)
        {
          id v12 = sub_100051D04(off_1001EA9E8, off_1001B63B8[(void)(v11 - 3)], 0, v78);
          id v13 = [v8 addString:v12 withLanguage:v78 category:@"RotorType"];

          uint64_t v14 = [v8 lastAction];
          [v14 setIsVoiceOverGeneratedContent:1];
        }
      }
    }
    if ([(VOTElement *)self doesHaveAllTraits:kAXTextEntryTrait | v9])
    {
      uint64_t v15 = [(VOTElement *)self textInputElement];
      if (v15)
      {
        id v16 = (VOTElement *)v15;
        id v17 = [(VOTElement *)self textInputElementRange];
        id v19 = v18;
        unint64_t v20 = 0x7FFFFFFFLL;
        if (v17 == (id)0x7FFFFFFF)
        {
          long long v21 = 0;
        }
        else
        {
          NSUInteger v22 = (NSUInteger)v17;
          long long v23 = [(VOTElement *)v16 value];
          if (&v19[v22] <= [v23 length])
          {
            unsigned __int8 v24 = [(VOTElement *)v16 value];
            long long v21 = objc_msgSend(v24, "substringWithRange:", v22, v19);
          }
          else
          {
            v80.NSUInteger location = v22;
            v80.NSUInteger length = (NSUInteger)v19;
            unsigned __int8 v24 = NSStringFromRange(v80);
            BOOL v66 = v23;
            id v68 = [v23 length];
            uint64_t v65 = v24;
            _AXAssert();
            long long v21 = 0;
          }

          unint64_t v20 = v22;
        }
      }
      else
      {
        id v16 = self;
        long long v21 = [(VOTElement *)v16 value];
        id v19 = (char *)[v21 length];
        unint64_t v20 = 0;
      }
      long long v25 = (char *)[(VOTElement *)v16 selectedTextRange];
      if ((unint64_t)v25 < v20) {
        goto LABEL_29;
      }
      if (v20 == 0x7FFFFFFF) {
        goto LABEL_29;
      }
      long long v27 = v25;
      if (v25 == (char *)0x7FFFFFFF) {
        goto LABEL_29;
      }
      if (v26) {
        goto LABEL_29;
      }
      id v28 = &v19[v20];
      if (v16 != self && v25 > v28) {
        goto LABEL_29;
      }
      id v29 = &v25[-v20];
      if (v25 == (char *)v20)
      {
        double v30 = off_1001EA9E8;
        id v31 = @"cursor.at.start";
        goto LABEL_27;
      }
      if (v25 >= v28)
      {
        double v30 = off_1001EA9E8;
        id v31 = @"cursor.at.end";
LABEL_27:
        uint64_t v41 = sub_100051D04(v30, v31, 0, v78);
        if (!v41)
        {
LABEL_29:

          goto LABEL_30;
        }
LABEL_28:
        id v42 = [v8 addAttributedString:v41 withLanguage:v78 category:@"TextDescription"];

        goto LABEL_29;
      }
      unsigned int v32 = [(id)VOTSharedWorkspace elementManager];
      id v33 = [v32 elementRotor];
      id v34 = [v33 currentSelectionRotorType];

      NSRange v35 = &v27[~v20];
      if (v34 == (id)3)
      {
        id v36 = [v21 rangeOfComposedCharacterSequenceAtIndex:v35];
        uint64_t v38 = v37;
        id v39 = [v21 rangeOfComposedCharacterSequenceAtIndex:v29];
      }
      else
      {
        id v36 = objc_msgSend(v21, "ax_wordFromPosition:inDirection:", v35, 1);
        uint64_t v38 = v43;
        id v39 = objc_msgSend(v21, "ax_wordFromPosition:inDirection:", v29, 0);
      }
      id v44 = v39;
      uint64_t v45 = v40;
      id v74 = 0;
      BOOL v46 = &stru_1001B7888;
      id v77 = &stru_1001B7888;
      if (v36 != (id)0x7FFFFFFF && v36 != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v21, "substringWithRange:", v36, v38);
        BOOL v46 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
        id v74 = [(__CFString *)v46 length];
        id v77 = +[NSString stringWithFormat:@"%@%@", @"∑1[[[", v46];
      }
      id v47 = 0;
      id v48 = &stru_1001B7888;
      if (v44 == (id)0x7FFFFFFF)
      {
        v75 = &stru_1001B7888;
      }
      else
      {
        v75 = &stru_1001B7888;
        if (v44 != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v21, "substringWithRange:", v44, v45);
          id v48 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
          id v47 = [(__CFString *)v48 length];
          v75 = +[NSString stringWithFormat:@"%@%@", @"∑2[[[", v48];
        }
      }
      id v72 = v47;
      id v76 = objc_alloc_init((Class)NSNumberFormatter);
      uint64_t v49 = sub_100051D04(off_1001EA9E8, @"cursor.at.position.use.ordinal", 0, v78);
      unsigned int v50 = [v49 isEqualToString:@"yes"];

      if (v50) {
        [v76 setNumberStyle:6];
      }
      CFBooleanRef v73 = v48;
      if ([(__CFString *)v75 length] && [(__CFString *)v77 length])
      {
        if (v34 == (id)3 || ([(__CFString *)v46 isEqualToString:v48] & 1) == 0)
        {
          NSUInteger v51 = sub_100051D04(off_1001EA9E8, @"cursor.at.position", 0, v78);
          id v52 = +[NSNumber numberWithUnsignedInteger:v29 + 1];
          id v53 = [v76 stringFromNumber:v52];
          unsigned int v67 = v75;
          double v69 = v53;
        }
        else
        {
          NSUInteger v51 = sub_100051D04(off_1001EA9E8, @"cursor.at.position.inside", 0, v78);
          id v52 = +[NSNumber numberWithUnsignedInteger:v29 + 1];
          id v53 = [v76 stringFromNumber:v52];
          unsigned int v67 = v53;
        }
        +[NSString stringWithFormat:](NSString, "stringWithFormat:", v51, v77, v67, v69);
      }
      else if ([(__CFString *)v77 length])
      {
        NSUInteger v51 = sub_100051D04(off_1001EA9E8, @"cursor.at.position.after", 0, v78);
        id v52 = +[NSNumber numberWithUnsignedInteger:v29 + 1];
        id v53 = [v76 stringFromNumber:v52];
        +[NSString stringWithFormat:](NSString, "stringWithFormat:", v51, v77, v53, v69);
      }
      else
      {
        if (![(__CFString *)v75 length])
        {
          NSUInteger v54 = &stru_1001B7888;
LABEL_55:
          unsigned int v55 = [(__CFString *)v54 rangeOfString:@"∑1[[["];
          uint64_t v70 = v56;
          unsigned int v57 = [(__CFString *)v54 rangeOfString:@"∑2[[["];
          uint64_t v71 = v58;
          id v59 = [(__CFString *)v54 stringByReplacingOccurrencesOfString:@"∑1[[[" withString:&stru_1001B7888];

          int64_t v60 = v55 - (unsigned char *)[@"∑1[[[" length];
          double v61 = v57;
          if (v57 > v55) {
            double v61 = (unsigned char *)(v57 - (unsigned char *)[@"∑1[[[" length]);
          }
          id v62 = [v59 stringByReplacingOccurrencesOfString:@"∑2[[[" withString:&stru_1001B7888];

          unint64_t v63 = [@"∑2[[[" length];
          if (v57 <= v55) {
            v60 -= (uint64_t)[@"∑2[[[" length];
          }
          id v64 = +[AXAttributedString axAttributedStringWithString:v62];
          uint64_t v41 = v64;
          if (v74 == (id)1) {
            objc_msgSend(v64, "setAttribute:forKey:withRange:", &__kCFBooleanTrue, AXUIAccessibilitySpeechAttributePunctuation, v60 + v70, 1);
          }
          if (v72 == (id)1) {
            objc_msgSend(v41, "setAttribute:forKey:withRange:", &__kCFBooleanTrue, AXUIAccessibilitySpeechAttributePunctuation, &v61[v71] - v63, 1);
          }

          if (!v41) {
            goto LABEL_29;
          }
          goto LABEL_28;
        }
        NSUInteger v51 = sub_100051D04(off_1001EA9E8, @"cursor.at.position.before", 0, v78);
        id v52 = +[NSNumber numberWithUnsignedInteger:v29 + 1];
        id v53 = [v76 stringFromNumber:v52];
        +[NSString stringWithFormat:](NSString, "stringWithFormat:", v51, v75, v53, v69);
      }
      NSUInteger v54 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_55;
    }
  }
LABEL_30:
}

- (void)_configureAsSingleLinkElementWithRequest:(id)a3 linkTraitTitle:(id)a4 hint:(id)a5
{
  id v10 = a3;
  id v7 = a4;
  id v8 = a5;
  if ([v10 numberOfActionsWithString:v7] == (id)2)
  {
    [v10 removeLastActionWithString:v7];
    if (v8) {
      id v9 = [v10 addString:v8];
    }
  }
}

- (id)_roleDescriptionWithInteractOption:(int64_t)a3 language:(id)a4
{
  id v6 = a4;
  id v7 = [(VOTElement *)self roleDescription];
  if (![v7 length]
    && [(id)VOTSharedWorkspace navigationStyleHonorsGroups]
    && [(VOTElement *)self isAccessibleGroup])
  {
    uint64_t v8 = sub_100051D04(off_1001EA9E8, @"group.role", 0, v6);

    id v7 = (void *)v8;
  }
  if ([v7 length])
  {
    if (a3 == 2)
    {
      id v9 = off_1001EA9E8;
      id v10 = @"InteractOut";
    }
    else
    {
      if (a3 != 1) {
        goto LABEL_11;
      }
      id v9 = off_1001EA9E8;
      id v10 = @"InteractIn";
    }
    id v11 = sub_100051804(v9, v10, 0);
    uint64_t v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v7);

    id v7 = (void *)v12;
  }
LABEL_11:

  return v7;
}

- (void)_applyRoleDescription:(id)a3 language:(id)a4 interactOption:(int64_t)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = [(VOTElement *)self _roleDescriptionWithInteractOption:a5 language:v8];
  id v10 = [v14 addString:v9 withLanguage:v8];
  if ([(id)VOTSharedWorkspace typingPitchChangeEnabled])
  {
    id v11 = [v14 lastAction];
    LODWORD(v12) = 1062836634;
    id v13 = +[NSNumber numberWithFloat:v12];
    [v11 setObject:v13 forVariant:32];
  }
}

- (void)applyGroupChildrenCountToRequest:(id)a3
{
  id v11 = a3;
  if ([(VOTElement *)self isAccessibleGroup])
  {
    unint64_t v4 = [(VOTElement *)self groupedChildrenCount];
    if (v4)
    {
      unint64_t v5 = v4;
      id v6 = off_1001EA9E8;
      id v7 = [(id)VOTSharedWorkspace selectedLanguage];
      id v8 = sub_100051D04(v6, @"group.item.count", 0, v7);
      id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v5);
      id v10 = [v11 addString:v9];
    }
  }
}

- (CGRect)adaptFrameForSystemElement:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v7 = [(VOTElement *)self windowContextId];
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = +[VOTElement systemWideElement];
    objc_msgSend(v9, "convertRect:fromContextId:", v8, x, y, width, height);
    double x = v10;
    double y = v11;
    double width = v12;
    double height = v13;
  }
  double v14 = x;
  double v15 = y;
  double v16 = width;
  double v17 = height;
  result.size.double height = v17;
  result.size.double width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (id)regionDescriptionWithFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v8 = +[NSMutableString string];
  double v10 = *((double *)&xmmword_1001EBE30 + 1);
  double v9 = *(double *)&xmmword_1001EBE30;
  double v11 = [(VOTElement *)self application];
  if ([v11 applicationInterfaceOrientation] == 4)
  {

LABEL_4:
    double v14 = v9;
    goto LABEL_6;
  }
  double v12 = [(VOTElement *)self application];
  unsigned int v13 = [v12 applicationInterfaceOrientation];

  if (v13 == 3) {
    goto LABEL_4;
  }
  double v14 = v10;
  double v10 = v9;
LABEL_6:
  v30.origin.CGFloat x = x;
  v30.origin.CGFloat y = y;
  v30.size.double width = width;
  v30.size.CGFloat height = height;
  double MidX = CGRectGetMidX(v30);
  v31.origin.CGFloat x = x;
  v31.origin.CGFloat y = y;
  v31.size.double width = width;
  v31.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v31);
  double v17 = [(id)VOTSharedWorkspace selectedLanguage];
  uint64_t Type = AXDeviceGetType();
  if ((unint64_t)(Type - 1) > 1)
  {
    if (Type != 3) {
      goto LABEL_47;
    }
    if (MidY >= v14 / 3.0)
    {
      double v22 = (v14 + v14) / 3.0;
      if (MidY > v14 / 3.0 && MidY < v22)
      {
        if (MidX >= v10 / 3.0)
        {
          if (MidX > (v10 + v10) / 3.0) {
            long long v21 = @"region.desc.midright";
          }
          else {
            long long v21 = @"region.desc.midmid";
          }
        }
        else
        {
          long long v21 = @"region.desc.midleft";
        }
      }
      else
      {
        if (MidY <= v22)
        {
LABEL_36:
          if (width >= v10 / 5.0)
          {
            if (width > v10 / 3.0 || width < v10 / 5.0)
            {
              uint64_t v26 = off_1001EA9E8;
              if (width > v10 / 1.5 || width < v10 / 3.0) {
                long long v27 = @"region.desc.fullwidth";
              }
              else {
                long long v27 = @"region.desc.halfwidth";
              }
            }
            else
            {
              uint64_t v26 = off_1001EA9E8;
              long long v27 = @"region.desc.quarterwidth";
            }
          }
          else
          {
            uint64_t v26 = off_1001EA9E8;
            long long v27 = @"region.desc.tiny";
          }
          unsigned __int8 v24 = sub_100051D04(v26, v27, 0, v17);
          [v8 appendString:v24];
          goto LABEL_46;
        }
        if (MidX >= v10 / 3.0)
        {
          if (MidX > (v10 + v10) / 3.0) {
            long long v21 = @"region.desc.bottomright";
          }
          else {
            long long v21 = @"region.desc.bottommid";
          }
        }
        else
        {
          long long v21 = @"region.desc.bottomleft";
        }
      }
    }
    else if (MidX >= v10 / 3.0)
    {
      if (MidX > (v10 + v10) / 3.0) {
        long long v21 = @"region.desc.topright";
      }
      else {
        long long v21 = @"region.desc.topmid";
      }
    }
    else
    {
      long long v21 = @"region.desc.topleft";
    }
    long long v25 = sub_100051D04(off_1001EA9E8, v21, 0, v17);
    [v8 appendFormat:@"%@, ", v25];

    goto LABEL_36;
  }
  if (MidY >= v14 / 3.0)
  {
    id v19 = off_1001EA9E8;
    if (MidY > (v14 + v14) / 3.0) {
      unint64_t v20 = @"region.desc.bottom";
    }
    else {
      unint64_t v20 = @"region.desc.midmid";
    }
  }
  else
  {
    id v19 = off_1001EA9E8;
    unint64_t v20 = @"region.desc.top";
  }
  unsigned __int8 v24 = sub_100051D04(v19, v20, 0, v17);
  [v8 appendFormat:@"%@, ", v24];
LABEL_46:

LABEL_47:

  return v8;
}

- (void)regionDescriptionWithCompletion:(id)a3
{
  id v4 = a3;
  [(VOTElement *)self frame];
  -[VOTElement adaptFrameForSystemElement:](self, "adaptFrameForSystemElement:");
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  unsigned int v13 = [(VOTElement *)self touchContainer];
  double v14 = [v13 uiElement];
  double v15 = [v14 numberWithAXAttribute:2123];
  double v16 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v15 unsignedIntValue]);

  double v17 = +[VOTDisplayManager displayManager];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  void v19[2] = sub_1000BF0EC;
  v19[3] = &unk_1001B6398;
  v19[4] = self;
  id v20 = v4;
  id v18 = v4;
  objc_msgSend(v17, "convertFrameToCursorSpace:displayID:completion:", v16, v19, v6, v8, v10, v12);
}

- (BOOL)shouldAnnounceTableInfo
{
  id v3 = [(id)VOTSharedWorkspace elementManager];
  unsigned int v4 = [v3 speakTableRowAndColumnForElement:self];

  if (!v4
    || ![(VOTElement *)self containedIn:2] && ![(VOTElement *)self containedIn:32])
  {
    return 0;
  }
  double v5 = [(VOTElement *)self touchContainer];
  double v6 = v5;
  BOOL v7 = v5
    && ((unint64_t)[v5 rowCount] > 1 || (unint64_t)objc_msgSend(v6, "columnCount") >= 2);

  return v7;
}

- (BOOL)hasExplicitRowInfo
{
  id v3 = [(VOTElement *)self touchContainer];
  BOOL v4 = v3
    && (id)[(VOTElement *)self ariaRowIndex] != (id)0x7FFFFFFF
    && [v3 ariaRowCount] != 0;

  return v4;
}

- (BOOL)hasExplicitColumnInfo
{
  id v3 = [(VOTElement *)self touchContainer];
  BOOL v4 = v3
    && (id)[(VOTElement *)self ariaColumnIndex] != (id)0x7FFFFFFF
    && [v3 ariaColumnCount] != 0;

  return v4;
}

- (id)tableDimensionStringWithRow:(unint64_t)a3 andColumn:(unint64_t)a4
{
  BOOL v4 = 0;
  if (a3 && a4)
  {
    BOOL v7 = sub_100051804(off_1001EA9E8, @"row.count", 0);
    double v8 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v7, a3);

    double v9 = sub_100051804(off_1001EA9E8, @"column.count", 0);
    double v10 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, a4);

    BOOL v4 = +[NSString stringWithFormat:@"%@ %@", v8, v10];
  }

  return v4;
}

- (void)applyTableDimension:(id)a3 language:(id)a4
{
  id v21 = a3;
  id v6 = a4;
  unint64_t v7 = [(VOTElement *)self rowCount];
  unint64_t v8 = [(VOTElement *)self columnCount];
  double v9 = [(VOTElement *)self tableDimensionStringWithRow:v7 andColumn:v8];
  if (!v9) {
    goto LABEL_17;
  }
  if (![(VOTElement *)self hasExplicitRowInfo]
    && ![(VOTElement *)self hasExplicitColumnInfo])
  {
    unsigned int v13 = 0;
LABEL_13:
    id v16 = v9;
    goto LABEL_14;
  }
  unint64_t v10 = [(VOTElement *)self ariaRowCount];
  if (v10) {
    unint64_t v7 = v10;
  }
  unint64_t v11 = [(VOTElement *)self ariaColumnCount];
  if (v11) {
    unint64_t v12 = v11;
  }
  else {
    unint64_t v12 = v8;
  }
  unsigned int v13 = [(VOTElement *)self tableDimensionStringWithRow:v7 andColumn:v12];
  if (!v13) {
    goto LABEL_13;
  }
  double v14 = sub_100051D04(off_1001EA9E8, @"table.display", 0, v6);
  double v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, v9);

  if (!v15) {
    goto LABEL_13;
  }
  id v16 = +[NSString stringWithFormat:@"%@, %@", v13, v15];

LABEL_14:
  id v17 = [v21 addString:v16];
  if ([(id)VOTSharedWorkspace typingPitchChangeEnabled])
  {
    id v18 = [v21 lastAction];
    LODWORD(v19) = 1062836634;
    id v20 = +[NSNumber numberWithFloat:v19];
    [v18 setObject:v20 forVariant:32];
  }
LABEL_17:
}

- (void)_applyHeaderStatus:(id)a3 language:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  unint64_t v7 = [(VOTElement *)self headerElementsForRow:[(VOTElement *)self rowRange]];
  unint64_t v8 = [(VOTElement *)self headerElementsForColumn:[(VOTElement *)self columnRange]];
  if ([v7 containsObject:self])
  {
    double v9 = sub_100051804(off_1001EA9E8, @"row.header", 0);
    id v10 = [v13 addString:v9 withLanguage:v6];
  }
  if ([v8 containsObject:self])
  {
    unint64_t v11 = sub_100051804(off_1001EA9E8, @"column.header", 0);
    id v12 = [v13 addString:v11 withLanguage:v6];
  }
}

- (void)_applyTableRowIndex:(id)a3 options:(unint64_t)a4 language:(id)a5
{
  int v6 = a4;
  id v17 = a3;
  id v8 = a5;
  if ((v6 & 0x400000) == 0)
  {
    id v9 = [(VOTElement *)self rowRange];
    if (v9 != (id)0x7FFFFFFF && v9 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      if ([(VOTElement *)self hasExplicitRowInfo]) {
        [(VOTElement *)self ariaRowIndex];
      }
      id v10 = sub_100051D04(off_1001EA9E8, @"row.change", 0, v8);
      unint64_t v11 = AXFormatInteger();
      id v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v11);
      id v13 = [v17 addString:v12 withLanguage:v8];

      if ([(id)VOTSharedWorkspace typingPitchChangeEnabled])
      {
        double v14 = [v17 lastAction];
        LODWORD(v15) = 1062836634;
        id v16 = +[NSNumber numberWithFloat:v15];
        [v14 setObject:v16 forVariant:32];
      }
    }
  }
}

- (void)_applyTableColumnIndex:(id)a3 options:(unint64_t)a4 language:(id)a5
{
  int v6 = a4;
  id v16 = a3;
  id v8 = a5;
  if ((v6 & 0x200000) == 0 && [(VOTElement *)self columnRange] != (id)0x7FFFFFFF)
  {
    if ([(VOTElement *)self hasExplicitColumnInfo]) {
      [(VOTElement *)self ariaColumnIndex];
    }
    else {
      [(VOTElement *)self columnRange];
    }
    id v9 = sub_100051D04(off_1001EA9E8, @"column.change", 0, v8);
    id v10 = AXFormatInteger();
    unint64_t v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v10);
    id v12 = [v16 addString:v11 withLanguage:v8];

    if ([(id)VOTSharedWorkspace typingPitchChangeEnabled])
    {
      id v13 = [v16 lastAction];
      LODWORD(v14) = 1062836634;
      double v15 = +[NSNumber numberWithFloat:v14];
      [v13 setObject:v15 forVariant:32];
    }
  }
}

- (void)_applyTableRowColumnSpan:(id)a3 language:(id)a4
{
  id v25 = a3;
  id v6 = a4;
  [(VOTElement *)self rowRange];
  unint64_t v8 = v7;
  [(VOTElement *)self columnRange];
  unint64_t v10 = v9;
  if (v8 >= 2)
  {
    unint64_t v11 = sub_100051D04(off_1001EA9E8, @"row.span", 0, v6);
    id v12 = AXFormatInteger();
    id v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v12);
    id v14 = [v25 addString:v13 withLanguage:v6];

    if ([(id)VOTSharedWorkspace typingPitchChangeEnabled])
    {
      double v15 = [v25 lastAction];
      LODWORD(v16) = 1062836634;
      id v17 = +[NSNumber numberWithFloat:v16];
      [v15 setObject:v17 forVariant:32];
    }
  }
  if (v10 >= 2)
  {
    id v18 = sub_100051D04(off_1001EA9E8, @"column.span", 0, v6);
    double v19 = AXFormatInteger();
    id v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v18, v19);
    id v21 = [v25 addString:v20 withLanguage:v6];

    if ([(id)VOTSharedWorkspace typingPitchChangeEnabled])
    {
      double v22 = [v25 lastAction];
      LODWORD(v23) = 1062836634;
      unsigned __int8 v24 = +[NSNumber numberWithFloat:v23];
      [v22 setObject:v24 forVariant:32];
    }
  }
}

- (id)concatenateLabelsWithLinebreaksBasedOnFrame:(id)a3
{
  id v3 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v4)
  {
    id v5 = v4;
    id v6 = 0;
    uint64_t v7 = *(void *)v20;
    double v8 = 0.0;
    double v9 = 0.0;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v3);
        }
        unint64_t v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v12 = [v11 label];
        if ([v12 length])
        {
          [v11 frame];
          double v14 = v13;
          double v16 = v15;
          if (v6)
          {
            if (v13 <= v8 + v9 / 3.0) {
              +[NSString stringWithFormat:@"%@ %@", v6, v12];
            }
            else {
            uint64_t v17 = +[NSString stringWithFormat:@"%@\n%@", v6, v12];
            }

            double v8 = v14;
            double v9 = v16;
            id v6 = (id)v17;
          }
          else
          {
            id v6 = v12;
            double v8 = v14;
            double v9 = v16;
          }
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v5);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)applicationProvidedOCRText
{
  if ([(VOTElement *)self doesHaveAllTraits:kAXImageTrait | kAXWebContentTrait])
  {
    id v3 = [(VOTElement *)self imageOverlayElements];
    id v4 = [(VOTElement *)self concatenateLabelsWithLinebreaksBasedOnFrame:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)generateCVMLContentForBraille
{
  id v3 = +[NSMutableString string];
  id v4 = +[AXSettings sharedInstance];
  id v5 = [v4 voiceOverNeuralElementFeedback];

  id v6 = +[VOTWorkspace sharedWorkspace];
  uint64_t v7 = [v6 visionEngine];

  long long v22 = v7;
  [v7 resultsForElement:self];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v8 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v25;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        double v13 = [(VOTElement *)self visionFeatureDescriptionOptions];
        double v14 = [v12 detectedFeatureDescriptionWithOptions:v13];

        if ([v14 length])
        {
          double v15 = [v12 iconClassFeatures];
          id v16 = [v15 count];

          if (v16)
          {
            unsigned __int8 v17 = [(UIElementProtocol *)self->_uiElement isMLElement];
            if (!v5 && (v17 & 1) == 0)
            {
              id v18 = [v12 localizedDetectedIconHint];
              [v3 appendFormat:@"%@ ", v18];
            }
            [v3 appendFormat:@"%@ ", v14];
          }
        }
        if ([(id)VOTSharedWorkspace textDetectionEnabled])
        {
          long long v19 = [v12 detectedTextDescription];
          if ([v19 length])
          {
            if (!v5)
            {
              long long v20 = [v12 localizedDetectedTextHint];
              [v3 appendFormat:@"%@ ", v20];
            }
            [v3 appendFormat:@"%@ ", v19];
          }
        }
      }
      id v9 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v9);
  }

  return v3;
}

- (void)applyCVMLGeneratedContentToRequest:(id)a3 explicitUserRequest:(BOOL)a4
{
  id v5 = a3;
  if ((AXDeviceIsAudioAccessory() & 1) == 0)
  {
    id v6 = +[VOTWorkspace sharedWorkspace];
    uint64_t v7 = [v6 visionEngine];

    id v8 = [v7 resultsForElement:self];
    id v9 = +[AXSettings sharedInstance];
    id v41 = [v9 voiceOverDiscoveredSensitiveContentFeedback];

    uint64_t v10 = +[AXSettings sharedInstance];
    id v11 = [v10 voiceOverNeuralElementFeedback];

    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v12 = v8;
    id v13 = [v12 countByEnumeratingWithState:&v46 objects:v54 count:16];
    id obj = v12;
    if (v13)
    {
      id v14 = v13;
      id v39 = v7;
      char v40 = 0;
      int v45 = 0;
      uint64_t v44 = *(void *)v47;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v47 != v44) {
            objc_enumerationMutation(obj);
          }
          id v16 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          unsigned __int8 v17 = [(VOTElement *)self visionFeatureDescriptionOptions];
          id v18 = [v16 detectedFeatureDescriptionWithOptions:v17];

          if ([v18 length])
          {
            long long v19 = [v16 iconClassFeatures];
            id v20 = [v19 count];

            long long v21 = [v16 captionFeatures];
            id v22 = [v21 count];

            if (AXRuntimeCheck_MediaAnalysisSupport())
            {
              double v23 = [v16 mediaAnalysisImageCaptionFeatures];
              id v22 = [v23 count];
            }
            if (v20)
            {
              unsigned __int8 v24 = [(UIElementProtocol *)self->_uiElement isMLElement];
              if (!v11 && (v24 & 1) == 0)
              {
                long long v25 = [v16 localizedDetectedIconHint];
                id v26 = [v5 addString:v25 category:@"Category_MLContent"];
              }
            }
            if (v22)
            {
              if (a4
                || ([(id)VOTSharedWorkspace elementManager],
                    long long v27 = objc_claimAutoreleasedReturnValue(),
                    unsigned int v28 = [v27 determineFullImageDescriptionsEnabled:self],
                    v27,
                    v28))
              {
                id v29 = [v16 captionTranslationLocale];
                CGRect v30 = [v29 localeIdentifier];

                if (![(__CFString *)v30 length])
                {

                  CGRect v30 = @"en";
                }
                CGRect v31 = AXMediaLogCommon();
                if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)long long buf = 138412546;
                  NSUInteger v51 = v18;
                  __int16 v52 = 2112;
                  id v53 = v30;
                  _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "Adding image caption to request with text '%@'. language: '%@'", buf, 0x16u);
                }

                id v32 = [v5 addString:v18 withLanguage:v30 category:@"Category_MLContent"];
                [v5 setSupplementalBrailleDescription:v18];
                if (v41 == (id)1 && ([v16 captionMayContainSensitiveContent] & 1) != 0) {
                  char v40 = 1;
                }
                else {
                  v45 |= v11 == (id)1;
                }
              }
            }
            else
            {
              id v33 = [v5 addString:v18 category:@"Category_MLContent"];
              v45 |= v11 == (id)1;
            }
          }
          if ([(id)VOTSharedWorkspace textDetectionEnabled])
          {
            id v34 = [(VOTElement *)self applicationProvidedOCRText];
            if (![v34 length])
            {
              uint64_t v35 = [v16 detectedTextDescription];

              id v34 = (void *)v35;
            }
            if ([v34 length])
            {
              if (v11 == (id)1)
              {
                int v45 = 1;
              }
              else if (!v11)
              {
                id v36 = [v16 localizedDetectedTextHint];
                id v37 = [v5 addString:v36 category:@"Category_MLContent"];
              }
              id v38 = [v5 addString:v34 category:@"Category_MLContent"];
            }
          }
        }
        id v14 = [obj countByEnumeratingWithState:&v46 objects:v54 count:16];
      }
      while (v14);

      if (v40)
      {
        id v12 = +[VOSOutputEvent SensitiveContent];
        uint64_t v7 = v39;
        if (!v12) {
          goto LABEL_46;
        }
      }
      else
      {
        uint64_t v7 = v39;
        if ((v45 & 1) == 0) {
          goto LABEL_46;
        }
        id v12 = +[VOSOutputEvent DidRecognizeMLContent];
        if (!v12) {
          goto LABEL_46;
        }
      }
      [v5 addOutputEvent:v12 toFirstActionMatchingCategory:@"Category_MLContent"];
    }

LABEL_46:
    [v5 setImageCaptionResults:obj];
  }
}

- (id)_rawMathEquation
{
  return [(UIElementProtocol *)self->_uiElement objectWithAXAttribute:2400];
}

- (id)_mathExpression
{
  double v2 = [(UIElementProtocol *)self->_uiElement objectWithAXAttribute:2400];
  id v3 = +[SCRCMathExpression mathExpressionWithDictionary:v2];

  return v3;
}

- (id)_mathAXStringFromAttributedString:(id)a3
{
  id v3 = a3;
  id v4 = [v3 string];
  id v5 = +[AXAttributedString axAttributedStringWithString:v4];

  [v5 setAttribute:&__kCFBooleanTrue forKey:UIAccessibilityTokenMathEquation];
  [v5 setAttribute:&__kCFBooleanTrue forKey:UIAccessibilityTokenIgnoreLeadingCommas];
  id v6 = +[NSMutableIndexSet indexSet];
  id v7 = [v3 length];
  id v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  double v15 = sub_10010DF90;
  id v16 = &unk_1001B7178;
  id v17 = v6;
  id v8 = v5;
  id v18 = v8;
  id v9 = v6;
  objc_msgSend(v3, "enumerateAttributesInRange:options:usingBlock:", 0, v7, 0, &v13);

  objc_msgSend(v8, "setAttribute:forKey:", v9, UIAccessibilityTokenLiteralTextRanges, v13, v14, v15, v16);
  uint64_t v10 = v18;
  id v11 = v8;

  return v11;
}

- (id)mathEquationDescription
{
  id v3 = [(VOTElement *)self _mathExpression];
  id v4 = [v3 speakableDescription];
  id v5 = [(VOTElement *)self _mathAXStringFromAttributedString:v4];

  return v5;
}

- (unint64_t)_minimumSegmentDepthForExpression:(id)a3 withMaximumDepth:(unint64_t)a4
{
  if (a4 < 2) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v6 = 2;
  while (1)
  {
    id v7 = [a3 speakableSegmentsUpToDepth:v6];
    id v8 = [v7 count];

    if ((unint64_t)v8 > 1) {
      break;
    }
    if (++v6 > a4) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return v6;
}

- (unint64_t)_minimumSegmentDepth
{
  id v3 = [(VOTElement *)self _mathExpression];
  unint64_t v4 = -[VOTElement _minimumSegmentDepthForExpression:withMaximumDepth:](self, "_minimumSegmentDepthForExpression:withMaximumDepth:", v3, [v3 maximumDepth]);

  return v4;
}

- (id)mathSegmentsWithGranularityLevel:(unint64_t)a3
{
  if (a3 - 1 >= 4) {
    _AXAssert();
  }
  double v5 = (double)a3;
  unint64_t v6 = [(VOTElement *)self _mathExpression];
  id v7 = [v6 maximumDepth];
  unint64_t v8 = [(VOTElement *)self _minimumSegmentDepthForExpression:v6 withMaximumDepth:v7];
  if (v7 == (id)0x7FFFFFFFFFFFFFFFLL) {
    _AXAssert();
  }
  id v9 = [v6 speakableSegmentsWithSpeakingStyle:0 upToDepth:(unint64_t)((double)v8 + (double)((unint64_t)v7 - v8) * ((v5 + -1.0) / -3.0 + 1.0))];
  uint64_t v10 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v9 count]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = v9;
  id v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = -[VOTElement _mathAXStringFromAttributedString:](self, "_mathAXStringFromAttributedString:", *(void *)(*((void *)&v18 + 1) + 8 * i), (void)v18);
        [v10 addObject:v16];
      }
      id v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }

  return v10;
}

- (BOOL)canNavigateMathSegments
{
  return [(VOTElement *)self _minimumSegmentDepth] != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)mathBrailleDescription
{
  id v3 = [(VOTElement *)self _mathExpression];
  unint64_t v4 = [v3 dollarCodeDescription];

  double v5 = [(VOTElement *)self _mathAXStringFromAttributedString:v4];

  return v5;
}

- (BOOL)canExpandMathEquation
{
  if (![(VOTElement *)self doesHaveTraits:kAXMathEquationTrait]
    || ![(VOTElement *)self shouldExpandMathEquation])
  {
    return 0;
  }
  id v3 = [(VOTElement *)self _mathExpression];
  unint64_t v4 = [v3 subExpressions];
  if ([v4 count] == (id)1)
  {
    do
    {
      double v5 = [v4 lastObject];

      unint64_t v6 = [v5 subExpressions];

      unint64_t v4 = v6;
      id v3 = v5;
    }
    while ([v6 count] == (id)1);
  }
  else
  {
    double v5 = v3;
    unint64_t v6 = v4;
  }
  BOOL v7 = (unint64_t)[v5 maximumDepth] > 1;

  return v7;
}

- (void)expandMathEquation
{
  id v5 = [(VOTElement *)self application];
  id v3 = [v5 uiElement];
  unint64_t v4 = [(VOTElement *)self _rawMathEquation];
  [v3 performAXAction:2033 withValue:v4];
}

- (id)mathSummary
{
  double v2 = [(VOTElement *)self _mathExpression];
  id v3 = [v2 speakableSummary];

  return v3;
}

@end