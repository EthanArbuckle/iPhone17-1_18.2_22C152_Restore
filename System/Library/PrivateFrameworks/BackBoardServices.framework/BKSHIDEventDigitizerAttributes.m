@interface BKSHIDEventDigitizerAttributes
+ (id)protobufSchema;
- (BOOL)isEqual:(id)a3;
- (BOOL)systemGestureStateChange;
- (BOOL)systemGesturesPossible;
- (CGSize)digitizerSurfaceSize;
- (NSArray)pathAttributes;
- (double)digitizerSurfaceHeight;
- (double)digitizerSurfaceWidth;
- (double)initialTouchTimestamp;
- (double)maximumPositionZ;
- (float)maximumForce;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)activeModifiers;
- (int64_t)sceneTouchBehavior;
- (unsigned)touchStreamIdentifier;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)setActiveModifiers:(int64_t)a3;
- (void)setDigitizerSurfaceHeight:(double)a3;
- (void)setDigitizerSurfaceSize:(CGSize)a3;
- (void)setDigitizerSurfaceWidth:(double)a3;
- (void)setInitialTouchTimestamp:(double)a3;
- (void)setMaximumForce:(float)a3;
- (void)setMaximumPositionZ:(double)a3;
- (void)setPathAttributes:(id)a3;
- (void)setSceneTouchBehavior:(int64_t)a3;
- (void)setSystemGestureStateChange:(BOOL)a3;
- (void)setSystemGesturesPossible:(BOOL)a3;
- (void)setTouchStreamIdentifier:(unsigned __int8)a3;
@end

@implementation BKSHIDEventDigitizerAttributes

- (BOOL)systemGestureStateChange
{
  return self->_systemGestureStateChange;
}

- (void).cxx_destruct
{
}

- (BOOL)systemGesturesPossible
{
  return self->_systemGesturesPossible;
}

- (int64_t)sceneTouchBehavior
{
  return self->_sceneTouchBehavior;
}

- (int64_t)activeModifiers
{
  return self->_activeModifiers;
}

- (void)setMaximumPositionZ:(double)a3
{
  self->_maximumPositionZ = a3;
}

- (void)setMaximumForce:(float)a3
{
  self->_maximumForce = a3;
}

- (void)setInitialTouchTimestamp:(double)a3
{
  self->_initialTouchTimestamp = a3;
}

- (void)setActiveModifiers:(int64_t)a3
{
  self->_activeModifiers = a3;
}

- (float)maximumForce
{
  return self->_maximumForce;
}

- (void)setSystemGesturesPossible:(BOOL)a3
{
  self->_systemGesturesPossible = a3;
}

- (void)setPathAttributes:(id)a3
{
}

- (double)initialTouchTimestamp
{
  return self->_initialTouchTimestamp;
}

+ (id)protobufSchema
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__BKSHIDEventDigitizerAttributes_protobufSchema__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (protobufSchema_onceToken_402 != -1) {
    dispatch_once(&protobufSchema_onceToken_402, block);
  }
  v2 = (void *)protobufSchema_schema_401;
  return v2;
}

- (NSArray)pathAttributes
{
  return self->_pathAttributes;
}

- (void)setTouchStreamIdentifier:(unsigned __int8)a3
{
  self->_touchStreamIdentifier = a3;
}

- (void)setSystemGestureStateChange:(BOOL)a3
{
  self->_systemGestureStateChange = a3;
}

- (void)setSceneTouchBehavior:(int64_t)a3
{
  self->_sceneTouchBehavior = a3;
}

- (unsigned)touchStreamIdentifier
{
  return self->_touchStreamIdentifier;
}

- (void)setDigitizerSurfaceSize:(CGSize)a3
{
  self->_digitizerSurfaceSize = a3;
}

