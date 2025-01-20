@interface SCATMotionTrackerInputSource
- (AXSSMotionTracker)_motionTracker;
- (NSError)_error;
- (NSSet)_expressions;
- (NSSet)cachedCameraPointPickerSwitches;
- (SCATMotionTrackerInputSource)init;
- (double)joystickModeMovementThreshold;
- (double)sensitivity;
- (id)_actionForExpression:(unint64_t)a3;
- (id)_axActionForCameraSwitchType:(unint64_t)a3;
- (id)_axSwitchForCameraSwitchType:(unint64_t)a3;
- (unint64_t)motionTrackingMode;
- (void)_didReceiveActionWithIdentifier:(id)a3 start:(BOOL)a4 ignoreInputHold:(BOOL)a5;
- (void)_setError:(id)a3;
- (void)_setExpressions:(id)a3;
- (void)_updateCameraSwitchCache;
- (void)_updateMotionTrackerExpressionConfig;
- (void)motionTracker:(id)a3 updatedState:(id)a4;
- (void)overrideLookAtPoint:(CGPoint)a3;
- (void)setCachedCameraPointPickerSwitches:(id)a3;
- (void)setJoystickModeMovementThreshold:(double)a3;
- (void)setMotionTrackingMode:(unint64_t)a3;
- (void)setSensitivity:(double)a3;
- (void)set_motionTracker:(id)a3;
- (void)startRunning;
- (void)stopRunning;
@end

@implementation SCATMotionTrackerInputSource

- (SCATMotionTrackerInputSource)init
{
  v15.receiver = self;
  v15.super_class = (Class)SCATMotionTrackerInputSource;
  v2 = [(SCATInputSource *)&v15 init];
  if (v2)
  {
    v3 = (AXSSMotionTracker *)objc_alloc_init((Class)AXSSMotionTracker);
    motionTracker = v2->__motionTracker;
    v2->__motionTracker = v3;

    [(AXSSMotionTracker *)v2->__motionTracker setDelegate:v2];
    id v5 = objc_alloc_init((Class)AXSSMotionTrackingInputConfiguration);
    v6 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_1001BC0A8, 0);
    [v5 setAllowedTrackingTypes:v6];

    [(AXSSMotionTracker *)v2->__motionTracker setInputConfiguration:v5];
    uint64_t v7 = +[NSSet set];
    expressions = v2->__expressions;
    v2->__expressions = (NSSet *)v7;

    error = v2->__error;
    v2->__error = 0;

    [(SCATMotionTrackerInputSource *)v2 _updateCameraSwitchCache];
    [(SCATMotionTrackerInputSource *)v2 _updateMotionTrackerExpressionConfig];
    objc_initWeak(&location, v2);
    v10 = +[AXSettings sharedInstance];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000D22A8;
    v12[3] = &unk_1001AAA68;
    objc_copyWeak(&v13, &location);
    [v10 registerUpdateBlock:v12 forRetrieveSelector:"assistiveTouchCameraPointPickerSwitches" withListener:v2];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)setMotionTrackingMode:(unint64_t)a3
{
  id v4 = [(SCATMotionTrackerInputSource *)self _motionTracker];
  [v4 setMotionTrackingMode:a3];
}

- (void)setSensitivity:(double)a3
{
  id v4 = [(SCATMotionTrackerInputSource *)self _motionTracker];
  [v4 setSensitivity:a3];
}

- (void)setJoystickModeMovementThreshold:(double)a3
{
  id v4 = [(SCATMotionTrackerInputSource *)self _motionTracker];
  [v4 setJoystickModeMovementThreshold:a3];
}

- (void)overrideLookAtPoint:(CGPoint)a3
{
  +[NSValue valueWithPoint:](NSValue, "valueWithPoint:", a3.x, a3.y);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [(SCATMotionTrackerInputSource *)self _motionTracker];
  [v4 setLookAtPoint:v5];
}

- (void)startRunning
{
  [(SCATMotionTrackerInputSource *)self _setError:0];
  [(SCATMotionTrackerInputSource *)self _setExpressions:0];
  id v3 = [(SCATMotionTrackerInputSource *)self _motionTracker];
  [v3 start];
}

- (void)stopRunning
{
  id v3 = [(SCATMotionTrackerInputSource *)self _motionTracker];
  unsigned int v4 = [v3 isTracking];

  if (v4)
  {
    id v5 = [(SCATMotionTrackerInputSource *)self _motionTracker];
    [v5 stop];

    [(SCATMotionTrackerInputSource *)self _setError:0];
    [(SCATMotionTrackerInputSource *)self _setExpressions:0];
  }
}

