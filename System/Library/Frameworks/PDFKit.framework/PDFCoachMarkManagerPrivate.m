@interface PDFCoachMarkManagerPrivate
@end

@implementation PDFCoachMarkManagerPrivate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->timer, 0);
  objc_storeStrong((id *)&self->coachMarks, 0);

  objc_destroyWeak((id *)&self->renderingProperties);
}

@end