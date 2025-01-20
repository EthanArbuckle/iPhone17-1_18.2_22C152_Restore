void sub_23981660C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_2398177B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id location)
{
  objc_destroyWeak(v28);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id AXRUIImageForRemoteAction(void *a1)
{
  id v1 = a1;
  uint64_t Type = AXDeviceGetType();
  v3 = AXRUIImageForRemoteActionWithDeviceType(v1, Type);

  return v3;
}

id AXRUIImageForRemoteActionWithDeviceType(void *a1, uint64_t a2)
{
  id v3 = a1;
  if ([v3 isEqualToString:*MEMORY[0x263F21F68]])
  {
    uint64_t v4 = a2 - 1;
    if (unint64_t)(a2 - 1) < 7 && ((0x5Fu >> v4))
    {
      v5 = off_264DA8CF0;
LABEL_8:
      v6 = v5[v4];
LABEL_34:
      v7 = (void *)MEMORY[0x263F1C6B0];
      v8 = [MEMORY[0x263F1C6C8] configurationWithTextStyle:*MEMORY[0x263F1D308]];
      v9 = [v7 _systemImageNamed:v6 withConfiguration:v8];

      goto LABEL_64;
    }
    goto LABEL_63;
  }
  if (![v3 isEqualToString:*MEMORY[0x263F21F58]])
  {
    if ([v3 isEqualToString:*MEMORY[0x263F21FA8]])
    {
      v6 = @"bell.badge.fill";
      goto LABEL_34;
    }
    if ([v3 isEqualToString:*MEMORY[0x263F21F60]])
    {
      v6 = @"switch.2";
      goto LABEL_34;
    }
    if ([v3 isEqualToString:*MEMORY[0x263F21FB8]])
    {
      v6 = @"siri";
      goto LABEL_34;
    }
    if ([v3 isEqualToString:*MEMORY[0x263F21FF8]])
    {
      v6 = @"chevron.backward.circle";
      goto LABEL_34;
    }
    if ([v3 isEqualToString:*MEMORY[0x263F22000]]) {
      goto LABEL_18;
    }
    if ([v3 isEqualToString:*MEMORY[0x263F21FC0]])
    {
      v6 = @"circle.circle.fill";
      goto LABEL_34;
    }
    if ([v3 isEqualToString:*MEMORY[0x263F21FC8]])
    {
      v6 = @"square.grid.3x3.square";
      goto LABEL_34;
    }
    if ([v3 isEqualToString:*MEMORY[0x263F21FE8]])
    {
      v6 = @"play.circle.fill";
      goto LABEL_34;
    }
    if ([v3 isEqualToString:*MEMORY[0x263F21FE0]])
    {
LABEL_18:
      v6 = @"circle.fill";
      goto LABEL_34;
    }
    if ([v3 isEqualToString:*MEMORY[0x263F21FD0]])
    {
LABEL_27:
      v6 = @"chevron.forward.2";
      goto LABEL_34;
    }
    if (([v3 isEqualToString:*MEMORY[0x263F21FD8]] & 1) == 0)
    {
      if ([v3 isEqualToString:*MEMORY[0x263F21FF0]])
      {
        v6 = @"stop.circle.fill";
        goto LABEL_34;
      }
      if ([v3 isEqualToString:*MEMORY[0x263F22058]])
      {
        v6 = @"hand.tap.fill";
        goto LABEL_34;
      }
      if ([v3 isEqualToString:*MEMORY[0x263F22008]]) {
        goto LABEL_27;
      }
      if (([v3 isEqualToString:*MEMORY[0x263F22020]] & 1) == 0)
      {
        if ([v3 isEqualToString:*MEMORY[0x263F22018]])
        {
          v6 = @"arrow.clockwise";
          goto LABEL_34;
        }
        if ([v3 isEqualToString:*MEMORY[0x263F22030]])
        {
          v6 = @"arrow.counterclockwise";
          goto LABEL_34;
        }
        if ([v3 isEqualToString:*MEMORY[0x263F22010]])
        {
          v6 = @"arrow.turn.right.down";
          goto LABEL_34;
        }
        if ([v3 isEqualToString:*MEMORY[0x263F22028]])
        {
          v6 = @"arrow.turn.left.up";
          goto LABEL_34;
        }
        if ([v3 isEqualToString:*MEMORY[0x263F22050]])
        {
          v6 = @"arrow.up.circle.fill";
          goto LABEL_34;
        }
        if ([v3 isEqualToString:*MEMORY[0x263F22038]])
        {
          v6 = @"arrow.down.circle.fill";
          goto LABEL_34;
        }
        if ([v3 isEqualToString:*MEMORY[0x263F22040]])
        {
          v6 = @"arrow.left.circle.fill";
          goto LABEL_34;
        }
        if ([v3 isEqualToString:*MEMORY[0x263F22048]])
        {
          v6 = @"arrow.right.circle.fill";
          goto LABEL_34;
        }
        if ([v3 isEqualToString:*MEMORY[0x263F21F78]])
        {
          v6 = @"playpause.fill";
          goto LABEL_34;
        }
        if ([v3 isEqualToString:*MEMORY[0x263F21F70]])
        {
          v6 = @"forward.fill";
          goto LABEL_34;
        }
        if ([v3 isEqualToString:*MEMORY[0x263F21F80]])
        {
          v6 = @"backward.fill";
          goto LABEL_34;
        }
        if ([v3 isEqualToString:*MEMORY[0x263F21F90]])
        {
          v6 = @"speaker.wave.2.fill";
          goto LABEL_34;
        }
        if ([v3 isEqualToString:*MEMORY[0x263F21F88]])
        {
          v6 = @"speaker.wave.1.fill";
          goto LABEL_34;
        }
        goto LABEL_63;
      }
    }
    v6 = @"chevron.backward.2";
    goto LABEL_34;
  }
  uint64_t v4 = a2 - 1;
  if ((unint64_t)(a2 - 1) < 5)
  {
    v5 = off_264DA8D28;
    goto LABEL_8;
  }
LABEL_63:
  v9 = 0;
LABEL_64:

  return v9;
}

uint64_t AXDeviceGetType()
{
  return MEMORY[0x270F09F90]();
}

uint64_t AXLocalizedStringForHandGestureEventUsage()
{
  return MEMORY[0x270F0A1A8]();
}

uint64_t AXPerformBlockAsynchronouslyOnMainThread()
{
  return MEMORY[0x270F0A248]();
}

uint64_t AXPerformBlockOnMainThread()
{
  return MEMORY[0x270F0A250]();
}

uint64_t AXRLocalizedStringForKey()
{
  return MEMORY[0x270F09C00]();
}

uint64_t AXRLocalizedStringForRemoteActionWithDeviceType()
{
  return MEMORY[0x270F09C08]();
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59C8](retstr, t, sx, sy);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t _AXSVoiceOverTouchEnabled()
{
  return MEMORY[0x270F90B78]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}