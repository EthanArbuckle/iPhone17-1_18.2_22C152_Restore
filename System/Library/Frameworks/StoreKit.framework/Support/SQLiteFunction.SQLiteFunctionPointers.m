@interface SQLiteFunction.SQLiteFunctionPointers
- (_TtCC9storekitd14SQLiteFunction22SQLiteFunctionPointers)init;
- (const)name;
- (void)implementation;
- (void)setImplementation:(void *)a3;
- (void)setName:(const char *)a3;
- (void)setXDestroy:(void *)a3;
- (void)setXFunc:(void *)a3;
- (void)xDestroy;
- (void)xFunc;
@end

@implementation SQLiteFunction.SQLiteFunctionPointers

- (const)name
{
  return (const char *)sub_1000A9F68();
}

- (void)setName:(const char *)a3
{
}

- (void)implementation
{
  return (void *)sub_1000A9FCC();
}

- (void)setImplementation:(void *)a3
{
}

- (void)xFunc
{
  return (void *)sub_1000AA030();
}

- (void)setXFunc:(void *)a3
{
}

- (void)xDestroy
{
  return (void *)sub_1000AA094();
}

- (void)setXDestroy:(void *)a3
{
}

- (_TtCC9storekitd14SQLiteFunction22SQLiteFunctionPointers)init
{
}

@end