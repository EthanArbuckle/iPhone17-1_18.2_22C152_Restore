@interface CSComponent
+ (id)background;
+ (id)backgroundContent;
+ (id)complicationContainer;
+ (id)complicationSidebar;
+ (id)componentWithType:(int64_t)a3;
+ (id)content;
+ (id)controlCenterGrabber;
+ (id)dateView;
+ (id)dimmingLayer;
+ (id)footerCallToActionLabel;
+ (id)footerStatusLabel;
+ (id)fullBleedContent;
+ (id)homeAffordance;
+ (id)modalContent;
+ (id)pageContent;
+ (id)pageControl;
+ (id)poseidon;
+ (id)proudLock;
+ (id)quickActions;
+ (id)remoteInlineContent;
+ (id)slideableContent;
+ (id)statusBar;
+ (id)statusBarBackground;
+ (id)statusBarGradient;
+ (id)tinting;
+ (id)wallpaper;
+ (id)wallpaperFloatingLayer;
+ (id)whitePoint;
- ($240ACAF3E4AB77FC88882056553A3BB1)transitionInputs;
- (BOOL)hasValueForProperty:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHidden;
- (CGPoint)offset;
- (CSComponent)init;
- (NSNumber)value;
- (NSString)identifier;
- (NSString)string;
- (UIColor)color;
- (UIView)view;
- (_UILegibilitySettings)legibilitySettings;
- (double)alpha;
- (double)animationDuration;
- (double)blurRadius;
- (double)scale;
- (id)animationDuration:(double)a3;
- (id)color:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)flag:(int64_t)a3;
- (id)hidden:(BOOL)a3;
- (id)identifier:(id)a3;
- (id)legibilitySettings:(id)a3;
- (id)offset:(CGPoint)a3;
- (id)priority:(int64_t)a3;
- (id)scale:(double)a3;
- (id)string:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)transitionInputs:(id *)a3;
- (id)transitionModifiers:(unint64_t)a3;
- (id)value:(id)a3;
- (id)view:(id)a3;
- (int64_t)flag;
- (int64_t)priority;
- (int64_t)type;
- (unint64_t)hash;
- (unint64_t)level;
- (unint64_t)properties;
- (unint64_t)transitionModifiers;
- (void)resetAllProperties;
- (void)resetProperties:(unint64_t)a3;
- (void)setAlpha:(double)a3;
- (void)setAnimationDuration:(double)a3;
- (void)setBlurRadius:(double)a3;
- (void)setColor:(id)a3;
- (void)setFlag:(int64_t)a3;
- (void)setHidden:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setLevel:(unint64_t)a3;
- (void)setOffset:(CGPoint)a3;
- (void)setPriority:(int64_t)a3;
- (void)setProperties:(unint64_t)a3;
- (void)setScale:(double)a3;
- (void)setString:(id)a3;
- (void)setTransitionInputs:(id *)a3;
- (void)setTransitionModifiers:(unint64_t)a3;
- (void)setType:(int64_t)a3;
- (void)setValue:(id)a3;
- (void)setView:(id)a3;
@end

@implementation CSComponent

+ (id)componentWithType:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      v3 = objc_alloc_init(CSComponent);
      [(CSComponent *)v3 setType:0];
      break;
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
    case 23:
    case 24:
    case 25:
    case 26:
    case 27:
      v3 = (CSComponent *)objc_opt_new();
      break;
    default:
      break;
  }

  return v3;
}

+ (id)dateView
{
  return (id)[a1 componentWithType:1];
}

+ (id)statusBar
{
  return (id)[a1 componentWithType:2];
}

+ (id)pageControl
{
  return (id)[a1 componentWithType:3];
}

+ (id)pageContent
{
  return (id)[a1 componentWithType:4];
}

+ (id)slideableContent
{
  return (id)[a1 componentWithType:5];
}

+ (id)wallpaper
{
  return (id)[a1 componentWithType:6];
}

+ (id)tinting
{
  return (id)[a1 componentWithType:7];
}

+ (id)statusBarBackground
{
  return (id)[a1 componentWithType:8];
}

