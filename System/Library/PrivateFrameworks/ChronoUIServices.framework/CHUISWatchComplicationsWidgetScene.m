@interface CHUISWatchComplicationsWidgetScene
- (BOOL)generateSnapshotMetadata;
- (BOOL)includeAccessoryViews;
- (CGPoint)bezelContentCenter;
- (CHSWatchComplicationsCurvedLabelMetrics)curvedLabelMetrics;
- (id)_sceneSettings;
- (int64_t)cornerPosition;
@end

@implementation CHUISWatchComplicationsWidgetScene

- (int64_t)cornerPosition
{
  v2 = [(CHUISWatchComplicationsWidgetScene *)self _sceneSettings];
  int64_t v3 = [v2 cornerPosition];

  return v3;
}

- (CHSWatchComplicationsCurvedLabelMetrics)curvedLabelMetrics
{
  v2 = [(CHUISWatchComplicationsWidgetScene *)self _sceneSettings];
  int64_t v3 = [v2 curvedLabelMetrics];

  return (CHSWatchComplicationsCurvedLabelMetrics *)v3;
}

- (CGPoint)bezelContentCenter
{
  v2 = [(CHUISWatchComplicationsWidgetScene *)self _sceneSettings];
  [v2 bezelContentCenter];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (BOOL)includeAccessoryViews
{
  v2 = [(CHUISWatchComplicationsWidgetScene *)self _sceneSettings];
  char v3 = [v2 includeAccessoryViews];

  return v3;
}

- (BOOL)generateSnapshotMetadata
{
  v2 = [(CHUISWatchComplicationsWidgetScene *)self _sceneSettings];
  char v3 = [v2 generateSnapshotMetadata];

  return v3;
}

- (id)_sceneSettings
{
  v2 = [(CHUISWatchComplicationsWidgetScene *)self _FBSScene];
  char v3 = [v2 settings];

  return v3;
}

@end