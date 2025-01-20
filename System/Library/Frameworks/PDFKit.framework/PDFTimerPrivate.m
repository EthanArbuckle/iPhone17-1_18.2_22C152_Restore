@interface PDFTimerPrivate
@end

@implementation PDFTimerPrivate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->timer, 0);
  objc_storeStrong((id *)&self->methodInvocation, 0);

  objc_destroyWeak((id *)&self->target);
}

@end