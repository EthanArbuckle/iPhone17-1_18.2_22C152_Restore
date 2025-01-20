@interface CaptureTimer
- (void)scheduledTimerComplete;
@end

@implementation CaptureTimer

- (void)scheduledTimerComplete
{
  v4 = &self->completion[7];
  v3 = *(void (**)(uint64_t))&self->completion[7];
  swift_retain();
  if (v3)
  {
    uint64_t v5 = sub_21EDFBD20((uint64_t)v3);
    v3(v5);
    sub_21EDFBD10((uint64_t)v3);
    uint64_t v6 = *(void *)&self->completion[7];
  }
  else
  {
    uint64_t v6 = 0;
  }
  *(void *)v4 = 0;
  *((void *)v4 + 1) = 0;
  sub_21EDFBD10(v6);

  swift_release();
}

@end