+ (id)footerCallToActionLabel
{
  return (id)[a1 componentWithType:9];
}

+ (id)footerStatusLabel
{
  return (id)[a1 componentWithType:10];
}

+ (id)proudLock
{
  return (id)[a1 componentWithType:11];
}

+ (id)homeAffordance
{
  return (id)[a1 componentWithType:12];
}

+ (id)controlCenterGrabber
{
  return (id)[a1 componentWithType:13];
}

+ (id)quickActions
{
  return (id)[a1 componentWithType:14];
}

+ (id)content
{
  return (id)[a1 componentWithType:15];
}

+ (id)statusBarGradient
{
  return (id)[a1 componentWithType:16];
}

+ (id)poseidon
{
  return (id)[a1 componentWithType:17];
}

+ (id)whitePoint
{
  return (id)[a1 componentWithType:18];
}

+ (id)background
{
  return (id)[a1 componentWithType:19];
}

+ (id)backgroundContent
{
  return (id)[a1 componentWithType:24];
}

+ (id)complicationContainer
{
  return (id)[a1 componentWithType:20];
}

+ (id)remoteInlineContent
{
  return (id)[a1 componentWithType:21];
}

+ (id)modalContent
{
  return (id)[a1 componentWithType:22];
}

+ (id)wallpaperFloatingLayer
{
  return (id)[a1 componentWithType:23];
}

+ (id)complicationSidebar
{
  return (id)[a1 componentWithType:25];
}

+ (id)fullBleedContent
{
  return (id)[a1 componentWithType:26];
}

+ (id)dimmingLayer
{
  return (id)[a1 componentWithType:27];
}

- (CSComponent)init
{
  v3.receiver = self;
  v3.super_class = (Class)CSComponent;
  result = [(CSComponent *)&v3 init];
  if (result)
  {
    result->_flag = 0x7FFFFFFFFFFFFFFFLL;
    result->_scale = 1.0;
  }
  return result;
}

- (id)priority:(int64_t)a3
{
  return self;
}

- (id)identifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"CSComponents.m", 339, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  [(CSComponent *)self setIdentifier:v5];

  return self;
}

- (id)hidden:(BOOL)a3
{
  return self;
}

- (id)flag:(int64_t)a3
{
  return self;
}

- (id)string:(id)a3
{
  return self;
}

- (id)value:(id)a3
{
  return self;
}

- (id)view:(id)a3
{
  return self;
}

- (id)legibilitySettings:(id)a3
{
  return self;
}

- (id)color:(id)a3
{
  return self;
}

- (id)offset:(CGPoint)a3
{
  return self;
}

- (id)transitionModifiers:(unint64_t)a3
{
  return self;
}

- (id)transitionInputs:(id *)a3
{
  long long v4 = *(_OWORD *)&a3->var1.y;
  v6[0] = *(_OWORD *)&a3->var0;
  v6[1] = v4;
  v6[2] = *(_OWORD *)&a3->var3;
  [(CSComponent *)self setTransitionInputs:v6];
  return self;
}

- (id)scale:(double)a3
{
  return self;
}

- (id)animationDuration:(double)a3
{
  return self;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
  self->_properties |= 1uLL;
}

- (void)setFlag:(int64_t)a3
{
  self->_flag = a3;
  self->_properties = self->_properties & 0xFFFFFFFFFFFFFFF7 | (8 * (a3 != 0x7FFFFFFFFFFFFFFFLL));
}

- (void)setOffset:(CGPoint)a3
{
  self->_offset = a3;
  self->_properties |= 2uLL;
}

- (void)setValue:(id)a3
{
  self->_properties |= 4uLL;
}

- (void)setView:(id)a3
{
  self->_properties |= 0x10uLL;
}

- (void)setLegibilitySettings:(id)a3
{
  self->_properties |= 0x20uLL;
}

- (void)setColor:(id)a3
{
  self->_properties |= 0x40uLL;
}

- (void)setTransitionModifiers:(unint64_t)a3
{
  self->_transitionModifiers = a3;
  self->_properties |= 0x80uLL;
}

