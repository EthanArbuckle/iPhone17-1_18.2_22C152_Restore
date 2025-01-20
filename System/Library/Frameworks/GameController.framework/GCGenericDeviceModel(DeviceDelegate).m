@interface GCGenericDeviceModel(DeviceDelegate)
+ (__CFString)defaultSymbolNameForElement:()DeviceDelegate;
+ (id)defaultLocalizedNameForElement:()DeviceDelegate;
+ (uint64_t)elementsMakeValidExtendedGamepad:()DeviceDelegate;
+ (uint64_t)elementsMakeValidGamepad:()DeviceDelegate;
- (GCHapticCapabilityGraph)physicalDeviceGetHapticCapabilityGraph:()DeviceDelegate;
- (_GCControllerInputComponentDescription)logicalDevice:()DeviceDelegate makeControllerInputDescriptionWithIdentifier:bindings:;
- (id)logicalDevice:()DeviceDelegate makeControllerPhysicalInputProfileDescriptionWithIdentifier:bindings:;
- (id)physicalDeviceGetHapticCapabilities:()DeviceDelegate;
- (id)respondsToSelector:()DeviceDelegate;
- (uint64_t)logicalDevice:()DeviceDelegate makeControllerPhysicalInputProfileWithIdentifier:;
- (uint64_t)logicalDeviceControllerDescriptionClass:()DeviceDelegate;
- (uint64_t)logicalDeviceControllerIsAttachedToHost:()DeviceDelegate;
@end

@implementation GCGenericDeviceModel(DeviceDelegate)

- (id)physicalDeviceGetHapticCapabilities:()DeviceDelegate
{
  v1 = [a1 driver];
  v2 = [v1 rumble];

  if (v2)
  {
    v3 = [v2 actuators];
    v4 = objc_msgSend(v3, "gc_arrayByTransformingElementsWithOptions:usingBlock:", 0, &__block_literal_global_39);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (GCHapticCapabilityGraph)physicalDeviceGetHapticCapabilityGraph:()DeviceDelegate
{
  id v4 = a3;
  v5 = [a1 physicalDeviceGetHapticCapabilities:v4];
  v6 = [GCHapticCapabilityGraph alloc];
  v7 = [a1 driver];
  v8 = [v7 rumble];
  v9 = [v8 nodes];
  v10 = [(GCHapticCapabilityGraph *)v6 initWithActuators:v5 nodes:v9];

  return v10;
}

- (uint64_t)logicalDeviceControllerDescriptionClass:()DeviceDelegate
{
  return objc_opt_class();
}

- (uint64_t)logicalDeviceControllerIsAttachedToHost:()DeviceDelegate
{
  v1 = [a1 isFormFitting];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (id)logicalDevice:()DeviceDelegate makeControllerPhysicalInputProfileDescriptionWithIdentifier:bindings:
{
  id v7 = a4;
  id v8 = a5;
  v9 = [a1 physicalInput];
  if (!v9)
  {
    v33 = 0;
    goto LABEL_34;
  }
  id v38 = v8;
  id v39 = v7;
  id v37 = v9;
  v10 = [v9 elements];
  v41 = objc_opt_new();
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id obj = v10;
  uint64_t v43 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (!v43) {
    goto LABEL_29;
  }
  uint64_t v42 = *(void *)v45;
  do
  {
    uint64_t v11 = 0;
    do
    {
      if (*(void *)v45 != v42) {
        objc_enumerationMutation(obj);
      }
      v12 = *(void **)(*((void *)&v44 + 1) + 8 * v11);
      v13 = [v12 names];
      v14 = [v13 firstObject];
      v15 = +[NSSet setWithArray:v13];
      v16 = objc_msgSend(v15, "gc_setByRemovingObject:", v14);

      v17 = [v12 localizedNameKey];
      v18 = v17;
      if (v17)
      {
        id v19 = v17;
      }
      else
      {
        id v19 = [(id)objc_opt_class() defaultLocalizedNameForElement:v14];
      }
      v20 = v19;

      v21 = [v12 symbolName];
      v22 = v21;
      if (v21)
      {
        id v23 = v21;
      }
      else
      {
        id v23 = [(id)objc_opt_class() defaultSymbolNameForElement:v14];
      }
      v24 = v23;

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (([v14 isEqualToString:@"Button Home"] & 1) != 0
          || ([v14 isEqualToString:@"Button Options"] & 1) != 0)
        {
          uint64_t v25 = 49152;
        }
        else if ([v14 isEqualToString:@"Button Menu"])
        {
          uint64_t v25 = 0x4000;
        }
        else if ([v14 isEqualToString:@"Button Share"])
        {
          uint64_t v25 = 0x4000;
        }
        else
        {
          uint64_t v25 = 2;
        }
        v26 = [v12 isAnalog];
        int v27 = [v26 BOOLValue];

        v28 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:]([GCDeviceButtonInputDescription alloc], "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", v14, v16, v25, v20, v24, v27 ^ 1u, [v12 sourceExtendedEventFieldIndex]);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_21;
        }
        v29 = [v12 isAnalog];
        int v30 = [v29 BOOLValue];

        v28 = -[GCDeviceDirectionPadDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceUpExtendedEventField:sourceDownExtendedEventField:sourceLeftExtendedEventField:sourceRightExtendedEventField:]([GCDeviceDirectionPadDescription alloc], "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceUpExtendedEventField:sourceDownExtendedEventField:sourceLeftExtendedEventField:sourceRightExtendedEventField:", v14, v16, 2, v20, v24, v30 ^ 1u, [v12 sourceUpExtendedEventFieldIndex], objc_msgSend(v12, "sourceDownExtendedEventFieldIndex"), objc_msgSend(v12, "sourceLeftExtendedEventFieldIndex"), objc_msgSend(v12, "sourceRightExtendedEventFieldIndex"));
      }
      v31 = v28;
      [v41 addObject:v28];

LABEL_21:
      ++v11;
    }
    while (v43 != v11);
    uint64_t v32 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
    uint64_t v43 = v32;
  }
  while (v32);
LABEL_29:

  if (([(id)objc_opt_class() elementsMakeValidExtendedGamepad:v41] & 1) == 0) {
    [(id)objc_opt_class() elementsMakeValidGamepad:v41];
  }
  id v8 = v38;
  id v7 = v39;
  id v34 = objc_alloc((Class)objc_opt_class());
  v35 = [v41 allObjects];
  v33 = (void *)[v34 initWithIdentifier:v39 elements:v35 bindings:v38];

  v9 = v37;
LABEL_34:

  return v33;
}

