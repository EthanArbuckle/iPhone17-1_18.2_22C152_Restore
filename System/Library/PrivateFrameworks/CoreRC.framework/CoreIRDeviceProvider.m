@interface CoreIRDeviceProvider
+ (BOOL)supportsSecureCoding;
+ (void)load;
- ($E9D0CE23C4879AFD1046A22AEC3FB8EC)_findButtonWithCommand:(unint64_t)a3;
- (BOOL)clearAllStoredCommands:(id *)a3;
- (BOOL)disableButtonCombination:(id)a3 delay:(double)a4 error:(id *)a5;
- (BOOL)dispatchButtonEventWithCommand:(unint64_t)a3 pressed:(BOOL)a4 timestamp:(unint64_t)a5 toDevice:(id)a6;
- (BOOL)dispatchEventForCommand:(id)a3 matchingButton:(id *)a4 timestamp:(unint64_t)a5 toDevice:(id)a6;
- (BOOL)dispatchEventsForCommand:(id)a3 toDevice:(id)a4;
- (BOOL)enableButtonCombination:(id)a3 delay:(double)a4 error:(id *)a5;
- (BOOL)sendCommand:(id)a3 error:(id *)a4;
- (BOOL)sendCommand:(unint64_t)a3 target:(id)a4 withDuration:(unint64_t)a5 error:(id *)a6;
- (BOOL)sendHIDEvent:(id)a3 target:(id)a4 error:(id *)a5;
- (BOOL)setCommand:(unint64_t)a3 target:(id)a4 forButtonCombination:(id)a5 delay:(double)a6 error:(id *)a7;
- (BOOL)setExtendedProperty:(id)a3 forKey:(id)a4 error:(id *)a5;
- (BOOL)setInfraredCommand:(id)a3 forCommand:(unint64_t)a4 error:(id *)a5;
- (BOOL)setMappingWithSession:(id)a3 error:(id *)a4;
- (BOOL)setOSDName:(id)a3 error:(id *)a4;
- (BOOL)updateMappingWithSession:(id)a3 error:(id *)a4;
- (Class)classForCoder;
- (CoreIRDeviceProvider)initWithBus:(id)a3 local:(BOOL)a4 deviceType:(unint64_t)a5;
- (CoreIRDeviceProvider)initWithCoder:(id)a3;
- (CoreIRDeviceProvider)initWithDevice:(id)a3;
- (NSDictionary)matchingDict;
- (NSDictionary)persistentProperties;
- (id)extendedPropertyForKey:(id)a3 error:(id *)a4;
- (id)infraredCommandForCommand:(unint64_t)a3;
- (id)interface;
- (id)startLearningSessionWithReason:(unint64_t)a3 error:(id *)a4;
- (int)_setInfraredCommandPattern:(id)a3 repeatPattern:(id)a4 forCommand:(unint64_t)a5;
- (unint64_t)findDuplicateIRCommand:(id)a3 forCommand:(unint64_t)a4 device:(id *)a5;
- (unsigned)protocolMask;
- (void)_removeMappingForCommand:(unint64_t)a3;
- (void)cancelPressAndHoldTimer;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)handleIRCommand:(id)a3;
- (void)schedulePressAndHoldTimer;
- (void)setMatchingDict:(id)a3;
- (void)setPersistentProperties:(id)a3;
- (void)synthesizeButtonReleaseWithTimestamp:(unint64_t)a3;
@end

@implementation CoreIRDeviceProvider

+ (void)load
{
  _maxRepeatIntervalTicks_0 = MillisecondsToUpTicks();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  if (self->_buttonCount)
  {
    unint64_t v3 = 0;
    p_repeatArray = (void **)&self->_buttonArray[0].repeatArray;
    do
    {
      v5 = *(p_repeatArray - 2);
      if (v5)
      {
        free(v5);
        *(p_repeatArray - 2) = 0;
      }
      if (*p_repeatArray)
      {
        free(*p_repeatArray);
        *p_repeatArray = 0;
      }
      ++v3;
      p_repeatArray += 6;
    }
    while (v3 < self->_buttonCount);
  }
  v6.receiver = self;
  v6.super_class = (Class)CoreIRDeviceProvider;
  [(CoreIRDevice *)&v6 dealloc];
}

- (CoreIRDeviceProvider)initWithBus:(id)a3 local:(BOOL)a4 deviceType:(unint64_t)a5
{
  v7.receiver = self;
  v7.super_class = (Class)CoreIRDeviceProvider;
  v5 = [(CoreIRDevice *)&v7 initWithBus:a3 local:a4 deviceType:a5];
  if (v5)
  {
    v5->_matchingDict = (NSDictionary *)objc_opt_new();
    v5->_commandMappings = (NSMutableSet *)objc_opt_new();
    v5->_lastButtonPressed = 0;
  }
  return v5;
}

