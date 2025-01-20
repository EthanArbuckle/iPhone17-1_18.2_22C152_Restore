@interface HUAlarmsAndTimersAccessUtility
+ (id)_canAlarmManagerControl:(id)a3 withManager:(id)a4;
+ (id)_canTimerManagerControl:(id)a3 withManager:(id)a4;
+ (id)canAccess:(id)a3 for:(unint64_t)a4 withManager:(id)a5;
@end

@implementation HUAlarmsAndTimersAccessUtility

+ (id)canAccess:(id)a3 for:(unint64_t)a4 withManager:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  if (a4 == 2)
  {
    v11 = HFLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "+[HUAlarmsAndTimersAccessUtility canAccess:for:withManager:]";
      __int16 v26 = 2112;
      id v27 = v7;
      _os_log_impl(&dword_1BE345000, v11, OS_LOG_TYPE_DEFAULT, "%s: checking accessory %@ access (type = AlarmsAndTimersAvailable).", buf, 0x16u);
    }

    v12 = (void *)MEMORY[0x1E4F7A0D8];
    v13 = +[HUAlarmsAndTimersAccessUtility _canAlarmManagerControl:v7 withManager:v8];
    v23[0] = v13;
    v14 = +[HUAlarmsAndTimersAccessUtility _canTimerManagerControl:v7 withManager:v8];
    v23[1] = v14;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
    v16 = [MEMORY[0x1E4F7A0F0] mainThreadScheduler];
    v17 = [v12 combineAllFutures:v15 ignoringErrors:0 scheduler:v16];

    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __60__HUAlarmsAndTimersAccessUtility_canAccess_for_withManager___block_invoke;
    v21[3] = &unk_1E6385620;
    id v22 = v7;
    v18 = [v17 flatMap:v21];
  }
  else
  {
    if (a4 == 1)
    {
      v19 = HFLogForCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v25 = "+[HUAlarmsAndTimersAccessUtility canAccess:for:withManager:]";
        __int16 v26 = 2112;
        id v27 = v7;
        _os_log_impl(&dword_1BE345000, v19, OS_LOG_TYPE_DEFAULT, "%s: checking accessory %@ access (type = TimersAvailable).", buf, 0x16u);
      }

      uint64_t v10 = +[HUAlarmsAndTimersAccessUtility _canTimerManagerControl:v7 withManager:v8];
    }
    else if (a4)
    {
      uint64_t v10 = [MEMORY[0x1E4F7A0D8] futureWithResult:MEMORY[0x1E4F1CC28]];
    }
    else
    {
      v9 = HFLogForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v25 = "+[HUAlarmsAndTimersAccessUtility canAccess:for:withManager:]";
        __int16 v26 = 2112;
        id v27 = v7;
        _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "%s: checking accessory %@ access (type = AlarmsAvailable).", buf, 0x16u);
      }

      uint64_t v10 = +[HUAlarmsAndTimersAccessUtility _canAlarmManagerControl:v7 withManager:v8];
    }
    v18 = (void *)v10;
  }

  return v18;
}

id __60__HUAlarmsAndTimersAccessUtility_canAccess_for_withManager___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = objc_msgSend(v3, "na_any:", &__block_literal_global_252);
  v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v11 = 136315906;
    v12 = "+[HUAlarmsAndTimersAccessUtility canAccess:for:withManager:]_block_invoke";
    __int16 v13 = 2112;
    uint64_t v14 = v6;
    __int16 v15 = 2112;
    id v16 = v3;
    __int16 v17 = 1024;
    int v18 = v4;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%s: checking accessory %@ for both = %@ (did either fail= %{BOOL}d)", (uint8_t *)&v11, 0x26u);
  }

  id v7 = (void *)MEMORY[0x1E4F7A0D8];
  id v8 = [NSNumber numberWithInt:v4 ^ 1u];
  v9 = [v7 futureWithResult:v8];

  return v9;
}

uint64_t __60__HUAlarmsAndTimersAccessUtility_canAccess_for_withManager___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 BOOLValue] ^ 1;
}

+ (id)_canAlarmManagerControl:(id)a3 withManager:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (!v5)
  {
LABEL_11:
    int v11 = (void *)MEMORY[0x1E4F7A0D8];
    uint64_t v12 = MEMORY[0x1E4F1CC28];
LABEL_12:
    uint64_t v14 = [v11 futureWithResult:v12];
    __int16 v15 = [MEMORY[0x1E4F7A0F0] mainThreadScheduler];
    id v16 = [v14 reschedule:v15];

    goto LABEL_14;
  }
  if (([v5 isReachable] & 1) == 0)
  {
    __int16 v13 = HFLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v26 = "+[HUAlarmsAndTimersAccessUtility _canAlarmManagerControl:withManager:]";
      __int16 v27 = 2112;
      id v28 = v5;
      _os_log_impl(&dword_1BE345000, v13, OS_LOG_TYPE_DEFAULT, "%s: NO: accessory %@ is not reachable...", buf, 0x16u);
    }

    goto LABEL_11;
  }
  uint64_t v7 = objc_msgSend(v5, "hf_siriEndpointProfile");
  if (v7)
  {
    id v8 = (void *)v7;
    int v9 = objc_msgSend(v5, "hf_needsOnboarding");

    if (v9)
    {
      uint64_t v10 = HFLogForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v26 = "+[HUAlarmsAndTimersAccessUtility _canAlarmManagerControl:withManager:]";
        __int16 v27 = 2112;
        id v28 = v5;
        _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "%s: YES: Siri endpoint accessory %@ is available for Alarms (implicit onboarding required)", buf, 0x16u);
      }

      int v11 = (void *)MEMORY[0x1E4F7A0D8];
      uint64_t v12 = MEMORY[0x1E4F1CC38];
      goto LABEL_12;
    }
  }
  __int16 v17 = (void *)MEMORY[0x1E4F7A0D8];
  uint64_t v22 = MEMORY[0x1E4F143A8];
  id v23 = v6;
  id v24 = v5;
  int v18 = objc_msgSend(MEMORY[0x1E4F7A0F0], "globalAsyncScheduler", v22, 3221225472, __70__HUAlarmsAndTimersAccessUtility__canAlarmManagerControl_withManager___block_invoke, &unk_1E6385D90);
  uint64_t v19 = [v17 futureWithBlock:&v22 scheduler:v18];

  v20 = [MEMORY[0x1E4F7A0F0] mainThreadScheduler];
  id v16 = [v19 reschedule:v20];

