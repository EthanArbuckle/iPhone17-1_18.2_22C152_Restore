@interface MKHapticEngine
- (MKHapticEngine)init;
- (void)draggedObjectLanded;
- (void)draggedObjectLifted;
- (void)playFailure;
- (void)playSuccess;
- (void)prepare;
@end

@implementation MKHapticEngine

- (MKHapticEngine)init
{
  v10.receiver = self;
  v10.super_class = (Class)MKHapticEngine;
  v2 = [(MKHapticEngine *)&v10 init];
  if (v2)
  {
    v3 = (UINotificationFeedbackGenerator *)objc_alloc_init(MEMORY[0x1E4F42C10]);
    notificationGenerator = v2->_notificationGenerator;
    v2->_notificationGenerator = v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F42AA8]) initWithStyle:3];
    feedbackGenerator = v2->_feedbackGenerator;
    v2->_feedbackGenerator = (UIImpactFeedbackGenerator *)v5;

    v7 = (_UIDragSnappingFeedbackGenerator *)objc_alloc_init(MEMORY[0x1E4F43150]);
    dragSnappingGenerator = v2->_dragSnappingGenerator;
    v2->_dragSnappingGenerator = v7;
  }
  return v2;
}

- (void)playSuccess
{
}

- (void)prepare
{
}

- (void)playFailure
{
}

- (void)draggedObjectLifted
{
  if (!self->_isDragging)
  {
    self->_isDragging = 1;
    [(_UIDragSnappingFeedbackGenerator *)self->_dragSnappingGenerator userInteractionStarted];
    [(_UIDragSnappingFeedbackGenerator *)self->_dragSnappingGenerator draggedObjectLifted];
    dragSnappingGenerator = self->_dragSnappingGenerator;
    [(_UIDragSnappingFeedbackGenerator *)dragSnappingGenerator prepare];
  }
}

- (void)draggedObjectLanded
{
  if (self->_isDragging)
  {
    self->_isDragging = 0;
    [(_UIDragSnappingFeedbackGenerator *)self->_dragSnappingGenerator draggedObjectLanded];
    dragSnappingGenerator = self->_dragSnappingGenerator;
    [(_UIDragSnappingFeedbackGenerator *)dragSnappingGenerator userInteractionEnded];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dragSnappingGenerator, 0);
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);

  objc_storeStrong((id *)&self->_notificationGenerator, 0);
}

@end