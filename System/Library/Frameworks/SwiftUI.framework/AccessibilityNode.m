@interface AccessibilityNode
- (AXChartDescriptor)accessibilityChartDescriptor;
- (BOOL)_accessibilityCanPerformAction:(unsigned int)a3;
- (BOOL)_accessibilityCanPerformEscapeAction;
- (BOOL)_accessibilityDataSeriesIncludesTrendlineInSonification;
- (BOOL)_accessibilityDataSeriesSupportsSonification;
- (BOOL)_accessibilityDataSeriesSupportsSummarization;
- (BOOL)_accessibilityExplicitlyNonInteractable;
- (BOOL)_accessibilityIsChartElement;
- (BOOL)_accessibilityIsFirstSiblingForType:(unint64_t)a3;
- (BOOL)_accessibilityIsHostNode;
- (BOOL)_accessibilityIsRTL;
- (BOOL)_accessibilitySupportsActivateAction;
- (BOOL)accessibilityActivate;
- (BOOL)accessibilityElementsHidden;
- (BOOL)accessibilityPerformEscape;
- (BOOL)accessibilityPerformMagicTap;
- (BOOL)accessibilityRespondsToUserInteraction;
- (BOOL)accessibilityScroll:(int64_t)a3;
- (BOOL)accessibilityViewIsModal;
- (BOOL)accessibilityZoomInAtPoint:(CGPoint)a3;
- (BOOL)accessibilityZoomOutAtPoint:(CGPoint)a3;
- (BOOL)isAccessibilityElement;
- (BOOL)shouldGroupAccessibilityChildren;
- (CGPoint)accessibilityActivationPoint;
- (CGRect)_accessibilityBoundsForRange:(_NSRange)a3;
- (CGRect)accessibilityFrame;
- (NSArray)_accessibilityNodeChildrenUnsorted;
- (NSArray)_accessibilityUserDefinedLinkedUIElements;
- (NSArray)accessibilityAttributedUserInputLabels;
- (NSArray)accessibilityCustomActions;
- (NSArray)accessibilityCustomRotors;
- (NSArray)accessibilityDragSourceDescriptors;
- (NSArray)accessibilityDropPointDescriptors;
- (NSArray)accessibilityElements;
- (NSArray)accessibilityUserInputLabels;
- (NSArray)automationElements;
- (NSAttributedString)accessibilityAttributedHint;
- (NSAttributedString)accessibilityAttributedLabel;
- (NSAttributedString)accessibilityAttributedValue;
- (NSString)accessibilityHint;
- (NSString)accessibilityIdentifier;
- (NSString)accessibilityLabel;
- (NSString)accessibilityLanguage;
- (NSString)accessibilityTextualContext;
- (NSString)accessibilityValue;
- (UIBezierPath)accessibilityPath;
- (UIResponder)nextResponder;
- (_NSRange)accessibilityColumnRange;
- (_NSRange)accessibilityRowRange;
- (_TtC7SwiftUI17AccessibilityNode)init;
- (_TtP7SwiftUI36PlatformAccessibilityElementProtocol_)_accessibilityNodeRepresentedElement;
- (double)_accessibilityDataSeriesSonificationDuration;
- (double)_accessibilityMaxValue;
- (double)_accessibilityMinValue;
- (double)_accessibilityNumberValue;
- (id)_accessibilityDataSeriesGridlinePositionsForAxis:(int64_t)a3;
- (id)_accessibilityDataSeriesMaximumValueForAxis:(int64_t)a3;
- (id)_accessibilityDataSeriesMinimumValueForAxis:(int64_t)a3;
- (id)_accessibilityDataSeriesName;
- (id)_accessibilityDataSeriesTitleForAxis:(int64_t)a3;
- (id)_accessibilityDataSeriesUnitLabelForAxis:(int64_t)a3;
- (id)_accessibilityDataSeriesValueDescriptionForPosition:(double)a3 axis:(int64_t)a4;
- (id)_accessibilityDataSeriesValuesForAxis:(int64_t)a3;
- (id)_accessibilityHeadingLevel;
- (id)_accessibilityRoleDescription;
- (id)accessibilityContainer;
- (id)accessibilityCustomAttribute:(id)a3;
- (id)accessibilityCustomContent;
- (id)accessibilityDataTableCellElementForRow:(int64_t)a3 column:(int64_t)a4;
- (id)accessibilityHeaderElementsForColumn:(int64_t)a3;
- (id)accessibilityHeaderElementsForRow:(int64_t)a3;
- (id)accessibilityURL;
- (int64_t)_accessibilityDataSeriesType;
- (int64_t)_accessibilityExpandedStatus;
- (int64_t)_accessibilitySortPriority;
- (int64_t)accessibilityColumnCount;
- (int64_t)accessibilityContainerType;
- (int64_t)accessibilityNavigationStyle;
- (int64_t)accessibilityRowCount;
- (unint64_t)_accessibilityAutomationType;
- (unint64_t)accessibilityDirectTouchOptions;
- (unint64_t)accessibilityTraits;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)dealloc;
@end

