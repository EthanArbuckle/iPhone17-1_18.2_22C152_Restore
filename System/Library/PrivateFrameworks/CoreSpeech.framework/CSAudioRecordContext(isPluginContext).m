@interface CSAudioRecordContext(isPluginContext)
- (uint64_t)isPluginContext;
@end

@implementation CSAudioRecordContext(isPluginContext)

- (uint64_t)isPluginContext
{
  unint64_t v1 = [a1 type];
  return (v1 < 0x1B) & (0x4C61D00u >> v1);
}

@end