- (void)setTransitionInputs:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  long long v4 = *(_OWORD *)&a3->var3;
  *(_OWORD *)&self->_transitionInputs.targetOffset.y = *(_OWORD *)&a3->var1.y;
  *(_OWORD *)&self->_transitionInputs.blurRadius = v4;
  *(_OWORD *)&self->_transitionInputs.duration = v3;
  self->_properties |= 0x100uLL;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
  self->_properties |= 0x200uLL;
}

- (void)setAnimationDuration:(double)a3
{
  self->_animationDuration = a3;
  self->_properties |= 0x400uLL;
}

- (void)setBlurRadius:(double)a3
{
  self->_blurRadius = a3;
  self->_properties |= 0x800uLL;
}

- (void)setLevel:(unint64_t)a3
{
  self->_level = a3;
  self->_properties |= 0x1000uLL;
}

- (BOOL)hasValueForProperty:(unint64_t)a3
{
  return (a3 & ~self->_properties) == 0;
}

- (void)resetAllProperties
{
  [(CSComponent *)self setAlpha:0.0];

  [(CSComponent *)self resetProperties:-1];
}

- (void)resetProperties:(unint64_t)a3
{
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v10 = __31__CSComponent_resetProperties___block_invoke;
  v11 = &unk_1E6AD9A40;
  v12 = self;
  id v5 = v9;
  if (a3)
  {
    char v13 = 0;
    uint8x8_t v6 = (uint8x8_t)vcnt_s8((int8x8_t)a3);
    v6.i16[0] = vaddlv_u8(v6);
    int v7 = v6.i32[0];
    if (v6.i32[0])
    {
      unint64_t v8 = 0;
      do
      {
        if (((1 << v8) & a3) != 0)
        {
          ((void (*)(void *))v10)(v5);
          if (v13) {
            break;
          }
          --v7;
        }
        if (v8 > 0x3E) {
          break;
        }
        ++v8;
      }
      while (v7 > 0);
    }
  }

  self->_properties &= ~a3;
}

uint64_t __31__CSComponent_resetProperties___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2 > 127)
  {
    if (a2 > 1023)
    {
      switch(a2)
      {
        case 1024:
          v15 = *(void **)(result + 32);
          return [v15 setAnimationDuration:0.0];
        case 2048:
          v16 = *(void **)(result + 32);
          return [v16 setBlurRadius:0.0];
        case 4096:
          id v5 = *(void **)(result + 32);
          return [v5 setLevel:0];
      }
    }
    else
    {
      switch(a2)
      {
        case 128:
          v11 = *(void **)(result + 32);
          return [v11 setTransitionModifiers:0];
        case 256:
          v12 = *(void **)(result + 32);
          uint64_t v17 = 0;
          long long v18 = *MEMORY[0x1E4F1DAD8];
          uint64_t v20 = 0;
          uint64_t v21 = 0;
          uint64_t v19 = 0;
          return [v12 setTransitionInputs:&v17];
        case 512:
          long long v3 = *(void **)(result + 32);
          return [v3 setScale:1.0];
      }
    }
  }
  else if (a2 > 15)
  {
    switch(a2)
    {
      case 16:
        char v13 = *(void **)(result + 32);
        return [v13 setView:0];
      case 32:
        v14 = *(void **)(result + 32);
        return [v14 setLegibilitySettings:0];
      case 64:
        long long v4 = *(void **)(result + 32);
        return [v4 setColor:0];
    }
  }
  else
  {
    switch(a2)
    {
      case 1:
        v2 = *(void **)(result + 32);
        result = [v2 setHidden:0];
        break;
      case 2:
        uint8x8_t v6 = *(void **)(result + 32);
        double v7 = *MEMORY[0x1E4F1DAD8];
        double v8 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
        result = objc_msgSend(v6, "setOffset:", v7, v8);
        break;
      case 4:
        v9 = *(void **)(result + 32);
        result = [v9 setValue:0];
        break;
      case 8:
        v10 = *(void **)(result + 32);
        result = [v10 setFlag:0x7FFFFFFFFFFFFFFFLL];
        break;
      default:
        return result;
    }
  }
  return result;
}

- (id)description
{
  return [(CSComponent *)self descriptionWithMultilinePrefix:0];
}

