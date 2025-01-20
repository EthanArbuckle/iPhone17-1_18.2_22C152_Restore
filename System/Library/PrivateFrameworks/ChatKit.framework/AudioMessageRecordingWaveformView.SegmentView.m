@interface AudioMessageRecordingWaveformView.SegmentView
- (_TtCC7ChatKit33AudioMessageRecordingWaveformViewP33_68B4BF5DB603E8129B1C86442826AB4B11SegmentView)initWithCoder:(id)a3;
- (_TtCC7ChatKit33AudioMessageRecordingWaveformViewP33_68B4BF5DB603E8129B1C86442826AB4B11SegmentView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation AudioMessageRecordingWaveformView.SegmentView

- (_TtCC7ChatKit33AudioMessageRecordingWaveformViewP33_68B4BF5DB603E8129B1C86442826AB4B11SegmentView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for AudioMessageRecordingWaveformView.SegmentView();
  return -[AudioMessageRecordingWaveformView.SegmentView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtCC7ChatKit33AudioMessageRecordingWaveformViewP33_68B4BF5DB603E8129B1C86442826AB4B11SegmentView)initWithCoder:(id)a3
{
  result = (_TtCC7ChatKit33AudioMessageRecordingWaveformViewP33_68B4BF5DB603E8129B1C86442826AB4B11SegmentView *)sub_18F7BA5D0();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for AudioMessageRecordingWaveformView.SegmentView();
  id v2 = v4.receiver;
  [(AudioMessageRecordingWaveformView.SegmentView *)&v4 layoutSubviews];
  id v3 = objc_msgSend(v2, sel_layer, v4.receiver, v4.super_class);
  objc_msgSend(v2, sel_bounds);
  objc_msgSend(v3, sel_setCornerRadius_, CGRectGetWidth(v5) * 0.5);
}

@end