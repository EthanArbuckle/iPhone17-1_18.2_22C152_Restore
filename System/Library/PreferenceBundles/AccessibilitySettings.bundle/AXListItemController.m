@interface AXListItemController
- (id)specifiers;
@end

@implementation AXListItemController

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSListItemsController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v12.receiver = self;
    v12.super_class = (Class)AXListItemController;
    id v5 = [(AXListItemController *)&v12 specifiers];
    if (!*(void *)&self->PSListItemsController_opaque[v3]) {
      _AXAssert();
    }
    objc_opt_class();
    uint64_t v6 = PSFooterTextGroupKey;
    v7 = [*(id *)&self->PSListItemsController_opaque[OBJC_IVAR___PSViewController__specifier] propertyForKey:PSFooterTextGroupKey];
    v8 = __UIAccessibilityCastAsClass();

    if ([v8 length])
    {
      objc_opt_class();
      v9 = [*(id *)&self->PSListItemsController_opaque[v3] firstObject];
      v10 = __UIAccessibilityCastAsClass();

      [v10 setProperty:v8 forKey:v6];
    }

    v4 = *(void **)&self->PSListItemsController_opaque[v3];
  }

  return v4;
}

@end