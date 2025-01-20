@interface VOTEvent
+ (id)appleTVRemoteEventWithCommand:(id)a3 info:(id)a4;
+ (id)brailleEventWithCommand:(id)a3 info:(id)a4;
+ (id)externalDeviceEventWithCommand:(id)a3 info:(id)a4;
+ (id)internalEventWithCommand:(id)a3 info:(id)a4;
+ (id)keyEventWithCommand:(id)a3 keyInfo:(id)a4;
+ (id)keyEventWithCommand:(id)a3 keyInfo:(id)a4 otherInfo:(id)a5;
+ (id)systemServerEventWithCommand:(id)a3 info:(id)a4;
+ (id)touchEventWithCommand:(id)a3 info:(id)a4;
- (BOOL)bypassHelp;
- (BOOL)isAppleTVRemoteEvent;
- (BOOL)isBrailleEvent;
- (BOOL)isExternalDeviceEvent;
- (BOOL)isGuideElementMovementEvent;
- (BOOL)isKeyEvent;
- (BOOL)isSystemServerEvent;
- (BOOL)isTouchEvent;
- (CGPoint)touchPoint;
- (CGPoint)touchRawLocation;
- (NSString)command;
- (VOTEvent)initWithType:(int64_t)a3;
- (VOTEventUserCommandContext)userCommandContext;
- (VOTKeyInfo)keyInfo;
- (double)time;
- (double)touchForce;
- (double)touchVelocity;
- (id)completedHandlingBlock;
- (id)description;
- (id)objectForIndex:(unint64_t)a3;
- (int64_t)origin;
- (int64_t)tvTouchPadRegion;
- (unint64_t)fingerCount;
- (void)setBypassHelp:(BOOL)a3;
- (void)setCommand:(id)a3;
- (void)setCompletedHandlingBlock:(id)a3;
- (void)setFingerCount:(unint64_t)a3;
- (void)setInfo:(id)a3;
- (void)setIsGuideElementMovementEvent:(BOOL)a3;
- (void)setKeyInfo:(id)a3;
- (void)setObject:(id)a3 forIndex:(unint64_t)a4;
- (void)setOrigin:(int64_t)a3;
- (void)setTouchForce:(double)a3;
- (void)setTouchPoint:(CGPoint)a3;
- (void)setTouchRawLocation:(CGPoint)a3;
- (void)setTouchVelocity:(double)a3;
- (void)setUserCommandContext:(id)a3;
@end

@implementation VOTEvent

- (VOTEvent)initWithType:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VOTEvent;
  v4 = [(VOTEvent *)&v6 init];
  if (v4)
  {
    v4->_time = CFAbsoluteTimeGetCurrent();
    v4->_origin = a3;
  }
  return v4;
}

+ (id)externalDeviceEventWithCommand:(id)a3 info:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[VOTEvent alloc] initWithType:3];
  [(VOTEvent *)v7 setCommand:v6];

  [(VOTEvent *)v7 setInfo:v5];

  return v7;
}

+ (id)keyEventWithCommand:(id)a3 keyInfo:(id)a4 otherInfo:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [objc_allocWithZone((Class)VOTEvent) initWithType:4];
  [v10 setCommand:v9];

  [v10 setKeyInfo:v8];
  if (v7) {
    [v10 setInfo:v7];
  }

  return v10;
}

+ (id)keyEventWithCommand:(id)a3 keyInfo:(id)a4
{
  return +[VOTEvent keyEventWithCommand:a3 keyInfo:a4 otherInfo:0];
}

+ (id)touchEventWithCommand:(id)a3 info:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [objc_allocWithZone((Class)VOTEvent) initWithType:2];
  [v7 setCommand:v6];

  [v7 setInfo:v5];

  return v7;
}

+ (id)internalEventWithCommand:(id)a3 info:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [objc_allocWithZone((Class)VOTEvent) initWithType:1];
  [v7 setCommand:v6];

  [v7 setInfo:v5];

  return v7;
}

+ (id)systemServerEventWithCommand:(id)a3 info:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [objc_allocWithZone((Class)VOTEvent) initWithType:6];
  [v7 setCommand:v6];

  [v7 setInfo:v5];

  return v7;
}

+ (id)appleTVRemoteEventWithCommand:(id)a3 info:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [objc_allocWithZone((Class)VOTEvent) initWithType:7];
  [v7 setCommand:v6];

  [v7 setInfo:v5];

  return v7;
}

+ (id)brailleEventWithCommand:(id)a3 info:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [objc_allocWithZone((Class)VOTEvent) initWithType:5];
  [v7 setCommand:v6];

  [v7 setInfo:v5];

  return v7;
}

