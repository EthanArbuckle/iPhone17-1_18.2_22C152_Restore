@interface HKGraphView
+ (BOOL)visibleIntersectionForRange:(id)a3 visibleRange:(id)a4;
+ (double)_modelCoordinateSpanForRange:(id)a3 axis:(id)a4;
+ (id)_rangeFromModelCoordinateMin:(double)a3 max:(double)a4 axis:(id)a5;
- ($352843287EF74459AF23949619AEBC4C)_closestDataPointPathToPoint:(SEL)a3 seriesGroupRow:(CGPoint)a4 minimumXDistance:(int64_t)a5 xDistanceOut:(double)a6;
- ($352843287EF74459AF23949619AEBC4C)_closestDataPointPathToPoint:(SEL)a3 seriesGroupRow:(CGPoint)a4 seriesInGroup:(int64_t)a5 minimumXDistance:(id)a6 xDistanceOut:(double)a7;
- (BOOL)_allSeriesAreInverted:(id)a3;
- (BOOL)_anySeriesWantsInternalLegends:(int64_t)a3;
- (BOOL)_autoscaleTransformIsSignificant:(id)a3;
- (BOOL)_axisRangeIsDateRange;
- (BOOL)_compareChartDate:(id)a3 toDate:(id)a4;
- (BOOL)_compareRange:(id)a3 toRange:(id)a4;
- (BOOL)_configureYAxisViewIfNeeded;
- (BOOL)_drawingDuringScrolling;
- (BOOL)_graphViewIsConfigured;
- (BOOL)_initializationPeriodIsActive;
- (BOOL)_measureStartupFlagFromEnvironment;
- (BOOL)_needsYAxisUpdateDuringRender;
- (BOOL)_selectionContextsNotPreviouslySelected:(id)a3;
- (BOOL)_seriesGroupHasLegendEntries:(id)a3;
- (BOOL)_seriesRequiresYAutoscale:(id)a3;
- (BOOL)_setRangesForActiveVisibleRange:(id)a3;
- (BOOL)_skipRenderingToView:(id)a3 yAxisView:(id)a4 context:(CGContext *)a5 chartRect:(CGRect)a6;
- (BOOL)_stickySelectionActive;
- (BOOL)_tilesAreEnabled;
- (BOOL)_tilesConfigurableAfterInitialRender;
- (BOOL)_tilesReconfigurableAfterInitialRender;
- (BOOL)_touchesActuallyMoved:(id)a3;
- (BOOL)allSeriesHaveDataAvailable;
- (BOOL)animationAutoscaleInProgress;
- (BOOL)contentOffsetIsSet;
- (BOOL)contentWidthFromTimeScope;
- (BOOL)disableScrolling;
- (BOOL)disableSelection;
- (BOOL)disableXAxis;
- (BOOL)drawsGridlinesPerSeriesGroup;
- (BOOL)enableStickySelection;
- (BOOL)enableZoomInGesture;
- (BOOL)externalSelectionScheduled;
- (BOOL)isScrollViewDecelerating;
- (BOOL)measurementStartupAutoscale;
- (BOOL)measuringStartupTime;
- (BOOL)moveSelectedSeriesToFront;
- (BOOL)multiSeriesSelection;
- (BOOL)prefersOpaqueLegends;
- (BOOL)rangeIsVisible:(id)a3;
- (BOOL)stillAnimating:(id)a3;
- (BOOL)tilesHidden;
- (BOOL)tilesTransientDisabled;
- (BOOL)tilesWaitingForInitialRender;
- (BOOL)tilingDisabled;
- (CGAffineTransform)_xAxisCoordinateTransform;
- (CGAffineTransform)_xAxisCoordinateTransformWithContentOffset:(SEL)a3 zoomScale:(CGPoint)a4 chartRect:(double)a5;
- (CGPoint)_contentOffsetForActualViewRange;
- (CGPoint)_touchPointForSeriesGroupIndex:(int64_t)a3 originalTouchPoint:(CGPoint)a4;
- (CGPoint)contentOffset;
- (CGRect)_adjustLeftMarginRectForBaselines:(CGRect)a3;
- (CGRect)_dataAreaRect;
- (CGRect)_overlayAreaRect;
- (CGRect)_scrollingAreaRect;
- (CGRect)_tileScreenRectForColumn:(int64_t)a3;
- (CGRect)_verticalAxisRect;
- (CGRect)_yAxisRectForSeriesGroupRow:(int64_t)a3 chartRect:(CGRect)a4;
- (CGRect)_yAxisRectForSeriesGroupRow:(int64_t)a3 insetForLegends:(BOOL)a4 chartRect:(CGRect)a5;
- (CGRect)leftMarginViewRect;
- (HKAxis)xAxis;
- (HKGraphView)initWithFrame:(CGRect)a3;
- (HKGraphViewDelegate)delegate;
- (HKGraphViewSelectionStyle)selectionStyle;
- (HKGraphViewTileThread)graphViewTileThread;
- (HKMultiTouchPressGestureRecognizer)multiTouchGestureRecognizer;
- (HKPropertyAnimationApplier)animationApplier;
- (HKValueRange)actualAxisRange;
- (HKValueRange)actualVisibleRange;
- (HKValueRange)chartableValueRange;
- (HKValueRange)destinationEffectiveVisibleRangeActive;
- (HKValueRange)effectiveAxisRange;
- (HKValueRange)effectiveVisibleRangeActive;
- (HKValueRange)effectiveVisibleRangeCadence;
- (NSArray)allSeries;
- (NSCalendar)currentCalendar;
- (NSMapTable)overlayInteractiveViews;
- (NSMutableArray)tileQueue;
- (NSMutableDictionary)currentAnimationProperties;
- (NSMutableDictionary)tilesByColumnNumber;
- (NSSet)yAxisAccessoryViews;
- (NSTimer)externalSelectionCancelTimer;
- (NSTimer)startupTimer;
- (UIColor)capturedTileBackgroundColor;
- (UIColor)outlineColor;
- (UIColor)topMarginColor;
- (UIEdgeInsets)_currentLegendInsets;
- (UIEdgeInsets)_dataAreaInsets;
- (UIEdgeInsets)_virtualMarginInsets;
- (UIEdgeInsets)axisInset;
- (UIView)detailView;
- (_HKGraphViewOverlayView)overlayView;
- (_HKLocationSpan)_locationSpanForSeriesGroupRow:(int64_t)a3 chartRect:(CGRect)a4;
- (double)_bottomBaselineYValueForChartRect:(CGRect)a3;
- (double)_contentWidth;
- (double)_detailViewWidth;
- (double)_inactiveRightAreaForRect:(CGRect)a3;
- (double)_maxTimeThreshold;
- (double)_maximumZoomScale;
- (double)_topBaselineYValueForChartRect:(CGRect)a3;
- (double)externalSelectionLastLocation;
- (double)firstNonemptyDrawTime;
- (double)hardLeftMarginWidth;
- (double)lastEndTime;
- (double)lastSingleSelectionXValue;
- (double)snapScreenCoordinateToXAxisResolution:(double)a3;
- (double)startTime;
- (double)tileWidthInPoints;
- (double)virtualLeftMarginWidth;
- (double)virtualRightMarginWidth;
- (double)xAxisSpace;
- (double)yAxisWidth;
- (double)zoomScale;
- (id)_actualVisibleRangeFromEffectiveVisibleRange:(id)a3 dataAreaRect:(CGRect)a4;
- (id)_autoscaleSeriesOnlyIfNeeded:(BOOL)a3;
- (id)_autoscaleTransformsFromAutoscaleSeriesList:(id)a3 specificRange:(id)a4;
- (id)_captureColor:(id)a3;
- (id)_closestGraphSeriesForTouchPoint:(CGPoint)a3 seriesGroup:(id)a4;
- (id)_closestSeriesToPoint:(CGPoint)a3 allSeries:(id)a4;
- (id)_combinedYAxisRangeForAutoscaleSeries:(id)a3 yAxisRect:(CGRect)a4;
- (id)_createRendererSeriesConfigurationWithInsetDataArea:(CGRect)a3 drawingToTile:(BOOL)a4;
- (id)_createRendererSeriesRowFromIndex:(int64_t)a3 insetDataArea:(CGRect)a4 drawingToTile:(BOOL)a5;
- (id)_createRendererWithCurrentStateWithChartRect:(CGRect)a3 contentOffset:(CGPoint)a4 drawingToTile:(BOOL)a5 tileColumn:(int64_t)a6 effectiveVisibleRangeCadence:(id)a7 effectiveVisibleRangeActive:(id)a8 actualVisibleRange:(id)a9;
- (id)_defaultXAxisValueRange;
- (id)_effectiveVisibleRangeFromActualVisibleRange:(id)a3;
- (id)_findActualAxisRangeFromVisibleRanges;
- (id)_findAutoscaleSeriesForYAxis:(id)a3 allAutoscaleSeries:(id)a4;
- (id)_graphSeriesForZoom:(int64_t)a3 seriesGroupRow:(int64_t)a4;
- (id)_gridlineRangesForChartRect:(CGRect)a3;
- (id)_insertAutoscaleAnimation:(id)a3;
- (id)_multiSeriesSelectionContextsWithTouchPoints:(id)a3 updateViewStates:(BOOL)a4;
- (id)_newPointSelectionContextsWithTouchPoints:(id)a3 updateViewStates:(BOOL)a4;
- (id)_nonOverlappingOverlaySeriesData:(id)a3;
- (id)_oneSeriesSelectionContextsWithTouchPoints:(id)a3 updateViewStates:(BOOL)a4;
- (id)_overlappingOverlaySeriesData:(id)a3;
- (id)_pointSelectionContextWithPathRange:(id *)a3 touchPoints:(id)a4 seriesGroupRow:(int64_t)a5 seriesInGroup:(id)a6;
- (id)_propertyAnimationForTransform:(id)a3;
- (id)_rangeFromRange:(id)a3 withStartOfRange:(id)a4;
- (id)_valueForXAxisLocation:(double)a3;
- (id)_visibleSeriesForSeriesGroup:(id)a3;
- (id)createTileRendererWithTileRect:(CGRect)a3 column:(int64_t)a4;
- (id)externalSelectionModelCoordinate;
- (id)findVisibleBlockCoordinatesForPrimarySeries;
- (id)primarySeries;
- (id)tileMarkDirtyCompletion;
- (int64_t)_currentSelectionStateForSeriesGroup:(id)a3;
- (int64_t)_ordinalForOverlayType:(int64_t)a3;
- (int64_t)_overlayEnvironmentType;
- (int64_t)_overlayTypeForOverlaySeriesData:(id)a3;
- (int64_t)_resolutionFromSeries:(id)a3;
- (int64_t)maximumDateZoom;
- (int64_t)minimumDateZoom;
- (int64_t)previousOverlayType;
- (int64_t)resolutionFromTraitCollectionAttributes;
- (int64_t)scrollingOptions;
- (int64_t)tileColumnHysteresis;
- (int64_t)tileColumns;
- (int64_t)tileFirstColumn;
- (int64_t)tileInitialRedrawCount;
- (int64_t)tileLastColumn;
- (int64_t)virtualLeftMarginStyle;
- (int64_t)virtualRightMarginStyle;
- (int64_t)xAxisDateZoom;
- (unint64_t)featheringOptions;
- (unint64_t)outlineOptions;
- (void)_actionsAfterAnimationTransform:(id)a3 finalVisibleRange:(id)a4;
- (void)_actionsBeforeAnimationTransform:(id)a3;
- (void)_activateStickySelection;
- (void)_addSelectionRecognizerToView:(id)a3;
- (void)_addTapGestureRecognizerForTapOnView:(id)a3;
- (void)_addTapGestureRecognizerForTogglingStickyToView:(id)a3;
- (void)_autoScaleXAxis;
- (void)_autoscaleAnimationCancelled;
- (void)_autoscaleAnimationEnd;
- (void)_autoscaleAnimationStart;
- (void)_cancelAndFinishSelection;
- (void)_cancelAutoscaleAnimations;
- (void)_cancelExternalSelection;
- (void)_clearRenderViewIfNecessary;
- (void)_createLegendForSeriesGroup:(id)a3;
- (void)_createLegendsIfNecessary;
- (void)_deactivateStickySelection;
- (void)_deselectAllSeriesWithAlpha:(double)a3 offScreenIndicatorAlpha:(double)a4 seriesGroup:(id)a5;
- (void)_drawOverlaysIfNeeded:(id)a3;
- (void)_enumerateSeriesSelectionRegionsForSeriesGroup:(id)a3 withBlock:(id)a4;
- (void)_finishSelection;
- (void)_finishSelectionForSeriesGroup:(id)a3;
- (void)_handleMarkDirtyCompletion;
- (void)_handleStartTouchPoint:(CGPoint)a3 seriesGroupRow:(int64_t)a4;
- (void)_handleTilesInitialRender;
- (void)_hideTiles;
- (void)_hideTilesWithForce;
- (void)_installExternalSelectionCancelTimer;
- (void)_installExternalSelectionEndTimer;
- (void)_invalidateExternalSelectionCancelTimer;
- (void)_layoutDetailView;
- (void)_layoutLegendsForChartRect:(CGRect)a3;
- (void)_layoutOverlayView;
- (void)_loadScrollView;
- (void)_loadSeriesForZoom:(int64_t)a3;
- (void)_markTilesDirtyWithCompletion:(id)a3;
- (void)_moveSeriesToFront:(id)a3;
- (void)_notifyDateZoomDidChangeFromValue:(int64_t)a3 toValue:(int64_t)a4;
- (void)_notifyDelegateOfFinishUserScrolling;
- (void)_notifyDelegateOfSizeChange;
- (void)_notifyDelegateOfTapOnYAxis;
- (void)_notifyDelegateOfVisibleValueRange:(id)a3 changeContext:(int64_t)a4;
- (void)_notifyDelegateOfYAxisWidth:(double)a3 toWidth:(double)a4;
- (void)_notifyDelegateSeriesUpdate:(id)a3 newDataArrived:(BOOL)a4;
- (void)_notifyDidBeginSelection;
- (void)_notifyDidEndExternalSelection;
- (void)_notifyDidEndSelection;
- (void)_notifyDidUpdateSelectionWithPointContext:(id)a3;
- (void)_notifyGraphViewRendered;
- (void)_overlayViewsForOverlayData:(id)a3 overlayView:(id)a4;
- (void)_performPostAxisUpdates:(int64_t)a3 newXAxisHeight:(double)a4;
- (void)_performPostLeftMarginUpdates;
- (void)_processExternalSelection;
- (void)_reconfigureScrollingTiles;
- (void)_recordLastRenderTime;
- (void)_reloadViewScope;
- (void)_removeAutoscaleAnimationWithName:(id)a3 cancelled:(BOOL)a4 completion:(id)a5;
- (void)_removeSelectionRecognizerFromView:(id)a3;
- (void)_renderYAxisLabelsInContext:(CGContext *)a3 chartRect:(CGRect)a4;
- (void)_resetSingleSelectionXValue;
- (void)_restoreDestinationActiveRange;
- (void)_scheduleExternalSelectionIfNeeded;
- (void)_scheduleExternalSelectionIfNeededClearingLastLocation;
- (void)_scheduleRequiredExternalSelection;
- (void)_scrollToCurrentVisibleRangeAnimated:(BOOL)a3;
- (void)_selectionRecognizerDidBegin:(id)a3;
- (void)_selectionRecognizerDidBeginWithTouchPoint:(CGPoint)a3;
- (void)_selectionRecognizerDidFinish:(id)a3;
- (void)_selectionRecognizerDidMove:(id)a3;
- (void)_selectionRecognizerDidMoveWithTouchPoints:(id)a3;
- (void)_selectionRecognizerDidUpdate:(id)a3;
- (void)_setNeedsUpdateGraphViewConfiguration;
- (void)_setVisibleRangesForEffectiveRangeCadence:(id)a3;
- (void)_shareYAxesForSeriesGroup:(id)a3;
- (void)_showTiles;
- (void)_shutdownTilingThread;
- (void)_snapXAxisRangeToPreservedRange;
- (void)_startupTimerCallback:(id)a3;
- (void)_tapOnViewAction:(id)a3;
- (void)_tileHiddenFlag:(BOOL)a3;
- (void)_toggleStickySelectionAction:(id)a3;
- (void)_touchAtPoint:(CGPoint)a3;
- (void)_touchTilesForContentOffset:(CGPoint)a3 applyHysteresis:(BOOL)a4;
- (void)_updateAllLegendsWithSelectedValues:(id)a3;
- (void)_updateAxisZoomScaleValueRange;
- (void)_updateDateZoomIfNecessary;
- (void)_updateEffectiveAxisRange:(id)a3 effectiveVisibleRangeCadence:(id)a4 effectiveVisibleRangeActive:(id)a5 virtualLeftMarginWidth:(double)a6 virtualRightMarginWidth:(double)a7;
- (void)_updateGraphViewConfiguration;
- (void)_updateGraphViewConfigurationIfNecessary;
- (void)_updateLegendForSeriesGroup:(id)a3;
- (void)_updateLegendsForAllSeriesGroups;
- (void)_updateRangesForEffectiveAxisRange:(id)a3 effectiveVisibleRangeCadence:(id)a4 effectiveVisibleRangeActive:(id)a5;
- (void)_updateScene;
- (void)_updateScrollViewPropertiesIgnoringScrollViewCallbacks:(id)a3;
- (void)_updateSelectionContextStateWithTouchPoint:(CGPoint)a3 seriesGroup:(id)a4;
- (void)_updateZoomForParameters;
- (void)_walkAllSeries:(id)a3;
- (void)autoscaleYAxesAnimated:(BOOL)a3 specificRange:(id)a4 onlyIfNeeded:(BOOL)a5 completion:(id)a6;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)enumerateVisibleCoordinatesForSeries:(id)a3 block:(id)a4;
- (void)gestureWillBeginWithRecognizer:(id)a3;
- (void)graphRenderer:(id)a3 shouldRenderSceneWithContext:(CGContext *)a4 chartRect:(CGRect)a5;
- (void)invalidateDataSourceCaches;
- (void)layoutSubviews;
- (void)nonemptyDrawComplete;
- (void)overlayNeedsRedisplay;
- (void)removeSeries;
- (void)resetAndRedraw;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)seriesDidInvalidatePaths:(id)a3 newDataArrived:(BOOL)a4;
- (void)setAnimationApplier:(id)a3;
- (void)setAnimationAutoscaleInProgress:(BOOL)a3;
- (void)setAxisInset:(UIEdgeInsets)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setCapturedTileBackgroundColor:(id)a3;
- (void)setChartableValueRange:(id)a3;
- (void)setContentOffset:(CGPoint)a3;
- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4;
- (void)setContentOffsetIsSet:(BOOL)a3;
- (void)setContentWidthFromTimeScope:(BOOL)a3;
- (void)setCurrentAnimationProperties:(id)a3;
- (void)setCurrentCalendar:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDestinationEffectiveVisibleRangeActive:(id)a3;
- (void)setDetailView:(id)a3;
- (void)setDisableScrolling:(BOOL)a3;
- (void)setDisableSelection:(BOOL)a3;
- (void)setDisableXAxis:(BOOL)a3;
- (void)setDrawsGridlinesPerSeriesGroup:(BOOL)a3;
- (void)setEffectiveAxisRange:(id)a3 effectiveVisibleRangeCadence:(id)a4 effectiveVisibleRangeActive:(id)a5;
- (void)setEffectiveVisibleRangeActive:(id)a3 animated:(BOOL)a4;
- (void)setEnableStickySelection:(BOOL)a3;
- (void)setEnableZoomInGesture:(BOOL)a3;
- (void)setExternalSelectionCancelTimer:(id)a3;
- (void)setExternalSelectionLastLocation:(double)a3;
- (void)setExternalSelectionModelCoordinate:(id)a3;
- (void)setExternalSelectionScheduled:(BOOL)a3;
- (void)setFeatheringOptions:(unint64_t)a3;
- (void)setFirstNonemptyDrawTime:(double)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHardLeftMarginWidth:(double)a3;
- (void)setIndependentAxes:(id)a3 stackOffset:(int64_t)a4;
- (void)setLastEndTime:(double)a3;
- (void)setLastSingleSelectionXValue:(double)a3;
- (void)setMaximumDateZoom:(int64_t)a3;
- (void)setMeasurementStartupAutoscale:(BOOL)a3;
- (void)setMeasuringStartupTime:(BOOL)a3;
- (void)setMinimumDateZoom:(int64_t)a3;
- (void)setMoveSelectedSeriesToFront:(BOOL)a3;
- (void)setMultiSeriesSelection:(BOOL)a3;
- (void)setNeedsReloadSeries;
- (void)setOutlineColor:(id)a3;
- (void)setOutlineOptions:(unint64_t)a3;
- (void)setOverlayInteractiveViews:(id)a3;
- (void)setOverlayView:(id)a3;
- (void)setPrefersOpaqueLegends:(BOOL)a3;
- (void)setPreviousDateZoom:(int64_t)a3;
- (void)setPreviousOverlayType:(int64_t)a3;
- (void)setRenderView:(id)a3;
- (void)setScrollingOptions:(int64_t)a3;
- (void)setSelectionStyle:(id)a3;
- (void)setStartTime:(double)a3;
- (void)setStartupTimer:(id)a3;
- (void)setTileColumnHysteresis:(int64_t)a3;
- (void)setTileColumns:(int64_t)a3;
- (void)setTileFirstColumn:(int64_t)a3;
- (void)setTileInitialRedrawCount:(int64_t)a3;
- (void)setTileLastColumn:(int64_t)a3;
- (void)setTileMarkDirtyCompletion:(id)a3;
- (void)setTileQueue:(id)a3;
- (void)setTileWidthInPoints:(double)a3;
- (void)setTilesByColumnNumber:(id)a3;
- (void)setTilesHidden:(BOOL)a3;
- (void)setTilesTransientDisabled:(BOOL)a3;
- (void)setTilesWaitingForInitialRender:(BOOL)a3;
- (void)setTilingDisabled:(BOOL)a3;
- (void)setTopMarginColor:(id)a3;
- (void)setVirtualLeftMargin:(double)a3;
- (void)setVirtualLeftMarginStyle:(int64_t)a3;
- (void)setVirtualLeftMarginWidth:(double)a3;
- (void)setVirtualRightMargin:(double)a3;
- (void)setVirtualRightMarginStyle:(int64_t)a3;
- (void)setVirtualRightMarginWidth:(double)a3;
- (void)setXAxis:(id)a3;
- (void)setXAxisSpace:(double)a3;
- (void)setYAxisAccessoryViews:(id)a3;
- (void)setZoomScale:(double)a3;
- (void)setZoomScale:(double)a3 animated:(BOOL)a4;
- (void)testScrollPerformanceWithTestName:(id)a3 iterations:(int)a4 delta:(int)a5 length:(int)a6;
- (void)testScrollPerformanceWithTestName:(id)a3 iterations:(int)a4 delta:(int)a5 options:(id)a6;
- (void)tileRenderDidFinish;
- (void)touchSelectionAtModelX:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation HKGraphView

- (HKGraphView)initWithFrame:(CGRect)a3
{
  v46.receiver = self;
  v46.super_class = (Class)HKGraphView;
  v3 = -[HKGraphView initWithFrame:](&v46, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    seriesGroupRows = v3->_seriesGroupRows;
    v3->_seriesGroupRows = v4;

    v6 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartBackgroundColor");
    [(HKGraphView *)v3 setBackgroundColor:v6];

    v7 = [HKGraphRenderView alloc];
    double v8 = *MEMORY[0x1E4F1DB28];
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v12 = -[HKGraphRenderView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], v9, v10, v11);
    renderView = v3->_renderView;
    v3->_renderView = (HKGraphRenderer *)v12;

    [(HKGraphRenderer *)v3->_renderView setUserInteractionEnabled:0];
    [(HKGraphRenderer *)v3->_renderView setRenderDelegate:v3];
    [(HKGraphView *)v3 addSubview:v3->_renderView];
    v14 = -[HKGraphRenderView initWithFrame:]([HKGraphRenderView alloc], "initWithFrame:", v8, v9, v10, v11);
    yAxisLabelContent = v3->_yAxisLabelContent;
    v3->_yAxisLabelContent = (HKGraphRenderer *)v14;

    v16 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartBackgroundColor");
    [(HKGraphRenderer *)v3->_yAxisLabelContent setBackgroundColor:v16];

    [(HKGraphRenderer *)v3->_yAxisLabelContent setUserInteractionEnabled:1];
    [(HKGraphRenderer *)v3->_yAxisLabelContent setRenderDelegate:v3];
    [(HKGraphView *)v3 addSubview:v3->_yAxisLabelContent];
    [(HKGraphView *)v3 _addTapGestureRecognizerForTapOnView:v3->_yAxisLabelContent];
    v3->_yAxisLabelMinimumWidth = 0.0;
    [(HKGraphView *)v3 _loadScrollView];
    v3->_disableSelection = 0;
    v17 = objc_alloc_init(HKGraphViewSelectionStyle);
    selectionStyle = v3->_selectionStyle;
    v3->_selectionStyle = v17;

    [(HKGraphViewSelectionStyle *)v3->_selectionStyle setUnselectedSeriesAlpha:0.3];
    v19 = v3->_selectionStyle;
    v20 = HKHealthKeyColor();
    v21 = +[HKStrokeStyle strokeStyleWithColor:v20 lineWidth:2.0];
    [(HKGraphViewSelectionStyle *)v19 setSelectedPointLineStrokeStyle:v21];

    v3->_moveSelectedSeriesToFront = 1;
    v3->_animationAutoscaleInProgress = 0;
    v22 = objc_alloc_init(HKPropertyAnimationApplier);
    animationApplier = v3->_animationApplier;
    v3->_animationApplier = v22;

    v24 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    currentAnimationProperties = v3->_currentAnimationProperties;
    v3->_currentAnimationProperties = v24;

    v3->_shouldInformDelegateOfUpdates = 1;
    uint64_t v26 = [(HKGraphView *)v3 _defaultXAxisValueRange];
    effectiveAxisRange = v3->_effectiveAxisRange;
    v3->_effectiveAxisRange = (HKValueRange *)v26;

    objc_storeStrong((id *)&v3->_actualAxisRange, v3->_effectiveAxisRange);
    objc_storeStrong((id *)&v3->_effectiveVisibleRangeCadence, v3->_actualAxisRange);
    objc_storeStrong((id *)&v3->_effectiveVisibleRangeActive, v3->_effectiveVisibleRangeCadence);
    objc_storeStrong((id *)&v3->_actualVisibleRange, v3->_effectiveVisibleRangeCadence);
    v3->_scrollingOptions = 0;
    uint64_t v28 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    currentCalendar = v3->_currentCalendar;
    v3->_currentCalendar = (NSCalendar *)v28;

    v3->_shouldListenToScrollViewDelegate = 0;
    v3->_enableStickySelection = 1;
    v3->_contentWidthFromTimeScope = 1;
    v3->_enableZoomInGesture = 0;
    v30 = -[HKBorderLineView initWithFrame:]([HKBorderLineView alloc], "initWithFrame:", v8, v9, v10, v11);
    leftMarginView = v3->_leftMarginView;
    v3->_leftMarginView = v30;

    [(HKBorderLineView *)v3->_leftMarginView setEdges:8];
    [(HKBorderLineView *)v3->_leftMarginView setBorderWidth:HKUIOnePixel()];
    [(HKBorderLineView *)v3->_leftMarginView setBorderLineColor:v3->_outlineColor];
    v32 = [(HKGraphView *)v3 backgroundColor];
    [(HKBorderLineView *)v3->_leftMarginView setBackgroundColor:v32];

    [(HKGraphView *)v3 addSubview:v3->_leftMarginView];
    [(HKGraphView *)v3 setHardLeftMarginWidth:0.0];
    v3->_subviewsHaveBeenLaidOut = 0;
    v3->_contentOffsetIsSet = 0;
    v3->_tilingDisabled = 0;
    v3->_tilesTransientDisabled = 0;
    v3->_tileInitialRedrawCount = 0;
    v3->_tilesWaitingForInitialRender = 1;
    id v33 = objc_alloc(MEMORY[0x1E4F1CB18]);
    v34 = (void *)[v33 initWithSuiteName:*MEMORY[0x1E4F2BD98]];
    int v35 = [v34 BOOLForKey:@"DisableTileThreading"];
    LODWORD(v20) = [MEMORY[0x1E4F2B860] isAppleInternalInstall];

    if (v20 && v35)
    {
      graphViewTileThread = v3->_graphViewTileThread;
      v3->_graphViewTileThread = 0;
    }
    else
    {
      v37 = [[HKGraphViewTileThread alloc] initWithGraphView:v3];
      v38 = v3->_graphViewTileThread;
      v3->_graphViewTileThread = v37;

      [(HKGraphViewTileThread *)v3->_graphViewTileThread setName:@"HKGraphViewTileThread"];
      [(HKGraphViewTileThread *)v3->_graphViewTileThread start];
    }
    v3->_prefersOpaqueLegends = 0;
    v3->_drawsGridlinesPerSeriesGroup = 0;
    v3->_lastSingleSelectionXValue = 2.22507386e-308;
    v39 = -[_HKGraphViewOverlayView initWithFrame:]([_HKGraphViewOverlayView alloc], "initWithFrame:", v8, v9, v10, v11);
    overlayView = v3->_overlayView;
    v3->_overlayView = v39;

    [(_HKGraphViewOverlayView *)v3->_overlayView setHidden:1];
    [(HKGraphView *)v3 addSubview:v3->_overlayView];
    [(HKGraphView *)v3 setPreviousOverlayType:0];
    v41 = (void *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:5 valueOptions:0 capacity:10];
    [(HKGraphView *)v3 setOverlayInteractiveViews:v41];

    v3->_measuringStartupTime = [(HKGraphView *)v3 _measureStartupFlagFromEnvironment];
    v3->_startTime = 0.0;
    v3->_lastEndTime = 0.0;
    startupTimer = v3->_startupTimer;
    v3->_startupTimer = 0;

    v3->_firstNonemptyDrawTime = 0.0;
    v3->_measurementStartupAutoscale = 0;
    id externalSelectionModelCoordinate = v3->_externalSelectionModelCoordinate;
    v3->_id externalSelectionModelCoordinate = 0;

    v3->_externalSelectionScheduled = 0;
    v3->_externalSelectionLastLocation = -1.79769313e308;
    v3->_xAxisDateZoom = 8;
    v44 = objc_msgSend(NSString, "hk_chartAccessibilityIdentifier:", @"BodyView");
    [(HKGraphView *)v3 setAccessibilityIdentifier:v44];
  }
  return v3;
}

- (void)dealloc
{
  if (self->_graphViewTileThread) {
    [(HKGraphView *)self _shutdownTilingThread];
  }
  v3.receiver = self;
  v3.super_class = (Class)HKGraphView;
  [(HKGraphView *)&v3 dealloc];
}

- (BOOL)_measureStartupFlagFromEnvironment
{
  v2 = [MEMORY[0x1E4F28F80] processInfo];
  objc_super v3 = [v2 environment];

  v4 = [v3 objectForKeyedSubscript:@"MEASURE_CHART_STARTUP_TIME"];
  v5 = v4;
  BOOL v6 = v4 && [v4 length];

  return v6;
}

- (void)traitCollectionDidChange:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)HKGraphView;
  id v4 = a3;
  [(HKGraphView *)&v10 traitCollectionDidChange:v4];
  uint64_t v5 = objc_msgSend(v4, "userInterfaceStyle", v10.receiver, v10.super_class);

  BOOL v6 = [(HKGraphView *)self traitCollection];
  uint64_t v7 = [v6 userInterfaceStyle];

  if (v5 != v7)
  {
    double v8 = [(HKGraphView *)self backgroundColor];
    double v9 = [(HKGraphView *)self _captureColor:v8];
    [(HKGraphView *)self setCapturedTileBackgroundColor:v9];

    [(HKGraphView *)self resetAndRedraw];
  }
}

- (void)resetAndRedraw
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  [(HKAxis *)self->_xAxis clearCache];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v18 = self;
  obuint64_t j = self->_seriesGroupRows;
  uint64_t v21 = [(NSMutableArray *)obj countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v21)
  {
    uint64_t v20 = *(void *)v33;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v33 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = v3;
        id v4 = *(void **)(*((void *)&v32 + 1) + 8 * v3);
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        objc_msgSend(v4, "zoomToSeriesMapping", v18);
        id v23 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v5 = [v23 countByEnumeratingWithState:&v28 objects:v37 count:16];
        if (v5)
        {
          uint64_t v6 = v5;
          uint64_t v7 = *(void *)v29;
          do
          {
            for (uint64_t i = 0; i != v6; ++i)
            {
              if (*(void *)v29 != v7) {
                objc_enumerationMutation(v23);
              }
              uint64_t v9 = *(void *)(*((void *)&v28 + 1) + 8 * i);
              long long v24 = 0u;
              long long v25 = 0u;
              long long v26 = 0u;
              long long v27 = 0u;
              objc_super v10 = [v4 zoomToSeriesMapping];
              double v11 = [v10 objectForKey:v9];

              uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v36 count:16];
              if (v12)
              {
                uint64_t v13 = v12;
                uint64_t v14 = *(void *)v25;
                do
                {
                  for (uint64_t j = 0; j != v13; ++j)
                  {
                    if (*(void *)v25 != v14) {
                      objc_enumerationMutation(v11);
                    }
                    v16 = *(void **)(*((void *)&v24 + 1) + 8 * j);
                    v17 = [v16 yAxis];
                    [v17 clearCache];

                    [v16 clearCaches];
                  }
                  uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v36 count:16];
                }
                while (v13);
              }
            }
            uint64_t v6 = [v23 countByEnumeratingWithState:&v28 objects:v37 count:16];
          }
          while (v6);
        }

        uint64_t v3 = v22 + 1;
      }
      while (v22 + 1 != v21);
      uint64_t v21 = [(NSMutableArray *)obj countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v21);
  }

  [(HKGraphView *)v18 _reconfigureScrollingTiles];
  [(HKGraphView *)v18 setNeedsReloadSeries];
  [(HKGraphRenderer *)v18->_yAxisLabelContent setNeedsRender];
}

