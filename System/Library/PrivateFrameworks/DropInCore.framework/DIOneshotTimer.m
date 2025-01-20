@interface DIOneshotTimer
- (DIOneshotTimer)init;
- (DIOneshotTimer)initWithInterval:(double)a3 queue:(id)a4 identifier:(id)a5 label:(id)a6 handler:(id)a7;
- (NSString)description;
- (void)cancelTimer;
- (void)dealloc;
@end

@implementation DIOneshotTimer

- (NSString)description
{
  v2 = self;
  sub_24D0E065C();

  v3 = (void *)sub_24D0F0580();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (DIOneshotTimer)initWithInterval:(double)a3 queue:(id)a4 identifier:(id)a5 label:(id)a6 handler:(id)a7
{
  uint64_t v10 = sub_24D0F0130();
  MEMORY[0x270FA5388](v10 - 8);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a7);
  sub_24D0F0110();
  uint64_t v14 = sub_24D0F05A0();
  uint64_t v16 = v15;
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v13;
  id v18 = a4;
  return (DIOneshotTimer *)OneshotTimer.init(timeInterval:queue:identifier:label:timerFiredHandler:)(a4, (uint64_t)v12, v14, v16, (uint64_t)sub_24D0E13D4, v17, a3);
}

- (void)dealloc
{
  v2 = self;
  OneshotTimer.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_24D0F0130();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_168();
  v3();
  swift_unknownObjectRelease();
  sub_24D0F0490();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_168();
  v4();
  v5 = (char *)self + OBJC_IVAR___DIOneshotTimer_logger;
  sub_24D0F01C0();
  OUTLINED_FUNCTION_11_0();
  v8 = *(void (**)(char *, uint64_t))(v7 + 8);

  v8(v5, v6);
}

- (void)cancelTimer
{
  v2 = self;
  sub_24D0E0168();
}

- (DIOneshotTimer)init
{
}

@end