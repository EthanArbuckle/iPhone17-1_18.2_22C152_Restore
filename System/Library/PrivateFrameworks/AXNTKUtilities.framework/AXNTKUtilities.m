id AXNTKFormattingManager()
{
  void *v0;
  uint64_t vars8;

  if (AXNTKFormattingManager_onceToken != -1) {
    dispatch_once(&AXNTKFormattingManager_onceToken, &__block_literal_global);
  }
  v0 = (void *)AXNTKFormattingManager_FormattingManager;
  return v0;
}

void __AXNTKFormattingManager_block_invoke()
{
  objc_msgSend(MEMORY[0x263F0A410], "fiui_sharedHealthStoreForCarousel");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  v0 = (void *)[objc_alloc(MEMORY[0x263F3F180]) initWithHealthStore:v3];
  uint64_t v1 = [objc_alloc(MEMORY[0x263F3F170]) initWithUnitManager:v0];
  v2 = (void *)AXNTKFormattingManager_FormattingManager;
  AXNTKFormattingManager_FormattingManager = v1;
}

uint64_t AXNTKUserIsWheelchairUserWithVoiceOverOn()
{
  if (_AXSVoiceOverTouchEnabled())
  {
    uint64_t v7 = 0;
    v8 = &v7;
    uint64_t v9 = 0x2020000000;
    char v10 = 0;
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __AXNTKUserIsWheelchairUserWithVoiceOverOn_block_invoke_2;
    v4[3] = &unk_264BDD2F0;
    id v5 = &__block_literal_global_281;
    v6 = &v7;
    if (AXNTKUserIsWheelchairUserWithVoiceOverOn_onceToken != -1) {
      dispatch_once(&AXNTKUserIsWheelchairUserWithVoiceOverOn_onceToken, v4);
    }
    if (!*((unsigned char *)v8 + 24))
    {
      v0 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __AXNTKUserIsWheelchairUserWithVoiceOverOn_block_invoke_3;
      block[3] = &unk_264BDD318;
      id v3 = &__block_literal_global_281;
      dispatch_async(v0, block);
    }
    _Block_object_dispose(&v7, 8);
  }
  return AXNTKUserIsWheelchairUserWithVoiceOverOn___isWheelchair;
}

void __AXNTKUserIsWheelchairUserWithVoiceOverOn_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F0A410]);
  uint64_t v3 = 0;
  uint64_t v1 = [v0 wheelchairUseWithError:&v3];
  v2 = v1;
  if (!v3) {
    AXNTKUserIsWheelchairUserWithVoiceOverOn___isWheelchair = [v1 wheelchairUse] == 2;
  }
}