- (BOOL)_axisRangeIsDateRange
{
  effectiveAxisRange = self->_effectiveAxisRange;
  if (effectiveAxisRange)
  {
    uint64_t v3 = [(HKValueRange *)effectiveAxisRange minValue];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

- (void)_walkAllSeries:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, uint64_t, char *))a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v5 = self->_seriesGroupRows;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_super v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        double v11 = [v10 currentSeries];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v19;
          while (2)
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v19 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v16 = *(void *)(*((void *)&v18 + 1) + 8 * j);
              char v17 = 0;
              v4[2](v4, v16, &v17);
              if (v17)
              {

                goto LABEL_18;
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
            if (v13) {
              continue;
            }
            break;
          }
        }
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v7);
  }
LABEL_18:
}

- (BOOL)_needsYAxisUpdateDuringRender
{
  BOOL v3 = [(UIScrollView *)self->_scrollView isDragging];
  BOOL v4 = [(HKGraphView *)self animationAutoscaleInProgress];
  return (v3 | [(UIScrollView *)self->_scrollView isScrollAnimating]) ^ 1 | v4;
}

- (BOOL)_configureYAxisViewIfNeeded
{
  [(HKGraphRenderer *)self->_yAxisLabelContent bounds];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  [(HKGraphView *)self zoomScale];
  uint64_t v19 = 0;
  long long v20 = (CGRect *)&v19;
  uint64_t v21 = 0x4010000000;
  long long v22 = &unk_1E0F50A5E;
  long long v11 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  long long v23 = *MEMORY[0x1E4F1DB20];
  long long v24 = v11;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __42__HKGraphView__configureYAxisViewIfNeeded__block_invoke;
  v18[3] = &unk_1E6D51C98;
  v18[5] = v4;
  v18[6] = v6;
  v18[7] = v8;
  v18[8] = v10;
  v18[9] = v12;
  v18[4] = &v19;
  [(HKGraphView *)self _walkAllSeries:v18];
  if (CGRectIsNull(v20[1])
    || CGRectGetWidth(v20[1]) <= self->_yAxisLabelMinimumWidth
    || [(HKGraphView *)self _drawingDuringScrolling])
  {
    BOOL v13 = 0;
  }
  else
  {
    double yAxisLabelMinimumWidth = self->_yAxisLabelMinimumWidth;
    double Width = CGRectGetWidth(v20[1]);
    [(HKBorderLineView *)self->_leftMarginView frame];
    CGFloat v17 = CGRectGetWidth(v25);
    if (Width >= v17) {
      CGFloat v17 = Width;
    }
    self->_double yAxisLabelMinimumWidth = v17;
    [(HKGraphView *)self setNeedsLayout];
    [(HKGraphView *)self _setNeedsUpdateGraphViewConfiguration];
    [(HKGraphView *)self _notifyDelegateOfYAxisWidth:yAxisLabelMinimumWidth toWidth:self->_yAxisLabelMinimumWidth];
    BOOL v13 = 1;
  }
  _Block_object_dispose(&v19, 8);
  return v13;
}

void __42__HKGraphView__configureYAxisViewIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  uint64_t v3 = [v13 yAxis];
  if (v3)
  {
    uint64_t v4 = [v13 visibleValueRange];
    objc_msgSend(v3, "labelRectWithModelRange:chartRect:zoomScale:", v4, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
  }
  else
  {
    CGFloat v6 = *MEMORY[0x1E4F1DB20];
    CGFloat v8 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    CGFloat v10 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    CGFloat v12 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  v15.origin.x = v6;
  v15.origin.y = v8;
  v15.size.width = v10;
  v15.size.height = v12;
  *(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = CGRectUnion(*(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8)+ 32), v15);
}

- (double)yAxisWidth
{
  return self->_yAxisLabelMinimumWidth;
}

- (CGRect)leftMarginViewRect
{
  [(HKGraphView *)self bounds];
  -[HKGraphView _adjustLeftMarginRectForBaselines:](self, "_adjustLeftMarginRectForBaselines:");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)_adjustLeftMarginRectForBaselines:(CGRect)a3
{
  double height = a3.size.height;
  CGFloat width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(HKGraphView *)self _dataAreaRect];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  -[HKGraphView _bottomBaselineYValueForChartRect:](self, "_bottomBaselineYValueForChartRect:");
  double v16 = v15;
  -[HKGraphView _topBaselineYValueForChartRect:](self, "_topBaselineYValueForChartRect:", v8, v10, v12, v14);
  if (v17 <= 0.00000011920929)
  {
    double v20 = x + 0.0;
    double v19 = v10 + 4.0;
    double v18 = 4.0 + 0.0;
  }
  else
  {
    double v18 = v17 - y;
    double v19 = y + v17 - y;
    double v20 = x;
  }
  double v21 = height - v18;
  if (v16 <= v17 || v16 <= 0.00000011920929) {
    double v23 = v21;
  }
  else {
    double v23 = v16 - v19;
  }
  if (y >= v19) {
    double v24 = y;
  }
  else {
    double v24 = v19;
  }
  double v25 = v20;
  double v26 = v24;
  CGFloat v27 = width;
  double MaxY = CGRectGetMaxY(*(CGRect *)(&v23 - 3));
  v35.origin.double x = x;
  v35.origin.double y = y;
  v35.size.CGFloat width = width;
  v35.size.double height = height;
  double v29 = CGRectGetMaxY(v35);
  if (MaxY < v29) {
    double v29 = MaxY;
  }
  double v30 = v29 - v24;
  double v31 = v20;
  double v32 = v24;
  double v33 = width;
  result.size.double height = v30;
  result.size.CGFloat width = v33;
  result.origin.double y = v32;
  result.origin.double x = v31;
  return result;
}

- (double)_detailViewWidth
{
  if (!self->_detailView) {
    return 0.0;
  }
  [(HKGraphView *)self frame];
  return v3 + -125.0 - self->_hardLeftMarginWidth + -16.0;
}

- (CGRect)_scrollingAreaRect
{
  [(HKGraphView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double yAxisLabelMinimumWidth = self->_yAxisLabelMinimumWidth;
  hardLeftMargindouble Width = self->_hardLeftMarginWidth;
  [(HKGraphView *)self _detailViewWidth];
  double v14 = hardLeftMarginWidth + v13;
  double v15 = v4 + hardLeftMarginWidth + v13;
  double v16 = v6 + 0.0;
  double v17 = v8 - (yAxisLabelMinimumWidth + v14);
  double v18 = v10;
  result.size.double height = v18;
  result.size.CGFloat width = v17;
  result.origin.double y = v16;
  result.origin.double x = v15;
  return result;
}

- (CGRect)_verticalAxisRect
{
  [(HKGraphView *)self bounds];
  double v4 = v3 - self->_yAxisLabelMinimumWidth;
  double v6 = v5 + v4;
  double v8 = v7 + 0.0;
  double v9 = v3 - (v4 + 0.0);
  double v11 = v10 - (self->_axisInset.bottom + 0.0);
  result.size.double height = v11;
  result.size.CGFloat width = v9;
  result.origin.double y = v8;
  result.origin.double x = v6;
  return result;
}

- (UIEdgeInsets)_dataAreaInsets
{
  double top = self->_axisInset.top;
  double left = self->_axisInset.left;
  double right = self->_axisInset.right;
  double v5 = self->_axisInset.bottom + self->_xAxisSpace;
  if (top < 0.00000011920929) {
    double top = 2.0;
  }
  if (v5 < 0.00000011920929) {
    double v5 = 2.0;
  }
  result.double right = right;
  result.bottom = v5;
  result.double left = left;
  result.double top = top;
  return result;
}

- (CGRect)_dataAreaRect
{
  [(HKGraphView *)self _scrollingAreaRect];
  double v4 = v3;
  double v6 = v5;
  [(HKGraphView *)self _dataAreaInsets];
  double v8 = v7 + 0.0;
  double v11 = v4 - (v9 + v10);
  double v13 = v6 - (v7 + v12);
  double v14 = v9 + 0.0;
  double v15 = v8;
  double v16 = v11;
  result.size.double height = v13;
  result.size.CGFloat width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (CGRect)_overlayAreaRect
{
  [(HKGraphView *)self _scrollingAreaRect];
  double v4 = v3 + 0.0;
  double v6 = v5 + -2.0;
  double v8 = v7 + 2.0;
  result.size.double height = v8;
  result.size.CGFloat width = v2;
  result.origin.double y = v6;
  result.origin.double x = v4;
  return result;
}

- (void)_updateScene
{
  renderView = self->_renderView;
  [(HKGraphView *)self _scrollingAreaRect];
  -[HKGraphRenderer setFrame:](renderView, "setFrame:");
  double v4 = self->_renderView;
  [(HKGraphView *)self _scrollingAreaRect];
  -[HKGraphRenderer convertRect:fromView:](v4, "convertRect:fromView:", self);
  -[HKGraphRenderer setAxisRect:](v4, "setAxisRect:");
  [(HKGraphRenderer *)self->_renderView setNeedsRender];
  [(HKGraphRenderer *)self->_yAxisLabelContent setNeedsRender];
  effectiveVisibleRangeActive = self->_effectiveVisibleRangeActive;
  [(HKGraphView *)self _notifyDelegateOfVisibleValueRange:effectiveVisibleRangeActive changeContext:2];
}

- (HKValueRange)chartableValueRange
{
  chartableValueRange = self->_chartableValueRange;
  if (chartableValueRange)
  {
    double v3 = chartableValueRange;
  }
  else
  {
    double v3 = [(HKGraphView *)self effectiveAxisRange];
  }
  return v3;
}

- (NSArray)allSeries
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v4 = self->_seriesGroupRows;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "currentSeries", (void)v11);
        [v3 addObjectsFromArray:v9];
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (BOOL)isScrollViewDecelerating
{
  return [(UIScrollView *)self->_scrollView isDecelerating];
}

- (void)_loadScrollView
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1BE0]);
  double v4 = (UIScrollView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(UIScrollView *)v4 setShowsHorizontalScrollIndicator:0];
  [(UIScrollView *)v4 setShowsVerticalScrollIndicator:0];
  [(UIScrollView *)v4 setDecelerationRate:*MEMORY[0x1E4FB2EE8]];
  [(UIScrollView *)v4 setDelegate:self];
  uint64_t v5 = [MEMORY[0x1E4FB1618] clearColor];
  [(UIScrollView *)v4 setBackgroundColor:v5];

  [(UIScrollView *)v4 setAutoresizingMask:18];
  [(UIScrollView *)v4 setBounces:1];
  [(UIScrollView *)v4 setBouncesZoom:0];
  [(HKGraphView *)self addSubview:v4];
  scrollView = self->_scrollView;
  self->_scrollView = v4;
  uint64_t v7 = v4;

  if (self->_disableSelection) {
    [(HKGraphView *)self _removeSelectionRecognizerFromView:v7];
  }
  else {
    [(HKGraphView *)self _addSelectionRecognizerToView:v7];
  }
  [(HKGraphView *)self _addTapGestureRecognizerForTogglingStickyToView:v7];
}

- (void)layoutSubviews
{
  [(HKGraphView *)self leftMarginViewRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(HKGraphView *)self _verticalAxisRect];
  double v33 = v12;
  double v34 = v11;
  double v31 = v14;
  double v32 = v13;
  [(HKGraphView *)self _scrollingAreaRect];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  [(HKGraphView *)self _dataAreaRect];
  double v29 = v24;
  double v30 = v23;
  double v27 = v26;
  double v28 = v25;
  -[HKBorderLineView setFrame:](self->_leftMarginView, "setFrame:", v4, v6, v8, v10);
  -[HKGraphRenderer setFrame:](self->_renderView, "setFrame:", v16, v18, v20, v22);
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __29__HKGraphView_layoutSubviews__block_invoke;
  v35[3] = &unk_1E6D51CC0;
  v35[4] = self;
  *(double *)&v35[5] = v16;
  *(double *)&v35[6] = v18;
  *(double *)&v35[7] = v20;
  *(double *)&v35[8] = v22;
  [(HKGraphView *)self _updateScrollViewPropertiesIgnoringScrollViewCallbacks:v35];
  -[HKGraphRenderer setFrame:](self->_yAxisLabelContent, "setFrame:", v34, v33, v32, v31);
  -[HKGraphView _layoutLegendsForChartRect:](self, "_layoutLegendsForChartRect:", v30, v29, v28, v27);
  [(HKGraphView *)self _layoutOverlayView];
  if (!self->_subviewsHaveBeenLaidOut)
  {
    [(HKGraphView *)self _hideTilesWithForce];
    self->_subviewsHaveBeenLaidOut = 1;
  }
}

uint64_t __29__HKGraphView_layoutSubviews__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 472), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)willMoveToWindow:(id)a3
{
  [(HKGraphView *)self setStartTime:CACurrentMediaTime()];
  BOOL v5 = [(HKGraphView *)self measuringStartupTime];
  if (a3)
  {
    if (v5)
    {
      double v6 = [(HKGraphView *)self startupTimer];

      if (!v6)
      {
        [(HKGraphView *)self startTime];
        -[HKGraphView setLastEndTime:](self, "setLastEndTime:");
        double v7 = (NSObject **)MEMORY[0x1E4F29FB0];
        os_signpost_id_t v8 = _HKLogSignpostIDGenerate();
        _HKInitializeLogging();
        double v9 = *v7;
        if (os_signpost_enabled(v9))
        {
          double v10 = v9;
          double v11 = v10;
          if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)double v13 = 0;
            _os_signpost_emit_with_name_impl(&dword_1E0B26000, v11, OS_SIGNPOST_EVENT, v8, "chart-ppt-start", "", v13, 2u);
          }
        }
        double v12 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__startupTimerCallback_ selector:0 userInfo:1 repeats:0.1];
        [(HKGraphView *)self setStartupTimer:v12];
      }
    }
  }
}

- (void)_startupTimerCallback:(id)a3
{
  double v4 = CACurrentMediaTime();
  [(HKGraphView *)self lastEndTime];
  if (v4 - v5 >= 3.0)
  {
    [(HKGraphView *)self firstNonemptyDrawTime];
    if (v6 <= 0.0) {
      [(HKGraphView *)self lastEndTime];
    }
    else {
      [(HKGraphView *)self firstNonemptyDrawTime];
    }
    double v8 = v7;
    [(HKGraphView *)self startTime];
    double v10 = v9;
    uint64_t v11 = [(HKGraphView *)self delegate];
    if (v11)
    {
      double v12 = (void *)v11;
      double v13 = [(HKGraphView *)self delegate];
      char v14 = objc_opt_respondsToSelector();

      if (v14)
      {
        double v15 = [(HKGraphView *)self delegate];
        [v15 graphView:self startupTime:vcvtmd_s64_f64((v8 - v10) * 1000000.0)];
      }
    }
    [(HKGraphView *)self setMeasuringStartupTime:0];
    [(HKGraphView *)self setStartTime:0.0];
    [(HKGraphView *)self setLastEndTime:0.0];
    double v16 = [(HKGraphView *)self startupTimer];
    [v16 invalidate];

    [(HKGraphView *)self setStartupTimer:0];
  }
}

- (void)_recordLastRenderTime
{
  if (![(HKGraphView *)self measurementStartupAutoscale])
  {
    [(HKGraphView *)self setMeasurementStartupAutoscale:[(HKGraphView *)self animationAutoscaleInProgress]];
    [(HKGraphView *)self setLastEndTime:CACurrentMediaTime()];
    double v3 = (NSObject **)MEMORY[0x1E4F29FB0];
    os_signpost_id_t v4 = _HKLogSignpostIDGenerate();
    _HKInitializeLogging();
    double v5 = *v3;
    if (os_signpost_enabled(v5))
    {
      double v6 = v5;
      double v7 = v6;
      if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
      {
        *(_WORD *)double v8 = 0;
        _os_signpost_emit_with_name_impl(&dword_1E0B26000, v7, OS_SIGNPOST_EVENT, v4, "chart-ppt-render", "", v8, 2u);
      }
    }
  }
}

- (BOOL)_graphViewIsConfigured
{
  double v3 = [(HKGraphView *)self xAxis];
  if (v3)
  {
    os_signpost_id_t v4 = [(HKGraphView *)self xAxis];
    BOOL v5 = ([v4 requiresScaling] & 1) == 0 && self->_subviewsHaveBeenLaidOut;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)_createLegendsIfNecessary
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  double v3 = self->_seriesGroupRows;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        double v9 = objc_msgSend(v8, "legendView", (void)v10);
        if (v9)
        {
        }
        else if ([(HKGraphView *)self _seriesGroupHasLegendEntries:v8])
        {
          [(HKGraphView *)self _createLegendForSeriesGroup:v8];
        }
      }
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (BOOL)_seriesGroupHasLegendEntries:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  double v3 = objc_msgSend(a3, "currentSeries", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        double v9 = [v8 titleLegendEntries];
        if ([v9 count])
        {

LABEL_13:
          BOOL v11 = 1;
          goto LABEL_14;
        }
        long long v10 = [v8 detailLegendEntries];

        if (v10) {
          goto LABEL_13;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      BOOL v11 = 0;
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v11 = 0;
  }
LABEL_14:

  return v11;
}

- (void)_updateLegendForSeriesGroup:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 legendView];

  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    double v32 = v4;
    double v8 = [v4 currentSeries];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v34 != v11) {
            objc_enumerationMutation(v8);
          }
          long long v13 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          int64_t v14 = [(HKGraphView *)self xAxisDateZoom];
          long long v15 = [(HKGraphView *)self effectiveVisibleRangeActive];
          objc_msgSend(v13, "updateLegendsForTimeScope:range:drawingDuringScrolling:", v14, v15, -[HKGraphView _drawingDuringScrolling](self, "_drawingDuringScrolling"));

          long long v16 = [v13 titleLegendEntries];
          uint64_t v17 = [v16 count];

          if (v17)
          {
            uint64_t v18 = [v13 titleLegendEntries];
            [v6 addObjectsFromArray:v18];
          }
          double v19 = [v13 detailLegendEntries];
          uint64_t v20 = [v19 count];

          if (v20)
          {
            double v21 = [v13 detailLegendEntries];
            [v7 addObjectsFromArray:v21];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v10);
    }

    id v4 = v32;
    if ([v6 count] || objc_msgSend(v7, "count"))
    {
      double v22 = [v32 legendView];
      [v22 setLeftEntries:v6 rightEntries:v7];

      [(HKGraphView *)self _currentLegendInsets];
      double v24 = v23;
      double v26 = v25;
      double v28 = v27;
      double v30 = v29;
      double v31 = [v32 legendView];
      objc_msgSend(v31, "setEdgeInsets:", v24, v26, v28, v30);
    }
  }
}

- (void)_updateLegendsForAllSeriesGroups
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  double v3 = self->_seriesGroupRows;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        -[HKGraphView _updateLegendForSeriesGroup:](self, "_updateLegendForSeriesGroup:", *(void *)(*((void *)&v8 + 1) + 8 * v7++), (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (UIEdgeInsets)_currentLegendInsets
{
  [(HKGraphView *)self _dataAreaRect];
  -[HKGraphView _inactiveRightAreaForRect:](self, "_inactiveRightAreaForRect:");
  double v4 = v3;
  uint64_t v5 = [(HKGraphView *)self detailView];
  virtualLeftMargindouble Width = 16.0;
  if (!v5) {
    virtualLeftMargindouble Width = self->_virtualLeftMarginWidth;
  }

  double v7 = v4 + self->_virtualRightMarginWidth;
  BOOL prefersOpaqueLegends = self->_prefersOpaqueLegends;
  +[HKLegendView modifiedInsetsForOpaqueLegend:originalInsets:](HKLegendView, "modifiedInsetsForOpaqueLegend:originalInsets:", prefersOpaqueLegends, 0.0, virtualLeftMarginWidth, 0.0, v7);
  result.double right = v12;
  result.bottom = v11;
  result.double left = v10;
  result.double top = v9;
  return result;
}

- (void)_createLegendForSeriesGroup:(id)a3
{
  id v4 = a3;
  [(HKGraphView *)self _currentLegendInsets];
  double v11 = -[HKLegendView initWithEdgeInsets:opaqueBackground:]([HKLegendView alloc], "initWithEdgeInsets:opaqueBackground:", self->_prefersOpaqueLegends, v5, v6, v7, v8);
  double v9 = [(HKGraphView *)self delegate];
  double v10 = [v9 seriesSelectionLineColorForGraphView:self];
  [(HKLegendView *)v11 setLollipopColor:v10];

  [v4 setLegendView:v11];
  objc_msgSend(v4, "setLastLegendSize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  [(HKGraphView *)self addSubview:v11];
  [(HKGraphView *)self insertSubview:self->_renderView belowSubview:v11];
  [(HKGraphView *)self bringSubviewToFront:self->_scrollView];
  [(HKGraphView *)self _updateLegendForSeriesGroup:v4];
}

- (void)_layoutLegendsForChartRect:(CGRect)a3
{
  double v5 = *MEMORY[0x1E4F1DB20];
  double v4 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v7 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  if ([(NSMutableArray *)self->_seriesGroupRows count])
  {
    unint64_t v8 = 0;
    double v37 = *(double *)(MEMORY[0x1E4FB2C68] + 8);
    double v38 = *MEMORY[0x1E4FB2C68];
    do
    {
      -[HKGraphView _locationSpanForSeriesGroupRow:chartRect:](self, "_locationSpanForSeriesGroupRow:chartRect:", v8, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, *(void *)&v37, *(void *)&v38);
      double v10 = v9;
      double v11 = [(NSMutableArray *)self->_seriesGroupRows objectAtIndexedSubscript:v8];
      v44.origin.double x = v5;
      v44.origin.double y = v4;
      v44.size.CGFloat width = v7;
      v44.size.double height = v6;
      BOOL IsNull = CGRectIsNull(v44);
      if (v10 < v4 || IsNull)
      {
        double v4 = v10;
        double v5 = 0.0;
      }
      int64_t v14 = [v11 legendView];

      if (v14)
      {
        double v40 = v6;
        double v41 = v7;
        long long v15 = [v11 legendView];
        objc_msgSend(v15, "systemLayoutSizeFittingSize:", v38, v37);
        double v17 = v16;

        [(HKGraphView *)self bounds];
        double v19 = v18;
        double v20 = 0.0;
        if ([(HKGraphView *)self _anySeriesWantsInternalLegends:v8])
        {
          double v21 = [(HKGraphView *)self _visibleSeriesForSeriesGroup:v11];
          double v22 = [v21 yAxis];
          double v23 = v22;
          if (v22)
          {
            [v22 offsetForLegendView];
            double v20 = v24;
          }
        }
        double v25 = [v11 legendView];
        +[HKLegendView horizontalOffsetWithOpaque:](HKLegendView, "horizontalOffsetWithOpaque:", [v25 opaqueBackground]);
        double v27 = v26;

        hardLeftMargindouble Width = self->_hardLeftMarginWidth;
        double v29 = v27 + hardLeftMarginWidth;
        double v30 = v10 + v20;
        double v31 = v19 - hardLeftMarginWidth - self->_yAxisLabelMinimumWidth - v27;
        BOOL v32 = HKUIEqualCGFloats(v4, v10);
        double v33 = v40;
        double v7 = v41;
        if (v32)
        {
          double v33 = v17;
          double v7 = v31;
          double v4 = v30;
          double v5 = v29;
        }
        long long v34 = [v11 legendView];
        objc_msgSend(v34, "setFrame:", v29, v30, v31, v17);

        double v35 = v31;
        double v6 = v33;
        objc_msgSend(v11, "setLastLegendSize:", v35, v17);
        long long v36 = [v11 legendView];
        [(HKGraphView *)self bringSubviewToFront:v36];
      }
      ++v8;
    }
    while (v8 < [(NSMutableArray *)self->_seriesGroupRows count]);
  }
  v45.origin.double x = v5;
  v45.origin.double y = v4;
  v45.size.CGFloat width = v7;
  v45.size.double height = v6;
  if (!CGRectIsNull(v45))
  {
    id v42 = [(HKGraphView *)self delegate];
    objc_msgSend(v42, "graphView:didUpdateLegendViewsWithTopLegendFrame:", self, v5, v4, v7, v6);
  }
}

- (void)_layoutDetailView
{
  double v3 = [(UIView *)self->_detailView topAnchor];
  double v4 = [(HKGraphView *)self topAnchor];
  double v5 = [v3 constraintEqualToAnchor:v4 constant:40.0];
  [v5 setActive:1];

  double v6 = [(UIView *)self->_detailView leftAnchor];
  double v7 = [(HKGraphView *)self leftAnchor];
  unint64_t v8 = [v6 constraintEqualToAnchor:v7 constant:self->_hardLeftMarginWidth + 16.0];
  [v8 setActive:1];

  double v9 = [(UIView *)self->_detailView bottomAnchor];
  double v10 = [(HKGraphView *)self bottomAnchor];
  double v11 = [v9 constraintEqualToAnchor:v10 constant:-30.0];
  [v11 setActive:1];

  id v14 = [(HKGraphRenderer *)self->_renderView leftAnchor];
  double v12 = [(UIView *)self->_detailView rightAnchor];
  uint64_t v13 = [v14 constraintEqualToAnchor:v12 constant:16.0];
  [v13 setActive:1];
}

- (id)_graphSeriesForZoom:(int64_t)a3 seriesGroupRow:(int64_t)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  double v7 = [(NSMutableArray *)self->_seriesGroupRows objectAtIndexedSubscript:a4];
  unint64_t v8 = [v7 zoomToSeriesMapping];
  double v9 = [NSNumber numberWithInteger:a3];
  id v10 = [v8 objectForKeyedSubscript:v9];

  if (!v10)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    double v12 = [WeakRetained graphView:self graphSeriesForZoom:a3 stackOffset:a4];
    uint64_t v13 = (void *)[v12 mutableCopy];

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v10 = v13;
    uint64_t v14 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v24 != v16) {
            objc_enumerationMutation(v10);
          }
          double v18 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          objc_msgSend(v18, "setDelegate:", self, (void)v23);
          double v19 = [v18 yAxis];
          [v19 clearCache];
        }
        uint64_t v15 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v15);
    }

    if (v10)
    {
      double v20 = [v7 zoomToSeriesMapping];
      double v21 = [NSNumber numberWithInteger:a3];
      [v20 setObject:v10 forKeyedSubscript:v21];
    }
  }

  return v10;
}

- (void)_shareYAxesForSeriesGroup:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  double v6 = [v5 currentSeries];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    unint64_t v8 = [v5 currentSeries];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v32;
LABEL_4:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v32 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v31 + 1) + 8 * v12);
        uint64_t v14 = [v13 yAxis];

        if (v14) {
          break;
        }
        if (v10 == ++v12)
        {
          uint64_t v10 = [v8 countByEnumeratingWithState:&v31 objects:v36 count:16];
          if (v10) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      uint64_t v16 = [v13 yAxis];

      if (!v16) {
        goto LABEL_11;
      }
    }
    else
    {
LABEL_10:

LABEL_11:
      uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:a2 object:self file:@"HKGraphView.m" lineNumber:894 description:@"At least one series in the series group must have a valid Y Axis"];

      uint64_t v16 = 0;
    }
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    obuint64_t j = [v5 currentSeries];
    uint64_t v17 = [obj countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v28 != v19) {
            objc_enumerationMutation(obj);
          }
          double v21 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          double v22 = [v21 yAxis];
          long long v23 = [v5 independentAxes];
          if (v23)
          {
            long long v24 = [v5 independentAxes];
            char v25 = [v24 containsObject:v22];
          }
          else
          {
            char v25 = 0;
          }

          if ((v25 & 1) == 0 && v22 != v16) {
            [v21 setYAxis:v16];
          }
        }
        uint64_t v18 = [obj countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v18);
    }
  }
}

- (void)_loadSeriesForZoom:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v6 = [WeakRetained stackCountForGraphView:self];

  if (v6 != [(NSMutableArray *)self->_seriesGroupRows count])
  {
    [(HKGraphView *)self removeSeries];
    if (v6 >= 1)
    {
      do
      {
        uint64_t v7 = objc_alloc_init(_HKGraphViewSeriesGroup);
        [(NSMutableArray *)self->_seriesGroupRows addObject:v7];

        --v6;
      }
      while (v6);
    }
  }
  if ([(NSMutableArray *)self->_seriesGroupRows count])
  {
    unint64_t v8 = 0;
    do
    {
      uint64_t v9 = [(NSMutableArray *)self->_seriesGroupRows objectAtIndexedSubscript:v8];
      uint64_t v10 = [(HKGraphView *)self _graphSeriesForZoom:a3 seriesGroupRow:v8];
      [v9 setCurrentSeries:v10];

      [(HKGraphView *)self _shareYAxesForSeriesGroup:v9];
      ++v8;
    }
    while (v8 < [(NSMutableArray *)self->_seriesGroupRows count]);
  }
}

- (void)setNeedsReloadSeries
{
  [(HKGraphView *)self removeSeries];
  [(HKGraphView *)self _reloadViewScope];
  [(HKGraphView *)self _markTilesDirtyWithCompletion:0];
}

- (void)removeSeries
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v3 = self->_seriesGroupRows;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        unint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v9 = objc_msgSend(v8, "axisAnnotationHandler", (void)v11);
        [v9 _forceClearAxisAnnotations];

        uint64_t v10 = [v8 legendView];
        [v10 removeFromSuperview];

        [v8 setLegendView:0];
      }
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  [(HKGraphView *)self _finishSelection];
  [(NSMutableArray *)self->_seriesGroupRows removeAllObjects];
}

- (void)invalidateDataSourceCaches
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  double v2 = self->_seriesGroupRows;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v19;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v18 + 1) + 8 * v6);
        long long v14 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        unint64_t v8 = objc_msgSend(v7, "currentSeries", 0);
        uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v15;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v15 != v11) {
                objc_enumerationMutation(v8);
              }
              long long v13 = [*(id *)(*((void *)&v14 + 1) + 8 * v12) dataSource];
              [v13 invalidateCache];

              ++v12;
            }
            while (v10 != v12);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
          }
          while (v10);
        }

        ++v6;
      }
      while (v6 != v4);
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v4);
  }
}

- (void)_clearRenderViewIfNecessary
{
  renderView = self->_renderView;
  if (renderView)
  {
    [(HKGraphRenderer *)renderView setRenderDelegate:0];
    [(HKGraphRenderer *)self->_renderView removeFromSuperview];
    uint64_t v4 = self->_renderView;
    self->_renderView = 0;
  }
}

- (void)setRenderView:(id)a3
{
  uint64_t v4 = (HKGraphRenderer *)a3;
  [(HKGraphView *)self _clearRenderViewIfNecessary];
  [(HKGraphView *)self _scrollingAreaRect];
  -[HKGraphRenderer setFrame:](self->_renderView, "setFrame:");
  renderView = self->_renderView;
  self->_renderView = v4;
  uint64_t v7 = v4;

  [(HKGraphView *)self insertSubview:self->_renderView belowSubview:self->_scrollView];
  [(HKGraphRenderer *)self->_renderView setRenderDelegate:self];
  uint64_t v6 = self->_renderView;
  [(HKGraphView *)self _scrollingAreaRect];
  -[HKGraphRenderer convertRect:fromView:](v6, "convertRect:fromView:", self);
  -[HKGraphRenderer setAxisRect:](self->_renderView, "setAxisRect:");
  [(HKGraphRenderer *)self->_renderView setNeedsRender];
}

- (void)setBackgroundColor:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKGraphView;
  id v4 = a3;
  [(HKGraphView *)&v5 setBackgroundColor:v4];
  -[HKGraphRenderer setBackgroundColor:](self->_renderView, "setBackgroundColor:", v4, v5.receiver, v5.super_class);
}

- (void)setXAxis:(id)a3
{
  p_xAxis = &self->_xAxis;
  objc_storeStrong((id *)&self->_xAxis, a3);
  id v8 = a3;
  uint64_t v6 = *p_xAxis;
  uint64_t v7 = [(HKGraphView *)self chartableValueRange];
  [(HKAxis *)v6 setAxisChartableValueRange:v7];

  [(HKGraphView *)self _updateAxisZoomScaleValueRange];
  [(HKGraphRenderer *)self->_renderView setNeedsRender];
}

- (void)setChartableValueRange:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_chartableValueRange] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_chartableValueRange, a3);
    [(HKAxis *)self->_xAxis setAxisChartableValueRange:v5];
    [(HKGraphRenderer *)self->_renderView setNeedsRender];
  }
}

- (void)setHardLeftMarginWidth:(double)a3
{
  if (self->_hardLeftMarginWidth != a3)
  {
    self->_hardLeftMargindouble Width = a3;
    [(HKBorderLineView *)self->_leftMarginView setHidden:a3 <= 0.0];
    [(HKGraphView *)self setNeedsLayout];
    [(HKGraphView *)self _setNeedsUpdateGraphViewConfiguration];
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(HKGraphView *)self frame];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  self->_shouldListenToScrollViewDelegate = 0;
  v16.receiver = self;
  v16.super_class = (Class)HKGraphView;
  -[HKGraphView setFrame:](&v16, sel_setFrame_, x, y, width, height);
  self->_shouldListenToScrollViewDelegate = 1;
  v17.origin.double x = x;
  v17.origin.double y = y;
  v17.size.double width = width;
  v17.size.double height = height;
  v18.origin.double x = v9;
  v18.origin.double y = v11;
  v18.size.double width = v13;
  v18.size.double height = v15;
  if (!CGRectEqualToRect(v17, v18))
  {
    if (![(HKGraphView *)self externalSelectionScheduled]) {
      [(HKGraphView *)self _cancelAndFinishSelection];
    }
    [(HKGraphView *)self _notifyDelegateOfSizeChange];
    [(HKGraphView *)self _setNeedsUpdateGraphViewConfiguration];
  }
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(HKGraphView *)self bounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  self->_shouldListenToScrollViewDelegate = 0;
  v16.receiver = self;
  v16.super_class = (Class)HKGraphView;
  -[HKGraphView setBounds:](&v16, sel_setBounds_, x, y, width, height);
  self->_shouldListenToScrollViewDelegate = 1;
  v17.origin.double x = x;
  v17.origin.double y = y;
  v17.size.double width = width;
  v17.size.double height = height;
  v18.origin.double x = v9;
  v18.origin.double y = v11;
  v18.size.double width = v13;
  v18.size.double height = v15;
  if (!CGRectEqualToRect(v17, v18))
  {
    if (![(HKGraphView *)self externalSelectionScheduled]) {
      [(HKGraphView *)self _cancelAndFinishSelection];
    }
    [(HKGraphView *)self _notifyDelegateOfSizeChange];
    [(HKGraphView *)self _setNeedsUpdateGraphViewConfiguration];
  }
}

