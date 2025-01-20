@interface PSSpecifierAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityIdentification;
- (void)dealloc;
@end

@implementation PSSpecifierAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PSSpecifier";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)dealloc
{
  [(PSSpecifierAccessibility *)self _accessibilityUnregister];
  v3.receiver = self;
  v3.super_class = (Class)PSSpecifierAccessibility;
  [(PSSpecifierAccessibility *)&v3 dealloc];
}

- (id)accessibilityIdentification
{
  objc_super v3 = [(PSSpecifierAccessibility *)self propertyForKey:@"accessibilityIdentification"];
  if (v3) {
    goto LABEL_12;
  }
  v6.receiver = self;
  v6.super_class = (Class)PSSpecifierAccessibility;
  objc_super v3 = [(PSSpecifierAccessibility *)&v6 accessibilityIdentification];
  if (v3
    || ([(PSSpecifierAccessibility *)self propertyForKey:*MEMORY[0x263F60138]],
        (objc_super v3 = objc_claimAutoreleasedReturnValue()) != 0)
    || ([(PSSpecifierAccessibility *)self propertyForKey:*MEMORY[0x263F60170]],
        (objc_super v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
LABEL_12:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v4 = [NSString stringWithFormat:@"%@", v3];

      objc_super v3 = (void *)v4;
    }
  }

  return v3;
}

@end