- (_GCControllerInputComponentDescription)logicalDevice:()DeviceDelegate makeControllerInputDescriptionWithIdentifier:bindings:
{
  id v7 = a4;
  id v8 = a5;
  v9 = [a1 physicalInput];
  if (v9)
  {
    id v40 = v8;
    id v41 = v7;
    id v39 = v9;
    v10 = [v9 elements];
    uint64_t v11 = objc_opt_new();
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id obj = v10;
    uint64_t v12 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
    if (!v12) {
      goto LABEL_20;
    }
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v44;
    while (1)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v44 != v14) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v17 = v16;
          v18 = objc_opt_new();
          id v19 = [v17 identifier];
          [v18 setIdentifier:v19];

          v20 = [v17 names];
          v21 = +[NSSet setWithArray:v20];
          [v18 setAliases:v21];

          v22 = [v17 localizedNameKey];
          [v18 setLocalizedName:v22];

          id v23 = [v17 symbolName];
          if (v23)
          {
            v24 = [v17 symbolName];
            uint64_t v25 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", v24);
            [v18 setSymbol:v25];
          }
          else
          {
            [v18 setSymbol:0];
          }

          id v34 = [v17 isAnalog];
          objc_msgSend(v18, "setAnalog:", objc_msgSend(v34, "BOOLValue"));

          objc_msgSend(v18, "setEventPressedValueField:", objc_msgSend(v17, "sourceExtendedEventFieldIndex"));
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
          id v26 = v16;
          v18 = objc_opt_new();
          int v27 = [v26 identifier];
          [v18 setIdentifier:v27];

          v28 = [v26 names];
          v29 = +[NSSet setWithArray:v28];
          [v18 setAliases:v29];

          int v30 = [v26 localizedNameKey];
          [v18 setLocalizedName:v30];

          v31 = [v26 symbolName];
          if (v31)
          {
            uint64_t v32 = [v26 symbolName];
            v33 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", v32);
            [v18 setSymbol:v33];
          }
          else
          {
            [v18 setSymbol:0];
          }

          v35 = [v26 isAnalog];
          objc_msgSend(v18, "setAnalog:", objc_msgSend(v35, "BOOLValue"));

          objc_msgSend(v18, "setEventUpValueField:", objc_msgSend(v26, "sourceUpExtendedEventFieldIndex"));
          objc_msgSend(v18, "setEventRightValueField:", objc_msgSend(v26, "sourceRightExtendedEventFieldIndex"));
          objc_msgSend(v18, "setEventDownValueField:", objc_msgSend(v26, "sourceDownExtendedEventFieldIndex"));
          objc_msgSend(v18, "setEventLeftValueField:", objc_msgSend(v26, "sourceLeftExtendedEventFieldIndex"));
        }
        [v11 addObject:v18];
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
      if (!v13)
      {
LABEL_20:

        v36 = objc_opt_new();
        [v36 setElements:v11];
        id v8 = v40;
        id v7 = v41;
        id v37 = [[_GCControllerInputComponentDescription alloc] initWithIdentifier:v41 controllerInputs:v36 bindings:v40];

        v9 = v39;
        goto LABEL_22;
      }
    }
  }
  id v37 = 0;
