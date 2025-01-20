@interface DTSysmonTapMemo
- (NSArray)samples;
- (void)setSamples:(id)a3;
@end

@implementation DTSysmonTapMemo

- (NSArray)samples
{
  return *(NSArray **)&self->super._supportsPeek;
}

- (void)setSamples:(id)a3
{
}

- (void).cxx_destruct
{
}

@end