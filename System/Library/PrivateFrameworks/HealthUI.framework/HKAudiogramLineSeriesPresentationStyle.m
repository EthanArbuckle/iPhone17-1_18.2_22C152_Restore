@interface HKAudiogramLineSeriesPresentationStyle
- (HKAudiogramLineSeriesPresentationStyle)init;
- (HKAudiogramLineSeriesPresentationStyle)initWithSeriesEar:(int64_t)a3 selectedEar:(int64_t)a4 disableConnectionLines:(BOOL)a5 disabledStyleOverride:(BOOL)a6;
- (id)lineSeriesPresentationStyle;
@end

@implementation HKAudiogramLineSeriesPresentationStyle

- (HKAudiogramLineSeriesPresentationStyle)initWithSeriesEar:(int64_t)a3 selectedEar:(int64_t)a4 disableConnectionLines:(BOOL)a5 disabledStyleOverride:(BOOL)a6
{
  return (HKAudiogramLineSeriesPresentationStyle *)AudiogramLineSeriesPresentationStyle.init(seriesEar:selectedEar:disableConnectionLines:disabledStyleOverride:)(a3, a4, a5, a6);
}

- (HKAudiogramLineSeriesPresentationStyle)init
{
  sub_1E0ECD800();
  swift_bridgeObjectRelease();
  result = (HKAudiogramLineSeriesPresentationStyle *)sub_1E0ECD8F0();
  __break(1u);
  return result;
}

- (id)lineSeriesPresentationStyle
{
  v2 = self;
  sub_1E0E3B684();
  v4 = v3;

  return v4;
}

@end