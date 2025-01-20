@interface BLSHBacklightEnvironmentStateMachineAbortPayload
+ (unsigned)presentationEntryIdentifierFromString:(id)a3;
+ (void)populateEnvironmentStateMachineStruct:(id *)a3 machineIsNil:(BOOL)a4 presentation:(id)a5 addingEnvironmentsCount:(int)a6 updatingVisualStateTransitionStates:(id)a7 updatingDateSpecifierTransitionStates:(id)a8 backlightState:(int64_t)a9 previousBacklightState:(int64_t)a10 pendingNotifyBeganUpdatingState:(BOOL)a11 updatingState:(BOOL)a12 updatingPresentation:(BOOL)a13;
+ (void)populateOperationCompletedMismatchedBacklightStatesStruct:(id *)a3 backlightState:(int64_t)a4 targetBacklightState:(int64_t)a5 performEventHistory:(id)a6 didBeginUpdateHistory:(id)a7 didCompleteUpdateHistory:(id)a8 envStateMachineIsNil:(BOOL)a9 envStateMachinePresentation:(id)a10 addingEnvironmentsCount:(int)a11 envStateMachineUpdatingVisualStateTransitionStates:(id)a12 envStateMachineUpdatingDateSpecifierTransitionStates:(id)a13 envStateMachineBacklightState:(int64_t)a14 envStateMachinePreviousBacklightState:(int64_t)a15 envStateMachinePendingNotifyBeganUpdatingState:(BOOL)a16 envStateMachineUpdatingState:(BOOL)a17 envStateMachineUpdatingPresentation:(BOOL)a18;
+ (void)populatePresentationStruct:(id *)a3 withPresentation:(id)a4;
+ (void)populateTransitionStateStruct:(void *)a3 withTransitionState:;
@end

@implementation BLSHBacklightEnvironmentStateMachineAbortPayload

+ (unsigned)presentationEntryIdentifierFromString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqual:@"com.apple.Carousel"])
  {
    unsigned int v4 = 1;
  }
  else if ([v3 isEqual:@"com.apple.clockface"])
  {
    unsigned int v4 = 2;
  }
  else if ([v3 isEqual:@"com.apple.Carousel.defaultblanking"])
  {
    unsigned int v4 = 6;
  }
  else if ([v3 hasPrefix:@"com.apple.carousel.lockscreen"])
  {
    unsigned int v4 = 7;
  }
  else if ([v3 hasPrefix:@"com.apple.carousel.bulletin.alert"])
  {
    unsigned int v4 = 5;
  }
  else if ([v3 hasPrefix:@"remoteContextView"])
  {
    unsigned int v4 = 3;
  }
  else if ([v3 hasPrefix:@"com.apple.Carousel.coordinatedBacklightTransitioner"])
  {
    unsigned int v4 = 8;
  }
  else if ([v3 containsString:@"alert:Legacy"])
  {
    unsigned int v4 = 4;
  }
  else
  {
    unsigned int v4 = 0;
  }

  return v4;
}

+ (void)populatePresentationStruct:(id *)a3 withPresentation:(id)a4
{
  id v6 = a4;
  *(unsigned char *)a3 = *(unsigned char *)a3 & 0xFE | (v6 != 0);
  id v26 = v6;
  if (v6)
  {
    v7 = [v6 flipbookContext];
    if ([v7 isInverted]) {
      char v8 = 4;
    }
    else {
      char v8 = 0;
    }
    *(unsigned char *)a3 = *(unsigned char *)a3 & 0xFB | v8;

    v9 = [v26 flipbookContext];
    if ([v9 wantsTransform]) {
      char v10 = 2;
    }
    else {
      char v10 = 0;
    }
    *(unsigned char *)a3 = *(unsigned char *)a3 & 0xFD | v10;

    v11 = [v26 presentationEntries];
    uint64_t v12 = [v11 count];

    uint64_t v13 = 0;
    a3->var3 = v12;
    p_var7 = &a3->var7;
    p_var6 = &a3->var6;
    p_var5 = &a3->var5;
    p_var4 = &a3->var4;
    do
    {
      if (v12 == v13) {
        break;
      }
      v17 = [v26 presentationEntries];
      v18 = [v17 objectAtIndexedSubscript:v13];
      v19 = [v18 environment];
      v20 = [v19 identifier];

      unsigned int v21 = [a1 presentationEntryIdentifierFromString:v20];
      v22 = p_var4;
      switch((int)v13)
      {
        case 0:
          break;
        case 1:
          v22 = p_var5;
          break;
        case 2:
          v22 = p_var6;
          break;
        case 3:
          v22 = p_var7;
          break;
        default:
          v23 = objc_msgSend(NSString, "stringWithFormat:", @"Can't handle index %u", v13);
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            +[BLSHBacklightEnvironmentStateMachineAbortPayload populatePresentationStruct:withPresentation:](a2);
          }
          [v23 UTF8String];
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x21FD23760);
      }
      unsigned int *v22 = v21;

      ++v13;
    }
    while (v13 != 4);
  }
}

