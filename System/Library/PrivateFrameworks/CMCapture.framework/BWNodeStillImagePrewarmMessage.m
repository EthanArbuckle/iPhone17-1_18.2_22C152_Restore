@interface BWNodeStillImagePrewarmMessage
+ (id)newMessageWithStillImageSettings:(id)a3;
- (BWStillImageSettings)stillImageSettings;
- (void)_initWithStillImageSettings:(void *)a1;
- (void)dealloc;
@end

@implementation BWNodeStillImagePrewarmMessage

+ (id)newMessageWithStillImageSettings:(id)a3
{
  v4 = [BWNodeStillImagePrewarmMessage alloc];
  return -[BWNodeStillImagePrewarmMessage _initWithStillImageSettings:](v4, a3);
}

- (void)_initWithStillImageSettings:(void *)a1
{
  if (!a1) {
    return 0;
  }
  v6.receiver = a1;
  v6.super_class = (Class)BWNodeStillImagePrewarmMessage;
  v3 = objc_msgSendSuper2(&v6, sel_init);
  v4 = v3;
  if (v3)
  {
    v3[1] = 0x700000001;
    v3[2] = a2;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWNodeStillImagePrewarmMessage;
  [(BWNodeStillImagePrewarmMessage *)&v3 dealloc];
}

- (BWStillImageSettings)stillImageSettings
{
  return self->_stillImageSettings;
}

@end