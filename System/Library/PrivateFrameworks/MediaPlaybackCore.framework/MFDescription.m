@interface MFDescription
+ (id)forBufferState:(int64_t)a3;
+ (id)forErrorResolution:(int64_t)a3;
+ (id)forItemChangeSource:(int64_t)a3;
+ (id)forItemRequestReason:(int64_t)a3;
+ (id)forItemTransition:(int64_t)a3;
+ (id)forPlaybackTimeChangeReason:(int64_t)a3;
+ (id)forPlayerItemTransitionType:(int64_t)a3;
+ (id)forPlayerSpatializationFormat:(int64_t)a3;
+ (id)forPlayerState:(int64_t)a3;
+ (id)forReloadingReason:(int64_t)a3;
+ (id)forTimeControlStatus:(int64_t)a3;
+ (id)forUserActionSource:(int64_t)a3;
+ (id)forUserActionType:(int64_t)a3;
- (MFDescription)init;
@end

@implementation MFDescription

- (MFDescription)init
{
  return (MFDescription *)sub_21BC43DE4();
}

+ (id)forPlayerState:(int64_t)a3
{
  return sub_21BC44828((uint64_t)a1, (uint64_t)a2, a3, (void (*)(uint64_t))sub_21BC43E3C);
}

+ (id)forBufferState:(int64_t)a3
{
  return sub_21BC44828((uint64_t)a1, (uint64_t)a2, a3, (void (*)(uint64_t))sub_21BC43FA4);
}

+ (id)forItemRequestReason:(int64_t)a3
{
  return sub_21BC44828((uint64_t)a1, (uint64_t)a2, a3, (void (*)(uint64_t))sub_21BC44018);
}

+ (id)forErrorResolution:(int64_t)a3
{
  return sub_21BC44828((uint64_t)a1, (uint64_t)a2, a3, (void (*)(uint64_t))sub_21BC44100);
}

+ (id)forItemTransition:(int64_t)a3
{
  return sub_21BC44828((uint64_t)a1, (uint64_t)a2, a3, (void (*)(uint64_t))sub_21BC441BC);
}

+ (id)forUserActionType:(int64_t)a3
{
  return sub_21BC44828((uint64_t)a1, (uint64_t)a2, a3, (void (*)(uint64_t))sub_21BC442E8);
}

+ (id)forUserActionSource:(int64_t)a3
{
  return sub_21BC4472C((uint64_t)a1, (uint64_t)a2, a3, (void (*)(uint64_t))sub_21BC44458);
}

+ (id)forPlaybackTimeChangeReason:(int64_t)a3
{
  return sub_21BC44828((uint64_t)a1, (uint64_t)a2, a3, (void (*)(uint64_t))sub_21BC444CC);
}

+ (id)forItemChangeSource:(int64_t)a3
{
  return sub_21BC44828((uint64_t)a1, (uint64_t)a2, a3, (void (*)(uint64_t))sub_21BC44550);
}

+ (id)forReloadingReason:(int64_t)a3
{
  return sub_21BC44828((uint64_t)a1, (uint64_t)a2, a3, (void (*)(uint64_t))sub_21BC445B8);
}

+ (id)forPlayerSpatializationFormat:(int64_t)a3
{
  return sub_21BC44828((uint64_t)a1, (uint64_t)a2, a3, (void (*)(uint64_t))sub_21BC44638);
}

+ (id)forTimeControlStatus:(int64_t)a3
{
  return sub_21BC4472C((uint64_t)a1, (uint64_t)a2, a3, (void (*)(uint64_t))sub_21BC446BC);
}

+ (id)forPlayerItemTransitionType:(int64_t)a3
{
  return sub_21BC44828((uint64_t)a1, (uint64_t)a2, a3, (void (*)(uint64_t))sub_21BC44780);
}

@end