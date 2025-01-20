@interface ACUISActivitySceneAction
- (ACUISActivitySceneAction)initWithCommand:(int64_t)a3;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5;
- (int64_t)command;
@end

@implementation ACUISActivitySceneAction

- (ACUISActivitySceneAction)initWithCommand:(int64_t)a3
{
  id v5 = objc_alloc_init(MEMORY[0x263F29C78]);
  v6 = [NSNumber numberWithInteger:a3];
  [v5 setObject:v6 forSetting:0];

  v9.receiver = self;
  v9.super_class = (Class)ACUISActivitySceneAction;
  v7 = [(ACUISActivitySceneAction *)&v9 initWithInfo:v5 responder:0];

  return v7;
}

- (int64_t)command
{
  v2 = [(ACUISActivitySceneAction *)self info];
  v3 = [v2 objectForSetting:0];
  int64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3) {
    return 0;
  }
  else {
    return @"command";
  }
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  if (a5) {
    return 0;
  }
  uint64_t v8 = objc_msgSend(a4, "unsignedIntegerValue", a3, v5, v6);
  if ((unint64_t)(v8 - 1) > 2) {
    return @"unknown";
  }
  else {
    return off_264E783A0[v8 - 1];
  }
}

@end