- (void)setAxisInset:(UIEdgeInsets)a3
{
  double top = self->_axisInset.top;
  double left = self->_axisInset.left;
  double bottom = self->_axisInset.bottom;
  double right = self->_axisInset.right;
  self->_axisInset = a3;
  if (a3.left != left || a3.top != top || a3.right != right || a3.bottom != bottom) {
    [(HKGraphView *)self _setNeedsUpdateGraphViewConfiguration];
  }
}

- (void)setOutlineColor:(id)a3
{
  p_outlineColor = &self->_outlineColor;
  objc_storeStrong((id *)&self->_outlineColor, a3);
  id v6 = a3;
  [(HKBorderLineView *)self->_leftMarginView setBorderLineColor:*p_outlineColor];

  [(HKGraphView *)self setNeedsDisplay];
}

- (void)_setVisibleRangesForEffectiveRangeCadence:(id)a3
{
  long long v19 = (HKValueRange *)a3;
  [(HKGraphView *)self _dataAreaRect];
  xAxis = self->_xAxis;
  id v6 = v19;
  if (xAxis)
  {
    id v6 = v19;
    if (v4 > 0.0)
    {
      -[HKAxis adjustedRangeForFittedRange:chartRange:](xAxis, "adjustedRangeForFittedRange:chartRange:", v19, 0.0, v4);
      id v6 = (HKValueRange *)objc_claimAutoreleasedReturnValue();
    }
  }
  if (self->_actualAxisRange)
  {
    uint64_t v7 = [(HKValueRange *)v6 minValue];
    double v8 = [(HKValueRange *)v6 maxValue];
    CGFloat v9 = [(HKValueRange *)self->_effectiveAxisRange minValue];
    double v10 = [(HKValueRange *)self->_effectiveAxisRange maxValue];
    if (HKUIObjectIsSmaller(v7, (uint64_t)v9))
    {
      id v11 = v9;

      uint64_t v7 = v11;
    }
    if (HKUIObjectIsSmaller(v10, (uint64_t)v8))
    {
      id v12 = v10;

      double v8 = v12;
    }
    uint64_t v13 = +[HKValueRange valueRangeWithMinValue:v7 maxValue:v8];

    id v6 = (HKValueRange *)v13;
  }
  effectiveVisibleRangeCadence = self->_effectiveVisibleRangeCadence;
  self->_effectiveVisibleRangeCadence = v6;
  CGFloat v15 = v6;

  objc_super v16 = self->_effectiveVisibleRangeCadence;
  [(HKGraphView *)self _dataAreaRect];
  -[HKGraphView _actualVisibleRangeFromEffectiveVisibleRange:dataAreaRect:](self, "_actualVisibleRangeFromEffectiveVisibleRange:dataAreaRect:", v16);
  CGRect v17 = (HKValueRange *)objc_claimAutoreleasedReturnValue();
  actualVisibleRange = self->_actualVisibleRange;
  self->_actualVisibleRange = v17;
}

- (void)_updateRangesForEffectiveAxisRange:(id)a3 effectiveVisibleRangeCadence:(id)a4 effectiveVisibleRangeActive:(id)a5
{
  double v8 = (HKValueRange *)a3;
  CGFloat v9 = (HKValueRange *)a5;
  effectiveAxisRange = self->_effectiveAxisRange;
  self->_effectiveAxisRange = v8;
  objc_super v16 = v8;
  id v11 = a4;

  [(HKGraphView *)self _setVisibleRangesForEffectiveRangeCadence:v11];
  effectiveVisibleRangeActive = self->_effectiveVisibleRangeActive;
  self->_effectiveVisibleRangeActive = v9;
  uint64_t v13 = v9;

  double v14 = [(HKGraphView *)self _findActualAxisRangeFromVisibleRanges];
  actualAxisRange = self->_actualAxisRange;
  self->_actualAxisRange = v14;
}

- (void)_updateGraphViewConfiguration
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44__HKGraphView__updateGraphViewConfiguration__block_invoke;
  v3[3] = &unk_1E6D50ED8;
  v3[4] = self;
  [(HKGraphView *)self _updateScrollViewPropertiesIgnoringScrollViewCallbacks:v3];
  [(HKGraphView *)self _reloadViewScope];
}

uint64_t __44__HKGraphView__updateGraphViewConfiguration__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateRangesForEffectiveAxisRange:*(void *)(*(void *)(a1 + 32) + 600) effectiveVisibleRangeCadence:*(void *)(*(void *)(a1 + 32) + 664) effectiveVisibleRangeActive:*(void *)(*(void *)(a1 + 32) + 672)];
  [*(id *)(a1 + 32) _updateZoomForParameters];
  [*(id *)(a1 + 32) _autoScaleXAxis];
  [*(id *)(a1 + 32) _reconfigureScrollingTiles];
  [*(id *)(a1 + 32) _scrollToCurrentVisibleRangeAnimated:0];
  double v2 = *(void **)(a1 + 32);
  return [v2 _updateScene];
}

- (void)setVirtualLeftMargin:(double)a3
{
}

- (void)setVirtualRightMargin:(double)a3
{
}

- (void)setVirtualLeftMarginStyle:(int64_t)a3
{
  if (self->_virtualLeftMarginStyle != a3)
  {
    self->_virtualLeftMarginStyle = a3;
    if (![(HKGraphView *)self _drawingDuringScrolling])
    {
      renderView = self->_renderView;
      [(HKGraphRenderer *)renderView setNeedsRender];
    }
  }
}

- (void)setVirtualRightMarginStyle:(int64_t)a3
{
  if (self->_virtualRightMarginStyle != a3)
  {
    self->_virtualRightMarginStyle = a3;
    if (![(HKGraphView *)self _drawingDuringScrolling])
    {
      renderView = self->_renderView;
      [(HKGraphRenderer *)renderView setNeedsRender];
    }
  }
}

- (id)_rangeFromRange:(id)a3 withStartOfRange:(id)a4
{
  xAxis = self->_xAxis;
  id v7 = a4;
  id v8 = a3;
  CGFloat v9 = [(HKAxis *)xAxis transform];
  double v10 = [v8 minValue];
  [v9 coordinateForValue:v10];
  double v12 = v11;

  uint64_t v13 = [(HKAxis *)self->_xAxis transform];
  double v14 = [v8 maxValue];

  [v13 coordinateForValue:v14];
  double v16 = v15;

  double v17 = v16 - v12;
  CGRect v18 = [(HKAxis *)self->_xAxis transform];
  long long v19 = [v7 minValue];

  [v18 coordinateForValue:v19];
  double v21 = v20;

  double v22 = objc_opt_class();
  long long v23 = [(HKGraphView *)self xAxis];
  uint64_t v24 = [v22 _rangeFromModelCoordinateMin:v23 max:v21 axis:v17 + v21];

  return v24;
}

+ (double)_modelCoordinateSpanForRange:(id)a3 axis:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v5 transform];
  id v8 = [v6 minValue];
  [v7 coordinateForValue:v8];
  double v10 = v9;

  double v11 = [v5 transform];

  double v12 = [v6 maxValue];

  [v11 coordinateForValue:v12];
  double v14 = v13;

  return v14 - v10;
}

+ (id)_rangeFromModelCoordinateMin:(double)a3 max:(double)a4 axis:(id)a5
{
  id v7 = a5;
  id v8 = [v7 transform];
  double v9 = [v8 valueForCoordinate:a3];

  double v10 = [v7 transform];

  double v11 = [v10 valueForCoordinate:a4];

  double v12 = +[HKValueRange valueRangeWithMinValue:v9 maxValue:v11];

  return v12;
}

- (BOOL)_setRangesForActiveVisibleRange:(id)a3
{
  double v4 = (HKValueRange *)a3;
  id v5 = objc_opt_class();
  id v6 = [(HKGraphView *)self xAxis];
  [v5 _modelCoordinateSpanForRange:v4 axis:v6];
  double v8 = v7;

  double v9 = objc_opt_class();
  double v10 = [(HKGraphView *)self effectiveVisibleRangeCadence];
  double v11 = [(HKGraphView *)self xAxis];
  [v9 _modelCoordinateSpanForRange:v10 axis:v11];
  double v13 = v12;

  if (fabs(v13) <= 2.22044605e-16 || v8 / v13 > 0.99)
  {
    double v14 = v4;
  }
  else
  {
    -[HKGraphView _rangeFromRange:withStartOfRange:](self, "_rangeFromRange:withStartOfRange:", self->_effectiveVisibleRangeCadence, v4, v8 / v13);
    double v14 = (HKValueRange *)objc_claimAutoreleasedReturnValue();
  }
  double v15 = v14;
  [(HKGraphView *)self _setVisibleRangesForEffectiveRangeCadence:v14];
  BOOL v16 = [(HKGraphView *)self _compareRange:v4 toRange:self->_effectiveVisibleRangeActive];
  effectiveVisibleRangeActive = self->_effectiveVisibleRangeActive;
  self->_effectiveVisibleRangeActive = v4;
  CGRect v18 = v4;

  return !v16;
}

- (void)setEffectiveVisibleRangeActive:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(HKGraphView *)self _setRangesForActiveVisibleRange:a3]) {
    [(HKGraphView *)self _finishSelection];
  }
  [(HKGraphView *)self _scrollToCurrentVisibleRangeAnimated:v4];
}

- (BOOL)_compareChartDate:(id)a3 toDate:(id)a4
{
  [a3 timeIntervalSinceDate:a4];
  return fabs(v4) < 0.001;
}

- (BOOL)_compareRange:(id)a3 toRange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 startDate];
  if (v8)
  {
    double v9 = (void *)v8;
    double v10 = [v7 startDate];

    if (v10)
    {
      double v11 = [v6 startDate];
      double v12 = [v7 startDate];
      if ([(HKGraphView *)self _compareChartDate:v11 toDate:v12])
      {
        double v13 = [v6 endDate];
        double v14 = [v7 endDate];
        BOOL v15 = [(HKGraphView *)self _compareChartDate:v13 toDate:v14];
LABEL_9:
        BOOL v24 = v15;

LABEL_12:
        goto LABEL_13;
      }
      goto LABEL_11;
    }
  }
  double v11 = [v6 minValue];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v16 = [v7 minValue];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      BOOL v24 = 0;
      goto LABEL_14;
    }
    double v11 = [v6 minValue];
    [v11 doubleValue];
    double v19 = v18;
    double v12 = [v7 minValue];
    [v12 doubleValue];
    if (HKUIEqualCGFloats(v19, v20))
    {
      double v13 = [v6 maxValue];
      [v13 doubleValue];
      double v22 = v21;
      double v14 = [v7 maxValue];
      [v14 doubleValue];
      BOOL v15 = HKUIEqualCGFloats(v22, v23);
      goto LABEL_9;
    }
LABEL_11:
    BOOL v24 = 0;
    goto LABEL_12;
  }
  BOOL v24 = 0;
LABEL_13:

LABEL_14:
  return v24;
}

- (void)_updateEffectiveAxisRange:(id)a3 effectiveVisibleRangeCadence:(id)a4 effectiveVisibleRangeActive:(id)a5 virtualLeftMarginWidth:(double)a6 virtualRightMarginWidth:(double)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  BOOL v15 = [(HKGraphView *)self effectiveVisibleRangeActive];
  BOOL v16 = [(HKGraphView *)self _compareRange:v14 toRange:v15];

  if (!v16) {
    [(HKGraphView *)self _finishSelection];
  }
  self->_virtualLeftMargindouble Width = a6;
  self->_virtualRightMargindouble Width = a7;
  [(HKGraphView *)self _updateRangesForEffectiveAxisRange:v12 effectiveVisibleRangeCadence:v13 effectiveVisibleRangeActive:v14];
  xAxis = self->_xAxis;
  double v18 = [(HKGraphView *)self chartableValueRange];
  [(HKAxis *)xAxis setAxisChartableValueRange:v18];

  [(HKGraphView *)self _updateAxisZoomScaleValueRange];
  [(HKGraphView *)self _updateGraphViewConfiguration];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __145__HKGraphView__updateEffectiveAxisRange_effectiveVisibleRangeCadence_effectiveVisibleRangeActive_virtualLeftMarginWidth_virtualRightMarginWidth___block_invoke;
  v19[3] = &unk_1E6D50ED8;
  v19[4] = self;
  [(HKGraphView *)self _updateScrollViewPropertiesIgnoringScrollViewCallbacks:v19];
  [(HKGraphView *)self _notifyDelegateOfVisibleValueRange:self->_effectiveVisibleRangeActive changeContext:2];
}

uint64_t __145__HKGraphView__updateEffectiveAxisRange_effectiveVisibleRangeCadence_effectiveVisibleRangeActive_virtualLeftMarginWidth_virtualRightMarginWidth___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _scrollToCurrentVisibleRangeAnimated:0];
}

- (void)setEffectiveAxisRange:(id)a3 effectiveVisibleRangeCadence:(id)a4 effectiveVisibleRangeActive:(id)a5
{
}

- (id)_actualVisibleRangeFromEffectiveVisibleRange:(id)a3 dataAreaRect:(CGRect)a4
{
  double width = a4.size.width;
  double x = a4.origin.x;
  id v7 = a3;
  if ([(HKGraphView *)self _axisRangeIsDateRange])
  {
    uint64_t v8 = [(HKAxis *)self->_xAxis transform];
    double v9 = [v7 minValue];
    [v8 coordinateForValue:v9];
    double v11 = v10;
    id v12 = [(HKAxis *)self->_xAxis transform];
    id v13 = [v7 maxValue];
    [v12 coordinateForValue:v13];
    double v15 = v14;

    +[HKAxis expandByPointsLow:high:modelRange:pointRange:](HKAxis, "expandByPointsLow:high:modelRange:pointRange:", self->_virtualLeftMarginWidth, self->_virtualRightMarginWidth, v11, v15, x, x + width);
    double v17 = v16;
    double v19 = v18;
    double v20 = objc_opt_class();
    double v21 = [(HKGraphView *)self xAxis];
    id v22 = [v20 _rangeFromModelCoordinateMin:v21 max:v17 axis:v19];
  }
  else
  {
    id v22 = v7;
  }

  return v22;
}

- (id)_effectiveVisibleRangeFromActualVisibleRange:(id)a3
{
  id v4 = a3;
  if ([(HKGraphView *)self _axisRangeIsDateRange])
  {
    [(HKGraphView *)self _dataAreaRect];
    double v6 = v5;
    double v8 = v5 + v7;
    double v9 = [(HKAxis *)self->_xAxis transform];
    double v10 = [v4 minValue];
    [v9 coordinateForValue:v10];
    double v12 = v11;
    id v13 = [(HKAxis *)self->_xAxis transform];
    double v14 = [v4 maxValue];
    [v13 coordinateForValue:v14];
    double v16 = v15;

    +[HKAxis contractByPointsLow:high:modelRange:pointRange:](HKAxis, "contractByPointsLow:high:modelRange:pointRange:", self->_virtualLeftMarginWidth, self->_virtualRightMarginWidth, v12, v16, v6, v8);
    double v18 = v17;
    double v20 = v19;
    double v21 = objc_opt_class();
    id v22 = [(HKGraphView *)self xAxis];
    id v23 = [v21 _rangeFromModelCoordinateMin:v22 max:v18 axis:v20];
  }
  else
  {
    id v23 = v4;
  }

  return v23;
}

- (id)_findActualAxisRangeFromVisibleRanges
{
  uint64_t v3 = [(HKAxis *)self->_xAxis transform];
  id v4 = [(HKValueRange *)self->_effectiveVisibleRangeCadence minValue];
  [v3 coordinateForValue:v4];
  double v6 = v5;
  double v7 = [(HKAxis *)self->_xAxis transform];
  double v8 = [(HKValueRange *)self->_actualVisibleRange minValue];
  [v7 coordinateForValue:v8];
  double v10 = v6 - v9;

  double v11 = [(HKAxis *)self->_xAxis transform];
  double v12 = [(HKValueRange *)self->_actualVisibleRange maxValue];
  [v11 coordinateForValue:v12];
  double v14 = v13;
  double v15 = [(HKAxis *)self->_xAxis transform];
  double v16 = [(HKValueRange *)self->_effectiveVisibleRangeCadence maxValue];
  [v15 coordinateForValue:v16];
  double v18 = v14 - v17;

  double v19 = [(HKAxis *)self->_xAxis transform];
  double v20 = [(HKValueRange *)self->_effectiveAxisRange minValue];
  [v19 coordinateForValue:v20];
  double v22 = v21;

  id v23 = [(HKAxis *)self->_xAxis transform];
  BOOL v24 = [(HKValueRange *)self->_effectiveAxisRange maxValue];
  [v23 coordinateForValue:v24];
  double v26 = v25;

  long long v27 = objc_opt_class();
  long long v28 = [(HKGraphView *)self xAxis];
  long long v29 = [v27 _rangeFromModelCoordinateMin:v28 max:v22 - v10 axis:v18 + v26];

  return v29;
}

- (void)setDisableXAxis:(BOOL)a3
{
  self->_disableXAxis = a3;
  [(HKGraphView *)self _updateScene];
}

- (void)seriesDidInvalidatePaths:(id)a3 newDataArrived:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    double v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"HKGraphView.m" lineNumber:1308 description:@"HKGraphView seriesDidInvalidatePaths must be called on the main thread"];
  }
  if (![(HKGraphView *)self _drawingDuringScrolling])
  {
    [(HKGraphRenderer *)self->_renderView setNeedsRender];
    [(HKGraphRenderer *)self->_yAxisLabelContent setNeedsRender];
  }
  if (v4 && [(HKGraphView *)self _tilesAreEnabled]) {
    [(HKGraphView *)self _markTilesDirtyWithCompletion:0];
  }
  [(HKGraphView *)self _notifyDelegateSeriesUpdate:v8 newDataArrived:v4];
}

- (void)nonemptyDrawComplete
{
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    [(HKGraphView *)self firstNonemptyDrawTime];
    if (v3 == 0.0)
    {
      [(HKGraphView *)self setFirstNonemptyDrawTime:CACurrentMediaTime()];
      BOOL v4 = (NSObject **)MEMORY[0x1E4F29FB0];
      os_signpost_id_t v5 = _HKLogSignpostIDGenerate();
      _HKInitializeLogging();
      double v6 = *v4;
      if (os_signpost_enabled(v6))
      {
        double v7 = v6;
        id v8 = v7;
        if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
        {
          *(_WORD *)double v9 = 0;
          _os_signpost_emit_with_name_impl(&dword_1E0B26000, v8, OS_SIGNPOST_EVENT, v5, "chart-ppt-nonempty-draw", "", v9, 2u);
        }
      }
    }
  }
}

- (double)snapScreenCoordinateToXAxisResolution:(double)a3
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    long long v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2 object:self file:@"HKGraphView.m" lineNumber:1328 description:@"HKGraphView snapScreenCoordinateToXAxisResolution must be called on the main thread"];
  }
  if ([(HKGraphView *)self xAxisDateZoom] != 8)
  {
    double v6 = [(HKGraphView *)self xAxis];
    double v7 = [v6 transform];

    id v8 = [(HKGraphView *)self actualVisibleRange];
    double v9 = [v8 startDate];

    [v7 coordinateForValue:v9];
    double v11 = v10;
    double v12 = [(HKGraphView *)self xAxis];
    [v12 pointTransform];
    double v15 = HKLinearTransformValue(v13, v14, v11);

    double v16 = +[HKGraphZoomLevelConfiguration configurationForZoomLevel:[(HKGraphView *)self xAxisDateZoom]];
    int64_t v17 = [(HKGraphView *)self resolutionFromTraitCollectionAttributes];
    double v18 = [(HKGraphView *)self primarySeries];
    uint64_t v19 = objc_msgSend(v18, "resolutionForTimeScope:traitResolution:", -[HKGraphView xAxisDateZoom](self, "xAxisDateZoom"), v17);

    [v16 approximateSeriesPointIntervalAtResolution:v19];
    double v20 = objc_msgSend(v9, "dateByAddingTimeInterval:");
    [v7 coordinateForValue:v20];
    double v22 = v21;
    id v23 = [(HKGraphView *)self xAxis];
    [v23 pointTransform];
    double v26 = HKLinearTransformValue(v24, v25, v22);

    a3 = (v26 - v15) * 0.5 + floor(a3 / (v26 - v15)) * (v26 - v15);
  }
  return a3;
}

- (BOOL)rangeIsVisible:(id)a3
{
  os_signpost_id_t v5 = (void *)MEMORY[0x1E4F29060];
  id v6 = a3;
  if (([v5 isMainThread] & 1) == 0)
  {
    double v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"HKGraphView.m" lineNumber:1357 description:@"HKGraphView rangeIsVisible must be called from the main thread"];
  }
  double v7 = [(HKGraphView *)self actualVisibleRange];
  BOOL v8 = +[HKGraphView visibleIntersectionForRange:v6 visibleRange:v7];

  return v8;
}

- (UIEdgeInsets)_virtualMarginInsets
{
  [(HKGraphView *)self _dataAreaRect];
  -[HKGraphView _inactiveRightAreaForRect:](self, "_inactiveRightAreaForRect:");
  virtualLeftMargindouble Width = self->_virtualLeftMarginWidth;
  double v5 = v4 + self->_virtualRightMarginWidth;
  double v6 = 0.0;
  double v7 = 0.0;
  result.double right = v5;
  result.double bottom = v7;
  result.double left = virtualLeftMarginWidth;
  result.double top = v6;
  return result;
}

- (BOOL)_drawingDuringScrolling
{
  if ([(UIScrollView *)self->_scrollView isDragging]
    || [(UIScrollView *)self->_scrollView isDecelerating])
  {
    return 1;
  }
  scrollView = self->_scrollView;
  return [(UIScrollView *)scrollView isScrollAnimating];
}

+ (BOOL)visibleIntersectionForRange:(id)a3 visibleRange:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v7 = [v5 minValue];
  BOOL v8 = [v6 minValue];
  uint64_t v9 = [v8 compare:v7];

  if (v9 == 1)
  {
    uint64_t v10 = [v6 minValue];

    double v7 = (void *)v10;
  }
  double v11 = [v5 maxValue];
  double v12 = [v6 maxValue];
  uint64_t v13 = [v12 compare:v11];

  if (v13 == -1)
  {
    uint64_t v14 = [v6 maxValue];

    double v11 = (void *)v14;
  }
  BOOL v15 = [v7 compare:v11] == -1;

  return v15;
}

- (id)_defaultXAxisValueRange
{
  double v2 = +[HKGraphZoomLevelConfiguration defaultCalendar];
  double v3 = +[HKGraphZoomLevelConfiguration defaultCalendar];
  double v4 = [MEMORY[0x1E4F1C9C8] date];
  id v5 = [v3 startOfDayForDate:v4];

  id v6 = [v2 dateByAddingUnit:16 value:1 toDate:v5 options:0];
  double v7 = +[HKValueRange valueRangeWithMinValue:v5 maxValue:v6];

  return v7;
}

- (void)_autoScaleXAxis
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (self->_actualAxisRange)
  {
    [(HKGraphView *)self _contentWidth];
    double v4 = v3;
    xAxis = self->_xAxis;
    v11[0] = self->_actualAxisRange;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    -[HKAxis _pointTransformFromSeriesRanges:linearTransform:chartRange:](xAxis, "_pointTransformFromSeriesRanges:linearTransform:chartRange:", v6, 0.0, 1.0, 0.0, v4);
    double v8 = v7;
    double v10 = v9;

    -[HKAxis setPointTransform:](self->_xAxis, "setPointTransform:", v8, v10);
  }
}

- (void)autoscaleYAxesAnimated:(BOOL)a3 specificRange:(id)a4 onlyIfNeeded:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a3;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  long long v36 = (void (**)(void))a6;
  int v11 = [(HKGraphView *)self _initializationPeriodIsActive];
  double v12 = [(HKGraphView *)self _autoscaleSeriesOnlyIfNeeded:v7];
  double v35 = v10;
  uint64_t v13 = [(HKGraphView *)self _autoscaleTransformsFromAutoscaleSeriesList:v12 specificRange:v10];
  if ([v13 count]) {
    [(HKGraphView *)self _cancelAutoscaleAnimations];
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v14 = v13;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v48 objects:v53 count:16];
  if (!v15)
  {

LABEL_26:
    if ([v14 count]) {
      [(HKGraphView *)self _markTilesDirtyWithCompletion:0];
    }
    if (v36) {
      v36[2]();
    }
    goto LABEL_30;
  }
  uint64_t v16 = v15;
  long long v34 = v12;
  uint64_t v17 = 0;
  int v18 = v8 & ~v11;
  uint64_t v19 = *(void *)v49;
  uint64_t v39 = self;
  int v38 = v18;
  uint64_t v37 = *(void *)v49;
  do
  {
    uint64_t v20 = 0;
    uint64_t v40 = v16;
    do
    {
      if (*(void *)v49 != v19) {
        objc_enumerationMutation(v14);
      }
      double v21 = *(void **)(*((void *)&v48 + 1) + 8 * v20);
      if (v18
        && [(HKGraphView *)self _autoscaleTransformIsSignificant:*(void *)(*((void *)&v48 + 1) + 8 * v20)])
      {
        double v22 = [(HKGraphView *)self _propertyAnimationForTransform:v21];
        id v23 = [(HKGraphView *)self _insertAutoscaleAnimation:v22];
        [v22 setProperty:v23];
        [(HKGraphView *)self _actionsBeforeAnimationTransform:v21];
        v45[0] = MEMORY[0x1E4F143A8];
        v45[1] = 3221225472;
        v45[2] = __76__HKGraphView_autoscaleYAxesAnimated_specificRange_onlyIfNeeded_completion___block_invoke;
        v45[3] = &unk_1E6D51CE8;
        v45[4] = self;
        v45[5] = v21;
        id v46 = v23;
        v47 = v36;
        id v24 = v23;
        [v22 setCompletion:v45];
        if (!v17) {
          [(HKGraphView *)self _autoscaleAnimationStart];
        }
        -[HKPropertyAnimationApplier applyAnimation:](self->_animationApplier, "applyAnimation:", v22, v34);
        ++v17;
      }
      else
      {
        double v25 = objc_msgSend(v21, "yAxisForTransform", v34);
        [v21 endingTransform];
        objc_msgSend(v25, "setPointTransform:");

        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        double v22 = [v21 seriesForTransform];
        uint64_t v26 = [v22 countByEnumeratingWithState:&v41 objects:v52 count:16];
        if (v26)
        {
          uint64_t v27 = v26;
          uint64_t v28 = v17;
          id v29 = v14;
          uint64_t v30 = *(void *)v42;
          do
          {
            for (uint64_t i = 0; i != v27; ++i)
            {
              if (*(void *)v42 != v30) {
                objc_enumerationMutation(v22);
              }
              long long v32 = *(void **)(*((void *)&v41 + 1) + 8 * i);
              long long v33 = [v21 endingRange];
              [v32 updateForAutoscale:v33];
            }
            uint64_t v27 = [v22 countByEnumeratingWithState:&v41 objects:v52 count:16];
          }
          while (v27);
          id v14 = v29;
          uint64_t v17 = v28;
          self = v39;
          uint64_t v16 = v40;
          int v18 = v38;
          uint64_t v19 = v37;
        }
      }

      ++v20;
    }
    while (v20 != v16);
    uint64_t v16 = [v14 countByEnumeratingWithState:&v48 objects:v53 count:16];
  }
  while (v16);

  double v12 = v34;
  if (!v17) {
    goto LABEL_26;
  }
LABEL_30:
}

uint64_t __76__HKGraphView_autoscaleYAxesAnimated_specificRange_onlyIfNeeded_completion___block_invoke(void *a1, uint64_t a2)
{
  double v4 = (void *)a1[4];
  id v5 = (void *)a1[5];
  id v6 = [v5 endingRange];
  [v4 _actionsAfterAnimationTransform:v5 finalVisibleRange:v6];

  BOOL v7 = (void *)a1[4];
  uint64_t v8 = a1[6];
  uint64_t v9 = a1[7];
  return [v7 _removeAutoscaleAnimationWithName:v8 cancelled:a2 completion:v9];
}

- (BOOL)_initializationPeriodIsActive
{
  double v3 = CACurrentMediaTime();
  [(HKGraphView *)self startTime];
  if (v4 == 0.0) {
    return 1;
  }
  [(HKGraphView *)self startTime];
  return v3 - v6 < 1.5;
}

- (id)_autoscaleSeriesOnlyIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([(NSMutableArray *)self->_seriesGroupRows count])
  {
    uint64_t v6 = 0;
    do
    {
      uint64_t v20 = v6;
      BOOL v7 = [(NSMutableArray *)self->_seriesGroupRows objectAtIndexedSubscript:v6];
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      uint64_t v19 = v7;
      uint64_t v8 = [v7 currentSeries];
      uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v22;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v22 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
            if (!v3
              || [(HKGraphView *)self _seriesRequiresYAutoscale:*(void *)(*((void *)&v21 + 1) + 8 * i)])
            {
              id v14 = [v13 yAxis];
              uint64_t v15 = [(HKGraphView *)self _findAutoscaleSeriesForYAxis:v14 allAutoscaleSeries:v5];

              if (!v15)
              {
                uint64_t v16 = [_HKGraphViewAutoscaleSeries alloc];
                uint64_t v17 = [v13 yAxis];
                uint64_t v15 = [(_HKGraphViewAutoscaleSeries *)v16 initWithAutoscaleGroupRow:v20 autoscaleYAxis:v17];

                [v5 addObject:v15];
              }
              [(_HKGraphViewAutoscaleSeries *)v15 addAutoscaleSeries:v13];
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v10);
      }

      uint64_t v6 = v20 + 1;
    }
    while (v20 + 1 < (unint64_t)[(NSMutableArray *)self->_seriesGroupRows count]);
  }
  return v5;
}

- (id)_findAutoscaleSeriesForYAxis:(id)a3 allAutoscaleSeries:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = a4;
  id v7 = (id)[v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        objc_msgSend(v10, "autoscaleYAxis", (void)v13);
        id v11 = (id)objc_claimAutoreleasedReturnValue();

        if (v11 == v5)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (BOOL)_autoscaleTransformIsSignificant:(id)a3
{
  id v3 = a3;
  [v3 startingTransform];
  BOOL v6 = HKLinearTransformEqualToTransform(v4, v5, 0.0, 1.0);
  [v3 startingTransform];
  double v8 = v7;
  double v10 = v9;
  [v3 endingTransform];
  double v12 = v11;
  double v14 = v13;

  return (v6 | HKLinearTransformEqualToTransform(v8, v10, v12, v14)) ^ 1;
}

- (BOOL)_seriesRequiresYAutoscale:(id)a3
{
  id v3 = [a3 yAxis];
  char v4 = [v3 requiresScaling];

  return v4;
}

- (id)_autoscaleTransformsFromAutoscaleSeriesList:(id)a3 specificRange:(id)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v50 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v51 objects:v56 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v52 != v11) {
          objc_enumerationMutation(v8);
        }
        double v13 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        [(HKGraphView *)self _dataAreaRect];
        -[HKGraphView _yAxisRectForSeriesGroupRow:chartRect:](self, "_yAxisRectForSeriesGroupRow:chartRect:", [v13 autoscaleGroupRow], v14, v15, v16, v17);
        double v19 = v18;
        double v21 = v20;
        double v23 = v22;
        double v25 = v24;
        id v26 = v7;
        if (!v7)
        {
          -[HKGraphView _combinedYAxisRangeForAutoscaleSeries:yAxisRect:](self, "_combinedYAxisRangeForAutoscaleSeries:yAxisRect:", v13, v19, v21, v23, v25);
          id v26 = (id)objc_claimAutoreleasedReturnValue();
        }
        uint64_t v27 = v26;
        if (v26 && v25 >= 0.0 && v23 >= 0.0)
        {
          v59.origin.double x = v19;
          v59.origin.double y = v21;
          v59.size.double width = v23;
          v59.size.double height = v25;
          double MinY = CGRectGetMinY(v59);
          v60.origin.double x = v19;
          v60.origin.double y = v21;
          v60.size.double width = v23;
          v60.size.double height = v25;
          double MaxY = CGRectGetMaxY(v60);
          double v30 = MaxY - MinY;
          long long v31 = [v13 autoscaleSeries];
          BOOL v32 = [(HKGraphView *)self _allSeriesAreInverted:v31];

          if (v32)
          {
            double MaxY = -MinY;
            double v33 = 1.0;
          }
          else
          {
            double v33 = -1.0;
          }
          long long v34 = [v13 autoscaleYAxis];
          [v34 pointTransform];
          double v36 = v35;
          double v38 = v37;

          uint64_t v39 = [v13 autoscaleYAxis];
          v55 = v27;
          uint64_t v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v55 count:1];
          objc_msgSend(v39, "_pointTransformFromSeriesRanges:linearTransform:chartRange:", v40, MaxY, v33, MinY, v30);
          double v42 = v41;
          double v44 = v43;

          CGRect v45 = [_HKGraphViewYAxisTransform alloc];
          id v46 = [v13 autoscaleYAxis];
          v47 = [v13 autoscaleSeries];
          long long v48 = -[_HKGraphViewYAxisTransform initWithYAxis:seriesForTransform:startingTransform:endingTransform:endingRange:](v45, "initWithYAxis:seriesForTransform:startingTransform:endingTransform:endingRange:", v46, v47, v27, v36, v38, v42, v44);

          [v50 addObject:v48];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v51 objects:v56 count:16];
    }
    while (v10);
  }

  return v50;
}

