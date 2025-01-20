@interface ServerBackedExtensionMonitorRegistry.MonitorClientExport
- (_TtCC13AppProtection36ServerBackedExtensionMonitorRegistryP33_0D76BCD90F39FFE5BC347065C6051DB119MonitorClientExport)init;
- (void)extensionMonitorWithUUID:(id)a3 lockedStatusUpdate:(BOOL)a4;
@end

@implementation ServerBackedExtensionMonitorRegistry.MonitorClientExport

- (_TtCC13AppProtection36ServerBackedExtensionMonitorRegistryP33_0D76BCD90F39FFE5BC347065C6051DB119MonitorClientExport)init
{
  swift_weakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ServerBackedExtensionMonitorRegistry.MonitorClientExport();
  return [(ServerBackedExtensionMonitorRegistry.MonitorClientExport *)&v4 init];
}

- (void)extensionMonitorWithUUID:(id)a3 lockedStatusUpdate:(BOOL)a4
{
  uint64_t v6 = sub_247DD28F0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v8);
  v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_247DD28D0();
  if (swift_weakLoadStrong())
  {
    v11 = self;
    sub_247D7035C((uint64_t)v10, a4);

    swift_release();
  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

- (void).cxx_destruct
{
}

@end