@interface NSObject(ASDTPowerState)
- (uint64_t)asdtHandlesPowerTransition:()ASDTPowerState;
- (uint64_t)asdtPowerStateChange:()ASDTPowerState;
@end

@implementation NSObject(ASDTPowerState)

- (uint64_t)asdtPowerStateChange:()ASDTPowerState
{
  if ([a1 conformsToProtocol:&unk_26FCAF5E8])
  {
    id v5 = a1;
    uint64_t v6 = [v5 powerState];
    id v7 = [v5 name];
    v17[0] = 0;
    strlcpy((char *)v17, (const char *)[v7 UTF8String], 9uLL);
    v17[1] = 0;

    char v8 = 0;
    if ((int)a3 <= 1685090417)
    {
      if (a3)
      {
        int v9 = 1684628588;
LABEL_9:
        if (a3 != v9) {
          goto LABEL_11;
        }
      }
    }
    else if (a3 != 1685090418 && a3 != 1685286000)
    {
      int v9 = 1685092205;
      goto LABEL_9;
    }
    char v8 = 1;
LABEL_11:
    if ((int)a3 <= 1937008995)
    {
      if ((int)a3 > 1685092204)
      {
        if (a3 != 1685092205)
        {
          if (a3 == 1685286000) {
            uint64_t v6 = 1936483696;
          }
          goto LABEL_30;
        }
        goto LABEL_28;
      }
      if (a3 == 1684628588) {
        goto LABEL_24;
      }
      int v11 = 1685090418;
    }
    else
    {
      if ((int)a3 > 1970304876)
      {
        if (a3 != 1970304877)
        {
          if (a3 == 1970435438)
          {
            uint64_t v6 = 1920298606;
            goto LABEL_30;
          }
          if (a3 != 1970563428)
          {
LABEL_30:
            [v5 powerState];
            kdebug_trace();
            if (v6 == [v5 powerState])
            {
              uint64_t v10 = 0;
LABEL_55:

              return v10;
            }
            uint64_t v10 = 0;
            if ((int)v6 > 1886876268)
            {
              switch(v6)
              {
                case 0x7077726D:
                  uint64_t v12 = [v5 performPowerStatePrewarm:a3];
                  break;
                case 0x72756E6E:
                  uint64_t v12 = [v5 performPowerStateOn];
                  break;
                case 0x736C6570:
                  uint64_t v12 = [v5 performPowerStateSleep];
                  break;
                default:
                  goto LABEL_53;
              }
            }
            else
            {
              if (!v6)
              {
                uint64_t v10 = 2003329396;
                goto LABEL_55;
              }
              if (v6 != 1768189029)
              {
                if (v6 == 1886413170)
                {
                  uint64_t v12 = [v5 performPowerStatePrepare:a3];
                  goto LABEL_45;
                }
LABEL_53:
                [v5 setPowerState:v6];
LABEL_54:
                [v5 powerState];
                kdebug_trace();
                goto LABEL_55;
              }
              uint64_t v12 = [v5 performPowerStateIdle:a3];
            }
LABEL_45:
            uint64_t v10 = v12;
            if (v12) {
              char v13 = v8;
            }
            else {
              char v13 = 1;
            }
            if ((v13 & 1) == 0)
            {
              char v14 = [v5 pmNoStateChangeOnFailure];
              char v15 = a3 == 1970563428 ? 1 : v14;
              if (v15) {
                goto LABEL_54;
              }
            }
            goto LABEL_53;
          }
LABEL_24:
          uint64_t v6 = 1768189029;
          goto LABEL_30;
        }
LABEL_28:
        uint64_t v6 = 1886876269;
        goto LABEL_30;
      }
      if (a3 == 1937008996) {
        goto LABEL_24;
      }
      int v11 = 1970303090;
    }
    if (a3 == v11) {
      uint64_t v6 = 1886413170;
    }
    goto LABEL_30;
  }
  return 560227702;
}

- (uint64_t)asdtHandlesPowerTransition:()ASDTPowerState
{
  return 1;
}

@end