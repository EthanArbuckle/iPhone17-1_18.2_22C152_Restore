@interface CDMGraphServiceUtils
+ (void)setupGraphServices:(NSArray *)a3 completionHandler:(id)a4;
- (CDMGraphServiceUtils)init;
@end

@implementation CDMGraphServiceUtils

+ (void)setupGraphServices:(NSArray *)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = a1;
  v8 = a3;
  sub_2265061EC((uint64_t)&unk_268131358, (uint64_t)v7);
}

- (CDMGraphServiceUtils)init
{
  return (CDMGraphServiceUtils *)sub_2265062F0();
}

@end