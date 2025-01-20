@interface CTKABHelper
+ (id)refId;
+ (unint64_t)_computeIndex;
+ (unint64_t)index;
+ (void)initialize;
@end

@implementation CTKABHelper

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v3 = +[NSUserDefaults standardUserDefaults];
    [v3 removeObjectForKey:@"com.apple.proactive.refId"];

    id v4 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"00000000-0000-0000-0000-000000000000"];
    v5 = (void *)qword_1005630A0;
    qword_1005630A0 = (uint64_t)v4;

    id v6 = [a1 refId];
    qword_1005630A8 = (uint64_t)[a1 _computeIndex];
  }
}

+ (id)refId
{
  v2 = (void *)qword_1005630B0;
  if (!qword_1005630B0)
  {
    id v3 = a1;
    objc_sync_enter(v3);
    objc_storeStrong((id *)&qword_1005630B0, (id)qword_1005630A0);
    objc_sync_exit(v3);

    v2 = (void *)qword_1005630B0;
  }
  id v4 = v2;
  return v4;
}

+ (unint64_t)_computeIndex
{
  v2 = [a1 refId];
  id v3 = v2;
  if (v2)
  {
    [v2 getUUIDBytes:v6];
    unint64_t v4 = v6[1] ^ v6[0];
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

+ (unint64_t)index
{
  return qword_1005630A8;
}

@end