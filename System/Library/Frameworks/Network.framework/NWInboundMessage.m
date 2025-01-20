@interface NWInboundMessage
- (NSData)content;
@end

@implementation NWInboundMessage

- (NSData)content
{
  id v2 = [(NWMessage *)self internalContent];
  v3 = v2;
  if (v2) {
    id v4 = v2;
  }

  return (NSData *)v3;
}

@end