@implementation AccessibilityNode

- (BOOL)_accessibilityDataSeriesIncludesTrendlineInSonification
{
  v2 = self;
  AccessibilityNode.attachment.getter(v8);

  uint64_t v3 = swift_bridgeObjectRetain();
  specialized AccessibilityProperties.subscript.getter(v3, (uint64_t)v6);
  swift_bridgeObjectRelease_n();
  uint64_t v4 = MEMORY[0x1E4F412F0];
  _s7SwiftUI4PathVSgWObTm_0((uint64_t)v6, (uint64_t)v7, (unint64_t *)&lazy cache variable for type metadata for AccessibilityDataSeriesConfiguration?, MEMORY[0x1E4F412F0]);
  _s7SwiftUI4PathVSgWObTm_0((uint64_t)v7, (uint64_t)v8, (unint64_t *)&lazy cache variable for type metadata for AccessibilityDataSeriesConfiguration?, v4);
  if (getEnumTag for AccessibilityActionCategory.Category((uint64_t)v8) == 1)
  {

    return 0;
  }
  else
  {
    outlined release of AccessibilityDataSeriesConfiguration?((uint64_t)v7);

    return v9;
  }
}

- (BOOL)isAccessibilityElement
{
  unsigned __int8 v4 = 4;
  v2 = self;
  AccessibilityNode.impliedVisibility(consideringParent:with:)(0, &v4, &v5);

  return (v5 & 0xF) == 0;
}

- (unint64_t)accessibilityTraits
{
  v2 = self;
  unint64_t v3 = AccessibilityNode.resolvedTraits.getter();
  AccessibilityNode.platformElement.getter();
  if (v4)
  {
    char v5 = v4;
    unint64_t v6 = (unint64_t)objc_msgSend(v4, sel_accessibilityTraits);

    v3 |= v6;
  }
  else
  {
  }
  return v3;
}

- (NSString)accessibilityLabel
{
  return (NSString *)@objc AccessibilityNode.accessibilityLabel.getter(self, (uint64_t)a2, AccessibilityNode.resolvedPlainTextLabel.getter);
}

