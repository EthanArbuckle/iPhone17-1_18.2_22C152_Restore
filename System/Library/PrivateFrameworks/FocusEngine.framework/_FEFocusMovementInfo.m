@interface _FEFocusMovementInfo
+ (BOOL)supportsSecureCoding;
+ (id)_movementWithHeading:(unint64_t)a3 isInitial:(BOOL)a4;
+ (id)_movementWithHeading:(unint64_t)a3 isInitial:(BOOL)a4 fallbackMovementOriginatingFrame:(CGRect)a5;
- (BOOL)_isInitialMovement;
- (BOOL)_isLinearMovement;
- (BOOL)_isLooping;
- (BOOL)_isVelocityBased;
- (BOOL)_shouldLoadScrollableContainer;
- (CGRect)_fallbackMovementOriginatingFrame;
- (CGVector)_velocity;
- (NSString)description;
- (_FEFocusMovementInfo)init;
- (_FEFocusMovementInfo)initWithCoder:(id)a3;
- (_FEFocusMovementInfo)initWithHeading:(unint64_t)a3 linearHeading:(unint64_t)a4 isInitial:(BOOL)a5 shouldLoadScrollableContainer:(BOOL)a6 looping:(BOOL)a7 groupFilter:(int64_t)a8;
- (_FEFocusMovementInfo)initWithHeading:(unint64_t)a3 linearHeading:(unint64_t)a4 isInitial:(BOOL)a5 shouldLoadScrollableContainer:(BOOL)a6 looping:(BOOL)a7 groupFilter:(int64_t)a8 inputType:(unint64_t)a9;
- (_FEFocusMovementInfo)initWithHeading:(unint64_t)a3 velocity:(CGVector)a4 isInitial:(BOOL)a5 shouldLoadScrollableContainer:(BOOL)a6 groupFilter:(int64_t)a7;
- (_FEFocusMovementInfo)initWithHeading:(unint64_t)a3 velocity:(CGVector)a4 isInitial:(BOOL)a5 shouldLoadScrollableContainer:(BOOL)a6 groupFilter:(int64_t)a7 inputType:(unint64_t)a8;
- (_FEFocusMovementInfo)initWithXPCDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_groupFilter;
- (unint64_t)_inputType;
- (unint64_t)_linearHeading;
- (unint64_t)heading;
- (void)_setFallbackMovementOriginatingFrame:(CGRect)a3;
- (void)_setGroupFilter:(int64_t)a3;
- (void)_setHeading:(unint64_t)a3;
- (void)_setInputType:(unint64_t)a3;
- (void)_setIsInitialMovement:(BOOL)a3;
- (void)_setIsVelocityBased:(BOOL)a3;
- (void)_setLinearHeading:(unint64_t)a3;
- (void)_setLooping:(BOOL)a3;
- (void)_setShouldLoadScrollableContainer:(BOOL)a3;
- (void)_setVelocity:(CGVector)a3;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation _FEFocusMovementInfo

+ (id)_movementWithHeading:(unint64_t)a3 isInitial:(BOOL)a4
{
  v4 = (void *)[objc_alloc((Class)a1) initWithHeading:a3 linearHeading:0 isInitial:a4 shouldLoadScrollableContainer:1 looping:0 groupFilter:0 inputType:5];
  return v4;
}

+ (id)_movementWithHeading:(unint64_t)a3 isInitial:(BOOL)a4 fallbackMovementOriginatingFrame:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  v9 = (void *)[objc_alloc((Class)a1) initWithHeading:a3 linearHeading:0 isInitial:a4 shouldLoadScrollableContainer:1 looping:0 groupFilter:0 inputType:5];
  objc_msgSend(v9, "_setFallbackMovementOriginatingFrame:", x, y, width, height);
  return v9;
}

