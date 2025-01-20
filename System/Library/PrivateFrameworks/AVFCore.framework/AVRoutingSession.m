@interface AVRoutingSession
- (AVRoutingSession)init;
- (AVRoutingSession)initWithFigRoutingSession:(OpaqueFigRoutingSession *)a3;
- (AVRoutingSessionDestination)destination;
- (BOOL)establishedAutomaticallyFromLikelyDestination;
- (id)description;
- (void)dealloc;
@end

@implementation AVRoutingSession

- (AVRoutingSession)initWithFigRoutingSession:(OpaqueFigRoutingSession *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)AVRoutingSession;
  v4 = [(AVRoutingSession *)&v9 init];
  if (v4
    && (ivars = objc_alloc_init(AVRoutingSessionInternal), (v4->_ivars = ivars) != 0)
    && (!a3 ? (v6 = 0) : (OpaqueFigRoutingSession *)(v6 = (OpaqueFigRoutingSession *)CFRetain(a3), ivars = v4->_ivars),
        ivars->figRoutingSession = v6,
        v4->_ivars->figRoutingSession))
  {
    v7 = v4;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (AVRoutingSession)init
{
  return [(AVRoutingSession *)self initWithFigRoutingSession:0];
}

- (void)dealloc
{
  ivars = self->_ivars;
  if (ivars)
  {
    figRoutingSession = ivars->figRoutingSession;
    if (figRoutingSession)
    {
      CFRelease(figRoutingSession);
      ivars = self->_ivars;
    }
  }

  v5.receiver = self;
  v5.super_class = (Class)AVRoutingSession;
  [(AVRoutingSession *)&v5 dealloc];
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  if ([(AVRoutingSession *)self establishedAutomaticallyFromLikelyDestination])
  {
    v6 = "Y";
  }
  else
  {
    v6 = "N";
  }
  return (id)[v3 stringWithFormat:@"<%@: %p, establishedAutomaticallyFromLikelyDestination=%s, destination=%@>", v5, self, v6, -[AVRoutingSession destination](self, "destination")];
}

- (BOOL)establishedAutomaticallyFromLikelyDestination
{
  CFTypeRef cf = 0;
  uint64_t CMBaseObject = FigRoutingSessionGetCMBaseObject();
  uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  objc_super v5 = *(unsigned int (**)(uint64_t, void, void, CFTypeRef *))(v4 + 48);
  if (v5)
  {
    BOOL v6 = v5(CMBaseObject, *MEMORY[0x1E4F757C8], *MEMORY[0x1E4F1CF80], &cf) == 0;
    CFTypeRef v7 = cf;
    CFTypeRef v8 = (CFTypeRef)*MEMORY[0x1E4F1CFD0];
    if (cf) {
      CFRelease(cf);
    }
  }
  else
  {
    BOOL v6 = 0;
    CFTypeRef v7 = 0;
    CFTypeRef v8 = (CFTypeRef)*MEMORY[0x1E4F1CFD0];
  }
  return v7 == v8 && v6;
}

- (AVRoutingSessionDestination)destination
{
  CFTypeRef cf = 0;
  figRoutingSession = self->_ivars->figRoutingSession;
  uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  objc_super v5 = *(unsigned int (**)(OpaqueFigRoutingSession *, CFTypeRef *))(v4 + 8);
  if (!v5 || v5(figRoutingSession, &cf))
  {
    CFTypeRef v7 = 0;
  }
  else
  {
    BOOL v6 = [AVRoutingSessionDestination alloc];
    CFTypeRef v7 = [(AVRoutingSessionDestination *)v6 initWithFigRoutingSessionDestination:cf];
  }
  if (cf) {
    CFRelease(cf);
  }
  return v7;
}

@end