- (id)_actionForExpression:(unint64_t)a3
{
  id v5 = +[AXSwitch expressionToSwitchTypeMapping];
  v6 = +[NSNumber numberWithUnsignedInteger:a3];
  uint64_t v7 = [v5 objectForKey:v6];

  if (v7)
  {
    v8 = -[SCATMotionTrackerInputSource _axActionForCameraSwitchType:](self, "_axActionForCameraSwitchType:", [v7 unsignedIntegerValue]);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_setError:(id)a3
{
  id v8 = a3;
  if (([v8 isEqual:self->__error] & 1) == 0)
  {
    objc_storeStrong((id *)&self->__error, a3);
    if (v8)
    {
      id v5 = [(SCATInputSource *)self delegate];
      char v6 = objc_opt_respondsToSelector();

      if (v6)
      {
        uint64_t v7 = [(SCATInputSource *)self delegate];
        [v7 motionTrackerInputSourceFailedToTrackFaceWithError:v8];
      }
    }
  }
}

- (void)_setExpressions:(id)a3
{
  id v4 = a3;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000D2854;
  v16[3] = &unk_1001AE670;
  v16[4] = self;
  id v5 = objc_retainBlock(v16);
  if (([(NSSet *)self->__expressions isEqual:v4] & 1) == 0)
  {
    expressions = self->__expressions;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000D2928;
    v13[3] = &unk_1001AE698;
    id v7 = v4;
    id v14 = v7;
    id v8 = v5;
    id v15 = v8;
    [(NSSet *)expressions enumerateObjectsUsingBlock:v13];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000D2994;
    v11[3] = &unk_1001AE698;
    v11[4] = self;
    v12 = v8;
    [v7 enumerateObjectsUsingBlock:v11];
    v9 = (NSSet *)[v7 copy];
    v10 = self->__expressions;
    self->__expressions = v9;
  }
}

- (void)motionTracker:(id)a3 updatedState:(id)a4
{
  id v5 = a4;
  if ([v5 hasFace])
  {
    id v10 = v5;
    AXPerformBlockAsynchronouslyOnMainThread();
    char v6 = objc_msgSend(v10, "expressions", _NSConcreteStackBlock, 3221225472, sub_1000D2B34, &unk_1001AAC78, self);
    id v7 = [v6 copy];
    [(SCATMotionTrackerInputSource *)self _setExpressions:v7];

    [(SCATMotionTrackerInputSource *)self _setError:0];
  }
  else
  {
    id v8 = +[NSSet set];
    [(SCATMotionTrackerInputSource *)self _setExpressions:v8];

    v9 = [v5 error];
    [(SCATMotionTrackerInputSource *)self _setError:v9];
  }
}

- (id)_axActionForCameraSwitchType:(unint64_t)a3
{
  id v3 = [(SCATMotionTrackerInputSource *)self _axSwitchForCameraSwitchType:a3];
  id v4 = +[SCATActionItem fromSwitch:v3 longPress:0];

  return v4;
}

- (id)_axSwitchForCameraSwitchType:(unint64_t)a3
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = [(SCATMotionTrackerInputSource *)self cachedCameraPointPickerSwitches];
  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    uint64_t v8 = SCATSwitchSourceMotionTracker;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v11 = [v10 source];
        if ([v11 isEqualToString:v8])
        {
          id v12 = [v10 cameraSwitch];

          if (v12 == (id)a3)
          {
            id v13 = v10;
            goto LABEL_13;
          }
        }
        else
        {
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
  id v13 = 0;
LABEL_13:

  return v13;
}

- (void)_didReceiveActionWithIdentifier:(id)a3 start:(BOOL)a4 ignoreInputHold:(BOOL)a5
{
  id v6 = a3;
  id v5 = v6;
  AXPerformBlockAsynchronouslyOnMainThread();
  HNDTestingSetLastFiredAction(v5);
}

- (void)_updateCameraSwitchCache
{
  id v4 = +[AXSettings sharedInstance];
  id v3 = [v4 assistiveTouchCameraPointPickerSwitches];
  [(SCATMotionTrackerInputSource *)self setCachedCameraPointPickerSwitches:v3];
}

- (void)_updateMotionTrackerExpressionConfig
{
  id v3 = [(SCATMotionTrackerInputSource *)self _motionTracker];
  id v4 = [v3 expressionConfiguration];
  id v5 = [v4 copy];

  if (!v5)
  {
    id v5 = +[AXSSMotionTrackingExpressionConfiguration defaultExpressionConfiguration];
  }
  id v6 = +[AXSwitch expressionToSwitchTypeMapping];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    id v8 = v7;
    char v9 = 0;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v13 = [v12 unsignedIntegerValue];
        id v14 = [v6 objectForKeyedSubscript:v12];
        id v15 = [v14 unsignedIntegerValue];

        long long v16 = [(SCATMotionTrackerInputSource *)self _axSwitchForCameraSwitchType:v15];
        long long v17 = v16;
        if (v16)
        {
          id v18 = [v16 expressionSensitivity];
          if (v18)
          {
            id v19 = v18;
            if ([v5 sensitivityForFacialExpression:v13] != v18)
            {
              [v5 setSensitivity:v19 forFacialExpression:v13];
              char v9 = 1;
            }
          }
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
    if (v9)
    {
      v20 = [(SCATMotionTrackerInputSource *)self _motionTracker];
      [v20 setExpressionConfiguration:v5];
    }
  }
}

- (unint64_t)motionTrackingMode
{
  return self->_motionTrackingMode;
}

- (double)sensitivity
{
  return self->_sensitivity;
}

- (double)joystickModeMovementThreshold
{
  return self->_joystickModeMovementThreshold;
}

- (AXSSMotionTracker)_motionTracker
{
  return self->__motionTracker;
}

- (void)set_motionTracker:(id)a3
{
}

- (NSSet)_expressions
{
  return self->__expressions;
}

- (NSError)_error
{
  return self->__error;
}

- (NSSet)cachedCameraPointPickerSwitches
{
  return self->_cachedCameraPointPickerSwitches;
}

- (void)setCachedCameraPointPickerSwitches:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedCameraPointPickerSwitches, 0);
  objc_storeStrong((id *)&self->__error, 0);
  objc_storeStrong((id *)&self->__expressions, 0);

  objc_storeStrong((id *)&self->__motionTracker, 0);
}

@end