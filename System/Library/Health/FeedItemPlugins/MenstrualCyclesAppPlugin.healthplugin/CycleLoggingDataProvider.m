@interface CycleLoggingDataProvider
- (void)viewModelProviderDidUpdate:(id)a3;
@end

@implementation CycleLoggingDataProvider

- (void)viewModelProviderDidUpdate:(id)a3
{
  id v3 = a3;
  swift_retain();
  sub_2415CBFA0();

  swift_release();
}

@end