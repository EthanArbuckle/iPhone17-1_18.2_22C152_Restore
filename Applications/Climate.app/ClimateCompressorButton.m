@interface ClimateCompressorButton
- (void)cabinService:(id)a3 didUpdateCompressorOn:(BOOL)a4;
@end

@implementation ClimateCompressorButton

- (void)cabinService:(id)a3 didUpdateCompressorOn:(BOOL)a4
{
  id v5 = a3;
  v6 = self;
  sub_10009F8A4();
  [(ClimateCompressorButton *)v6 setEnabled:(unint64_t)sub_100004580() < 8];
  sub_10008896C();
  sub_100088B54();
}

@end