- (CoreIRDeviceProvider)initWithDevice:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CoreIRDeviceProvider;
  v4 = -[CoreIRDevice initWithDevice:](&v7, sel_initWithDevice_);
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v4->_matchingDict = (NSDictionary *)(id)[a3 matchingDict];
      uint64_t v5 = [objc_alloc(MEMORY[0x263EFF9C0]) initWithSet:*((void *)a3 + 12) copyItems:1];
    }
    else
    {
      v4->_matchingDict = (NSDictionary *)objc_opt_new();
      uint64_t v5 = objc_opt_new();
    }
    v4->_commandMappings = (NSMutableSet *)v5;
    v4->_lastButtonPressed = 0;
  }
  return v4;
}

- (CoreIRDeviceProvider)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CoreIRDeviceProvider;
  v4 = -[CoreIRDevice initWithCoder:](&v6, sel_initWithCoder_);
  if (v4)
  {
    v4->_matchingDict = (NSDictionary *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"matchingDict"];
    v4->_commandMappings = (NSMutableSet *)objc_opt_new();
    v4->_lastButtonPressed = 0;
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CoreIRDeviceProvider;
  -[CoreIRDevice encodeWithCoder:](&v5, sel_encodeWithCoder_);
  [a3 encodeObject:self->_matchingDict forKey:@"matchingDict"];
}

- (Class)classForCoder
{
  return NSClassFromString(&cfstr_Coreirdevicecl_8.isa);
}

- (id)interface
{
  id v2 = [(CoreRCDevice *)self bus];
  return (id)[v2 interface];
}

- (BOOL)setOSDName:(id)a3 error:(id *)a4
{
  v12 = 0;
  if (!a3)
  {
    v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v9 = *MEMORY[0x263F08410];
    uint64_t v10 = -6705;
LABEL_8:
    v12 = (void *)[v8 errorWithDomain:v9 code:v10 userInfo:0];
    goto LABEL_9;
  }
  if ((objc_msgSend(-[CoreRCDevice bus](self, "bus"), "updatePersistentValue:forProperty:ofDevice:", a3, @"OSDName", self) & 1) == 0)
  {
    v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v9 = *MEMORY[0x263F08410];
    uint64_t v10 = -6747;
    goto LABEL_8;
  }
  v11.receiver = self;
  v11.super_class = (Class)CoreIRDeviceProvider;
  if ([(CoreIRDevice *)&v11 setOSDName:a3 error:&v12])
  {
    objc_msgSend(-[CoreRCDevice bus](self, "bus"), "notifyDelegateDeviceUpdated:", self);
    return 1;
  }
LABEL_9:
  BOOL result = 0;
  if (a4) {
    *a4 = v12;
  }
  return result;
}

- (NSDictionary)persistentProperties
{
  unint64_t v3 = (NSDictionary *)[MEMORY[0x263EFF9A0] dictionary];
  if ([(CoreIRDevice *)self OSDName]) {
    [(NSDictionary *)v3 setObject:[(CoreIRDevice *)self OSDName] forKeyedSubscript:@"OSDName"];
  }
  return v3;
}

- (void)setPersistentProperties:(id)a3
{
  uint64_t v4 = [a3 objectForKeyedSubscript:@"OSDName"];
  if (v4)
  {
    v5.receiver = self;
    v5.super_class = (Class)CoreIRDeviceProvider;
    [(CoreIRDevice *)&v5 setOSDName:v4 error:0];
  }
}

- (BOOL)setExtendedProperty:(id)a3 forKey:(id)a4 error:(id *)a5
{
  if (gLogCategory_CoreRCDevice <= 90 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  return 0;
}

- (id)extendedPropertyForKey:(id)a3 error:(id *)a4
{
  if (gLogCategory_CoreRCDevice <= 90 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  return 0;
}

- (unsigned)protocolMask
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  commandMappings = self->_commandMappings;
  uint64_t v3 = [(NSMutableSet *)commandMappings countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v3;
  unsigned int v5 = 0;
  uint64_t v6 = *(void *)v10;
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v10 != v6) {
        objc_enumerationMutation(commandMappings);
      }
      v5 |= 1 << objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "objectForKeyedSubscript:", @"Mapping IRCommand"), "protocol"), "protocolID");
    }
    uint64_t v4 = [(NSMutableSet *)commandMappings countByEnumeratingWithState:&v9 objects:v13 count:16];
  }
  while (v4);
  return v5;
}