LABEL_22:

  return v37;
}

- (uint64_t)logicalDevice:()DeviceDelegate makeControllerPhysicalInputProfileWithIdentifier:
{
  return 0;
}

- (id)respondsToSelector:()DeviceDelegate
{
  if (sel_logicalDeviceControllerIsAttachedToHost_ == a3)
  {
    id v4 = [a1 isFormFitting];
    BOOL v3 = v4 != 0;
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&off_26D2B02D8;
    return objc_msgSendSuper2(&v6, sel_respondsToSelector_);
  }
  return (id)v3;
}

+ (uint64_t)elementsMakeValidExtendedGamepad:()DeviceDelegate
{
  id v3 = a3;
  id v4 = [v3 member:@"Button A"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v3 member:@"Button B"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v6 = [v3 member:@"Button X"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v7 = [v3 member:@"Button Y"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v8 = [v3 member:@"Direction Pad"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v9 = [v3 member:@"Left Thumbstick"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v10 = [v3 member:@"Right Thumbstick"];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v11 = [v3 member:@"Left Shoulder"];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v20 = v11;
                  uint64_t v12 = [v3 member:@"Right Shoulder"];
                  objc_opt_class();
                  v21 = (void *)v12;
                  if (objc_opt_isKindOfClass())
                  {
                    uint64_t v13 = [v3 member:@"Left Trigger"];
                    objc_opt_class();
                    id v19 = (void *)v13;
                    if (objc_opt_isKindOfClass())
                    {
                      uint64_t v14 = [v3 member:@"Right Trigger"];
                      objc_opt_class();
                      v18 = (void *)v14;
                      if (objc_opt_isKindOfClass())
                      {
                        v15 = objc_msgSend(v3, "member:", @"Button Menu", v14, v19);
                        objc_opt_class();
                        char isKindOfClass = objc_opt_isKindOfClass();
                      }
                      else
                      {
                        char isKindOfClass = 0;
                      }
                      uint64_t v11 = v20;
                    }
                    else
                    {
                      char isKindOfClass = 0;
                      uint64_t v11 = v20;
                    }
                  }
                  else
                  {
                    char isKindOfClass = 0;
                    uint64_t v11 = v20;
                  }
                }
                else
                {
                  char isKindOfClass = 0;
                }
              }
              else
              {
                char isKindOfClass = 0;
              }
            }
            else
            {
              char isKindOfClass = 0;
            }
          }
          else
          {
            char isKindOfClass = 0;
          }
        }
        else
        {
          char isKindOfClass = 0;
        }
      }
      else
      {
        char isKindOfClass = 0;
      }
    }
    else
    {
      char isKindOfClass = 0;
    }
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

+ (uint64_t)elementsMakeValidGamepad:()DeviceDelegate
{
  id v3 = a3;
  id v4 = [v3 member:@"Button A"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v3 member:@"Button B"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v6 = [v3 member:@"Button X"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v7 = [v3 member:@"Button Y"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v8 = [v3 member:@"Direction Pad"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v9 = [v3 member:@"Left Shoulder"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v10 = [v3 member:@"Right Shoulder"];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v11 = [v3 member:@"Button Menu"];
                objc_opt_class();
                char isKindOfClass = objc_opt_isKindOfClass();
              }
              else
              {
                char isKindOfClass = 0;
              }
            }
            else
            {
              char isKindOfClass = 0;
            }
          }
          else
          {
            char isKindOfClass = 0;
          }
        }
        else
        {
          char isKindOfClass = 0;
        }
      }
      else
      {
        char isKindOfClass = 0;
      }
    }
    else
    {
      char isKindOfClass = 0;
    }
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

