@interface UISDeviceContext
+ (id)clb_contextForDisplayStyle:(int64_t)a3;
@end

@implementation UISDeviceContext

+ (id)clb_contextForDisplayStyle:(int64_t)a3
{
  BSDispatchQueueAssertMain();
  v4 = +[UISMutableDeviceContext defaultContext];
  if (a3 == 1)
  {
    if (sub_100020140() == (id)2)
    {
      [v4 setDeviceInfoValue:&off_1001690E0 forKey:UISDeviceContextHomeButtonTypeKey];
      [v4 setDeviceInfoValue:&off_1001690F8 forKey:UISDeviceContextDeviceCornerRadiusKey];
      goto LABEL_8;
    }
    uint64_t v7 = sub_10000730C();
    double v6 = sub_10001FE30(v7);
  }
  else
  {
    if (a3) {
      goto LABEL_8;
    }
    uint64_t v5 = sub_100013FEC();
    double v6 = sub_10001FE30(v5);
  }
  v8 = +[NSNumber numberWithDouble:v6];
  [v4 setDeviceInfoValue:v8 forKey:UISDeviceContextDeviceCornerRadiusKey];

LABEL_8:

  return v4;
}

@end