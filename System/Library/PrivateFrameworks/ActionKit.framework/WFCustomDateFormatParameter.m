@interface WFCustomDateFormatParameter
- (id)defaultSerializedRepresentation;
- (id)placeholder;
@end

@implementation WFCustomDateFormatParameter

- (id)defaultSerializedRepresentation
{
  return (id)MEMORY[0x270F186F0](self, a2);
}

- (id)placeholder
{
  return (id)MEMORY[0x270F186F0](self, a2);
}

@end