- (BOOL)_allSeriesAreInverted:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "shouldInvertAxis", (void)v10))
        {
          BOOL v8 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 1;
LABEL_11:

  return v8;
}

- (id)_propertyAnimationForTransform:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(HKPropertyAnimation);
  uint64_t v5 = (void *)MEMORY[0x1E4F29238];
  [v3 startingTransform];
  uint64_t v6 = objc_msgSend(v5, "valueWithHKLinearTransform:");
  [(HKPropertyAnimation *)v4 setFromValue:v6];

  id v7 = (void *)MEMORY[0x1E4F29238];
  [v3 endingTransform];
  BOOL v8 = objc_msgSend(v7, "valueWithHKLinearTransform:");
  [(HKPropertyAnimation *)v4 setToValue:v8];

  [(HKPropertyAnimation *)v4 setDuration:0.3];
  LODWORD(v9) = 1051361018;
  LODWORD(v10) = 1.0;
  long long v11 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v9 :0.0 :0.0 :v10];
  [(HKPropertyAnimation *)v4 setTimingFunction:v11];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __46__HKGraphView__propertyAnimationForTransform___block_invoke;
  v14[3] = &unk_1E6D51D10;
  id v15 = v3;
  id v12 = v3;
  [(HKPropertyAnimation *)v4 setPropertyApplicationFunction:v14];

  return v4;
}

void __46__HKGraphView__propertyAnimationForTransform___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  [a2 HKLinearTransformValue];
  double v4 = v3;
  double v6 = v5;
  id v7 = [*(id *)(a1 + 32) yAxisForTransform];
  objc_msgSend(v7, "setPointTransform:", v4, v6);

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v8 = objc_msgSend(*(id *)(a1 + 32), "seriesForTransform", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v15 + 1) + 8 * v12);
        double v14 = [*(id *)(a1 + 32) endingRange];
        [v13 updateForAutoscale:v14];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
}

- (void)_actionsBeforeAnimationTransform:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v4 = objc_msgSend(v3, "seriesForTransform", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5)
  {

LABEL_11:
    uint64_t v10 = [v3 yAxisForTransform];
    [v10 setAxisLabelEndings:3];

    goto LABEL_12;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v12;
  int v8 = 1;
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v12 != v7) {
        objc_enumerationMutation(v4);
      }
      v8 &= [*(id *)(*((void *)&v11 + 1) + 8 * i) adjustYAxisForLabels];
    }
    uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  }
  while (v6);

  if (v8) {
    goto LABEL_11;
  }
LABEL_12:
}

- (void)_actionsAfterAnimationTransform:(id)a3 finalVisibleRange:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = objc_msgSend(v5, "seriesForTransform", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (!v8)
  {

LABEL_11:
    long long v14 = [v5 yAxisForTransform];
    [v14 setAxisLabelEndings:0];

    goto LABEL_12;
  }
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)v16;
  int v11 = 1;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v16 != v10) {
        objc_enumerationMutation(v7);
      }
      long long v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
      v11 &= [v13 adjustYAxisForLabels];
      [v13 updateForAutoscale:v6];
    }
    uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  }
  while (v9);

  if (v11) {
    goto LABEL_11;
  }
LABEL_12:
}

- (void)_autoscaleAnimationStart
{
  [(HKGraphView *)self setAnimationAutoscaleInProgress:1];
  [(HKGraphView *)self setTilesTransientDisabled:1];
}

- (void)_autoscaleAnimationEnd
{
  [(HKGraphView *)self setAnimationAutoscaleInProgress:0];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __37__HKGraphView__autoscaleAnimationEnd__block_invoke;
  v3[3] = &unk_1E6D50ED8;
  v3[4] = self;
  [(HKGraphView *)self _markTilesDirtyWithCompletion:v3];
}

uint64_t __37__HKGraphView__autoscaleAnimationEnd__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setTilesTransientDisabled:0];
}

- (void)_autoscaleAnimationCancelled
{
  [(HKGraphView *)self setAnimationAutoscaleInProgress:0];
  [(HKGraphView *)self setTilesTransientDisabled:0];
}

- (id)_insertAutoscaleAnimation:(id)a3
{
  id v4 = a3;
  id v5 = [(HKGraphView *)self currentAnimationProperties];
  id v6 = [v5 objectForKeyedSubscript:@"y_axis_point_transform"];

  if (v6)
  {
    uint64_t v7 = 1;
    uint64_t v8 = @"y_axis_point_transform";
    do
    {
      uint64_t v9 = [NSString stringWithFormat:@"%@_%ld", @"y_axis_point_transform", v7];

      ++v7;
      uint64_t v10 = [(HKGraphView *)self currentAnimationProperties];
      int v11 = [v10 objectForKeyedSubscript:v9];

      uint64_t v8 = v9;
    }
    while (v11);
  }
  else
  {
    uint64_t v9 = @"y_axis_point_transform";
  }
  long long v12 = [(HKGraphView *)self currentAnimationProperties];
  [v12 setObject:v4 forKeyedSubscript:v9];

  return v9;
}

- (void)_removeAutoscaleAnimationWithName:(id)a3 cancelled:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v13 = a5;
  id v8 = a3;
  uint64_t v9 = [(HKGraphView *)self currentAnimationProperties];
  [v9 removeObjectForKey:v8];

  uint64_t v10 = [(HKGraphView *)self currentAnimationProperties];
  uint64_t v11 = [v10 count];

  long long v12 = v13;
  if (!v11)
  {
    if (v5) {
      [(HKGraphView *)self _autoscaleAnimationCancelled];
    }
    else {
      [(HKGraphView *)self _autoscaleAnimationEnd];
    }
    long long v12 = v13;
    if (v13)
    {
      (*((void (**)(id))v13 + 2))(v13);
      long long v12 = v13;
    }
  }
}

- (void)_cancelAutoscaleAnimations
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [(HKGraphView *)self currentAnimationProperties];
  id v4 = [v3 allKeys];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * v9);
        uint64_t v11 = [(HKGraphView *)self animationApplier];
        [v11 cancelAnimationsForProperty:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  long long v12 = [(HKGraphView *)self currentAnimationProperties];
  [v12 removeAllObjects];
}

- (int64_t)resolutionFromTraitCollectionAttributes
{
  double v2 = [(HKGraphView *)self traitCollection];
  uint64_t v3 = [v2 horizontalSizeClass];

  return v3 == 2;
}

- (int64_t)_resolutionFromSeries:(id)a3
{
  id v4 = a3;
  int64_t v5 = objc_msgSend(v4, "resolutionForTimeScope:traitResolution:", self->_xAxisDateZoom, -[HKGraphView resolutionFromTraitCollectionAttributes](self, "resolutionFromTraitCollectionAttributes"));

  return v5;
}

- (id)_combinedYAxisRangeForAutoscaleSeries:(id)a3 yAxisRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v24 = a3;
  obuint64_t j = [v24 autoscaleSeries];
  uint64_t v9 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    id v11 = 0;
    uint64_t v12 = *(void *)v27;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(obj);
        }
        long long v14 = *(void **)(*((void *)&v26 + 1) + 8 * v13);
        int64_t v15 = [(HKGraphView *)self _resolutionFromSeries:v14];
        long long v16 = [(HKGraphView *)self effectiveVisibleRangeCadence];
        long long v17 = objc_msgSend(v14, "valueRangeForYAxisWithXAxisRange:dateZoom:resolution:chartRect:", v16, self->_xAxisDateZoom, v15, x, y, width, height);

        if ([v14 isCriticalForAutoscale]) {
          BOOL v18 = v17 == 0;
        }
        else {
          BOOL v18 = 0;
        }
        if (v18)
        {
          double v19 = [(HKGraphView *)self effectiveVisibleRangeCadence];
          char v20 = [v14 hasAnyDataLoadedInXAxisRange:v19 dateZoom:self->_xAxisDateZoom resolution:v15];

          if ((v20 & 1) == 0)
          {

            double v22 = 0;
            goto LABEL_22;
          }
        }
        else if (v17)
        {
          if (v11) {
            [v11 unionRange:v17];
          }
          else {
            id v11 = v17;
          }
        }

        ++v13;
      }
      while (v10 != v13);
      uint64_t v21 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
      uint64_t v10 = v21;
    }
    while (v21);
  }
  else
  {
    id v11 = 0;
  }

  id v11 = v11;
  double v22 = v11;
LABEL_22:

  return v22;
}

- (double)_inactiveRightAreaForRect:(CGRect)a3
{
  double width = a3.size.width;
  double v5 = 0.0;
  if (!-[HKValueRange isEqual:](self->_effectiveVisibleRangeCadence, "isEqual:", self->_effectiveVisibleRangeActive, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height))
  {
    uint64_t v6 = [(HKAxis *)self->_xAxis transform];
    uint64_t v7 = [(HKValueRange *)self->_actualVisibleRange minValue];
    [v6 coordinateForValue:v7];
    double v9 = v8;

    uint64_t v10 = [(HKAxis *)self->_xAxis transform];
    id v11 = [(HKValueRange *)self->_actualVisibleRange maxValue];
    [v10 coordinateForValue:v11];
    double v13 = v12;

    if (vabdd_f64(v13, v9) > 2.22044605e-16)
    {
      double v14 = width / (v13 - v9);
      int64_t v15 = [(HKAxis *)self->_xAxis transform];
      long long v16 = [(HKValueRange *)self->_effectiveVisibleRangeCadence maxValue];
      [v15 coordinateForValue:v16];
      double v18 = v17;

      double v19 = [(HKAxis *)self->_xAxis transform];
      char v20 = [(HKValueRange *)self->_effectiveVisibleRangeActive maxValue];
      [v19 coordinateForValue:v20];
      double v22 = v21;

      return v14 * (v18 - v22);
    }
  }
  return v5;
}

- (double)_bottomBaselineYValueForChartRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(HKGraphView *)self zoomScale];
  double v9 = v8;
  if (![(NSMutableArray *)self->_seriesGroupRows count]) {
    return -1.0;
  }
  unint64_t v10 = 0;
  char v11 = 1;
  double v12 = 2.22507386e-308;
  double v34 = height;
  double v35 = y;
  do
  {
    double v13 = -[NSMutableArray objectAtIndexedSubscript:](self->_seriesGroupRows, "objectAtIndexedSubscript:", v10, *(void *)&v34, *(void *)&v35);
    -[HKGraphView _yAxisRectForSeriesGroupRow:chartRect:](self, "_yAxisRectForSeriesGroupRow:chartRect:", v10, x, y, width, height);
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v20 = v9;
    double v21 = x;
    double v22 = width;
    double v24 = v23;
    double v25 = [(HKGraphView *)self _visibleSeriesForSeriesGroup:v13];
    long long v26 = [v25 yAxis];
    long long v27 = [v25 visibleValueRange];
    double v28 = v24;
    double width = v22;
    double x = v21;
    double v9 = v20;
    objc_msgSend(v26, "bottomBaselineYCoordinateForModelRange:axisRect:zoomScale:", v27, v15, v17, v19, v28, v20);
    double v30 = v29;

    if (v12 >= v30) {
      double v31 = v12;
    }
    else {
      double v31 = v30;
    }
    if (v26) {
      BOOL v32 = v30 < -0.00000011920929;
    }
    else {
      BOOL v32 = 1;
    }
    double height = v34;
    double y = v35;
    if (!v32)
    {
      char v11 = 0;
      double v12 = v31;
    }

    ++v10;
  }
  while (v10 < [(NSMutableArray *)self->_seriesGroupRows count]);
  if (v11) {
    return -1.0;
  }
  return v12;
}

- (double)_topBaselineYValueForChartRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(HKGraphView *)self zoomScale];
  double v9 = v8;
  if (![(NSMutableArray *)self->_seriesGroupRows count]) {
    return -1.0;
  }
  unint64_t v10 = 0;
  char v11 = 1;
  double v12 = 1.79769313e308;
  double v34 = height;
  double v35 = y;
  do
  {
    double v13 = -[NSMutableArray objectAtIndexedSubscript:](self->_seriesGroupRows, "objectAtIndexedSubscript:", v10, *(void *)&v34, *(void *)&v35);
    -[HKGraphView _yAxisRectForSeriesGroupRow:chartRect:](self, "_yAxisRectForSeriesGroupRow:chartRect:", v10, x, y, width, height);
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v20 = v9;
    double v21 = x;
    double v22 = width;
    double v24 = v23;
    double v25 = [(HKGraphView *)self _visibleSeriesForSeriesGroup:v13];
    long long v26 = [v25 yAxis];
    long long v27 = [v25 visibleValueRange];
    double v28 = v24;
    double width = v22;
    double x = v21;
    double v9 = v20;
    objc_msgSend(v26, "topBaselineYCoordinateForModelRange:axisRect:zoomScale:", v27, v15, v17, v19, v28, v20);
    double v30 = v29;

    if (v12 >= v30) {
      double v31 = v30;
    }
    else {
      double v31 = v12;
    }
    if (v26) {
      BOOL v32 = v30 < -0.00000011920929;
    }
    else {
      BOOL v32 = 1;
    }
    double height = v34;
    double y = v35;
    if (!v32)
    {
      char v11 = 0;
      double v12 = v31;
    }

    ++v10;
  }
  while (v10 < [(NSMutableArray *)self->_seriesGroupRows count]);
  if (v11) {
    return -1.0;
  }
  return v12;
}

- (id)_gridlineRangesForChartRect:(CGRect)a3
{
  double width = a3.size.width;
  double height = a3.size.height;
  double y = a3.origin.y;
  if (self->_drawsGridlinesPerSeriesGroup)
  {
    double x = a3.origin.x;
    [(HKGraphView *)self zoomScale];
    double v6 = v5;
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if ([(NSMutableArray *)self->_seriesGroupRows count])
    {
      uint64_t v8 = 0;
      while (1)
      {
        double v9 = [(NSMutableArray *)self->_seriesGroupRows objectAtIndexedSubscript:v8];
        -[HKGraphView _yAxisRectForSeriesGroupRow:chartRect:](self, "_yAxisRectForSeriesGroupRow:chartRect:", v8, x, y, width, height);
        double v11 = v10;
        double v13 = v12;
        double v15 = v14;
        double v17 = v16;
        double v18 = [(HKGraphView *)self _visibleSeriesForSeriesGroup:v9];
        double v19 = [v18 yAxis];
        if (!v19) {
          break;
        }
        double v20 = [v18 visibleValueRange];
        objc_msgSend(v19, "bottomBaselineYCoordinateForModelRange:axisRect:zoomScale:", v20, v11, v13, v15, v17, v6);
        double v22 = v21;

        if (v22 < 0.00000011920929) {
          double v22 = v13 + v17;
        }
        double v23 = [v18 visibleValueRange];
        objc_msgSend(v19, "topBaselineYCoordinateForModelRange:axisRect:zoomScale:", v23, v11, v13, v15, v17, v6);
        double v25 = v24;

        if (v22 < 0.00000011920929 || v25 < 0.00000011920929) {
          break;
        }
        *(float *)&double v26 = v22;
        double v28 = [NSNumber numberWithFloat:v26];
        *(float *)&double v29 = v25;
        double v30 = [NSNumber numberWithFloat:v29];
        double v31 = +[HKValueRange valueRangeWithMinValue:v30 maxValue:v28];
        [v7 addObject:v31];

        if (++v8 >= (unint64_t)[(NSMutableArray *)self->_seriesGroupRows count]) {
          goto LABEL_12;
        }
      }

      id v32 = 0;
    }
    else
    {
LABEL_12:
      id v32 = v7;
    }
  }
  else
  {
    id v32 = 0;
  }
  return v32;
}

- (void)_updateAllLegendsWithSelectedValues:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  double v5 = self->_seriesGroupRows;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        double v11 = objc_msgSend(v10, "legendView", (void)v15);

        if (v11)
        {
          if (v4
            && [v4 count]
            && ([v10 legendView],
                double v12 = objc_claimAutoreleasedReturnValue(),
                int v13 = [v12 opaqueBackground],
                v12,
                v13))
          {
            double v14 = [v10 legendView];
            [v14 showLollipopsWithSelectedValues:v4];
          }
          else
          {
            double v14 = [v10 legendView];
            [v14 hideLollipops];
          }
        }
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
}

- (id)_visibleSeriesForSeriesGroup:(id)a3
{
  id v3 = a3;
  id v4 = [v3 selectionContext];
  double v5 = [v4 closestSeriesToSelection];
  if (!v5)
  {
    uint64_t v6 = [v3 currentSeries];
    double v5 = [v6 firstObject];
  }
  return v5;
}

- (void)_renderYAxisLabelsInContext:(CGContext *)a3 chartRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  [(HKGraphView *)self zoomScale];
  double v10 = v9;
  [(HKGraphView *)self contentOffset];
  double v12 = v11;
  double v14 = v13;
  if ([(NSMutableArray *)self->_seriesGroupRows count])
  {
    unint64_t v15 = 0;
    double v32 = v10;
    do
    {
      long long v16 = [(NSMutableArray *)self->_seriesGroupRows objectAtIndexedSubscript:v15];
      [(HKGraphRenderer *)self->_yAxisLabelContent bounds];
      double v33 = v17;
      double v34 = v18;
      -[HKGraphView _yAxisRectForSeriesGroupRow:chartRect:](self, "_yAxisRectForSeriesGroupRow:chartRect:", v15, x, y, width, height);
      double v19 = v12;
      double v20 = y;
      double v21 = height;
      double v23 = v22;
      double v24 = width;
      double v26 = v25;
      v35[0] = 0;
      v35[1] = 0x4030000000000000;
      long long v27 = [(HKGraphView *)self _visibleSeriesForSeriesGroup:v16];
      double v28 = [v27 visibleValueRange];
      double v29 = [v27 yAxis];
      double v30 = v23;
      double height = v21;
      double y = v20;
      double v12 = v19;
      double v31 = v26;
      double width = v24;
      objc_msgSend(v29, "drawLabelsWithModelRange:chartRect:zoomScale:contentOffset:renderView:maximumLabelSize:omitOffscreenLabels:", v28, self->_yAxisLabelContent, v35, 0, v33, v30, v34, v31, v32, v19, v14);

      ++v15;
    }
    while (v15 < [(NSMutableArray *)self->_seriesGroupRows count]);
  }
}

- (_HKLocationSpan)_locationSpanForSeriesGroupRow:(int64_t)a3 chartRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = [(NSMutableArray *)self->_seriesGroupRows count];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    id v13 = objc_loadWeakRetained((id *)&self->_delegate);
    double v14 = [v13 stackedSeriesGroupHeightsForGraphView:self];

    if (v14 && [v14 count] > (unint64_t)a3)
    {
      unint64_t v15 = [v14 objectAtIndexedSubscript:a3];
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v16 = v14;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v35;
        double v20 = height;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v35 != v19) {
              objc_enumerationMutation(v16);
            }
            double v22 = *(void **)(*((void *)&v34 + 1) + 8 * i);
            if (objc_msgSend(v22, "kind", (void)v34) == 1)
            {
              [v22 heightValue];
              double v20 = v20 - v23;
            }
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v34 objects:v38 count:16];
        }
        while (v18);
      }
      else
      {
        double v20 = height;
      }
    }
    else
    {
      unint64_t v15 = 0;
      double v20 = height;
    }
  }
  else
  {
    unint64_t v15 = 0;
    double v20 = height;
  }
  if (a3 < 1)
  {
    double v26 = y;
  }
  else
  {
    -[HKGraphView _locationSpanForSeriesGroupRow:chartRect:](self, "_locationSpanForSeriesGroupRow:chartRect:", a3 - 1, x, y, width, height);
    double v26 = v24 + v25;
  }
  double v27 = floor(height * (1.0 / (double)v10));
  if (v15)
  {
    uint64_t v28 = [v15 kind];
    if (v28 == 1)
    {
      [v15 heightValue];
    }
    else
    {
      if (v28) {
        goto LABEL_28;
      }
      [v15 heightValue];
      double v30 = v20 * v29;
    }
    double v27 = floor(v30);
  }
LABEL_28:
  if (v10 - 1 == a3) {
    double v31 = y + height - v26;
  }
  else {
    double v31 = v27;
  }

  double v32 = v26;
  double v33 = v31;
  result.var1 = v33;
  result.var0 = v32;
  return result;
}

- (CGRect)_yAxisRectForSeriesGroupRow:(int64_t)a3 insetForLegends:(BOOL)a4 chartRect:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  BOOL v9 = a4;
  char v12 = -[NSMutableArray objectAtIndexedSubscript:](self->_seriesGroupRows, "objectAtIndexedSubscript:");
  [v12 lastLegendSize];
  double v14 = v13;
  unint64_t outlineOptions = self->_outlineOptions;
  double v16 = 0.0;
  double v17 = 0.0;
  if (outlineOptions)
  {
    double v17 = HKUIOnePixel();
    unint64_t outlineOptions = self->_outlineOptions;
  }
  if ((outlineOptions & 4) != 0) {
    double v16 = HKUIOnePixel();
  }
  double v18 = -0.0;
  if (v9) {
    double v18 = v14;
  }
  double v19 = v18 + v17;
  -[HKGraphView _locationSpanForSeriesGroupRow:chartRect:](self, "_locationSpanForSeriesGroupRow:chartRect:", a3, x, y, width, height);
  double v21 = v19 + v20;
  double v23 = v22 - (v19 + v16);

  double v24 = x + 0.0;
  double v25 = v21;
  double v26 = width;
  double v27 = v23;
  result.size.double height = v27;
  result.size.double width = v26;
  result.origin.double y = v25;
  result.origin.double x = v24;
  return result;
}

- (CGRect)_yAxisRectForSeriesGroupRow:(int64_t)a3 chartRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v10 = -[HKGraphView _anySeriesWantsInternalLegends:](self, "_anySeriesWantsInternalLegends:") ^ 1;
  -[HKGraphView _yAxisRectForSeriesGroupRow:insetForLegends:chartRect:](self, "_yAxisRectForSeriesGroupRow:insetForLegends:chartRect:", a3, v10, x, y, width, height);
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (BOOL)_anySeriesWantsInternalLegends:(int64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = [(NSMutableArray *)self->_seriesGroupRows objectAtIndexedSubscript:a3];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = objc_msgSend(v3, "currentSeries", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        if ([*(id *)(*((void *)&v9 + 1) + 8 * i) drawLegendInsideSeries])
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

- (BOOL)_skipRenderingToView:(id)a3 yAxisView:(id)a4 context:(CGContext *)a5 chartRect:(CGRect)a6
{
  id v8 = a3;
  id v9 = a4;
  [v8 bounds];
  if (!CGRectIsEmpty(v15) && [(HKGraphView *)self contentOffsetIsSet])
  {
    if (![(HKGraphView *)self _needsYAxisUpdateDuringRender]
      || ![(HKGraphView *)self _configureYAxisViewIfNeeded])
    {
      BOOL v10 = 0;
      goto LABEL_7;
    }
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __64__HKGraphView__skipRenderingToView_yAxisView_context_chartRect___block_invoke;
    v12[3] = &unk_1E6D513B0;
    id v13 = v8;
    id v14 = v9;
    dispatch_async(MEMORY[0x1E4F14428], v12);
  }
  BOOL v10 = 1;
LABEL_7:

  return v10;
}

uint64_t __64__HKGraphView__skipRenderingToView_yAxisView_context_chartRect___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setNeedsRender];
  double v2 = *(void **)(a1 + 40);
  return [v2 setNeedsRender];
}

- (id)_createRendererSeriesRowFromIndex:(int64_t)a3 insetDataArea:(CGRect)a4 drawingToTile:(BOOL)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  long long v11 = -[NSMutableArray objectAtIndexedSubscript:](self->_seriesGroupRows, "objectAtIndexedSubscript:");
  long long v12 = [(HKGraphView *)self _visibleSeriesForSeriesGroup:v11];
  id v13 = [v11 selectionContext];
  if (v13)
  {
    id v14 = [v11 selectionContext];
    CGRect v15 = [v14 closestSeriesToSelection];
  }
  else
  {
    CGRect v15 = 0;
  }

  id v16 = objc_alloc(MEMORY[0x1E4F1C978]);
  double v17 = [v11 selectionContext];
  double v18 = [v17 selectedRangeBoundariesXValue];
  double v19 = (void *)[v16 initWithArray:v18];

  id v20 = objc_alloc(MEMORY[0x1E4F1C978]);
  double v21 = [v11 currentSeries];
  double v22 = (void *)[v20 initWithArray:v21];

  double v23 = [v11 selectionContext];
  double v24 = [v23 touchPoints];
  uint64_t v25 = [v24 count];

  -[HKGraphView _yAxisRectForSeriesGroupRow:chartRect:](self, "_yAxisRectForSeriesGroupRow:chartRect:", a3, x, y, width, height);
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;
  if (a5)
  {
    long long v34 = 0;
  }
  else
  {
    long long v34 = [v11 axisAnnotationHandler];
  }
  long long v35 = -[HKGraphViewRendererSeriesRow initWithRowSeries:mainSeriesForRow:selectedSeriesForRow:selectedRangeBoundariesXValue:selectedTouchPointCount:yAxisRect:axisAnnotationHandler:]([HKGraphViewRendererSeriesRow alloc], "initWithRowSeries:mainSeriesForRow:selectedSeriesForRow:selectedRangeBoundariesXValue:selectedTouchPointCount:yAxisRect:axisAnnotationHandler:", v22, v12, v15, v19, v25, v34, v27, v29, v31, v33);

  return v35;
}

- (id)_createRendererSeriesConfigurationWithInsetDataArea:(CGRect)a3 drawingToTile:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([(NSMutableArray *)self->_seriesGroupRows count])
  {
    unint64_t v11 = 0;
    do
    {
      long long v12 = -[HKGraphView _createRendererSeriesRowFromIndex:insetDataArea:drawingToTile:](self, "_createRendererSeriesRowFromIndex:insetDataArea:drawingToTile:", v11, v4, x, y, width, height);
      [v10 addObject:v12];

      ++v11;
    }
    while (v11 < [(NSMutableArray *)self->_seriesGroupRows count]);
  }
  id v13 = [[HKGraphViewRendererSeriesConfiguration alloc] initWithRendererSeriesRows:v10];

  return v13;
}

- (id)_createRendererWithCurrentStateWithChartRect:(CGRect)a3 contentOffset:(CGPoint)a4 drawingToTile:(BOOL)a5 tileColumn:(int64_t)a6 effectiveVisibleRangeCadence:(id)a7 effectiveVisibleRangeActive:(id)a8 actualVisibleRange:(id)a9
{
  BOOL v11 = a5;
  double y = a4.y;
  double x = a4.x;
  id v79 = a9;
  id v78 = a8;
  id v77 = a7;
  [(HKGraphView *)self _dataAreaInsets];
  double v14 = v13;
  double v16 = v15;
  double v82 = v17;
  double v73 = v18;
  [(HKGraphView *)self _dataAreaRect];
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  v76 = -[HKGraphView _createRendererSeriesConfigurationWithInsetDataArea:drawingToTile:](self, "_createRendererSeriesConfigurationWithInsetDataArea:drawingToTile:", v11);
  double v27 = [HKGraphViewRendererVirtualMarginConfiguration alloc];
  [(HKGraphView *)self virtualLeftMarginWidth];
  double v29 = v28;
  [(HKGraphView *)self virtualRightMarginWidth];
  double v31 = v30;
  BOOL v80 = v11;
  if (v11)
  {
    int64_t v32 = 0;
    int64_t v33 = 0;
  }
  else
  {
    int64_t v32 = [(HKGraphView *)self virtualLeftMarginStyle];
    int64_t v33 = [(HKGraphView *)self virtualRightMarginStyle];
  }
  CGFloat v72 = a3.size.height - (v14 + v82);
  v71 = [(HKGraphViewRendererVirtualMarginConfiguration *)v27 initWithVirtualLeftMarginWidth:v32 virtualRightMarginWidth:v33 virtualLeftMarginStyle:v29 virtualRightMarginStyle:v31];
  -[HKGraphView _topBaselineYValueForChartRect:](self, "_topBaselineYValueForChartRect:", v20, v22, v24, v26);
  uint64_t v70 = v34;
  -[HKGraphView _bottomBaselineYValueForChartRect:](self, "_bottomBaselineYValueForChartRect:", v20, v22, v24, v26);
  uint64_t v69 = v35;
  long long v36 = [(HKGraphView *)self delegate];
  v83 = [v36 seriesSelectionLineColorForGraphView:self];

  long long v37 = -[HKGraphView _gridlineRangesForChartRect:](self, "_gridlineRangesForChartRect:", v20, v22, v24, v26);
  [(HKGraphView *)self _scrollingAreaRect];
  uint64_t v66 = v39;
  uint64_t v67 = v38;
  uint64_t v64 = v41;
  uint64_t v65 = v40;
  -[HKGraphView _inactiveRightAreaForRect:](self, "_inactiveRightAreaForRect:", v20, v22, v24, v26);
  uint64_t v68 = v42;
  [(HKGraphView *)self zoomScale];
  double v44 = v43;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v86 = 0u;
  -[HKGraphView _xAxisCoordinateTransformWithContentOffset:zoomScale:chartRect:](self, "_xAxisCoordinateTransformWithContentOffset:zoomScale:chartRect:", x, y, v43, v20, v22, v24, v26);
  BOOL v60 = [(HKGraphView *)self _drawingDuringScrolling];
  int64_t v63 = [(HKGraphView *)self resolutionFromTraitCollectionAttributes];
  CGRect v59 = [HKGraphViewRenderer alloc];
  int64_t xAxisDateZoom = self->_xAxisDateZoom;
  renderView = self->_renderView;
  BOOL v58 = [(HKGraphView *)self animationAutoscaleInProgress];
  xAxis = self->_xAxis;
  id v46 = [(HKGraphView *)self outlineColor];
  v47 = [(HKGraphView *)self capturedTileBackgroundColor];
  long long v48 = [(HKGraphView *)self selectionStyle];
  BOOL v49 = [(HKGraphView *)self disableXAxis];
  [(HKGraphView *)self xAxisSpace];
  uint64_t v51 = v50;
  BOOL v52 = [(HKGraphView *)self measuringStartupTime];
  v85[0] = v86;
  v85[1] = v87;
  v85[2] = v88;
  LOBYTE(v57) = v52;
  LOBYTE(v56) = v49;
  BYTE1(v55) = v58;
  LOBYTE(v55) = v60;
  long long v53 = -[HKGraphViewRenderer initWithRendererSeries:renderingView:fullChartRect:insetChartRect:insetDataArea:rightHandInactiveArea:zoomScale:traitResolution:contentOffset:xAxisDateZoom:drawingToTile:tileColumn:drawingDuringScrolling:drawingDuringAutoscale:xAxis:xAxisCoordinateTransform:virtualMargins:outlineColor:tileBackgroundColor:topBaselineY:bottomBaselineY:selectionLineColor:selectionLineStyle:disableXAxis:currentXAxisHeight:gridlineRanges:effectiveVisibleRangeCadence:effectiveVisibleRangeActive:actualVisibleRange:scrollingAreaRect:chartMeasuringStartupTime:](v59, "initWithRendererSeries:renderingView:fullChartRect:insetChartRect:insetDataArea:rightHandInactiveArea:zoomScale:traitResolution:contentOffset:xAxisDateZoom:drawingToTile:tileColumn:drawingDuringScrolling:drawingDuringAutoscale:xAxis:xAxisCoordinateTransform:virtualMargins:outlineColor:tileBackgroundColor:topBaselineY:bottomBaselineY:selectionLineColor:selectionLineStyle:disableXAxis:currentXAxisHeight:gridlineRanges:effectiveVisibleRangeCadence:effectiveVisibleRangeActive:actualVisibleRange:scrollingAreaRect:chartMeasuringStartupTime:", v76, renderView, v63, xAxisDateZoom, v80, a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a3.origin.x + v16, a3.origin.y + v14, a3.size.width - (v16 + v73),
          v72,
          *(void *)&v20,
          *(void *)&v22,
          *(void *)&v24,
          *(void *)&v26,
          v68,
          *(void *)&v44,
          *(void *)&x,
          *(void *)&y,
          v55,
          xAxis,
          v85,
          v71,
          v46,
          v47,
          v70,
          v69,
          v83,
          v48,
          v56,
          v51,
          v37,
          v77,
          v78,
          v79,
          v67,
          v66,
          v65,
          v64,
          v57);

  return v53;
}

- (void)_performPostAxisUpdates:(int64_t)a3 newXAxisHeight:(double)a4
{
  if ((a3 & 4) != 0)
  {
    [(HKGraphView *)self _configureYAxisViewIfNeeded];
    [(HKGraphRenderer *)self->_yAxisLabelContent setNeedsRender];
    self->_xAxisSpace = a4;
    [(HKGraphView *)self _verticalAxisRect];
    -[HKGraphRenderer setFrame:](self->_yAxisLabelContent, "setFrame:");
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __54__HKGraphView__performPostAxisUpdates_newXAxisHeight___block_invoke;
    v8[3] = &unk_1E6D50ED8;
    v8[4] = self;
    [(HKGraphView *)self _updateScrollViewPropertiesIgnoringScrollViewCallbacks:v8];
    [(HKGraphView *)self autoscaleYAxesAnimated:0 specificRange:0 onlyIfNeeded:0 completion:0];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __54__HKGraphView__performPostAxisUpdates_newXAxisHeight___block_invoke_2;
    v7[3] = &unk_1E6D50ED8;
    v7[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], v7);
  }
  else if ((a3 & 1) != 0 && [(HKGraphView *)self _needsYAxisUpdateDuringRender])
  {
    [(HKGraphView *)self _configureYAxisViewIfNeeded];
    yAxisLabelContent = self->_yAxisLabelContent;
    [(HKGraphRenderer *)yAxisLabelContent setNeedsRender];
  }
}

