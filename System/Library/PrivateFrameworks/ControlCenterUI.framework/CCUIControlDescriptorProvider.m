@interface CCUIControlDescriptorProvider
- (CCUIControlDescriptorProvider)init;
- (CCUIControlDescriptorProvider)initWithWidgetExtensionProvider:(id)a3;
- (id)descriptorFor:(id)a3;
@end

@implementation CCUIControlDescriptorProvider

- (CCUIControlDescriptorProvider)initWithWidgetExtensionProvider:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CCUIControlDescriptorProvider_widgetExtensionProvider) = (Class)a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ControlDescriptorProvider();
  id v4 = a3;
  return [(CCUIControlDescriptorProvider *)&v6 init];
}

- (id)descriptorFor:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_super v6 = (void *)sub_1D7BB7528();

  return v6;
}

- (CCUIControlDescriptorProvider)init
{
  result = (CCUIControlDescriptorProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end