- (double)time
{
  return self->_time;
}

- (BOOL)isKeyEvent
{
  return self->_origin == 4;
}

- (BOOL)isTouchEvent
{
  return self->_origin == 2;
}

- (BOOL)isExternalDeviceEvent
{
  return self->_origin == 3;
}

- (BOOL)isBrailleEvent
{
  return self->_origin == 5;
}

- (BOOL)isSystemServerEvent
{
  return self->_origin == 6;
}

- (BOOL)isAppleTVRemoteEvent
{
  return self->_origin == 7;
}

- (void)setKeyInfo:(id)a3
{
}

- (VOTKeyInfo)keyInfo
{
  return (VOTKeyInfo *)[(VOTEvent *)self objectForIndex:102];
}

- (void)setInfo:(id)a3
{
  info = self->_info;
  if (info)
  {
    [(AXIndexMap *)info addObjectsFromIndexMap:a3];
  }
  else
  {
    self->_info = (AXIndexMap *)[a3 copyWithZone:0];
    _objc_release_x1();
  }
}

- (void)setObject:(id)a3 forIndex:(unint64_t)a4
{
  id v6 = a3;
  info = self->_info;
  id v10 = v6;
  if (!info)
  {
    id v8 = (AXIndexMap *)[objc_allocWithZone((Class)AXIndexMap) init];
    id v9 = self->_info;
    self->_info = v8;

    id v6 = v10;
    info = self->_info;
  }
  [(AXIndexMap *)info setObject:v6 forIndex:a4];
}

- (id)objectForIndex:(unint64_t)a3
{
  return [(AXIndexMap *)self->_info objectForIndex:a3];
}

- (BOOL)bypassHelp
{
  return self->_bypassHelp;
}

- (void)setBypassHelp:(BOOL)a3
{
  self->_bypassHelp = a3;
}

- (id)description
{
  int64_t origin = self->_origin;
  info = self->_info;
  id v5 = [(VOTEvent *)self command];
  id v6 = +[NSString stringWithFormat:@"VOTEvent:[%p] Type: %d. Info: %@ Command:%@", self, origin, info, v5];

  return v6;
}

- (int64_t)tvTouchPadRegion
{
  [(VOTEvent *)self touchRawLocation];
  double v3 = v2 * 2.0 + -1.0;
  double v5 = v4 * 2.0 + -1.0;
  double v6 = -v5;
  if (v3 <= -v5 && v5 <= v3) {
    return 0;
  }
  if (v3 >= v6 && v5 >= v3) {
    return 2;
  }
  if (v5 > v3 || v3 < v6) {
    return 3;
  }
  else {
    return 1;
  }
}

- (int64_t)origin
{
  return self->_origin;
}

- (void)setOrigin:(int64_t)a3
{
  self->_int64_t origin = a3;
}

- (NSString)command
{
  return self->_command;
}

- (void)setCommand:(id)a3
{
}

- (CGPoint)touchPoint
{
  double x = self->_touchPoint.x;
  double y = self->_touchPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setTouchPoint:(CGPoint)a3
{
  self->_touchPoint = a3;
}

- (CGPoint)touchRawLocation
{
  double x = self->_touchRawLocation.x;
  double y = self->_touchRawLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setTouchRawLocation:(CGPoint)a3
{
  self->_touchRawLocation = a3;
}

- (unint64_t)fingerCount
{
  return self->_fingerCount;
}

- (void)setFingerCount:(unint64_t)a3
{
  self->_fingerCount = a3;
}

- (double)touchVelocity
{
  return self->_touchVelocity;
}

- (void)setTouchVelocity:(double)a3
{
  self->_touchVelocitdouble y = a3;
}

- (double)touchForce
{
  return self->_touchForce;
}

- (void)setTouchForce:(double)a3
{
  self->_touchForce = a3;
}

- (id)completedHandlingBlock
{
  return self->_completedHandlingBlock;
}

- (void)setCompletedHandlingBlock:(id)a3
{
}

- (BOOL)isGuideElementMovementEvent
{
  return self->_isGuideElementMovementEvent;
}

- (void)setIsGuideElementMovementEvent:(BOOL)a3
{
  self->_isGuideElementMovementEvent = a3;
}

- (VOTEventUserCommandContext)userCommandContext
{
  return self->_userCommandContext;
}

- (void)setUserCommandContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userCommandContext, 0);
  objc_storeStrong(&self->_completedHandlingBlock, 0);
  objc_storeStrong((id *)&self->_info, 0);

  objc_storeStrong((id *)&self->_command, 0);
}

@end