uint64_t __54__HKGraphView__performPostAxisUpdates_newXAxisHeight___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateZoomForParameters];
  double v2 = *(void **)(a1 + 32);
  return [v2 _reconfigureScrollingTiles];
}

uint64_t __54__HKGraphView__performPostAxisUpdates_newXAxisHeight___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 464) setNeedsRender];
  [*(id *)(*(void *)(a1 + 32) + 488) setNeedsRender];
  double v2 = *(void **)(a1 + 32);
  [v2 _dataAreaRect];
  return objc_msgSend(v2, "_layoutLegendsForChartRect:");
}

- (void)_performPostLeftMarginUpdates
{
  [(HKGraphView *)self _dataAreaRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(HKGraphView *)self leftMarginViewRect];
  -[HKBorderLineView setFrame:](self->_leftMarginView, "setFrame:");
  -[HKGraphView _gridlineRangesForChartRect:](self, "_gridlineRangesForChartRect:", v4, v6, v8, v10);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  [(HKBorderLineView *)self->_leftMarginView setVerticalDrawRanges:v11];
}

- (void)graphRenderer:(id)a3 shouldRenderSceneWithContext:(CGContext *)a4 chartRect:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v11 = (HKGraphRenderer *)a3;
  yAxisLabelContent = self->_yAxisLabelContent;
  double v28 = v11;
  if (self->_renderView == v11)
  {
    if (-[HKGraphView _skipRenderingToView:yAxisView:context:chartRect:](self, "_skipRenderingToView:yAxisView:context:chartRect:", v11, yAxisLabelContent, a4, x, y, width, height))
    {
      goto LABEL_10;
    }
    [(UIScrollView *)self->_scrollView contentOffset];
    double v18 = v17;
    double v20 = v19;
    double v21 = [(HKGraphView *)self effectiveVisibleRangeCadence];
    double v22 = [(HKGraphView *)self effectiveVisibleRangeActive];
    double v23 = [(HKGraphView *)self actualVisibleRange];
    double v24 = -[HKGraphView _createRendererWithCurrentStateWithChartRect:contentOffset:drawingToTile:tileColumn:effectiveVisibleRangeCadence:effectiveVisibleRangeActive:actualVisibleRange:](self, "_createRendererWithCurrentStateWithChartRect:contentOffset:drawingToTile:tileColumn:effectiveVisibleRangeCadence:effectiveVisibleRangeActive:actualVisibleRange:", 0, -1, v21, v22, v23, x, y, width, height, v18, v20);

    [v24 renderContentToContext:a4];
    uint64_t v25 = [v24 postUpdates];
    [v24 postXAxisHeight];
    -[HKGraphView _performPostAxisUpdates:newXAxisHeight:](self, "_performPostAxisUpdates:newXAxisHeight:", v25);
    [(HKGraphView *)self _performPostLegendUpdates];
    double v26 = [v24 postOverlayData];
    [(HKGraphView *)self _drawOverlaysIfNeeded:v26];

    [(HKGraphView *)self _performPostLeftMarginUpdates];
    double v27 = [v24 postSelectionPoints];
    [(HKGraphView *)self _updateAllLegendsWithSelectedValues:v27];
  }
  else if (yAxisLabelContent == v11)
  {
    [(HKGraphView *)self _dataAreaInsets];
    -[HKGraphView _renderYAxisLabelsInContext:chartRect:](self, "_renderYAxisLabelsInContext:chartRect:", a4, x + v16, y + v13, width - (v16 + v14), height - (v13 + v15));
  }
  [(HKGraphView *)self _handleTilesInitialRender];
  [(HKGraphView *)self _scheduleExternalSelectionIfNeeded];
  if ([(HKGraphView *)self measuringStartupTime] && self->_renderView == v28) {
    [(HKGraphView *)self _recordLastRenderTime];
  }
  [(HKGraphView *)self _notifyGraphViewRendered];
LABEL_10:
}

- (BOOL)allSeriesHaveDataAvailable
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  double v3 = self->_seriesGroupRows;
  uint64_t v18 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v18)
  {
    uint64_t v4 = *(void *)v25;
    double v19 = v3;
    uint64_t v17 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v25 != v4) {
          objc_enumerationMutation(v3);
        }
        double v6 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        double v7 = [v6 currentSeries];
        uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v21;
          while (2)
          {
            for (uint64_t j = 0; j != v9; ++j)
            {
              if (*(void *)v21 != v10) {
                objc_enumerationMutation(v7);
              }
              long long v12 = *(void **)(*((void *)&v20 + 1) + 8 * j);
              int64_t v13 = [(HKGraphView *)self _resolutionFromSeries:v12];
              double v14 = [(HKGraphView *)self actualVisibleRange];
              LODWORD(v12) = [v12 hasAnyDataLoadedInXAxisRange:v14 dateZoom:self->_xAxisDateZoom resolution:v13];

              if (!v12)
              {

                BOOL v15 = 0;
                double v3 = v19;
                goto LABEL_19;
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
            if (v9) {
              continue;
            }
            break;
          }
        }

        double v3 = v19;
        uint64_t v4 = v17;
      }
      BOOL v15 = 1;
      uint64_t v18 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v18);
  }
  else
  {
    BOOL v15 = 1;
  }
LABEL_19:

  return v15;
}

- (double)zoomScale
{
  [(UIScrollView *)self->_scrollView zoomScale];
  return result;
}

- (void)setZoomScale:(double)a3 animated:(BOOL)a4
{
  [(UIScrollView *)self->_scrollView zoomScale];
  if (!HKUIEqualCGFloats(v6, a3))
  {
    [(UIScrollView *)self->_scrollView contentOffset];
    double v8 = v7;
    [(UIScrollView *)self->_scrollView contentSize];
    double v10 = v9;
    [(UIScrollView *)self->_scrollView bounds];
    double v11 = v10 - CGRectGetWidth(v16) + -2.0;
    [(UIScrollView *)self->_scrollView setZoomScale:a3];
    if (v8 >= v11)
    {
      [(UIScrollView *)self->_scrollView contentSize];
      double v13 = v12;
      [(UIScrollView *)self->_scrollView bounds];
      double v14 = v13 - CGRectGetWidth(v17);
      [(UIScrollView *)self->_scrollView contentOffset];
      [(HKGraphView *)self setContentOffset:0 animated:v14];
    }
  }
}

- (CGPoint)contentOffset
{
  [(UIScrollView *)self->_scrollView contentOffset];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4
{
  double y = a3.y;
  double x = a3.x;
  [(UIScrollView *)self->_scrollView contentOffset];
  double v9 = v8;
  if (!HKUIEqualCGFloats(v10, x) || !HKUIEqualCGFloats(v9, y))
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = __41__HKGraphView_setContentOffset_animated___block_invoke;
    v11[3] = &unk_1E6D51D38;
    v11[4] = self;
    *(double *)&v11[5] = x;
    *(double *)&v11[6] = y;
    BOOL v12 = a4;
    [(HKGraphView *)self _updateScrollViewPropertiesIgnoringScrollViewCallbacks:v11];
  }
  self->_contentOffsetIsSet = 1;
}

uint64_t __41__HKGraphView_setContentOffset_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 472), "setContentOffset:animated:", *(unsigned __int8 *)(a1 + 56), *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (BOOL)stillAnimating:(id)a3
{
  uint64_t v4 = [(HKGraphRenderer *)self->_renderView layer];
  double v5 = [v4 animationKeys];
  BOOL v6 = [v5 count]
    || [(UIScrollView *)self->_scrollView isDecelerating]
    || [(UIScrollView *)self->_scrollView isTracking]
    || [(UIScrollView *)self->_scrollView isZooming]
    || [(UIScrollView *)self->_scrollView isZoomBouncing];

  return v6;
}

- (void)setDisableScrolling:(BOOL)a3
{
  self->_disableScrolling = a3;
  [(UIScrollView *)self->_scrollView setScrollEnabled:!a3];
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  if (self->_shouldListenToScrollViewDelegate)
  {
    id v25 = v4;
    [(HKGraphView *)self _dataAreaRect];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    [(HKGraphView *)self zoomScale];
    double v14 = v13;
    [(HKGraphView *)self contentOffset];
    double v16 = v15;
    double v18 = v17;
    -[HKAxis rangeForChartRect:zoomScale:contentOffset:](self->_xAxis, "rangeForChartRect:zoomScale:contentOffset:", v6, v8, v10, v12, v14, v15, v17);
    double v19 = (HKValueRange *)objc_claimAutoreleasedReturnValue();
    actualVisibleRange = self->_actualVisibleRange;
    self->_actualVisibleRange = v19;

    long long v21 = [(HKGraphView *)self _effectiveVisibleRangeFromActualVisibleRange:self->_actualVisibleRange];
    effectiveVisibleRangeCadence = self->_effectiveVisibleRangeCadence;
    self->_effectiveVisibleRangeCadence = v21;

    [(HKGraphView *)self _updateDateZoomIfNecessary];
    if ([(HKGraphView *)self _tilesAreEnabled]
      && (([v25 isDragging] & 1) != 0
       || ([v25 isDecelerating] & 1) != 0
       || [v25 isScrollAnimating]))
    {
      objc_storeStrong((id *)&self->_effectiveVisibleRangeActive, self->_effectiveVisibleRangeCadence);
      [(HKGraphView *)self _showTiles];
      -[HKGraphView _touchTilesForContentOffset:applyHysteresis:](self, "_touchTilesForContentOffset:applyHysteresis:", 1, v16, v18);
      [(HKGraphView *)self _updateLegendsForAllSeriesGroups];
    }
    else
    {
      long long v23 = [(HKGraphView *)self _rangeFromRange:self->_effectiveVisibleRangeActive withStartOfRange:self->_effectiveVisibleRangeCadence];
      effectiveVisibleRangeActive = self->_effectiveVisibleRangeActive;
      self->_effectiveVisibleRangeActive = v23;

      [(HKGraphRenderer *)self->_renderView setNeedsRender];
    }
    -[HKGraphView _notifyDelegateOfVisibleValueRange:changeContext:](self, "_notifyDelegateOfVisibleValueRange:changeContext:", self->_effectiveVisibleRangeActive, [v25 isDragging]);
    id v4 = v25;
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
  {
    [(HKGraphView *)self _hideTiles];
    [(HKGraphView *)self _notifyDelegateOfFinishUserScrolling];
  }
}

- (void)_snapXAxisRangeToPreservedRange
{
  if (self->_destinationEffectiveVisibleRangeActive) {
    [(HKGraphView *)self _restoreDestinationActiveRange];
  }
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  [(HKGraphView *)self _snapXAxisRangeToPreservedRange];
  [(HKGraphView *)self _hideTiles];
  [(HKGraphView *)self _notifyDelegateOfVisibleValueRange:self->_effectiveVisibleRangeActive changeContext:0];
  [(HKGraphView *)self _notifyDelegateOfFinishUserScrolling];
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  [(HKGraphView *)self _snapXAxisRangeToPreservedRange];
  [(HKGraphView *)self _hideTiles];
  [(HKGraphView *)self _notifyDelegateOfVisibleValueRange:self->_effectiveVisibleRangeActive changeContext:0];
  [(HKGraphView *)self _notifyDelegateOfFinishUserScrolling];
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  double x = a4.x;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v9 = self->_xAxis;
    [(HKGraphView *)self _dataAreaRect];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    [(HKGraphView *)self zoomScale];
    double v19 = v18;
    [(HKGraphView *)self zoomScale];
    long long v20 = v9;
    uint64_t v21 = -[HKAxis dateZoomForZoomScale:](v9, "dateZoomForZoomScale:");
    CGPoint v37 = (CGPoint)*MEMORY[0x1E4F1DAD8];
    long long v22 = -[HKAxis rangeForChartRect:zoomScale:contentOffset:](self->_xAxis, "rangeForChartRect:zoomScale:contentOffset:", v11, v13, v15, v17, v19, a5->x, a5->y);
    long long v23 = [(HKGraphView *)self _effectiveVisibleRangeFromActualVisibleRange:v22];

    uint64_t v24 = [(HKGraphView *)self delegate];
    if (v24
      && (id v25 = (void *)v24,
          [(HKGraphView *)self delegate],
          long long v26 = objc_claimAutoreleasedReturnValue(),
          char v27 = objc_opt_respondsToSelector(),
          v26,
          v25,
          (v27 & 1) != 0))
    {
      double v28 = [(HKGraphView *)self delegate];
      uint64_t v29 = [v28 defaultAlignmentForTimeScope:v21];
    }
    else
    {
      uint64_t v29 = 3;
    }
    effectiveAxisRange = self->_effectiveAxisRange;
    double v31 = [(HKGraphView *)self currentCalendar];
    int64_t v32 = +[HKGraphZoomLevelConfiguration snappingRangeForRange:axisRange:timeScope:velocity:calendar:options:alignment:](HKGraphZoomLevelConfiguration, "snappingRangeForRange:axisRange:timeScope:velocity:calendar:options:alignment:", v23, effectiveAxisRange, v21, v31, self->_scrollingOptions, v29, x, y);

    [(HKGraphView *)self _dataAreaRect];
    int64_t v33 = -[HKGraphView _actualVisibleRangeFromEffectiveVisibleRange:dataAreaRect:](self, "_actualVisibleRangeFromEffectiveVisibleRange:dataAreaRect:", v32);
    -[HKAxis offsetForValueRange:chartRect:zoomScaleOut:contentOffsetOut:](v20, "offsetForValueRange:chartRect:zoomScaleOut:contentOffsetOut:", v33, 0, &v37, v11, v13, v15, v17);
    *a5 = v37;
    uint64_t v34 = self->_effectiveAxisRange;
    uint64_t v35 = [(HKGraphView *)self currentCalendar];
    long long v36 = +[HKGraphZoomLevelConfiguration activeRangeFromCadenceRange:v32 timeScope:v21 axisRange:v34 calendar:v35];

    [(HKGraphView *)self _preserveDestinationActiveRange:v36];
  }
}

- (void)_reloadViewScope
{
  [(HKGraphView *)self _updateDateZoomIfNecessary];
  [(HKGraphView *)self _loadSeriesForZoom:self->_xAxisDateZoom];
  [(HKGraphRenderer *)self->_renderView setNeedsRender];
  [(HKGraphRenderer *)self->_yAxisLabelContent setNeedsRender];
  [(HKGraphView *)self _createLegendsIfNecessary];
}

- (void)_updateDateZoomIfNecessary
{
  int64_t xAxisDateZoom = self->_xAxisDateZoom;
  xAxis = self->_xAxis;
  [(HKGraphView *)self zoomScale];
  int64_t v5 = -[HKAxis dateZoomForZoomScale:](xAxis, "dateZoomForZoomScale:");
  if (v5 != xAxisDateZoom)
  {
    self->_int64_t xAxisDateZoom = v5;
    [(HKGraphView *)self _notifyDateZoomDidChangeFromValue:xAxisDateZoom toValue:v5];
  }
}

- (double)_maxTimeThreshold
{
  double v3 = [(HKAxis *)self->_xAxis transform];
  uint64_t v4 = [(HKValueRange *)self->_effectiveVisibleRangeCadence maxValue];
  [v3 coordinateForValue:v4];
  double v6 = v5;
  double v7 = [(HKAxis *)self->_xAxis transform];
  double v8 = [(HKValueRange *)self->_effectiveVisibleRangeCadence minValue];
  [v7 coordinateForValue:v8];
  double v10 = v6 - v9;

  return v10;
}

- (void)_updateAxisZoomScaleValueRange
{
  if ([(HKGraphView *)self _axisRangeIsDateRange])
  {
    [(HKGraphView *)self _maxTimeThreshold];
    double v4 = v3;
    id v5 = [(HKAxis *)self->_xAxis zoomScaleEngine];
    [v5 setUnitZoomScaleValueRangeForTimeInterval:v4];
  }
}

- (double)_maximumZoomScale
{
  if ([(HKGraphView *)self _axisRangeIsDateRange] && self->_contentWidthFromTimeScope)
  {
    if (self->_enableZoomInGesture)
    {
      [(HKGraphView *)self _maxTimeThreshold];
      double v4 = v3;
      id v5 = +[HKGraphZoomLevelConfiguration configurationForZoomLevel:self->_minimumDateZoom];
      [v5 zoomLevelThreshold];
      double v7 = v6;

      return v4 / v7;
    }
    else
    {
      return 1.0;
    }
  }
  else
  {
    double result = 1.0;
    if (self->_actualVisibleRange && self->_actualAxisRange)
    {
      double v9 = objc_opt_class();
      double v10 = [(HKGraphView *)self actualAxisRange];
      double v11 = [(HKGraphView *)self xAxis];
      [v9 _modelCoordinateSpanForRange:v10 axis:v11];
      double v13 = v12;

      double v14 = objc_opt_class();
      double v15 = [(HKGraphView *)self actualVisibleRange];
      double v16 = [(HKGraphView *)self xAxis];
      [v14 _modelCoordinateSpanForRange:v15 axis:v16];
      double v18 = v17;

      BOOL v19 = v18 >= v13 || v18 <= 0.0;
      double result = v13 / v18;
      if (v19) {
        return 1.0;
      }
    }
  }
  return result;
}

- (double)_contentWidth
{
  [(HKGraphView *)self _dataAreaRect];
  double v4 = v3;
  id v5 = objc_opt_class();
  double v6 = [(HKGraphView *)self effectiveAxisRange];
  double v7 = [(HKGraphView *)self xAxis];
  [v5 _modelCoordinateSpanForRange:v6 axis:v7];
  double v9 = v8;

  double v10 = objc_opt_class();
  double v11 = [(HKGraphView *)self effectiveVisibleRangeCadence];
  double v12 = [(HKGraphView *)self xAxis];
  [v10 _modelCoordinateSpanForRange:v11 axis:v12];
  double v14 = v13;

  if (fabs(v14) < 2.22044605e-16) {
    return v4;
  }
  double v16 = self->_virtualLeftMarginWidth + self->_virtualRightMarginWidth;
  return v16 + (v4 - v16) * (v9 / v14);
}

- (void)_updateZoomForParameters
{
  [(HKGraphView *)self _maximumZoomScale];
  double v4 = v3;
  [(HKGraphView *)self _contentWidth];
  double v6 = v5;
  [(HKGraphView *)self _dataAreaRect];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  double v15 = HKUICeilToScreenScale(v6);
  v19.origin.double x = v8;
  v19.origin.double y = v10;
  v19.size.double width = v12;
  v19.size.double height = v14;
  double Height = CGRectGetHeight(v19);
  [(UIScrollView *)self->_scrollView setZoomScale:1.0];
  -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v15, Height);
  [(UIScrollView *)self->_scrollView setMinimumZoomScale:1.0];
  scrollView = self->_scrollView;
  [(UIScrollView *)scrollView setMaximumZoomScale:v4];
}

- (void)_restoreDestinationActiveRange
{
  double v3 = [(HKGraphView *)self destinationEffectiveVisibleRangeActive];

  if (v3)
  {
    double v4 = [(HKGraphView *)self destinationEffectiveVisibleRangeActive];
    BOOL v5 = [(HKGraphView *)self _setRangesForActiveVisibleRange:v4];

    if (v5) {
      [(HKGraphView *)self _finishSelection];
    }
    [(HKGraphView *)self setDestinationEffectiveVisibleRangeActive:0];
    renderView = self->_renderView;
    [(HKGraphRenderer *)renderView setNeedsRender];
  }
}

- (void)_scrollToCurrentVisibleRangeAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(HKGraphView *)self _dataAreaRect];
  if (self->_effectiveVisibleRangeCadence)
  {
    if (self->_xAxis)
    {
      double v9 = v5;
      double v10 = v6;
      double v11 = v7;
      double v12 = v8;
      if (!CGRectIsEmpty(*(CGRect *)&v5))
      {
        long long v13 = *MEMORY[0x1E4F1DAD8];
        -[HKAxis offsetForValueRange:chartRect:zoomScaleOut:contentOffsetOut:](self->_xAxis, "offsetForValueRange:chartRect:zoomScaleOut:contentOffsetOut:", self->_actualVisibleRange, 0, &v13, v9, v10, v11, v12);
        if (v3) {
          [(HKGraphView *)self _preserveDestinationActiveRange:self->_effectiveVisibleRangeActive];
        }
        [(HKGraphView *)self setContentOffset:v3 animated:v13];
      }
    }
  }
}

- (void)_setNeedsUpdateGraphViewConfiguration
{
  self->_needsUpdateGraphViewConfiguration = 1;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__HKGraphView__setNeedsUpdateGraphViewConfiguration__block_invoke;
  block[3] = &unk_1E6D50ED8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __52__HKGraphView__setNeedsUpdateGraphViewConfiguration__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateGraphViewConfigurationIfNecessary];
}

- (void)_updateGraphViewConfigurationIfNecessary
{
  if (self->_needsUpdateGraphViewConfiguration)
  {
    self->_needsUpdateGraphViewConfiguration = 0;
    [(HKGraphView *)self _updateGraphViewConfiguration];
  }
}

- (void)_updateScrollViewPropertiesIgnoringScrollViewCallbacks:(id)a3
{
  self->_shouldListenToScrollViewDelegate = 0;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  self->_shouldListenToScrollViewDelegate = 1;
}

- (void)_addTapGestureRecognizerForTapOnView:(id)a3
{
  double v4 = (objc_class *)MEMORY[0x1E4FB1D38];
  id v5 = a3;
  id v6 = (id)[[v4 alloc] initWithTarget:self action:sel__tapOnViewAction_];
  [v6 setNumberOfTapsRequired:1];
  [v5 addGestureRecognizer:v6];
}

- (void)_tapOnViewAction:(id)a3
{
  [(HKGraphView *)self _finishSelection];
  [(HKGraphView *)self _notifyDelegateOfTapOnYAxis];
}

- (void)setDetailView:(id)a3
{
  id v5 = (UIView *)a3;
  detailView = self->_detailView;
  if (detailView) {
    BOOL v7 = 0;
  }
  else {
    BOOL v7 = v5 != 0;
  }
  if (detailView) {
    BOOL v8 = v5 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (detailView != v5)
  {
    double v9 = v5;
    if (detailView) {
      [(UIView *)detailView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_detailView, a3);
    if (self->_detailView)
    {
      -[HKGraphView addSubview:](self, "addSubview:");
      detailView = (UIView *)[(HKGraphView *)self _layoutDetailView];
    }
    id v5 = v9;
    if (v7 || v8)
    {
      detailView = (UIView *)[(HKGraphView *)self _setNeedsUpdateGraphViewConfiguration];
      id v5 = v9;
    }
  }
  MEMORY[0x1F41817F8](detailView, v5);
}

- (void)_addTapGestureRecognizerForTogglingStickyToView:(id)a3
{
  double v4 = (objc_class *)MEMORY[0x1E4FB1D38];
  id v5 = a3;
  id v6 = (id)[[v4 alloc] initWithTarget:self action:sel__toggleStickySelectionAction_];
  [v6 setNumberOfTapsRequired:1];
  [v5 addGestureRecognizer:v6];
}

- (void)_toggleStickySelectionAction:(id)a3
{
  id v4 = a3;
  [(HKGraphView *)self _invalidateExternalSelectionCancelTimer];
  [(HKGraphView *)self _cancelExternalSelection];
  [v4 locationInView:self->_renderView];
  double v6 = v5;
  double v8 = v7;

  -[HKGraphView _touchAtPoint:](self, "_touchAtPoint:", v6, v8);
}

- (void)_touchAtPoint:(CGPoint)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (self->_enableStickySelection && !self->_disableSelection)
  {
    double y = a3.y;
    double x = a3.x;
    -[HKGraphView _selectionRecognizerDidBeginWithTouchPoint:](self, "_selectionRecognizerDidBeginWithTouchPoint:");
    [(HKGraphView *)self _activateStickySelection];
    double v6 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", x, y);
    v8[0] = v6;
    double v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    [(HKGraphView *)self _selectionRecognizerDidMoveWithTouchPoints:v7];
  }
}

- (void)setDisableSelection:(BOOL)a3
{
  BOOL v3 = a3;
  self->_disableSelection = a3;
  scrollView = self->_scrollView;
  if (v3) {
    [(HKGraphView *)self _removeSelectionRecognizerFromView:scrollView];
  }
  else {
    [(HKGraphView *)self _addSelectionRecognizerToView:scrollView];
  }
}

- (int64_t)_currentSelectionStateForSeriesGroup:(id)a3
{
  id v3 = a3;
  id v4 = [v3 selectionContext];
  if (v4)
  {
    double v5 = [v3 selectionContext];
    int64_t v6 = [v5 selectionState];
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

- (void)_enumerateSeriesSelectionRegionsForSeriesGroup:(id)a3 withBlock:(id)a4
{
  id v5 = a3;
  int64_t v6 = (void (**)(id, uint64_t, unsigned char *, double, double, double, double))a4;
  double v7 = [v5 selectionContext];
  [v7 seriesSelectionRect];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  v25.origin.double x = v9;
  v25.origin.double y = v11;
  v25.size.double width = v13;
  v25.size.double height = v15;
  double MinX = CGRectGetMinX(v25);
  v26.origin.double x = v9;
  v26.origin.double y = v11;
  v26.size.double width = v13;
  v26.size.double height = v15;
  double Width = CGRectGetWidth(v26);
  v27.origin.double x = v9;
  v27.origin.double y = v11;
  v27.size.double width = v13;
  v27.size.double height = v15;
  double MinY = CGRectGetMinY(v27);
  CGRect v19 = [v5 selectionContext];
  long long v20 = [v19 selectionAreaMapping];
  uint64_t v21 = [v20 count];

  if (v21 >= 1)
  {
    uint64_t v22 = 0;
    do
    {
      char v24 = 0;
      v6[2](v6, v22, &v24, MinX, MinY + (double)v22 * 15.0, Width, 15.0);
      if (v24) {
        BOOL v23 = 1;
      }
      else {
        BOOL v23 = v21 - 1 == v22;
      }
      ++v22;
    }
    while (!v23);
  }
}

- (id)_closestGraphSeriesForTouchPoint:(CGPoint)a3 seriesGroup:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if ([(HKGraphView *)self _currentSelectionStateForSeriesGroup:v7] == 2) {
    goto LABEL_4;
  }
  double v8 = [v7 selectionContext];
  [v8 seriesSelectionRect];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;

  v35.origin.double x = v10;
  v35.origin.double y = v12;
  v35.size.double width = v14;
  v35.size.double height = v16;
  if (x < CGRectGetMinX(v35)
    || (v36.origin.x = v10, v36.origin.y = v12, v36.size.double width = v14, v36.size.height = v16, x > CGRectGetMaxX(v36)))
  {
LABEL_4:
    id v17 = 0;
  }
  else
  {
    uint64_t v28 = 0;
    uint64_t v29 = &v28;
    uint64_t v30 = 0x3032000000;
    double v31 = __Block_byref_object_copy__2;
    int64_t v32 = __Block_byref_object_dispose__2;
    id v33 = 0;
    v37.origin.double x = v10;
    v37.origin.double y = v12;
    v37.size.double width = v14;
    v37.size.double height = v16;
    if (y >= CGRectGetMinY(v37))
    {
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __60__HKGraphView__closestGraphSeriesForTouchPoint_seriesGroup___block_invoke;
      v23[3] = &unk_1E6D51D60;
      CGRect v25 = &v28;
      id v24 = v7;
      double v26 = x;
      double v27 = y;
      [(HKGraphView *)self _enumerateSeriesSelectionRegionsForSeriesGroup:v24 withBlock:v23];
      CGRect v19 = v24;
    }
    else
    {
      CGRect v19 = [v7 selectionContext];
      long long v20 = [v19 selectionAreaMapping];
      uint64_t v21 = [v20 firstObject];
      uint64_t v22 = (void *)v29[5];
      v29[5] = v21;
    }
    id v17 = (id)v29[5];
    _Block_object_dispose(&v28, 8);
  }
  return v17;
}

BOOL __60__HKGraphView__closestGraphSeriesForTouchPoint_seriesGroup___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  CGFloat v14 = [*(id *)(a1 + 32) selectionContext];
  double v15 = [v14 selectionAreaMapping];
  uint64_t v16 = [v15 objectAtIndexedSubscript:a2];
  uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
  double v18 = *(void **)(v17 + 40);
  *(void *)(v17 + 40) = v16;

  v20.origin.double x = a4;
  v20.origin.double y = a5;
  v20.size.double width = a6;
  v20.size.double height = a7;
  BOOL result = CGRectContainsPoint(v20, *(CGPoint *)(a1 + 48));
  if (result) {
    *a3 = 1;
  }
  return result;
}

- (void)_addSelectionRecognizerToView:(id)a3
{
  if (!self->_multiTouchGestureRecognizer)
  {
    id v6 = a3;
    id v4 = [[HKMultiTouchPressGestureRecognizer alloc] initWithTarget:self action:sel__selectionRecognizerDidUpdate_];
    multiTouchGestureRecognizer = self->_multiTouchGestureRecognizer;
    self->_multiTouchGestureRecognizer = v4;

    [(HKMultiTouchPressGestureRecognizer *)self->_multiTouchGestureRecognizer setDelegate:self];
    [(HKMultiTouchPressGestureRecognizer *)self->_multiTouchGestureRecognizer setMaximumNumberOfTouches:2];
    [(HKMultiTouchPressGestureRecognizer *)self->_multiTouchGestureRecognizer setRequiredPressDelay:0.2];
    [v6 addGestureRecognizer:self->_multiTouchGestureRecognizer];
  }
}

- (void)_removeSelectionRecognizerFromView:(id)a3
{
  multiTouchGestureRecognizer = self->_multiTouchGestureRecognizer;
  if (multiTouchGestureRecognizer)
  {
    [a3 removeGestureRecognizer:multiTouchGestureRecognizer];
    id v5 = self->_multiTouchGestureRecognizer;
    self->_multiTouchGestureRecognizer = 0;
  }
  [(HKGraphView *)self _finishSelection];
}

- (void)_selectionRecognizerDidUpdate:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [v9 state];
  if ((unint64_t)(v4 - 3) < 3)
  {
    [(HKGraphView *)self _selectionRecognizerDidFinish:v9];
LABEL_9:
    id v6 = v9;
    goto LABEL_10;
  }
  if (v4 == 2)
  {
    id v7 = [v9 touches];
    BOOL v8 = [(HKGraphView *)self _touchesActuallyMoved:v7];

    id v6 = v9;
    if (!v8) {
      goto LABEL_10;
    }
    [(HKGraphView *)self _selectionRecognizerDidMove:v9];
    goto LABEL_9;
  }
  BOOL v5 = v4 == 1;
  id v6 = v9;
  if (v5)
  {
    [(HKGraphView *)self _selectionRecognizerDidBegin:v9];
    goto LABEL_9;
  }
LABEL_10:
}

- (BOOL)_touchesActuallyMoved:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        objc_msgSend(v9, "previousLocationInView:", self, (void)v18);
        double v11 = v10;
        double v13 = v12;
        [v9 locationInView:self];
        if (hypot(v11 - v14, v13 - v15) > 2.22044605e-16)
        {
          BOOL v16 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v16 = 0;
LABEL_11:

  return v16;
}

- (id)_closestSeriesToPoint:(CGPoint)a3 allSeries:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  [(HKGraphView *)self _dataAreaRect];
  double v33 = v6;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [(HKGraphView *)self zoomScale];
  double v14 = v13;
  [(HKGraphView *)self contentOffset];
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v40 = 0u;
  [(HKGraphView *)self _xAxisCoordinateTransform];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v19 = v5;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v36 objects:v43 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = 0;
    uint64_t v23 = *(void *)v37;
    double v24 = 1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v37 != v23) {
          objc_enumerationMutation(v19);
        }
        double v26 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        int64_t v27 = [(HKGraphView *)self _resolutionFromSeries:v26];
        xAxis = self->_xAxis;
        v35[0] = v40;
        v35[1] = v41;
        void v35[2] = v42;
        objc_msgSend(v26, "distanceFromTouchPoint:inChartRect:xAxis:zoomScale:resolution:contentOffset:xAxisTransform:", xAxis, v27, v35, a3.x, a3.y, v33, v8, v10, v12, v14, v16, v18);
        if (v29 < v24)
        {
          double v30 = v29;
          id v31 = v26;

          uint64_t v22 = v31;
          double v24 = v30;
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v36 objects:v43 count:16];
    }
    while (v21);
  }
  else
  {
    uint64_t v22 = 0;
  }

  return v22;
}

- (void)gestureWillBeginWithRecognizer:(id)a3
{
  id v4 = a3;
  uint64_t v7 = 0;
  double v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 1;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__HKGraphView_gestureWillBeginWithRecognizer___block_invoke;
  v6[3] = &unk_1E6D51D88;
  v6[4] = &v7;
  [(HKGraphView *)self _walkAllSeries:v6];
  if (*((unsigned char *)v8 + 24)) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 1;
  }
  [(HKMultiTouchPressGestureRecognizer *)self->_multiTouchGestureRecognizer setMaximumNumberOfTouches:v5];
  _Block_object_dispose(&v7, 8);
}

uint64_t __46__HKGraphView_gestureWillBeginWithRecognizer___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = [a2 supportsMultiTouchSelection];
  if ((result & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a3 = 1;
  }
  return result;
}

- (CGPoint)_touchPointForSeriesGroupIndex:(int64_t)a3 originalTouchPoint:(CGPoint)a4
{
  double y = a4.y;
  CGFloat x = a4.x;
  [(HKGraphView *)self _dataAreaRect];
  double v9 = (y / v8 + (double)a3) * (v8 / (double)(unint64_t)[(NSMutableArray *)self->_seriesGroupRows count]);
  double v10 = x;
  result.double y = v9;
  result.CGFloat x = v10;
  return result;
}

