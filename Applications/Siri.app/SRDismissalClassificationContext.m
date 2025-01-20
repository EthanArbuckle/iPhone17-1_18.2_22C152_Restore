@interface SRDismissalClassificationContext
- (BOOL)classifiedAsUnintended;
- (BOOL)isDeviceUnlocked;
- (SRDismissalClassificationContext)initWithCancellationReason:(int64_t)a3 contentPresentationState:(int64_t)a4 dismissalReason:(int64_t)a5 isDeviceUnlocked:(BOOL)a6 siriState:(int64_t)a7 requestSource:(int64_t)a8;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)cancellationReason;
- (int64_t)contentPresentationState;
- (int64_t)dismissalReason;
- (int64_t)requestSource;
- (int64_t)siriState;
- (void)setClassifiedAsUnintended:(BOOL)a3;
@end

@implementation SRDismissalClassificationContext

- (SRDismissalClassificationContext)initWithCancellationReason:(int64_t)a3 contentPresentationState:(int64_t)a4 dismissalReason:(int64_t)a5 isDeviceUnlocked:(BOOL)a6 siriState:(int64_t)a7 requestSource:(int64_t)a8
{
  v15.receiver = self;
  v15.super_class = (Class)SRDismissalClassificationContext;
  result = [(SRDismissalClassificationContext *)&v15 init];
  if (result)
  {
    result->_cancellationReason = a3;
    result->_contentPresentationState = a4;
    result->_isDeviceUnlocked = a6;
    result->_dismissalReason = a5;
    result->_siriState = a7;
    result->_requestSource = a8;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[SRDismissalClassificationContext allocWithZone:a3] initWithCancellationReason:self->_cancellationReason contentPresentationState:self->_contentPresentationState dismissalReason:self->_dismissalReason isDeviceUnlocked:self->_isDeviceUnlocked siriState:self->_siriState requestSource:self->_requestSource];
  [(SRDismissalClassificationContext *)v4 setClassifiedAsUnintended:self->_classifiedAsUnintended];
  return v4;
}

- (BOOL)classifiedAsUnintended
{
  return self->_classifiedAsUnintended;
}

- (void)setClassifiedAsUnintended:(BOOL)a3
{
  self->_classifiedAsUnintended = a3;
}

- (int64_t)cancellationReason
{
  return self->_cancellationReason;
}

- (int64_t)contentPresentationState
{
  return self->_contentPresentationState;
}

- (int64_t)dismissalReason
{
  return self->_dismissalReason;
}

- (BOOL)isDeviceUnlocked
{
  return self->_isDeviceUnlocked;
}

- (int64_t)siriState
{
  return self->_siriState;
}

- (int64_t)requestSource
{
  return self->_requestSource;
}

@end