- (id)infraredCommandForCommand:(unint64_t)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    uint64_t v14 = self;
    commandMappings = self->_commandMappings;
    LogPrintF();
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  unsigned int v5 = self->_commandMappings;
  uint64_t v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16, v14, commandMappings);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend((id)objc_msgSend(v10, "objectForKey:", @"Mapping CoreRCCommand", v15), "integerValue");
        if (gLogCategory_CoreRCDevice <= 10
          && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
        {
          uint64_t v15 = v11;
          LogPrintF();
        }
        if (v11 == a3)
        {
          long long v12 = (void *)[v10 objectForKey:@"Mapping IRCommand"];
          if (gLogCategory_CoreRCDevice <= 10
            && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          return v12;
        }
      }
      uint64_t v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  return 0;
}

- (BOOL)setInfraredCommand:(id)a3 forCommand:(unint64_t)a4 error:(id *)a5
{
  if (gLogCategory_CoreRCDevice <= 50 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    id v15 = a3;
    unint64_t v16 = a4;
    LogPrintF();
  }
  uint64_t v9 = -6705;
  if (!a4 || !a3) {
    goto LABEL_12;
  }
  uint64_t v10 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", a3, @"Mapping IRCommand", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", a4, -6705), @"Mapping CoreRCCommand", 0);
  if (!v10)
  {
    uint64_t v9 = -6728;
LABEL_12:
    uint64_t v13 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", *MEMORY[0x263F08410], v9, 0, v15, v16);
    if (!a5) {
      return 0;
    }
    uint64_t v14 = (void *)v13;
    BOOL result = 0;
    *a5 = v14;
    return result;
  }
  uint64_t v11 = v10;
  [(CoreIRDeviceProvider *)self _removeMappingForCommand:a4];
  if (a4 == 46)
  {
    [(CoreIRDeviceProvider *)self _removeMappingForCommand:67];
    [(CoreIRDeviceProvider *)self _removeMappingForCommand:47];
  }
  [(NSMutableSet *)self->_commandMappings addObject:v11];
  return 1;
}

- (void)_removeMappingForCommand:(unint64_t)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a3)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    commandMappings = self->_commandMappings;
    uint64_t v6 = [(NSMutableSet *)commandMappings countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(commandMappings);
          }
          uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", @"Mapping CoreRCCommand"), "unsignedIntegerValue") == a3)
          {
            [(NSMutableSet *)self->_commandMappings removeObject:v10];
            return;
          }
        }
        uint64_t v7 = [(NSMutableSet *)commandMappings countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
  }
}

- (BOOL)sendHIDEvent:(id)a3 target:(id)a4 error:(id *)a5
{
  uint64_t v16 = 0;
  char v15 = 0;
  uint64_t v14 = 0;
  if (gLogCategory_CoreRCDevice <= 90 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if ([a3 isRepeat])
  {
    uint64_t v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v11 = *MEMORY[0x263F08410];
    uint64_t v12 = -6705;
  }
  else
  {
    [a3 getCommand:&v14 pressed:&v15];
    if (v14)
    {
      BOOL result = [(CoreIRDeviceProvider *)self sendCommand:v14 target:a4 withDuration:0 error:&v16];
      if (!a5) {
        return result;
      }
      goto LABEL_8;
    }
    uint64_t v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v11 = *MEMORY[0x263F08410];
    uint64_t v12 = -6735;
  }
  uint64_t v13 = [v10 errorWithDomain:v11 code:v12 userInfo:0];
  BOOL result = 0;
  uint64_t v16 = (void *)v13;
  if (!a5) {
    return result;
  }
LABEL_8:
  if (!result) {
    *a5 = v16;
  }
  return result;
}

- (BOOL)sendCommand:(unint64_t)a3 target:(id)a4 withDuration:(unint64_t)a5 error:(id *)a6
{
  uint64_t v13 = 0;
  if (!a4 || (objc_opt_class(), (objc_opt_isKindOfClass())) && a3)
  {
    BOOL result = objc_msgSend(-[CoreIRDeviceProvider interface](self, "interface"), "transmitCommand:pressDuration:error:", objc_msgSend(a4, "infraredCommandForCommand:", a3), &v13, (double)a5 / 1000000.0);
    if (!a6) {
      return result;
    }
  }
  else
  {
    uint64_t v12 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6705 userInfo:0];
    BOOL result = 0;
    uint64_t v13 = (void *)v12;
    if (!a6) {
      return result;
    }
  }
  if (!result) {
    *a6 = v13;
  }
  return result;
}

