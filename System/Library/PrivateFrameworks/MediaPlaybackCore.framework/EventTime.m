@interface EventTime
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)hostTime;
- (double)avTime;
- (double)time;
- (double)userSecondsSinceReferenceDate;
- (void)setTime:(double)a3;
@end

@implementation EventTime

- (double)time
{
  return *(double *)self->time;
}

- (void)setTime:(double)a3
{
  *(double *)self->time = a3;
}

- (double)avTime
{
  return *(double *)self->avTime;
}

- (double)userSecondsSinceReferenceDate
{
  return *(double *)self->userSecondsSinceReferenceDate;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)hostTime
{
  int64_t v3 = *(void *)&self[2].var1;
  retstr->var0 = self[1].var3;
  *(void *)&retstr->var1 = self[2].var0;
  retstr->var3 = v3;
  return self;
}

@end