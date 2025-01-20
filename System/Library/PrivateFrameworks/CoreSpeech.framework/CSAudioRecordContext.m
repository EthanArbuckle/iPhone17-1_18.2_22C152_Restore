@interface CSAudioRecordContext
- (BOOL)isPluginContext;
@end

@implementation CSAudioRecordContext

- (BOOL)isPluginContext
{
  unint64_t v2 = (unint64_t)[(CSAudioRecordContext *)self type];
  return (v2 < 0x1B) & (0x4C61D00u >> v2);
}

@end