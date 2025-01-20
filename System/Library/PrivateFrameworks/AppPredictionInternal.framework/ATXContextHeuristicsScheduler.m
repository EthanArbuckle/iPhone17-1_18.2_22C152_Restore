@interface ATXContextHeuristicsScheduler
- (ATXContextHeuristicsScheduler)init;
- (ATXContextHeuristicsScheduler)initWithContextHeuristics:(id)a3;
- (void)dealloc;
- (void)start;
@end

@implementation ATXContextHeuristicsScheduler

- (ATXContextHeuristicsScheduler)initWithContextHeuristics:(id)a3
{
  return (ATXContextHeuristicsScheduler *)ContextHeuristicsScheduler.init(contextHeuristics:)((uint64_t)a3);
}

- (void)start
{
  v2 = self;
  ContextHeuristicsScheduler.start()();
}

- (void)dealloc
{
  v2 = self;
  ContextHeuristicsScheduler.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
}

- (ATXContextHeuristicsScheduler)init
{
  result = (ATXContextHeuristicsScheduler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end