- (BOOL)isEqual:(id)a3
{
  long long v4 = (CSComponent *)a3;
  if (self == v4)
  {
    BOOL v12 = 1;
  }
  else
  {
    if (![(CSComponent *)v4 isMemberOfClass:objc_opt_class()]) {
      goto LABEL_36;
    }
    int64_t type = self->_type;
    if (type != [(CSComponent *)v4 type]) {
      goto LABEL_36;
    }
    unint64_t properties = self->_properties;
    if (properties != [(CSComponent *)v4 properties]) {
      goto LABEL_36;
    }
    int64_t priority = self->_priority;
    if (priority != [(CSComponent *)v4 priority]) {
      goto LABEL_36;
    }
    unint64_t transitionModifiers = self->_transitionModifiers;
    if (transitionModifiers != [(CSComponent *)v4 transitionModifiers]) {
      goto LABEL_36;
    }
    BOOL hidden = self->_hidden;
    if (hidden != [(CSComponent *)v4 isHidden]) {
      goto LABEL_36;
    }
    int64_t flag = self->_flag;
    if (flag != [(CSComponent *)v4 flag]) {
      goto LABEL_36;
    }
    [(CSComponent *)v4 alpha];
    if (!BSFloatEqualToFloat()) {
      goto LABEL_36;
    }
    [(CSComponent *)v4 scale];
    if (!BSFloatEqualToFloat()) {
      goto LABEL_36;
    }
    [(CSComponent *)v4 animationDuration];
    if (!BSFloatEqualToFloat()) {
      goto LABEL_36;
    }
    [(CSComponent *)v4 blurRadius];
    if (!BSFloatEqualToFloat()) {
      goto LABEL_36;
    }
    unint64_t level = self->_level;
    if (level != [(CSComponent *)v4 level]) {
      goto LABEL_36;
    }
    [(CSComponent *)v4 offset];
    if (!BSPointEqualToPoint()) {
      goto LABEL_36;
    }
    if (v4) {
      [(CSComponent *)v4 transitionInputs];
    }
    else {
      memset(v31, 0, sizeof(v31));
    }
    long long v13 = *(_OWORD *)&self->_transitionInputs.targetOffset.y;
    v30[0] = *(_OWORD *)&self->_transitionInputs.duration;
    v30[1] = v13;
    v30[2] = *(_OWORD *)&self->_transitionInputs.blurRadius;
    if (!ComponentTransitionInputsEqualToComponentTransitionInputs((uint64_t)v30, (uint64_t)v31)) {
      goto LABEL_36;
    }
    v14 = [(CSComponent *)v4 identifier];
    int v15 = BSEqualStrings();

    if (!v15) {
      goto LABEL_36;
    }
    v16 = [(CSComponent *)v4 string];
    int v17 = BSEqualStrings();

    if (!v17) {
      goto LABEL_36;
    }
    long long v18 = [(CSComponent *)v4 color];
    int v19 = BSEqualObjects();

    if (!v19) {
      goto LABEL_36;
    }
    uint64_t v20 = [(CSComponent *)v4 value];
    int v21 = BSEqualObjects();

    if (!v21) {
      goto LABEL_36;
    }
    v22 = [(CSComponent *)v4 view];
    int v23 = BSEqualObjects();

    if (v23)
    {
      v24 = [(CSComponent *)v4 legibilitySettings];
      BOOL v25 = 0;
      legibilitySettings = self->_legibilitySettings;
      if (v24) {
        BOOL v27 = 1;
      }
      else {
        BOOL v27 = legibilitySettings == 0;
      }
      if (legibilitySettings) {
        BOOL v28 = 0;
      }
      else {
        BOOL v28 = v24 != 0;
      }
      if (v27 && !v28) {
        BOOL v25 = !legibilitySettings
      }
           || [(_UILegibilitySettings *)legibilitySettings sb_isEqualToLegibilitySettings:v24];

      BOOL v12 = v25;
    }
    else
    {
LABEL_36:
      BOOL v12 = 0;
    }
  }

  return v12;
}

- (unint64_t)hash
{
  return self->_type;
}