LABEL_14:

  return v16;
}

void __70__HUAlarmsAndTimersAccessUtility__canAlarmManagerControl_withManager___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_opt_class();
  id v4 = *(id *)(a1 + 32);
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    id v7 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F5AEF8], "hf_AlarmManagerForAccessory:", *(void *)(a1 + 40));
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v8 = v7;

  uint64_t v9 = [v8 _canDispatchForAssociatedAccessory];
  if ((v9 & 1) == 0)
  {
    uint64_t v10 = HFLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 40);
      int v13 = 138412290;
      uint64_t v14 = v11;
      _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "Coordination says accessory %@ is NOT controllable for Alarms", (uint8_t *)&v13, 0xCu);
    }
  }
  uint64_t v12 = [NSNumber numberWithBool:v9];
  [v3 finishWithResult:v12];
}

+ (id)_canTimerManagerControl:(id)a3 withManager:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (!v5)
  {
LABEL_11:
    uint64_t v11 = (void *)MEMORY[0x1E4F7A0D8];
    uint64_t v12 = MEMORY[0x1E4F1CC28];
LABEL_12:
    uint64_t v14 = [v11 futureWithResult:v12];
    uint64_t v15 = [MEMORY[0x1E4F7A0F0] mainThreadScheduler];
    id v16 = [v14 reschedule:v15];

    goto LABEL_14;
  }
  if (([v5 isReachable] & 1) == 0)
  {
    int v13 = HFLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v26 = "+[HUAlarmsAndTimersAccessUtility _canTimerManagerControl:withManager:]";
      __int16 v27 = 2112;
      id v28 = v5;
      _os_log_impl(&dword_1BE345000, v13, OS_LOG_TYPE_DEFAULT, "%s: NO: accessory %@ is not reachable...", buf, 0x16u);
    }

    goto LABEL_11;
  }
  uint64_t v7 = objc_msgSend(v5, "hf_siriEndpointProfile");
  if (v7)
  {
    id v8 = (void *)v7;
    int v9 = objc_msgSend(v5, "hf_needsOnboarding");

    if (v9)
    {
      uint64_t v10 = HFLogForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v26 = "+[HUAlarmsAndTimersAccessUtility _canTimerManagerControl:withManager:]";
        __int16 v27 = 2112;
        id v28 = v5;
        _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "%s: YES: Siri endpoint accessory %@ is available for Timers (implicit onboarding required)", buf, 0x16u);
      }

      uint64_t v11 = (void *)MEMORY[0x1E4F7A0D8];
      uint64_t v12 = MEMORY[0x1E4F1CC38];
      goto LABEL_12;
    }
  }
  __int16 v17 = (void *)MEMORY[0x1E4F7A0D8];
  uint64_t v22 = MEMORY[0x1E4F143A8];
  id v23 = v6;
  id v24 = v5;
  int v18 = objc_msgSend(MEMORY[0x1E4F7A0F0], "globalAsyncScheduler", v22, 3221225472, __70__HUAlarmsAndTimersAccessUtility__canTimerManagerControl_withManager___block_invoke, &unk_1E6385D90);
  uint64_t v19 = [v17 futureWithBlock:&v22 scheduler:v18];

  v20 = [MEMORY[0x1E4F7A0F0] mainThreadScheduler];
  id v16 = [v19 reschedule:v20];

LABEL_14:

  return v16;
}

void __70__HUAlarmsAndTimersAccessUtility__canTimerManagerControl_withManager___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_opt_class();
  id v4 = *(id *)(a1 + 32);
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    id v7 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F5AF08], "hf_TimerManagerForAccessory:", *(void *)(a1 + 40));
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v8 = v7;

  uint64_t v9 = [v8 _canDispatchForAssociatedAccessory];
  if ((v9 & 1) == 0)
  {
    uint64_t v10 = HFLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 40);
      int v13 = 138412290;
      uint64_t v14 = v11;
      _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "Coordination says accessory %@ is NOT controllable for Timers", (uint8_t *)&v13, 0xCu);
    }
  }
  uint64_t v12 = [NSNumber numberWithBool:v9];
  [v3 finishWithResult:v12];
}

@end