uint64_t __AXNTKUserIsWheelchairUserWithVoiceOverOn_block_invoke_2(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

uint64_t __AXNTKUserIsWheelchairUserWithVoiceOverOn_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id AXNTKLocalizedStringForKey(void *a1)
{
  return AXNTKLocalizedStringForKeyInTable(a1, @"Accessibility");
}

id AXNTKLocalizedStringForKeyInTable(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 localizedStringForKey:v3 value:&stru_26E6B79B8 table:v4];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

uint64_t AXNTKCurrentTimeForWatchFaces()
{
  return MEMORY[0x270F09F40]();
}

uint64_t AXNTKClockTimeStringForDateIncludingSeconds()
{
  return MEMORY[0x270F09F20]();
}

uint64_t AXNTKClockTimeVoiceOverSpokenStringForDate()
{
  return MEMORY[0x270F09F20]();
}

uint64_t AXNTKClockTimeVoiceOverSpokenStringForWatchFaces()
{
  return MEMORY[0x270F09F30]();
}

id AXSolarPathValue(void *a1, double a2)
{
  id v3 = a1;
  id v4 = [v3 objectForKeyedSubscript:&unk_26E6B7BA8];
  id v5 = [v4 safeValueForKey:@"percentageThroughPeriodForWaypointDate"];
  [v5 doubleValue];
  double v7 = v6;

  v8 = [v3 objectForKeyedSubscript:&unk_26E6B7BC0];
  uint64_t v9 = [v8 safeValueForKey:@"percentageThroughPeriodForWaypointDate"];
  [v9 doubleValue];
  double v11 = v10;

  v12 = [v3 objectForKeyedSubscript:&unk_26E6B7BD8];
  v13 = [v12 safeValueForKey:@"percentageThroughPeriodForWaypointDate"];
  [v13 doubleValue];
  double v15 = v14;

  v16 = [v3 objectForKeyedSubscript:&unk_26E6B7BF0];
  v17 = [v16 safeValueForKey:@"percentageThroughPeriodForWaypointDate"];
  [v17 doubleValue];
  double v19 = v18;

  v20 = [v3 objectForKeyedSubscript:&unk_26E6B7C08];
  v21 = [v20 safeValueForKey:@"percentageThroughPeriodForWaypointDate"];
  [v21 doubleValue];
  double v23 = v22;

  if (v7 + -0.05 > a2) {
    goto LABEL_2;
  }
  if (v7 + -0.25 <= a2 && v7 - a2 >= 0.005)
  {
    v27 = MEMORY[0x237DB7F10](0, (v7 - a2) * 86400.0);
    v28 = NSString;
    v29 = @"solar.minutes.until.dawn";
  }
  else
  {
    if (v7 + -0.005 < a2)
    {
      double v25 = v11 + -0.005;
      if (v11 + -0.005 >= a2)
      {
        v26 = &unk_26E6B7BA8;
LABEL_14:
        v27 = objc_msgSend(v3, "objectForKeyedSubscript:", v26, v25);
        v24 = [v27 safeValueForKey:@"localizedName"];
        goto LABEL_15;
      }
    }
    double v25 = 0.005;
    if (vabdd_f64(a2, v11) <= 0.005)
    {
      v26 = &unk_26E6B7BC0;
      goto LABEL_14;
    }
    if (v11 + 0.05 <= a2)
    {
      if (v15 + -0.005 <= a2)
      {
        if (vabdd_f64(a2, v15) <= 0.005)
        {
          v26 = &unk_26E6B7BD8;
          goto LABEL_14;
        }
        if (v15 + 0.05 <= a2)
        {
          if (v15 >= a2 || v19 - a2 <= 0.005)
          {
            if (vabdd_f64(a2, v19) <= 0.005)
            {
              v26 = &unk_26E6B7BF0;
              goto LABEL_14;
            }
            if (v19 <= a2)
            {
              double v25 = v23 + 0.005;
              if (v23 + 0.005 > a2)
              {
                v26 = &unk_26E6B7C08;
                goto LABEL_14;
              }
            }
            if (v23 + 0.05 <= a2)
            {
LABEL_2:
              v24 = AXNTKLocalizedStringForKey(@"solar.nighttime");
              goto LABEL_16;
            }
            v27 = MEMORY[0x237DB7F10](0, vabdd_f64(v23, a2) * 86400.0);
            v28 = NSString;
            v29 = @"solar.minutes.since.dusk";
          }
          else
          {
            v27 = MEMORY[0x237DB7F10](0, fabs(v19 - a2) * 86400.0);
            v28 = NSString;
            v29 = @"solar.minutes.until.sunset";
          }
        }
        else
        {
          v27 = MEMORY[0x237DB7F10](0, vabdd_f64(v15, a2) * 86400.0);
          v28 = NSString;
          v29 = @"solar.minutes.since.noon";
        }
      }
      else
      {
        v27 = MEMORY[0x237DB7F10](0, vabdd_f64(v15, a2) * 86400.0);
        v28 = NSString;
        v29 = @"solar.minutes.until.noon";
      }
    }
    else
    {
      v27 = MEMORY[0x237DB7F10](0, vabdd_f64(v11, a2) * 86400.0);
      v28 = NSString;
      v29 = @"solar.minutes.since.sunrise";
    }
  }
  v30 = AXNTKLocalizedStringForKey(v29);
  v24 = objc_msgSend(v28, "stringWithFormat:", v30, v27);

LABEL_15:
LABEL_16:

  return v24;
}

BOOL AXNTKComplicationTemplateContainsSimpleImage(void *a1)
{
  id v1 = a1;
  NSSelectorFromString(&cfstr_Imageprovider.isa);
  if (objc_opt_respondsToSelector())
  {
    v2 = [v1 safeValueForKey:@"imageProvider"];
    BOOL v3 = v2 != 0;
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

uint64_t AXClockTimeVoiceOverSpokenStringForDate()
{
  return MEMORY[0x270F09F28]();
}

uint64_t AXDurationStringForDurationWithSeconds()
{
  return MEMORY[0x270F0A0B0]();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x270EF2BE8](aSelectorName);
}

uint64_t _AXSVoiceOverTouchEnabled()
{
  return MEMORY[0x270F90B78]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
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