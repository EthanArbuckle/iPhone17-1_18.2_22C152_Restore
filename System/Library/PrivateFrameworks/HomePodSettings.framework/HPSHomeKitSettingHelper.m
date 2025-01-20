@interface HPSHomeKitSettingHelper
+ (id)compatibleReadResult:(id)a3;
+ (id)compatibleReadResults:(id)a3;
+ (id)compatibleReadSetting:(id)a3;
+ (id)compatibleWriteSetting:(id)a3;
+ (id)fixUpAutoAdjustSiriVolumeEnabled:(id)a3;
+ (id)fixUpHoldDuration:(id)a3;
+ (id)fixUpIgnoreRepeat:(id)a3;
+ (id)fixUpSpeakingRate:(id)a3;
+ (id)fixUpTapAssistanceSelection:(id)a3;
+ (id)fixUpTimeoutInterval:(id)a3;
@end

@implementation HPSHomeKitSettingHelper

+ (id)fixUpTapAssistanceSelection:(id)a3
{
  id v3 = a3;
  v4 = [v3 keyPath];
  v5 = [v3 value];

  id v6 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = objc_msgSend(MEMORY[0x263F22938], "hps_tapActivationMethodFromString:", v6);
    v8 = [NSNumber numberWithInteger:v7];
    v9 = v6;
  }
  else
  {
    objc_opt_class();
    v8 = v6;
    if (objc_opt_isKindOfClass()) {
      goto LABEL_6;
    }
    v10 = (void *)MEMORY[0x263EFF940];
    uint64_t v11 = *MEMORY[0x263EFF498];
    v12 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v12);
    [v10 raise:v11, @"%@ value should not be a %@", v4, v9 format];
    v8 = v6;
  }

LABEL_6:
  v13 = [[HPSConstrainedNumberSetting alloc] initWithKeyPath:v4 numberValue:v8 minimumValue:&unk_26F0F8680 maximumValue:&unk_26F0F8698 stepValue:&unk_26F0F86B0];

  return v13;
}

+ (id)fixUpSpeakingRate:(id)a3
{
  id v3 = a3;
  v4 = [v3 keyPath];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v5 = (void *)MEMORY[0x263EFF940];
    uint64_t v6 = *MEMORY[0x263EFF498];
    uint64_t v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    [v5 raise:v6, @"%@ should not be a %@", v4, v8 format];
  }
  v9 = [HPSConstrainedNumberSetting alloc];
  v10 = [v3 numberValue];
  uint64_t v11 = [(HPSConstrainedNumberSetting *)v9 initWithKeyPath:v4 numberValue:v10 minimumValue:&unk_26F0F86C8 maximumValue:&unk_26F0F86B0 stepValue:&unk_26F0F8710];

  return v11;
}

+ (id)fixUpTimeoutInterval:(id)a3
{
  id v3 = a3;
  v4 = [v3 keyPath];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v5 = (void *)MEMORY[0x263EFF940];
    uint64_t v6 = *MEMORY[0x263EFF498];
    uint64_t v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    [v5 raise:v6, @"%@ should not be a %@", v4, v8 format];
  }
  v9 = [HPSConstrainedNumberSetting alloc];
  v10 = [v3 numberValue];
  uint64_t v11 = [(HPSConstrainedNumberSetting *)v9 initWithKeyPath:v4 numberValue:v10 minimumValue:&unk_26F0F8720 maximumValue:&unk_26F0F8730 stepValue:&unk_26F0F8740];

  return v11;
}

+ (id)fixUpIgnoreRepeat:(id)a3
{
  id v3 = a3;
  v4 = [v3 keyPath];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v5 = (void *)MEMORY[0x263EFF940];
    uint64_t v6 = *MEMORY[0x263EFF498];
    uint64_t v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    [v5 raise:v6, @"%@ should not be a %@", v4, v8 format];
  }
  v9 = [HPSConstrainedNumberSetting alloc];
  v10 = [v3 numberValue];
  uint64_t v11 = [(HPSConstrainedNumberSetting *)v9 initWithKeyPath:v4 numberValue:v10 minimumValue:&unk_26F0F8750 maximumValue:&unk_26F0F86E0 stepValue:&unk_26F0F8750];

  return v11;
}

+ (id)fixUpHoldDuration:(id)a3
{
  id v3 = a3;
  v4 = [v3 keyPath];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v5 = (void *)MEMORY[0x263EFF940];
    uint64_t v6 = *MEMORY[0x263EFF498];
    uint64_t v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    [v5 raise:v6, @"%@ should not be a %@", v4, v8 format];
  }
  v9 = [HPSConstrainedNumberSetting alloc];
  v10 = [v3 numberValue];
  uint64_t v11 = [(HPSConstrainedNumberSetting *)v9 initWithKeyPath:v4 numberValue:v10 minimumValue:&unk_26F0F8750 maximumValue:&unk_26F0F86E0 stepValue:&unk_26F0F8750];

  return v11;
}

