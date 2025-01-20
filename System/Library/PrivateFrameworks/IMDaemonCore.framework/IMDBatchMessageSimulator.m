@interface IMDBatchMessageSimulator
- (BOOL)runWithError:(id *)a3;
- (IMDBatchMessageSimulator)init;
- (IMDBatchMessageSimulator)initWithMessages:(id)a3;
- (NSArray)messages;
@end

@implementation IMDBatchMessageSimulator

- (NSArray)messages
{
  sub_1D968E084(0, &qword_1EA8C9570);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1D9906F00();
  swift_bridgeObjectRelease();

  return (NSArray *)v2;
}

- (IMDBatchMessageSimulator)initWithMessages:(id)a3
{
  sub_1D968E084(0, &qword_1EA8C9570);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMDBatchMessageSimulator_messages) = (Class)sub_1D9906F20();
  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR___IMDBatchMessageSimulator_batch);
  void *v4 = 0;
  v4[1] = 0;
  v4[2] = MEMORY[0x1E4FBC860];
  v6.receiver = self;
  v6.super_class = (Class)IMDBatchMessageSimulator;
  return [(IMDBatchMessageSimulator *)&v6 init];
}

- (BOOL)runWithError:(id *)a3
{
  v3 = self;
  sub_1D989FFFC();

  return 1;
}

- (IMDBatchMessageSimulator)init
{
  result = (IMDBatchMessageSimulator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___IMDBatchMessageSimulator_batch;
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMDBatchMessageSimulator_batch);
  id v5 = (id)*((void *)v3 + 1);
  swift_bridgeObjectRelease();
}

@end