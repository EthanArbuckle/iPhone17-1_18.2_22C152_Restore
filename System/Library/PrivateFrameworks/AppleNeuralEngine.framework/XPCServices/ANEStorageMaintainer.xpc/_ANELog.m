@interface _ANELog
+ (id)common;
+ (id)compiler;
+ (id)daemon;
+ (id)framework;
+ (id)maintenance;
+ (id)tests;
+ (id)tool;
@end

@implementation _ANELog

+ (id)daemon
{
  if (qword_100042E90 != -1) {
    dispatch_once(&qword_100042E90, &stru_10003CDF0);
  }
  v2 = off_100042C78;
  return v2;
}

+ (id)framework
{
  if (qword_100042E98 != -1) {
    dispatch_once(&qword_100042E98, &stru_10003CE10);
  }
  v2 = off_100042C80;
  return v2;
}

+ (id)compiler
{
  if (qword_100042EA0 != -1) {
    dispatch_once(&qword_100042EA0, &stru_10003CE30);
  }
  v2 = off_100042C88;
  return v2;
}

+ (id)maintenance
{
  if (qword_100042EA8 != -1) {
    dispatch_once(&qword_100042EA8, &stru_10003CE50);
  }
  v2 = off_100042C90;
  return v2;
}

+ (id)tool
{
  if (qword_100042EB0 != -1) {
    dispatch_once(&qword_100042EB0, &stru_10003CE70);
  }
  v2 = off_100042C98;
  return v2;
}

+ (id)common
{
  if (qword_100042EB8 != -1) {
    dispatch_once(&qword_100042EB8, &stru_10003CE90);
  }
  v2 = off_100042CA0;
  return v2;
}

+ (id)tests
{
  if (qword_100042EC0 != -1) {
    dispatch_once(&qword_100042EC0, &stru_10003CEB0);
  }
  v2 = off_100042CA8;
  return v2;
}

@end