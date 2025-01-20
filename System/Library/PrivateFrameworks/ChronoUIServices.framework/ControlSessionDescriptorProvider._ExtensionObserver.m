@interface ControlSessionDescriptorProvider._ExtensionObserver
- (_TtCC16ChronoUIServicesP33_7A14CBC290C42AA348319CEA8012199432ControlSessionDescriptorProvider18_ExtensionObserver)init;
- (void)extensionsDidChangeForExtensionProvider:(id)a3;
@end

@implementation ControlSessionDescriptorProvider._ExtensionObserver

- (void)extensionsDidChangeForExtensionProvider:(id)a3
{
  if (swift_weakLoadStrong())
  {
    id v6 = a3;
    v5 = self;
    sub_1BC427E1C();
    swift_release();
  }
}

- (_TtCC16ChronoUIServicesP33_7A14CBC290C42AA348319CEA8012199432ControlSessionDescriptorProvider18_ExtensionObserver)init
{
  swift_weakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ControlSessionDescriptorProvider._ExtensionObserver();
  return [(ControlSessionDescriptorProvider._ExtensionObserver *)&v4 init];
}

- (void).cxx_destruct
{
}

@end