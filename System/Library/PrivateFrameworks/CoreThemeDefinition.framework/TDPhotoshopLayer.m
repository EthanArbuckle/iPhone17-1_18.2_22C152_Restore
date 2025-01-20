@interface TDPhotoshopLayer
- (id)hierarchicalLayerNames;
@end

@implementation TDPhotoshopLayer

- (id)hierarchicalLayerNames
{
  v3 = objc_msgSend((id)-[TDPhotoshopLayer parentLayer](self, "parentLayer"), "hierarchicalLayerNames");
  if ([v3 count] && objc_msgSend((id)-[TDPhotoshopLayer name](self, "name"), "length"))
  {
    uint64_t v4 = [(TDPhotoshopLayer *)self name];
    return (id)[v3 arrayByAddingObject:v4];
  }
  else
  {
    id result = (id)objc_msgSend((id)-[TDPhotoshopLayer name](self, "name"), "length");
    if (result)
    {
      v6 = (void *)MEMORY[0x263EFF8C0];
      uint64_t v7 = [(TDPhotoshopLayer *)self name];
      return (id)[v6 arrayWithObject:v7];
    }
  }
  return result;
}

@end