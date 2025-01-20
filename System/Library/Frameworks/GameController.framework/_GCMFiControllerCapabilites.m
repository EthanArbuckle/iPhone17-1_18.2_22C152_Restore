@interface _GCMFiControllerCapabilites
+ (BOOL)isServiceAuthenticated:(id)a3;
- (BOOL)isExtendedGamepad;
- (char)initWithGamepadElements:(void *)a3 keyboardElements:;
- (char)initWithServiceInfo:(char *)a1;
- (id)description;
- (uint64_t)a;
- (uint64_t)b;
- (uint64_t)dpad;
- (uint64_t)home;
- (uint64_t)isStandardGamepad;
- (uint64_t)l1;
- (uint64_t)l2;
- (uint64_t)l3;
- (uint64_t)l4;
- (uint64_t)leftThumbstick;
- (uint64_t)m1;
- (uint64_t)m2;
- (uint64_t)m3;
- (uint64_t)m4;
- (uint64_t)menu;
- (uint64_t)options;
- (uint64_t)r1;
- (uint64_t)r2;
- (uint64_t)r3;
- (uint64_t)r4;
- (uint64_t)record;
- (uint64_t)rightThumbstick;
- (uint64_t)snapshot;
- (uint64_t)x;
- (uint64_t)y;
@end

@implementation _GCMFiControllerCapabilites

+ (BOOL)isServiceAuthenticated:(id)a3
{
  id v3 = a3;
  v4 = [v3 numberPropertyForKey:@"Authenticated"];
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && ([v4 BOOLValue] & 1) != 0) {
    char v5 = 1;
  }
  else {
    char v5 = isDeviceParentAuthenticated((__IOHIDServiceClient *)[v3 service]);
  }

  return v5;
}

- (char)initWithGamepadElements:(void *)a3 keyboardElements:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v48.receiver = a1;
    v48.super_class = (Class)_GCMFiControllerCapabilites;
    a1 = (char *)objc_msgSendSuper2(&v48, sel_init);
    objc_opt_class();
    id v36 = v6;
    id v37 = v5;
    if (objc_opt_isKindOfClass())
    {
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id obj = v5;
      uint64_t v7 = [obj countByEnumeratingWithState:&v44 objects:v50 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v45;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v45 != v9) {
              objc_enumerationMutation(obj);
            }
            v11 = *(void **)(*((void *)&v44 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v12 = [v11 objectForKeyedSubscript:@"UsagePage"];
              v13 = [v11 objectForKeyedSubscript:@"Usage"];
              int v14 = [v12 unsignedShortValue];
              uint64_t v15 = [v13 unsignedShortValue];
              if (v14 == 1)
              {
                if (v15 > 0x35 || ((1 << v15) & 0x27000000000000) == 0)
                {
                  char v17 = v15 + 112;
                  if ((v15 - 144) < 4)
                  {
                    a1[20] |= 1 << v17;
                    a1[20] |= 16
                            * (__72___GCMFiControllerCapabilites_initWithGamepadElements_keyboardElements___block_invoke(v15, v11) << v17);
                  }
                }
                else
                {
                  a1[21] |= 1 << (v15 - 48);
                  a1[22] |= __72___GCMFiControllerCapabilites_initWithGamepadElements_keyboardElements___block_invoke(v15, v11) << (v15 - 48);
                }
              }
              else if (v14 == 9 && v15 <= 0x10)
              {
                *((_DWORD *)a1 + 3) |= 1 << (v15 - 1);
                *((_DWORD *)a1 + 4) |= __72___GCMFiControllerCapabilites_initWithGamepadElements_keyboardElements___block_invoke(v15, v11) << (v15 - 1);
              }
            }
          }
          uint64_t v8 = [obj countByEnumeratingWithState:&v44 objects:v50 count:16];
        }
        while (v8);
      }

      id v6 = v36;
      id v5 = v37;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v19 = v6;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v40 objects:v49 count:16];
      if (!v20) {
        goto LABEL_54;
      }
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v41;
      id obja = v19;
      while (1)
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v41 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = *(void **)(*((void *)&v40 + 1) + 8 * v23);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v25 = [v24 objectForKeyedSubscript:@"UsagePage"];
            v26 = [v24 objectForKeyedSubscript:@"Usage"];
            int v27 = [v25 unsignedShortValue];
            uint64_t v28 = [v26 unsignedShortValue];
            if (v27 != 12) {
              goto LABEL_49;
            }
            if ((int)v28 <= 515)
            {
              if (v28 != 101)
              {
                if (v28 != 178) {
                  goto LABEL_49;
                }
                char v29 = 127;
                char v30 = 0x80;
                char v31 = 64;
                goto LABEL_44;
              }
              char v29 = -3;
              char v30 = 2;
              char v31 = 1;
              v32 = a1 + 24;
            }
            else
            {
              switch(v28)
              {
                case 0x204:
                  char v29 = -9;
                  char v30 = 8;
                  char v31 = 4;
                  break;
                case 0x223:
                  char v29 = -3;
                  char v30 = 2;
                  char v31 = 1;
                  break;
                case 0x209:
                  char v29 = -33;
                  char v30 = 32;
                  char v31 = 16;
                  break;
                default:
LABEL_49:

                  goto LABEL_50;
              }
LABEL_44:
              v32 = a1 + 23;
            }
            *v32 |= v31;
            if (__72___GCMFiControllerCapabilites_initWithGamepadElements_keyboardElements___block_invoke(v28, v24)) {
              char v33 = v30;
            }
            else {
              char v33 = 0;
            }
            unsigned char *v32 = *v32 & v29 | v33;
            id v19 = obja;
            goto LABEL_49;
          }