- (BOOL)sendCommand:(id)a3 error:(id *)a4
{
  uint64_t v7 = 0;
  if (a3)
  {
    BOOL result = objc_msgSend(-[CoreIRDeviceProvider interface](self, "interface"), "transmitCommand:pressDuration:error:", a3, &v7, 0.0);
    if (!a4) {
      return result;
    }
  }
  else
  {
    uint64_t v6 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6705 userInfo:0];
    BOOL result = 0;
    uint64_t v7 = (void *)v6;
    if (!a4) {
      return result;
    }
  }
  if (!result) {
    *a4 = v7;
  }
  return result;
}

- (BOOL)clearAllStoredCommands:(id *)a3
{
  id v4 = [(CoreIRDeviceProvider *)self interface];
  return [v4 clearAllStoredCommands:a3];
}

- (BOOL)setCommand:(unint64_t)a3 target:(id)a4 forButtonCombination:(id)a5 delay:(double)a6 error:(id *)a7
{
  long long v17 = 0;
  if (!a3)
  {
    id v13 = [(CoreIRDeviceProvider *)self interface];
    uint64_t v14 = 0;
LABEL_5:
    BOOL result = [v13 setCommand:v14 forButtonCombination:a5 delay:&v17 error:a6];
    if (!a7) {
      return result;
    }
    goto LABEL_6;
  }
  uint64_t v11 = objc_msgSend(a4, "infraredCommandForCommand:");
  if (v11)
  {
    uint64_t v12 = v11;
    id v13 = [(CoreIRDeviceProvider *)self interface];
    uint64_t v14 = v12;
    goto LABEL_5;
  }
  uint64_t v16 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6707 userInfo:0];
  BOOL result = 0;
  long long v17 = (void *)v16;
  if (!a7) {
    return result;
  }
LABEL_6:
  if (!result) {
    *a7 = v17;
  }
  return result;
}

- (BOOL)enableButtonCombination:(id)a3 delay:(double)a4 error:(id *)a5
{
  id v8 = [(CoreIRDeviceProvider *)self interface];
  return [v8 enableButtonCombination:a3 delay:a5 error:a4];
}

- (BOOL)disableButtonCombination:(id)a3 delay:(double)a4 error:(id *)a5
{
  id v8 = [(CoreIRDeviceProvider *)self interface];
  return [v8 disableButtonCombination:a3 delay:a5 error:a4];
}

- (id)startLearningSessionWithReason:(unint64_t)a3 error:(id *)a4
{
  uint64_t v6 = [[CoreIRLearningSessionProvider alloc] initWithReason:a3];
  if (v6)
  {
    -[CoreIRLearningSessionProvider scheduleWithDispatchQueue:](v6, "scheduleWithDispatchQueue:", objc_msgSend(-[CoreRCDevice bus](self, "bus"), "serialQueue"));
    [(CoreIRDevice *)self setLearningSession:v6];
  }
  else
  {
    [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6729 userInfo:0];
    if (a4) {
      *a4 = 0;
    }
  }
  return v6;
}

- (BOOL)setMappingWithSession:(id)a3 error:(id *)a4
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3052000000;
  uint64_t v16 = __Block_byref_object_copy__3;
  long long v17 = __Block_byref_object_dispose__3;
  uint64_t v18 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __52__CoreIRDeviceProvider_setMappingWithSession_error___block_invoke;
  v8[3] = &unk_2652E4060;
  v8[4] = self;
  v8[5] = &v13;
  v8[6] = &v9;
  [a3 enumerateMappingUsingBlock:v8];
  if (!*((unsigned char *)v10 + 24) && !v14[5])
  {
    uint64_t v5 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6705 userInfo:0];
    v14[5] = v5;
  }
  if (a4) {
    *a4 = (id)v14[5];
  }
  char v6 = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
  return v6;
}

uint64_t __52__CoreIRDeviceProvider_setMappingWithSession_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t result = [*(id *)(a1 + 32) _setInfraredCommandPattern:a3 repeatPattern:a4 forCommand:a2];
  if (result)
  {
    uint64_t result = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:(int)result userInfo:0];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    *a5 = 1;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  return result;
}

- (BOOL)updateMappingWithSession:(id)a3 error:(id *)a4
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v10 = -6705;
LABEL_10:
    uint64_t v7 = (void *)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:v10 userInfo:0];