- (void)_selectionRecognizerDidBegin:(id)a3
{
  id v9 = a3;
  id v4 = [v9 touchAtIndex:0];
  [v4 locationInView:self->_renderView];
  double v6 = v5;
  double v8 = v7;

  -[HKGraphView _selectionRecognizerDidBeginWithTouchPoint:](self, "_selectionRecognizerDidBeginWithTouchPoint:", v6, v8);
  [(HKGraphView *)self _invalidateExternalSelectionCancelTimer];
  [(HKGraphView *)self _selectionRecognizerDidMove:v9];
}

- (void)_selectionRecognizerDidBeginWithTouchPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if ([(NSMutableArray *)self->_seriesGroupRows count])
  {
    unint64_t v6 = 0;
    do
    {
      -[HKGraphView _touchPointForSeriesGroupIndex:originalTouchPoint:](self, "_touchPointForSeriesGroupIndex:originalTouchPoint:", v6, x, y);
      -[HKGraphView _handleStartTouchPoint:seriesGroupRow:](self, "_handleStartTouchPoint:seriesGroupRow:", v6++);
    }
    while (v6 < [(NSMutableArray *)self->_seriesGroupRows count]);
  }
  [(HKGraphView *)self _notifyDidBeginSelection];
}

- (void)_handleStartTouchPoint:(CGPoint)a3 seriesGroupRow:(int64_t)a4
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  [(HKGraphView *)self _dataAreaRect];
  -[HKGraphView _yAxisRectForSeriesGroupRow:chartRect:](self, "_yAxisRectForSeriesGroupRow:chartRect:", a4);
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  long long v41 = [(NSMutableArray *)self->_seriesGroupRows objectAtIndexedSubscript:a4];
  [(HKGraphView *)self zoomScale];
  double v15 = v14;
  [(HKGraphView *)self contentOffset];
  double v17 = v16;
  double v19 = v18;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v63 = 0u;
  [(HKGraphView *)self _xAxisCoordinateTransform];
  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  uint64_t v21 = [v41 currentSeries];
  uint64_t v22 = [v21 countByEnumeratingWithState:&v59 objects:v66 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v60 != v23) {
          objc_enumerationMutation(v21);
        }
        CGRect v25 = *(void **)(*((void *)&v59 + 1) + 8 * i);
        int64_t v26 = [(HKGraphView *)self _resolutionFromSeries:v25];
        if ([v25 allowsSelection])
        {
          xAxis = self->_xAxis;
          long long v56 = v63;
          long long v57 = v64;
          long long v58 = v65;
          if (objc_msgSend(v25, "containsCoordinatesInChartRect:xAxis:zoomScale:resolution:contentOffset:xAxisTransform:", xAxis, v26, &v56, v7, v9, v11, v13, v15, v17, v19))objc_msgSend(v20, "addObject:", v25); {
        }
          }
      }
      uint64_t v22 = [v21 countByEnumeratingWithState:&v59 objects:v66 count:16];
    }
    while (v22);
  }

  long long v40 = -[HKGraphView _closestSeriesToPoint:allSeries:](self, "_closestSeriesToPoint:allSeries:", v20, a3.x, a3.y);
  [v20 removeObject:v40];
  CGRect v45 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v40, 0);
  v68.origin.double x = v7;
  v68.origin.double y = v9;
  v68.size.double width = v11;
  v68.size.double height = v13;
  double MinY = CGRectGetMinY(v68);
  v69.origin.double x = v7;
  v69.origin.double y = v9;
  v69.size.double width = v11;
  v69.size.double height = v13;
  double MaxY = CGRectGetMaxY(v69);
  if ([v20 count])
  {
    uint64_t v29 = (uint64_t)((MaxY - a3.y) / 15.0) - 1;
    uint64_t v30 = (uint64_t)((a3.y - MinY) / 15.0) - 1;
    uint64_t v43 = MEMORY[0x1E4F143A8];
    do
    {
      *(void *)&long long v56 = 0;
      *((void *)&v56 + 1) = &v56;
      long long v57 = 0x2020000000uLL;
      v55[0] = 0;
      v55[1] = v55;
      v55[2] = 0x2020000000;
      v55[3] = 0x7FEFFFFFFFFFFFFFLL;
      uint64_t v51 = 0;
      BOOL v52 = &v51;
      uint64_t v53 = 0x2020000000;
      char v54 = 0;
      v46[0] = v43;
      v46[1] = 3221225472;
      v46[2] = __53__HKGraphView__handleStartTouchPoint_seriesGroupRow___block_invoke;
      v46[3] = &unk_1E6D51DD8;
      *(double *)&v46[8] = v7;
      *(double *)&v46[9] = v9;
      *(double *)&v46[10] = v11;
      *(double *)&v46[11] = v13;
      *(double *)&v46[12] = v15;
      *(double *)&v46[13] = v17;
      long long v48 = v64;
      long long v49 = v65;
      long long v47 = v63;
      *(double *)&v46[14] = v19;
      CGPoint v50 = a3;
      v46[4] = self;
      v46[5] = v55;
      v46[6] = &v56;
      v46[7] = &v51;
      [v20 enumerateObjectsUsingBlock:v46];
      id v31 = [v20 objectAtIndexedSubscript:*(void *)(*((void *)&v56 + 1) + 24)];
      [v20 removeObjectAtIndex:*(void *)(*((void *)&v56 + 1) + 24)];
      if (*((unsigned char *)v52 + 24))
      {
        BOOL v32 = v30 <= 0;
        v30 -= v30 > 0;
        if (v32) {
          goto LABEL_17;
        }
      }
      else if (v29 > 0)
      {
LABEL_17:
        uint64_t v33 = [v45 count];
        --v29;
        goto LABEL_18;
      }
      uint64_t v33 = 0;
LABEL_18:
      [v45 insertObject:v31 atIndex:v33];

      _Block_object_dispose(&v51, 8);
      _Block_object_dispose(v55, 8);
      _Block_object_dispose(&v56, 8);
    }
    while ([v20 count]);
  }
  uint64_t v34 = [v45 indexOfObject:v40];
  unint64_t v35 = [v45 count];
  long long v36 = objc_alloc_init(_HKGraphViewSelectionContext);
  [v41 setSelectionContext:v36];

  long long v37 = [v41 selectionContext];
  [v37 setSelectionState:1];

  long long v38 = [v41 selectionContext];
  objc_msgSend(v38, "setSeriesSelectionRect:", a3.x + -20.0, a3.y + (double)v34 * -15.0 + -7.5, 40.0, (double)v35 * 15.0);

  long long v39 = [v41 selectionContext];
  [v39 setSelectionAreaMapping:v45];
}

void __53__HKGraphView__handleStartTouchPoint_seriesGroupRow___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v30 = 0;
  id v31 = (double *)&v30;
  uint64_t v32 = 0x2020000000;
  uint64_t v33 = 0x7FEFFFFFFFFFFFFFLL;
  uint64_t v26 = 0;
  int64_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v6 = [*(id *)(a1 + 32) _resolutionFromSeries:v5];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 536);
  double v8 = *(double *)(a1 + 96);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __53__HKGraphView__handleStartTouchPoint_seriesGroupRow___block_invoke_2;
  v19[3] = &unk_1E6D51DB0;
  id v9 = v5;
  long long v23 = *(_OWORD *)(a1 + 168);
  long long v24 = *(_OWORD *)(a1 + 64);
  long long v25 = *(_OWORD *)(a1 + 80);
  id v20 = v9;
  uint64_t v21 = &v30;
  uint64_t v22 = &v26;
  double v10 = *(double *)(a1 + 64);
  double v11 = *(double *)(a1 + 72);
  double v12 = *(double *)(a1 + 80);
  double v13 = *(double *)(a1 + 88);
  double v14 = *(double *)(a1 + 104);
  double v15 = *(double *)(a1 + 112);
  long long v16 = *(_OWORD *)(a1 + 136);
  v18[0] = *(_OWORD *)(a1 + 120);
  v18[1] = v16;
  v18[2] = *(_OWORD *)(a1 + 152);
  objc_msgSend(v9, "enumerateCoordinatesInChartRect:xAxis:zoomScale:resolution:contentOffset:xAxisTransform:roundToViewScale:exclusionOptions:block:", v7, v6, v18, 1, 0, v19, v10, v11, v12, v13, v8, v14, v15);
  double v17 = v31[3];
  if (v17 < *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v17;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *((unsigned char *)v27 + 24);
  }

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);
}

void __53__HKGraphView__handleStartTouchPoint_seriesGroupRow___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  objc_msgSend(*(id *)(a1 + 32), "distanceFromPoint:blockCoordinate:chartRect:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  if (v4 < *(double *)(v5 + 24))
  {
    *(double *)(v5 + 24) = v4;
    objc_msgSend(*(id *)(a1 + 32), "yAxisDifferenceToPoint:blockCoordinate:chartRect:", v7, *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v6 < 0.0;
  }
}

- (CGAffineTransform)_xAxisCoordinateTransformWithContentOffset:(SEL)a3 zoomScale:(CGPoint)a4 chartRect:(double)a5
{
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  memset(&v20, 0, sizeof(v20));
  CGAffineTransformMakeTranslation(&v20, -a4.x, 0.0);
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  CGFloat MinX = CGRectGetMinX(v21);
  CGAffineTransform t1 = v20;
  CGAffineTransformTranslate(&v19, &t1, MinX, 0.0);
  CGAffineTransform v20 = v19;
  CGAffineTransform t1 = v19;
  CGAffineTransformScale(&v19, &t1, a5, 1.0);
  CGAffineTransform v20 = v19;
  memset(&v19, 0, sizeof(v19));
  [(HKAxis *)self->_xAxis pointTransform];
  HKAffineTransformFromLinearTransforms((uint64_t)&v19, v14, v15, 0.0, 1.0);
  CGAffineTransform t1 = v19;
  CGAffineTransform v17 = v20;
  return CGAffineTransformConcat(retstr, &t1, &v17);
}

- (CGAffineTransform)_xAxisCoordinateTransform
{
  [(HKGraphView *)self contentOffset];
  double v5 = v4;
  double v7 = v6;
  [(HKGraphView *)self zoomScale];
  double v9 = v8;
  [(HKGraphView *)self _dataAreaRect];
  return -[HKGraphView _xAxisCoordinateTransformWithContentOffset:zoomScale:chartRect:](self, "_xAxisCoordinateTransformWithContentOffset:zoomScale:chartRect:", v5, v7, v9, v10, v11, v12, v13);
}

- (id)_valueForXAxisLocation:(double)a3
{
  memset(&v10, 0, sizeof(v10));
  [(HKGraphView *)self _xAxisCoordinateTransform];
  CGAffineTransformInvert(&v10, &v9);
  double v5 = round((v10.tx + v10.c * 0.0 + v10.a * a3) * 864000.0) / 864000.0;
  double v6 = [(HKAxis *)self->_xAxis transform];
  double v7 = [v6 valueForCoordinate:v5];

  return v7;
}

- (void)_updateSelectionContextStateWithTouchPoint:(CGPoint)a3 seriesGroup:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v12 = a4;
  uint64_t v7 = [(HKGraphView *)self _currentSelectionStateForSeriesGroup:v12];
  id v8 = v12;
  if (v7 != 2)
  {
    uint64_t v9 = v7;
    uint64_t v7 = -[HKGraphView _closestGraphSeriesForTouchPoint:seriesGroup:](self, "_closestGraphSeriesForTouchPoint:seriesGroup:", v12, x, y);
    if (v7)
    {
      CGAffineTransform v10 = (void *)v7;
      double v11 = [v12 selectionContext];
      [v11 setClosestSeriesToSelection:v10];
    }
    else
    {
      id v8 = v12;
      if (v9 != 1) {
        goto LABEL_7;
      }
      CGAffineTransform v10 = [v12 selectionContext];
      [v10 setSelectionState:2];
    }

    id v8 = v12;
  }
LABEL_7:
  MEMORY[0x1F41817F8](v7, v8);
}

- ($352843287EF74459AF23949619AEBC4C)_closestDataPointPathToPoint:(SEL)a3 seriesGroupRow:(CGPoint)a4 seriesInGroup:(int64_t)a5 minimumXDistance:(id)a6 xDistanceOut:(double)a7
{
  id v12 = a6;
  int64_t v13 = [(HKGraphView *)self _resolutionFromSeries:v12];
  [(HKGraphView *)self _dataAreaRect];
  -[HKGraphView _yAxisRectForSeriesGroupRow:chartRect:](self, "_yAxisRectForSeriesGroupRow:chartRect:", a5);
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  [(HKGraphView *)self _virtualMarginInsets];
  double v21 = v20;
  [(HKGraphView *)self _virtualMarginInsets];
  double v23 = v22;
  [(HKGraphView *)self _virtualMarginInsets];
  double v25 = v24;
  uint64_t v60 = 0;
  long long v61 = (double *)&v60;
  uint64_t v62 = 0x2020000000;
  uint64_t v63 = 0x7FEFFFFFFFFFFFFFLL;
  v59[0] = 0;
  v59[1] = v59;
  v59[2] = 0x2020000000;
  v59[3] = 0x7FEFFFFFFFFFFFFFLL;
  v57[0] = 0;
  v57[1] = v57;
  v57[2] = 0x2020000000;
  char v58 = 0;
  uint64_t v51 = 0;
  BOOL v52 = &v51;
  uint64_t v53 = 0x4010000000;
  char v54 = &unk_1E0F50A5E;
  long long v55 = HKGraphSeriesDataPointPathNone;
  long long v56 = unk_1E0F05AE0;
  xAxis = self->_xAxis;
  [(HKGraphView *)self zoomScale];
  double v35 = v27;
  [(HKGraphView *)self contentOffset];
  double v29 = v28;
  double v31 = v30;
  [(HKGraphView *)self _xAxisCoordinateTransform];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __103__HKGraphView__closestDataPointPathToPoint_seriesGroupRow_seriesInGroup_minimumXDistance_xDistanceOut___block_invoke;
  v38[3] = &unk_1E6D51E00;
  id v32 = v12;
  CGPoint v44 = a4;
  double v45 = v21;
  double v46 = v15;
  double v47 = v17 - (v23 + v25);
  double v48 = v19;
  double v49 = a7;
  id v39 = v32;
  long long v40 = &v60;
  long long v41 = v57;
  long long v42 = v59;
  uint64_t v43 = &v51;
  objc_msgSend(v32, "enumerateCoordinatesInChartRect:xAxis:zoomScale:resolution:contentOffset:xAxisTransform:roundToViewScale:exclusionOptions:block:", xAxis, v13, v50, 0, 2, v38, v21, v15, v47, v19, v35, v29, v31);
  if (a8) {
    *a8 = v61[3];
  }
  long long v33 = *((_OWORD *)v52 + 3);
  *(_OWORD *)&retstr->var0.indedouble x = *((_OWORD *)v52 + 2);
  *(_OWORD *)&retstr->var0.resolution = v33;

  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(v57, 8);
  _Block_object_dispose(v59, 8);
  _Block_object_dispose(&v60, 8);

  return result;
}

void __103__HKGraphView__closestDataPointPathToPoint_seriesGroupRow_seriesInGroup_minimumXDistance_xDistanceOut___block_invoke(uint64_t a1, uint64_t a2, void *a3, _OWORD *a4)
{
  double v6 = *(void **)(a1 + 32);
  double v7 = *(double *)(a1 + 72);
  double v8 = *(double *)(a1 + 80);
  double v9 = *(double *)(a1 + 88);
  double v10 = *(double *)(a1 + 96);
  double v11 = *(double *)(a1 + 104);
  double v12 = *(double *)(a1 + 112);
  id v13 = a3;
  objc_msgSend(v6, "xAxisDistanceFromPoint:blockCoordinate:chartRect:", v13, v7, v8, v9, v10, v11, v12);
  double v15 = v14;
  objc_msgSend(*(id *)(a1 + 32), "yAxisDifferenceToPoint:blockCoordinate:chartRect:", v13, *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112));
  double v17 = v16;

  if (v15 <= *(double *)(a1 + 120))
  {
    double v18 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    if (v15 <= v18)
    {
      double v19 = fabs(v17);
      if (v15 < v18 || HKUIEqualDoubles(v15, v18) && v19 < *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      }
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
      {
        *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v15;
        *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v19;
        uint64_t v20 = *(void *)(*(void *)(a1 + 64) + 8);
        long long v21 = a4[1];
        *(_OWORD *)(v20 + 32) = *a4;
        *(_OWORD *)(v20 + 48) = v21;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
      }
    }
  }
}

- ($352843287EF74459AF23949619AEBC4C)_closestDataPointPathToPoint:(SEL)a3 seriesGroupRow:(CGPoint)a4 minimumXDistance:(int64_t)a5 xDistanceOut:(double)a6
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  id v13 = -[NSMutableArray objectAtIndexedSubscript:](self->_seriesGroupRows, "objectAtIndexedSubscript:");
  [(HKGraphView *)self _dataAreaRect];
  -[HKGraphView _yAxisRectForSeriesGroupRow:chartRect:](self, "_yAxisRectForSeriesGroupRow:chartRect:", a5);
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  [(HKGraphView *)self _virtualMarginInsets];
  double v21 = v20;
  [(HKGraphView *)self _virtualMarginInsets];
  double v23 = v22;
  [(HKGraphView *)self _virtualMarginInsets];
  double v25 = v24;
  uint64_t v26 = [v13 selectionContext];
  double v27 = [v26 closestSeriesToSelection];

  if (v27)
  {
    CGFloat v38 = y;
    double v39 = a6;
    int64_t v28 = [(HKGraphView *)self _resolutionFromSeries:v27];
    uint64_t v64 = 0;
    long long v65 = (double *)&v64;
    uint64_t v66 = 0x2020000000;
    uint64_t v67 = 0x7FEFFFFFFFFFFFFFLL;
    v63[0] = 0;
    v63[1] = v63;
    v63[2] = 0x2020000000;
    v63[3] = 0x7FEFFFFFFFFFFFFFLL;
    v61[0] = 0;
    v61[1] = v61;
    v61[2] = 0x2020000000;
    char v62 = 0;
    uint64_t v55 = 0;
    long long v56 = &v55;
    uint64_t v57 = 0x4010000000;
    char v58 = &unk_1E0F50A5E;
    long long v59 = HKGraphSeriesDataPointPathNone;
    long long v60 = unk_1E0F05AE0;
    xAxis = self->_xAxis;
    [(HKGraphView *)self zoomScale];
    double v37 = v30;
    [(HKGraphView *)self contentOffset];
    double v32 = v31;
    double v34 = v33;
    [(HKGraphView *)self _xAxisCoordinateTransform];
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __89__HKGraphView__closestDataPointPathToPoint_seriesGroupRow_minimumXDistance_xDistanceOut___block_invoke;
    v41[3] = &unk_1E6D51E00;
    CGFloat v47 = x;
    CGFloat v48 = v38;
    double v49 = v21;
    double v50 = v15;
    double v51 = v17 - (v23 + v25);
    double v52 = v19;
    double v53 = v39;
    id v42 = v27;
    uint64_t v43 = &v64;
    CGPoint v44 = v61;
    double v45 = v63;
    double v46 = &v55;
    objc_msgSend(v42, "enumerateCoordinatesInChartRect:xAxis:zoomScale:resolution:contentOffset:xAxisTransform:roundToViewScale:exclusionOptions:block:", xAxis, v28, v54, 0, 2, v41, v21, v15, v51, v19, v37, v32, v34);
    if (a7) {
      *a7 = v65[3];
    }
    long long v35 = *((_OWORD *)v56 + 3);
    *(_OWORD *)&retstr->var0.indeCGFloat x = *((_OWORD *)v56 + 2);
    *(_OWORD *)&retstr->var0.resolution = v35;

    _Block_object_dispose(&v55, 8);
    _Block_object_dispose(v61, 8);
    _Block_object_dispose(v63, 8);
    _Block_object_dispose(&v64, 8);
  }
  else
  {
    if (a7) {
      *a7 = 1.79769313e308;
    }
    *(_OWORD *)&retstr->var0.indeCGFloat x = HKGraphSeriesDataPointPathNone;
    *(_OWORD *)&retstr->var0.resolution = unk_1E0F05AE0;
  }

  return result;
}

void __89__HKGraphView__closestDataPointPathToPoint_seriesGroupRow_minimumXDistance_xDistanceOut___block_invoke(uint64_t a1, uint64_t a2, void *a3, _OWORD *a4)
{
  double v6 = *(void **)(a1 + 32);
  double v7 = *(double *)(a1 + 72);
  double v8 = *(double *)(a1 + 80);
  double v9 = *(double *)(a1 + 88);
  double v10 = *(double *)(a1 + 96);
  double v11 = *(double *)(a1 + 104);
  double v12 = *(double *)(a1 + 112);
  id v13 = a3;
  objc_msgSend(v6, "xAxisDistanceFromPoint:blockCoordinate:chartRect:", v13, v7, v8, v9, v10, v11, v12);
  double v15 = v14;
  objc_msgSend(*(id *)(a1 + 32), "yAxisDifferenceToPoint:blockCoordinate:chartRect:", v13, *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112));
  double v17 = v16;

  if (v15 <= *(double *)(a1 + 120))
  {
    double v18 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    if (v15 <= v18)
    {
      double v19 = fabs(v17);
      if (v15 < v18 || HKUIEqualDoubles(v15, v18) && v19 < *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      }
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
      {
        *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v15;
        *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v19;
        uint64_t v20 = *(void *)(*(void *)(a1 + 64) + 8);
        long long v21 = a4[1];
        *(_OWORD *)(v20 + 32) = *a4;
        *(_OWORD *)(v20 + 48) = v21;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
      }
    }
  }
}

- (void)_selectionRecognizerDidMove:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  double v4 = [a3 orderedTouches];
  double v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = (void *)MEMORY[0x1E4F29238];
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10), "locationInView:", self->_renderView, (void)v13);
        double v12 = objc_msgSend(v11, "valueWithCGPoint:");
        [v5 addObject:v12];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  [(HKGraphView *)self _cancelExternalSelection];
  [(HKGraphView *)self _selectionRecognizerDidMoveWithTouchPoints:v5];
}

- (void)_resetSingleSelectionXValue
{
}

- (BOOL)_selectionContextsNotPreviouslySelected:(id)a3
{
  double v4 = [a3 firstObject];
  double v5 = v4;
  if (v4)
  {
    id v6 = [v4 selectedRangeXValues];

    if (v6)
    {
      BOOL v7 = [(HKGraphView *)self _stickySelectionActive];
      uint64_t v8 = [v5 selectedRangeXValues];
      uint64_t v9 = [v8 minValue];
      [v9 doubleValue];
      double v11 = v10;

      if (v7)
      {
        [(HKGraphView *)self lastSingleSelectionXValue];
        if (vabdd_f64(v11, v12) <= 0.00000011920929)
        {
          [(HKGraphView *)self _resetSingleSelectionXValue];
          BOOL v13 = 0;
          goto LABEL_7;
        }
      }
      [(HKGraphView *)self setLastSingleSelectionXValue:v11];
    }
  }
  BOOL v13 = 1;
LABEL_7:

  return v13;
}

- (void)_selectionRecognizerDidMoveWithTouchPoints:(id)a3
{
  id v4 = [(HKGraphView *)self _newPointSelectionContextsWithTouchPoints:a3 updateViewStates:1];
  if ([v4 count]
    && [(HKGraphView *)self _selectionContextsNotPreviouslySelected:v4])
  {
    [(HKGraphView *)self _notifyDidUpdateSelectionWithPointContext:v4];
  }
  else
  {
    [(HKGraphView *)self _finishSelection];
  }
  [(HKGraphRenderer *)self->_renderView setNeedsRender];
}

- (id)_multiSeriesSelectionContextsWithTouchPoints:(id)a3 updateViewStates:(BOOL)a4
{
  BOOL v66 = a4;
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 firstObject];
  [v6 CGPointValue];
  double v8 = v7;
  double v10 = v9;

  unint64_t v68 = [v5 count];
  CGRect v69 = self;
  if (v68 <= 1)
  {
    double v13 = *MEMORY[0x1E4F1DAD8];
    double v15 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  else
  {
    double v11 = [v5 lastObject];
    [v11 CGPointValue];
    double v13 = v12;
    double v15 = v14;

    self = v69;
  }
  uint64_t v70 = v5;
  id v67 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([(NSMutableArray *)self->_seriesGroupRows count])
  {
    unint64_t v16 = 0;
    do
    {
      double v17 = [(NSMutableArray *)self->_seriesGroupRows objectAtIndexedSubscript:v16];
      if (v66) {
        -[HKGraphView _updateSelectionContextStateWithTouchPoint:seriesGroup:](self, "_updateSelectionContextStateWithTouchPoint:seriesGroup:", v17, v8, v10);
      }
      uint64_t v18 = [v17 selectionContext];
      [v18 setSelectedRangeBoundariesXValue:0];

      long long v91 = 0u;
      long long v92 = 0u;
      long long v89 = 0u;
      long long v90 = 0u;
      double v19 = [v17 currentSeries];
      uint64_t v20 = [v19 countByEnumeratingWithState:&v89 objects:v95 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v90;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v90 != v22) {
              objc_enumerationMutation(v19);
            }
            double v24 = *(void **)(*((void *)&v89 + 1) + 8 * i);
            if ([v24 allowsSelection])
            {
              double v87 = 1.79769313e308;
              double v88 = 1.79769313e308;
              long long v85 = 0u;
              long long v86 = 0u;
              double v25 = [v17 selectionContext];
              [v25 minimumSelectionDistance];
              -[HKGraphView _closestDataPointPathToPoint:seriesGroupRow:seriesInGroup:minimumXDistance:xDistanceOut:](self, "_closestDataPointPathToPoint:seriesGroupRow:seriesInGroup:minimumXDistance:xDistanceOut:", v16, v24, &v88, v8, v10, v26);

              long long v83 = v85;
              long long v84 = v86;
              if (v68 >= 2)
              {
                double v27 = [v17 selectionContext];
                int64_t v28 = [v27 closestSeriesToSelection];
                double v29 = [v17 selectionContext];
                [v29 minimumSelectionDistance];
                -[HKGraphView _closestDataPointPathToPoint:seriesGroupRow:seriesInGroup:minimumXDistance:xDistanceOut:](v69, "_closestDataPointPathToPoint:seriesGroupRow:seriesInGroup:minimumXDistance:xDistanceOut:", v16, v28, &v87, v13, v15, v30);

                self = v69;
              }
              long long v79 = v85;
              long long v80 = v86;
              long long v75 = HKGraphSeriesDataPointPathNone;
              long long v76 = unk_1E0F05AE0;
              if (!HKGraphSeriesDataPointPathEqualToPath(&v79, &v75))
              {
                long long v79 = v85;
                long long v80 = v86;
                long long v81 = v83;
                long long v82 = v84;
                long long v75 = v85;
                long long v76 = v86;
                long long v77 = v83;
                long long v78 = v84;
                double v31 = [(HKGraphView *)self _pointSelectionContextWithPathRange:&v75 touchPoints:v70 seriesGroupRow:v16 seriesInGroup:v24];
                [v31 setXDistanceFromFirstTouchPoint:v88];
                [v31 setXDistanceFromSecondTouchPoint:v87];
                [v67 addObject:v31];
              }
            }
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v89 objects:v95 count:16];
        }
        while (v21);
      }

      ++v16;
    }
    while (v16 < [(NSMutableArray *)self->_seriesGroupRows count]);
  }
  id v32 = v67;
  uint64_t v33 = [(NSMutableArray *)self->_seriesGroupRows count];
  double v34 = self;
  long long v35 = v32;
  if (v33)
  {
    unint64_t v36 = 0;
    long long v35 = v32;
    while (1)
    {
      double v37 = [(NSMutableArray *)v34->_seriesGroupRows objectAtIndexedSubscript:v36];
      long long v71 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      CGFloat v38 = [v37 currentSeries];
      uint64_t v39 = [v38 countByEnumeratingWithState:&v71 objects:v94 count:16];
      if (!v39) {
        goto LABEL_35;
      }
      uint64_t v40 = v39;
      char v41 = 0;
      uint64_t v42 = *(void *)v72;
      do
      {
        uint64_t v43 = 0;
        CGPoint v44 = v35;
        do
        {
          if (*(void *)v72 != v42) {
            objc_enumerationMutation(v38);
          }
          double v45 = *(void **)(*((void *)&v71 + 1) + 8 * v43);
          LOBYTE(v79) = 0;
          long long v35 = [v45 filteredPointSelectionContexts:v44 forTouchPoints:v70 resultsDidChange:&v79];

          v41 |= (_BYTE)v79 != 0;
          ++v43;
          CGPoint v44 = v35;
        }
        while (v40 != v43);
        uint64_t v40 = [v38 countByEnumeratingWithState:&v71 objects:v94 count:16];
      }
      while (v40);

      if ((v41 & 1) == 0) {
        goto LABEL_36;
      }
      CGFloat v38 = [v37 selectionContext];
      uint64_t v46 = [v38 closestSeriesToSelection];
      if (!v46) {
        goto LABEL_35;
      }
      CGFloat v47 = (void *)v46;
      uint64_t v48 = [v35 count];

      if (v48 == 1) {
        break;
      }
LABEL_36:

      ++v36;
      double v34 = v69;
      if (v36 >= [(NSMutableArray *)v69->_seriesGroupRows count]) {
        goto LABEL_37;
      }
    }
    double v49 = [v35 objectAtIndexedSubscript:0];
    double v50 = [v49 selectedSeries];
    double v51 = [v37 selectionContext];
    [v51 setClosestSeriesToSelection:v50];

    double v52 = [v35 objectAtIndexedSubscript:0];
    double v53 = [v52 selectedRangeXValues];
    char v54 = [v53 minValue];
    [v54 doubleValue];
    double v56 = v55 - v69->_hardLeftMarginWidth;

    uint64_t v57 = [v35 objectAtIndexedSubscript:0];
    char v58 = [v57 selectedRangeXValues];
    long long v59 = [v58 maxValue];
    [v59 doubleValue];
    double v61 = v60 - v69->_hardLeftMarginWidth;

    CGFloat v38 = [v37 selectionContext];
    char v62 = [NSNumber numberWithDouble:v56];
    v93[0] = v62;
    uint64_t v63 = [NSNumber numberWithDouble:v61];
    v93[1] = v63;
    uint64_t v64 = [MEMORY[0x1E4F1C978] arrayWithObjects:v93 count:2];
    [v38 setSelectedRangeBoundariesXValue:v64];

LABEL_35:
    goto LABEL_36;
  }
LABEL_37:

  return v35;
}

