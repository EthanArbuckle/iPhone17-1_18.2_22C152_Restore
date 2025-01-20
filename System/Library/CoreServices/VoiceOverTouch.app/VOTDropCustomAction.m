@interface VOTDropCustomAction
- (BOOL)ignoreWhenVoiceOverTouches;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValidForContext:(id)a3;
- (BOOL)performWithContext:(id)a3;
- (VOTDropCustomAction)initWithName:(id)a3 wireDictionary:(id)a4;
- (id)name;
- (unint64_t)hash;
- (void)prepareWithContext:(id)a3;
@end

@implementation VOTDropCustomAction

- (VOTDropCustomAction)initWithName:(id)a3 wireDictionary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)VOTDropCustomAction;
  v8 = [(VOTDropCustomAction *)&v19 init];
  if (v8)
  {
    v9 = (NSString *)[v6 copy];
    name = v8->_name;
    v8->_name = v9;

    v11 = [v7 objectForKeyedSubscript:AXInteractionLocationDescriptorPointValueKey];

    if (AXValueGetType((AXValueRef)v11) != kAXValueTypeCGPoint)
    {
      AXValueGetType((AXValueRef)v11);
      _AXAssert();
    }
    AXValueGetValue((AXValueRef)v11, kAXValueTypeCGPoint, &v8->_point);
    v12 = [v7 objectForKeyedSubscript:AXInteractionLocationDescriptorViewPointerNumberKey];
    v13 = (NSNumber *)[v12 copy];
    viewPointerNumber = v8->_viewPointerNumber;
    v8->_viewPointerNumber = v13;

    v15 = [v7 objectForKeyedSubscript:AXInteractionLocationDescriptorContextSpacePointKey];

    if (AXValueGetType((AXValueRef)v15) != kAXValueTypeCGPoint)
    {
      AXValueGetType((AXValueRef)v15);
      _AXAssert();
    }
    AXValueGetValue((AXValueRef)v15, kAXValueTypeCGPoint, &v8->_contextSpacePoint);
    v16 = [v7 objectForKeyedSubscript:AXInteractionLocationDescriptorContextIDKey];
    v8->_contextID = [v16 unsignedIntValue];

    v17 = [v7 objectForKeyedSubscript:AXInteractionLocationDescriptorFixedScreenSpacePointKey];

    if (AXValueGetType((AXValueRef)v17) != kAXValueTypeCGPoint)
    {
      AXValueGetType((AXValueRef)v17);
      _AXAssert();
    }
    AXValueGetValue((AXValueRef)v17, kAXValueTypeCGPoint, &v8->_fixedSpaceScreenPoint);
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v7 = [v4 isMemberOfClass:objc_opt_class()]
    && [(NSString *)self->_name isEqual:*((void *)v4 + 13)]
    && (self->_point.x == *((double *)v4 + 14) ? (BOOL v5 = self->_point.y == *((double *)v4 + 15)) : (BOOL v5 = 0),
        v5
     && [(NSNumber *)self->_viewPointerNumber isEqual:*((void *)v4 + 16)]
     && (self->_contextSpacePoint.x == *((double *)v4 + 17)
       ? (BOOL v6 = self->_contextSpacePoint.y == *((double *)v4 + 18))
       : (BOOL v6 = 0),
         v6))
    && self->_contextID == *((_DWORD *)v4 + 38);

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = [(NSString *)self->_name hash] ^ (unint64_t)self->_point.x;
  unint64_t y = (unint64_t)self->_point.y;
  return v3 ^ y ^ (unint64_t)[(NSNumber *)self->_viewPointerNumber hash];
}

- (id)name
{
  return self->_name;
}

- (BOOL)ignoreWhenVoiceOverTouches
{
  return 0;
}

- (BOOL)performWithContext:(id)a3
{
  id v3 = a3;
  unsigned int v4 = [v3 dragSessionActive];
  if (v4) {
    [v3 dropDrag];
  }

  return v4;
}

- (BOOL)isValidForContext:(id)a3
{
  return [a3 dragSessionActive];
}

- (void)prepareWithContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewPointerNumber, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end