+ (id)defaultLocalizedNameForElement:()DeviceDelegate
{
  id v3 = a3;
  if (([v3 isEqualToString:@"Button A"] & 1) != 0
    || ([v3 isEqualToString:@"Button B"] & 1) != 0
    || ([v3 isEqualToString:@"Button X"] & 1) != 0
    || ([v3 isEqualToString:@"Button Y"] & 1) != 0
    || ([v3 isEqualToString:@"Direction Pad"] & 1) != 0
    || ([v3 isEqualToString:@"Left Thumbstick"] & 1) != 0
    || ([v3 isEqualToString:@"Right Thumbstick"] & 1) != 0
    || ([v3 isEqualToString:@"Left Shoulder"] & 1) != 0
    || ([v3 isEqualToString:@"Right Shoulder"] & 1) != 0
    || ([v3 isEqualToString:@"Left Trigger"] & 1) != 0
    || ([v3 isEqualToString:@"Right Trigger"] & 1) != 0
    || ([v3 isEqualToString:@"Left Thumbstick Button"] & 1) != 0
    || ([v3 isEqualToString:@"Right Thumbstick Button"] & 1) != 0
    || ([v3 isEqualToString:@"Button Home"] & 1) != 0
    || ([v3 isEqualToString:@"Button Menu"] & 1) != 0
    || ([v3 isEqualToString:@"Button Options"] & 1) != 0
    || [v3 isEqualToString:@"Button Share"])
  {
    id v4 = _GCFConvertStringToLocalizedString();
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (__CFString)defaultSymbolNameForElement:()DeviceDelegate
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Button A"])
  {
    id v4 = @"a.circle";
  }
  else if ([v3 isEqualToString:@"Button B"])
  {
    id v4 = @"b.circle";
  }
  else if ([v3 isEqualToString:@"Button X"])
  {
    id v4 = @"y.circle";
  }
  else if ([v3 isEqualToString:@"Button Y"])
  {
    id v4 = @"x.circle";
  }
  else if ([v3 isEqualToString:@"Direction Pad"])
  {
    id v4 = @"dpad";
  }
  else if ([v3 isEqualToString:@"Left Thumbstick"])
  {
    id v4 = @"l.joystick";
  }
  else if ([v3 isEqualToString:@"Right Thumbstick"])
  {
    id v4 = @"r.joystick";
  }
  else if ([v3 isEqualToString:@"Left Shoulder"])
  {
    id v4 = @"l1.rectangle.roundedbottom";
  }
  else if ([v3 isEqualToString:@"Right Shoulder"])
  {
    id v4 = @"r1.rectangle.roundedbottom";
  }
  else if ([v3 isEqualToString:@"Left Trigger"])
  {
    id v4 = @"l2.rectangle.roundedtop";
  }
  else if ([v3 isEqualToString:@"Right Trigger"])
  {
    id v4 = @"r2.rectangle.roundedtop";
  }
  else if ([v3 isEqualToString:@"Left Thumbstick Button"])
  {
    id v4 = @"l.joystick.press.down";
  }
  else if ([v3 isEqualToString:@"Right Thumbstick Button"])
  {
    id v4 = @"r.joystick.press.down";
  }
  else if ([v3 isEqualToString:@"Button Home"])
  {
    id v4 = @"house.circle";
  }
  else if ([v3 isEqualToString:@"Button Menu"])
  {
    id v4 = @"line.horizontal.3.circle";
  }
  else if ([v3 isEqualToString:@"Button Options"])
  {
    id v4 = @"ellipsis.circle";
  }
  else if ([v3 isEqualToString:@"Button Share"])
  {
    id v4 = @"square.and.arrow.up";
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)physicalDeviceGetHapticCapabilityGraph:()DeviceDelegate .cold.1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_220998000, a2, OS_LOG_TYPE_FAULT, "Caught exception decoding GCHapticCapabilityGraph: %@", (uint8_t *)&v2, 0xCu);
}

@end