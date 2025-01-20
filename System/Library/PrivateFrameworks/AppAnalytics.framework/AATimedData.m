@interface AATimedData
+ (NSString)dataName;
- (AATimedData)init;
- (NSDate)endDate;
- (NSDate)startDate;
- (double)duration;
- (id)toDict;
@end

@implementation AATimedData

- (NSDate)startDate
{
  v2 = (void *)sub_1A916AC10();

  return (NSDate *)v2;
}

- (NSDate)endDate
{
  v2 = (void *)sub_1A916AC10();

  return (NSDate *)v2;
}

- (double)duration
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR___AATimedData_duration);
}

+ (NSString)dataName
{
  v2 = (void *)sub_1A916AF60();

  return (NSString *)v2;
}

- (id)toDict
{
  id result = (id)sub_1A916B7C0();
  __break(1u);
  return result;
}

- (AATimedData)init
{
  id result = (AATimedData *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___AATimedData_startDate;
  uint64_t v4 = sub_1A916AC90();
  v6 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  ((void (*)(void *__return_ptr, char *, uint64_t))v6)((void *)(v4 - 8), v3, v4);
  v5 = (char *)self + OBJC_IVAR___AATimedData_endDate;

  v6(v5, v4);
}

@end