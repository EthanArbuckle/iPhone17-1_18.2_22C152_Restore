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
  if (qword_100057F48 != -1) {
    dispatch_once(&qword_100057F48, &stru_10004CF30);
  }
  v2 = off_100057B58;
  return v2;
}

+ (id)framework
{
  if (qword_100057F50 != -1) {
    dispatch_once(&qword_100057F50, &stru_10004CF50);
  }
  v2 = off_100057B60;
  return v2;
}

+ (id)compiler
{
  if (qword_100057F58 != -1) {
    dispatch_once(&qword_100057F58, &stru_10004CF70);
  }
  v2 = off_100057B68;
  return v2;
}

+ (id)maintenance
{
  if (qword_100057F60 != -1) {
    dispatch_once(&qword_100057F60, &stru_10004CF90);
  }
  v2 = off_100057B70;
  return v2;
}

+ (id)tool
{
  if (qword_100057F68 != -1) {
    dispatch_once(&qword_100057F68, &stru_10004CFB0);
  }
  v2 = off_100057B78;
  return v2;
}

+ (id)common
{
  if (qword_100057F70 != -1) {
    dispatch_once(&qword_100057F70, &stru_10004CFD0);
  }
  v2 = off_100057B80;
  return v2;
}

+ (id)tests
{
  if (qword_100057F78 != -1) {
    dispatch_once(&qword_100057F78, &stru_10004CFF0);
  }
  v2 = off_100057B88;
  return v2;
}

@end