- (NSArray)accessibilityUserInputLabels
{
  v2 = self;
  uint64_t v3 = AccessibilityNode.accessibilityUserInputLabels.getter((uint64_t (*)(uint64_t, id))specialized Sequence.compactMap<A>(_:));

  if (v3)
  {
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return (NSArray *)v4.super.isa;
}

- (NSArray)accessibilityAttributedUserInputLabels
{
  v2 = self;
  uint64_t v3 = AccessibilityNode.accessibilityUserInputLabels.getter((uint64_t (*)(uint64_t, id))specialized Sequence.compactMap<A>(_:));

  if (v3)
  {
    type metadata accessor for NSObject(0, (unint64_t *)&lazy cache variable for type metadata for NSAttributedString);
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return (NSArray *)v4.super.isa;
}

- (NSAttributedString)accessibilityAttributedLabel
{
  v2 = self;
  uint64_t v3 = (void *)AccessibilityNode.resolvedAttributedLabel.getter();

  return (NSAttributedString *)v3;
}

- (NSString)accessibilityValue
{
  return (NSString *)@objc AccessibilityNode.accessibilityLabel.getter(self, (uint64_t)a2, AccessibilityNode.resolvedPlainTextValue.getter);
}

- (NSAttributedString)accessibilityAttributedValue
{
  v2 = self;
  uint64_t v3 = (void *)AccessibilityNode.resolvedAttributedValue.getter();

  return (NSAttributedString *)v3;
}

- (NSString)accessibilityHint
{
  return (NSString *)@objc AccessibilityNode.accessibilityHint.getter(self, (uint64_t)a2, AccessibilityNode.accessibilityHint.getter);
}

- (NSAttributedString)accessibilityAttributedHint
{
  v2 = self;
  uint64_t v3 = (void *)AccessibilityNode.accessibilityAttributedHint.getter();

  return (NSAttributedString *)v3;
}

- (NSString)accessibilityLanguage
{
  return (NSString *)@objc AccessibilityNode.accessibilityHint.getter(self, (uint64_t)a2, AccessibilityNode.accessibilityLanguage.getter);
}

- (NSString)accessibilityTextualContext
{
  v2 = self;
  uint64_t v3 = (void *)AccessibilityNode.accessibilityTextualContext.getter();

  return (NSString *)v3;
}

- (id)_accessibilityHeadingLevel
{
  v2 = self;
  AccessibilityNode.attachment.getter(v7);

  uint64_t v3 = swift_bridgeObjectRetain();
  int v4 = specialized AccessibilityProperties.subscript.getter(v3);
  swift_bridgeObjectRelease_n();
  if (v4 == 7) {
    Class isa = 0;
  }
  else {
    Class isa = UInt._bridgeToObjectiveC()().super.super.isa;
  }

  return isa;
}

- (CGRect)accessibilityFrame
{
  v2 = self;
  double v3 = AccessibilityNode.accessibilityFrame.getter();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;

  double v10 = v3;
  double v11 = v5;
  double v12 = v7;
  double v13 = v9;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (UIBezierPath)accessibilityPath
{
  v2 = self;
  double v3 = AccessibilityNode.accessibilityPath.getter();

  return v3;
}

- (int64_t)_accessibilitySortPriority
{
  v2 = self;
  Swift::Int v3 = AccessibilityNode._accessibilitySortPriority()();

  return v3;
}

- (BOOL)_accessibilityIsHostNode
{
  v2 = self;
  AccessibilityNode.visibility.getter((int *)&v5);

  return (v5 >> 5) & 1;
}

- (_TtP7SwiftUI36PlatformAccessibilityElementProtocol_)_accessibilityNodeRepresentedElement
{
  v2 = self;
  AccessibilityNode.platformElement.getter();
  if (v3)
  {
    double v4 = v3;

    v2 = v4;
  }

  return (_TtP7SwiftUI36PlatformAccessibilityElementProtocol_ *)v2;
}

- (CGRect)_accessibilityBoundsForRange:(_NSRange)a3
{
  Swift::Int length = a3.length;
  Swift::Int location = a3.location;
  unsigned int v5 = self;
  v6.Swift::Int location = location;
  v6.Swift::Int length = length;
  __C::CGRect v15 = AccessibilityNode._accessibilityBounds(for:)(v6);
  CGFloat x = v15.origin.x;
  CGFloat y = v15.origin.y;
  CGFloat width = v15.size.width;
  CGFloat height = v15.size.height;

  double v11 = x;
  double v12 = y;
  double v13 = width;
  double v14 = height;
  result.size.CGFloat height = v14;
  result.size.CGFloat width = v13;
  result.origin.CGFloat y = v12;
  result.origin.CGFloat x = v11;
  return result;
}

- (NSArray)_accessibilityNodeChildrenUnsorted
{
  return (NSArray *)@objc AccessibilityNode._accessibilityNodeChildrenUnsorted.getter(self, (uint64_t)a2, 0, (uint64_t (*)(void))partial apply for implicit closure #1 in AccessibilityLazyLayoutNode.accessibilityElements.getter);
}

- (NSArray)accessibilityElements
{
  return (NSArray *)@objc AccessibilityNode._accessibilityNodeChildrenUnsorted.getter(self, (uint64_t)a2, 2, (uint64_t (*)(void))partial apply for implicit closure #1 in AccessibilityLazyLayoutNode.accessibilityElements.getter);
}

- (NSArray)automationElements
{
  swift_beginAccess();
  Swift::Int v3 = self;
  unint64_t v4 = swift_bridgeObjectRetain();
  unsigned int v5 = static AccessibilityCore.queryFilter(elements:options:)(v4, 1);
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  swift_retain();
  _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSay7SwiftUI17AccessibilityNodeCG_yps5NeverOTg503_s7d4UI17fg16CAA08PlatformC15b35Protocol_So8NSObjectCXcIeggo_ACyps5H11OIegnrzr_TRAhF0lfbN0_So0P0CXcIeggo_Tf1cn_nTf4ng_n((unint64_t)v5, (uint64_t (*)(void))partial apply for implicit closure #1 in AccessibilityLazyLayoutNode.accessibilityElements.getter);

  swift_bridgeObjectRelease();
  swift_release_n();
  v6.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v6.super.isa;
}

- (id)accessibilityContainer
{
  v2 = self;
  AccessibilityNode.accessibilityContainer()(&v11);

  uint64_t v3 = v12;
  if (v12)
  {
    unint64_t v4 = __swift_project_boxed_opaque_existential_1(&v11, v12);
    uint64_t v5 = *(void *)(v3 - 8);
    double v6 = MEMORY[0x1F4188790](v4);
    double v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, double))(v5 + 16))(v8, v6);
    double v9 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v3);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v11);
  }
  else
  {
    double v9 = 0;
  }

  return v9;
}

- (CGPoint)accessibilityActivationPoint
{
  v2 = self;
  double v3 = AccessibilityNode.accessibilityActivationPoint.getter();
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.CGFloat y = v7;
  result.CGFloat x = v6;
  return result;
}

- (NSArray)accessibilityDragSourceDescriptors
{
  return (NSArray *)@objc AccessibilityNode.accessibilityDragSourceDescriptors.getter(self, (uint64_t)a2, (uint64_t (*)(void))AccessibilityNode.resolvedDragPoints(with:));
}

- (NSArray)accessibilityDropPointDescriptors
{
  return (NSArray *)@objc AccessibilityNode.accessibilityDragSourceDescriptors.getter(self, (uint64_t)a2, (uint64_t (*)(void))AccessibilityNode.resolvedDropPoints(with:));
}

- (BOOL)accessibilityViewIsModal
{
  v2 = self;
  unsigned __int8 v3 = AccessibilityNode.accessibilityViewIsModal.getter();

  return v3 & 1;
}

- (BOOL)accessibilityElementsHidden
{
  unsigned __int8 v4 = 4;
  v2 = self;
  AccessibilityNode.impliedVisibility(consideringParent:with:)(0, &v4, &v5);

  return v5 == 3;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  unsigned __int8 v4 = 4;
  v2 = self;
  AccessibilityNode.impliedVisibility(consideringParent:with:)(1, &v4, (char *)&v5);

  return v5 - 1 < 2;
}

- (int64_t)accessibilityNavigationStyle
{
  v2 = self;
  int64_t v3 = AccessibilityNode.accessibilityNavigationStyle.getter();

  return v3;
}

- (int64_t)accessibilityContainerType
{
  v2 = self;
  uint64_t v3 = AccessibilityNode.resolvedContainerType.getter();
  if (v4)
  {
    v7.receiver = v2;
    v7.super_class = (Class)type metadata accessor for AccessibilityNode();
    uint64_t v3 = [(AccessibilityNode *)&v7 accessibilityContainerType];
  }
  int64_t v5 = v3;

  return v5;
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  v2 = self;
  char v3 = AccessibilityNode.resolvedIsInteractive.getter();
  if (v3 == 2)
  {
    v7.receiver = v2;
    v7.super_class = (Class)type metadata accessor for AccessibilityNode();
    BOOL v4 = [(AccessibilityNode *)&v7 accessibilityRespondsToUserInteraction];
  }
  else
  {
    char v5 = v3;

    return v5 & 1;
  }
  return v4;
}

- (BOOL)_accessibilityExplicitlyNonInteractable
{
  v2 = self;
  BOOL v3 = AccessibilityNode._accessibilityExplicitlyNonInteractable.getter();

  return v3;
}

- (void)accessibilityIncrement
{
  v2 = self;
  specialized AccessibilityNode.sendAction<A>(_:value:)(2, 0);
}

- (void)accessibilityDecrement
{
  v2 = self;
  specialized AccessibilityNode.sendAction<A>(_:value:)(2, 1);
}

- (BOOL)accessibilityZoomInAtPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  char v5 = self;
  [(AccessibilityNode *)v5 accessibilityFrame];
  UnitPoint.init(_:in:)();
  v10[0] = 0;
  uint64_t v11 = v6;
  uint64_t v12 = v7;
  CGFloat v13 = x;
  CGFloat v14 = y;
  char v8 = specialized AccessibilityNode.sendAction<A>(_:value:)((uint64_t)v10);

  return v8 & 1;
}

- (BOOL)accessibilityZoomOutAtPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  char v5 = self;
  [(AccessibilityNode *)v5 accessibilityFrame];
  UnitPoint.init(_:in:)();
  v10[0] = 1;
  uint64_t v11 = v6;
  uint64_t v12 = v7;
  CGFloat v13 = x;
  CGFloat v14 = y;
  char v8 = specialized AccessibilityNode.sendAction<A>(_:value:)((uint64_t)v10);

  return v8 & 1;
}

- (NSArray)accessibilityCustomActions
{
  v2 = self;
  unint64_t v3 = AccessibilityNode.accessibilityCustomActions.getter();

  if (v3)
  {
    type metadata accessor for NSObject(0, &lazy cache variable for type metadata for UIAccessibilityCustomAction);
    v4.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.Class isa = 0;
  }

  return (NSArray *)v4.super.isa;
}

- (unint64_t)accessibilityDirectTouchOptions
{
  v2 = self;
  id v3 = AccessibilityNode.accessibilityDirectTouchOptions.getter();

  return (unint64_t)v3;
}

- (BOOL)accessibilityActivate
{
  v2 = self;
  char v3 = specialized AccessibilityNode.sendAction<A>(_:value:)(0, 0, 0, 0);

  return v3 & 1;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  memset(v9, 0, sizeof(v9));
  v2 = self;
  AccessibilityNode.attachment.getter(v8);

  uint64_t v3 = swift_bridgeObjectRetain();
  uint64_t v4 = specialized AccessibilityProperties.subscript.getter(v3);
  swift_bridgeObjectRelease_n();
  uint64_t v7[2] = v9;
  char v5 = specialized Sequence.contains(where:)((uint64_t (*)(uint64_t))closure #1 in AccessibilityNode.hasAction<A>(_:)specialized partial apply, (uint64_t)v7, v4);

  swift_bridgeObjectRelease();
  return v5 & 1;
}

- (BOOL)accessibilityPerformEscape
{
  v2 = self;
  char v3 = specialized AccessibilityNode.sendAction<A>(_:value:)(0, 0, 0, 1);

  return v3 & 1;
}

- (BOOL)_accessibilityCanPerformEscapeAction
{
  memset(v9, 0, 24);
  v9[3] = 1;
  v2 = self;
  AccessibilityNode.attachment.getter(v8);

  uint64_t v3 = swift_bridgeObjectRetain();
  uint64_t v4 = specialized AccessibilityProperties.subscript.getter(v3);
  swift_bridgeObjectRelease_n();
  uint64_t v7[2] = v9;
  char v5 = specialized Sequence.contains(where:)((uint64_t (*)(uint64_t))partial apply for specialized closure #1 in AccessibilityNode.hasAction<A>(_:), (uint64_t)v7, v4);

  swift_bridgeObjectRelease();
  return v5 & 1;
}

- (BOOL)accessibilityPerformMagicTap
{
  v2 = self;
  char v3 = specialized AccessibilityNode.sendAction<A>(_:value:)(0, 0, 0, 2);

  return v3 & 1;
}

- (id)accessibilityURL
{
  type metadata accessor for Text.Style?(0, (unint64_t *)&lazy cache variable for type metadata for URL?, MEMORY[0x1E4F276F0], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v3 - 8);
  char v5 = (char *)&v13 - v4;
  uint64_t v6 = self;
  AccessibilityNode.accessibilityURL()((uint64_t)v5);

  uint64_t v7 = type metadata accessor for URL();
  uint64_t v8 = *(void *)(v7 - 8);
  double v10 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    URL._bridgeToObjectiveC()(v9);
    double v10 = v11;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }

  return v10;
}

- (NSArray)_accessibilityUserDefinedLinkedUIElements
{
  v2 = self;
  uint64_t v3 = AccessibilityNode._accessibilityUserDefinedLinkedUIElements.getter();

  if (v3)
  {
    v4.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.Class isa = 0;
  }

  return (NSArray *)v4.super.isa;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  NSArray v4 = self;
  LOBYTE(a3) = AccessibilityNode.accessibilityScroll(_:)((UIAccessibilityScrollDirection)a3);

  return a3 & 1;
}

- (BOOL)_accessibilityCanPerformAction:(unsigned int)a3
{
  NSArray v4 = self;
  LOBYTE(a3) = AccessibilityNode._accessibilityCanPerformAction(_:)(a3);

  return a3 & 1;
}

- (NSArray)accessibilityCustomRotors
{
  v2 = self;
  AccessibilityNode.resolvedCustomRotors.getter();

  type metadata accessor for NSObject(0, &lazy cache variable for type metadata for UIAccessibilityCustomRotor);
  v3.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (BOOL)_accessibilityIsRTL
{
  v2 = self;
  EnvironmentValues.layoutDirection.getter();

  return v4;
}

- (NSString)accessibilityIdentifier
{
  return (NSString *)@objc AccessibilityNode.accessibilityHint.getter(self, (uint64_t)a2, AccessibilityNode.accessibilityIdentifier.getter);
}

- (unint64_t)_accessibilityAutomationType
{
  v2 = self;
  id v3 = AccessibilityNode._accessibilityAutomationType()();

  return (unint64_t)v3;
}

- (id)_accessibilityRoleDescription
{
  return @objc AccessibilityNode.accessibilityHint.getter(self, (uint64_t)a2, (uint64_t (*)(void))AccessibilityNode._accessibilityRoleDescription());
}

- (double)_accessibilityMinValue
{
  v2 = self;
  double v3 = AccessibilityNode._accessibilityMinValue()(MEMORY[0x1E4F40E70]);

  return v3;
}

- (double)_accessibilityMaxValue
{
  v2 = self;
  double v3 = AccessibilityNode._accessibilityMinValue()(MEMORY[0x1E4F40E68]);

  return v3;
}

- (double)_accessibilityNumberValue
{
  v2 = self;
  double v3 = AccessibilityNode._accessibilityNumberValue()();

  return v3;
}

- (int64_t)_accessibilityExpandedStatus
{
  v2 = self;
  int64_t v3 = AccessibilityNode._accessibilityExpandedStatus()();

  return v3;
}

- (id)accessibilityDataTableCellElementForRow:(int64_t)a3 column:(int64_t)a4
{
  uint64_t v6 = self;
  uint64_t v7 = (void *)AccessibilityNode.accessibilityDataTableCellElement(forRow:column:)(a3, a4);

  return v7;
}

- (int64_t)accessibilityRowCount
{
  v2 = self;
  int64_t v3 = AccessibilityNode.accessibilityRowCount()(AccessibilityCollectionViewTableDataSource.rowCount.getter);

  return v3;
}

- (int64_t)accessibilityColumnCount
{
  v2 = self;
  int64_t v3 = AccessibilityNode.accessibilityRowCount()(AccessibilityCollectionViewTableDataSource.columnCount.getter);

  return v3;
}

- (id)accessibilityHeaderElementsForRow:(int64_t)a3
{
  return 0;
}

- (id)accessibilityHeaderElementsForColumn:(int64_t)a3
{
  BOOL v4 = self;
  unint64_t v5 = (unint64_t)AccessibilityNode.accessibilityHeaderElements(forColumn:)(a3);

  if (v5)
  {
    type metadata accessor for UIAccessibilityContainerDataTableCell();
    v6.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v6.super.Class isa = 0;
  }

  return v6.super.isa;
}

- (_NSRange)accessibilityColumnRange
{
  v2 = self;
  __C::_NSRange v3 = AccessibilityNode.accessibilityColumnRange()();

  Swift::Int location = v3.location;
  Swift::Int length = v3.length;
  result.Swift::Int length = length;
  result.Swift::Int location = location;
  return result;
}

- (_NSRange)accessibilityRowRange
{
  v2 = self;
  __C::_NSRange v3 = AccessibilityNode.accessibilityRowRange()();

  Swift::Int location = v3.location;
  Swift::Int length = v3.length;
  result.Swift::Int length = length;
  result.Swift::Int location = location;
  return result;
}

- (BOOL)_accessibilityIsFirstSiblingForType:(unint64_t)a3
{
  BOOL v4 = self;
  LOBYTE(a3) = AccessibilityNode._accessibilityIsFirstSibling(for:)(a3);

  return a3 & 1;
}

- (id)_accessibilityDataSeriesName
{
  return @objc AccessibilityNode.accessibilityHint.getter(self, (uint64_t)a2, (uint64_t (*)(void))AccessibilityNode._accessibilityDataSeriesName());
}

- (int64_t)_accessibilityDataSeriesType
{
  v2 = self;
  int64_t v3 = AccessibilityNode._accessibilityDataSeriesType()();

  return v3;
}

- (BOOL)_accessibilityDataSeriesSupportsSummarization
{
  v2 = self;
  AccessibilityNode.attachment.getter(v8);

  uint64_t v3 = swift_bridgeObjectRetain();
  specialized AccessibilityProperties.subscript.getter(v3, (uint64_t)v6);
  swift_bridgeObjectRelease_n();
  uint64_t v4 = MEMORY[0x1E4F412F0];
  _s7SwiftUI4PathVSgWObTm_0((uint64_t)v6, (uint64_t)v7, (unint64_t *)&lazy cache variable for type metadata for AccessibilityDataSeriesConfiguration?, MEMORY[0x1E4F412F0]);
  _s7SwiftUI4PathVSgWObTm_0((uint64_t)v7, (uint64_t)v8, (unint64_t *)&lazy cache variable for type metadata for AccessibilityDataSeriesConfiguration?, v4);
  if (getEnumTag for AccessibilityActionCategory.Category((uint64_t)v8) == 1)
  {

    return 0;
  }
  else
  {
    outlined release of AccessibilityDataSeriesConfiguration?((uint64_t)v7);

    return v9;
  }
}

- (BOOL)_accessibilityDataSeriesSupportsSonification
{
  v2 = self;
  AccessibilityNode.attachment.getter(v8);

  uint64_t v3 = swift_bridgeObjectRetain();
  specialized AccessibilityProperties.subscript.getter(v3, (uint64_t)v6);
  swift_bridgeObjectRelease_n();
  uint64_t v4 = MEMORY[0x1E4F412F0];
  _s7SwiftUI4PathVSgWObTm_0((uint64_t)v6, (uint64_t)v7, (unint64_t *)&lazy cache variable for type metadata for AccessibilityDataSeriesConfiguration?, MEMORY[0x1E4F412F0]);
  _s7SwiftUI4PathVSgWObTm_0((uint64_t)v7, (uint64_t)v8, (unint64_t *)&lazy cache variable for type metadata for AccessibilityDataSeriesConfiguration?, v4);
  if (getEnumTag for AccessibilityActionCategory.Category((uint64_t)v8) == 1)
  {

    return 0;
  }
  else
  {
    outlined release of AccessibilityDataSeriesConfiguration?((uint64_t)v7);

    return v9;
  }
}

- (double)_accessibilityDataSeriesSonificationDuration
{
  v2 = self;
  double v3 = AccessibilityNode._accessibilityDataSeriesSonificationDuration()();

  return v3;
}

- (id)_accessibilityDataSeriesValuesForAxis:(int64_t)a3
{
  return @objc AccessibilityNode._accessibilityDataSeriesGridlinePositions(for:)(self, (uint64_t)a2, a3, (uint64_t (*)(uint64_t))AccessibilityNode._accessibilityDataSeriesValues(for:));
}

- (id)_accessibilityDataSeriesTitleForAxis:(int64_t)a3
{
  return @objc AccessibilityNode._accessibilityDataSeriesTitle(for:)(self, (uint64_t)a2, a3, AccessibilityNode._accessibilityDataSeriesTitle(for:));
}

- (id)_accessibilityDataSeriesUnitLabelForAxis:(int64_t)a3
{
  return @objc AccessibilityNode._accessibilityDataSeriesTitle(for:)(self, (uint64_t)a2, a3, AccessibilityNode._accessibilityDataSeriesUnitLabel(for:));
}

- (id)_accessibilityDataSeriesMinimumValueForAxis:(int64_t)a3
{
  uint64_t v4 = self;
  Class v5 = AccessibilityNode._accessibilityDataSeriesMinimumValue(for:)(a3);

  return v5;
}

- (id)_accessibilityDataSeriesMaximumValueForAxis:(int64_t)a3
{
  uint64_t v4 = self;
  Class v5 = AccessibilityNode._accessibilityDataSeriesMaximumValue(for:)(a3);

  return v5;
}

- (id)_accessibilityDataSeriesGridlinePositionsForAxis:(int64_t)a3
{
  return @objc AccessibilityNode._accessibilityDataSeriesGridlinePositions(for:)(self, (uint64_t)a2, a3, AccessibilityNode._accessibilityDataSeriesGridlinePositions(for:));
}

- (id)_accessibilityDataSeriesValueDescriptionForPosition:(double)a3 axis:(int64_t)a4
{
  NSArray v6 = self;
  uint64_t v7 = AccessibilityNode._accessibilityDataSeriesValueDescription(forPosition:axis:)(a4, a3);
  uint64_t v9 = v8;

  if (v9)
  {
    double v10 = (void *)MEMORY[0x18C115780](v7, v9);
    swift_bridgeObjectRelease();
  }
  else
  {
    double v10 = 0;
  }

  return v10;
}

- (void)dealloc
{
  v2 = self;
  AccessibilityNode.platformElement.getter();
  if (v3)
  {
    uint64_t v4 = v3;
    objc_msgSend(v3, sel_setAccessibilityNodeForPlatformElement_, 0);
  }
  if ([(AccessibilityNode *)v2 respondsToSelector:sel__accessibilityUnregister]) {
    [(AccessibilityNode *)v2 _accessibilityUnregister];
  }
  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for AccessibilityNode();
  [(AccessibilityNode *)&v5 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  outlined destroy of weak FallbackResponderProvider?((uint64_t)self + OBJC_IVAR____TtC7SwiftUI17AccessibilityNode_viewRendererHost);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  outlined consume of AccessibilityAttachment?(*(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7SwiftUI17AccessibilityNode_cachedCombinedAttachment), *(void **)((char *)&self->super._responderFlags+ OBJC_IVAR____TtC7SwiftUI17AccessibilityNode_cachedCombinedAttachment));
  swift_bridgeObjectRelease();

  swift_release();
}

- (UIResponder)nextResponder
{
  v2 = self;
  double v3 = (void *)AccessibilityNode.next.getter();

  return (UIResponder *)v3;
}

- (_TtC7SwiftUI17AccessibilityNode)init
{
  _NSRange result = (_TtC7SwiftUI17AccessibilityNode *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (id)accessibilityCustomAttribute:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  uint64_t v7 = self;
  AccessibilityNode.accessibilityCustomAttribute(_:)(v4, v6, &v16);

  swift_bridgeObjectRelease();
  uint64_t v8 = v17;
  if (v17)
  {
    uint64_t v9 = __swift_project_boxed_opaque_existential_1(&v16, v17);
    uint64_t v10 = *(void *)(v8 - 8);
    double v11 = MEMORY[0x1F4188790](v9);
    uint64_t v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, double))(v10 + 16))(v13, v11);
    CGFloat v14 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v8);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v16);
  }
  else
  {
    CGFloat v14 = 0;
  }

  return v14;
}

- (AXChartDescriptor)accessibilityChartDescriptor
{
  v2 = self;
  double v3 = (void *)AccessibilityNode.accessibilityChartDescriptor.getter();

  return (AXChartDescriptor *)v3;
}

- (BOOL)_accessibilityIsChartElement
{
  v2 = self;
  AccessibilityNode.attachment.getter(v6);

  uint64_t v3 = swift_bridgeObjectRetain();
  uint64_t v4 = specialized AccessibilityProperties.subscript.getter(v3);
  swift_bridgeObjectRelease_n();

  if (v4) {
    swift_release();
  }
  return v4 != 0;
}

- (id)accessibilityCustomContent
{
  v2 = self;
  unint64_t v3 = (unint64_t)AccessibilityNode.accessibilityCustomContent()();

  if (v3)
  {
    type metadata accessor for AXCustomContent();
    v4.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.Class isa = 0;
  }

  return v4.super.isa;
}

@end