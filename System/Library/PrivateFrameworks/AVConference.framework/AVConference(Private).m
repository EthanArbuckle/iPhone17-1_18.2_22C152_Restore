@interface AVConference(Private)
- (void)serverDied;
@end

@implementation AVConference(Private)

- (void)serverDied
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVConferenceAPI [%s] %s:%d AVConference: mediaserverd died, notifying client", v2, v3, v4, v5, v6);
}

@end