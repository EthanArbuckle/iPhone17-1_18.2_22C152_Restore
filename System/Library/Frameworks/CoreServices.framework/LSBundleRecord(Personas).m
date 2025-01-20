@interface LSBundleRecord(Personas)
- (NSArray)_personasWithAttributes;
@end

@implementation LSBundleRecord(Personas)

- (NSArray)_personasWithAttributes
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

@end