@interface ProcessStateTrackingContext
- (void)dealloc;
@end

@implementation ProcessStateTrackingContext

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", self->token);
  v3.receiver = self;
  v3.super_class = (Class)ProcessStateTrackingContext;
  [(ProcessStateTrackingContext *)&v3 dealloc];
}

@end