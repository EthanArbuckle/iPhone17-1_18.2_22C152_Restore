@interface HealthDaemonFeaturesPlugin
- (NSString)pluginIdentifier;
- (_TtC20HealthDaemonFeatures26HealthDaemonFeaturesPlugin)init;
- (id)extensionForHealthDaemon:(id)a3;
- (id)extensionForProfile:(id)a3;
@end

@implementation HealthDaemonFeaturesPlugin

- (NSString)pluginIdentifier
{
  v2 = (void *)sub_251052220();

  return (NSString *)v2;
}

- (id)extensionForHealthDaemon:(id)a3
{
  return 0;
}

- (id)extensionForProfile:(id)a3
{
  id v4 = a3;
  v5 = self;
  if (objc_msgSend(v4, sel_profileType) == (id)1)
  {
    id v6 = objc_allocWithZone((Class)type metadata accessor for HealthDaemonFeaturesProfileExtension());
    v7 = (_TtC20HealthDaemonFeatures26HealthDaemonFeaturesPlugin *)v4;
    id v8 = sub_25105191C(v7);

    v5 = v7;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (_TtC20HealthDaemonFeatures26HealthDaemonFeaturesPlugin)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for HealthDaemonFeaturesPlugin();
  return [(HealthDaemonFeaturesPlugin *)&v3 init];
}

@end