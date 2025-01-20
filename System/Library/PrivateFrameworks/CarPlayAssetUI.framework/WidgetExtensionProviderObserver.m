@interface WidgetExtensionProviderObserver
- (_TtC14CarPlayAssetUI31WidgetExtensionProviderObserver)init;
- (void)extensionsDidChangeForExtensionProvider:(id)a3;
@end

@implementation WidgetExtensionProviderObserver

- (void)extensionsDidChangeForExtensionProvider:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_249AA7C14();
}

- (_TtC14CarPlayAssetUI31WidgetExtensionProviderObserver)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  swift_weakInit();
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(WidgetExtensionProviderObserver *)&v5 init];
}

- (void).cxx_destruct
{
}

@end