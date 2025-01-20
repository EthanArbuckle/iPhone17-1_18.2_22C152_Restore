@interface AVRoutingSessionDestination
- (AVRoutingSessionDestination)init;
- (AVRoutingSessionDestination)initWithFigRoutingSessionDestination:(__CFDictionary *)a3;
- (BOOL)_canQueryOutputDeviceDescriptionsAndReturnCurrentValue:(id *)a3;
- (BOOL)providesExternalVideoPlayback;
- (NSArray)outputDeviceDescriptions;
- (float)probability;
- (id)description;
- (void)dealloc;
@end

@implementation AVRoutingSessionDestination

- (AVRoutingSessionDestination)initWithFigRoutingSessionDestination:(__CFDictionary *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)AVRoutingSessionDestination;
  v4 = [(AVRoutingSessionDestination *)&v9 init];
  if (v4
    && (ivars = objc_alloc_init(AVRoutingSessionDestinationInternal), (v4->_ivars = ivars) != 0)
    && (!a3 ? (v6 = 0) : (__CFDictionary *)(v6 = (__CFDictionary *)CFRetain(a3), ivars = v4->_ivars),
        ivars->figDestination = v6,
        v4->_ivars->figDestination))
  {
    v7 = v4;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (AVRoutingSessionDestination)init
{
  return [(AVRoutingSessionDestination *)self initWithFigRoutingSessionDestination:0];
}

- (void)dealloc
{
  ivars = self->_ivars;
  if (ivars)
  {
    figDestination = ivars->figDestination;
    if (figDestination)
    {
      CFRelease(figDestination);
      ivars = self->_ivars;
    }
  }

  v5.receiver = self;
  v5.super_class = (Class)AVRoutingSessionDestination;
  [(AVRoutingSessionDestination *)&v5 dealloc];
}

- (id)description
{
  v10 = 0;
  BOOL v3 = [(AVRoutingSessionDestination *)self _canQueryOutputDeviceDescriptionsAndReturnCurrentValue:&v10];
  v4 = NSString;
  objc_super v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  if (v3) {
    v7 = v10;
  }
  else {
    v7 = @"<missing entitlement>";
  }
  [(AVRoutingSessionDestination *)self probability];
  return (id)[v4 stringWithFormat:@"<%@: %p, outputDeviceDescriptions=%@, probability=%f, providesExternalVideoPlayback=%@>", v6, self, v7, v8, objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[AVRoutingSessionDestination providesExternalVideoPlayback](self, "providesExternalVideoPlayback"))];
}

- (NSArray)outputDeviceDescriptions
{
  v12 = 0;
  if (![(AVRoutingSessionDestination *)self _canQueryOutputDeviceDescriptionsAndReturnCurrentValue:&v12])
  {
    v10 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Missing required entitlement com.apple.avfoundation.allow-identifying-output-device-details", v4, v5, v6, v7, v8, v11), 0 reason userInfo];
    objc_exception_throw(v10);
  }
  return v12;
}

- (BOOL)_canQueryOutputDeviceDescriptionsAndReturnCurrentValue:(id *)a3
{
  CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(self->_ivars->figDestination, (const void *)*MEMORY[0x1E4F757A0]);
  if (Value)
  {
    CFArrayRef v5 = Value;
    uint64_t v6 = (void *)[MEMORY[0x1E4F1CA48] array];
    if (CFArrayGetCount(v5) >= 1)
    {
      CFIndex v7 = 0;
      do
      {
        uint64_t v8 = +[AVOutputDevice outputDeviceWithRouteDescriptor:CFArrayGetValueAtIndex(v5, v7) withRoutingContext:0];
        if (v8) {
          [v6 addObject:v8];
        }
        ++v7;
      }
      while (v7 < CFArrayGetCount(v5));
    }
    LOBYTE(Value) = v6 != 0;
    if (a3 && v6)
    {
      *a3 = v6;
      LOBYTE(Value) = 1;
    }
  }
  return (char)Value;
}

- (float)probability
{
  return 0.0;
}

- (BOOL)providesExternalVideoPlayback
{
  return 0;
}

@end