- (_FEFocusMovementInfo)init
{
  v4.receiver = self;
  v4.super_class = (Class)_FEFocusMovementInfo;
  result = [(_FEFocusMovementInfo *)&v4 init];
  if (result)
  {
    result->_heading = 0;
    result->_linearHeading = 0;
    result->_velocity.ddouble x = 0.0;
    result->_velocity.ddouble y = 0.0;
    *(_DWORD *)&result->_looping = 65792;
    CGSize v3 = *(CGSize *)(MEMORY[0x263F001A0] + 16);
    result->_fallbackMovementOriginatingFrame.origin = (CGPoint)*MEMORY[0x263F001A0];
    result->_fallbackMovementOriginatingFrame.size = v3;
    result->_groupFilter = 0;
    result->_inputType = 0;
  }
  return result;
}

- (_FEFocusMovementInfo)initWithHeading:(unint64_t)a3 velocity:(CGVector)a4 isInitial:(BOOL)a5 shouldLoadScrollableContainer:(BOOL)a6 groupFilter:(int64_t)a7 inputType:(unint64_t)a8
{
  ddouble y = a4.dy;
  ddouble x = a4.dx;
  result = [(_FEFocusMovementInfo *)self init];
  if (result)
  {
    if (!a3)
    {
      double v16 = fabs(dx);
      unint64_t v17 = 8;
      uint64_t v18 = 4;
      if (dx >= 0.0) {
        uint64_t v18 = 0;
      }
      if (dx <= 0.0) {
        unint64_t v17 = v18;
      }
      if (v16 >= 0.0001) {
        a3 = v17;
      }
      else {
        a3 = 0;
      }
      if (fabs(dy) >= 0.0001)
      {
        unint64_t v19 = a3 | 1;
        if (dy >= 0.0) {
          unint64_t v19 = a3;
        }
        if (dy > 0.0) {
          a3 |= 2uLL;
        }
        else {
          a3 = v19;
        }
      }
    }
    result->_heading = a3;
    result->_velocity.ddouble x = dx;
    result->_velocity.ddouble y = dy;
    result->_isVelocityBased = 1;
    result->_isInitialMovement = a5;
    result->_shouldLoadScrollableContainer = a6;
    result->_groupFilter = a7;
    result->_inputType = a8;
  }
  return result;
}

- (_FEFocusMovementInfo)initWithHeading:(unint64_t)a3 linearHeading:(unint64_t)a4 isInitial:(BOOL)a5 shouldLoadScrollableContainer:(BOOL)a6 looping:(BOOL)a7 groupFilter:(int64_t)a8 inputType:(unint64_t)a9
{
  v15 = [(_FEFocusMovementInfo *)self init];
  double v16 = v15;
  if (v15)
  {
    v15->_heading = a3;
    v15->_linearHeading = a4;
    v15->_velocity.ddouble x = _UIVectorForFocusHeading(a3);
    v16->_velocity.ddouble y = v17;
    v16->_isVelocityBased = 0;
    v16->_isInitialMovement = a5;
    v16->_shouldLoadScrollableContainer = a6;
    v16->_looping = a7;
    v16->_groupFilter = a8;
    v16->_inputType = a9;
  }
  return v16;
}

- (_FEFocusMovementInfo)initWithHeading:(unint64_t)a3 velocity:(CGVector)a4 isInitial:(BOOL)a5 shouldLoadScrollableContainer:(BOOL)a6 groupFilter:(int64_t)a7
{
  return -[_FEFocusMovementInfo initWithHeading:velocity:isInitial:shouldLoadScrollableContainer:groupFilter:inputType:](self, "initWithHeading:velocity:isInitial:shouldLoadScrollableContainer:groupFilter:inputType:", a3, a5, a6, a7, 5, a4.dx, a4.dy);
}