- (id)copyWithZone:(_NSZone *)a3
{
  long long v4 = +[CSComponent componentWithType:[(CSComponent *)self type]];
  id v5 = [(CSComponent *)self identifier];
  [v4 setIdentifier:v5];

  objc_msgSend(v4, "setHidden:", -[CSComponent isHidden](self, "isHidden"));
  objc_msgSend(v4, "setFlag:", -[CSComponent flag](self, "flag"));
  [(CSComponent *)self alpha];
  objc_msgSend(v4, "setAlpha:");
  uint8x8_t v6 = [(CSComponent *)self string];
  [v4 setString:v6];

  double v7 = [(CSComponent *)self color];
  [v4 setColor:v7];

  [(CSComponent *)self offset];
  objc_msgSend(v4, "setOffset:");
  objc_msgSend(v4, "setPriority:", -[CSComponent priority](self, "priority"));
  double v8 = [(CSComponent *)self value];
  [v4 setValue:v8];

  v9 = [(CSComponent *)self view];
  [v4 setView:v9];

  v10 = [(CSComponent *)self legibilitySettings];
  [v4 setLegibilitySettings:v10];

  objc_msgSend(v4, "setTransitionModifiers:", -[CSComponent transitionModifiers](self, "transitionModifiers"));
  [(CSComponent *)self transitionInputs];
  [v4 setTransitionInputs:&v12];
  [(CSComponent *)self scale];
  objc_msgSend(v4, "setScale:");
  [(CSComponent *)self animationDuration];
  objc_msgSend(v4, "setAnimationDuration:");
  [(CSComponent *)self blurRadius];
  objc_msgSend(v4, "setBlurRadius:");
  objc_msgSend(v4, "setLevel:", -[CSComponent level](self, "level"));
  objc_msgSend(v4, "setProperties:", -[CSComponent properties](self, "properties"));
  return v4;
}

- (id)succinctDescription
{
  v2 = [(CSComponent *)self succinctDescriptionBuilder];
  long long v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  long long v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  long long v4 = NSStringFromCoverSheetComponentType(self->_type);
  id v5 = (id)[v3 appendObject:v4 withName:@"type"];

  id v6 = (id)[v3 appendObject:self->_identifier withName:@"identifier"];
  id v7 = (id)[v3 appendInteger:self->_priority withName:@"priority"];
  unint64_t properties = self->_properties;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  int v17 = __41__CSComponent_succinctDescriptionBuilder__block_invoke;
  long long v18 = &unk_1E6AD9E48;
  id v9 = v3;
  id v19 = v9;
  uint64_t v20 = self;
  v10 = v16;
  if (properties)
  {
    char v21 = 0;
    uint8x8_t v11 = (uint8x8_t)vcnt_s8((int8x8_t)properties);
    v11.i16[0] = vaddlv_u8(v11);
    int v12 = v11.i32[0];
    if (v11.i32[0])
    {
      unint64_t v13 = 0;
      do
      {
        if (((1 << v13) & properties) != 0)
        {
          ((void (*)(void *))v17)(v10);
          if (v21) {
            break;
          }
          --v12;
        }
        if (v13 > 0x3E) {
          break;
        }
        ++v13;
      }
      while (v12 > 0);
    }
  }

  id v14 = v9;
  return v14;
}

