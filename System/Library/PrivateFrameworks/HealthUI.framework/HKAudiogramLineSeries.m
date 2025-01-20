@interface HKAudiogramLineSeries
+ (id)audiogramLineSeriesForSeriesEar:(int64_t)a3 selectedEar:(int64_t)a4 disableConnectionLines:(BOOL)a5;
+ (id)audiogramLineSeriesForSeriesEar:(int64_t)a3 selectedEar:(int64_t)a4 disableConnectionLines:(BOOL)a5 disabledStyleOverride:(BOOL)a6 selectedFrequency:(id)a7;
+ (id)filledSymbolUsingMetadata:(id)a3 forEar:(int64_t)a4 radius:(double)a5 useEarSpecificColor:(BOOL)a6;
+ (id)selectedRangeMetadataForAudiogram:(id)a3 side:(int64_t)a4 backgroundColor:(id)a5;
+ (id)selectedRangeMetadataWith:(id)a3;
- (BOOL)supportsMultiTouchSelection;
- (HKAudiogramLineSeries)init;
- (id)filteredPointSelectionContexts:(id)a3 forTouchPoints:(id)a4 resultsDidChange:(BOOL *)a5;
- (id)pointMarkerImageForPointMarkerStyle:(id)a3;
- (void)drawLegendPointLabelInContext:(CGContext *)a3 point:(CGPoint)a4 untransformedPoint:(CGPoint)a5 axisRect:(CGRect)a6 presentationStyle:(id)a7 leftOfPoint:(BOOL)a8;
- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9;
- (void)renderPointMarkersInContext:(CGContext *)a3 blockCoordinates:(id)a4 pointTransform:(CGAffineTransform *)a5 pointMarkerStyle:(id)a6 selectedBoundsMarkerStyle:(id)a7 selectedPointMarkerStyle:(id)a8;
@end

@implementation HKAudiogramLineSeries

- (BOOL)supportsMultiTouchSelection
{
  return 0;
}

+ (id)audiogramLineSeriesForSeriesEar:(int64_t)a3 selectedEar:(int64_t)a4 disableConnectionLines:(BOOL)a5
{
  v5 = sub_1E0E3DD84(a3, a4, a5, 0, 0);
  return v5;
}

+ (id)audiogramLineSeriesForSeriesEar:(int64_t)a3 selectedEar:(int64_t)a4 disableConnectionLines:(BOOL)a5 disabledStyleOverride:(BOOL)a6 selectedFrequency:(id)a7
{
  id v12 = a7;
  v13 = sub_1E0E3DD84(a3, a4, a5, a6, a7);

  return v13;
}

- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  long long v18 = *(_OWORD *)&a6->c;
  v24[0] = *(_OWORD *)&a6->a;
  v24[1] = v18;
  v24[2] = *(_OWORD *)&a6->tx;
  id v19 = a3;
  id v20 = a5;
  v21 = a7;
  id v22 = a8;
  swift_unknownObjectRetain();
  v23 = self;
  sub_1E0E3BF3C((uint64_t)v19, (uint64_t)v20, (CGFloat *)v24, v21, (uint64_t)v22, a9, x, y, width, height);

  swift_unknownObjectRelease();
}

- (id)pointMarkerImageForPointMarkerStyle:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1E0E3C21C(v4);
  v7 = v6;

  return v7;
}

- (void)renderPointMarkersInContext:(CGContext *)a3 blockCoordinates:(id)a4 pointTransform:(CGAffineTransform *)a5 pointMarkerStyle:(id)a6 selectedBoundsMarkerStyle:(id)a7 selectedPointMarkerStyle:(id)a8
{
  long long v13 = *(_OWORD *)&a5->c;
  v20[0] = *(_OWORD *)&a5->a;
  v20[1] = v13;
  v20[2] = *(_OWORD *)&a5->tx;
  v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = self;
  sub_1E0E3C6F8(v14, v15, (uint64_t *)v20, v16, v17, v18);
}

- (void)drawLegendPointLabelInContext:(CGContext *)a3 point:(CGPoint)a4 untransformedPoint:(CGPoint)a5 axisRect:(CGRect)a6 presentationStyle:(id)a7 leftOfPoint:(BOOL)a8
{
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  double v14 = a5.y;
  double v15 = a5.x;
  double v16 = a4.y;
  double v17 = a4.x;
  id v19 = a3;
  id v20 = a7;
  v21 = self;
  sub_1E0E3D29C((uint64_t)v19, v20, a8, v17, v16, v15, v14, x, y, width, height);
}

- (id)filteredPointSelectionContexts:(id)a3 forTouchPoints:(id)a4 resultsDidChange:(BOOL *)a5
{
  sub_1E0DF2C04(0, (unint64_t *)&unk_1EAD6EA60);
  unint64_t v7 = sub_1E0ECD330();
  sub_1E0DF2C04(0, (unint64_t *)&unk_1EAD6E930);
  unint64_t v8 = sub_1E0ECD330();
  v9 = self;
  sub_1E0E3E3F0(v7, v8, a5);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v10 = (void *)sub_1E0ECD320();
  swift_bridgeObjectRelease();
  return v10;
}

+ (id)selectedRangeMetadataForAudiogram:(id)a3 side:(int64_t)a4 backgroundColor:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v9 = sub_1E0E3E894(v7, (void *)a4, v8);

  return v9;
}

+ (id)selectedRangeMetadataWith:(id)a3
{
  id v3 = a3;
  id v4 = (void *)sub_1E0E3EA1C(v3);

  return v4;
}

+ (id)filledSymbolUsingMetadata:(id)a3 forEar:(int64_t)a4 radius:(double)a5 useEarSpecificColor:(BOOL)a6
{
  id v9 = a3;
  v10 = (void *)sub_1E0E3EFCC(v9, a4, a6, a5);

  return v10;
}

- (HKAudiogramLineSeries)init
{
  result = (HKAudiogramLineSeries *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end