+ (void)populateTransitionStateStruct:(void *)a3 withTransitionState:
{
  id v9 = a3;
  unsigned int v4 = self;
  *(unsigned char *)a2 = *(unsigned char *)a2 & 0xFE | (v9 != 0);
  if (v9)
  {
    v5 = [v9 environment];
    id v6 = [v5 identifier];
    *(_DWORD *)(a2 + 4) = [v4 presentationEntryIdentifierFromString:v6];

    *(unsigned char *)(a2 + 8) = *(unsigned char *)(a2 + 8) & 0xFE | [v9 isUpdatingInitialState];
    if ([v9 isUpdatingVisualState]) {
      char v7 = 2;
    }
    else {
      char v7 = 0;
    }
    *(unsigned char *)(a2 + 8) = *(unsigned char *)(a2 + 8) & 0xFD | v7;
    if ([v9 isAnimating]) {
      char v8 = 4;
    }
    else {
      char v8 = 0;
    }
    *(unsigned char *)(a2 + 8) = *(unsigned char *)(a2 + 8) & 0xFB | v8;
  }
}

+ (void)populateEnvironmentStateMachineStruct:(id *)a3 machineIsNil:(BOOL)a4 presentation:(id)a5 addingEnvironmentsCount:(int)a6 updatingVisualStateTransitionStates:(id)a7 updatingDateSpecifierTransitionStates:(id)a8 backlightState:(int64_t)a9 previousBacklightState:(int64_t)a10 pendingNotifyBeganUpdatingState:(BOOL)a11 updatingState:(BOOL)a12 updatingPresentation:(BOOL)a13
{
  id v33 = a5;
  id v19 = a7;
  id v20 = a8;
  *(unsigned char *)a3 = *(unsigned char *)a3 & 0xFE | !a4;
  if (!a4)
  {
    [a1 populatePresentationStruct:&a3->var1 withPresentation:v33];
    uint64_t v21 = [v19 count];
    uint64_t v22 = 0;
    a3->var2 = v21;
    do
    {
      if (v21 == v22) {
        break;
      }
      v23 = [v19 objectAtIndexedSubscript:v22];
      p_var3 = &a3->var3;
      switch((int)v22)
      {
        case 0:
          break;
        case 1:
          p_var3 = &a3->var4;
          break;
        case 2:
          p_var3 = &a3->var5;
          break;
        case 3:
          p_var3 = &a3->var6;
          break;
        default:
          v31 = objc_msgSend(NSString, "stringWithFormat:", @"Can't handle index %u", v22);
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            +[BLSHBacklightEnvironmentStateMachineAbortPayload populateEnvironmentStateMachineStruct:machineIsNil:presentation:addingEnvironmentsCount:updatingVisualStateTransitionStates:updatingDateSpecifierTransitionStates:backlightState:previousBacklightState:pendingNotifyBeganUpdatingState:updatingState:updatingPresentation:](a2);
          }
          [v31 UTF8String];
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x21FD23B40);
      }
      +[BLSHBacklightEnvironmentStateMachineAbortPayload populateTransitionStateStruct:withTransitionState:]((uint64_t)a1, (uint64_t)p_var3, v23);

      ++v22;
    }
    while (v22 != 4);
    uint64_t v25 = [v20 count];
    uint64_t v26 = 0;
    a3->var7 = v25;
    do
    {
      if (v25 == v26) {
        break;
      }
      v27 = [v20 objectAtIndexedSubscript:v26];
      p_var8 = &a3->var8;
      switch((int)v26)
      {
        case 0:
          break;
        case 1:
          p_var8 = &a3->var9;
          break;
        case 2:
          p_var8 = &a3->var10;
          break;
        case 3:
          p_var8 = &a3->var11;
          break;
        default:
          v32 = objc_msgSend(NSString, "stringWithFormat:", @"Can't handle index %u", v26);
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            +[BLSHBacklightEnvironmentStateMachineAbortPayload populateEnvironmentStateMachineStruct:machineIsNil:presentation:addingEnvironmentsCount:updatingVisualStateTransitionStates:updatingDateSpecifierTransitionStates:backlightState:previousBacklightState:pendingNotifyBeganUpdatingState:updatingState:updatingPresentation:](a2);
          }
          [v32 UTF8String];
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x21FD23B9CLL);
      }
      +[BLSHBacklightEnvironmentStateMachineAbortPayload populateTransitionStateStruct:withTransitionState:]((uint64_t)a1, (uint64_t)p_var8, v27);

      ++v26;
    }
    while (v26 != 4);
    a3->var12 = a9;
    a3->var13 = a10;
    if (a12) {
      char v29 = 2;
    }
    else {
      char v29 = 0;
    }
    if (a13) {
      char v30 = 4;
    }
    else {
      char v30 = 0;
    }
    *((unsigned char *)a3 + 140) = v29 | a11 | v30 | *((unsigned char *)a3 + 140) & 0xF8;
  }
}

