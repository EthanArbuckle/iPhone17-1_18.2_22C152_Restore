@interface VOTDragCustomAction
- (BOOL)ignoreWhenVoiceOverTouches;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValidForContext:(id)a3;
- (BOOL)performWithContext:(id)a3;
- (VOTDragCustomAction)initWithName:(id)a3 wireDictionary:(id)a4;
- (id)name;
- (unint64_t)hash;
- (void)setRemoteElement:(id)a3;
- (void)setRemotePoint:(CGPoint)a3;
@end

@implementation VOTDragCustomAction

- (VOTDragCustomAction)initWithName:(id)a3 wireDictionary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)VOTDragCustomAction;
  v8 = [(VOTDragCustomAction *)&v16 init];
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
    remoteElement = v8->_remoteElement;
    v8->_remoteElement = 0;

    v13 = (NSDictionary *)[v7 copy];
    wireDictionary = v8->_wireDictionary;
    v8->_wireDictionary = v13;
  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && [(NSString *)self->_name isEqual:v4[13]]
    && (self->_point.x == *((double *)v4 + 14) ? (BOOL v5 = self->_point.y == *((double *)v4 + 15)) : (BOOL v5 = 0), v5))
  {
    unsigned __int8 v6 = [(NSDictionary *)self->_wireDictionary isEqual:v4[17]];
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = [(NSString *)self->_name hash] ^ (unint64_t)self->_point.x;
  unint64_t y = (unint64_t)self->_point.y;
  return v3 ^ y ^ (unint64_t)[(NSDictionary *)self->_wireDictionary hash];
}

- (id)name
{
  return self->_name;
}

- (void)setRemoteElement:(id)a3
{
}

- (void)setRemotePoint:(CGPoint)a3
{
  CGPoint v7 = a3;
  self->_point = a3;
  v4 = (NSDictionary *)[(NSDictionary *)self->_wireDictionary mutableCopy];
  AXValueRef v5 = AXValueCreate(kAXValueTypeCGPoint, &v7);
  [(NSDictionary *)v4 setObject:v5 forKeyedSubscript:AXInteractionLocationDescriptorPointValueKey];

  wireDictionarunint64_t y = self->_wireDictionary;
  self->_wireDictionarunint64_t y = v4;
}

- (BOOL)ignoreWhenVoiceOverTouches
{
  return 0;
}

- (BOOL)performWithContext:(id)a3
{
  id v4 = a3;
  AXValueRef v5 = v4;
  remoteElement = self->_remoteElement;
  if (remoteElement)
  {
    CGPoint v7 = remoteElement;
  }
  else
  {
    CGPoint v7 = [v4 actionElement];
  }
  v8 = v7;
  id v9 = (id)[(VOTElement *)v7 pid];
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  v15 = sub_1000F506C;
  objc_super v16 = &unk_1001B6BC8;
  v18 = &v19;
  v10 = dispatch_semaphore_create(0);
  v17 = v10;
  [v5 waitForDragStartFromPid:v9 completionHandler:&v13];
  unsigned int v11 = -[VOTElement activateDragWithDescriptorDictionary:](v8, "activateDragWithDescriptorDictionary:", self->_wireDictionary, v13, v14, v15, v16);
  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  if (v11) {
    LOBYTE(v11) = *((unsigned char *)v20 + 24) != 0;
  }

  _Block_object_dispose(&v19, 8);
  return v11;
}

- (BOOL)isValidForContext:(id)a3
{
  return [a3 dragSessionActive] ^ 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wireDictionary, 0);
  objc_storeStrong((id *)&self->_remoteElement, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end