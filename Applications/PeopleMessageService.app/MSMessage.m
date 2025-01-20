@interface MSMessage
- (id)ppl_pluginPayloadWithAppIconData:(id)a3 appName:(id)a4 allowDataPayloads:(BOOL)a5;
@end

@implementation MSMessage

- (id)ppl_pluginPayloadWithAppIconData:(id)a3 appName:(id)a4 allowDataPayloads:(BOOL)a5
{
  return [(MSMessage *)self _pluginPayloadWithAppIconData:a3 appName:a4 allowDataPayloads:a5];
}

@end