LABEL_11:
    BOOL v8 = 0;
    if (!a4) {
      return v8;
    }
    goto LABEL_5;
  }
  if (![(CoreIRDeviceProvider *)self setMappingWithSession:a3 error:a4])
  {
    uint64_t v7 = 0;
    goto LABEL_11;
  }
  if ((objc_msgSend(-[CoreRCDevice bus](self, "bus"), "mergePersistentMappingsFromSession:ofDevice:", a3, self) & 1) == 0)
  {
    uint64_t v10 = -6747;
    goto LABEL_10;
  }
  uint64_t v7 = 0;
  BOOL v8 = 1;
  if (a4) {
LABEL_5:
  }
    *a4 = v7;
  return v8;
}

- ($E9D0CE23C4879AFD1046A22AEC3FB8EC)_findButtonWithCommand:(unint64_t)a3
{
  if (!a3) {
    return 0;
  }
  unint64_t buttonCount = self->_buttonCount;
  if (!buttonCount) {
    return 0;
  }
  for (uint64_t result = ($E9D0CE23C4879AFD1046A22AEC3FB8EC *)self->_buttonArray; result->var5 != a3; ++result)
  {
    if (!--buttonCount) {
      return 0;
    }
  }
  return result;
}

- (int)_setInfraredCommandPattern:(id)a3 repeatPattern:(id)a4 forCommand:(unint64_t)a5
{
  int result = -6705;
  if (!a4 || !a3 || !a5) {
    return result;
  }
  if (![a3 sequenceCount] || !objc_msgSend(a4, "sequenceCount")) {
    return -6705;
  }
  if (a5 == 46)
  {
    uint64_t v10 = [(CoreIRDeviceProvider *)self _findButtonWithCommand:67];
    if (v10 || (uint64_t v10 = [(CoreIRDeviceProvider *)self _findButtonWithCommand:47]) != 0)
    {
      int v11 = 0;
      v10->var5 = 46;
      goto LABEL_14;
    }
  }
  else
  {
    char v12 = [(CoreIRDeviceProvider *)self _findButtonWithCommand:a5];
    if (v12)
    {
      uint64_t v10 = v12;
      int v11 = 0;
      goto LABEL_14;
    }
  }
  unint64_t buttonCount = self->_buttonCount;
  if (buttonCount > 0x11) {
    return -6710;
  }
  uint64_t v10 = ($E9D0CE23C4879AFD1046A22AEC3FB8EC *)&self->_buttonArray[buttonCount];
  v10->var5 = a5;
  int v11 = 1;
LABEL_14:
  uint64_t v14 = malloc_type_malloc(8 * [a3 sequenceCount], 0x100004000313F17uLL);
  if (!v14) {
    return -6729;
  }
  uint64_t v15 = v14;
  if ([a3 sequenceCount])
  {
    unint64_t v16 = 0;
    do
    {
      v15[v16] = *(void *)([a3 sequence] + 8 * v16);
      ++v16;
    }
    while (v16 < [a3 sequenceCount]);
  }
  long long v17 = (unint64_t *)malloc_type_malloc(8 * [a4 sequenceCount], 0x100004000313F17uLL);
  if (!v17)
  {
    free(v15);
    return -6729;
  }
  uint64_t v18 = v17;
  if ([a4 sequenceCount])
  {
    unint64_t v19 = 0;
    do
    {
      v18[v19] = *(void *)([a4 sequence] + 8 * v19);
      ++v19;
    }
    while (v19 < [a4 sequenceCount]);
  }
  if ([(CoreIRDeviceProvider *)self setInfraredCommand:a3 forCommand:v10->var5 error:0])
  {
    var1 = v10->var1;
    if (var1) {
      free(var1);
    }
    var3 = v10->var3;
    if (var3) {
      free(var3);
    }
    v10->var1 = v15;
    v10->var3 = v18;
    v10->var2 = [a3 sequenceCount];
    uint64_t v22 = [a4 sequenceCount];
    int result = 0;
    v10->var4 = v22;
    v10->var0 = 0;
    if (v11)
    {
      int result = 0;
      ++self->_buttonCount;
    }
  }
  else
  {
    free(v15);
    free(v18);
    return -6728;
  }
  return result;
}