+ (void)populateOperationCompletedMismatchedBacklightStatesStruct:(id *)a3 backlightState:(int64_t)a4 targetBacklightState:(int64_t)a5 performEventHistory:(id)a6 didBeginUpdateHistory:(id)a7 didCompleteUpdateHistory:(id)a8 envStateMachineIsNil:(BOOL)a9 envStateMachinePresentation:(id)a10 addingEnvironmentsCount:(int)a11 envStateMachineUpdatingVisualStateTransitionStates:(id)a12 envStateMachineUpdatingDateSpecifierTransitionStates:(id)a13 envStateMachineBacklightState:(int64_t)a14 envStateMachinePreviousBacklightState:(int64_t)a15 envStateMachinePendingNotifyBeganUpdatingState:(BOOL)a16 envStateMachineUpdatingState:(BOOL)a17 envStateMachineUpdatingPresentation:(BOOL)a18
{
  int v20 = a5;
  int v21 = a4;
  id v47 = a6;
  id v24 = a7;
  id v25 = a8;
  id v46 = a10;
  id v45 = a12;
  id v44 = a13;
  a3->var0 = 1;
  a3->var1 = v21;
  a3->var2 = v20;
  unint64_t v26 = [v47 count];
  uint64_t v27 = 0;
  unint64_t v28 = 0;
  a3->var3 = v26;
  do
  {
    char v29 = (char *)a3 + v27 * 32;
    a3->var4[v27].var0 = 1;
    char v30 = *((unsigned char *)&a3->var4[v27] + 4);
    if (v28 >= v26)
    {
      v29[20] = v30 & 0xFE;
    }
    else
    {
      v29[20] = v30 | 1;
      v31 = [v47 objectAtIndexedSubscript:v28];
      *((_DWORD *)v29 + 6) = [v31 stateMachineOldBacklightState];
      *((_DWORD *)v29 + 7) = [v31 eventPreviousBacklightState];
      *((_DWORD *)v29 + 8) = [v31 eventNewBacklightState];
      *((void *)v29 + 5) = [v31 startedTime];
    }
    ++v28;
    ++v27;
  }
  while (v27 != 5);
  unint64_t v32 = [v24 count];
  unint64_t v33 = 0;
  a3->var5 = v32;
  var6 = a3->var6;
  do
  {
    var6->var0 = 1;
    if (v33 >= v32)
    {
      LOBYTE(var6[5].var3) &= ~1u;
    }
    else
    {
      *((unsigned char *)var6 + 4) |= 1u;
      v35 = [v24 objectAtIndexedSubscript:v33];
      v36 = [v35 environmentIdentifier];
      var6->var2 = [a1 presentationEntryIdentifierFromString:v36];

      var6->var3 = [v35 newBacklightState];
      var6->var4 = [v35 pendingTransitionStateCount];
      var6->var5 = [v35 timeStamp];
    }
    ++v33;
    ++var6;
  }
  while (v33 != 5);
  unint64_t v37 = [v25 count];
  unint64_t v38 = 0;
  a3->var7 = v37;
  var8 = a3->var8;
  do
  {
    var8->var0 = 1;
    char v40 = *((unsigned char *)var8 + 4);
    if (v38 >= v37)
    {
      *((unsigned char *)var8 + 4) = v40 & 0xFE;
    }
    else
    {
      *((unsigned char *)var8 + 4) = v40 | 1;
      v41 = [v25 objectAtIndexedSubscript:v38];
      v42 = [v41 environmentIdentifier];
      var8->var2 = [a1 presentationEntryIdentifierFromString:v42];

      var8->var3 = [v41 newBacklightState];
      var8->var4 = [v41 pendingTransitionStateCount];
      var8->var5 = [v41 timeStamp];
    }
    ++v38;
    ++var8;
  }
  while (v38 != 5);
  BYTE2(v43) = a18;
  LOWORD(v43) = __PAIR16__(a17, a16);
  objc_msgSend(a1, "populateEnvironmentStateMachineStruct:machineIsNil:presentation:addingEnvironmentsCount:updatingVisualStateTransitionStates:updatingDateSpecifierTransitionStates:backlightState:previousBacklightState:pendingNotifyBeganUpdatingState:updatingState:updatingPresentation:", &a3->var9, a9, v46, a11, v45, v44, a14, a15, v43);
}

+ (void)populatePresentationStruct:(const char *)a1 withPresentation:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)populateEnvironmentStateMachineStruct:(const char *)a1 machineIsNil:presentation:addingEnvironmentsCount:updatingVisualStateTransitionStates:updatingDateSpecifierTransitionStates:backlightState:previousBacklightState:pendingNotifyBeganUpdatingState:updatingState:updatingPresentation:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)populateEnvironmentStateMachineStruct:(const char *)a1 machineIsNil:presentation:addingEnvironmentsCount:updatingVisualStateTransitionStates:updatingDateSpecifierTransitionStates:backlightState:previousBacklightState:pendingNotifyBeganUpdatingState:updatingState:updatingPresentation:.cold.2(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end