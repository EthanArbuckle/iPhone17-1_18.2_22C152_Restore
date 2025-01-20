@interface NMCRPCGizmoPreviewState
- (BOOL)hasShownNavModeAdvisory;
- (NMCRPCGizmoPreviewState)initWithMessage:(id)a3;
- (NMMessage)message;
@end

@implementation NMCRPCGizmoPreviewState

- (NMCRPCGizmoPreviewState)initWithMessage:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NMCRPCGizmoPreviewState;
  v6 = [(NMCRPCGizmoPreviewState *)&v11 init];
  if (v6)
  {
    v7 = +[MSPMapsPaths mapsApplicationContainerPaths];
    v8 = [v7 homeDirectory];
    int AppBooleanValueWithContainer = _CFPreferencesGetAppBooleanValueWithContainer();

    v6->_hasShownNavModeAdvisory = AppBooleanValueWithContainer != 0;
    objc_storeStrong((id *)&v6->_message, a3);
  }

  return v6;
}

- (BOOL)hasShownNavModeAdvisory
{
  return self->_hasShownNavModeAdvisory;
}

- (NMMessage)message
{
  return self->_message;
}

- (void).cxx_destruct
{
}

@end