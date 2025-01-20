@interface PSSpecifier
- (id)complication;
- (void)setComplication:(id)a3;
@end

@implementation PSSpecifier

- (id)complication
{
  return [(PSSpecifier *)self propertyForKey:@"CCSComplication"];
}

- (void)setComplication:(id)a3
{
}

@end