- (_FEFocusMovementInfo)initWithHeading:(unint64_t)a3 linearHeading:(unint64_t)a4 isInitial:(BOOL)a5 shouldLoadScrollableContainer:(BOOL)a6 looping:(BOOL)a7 groupFilter:(int64_t)a8
{
  return [(_FEFocusMovementInfo *)self initWithHeading:a3 linearHeading:a4 isInitial:a5 shouldLoadScrollableContainer:a6 looping:a7 groupFilter:a8 inputType:5];
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = (CGSize *)objc_alloc_init((Class)objc_opt_class());
  [(CGSize *)v4 _setHeading:self->_heading];
  [(CGSize *)v4 _setLinearHeading:self->_linearHeading];
  -[CGSize _setVelocity:](v4, "_setVelocity:", self->_velocity.dx, self->_velocity.dy);
  [(CGSize *)v4 _setIsVelocityBased:self->_isVelocityBased];
  [(CGSize *)v4 _setIsInitialMovement:self->_isInitialMovement];
  [(CGSize *)v4 _setShouldLoadScrollableContainer:self->_shouldLoadScrollableContainer];
  [(CGSize *)v4 _setLooping:self->_looping];
  [(CGSize *)v4 _setGroupFilter:self->_groupFilter];
  [(CGSize *)v4 _setInputType:self->_inputType];
  CGSize size = self->_fallbackMovementOriginatingFrame.size;
  v4[4] = (CGSize)self->_fallbackMovementOriginatingFrame.origin;
  v4[5] = size;
  return v4;
}

- (NSString)description
{
  CGSize v3 = NSString;
  objc_super v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = _FEStringFromFocusHeading([(_FEFocusMovementInfo *)self heading]);
  v7 = [v3 stringWithFormat:@"<%@ %p heading = %@>", v5, self, v6];;

  return (NSString *)v7;
}

- (BOOL)_isLinearMovement
{
  return self->_linearHeading || ([(_FEFocusMovementInfo *)self heading] & 0x330) != 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_FEFocusMovementInfo)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_FEFocusMovementInfo;
  v5 = [(_FEFocusMovementInfo *)&v11 init];
  if (v5)
  {
    v5->_heading = xpc_dictionary_get_int64(v4, (const char *)[@"FocusMovementHeadingKey" UTF8String]);
    v5->_linearHeading = xpc_dictionary_get_int64(v4, (const char *)[@"FocusMovementLinearHeadingKey" UTF8String]);
    v5->_velocity.ddouble x = xpc_dictionary_get_double(v4, (const char *)[@"FocusMovementVelocityXKey" UTF8String]);
    v5->_velocity.ddouble y = xpc_dictionary_get_double(v4, (const char *)[@"FocusMovementVelocityYKey" UTF8String]);
    v5->_isVelocityBased = xpc_dictionary_get_BOOL(v4, (const char *)[@"FocusMovementIsVelocityBasedKey" UTF8String]);
    v5->_isInitialMovement = xpc_dictionary_get_BOOL(v4, (const char *)[@"FocusMovementIsInitialMovementKey" UTF8String]);
    v5->_shouldLoadScrollableContainer = xpc_dictionary_get_BOOL(v4, (const char *)[@"FocusMovementShouldLoadScrollableContainerKey" UTF8String]);
    v5->_looping = xpc_dictionary_get_BOOL(v4, (const char *)[@"FocusMovementLoopingKey" UTF8String]);
    v5->_groupFilter = xpc_dictionary_get_int64(v4, (const char *)[@"FocusMovementGroupFilterKey" UTF8String]);
    v5->_inputType = xpc_dictionary_get_int64(v4, (const char *)[@"FocusMovementInputTypeKey" UTF8String]);
    [@"FocusMovementFallbackOriginatingFrameKey" UTF8String];
    BSDeserializeCGRectFromXPCDictionaryWithKey();
    v5->_fallbackMovementOriginatingFrame.origin.double x = v6;
    v5->_fallbackMovementOriginatingFrame.origin.double y = v7;
    v5->_fallbackMovementOriginatingFrame.size.double width = v8;
    v5->_fallbackMovementOriginatingFrame.size.double height = v9;
  }

  return v5;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  xpc_object_t xdict = a3;
  xpc_dictionary_set_int64(xdict, (const char *)[@"FocusMovementHeadingKey" UTF8String], self->_heading);
  xpc_dictionary_set_int64(xdict, (const char *)[@"FocusMovementLinearHeadingKey" UTF8String], self->_linearHeading);
  xpc_dictionary_set_double(xdict, (const char *)[@"FocusMovementVelocityXKey" UTF8String], self->_velocity.dx);
  xpc_dictionary_set_double(xdict, (const char *)[@"FocusMovementVelocityYKey" UTF8String], self->_velocity.dy);
  xpc_dictionary_set_BOOL(xdict, (const char *)[@"FocusMovementIsVelocityBasedKey" UTF8String], self->_isVelocityBased);
  xpc_dictionary_set_BOOL(xdict, (const char *)[@"FocusMovementIsInitialMovementKey" UTF8String], self->_isInitialMovement);
  xpc_dictionary_set_BOOL(xdict, (const char *)[@"FocusMovementShouldLoadScrollableContainerKey" UTF8String], self->_shouldLoadScrollableContainer);
  xpc_dictionary_set_BOOL(xdict, (const char *)[@"FocusMovementLoopingKey" UTF8String], self->_looping);
  xpc_dictionary_set_int64(xdict, (const char *)[@"FocusMovementGroupFilterKey" UTF8String], self->_groupFilter);
  xpc_dictionary_set_int64(xdict, (const char *)[@"FocusMovementInputTypeKey" UTF8String], self->_inputType);
  [@"FocusMovementFallbackOriginatingFrameKey" UTF8String];
  BSSerializeCGRectToXPCDictionaryWithKey();
}

