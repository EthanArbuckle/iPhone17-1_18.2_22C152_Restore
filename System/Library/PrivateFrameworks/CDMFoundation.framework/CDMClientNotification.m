@interface CDMClientNotification
- (_TtC13CDMFoundation21CDMClientNotification)init;
- (void)assetsAvailable;
- (void)assetsAvailableForLocale:(id)a3;
- (void)assetsAvailableForLocale:(id)a3 withType:(int64_t)a4;
- (void)assetsUnavailable;
- (void)assetsUnavailableWithType:(int64_t)a3;
- (void)processCDMNluRequestCallback:(id)a3;
- (void)processCDMNluRequestErrorCallback:(id)a3 error:(id)a4;
@end

@implementation CDMClientNotification

- (void)processCDMNluRequestErrorCallback:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  v7 = self;
  sub_22644C76C();
}

- (void)processCDMNluRequestCallback:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_22644CD4C();
}

- (void)assetsAvailable
{
  v2 = self;
  sub_22644D1A8();
}

- (void)assetsAvailableForLocale:(id)a3
{
  OUTLINED_FUNCTION_240();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_122_0();
  id v5 = v3;
  sub_22644D200();

  OUTLINED_FUNCTION_96();
  v6();
}

- (void)assetsUnavailable
{
  v2 = self;
  sub_22644D4E0();
}

- (void)assetsAvailableForLocale:(id)a3 withType:(int64_t)a4
{
  OUTLINED_FUNCTION_240();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_122_0();
  id v6 = v4;
  sub_22644D670();

  OUTLINED_FUNCTION_96();
  v7();
}

- (void)assetsUnavailableWithType:(int64_t)a3
{
  v3 = self;
  sub_22644D950();
}

- (_TtC13CDMFoundation21CDMClientNotification)init
{
  return (_TtC13CDMFoundation21CDMClientNotification *)sub_22644DAC0();
}

- (void).cxx_destruct
{
}

@end