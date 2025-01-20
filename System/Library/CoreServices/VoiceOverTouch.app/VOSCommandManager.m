@interface VOSCommandManager
- (id)eventForKeyChord:(id)a3;
- (id)eventForKeyChord:(id)a3 resolver:(id)a4;
- (id)eventForKeyChord:(id)a3 resolver:(id)a4 info:(id)a5;
- (id)eventForTouchGesture:(id)a3 resolver:(id)a4;
- (id)eventForTouchGesture:(id)a3 resolver:(id)a4 info:(id)a5;
@end

@implementation VOSCommandManager

- (id)eventForTouchGesture:(id)a3 resolver:(id)a4 info:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(VOSCommandManager *)self commandForTouchGesture:v8 withResolver:v9];
  v12 = [v11 votEventCommandName];
  if (v12)
  {
    if ([v11 commandType] == (id)1)
    {
      v13 = [v11 siriShortcut];

      if (v13)
      {
        if (!v10) {
          id v10 = objc_alloc_init((Class)AXIndexMap);
        }
        v14 = [v11 siriShortcut];
        [v10 setObject:v14 forIndex:117];
      }
    }
    v15 = +[VOTEvent touchEventWithCommand:v12 info:v10];
    v16 = +[VOTEventUserCommandContext contextWithCommand:v11 gesture:v8 keyChord:0 resolver:v9];
    [v15 setUserCommandContext:v16];
  }
  else
  {
    v15 = 0;
  }
  v17 = VOTLogEvent();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    int v19 = 138412802;
    v20 = v15;
    __int16 v21 = 2112;
    id v22 = v8;
    __int16 v23 = 2112;
    id v24 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "resolved event '%@' for gesture '%@' with resolver '%@'", (uint8_t *)&v19, 0x20u);
  }

  return v15;
}

- (id)eventForTouchGesture:(id)a3 resolver:(id)a4
{
  return [(VOSCommandManager *)self eventForTouchGesture:a3 resolver:a4 info:0];
}

- (id)eventForKeyChord:(id)a3 resolver:(id)a4 info:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(VOSCommandManager *)self commandForKeyChord:v8 withResolver:v9];
  v12 = [v11 votEventCommandName];
  if (v12)
  {
    if ([v11 commandType] == (id)1)
    {
      id v13 = [v11 siriShortcut];

      if (v13)
      {
        id v13 = objc_alloc_init((Class)AXIndexMap);
        v14 = [v11 siriShortcut];
        [v13 setObject:v14 forIndex:117];
      }
    }
    else
    {
      id v13 = 0;
    }
    v15 = +[VOTEvent keyEventWithCommand:v12 keyInfo:v10 otherInfo:v13];
    v16 = +[VOTEventUserCommandContext contextWithCommand:v11 gesture:0 keyChord:v8 resolver:v9];
    [v15 setUserCommandContext:v16];
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)eventForKeyChord:(id)a3 resolver:(id)a4
{
  return [(VOSCommandManager *)self eventForKeyChord:a3 resolver:a4 info:0];
}

- (id)eventForKeyChord:(id)a3
{
  id v4 = a3;
  v5 = +[VOSCommandResolver resolverForCurrentHost];
  v6 = [(VOSCommandManager *)self eventForKeyChord:v4 resolver:v5 info:0];

  return v6;
}

@end