- (CGSize)digitizerSurfaceSize
{
  double width = self->_digitizerSurfaceSize.width;
  double height = self->_digitizerSurfaceSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)maximumPositionZ
{
  return self->_maximumPositionZ;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)BKSHIDEventDigitizerAttributes;
  [(BKSHIDEventBaseAttributes *)&v19 appendDescriptionToFormatter:v4];
  id v5 = (id)[v4 appendObject:self->_pathAttributes withName:@"pathAttributes" skipIfNil:1];
  float maximumForce = self->_maximumForce;
  if (maximumForce != 0.0) {
    id v7 = (id)[v4 appendFloat:@"maximumForce" withName:maximumForce];
  }
  if (self->_maximumPositionZ != 0.0) {
    id v8 = (id)objc_msgSend(v4, "appendFloat:withName:", @"maximumPositionZ");
  }
  id v9 = (id)[v4 appendBool:self->_systemGesturesPossible withName:@"systemGesturesPossible" ifEqualTo:1];
  id v10 = (id)[v4 appendBool:self->_systemGestureStateChange withName:@"systemGestureStateChange" ifEqualTo:1];
  unint64_t sceneTouchBehavior = self->_sceneTouchBehavior;
  if (sceneTouchBehavior)
  {
    v12 = NSStringFromBKSSceneHostTouchBehavior(sceneTouchBehavior);
    [v4 appendString:v12 withName:@"sceneTouchBehavior"];
  }
  if (self->_touchStreamIdentifier)
  {
    v13 = NSStringFromBKSTouchStreamIdentifier(self->_touchStreamIdentifier);
    [v4 appendString:v13 withName:@"touchStreamIdentifier"];
  }
  if (self->_initialTouchTimestamp != 0.0) {
    id v14 = (id)objc_msgSend(v4, "appendTimeInterval:withName:decomposeUnits:", @"initialTouchTimestamp", 0);
  }
  int64_t activeModifiers = self->_activeModifiers;
  if (activeModifiers)
  {
    v16 = NSStringFromBKSKeyModifierFlags(activeModifiers);
    id v17 = (id)[v4 appendObject:v16 withName:@"activeModifiers"];
  }
  if (self->_digitizerSurfaceSize.width != 0.0 || self->_digitizerSurfaceSize.height != 0.0) {
    id v18 = (id)objc_msgSend(v4, "appendSize:withName:", @"surfaceDimensions");
  }
}

- (void)setDigitizerSurfaceHeight:(double)a3
{
  self->_digitizerSurfaceSize.double height = a3;
}

- (void)setDigitizerSurfaceWidth:(double)a3
{
  self->_digitizerSurfaceSize.double width = a3;
}

- (double)digitizerSurfaceHeight
{
  return self->_digitizerSurfaceSize.height;
}

- (double)digitizerSurfaceWidth
{
  return self->_digitizerSurfaceSize.width;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BKSHIDEventDigitizerAttributes;
  if ([(BKSHIDEventBaseAttributes *)&v9 isEqual:v4]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = (float *)v4;
    if (self->_maximumForce == v5[13]
      && self->_maximumPositionZ == *((double *)v5 + 7)
      && self->_digitizerSurfaceSize.height == *((double *)v5 + 13)
      && self->_digitizerSurfaceSize.width == *((double *)v5 + 12)
      && self->_initialTouchTimestamp == *((double *)v5 + 9)
      && self->_activeModifiers == *((void *)v5 + 10)
      && self->_systemGesturesPossible == *((unsigned __int8 *)v5 + 49)
      && self->_systemGestureStateChange == *((unsigned __int8 *)v5 + 50)
      && self->_sceneTouchBehavior == *((void *)v5 + 11)
      && self->_touchStreamIdentifier == *((unsigned __int8 *)v5 + 48))
    {
      id v8 = v5;
      char v6 = BSEqualObjects();
      id v5 = v8;
    }
    else
    {
      char v6 = 0;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)BKSHIDEventDigitizerAttributes;
  id v4 = [(BKSHIDEventBaseAttributes *)&v8 copyWithZone:a3];
  v4[13] = LODWORD(self->_maximumForce);
  *((void *)v4 + 7) = *(void *)&self->_maximumPositionZ;
  *((_OWORD *)v4 + 6) = self->_digitizerSurfaceSize;
  *((void *)v4 + 9) = *(void *)&self->_initialTouchTimestamp;
  *((void *)v4 + 10) = self->_activeModifiers;
  *((unsigned char *)v4 + 49) = self->_systemGesturesPossible;
  *((unsigned char *)v4 + 50) = self->_systemGestureStateChange;
  *((void *)v4 + 11) = self->_sceneTouchBehavior;
  *((unsigned char *)v4 + 48) = self->_touchStreamIdentifier;
  uint64_t v5 = [(NSArray *)self->_pathAttributes copy];
  char v6 = (void *)*((void *)v4 + 8);
  *((void *)v4 + 8) = v5;

  return v4;
}

uint64_t __48__BKSHIDEventDigitizerAttributes_protobufSchema__block_invoke(uint64_t a1)
{
  protobufSchema_schema_401 = [MEMORY[0x1E4F4F808] buildSchemaForClass:*(void *)(a1 + 32) builder:&__block_literal_global_404];
  return MEMORY[0x1F41817F8]();
}

void __48__BKSHIDEventDigitizerAttributes_protobufSchema__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 addField:"_maximumForce"];
  [v2 addField:"_maximumPositionZ"];
  [v2 addField:"_digitizerSurfaceSize"];
  [v2 addField:"_initialTouchTimestamp"];
  [v2 addField:"_activeModifiers"];
  [v2 addField:"_systemGesturesPossible"];
  [v2 addField:"_systemGestureStateChange"];
  [v2 addField:"_sceneTouchBehavior"];
  [v2 addField:"_touchStreamIdentifier"];
  [v2 addRepeatingField:"_pathAttributes" containsClass:objc_opt_class()];
}

@end