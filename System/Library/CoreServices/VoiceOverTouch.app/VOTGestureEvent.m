@interface VOTGestureEvent
+ (id)gestureEventWithEventRepresentation:(id)a3;
- (AXEventRepresentation)eventRepresentation;
- (BOOL)_eventMaskHasTouch;
- (BOOL)_isBogusTouchEvent;
- (BOOL)didFallThruToDevice;
- (BOOL)isCancelEvent;
- (BOOL)isDownEvent;
- (BOOL)isLiftEvent;
- (BOOL)isMovedEvent;
- (BOOL)isNonLiftingInRangeEvent;
- (BOOL)isStylusEvent;
- (id)_initWithDeviceIdentifier:(unint64_t)a3 andEventRepresentation:(id)a4;
- (id)description;
- (void)_addFingerInformation;
- (void)dealloc;
- (void)setEventRepresentation:(id)a3;
@end

@implementation VOTGestureEvent

+ (id)gestureEventWithEventRepresentation:(id)a3
{
  id v3 = a3;
  if ([v3 type] == 3001) {
    id v4 = [objc_allocWithZone((Class)VOTGestureEvent) _initWithDeviceIdentifier:1 andEventRepresentation:v3];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)_initWithDeviceIdentifier:(unint64_t)a3 andEventRepresentation:(id)a4
{
  id v6 = a4;
  v7 = [(VOTGestureEvent *)self initWithDeviceIdentifier:a3];
  v8 = v7;
  if (v7)
  {
    [(VOTGestureEvent *)v7 setEventRepresentation:v6];
    v9 = v8;
  }

  return v8;
}

- (void)dealloc
{
  [(VOTGestureEvent *)self setEventRepresentation:0];
  v3.receiver = self;
  v3.super_class = (Class)VOTGestureEvent;
  [(VOTGestureEvent *)&v3 dealloc];
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)VOTGestureEvent;
  objc_super v3 = [(VOTGestureEvent *)&v7 description];
  id v4 = [(VOTGestureEvent *)self eventRepresentation];
  v5 = +[NSString stringWithFormat:@"%@\nAXEventRep:%@", v3, v4];

  return v5;
}

- (void)setEventRepresentation:(id)a3
{
  p_eventRepresentation = &self->_eventRepresentation;
  objc_storeStrong((id *)&self->_eventRepresentation, a3);
  if (*p_eventRepresentation)
  {
    [(VOTGestureEvent *)self _addFingerInformation];
  }
}

- (BOOL)isCancelEvent
{
  v2 = [(AXEventRepresentation *)self->_eventRepresentation handInfo];
  BOOL v3 = [v2 eventType] == 8;

  return v3;
}

- (BOOL)isLiftEvent
{
  BOOL v3 = [(AXEventRepresentation *)self->_eventRepresentation handInfo];
  unsigned int v4 = [v3 eventType];

  if (v4 == 6 || v4 == 10) {
    return 1;
  }
  if (v4 == 9) {
    return ![(VOTGestureEvent *)self isNonLiftingInRangeEvent];
  }
  return 0;
}

- (BOOL)_eventMaskHasTouch
{
  if (![(AXEventRepresentation *)self->_eventRepresentation creatorHIDEvent])
  {
    unsigned int v4 = VOTLogEvent();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_10011DF20((uint64_t)self, v4);
    }
    goto LABEL_8;
  }
  if (IOHIDEventGetType() != 11)
  {
    unsigned int v4 = VOTLogEvent();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_10011DF98((uint64_t)self, v4);
    }
LABEL_8:

    LOBYTE(v3) = 0;
    return v3;
  }
  return ((unint64_t)IOHIDEventGetIntegerValue() >> 1) & 1;
}

- (BOOL)_isBogusTouchEvent
{
  BOOL v3 = [(VOTGestureEvent *)self isStylusEvent];
  if (v3)
  {
    unsigned int v4 = [(AXEventRepresentation *)self->_eventRepresentation handInfo];
    unsigned int v5 = [v4 eventType];

    if (v5 == 1) {
      LOBYTE(v3) = ![(VOTGestureEvent *)self _eventMaskHasTouch];
    }
    else {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (BOOL)isNonLiftingInRangeEvent
{
  BOOL v3 = [(AXEventRepresentation *)self->_eventRepresentation handInfo];
  unsigned int v4 = [v3 eventType];

  if (v4 == 9) {
    return ![(VOTGestureEvent *)self _eventMaskHasTouch];
  }
  else {
    return 0;
  }
}

- (BOOL)isDownEvent
{
  BOOL v3 = [(AXEventRepresentation *)self->_eventRepresentation handInfo];
  if ([v3 eventType] == 1) {
    unsigned int v4 = ![(VOTGestureEvent *)self _isBogusTouchEvent];
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (BOOL)isMovedEvent
{
  BOOL v3 = [(AXEventRepresentation *)self->_eventRepresentation handInfo];
  if ([v3 eventType] == 2) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = [(VOTGestureEvent *)self _isBogusTouchEvent];
  }

  return v4;
}

- (BOOL)isStylusEvent
{
  v2 = [(AXEventRepresentation *)self->_eventRepresentation handInfo];
  unsigned __int8 v3 = [v2 isStylus];

  return v3;
}

- (void)_addFingerInformation
{
  if (![(VOTGestureEvent *)self isLiftEvent])
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    unsigned __int8 v3 = [(AXEventRepresentation *)self->_eventRepresentation handInfo];
    BOOL v4 = [v3 paths];

    id v5 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v22;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v22 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if (([v9 pathProximity] & 2) != 0)
          {
            [v9 pathLocation];
            double v11 = sub_100051DFC(v10);
            double v13 = v12;
            unsigned int v14 = [v9 transducerType];
            uint64_t v15 = [v9 pathIndex];
            [v9 orbValue];
            double v17 = v16;
            if (v14)
            {
              -[VOTGestureEvent addFingerWithIdentifier:location:pressure:](self, "addFingerWithIdentifier:location:pressure:", v15, v11, v13, v17);
            }
            else
            {
              [v9 altitude];
              double v19 = v18;
              [v9 azimuth];
              -[VOTGestureEvent addStylusWithIdentifier:location:pressure:altitude:azimuth:](self, "addStylusWithIdentifier:location:pressure:altitude:azimuth:", v15, v11, v13, v17, v19, v20);
            }
          }
        }
        id v6 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v6);
    }
  }
}

- (BOOL)didFallThruToDevice
{
  return ((unint64_t)[(AXEventRepresentation *)self->_eventRepresentation additionalFlags] >> 24) & 1;
}

- (AXEventRepresentation)eventRepresentation
{
  return self->_eventRepresentation;
}

- (void).cxx_destruct
{
}

@end