LABEL_50:
          ++v23;
        }
        while (v21 != v23);
        uint64_t v34 = [v19 countByEnumeratingWithState:&v40 objects:v49 count:16];
        uint64_t v21 = v34;
        if (!v34)
        {
LABEL_54:

          id v6 = v36;
          id v5 = v37;
          break;
        }
      }
    }
  }

  return a1;
}

- (char)initWithServiceInfo:(char *)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    id v5 = [v3 numberPropertyForKey:@"PrimaryUsagePage"];
    uint64_t v6 = [v4 numberPropertyForKey:@"PrimaryUsage"];
    uint64_t v7 = (void *)v6;
    uint64_t v8 = 0;
    if (v5)
    {
      if (v6)
      {
        int v9 = [v5 unsignedShortValue];
        int v10 = [v7 unsignedShortValue];
        uint64_t v8 = 0;
        if (v9 == 1 && v10 == 5)
        {
          v11 = [v4 numberPropertyForKey:@"GameControllerType"];
          v12 = v11;
          if (v11) {
            int v13 = [v11 unsignedIntValue];
          }
          else {
            int v13 = -1;
          }
          *((_DWORD *)a1 + 2) = v13;
          int v14 = [v4 dictionaryPropertyForKey:@"GameControllerPointer"];
          uint64_t v15 = [v4 dictionaryPropertyForKey:@"Keyboard"];
          v16 = [v14 objectForKeyedSubscript:@"Elements"];
          char v17 = [v15 objectForKeyedSubscript:@"Elements"];
          a1 = -[_GCMFiControllerCapabilites initWithGamepadElements:keyboardElements:](a1, v16, v17);

          uint64_t v8 = a1;
        }
      }
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (BOOL)isExtendedGamepad
{
  if (!a1) {
    return 0;
  }
  if (*(_DWORD *)(a1 + 8) == 1 && (*(unsigned char *)(a1 + 23) & 1) != 0) {
    return 1;
  }
  if ((~*(unsigned __int8 *)(a1 + 20) & 0xF) != 0 || (~*(_DWORD *)(a1 + 12) & 0x3F) != 0) {
    return 0;
  }
  uint64_t v1 = 0;
  if ((*(unsigned char *)(a1 + 23) & 1) != 0 && (*(_DWORD *)(a1 + 12) & 0xC0) == 0xC0) {
    return (~*(unsigned __int8 *)(a1 + 21) & 0x27) == 0;
  }
  return v1;
}

- (uint64_t)home
{
  if (a1)
  {
    unsigned int v1 = *(unsigned __int8 *)(a1 + 23);
    int v2 = v1 & 1;
    int v3 = (v1 >> 1) & 1;
  }
  else
  {
    int v3 = 0;
    int v2 = 0;
  }
  return v2 | (v3 << 8);
}

- (uint64_t)isStandardGamepad
{
  if (result)
  {
    if ((~*(unsigned __int8 *)(result + 20) & 0xF) != 0 || (~*(_DWORD *)(result + 12) & 0x3F) != 0) {
      return 0;
    }
    else {
      return *(unsigned char *)(result + 23) & 1;
    }
  }
  return result;
}

- (uint64_t)l2
{
  if (a1)
  {
    int v1 = (*(unsigned __int8 *)(a1 + 12) >> 6) & 1;
    int v2 = (*(unsigned __int8 *)(a1 + 16) >> 6) & 1;
  }
  else
  {
    int v2 = 0;
    int v1 = 0;
  }
  return v1 | (v2 << 8);
}

- (uint64_t)r2
{
  if (a1)
  {
    int v1 = *(unsigned __int8 *)(a1 + 12) >> 7;
    int v2 = *(unsigned __int8 *)(a1 + 16) >> 7;
  }
  else
  {
    int v2 = 0;
    int v1 = 0;
  }
  return v1 | (v2 << 8);
}

- (uint64_t)leftThumbstick
{
  if (a1)
  {
    BOOL v1 = (~*(unsigned __int8 *)(a1 + 21) & 3) == 0;
    int v2 = (~*(unsigned __int8 *)(a1 + 22) & 3) == 0;
  }
  else
  {
    int v2 = 0;
    BOOL v1 = 0;
  }
  return v1 | (v2 << 8);
}

- (uint64_t)rightThumbstick
{
  if (a1)
  {
    BOOL v1 = (~*(unsigned __int8 *)(a1 + 21) & 0x24) == 0;
    int v2 = (~*(unsigned __int8 *)(a1 + 22) & 0x24) == 0;
  }
  else
  {
    int v2 = 0;
    BOOL v1 = 0;
  }
  return v1 | (v2 << 8);
}

- (uint64_t)dpad
{
  if (a1)
  {
    unsigned int v1 = *(unsigned __int8 *)(a1 + 20);
    BOOL v2 = (~v1 & 0xF) == 0;
    int v3 = v1 > 0xEF;
  }
  else
  {
    int v3 = 0;
    BOOL v2 = 0;
  }
  return v2 | (v3 << 8);
}

- (uint64_t)a
{
  if (a1)
  {
    int v1 = *(unsigned char *)(a1 + 12) & 1;
    int v2 = *(unsigned char *)(a1 + 16) & 1;
  }
  else
  {
    int v2 = 0;
    int v1 = 0;
  }
  return v1 | (v2 << 8);
}

- (uint64_t)b
{
  if (a1)
  {
    int v1 = (*(unsigned __int8 *)(a1 + 12) >> 1) & 1;
    int v2 = (*(unsigned __int8 *)(a1 + 16) >> 1) & 1;
  }
  else
  {
    int v2 = 0;
    int v1 = 0;
  }
  return v1 | (v2 << 8);
}

- (uint64_t)x
{
  if (a1)
  {
    int v1 = (*(unsigned __int8 *)(a1 + 12) >> 2) & 1;
    int v2 = (*(unsigned __int8 *)(a1 + 16) >> 2) & 1;
  }
  else
  {
    int v2 = 0;
    int v1 = 0;
  }
  return v1 | (v2 << 8);
}

- (uint64_t)y
{
  if (a1)
  {
    int v1 = (*(unsigned __int8 *)(a1 + 12) >> 3) & 1;
    int v2 = (*(unsigned __int8 *)(a1 + 16) >> 3) & 1;
  }
  else
  {
    int v2 = 0;
    int v1 = 0;
  }
  return v1 | (v2 << 8);
}

- (uint64_t)l1
{
  if (a1)
  {
    int v1 = (*(unsigned __int8 *)(a1 + 12) >> 4) & 1;
    int v2 = (*(unsigned __int8 *)(a1 + 16) >> 4) & 1;
  }
  else
  {
    int v2 = 0;
    int v1 = 0;
  }
  return v1 | (v2 << 8);
}

- (uint64_t)r1
{
  if (a1)
  {
    int v1 = (*(unsigned __int8 *)(a1 + 12) >> 5) & 1;
    int v2 = (*(unsigned __int8 *)(a1 + 16) >> 5) & 1;
  }
  else
  {
    int v2 = 0;
    int v1 = 0;
  }
  return v1 | (v2 << 8);
}

- (uint64_t)menu
{
  if (a1)
  {
    unsigned int v1 = *(unsigned __int8 *)(a1 + 23);
    int v2 = (v1 >> 2) & 1;
    int v3 = (v1 >> 3) & 1;
  }
  else
  {
    int v3 = 0;
    int v2 = 0;
  }
  return v2 | (v3 << 8);
}

- (uint64_t)options
{
  if (a1)
  {
    unsigned int v1 = *(unsigned __int8 *)(a1 + 23);
    int v2 = (v1 >> 4) & 1;
    int v3 = (v1 >> 5) & 1;
  }
  else
  {
    int v3 = 0;
    int v2 = 0;
  }
  return v2 | (v3 << 8);
}

- (uint64_t)record
{
  if (a1)
  {
    unsigned int v1 = *(unsigned __int8 *)(a1 + 23);
    int v2 = (v1 >> 6) & 1;
    unsigned int v3 = v1 >> 7;
  }
  else
  {
    unsigned int v3 = 0;
    int v2 = 0;
  }
  return v2 | (v3 << 8);
}

- (uint64_t)snapshot
{
  if (a1)
  {
    unsigned int v1 = *(unsigned __int8 *)(a1 + 24);
    int v2 = v1 & 1;
    int v3 = (v1 >> 1) & 1;
  }
  else
  {
    int v3 = 0;
    int v2 = 0;
  }
  return v2 | (v3 << 8);
}

- (uint64_t)l3
{
  if (a1)
  {
    int v1 = *(unsigned char *)(a1 + 13) & 1;
    int v2 = *(unsigned char *)(a1 + 17) & 1;
  }
  else
  {
    int v2 = 0;
    int v1 = 0;
  }
  return v1 | (v2 << 8);
}

- (uint64_t)r3
{
  if (a1)
  {
    int v1 = (*(_DWORD *)(a1 + 12) >> 9) & 1;
    int v2 = (*(_DWORD *)(a1 + 16) >> 9) & 1;
  }
  else
  {
    int v2 = 0;
    int v1 = 0;
  }
  return v1 | (v2 << 8);
}

- (uint64_t)l4
{
  if (a1)
  {
    int v1 = (*(_DWORD *)(a1 + 12) >> 10) & 1;
    int v2 = (*(_DWORD *)(a1 + 16) >> 10) & 1;
  }
  else
  {
    int v2 = 0;
    int v1 = 0;
  }
  return v1 | (v2 << 8);
}

- (uint64_t)r4
{
  if (a1)
  {
    int v1 = (*(_DWORD *)(a1 + 12) >> 11) & 1;
    int v2 = (*(_DWORD *)(a1 + 16) >> 11) & 1;
  }
  else
  {
    int v2 = 0;
    int v1 = 0;
  }
  return v1 | (v2 << 8);
}

- (uint64_t)m1
{
  if (a1)
  {
    int v1 = (*(_DWORD *)(a1 + 12) >> 12) & 1;
    int v2 = (*(_DWORD *)(a1 + 16) >> 12) & 1;
  }
  else
  {
    int v2 = 0;
    int v1 = 0;
  }
  return v1 | (v2 << 8);
}

- (uint64_t)m2
{
  if (a1)
  {
    int v1 = (*(_DWORD *)(a1 + 12) >> 13) & 1;
    int v2 = (*(_DWORD *)(a1 + 16) >> 13) & 1;
  }
  else
  {
    int v2 = 0;
    int v1 = 0;
  }
  return v1 | (v2 << 8);
}

- (uint64_t)m3
{
  if (a1)
  {
    int v1 = (*(_DWORD *)(a1 + 12) >> 14) & 1;
    int v2 = (*(_DWORD *)(a1 + 16) >> 14) & 1;
  }
  else
  {
    int v2 = 0;
    int v1 = 0;
  }
  return v1 | (v2 << 8);
}

- (uint64_t)m4
{
  if (a1)
  {
    int v1 = (*(_DWORD *)(a1 + 12) >> 15) & 1;
    int v2 = (*(_DWORD *)(a1 + 16) >> 15) & 1;
  }
  else
  {
    int v2 = 0;
    int v1 = 0;
  }
  return v1 | (v2 << 8);
}

- (id)description
{
  int v2 = self;
  if (self)
  {
    uint64_t v3 = 0;
    int v4 = *((unsigned char *)self + 20) & 0xF;
    unsigned int buttonPresent = self->_buttonPresent;
    if (v4 == 15 && (self->_buttonPresent & 0x3F) == 0x3F) {
      uint64_t v3 = *((unsigned char *)self + 23) & 1;
    }
    BOOL v6 = v4 == 15;
    BOOL v7 = -[_GCMFiControllerCapabilites isExtendedGamepad]((uint64_t)self);
    unsigned int v8 = *((unsigned __int8 *)v2 + 23);
    uint64_t v9 = (v8 >> 2) & 1;
    uint64_t v10 = (v8 >> 4) & 1;
    uint64_t v11 = v8 & 1;
    uint64_t v12 = (v8 >> 6) & 1;
    uint64_t v13 = *((unsigned char *)v2 + 24) & 1;
    int thumbstickPresent = v2->_thumbstickPresent;
    uint64_t v15 = (buttonPresent >> 1) & 1;
    uint64_t v16 = (buttonPresent >> 2) & 1;
    uint64_t v17 = (buttonPresent >> 3) & 1;
    BOOL v18 = (~thumbstickPresent & 3) == 0;
    uint64_t v19 = (buttonPresent >> 4) & 1;
    uint64_t v20 = (buttonPresent >> 5) & 1;
    uint64_t v21 = (buttonPresent >> 6) & 1;
    BOOL v22 = (~thumbstickPresent & 0x24) == 0;
    int v2 = (_GCMFiControllerCapabilites *)((buttonPresent >> 7) & 1);
    uint64_t v23 = buttonPresent & 1;
    uint64_t v24 = (buttonPresent >> 8) & 1;
    uint64_t v25 = (buttonPresent >> 9) & 1;
    uint64_t v26 = (buttonPresent >> 10) & 1;
    uint64_t v27 = (buttonPresent >> 11) & 1;
    uint64_t v28 = (buttonPresent >> 12) & 1;
    uint64_t v29 = (buttonPresent >> 13) & 1;
    uint64_t v30 = (buttonPresent >> 14) & 1;
    uint64_t v31 = (buttonPresent >> 15) & 1;
  }
  else
  {
    BOOL v7 = -[_GCMFiControllerCapabilites isExtendedGamepad](0);
    uint64_t v30 = 0;
    uint64_t v28 = 0;
    uint64_t v26 = 0;
    uint64_t v24 = 0;
    uint64_t v21 = 0;
    uint64_t v19 = 0;
    uint64_t v16 = 0;
    uint64_t v23 = 0;
    BOOL v18 = 0;
    uint64_t v13 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    uint64_t v3 = 0;
    uint64_t v9 = 0;
    uint64_t v12 = 0;
    BOOL v6 = 0;
    BOOL v22 = 0;
    uint64_t v15 = 0;
    uint64_t v17 = 0;
    uint64_t v20 = 0;
    uint64_t v25 = 0;
    uint64_t v27 = 0;
    uint64_t v29 = 0;
    uint64_t v31 = 0;
  }
  return +[NSString stringWithFormat:](&off_26D2B6E68, "stringWithFormat:", @"{\n\tisStandard:%d\n\tisExtended:%d\n\tHOME present:%d\n\tMENU present:%d\n\tOPTIONS present:%d\n\tRECORD present:%d\n\tSNAPSHOT present:%d\n\tdpad present:%d\n\tleftThumbstick present:%d\n\trightThumbstick present:%d\n\tA present:%d\n\tB present:%d\n\tX present:%d\n\tY present:%d\n\tL1 present:%d\n\tR1 present:%d\n\tL2 present:%d\n\tR2 present:%d\n\tL3 present:%d\n\tR3 present:%d\n\tL4 present:%d\n\tR4 present:%d\n\tM1 present:%d\n\tM2 present:%d\n\tM3 present:%d\n\tM4 present:%d\n}", v3, v7, v11, v9, v10, v12, v13, v6, v18, v22, v23, v15, v16, v17, v19, v20,
           v21,
           v2,
           v24,
           v25,
           v26,
           v27,
           v28,
           v29,
           v30,
           v31);
}

@end