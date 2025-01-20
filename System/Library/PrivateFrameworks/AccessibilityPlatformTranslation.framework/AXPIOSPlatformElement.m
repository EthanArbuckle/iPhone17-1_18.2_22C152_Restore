@interface AXPIOSPlatformElement
+ (id)platformElementWithTranslationObject:(id)a3;
+ (id)platformElementWithTranslationObject:(id)a3 rootParent:(id)a4;
- (AXPTranslationObject)translation;
- (void)setTranslation:(id)a3;
@end

@implementation AXPIOSPlatformElement

+ (id)platformElementWithTranslationObject:(id)a3 rootParent:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[AXPIOSPlatformElement alloc] initWithAccessibilityContainer:v5];

  [(AXPIOSPlatformElement *)v7 setTranslation:v6];

  return v7;
}

+ (id)platformElementWithTranslationObject:(id)a3
{
  id v4 = a3;
  id v5 = +[AXPTranslator_iOS sharedInstance];
  id v6 = [v5 iosPlatformElementFromTranslation:v4];

  v7 = [a1 platformElementWithTranslationObject:v4 rootParent:v6];

  return v7;
}

- (AXPTranslationObject)translation
{
  return self->translation;
}

- (void)setTranslation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end