void __41__CSComponent_succinctDescriptionBuilder__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 <= 127)
  {
    switch(a2)
    {
      case 1:
        id v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isHidden"), @"hidden");
        long long v4 = *(void **)(a1 + 32);
        [*(id *)(a1 + 40) alpha];
        id v5 = @"alpha";
        goto LABEL_25;
      case 2:
        v10 = *(void **)(a1 + 32);
        [*(id *)(a1 + 40) offset];
        id v11 = (id)objc_msgSend(v10, "appendPoint:withName:", @"offset");
        return;
      case 3:
      case 5:
      case 6:
      case 7:
        return;
      case 4:
        int v12 = *(void **)(a1 + 32);
        uint64_t v13 = [*(id *)(a1 + 40) value];
        id v21 = (id)v13;
        id v14 = @"value";
        goto LABEL_19;
      case 8:
        int v12 = *(void **)(a1 + 32);
        [*(id *)(a1 + 40) flag];
        uint64_t v13 = BSSettingFlagDescription();
        id v21 = (id)v13;
        id v14 = @"flag";
LABEL_19:
        id v15 = (id)[v12 appendObject:v13 withName:v14];
        goto LABEL_29;
      default:
        if (a2 == 32)
        {
          id v7 = *(void **)(a1 + 32);
          id v21 = [*(id *)(a1 + 40) legibilitySettings];
          double v8 = [v21 succinctDescription];
          id v9 = @"legibility";
        }
        else
        {
          if (a2 != 64) {
            return;
          }
          id v7 = *(void **)(a1 + 32);
          id v21 = [*(id *)(a1 + 40) color];
          double v8 = [v21 description];
          id v9 = @"color";
        }
        [v7 appendString:v8 withName:v9];

        break;
    }
    goto LABEL_29;
  }
  if (a2 > 1023)
  {
    if (a2 == 1024)
    {
      long long v4 = *(void **)(a1 + 32);
      [*(id *)(a1 + 40) animationDuration];
      id v5 = @"animation duration";
    }
    else
    {
      if (a2 != 2048)
      {
        if (a2 == 4096) {
          id v6 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "level"), @"level");
        }
        return;
      }
      long long v4 = *(void **)(a1 + 32);
      [*(id *)(a1 + 40) blurRadius];
      id v5 = @"blur radius";
    }
LABEL_25:
    id v19 = (id)objc_msgSend(v4, "appendFloat:withName:decimalPrecision:", v5, 2);
    return;
  }
  if (a2 == 128)
  {
    v16 = *(void **)(a1 + 32);
    NSStringFromTransitionModifiers([*(id *)(a1 + 40) transitionModifiers]);
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    [v16 appendString:v21 withName:@"transitionModifiers"];
LABEL_29:

    return;
  }
  if (a2 != 256)
  {
    if (a2 != 512) {
      return;
    }
    long long v4 = *(void **)(a1 + 32);
    [*(id *)(a1 + 40) scale];
    id v5 = @"scale";
    goto LABEL_25;
  }
  long long v18 = *(void **)(a1 + 32);
  int v17 = *(void **)(a1 + 40);
  if (v17) {
    [v17 transitionInputs];
  }
  else {
    memset(v22, 0, sizeof(v22));
  }
  uint64_t v20 = NSStringFromComponentTransitionInputs((uint64_t)v22);
  [v18 appendString:v20 withName:@"transitionInputs"];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(CSComponent *)self descriptionBuilderWithMultilinePrefix:a3];
  long long v4 = [v3 build];

  return v4;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_int64_t type = a3;
}

- (unint64_t)properties
{
  return self->_properties;
}

- (void)setProperties:(unint64_t)a3
{
  self->_unint64_t properties = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_int64_t priority = a3;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (int64_t)flag
{
  return self->_flag;
}

- (NSString)string
{
  return self->_string;
}

- (void)setString:(id)a3
{
}

- (UIColor)color
{
  return self->_color;
}

- (NSNumber)value
{
  return self->_value;
}

- (UIView)view
{
  return self->_view;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (unint64_t)transitionModifiers
{
  return self->_transitionModifiers;
}

- ($240ACAF3E4AB77FC88882056553A3BB1)transitionInputs
{
  long long v3 = *(_OWORD *)&self[3].var3;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[3].var1.y;
  *(_OWORD *)&retstr->var1.y = v3;
  *(_OWORD *)&retstr->var3 = *(_OWORD *)&self[4].var0;
  return self;
}

- (double)alpha
{
  return self->_alpha;
}

- (void)setAlpha:(double)a3
{
  self->_alpha = a3;
}

- (CGPoint)offset
{
  double x = self->_offset.x;
  double y = self->_offset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (double)scale
{
  return self->_scale;
}

- (double)animationDuration
{
  return self->_animationDuration;
}

- (double)blurRadius
{
  return self->_blurRadius;
}

- (unint64_t)level
{
  return self->_level;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_string, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end