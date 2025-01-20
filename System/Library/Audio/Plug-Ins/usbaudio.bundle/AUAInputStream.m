@interface AUAInputStream
- (void)startStream;
- (void)stopStream;
@end

@implementation AUAInputStream

- (void)startStream
{
}

- (void)stopStream
{
  uint64_t v2 = *(void *)&self->super.ASDStream_opaque[OBJC_IVAR___AUAInputStream_startCount];
  BOOL v3 = v2 != 0;
  uint64_t v4 = v2 - 1;
  if (v3)
  {
    *(void *)&self->super.ASDStream_opaque[OBJC_IVAR___AUAInputStream_startCount] = v4;
    if (!v4)
    {
      v5.receiver = self;
      v5.super_class = (Class)type metadata accessor for AUAInputStream(0);
      [(AUAStream *)&v5 stopStream];
    }
  }
  else
  {
    __break(1u);
  }
}

- (void).cxx_destruct
{
  BOOL v3 = *(void **)&self->super.ASDStream_opaque[OBJC_IVAR___AUAInputStream_lockDelayTransactionList];
}

@end