@interface WSWorkloop
+ (OS_dispatch_queue)sharedFrameworkWorkloop;
+ (id)createWorkloopWithLabel:(id)a3;
@end

@implementation WSWorkloop

+ (OS_dispatch_queue)sharedFrameworkWorkloop
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_2AD8;
  block[3] = &unk_41E60;
  block[4] = a1;
  if (qword_49138[0] != -1) {
    dispatch_once(qword_49138, block);
  }
  v2 = (void *)qword_49130;

  return (OS_dispatch_queue *)v2;
}

+ (id)createWorkloopWithLabel:(id)a3
{
  inactive = dispatch_workloop_create_inactive((const char *)[a3 UTF8String]);
  dispatch_workloop_set_autorelease_frequency(inactive, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_activate(inactive);

  return inactive;
}

@end