@interface ClimateMaxACButton
- (void)cabinService:(id)a3 didUpdateMaxACOn:(BOOL)a4;
@end

@implementation ClimateMaxACButton

- (void)cabinService:(id)a3 didUpdateMaxACOn:(BOOL)a4
{
  id v5 = a3;
  v6 = self;
  sub_10009F8A4();
  [(ClimateMaxACButton *)v6 setEnabled:(unint64_t)sub_10007EFFC() < 8];
  sub_10008896C();
  sub_100088B54();
}

@end