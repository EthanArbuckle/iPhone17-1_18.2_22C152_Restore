@interface AUAOutputStream
- (void)startStream;
- (void)stopStream;
@end

@implementation AUAOutputStream

- (void)startStream
{
}

- (void)stopStream
{
  v2 = self;
  sub_10009AF90((uint64_t)&OBJC_IVAR___AUAStream_signpostID, "AUAOuputStream_stop", (void (*)(uint64_t))sub_10009B198);
}

- (void).cxx_destruct
{
}

@end