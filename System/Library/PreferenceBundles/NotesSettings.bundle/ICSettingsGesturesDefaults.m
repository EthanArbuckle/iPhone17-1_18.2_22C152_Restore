@interface ICSettingsGesturesDefaults
- (BOOL)anyCornerGestureAllowsDirectTouches;
- (ICSettingsGesturesDefaults)init;
- (NSUserDefaults)springboardDefaults;
- (int64_t)bottomLeftFeature;
- (int64_t)bottomRightFeature;
- (unint64_t)bottomLeftTouchTypes;
- (unint64_t)bottomRightTouchTypes;
- (void)setBottomLeftFeature:(int64_t)a3;
- (void)setBottomLeftTouchTypes:(unint64_t)a3;
- (void)setBottomRightFeature:(int64_t)a3;
- (void)setBottomRightTouchTypes:(unint64_t)a3;
- (void)setSpringboardDefaults:(id)a3;
@end

@implementation ICSettingsGesturesDefaults

- (ICSettingsGesturesDefaults)init
{
  v6.receiver = self;
  v6.super_class = (Class)ICSettingsGesturesDefaults;
  v2 = [(ICSettingsGesturesDefaults *)&v6 init];
  if (v2)
  {
    v3 = (NSUserDefaults *)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.springboard"];
    springboardDefaults = v2->_springboardDefaults;
    v2->_springboardDefaults = v3;
  }
  return v2;
}

- (BOOL)anyCornerGestureAllowsDirectTouches
{
  unsigned __int8 v3 = [(ICSettingsGesturesDefaults *)self bottomLeftTouchTypes];
  return ([(ICSettingsGesturesDefaults *)self bottomRightTouchTypes] | v3) & 1;
}

- (int64_t)bottomLeftFeature
{
  unsigned __int8 v3 = [(ICSettingsGesturesDefaults *)self springboardDefaults];
  v4 = [v3 objectForKey:@"SBBottomLeftCornerGestureFeature"];

  v5 = [(ICSettingsGesturesDefaults *)self springboardDefaults];
  objc_super v6 = [v5 objectForKey:@"SBBottomLeftCornerGestureTouchTypes"];

  if (!v6) {
    goto LABEL_5;
  }
  if (![v6 integerValue])
  {
    int64_t v7 = -1;
    goto LABEL_7;
  }
  if (v4) {
    int64_t v7 = (int64_t)[v4 integerValue];
  }
  else {
LABEL_5:
  }
    int64_t v7 = 0;
LABEL_7:

  return v7;
}

- (void)setBottomLeftFeature:(int64_t)a3
{
  unint64_t v5 = [(ICSettingsGesturesDefaults *)self bottomLeftTouchTypes];
  unsigned int v6 = [(ICSettingsGesturesDefaults *)self anyCornerGestureAllowsDirectTouches];
  if (a3 == -1)
  {
    v10 = [(ICSettingsGesturesDefaults *)self springboardDefaults];
    [v10 removeObjectForKey:@"SBBottomLeftCornerGestureFeature"];
    uint64_t v9 = 0;
  }
  else
  {
    unint64_t v7 = v5 | v6;
    uint64_t v8 = v7 | 2;
    if (a3 == 1) {
      v7 |= 2uLL;
    }
    if (a3) {
      uint64_t v9 = v7;
    }
    else {
      uint64_t v9 = v8;
    }
    v10 = [(ICSettingsGesturesDefaults *)self springboardDefaults];
    [v10 setInteger:a3 forKey:@"SBBottomLeftCornerGestureFeature"];
  }

  id v11 = [(ICSettingsGesturesDefaults *)self springboardDefaults];
  [v11 setInteger:v9 forKey:@"SBBottomLeftCornerGestureTouchTypes"];
}

- (unint64_t)bottomLeftTouchTypes
{
  v2 = [(ICSettingsGesturesDefaults *)self springboardDefaults];
  unsigned __int8 v3 = [v2 objectForKey:@"SBBottomLeftCornerGestureTouchTypes"];

  if (v3) {
    id v4 = [v3 integerValue];
  }
  else {
    id v4 = &dword_0 + 2;
  }

  return (unint64_t)v4;
}

- (void)setBottomLeftTouchTypes:(unint64_t)a3
{
  id v4 = [(ICSettingsGesturesDefaults *)self springboardDefaults];
  [v4 setInteger:a3 forKey:@"SBBottomLeftCornerGestureTouchTypes"];
}

- (int64_t)bottomRightFeature
{
  unsigned __int8 v3 = [(ICSettingsGesturesDefaults *)self springboardDefaults];
  id v4 = [v3 objectForKey:@"SBBottomRightCornerGestureFeature"];

  unint64_t v5 = [(ICSettingsGesturesDefaults *)self springboardDefaults];
  unsigned int v6 = [v5 objectForKey:@"SBBottomRightCornerGestureTouchTypes"];

  if (!v6) {
    goto LABEL_12;
  }
  if (![v6 integerValue])
  {
    int64_t v7 = -1;
    goto LABEL_9;
  }
  if (v4)
  {
    int64_t v7 = (int64_t)[v4 integerValue];
  }
  else
  {
LABEL_12:
    if (+[ICDeviceSupport deviceSupportsSystemPaper])int64_t v7 = 1; {
    else
    }
      int64_t v7 = -1;
  }
LABEL_9:

  return v7;
}

- (void)setBottomRightFeature:(int64_t)a3
{
  unint64_t v5 = [(ICSettingsGesturesDefaults *)self bottomRightTouchTypes];
  unsigned int v6 = [(ICSettingsGesturesDefaults *)self anyCornerGestureAllowsDirectTouches];
  if (a3 == -1)
  {
    v10 = [(ICSettingsGesturesDefaults *)self springboardDefaults];
    [v10 removeObjectForKey:@"SBBottomRightCornerGestureFeature"];
    uint64_t v9 = 0;
  }
  else
  {
    unint64_t v7 = v5 | v6;
    uint64_t v8 = v7 | 2;
    if (a3 == 1) {
      v7 |= 2uLL;
    }
    if (a3) {
      uint64_t v9 = v7;
    }
    else {
      uint64_t v9 = v8;
    }
    v10 = [(ICSettingsGesturesDefaults *)self springboardDefaults];
    [v10 setInteger:a3 forKey:@"SBBottomRightCornerGestureFeature"];
  }

  id v11 = [(ICSettingsGesturesDefaults *)self springboardDefaults];
  [v11 setInteger:v9 forKey:@"SBBottomRightCornerGestureTouchTypes"];
}

- (unint64_t)bottomRightTouchTypes
{
  v2 = [(ICSettingsGesturesDefaults *)self springboardDefaults];
  unsigned __int8 v3 = [v2 objectForKey:@"SBBottomRightCornerGestureTouchTypes"];

  if (v3)
  {
    id v4 = [v3 integerValue];
  }
  else if (+[ICDeviceSupport deviceSupportsSystemPaper])
  {
    id v4 = &dword_0 + 3;
  }
  else
  {
    id v4 = 0;
  }

  return (unint64_t)v4;
}

- (void)setBottomRightTouchTypes:(unint64_t)a3
{
  id v4 = [(ICSettingsGesturesDefaults *)self springboardDefaults];
  [v4 setInteger:a3 forKey:@"SBBottomRightCornerGestureTouchTypes"];
}

- (NSUserDefaults)springboardDefaults
{
  return self->_springboardDefaults;
}

- (void)setSpringboardDefaults:(id)a3
{
}

- (void).cxx_destruct
{
}

@end