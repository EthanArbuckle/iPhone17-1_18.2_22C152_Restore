@interface WidgetExtensionXPCServer
- (BOOL)shouldAcceptConnection:(id)a3;
- (_TtC9WidgetKit24WidgetExtensionXPCServer)init;
@end

@implementation WidgetExtensionXPCServer

- (BOOL)shouldAcceptConnection:(id)a3
{
  id v5 = objc_allocWithZone((Class)type metadata accessor for WidgetExtensionXPCServer.ExportedObject());
  id v6 = a3;
  v7 = self;
  id v8 = sub_191B10924(v6);
  id v9 = objc_msgSend((id)type metadata accessor for _WidgetExtensionBaseContext(), sel__extensionAuxiliaryVendorProtocol);
  objc_msgSend(v6, sel_setExportedInterface_, v9);

  objc_msgSend(v6, sel_setExportedObject_, v8);
  objc_msgSend(v6, sel_resume);

  return 1;
}

- (_TtC9WidgetKit24WidgetExtensionXPCServer)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for WidgetExtensionXPCServer();
  return [(WidgetExtensionXPCServer *)&v3 init];
}

@end