- (id)_oneSeriesSelectionContextsWithTouchPoints:(id)a3 updateViewStates:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = [v6 firstObject];
  [v7 CGPointValue];
  double v9 = v8;
  double v11 = v10;

  unint64_t v12 = [v6 count];
  if (v12 <= 1)
  {
    double v64 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    double v65 = *MEMORY[0x1E4F1DAD8];
  }
  else
  {
    double v13 = [v6 lastObject];
    [v13 CGPointValue];
    double v64 = v15;
    double v65 = v14;
  }
  uint64_t v63 = v6;
  id v62 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v91 = HKGraphSeriesDataPointPathNone;
  long long v92 = unk_1E0F05AE0;
  long long v89 = HKGraphSeriesDataPointPathNone;
  long long v90 = unk_1E0F05AE0;
  [(HKGraphView *)self _dataAreaRect];
  double v73 = v17;
  double v74 = v16;
  double v71 = v19;
  double v72 = v18;
  if ([(NSMutableArray *)self->_seriesGroupRows count])
  {
    unint64_t v68 = 0;
    unint64_t v20 = 0;
    uint64_t v66 = -1;
    double v69 = 1.79769313e308;
    double v70 = v11;
    double v67 = 1.79769313e308;
    do
    {
      uint64_t v21 = [(NSMutableArray *)self->_seriesGroupRows objectAtIndexedSubscript:v20];
      double v87 = 1.79769313e308;
      double v88 = 1.79769313e308;
      if (v4) {
        -[HKGraphView _updateSelectionContextStateWithTouchPoint:seriesGroup:](self, "_updateSelectionContextStateWithTouchPoint:seriesGroup:", v21, v9, v11);
      }
      uint64_t v22 = [v21 selectionContext];
      [v22 setSelectedRangeBoundariesXValue:0];

      -[HKGraphView _yAxisRectForSeriesGroupRow:insetForLegends:chartRect:](self, "_yAxisRectForSeriesGroupRow:insetForLegends:chartRect:", v20, 0, v74, v73, v72, v71);
      double v23 = v9;
      double v25 = v24;
      double v27 = v26;
      double v29 = v28;
      [(HKGraphView *)self _virtualMarginInsets];
      uint64_t v31 = v30;
      [(HKGraphView *)self _virtualMarginInsets];
      double v33 = v32;
      [(HKGraphView *)self _virtualMarginInsets];
      double v35 = v27 - (v33 + v34);
      unint64_t v36 = [(HKGraphView *)self delegate];
      int v37 = [v36 graphViewPointSelectionDifferentiatesSeriesGroups:self];

      if (v37) {
        double v38 = v25;
      }
      else {
        double v38 = v73;
      }
      double v9 = v23;
      double v11 = v70;
      if (v37) {
        double v39 = v29;
      }
      else {
        double v39 = v71;
      }
      uint64_t v40 = v31;
      double v41 = v35;
      v96.CGFloat x = v9;
      v96.CGFloat y = v70;
      if (CGRectContainsPoint(*(CGRect *)(&v38 - 1), v96))
      {
        long long v83 = 0u;
        long long v84 = 0u;
        uint64_t v42 = [v21 selectionContext];
        uint64_t v43 = [v42 closestSeriesToSelection];
        CGPoint v44 = [v21 selectionContext];
        [v44 minimumSelectionDistance];
        -[HKGraphView _closestDataPointPathToPoint:seriesGroupRow:seriesInGroup:minimumXDistance:xDistanceOut:](self, "_closestDataPointPathToPoint:seriesGroupRow:seriesInGroup:minimumXDistance:xDistanceOut:", v20, v43, &v88, v9, v70, v45);

        long long v79 = 0u;
        long long v80 = 0u;
        double v46 = v88;
        if (v88 >= v69)
        {
          double v46 = v69;
        }
        else
        {
          long long v91 = v83;
          long long v92 = v84;
          long long v89 = v83;
          long long v90 = v84;
          CGFloat v47 = [v21 selectionContext];
          uint64_t v48 = [v47 closestSeriesToSelection];

          uint64_t v66 = v20;
          unint64_t v68 = (void *)v48;
        }
        if (v12 >= 2)
        {
          double v49 = [v21 selectionContext];
          double v50 = [v49 closestSeriesToSelection];
          double v51 = [v21 selectionContext];
          [v51 minimumSelectionDistance];
          -[HKGraphView _closestDataPointPathToPoint:seriesGroupRow:seriesInGroup:minimumXDistance:xDistanceOut:](self, "_closestDataPointPathToPoint:seriesGroupRow:seriesInGroup:minimumXDistance:xDistanceOut:", v20, v50, &v87, v65, v64, v52);

          if (v87 < v67)
          {
            long long v89 = v79;
            long long v90 = v80;
            double v67 = v87;
          }
        }
        double v69 = v46;
      }

      ++v20;
    }
    while (v20 < [(NSMutableArray *)self->_seriesGroupRows count]);
  }
  else
  {
    unint64_t v68 = 0;
    uint64_t v66 = -1;
  }
  long long v83 = v91;
  long long v84 = v92;
  long long v79 = HKGraphSeriesDataPointPathNone;
  long long v80 = unk_1E0F05AE0;
  double v53 = v68;
  if (!HKGraphSeriesDataPointPathEqualToPath(&v83, &v79) && v68)
  {
    long long v83 = v91;
    long long v84 = v92;
    long long v85 = v89;
    long long v86 = v90;
    long long v79 = v91;
    long long v80 = v92;
    long long v81 = v89;
    long long v82 = v90;
    char v54 = [(HKGraphView *)self _pointSelectionContextWithPathRange:&v79 touchPoints:v63 seriesGroupRow:v66 seriesInGroup:v68];
    [v62 addObject:v54];
    if (v4)
    {
      double v55 = [(NSMutableArray *)self->_seriesGroupRows objectAtIndexedSubscript:v66];
      [(HKGraphViewSelectionStyle *)self->_selectionStyle unselectedSeriesAlpha];
      -[HKGraphView _deselectAllSeriesWithAlpha:offScreenIndicatorAlpha:seriesGroup:](self, "_deselectAllSeriesWithAlpha:offScreenIndicatorAlpha:seriesGroup:", v55);
      [v68 setAlpha:1.0];
      [v68 setOffscreenIndicatorAlpha:1.0];
      if ([(HKGraphView *)self moveSelectedSeriesToFront]) {
        [(HKGraphView *)self _moveSeriesToFront:v68];
      }
      long long v77 = 0u;
      long long v78 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      double v56 = self->_seriesGroupRows;
      uint64_t v57 = [(NSMutableArray *)v56 countByEnumeratingWithState:&v75 objects:v93 count:16];
      if (v57)
      {
        uint64_t v58 = v57;
        uint64_t v59 = *(void *)v76;
        do
        {
          for (uint64_t i = 0; i != v58; ++i)
          {
            if (*(void *)v76 != v59) {
              objc_enumerationMutation(v56);
            }
            if (v55 != *(void **)(*((void *)&v75 + 1) + 8 * i)) {
              -[HKGraphView _finishSelectionForSeriesGroup:](self, "_finishSelectionForSeriesGroup:");
            }
          }
          uint64_t v58 = [(NSMutableArray *)v56 countByEnumeratingWithState:&v75 objects:v93 count:16];
        }
        while (v58);
      }

      double v53 = v68;
    }
  }
  return v62;
}

- (id)_newPointSelectionContextsWithTouchPoints:(id)a3 updateViewStates:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([v6 count])
  {
    if ([(HKGraphView *)self multiSeriesSelection]) {
      [(HKGraphView *)self _multiSeriesSelectionContextsWithTouchPoints:v6 updateViewStates:v4];
    }
    else {
    double v7 = [(HKGraphView *)self _oneSeriesSelectionContextsWithTouchPoints:v6 updateViewStates:v4];
    }
  }
  else
  {
    double v7 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v7;
}

- (id)_pointSelectionContextWithPathRange:(id *)a3 touchPoints:(id)a4 seriesGroupRow:(int64_t)a5 seriesInGroup:(id)a6
{
  v106[2] = *MEMORY[0x1E4F143B8];
  id v80 = a4;
  id v10 = a6;
  [(HKGraphView *)self _dataAreaRect];
  -[HKGraphView _yAxisRectForSeriesGroupRow:chartRect:](self, "_yAxisRectForSeriesGroupRow:chartRect:", a5);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  long long v79 = [(NSMutableArray *)self->_seriesGroupRows objectAtIndexedSubscript:a5];
  int64_t v19 = [(HKGraphView *)self _resolutionFromSeries:v10];
  uint64_t v100 = 0;
  v101 = &v100;
  uint64_t v102 = 0x3032000000;
  v103 = __Block_byref_object_copy__2;
  v104 = __Block_byref_object_dispose__2;
  id v105 = 0;
  uint64_t v94 = 0;
  v95 = &v94;
  uint64_t v96 = 0x3032000000;
  v97 = __Block_byref_object_copy__2;
  v98 = __Block_byref_object_dispose__2;
  id v99 = 0;
  uint64_t v88 = 0;
  long long v89 = &v88;
  uint64_t v90 = 0x3032000000;
  long long v91 = __Block_byref_object_copy__2;
  long long v92 = __Block_byref_object_dispose__2;
  id v93 = (id)objc_opt_new();
  xAxis = self->_xAxis;
  [(HKGraphView *)self zoomScale];
  double v22 = v21;
  [(HKGraphView *)self contentOffset];
  double v24 = v23;
  double v26 = v25;
  [(HKGraphView *)self _xAxisCoordinateTransform];
  v82[0] = MEMORY[0x1E4F143A8];
  v82[1] = 3221225472;
  long long v27 = *(_OWORD *)&a3->var0.var0.resolution;
  long long v83 = *(_OWORD *)&a3->var0.var0.index;
  long long v84 = v27;
  long long v28 = *(_OWORD *)&a3->var1.var0.resolution;
  long long v85 = *(_OWORD *)&a3->var1.var0.index;
  v82[2] = __92__HKGraphView__pointSelectionContextWithPathRange_touchPoints_seriesGroupRow_seriesInGroup___block_invoke;
  v82[3] = &unk_1E6D51E28;
  long long v86 = v28;
  v82[4] = &v100;
  v82[5] = &v94;
  v82[6] = &v88;
  objc_msgSend(v10, "enumerateCoordinatesInChartRect:xAxis:zoomScale:resolution:contentOffset:xAxisTransform:roundToViewScale:exclusionOptions:block:", xAxis, v19, v87, 0, 2, v82, v12, v14, v16, v18, v22, v24, v26);
  double v29 = [v80 firstObject];
  [v29 CGPointValue];
  double v31 = v30;

  unint64_t v32 = [v80 count];
  if (v32 < 2)
  {
    double v35 = *MEMORY[0x1E4F1DAD8];
  }
  else
  {
    double v33 = [v80 lastObject];
    [v33 CGPointValue];
    double v35 = v34;
  }
  unint64_t v36 = [NSNumber numberWithInteger:a3->var0.var1];
  int v37 = [NSNumber numberWithInteger:a3->var1.var1];
  long long v78 = +[HKValueRange valueRangeWithMinValue:v36 maxValue:v37];

  if (v101[5])
  {
    objc_msgSend(v10, "xAxisSelectedCoordinate:blockCoordinate:chartRect:", v31, v12, v14, v16, v18);
    double v39 = v38;
    objc_msgSend(v10, "xAxisSelectedCoordinate:blockCoordinate:chartRect:", v95[5], v31, v12, v14, v16, v18);
    double v41 = v40;
    if (v32 >= 2)
    {
      objc_msgSend(v10, "xAxisSelectedCoordinate:blockCoordinate:chartRect:", v95[5], v35, v12, v14, v16, v18);
      double v41 = v42;
    }
    uint64_t v43 = [NSNumber numberWithDouble:v39];
    CGPoint v44 = [NSNumber numberWithDouble:v41];
    double v45 = +[HKValueRange valueRangeWithMinValue:v43 maxValue:v44];

    [(id)v101[5] startXValue];
    double v47 = v46;
    [(id)v95[5] endXValue];
    double v49 = v48;
    if (HKUIEqualCGFloats(v47, v48))
    {
      double v50 = [(HKGraphView *)self _valueForXAxisLocation:v47];
      double v51 = +[HKValueRange valueRangeWithMinValue:v50 maxValue:v50];
    }
    else
    {
      double v50 = [(HKGraphView *)self _valueForXAxisLocation:v47];
      double v52 = [(HKGraphView *)self _valueForXAxisLocation:v49];
      double v51 = +[HKValueRange valueRangeWithMinValue:v50 maxValue:v52];
    }
  }
  else
  {
    double v51 = 0;
    double v45 = 0;
  }
  double v53 = [v45 minValue];
  if (!v53
    || ([v45 maxValue],
        char v54 = objc_claimAutoreleasedReturnValue(),
        BOOL v55 = v54 == 0,
        v54,
        v53,
        v55))
  {
    double v56 = [v79 selectionContext];
    [v56 setSelectedRangeBoundariesXValue:0];
  }
  else
  {
    double v56 = [v79 selectionContext];
    uint64_t v57 = [v45 minValue];
    v106[0] = v57;
    uint64_t v58 = [v45 maxValue];
    v106[1] = v58;
    uint64_t v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:v106 count:2];
    [v56 setSelectedRangeBoundariesXValue:v59];
  }
  long long v60 = *(_OWORD *)&a3->var0.var0.resolution;
  v81[0] = *(_OWORD *)&a3->var0.var0.index;
  v81[1] = v60;
  long long v61 = *(_OWORD *)&a3->var1.var0.resolution;
  v81[2] = *(_OWORD *)&a3->var1.var0.index;
  v81[3] = v61;
  [v10 selectPathsinPathRange:v81 coordinateRange:v45];
  id v62 = [v79 selectionContext];
  [v62 setTouchPoints:v80];

  uint64_t v63 = objc_alloc_init(HKGraphViewPointSelectionContext);
  [(HKGraphViewPointSelectionContext *)v63 setSelectedSeries:v10];
  double v64 = [v45 minValue];
  [v64 doubleValue];
  double v66 = v65;
  hardLeftMargindouble Width = self->_hardLeftMarginWidth;

  unint64_t v68 = [v45 maxValue];
  [v68 doubleValue];
  double v70 = v69;
  double v71 = self->_hardLeftMarginWidth;

  double v72 = [NSNumber numberWithDouble:v66 + hardLeftMarginWidth];
  double v73 = [NSNumber numberWithDouble:v70 + v71];
  double v74 = +[HKValueRange valueRangeWithMinValue:v72 maxValue:v73];

  [(HKGraphViewPointSelectionContext *)v63 setSelectedRangeXValues:v74];
  [(HKGraphViewPointSelectionContext *)v63 setSelectedPathIndexRange:v78];
  [(HKGraphViewPointSelectionContext *)v63 setUserInfo:v89[5]];
  long long v75 = +[HKGraphZoomLevelConfiguration configurationForZoomLevel:self->_xAxisDateZoom];
  long long v76 = [v75 seriesPointIntervalComponentsAtResolution:v19];
  [(HKGraphViewPointSelectionContext *)v63 setPointIntervalComponents:v76];

  [(HKGraphViewPointSelectionContext *)v63 setSelectedPointValueRange:v51];
  _Block_object_dispose(&v88, 8);

  _Block_object_dispose(&v94, 8);
  _Block_object_dispose(&v100, 8);

  return v63;
}

void __92__HKGraphView__pointSelectionContextWithPathRange_touchPoints_seriesGroupRow_seriesInGroup___block_invoke(uint64_t a1, uint64_t a2, void *a3, long long *a4)
{
  id v7 = a3;
  long long v8 = *(_OWORD *)(a1 + 72);
  long long v18 = *(_OWORD *)(a1 + 56);
  long long v19 = v8;
  long long v9 = a4[1];
  long long v22 = *a4;
  long long v23 = v9;
  if (HKGraphSeriesDataPointPathEqualToPath(&v18, &v22)) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  }
  long long v10 = *(_OWORD *)(a1 + 104);
  long long v18 = *(_OWORD *)(a1 + 88);
  long long v19 = v10;
  long long v11 = a4[1];
  long long v22 = *a4;
  long long v23 = v11;
  if (HKGraphSeriesDataPointPathEqualToPath(&v18, &v22)) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  long long v12 = a4[1];
  long long v22 = *a4;
  long long v23 = v12;
  long long v13 = *(_OWORD *)(a1 + 72);
  long long v18 = *(_OWORD *)(a1 + 56);
  long long v19 = v13;
  long long v14 = *(_OWORD *)(a1 + 104);
  long long v20 = *(_OWORD *)(a1 + 88);
  long long v21 = v14;
  if (HKGraphSeriesDataPointPathInRangeInclusive((uint64_t *)&v22, (uint64_t *)&v18))
  {
    double v15 = [v7 userInfo];

    if (v15)
    {
      double v16 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      double v17 = [v7 userInfo];
      [v16 addObject:v17];
    }
  }
}

- (void)_deselectAllSeriesWithAlpha:(double)a3 offScreenIndicatorAlpha:(double)a4 seriesGroup:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = objc_msgSend(a5, "currentSeries", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        [v12 setAlpha:a3];
        [v12 setOffscreenIndicatorAlpha:a4];
        [v12 deselectPath];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)_finishSelectionForSeriesGroup:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = objc_msgSend(a3, "currentSeries", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) finishSelection];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_finishSelection
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [(HKGraphView *)self _updateAllLegendsWithSelectedValues:0];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = self->_seriesGroupRows;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    char v6 = 0;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        long long v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        long long v10 = objc_msgSend(v9, "selectionContext", (void)v11);

        if (v10)
        {
          [v9 setSelectionContext:0];
          [(HKGraphView *)self _finishSelectionForSeriesGroup:v9];
          [(HKGraphView *)self _deselectAllSeriesWithAlpha:v9 offScreenIndicatorAlpha:1.0 seriesGroup:1.0];
          char v6 = 1;
        }
      }
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);

    if (v6)
    {
      [(HKGraphView *)self _notifyDidEndSelection];
      [(HKGraphRenderer *)self->_renderView setNeedsRender];
      [(HKGraphRenderer *)self->_yAxisLabelContent setNeedsRender];
    }
  }
  else
  {
  }
  if (self->_enableStickySelection) {
    [(HKGraphView *)self _deactivateStickySelection];
  }
  [(HKGraphView *)self _resetSingleSelectionXValue];
  [(HKGraphView *)self _scheduleExternalSelectionIfNeededClearingLastLocation];
}

- (void)_cancelAndFinishSelection
{
  [(HKGraphView *)self _cancelExternalSelection];
  [(HKGraphView *)self _finishSelection];
}

- (void)_selectionRecognizerDidFinish:(id)a3
{
  if (self->_enableStickySelection) {
    [(HKGraphView *)self _activateStickySelection];
  }
  else {
    [(HKGraphView *)self _finishSelection];
  }
}

- (void)_moveSeriesToFront:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    obuint64_t j = self->_seriesGroupRows;
    uint64_t v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v20 != v7) {
            objc_enumerationMutation(obj);
          }
          long long v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          long long v10 = [v9 currentSeries];
          uint64_t v11 = [v10 indexOfObjectIdenticalTo:v4];

          if (v11 != 0x7FFFFFFFFFFFFFFFLL)
          {
            long long v12 = [v9 currentSeries];
            uint64_t v13 = [v12 count] - 1;

            long long v14 = [v9 currentSeries];
            long long v15 = [v14 objectAtIndexedSubscript:v13];
            uint64_t v16 = [v9 currentSeries];
            [v16 setObject:v15 atIndexedSubscript:v11];

            double v17 = [v9 currentSeries];
            [v17 setObject:v4 atIndexedSubscript:v13];
          }
        }
        uint64_t v6 = [(NSMutableArray *)obj countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v6);
    }
  }
}

- (void)touchSelectionAtModelX:(id)a3
{
  [(HKGraphView *)self setExternalSelectionModelCoordinate:a3];
  [(HKGraphView *)self _installExternalSelectionEndTimer];
  [(HKGraphView *)self _installExternalSelectionCancelTimer];
  [(HKGraphView *)self _scheduleRequiredExternalSelection];
}

- (void)_installExternalSelectionEndTimer
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __48__HKGraphView__installExternalSelectionEndTimer__block_invoke;
  v3[3] = &unk_1E6D51E50;
  v3[4] = self;
  id v2 = (id)[MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:0 repeats:v3 block:1.0];
}

uint64_t __48__HKGraphView__installExternalSelectionEndTimer__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endExternalSelectionViaTimer];
}

- (void)_installExternalSelectionCancelTimer
{
  [(HKGraphView *)self _invalidateExternalSelectionCancelTimer];
  objc_initWeak(&location, self);
  id v3 = (void *)MEMORY[0x1E4F1CB00];
  id v4 = [MEMORY[0x1E4F2B860] sharedBehavior];
  int v5 = [v4 isAppleInternalInstall];

  double v6 = 4.0;
  if (v5)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F1CB18]);
    long long v8 = (void *)[v7 initWithSuiteName:*MEMORY[0x1E4F2BD98]];
    if (objc_msgSend(v8, "hk_keyExists:", @"HKLollipopDeselectDelayInSec"))
    {
      [v8 doubleForKey:@"HKLollipopDeselectDelayInSec"];
      double v6 = v9;
    }
  }
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __51__HKGraphView__installExternalSelectionCancelTimer__block_invoke;
  long long v14 = &unk_1E6D51810;
  objc_copyWeak(&v15, &location);
  long long v10 = [v3 scheduledTimerWithTimeInterval:0 repeats:&v11 block:v6];
  -[HKGraphView setExternalSelectionCancelTimer:](self, "setExternalSelectionCancelTimer:", v10, v11, v12, v13, v14);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __51__HKGraphView__installExternalSelectionCancelTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _cancelAndFinishSelection];
}

- (void)_invalidateExternalSelectionCancelTimer
{
  [(NSTimer *)self->_externalSelectionCancelTimer invalidate];
  externalSelectionCancelTimer = self->_externalSelectionCancelTimer;
  self->_externalSelectionCancelTimer = 0;
}

- (void)_cancelExternalSelection
{
  id v3 = [(HKGraphView *)self externalSelectionModelCoordinate];

  if (v3)
  {
    [(HKGraphView *)self setExternalSelectionModelCoordinate:0];
    [(HKGraphView *)self _notifyDidEndExternalSelection];
  }
}

- (void)_scheduleExternalSelectionIfNeeded
{
  id v3 = [(HKGraphView *)self externalSelectionModelCoordinate];

  if (v3)
  {
    if (![(HKGraphView *)self externalSelectionScheduled])
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __49__HKGraphView__scheduleExternalSelectionIfNeeded__block_invoke;
      block[3] = &unk_1E6D50ED8;
      block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
      [(HKGraphView *)self setExternalSelectionScheduled:1];
    }
  }
}

uint64_t __49__HKGraphView__scheduleExternalSelectionIfNeeded__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processExternalSelection];
}

- (void)_scheduleRequiredExternalSelection
{
  [(HKGraphView *)self setExternalSelectionLastLocation:-1.79769313e308];
  [(HKGraphView *)self setExternalSelectionScheduled:0];
  [(HKGraphView *)self _scheduleExternalSelectionIfNeeded];
}

- (void)_scheduleExternalSelectionIfNeededClearingLastLocation
{
  [(HKGraphView *)self setExternalSelectionLastLocation:-1.79769313e308];
  [(HKGraphView *)self _scheduleExternalSelectionIfNeeded];
}

- (void)_processExternalSelection
{
  id v3 = [(HKGraphView *)self externalSelectionModelCoordinate];

  if (v3)
  {
    [(HKGraphView *)self setExternalSelectionScheduled:0];
    id v4 = [(HKAxis *)self->_xAxis transform];
    int v5 = [(HKGraphView *)self externalSelectionModelCoordinate];
    [v4 coordinateForValue:v5];
    double v7 = v6;

    long long v41 = 0u;
    long long v42 = 0u;
    long long v40 = 0u;
    [(HKGraphView *)self _xAxisCoordinateTransform];
    double v8 = *(double *)&v42 + *(double *)&v41 * 0.0 + *(double *)&v40 * v7;
    int64_t v9 = [(HKGraphView *)self xAxisDateZoom];
    [(HKGraphView *)self _dataAreaRect];
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    uint64_t v36 = 0;
    int v37 = (double *)&v36;
    uint64_t v38 = 0x2020000000;
    uint64_t v39 = 0x7FEFFFFFFFFFFFFFLL;
    v35[0] = 0;
    v35[1] = v35;
    void v35[2] = 0x2020000000;
    _OWORD v35[3] = 0x7FEFFFFFFFFFFFFFLL;
    uint64_t v31 = 0;
    unint64_t v32 = (double *)&v31;
    uint64_t v33 = 0x2020000000;
    uint64_t v34 = 0x7FEFFFFFFFFFFFFFLL;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __40__HKGraphView__processExternalSelection__block_invoke;
    v30[3] = &unk_1E6D51EA0;
    v30[7] = &v31;
    v30[8] = v9;
    *(double *)&v30[9] = v14;
    *(double *)&v30[10] = v8;
    v30[4] = self;
    v30[5] = v35;
    v30[6] = &v36;
    [(HKGraphView *)self _walkAllSeries:v30];
    double v18 = v37[3];
    if (v18 < 1.79769313e308)
    {
      [(HKGraphView *)self externalSelectionLastLocation];
      if (!HKUIEqualCGFloats(v18, v19))
      {
        double v20 = v37[3];
        v43.origin.CGFloat x = v11;
        v43.origin.CGFloat y = v13;
        v43.size.CGFloat width = v15;
        v43.size.CGFloat height = v17;
        double MinX = CGRectGetMinX(v43);
        v44.origin.CGFloat x = v11;
        v44.origin.CGFloat y = v13;
        v44.size.CGFloat width = v15;
        v44.size.CGFloat height = v17;
        double v22 = CGRectGetMaxX(v44) + -0.00000011920929;
        double v23 = v37[3];
        if (v23 < MinX + 0.00000011920929 || v23 > v22)
        {
          double v24 = v32[3];
          double v25 = v24 * 0.5;
          BOOL v26 = v24 < 1.79769313e308;
          double v27 = 0.0;
          if (v26) {
            double v27 = v25;
          }
          double v28 = v22 - v27;
          if (MinX + 0.00000011920929 + v27 >= v23) {
            double v23 = MinX + 0.00000011920929 + v27;
          }
          if (v28 >= v23) {
            double v20 = v23;
          }
          else {
            double v20 = v28;
          }
        }
        [(HKGraphView *)self bounds];
        -[HKGraphView _touchAtPoint:](self, "_touchAtPoint:", v20, v29 * 0.5);
        [(HKGraphView *)self setExternalSelectionLastLocation:v37[3]];
      }
    }
    _Block_object_dispose(&v31, 8);
    _Block_object_dispose(v35, 8);
    _Block_object_dispose(&v36, 8);
  }
}

void __40__HKGraphView__processExternalSelection__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 allowsSelection])
  {
    if (*(void *)(a1 + 64) == 8)
    {
      double v4 = 44.0;
      double v5 = 1.79769313e308;
    }
    else
    {
      double v5 = *(double *)(a1 + 72)
         / (double)+[HKGraphZoomLevelConfiguration visibleSeriesPointCountForTimeScope:resolution:](HKGraphZoomLevelConfiguration, "visibleSeriesPointCountForTimeScope:resolution:", *(void *)(a1 + 64), [*(id *)(a1 + 32) _resolutionFromSeries:v3]);
      double v4 = HKUICeilToScreenScale(fmax(v5, 44.0));
    }
    double v6 = *(void **)(a1 + 32);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __40__HKGraphView__processExternalSelection__block_invoke_2;
    v7[3] = &unk_1E6D51E78;
    uint64_t v10 = *(void *)(a1 + 80);
    double v11 = v4;
    long long v8 = *(_OWORD *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 56);
    double v12 = v5;
    [v6 enumerateVisibleCoordinatesForSeries:v3 block:v7];
  }
}

void __40__HKGraphView__processExternalSelection__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v21 = a3;
  [v21 startXValue];
  double v5 = v4;
  [v21 endXValue];
  double v7 = (v5 + v6) * 0.5;
  double v8 = vabdd_f64(v7, *(double *)(a1 + 56));
  [v21 startXValue];
  double v10 = v9;
  [v21 endXValue];
  double v12 = v8;
  if (vabdd_f64(v10, v11) > 0.00000011920929)
  {
    double v13 = *(double *)(a1 + 56);
    [v21 startXValue];
    if (v13 < v14 || (v15 = *(double *)(a1 + 56), [v21 endXValue], double v12 = 0.0, v15 > v16))
    {
      [v21 startXValue];
      double v18 = vabdd_f64(v17, *(double *)(a1 + 56));
      [v21 endXValue];
      double v20 = vabdd_f64(v19, *(double *)(a1 + 56));
      if (v18 >= v20) {
        double v12 = v20;
      }
      else {
        double v12 = v18;
      }
    }
  }
  if (v12 <= *(double *)(a1 + 64) && v8 < *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v7;
    *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v8;
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(void *)(a1 + 72);
  }
}

- (BOOL)_stickySelectionActive
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (![(NSMutableArray *)self->_seriesGroupRows count]) {
    return 0;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = self->_seriesGroupRows;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if (-[HKGraphView _currentSelectionStateForSeriesGroup:](self, "_currentSelectionStateForSeriesGroup:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10) != 3)
        {
          BOOL v8 = 0;
          goto LABEL_12;
        }
      }
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 1;
LABEL_12:

  return v8;
}

- (void)_deactivateStickySelection
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([(HKGraphView *)self _stickySelectionActive])
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v3 = self->_seriesGroupRows;
    uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          BOOL v8 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v7), "selectionContext", (void)v9);
          [v8 setSelectionState:0];

          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }
  }
}

- (void)_activateStickySelection
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = self->_seriesGroupRows;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        BOOL v8 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v7), "selectionContext", (void)v10);
        long long v9 = v8;
        if (v8 && [v8 selectionState] != 3) {
          [v9 setSelectionState:3];
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  [(HKGraphView *)self _reloadViewScope];
}

- (void)didMoveToWindow
{
  id v3 = [(HKGraphView *)self window];

  if (v3)
  {
    objc_initWeak(&location, self);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __30__HKGraphView_didMoveToWindow__block_invoke;
    v4[3] = &unk_1E6D51EC8;
    objc_copyWeak(&v5, &location);
    +[HKOutsideViewTapDetector addOutsideTouchCallbackForView:self outsideTapBlock:v4];
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
  else
  {
    +[HKOutsideViewTapDetector removeOutsideTouchCallbackForView:self];
  }
}

void __30__HKGraphView_didMoveToWindow__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _cancelAndFinishSelection];
}

- (void)_notifyDidBeginSelection
{
  if (self->_shouldInformDelegateOfUpdates)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained graphViewDidBeginSelection:self];
  }
}

- (void)_notifyDidUpdateSelectionWithPointContext:(id)a3
{
  if (self->_shouldInformDelegateOfUpdates)
  {
    p_delegate = &self->_delegate;
    id v5 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    [WeakRetained graphView:self didUpdateSelectedPoint:v5];
  }
}

- (void)_notifyDidEndSelection
{
  if (self->_shouldInformDelegateOfUpdates)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained graphViewDidEndSelection:self];
  }
}

- (void)_notifyDateZoomDidChangeFromValue:(int64_t)a3 toValue:(int64_t)a4
{
  if (self->_shouldInformDelegateOfUpdates)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained graphView:self didUpdateFromDateZoom:a3 toDateZoom:a4 newVisibleRange:self->_effectiveVisibleRangeActive];
  }
}

- (void)_notifyDelegateOfVisibleValueRange:(id)a3 changeContext:(int64_t)a4
{
  id v7 = a3;
  if ([(HKGraphView *)self _graphViewIsConfigured])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained graphView:self didUpdateVisibleValueRange:v7 changeContext:a4];
  }
}

- (void)_notifyDelegateOfFinishUserScrolling
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained graphView:self didFinishUserScrollingToValueRange:self->_effectiveVisibleRangeActive];
}

- (void)_notifyDelegateOfSizeChange
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained graphViewSizeChanged:self];
}

- (void)_notifyDelegateOfYAxisWidth:(double)a3 toWidth:(double)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained graphView:self didUpdateYAxisWidth:a3 toWidth:a4];
}

- (void)_notifyDelegateSeriesUpdate:(id)a3 newDataArrived:(BOOL)a4
{
  BOOL v4 = a4;
  scrollView = self->_scrollView;
  id v7 = a3;
  uint64_t v8 = [(UIScrollView *)scrollView isDragging];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained graphView:self didUpdateSeries:v7 newDataArrived:v4 changeContext:v8];
}

- (void)_notifyDelegateOfTapOnYAxis
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained graphViewDidTapYAxis:self];
}

- (void)_notifyDidEndExternalSelection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained graphViewExternalSelectionEnd:self];
}

- (void)_notifyGraphViewRendered
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained graphViewRenderedView:self];
}

- (void)testScrollPerformanceWithTestName:(id)a3 iterations:(int)a4 delta:(int)a5 options:(id)a6
{
}

- (void)testScrollPerformanceWithTestName:(id)a3 iterations:(int)a4 delta:(int)a5 length:(int)a6
{
}

- (id)findVisibleBlockCoordinatesForPrimarySeries
{
  [(HKGraphView *)self _dataAreaRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  long long v11 = [(HKGraphView *)self primarySeries];
  if (v11)
  {
    int64_t v12 = [(HKGraphView *)self _resolutionFromSeries:v11];
    xAxis = self->_xAxis;
    [(HKGraphView *)self zoomScale];
    double v15 = v14;
    [(HKGraphView *)self contentOffset];
    double v17 = v16;
    double v19 = v18;
    [(HKGraphView *)self _xAxisCoordinateTransform];
    double v20 = objc_msgSend(v11, "findVisibleBlockCoordinatesForChartRect:xAxis:zoomScale:resolution:contentOffset:xAxisTransform:", xAxis, v12, &v22, v4, v6, v8, v10, v15, v17, v19);
  }
  else
  {
    double v20 = 0;
  }

  return v20;
}

- (id)primarySeries
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    unint64_t v7 = [v6 primarySeriesGroupIndexForGraphView:self];
  }
  else
  {
    unint64_t v7 = 0;
  }
  if (v7 >= [(NSMutableArray *)self->_seriesGroupRows count])
  {
    double v10 = 0;
  }
  else
  {
    double v8 = [(NSMutableArray *)self->_seriesGroupRows objectAtIndexedSubscript:v7];
    double v9 = [v8 currentSeries];
    double v10 = [v9 firstObject];
  }
  return v10;
}

- (void)setPreviousDateZoom:(int64_t)a3
{
  self->_int64_t xAxisDateZoom = a3;
}

- (void)setIndependentAxes:(id)a3 stackOffset:(int64_t)a4
{
  seriesGroupRows = self->_seriesGroupRows;
  id v7 = a3;
  id v8 = [(NSMutableArray *)seriesGroupRows objectAtIndexedSubscript:a4];
  [v8 setIndependentAxes:v7];

  [(HKGraphRenderer *)self->_renderView setNeedsRender];
  [(HKGraphRenderer *)self->_yAxisLabelContent setNeedsRender];
}

- (BOOL)_tilesAreEnabled
{
  return !self->_tilingDisabled && !self->_tilesTransientDisabled && !self->_tilesWaitingForInitialRender;
}

- (BOOL)_tilesConfigurableAfterInitialRender
{
  return !self->_tilingDisabled && !self->_tilesTransientDisabled;
}

- (BOOL)_tilesReconfigurableAfterInitialRender
{
  return !self->_tilingDisabled && !self->_tilesWaitingForInitialRender;
}

- (void)_handleTilesInitialRender
{
  if ([(HKGraphView *)self tilesWaitingForInitialRender])
  {
    [(HKGraphView *)self setTileInitialRedrawCount:[(HKGraphView *)self tileInitialRedrawCount] + 1];
    if ([(HKGraphView *)self tileInitialRedrawCount] >= 6)
    {
      if ([(HKGraphView *)self _tilesConfigurableAfterInitialRender])
      {
        [(HKGraphView *)self setTilesWaitingForInitialRender:0];
        double v3 = [(HKGraphView *)self backgroundColor];
        double v4 = [(HKGraphView *)self _captureColor:v3];
        [(HKGraphView *)self setCapturedTileBackgroundColor:v4];

        [(HKGraphView *)self _reconfigureScrollingTiles];
      }
    }
  }
}

- (CGPoint)_contentOffsetForActualViewRange
{
  long long v16 = *MEMORY[0x1E4F1DAD8];
  double v3 = [(HKGraphView *)self xAxis];

  if (v3)
  {
    [(HKGraphView *)self _dataAreaRect];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    int64_t v12 = [(HKGraphView *)self xAxis];
    long long v13 = [(HKGraphView *)self actualVisibleRange];
    objc_msgSend(v12, "offsetForValueRange:chartRect:zoomScaleOut:contentOffsetOut:", v13, 0, &v16, v5, v7, v9, v11);
  }
  double v15 = *((double *)&v16 + 1);
  double v14 = *(double *)&v16;
  result.CGFloat y = v15;
  result.CGFloat x = v14;
  return result;
}