- (void)handleIRCommand:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = [(CoreIRDeviceProvider *)self busProvider];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_9;
  }
  if ([a3 isRepeat])
  {
    if ([v5 lastAppleRemote]) {
      objc_msgSend((id)objc_msgSend(v5, "lastAppleRemote"), "dispatchEventsForCommand:toDevice:", a3, self);
    }
  }
  else
  {
    char v6 = objc_msgSend(v5, "appleIRDeviceWithUID:create:", objc_msgSend(a3, "deviceUID"), 1);
    if (!v6) {
      return;
    }
    uint64_t v7 = v6;
    if ([v6 dispatchEventsForCommand:a3 toDevice:self]) {
      [v5 didDispatchCommandFromAppleRemote:v7];
    }
  }
  if ([a3 isRepeat])
  {
LABEL_9:
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    BOOL v8 = (void *)[v5 thirdPartyRemotes];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
LABEL_11:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v15 + 1) + 8 * v12);
        if (gLogCategory_CoreRCBus <= 10 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
        {
          uint64_t v14 = v13;
          LogPrintF();
        }
        if (objc_msgSend(v13, "dispatchEventsForCommand:toDevice:", a3, self, v14)) {
          break;
        }
        if (v10 == ++v12)
        {
          uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
          if (v10) {
            goto LABEL_11;
          }
          goto LABEL_21;
        }
      }
    }
    else
    {
LABEL_21:
      objc_msgSend(-[CoreIRDeviceProvider learningSessionProvider](self, "learningSessionProvider"), "processIRCommand:", a3);
    }
  }
}