- (_FEFocusMovementInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_FEFocusMovementInfo;
  v5 = [(_FEFocusMovementInfo *)&v13 init];
  if (v5)
  {
    v5->_heading = [v4 decodeIntegerForKey:@"FocusMovementHeadingKey"];
    v5->_linearHeading = [v4 decodeIntegerForKey:@"FocusMovementLinearHeadingKey"];
    [v4 decodeDoubleForKey:@"FocusMovementVelocityXKey"];
    v5->_velocity.ddouble x = v6;
    [v4 decodeDoubleForKey:@"FocusMovementVelocityYKey"];
    v5->_velocity.ddouble y = v7;
    v5->_isVelocityBased = [v4 decodeBoolForKey:@"FocusMovementIsVelocityBasedKey"];
    v5->_isInitialMovement = [v4 decodeBoolForKey:@"FocusMovementIsInitialMovementKey"];
    v5->_shouldLoadScrollableContainer = [v4 decodeBoolForKey:@"FocusMovementShouldLoadScrollableContainerKey"];
    v5->_looping = [v4 decodeBoolForKey:@"FocusMovementLoopingKey"];
    v5->_groupFilter = [v4 decodeIntegerForKey:@"FocusMovementGroupFilterKey"];
    v5->_inputType = [v4 decodeIntegerForKey:@"FocusMovementInputTypeKey"];
    [v4 decodeCGRectForKey:@"FocusMovementFallbackOriginatingFrameKey"];
    v5->_fallbackMovementOriginatingFrame.origin.double x = v8;
    v5->_fallbackMovementOriginatingFrame.origin.double y = v9;
    v5->_fallbackMovementOriginatingFrame.size.double width = v10;
    v5->_fallbackMovementOriginatingFrame.size.double height = v11;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", -[_FEFocusMovementInfo heading](self, "heading"), @"FocusMovementHeadingKey");
  objc_msgSend(v5, "encodeInteger:forKey:", -[_FEFocusMovementInfo _linearHeading](self, "_linearHeading"), @"FocusMovementLinearHeadingKey");
  [(_FEFocusMovementInfo *)self _velocity];
  objc_msgSend(v5, "encodeDouble:forKey:", @"FocusMovementVelocityXKey");
  [(_FEFocusMovementInfo *)self _velocity];
  [v5 encodeDouble:@"FocusMovementVelocityYKey" forKey:v4];
  objc_msgSend(v5, "encodeBool:forKey:", -[_FEFocusMovementInfo _isVelocityBased](self, "_isVelocityBased"), @"FocusMovementIsVelocityBasedKey");
  objc_msgSend(v5, "encodeBool:forKey:", -[_FEFocusMovementInfo _isInitialMovement](self, "_isInitialMovement"), @"FocusMovementIsInitialMovementKey");
  objc_msgSend(v5, "encodeBool:forKey:", -[_FEFocusMovementInfo _shouldLoadScrollableContainer](self, "_shouldLoadScrollableContainer"), @"FocusMovementShouldLoadScrollableContainerKey");
  objc_msgSend(v5, "encodeBool:forKey:", -[_FEFocusMovementInfo _isLooping](self, "_isLooping"), @"FocusMovementLoopingKey");
  objc_msgSend(v5, "encodeInteger:forKey:", -[_FEFocusMovementInfo _groupFilter](self, "_groupFilter"), @"FocusMovementGroupFilterKey");
  objc_msgSend(v5, "encodeInteger:forKey:", -[_FEFocusMovementInfo _inputType](self, "_inputType"), @"FocusMovementInputTypeKey");
  [(_FEFocusMovementInfo *)self _fallbackMovementOriginatingFrame];
  objc_msgSend(v5, "encodeCGRect:forKey:", @"FocusMovementFallbackOriginatingFrameKey");
}

- (unint64_t)heading
{
  return self->_heading;
}

- (void)_setHeading:(unint64_t)a3
{
  self->_heading = a3;
}

- (BOOL)_isLooping
{
  return self->_looping;
}

- (void)_setLooping:(BOOL)a3
{
  self->_looping = a3;
}

- (unint64_t)_linearHeading
{
  return self->_linearHeading;
}

- (void)_setLinearHeading:(unint64_t)a3
{
  self->_linearHeading = a3;
}

- (BOOL)_shouldLoadScrollableContainer
{
  return self->_shouldLoadScrollableContainer;
}

- (void)_setShouldLoadScrollableContainer:(BOOL)a3
{
  self->_shouldLoadScrollableContainer = a3;
}

- (CGVector)_velocity
{
  ddouble x = self->_velocity.dx;
  ddouble y = self->_velocity.dy;
  result.ddouble y = dy;
  result.ddouble x = dx;
  return result;
}

- (void)_setVelocity:(CGVector)a3
{
  self->_velocitdouble y = a3;
}

- (BOOL)_isInitialMovement
{
  return self->_isInitialMovement;
}

- (void)_setIsInitialMovement:(BOOL)a3
{
  self->_isInitialMovement = a3;
}

- (BOOL)_isVelocityBased
{
  return self->_isVelocityBased;
}

- (void)_setIsVelocityBased:(BOOL)a3
{
  self->_isVelocityBased = a3;
}

- (CGRect)_fallbackMovementOriginatingFrame
{
  double x = self->_fallbackMovementOriginatingFrame.origin.x;
  double y = self->_fallbackMovementOriginatingFrame.origin.y;
  double width = self->_fallbackMovementOriginatingFrame.size.width;
  double height = self->_fallbackMovementOriginatingFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)_setFallbackMovementOriginatingFrame:(CGRect)a3
{
  self->_fallbackMovementOriginatingFrame = a3;
}

- (int64_t)_groupFilter
{
  return self->_groupFilter;
}

- (void)_setGroupFilter:(int64_t)a3
{
  self->_groupFilter = a3;
}

- (unint64_t)_inputType
{
  return self->_inputType;
}

- (void)_setInputType:(unint64_t)a3
{
  self->_inputType = a3;
}

@end