- (void)_reconfigureScrollingTiles
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ([(HKGraphView *)self _tilesReconfigurableAfterInitialRender])
  {
    [(UIScrollView *)self->_scrollView contentSize];
    double v4 = v3;
    [(HKGraphView *)self _dataAreaRect];
    double Width = CGRectGetWidth(v27);
    double v6 = HKUICeilToScreenScale(Width * 0.5);
    double v7 = HKUICeilToScreenScale(v4 + Width * 2.0);
    if (v6 <= 0.0)
    {
      -[HKGraphView setTileColumns:](self, "setTileColumns:", 0, v7);
      [(HKGraphView *)self setTileWidthInPoints:v6];
      double v8 = -0.5;
    }
    else
    {
      [(HKGraphView *)self setTileColumns:vcvtpd_s64_f64(v7 / v6)];
      [(HKGraphView *)self setTileWidthInPoints:v6];
      double v8 = Width * 1.5 / v6 - Width / (v6 + v6) + -0.5;
    }
    [(HKGraphView *)self setTileColumnHysteresis:vcvtmd_s64_f64(v8)];
    [(HKGraphView *)self setTileFirstColumn:0];
    [(HKGraphView *)self setTileLastColumn:-1];
    double v9 = [(HKGraphView *)self tileQueue];

    if (!v9)
    {
      id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [(HKGraphView *)self setTileQueue:v10];
    }
    double v11 = [(HKGraphView *)self tilesByColumnNumber];

    if (v11)
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      int64_t v12 = [(HKGraphView *)self tilesByColumnNumber];
      long long v13 = [v12 allValues];

      uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v22;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v22 != v16) {
              objc_enumerationMutation(v13);
            }
            double v18 = *(void **)(*((void *)&v21 + 1) + 8 * i);
            [v18 prepareTileForReuse];
            double v19 = [(HKGraphView *)self tileQueue];
            [v19 addObject:v18];
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v15);
      }

      id v20 = [(HKGraphView *)self tilesByColumnNumber];
      [v20 removeAllObjects];
    }
    else
    {
      id v20 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [(HKGraphView *)self setTilesByColumnNumber:v20];
    }

    [(HKGraphView *)self _contentOffsetForActualViewRange];
    -[HKGraphView _touchTilesForContentOffset:applyHysteresis:](self, "_touchTilesForContentOffset:applyHysteresis:", 0);
  }
}

- (id)_captureColor:(id)a3
{
  double v8 = 0.0;
  double v6 = 0.0;
  double v7 = 0.0;
  double v5 = 0.0;
  [a3 getRed:&v8 green:&v7 blue:&v6 alpha:&v5];
  double v3 = [MEMORY[0x1E4FB1618] colorWithRed:v8 green:v7 blue:v6 alpha:v5];
  return v3;
}

- (void)_touchTilesForContentOffset:(CGPoint)a3 applyHysteresis:(BOOL)a4
{
  BOOL v4 = a4;
  double x = a3.x;
  [(HKGraphView *)self _dataAreaRect];
  double Width = CGRectGetWidth(v49);
  [(HKGraphView *)self tileWidthInPoints];
  if (v9 <= 0.0)
  {
    uint64_t v11 = 0;
    int64_t v12 = -1;
  }
  else
  {
    double v10 = Width + x + Width * 0.5;
    uint64_t v11 = vcvtmd_s64_f64((v10 - Width * 1.5) / v9);
    int64_t v12 = vcvtmd_s64_f64((Width * 1.5 + v10) / v9);
  }
  uint64_t v13 = v11 & ~(v11 >> 63);
  int64_t v14 = [(HKGraphView *)self tileColumns];
  if (v12 >= v14 - 1) {
    int64_t v15 = v14 - 1;
  }
  else {
    int64_t v15 = v12;
  }
  if (!v4
    || ((int64_t v16 = [(HKGraphView *)self tileFirstColumn], v13 - v16 >= 0)
      ? (int64_t v17 = v13 - v16)
      : (int64_t v17 = v16 - v13),
        v17 > [(HKGraphView *)self tileColumnHysteresis]))
  {
    SEL v47 = a2;
    int64_t v18 = [(HKGraphView *)self tileFirstColumn];
    if (v18 <= [(HKGraphView *)self tileLastColumn])
    {
      do
      {
        if (v18 < v13 || v18 > v15)
        {
          double v19 = [NSNumber numberWithInteger:v18];
          id v20 = [(HKGraphView *)self tilesByColumnNumber];
          long long v21 = [v20 objectForKey:v19];

          if (!v21)
          {
            double v25 = [MEMORY[0x1E4F28B00] currentHandler];
            [v25 handleFailureInMethod:a2 object:self file:@"HKGraphView.m" lineNumber:3799 description:@"Failed to find tile to remove from graph view"];
          }
          long long v22 = [(HKGraphView *)self tilesByColumnNumber];
          [v22 removeObjectForKey:v19];

          [v21 prepareTileForReuse];
          long long v23 = [(HKGraphView *)self tileQueue];
          [v23 addObject:v21];
        }
      }
      while (v18++ < [(HKGraphView *)self tileLastColumn]);
    }
    if (v13 <= v15)
    {
      int64_t v26 = v13;
      do
      {
        if (v26 < [(HKGraphView *)self tileFirstColumn]
          || v26 > [(HKGraphView *)self tileLastColumn])
        {
          CGRect v27 = [NSNumber numberWithInteger:v26];
          double v28 = [(HKGraphView *)self tilesByColumnNumber];
          double v29 = [v28 objectForKey:v27];

          if (v29)
          {
            double v46 = [MEMORY[0x1E4F28B00] currentHandler];
            [v46 handleFailureInMethod:v47 object:self file:@"HKGraphView.m" lineNumber:3810 description:@"Unexpected tile found in table while adding new tiles"];
          }
          [(HKGraphView *)self _tileScreenRectForColumn:v26];
          double v31 = v30;
          double v33 = v32;
          double v35 = v34;
          double v37 = v36;
          uint64_t v38 = [(HKGraphView *)self tileQueue];
          uint64_t v39 = [v38 count];

          if (v39)
          {
            long long v40 = [(HKGraphView *)self tileQueue];
            long long v41 = [v40 lastObject];

            long long v42 = [(HKGraphView *)self tileQueue];
            [v42 removeLastObject];
          }
          else
          {
            CGRect v43 = [HKGraphTile alloc];
            scrollView = self->_scrollView;
            long long v42 = [(HKGraphView *)self graphViewTileThread];
            long long v41 = [(HKGraphTile *)v43 initWithParentView:scrollView graphViewTileThread:v42];
          }

          [(HKGraphTile *)v41 setHidden:[(HKGraphView *)self tilesHidden]];
          [(HKGraphTile *)v41 setDrawingDelegate:self];
          -[HKGraphTile configureTileWithScreenRect:column:](v41, "configureTileWithScreenRect:column:", v26, v31, v33, v35, v37);
          double v45 = [(HKGraphView *)self tilesByColumnNumber];
          [v45 setObject:v41 forKey:v27];
        }
        ++v26;
      }
      while (v15 + 1 != v26);
    }
    [(HKGraphView *)self setTileFirstColumn:v13];
    [(HKGraphView *)self setTileLastColumn:v15];
  }
}

- (CGRect)_tileScreenRectForColumn:(int64_t)a3
{
  [(HKGraphView *)self _dataAreaRect];
  double Width = CGRectGetWidth(v14);
  [(HKGraphView *)self tileWidthInPoints];
  double v7 = -(Width - (double)a3 * v6);
  [(HKGraphView *)self tileWidthInPoints];
  double v9 = v8;
  [(HKGraphView *)self _scrollingAreaRect];
  double Height = CGRectGetHeight(v15);
  double v11 = 0.0;
  double v12 = v7;
  double v13 = v9;
  result.size.CGFloat height = Height;
  result.size.CGFloat width = v13;
  result.origin.CGFloat y = v11;
  result.origin.double x = v12;
  return result;
}

- (void)_tileHiddenFlag:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setValue:*MEMORY[0x1E4F1CFD0] forKey:*MEMORY[0x1E4F3A5A8]];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v5 = [(HKGraphView *)self tilesByColumnNumber];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * v9);
        double v11 = [(HKGraphView *)self tilesByColumnNumber];
        double v12 = [v11 objectForKey:v10];

        [v12 setHidden:v3];
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  [MEMORY[0x1E4F39CF8] commit];
}

- (void)_markTilesDirtyWithCompletion:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [(HKGraphView *)self setTileMarkDirtyCompletion:a3];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v4 = [(HKGraphView *)self tilesByColumnNumber];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * v8);
        uint64_t v10 = [(HKGraphView *)self tilesByColumnNumber];
        double v11 = [v10 objectForKey:v9];

        [v11 refreshTileContent];
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  double v12 = [(HKGraphView *)self tilesByColumnNumber];
  uint64_t v13 = [v12 count];

  if (!v13) {
    [(HKGraphView *)self _handleMarkDirtyCompletion];
  }
}

- (void)_handleMarkDirtyCompletion
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v3 = [(HKGraphView *)self tilesByColumnNumber];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8 * v7);
        uint64_t v9 = [(HKGraphView *)self tilesByColumnNumber];
        uint64_t v10 = [v9 objectForKey:v8];

        LODWORD(v9) = [v10 tileDisplayedSinceSetNeedsDisplay];
        if (!v9)
        {

          return;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __41__HKGraphView__handleMarkDirtyCompletion__block_invoke;
  v12[3] = &unk_1E6D51E50;
  void v12[4] = self;
  id v11 = (id)[MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:0 repeats:v12 block:0.0];
}

void __41__HKGraphView__handleMarkDirtyCompletion__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) tileMarkDirtyCompletion];

  if (v2)
  {
    BOOL v3 = [*(id *)(a1 + 32) tileMarkDirtyCompletion];
    v3[2]();

    uint64_t v4 = *(void **)(a1 + 32);
    [v4 setTileMarkDirtyCompletion:0];
  }
}

- (void)_hideTilesWithForce
{
  [(HKGraphRenderer *)self->_renderView setNeedsDisplay];
  [(HKGraphView *)self _tileHiddenFlag:1];
  [(HKGraphView *)self setTilesHidden:1];
}

- (void)_hideTiles
{
  if (![(HKGraphView *)self tilesHidden])
  {
    [(HKGraphView *)self _hideTilesWithForce];
  }
}

- (void)_showTiles
{
  if ([(HKGraphView *)self tilesHidden])
  {
    [(HKGraphView *)self _tileHiddenFlag:0];
    [(HKGraphView *)self setTilesHidden:0];
  }
}

- (void)_shutdownTilingThread
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v3 = [(HKGraphView *)self tilesByColumnNumber];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8 * v7);
        uint64_t v9 = [(HKGraphView *)self tilesByColumnNumber];
        uint64_t v10 = [v9 objectForKey:v8];

        [v10 prepareTileForReuse];
        id v11 = [(HKGraphView *)self tileQueue];
        [v11 addObject:v10];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  double v12 = [(HKGraphView *)self tilesByColumnNumber];
  [v12 removeAllObjects];

  [(HKGraphViewTileThread *)self->_graphViewTileThread cancel];
}

- (id)createTileRendererWithTileRect:(CGRect)a3 column:(int64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  xAxis = self->_xAxis;
  [(HKGraphView *)self zoomScale];
  double v12 = -[HKAxis rangeForChartRect:zoomScale:contentOffset:](xAxis, "rangeForChartRect:zoomScale:contentOffset:", 0.0, 0.0, width, height, v11, x, y);
  long long v13 = [(HKGraphView *)self _effectiveVisibleRangeFromActualVisibleRange:v12];
  long long v14 = -[HKGraphView _createRendererWithCurrentStateWithChartRect:contentOffset:drawingToTile:tileColumn:effectiveVisibleRangeCadence:effectiveVisibleRangeActive:actualVisibleRange:](self, "_createRendererWithCurrentStateWithChartRect:contentOffset:drawingToTile:tileColumn:effectiveVisibleRangeCadence:effectiveVisibleRangeActive:actualVisibleRange:", 1, a4, v13, v13, v12, 0.0, 0.0, width, height, x, y);

  return v14;
}

- (void)tileRenderDidFinish
{
  BOOL v3 = [(HKGraphView *)self tileMarkDirtyCompletion];

  if (v3)
  {
    [(HKGraphView *)self _handleMarkDirtyCompletion];
  }
}

- (void)enumerateVisibleCoordinatesForSeries:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(HKGraphView *)self _dataAreaRect];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  int64_t v16 = [(HKGraphView *)self _resolutionFromSeries:v6];
  if (v13 > 0.0 && v15 > 0.0)
  {
    int64_t v17 = v16;
    virtualRightMargindouble Width = self->_virtualRightMarginWidth;
    -[HKGraphView _inactiveRightAreaForRect:](self, "_inactiveRightAreaForRect:", v9, v11, v13, v15);
    virtualLeftMargindouble Width = self->_virtualLeftMarginWidth;
    double v21 = v9 + virtualLeftMarginWidth;
    double v22 = v11 + 0.0;
    double v23 = v13 - (virtualRightMarginWidth + v20 + virtualLeftMarginWidth);
    long long v24 = [(HKGraphView *)self xAxis];
    long long v28 = *MEMORY[0x1E4F1DAD8];
    objc_msgSend(v24, "offsetForValueRange:chartRect:zoomScaleOut:contentOffsetOut:", self->_effectiveVisibleRangeActive, 0, &v28, v21, v22, v23, v15);
    [(HKGraphView *)self _xAxisCoordinateTransform];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __58__HKGraphView_enumerateVisibleCoordinatesForSeries_block___block_invoke;
    v25[3] = &unk_1E6D51EF0;
    id v26 = v7;
    objc_msgSend(v6, "enumerateCoordinatesInChartRect:xAxis:zoomScale:resolution:contentOffset:xAxisTransform:roundToViewScale:exclusionOptions:block:", v24, v17, v27, 1, 2, v25, v21, v22, v23, v15, 1.0, v28);
  }
}

uint64_t __58__HKGraphView_enumerateVisibleCoordinatesForSeries_block___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_layoutOverlayView
{
  [(HKGraphView *)self _overlayAreaRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = [(HKGraphView *)self overlayView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
}

- (void)overlayNeedsRedisplay
{
}

- (id)_nonOverlappingOverlaySeriesData:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "graphSeries", (void)v14);
        if ([v11 overlayType])
        {
          double v12 = [v11 overlayIdentifier];
          if (!v12) {
            [v4 addObject:v10];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)_overlappingOverlaySeriesData:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "graphSeries", (void)v15);
        if ([v11 overlayType])
        {
          double v12 = [v11 overlayIdentifier];
          if (v12)
          {
            id v13 = [v4 objectForKeyedSubscript:v12];
            if (!v13)
            {
              id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              [v4 setObject:v13 forKeyedSubscript:v12];
            }
            [v13 addObject:v10];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return v4;
}

- (int64_t)_ordinalForOverlayType:(int64_t)a3
{
  int64_t v3 = 10;
  if (a3 != 1) {
    int64_t v3 = 0;
  }
  if (a3 == 2) {
    return 20;
  }
  else {
    return v3;
  }
}

- (int64_t)_overlayTypeForOverlaySeriesData:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4
    && (long long v17 = 0u,
        long long v18 = 0u,
        long long v15 = 0u,
        long long v16 = 0u,
        (uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16]) != 0))
  {
    uint64_t v7 = v6;
    int64_t v8 = 0;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = [*(id *)(*((void *)&v15 + 1) + 8 * i) graphSeries];
        uint64_t v12 = [v11 overlayType];
        int64_t v13 = [(HKGraphView *)self _ordinalForOverlayType:v12];
        if (v13 > [(HKGraphView *)self _ordinalForOverlayType:v8]) {
          int64_t v8 = v12;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
  else
  {
    int64_t v8 = 0;
  }

  return v8;
}

- (int64_t)_overlayEnvironmentType
{
  if ([(HKGraphView *)self _drawingDuringAutoscale]
    || [(HKGraphView *)self _drawingDuringScrolling])
  {
    return 2;
  }
  else
  {
    return 1;
  }
}

- (void)_drawOverlaysIfNeeded:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(HKGraphView *)self _overlayTypeForOverlaySeriesData:v4];
  if (![(HKGraphView *)self previousOverlayType] && v5)
  {
    uint64_t v6 = [(HKGraphView *)self overlayView];
    uint64_t v7 = v6;
    uint64_t v8 = 0;
LABEL_7:
    [v6 setHidden:v8];

    goto LABEL_8;
  }
  if ([(HKGraphView *)self previousOverlayType] && !v5)
  {
    uint64_t v6 = [(HKGraphView *)self overlayView];
    uint64_t v7 = v6;
    uint64_t v8 = 1;
    goto LABEL_7;
  }
LABEL_8:
  [(HKGraphView *)self setPreviousOverlayType:v5];
  int64_t v9 = [(HKGraphView *)self _overlayEnvironmentType];
  if (![(HKGraphView *)self _drawingDuringScrolling] && v5 && v9 && (v9 != 2 || v5 != 1))
  {
    double v10 = [(HKGraphView *)self overlayView];
    id v11 = [v10 superview];

    uint64_t v12 = [(HKGraphView *)self overlayView];
    [v11 bringSubviewToFront:v12];

    int64_t v13 = [(HKGraphView *)self _nonOverlappingOverlaySeriesData:v4];
    long long v14 = [(HKGraphView *)self _overlappingOverlaySeriesData:v4];
    long long v15 = [(HKGraphView *)self overlayView];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __37__HKGraphView__drawOverlaysIfNeeded___block_invoke;
    _OWORD v18[3] = &unk_1E6D51F18;
    id v19 = v13;
    uint64_t v20 = self;
    id v21 = v14;
    id v16 = v14;
    id v17 = v13;
    [v15 drawContentUsingBlock:v18];
  }
}

void __37__HKGraphView__drawOverlaysIfNeeded___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v4 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v30 != v6) {
          objc_enumerationMutation(obj);
        }
        double v34 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v8 = v34;
        int64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
        double v10 = *(void **)(a1 + 40);
        id v11 = [v10 overlayView];
        [v10 _overlayViewsForOverlayData:v9 overlayView:v11];

        uint64_t v12 = [v8 graphSeries];
        [v12 drawOverlayInContext:a2 seriesOverlayData:v9];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v5);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v13 = *(id *)(a1 + 48);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v26 != v16) {
          objc_enumerationMutation(v13);
        }
        long long v18 = [*(id *)(a1 + 48) objectForKeyedSubscript:*(void *)(*((void *)&v25 + 1) + 8 * j)];
        id v19 = *(void **)(a1 + 40);
        uint64_t v20 = [v19 overlayView];
        [v19 _overlayViewsForOverlayData:v18 overlayView:v20];

        id v21 = [v18 firstObject];
        double v22 = v21;
        if (v21)
        {
          double v23 = [v21 graphSeries];
          [v23 drawOverlayInContext:a2 seriesOverlayData:v18];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v15);
  }
}

- (void)_overlayViewsForOverlayData:(id)a3 overlayView:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 firstObject];
  if (v8)
  {
    int64_t v9 = [(HKGraphView *)self overlayInteractiveViews];
    double v10 = [v8 graphSeries];
    id v11 = [v9 objectForKey:v10];

    uint64_t v12 = [v8 graphSeries];
    id v13 = v12;
    if (v11)
    {
      [v7 bounds];
      objc_msgSend(v13, "layoutOverlayInteractiveViews:seriesOverlayData:overlayRect:", v11, v6);

LABEL_13:
      goto LABEL_14;
    }
    uint64_t v14 = [v12 overlayInteractiveViewsWithDelegate:self];

    if (v14)
    {
      uint64_t v15 = [(HKGraphView *)self overlayInteractiveViews];
      uint64_t v16 = [v8 graphSeries];
      [v15 setObject:v14 forKey:v16];

      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v11 = v14;
      uint64_t v17 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v23;
        do
        {
          uint64_t v20 = 0;
          do
          {
            if (*(void *)v23 != v19) {
              objc_enumerationMutation(v11);
            }
            objc_msgSend(v7, "addSubview:", *(void *)(*((void *)&v22 + 1) + 8 * v20++), (void)v22);
          }
          while (v18 != v20);
          uint64_t v18 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
        }
        while (v18);
      }

      id v21 = [v8 graphSeries];
      [v7 bounds];
      objc_msgSend(v21, "layoutOverlayInteractiveViews:seriesOverlayData:overlayRect:", v11, v6);

      goto LABEL_13;
    }
  }
LABEL_14:
}

- (HKGraphViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HKGraphViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HKAxis)xAxis
{
  return self->_xAxis;
}

- (double)xAxisSpace
{
  return self->_xAxisSpace;
}

- (void)setXAxisSpace:(double)a3
{
  self->_xAxisSpace = a3;
}

- (BOOL)disableXAxis
{
  return self->_disableXAxis;
}

- (UIEdgeInsets)axisInset
{
  double top = self->_axisInset.top;
  double left = self->_axisInset.left;
  double bottom = self->_axisInset.bottom;
  double right = self->_axisInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIColor)outlineColor
{
  return self->_outlineColor;
}

- (UIColor)topMarginColor
{
  return self->_topMarginColor;
}

- (void)setTopMarginColor:(id)a3
{
}

- (unint64_t)outlineOptions
{
  return self->_outlineOptions;
}

- (void)setOutlineOptions:(unint64_t)a3
{
  self->_unint64_t outlineOptions = a3;
}

- (unint64_t)featheringOptions
{
  return self->_featheringOptions;
}

- (void)setFeatheringOptions:(unint64_t)a3
{
  self->_featheringOptions = a3;
}

- (BOOL)disableScrolling
{
  return self->_disableScrolling;
}

- (BOOL)disableSelection
{
  return self->_disableSelection;
}

- (BOOL)multiSeriesSelection
{
  return self->_multiSeriesSelection;
}

- (void)setMultiSeriesSelection:(BOOL)a3
{
  self->_multiSeriesSelection = a3;
}

- (BOOL)moveSelectedSeriesToFront
{
  return self->_moveSelectedSeriesToFront;
}

- (void)setMoveSelectedSeriesToFront:(BOOL)a3
{
  self->_moveSelectedSeriesToFront = a3;
}

- (HKGraphViewSelectionStyle)selectionStyle
{
  return self->_selectionStyle;
}

- (void)setSelectionStyle:(id)a3
{
}

- (int64_t)xAxisDateZoom
{
  return self->_xAxisDateZoom;
}

- (HKValueRange)effectiveAxisRange
{
  return self->_effectiveAxisRange;
}

- (HKValueRange)actualAxisRange
{
  return self->_actualAxisRange;
}

- (double)hardLeftMarginWidth
{
  return self->_hardLeftMarginWidth;
}

- (double)virtualLeftMarginWidth
{
  return self->_virtualLeftMarginWidth;
}

- (void)setVirtualLeftMarginWidth:(double)a3
{
  self->_virtualLeftMargindouble Width = a3;
}

- (double)virtualRightMarginWidth
{
  return self->_virtualRightMarginWidth;
}

- (void)setVirtualRightMarginWidth:(double)a3
{
  self->_virtualRightMargindouble Width = a3;
}

- (int64_t)virtualLeftMarginStyle
{
  return self->_virtualLeftMarginStyle;
}

- (int64_t)virtualRightMarginStyle
{
  return self->_virtualRightMarginStyle;
}

- (HKValueRange)actualVisibleRange
{
  return self->_actualVisibleRange;
}

- (HKValueRange)effectiveVisibleRangeCadence
{
  return self->_effectiveVisibleRangeCadence;
}

- (HKValueRange)effectiveVisibleRangeActive
{
  return self->_effectiveVisibleRangeActive;
}

- (int64_t)minimumDateZoom
{
  return self->_minimumDateZoom;
}

- (void)setMinimumDateZoom:(int64_t)a3
{
  self->_minimumDateZoom = a3;
}

- (int64_t)maximumDateZoom
{
  return self->_maximumDateZoom;
}

- (void)setMaximumDateZoom:(int64_t)a3
{
  self->_maximumDateZoom = a3;
}

- (int64_t)scrollingOptions
{
  return self->_scrollingOptions;
}

- (void)setScrollingOptions:(int64_t)a3
{
  self->_scrollingOptions = a3;
}

- (NSCalendar)currentCalendar
{
  return self->_currentCalendar;
}

- (void)setCurrentCalendar:(id)a3
{
}

- (BOOL)contentWidthFromTimeScope
{
  return self->_contentWidthFromTimeScope;
}

- (void)setContentWidthFromTimeScope:(BOOL)a3
{
  self->_contentWidthFromTimeScope = a3;
}

- (BOOL)enableStickySelection
{
  return self->_enableStickySelection;
}

- (void)setEnableStickySelection:(BOOL)a3
{
  self->_enableStickySelection = a3;
}

- (HKMultiTouchPressGestureRecognizer)multiTouchGestureRecognizer
{
  return self->_multiTouchGestureRecognizer;
}

- (BOOL)enableZoomInGesture
{
  return self->_enableZoomInGesture;
}

- (void)setEnableZoomInGesture:(BOOL)a3
{
  self->_enableZoomInGesture = a3;
}

- (BOOL)tilingDisabled
{
  return self->_tilingDisabled;
}

- (void)setTilingDisabled:(BOOL)a3
{
  self->_tilingDisabled = a3;
}

- (BOOL)prefersOpaqueLegends
{
  return self->_prefersOpaqueLegends;
}

- (void)setPrefersOpaqueLegends:(BOOL)a3
{
  self->_BOOL prefersOpaqueLegends = a3;
}

- (BOOL)drawsGridlinesPerSeriesGroup
{
  return self->_drawsGridlinesPerSeriesGroup;
}

- (void)setDrawsGridlinesPerSeriesGroup:(BOOL)a3
{
  self->_drawsGridlinesPerSeriesGroup = a3;
}

- (void)setZoomScale:(double)a3
{
  self->_zoomScale = a3;
}

- (void)setContentOffset:(CGPoint)a3
{
  self->_contentOffset = a3;
}

- (BOOL)contentOffsetIsSet
{
  return self->_contentOffsetIsSet;
}

- (void)setContentOffsetIsSet:(BOOL)a3
{
  self->_contentOffsetIsSet = a3;
}

- (UIView)detailView
{
  return self->_detailView;
}

- (HKValueRange)destinationEffectiveVisibleRangeActive
{
  return self->_destinationEffectiveVisibleRangeActive;
}

- (void)setDestinationEffectiveVisibleRangeActive:(id)a3
{
}

- (NSSet)yAxisAccessoryViews
{
  return self->_yAxisAccessoryViews;
}

- (void)setYAxisAccessoryViews:(id)a3
{
}

- (int64_t)tileColumns
{
  return self->_tileColumns;
}

- (void)setTileColumns:(int64_t)a3
{
  self->_tileColumns = a3;
}

- (double)tileWidthInPoints
{
  return self->_tileWidthInPoints;
}

- (void)setTileWidthInPoints:(double)a3
{
  self->_tileWidthInPoints = a3;
}

- (int64_t)tileFirstColumn
{
  return self->_tileFirstColumn;
}

- (void)setTileFirstColumn:(int64_t)a3
{
  self->_tileFirstColumn = a3;
}

- (int64_t)tileLastColumn
{
  return self->_tileLastColumn;
}

- (void)setTileLastColumn:(int64_t)a3
{
  self->_tileLastColumn = a3;
}

- (int64_t)tileColumnHysteresis
{
  return self->_tileColumnHysteresis;
}

- (void)setTileColumnHysteresis:(int64_t)a3
{
  self->_tileColumnHysteresis = a3;
}

- (BOOL)tilesHidden
{
  return self->_tilesHidden;
}

- (void)setTilesHidden:(BOOL)a3
{
  self->_tilesHidden = a3;
}

- (NSMutableDictionary)tilesByColumnNumber
{
  return self->_tilesByColumnNumber;
}

- (void)setTilesByColumnNumber:(id)a3
{
}

- (NSMutableArray)tileQueue
{
  return self->_tileQueue;
}

- (void)setTileQueue:(id)a3
{
}

- (id)tileMarkDirtyCompletion
{
  return self->_tileMarkDirtyCompletion;
}

- (void)setTileMarkDirtyCompletion:(id)a3
{
}

- (BOOL)tilesTransientDisabled
{
  return self->_tilesTransientDisabled;
}

- (void)setTilesTransientDisabled:(BOOL)a3
{
  self->_tilesTransientDisabled = a3;
}

- (BOOL)tilesWaitingForInitialRender
{
  return self->_tilesWaitingForInitialRender;
}

- (void)setTilesWaitingForInitialRender:(BOOL)a3
{
  self->_tilesWaitingForInitialRender = a3;
}

- (int64_t)tileInitialRedrawCount
{
  return self->_tileInitialRedrawCount;
}

- (void)setTileInitialRedrawCount:(int64_t)a3
{
  self->_tileInitialRedrawCount = a3;
}

- (HKGraphViewTileThread)graphViewTileThread
{
  return self->_graphViewTileThread;
}

- (double)lastSingleSelectionXValue
{
  return self->_lastSingleSelectionXValue;
}

- (void)setLastSingleSelectionXValue:(double)a3
{
  self->_lastSingleSelectionXValue = a3;
}

- (_HKGraphViewOverlayView)overlayView
{
  return self->_overlayView;
}

- (void)setOverlayView:(id)a3
{
}

- (int64_t)previousOverlayType
{
  return self->_previousOverlayType;
}

- (void)setPreviousOverlayType:(int64_t)a3
{
  self->_previousOverlayType = a3;
}

- (NSMapTable)overlayInteractiveViews
{
  return self->_overlayInteractiveViews;
}

- (void)setOverlayInteractiveViews:(id)a3
{
}

- (BOOL)measuringStartupTime
{
  return self->_measuringStartupTime;
}

- (void)setMeasuringStartupTime:(BOOL)a3
{
  self->_measuringStartupTime = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)lastEndTime
{
  return self->_lastEndTime;
}

- (void)setLastEndTime:(double)a3
{
  self->_lastEndTime = a3;
}

- (NSTimer)startupTimer
{
  return self->_startupTimer;
}

- (void)setStartupTimer:(id)a3
{
}

- (double)firstNonemptyDrawTime
{
  return self->_firstNonemptyDrawTime;
}

- (void)setFirstNonemptyDrawTime:(double)a3
{
  self->_firstNonemptyDrawTime = a3;
}

- (BOOL)measurementStartupAutoscale
{
  return self->_measurementStartupAutoscale;
}

- (void)setMeasurementStartupAutoscale:(BOOL)a3
{
  self->_measurementStartupAutoscale = a3;
}

- (BOOL)animationAutoscaleInProgress
{
  return self->_animationAutoscaleInProgress;
}

- (void)setAnimationAutoscaleInProgress:(BOOL)a3
{
  self->_animationAutoscaleInProgress = a3;
}

- (HKPropertyAnimationApplier)animationApplier
{
  return self->_animationApplier;
}

- (void)setAnimationApplier:(id)a3
{
}

- (NSMutableDictionary)currentAnimationProperties
{
  return self->_currentAnimationProperties;
}

- (void)setCurrentAnimationProperties:(id)a3
{
}

- (id)externalSelectionModelCoordinate
{
  return self->_externalSelectionModelCoordinate;
}

- (void)setExternalSelectionModelCoordinate:(id)a3
{
}

- (BOOL)externalSelectionScheduled
{
  return self->_externalSelectionScheduled;
}

- (void)setExternalSelectionScheduled:(BOOL)a3
{
  self->_externalSelectionScheduled = a3;
}

- (double)externalSelectionLastLocation
{
  return self->_externalSelectionLastLocation;
}

- (void)setExternalSelectionLastLocation:(double)a3
{
  self->_externalSelectionLastLocation = a3;
}

- (NSTimer)externalSelectionCancelTimer
{
  return self->_externalSelectionCancelTimer;
}

- (void)setExternalSelectionCancelTimer:(id)a3
{
}

- (UIColor)capturedTileBackgroundColor
{
  return self->_capturedTileBackgroundColor;
}

- (void)setCapturedTileBackgroundColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_capturedTileBackgroundColor, 0);
  objc_storeStrong((id *)&self->_externalSelectionCancelTimer, 0);
  objc_storeStrong(&self->_externalSelectionModelCoordinate, 0);
  objc_storeStrong((id *)&self->_currentAnimationProperties, 0);
  objc_storeStrong((id *)&self->_animationApplier, 0);
  objc_storeStrong((id *)&self->_startupTimer, 0);
  objc_storeStrong((id *)&self->_overlayInteractiveViews, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_graphViewTileThread, 0);
  objc_storeStrong(&self->_tileMarkDirtyCompletion, 0);
  objc_storeStrong((id *)&self->_tileQueue, 0);
  objc_storeStrong((id *)&self->_tilesByColumnNumber, 0);
  objc_storeStrong((id *)&self->_yAxisAccessoryViews, 0);
  objc_storeStrong((id *)&self->_destinationEffectiveVisibleRangeActive, 0);
  objc_storeStrong((id *)&self->_detailView, 0);
  objc_storeStrong((id *)&self->_multiTouchGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_currentCalendar, 0);
  objc_storeStrong((id *)&self->_effectiveVisibleRangeActive, 0);
  objc_storeStrong((id *)&self->_effectiveVisibleRangeCadence, 0);
  objc_storeStrong((id *)&self->_actualVisibleRange, 0);
  objc_storeStrong((id *)&self->_actualAxisRange, 0);
  objc_storeStrong((id *)&self->_effectiveAxisRange, 0);
  objc_storeStrong((id *)&self->_selectionStyle, 0);
  objc_storeStrong((id *)&self->_topMarginColor, 0);
  objc_storeStrong((id *)&self->_outlineColor, 0);
  objc_storeStrong((id *)&self->_xAxis, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_yAxisLabelContent, 0);
  objc_storeStrong((id *)&self->_leftMarginView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_renderView, 0);
  objc_storeStrong((id *)&self->_leftFeatheringImage, 0);
  objc_storeStrong((id *)&self->_bottomFeatheringImage, 0);
  objc_storeStrong((id *)&self->_rightFeatheringImage, 0);
  objc_storeStrong((id *)&self->_topFeatheringImage, 0);
  objc_storeStrong((id *)&self->_chartableValueRange, 0);
  objc_storeStrong((id *)&self->_seriesGroupRows, 0);
}

@end