+ (id)fixUpAutoAdjustSiriVolumeEnabled:(id)a3
{
  id v3 = a3;
  v4 = [v3 keyPath];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v5 = (void *)MEMORY[0x263EFF940];
    uint64_t v6 = *MEMORY[0x263EFF498];
    uint64_t v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    [v5 raise:v6, @"%@ should not be a %@", v4, v8 format];
  }
  v9 = +[HPSBooleanSetting settingWithKeyPath:BOOLeanValue:](HPSBooleanSetting, "settingWithKeyPath:BOOLeanValue:", v4, [v3 BOOLeanValue] ^ 1);

  return v9;
}

+ (id)compatibleReadSetting:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id location = v4;
  v5 = [v4 keyPath];
  uint64_t v6 = [&unk_26F0F8760 objectForKey:v5];
  uint64_t v7 = v6;
  if (v6 && (SEL v8 = NSSelectorFromString(v6), (objc_opt_respondsToSelector() & 1) != 0))
  {
    v9 = _HPSLoggingFacility();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "+[HPSHomeKitSettingHelper compatibleReadSetting:]";
      __int16 v17 = 2112;
      v18 = v5;
      _os_log_impl(&dword_23D144000, v9, OS_LOG_TYPE_INFO, "%s fixing up %@", buf, 0x16u);
    }

    v10 = (void *)MEMORY[0x263EFF958];
    uint64_t v11 = [a1 methodSignatureForSelector:v8];
    v12 = [v10 invocationWithMethodSignature:v11];

    [v12 setTarget:a1];
    [v12 setSelector:v8];
    [v12 setArgument:&location atIndex:2];
    [v12 invoke];
    *(void *)buf = 0;
    [v12 getReturnValue:buf];
    objc_storeStrong(&location, *(id *)buf);
    id v13 = location;
  }
  else
  {
    id v13 = v4;
  }

  return v13;
}

+ (id)compatibleWriteSetting:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id location = v4;
  v5 = [v4 keyPath];
  uint64_t v6 = [&unk_26F0F8788 objectForKey:v5];
  uint64_t v7 = v6;
  if (v6 && (SEL v8 = NSSelectorFromString(v6), (objc_opt_respondsToSelector() & 1) != 0))
  {
    v9 = _HPSLoggingFacility();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "+[HPSHomeKitSettingHelper compatibleWriteSetting:]";
      __int16 v17 = 2112;
      v18 = v5;
      _os_log_impl(&dword_23D144000, v9, OS_LOG_TYPE_INFO, "%s fixing up %@", buf, 0x16u);
    }

    v10 = (void *)MEMORY[0x263EFF958];
    uint64_t v11 = [a1 methodSignatureForSelector:v8];
    v12 = [v10 invocationWithMethodSignature:v11];

    [v12 setTarget:a1];
    [v12 setSelector:v8];
    [v12 setArgument:&location atIndex:2];
    [v12 invoke];
    *(void *)buf = 0;
    [v12 getReturnValue:buf];
    objc_storeStrong(&location, *(id *)buf);
    id v13 = location;
  }
  else
  {
    id v13 = v4;
  }

  return v13;
}

+ (id)compatibleReadResult:(id)a3
{
  id v4 = a3;
  v5 = [v4 setting];
  if (v5)
  {
    uint64_t v6 = [a1 compatibleReadSetting:v5];
    if (v5 != v6)
    {
      uint64_t v7 = [HPSResult alloc];
      SEL v8 = [v4 accessoryIdentifier];
      v9 = [v4 error];
      uint64_t v10 = -[HPSResult initWithSetting:accessoryIdentifier:error:result:](v7, "initWithSetting:accessoryIdentifier:error:result:", v6, v8, v9, [v4 isSuccess]);

      id v4 = (id)v10;
    }
  }
  return v4;
}

+ (id)compatibleReadResults:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  __int16 v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __49__HPSHomeKitSettingHelper_compatibleReadResults___block_invoke;
  v9[3] = &unk_264E89740;
  uint64_t v11 = &v13;
  id v12 = a1;
  id v5 = v4;
  id v10 = v5;
  [v5 enumerateObjectsUsingBlock:v9];
  uint64_t v6 = (void *)v14[5];
  if (!v6) {
    uint64_t v6 = v5;
  }
  id v7 = v6;

  _Block_object_dispose(&v13, 8);
  return v7;
}

uint64_t __49__HPSHomeKitSettingHelper_compatibleReadResults___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 48);
  id v6 = a2;
  uint64_t v14 = [v5 compatibleReadResult:v6];

  uint64_t v8 = v14;
  if ((id)v14 != v6)
  {
    v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (!v9)
    {
      uint64_t v10 = [*(id *)(a1 + 32) mutableCopy];
      uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
      id v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;

      v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    }
    uint64_t v7 = [v9 replaceObjectAtIndex:a3 withObject:v14];
    uint64_t v8 = v14;
  }
  return MEMORY[0x270F9A758](v7, v8);
}

@end