- (BOOL)dispatchEventsForCommand:(id)a3 toDevice:(id)a4
{
  unint64_t v7 = [a3 timestamp];
  if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    uint64_t v28 = [a3 payload];
    LogPrintF();
  }
  if (objc_msgSend(a4, "learningSessionProvider", v28)) {
    unint64_t v38 = objc_msgSend((id)objc_msgSend(a4, "learningSessionProvider"), "currentCommand");
  }
  else {
    unint64_t v38 = 0;
  }
  unint64_t buttonCount = self->_buttonCount;
  if ([a3 isRepeat] && v7 - self->_lastCommandTimestamp > _maxRepeatIntervalTicks_0)
  {
    if (gLogCategory_CoreRCDevice <= 50 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    if (!buttonCount) {
      goto LABEL_48;
    }
    buttonArray = self->_buttonArray;
    unint64_t v10 = buttonCount;
    do
    {
      buttonArray->matchIndex = 0;
      ++buttonArray;
      --v10;
    }
    while (v10);
  }
  if (buttonCount)
  {
    id v36 = a4;
    SEL v35 = a2;
    unint64_t v37 = v7;
    uint64_t v11 = 0;
    unint64_t v12 = 104;
    BOOL v13 = 1;
    while (1)
    {
      uint64_t v14 = (_DWORD *)((char *)self + v12);
      lastButtonPressed = (CoreIRDeviceProvider *)self->_lastButtonPressed;
      BOOL v16 = (CoreIRDeviceProvider *)((char *)self + v12) == lastButtonPressed;
      if ((CoreIRDeviceProvider *)((char *)self + v12) == lastButtonPressed) {
        long long v17 = &self->super.super._isLocalDevice + v12;
      }
      else {
        long long v17 = (BOOL *)&self->super.super._manager + v12;
      }
      uint64_t v18 = 2;
      if (v16) {
        uint64_t v18 = 6;
      }
      uint64_t v19 = *(void *)&v14[v18];
      unint64_t v20 = *(void *)v17;
      if (v19)
      {
        if (!v20) {
          goto LABEL_47;
        }
      }
      else
      {
        objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", v35, self, @"CoreIRDeviceProvider.m", 776, @"patternPtr must never be null; index %zu",
          v11);
        if (!v20)
        {
LABEL_47:
          v25 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", v29, v30, v31, v32, v33, v34);
          uint64_t v29 = v11;
          [v25 handleFailureInMethod:v35 object:self file:@"CoreIRDeviceProvider.m" lineNumber:777 description:@"patternCount must never be zero; index %zu"];
        }
      }
      if (gLogCategory_CoreRCDevice <= 10
        && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
      {
        uint64_t v33 = v20;
        uint64_t v34 = *(void *)(v19 + 8 * *v14);
        BOOL v31 = self->_lastButtonPressed != 0;
        uint64_t v32 = *v14;
        uint64_t v29 = v11;
        unint64_t v30 = buttonCount;
        LogPrintF();
      }
      unint64_t v21 = *v14;
      if (v20 > v21 && (uint64_t v22 = *(void *)(v19 + 8 * v21), v22 == [a3 payload]))
      {
        if (gLogCategory_CoreRCDevice <= 10
          && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
        {
          uint64_t v29 = *v14;
          LogPrintF();
        }
        uint64_t v23 = (*v14 + 1);
        *uint64_t v14 = v23;
        if (v20 == v23)
        {
          *uint64_t v14 = 0;
          if (!v38
            || (CoreRCCommandIsBasicButton(v38) & 1) == 0
            && ((v24 = (char *)self + v12, CoreRCCommandIsMenuButton((uint64_t)(&self->super.super._uniqueID)[v12 / 8]))
             || CoreRCCommandIsLeftButton(*((void *)v24 + 5))
             || CoreRCCommandIsRightButton(*((void *)v24 + 5))))
          {
            v26 = (char *)self + v12;
            unint64_t v7 = v37;
            -[CoreIRDeviceProvider dispatchEventForCommand:matchingButton:timestamp:toDevice:](self, "dispatchEventForCommand:matchingButton:timestamp:toDevice:", a3, v26, v37, v36, v29);
            goto LABEL_50;
          }
        }
      }
      else
      {
        *uint64_t v14 = 0;
      }
      BOOL v13 = ++v11 < buttonCount;
      v12 += 48;
      if (buttonCount == v11)
      {
        BOOL v13 = 0;
        unint64_t v7 = v37;
        goto LABEL_50;
      }
    }
  }
LABEL_48:
  BOOL v13 = 0;
LABEL_50:
  if (gLogCategory_CoreRCDevice <= 20 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  self->_lastCommandTimestamp = v7;
  return v13;
}

- (unint64_t)findDuplicateIRCommand:(id)a3 forCommand:(unint64_t)a4 device:(id *)a5
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  if (!a5) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreIRDeviceProvider.m", 820, @"CoreIRDeviceProvider** parameter not supplied, aborting.");
  }
  if ([(CoreRCDevice *)self isLocalDevice])
  {
    long long v33 = 0uLL;
    long long v34 = 0uLL;
    long long v31 = 0uLL;
    long long v32 = 0uLL;
    uint64_t v9 = objc_msgSend(-[CoreIRDeviceProvider busProvider](self, "busProvider"), "devices");
    uint64_t v10 = [v9 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v32;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v32 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          if (([v14 isLocalDevice] & 1) == 0 && (objc_msgSend(v14, "isReceiver") & 1) == 0)
          {
            unint64_t v15 = [v14 findDuplicateIRCommand:a3 forCommand:a4 device:a5];
            if (v15) {
              return v15;
            }
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v31 objects:v36 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    return 0;
  }
  long long v29 = 0uLL;
  long long v30 = 0uLL;
  long long v27 = 0uLL;
  long long v28 = 0uLL;
  commandMappings = self->_commandMappings;
  uint64_t v17 = [(NSMutableSet *)commandMappings countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (!v17) {
    return 0;
  }
  uint64_t v18 = v17;
  v25 = self;
  v26 = a5;
  uint64_t v19 = *(void *)v28;
  while (2)
  {
    for (uint64_t j = 0; j != v18; ++j)
    {
      if (*(void *)v28 != v19) {
        objc_enumerationMutation(commandMappings);
      }
      unint64_t v21 = *(void **)(*((void *)&v27 + 1) + 8 * j);
      unint64_t v22 = objc_msgSend((id)objc_msgSend(v21, "objectForKeyedSubscript:", @"Mapping CoreRCCommand", v25, v26), "unsignedIntegerValue");
      uint64_t v23 = [v21 objectForKeyedSubscript:@"Mapping IRCommand"];
      if (v22 != a4 && ([a3 isEqual:v23] & 1) != 0)
      {
        id *v26 = v25;
        return v22;
      }
    }
    uint64_t v18 = [(NSMutableSet *)commandMappings countByEnumeratingWithState:&v27 objects:v35 count:16];
    unint64_t v22 = 0;
    if (v18) {
      continue;
    }
    break;
  }
  return v22;
}

- (void)synthesizeButtonReleaseWithTimestamp:(unint64_t)a3
{
  lastButtonPressed = self->_lastButtonPressed;
  if (lastButtonPressed)
  {
    if (gLogCategory_CoreRCDevice <= 40)
    {
      if (gLogCategory_CoreRCDevice != -1
        || (int v6 = _LogCategory_Initialize(), lastButtonPressed = self->_lastButtonPressed, v6))
      {
        unint64_t var5 = lastButtonPressed->var5;
        BOOL v8 = CoreRCCommandString(var5);
        LogPrintF();
        lastButtonPressed = self->_lastButtonPressed;
      }
    }
    -[CoreIRDeviceProvider dispatchButtonEventWithCommand:pressed:timestamp:toDevice:](self, "dispatchButtonEventWithCommand:pressed:timestamp:toDevice:", lastButtonPressed->var5, 0, a3, objc_msgSend(-[CoreIRDeviceProvider busProvider](self, "busProvider", var5, v8), "localDevice"));
    self->_lastButtonPressed = 0;
  }
  else if (gLogCategory_CoreRCDevice <= 90 {
         && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

- (void)schedulePressAndHoldTimer
{
  unint64_t pressAndHoldTimeoutGenerationCount = self->_pressAndHoldTimeoutGenerationCount;
  dispatch_time_t v4 = dispatch_time(0, 140000000);
  id v5 = objc_msgSend(-[CoreRCDevice bus](self, "bus"), "serialQueue");
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__CoreIRDeviceProvider_schedulePressAndHoldTimer__block_invoke;
  v6[3] = &unk_2652E3610;
  v6[4] = self;
  v6[5] = pressAndHoldTimeoutGenerationCount;
  dispatch_after(v4, v5, v6);
}

uint64_t __49__CoreIRDeviceProvider_schedulePressAndHoldTimer__block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  if (gLogCategory_CoreRCDevice <= 10)
  {
    if (gLogCategory_CoreRCDevice != -1 || (int result = _LogCategory_Initialize(), result)) {
      int result = LogPrintF();
    }
  }
  uint64_t v3 = v1 + 32;
  id v2 = *(void **)(v1 + 32);
  if (*(void *)(v3 + 8) == v2[124])
  {
    uint64_t v4 = mach_absolute_time();
    return [v2 synthesizeButtonReleaseWithTimestamp:v4];
  }
  return result;
}

- (void)cancelPressAndHoldTimer
{
}

- (BOOL)dispatchEventForCommand:(id)a3 matchingButton:(id *)a4 timestamp:(unint64_t)a5 toDevice:(id)a6
{
  [(CoreIRDeviceProvider *)self cancelPressAndHoldTimer];
  unint64_t var5 = a4->var5;
  if (!var5)
  {
    if (gLogCategory_CoreRCDevice > 90 || gLogCategory_CoreRCDevice == -1 && !_LogCategory_Initialize()) {
      return 0;
    }
    goto LABEL_23;
  }
  if (gLogCategory_CoreRCDevice <= 10)
  {
    if (gLogCategory_CoreRCDevice != -1)
    {
LABEL_4:
      unint64_t v14 = var5;
      LogPrintF();
      goto LABEL_6;
    }
    if (_LogCategory_Initialize())
    {
      unint64_t var5 = a4->var5;
      goto LABEL_4;
    }
  }
LABEL_6:
  lastButtonPressed = self->_lastButtonPressed;
  if (!lastButtonPressed)
  {
LABEL_9:
    if (gLogCategory_CoreRCDevice <= 40 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
    {
      unint64_t v14 = a4->var5;
      unint64_t v15 = CoreRCCommandString(v14);
      LogPrintF();
    }
    if (-[CoreIRDeviceProvider dispatchButtonEventWithCommand:pressed:timestamp:toDevice:](self, "dispatchButtonEventWithCommand:pressed:timestamp:toDevice:", a4->var5, 1, a5, a6, v14, v15))
    {
      self->_lastButtonPressed = a4;
      BOOL v12 = 1;
      goto LABEL_16;
    }
    if (gLogCategory_CoreRCDevice > 90 || gLogCategory_CoreRCDevice == -1 && !_LogCategory_Initialize()) {
      return 0;
    }
LABEL_23:
    LogPrintF();
    return 0;
  }
  if (lastButtonPressed != a4)
  {
    [(CoreIRDeviceProvider *)self synthesizeButtonReleaseWithTimestamp:a5];
    goto LABEL_9;
  }
  BOOL v12 = 0;
LABEL_16:
  [(CoreIRDeviceProvider *)self schedulePressAndHoldTimer];
  return v12;
}

- (BOOL)dispatchButtonEventWithCommand:(unint64_t)a3 pressed:(BOOL)a4 timestamp:(unint64_t)a5 toDevice:(id)a6
{
  BOOL v8 = [[CoreRCHIDEvent alloc] initWithCommand:a3 pressed:a4 timestamp:a5];
  if (v8)
  {
    [a6 receivedHIDEvent:v8 fromDevice:self];
  }
  else if (gLogCategory_CoreRCDevice <= 90 {
         && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
  return v8 != 0;
}

- (NSDictionary)matchingDict
{
  return self->_matchingDict;
}

- (void)setMatchingDict:(id)a3
{
}

@end