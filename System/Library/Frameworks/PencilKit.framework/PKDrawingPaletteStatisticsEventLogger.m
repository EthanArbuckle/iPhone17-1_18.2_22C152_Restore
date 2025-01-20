@interface PKDrawingPaletteStatisticsEventLogger
- (double)lastHandwritingToolUsedOverDrawingAttachmentTimestamp;
- (double)lastInkingToolUsedOverNonDrawingAttachmentTimestamp;
- (void)recordHandwritingToolSelected;
- (void)recordHandwritingToolUsedOverDrawingAttachmentWithTimestamp:(double)a3;
- (void)recordInkingToolUsedOverNonDrawingAttachmentWithTimestamp:(double)a3;
- (void)setLastHandwritingToolUsedOverDrawingAttachmentTimestamp:(double)a3;
- (void)setLastInkingToolUsedOverNonDrawingAttachmentTimestamp:(double)a3;
@end

@implementation PKDrawingPaletteStatisticsEventLogger

- (void)recordHandwritingToolSelected
{
  id v2 = [NSString stringWithFormat:@"com.apple.pencilkit.%@", @"handwritingtool.selected"];
  AnalyticsSendEventLazy();
}

void *__70__PKDrawingPaletteStatisticsEventLogger_recordHandwritingToolSelected__block_invoke()
{
  return &unk_1F200F3D0;
}

- (void)recordHandwritingToolUsedOverDrawingAttachmentWithTimestamp:(double)a3
{
  [(PKDrawingPaletteStatisticsEventLogger *)self lastHandwritingToolUsedOverDrawingAttachmentTimestamp];
  if (v5 != a3 && vabdd_f64(v5, a3) >= fabs(a3 * 1.0e-10))
  {
    [(PKDrawingPaletteStatisticsEventLogger *)self setLastHandwritingToolUsedOverDrawingAttachmentTimestamp:a3];
    id v6 = [NSString stringWithFormat:@"com.apple.pencilkit.%@", @"handwritingtool.usedOverDrawingAttachment"];
    AnalyticsSendEventLazy();
  }
}

void *__101__PKDrawingPaletteStatisticsEventLogger_recordHandwritingToolUsedOverDrawingAttachmentWithTimestamp___block_invoke()
{
  return &unk_1F200F3F8;
}

- (void)recordInkingToolUsedOverNonDrawingAttachmentWithTimestamp:(double)a3
{
  [(PKDrawingPaletteStatisticsEventLogger *)self lastInkingToolUsedOverNonDrawingAttachmentTimestamp];
  if (v5 != a3 && vabdd_f64(v5, a3) >= fabs(a3 * 1.0e-10))
  {
    [(PKDrawingPaletteStatisticsEventLogger *)self setLastInkingToolUsedOverNonDrawingAttachmentTimestamp:a3];
    id v6 = [NSString stringWithFormat:@"com.apple.pencilkit.%@", @"inkingtool.usedOverNonDrawingAttachment"];
    AnalyticsSendEventLazy();
  }
}

void *__99__PKDrawingPaletteStatisticsEventLogger_recordInkingToolUsedOverNonDrawingAttachmentWithTimestamp___block_invoke()
{
  return &unk_1F200F420;
}

- (double)lastHandwritingToolUsedOverDrawingAttachmentTimestamp
{
  return self->_lastHandwritingToolUsedOverDrawingAttachmentTimestamp;
}

- (void)setLastHandwritingToolUsedOverDrawingAttachmentTimestamp:(double)a3
{
  self->_lastHandwritingToolUsedOverDrawingAttachmentTimestamp = a3;
}

- (double)lastInkingToolUsedOverNonDrawingAttachmentTimestamp
{
  return self->_lastInkingToolUsedOverNonDrawingAttachmentTimestamp;
}

- (void)setLastInkingToolUsedOverNonDrawingAttachmentTimestamp:(double)a3
{
  self->_lastInkingToolUsedOverNonDrawingAttachmentTimestamp = a3;
}

@end