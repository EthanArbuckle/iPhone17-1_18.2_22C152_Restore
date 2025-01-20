@interface AppTelemetryLaunchDetails
@end

@implementation AppTelemetryLaunchDetails

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchEvents, 0);
  objc_storeStrong((id *)&self->_oldestTimestamp, 0);
}

@end