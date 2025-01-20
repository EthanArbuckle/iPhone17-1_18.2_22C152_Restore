uint64_t FIUIIsFitnessTrackingEnabled()
{
  return MEMORY[0x270F29A20]();
}

uint64_t FIUIBundle()
{
  return MEMORY[0x270F29948]();
}

uint64_t FIUIDeviceSupportsSwimming()
{
  return MEMORY[0x270F29978]();
}

uint64_t FIUICurrentLanguageRequiresTallScript()
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v0 = [MEMORY[0x263EFF960] currentLocale];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v1 = _FIUILocalesRequiringTallScript();
  uint64_t v2 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v10 != v3) {
          objc_enumerationMutation(v1);
        }
        v5 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "languageCode", (void)v9);
        v6 = [v0 languageCode];
        char v7 = [v5 isEqualToString:v6];

        if (v7)
        {
          uint64_t v2 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v2 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v2;
}

id _FIUILocalesRequiringTallScript()
{
  v6[4] = *MEMORY[0x263EF8340];
  v0 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"th"];
  v6[0] = v0;
  v1 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"vi"];
  v6[1] = v1;
  uint64_t v2 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"hi"];
  v6[2] = v2;
  uint64_t v3 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"ar"];
  v6[3] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:4];

  return v4;
}

uint64_t FIUILocalizedNameForActivityType()
{
  return MEMORY[0x270F29AA8]();
}

uint64_t FIUILocalizedActivityNameWithFormatting()
{
  return MEMORY[0x270F29A78]();
}

double FIUIIconSize(void *a1, uint64_t a2)
{
  id v3 = a1;
  v4 = v3;
  switch(a2)
  {
    case 1:
      double v7 = 26.0;
      break;
    case 2:
      double v7 = 28.0;
      break;
    case 3:
      double v7 = 31.0;
      break;
    case 4:
      double v7 = 35.0;
      break;
    case 5:
      *(double *)&uint64_t v8 = 42.0;
      goto LABEL_10;
    case 6:
      *(double *)&uint64_t v8 = 56.0;
LABEL_10:
      double v7 = *(double *)&v8;
      break;
    case 7:
    case 8:
      v5 = FIUIStaticWorkoutIconImage(v3, a2);
      [v5 size];
      double v7 = v6;

      break;
    default:
      double v7 = 24.0;
      break;
  }

  return v7;
}

id FIUIStaticWorkoutIconImage(void *a1, uint64_t a2)
{
  id v3 = FIUIStaticScalableWorkoutIconImageWithPadding(a1, a2 != 7);
  double v4 = FIUISizeForIconSize(a2);
  double v6 = v5;
  double v7 = objc_msgSend(objc_alloc(MEMORY[0x263F827A0]), "initWithSize:", v4, v5);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __FIUIStaticWorkoutIconImage_block_invoke;
  v11[3] = &unk_2644A8020;
  id v12 = v3;
  double v13 = v4;
  double v14 = v6;
  id v8 = v3;
  long long v9 = [v7 imageWithActions:v11];

  return v9;
}

__CFString *_activityTypePrefix(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 effectiveTypeIdentifier];
  id v3 = @"elliptical";
  switch(v2)
  {
    case 1:
      id v3 = @"american_football";
      break;
    case 2:
      id v3 = @"archery";
      break;
    case 3:
      id v3 = @"australian_rules_football";
      break;
    case 4:
      id v3 = @"badminton";
      break;
    case 5:
      id v3 = @"baseball";
      break;
    case 6:
      id v3 = @"basketball";
      break;
    case 7:
      id v3 = @"bowling";
      break;
    case 8:
      id v3 = @"boxing";
      break;
    case 9:
      id v3 = @"climbing";
      break;
    case 10:
      id v3 = @"cricket";
      break;
    case 11:
      id v3 = @"cross_training";
      break;
    case 12:
      id v3 = @"curling";
      break;
    case 13:
      int v5 = [v1 isIndoor];
      double v6 = @"outdoorcycle";
      double v7 = @"indoorcycle";
      goto LABEL_62;
    case 14:
    case 15:
    case 77:
      id v3 = @"dance";
      break;
    case 16:
      break;
    case 17:
      id v3 = @"equestrian_sports";
      break;
    case 18:
      id v3 = @"fencing";
      break;
    case 19:
      id v3 = @"fishing";
      break;
    case 20:
      id v3 = @"func_strength_training";
      break;
    case 21:
      id v3 = @"golf";
      break;
    case 22:
      id v3 = @"gymnastics";
      break;
    case 23:
      id v3 = @"handball";
      break;
    case 24:
      id v3 = @"hiking";
      break;
    case 25:
      if (_os_feature_enabled_impl())
      {
        int v5 = [v1 isIndoor];
        double v6 = @"outdoor_hockey";
        double v7 = @"indoor_hockey";
        goto LABEL_62;
      }
      id v3 = @"hockey";
      break;
    case 26:
      id v3 = @"hunting";
      break;
    case 27:
      id v3 = @"lacrosse";
      break;
    case 28:
      id v3 = @"martial_arts";
      break;
    case 29:
      id v3 = @"mind_and_body";
      break;
    case 30:
    case 73:
      id v3 = @"mixed_meta_cardio_training";
      break;
    case 31:
      id v3 = @"paddle_sports";
      break;
    case 32:
      id v3 = @"play";
      break;
    case 33:
      id v3 = @"prep_and_recovery";
      break;
    case 34:
      id v3 = @"racquetball";
      break;
    case 35:
      id v3 = @"indoorrow";
      if (!_os_feature_enabled_impl()) {
        break;
      }
      int v8 = [v1 isIndoor];
      double v6 = @"outdoorrow";
      if (v8) {
        double v6 = @"indoorrow";
      }
      goto LABEL_64;
    case 36:
      id v3 = @"rugby";
      break;
    case 37:
      int v5 = [v1 isIndoor];
      double v6 = @"outdoorrun";
      double v7 = @"indoorrun";
      goto LABEL_62;
    case 38:
      id v3 = @"sailing";
      break;
    case 39:
      if (_os_feature_enabled_impl())
      {
        int v5 = [v1 isIndoor];
        double v6 = @"outdoor_skating";
        double v7 = @"indoor_skating";
        goto LABEL_62;
      }
      id v3 = @"skating_sports";
      break;
    case 40:
      id v3 = @"snow_sports";
      break;
    case 41:
      if (_os_feature_enabled_impl())
      {
        int v5 = [v1 isIndoor];
        double v6 = @"outdoor_soccer";
        double v7 = @"indoor_soccer";
LABEL_62:
        if (v5) {
          double v6 = v7;
        }
LABEL_64:
        id v3 = v6;
      }
      else
      {
        id v3 = @"soccer";
      }
      break;
    case 42:
      id v3 = @"softball";
      break;
    case 43:
      id v3 = @"squash";
      break;
    case 44:
      id v3 = @"stairstepper";
      break;
    case 45:
      id v3 = @"surfing";
      break;
    case 46:
      int v5 = [v1 hasLocationTypePool];
      double v6 = @"swimopen";
      double v7 = @"swimpool";
      goto LABEL_62;
    case 47:
      id v3 = @"table_tennis";
      break;
    case 48:
      id v3 = @"tennis";
      break;
    case 49:
      id v3 = @"track_and_field";
      break;
    case 50:
      id v3 = @"trad_weight_training";
      break;
    case 51:
      id v3 = @"volleyball";
      break;
    case 52:
      int v5 = [v1 isIndoor];
      double v6 = @"outdoorwalk";
      double v7 = @"indoorwalk";
      goto LABEL_62;
    case 53:
      id v3 = @"water_fitness";
      break;
    case 54:
      id v3 = @"water_polo";
      break;
    case 55:
      id v3 = @"water_sports";
      break;
    case 56:
      id v3 = @"wrestling";
      break;
    case 57:
      id v3 = @"yoga";
      break;
    case 58:
      id v3 = @"barre";
      break;
    case 59:
      id v3 = @"core_training";
      break;
    case 60:
      id v3 = @"cross_country_skiing";
      break;
    case 61:
      id v3 = @"downhill_skiing";
      break;
    case 62:
      id v3 = @"flexibility";
      break;
    case 63:
      id v3 = @"hiit";
      break;
    case 64:
      id v3 = @"jump_rope";
      break;
    case 65:
      id v3 = @"kickboxing";
      break;
    case 66:
      id v3 = @"pilates";
      break;
    case 67:
      id v3 = @"snowboarding";
      break;
    case 68:
      id v3 = @"stairs";
      break;
    case 69:
      id v3 = @"step_training";
      break;
    case 70:
      id v3 = @"wheelchairwalk";
      break;
    case 71:
      id v3 = @"wheelchairrun";
      break;
    case 72:
      id v3 = @"tai_chi";
      break;
    case 74:
      id v3 = @"hand_cycling";
      break;
    case 75:
      id v3 = @"disc_sports";
      break;
    case 76:
      id v3 = @"fitness_gaming";
      break;
    case 78:
      id v3 = @"social_dance";
      break;
    case 79:
      id v3 = @"pickleball";
      break;
    case 80:
      id v3 = @"cooldown";
      break;
    case 81:
      goto LABEL_5;
    case 82:
      id v3 = @"swimbikerun";
      break;
    case 83:
      goto LABEL_7;
    case 84:
      id v3 = @"underwater_diving";
      break;
    default:
      if (v2 != 3000)
      {
LABEL_5:
        _HKInitializeLogging();
        double v4 = (void *)*MEMORY[0x263F09970];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09970], OS_LOG_TYPE_FAULT)) {
          _activityTypePrefix_cold_1(v4, v1);
        }
      }
LABEL_7:
      id v3 = @"other";
      break;
  }

  return v3;
}

id _fitnessUIBundle()
{
  if (_fitnessUIBundle_onceToken != -1) {
    dispatch_once(&_fitnessUIBundle_onceToken, &__block_literal_global_6);
  }
  v0 = (void *)_fitnessUIBundle_bundle;
  return v0;
}

uint64_t ___fitnessUIBundle_block_invoke()
{
  _fitnessUIBundle_bundle = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  return MEMORY[0x270F9A758]();
}

double FIUIInterpolatedValue(double a1, double a2, double a3)
{
  return a1 + fmin(fmax(a3, 0.0), 1.0) * (a2 - a1);
}

void FIUIFlipViewRightToLeftIfNeeded(void *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  id v13 = a1;
  [v13 frame];
  double v14 = v9;
  double v15 = v10;
  double v16 = v11;
  double v17 = v12;
  FIUIFlipFrameRightToLeftIfNeeded(&v14, a2, a3, a4, a5);
  objc_msgSend(v13, "setFrame:", v14, v15, v16, v17);
}

void FIUIFlipFrameRightToLeftIfNeeded(CGFloat *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  if ([MEMORY[0x263F82E00] userInterfaceLayoutDirectionForSemanticContentAttribute:0] == 1)
  {
    CGFloat v10 = *a1;
    CGFloat v11 = a1[1];
    CGFloat v12 = a1[2];
    CGFloat v13 = a1[3];
    v15.origin.x = a2;
    v15.origin.y = a3;
    v15.size.width = a4;
    v15.size.height = a5;
    double Width = CGRectGetWidth(v15);
    v16.origin.x = v10;
    v16.origin.y = v11;
    v16.size.width = v12;
    v16.size.height = v13;
    *a1 = Width - CGRectGetMaxX(v16);
    a1[1] = v11;
    a1[2] = v12;
    a1[3] = v13;
  }
}

void sub_21E437244(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t FIUIIsPowerSavingModeEnabled()
{
  return _FIBoolForPerGizmoDomainAndKey();
}

uint64_t _SortMetricBySortIndex(void *a1, void *a2)
{
  id v3 = NSNumber;
  id v4 = a2;
  int v5 = objc_msgSend(v3, "numberWithInteger:", _SortIndexForMetricType(objc_msgSend(a1, "integerValue")));
  double v6 = NSNumber;
  uint64_t v7 = [v4 integerValue];

  int v8 = [v6 numberWithInteger:_SortIndexForMetricType(v7)];
  uint64_t v9 = [v5 compare:v8];

  return v9;
}

uint64_t FIUIDistanceTypeForActivityType(void *a1)
{
  id v1 = [a1 workoutActivityType];
  uint64_t v2 = FIDistanceTypeForActivityType();

  return v2;
}

uint64_t FIUIDistanceUnitForHKUnit()
{
  return MEMORY[0x270F29988]();
}

BOOL FIUIWorkoutSupportsAnimatedIcon(void *a1)
{
  return FIUISpriteSheetNumberOfFrames(0, a1) != 0;
}

uint64_t FIUISpriteSheetNumberOfFrames(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (a1) {
    *a1 = 10;
  }
  uint64_t v5 = [v3 identifier];
  if (v5 <= 43)
  {
    if (v5 > 23)
    {
      switch(v5)
      {
        case 24:
          uint64_t v6 = 48;
          goto LABEL_35;
        case 35:
          uint64_t v6 = 73;
          goto LABEL_35;
        case 37:
          uint64_t v6 = 19;
          goto LABEL_35;
      }
    }
    else
    {
      switch(v5)
      {
        case 13:
LABEL_18:
          uint64_t v6 = 38;
          goto LABEL_35;
        case 16:
LABEL_19:
          uint64_t v6 = 31;
          goto LABEL_35;
        case 20:
          uint64_t v6 = 151;
          goto LABEL_35;
      }
    }
LABEL_20:
    uint64_t v6 = 0;
    goto LABEL_35;
  }
  switch(v5)
  {
    case ',':
      uint64_t v6 = 30;
      break;
    case '-':
    case '/':
    case '0':
    case '1':
    case '2':
    case '3':
    case '5':
    case '6':
    case '7':
    case '8':
    case ':':
    case '=':
    case '>':
    case '@':
    case 'C':
    case 'D':
    case 'E':
      goto LABEL_20;
    case '.':
      uint64_t v6 = 90;
      break;
    case '4':
      if ([v4 isIndoor]) {
        uint64_t v6 = 32;
      }
      else {
        uint64_t v6 = 64;
      }
      break;
    case '9':
      uint64_t v6 = 158;
      break;
    case ';':
      uint64_t v6 = 76;
      break;
    case '<':
      uint64_t v6 = 47;
      break;
    case '?':
      uint64_t v6 = 17;
      break;
    case 'A':
      goto LABEL_19;
    case 'B':
      uint64_t v6 = 102;
      break;
    case 'F':
      goto LABEL_18;
    case 'G':
      uint64_t v6 = 29;
      break;
    case 'H':
      uint64_t v6 = 224;
      break;
    default:
      if (v5 == 77)
      {
        uint64_t v6 = 35;
      }
      else
      {
        if (v5 != 80) {
          goto LABEL_20;
        }
        uint64_t v6 = 251;
      }
      break;
  }
LABEL_35:

  return v6;
}

id FIUISpriteSheetWorkoutIconImage(void *a1, uint64_t a2, uint64_t a3)
{
  id v4 = _activityTypePrefix(a1);
  if ((unint64_t)(a3 - 1) > 7) {
    uint64_t v5 = @"_480";
  }
  else {
    uint64_t v5 = off_2644A8040[a3 - 1];
  }
  uint64_t v6 = [NSString stringWithFormat:@"%@%@", v4, v5];
  uint64_t v7 = (void *)MEMORY[0x263F827E8];
  int v8 = _fitnessUIBundle();
  uint64_t v9 = [v7 imageNamed:v6 inBundle:v8];

  return v9;
}

id FIUIComputeFontToFit(void *a1, void *a2, double a3, double a4)
{
  v23[1] = *MEMORY[0x263EF8340];
  id v7 = a1;
  id v8 = a2;
  uint64_t v9 = [v7 fontDescriptor];
  [v7 pointSize];
  double v11 = v10;
  id v12 = v7;
  [v12 pointSize];
  CGFloat v13 = v12;
  if (v14 > a4)
  {
    uint64_t v15 = *MEMORY[0x263F814F0];
    CGRect v16 = v12;
    while (1)
    {
      uint64_t v22 = v15;
      v23[0] = v16;
      double v17 = [NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:1];
      [v8 sizeWithAttributes:v17];
      double v19 = v18;

      if (v19 <= a3) {
        break;
      }
      double v11 = round(v11 * 0.9);
      CGFloat v13 = [MEMORY[0x263F81708] fontWithDescriptor:v9 size:v11];

      [v13 pointSize];
      CGRect v16 = v13;
      if (v20 <= a4) {
        goto LABEL_7;
      }
    }
    CGFloat v13 = v16;
  }
LABEL_7:

  return v13;
}

id _NumberFormatterForDecimalPrecision(id a1, uint64_t a2, uint64_t a3)
{
  if (a1 != (id)3)
  {
    if (a1 != (id)2)
    {
      if (a1 == (id)1)
      {
        _IntegerNumberFormatter(a2);
        a1 = (id)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_20;
    }
    if (a3 == 2)
    {
      double v11 = (void *)_SingleFractionTrimNumberFormatter___formatter;
      if (!_SingleFractionTrimNumberFormatter___formatter)
      {
        id v12 = objc_alloc_init(MEMORY[0x263F08A30]);
        CGFloat v13 = (void *)_SingleFractionTrimNumberFormatter___formatter;
        _SingleFractionTrimNumberFormatter___formatter = (uint64_t)v12;

        [(id)_SingleFractionTrimNumberFormatter___formatter setNumberStyle:1];
        [(id)_SingleFractionTrimNumberFormatter___formatter setMinimumFractionDigits:0];
        [(id)_SingleFractionTrimNumberFormatter___formatter setMaximumFractionDigits:1];
        double v11 = (void *)_SingleFractionTrimNumberFormatter___formatter;
      }
      [v11 setRoundingMode:a2];
      id v7 = (void *)_SingleFractionTrimNumberFormatter___formatter;
    }
    else
    {
      if (a3 != 1) {
        goto LABEL_20;
      }
      id v4 = (void *)_SingleFractionNumberFormatter___formatter;
      if (!_SingleFractionNumberFormatter___formatter)
      {
        id v5 = objc_alloc_init(MEMORY[0x263F08A30]);
        uint64_t v6 = (void *)_SingleFractionNumberFormatter___formatter;
        _SingleFractionNumberFormatter___formatter = (uint64_t)v5;

        [(id)_SingleFractionNumberFormatter___formatter setNumberStyle:1];
        [(id)_SingleFractionNumberFormatter___formatter setMinimumFractionDigits:1];
        [(id)_SingleFractionNumberFormatter___formatter setMaximumFractionDigits:1];
        id v4 = (void *)_SingleFractionNumberFormatter___formatter;
      }
      [v4 setRoundingMode:a2];
      id v7 = (void *)_SingleFractionNumberFormatter___formatter;
    }
LABEL_19:
    a1 = v7;
    goto LABEL_20;
  }
  if (a3 == 2)
  {
    id v8 = (void *)_DoubleFractionTrimNumberFormatter___formatter;
    if (!_DoubleFractionTrimNumberFormatter___formatter)
    {
      id v9 = objc_alloc_init(MEMORY[0x263F08A30]);
      double v10 = (void *)_DoubleFractionTrimNumberFormatter___formatter;
      _DoubleFractionTrimNumberFormatter___formatter = (uint64_t)v9;

      [(id)_DoubleFractionTrimNumberFormatter___formatter setNumberStyle:1];
      [(id)_DoubleFractionTrimNumberFormatter___formatter setMinimumFractionDigits:0];
      [(id)_DoubleFractionTrimNumberFormatter___formatter setMaximumFractionDigits:2];
      id v8 = (void *)_DoubleFractionTrimNumberFormatter___formatter;
    }
    [v8 setRoundingMode:a2];
    id v7 = (void *)_DoubleFractionTrimNumberFormatter___formatter;
    goto LABEL_19;
  }
  if (a3 == 1)
  {
    _DoubleFractionNumberFormatter(a2);
    a1 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_20:
  return a1;
}

id _IntegerNumberFormatter(uint64_t a1)
{
  uint64_t v2 = (void *)_IntegerNumberFormatter___formatter;
  if (!_IntegerNumberFormatter___formatter)
  {
    id v3 = objc_alloc_init(FIUINumberFormatter);
    id v4 = (void *)_IntegerNumberFormatter___formatter;
    _IntegerNumberFormatter___formatter = (uint64_t)v3;

    [(id)_IntegerNumberFormatter___formatter setNumberStyle:1];
    [(id)_IntegerNumberFormatter___formatter setMaximumFractionDigits:0];
    uint64_t v2 = (void *)_IntegerNumberFormatter___formatter;
  }
  [v2 setRoundingMode:a1];
  id v5 = (void *)_IntegerNumberFormatter___formatter;
  return v5;
}

uint64_t FIUIImageInBundle(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x263F827E8] imageNamed:a1 inBundle:a2 compatibleWithTraitCollection:0];
}

void sub_21E43A5B4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id _LengthFormatter(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v8 = (void *)_LengthFormatter___formatter;
  if (!_LengthFormatter___formatter)
  {
    id v9 = objc_alloc_init(MEMORY[0x263F08940]);
    double v10 = (void *)_LengthFormatter___formatter;
    _LengthFormatter___formatter = (uint64_t)v9;

    id v8 = (void *)_LengthFormatter___formatter;
  }
  double v11 = _NumberFormatterForDecimalPrecision(a1, a3, a4);
  [v8 setNumberFormatter:v11];

  [(id)_LengthFormatter___formatter setUnitStyle:a2];
  id v12 = (void *)_LengthFormatter___formatter;
  return v12;
}

uint64_t FIUIIsAutoPauseEnabled()
{
  return MEMORY[0x270F29B80](*MEMORY[0x263F3D1B0], @"EnableAutoPause", 0);
}

id _DoubleFractionNumberFormatter(uint64_t a1)
{
  uint64_t v2 = (void *)_DoubleFractionNumberFormatter___formatter;
  if (!_DoubleFractionNumberFormatter___formatter)
  {
    id v3 = objc_alloc_init(MEMORY[0x263F08A30]);
    id v4 = (void *)_DoubleFractionNumberFormatter___formatter;
    _DoubleFractionNumberFormatter___formatter = (uint64_t)v3;

    [(id)_DoubleFractionNumberFormatter___formatter setNumberStyle:1];
    [(id)_DoubleFractionNumberFormatter___formatter setMinimumFractionDigits:2];
    [(id)_DoubleFractionNumberFormatter___formatter setMaximumFractionDigits:2];
    uint64_t v2 = (void *)_DoubleFractionNumberFormatter___formatter;
  }
  [v2 setRoundingMode:a1];
  id v5 = (void *)_DoubleFractionNumberFormatter___formatter;
  return v5;
}

double FIUIDeviceScale()
{
  if (FIUIDeviceScale_onceToken != -1) {
    dispatch_once(&FIUIDeviceScale_onceToken, &__block_literal_global_523);
  }
  return *(double *)&FIUIDeviceScale___scale;
}

void __FIUIDeviceScale_block_invoke()
{
  id v1 = [MEMORY[0x263F82B60] mainScreen];
  [v1 scale];
  FIUIDeviceScale___scale = v0;
}

uint64_t FIUIPaceFormatForDistanceType()
{
  return MEMORY[0x270F29AE0]();
}

uint64_t FIUIHKUnitForDistanceUnit()
{
  return MEMORY[0x270F299F0]();
}

double FIUINumberOfUserUnitsInPaceForDistanceType()
{
  return (double)(unint64_t)FINumberOfUnitsInPaceForPaceFormat();
}

uint64_t FIUIDistanceUnitIsValid()
{
  return MEMORY[0x270F29998]();
}

BOOL FIUILocaleIsRightToLeft()
{
  return [MEMORY[0x263F82E00] userInterfaceLayoutDirectionForSemanticContentAttribute:0] == 1;
}

double FIUILeftOffsetForFontAndString(void *a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  if ([v4 length] < 1)
  {
    double x = 0.0;
  }
  else
  {
    CTFontGetGlyphsForCharacters(v3, (const UniChar *)[v4 cStringUsingEncoding:4], &glyphs, 1);
    CTFontGetBoundingRectsForGlyphs(v3, kCTFontOrientationDefault, &glyphs, &boundingRects, 1);
    double x = boundingRects.origin.x;
  }

  return x;
}

uint64_t FIUIUsesIndicDigits()
{
  if (FIUIUsesIndicDigits_onceToken != -1) {
    dispatch_once(&FIUIUsesIndicDigits_onceToken, &__block_literal_global_529);
  }
  return __usesIndicDigits;
}

void FIUIReloadUsesIndicDigits()
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2050000000;
  uint64_t v0 = (void *)getIntlUtilityClass_softClass;
  uint64_t v9 = getIntlUtilityClass_softClass;
  if (!getIntlUtilityClass_softClass)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __getIntlUtilityClass_block_invoke;
    v5[3] = &unk_2644A7EC8;
    v5[4] = &v6;
    __getIntlUtilityClass_block_invoke((uint64_t)v5);
    uint64_t v0 = (void *)v7[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v6, 8);
  uint64_t v2 = [MEMORY[0x263EFF960] currentLocale];
  id v3 = [v2 localeIdentifier];
  id v4 = [v1 numberingSystemForLocaleID:v3];
  __usesIndicDigits = [v4 isEqualToString:@"latn"] ^ 1;
}

void sub_21E43B400(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _TypeLabel()
{
  if (_TypeLabel_onceToken != -1) {
    dispatch_once(&_TypeLabel_onceToken, &__block_literal_global_371);
  }
  uint64_t v0 = (void *)_TypeLabel___typeLabel;
  return v0;
}

id _LabelFont()
{
  if (_LabelFont_onceToken != -1) {
    dispatch_once(&_LabelFont_onceToken, &__block_literal_global_379);
  }
  uint64_t v0 = (void *)_LabelFont_font;
  return v0;
}

id NLSessionFormatDetailLabel(void *a1, void *a2, void *a3, void *a4, void *a5, int a6, int a7)
{
  double v11 = NSString;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = a2;
  id v16 = a1;
  double v17 = FIUIBundle();
  double v18 = [v17 localizedStringForKey:@"SUMMARY_DETAIL_SUFFIX" value:&stru_26CF5F1B8 table:@"Localizable"];
  double v19 = objc_msgSend(v11, "stringWithFormat:", v18, v16, v15);

  double v20 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v19];
  uint64_t v21 = [v19 rangeOfString:v16];
  uint64_t v23 = v22;

  uint64_t v24 = [v19 rangeOfString:v15];
  uint64_t v26 = v25;

  uint64_t v27 = *MEMORY[0x263F814F0];
  objc_msgSend(v20, "addAttribute:value:range:", *MEMORY[0x263F814F0], v14, v21, v23);

  objc_msgSend(v20, "addAttribute:value:range:", v27, v13, v24, v26);
  objc_msgSend(v20, "addAttribute:value:range:", *MEMORY[0x263F81500], v12, 0, objc_msgSend(v20, "length"));

  if (a6 && a7) {
    objc_msgSend(v20, "addAttribute:value:range:", *MEMORY[0x263F81608], &unk_26CF74728, v21, v23);
  }

  return v20;
}

void __FIUIOnePixel_block_invoke()
{
  id v1 = [MEMORY[0x263F82B60] mainScreen];
  [v1 scale];
  *(double *)&FIUIOnePixel_onePixel = 1.0 / v0;
}

void __FIUIOnePixel_block_invoke_0()
{
  id v1 = [MEMORY[0x263F82B60] mainScreen];
  [v1 scale];
  *(double *)&FIUIOnePixel_onePixel_0 = 1.0 / v0;
}

uint64_t NLDoubleValueForQuantityAndGoalType()
{
  return MEMORY[0x270F299A0]();
}

id _FIUILocalizationKeyForUnit(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 unitString];
  id v5 = [v4 uppercaseString];

  uint64_t v6 = [NSString stringWithFormat:@"%@_%@", v3, v5];

  return v6;
}

id _EnergyFormatter(void *a1)
{
  id v1 = a1;
  if (!_EnergyFormatter___formatter)
  {
    id v2 = objc_alloc_init(MEMORY[0x263F087D8]);
    id v3 = (void *)_EnergyFormatter___formatter;
    _EnergyFormatter___formatter = (uint64_t)v2;

    id v4 = (void *)_EnergyFormatter___formatter;
    id v5 = _IntegerNumberFormatter(2);
    [v4 setNumberFormatter:v5];
  }
  uint64_t v6 = [MEMORY[0x263F0A830] largeCalorieUnit];
  uint64_t v7 = [v1 isEqual:v6];

  [(id)_EnergyFormatter___formatter setForFoodEnergyUse:v7];
  id v8 = (id)_EnergyFormatter___formatter;

  return v8;
}

void sub_21E440098(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t FIUICurrentLanguageNeedsExtendedLineSpacing()
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  double v0 = [MEMORY[0x263F086E0] mainBundle];
  id v1 = [v0 preferredLocalizations];

  if ([v1 count])
  {
    id v2 = [v1 firstObject];
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v3 = [&unk_26CF74680 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v10;
      while (2)
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v10 != v5) {
            objc_enumerationMutation(&unk_26CF74680);
          }
          if ([v2 hasPrefix:*(void *)(*((void *)&v9 + 1) + 8 * v6)])
          {
            uint64_t v7 = 1;
            goto LABEL_12;
          }
          ++v6;
        }
        while (v4 != v6);
        uint64_t v4 = [&unk_26CF74680 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }
    uint64_t v7 = 0;
LABEL_12:
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

uint64_t FIUICurrentLanguageSupportsTightLineSpacing()
{
  v18[1] = *MEMORY[0x263EF8340];
  if (FIUICurrentLanguageRequiresTallScript()) {
    return 0;
  }
  id v1 = [MEMORY[0x263EFF960] currentLocale];
  id v2 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"tr"];
  v18[0] = v2;
  uint64_t v0 = 1;
  uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "languageCode", (void)v13);
        long long v10 = [v1 languageCode];
        char v11 = [v9 isEqualToString:v10];

        if (v11)
        {
          uint64_t v0 = 0;
          goto LABEL_13;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
    uint64_t v0 = 1;
  }
LABEL_13:

  return v0;
}

void sub_21E440EA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id FIUIOrderedWeekdays()
{
  uint64_t v0 = [MEMORY[0x263EFF8F0] currentCalendar];
  uint64_t v1 = [v0 firstWeekday];
  unint64_t v2 = v1 - 1;

  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (v1 - 1 < (unint64_t)(v1 + 6))
  {
    uint64_t v4 = 7;
    do
    {
      uint64_t v5 = [&unk_26CF74698 objectAtIndexedSubscript:v2 % 7];
      [v3 addObject:v5];

      ++v2;
      --v4;
    }
    while (v4);
  }
  return v3;
}

id FIUIMindfulnessLocalizedWeekdaySelection(uint64_t a1, void *a2, char a3)
{
  v41[7] = *MEMORY[0x263EF8340];
  id v5 = a2;
  if (a1 == 1)
  {
    uint64_t v6 = FIUIBundle();
    uint64_t v7 = v6;
    id v8 = @"MINFULNESS_SELECTION_EVERY_MONDAY";
    goto LABEL_19;
  }
  if (!a1)
  {
    uint64_t v6 = FIUIBundle();
    uint64_t v7 = v6;
    id v8 = @"MINFULNESS_SELECTION_NEVER";
LABEL_19:
    long long v9 = [v6 localizedStringForKey:v8 value:&stru_26CF5F1B8 table:@"Localizable"];

    goto LABEL_20;
  }
  if ((a1 & 0xFFFFFFFFFFFFFFFDLL) == 0)
  {
    uint64_t v6 = FIUIBundle();
    uint64_t v7 = v6;
    id v8 = @"MINFULNESS_SELECTION_EVERY_TUESDAY";
    goto LABEL_19;
  }
  if ((a1 & 0xFFFFFFFFFFFFFFFBLL) == 0)
  {
    uint64_t v6 = FIUIBundle();
    uint64_t v7 = v6;
    id v8 = @"MINFULNESS_SELECTION_EVERY_WEDNESDAY";
    goto LABEL_19;
  }
  if ((a1 & 0xFFFFFFFFFFFFFFF7) == 0)
  {
    uint64_t v6 = FIUIBundle();
    uint64_t v7 = v6;
    id v8 = @"MINFULNESS_SELECTION_EVERY_THURSDAY";
    goto LABEL_19;
  }
  if ((a1 & 0xFFFFFFFFFFFFFFEFLL) == 0)
  {
    uint64_t v6 = FIUIBundle();
    uint64_t v7 = v6;
    id v8 = @"MINFULNESS_SELECTION_EVERY_FRIDAY";
    goto LABEL_19;
  }
  if ((a1 & 0xFFFFFFFFFFFFFFDFLL) == 0)
  {
    uint64_t v6 = FIUIBundle();
    uint64_t v7 = v6;
    id v8 = @"MINFULNESS_SELECTION_EVERY_SATURDAY";
    goto LABEL_19;
  }
  if ((a1 & 0xFFFFFFFFFFFFFFBFLL) == 0)
  {
    uint64_t v6 = FIUIBundle();
    uint64_t v7 = v6;
    id v8 = @"MINFULNESS_SELECTION_EVERY_SUNDAY";
    goto LABEL_19;
  }
  if (a1 == 127)
  {
    uint64_t v6 = FIUIBundle();
    uint64_t v7 = v6;
    id v8 = @"MINFULNESS_SELECTION_EVERY_DAY";
    goto LABEL_19;
  }
  if (FIMindfulnessWeekdayDaySelectionForCalendar() == a1)
  {
    char v11 = FIUIBundle();
    if (a3) {
      long long v12 = @"MINFULNESS_SELECTION_EVERY_WEEKDAYS";
    }
    else {
      long long v12 = @"MINFULNESS_SELECTION_WEEKDAYS";
    }
LABEL_45:
    long long v9 = [v11 localizedStringForKey:v12 value:&stru_26CF5F1B8 table:@"Localizable"];

    goto LABEL_20;
  }
  if (FIMindfulnessWeekendDaySelectionForCalendar() == a1)
  {
    char v11 = FIUIBundle();
    if (a3) {
      long long v12 = @"MINFULNESS_SELECTION_EVERY_WEEKENDS";
    }
    else {
      long long v12 = @"MINFULNESS_SELECTION_WEEKENDS";
    }
    goto LABEL_45;
  }
  id v31 = v5;
  id v13 = objc_alloc_init(MEMORY[0x263F089D8]);
  v40[0] = &unk_26CF75010;
  v40[1] = &unk_26CF75028;
  v41[0] = &unk_26CF750B8;
  v41[1] = &unk_26CF750D0;
  v40[2] = &unk_26CF75040;
  v40[3] = &unk_26CF75058;
  v41[2] = &unk_26CF750E8;
  v41[3] = &unk_26CF75100;
  v40[4] = &unk_26CF75070;
  v40[5] = &unk_26CF75088;
  v41[4] = &unk_26CF75118;
  v41[5] = &unk_26CF75130;
  v40[6] = &unk_26CF750A0;
  v41[6] = &unk_26CF75148;
  long long v14 = [NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:7];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  FIUIOrderedWeekdays();
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v36;
    v32 = v14;
    id v33 = v13;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v36 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * i), "unsignedIntegerValue", v31);
        if ((v19 & a1) != 0)
        {
          uint64_t v20 = v19;
          if ([v13 length]) {
            [v13 appendString:@" "];
          }
          uint64_t v21 = [NSNumber numberWithUnsignedInteger:v20];
          uint64_t v22 = [v14 objectForKeyedSubscript:v21];
          uint64_t v23 = [v22 unsignedIntegerValue];
          uint64_t v24 = &stru_26CF5F1B8;
          if ((unint64_t)(v23 - 8) >= 0xFFFFFFFFFFFFFFF9)
          {
            uint64_t v25 = v23;
            id v26 = objc_alloc_init(MEMORY[0x263F08790]);
            [v26 setFormattingContext:2];
            [v26 shortStandaloneWeekdaySymbols];
            uint64_t v27 = v16;
            uint64_t v28 = a1;
            v30 = uint64_t v29 = v17;
            uint64_t v24 = [v30 objectAtIndexedSubscript:v25 - 1];

            uint64_t v17 = v29;
            a1 = v28;
            uint64_t v16 = v27;

            long long v14 = v32;
            id v13 = v33;
          }
          [v13 appendString:v24];
        }
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v16);
  }

  long long v9 = (void *)[v13 copy];
  id v5 = v31;
LABEL_20:

  return v9;
}

__CFString *FIMindfulnessLocalizedDay(uint64_t a1)
{
  switch(a1)
  {
    case 1:
      uint64_t v1 = FIUIBundle();
      unint64_t v2 = v1;
      id v3 = @"MINFULNESS_SELECTION_EVERY_SUNDAY";
      goto LABEL_10;
    case 2:
      uint64_t v1 = FIUIBundle();
      unint64_t v2 = v1;
      id v3 = @"MINFULNESS_SELECTION_EVERY_MONDAY";
      goto LABEL_10;
    case 3:
      uint64_t v1 = FIUIBundle();
      unint64_t v2 = v1;
      id v3 = @"MINFULNESS_SELECTION_EVERY_TUESDAY";
      goto LABEL_10;
    case 4:
      uint64_t v1 = FIUIBundle();
      unint64_t v2 = v1;
      id v3 = @"MINFULNESS_SELECTION_EVERY_WEDNESDAY";
      goto LABEL_10;
    case 5:
      uint64_t v1 = FIUIBundle();
      unint64_t v2 = v1;
      id v3 = @"MINFULNESS_SELECTION_EVERY_THURSDAY";
      goto LABEL_10;
    case 6:
      uint64_t v1 = FIUIBundle();
      unint64_t v2 = v1;
      id v3 = @"MINFULNESS_SELECTION_EVERY_FRIDAY";
      goto LABEL_10;
    case 7:
      uint64_t v1 = FIUIBundle();
      unint64_t v2 = v1;
      id v3 = @"MINFULNESS_SELECTION_EVERY_SATURDAY";
LABEL_10:
      uint64_t v4 = [v1 localizedStringForKey:v3 value:&stru_26CF5F1B8 table:@"Localizable"];

      break;
    default:
      uint64_t v4 = &stru_26CF5F1B8;
      break;
  }
  return v4;
}

uint64_t FIUIPace()
{
  return MEMORY[0x270F29AD8]();
}

uint64_t FIUIPaceInMetersPerSecond()
{
  return MEMORY[0x270F29AF0]();
}

id KeyForWorkoutActivityType(void *a1)
{
  id v1 = a1;
  if ([v1 identifier] == 46)
  {
    unint64_t v2 = [v1 metadata];
    id v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263F09AE0]];
    uint64_t v4 = [v3 integerValue];

    if (v4 == 2)
    {
      id v5 = NSString;
      uint64_t v6 = [v1 identifier];
      uint64_t v7 = @".OWS";
      goto LABEL_9;
    }
    if (v4 == 1)
    {
      id v5 = NSString;
      uint64_t v6 = [v1 identifier];
      uint64_t v7 = @".PS";
LABEL_9:
      [v5 stringWithFormat:@"%lu%@", v6, v7];
      goto LABEL_10;
    }
  }
  id v8 = NSString;
  uint64_t v9 = [v1 identifier];
  int v10 = [v1 isIndoor];
  char v11 = &stru_26CF5F1B8;
  if (v10) {
    char v11 = @".indoor";
  }
  [v8 stringWithFormat:@"%lu%@", v9, v11];
  long long v12 = LABEL_10:;

  return v12;
}

uint64_t _SortIndexForMetricType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0x23) {
    return -1;
  }
  else {
    return qword_21E4D8730[a1 - 1];
  }
}

void __FIUIDividerViewRoundedCornerImage_block_invoke()
{
  objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithRect:", 0.0, 0.0, 3.5, 1.5);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, 3.5, 1.5, 0.75);
  id v1 = [MEMORY[0x263F825C8] colorWithWhite:0.2 alpha:1.0];
  v8.width = 3.5;
  v8.height = 1.5;
  UIGraphicsBeginImageContextWithOptions(v8, 1, 0.0);
  unint64_t v2 = [MEMORY[0x263F825C8] blackColor];
  [v2 setFill];

  [v6 fill];
  [v1 setFill];
  [v0 fill];
  id v3 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  uint64_t v4 = objc_msgSend(v3, "resizableImageWithCapInsets:resizingMode:", 1, 0.0, 1.5, 0.0, 1.5);
  id v5 = (void *)FIUIDividerViewRoundedCornerImage_image;
  FIUIDividerViewRoundedCornerImage_image = v4;
}

id FIUIHeightDisplayString(void *a1)
{
  id v1 = a1;
  if (!v1)
  {
    id v5 = FIUIBundle();
    uint64_t v6 = [v5 localizedStringForKey:@"HEIGHT_NOT_SET" value:&stru_26CF5F1B8 table:@"Localizable"];
    goto LABEL_5;
  }
  if (_IsMetricLocale())
  {
    unint64_t v2 = [MEMORY[0x263F0A830] meterUnitWithMetricPrefix:5];
    [v1 doubleValueForUnit:v2];
    double v4 = round(v3);

    id v5 = _HeightFormatterMediumStyle();
    uint64_t v6 = [v5 stringFromValue:9 unit:(double)(uint64_t)v4];
LABEL_5:
    uint64_t v7 = (void *)v6;

    goto LABEL_9;
  }
  CGSize v8 = [MEMORY[0x263F0A830] meterUnit];
  [v1 doubleValueForUnit:v8];
  double v10 = v9;

  char v11 = (void *)_HeightFormatterImperialShortStyle___heightFormatter;
  if (!_HeightFormatterImperialShortStyle___heightFormatter)
  {
    id v12 = objc_alloc_init(MEMORY[0x263F08940]);
    id v13 = (void *)_HeightFormatterImperialShortStyle___heightFormatter;
    _HeightFormatterImperialShortStyle___heightFormatter = (uint64_t)v12;

    [(id)_HeightFormatterImperialShortStyle___heightFormatter setForPersonHeightUse:1];
    [(id)_HeightFormatterImperialShortStyle___heightFormatter setUnitStyle:1];
    long long v14 = [(id)_HeightFormatterImperialShortStyle___heightFormatter numberFormatter];
    [v14 setMaximumFractionDigits:0];

    char v11 = (void *)_HeightFormatterImperialShortStyle___heightFormatter;
  }
  uint64_t v7 = [v11 stringFromMeters:v10];
LABEL_9:

  return v7;
}

uint64_t _IsMetricLocale()
{
  uint64_t v0 = _HeightFormatterMediumStyle();
  id v1 = [v0 numberFormatter];
  unint64_t v2 = [v1 locale];

  double v3 = [v2 objectForKey:*MEMORY[0x263EFF560]];
  uint64_t v4 = [v3 BOOLValue];

  return v4;
}

id _HeightFormatterMediumStyle()
{
  uint64_t v0 = (void *)_HeightFormatterMediumStyle___heightFormatter;
  if (!_HeightFormatterMediumStyle___heightFormatter)
  {
    id v1 = objc_alloc_init(MEMORY[0x263F08940]);
    unint64_t v2 = (void *)_HeightFormatterMediumStyle___heightFormatter;
    _HeightFormatterMediumStyle___heightFormatter = (uint64_t)v1;

    [(id)_HeightFormatterMediumStyle___heightFormatter setForPersonHeightUse:1];
    [(id)_HeightFormatterMediumStyle___heightFormatter setUnitStyle:2];
    uint64_t v0 = (void *)_HeightFormatterMediumStyle___heightFormatter;
  }
  return v0;
}

id FIUIWeightDisplayString(void *a1)
{
  if (a1)
  {
    double v1 = round(_WeightInLocaleUnit(a1));
    unint64_t v2 = _MassFormatter();
    [v2 stringFromValue:_LocaleWeightMassFormatterUnit() unit:(double)(uint64_t)v1];
  }
  else
  {
    unint64_t v2 = FIUIBundle();
    [v2 localizedStringForKey:@"WEIGHT_NOT_SET" value:&stru_26CF5F1B8 table:@"Localizable"];
  double v3 = };

  return v3;
}

double _WeightInLocaleUnit(void *a1)
{
  double v1 = (void *)MEMORY[0x263F0A830];
  id v2 = a1;
  double v3 = [v1 unitFromMassFormatterUnit:_LocaleWeightMassFormatterUnit()];
  [v2 doubleValueForUnit:v3];
  double v5 = v4;

  return v5;
}

id _MassFormatter()
{
  uint64_t v0 = (void *)_MassFormatter___massFormatter;
  if (!_MassFormatter___massFormatter)
  {
    id v1 = objc_alloc_init(MEMORY[0x263F08978]);
    id v2 = (void *)_MassFormatter___massFormatter;
    _MassFormatter___massFormatter = (uint64_t)v1;

    [(id)_MassFormatter___massFormatter setForPersonMassUse:1];
    uint64_t v0 = (void *)_MassFormatter___massFormatter;
  }
  return v0;
}

uint64_t _LocaleWeightMassFormatterUnit()
{
  uint64_t v3 = 11;
  uint64_t v0 = _MassFormatter();
  id v1 = (id)[v0 unitStringFromKilograms:&v3 usedUnit:2.0];

  return v3;
}

id FIUIWheelchairUseDisplayString(uint64_t a1)
{
  switch(a1)
  {
    case 0:
      id v1 = FIUIBundle();
      id v2 = v1;
      uint64_t v3 = @"WHEELCHAIR_NOT_SET";
      goto LABEL_7;
    case 2:
      id v1 = FIUIBundle();
      id v2 = v1;
      uint64_t v3 = @"WHEELCHAIR_YES";
      goto LABEL_7;
    case 1:
      id v1 = FIUIBundle();
      id v2 = v1;
      uint64_t v3 = @"WHEELCHAIR_NO";
LABEL_7:
      double v4 = [v1 localizedStringForKey:v3 value:&stru_26CF5F1B8 table:@"Localizable"];

      goto LABEL_9;
  }
  double v4 = 0;
LABEL_9:
  return v4;
}

id FIUIDateOfBirthDisplayString(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (FIUIDateOfBirthDisplayString_onceToken == -1)
  {
    if (v1)
    {
LABEL_3:
      uint64_t v3 = [(id)FIUIDateOfBirthDisplayString___birthdayDateFormatter stringFromDate:v2];
      goto LABEL_6;
    }
  }
  else
  {
    dispatch_once(&FIUIDateOfBirthDisplayString_onceToken, &__block_literal_global_0);
    if (v2) {
      goto LABEL_3;
    }
  }
  double v4 = FIUIBundle();
  uint64_t v3 = [v4 localizedStringForKey:@"BIRTHDATE_NOT_SET" value:&stru_26CF5F1B8 table:@"Localizable"];

LABEL_6:
  return v3;
}

uint64_t __FIUIDateOfBirthDisplayString_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  id v1 = (void *)FIUIDateOfBirthDisplayString___birthdayDateFormatter;
  FIUIDateOfBirthDisplayString___birthdayDateFormatter = (uint64_t)v0;

  [(id)FIUIDateOfBirthDisplayString___birthdayDateFormatter setTimeStyle:0];
  id v2 = (void *)FIUIDateOfBirthDisplayString___birthdayDateFormatter;
  return [v2 setDateStyle:2];
}

id FIUIBiologicalSexDisplayString(uint64_t a1)
{
  switch(a1)
  {
    case 3:
      id v1 = FIUIBundle();
      id v2 = v1;
      uint64_t v3 = @"OTHER";
      break;
    case 2:
      id v1 = FIUIBundle();
      id v2 = v1;
      uint64_t v3 = @"MALE";
      break;
    case 1:
      id v1 = FIUIBundle();
      id v2 = v1;
      uint64_t v3 = @"FEMALE";
      break;
    default:
      id v1 = FIUIBundle();
      id v2 = v1;
      uint64_t v3 = @"BIOLOGICAL_SEX_NOT_SET";
      break;
  }
  double v4 = [v1 localizedStringForKey:v3 value:&stru_26CF5F1B8 table:@"Localizable"];

  return v4;
}

void _changeSeparatorLineColors(void *a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v1 = a1;
  [v1 frame];
  if (v3 < 1.0 && v2 > 1.0)
  {
    double v5 = [MEMORY[0x263F825C8] colorWithRed:0.149019608 green:0.149019608 blue:0.149019608 alpha:1.0];
    [v1 setBackgroundColor:v5];
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v6 = objc_msgSend(v1, "subviews", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        _changeSeparatorLineColors(*(void *)(*((void *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

void sub_21E443E4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _PickerStyledAttributedString(void *a1)
{
  v9[1] = *MEMORY[0x263EF8340];
  id v1 = (objc_class *)MEMORY[0x263F086A0];
  id v2 = a1;
  id v3 = [v1 alloc];
  uint64_t v8 = *MEMORY[0x263F81500];
  double v4 = [MEMORY[0x263F825C8] grayColor];
  v9[0] = v4;
  double v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  uint64_t v6 = (void *)[v3 initWithString:v2 attributes:v5];

  return v6;
}

double _RoundedMinWeightInLocaleUnit()
{
  id v0 = (void *)MEMORY[0x263F0A630];
  id v1 = [MEMORY[0x263F0A830] poundUnit];
  id v2 = [v0 quantityWithUnit:v1 doubleValue:1.0];

  double v3 = round(_WeightInLocaleUnit(v2));
  return v3;
}

id _AvgWeightQuantity()
{
  id v0 = (void *)MEMORY[0x263F0A630];
  id v1 = [MEMORY[0x263F0A830] poundUnit];
  id v2 = [v0 quantityWithUnit:v1 doubleValue:159.0];

  return v2;
}

uint64_t FIUIInsetRect()
{
  return UIRectInset();
}

double FIUISubpixelAlignedCenter(double a1, double a2)
{
  double v2 = a2 * 0.5;
  UIRoundToViewScale();
  return v2 + v3;
}

uint64_t FIUISubpixelAlignedOrigin()
{
  return UIRoundToViewScale();
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

id _PositionAnimation(void *a1, double a2, float a3)
{
  double v5 = (void *)MEMORY[0x263F157D8];
  id v6 = a1;
  uint64_t v7 = [v5 animation];
  [v7 setValues:v6];

  [v7 setKeyPath:@"position"];
  [v7 setCalculationMode:*MEMORY[0x263F15968]];
  [v7 setDuration:a2];
  *(float *)&double v8 = a3;
  [v7 setRepeatCount:v8];
  return v7;
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

float _InterpolateWithKeyFrames(void *a1, void *a2, float a3)
{
  id v5 = a1;
  id v6 = a2;
  unint64_t v7 = 0;
  while (1)
  {
    unint64_t v8 = v7;
    if (v7 >= [v5 count] - 1) {
      break;
    }
    ++v7;
    uint64_t v9 = [v5 objectAtIndexedSubscript:v8 + 1];
    [v9 floatValue];
    float v11 = v10;

    if (v11 > a3 || v8 == [v5 count] - 2)
    {
      long long v12 = [v5 objectAtIndexedSubscript:v8];
      [v12 floatValue];
      float v14 = v13;

      uint64_t v15 = [v6 objectAtIndexedSubscript:v8];
      [v15 floatValue];
      double v17 = v16;
      double v18 = [v6 objectAtIndexedSubscript:v7];
      [v18 floatValue];
      float v20 = v17 + (float)((float)(a3 - v14) / (float)(v11 - v14)) * (v19 - v17);

      goto LABEL_7;
    }
  }
  float v20 = 0.0;
LABEL_7:

  return v20;
}

uint64_t ___defaultMetalDevice_block_invoke()
{
  _defaultMetalDevice_metalDevice = (uint64_t)MTLCreateSystemDefaultDevice();
  return MEMORY[0x270F9A758]();
}

uint64_t NLGeneralizedActivityTypeKey()
{
  return MEMORY[0x270F299D8]();
}

uint64_t NLQuantityForGoalTypeAndValue()
{
  return MEMORY[0x270F29B00]();
}

uint64_t NLActivityTypeIsSupported()
{
  return MEMORY[0x270F29928]();
}

uint64_t FIUIIsCategorizedOtherActivityType()
{
  return MEMORY[0x270F29A08]();
}

id FIUIStandardFitnessDefaultActivityTypes()
{
  id v0 = FIStandardFitnessDefaultActivityTypes();
  id v1 = objc_msgSend(v0, "hk_map:", &__block_literal_global_289);

  return v1;
}

FIUIWorkoutActivityType *__FIUIStandardFitnessDefaultActivityTypes_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  double v3 = [[FIUIWorkoutActivityType alloc] initWithWorkoutActivityType:v2];

  return v3;
}

id FIUIFitnessJuniorDefaultActivityTypes()
{
  id v0 = FIFitnessJuniorDefaultActivityTypes();
  id v1 = objc_msgSend(v0, "hk_map:", &__block_literal_global_291);

  return v1;
}

FIUIWorkoutActivityType *__FIUIFitnessJuniorDefaultActivityTypes_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  double v3 = [[FIUIWorkoutActivityType alloc] initWithWorkoutActivityType:v2];

  return v3;
}

uint64_t FUBundle()
{
  return MEMORY[0x270F29948]();
}

uint64_t FIUIAssetsBundle()
{
  return MEMORY[0x270F29940]();
}

__CFString *FIUILastFourCharactersOfUUID(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    id v2 = [v1 UUIDString];
    double v3 = [v1 UUIDString];

    objc_msgSend(v2, "substringFromIndex:", objc_msgSend(v3, "length") - 4);
    double v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    double v4 = @"NULL";
  }
  return v4;
}

double _FIUICalculateBMR(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5, double a6, double a7)
{
  if (a3 == 2)
  {
    BOOL v11 = a1 != 2;
    uint64_t v12 = FICMotionConditionForWheelchairUse();
    uint64_t v30 = 0;
    id v31 = &v30;
    uint64_t v32 = 0x2050000000;
    float v13 = (void *)getCMCalorieUserInfoClass_softClass;
    uint64_t v33 = getCMCalorieUserInfoClass_softClass;
    if (!getCMCalorieUserInfoClass_softClass)
    {
      uint64_t v25 = MEMORY[0x263EF8330];
      uint64_t v26 = 3221225472;
      uint64_t v27 = __getCMCalorieUserInfoClass_block_invoke;
      uint64_t v28 = &unk_2644A7EC8;
      uint64_t v29 = &v30;
      __getCMCalorieUserInfoClass_block_invoke((uint64_t)&v25);
      float v13 = (void *)v31[3];
    }
    float v14 = v13;
    _Block_object_dispose(&v30, 8);
    uint64_t v15 = (void *)[[v14 alloc] initWithAge:v11 gender:v12 height:(double)a2 weight:a6 / 100.0 condition:a4];
    uint64_t v30 = 0;
    id v31 = &v30;
    uint64_t v32 = 0x2050000000;
    float v16 = (void *)getCMNatalimeterClass_softClass;
    uint64_t v33 = getCMNatalimeterClass_softClass;
    if (!getCMNatalimeterClass_softClass)
    {
      uint64_t v25 = MEMORY[0x263EF8330];
      uint64_t v26 = 3221225472;
      uint64_t v27 = __getCMNatalimeterClass_block_invoke;
      uint64_t v28 = &unk_2644A7EC8;
      uint64_t v29 = &v30;
      __getCMNatalimeterClass_block_invoke((uint64_t)&v25);
      float v16 = (void *)v31[3];
    }
    id v17 = v16;
    _Block_object_dispose(&v30, 8);
    double v18 = [v17 computeRestingCaloriesAtRate:0 user:v15 duration:86400.0];
    [v18 doubleValue];
    double v20 = v19 / 1000.0;
  }
  else
  {
    double v20 = 0.0;
    if (a4 > 0.0)
    {
      if (a5 > 0.0 && a5 < a4)
      {
        double v20 = (a4 - a5) * 4.04 + a5 * 25.8;
      }
      else if (a6 > 0.0 && a2 >= 1)
      {
        if (a1 == 2)
        {
          double v22 = a4 * 13.7 + 66.0 + a6 * 5.0;
          double v23 = -6.8;
        }
        else
        {
          double v22 = a4 * 9.6 + 655.0 + a6 * 1.8;
          double v23 = -4.7;
        }
        double v20 = v22 + (double)a2 * v23;
      }
    }
  }
  return v20 * a7;
}

void sub_21E4502E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _FIUIUserContactFromAddressBook()
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2050000000;
  id v0 = (void *)getCNContactStoreClass_softClass;
  uint64_t v32 = getCNContactStoreClass_softClass;
  if (!getCNContactStoreClass_softClass)
  {
    uint64_t v24 = MEMORY[0x263EF8330];
    uint64_t v25 = 3221225472;
    uint64_t v26 = __getCNContactStoreClass_block_invoke;
    uint64_t v27 = &unk_2644A7EC8;
    uint64_t v28 = &v29;
    __getCNContactStoreClass_block_invoke((uint64_t)&v24);
    id v0 = (void *)v30[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v29, 8);
  id v2 = objc_alloc_init(v1);
  double v3 = [getCNContactFormatterClass() descriptorForRequiredKeysForStyle:0];
  v33[0] = v3;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000;
  double v4 = (id *)getCNContactNicknameKeySymbolLoc_ptr;
  uint64_t v32 = getCNContactNicknameKeySymbolLoc_ptr;
  if (!getCNContactNicknameKeySymbolLoc_ptr)
  {
    uint64_t v24 = MEMORY[0x263EF8330];
    uint64_t v25 = 3221225472;
    uint64_t v26 = __getCNContactNicknameKeySymbolLoc_block_invoke;
    uint64_t v27 = &unk_2644A7EC8;
    uint64_t v28 = &v29;
    id v5 = (void *)ContactsLibrary();
    id v6 = dlsym(v5, "CNContactNicknameKey");
    *(void *)(v28[1] + 24) = v6;
    getCNContactNicknameKeySymbolLoc_ptr = *(void *)(v28[1] + 24);
    double v4 = (id *)v30[3];
  }
  _Block_object_dispose(&v29, 8);
  if (!v4) {
    _FIUIUserContactFromAddressBook_cold_1();
  }
  id v7 = *v4;
  v33[1] = v7;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000;
  unint64_t v8 = (id *)getCNContactGivenNameKeySymbolLoc_ptr;
  uint64_t v32 = getCNContactGivenNameKeySymbolLoc_ptr;
  if (!getCNContactGivenNameKeySymbolLoc_ptr)
  {
    uint64_t v24 = MEMORY[0x263EF8330];
    uint64_t v25 = 3221225472;
    uint64_t v26 = __getCNContactGivenNameKeySymbolLoc_block_invoke;
    uint64_t v27 = &unk_2644A7EC8;
    uint64_t v28 = &v29;
    uint64_t v9 = (void *)ContactsLibrary();
    float v10 = dlsym(v9, "CNContactGivenNameKey");
    *(void *)(v28[1] + 24) = v10;
    getCNContactGivenNameKeySymbolLoc_ptr = *(void *)(v28[1] + 24);
    unint64_t v8 = (id *)v30[3];
  }
  _Block_object_dispose(&v29, 8);
  if (!v8) {
    _FIUIUserContactFromAddressBook_cold_1();
  }
  id v11 = *v8;
  v33[2] = v11;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v12 = (id *)getCNContactEmailAddressesKeySymbolLoc_ptr;
  uint64_t v32 = getCNContactEmailAddressesKeySymbolLoc_ptr;
  if (!getCNContactEmailAddressesKeySymbolLoc_ptr)
  {
    uint64_t v24 = MEMORY[0x263EF8330];
    uint64_t v25 = 3221225472;
    uint64_t v26 = __getCNContactEmailAddressesKeySymbolLoc_block_invoke;
    uint64_t v27 = &unk_2644A7EC8;
    uint64_t v28 = &v29;
    float v13 = (void *)ContactsLibrary();
    float v14 = dlsym(v13, "CNContactEmailAddressesKey");
    *(void *)(v28[1] + 24) = v14;
    getCNContactEmailAddressesKeySymbolLoc_ptr = *(void *)(v28[1] + 24);
    uint64_t v12 = (id *)v30[3];
  }
  _Block_object_dispose(&v29, 8);
  if (!v12) {
    _FIUIUserContactFromAddressBook_cold_1();
  }
  id v15 = *v12;
  v33[3] = v15;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000;
  float v16 = (id *)getCNContactPhoneNumbersKeySymbolLoc_ptr;
  uint64_t v32 = getCNContactPhoneNumbersKeySymbolLoc_ptr;
  if (!getCNContactPhoneNumbersKeySymbolLoc_ptr)
  {
    uint64_t v24 = MEMORY[0x263EF8330];
    uint64_t v25 = 3221225472;
    uint64_t v26 = __getCNContactPhoneNumbersKeySymbolLoc_block_invoke;
    uint64_t v27 = &unk_2644A7EC8;
    uint64_t v28 = &v29;
    id v17 = (void *)ContactsLibrary();
    double v18 = dlsym(v17, "CNContactPhoneNumbersKey");
    *(void *)(v28[1] + 24) = v18;
    getCNContactPhoneNumbersKeySymbolLoc_ptr = *(void *)(v28[1] + 24);
    float v16 = (id *)v30[3];
  }
  _Block_object_dispose(&v29, 8);
  if (!v16) {
    _FIUIUserContactFromAddressBook_cold_1();
  }
  id v34 = *v16;
  double v19 = (void *)MEMORY[0x263EFF8C0];
  id v20 = v34;
  uint64_t v21 = [v19 arrayWithObjects:v33 count:5];

  double v22 = objc_msgSend(v2, "_ios_meContactWithKeysToFetch:error:", v21, 0);

  return v22;
}

void sub_21E4507B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCNContactFormatterClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  id v0 = (void *)getCNContactFormatterClass_softClass;
  uint64_t v7 = getCNContactFormatterClass_softClass;
  if (!getCNContactFormatterClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getCNContactFormatterClass_block_invoke;
    v3[3] = &unk_2644A7EC8;
    v3[4] = &v4;
    __getCNContactFormatterClass_block_invoke((uint64_t)v3);
    id v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21E4508AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t FIUIEdgeInsetsForDesiredButtonFrame()
{
  if (FIUIEdgeInsetsForDesiredButtonFrame_onceToken != -1) {
    dispatch_once(&FIUIEdgeInsetsForDesiredButtonFrame_onceToken, &__block_literal_global_3);
  }
  UIRoundToScale();
  return UIRoundToScale();
}

void __FIUIEdgeInsetsForDesiredButtonFrame_block_invoke()
{
  id v1 = [MEMORY[0x263F82B60] mainScreen];
  [v1 scale];
  FIUIEdgeInsetsForDesiredButtonFrame_screenScale = v0;
}

double FIUIRoundFrameToViewScale(void *a1)
{
  id v1 = a1;
  UIRoundToViewScale();
  double v3 = v2;
  UIRoundToViewScale();
  UIRoundToViewScale();
  UIRoundToViewScale();

  return v3;
}

id FIUICopyUserFirstNameFromAddressBook()
{
  uint64_t v0 = _FIUIUserContactFromAddressBook();
  id v1 = [v0 nickname];
  if (![v1 length])
  {
    uint64_t v2 = [v0 givenName];

    id v1 = (void *)v2;
  }

  return v1;
}

id FIUICopyUserFullNameFromAddressBook()
{
  uint64_t v0 = _FIUIUserContactFromAddressBook();
  id v1 = [getCNContactFormatterClass() stringFromContact:v0 style:0];
  if (![v1 length])
  {
    uint64_t v2 = [v0 nickname];

    id v1 = (void *)v2;
  }

  return v1;
}

id FIUICopyUserIdentifierFromAddressBook()
{
  uint64_t v0 = _FIUIUserContactFromAddressBook();
  id v1 = [v0 givenName];
  if (![v1 length])
  {
    uint64_t v2 = [v0 emailAddresses];
    double v3 = [v2 firstObject];

    uint64_t v4 = [v3 value];

    id v1 = (void *)v4;
  }
  if (![v1 length])
  {
    id v5 = [v0 phoneNumbers];
    uint64_t v6 = [v5 firstObject];

    uint64_t v7 = [v6 value];
    uint64_t v8 = [v7 stringValue];

    id v1 = (void *)v8;
  }

  return v1;
}

uint64_t FIUISetFitnessTrackingEnabled()
{
  return MEMORY[0x270F29B10]();
}

uint64_t FIUIIsHeartRateEnabled()
{
  if ([MEMORY[0x263F82438] isRunningInStoreDemoMode]) {
    return 1;
  }
  uint64_t v1 = *MEMORY[0x263F0ADC0];
  uint64_t v2 = *MEMORY[0x263F0ADD8];
  return MEMORY[0x270F29B90](v1, v2, 1);
}

uint64_t FIUISetHeartRateEnabled(uint64_t a1)
{
  return MEMORY[0x270F29BB0](*MEMORY[0x263F0ADD8], a1, *MEMORY[0x263F0ADC0]);
}

uint64_t FIUIMusicAutoStartEnabled()
{
  return _FIBoolForPerGizmoDomainAndKey();
}

uint64_t FIUIMusicIsPlaybackModeShuffle()
{
  return MEMORY[0x270F29B80](*MEMORY[0x263F3D1B0], @"NLWorkoutMusicPlaybackModeShuffle", 0);
}

uint64_t FIUIDeviceSupportsAutoPlay()
{
  if (_FIBoolForPerGizmoDomainAndKey()) {
    return 1;
  }
  uint64_t v1 = FIGetActivePairedDevice();
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"66DE554B-3959-40C7-88B1-81E8481E3B84"];
  uint64_t v3 = [v1 supportsCapability:v2];

  return v3;
}

uint64_t FIUIIsProSettingEnabled()
{
  return _FIBoolForPerGizmoDomainAndKey();
}

void FIUISetIsPowerSavingModeEnabled(uint64_t a1)
{
  v4[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = @"EnablePowerSavingMode";
  uint64_t v1 = [NSNumber numberWithBool:a1];
  v4[0] = v1;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1];
  _FIWriteBoolsToPerGizmoDomain();
}

uint64_t FIUIIsWorkoutExtendedModeSupported()
{
  uint64_t v0 = FIGetActivePairedDevice();
  uint64_t v1 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"C26AD300-9198-11EC-8BC2-0800200C9A66"];
  int v2 = [v0 supportsCapability:v1];

  uint64_t v3 = v2 | _FIBoolForPerGizmoDomainAndKey();
  return v3;
}

uint64_t FIUIIsWorkoutExtendedModeEnabled()
{
  return MEMORY[0x270F29B80](*MEMORY[0x263F3D1B0], @"WorkoutExtendedModeEnabled", 0);
}

void FIUISetWorkoutExtendedModeEnabled(uint64_t a1)
{
  v4[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = @"WorkoutExtendedModeEnabled";
  uint64_t v1 = [NSNumber numberWithBool:a1];
  v4[0] = v1;
  int v2 = [NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1];
  _FIWriteBoolsToPerGizmoDomain();
}

void FIUIClearWorkoutPowerMode()
{
  v2[2] = *MEMORY[0x263EF8340];
  v1[0] = @"EnablePowerSavingMode";
  v1[1] = @"WorkoutExtendedModeEnabled";
  v2[0] = MEMORY[0x263EFFA80];
  v2[1] = MEMORY[0x263EFFA80];
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v2 forKeys:v1 count:2];
  _FIWriteBoolsToPerGizmoDomain();
}

uint64_t FIUIShowAveragePace()
{
  return _FIBoolForPerGizmoDomainAndKey();
}

uint64_t FIUIShouldConfirmEndingWorkout()
{
  return MEMORY[0x270F29B90](*MEMORY[0x263F3D1B0], @"ConfirmEndingWorkout", 0);
}

uint64_t FIUIIsRunningAutoPauseEnabled()
{
  return MEMORY[0x270F29B80](*MEMORY[0x263F3D1B0], @"RunningAP", 1);
}

uint64_t FIUIIsCyclingAutoPauseEnabled()
{
  return MEMORY[0x270F29B80](*MEMORY[0x263F3D1B0], @"CyclingAP", 1);
}

uint64_t FIUIIsEndRemindersEnabled()
{
  return MEMORY[0x270F29A18]();
}

uint64_t FIUIIsStartRemindersEnabled()
{
  return MEMORY[0x270F29A30]();
}

uint64_t FIUIIsWorkoutPauseByChordPressEnabled()
{
  return MEMORY[0x270F29B80](*MEMORY[0x263F3D1B0], @"NLChordPressWorkoutPauseEnableNotification", 1);
}

uint64_t FIUIIsDoubleTapToScrollWorkoutViewsEnabled()
{
  return MEMORY[0x270F29B80](*MEMORY[0x263F3D1B0], @"NLDoubleTapToScrollWorkoutViewsEnabled", 0);
}

uint64_t FIUIGymKitAcceptedUserConsent()
{
  return MEMORY[0x270F29B90](*MEMORY[0x263F0AC80], @"UserConsentGranted", 0);
}

uint64_t FIUISetGymKitAcceptedUserConsent(uint64_t a1)
{
  return MEMORY[0x270F29BB0](@"UserConsentGranted", a1, *MEMORY[0x263F0AC80]);
}

uint64_t FIUIGymKitUserConsentVersion()
{
  return MEMORY[0x270F29BA0](*MEMORY[0x263F0AC80], @"UserConsentVersion");
}

uint64_t FIUISetGymKitUserConsentVersion(uint64_t a1)
{
  return MEMORY[0x270F29BC0](@"UserConsentVersion", a1, *MEMORY[0x263F0AC80]);
}

uint64_t FIUIIsWorkoutVoiceFeedbackEnabled()
{
  if (_os_feature_enabled_impl())
  {
    uint64_t v0 = [MEMORY[0x263F285A0] sharedPreferences];
    int v1 = [v0 nanoAssistantEnabled];

    if (!v1) {
      return 0;
    }
  }
  uint64_t v2 = *MEMORY[0x263F3D1B0];
  return MEMORY[0x270F29B80](v2, @"NLVoiceFeedbackEnabled", 1);
}

uint64_t FIUIIsWorkoutSiriAnnounceEnabled()
{
  return MEMORY[0x270F29B80](*MEMORY[0x263F3D1B0], @"SiriAnnounceEnabled", 0);
}

uint64_t FIUISetWorkoutSiriAnnounceEnabled(uint64_t a1)
{
  return MEMORY[0x270F29BA8](@"SiriAnnounceEnabled", a1, *MEMORY[0x263F3D1B0]);
}

BOOL FIUIWorkoutSiriAnnounceEnabledExists()
{
  uint64_t v0 = _FINumberForPerGizmoDomainAndKey();
  BOOL v1 = v0 != 0;

  return v1;
}

uint64_t FIUIIsPrecisionStartEnabled()
{
  return MEMORY[0x270F29B80](*MEMORY[0x263F3D1B0], @"PrecisionStartEnabled", 0);
}

uint64_t FIUIIsWorkoutSafetyCheckInEnabled()
{
  return MEMORY[0x270F29A50]();
}

uint64_t FIUISetWorkoutSafetyCheckInEnabled()
{
  return MEMORY[0x270F29B38]();
}

uint64_t FIUIIsNextWorkoutSafetyCheckInEnabled()
{
  return MEMORY[0x270F29A28]();
}

uint64_t FIUISetNextWorkoutSafetyCheckInEnabled()
{
  return MEMORY[0x270F29B18]();
}

uint64_t FIUIIsWorkoutVoiceFeedbackSupportedForLanguage(uint64_t a1)
{
  return [&unk_26CF746F8 containsObject:a1] ^ 1;
}

uint64_t FIUISetWorkoutConfigurationsMigrated(uint64_t a1)
{
  return MEMORY[0x270F29BA8](@"WorkoutConfigurationsMigrated", a1, *MEMORY[0x263F3D1B0]);
}

uint64_t FIUISetWorkoutKickboxingConfigurationMigrated(uint64_t a1)
{
  return MEMORY[0x270F29BA8](@"WorkoutKickboxingConfigurationMigratedV2", a1, *MEMORY[0x263F3D1B0]);
}

uint64_t FIUISetWorkoutRowingLocationConfigurationMigrated(uint64_t a1)
{
  return MEMORY[0x270F29BA8](@"WorkoutRowingLocationConfigurationMigrated", a1, *MEMORY[0x263F3D1B0]);
}

uint64_t FIUISetWorkoutPoolSwimmingConfigurationMigrated(uint64_t a1)
{
  return MEMORY[0x270F29BA8](@"WorkoutPoolSwimmingConfigurationMigrated", a1, *MEMORY[0x263F3D1B0]);
}

uint64_t FIUISetWorkoutRowingConfigurationMigrated(uint64_t a1)
{
  return MEMORY[0x270F29BA8](@"WorkoutRowingConfigurationMigrated", a1, *MEMORY[0x263F3D1B0]);
}

uint64_t FIUIIsWorkoutConfigurationsMigrated()
{
  return MEMORY[0x270F29B80](*MEMORY[0x263F3D1B0], @"WorkoutConfigurationsMigrated", 0);
}

uint64_t FIUIIsWorkoutKickboxingConfigurationMigrated()
{
  return MEMORY[0x270F29B80](*MEMORY[0x263F3D1B0], @"WorkoutKickboxingConfigurationMigratedV2", 0);
}

uint64_t FIUIIsWorkoutRowingLocationConfigurationMigrated()
{
  return MEMORY[0x270F29B80](*MEMORY[0x263F3D1B0], @"WorkoutRowingLocationConfigurationMigrated", 0);
}

uint64_t FIUIIsWorkoutPoolSwimmingConfigurationMigrated()
{
  return MEMORY[0x270F29B80](*MEMORY[0x263F3D1B0], @"WorkoutPoolSwimmingConfigurationMigrated", 0);
}

uint64_t FIUIIsWorkoutRowingConfigurationMigrated()
{
  return MEMORY[0x270F29B80](*MEMORY[0x263F3D1B0], @"WorkoutRowingConfigurationMigrated", 0);
}

uint64_t FIUIDeviceSupportsNavigation()
{
  if (_FIBoolForPerGizmoDomainAndKey()) {
    return 1;
  }
  BOOL v1 = FIGetActivePairedDevice();
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"CB81F0AE-3F2F-4D57-8C90-F0D1A4ADD373"];
  uint64_t v3 = [v1 supportsCapability:v2];

  return v3;
}

uint64_t FIUIDeviceSupportsElevationGain()
{
  uint64_t v0 = FIGetActivePairedDevice();
  BOOL v1 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"D1DBCF21-D875-4EA8-B63E-8182578C0B0C"];
  uint64_t v2 = [v0 supportsCapability:v1];

  return v2;
}

uint64_t FIUIDeviceSupportsGroundElevation()
{
  uint64_t v0 = FIGetActivePairedDevice();
  BOOL v1 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"CB81F0AE-3F2F-4D57-8C90-F0D1A4ADD373"];
  uint64_t v2 = [v0 supportsCapability:v1];

  return v2;
}

void *FIUIDeepBreathingRemindersPerDayOptions()
{
  return &unk_26CF74710;
}

id FIUIDeepBreathingReminderFrequencyOptions()
{
  void v6[5] = *MEMORY[0x263EF8340];
  uint64_t v0 = objc_msgSend(NSNumber, "numberWithInteger:", 3600, &unk_26CF75238);
  v6[1] = v0;
  BOOL v1 = [NSNumber numberWithInteger:10800];
  v6[2] = v1;
  uint64_t v2 = [NSNumber numberWithInteger:18000];
  v6[3] = v2;
  uint64_t v3 = [NSNumber numberWithInteger:25200];
  v6[4] = v3;
  uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:5];

  return v4;
}

void FIUIUserHasExistingSampleOfTypesPassingFilter(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (!v10) {
    FIUIUserHasExistingSampleOfTypesPassingFilter_cold_1();
  }
  id v11 = v10;
  uint64_t v12 = objc_msgSend(v8, "hk_map:", &__block_literal_global_534);
  id v13 = objc_alloc(MEMORY[0x263F0A6E0]);
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  double v19 = __FIUIUserHasExistingSampleOfTypesPassingFilter_block_invoke_2;
  id v20 = &unk_2644A7DE0;
  id v21 = v9;
  id v22 = v11;
  id v14 = v11;
  id v15 = v9;
  float v16 = (void *)[v13 initWithQueryDescriptors:v12 limit:1 resultsHandler:&v17];
  objc_msgSend(v7, "executeQuery:", v16, v17, v18, v19, v20);
}

uint64_t __FIUIUserHasExistingSampleOfTypesPassingFilter_block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x263F0A678] queryDescriptorWithSampleType:a2];
}

void __FIUIUserHasExistingSampleOfTypesPassingFilter_block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = a4;
  objc_msgSend(a3, "hk_filter:", v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v8 count];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void FIUIUserHasExistingSampleOfTypes(void *a1, void *a2, void *a3)
{
}

uint64_t __FIUIUserHasExistingSampleOfTypes_block_invoke()
{
  return 1;
}

void FIUIUserHasExistingMoveGoal(void *a1, void *a2)
{
  void v9[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)MEMORY[0x263F0A598];
  id v4 = a2;
  id v5 = a1;
  uint64_t v6 = [v3 calorieGoal];
  v9[0] = v6;
  id v7 = [MEMORY[0x263F0A598] moveMinuteGoal];
  v9[1] = v7;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:2];

  FIUIUserHasExistingSampleOfTypesPassingFilter(v5, v8, &__block_literal_global_540, v4);
}

void FIUIUserHasExistingExerciseAndStandGoals(void *a1, void *a2)
{
  v12[1] = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  id v5 = [MEMORY[0x263F0A598] exerciseGoal];
  v12[0] = v5;
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  void v9[2] = __FIUIUserHasExistingExerciseAndStandGoals_block_invoke;
  void v9[3] = &unk_2644A7E28;
  id v10 = v3;
  id v11 = v4;
  id v7 = v3;
  id v8 = v4;
  FIUIUserHasExistingSampleOfTypesPassingFilter(v7, v6, &__block_literal_global_540, v9);
}

void __FIUIUserHasExistingExerciseAndStandGoals_block_invoke(uint64_t a1, char a2)
{
  v7[1] = *MEMORY[0x263EF8340];
  if (a2)
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = [MEMORY[0x263F0A598] standGoal];
    v7[0] = v4;
    id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
    FIUIUserHasExistingSampleOfTypesPassingFilter(v3, v5, &__block_literal_global_540, *(void **)(a1 + 40));
  }
  else
  {
    uint64_t v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v6();
  }
}

void FIUIUserHasExistingPreKincaidMoveGoal(void *a1, void *a2)
{
  v15[2] = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263F0A598];
  id v4 = a2;
  id v5 = a1;
  uint64_t v6 = [v3 calorieGoal];
  v15[0] = v6;
  id v7 = [MEMORY[0x263F0A598] moveMinuteGoal];
  v15[1] = v7;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];

  long long v13 = 0uLL;
  uint64_t v14 = 0;
  HKNSOperatingSystemVersionFromString();
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __FIUIUserHasExistingPreKincaidMoveGoal_block_invoke;
  aBlock[3] = &__block_descriptor_56_e18_B16__0__HKSample_8l;
  long long v11 = 0uLL;
  uint64_t v12 = 0;
  id v9 = _Block_copy(aBlock);
  FIUIUserHasExistingSampleOfTypesPassingFilter(v5, v8, v9, v4);
}

BOOL __FIUIUserHasExistingPreKincaidMoveGoal_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 sourceRevision];
  id v3 = v2;
  if (v2) {
    [v2 operatingSystemVersion];
  }
  BOOL v4 = HKNSOperatingSystemVersionCompare() == -1;

  return v4;
}

id FIUIHealthStoreForDevice(void *a1)
{
  id v1 = a1;
  id v2 = objc_alloc_init(MEMORY[0x263F0A410]);
  if (!FIIsDeviceSatellitePaired()) {
    goto LABEL_12;
  }
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  double v23 = __Block_byref_object_copy_;
  uint64_t v24 = __Block_byref_object_dispose_;
  id v25 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  BOOL v4 = (void *)[objc_alloc(MEMORY[0x263F0A620]) initWithHealthStore:v2];
  id v5 = [v1 pairingID];
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  float v16 = __FIUIHealthStoreForDevice_block_invoke;
  uint64_t v17 = &unk_2644A7E70;
  double v19 = &v20;
  uint64_t v6 = v3;
  uint64_t v18 = v6;
  [v4 fetchProfileIdentifierForNRDeviceUUID:v5 completion:&v14];

  dispatch_time_t v7 = dispatch_time(0, 20000000000);
  intptr_t v8 = dispatch_semaphore_wait(v6, v7);
  if (v8)
  {
    _HKInitializeLogging();
    id v9 = *MEMORY[0x263F09970];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09970], OS_LOG_TYPE_ERROR)) {
      FIUIHealthStoreForDevice_cold_2(v9);
    }
  }
  else if (v21[5])
  {
    id v10 = objc_alloc_init(MEMORY[0x263F0A410]);
    objc_msgSend(v10, "setProfileIdentifier:", v21[5], v14, v15, v16, v17);
    [v10 resume];

    id v2 = v10;
  }
  else
  {
    _HKInitializeLogging();
    long long v11 = *MEMORY[0x263F09970];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09970], OS_LOG_TYPE_ERROR)) {
      FIUIHealthStoreForDevice_cold_1(v11);
    }

    id v2 = 0;
  }

  _Block_object_dispose(&v20, 8);
  if (v8)
  {
    uint64_t v12 = 0;
  }
  else
  {
LABEL_12:
    id v2 = v2;
    uint64_t v12 = v2;
  }

  return v12;
}

void sub_21E451F94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __FIUIHealthStoreForDevice_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    _HKInitializeLogging();
    dispatch_time_t v7 = *MEMORY[0x263F09970];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09970], OS_LOG_TYPE_ERROR)) {
      __FIUIHealthStoreForDevice_block_invoke_cold_1((uint64_t)v6, v7);
    }
  }
  else if (!v5)
  {
    _HKInitializeLogging();
    intptr_t v8 = *MEMORY[0x263F09970];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09970], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_21E433000, v8, OS_LOG_TYPE_DEFAULT, "Profile identifier for satellite paired watch is nil with no error.  Guardian health cloud sharing disabled.", v12, 2u);
    }
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
  id v11 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t FIUISetMusicPlaybackModeShuffle(uint64_t a1)
{
  return MEMORY[0x270F29BA8](@"NLWorkoutMusicPlaybackModeShuffle", a1, *MEMORY[0x263F3D1B0]);
}

uint64_t FIUIIsWorkoutNFCAllDayDefaultEnabled()
{
  return MEMORY[0x270F29A40]();
}

uint64_t FIUIIsGuidedWorkoutPrefetchEnabled()
{
  return MEMORY[0x270F29B80](*MEMORY[0x263F3D1A8], @"GuidedWorkoutPrefetchEnabled", 1);
}

uint64_t FIUISetGuidedWorkoutPrefetchEnabled(uint64_t a1)
{
  return MEMORY[0x270F29BA8](@"GuidedWorkoutPrefetchEnabled", a1, *MEMORY[0x263F3D1A8]);
}

uint64_t FIUIIsGuidedWorkoutMediaMomentsEnabled()
{
  return MEMORY[0x270F29B80](*MEMORY[0x263F3D1B0], @"GuidedWorkoutMediaMomentsEnabled", 1);
}

uint64_t FIUIIsGuidedRunPrefetchEnabled()
{
  return MEMORY[0x270F29B80](*MEMORY[0x263F3D1A8], @"GuidedRunPrefetchEnabled", 1);
}

uint64_t FIUISetGuidedRunPrefetchEnabled(uint64_t a1)
{
  return MEMORY[0x270F29BA8](@"GuidedRunPrefetchEnabled", a1, *MEMORY[0x263F3D1A8]);
}

uint64_t FIUIIsGuidedRunMediaMomentsEnabled()
{
  return MEMORY[0x270F29B80](*MEMORY[0x263F3D1B0], @"GuidedRunMediaMomentsEnabled", 1);
}

uint64_t FIUIIsGuidedMeditationPrefetchEnabled()
{
  return MEMORY[0x270F29B80](*MEMORY[0x263F3D1A8], @"GuidedMeditationPrefetchEnabled", 1);
}

uint64_t FIUISetGuidedMeditationPrefetchEnabled(uint64_t a1)
{
  return MEMORY[0x270F29BA8](@"GuidedMeditationPrefetchEnabled", a1, *MEMORY[0x263F3D1A8]);
}

uint64_t FIUIIsWorkoutNFCAllDayEnabled()
{
  return MEMORY[0x270F29A48]();
}

uint64_t FIUISetWorkoutNFCAllDayEnabled()
{
  return MEMORY[0x270F29B30]();
}

uint64_t FIUINeedsActivityRingExplanation()
{
  return MEMORY[0x270F29B88](@"com.apple.nanolifestyle", @"NeedsActivityRingExplanation");
}

uint64_t FIUISetNeedsActivityRingExplanation(uint64_t a1)
{
  return MEMORY[0x270F29BB0](@"NeedsActivityRingExplanation", a1, @"com.apple.nanolifestyle");
}

uint64_t FIUIHasPresentedRingExplanation()
{
  return MEMORY[0x270F29B88](@"com.apple.nanolifestyle", @"DidShowActivityRingExplanation");
}

uint64_t FIUISetHasPresentedRingExplanation()
{
  return MEMORY[0x270F29BB0](@"DidShowActivityRingExplanation", 1, @"com.apple.nanolifestyle");
}

BOOL FIUIIsWheelchairUserForWheelchairUse(uint64_t a1)
{
  return a1 == 2;
}

uint64_t FIUIUserHasAcceptedSpartanConsent()
{
  return MEMORY[0x270F29B90](@"com.apple.nanolifestyle", @"UserHasAcceptedSpartanConsent", 0);
}

uint64_t FIUISetUserHasAcceptedSpartanConsent(uint64_t a1)
{
  return MEMORY[0x270F29BB0](@"UserHasAcceptedSpartanConsent", a1, @"com.apple.nanolifestyle");
}

id FIUIApplicationIconForBundleIDAndVariant(uint64_t a1, uint64_t a2)
{
  dispatch_semaphore_t v3 = [MEMORY[0x263F01868] applicationProxyForIdentifier:a1];
  BOOL v4 = [v3 iconDataForVariant:a2];
  if (v4 && (uint64_t v5 = LICreateIconFromCachedBitmap()) != 0)
  {
    id v6 = (CGImage *)v5;
    id v7 = objc_alloc(MEMORY[0x263F827E8]);
    intptr_t v8 = [MEMORY[0x263F82B60] mainScreen];
    [v8 scale];
    uint64_t v9 = objc_msgSend(v7, "initWithCGImage:scale:orientation:", v6, 0);

    CGImageRelease(v6);
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

id FIUICircularImage(void *a1, CGFloat a2)
{
  id v3 = a1;
  v8.width = a2;
  v8.height = a2;
  UIGraphicsBeginImageContextWithOptions(v8, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  [v3 setFill];

  v9.origin.double x = 0.0;
  v9.origin.y = 0.0;
  v9.size.width = a2;
  v9.size.height = a2;
  CGContextFillEllipseInRect(CurrentContext, v9);
  uint64_t v5 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return v5;
}

id FIUICircularGradientImage(void *a1, void *a2, CGFloat a3)
{
  void v18[2] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a1;
  v20.width = a3;
  v20.height = a3;
  UIGraphicsBeginImageContextWithOptions(v20, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextBeginPath(CurrentContext);
  v23.origin.double x = 0.0;
  v23.origin.y = 0.0;
  v23.size.width = a3;
  v23.size.height = a3;
  CGContextAddEllipseInRect(CurrentContext, v23);
  CGContextClosePath(CurrentContext);
  CGContextClip(CurrentContext);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  id v9 = v6;
  uint64_t v10 = [v9 CGColor];

  v18[0] = v10;
  id v11 = v5;
  uint64_t v12 = [v11 CGColor];

  v18[1] = v12;
  CFArrayRef v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];
  uint64_t v14 = CGGradientCreateWithColors(DeviceRGB, v13, 0);
  CGFloat v15 = a3 * 0.5 * 0.363970234;
  v21.y = a3 * 0.5 + v15;
  v22.y = a3 * 0.5 - v15;
  v21.double x = 0.0;
  v22.double x = a3;
  CGContextDrawLinearGradient(CurrentContext, v14, v21, v22, 0);
  float v16 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  CGColorSpaceRelease(DeviceRGB);
  CGGradientRelease(v14);

  return v16;
}

id FIUICircularWorkoutGradientImage(CGFloat a1)
{
  return FIUICircularWorkoutGradientImageWithGoal(0, a1);
}

id FIUICircularWorkoutGradientImageWithGoal(uint64_t a1, CGFloat a2)
{
  BOOL v4 = [MEMORY[0x263F825C8] colorWithRed:0.0823529412 green:0.109803922 blue:0.00784313725 alpha:1.0];
  id v5 = [MEMORY[0x263F825C8] colorWithRed:0.145098039 green:0.196078431 blue:0.0666666667 alpha:1.0];
  if (a1 == 3)
  {
    uint64_t v6 = [MEMORY[0x263F825C8] colorWithRed:0.290196078 green:0.0196078431 blue:0.0941176471 alpha:1.0];

    id v7 = (void *)MEMORY[0x263F825C8];
    double v10 = 0.254901961;
    double v11 = 1.0;
    double v8 = 0.0196078431;
    double v9 = 0.0823529412;
  }
  else
  {
    if (a1 == 2)
    {
      uint64_t v6 = [MEMORY[0x263F825C8] colorWithRed:0.145098039 green:0.133333333 blue:0.0196078431 alpha:1.0];

      id v7 = (void *)MEMORY[0x263F825C8];
      double v10 = 0.223529412;
      double v8 = 0.2;
      double v9 = 0.031372549;
    }
    else
    {
      if (a1 != 1) {
        goto LABEL_9;
      }
      uint64_t v6 = [MEMORY[0x263F825C8] colorWithRed:0.0 green:0.105882353 blue:0.141176471 alpha:1.0];

      id v7 = (void *)MEMORY[0x263F825C8];
      double v8 = 0.17254902;
      double v9 = 0.22745098;
      double v10 = 0.0;
    }
    double v11 = 1.0;
  }
  uint64_t v12 = [v7 colorWithRed:v10 green:v8 blue:v9 alpha:v11];
  BOOL v4 = (void *)v6;

  id v5 = (void *)v12;
LABEL_9:
  CFArrayRef v13 = FIUICircularGradientImage(v4, v5, a2);

  return v13;
}

BOOL FIUIIsZero(double a1)
{
  return fabs(a1) < 2.22044605e-16;
}

BOOL FIUIIsEqual(double a1, double a2)
{
  return vabdd_f64(a1, a2) < 2.22044605e-16;
}

uint64_t FIUIRandomInteger(uint64_t a1, uint64_t a2)
{
  return arc4random() % (a2 - a1) + a1;
}

double FIUIRoundToNearest(double a1, double a2)
{
  return round(a1 / a2) * a2;
}

double FIUIMidpointOfBounds(double a1, double a2, double a3)
{
  return a3 * 0.5;
}

double FIUITimeLabelCorner()
{
  return 2.5;
}

uint64_t FIUIIsBacktrackIntegrationEnabled()
{
  return MEMORY[0x270F29B80](*MEMORY[0x263F3D1B0], @"BacktrackIntegrationEnabled", 1);
}

uint64_t FIUISetBacktrackIntegrationEnabled(uint64_t a1)
{
  return MEMORY[0x270F29BA8](@"BacktrackIntegrationEnabled", a1, *MEMORY[0x263F3D1B0]);
}

id FIUIColorForCurrentContrastMode(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = objc_alloc(MEMORY[0x263F825C8]);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __FIUIColorForCurrentContrastMode_block_invoke;
  v10[3] = &unk_2644A7EA0;
  id v11 = v4;
  id v12 = v3;
  id v6 = v3;
  id v7 = v4;
  double v8 = (void *)[v5 initWithDynamicProvider:v10];

  return v8;
}

id __FIUIColorForCurrentContrastMode_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 accessibilityContrast];
  uint64_t v4 = 40;
  if (v3 == 1) {
    uint64_t v4 = 32;
  }
  id v5 = *(void **)(a1 + v4);
  return v5;
}

void __getCMCalorieUserInfoClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("CMCalorieUserInfo");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCMCalorieUserInfoClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getCMCalorieUserInfoClass_block_invoke_cold_1();
    CoreMotionLibrary();
  }
}

void CoreMotionLibrary()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 0;
  if (!CoreMotionLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x263EF8330];
    void v1[2] = 3221225472;
    v1[3] = __CoreMotionLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_2644A7EE8;
    uint64_t v3 = 0;
    CoreMotionLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!CoreMotionLibraryCore_frameworkLibrary)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __CoreMotionLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreMotionLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getCMNatalimeterClass_block_invoke(uint64_t a1)
{
  CoreMotionLibrary();
  Class result = objc_getClass("CMNatalimeter");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCMNatalimeterClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getCMNatalimeterClass_block_invoke_cold_1();
    return __getCNContactStoreClass_block_invoke(v3);
  }
  return result;
}

Class __getCNContactStoreClass_block_invoke(uint64_t a1)
{
  ContactsLibrary();
  Class result = objc_getClass("CNContactStore");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCNContactStoreClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getCNContactStoreClass_block_invoke_cold_1();
    return (Class)ContactsLibrary();
  }
  return result;
}

uint64_t ContactsLibrary()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!ContactsLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = __ContactsLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_2644A7F20;
    uint64_t v5 = 0;
    ContactsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = ContactsLibraryCore_frameworkLibrary;
  id v1 = (void *)v3[0];
  if (!ContactsLibraryCore_frameworkLibrary)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __ContactsLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ContactsLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getCNContactFormatterClass_block_invoke(uint64_t a1)
{
  ContactsLibrary();
  Class result = objc_getClass("CNContactFormatter");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCNContactFormatterClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getCNContactFormatterClass_block_invoke_cold_1();
    return (Class)__getCNContactNicknameKeySymbolLoc_block_invoke(v3);
  }
  return result;
}

void *__getCNContactNicknameKeySymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)ContactsLibrary();
  Class result = dlsym(v2, "CNContactNicknameKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCNContactNicknameKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getCNContactGivenNameKeySymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)ContactsLibrary();
  Class result = dlsym(v2, "CNContactGivenNameKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCNContactGivenNameKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getCNContactEmailAddressesKeySymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)ContactsLibrary();
  Class result = dlsym(v2, "CNContactEmailAddressesKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCNContactEmailAddressesKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getCNContactPhoneNumbersKeySymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)ContactsLibrary();
  Class result = dlsym(v2, "CNContactPhoneNumbersKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCNContactPhoneNumbersKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getIntlUtilityClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!IntlPreferencesLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    void v4[2] = 3221225472;
    v4[3] = __IntlPreferencesLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_2644A7F38;
    uint64_t v6 = 0;
    IntlPreferencesLibraryCore_frameworkLibrary = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!IntlPreferencesLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("IntlUtility");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)__getIntlUtilityClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getIntlUtilityClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __IntlPreferencesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  IntlPreferencesLibraryCore_frameworkLibrary = result;
  return result;
}

id _NoDataLabel()
{
  id v0 = objc_alloc_init(MEMORY[0x263F828E0]);
  id v1 = [MEMORY[0x263F81708] systemFontOfSize:12.0];
  [v0 setFont:v1];

  [v0 setLineBreakMode:0];
  [v0 setNumberOfLines:0];
  return v0;
}

double FIUIZoneDefaultPaceForDistanceUnit(uint64_t a1)
{
  double result = 330.0;
  if (a1 != 2) {
    double result = 0.0;
  }
  if (a1 == 3) {
    return 540.0;
  }
  return result;
}

double FIUIZoneMinPaceForDistanceUnit(uint64_t a1)
{
  double result = 180.0;
  if (a1 != 2) {
    double result = 0.0;
  }
  if (a1 == 3) {
    return 300.0;
  }
  return result;
}

double FIUIZoneMaxPaceForDistanceUnit(uint64_t a1)
{
  double result = 450.0;
  if (a1 != 2) {
    double result = 0.0;
  }
  if (a1 == 3) {
    return 720.0;
  }
  return result;
}

double FIUIZoneMinPaceRangeForDistanceUnit(uint64_t a1)
{
  double result = 0.0;
  if (a1 == 2) {
    double result = 20.0;
  }
  if (a1 == 3) {
    return 30.0;
  }
  return result;
}

id FIUIValidActivityTypesForPaceAlarms()
{
  v3[1] = *MEMORY[0x263EF8340];
  id v0 = +[FIUIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:37 isIndoor:0 metadata:MEMORY[0x263EFFA78]];
  v3[0] = v0;
  id v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v3 count:1];

  return v1;
}

void sub_21E456554(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_21E456FAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E4571BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id FIUIWorkoutImageOnPill(void *a1, uint64_t a2, double a3)
{
  long long v4 = FIUIStaticWorkoutIconImage(a1, a2);
  [v4 size];
  CGFloat v6 = v5 + a3 * 2.0;
  uint64_t v7 = [MEMORY[0x263F825C8] colorWithRed:0.847058824 green:1.0 blue:0.0 alpha:1.0];
  double v8 = [MEMORY[0x263F825C8] colorWithRed:0.6 green:1.0 blue:0.0 alpha:1.0];
  double v9 = FIUICircularGradientImage(v7, v8, v6);
  v17.width = v6;
  v17.height = v6;
  UIGraphicsBeginImageContextWithOptions(v17, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  objc_msgSend(v9, "drawInRect:", 0.0, 0.0, v6, v6);
  [v4 size];
  double v12 = v11;
  [v4 size];
  objc_msgSend(v4, "drawInRect:", a3, a3, v12, v13);
  CGContextRestoreGState(CurrentContext);
  uint64_t v14 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v14;
}

id FIUIStaticScalableWorkoutIconImageWithPadding(void *a1, int a2)
{
  uint64_t v3 = _activityTypePrefix(a1);
  long long v4 = @"NoPadding";
  if (a2) {
    long long v4 = &stru_26CF5F1B8;
  }
  double v5 = [NSString stringWithFormat:@"%@%@", v3, v4];
  CGFloat v6 = (void *)MEMORY[0x263F827E8];
  uint64_t v7 = _fitnessUIBundle();
  double v8 = [v6 imageNamed:v5 inBundle:v7];

  return v8;
}

double FIUISizeForIconSize(uint64_t a1)
{
  switch(a1)
  {
    case 1:
      double result = 26.0;
      break;
    case 2:
      double result = 28.0;
      break;
    case 3:
      double result = 31.0;
      break;
    case 4:
      double result = 35.0;
      break;
    case 5:
      double v1 = 42.0;
      goto LABEL_9;
    case 6:
    case 7:
      double v1 = 56.0;
LABEL_9:
      double result = v1;
      break;
    case 8:
      double result = *MEMORY[0x263F001B0];
      break;
    default:
      double result = 24.0;
      break;
  }
  return result;
}

uint64_t __FIUIStaticWorkoutIconImage_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:", 0.0, 0.0, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

id FIUIStaticScalableWorkoutIconImage(void *a1)
{
  return FIUIStaticScalableWorkoutIconImageWithPadding(a1, 1);
}

__CFString *FIUIWorkoutIconSizeDescription(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 7) {
    return @"extra extra small";
  }
  else {
    return off_2644A8080[a1 - 1];
  }
}

id _kilocalorieUnit()
{
  if (_kilocalorieUnit_onceToken != -1) {
    dispatch_once(&_kilocalorieUnit_onceToken, &__block_literal_global_425);
  }
  id v0 = (void *)_kilocalorieUnit_kilocalorieUnit;
  return v0;
}

uint64_t ___kilocalorieUnit_block_invoke()
{
  _kilocalorieUnit_kilocalorieUnit = [MEMORY[0x263F0A830] kilocalorieUnit];
  return MEMORY[0x270F9A758]();
}

void sub_21E459414(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t FIUIDeepBreathingShouldOptimizePetalCount()
{
  if (FIUIDeepBreathingShouldOptimizePetalCount_onceToken != -1) {
    dispatch_once(&FIUIDeepBreathingShouldOptimizePetalCount_onceToken, &__block_literal_global_8);
  }
  return FIUIDeepBreathingShouldOptimizePetalCount___shouldOptimize;
}

uint64_t __FIUIDeepBreathingShouldOptimizePetalCount_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  FIUIDeepBreathingShouldOptimizePetalCount___shouldOptimize = result;
  return result;
}

CFIndex FIUIDeepBreathingSelectedHapticLevel()
{
  Boolean keyExistsAndHasValidFormat = 0;
  CFIndex result = CFPreferencesGetAppIntegerValue(@"HapticLevel", @"com.apple.DeepBreathing", &keyExistsAndHasValidFormat);
  if (!keyExistsAndHasValidFormat) {
    return 2;
  }
  return result;
}

double FIUIDeepBreathingBreathsPerMinute()
{
  Boolean keyExistsAndHasValidFormat = 0;
  double result = (double)CFPreferencesGetAppIntegerValue(@"BreathRate", @"com.apple.DeepBreathing", &keyExistsAndHasValidFormat);
  if (!keyExistsAndHasValidFormat) {
    return 7.0;
  }
  return result;
}

uint64_t FIUIDeepBreathingSessionMinutesDefault()
{
  *(_WORD *)Boolean keyExistsAndHasValidFormat = 0;
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"DefaultSessionMinutes", @"com.apple.DeepBreathing", &keyExistsAndHasValidFormat[1]);
  CFIndex v1 = CFPreferencesGetAppIntegerValue(@"UseLastDuration", @"com.apple.DeepBreathing", keyExistsAndHasValidFormat);
  if (AppIntegerValue <= 1) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = AppIntegerValue;
  }
  if (!v1) {
    uint64_t v2 = 1;
  }
  if (keyExistsAndHasValidFormat[0]) {
    BOOL v3 = keyExistsAndHasValidFormat[1] == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3) {
    return 1;
  }
  else {
    return v2;
  }
}

double FIUIDeepBreathingInhaleExhaleRatio()
{
  Boolean keyExistsAndHasValidFormat = 0;
  double result = (double)CFPreferencesGetAppIntegerValue(@"InhaleExhaleRatio", @"com.apple.DeepBreathing", &keyExistsAndHasValidFormat);
  if (!keyExistsAndHasValidFormat) {
    return 0.666666667;
  }
  return result;
}

double FIUIDeepBreathingInhaleBreathFraction()
{
  Boolean keyExistsAndHasValidFormat = 0;
  double result = 1.0
         - 1.0
         / ((double)CFPreferencesGetAppIntegerValue(@"InhaleExhaleRatio", @"com.apple.DeepBreathing", &keyExistsAndHasValidFormat)+ 1.0);
  if (!keyExistsAndHasValidFormat) {
    return 0.4;
  }
  return result;
}

double FIUIDeepBreathingFullBreathDuration(double a1)
{
  return 60.0 / a1;
}

double FIUIDeepBreathingInhaleDuration(double a1)
{
  Boolean keyExistsAndHasValidFormat = 0;
  double v1 = 60.0 / a1;
  double v2 = 1.0
     - 1.0
     / ((double)CFPreferencesGetAppIntegerValue(@"InhaleExhaleRatio", @"com.apple.DeepBreathing", &keyExistsAndHasValidFormat)+ 1.0);
  if (!keyExistsAndHasValidFormat) {
    double v2 = 0.4;
  }
  return v1 * v2;
}

double FIUIDeepBreathingExhaleDuration(double a1)
{
  Boolean keyExistsAndHasValidFormat = 0;
  double v1 = 60.0 / a1;
  double v2 = 1.0
     / ((double)CFPreferencesGetAppIntegerValue(@"InhaleExhaleRatio", @"com.apple.DeepBreathing", &keyExistsAndHasValidFormat)+ 1.0)+ -1.0+ 1.0;
  if (!keyExistsAndHasValidFormat) {
    double v2 = 0.6;
  }
  return v1 * v2;
}

uint64_t FIUIDeepBreathingOnRampNumberOfBreaths()
{
  return 2;
}

double FIUIDeepBreathingOnRampFullBreathDuration()
{
  return 5.0;
}

double FIUIDeepBreathingOnRampInhaleDuration()
{
  Boolean keyExistsAndHasValidFormat = 0;
  double result = (1.0
          - 1.0
          / ((double)CFPreferencesGetAppIntegerValue(@"InhaleExhaleRatio", @"com.apple.DeepBreathing", &keyExistsAndHasValidFormat)+ 1.0))* 5.0;
  if (!keyExistsAndHasValidFormat) {
    return 2.0;
  }
  return result;
}

double FIUIDeepBreathingOnRampExhaleDuration()
{
  Boolean keyExistsAndHasValidFormat = 0;
  double result = (1.0
          / ((double)CFPreferencesGetAppIntegerValue(@"InhaleExhaleRatio", @"com.apple.DeepBreathing", &keyExistsAndHasValidFormat)+ 1.0)+ -1.0+ 1.0)* 5.0;
  if (!keyExistsAndHasValidFormat) {
    return 3.0;
  }
  return result;
}

double FIUIDeepBreathingPetalCountForMinutesRemaining(double a1)
{
  return a1 + -1.0 + 6.0;
}

double FIUIDeepBreathingPetalCenter(uint64_t a1, int a2, double a3, double a4, double a5)
{
  double v5 = 6.28318531 / a3 * (double)a1;
  double v6 = -v5;
  if (!a2) {
    double v6 = v5;
  }
  return __sincos_stret(v6 + a5).__sinval * a4;
}

id _FIUIImageForPetalColor(uint64_t a1)
{
  v35[2] = *MEMORY[0x263EF8340];
  double v2 = [MEMORY[0x263F157D0] layer];
  objc_msgSend(v2, "setFrame:", 0.0, 0.0, 750.0, 20.0);
  objc_msgSend(v2, "setStartPoint:", 0.0, 0.5);
  objc_msgSend(v2, "setEndPoint:", 1.0, 0.5);
  switch(a1)
  {
    case 0:
      BOOL v3 = [MEMORY[0x263F825C8] colorWithRed:0.254901961 green:0.631372549 blue:0.690196078 alpha:1.0];
      long long v4 = (void *)MEMORY[0x263F825C8];
      double v5 = 0.411764706;
      double v6 = 0.850980392;
      double v7 = 0.62745098;
      goto LABEL_9;
    case 1:
      BOOL v3 = [MEMORY[0x263F825C8] colorWithRed:0.729411765 green:0.0 blue:1.0 alpha:1.0];
      long long v4 = (void *)MEMORY[0x263F825C8];
      double v6 = 0.619607843;
      double v5 = 1.0;
      goto LABEL_6;
    case 2:
      BOOL v3 = [MEMORY[0x263F825C8] colorWithRed:1.0 green:0.980392157 blue:0.0 alpha:1.0];
      long long v4 = (void *)MEMORY[0x263F825C8];
      double v5 = 0.819607843;
      double v6 = 0.305882353;
LABEL_6:
      double v7 = 0.0;
      goto LABEL_9;
    case 3:
      BOOL v3 = [MEMORY[0x263F825C8] colorWithRed:0.203921569 green:0.22745098 blue:0.670588235 alpha:1.0];
      long long v4 = (void *)MEMORY[0x263F825C8];
      double v5 = 0.482352941;
      double v7 = 0.0431372549;
      double v6 = 0.0;
      goto LABEL_9;
    case 4:
      BOOL v3 = [MEMORY[0x263F825C8] colorWithRed:0.00392156863 green:0.392156863 blue:0.031372549 alpha:1.0];
      long long v4 = (void *)MEMORY[0x263F825C8];
      double v6 = 0.658823529;
      double v7 = 0.333333333;
      double v5 = 1.0;
LABEL_9:
      double v8 = [v4 colorWithRed:v5 green:v6 blue:v7 alpha:1.0];
      goto LABEL_14;
    case 5:
      double v9 = [MEMORY[0x263F23950] energyColors];
      BOOL v3 = [v9 gradientDarkColor];

      double v10 = [MEMORY[0x263F23950] energyColors];
      goto LABEL_13;
    case 6:
      double v11 = [MEMORY[0x263F23950] briskColors];
      BOOL v3 = [v11 gradientDarkColor];

      double v10 = [MEMORY[0x263F23950] briskColors];
      goto LABEL_13;
    case 7:
      double v12 = [MEMORY[0x263F23950] sedentaryColors];
      BOOL v3 = [v12 gradientDarkColor];

      double v10 = [MEMORY[0x263F23950] sedentaryColors];
LABEL_13:
      double v13 = v10;
      double v8 = [v10 gradientLightColor];

      goto LABEL_14;
    case 8:
      id v14 = [MEMORY[0x263F825C8] redColor];
      id v15 = [MEMORY[0x263F825C8] purpleColor];
      id v25 = [MEMORY[0x263F825C8] redColor];
      v34[0] = [v25 CGColor];
      id v26 = [MEMORY[0x263F825C8] orangeColor];
      v34[1] = [v26 CGColor];
      id v27 = [MEMORY[0x263F825C8] yellowColor];
      v34[2] = [v27 CGColor];
      id v28 = [MEMORY[0x263F825C8] greenColor];
      v34[3] = [v28 CGColor];
      id v29 = [MEMORY[0x263F825C8] blueColor];
      v34[4] = [v29 CGColor];
      id v30 = [MEMORY[0x263F825C8] purpleColor];
      v34[5] = [v30 CGColor];
      uint64_t v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:6];
      [v2 setColors:v31];

      [v2 setLocations:&unk_26CF74950];
      goto LABEL_15;
    default:
      double v8 = 0;
      BOOL v3 = 0;
LABEL_14:
      [v2 setLocations:&unk_26CF74938];
      id v14 = v3;
      v35[0] = [v14 CGColor];
      id v15 = v8;
      v35[1] = [v15 CGColor];
      float v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:2];
      [v2 setColors:v16];

LABEL_15:
      id v17 = objc_alloc_init(MEMORY[0x263F827B0]);
      [v17 setScale:1.0];
      [v17 setOpaque:1];
      [v17 setPreferredRange:-1];
      id v18 = objc_alloc(MEMORY[0x263F827A0]);
      [v2 frame];
      CGPoint v21 = objc_msgSend(v18, "initWithSize:format:", v17, v19, v20);
      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = ___FIUIImageForPetalColor_block_invoke;
      v32[3] = &unk_2644A80D8;
      id v33 = v2;
      id v22 = v2;
      CGRect v23 = [v21 imageWithActions:v32];

      return v23;
  }
}

id FIUIDeepBreathingGradientImageDataForPetalColor(uint64_t a1)
{
  _FIUIImageForPetalColor(a1);
  double v1 = (UIImage *)objc_claimAutoreleasedReturnValue();
  double v2 = UIImagePNGRepresentation(v1);

  return v2;
}

id GetFormatAndHourFieldRangesFor_ha(void *a1, uint64_t *a2, uint64_t *a3)
{
  double v5 = (void *)MEMORY[0x263F08790];
  id v6 = a1;
  double v7 = [v5 dateFormatFromTemplate:@"ha" options:0 locale:v6];
  double v8 = [MEMORY[0x263F08790] dateFormatFromTemplate:@"h" options:0 locale:v6];
  double v9 = [MEMORY[0x263F08790] dateFormatFromTemplate:@"a" options:0 locale:v6];

  double v10 = _GetModifiedFormatFromFormat(v7);
  double v11 = _GetModifiedFormatFromFormat(v8);
  double v12 = _GetModifiedFormatFromFormat(v9);
  uint64_t v13 = [v10 rangeOfString:v11];
  *a2 = v13;
  a2[1] = v14;
  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v15 = [v10 rangeOfString:@"h"];
    *a2 = v15;
    a2[1] = v16;
    if (v15 == 0x7FFFFFFFFFFFFFFFLL)
    {
      *a2 = [v10 rangeOfString:@"hh"];
      a2[1] = v17;
    }
  }
  uint64_t v18 = [v10 rangeOfString:v12];
  *a3 = v18;
  a3[1] = v19;
  if (v18 == 0x7FFFFFFFFFFFFFFFLL)
  {
    *a3 = [v10 rangeOfString:@"a"];
    a3[1] = v20;
  }

  return v7;
}

id _GetModifiedFormatFromFormat(void *a1)
{
  id v1 = a1;
  double v2 = [MEMORY[0x263F089D8] stringWithCapacity:10];
  [v2 insertString:v1 atIndex:0];
  int v3 = [v2 length];
  if (v3 >= 1)
  {
    uint64_t v4 = 0;
    int v5 = 0;
    uint64_t v6 = v3;
    do
    {
      __int16 v12 = 0;
      int v7 = [v2 characterAtIndex:v4];
      if (v7 == 39)
      {
        v5 ^= 1u;
      }
      else
      {
        BOOL v9 = (v7 - 65) < 0x3A && (v7 - 97) < 0xFFFFFFFA;
        if ((v5 & v9) == 1)
        {
          __int16 v12 = v7 - 8257;
          int v5 = 1;
          double v10 = [NSString stringWithCharacters:&v12 length:1];
          objc_msgSend(v2, "replaceCharactersInRange:withString:", v4, 1, v10);
        }
      }
      ++v4;
    }
    while (v6 != v4);
  }

  return v2;
}

id GetFormatAndDateFieldRangesFor_yMMMMd(void *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4)
{
  int v7 = (void *)MEMORY[0x263F08790];
  id v8 = a1;
  BOOL v9 = [v7 dateFormatFromTemplate:@"yMMMMd" options:0 locale:v8];
  double v10 = [MEMORY[0x263F08790] dateFormatFromTemplate:@"y" options:0 locale:v8];
  double v11 = [MEMORY[0x263F08790] dateFormatFromTemplate:@"MMMM" options:0 locale:v8];
  __int16 v12 = [MEMORY[0x263F08790] dateFormatFromTemplate:@"d" options:0 locale:v8];

  id v41 = v9;
  uint64_t v13 = _GetModifiedFormatFromFormat(v9);
  v39 = v10;
  uint64_t v14 = _GetModifiedFormatFromFormat(v10);
  uint64_t v15 = _GetModifiedFormatFromFormat(v11);
  uint64_t v16 = _GetModifiedFormatFromFormat(v12);
  uint64_t v17 = [v13 rangeOfString:v14];
  *a2 = v17;
  a2[1] = v18;
  if (v17 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v19 = objc_msgSend(v13, "rangeOfString:", @"yyyy", v39);
    *a2 = v19;
    a2[1] = v20;
    if (v19 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v21 = [v13 rangeOfString:@"yy"];
      *a2 = v21;
      a2[1] = v22;
      if (v21 == 0x7FFFFFFFFFFFFFFFLL)
      {
        *a2 = [v13 rangeOfString:@"y"];
        a2[1] = v23;
      }
    }
  }
  uint64_t v24 = objc_msgSend(v13, "rangeOfString:", v15, v39);
  *a3 = v24;
  a3[1] = v25;
  if (v24 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v26 = [v15 length];
    if (objc_msgSend(v15, "replaceOccurrencesOfString:withString:options:range:", @"MMMM", @"LLLL", 0, 0, v26)|| objc_msgSend(v15, "replaceOccurrencesOfString:withString:options:range:", @"LLLL", @"MMMM", 0, 0, v26))
    {
      uint64_t v27 = [v13 rangeOfString:v15];
      *a3 = v27;
      a3[1] = v28;
    }
    else
    {
      uint64_t v27 = *a3;
    }
    if (v27 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v29 = [v13 rangeOfString:@"MMMM"];
      *a3 = v29;
      a3[1] = v30;
      if (v29 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v31 = [v13 rangeOfString:@"LLLL"];
        *a3 = v31;
        a3[1] = v32;
        if (v31 == 0x7FFFFFFFFFFFFFFFLL)
        {
          *a3 = [v13 rangeOfString:@"M月"];
          a3[1] = v33;
        }
      }
    }
  }
  uint64_t v34 = [v13 rangeOfString:v16];
  *a4 = v34;
  a4[1] = v35;
  if (v34 == 0x7FFFFFFFFFFFFFFFLL)
  {
    *a4 = [v13 rangeOfString:@"dd"];
    a4[1] = v36;
    if (*a2 == 0x7FFFFFFFFFFFFFFFLL)
    {
      *a4 = [v13 rangeOfString:@"d"];
      a4[1] = v37;
    }
  }

  return v41;
}

id _CachedCurrentCalendar()
{
  if (_CachedCurrentCalendar_onceToken != -1) {
    dispatch_once(&_CachedCurrentCalendar_onceToken, &__block_literal_global_378);
  }
  id v0 = (void *)_CachedCurrentCalendar___calendar;
  return v0;
}

uint64_t FIUIHKQuantityForDistanceUnitAndType()
{
  return MEMORY[0x270F299E8]();
}

uint64_t FIUIPaceFormatForWorkoutActivityType(void *a1)
{
  id v1 = [a1 workoutActivityType];
  uint64_t v2 = FIPaceFormatForWorkoutActivityType();

  return v2;
}

uint64_t FIUISpeedForDurationOverDistance()
{
  return MEMORY[0x270F29B50]();
}

uint64_t FIUICurrentLocaleUsesMetricSystem()
{
  return MEMORY[0x270F29958]();
}

uint64_t FIUIDistanceUnitIsMetric()
{
  return MEMORY[0x270F29990]();
}

uint64_t FIUIHKUnitIsCalorieUnit()
{
  return MEMORY[0x270F299F8]();
}

__CFString *HKWorkoutMetricTypeDescription(unint64_t a1)
{
  if (a1 < 0x37 && ((0x7FFFFCFFFFFFFFuLL >> a1) & 1) != 0)
  {
    id v1 = off_2644A81F8[a1];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"INVALID_IDENTIFIER(%lu)", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

__CFString *FIUIHKWorkoutGoalTypeDescription(unint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"INVALID_IDENTIFIER(%lu)", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_2644A83B0[a1];
  }
  return v1;
}

uint64_t FIUIIsWorkoutTypePedestrianActivity(unint64_t a1)
{
  return (a1 < 0x35) & (0x10002001000000uLL >> a1);
}

uint64_t FIUISelectedPaceMetricType()
{
  if (FIUIShowAveragePace()) {
    return 8;
  }
  else {
    return 4;
  }
}

id _KeyValueStringFromDictionary(void *a1)
{
  id v1 = a1;
  uint64_t v2 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v1, "count"));
  int v3 = [v1 allKeys];
  uint64_t v4 = [v3 sortedArrayUsingComparator:&__block_literal_global_563];
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  double v11 = ___KeyValueStringFromDictionary_block_invoke_2;
  __int16 v12 = &unk_2644A81D8;
  id v13 = v2;
  id v14 = v1;
  id v5 = v1;
  id v6 = v2;
  [v4 enumerateObjectsUsingBlock:&v9];

  int v7 = objc_msgSend(v6, "componentsJoinedByString:", @" ", v9, v10, v11, v12);

  return v7;
}

void sub_21E45E1D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 160), 8);
  _Block_object_dispose((const void *)(v31 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

id FUArraySmallestValue(void *a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v1 = a1;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = 0;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v1);
        }
        int v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (!v4 || [*(id *)(*((void *)&v10 + 1) + 8 * i) compare:v4] == -1)
        {
          id v8 = v7;

          uint64_t v4 = v8;
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v3);
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

id FUArrayLargestValue(void *a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v1 = a1;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = 0;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v1);
        }
        int v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (!v4 || [*(id *)(*((void *)&v10 + 1) + 8 * i) compare:v4] == 1)
        {
          id v8 = v7;

          uint64_t v4 = v8;
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v3);
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

id _Font()
{
  if (_Font_onceToken != -1) {
    dispatch_once(&_Font_onceToken, &__block_literal_global_323);
  }
  id v0 = (void *)_Font_font;
  return v0;
}

void sub_21E464554(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)&STACK[0x208]);
  _Unwind_Resume(a1);
}

void sub_21E465140(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21E465298(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21E465E30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21E465FC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21E466170(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21E4662F0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_21E46742C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 104));
  _Unwind_Resume(a1);
}

uint64_t FIUIWorkoutSplitMeasurementSystemDescription()
{
  return MEMORY[0x270F29B70]();
}

double FIUIChartRelativePosition(double a1, double a2, double a3)
{
  double v3 = a3 - a2;
  if (v3 == 0.0) {
    return 0.0;
  }
  else {
    return (a1 - a2) / v3;
  }
}

double FIUIChartRelativePositionForYPlaneValue(double a1, double a2, double a3)
{
  double v3 = a2 - a3;
  if (v3 == 0.0) {
    return 0.0;
  }
  else {
    return (a1 - a3) / v3;
  }
}

double FIUIChartAbsolutePositionForYPlaneValue(void *a1, double a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  id v10 = a1;
  v14.origin.double x = a3;
  v14.origin.y = a4;
  v14.size.width = a5;
  v14.size.height = a6;
  CGRectGetHeight(v14);
  v15.origin.double x = a3;
  v15.origin.y = a4;
  v15.size.width = a5;
  v15.size.height = a6;
  CGRectGetMinY(v15);
  UIRoundToViewScale();
  double v12 = v11;

  return v12;
}

double FIUIChartRelativePositionForXPlaneValue(double a1, double a2, double a3)
{
  double v3 = a3 - a2;
  if (v3 == 0.0) {
    return 0.0;
  }
  else {
    return (a1 - a2) / v3;
  }
}

double FIUIChartAbsolutePositionForXPlaneValue(void *a1, double a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  id v10 = a1;
  v14.origin.double x = a3;
  v14.origin.y = a4;
  v14.size.width = a5;
  v14.size.height = a6;
  CGRectGetWidth(v14);
  v15.origin.double x = a3;
  v15.origin.y = a4;
  v15.size.width = a5;
  v15.size.height = a6;
  CGRectGetMinX(v15);
  UIRoundToViewScale();
  double v12 = v11;

  return v12;
}

uint64_t _FIUICPTimeFormatIs24HourMode()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  id v0 = (uint64_t (*)(void))get_CPTimeFormatIs24HourModeSymbolLoc_ptr;
  id v6 = get_CPTimeFormatIs24HourModeSymbolLoc_ptr;
  if (!get_CPTimeFormatIs24HourModeSymbolLoc_ptr)
  {
    v2[0] = MEMORY[0x263EF8330];
    v2[1] = 3221225472;
    v2[2] = __get_CPTimeFormatIs24HourModeSymbolLoc_block_invoke;
    void v2[3] = &unk_2644A7EC8;
    v2[4] = &v3;
    __get_CPTimeFormatIs24HourModeSymbolLoc_block_invoke((uint64_t)v2);
    id v0 = (uint64_t (*)(void))v4[3];
  }
  _Block_object_dispose(&v3, 8);
  if (!v0) {
    _FIUIUserContactFromAddressBook_cold_1();
  }
  return v0();
}

void sub_21E469F38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL _ZeroDateComponents(void *a1)
{
  id v1 = a1;
  BOOL v2 = (![v1 second] || objc_msgSend(v1, "second") == 0x7FFFFFFFFFFFFFFFLL)
    && (![v1 minute] || objc_msgSend(v1, "minute") == 0x7FFFFFFFFFFFFFFFLL)
    && (![v1 hour] || objc_msgSend(v1, "hour") == 0x7FFFFFFFFFFFFFFFLL)
    && (![v1 day] || objc_msgSend(v1, "day") == 0x7FFFFFFFFFFFFFFFLL)
    && (![v1 weekOfYear] || objc_msgSend(v1, "weekOfYear") == 0x7FFFFFFFFFFFFFFFLL)
    && (![v1 month] || objc_msgSend(v1, "month") == 0x7FFFFFFFFFFFFFFFLL)
    && (![v1 year] || objc_msgSend(v1, "year") == 0x7FFFFFFFFFFFFFFFLL);

  return v2;
}

uint64_t __AppSupportLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AppSupportLibraryCore_frameworkLibrary = result;
  return result;
}

__CFString *NLWorkoutSplitStorageTypeString(uint64_t a1)
{
  id v1 = @"NLWorkoutSplitsTypeNone";
  if (a1 == 1) {
    id v1 = @"NLWorkoutSplitsTypeDistance";
  }
  if (a1 == 2) {
    return @"NLWorkoutSplitsTypeTime";
  }
  else {
    return v1;
  }
}

id _FIUIOutdoorRunningAveragePaceSettings()
{
  v8[2] = *MEMORY[0x263EF8340];
  id v0 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", 4);
  v7[0] = v0;
  v8[0] = MEMORY[0x263EFFA80];
  id v1 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", 8);
  v7[1] = v1;
  v8[1] = MEMORY[0x263EFFA88];
  BOOL v2 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  v5[0] = @"EnabledMetrics";
  v5[1] = @"MetricSettingOverrides";
  v6[0] = &unk_26CF74968;
  v6[1] = v2;
  uint64_t v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];

  return v3;
}

id _FIUIMigratedPaceSettingForActivityIfNeeded(void *a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [a1 objectForKeyedSubscript:v3];
  _HKInitializeLogging();
  uint64_t v5 = *MEMORY[0x263F09970];
  BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x263F09970], OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      int v10 = 138543362;
      id v11 = v3;
      _os_log_impl(&dword_21E433000, v5, OS_LOG_TYPE_DEFAULT, "[NanoHealthDataMigrator] Not migrating pace settings for activity key %{public}@ - user setting exists", (uint8_t *)&v10, 0xCu);
    }
    id v7 = v4;
  }
  else
  {
    if (v6)
    {
      int v10 = 138543362;
      id v11 = v3;
      _os_log_impl(&dword_21E433000, v5, OS_LOG_TYPE_DEFAULT, "[NanoHealthDataMigrator] Migrating pace settings for activity key %{public}@", (uint8_t *)&v10, 0xCu);
    }
    _FIUIOutdoorRunningAveragePaceSettings();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v8 = v7;

  return v8;
}

id _FIUIMigratedPaceSettings(void *a1)
{
  v18[1] = *MEMORY[0x263EF8340];
  id v1 = a1;
  BOOL v2 = (void *)[v1 mutableCopy];
  id v3 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", 37);
  v18[0] = v3;
  uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v11 = _FIUIMigratedPaceSettingForActivityIfNeeded(v1, v10);
        if (v11) {
          [v2 setObject:v11 forKeyedSubscript:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v2;
}

double FIUICalculateBMR(uint64_t a1, void *a2, void *a3, void *a4, void *a5, uint64_t a6)
{
  id v11 = (void *)MEMORY[0x263F0A830];
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = a2;
  long long v16 = [v11 gramUnitWithMetricPrefix:9];
  [v15 doubleValueForUnit:v16];
  double v18 = v17;

  uint64_t v19 = [MEMORY[0x263F0A830] gramUnitWithMetricPrefix:9];
  [v14 doubleValueForUnit:v19];
  double v21 = v20;

  uint64_t v22 = [MEMORY[0x263F0A830] meterUnitWithMetricPrefix:5];
  [v13 doubleValueForUnit:v22];
  double v24 = v23;

  uint64_t v25 = FIAgeInYearsForDateOfBirth();
  return _FIUICalculateBMR(a1, v25, a6, v18, v21, v24, 1.0);
}

id FIUIActivityLevelsForBMR(void *a1, double a2)
{
  id v3 = (void *)MEMORY[0x263F0A980];
  id v4 = a1;
  id v5 = [v3 sharedBehavior];
  uint64_t v6 = FIUIActivityLevelsForBMRAndIsStandalonePhoneFitnessMode([v5 isStandalonePhoneFitnessMode], v4, a2);

  return v6;
}

id FIUIActivityLevelsForBMRAndIsStandalonePhoneFitnessMode(int a1, void *a2, double a3)
{
  v23[3] = *MEMORY[0x263EF8340];
  double v3 = a3 * 0.2;
  double v4 = a3 * 0.375;
  double v5 = a3 * 0.55;
  BOOL v6 = a3 <= 0.0;
  double v7 = 300.0;
  if (!v6) {
    double v7 = v3;
  }
  double v8 = 600.0;
  if (!v6) {
    double v8 = v4;
  }
  double v9 = 900.0;
  if (!v6) {
    double v9 = v5;
  }
  if (a1) {
    double v10 = v7 * 0.4;
  }
  else {
    double v10 = v7;
  }
  if (a1) {
    double v11 = v8 * 0.4;
  }
  else {
    double v11 = v8;
  }
  if (a1) {
    double v12 = v9 * 0.4;
  }
  else {
    double v12 = v9;
  }
  id v13 = a2;
  [v13 roundedDailyMoveGoalForCalories:v10];
  id v15 = _QuantityWithCalories(v14);
  objc_msgSend(v13, "roundedDailyMoveGoalForCalories:", v11, v15);
  double v17 = _QuantityWithCalories(v16);
  v23[1] = v17;
  [v13 roundedDailyMoveGoalForCalories:v12];
  double v19 = v18;

  double v20 = _QuantityWithCalories(v19);
  void v23[2] = v20;
  double v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:3];

  return v21;
}

id _QuantityWithCalories(double a1)
{
  BOOL v2 = (void *)MEMORY[0x263F0A630];
  double v3 = [MEMORY[0x263F0A830] kilocalorieUnit];
  double v4 = [v2 quantityWithUnit:v3 doubleValue:a1];

  return v4;
}

id FIUIActivityLevelsForFitnessJr(void *a1, double a2, double a3, double a4, double a5, double a6)
{
  double v11 = (void *)MEMORY[0x263F0A980];
  id v12 = a1;
  id v13 = [v11 sharedBehavior];
  double v14 = FIUIActivityLevelsForFitnessJrAndIsStandalonePhoneFitnessMode([v13 isStandalonePhoneFitnessMode], v12, a2, a3, a4, a5, a6);

  return v14;
}

id FIUIActivityLevelsForFitnessJrAndIsStandalonePhoneFitnessMode(int a1, void *a2, double a3, double a4, double a5, double a6, double a7)
{
  v41[3] = *MEMORY[0x263EF8340];
  id v13 = (objc_class *)MEMORY[0x263F01720];
  id v14 = a2;
  id v15 = (void *)[[v13 alloc] initWithAge:(uint64_t)a3 gender:(uint64_t)a7 height:a6 weight:a5 condition:a4];
  id v40 = 0;
  unint64_t v16 = [MEMORY[0x263F01740] recommendedMoveMinutesForLevel:0 userInfo:v15 error:&v40];
  id v17 = v40;
  double v18 = (double)v16;
  id v39 = v17;
  unint64_t v19 = [MEMORY[0x263F01740] recommendedMoveMinutesForLevel:1 userInfo:v15 error:&v39];
  id v20 = v39;

  double v21 = (double)v19;
  id v38 = v20;
  unint64_t v22 = [MEMORY[0x263F01740] recommendedMoveMinutesForLevel:2 userInfo:v15 error:&v38];
  id v23 = v38;

  double v24 = v18 * 0.4;
  double v25 = v21 * 0.4;
  if (a1) {
    double v26 = v18 * 0.4;
  }
  else {
    double v26 = v18;
  }
  if (a1) {
    double v27 = v21 * 0.4;
  }
  else {
    double v27 = v21;
  }
  if (a1) {
    double v28 = (double)v22 * 0.4;
  }
  else {
    double v28 = (double)v22;
  }
  objc_msgSend(v14, "roundedDailyMoveGoalForMoveMinutes:", v26, (double)v22, v24, v25, (double)v22 * 0.4);
  uint64_t v30 = _QuantityWithMoveMinutes((unint64_t)v29);
  v41[0] = v30;
  [v14 roundedDailyMoveGoalForMoveMinutes:v27];
  uint64_t v32 = _QuantityWithMoveMinutes((unint64_t)v31);
  v41[1] = v32;
  [v14 roundedDailyMoveGoalForMoveMinutes:v28];
  double v34 = v33;

  uint64_t v35 = _QuantityWithMoveMinutes((unint64_t)v34);
  v41[2] = v35;
  uint64_t v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:3];

  return v36;
}

id _QuantityWithMoveMinutes(unint64_t a1)
{
  double v1 = (double)a1;
  BOOL v2 = (void *)MEMORY[0x263F0A630];
  double v3 = [MEMORY[0x263F0A830] minuteUnit];
  double v4 = [v2 quantityWithUnit:v3 doubleValue:v1];

  return v4;
}

double FIUIMininumMoveGoalInUserUnit(void *a1)
{
  double v1 = [a1 userActiveEnergyBurnedUnit];
  BOOL v2 = [MEMORY[0x263F0A830] kilocalorieUnit];
  int v3 = [v1 isEqual:v2];

  double result = 20.0;
  if (v3) {
    return 10.0;
  }
  return result;
}

double FIUIMaximumMoveGoalInUserUnit(void *a1)
{
  double v1 = [a1 userActiveEnergyBurnedUnit];
  BOOL v2 = [MEMORY[0x263F0A830] kilocalorieUnit];
  BOOL v3 = v1 == v2;

  return dbl_21E4D8FD0[v3];
}

double FIUIMoveGoalValueIncrementInUserUnit(void *a1)
{
  double v1 = [a1 userActiveEnergyBurnedUnit];
  BOOL v2 = [MEMORY[0x263F0A830] kilocalorieUnit];

  double result = 20.0;
  if (v1 == v2) {
    return 10.0;
  }
  return result;
}

double FIUIMininumMoveMinutesGoal()
{
  return 10.0;
}

double FIUIMaximumMoveMinutesGoal()
{
  return 1000.0;
}

double FIUIMoveMinutesGoalValueIncrement()
{
  return 10.0;
}

id FIUIComputeAttributesToFitStringsOnSingleLineWithMaximumWidth(void *a1, void *a2, double a3)
{
  return _FIUIComputeAttributesToFitStrings(a1, a2, 0, 0, 12.0, -0.75, 0.25, 0.9, a3, 0.0);
}

id _FIUIComputeAttributesToFitStrings(void *a1, void *a2, unsigned __int8 a3, int a4, double a5, double a6, double a7, double a8, double a9, double a10)
{
  v57[2] = *MEMORY[0x263EF8340];
  id v47 = a1;
  id v16 = a2;
  [v16 pointSize];
  double v18 = v17;
  if (a3)
  {
    double v19 = 1.79769313e308;
    uint64_t v20 = 3;
    double v21 = a9;
  }
  else
  {
    [v16 lineHeight];
    double v19 = v22;
    uint64_t v20 = 0;
    double v21 = 1.79769313e308;
  }
  id v23 = 0;
  uint64_t v24 = *MEMORY[0x263F814F0];
  uint64_t v48 = *MEMORY[0x263F81510];
  double v25 = 0.0;
  double v44 = a7;
LABEL_5:
  double v26 = v25 - a7;
  do
  {
    double v27 = v23;
    v56[0] = v24;
    double v28 = objc_msgSend(v16, "fu_fontWithSize:", v18);
    v56[1] = v48;
    v57[0] = v28;
    double v29 = [NSNumber numberWithDouble:v25];
    v57[1] = v29;
    id v23 = [NSDictionary dictionaryWithObjects:v57 forKeys:v56 count:2];

    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v30 = v47;
    uint64_t v31 = [v30 countByEnumeratingWithState:&v49 objects:v55 count:16];
    if (!v31)
    {
      id v39 = v30;
      goto LABEL_28;
    }
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v50;
    int v34 = 1;
    do
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v50 != v33) {
          objc_enumerationMutation(v30);
        }
        objc_msgSend(*(id *)(*((void *)&v49 + 1) + 8 * i), "boundingRectWithSize:options:attributes:context:", v20, v23, 0, v21, v19);
        if ((a3 & (ceil(v37) > a10)) != 0) {
          int v38 = 0;
        }
        else {
          int v38 = v34;
        }
        if (a3)
        {
          int v34 = v38;
        }
        else if (ceil(v36) > a9)
        {
          int v34 = 0;
        }
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v49 objects:v55 count:16];
    }
    while (v32);

    if (v34) {
      goto LABEL_29;
    }
    if (v26 >= a6)
    {
      double v25 = v26;
      a7 = v44;
      goto LABEL_5;
    }
    double v18 = v18 * a8;
  }
  while (v18 >= a5);
  if (!a4) {
    goto LABEL_29;
  }
  v53[0] = v24;
  id v39 = objc_msgSend(v16, "fu_fontWithSize:", a5);
  v53[1] = v48;
  v54[0] = v39;
  id v40 = [NSNumber numberWithDouble:a6];
  v54[1] = v40;
  uint64_t v41 = [NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:2];

  id v23 = (void *)v41;
LABEL_28:

LABEL_29:
  return v23;
}

id FIUIComputeAttributesToFitStringsOnSingleLineWithMaximumWidthAndMinimumFontSize(void *a1, void *a2, double a3, double a4)
{
  return _FIUIComputeAttributesToFitStrings(a1, a2, 0, 1, a3, -0.75, 0.25, 0.9, a4, 0.0);
}

id FIUIComputeAttributesToFitStringsInRectangle(void *a1, void *a2, double a3, double a4)
{
  return _FIUIComputeAttributesToFitStrings(a1, a2, 1u, 0, 12.0, -0.75, 0.1, 0.9, a3, a4);
}

uint64_t FIUILocalizedNameForIndoorAgnosticActivityType()
{
  return MEMORY[0x270F29AB0]();
}

uint64_t FIUILocalizedActivityNameWithWorkout()
{
  return MEMORY[0x270F29A90]();
}

uint64_t FIUILocalizedActivityNameWithFormattingPrefix()
{
  return MEMORY[0x270F29A80]();
}

uint64_t FIUILapsShortDescriptionWithLapCount()
{
  return MEMORY[0x270F29A58]();
}

uint64_t FIUIFlightsShortDescriptionWithFlightsCount()
{
  return MEMORY[0x270F299D0]();
}

uint64_t FIUIPowerShortDescriptionWithPower()
{
  return MEMORY[0x270F29AF8]();
}

uint64_t FIUILocalizedStrokeStyleName()
{
  return MEMORY[0x270F29AB8]();
}

uint64_t FIUILocalizedActivityNameComponentsWithFormatting()
{
  return MEMORY[0x270F29A70]();
}

uint64_t FIUILocalizedMachineName()
{
  return MEMORY[0x270F29AA0]();
}

double FIUIPinnedProgressValue(double a1)
{
  return fmin(fmax(a1, 0.0), 1.0);
}

double FIUIInterpolatedPoint(double a1, double a2, double a3, double a4, double a5)
{
  return a1 + fmin(fmax(a5, 0.0), 1.0) * (a3 - a1);
}

double FIUIInterpolatedSize(double a1, double a2, double a3, double a4, double a5)
{
  return a1 + fmin(fmax(a5, 0.0), 1.0) * (a3 - a1);
}

double FIUIInterpolatedRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  return a1 + fmin(fmax(a9, 0.0), 1.0) * (a5 - a1);
}

double _FUFractionOfSampleInInterval(void *a1, void *a2)
{
  id v3 = a2;
  double v4 = (objc_class *)MEMORY[0x263F08798];
  id v5 = a1;
  id v6 = [v4 alloc];
  double v7 = [v5 startDate];
  double v8 = [v5 endDate];

  double v9 = (void *)[v6 initWithStartDate:v7 endDate:v8];
  [v9 duration];
  double v11 = 0.0;
  if (fabs(v10) >= 2.22044605e-16)
  {
    id v12 = [v9 intersectionWithDateInterval:v3];
    [v12 duration];
    double v14 = v13;
    [v9 duration];
    double v11 = v14 / v15;
  }
  return v11;
}

id FUInterpolateQuantitySamplesOverDateIntervals(void *a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  double v19 = v3;
  if ([v3 count])
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v6 = [v3 firstObject];
    double v7 = [v6 quantity];
    double v8 = [v7 _unit];

    if ([v4 count])
    {
      unint64_t v9 = 0;
      do
      {
        double v10 = [MEMORY[0x263F0A630] quantityWithUnit:v8 doubleValue:0.0];
        [v5 addObject:v10];

        ++v9;
      }
      while (v9 < [v4 count]);
    }
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = v19;
    uint64_t v11 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v28 != v12) {
            objc_enumerationMutation(obj);
          }
          double v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          v26[0] = 0;
          v26[1] = v26;
          v26[2] = 0x2020000000;
          v26[3] = 0;
          double v15 = [v14 quantity];
          [v15 doubleValueForUnit:v8];
          uint64_t v17 = v16;

          v21[0] = MEMORY[0x263EF8330];
          v21[1] = 3221225472;
          v21[2] = __FUInterpolateQuantitySamplesOverDateIntervals_block_invoke;
          v21[3] = &unk_2644A8838;
          v21[4] = v14;
          uint64_t v24 = v26;
          id v22 = v5;
          uint64_t v25 = v17;
          id v23 = v8;
          [v4 enumerateObjectsUsingBlock:v21];

          _Block_object_dispose(v26, 8);
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v11);
    }
  }
  else
  {
    id v5 = (id)MEMORY[0x263EFFA68];
  }

  return v5;
}

void sub_21E472848(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __FUInterpolateQuantitySamplesOverDateIntervals_block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  double v7 = _FUFractionOfSampleInInterval(*(void **)(a1 + 32), a2);
  *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v7
                                                              + *(double *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                          + 24);
  if (v7 > 0.0)
  {
    double v8 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a3];
    unint64_t v9 = [MEMORY[0x263F0A630] quantityWithUnit:*(void *)(a1 + 48) doubleValue:v7 * *(double *)(a1 + 64)];
    double v10 = [v8 _quantityByAddingQuantity:v9];

    [*(id *)(a1 + 40) setObject:v10 atIndexedSubscript:a3];
  }
  if (*(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) > 1.0) {
    *a4 = 1;
  }
}

void FIUIStateMachineSetDiagnosticAndErrorHandler(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __FIUIStateMachineSetDiagnosticAndErrorHandler_block_invoke;
  void v15[3] = &unk_2644A88F0;
  id v7 = v6;
  id v17 = v7;
  id v8 = v5;
  id v16 = v8;
  id v9 = a1;
  [v9 setDiagnosticHandler:v15];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  void v12[2] = __FIUIStateMachineSetDiagnosticAndErrorHandler_block_invoke_278;
  v12[3] = &unk_2644A8918;
  id v13 = v8;
  id v14 = v7;
  id v10 = v8;
  id v11 = v7;
  [v9 setErrorHandler:v12];
}

void __FIUIStateMachineSetDiagnosticAndErrorHandler_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  _HKInitializeLogging();
  id v10 = (void *)*MEMORY[0x263F09970];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09970], OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v10;
    uint64_t v12 = [v7 label];
    id v13 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v14 = [v8 label];
    double v15 = [v9 label];
    uint64_t v16 = *(void *)(a1 + 32);
    int v17 = 138413314;
    double v18 = v12;
    __int16 v19 = 2112;
    uint64_t v20 = v13;
    __int16 v21 = 2112;
    id v22 = v14;
    __int16 v23 = 2112;
    uint64_t v24 = v15;
    __int16 v25 = 2112;
    uint64_t v26 = v16;
    _os_log_impl(&dword_21E433000, v11, OS_LOG_TYPE_DEFAULT, "%@: %@ ! %@ -> %@ %@", (uint8_t *)&v17, 0x34u);
  }
}

void __FIUIStateMachineSetDiagnosticAndErrorHandler_block_invoke_278(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  _HKInitializeLogging();
  id v7 = (void *)*MEMORY[0x263F09970];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09970], OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    id v9 = [v5 label];
    id v10 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v11 = [v6 label];
    uint64_t v12 = *(void *)(a1 + 32);
    int v13 = 138413058;
    id v14 = v9;
    __int16 v15 = 2112;
    uint64_t v16 = v10;
    __int16 v17 = 2112;
    double v18 = v11;
    __int16 v19 = 2112;
    uint64_t v20 = v12;
    _os_log_impl(&dword_21E433000, v8, OS_LOG_TYPE_DEFAULT, "%@: Invalid event %@ for state %@ %@", (uint8_t *)&v13, 0x2Au);
  }
}

id FIUIStateMachineLabel(void *a1, void *a2)
{
  id v3 = NSString;
  id v4 = a1;
  id v5 = FIUILastFourCharactersOfUUID(a2);
  id v6 = [v3 stringWithFormat:@"%@_%@", v4, v5];

  return v6;
}

__CFString *NLWorkoutTargetZoneTypeString(unint64_t a1)
{
  if (a1 > 7) {
    return 0;
  }
  else {
    return off_2644A89A0[a1];
  }
}

__CFString *NLWorkoutTargetZoneMasterTypeString(unint64_t a1)
{
  if (a1 > 3) {
    return 0;
  }
  else {
    return off_2644A8A58[a1];
  }
}

__CFString *NLWorkoutTargetZoneStateString(unint64_t a1)
{
  if (a1 > 3) {
    return 0;
  }
  else {
    return off_2644A8A78[a1];
  }
}

void sub_21E477AA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_21E478BC0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

id _ZeroPaddedIntegerNumberFormatter()
{
  id v0 = (void *)_ZeroPaddedIntegerNumberFormatter___formatter;
  if (!_ZeroPaddedIntegerNumberFormatter___formatter)
  {
    uint64_t v1 = objc_alloc_init(FIUINumberFormatter);
    BOOL v2 = (void *)_ZeroPaddedIntegerNumberFormatter___formatter;
    _ZeroPaddedIntegerNumberFormatter___formatter = (uint64_t)v1;

    [(id)_ZeroPaddedIntegerNumberFormatter___formatter setNumberStyle:1];
    [(id)_ZeroPaddedIntegerNumberFormatter___formatter setPaddingPosition:0];
    id v3 = (void *)_ZeroPaddedIntegerNumberFormatter___formatter;
    id v4 = _IntegerNumberFormatter(2);
    id v5 = [v4 stringFromNumber:&unk_26CF75700];
    [v3 setPaddingCharacter:v5];

    [(id)_ZeroPaddedIntegerNumberFormatter___formatter setMinimumIntegerDigits:2];
    [(id)_ZeroPaddedIntegerNumberFormatter___formatter setMaximumFractionDigits:0];
    id v0 = (void *)_ZeroPaddedIntegerNumberFormatter___formatter;
  }
  [v0 setRoundingMode:2];
  id v6 = (void *)_ZeroPaddedIntegerNumberFormatter___formatter;
  return v6;
}

id sub_21E4820B8()
{
  return sub_21E483050((uint64_t)&unk_26CF5DB68, (uint64_t)&unk_26CF5DCA8, (uint64_t)&unk_26CF5DDE8);
}

uint64_t sub_21E4820D8(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v11 = MEMORY[0x263F8EE78];
    sub_21E482D30(0, v1, 0);
    uint64_t v4 = a1 + 32;
    uint64_t v2 = v11;
    do
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F768);
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_21E482D30(0, *(void *)(v2 + 16) + 1, 1);
        uint64_t v2 = v11;
      }
      unint64_t v6 = *(void *)(v2 + 16);
      unint64_t v5 = *(void *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_21E482D30((char *)(v5 > 1), v6 + 1, 1);
        uint64_t v2 = v11;
      }
      *(void *)(v2 + 16) = v6 + 1;
      uint64_t v7 = v2 + 16 * v6;
      *(void *)(v7 + 32) = v9;
      *(unsigned char *)(v7 + 40) = v10;
      v4 += 8;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_21E48220C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_21E4CFE10();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = &v18[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = &v18[-v8];
  uint64_t v10 = sub_21E4CFF80();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  int v13 = &v18[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_21E4CFF60();
  sub_21E4CFE00();
  sub_21E4CFEF0();
  id v14 = *(void (**)(unsigned char *, uint64_t))(v4 + 8);
  v14(v7, v3);
  __int16 v19 = v13;
  uint64_t v20 = 30;
  uint64_t v21 = v9;
  uint64_t v22 = a2;
  uint64_t v15 = swift_bridgeObjectRetain();
  uint64_t v16 = sub_21E482E48(v15, (uint64_t (*)(uint64_t, void, void))sub_21E483538);
  swift_bridgeObjectRelease();
  v14(v9, v3);
  (*(void (**)(unsigned char *, uint64_t))(v11 + 8))(v13, v10);
  return v16;
}

uint64_t sub_21E48240C()
{
  uint64_t v0 = sub_21E4CFE10();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  uint64_t v4 = &v15[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = &v15[-v5];
  uint64_t v7 = sub_21E4CFF80();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = &v15[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_21E4CFF60();
  sub_21E4CFE00();
  sub_21E4CFEF0();
  uint64_t v11 = *(void (**)(unsigned char *, uint64_t))(v1 + 8);
  v11(v4, v0);
  uint64_t v16 = v10;
  __int16 v17 = v6;
  uint64_t v12 = swift_bridgeObjectRetain();
  uint64_t v13 = sub_21E482F54(v12, (uint64_t (*)(uint64_t, double))sub_21E48353C);
  swift_bridgeObjectRelease();
  v11(v6, v0);
  (*(void (**)(unsigned char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

uint64_t sub_21E482600(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  double v50 = *(double *)&a2;
  uint64_t v51 = a7;
  uint64_t v53 = a6;
  uint64_t v54 = a4;
  uint64_t v10 = sub_21E4CFF70();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v42 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F750);
  uint64_t v15 = MEMORY[0x270FA5388](v14 - 8);
  long long v52 = (char *)&v42 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  double v18 = (char *)&v42 - v17;
  uint64_t v55 = sub_21E4CFE10();
  uint64_t v19 = *(void *)(v55 - 8);
  uint64_t v20 = MEMORY[0x270FA5388](v55);
  MEMORY[0x270FA5388](v20);
  __int16 v23 = (char *)&v42 - v22;
  id v24 = 0;
  if (a3) {
    return (uint64_t)v24;
  }
  uint64_t v45 = v21;
  unsigned int v25 = *MEMORY[0x263F078C0];
  uint64_t v26 = *MEMORY[0x263F078C0];
  long long v49 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 104);
  uint64_t result = v49(v13, v26, v10);
  if ((unsigned __int128)(a1 * (__int128)a5) >> 64 == (a1 * a5) >> 63)
  {
    unsigned int v46 = v25;
    uint64_t v47 = a5;
    uint64_t v48 = v23;
    sub_21E4CFF40();
    long long v28 = *(void (**)(char *, uint64_t))(v11 + 8);
    v28(v13, v10);
    uint64_t v53 = v19;
    long long v29 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48);
    if (v29(v18, 1, v55) == 1)
    {
      uint64_t v30 = (uint64_t)v18;
    }
    else
    {
      uint64_t v31 = v48;
      v43 = *(void (**)(void))(v53 + 32);
      uint64_t v44 = v53 + 32;
      v43();
      v49(v13, v46, v10);
      uint64_t v32 = v52;
      sub_21E4CFF40();
      uint64_t v33 = v55;
      v28(v13, v10);
      if (v29(v32, 1, v33) != 1)
      {
        double v34 = v50;
        uint64_t v35 = v45;
        ((void (*)(uint64_t, char *, uint64_t))v43)(v45, v32, v33);
        id v36 = objc_allocWithZone(MEMORY[0x263F0A958]);
        uint64_t v37 = v33;
        int v38 = (void *)sub_21E4CFDE0();
        id v39 = (void *)sub_21E4CFDE0();
        id v24 = objc_msgSend(v36, sel_initWithStartDate_endDate_, v38, v39);

        id v40 = objc_msgSend(self, sel_quantityWithUnit_doubleValue_, v51, v34);
        objc_msgSend(v24, sel_setQuantityValue_, v40);

        uint64_t v41 = *(void (**)(uint64_t, uint64_t))(v53 + 8);
        v41(v35, v37);
        v41((uint64_t)v31, v37);
        return (uint64_t)v24;
      }
      (*(void (**)(char *, uint64_t))(v53 + 8))(v31, v33);
      uint64_t v30 = (uint64_t)v32;
    }
    sub_21E483588(v30);
    return 0;
  }
  __break(1u);
  return result;
}

id sub_21E482A50(double a1)
{
  uint64_t v2 = sub_21E4CFF70();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F750);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_21E4CFE10();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F07890], v2);
  sub_21E4CFF40();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v8, v9);
    sub_21E4CFDA0();
    if (a1 == 1.0)
    {
      id v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0A968]), sel_initWithTimeStamp_state_, 0, v14);
    }
    else
    {
      if (a1 != 2.0)
      {
        (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
        return 0;
      }
      id v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0A968]), sel_initWithTimeStamp_state_, 1, v14);
    }
    id v13 = v15;
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    return v13;
  }
  sub_21E483588((uint64_t)v8);
  return 0;
}

char *sub_21E482D30(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_21E482D50(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

char *sub_21E482D50(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F770);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  id v13 = v10 + 32;
  double v14 = a4 + 32;
  size_t v15 = 16 * v8;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[v15]) {
      memmove(v13, v14, v15);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, v15);
  }
  swift_release();
  return v10;
}

uint64_t sub_21E482E48(uint64_t a1, uint64_t (*a2)(uint64_t, void, void))
{
  uint64_t result = MEMORY[0x263F8EE78];
  uint64_t v8 = MEMORY[0x263F8EE78];
  uint64_t v4 = *(void *)(a1 + 16);
  if (v4)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = 0;
    int64_t v7 = (unsigned __int8 *)(a1 + 40);
    do
    {
      if (a2(v6, *((void *)v7 - 1), *v7))
      {
        MEMORY[0x223C280B0]();
        if (*(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_21E4D0BF0();
        }
        sub_21E4D0C00();
        sub_21E4D0BE0();
      }
      ++v6;
      v7 += 16;
    }
    while (v4 != v6);
    swift_bridgeObjectRelease();
    return v8;
  }
  return result;
}

uint64_t sub_21E482F54(uint64_t a1, uint64_t (*a2)(uint64_t, double))
{
  uint64_t result = MEMORY[0x263F8EE78];
  uint64_t v7 = MEMORY[0x263F8EE78];
  uint64_t v4 = *(void *)(a1 + 16);
  if (v4)
  {
    swift_bridgeObjectRetain();
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (a2(i, *(double *)(a1 + 8 * i + 32)))
      {
        MEMORY[0x223C280B0]();
        if (*(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_21E4D0BF0();
        }
        sub_21E4D0C00();
        sub_21E4D0BE0();
      }
    }
    swift_bridgeObjectRelease();
    return v7;
  }
  return result;
}

id sub_21E483050(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v33 = a3;
  uint64_t v31 = a2;
  uint64_t v4 = sub_21E4CFE10();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v8 = (char *)v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)v29 - v9;
  uint64_t v11 = sub_21E4CFF80();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v34 = v11;
  uint64_t v35 = v12;
  MEMORY[0x270FA5388](v11);
  double v14 = (char *)v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21E4820D8(a1);
  size_t v15 = self;
  id v16 = objc_msgSend(v15, sel_kilocalorieUnit);
  sub_21E4CFF60();
  sub_21E4CFE00();
  sub_21E4CFEF0();
  uint64_t v17 = *(void (**)(char *, uint64_t))(v5 + 8);
  v17(v8, v4);
  uint64_t v42 = v14;
  uint64_t v43 = 30;
  uint64_t v44 = v10;
  id v45 = v16;
  uint64_t v18 = swift_bridgeObjectRetain();
  uint64_t v32 = sub_21E482E48(v18, (uint64_t (*)(uint64_t, void, void))sub_21E483538);
  v29[1] = 0;
  swift_bridgeObjectRelease();
  v17(v10, v4);
  uint64_t v30 = *(void (**)(char *, uint64_t))(v35 + 8);
  v35 += 8;
  v30(v14, v34);
  swift_bridgeObjectRelease();

  sub_21E4820D8(v31);
  id v19 = objc_msgSend(v15, sel_minuteUnit);
  v29[0] = v19;
  sub_21E4CFF60();
  sub_21E4CFE00();
  sub_21E4CFEF0();
  v17(v8, v4);
  int v38 = v14;
  uint64_t v39 = 30;
  id v40 = v10;
  id v41 = v19;
  uint64_t v20 = swift_bridgeObjectRetain();
  uint64_t v31 = sub_21E482E48(v20, (uint64_t (*)(uint64_t, void, void))sub_21E483538);
  swift_bridgeObjectRelease();
  v17(v10, v4);
  uint64_t v21 = v34;
  uint64_t v22 = v30;
  v30(v14, v34);
  swift_bridgeObjectRelease();

  sub_21E4CFF60();
  sub_21E4CFE00();
  sub_21E4CFEF0();
  v17(v8, v4);
  id v36 = v14;
  uint64_t v37 = v10;
  uint64_t v23 = swift_bridgeObjectRetain();
  sub_21E482F54(v23, (uint64_t (*)(uint64_t, double))sub_21E483638);
  swift_bridgeObjectRelease();
  v17(v10, v4);
  v22(v14, v21);
  id v24 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0A960]), sel_init);
  sub_21E4835F8(0, &qword_267D2F758);
  unsigned int v25 = (void *)sub_21E4D0BC0();
  swift_bridgeObjectRelease();
  objc_msgSend(v24, sel_setActiveEnergyResults_, v25);

  uint64_t v26 = (void *)sub_21E4D0BC0();
  swift_bridgeObjectRelease();
  objc_msgSend(v24, sel_setAppleExerciseTimeResults_, v26);

  sub_21E4835F8(0, &qword_267D2F760);
  uint64_t v27 = (void *)sub_21E4D0BC0();
  swift_bridgeObjectRelease();
  objc_msgSend(v24, sel_setAppleStandHourResults_, v27);

  return v24;
}

id sub_21E48353C(double a1)
{
  return sub_21E482A50(a1);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_21E483588(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F750);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21E4835E8(uint64_t a1, uint64_t a2, char a3)
{
  return sub_21E482600(a1, a2, a3 & 1, v3[2], v3[3], v3[4], v3[5]);
}

uint64_t sub_21E4835F8(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_21E48363C()
{
  sub_21E4D0720();
  uint64_t v0 = sub_21E4D0730();
  uint64_t result = swift_release();
  qword_267D32A58 = v0;
  return result;
}

uint64_t *sub_21E483680()
{
  if (qword_267D303C0 != -1) {
    swift_once();
  }
  return &qword_267D32A58;
}

uint64_t sub_21E4836CC()
{
  if (qword_267D303C0 != -1) {
    swift_once();
  }
  return swift_retain();
}

void sub_21E483728()
{
  qword_267D32A60 = sub_21E496B70(1.0);
}

uint64_t *sub_21E48374C()
{
  if (qword_267D303C8 != -1) {
    swift_once();
  }
  return &qword_267D32A60;
}

double sub_21E483798()
{
  if (qword_267D303C8 != -1) {
    swift_once();
  }
  return *(double *)&qword_267D32A60;
}

void *sub_21E4837E4()
{
  return &unk_21E4D9110;
}

double sub_21E4837F0()
{
  return 1.0;
}

void *sub_21E4837F8()
{
  return &unk_21E4D9118;
}

double sub_21E483804()
{
  return 0.0;
}

ValueMetadata *type metadata accessor for ChartsLayout()
{
  return &type metadata for ChartsLayout;
}

uint64_t sub_21E483824()
{
  return 1;
}

id UILabel.adjustFontForDynamicType(_:)(char a1)
{
  objc_msgSend(v1, sel_setAdjustsFontForContentSizeCategory_, a1 & 1);
  return v3;
}

id UILabel.text(_:)(uint64_t a1, uint64_t a2)
{
  if (a2) {
    uint64_t v2 = (void *)sub_21E4D0AB0();
  }
  else {
    uint64_t v2 = 0;
  }
  objc_msgSend(v4, sel_setText_, v2);

  return v4;
}

id UILabel.textColor(_:)(uint64_t a1)
{
  objc_msgSend(v1, sel_setTextColor_, a1);
  return v3;
}

id UILabel.font(_:)(uint64_t a1)
{
  objc_msgSend(v1, sel_setFont_, a1);
  return v3;
}

id UILabel.wordWrapping(numberOfLines:)(uint64_t a1)
{
  objc_msgSend(v1, sel_setLineBreakMode_, 0);
  objc_msgSend(v4, sel_setNumberOfLines_, a1);
  return v4;
}

id UILabel.textAlignment(_:)(uint64_t a1)
{
  objc_msgSend(v1, sel_setTextAlignment_, a1);
  return v3;
}

id UILabel.tightening()()
{
  objc_msgSend(v0, sel_setAllowsDefaultTighteningForTruncation_, 1);
  return v2;
}

id UILabel.adjustingFontToFitWidth()()
{
  objc_msgSend(v0, sel_setAdjustsFontSizeToFitWidth_, 1);
  return v2;
}

id sub_21E483AAC(uint64_t a1)
{
  objc_msgSend(v1, sel_setBaselineAdjustment_, a1);
  return v3;
}

id UILabel.numberOfLines(_:)(uint64_t a1)
{
  objc_msgSend(v1, sel_setNumberOfLines_, a1);
  return v3;
}

id UILabel.accessibilityHint(_:)()
{
  uint64_t v0 = (void *)sub_21E4D0AB0();
  objc_msgSend(v2, sel_setAccessibilityHint_, v0);

  return v2;
}

id UIImageView.image(_:)(uint64_t a1)
{
  objc_msgSend(v1, sel_setImage_, a1);
  return v3;
}

id UIImageView.dynamicType()()
{
  objc_msgSend(v0, sel_setAdjustsImageSizeForAccessibilityContentSizeCategory_, 1);
  return v2;
}

id UIImageView.contentMode(_:)(uint64_t a1)
{
  objc_msgSend(v1, sel_setContentMode_, a1);
  return v3;
}

id UIImageView.preferredSymbolConfiguration(_:)(uint64_t a1)
{
  objc_msgSend(v1, sel_setPreferredSymbolConfiguration_, a1);
  return v3;
}

id CAShapeLayer.fillColor(_:)(void *a1)
{
  return sub_21E483CD0(a1, (SEL *)&selRef_setFillColor_);
}

id CAShapeLayer.strokeColor(_:)(void *a1)
{
  return sub_21E483CD0(a1, (SEL *)&selRef_setStrokeColor_);
}

id sub_21E483CD0(void *a1, SEL *a2)
{
  id v3 = objc_msgSend(a1, sel_CGColor);
  objc_msgSend(v5, *a2, v3);

  return v5;
}

id CAShapeLayer.lineWidth(_:)()
{
  objc_msgSend(v0, sel_setLineWidth_);
  return v2;
}

id CAShapeLayer.lineDashPattern(_:)(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_21E4D0E40();
    id v3 = (double *)(a1 + 32);
    do
    {
      double v4 = *v3++;
      objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, v4);
      sub_21E4D0E20();
      sub_21E4D0E50();
      sub_21E4D0E60();
      sub_21E4D0E30();
      --v1;
    }
    while (v1);
  }
  sub_21E483EA0();
  id v5 = (void *)sub_21E4D0BC0();
  swift_bridgeObjectRelease();
  objc_msgSend(v7, sel_setLineDashPattern_, v5);

  return v7;
}

unint64_t sub_21E483EA0()
{
  unint64_t result = qword_26AB08630;
  if (!qword_26AB08630)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26AB08630);
  }
  return result;
}

uint64_t sub_21E483EE0()
{
  return 0;
}

uint64_t (*sub_21E483EE8())()
{
  return j__swift_endAccess;
}

uint64_t sub_21E483F40@<X0>(uint64_t result@<X0>, unsigned char *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_21E483F48()
{
  swift_getKeyPath();
  (*(void (**)(void))(*(void *)v0 + 176))();
  swift_release();
  swift_beginAccess();
  return v0[16];
}

uint64_t sub_21E483FC0@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 136))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_21E484010(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(**(void **)a2 + 144))(*a1);
}

uint64_t sub_21E484058(char a1)
{
  swift_getKeyPath();
  uint64_t v4 = v1;
  char v5 = a1;
  (*(void (**)(void))(*(void *)v1 + 184))();
  return swift_release();
}

uint64_t sub_21E4840F4()
{
  uint64_t v1 = *(void *)(v0 + 16);
  char v2 = *(unsigned char *)(v0 + 24);
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v1 + 16) = v2;
  return result;
}

void (*sub_21E484148(void *a1))(void *a1)
{
  id v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[4] = v1;
  swift_getKeyPath();
  (*(void (**)(void))(*(void *)v1 + 176))();
  swift_release();
  void v3[5] = OBJC_IVAR____TtC9FitnessUI28FIUIWheelchairStatusProvider___observationRegistrar;
  *id v3 = v1;
  swift_getKeyPath();
  void v3[6] = sub_21E4842C4();
  sub_21E4CFFD0();
  swift_release();
  v3[7] = sub_21E483EE8();
  return sub_21E484238;
}

void sub_21E484238(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 56))(*a1, 0);
  void *v1 = v1[4];
  swift_getKeyPath();
  sub_21E4CFFC0();
  swift_release();
  free(v1);
}

unint64_t sub_21E4842C4()
{
  unint64_t result = qword_267D2F778;
  if (!qword_267D2F778)
  {
    type metadata accessor for FIUIWheelchairStatusProvider();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2F778);
  }
  return result;
}

uint64_t type metadata accessor for FIUIWheelchairStatusProvider()
{
  uint64_t result = qword_267D30460;
  if (!qword_267D30460) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_21E484368(void *a1)
{
  uint64_t v2 = swift_allocObject();
  sub_21E4843A8(a1);
  return v2;
}

id sub_21E4843A8(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F780);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(unsigned char *)(v2 + 16) = 0;
  sub_21E4CFFE0();
  *(void *)(v2 + 24) = a1;
  id v7 = objc_allocWithZone(MEMORY[0x263F0AA30]);
  id v8 = a1;
  id result = objc_msgSend(v7, sel_initWithHealthStore_, v8);
  if (result)
  {
    *(void *)(v2 + 32) = result;
    uint64_t v10 = sub_21E4D0C50();
    uint64_t v11 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56);
    v11(v6, 1, 1, v10);
    uint64_t v12 = swift_allocObject();
    swift_weakInit();
    sub_21E4D0C30();
    swift_retain();
    uint64_t v13 = sub_21E4D0C20();
    double v14 = (void *)swift_allocObject();
    uint64_t v15 = MEMORY[0x263F8F500];
    v14[2] = v13;
    v14[3] = v15;
    v14[4] = v12;
    swift_release();
    sub_21E4848FC((uint64_t)v6, (uint64_t)&unk_267D2F790, (uint64_t)v14);
    swift_release();
    v11(v6, 1, 1, v10);
    id v16 = (void *)swift_allocObject();
    v16[2] = 0;
    v16[3] = 0;
    v16[4] = v2;
    swift_retain();
    sub_21E4848FC((uint64_t)v6, (uint64_t)&unk_267D2F7A0, (uint64_t)v16);
    swift_release();

    return (id)v2;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_21E4845D0()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_21E48460C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 40) = a4;
  sub_21E4D0C30();
  *(void *)(v4 + 48) = sub_21E4D0C20();
  uint64_t v6 = sub_21E4D0C10();
  return MEMORY[0x270FA2498](sub_21E4846A4, v6, v5);
}

uint64_t sub_21E4846A4()
{
  swift_release();
  swift_beginAccess();
  Strong = (id *)swift_weakLoadStrong();
  if (Strong)
  {
    (*((void (**)(id))*Strong + 18))(objc_msgSend(Strong[4], sel_isWheelchairUser));
    swift_release();
  }
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_21E48476C()
{
  return objectdestroy_2Tm(40);
}

uint64_t sub_21E484774()
{
  uint64_t v2 = *(void *)(v0 + 32);
  id v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *id v3 = v1;
  v3[1] = sub_21E484808;
  return sub_21E48460C((uint64_t)v3, v4, v5, v2);
}

uint64_t sub_21E484808()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_21E4848FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_21E4D0C50();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_21E4D0C40();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_21E4855C4(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_21E4D0C10();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_21E484AA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_21E4D0C50();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_21E4D0C40();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_21E4855C4(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_21E4D0C10();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F830);
  return swift_task_create();
}

uint64_t sub_21E484C4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return MEMORY[0x270FA2498](sub_21E484C6C, 0, 0);
}

uint64_t sub_21E484C6C()
{
  objc_msgSend(*(id *)(*(void *)(v0 + 16) + 32), sel_registerObserver_);
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_21E484CD8()
{
  return objectdestroy_2Tm(40);
}

uint64_t sub_21E484CE0()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_21E485BA8;
  void v3[2] = v2;
  return MEMORY[0x270FA2498](sub_21E484C6C, 0, 0);
}

uint64_t sub_21E484D88()
{
  objc_msgSend(*(id *)(v0 + 32), sel_removeObserver_, v0);

  uint64_t v1 = v0 + OBJC_IVAR____TtC9FitnessUI28FIUIWheelchairStatusProvider___observationRegistrar;
  uint64_t v2 = sub_21E4CFFF0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t sub_21E484E10()
{
  objc_msgSend(*(id *)(v0 + 32), sel_removeObserver_, v0);

  uint64_t v1 = v0 + OBJC_IVAR____TtC9FitnessUI28FIUIWheelchairStatusProvider___observationRegistrar;
  uint64_t v2 = sub_21E4CFFF0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_21E484ED4(uint64_t a1, char a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F780);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_21E4D0C50();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  uint64_t v7 = swift_allocObject();
  swift_weakInit();
  sub_21E4D0C30();
  swift_retain();
  uint64_t v8 = sub_21E4D0C20();
  uint64_t v9 = swift_allocObject();
  uint64_t v10 = MEMORY[0x263F8F500];
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = v10;
  *(void *)(v9 + 32) = v7;
  *(unsigned char *)(v9 + 40) = a2;
  swift_release();
  sub_21E484AA0((uint64_t)v5, (uint64_t)&unk_267D2F7B0, v9);
  return swift_release();
}

uint64_t sub_21E485028(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  *(unsigned char *)(v5 + 64) = a5;
  *(void *)(v5 + 40) = a1;
  *(void *)(v5 + 48) = a4;
  sub_21E4D0C30();
  *(void *)(v5 + 56) = sub_21E4D0C20();
  uint64_t v7 = sub_21E4D0C10();
  return MEMORY[0x270FA2498](sub_21E4850C4, v7, v6);
}

uint64_t sub_21E4850C4()
{
  swift_release();
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    (*(void (**)(void))(*(void *)Strong + 144))(*(unsigned __int8 *)(v0 + 64));
    swift_release();
  }
  **(unsigned char **)(v0 + 40) = Strong == 0;
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_21E485190()
{
  return objectdestroy_2Tm(41);
}

uint64_t sub_21E485198(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 32);
  char v5 = *(unsigned char *)(v1 + 40);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_21E485BA8;
  return sub_21E485028(a1, v6, v7, v4, v5);
}

uint64_t sub_21E4853D4()
{
  return sub_21E4CFFB0();
}

uint64_t sub_21E48542C()
{
  return sub_21E4CFFA0();
}

uint64_t sub_21E4854BC()
{
  return type metadata accessor for FIUIWheelchairStatusProvider();
}

uint64_t sub_21E4854C4()
{
  uint64_t result = sub_21E4CFFF0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_21E485570()
{
  return objectdestroy_2Tm(41);
}

uint64_t objectdestroy_2Tm(uint64_t a1)
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v1, a1, 7);
}

uint64_t sub_21E4855C4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F780);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21E485624(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_21E485700;
  return v6(a1);
}

uint64_t sub_21E485700()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_21E4857F8(uint64_t a1, int *a2)
{
  *(void *)(v2 + 16) = a1;
  char v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_21E4858D8;
  return v5(v2 + 32);
}

uint64_t sub_21E4858D8()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(unsigned char **)(*v0 + 16);
  uint64_t v5 = *v0;
  swift_task_dealloc();
  *uint64_t v2 = *(unsigned char *)(v1 + 32);
  uint64_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

uint64_t sub_21E4859EC()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_21E485A24(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_21E484808;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_267D2F820 + dword_267D2F820);
  return v6(a1, v4);
}

uint64_t sub_21E485ADC(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_21E485BA8;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_267D2F838 + dword_267D2F838);
  return v6(a1, v4);
}

void sub_21E485B94()
{
}

uint64_t static MathUtils.fequal(value1:value2:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v15[0] = a1;
  v15[1] = a2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v6 = *(void *)(a3 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)v15 - v10;
  sub_21E4D0F10();
  sub_21E4D0FD0();
  uint64_t v12 = *(void (**)(char *, uint64_t))(v6 + 8);
  v12(v9, a3);
  swift_getAssociatedConformanceWitness();
  sub_21E4D0FC0();
  sub_21E4D0FA0();
  char v13 = sub_21E4D0A90();
  v12(v9, a3);
  v12(v11, a3);
  return v13 & 1;
}

uint64_t static MathUtils.fgreater(value1:value2:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v15[1] = a2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v6 = *(void *)(a3 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)v15 - v10;
  sub_21E4D0F10();
  swift_getAssociatedConformanceWitness();
  sub_21E4D0FC0();
  sub_21E4D0FA0();
  char v12 = sub_21E4D0A80();
  char v13 = *(void (**)(char *, uint64_t))(v6 + 8);
  v13(v9, a3);
  v13(v11, a3);
  return v12 & 1;
}

uint64_t static MathUtils.fless(value1:value2:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v15[1] = a2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v6 = *(void *)(a3 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)v15 - v10;
  sub_21E4D0F10();
  swift_getAssociatedConformanceWitness();
  sub_21E4D0FC0();
  sub_21E4D0FA0();
  char v12 = sub_21E4D0A80();
  char v13 = *(void (**)(char *, uint64_t))(v6 + 8);
  v13(v9, a3);
  v13(v11, a3);
  return v12 & 1;
}

uint64_t static MathUtils.clip(value:minValue:maxValue:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(a4 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21E4D0FF0();
  sub_21E4D0FE0();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, a4);
}

uint64_t static MathUtils.saturate(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  v15[1] = a3;
  void v15[2] = a4;
  uint64_t v16 = a1;
  uint64_t v5 = *(void *)(a2 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](a1);
  uint64_t v8 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)v15 - v9;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v12 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  MEMORY[0x270FA5388](v12);
  swift_getAssociatedConformanceWitness();
  sub_21E4D0FC0();
  sub_21E4D0FA0();
  sub_21E4D0FC0();
  sub_21E4D0FA0();
  static MathUtils.clip(value:minValue:maxValue:)(v16, (uint64_t)v10, (uint64_t)v8, a2);
  char v13 = *(void (**)(char *, uint64_t))(v5 + 8);
  v13(v8, a2);
  return ((uint64_t (*)(char *, uint64_t))v13)(v10, a2);
}

uint64_t static MathUtils.interpolated(from:to:fraction:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(a4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](a1);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v13 - v9;
  sub_21E4D0F10();
  sub_21E4D0C90();
  uint64_t v11 = *(void (**)(char *, uint64_t))(v5 + 8);
  v11(v8, a4);
  sub_21E4D0F00();
  return ((uint64_t (*)(char *, uint64_t))v11)(v10, a4);
}

uint64_t static MathUtils.percent(value:from:to:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v6 = a5;
  v21[6] = a6;
  v21[7] = a2;
  v21[3] = a1;
  uint64_t v9 = *(void *)(a5 + 8);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v11 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v12 = *(void *)(a4 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)v21 - v16;
  uint64_t v18 = *(void *)(*(void *)(*(void *)(*(void *)(v6 + 16) + 16) + 8) + 8);
  void v21[5] = a3;
  v21[2] = v18;
  sub_21E4D0F10();
  v21[1] = swift_getAssociatedConformanceWitness();
  sub_21E4D0FC0();
  v21[4] = v9;
  sub_21E4D0FA0();
  LOBYTE(v6) = sub_21E4D0AA0();
  id v19 = *(void (**)(char *, uint64_t))(v12 + 8);
  v19(v15, a4);
  v19(v17, a4);
  if (v6)
  {
    sub_21E4D0FC0();
    return sub_21E4D0FA0();
  }
  else
  {
    sub_21E4D0F10();
    sub_21E4D0F10();
    sub_21E4D0A40();
    v19(v15, a4);
    return ((uint64_t (*)(char *, uint64_t))v19)(v17, a4);
  }
}

uint64_t static MathUtils.pythagorean(side1:side2:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](a1);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  uint64_t v10 = (char *)&v15 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v15 - v11;
  sub_21E4D0C90();
  sub_21E4D0C90();
  sub_21E4D0F00();
  uint64_t v13 = *(void (**)(char *, uint64_t))(v4 + 8);
  v13(v7, a3);
  v13(v10, a3);
  sub_21E4D0A30();
  return ((uint64_t (*)(char *, uint64_t))v13)(v12, a3);
}

uint64_t sub_21E486AE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 16);
}

uint64_t type metadata accessor for MathUtils()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t sub_21E486B30@<X0>(uint64_t *a1@<X8>)
{
  return sub_21E486B7C(&qword_267D2F848, a1);
}

uint64_t sub_21E486B44()
{
  return sub_21E4D03B0();
}

uint64_t sub_21E486B68@<X0>(uint64_t *a1@<X8>)
{
  return sub_21E486B7C(&qword_267D2F850, a1);
}

uint64_t sub_21E486B7C@<X0>(uint64_t *a1@<X1>, uint64_t *a2@<X8>)
{
  *a2 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(a1);
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_21E486BCC()
{
  return sub_21E4D0370();
}

uint64_t sub_21E486BF0(uint64_t a1)
{
  uint64_t v2 = sub_21E4D0320();
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_21E4D0380();
}

uint64_t sub_21E486CB8()
{
  type metadata accessor for QuantityChart();
  return swift_bridgeObjectRetain();
}

uint64_t type metadata accessor for QuantityChart()
{
  uint64_t result = qword_267D30590;
  if (!qword_267D30590) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_21E486D38@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v38 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F858);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v37 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F860);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F868);
  uint64_t v34 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F870);
  uint64_t v35 = *(void *)(v12 - 8);
  uint64_t v36 = v12;
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F878);
  sub_21E487448();
  sub_21E4D0170();
  uint64_t v39 = v2;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F898);
  uint64_t v16 = sub_21E48A380(&qword_267D2F8A0, &qword_267D2F860);
  uint64_t v17 = sub_21E48A380(&qword_267D2F8A8, &qword_267D2F898);
  sub_21E4D0620();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t result = type metadata accessor for QuantityChart();
  uint64_t v19 = *(void *)(v2 + *(int *)(result + 24));
  uint64_t v20 = *(void *)(v19 + 16);
  double v21 = 1.3;
  if (!v20) {
    goto LABEL_9;
  }
  double v22 = *(double *)(v19 + 40);
  uint64_t v23 = v20 - 1;
  if (v23)
  {
    id v24 = (double *)(v19 + 64);
    do
    {
      double v25 = *v24;
      v24 += 3;
      double v26 = v25;
      if (v22 < v25) {
        double v22 = v26;
      }
      --v23;
    }
    while (v23);
  }
  if (v22 >= 1.0 && (double v21 = v22 * 1.3, v22 * 1.3 < 0.0))
  {
    __break(1u);
  }
  else
  {
LABEL_9:
    uint64_t v45 = 0;
    double v46 = v21;
    uint64_t v27 = sub_21E4D0220();
    uint64_t v28 = (uint64_t)v37;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v37, 1, 1, v27);
    uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F8B0);
    uint64_t v41 = v5;
    uint64_t v42 = v15;
    uint64_t v43 = v16;
    unint64_t v44 = v17;
    uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    unint64_t v31 = sub_21E488330();
    sub_21E4D0650();
    sub_21E489000(v28, &qword_267D2F858);
    (*(void (**)(char *, uint64_t))(v34 + 8))(v11, v9);
    uint64_t v41 = v9;
    uint64_t v42 = v29;
    uint64_t v43 = OpaqueTypeConformance2;
    unint64_t v44 = v31;
    swift_getOpaqueTypeConformance2();
    uint64_t v32 = v36;
    sub_21E4D0630();
    return (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v14, v32);
  }
  return result;
}

uint64_t sub_21E4871F4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for QuantityChart();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  uint64_t v17 = *(void *)(a1 + *(int *)(MEMORY[0x270FA5388](v2 - 8) + 32));
  sub_21E48A0A4(a1, (uint64_t)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = swift_allocObject();
  sub_21E48A29C((uint64_t)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v6 + v5);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F8F8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F900);
  sub_21E48A380(&qword_267D2F908, &qword_267D2F8F8);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D2F888);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D2F890);
  uint64_t v13 = sub_21E4D01F0();
  uint64_t v14 = MEMORY[0x263F18AF0];
  uint64_t v15 = MEMORY[0x263EFCD60];
  uint64_t v16 = MEMORY[0x263F18AE0];
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v13 = v8;
  uint64_t v14 = OpaqueTypeConformance2;
  uint64_t v10 = swift_getOpaqueTypeConformance2();
  uint64_t v13 = v7;
  uint64_t v14 = v10;
  swift_getOpaqueTypeConformance2();
  sub_21E48A3C4();
  return sub_21E4D0810();
}

uint64_t sub_21E487440()
{
  return sub_21E4871F4(*(void *)(v0 + 16));
}

unint64_t sub_21E487448()
{
  unint64_t result = qword_267D2F880;
  if (!qword_267D2F880)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D2F878);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D2F888);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D2F890);
    sub_21E4D01F0();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2F880);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_21E4875B8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v47 = a2;
  uint64_t v60 = a3;
  uint64_t v45 = sub_21E4D04A0();
  uint64_t v44 = *(void *)(v45 - 8);
  MEMORY[0x270FA5388](v45);
  uint64_t v43 = (uint64_t)&v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_21E4D0320();
  uint64_t v48 = *(void *)(v5 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v41 - v9;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F918);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  MEMORY[0x270FA5388](v13);
  uint64_t v55 = sub_21E4D01F0();
  uint64_t v49 = *(void *)(v55 - 8);
  MEMORY[0x270FA5388](v55);
  double v46 = (char *)&v41 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F890);
  uint64_t v56 = *(void *)(v58 - 8);
  MEMORY[0x270FA5388](v58);
  long long v52 = (char *)&v41 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F888);
  uint64_t v57 = *(void *)(v59 - 8);
  MEMORY[0x270FA5388](v59);
  uint64_t v54 = (char *)&v41 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F900);
  uint64_t v51 = *(void *)(v53 - 8);
  MEMORY[0x270FA5388](v53);
  double v50 = (char *)&v41 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = *a1;
  uint64_t v19 = a1[1];
  int v42 = *((unsigned __int8 *)a1 + 16);
  int v41 = *((unsigned __int8 *)a1 + 17);
  sub_21E4D0470();
  v66[0] = v18;
  sub_21E4D00E0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21E4D0470();
  v66[0] = 0;
  sub_21E4D00E0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21E4D0470();
  v66[0] = v19;
  sub_21E4D00E0();
  swift_bridgeObjectRelease();
  uint64_t v20 = v46;
  swift_bridgeObjectRelease();
  sub_21E4D01E0();
  type metadata accessor for QuantityChart();
  sub_21E4898A4(&qword_267D2F850, MEMORY[0x263F18FF8], 0xD000000000000010, 0x800000021E4DE6B0, (uint64_t)v10);
  sub_21E48A418(&qword_267D2F920);
  sub_21E4D0D90();
  sub_21E48A418(&qword_267D2F928);
  char v21 = sub_21E4D0AA0();
  double v22 = *(void (**)(char *, uint64_t))(v48 + 8);
  v22(v8, v5);
  v22(v10, v5);
  if (v21)
  {
    uint64_t v23 = v43;
    sub_21E4898A4(&qword_267D2F848, MEMORY[0x263F19988], 0xD000000000000013, 0x800000021E4DE690, v43);
    if (v41) {
      __int16 v24 = 256;
    }
    else {
      __int16 v24 = 0;
    }
    sub_21E4AEFB8(v24 | v42, (uint64_t)v65);
    uint64_t v25 = v65[0];
    uint64_t v26 = v65[1];
    uint64_t v27 = v65[2];
    uint64_t v28 = v65[3];
    uint64_t v29 = v65[4];
    (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v23, v45);
  }
  else
  {
    if (qword_267D304F0 != -1) {
      swift_once();
    }
    swift_beginAccess();
    uint64_t v26 = *((void *)&xmmword_267D32A68 + 1);
    uint64_t v25 = xmmword_267D32A68;
    uint64_t v27 = unk_267D32A78;
    uint64_t v28 = qword_267D32A80;
    uint64_t v29 = qword_267D32A88;
    swift_bridgeObjectRetain();
  }
  v66[0] = v25;
  v66[1] = v26;
  v66[2] = v27;
  v66[3] = v28;
  v66[4] = v29;
  uint64_t v30 = MEMORY[0x263F18AF0];
  uint64_t v31 = MEMORY[0x263EFCD60];
  uint64_t v32 = MEMORY[0x263F18AE0];
  uint64_t v33 = v52;
  uint64_t v34 = v55;
  sub_21E4D0080();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v49 + 8))(v20, v34);
  sub_21E496B70(4.5);
  sub_21E4D0290();
  uint64_t v61 = v34;
  uint64_t v62 = v30;
  uint64_t v63 = v31;
  uint64_t v64 = v32;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v36 = v54;
  uint64_t v37 = v58;
  sub_21E4D00A0();
  sub_21E48A45C((uint64_t)v66);
  (*(void (**)(char *, uint64_t))(v56 + 8))(v33, v37);
  uint64_t v61 = v37;
  uint64_t v62 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  uint64_t v38 = v50;
  uint64_t v39 = v59;
  sub_21E4D0090();
  (*(void (**)(char *, uint64_t))(v57 + 8))(v36, v39);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v51 + 32))(v60, v38, v53);
}

long long *sub_21E487ED8()
{
  if (qword_267D304F0 != -1) {
    swift_once();
  }
  return &xmmword_267D32A68;
}

uint64_t sub_21E487F24()
{
  uint64_t v0 = sub_21E4D0110();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_21E4D00C0();
  MEMORY[0x270FA5388](v1 - 8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F8F0);
  uint64_t v2 = (void *)swift_allocObject();
  uint64_t result = _swift_stdlib_malloc_size(v2);
  uint64_t v4 = 0;
  uint64_t v5 = result - 32;
  if (result < 32) {
    uint64_t v5 = result - 25;
  }
  v2[2] = 25;
  void v2[3] = 2 * (v5 >> 3);
  uint64_t v6 = 4;
  while (1)
  {
    if (v4 == 24)
    {
      uint64_t v7 = 0;
    }
    else
    {
      uint64_t v7 = v4 + 1;
      if (__OFADD__(v4, 1)) {
        goto LABEL_19;
      }
    }
    v2[v6] = v4;
    if (v6 == 28) {
      break;
    }
    ++v6;
    BOOL v8 = v4 == 24;
    uint64_t v4 = v7;
    if (v8)
    {
      __break(1u);
      break;
    }
  }
  int64_t v9 = v2[2];
  if (!v9)
  {
LABEL_17:
    swift_release();
    sub_21E4D00B0();
    sub_21E4D0100();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F8E0);
    sub_21E4D0070();
    swift_getOpaqueTypeConformance2();
    return sub_21E4D0200();
  }
  uint64_t v15 = MEMORY[0x263F8EE78];
  uint64_t result = (uint64_t)sub_21E489F88(0, v9, 0);
  uint64_t v10 = 0;
  while (1)
  {
    uint64_t v11 = v2[v10 + 4];
    uint64_t v12 = 3600 * v11;
    if ((unsigned __int128)(v11 * (__int128)3600) >> 64 != (3600 * v11) >> 63) {
      break;
    }
    unint64_t v14 = *(void *)(v15 + 16);
    unint64_t v13 = *(void *)(v15 + 24);
    if (v14 >= v13 >> 1) {
      uint64_t result = (uint64_t)sub_21E489F88((char *)(v13 > 1), v14 + 1, 1);
    }
    ++v10;
    *(void *)(v15 + 16) = v14 + 1;
    *(void *)(v15 + 8 * v14 + 32) = v12;
    if (v9 == v10) {
      goto LABEL_17;
    }
  }
  __break(1u);
LABEL_19:
  __break(1u);
  return result;
}

uint64_t sub_21E4881F0()
{
  uint64_t v0 = sub_21E4D0070();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21E48374C();
  sub_21E4D0290();
  long long v9 = v6;
  long long v10 = v7;
  uint64_t v11 = v8;
  sub_21E4D0060();
  v5[1] = *sub_21E483680();
  sub_21E4D0180();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

unint64_t sub_21E488330()
{
  unint64_t result = qword_267D2F8B8;
  if (!qword_267D2F8B8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D2F8B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2F8B8);
  }
  return result;
}

uint64_t sub_21E48839C()
{
  uint64_t v0 = sub_21E4D0110();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_21E4D00C0();
  MEMORY[0x270FA5388](v1 - 8);
  sub_21E4D00B0();
  sub_21E4D0100();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F8E0);
  sub_21E4D0070();
  swift_getOpaqueTypeConformance2();
  return sub_21E4D0200();
}

uint64_t sub_21E48850C()
{
  uint64_t v0 = sub_21E4D0070();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21E48374C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F8E8);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_21E4D9230;
  *(void *)(v4 + 32) = 0;
  sub_21E4D0290();
  long long v10 = v7;
  long long v11 = v8;
  uint64_t v12 = v9;
  sub_21E4D0060();
  v6[1] = *sub_21E483680();
  sub_21E4D0180();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_21E48867C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  *a2 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F848);
  swift_storeEnumTagMultiPayload();
  uint64_t v4 = type metadata accessor for QuantityChart();
  uint64_t v5 = (uint64_t *)((char *)a2 + *(int *)(v4 + 20));
  uint64_t *v5 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F850);
  uint64_t result = swift_storeEnumTagMultiPayload();
  *(uint64_t *)((char *)a2 + *(int *)(v4 + 24)) = a1;
  return result;
}

uint64_t sub_21E488724()
{
  return sub_21E4D06C0();
}

double sub_21E488744()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F8D8);
  double v0 = COERCE_DOUBLE(swift_allocObject());
  *(_OWORD *)(*(void *)&v0 + 16) = xmmword_21E4D9230;
  *(void *)(*(void *)&v0 + 32) = sub_21E4D0710();
  *(double *)&long long v2 = v0;
  sub_21E4D0BE0();
  sub_21E4D0840();
  sub_21E4D0850();
  MEMORY[0x223C27D20](*(void *)&v0);
  sub_21E4D02B0();
  double result = v0;
  xmmword_267D32A68 = v2;
  unk_267D32A78 = v3;
  qword_267D32A88 = v4;
  return result;
}

uint64_t sub_21E48880C@<X0>(uint64_t a1@<X8>)
{
  if (qword_267D304F0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  *(void *)a1 = xmmword_267D32A68;
  *(_OWORD *)(a1 + 8) = *(long long *)((char *)&xmmword_267D32A68 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)&qword_267D32A80;
  return swift_bridgeObjectRetain();
}

uint64_t sub_21E48889C(uint64_t a1)
{
  if (qword_267D304F0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  long long v2 = *(_OWORD *)(a1 + 16);
  xmmword_267D32A68 = *(_OWORD *)a1;
  unk_267D32A78 = v2;
  qword_267D32A88 = *(void *)(a1 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return sub_21E488948(a1);
}

uint64_t sub_21E488948(uint64_t a1)
{
  return a1;
}

uint64_t (*sub_21E488974())()
{
  if (qword_267D304F0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_21E4889FC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *sub_21E488A18(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F848);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_21E4D04A0();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = *(int *)(a3 + 20);
    long long v10 = (uint64_t *)((char *)a1 + v9);
    long long v11 = (uint64_t *)((char *)a2 + v9);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F850);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_21E4D0320();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      *long long v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 24)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 24));
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_21E488BD8(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F848);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_21E4D04A0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F850);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_21E4D0320();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  return swift_bridgeObjectRelease();
}

void *sub_21E488CEC(void *a1, void *a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F848);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_21E4D04A0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F850);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_21E4D0320();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  }
  else
  {
    *uint64_t v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  *(void *)((char *)a1 + *(int *)(a3 + 24)) = *(void *)((char *)a2 + *(int *)(a3 + 24));
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_21E488E5C(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_21E489000((uint64_t)a1, &qword_267D2F848);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F848);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_21E4D04A0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v7 = *(int *)(a3 + 20);
    uint64_t v8 = (void *)((char *)a1 + v7);
    uint64_t v9 = (void *)((char *)a2 + v7);
    sub_21E489000((uint64_t)a1 + v7, &qword_267D2F850);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F850);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_21E4D0320();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    }
    else
    {
      *uint64_t v8 = *v9;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  *(void *)((char *)a1 + *(int *)(a3 + 24)) = *(void *)((char *)a2 + *(int *)(a3 + 24));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_21E489000(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

char *sub_21E48905C(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F848);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_21E4D04A0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F850);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v12 = sub_21E4D0320();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v9, v10, v12);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
  }
  *(void *)&a1[*(int *)(a3 + 24)] = *(void *)&a2[*(int *)(a3 + 24)];
  return a1;
}

char *sub_21E4891D8(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_21E489000((uint64_t)a1, &qword_267D2F848);
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F848);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_21E4D04A0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = &a1[v8];
    uint64_t v10 = &a2[v8];
    sub_21E489000((uint64_t)&a1[v8], &qword_267D2F850);
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F850);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_21E4D0320();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v9, v10, v12);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
    }
  }
  *(void *)&a1[*(int *)(a3 + 24)] = *(void *)&a2[*(int *)(a3 + 24)];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_21E489384(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_21E489398);
}

uint64_t sub_21E489398(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F8C0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F8C8);
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  unint64_t v14 = *(void *)(a1 + *(int *)(a3 + 24));
  if (v14 >= 0xFFFFFFFF) {
    LODWORD(v14) = -1;
  }
  return (v14 + 1);
}

uint64_t sub_21E4894B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_21E4894C8);
}

uint64_t sub_21E4894C8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F8C0);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F8C8);
    uint64_t v14 = *(void *)(result - 8);
    if (*(_DWORD *)(v14 + 84) != a3)
    {
      *(void *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
      return result;
    }
    uint64_t v10 = result;
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_21E4895E0()
{
  sub_21E4896EC(319, &qword_267D2F8D0, MEMORY[0x263F19988]);
  if (v0 <= 0x3F)
  {
    sub_21E4896EC(319, (unint64_t *)&qword_26AB08638, MEMORY[0x263F18FF8]);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_21E4896EC(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_21E4D0280();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_21E489740()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21E4898A4@<X0>(uint64_t *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  unint64_t v24 = a4;
  uint64_t v9 = v5;
  uint64_t v11 = sub_21E4D0400();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(a1);
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21E48A534(v9, (uint64_t)v17, a1);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v18 = a2(0);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 32))(a5, v17, v18);
  }
  else
  {
    os_log_type_t v20 = sub_21E4D0CC0();
    char v21 = sub_21E4D0530();
    if (os_log_type_enabled(v21, v20))
    {
      uint64_t v22 = swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      uint64_t v25 = v23;
      *(_DWORD *)uint64_t v22 = 136315138;
      *(void *)(v22 + 4) = sub_21E489B2C(a3, v24, &v25);
      _os_log_impl(&dword_21E433000, v21, v20, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v22, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C29AE0](v23, -1, -1);
      MEMORY[0x223C29AE0](v22, -1, -1);
    }

    sub_21E4D03F0();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
}

unint64_t sub_21E489B2C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v6 = sub_21E489C00(v12, 0, 0, 1, a1, a2);
  unint64_t v7 = v12[0];
  if (v6)
  {
    unint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_21E48A4D8((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_21E48A4D8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

unint64_t sub_21E489C00(unint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v10 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v10)
        {
          v12[0] = a5;
          v12[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          memcpy(__dst, v12, HIBYTE(a6) & 0xF);
          unint64_t result = 0;
          *((unsigned char *)__dst + v10) = 0;
          *a1 = (unint64_t)__dst;
          return result;
        }
      }
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    unint64_t result = sub_21E489D00(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    unint64_t result = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    unint64_t result = sub_21E4D0E00();
    if (!result)
    {
      __break(1u);
      return result;
    }
  }
  *a1 = result;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_21E489D00(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_21E489D98(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_21E489E9C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_21E489E9C((char *)(v3 > 1), v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_21E489D98(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_9;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_21E489E34(v2, 0);
      uint64_t result = sub_21E4D0DD0();
      if (v5) {
        break;
      }
      if (result == v2) {
        return (uint64_t)v3;
      }
      __break(1u);
LABEL_9:
      uint64_t v2 = sub_21E4D0B70();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_21E489E34(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F930);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  void v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_21E489E9C(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F930);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_21E489F88(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_21E489FA8(a1, a2, a3, *v3);
  *unint64_t v3 = result;
  return result;
}

char *sub_21E489FA8(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F8F0);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 8 * v8);
  }
  swift_release();
  return v10;
}

uint64_t sub_21E48A0A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for QuantityChart();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21E48A108()
{
  uint64_t v1 = type metadata accessor for QuantityChart();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F848);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_21E4D04A0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v0 + v3, v5);
  }
  else
  {
    swift_release();
  }
  uint64_t v6 = v0 + v3 + *(int *)(v1 + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F850);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_21E4D0320();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  }
  else
  {
    swift_release();
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_21E48A29C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for QuantityChart();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_21E48A300@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for QuantityChart() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  return sub_21E4875B8(a1, v6, a2);
}

uint64_t sub_21E48A380(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_21E48A3C4()
{
  unint64_t result = qword_267D2F910;
  if (!qword_267D2F910)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2F910);
  }
  return result;
}

uint64_t sub_21E48A418(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_21E4D0320();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_21E48A45C(uint64_t a1)
{
  return a1;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_21E48A4D8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_21E48A534(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

double UIColor.HSBAColorParameters.hue.getter()
{
  return *(double *)v0;
}

double UIColor.HSBAColorParameters.saturation.getter()
{
  return *(double *)(v0 + 8);
}

double UIColor.HSBAColorParameters.brightness.getter()
{
  return *(double *)(v0 + 16);
}

double UIColor.HSBAColorParameters.alpha.getter()
{
  return *(double *)(v0 + 24);
}

void sub_21E48A5B8(double *a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>)
{
  *a1 = a2;
  a1[1] = a3;
  a1[2] = a4;
  a1[3] = a5;
}

double UIColor.RGBAColorParameters.red.getter()
{
  return *(double *)v0;
}

double UIColor.hsbaParameters.getter@<D0>(void *a1@<X8>)
{
  return sub_21E48A68C((SEL *)&selRef_getHue_saturation_brightness_alpha_, a1);
}

double UIColor.rgbaParameters.getter@<D0>(void *a1@<X8>)
{
  return sub_21E48A68C((SEL *)&selRef_getRed_green_blue_alpha_, a1);
}

double sub_21E48A68C@<D0>(SEL *a1@<X0>, void *a2@<X8>)
{
  v11[1] = *MEMORY[0x263EF8340];
  uint64_t v10 = 0;
  v11[0] = 0;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  objc_msgSend(v2, *a1, v11, &v10, &v9, &v8);
  uint64_t v5 = v10;
  double result = *(double *)v11;
  uint64_t v7 = v8;
  uint64_t v6 = v9;
  *a2 = v11[0];
  a2[1] = v5;
  a2[2] = v6;
  a2[3] = v7;
  return result;
}

uint64_t _s19HSBAColorParametersVwCP(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t _s19HSBAColorParametersVwet(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t _s19HSBAColorParametersVwst(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 32) = v3;
  return result;
}

ValueMetadata *type metadata accessor for UIColor.HSBAColorParameters()
{
  return &type metadata for UIColor.HSBAColorParameters;
}

ValueMetadata *type metadata accessor for UIColor.RGBAColorParameters()
{
  return &type metadata for UIColor.RGBAColorParameters;
}

id sub_21E48A7E0()
{
  id v1 = *v0;
  id v2 = *v0;
  return v1;
}

uint64_t sub_21E48A808()
{
  return *(unsigned __int8 *)(v0 + 8);
}

id sub_21E48A810()
{
  return *(id *)(v0 + 16);
}

id sub_21E48A818()
{
  uint64_t v0 = sub_21E4CFEE0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  char v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08A30]), sel_init);
  sub_21E4CFE90();
  uint64_t v5 = (void *)sub_21E4CFE80();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  objc_msgSend(v4, sel_setLocale_, v5);

  objc_msgSend(v4, sel_setNumberStyle_, 0);
  id result = objc_msgSend(v4, sel_setMinimumIntegerDigits_, 2);
  qword_267D32A90 = (uint64_t)v4;
  return result;
}

uint64_t *sub_21E48A94C()
{
  if (qword_267D305A0 != -1) {
    swift_once();
  }
  return &qword_267D32A90;
}

id sub_21E48A998()
{
  if (qword_267D305A0 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_267D32A90;
  return v0;
}

id sub_21E48A9F4()
{
  if (!*v0) {
    goto LABEL_4;
  }
  uint64_t v1 = v0;
  id v2 = *v0;
  if (objc_msgSend(v2, sel_paused))
  {

LABEL_4:
    id v3 = sub_21E4B69E4();
    uint64_t v4 = sub_21E4B6A0C(v3, 0, 0);

    return (id)v4;
  }
  if (sub_21E4AE99C())
  {
    id v5 = objc_msgSend(v2, sel_appleMoveTime);
    id v6 = objc_msgSend(self, sel_minuteUnit);
    objc_msgSend(v5, sel_doubleValueForUnit_, v6);
    double v8 = v7;

LABEL_9:
    if (qword_267D305A0 != -1) {
      swift_once();
    }
    uint64_t v15 = (void *)qword_267D32A90;
    id v16 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, v8);
    id v17 = objc_msgSend(v15, sel_stringFromNumber_, v16);

    if (v17)
    {
      uint64_t v4 = sub_21E4D0AF0();
    }
    else
    {

      return 0;
    }
    return (id)v4;
  }
  id result = objc_msgSend(v1[2], sel_unitManager);
  if (result)
  {
    uint64_t v10 = result;
    id v11 = objc_msgSend(result, sel_userActiveEnergyBurnedUnit);

    id v12 = objc_msgSend(v2, sel_activeEnergyBurned);
    objc_msgSend(v12, sel_doubleValueForUnit_, v11);
    double v14 = v13;

    double v8 = floor(v14);
    goto LABEL_9;
  }
  __break(1u);
  return result;
}

uint64_t sub_21E48AC1C()
{
  return sub_21E48AC44((SEL *)&selRef_appleExerciseTime, (SEL *)&selRef_minuteUnit);
}

uint64_t sub_21E48AC30()
{
  return sub_21E48AC44((SEL *)&selRef_appleStandHours, (SEL *)&selRef_countUnit);
}

uint64_t sub_21E48AC44(SEL *a1, SEL *a2)
{
  if (!*v2) {
    goto LABEL_4;
  }
  id v5 = *v2;
  if (objc_msgSend(v5, sel_paused))
  {

LABEL_4:
    id v6 = sub_21E4B69E4();
    uint64_t v7 = sub_21E4B6A0C(v6, 0, 0);

    return v7;
  }
  id v8 = [v5 *a1];
  id v9 = [self *a2];
  objc_msgSend(v8, sel_doubleValueForUnit_, v9);
  double v11 = v10;

  if (qword_267D305A0 != -1) {
    swift_once();
  }
  id v12 = (void *)qword_267D32A90;
  id v13 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, v11);
  id v14 = objc_msgSend(v12, sel_stringFromNumber_, v13);

  if (v14)
  {
    uint64_t v7 = sub_21E4D0AF0();
  }
  else
  {

    return 0;
  }
  return v7;
}

void sub_21E48ADE0()
{
}

void sub_21E48ADEC()
{
}

void sub_21E48ADF8()
{
}

void sub_21E48AE04(SEL *a1)
{
  if (*v1)
  {
    id v3 = *v1;
    if (objc_msgSend(v3, sel_paused))
    {
      id v4 = objc_msgSend(self, sel_pausedRingsColors);
      if (v4)
      {
        id v5 = v4;
        id v6 = objc_msgSend(v4, sel_nonGradientTextColor);

        if (v6)
        {

          return;
        }
        goto LABEL_13;
      }
LABEL_12:
      __break(1u);
LABEL_13:
      __break(1u);
      return;
    }
  }
  id v7 = [self *a1];
  if (!v7)
  {
    __break(1u);
    goto LABEL_11;
  }
  id v8 = v7;
  id v9 = objc_msgSend(v7, sel_textDisplayColor);

  if (!v9)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
}

uint64_t sub_21E48AEF8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v69 = a1;
  uint64_t v57 = sub_21E4CFD10();
  uint64_t v62 = *(void *)(v57 - 8);
  MEMORY[0x270FA5388](v57);
  uint64_t v58 = (char *)&v53 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F938);
  MEMORY[0x270FA5388](v2 - 8);
  id v4 = (char *)&v53 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F940);
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  uint64_t v61 = (char *)&v53 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v59 = (char *)&v53 - v9;
  MEMORY[0x270FA5388](v8);
  double v11 = (char *)&v53 - v10;
  uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F948);
  uint64_t v12 = *(void *)(v56 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v56);
  uint64_t v55 = (uint64_t)&v53 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v54 = (uint64_t)&v53 - v16;
  MEMORY[0x270FA5388](v15);
  uint64_t v53 = (uint64_t)&v53 - v17;
  uint64_t v18 = sub_21E4CFD50();
  MEMORY[0x270FA5388](v18 - 8);
  os_log_type_t v20 = (char *)&v53 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v21 = sub_21E4B69E4();
  uint64_t v22 = sub_21E4B6A0C(v21, 0, 0);
  uint64_t v24 = v23;

  id v25 = sub_21E4B69E4();
  sub_21E4B6A0C(v25, 0, 0);

  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F950);
  uint64_t v26 = swift_allocObject();
  *(_OWORD *)(v26 + 16) = xmmword_21E4D9380;
  uint64_t v27 = MEMORY[0x263F8D310];
  *(void *)(v26 + 56) = MEMORY[0x263F8D310];
  unint64_t v28 = sub_21E48B95C();
  *(void *)(v26 + 32) = 1702260589;
  *(void *)(v26 + 40) = 0xE400000000000000;
  *(void *)(v26 + 96) = v27;
  *(void *)(v26 + 104) = v28;
  *(void *)(v26 + 64) = v28;
  *(void *)(v26 + 72) = v22;
  *(void *)(v26 + 80) = v24;
  *(void *)(v26 + 136) = v27;
  *(void *)(v26 + 144) = v28;
  *(void *)(v26 + 112) = 0x6573696372657865;
  *(void *)(v26 + 120) = 0xE800000000000000;
  *(void *)(v26 + 176) = v27;
  *(void *)(v26 + 184) = v28;
  *(void *)(v26 + 152) = v22;
  *(void *)(v26 + 160) = v24;
  *(void *)(v26 + 216) = v27;
  *(void *)(v26 + 224) = v28;
  *(void *)(v26 + 192) = 0x646E617473;
  *(void *)(v26 + 200) = 0xE500000000000000;
  swift_bridgeObjectRetain();
  uint64_t v29 = v57;
  sub_21E4D0B00();
  swift_bridgeObjectRelease();
  sub_21E4CFD40();
  sub_21E4CFD20();
  uint64_t KeyPath = swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v71 = sub_21E4D0700();
  sub_21E48BA10();
  uint64_t v30 = v56;
  sub_21E4CFCF0();
  uint64_t v71 = 1702260589;
  unint64_t v72 = 0xE400000000000000;
  uint64_t v31 = sub_21E4CFEE0();
  uint64_t v32 = *(void *)(v31 - 8);
  v66 = *(void (**)(char *, uint64_t, uint64_t))(v32 + 56);
  uint64_t v67 = v31;
  uint64_t v65 = v32 + 56;
  v66(v4, 1, 1);
  sub_21E48BA90();
  unint64_t v64 = sub_21E48BAE8();
  sub_21E4CFD90();
  sub_21E489000((uint64_t)v4, &qword_267D2F938);
  uint64_t v33 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
  uint64_t v68 = v12 + 48;
  uint64_t v63 = v33;
  if (v33(v11, 1, v30) == 1)
  {
    sub_21E489000((uint64_t)v11, &qword_267D2F940);
    uint64_t v34 = v62;
    uint64_t v35 = v58;
  }
  else
  {
    uint64_t v36 = v53;
    sub_21E48BE28((uint64_t)v11, v53, &qword_267D2F948);
    sub_21E48A9F4();
    sub_21E4CFD40();
    uint64_t v35 = v58;
    sub_21E4CFD20();
    uint64_t v37 = swift_getKeyPath();
    *(&v53 - 2) = MEMORY[0x270FA5388](v37);
    swift_getKeyPath();
    sub_21E48AE04((SEL *)&selRef_energyColors);
    uint64_t v71 = v38;
    sub_21E48BB9C();
    sub_21E4CFCF0();
    sub_21E48A380(&qword_267D2F980, &qword_267D2F948);
    sub_21E4CFD00();
    uint64_t v34 = v62;
    (*(void (**)(char *, uint64_t))(v62 + 8))(v35, v29);
    sub_21E489000(v36, &qword_267D2F948);
  }
  uint64_t v60 = v20;
  uint64_t v71 = 0x6573696372657865;
  unint64_t v72 = 0xE800000000000000;
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v66)(v4, 1, 1, v67);
  uint64_t v39 = v59;
  sub_21E4CFD90();
  sub_21E489000((uint64_t)v4, &qword_267D2F938);
  if (v63(v39, 1, v30) == 1)
  {
    uint64_t v40 = &qword_267D2F940;
    uint64_t v41 = (uint64_t)v39;
  }
  else
  {
    uint64_t v42 = (uint64_t)v39;
    uint64_t v43 = v54;
    sub_21E48BE28(v42, v54, &qword_267D2F948);
    sub_21E48AC44((SEL *)&selRef_appleExerciseTime, (SEL *)&selRef_minuteUnit);
    sub_21E4CFD40();
    sub_21E4CFD20();
    uint64_t v44 = swift_getKeyPath();
    *(&v53 - 2) = MEMORY[0x270FA5388](v44);
    swift_getKeyPath();
    sub_21E48AE04((SEL *)&selRef_briskColors);
    uint64_t v71 = v45;
    sub_21E48BB9C();
    uint64_t v34 = v62;
    sub_21E4CFCF0();
    sub_21E48A380(&qword_267D2F980, &qword_267D2F948);
    sub_21E4CFD00();
    (*(void (**)(char *, uint64_t))(v34 + 8))(v35, v29);
    uint64_t v41 = v43;
    uint64_t v40 = &qword_267D2F948;
  }
  sub_21E489000(v41, v40);
  uint64_t v46 = (uint64_t)v61;
  uint64_t v71 = 0x646E617473;
  unint64_t v72 = 0xE500000000000000;
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v66)(v4, 1, 1, v67);
  sub_21E4CFD90();
  sub_21E489000((uint64_t)v4, &qword_267D2F938);
  if (v63((char *)v46, 1, v30) == 1)
  {
    uint64_t v47 = &qword_267D2F940;
    uint64_t v48 = v46;
  }
  else
  {
    uint64_t v49 = v55;
    sub_21E48BE28(v46, v55, &qword_267D2F948);
    sub_21E48AC44((SEL *)&selRef_appleStandHours, (SEL *)&selRef_countUnit);
    sub_21E4CFD40();
    sub_21E4CFD20();
    uint64_t v50 = swift_getKeyPath();
    *(&v53 - 2) = MEMORY[0x270FA5388](v50);
    swift_getKeyPath();
    sub_21E48AE04((SEL *)&selRef_sedentaryColors);
    uint64_t v71 = v51;
    sub_21E48BB9C();
    sub_21E4CFCF0();
    sub_21E48A380(&qword_267D2F980, &qword_267D2F948);
    sub_21E4CFD00();
    (*(void (**)(char *, uint64_t))(v34 + 8))(v35, v29);
    uint64_t v48 = v49;
    uint64_t v47 = &qword_267D2F948;
  }
  return sub_21E489000(v48, v47);
}

unint64_t sub_21E48B95C()
{
  unint64_t result = qword_267D2F958;
  if (!qword_267D2F958)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2F958);
  }
  return result;
}

uint64_t sub_21E48B9B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_21E48C598(a1, a2, a3, &qword_267D2F9C8);
}

uint64_t sub_21E48B9BC(uint64_t a1, uint64_t a2)
{
  return sub_21E48C5FC(a1, a2, &qword_267D2F9C8);
}

void sub_21E48B9C8()
{
}

void sub_21E48B9F0()
{
}

unint64_t sub_21E48BA10()
{
  unint64_t result = qword_267D2F960;
  if (!qword_267D2F960)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2F960);
  }
  return result;
}

uint64_t sub_21E48BA64()
{
  return 8;
}

uint64_t sub_21E48BA70()
{
  return swift_release();
}

uint64_t sub_21E48BA78(void *a1, void *a2)
{
  *a2 = *a1;
  return swift_retain();
}

void *sub_21E48BA84(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

unint64_t sub_21E48BA90()
{
  unint64_t result = qword_267D2F968;
  if (!qword_267D2F968)
  {
    sub_21E4CFD10();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2F968);
  }
  return result;
}

unint64_t sub_21E48BAE8()
{
  unint64_t result = qword_267D2F970;
  if (!qword_267D2F970)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2F970);
  }
  return result;
}

uint64_t sub_21E48BB3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_21E48C598(a1, a2, a3, &qword_267D2F9C0);
}

uint64_t sub_21E48BB48(uint64_t a1, uint64_t a2)
{
  return sub_21E48C5FC(a1, a2, &qword_267D2F9C0);
}

void sub_21E48BB54()
{
}

void sub_21E48BB7C()
{
}

unint64_t sub_21E48BB9C()
{
  unint64_t result = qword_267D2F978;
  if (!qword_267D2F978)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2F978);
  }
  return result;
}

uint64_t sub_21E48BBF0()
{
  return 8;
}

void sub_21E48BBFC()
{
  if (!*v0) {
    goto LABEL_5;
  }
  uint64_t v1 = v0;
  id v2 = *v0;
  BOOL v3 = sub_21E4AE99C();
  id v4 = v1[2];
  if (v3)
  {
    id v5 = objc_msgSend(v2, sel_appleMoveTime);
    id v6 = objc_msgSend(v4, sel_localizedStringWithMoveMinutes_, v5);

    if (!v6)
    {
      __break(1u);
LABEL_5:
      id v6 = sub_21E4B69E4();
      sub_21E4B6A0C(v6, 0, 0);
LABEL_8:

      return;
    }
LABEL_7:
    sub_21E4D0AF0();

    goto LABEL_8;
  }
  id v7 = objc_msgSend(v2, sel_activeEnergyBurned);
  id v6 = objc_msgSend(v4, sel_localizedStringWithActiveEnergy_, v7);

  if (v6) {
    goto LABEL_7;
  }
  __break(1u);
}

id sub_21E48BD28()
{
  sub_21E48BE28(v0, (uint64_t)v5, &qword_267D2F988);
  sub_21E48BE28((uint64_t)v5, (uint64_t)&v6, &qword_267D2F988);
  if (v6 && sub_21E4AE99C())
  {
    id v1 = sub_21E4B69E4();
    uint64_t v2 = sub_21E4B6A0C(v1, 0, 0);

    return (id)v2;
  }
  id result = objc_msgSend(*(id *)(v0 + 16), sel_localizedShortActiveEnergyUnitString);
  if (result)
  {
    id v4 = result;
    sub_21E4D0AF0();

    sub_21E48BAE8();
    uint64_t v2 = sub_21E4D0D50();
    swift_bridgeObjectRelease();
    return (id)v2;
  }
  __break(1u);
  return result;
}

uint64_t sub_21E48BE28(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void sub_21E48BE8C(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F990);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v49 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F938);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v57 = (char *)&v49 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F940);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v58 = (char *)&v49 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F948);
  uint64_t v56 = *(void *)(v59 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v59);
  uint64_t v12 = (char *)&v49 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v52 = (uint64_t)&v49 - v13;
  uint64_t v14 = sub_21E4CFD10();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v49 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v60 = (char *)&v49 - v19;
  uint64_t v20 = sub_21E4CFD50();
  MEMORY[0x270FA5388](v20 - 8);
  if (*v1)
  {
    id v21 = *v1;
    if (objc_msgSend(v21, sel_paused))
    {
      id v22 = sub_21E4B69E4();
      sub_21E4B6A0C(v22, 0, 0);

      sub_21E4CFD40();
      sub_21E4CFD20();

      return;
    }
  }
  uint64_t v50 = v12;
  uint64_t v51 = v5;
  uint64_t v53 = a1;
  sub_21E48BBFC();
  uint64_t v24 = v23;
  uint64_t v54 = v25;
  uint64_t v55 = v14;
  id v26 = sub_21E48BD28();
  uint64_t v28 = v27;
  id v29 = sub_21E4B69E4();
  sub_21E4B6A0C(v29, 0, 0);
  uint64_t v30 = v15;

  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F950);
  uint64_t v31 = swift_allocObject();
  *(_OWORD *)(v31 + 16) = xmmword_21E4D9390;
  uint64_t v32 = MEMORY[0x263F8D310];
  *(void *)(v31 + 56) = MEMORY[0x263F8D310];
  unint64_t v33 = sub_21E48B95C();
  uint64_t v34 = v54;
  *(void *)(v31 + 32) = v24;
  *(void *)(v31 + 40) = v34;
  uint64_t v35 = v55;
  *(void *)(v31 + 96) = v32;
  *(void *)(v31 + 104) = v33;
  *(void *)(v31 + 64) = v33;
  *(void *)(v31 + 72) = v26;
  *(void *)(v31 + 80) = v28;
  swift_bridgeObjectRetain();
  sub_21E4D0B00();
  swift_bridgeObjectRelease();
  sub_21E4CFD40();
  uint64_t v36 = v60;
  sub_21E4CFD20();
  (*(void (**)(char *, char *, uint64_t))(v30 + 16))(v18, v36, v35);
  v61[0] = v26;
  v61[1] = v28;
  uint64_t v37 = sub_21E4CFEE0();
  uint64_t v38 = (uint64_t)v57;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v37 - 8) + 56))(v57, 1, 1, v37);
  sub_21E48BA90();
  sub_21E48BAE8();
  uint64_t v39 = (uint64_t)v58;
  sub_21E4CFD90();
  sub_21E489000(v38, &qword_267D2F938);
  (*(void (**)(char *, uint64_t))(v30 + 8))(v18, v35);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v56 + 48))(v39, 1, v59) == 1)
  {
    uint64_t v40 = &qword_267D2F940;
    uint64_t v41 = v39;
  }
  else
  {
    uint64_t v42 = v52;
    sub_21E48BE28(v39, v52, &qword_267D2F948);
    uint64_t v43 = (uint64_t)v50;
    sub_21E48C524(v42, (uint64_t)v50);
    uint64_t KeyPath = swift_getKeyPath();
    *(&v49 - 2) = MEMORY[0x270FA5388](KeyPath);
    swift_getKeyPath();
    uint64_t v45 = v51;
    sub_21E4D05D0();
    uint64_t v46 = sub_21E4D05E0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v46 - 8) + 56))(v45, 0, 1, v46);
    sub_21E48A380(&qword_267D2F980, &qword_267D2F948);
    uint64_t v47 = (void (*)(void *, void))sub_21E4CFD30();
    sub_21E48C688();
    sub_21E4CFD60();
    v47(v61, 0);
    uint64_t v48 = v43;
    uint64_t v36 = v60;
    sub_21E489000(v48, &qword_267D2F948);
    uint64_t v41 = v42;
    uint64_t v40 = &qword_267D2F948;
  }
  sub_21E489000(v41, v40);
  (*(void (**)(uint64_t, char *, uint64_t))(v30 + 32))(v53, v36, v35);
}

uint64_t sub_21E48C524(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F948);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21E48C58C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_21E48C598(a1, a2, a3, &qword_267D2F9B8);
}

uint64_t sub_21E48C598(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  return sub_21E4D0AA0() & 1;
}

uint64_t sub_21E48C5F0(uint64_t a1, uint64_t a2)
{
  return sub_21E48C5FC(a1, a2, &qword_267D2F9B8);
}

uint64_t sub_21E48C5FC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_21E4D0A60();
}

void sub_21E48C640()
{
}

void sub_21E48C668()
{
}

unint64_t sub_21E48C688()
{
  unint64_t result = qword_267D2F998;
  if (!qword_267D2F998)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2F998);
  }
  return result;
}

uint64_t sub_21E48C6DC()
{
  return 8;
}

uint64_t sub_21E48C6E8()
{
  id v0 = sub_21E4B69E4();
  uint64_t v1 = sub_21E4B6A0C(v0, 0, 0);

  return v1;
}

uint64_t sub_21E48C740()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

void sub_21E48C770(uint64_t a1@<X8>)
{
}

void sub_21E48C778(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F990);
  MEMORY[0x270FA5388](v3 - 8);
  v124 = (char *)&v112 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F938);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v112 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F940);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v112 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F948);
  v121 = *(unsigned int (***)(uint64_t, uint64_t, uint64_t))(v11 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  uint64_t v123 = (uint64_t)&v112 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v122 = (uint64_t)&v112 - v14;
  uint64_t v15 = sub_21E4CFD50();
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v17 = (char *)&v112 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v131 = sub_21E4CFD10();
  uint64_t v120 = *(void *)(v131 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v131);
  v129 = (char *)&v112 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  v130 = (char *)&v112 - v20;
  v127 = v1;
  id v21 = *v1;
  unsigned __int8 v22 = sub_21E4AEB58(*v1);
  id v23 = sub_21E4B69E4();
  uint64_t v24 = v23;
  if (v22)
  {
    sub_21E4B6A0C(v23, 0, 0);

    sub_21E4CFD40();
    sub_21E4CFD20();
    return;
  }
  uint64_t v128 = v11;
  v126 = (void (*)(void, void, void))sub_21E4B6A0C(v23, 0, 0);
  v125 = v25;
  id v26 = v127;

  id v27 = sub_21E4B69E4();
  uint64_t v117 = sub_21E4B6A0C(v27, 0, 0);
  uint64_t v29 = v28;

  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F950);
  v119 = (id *)swift_allocObject();
  *((_OWORD *)v119 + 1) = xmmword_21E4D9380;
  uint64_t v30 = (void *)MEMORY[0x263F8D310];
  v115 = v10;
  uint64_t v118 = v29;
  v116 = v17;
  if (v21)
  {
    id v31 = v21;
    if (objc_msgSend(v31, sel_paused))
    {
      id v32 = sub_21E4B69E4();
      uint64_t v33 = sub_21E4B6A0C(v32, 0, 0);
      uint64_t v35 = v34;

      goto LABEL_8;
    }
  }
  sub_21E48BBFC();
  uint64_t v37 = v36;
  uint64_t v39 = v38;
  uint64_t v113 = (uint64_t)sub_21E48BD28();
  uint64_t v41 = v40;
  id v42 = sub_21E4B69E4();
  sub_21E4B6A0C(v42, 0, 0);

  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F950);
  uint64_t v43 = swift_allocObject();
  *(_OWORD *)(v43 + 16) = xmmword_21E4D9390;
  *(void *)(v43 + 56) = v30;
  unint64_t v44 = sub_21E48B95C();
  *(void *)(v43 + 32) = v37;
  *(void *)(v43 + 40) = v39;
  *(void *)(v43 + 96) = v30;
  *(void *)(v43 + 104) = v44;
  uint64_t v45 = v113;
  *(void *)(v43 + 64) = v44;
  *(void *)(v43 + 72) = v45;
  *(void *)(v43 + 80) = v41;
  uint64_t v33 = sub_21E4D0B00();
  uint64_t v35 = v46;
  swift_bridgeObjectRelease();
LABEL_8:
  uint64_t v47 = a1;
  uint64_t v48 = v119;
  v119[7] = v30;
  unint64_t v49 = sub_21E48B95C();
  v48[4] = (id)v33;
  v48[5] = v35;
  v48[12] = v30;
  v48[13] = (id)v49;
  uint64_t v50 = v126;
  v48[8] = (id)v49;
  v48[9] = v50;
  v48[10] = v125;
  swift_bridgeObjectRetain();
  uint64_t v51 = *v26;
  if (*v26)
  {
    id v52 = v51;
    if (objc_msgSend(v52, sel_paused))
    {
      id v53 = sub_21E4B69E4();
      uint64_t v54 = sub_21E4B6A0C(v53, 0, 0);
      uint64_t v56 = v55;

      goto LABEL_15;
    }
    uint64_t v57 = v47;
    uint64_t v58 = v30;

    uint64_t v61 = v127;
    uint64_t v62 = v127[2];
    id v59 = v52;
    id v63 = objc_msgSend(v59, sel_appleExerciseTime);
    id v64 = objc_msgSend(v62, sel_localizedStringWithBriskMinutes_, v63);

    if (!v64)
    {
      __break(1u);
LABEL_29:
      __break(1u);
      goto LABEL_30;
    }
    uint64_t v113 = sub_21E4D0AF0();
    uint64_t v112 = v65;
  }
  else
  {
    uint64_t v57 = v47;
    uint64_t v58 = v30;
    id v59 = sub_21E4B69E4();
    uint64_t v113 = sub_21E4B6A0C(v59, 0, 0);
    uint64_t v112 = v60;
    uint64_t v61 = v127;
  }

  v66 = v61[3];
  uint64_t v67 = v61[4];
  swift_bridgeObjectRetain();
  id v68 = sub_21E4B69E4();
  sub_21E4B6A0C(v68, 0, 0);

  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F950);
  uint64_t v69 = swift_allocObject();
  *(_OWORD *)(v69 + 16) = xmmword_21E4D9390;
  *(void *)(v69 + 56) = v58;
  *(void *)(v69 + 64) = v49;
  uint64_t v70 = v112;
  *(void *)(v69 + 32) = v113;
  *(void *)(v69 + 40) = v70;
  *(void *)(v69 + 96) = v58;
  *(void *)(v69 + 104) = v49;
  *(void *)(v69 + 72) = v66;
  *(void *)(v69 + 80) = v67;
  uint64_t v54 = sub_21E4D0B00();
  uint64_t v56 = v71;
  swift_bridgeObjectRelease();
  uint64_t v51 = *v61;
  uint64_t v30 = v58;
  uint64_t v47 = v57;
  uint64_t v48 = v119;
LABEL_15:
  v48[17] = v30;
  v48[18] = (id)v49;
  v48[14] = (id)v54;
  v48[15] = v56;
  v48[22] = v30;
  v48[23] = (id)v49;
  unint64_t v72 = v125;
  v48[19] = v126;
  v48[20] = v72;
  uint64_t v114 = v47;
  if (!v51)
  {
LABEL_18:
    id v73 = sub_21E4B69E4();
    uint64_t v74 = sub_21E4B6A0C(v73, 0, 0);
    v76 = v75;
    goto LABEL_22;
  }
  id v73 = v51;
  if (objc_msgSend(v73, sel_paused))
  {

    goto LABEL_18;
  }
  v77 = v127[2];
  id v78 = objc_msgSend(v73, sel_appleStandHours);
  id v79 = objc_msgSend(v77, sel_localizedStringWithActiveHours_, v78);

  if (!v79) {
    goto LABEL_29;
  }
  v126 = (void (*)(void, void, void))sub_21E4D0AF0();
  v125 = v80;

  id v81 = objc_msgSend(v73, sel_appleStandHoursGoal);
  id v82 = objc_msgSend(v77, sel_localizedStringWithActiveHours_, v81);

  if (!v82)
  {
LABEL_30:
    __break(1u);
    return;
  }
  uint64_t v83 = sub_21E4D0AF0();
  uint64_t v85 = v84;

  id v86 = sub_21E4B69E4();
  sub_21E4B6A0C(v86, 0, 0);

  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F950);
  uint64_t v87 = swift_allocObject();
  *(_OWORD *)(v87 + 16) = xmmword_21E4D9390;
  *(void *)(v87 + 56) = v30;
  *(void *)(v87 + 64) = v49;
  v88 = v125;
  *(void *)(v87 + 32) = v126;
  *(void *)(v87 + 40) = v88;
  *(void *)(v87 + 96) = v30;
  *(void *)(v87 + 104) = v49;
  *(void *)(v87 + 72) = v83;
  *(void *)(v87 + 80) = v85;
  uint64_t v74 = sub_21E4D0B00();
  v76 = v89;
  swift_bridgeObjectRelease();
LABEL_22:
  uint64_t v90 = (uint64_t)v115;

  v48[27] = v30;
  v48[28] = (id)v49;
  v48[24] = (id)v74;
  v48[25] = v76;
  sub_21E4D0B00();
  swift_bridgeObjectRelease();
  sub_21E4CFD40();
  v91 = v130;
  sub_21E4CFD20();
  long long v133 = xmmword_21E4D93A0;
  v119 = &v134;
  v92 = v127;
  id v134 = sub_21E48BD28();
  uint64_t v135 = v93;
  long long v94 = *(_OWORD *)(v92 + 9);
  long long v138 = *(_OWORD *)(v92 + 3);
  long long v139 = v94;
  long long v136 = v94;
  long long v137 = v138;
  sub_21E48FB3C((uint64_t)&v139);
  sub_21E48FB3C((uint64_t)&v138);
  uint64_t v95 = 0;
  v126 = *(void (**)(void, void, void))(v120 + 16);
  v127 = (void **)(v120 + 16);
  v125 = (void (**)(char *, uint64_t))(v120 + 8);
  v96 = v121 + 6;
  v121 += 6;
  do
  {
    uint64_t v99 = *(uint64_t *)((char *)&v134 + v95);
    uint64_t v100 = *(uint64_t *)((char *)&v135 + v95);
    v101 = v129;
    uint64_t v102 = v131;
    v126(v129, v91, v131);
    v132[0] = v99;
    v132[1] = v100;
    uint64_t v103 = sub_21E4CFEE0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v103 - 8) + 56))(v7, 1, 1, v103);
    sub_21E48BA90();
    sub_21E48BAE8();
    swift_bridgeObjectRetain();
    sub_21E4CFD90();
    sub_21E489000((uint64_t)v7, &qword_267D2F938);
    (*v125)(v101, v102);
    swift_bridgeObjectRelease();
    if ((*v96)(v90, 1, v128) == 1)
    {
      uint64_t v97 = v90;
      v98 = &qword_267D2F940;
    }
    else
    {
      uint64_t v104 = v122;
      sub_21E48BE28(v90, v122, &qword_267D2F948);
      uint64_t v105 = v123;
      sub_21E48C524(v104, v123);
      uint64_t KeyPath = swift_getKeyPath();
      *(&v112 - 2) = MEMORY[0x270FA5388](KeyPath);
      swift_getKeyPath();
      uint64_t v107 = v90;
      v108 = v7;
      v109 = v124;
      sub_21E4D05D0();
      uint64_t v110 = sub_21E4D05E0();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v110 - 8) + 56))(v109, 0, 1, v110);
      sub_21E48A380(&qword_267D2F980, &qword_267D2F948);
      v111 = (void (*)(void *, void))sub_21E4CFD30();
      sub_21E48C688();
      uint64_t v7 = v108;
      uint64_t v90 = v107;
      sub_21E4CFD60();
      v111(v132, 0);
      sub_21E489000(v105, &qword_267D2F948);
      uint64_t v97 = v104;
      v91 = v130;
      v98 = &qword_267D2F948;
      v96 = v121;
    }
    sub_21E489000(v97, v98);
    v95 += 16;
  }
  while (v95 != 48);
  swift_arrayDestroy();
  (*(void (**)(uint64_t, char *, uint64_t))(v120 + 32))(v114, v91, v131);
}

void sub_21E48D4F4(uint64_t a1@<X8>)
{
}

uint64_t sub_21E48D4FC()
{
  id v0 = sub_21E4B69E4();
  uint64_t v1 = sub_21E4B6A0C(v0, 0, 0);

  return v1;
}

uint64_t sub_21E48D560()
{
  id v0 = sub_21E4B69E4();
  uint64_t v1 = sub_21E4B6A0C(v0, 0, 0);

  return v1;
}

uint64_t sub_21E48D5C4()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F950);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_21E4D9390;
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v2 = *(void *)(v0 + 48);
  uint64_t v4 = MEMORY[0x263F8D310];
  *(void *)(v1 + 56) = MEMORY[0x263F8D310];
  unint64_t v5 = sub_21E48B95C();
  *(void *)(v1 + 32) = v3;
  *(void *)(v1 + 40) = v2;
  *(void *)(v1 + 96) = v4;
  *(void *)(v1 + 104) = v5;
  *(void *)(v1 + 64) = v5;
  *(void *)(v1 + 72) = v3;
  *(void *)(v1 + 80) = v2;
  swift_bridgeObjectRetain_n();
  return sub_21E4D0B00();
}

void sub_21E48D668()
{
  uint64_t v1 = v0;
  if (!*v0) {
    goto LABEL_4;
  }
  id v2 = *v0;
  if (!objc_msgSend(v2, sel_paused))
  {
    BOOL v7 = sub_21E4AE99C();
    id v8 = v1[2];
    if (v7)
    {
      id v9 = objc_msgSend(v2, sel_appleMoveTime);
      id v10 = objc_msgSend(v8, sel_localizedStringWithMoveMinutes_, v9);

      if (!v10)
      {
        __break(1u);
        goto LABEL_16;
      }
      uint64_t v5 = sub_21E4D0AF0();
      id v6 = v11;

      id v12 = objc_msgSend(v2, sel_appleMoveTimeGoal);
      id v13 = objc_msgSend(v8, sel_localizedStringWithMoveMinutes_, v12);

      if (v13)
      {
LABEL_11:
        uint64_t v3 = sub_21E4D0AF0();
        id v4 = v18;

        goto LABEL_12;
      }
      __break(1u);
    }
    id v14 = objc_msgSend(v2, sel_activeEnergyBurned);
    id v15 = objc_msgSend(v8, sel_localizedStringWithActiveEnergy_, v14);

    if (v15)
    {
      uint64_t v5 = sub_21E4D0AF0();
      id v6 = v16;

      id v17 = objc_msgSend(v2, sel_activeEnergyBurnedGoal);
      id v13 = objc_msgSend(v8, sel_localizedStringWithActiveEnergy_, v17);

      if (v13) {
        goto LABEL_11;
      }
LABEL_17:
      __break(1u);
      return;
    }
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }

LABEL_4:
  uint64_t v3 = (uint64_t)v1[5];
  id v4 = v1[6];
  swift_bridgeObjectRetain_n();
  uint64_t v5 = v3;
  id v6 = v4;
LABEL_12:
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F950);
  uint64_t v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_21E4D9390;
  uint64_t v20 = MEMORY[0x263F8D310];
  *(void *)(v19 + 56) = MEMORY[0x263F8D310];
  unint64_t v21 = sub_21E48B95C();
  *(void *)(v19 + 32) = v5;
  *(void *)(v19 + 40) = v6;
  *(void *)(v19 + 96) = v20;
  *(void *)(v19 + 104) = v21;
  *(void *)(v19 + 64) = v21;
  *(void *)(v19 + 72) = v3;
  *(void *)(v19 + 80) = v4;
  sub_21E4D0B00();
}

void sub_21E48D8AC()
{
}

void sub_21E48D8C8()
{
}

void sub_21E48D8E4(SEL *a1, SEL *a2, SEL *a3)
{
  if (*(void *)v3)
  {
    id v7 = *(id *)v3;
    if (!objc_msgSend(v7, sel_paused))
    {
      id v12 = *(void **)(v3 + 16);
      id v13 = [v7 *a1];
      id v14 = objc_msgSend(v12, *a2, v13);

      if (v14)
      {
        uint64_t v10 = sub_21E4D0AF0();
        uint64_t v11 = v15;

        id v16 = [v7 *a3];
        id v17 = objc_msgSend(v12, *a2, v16);

        if (v17)
        {
          uint64_t v8 = sub_21E4D0AF0();
          uint64_t v9 = v18;

          goto LABEL_8;
        }
      }
      else
      {
        __break(1u);
      }
      __break(1u);
      return;
    }
  }
  uint64_t v8 = *(void *)(v3 + 40);
  uint64_t v9 = *(void *)(v3 + 48);
  swift_bridgeObjectRetain_n();
  uint64_t v10 = v8;
  uint64_t v11 = v9;
LABEL_8:
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F950);
  uint64_t v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_21E4D9390;
  uint64_t v20 = MEMORY[0x263F8D310];
  *(void *)(v19 + 56) = MEMORY[0x263F8D310];
  unint64_t v21 = sub_21E48B95C();
  *(void *)(v19 + 32) = v10;
  *(void *)(v19 + 40) = v11;
  *(void *)(v19 + 96) = v20;
  *(void *)(v19 + 104) = v21;
  *(void *)(v19 + 64) = v21;
  *(void *)(v19 + 72) = v8;
  *(void *)(v19 + 80) = v9;
  sub_21E4D0B00();
}

uint64_t sub_21E48DA7C()
{
  id v0 = sub_21E4B69E4();
  uint64_t v1 = sub_21E4B6A0C(v0, 0, 0);

  return v1;
}

uint64_t sub_21E48DAD4()
{
  uint64_t v1 = *(void *)(v0 + 72);
  swift_bridgeObjectRetain();
  return v1;
}

void sub_21E48DB04(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  id v5 = sub_21E4B69E4();
  uint64_t v6 = sub_21E4B6A0C(v5, 0, 0);
  uint64_t v8 = v7;

  id v9 = sub_21E4B69E4();
  uint64_t v10 = sub_21E4B6A0C(v9, 0, 0);
  uint64_t v12 = v11;

  id v13 = sub_21E4B69E4();
  uint64_t v14 = sub_21E4B6A0C(v13, 0, 0);
  uint64_t v16 = v15;

  id v17 = sub_21E4B69E4();
  uint64_t v18 = sub_21E4B6A0C(v17, 0, 0);
  uint64_t v20 = v19;

  *(void *)a4 = a1;
  *(unsigned char *)(a4 + 8) = a2;
  *(void *)(a4 + 16) = a3;
  *(void *)(a4 + 24) = v6;
  *(void *)(a4 + 32) = v8;
  *(void *)(a4 + 40) = v10;
  *(void *)(a4 + 48) = v12;
  *(void *)(a4 + 56) = v14;
  *(void *)(a4 + 64) = v16;
  *(void *)(a4 + 72) = v18;
  *(void *)(a4 + 80) = v20;
}

uint64_t sub_21E48DC4C()
{
  if (*v0)
  {
    id v1 = *v0;
    if (objc_msgSend(v1, sel_paused))
    {
      id v2 = sub_21E4B69E4();
      uint64_t v3 = sub_21E4B6A0C(v2, 0, 0);

      return v3;
    }

    sub_21E4AEAA8();
    double v6 = floor(v8 * 100.0);
    objc_msgSend(v1, sel__exerciseTimeCompletionPercentage);
    double v5 = floor(v9 * 100.0);
    objc_msgSend(v1, sel__standHoursCompletionPercentage);
    double v7 = v10 * 100.0;
  }
  else
  {
    double v5 = 0.0;
    double v6 = 0.0;
    double v7 = 0.0;
  }
  double v11 = floor(v7);
  id v12 = sub_21E4B69E4();
  sub_21E4B6A0C(v12, 0, 0);

  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F950);
  uint64_t v13 = swift_allocObject();
  uint64_t v14 = MEMORY[0x263F8D538];
  *(_OWORD *)(v13 + 16) = xmmword_21E4D93A0;
  uint64_t v15 = MEMORY[0x263F8D5B8];
  *(void *)(v13 + 56) = v14;
  *(void *)(v13 + 64) = v15;
  *(double *)(v13 + 32) = v6;
  *(void *)(v13 + 96) = v14;
  *(void *)(v13 + 104) = v15;
  *(double *)(v13 + 72) = v5;
  *(void *)(v13 + 136) = v14;
  *(void *)(v13 + 144) = v15;
  *(double *)(v13 + 112) = v11;
  uint64_t v16 = sub_21E4D0AC0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v16;
}

uint64_t sub_21E48DE34()
{
  id v1 = *v0;
  if (sub_21E4AEB58(*v0))
  {
    id v2 = sub_21E4B69E4();
    uint64_t v3 = sub_21E4B6A0C(v2, 0, 0);
  }
  else if (v1 {
         && (id v4 = v1, v5 = objc_msgSend(v4, sel_paused), v4, (v5 & 1) != 0))
  }
  {
    return 0;
  }
  else
  {
    id v6 = sub_21E4B69E4();
    sub_21E4B6A0C(v6, 0, 0);

    __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F9A0);
    uint64_t v7 = swift_allocObject();
    *(_OWORD *)(v7 + 16) = xmmword_21E4D93A0;
    id v8 = sub_21E4B69E4();
    sub_21E4B6A0C(v8, 0, 0);

    __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F950);
    uint64_t v9 = swift_allocObject();
    *(_OWORD *)(v9 + 16) = xmmword_21E4D9230;
    id v10 = sub_21E48E1EC();
    uint64_t v12 = v11;
    *(void *)(v9 + 56) = MEMORY[0x263F8D310];
    unint64_t v13 = sub_21E48B95C();
    *(void *)(v9 + 64) = v13;
    *(void *)(v9 + 32) = v10;
    *(void *)(v9 + 40) = v12;
    uint64_t v14 = sub_21E4D0AC0();
    uint64_t v16 = v15;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(void *)(v7 + 32) = v14;
    *(void *)(v7 + 40) = v16;
    id v17 = sub_21E4B69E4();
    sub_21E4B6A0C(v17, 0, 0);

    uint64_t v18 = swift_allocObject();
    *(_OWORD *)(v18 + 16) = xmmword_21E4D9230;
    uint64_t v19 = sub_21E48E59C((SEL *)&selRef_minuteUnit, (SEL *)&selRef_appleExerciseTime);
    uint64_t v20 = MEMORY[0x263F8D310];
    *(void *)(v18 + 56) = MEMORY[0x263F8D310];
    *(void *)(v18 + 64) = v13;
    *(void *)(v18 + 32) = v19;
    *(void *)(v18 + 40) = v21;
    uint64_t v22 = sub_21E4D0AC0();
    uint64_t v24 = v23;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(void *)(v7 + 48) = v22;
    *(void *)(v7 + 56) = v24;
    uint64_t v25 = swift_allocObject();
    *(_OWORD *)(v25 + 16) = xmmword_21E4D9230;
    uint64_t v26 = sub_21E48E59C((SEL *)&selRef_countUnit, (SEL *)&selRef_appleStandHours);
    *(void *)(v25 + 56) = v20;
    *(void *)(v25 + 64) = v13;
    *(void *)(v25 + 32) = v26;
    *(void *)(v25 + 40) = v27;
    uint64_t v28 = sub_21E4D0AC0();
    uint64_t v30 = v29;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(void *)(v7 + 64) = v28;
    *(void *)(v7 + 72) = v30;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F9A8);
    sub_21E48A380((unint64_t *)&qword_267D2F9B0, &qword_267D2F9A8);
    uint64_t v3 = sub_21E4D0A70();
    swift_bridgeObjectRelease();
  }
  return v3;
}

id sub_21E48E1EC()
{
  id v1 = *v0;
  if (sub_21E4AEB94(*v0))
  {
    if (v1)
    {
      id v2 = objc_msgSend(v1, sel_appleMoveTime);
      id v3 = objc_msgSend(self, sel_minuteUnit);
      objc_msgSend(v2, sel_doubleValueForUnit_, v3);
      double v5 = v4;
    }
    else
    {
      double v5 = 0.0;
    }
    id v12 = sub_21E4B69E4();
    sub_21E4B6A0C(v12, 0, 0);

    __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F950);
    uint64_t v13 = swift_allocObject();
    uint64_t v14 = MEMORY[0x263F8D538];
    *(_OWORD *)(v13 + 16) = xmmword_21E4D9230;
    uint64_t v15 = MEMORY[0x263F8D5B8];
    *(void *)(v13 + 56) = v14;
    *(void *)(v13 + 64) = v15;
    *(double *)(v13 + 32) = floor(v5);
    uint64_t v16 = sub_21E4D0AC0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return (id)v16;
  }
  id result = objc_msgSend(v0[2], sel_unitManager);
  if (result)
  {
    uint64_t v7 = result;
    id v8 = objc_msgSend(result, sel_userActiveEnergyBurnedUnit);

    if (v1)
    {
      id v9 = objc_msgSend(v1, sel_activeEnergyBurned);
      objc_msgSend(v9, sel_doubleValueForUnit_, v8);
      double v11 = v10;
    }
    else
    {
      double v11 = 0.0;
    }
    double v17 = floor(v11);
    sub_21E48E70C();
    uint64_t v18 = self;
    id v19 = objc_msgSend(v18, sel_kilocalorieUnit);
    char v20 = sub_21E4D0D20();

    if ((v20 & 1) == 0)
    {
      id v21 = objc_msgSend(v18, sel_jouleUnitWithMetricPrefix_, 9);
      sub_21E4D0D20();
    }
    id v22 = sub_21E4B69E4();
    sub_21E4B6A0C(v22, 0, 0);
    swift_bridgeObjectRelease();

    __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F950);
    uint64_t v23 = swift_allocObject();
    uint64_t v24 = MEMORY[0x263F8D538];
    *(_OWORD *)(v23 + 16) = xmmword_21E4D9230;
    uint64_t v25 = MEMORY[0x263F8D5B8];
    *(void *)(v23 + 56) = v24;
    *(void *)(v23 + 64) = v25;
    *(double *)(v23 + 32) = v17;
    uint64_t v16 = sub_21E4D0AC0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    return (id)v16;
  }
  __break(1u);
  return result;
}

uint64_t sub_21E48E544()
{
  return sub_21E48E59C((SEL *)&selRef_minuteUnit, (SEL *)&selRef_appleExerciseTime);
}

uint64_t sub_21E48E570()
{
  return sub_21E48E59C((SEL *)&selRef_countUnit, (SEL *)&selRef_appleStandHours);
}

uint64_t sub_21E48E59C(SEL *a1, SEL *a2)
{
  id v4 = [self *a1];
  sub_21E48BE28(v2, (uint64_t)&v14, &qword_267D2F988);
  sub_21E48BE28((uint64_t)&v14, (uint64_t)&v15, &qword_267D2F988);
  if (v15)
  {
    id v5 = [v15 *a2];
    objc_msgSend(v5, sel_doubleValueForUnit_, v4);
    double v7 = v6;
  }
  else
  {
    double v7 = 0.0;
  }
  id v8 = sub_21E4B69E4();
  sub_21E4B6A0C(v8, 0, 0);

  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F950);
  uint64_t v9 = swift_allocObject();
  uint64_t v10 = MEMORY[0x263F8D538];
  *(_OWORD *)(v9 + 16) = xmmword_21E4D9230;
  uint64_t v11 = MEMORY[0x263F8D5B8];
  *(void *)(v9 + 56) = v10;
  *(void *)(v9 + 64) = v11;
  *(double *)(v9 + 32) = floor(v7);
  uint64_t v12 = sub_21E4D0AC0();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v12;
}

unint64_t sub_21E48E70C()
{
  unint64_t result = qword_26AB08640;
  if (!qword_26AB08640)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26AB08640);
  }
  return result;
}

uint64_t sub_21E48E74C()
{
  id v1 = *v0;
  if (sub_21E4AEB58(*v0))
  {
    id v2 = sub_21E4B69E4();
    uint64_t v3 = sub_21E4B6A0C(v2, 0, 0);
  }
  else if (v1 {
         && (id v4 = v1, v5 = objc_msgSend(v4, sel_paused), v4, (v5 & 1) != 0))
  }
  {
    return 0;
  }
  else
  {
    id v6 = sub_21E4B69E4();
    sub_21E4B6A0C(v6, 0, 0);

    __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F9A0);
    uint64_t v7 = swift_allocObject();
    *(_OWORD *)(v7 + 16) = xmmword_21E4D93A0;
    id v8 = sub_21E4B69E4();
    sub_21E4B6A0C(v8, 0, 0);

    __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F950);
    uint64_t v9 = swift_allocObject();
    *(_OWORD *)(v9 + 16) = xmmword_21E4D9230;
    id v10 = sub_21E48E1EC();
    uint64_t v12 = v11;
    *(void *)(v9 + 56) = MEMORY[0x263F8D310];
    unint64_t v13 = sub_21E48B95C();
    *(void *)(v9 + 64) = v13;
    *(void *)(v9 + 32) = v10;
    *(void *)(v9 + 40) = v12;
    uint64_t v14 = sub_21E4D0AC0();
    uint64_t v16 = v15;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(void *)(v7 + 32) = v14;
    *(void *)(v7 + 40) = v16;
    id v17 = sub_21E4B69E4();
    sub_21E4B6A0C(v17, 0, 0);

    uint64_t v18 = swift_allocObject();
    *(_OWORD *)(v18 + 16) = xmmword_21E4D9230;
    uint64_t v19 = sub_21E48E59C((SEL *)&selRef_minuteUnit, (SEL *)&selRef_appleExerciseTime);
    uint64_t v20 = MEMORY[0x263F8D310];
    *(void *)(v18 + 56) = MEMORY[0x263F8D310];
    *(void *)(v18 + 64) = v13;
    *(void *)(v18 + 32) = v19;
    *(void *)(v18 + 40) = v21;
    uint64_t v22 = sub_21E4D0AC0();
    uint64_t v24 = v23;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(void *)(v7 + 48) = v22;
    *(void *)(v7 + 56) = v24;
    uint64_t v25 = swift_allocObject();
    *(_OWORD *)(v25 + 16) = xmmword_21E4D9230;
    uint64_t v26 = sub_21E48EAE0();
    *(void *)(v25 + 56) = v20;
    *(void *)(v25 + 64) = v13;
    *(void *)(v25 + 32) = v26;
    *(void *)(v25 + 40) = v27;
    uint64_t v28 = sub_21E4D0AC0();
    uint64_t v30 = v29;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(void *)(v7 + 64) = v28;
    *(void *)(v7 + 72) = v30;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F9A8);
    sub_21E48A380((unint64_t *)&qword_267D2F9B0, &qword_267D2F9A8);
    uint64_t v3 = sub_21E4D0A70();
    swift_bridgeObjectRelease();
  }
  return v3;
}

uint64_t sub_21E48EAE0()
{
  id v1 = objc_msgSend(self, sel_countUnit);
  sub_21E48BE28(v0, (uint64_t)v14, &qword_267D2F988);
  sub_21E48BE28((uint64_t)v14, (uint64_t)&v16, &qword_267D2F988);
  double v2 = 0.0;
  double v3 = 0.0;
  if (v16)
  {
    id v4 = objc_msgSend(v16, sel_appleStandHours);
    objc_msgSend(v4, sel_doubleValueForUnit_, v1);
    double v3 = v5;
  }
  sub_21E48BE28((uint64_t)v14, (uint64_t)&v15, &qword_267D2F988);
  if (v15)
  {
    id v6 = objc_msgSend(v15, sel_appleStandHoursGoal);
    objc_msgSend(v6, sel_doubleValueForUnit_, v1);
    double v2 = v7;
  }
  id v8 = sub_21E4B69E4();
  sub_21E4B6A0C(v8, 0, 0);

  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F950);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_21E4D9390;
  uint64_t v10 = MEMORY[0x263F8D538];
  uint64_t v11 = MEMORY[0x263F8D5B8];
  *(void *)(v9 + 56) = MEMORY[0x263F8D538];
  *(void *)(v9 + 64) = v11;
  *(double *)(v9 + 32) = floor(v3);
  *(void *)(v9 + 96) = v10;
  *(void *)(v9 + 104) = v11;
  *(double *)(v9 + 72) = floor(v2);
  uint64_t v12 = sub_21E4D0AC0();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_21E48ECAC()
{
  id v1 = *v0;
  if (sub_21E4AEB58(*v0))
  {
    id v2 = sub_21E4B69E4();
    uint64_t v3 = sub_21E4B6A0C(v2, 0, 0);
  }
  else if (v1 {
         && (id v4 = v1, v5 = objc_msgSend(v4, sel_paused), v4, (v5 & 1) != 0))
  }
  {
    return 0;
  }
  else
  {
    id v6 = sub_21E4B69E4();
    sub_21E4B6A0C(v6, 0, 0);

    __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F9A0);
    uint64_t v7 = swift_allocObject();
    *(_OWORD *)(v7 + 16) = xmmword_21E4D93A0;
    id v8 = sub_21E4B69E4();
    sub_21E4B6A0C(v8, 0, 0);

    __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F950);
    uint64_t v9 = swift_allocObject();
    *(_OWORD *)(v9 + 16) = xmmword_21E4D9230;
    sub_21E48F014();
    uint64_t v11 = v10;
    uint64_t v13 = v12;
    uint64_t v14 = MEMORY[0x263F8D310];
    *(void *)(v9 + 56) = MEMORY[0x263F8D310];
    unint64_t v15 = sub_21E48B95C();
    *(void *)(v9 + 64) = v15;
    *(void *)(v9 + 32) = v11;
    *(void *)(v9 + 40) = v13;
    uint64_t v16 = sub_21E4D0AC0();
    uint64_t v18 = v17;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(void *)(v7 + 32) = v16;
    *(void *)(v7 + 40) = v18;
    id v19 = sub_21E4B69E4();
    sub_21E4B6A0C(v19, 0, 0);

    uint64_t v20 = swift_allocObject();
    *(_OWORD *)(v20 + 16) = xmmword_21E4D9230;
    uint64_t v21 = sub_21E48F464();
    *(void *)(v20 + 56) = v14;
    *(void *)(v20 + 64) = v15;
    *(void *)(v20 + 32) = v21;
    *(void *)(v20 + 40) = v22;
    uint64_t v23 = sub_21E4D0AC0();
    uint64_t v25 = v24;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(void *)(v7 + 48) = v23;
    *(void *)(v7 + 56) = v25;
    uint64_t v26 = swift_allocObject();
    *(_OWORD *)(v26 + 16) = xmmword_21E4D9230;
    uint64_t v27 = sub_21E48EAE0();
    *(void *)(v26 + 56) = v14;
    *(void *)(v26 + 64) = v15;
    *(void *)(v26 + 32) = v27;
    *(void *)(v26 + 40) = v28;
    uint64_t v29 = sub_21E4D0AC0();
    uint64_t v31 = v30;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(void *)(v7 + 64) = v29;
    *(void *)(v7 + 72) = v31;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F9A8);
    sub_21E48A380((unint64_t *)&qword_267D2F9B0, &qword_267D2F9A8);
    uint64_t v3 = sub_21E4D0A70();
    swift_bridgeObjectRelease();
  }
  return v3;
}

void sub_21E48F014()
{
  id v1 = *v0;
  if (sub_21E4AEB94(*v0))
  {
    if (!v1)
    {
      uint64_t v6 = 0;
      double v10 = 0.0;
      goto LABEL_11;
    }
    id v2 = objc_msgSend(v1, sel_appleMoveTime);
    id v3 = objc_msgSend(self, sel_minuteUnit);
    objc_msgSend(v2, sel_doubleValueForUnit_, v3);
    double v5 = v4;

    if ((~*(void *)&v5 & 0x7FF0000000000000) != 0)
    {
      if (v5 <= -9.22337204e18)
      {
        __break(1u);
      }
      else if (v5 < 9.22337204e18)
      {
        uint64_t v6 = (uint64_t)v5;
        id v7 = objc_msgSend(v1, sel_appleMoveTimeGoal);
        id v8 = objc_msgSend(self, sel_minuteUnit);
        objc_msgSend(v7, sel_doubleValueForUnit_, v8);
        double v10 = v9;

LABEL_11:
        id v21 = sub_21E4B69E4();
        sub_21E4B6A0C(v21, 0, 0);

        __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F950);
        uint64_t v22 = swift_allocObject();
        *(_OWORD *)(v22 + 16) = xmmword_21E4D9390;
        uint64_t v23 = MEMORY[0x263F8D750];
        *(void *)(v22 + 56) = MEMORY[0x263F8D6C8];
        *(void *)(v22 + 64) = v23;
        uint64_t v24 = MEMORY[0x263F8D538];
        *(void *)(v22 + 32) = v6;
        uint64_t v25 = MEMORY[0x263F8D5B8];
        *(void *)(v22 + 96) = v24;
        *(void *)(v22 + 104) = v25;
        *(double *)(v22 + 72) = floor(v10);
        sub_21E4D0AC0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return;
      }
      __break(1u);
    }
    __break(1u);
    goto LABEL_19;
  }
  id v11 = objc_msgSend(v0[2], sel_unitManager);
  if (!v11)
  {
LABEL_19:
    __break(1u);
    return;
  }
  uint64_t v12 = v11;
  id v13 = objc_msgSend(v11, sel_userActiveEnergyBurnedUnit);

  if (v1)
  {
    id v14 = objc_msgSend(v1, sel_activeEnergyBurned);
    objc_msgSend(v14, sel_doubleValueForUnit_, v13);
    double v16 = v15;

    double v17 = floor(v16);
    id v18 = objc_msgSend(v1, sel_activeEnergyBurnedGoal);
    objc_msgSend(v18, sel_doubleValueForUnit_, v13);
    double v20 = v19;
  }
  else
  {
    double v17 = 0.0;
    double v20 = 0.0;
  }
  double v26 = floor(v20);
  sub_21E48E70C();
  uint64_t v27 = self;
  id v28 = objc_msgSend(v27, sel_kilocalorieUnit);
  char v29 = sub_21E4D0D20();

  if ((v29 & 1) == 0)
  {
    id v30 = objc_msgSend(v27, sel_jouleUnitWithMetricPrefix_, 9);
    sub_21E4D0D20();
  }
  id v31 = sub_21E4B69E4();
  sub_21E4B6A0C(v31, 0, 0);
  swift_bridgeObjectRelease();

  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F950);
  uint64_t v32 = swift_allocObject();
  *(_OWORD *)(v32 + 16) = xmmword_21E4D9390;
  uint64_t v33 = MEMORY[0x263F8D538];
  uint64_t v34 = MEMORY[0x263F8D5B8];
  *(void *)(v32 + 56) = MEMORY[0x263F8D538];
  *(void *)(v32 + 64) = v34;
  *(double *)(v32 + 32) = v17;
  *(void *)(v32 + 96) = v33;
  *(void *)(v32 + 104) = v34;
  *(double *)(v32 + 72) = v26;
  sub_21E4D0AC0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

uint64_t sub_21E48F464()
{
  id v1 = objc_msgSend(self, sel_minuteUnit);
  sub_21E48BE28(v0, (uint64_t)v14, &qword_267D2F988);
  sub_21E48BE28((uint64_t)v14, (uint64_t)&v16, &qword_267D2F988);
  double v2 = 0.0;
  double v3 = 0.0;
  if (v16)
  {
    id v4 = objc_msgSend(v16, sel_appleExerciseTime);
    objc_msgSend(v4, sel_doubleValueForUnit_, v1);
    double v3 = v5;
  }
  sub_21E48BE28((uint64_t)v14, (uint64_t)&v15, &qword_267D2F988);
  if (v15)
  {
    id v6 = objc_msgSend(v15, sel_appleExerciseTimeGoal);
    objc_msgSend(v6, sel_doubleValueForUnit_, v1);
    double v2 = v7;
  }
  id v8 = sub_21E4B69E4();
  sub_21E4B6A0C(v8, 0, 0);

  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F950);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_21E4D9390;
  uint64_t v10 = MEMORY[0x263F8D538];
  uint64_t v11 = MEMORY[0x263F8D5B8];
  *(void *)(v9 + 56) = MEMORY[0x263F8D538];
  *(void *)(v9 + 64) = v11;
  *(double *)(v9 + 32) = floor(v3);
  *(void *)(v9 + 96) = v10;
  *(void *)(v9 + 104) = v11;
  *(double *)(v9 + 72) = floor(v2);
  uint64_t v12 = sub_21E4D0AC0();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v12;
}

id sub_21E48F630()
{
  sub_21E48BE28(v0, (uint64_t)&v10, &qword_267D2F988);
  sub_21E48BE28((uint64_t)&v10, (uint64_t)&v11, &qword_267D2F988);
  if (v11 && sub_21E4AE99C())
  {
    id v1 = sub_21E4B69E4();
    uint64_t v2 = sub_21E4B6A0C(v1, 0, 0);
LABEL_6:
    uint64_t v5 = v2;
    uint64_t v6 = v3;

    id v7 = sub_21E4B69E4();
    sub_21E4B6A0C(v7, 0, 0);

    __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F950);
    uint64_t v8 = swift_allocObject();
    *(_OWORD *)(v8 + 16) = xmmword_21E4D9230;
    *(void *)(v8 + 56) = MEMORY[0x263F8D310];
    *(void *)(v8 + 64) = sub_21E48B95C();
    *(void *)(v8 + 32) = v5;
    *(void *)(v8 + 40) = v6;
    uint64_t v9 = sub_21E4D0AC0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return (id)v9;
  }
  id result = objc_msgSend(*(id *)(v0 + 16), sel_localizedLongActiveEnergyUnitString);
  if (result)
  {
    id v1 = result;
    uint64_t v2 = sub_21E4D0AF0();
    goto LABEL_6;
  }
  __break(1u);
  return result;
}

uint64_t sub_21E48F7A8()
{
  id v0 = sub_21E4B69E4();
  uint64_t v1 = sub_21E4B6A0C(v0, 0, 0);

  return v1;
}

uint64_t destroy for ActivityComplicationFormatter(id *a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ActivityComplicationFormatter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v5 = *(void **)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v4;
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  uint64_t v7 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v7;
  uint64_t v8 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v8;
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  id v9 = v3;
  id v10 = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ActivityComplicationFormatter(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  uint64_t v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v7 = *(void **)(a2 + 16);
  uint64_t v8 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v7;
  id v9 = v7;

  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy88_8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for ActivityComplicationFormatter(uint64_t a1, uint64_t a2)
{
  long long v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  long long v5 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);

  uint64_t v6 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v9;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ActivityComplicationFormatter(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 88)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ActivityComplicationFormatter(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 88) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 88) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ActivityComplicationFormatter()
{
  return &type metadata for ActivityComplicationFormatter;
}

uint64_t sub_21E48FB3C(uint64_t a1)
{
  return a1;
}

double sub_21E48FB80()
{
  return 3.14159265;
}

double PolarPoint.r.getter()
{
  return *(double *)(v0 + 8);
}

double PolarPoint.theta.getter()
{
  return *(double *)(v0 + 16);
}

double PolarPoint.thetaInDegrees.getter()
{
  return v0[2] * 180.0 / *v0;
}

double PolarPoint.cartesianPoint.getter()
{
  double v1 = *(double *)(v0 + 8);
  return v1 * __sincos_stret(*(double *)(v0 + 16)).__cosval;
}

CGPoint __swiftcall PolarPoint.cartesianPointInUIKitCoordinates(of:)(__C::CGRect of)
{
  double v3 = *(double *)(v1 + 8);
  double v2 = *(double *)(v1 + 16);
  double v4 = CGRect.center.getter(of.origin.x, of.origin.y, of.size.width, of.size.height);
  unint64_t v6 = v5;
  __double2 v9 = __sincos_stret(v2);
  v10.n128_f64[0] = v4;
  v11.n128_u64[0] = v6;
  v7.n128_f64[0] = v3 * v9.__cosval;
  v8.n128_f64[0] = v3 * v9.__sinval;
  static CGPoint.+ infix(_:_:)(v10, v11, v7, v8);
  result.y = v13;
  result.double x = v12;
  return result;
}

void PolarPoint.init(cartesianPoint:)(uint64_t a1@<X8>, long double a2@<D0>, long double a3@<D1>)
{
  double v4 = sqrt(a2 * a2 + a3 * a3);
  long double v5 = atan2(a3, a2);
  *(void *)a1 = 0x400921FB54442D18;
  *(double *)(a1 + 8) = v4;
  *(long double *)(a1 + 16) = v5;
}

void PolarPoint.init(r:theta:)(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>)
{
  *(void *)a1 = 0x400921FB54442D18;
  *(double *)(a1 + 8) = a2;
  *(double *)(a1 + 16) = a3;
}

void PolarPoint.init(r:thetaInDegrees:)(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>)
{
  *(void *)a1 = 0x400921FB54442D18;
  *(double *)(a1 + 8) = a2;
  *(double *)(a1 + 16) = a3 * 3.14159265 / 180.0;
}

void static PolarPoint.+ infix(_:_:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  double v4 = *(double *)(a1 + 8);
  double v6 = *(double *)(a2 + 8);
  double v5 = *(double *)(a2 + 16);
  __double2 v7 = __sincos_stret(*(double *)(a1 + 16));
  __double2 v8 = __sincos_stret(v5);
  v9.n128_f64[0] = v6 * v8.__cosval;
  v10.n128_f64[0] = v6 * v8.__sinval;
  v11.n128_f64[0] = v4 * v7.__cosval;
  v12.n128_f64[0] = v4 * v7.__sinval;
  long double v13 = static CGPoint.+ infix(_:_:)(v11, v12, v9, v10);
  double v15 = sqrt(v13 * v13 + v14 * v14);
  long double v16 = atan2(v14, v13);
  *(void *)a3 = 0x400921FB54442D18;
  *(double *)(a3 + 8) = v15;
  *(long double *)(a3 + 16) = v16;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for PolarPoint(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for PolarPoint(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 24) = v3;
  return result;
}

ValueMetadata *type metadata accessor for PolarPoint()
{
  return &type metadata for PolarPoint;
}

uint64_t sub_21E48FE08@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_21E4D0400();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  __double2 v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F850);
  MEMORY[0x270FA5388](v8);
  __n128 v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21E48A534(v2, (uint64_t)v10, &qword_267D2F850);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_21E4D0320();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    os_log_type_t v13 = sub_21E4D0CC0();
    long double v14 = sub_21E4D0530();
    os_log_type_t v15 = v13;
    if (os_log_type_enabled(v14, v13))
    {
      long double v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      v19[1] = a1;
      uint64_t v18 = v17;
      uint64_t v20 = v17;
      *(_DWORD *)long double v16 = 136315138;
      v19[2] = sub_21E489B2C(0xD000000000000010, 0x800000021E4DE6B0, &v20);
      sub_21E4D0D30();
      _os_log_impl(&dword_21E433000, v14, v15, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C29AE0](v18, -1, -1);
      MEMORY[0x223C29AE0](v16, -1, -1);
    }

    sub_21E4D03F0();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_21E4900C0@<X0>(uint64_t *a1@<X8>)
{
  *a1 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F850);
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_21E490118(uint64_t a1)
{
  return sub_21E490380(a1, (void (*)(void))type metadata accessor for FIUIActivityStatisticsProvider);
}

uint64_t sub_21E490130()
{
  type metadata accessor for ActivityStatisticsArchivableView();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F9D0);
  sub_21E4D07A0();
  return v1;
}

uint64_t type metadata accessor for ActivityStatisticsArchivableView()
{
  uint64_t result = qword_26AB08B70;
  if (!qword_26AB08B70) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_21E4901D4()
{
  return sub_21E4D07B0();
}

uint64_t (*sub_21E490234(void *a1))()
{
  char v3 = malloc(0x38uLL);
  *a1 = v3;
  uint64_t v4 = (uint64_t *)(v1 + *(int *)(type metadata accessor for ActivityStatisticsArchivableView() + 20));
  uint64_t v6 = *v4;
  uint64_t v5 = v4[1];
  v3[4] = *v4;
  void v3[5] = v5;
  *char v3 = v6;
  v3[1] = v5;
  swift_retain();
  swift_retain();
  void v3[6] = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F9D0);
  sub_21E4D07A0();
  return sub_21E4902D0;
}

uint64_t sub_21E4902D4()
{
  type metadata accessor for FIUIActivityStatisticsProvider();
  id v0 = (id)*sub_21E4B6BA0();
  return sub_21E4A6540(v0);
}

uint64_t sub_21E49030C()
{
  type metadata accessor for ActivityStatisticsArchivableView();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F9D0);
  sub_21E4D07C0();
  return v1;
}

uint64_t sub_21E490368(uint64_t a1)
{
  return sub_21E490380(a1, (void (*)(void))type metadata accessor for FIUIWheelchairStatusProvider);
}

uint64_t sub_21E490380(uint64_t a1, void (*a2)(void))
{
  a2(0);
  sub_21E4D0790();
  return v3;
}

uint64_t sub_21E4903C0()
{
  type metadata accessor for ActivityStatisticsArchivableView();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F9D8);
  sub_21E4D07A0();
  return v1;
}

uint64_t sub_21E490418()
{
  return sub_21E4D07B0();
}

uint64_t (*sub_21E490478(void *a1))()
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  uint64_t v4 = (uint64_t *)(v1 + *(int *)(type metadata accessor for ActivityStatisticsArchivableView() + 24));
  uint64_t v6 = *v4;
  uint64_t v5 = v4[1];
  v3[4] = *v4;
  void v3[5] = v5;
  *uint64_t v3 = v6;
  v3[1] = v5;
  swift_retain();
  swift_retain();
  void v3[6] = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F9D8);
  sub_21E4D07A0();
  return sub_21E4902D0;
}

void sub_21E490514(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  void v2[3] = *(void *)(*(void *)a1 + 16);
  uint64_t v3 = v2[5];
  *uint64_t v2 = v2[4];
  v2[1] = v3;
  if (a2)
  {
    swift_retain();
    sub_21E4D07B0();
    swift_release();
  }
  else
  {
    sub_21E4D07B0();
  }
  swift_release();
  swift_release();
  free(v2);
}

uint64_t sub_21E4905BC()
{
  sub_21E4B6C80();
  return swift_retain();
}

uint64_t sub_21E4905E8()
{
  type metadata accessor for ActivityStatisticsArchivableView();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F9D8);
  sub_21E4D07C0();
  return v1;
}

uint64_t sub_21E49064C()
{
  return sub_21E4906C4(MEMORY[0x263F18660]);
}

uint64_t (*sub_21E490664())()
{
  return sub_21E490680;
}

uint64_t sub_21E490680()
{
  return FIUIUnitPreferenceUpdateObserver.__allocating_init()();
}

uint64_t sub_21E4906AC()
{
  return sub_21E4906C4(MEMORY[0x263F18668]);
}

uint64_t sub_21E4906C4(uint64_t (*a1)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v2 = (uint64_t *)(v1 + *(int *)(type metadata accessor for ActivityStatisticsArchivableView() + 28));
  uint64_t v3 = *v2;
  uint64_t v4 = v2[1];
  uint64_t v5 = *((unsigned __int8 *)v2 + 16);
  uint64_t updated = type metadata accessor for FIUIUnitPreferenceUpdateObserver();
  uint64_t v7 = sub_21E496AC8(&qword_267D2F9E0, (void (*)(uint64_t))type metadata accessor for FIUIUnitPreferenceUpdateObserver);
  return a1(v3, v4, v5, updated, v7);
}

id sub_21E490778()
{
  id v0 = objc_allocWithZone(MEMORY[0x263EFFA40]);
  uint64_t v1 = (void *)sub_21E4D0AB0();
  id v2 = objc_msgSend(v0, sel_initWithSuiteName_, v1);

  return v2;
}

unint64_t sub_21E4907E4()
{
  return 0xD000000000000030;
}

uint64_t ActivityStatisticsArchivableView.init()@<X0>(uint64_t *a1@<X8>)
{
  *a1 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F850);
  swift_storeEnumTagMultiPayload();
  id v2 = (int *)type metadata accessor for ActivityStatisticsArchivableView();
  uint64_t v3 = (uint64_t *)((char *)a1 + v2[5]);
  type metadata accessor for FIUIActivityStatisticsProvider();
  id v4 = (id)*sub_21E4B6BA0();
  sub_21E4A6540(v4);
  sub_21E4D0790();
  *uint64_t v3 = v14;
  v3[1] = v15;
  uint64_t v5 = (uint64_t *)((char *)a1 + v2[6]);
  sub_21E4B6C80();
  type metadata accessor for FIUIWheelchairStatusProvider();
  swift_retain();
  sub_21E4D0790();
  void *v5 = v14;
  v5[1] = v15;
  uint64_t v6 = (char *)a1 + v2[7];
  *(void *)uint64_t v6 = sub_21E490680;
  *((void *)v6 + 1) = 0;
  v6[16] = 0;
  uint64_t v7 = v2[8];
  id v8 = objc_allocWithZone(MEMORY[0x263EFFA40]);
  uint64_t v9 = (void *)sub_21E4D0AB0();
  id v10 = objc_msgSend(v8, sel_initWithSuiteName_, v9);

  *(uint64_t *)((char *)a1 + v7) = (uint64_t)v10;
  uint64_t v11 = (uint64_t *)((char *)a1 + v2[9]);
  *uint64_t v11 = 0xD000000000000030;
  v11[1] = 0x800000021E4DEBB0;
  uint64_t v12 = v2[10];
  uint64_t result = sub_21E4D0580();
  *(uint64_t *)((char *)a1 + v12) = result;
  return result;
}

uint64_t ActivityStatisticsArchivableView.init(from:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return __swift_destroy_boxed_opaque_existential_0(a1);
}

uint64_t ActivityStatisticsArchivableView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v43 = a1;
  uint64_t v3 = type metadata accessor for ActivityStatisticsArchivableView();
  uint64_t v41 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v42 = v4;
  uint64_t v5 = (char *)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F9E8);
  MEMORY[0x270FA5388](v6 - 8);
  id v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F9F0);
  MEMORY[0x270FA5388](v40);
  id v10 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = (uint64_t *)(v1 + *(int *)(v3 + 20));
  uint64_t v13 = *v11;
  uint64_t v12 = v11[1];
  uint64_t v45 = v13;
  uint64_t v46 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F9D0);
  uint64_t v14 = sub_21E4D07A0();
  uint64_t v15 = (void *)(*(uint64_t (**)(uint64_t))(*(void *)v44[0] + 152))(v14);
  swift_release();
  if (!v15 || (id v16 = objc_msgSend(v15, sel_currentActivityCache)) == 0)
  {
    id v18 = 0;
    goto LABEL_6;
  }
  uint64_t v17 = v16;
  id v18 = sub_21E4AEBC4();

  if ((objc_msgSend(v18, sel_paused) & 1) == 0)
  {
LABEL_6:
    id v20 = v15;
    double v19 = v15;
    goto LABEL_7;
  }
  double v19 = 0;
LABEL_7:
  id v21 = (uint64_t *)(v2 + *(int *)(v3 + 24));
  uint64_t v23 = *v21;
  uint64_t v22 = v21[1];
  uint64_t v45 = v23;
  uint64_t v46 = v22;
  id v24 = v18;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F9D8);
  uint64_t v25 = sub_21E4D07A0();
  char v26 = (*(uint64_t (**)(uint64_t))(*(void *)v44[0] + 136))(v25);
  swift_release();
  id v27 = (id)*sub_21E4B6DEC();
  sub_21E48DB04((uint64_t)v18, v26 & 1, (uint64_t)v27, (uint64_t)v44);
  id v28 = v19;
  uint64_t v29 = sub_21E490E24((uint64_t)v44);
  uint64_t v30 = sub_21E4AFA30(v29);
  sub_21E4B1928((uint64_t)v19, v44, v30, (uint64_t)&v45);
  *(void *)id v8 = sub_21E4D04B0();
  *((void *)v8 + 1) = 0;
  v8[16] = 0;
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F9F8);
  sub_21E490E98(v2, v18, (uint64_t)v44, (uint64_t)&v45, &v8[*(int *)(v31 + 44)]);

  sub_21E491B6C((uint64_t)v44);
  sub_21E491BDC((uint64_t)&v45);
  sub_21E492B88(v2, (uint64_t)v5);
  unint64_t v32 = (*(unsigned __int8 *)(v41 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v41 + 80);
  uint64_t v33 = swift_allocObject();
  sub_21E492BF8((uint64_t)v5, v33 + v32);
  sub_21E48A534((uint64_t)v8, (uint64_t)v10, &qword_267D2F9E8);
  uint64_t v34 = (uint64_t (**)())&v10[*(int *)(v40 + 36)];
  *uint64_t v34 = sub_21E492C5C;
  v34[1] = (uint64_t (*)())v33;
  v34[2] = 0;
  v34[3] = 0;
  sub_21E489000((uint64_t)v8, &qword_267D2F9E8);
  sub_21E492B88(v2, (uint64_t)v5);
  uint64_t v35 = swift_allocObject();
  sub_21E492BF8((uint64_t)v5, v35 + v32);
  uint64_t v36 = v43;
  sub_21E48A534((uint64_t)v10, v43, &qword_267D2F9F0);
  uint64_t v37 = (void *)(v36 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267D2FA00) + 36));
  *uint64_t v37 = 0;
  v37[1] = 0;
  v37[2] = sub_21E4932A4;
  v37[3] = v35;
  return sub_21E489000((uint64_t)v10, &qword_267D2F9F0);
}

uint64_t sub_21E490E24(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  id v3 = *(id *)a1;
  id v4 = v2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_21E490E98@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char *a5@<X8>)
{
  uint64_t v99 = a4;
  uint64_t v96 = a3;
  v98 = a2;
  id v86 = (char *)a5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FB90);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v100 = (uint64_t *)((char *)&v86 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v102 = (void (*)(char *, char *, uint64_t))__swift_instantiateConcreteTypeFromMangledName(&qword_267D2FB98);
  MEMORY[0x270FA5388](v102);
  uint64_t v101 = (uint64_t)&v86 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v111 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FBA0);
  uint64_t v103 = *(void *)(v111 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v111);
  uint64_t v110 = (char *)&v86 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  v109 = (char *)&v86 - v11;
  uint64_t v107 = (void (*)(char *, char *, uint64_t))sub_21E4D0510();
  uint64_t v97 = *((void *)v107 - 1);
  MEMORY[0x270FA5388](v107);
  uint64_t v13 = (char *)&v86 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v91 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FAB8);
  MEMORY[0x270FA5388](v91);
  uint64_t v87 = (uint64_t *)((char *)&v86 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FBA8);
  uint64_t v93 = *(void *)(v95 - 8);
  MEMORY[0x270FA5388](v95);
  v89 = (char *)&v86 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v94 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FBB0);
  uint64_t v16 = MEMORY[0x270FA5388](v94);
  uint64_t v90 = (char *)&v86 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  v92 = (char *)&v86 - v18;
  uint64_t v122 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FBB8);
  uint64_t v108 = *(void *)(v122 - 8);
  uint64_t v19 = MEMORY[0x270FA5388](v122);
  v121 = (char *)&v86 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  v106 = (char *)&v86 - v21;
  uint64_t v22 = sub_21E4CFE50();
  uint64_t v23 = *(void *)(v22 - 8);
  MEMORY[0x270FA5388](v22);
  uint64_t v25 = (char *)&v86 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = sub_21E4D0460();
  MEMORY[0x270FA5388](v26 - 8);
  uint64_t v27 = type metadata accessor for ActivityStatisticsArchivableView();
  id v28 = *(void **)(a1 + *(int *)(v27 + 32));
  if (v28
    && (uint64_t v29 = v27,
        uint64_t v30 = (void *)sub_21E4D0AB0(),
        unsigned int v31 = objc_msgSend(v28, sel_BOOLForKey_, v30),
        v30,
        v31))
  {
    sub_21E4D0450();
    sub_21E4D0440();
    unint64_t v32 = (uint64_t *)(a1 + *(int *)(v29 + 20));
    uint64_t v34 = *v32;
    uint64_t v33 = v32[1];
    uint64_t v128 = v34;
    uint64_t v129 = v33;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F9D0);
    sub_21E4D07A0();
    (*(void (**)(char *, uint64_t, uint64_t))(v23 + 16))(v25, v126 + OBJC_IVAR____TtC9FitnessUI30FIUIActivityStatisticsProvider_uuid, v22);
    swift_release();
    sub_21E496AC8(&qword_267D2FBF0, MEMORY[0x263F07508]);
    sub_21E4D0430();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v25, v22);
    sub_21E4D0440();
    sub_21E4D0480();
    uint64_t v105 = sub_21E4D05F0();
    uint64_t v104 = v35;
    uint64_t v123 = v36;
    uint64_t v120 = v37 & 1;
    sub_21E4D0830();
    sub_21E4D02A0();
    uint64_t v118 = v129;
    uint64_t v119 = v128;
    uint64_t v116 = v131;
    uint64_t v117 = v130;
    uint64_t v114 = v133;
    uint64_t v115 = v132;
    sub_21E4D0860();
    uint64_t v113 = v38;
    uint64_t v112 = v39;
    uint64_t v88 = 0x3FE0000000000000;
  }
  else
  {
    uint64_t v105 = 0;
    uint64_t v104 = 0;
    uint64_t v119 = 0;
    uint64_t v120 = 0;
    uint64_t v123 = 0;
    uint64_t v117 = 0;
    uint64_t v118 = 0;
    uint64_t v115 = 0;
    uint64_t v116 = 0;
    uint64_t v114 = 0;
    uint64_t v88 = 0;
    uint64_t v113 = 0;
    uint64_t v112 = 0;
  }
  uint64_t v40 = sub_21E4D0420();
  uint64_t v41 = (uint64_t)v87;
  *uint64_t v87 = v40;
  *(void *)(v41 + 8) = 0;
  *(unsigned char *)(v41 + 16) = 0;
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FA08);
  uint64_t v43 = v98;
  sub_21E493330(a1, v96, v98, v41 + *(int *)(v42 + 44));
  sub_21E4D04F0();
  uint64_t v44 = sub_21E48A380(&qword_267D2FAB0, &qword_267D2FAB8);
  uint64_t v45 = v89;
  uint64_t v46 = v91;
  sub_21E4D06F0();
  uint64_t v97 = *(void *)(v97 + 8);
  ((void (*)(char *, void (*)(char *, char *, uint64_t)))v97)(v13, v107);
  sub_21E489000(v41, &qword_267D2FAB8);
  uint64_t v126 = sub_21E48DE34();
  uint64_t v127 = v47;
  uint64_t v124 = v46;
  uint64_t v125 = v44;
  swift_getOpaqueTypeConformance2();
  sub_21E48BAE8();
  uint64_t v48 = (uint64_t)v90;
  uint64_t v49 = v95;
  sub_21E4D06E0();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v93 + 8))(v45, v49);
  uint64_t v50 = (uint64_t)v92;
  sub_21E4D02C0();
  sub_21E489000(v48, &qword_267D2FBB0);
  sub_21E496884();
  uint64_t v51 = v121;
  sub_21E4D06D0();
  sub_21E489000(v50, &qword_267D2FBB0);
  uint64_t v52 = v108;
  id v53 = v106;
  uint64_t v54 = v51;
  (*(void (**)(char *, char *, uint64_t))(v108 + 32))(v106, v51, v122);
  uint64_t v55 = sub_21E4D04B0();
  uint64_t v56 = (uint64_t)v100;
  *uint64_t v100 = v55;
  *(void *)(v56 + 8) = 0;
  *(unsigned char *)(v56 + 16) = 0;
  uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FBD0);
  sub_21E491CC4(v43, v99, v56 + *(int *)(v57 + 44));
  sub_21E4D0830();
  uint64_t v58 = v101;
  sub_21E492518(0.0, 1, 0.0, 1, 0.0, 1, 0.0, 1, v101, 0.0, 1, INFINITY, 0);
  sub_21E489000(v56, &qword_267D2FB90);
  sub_21E4D0500();
  sub_21E496990();
  id v59 = v110;
  sub_21E4D06F0();
  ((void (*)(char *, void (*)(char *, char *, uint64_t)))v97)(v13, v107);
  sub_21E489000(v58, &qword_267D2FB98);
  uint64_t v60 = v103;
  uint64_t v61 = v109;
  uint64_t v62 = v59;
  id v63 = v59;
  uint64_t v64 = v111;
  (*(void (**)(char *, char *, uint64_t))(v103 + 32))(v109, v63, v111);
  uint64_t v107 = *(void (**)(char *, char *, uint64_t))(v52 + 16);
  uint64_t v65 = v53;
  uint64_t v66 = v122;
  v107(v54, v65, v122);
  uint64_t v102 = *(void (**)(char *, char *, uint64_t))(v60 + 16);
  v102(v62, v61, v64);
  uint64_t v67 = v86;
  uint64_t v68 = v104;
  *(void *)id v86 = v105;
  *((void *)v67 + 1) = v68;
  uint64_t v69 = v123;
  *((void *)v67 + 2) = v120;
  *((void *)v67 + 3) = v69;
  uint64_t v70 = v118;
  *((void *)v67 + 4) = v119;
  *((void *)v67 + 5) = v70;
  uint64_t v71 = v116;
  *((void *)v67 + 6) = v117;
  *((void *)v67 + 7) = v71;
  uint64_t v72 = v114;
  *((void *)v67 + 8) = v115;
  *((void *)v67 + 9) = v72;
  uint64_t v114 = v72;
  uint64_t v73 = v88;
  *((void *)v67 + 10) = v88;
  *((void *)v67 + 11) = v73;
  uint64_t v74 = v112;
  *((void *)v67 + 12) = v113;
  *((void *)v67 + 13) = v74;
  uint64_t v112 = v74;
  uint64_t v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FBE8);
  v107(&v67[*(int *)(v75 + 48)], v121, v66);
  v76 = &v67[*(int *)(v75 + 64)];
  v77 = v110;
  uint64_t v78 = v111;
  v102(v76, v110, v111);
  uint64_t v79 = v105;
  uint64_t v80 = v104;
  sub_21E496A30(v105, v104, v120, v123);
  id v81 = *(void (**)(char *, uint64_t))(v60 + 8);
  uint64_t v82 = v78;
  v81(v109, v78);
  uint64_t v83 = *(void (**)(char *, uint64_t))(v108 + 8);
  uint64_t v84 = v122;
  v83(v106, v122);
  v81(v77, v82);
  v83(v121, v84);
  return sub_21E496A84(v79, v80, v120, v123);
}

uint64_t sub_21E491B6C(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  id v3 = *(void **)(a1 + 16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return a1;
}

uint64_t sub_21E491BDC(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  id v3 = *(void **)(a1 + 8);
  id v4 = *(void **)(a1 + 24);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return a1;
}

uint64_t sub_21E491C64@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)a3 = sub_21E4D0420();
  *(void *)(a3 + 8) = 0;
  *(unsigned char *)(a3 + 16) = 0;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FA08);
  return sub_21E493330(v3, a2, a1, a3 + *(int *)(v7 + 44));
}

uint64_t sub_21E491CC4@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v83 = a2;
  uint64_t v77 = a3;
  uint64_t v72 = type metadata accessor for StandHourChart();
  MEMORY[0x270FA5388](v72);
  uint64_t v70 = (void *)((char *)v63 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FBF8);
  uint64_t v73 = *(void *)(v5 - 8);
  uint64_t v74 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v71 = (char *)v63 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FC00);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  v76 = (char *)v63 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v75 = (uint64_t)v63 - v10;
  uint64_t v11 = sub_21E4D0510();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)v63 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for QuantityChart();
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (void *)((char *)v63 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FC08);
  uint64_t v66 = *(void *)(v67 - 8);
  MEMORY[0x270FA5388](v67);
  uint64_t v19 = (char *)v63 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FC10);
  uint64_t v21 = MEMORY[0x270FA5388](v20 - 8);
  uint64_t v69 = (uint64_t)v63 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  uint64_t v68 = (char *)v63 - v24;
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  uint64_t v78 = (uint64_t)v63 - v26;
  MEMORY[0x270FA5388](v25);
  uint64_t v84 = (uint64_t)v63 - v27;
  if (sub_21E4AEB94(a1)) {
    uint64_t v28 = sub_21E4AFDC0();
  }
  else {
    uint64_t v28 = (uint64_t)sub_21E4B0614();
  }
  uint64_t v29 = v28;
  uint64_t v30 = swift_bridgeObjectRetain();
  sub_21E48867C(v30, v17);
  sub_21E4D04F0();
  uint64_t v31 = sub_21E496AC8(&qword_267D2FC18, (void (*)(uint64_t))type metadata accessor for QuantityChart);
  v63[0] = v31;
  sub_21E4D06F0();
  unint64_t v32 = *(void (**)(char *, uint64_t))(v12 + 8);
  uint64_t v79 = v12 + 8;
  uint64_t v82 = v32;
  v32(v14, v11);
  uint64_t v81 = v11;
  uint64_t v64 = type metadata accessor for QuantityChart;
  sub_21E496B10((uint64_t)v17, (uint64_t (*)(void))type metadata accessor for QuantityChart);
  uint64_t v33 = sub_21E4B1120(0, v29);
  uint64_t v35 = v34;
  swift_bridgeObjectRelease();
  uint64_t v87 = v33;
  uint64_t v88 = v35;
  uint64_t v85 = v15;
  uint64_t v86 = v31;
  uint64_t v65 = MEMORY[0x263F1AE68];
  v63[1] = swift_getOpaqueTypeConformance2();
  unint64_t v80 = sub_21E48BAE8();
  uint64_t v36 = v78;
  uint64_t v37 = v67;
  sub_21E4D06E0();
  swift_bridgeObjectRelease();
  uint64_t v66 = *(void *)(v66 + 8);
  ((void (*)(char *, uint64_t))v66)(v19, v37);
  sub_21E48BE28(v36, v84, &qword_267D2FC10);
  uint64_t v38 = sub_21E4B0724();
  uint64_t v39 = swift_bridgeObjectRetain();
  sub_21E48867C(v39, v17);
  sub_21E4D04F0();
  sub_21E4D06F0();
  v82(v14, v81);
  sub_21E496B10((uint64_t)v17, (uint64_t (*)(void))v64);
  uint64_t v40 = sub_21E4B1120(1, v38);
  uint64_t v42 = v41;
  swift_bridgeObjectRelease();
  uint64_t v87 = v40;
  uint64_t v88 = v42;
  uint64_t v43 = (uint64_t)v68;
  sub_21E4D06E0();
  swift_bridgeObjectRelease();
  ((void (*)(char *, uint64_t))v66)(v19, v37);
  sub_21E48BE28(v43, v36, &qword_267D2FC10);
  sub_21E4B082C();
  uint64_t v45 = v44;
  uint64_t v46 = swift_bridgeObjectRetain();
  uint64_t v47 = v70;
  sub_21E4A2688(v46, v70);
  sub_21E4D04F0();
  uint64_t v48 = sub_21E496AC8(&qword_267D2FC20, (void (*)(uint64_t))type metadata accessor for StandHourChart);
  uint64_t v50 = v71;
  uint64_t v49 = v72;
  sub_21E4D06F0();
  v82(v14, v81);
  sub_21E496B10((uint64_t)v47, (uint64_t (*)(void))type metadata accessor for StandHourChart);
  uint64_t v51 = sub_21E4B1738(v45);
  uint64_t v53 = v52;
  swift_bridgeObjectRelease();
  uint64_t v87 = v51;
  uint64_t v88 = v53;
  uint64_t v85 = v49;
  uint64_t v86 = v48;
  swift_getOpaqueTypeConformance2();
  uint64_t v54 = (uint64_t)v76;
  uint64_t v55 = v74;
  sub_21E4D06E0();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v73 + 8))(v50, v55);
  uint64_t v56 = v75;
  sub_21E48BE28(v54, v75, &qword_267D2FC00);
  uint64_t v57 = v84;
  sub_21E48A534(v84, v43, &qword_267D2FC10);
  uint64_t v58 = v78;
  uint64_t v59 = v69;
  sub_21E48A534(v78, v69, &qword_267D2FC10);
  sub_21E48A534(v56, v54, &qword_267D2FC00);
  uint64_t v60 = v77;
  sub_21E48A534(v43, v77, &qword_267D2FC10);
  uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FC28);
  sub_21E48A534(v59, v60 + *(int *)(v61 + 48), &qword_267D2FC10);
  sub_21E48A534(v54, v60 + *(int *)(v61 + 64), &qword_267D2FC00);
  sub_21E489000(v56, &qword_267D2FC00);
  sub_21E489000(v58, &qword_267D2FC10);
  sub_21E489000(v57, &qword_267D2FC10);
  sub_21E489000(v54, &qword_267D2FC00);
  sub_21E489000(v59, &qword_267D2FC10);
  return sub_21E489000(v43, &qword_267D2FC10);
}

__n128 sub_21E492518@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_21E4D0CC0();
    uint64_t v23 = (void *)sub_21E4D0530();
    sub_21E4D0020();
  }
  sub_21E4D0330();
  sub_21E48A534(v13, a9, &qword_267D2FB90);
  uint64_t v24 = (_OWORD *)(a9 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267D2FB98) + 36));
  v24[4] = v30;
  v24[5] = v31;
  v24[6] = v32;
  *uint64_t v24 = v26;
  v24[1] = v27;
  __n128 result = v29;
  v24[2] = v28;
  v24[3] = v29;
  return result;
}

uint64_t sub_21E4926D8(uint64_t a1)
{
  uint64_t v2 = sub_21E4CFE50();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for ActivityStatisticsArchivableView();
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_21E4D0050();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_21E4B3930();
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v13, v9);
  uint64_t v39 = a1;
  sub_21E492B88(a1, (uint64_t)v8);
  uint64_t v14 = sub_21E4D0030();
  os_log_type_t v15 = sub_21E4D0CD0();
  int v38 = v15;
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = swift_slowAlloc();
    uint64_t v37 = swift_slowAlloc();
    uint64_t v43 = v37;
    *(_DWORD *)uint64_t v16 = 136315394;
    os_log_t v36 = v14;
    unint64_t v41 = sub_21E489B2C(0xD000000000000020, 0x800000021E4D96F0, &v43);
    sub_21E4D0D30();
    *(_WORD *)(v16 + 12) = 2080;
    v33[1] = v16 + 14;
    uint64_t v17 = (unint64_t *)&v8[*(int *)(v6 + 20)];
    unint64_t v19 = *v17;
    unint64_t v18 = v17[1];
    unint64_t v41 = v19;
    unint64_t v42 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F9D0);
    sub_21E4D07A0();
    uint64_t v20 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v35 = v10;
    uint64_t v21 = v5;
    v20(v5, v40 + OBJC_IVAR____TtC9FitnessUI30FIUIActivityStatisticsProvider_uuid, v2);
    swift_release();
    sub_21E496AC8(&qword_267D2FB88, MEMORY[0x263F07508]);
    uint64_t v22 = sub_21E4D0F90();
    uint64_t v34 = v9;
    unint64_t v24 = v23;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v21, v2);
    unint64_t v41 = sub_21E489B2C(v22, v24, &v43);
    sub_21E4D0D30();
    swift_bridgeObjectRelease();
    sub_21E496B10((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for ActivityStatisticsArchivableView);
    os_log_t v25 = v36;
    _os_log_impl(&dword_21E433000, v36, (os_log_type_t)v38, "%s id=%s onAppear", (uint8_t *)v16, 0x16u);
    uint64_t v26 = v37;
    swift_arrayDestroy();
    MEMORY[0x223C29AE0](v26, -1, -1);
    MEMORY[0x223C29AE0](v16, -1, -1);

    (*(void (**)(char *, uint64_t))(v35 + 8))(v12, v34);
  }
  else
  {
    sub_21E496B10((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for ActivityStatisticsArchivableView);

    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  long long v27 = (unint64_t *)(v39 + *(int *)(v6 + 20));
  unint64_t v29 = *v27;
  unint64_t v28 = v27[1];
  unint64_t v41 = v29;
  unint64_t v42 = v28;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F9D0);
  sub_21E4D07A0();
  uint64_t v30 = v43;
  uint64_t v31 = sub_21E4980A8();
  (*(void (**)(uint64_t))(*(void *)v30 + 280))(v31);
  return swift_release();
}

uint64_t sub_21E492B88(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ActivityStatisticsArchivableView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21E492BF0()
{
  return swift_release();
}

uint64_t sub_21E492BF8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ActivityStatisticsArchivableView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_21E492C5C()
{
  return sub_21E4932BC(sub_21E4926D8);
}

uint64_t sub_21E492C74(uint64_t a1)
{
  uint64_t v2 = sub_21E4CFE50();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for ActivityStatisticsArchivableView();
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_21E4D0050();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_21E4B3930();
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v13, v9);
  uint64_t v38 = a1;
  sub_21E492B88(a1, (uint64_t)v8);
  uint64_t v14 = sub_21E4D0030();
  os_log_type_t v15 = sub_21E4D0CD0();
  int v37 = v15;
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = swift_slowAlloc();
    uint64_t v36 = swift_slowAlloc();
    uint64_t v42 = v36;
    *(_DWORD *)uint64_t v16 = 136315394;
    os_log_t v35 = v14;
    unint64_t v40 = sub_21E489B2C(0xD000000000000020, 0x800000021E4D96F0, &v42);
    sub_21E4D0D30();
    *(_WORD *)(v16 + 12) = 2080;
    v32[1] = v16 + 14;
    uint64_t v17 = (unint64_t *)&v8[*(int *)(v6 + 20)];
    unint64_t v19 = *v17;
    unint64_t v18 = v17[1];
    unint64_t v40 = v19;
    unint64_t v41 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F9D0);
    sub_21E4D07A0();
    uint64_t v20 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v34 = v10;
    uint64_t v21 = v5;
    v20(v5, v39 + OBJC_IVAR____TtC9FitnessUI30FIUIActivityStatisticsProvider_uuid, v2);
    swift_release();
    sub_21E496AC8(&qword_267D2FB88, MEMORY[0x263F07508]);
    uint64_t v22 = sub_21E4D0F90();
    uint64_t v33 = v9;
    unint64_t v24 = v23;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v21, v2);
    unint64_t v40 = sub_21E489B2C(v22, v24, &v42);
    sub_21E4D0D30();
    swift_bridgeObjectRelease();
    sub_21E496B10((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for ActivityStatisticsArchivableView);
    os_log_t v25 = v35;
    _os_log_impl(&dword_21E433000, v35, (os_log_type_t)v37, "%s id=%s onDisappear", (uint8_t *)v16, 0x16u);
    uint64_t v26 = v36;
    swift_arrayDestroy();
    MEMORY[0x223C29AE0](v26, -1, -1);
    MEMORY[0x223C29AE0](v16, -1, -1);

    (*(void (**)(char *, uint64_t))(v34 + 8))(v12, v33);
  }
  else
  {
    sub_21E496B10((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for ActivityStatisticsArchivableView);

    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  long long v27 = (unint64_t *)(v38 + *(int *)(v6 + 20));
  unint64_t v29 = *v27;
  unint64_t v28 = v27[1];
  unint64_t v40 = v29;
  unint64_t v41 = v28;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F9D0);
  uint64_t v30 = sub_21E4D07A0();
  (*(void (**)(uint64_t))(*(void *)v42 + 296))(v30);
  return swift_release();
}

uint64_t objectdestroyTm()
{
  uint64_t v1 = type metadata accessor for ActivityStatisticsArchivableView();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F850);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_21E4D0320();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v0 + v3, v5);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_21E492BF0();

  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_21E4932A4()
{
  return sub_21E4932BC(sub_21E492C74);
}

uint64_t sub_21E4932BC(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = *(void *)(type metadata accessor for ActivityStatisticsArchivableView() - 8);
  uint64_t v3 = v1 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  return a1(v3);
}

uint64_t sub_21E493330@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  v193 = a3;
  uint64_t OpaqueTypeConformance2 = a2;
  uint64_t v215 = a4;
  uint64_t v209 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FAD0);
  MEMORY[0x270FA5388](v209);
  uint64_t v178 = (uint64_t)&v174 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FAC8);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v177 = (uint64_t)&v174 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v176 = (uint64_t)&v174 - v10;
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v175 = (uint64_t)&v174 - v12;
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  v192 = (char *)&v174 - v14;
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  v191 = (char *)&v174 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v174 = (uint64_t)&v174 - v18;
  MEMORY[0x270FA5388](v17);
  v190 = (char *)&v174 - v19;
  uint64_t v214 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FAD8);
  MEMORY[0x270FA5388](v214);
  uint64_t v210 = (uint64_t)&v174 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v199 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FAE0);
  MEMORY[0x270FA5388](v199);
  uint64_t v198 = (uint64_t)&v174 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v200 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FAE8);
  MEMORY[0x270FA5388](v200);
  v196 = (char *)&v174 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v213 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FAF0);
  MEMORY[0x270FA5388](v213);
  v201 = (char *)&v174 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v216 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FAF8);
  uint64_t v197 = *(void *)(v216 - 8);
  MEMORY[0x270FA5388](v216);
  v204 = (char *)&v174 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v208 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FB00);
  uint64_t v195 = *(void *)(v208 - 8);
  uint64_t v25 = MEMORY[0x270FA5388](v208);
  v194 = (char *)&v174 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v25);
  v207 = (char *)&v174 - v27;
  uint64_t v185 = sub_21E4D0780();
  uint64_t v184 = *(void *)(v185 - 8);
  MEMORY[0x270FA5388](v185);
  v183 = (char *)&v174 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v182 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FB08);
  uint64_t v181 = *(void *)(v182 - 8);
  MEMORY[0x270FA5388](v182);
  uint64_t v30 = (char *)&v174 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v179 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FB10);
  MEMORY[0x270FA5388](v179);
  long long v32 = (char *)&v174 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v180 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FB18);
  MEMORY[0x270FA5388](v180);
  uint64_t v34 = (char *)&v174 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v187 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FB20);
  MEMORY[0x270FA5388](v187);
  uint64_t v36 = (char *)&v174 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v189 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FB28);
  uint64_t v188 = *(void *)(v189 - 8);
  MEMORY[0x270FA5388](v189);
  v186 = (char *)&v174 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v203 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FB30);
  uint64_t v218 = *(void *)(v203 - 8);
  uint64_t v38 = MEMORY[0x270FA5388](v203);
  v202 = (char *)&v174 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v38);
  v217 = (char *)&v174 - v40;
  uint64_t v41 = sub_21E4D0320();
  uint64_t v42 = *(void *)(v41 - 8);
  uint64_t v43 = MEMORY[0x270FA5388](v41);
  uint64_t v45 = (char *)&v174 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v43);
  uint64_t v47 = (char *)&v174 - v46;
  uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FB38);
  uint64_t v49 = MEMORY[0x270FA5388](v48 - 8);
  uint64_t v212 = (uint64_t)&v174 - ((v50 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v49);
  v211 = (char *)&v174 - v51;
  uint64_t v205 = a1;
  sub_21E48FE08((uint64_t)v47);
  uint64_t v52 = (void (*)(uint64_t))MEMORY[0x263F18FF8];
  sub_21E496AC8(&qword_267D2F920, MEMORY[0x263F18FF8]);
  sub_21E4D0D90();
  sub_21E496AC8(&qword_267D2F928, v52);
  LOBYTE(a1) = sub_21E4D0AA0();
  uint64_t v53 = *(void (**)(char *, uint64_t))(v42 + 8);
  v53(v45, v41);
  v53(v47, v41);
  if (a1)
  {
    uint64_t v54 = v191;
    uint64_t v55 = v190;
    uint64_t v56 = v192;
    uint64_t v57 = v204;
    unsigned __int8 v58 = sub_21E4AEB58(v193);
    uint64_t v59 = v205;
    if (v58)
    {
      id v60 = sub_21E4B69E4();
      uint64_t v61 = sub_21E4B6A0C(v60, 0, 0);
      unint64_t v63 = v62;

      uint64_t v220 = v61;
      unint64_t v221 = v63;
      sub_21E48BAE8();
      uint64_t v64 = sub_21E4D0610();
      uint64_t v66 = v65;
      char v68 = v67 & 1;
      type metadata accessor for ActivityStatisticsArchivableView();
      uint64_t v69 = sub_21E4D05C0();
      uint64_t v71 = v70;
      uint64_t v73 = v72;
      char v75 = v74 & 1;
      sub_21E4956BC(v64, v66, v68);
      swift_bridgeObjectRelease();
      uint64_t v220 = v69;
      unint64_t v221 = v71;
      char v222 = v75;
      uint64_t v223 = v73;
      uint64_t v76 = MEMORY[0x263F1A830];
      unint64_t v77 = MEMORY[0x263F1A820];
      sub_21E4D0670();
      sub_21E4956BC(v69, v71, v75);
      swift_bridgeObjectRelease();
      uint64_t v78 = v197;
      uint64_t v79 = v216;
      (*(void (**)(uint64_t, char *, uint64_t))(v197 + 16))(v198, v57, v216);
      swift_storeEnumTagMultiPayload();
      sub_21E48A380(&qword_267D2FB60, &qword_267D2FAE8);
      uint64_t v220 = v76;
      unint64_t v221 = v77;
      swift_getOpaqueTypeConformance2();
      uint64_t v80 = (uint64_t)v201;
      sub_21E4D04D0();
      sub_21E48A534(v80, v210, &qword_267D2FAF0);
      swift_storeEnumTagMultiPayload();
      sub_21E4967B4();
      sub_21E48A380(&qword_267D2FB70, &qword_267D2FAD0);
      uint64_t v81 = (uint64_t)v211;
      sub_21E4D04D0();
      sub_21E489000(v80, &qword_267D2FAF0);
      (*(void (**)(char *, uint64_t))(v78 + 8))(v57, v79);
    }
    else
    {
      id v149 = sub_21E48A9F4();
      uint64_t v151 = v150;
      sub_21E48ADE0();
      uint64_t v152 = MEMORY[0x223C27C40]();
      sub_21E494A14((uint64_t)v149, v151, v152, v56);
      swift_bridgeObjectRelease();
      swift_release();
      uint64_t v153 = sub_21E48AC1C();
      uint64_t v155 = v154;
      sub_21E48ADEC();
      uint64_t v156 = MEMORY[0x223C27C40]();
      sub_21E494A14(v153, v155, v156, v55);
      swift_bridgeObjectRelease();
      swift_release();
      v157 = (uint64_t *)(v59 + *(int *)(type metadata accessor for ActivityStatisticsArchivableView() + 24));
      uint64_t v159 = *v157;
      unint64_t v158 = v157[1];
      uint64_t v220 = v159;
      unint64_t v221 = v158;
      __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F9D8);
      uint64_t v160 = sub_21E4D07A0();
      (*(void (**)(uint64_t))(*(void *)v219 + 136))(v160);
      swift_release();
      uint64_t v161 = sub_21E48AC30();
      uint64_t v163 = v162;
      sub_21E48ADF8();
      uint64_t v164 = MEMORY[0x223C27C40]();
      sub_21E494A14(v161, v163, v164, v54);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      uint64_t v165 = v174;
      sub_21E48BE28((uint64_t)v54, v174, &qword_267D2FAC8);
      uint64_t v166 = v175;
      sub_21E48A534((uint64_t)v56, v175, &qword_267D2FAC8);
      uint64_t v167 = v176;
      sub_21E48A534((uint64_t)v55, v176, &qword_267D2FAC8);
      uint64_t v168 = v177;
      sub_21E48A534(v165, v177, &qword_267D2FAC8);
      uint64_t v169 = v178;
      sub_21E48A534(v166, v178, &qword_267D2FAC8);
      uint64_t v170 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FB80);
      sub_21E48A534(v167, v169 + *(int *)(v170 + 48), &qword_267D2FAC8);
      sub_21E48A534(v168, v169 + *(int *)(v170 + 64), &qword_267D2FAC8);
      sub_21E489000(v168, &qword_267D2FAC8);
      sub_21E489000(v167, &qword_267D2FAC8);
      sub_21E489000(v166, &qword_267D2FAC8);
      sub_21E48A534(v169, v210, &qword_267D2FAD0);
      swift_storeEnumTagMultiPayload();
      sub_21E4967B4();
      sub_21E48A380(&qword_267D2FB70, &qword_267D2FAD0);
      uint64_t v81 = (uint64_t)v211;
      sub_21E4D04D0();
      sub_21E489000(v169, &qword_267D2FAD0);
      sub_21E489000(v165, &qword_267D2FAC8);
      sub_21E489000((uint64_t)v55, &qword_267D2FAC8);
      sub_21E489000((uint64_t)v56, &qword_267D2FAC8);
    }
    uint64_t v148 = v215;
  }
  else
  {
    uint64_t v220 = sub_21E4D0770();
    sub_21E4D0560();
    sub_21E4D06A0();
    swift_release();
    uint64_t v82 = v184;
    uint64_t v83 = v183;
    uint64_t v84 = v185;
    (*(void (**)(char *, void, uint64_t))(v184 + 104))(v183, *MEMORY[0x263F1B538], v185);
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v86 = (uint64_t *)&v32[*(int *)(v179 + 36)];
    uint64_t v87 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FA18);
    (*(void (**)(char *, char *, uint64_t))(v82 + 16))((char *)v86 + *(int *)(v87 + 28), v83, v84);
    *uint64_t v86 = KeyPath;
    uint64_t v88 = v181;
    uint64_t v89 = v182;
    (*(void (**)(char *, char *, uint64_t))(v181 + 16))(v32, v30, v182);
    (*(void (**)(char *, uint64_t))(v82 + 8))(v83, v84);
    (*(void (**)(char *, uint64_t))(v88 + 8))(v30, v89);
    sub_21E48ADE0();
    uint64_t v90 = MEMORY[0x223C27C40]();
    uint64_t v91 = swift_getKeyPath();
    sub_21E48A534((uint64_t)v32, (uint64_t)v34, &qword_267D2FB10);
    v92 = (uint64_t *)&v34[*(int *)(v180 + 36)];
    uint64_t *v92 = v91;
    v92[1] = v90;
    sub_21E489000((uint64_t)v32, &qword_267D2FB10);
    LOBYTE(v90) = sub_21E4D0540();
    sub_21E4D0270();
    uint64_t v94 = v93;
    uint64_t v96 = v95;
    uint64_t v98 = v97;
    uint64_t v100 = v99;
    sub_21E48A534((uint64_t)v34, (uint64_t)v36, &qword_267D2FB18);
    uint64_t v101 = v187;
    uint64_t v102 = &v36[*(int *)(v187 + 36)];
    *uint64_t v102 = v90;
    *((void *)v102 + 1) = v94;
    *((void *)v102 + 2) = v96;
    *((void *)v102 + 3) = v98;
    *((void *)v102 + 4) = v100;
    v102[40] = 0;
    sub_21E489000((uint64_t)v34, &qword_267D2FB18);
    unint64_t v103 = sub_21E4965A0();
    uint64_t v104 = v186;
    sub_21E4D0670();
    sub_21E489000((uint64_t)v36, &qword_267D2FB20);
    uint64_t v220 = v101;
    unint64_t v221 = v103;
    swift_getOpaqueTypeConformance2();
    uint64_t v105 = v202;
    uint64_t v106 = v189;
    sub_21E4D06B0();
    (*(void (**)(char *, uint64_t))(v188 + 8))(v104, v106);
    (*(void (**)(char *, char *, uint64_t))(v218 + 32))(v217, v105, v203);
    id v107 = sub_21E4B69E4();
    uint64_t v108 = sub_21E4B6A0C(v107, 0, 0);
    unint64_t v110 = v109;

    uint64_t v220 = v108;
    unint64_t v221 = v110;
    sub_21E48BAE8();
    uint64_t v111 = sub_21E4D0610();
    uint64_t v113 = v112;
    char v115 = v114 & 1;
    type metadata accessor for ActivityStatisticsArchivableView();
    uint64_t v116 = sub_21E4D05C0();
    uint64_t v118 = v117;
    char v120 = v119 & 1;
    sub_21E4956BC(v111, v113, v115);
    swift_bridgeObjectRelease();
    sub_21E48ADE0();
    MEMORY[0x223C27C40]();
    uint64_t v121 = sub_21E4D05B0();
    uint64_t v123 = v122;
    char v125 = v124;
    uint64_t v127 = v126;
    swift_release();
    v125 &= 1u;
    sub_21E4956BC(v116, v118, v120);
    swift_bridgeObjectRelease();
    uint64_t v220 = v121;
    unint64_t v221 = v123;
    char v222 = v125;
    uint64_t v223 = v127;
    uint64_t v128 = MEMORY[0x263F1A830];
    unint64_t v129 = MEMORY[0x263F1A820];
    uint64_t v130 = v204;
    sub_21E4D0670();
    sub_21E4956BC(v121, v123, v125);
    swift_bridgeObjectRelease();
    uint64_t v220 = v128;
    unint64_t v221 = v129;
    uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    unsigned __int8 v131 = v194;
    uint64_t v132 = v216;
    sub_21E4D06B0();
    (*(void (**)(char *, uint64_t))(v197 + 8))(v130, v132);
    uint64_t v133 = v195;
    id v134 = v207;
    uint64_t v135 = v208;
    (*(void (**)(char *, char *, uint64_t))(v195 + 32))(v207, v131, v208);
    long long v136 = *(void (**)(char *, char *, uint64_t))(v218 + 16);
    long long v137 = v202;
    uint64_t v138 = v203;
    v136(v202, v217, v203);
    long long v139 = *(void (**)(char *, char *, uint64_t))(v133 + 16);
    v139(v131, v134, v135);
    uint64_t v140 = (uint64_t)v196;
    v136(v196, v137, v138);
    uint64_t v141 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FB58);
    v139((char *)(v140 + *(int *)(v141 + 48)), v131, v135);
    v142 = *(void (**)(char *, uint64_t))(v133 + 8);
    v142(v131, v135);
    v143 = *(void (**)(char *, uint64_t))(v218 + 8);
    v218 += 8;
    v144 = v137;
    uint64_t v145 = v138;
    v143(v144, v138);
    sub_21E48A534(v140, v198, &qword_267D2FAE8);
    swift_storeEnumTagMultiPayload();
    sub_21E48A380(&qword_267D2FB60, &qword_267D2FAE8);
    uint64_t v146 = (uint64_t)v201;
    sub_21E4D04D0();
    sub_21E489000(v140, &qword_267D2FAE8);
    sub_21E48A534(v146, v210, &qword_267D2FAF0);
    swift_storeEnumTagMultiPayload();
    sub_21E4967B4();
    sub_21E48A380(&qword_267D2FB70, &qword_267D2FAD0);
    v147 = v211;
    sub_21E4D04D0();
    sub_21E489000(v146, &qword_267D2FAF0);
    v142(v207, v208);
    v143(v217, v145);
    uint64_t v148 = v215;
    uint64_t v81 = (uint64_t)v147;
  }
  uint64_t v171 = v212;
  sub_21E48A534(v81, v212, &qword_267D2FB38);
  sub_21E48A534(v171, v148, &qword_267D2FB38);
  uint64_t v172 = v148 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267D2FB78) + 48);
  *(void *)uint64_t v172 = 0;
  *(unsigned char *)(v172 + 8) = 1;
  sub_21E489000(v81, &qword_267D2FB38);
  return sub_21E489000(v171, &qword_267D2FB38);
}

uint64_t sub_21E494A14@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X4>, char *a4@<X8>)
{
  uint64_t v70 = a3;
  uint64_t v72 = a2;
  uint64_t v71 = a1;
  uint64_t v76 = a4;
  uint64_t v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FA10);
  uint64_t v74 = *(void *)(v75 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v75);
  uint64_t v73 = (char *)&v64 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v80 = (char *)&v64 - v7;
  uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FA18) - 8;
  MEMORY[0x270FA5388](v67);
  uint64_t v9 = (uint64_t *)((char *)&v64 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v65 = sub_21E4D0780();
  uint64_t v10 = *(void *)(v65 - 8);
  MEMORY[0x270FA5388](v65);
  uint64_t v12 = (char *)&v64 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FA20);
  uint64_t v14 = v13 - 8;
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (uint64_t *)((char *)&v64 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FA28);
  MEMORY[0x270FA5388](v68);
  uint64_t v66 = (uint64_t)&v64 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FA30);
  uint64_t v78 = *(void *)(v18 - 8);
  uint64_t v79 = v18;
  uint64_t v19 = MEMORY[0x270FA5388](v18);
  unint64_t v77 = (char *)&v64 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v81 = (char *)&v64 - v21;
  swift_bridgeObjectRetain();
  uint64_t v22 = sub_21E4D0770();
  uint64_t v69 = *(int *)(type metadata accessor for ActivityStatisticsArchivableView() + 40);
  uint64_t v23 = *(void *)(v4 + v69);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v25 = v65;
  (*(void (**)(char *, void, uint64_t))(v10 + 104))(v12, *MEMORY[0x263F1B538], v65);
  uint64_t v26 = swift_getKeyPath();
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))((char *)v9 + *(int *)(v67 + 36), v12, v25);
  *uint64_t v9 = v26;
  sub_21E48A534((uint64_t)v9, (uint64_t)v16 + *(int *)(v14 + 44), &qword_267D2FA18);
  *uint64_t v16 = v22;
  v16[1] = KeyPath;
  v16[2] = v23;
  swift_retain_n();
  swift_retain();
  swift_retain();
  sub_21E489000((uint64_t)v9, &qword_267D2FA18);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v25);
  swift_release();
  swift_release();
  swift_release();
  uint64_t v27 = swift_getKeyPath();
  uint64_t v28 = v66;
  sub_21E48A534((uint64_t)v16, v66, &qword_267D2FA20);
  uint64_t v29 = (uint64_t *)(v28 + *(int *)(v68 + 36));
  uint64_t v30 = v70;
  *uint64_t v29 = v27;
  v29[1] = v30;
  swift_retain();
  sub_21E489000((uint64_t)v16, &qword_267D2FA20);
  sub_21E496640(&qword_267D2FA38, &qword_267D2FA28, (void (*)(void))sub_21E49557C);
  uint64_t v31 = v77;
  sub_21E4D0670();
  sub_21E489000(v28, &qword_267D2FA28);
  uint64_t v32 = v78;
  (*(void (**)(char *, char *, uint64_t))(v78 + 32))(v81, v31, v79);
  uint64_t v82 = v71;
  uint64_t v83 = v72;
  sub_21E48BAE8();
  swift_bridgeObjectRetain();
  uint64_t v33 = sub_21E4D0610();
  uint64_t v35 = v34;
  LOBYTE(v16) = v36 & 1;
  uint64_t v37 = sub_21E4D05C0();
  uint64_t v39 = v38;
  LOBYTE(v23) = v40 & 1;
  sub_21E4956BC(v33, v35, (char)v16);
  swift_bridgeObjectRelease();
  uint64_t v41 = sub_21E4D05B0();
  uint64_t v43 = v42;
  uint64_t v45 = v44;
  LOBYTE(v30) = v46 & 1;
  sub_21E4956BC(v37, v39, v23);
  swift_bridgeObjectRelease();
  LOBYTE(v35) = sub_21E4D0540();
  sub_21E4D0270();
  uint64_t v82 = v41;
  uint64_t v83 = v43;
  char v84 = v30;
  uint64_t v85 = v45;
  char v86 = v35;
  uint64_t v87 = v47;
  uint64_t v88 = v48;
  uint64_t v89 = v49;
  uint64_t v90 = v50;
  char v91 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FA80);
  sub_21E4956CC();
  uint64_t v51 = v80;
  sub_21E4D0670();
  sub_21E4956BC(v41, v43, v30);
  swift_bridgeObjectRelease();
  uint64_t v52 = *(void (**)(char *, char *, uint64_t))(v32 + 16);
  uint64_t v53 = v77;
  uint64_t v54 = v79;
  v52(v77, v81, v79);
  uint64_t v55 = v74;
  uint64_t v56 = *(void (**)(char *, char *, uint64_t))(v74 + 16);
  uint64_t v57 = v73;
  uint64_t v58 = v75;
  v56(v73, v51, v75);
  uint64_t v59 = v76;
  v52(v76, v53, v54);
  uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FA90);
  v56(&v59[*(int *)(v60 + 48)], v57, v58);
  uint64_t v61 = *(void (**)(char *, uint64_t))(v55 + 8);
  v61(v80, v58);
  unint64_t v62 = *(void (**)(char *, uint64_t))(v78 + 8);
  v62(v81, v54);
  v61(v57, v58);
  return ((uint64_t (*)(char *, uint64_t))v62)(v53, v54);
}

uint64_t sub_21E4951A0()
{
  type metadata accessor for ActivityStatisticsArchivableView();
  return swift_retain();
}

uint64_t sub_21E4951D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_21E496AC8((unint64_t *)&qword_26AB086F8, (void (*)(uint64_t))type metadata accessor for ActivityStatisticsArchivableView);
  return MEMORY[0x270F00310](a1, a2, a3, v6);
}

uint64_t sub_21E495268(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_21E496AC8((unint64_t *)&qword_26AB086F8, (void (*)(uint64_t))type metadata accessor for ActivityStatisticsArchivableView);
  return MEMORY[0x270F00318](a1, a2, a3, v6);
}

uint64_t sub_21E4952FC()
{
  return sub_21E4D0300();
}

uint64_t sub_21E495378@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return __swift_destroy_boxed_opaque_existential_0(a1);
}

uint64_t sub_21E4953AC()
{
  return sub_21E4D0340();
}

uint64_t sub_21E4953D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_21E4953FC(a1, a2, a3, a4, MEMORY[0x263F1B548], MEMORY[0x263F191D8]);
}

uint64_t sub_21E4953FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void), uint64_t (*a6)(char *))
{
  a5(0);
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)&v12 - v8;
  (*(void (**)(char *, uint64_t))(v10 + 16))((char *)&v12 - v8, a1);
  return a6(v9);
}

uint64_t sub_21E4954CC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_21E4D0350();
  *a1 = result;
  return result;
}

uint64_t sub_21E4954F8()
{
  return sub_21E4D0360();
}

uint64_t sub_21E495524@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_21E4D03C0();
  *a1 = result;
  return result;
}

uint64_t sub_21E495550()
{
  return sub_21E4D03D0();
}

unint64_t sub_21E49557C()
{
  unint64_t result = qword_267D2FA40;
  if (!qword_267D2FA40)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D2FA20);
    sub_21E49561C();
    sub_21E48A380(&qword_267D2FA68, &qword_267D2FA18);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2FA40);
  }
  return result;
}

unint64_t sub_21E49561C()
{
  unint64_t result = qword_267D2FA48;
  if (!qword_267D2FA48)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D2FA50);
    sub_21E48A380(&qword_267D2FA58, &qword_267D2FA60);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2FA48);
  }
  return result;
}

uint64_t sub_21E4956BC(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

unint64_t sub_21E4956CC()
{
  unint64_t result = qword_267D2FA88;
  if (!qword_267D2FA88)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D2FA80);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2FA88);
  }
  return result;
}

uint64_t sub_21E495740()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21E49575C()
{
  return sub_21E496AC8(&qword_26AB08648, (void (*)(uint64_t))type metadata accessor for ActivityStatisticsArchivableView);
}

uint64_t sub_21E4957A4()
{
  return sub_21E496AC8(&qword_26AB08650, (void (*)(uint64_t))type metadata accessor for ActivityStatisticsArchivableView);
}

uint64_t sub_21E4957EC()
{
  return sub_21E496AC8(&qword_26AB08658, (void (*)(uint64_t))type metadata accessor for ActivityStatisticsArchivableView);
}

uint64_t *initializeBufferWithCopyOfBuffer for ActivityStatisticsArchivableView(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    uint64_t v4 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F850);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_21E4D0320();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(v4, a2, v7);
    }
    else
    {
      uint64_t *v4 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = a3[5];
    uint64_t v10 = a3[6];
    uint64_t v11 = (uint64_t *)((char *)v4 + v9);
    uint64_t v12 = (uint64_t *)((char *)a2 + v9);
    uint64_t v13 = v12[1];
    *uint64_t v11 = *v12;
    v11[1] = v13;
    uint64_t v14 = (uint64_t *)((char *)v4 + v10);
    uint64_t v15 = (uint64_t *)((char *)a2 + v10);
    uint64_t v16 = v15[1];
    *uint64_t v14 = *v15;
    v14[1] = v16;
    uint64_t v17 = a3[7];
    uint64_t v18 = (char *)v4 + v17;
    uint64_t v19 = (char *)a2 + v17;
    uint64_t v20 = *(void *)v19;
    uint64_t v21 = *((void *)v19 + 1);
    char v22 = v19[16];
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    sub_21E495A00();
    *(void *)uint64_t v18 = v20;
    *((void *)v18 + 1) = v21;
    unsigned char v18[16] = v22;
    uint64_t v23 = a3[8];
    uint64_t v24 = a3[9];
    uint64_t v25 = *(void **)((char *)a2 + v23);
    *(uint64_t *)((char *)v4 + v23) = (uint64_t)v25;
    uint64_t v26 = (uint64_t *)((char *)v4 + v24);
    uint64_t v27 = (uint64_t *)((char *)a2 + v24);
    uint64_t v28 = v27[1];
    *uint64_t v26 = *v27;
    v26[1] = v28;
    *(uint64_t *)((char *)v4 + a3[10]) = *(uint64_t *)((char *)a2 + a3[10]);
    id v29 = v25;
    swift_bridgeObjectRetain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_21E495A00()
{
  return swift_retain();
}

uint64_t destroy for ActivityStatisticsArchivableView(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F850);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_21E4D0320();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_21E492BF0();

  swift_bridgeObjectRelease();
  return swift_release();
}

void *initializeWithCopy for ActivityStatisticsArchivableView(void *a1, void *a2, int *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F850);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_21E4D0320();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = (void *)((char *)a1 + v7);
  uint64_t v10 = (void *)((char *)a2 + v7);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  uint64_t v12 = (void *)((char *)a1 + v8);
  uint64_t v13 = (void *)((char *)a2 + v8);
  uint64_t v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  uint64_t v15 = a3[7];
  uint64_t v16 = (char *)a1 + v15;
  uint64_t v17 = (char *)a2 + v15;
  uint64_t v18 = *(void *)v17;
  uint64_t v19 = *((void *)v17 + 1);
  char v20 = v17[16];
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_21E495A00();
  *(void *)uint64_t v16 = v18;
  *((void *)v16 + 1) = v19;
  v16[16] = v20;
  uint64_t v21 = a3[8];
  uint64_t v22 = a3[9];
  uint64_t v23 = *(void **)((char *)a2 + v21);
  *(void *)((char *)a1 + v21) = v23;
  uint64_t v24 = (void *)((char *)a1 + v22);
  uint64_t v25 = (void *)((char *)a2 + v22);
  uint64_t v26 = v25[1];
  *uint64_t v24 = *v25;
  v24[1] = v26;
  *(void *)((char *)a1 + a3[10]) = *(void *)((char *)a2 + a3[10]);
  id v27 = v23;
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void *assignWithCopy for ActivityStatisticsArchivableView(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_21E489000((uint64_t)a1, &qword_267D2F850);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F850);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_21E4D0320();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  *(void *)((char *)a1 + v7) = *(void *)((char *)a2 + v7);
  swift_retain();
  swift_release();
  *((void *)v8 + 1) = *((void *)v9 + 1);
  swift_retain();
  swift_release();
  uint64_t v10 = a3[6];
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  *(void *)((char *)a1 + v10) = *(void *)((char *)a2 + v10);
  swift_retain();
  swift_release();
  *((void *)v11 + 1) = *((void *)v12 + 1);
  swift_retain();
  swift_release();
  uint64_t v13 = a3[7];
  uint64_t v14 = (char *)a1 + v13;
  uint64_t v15 = (char *)a2 + v13;
  uint64_t v16 = *(void *)v15;
  uint64_t v17 = *((void *)v15 + 1);
  LOBYTE(v12) = v15[16];
  sub_21E495A00();
  *(void *)uint64_t v14 = v16;
  *((void *)v14 + 1) = v17;
  v14[16] = (char)v12;
  sub_21E492BF0();
  uint64_t v18 = a3[8];
  uint64_t v19 = *(void **)((char *)a1 + v18);
  char v20 = *(void **)((char *)a2 + v18);
  *(void *)((char *)a1 + v18) = v20;
  id v21 = v20;

  uint64_t v22 = a3[9];
  uint64_t v23 = (void *)((char *)a1 + v22);
  uint64_t v24 = (void *)((char *)a2 + v22);
  *uint64_t v23 = *v24;
  v23[1] = v24[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[10]) = *(void *)((char *)a2 + a3[10]);
  swift_retain();
  swift_release();
  return a1;
}

char *initializeWithTake for ActivityStatisticsArchivableView(char *a1, char *a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F850);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_21E4D0320();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = a3[6];
  *(_OWORD *)&a1[a3[5]] = *(_OWORD *)&a2[a3[5]];
  *(_OWORD *)&a1[v8] = *(_OWORD *)&a2[v8];
  uint64_t v9 = a3[7];
  uint64_t v10 = a3[8];
  uint64_t v11 = &a1[v9];
  uint64_t v12 = &a2[v9];
  long long v13 = *(_OWORD *)v12;
  v11[16] = v12[16];
  *(_OWORD *)uint64_t v11 = v13;
  *(void *)&a1[v10] = *(void *)&a2[v10];
  uint64_t v14 = a3[10];
  *(_OWORD *)&a1[a3[9]] = *(_OWORD *)&a2[a3[9]];
  *(void *)&a1[v14] = *(void *)&a2[v14];
  return a1;
}

char *assignWithTake for ActivityStatisticsArchivableView(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_21E489000((uint64_t)a1, &qword_267D2F850);
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F850);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_21E4D0320();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v8 = a3[5];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  *(void *)&a1[v8] = *(void *)&a2[v8];
  swift_release();
  *((void *)v9 + 1) = *((void *)v10 + 1);
  swift_release();
  uint64_t v11 = a3[6];
  uint64_t v12 = &a1[v11];
  long long v13 = &a2[v11];
  *(void *)&a1[v11] = *(void *)&a2[v11];
  swift_release();
  *((void *)v12 + 1) = *((void *)v13 + 1);
  swift_release();
  uint64_t v14 = a3[7];
  uint64_t v15 = &a1[v14];
  uint64_t v16 = &a2[v14];
  char v17 = v16[16];
  *(_OWORD *)uint64_t v15 = *(_OWORD *)v16;
  unsigned char v15[16] = v17;
  sub_21E492BF0();
  uint64_t v18 = a3[8];
  uint64_t v19 = *(void **)&a1[v18];
  *(void *)&a1[v18] = *(void *)&a2[v18];

  uint64_t v20 = a3[9];
  id v21 = &a1[v20];
  uint64_t v22 = &a2[v20];
  uint64_t v24 = *(void *)v22;
  uint64_t v23 = *((void *)v22 + 1);
  *(void *)id v21 = v24;
  *((void *)v21 + 1) = v23;
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[10]] = *(void *)&a2[a3[10]];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ActivityStatisticsArchivableView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_21E49615C);
}

uint64_t sub_21E49615C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F8C8);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for ActivityStatisticsArchivableView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_21E496234);
}

uint64_t sub_21E496234(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F8C8);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  return result;
}

void sub_21E4962F4()
{
  sub_21E4963B0();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_21E4963B0()
{
  if (!qword_26AB08638)
  {
    sub_21E4D0320();
    unint64_t v0 = sub_21E4D0280();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26AB08638);
    }
  }
}

unint64_t sub_21E49640C()
{
  unint64_t result = qword_267D2FA98;
  if (!qword_267D2FA98)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D2FA00);
    sub_21E496488();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2FA98);
  }
  return result;
}

unint64_t sub_21E496488()
{
  unint64_t result = qword_267D2FAA0;
  if (!qword_267D2FAA0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D2F9F0);
    sub_21E48A380(&qword_267D2FAA8, &qword_267D2F9E8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2FAA0);
  }
  return result;
}

uint64_t sub_21E496528()
{
  return sub_21E48A380(&qword_267D2FAB0, &qword_267D2FAB8);
}

uint64_t sub_21E496564()
{
  return sub_21E48A380(&qword_267D2FAC0, &qword_267D2FAC8);
}

unint64_t sub_21E4965A0()
{
  unint64_t result = qword_267D2FB40;
  if (!qword_267D2FB40)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D2FB20);
    sub_21E496640(&qword_267D2FB48, &qword_267D2FB18, (void (*)(void))sub_21E4966E4);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2FB40);
  }
  return result;
}

uint64_t sub_21E496640(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    sub_21E48A380(&qword_267D2FA70, &qword_267D2FA78);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_21E4966E4()
{
  unint64_t result = qword_267D2FB50;
  if (!qword_267D2FB50)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D2FB10);
    swift_getOpaqueTypeConformance2();
    sub_21E48A380(&qword_267D2FA68, &qword_267D2FA18);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2FB50);
  }
  return result;
}

unint64_t sub_21E4967B4()
{
  unint64_t result = qword_267D2FB68;
  if (!qword_267D2FB68)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D2FAF0);
    sub_21E48A380(&qword_267D2FB60, &qword_267D2FAE8);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2FB68);
  }
  return result;
}

unint64_t sub_21E496884()
{
  unint64_t result = qword_267D2FBC0;
  if (!qword_267D2FBC0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D2FBB0);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D2FAB8);
    sub_21E48A380(&qword_267D2FAB0, &qword_267D2FAB8);
    swift_getOpaqueTypeConformance2();
    sub_21E496AC8((unint64_t *)&qword_267D2FBC8, MEMORY[0x263F1A470]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2FBC0);
  }
  return result;
}

unint64_t sub_21E496990()
{
  unint64_t result = qword_267D2FBD8;
  if (!qword_267D2FBD8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D2FB98);
    sub_21E48A380(&qword_267D2FBE0, &qword_267D2FB90);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2FBD8);
  }
  return result;
}

uint64_t sub_21E496A30(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_21E496A74(result, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_21E496A74(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_21E496A84(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_21E4956BC(result, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_21E496AC8(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_21E496B10(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

double sub_21E496B70(double a1)
{
  id v2 = objc_msgSend(self, sel_mainScreen);
  objc_msgSend(v2, sel_scale);
  double v4 = v3;

  return a1 / v4;
}

double sub_21E496BD4()
{
  return *MEMORY[0x263F834E8];
}

uint64_t static UIImage.resizable(with:capInsets:)(void *a1, double a2, double a3, double a4, double a5)
{
  id v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F827A0]), sel_initWithSize_, 1.0, 1.0);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 24) = 0;
  *(void *)(v11 + 32) = 0;
  *(void *)(v11 + 16) = a1;
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)(v11 + 40) = _Q0;
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = sub_21E496E08;
  *(void *)(v17 + 24) = v11;
  void v23[4] = sub_21E496E8C;
  v23[5] = v17;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 1107296256;
  void v23[2] = sub_21E496EB4;
  v23[3] = &block_descriptor;
  uint64_t v18 = _Block_copy(v23);
  id v19 = a1;
  swift_retain();
  swift_release();
  id v20 = objc_msgSend(v10, sel_imageWithActions_, v18);
  _Block_release(v18);
  LOBYTE(v18) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (v18)
  {
    __break(1u);
  }
  else
  {
    id v22 = objc_msgSend(v20, sel_resizableImageWithCapInsets_, a2, a3, a4, a5);
    swift_release();

    return (uint64_t)v22;
  }
  return result;
}

uint64_t sub_21E496DD0()
{
  return MEMORY[0x270FA0238](v0, 56, 7);
}

id sub_21E496E08(void *a1)
{
  double v3 = *(double *)(v1 + 24);
  double v4 = *(double *)(v1 + 32);
  double v5 = *(double *)(v1 + 40);
  double v6 = *(double *)(v1 + 48);
  objc_msgSend(*(id *)(v1 + 16), sel_setFill);
  return objc_msgSend(a1, sel_fillRect_, v3, v4, v5, v6);
}

uint64_t sub_21E496E7C()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_21E496E8C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

void sub_21E496EB4(uint64_t a1, void *a2)
{
  id v2 = *(void (**)(void))(a1 + 32);
  id v3 = a2;
  v2();
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

void type metadata accessor for CGRect(uint64_t a1)
{
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_21E496F38(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_21E496F58(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

void type metadata accessor for CGPoint(uint64_t a1)
{
}

void sub_21E496FA8(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

Swift::Double __swiftcall Double.dynamicStepRoundUp(minValue:)(Swift::Double minValue)
{
  if (v1 > 0.0)
  {
    double v2 = v1;
    double v3 = floor(log(v1) / 2.30258509);
    if (v3 > 3.0) {
      double v3 = 3.0;
    }
    if (v3 <= 0.0) {
      double v3 = 0.0;
    }
    double v4 = __exp10(v3);
    return v4 * ceil(v2 / v4);
  }
  return minValue;
}

BOOL static AdaptiveStackType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t AdaptiveStackType.hash(into:)()
{
  return sub_21E4D1080();
}

uint64_t AdaptiveStackType.hashValue.getter()
{
  return sub_21E4D10B0();
}

BOOL sub_21E4970F0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_21E497108()
{
  return sub_21E4D10B0();
}

uint64_t sub_21E497150()
{
  return sub_21E4D1080();
}

uint64_t sub_21E49717C()
{
  return sub_21E4D10B0();
}

uint64_t sub_21E4971C0()
{
  uint64_t v1 = *v0;
  swift_retain();
  return v1;
}

void sub_21E4971F0(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 16);
}

uint64_t sub_21E4971FC()
{
  return *(void *)(v0 + 24);
}

uint64_t sub_21E497204()
{
  return *(void *)(v0 + 32);
}

uint64_t sub_21E49720C()
{
  return *(void *)(v0 + 40);
}

char *AdaptiveStack.init(type:verticalAlignment:horizontalAlignment:spacing:content:)@<X0>(char *result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  char v8 = *result;
  *(void *)a8 = a6;
  *(void *)(a8 + 8) = a7;
  *(unsigned char *)(a8 + 16) = v8;
  *(void *)(a8 + 24) = a2;
  *(void *)(a8 + 32) = a3;
  *(void *)(a8 + 40) = a4;
  *(unsigned char *)(a8 + 48) = a5 & 1;
  return result;
}

uint64_t AdaptiveStack.body.getter@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  id v20 = a2;
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(a1 + 24);
  sub_21E4D07E0();
  sub_21E4D0800();
  sub_21E4D04E0();
  uint64_t v5 = sub_21E4D0760();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v19 - v10;
  long long v12 = *(_OWORD *)(v2 + 16);
  v27[0] = *(_OWORD *)v2;
  v27[1] = v12;
  v27[2] = *(_OWORD *)(v2 + 32);
  char v28 = *(unsigned char *)(v2 + 48);
  uint64_t v21 = v3;
  uint64_t v22 = v4;
  uint64_t v23 = v27;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v14 = swift_getWitnessTable();
  uint64_t v25 = WitnessTable;
  uint64_t v26 = v14;
  uint64_t v15 = swift_getWitnessTable();
  sub_21E4D0750();
  uint64_t v24 = v15;
  swift_getWitnessTable();
  uint64_t v16 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
  v16(v11, v9, v5);
  uint64_t v17 = *(void (**)(char *, uint64_t))(v6 + 8);
  v17(v9, v5);
  v16(v20, v11, v5);
  return ((uint64_t (*)(char *, uint64_t))v17)(v11, v5);
}

uint64_t sub_21E49749C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v34 = a2;
  uint64_t v3 = sub_21E4D0800();
  uint64_t v31 = *(void *)(v3 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v30 = (char *)&v29 - v7;
  uint64_t v8 = sub_21E4D07E0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  long long v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v29 - v13;
  uint64_t v15 = sub_21E4D04E0();
  uint64_t v32 = *(void *)(v15 - 8);
  uint64_t v33 = v15;
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v29 - v16;
  if (*(unsigned char *)(a1 + 16))
  {
    sub_21E4D07F0();
    swift_getWitnessTable();
    uint64_t v19 = v30;
    uint64_t v18 = v31;
    id v20 = *(void (**)(char *, char *, uint64_t))(v31 + 16);
    v20(v30, v6, v3);
    uint64_t v21 = *(void (**)(char *, uint64_t))(v18 + 8);
    v21(v6, v3);
    v20(v6, v19, v3);
    swift_getWitnessTable();
    sub_21E497A2C((uint64_t)v6, v8, v3);
    v21(v6, v3);
    v21(v19, v3);
  }
  else
  {
    sub_21E4D07D0();
    swift_getWitnessTable();
    uint64_t v22 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
    v22(v14, v12, v8);
    uint64_t v23 = *(void (**)(char *, uint64_t))(v9 + 8);
    v23(v12, v8);
    v22(v12, v14, v8);
    swift_getWitnessTable();
    sub_21E497934((uint64_t)v12, v8);
    v23(v12, v8);
    v23(v14, v8);
  }
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v25 = swift_getWitnessTable();
  uint64_t v35 = WitnessTable;
  uint64_t v36 = v25;
  uint64_t v26 = v33;
  swift_getWitnessTable();
  uint64_t v27 = v32;
  (*(void (**)(uint64_t, char *, uint64_t))(v32 + 16))(v34, v17, v26);
  return (*(uint64_t (**)(char *, uint64_t))(v27 + 8))(v17, v26);
}

uint64_t sub_21E497928@<X0>(uint64_t a1@<X8>)
{
  return sub_21E49749C(*(void *)(v1 + 32), a1);
}

uint64_t sub_21E497934(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_21E4D04C0();
  MEMORY[0x270FA5388](v4);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))((char *)&v7 - v5, a1, a2);
  swift_storeEnumTagMultiPayload();
  return sub_21E4D04D0();
}

uint64_t sub_21E497A2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_21E4D04C0();
  MEMORY[0x270FA5388](v5);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 16))((char *)&v8 - v6, a1, a3);
  swift_storeEnumTagMultiPayload();
  return sub_21E4D04D0();
}

unint64_t sub_21E497B28()
{
  unint64_t result = qword_267D2FC48;
  if (!qword_267D2FC48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2FC48);
  }
  return result;
}

uint64_t sub_21E497B7C()
{
  return swift_getOpaqueTypeConformance2();
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AdaptiveStackType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for AdaptiveStackType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *unint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x21E497D2CLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_21E497D54(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_21E497D5C(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for AdaptiveStackType()
{
  return &type metadata for AdaptiveStackType;
}

uint64_t sub_21E497D78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 40);
}

uint64_t sub_21E497D80()
{
  return swift_release();
}

uint64_t sub_21E497D88(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  swift_retain();
  return a1;
}

uint64_t sub_21E497DD8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 40) = v5;
  return a1;
}

__n128 __swift_memcpy49_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t sub_21E497E64(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  return a1;
}

uint64_t sub_21E497EBC(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 49)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_21E497F04(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 48) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 49) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 49) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for AdaptiveStack()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_21E497F6C()
{
  return swift_getWitnessTable();
}

uint64_t sub_21E49806C()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC9FitnessUI19ModernBarButtonItem_callback);
  swift_retain();
  return v1;
}

uint64_t sub_21E4980A8()
{
  return 0;
}

id sub_21E4980B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v11 = objc_allocWithZone(v5);
  return sub_21E498114(a1, a2, a3, a4, a5);
}

id sub_21E498114(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  BOOL v7 = &v5[OBJC_IVAR____TtC9FitnessUI19ModernBarButtonItem_callback];
  *(void *)BOOL v7 = a4;
  *((void *)v7 + 1) = a5;
  v12.receiver = v5;
  v12.super_class = (Class)type metadata accessor for ModernBarButtonItem();
  swift_retain();
  id v8 = objc_msgSendSuper2(&v12, sel_init);
  uint64_t v9 = (void *)sub_21E4D0AB0();
  swift_bridgeObjectRelease();
  objc_msgSend(v8, sel_setTitle_, v9, v12.receiver, v12.super_class);

  objc_msgSend(v8, sel_setStyle_, a3);
  objc_msgSend(v8, sel_setTarget_, v8);
  id v10 = v8;
  objc_msgSend(v10, sel_setAction_, sel_handleTappedButton);

  swift_release();
  return v10;
}

uint64_t type metadata accessor for ModernBarButtonItem()
{
  return self;
}

id sub_21E49824C(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

void sub_21E498290()
{
}

uint64_t sub_21E498348()
{
  return (*(uint64_t (**)(void))(v0 + OBJC_IVAR____TtC9FitnessUI19ModernBarButtonItem_callback))();
}

id sub_21E4983D4()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void sub_21E498408()
{
}

id sub_21E498468()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ModernBarButtonItem();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t FIUIDepthFormattedGoalPair.goalString.getter()
{
  return sub_21E498588(&OBJC_IVAR___FIUIDepthFormattedGoalPair_goalString);
}

uint64_t FIUIDepthFormattedGoalPair.goalString.setter(uint64_t a1, uint64_t a2)
{
  return sub_21E498660(a1, a2, &OBJC_IVAR___FIUIDepthFormattedGoalPair_goalString);
}

void sub_21E4984E0(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_21E4984EC(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

id sub_21E498504()
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  uint64_t v0 = (void *)sub_21E4D0AB0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t FIUIDepthFormattedGoalPair.goalValue.getter()
{
  return sub_21E498588(&OBJC_IVAR___FIUIDepthFormattedGoalPair_goalValue);
}

uint64_t sub_21E498588(void *a1)
{
  objc_super v2 = (uint64_t *)(v1 + *a1);
  swift_beginAccess();
  uint64_t v3 = *v2;
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t sub_21E4985E8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v6 = sub_21E4D0AF0();
  uint64_t v8 = v7;
  uint64_t v9 = (uint64_t *)(a1 + *a4);
  swift_beginAccess();
  *uint64_t v9 = v6;
  v9[1] = v8;
  return swift_bridgeObjectRelease();
}

uint64_t FIUIDepthFormattedGoalPair.goalValue.setter(uint64_t a1, uint64_t a2)
{
  return sub_21E498660(a1, a2, &OBJC_IVAR___FIUIDepthFormattedGoalPair_goalValue);
}

uint64_t sub_21E498660(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = (void *)(v3 + *a3);
  swift_beginAccess();
  void *v6 = a1;
  v6[1] = a2;
  return swift_bridgeObjectRelease();
}

void sub_21E4986BC(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_21E4986C8(id *a1@<X0>, SEL *a2@<X3>, uint64_t *a3@<X8>)
{
  id v4 = [*a1 *a2];
  uint64_t v5 = sub_21E4D0AF0();
  uint64_t v7 = v6;

  *a3 = v5;
  a3[1] = v7;
}

void sub_21E49871C(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

void sub_21E498728(uint64_t a1, void **a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  uint64_t v6 = *a2;
  id v7 = (id)sub_21E4D0AB0();
  objc_msgSend(v6, *a5, v7);
}

void __swiftcall FIUIDepthFormattedGoalPair.init(goalString:goalValue:)(FIUIDepthFormattedGoalPair *__return_ptr retstr, Swift::String goalString, Swift::String goalValue)
{
  id v3 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v4 = (void *)sub_21E4D0AB0();
  swift_bridgeObjectRelease();
  uint64_t v5 = (void *)sub_21E4D0AB0();
  swift_bridgeObjectRelease();
  objc_msgSend(v3, sel_initWithGoalString_goalValue_, v4, v5);
}

id FIUIDepthFormattedGoalPair.init(goalString:goalValue:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)(v4 + OBJC_IVAR___FIUIDepthFormattedGoalPair_goalString);
  void *v5 = a1;
  v5[1] = a2;
  uint64_t v6 = (void *)(v4 + OBJC_IVAR___FIUIDepthFormattedGoalPair_goalValue);
  void *v6 = a3;
  v6[1] = a4;
  v8.super_class = (Class)FIUIDepthFormattedGoalPair;
  return objc_msgSendSuper2(&v8, sel_init);
}

void FIUIDepthFormattedGoalPair.init()()
{
}

void __swiftcall FIUIDepthFormatter.init(unitManager:)(FIUIDepthFormatter *__return_ptr retstr, FIUIUnitManager unitManager)
{
  Class isa = unitManager.super.isa;
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithUnitManager_, unitManager.super.isa);
}

id FIUIDepthFormatter.init(unitManager:)(void *a1)
{
  id v2 = sub_21E49A350(a1);

  return v2;
}

uint64_t FIUIDepthFormatter.formatMaxDepth(_:unit:)(uint64_t a1, double a2)
{
  uint64_t v49 = a1;
  uint64_t v3 = sub_21E4CFC10();
  uint64_t v46 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v42 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FC68);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v47 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_21E4D08C0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  objc_super v12 = (char *)&v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v42 - v13;
  uint64_t v15 = sub_21E4D0880();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v42 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v42 - v20;
  uint64_t v51 = v9;
  uint64_t v22 = (unsigned int *)MEMORY[0x263F39748];
  if (v49 != 1) {
    uint64_t v22 = (unsigned int *)MEMORY[0x263F39750];
  }
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v14, *v22, v8);
  uint64_t v48 = v8;
  if (a2 >= 40.0)
  {
    uint64_t v24 = *MEMORY[0x263F39728];
    uint64_t v23 = *(void (**)(char *, uint64_t, uint64_t))(v16 + 104);
    v23(v21, v24, v15);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v51 + 16))(v12, v14, v8);
    sub_21E4D08D0();
    uint64_t v23 = *(void (**)(char *, uint64_t, uint64_t))(v16 + 104);
    v23(v21, *MEMORY[0x263F39730], v15);
    uint64_t v24 = *MEMORY[0x263F39728];
  }
  (*(void (**)(char *, uint64_t))(v51 + 8))(v14, v48);
  v23(v19, v24, v15);
  char v25 = MEMORY[0x223C27D70](v21, v19);
  char v28 = *(void (**)(void, void))(v16 + 8);
  uint64_t v26 = (char *)(v16 + 8);
  uint64_t v27 = v28;
  v28(v19, v15);
  if (v25)
  {
    uint64_t v45 = v15;
    uint64_t v29 = sub_21E4D0960();
    uint64_t v30 = (uint64_t)v47;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v47, 1, 1, v29);
    uint64_t v44 = v21;
    uint64_t v31 = sub_21E4D0900();
    unint64_t v33 = v32;
    sub_21E49A850(v30);
    uint64_t v54 = 0;
    unint64_t v55 = 0xE000000000000000;
    uint64_t v50 = v31 & 0xFFFFFFFFFFFFLL;
    uint64_t v51 = HIBYTE(v33) & 0xF;
    if ((v33 & 0x2000000000000000) != 0) {
      uint64_t v34 = HIBYTE(v33) & 0xF;
    }
    else {
      uint64_t v34 = v31 & 0xFFFFFFFFFFFFLL;
    }
    if (v34)
    {
      uint64_t v43 = v27;
      uint64_t v49 = v33 & 0xFFFFFFFFFFFFFFLL;
      uint64_t v47 = v26;
      uint64_t v48 = (v33 & 0xFFFFFFFFFFFFFFFLL) + 32;
      uint64_t v35 = (void (**)(char *, uint64_t))(v46 + 8);
      swift_bridgeObjectRetain();
      for (uint64_t i = 0; i < v34; i += v38)
      {
        if ((v33 & 0x1000000000000000) != 0)
        {
          sub_21E4D0DB0();
        }
        else
        {
          if ((v33 & 0x2000000000000000) != 0)
          {
            uint64_t v52 = v31;
            uint64_t v53 = v49;
          }
          else if ((v31 & 0x1000000000000000) == 0)
          {
            sub_21E4D0E00();
          }
          sub_21E4D0E10();
        }
        uint64_t v38 = v37;
        sub_21E4CFBF0();
        char v39 = sub_21E4CFC00();
        (*v35)(v5, v3);
        if ((v39 & 1) == 0) {
          sub_21E4D0B30();
        }
      }
      swift_bridgeObjectRelease();
      uint64_t v27 = v43;
    }
    swift_bridgeObjectRelease();
    uint64_t v40 = v54;
    uint64_t v21 = v44;
    uint64_t v15 = v45;
  }
  else
  {
    uint64_t v40 = sub_21E4D08E0();
  }
  v27(v21, v15);
  return v40;
}

uint64_t sub_21E498FE0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_21E4D08C0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 104);
  uint64_t v6 = (unsigned int *)MEMORY[0x263F39748];
  if (a1 != 1) {
    uint64_t v6 = (unsigned int *)MEMORY[0x263F39750];
  }
  uint64_t v7 = *v6;
  return v5(a2, v7, v4);
}

uint64_t FIUIDepthFormatter.formatDepthValue(_:unit:)(uint64_t a1, double a2)
{
  uint64_t v5 = sub_21E4D08C0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v51 = (char *)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v45 - v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v45 - v12;
  uint64_t v14 = sub_21E4D0880();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v45 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v45 - v19;
  uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 104);
  uint64_t v22 = (unsigned int *)MEMORY[0x263F39748];
  if (a1 != 1) {
    uint64_t v22 = (unsigned int *)MEMORY[0x263F39750];
  }
  uint64_t v23 = *v22;
  uint64_t v48 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 104);
  uint64_t v49 = v6 + 104;
  v21(v13, v23, v5);
  uint64_t v50 = v11;
  uint64_t v52 = v2;
  uint64_t v53 = v5;
  if (a2 >= 40.0)
  {
    uint64_t v26 = *MEMORY[0x263F39728];
    uint64_t v24 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 104);
    uint64_t v25 = v14;
    v24(v20, v26, v14);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v11, v13, v5);
    sub_21E4D08D0();
    uint64_t v24 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 104);
    uint64_t v25 = v14;
    v24(v20, *MEMORY[0x263F39730], v14);
    uint64_t v26 = *MEMORY[0x263F39728];
  }
  uint64_t v27 = *(void (**)(char *, uint64_t))(v6 + 8);
  v27(v13, v53);
  v24(v18, v26, v25);
  char v28 = MEMORY[0x223C27D70](v20, v18);
  uint64_t v29 = *(void (**)(char *, uint64_t))(v15 + 8);
  v29(v18, v25);
  uint64_t v30 = v25;
  if ((v28 & 1) == 0)
  {
    uint64_t v38 = sub_21E4D08E0();
LABEL_14:
    uint64_t v43 = v38;
    goto LABEL_15;
  }
  uint64_t v46 = v27;
  uint64_t v47 = v29;
  sub_21E4835F8(0, (unint64_t *)&qword_26AB08640);
  id v31 = objc_msgSend(*(id *)(v52 + OBJC_IVAR___FIUIDepthFormatter_unitManager), sel_userDepthHKUnit);
  id v32 = objc_msgSend(self, sel_meterUnit);
  char v33 = sub_21E4D0D20();

  uint64_t v34 = v53;
  uint64_t v35 = v51;
  uint64_t v36 = v48;
  if (v33)
  {
    uint64_t v37 = *MEMORY[0x263F39748];
    v48(v51, v37, v53);
  }
  else
  {
    v48(v51, *MEMORY[0x263F39750], v53);
    uint64_t v37 = *MEMORY[0x263F39748];
  }
  char v39 = v50;
  v36(v50, v37, v34);
  sub_21E49A8B0();
  sub_21E4D0BA0();
  sub_21E4D0BA0();
  uint64_t v40 = v54;
  uint64_t v41 = v56;
  uint64_t v42 = v46;
  v46(v39, v34);
  v42(v35, v34);
  uint64_t v29 = v47;
  if (v40 != v41)
  {
    uint64_t v54 = 130;
    uint64_t v38 = sub_21E4D0F90();
    goto LABEL_14;
  }
  uint64_t v54 = 0;
  unint64_t v55 = 0xE000000000000000;
  sub_21E4D0C80();
  uint64_t v43 = v54;
LABEL_15:
  v29(v20, v30);
  return v43;
}

id sub_21E4995B0(void *a1, double a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, double))
{
  id v8 = a1;
  a5(a4, a2);

  uint64_t v9 = (void *)sub_21E4D0AB0();
  swift_bridgeObjectRelease();
  return v9;
}

Swift::String __swiftcall FIUIDepthFormatter.formatWaterTemperatureValue(_:)(Swift::Double a1)
{
  uint64_t v1 = sub_21E4D09F0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_21E4D0970();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  id v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x263F39780], v1);
  sub_21E4D09B0();
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x263F39760], v5);
  uint64_t v9 = sub_21E4D0920();
  uint64_t v11 = v10;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v12 = v9;
  uint64_t v13 = v11;
  result._object = v13;
  result._countAndFlagsBits = v12;
  return result;
}

Swift::String __swiftcall FIUIDepthFormatter.formatWaterTemperatureRange(withLower:upper:)(Swift::Double withLower, Swift::Double upper)
{
  uint64_t v2 = sub_21E4D09F0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_21E4D09A0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FC88);
  uint64_t v10 = *MEMORY[0x263F39780];
  uint64_t v11 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 104);
  v11(v5, v10, v2);
  sub_21E4D09B0();
  v11(v5, v10, v2);
  sub_21E4D09B0();
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x263F39770], v6);
  uint64_t v12 = sub_21E4D0940();
  uint64_t v14 = v13;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  uint64_t v15 = v12;
  uint64_t v16 = v14;
  result._object = v16;
  result._countAndFlagsBits = v15;
  return result;
}

Swift::String __swiftcall FIUIDepthFormatter.formatUnderwaterTime(_:)(Swift::Double a1)
{
  uint64_t v1 = sub_21E4D0930();
  result._object = v2;
  result._countAndFlagsBits = v1;
  return result;
}

void __swiftcall FIUIDepthFormatter.formatGoalValue(forDive:healthStore:)(FIUIDepthFormattedGoalPair *__return_ptr retstr, HKWorkout forDive, HKHealthStore healthStore)
{
  uint64_t v3 = sub_21E4D08B0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21E4D08F0();
  sub_21E4D08A0();
  sub_21E4D0890();
  id v7 = objc_allocWithZone((Class)FIUIDepthFormattedGoalPair);
  uint64_t v8 = (void *)sub_21E4D0AB0();
  swift_bridgeObjectRelease();
  uint64_t v9 = (void *)sub_21E4D0AB0();
  swift_bridgeObjectRelease();
  objc_msgSend(v7, sel_initWithGoalString_goalValue_, v8, v9);

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

id _sSo26FIUIDepthFormattedGoalPairC9FitnessUIEABycfC_0()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return objc_msgSend(v0, sel_init);
}

void FIUIDepthFormatter.init()()
{
}

id sub_21E49A350(void *a1)
{
  uint64_t v3 = sub_21E4D0990();
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v52 = (char *)&v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = sub_21E4D09F0();
  uint64_t v5 = *(void *)(v51 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v51);
  uint64_t v50 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v47 = (char *)&v41 - v8;
  uint64_t v44 = sub_21E4D08C0();
  uint64_t v9 = *(void *)(v44 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v44);
  uint64_t v12 = (char *)&v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v43 = (char *)&v41 - v13;
  uint64_t v48 = sub_21E4D09E0();
  uint64_t v46 = *(void *)(v48 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v48);
  uint64_t v45 = (char *)&v41 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v41 - v16;
  *(void *)&v1[OBJC_IVAR___FIUIDepthFormatter_unitManager] = a1;
  uint64_t v49 = v1;
  id v18 = a1;
  sub_21E4D09D0();
  sub_21E4835F8(0, (unint64_t *)&qword_26AB08640);
  id v19 = objc_msgSend(v18, sel_userDepthHKUnit);
  uint64_t v20 = self;
  id v21 = objc_msgSend(v20, sel_meterUnit);
  char v22 = sub_21E4D0D20();

  uint64_t v42 = v9;
  uint64_t v23 = (unsigned int *)MEMORY[0x263F39748];
  if ((v22 & 1) == 0) {
    uint64_t v23 = (unsigned int *)MEMORY[0x263F39750];
  }
  uint64_t v25 = v43;
  uint64_t v24 = v44;
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v43, *v23, v44);
  id v26 = objc_msgSend(v18, sel_userWaterTemperatureHKUnit);
  id v27 = objc_msgSend(v20, sel_degreeCelsiusUnit);
  char v28 = sub_21E4D0D20();

  uint64_t v29 = (unsigned int *)MEMORY[0x263F39780];
  if ((v28 & 1) == 0) {
    uint64_t v29 = (unsigned int *)MEMORY[0x263F39778];
  }
  uint64_t v30 = v47;
  uint64_t v31 = v51;
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v47, *v29, v51);
  id v32 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
  char v33 = v25;
  v32(v12, v25, v24);
  uint64_t v34 = v31;
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v50, v30, v31);
  sub_21E4D0980();
  sub_21E4D09C0();
  uint64_t v35 = v46;
  uint64_t v36 = v48;
  (*(void (**)(char *, char *, uint64_t))(v46 + 16))(v45, v17, v48);
  id v37 = objc_allocWithZone((Class)sub_21E4D0950());
  uint64_t v38 = sub_21E4D0910();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v30, v34);
  (*(void (**)(char *, uint64_t))(v42 + 8))(v33, v24);
  (*(void (**)(char *, uint64_t))(v35 + 8))(v17, v36);
  char v39 = v49;
  *(void *)&v49[OBJC_IVAR___FIUIDepthFormatter_depthFormatter] = v38;

  v53.receiver = v39;
  v53.super_class = (Class)FIUIDepthFormatter;
  return objc_msgSendSuper2(&v53, sel_init);
}

uint64_t sub_21E49A850(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FC68);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_21E49A8B0()
{
  unint64_t result = qword_267D2FC80;
  if (!qword_267D2FC80)
  {
    sub_21E4D08C0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2FC80);
  }
  return result;
}

char *keypath_get_selector_goalString()
{
  return sel_goalString;
}

char *keypath_get_selector_goalValue()
{
  return sel_goalValue;
}

uint64_t type metadata accessor for FIUIDepthFormattedGoalPair(uint64_t a1)
{
  return sub_21E4835F8(a1, &qword_267D306E0);
}

uint64_t type metadata accessor for FIUIDepthFormatter(uint64_t a1)
{
  return sub_21E4835F8(a1, &qword_267D306E8);
}

id sub_21E49A948()
{
  id v0 = objc_msgSend(self, sel_weakObjectsHashTable);
  return v0;
}

id sub_21E49A988(void *a1)
{
  id v2 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithHealthStore_, a1);

  return v2;
}

id sub_21E49A9D0(void *a1)
{
  *(void *)&v1[OBJC_IVAR___FIUIPregnancyStateProvider_query] = 0;
  uint64_t v3 = OBJC_IVAR___FIUIPregnancyStateProvider_observers;
  uint64_t v4 = self;
  uint64_t v5 = v1;
  *(void *)&v1[v3] = objc_msgSend(v4, sel_weakObjectsHashTable);
  *(void *)&v5[OBJC_IVAR___FIUIPregnancyStateProvider_pregnancyModel] = 0;
  *(void *)&v5[OBJC_IVAR___FIUIPregnancyStateProvider_healthStore] = a1;
  id v6 = a1;

  v9.receiver = v5;
  v9.super_class = (Class)FIUIPregnancyStateProvider;
  id v7 = objc_msgSendSuper2(&v9, sel_init);
  objc_msgSend(v7, sel_activate);

  return v7;
}

id sub_21E49AAD8()
{
  swift_getObjectType();
  os_log_type_t v1 = sub_21E4D0CD0();
  id v2 = (void *)*MEMORY[0x263F098C8];
  os_log_type_t v3 = v1;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], v1))
  {
    uint64_t v4 = v2;
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v11 = v6;
    *(_DWORD *)uint64_t v5 = 136315138;
    uint64_t v7 = sub_21E4D10C0();
    unint64_t v10 = sub_21E489B2C(v7, v8, &v11);
    sub_21E4D0D30();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21E433000, v4, v3, "%s De-init called.", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x223C29AE0](v6, -1, -1);
    MEMORY[0x223C29AE0](v5, -1, -1);
  }
  objc_msgSend(v0, sel_stopQuery, v10, v11);
  v12.receiver = v0;
  v12.super_class = (Class)FIUIPregnancyStateProvider;
  return objc_msgSendSuper2(&v12, sel_dealloc);
}

void *sub_21E49ACE4()
{
  os_log_type_t v1 = *(void **)(v0 + OBJC_IVAR___FIUIPregnancyStateProvider_pregnancyModel);
  id v2 = v1;
  return v1;
}

void *sub_21E49AD24()
{
  unint64_t result = *(void **)(v0 + OBJC_IVAR___FIUIPregnancyStateProvider_pregnancyModel);
  if (result) {
    return (void *)(objc_msgSend(result, sel_state) == (id)1);
  }
  return result;
}

id sub_21E49AD94(uint64_t a1)
{
  return objc_msgSend(*(id *)(v1 + OBJC_IVAR___FIUIPregnancyStateProvider_observers), sel_addObject_, a1);
}

id sub_21E49ADC8(uint64_t a1)
{
  return objc_msgSend(*(id *)(v1 + OBJC_IVAR___FIUIPregnancyStateProvider_observers), sel_removeObject_, a1);
}

void sub_21E49ADFC(uint64_t a1)
{
  id v3 = objc_msgSend(*(id *)(v1 + OBJC_IVAR___FIUIPregnancyStateProvider_observers), sel_allObjects);
  unint64_t v4 = sub_21E4D0BD0();

  if (!(v4 >> 62))
  {
    uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v5) {
      goto LABEL_3;
    }
LABEL_13:
    goto LABEL_15;
  }
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_21E4D0F20();
  swift_bridgeObjectRelease();
  if (!v5) {
    goto LABEL_13;
  }
LABEL_3:
  if (v5 >= 1)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if ((v4 & 0xC000000000000001) != 0) {
        MEMORY[0x223C282E0](i, v4);
      }
      else {
        swift_unknownObjectRetain();
      }
      uint64_t v7 = (void *)swift_dynamicCastObjCProtocolConditional();
      if (v7) {
        objc_msgSend(v7, sel_pregnancyModelDidChangeWithProvider_model_, v1, a1);
      }
      swift_unknownObjectRelease();
    }
LABEL_15:
    swift_bridgeObjectRelease();
    return;
  }
  __break(1u);
}

void sub_21E49AFF0()
{
  uint64_t ObjectType = swift_getObjectType();
  os_log_type_t v2 = sub_21E4D0CD0();
  id v3 = (void *)*MEMORY[0x263F098C8];
  os_log_type_t v4 = v2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], v2))
  {
    uint64_t v5 = v3;
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    aBlock[0] = v7;
    *(_DWORD *)uint64_t v6 = 136315138;
    uint64_t v8 = sub_21E4D10C0();
    sub_21E489B2C(v8, v9, aBlock);
    sub_21E4D0D30();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21E433000, v5, v4, "%s Starting pregnancy state query.", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x223C29AE0](v7, -1, -1);
    MEMORY[0x223C29AE0](v6, -1, -1);
  }
  uint64_t v10 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  *(void *)(v11 + 24) = ObjectType;
  id v12 = objc_allocWithZone(MEMORY[0x263F0A490]);
  void aBlock[4] = (uint64_t)sub_21E49BDCC;
  aBlock[5] = v11;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_21E49BC7C;
  aBlock[3] = (uint64_t)&block_descriptor_0;
  uint64_t v13 = _Block_copy(aBlock);
  swift_retain();
  id v14 = objc_msgSend(v12, sel_initWithUpdateHandler_, v13);
  _Block_release(v13);
  swift_release();
  swift_release();
  objc_msgSend(*(id *)(v0 + OBJC_IVAR___FIUIPregnancyStateProvider_healthStore), sel_executeQuery_, v14);
  uint64_t v15 = *(void **)(v0 + OBJC_IVAR___FIUIPregnancyStateProvider_query);
  *(void *)(v0 + OBJC_IVAR___FIUIPregnancyStateProvider_query) = v14;
}

void sub_21E49B2AC()
{
  swift_getObjectType();
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR___FIUIPregnancyStateProvider_query);
  if (v1)
  {
    os_log_type_t v2 = *(void **)(v0 + OBJC_IVAR___FIUIPregnancyStateProvider_healthStore);
    id v11 = v1;
    objc_msgSend(v2, sel_stopQuery_);
    os_log_type_t v3 = sub_21E4D0CD0();
    os_log_type_t v4 = (void *)*MEMORY[0x263F098C8];
    os_log_type_t v5 = v3;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], v3))
    {
      uint64_t v6 = v4;
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      uint64_t v8 = swift_slowAlloc();
      uint64_t v12 = v8;
      *(_DWORD *)uint64_t v7 = 136315138;
      uint64_t v9 = sub_21E4D10C0();
      sub_21E489B2C(v9, v10, &v12);
      sub_21E4D0D30();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21E433000, v6, v5, "%s Stopping pregnancy state query.", v7, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C29AE0](v8, -1, -1);
      MEMORY[0x223C29AE0](v7, -1, -1);
    }
    else
    {
    }
  }
}

void sub_21E49B4B0(void *a1)
{
  os_log_type_t v2 = v1;
  swift_getObjectType();
  os_log_type_t v4 = sub_21E4D0CD0();
  os_log_type_t v5 = (os_log_t *)MEMORY[0x263F098C8];
  uint64_t v6 = (void *)*MEMORY[0x263F098C8];
  os_log_type_t v7 = v4;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], v4))
  {
    id v8 = a1;
    log = v6;
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136315138;
    uint64_t v43 = v10;
    unint64_t v44 = 0;
    unint64_t v45 = 0xE000000000000000;
    sub_21E4D0DC0();
    sub_21E4D0B60();
    sub_21E4D10C0();
    sub_21E4D0B60();
    swift_bridgeObjectRelease();
    sub_21E4D0B60();
    id v11 = objc_msgSend(v8, sel_description);
    sub_21E4D0AF0();

    sub_21E4D0B60();
    swift_bridgeObjectRelease();
    sub_21E4D0B60();
    uint64_t v12 = (void *)sub_21E4D0AB0();
    swift_bridgeObjectRelease();
    id v13 = (id)HKSensitiveLogItem();

    sub_21E4D0D80();
    swift_unknownObjectRelease();
    uint64_t v14 = sub_21E4D0B10();
    unint64_t v44 = sub_21E489B2C(v14, v15, &v43);
    sub_21E4D0D30();

    os_log_type_t v5 = (os_log_t *)MEMORY[0x263F098C8];
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21E433000, log, v7, "%s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x223C29AE0](v10, -1, -1);
    MEMORY[0x223C29AE0](v9, -1, -1);
  }
  uint64_t v16 = OBJC_IVAR___FIUIPregnancyStateProvider_pregnancyModel;
  uint64_t v17 = *(void *)&v2[OBJC_IVAR___FIUIPregnancyStateProvider_pregnancyModel];
  if (v17) {
    id v18 = objc_msgSend(*(id *)&v2[OBJC_IVAR___FIUIPregnancyStateProvider_pregnancyModel], sel_state);
  }
  else {
    id v18 = 0;
  }
  id v19 = objc_msgSend(a1, sel_state);
  os_log_type_t v20 = sub_21E4D0CD0();
  os_log_t v21 = *v5;
  BOOL v22 = os_log_type_enabled(*v5, v20);
  if (v17) {
    BOOL v23 = v18 == v19;
  }
  else {
    BOOL v23 = 0;
  }
  if (v23)
  {
    if (v22)
    {
      char v33 = v21;
      uint64_t v34 = (uint8_t *)swift_slowAlloc();
      uint64_t v35 = swift_slowAlloc();
      *(_DWORD *)uint64_t v34 = 136315138;
      uint64_t v43 = v35;
      unint64_t v44 = 0;
      unint64_t v45 = 0xE000000000000000;
      sub_21E4D0DC0();
      sub_21E4D0B60();
      sub_21E4D10C0();
      sub_21E4D0B60();
      swift_bridgeObjectRelease();
      sub_21E4D0B60();
      uint64_t v36 = (void *)sub_21E4D0AB0();
      swift_bridgeObjectRelease();
      id v37 = (id)HKSensitiveLogItem();

      sub_21E4D0D80();
      swift_unknownObjectRelease();
      uint64_t v38 = sub_21E4D0B10();
      unint64_t v44 = sub_21E489B2C(v38, v39, &v43);
      sub_21E4D0D30();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21E433000, v33, v20, "%s", v34, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C29AE0](v35, -1, -1);
      MEMORY[0x223C29AE0](v34, -1, -1);
    }
  }
  else
  {
    if (v22)
    {
      id v24 = a1;
      loga = v21;
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      uint64_t v40 = swift_slowAlloc();
      *(_DWORD *)uint64_t v25 = 136315138;
      uint64_t v43 = v40;
      unint64_t v44 = 0;
      unint64_t v45 = 0xE000000000000000;
      sub_21E4D0DC0();
      sub_21E4D0B60();
      sub_21E4D10C0();
      sub_21E4D0B60();
      swift_bridgeObjectRelease();
      sub_21E4D0B60();
      id v26 = objc_msgSend(v24, sel_description);
      sub_21E4D0AF0();

      sub_21E4D0B60();
      swift_bridgeObjectRelease();
      sub_21E4D0B60();
      id v27 = (void *)sub_21E4D0AB0();
      swift_bridgeObjectRelease();
      id v28 = (id)HKSensitiveLogItem();

      sub_21E4D0D80();
      swift_unknownObjectRelease();
      uint64_t v29 = sub_21E4D0B10();
      unint64_t v44 = sub_21E489B2C(v29, v30, &v43);
      sub_21E4D0D30();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21E433000, loga, v20, "%s", v25, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C29AE0](v40, -1, -1);
      MEMORY[0x223C29AE0](v25, -1, -1);
    }
    uint64_t v31 = *(void **)&v2[v16];
    *(void *)&v2[v16] = a1;
    id v32 = a1;

    if (*(void *)&v2[v16]) {
      objc_msgSend(v2, sel_notifyObservers_);
    }
  }
}

void __swiftcall FIUIPregnancyStateProvider.init()(FIUIPregnancyStateProvider *__return_ptr retstr)
{
  id v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  objc_msgSend(v1, sel_init);
}

void FIUIPregnancyStateProvider.init()()
{
}

void sub_21E49BC7C(uint64_t a1, void *a2, void *a3, void *a4)
{
  os_log_type_t v7 = *(void (**)(id, void *, void *))(a1 + 32);
  swift_retain();
  id v10 = a2;
  id v8 = a3;
  id v9 = a4;
  v7(v10, a3, a4);
  swift_release();
}

unint64_t type metadata accessor for FIUIPregnancyStateProvider()
{
  unint64_t result = qword_267D306F0;
  if (!qword_267D306F0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_267D306F0);
  }
  return result;
}

uint64_t sub_21E49BD5C()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_21E49BD94()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_21E49BDCC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = *(void *)(v3 + 16) + 16;
  swift_beginAccess();
  os_log_type_t v7 = (void *)MEMORY[0x223C29B90](v6);
  if (v7)
  {
    id v8 = v7;
    if (a2)
    {
      objc_msgSend(v7, sel_pregnancyModelDidChangeWithModel_, a2);
LABEL_7:

      return;
    }
    os_log_type_t v9 = sub_21E4D0CB0();
    id v10 = (void *)*MEMORY[0x263F098C8];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], v9)) {
      goto LABEL_7;
    }
    id v11 = a3;
    id v12 = a3;
    id v13 = v10;
    uint64_t v14 = swift_slowAlloc();
    unint64_t v15 = (void *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    uint64_t v21 = v16;
    *(_DWORD *)uint64_t v14 = 136315394;
    uint64_t v17 = sub_21E4D10C0();
    sub_21E489B2C(v17, v18, &v21);
    sub_21E4D0D30();
    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2112;
    if (a3)
    {
      id v19 = a3;
      uint64_t v20 = _swift_stdlib_bridgeErrorToNSError();
      sub_21E4D0D30();
    }
    else
    {
      sub_21E4D0D30();
      uint64_t v20 = 0;
    }
    *unint64_t v15 = v20;

    _os_log_impl(&dword_21E433000, v13, v9, "%s Error when trying to get model from pregnancy state query: %@", (uint8_t *)v14, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267D2FCB0);
    swift_arrayDestroy();
    MEMORY[0x223C29AE0](v15, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x223C29AE0](v16, -1, -1);
    MEMORY[0x223C29AE0](v14, -1, -1);
  }
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

void sub_21E49C040()
{
  id v0 = objc_msgSend(self, sel_mainScreen);
  objc_msgSend(v0, sel_scale);
  uint64_t v2 = v1;

  qword_267D30700 = v2;
}

uint64_t *sub_21E49C0A4()
{
  if (qword_267D306F8 != -1) {
    swift_once();
  }
  return &qword_267D30700;
}

double static UIGeometryConstants.screenScale.getter()
{
  return sub_21E49C260(&qword_267D306F8, (uint64_t)&qword_267D30700);
}

double sub_21E49C114()
{
  if (qword_267D306F8 != -1) {
    swift_once();
  }
  double result = 1.0 / *(double *)&qword_267D30700;
  *(double *)&qword_267D30710 = 1.0 / *(double *)&qword_267D30700;
  return result;
}

uint64_t *sub_21E49C170()
{
  if (qword_267D30708 != -1) {
    swift_once();
  }
  return &qword_267D30710;
}

double static UIGeometryConstants.onePixel.getter()
{
  return sub_21E49C260(&qword_267D30708, (uint64_t)&qword_267D30710);
}

void sub_21E49C1E0()
{
  qword_267D30720 = 0x3CB0000000000000;
}

uint64_t *sub_21E49C1F0()
{
  if (qword_267D30718 != -1) {
    swift_once();
  }
  return &qword_267D30720;
}

double static CGFloat.epsilon.getter()
{
  return sub_21E49C260(&qword_267D30718, (uint64_t)&qword_267D30720);
}

double sub_21E49C260(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  return *(double *)a2;
}

double sub_21E49C29C()
{
  if (qword_267D30718 != -1) {
    swift_once();
  }
  return *(double *)&qword_267D30720;
}

BOOL CGFloat.isEqual(to:precision:)(double a1, double a2, double a3)
{
  return vabdd_f64(a3, a1) < a2;
}

double CGFloat.roundToScreenScale()(double a1)
{
  if (qword_267D306F8 != -1) {
    swift_once();
  }
  return round(*(double *)&qword_267D30700 * a1) / *(double *)&qword_267D30700;
}

double CGFloat.floorToScreenScale()(double a1)
{
  if (qword_267D306F8 != -1) {
    swift_once();
  }
  return floor(*(double *)&qword_267D30700 * a1) / *(double *)&qword_267D30700;
}

double CGFloat.ceilToScreenScale()(double a1)
{
  if (qword_267D306F8 != -1) {
    swift_once();
  }
  return ceil(*(double *)&qword_267D30700 * a1) / *(double *)&qword_267D30700;
}

double CGFloat.bracketed(min:max:)(double a1, double a2, double a3)
{
  if (a1 >= a3)
  {
    if ((*(void *)&a1 & 0xFFFFFFFFFFFFFLL) == 0) {
      a3 = a1;
    }
    if ((~*(void *)&a1 & 0x7FF0000000000000) != 0) {
      a3 = a1;
    }
    if (a3 <= a2) {
      return a3;
    }
  }
  else if (a3 <= a2)
  {
    return a3;
  }
  if ((*(void *)&a2 & 0xFFFFFFFFFFFFFLL) != 0) {
    double v4 = a3;
  }
  else {
    double v4 = a2;
  }
  if ((~*(void *)&a2 & 0x7FF0000000000000) != 0) {
    return a2;
  }
  else {
    return v4;
  }
}

CGSize __swiftcall CGSize.applyInsets(_:)(UIEdgeInsets a1)
{
  CGFloat v3 = a1.left + v1 + a1.right;
  double v4 = a1.top + v2 + a1.bottom;
  double v5 = v3;
  result.height = v4;
  result.width = v5;
  return result;
}

double static CGSize.+ infix(_:_:)(double a1, double a2, double a3)
{
  return a1 + a3;
}

double _sSo6CGSizeV9FitnessUIE18roundToScreenScaleAByF_0(double a1)
{
  if (qword_267D306F8 != -1) {
    swift_once();
  }
  return round(*(double *)&qword_267D30700 * a1) / *(double *)&qword_267D30700;
}

double _sSo6CGSizeV9FitnessUIE18floorToScreenScaleAByF_0(double a1)
{
  if (qword_267D306F8 != -1) {
    swift_once();
  }
  return floor(*(double *)&qword_267D30700 * a1) / *(double *)&qword_267D30700;
}

double _sSo6CGSizeV9FitnessUIE17ceilToScreenScaleAByF_0(double a1)
{
  if (qword_267D306F8 != -1) {
    swift_once();
  }
  return ceil(*(double *)&qword_267D30700 * a1) / *(double *)&qword_267D30700;
}

__C::CGRect __swiftcall CGRect.roundToScreenScale()()
{
  double v4 = v3;
  double v5 = v2;
  double v6 = v1;
  double v7 = v0;
  if (qword_267D306F8 != -1) {
    swift_once();
  }
  double v8 = round(*(double *)&qword_267D30700 * v7) / *(double *)&qword_267D30700;
  double v9 = round(*(double *)&qword_267D30700 * v6) / *(double *)&qword_267D30700;
  double v10 = round(*(double *)&qword_267D30700 * v5) / *(double *)&qword_267D30700;
  double v11 = round(*(double *)&qword_267D30700 * v4) / *(double *)&qword_267D30700;
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.double x = v8;
  return result;
}

__C::CGRect __swiftcall CGRect.floorToScreenScale()()
{
  double v4 = v3;
  double v5 = v2;
  double v6 = v1;
  double v7 = v0;
  if (qword_267D306F8 != -1) {
    swift_once();
  }
  double v8 = floor(*(double *)&qword_267D30700 * v7) / *(double *)&qword_267D30700;
  double v9 = floor(*(double *)&qword_267D30700 * v6) / *(double *)&qword_267D30700;
  double v10 = floor(*(double *)&qword_267D30700 * v5) / *(double *)&qword_267D30700;
  double v11 = floor(*(double *)&qword_267D30700 * v4) / *(double *)&qword_267D30700;
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.double x = v8;
  return result;
}

__C::CGRect __swiftcall CGRect.ceilToScreenScale()()
{
  double v4 = v3;
  double v5 = v2;
  double v6 = v1;
  double v7 = v0;
  if (qword_267D306F8 != -1) {
    swift_once();
  }
  double v8 = ceil(*(double *)&qword_267D30700 * v7) / *(double *)&qword_267D30700;
  double v9 = ceil(*(double *)&qword_267D30700 * v6) / *(double *)&qword_267D30700;
  double v10 = ceil(*(double *)&qword_267D30700 * v5) / *(double *)&qword_267D30700;
  double v11 = ceil(*(double *)&qword_267D30700 * v4) / *(double *)&qword_267D30700;
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.double x = v8;
  return result;
}

__C::CGRect __swiftcall CGRect.rtl(inSuperviewBounds:)(__C::CGRect inSuperviewBounds)
{
  CGFloat v5 = v4;
  CGFloat v6 = v3;
  CGFloat v7 = v2;
  CGFloat v8 = v1;
  double Width = CGRectGetWidth((CGRect)inSuperviewBounds);
  v16.origin.double x = v8;
  v16.origin.y = v7;
  v16.size.width = v6;
  v16.size.height = v5;
  double v10 = Width - CGRectGetMaxX(v16);
  v17.origin.double x = v8;
  v17.origin.y = v7;
  v17.size.width = v6;
  v17.size.height = v5;
  CGFloat v11 = CGRectGetWidth(v17);
  v18.origin.double x = v8;
  v18.origin.y = v7;
  v18.size.width = v6;
  v18.size.height = v5;
  double Height = CGRectGetHeight(v18);
  double v13 = v10;
  double v14 = v7;
  double v15 = v11;
  result.size.height = Height;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.double x = v13;
  return result;
}

Swift::Void __swiftcall CGRect.flipRTL(inSuperviewBounds:)(__C::CGRect inSuperviewBounds)
{
  CGFloat v2 = *v1;
  CGFloat v3 = v1[1];
  CGFloat v4 = v1[2];
  CGFloat v5 = v1[3];
  double Width = CGRectGetWidth((CGRect)inSuperviewBounds);
  v7.origin.double x = v2;
  v7.origin.y = v3;
  v7.size.width = v4;
  v7.size.height = v5;
  CGFloat *v1 = Width - CGRectGetMaxX(v7);
}

double CGRect.center.getter(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  double MidX = CGRectGetMidX(*(CGRect *)&a1);
  v10.origin.double x = a1;
  v10.origin.y = a2;
  v10.size.width = a3;
  v10.size.height = a4;
  CGRectGetMidY(v10);
  return MidX;
}

UIEdgeInsets __swiftcall UIEdgeInsets.init(offset:)(UIOffset offset)
{
  double vertical = offset.vertical;
  double horizontal = offset.horizontal;
  double v3 = vertical;
  double v4 = horizontal;
  result.right = v4;
  result.bottom = vertical;
  result.left = horizontal;
  result.top = v3;
  return result;
}

ValueMetadata *type metadata accessor for UIGeometryConstants()
{
  return &type metadata for UIGeometryConstants;
}

id UIScrollView.isPagingEnabled(_:)(char a1)
{
  objc_msgSend(v1, sel_setPagingEnabled_, a1 & 1);
  return v3;
}

id UIScrollView.showsHorizontalScrollIndicator(_:)(char a1)
{
  objc_msgSend(v1, sel_setShowsHorizontalScrollIndicator_, a1 & 1);
  return v3;
}

id UIScrollView.showsVerticalScrollIndicator(_:)(char a1)
{
  objc_msgSend(v1, sel_setShowsVerticalScrollIndicator_, a1 & 1);
  return v3;
}

id UIScrollView.contentInsetAdjustmentBehavior(_:)(uint64_t a1)
{
  objc_msgSend(v1, sel_setContentInsetAdjustmentBehavior_, a1);
  return v3;
}

id UIScrollView.alwaysBounceVertical(_:)(char a1)
{
  objc_msgSend(v1, sel_setAlwaysBounceVertical_, a1 & 1);
  return v3;
}

id ARUIRingsView.withRingGroupDiameter(_:)(float a1)
{
  return sub_21E49CB04((SEL *)&selRef_setGroupDiameter_, a1);
}

id ARUIRingsView.withRingGroupThickness(_:)(float a1)
{
  return sub_21E49CB04((SEL *)&selRef_setThickness_, a1);
}

id ARUIRingsView.withRingGroupInterspacing(_:)(float a1)
{
  return sub_21E49CB04((SEL *)&selRef_setInterspacing_, a1);
}

id sub_21E49CB04(SEL *a1, float a2)
{
  id v5 = objc_msgSend(v2, sel_ringGroup);
  *(float *)&double v6 = a2;
  objc_msgSend(v5, *a1, v6);

  return v8;
}

id ARUIRingsView.emptyRings()()
{
  id v1 = objc_msgSend(v0, sel_ringGroup);
  id v2 = objc_msgSend(v1, sel_rings);

  sub_21E49CCC4();
  unint64_t v3 = sub_21E4D0BD0();

  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_21E4D0F20();
    id result = (id)swift_bridgeObjectRelease_n();
    if (v4 < 0)
    {
      __break(1u);
      return result;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRelease();
  }
  id v5 = v11;
  if (v4)
  {
    uint64_t v6 = 0;
    CGRect v7 = (_DWORD *)MEMORY[0x263F23918];
    do
    {
      id v8 = objc_msgSend(v11, sel_ringGroup);
      LODWORD(v9) = *v7;
      objc_msgSend(v8, sel_setPercentage_ofRingAtIndex_, v6, v9);

      id v5 = v11;
      ++v6;
    }
    while (v4 != v6);
  }
  return v5;
}

unint64_t sub_21E49CCC4()
{
  unint64_t result = qword_267D2FD20;
  if (!qword_267D2FD20)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_267D2FD20);
  }
  return result;
}

id ARUIRingsView.nilRings(animated:)(char a1)
{
  id v3 = objc_msgSend(v1, sel_ringGroup);
  objc_msgSend(v3, sel_hk_configureWithActivitySummary_animated_, 0, a1 & 1);

  return v5;
}

id UIView.autoLayout()()
{
  objc_msgSend(v0, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  return v2;
}

id static UIView.tableViewDivider()()
{
  id v0 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  objc_msgSend(v0, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  id v1 = objc_msgSend(self, sel_separatorColor);
  objc_msgSend(v0, sel_setBackgroundColor_, v1);

  return v0;
}

BOOL static UIView.layoutIsRTL()()
{
  return objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_userInterfaceLayoutDirectionForSemanticContentAttribute_, 0) == (id)1;
}

id UIView.backgroundColor(_:)(uint64_t a1)
{
  objc_msgSend(v1, sel_setBackgroundColor_, a1);
  return v3;
}

id UIView.tintColor(_:)(uint64_t a1)
{
  objc_msgSend(v1, sel_setTintColor_, a1);
  return v3;
}

id UIView.isHidden(_:)(char a1)
{
  objc_msgSend(v1, sel_setHidden_, a1 & 1);
  return v3;
}

id UIView.layerCornerRadius(_:)(double a1)
{
  id v3 = objc_msgSend(v1, sel_layer);
  objc_msgSend(v3, sel_setCornerRadius_, a1);

  objc_msgSend(v5, sel_setClipsToBounds_, 1);
  return v5;
}

id UIView.alpha(_:)()
{
  objc_msgSend(v0, sel_setAlpha_);
  return v2;
}

id UIView.borderColor(_:width:)(void *a1, double a2)
{
  id v5 = objc_msgSend(v2, sel_layer);
  id v6 = objc_msgSend(a1, sel_CGColor);
  objc_msgSend(v5, sel_setBorderColor_, v6);

  id v7 = objc_msgSend(v9, sel_layer);
  objc_msgSend(v7, sel_setBorderWidth_, a2);

  return v9;
}

id UIView.clipsToBounds(_:)(char a1)
{
  objc_msgSend(v1, sel_setClipsToBounds_, a1 & 1);
  return v3;
}

id UIView.cornerCurve(_:)(uint64_t a1)
{
  id v3 = objc_msgSend(v1, sel_layer);
  objc_msgSend(v3, sel_setCornerCurve_, a1);

  return v5;
}

id UIView.isOpaque(_:)(char a1)
{
  objc_msgSend(v1, sel_setOpaque_, a1 & 1);
  return v3;
}

id UIView.userInteractionEnabled(_:)(char a1)
{
  objc_msgSend(v1, sel_setUserInteractionEnabled_, a1 & 1);
  return v3;
}

id UIView.shouldRasterize(_:)(char a1)
{
  id v3 = objc_msgSend(v1, sel_layer);
  objc_msgSend(v3, sel_setShouldRasterize_, a1 & 1);

  return v5;
}

id UIView.contentCompressionResistancePriority(_:forAxis:)(uint64_t a1)
{
  objc_msgSend(v1, sel_setContentCompressionResistancePriority_forAxis_, a1);
  return v3;
}

id UIView.incompressible()(double a1)
{
  return sub_21E49D3A8((SEL *)&selRef_setContentCompressionResistancePriority_forAxis_, a1);
}

id UIView.incompressibleForAxis(_:)(uint64_t a1, double a2)
{
  LODWORD(a2) = 1148846080;
  objc_msgSend(v2, sel_setContentCompressionResistancePriority_forAxis_, a1, a2);
  return v4;
}

id UIView.contentHuggingPriority(_:forAxis:)(uint64_t a1)
{
  objc_msgSend(v1, sel_setContentHuggingPriority_forAxis_, a1);
  return v3;
}

id UIView.tightlyHuggingContent()(double a1)
{
  return sub_21E49D3A8((SEL *)&selRef_setContentHuggingPriority_forAxis_, a1);
}

id sub_21E49D3A8(SEL *a1, double a2)
{
  LODWORD(a2) = 1148846080;
  objc_msgSend(v2, *a1, 0, a2);
  id v4 = v2;
  LODWORD(v5) = 1148846080;
  objc_msgSend(v4, *a1, 1, v5);
  return v4;
}

id UIView.tightlyHuggingContentForAxis(_:)(uint64_t a1, double a2)
{
  LODWORD(a2) = 1148846080;
  objc_msgSend(v2, sel_setContentHuggingPriority_forAxis_, a1, a2);
  return v4;
}

id UIView.withContentMode(_:)(uint64_t a1)
{
  objc_msgSend(v1, sel_setContentMode_, a1);
  return v3;
}

double sub_21E49D4A0()
{
  return *MEMORY[0x263F82250];
}

float sub_21E49D4B4()
{
  return 1000.0;
}

uint64_t UIView.constraintsPinningToEdgesOfView(_:supportingRTL:insets:leadingPriority:trailingPriority:topPriority:bottomPriority:)(void *a1, char a2, double a3, double a4, double a5, double a6)
{
  id v7 = v6;
  double v12 = -a6;
  if (a2)
  {
    id v13 = objc_msgSend(v6, sel_leadingAnchor);
    id v14 = objc_msgSend(a1, sel_leadingAnchor);
    id v15 = objc_msgSend(v13, sel_constraintEqualToAnchor_constant_, v14, a4);

    id v16 = NSLayoutConstraint.priority(_:)();
    id v17 = objc_msgSend(v7, sel_trailingAnchor);
    id v18 = objc_msgSend(a1, sel_trailingAnchor);
  }
  else
  {
    id v19 = objc_msgSend(v6, sel_leftAnchor);
    id v20 = objc_msgSend(a1, sel_leftAnchor);
    id v21 = objc_msgSend(v19, sel_constraintEqualToAnchor_constant_, v20, a4);

    id v16 = NSLayoutConstraint.priority(_:)();
    id v17 = objc_msgSend(v7, sel_rightAnchor);
    id v18 = objc_msgSend(a1, sel_rightAnchor);
  }
  id v22 = v18;
  id v23 = objc_msgSend(v17, sel_constraintEqualToAnchor_constant_, v22, v12);

  id v24 = NSLayoutConstraint.priority(_:)();
  id v25 = objc_msgSend(v7, sel_topAnchor);
  id v26 = objc_msgSend(a1, sel_topAnchor);
  id v27 = objc_msgSend(v25, sel_constraintEqualToAnchor_constant_, v26, a3);

  id v28 = NSLayoutConstraint.priority(_:)();
  id v29 = objc_msgSend(v7, sel_bottomAnchor);
  id v30 = objc_msgSend(a1, sel_bottomAnchor);
  id v31 = objc_msgSend(v29, sel_constraintEqualToAnchor_constant_, v30, -a5);

  id v32 = NSLayoutConstraint.priority(_:)();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AB08758);
  uint64_t v33 = swift_allocObject();
  *(_OWORD *)(v33 + 16) = xmmword_21E4D9950;
  *(void *)(v33 + 32) = v16;
  *(void *)(v33 + 40) = v24;
  *(void *)(v33 + 48) = v28;
  *(void *)(v33 + 56) = v32;
  uint64_t v35 = v33;
  sub_21E4D0BE0();
  return v35;
}

uint64_t UIView.constraintsPinningToLayoutGuide(_:supportingRTL:insets:)(void *a1, char a2, double a3, double a4, double a5, double a6)
{
  double v11 = -a6;
  if (a2)
  {
    id v12 = objc_msgSend(v6, sel_leadingAnchor);
    id v13 = objc_msgSend(a1, sel_leadingAnchor);
    id v14 = objc_msgSend(v12, sel_constraintEqualToAnchor_constant_, v13, a4);

    id v15 = objc_msgSend(v6, sel_trailingAnchor);
    id v16 = objc_msgSend(a1, sel_trailingAnchor);
  }
  else
  {
    id v17 = objc_msgSend(v6, sel_leftAnchor);
    id v18 = objc_msgSend(a1, sel_leftAnchor);
    id v14 = objc_msgSend(v17, sel_constraintEqualToAnchor_constant_, v18, a4);

    id v15 = objc_msgSend(v6, sel_rightAnchor);
    id v16 = objc_msgSend(a1, sel_rightAnchor);
  }
  id v19 = v16;
  id v20 = objc_msgSend(v15, sel_constraintEqualToAnchor_constant_, v19, v11);

  id v21 = objc_msgSend(v6, sel_topAnchor);
  id v22 = objc_msgSend(a1, sel_topAnchor);
  id v23 = objc_msgSend(v21, sel_constraintEqualToAnchor_constant_, v22, a3);

  id v24 = objc_msgSend(v6, sel_bottomAnchor);
  id v25 = objc_msgSend(a1, sel_bottomAnchor);
  id v26 = objc_msgSend(v24, sel_constraintEqualToAnchor_constant_, v25, -a5);

  __swift_instantiateConcreteTypeFromMangledName(&qword_26AB08758);
  uint64_t v27 = swift_allocObject();
  *(_OWORD *)(v27 + 16) = xmmword_21E4D9950;
  *(void *)(v27 + 32) = v14;
  *(void *)(v27 + 40) = v20;
  *(void *)(v27 + 48) = v23;
  *(void *)(v27 + 56) = v26;
  uint64_t v29 = v27;
  sub_21E4D0BE0();
  return v29;
}

uint64_t _sSo6UIViewC9FitnessUIE026constraintsPinningCenterToF6OfViewySaySo18NSLayoutConstraintCGABF_0(void *a1)
{
  id v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AB08758);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_21E4D9960;
  id v5 = objc_msgSend(v2, sel_centerXAnchor);
  id v6 = objc_msgSend(a1, sel_centerXAnchor);
  id v7 = objc_msgSend(v5, sel_constraintEqualToAnchor_, v6);

  *(void *)(v4 + 32) = v7;
  id v8 = objc_msgSend(v2, sel_centerYAnchor);
  id v9 = objc_msgSend(a1, sel_centerYAnchor);
  id v10 = objc_msgSend(v8, sel_constraintEqualToAnchor_, v9);

  *(void *)(v4 + 40) = v10;
  sub_21E4D0BE0();
  return v4;
}

uint64_t sub_21E49DBC4@<X0>(uint64_t *a1@<X8>)
{
  return sub_21E486B7C(&qword_267D2F848, a1);
}

uint64_t sub_21E49DBD8@<X0>(uint64_t *a1@<X8>)
{
  return sub_21E486B7C(&qword_267D2F850, a1);
}

uint64_t sub_21E49DBEC()
{
  return swift_getKeyPath();
}

uint64_t sub_21E49DC10()
{
  sub_21E4D03E0();
  sub_21E4A41B0(&qword_267D2FE18, MEMORY[0x263F1FB28]);
  sub_21E4D0410();
  return v1;
}

uint64_t sub_21E49DC8C@<X0>(unsigned char *a1@<X8>)
{
  sub_21E4D03E0();
  sub_21E4A41B0(&qword_267D2FE18, MEMORY[0x263F1FB28]);
  uint64_t result = sub_21E4D0410();
  *a1 = v3;
  return result;
}

uint64_t sub_21E49DD1C()
{
  type metadata accessor for StandHourChart();
  return swift_bridgeObjectRetain();
}

uint64_t type metadata accessor for StandHourChart()
{
  uint64_t result = qword_267D307D0;
  if (!qword_267D307D0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_21E49DD9C()
{
  return 3600;
}

id sub_21E49DDA8()
{
  uint64_t v0 = sub_21E4CFEE0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  char v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08790]), sel_init);
  sub_21E4CFE90();
  id v5 = (void *)sub_21E4CFE80();
  id v6 = *(void (**)(char *, uint64_t))(v1 + 8);
  v6(v3, v0);
  objc_msgSend(v4, sel_setLocale_, v5);

  id v7 = self;
  id v8 = (void *)sub_21E4D0AB0();
  sub_21E4CFE90();
  id v9 = (void *)sub_21E4CFE80();
  v6(v3, v0);
  id v10 = objc_msgSend(v7, sel_dateFormatFromTemplate_options_locale_, v8, 0, v9);

  objc_msgSend(v4, sel_setDateFormat_, v10);
  return v4;
}

uint64_t sub_21E49DF40@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v55 = a1;
  uint64_t v3 = type metadata accessor for StandHourChart();
  uint64_t v4 = v3 - 8;
  uint64_t v64 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v65 = v5;
  uint64_t v66 = (uint64_t)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F858);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v52 = (char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FD28);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  double v11 = (char *)&v47 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FD30);
  uint64_t v53 = *(void *)(v54 - 8);
  MEMORY[0x270FA5388](v54);
  id v13 = (char *)&v47 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FD38);
  uint64_t v56 = *(void *)(v57 - 8);
  MEMORY[0x270FA5388](v57);
  id v15 = (char *)&v47 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FD40);
  uint64_t v59 = *(void *)(v60 - 8);
  MEMORY[0x270FA5388](v60);
  uint64_t v58 = (char *)&v47 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FD48);
  uint64_t v62 = *(void *)(v63 - 8);
  MEMORY[0x270FA5388](v63);
  uint64_t v61 = (char *)&v47 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FD50);
  sub_21E49EC60();
  sub_21E4D0170();
  uint64_t v67 = v2;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FD60);
  uint64_t v19 = sub_21E48A380(&qword_267D2FD68, &qword_267D2FD28);
  uint64_t v20 = sub_21E48A380(&qword_267D2FD70, &qword_267D2FD60);
  uint64_t v51 = v13;
  sub_21E4D0620();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  uint64_t v22 = *(void *)(v2 + *(int *)(v4 + 40));
  uint64_t v23 = (unsigned __int128)(v22 * (__int128)24) >> 64;
  uint64_t v24 = 24 * v22;
  if (v23 == v24 >> 63)
  {
    if ((v24 & 0x8000000000000000) == 0)
    {
      uint64_t v74 = 0;
      uint64_t v75 = v24;
      uint64_t v25 = sub_21E4D0220();
      uint64_t v26 = *(void *)(v25 - 8);
      uint64_t v50 = v2;
      uint64_t v48 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v26 + 56);
      uint64_t v49 = v26 + 56;
      uint64_t v27 = (uint64_t)v52;
      v48(v52, 1, 1, v25);
      uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FD78);
      uint64_t v70 = v8;
      uint64_t v71 = v18;
      uint64_t v72 = v19;
      uint64_t v73 = v20;
      uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
      uint64_t v30 = sub_21E4A20E4(&qword_267D2FD80, &qword_267D2FD78);
      uint64_t v31 = v54;
      id v32 = v51;
      sub_21E4D0640();
      sub_21E489000(v27, &qword_267D2F858);
      (*(void (**)(char *, uint64_t))(v53 + 8))(v32, v31);
      uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F898);
      uint64_t v70 = v31;
      uint64_t v71 = v28;
      uint64_t v72 = OpaqueTypeConformance2;
      uint64_t v73 = v30;
      uint64_t v34 = swift_getOpaqueTypeConformance2();
      uint64_t v35 = sub_21E48A380(&qword_267D2F8A8, &qword_267D2F898);
      uint64_t v36 = v58;
      uint64_t v37 = v57;
      sub_21E4D0630();
      (*(void (**)(char *, uint64_t))(v56 + 8))(v15, v37);
      long long v69 = *(_OWORD *)sub_21E4837F8();
      v48((char *)v27, 1, 1, v25);
      uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F8B0);
      uint64_t v70 = v37;
      uint64_t v71 = v33;
      uint64_t v72 = v34;
      uint64_t v73 = v35;
      uint64_t v39 = swift_getOpaqueTypeConformance2();
      uint64_t v40 = sub_21E4A20E4((unint64_t *)&qword_267D2F8B8, &qword_267D2F8B0);
      uint64_t v41 = v61;
      uint64_t v42 = v60;
      sub_21E4D0650();
      sub_21E489000(v27, &qword_267D2F858);
      (*(void (**)(char *, uint64_t))(v59 + 8))(v36, v42);
      uint64_t v43 = v66;
      sub_21E4A22B8(v50, v66);
      unint64_t v44 = (*(unsigned __int8 *)(v64 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v64 + 80);
      uint64_t v45 = swift_allocObject();
      sub_21E4A232C(v43, v45 + v44);
      __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FD88);
      uint64_t v70 = v42;
      uint64_t v71 = v38;
      uint64_t v72 = v39;
      uint64_t v73 = v40;
      swift_getOpaqueTypeConformance2();
      sub_21E4A2468();
      uint64_t v46 = v63;
      sub_21E4D0660();
      swift_release();
      return (*(uint64_t (**)(char *, uint64_t))(v62 + 8))(v41, v46);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_21E49E7F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v28 = a2;
  uint64_t v3 = type metadata accessor for StandHourChart();
  uint64_t v24 = *(void *)(v3 - 8);
  uint64_t v4 = *(void *)(v24 + 64);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = sub_21E4D0320();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  double v11 = (char *)&v24 - v10;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FD50);
  uint64_t v26 = *(void *)(v12 - 8);
  uint64_t v27 = v12;
  MEMORY[0x270FA5388](v12);
  uint64_t v25 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21E4A3808(&qword_267D2F850, MEMORY[0x263F18FF8], 0xD000000000000010, 0x800000021E4DE6B0, (uint64_t)v11);
  uint64_t v14 = (void (*)(uint64_t))MEMORY[0x263F18FF8];
  sub_21E4A41B0(&qword_267D2F920, MEMORY[0x263F18FF8]);
  sub_21E4D0D90();
  sub_21E4A41B0(&qword_267D2F928, v14);
  char v15 = sub_21E4D0AA0();
  uint64_t v16 = *(void (**)(char *, uint64_t))(v6 + 8);
  v16(v9, v5);
  v16(v11, v5);
  if (v15) {
    uint64_t v17 = swift_bridgeObjectRetain();
  }
  else {
    uint64_t v17 = MEMORY[0x263F8EE78];
  }
  uint64_t v33 = v17;
  sub_21E4A22B8(a1, (uint64_t)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v18 = (*(unsigned __int8 *)(v24 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80);
  uint64_t v19 = swift_allocObject();
  sub_21E4A232C((uint64_t)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v19 + v18);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F8F8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F888);
  sub_21E48A380(&qword_267D2F908, &qword_267D2F8F8);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D2F890);
  uint64_t v29 = sub_21E4D01F0();
  uint64_t v30 = MEMORY[0x263F18AF0];
  uint64_t v31 = MEMORY[0x263EFCD60];
  uint64_t v32 = MEMORY[0x263F18AE0];
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v29 = v20;
  uint64_t v30 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  sub_21E48A3C4();
  uint64_t v22 = v25;
  sub_21E4D0810();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v26 + 32))(v28, v22, v27);
}

uint64_t sub_21E49EC58@<X0>(uint64_t a1@<X8>)
{
  return sub_21E49E7F4(*(void *)(v1 + 16), a1);
}

unint64_t sub_21E49EC60()
{
  unint64_t result = qword_267D2FD58;
  if (!qword_267D2FD58)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D2FD50);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D2F890);
    sub_21E4D01F0();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2FD58);
  }
  return result;
}

uint64_t sub_21E49ED4C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v26 = a2;
  uint64_t v31 = a3;
  uint64_t v29 = sub_21E4D04A0();
  uint64_t v27 = *(void *)(v29 - 8);
  MEMORY[0x270FA5388](v29);
  uint64_t v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F918);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  MEMORY[0x270FA5388](v8);
  uint64_t v24 = sub_21E4D01F0();
  uint64_t v25 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388](v24);
  uint64_t v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F890);
  uint64_t v30 = *(void *)(v28 - 8);
  MEMORY[0x270FA5388](v28);
  uint64_t v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *a1;
  uint64_t v14 = a1[1];
  int v23 = *((unsigned __int8 *)a1 + 16);
  int v22 = *((unsigned __int8 *)a1 + 17);
  sub_21E4D0470();
  *(void *)&v38[0] = v13;
  sub_21E4D00E0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21E4D0470();
  *(void *)&v38[0] = v14;
  sub_21E4D00E0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21E4D0470();
  *(void *)&v38[0] = v14;
  sub_21E4D00E0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21E4D01E0();
  sub_21E4A3808(&qword_267D2F848, MEMORY[0x263F19988], 0xD000000000000013, 0x800000021E4DE690, (uint64_t)v5);
  if (v22) {
    __int16 v15 = 256;
  }
  else {
    __int16 v15 = 0;
  }
  sub_21E4AEFB8(v15 | v23, (uint64_t)v36);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v5, v29);
  v38[0] = v36[0];
  v38[1] = v36[1];
  uint64_t v39 = v37;
  uint64_t v16 = MEMORY[0x263F18AF0];
  uint64_t v17 = MEMORY[0x263EFCD60];
  uint64_t v18 = MEMORY[0x263F18AE0];
  uint64_t v19 = v24;
  sub_21E4D0080();
  sub_21E488948((uint64_t)v36);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v10, v19);
  sub_21E496B70(10.8);
  sub_21E4D0290();
  uint64_t v32 = v19;
  uint64_t v33 = v16;
  uint64_t v34 = v17;
  uint64_t v35 = v18;
  swift_getOpaqueTypeConformance2();
  uint64_t v20 = v28;
  sub_21E4D00A0();
  sub_21E48A45C((uint64_t)v38);
  return (*(uint64_t (**)(char *, uint64_t))(v30 + 8))(v12, v20);
}

uint64_t sub_21E49F270(uint64_t a1)
{
  uint64_t v2 = sub_21E4D00C0();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v3 = type metadata accessor for StandHourChart();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v6 = sub_21E4D0110();
  MEMORY[0x270FA5388](v6 - 8);
  sub_21E4D00F0();
  uint64_t v7 = sub_21E4A3B1C(0, 24);
  uint64_t v12 = a1;
  sub_21E4A2514((void (*)(uint64_t *__return_ptr, uint64_t *))sub_21E4A3BF0, (uint64_t)v11, v7);
  swift_release();
  sub_21E4A22B8(a1, (uint64_t)&v11[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)]);
  unint64_t v8 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v9 = swift_allocObject();
  sub_21E4A232C((uint64_t)&v11[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)], v9 + v8);
  sub_21E4D00B0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FDA0);
  sub_21E4A3CD4();
  return sub_21E4D0200();
}

uint64_t sub_21E49F4A8()
{
  return sub_21E49F270(*(void *)(v0 + 16));
}

uint64_t sub_21E49F4B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v105 = a2;
  uint64_t v99 = a1;
  uint64_t v109 = a3;
  uint64_t v84 = sub_21E4D04A0();
  uint64_t v83 = *(void *)(v84 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v84);
  uint64_t v82 = (char *)&v81 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v81 = (uint64_t)&v81 - v5;
  uint64_t v6 = sub_21E4D0140();
  MEMORY[0x270FA5388](v6 - 8);
  char v91 = (char *)&v81 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_21E4D0160();
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v90 = (char *)&v81 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v111 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FDD8);
  uint64_t v93 = *(void *)(v111 - 8);
  MEMORY[0x270FA5388](v111);
  v92 = (char *)&v81 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v97 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FDD0);
  uint64_t v96 = *(void *)(v97 - 8);
  MEMORY[0x270FA5388](v97);
  unint64_t v110 = (char *)&v81 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v107 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FDE8);
  uint64_t v106 = *(void *)(v107 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v107);
  uint64_t v95 = (char *)&v81 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v94 = (char *)&v81 - v14;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FDC8);
  uint64_t v16 = MEMORY[0x270FA5388](v15 - 8);
  uint64_t v108 = (uint64_t)&v81 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v104 = (char *)&v81 - v18;
  uint64_t v19 = sub_21E4D01B0();
  MEMORY[0x270FA5388](v19 - 8);
  uint64_t v87 = (char *)&v81 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v89 = sub_21E4D01D0();
  uint64_t v88 = *(void *)(v89 - 8);
  MEMORY[0x270FA5388](v89);
  char v86 = (char *)&v81 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v98 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FDF0);
  uint64_t v22 = *(void *)(v98 - 8);
  MEMORY[0x270FA5388](v98);
  uint64_t v85 = (char *)&v81 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FDB8);
  uint64_t v25 = MEMORY[0x270FA5388](v24 - 8);
  uint64_t v103 = (uint64_t)&v81 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v25);
  uint64_t v112 = (uint64_t)&v81 - v27;
  uint64_t v28 = sub_21E4D0070();
  uint64_t v29 = *(void *)(v28 - 8);
  MEMORY[0x270FA5388](v28);
  uint64_t v31 = (char *)&v81 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F8E0);
  uint64_t v33 = *(void *)(v32 - 8);
  uint64_t v34 = MEMORY[0x270FA5388](v32);
  uint64_t v36 = (char *)&v81 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v34);
  uint64_t v38 = (char *)&v81 - v37;
  sub_21E48374C();
  sub_21E4D0290();
  long long v126 = v117;
  long long v127 = v118;
  uint64_t v128 = v119;
  sub_21E4D0060();
  uint64_t v39 = sub_21E483680();
  *(void *)&long long v123 = *v39;
  sub_21E4D0180();
  (*(void (**)(char *, uint64_t))(v29 + 8))(v31, v28);
  uint64_t v100 = v33;
  uint64_t v40 = *(void (**)(char *, char *, uint64_t))(v33 + 32);
  uint64_t v101 = v38;
  uint64_t v41 = v38;
  uint64_t v42 = v36;
  uint64_t v102 = v32;
  v40(v41, v36, v32);
  if (__ROR8__(0xAAAAAAAAAAAAAAABLL * sub_21E4D0210() + 0x2AAAAAAAAAAAAAAALL, 1) <= 0x2AAAAAAAAAAAAAAAuLL)
  {
    sub_21E4D01A0();
    sub_21E4D0290();
    long long v123 = v120;
    long long v124 = v121;
    uint64_t v125 = v122;
    uint64_t v46 = v86;
    sub_21E4D01C0();
    uint64_t v114 = *v39;
    uint64_t v47 = v85;
    uint64_t v48 = v89;
    sub_21E4D0180();
    (*(void (**)(char *, uint64_t))(v88 + 8))(v46, v48);
    uint64_t v44 = v112;
    uint64_t v49 = v98;
    (*(void (**)(uint64_t, char *, uint64_t))(v22 + 32))(v112, v47, v98);
    uint64_t v43 = 0;
    uint64_t v45 = v49;
  }
  else
  {
    uint64_t v43 = 1;
    uint64_t v44 = v112;
    uint64_t v45 = v98;
  }
  uint64_t v50 = 1;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v22 + 56))(v44, v43, 1, v45);
  uint64_t v51 = (void (*)(char *, char *, uint64_t))sub_21E4D0210();
  uint64_t v52 = sub_21E4A0244(v51);
  uint64_t v54 = (uint64_t)v104;
  if (v53)
  {
    uint64_t v114 = v52;
    uint64_t v115 = v53;
    sub_21E4D0150();
    sub_21E4D0130();
    sub_21E48BAE8();
    uint64_t v55 = v92;
    sub_21E4D00D0();
    sub_21E4D0590();
    uint64_t v56 = sub_21E48A380(&qword_267D2FDE0, &qword_267D2FDD8);
    uint64_t v57 = v111;
    sub_21E4D0190();
    swift_release();
    (*(void (**)(char *, uint64_t))(v93 + 8))(v55, v57);
    if (sub_21E4D0210() != 24)
    {
      uint64_t v58 = v81;
      sub_21E4A3808(&qword_267D2F848, MEMORY[0x263F19988], 0xD000000000000013, 0x800000021E4DE690, v81);
      uint64_t v59 = v83;
      uint64_t v60 = v82;
      uint64_t v61 = v84;
      (*(void (**)(char *, void, uint64_t))(v83 + 104))(v82, *MEMORY[0x263F19978], v84);
      sub_21E4D0490();
      uint64_t v62 = *(void (**)(char *, uint64_t))(v59 + 8);
      v62(v60, v61);
      v62((char *)v58, v61);
    }
    sub_21E4D0720();
    uint64_t v63 = sub_21E4D0730();
    swift_release();
    uint64_t v113 = v63;
    uint64_t v114 = v111;
    uint64_t v115 = v56;
    swift_getOpaqueTypeConformance2();
    uint64_t v64 = v95;
    uint64_t v65 = v97;
    uint64_t v66 = v110;
    sub_21E4D0180();
    swift_release();
    (*(void (**)(char *, uint64_t))(v96 + 8))(v66, v65);
    uint64_t v67 = v106;
    uint64_t v68 = *(void (**)(char *, char *, uint64_t))(v106 + 32);
    long long v69 = v94;
    uint64_t v70 = v107;
    v68(v94, v64, v107);
    v68((char *)v54, v69, v70);
    uint64_t v50 = 0;
  }
  else
  {
    uint64_t v70 = v107;
    uint64_t v67 = v106;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v67 + 56))(v54, v50, 1, v70);
  uint64_t v71 = v100;
  uint64_t v72 = v42;
  uint64_t v73 = v42;
  uint64_t v74 = v101;
  uint64_t v75 = v102;
  (*(void (**)(char *, char *, uint64_t))(v100 + 16))(v73, v101, v102);
  uint64_t v114 = (uint64_t)v72;
  uint64_t v76 = v112;
  uint64_t v77 = v103;
  sub_21E48A534(v112, v103, &qword_267D2FDB8);
  uint64_t v115 = v77;
  uint64_t v78 = v108;
  sub_21E48A534(v54, v108, &qword_267D2FDC8);
  uint64_t v116 = v78;
  sub_21E4A1DF0(&v114, v109);
  sub_21E489000(v54, &qword_267D2FDC8);
  sub_21E489000(v76, &qword_267D2FDB8);
  uint64_t v79 = *(void (**)(char *, uint64_t))(v71 + 8);
  v79(v74, v75);
  sub_21E489000(v78, &qword_267D2FDC8);
  sub_21E489000(v77, &qword_267D2FDB8);
  return ((uint64_t (*)(char *, uint64_t))v79)(v72, v75);
}

uint64_t sub_21E4A0244(void (*a1)(char *, char *, uint64_t))
{
  uint64_t v209 = a1;
  uint64_t v2 = sub_21E4CFEC0();
  uint64_t v201 = *(void *)(v2 - 8);
  uint64_t v202 = v2;
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  v183 = (char *)&v173 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v182 = (char *)&v173 - v6;
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  v186 = (char *)&v173 - v8;
  MEMORY[0x270FA5388](v7);
  uint64_t v195 = (char *)&v173 - v9;
  uint64_t v10 = sub_21E4CFEE0();
  uint64_t v199 = *(void *)(v10 - 8);
  uint64_t v200 = v10;
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  uint64_t v179 = (char *)&v173 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v178 = (char *)&v173 - v14;
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v184 = (char *)&v173 - v16;
  MEMORY[0x270FA5388](v15);
  v193 = (char *)&v173 - v17;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FE00);
  uint64_t v19 = MEMORY[0x270FA5388](v18 - 8);
  uint64_t v181 = (char *)&v173 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v180 = (char *)&v173 - v22;
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  uint64_t v185 = (char *)&v173 - v24;
  MEMORY[0x270FA5388](v23);
  v194 = (char *)&v173 - v25;
  uint64_t v204 = sub_21E4CFE10();
  uint64_t v208 = *(void *)(v204 - 8);
  uint64_t v26 = MEMORY[0x270FA5388](v204);
  uint64_t v188 = (char *)&v173 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  uint64_t v187 = (char *)&v173 - v29;
  uint64_t v30 = MEMORY[0x270FA5388](v28);
  v192 = (char *)&v173 - v31;
  MEMORY[0x270FA5388](v30);
  uint64_t v205 = (char *)&v173 - v32;
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F750);
  uint64_t v34 = MEMORY[0x270FA5388](v33 - 8);
  v190 = (char *)&v173 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = MEMORY[0x270FA5388](v34);
  uint64_t v189 = (char *)&v173 - v37;
  uint64_t v38 = MEMORY[0x270FA5388](v36);
  v191 = (char *)&v173 - v39;
  uint64_t v40 = MEMORY[0x270FA5388](v38);
  uint64_t v211 = (uint64_t)&v173 - v41;
  MEMORY[0x270FA5388](v40);
  uint64_t v212 = (uint64_t)&v173 - v42;
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FE08);
  MEMORY[0x270FA5388](v43 - 8);
  v207 = (char *)&v173 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FE10);
  MEMORY[0x270FA5388](v45 - 8);
  uint64_t v47 = (char *)&v173 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v206 = sub_21E4CFCB0();
  uint64_t v203 = *(void *)(v206 - 8);
  uint64_t v48 = MEMORY[0x270FA5388](v206);
  v196 = (char *)&v173 - ((v49 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v48);
  uint64_t v51 = (char *)&v173 - v50;
  uint64_t v213 = sub_21E4CFF80();
  uint64_t v210 = *(void *)(v213 - 8);
  MEMORY[0x270FA5388](v213);
  uint64_t v53 = (char *)&v173 - ((v52 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = sub_21E4D0320();
  uint64_t v55 = *(void *)(v54 - 8);
  uint64_t v56 = MEMORY[0x270FA5388](v54);
  uint64_t v58 = (char *)&v173 - ((v57 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v56);
  uint64_t v60 = (char *)&v173 - v59;
  uint64_t v197 = type metadata accessor for StandHourChart();
  uint64_t v198 = v1;
  sub_21E4A3808(&qword_267D2F850, MEMORY[0x263F18FF8], 0xD000000000000010, 0x800000021E4DE6B0, (uint64_t)v60);
  uint64_t v61 = (void (*)(uint64_t))MEMORY[0x263F18FF8];
  sub_21E4A41B0(&qword_267D2F920, MEMORY[0x263F18FF8]);
  sub_21E4D0D90();
  sub_21E4A41B0(&qword_267D2F928, v61);
  char v62 = sub_21E4D0AA0();
  uint64_t v63 = *(void (**)(char *, uint64_t))(v55 + 8);
  v63(v58, v54);
  v63(v60, v54);
  if (v62)
  {
    sub_21E4CFF60();
    uint64_t v64 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v210 + 56);
    v64(v47, 1, 1, v213);
    uint64_t v65 = sub_21E4CFF90();
    uint64_t v66 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v65 - 8) + 56);
    v66(v207, 1, 1, v65);
    uint64_t v177 = v47;
    sub_21E4CFCA0();
    uint64_t v67 = v212;
    sub_21E4CFF20();
    uint64_t v68 = v211;
    sub_21E48A534(v67, v211, &qword_267D2F750);
    uint64_t v69 = v208;
    uint64_t v70 = v68;
    uint64_t v71 = v204;
    uint64_t v176 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v208 + 48);
    if (v176(v70, 1, v204) == 1)
    {
      sub_21E489000(v212, &qword_267D2F750);
      (*(void (**)(char *, uint64_t))(v203 + 8))(v51, v206);
      (*(void (**)(char *, uint64_t))(v210 + 8))(v53, v213);
      uint64_t v72 = v211;
LABEL_18:
      sub_21E489000(v72, &qword_267D2F750);
      return 0;
    }
    uint64_t v174 = v51;
    uint64_t v175 = v53;
    uint64_t v75 = *(void (**)(char *, uint64_t, uint64_t))(v69 + 32);
    v75(v205, v211, v71);
    switch((unint64_t)v209)
    {
      case 0uLL:
      case 0x18uLL:
        uint64_t v76 = *(void **)(v198 + *(int *)(v197 + 36));
        uint64_t v77 = v205;
        uint64_t v78 = (void *)sub_21E4CFDE0();
        id v79 = objc_msgSend(v76, sel_stringFromDate_, v78);

        uint64_t v80 = sub_21E4D0AF0();
        uint64_t v82 = v81;

        uint64_t v83 = v193;
        sub_21E4CFEA0();
        uint64_t v84 = v195;
        sub_21E4CFED0();
        (*(void (**)(char *, uint64_t))(v199 + 8))(v83, v200);
        uint64_t v85 = (uint64_t)v194;
        sub_21E4CFEB0();
        (*(void (**)(char *, uint64_t))(v201 + 8))(v84, v202);
        uint64_t v86 = sub_21E4CFE70();
        uint64_t v87 = *(void *)(v86 - 8);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v87 + 48))(v85, 1, v86) == 1)
        {
          sub_21E489000(v85, &qword_267D2FE00);
          uint64_t v88 = v210;
          uint64_t v89 = v175;
          uint64_t v90 = v203;
          uint64_t v91 = v212;
          goto LABEL_30;
        }
        uint64_t v126 = sub_21E4CFE60();
        uint64_t v128 = v127;
        (*(void (**)(uint64_t, uint64_t))(v87 + 8))(v85, v86);
        if (v126 == 26984 && v128 == 0xE200000000000000)
        {
          swift_bridgeObjectRelease();
          uint64_t v88 = v210;
          uint64_t v89 = v175;
          uint64_t v90 = v203;
          uint64_t v91 = v212;
        }
        else
        {
          char v156 = sub_21E4D0FB0();
          swift_bridgeObjectRelease();
          uint64_t v88 = v210;
          uint64_t v89 = v175;
          uint64_t v90 = v203;
          uint64_t v91 = v212;
          if ((v156 & 1) == 0)
          {
LABEL_30:
            uint64_t v74 = v80;
LABEL_31:
            (*(void (**)(char *, uint64_t))(v208 + 8))(v77, v71);
            sub_21E489000(v91, &qword_267D2F750);
            (*(void (**)(char *, uint64_t))(v90 + 8))(v174, v206);
            (*(void (**)(char *, uint64_t))(v88 + 8))(v89, v213);
            return v74;
          }
        }
        uint64_t v218 = v80;
        uint64_t v219 = v82;
        uint64_t v216 = 32;
        unint64_t v217 = 0xE100000000000000;
        uint64_t v214 = 0;
        unint64_t v215 = 0xE000000000000000;
        sub_21E48BAE8();
        uint64_t v74 = sub_21E4D0D60();
        swift_bridgeObjectRelease();
        goto LABEL_31;
      case 6uLL:
        uint64_t v209 = (void (*)(char *, char *, uint64_t))v75;
        uint64_t v211 = v69 + 32;
        uint64_t v92 = v71;
        uint64_t v93 = v213;
        v64(v177, 1, 1, v213);
        v66(v207, 1, 1, v65);
        uint64_t v94 = v196;
        sub_21E4CFCA0();
        uint64_t v95 = v191;
        uint64_t v96 = v205;
        uint64_t v97 = v175;
        sub_21E4CFF30();
        uint64_t v98 = *(void (**)(char *, uint64_t))(v203 + 8);
        uint64_t v99 = v94;
        uint64_t v100 = v206;
        v98(v99, v206);
        if (v176((uint64_t)v95, 1, v92) == 1)
        {
          (*(void (**)(char *, uint64_t))(v208 + 8))(v96, v92);
          sub_21E489000(v212, &qword_267D2F750);
          v98(v174, v100);
          goto LABEL_17;
        }
        v209(v192, v95, v92);
        unint64_t v129 = *(void **)(v198 + *(int *)(v197 + 36));
        uint64_t v130 = (void *)sub_21E4CFDE0();
        id v131 = objc_msgSend(v129, sel_stringFromDate_, v130);

        uint64_t v211 = sub_21E4D0AF0();
        uint64_t v133 = v132;

        id v134 = v184;
        sub_21E4CFEA0();
        uint64_t v135 = v186;
        sub_21E4CFED0();
        (*(void (**)(char *, uint64_t))(v199 + 8))(v134, v200);
        long long v136 = v185;
        sub_21E4CFEB0();
        uint64_t v137 = (uint64_t)v136;
        (*(void (**)(char *, uint64_t))(v201 + 8))(v135, v202);
        uint64_t v138 = sub_21E4CFE70();
        uint64_t v139 = *(void *)(v138 - 8);
        int v140 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v139 + 48))(v137, 1, v138);
        uint64_t v141 = v212;
        if (v140 == 1)
        {
          sub_21E489000(v137, &qword_267D2FE00);
          uint64_t v142 = v210;
          v143 = v175;
          v144 = v174;
          goto LABEL_48;
        }
        uint64_t v160 = sub_21E4CFE60();
        uint64_t v162 = v161;
        (*(void (**)(uint64_t, uint64_t))(v139 + 8))(v137, v138);
        if (v160 == 26984 && v162 == 0xE200000000000000)
        {
          swift_bridgeObjectRelease();
          uint64_t v142 = v210;
          v143 = v175;
          v144 = v174;
        }
        else
        {
          char v169 = sub_21E4D0FB0();
          swift_bridgeObjectRelease();
          uint64_t v142 = v210;
          v143 = v175;
          v144 = v174;
          if ((v169 & 1) == 0) {
            goto LABEL_47;
          }
        }
        uint64_t v218 = v211;
        uint64_t v219 = v133;
        uint64_t v216 = 32;
        unint64_t v217 = 0xE100000000000000;
        uint64_t v214 = 0;
        unint64_t v215 = 0xE000000000000000;
        sub_21E48BAE8();
        uint64_t v211 = sub_21E4D0D60();
        swift_bridgeObjectRelease();
LABEL_47:
        uint64_t v141 = v212;
LABEL_48:
        uint64_t v170 = *(void (**)(char *, uint64_t))(v208 + 8);
        v170(v192, v92);
        v170(v205, v92);
        sub_21E489000(v141, &qword_267D2F750);
        v98(v144, v206);
        (*(void (**)(char *, uint64_t))(v142 + 8))(v143, v213);
        return v211;
      case 0xCuLL:
        uint64_t v209 = (void (*)(char *, char *, uint64_t))v75;
        uint64_t v211 = v69 + 32;
        uint64_t v101 = v71;
        uint64_t v93 = v213;
        v64(v177, 1, 1, v213);
        v66(v207, 1, 1, v65);
        uint64_t v102 = v196;
        sub_21E4CFCA0();
        uint64_t v95 = v189;
        uint64_t v103 = v205;
        uint64_t v97 = v175;
        sub_21E4CFF30();
        uint64_t v104 = *(void (**)(char *, uint64_t))(v203 + 8);
        uint64_t v105 = v102;
        uint64_t v106 = v206;
        v104(v105, v206);
        if (v176((uint64_t)v95, 1, v101) == 1) {
          goto LABEL_16;
        }
        v209(v187, v95, v101);
        uint64_t v107 = *(void **)(v198 + *(int *)(v197 + 36));
        uint64_t v108 = (void *)sub_21E4CFDE0();
        id v109 = objc_msgSend(v107, sel_stringFromDate_, v108);

        uint64_t v211 = sub_21E4D0AF0();
        uint64_t v111 = v110;

        uint64_t v112 = v178;
        sub_21E4CFEA0();
        uint64_t v113 = v182;
        sub_21E4CFED0();
        (*(void (**)(char *, uint64_t))(v199 + 8))(v112, v200);
        uint64_t v114 = (uint64_t)v180;
        sub_21E4CFEB0();
        (*(void (**)(char *, uint64_t))(v201 + 8))(v113, v202);
        uint64_t v115 = sub_21E4CFE70();
        uint64_t v116 = *(void *)(v115 - 8);
        int v117 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v116 + 48))(v114, 1, v115);
        v207 = (char *)v104;
        if (v117 == 1)
        {
          sub_21E489000(v114, &qword_267D2FE00);
          uint64_t v118 = v210;
          uint64_t v120 = v212;
          uint64_t v119 = v213;
          long long v121 = v175;
          uint64_t v122 = v174;
          goto LABEL_44;
        }
        uint64_t v157 = sub_21E4CFE60();
        uint64_t v159 = v158;
        (*(void (**)(uint64_t, uint64_t))(v116 + 8))(v114, v115);
        if (v157 == 26984 && v159 == 0xE200000000000000)
        {
          swift_bridgeObjectRelease();
          uint64_t v118 = v210;
          long long v121 = v175;
          uint64_t v120 = v212;
          uint64_t v122 = v174;
        }
        else
        {
          char v166 = sub_21E4D0FB0();
          swift_bridgeObjectRelease();
          uint64_t v118 = v210;
          long long v121 = v175;
          uint64_t v120 = v212;
          uint64_t v122 = v174;
          if ((v166 & 1) == 0) {
            goto LABEL_43;
          }
        }
        uint64_t v218 = v211;
        uint64_t v219 = v111;
        uint64_t v216 = 32;
        unint64_t v217 = 0xE100000000000000;
        uint64_t v214 = 0;
        unint64_t v215 = 0xE000000000000000;
        sub_21E48BAE8();
        uint64_t v211 = sub_21E4D0D60();
        swift_bridgeObjectRelease();
LABEL_43:
        uint64_t v119 = v213;
LABEL_44:
        uint64_t v167 = *(void (**)(char *, uint64_t))(v208 + 8);
        uint64_t v168 = &v219;
        goto LABEL_53;
      case 0x12uLL:
        uint64_t v209 = (void (*)(char *, char *, uint64_t))v75;
        uint64_t v211 = v69 + 32;
        uint64_t v101 = v71;
        uint64_t v93 = v213;
        v64(v177, 1, 1, v213);
        v66(v207, 1, 1, v65);
        long long v123 = v196;
        sub_21E4CFCA0();
        uint64_t v95 = v190;
        uint64_t v103 = v205;
        uint64_t v97 = v175;
        sub_21E4CFF30();
        uint64_t v104 = *(void (**)(char *, uint64_t))(v203 + 8);
        long long v124 = v123;
        uint64_t v106 = v206;
        v104(v124, v206);
        if (v176((uint64_t)v95, 1, v101) == 1)
        {
LABEL_16:
          (*(void (**)(char *, uint64_t))(v208 + 8))(v103, v101);
          sub_21E489000(v212, &qword_267D2F750);
          v104(v174, v106);
LABEL_17:
          (*(void (**)(char *, uint64_t))(v210 + 8))(v97, v93);
          uint64_t v72 = (uint64_t)v95;
          goto LABEL_18;
        }
        v209(v188, v95, v101);
        uint64_t v145 = *(void **)(v198 + *(int *)(v197 + 36));
        uint64_t v146 = (void *)sub_21E4CFDE0();
        id v147 = objc_msgSend(v145, sel_stringFromDate_, v146);

        uint64_t v211 = sub_21E4D0AF0();
        uint64_t v149 = v148;

        uint64_t v150 = v179;
        sub_21E4CFEA0();
        uint64_t v151 = v183;
        sub_21E4CFED0();
        (*(void (**)(char *, uint64_t))(v199 + 8))(v150, v200);
        uint64_t v152 = (uint64_t)v181;
        sub_21E4CFEB0();
        (*(void (**)(char *, uint64_t))(v201 + 8))(v151, v202);
        uint64_t v153 = sub_21E4CFE70();
        uint64_t v154 = *(void *)(v153 - 8);
        int v155 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v154 + 48))(v152, 1, v153);
        v207 = (char *)v104;
        if (v155 == 1)
        {
          sub_21E489000(v152, &qword_267D2FE00);
          uint64_t v118 = v210;
          uint64_t v120 = v212;
          uint64_t v119 = v213;
          long long v121 = v175;
          uint64_t v122 = v174;
          goto LABEL_52;
        }
        uint64_t v163 = sub_21E4CFE60();
        uint64_t v165 = v164;
        (*(void (**)(uint64_t, uint64_t))(v154 + 8))(v152, v153);
        if (v163 == 26984 && v165 == 0xE200000000000000)
        {
          swift_bridgeObjectRelease();
          long long v121 = v175;
          uint64_t v120 = v212;
          uint64_t v122 = v174;
        }
        else
        {
          char v171 = sub_21E4D0FB0();
          swift_bridgeObjectRelease();
          long long v121 = v175;
          uint64_t v120 = v212;
          uint64_t v122 = v174;
          if ((v171 & 1) == 0) {
            goto LABEL_51;
          }
        }
        uint64_t v218 = v211;
        uint64_t v219 = v149;
        uint64_t v216 = 32;
        unint64_t v217 = 0xE100000000000000;
        uint64_t v214 = 0;
        unint64_t v215 = 0xE000000000000000;
        sub_21E48BAE8();
        uint64_t v211 = sub_21E4D0D60();
        swift_bridgeObjectRelease();
LABEL_51:
        uint64_t v118 = v210;
        uint64_t v119 = v213;
LABEL_52:
        uint64_t v167 = *(void (**)(char *, uint64_t))(v208 + 8);
        uint64_t v168 = (uint64_t *)&v220;
LABEL_53:
        uint64_t v172 = v204;
        v167((char *)*(v168 - 32), v204);
        v167(v205, v172);
        sub_21E489000(v120, &qword_267D2F750);
        ((void (*)(char *, uint64_t))v207)(v122, v206);
        (*(void (**)(char *, uint64_t))(v118 + 8))(v121, v119);
        return v211;
      default:
        (*(void (**)(char *, uint64_t))(v69 + 8))(v205, v71);
        sub_21E489000(v212, &qword_267D2F750);
        (*(void (**)(char *, uint64_t))(v203 + 8))(v174, v206);
        (*(void (**)(char *, uint64_t))(v210 + 8))(v175, v213);
        return 0;
    }
  }
  if ((sub_21E4A2624((uint64_t)v209, (uint64_t)&unk_26CF5E6A8) & 1) == 0) {
    return 0;
  }
  id v73 = sub_21E4B69E4();
  uint64_t v74 = sub_21E4B6A0C(v73, 0, 0);

  return v74;
}

uint64_t sub_21E4A1DF0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FDF8);
  uint64_t v5 = v4 - 8;
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F8E0);
  sub_21E4D0070();
  uint64_t v9 = *(void *)(v8 - 8);
  (*(void (**)(char *, void, uint64_t))(v9 + 16))(v7, *a1, v8);
  sub_21E4A3DA4();
  uint64_t v10 = (uint64_t)&v7[*(int *)(v5 + 56)];
  sub_21E48A534(a1[1], v10, &qword_267D2FDB8);
  sub_21E4A3E5C();
  uint64_t v11 = (uint64_t)&v7[*(int *)(v5 + 72)];
  sub_21E48A534(a1[2], v11, &qword_267D2FDC8);
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(a2, v7, v8);
  sub_21E48BE28(v10, a2 + *(int *)(v5 + 56), &qword_267D2FDB8);
  return sub_21E48BE28(v11, a2 + *(int *)(v5 + 72), &qword_267D2FDC8);
}

uint64_t sub_21E4A1F74()
{
  uint64_t v0 = sub_21E4D0110();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_21E4D00C0();
  MEMORY[0x270FA5388](v1 - 8);
  sub_21E4D00B0();
  sub_21E4D0100();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F8E0);
  sub_21E4D0070();
  swift_getOpaqueTypeConformance2();
  return sub_21E4D0200();
}

uint64_t sub_21E4A20E4(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_21E4A2148()
{
  uint64_t v0 = sub_21E4D0070();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21E48374C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F8E8);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_21E4D9230;
  *(void *)(v4 + 32) = 0;
  sub_21E4D0290();
  long long v10 = v7;
  long long v11 = v8;
  uint64_t v12 = v9;
  sub_21E4D0060();
  v6[1] = *sub_21E483680();
  sub_21E4D0180();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_21E4A22B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for StandHourChart();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21E4A2320(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_release();
  }
  return result;
}

uint64_t sub_21E4A232C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for StandHourChart();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

double sub_21E4A2390@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  type metadata accessor for StandHourChart();
  sub_21E496B70(10.8);
  sub_21E4D0830();
  sub_21E4D02A0();
  uint64_t v4 = sub_21E4D0120();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  uint64_t v5 = (_OWORD *)(a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267D2FD88) + 36));
  _OWORD *v5 = v7;
  v5[1] = v8;
  double result = *(double *)&v9;
  void v5[2] = v9;
  return result;
}

unint64_t sub_21E4A2468()
{
  unint64_t result = qword_267D2FD90;
  if (!qword_267D2FD90)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D2FD88);
    sub_21E4A41B0(&qword_267D2FD98, MEMORY[0x263EFCC70]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2FD90);
  }
  return result;
}

uint64_t sub_21E4A2514(void (*a1)(uint64_t *__return_ptr, uint64_t *), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  int64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = MEMORY[0x263F8EE78];
  if (v5)
  {
    uint64_t v17 = MEMORY[0x263F8EE78];
    sub_21E489F88(0, v5, 0);
    uint64_t v6 = v17;
    long long v9 = (uint64_t *)(a3 + 32);
    while (1)
    {
      uint64_t v10 = *v9++;
      uint64_t v15 = v10;
      a1(&v16, &v15);
      if (v4) {
        break;
      }
      uint64_t v4 = 0;
      uint64_t v11 = v16;
      uint64_t v17 = v6;
      unint64_t v13 = *(void *)(v6 + 16);
      unint64_t v12 = *(void *)(v6 + 24);
      if (v13 >= v12 >> 1)
      {
        sub_21E489F88((char *)(v12 > 1), v13 + 1, 1);
        uint64_t v6 = v17;
      }
      *(void *)(v6 + 16) = v13 + 1;
      *(void *)(v6 + 8 * v13 + 32) = v11;
      if (!--v5) {
        return v6;
      }
    }
    swift_release();
  }
  return v6;
}

uint64_t sub_21E4A2624(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  if (*(void *)(a2 + 32) == result) {
    return 1;
  }
  if (v2 == 1) {
    return 0;
  }
  for (uint64_t i = 5; ; ++i)
  {
    uint64_t v4 = i - 3;
    if (__OFADD__(i - 4, 1)) {
      break;
    }
    BOOL v6 = *(void *)(a2 + 8 * i) == result;
    BOOL v5 = v6;
    BOOL v6 = v6 || v4 == v2;
    if (v6) {
      return v5;
    }
  }
  __break(1u);
  return result;
}

id sub_21E4A2688@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  *a2 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F848);
  swift_storeEnumTagMultiPayload();
  uint64_t v4 = (int *)type metadata accessor for StandHourChart();
  BOOL v5 = (uint64_t *)((char *)a2 + v4[5]);
  uint64_t *v5 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F850);
  swift_storeEnumTagMultiPayload();
  BOOL v6 = (char *)a2 + v4[6];
  *(void *)BOOL v6 = swift_getKeyPath();
  v6[8] = 0;
  *(uint64_t *)((char *)a2 + v4[7]) = a1;
  *(uint64_t *)((char *)a2 + v4[8]) = 3600;
  uint64_t v7 = v4[9];
  id result = sub_21E49DDA8();
  *(uint64_t *)((char *)a2 + v7) = (uint64_t)result;
  return result;
}

uint64_t sub_21E4A275C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *sub_21E4A277C(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F848);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_21E4D04A0();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = a3[5];
    uint64_t v10 = (uint64_t *)((char *)a1 + v9);
    uint64_t v11 = (uint64_t *)((char *)a2 + v9);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F850);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_21E4D0320();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      *uint64_t v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v13 = a3[6];
    uint64_t v14 = (char *)a1 + v13;
    uint64_t v15 = (char *)a2 + v13;
    uint64_t v16 = *(void *)v15;
    char v17 = v15[8];
    sub_21E4A297C(*(void *)v15, v17);
    *(void *)uint64_t v14 = v16;
    unsigned char v14[8] = v17;
    uint64_t v18 = a3[8];
    *(uint64_t *)((char *)a1 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
    *(uint64_t *)((char *)a1 + v18) = *(uint64_t *)((char *)a2 + v18);
    uint64_t v19 = a3[9];
    uint64_t v20 = *(void **)((char *)a2 + v19);
    *(uint64_t *)((char *)a1 + v19) = (uint64_t)v20;
    swift_bridgeObjectRetain();
    id v21 = v20;
  }
  return a1;
}

uint64_t sub_21E4A297C(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_retain();
  }
  return result;
}

void sub_21E4A2988(uint64_t a1, int *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F848);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_21E4D04A0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  uint64_t v5 = a1 + a2[5];
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F850);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_21E4D0320();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  sub_21E4A2320(*(void *)(a1 + a2[6]), *(unsigned char *)(a1 + a2[6] + 8));
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void **)(a1 + a2[9]);
}

void *sub_21E4A2ABC(void *a1, void *a2, int *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F848);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_21E4D04A0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F850);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_21E4D0320();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  }
  else
  {
    *uint64_t v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v11 = a3[6];
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = *(void *)v13;
  char v15 = v13[8];
  sub_21E4A297C(*(void *)v13, v15);
  *(void *)uint64_t v12 = v14;
  v12[8] = v15;
  uint64_t v16 = a3[8];
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  *(void *)((char *)a1 + v16) = *(void *)((char *)a2 + v16);
  uint64_t v17 = a3[9];
  uint64_t v18 = *(void **)((char *)a2 + v17);
  *(void *)((char *)a1 + v17) = v18;
  swift_bridgeObjectRetain();
  id v19 = v18;
  return a1;
}

void *sub_21E4A2C6C(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_21E489000((uint64_t)a1, &qword_267D2F848);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F848);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_21E4D04A0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v7 = a3[5];
    uint64_t v8 = (void *)((char *)a1 + v7);
    uint64_t v9 = (void *)((char *)a2 + v7);
    sub_21E489000((uint64_t)a1 + v7, &qword_267D2F850);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F850);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_21E4D0320();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    }
    else
    {
      *uint64_t v8 = *v9;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v11 = a3[6];
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = *(void *)v13;
  char v15 = v13[8];
  sub_21E4A297C(*(void *)v13, v15);
  uint64_t v16 = *(void *)v12;
  char v17 = v12[8];
  *(void *)uint64_t v12 = v14;
  v12[8] = v15;
  sub_21E4A2320(v16, v17);
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[8]) = *(void *)((char *)a2 + a3[8]);
  uint64_t v18 = a3[9];
  id v19 = *(void **)((char *)a2 + v18);
  uint64_t v20 = *(void **)((char *)a1 + v18);
  *(void *)((char *)a1 + v18) = v19;
  id v21 = v19;

  return a1;
}

char *sub_21E4A2E68(char *a1, char *a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F848);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_21E4D04A0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = a3[5];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F850);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v12 = sub_21E4D0320();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v9, v10, v12);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
  }
  uint64_t v13 = a3[6];
  uint64_t v14 = a3[7];
  char v15 = &a1[v13];
  uint64_t v16 = &a2[v13];
  *(void *)char v15 = *(void *)v16;
  v15[8] = v16[8];
  *(void *)&a1[v14] = *(void *)&a2[v14];
  uint64_t v17 = a3[9];
  *(void *)&a1[a3[8]] = *(void *)&a2[a3[8]];
  *(void *)&a1[v17] = *(void *)&a2[v17];
  return a1;
}

char *sub_21E4A3010(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_21E489000((uint64_t)a1, &qword_267D2F848);
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F848);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_21E4D04A0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
    uint64_t v8 = a3[5];
    uint64_t v9 = &a1[v8];
    uint64_t v10 = &a2[v8];
    sub_21E489000((uint64_t)&a1[v8], &qword_267D2F850);
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F850);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_21E4D0320();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v9, v10, v12);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
    }
  }
  uint64_t v13 = a3[6];
  uint64_t v14 = &a1[v13];
  char v15 = &a2[v13];
  uint64_t v16 = *(void *)v15;
  LOBYTE(v15) = v15[8];
  uint64_t v17 = *(void *)v14;
  char v18 = v14[8];
  *(void *)uint64_t v14 = v16;
  unsigned char v14[8] = (char)v15;
  sub_21E4A2320(v17, v18);
  *(void *)&a1[a3[7]] = *(void *)&a2[a3[7]];
  swift_bridgeObjectRelease();
  uint64_t v19 = a3[9];
  *(void *)&a1[a3[8]] = *(void *)&a2[a3[8]];
  uint64_t v20 = *(void **)&a1[v19];
  *(void *)&a1[v19] = *(void *)&a2[v19];

  return a1;
}

uint64_t sub_21E4A3200(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_21E4A3214);
}

uint64_t sub_21E4A3214(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F8C0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F8C8);
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  unint64_t v14 = *(void *)(a1 + *(int *)(a3 + 28));
  if (v14 >= 0xFFFFFFFF) {
    LODWORD(v14) = -1;
  }
  return (v14 + 1);
}

uint64_t sub_21E4A3330(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_21E4A3344);
}

uint64_t sub_21E4A3344(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F8C0);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F8C8);
    uint64_t v14 = *(void *)(result - 8);
    if (*(_DWORD *)(v14 + 84) != a3)
    {
      *(void *)(a1 + *(int *)(a4 + 28)) = (a2 - 1);
      return result;
    }
    uint64_t v10 = result;
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_21E4A345C()
{
  sub_21E4896EC(319, &qword_267D2F8D0, MEMORY[0x263F19988]);
  if (v0 <= 0x3F)
  {
    sub_21E4896EC(319, (unint64_t *)&qword_26AB08638, MEMORY[0x263F18FF8]);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t sub_21E4A3590()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21E4A3808@<X0>(uint64_t *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  unint64_t v24 = a4;
  uint64_t v9 = v5;
  uint64_t v11 = sub_21E4D0400();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(a1);
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21E48A534(v9, (uint64_t)v17, a1);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v18 = a2(0);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 32))(a5, v17, v18);
  }
  else
  {
    os_log_type_t v20 = sub_21E4D0CC0();
    id v21 = sub_21E4D0530();
    if (os_log_type_enabled(v21, v20))
    {
      uint64_t v22 = swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      uint64_t v25 = v23;
      *(_DWORD *)uint64_t v22 = 136315138;
      *(void *)(v22 + 4) = sub_21E489B2C(a3, v24, &v25);
      _os_log_impl(&dword_21E433000, v21, v20, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v22, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C29AE0](v23, -1, -1);
      MEMORY[0x223C29AE0](v22, -1, -1);
    }

    sub_21E4D03F0();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
}

uint64_t sub_21E4A3A90(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!a2)
  {
    BOOL v7 = 0;
    a3 = 0;
    goto LABEL_14;
  }
  if (!a3)
  {
    BOOL v7 = 0;
LABEL_14:
    uint64_t v8 = a4;
LABEL_15:
    *(void *)uint64_t result = a4;
    *(void *)(result + 8) = a5;
    *(void *)(result + 16) = v8;
    *(unsigned char *)(result + 24) = v7;
    return a3;
  }
  if (a3 < 0) {
    goto LABEL_17;
  }
  uint64_t v5 = 0;
  uint64_t v6 = a4;
  while (1)
  {
    BOOL v7 = v6 == a5;
    if (v6 != a5) {
      break;
    }
    uint64_t v8 = 0;
LABEL_8:
    *(void *)(a2 + 8 * v5) = v6;
    if (a3 - 1 == v5) {
      goto LABEL_15;
    }
    ++v5;
    BOOL v9 = v6 == a5;
    uint64_t v6 = v8;
    if (v9)
    {
      BOOL v7 = 1;
      a3 = v5;
      goto LABEL_15;
    }
  }
  uint64_t v8 = v6 + 1;
  if (!__OFADD__(v6, 1)) {
    goto LABEL_8;
  }
  __break(1u);
LABEL_17:
  __break(1u);
  return result;
}

uint64_t sub_21E4A3B1C(uint64_t result, uint64_t a2)
{
  uint64_t v2 = a2 - result;
  if (__OFSUB__(a2, result))
  {
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v3 = v2 + 1;
  if (__OFADD__(v2, 1))
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (v2 == -1) {
    return MEMORY[0x263F8EE78];
  }
  uint64_t v5 = result;
  if (v3 <= 0)
  {
    uint64_t v6 = (void *)MEMORY[0x263F8EE78];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F8F0);
    uint64_t v6 = (void *)swift_allocObject();
    int64_t v7 = _swift_stdlib_malloc_size(v6);
    uint64_t v8 = v7 - 32;
    if (v7 < 32) {
      uint64_t v8 = v7 - 25;
    }
    void v6[2] = v3;
    v6[3] = 2 * (v8 >> 3);
  }
  uint64_t result = sub_21E4A3A90((uint64_t)&v9, (uint64_t)(v6 + 4), v3, v5, a2);
  if (result == v3) {
    return (uint64_t)v6;
  }
LABEL_14:
  __break(1u);
  return result;
}

uint64_t sub_21E4A3BF0@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *(void *)(v2 + 16);
  uint64_t v5 = *a1;
  uint64_t result = type metadata accessor for StandHourChart();
  uint64_t v7 = *(void *)(v4 + *(int *)(result + 32));
  if ((unsigned __int128)(v5 * (__int128)v7) >> 64 == (v5 * v7) >> 63) {
    *a2 = v5 * v7;
  }
  else {
    __break(1u);
  }
  return result;
}

uint64_t sub_21E4A3C54@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for StandHourChart() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  return sub_21E49F4B0(a1, v6, a2);
}

unint64_t sub_21E4A3CD4()
{
  unint64_t result = qword_267D2FDA8;
  if (!qword_267D2FDA8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D2FDA0);
    sub_21E4D0070();
    swift_getOpaqueTypeConformance2();
    sub_21E4A3DA4();
    sub_21E4A3E5C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2FDA8);
  }
  return result;
}

unint64_t sub_21E4A3DA4()
{
  unint64_t result = qword_267D2FDB0;
  if (!qword_267D2FDB0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D2FDB8);
    sub_21E4D01D0();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2FDB0);
  }
  return result;
}

unint64_t sub_21E4A3E5C()
{
  unint64_t result = qword_267D2FDC0;
  if (!qword_267D2FDC0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D2FDC8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D2FDD0);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D2FDD8);
    sub_21E48A380(&qword_267D2FDE0, &qword_267D2FDD8);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2FDC0);
  }
  return result;
}

uint64_t objectdestroyTm_0()
{
  unint64_t v1 = (int *)type metadata accessor for StandHourChart();
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v5 = v0 + v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F848);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_21E4D04A0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v0 + v3, v6);
  }
  else
  {
    swift_release();
  }
  uint64_t v7 = v5 + v1[5];
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F850);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_21E4D0320();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  }
  else
  {
    swift_release();
  }
  sub_21E4A2320(*(void *)(v5 + v1[6]), *(unsigned char *)(v5 + v1[6] + 8));
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_21E4A4130@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for StandHourChart() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  return sub_21E49ED4C(a1, v6, a2);
}

uint64_t sub_21E4A41B0(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_21E4A41F8(uint64_t a1)
{
  return sub_21E4A43D4(a1, (void (*)(void))type metadata accessor for FIUIActivitySummaryProvider);
}

uint64_t sub_21E4A4210()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FE20);
  sub_21E4D07A0();
  return v1;
}

uint64_t sub_21E4A4258()
{
  return sub_21E4D07B0();
}

uint64_t (*sub_21E4A42A4(void *a1))()
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  v3[4] = *v1;
  void v3[5] = v4;
  *uint64_t v3 = v5;
  v3[1] = v4;
  swift_retain();
  swift_retain();
  void v3[6] = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FE20);
  sub_21E4D07A0();
  return sub_21E4902D0;
}

uint64_t sub_21E4A4338()
{
  type metadata accessor for FIUIActivitySummaryProvider();
  id v0 = (id)*sub_21E4B6BA0();
  return sub_21E4ABD94((uint64_t)v0);
}

uint64_t sub_21E4A4370()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FE20);
  sub_21E4D07C0();
  return v1;
}

uint64_t sub_21E4A43BC(uint64_t a1)
{
  return sub_21E4A43D4(a1, (void (*)(void))type metadata accessor for FIUIWheelchairStatusProvider);
}

uint64_t sub_21E4A43D4(uint64_t a1, void (*a2)(void))
{
  a2(0);
  sub_21E4D0790();
  return v3;
}

uint64_t sub_21E4A4414()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F9D8);
  sub_21E4D07A0();
  return v1;
}

uint64_t sub_21E4A445C()
{
  return sub_21E4D07B0();
}

uint64_t (*sub_21E4A44A8(void *a1))()
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v4 = *(void *)(v1 + 24);
  v3[4] = v5;
  void v3[5] = v4;
  *uint64_t v3 = v5;
  v3[1] = v4;
  swift_retain();
  swift_retain();
  void v3[6] = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F9D8);
  sub_21E4D07A0();
  return sub_21E4902D0;
}

uint64_t sub_21E4A453C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F9D8);
  sub_21E4D07C0();
  return v1;
}

uint64_t StepPushCountTodayArchivableView.init()@<X0>(void *a1@<X8>)
{
  type metadata accessor for FIUIActivitySummaryProvider();
  id v2 = (id)*sub_21E4B6BA0();
  sub_21E4ABD94((uint64_t)v2);
  sub_21E4D0790();
  sub_21E4B6C80();
  type metadata accessor for FIUIWheelchairStatusProvider();
  swift_retain();
  uint64_t result = sub_21E4D0790();
  *a1 = v4;
  a1[1] = v5;
  a1[2] = v4;
  a1[3] = v5;
  return result;
}

uint64_t StepPushCountTodayArchivableView.init(from:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  type metadata accessor for FIUIActivitySummaryProvider();
  id v4 = (id)*sub_21E4B6BA0();
  sub_21E4ABD94((uint64_t)v4);
  sub_21E4D0790();
  sub_21E4B6C80();
  type metadata accessor for FIUIWheelchairStatusProvider();
  swift_retain();
  sub_21E4D0790();
  uint64_t result = __swift_destroy_boxed_opaque_existential_0(a1);
  *a2 = v6;
  a2[1] = v7;
  a2[2] = v6;
  a2[3] = v7;
  return result;
}

uint64_t StepPushCountTodayArchivableView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v61 = a1;
  uint64_t v2 = sub_21E4D0570();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v50 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FE28);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v58 = (char *)&v50 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FE30) - 8;
  MEMORY[0x270FA5388](v60);
  uint64_t v59 = (uint64_t)&v50 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = v1[1];
  uint64_t v62 = *v1;
  uint64_t v63 = v62;
  uint64_t v52 = v1[2];
  uint64_t v51 = v1[3];
  uint64_t v64 = v9;
  uint64_t v65 = v52;
  uint64_t v56 = v9;
  uint64_t v66 = v51;
  id v10 = sub_21E4B69E4();
  uint64_t v11 = sub_21E4B6A0C(v10, 0, 0);

  uint64_t v12 = sub_21E4A4D18(v11);
  uint64_t v14 = v13;
  swift_bridgeObjectRelease();
  uint64_t v63 = v12;
  uint64_t v64 = v14;
  unint64_t v57 = sub_21E48BAE8();
  uint64_t v15 = sub_21E4D0610();
  uint64_t v17 = v16;
  char v19 = v18 & 1;
  sub_21E4D0550();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F1A680], v2);
  sub_21E4D05A0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v20 = sub_21E4D05C0();
  uint64_t v54 = v20;
  uint64_t v22 = v21;
  uint64_t v53 = v21;
  LOBYTE(v2) = v23;
  uint64_t v25 = v24;
  uint64_t v55 = v24;
  swift_release();
  sub_21E4956BC(v15, v17, v19);
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v63 = v20;
  uint64_t v64 = v22;
  LOBYTE(v65) = v2 & 1;
  uint64_t v66 = v25;
  uint64_t v67 = KeyPath;
  uint64_t v68 = 0x3FE6666666666666;
  uint64_t v70 = v62;
  uint64_t v71 = v9;
  uint64_t v27 = v52;
  uint64_t v28 = v51;
  uint64_t v72 = v52;
  uint64_t v73 = v51;
  id v29 = sub_21E4B69E4();
  uint64_t v30 = sub_21E4B6A0C(v29, 0, 0);

  uint64_t v31 = sub_21E4A4D18(v30);
  uint64_t v33 = v32;
  swift_bridgeObjectRelease();
  uint64_t v70 = v27;
  uint64_t v71 = v28;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F9D8);
  uint64_t v34 = sub_21E4D07A0();
  (*(void (**)(uint64_t))(*(void *)v69 + 136))(v34);
  swift_release();
  id v35 = sub_21E4B69E4();
  sub_21E4B6A0C(v35, 0, 0);
  swift_bridgeObjectRelease();

  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F950);
  uint64_t v36 = swift_allocObject();
  *(_OWORD *)(v36 + 16) = xmmword_21E4D9230;
  *(void *)(v36 + 56) = MEMORY[0x263F8D310];
  *(void *)(v36 + 64) = sub_21E48B95C();
  *(void *)(v36 + 32) = v31;
  *(void *)(v36 + 40) = v33;
  uint64_t v37 = sub_21E4D0AC0();
  uint64_t v39 = v38;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v70 = v37;
  uint64_t v71 = v39;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FE38);
  sub_21E4A5570();
  uint64_t v40 = (uint64_t)v58;
  sub_21E4D06E0();
  swift_bridgeObjectRelease();
  sub_21E4956BC(v54, v53, v2 & 1);
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v41 = (uint64_t (*)())swift_allocObject();
  uint64_t v42 = v62;
  uint64_t v43 = v56;
  *((void *)v41 + 2) = v62;
  *((void *)v41 + 3) = v43;
  *((void *)v41 + 4) = v27;
  *((void *)v41 + 5) = v28;
  uint64_t v44 = v59;
  sub_21E48A534(v40, v59, &qword_267D2FE28);
  uint64_t v45 = (uint64_t (**)())(v44 + *(int *)(v60 + 44));
  *uint64_t v45 = sub_21E4A564C;
  v45[1] = v41;
  v45[2] = 0;
  v45[3] = 0;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_21E489000(v40, &qword_267D2FE28);
  uint64_t v46 = (void *)swift_allocObject();
  v46[2] = v42;
  v46[3] = v43;
  v46[4] = v27;
  v46[5] = v28;
  uint64_t v47 = v61;
  sub_21E48A534(v44, v61, &qword_267D2FE30);
  uint64_t v48 = (void *)(v47 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267D2FE58) + 36));
  *uint64_t v48 = 0;
  v48[1] = 0;
  v48[2] = sub_21E4A56DC;
  v48[3] = v46;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return sub_21E489000(v44, &qword_267D2FE30);
}

uint64_t sub_21E4A4D18(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F9D8);
  uint64_t v2 = sub_21E4D07A0();
  char v3 = (*(uint64_t (**)(uint64_t))(*(void *)v18 + 136))(v2);
  swift_release();
  if (v3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FE20);
    uint64_t v4 = sub_21E4D07A0();
    uint64_t v5 = (void *)(*(uint64_t (**)(uint64_t))(*(void *)v18 + 152))(v4);
    swift_release();
    if (v5)
    {
      uint64_t v6 = &selRef__pushCount;
      goto LABEL_6;
    }
LABEL_12:
    swift_bridgeObjectRetain();
    return a1;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FE20);
  uint64_t v7 = sub_21E4D07A0();
  uint64_t v5 = (void *)(*(uint64_t (**)(uint64_t))(*(void *)v18 + 152))(v7);
  swift_release();
  if (!v5) {
    goto LABEL_12;
  }
  uint64_t v6 = &selRef_stepCount;
LABEL_6:
  id v8 = [v5 *v6];

  if (!v8) {
    goto LABEL_12;
  }
  uint64_t v9 = self;
  id v10 = v8;
  id v11 = objc_msgSend(v9, sel_countUnit);
  objc_msgSend(v10, sel_doubleValueForUnit_, v11);
  double v13 = v12;

  id v14 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, v13);
  if (qword_267D307E0 != -1) {
    swift_once();
  }
  id v15 = objc_msgSend((id)qword_267D307E8, sel_stringFromNumber_, v14);
  if (!v15) {
    id v15 = objc_msgSend(v14, sel_description);
  }
  uint64_t v16 = v15;
  a1 = sub_21E4D0AF0();

  return a1;
}

uint64_t sub_21E4A4FAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void v5[5] = a4;
  v5[6] = a5;
  sub_21E4D0C30();
  v5[7] = sub_21E4D0C20();
  uint64_t v7 = sub_21E4D0C10();
  return MEMORY[0x270FA2498](sub_21E4A5044, v7, v6);
}

uint64_t sub_21E4A5044()
{
  uint64_t v1 = v0[6];
  uint64_t v2 = v0[5];
  swift_release();
  v0[2] = v2;
  v0[3] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FE20);
  sub_21E4D07A0();
  uint64_t v3 = v0[4];
  uint64_t v4 = sub_21E4980A8();
  (*(void (**)(uint64_t))(*(void *)v3 + 240))(v4);
  swift_release();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_21E4A5108(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F780);
  MEMORY[0x270FA5388](v11 - 8);
  double v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_21E4D0C50();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v13, 1, 1, v14);
  sub_21E4D0C30();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  uint64_t v15 = sub_21E4D0C20();
  uint64_t v16 = (void *)swift_allocObject();
  uint64_t v17 = MEMORY[0x263F8F500];
  v16[2] = v15;
  v16[3] = v17;
  v16[4] = a1;
  v16[5] = a2;
  v16[6] = a3;
  v16[7] = a4;
  sub_21E4848FC((uint64_t)v13, a6, (uint64_t)v16);
  return swift_release();
}

uint64_t sub_21E4A524C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void v5[5] = a4;
  v5[6] = a5;
  sub_21E4D0C30();
  v5[7] = sub_21E4D0C20();
  uint64_t v7 = sub_21E4D0C10();
  return MEMORY[0x270FA2498](sub_21E4A52E4, v7, v6);
}

uint64_t sub_21E4A52E4()
{
  uint64_t v1 = *(void *)(v0 + 48);
  uint64_t v2 = *(void *)(v0 + 40);
  swift_release();
  *(void *)(v0 + 16) = v2;
  *(void *)(v0 + 24) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FE20);
  uint64_t v3 = sub_21E4D07A0();
  (*(void (**)(uint64_t))(**(void **)(v0 + 32) + 248))(v3);
  swift_release();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

id sub_21E4A53A4()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08A30]), sel_init);
  id result = objc_msgSend(v0, sel_setNumberStyle_, 1);
  qword_267D307E8 = (uint64_t)v0;
  return result;
}

uint64_t sub_21E4A53F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_21E4A5C18();
  return MEMORY[0x270F00310](a1, a2, a3, v6);
}

uint64_t sub_21E4A5458(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_21E4A5C18();
  return MEMORY[0x270F00318](a1, a2, a3, v6);
}

uint64_t sub_21E4A54BC()
{
  return sub_21E4D0300();
}

uint64_t sub_21E4A5504@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return StepPushCountTodayArchivableView.init(from:)(a1, a2);
}

uint64_t sub_21E4A551C@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_21E4D0390();
  *a1 = v3;
  return result;
}

uint64_t sub_21E4A5548()
{
  return sub_21E4D03A0();
}

unint64_t sub_21E4A5570()
{
  unint64_t result = qword_267D2FE40;
  if (!qword_267D2FE40)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D2FE38);
    sub_21E4A55EC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2FE40);
  }
  return result;
}

unint64_t sub_21E4A55EC()
{
  unint64_t result = qword_267D2FE48;
  if (!qword_267D2FE48)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D2FE50);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2FE48);
  }
  return result;
}

uint64_t sub_21E4A564C()
{
  return sub_21E4A5108(v0[2], v0[3], v0[4], v0[5], (uint64_t)&unk_26CF5E8C0, (uint64_t)&unk_267D2FE98);
}

uint64_t objectdestroyTm_1()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_21E4A56DC()
{
  return sub_21E4A5108(v0[2], v0[3], v0[4], v0[5], (uint64_t)&unk_26CF5E870, (uint64_t)&unk_267D2FE80);
}

uint64_t sub_21E4A5718()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_21E4A5738()
{
  unint64_t result = qword_26AB08760;
  if (!qword_26AB08760)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AB08760);
  }
  return result;
}

unint64_t sub_21E4A5790()
{
  unint64_t result = qword_26AB08768;
  if (!qword_26AB08768)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AB08768);
  }
  return result;
}

unint64_t sub_21E4A57E8()
{
  unint64_t result = qword_26AB08770;
  if (!qword_26AB08770)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AB08770);
  }
  return result;
}

uint64_t destroy for StepPushCountTodayArchivableView()
{
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

void *initializeWithCopy for StepPushCountTodayArchivableView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for StepPushCountTodayArchivableView(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  a1[3] = a2[3];
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *assignWithTake for StepPushCountTodayArchivableView(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  swift_release();
  a1[1] = a2[1];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for StepPushCountTodayArchivableView(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for StepPushCountTodayArchivableView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)unint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for StepPushCountTodayArchivableView()
{
  return &type metadata for StepPushCountTodayArchivableView;
}

uint64_t sub_21E4A5A60()
{
  return sub_21E4A5AC4(&qword_267D2FE60, &qword_267D2FE58, (void (*)(void))sub_21E4A5A9C);
}

uint64_t sub_21E4A5A9C()
{
  return sub_21E4A5AC4(&qword_267D2FE68, &qword_267D2FE30, (void (*)(void))sub_21E4A5B44);
}

uint64_t sub_21E4A5AC4(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_21E4A5B44()
{
  unint64_t result = qword_267D2FE70;
  if (!qword_267D2FE70)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D2FE28);
    sub_21E4A5570();
    sub_21E4A5BC0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_267D2FE70);
  }
  return result;
}

unint64_t sub_21E4A5BC0()
{
  unint64_t result = qword_267D2FBC8;
  if (!qword_267D2FBC8)
  {
    sub_21E4D0520();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2FBC8);
  }
  return result;
}

unint64_t sub_21E4A5C18()
{
  unint64_t result = qword_26AB08778;
  if (!qword_26AB08778)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AB08778);
  }
  return result;
}

uint64_t sub_21E4A5C70()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_21E484808;
  return sub_21E4A524C((uint64_t)v4, v5, v6, v2, v3);
}

uint64_t sub_21E4A5D08()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_21E4A5D40(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_21E484808;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_267D2F838 + dword_267D2F838);
  return v6(a1, v4);
}

uint64_t objectdestroy_6Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_21E4A5E54()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_21E485BA8;
  return sub_21E4A4FAC((uint64_t)v4, v5, v6, v2, v3);
}

id UICollectionViewFlowLayout.scrollDirection(_:)(uint64_t a1)
{
  objc_msgSend(v1, sel_setScrollDirection_, a1);
  return v3;
}

void *sub_21E4A5F34()
{
  swift_getKeyPath();
  (*(void (**)(void))(*v0 + 304))();
  swift_release();
  uint64_t v1 = (void *)v0[2];
  id v2 = v1;
  return v1;
}

uint64_t sub_21E4A5FA0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 152))();
  *a2 = result;
  return result;
}

uint64_t sub_21E4A5FEC(void **a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_21E4A628C(a1, a2, a3, a4, (uint64_t)&unk_21E4D9BD0, (uint64_t)sub_21E4A97E8);
}

void sub_21E4A600C(void *a1)
{
  swift_getKeyPath();
  uint64_t v3 = v1;
  uint64_t v4 = a1;
  (*(void (**)(void))(*(void *)v1 + 312))();
  swift_release();
}

void sub_21E4A60B0()
{
  uint64_t v1 = *(void *)(v0 + 16);
  id v2 = *(void **)(v0 + 24);
  uint64_t v3 = *(void **)(v1 + 16);
  *(void *)(v1 + 16) = v2;
  id v4 = v2;
}

uint64_t sub_21E4A60EC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC9FitnessUI30FIUIActivityStatisticsProvider_uuid;
  uint64_t v4 = sub_21E4CFE50();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t sub_21E4A6160@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

void *sub_21E4A6168()
{
  swift_getKeyPath();
  (*(void (**)(void))(*(void *)v0 + 304))();
  swift_release();
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC9FitnessUI30FIUIActivityStatisticsProvider__statisticsQuery);
  id v2 = v1;
  return v1;
}

id sub_21E4A61DC@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  (*(void (**)(void))(*(void *)v3 + 304))();
  swift_release();
  uint64_t v4 = *(void **)(v3 + OBJC_IVAR____TtC9FitnessUI30FIUIActivityStatisticsProvider__statisticsQuery);
  *a2 = v4;
  return v4;
}

uint64_t sub_21E4A626C(void **a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_21E4A628C(a1, a2, a3, a4, (uint64_t)&unk_21E4D9BF8, (uint64_t)sub_21E4A9254);
}

uint64_t sub_21E4A628C(void **a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = *a1;
  uint64_t v8 = *a2;
  uint64_t KeyPath = swift_getKeyPath();
  v13[2] = v8;
  v13[3] = v7;
  id v10 = *(void (**)(uint64_t, uint64_t, void *, uint64_t))(*(void *)v8 + 312);
  id v11 = v7;
  v10(KeyPath, a6, v13, MEMORY[0x263F8EE60] + 8);

  return swift_release();
}

uint64_t sub_21E4A634C()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FE08);
  MEMORY[0x270FA5388](v0 - 8);
  id v2 = (char *)&v10 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FE10);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_21E4CFCB0();
  __swift_allocate_value_buffer(v6, qword_267D30808);
  __swift_project_value_buffer(v6, (uint64_t)qword_267D30808);
  uint64_t v7 = sub_21E4CFF80();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v5, 1, 1, v7);
  uint64_t v8 = sub_21E4CFF90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v2, 1, 1, v8);
  return sub_21E4CFCA0();
}

uint64_t sub_21E4A6540(void *a1)
{
  uint64_t v2 = swift_allocObject();
  sub_21E4A6580(a1);
  return v2;
}

uint64_t sub_21E4A6580(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_21E4D0050();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(v2 + 16) = 0;
  sub_21E4CFE40();
  *(void *)(v2 + OBJC_IVAR____TtC9FitnessUI30FIUIActivityStatisticsProvider__statisticsQuery) = 0;
  *(void *)(v2 + OBJC_IVAR____TtC9FitnessUI30FIUIActivityStatisticsProvider__queryTask) = 0;
  sub_21E4CFFE0();
  *(void *)(v2 + OBJC_IVAR____TtC9FitnessUI30FIUIActivityStatisticsProvider_healthStore) = a1;
  id v8 = a1;
  uint64_t v9 = sub_21E4B3930();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v9, v4);
  swift_retain_n();
  uint64_t v10 = sub_21E4D0030();
  os_log_type_t v11 = sub_21E4D0CD0();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = swift_slowAlloc();
    id v23 = v8;
    uint64_t v13 = v12;
    uint64_t v21 = swift_slowAlloc();
    uint64_t v25 = v21;
    *(_DWORD *)uint64_t v13 = 136315394;
    uint64_t v14 = sub_21E4D10C0();
    unint64_t v24 = sub_21E489B2C(v14, v15, &v25);
    uint64_t v22 = v4;
    sub_21E4D0D30();
    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 12) = 2080;
    sub_21E4CFE50();
    sub_21E4A9608(&qword_267D2FB88, MEMORY[0x263F07508]);
    uint64_t v16 = sub_21E4D0F90();
    unint64_t v24 = sub_21E489B2C(v16, v17, &v25);
    sub_21E4D0D30();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21E433000, v10, v11, "%s id=%s init", (uint8_t *)v13, 0x16u);
    uint64_t v18 = v21;
    swift_arrayDestroy();
    MEMORY[0x223C29AE0](v18, -1, -1);
    MEMORY[0x223C29AE0](v13, -1, -1);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v22);
  }
  else
  {

    swift_release_n();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  return v2;
}

id *sub_21E4A68D0()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_21E4D0050();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_21E4B3930();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  swift_retain_n();
  uint64_t v7 = sub_21E4D0030();
  os_log_type_t v8 = sub_21E4D0CD0();
  uint64_t v9 = &unk_267D32000;
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v24 = v2;
    uint64_t v11 = v10;
    uint64_t v23 = swift_slowAlloc();
    uint64_t v26 = v23;
    *(_DWORD *)uint64_t v11 = 136315394;
    uint64_t v12 = sub_21E4D10C0();
    unint64_t v25 = sub_21E489B2C(v12, v13, &v26);
    sub_21E4D0D30();
    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 12) = 2080;
    sub_21E4CFE50();
    sub_21E4A9608(&qword_267D2FB88, MEMORY[0x263F07508]);
    uint64_t v9 = (void *)&unk_267D32000;
    uint64_t v14 = sub_21E4D0F90();
    unint64_t v25 = sub_21E489B2C(v14, v15, &v26);
    sub_21E4D0D30();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21E433000, v7, v8, "%s id=%s deinit", (uint8_t *)v11, 0x16u);
    uint64_t v16 = v23;
    swift_arrayDestroy();
    MEMORY[0x223C29AE0](v16, -1, -1);
    MEMORY[0x223C29AE0](v11, -1, -1);

    uint64_t v17 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v24);
  }
  else
  {

    swift_release_n();
    uint64_t v17 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  (*((void (**)(uint64_t))*v1 + 37))(v17);

  uint64_t v18 = (char *)v1 + v9[339];
  uint64_t v19 = sub_21E4CFE50();
  (*(void (**)(char *, uint64_t))(*(void *)(v19 - 8) + 8))(v18, v19);

  swift_release();
  uint64_t v20 = (char *)v1 + OBJC_IVAR____TtC9FitnessUI30FIUIActivityStatisticsProvider___observationRegistrar;
  uint64_t v21 = sub_21E4CFFF0();
  (*(void (**)(char *, uint64_t))(*(void *)(v21 - 8) + 8))(v20, v21);
  return v1;
}

uint64_t sub_21E4A6CB0()
{
  sub_21E4A68D0();
  return swift_deallocClassInstance();
}

void sub_21E4A6D08(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v56 = a1;
  uint64_t v3 = *v1;
  uint64_t v4 = sub_21E4CFCB0();
  uint64_t v58 = *(void *)(v4 - 8);
  uint64_t v59 = v4;
  MEMORY[0x270FA5388](v4);
  unint64_t v57 = (char *)&v49 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_21E4D0050();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v60 = (char *)&v49 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v49 - v10;
  uint64_t v12 = sub_21E4B3930();
  uint64_t v53 = *(void (**)(char *))(v7 + 16);
  uint64_t v54 = v12;
  v53(v11);
  swift_retain_n();
  unint64_t v13 = sub_21E4D0030();
  os_log_type_t v14 = sub_21E4D0CD0();
  BOOL v15 = os_log_type_enabled(v13, v14);
  uint64_t v61 = v7;
  if (v15)
  {
    uint64_t v16 = swift_slowAlloc();
    uint64_t v52 = swift_slowAlloc();
    aBlock[0] = v52;
    *(_DWORD *)uint64_t v16 = 136315394;
    uint64_t v17 = sub_21E4D10C0();
    uint64_t v55 = v6;
    unint64_t v62 = sub_21E489B2C(v17, v18, aBlock);
    sub_21E4D0D30();
    swift_bridgeObjectRelease();
    *(_WORD *)(v16 + 12) = 2080;
    uint64_t v51 = v16 + 14;
    sub_21E4CFE50();
    sub_21E4A9608(&qword_267D2FB88, MEMORY[0x263F07508]);
    uint64_t v6 = v55;
    uint64_t v19 = sub_21E4D0F90();
    unint64_t v62 = sub_21E489B2C(v19, v20, aBlock);
    sub_21E4D0D30();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl(&dword_21E433000, v13, v14, "%s id=%s startStatisticsQueryIfNeeded", (uint8_t *)v16, 0x16u);
    uint64_t v21 = v52;
    swift_arrayDestroy();
    MEMORY[0x223C29AE0](v21, -1, -1);
    MEMORY[0x223C29AE0](v16, -1, -1);

    uint64_t v22 = *(void (**)(char *, uint64_t))(v61 + 8);
  }
  else
  {
    swift_release_n();

    uint64_t v22 = *(void (**)(char *, uint64_t))(v7 + 8);
  }
  v22(v11, v6);
  swift_getKeyPath();
  (*(void (**)(void))(*v2 + 304))();
  swift_release();
  if (!*(void *)((char *)v2 + OBJC_IVAR____TtC9FitnessUI30FIUIActivityStatisticsProvider__statisticsQuery))
  {
    uint64_t v23 = v60;
    ((void (*)(char *, uint64_t, uint64_t))v53)(v60, v54, v6);
    swift_retain_n();
    uint64_t v24 = sub_21E4D0030();
    os_log_type_t v25 = sub_21E4D0CD0();
    BOOL v26 = os_log_type_enabled(v24, v25);
    uint64_t v50 = v3;
    if (v26)
    {
      uint64_t v27 = swift_slowAlloc();
      uint64_t v28 = swift_slowAlloc();
      aBlock[0] = v28;
      *(_DWORD *)uint64_t v27 = 136315394;
      uint64_t v29 = sub_21E4D10C0();
      unint64_t v62 = sub_21E489B2C(v29, v30, aBlock);
      uint64_t v55 = v6;
      sub_21E4D0D30();
      swift_bridgeObjectRelease();
      *(_WORD *)(v27 + 12) = 2080;
      sub_21E4CFE50();
      sub_21E4A9608(&qword_267D2FB88, MEMORY[0x263F07508]);
      uint64_t v31 = sub_21E4D0F90();
      unint64_t v62 = sub_21E489B2C(v31, v32, aBlock);
      sub_21E4D0D30();
      swift_bridgeObjectRelease();
      swift_release_n();
      _os_log_impl(&dword_21E433000, v24, v25, "%s id=%s Starting activity statistics cache query", (uint8_t *)v27, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x223C29AE0](v28, -1, -1);
      MEMORY[0x223C29AE0](v27, -1, -1);

      uint64_t v33 = v60;
      uint64_t v34 = v55;
    }
    else
    {
      swift_release_n();

      uint64_t v33 = v23;
      uint64_t v34 = v6;
    }
    v22(v33, v34);
    if (qword_267D30800 != -1) {
      swift_once();
    }
    uint64_t v35 = v59;
    uint64_t v36 = __swift_project_value_buffer(v59, (uint64_t)qword_267D30808);
    uint64_t v38 = v57;
    uint64_t v37 = v58;
    (*(void (**)(char *, uint64_t, uint64_t))(v58 + 16))(v57, v36, v35);
    uint64_t v39 = swift_allocObject();
    swift_weakInit();
    uint64_t v40 = (void *)swift_allocObject();
    uint64_t v41 = v56;
    v40[2] = v39;
    v40[3] = v41;
    v40[4] = v50;
    id v42 = objc_allocWithZone(MEMORY[0x263F0A2A8]);
    swift_retain();
    uint64_t v43 = (void *)sub_21E4CFC60();
    void aBlock[4] = (uint64_t)sub_21E4A9224;
    aBlock[5] = (uint64_t)v40;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_21E49BC7C;
    aBlock[3] = (uint64_t)&block_descriptor_1;
    uint64_t v44 = _Block_copy(aBlock);
    id v45 = objc_msgSend(v42, sel_initWithStatisticsIntervalComponents_updateHandler_, v43, v44);
    _Block_release(v44);

    (*(void (**)(char *, uint64_t))(v37 + 8))(v38, v35);
    swift_release();
    swift_release();
    uint64_t KeyPath = swift_getKeyPath();
    MEMORY[0x270FA5388](KeyPath);
    *(&v49 - 2) = (uint64_t)v2;
    *(&v49 - 1) = (uint64_t)v45;
    uint64_t v47 = *(void (**)(uint64_t, void (*)(), uint64_t *, uint64_t))(*v2 + 312);
    id v48 = v45;
    v47(KeyPath, sub_21E4A9254, &v49 - 4, MEMORY[0x263F8EE60] + 8);

    swift_release();
    objc_msgSend(*(id *)((char *)v2 + OBJC_IVAR____TtC9FitnessUI30FIUIActivityStatisticsProvider_healthStore), sel_executeQuery_, v48);
  }
}

uint64_t sub_21E4A7574(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = sub_21E4D0050();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = &v39[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F780);
  MEMORY[0x270FA5388](v13 - 8);
  BOOL v15 = &v39[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v17 = result;
    if (a2)
    {
      uint64_t v18 = sub_21E4B3930();
      (*(void (**)(unsigned char *, uint64_t, uint64_t))(v10 + 16))(v12, v18, v9);
      swift_retain();
      id v19 = a2;
      swift_retain();
      id v20 = a2;
      uint64_t v21 = sub_21E4D0030();
      os_log_type_t v22 = sub_21E4D0CB0();
      int v23 = v22;
      if (os_log_type_enabled(v21, v22))
      {
        uint64_t v24 = swift_slowAlloc();
        uint64_t v43 = a4;
        uint64_t v25 = v24;
        uint64_t v42 = swift_slowAlloc();
        uint64_t v45 = v42;
        *(_DWORD *)uint64_t v25 = 136315650;
        os_log_t v41 = v21;
        uint64_t v26 = sub_21E4D10C0();
        int v40 = v23;
        unint64_t v44 = sub_21E489B2C(v26, v27, &v45);
        sub_21E4D0D30();
        swift_bridgeObjectRelease();
        *(_WORD *)(v25 + 12) = 2080;
        sub_21E4CFE50();
        sub_21E4A9608(&qword_267D2FB88, MEMORY[0x263F07508]);
        uint64_t v28 = sub_21E4D0F90();
        unint64_t v44 = sub_21E489B2C(v28, v29, &v45);
        sub_21E4D0D30();
        swift_bridgeObjectRelease();
        swift_release_n();
        *(_WORD *)(v25 + 22) = 2080;
        swift_getErrorValue();
        uint64_t v30 = sub_21E4D1020();
        unint64_t v44 = sub_21E489B2C(v30, v31, &v45);
        sub_21E4D0D30();
        swift_bridgeObjectRelease();

        uint64_t v21 = v41;
        _os_log_impl(&dword_21E433000, v41, (os_log_type_t)v40, "%s id=%s Error from current activity statistics cache query: %s", (uint8_t *)v25, 0x20u);
        uint64_t v32 = v42;
        swift_arrayDestroy();
        MEMORY[0x223C29AE0](v32, -1, -1);
        uint64_t v33 = v25;
        a4 = v43;
        MEMORY[0x223C29AE0](v33, -1, -1);
      }
      else
      {
        swift_release_n();
      }
      (*(void (**)(unsigned char *, uint64_t))(v10 + 8))(v12, v9);
      sub_21E4A7FCC(a4);
    }
    else
    {
      uint64_t v34 = sub_21E4D0C50();
      (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56))(v15, 1, 1, v34);
      sub_21E4D0C30();
      id v35 = a1;
      swift_retain();
      uint64_t v36 = sub_21E4D0C20();
      uint64_t v37 = (void *)swift_allocObject();
      uint64_t v38 = MEMORY[0x263F8F500];
      v37[2] = v36;
      v37[3] = v38;
      v37[4] = a1;
      v37[5] = v17;
      v37[6] = a5;
      sub_21E4848FC((uint64_t)v15, (uint64_t)&unk_267D2FED0, (uint64_t)v37);
      swift_release();
    }
    return swift_release();
  }
  return result;
}

uint64_t sub_21E4A7A08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[7] = a5;
  v6[8] = a6;
  void v6[6] = a4;
  uint64_t v7 = sub_21E4D0050();
  v6[9] = v7;
  v6[10] = *(void *)(v7 - 8);
  v6[11] = swift_task_alloc();
  sub_21E4D0C30();
  v6[12] = sub_21E4D0C20();
  uint64_t v9 = sub_21E4D0C10();
  return MEMORY[0x270FA2498](sub_21E4A7B34, v9, v8);
}

uint64_t sub_21E4A7B34()
{
  uint64_t v37 = v0;
  v36[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(v0 + 48);
  swift_release();
  if (v1 && (id v2 = objc_msgSend(*(id *)(v0 + 48), sel_currentActivityCache)) != 0)
  {
    uint64_t v3 = v2;
    id v4 = sub_21E4AEBC4();
  }
  else
  {
    id v4 = 0;
  }
  uint64_t v6 = *(void *)(v0 + 80);
  uint64_t v5 = *(void *)(v0 + 88);
  uint64_t v7 = *(void *)(v0 + 72);
  uint64_t v8 = sub_21E4B3930();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v5, v8, v7);
  id v9 = v4;
  swift_retain_n();
  id v10 = v9;
  uint64_t v11 = sub_21E4D0030();
  os_log_type_t v12 = sub_21E4D0CD0();
  if (os_log_type_enabled(v11, v12))
  {
    os_log_type_t v33 = v12;
    uint64_t v13 = swift_slowAlloc();
    uint64_t v34 = (void *)swift_slowAlloc();
    uint64_t v35 = swift_slowAlloc();
    v36[0] = v35;
    *(_DWORD *)uint64_t v13 = 136315650;
    uint64_t v14 = sub_21E4D10C0();
    *(void *)(v0 + 16) = sub_21E489B2C(v14, v15, v36);
    sub_21E4D0D30();
    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 12) = 2080;
    sub_21E4CFE50();
    sub_21E4A9608(&qword_267D2FB88, MEMORY[0x263F07508]);
    uint64_t v16 = sub_21E4D0F90();
    *(void *)(v0 + 24) = sub_21E489B2C(v16, v17, v36);
    sub_21E4D0D30();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 22) = 2112;
    if (v4)
    {
      *(void *)(v0 + 40) = v10;
      id v18 = v10;
    }
    else
    {
      *(void *)(v0 + 32) = 0;
    }
    sub_21E4D0D30();
    uint64_t v23 = *(void *)(v0 + 80);
    uint64_t v22 = *(void *)(v0 + 88);
    uint64_t v24 = *(void *)(v0 + 72);
    *uint64_t v34 = v4;

    _os_log_impl(&dword_21E433000, v11, v33, "%s id=%s Received graph samples from current activity statistics cache query: %@", (uint8_t *)v13, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267D2FCB0);
    swift_arrayDestroy();
    MEMORY[0x223C29AE0](v34, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x223C29AE0](v35, -1, -1);
    MEMORY[0x223C29AE0](v13, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v22, v24);
  }
  else
  {
    uint64_t v20 = *(void *)(v0 + 80);
    uint64_t v19 = *(void *)(v0 + 88);
    uint64_t v21 = *(void *)(v0 + 72);

    swift_release_n();
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
  }
  uint64_t v26 = *(void **)(v0 + 48);
  uint64_t v25 = *(void *)(v0 + 56);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v28 = swift_task_alloc();
  *(void *)(v28 + 16) = v25;
  *(void *)(v28 + 24) = v26;
  unint64_t v29 = *(void (**)(uint64_t, void (*)(), uint64_t, uint64_t))(*(void *)v25 + 312);
  id v30 = v26;
  v29(KeyPath, sub_21E4A97E8, v28, MEMORY[0x263F8EE60] + 8);

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v31 = *(uint64_t (**)(void))(v0 + 8);
  return v31();
}

uint64_t sub_21E4A7FCC(uint64_t a1)
{
  uint64_t v45 = a1;
  uint64_t v2 = *v1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F780);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v47 = (uint64_t)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_21E4D0E90();
  uint64_t v43 = *(void *)(v5 - 8);
  uint64_t v44 = v5;
  uint64_t v6 = *(uint64_t **)(v43 + 64);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  os_log_t v41 = (char *)&v38 - (((unint64_t)v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v46 = (char *)&v38 - v8;
  uint64_t v9 = sub_21E4D0050();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  os_log_type_t v12 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_21E4B3930();
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v13, v9);
  swift_retain_n();
  uint64_t v14 = sub_21E4D0030();
  os_log_type_t v15 = sub_21E4D0CD0();
  BOOL v16 = os_log_type_enabled(v14, v15);
  uint64_t v42 = v2;
  if (v16)
  {
    uint64_t v17 = swift_slowAlloc();
    int v40 = v6;
    uint64_t v18 = v17;
    uint64_t v19 = swift_slowAlloc();
    uint64_t v49 = v19;
    *(_DWORD *)uint64_t v18 = 136315394;
    uint64_t v20 = sub_21E4D10C0();
    uint64_t v39 = (void (*)(char *, uint64_t))v9;
    unint64_t v48 = sub_21E489B2C(v20, v21, &v49);
    sub_21E4D0D30();
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 12) = 2080;
    uint64_t v38 = v18 + 14;
    sub_21E4CFE50();
    sub_21E4A9608(&qword_267D2FB88, MEMORY[0x263F07508]);
    uint64_t v22 = sub_21E4D0F90();
    unint64_t v48 = sub_21E489B2C(v22, v23, &v49);
    sub_21E4D0D30();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl(&dword_21E433000, v14, v15, "%s id=%s retryStatisticsQuery", (uint8_t *)v18, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x223C29AE0](v19, -1, -1);
    uint64_t v24 = v18;
    uint64_t v6 = v40;
    MEMORY[0x223C29AE0](v24, -1, -1);

    uint64_t v25 = (*(uint64_t (**)(char *, void))(v10 + 8))(v12, v39);
  }
  else
  {
    swift_release_n();

    uint64_t v25 = (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  (*(void (**)(uint64_t))(*v1 + 296))(v25);
  uint64_t v26 = v41;
  sub_21E4D0E70();
  int v40 = v1;
  uint64_t v28 = v45;
  unint64_t v27 = v46;
  uint64_t v29 = 5;
  if (v45 < 5) {
    uint64_t v29 = v45;
  }
  MEMORY[0x223C28380](1000000000000000000 * v29, ((v29 >> 63) & 0xF21F494C589C0000) + (((unint64_t)v29 * (unsigned __int128)0xDE0B6B3A7640000uLL) >> 64));
  uint64_t v30 = v43;
  uint64_t v31 = v44;
  uint64_t v39 = *(void (**)(char *, uint64_t))(v43 + 8);
  v39(v26, v44);
  uint64_t v32 = sub_21E4D0C50();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56))(v47, 1, 1, v32);
  (*(void (**)(char *, char *, uint64_t))(v30 + 16))(v26, v27, v31);
  unint64_t v33 = (*(unsigned __int8 *)(v30 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80);
  unint64_t v34 = ((unint64_t)v6 + v33 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v35 = (v34 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v36 = swift_allocObject();
  *(void *)(v36 + 16) = 0;
  *(void *)(v36 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v30 + 32))(v36 + v33, v26, v31);
  *(void *)(v36 + v34) = v28;
  *(void *)(v36 + v35) = v40;
  *(void *)(v36 + ((v35 + 15) & 0xFFFFFFFFFFFFFFF8)) = v42;
  swift_retain();
  sub_21E4848FC(v47, (uint64_t)&unk_267D2FEB0, v36);
  swift_release();
  return ((uint64_t (*)(char *, uint64_t))v39)(v46, v31);
}

uint64_t sub_21E4A856C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[10] = a6;
  v7[11] = a7;
  v7[8] = a4;
  v7[9] = a5;
  uint64_t v8 = sub_21E4D0050();
  v7[12] = v8;
  v7[13] = *(void *)(v8 - 8);
  v7[14] = swift_task_alloc();
  uint64_t v9 = sub_21E4D0EA0();
  v7[15] = v9;
  v7[16] = *(void *)(v9 - 8);
  v7[17] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_21E4A868C, 0, 0);
}

uint64_t sub_21E4A868C()
{
  *(void *)(v0 + 24) = 0;
  *(void *)(v0 + 16) = 0;
  *(unsigned char *)(v0 + 32) = 1;
  sub_21E4D1010();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 144) = v1;
  uint64_t v2 = sub_21E4A9608(&qword_267D2FEC0, MEMORY[0x263F8F710]);
  void *v1 = v0;
  v1[1] = sub_21E4A8784;
  uint64_t v3 = *(void *)(v0 + 136);
  uint64_t v4 = *(void *)(v0 + 120);
  uint64_t v5 = *(void *)(v0 + 64);
  return MEMORY[0x270FA1FF8](v5, v0 + 16, v3, v4, v2);
}

uint64_t sub_21E4A8784()
{
  uint64_t v2 = (void *)*v1;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v4 = v2[16];
    uint64_t v3 = v2[17];
    uint64_t v5 = v2[15];

    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  }
  else
  {
    (*(void (**)(void, void))(v2[16] + 8))(v2[17], v2[15]);
  }
  return MEMORY[0x270FA2498](sub_21E4A88DC, 0, 0);
}

void sub_21E4A88DC()
{
  uint64_t v22 = v0;
  uint64_t v1 = *(void *)(v0 + 72);
  uint64_t v2 = v1 + 1;
  if (__OFADD__(v1, 1))
  {
    __break(1u);
  }
  else
  {
    uint64_t v4 = *(void *)(v0 + 104);
    uint64_t v3 = *(void *)(v0 + 112);
    uint64_t v5 = *(void *)(v0 + 96);
    uint64_t v6 = sub_21E4B3930();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v3, v6, v5);
    swift_retain_n();
    uint64_t v7 = sub_21E4D0030();
    os_log_type_t v8 = sub_21E4D0CD0();
    BOOL v9 = os_log_type_enabled(v7, v8);
    uint64_t v10 = *(void *)(v0 + 104);
    uint64_t v11 = *(void *)(v0 + 112);
    uint64_t v12 = *(void *)(v0 + 96);
    if (v9)
    {
      uint64_t v20 = *(void *)(v0 + 96);
      uint64_t v13 = swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      uint64_t v21 = v19;
      *(_DWORD *)uint64_t v13 = 136315650;
      uint64_t v14 = sub_21E4D10C0();
      *(void *)(v0 + 40) = sub_21E489B2C(v14, v15, &v21);
      sub_21E4D0D30();
      swift_bridgeObjectRelease();
      *(_WORD *)(v13 + 12) = 2080;
      sub_21E4CFE50();
      sub_21E4A9608(&qword_267D2FB88, MEMORY[0x263F07508]);
      uint64_t v16 = sub_21E4D0F90();
      *(void *)(v0 + 48) = sub_21E489B2C(v16, v17, &v21);
      sub_21E4D0D30();
      swift_bridgeObjectRelease();
      swift_release_n();
      *(_WORD *)(v13 + 22) = 2048;
      *(void *)(v0 + 56) = v2;
      sub_21E4D0D30();
      _os_log_impl(&dword_21E433000, v7, v8, "%s id=%s Restarting activity statistics cache query. Retry attempt: %ld", (uint8_t *)v13, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x223C29AE0](v19, -1, -1);
      MEMORY[0x223C29AE0](v13, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v11, v20);
    }
    else
    {
      swift_release_n();

      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v11, v12);
    }
    (*(void (**)(uint64_t))(**(void **)(v0 + 80) + 280))(v2);
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v18 = *(void (**)(void))(v0 + 8);
    v18();
  }
}

uint64_t sub_21E4A8BF4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_21E4D0050();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_21E4B3930();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  swift_retain_n();
  uint64_t v7 = sub_21E4D0030();
  os_log_type_t v8 = sub_21E4D0CD0();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v21 = v2;
    uint64_t v10 = v9;
    uint64_t v20 = swift_slowAlloc();
    v23[0] = v20;
    *(_DWORD *)uint64_t v10 = 136315394;
    uint64_t v11 = sub_21E4D10C0();
    unint64_t v22 = sub_21E489B2C(v11, v12, v23);
    sub_21E4D0D30();
    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 2080;
    sub_21E4CFE50();
    sub_21E4A9608(&qword_267D2FB88, MEMORY[0x263F07508]);
    uint64_t v13 = sub_21E4D0F90();
    unint64_t v22 = sub_21E489B2C(v13, v14, v23);
    sub_21E4D0D30();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl(&dword_21E433000, v7, v8, "%s id=%s stopStatisticsQuery", (uint8_t *)v10, 0x16u);
    uint64_t v15 = v20;
    swift_arrayDestroy();
    MEMORY[0x223C29AE0](v15, -1, -1);
    MEMORY[0x223C29AE0](v10, -1, -1);

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v21);
  }
  else
  {
    swift_release_n();

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  swift_getKeyPath();
  (*(void (**)(void))(*(void *)v1 + 304))();
  swift_release();
  if (*(void *)(v1 + OBJC_IVAR____TtC9FitnessUI30FIUIActivityStatisticsProvider__statisticsQuery)) {
    objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC9FitnessUI30FIUIActivityStatisticsProvider_healthStore), sel_stopQuery_);
  }
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v17 = MEMORY[0x270FA5388](KeyPath);
  *(&v19 - 2) = v1;
  *(&v19 - 1) = 0;
  (*(void (**)(uint64_t, void (*)()))(*(void *)v1 + 312))(v17, sub_21E4A9254);
  return swift_release();
}

uint64_t sub_21E4A8FF4()
{
  return sub_21E4CFFB0();
}

uint64_t sub_21E4A907C()
{
  return sub_21E4CFFA0();
}

uint64_t sub_21E4A913C@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for FIUIActivityStatisticsProvider();
  uint64_t result = sub_21E4D0240();
  *a1 = result;
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_21E4A91B4()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_21E4A91EC()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_21E4A9224(uint64_t a1, void *a2, void *a3)
{
  return sub_21E4A7574(a2, a3, v3[2], v3[3], v3[4]);
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

void sub_21E4A9254()
{
}

uint64_t type metadata accessor for FIUIActivityStatisticsProvider()
{
  uint64_t result = qword_267D30950;
  if (!qword_267D30950) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_21E4A92B8()
{
  return MEMORY[0x263EFDDD8];
}

uint64_t sub_21E4A92C4()
{
  return type metadata accessor for FIUIActivityStatisticsProvider();
}

uint64_t sub_21E4A92CC()
{
  uint64_t result = sub_21E4CFE50();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_21E4CFFF0();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_updateClassMetadata2();
      if (!result) {
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_21E4A93B4()
{
  uint64_t v1 = sub_21E4D0E90();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((((((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)
     + 8;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  return MEMORY[0x270FA0238](v0, v6, v5);
}

uint64_t sub_21E4A94AC()
{
  uint64_t v2 = *(void *)(sub_21E4D0E90() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  unint64_t v4 = (*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v5 = (v4 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = v0 + v3;
  uint64_t v7 = *(void *)(v0 + v4);
  uint64_t v8 = *(void *)(v0 + v5);
  uint64_t v9 = *(void *)(v0 + ((v5 + 15) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v10;
  *uint64_t v10 = v1;
  v10[1] = sub_21E484808;
  return sub_21E4A856C((uint64_t)v10, v11, v12, v6, v7, v8, v9);
}

uint64_t sub_21E4A95D0()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_21E4A9608(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_21E4A9650()
{
  swift_unknownObjectRelease();

  swift_release();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_21E4A9698()
{
  uint64_t v2 = v0[4];
  uint64_t v3 = v0[5];
  uint64_t v4 = v0[6];
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_21E485BA8;
  return sub_21E4A7A08((uint64_t)v5, v6, v7, v2, v3, v4);
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

void sub_21E4A97A4()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void **)(v0 + 24);
  uint64_t v3 = *(void **)(v1 + OBJC_IVAR____TtC9FitnessUI30FIUIActivityStatisticsProvider__statisticsQuery);
  *(void *)(v1 + OBJC_IVAR____TtC9FitnessUI30FIUIActivityStatisticsProvider__statisticsQuery) = v2;
  id v4 = v2;
}

void sub_21E4A97E8()
{
}

uint64_t sub_21E4A9800()
{
  type metadata accessor for FIUIActivitySummaryProvider();
  sub_21E4D0790();
  return v1;
}

void (*sub_21E4A983C(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  v3[4] = *v1;
  void v3[5] = v4;
  *uint64_t v3 = v5;
  v3[1] = v4;
  swift_retain();
  swift_retain();
  void v3[6] = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FE20);
  sub_21E4D07A0();
  return sub_21E490514;
}

uint64_t sub_21E4A98D0()
{
  return sub_21E4A9900(MEMORY[0x263F18660]);
}

uint64_t sub_21E4A98E8()
{
  return sub_21E4A9900(MEMORY[0x263F18668]);
}

uint64_t sub_21E4A9900(uint64_t (*a1)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v2 = *(void *)(v1 + 16);
  uint64_t v3 = *(void *)(v1 + 24);
  uint64_t v4 = *(unsigned __int8 *)(v1 + 32);
  uint64_t updated = type metadata accessor for FIUIUnitPreferenceUpdateObserver();
  uint64_t v6 = sub_21E4AB530(&qword_267D2F9E0, (void (*)(uint64_t))type metadata accessor for FIUIUnitPreferenceUpdateObserver);
  return a1(v2, v3, v4, updated, v6);
}

void sub_21E4A99A4()
{
  id v0 = objc_msgSend(objc_allocWithZone((Class)FIUIUnitManager), sel_initWithHealthStore_, *sub_21E4B6BA0());
  id v1 = objc_msgSend(objc_allocWithZone((Class)FIUIFormattingManager), sel_initWithUnitManager_, v0);

  if (!v1) {
    __break(1u);
  }
}

void WalkingRunningDistanceTodayArchivableView.init()(uint64_t a1@<X8>)
{
  type metadata accessor for FIUIActivitySummaryProvider();
  uint64_t v2 = sub_21E4B6BA0();
  sub_21E4ABD94((uint64_t)(id)*v2);
  sub_21E4D0790();
  id v3 = objc_msgSend(objc_allocWithZone((Class)FIUIUnitManager), sel_initWithHealthStore_, *v2);
  id v4 = objc_msgSend(objc_allocWithZone((Class)FIUIFormattingManager), sel_initWithUnitManager_, v3);

  if (v4)
  {
    *(void *)a1 = v5;
    *(void *)(a1 + 8) = v6;
    *(void *)(a1 + 16) = sub_21E490680;
    *(void *)(a1 + 24) = 0;
    *(unsigned char *)(a1 + 32) = 0;
    *(void *)(a1 + 40) = v4;
  }
  else
  {
    __break(1u);
  }
}

void WalkingRunningDistanceTodayArchivableView.init(from:)(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  type metadata accessor for FIUIActivitySummaryProvider();
  id v4 = sub_21E4B6BA0();
  sub_21E4ABD94((uint64_t)(id)*v4);
  sub_21E4D0790();
  id v5 = objc_msgSend(objc_allocWithZone((Class)FIUIUnitManager), sel_initWithHealthStore_, *v4);
  id v6 = objc_msgSend(objc_allocWithZone((Class)FIUIFormattingManager), sel_initWithUnitManager_, v5);

  if (v6)
  {
    __swift_destroy_boxed_opaque_existential_0(a1);
    *(void *)a2 = v7;
    *(void *)(a2 + 8) = v8;
    *(void *)(a2 + 16) = sub_21E490680;
    *(void *)(a2 + 24) = 0;
    *(unsigned char *)(a2 + 32) = 0;
    *(void *)(a2 + 40) = v6;
  }
  else
  {
    __break(1u);
  }
}

uint64_t WalkingRunningDistanceTodayArchivableView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v55 = a1;
  uint64_t v2 = sub_21E4D0570();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  id v5 = (char *)&v54 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_21E4CFD10();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v54 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FE28);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v60 = (char *)&v54 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FE30);
  MEMORY[0x270FA5388](v59);
  uint64_t v12 = (char *)&v54 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v13 = v1[1];
  long long v67 = *v1;
  long long v68 = v13;
  long long v69 = v1[2];
  sub_21E4AA234((uint64_t)v8);
  uint64_t v14 = sub_21E4D0600();
  uint64_t v16 = v15;
  char v18 = v17 & 1;
  sub_21E4D0550();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F1A680], v2);
  sub_21E4D05A0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v19 = sub_21E4D05C0();
  uint64_t v21 = v20;
  char v23 = v22;
  uint64_t v25 = v24;
  swift_release();
  sub_21E4956BC(v14, v16, v18);
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v61 = v19;
  uint64_t v62 = v21;
  char v63 = v23 & 1;
  uint64_t v64 = v25;
  uint64_t v65 = KeyPath;
  uint64_t v66 = 0x3FE6666666666666;
  unint64_t v27 = (void *)*((void *)&v69 + 1);
  long long v70 = v67;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FE20);
  uint64_t v28 = sub_21E4D07A0();
  uint64_t v29 = (void *)(*(uint64_t (**)(uint64_t))(*(void *)v71 + 152))(v28);
  swift_release();
  uint64_t v58 = v25;
  uint64_t v57 = v19;
  uint64_t v56 = v21;
  if (v29)
  {
    id v30 = objc_msgSend(v29, sel_distanceWalkingRunning);

    id v31 = objc_msgSend(self, sel_meterUnit);
    objc_msgSend(v30, sel_doubleValueForUnit_, v31);
    double v33 = v32;

    id v34 = objc_msgSend(v27, sel_localizedNaturalScaleStringWithDistanceInMeters_distanceType_unitStyle_usedUnit_, 1, 3, 0, v33);
    if (!v34)
    {
      *(void *)&long long v70 = 0;
      *((void *)&v70 + 1) = 0xE000000000000000;
      sub_21E4D0C80();
      uint64_t v39 = *((void *)&v70 + 1);
      uint64_t v38 = v70;
      goto LABEL_7;
    }
    id v35 = v34;
    uint64_t v36 = sub_21E4D0AF0();
  }
  else
  {
    id v35 = sub_21E4B69E4();
    uint64_t v36 = sub_21E4B6A0C(v35, 0, 0);
  }
  uint64_t v38 = v36;
  uint64_t v39 = v37;

LABEL_7:
  uint64_t v40 = v55;
  id v41 = sub_21E4B69E4();
  sub_21E4B6A0C(v41, 0, 0);

  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F950);
  uint64_t v42 = swift_allocObject();
  *(_OWORD *)(v42 + 16) = xmmword_21E4D9230;
  *(void *)(v42 + 56) = MEMORY[0x263F8D310];
  *(void *)(v42 + 64) = sub_21E48B95C();
  *(void *)(v42 + 32) = v38;
  *(void *)(v42 + 40) = v39;
  uint64_t v43 = sub_21E4D0AC0();
  uint64_t v45 = v44;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(void *)&long long v70 = v43;
  *((void *)&v70 + 1) = v45;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FE38);
  sub_21E4A5570();
  sub_21E48BAE8();
  uint64_t v46 = (uint64_t)v60;
  sub_21E4D06E0();
  swift_bridgeObjectRelease();
  sub_21E4956BC(v57, v56, v23 & 1);
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v47 = (uint64_t (*)())swift_allocObject();
  long long v48 = v68;
  *((_OWORD *)v47 + 1) = v67;
  *((_OWORD *)v47 + 2) = v48;
  *((_OWORD *)v47 + 3) = v69;
  sub_21E48A534(v46, (uint64_t)v12, &qword_267D2FE28);
  uint64_t v49 = (uint64_t (**)())&v12[*(int *)(v59 + 36)];
  *uint64_t v49 = sub_21E4AAF78;
  v49[1] = v47;
  v49[2] = 0;
  v49[3] = 0;
  sub_21E4AAFB0((uint64_t)&v67);
  sub_21E489000(v46, &qword_267D2FE28);
  uint64_t v50 = (_OWORD *)swift_allocObject();
  long long v51 = v68;
  v50[1] = v67;
  v50[2] = v51;
  v50[3] = v69;
  sub_21E48A534((uint64_t)v12, v40, &qword_267D2FE30);
  uint64_t v52 = (void *)(v40 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267D2FE58) + 36));
  *uint64_t v52 = 0;
  v52[1] = 0;
  v52[2] = sub_21E4AB06C;
  v52[3] = v50;
  sub_21E4AAFB0((uint64_t)&v67);
  return sub_21E489000((uint64_t)v12, &qword_267D2FE30);
}

id sub_21E4AA234@<X0>(uint64_t a1@<X8>)
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F990);
  MEMORY[0x270FA5388](v3 - 8);
  id v5 = (char *)&v62 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F938);
  MEMORY[0x270FA5388](v6 - 8);
  long long v70 = (char *)&v62 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F940);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v71 = (char *)&v62 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F948);
  uint64_t v69 = *(void *)(v10 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  long long v13 = (char *)&v62 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v62 - v14;
  uint64_t v16 = sub_21E4CFD50();
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v17 = sub_21E4CFD10();
  uint64_t v72 = *(void *)(v17 - 8);
  uint64_t v73 = v17;
  uint64_t v18 = MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)&v62 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v74 = (char *)&v62 - v21;
  unint64_t v22 = v1[1];
  char v23 = (void *)v1[5];
  uint64_t v76 = *v1;
  unint64_t v77 = v22;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FE20);
  uint64_t v24 = sub_21E4D07A0();
  uint64_t v25 = (void *)(*(uint64_t (**)(uint64_t))(*(void *)v75 + 152))(v24);
  swift_release();
  if (v25)
  {
    uint64_t v64 = v13;
    id v26 = objc_msgSend(v25, sel_distanceWalkingRunning);

    id v27 = objc_msgSend(self, sel_meterUnit);
    objc_msgSend(v26, sel_doubleValueForUnit_, v27);
    double v29 = v28;

    uint64_t v75 = 1;
    id v30 = objc_msgSend(v23, sel_localizedNaturalScaleStringWithDistanceInMeters_distanceType_unitStyle_usedUnit_, 1, 0, &v75, v29);
    if (v30)
    {
      id v31 = v30;
      uint64_t v66 = sub_21E4D0AF0();
      unint64_t v33 = v32;
    }
    else
    {
      uint64_t v76 = 0;
      unint64_t v77 = 0xE000000000000000;
      sub_21E4D0C80();
      unint64_t v33 = v77;
      uint64_t v66 = v76;
    }
    uint64_t v67 = a1;
    uint64_t v68 = v10;
    char v63 = v15;
    uint64_t v65 = v5;
    id result = objc_msgSend(v23, sel_localizedShortUnitStringForDistanceUnit_, v75);
    if (result)
    {
      uint64_t v36 = result;
      uint64_t v37 = sub_21E4D0AF0();
      unint64_t v39 = v38;

      uint64_t v76 = v37;
      unint64_t v77 = v39;
      sub_21E48BAE8();
      uint64_t v40 = MEMORY[0x263F8D310];
      uint64_t v41 = sub_21E4D0D50();
      unint64_t v43 = v42;
      swift_bridgeObjectRelease();
      id v44 = sub_21E4B69E4();
      sub_21E4B6A0C(v44, 0, 0);

      __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F950);
      uint64_t v45 = swift_allocObject();
      *(_OWORD *)(v45 + 16) = xmmword_21E4D9390;
      *(void *)(v45 + 56) = v40;
      unint64_t v46 = sub_21E48B95C();
      *(void *)(v45 + 32) = v66;
      *(void *)(v45 + 40) = v33;
      *(void *)(v45 + 96) = v40;
      *(void *)(v45 + 104) = v46;
      *(void *)(v45 + 64) = v46;
      *(void *)(v45 + 72) = v41;
      *(void *)(v45 + 80) = v43;
      swift_bridgeObjectRetain();
      sub_21E4D0B00();
      swift_bridgeObjectRelease();
      sub_21E4CFD40();
      uint64_t v47 = v74;
      sub_21E4CFD20();
      uint64_t v49 = v72;
      uint64_t v48 = v73;
      (*(void (**)(char *, char *, uint64_t))(v72 + 16))(v20, v47, v73);
      uint64_t v76 = v41;
      unint64_t v77 = v43;
      uint64_t v50 = sub_21E4CFEE0();
      uint64_t v51 = (uint64_t)v70;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v50 - 8) + 56))(v70, 1, 1, v50);
      sub_21E4AB530((unint64_t *)&qword_267D2F968, MEMORY[0x263F06828]);
      uint64_t v52 = v71;
      sub_21E4CFD90();
      sub_21E489000(v51, &qword_267D2F938);
      (*(void (**)(char *, uint64_t))(v49 + 8))(v20, v48);
      swift_bridgeObjectRelease();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v69 + 48))(v52, 1, v68) == 1)
      {
        uint64_t v53 = &qword_267D2F940;
        uint64_t v54 = (uint64_t)v52;
      }
      else
      {
        uint64_t v55 = (uint64_t)v52;
        uint64_t v56 = (uint64_t)v63;
        sub_21E4AB0A4(v55, (uint64_t)v63);
        uint64_t v57 = (uint64_t)v64;
        sub_21E48A534(v56, (uint64_t)v64, &qword_267D2F948);
        uint64_t KeyPath = swift_getKeyPath();
        *(&v62 - 2) = MEMORY[0x270FA5388](KeyPath);
        swift_getKeyPath();
        uint64_t v59 = v65;
        sub_21E4D05D0();
        uint64_t v60 = sub_21E4D05E0();
        (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v60 - 8) + 56))(v59, 0, 1, v60);
        sub_21E48A380(&qword_267D2F980, &qword_267D2F948);
        uint64_t v61 = (void (*)(uint64_t *, void))sub_21E4CFD30();
        sub_21E48C688();
        uint64_t v47 = v74;
        sub_21E4CFD60();
        v61(&v76, 0);
        sub_21E489000(v57, &qword_267D2F948);
        uint64_t v54 = v56;
        uint64_t v53 = &qword_267D2F948;
      }
      sub_21E489000(v54, v53);
      return (id)(*(uint64_t (**)(uint64_t, char *, uint64_t))(v49 + 32))(v67, v47, v48);
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    id v34 = sub_21E4B69E4();
    sub_21E4B6A0C(v34, 0, 0);

    sub_21E4CFD40();
    return (id)sub_21E4CFD20();
  }
  return result;
}

uint64_t sub_21E4AAA80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 40) = a4;
  sub_21E4D0C30();
  *(void *)(v4 + 48) = sub_21E4D0C20();
  uint64_t v6 = sub_21E4D0C10();
  return MEMORY[0x270FA2498](sub_21E4AAB18, v6, v5);
}

uint64_t sub_21E4AAB18()
{
  id v1 = *(_OWORD **)(v0 + 40);
  swift_release();
  *(_OWORD *)(v0 + 16) = *v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FE20);
  sub_21E4D07A0();
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = sub_21E4980A8();
  (*(void (**)(uint64_t))(*(void *)v2 + 240))(v3);
  swift_release();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_21E4AABD8(_OWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F780);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_21E4D0C50();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  sub_21E4D0C30();
  sub_21E4AAFB0((uint64_t)a1);
  uint64_t v9 = sub_21E4D0C20();
  uint64_t v10 = swift_allocObject();
  uint64_t v11 = MEMORY[0x263F8F500];
  *(void *)(v10 + 16) = v9;
  *(void *)(v10 + 24) = v11;
  long long v12 = a1[1];
  *(_OWORD *)(v10 + 32) = *a1;
  *(_OWORD *)(v10 + 48) = v12;
  *(_OWORD *)(v10 + 64) = a1[2];
  sub_21E4848FC((uint64_t)v7, a3, v10);
  return swift_release();
}

uint64_t sub_21E4AACF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 40) = a4;
  sub_21E4D0C30();
  *(void *)(v4 + 48) = sub_21E4D0C20();
  uint64_t v6 = sub_21E4D0C10();
  return MEMORY[0x270FA2498](sub_21E4AAD90, v6, v5);
}

uint64_t sub_21E4AAD90()
{
  id v1 = *(_OWORD **)(v0 + 40);
  swift_release();
  *(_OWORD *)(v0 + 16) = *v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FE20);
  uint64_t v2 = sub_21E4D07A0();
  (*(void (**)(uint64_t))(**(void **)(v0 + 32) + 248))(v2);
  swift_release();
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_21E4AAE4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_21E4AB578();
  return MEMORY[0x270F00310](a1, a2, a3, v6);
}

uint64_t sub_21E4AAEB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_21E4AB578();
  return MEMORY[0x270F00318](a1, a2, a3, v6);
}

uint64_t sub_21E4AAF14()
{
  return sub_21E4D0300();
}

void sub_21E4AAF5C(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
}

uint64_t sub_21E4AAF78()
{
  return sub_21E4AABD8((_OWORD *)(v0 + 16), (uint64_t)&unk_26CF5EB20, (uint64_t)&unk_267D2FEF8);
}

uint64_t sub_21E4AAFB0(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 40);
  swift_retain();
  swift_retain();
  sub_21E495A00();
  id v3 = v2;
  return a1;
}

uint64_t objectdestroyTm_2()
{
  swift_release();
  swift_release();
  sub_21E492BF0();

  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_21E4AB06C()
{
  return sub_21E4AABD8((_OWORD *)(v0 + 16), (uint64_t)&unk_26CF5EAD0, (uint64_t)&unk_267D2FEE0);
}

uint64_t sub_21E4AB0A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F948);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_21E4AB110()
{
  return 8;
}

uint64_t sub_21E4AB11C()
{
  return swift_release();
}

uint64_t sub_21E4AB124(void *a1, void *a2)
{
  *a2 = *a1;
  return swift_retain();
}

void *sub_21E4AB130(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

uint64_t sub_21E4AB13C()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_21E4AB15C()
{
  unint64_t result = qword_26AB08780;
  if (!qword_26AB08780)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AB08780);
  }
  return result;
}

unint64_t sub_21E4AB1B4()
{
  unint64_t result = qword_26AB08788;
  if (!qword_26AB08788)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AB08788);
  }
  return result;
}

unint64_t sub_21E4AB20C()
{
  unint64_t result = qword_26AB08790;
  if (!qword_26AB08790)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AB08790);
  }
  return result;
}

void destroy for WalkingRunningDistanceTodayArchivableView(uint64_t a1)
{
  swift_release();
  swift_release();
  sub_21E492BF0();
  uint64_t v2 = *(void **)(a1 + 40);
}

uint64_t initializeWithCopy for WalkingRunningDistanceTodayArchivableView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  char v7 = *(unsigned char *)(a2 + 32);
  swift_retain();
  swift_retain();
  sub_21E495A00();
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(unsigned char *)(a1 + 32) = v7;
  uint64_t v8 = *(void **)(a2 + 40);
  *(void *)(a1 + 40) = v8;
  id v9 = v8;
  return a1;
}

uint64_t assignWithCopy for WalkingRunningDistanceTodayArchivableView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 24);
  char v6 = *(unsigned char *)(a2 + 32);
  sub_21E495A00();
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  *(unsigned char *)(a1 + 32) = v6;
  sub_21E492BF0();
  char v7 = *(void **)(a2 + 40);
  uint64_t v8 = *(void **)(a1 + 40);
  *(void *)(a1 + 40) = v7;
  id v9 = v7;

  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for WalkingRunningDistanceTodayArchivableView(uint64_t a1, uint64_t a2)
{
  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  char v4 = *(unsigned char *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = v4;
  sub_21E492BF0();
  uint64_t v5 = *(void **)(a1 + 40);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);

  return a1;
}

uint64_t getEnumTagSinglePayload for WalkingRunningDistanceTodayArchivableView(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for WalkingRunningDistanceTodayArchivableView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 48) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WalkingRunningDistanceTodayArchivableView()
{
  return &type metadata for WalkingRunningDistanceTodayArchivableView;
}

uint64_t sub_21E4AB4F4()
{
  return sub_21E4A5AC4(&qword_267D2FE60, &qword_267D2FE58, (void (*)(void))sub_21E4A5A9C);
}

uint64_t sub_21E4AB530(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_21E4AB578()
{
  unint64_t result = qword_26AB08798;
  if (!qword_26AB08798)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AB08798);
  }
  return result;
}

uint64_t sub_21E4AB5D0()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_21E484808;
  return sub_21E4AACF8((uint64_t)v2, v3, v4, v0 + 32);
}

uint64_t sub_21E4AB664()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t objectdestroy_10Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  sub_21E492BF0();

  return MEMORY[0x270FA0238](v0, 80, 7);
}

uint64_t sub_21E4AB6FC()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_21E485BA8;
  return sub_21E4AAA80((uint64_t)v2, v3, v4, v0 + 32);
}

void *sub_21E4AB790()
{
  swift_getKeyPath();
  (*(void (**)(void))(*v0 + 272))();
  swift_release();
  swift_beginAccess();
  uint64_t v1 = (void *)v0[2];
  id v2 = v1;
  return v1;
}

uint64_t sub_21E4AB818@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 152))();
  *a2 = result;
  return result;
}

uint64_t sub_21E4AB864(id *a1, uint64_t a2)
{
  id v2 = *a1;
  uint64_t v3 = *(uint64_t (**)(id))(**(void **)a2 + 160);
  id v4 = *a1;
  return v3(v2);
}

void sub_21E4AB8BC(void *a1)
{
  swift_getKeyPath();
  uint64_t v3 = v1;
  id v4 = a1;
  (*(void (**)(void))(*(void *)v1 + 280))();
  swift_release();
}

void sub_21E4AB960()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v1 = *(void **)(v0 + 24);
  swift_beginAccess();
  uint64_t v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = v1;
  id v4 = v1;
}

void (*sub_21E4AB9BC(void *a1))(void *a1)
{
  uint64_t v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[4] = v1;
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(uint64_t))(*(void *)v1 + 272))(KeyPath);
  swift_release();
  void v3[5] = OBJC_IVAR____TtC9FitnessUI27FIUIActivitySummaryProvider___observationRegistrar;
  *uint64_t v3 = v1;
  swift_getKeyPath();
  void v3[6] = sub_21E4AE5B8(&qword_267D2FF00, (void (*)(uint64_t))type metadata accessor for FIUIActivitySummaryProvider);
  sub_21E4CFFD0();
  swift_release();
  v3[7] = sub_21E483EE8();
  return sub_21E4ABAF0;
}

void sub_21E4ABAF0(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 56))(*a1, 0);
  void *v1 = v1[4];
  swift_getKeyPath();
  sub_21E4CFFC0();
  swift_release();
  free(v1);
}

uint64_t type metadata accessor for FIUIActivitySummaryProvider()
{
  uint64_t result = qword_267D30A10;
  if (!qword_267D30A10) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_21E4ABBC8()
{
  return 5;
}

uint64_t sub_21E4ABBD0()
{
  return 300;
}

void *sub_21E4ABBD8()
{
  swift_getKeyPath();
  (*(void (**)(void))(*v0 + 272))();
  swift_release();
  uint64_t v1 = (void *)v0[5];
  id v2 = v1;
  return v1;
}

id sub_21E4ABC44@<X0>(void **a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  (*(void (**)(void))(*v3 + 272))();
  swift_release();
  id v4 = (void *)v3[5];
  *a2 = v4;
  return v4;
}

void sub_21E4ABCCC(void **a1, uint64_t *a2)
{
  id v2 = *a1;
  uint64_t v3 = *a2;
  uint64_t KeyPath = swift_getKeyPath();
  void v7[2] = v3;
  v7[3] = v2;
  uint64_t v5 = *(void (**)(uint64_t, void (*)(), void *, uint64_t))(*(void *)v3 + 280);
  id v6 = v2;
  v5(KeyPath, sub_21E4AE984, v7, MEMORY[0x263F8EE60] + 8);
  swift_release();
}

uint64_t sub_21E4ABD94(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_21E4D9E90;
  *(_OWORD *)(v2 + 32) = xmmword_21E4D9EA0;
  sub_21E4CFFE0();
  *(void *)(v2 + 48) = a1;
  return v2;
}

uint64_t sub_21E4ABDF4(uint64_t a1)
{
  *(_OWORD *)(v1 + 16) = xmmword_21E4D9E90;
  *(_OWORD *)(v1 + 32) = xmmword_21E4D9EA0;
  sub_21E4CFFE0();
  *(void *)(v1 + 48) = a1;
  return v1;
}

void sub_21E4ABE40(void *a1)
{
  uint64_t v2 = v1;
  v39[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = *v1;
  uint64_t v5 = sub_21E4D0050();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  id v9 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(uint64_t (**)(void))(v4 + 152);
  uint64_t v11 = (void *)((uint64_t (*)(uint64_t))v10)(v7);

  if (v11) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = a1 == 0;
  }
  if (v12)
  {
    long long v13 = (void *)v10();

    if (v13) {
      BOOL v14 = a1 == 0;
    }
    else {
      BOOL v14 = 0;
    }
    int v15 = v14;
  }
  else
  {
    int v15 = 1;
  }
  uint64_t v16 = (void *)v10();
  if (v16)
  {
    uint64_t v17 = v16;
    if (a1)
    {
      id v18 = a1;
      unsigned int v19 = objc_msgSend(v17, sel__allFieldsAreEqual_, v18);

      if (((v19 ^ 1 | v15) & 1) == 0) {
        return;
      }
      goto LABEL_19;
    }
  }
  if (!v15) {
    return;
  }
  id v18 = a1;
LABEL_19:
  uint64_t v20 = sub_21E4B3930();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v9, v20, v5);
  id v21 = v18;
  unint64_t v22 = sub_21E4D0030();
  uint64_t v23 = v6;
  os_log_type_t v24 = sub_21E4D0CD0();
  if (os_log_type_enabled(v22, v24))
  {
    uint64_t v36 = v23;
    uint64_t v37 = v5;
    uint64_t v25 = swift_slowAlloc();
    id v34 = (void *)swift_slowAlloc();
    uint64_t v35 = swift_slowAlloc();
    v39[0] = v35;
    *(_DWORD *)uint64_t v25 = 136315394;
    uint64_t v26 = sub_21E4D10C0();
    unint64_t v38 = sub_21E489B2C(v26, v27, v39);
    sub_21E4D0D30();
    swift_bridgeObjectRelease();
    *(_WORD *)(v25 + 12) = 2112;
    if (a1)
    {
      unint64_t v38 = (unint64_t)v21;
      id v28 = v21;
    }
    else
    {
      unint64_t v38 = 0;
    }
    sub_21E4D0D30();
    double v29 = v34;
    *id v34 = a1;

    _os_log_impl(&dword_21E433000, v22, v24, "%s received activity summary %@", (uint8_t *)v25, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267D2FCB0);
    swift_arrayDestroy();
    MEMORY[0x223C29AE0](v29, -1, -1);
    uint64_t v30 = v35;
    swift_arrayDestroy();
    MEMORY[0x223C29AE0](v30, -1, -1);
    MEMORY[0x223C29AE0](v25, -1, -1);

    (*(void (**)(char *, uint64_t))(v36 + 8))(v9, v37);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v23 + 8))(v9, v5);
  }
  id v31 = *(void (**)(void *))(*v2 + 160);
  id v32 = v21;
  v31(a1);
}

void sub_21E4AC234(uint64_t a1)
{
  id v3 = *v1;
  swift_getKeyPath();
  (*((void (**)(void))*v1 + 34))();
  swift_release();
  if (v1[5]) {
    return;
  }
  uint64_t v4 = swift_allocObject();
  uint64_t v50 = v1;
  swift_weakInit();
  uint64_t v5 = (void *)swift_allocObject();
  void v5[2] = v4;
  v5[3] = a1;
  v5[4] = v3;
  id v6 = objc_allocWithZone(MEMORY[0x263F0A988]);
  void aBlock[4] = sub_21E4ACBC8;
  aBlock[5] = v5;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21E49BC7C;
  aBlock[3] = &block_descriptor_2;
  uint64_t v7 = _Block_copy(aBlock);
  swift_retain();
  id v49 = objc_msgSend(v6, sel_initWithUpdateHandler_, v7);
  _Block_release(v7);
  swift_release();
  swift_release();
  uint64_t v48 = sub_21E4835F8(0, (unint64_t *)&qword_26AB08630);
  uint64_t v8 = (void *)sub_21E4D0D00();
  long long v52 = xmmword_21E4D93A0;
  uint64_t v47 = v53;
  uint64_t v10 = (void *)*MEMORY[0x263F09EA0];
  v53[0] = *MEMORY[0x263F09EF8];
  id v9 = (void *)v53[0];
  v53[1] = v10;
  uint64_t v54 = (void *)*MEMORY[0x263F09DE0];
  uint64_t v11 = v54;
  BOOL v12 = self;
  id v13 = v9;
  id v14 = v10;
  id v15 = v11;
  uint64_t v16 = MEMORY[0x263F8EE80];
  uint64_t v17 = 4;
  while (1)
  {
    id v20 = (id)aBlock[v17 + 6];
    id v21 = objc_msgSend(v12, sel_quantityTypeForIdentifier_, v20, v47, v48);
    if (!v21) {
      goto LABEL_5;
    }
    unint64_t v22 = v21;
    if ((v16 & 0xC000000000000001) != 0)
    {
      if (v16 >= 0) {
        v16 &= 0xFFFFFFFFFFFFFF8uLL;
      }
      id v23 = v21;
      id v24 = v8;
      uint64_t v25 = sub_21E4D0EC0();
      if (__OFADD__(v25, 1)) {
        goto LABEL_27;
      }
      uint64_t v16 = sub_21E4ADC24(v16, v25 + 1);
    }
    else
    {
      id v26 = v21;
      id v27 = v8;
    }
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    aBlock[0] = v16;
    unint64_t v30 = sub_21E4ADE78((uint64_t)v22);
    uint64_t v31 = *(void *)(v16 + 16);
    BOOL v32 = (v29 & 1) == 0;
    uint64_t v33 = v31 + v32;
    if (__OFADD__(v31, v32)) {
      break;
    }
    char v34 = v29;
    if (*(void *)(v16 + 24) >= v33)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        uint64_t v16 = aBlock[0];
        if ((v29 & 1) == 0) {
          goto LABEL_20;
        }
      }
      else
      {
        sub_21E4AE2AC();
        uint64_t v16 = aBlock[0];
        if ((v34 & 1) == 0) {
          goto LABEL_20;
        }
      }
    }
    else
    {
      sub_21E4ADEBC(v33, isUniquelyReferenced_nonNull_native);
      unint64_t v35 = sub_21E4ADE78((uint64_t)v22);
      if ((v34 & 1) != (v36 & 1)) {
        goto LABEL_29;
      }
      unint64_t v30 = v35;
      uint64_t v16 = aBlock[0];
      if ((v34 & 1) == 0)
      {
LABEL_20:
        *(void *)(v16 + 8 * (v30 >> 6) + 64) |= 1 << v30;
        uint64_t v37 = 8 * v30;
        *(void *)(*(void *)(v16 + 48) + v37) = v22;
        *(void *)(*(void *)(v16 + 56) + v37) = v8;
        uint64_t v38 = *(void *)(v16 + 16);
        BOOL v39 = __OFADD__(v38, 1);
        uint64_t v40 = v38 + 1;
        if (v39) {
          goto LABEL_28;
        }
        *(void *)(v16 + 16) = v40;
        id v41 = v22;
        goto LABEL_4;
      }
    }
    uint64_t v18 = *(void *)(v16 + 56);
    uint64_t v19 = 8 * v30;

    *(void *)(v18 + v19) = v8;
LABEL_4:
    swift_bridgeObjectRelease();

LABEL_5:
    if (++v17 == 7)
    {
      type metadata accessor for HKQuantityTypeIdentifier();
      swift_arrayDestroy();

      sub_21E4835F8(0, &qword_267D2FF08);
      sub_21E4AE454();
      unint64_t v42 = (void *)sub_21E4D0A00();
      swift_bridgeObjectRelease();
      objc_msgSend(v49, sel__setCollectionIntervals_, v42);

      objc_msgSend(v50[6], sel_executeQuery_, v49);
      uint64_t KeyPath = swift_getKeyPath();
      MEMORY[0x270FA5388](KeyPath);
      v46[2] = v50;
      v46[3] = v49;
      id v44 = (void (*)(uint64_t, void (*)(), void *, uint64_t))*((void *)*v50 + 35);
      id v45 = v49;
      v44(KeyPath, sub_21E4AE4BC, v46, MEMORY[0x263F8EE60] + 8);
      swift_release();

      return;
    }
  }
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  sub_21E4835F8(0, &qword_267D2FF08);
  sub_21E4D1000();
  __break(1u);
}

uint64_t sub_21E4AC788()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_21E4AC7C0(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F780);
  MEMORY[0x270FA5388](v7 - 8);
  id v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a2)
  {
    uint64_t v26 = sub_21E4D0C50();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v9, 1, 1, v26);
    uint64_t v27 = swift_allocObject();
    swift_beginAccess();
    swift_weakLoadStrong();
    swift_weakInit();
    swift_release();
    sub_21E4D0C30();
    id v28 = a1;
    swift_retain();
    uint64_t v29 = sub_21E4D0C20();
    unint64_t v30 = (void *)swift_allocObject();
    uint64_t v31 = MEMORY[0x263F8F500];
    v30[2] = v29;
    v30[3] = v31;
    v30[4] = v27;
    v30[5] = a1;
    swift_release();
    sub_21E484AA0((uint64_t)v9, (uint64_t)&unk_267D2FF30, (uint64_t)v30);
    return swift_release();
  }
  os_log_type_t v10 = sub_21E4D0CB0();
  uint64_t v11 = (void *)*MEMORY[0x263F098C8];
  os_log_type_t v12 = v10;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], v10))
  {
    id v13 = a2;
    id v14 = a2;
    os_log_t v33 = v11;
    uint64_t v15 = swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    v35[0] = v16;
    *(_DWORD *)uint64_t v15 = 136315394;
    uint64_t v17 = sub_21E4D10C0();
    unint64_t v34 = sub_21E489B2C(v17, v18, v35);
    sub_21E4D0D30();
    swift_bridgeObjectRelease();
    *(_WORD *)(v15 + 12) = 2080;
    swift_getErrorValue();
    uint64_t v19 = sub_21E4D1020();
    unint64_t v34 = sub_21E489B2C(v19, v20, v35);
    sub_21E4D0D30();
    swift_bridgeObjectRelease();

    os_log_t v21 = v33;
    _os_log_impl(&dword_21E433000, v33, v12, "%s failed to query current activity summary: %s", (uint8_t *)v15, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x223C29AE0](v16, -1, -1);
    MEMORY[0x223C29AE0](v15, -1, -1);
  }
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v23 = result;
    uint64_t v24 = sub_21E4D0C50();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v9, 1, 1, v24);
    uint64_t v25 = (void *)swift_allocObject();
    v25[2] = 0;
    v25[3] = 0;
    v25[4] = v23;
    v25[5] = a4;
    sub_21E4848FC((uint64_t)v9, (uint64_t)&unk_267D2FF40, (uint64_t)v25);
    return swift_release();
  }
  return result;
}

uint64_t sub_21E4ACB90()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_21E4ACBC8(uint64_t a1, void *a2, void *a3)
{
  return sub_21E4AC7C0(a2, a3, *(void *)(v3 + 16), *(void *)(v3 + 24));
}

uint64_t sub_21E4ACBE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v7;
  *uint64_t v7 = v5;
  v7[1] = sub_21E485BA8;
  return sub_21E4ACF0C(a5);
}

uint64_t sub_21E4ACC7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[6] = a4;
  v5[7] = a5;
  void v5[5] = a1;
  sub_21E4D0C30();
  unsigned char v5[8] = sub_21E4D0C20();
  uint64_t v7 = sub_21E4D0C10();
  return MEMORY[0x270FA2498](sub_21E4ACD18, v7, v6);
}

uint64_t sub_21E4ACD18()
{
  swift_release();
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    sub_21E4ABE40(*(void **)(v0 + 56));
    swift_release();
  }
  **(unsigned char **)(v0 + 40) = Strong == 0;
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_21E4ACDC8()
{
  swift_getKeyPath();
  (*(void (**)(void))(*v0 + 272))();
  uint64_t result = swift_release();
  uint64_t v2 = (void *)v0[5];
  if (v2)
  {
    uint64_t v3 = (void *)v0[6];
    id v4 = v2;
    objc_msgSend(v3, sel_stopQuery_, v4);
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v6 = MEMORY[0x270FA5388](KeyPath);
    uint64_t v7 = v0;
    uint64_t v8 = 0;
    (*(void (**)(uint64_t, void (*)()))(*v0 + 280))(v6, sub_21E4AE984);

    return swift_release();
  }
  return result;
}

uint64_t sub_21E4ACF0C(uint64_t a1)
{
  v2[6] = a1;
  v2[7] = v1;
  uint64_t v3 = sub_21E4D0EA0();
  v2[8] = v3;
  v2[9] = *(void *)(v3 - 8);
  v2[10] = swift_task_alloc();
  uint64_t v4 = sub_21E4D0E90();
  v2[11] = v4;
  v2[12] = *(void *)(v4 - 8);
  v2[13] = swift_task_alloc();
  v2[14] = swift_task_alloc();
  uint64_t v5 = sub_21E4D0050();
  v2[15] = v5;
  v2[16] = *(void *)(v5 - 8);
  v2[17] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_21E4AD094, 0, 0);
}

uint64_t sub_21E4AD094()
{
  uint64_t v2 = *(void *)(v0 + 128);
  uint64_t v1 = *(void *)(v0 + 136);
  uint64_t v3 = *(void *)(v0 + 120);
  uint64_t v4 = sub_21E4B3930();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  uint64_t v5 = sub_21E4D0030();
  os_log_type_t v6 = sub_21E4D0CD0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = *(void *)(v0 + 48);
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 134217984;
    *(void *)(v0 + 40) = v7;
    sub_21E4D0D30();
    _os_log_impl(&dword_21E433000, v5, v6, "Restarting activity summary query. Retry attempt: %ld", v8, 0xCu);
    MEMORY[0x223C29AE0](v8, -1, -1);
  }

  uint64_t v9 = *(void *)(v0 + 48);
  uint64_t v10 = *(void *)(v0 + 56);
  uint64_t v11 = (*(uint64_t (**)(void, void))(*(void *)(v0 + 128) + 8))(*(void *)(v0 + 136), *(void *)(v0 + 120));
  uint64_t v12 = (*(uint64_t (**)(uint64_t))(*(void *)v10 + 248))(v11);
  uint64_t v17 = 5 * v9;
  if ((unsigned __int128)(v9 * (__int128)5) >> 64 == (5 * v9) >> 63)
  {
    uint64_t v18 = *(void *)(v0 + 104);
    uint64_t v19 = *(void *)(v0 + 88);
    uint64_t v20 = *(void *)(v0 + 96);
    if (v17 >= 300) {
      uint64_t v21 = 300;
    }
    else {
      uint64_t v21 = v17;
    }
    sub_21E4D0E70();
    MEMORY[0x223C28380](1000000000000000000 * v21, ((v21 >> 63) & 0xF21F494C589C0000) + (((unint64_t)v21 * (unsigned __int128)0xDE0B6B3A7640000uLL) >> 64));
    unint64_t v22 = *(void (**)(uint64_t, uint64_t))(v20 + 8);
    *(void *)(v0 + 144) = v22;
    *(void *)(v0 + 152) = (v20 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v22(v18, v19);
    *(void *)(v0 + 24) = 0;
    *(void *)(v0 + 16) = 0;
    *(unsigned char *)(v0 + 32) = 1;
    sub_21E4D1010();
    uint64_t v23 = (void *)swift_task_alloc();
    *(void *)(v0 + 160) = v23;
    uint64_t v16 = sub_21E4AE5B8(&qword_267D2FEC0, MEMORY[0x263F8F710]);
    *uint64_t v23 = v0;
    v23[1] = sub_21E4AD32C;
    uint64_t v12 = *(void *)(v0 + 112);
    uint64_t v14 = *(void *)(v0 + 80);
    uint64_t v15 = *(void *)(v0 + 64);
    uint64_t v13 = v0 + 16;
  }
  else
  {
    __break(1u);
  }
  return MEMORY[0x270FA1FF8](v12, v13, v14, v15, v16);
}

uint64_t sub_21E4AD32C()
{
  uint64_t v2 = (void *)*v1;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v4 = v2[9];
    uint64_t v3 = v2[10];
    uint64_t v5 = v2[8];

    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  }
  else
  {
    (*(void (**)(void, void))(v2[9] + 8))(v2[10], v2[8]);
  }
  return MEMORY[0x270FA2498](sub_21E4AD484, 0, 0);
}

uint64_t sub_21E4AD484()
{
  uint64_t v1 = *(void (**)(uint64_t, uint64_t))(v0 + 144);
  uint64_t v2 = *(void *)(v0 + 112);
  uint64_t v3 = *(void *)(v0 + 88);
  (*(void (**)(uint64_t))(**(void **)(v0 + 56) + 240))(*(void *)(v0 + 48) + 1);
  v1(v2, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_21E4AD55C()
{
  return sub_21E4CFFB0();
}

uint64_t sub_21E4AD5E4()
{
  return sub_21E4CFFA0();
}

id *sub_21E4AD6A4()
{
  uint64_t v1 = (char *)v0 + OBJC_IVAR____TtC9FitnessUI27FIUIActivitySummaryProvider___observationRegistrar;
  uint64_t v2 = sub_21E4CFFF0();
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t sub_21E4AD720()
{
  uint64_t v1 = (char *)v0 + OBJC_IVAR____TtC9FitnessUI27FIUIActivitySummaryProvider___observationRegistrar;
  uint64_t v2 = sub_21E4CFFF0();
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t sub_21E4AD7F0(uint64_t a1, uint64_t a2)
{
  return sub_21E4ADA8C(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_21E4AD808(uint64_t a1, id *a2)
{
  uint64_t result = sub_21E4D0AD0();
  *a2 = 0;
  return result;
}

uint64_t sub_21E4AD880(uint64_t a1, id *a2)
{
  char v3 = sub_21E4D0AE0();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_21E4AD900@<X0>(uint64_t *a1@<X8>)
{
  sub_21E4D0AF0();
  uint64_t v2 = sub_21E4D0AB0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_21E4AD944@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_21E4D0AB0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_21E4AD98C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_21E4D0AF0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_21E4AD9B8(uint64_t a1)
{
  uint64_t v2 = sub_21E4AE5B8(&qword_267D2FF78, (void (*)(uint64_t))type metadata accessor for HKQuantityTypeIdentifier);
  uint64_t v3 = sub_21E4AE5B8(&qword_267D2FF80, (void (*)(uint64_t))type metadata accessor for HKQuantityTypeIdentifier);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_21E4ADA74(uint64_t a1, uint64_t a2)
{
  return sub_21E4ADA8C(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_21E4ADA8C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_21E4D0AF0();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_21E4ADAD0()
{
  sub_21E4D0AF0();
  sub_21E4D0B40();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21E4ADB24()
{
  sub_21E4D0AF0();
  sub_21E4D1070();
  sub_21E4D0B40();
  uint64_t v0 = sub_21E4D10B0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_21E4ADB98()
{
  uint64_t v0 = sub_21E4D0AF0();
  uint64_t v2 = v1;
  if (v0 == sub_21E4D0AF0() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_21E4D0FB0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_21E4ADC24(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FF20);
    uint64_t v2 = sub_21E4D0F50();
    uint64_t v18 = v2;
    sub_21E4D0EB0();
    uint64_t v3 = sub_21E4D0ED0();
    if (v3)
    {
      uint64_t v4 = v3;
      sub_21E4835F8(0, &qword_267D2FF08);
      do
      {
        swift_dynamicCast();
        sub_21E4835F8(0, (unint64_t *)&qword_26AB08630);
        swift_dynamicCast();
        uint64_t v2 = v18;
        unint64_t v12 = *(void *)(v18 + 16);
        if (*(void *)(v18 + 24) <= v12)
        {
          sub_21E4ADEBC(v12 + 1, 1);
          uint64_t v2 = v18;
        }
        uint64_t result = sub_21E4D0D10();
        uint64_t v6 = v2 + 64;
        uint64_t v7 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v8 = result & ~v7;
        unint64_t v9 = v8 >> 6;
        if (((-1 << v8) & ~*(void *)(v2 + 64 + 8 * (v8 >> 6))) != 0)
        {
          unint64_t v10 = __clz(__rbit64((-1 << v8) & ~*(void *)(v2 + 64 + 8 * (v8 >> 6)))) | v8 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v13 = 0;
          unint64_t v14 = (unint64_t)(63 - v7) >> 6;
          do
          {
            if (++v9 == v14 && (v13 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v15 = v9 == v14;
            if (v9 == v14) {
              unint64_t v9 = 0;
            }
            v13 |= v15;
            uint64_t v16 = *(void *)(v6 + 8 * v9);
          }
          while (v16 == -1);
          unint64_t v10 = __clz(__rbit64(~v16)) + (v9 << 6);
        }
        *(void *)(v6 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
        uint64_t v11 = 8 * v10;
        *(void *)(*(void *)(v2 + 48) + v11) = v17;
        *(void *)(*(void *)(v2 + 56) + v11) = v4;
        ++*(void *)(v2 + 16);
        uint64_t v4 = sub_21E4D0ED0();
      }
      while (v4);
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x263F8EE80];
  }
  return v2;
}

unint64_t sub_21E4ADE78(uint64_t a1)
{
  uint64_t v2 = sub_21E4D0D10();
  return sub_21E4AE190(a1, v2);
}

uint64_t sub_21E4ADEBC(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FF20);
  uint64_t v6 = sub_21E4D0F40();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  char v36 = v2;
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v11) {
      break;
    }
    uint64_t v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v37 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v11) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v37 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v36;
          if ((a2 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v37 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v11) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v37 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v25;
      }
    }
LABEL_30:
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    uint64_t v30 = 8 * v21;
    uint64_t v31 = *(void **)(*(void *)(v5 + 48) + v30);
    uint64_t v32 = *(void **)(*(void *)(v5 + 56) + v30);
    if ((a2 & 1) == 0)
    {
      id v33 = v31;
      id v34 = v32;
    }
    uint64_t result = sub_21E4D0D10();
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t v19 = 8 * v18;
    *(void *)(*(void *)(v7 + 48) + v19) = v31;
    *(void *)(*(void *)(v7 + 56) + v19) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v36;
  uint64_t v23 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v23 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

unint64_t sub_21E4AE190(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    sub_21E4835F8(0, &qword_267D2FF08);
    id v6 = *(id *)(*(void *)(v2 + 48) + 8 * i);
    char v7 = sub_21E4D0D20();

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = ~v4;
      for (unint64_t i = (i + 1) & v8; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v8)
      {
        id v9 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v10 = sub_21E4D0D20();

        if (v10) {
          break;
        }
      }
    }
  }
  return i;
}

id sub_21E4AE2AC()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FF20);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_21E4D0F30();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    unint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    unint64_t v18 = *(void **)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    *(void *)(*(void *)(v4 + 56) + v16) = v18;
    id v19 = v17;
    id result = v18;
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v13) {
    goto LABEL_26;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

unint64_t sub_21E4AE454()
{
  unint64_t result = qword_267D2FF10;
  if (!qword_267D2FF10)
  {
    sub_21E4835F8(255, &qword_267D2FF08);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_267D2FF10);
  }
  return result;
}

void sub_21E4AE4BC()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void **)(v0 + 24);
  uint64_t v3 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = v2;
  id v4 = v2;
}

uint64_t sub_21E4AE4F4()
{
  return type metadata accessor for FIUIActivitySummaryProvider();
}

uint64_t sub_21E4AE4FC()
{
  uint64_t result = sub_21E4CFFF0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_21E4AE5B8(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void type metadata accessor for HKQuantityTypeIdentifier()
{
  if (!qword_267D2FF58)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_267D2FF58);
    }
  }
}

uint64_t sub_21E4AE658()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_21E4AE6A0(uint64_t a1)
{
  uint64_t v5 = *(void *)(v1 + 32);
  uint64_t v4 = *(void *)(v1 + 40);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_21E484808;
  return sub_21E4ACC7C(a1, v6, v7, v5, v4);
}

uint64_t sub_21E4AE74C()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_21E4AE78C()
{
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_21E485BA8;
  uint64_t v4 = (void *)swift_task_alloc();
  void v3[2] = v4;
  void *v4 = v3;
  v4[1] = sub_21E485BA8;
  return sub_21E4ACF0C(v2);
}

uint64_t sub_21E4AE870()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_21E4AE8A8()
{
  return sub_21E4AE5B8(&qword_267D2FF60, (void (*)(uint64_t))type metadata accessor for HKQuantityTypeIdentifier);
}

uint64_t sub_21E4AE8F0()
{
  return sub_21E4AE5B8(&qword_267D2FF68, (void (*)(uint64_t))type metadata accessor for HKQuantityTypeIdentifier);
}

uint64_t sub_21E4AE938()
{
  return sub_21E4AE5B8(&qword_267D2FF70, (void (*)(uint64_t))type metadata accessor for HKQuantityTypeIdentifier);
}

void sub_21E4AE984()
{
}

BOOL sub_21E4AE99C()
{
  return objc_msgSend(v0, sel_activityMoveMode) == (id)2;
}

BOOL sub_21E4AE9C8()
{
  if (objc_msgSend(v0, sel_activityMoveMode) == (id)2)
  {
    id v1 = objc_msgSend(v0, sel_appleMoveTimeGoal);
    id v2 = objc_msgSend(self, sel_minuteUnit);
  }
  else
  {
    id v1 = objc_msgSend(v0, sel_activeEnergyBurnedGoal);
    id v2 = objc_msgSend(self, sel_kilocalorieUnit);
  }
  id v3 = v2;
  objc_msgSend(v1, sel_doubleValueForUnit_, v3);
  double v5 = v4;

  return v5 <= 0.0;
}

id sub_21E4AEAA8()
{
  id v1 = objc_msgSend(v0, sel_activityMoveMode);
  id v2 = &selRef__moveMinutesCompletionPercentage;
  if (v1 != (id)2) {
    id v2 = &selRef__activeEnergyCompletionPercentage;
  }
  id v3 = *v2;
  return [v0 v3];
}

id sub_21E4AEAFC()
{
  return sub_21E4AEC10(500.0, 500.0, 30.0, 30.0, 12.0, 12.0);
}

id sub_21E4AEB24()
{
  return sub_21E4AEC10(500.0, 345.0, 30.0, 43.0, 12.0, 10.0);
}

void *sub_21E4AEB58(void *result)
{
  if (result)
  {
    id v1 = result;
    BOOL v2 = sub_21E4AE9C8();

    return (void *)v2;
  }
  return result;
}

void *sub_21E4AEB94(void *result)
{
  if (result) {
    return (void *)(objc_msgSend(result, sel_activityMoveMode) == (id)2);
  }
  return result;
}

id sub_21E4AEBC4()
{
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0A090]), sel_init);
  return objc_msgSend(v1, sel__initWithActivityCache_shouldIncludePrivateProperties_, v0, 1);
}

id sub_21E4AEC10(double a1, double a2, double a3, double a4, double a5, double a6)
{
  id v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0A090]), sel_init);
  int64_t v13 = self;
  id v14 = objc_msgSend(v13, sel_kilocalorieUnit);
  unint64_t v15 = self;
  id v16 = objc_msgSend(v15, sel_quantityWithUnit_doubleValue_, v14, a1);

  objc_msgSend(v12, sel_setActiveEnergyBurnedGoal_, v16);
  id v17 = objc_msgSend(v13, sel_kilocalorieUnit);
  id v18 = objc_msgSend(v15, sel_quantityWithUnit_doubleValue_, v17, a2);

  objc_msgSend(v12, sel_setActiveEnergyBurned_, v18);
  id v19 = objc_msgSend(v13, sel_minuteUnit);
  id v20 = objc_msgSend(v15, sel_quantityWithUnit_doubleValue_, v19, a3);

  objc_msgSend(v12, sel_setAppleExerciseTimeGoal_, v20);
  id v21 = objc_msgSend(v13, sel_minuteUnit);
  id v22 = objc_msgSend(v15, sel_quantityWithUnit_doubleValue_, v21, a4);

  objc_msgSend(v12, sel_setAppleExerciseTime_, v22);
  id v23 = objc_msgSend(v13, sel_countUnit);
  id v24 = objc_msgSend(v15, sel_quantityWithUnit_doubleValue_, v23, a5);

  objc_msgSend(v12, sel_setAppleStandHoursGoal_, v24);
  id v25 = objc_msgSend(v13, sel_countUnit);
  id v26 = objc_msgSend(v15, sel_quantityWithUnit_doubleValue_, v25, a6);

  objc_msgSend(v12, sel_setAppleStandHours_, v26);
  return v12;
}

BOOL sub_21E4AEEB4(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_21E4AEEC4()
{
  return sub_21E4D1080();
}

uint64_t sub_21E4AEEEC()
{
  return sub_21E4D10B0();
}

BOOL sub_21E4AEF34(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

double sub_21E4AEF48(double a1, double a2)
{
  return a2;
}

uint64_t sub_21E4AEF50(unsigned int a1)
{
  return (a1 >> 8) & 1;
}

uint64_t sub_21E4AEF58()
{
  return sub_21E4D10B0();
}

void sub_21E4AEFB8(__int16 a1@<W1>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_21E4D04A0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!(_BYTE)a1)
  {
LABEL_5:
    id v8 = objc_msgSend(self, sel_energyColors);
    if (!v8)
    {
      __break(1u);
LABEL_7:
      id v8 = objc_msgSend(self, sel_sedentaryColors);
      if (!v8) {
        goto LABEL_17;
      }
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (a1 != 1) {
    goto LABEL_7;
  }
  id v8 = objc_msgSend(self, sel_briskColors);
  if (!v8)
  {
    __break(1u);
    goto LABEL_5;
  }
LABEL_8:
  if ((a1 & 0x100) == 0)
  {
    (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x263F19978], v4);
    char v9 = sub_21E4D0490();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    if ((v9 & 1) == 0)
    {
      id v11 = sub_21E4B31A4();
      goto LABEL_15;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F8D8);
    uint64_t v10 = swift_allocObject();
    *(_OWORD *)(v10 + 16) = xmmword_21E4D9230;
    if (objc_msgSend(v8, sel_highContrastTextColor))
    {
LABEL_13:
      *(void *)(v10 + 32) = MEMORY[0x223C27C40]();
      *(void *)&long long v14 = v10;
      sub_21E4D0BE0();
      id v11 = (id)v14;
LABEL_15:
      sub_21E4D0840();
      sub_21E4D0850();
      MEMORY[0x223C27D20](v11);
      sub_21E4D02B0();

      long long v12 = v15;
      *(_OWORD *)a2 = v14;
      *(_OWORD *)(a2 + 16) = v12;
      *(void *)(a2 + 32) = v16;
      return;
    }
    __break(1u);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F8D8);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_21E4D9230;
  if (objc_msgSend(v8, sel_adjustmentButtonBackgroundColor)) {
    goto LABEL_13;
  }
  __break(1u);
LABEL_17:
  __break(1u);
}

uint64_t sub_21E4AF27C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5, char a6, __int16 a7)
{
  if (a5 == 3) {
    unsigned __int8 v7 = a7;
  }
  else {
    unsigned __int8 v7 = a5;
  }
  if (a6 == 2) {
    char v8 = HIBYTE(a7) & 1;
  }
  else {
    char v8 = a6;
  }
  if (v8) {
    int v9 = 256;
  }
  else {
    int v9 = 0;
  }
  return v9 & 0xFFFFFF00 | v7;
}

uint64_t sub_21E4AF2C4(unsigned __int8 a1, char a2)
{
  if (a2) {
    int v2 = 256;
  }
  else {
    int v2 = 0;
  }
  return v2 & 0xFFFFFF00 | a1;
}

uint64_t sub_21E4AF2DC()
{
  return sub_21E4D1090();
}

uint64_t sub_21E4AF33C(__int16 a1, __int16 a2, double a3, double a4, double a5, double a6)
{
  BOOL v6 = a3 == a5;
  if (a4 != a6) {
    BOOL v6 = 0;
  }
  if (a2 != a1) {
    BOOL v6 = 0;
  }
  return v6 & (((a1 & 0x100) == 0) ^ ((unsigned __int16)(a2 & 0x100) >> 8));
}

uint64_t sub_21E4AF370()
{
  return sub_21E4D10B0();
}

uint64_t sub_21E4AF3DC()
{
  return sub_21E4AF2DC();
}

uint64_t sub_21E4AF3FC()
{
  return sub_21E4D10B0();
}

unint64_t sub_21E4AF468()
{
  unint64_t result = qword_267D2FF88;
  if (!qword_267D2FF88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2FF88);
  }
  return result;
}

unint64_t sub_21E4AF4C0()
{
  unint64_t result = qword_267D2FF90;
  if (!qword_267D2FF90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2FF90);
  }
  return result;
}

uint64_t sub_21E4AF514()
{
  return MEMORY[0x263F8D6D8];
}

uint64_t sub_21E4AF520@<X0>(uint64_t *a1@<X8>)
{
  sub_21E4D1070();
  sub_21E4AF2DC();
  uint64_t result = sub_21E4D10B0();
  *a1 = result;
  return result;
}

uint64_t sub_21E4AF59C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = *(double *)a1 == *(double *)a2;
  if (*(double *)(a1 + 8) != *(double *)(a2 + 8)) {
    BOOL v2 = 0;
  }
  BOOL v3 = *(unsigned __int8 *)(a1 + 16) == *(unsigned __int8 *)(a2 + 16) && v2;
  return v3 & (*(unsigned __int8 *)(a2 + 17) ^ *(unsigned __int8 *)(a1 + 17) ^ 1u);
}

__n128 __swift_memcpy18_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u16[0] = a2[1].n128_u16[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for ChartMarkInfo(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 18)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 17);
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for ChartMarkInfo(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_WORD *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 18) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 18) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 17) = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ChartMarkInfo()
{
  return &type metadata for ChartMarkInfo;
}

uint64_t getEnumTagSinglePayload for ChartMarkInfo.MarkType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ChartMarkInfo.MarkType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *__n128 result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x21E4AF7F4);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *__n128 result = a2 + 2;
        break;
    }
  }
  return result;
}

unsigned char *sub_21E4AF81C(unsigned char *result, char a2)
{
  *__n128 result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ChartMarkInfo.MarkType()
{
  return &type metadata for ChartMarkInfo.MarkType;
}

id UIStackView.alignment(_:)(uint64_t a1)
{
  objc_msgSend(v1, sel_setAlignment_, a1);
  return v3;
}

id UIStackView.spacing(_:)()
{
  objc_msgSend(v0, sel_setSpacing_);
  return v2;
}

id UIStackView.axis(_:)(uint64_t a1)
{
  objc_msgSend(v1, sel_setAxis_, a1);
  return v3;
}

id UIStackView.distribution(_:)(uint64_t a1)
{
  objc_msgSend(v1, sel_setDistribution_, a1);
  return v3;
}

id UIStackView.layoutMarginsRelativeArrangement(_:)(char a1)
{
  objc_msgSend(v1, sel_setLayoutMarginsRelativeArrangement_, a1 & 1);
  return v3;
}

uint64_t sub_21E4AF998@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4AF9A4(v1 + 8, a1);
}

uint64_t sub_21E4AF9A4(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_21E4AFA00()
{
  return 1800;
}

uint64_t sub_21E4AFA08()
{
  return 900;
}

uint64_t sub_21E4AFA10()
{
  return 12;
}

uint64_t sub_21E4AFA18()
{
  return 4;
}

double sub_21E4AFA20()
{
  return 21600.0;
}

id sub_21E4AFA34()
{
  uint64_t v0 = sub_21E4CFEC0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  id v3 = (char *)&v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_21E4CFEE0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  BOOL v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FE00);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08790]), sel_init);
  sub_21E4CFEA0();
  sub_21E4CFED0();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_21E4CFEB0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  uint64_t v12 = sub_21E4CFE70();
  uint64_t v13 = *(void *)(v12 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v10, 1, v12) == 1)
  {
    sub_21E489000((uint64_t)v10, &qword_267D2FE00);
  }
  else
  {
    uint64_t v14 = sub_21E4CFE60();
    uint64_t v16 = v15;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v10, v12);
    uint64_t v21 = v14;
    uint64_t v22 = v16;
    uint64_t v19 = 26746;
    unint64_t v20 = 0xE200000000000000;
    sub_21E48BAE8();
    if (sub_21E4D0D70())
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v21 = v14;
      uint64_t v22 = v16;
      uint64_t v19 = 24938;
      unint64_t v20 = 0xE200000000000000;
      sub_21E4D0D70();
      swift_bridgeObjectRelease();
    }
  }
  id v17 = (void *)sub_21E4D0AB0();
  swift_bridgeObjectRelease();
  objc_msgSend(v11, sel_setLocalizedDateFormatFromTemplate_, v17);

  return v11;
}

id sub_21E4AFD6C()
{
  return *(id *)(v0 + 144);
}

void sub_21E4AFD74(uint64_t a1)
{
  *(void *)(v1 + 144) = a1;
}

uint64_t (*sub_21E4AFDA0())()
{
  return nullsub_1;
}

uint64_t sub_21E4AFDC0()
{
  return sub_21E4B0734((SEL *)&selRef_appleMoveTimeResults, 0);
}

uint64_t sub_21E4AFDD0(unint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4 = v3;
  LODWORD(v89) = a3;
  uint64_t v77 = a2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F938);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v76 = (char *)&v73 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v87 = sub_21E4D0050();
  uint64_t v84 = *(void *)(v87 - 8);
  MEMORY[0x270FA5388](v87);
  uint64_t v82 = (char *)&v73 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_21E4CFF80();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v73 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_21E4CFE10();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  id v17 = (char *)&v73 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v73 - v18;
  uint64_t v20 = sub_21E4A3B1C(0, 47);
  sub_21E4CFF60();
  sub_21E4CFE00();
  uint64_t v88 = v19;
  sub_21E4CFEF0();
  uint64_t v21 = *(void (**)(char *, uint64_t))(v14 + 8);
  uint64_t v90 = v17;
  uint64_t v91 = v21;
  uint64_t v92 = v14 + 8;
  uint64_t v93 = v13;
  v21(v17, v13);
  uint64_t v22 = v12;
  uint64_t v23 = v4;
  (*(void (**)(char *, uint64_t))(v10 + 8))(v22, v9);
  sub_21E4B2B0C(v4);
  uint64_t v24 = sub_21E4B2180(v20, v4, v89);
  sub_21E491BDC(v4);
  swift_release();
  unint64_t v89 = a1;
  if (!a1) {
    goto LABEL_40;
  }
  if (v89 >> 62) {
    goto LABEL_38;
  }
  uint64_t v25 = *(void *)((v89 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t result = swift_bridgeObjectRetain();
  BOOL v28 = v82;
  if (!v25)
  {
LABEL_39:
    swift_bridgeObjectRelease();
LABEL_40:
    v91(v88, v93);
    return v24;
  }
  while (1)
  {
    uint64_t v29 = *(void *)(v23 + 104);
    if (!v29) {
      break;
    }
    unint64_t v86 = v89 & 0xC000000000000001;
    uint64_t v80 = (void (**)(char *, uint64_t))(v84 + 8);
    uint64_t v81 = (void (**)(char *, uint64_t, uint64_t))(v84 + 16);
    uint64_t v30 = 4;
    *(void *)&long long v27 = 136315650;
    long long v75 = v27;
    unint64_t v74 = 0x800000021E4DF640;
    uint64_t v73 = MEMORY[0x263F8EE58] + 8;
    uint64_t v83 = v25;
    uint64_t v85 = v29;
    while (1)
    {
      id v31 = v86 ? (id)MEMORY[0x223C282E0](v30 - 4, v89) : *(id *)(v89 + 8 * v30);
      uint64_t v32 = v31;
      uint64_t v33 = v30 - 3;
      if (__OFADD__(v30 - 4, 1)) {
        break;
      }
      id v34 = objc_msgSend(v31, sel_startDate, v73);
      uint64_t v23 = (uint64_t)v90;
      sub_21E4CFDF0();

      sub_21E4CFDC0();
      double v36 = v35;
      v91((char *)v23, v93);
      if ((~*(void *)&v36 & 0x7FF0000000000000) == 0) {
        goto LABEL_33;
      }
      if (v36 <= -9.22337204e18) {
        goto LABEL_34;
      }
      if (v36 >= 9.22337204e18) {
        goto LABEL_35;
      }
      uint64_t v37 = (uint64_t)v36;
      if (v29 == -1 && v37 == 0x8000000000000000) {
        goto LABEL_36;
      }
      uint64_t v38 = v37 / v29;
      if (v38 < 0 || v38 >= *(void *)(v24 + 16))
      {
        uint64_t v84 = v24;
        uint64_t v55 = sub_21E4B3930();
        (*v81)(v28, v55, v87);
        id v56 = v32;
        uint64_t v23 = (uint64_t)v28;
        uint64_t v57 = sub_21E4D0030();
        os_log_type_t v58 = sub_21E4D0CB0();
        int v59 = v58;
        if (os_log_type_enabled(v57, v58))
        {
          uint64_t v60 = swift_slowAlloc();
          int v79 = v59;
          uint64_t v61 = v60;
          uint64_t v78 = swift_slowAlloc();
          uint64_t v94 = v78;
          *(_DWORD *)uint64_t v61 = v75;
          *(void *)(v61 + 4) = sub_21E489B2C(0xD000000000000027, v74, &v94);
          *(_WORD *)(v61 + 12) = 2048;
          *(void *)(v61 + 14) = v38;
          *(_WORD *)(v61 + 22) = 2080;
          id v62 = objc_msgSend(v56, sel_startDate);
          char v63 = v28;
          uint64_t v64 = v90;
          sub_21E4CFDF0();

          uint64_t v65 = v76;
          sub_21E4CFEA0();
          uint64_t v66 = sub_21E4CFEE0();
          (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v66 - 8) + 56))(v65, 0, 1, v66);
          uint64_t v67 = sub_21E4CFDB0();
          unint64_t v69 = v68;
          uint64_t v70 = (uint64_t)v65;
          uint64_t v71 = v87;
          sub_21E489000(v70, &qword_267D2F938);
          v91(v64, v93);
          *(void *)(v61 + 24) = sub_21E489B2C(v67, v69, &v94);

          swift_bridgeObjectRelease();
          _os_log_impl(&dword_21E433000, v57, (os_log_type_t)v79, "%s Invalid array index: %ld, for date: %s", (uint8_t *)v61, 0x20u);
          uint64_t v23 = v78;
          swift_arrayDestroy();
          MEMORY[0x223C29AE0](v23, -1, -1);
          MEMORY[0x223C29AE0](v61, -1, -1);

          uint64_t v72 = v71;
          uint64_t v25 = v83;
          (*v80)(v63, v72);
          BOOL v28 = v63;
        }
        else
        {

          (*v80)(v28, v87);
        }
        uint64_t v24 = v84;
      }
      else
      {
        uint64_t v23 = 24 * v38;
        BOOL v39 = (void *)v24;
        uint64_t v40 = v24 + 24 * v38;
        __int16 v41 = *(unsigned __int8 *)(v40 + 48);
        int v42 = *(unsigned __int8 *)(v40 + 49);
        id v43 = objc_msgSend(v32, sel_quantityValue);
        if (v43
          && (id v44 = v43,
              objc_msgSend(v43, sel_doubleValueForUnit_, v77),
              uint64_t v46 = v45,
              v44,
              *(double *)&v46 > 0.0))
        {
          if (v42) {
            __int16 v47 = 256;
          }
          else {
            __int16 v47 = 0;
          }
          __int16 v48 = sub_21E4AF27C(0, 1, v46, 0, 3u, 0, v47 | v41);
          uint64_t v50 = v49;
          uint64_t v52 = v51;
          __int16 v53 = v48;
          uint64_t v24 = (uint64_t)v39;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v24 = (uint64_t)sub_21E4B1E3C(v39);
          }
          BOOL v28 = v82;
          uint64_t v25 = v83;
          if ((unint64_t)v38 >= *(void *)(v24 + 16)) {
            goto LABEL_37;
          }
          uint64_t v54 = v24 + v23;
          *(void *)(v54 + 32) = v50;
          *(void *)(v54 + 40) = v52;
          *(unsigned char *)(v54 + 48) = v53;
          *(unsigned char *)(v54 + 49) = HIBYTE(v53) & 1;
        }
        else
        {

          uint64_t v24 = (uint64_t)v39;
          BOOL v28 = v82;
          uint64_t v25 = v83;
        }
      }
      ++v30;
      uint64_t v29 = v85;
      if (v33 == v25) {
        goto LABEL_39;
      }
    }
    __break(1u);
LABEL_33:
    __break(1u);
LABEL_34:
    __break(1u);
LABEL_35:
    __break(1u);
LABEL_36:
    __break(1u);
LABEL_37:
    __break(1u);
LABEL_38:
    swift_bridgeObjectRetain();
    uint64_t result = sub_21E4D0F20();
    uint64_t v25 = result;
    BOOL v28 = v82;
    if (!result) {
      goto LABEL_39;
    }
  }
  __break(1u);
  return result;
}

id sub_21E4B0614()
{
  sub_21E48BE28(v0, (uint64_t)&v8, &qword_267D2FF98);
  sub_21E48BE28((uint64_t)&v8, (uint64_t)&v9, &qword_267D2FF98);
  if (v9 && (id v1 = objc_msgSend(v9, sel_activeEnergyResults)) != 0)
  {
    uint64_t v2 = v1;
    sub_21E4835F8(0, &qword_267D2F758);
    unint64_t v3 = sub_21E4D0BD0();
  }
  else
  {
    unint64_t v3 = 0;
  }
  id result = objc_msgSend(*(id *)(v0 + 24), sel_unitManager);
  if (result)
  {
    uint64_t v5 = result;
    id v6 = objc_msgSend(result, sel_userActiveEnergyBurnedUnit);

    uint64_t v7 = sub_21E4AFDD0(v3, (uint64_t)v6, 0);
    swift_bridgeObjectRelease();
    return (id)v7;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_21E4B0724()
{
  return sub_21E4B0734((SEL *)&selRef_appleExerciseTimeResults, 1);
}

uint64_t sub_21E4B0734(SEL *a1, int a2)
{
  sub_21E48BE28(v2, (uint64_t)&v11, &qword_267D2FF98);
  sub_21E48BE28((uint64_t)&v11, (uint64_t)&v12, &qword_267D2FF98);
  if (v12 && (id v5 = [v12 *a1]) != 0)
  {
    id v6 = v5;
    sub_21E4835F8(0, &qword_267D2F758);
    unint64_t v7 = sub_21E4D0BD0();
  }
  else
  {
    unint64_t v7 = 0;
  }
  id v8 = objc_msgSend(self, sel_minuteUnit);
  uint64_t v9 = sub_21E4AFDD0(v7, (uint64_t)v8, a2);

  swift_bridgeObjectRelease();
  return v9;
}

void sub_21E4B082C()
{
  id v1 = v0;
  uint64_t v2 = sub_21E4CFF80();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  id v5 = (char *)&v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v6 = sub_21E4CFE10();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  id v12 = (char *)&v40 - v11;
  sub_21E4CFF60();
  sub_21E4CFE00();
  uint64_t v45 = v12;
  sub_21E4CFEF0();
  uint64_t v15 = *(void (**)(void, void))(v7 + 8);
  uint64_t v13 = v7 + 8;
  uint64_t v14 = v15;
  v15(v10, v6);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_21E48BE28((uint64_t)v1, (uint64_t)v46, &qword_267D2FF98);
  sub_21E48BE28((uint64_t)v46, (uint64_t)&v47, &qword_267D2FF98);
  if (v47 && (id v16 = objc_msgSend(v47, sel_appleStandHourResults)) != 0)
  {
    id v17 = v16;
    sub_21E4835F8(0, &qword_267D2F760);
    unint64_t v18 = sub_21E4D0BD0();

    if (v18 >> 62) {
      goto LABEL_34;
    }
    uint64_t v19 = *(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10);
    while (1)
    {
      uint64_t v42 = v13;
      unint64_t v43 = v6;
      __int16 v41 = v14;
      if (!v19)
      {
LABEL_26:
        swift_bridgeObjectRelease();
        unint64_t v6 = v43;
        uint64_t v14 = v41;
        goto LABEL_27;
      }
      uint64_t v20 = v1[12];
      if (!v20) {
        break;
      }
      if (v19 < 1) {
        goto LABEL_36;
      }
      uint64_t v13 = 0;
      uint64_t v44 = v1[13];
      unint64_t v6 = v18 & 0xC000000000000001;
      id v1 = (void *)MEMORY[0x263F8EE78];
      unint64_t v21 = v18;
      while (1)
      {
        id v22 = v6 ? (id)MEMORY[0x223C282E0](v13, v18) : *(id *)(v18 + 8 * v13 + 32);
        uint64_t v14 = v22;
        objc_msgSend(v22, sel_timeStamp);
        double v24 = v23;
        uint64_t v25 = (void *)sub_21E4CFDE0();
        double v26 = MEMORY[0x223C285F0]();

        double v27 = v24 - v26;
        if ((~COERCE__INT64(v24 - v26) & 0x7FF0000000000000) == 0) {
          break;
        }
        if (v27 <= -9.22337204e18) {
          goto LABEL_29;
        }
        if (v27 >= 9.22337204e18) {
          goto LABEL_30;
        }
        uint64_t v28 = (uint64_t)v27;
        if (v20 == -1 && v28 == 0x8000000000000000) {
          goto LABEL_33;
        }
        uint64_t v29 = v28 / v20;
        uint64_t v30 = v28 / v20 * v20;
        if ((unsigned __int128)(v29 * (__int128)v20) >> 64 != v30 >> 63) {
          goto LABEL_31;
        }
        if (__OFADD__(v30, v44)) {
          goto LABEL_32;
        }
        sub_21E4837E4();
        __int16 v31 = sub_21E4AF2C4(2u, objc_msgSend(v14, sel_state) == (id)1);
        uint64_t v33 = v32;
        uint64_t v35 = v34;
        __int16 v36 = v31;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          id v1 = sub_21E4B1988(0, v1[2] + 1, 1, v1);
        }
        unint64_t v38 = v1[2];
        unint64_t v37 = v1[3];
        if (v38 >= v37 >> 1) {
          id v1 = sub_21E4B1988((void *)(v37 > 1), v38 + 1, 1, v1);
        }
        ++v13;
        void v1[2] = v38 + 1;
        BOOL v39 = &v1[3 * v38];
        v39[4] = v33;
        v39[5] = v35;
        *((unsigned char *)v39 + 48) = v36;
        *((unsigned char *)v39 + 49) = HIBYTE(v36) & 1;

        unint64_t v18 = v21;
        if (v19 == v13) {
          goto LABEL_26;
        }
      }
      __break(1u);
LABEL_29:
      __break(1u);
LABEL_30:
      __break(1u);
LABEL_31:
      __break(1u);
LABEL_32:
      __break(1u);
LABEL_33:
      __break(1u);
LABEL_34:
      swift_bridgeObjectRetain();
      uint64_t v19 = sub_21E4D0F20();
      swift_bridgeObjectRelease();
    }
    __break(1u);
LABEL_36:
    __break(1u);
  }
  else
  {
LABEL_27:
    ((void (*)(char *, unint64_t))v14)(v45, v6);
  }
}

uint64_t sub_21E4B0CB0()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FFA0);
  uint64_t v36 = *(void *)(v0 - 8);
  uint64_t v37 = v0;
  MEMORY[0x270FA5388](v0);
  uint64_t v2 = (char *)&v28 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = sub_21E4CFC50();
  uint64_t v34 = *(void *)(v29 - 8);
  MEMORY[0x270FA5388](v29);
  uint64_t v4 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_21E4CFF80();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_21E4CFE10();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v28 - v14;
  sub_21E4CFF60();
  sub_21E4CFE00();
  sub_21E4CFEF0();
  unint64_t v38 = *(void (**)(char *, uint64_t))(v10 + 8);
  uint64_t v39 = v10 + 8;
  v38(v13, v9);
  id v16 = v8;
  uint64_t v17 = (uint64_t)v35;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v16, v5);
  uint64_t v19 = *(void *)(v17 + 128);
  if (v19 < 0)
  {
    __break(1u);
  }
  else
  {
    if (v19)
    {
      uint64_t v20 = *(void (**)(char *, char *, uint64_t))(v10 + 16);
      uint64_t v32 = (void (**)(char *, char *, uint64_t))(v34 + 16);
      uint64_t v33 = v20;
      unint64_t v21 = (void (**)(char *, uint64_t))(v34 + 8);
      uint64_t v22 = v29;
      uint64_t v34 = v10 + 16;
      uint64_t v30 = (void (**)(char *, char *, uint64_t))(v10 + 32);
      __int16 v31 = v21;
      unint64_t v23 = MEMORY[0x263F8EE78];
      uint64_t v35 = v2;
      do
      {
        v33(v13, v15, v9);
        sub_21E4CFC30();
        uint64_t v24 = *(int *)(v37 + 48);
        (*v32)(v2, v4, v22);
        *(void *)&v2[v24] = 0;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v23 = sub_21E4B1ABC(0, *(void *)(v23 + 16) + 1, 1, v23);
        }
        unint64_t v26 = *(void *)(v23 + 16);
        unint64_t v25 = *(void *)(v23 + 24);
        if (v26 >= v25 >> 1) {
          unint64_t v23 = sub_21E4B1ABC(v25 > 1, v26 + 1, 1, v23);
        }
        *(void *)(v23 + 16) = v26 + 1;
        uint64_t v27 = v23
            + ((*(unsigned __int8 *)(v36 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80))
            + *(void *)(v36 + 72) * v26;
        uint64_t v2 = v35;
        sub_21E48BE28((uint64_t)v35, v27, &qword_267D2FFA0);
        sub_21E4CFC20();
        (*v31)(v4, v22);
        v38(v15, v9);
        (*v30)(v15, v13, v9);
        --v19;
      }
      while (v19);
    }
    else
    {
      unint64_t v23 = MEMORY[0x263F8EE78];
    }
    v38(v15, v9);
    return v23;
  }
  return result;
}

uint64_t sub_21E4B1120(char a1, uint64_t a2)
{
  uint64_t v3 = v2;
  long long v6 = *(_OWORD *)(v2 + 56);
  v25[2] = *(_OWORD *)(v2 + 40);
  v25[3] = v6;
  v25[4] = *(_OWORD *)(v2 + 72);
  uint64_t v26 = *(void *)(v2 + 88);
  long long v7 = *(_OWORD *)(v2 + 24);
  v25[0] = *(_OWORD *)(v2 + 8);
  v25[1] = v7;
  sub_21E48BE28((uint64_t)v25, (uint64_t)v27, &qword_267D2F988);
  sub_21E48BE28((uint64_t)v27, (uint64_t)v28, &qword_267D2F988);
  if (v28[0] && (objc_msgSend(v28[0], sel_paused) & 1) != 0) {
    return 0;
  }
  uint64_t result = sub_21E4B0CB0();
  unint64_t v10 = result;
  unint64_t v11 = *(void *)(a2 + 16);
  if (!v11)
  {
LABEL_25:
    id v22 = sub_21E4B69E4();
    sub_21E4B6A0C(v22, 0, 0);

    if (a1)
    {
      if (a1 == 1) {
        uint64_t v23 = sub_21E48F7A8();
      }
      else {
        uint64_t v23 = swift_bridgeObjectRetain();
      }
    }
    else
    {
      uint64_t v23 = (uint64_t)sub_21E48F630();
    }
    MEMORY[0x270FA5388](v23);
    uint64_t v24 = swift_bridgeObjectRetain();
    sub_21E4B23A8(v24, (uint64_t (*)(uint64_t, double))sub_21E4B1AAC);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F9A8);
    sub_21E4B2504();
    uint64_t v8 = sub_21E4D0A70();
    swift_bridgeObjectRelease();
    return v8;
  }
  uint64_t v12 = *(void *)(v2 + 120);
  if (v12)
  {
    if (!__OFSUB__(v12, 1))
    {
      uint64_t result = swift_bridgeObjectRetain();
      int64_t v13 = 0;
      uint64_t v14 = 0;
      unint64_t v15 = v11 - 1;
      while (1)
      {
        unint64_t v16 = v14 <= v11 ? v11 : v14;
        uint64_t v17 = 24 * v14 + 40;
        double v18 = 0.0;
        while (1)
        {
          if (v16 == v14)
          {
            __break(1u);
            goto LABEL_33;
          }
          double v18 = v18 + *(double *)(a2 + v17);
          if (v14 % v12 == v12 - 1) {
            break;
          }
          if (v13 < *(void *)(v3 + 128))
          {
            v17 += 24;
            BOOL v19 = v15 == v14++;
            if (!v19) {
              continue;
            }
          }
          goto LABEL_24;
        }
        uint64_t result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          uint64_t result = sub_21E4B1E50(v10);
          unint64_t v10 = result;
        }
        if ((unint64_t)v13 >= *(void *)(v10 + 16)) {
          goto LABEL_35;
        }
        uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FFA0);
        uint64_t v21 = *(void *)(v20 - 8);
        uint64_t result = v20 - 8;
        *(double *)(v10
                  + ((*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80))
                  + *(void *)(v21 + 72) * v13++
                  + *(int *)(result + 56)) = v18;
        if (v13 < *(void *)(v3 + 128))
        {
          BOOL v19 = v15 == v14++;
          if (!v19) {
            continue;
          }
        }
LABEL_24:
        swift_bridgeObjectRelease();
        goto LABEL_25;
      }
    }
  }
  else
  {
LABEL_33:
    __break(1u);
  }
  __break(1u);
LABEL_35:
  __break(1u);
  return result;
}

void sub_21E4B1494(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, double a7)
{
  uint64_t v32 = a2;
  uint64_t v33 = a3;
  uint64_t v34 = a1;
  uint64_t v11 = sub_21E4CFE10();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F950);
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_21E4DA250;
  *(void *)(v15 + 56) = MEMORY[0x263F8D310];
  unint64_t v16 = sub_21E48B95C();
  *(void *)(v15 + 64) = v16;
  *(void *)(v15 + 32) = a4;
  *(void *)(v15 + 40) = a5;
  uint64_t v17 = *(void **)(a6 + 144);
  swift_bridgeObjectRetain();
  sub_21E4CFC40();
  double v18 = (void *)sub_21E4CFDE0();
  BOOL v19 = *(void (**)(char *, uint64_t))(v12 + 8);
  v19(v14, v11);
  id v20 = objc_msgSend(v17, sel_stringFromDate_, v18, v32, v33, v34);

  uint64_t v21 = sub_21E4D0AF0();
  uint64_t v23 = v22;

  uint64_t v24 = MEMORY[0x263F8D310];
  *(void *)(v15 + 96) = MEMORY[0x263F8D310];
  *(void *)(v15 + 104) = v16;
  *(void *)(v15 + 72) = v21;
  *(void *)(v15 + 80) = v23;
  sub_21E4CFC20();
  unint64_t v25 = (void *)sub_21E4CFDE0();
  v19(v14, v11);
  id v26 = objc_msgSend(v17, sel_stringFromDate_, v25);

  uint64_t v27 = sub_21E4D0AF0();
  uint64_t v29 = v28;

  *(void *)(v15 + 136) = v24;
  *(void *)(v15 + 144) = v16;
  *(void *)(v15 + 112) = v27;
  *(void *)(v15 + 120) = v29;
  if ((~*(void *)&a7 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (a7 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (a7 < 9.22337204e18)
  {
    uint64_t v35 = (uint64_t)a7;
    uint64_t v30 = sub_21E4D0F90();
    *(void *)(v15 + 176) = v24;
    *(void *)(v15 + 184) = v16;
    *(void *)(v15 + 152) = v30;
    *(void *)(v15 + 160) = v31;
    sub_21E4D0AC0();
    swift_bridgeObjectRelease();
    return;
  }
LABEL_7:
  __break(1u);
}

uint64_t sub_21E4B1738(uint64_t a1)
{
  long long v3 = *(_OWORD *)(v1 + 56);
  void v12[2] = *(_OWORD *)(v1 + 40);
  unint64_t v12[3] = v3;
  void v12[4] = *(_OWORD *)(v1 + 72);
  uint64_t v13 = *(void *)(v1 + 88);
  long long v4 = *(_OWORD *)(v1 + 24);
  v12[0] = *(_OWORD *)(v1 + 8);
  v12[1] = v4;
  sub_21E48BE28((uint64_t)v12, (uint64_t)v14, &qword_267D2F988);
  sub_21E48BE28((uint64_t)v14, (uint64_t)&v15, &qword_267D2F988);
  if (v15 && (objc_msgSend(v15, sel_paused) & 1) != 0) {
    return 0;
  }
  sub_21E4B2B0C(v1);
  sub_21E4B27B0(a1, v1);
  sub_21E491BDC(v1);
  id v6 = sub_21E4B69E4();
  sub_21E4B6A0C(v6, 0, 0);

  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F950);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_21E4D9230;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F9A8);
  sub_21E4B2504();
  uint64_t v8 = sub_21E4D0A70();
  uint64_t v10 = v9;
  swift_bridgeObjectRelease();
  *(void *)(v7 + 56) = MEMORY[0x263F8D310];
  *(void *)(v7 + 64) = sub_21E48B95C();
  *(void *)(v7 + 32) = v8;
  *(void *)(v7 + 40) = v10;
  uint64_t v5 = sub_21E4D0AC0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5;
}

double sub_21E4B1928@<D0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4 = *a2;
  long long v5 = *((_OWORD *)a2 + 1);
  long long v6 = *((_OWORD *)a2 + 2);
  long long v7 = *((_OWORD *)a2 + 3);
  long long v8 = *((_OWORD *)a2 + 4);
  uint64_t v9 = a2[10];
  char v10 = a2[1] & 1;
  *(void *)a4 = a1;
  *(void *)(a4 + 8) = v4;
  *(unsigned char *)(a4 + 16) = v10;
  *(_OWORD *)(a4 + 24) = v5;
  *(_OWORD *)(a4 + 40) = v6;
  *(_OWORD *)(a4 + 56) = v7;
  *(_OWORD *)(a4 + 72) = v8;
  *(void *)(a4 + 88) = v9;
  *(void *)&double result = 3600;
  *(_OWORD *)(a4 + 96) = xmmword_21E4DA260;
  *(_OWORD *)(a4 + 112) = xmmword_21E4DA270;
  *(void *)(a4 + 128) = 4;
  *(void *)(a4 + 136) = 0x40D5180000000000;
  *(void *)(a4 + 144) = a3;
  return result;
}

void *sub_21E4B1988(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FFB0);
      char v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
      uint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[3 * v8 + 4]) {
          memmove(v12, a4 + 4, 24 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      char v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v12 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_21E4B22B8(0, v8, (char *)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void sub_21E4B1AAC(uint64_t a1, double a2)
{
  sub_21E4B1494(a1, v2[2], v2[3], v2[4], v2[5], v2[6], a2);
}

uint64_t sub_21E4B1ABC(char a1, int64_t a2, char a3, unint64_t a4)
{
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FFA8);
  uint64_t v10 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267D2FFA0) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_21E4D0EE0();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267D2FFA0) - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(void *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_21E4B2560(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

void *sub_21E4B1D2C(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F9A0);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_21E4B26BC(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_21E4B1E3C(void *a1)
{
  return sub_21E4B1988(0, a1[2], 0, a1);
}

uint64_t sub_21E4B1E50(unint64_t a1)
{
  return sub_21E4B1ABC(0, *(void *)(a1 + 16), 0, a1);
}

uint64_t sub_21E4B1E64(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_21E4B1EA4(a1, a2, a3, *v3);
  *long long v3 = (char *)result;
  return result;
}

uint64_t sub_21E4B1E84(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_21E4B2014(a1, a2, a3, *v3);
  *long long v3 = (char *)result;
  return result;
}

uint64_t sub_21E4B1EA4(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FFB0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  size_t v14 = 24 * v8;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v14]) {
      memmove(v12, v13, v14);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v14] || v12 >= &v13[v14])
  {
    memcpy(v12, v13, v14);
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_21E4D0F70();
  __break(1u);
  return result;
}

uint64_t sub_21E4B2014(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F9A0);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  size_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_21E4D0F70();
  __break(1u);
  return result;
}

uint64_t sub_21E4B2180(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  int64_t v3 = *(void *)(a1 + 16);
  uint64_t v4 = MEMORY[0x263F8EE78];
  if (!v3) {
    return v4;
  }
  uint64_t v22 = MEMORY[0x263F8EE78];
  uint64_t result = sub_21E4B1E64(0, v3, 0);
  uint64_t v4 = v22;
  uint64_t v9 = (uint64_t *)(a1 + 32);
  uint64_t v11 = *(void *)(a2 + 104);
  uint64_t v10 = *(void *)(a2 + 112);
  while (1)
  {
    uint64_t v12 = *v9++;
    uint64_t v13 = v12 * v11;
    if ((unsigned __int128)(v12 * (__int128)v11) >> 64 != (v12 * v11) >> 63) {
      break;
    }
    if (__OFADD__(v13, v10)) {
      goto LABEL_10;
    }
    uint64_t result = sub_21E4AF2C4(a3, 1);
    uint64_t v15 = v14;
    uint64_t v17 = v16;
    __int16 v18 = result;
    unint64_t v20 = *(void *)(v22 + 16);
    unint64_t v19 = *(void *)(v22 + 24);
    if (v20 >= v19 >> 1) {
      uint64_t result = sub_21E4B1E64(v19 > 1, v20 + 1, 1);
    }
    *(void *)(v22 + 16) = v20 + 1;
    uint64_t v21 = v22 + 24 * v20;
    *(void *)(v21 + 32) = v15;
    *(void *)(v21 + 40) = v17;
    *(unsigned char *)(v21 + 48) = v18;
    *(unsigned char *)(v21 + 49) = HIBYTE(v18) & 1;
    if (!--v3) {
      return v4;
    }
  }
  __break(1u);
LABEL_10:
  __break(1u);
  return result;
}

char *sub_21E4B22B8(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    char v5 = (char *)(a4 + 24 * a1 + 32);
    size_t v6 = 24 * v4;
    int64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_21E4D0F70();
  __break(1u);
  return result;
}

uint64_t sub_21E4B23A8(uint64_t a1, uint64_t (*a2)(uint64_t, double))
{
  int64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = MEMORY[0x263F8EE78];
  if (v2)
  {
    uint64_t v16 = MEMORY[0x263F8EE78];
    sub_21E4B1E84(0, v2, 0);
    uint64_t v3 = v16;
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FFA0);
    uint64_t v5 = a1
       + ((*(unsigned __int8 *)(*(void *)(v14 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v14 - 8) + 80));
    uint64_t v6 = *(void *)(*(void *)(v14 - 8) + 72);
    do
    {
      uint64_t v7 = a2(v5, *(double *)(v5 + *(int *)(v14 + 48)));
      uint64_t v9 = v8;
      unint64_t v11 = *(void *)(v16 + 16);
      unint64_t v10 = *(void *)(v16 + 24);
      if (v11 >= v10 >> 1) {
        sub_21E4B1E84(v10 > 1, v11 + 1, 1);
      }
      *(void *)(v16 + 16) = v11 + 1;
      uint64_t v12 = v16 + 16 * v11;
      *(void *)(v12 + 32) = v7;
      *(void *)(v12 + 40) = v9;
      v5 += v6;
      --v2;
    }
    while (v2);
  }
  return v3;
}

unint64_t sub_21E4B2504()
{
  unint64_t result = qword_267D2F9B0;
  if (!qword_267D2F9B0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D2F9A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2F9B0);
  }
  return result;
}

uint64_t sub_21E4B2560(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267D2FFA0) - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v12;
    }
  }
  uint64_t result = sub_21E4D0F70();
  __break(1u);
  return result;
}

uint64_t sub_21E4B26BC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_21E4D0F70();
  __break(1u);
  return result;
}

void *sub_21E4B27B0(uint64_t a1, uint64_t a2)
{
  uint64_t v43 = a2;
  uint64_t v42 = sub_21E4CFF80();
  uint64_t v4 = *(void *)(v42 - 8);
  MEMORY[0x270FA5388](v42);
  __int16 v41 = (char *)v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = sub_21E4CFE10();
  uint64_t v6 = MEMORY[0x270FA5388](v40);
  uint64_t v39 = (char *)v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  unint64_t v38 = (char *)v34 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v37 = (char *)v34 - v11;
  uint64_t v12 = *(void *)(a1 + 16);
  if (!v12) {
    return (void *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = a1 + 32;
  uint64_t v36 = (void (**)(char *, uint64_t))(v10 + 8);
  v34[1] = v2;
  uint64_t v35 = (void (**)(char *, uint64_t))(v4 + 8);
  v34[0] = a1;
  swift_bridgeObjectRetain();
  uint64_t v14 = (void *)MEMORY[0x263F8EE78];
  uint64_t v15 = v36;
  uint64_t v16 = v37;
  do
  {
    if ((*(unsigned char *)(v13 + 17) & 1) == 0)
    {
      __int16 v18 = v41;
      sub_21E4CFF60();
      uint64_t v44 = v14;
      unint64_t v19 = v39;
      sub_21E4CFE00();
      unint64_t v20 = v38;
      sub_21E4CFEF0();
      uint64_t v21 = *v15;
      uint64_t v22 = v19;
      uint64_t v23 = v40;
      (*v15)(v22, v40);
      (*v35)(v18, v42);
      sub_21E4CFDD0();
      v21(v20, v23);
      uint64_t v24 = *(void **)(v43 + 144);
      unint64_t v25 = (void *)sub_21E4CFDE0();
      id v26 = objc_msgSend(v24, sel_stringFromDate_, v25);

      uint64_t v27 = sub_21E4D0AF0();
      uint64_t v29 = v28;

      uint64_t v30 = v23;
      uint64_t v14 = v44;
      v21(v16, v30);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v14 = sub_21E4B1D2C(0, v14[2] + 1, 1, v14);
      }
      unint64_t v32 = v14[2];
      unint64_t v31 = v14[3];
      if (v32 >= v31 >> 1) {
        uint64_t v14 = sub_21E4B1D2C((void *)(v31 > 1), v32 + 1, 1, v14);
      }
      v14[2] = v32 + 1;
      uint64_t v17 = &v14[2 * v32];
      v17[4] = v27;
      v17[5] = v29;
    }
    v13 += 24;
    --v12;
  }
  while (v12);
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t sub_21E4B2B0C(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(void **)(a1 + 24);
  uint64_t v4 = *(void **)(a1 + 144);
  id v5 = *(id *)(a1 + 8);
  id v6 = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v7 = v4;
  id v8 = v2;
  return a1;
}

void destroy for ChartsDataProvider(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void **)(a1 + 144);
}

uint64_t initializeWithCopy for ChartsDataProvider(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  id v6 = *(void **)(a2 + 24);
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v5;
  uint64_t v7 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v7;
  uint64_t v8 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v8;
  uint64_t v9 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v9;
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  long long v10 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v10;
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  uint64_t v11 = *(void **)(a2 + 144);
  *(void *)(a1 + 144) = v11;
  id v12 = v3;
  id v13 = v4;
  id v14 = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v15 = v11;
  return a1;
}

uint64_t assignWithCopy for ChartsDataProvider(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  uint64_t v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  uint64_t v7 = *(void **)(a1 + 8);
  uint64_t v8 = *(void **)(a2 + 8);
  *(void *)(a1 + 8) = v8;
  id v9 = v8;

  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  long long v10 = *(void **)(a2 + 24);
  uint64_t v11 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = v10;
  id v12 = v10;

  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  id v13 = *(void **)(a2 + 144);
  id v14 = *(void **)(a1 + 144);
  *(void *)(a1 + 144) = v13;
  id v15 = v13;

  return a1;
}

__n128 __swift_memcpy152_8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  __n128 result = *(__n128 *)(a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 112);
  long long v8 = *(_OWORD *)(a2 + 128);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(_OWORD *)(a1 + 112) = v7;
  *(_OWORD *)(a1 + 128) = v8;
  *(__n128 *)(a1 + 96) = result;
  return result;
}

uint64_t assignWithTake for ChartsDataProvider(uint64_t a1, uint64_t a2)
{
  long long v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  long long v5 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);

  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v9;
  swift_bridgeObjectRelease();
  long long v10 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v10;
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  uint64_t v11 = *(void **)(a1 + 144);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);

  return a1;
}

uint64_t getEnumTagSinglePayload for ChartsDataProvider(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 152)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ChartsDataProvider(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 152) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 152) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ChartsDataProvider()
{
  return &type metadata for ChartsDataProvider;
}

void sub_21E4B2FA4()
{
}

void sub_21E4B2FB8()
{
}

void sub_21E4B2FCC()
{
}

void sub_21E4B2FE0()
{
}

void sub_21E4B2FF4()
{
}

void sub_21E4B3008(SEL *a1, SEL *a2)
{
  id v3 = [self *a1];
  if (v3)
  {
    long long v4 = v3;
    id v5 = [v3 *a2];

    if (v5)
    {
LABEL_8:
      JUMPOUT(0x223C27C40);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  goto LABEL_8;
}

void sub_21E4B3088()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F8D8);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_21E4D9390;
  uint64_t v1 = self;
  id v2 = objc_msgSend(v1, sel_distanceColors);
  if (!v2)
  {
    __break(1u);
    goto LABEL_7;
  }
  id v3 = v2;
  id v4 = objc_msgSend(v2, sel_gradientDarkColor);

  if (!v4)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  *(void *)(v0 + 32) = MEMORY[0x223C27C40](v4);
  id v5 = objc_msgSend(v1, sel_distanceColors);
  if (!v5)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v6 = v5;
  id v7 = objc_msgSend(v5, sel_gradientLightColor);

  if (v7)
  {
    *(void *)(v0 + 40) = MEMORY[0x223C27C40](v7);
    sub_21E4D0BE0();
    return;
  }
LABEL_9:
  __break(1u);
}

id sub_21E4B31A4()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F8D8);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_21E4D9390;
  id result = objc_msgSend(v0, sel_gradientLightColor);
  if (result)
  {
    *(void *)(v1 + 32) = MEMORY[0x223C27C40]();
    id result = objc_msgSend(v0, sel_gradientDarkColor);
    if (result)
    {
      *(void *)(v1 + 40) = MEMORY[0x223C27C40]();
      sub_21E4D0BE0();
      return (id)v1;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

id NSLayoutConstraint.priority(_:)()
{
  objc_msgSend(v0, sel_setPriority_);
  return v2;
}

void static NSLayoutConstraint.activate(_:)(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    swift_bridgeObjectRetain();
    for (uint64_t i = 0; i != v1; ++i)
    {
      unint64_t v3 = swift_bridgeObjectRetain();
      sub_21E4B336C(v3);
    }
    swift_bridgeObjectRelease();
  }
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  sub_21E4B3538();
  id v5 = (id)sub_21E4D0BC0();
  swift_bridgeObjectRelease();
  objc_msgSend(ObjCClassFromMetadata, sel_activateConstraints_, v5);
}

uint64_t sub_21E4B336C(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_21E4D0F20();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_21E4D0F20();
    swift_bridgeObjectRelease();
    uint64_t v6 = v5 + v3;
    if (!__OFADD__(v5, v3)) {
      goto LABEL_5;
    }
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v6 = v5 + v3;
  if (__OFADD__(v5, v3)) {
    goto LABEL_25;
  }
LABEL_5:
  unint64_t v4 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  unint64_t *v1 = v4;
  uint64_t v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_15;
    }
    uint64_t v5 = 1;
  }
  if (v4 >> 62) {
    goto LABEL_27;
  }
  uint64_t v9 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6) {
      uint64_t v9 = v6;
    }
    swift_bridgeObjectRetain();
    unint64_t v4 = MEMORY[0x223C282F0](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    unint64_t *v1 = v4;
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    uint64_t result = sub_21E4B3578(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_21E4D0F20();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
  }
  swift_bridgeObjectRelease();
  return sub_21E4D0BE0();
}

unint64_t sub_21E4B3538()
{
  unint64_t result = qword_267D2FFB8;
  if (!qword_267D2FFB8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_267D2FFB8);
  }
  return result;
}

uint64_t sub_21E4B3578(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5 = result;
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_21E4D0F20();
    unint64_t result = swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_21E4D0F20();
      unint64_t result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_21E4B37C8();
          swift_bridgeObjectRetain();
          for (unint64_t i = 0; i != v7; ++i)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FFC0);
            long long v10 = sub_21E4B3718(v13, i, a3);
            id v12 = *v11;
            ((void (*)(void (**)(id *), void))v10)(v13, 0);
            *(void *)(v5 + 8 * i) = v12;
          }
          swift_bridgeObjectRelease();
          return a3;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a2)
      {
        sub_21E4B3538();
        swift_arrayInitWithCopy();
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
  }
  __break(1u);
  return result;
}

void (*sub_21E4B3718(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_21E4B3824(v6, a2, a3);
  return sub_21E4B3780;
}

void sub_21E4B3780(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

unint64_t sub_21E4B37C8()
{
  unint64_t result = qword_267D2FFC8;
  if (!qword_267D2FFC8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D2FFC0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2FFC8);
  }
  return result;
}

void (*sub_21E4B3824(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)MEMORY[0x223C282E0](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)uint64_t v3 = v4;
    return sub_21E4B38A4;
  }
  __break(1u);
  return result;
}

void sub_21E4B38A4(id *a1)
{
}

uint64_t sub_21E4B38AC()
{
  uint64_t v0 = sub_21E4D0050();
  __swift_allocate_value_buffer(v0, qword_267D32AA0);
  __swift_project_value_buffer(v0, (uint64_t)qword_267D32AA0);
  return sub_21E4D0040();
}

uint64_t sub_21E4B3930()
{
  if (qword_267D30FA0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_21E4D0050();
  return __swift_project_value_buffer(v0, (uint64_t)qword_267D32AA0);
}

uint64_t sub_21E4B3994@<X0>(uint64_t a1@<X8>)
{
  if (qword_267D30FA0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_21E4D0050();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_267D32AA0);
  id v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

void sub_21E4B3A3C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v6 = a2;
  uint64_t v7 = a1;
  v36[0] = a1;
  v36[1] = a2;
  sub_21E48BAE8();
  uint64_t v8 = sub_21E4D0D40();
  uint64_t v9 = *(void *)(v8 + 16);
  if (v9)
  {
    uint64_t v10 = v8 + 16 * v9;
    uint64_t v7 = *(void *)(v10 + 16);
    unint64_t v6 = *(void *)(v10 + 24);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
  }
  sub_21E4B3DD4(46, 0xE100000000000000, v7, v6);
  uint64_t v11 = sub_21E4D0B90();
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  swift_bridgeObjectRelease();
  uint64_t v18 = MEMORY[0x223C28020](v11, v13, v15, v17);
  unint64_t v20 = v19;
  swift_bridgeObjectRelease();
  sub_21E4B3DD4(40, 0xE100000000000000, a3, a4);
  swift_bridgeObjectRetain();
  uint64_t v21 = sub_21E4D0B90();
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  uint64_t v27 = v26;
  swift_bridgeObjectRelease();
  uint64_t v28 = MEMORY[0x223C28020](v21, v23, v25, v27);
  unint64_t v30 = v29;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v31 = sub_21E4D0030();
  os_log_type_t v32 = sub_21E4D0CD0();
  if (os_log_type_enabled(v31, v32))
  {
    uint64_t v33 = swift_slowAlloc();
    uint64_t v34 = swift_slowAlloc();
    v36[0] = v34;
    *(_DWORD *)uint64_t v33 = 67109634;
    uint64_t v35 = pthread_self();
    pthread_mach_thread_np(v35);
    sub_21E4D0D30();
    *(_WORD *)(v33 + 8) = 2080;
    swift_bridgeObjectRetain();
    sub_21E489B2C(v18, v20, v36);
    sub_21E4D0D30();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v33 + 18) = 2080;
    swift_bridgeObjectRetain();
    sub_21E489B2C(v28, v30, v36);
    sub_21E4D0D30();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_21E433000, v31, v32, "[%u] %s::%s", (uint8_t *)v33, 0x1Cu);
    swift_arrayDestroy();
    MEMORY[0x223C29AE0](v34, -1, -1);
    MEMORY[0x223C29AE0](v33, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
}

unint64_t sub_21E4B3DD4(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0) {
    uint64_t v4 = a3 & 0xFFFFFFFFFFFFLL;
  }
  if (!v4) {
    return 0;
  }
  uint64_t v7 = 4 * v4;
  unint64_t v8 = 15;
  while (sub_21E4D0B80() != a1 || v9 != a2)
  {
    char v10 = sub_21E4D0FB0();
    swift_bridgeObjectRelease();
    if (v10) {
      return v8;
    }
    unint64_t v8 = sub_21E4D0B50();
    if (v7 == v8 >> 14) {
      return 0;
    }
  }
  swift_bridgeObjectRelease();
  return v8;
}

ValueMetadata *type metadata accessor for FitnessUILog()
{
  return &type metadata for FitnessUILog;
}

id sub_21E4B3ED4()
{
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF8E0]), sel_init);
  qword_267D30FB0 = (uint64_t)result;
  return result;
}

void static MindfulnessSessionDataCalculator.endingHeartRate(for:healthStore:completion:)(char *a1, void *a2, void (*a3)(uint64_t, void), uint64_t a4)
{
  if (qword_267D30FA8 != -1) {
    swift_once();
  }
  unint64_t v8 = (void *)qword_267D30FB0;
  sub_21E4CFE20();
  uint64_t v9 = (void *)sub_21E4D0AB0();
  swift_bridgeObjectRelease();
  id v10 = objc_msgSend(v8, sel_objectForKey_, v9);

  if (v10)
  {
    objc_msgSend(v10, sel_doubleValue);
    uint64_t v12 = v11;

    uint64_t v13 = v12;
LABEL_5:
    a3(v13, 0);
    return;
  }
  uint64_t v14 = *(void *)&a1[OBJC_IVAR____TtC9FitnessUI27MindfulnessSessionViewModel_metadata];
  if (!v14)
  {
    long long aBlock = 0u;
    long long v46 = 0u;
    goto LABEL_14;
  }
  uint64_t v15 = sub_21E4D0AF0();
  if (!*(void *)(v14 + 16) || (unint64_t v17 = sub_21E4B4B34(v15, v16), (v18 & 1) == 0))
  {
    long long aBlock = 0u;
    long long v46 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_14;
  }
  sub_21E48A4D8(*(void *)(v14 + 56) + 32 * v17, (uint64_t)&aBlock);
  swift_bridgeObjectRelease();
  if (!*((void *)&v46 + 1))
  {
LABEL_14:
    sub_21E4B4440((uint64_t)&aBlock);
    goto LABEL_15;
  }
  if (swift_dynamicCast())
  {
    unint64_t v19 = (void *)qword_267D30FB0;
    unint64_t v20 = (void *)sub_21E4D0C70();
    sub_21E4CFE20();
    uint64_t v21 = (void *)sub_21E4D0AB0();
    swift_bridgeObjectRelease();
    objc_msgSend(v19, sel_setObject_forKey_, v20, v21);

    uint64_t v13 = v44;
    goto LABEL_5;
  }
LABEL_15:
  uint64_t v22 = a4;
  uint64_t v23 = self;
  uint64_t v24 = (void *)sub_21E4CFDE0();
  uint64_t v25 = (void *)sub_21E4CFDE0();
  id v26 = objc_msgSend(v23, sel_predicateForSamplesWithStartDate_endDate_options_, v24, v25, 1);

  id v27 = objc_msgSend(self, sel_heartRateType);
  if (v27)
  {
    uint64_t v28 = v27;
    id v29 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0A678]), sel_initWithSampleType_predicate_, v27, v26);

    sub_21E4D0AF0();
    id v30 = objc_allocWithZone(MEMORY[0x263F08B30]);
    unint64_t v31 = (void *)sub_21E4D0AB0();
    swift_bridgeObjectRelease();
    id v32 = objc_msgSend(v30, sel_initWithKey_ascending_, v31, 0);

    __swift_instantiateConcreteTypeFromMangledName(&qword_26AB08758);
    uint64_t v33 = swift_allocObject();
    *(_OWORD *)(v33 + 16) = xmmword_21E4DA2C0;
    *(void *)(v33 + 32) = v29;
    *(void *)&long long aBlock = v33;
    sub_21E4D0BE0();
    uint64_t v34 = swift_allocObject();
    *(_OWORD *)(v34 + 16) = xmmword_21E4DA2C0;
    *(void *)(v34 + 32) = v32;
    *(void *)&long long aBlock = v34;
    sub_21E4D0BE0();
    uint64_t v35 = (void *)swift_allocObject();
    v35[2] = a1;
    uint64_t v35[3] = a3;
    v35[4] = v22;
    id v36 = objc_allocWithZone(MEMORY[0x263F0A6E0]);
    sub_21E4835F8(0, &qword_267D2FFD0);
    id v37 = v29;
    id v38 = v32;
    uint64_t v39 = a1;
    swift_retain();
    uint64_t v40 = (void *)sub_21E4D0BC0();
    swift_bridgeObjectRelease();
    sub_21E4835F8(0, &qword_267D2FFD8);
    __int16 v41 = (void *)sub_21E4D0BC0();
    swift_bridgeObjectRelease();
    id v47 = sub_21E4B44E0;
    __int16 v48 = v35;
    *(void *)&long long aBlock = MEMORY[0x263EF8330];
    *((void *)&aBlock + 1) = 1107296256;
    *(void *)&long long v46 = sub_21E4B4A64;
    *((void *)&v46 + 1) = &block_descriptor_3;
    uint64_t v42 = _Block_copy(&aBlock);
    id v43 = objc_msgSend(v36, sel_initWithQueryDescriptors_limit_sortDescriptors_resultsHandler_, v40, 1, v41, v42);

    _Block_release(v42);
    swift_release();
    objc_msgSend(a2, sel_executeQuery_, v43);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_21E4B4440(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AB087A0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21E4B44A0()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_21E4B44E0(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(v3 + 16);
  unint64_t v6 = *(uint64_t (**)(void, void))(v3 + 24);
  if (a3)
  {
    os_log_type_t v8 = sub_21E4D0CB0();
    uint64_t v9 = (void *)*MEMORY[0x263F098C8];
    os_log_type_t v10 = v8;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], v8))
    {
      id v11 = v5;
      id v12 = a3;
      id v13 = v11;
      id v14 = a3;
      log = v9;
      uint64_t v15 = swift_slowAlloc();
      uint64_t v16 = (void *)swift_slowAlloc();
      id v47 = v6;
      uint64_t v17 = swift_slowAlloc();
      unint64_t v50 = v17;
      *(_DWORD *)uint64_t v15 = 136315650;
      sub_21E489B2C(0xD000000000000020, 0x800000021E4DA2C0, (uint64_t *)&v50);
      sub_21E4D0D30();
      *(_WORD *)(v15 + 12) = 2112;
      uint64_t v49 = (uint64_t)v13;
      id v18 = v13;
      sub_21E4D0D30();
      *uint64_t v16 = v13;

      *(_WORD *)(v15 + 22) = 2080;
      swift_getErrorValue();
      uint64_t v19 = sub_21E4D1020();
      sub_21E489B2C(v19, v20, (uint64_t *)&v50);
      sub_21E4D0D30();
      swift_bridgeObjectRelease();

      uint64_t v21 = log;
      _os_log_impl(&dword_21E433000, log, v10, "%s - failed to fetch heart rate for mindfulness session %@ with error %s", (uint8_t *)v15, 0x20u);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267D2FCB0);
      swift_arrayDestroy();
      MEMORY[0x223C29AE0](v16, -1, -1);
      swift_arrayDestroy();
      uint64_t v22 = v17;
      unint64_t v6 = v47;
      MEMORY[0x223C29AE0](v22, -1, -1);
      uint64_t v23 = v15;
LABEL_18:
      MEMORY[0x223C29AE0](v23, -1, -1);

      goto LABEL_19;
    }
    goto LABEL_19;
  }
  if (!a2)
  {
LABEL_16:
    os_log_type_t v36 = sub_21E4D0CD0();
    id v37 = (void *)*MEMORY[0x263F098C8];
    os_log_type_t v38 = v36;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], v36))
    {
      __int16 v48 = v6;
      id v39 = v5;
      long long v46 = v37;
      uint64_t v40 = swift_slowAlloc();
      __int16 v41 = (void *)swift_slowAlloc();
      uint64_t v42 = swift_slowAlloc();
      uint64_t v49 = v42;
      *(_DWORD *)uint64_t v40 = 136315394;
      unint64_t v50 = sub_21E489B2C(0xD000000000000020, 0x800000021E4DA2C0, &v49);
      sub_21E4D0D30();
      *(_WORD *)(v40 + 12) = 2112;
      unint64_t v50 = (unint64_t)v39;
      id v43 = v39;
      sub_21E4D0D30();
      *__int16 v41 = v39;
      unint64_t v6 = v48;

      uint64_t v21 = v46;
      _os_log_impl(&dword_21E433000, v46, v38, "%s - failed to fetch heart rate for mindfulness session %@", (uint8_t *)v40, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267D2FCB0);
      swift_arrayDestroy();
      MEMORY[0x223C29AE0](v41, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x223C29AE0](v42, -1, -1);
      uint64_t v23 = v40;
      goto LABEL_18;
    }
LABEL_19:
    uint64_t v34 = 0;
    uint64_t v35 = 1;
    return v6(v34, v35);
  }
  if (!(a2 >> 62))
  {
    uint64_t v25 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v25) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
  swift_bridgeObjectRetain();
  if (!sub_21E4D0F20())
  {
LABEL_15:
    swift_bridgeObjectRelease();
    goto LABEL_16;
  }
LABEL_7:
  if ((a2 & 0xC000000000000001) != 0)
  {
    id v26 = (id)MEMORY[0x223C282E0](0, a2);
  }
  else
  {
    if (!*(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_23;
    }
    id v26 = *(id *)(a2 + 32);
  }
  id v27 = v26;
  swift_bridgeObjectRelease();
  self;
  uint64_t v28 = (void *)swift_dynamicCastObjCClass();
  if (!v28)
  {

    goto LABEL_16;
  }
  id v29 = objc_msgSend(v28, sel_quantity);

  objc_msgSend(v29, sel__beatsPerMinute);
  uint64_t v4 = v30;

  if (qword_267D30FA8 != -1) {
LABEL_23:
  }
    swift_once();
  unint64_t v31 = (void *)qword_267D30FB0;
  id v32 = (void *)sub_21E4D0C70();
  sub_21E4CFE20();
  uint64_t v33 = (void *)sub_21E4D0AB0();
  swift_bridgeObjectRelease();
  objc_msgSend(v31, sel_setObject_forKey_, v32, v33);

  uint64_t v34 = v4;
  uint64_t v35 = 0;
  return v6(v34, v35);
}

uint64_t sub_21E4B4A64(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v5 = a3;
  uint64_t v7 = *(void (**)(id, uint64_t, void *))(a1 + 32);
  if (a3)
  {
    sub_21E4835F8(0, &qword_267D2FFE0);
    uint64_t v5 = sub_21E4D0BD0();
  }
  swift_retain();
  id v8 = a2;
  id v9 = a4;
  v7(v8, v5, a4);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

unint64_t sub_21E4B4B34(uint64_t a1, uint64_t a2)
{
  sub_21E4D1070();
  sub_21E4D0B40();
  uint64_t v4 = sub_21E4D10B0();
  return sub_21E4B4BBC(a1, a2, v4);
}

ValueMetadata *type metadata accessor for MindfulnessSessionDataCalculator()
{
  return &type metadata for MindfulnessSessionDataCalculator;
}

unint64_t sub_21E4B4BBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    os_log_type_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_21E4D0FB0() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        id v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_21E4D0FB0() & 1) == 0);
    }
  }
  return v6;
}

id CAGradientLayer.startPoint(_:)()
{
  objc_msgSend(v0, sel_setStartPoint_);
  return v2;
}

id CAGradientLayer.endPoint(_:)()
{
  objc_msgSend(v0, sel_setEndPoint_);
  return v2;
}

char *CAGradientLayer.colors(_:)(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_21E4D0F20();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v2)
  {
    uint64_t v16 = MEMORY[0x263F8EE78];
    id result = sub_21E4B4ED4(0, v2 & ~(v2 >> 63), 0);
    if (v2 < 0)
    {
      __break(1u);
      return result;
    }
    uint64_t v4 = 0;
    uint64_t v5 = v16;
    do
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v6 = (id)MEMORY[0x223C282E0](v4, a1);
      }
      else {
        id v6 = *(id *)(a1 + 8 * v4 + 32);
      }
      uint64_t v7 = v6;
      id v8 = objc_msgSend(v6, sel_CGColor);
      type metadata accessor for CGColor();
      uint64_t v15 = v9;

      *(void *)&long long v14 = v8;
      uint64_t v16 = v5;
      unint64_t v11 = *(void *)(v5 + 16);
      unint64_t v10 = *(void *)(v5 + 24);
      if (v11 >= v10 >> 1)
      {
        sub_21E4B4ED4((char *)(v10 > 1), v11 + 1, 1);
        uint64_t v5 = v16;
      }
      ++v4;
      *(void *)(v5 + 16) = v11 + 1;
      sub_21E4B4F4C(&v14, (_OWORD *)(v5 + 32 * v11 + 32));
    }
    while (v2 != v4);
  }
  uint64_t v12 = (void *)sub_21E4D0BC0();
  swift_bridgeObjectRelease();
  objc_msgSend(v13, sel_setColors_, v12);

  return (char *)v13;
}

char *sub_21E4B4ED4(char *a1, int64_t a2, char a3)
{
  id result = sub_21E4B4F5C(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

void type metadata accessor for CGColor()
{
  if (!qword_267D2FFE8)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_267D2FFE8);
    }
  }
}

_OWORD *sub_21E4B4F4C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

char *sub_21E4B4F5C(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FFF0);
    unint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    unint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  id v13 = v10 + 32;
  long long v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

uint64_t FIUIRelativeDateTimeFormatter.init(calendar:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_21E4CFF80();
  char v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32);
  return v5(a2, a1, v4);
}

uint64_t FIUIRelativeDateTimeFormatter.localizedString(for:relativeTo:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_21E4CFE10();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v76 = (char *)v4;
  uint64_t v77 = v5;
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  int v79 = (char *)&v69 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v73 = (char *)&v69 - v8;
  uint64_t v80 = sub_21E4CFCB0();
  uint64_t v74 = *(void *)(v80 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v80);
  uint64_t v78 = (char *)&v69 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v69 - v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FFF8);
  uint64_t v13 = sub_21E4CFF70();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(void *)(v14 + 72);
  unint64_t v16 = (*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_21E4D93A0;
  unint64_t v18 = v17 + v16;
  uint64_t v19 = *(void (**)(unint64_t, void, uint64_t))(v14 + 104);
  v19(v18, *MEMORY[0x263F07870], v13);
  v19(v18 + v15, *MEMORY[0x263F07890], v13);
  v19(v18 + 2 * v15, *MEMORY[0x263F078C0], v13);
  sub_21E4B61F4(v17);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  uint64_t v71 = a1;
  uint64_t v72 = a2;
  sub_21E4CFF00();
  swift_bridgeObjectRelease();
  uint64_t v20 = sub_21E4CFC70();
  if ((v21 & 1) != 0 || (uint64_t v22 = v20) == 0)
  {
    uint64_t v30 = sub_21E4CFC80();
    uint64_t v28 = v76;
    uint64_t v29 = v77;
    if ((v31 & 1) != 0 || (uint64_t v22 = v30) == 0)
    {
      uint64_t v22 = sub_21E4CFC90();
      char v34 = v33;
      id v32 = sub_21E4B69E4();
      id v23 = v32;
      if ((v34 & 1) != 0 || !v22)
      {
        uint64_t v61 = sub_21E4B6A0C(v32, 0, 0);

        (*(void (**)(char *, uint64_t))(v74 + 8))(v12, v80);
        return v61;
      }
    }
    else
    {
      id v32 = sub_21E4B69E4();
      id v23 = v32;
    }
    uint64_t v24 = sub_21E4B6A0C(v32, 0, 0);
    uint64_t v26 = v35;
    uint64_t v27 = v74;
  }
  else
  {
    id v23 = sub_21E4B69E4();
    uint64_t v24 = sub_21E4B6A0C(v23, 0, 0);
    uint64_t v26 = v25;
    uint64_t v27 = v74;
    uint64_t v28 = v76;
    uint64_t v29 = v77;
  }

  uint64_t v77 = sub_21E4B5960(v22, v24, v26);
  unint64_t v37 = v36;
  swift_bridgeObjectRelease();
  os_log_type_t v38 = sub_21E4D0CA0();
  id v39 = *MEMORY[0x263F098C8];
  uint64_t v40 = *(void (**)(char *, uint64_t, char *))(v29 + 16);
  __int16 v41 = v73;
  v40(v73, v71, v28);
  v40(v79, v72, v28);
  uint64_t v42 = v78;
  (*(void (**)(char *, char *, uint64_t))(v27 + 16))(v78, v12, v80);
  if (os_log_type_enabled(v39, v38))
  {
    unint64_t v70 = v37;
    swift_bridgeObjectRetain_n();
    os_log_t v75 = v39;
    uint64_t v43 = swift_slowAlloc();
    uint64_t v76 = v12;
    uint64_t v44 = v29;
    uint64_t v45 = v43;
    uint64_t v74 = swift_slowAlloc();
    uint64_t v82 = v74;
    *(_DWORD *)uint64_t v45 = 136316418;
    LODWORD(v72) = v38;
    unint64_t v81 = sub_21E489B2C(0xD00000000000001DLL, 0x800000021E4DA320, &v82);
    sub_21E4D0D30();
    *(_WORD *)(v45 + 12) = 2080;
    unint64_t v81 = sub_21E489B2C(0xD000000000000020, 0x800000021E4DF710, &v82);
    sub_21E4D0D30();
    *(_WORD *)(v45 + 22) = 2080;
    sub_21E4B6948(&qword_267D30000, MEMORY[0x263F07490]);
    uint64_t v46 = sub_21E4D0F90();
    unint64_t v81 = sub_21E489B2C(v46, v47, &v82);
    sub_21E4D0D30();
    swift_bridgeObjectRelease();
    __int16 v48 = v79;
    uint64_t v49 = v41;
    uint64_t v50 = v27;
    uint64_t v51 = *(void (**)(char *, char *))(v44 + 8);
    v51(v49, v28);
    *(_WORD *)(v45 + 32) = 2080;
    uint64_t v52 = sub_21E4D0F90();
    unint64_t v81 = sub_21E489B2C(v52, v53, &v82);
    sub_21E4D0D30();
    swift_bridgeObjectRelease();
    uint64_t v54 = v48;
    unint64_t v55 = v70;
    v51(v54, v28);
    *(_WORD *)(v45 + 42) = 2080;
    sub_21E4B6948(&qword_267D30008, MEMORY[0x263F063B0]);
    id v56 = v78;
    uint64_t v57 = v80;
    uint64_t v58 = sub_21E4D0F90();
    unint64_t v81 = sub_21E489B2C(v58, v59, &v82);
    sub_21E4D0D30();
    swift_bridgeObjectRelease();
    uint64_t v60 = *(void (**)(char *, uint64_t))(v50 + 8);
    v60(v56, v57);
    *(_WORD *)(v45 + 52) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v61 = v77;
    unint64_t v81 = sub_21E489B2C(v77, v55, &v82);
    sub_21E4D0D30();
    swift_bridgeObjectRelease_n();
    os_log_t v62 = v75;
    _os_log_impl(&dword_21E433000, v75, (os_log_type_t)v72, "%s::%s date (%s) referenceDate (%s) differenceComponents (%s) result %s", (uint8_t *)v45, 0x3Eu);
    uint64_t v63 = v74;
    swift_arrayDestroy();
    MEMORY[0x223C29AE0](v63, -1, -1);
    MEMORY[0x223C29AE0](v45, -1, -1);

    v60(v76, v57);
  }
  else
  {
    uint64_t v64 = *(void (**)(char *, char *))(v29 + 8);
    swift_bridgeObjectRetain();
    uint64_t v65 = v39;
    v64(v41, v28);
    v64(v79, v28);
    uint64_t v66 = *(void (**)(char *, uint64_t))(v27 + 8);
    uint64_t v67 = v80;
    v66(v42, v80);

    swift_bridgeObjectRelease();
    v66(v12, v67);
    return v77;
  }
  return v61;
}

uint64_t sub_21E4B5960(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = result;
  if (result < 0 && (uint64_t v5 = -result, __OFSUB__(0, result)))
  {
    __break(1u);
  }
  else
  {
    id v6 = sub_21E4B69E4();
    uint64_t v7 = sub_21E4B6A0C(v6, 0, 0);
    uint64_t v9 = v8;

    id v10 = sub_21E4B69E4();
    sub_21E4B6A0C(v10, 0, 0);

    __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F950);
    uint64_t v11 = swift_allocObject();
    *(_OWORD *)(v11 + 16) = xmmword_21E4D93A0;
    uint64_t v12 = MEMORY[0x263F8D750];
    *(void *)(v11 + 56) = MEMORY[0x263F8D6C8];
    *(void *)(v11 + 64) = v12;
    *(void *)(v11 + 32) = v5;
    uint64_t v13 = MEMORY[0x263F8D310];
    *(void *)(v11 + 96) = MEMORY[0x263F8D310];
    unint64_t v14 = sub_21E48B95C();
    *(void *)(v11 + 72) = v7;
    *(void *)(v11 + 80) = v9;
    *(void *)(v11 + 136) = v13;
    *(void *)(v11 + 144) = v14;
    *(void *)(v11 + 104) = v14;
    *(void *)(v11 + 112) = a2;
    *(void *)(v11 + 120) = a3;
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_21E4D0AC0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v15;
  }
  return result;
}

uint64_t FIUIRelativeDateTimeFormatter.localizedDayString(for:)(uint64_t a1)
{
  uint64_t v2 = sub_21E4CFCB0();
  uint64_t v63 = *(void *)(v2 - 8);
  uint64_t v64 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v65 = (char *)&v51 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = sub_21E4CFF70();
  uint64_t v66 = *(void *)(v68 - 8);
  MEMORY[0x270FA5388](v68);
  uint64_t v5 = (char *)&v51 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F750);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v9 = (char *)&v51 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v51 - v10;
  uint64_t v67 = sub_21E4CFE10();
  uint64_t v12 = *(void *)(v67 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v67);
  uint64_t v15 = (char *)&v51 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  unint64_t v18 = (char *)&v51 - v17;
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v51 - v19;
  sub_21E4CFE00();
  if (sub_21E4CFF50())
  {
    id v21 = sub_21E4B69E4();
    uint64_t v22 = sub_21E4B6A0C(v21, 0, 0);

    (*(void (**)(char *, uint64_t))(v12 + 8))(v20, v67);
  }
  else
  {
    uint64_t v52 = v15;
    unint64_t v53 = v18;
    unint64_t v55 = v9;
    uint64_t v58 = a1;
    uint64_t v23 = v66;
    uint64_t v24 = *(void (**)(void))(v66 + 104);
    unsigned int v60 = *MEMORY[0x263F07870];
    uint64_t v25 = v68;
    uint64_t v61 = v66 + 104;
    unint64_t v59 = (void (*)(char *, void, uint64_t))v24;
    v24(v5);
    os_log_t v62 = v20;
    sub_21E4CFF40();
    uint64_t v26 = v67;
    uint64_t v57 = *(void (**)(char *, uint64_t))(v23 + 8);
    v57(v5, v25);
    id v56 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    if (v56(v11, 1, v26) == 1)
    {
      uint64_t v54 = v12;
      uint64_t v27 = v26;
      sub_21E483588((uint64_t)v11);
    }
    else
    {
      uint64_t v28 = v53;
      (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v53, v11, v26);
      if (sub_21E4CFF50())
      {
        id v29 = sub_21E4B69E4();
        uint64_t v22 = sub_21E4B6A0C(v29, 0, 0);

        uint64_t v30 = *(void (**)(char *, uint64_t))(v12 + 8);
        v30(v28, v26);
        v30(v62, v26);
        return v22;
      }
      uint64_t v54 = v12;
      uint64_t v27 = v26;
      (*(void (**)(char *, uint64_t))(v12 + 8))(v28, v26);
    }
    char v31 = v65;
    uint64_t v32 = v68;
    char v33 = v62;
    uint64_t v34 = (uint64_t)v55;
    v59(v5, v60, v68);
    sub_21E4CFF40();
    v57(v5, v32);
    uint64_t v35 = v27;
    if (v56((char *)v34, 1, v27) == 1)
    {
      sub_21E483588(v34);
      uint64_t v36 = v54;
    }
    else
    {
      uint64_t v36 = v54;
      unint64_t v37 = v52;
      (*(void (**)(char *, uint64_t, uint64_t))(v54 + 32))(v52, v34, v35);
      if (sub_21E4CFF50())
      {
        id v38 = sub_21E4B69E4();
        uint64_t v22 = sub_21E4B6A0C(v38, 0, 0);

        id v39 = *(void (**)(char *, uint64_t))(v36 + 8);
        v39(v37, v35);
        v39(v33, v35);
        return v22;
      }
      (*(void (**)(char *, uint64_t))(v36 + 8))(v37, v35);
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FFF8);
    unint64_t v40 = (*(unsigned __int8 *)(v23 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80);
    uint64_t v41 = swift_allocObject();
    *(_OWORD *)(v41 + 16) = xmmword_21E4D9230;
    v59((char *)(v41 + v40), v60, v68);
    sub_21E4B61F4(v41);
    swift_setDeallocating();
    swift_arrayDestroy();
    swift_deallocClassInstance();
    uint64_t v42 = v62;
    sub_21E4CFF00();
    swift_bridgeObjectRelease();
    uint64_t v43 = sub_21E4CFC70();
    if (v44) {
      uint64_t v45 = 0;
    }
    else {
      uint64_t v45 = v43;
    }
    id v46 = sub_21E4B69E4();
    uint64_t v47 = sub_21E4B6A0C(v46, 0, 0);
    uint64_t v49 = v48;

    uint64_t v22 = sub_21E4B5960(v45, v47, v49);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v63 + 8))(v31, v64);
    (*(void (**)(char *, uint64_t))(v36 + 8))(v42, v35);
  }
  return v22;
}

uint64_t sub_21E4B61F4(uint64_t a1)
{
  uint64_t v2 = sub_21E4CFF70();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  unint64_t v37 = (char *)&v30 - v7;
  uint64_t v8 = *(void *)(a1 + 16);
  if (v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D30010);
    uint64_t v9 = sub_21E4D0DA0();
    uint64_t v10 = 0;
    uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v11 = v3 + 16;
    uint64_t v35 = v12;
    uint64_t v36 = v9 + 56;
    uint64_t v13 = *(unsigned __int8 *)(v11 + 64);
    uint64_t v32 = v8;
    uint64_t v33 = a1 + ((v13 + 32) & ~v13);
    uint64_t v14 = *(void *)(v11 + 56);
    uint64_t v15 = (void (**)(char *, uint64_t))(v11 - 8);
    char v31 = (uint64_t (**)(unint64_t, char *, uint64_t))(v11 + 16);
    while (1)
    {
      uint64_t v34 = v10;
      v35(v37, v33 + v14 * v10, v2);
      sub_21E4B6948(&qword_267D30018, MEMORY[0x263F07908]);
      uint64_t v16 = sub_21E4D0A50();
      uint64_t v17 = ~(-1 << *(unsigned char *)(v9 + 32));
      unint64_t v18 = v16 & v17;
      unint64_t v19 = (v16 & (unint64_t)v17) >> 6;
      uint64_t v20 = *(void *)(v36 + 8 * v19);
      uint64_t v21 = 1 << (v16 & v17);
      if ((v21 & v20) != 0)
      {
        while (1)
        {
          uint64_t v22 = v11;
          v35(v6, *(void *)(v9 + 48) + v18 * v14, v2);
          sub_21E4B6948(&qword_267D30020, MEMORY[0x263F07908]);
          char v23 = sub_21E4D0AA0();
          uint64_t v24 = *v15;
          (*v15)(v6, v2);
          if (v23) {
            break;
          }
          unint64_t v18 = (v18 + 1) & v17;
          unint64_t v19 = v18 >> 6;
          uint64_t v20 = *(void *)(v36 + 8 * (v18 >> 6));
          uint64_t v21 = 1 << v18;
          uint64_t v11 = v22;
          if ((v20 & (1 << v18)) == 0) {
            goto LABEL_8;
          }
        }
        v24(v37, v2);
        uint64_t v11 = v22;
      }
      else
      {
LABEL_8:
        uint64_t v25 = v37;
        *(void *)(v36 + 8 * v19) = v21 | v20;
        uint64_t result = (*v31)(*(void *)(v9 + 48) + v18 * v14, v25, v2);
        uint64_t v27 = *(void *)(v9 + 16);
        BOOL v28 = __OFADD__(v27, 1);
        uint64_t v29 = v27 + 1;
        if (v28)
        {
          __break(1u);
          return result;
        }
        *(void *)(v9 + 16) = v29;
      }
      uint64_t v10 = v34 + 1;
      if (v34 + 1 == v32) {
        return v9;
      }
    }
  }
  return MEMORY[0x263F8EE88];
}

uint64_t initializeBufferWithCopyOfBuffer for FIUIRelativeDateTimeFormatter(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_21E4CFF80();
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);
  return v5(a1, a2, v4);
}

uint64_t destroy for FIUIRelativeDateTimeFormatter(uint64_t a1)
{
  uint64_t v2 = sub_21E4CFF80();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t initializeWithCopy for FIUIRelativeDateTimeFormatter(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_21E4CFF80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for FIUIRelativeDateTimeFormatter(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_21E4CFF80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for FIUIRelativeDateTimeFormatter(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_21E4CFF80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for FIUIRelativeDateTimeFormatter(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_21E4CFF80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for FIUIRelativeDateTimeFormatter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_21E4B6780);
}

uint64_t sub_21E4B6780(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_21E4CFF80();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for FIUIRelativeDateTimeFormatter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_21E4B6800);
}

uint64_t sub_21E4B6800(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_21E4CFF80();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for FIUIRelativeDateTimeFormatter()
{
  uint64_t result = qword_26AB09080;
  if (!qword_26AB09080) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_21E4B68BC()
{
  uint64_t result = sub_21E4CFF80();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_21E4B6948(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

double FIUIDeviceDependentLayoutMetric(junior40:senior44:)(double a1, double a2)
{
  return a2;
}

uint64_t FIUIDeviceDependentValue<A>(junior40:senior44:aloeSmall41:aloeBig45:agave49:avoniaSmall42:avoniaBig46:)@<X0>(uint64_t a1@<X4>, uint64_t a2@<X7>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))(a3, a1, a2);
}

double FIUIDeviceDependentLayoutMetric(junior40:senior44:aloeSmall41:aloeBig45:)(double a1, double a2, double a3, double a4)
{
  return a4;
}

double FIUIDeviceDependentLayoutMetric(junior40:senior44:aloeSmall41:aloeBig45:agave49:)(double a1, double a2, double a3, double a4, double a5)
{
  return a5;
}

double FIUIDeviceDependentLayoutMetric(junior40:senior44:aloeSmall41:aloeBig45:agave49:avoniaSmall42:avoniaBig46:)(double a1, double a2, double a3, double a4, double a5)
{
  return a5;
}

id sub_21E4B69E4()
{
  id result = (id)FIUIBundle();
  if (!result) {
    __break(1u);
  }
  return result;
}

uint64_t sub_21E4B6A0C(void *a1, uint64_t a2, void *a3)
{
  uint64_t v5 = (void *)sub_21E4D0AB0();
  if (a3) {
    a3 = (void *)sub_21E4D0AB0();
  }
  id v6 = objc_msgSend(a1, sel_localizedStringForKey_value_table_, v5, 0, a3);

  uint64_t v7 = sub_21E4D0AF0();
  return v7;
}

uint64_t static FitnessUIArchivableView.registerWidgetViewDecoders()()
{
  return sub_21E4D0310();
}

unint64_t sub_21E4B6B14()
{
  unint64_t result = qword_26AB086F8;
  if (!qword_26AB086F8)
  {
    type metadata accessor for ActivityStatisticsArchivableView();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AB086F8);
  }
  return result;
}

id sub_21E4B6B6C()
{
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0A410]), sel_init);
  qword_267D32AB8 = (uint64_t)result;
  return result;
}

uint64_t *sub_21E4B6BA0()
{
  if (qword_267D30FB8 != -1) {
    swift_once();
  }
  return &qword_267D32AB8;
}

id sub_21E4B6BEC()
{
  return sub_21E4B6E5C(&qword_267D30FB8, (void **)&qword_267D32AB8);
}

uint64_t sub_21E4B6C10()
{
  type metadata accessor for FIUIWheelchairStatusProvider();
  if (qword_267D30FB8 != -1) {
    swift_once();
  }
  uint64_t result = sub_21E484368((id)qword_267D32AB8);
  qword_267D32AC0 = result;
  return result;
}

uint64_t *sub_21E4B6C80()
{
  if (qword_267D30FC0 != -1) {
    swift_once();
  }
  return &qword_267D32AC0;
}

uint64_t sub_21E4B6CCC()
{
  if (qword_267D30FC0 != -1) {
    swift_once();
  }
  return swift_retain();
}

void sub_21E4B6D28()
{
  if (qword_267D30FB8 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_267D32AB8;
  id v1 = objc_allocWithZone((Class)FIUIUnitManager);
  id v2 = v0;
  id v3 = objc_msgSend(v1, sel_initWithHealthStore_, v2);

  id v4 = objc_msgSend(objc_allocWithZone((Class)FIUIFormattingManager), sel_initWithUnitManager_, v3);
  if (v4) {
    qword_267D32AC8 = (uint64_t)v4;
  }
  else {
    __break(1u);
  }
}

uint64_t *sub_21E4B6DEC()
{
  if (qword_267D30FC8 != -1) {
    swift_once();
  }
  return &qword_267D32AC8;
}

id sub_21E4B6E38()
{
  return sub_21E4B6E5C(qword_267D30FC8, (void **)&qword_267D32AC8);
}

id sub_21E4B6E5C(void *a1, void **a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  id v3 = *a2;
  return v3;
}

uint64_t FitnessUIArchivableView.deinit()
{
  return v0;
}

uint64_t FitnessUIArchivableView.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_21E4B6EC0()
{
  return swift_allocObject();
}

uint64_t sub_21E4B6ED0()
{
  return v0;
}

uint64_t type metadata accessor for FitnessUIArchivableView()
{
  return self;
}

uint64_t method lookup function for FitnessUIArchivableView(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for FitnessUIArchivableView);
}

id NSNumber.init(value:)(double a1)
{
  id v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return objc_msgSend(v2, sel_initWithDouble_, a1);
}

id NSNumber.cgFloatValue.getter()
{
  return objc_msgSend(v0, sel_doubleValue);
}

uint64_t sub_21E4B6F6C()
{
  return sub_21E4D10B0();
}

uint64_t sub_21E4B6FB4()
{
  return sub_21E4D1080();
}

uint64_t sub_21E4B6FE0()
{
  return sub_21E4D10B0();
}

uint64_t sub_21E4B7024()
{
  return sub_21E4D1080();
}

uint64_t sub_21E4B704C()
{
  return sub_21E4D10B0();
}

uint64_t sub_21E4B7090()
{
  return sub_21E4D10B0();
}

uint64_t sub_21E4B70E0()
{
  return MEMORY[0x263F8EE80];
}

uint64_t sub_21E4B70EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (uint64_t *)(v3 + OBJC_IVAR____TtC9FitnessUI12ModernButton_handlersForControlEvents);
  swift_beginAccess();
  uint64_t v8 = *v7;
  if (*(void *)(*v7 + 16) && (unint64_t v9 = sub_21E4B7B8C(a3), (v10 & 1) != 0))
  {
    uint64_t v11 = *(void **)(*(void *)(v8 + 56) + 8 * v9);
    swift_bridgeObjectRetain();
    if (v11[2]) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x263F8EE78];
    if (*(void *)(MEMORY[0x263F8EE78] + 16)) {
      goto LABEL_7;
    }
  }
  sub_21E4B72C8(a3);
LABEL_7:
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a1;
  *(void *)(v12 + 24) = a2;
  swift_retain();
  swift_retain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v11 = sub_21E4B82B4(0, v11[2] + 1, 1, v11);
  }
  unint64_t v14 = v11[2];
  unint64_t v13 = v11[3];
  if (v14 >= v13 >> 1) {
    uint64_t v11 = sub_21E4B82B4((void *)(v13 > 1), v14 + 1, 1, v11);
  }
  void v11[2] = v14 + 1;
  uint64_t v15 = &v11[2 * v14];
  void v15[4] = sub_21E4B7C30;
  v15[5] = v12;
  swift_release();
  swift_beginAccess();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v18 = *v7;
  *uint64_t v7 = 0x8000000000000000;
  sub_21E4B7F38((uint64_t)v11, a3, isUniquelyReferenced_nonNull_native);
  *uint64_t v7 = v18;
  swift_bridgeObjectRelease();
  return swift_endAccess();
}

id sub_21E4B72C8(uint64_t a1)
{
  switch(a1)
  {
    case 1:
      id result = objc_msgSend(v1, sel_addTarget_action_forControlEvents_, v1, sel_touchDown_, 1);
      break;
    case 2:
      id result = objc_msgSend(v1, sel_addTarget_action_forControlEvents_, v1, sel_touchDownRepeat_, 2);
      break;
    case 3:
    case 5:
    case 6:
    case 7:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 17:
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
    case 23:
    case 24:
    case 25:
    case 26:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 33:
    case 34:
    case 35:
    case 36:
    case 37:
    case 38:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
    case 49:
    case 50:
    case 51:
    case 52:
    case 53:
    case 54:
    case 55:
    case 56:
    case 57:
    case 58:
    case 59:
    case 60:
    case 61:
    case 62:
    case 63:
      goto LABEL_6;
    case 4:
      id result = objc_msgSend(v1, sel_addTarget_action_forControlEvents_, v1, sel_touchDragInside_, 4);
      break;
    case 8:
      id result = objc_msgSend(v1, sel_addTarget_action_forControlEvents_, v1, sel_touchDragOutside_, 8);
      break;
    case 16:
      id result = objc_msgSend(v1, sel_addTarget_action_forControlEvents_, v1, sel_touchDragEnter_, 16);
      break;
    case 32:
      id result = objc_msgSend(v1, sel_addTarget_action_forControlEvents_, v1, sel_touchDragExit_, 32);
      break;
    case 64:
      id result = objc_msgSend(v1, sel_addTarget_action_forControlEvents_, v1, sel_touchUpInside_, 64);
      break;
    default:
      if (a1 == 128)
      {
        id result = objc_msgSend(v1, sel_addTarget_action_forControlEvents_, v1, sel_touchUpOutside_, 128);
      }
      else if (a1 == 256)
      {
        id result = objc_msgSend(v1, sel_addTarget_action_forControlEvents_, v1, sel_touchCancel_, 256);
      }
      else
      {
LABEL_6:
        sub_21E4B8D14();
        swift_allocError();
        id result = (id)swift_willThrow();
      }
      break;
  }
  return result;
}

id sub_21E4B78F8(double a1, double a2, double a3, double a4)
{
  id v9 = objc_allocWithZone(v4);
  return objc_msgSend(v9, sel_initWithFrame_, a1, a2, a3, a4);
}

id sub_21E4B795C(double a1, double a2, double a3, double a4)
{
  *(void *)&v4[OBJC_IVAR____TtC9FitnessUI12ModernButton_handlersForControlEvents] = MEMORY[0x263F8EE80];
  v10.receiver = v4;
  v10.super_class = (Class)type metadata accessor for ModernButton();
  return objc_msgSendSuper2(&v10, sel_initWithFrame_, a1, a2, a3, a4);
}

id sub_21E4B7A58(void *a1)
{
  *(void *)&v1[OBJC_IVAR____TtC9FitnessUI12ModernButton_handlersForControlEvents] = MEMORY[0x263F8EE80];
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for ModernButton();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id sub_21E4B7B18()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ModernButton();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

BOOL sub_21E4B7B5C(void *a1, void *a2)
{
  return *a1 == *a2;
}

void *sub_21E4B7B70@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_21E4B7B80(void *a1@<X8>)
{
  *a1 = *v1;
}

unint64_t sub_21E4B7B8C(uint64_t a1)
{
  sub_21E4D1070();
  sub_21E4D1080();
  uint64_t v2 = sub_21E4D10B0();
  return sub_21E4B8074(a1, v2);
}

uint64_t sub_21E4B7BF8()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_21E4B7C30(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

uint64_t sub_21E4B7C5C(uint64_t a1, char a2)
{
  id v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D30050);
  uint64_t result = sub_21E4D0F40();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    uint64_t v32 = (void *)(v5 + 64);
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v31 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        unint64_t v18 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v19 = v18 | (v8 << 6);
      }
      else
      {
        int64_t v20 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        uint64_t result = v5 + 64;
        if (v20 >= v31) {
          goto LABEL_33;
        }
        unint64_t v21 = v32[v20];
        ++v8;
        if (!v21)
        {
          int64_t v8 = v20 + 1;
          if (v20 + 1 >= v31) {
            goto LABEL_33;
          }
          unint64_t v21 = v32[v8];
          if (!v21)
          {
            int64_t v22 = v20 + 2;
            if (v22 >= v31)
            {
LABEL_33:
              if ((a2 & 1) == 0)
              {
                uint64_t result = swift_release();
                id v3 = v2;
                goto LABEL_40;
              }
              uint64_t v30 = 1 << *(unsigned char *)(v5 + 32);
              if (v30 >= 64) {
                bzero(v32, ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                void *v32 = -1 << v30;
              }
              id v3 = v2;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v21 = v32[v22];
            if (!v21)
            {
              while (1)
              {
                int64_t v8 = v22 + 1;
                if (__OFADD__(v22, 1)) {
                  goto LABEL_42;
                }
                if (v8 >= v31) {
                  goto LABEL_33;
                }
                unint64_t v21 = v32[v8];
                ++v22;
                if (v21) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v8 = v22;
          }
        }
LABEL_30:
        unint64_t v11 = (v21 - 1) & v21;
        unint64_t v19 = __clz(__rbit64(v21)) + (v8 << 6);
      }
      uint64_t v27 = 8 * v19;
      uint64_t v28 = *(void *)(*(void *)(v5 + 48) + v27);
      uint64_t v29 = *(void *)(*(void *)(v5 + 56) + v27);
      if ((a2 & 1) == 0) {
        swift_bridgeObjectRetain();
      }
      sub_21E4D1070();
      sub_21E4D1080();
      uint64_t result = sub_21E4D10B0();
      uint64_t v13 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v14 = result & ~v13;
      unint64_t v15 = v14 >> 6;
      if (((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v23 = 0;
        unint64_t v24 = (unint64_t)(63 - v13) >> 6;
        do
        {
          if (++v15 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          BOOL v25 = v15 == v24;
          if (v15 == v24) {
            unint64_t v15 = 0;
          }
          v23 |= v25;
          uint64_t v26 = *(void *)(v12 + 8 * v15);
        }
        while (v26 == -1);
        unint64_t v16 = __clz(__rbit64(~v26)) + (v15 << 6);
      }
      *(void *)(v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      uint64_t v17 = 8 * v16;
      *(void *)(*(void *)(v7 + 48) + v17) = v28;
      *(void *)(*(void *)(v7 + 56) + v17) = v29;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_40:
  *id v3 = v7;
  return result;
}

uint64_t sub_21E4B7F38(uint64_t a1, uint64_t a2, char a3)
{
  id v4 = v3;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_21E4B7B8C(a2);
  uint64_t v11 = *(void *)(v8 + 16);
  BOOL v12 = (v9 & 1) == 0;
  uint64_t result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = *(void *)(v8 + 24);
  if (v15 >= result && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v15 >= result && (a3 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_21E4B8110();
LABEL_7:
    unint64_t v16 = (void *)*v4;
    if (v14)
    {
LABEL_8:
      uint64_t v17 = v16[7];
      uint64_t result = swift_bridgeObjectRelease();
      *(void *)(v17 + 8 * v10) = a1;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    uint64_t v19 = 8 * v10;
    *(void *)(v16[6] + v19) = a2;
    *(void *)(v16[7] + v19) = a1;
    uint64_t v20 = v16[2];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (!v21)
    {
      v16[2] = v22;
      return result;
    }
    goto LABEL_14;
  }
  sub_21E4B7C5C(result, a3 & 1);
  uint64_t result = sub_21E4B7B8C(a2);
  if ((v14 & 1) == (v18 & 1))
  {
    unint64_t v10 = result;
    unint64_t v16 = (void *)*v4;
    if (v14) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  type metadata accessor for Event();
  uint64_t result = sub_21E4D1000();
  __break(1u);
  return result;
}

unint64_t sub_21E4B8074(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(void *)(v7 + 8 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(void *)(v7 + 8 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

void *sub_21E4B8110()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D30050);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_21E4D0F30();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = *(void *)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 56) + v16) = v17;
    unint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v20 = v18 + 2;
  if (v20 >= v13) {
    goto LABEL_26;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_21E4B82B4(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D30058);
    uint64_t v10 = (void *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  if (v5)
  {
    if (v10 != a4 || v10 + 4 >= &a4[2 * v8 + 4]) {
      memmove(v10 + 4, a4 + 4, 16 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D30060);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_21E4B83D8()
{
  uint64_t v1 = v0;
  uint64_t v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC9FitnessUI12ModernButton_handlersForControlEvents);
  uint64_t result = swift_beginAccess();
  uint64_t v4 = *v2;
  if (*(void *)(v4 + 16))
  {
    uint64_t result = sub_21E4B7B8C(1);
    if (v5)
    {
      uint64_t v6 = *(void *)(*(void *)(v4 + 56) + 8 * result);
      uint64_t v7 = *(void *)(v6 + 16);
      if (v7)
      {
        swift_bridgeObjectRetain();
        uint64_t v8 = v6 + 40;
        do
        {
          uint64_t v9 = *(void (**)(uint64_t *))(v8 - 8);
          uint64_t v10 = v1;
          swift_retain();
          v9(&v10);
          swift_release();
          v8 += 16;
          --v7;
        }
        while (v7);
        return swift_bridgeObjectRelease();
      }
    }
  }
  return result;
}

uint64_t sub_21E4B849C()
{
  uint64_t v1 = v0;
  uint64_t v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC9FitnessUI12ModernButton_handlersForControlEvents);
  uint64_t result = swift_beginAccess();
  uint64_t v4 = *v2;
  if (*(void *)(v4 + 16))
  {
    uint64_t result = sub_21E4B7B8C(2);
    if (v5)
    {
      uint64_t v6 = *(void *)(*(void *)(v4 + 56) + 8 * result);
      uint64_t v7 = *(void *)(v6 + 16);
      if (v7)
      {
        swift_bridgeObjectRetain();
        uint64_t v8 = v6 + 40;
        do
        {
          uint64_t v9 = *(void (**)(uint64_t *))(v8 - 8);
          uint64_t v10 = v1;
          swift_retain();
          v9(&v10);
          swift_release();
          v8 += 16;
          --v7;
        }
        while (v7);
        return swift_bridgeObjectRelease();
      }
    }
  }
  return result;
}

uint64_t sub_21E4B8560()
{
  uint64_t v1 = v0;
  uint64_t v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC9FitnessUI12ModernButton_handlersForControlEvents);
  uint64_t result = swift_beginAccess();
  uint64_t v4 = *v2;
  if (*(void *)(v4 + 16))
  {
    uint64_t result = sub_21E4B7B8C(4);
    if (v5)
    {
      uint64_t v6 = *(void *)(*(void *)(v4 + 56) + 8 * result);
      uint64_t v7 = *(void *)(v6 + 16);
      if (v7)
      {
        swift_bridgeObjectRetain();
        uint64_t v8 = v6 + 40;
        do
        {
          uint64_t v9 = *(void (**)(uint64_t *))(v8 - 8);
          uint64_t v10 = v1;
          swift_retain();
          v9(&v10);
          swift_release();
          v8 += 16;
          --v7;
        }
        while (v7);
        return swift_bridgeObjectRelease();
      }
    }
  }
  return result;
}

uint64_t sub_21E4B8624()
{
  uint64_t v1 = v0;
  uint64_t v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC9FitnessUI12ModernButton_handlersForControlEvents);
  uint64_t result = swift_beginAccess();
  uint64_t v4 = *v2;
  if (*(void *)(v4 + 16))
  {
    uint64_t result = sub_21E4B7B8C(8);
    if (v5)
    {
      uint64_t v6 = *(void *)(*(void *)(v4 + 56) + 8 * result);
      uint64_t v7 = *(void *)(v6 + 16);
      if (v7)
      {
        swift_bridgeObjectRetain();
        uint64_t v8 = v6 + 40;
        do
        {
          uint64_t v9 = *(void (**)(uint64_t *))(v8 - 8);
          uint64_t v10 = v1;
          swift_retain();
          v9(&v10);
          swift_release();
          v8 += 16;
          --v7;
        }
        while (v7);
        return swift_bridgeObjectRelease();
      }
    }
  }
  return result;
}

uint64_t sub_21E4B86E8()
{
  uint64_t v1 = v0;
  uint64_t v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC9FitnessUI12ModernButton_handlersForControlEvents);
  uint64_t result = swift_beginAccess();
  uint64_t v4 = *v2;
  if (*(void *)(v4 + 16))
  {
    uint64_t result = sub_21E4B7B8C(16);
    if (v5)
    {
      uint64_t v6 = *(void *)(*(void *)(v4 + 56) + 8 * result);
      uint64_t v7 = *(void *)(v6 + 16);
      if (v7)
      {
        swift_bridgeObjectRetain();
        uint64_t v8 = v6 + 40;
        do
        {
          uint64_t v9 = *(void (**)(uint64_t *))(v8 - 8);
          uint64_t v10 = v1;
          swift_retain();
          v9(&v10);
          swift_release();
          v8 += 16;
          --v7;
        }
        while (v7);
        return swift_bridgeObjectRelease();
      }
    }
  }
  return result;
}

uint64_t sub_21E4B87AC()
{
  uint64_t v1 = v0;
  uint64_t v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC9FitnessUI12ModernButton_handlersForControlEvents);
  uint64_t result = swift_beginAccess();
  uint64_t v4 = *v2;
  if (*(void *)(v4 + 16))
  {
    uint64_t result = sub_21E4B7B8C(32);
    if (v5)
    {
      uint64_t v6 = *(void *)(*(void *)(v4 + 56) + 8 * result);
      uint64_t v7 = *(void *)(v6 + 16);
      if (v7)
      {
        swift_bridgeObjectRetain();
        uint64_t v8 = v6 + 40;
        do
        {
          uint64_t v9 = *(void (**)(uint64_t *))(v8 - 8);
          uint64_t v10 = v1;
          swift_retain();
          v9(&v10);
          swift_release();
          v8 += 16;
          --v7;
        }
        while (v7);
        return swift_bridgeObjectRelease();
      }
    }
  }
  return result;
}

uint64_t sub_21E4B8870()
{
  uint64_t v1 = v0;
  uint64_t v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC9FitnessUI12ModernButton_handlersForControlEvents);
  uint64_t result = swift_beginAccess();
  uint64_t v4 = *v2;
  if (*(void *)(v4 + 16))
  {
    uint64_t result = sub_21E4B7B8C(64);
    if (v5)
    {
      uint64_t v6 = *(void *)(*(void *)(v4 + 56) + 8 * result);
      uint64_t v7 = *(void *)(v6 + 16);
      if (v7)
      {
        swift_bridgeObjectRetain();
        uint64_t v8 = v6 + 40;
        do
        {
          uint64_t v9 = *(void (**)(uint64_t *))(v8 - 8);
          uint64_t v10 = v1;
          swift_retain();
          v9(&v10);
          swift_release();
          v8 += 16;
          --v7;
        }
        while (v7);
        return swift_bridgeObjectRelease();
      }
    }
  }
  return result;
}

uint64_t sub_21E4B8934()
{
  uint64_t v1 = v0;
  uint64_t v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC9FitnessUI12ModernButton_handlersForControlEvents);
  uint64_t result = swift_beginAccess();
  uint64_t v4 = *v2;
  if (*(void *)(v4 + 16))
  {
    uint64_t result = sub_21E4B7B8C(128);
    if (v5)
    {
      uint64_t v6 = *(void *)(*(void *)(v4 + 56) + 8 * result);
      uint64_t v7 = *(void *)(v6 + 16);
      if (v7)
      {
        swift_bridgeObjectRetain();
        uint64_t v8 = v6 + 40;
        do
        {
          uint64_t v9 = *(void (**)(uint64_t *))(v8 - 8);
          uint64_t v10 = v1;
          swift_retain();
          v9(&v10);
          swift_release();
          v8 += 16;
          --v7;
        }
        while (v7);
        return swift_bridgeObjectRelease();
      }
    }
  }
  return result;
}

uint64_t sub_21E4B89F8()
{
  uint64_t v1 = v0;
  uint64_t v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC9FitnessUI12ModernButton_handlersForControlEvents);
  uint64_t result = swift_beginAccess();
  uint64_t v4 = *v2;
  if (*(void *)(v4 + 16))
  {
    uint64_t result = sub_21E4B7B8C(256);
    if (v5)
    {
      uint64_t v6 = *(void *)(*(void *)(v4 + 56) + 8 * result);
      uint64_t v7 = *(void *)(v6 + 16);
      if (v7)
      {
        swift_bridgeObjectRetain();
        uint64_t v8 = v6 + 40;
        do
        {
          uint64_t v9 = *(void (**)(uint64_t *))(v8 - 8);
          uint64_t v10 = v1;
          swift_retain();
          v9(&v10);
          swift_release();
          v8 += 16;
          --v7;
        }
        while (v7);
        return swift_bridgeObjectRelease();
      }
    }
  }
  return result;
}

uint64_t type metadata accessor for ModernButton()
{
  return self;
}

unint64_t sub_21E4B8AE4()
{
  unint64_t result = qword_267D30030;
  if (!qword_267D30030)
  {
    type metadata accessor for Event();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D30030);
  }
  return result;
}

void type metadata accessor for Event()
{
  if (!qword_267D30040)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_267D30040);
    }
  }
}

unint64_t sub_21E4B8B98()
{
  unint64_t result = qword_267D30038;
  if (!qword_267D30038)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D30038);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ModernButton.RegistrationError(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *storeEnumTagSinglePayload for ModernButton.RegistrationError(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x21E4B8CDCLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for ModernButton.RegistrationError()
{
  return &type metadata for ModernButton.RegistrationError;
}

unint64_t sub_21E4B8D14()
{
  unint64_t result = qword_267D30048;
  if (!qword_267D30048)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D30048);
  }
  return result;
}

void sub_21E4B8D68()
{
  id v0 = objc_msgSend(self, sel_defaultCenter);
  sub_21E4D0CF0();
}

uint64_t FIUIUnitPreferenceUpdateObserver.__allocating_init()()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F780);
  MEMORY[0x270FA5388](v0 - 8);
  int v2 = (char *)&v8 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = swift_allocObject();
  swift_defaultActor_initialize();
  id v4 = objc_msgSend(self, sel_defaultCenter);
  sub_21E4D0CF0();

  *(void *)(v3 + OBJC_IVAR____TtC9FitnessUI32FIUIUnitPreferenceUpdateObserver_observerTask) = 0;
  uint64_t v5 = sub_21E4D0C50();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v2, 1, 1, v5);
  uint64_t v6 = (void *)swift_allocObject();
  void v6[2] = 0;
  v6[3] = 0;
  v6[4] = v3;
  swift_retain();
  sub_21E4848FC((uint64_t)v2, (uint64_t)&unk_267D30070, (uint64_t)v6);
  swift_release();
  return v3;
}

uint64_t FIUIUnitPreferenceUpdateObserver.init()()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F780);
  MEMORY[0x270FA5388](v2 - 8);
  id v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_defaultActor_initialize();
  id v5 = objc_msgSend(self, sel_defaultCenter);
  sub_21E4D0CF0();

  *(void *)(v0 + OBJC_IVAR____TtC9FitnessUI32FIUIUnitPreferenceUpdateObserver_observerTask) = 0;
  uint64_t v6 = sub_21E4D0C50();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v4, 1, 1, v6);
  uint64_t v7 = (void *)swift_allocObject();
  void v7[2] = 0;
  v7[3] = 0;
  v7[4] = v1;
  swift_retain();
  sub_21E4848FC((uint64_t)v4, (uint64_t)&unk_267D30078, (uint64_t)v7);
  swift_release();
  return v1;
}

uint64_t sub_21E4B90C4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  *(void *)(v4 + 16) = a4;
  *(void *)(v4 + 24) = *a4;
  return MEMORY[0x270FA2498](sub_21E4B910C, a4, 0);
}

uint64_t sub_21E4B910C()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[3];
  uint64_t v3 = swift_allocObject();
  swift_weakInit();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  *(void *)(v4 + 24) = v2;
  sub_21E4D0CE0();
  sub_21E4B9A44(&qword_267D30088, MEMORY[0x263F07CB0]);
  uint64_t v5 = sub_21E4D0260();
  swift_release();
  *(void *)(v1 + OBJC_IVAR____TtC9FitnessUI32FIUIUnitPreferenceUpdateObserver_observerTask) = v5;
  swift_release();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_21E4B924C()
{
  uint64_t v2 = *(void **)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_21E485BA8;
  void v3[2] = v2;
  v3[3] = *v2;
  return MEMORY[0x270FA2498](sub_21E4B910C, v2, 0);
}

uint64_t objectdestroyTm_3()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_21E4B9360()
{
  uint64_t v2 = *(void **)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_21E484808;
  void v3[2] = v2;
  v3[3] = *v2;
  return MEMORY[0x270FA2498](sub_21E4B910C, v2, 0);
}

uint64_t sub_21E4B9430(uint64_t a1)
{
  uint64_t v2 = sub_21E4D0050();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = a1 + 16;
  uint64_t v7 = sub_21E4B3930();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v7, v2);
  uint64_t v8 = sub_21E4D0030();
  os_log_type_t v9 = sub_21E4D0CD0();
  if (os_log_type_enabled(v8, v9))
  {
    v15[1] = v6;
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    v16[0] = v11;
    *(_DWORD *)uint64_t v10 = 136315138;
    uint64_t v12 = sub_21E4D10C0();
    void v15[2] = sub_21E489B2C(v12, v13, v16);
    sub_21E4D0D30();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21E433000, v8, v9, "%s Received received unit preference update", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x223C29AE0](v11, -1, -1);
    MEMORY[0x223C29AE0](v10, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    type metadata accessor for FIUIUnitPreferenceUpdateObserver();
    sub_21E4B9A44(&qword_267D2F9E0, (void (*)(uint64_t))type metadata accessor for FIUIUnitPreferenceUpdateObserver);
    sub_21E4D0240();
    swift_release();
    sub_21E4D0250();
    return swift_release();
  }
  return result;
}

uint64_t FIUIUnitPreferenceUpdateObserver.deinit()
{
  uint64_t v1 = v0;
  if (*(void *)(v0 + OBJC_IVAR____TtC9FitnessUI32FIUIUnitPreferenceUpdateObserver_observerTask))
  {
    swift_retain();
    sub_21E4D0230();
    swift_release();
  }
  uint64_t v2 = v0 + OBJC_IVAR____TtC9FitnessUI32FIUIUnitPreferenceUpdateObserver_unitPreferencePublisher;
  uint64_t v3 = sub_21E4D0CE0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  swift_release();
  swift_defaultActor_destroy();
  return v1;
}

uint64_t FIUIUnitPreferenceUpdateObserver.__deallocating_deinit()
{
  uint64_t v1 = v0;
  if (*(void *)(v0 + OBJC_IVAR____TtC9FitnessUI32FIUIUnitPreferenceUpdateObserver_observerTask))
  {
    swift_retain();
    sub_21E4D0230();
    swift_release();
  }
  uint64_t v2 = v0 + OBJC_IVAR____TtC9FitnessUI32FIUIUnitPreferenceUpdateObserver_unitPreferencePublisher;
  uint64_t v3 = sub_21E4D0CE0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  swift_release();
  swift_defaultActor_destroy();
  return MEMORY[0x270FA2418](v1);
}

uint64_t FIUIUnitPreferenceUpdateObserver.unownedExecutor.getter()
{
  return v0;
}

uint64_t sub_21E4B9824()
{
  return v0;
}

uint64_t sub_21E4B9830@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for FIUIUnitPreferenceUpdateObserver();
  uint64_t result = sub_21E4D0240();
  *a1 = result;
  return result;
}

uint64_t sub_21E4B9870()
{
  return type metadata accessor for FIUIUnitPreferenceUpdateObserver();
}

uint64_t type metadata accessor for FIUIUnitPreferenceUpdateObserver()
{
  uint64_t result = qword_267D313E0;
  if (!qword_267D313E0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_21E4B98C4()
{
  uint64_t result = sub_21E4D0CE0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for FIUIUnitPreferenceUpdateObserver(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for FIUIUnitPreferenceUpdateObserver);
}

uint64_t dispatch thunk of FIUIUnitPreferenceUpdateObserver.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t sub_21E4B9994()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_21E4B99CC()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_21E4B9A04()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_21E4B9A3C()
{
  return sub_21E4B9430(*(void *)(v0 + 16));
}

uint64_t sub_21E4B9A44(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t MindfulnessSessionViewModel.uuid.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4B9AEC(&OBJC_IVAR____TtC9FitnessUI27MindfulnessSessionViewModel_uuid, MEMORY[0x263F07508], a1);
}

uint64_t MindfulnessSessionViewModel.startDate.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4B9AEC(&OBJC_IVAR____TtC9FitnessUI27MindfulnessSessionViewModel_startDate, MEMORY[0x263F07490], a1);
}

uint64_t MindfulnessSessionViewModel.endDate.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4B9AEC(&OBJC_IVAR____TtC9FitnessUI27MindfulnessSessionViewModel_endDate, MEMORY[0x263F07490], a1);
}

uint64_t sub_21E4B9AEC@<X0>(void *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = v3 + *a1;
  uint64_t v6 = a2(0);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  return v7(a3, v5, v6);
}

double MindfulnessSessionViewModel.duration.getter()
{
  return *(double *)(v0 + OBJC_IVAR____TtC9FitnessUI27MindfulnessSessionViewModel_duration);
}

uint64_t MindfulnessSessionViewModel.metadata.getter()
{
  return swift_bridgeObjectRetain();
}

id MindfulnessSessionViewModel.sourceRevision.getter()
{
  return *(id *)(v0 + OBJC_IVAR____TtC9FitnessUI27MindfulnessSessionViewModel_sourceRevision);
}

uint64_t MindfulnessSessionViewModel.mindfulnessSessions.getter()
{
  return swift_bridgeObjectRetain();
}

id MindfulnessSessionViewModel.__allocating_init(uuid:startDate:endDate:duration:metadata:sourceRevision:mindfulnessSessions:)(uint64_t a1, char *a2, char *a3, uint64_t a4, char a5, uint64_t a6, void *a7, uint64_t a8)
{
  int v16 = a5 & 1;
  id v17 = objc_allocWithZone(v8);
  id v18 = sub_21E4BB10C(a1, a2, a3, a4, v16, a6, a7, a8);

  return v18;
}

id MindfulnessSessionViewModel.init(uuid:startDate:endDate:duration:metadata:sourceRevision:mindfulnessSessions:)(uint64_t a1, char *a2, char *a3, uint64_t a4, char a5, uint64_t a6, void *a7, uint64_t a8)
{
  id v9 = sub_21E4BB10C(a1, a2, a3, a4, a5 & 1, a6, a7, a8);

  return v9;
}

uint64_t sub_21E4B9D50()
{
  unint64_t v1 = v0;
  uint64_t v7 = 0;
  unint64_t v8 = 0xE000000000000000;
  sub_21E4D0DC0();
  v6.receiver = v0;
  v6.super_class = (Class)type metadata accessor for MindfulnessSessionViewModel();
  id v2 = objc_msgSendSuper2(&v6, sel_description);
  sub_21E4D0AF0();

  sub_21E4D0B60();
  swift_bridgeObjectRelease();
  sub_21E4D0B60();
  sub_21E4CFE50();
  sub_21E4BB438(&qword_267D2FB88, MEMORY[0x263F07508]);
  sub_21E4D0F90();
  sub_21E4D0B60();
  swift_bridgeObjectRelease();
  sub_21E4D0B60();
  sub_21E4CFE10();
  sub_21E4BB438(&qword_267D30000, MEMORY[0x263F07490]);
  sub_21E4D0F90();
  sub_21E4D0B60();
  swift_bridgeObjectRelease();
  sub_21E4D0B60();
  sub_21E4D0F90();
  sub_21E4D0B60();
  swift_bridgeObjectRelease();
  sub_21E4D0B60();
  sub_21E4D0C80();
  sub_21E4D0B60();
  if (!*(void *)&v1[OBJC_IVAR____TtC9FitnessUI27MindfulnessSessionViewModel_metadata]) {
    sub_21E4BA0A8(MEMORY[0x263F8EE78]);
  }
  swift_bridgeObjectRetain();
  sub_21E4D0A20();
  sub_21E4D0B60();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21E4D0B60();
  id v3 = *(id *)&v1[OBJC_IVAR____TtC9FitnessUI27MindfulnessSessionViewModel_sourceRevision];
  id v4 = objc_msgSend(v3, sel_description);
  sub_21E4D0AF0();

  sub_21E4D0B60();
  swift_bridgeObjectRelease();
  return v7;
}

unint64_t sub_21E4BA0A8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    id v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D30090);
  uint64_t v2 = sub_21E4D0F60();
  id v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_21E4BB608(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_21E4B4B34(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_21E4B4F4C(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    void v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

id sub_21E4BA1D4()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC9FitnessUI27MindfulnessSessionViewModel_metadata);
  if (!v1)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    sub_21E4B4440((uint64_t)&v13);
    long long v13 = 0u;
    long long v14 = 0u;
LABEL_17:
    sub_21E4B4440((uint64_t)&v13);
    return 0;
  }
  uint64_t v2 = sub_21E4D0AF0();
  if (!*(void *)(v1 + 16) || (unint64_t v4 = sub_21E4B4B34(v2, v3), (v5 & 1) == 0))
  {
    long long v13 = 0u;
    long long v14 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
  sub_21E48A4D8(*(void *)(v1 + 56) + 32 * v4, (uint64_t)&v13);
  swift_bridgeObjectRelease();
  if (!*((void *)&v14 + 1))
  {
LABEL_8:
    sub_21E4B4440((uint64_t)&v13);
    goto LABEL_9;
  }
  sub_21E483EA0();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_9:
    uint64_t v7 = sub_21E4D0AF0();
    if (*(void *)(v1 + 16) && (unint64_t v9 = sub_21E4B4B34(v7, v8), (v10 & 1) != 0))
    {
      sub_21E48A4D8(*(void *)(v1 + 56) + 32 * v9, (uint64_t)&v13);
    }
    else
    {
      long long v13 = 0u;
      long long v14 = 0u;
    }
    swift_bridgeObjectRelease();
    if (*((void *)&v14 + 1))
    {
      sub_21E4B4440((uint64_t)&v13);
      return 0;
    }
    goto LABEL_17;
  }
  id v6 = objc_msgSend(v12, sel_integerValue);

  return v6;
}

id MindfulnessSessionViewModel.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void MindfulnessSessionViewModel.init()()
{
}

id MindfulnessSessionViewModel.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MindfulnessSessionViewModel();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void static MindfulnessSessionViewModel.makeMindfulnessSessionViewModels(from:)(unint64_t a1)
{
  uint64_t v100 = sub_21E4CFE50();
  uint64_t v2 = *(void *)(v100 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v100);
  uint64_t v106 = (char *)&v85 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  id v6 = (char *)&v85 - v5;
  uint64_t v7 = sub_21E4CFE10();
  unint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v105 = (char *)&v85 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  long long v13 = (char *)&v85 - v12;
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v16 = (char *)&v85 - v15;
  MEMORY[0x270FA5388](v14);
  id v18 = (char *)&v85 - v17;
  unint64_t v113 = MEMORY[0x263F8EE78];
  if (a1 >> 62) {
    goto LABEL_61;
  }
  uint64_t v19 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v19)
  {
LABEL_38:
    swift_bridgeObjectRelease();
    return;
  }
LABEL_3:
  if (v19 >= 1)
  {
    uint64_t v99 = v7;
    uint64_t v85 = v6;
    uint64_t v20 = 0;
    unint64_t v98 = a1 & 0xC000000000000001;
    uint64_t v96 = (void (**)(char *, uint64_t))(v8 + 8);
    uint64_t v95 = (void (**)(char *, char *, uint64_t))(v2 + 16);
    uint64_t v94 = (void (**)(char *, char *, uint64_t))(v8 + 16);
    uint64_t v90 = (void (**)(char *, uint64_t))(v2 + 8);
    long long v89 = xmmword_21E4DA2C0;
    uint64_t v88 = MEMORY[0x263F8EE58] + 8;
    unint64_t v87 = (unint64_t)"lnessSessionViewModel";
    uint64_t v86 = 0x800000021E4DF9C0;
    unint64_t v93 = a1;
    uint64_t v92 = v16;
    uint64_t v91 = v18;
    uint64_t v97 = v19;
    while (1)
    {
      BOOL v21 = v98 ? (char *)MEMORY[0x223C282E0](v20, a1) : (char *)*(id *)(a1 + 8 * v20 + 32);
      id v6 = v21;
      id v22 = objc_msgSend(v21, sel_metadata, v85);
      uint64_t v107 = v6;
      uint64_t v104 = v20;
      if (!v22) {
        break;
      }
      char v23 = v22;
      uint64_t v24 = sub_21E4D0A10();

      if (*(void *)(v24 + 16)
        && (unint64_t v25 = sub_21E4B4B34(0xD000000000000022, v87 | 0x8000000000000000), (v26 & 1) != 0))
      {
        sub_21E48A4D8(*(void *)(v24 + 56) + 32 * v25, (uint64_t)&v111);
      }
      else
      {
        long long v111 = 0u;
        long long v112 = 0u;
      }
      swift_bridgeObjectRelease();
      if (!*((void *)&v112 + 1)) {
        goto LABEL_30;
      }
      if ((swift_dynamicCast() & 1) == 0) {
        goto LABEL_31;
      }
      uint64_t v2 = v108;
      uint64_t v7 = v109;
      unint64_t v8 = v113;
      if (v113 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v27 = sub_21E4D0F20();
        if (!v27)
        {
LABEL_55:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          goto LABEL_31;
        }
      }
      else
      {
        uint64_t v27 = *(void *)((v113 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        if (!v27) {
          goto LABEL_55;
        }
      }
      unint64_t v28 = v27 - 1;
      if (__OFSUB__(v27, 1))
      {
        __break(1u);
LABEL_59:
        __break(1u);
LABEL_60:
        __break(1u);
LABEL_61:
        swift_bridgeObjectRetain();
        uint64_t v19 = sub_21E4D0F20();
        if (!v19) {
          goto LABEL_38;
        }
        goto LABEL_3;
      }
      if ((v8 & 0xC000000000000001) != 0)
      {
        uint64_t v29 = (char *)MEMORY[0x223C282E0](v28, v8);
      }
      else
      {
        if ((v28 & 0x8000000000000000) != 0) {
          goto LABEL_59;
        }
        if (v28 >= *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          goto LABEL_60;
        }
        uint64_t v29 = (char *)*(id *)(v8 + 8 * v28 + 32);
      }
      uint64_t v30 = v29;
      swift_bridgeObjectRelease();
      uint64_t v31 = OBJC_IVAR____TtC9FitnessUI27MindfulnessSessionViewModel_metadata;
      uint64_t v32 = *(void *)&v30[OBJC_IVAR____TtC9FitnessUI27MindfulnessSessionViewModel_metadata];
      if (!v32
        || !*(void *)(v32 + 16)
        || (unint64_t v33 = sub_21E4B4B34(0xD000000000000022, v86), (v34 & 1) == 0)
        || (sub_21E48A4D8(*(void *)(v32 + 56) + 32 * v33, (uint64_t)&v111), (swift_dynamicCast() & 1) == 0))
      {

        swift_bridgeObjectRelease();
        id v6 = v107;
        goto LABEL_31;
      }
      if (v108 == v2 && v109 == v7)
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        char v62 = sub_21E4D0FB0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v62 & 1) == 0)
        {

          id v6 = v107;
          goto LABEL_31;
        }
      }
      double v63 = *(double *)&v30[OBJC_IVAR____TtC9FitnessUI27MindfulnessSessionViewModel_duration];
      uint64_t v64 = v30;
      id v65 = v107;
      id v66 = objc_msgSend(v107, sel_endDate);
      sub_21E4CFDF0();

      id v67 = objc_msgSend(v65, sel_startDate);
      sub_21E4CFDF0();

      sub_21E4CFDC0();
      double v69 = v68;
      unint64_t v70 = *v96;
      uint64_t v71 = v99;
      (*v96)(v16, v99);
      v70(v18, v71);
      *(void *)&long long v111 = *(void *)&v64[OBJC_IVAR____TtC9FitnessUI27MindfulnessSessionViewModel_mindfulnessSessions];
      swift_bridgeObjectRetain_n();
      id v72 = v65;
      MEMORY[0x223C280B0]();
      if (*(void *)((v111 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v111 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_21E4D0BF0();
      }
      sub_21E4D0C00();
      sub_21E4D0BE0();
      uint64_t v103 = v111;
      swift_bridgeObjectRelease();
      (*v95)(v85, &v64[OBJC_IVAR____TtC9FitnessUI27MindfulnessSessionViewModel_uuid], v100);
      id v73 = objc_msgSend(v72, sel_startDate);
      sub_21E4CFDF0();

      (*v94)(v16, &v64[OBJC_IVAR____TtC9FitnessUI27MindfulnessSessionViewModel_endDate], v99);
      uint64_t v74 = *(void *)&v64[v31];
      id v102 = v64;
      os_log_t v75 = *(void **)&v64[OBJC_IVAR____TtC9FitnessUI27MindfulnessSessionViewModel_sourceRevision];
      id v76 = objc_allocWithZone((Class)type metadata accessor for MindfulnessSessionViewModel());
      swift_bridgeObjectRetain();
      id v77 = v75;
      id v78 = sub_21E4BB10C((uint64_t)v85, v18, v16, COERCE__INT64(v63 + v69), 0, v74, v77, v103);

      unint64_t v79 = v113;
      if (v113 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v80 = sub_21E4D0F20();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v80 = *(void *)((v113 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      uint64_t v60 = v97;
      uint64_t v61 = v104;
      BOOL v81 = __OFSUB__(v80, 1);
      unint64_t v82 = v80 - 1;
      if (v81) {
        goto LABEL_64;
      }
      id v59 = v78;
      if (!swift_isUniquelyReferenced_nonNull_bridgeObject()
        || (v79 & 0x8000000000000000) != 0
        || (v79 & 0x4000000000000000) != 0)
      {
        sub_21E4BB090(v79);
        unint64_t v79 = v83;
        unint64_t v113 = v83;
      }
      if ((v82 & 0x8000000000000000) != 0) {
        goto LABEL_65;
      }
      if (v82 >= *(void *)((v79 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        goto LABEL_66;
      }
      uint64_t v84 = *(void **)((v79 & 0xFFFFFFFFFFFFFF8) + 8 * v82 + 0x20);
      *(void *)((v79 & 0xFFFFFFFFFFFFFF8) + 8 * v82 + 0x20) = v59;

      sub_21E4D0BE0();
LABEL_37:
      uint64_t v20 = v61 + 1;

      if (v60 == v20) {
        goto LABEL_38;
      }
    }
    long long v111 = 0u;
    long long v112 = 0u;
LABEL_30:
    sub_21E4B4440((uint64_t)&v111);
LABEL_31:
    id v35 = objc_msgSend(v6, sel_UUID);
    sub_21E4CFE30();

    id v36 = objc_msgSend(v6, sel_startDate);
    sub_21E4CFDF0();

    id v37 = objc_msgSend(v6, sel_endDate);
    sub_21E4CFDF0();

    id v38 = objc_msgSend(v6, sel_metadata);
    if (v38)
    {
      id v39 = v38;
      uint64_t v103 = sub_21E4D0A10();
    }
    else
    {
      uint64_t v103 = 0;
    }
    id v102 = objc_msgSend(v6, sel_sourceRevision);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AB08758);
    uint64_t v40 = swift_allocObject();
    *(_OWORD *)(v40 + 16) = v89;
    *(void *)(v40 + 32) = v6;
    *(void *)&long long v111 = v40;
    sub_21E4D0BE0();
    uint64_t v101 = v111;
    uint64_t v41 = (objc_class *)type metadata accessor for MindfulnessSessionViewModel();
    uint64_t v42 = (char *)objc_allocWithZone(v41);
    uint64_t v43 = v106;
    uint64_t v44 = v100;
    (*v95)(&v42[OBJC_IVAR____TtC9FitnessUI27MindfulnessSessionViewModel_uuid], v106, v100);
    uint64_t v45 = v6;
    id v46 = *v94;
    uint64_t v47 = v99;
    (*v94)(&v42[OBJC_IVAR____TtC9FitnessUI27MindfulnessSessionViewModel_startDate], v13, v99);
    uint64_t v48 = v13;
    uint64_t v49 = v105;
    v46(&v42[OBJC_IVAR____TtC9FitnessUI27MindfulnessSessionViewModel_endDate], v105, v47);
    id v50 = v45;
    uint64_t v51 = v42;
    sub_21E4CFDC0();
    *(void *)&v51[OBJC_IVAR____TtC9FitnessUI27MindfulnessSessionViewModel_duration] = v52;
    *(void *)&v51[OBJC_IVAR____TtC9FitnessUI27MindfulnessSessionViewModel_metadata] = v103;
    uint64_t v54 = v101;
    id v53 = v102;
    *(void *)&v51[OBJC_IVAR____TtC9FitnessUI27MindfulnessSessionViewModel_sourceRevision] = v102;
    *(void *)&v51[OBJC_IVAR____TtC9FitnessUI27MindfulnessSessionViewModel_mindfulnessSessions] = v54;
    id v55 = v53;

    v110.receiver = v51;
    v110.super_class = v41;
    id v56 = objc_msgSendSuper2(&v110, sel_init);

    uint64_t v57 = *v96;
    uint64_t v58 = v49;
    long long v13 = v48;
    (*v96)(v58, v47);
    v57(v48, v47);
    (*v90)(v43, v44);
    id v59 = v56;
    MEMORY[0x223C280B0]();
    if (*(void *)((v113 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v113 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_21E4D0BF0();
    }
    sub_21E4D0C00();
    sub_21E4D0BE0();
    a1 = v93;
    uint64_t v16 = v92;
    id v18 = v91;
    uint64_t v60 = v97;
    uint64_t v61 = v104;
    goto LABEL_37;
  }
  __break(1u);
LABEL_64:
  __break(1u);
LABEL_65:
  __break(1u);
LABEL_66:
  __break(1u);
}

void sub_21E4BB090(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_21E4D0F20();
    swift_bridgeObjectRelease();
  }
  JUMPOUT(0x223C282F0);
}

id sub_21E4BB10C(uint64_t a1, char *a2, char *a3, uint64_t a4, int a5, uint64_t a6, void *a7, uint64_t a8)
{
  uint64_t v9 = v8;
  uint64_t v41 = a8;
  uint64_t v42 = a7;
  uint64_t v39 = a6;
  int v38 = a5;
  uint64_t v37 = a4;
  uint64_t v13 = sub_21E4CFE10();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v36 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v36 - v18;
  uint64_t v20 = &v9[OBJC_IVAR____TtC9FitnessUI27MindfulnessSessionViewModel_uuid];
  uint64_t v21 = sub_21E4CFE50();
  uint64_t v22 = *(void *)(v21 - 8);
  char v23 = *(void (**)(char *, uint64_t))(v22 + 16);
  uint64_t v45 = a1;
  uint64_t v40 = v21;
  v23(v20, a1);
  uint64_t v24 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
  v24(&v9[OBJC_IVAR____TtC9FitnessUI27MindfulnessSessionViewModel_startDate], (uint64_t)a2, v13);
  v24(&v9[OBJC_IVAR____TtC9FitnessUI27MindfulnessSessionViewModel_endDate], (uint64_t)a3, v13);
  uint64_t v43 = a3;
  v24(v19, (uint64_t)a3, v13);
  uint64_t v44 = a2;
  v24(v17, (uint64_t)a2, v13);
  if (v38)
  {
    uint64_t v27 = v9;
    sub_21E4CFDC0();
    uint64_t v25 = v28;
  }
  else
  {
    uint64_t v25 = v37;
    char v26 = v9;
  }
  uint64_t v29 = *(void (**)(char *, uint64_t))(v14 + 8);
  v29(v17, v13);
  v29(v19, v13);
  *(void *)&v9[OBJC_IVAR____TtC9FitnessUI27MindfulnessSessionViewModel_duration] = v25;
  *(void *)&v9[OBJC_IVAR____TtC9FitnessUI27MindfulnessSessionViewModel_metadata] = v39;
  uint64_t v31 = v41;
  uint64_t v30 = v42;
  *(void *)&v9[OBJC_IVAR____TtC9FitnessUI27MindfulnessSessionViewModel_sourceRevision] = v42;
  *(void *)&v9[OBJC_IVAR____TtC9FitnessUI27MindfulnessSessionViewModel_mindfulnessSessions] = v31;
  id v32 = v30;

  unint64_t v33 = (objc_class *)type metadata accessor for MindfulnessSessionViewModel();
  v46.receiver = v9;
  v46.super_class = v33;
  id v34 = objc_msgSendSuper2(&v46, sel_init);
  v29(v43, v13);
  v29(v44, v13);
  (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v45, v40);
  return v34;
}

uint64_t type metadata accessor for MindfulnessSessionViewModel()
{
  uint64_t result = qword_26AB09090;
  if (!qword_26AB09090) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_21E4BB438(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_21E4BB480()
{
  return type metadata accessor for MindfulnessSessionViewModel();
}

uint64_t sub_21E4BB488()
{
  uint64_t result = sub_21E4CFE50();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_21E4CFE10();
    if (v2 <= 0x3F) {
      return swift_updateClassMetadata2();
    }
  }
  return result;
}

uint64_t method lookup function for MindfulnessSessionViewModel(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for MindfulnessSessionViewModel);
}

uint64_t dispatch thunk of MindfulnessSessionViewModel.__allocating_init(uuid:startDate:endDate:duration:metadata:sourceRevision:mindfulnessSessions:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, void))(v5 + 136))(a1, a2, a3, a4, a5 & 1);
}

uint64_t dispatch thunk of MindfulnessSessionViewModel.sessionType.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90))();
}

uint64_t sub_21E4BB608(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D30098);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

id UIButton.title(_:for:)()
{
  uint64_t v0 = (void *)sub_21E4D0AB0();
  objc_msgSend(v2, sel_setTitle_forState_, v0, objc_msgSend(v2, sel_state));

  return v2;
}

id UIButton.titleColor(_:for:)(uint64_t a1)
{
  objc_msgSend(v3, sel_setTitleColor_forState_, a1, objc_msgSend(v1, sel_state));
  return v3;
}

id UIButton.titleLabelFont(_:)(uint64_t a1)
{
  id v3 = objc_msgSend(v1, sel_titleLabel);
  objc_msgSend(v3, sel_setFont_, a1);

  return v5;
}

id UIButton.backgroundImage(_:for:)(uint64_t a1, uint64_t a2)
{
  objc_msgSend(v2, sel_setBackgroundImage_forState_, a1, a2);
  return v4;
}

id UIButton.adjustTitleLabelFontForDynamicType(_:)(char a1)
{
  id v3 = objc_msgSend(v1, sel_titleLabel);
  if (v3)
  {
    id v4 = v3;
  }
  return v6;
}

uint64_t sub_21E4BB874()
{
  return swift_deallocClassInstance();
}

id sub_21E4BB884()
{
  type metadata accessor for ResourceBundleClass();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  qword_267D313F8 = (uint64_t)result;
  return result;
}

uint64_t sub_21E4BB8D8(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D32AD0);
}

uint64_t sub_21E4BB8FC()
{
  return sub_21E4CED4C(&qword_267D31400, (uint64_t)qword_267D32AD0);
}

uint64_t sub_21E4BB920@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31400, (uint64_t)qword_267D32AD0, a1);
}

uint64_t sub_21E4BB944(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D32AE8);
}

uint64_t sub_21E4BB968()
{
  return sub_21E4CED4C(&qword_267D31408, (uint64_t)qword_267D32AE8);
}

uint64_t sub_21E4BB98C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31408, (uint64_t)qword_267D32AE8, a1);
}

uint64_t sub_21E4BB9B0(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D32B00);
}

uint64_t sub_21E4BB9D4()
{
  return sub_21E4CED4C(&qword_267D31410, (uint64_t)qword_267D32B00);
}

uint64_t sub_21E4BB9F8@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31410, (uint64_t)qword_267D32B00, a1);
}

uint64_t sub_21E4BBA1C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D32B18);
}

uint64_t sub_21E4BBA40()
{
  return sub_21E4CED4C(&qword_267D31418, (uint64_t)qword_267D32B18);
}

uint64_t sub_21E4BBA64@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31418, (uint64_t)qword_267D32B18, a1);
}

uint64_t sub_21E4BBA88(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D32B30);
}

uint64_t sub_21E4BBAAC()
{
  return sub_21E4CED4C(&qword_267D31420, (uint64_t)qword_267D32B30);
}

uint64_t sub_21E4BBAD0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31420, (uint64_t)qword_267D32B30, a1);
}

uint64_t sub_21E4BBAF4(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D32B48);
}

uint64_t sub_21E4BBB18()
{
  return sub_21E4CED4C(&qword_267D31428, (uint64_t)qword_267D32B48);
}

uint64_t sub_21E4BBB3C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31428, (uint64_t)qword_267D32B48, a1);
}

uint64_t sub_21E4BBB60(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D32B60);
}

uint64_t sub_21E4BBB88()
{
  return sub_21E4CED4C(&qword_267D31430, (uint64_t)qword_267D32B60);
}

uint64_t sub_21E4BBBAC@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31430, (uint64_t)qword_267D32B60, a1);
}

uint64_t sub_21E4BBBD0(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D32B78);
}

uint64_t sub_21E4BBBF4()
{
  return sub_21E4CED4C(&qword_267D31438, (uint64_t)qword_267D32B78);
}

uint64_t sub_21E4BBC18@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31438, (uint64_t)qword_267D32B78, a1);
}

uint64_t sub_21E4BBC3C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D32B90);
}

uint64_t sub_21E4BBC64()
{
  return sub_21E4CED4C(&qword_267D31440, (uint64_t)qword_267D32B90);
}

uint64_t sub_21E4BBC88@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31440, (uint64_t)qword_267D32B90, a1);
}

uint64_t sub_21E4BBCAC(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D32BA8);
}

uint64_t sub_21E4BBCD0()
{
  return sub_21E4CED4C(&qword_267D31448, (uint64_t)qword_267D32BA8);
}

uint64_t sub_21E4BBCF4@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31448, (uint64_t)qword_267D32BA8, a1);
}

uint64_t sub_21E4BBD18(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D32BC0);
}

uint64_t sub_21E4BBD3C()
{
  return sub_21E4CED4C(&qword_267D31450, (uint64_t)qword_267D32BC0);
}

uint64_t sub_21E4BBD60@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31450, (uint64_t)qword_267D32BC0, a1);
}

uint64_t sub_21E4BBD84(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D32BD8);
}

uint64_t sub_21E4BBDA8()
{
  return sub_21E4CED4C(&qword_267D31458, (uint64_t)qword_267D32BD8);
}

uint64_t sub_21E4BBDCC@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31458, (uint64_t)qword_267D32BD8, a1);
}

uint64_t sub_21E4BBDF0(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D32BF0);
}

uint64_t sub_21E4BBE14()
{
  return sub_21E4CED4C(&qword_267D31460, (uint64_t)qword_267D32BF0);
}

uint64_t sub_21E4BBE38@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31460, (uint64_t)qword_267D32BF0, a1);
}

uint64_t sub_21E4BBE5C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D32C08);
}

uint64_t sub_21E4BBE80()
{
  return sub_21E4CED4C(&qword_267D31468, (uint64_t)qword_267D32C08);
}

uint64_t sub_21E4BBEA4@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31468, (uint64_t)qword_267D32C08, a1);
}

uint64_t sub_21E4BBEC8(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D32C20);
}

uint64_t sub_21E4BBEEC()
{
  return sub_21E4CED4C(&qword_267D31470, (uint64_t)qword_267D32C20);
}

uint64_t sub_21E4BBF10@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31470, (uint64_t)qword_267D32C20, a1);
}

uint64_t sub_21E4BBF34(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D32C38);
}

uint64_t sub_21E4BBF58()
{
  return sub_21E4CED4C(&qword_267D31478, (uint64_t)qword_267D32C38);
}

uint64_t sub_21E4BBF7C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31478, (uint64_t)qword_267D32C38, a1);
}

uint64_t sub_21E4BBFA0(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D32C50);
}

uint64_t sub_21E4BBFC0()
{
  return sub_21E4CED4C(&qword_267D31480, (uint64_t)qword_267D32C50);
}

uint64_t sub_21E4BBFE4@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31480, (uint64_t)qword_267D32C50, a1);
}

uint64_t sub_21E4BC008(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D32C68);
}

uint64_t sub_21E4BC034()
{
  return sub_21E4CED4C(&qword_267D31488, (uint64_t)qword_267D32C68);
}

uint64_t sub_21E4BC058@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31488, (uint64_t)qword_267D32C68, a1);
}

uint64_t sub_21E4BC07C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D32C80);
}

uint64_t sub_21E4BC0A0()
{
  return sub_21E4CED4C(&qword_267D31490, (uint64_t)qword_267D32C80);
}

uint64_t sub_21E4BC0C4@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31490, (uint64_t)qword_267D32C80, a1);
}

uint64_t sub_21E4BC0E8(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D32C98);
}

uint64_t sub_21E4BC110()
{
  return sub_21E4CED4C(&qword_267D31498, (uint64_t)qword_267D32C98);
}

uint64_t sub_21E4BC134@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31498, (uint64_t)qword_267D32C98, a1);
}

uint64_t sub_21E4BC158(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D32CB0);
}

uint64_t sub_21E4BC180()
{
  return sub_21E4CED4C(&qword_267D314A0, (uint64_t)qword_267D32CB0);
}

uint64_t sub_21E4BC1A4@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D314A0, (uint64_t)qword_267D32CB0, a1);
}

uint64_t sub_21E4BC1C8(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D32CC8);
}

uint64_t sub_21E4BC1F0()
{
  return sub_21E4CED4C(&qword_267D314A8, (uint64_t)qword_267D32CC8);
}

uint64_t sub_21E4BC214@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D314A8, (uint64_t)qword_267D32CC8, a1);
}

uint64_t sub_21E4BC238(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D32CE0);
}

uint64_t sub_21E4BC25C()
{
  return sub_21E4CED4C(&qword_267D314B0, (uint64_t)qword_267D32CE0);
}

uint64_t sub_21E4BC280@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D314B0, (uint64_t)qword_267D32CE0, a1);
}

uint64_t sub_21E4BC2A4(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D32CF8);
}

uint64_t sub_21E4BC2C8()
{
  return sub_21E4CED4C(&qword_267D314B8, (uint64_t)qword_267D32CF8);
}

uint64_t sub_21E4BC2EC@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D314B8, (uint64_t)qword_267D32CF8, a1);
}

uint64_t sub_21E4BC310(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D32D10);
}

uint64_t sub_21E4BC334()
{
  return sub_21E4CED4C(&qword_267D314C0, (uint64_t)qword_267D32D10);
}

uint64_t sub_21E4BC358@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D314C0, (uint64_t)qword_267D32D10, a1);
}

uint64_t sub_21E4BC37C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D32D28);
}

uint64_t sub_21E4BC3A0()
{
  return sub_21E4CED4C(&qword_267D314C8, (uint64_t)qword_267D32D28);
}

uint64_t sub_21E4BC3C4@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D314C8, (uint64_t)qword_267D32D28, a1);
}

uint64_t sub_21E4BC3E8(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D32D40);
}

uint64_t sub_21E4BC40C()
{
  return sub_21E4CED4C(&qword_267D314D0, (uint64_t)qword_267D32D40);
}

uint64_t sub_21E4BC430@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D314D0, (uint64_t)qword_267D32D40, a1);
}

uint64_t sub_21E4BC454(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D32D58);
}

uint64_t sub_21E4BC478()
{
  return sub_21E4CED4C(&qword_267D314D8, (uint64_t)qword_267D32D58);
}

uint64_t sub_21E4BC49C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D314D8, (uint64_t)qword_267D32D58, a1);
}

uint64_t sub_21E4BC4C0(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D32D70);
}

uint64_t sub_21E4BC4E4()
{
  return sub_21E4CED4C(&qword_267D314E0, (uint64_t)qword_267D32D70);
}

uint64_t sub_21E4BC508@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D314E0, (uint64_t)qword_267D32D70, a1);
}

uint64_t sub_21E4BC52C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D32D88);
}

uint64_t sub_21E4BC558()
{
  return sub_21E4CED4C(&qword_267D314E8, (uint64_t)qword_267D32D88);
}

uint64_t sub_21E4BC57C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D314E8, (uint64_t)qword_267D32D88, a1);
}

uint64_t sub_21E4BC5A0(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D32DA0);
}

uint64_t sub_21E4BC5C4()
{
  return sub_21E4CED4C(&qword_267D314F0, (uint64_t)qword_267D32DA0);
}

uint64_t sub_21E4BC5E8@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D314F0, (uint64_t)qword_267D32DA0, a1);
}

uint64_t sub_21E4BC60C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D32DB8);
}

uint64_t sub_21E4BC638()
{
  return sub_21E4CED4C(&qword_267D314F8, (uint64_t)qword_267D32DB8);
}

uint64_t sub_21E4BC65C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D314F8, (uint64_t)qword_267D32DB8, a1);
}

uint64_t sub_21E4BC680(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D32DD0);
}

uint64_t sub_21E4BC6AC()
{
  return sub_21E4CED4C(&qword_267D31500, (uint64_t)qword_267D32DD0);
}

uint64_t sub_21E4BC6D0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31500, (uint64_t)qword_267D32DD0, a1);
}

uint64_t sub_21E4BC6F4(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D32DE8);
}

uint64_t sub_21E4BC720()
{
  return sub_21E4CED4C(&qword_267D31508, (uint64_t)qword_267D32DE8);
}

uint64_t sub_21E4BC744@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31508, (uint64_t)qword_267D32DE8, a1);
}

uint64_t sub_21E4BC768(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D32E00);
}

uint64_t sub_21E4BC784()
{
  return sub_21E4CED4C(&qword_267D31510, (uint64_t)qword_267D32E00);
}

uint64_t sub_21E4BC7A8@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31510, (uint64_t)qword_267D32E00, a1);
}

uint64_t sub_21E4BC7CC(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D32E18);
}

uint64_t sub_21E4BC7F4()
{
  return sub_21E4CED4C(&qword_267D31518, (uint64_t)qword_267D32E18);
}

uint64_t sub_21E4BC818@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31518, (uint64_t)qword_267D32E18, a1);
}

uint64_t sub_21E4BC83C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D32E30);
}

uint64_t sub_21E4BC860()
{
  return sub_21E4CED4C(&qword_267D31520, (uint64_t)qword_267D32E30);
}

uint64_t sub_21E4BC884@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31520, (uint64_t)qword_267D32E30, a1);
}

uint64_t sub_21E4BC8A8(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D32E48);
}

uint64_t sub_21E4BC8CC()
{
  return sub_21E4CED4C(&qword_267D31528, (uint64_t)qword_267D32E48);
}

uint64_t sub_21E4BC8F0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31528, (uint64_t)qword_267D32E48, a1);
}

uint64_t sub_21E4BC914(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D32E60);
}

uint64_t sub_21E4BC938()
{
  return sub_21E4CED4C(&qword_267D31530, (uint64_t)qword_267D32E60);
}

uint64_t sub_21E4BC95C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31530, (uint64_t)qword_267D32E60, a1);
}

uint64_t sub_21E4BC980(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D32E78);
}

uint64_t sub_21E4BC9A4()
{
  return sub_21E4CED4C(&qword_267D31538, (uint64_t)qword_267D32E78);
}

uint64_t sub_21E4BC9C8@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31538, (uint64_t)qword_267D32E78, a1);
}

uint64_t sub_21E4BC9EC(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D32E90);
}

uint64_t sub_21E4BCA0C()
{
  return sub_21E4CED4C(&qword_267D31540, (uint64_t)qword_267D32E90);
}

uint64_t sub_21E4BCA30@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31540, (uint64_t)qword_267D32E90, a1);
}

uint64_t sub_21E4BCA54(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D32EA8);
}

uint64_t sub_21E4BCA80()
{
  return sub_21E4CED4C(&qword_267D31548, (uint64_t)qword_267D32EA8);
}

uint64_t sub_21E4BCAA4@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31548, (uint64_t)qword_267D32EA8, a1);
}

uint64_t sub_21E4BCAC8(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D32EC0);
}

uint64_t sub_21E4BCAEC()
{
  return sub_21E4CED4C(&qword_267D31550, (uint64_t)qword_267D32EC0);
}

uint64_t sub_21E4BCB10@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31550, (uint64_t)qword_267D32EC0, a1);
}

uint64_t sub_21E4BCB34(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D32ED8);
}

uint64_t sub_21E4BCB60()
{
  return sub_21E4CED4C(&qword_267D31558, (uint64_t)qword_267D32ED8);
}

uint64_t sub_21E4BCB84@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31558, (uint64_t)qword_267D32ED8, a1);
}

uint64_t sub_21E4BCBA8(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D32EF0);
}

uint64_t sub_21E4BCBD4()
{
  return sub_21E4CED4C(&qword_267D31560, (uint64_t)qword_267D32EF0);
}

uint64_t sub_21E4BCBF8@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31560, (uint64_t)qword_267D32EF0, a1);
}

uint64_t sub_21E4BCC1C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D32F08);
}

uint64_t sub_21E4BCC48()
{
  return sub_21E4CED4C(&qword_267D31568, (uint64_t)qword_267D32F08);
}

uint64_t sub_21E4BCC6C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31568, (uint64_t)qword_267D32F08, a1);
}

uint64_t sub_21E4BCC90(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D32F20);
}

uint64_t sub_21E4BCCB4()
{
  return sub_21E4CED4C(&qword_267D31570, (uint64_t)qword_267D32F20);
}

uint64_t sub_21E4BCCD8@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31570, (uint64_t)qword_267D32F20, a1);
}

uint64_t sub_21E4BCCFC(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D32F38);
}

uint64_t sub_21E4BCD20()
{
  return sub_21E4CED4C(&qword_267D31578, (uint64_t)qword_267D32F38);
}

uint64_t sub_21E4BCD44@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31578, (uint64_t)qword_267D32F38, a1);
}

uint64_t sub_21E4BCD68(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D32F50);
}

uint64_t sub_21E4BCD8C()
{
  return sub_21E4CED4C(&qword_267D31580, (uint64_t)qword_267D32F50);
}

uint64_t sub_21E4BCDB0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31580, (uint64_t)qword_267D32F50, a1);
}

uint64_t sub_21E4BCDD4(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D32F68);
}

uint64_t sub_21E4BCE00()
{
  return sub_21E4CED4C(&qword_267D31588, (uint64_t)qword_267D32F68);
}

uint64_t sub_21E4BCE24@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31588, (uint64_t)qword_267D32F68, a1);
}

uint64_t sub_21E4BCE48(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D32F80);
}

uint64_t sub_21E4BCE74()
{
  return sub_21E4CED4C(&qword_267D31590, (uint64_t)qword_267D32F80);
}

uint64_t sub_21E4BCE98@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31590, (uint64_t)qword_267D32F80, a1);
}

uint64_t sub_21E4BCEBC(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D32F98);
}

uint64_t sub_21E4BCEE8()
{
  return sub_21E4CED4C(&qword_267D31598, (uint64_t)qword_267D32F98);
}

uint64_t sub_21E4BCF0C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31598, (uint64_t)qword_267D32F98, a1);
}

uint64_t sub_21E4BCF30(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D32FB0);
}

uint64_t sub_21E4BCF50()
{
  return sub_21E4CED4C(&qword_267D315A0, (uint64_t)qword_267D32FB0);
}

uint64_t sub_21E4BCF74@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D315A0, (uint64_t)qword_267D32FB0, a1);
}

uint64_t sub_21E4BCF98(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D32FC8);
}

uint64_t sub_21E4BCFC4()
{
  return sub_21E4CED4C(&qword_267D315A8, (uint64_t)qword_267D32FC8);
}

uint64_t sub_21E4BCFE8@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D315A8, (uint64_t)qword_267D32FC8, a1);
}

uint64_t sub_21E4BD00C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D32FE0);
}

uint64_t sub_21E4BD030()
{
  return sub_21E4CED4C(&qword_267D315B0, (uint64_t)qword_267D32FE0);
}

uint64_t sub_21E4BD054@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D315B0, (uint64_t)qword_267D32FE0, a1);
}

uint64_t sub_21E4BD078(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D32FF8);
}

uint64_t sub_21E4BD0A0()
{
  return sub_21E4CED4C(&qword_267D315B8, (uint64_t)qword_267D32FF8);
}

uint64_t sub_21E4BD0C4@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D315B8, (uint64_t)qword_267D32FF8, a1);
}

uint64_t sub_21E4BD0E8(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33010);
}

uint64_t sub_21E4BD110()
{
  return sub_21E4CED4C(&qword_267D315C0, (uint64_t)qword_267D33010);
}

uint64_t sub_21E4BD134@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D315C0, (uint64_t)qword_267D33010, a1);
}

uint64_t sub_21E4BD158(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33028);
}

uint64_t sub_21E4BD180()
{
  return sub_21E4CED4C(&qword_267D315C8, (uint64_t)qword_267D33028);
}

uint64_t sub_21E4BD1A4@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D315C8, (uint64_t)qword_267D33028, a1);
}

uint64_t sub_21E4BD1C8(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33040);
}

uint64_t sub_21E4BD1E4()
{
  return sub_21E4CED4C(&qword_267D315D0, (uint64_t)qword_267D33040);
}

uint64_t sub_21E4BD208@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D315D0, (uint64_t)qword_267D33040, a1);
}

uint64_t sub_21E4BD22C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33058);
}

uint64_t sub_21E4BD254()
{
  return sub_21E4CED4C(&qword_267D315D8, (uint64_t)qword_267D33058);
}

uint64_t sub_21E4BD278@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D315D8, (uint64_t)qword_267D33058, a1);
}

uint64_t sub_21E4BD29C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33070);
}

uint64_t sub_21E4BD2C0()
{
  return sub_21E4CED4C(&qword_267D315E0, (uint64_t)qword_267D33070);
}

uint64_t sub_21E4BD2E4@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D315E0, (uint64_t)qword_267D33070, a1);
}

uint64_t sub_21E4BD308(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33088);
}

uint64_t sub_21E4BD330()
{
  return sub_21E4CED4C(&qword_267D315E8, (uint64_t)qword_267D33088);
}

uint64_t sub_21E4BD354@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D315E8, (uint64_t)qword_267D33088, a1);
}

uint64_t sub_21E4BD378(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D330A0);
}

uint64_t sub_21E4BD3A0()
{
  return sub_21E4CED4C(&qword_267D315F0, (uint64_t)qword_267D330A0);
}

uint64_t sub_21E4BD3C4@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D315F0, (uint64_t)qword_267D330A0, a1);
}

uint64_t sub_21E4BD3E8(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D330B8);
}

uint64_t sub_21E4BD410()
{
  return sub_21E4CED4C(&qword_267D315F8, (uint64_t)qword_267D330B8);
}

uint64_t sub_21E4BD434@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D315F8, (uint64_t)qword_267D330B8, a1);
}

uint64_t sub_21E4BD458(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D330D0);
}

uint64_t sub_21E4BD478()
{
  return sub_21E4CED4C(&qword_267D31600, (uint64_t)qword_267D330D0);
}

uint64_t sub_21E4BD49C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31600, (uint64_t)qword_267D330D0, a1);
}

uint64_t sub_21E4BD4C0(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D330E8);
}

uint64_t sub_21E4BD4EC()
{
  return sub_21E4CED4C(&qword_267D31608, (uint64_t)qword_267D330E8);
}

uint64_t sub_21E4BD510@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31608, (uint64_t)qword_267D330E8, a1);
}

uint64_t sub_21E4BD534(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33100);
}

uint64_t sub_21E4BD558()
{
  return sub_21E4CED4C(&qword_267D31610, (uint64_t)qword_267D33100);
}

uint64_t sub_21E4BD57C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31610, (uint64_t)qword_267D33100, a1);
}

uint64_t sub_21E4BD5A0(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33118);
}

uint64_t sub_21E4BD5CC()
{
  return sub_21E4CED4C(&qword_267D31618, (uint64_t)qword_267D33118);
}

uint64_t sub_21E4BD5F0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31618, (uint64_t)qword_267D33118, a1);
}

uint64_t sub_21E4BD614(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33130);
}

uint64_t sub_21E4BD640()
{
  return sub_21E4CED4C(&qword_267D31620, (uint64_t)qword_267D33130);
}

uint64_t sub_21E4BD664@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31620, (uint64_t)qword_267D33130, a1);
}

uint64_t sub_21E4BD688(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33148);
}

uint64_t sub_21E4BD6B4()
{
  return sub_21E4CED4C(&qword_267D31628, (uint64_t)qword_267D33148);
}

uint64_t sub_21E4BD6D8@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31628, (uint64_t)qword_267D33148, a1);
}

uint64_t sub_21E4BD6FC(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33160);
}

uint64_t sub_21E4BD71C()
{
  return sub_21E4CED4C(&qword_267D31630, (uint64_t)qword_267D33160);
}

uint64_t sub_21E4BD740@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31630, (uint64_t)qword_267D33160, a1);
}

uint64_t sub_21E4BD764(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33178);
}

uint64_t sub_21E4BD790()
{
  return sub_21E4CED4C(&qword_267D31638, (uint64_t)qword_267D33178);
}

uint64_t sub_21E4BD7B4@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31638, (uint64_t)qword_267D33178, a1);
}

uint64_t sub_21E4BD7D8(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33190);
}

uint64_t sub_21E4BD804()
{
  return sub_21E4CED4C(&qword_267D31640, (uint64_t)qword_267D33190);
}

uint64_t sub_21E4BD828@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31640, (uint64_t)qword_267D33190, a1);
}

uint64_t sub_21E4BD84C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D331A8);
}

uint64_t sub_21E4BD870()
{
  return sub_21E4CED4C(&qword_267D31648, (uint64_t)qword_267D331A8);
}

uint64_t sub_21E4BD894@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31648, (uint64_t)qword_267D331A8, a1);
}

uint64_t sub_21E4BD8B8(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D331C0);
}

uint64_t sub_21E4BD8E0()
{
  return sub_21E4CED4C(&qword_267D31650, (uint64_t)qword_267D331C0);
}

uint64_t sub_21E4BD904@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31650, (uint64_t)qword_267D331C0, a1);
}

uint64_t sub_21E4BD928(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D331D8);
}

uint64_t sub_21E4BD950()
{
  return sub_21E4CED4C(&qword_267D31658, (uint64_t)qword_267D331D8);
}

uint64_t sub_21E4BD974@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31658, (uint64_t)qword_267D331D8, a1);
}

uint64_t sub_21E4BD998(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D331F0);
}

uint64_t sub_21E4BD9C0()
{
  return sub_21E4CED4C(&qword_267D31660, (uint64_t)qword_267D331F0);
}

uint64_t sub_21E4BD9E4@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31660, (uint64_t)qword_267D331F0, a1);
}

uint64_t sub_21E4BDA08(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33208);
}

uint64_t sub_21E4BDA34()
{
  return sub_21E4CED4C(&qword_267D31668, (uint64_t)qword_267D33208);
}

uint64_t sub_21E4BDA58@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31668, (uint64_t)qword_267D33208, a1);
}

uint64_t sub_21E4BDA7C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33220);
}

uint64_t sub_21E4BDAA4()
{
  return sub_21E4CED4C(&qword_267D31670, (uint64_t)qword_267D33220);
}

uint64_t sub_21E4BDAC8@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31670, (uint64_t)qword_267D33220, a1);
}

uint64_t sub_21E4BDAEC(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33238);
}

uint64_t sub_21E4BDB14()
{
  return sub_21E4CED4C(&qword_267D31678, (uint64_t)qword_267D33238);
}

uint64_t sub_21E4BDB38@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31678, (uint64_t)qword_267D33238, a1);
}

uint64_t sub_21E4BDB5C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33250);
}

uint64_t sub_21E4BDB88()
{
  return sub_21E4CED4C(&qword_267D31680, (uint64_t)qword_267D33250);
}

uint64_t sub_21E4BDBAC@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31680, (uint64_t)qword_267D33250, a1);
}

uint64_t sub_21E4BDBD0(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33268);
}

uint64_t sub_21E4BDBF8()
{
  return sub_21E4CED4C(&qword_267D31688, (uint64_t)qword_267D33268);
}

uint64_t sub_21E4BDC1C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31688, (uint64_t)qword_267D33268, a1);
}

uint64_t sub_21E4BDC40(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33280);
}

uint64_t sub_21E4BDC6C()
{
  return sub_21E4CED4C(&qword_267D31690, (uint64_t)qword_267D33280);
}

uint64_t sub_21E4BDC90@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31690, (uint64_t)qword_267D33280, a1);
}

uint64_t sub_21E4BDCB4(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33298);
}

uint64_t sub_21E4BDCE0()
{
  return sub_21E4CED4C(&qword_267D31698, (uint64_t)qword_267D33298);
}

uint64_t sub_21E4BDD04@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31698, (uint64_t)qword_267D33298, a1);
}

uint64_t sub_21E4BDD28(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D332B0);
}

uint64_t sub_21E4BDD4C()
{
  return sub_21E4CED4C(&qword_267D316A0, (uint64_t)qword_267D332B0);
}

uint64_t sub_21E4BDD70@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D316A0, (uint64_t)qword_267D332B0, a1);
}

uint64_t sub_21E4BDD94(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D332C8);
}

uint64_t sub_21E4BDDB8()
{
  return sub_21E4CED4C(&qword_267D316A8, (uint64_t)qword_267D332C8);
}

uint64_t sub_21E4BDDDC@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D316A8, (uint64_t)qword_267D332C8, a1);
}

uint64_t sub_21E4BDE00(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D332E0);
}

uint64_t sub_21E4BDE24()
{
  return sub_21E4CED4C(&qword_267D316B0, (uint64_t)qword_267D332E0);
}

uint64_t sub_21E4BDE48@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D316B0, (uint64_t)qword_267D332E0, a1);
}

uint64_t sub_21E4BDE6C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D332F8);
}

uint64_t sub_21E4BDE90()
{
  return sub_21E4CED4C(&qword_267D316B8, (uint64_t)qword_267D332F8);
}

uint64_t sub_21E4BDEB4@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D316B8, (uint64_t)qword_267D332F8, a1);
}

uint64_t sub_21E4BDED8(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33310);
}

uint64_t sub_21E4BDEFC()
{
  return sub_21E4CED4C(&qword_267D316C0, (uint64_t)qword_267D33310);
}

uint64_t sub_21E4BDF20@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D316C0, (uint64_t)qword_267D33310, a1);
}

uint64_t sub_21E4BDF44(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33328);
}

uint64_t sub_21E4BDF68()
{
  return sub_21E4CED4C(&qword_267D316C8, (uint64_t)qword_267D33328);
}

uint64_t sub_21E4BDF8C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D316C8, (uint64_t)qword_267D33328, a1);
}

uint64_t sub_21E4BDFB0(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33340);
}

uint64_t sub_21E4BDFD4()
{
  return sub_21E4CED4C(&qword_267D316D0, (uint64_t)qword_267D33340);
}

uint64_t sub_21E4BDFF8@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D316D0, (uint64_t)qword_267D33340, a1);
}

uint64_t sub_21E4BE01C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33358);
}

uint64_t sub_21E4BE040()
{
  return sub_21E4CED4C(&qword_267D316D8, (uint64_t)qword_267D33358);
}

uint64_t sub_21E4BE064@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D316D8, (uint64_t)qword_267D33358, a1);
}

uint64_t sub_21E4BE088(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33370);
}

uint64_t sub_21E4BE0AC()
{
  return sub_21E4CED4C(&qword_267D316E0, (uint64_t)qword_267D33370);
}

uint64_t sub_21E4BE0D0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D316E0, (uint64_t)qword_267D33370, a1);
}

uint64_t sub_21E4BE0F4(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33388);
}

uint64_t sub_21E4BE118()
{
  return sub_21E4CED4C(&qword_267D316E8, (uint64_t)qword_267D33388);
}

uint64_t sub_21E4BE13C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D316E8, (uint64_t)qword_267D33388, a1);
}

uint64_t sub_21E4BE160(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D333A0);
}

uint64_t sub_21E4BE184()
{
  return sub_21E4CED4C(&qword_267D316F0, (uint64_t)qword_267D333A0);
}

uint64_t sub_21E4BE1A8@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D316F0, (uint64_t)qword_267D333A0, a1);
}

uint64_t sub_21E4BE1CC(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D333B8);
}

uint64_t sub_21E4BE1F0()
{
  return sub_21E4CED4C(&qword_267D316F8, (uint64_t)qword_267D333B8);
}

uint64_t sub_21E4BE214@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D316F8, (uint64_t)qword_267D333B8, a1);
}

uint64_t sub_21E4BE238(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D333D0);
}

uint64_t sub_21E4BE258()
{
  return sub_21E4CED4C(&qword_267D31700, (uint64_t)qword_267D333D0);
}

uint64_t sub_21E4BE27C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31700, (uint64_t)qword_267D333D0, a1);
}

uint64_t sub_21E4BE2A0(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D333E8);
}

uint64_t sub_21E4BE2CC()
{
  return sub_21E4CED4C(&qword_267D31708, (uint64_t)qword_267D333E8);
}

uint64_t sub_21E4BE2F0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31708, (uint64_t)qword_267D333E8, a1);
}

uint64_t sub_21E4BE314(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33400);
}

uint64_t sub_21E4BE338()
{
  return sub_21E4CED4C(&qword_267D31710, (uint64_t)qword_267D33400);
}

uint64_t sub_21E4BE35C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31710, (uint64_t)qword_267D33400, a1);
}

uint64_t sub_21E4BE380(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33418);
}

uint64_t sub_21E4BE3A8()
{
  return sub_21E4CED4C(&qword_267D31718, (uint64_t)qword_267D33418);
}

uint64_t sub_21E4BE3CC@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31718, (uint64_t)qword_267D33418, a1);
}

uint64_t sub_21E4BE3F0(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33430);
}

uint64_t sub_21E4BE418()
{
  return sub_21E4CED4C(&qword_267D31720, (uint64_t)qword_267D33430);
}

uint64_t sub_21E4BE43C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31720, (uint64_t)qword_267D33430, a1);
}

uint64_t sub_21E4BE460(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33448);
}

uint64_t sub_21E4BE488()
{
  return sub_21E4CED4C(&qword_267D31728, (uint64_t)qword_267D33448);
}

uint64_t sub_21E4BE4AC@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31728, (uint64_t)qword_267D33448, a1);
}

uint64_t sub_21E4BE4D0(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33460);
}

uint64_t sub_21E4BE4F4()
{
  return sub_21E4CED4C(&qword_267D31730, (uint64_t)qword_267D33460);
}

uint64_t sub_21E4BE518@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31730, (uint64_t)qword_267D33460, a1);
}

uint64_t sub_21E4BE53C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33478);
}

uint64_t sub_21E4BE560()
{
  return sub_21E4CED4C(&qword_267D31738, (uint64_t)qword_267D33478);
}

uint64_t sub_21E4BE584@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31738, (uint64_t)qword_267D33478, a1);
}

uint64_t sub_21E4BE5A8(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33490);
}

uint64_t sub_21E4BE5CC()
{
  return sub_21E4CED4C(&qword_267D31740, (uint64_t)qword_267D33490);
}

uint64_t sub_21E4BE5F0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31740, (uint64_t)qword_267D33490, a1);
}

uint64_t sub_21E4BE614(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D334A8);
}

uint64_t sub_21E4BE638()
{
  return sub_21E4CED4C(&qword_267D31748, (uint64_t)qword_267D334A8);
}

uint64_t sub_21E4BE65C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31748, (uint64_t)qword_267D334A8, a1);
}

uint64_t sub_21E4BE680(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D334C0);
}

uint64_t sub_21E4BE6A4()
{
  return sub_21E4CED4C(&qword_267D31750, (uint64_t)qword_267D334C0);
}

uint64_t sub_21E4BE6C8@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31750, (uint64_t)qword_267D334C0, a1);
}

uint64_t sub_21E4BE6EC(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D334D8);
}

uint64_t sub_21E4BE710()
{
  return sub_21E4CED4C(&qword_267D31758, (uint64_t)qword_267D334D8);
}

uint64_t sub_21E4BE734@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31758, (uint64_t)qword_267D334D8, a1);
}

uint64_t sub_21E4BE758(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D334F0);
}

uint64_t sub_21E4BE77C()
{
  return sub_21E4CED4C(&qword_267D31760, (uint64_t)qword_267D334F0);
}

uint64_t sub_21E4BE7A0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31760, (uint64_t)qword_267D334F0, a1);
}

uint64_t sub_21E4BE7C4(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33508);
}

uint64_t sub_21E4BE7E8()
{
  return sub_21E4CED4C(&qword_267D31768, (uint64_t)qword_267D33508);
}

uint64_t sub_21E4BE80C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31768, (uint64_t)qword_267D33508, a1);
}

uint64_t sub_21E4BE830(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33520);
}

uint64_t sub_21E4BE854()
{
  return sub_21E4CED4C(&qword_267D31770, (uint64_t)qword_267D33520);
}

uint64_t sub_21E4BE878@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31770, (uint64_t)qword_267D33520, a1);
}

uint64_t sub_21E4BE89C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33538);
}

uint64_t sub_21E4BE8C0()
{
  return sub_21E4CED4C(&qword_267D31778, (uint64_t)qword_267D33538);
}

uint64_t sub_21E4BE8E4@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31778, (uint64_t)qword_267D33538, a1);
}

uint64_t sub_21E4BE908(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33550);
}

uint64_t sub_21E4BE92C()
{
  return sub_21E4CED4C(&qword_267D31780, (uint64_t)qword_267D33550);
}

uint64_t sub_21E4BE950@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31780, (uint64_t)qword_267D33550, a1);
}

uint64_t sub_21E4BE974(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33568);
}

uint64_t sub_21E4BE998()
{
  return sub_21E4CED4C(&qword_267D31788, (uint64_t)qword_267D33568);
}

uint64_t sub_21E4BE9BC@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31788, (uint64_t)qword_267D33568, a1);
}

uint64_t sub_21E4BE9E0(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33580);
}

uint64_t sub_21E4BEA04()
{
  return sub_21E4CED4C(&qword_267D31790, (uint64_t)qword_267D33580);
}

uint64_t sub_21E4BEA28@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31790, (uint64_t)qword_267D33580, a1);
}

uint64_t sub_21E4BEA4C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33598);
}

uint64_t sub_21E4BEA78()
{
  return sub_21E4CED4C(&qword_267D31798, (uint64_t)qword_267D33598);
}

uint64_t sub_21E4BEA9C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31798, (uint64_t)qword_267D33598, a1);
}

uint64_t sub_21E4BEAC0(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D335B0);
}

uint64_t sub_21E4BEAE4()
{
  return sub_21E4CED4C(&qword_267D317A0, (uint64_t)qword_267D335B0);
}

uint64_t sub_21E4BEB08@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D317A0, (uint64_t)qword_267D335B0, a1);
}

uint64_t sub_21E4BEB2C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D335C8);
}

uint64_t sub_21E4BEB50()
{
  return sub_21E4CED4C(&qword_267D317A8, (uint64_t)qword_267D335C8);
}

uint64_t sub_21E4BEB74@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D317A8, (uint64_t)qword_267D335C8, a1);
}

uint64_t sub_21E4BEB98(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D335E0);
}

uint64_t sub_21E4BEBBC()
{
  return sub_21E4CED4C(&qword_267D317B0, (uint64_t)qword_267D335E0);
}

uint64_t sub_21E4BEBE0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D317B0, (uint64_t)qword_267D335E0, a1);
}

uint64_t sub_21E4BEC04(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D335F8);
}

uint64_t sub_21E4BEC28()
{
  return sub_21E4CED4C(&qword_267D317B8, (uint64_t)qword_267D335F8);
}

uint64_t sub_21E4BEC4C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D317B8, (uint64_t)qword_267D335F8, a1);
}

uint64_t sub_21E4BEC70(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33610);
}

uint64_t sub_21E4BEC94()
{
  return sub_21E4CED4C(&qword_267D317C0, (uint64_t)qword_267D33610);
}

uint64_t sub_21E4BECB8@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D317C0, (uint64_t)qword_267D33610, a1);
}

uint64_t sub_21E4BECDC(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33628);
}

uint64_t sub_21E4BECFC()
{
  return sub_21E4CED4C(&qword_267D317C8, (uint64_t)qword_267D33628);
}

uint64_t sub_21E4BED20@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D317C8, (uint64_t)qword_267D33628, a1);
}

uint64_t sub_21E4BED44(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33640);
}

uint64_t sub_21E4BED70()
{
  return sub_21E4CED4C(&qword_267D317D0, (uint64_t)qword_267D33640);
}

uint64_t sub_21E4BED94@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D317D0, (uint64_t)qword_267D33640, a1);
}

uint64_t sub_21E4BEDB8(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33658);
}

uint64_t sub_21E4BEDDC()
{
  return sub_21E4CED4C(&qword_267D317D8, (uint64_t)qword_267D33658);
}

uint64_t sub_21E4BEE00@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D317D8, (uint64_t)qword_267D33658, a1);
}

uint64_t sub_21E4BEE24(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33670);
}

uint64_t sub_21E4BEE4C()
{
  return sub_21E4CED4C(&qword_267D317E0, (uint64_t)qword_267D33670);
}

uint64_t sub_21E4BEE70@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D317E0, (uint64_t)qword_267D33670, a1);
}

uint64_t sub_21E4BEE94(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33688);
}

uint64_t sub_21E4BEEBC()
{
  return sub_21E4CED4C(&qword_267D317E8, (uint64_t)qword_267D33688);
}

uint64_t sub_21E4BEEE0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D317E8, (uint64_t)qword_267D33688, a1);
}

uint64_t sub_21E4BEF04(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D336A0);
}

uint64_t sub_21E4BEF2C()
{
  return sub_21E4CED4C(&qword_267D317F0, (uint64_t)qword_267D336A0);
}

uint64_t sub_21E4BEF50@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D317F0, (uint64_t)qword_267D336A0, a1);
}

uint64_t sub_21E4BEF74(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D336B8);
}

uint64_t sub_21E4BEF90()
{
  return sub_21E4CED4C(&qword_267D317F8, (uint64_t)qword_267D336B8);
}

uint64_t sub_21E4BEFB4@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D317F8, (uint64_t)qword_267D336B8, a1);
}

uint64_t sub_21E4BEFD8(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D336D0);
}

uint64_t sub_21E4BEFFC()
{
  return sub_21E4CED4C(&qword_267D31800, (uint64_t)qword_267D336D0);
}

uint64_t sub_21E4BF020@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31800, (uint64_t)qword_267D336D0, a1);
}

uint64_t sub_21E4BF044(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D336E8);
}

uint64_t sub_21E4BF06C()
{
  return sub_21E4CED4C(&qword_267D31808, (uint64_t)qword_267D336E8);
}

uint64_t sub_21E4BF090@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31808, (uint64_t)qword_267D336E8, a1);
}

uint64_t sub_21E4BF0B4(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33700);
}

uint64_t sub_21E4BF0D8()
{
  return sub_21E4CED4C(&qword_267D31810, (uint64_t)qword_267D33700);
}

uint64_t sub_21E4BF0FC@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31810, (uint64_t)qword_267D33700, a1);
}

uint64_t sub_21E4BF120(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33718);
}

uint64_t sub_21E4BF144()
{
  return sub_21E4CED4C(&qword_267D31818, (uint64_t)qword_267D33718);
}

uint64_t sub_21E4BF168@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31818, (uint64_t)qword_267D33718, a1);
}

uint64_t sub_21E4BF18C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33730);
}

uint64_t sub_21E4BF1B0()
{
  return sub_21E4CED4C(&qword_267D31820, (uint64_t)qword_267D33730);
}

uint64_t sub_21E4BF1D4@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31820, (uint64_t)qword_267D33730, a1);
}

uint64_t sub_21E4BF1F8(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33748);
}

uint64_t sub_21E4BF21C()
{
  return sub_21E4CED4C(&qword_267D31828, (uint64_t)qword_267D33748);
}

uint64_t sub_21E4BF240@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31828, (uint64_t)qword_267D33748, a1);
}

uint64_t sub_21E4BF264(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33760);
}

uint64_t sub_21E4BF288()
{
  return sub_21E4CED4C(&qword_267D31830, (uint64_t)qword_267D33760);
}

uint64_t sub_21E4BF2AC@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31830, (uint64_t)qword_267D33760, a1);
}

uint64_t sub_21E4BF2D0(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33778);
}

uint64_t sub_21E4BF2F4()
{
  return sub_21E4CED4C(&qword_267D31838, (uint64_t)qword_267D33778);
}

uint64_t sub_21E4BF318@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31838, (uint64_t)qword_267D33778, a1);
}

uint64_t sub_21E4BF33C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33790);
}

uint64_t sub_21E4BF360()
{
  return sub_21E4CED4C(&qword_267D31840, (uint64_t)qword_267D33790);
}

uint64_t sub_21E4BF384@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31840, (uint64_t)qword_267D33790, a1);
}

uint64_t sub_21E4BF3A8(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D337A8);
}

uint64_t sub_21E4BF3CC()
{
  return sub_21E4CED4C(&qword_267D31848, (uint64_t)qword_267D337A8);
}

uint64_t sub_21E4BF3F0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31848, (uint64_t)qword_267D337A8, a1);
}

uint64_t sub_21E4BF414(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D337C0);
}

uint64_t sub_21E4BF438()
{
  return sub_21E4CED4C(&qword_267D31850, (uint64_t)qword_267D337C0);
}

uint64_t sub_21E4BF45C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31850, (uint64_t)qword_267D337C0, a1);
}

uint64_t sub_21E4BF480(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D337D8);
}

uint64_t sub_21E4BF4A4()
{
  return sub_21E4CED4C(&qword_267D31858, (uint64_t)qword_267D337D8);
}

uint64_t sub_21E4BF4C8@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31858, (uint64_t)qword_267D337D8, a1);
}

uint64_t sub_21E4BF4EC(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D337F0);
}

uint64_t sub_21E4BF510()
{
  return sub_21E4CED4C(&qword_267D31860, (uint64_t)qword_267D337F0);
}

uint64_t sub_21E4BF534@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31860, (uint64_t)qword_267D337F0, a1);
}

uint64_t sub_21E4BF558(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33808);
}

uint64_t sub_21E4BF57C()
{
  return sub_21E4CED4C(&qword_267D31868, (uint64_t)qword_267D33808);
}

uint64_t sub_21E4BF5A0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31868, (uint64_t)qword_267D33808, a1);
}

uint64_t sub_21E4BF5C4(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33820);
}

uint64_t sub_21E4BF5E8()
{
  return sub_21E4CED4C(&qword_267D31870, (uint64_t)qword_267D33820);
}

uint64_t sub_21E4BF60C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31870, (uint64_t)qword_267D33820, a1);
}

uint64_t sub_21E4BF630(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33838);
}

uint64_t sub_21E4BF654()
{
  return sub_21E4CED4C(&qword_267D31878, (uint64_t)qword_267D33838);
}

uint64_t sub_21E4BF678@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31878, (uint64_t)qword_267D33838, a1);
}

uint64_t sub_21E4BF69C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33850);
}

uint64_t sub_21E4BF6C0()
{
  return sub_21E4CED4C(&qword_267D31880, (uint64_t)qword_267D33850);
}

uint64_t sub_21E4BF6E4@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31880, (uint64_t)qword_267D33850, a1);
}

uint64_t sub_21E4BF708(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33868);
}

uint64_t sub_21E4BF72C()
{
  return sub_21E4CED4C(&qword_267D31888, (uint64_t)qword_267D33868);
}

uint64_t sub_21E4BF750@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31888, (uint64_t)qword_267D33868, a1);
}

uint64_t sub_21E4BF774(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33880);
}

uint64_t sub_21E4BF79C()
{
  return sub_21E4CED4C(&qword_267D31890, (uint64_t)qword_267D33880);
}

uint64_t sub_21E4BF7C0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31890, (uint64_t)qword_267D33880, a1);
}

uint64_t sub_21E4BF7E4(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33898);
}

uint64_t sub_21E4BF808()
{
  return sub_21E4CED4C(&qword_267D31898, (uint64_t)qword_267D33898);
}

uint64_t sub_21E4BF82C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31898, (uint64_t)qword_267D33898, a1);
}

uint64_t sub_21E4BF850(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D338B0);
}

uint64_t sub_21E4BF874()
{
  return sub_21E4CED4C(&qword_267D318A0, (uint64_t)qword_267D338B0);
}

uint64_t sub_21E4BF898@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D318A0, (uint64_t)qword_267D338B0, a1);
}

uint64_t sub_21E4BF8BC(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D338C8);
}

uint64_t sub_21E4BF8E0()
{
  return sub_21E4CED4C(&qword_267D318A8, (uint64_t)qword_267D338C8);
}

uint64_t sub_21E4BF904@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D318A8, (uint64_t)qword_267D338C8, a1);
}

uint64_t sub_21E4BF928(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D338E0);
}

uint64_t sub_21E4BF94C()
{
  return sub_21E4CED4C(&qword_267D318B0, (uint64_t)qword_267D338E0);
}

uint64_t sub_21E4BF970@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D318B0, (uint64_t)qword_267D338E0, a1);
}

uint64_t sub_21E4BF994(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D338F8);
}

uint64_t sub_21E4BF9B8()
{
  return sub_21E4CED4C(&qword_267D318B8, (uint64_t)qword_267D338F8);
}

uint64_t sub_21E4BF9DC@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D318B8, (uint64_t)qword_267D338F8, a1);
}

uint64_t sub_21E4BFA00(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33910);
}

uint64_t sub_21E4BFA2C()
{
  return sub_21E4CED4C(&qword_267D318C0, (uint64_t)qword_267D33910);
}

uint64_t sub_21E4BFA50@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D318C0, (uint64_t)qword_267D33910, a1);
}

uint64_t sub_21E4BFA74(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33928);
}

uint64_t sub_21E4BFA98()
{
  return sub_21E4CED4C(&qword_267D318C8, (uint64_t)qword_267D33928);
}

uint64_t sub_21E4BFABC@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D318C8, (uint64_t)qword_267D33928, a1);
}

uint64_t sub_21E4BFAE0(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33940);
}

uint64_t sub_21E4BFB04()
{
  return sub_21E4CED4C(&qword_267D318D0, (uint64_t)qword_267D33940);
}

uint64_t sub_21E4BFB28@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D318D0, (uint64_t)qword_267D33940, a1);
}

uint64_t sub_21E4BFB4C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33958);
}

uint64_t sub_21E4BFB70()
{
  return sub_21E4CED4C(&qword_267D318D8, (uint64_t)qword_267D33958);
}

uint64_t sub_21E4BFB94@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D318D8, (uint64_t)qword_267D33958, a1);
}

uint64_t sub_21E4BFBB8(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33970);
}

uint64_t sub_21E4BFBDC()
{
  return sub_21E4CED4C(&qword_267D318E0, (uint64_t)qword_267D33970);
}

uint64_t sub_21E4BFC00@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D318E0, (uint64_t)qword_267D33970, a1);
}

uint64_t sub_21E4BFC24(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33988);
}

uint64_t sub_21E4BFC48()
{
  return sub_21E4CED4C(&qword_267D318E8, (uint64_t)qword_267D33988);
}

uint64_t sub_21E4BFC6C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D318E8, (uint64_t)qword_267D33988, a1);
}

uint64_t sub_21E4BFC90(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D339A0);
}

uint64_t sub_21E4BFCB4()
{
  return sub_21E4CED4C(&qword_267D318F0, (uint64_t)qword_267D339A0);
}

uint64_t sub_21E4BFCD8@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D318F0, (uint64_t)qword_267D339A0, a1);
}

uint64_t sub_21E4BFCFC(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D339B8);
}

uint64_t sub_21E4BFD28()
{
  return sub_21E4CED4C(&qword_267D318F8, (uint64_t)qword_267D339B8);
}

uint64_t sub_21E4BFD4C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D318F8, (uint64_t)qword_267D339B8, a1);
}

uint64_t sub_21E4BFD70(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D339D0);
}

uint64_t sub_21E4BFD94()
{
  return sub_21E4CED4C(&qword_267D31900, (uint64_t)qword_267D339D0);
}

uint64_t sub_21E4BFDB8@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31900, (uint64_t)qword_267D339D0, a1);
}

uint64_t sub_21E4BFDDC(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D339E8);
}

uint64_t sub_21E4BFE00()
{
  return sub_21E4CED4C(&qword_267D31908, (uint64_t)qword_267D339E8);
}

uint64_t sub_21E4BFE24@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31908, (uint64_t)qword_267D339E8, a1);
}

uint64_t sub_21E4BFE48(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33A00);
}

uint64_t sub_21E4BFE74()
{
  return sub_21E4CED4C(&qword_267D31910, (uint64_t)qword_267D33A00);
}

uint64_t sub_21E4BFE98@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31910, (uint64_t)qword_267D33A00, a1);
}

uint64_t sub_21E4BFEBC(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33A18);
}

uint64_t sub_21E4BFEE8()
{
  return sub_21E4CED4C(&qword_267D31918, (uint64_t)qword_267D33A18);
}

uint64_t sub_21E4BFF0C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31918, (uint64_t)qword_267D33A18, a1);
}

uint64_t sub_21E4BFF30(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33A30);
}

uint64_t sub_21E4BFF5C()
{
  return sub_21E4CED4C(&qword_267D31920, (uint64_t)qword_267D33A30);
}

uint64_t sub_21E4BFF80@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31920, (uint64_t)qword_267D33A30, a1);
}

uint64_t sub_21E4BFFA4(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33A48);
}

uint64_t sub_21E4BFFD0()
{
  return sub_21E4CED4C(&qword_267D31928, (uint64_t)qword_267D33A48);
}

uint64_t sub_21E4BFFF4@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31928, (uint64_t)qword_267D33A48, a1);
}

uint64_t sub_21E4C0018(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33A60);
}

uint64_t sub_21E4C0044()
{
  return sub_21E4CED4C(&qword_267D31930, (uint64_t)qword_267D33A60);
}

uint64_t sub_21E4C0068@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31930, (uint64_t)qword_267D33A60, a1);
}

uint64_t sub_21E4C008C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33A78);
}

uint64_t sub_21E4C00B8()
{
  return sub_21E4CED4C(&qword_267D31938, (uint64_t)qword_267D33A78);
}

uint64_t sub_21E4C00DC@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31938, (uint64_t)qword_267D33A78, a1);
}

uint64_t sub_21E4C0100(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33A90);
}

uint64_t sub_21E4C012C()
{
  return sub_21E4CED4C(&qword_267D31940, (uint64_t)qword_267D33A90);
}

uint64_t sub_21E4C0150@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31940, (uint64_t)qword_267D33A90, a1);
}

uint64_t sub_21E4C0174(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33AA8);
}

uint64_t sub_21E4C01A0()
{
  return sub_21E4CED4C(&qword_267D31948, (uint64_t)qword_267D33AA8);
}

uint64_t sub_21E4C01C4@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31948, (uint64_t)qword_267D33AA8, a1);
}

uint64_t sub_21E4C01E8(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33AC0);
}

uint64_t sub_21E4C0214()
{
  return sub_21E4CED4C(&qword_267D31950, (uint64_t)qword_267D33AC0);
}

uint64_t sub_21E4C0238@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31950, (uint64_t)qword_267D33AC0, a1);
}

uint64_t sub_21E4C025C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33AD8);
}

uint64_t sub_21E4C0280()
{
  return sub_21E4CED4C(&qword_267D31958, (uint64_t)qword_267D33AD8);
}

uint64_t sub_21E4C02A4@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31958, (uint64_t)qword_267D33AD8, a1);
}

uint64_t sub_21E4C02C8(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33AF0);
}

uint64_t sub_21E4C02EC()
{
  return sub_21E4CED4C(&qword_267D31960, (uint64_t)qword_267D33AF0);
}

uint64_t sub_21E4C0310@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31960, (uint64_t)qword_267D33AF0, a1);
}

uint64_t sub_21E4C0334(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33B08);
}

uint64_t sub_21E4C0358()
{
  return sub_21E4CED4C(&qword_267D31968, (uint64_t)qword_267D33B08);
}

uint64_t sub_21E4C037C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31968, (uint64_t)qword_267D33B08, a1);
}

uint64_t sub_21E4C03A0(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33B20);
}

uint64_t sub_21E4C03C4()
{
  return sub_21E4CED4C(&qword_267D31970, (uint64_t)qword_267D33B20);
}

uint64_t sub_21E4C03E8@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31970, (uint64_t)qword_267D33B20, a1);
}

uint64_t sub_21E4C040C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33B38);
}

uint64_t sub_21E4C0430()
{
  return sub_21E4CED4C(&qword_267D31978, (uint64_t)qword_267D33B38);
}

uint64_t sub_21E4C0454@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31978, (uint64_t)qword_267D33B38, a1);
}

uint64_t sub_21E4C0478(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33B50);
}

uint64_t sub_21E4C049C()
{
  return sub_21E4CED4C(&qword_267D31980, (uint64_t)qword_267D33B50);
}

uint64_t sub_21E4C04C0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31980, (uint64_t)qword_267D33B50, a1);
}

uint64_t sub_21E4C04E4(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33B68);
}

uint64_t sub_21E4C0504()
{
  return sub_21E4CED4C(&qword_267D31988, (uint64_t)qword_267D33B68);
}

uint64_t sub_21E4C0528@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31988, (uint64_t)qword_267D33B68, a1);
}

uint64_t sub_21E4C054C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33B80);
}

uint64_t sub_21E4C0578()
{
  return sub_21E4CED4C(&qword_267D31990, (uint64_t)qword_267D33B80);
}

uint64_t sub_21E4C059C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31990, (uint64_t)qword_267D33B80, a1);
}

uint64_t sub_21E4C05C0(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33B98);
}

uint64_t sub_21E4C05E4()
{
  return sub_21E4CED4C(&qword_267D31998, (uint64_t)qword_267D33B98);
}

uint64_t sub_21E4C0608@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31998, (uint64_t)qword_267D33B98, a1);
}

uint64_t sub_21E4C062C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33BB0);
}

uint64_t sub_21E4C0654()
{
  return sub_21E4CED4C(&qword_267D319A0, (uint64_t)qword_267D33BB0);
}

uint64_t sub_21E4C0678@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D319A0, (uint64_t)qword_267D33BB0, a1);
}

uint64_t sub_21E4C069C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33BC8);
}

uint64_t sub_21E4C06C4()
{
  return sub_21E4CED4C(&qword_267D319A8, (uint64_t)qword_267D33BC8);
}

uint64_t sub_21E4C06E8@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D319A8, (uint64_t)qword_267D33BC8, a1);
}

uint64_t sub_21E4C070C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33BE0);
}

uint64_t sub_21E4C0734()
{
  return sub_21E4CED4C(&qword_267D319B0, (uint64_t)qword_267D33BE0);
}

uint64_t sub_21E4C0758@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D319B0, (uint64_t)qword_267D33BE0, a1);
}

uint64_t sub_21E4C077C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33BF8);
}

uint64_t sub_21E4C079C()
{
  return sub_21E4CED4C(&qword_267D319B8, (uint64_t)qword_267D33BF8);
}

uint64_t sub_21E4C07C0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D319B8, (uint64_t)qword_267D33BF8, a1);
}

uint64_t sub_21E4C07E4(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33C10);
}

uint64_t sub_21E4C0810()
{
  return sub_21E4CED4C(&qword_267D319C0, (uint64_t)qword_267D33C10);
}

uint64_t sub_21E4C0834@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D319C0, (uint64_t)qword_267D33C10, a1);
}

uint64_t sub_21E4C0858(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33C28);
}

uint64_t sub_21E4C087C()
{
  return sub_21E4CED4C(&qword_267D319C8, (uint64_t)qword_267D33C28);
}

uint64_t sub_21E4C08A0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D319C8, (uint64_t)qword_267D33C28, a1);
}

uint64_t sub_21E4C08C4(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33C40);
}

uint64_t sub_21E4C08EC()
{
  return sub_21E4CED4C(&qword_267D319D0, (uint64_t)qword_267D33C40);
}

uint64_t sub_21E4C0910@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D319D0, (uint64_t)qword_267D33C40, a1);
}

uint64_t sub_21E4C0934(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33C58);
}

uint64_t sub_21E4C095C()
{
  return sub_21E4CED4C(&qword_267D319D8, (uint64_t)qword_267D33C58);
}

uint64_t sub_21E4C0980@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D319D8, (uint64_t)qword_267D33C58, a1);
}

uint64_t sub_21E4C09A4(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33C70);
}

uint64_t sub_21E4C09CC()
{
  return sub_21E4CED4C(&qword_267D319E0, (uint64_t)qword_267D33C70);
}

uint64_t sub_21E4C09F0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D319E0, (uint64_t)qword_267D33C70, a1);
}

uint64_t sub_21E4C0A14(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33C88);
}

uint64_t sub_21E4C0A40()
{
  return sub_21E4CED4C(&qword_267D319E8, (uint64_t)qword_267D33C88);
}

uint64_t sub_21E4C0A64@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D319E8, (uint64_t)qword_267D33C88, a1);
}

uint64_t sub_21E4C0A88(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33CA0);
}

uint64_t sub_21E4C0AAC()
{
  return sub_21E4CED4C(&qword_267D319F0, (uint64_t)qword_267D33CA0);
}

uint64_t sub_21E4C0AD0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D319F0, (uint64_t)qword_267D33CA0, a1);
}

uint64_t sub_21E4C0AF4(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33CB8);
}

uint64_t sub_21E4C0B18()
{
  return sub_21E4CED4C(&qword_267D319F8, (uint64_t)qword_267D33CB8);
}

uint64_t sub_21E4C0B3C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D319F8, (uint64_t)qword_267D33CB8, a1);
}

uint64_t sub_21E4C0B60(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33CD0);
}

uint64_t sub_21E4C0B84()
{
  return sub_21E4CED4C(&qword_267D31A00, (uint64_t)qword_267D33CD0);
}

uint64_t sub_21E4C0BA8@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31A00, (uint64_t)qword_267D33CD0, a1);
}

uint64_t sub_21E4C0BCC(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33CE8);
}

uint64_t sub_21E4C0BF0()
{
  return sub_21E4CED4C(&qword_267D31A08, (uint64_t)qword_267D33CE8);
}

uint64_t sub_21E4C0C14@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31A08, (uint64_t)qword_267D33CE8, a1);
}

uint64_t sub_21E4C0C38(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33D00);
}

uint64_t sub_21E4C0C5C()
{
  return sub_21E4CED4C(&qword_267D31A10, (uint64_t)qword_267D33D00);
}

uint64_t sub_21E4C0C80@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31A10, (uint64_t)qword_267D33D00, a1);
}

uint64_t sub_21E4C0CA4(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33D18);
}

uint64_t sub_21E4C0CCC()
{
  return sub_21E4CED4C(&qword_267D31A18, (uint64_t)qword_267D33D18);
}

uint64_t sub_21E4C0CF0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31A18, (uint64_t)qword_267D33D18, a1);
}

uint64_t sub_21E4C0D14(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33D30);
}

uint64_t sub_21E4C0D38()
{
  return sub_21E4CED4C(&qword_267D31A20, (uint64_t)qword_267D33D30);
}

uint64_t sub_21E4C0D5C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31A20, (uint64_t)qword_267D33D30, a1);
}

uint64_t sub_21E4C0D80(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33D48);
}

uint64_t sub_21E4C0DA4()
{
  return sub_21E4CED4C(&qword_267D31A28, (uint64_t)qword_267D33D48);
}

uint64_t sub_21E4C0DC8@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31A28, (uint64_t)qword_267D33D48, a1);
}

uint64_t sub_21E4C0DEC(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33D60);
}

uint64_t sub_21E4C0E10()
{
  return sub_21E4CED4C(&qword_267D31A30, (uint64_t)qword_267D33D60);
}

uint64_t sub_21E4C0E34@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31A30, (uint64_t)qword_267D33D60, a1);
}

uint64_t sub_21E4C0E58(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33D78);
}

uint64_t sub_21E4C0E7C()
{
  return sub_21E4CED4C(&qword_267D31A38, (uint64_t)qword_267D33D78);
}

uint64_t sub_21E4C0EA0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31A38, (uint64_t)qword_267D33D78, a1);
}

uint64_t sub_21E4C0EC4(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33D90);
}

uint64_t sub_21E4C0EE8()
{
  return sub_21E4CED4C(&qword_267D31A40, (uint64_t)qword_267D33D90);
}

uint64_t sub_21E4C0F0C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31A40, (uint64_t)qword_267D33D90, a1);
}

uint64_t sub_21E4C0F30(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33DA8);
}

uint64_t sub_21E4C0F54()
{
  return sub_21E4CED4C(&qword_267D31A48, (uint64_t)qword_267D33DA8);
}

uint64_t sub_21E4C0F78@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31A48, (uint64_t)qword_267D33DA8, a1);
}

uint64_t sub_21E4C0F9C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33DC0);
}

uint64_t sub_21E4C0FC0()
{
  return sub_21E4CED4C(&qword_267D31A50, (uint64_t)qword_267D33DC0);
}

uint64_t sub_21E4C0FE4@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31A50, (uint64_t)qword_267D33DC0, a1);
}

uint64_t sub_21E4C1008(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33DD8);
}

uint64_t sub_21E4C102C()
{
  return sub_21E4CED4C(&qword_267D31A58, (uint64_t)qword_267D33DD8);
}

uint64_t sub_21E4C1050@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31A58, (uint64_t)qword_267D33DD8, a1);
}

uint64_t sub_21E4C1074(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33DF0);
}

uint64_t sub_21E4C1098()
{
  return sub_21E4CED4C(&qword_267D31A60, (uint64_t)qword_267D33DF0);
}

uint64_t sub_21E4C10BC@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31A60, (uint64_t)qword_267D33DF0, a1);
}

uint64_t sub_21E4C10E0(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33E08);
}

uint64_t sub_21E4C1104()
{
  return sub_21E4CED4C(&qword_267D31A68, (uint64_t)qword_267D33E08);
}

uint64_t sub_21E4C1128@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31A68, (uint64_t)qword_267D33E08, a1);
}

uint64_t sub_21E4C114C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33E20);
}

uint64_t sub_21E4C1170()
{
  return sub_21E4CED4C(&qword_267D31A70, (uint64_t)qword_267D33E20);
}

uint64_t sub_21E4C1194@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31A70, (uint64_t)qword_267D33E20, a1);
}

uint64_t sub_21E4C11B8(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33E38);
}

uint64_t sub_21E4C11DC()
{
  return sub_21E4CED4C(&qword_267D31A78, (uint64_t)qword_267D33E38);
}

uint64_t sub_21E4C1200@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31A78, (uint64_t)qword_267D33E38, a1);
}

uint64_t sub_21E4C1224(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33E50);
}

uint64_t sub_21E4C1248()
{
  return sub_21E4CED4C(&qword_267D31A80, (uint64_t)qword_267D33E50);
}

uint64_t sub_21E4C126C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31A80, (uint64_t)qword_267D33E50, a1);
}

uint64_t sub_21E4C1290(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33E68);
}

uint64_t sub_21E4C12B4()
{
  return sub_21E4CED4C(&qword_267D31A88, (uint64_t)qword_267D33E68);
}

uint64_t sub_21E4C12D8@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31A88, (uint64_t)qword_267D33E68, a1);
}

uint64_t sub_21E4C12FC(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33E80);
}

uint64_t sub_21E4C1320()
{
  return sub_21E4CED4C(&qword_267D31A90, (uint64_t)qword_267D33E80);
}

uint64_t sub_21E4C1344@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31A90, (uint64_t)qword_267D33E80, a1);
}

uint64_t sub_21E4C1368(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33E98);
}

uint64_t sub_21E4C138C()
{
  return sub_21E4CED4C(&qword_267D31A98, (uint64_t)qword_267D33E98);
}

uint64_t sub_21E4C13B0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31A98, (uint64_t)qword_267D33E98, a1);
}

uint64_t sub_21E4C13D4(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33EB0);
}

uint64_t sub_21E4C13F8()
{
  return sub_21E4CED4C(&qword_267D31AA0, (uint64_t)qword_267D33EB0);
}

uint64_t sub_21E4C141C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31AA0, (uint64_t)qword_267D33EB0, a1);
}

uint64_t sub_21E4C1440(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33EC8);
}

uint64_t sub_21E4C1464()
{
  return sub_21E4CED4C(&qword_267D31AA8, (uint64_t)qword_267D33EC8);
}

uint64_t sub_21E4C1488@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31AA8, (uint64_t)qword_267D33EC8, a1);
}

uint64_t sub_21E4C14AC(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33EE0);
}

uint64_t sub_21E4C14C4()
{
  return sub_21E4CED4C(&qword_267D31AB0, (uint64_t)qword_267D33EE0);
}

uint64_t sub_21E4C14E8@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31AB0, (uint64_t)qword_267D33EE0, a1);
}

uint64_t sub_21E4C150C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33EF8);
}

uint64_t sub_21E4C1530()
{
  return sub_21E4CED4C(&qword_267D31AB8, (uint64_t)qword_267D33EF8);
}

uint64_t sub_21E4C1554@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31AB8, (uint64_t)qword_267D33EF8, a1);
}

uint64_t sub_21E4C1578(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33F10);
}

uint64_t sub_21E4C159C()
{
  return sub_21E4CED4C(&qword_267D31AC0, (uint64_t)qword_267D33F10);
}

uint64_t sub_21E4C15C0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31AC0, (uint64_t)qword_267D33F10, a1);
}

uint64_t sub_21E4C15E4(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33F28);
}

uint64_t sub_21E4C1608()
{
  return sub_21E4CED4C(&qword_267D31AC8, (uint64_t)qword_267D33F28);
}

uint64_t sub_21E4C162C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31AC8, (uint64_t)qword_267D33F28, a1);
}

uint64_t sub_21E4C1650(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33F40);
}

uint64_t sub_21E4C1674()
{
  return sub_21E4CED4C(&qword_267D31AD0, (uint64_t)qword_267D33F40);
}

uint64_t sub_21E4C1698@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31AD0, (uint64_t)qword_267D33F40, a1);
}

uint64_t sub_21E4C16BC(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33F58);
}

uint64_t sub_21E4C16E0()
{
  return sub_21E4CED4C(&qword_267D31AD8, (uint64_t)qword_267D33F58);
}

uint64_t sub_21E4C1704@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31AD8, (uint64_t)qword_267D33F58, a1);
}

uint64_t sub_21E4C1728(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33F70);
}

uint64_t sub_21E4C174C()
{
  return sub_21E4CED4C(&qword_267D31AE0, (uint64_t)qword_267D33F70);
}

uint64_t sub_21E4C1770@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31AE0, (uint64_t)qword_267D33F70, a1);
}

uint64_t sub_21E4C1794(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33F88);
}

uint64_t sub_21E4C17B8()
{
  return sub_21E4CED4C(&qword_267D31AE8, (uint64_t)qword_267D33F88);
}

uint64_t sub_21E4C17DC@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31AE8, (uint64_t)qword_267D33F88, a1);
}

uint64_t sub_21E4C1800(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33FA0);
}

uint64_t sub_21E4C1824()
{
  return sub_21E4CED4C(&qword_267D31AF0, (uint64_t)qword_267D33FA0);
}

uint64_t sub_21E4C1848@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31AF0, (uint64_t)qword_267D33FA0, a1);
}

uint64_t sub_21E4C186C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33FB8);
}

uint64_t sub_21E4C1898()
{
  return sub_21E4CED4C(&qword_267D31AF8, (uint64_t)qword_267D33FB8);
}

uint64_t sub_21E4C18BC@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31AF8, (uint64_t)qword_267D33FB8, a1);
}

uint64_t sub_21E4C18E0(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33FD0);
}

uint64_t sub_21E4C190C()
{
  return sub_21E4CED4C(&qword_267D31B00, (uint64_t)qword_267D33FD0);
}

uint64_t sub_21E4C1930@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31B00, (uint64_t)qword_267D33FD0, a1);
}

uint64_t sub_21E4C1954(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D33FE8);
}

uint64_t sub_21E4C1980()
{
  return sub_21E4CED4C(&qword_267D31B08, (uint64_t)qword_267D33FE8);
}

uint64_t sub_21E4C19A4@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31B08, (uint64_t)qword_267D33FE8, a1);
}

uint64_t sub_21E4C19C8(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34000);
}

uint64_t sub_21E4C19F0()
{
  return sub_21E4CED4C(&qword_267D31B10, (uint64_t)qword_267D34000);
}

uint64_t sub_21E4C1A14@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31B10, (uint64_t)qword_267D34000, a1);
}

uint64_t sub_21E4C1A38(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34018);
}

uint64_t sub_21E4C1A5C()
{
  return sub_21E4CED4C(&qword_267D31B18, (uint64_t)qword_267D34018);
}

uint64_t sub_21E4C1A80@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31B18, (uint64_t)qword_267D34018, a1);
}

uint64_t sub_21E4C1AA4(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34030);
}

uint64_t sub_21E4C1AC8()
{
  return sub_21E4CED4C(&qword_267D31B20, (uint64_t)qword_267D34030);
}

uint64_t sub_21E4C1AEC@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31B20, (uint64_t)qword_267D34030, a1);
}

uint64_t sub_21E4C1B10(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34048);
}

uint64_t sub_21E4C1B34()
{
  return sub_21E4CED4C(&qword_267D31B28, (uint64_t)qword_267D34048);
}

uint64_t sub_21E4C1B58@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31B28, (uint64_t)qword_267D34048, a1);
}

uint64_t sub_21E4C1B7C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34060);
}

uint64_t sub_21E4C1BA0()
{
  return sub_21E4CED4C(&qword_267D31B30, (uint64_t)qword_267D34060);
}

uint64_t sub_21E4C1BC4@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31B30, (uint64_t)qword_267D34060, a1);
}

uint64_t sub_21E4C1BE8(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34078);
}

uint64_t sub_21E4C1C0C()
{
  return sub_21E4CED4C(&qword_267D31B38, (uint64_t)qword_267D34078);
}

uint64_t sub_21E4C1C30@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31B38, (uint64_t)qword_267D34078, a1);
}

uint64_t sub_21E4C1C54(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34090);
}

uint64_t sub_21E4C1C74()
{
  return sub_21E4CED4C(&qword_267D31B40, (uint64_t)qword_267D34090);
}

uint64_t sub_21E4C1C98@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31B40, (uint64_t)qword_267D34090, a1);
}

uint64_t sub_21E4C1CBC(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D340A8);
}

uint64_t sub_21E4C1CE8()
{
  return sub_21E4CED4C(&qword_267D31B48, (uint64_t)qword_267D340A8);
}

uint64_t sub_21E4C1D0C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31B48, (uint64_t)qword_267D340A8, a1);
}

uint64_t sub_21E4C1D30(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D340C0);
}

uint64_t sub_21E4C1D54()
{
  return sub_21E4CED4C(&qword_267D31B50, (uint64_t)qword_267D340C0);
}

uint64_t sub_21E4C1D78@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31B50, (uint64_t)qword_267D340C0, a1);
}

uint64_t sub_21E4C1D9C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D340D8);
}

uint64_t sub_21E4C1DC8()
{
  return sub_21E4CED4C(&qword_267D31B58, (uint64_t)qword_267D340D8);
}

uint64_t sub_21E4C1DEC@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31B58, (uint64_t)qword_267D340D8, a1);
}

uint64_t sub_21E4C1E10(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D340F0);
}

uint64_t sub_21E4C1E3C()
{
  return sub_21E4CED4C(&qword_267D31B60, (uint64_t)qword_267D340F0);
}

uint64_t sub_21E4C1E60@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31B60, (uint64_t)qword_267D340F0, a1);
}

uint64_t sub_21E4C1E84(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34108);
}

uint64_t sub_21E4C1EB0()
{
  return sub_21E4CED4C(&qword_267D31B68, (uint64_t)qword_267D34108);
}

uint64_t sub_21E4C1ED4@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31B68, (uint64_t)qword_267D34108, a1);
}

uint64_t sub_21E4C1EF8(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34120);
}

uint64_t sub_21E4C1F10()
{
  return sub_21E4CED4C(&qword_267D31B70, (uint64_t)qword_267D34120);
}

uint64_t sub_21E4C1F34@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31B70, (uint64_t)qword_267D34120, a1);
}

uint64_t sub_21E4C1F58(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34138);
}

uint64_t sub_21E4C1F7C()
{
  return sub_21E4CED4C(&qword_267D31B78, (uint64_t)qword_267D34138);
}

uint64_t sub_21E4C1FA0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31B78, (uint64_t)qword_267D34138, a1);
}

uint64_t sub_21E4C1FC4(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34150);
}

uint64_t sub_21E4C1FE8()
{
  return sub_21E4CED4C(&qword_267D31B80, (uint64_t)qword_267D34150);
}

uint64_t sub_21E4C200C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31B80, (uint64_t)qword_267D34150, a1);
}

uint64_t sub_21E4C2030(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34168);
}

uint64_t sub_21E4C2054()
{
  return sub_21E4CED4C(&qword_267D31B88, (uint64_t)qword_267D34168);
}

uint64_t sub_21E4C2078@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31B88, (uint64_t)qword_267D34168, a1);
}

uint64_t sub_21E4C209C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34180);
}

uint64_t sub_21E4C20BC()
{
  return sub_21E4CED4C(&qword_267D31B90, (uint64_t)qword_267D34180);
}

uint64_t sub_21E4C20E0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31B90, (uint64_t)qword_267D34180, a1);
}

uint64_t sub_21E4C2104(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34198);
}

uint64_t sub_21E4C2124()
{
  return sub_21E4CED4C(&qword_267D31B98, (uint64_t)qword_267D34198);
}

uint64_t sub_21E4C2148@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31B98, (uint64_t)qword_267D34198, a1);
}

uint64_t sub_21E4C216C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D341B0);
}

uint64_t sub_21E4C218C()
{
  return sub_21E4CED4C(&qword_267D31BA0, (uint64_t)qword_267D341B0);
}

uint64_t sub_21E4C21B0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31BA0, (uint64_t)qword_267D341B0, a1);
}

uint64_t sub_21E4C21D4(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D341C8);
}

uint64_t sub_21E4C21F8()
{
  return sub_21E4CED4C(&qword_267D31BA8, (uint64_t)qword_267D341C8);
}

uint64_t sub_21E4C221C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31BA8, (uint64_t)qword_267D341C8, a1);
}

uint64_t sub_21E4C2240(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D341E0);
}

uint64_t sub_21E4C2260()
{
  return sub_21E4CED4C(&qword_267D31BB0, (uint64_t)qword_267D341E0);
}

uint64_t sub_21E4C2284@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31BB0, (uint64_t)qword_267D341E0, a1);
}

uint64_t sub_21E4C22A8(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D341F8);
}

uint64_t sub_21E4C22C8()
{
  return sub_21E4CED4C(&qword_267D31BB8, (uint64_t)qword_267D341F8);
}

uint64_t sub_21E4C22EC@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31BB8, (uint64_t)qword_267D341F8, a1);
}

uint64_t sub_21E4C2310(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34210);
}

uint64_t sub_21E4C2334()
{
  return sub_21E4CED4C(&qword_267D31BC0, (uint64_t)qword_267D34210);
}

uint64_t sub_21E4C2358@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31BC0, (uint64_t)qword_267D34210, a1);
}

uint64_t sub_21E4C237C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34228);
}

uint64_t sub_21E4C239C()
{
  return sub_21E4CED4C(&qword_267D31BC8, (uint64_t)qword_267D34228);
}

uint64_t sub_21E4C23C0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31BC8, (uint64_t)qword_267D34228, a1);
}

uint64_t sub_21E4C23E4(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34240);
}

uint64_t sub_21E4C2408()
{
  return sub_21E4CED4C(&qword_267D31BD0, (uint64_t)qword_267D34240);
}

uint64_t sub_21E4C242C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31BD0, (uint64_t)qword_267D34240, a1);
}

uint64_t sub_21E4C2450(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34258);
}

uint64_t sub_21E4C246C()
{
  return sub_21E4CED4C(&qword_267D31BD8, (uint64_t)qword_267D34258);
}

uint64_t sub_21E4C2490@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31BD8, (uint64_t)qword_267D34258, a1);
}

uint64_t sub_21E4C24B4(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34270);
}

uint64_t sub_21E4C24DC()
{
  return sub_21E4CED4C(&qword_267D31BE0, (uint64_t)qword_267D34270);
}

uint64_t sub_21E4C2500@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31BE0, (uint64_t)qword_267D34270, a1);
}

uint64_t sub_21E4C2524(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34288);
}

uint64_t sub_21E4C254C()
{
  return sub_21E4CED4C(&qword_267D31BE8, (uint64_t)qword_267D34288);
}

uint64_t sub_21E4C2570@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31BE8, (uint64_t)qword_267D34288, a1);
}

uint64_t sub_21E4C2594(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D342A0);
}

uint64_t sub_21E4C25B8()
{
  return sub_21E4CED4C(&qword_267D31BF0, (uint64_t)qword_267D342A0);
}

uint64_t sub_21E4C25DC@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31BF0, (uint64_t)qword_267D342A0, a1);
}

uint64_t sub_21E4C2600(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D342B8);
}

uint64_t sub_21E4C2624()
{
  return sub_21E4CED4C(&qword_267D31BF8, (uint64_t)qword_267D342B8);
}

uint64_t sub_21E4C2648@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31BF8, (uint64_t)qword_267D342B8, a1);
}

uint64_t sub_21E4C266C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D342D0);
}

uint64_t sub_21E4C2690()
{
  return sub_21E4CED4C(&qword_267D31C00, (uint64_t)qword_267D342D0);
}

uint64_t sub_21E4C26B4@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31C00, (uint64_t)qword_267D342D0, a1);
}

uint64_t sub_21E4C26D8(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D342E8);
}

uint64_t sub_21E4C26FC()
{
  return sub_21E4CED4C(&qword_267D31C08, (uint64_t)qword_267D342E8);
}

uint64_t sub_21E4C2720@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31C08, (uint64_t)qword_267D342E8, a1);
}

uint64_t sub_21E4C2744(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34300);
}

uint64_t sub_21E4C276C()
{
  return sub_21E4CED4C(&qword_267D31C10, (uint64_t)qword_267D34300);
}

uint64_t sub_21E4C2790@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31C10, (uint64_t)qword_267D34300, a1);
}

uint64_t sub_21E4C27B4(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34318);
}

uint64_t sub_21E4C27D8()
{
  return sub_21E4CED4C(&qword_267D31C18, (uint64_t)qword_267D34318);
}

uint64_t sub_21E4C27FC@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31C18, (uint64_t)qword_267D34318, a1);
}

uint64_t sub_21E4C2820(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34330);
}

uint64_t sub_21E4C2844()
{
  return sub_21E4CED4C(&qword_267D31C20, (uint64_t)qword_267D34330);
}

uint64_t sub_21E4C2868@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31C20, (uint64_t)qword_267D34330, a1);
}

uint64_t sub_21E4C288C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34348);
}

uint64_t sub_21E4C28B4()
{
  return sub_21E4CED4C(&qword_267D31C28, (uint64_t)qword_267D34348);
}

uint64_t sub_21E4C28D8@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31C28, (uint64_t)qword_267D34348, a1);
}

uint64_t sub_21E4C28FC(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34360);
}

uint64_t sub_21E4C2920()
{
  return sub_21E4CED4C(&qword_267D31C30, (uint64_t)qword_267D34360);
}

uint64_t sub_21E4C2944@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31C30, (uint64_t)qword_267D34360, a1);
}

uint64_t sub_21E4C2968(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34378);
}

uint64_t sub_21E4C2990()
{
  return sub_21E4CED4C(&qword_267D31C38, (uint64_t)qword_267D34378);
}

uint64_t sub_21E4C29B4@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31C38, (uint64_t)qword_267D34378, a1);
}

uint64_t sub_21E4C29D8(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34390);
}

uint64_t sub_21E4C29F4()
{
  return sub_21E4CED4C(&qword_267D31C40, (uint64_t)qword_267D34390);
}

uint64_t sub_21E4C2A18@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31C40, (uint64_t)qword_267D34390, a1);
}

uint64_t sub_21E4C2A3C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D343A8);
}

uint64_t sub_21E4C2A64()
{
  return sub_21E4CED4C(&qword_267D31C48, (uint64_t)qword_267D343A8);
}

uint64_t sub_21E4C2A88@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31C48, (uint64_t)qword_267D343A8, a1);
}

uint64_t sub_21E4C2AAC(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D343C0);
}

uint64_t sub_21E4C2AD0()
{
  return sub_21E4CED4C(&qword_267D31C50, (uint64_t)qword_267D343C0);
}

uint64_t sub_21E4C2AF4@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31C50, (uint64_t)qword_267D343C0, a1);
}

uint64_t sub_21E4C2B18(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D343D8);
}

uint64_t sub_21E4C2B40()
{
  return sub_21E4CED4C(&qword_267D31C58, (uint64_t)qword_267D343D8);
}

uint64_t sub_21E4C2B64@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31C58, (uint64_t)qword_267D343D8, a1);
}

uint64_t sub_21E4C2B88(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D343F0);
}

uint64_t sub_21E4C2BB0()
{
  return sub_21E4CED4C(&qword_267D31C60, (uint64_t)qword_267D343F0);
}

uint64_t sub_21E4C2BD4@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31C60, (uint64_t)qword_267D343F0, a1);
}

uint64_t sub_21E4C2BF8(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34408);
}

uint64_t sub_21E4C2C20()
{
  return sub_21E4CED4C(&qword_267D31C68, (uint64_t)qword_267D34408);
}

uint64_t sub_21E4C2C44@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31C68, (uint64_t)qword_267D34408, a1);
}

uint64_t sub_21E4C2C68(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34420);
}

uint64_t sub_21E4C2C88()
{
  return sub_21E4CED4C(&qword_267D31C70, (uint64_t)qword_267D34420);
}

uint64_t sub_21E4C2CAC@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31C70, (uint64_t)qword_267D34420, a1);
}

uint64_t sub_21E4C2CD0(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34438);
}

uint64_t sub_21E4C2CFC()
{
  return sub_21E4CED4C(&qword_267D31C78, (uint64_t)qword_267D34438);
}

uint64_t sub_21E4C2D20@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31C78, (uint64_t)qword_267D34438, a1);
}

uint64_t sub_21E4C2D44(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34450);
}

uint64_t sub_21E4C2D68()
{
  return sub_21E4CED4C(&qword_267D31C80, (uint64_t)qword_267D34450);
}

uint64_t sub_21E4C2D8C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31C80, (uint64_t)qword_267D34450, a1);
}

uint64_t sub_21E4C2DB0(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34468);
}

uint64_t sub_21E4C2DD8()
{
  return sub_21E4CED4C(&qword_267D31C88, (uint64_t)qword_267D34468);
}

uint64_t sub_21E4C2DFC@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31C88, (uint64_t)qword_267D34468, a1);
}

uint64_t sub_21E4C2E20(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34480);
}

uint64_t sub_21E4C2E48()
{
  return sub_21E4CED4C(&qword_267D31C90, (uint64_t)qword_267D34480);
}

uint64_t sub_21E4C2E6C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31C90, (uint64_t)qword_267D34480, a1);
}

uint64_t sub_21E4C2E90(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34498);
}

uint64_t sub_21E4C2EB8()
{
  return sub_21E4CED4C(&qword_267D31C98, (uint64_t)qword_267D34498);
}

uint64_t sub_21E4C2EDC@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31C98, (uint64_t)qword_267D34498, a1);
}

uint64_t sub_21E4C2F00(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D344B0);
}

uint64_t sub_21E4C2F2C()
{
  return sub_21E4CED4C(&qword_267D31CA0, (uint64_t)qword_267D344B0);
}

uint64_t sub_21E4C2F50@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31CA0, (uint64_t)qword_267D344B0, a1);
}

uint64_t sub_21E4C2F74(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D344C8);
}

uint64_t sub_21E4C2FA0()
{
  return sub_21E4CED4C(&qword_267D31CA8, (uint64_t)qword_267D344C8);
}

uint64_t sub_21E4C2FC4@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31CA8, (uint64_t)qword_267D344C8, a1);
}

uint64_t sub_21E4C2FE8(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D344E0);
}

uint64_t sub_21E4C3014()
{
  return sub_21E4CED4C(&qword_267D31CB0, (uint64_t)qword_267D344E0);
}

uint64_t sub_21E4C3038@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31CB0, (uint64_t)qword_267D344E0, a1);
}

uint64_t sub_21E4C305C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D344F8);
}

uint64_t sub_21E4C3084()
{
  return sub_21E4CED4C(&qword_267D31CB8, (uint64_t)qword_267D344F8);
}

uint64_t sub_21E4C30A8@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31CB8, (uint64_t)qword_267D344F8, a1);
}

uint64_t sub_21E4C30CC(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34510);
}

uint64_t sub_21E4C30F0()
{
  return sub_21E4CED4C(&qword_267D31CC0, (uint64_t)qword_267D34510);
}

uint64_t sub_21E4C3114@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31CC0, (uint64_t)qword_267D34510, a1);
}

uint64_t sub_21E4C3138(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34528);
}

uint64_t sub_21E4C315C()
{
  return sub_21E4CED4C(&qword_267D31CC8, (uint64_t)qword_267D34528);
}

uint64_t sub_21E4C3180@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31CC8, (uint64_t)qword_267D34528, a1);
}

uint64_t sub_21E4C31A4(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34540);
}

uint64_t sub_21E4C31C8()
{
  return sub_21E4CED4C(&qword_267D31CD0, (uint64_t)qword_267D34540);
}

uint64_t sub_21E4C31EC@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31CD0, (uint64_t)qword_267D34540, a1);
}

uint64_t sub_21E4C3210(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34558);
}

uint64_t sub_21E4C323C()
{
  return sub_21E4CED4C(&qword_267D31CD8, (uint64_t)qword_267D34558);
}

uint64_t sub_21E4C3260@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31CD8, (uint64_t)qword_267D34558, a1);
}

uint64_t sub_21E4C3284(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34570);
}

uint64_t sub_21E4C32B0()
{
  return sub_21E4CED4C(&qword_267D31CE0, (uint64_t)qword_267D34570);
}

uint64_t sub_21E4C32D4@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31CE0, (uint64_t)qword_267D34570, a1);
}

uint64_t sub_21E4C32F8(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34588);
}

uint64_t sub_21E4C3324()
{
  return sub_21E4CED4C(&qword_267D31CE8, (uint64_t)qword_267D34588);
}

uint64_t sub_21E4C3348@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31CE8, (uint64_t)qword_267D34588, a1);
}

uint64_t sub_21E4C336C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D345A0);
}

uint64_t sub_21E4C3390()
{
  return sub_21E4CED4C(&qword_267D31CF0, (uint64_t)qword_267D345A0);
}

uint64_t sub_21E4C33B4@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31CF0, (uint64_t)qword_267D345A0, a1);
}

uint64_t sub_21E4C33D8(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D345B8);
}

uint64_t sub_21E4C3404()
{
  return sub_21E4CED4C(&qword_267D31CF8, (uint64_t)qword_267D345B8);
}

uint64_t sub_21E4C3428@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31CF8, (uint64_t)qword_267D345B8, a1);
}

uint64_t sub_21E4C344C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D345D0);
}

uint64_t sub_21E4C3478()
{
  return sub_21E4CED4C(&qword_267D31D00, (uint64_t)qword_267D345D0);
}

uint64_t sub_21E4C349C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31D00, (uint64_t)qword_267D345D0, a1);
}

uint64_t sub_21E4C34C0(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D345E8);
}

uint64_t sub_21E4C34E4()
{
  return sub_21E4CED4C(&qword_267D31D08, (uint64_t)qword_267D345E8);
}

uint64_t sub_21E4C3508@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31D08, (uint64_t)qword_267D345E8, a1);
}

uint64_t sub_21E4C352C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34600);
}

uint64_t sub_21E4C3558()
{
  return sub_21E4CED4C(&qword_267D31D10, (uint64_t)qword_267D34600);
}

uint64_t sub_21E4C357C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31D10, (uint64_t)qword_267D34600, a1);
}

uint64_t sub_21E4C35A0(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34618);
}

uint64_t sub_21E4C35C4()
{
  return sub_21E4CED4C(&qword_267D31D18, (uint64_t)qword_267D34618);
}

uint64_t sub_21E4C35E8@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31D18, (uint64_t)qword_267D34618, a1);
}

uint64_t sub_21E4C360C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34630);
}

uint64_t sub_21E4C3630()
{
  return sub_21E4CED4C(&qword_267D31D20, (uint64_t)qword_267D34630);
}

uint64_t sub_21E4C3654@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31D20, (uint64_t)qword_267D34630, a1);
}

uint64_t sub_21E4C3678(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34648);
}

uint64_t sub_21E4C36A4()
{
  return sub_21E4CED4C(&qword_267D31D28, (uint64_t)qword_267D34648);
}

uint64_t sub_21E4C36C8@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31D28, (uint64_t)qword_267D34648, a1);
}

uint64_t sub_21E4C36EC(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34660);
}

uint64_t sub_21E4C3718()
{
  return sub_21E4CED4C(&qword_267D31D30, (uint64_t)qword_267D34660);
}

uint64_t sub_21E4C373C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31D30, (uint64_t)qword_267D34660, a1);
}

uint64_t sub_21E4C3760(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34678);
}

uint64_t sub_21E4C3784()
{
  return sub_21E4CED4C(&qword_267D31D38, (uint64_t)qword_267D34678);
}

uint64_t sub_21E4C37A8@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31D38, (uint64_t)qword_267D34678, a1);
}

uint64_t sub_21E4C37CC(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34690);
}

uint64_t sub_21E4C37F8()
{
  return sub_21E4CED4C(&qword_267D31D40, (uint64_t)qword_267D34690);
}

uint64_t sub_21E4C381C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31D40, (uint64_t)qword_267D34690, a1);
}

uint64_t sub_21E4C3840(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D346A8);
}

uint64_t sub_21E4C386C()
{
  return sub_21E4CED4C(&qword_267D31D48, (uint64_t)qword_267D346A8);
}

uint64_t sub_21E4C3890@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31D48, (uint64_t)qword_267D346A8, a1);
}

uint64_t sub_21E4C38B4(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D346C0);
}

uint64_t sub_21E4C38E0()
{
  return sub_21E4CED4C(&qword_267D31D50, (uint64_t)qword_267D346C0);
}

uint64_t sub_21E4C3904@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31D50, (uint64_t)qword_267D346C0, a1);
}

uint64_t sub_21E4C3928(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D346D8);
}

uint64_t sub_21E4C3954()
{
  return sub_21E4CED4C(&qword_267D31D58, (uint64_t)qword_267D346D8);
}

uint64_t sub_21E4C3978@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31D58, (uint64_t)qword_267D346D8, a1);
}

uint64_t sub_21E4C399C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D346F0);
}

uint64_t sub_21E4C39C8()
{
  return sub_21E4CED4C(&qword_267D31D60, (uint64_t)qword_267D346F0);
}

uint64_t sub_21E4C39EC@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31D60, (uint64_t)qword_267D346F0, a1);
}

uint64_t sub_21E4C3A10(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34708);
}

uint64_t sub_21E4C3A3C()
{
  return sub_21E4CED4C(&qword_267D31D68, (uint64_t)qword_267D34708);
}

uint64_t sub_21E4C3A60@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31D68, (uint64_t)qword_267D34708, a1);
}

uint64_t sub_21E4C3A84(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34720);
}

uint64_t sub_21E4C3AB0()
{
  return sub_21E4CED4C(&qword_267D31D70, (uint64_t)qword_267D34720);
}

uint64_t sub_21E4C3AD4@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31D70, (uint64_t)qword_267D34720, a1);
}

uint64_t sub_21E4C3AF8(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34738);
}

uint64_t sub_21E4C3B24()
{
  return sub_21E4CED4C(&qword_267D31D78, (uint64_t)qword_267D34738);
}

uint64_t sub_21E4C3B48@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31D78, (uint64_t)qword_267D34738, a1);
}

uint64_t sub_21E4C3B6C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34750);
}

uint64_t sub_21E4C3B98()
{
  return sub_21E4CED4C(&qword_267D31D80, (uint64_t)qword_267D34750);
}

uint64_t sub_21E4C3BBC@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31D80, (uint64_t)qword_267D34750, a1);
}

uint64_t sub_21E4C3BE0(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34768);
}

uint64_t sub_21E4C3C04()
{
  return sub_21E4CED4C(&qword_267D31D88, (uint64_t)qword_267D34768);
}

uint64_t sub_21E4C3C28@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31D88, (uint64_t)qword_267D34768, a1);
}

uint64_t sub_21E4C3C4C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34780);
}

uint64_t sub_21E4C3C78()
{
  return sub_21E4CED4C(&qword_267D31D90, (uint64_t)qword_267D34780);
}

uint64_t sub_21E4C3C9C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31D90, (uint64_t)qword_267D34780, a1);
}

uint64_t sub_21E4C3CC0(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34798);
}

uint64_t sub_21E4C3CEC()
{
  return sub_21E4CED4C(&qword_267D31D98, (uint64_t)qword_267D34798);
}

uint64_t sub_21E4C3D10@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31D98, (uint64_t)qword_267D34798, a1);
}

uint64_t sub_21E4C3D34(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D347B0);
}

uint64_t sub_21E4C3D58()
{
  return sub_21E4CED4C(&qword_267D31DA0, (uint64_t)qword_267D347B0);
}

uint64_t sub_21E4C3D7C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31DA0, (uint64_t)qword_267D347B0, a1);
}

uint64_t sub_21E4C3DA0(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D347C8);
}

uint64_t sub_21E4C3DCC()
{
  return sub_21E4CED4C(&qword_267D31DA8, (uint64_t)qword_267D347C8);
}

uint64_t sub_21E4C3DF0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31DA8, (uint64_t)qword_267D347C8, a1);
}

uint64_t sub_21E4C3E14(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D347E0);
}

uint64_t sub_21E4C3E40()
{
  return sub_21E4CED4C(&qword_267D31DB0, (uint64_t)qword_267D347E0);
}

uint64_t sub_21E4C3E64@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31DB0, (uint64_t)qword_267D347E0, a1);
}

uint64_t sub_21E4C3E88(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D347F8);
}

uint64_t sub_21E4C3EB4()
{
  return sub_21E4CED4C(&qword_267D31DB8, (uint64_t)qword_267D347F8);
}

uint64_t sub_21E4C3ED8@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31DB8, (uint64_t)qword_267D347F8, a1);
}

uint64_t sub_21E4C3EFC(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34810);
}

uint64_t sub_21E4C3F28()
{
  return sub_21E4CED4C(&qword_267D31DC0, (uint64_t)qword_267D34810);
}

uint64_t sub_21E4C3F4C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31DC0, (uint64_t)qword_267D34810, a1);
}

uint64_t sub_21E4C3F70(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34828);
}

uint64_t sub_21E4C3F9C()
{
  return sub_21E4CED4C(&qword_267D31DC8, (uint64_t)qword_267D34828);
}

uint64_t sub_21E4C3FC0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31DC8, (uint64_t)qword_267D34828, a1);
}

uint64_t sub_21E4C3FE4(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34840);
}

uint64_t sub_21E4C4010()
{
  return sub_21E4CED4C(&qword_267D31DD0, (uint64_t)qword_267D34840);
}

uint64_t sub_21E4C4034@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31DD0, (uint64_t)qword_267D34840, a1);
}

uint64_t sub_21E4C4058(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34858);
}

uint64_t sub_21E4C4084()
{
  return sub_21E4CED4C(&qword_267D31DD8, (uint64_t)qword_267D34858);
}

uint64_t sub_21E4C40A8@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31DD8, (uint64_t)qword_267D34858, a1);
}

uint64_t sub_21E4C40CC(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34870);
}

uint64_t sub_21E4C40F8()
{
  return sub_21E4CED4C(&qword_267D31DE0, (uint64_t)qword_267D34870);
}

uint64_t sub_21E4C411C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31DE0, (uint64_t)qword_267D34870, a1);
}

uint64_t sub_21E4C4140(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34888);
}

uint64_t sub_21E4C416C()
{
  return sub_21E4CED4C(&qword_267D31DE8, (uint64_t)qword_267D34888);
}

uint64_t sub_21E4C4190@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31DE8, (uint64_t)qword_267D34888, a1);
}

uint64_t sub_21E4C41B4(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D348A0);
}

uint64_t sub_21E4C41D8()
{
  return sub_21E4CED4C(&qword_267D31DF0, (uint64_t)qword_267D348A0);
}

uint64_t sub_21E4C41FC@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31DF0, (uint64_t)qword_267D348A0, a1);
}

uint64_t sub_21E4C4220(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D348B8);
}

uint64_t sub_21E4C4244()
{
  return sub_21E4CED4C(&qword_267D31DF8, (uint64_t)qword_267D348B8);
}

uint64_t sub_21E4C4268@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31DF8, (uint64_t)qword_267D348B8, a1);
}

uint64_t sub_21E4C428C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D348D0);
}

uint64_t sub_21E4C42B8()
{
  return sub_21E4CED4C(&qword_267D31E00, (uint64_t)qword_267D348D0);
}

uint64_t sub_21E4C42DC@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31E00, (uint64_t)qword_267D348D0, a1);
}

uint64_t sub_21E4C4300(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D348E8);
}

uint64_t sub_21E4C4324()
{
  return sub_21E4CED4C(&qword_267D31E08, (uint64_t)qword_267D348E8);
}

uint64_t sub_21E4C4348@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31E08, (uint64_t)qword_267D348E8, a1);
}

uint64_t sub_21E4C436C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34900);
}

uint64_t sub_21E4C4390()
{
  return sub_21E4CED4C(&qword_267D31E10, (uint64_t)qword_267D34900);
}

uint64_t sub_21E4C43B4@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31E10, (uint64_t)qword_267D34900, a1);
}

uint64_t sub_21E4C43D8(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34918);
}

uint64_t sub_21E4C4404()
{
  return sub_21E4CED4C(&qword_267D31E18, (uint64_t)qword_267D34918);
}

uint64_t sub_21E4C4428@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31E18, (uint64_t)qword_267D34918, a1);
}

uint64_t sub_21E4C444C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34930);
}

uint64_t sub_21E4C4478()
{
  return sub_21E4CED4C(&qword_267D31E20, (uint64_t)qword_267D34930);
}

uint64_t sub_21E4C449C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31E20, (uint64_t)qword_267D34930, a1);
}

uint64_t sub_21E4C44C0(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34948);
}

uint64_t sub_21E4C44EC()
{
  return sub_21E4CED4C(&qword_267D31E28, (uint64_t)qword_267D34948);
}

uint64_t sub_21E4C4510@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31E28, (uint64_t)qword_267D34948, a1);
}

uint64_t sub_21E4C4534(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34960);
}

uint64_t sub_21E4C4560()
{
  return sub_21E4CED4C(&qword_267D31E30, (uint64_t)qword_267D34960);
}

uint64_t sub_21E4C4584@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31E30, (uint64_t)qword_267D34960, a1);
}

uint64_t sub_21E4C45A8(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34978);
}

uint64_t sub_21E4C45D4()
{
  return sub_21E4CED4C(&qword_267D31E38, (uint64_t)qword_267D34978);
}

uint64_t sub_21E4C45F8@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31E38, (uint64_t)qword_267D34978, a1);
}

uint64_t sub_21E4C461C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34990);
}

uint64_t sub_21E4C4648()
{
  return sub_21E4CED4C(&qword_267D31E40, (uint64_t)qword_267D34990);
}

uint64_t sub_21E4C466C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31E40, (uint64_t)qword_267D34990, a1);
}

uint64_t sub_21E4C4690(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D349A8);
}

uint64_t sub_21E4C46BC()
{
  return sub_21E4CED4C(&qword_267D31E48, (uint64_t)qword_267D349A8);
}

uint64_t sub_21E4C46E0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31E48, (uint64_t)qword_267D349A8, a1);
}

uint64_t sub_21E4C4704(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D349C0);
}

uint64_t sub_21E4C4730()
{
  return sub_21E4CED4C(&qword_267D31E50, (uint64_t)qword_267D349C0);
}

uint64_t sub_21E4C4754@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31E50, (uint64_t)qword_267D349C0, a1);
}

uint64_t sub_21E4C4778(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D349D8);
}

uint64_t sub_21E4C47A4()
{
  return sub_21E4CED4C(&qword_267D31E58, (uint64_t)qword_267D349D8);
}

uint64_t sub_21E4C47C8@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31E58, (uint64_t)qword_267D349D8, a1);
}

uint64_t sub_21E4C47EC(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D349F0);
}

uint64_t sub_21E4C4810()
{
  return sub_21E4CED4C(&qword_267D31E60, (uint64_t)qword_267D349F0);
}

uint64_t sub_21E4C4834@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31E60, (uint64_t)qword_267D349F0, a1);
}

uint64_t sub_21E4C4858(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34A08);
}

uint64_t sub_21E4C487C()
{
  return sub_21E4CED4C(&qword_267D31E68, (uint64_t)qword_267D34A08);
}

uint64_t sub_21E4C48A0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31E68, (uint64_t)qword_267D34A08, a1);
}

uint64_t sub_21E4C48C4(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34A20);
}

uint64_t sub_21E4C48F0()
{
  return sub_21E4CED4C(&qword_267D31E70, (uint64_t)qword_267D34A20);
}

uint64_t sub_21E4C4914@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31E70, (uint64_t)qword_267D34A20, a1);
}

uint64_t sub_21E4C4938(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34A38);
}

uint64_t sub_21E4C495C()
{
  return sub_21E4CED4C(&qword_267D31E78, (uint64_t)qword_267D34A38);
}

uint64_t sub_21E4C4980@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31E78, (uint64_t)qword_267D34A38, a1);
}

uint64_t sub_21E4C49A4(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34A50);
}

uint64_t sub_21E4C49D0()
{
  return sub_21E4CED4C(&qword_267D31E80, (uint64_t)qword_267D34A50);
}

uint64_t sub_21E4C49F4@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31E80, (uint64_t)qword_267D34A50, a1);
}

uint64_t sub_21E4C4A18(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34A68);
}

uint64_t sub_21E4C4A44()
{
  return sub_21E4CED4C(&qword_267D31E88, (uint64_t)qword_267D34A68);
}

uint64_t sub_21E4C4A68@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31E88, (uint64_t)qword_267D34A68, a1);
}

uint64_t sub_21E4C4A8C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34A80);
}

uint64_t sub_21E4C4AB8()
{
  return sub_21E4CED4C(&qword_267D31E90, (uint64_t)qword_267D34A80);
}

uint64_t sub_21E4C4ADC@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31E90, (uint64_t)qword_267D34A80, a1);
}

uint64_t sub_21E4C4B00(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34A98);
}

uint64_t sub_21E4C4B24()
{
  return sub_21E4CED4C(&qword_267D31E98, (uint64_t)qword_267D34A98);
}

uint64_t sub_21E4C4B48@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31E98, (uint64_t)qword_267D34A98, a1);
}

uint64_t sub_21E4C4B6C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34AB0);
}

uint64_t sub_21E4C4B98()
{
  return sub_21E4CED4C(&qword_267D31EA0, (uint64_t)qword_267D34AB0);
}

uint64_t sub_21E4C4BBC@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31EA0, (uint64_t)qword_267D34AB0, a1);
}

uint64_t sub_21E4C4BE0(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34AC8);
}

uint64_t sub_21E4C4C04()
{
  return sub_21E4CED4C(&qword_267D31EA8, (uint64_t)qword_267D34AC8);
}

uint64_t sub_21E4C4C28@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31EA8, (uint64_t)qword_267D34AC8, a1);
}

uint64_t sub_21E4C4C4C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34AE0);
}

uint64_t sub_21E4C4C70()
{
  return sub_21E4CED4C(&qword_267D31EB0, (uint64_t)qword_267D34AE0);
}

uint64_t sub_21E4C4C94@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31EB0, (uint64_t)qword_267D34AE0, a1);
}

uint64_t sub_21E4C4CB8(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34AF8);
}

uint64_t sub_21E4C4CE4()
{
  return sub_21E4CED4C(&qword_267D31EB8, (uint64_t)qword_267D34AF8);
}

uint64_t sub_21E4C4D08@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31EB8, (uint64_t)qword_267D34AF8, a1);
}

uint64_t sub_21E4C4D2C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34B10);
}

uint64_t sub_21E4C4D58()
{
  return sub_21E4CED4C(&qword_267D31EC0, (uint64_t)qword_267D34B10);
}

uint64_t sub_21E4C4D7C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31EC0, (uint64_t)qword_267D34B10, a1);
}

uint64_t sub_21E4C4DA0(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34B28);
}

uint64_t sub_21E4C4DCC()
{
  return sub_21E4CED4C(&qword_267D31EC8, (uint64_t)qword_267D34B28);
}

uint64_t sub_21E4C4DF0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31EC8, (uint64_t)qword_267D34B28, a1);
}

uint64_t sub_21E4C4E14(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34B40);
}

uint64_t sub_21E4C4E40()
{
  return sub_21E4CED4C(&qword_267D31ED0, (uint64_t)qword_267D34B40);
}

uint64_t sub_21E4C4E64@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31ED0, (uint64_t)qword_267D34B40, a1);
}

uint64_t sub_21E4C4E88(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34B58);
}

uint64_t sub_21E4C4EB4()
{
  return sub_21E4CED4C(&qword_267D31ED8, (uint64_t)qword_267D34B58);
}

uint64_t sub_21E4C4ED8@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31ED8, (uint64_t)qword_267D34B58, a1);
}

uint64_t sub_21E4C4EFC(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34B70);
}

uint64_t sub_21E4C4F28()
{
  return sub_21E4CED4C(&qword_267D31EE0, (uint64_t)qword_267D34B70);
}

uint64_t sub_21E4C4F4C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31EE0, (uint64_t)qword_267D34B70, a1);
}

uint64_t sub_21E4C4F70(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34B88);
}

uint64_t sub_21E4C4F9C()
{
  return sub_21E4CED4C(&qword_267D31EE8, (uint64_t)qword_267D34B88);
}

uint64_t sub_21E4C4FC0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31EE8, (uint64_t)qword_267D34B88, a1);
}

uint64_t sub_21E4C4FE4(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34BA0);
}

uint64_t sub_21E4C5010()
{
  return sub_21E4CED4C(&qword_267D31EF0, (uint64_t)qword_267D34BA0);
}

uint64_t sub_21E4C5034@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31EF0, (uint64_t)qword_267D34BA0, a1);
}

uint64_t sub_21E4C5058(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34BB8);
}

uint64_t sub_21E4C5084()
{
  return sub_21E4CED4C(&qword_267D31EF8, (uint64_t)qword_267D34BB8);
}

uint64_t sub_21E4C50A8@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31EF8, (uint64_t)qword_267D34BB8, a1);
}

uint64_t sub_21E4C50CC(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34BD0);
}

uint64_t sub_21E4C50EC()
{
  return sub_21E4CED4C(&qword_267D31F00, (uint64_t)qword_267D34BD0);
}

uint64_t sub_21E4C5110@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31F00, (uint64_t)qword_267D34BD0, a1);
}

uint64_t sub_21E4C5134(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34BE8);
}

uint64_t sub_21E4C5160()
{
  return sub_21E4CED4C(&qword_267D31F08, (uint64_t)qword_267D34BE8);
}

uint64_t sub_21E4C5184@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31F08, (uint64_t)qword_267D34BE8, a1);
}

uint64_t sub_21E4C51A8(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34C00);
}

uint64_t sub_21E4C51CC()
{
  return sub_21E4CED4C(&qword_267D31F10, (uint64_t)qword_267D34C00);
}

uint64_t sub_21E4C51F0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31F10, (uint64_t)qword_267D34C00, a1);
}

uint64_t sub_21E4C5214(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34C18);
}

uint64_t sub_21E4C5240()
{
  return sub_21E4CED4C(&qword_267D31F18, (uint64_t)qword_267D34C18);
}

uint64_t sub_21E4C5264@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31F18, (uint64_t)qword_267D34C18, a1);
}

uint64_t sub_21E4C5288(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34C30);
}

uint64_t sub_21E4C52B4()
{
  return sub_21E4CED4C(&qword_267D31F20, (uint64_t)qword_267D34C30);
}

uint64_t sub_21E4C52D8@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31F20, (uint64_t)qword_267D34C30, a1);
}

uint64_t sub_21E4C52FC(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34C48);
}

uint64_t sub_21E4C5328()
{
  return sub_21E4CED4C(&qword_267D31F28, (uint64_t)qword_267D34C48);
}

uint64_t sub_21E4C534C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31F28, (uint64_t)qword_267D34C48, a1);
}

uint64_t sub_21E4C5370(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34C60);
}

uint64_t sub_21E4C5398()
{
  return sub_21E4CED4C(&qword_267D31F30, (uint64_t)qword_267D34C60);
}

uint64_t sub_21E4C53BC@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31F30, (uint64_t)qword_267D34C60, a1);
}

uint64_t sub_21E4C53E0(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34C78);
}

uint64_t sub_21E4C5404()
{
  return sub_21E4CED4C(&qword_267D31F38, (uint64_t)qword_267D34C78);
}

uint64_t sub_21E4C5428@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31F38, (uint64_t)qword_267D34C78, a1);
}

uint64_t sub_21E4C544C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34C90);
}

uint64_t sub_21E4C5470()
{
  return sub_21E4CED4C(&qword_267D31F40, (uint64_t)qword_267D34C90);
}

uint64_t sub_21E4C5494@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31F40, (uint64_t)qword_267D34C90, a1);
}

uint64_t sub_21E4C54B8(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34CA8);
}

uint64_t sub_21E4C54DC()
{
  return sub_21E4CED4C(&qword_267D31F48, (uint64_t)qword_267D34CA8);
}

uint64_t sub_21E4C5500@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31F48, (uint64_t)qword_267D34CA8, a1);
}

uint64_t sub_21E4C5524(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34CC0);
}

uint64_t sub_21E4C5548()
{
  return sub_21E4CED4C(&qword_267D31F50, (uint64_t)qword_267D34CC0);
}

uint64_t sub_21E4C556C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31F50, (uint64_t)qword_267D34CC0, a1);
}

uint64_t sub_21E4C5590(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34CD8);
}

uint64_t sub_21E4C55B4()
{
  return sub_21E4CED4C(&qword_267D31F58, (uint64_t)qword_267D34CD8);
}

uint64_t sub_21E4C55D8@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31F58, (uint64_t)qword_267D34CD8, a1);
}

uint64_t sub_21E4C55FC(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34CF0);
}

uint64_t sub_21E4C5628()
{
  return sub_21E4CED4C(&qword_267D31F60, (uint64_t)qword_267D34CF0);
}

uint64_t sub_21E4C564C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31F60, (uint64_t)qword_267D34CF0, a1);
}

uint64_t sub_21E4C5670(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34D08);
}

uint64_t sub_21E4C5694()
{
  return sub_21E4CED4C(&qword_267D31F68, (uint64_t)qword_267D34D08);
}

uint64_t sub_21E4C56B8@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31F68, (uint64_t)qword_267D34D08, a1);
}

uint64_t sub_21E4C56DC(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34D20);
}

uint64_t sub_21E4C5700()
{
  return sub_21E4CED4C(&qword_267D31F70, (uint64_t)qword_267D34D20);
}

uint64_t sub_21E4C5724@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31F70, (uint64_t)qword_267D34D20, a1);
}

uint64_t sub_21E4C5748(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34D38);
}

uint64_t sub_21E4C576C()
{
  return sub_21E4CED4C(&qword_267D31F78, (uint64_t)qword_267D34D38);
}

uint64_t sub_21E4C5790@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31F78, (uint64_t)qword_267D34D38, a1);
}

uint64_t sub_21E4C57B4(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34D50);
}

uint64_t sub_21E4C57D8()
{
  return sub_21E4CED4C(&qword_267D31F80, (uint64_t)qword_267D34D50);
}

uint64_t sub_21E4C57FC@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31F80, (uint64_t)qword_267D34D50, a1);
}

uint64_t sub_21E4C5820(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34D68);
}

uint64_t sub_21E4C5844()
{
  return sub_21E4CED4C(&qword_267D31F88, (uint64_t)qword_267D34D68);
}

uint64_t sub_21E4C5868@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31F88, (uint64_t)qword_267D34D68, a1);
}

uint64_t sub_21E4C588C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34D80);
}

uint64_t sub_21E4C58B0()
{
  return sub_21E4CED4C(&qword_267D31F90, (uint64_t)qword_267D34D80);
}

uint64_t sub_21E4C58D4@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31F90, (uint64_t)qword_267D34D80, a1);
}

uint64_t sub_21E4C58F8(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34D98);
}

uint64_t sub_21E4C591C()
{
  return sub_21E4CED4C(&qword_267D31F98, (uint64_t)qword_267D34D98);
}

uint64_t sub_21E4C5940@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31F98, (uint64_t)qword_267D34D98, a1);
}

uint64_t sub_21E4C5964(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34DB0);
}

uint64_t sub_21E4C5988()
{
  return sub_21E4CED4C(&qword_267D31FA0, (uint64_t)qword_267D34DB0);
}

uint64_t sub_21E4C59AC@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31FA0, (uint64_t)qword_267D34DB0, a1);
}

uint64_t sub_21E4C59D0(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34DC8);
}

uint64_t sub_21E4C59F4()
{
  return sub_21E4CED4C(&qword_267D31FA8, (uint64_t)qword_267D34DC8);
}

uint64_t sub_21E4C5A18@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31FA8, (uint64_t)qword_267D34DC8, a1);
}

uint64_t sub_21E4C5A3C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34DE0);
}

uint64_t sub_21E4C5A60()
{
  return sub_21E4CED4C(&qword_267D31FB0, (uint64_t)qword_267D34DE0);
}

uint64_t sub_21E4C5A84@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31FB0, (uint64_t)qword_267D34DE0, a1);
}

uint64_t sub_21E4C5AA8(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34DF8);
}

uint64_t sub_21E4C5ACC()
{
  return sub_21E4CED4C(&qword_267D31FB8, (uint64_t)qword_267D34DF8);
}

uint64_t sub_21E4C5AF0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31FB8, (uint64_t)qword_267D34DF8, a1);
}

uint64_t sub_21E4C5B14(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34E10);
}

uint64_t sub_21E4C5B38()
{
  return sub_21E4CED4C(&qword_267D31FC0, (uint64_t)qword_267D34E10);
}

uint64_t sub_21E4C5B5C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31FC0, (uint64_t)qword_267D34E10, a1);
}

uint64_t sub_21E4C5B80(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34E28);
}

uint64_t sub_21E4C5B9C()
{
  return sub_21E4CED4C(&qword_267D31FC8, (uint64_t)qword_267D34E28);
}

uint64_t sub_21E4C5BC0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31FC8, (uint64_t)qword_267D34E28, a1);
}

uint64_t sub_21E4C5BE4(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34E40);
}

uint64_t sub_21E4C5C0C()
{
  return sub_21E4CED4C(&qword_267D31FD0, (uint64_t)qword_267D34E40);
}

uint64_t sub_21E4C5C30@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31FD0, (uint64_t)qword_267D34E40, a1);
}

uint64_t sub_21E4C5C54(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34E58);
}

uint64_t sub_21E4C5C78()
{
  return sub_21E4CED4C(&qword_267D31FD8, (uint64_t)qword_267D34E58);
}

uint64_t sub_21E4C5C9C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31FD8, (uint64_t)qword_267D34E58, a1);
}

uint64_t sub_21E4C5CC0(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34E70);
}

uint64_t sub_21E4C5CE4()
{
  return sub_21E4CED4C(&qword_267D31FE0, (uint64_t)qword_267D34E70);
}

uint64_t sub_21E4C5D08@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31FE0, (uint64_t)qword_267D34E70, a1);
}

uint64_t sub_21E4C5D2C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34E88);
}

uint64_t sub_21E4C5D50()
{
  return sub_21E4CED4C(&qword_267D31FE8, (uint64_t)qword_267D34E88);
}

uint64_t sub_21E4C5D74@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31FE8, (uint64_t)qword_267D34E88, a1);
}

uint64_t sub_21E4C5D98(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34EA0);
}

uint64_t sub_21E4C5DBC()
{
  return sub_21E4CED4C(&qword_267D31FF0, (uint64_t)qword_267D34EA0);
}

uint64_t sub_21E4C5DE0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31FF0, (uint64_t)qword_267D34EA0, a1);
}

uint64_t sub_21E4C5E04(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34EB8);
}

uint64_t sub_21E4C5E30()
{
  return sub_21E4CED4C(&qword_267D31FF8, (uint64_t)qword_267D34EB8);
}

uint64_t sub_21E4C5E54@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D31FF8, (uint64_t)qword_267D34EB8, a1);
}

uint64_t sub_21E4C5E78(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34ED0);
}

uint64_t sub_21E4C5EA4()
{
  return sub_21E4CED4C(&qword_267D32000, (uint64_t)qword_267D34ED0);
}

uint64_t sub_21E4C5EC8@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32000, (uint64_t)qword_267D34ED0, a1);
}

uint64_t sub_21E4C5EEC(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34EE8);
}

uint64_t sub_21E4C5F18()
{
  return sub_21E4CED4C(&qword_267D32008, (uint64_t)qword_267D34EE8);
}

uint64_t sub_21E4C5F3C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32008, (uint64_t)qword_267D34EE8, a1);
}

uint64_t sub_21E4C5F60(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34F00);
}

uint64_t sub_21E4C5F8C()
{
  return sub_21E4CED4C(&qword_267D32010, (uint64_t)qword_267D34F00);
}

uint64_t sub_21E4C5FB0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32010, (uint64_t)qword_267D34F00, a1);
}

uint64_t sub_21E4C5FD4(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34F18);
}

uint64_t sub_21E4C5FFC()
{
  return sub_21E4CED4C(&qword_267D32018, (uint64_t)qword_267D34F18);
}

uint64_t sub_21E4C6020@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32018, (uint64_t)qword_267D34F18, a1);
}

uint64_t sub_21E4C6044(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34F30);
}

uint64_t sub_21E4C6068()
{
  return sub_21E4CED4C(&qword_267D32020, (uint64_t)qword_267D34F30);
}

uint64_t sub_21E4C608C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32020, (uint64_t)qword_267D34F30, a1);
}

uint64_t sub_21E4C60B0(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34F48);
}

uint64_t sub_21E4C60D4()
{
  return sub_21E4CED4C(&qword_267D32028, (uint64_t)qword_267D34F48);
}

uint64_t sub_21E4C60F8@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32028, (uint64_t)qword_267D34F48, a1);
}

uint64_t sub_21E4C611C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34F60);
}

uint64_t sub_21E4C6140()
{
  return sub_21E4CED4C(&qword_267D32030, (uint64_t)qword_267D34F60);
}

uint64_t sub_21E4C6164@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32030, (uint64_t)qword_267D34F60, a1);
}

uint64_t sub_21E4C6188(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34F78);
}

uint64_t sub_21E4C61AC()
{
  return sub_21E4CED4C(&qword_267D32038, (uint64_t)qword_267D34F78);
}

uint64_t sub_21E4C61D0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32038, (uint64_t)qword_267D34F78, a1);
}

uint64_t sub_21E4C61F4(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34F90);
}

uint64_t sub_21E4C6218()
{
  return sub_21E4CED4C(&qword_267D32040, (uint64_t)qword_267D34F90);
}

uint64_t sub_21E4C623C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32040, (uint64_t)qword_267D34F90, a1);
}

uint64_t sub_21E4C6260(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34FA8);
}

uint64_t sub_21E4C6284()
{
  return sub_21E4CED4C(&qword_267D32048, (uint64_t)qword_267D34FA8);
}

uint64_t sub_21E4C62A8@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32048, (uint64_t)qword_267D34FA8, a1);
}

uint64_t sub_21E4C62CC(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34FC0);
}

uint64_t sub_21E4C62F0()
{
  return sub_21E4CED4C(&qword_267D32050, (uint64_t)qword_267D34FC0);
}

uint64_t sub_21E4C6314@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32050, (uint64_t)qword_267D34FC0, a1);
}

uint64_t sub_21E4C6338(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34FD8);
}

uint64_t sub_21E4C635C()
{
  return sub_21E4CED4C(&qword_267D32058, (uint64_t)qword_267D34FD8);
}

uint64_t sub_21E4C6380@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32058, (uint64_t)qword_267D34FD8, a1);
}

uint64_t sub_21E4C63A4(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D34FF0);
}

uint64_t sub_21E4C63C8()
{
  return sub_21E4CED4C(&qword_267D32060, (uint64_t)qword_267D34FF0);
}

uint64_t sub_21E4C63EC@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32060, (uint64_t)qword_267D34FF0, a1);
}

uint64_t sub_21E4C6410(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35008);
}

uint64_t sub_21E4C6434()
{
  return sub_21E4CED4C(&qword_267D32068, (uint64_t)qword_267D35008);
}

uint64_t sub_21E4C6458@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32068, (uint64_t)qword_267D35008, a1);
}

uint64_t sub_21E4C647C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35020);
}

uint64_t sub_21E4C64A0()
{
  return sub_21E4CED4C(&qword_267D32070, (uint64_t)qword_267D35020);
}

uint64_t sub_21E4C64C4@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32070, (uint64_t)qword_267D35020, a1);
}

uint64_t sub_21E4C64E8(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35038);
}

uint64_t sub_21E4C650C()
{
  return sub_21E4CED4C(&qword_267D32078, (uint64_t)qword_267D35038);
}

uint64_t sub_21E4C6530@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32078, (uint64_t)qword_267D35038, a1);
}

uint64_t sub_21E4C6554(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35050);
}

uint64_t sub_21E4C6578()
{
  return sub_21E4CED4C(&qword_267D32080, (uint64_t)qword_267D35050);
}

uint64_t sub_21E4C659C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32080, (uint64_t)qword_267D35050, a1);
}

uint64_t sub_21E4C65C0(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35068);
}

uint64_t sub_21E4C65EC()
{
  return sub_21E4CED4C(&qword_267D32088, (uint64_t)qword_267D35068);
}

uint64_t sub_21E4C6610@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32088, (uint64_t)qword_267D35068, a1);
}

uint64_t sub_21E4C6634(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35080);
}

uint64_t sub_21E4C6658()
{
  return sub_21E4CED4C(&qword_267D32090, (uint64_t)qword_267D35080);
}

uint64_t sub_21E4C667C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32090, (uint64_t)qword_267D35080, a1);
}

uint64_t sub_21E4C66A0(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35098);
}

uint64_t sub_21E4C66C4()
{
  return sub_21E4CED4C(&qword_267D32098, (uint64_t)qword_267D35098);
}

uint64_t sub_21E4C66E8@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32098, (uint64_t)qword_267D35098, a1);
}

uint64_t sub_21E4C670C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D350B0);
}

uint64_t sub_21E4C6738()
{
  return sub_21E4CED4C(&qword_267D320A0, (uint64_t)qword_267D350B0);
}

uint64_t sub_21E4C675C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D320A0, (uint64_t)qword_267D350B0, a1);
}

uint64_t sub_21E4C6780(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D350C8);
}

uint64_t sub_21E4C67AC()
{
  return sub_21E4CED4C(&qword_267D320A8, (uint64_t)qword_267D350C8);
}

uint64_t sub_21E4C67D0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D320A8, (uint64_t)qword_267D350C8, a1);
}

uint64_t sub_21E4C67F4(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D350E0);
}

uint64_t sub_21E4C6820()
{
  return sub_21E4CED4C(&qword_267D320B0, (uint64_t)qword_267D350E0);
}

uint64_t sub_21E4C6844@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D320B0, (uint64_t)qword_267D350E0, a1);
}

uint64_t sub_21E4C6868(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D350F8);
}

uint64_t sub_21E4C6894()
{
  return sub_21E4CED4C(&qword_267D320B8, (uint64_t)qword_267D350F8);
}

uint64_t sub_21E4C68B8@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D320B8, (uint64_t)qword_267D350F8, a1);
}

uint64_t sub_21E4C68DC(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35110);
}

uint64_t sub_21E4C6908()
{
  return sub_21E4CED4C(&qword_267D320C0, (uint64_t)qword_267D35110);
}

uint64_t sub_21E4C692C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D320C0, (uint64_t)qword_267D35110, a1);
}

uint64_t sub_21E4C6950(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35128);
}

uint64_t sub_21E4C697C()
{
  return sub_21E4CED4C(&qword_267D320C8, (uint64_t)qword_267D35128);
}

uint64_t sub_21E4C69A0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D320C8, (uint64_t)qword_267D35128, a1);
}

uint64_t sub_21E4C69C4(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35140);
}

uint64_t sub_21E4C69F0()
{
  return sub_21E4CED4C(&qword_267D320D0, (uint64_t)qword_267D35140);
}

uint64_t sub_21E4C6A14@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D320D0, (uint64_t)qword_267D35140, a1);
}

uint64_t sub_21E4C6A38(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35158);
}

uint64_t sub_21E4C6A64()
{
  return sub_21E4CED4C(&qword_267D320D8, (uint64_t)qword_267D35158);
}

uint64_t sub_21E4C6A88@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D320D8, (uint64_t)qword_267D35158, a1);
}

uint64_t sub_21E4C6AAC(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35170);
}

uint64_t sub_21E4C6AD8()
{
  return sub_21E4CED4C(&qword_267D320E0, (uint64_t)qword_267D35170);
}

uint64_t sub_21E4C6AFC@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D320E0, (uint64_t)qword_267D35170, a1);
}

uint64_t sub_21E4C6B20(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35188);
}

uint64_t sub_21E4C6B44()
{
  return sub_21E4CED4C(&qword_267D320E8, (uint64_t)qword_267D35188);
}

uint64_t sub_21E4C6B68@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D320E8, (uint64_t)qword_267D35188, a1);
}

uint64_t sub_21E4C6B8C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D351A0);
}

uint64_t sub_21E4C6BB8()
{
  return sub_21E4CED4C(&qword_267D320F0, (uint64_t)qword_267D351A0);
}

uint64_t sub_21E4C6BDC@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D320F0, (uint64_t)qword_267D351A0, a1);
}

uint64_t sub_21E4C6C00(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D351B8);
}

uint64_t sub_21E4C6C24()
{
  return sub_21E4CED4C(&qword_267D320F8, (uint64_t)qword_267D351B8);
}

uint64_t sub_21E4C6C48@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D320F8, (uint64_t)qword_267D351B8, a1);
}

uint64_t sub_21E4C6C6C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D351D0);
}

uint64_t sub_21E4C6C90()
{
  return sub_21E4CED4C(&qword_267D32100, (uint64_t)qword_267D351D0);
}

uint64_t sub_21E4C6CB4@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32100, (uint64_t)qword_267D351D0, a1);
}

uint64_t sub_21E4C6CD8(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D351E8);
}

uint64_t sub_21E4C6D04()
{
  return sub_21E4CED4C(&qword_267D32108, (uint64_t)qword_267D351E8);
}

uint64_t sub_21E4C6D28@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32108, (uint64_t)qword_267D351E8, a1);
}

uint64_t sub_21E4C6D4C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35200);
}

uint64_t sub_21E4C6D78()
{
  return sub_21E4CED4C(&qword_267D32110, (uint64_t)qword_267D35200);
}

uint64_t sub_21E4C6D9C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32110, (uint64_t)qword_267D35200, a1);
}

uint64_t sub_21E4C6DC0(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35218);
}

uint64_t sub_21E4C6DEC()
{
  return sub_21E4CED4C(&qword_267D32118, (uint64_t)qword_267D35218);
}

uint64_t sub_21E4C6E10@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32118, (uint64_t)qword_267D35218, a1);
}

uint64_t sub_21E4C6E34(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35230);
}

uint64_t sub_21E4C6E60()
{
  return sub_21E4CED4C(&qword_267D32120, (uint64_t)qword_267D35230);
}

uint64_t sub_21E4C6E84@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32120, (uint64_t)qword_267D35230, a1);
}

uint64_t sub_21E4C6EA8(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35248);
}

uint64_t sub_21E4C6ED4()
{
  return sub_21E4CED4C(&qword_267D32128, (uint64_t)qword_267D35248);
}

uint64_t sub_21E4C6EF8@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32128, (uint64_t)qword_267D35248, a1);
}

uint64_t sub_21E4C6F1C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35260);
}

uint64_t sub_21E4C6F48()
{
  return sub_21E4CED4C(&qword_267D32130, (uint64_t)qword_267D35260);
}

uint64_t sub_21E4C6F6C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32130, (uint64_t)qword_267D35260, a1);
}

uint64_t sub_21E4C6F90(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35278);
}

uint64_t sub_21E4C6FBC()
{
  return sub_21E4CED4C(&qword_267D32138, (uint64_t)qword_267D35278);
}

uint64_t sub_21E4C6FE0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32138, (uint64_t)qword_267D35278, a1);
}

uint64_t sub_21E4C7004(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35290);
}

uint64_t sub_21E4C7030()
{
  return sub_21E4CED4C(&qword_267D32140, (uint64_t)qword_267D35290);
}

uint64_t sub_21E4C7054@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32140, (uint64_t)qword_267D35290, a1);
}

uint64_t sub_21E4C7078(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D352A8);
}

uint64_t sub_21E4C70A4()
{
  return sub_21E4CED4C(&qword_267D32148, (uint64_t)qword_267D352A8);
}

uint64_t sub_21E4C70C8@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32148, (uint64_t)qword_267D352A8, a1);
}

uint64_t sub_21E4C70EC(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D352C0);
}

uint64_t sub_21E4C7114()
{
  return sub_21E4CED4C(&qword_267D32150, (uint64_t)qword_267D352C0);
}

uint64_t sub_21E4C7138@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32150, (uint64_t)qword_267D352C0, a1);
}

uint64_t sub_21E4C715C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D352D8);
}

uint64_t sub_21E4C7180()
{
  return sub_21E4CED4C(&qword_267D32158, (uint64_t)qword_267D352D8);
}

uint64_t sub_21E4C71A4@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32158, (uint64_t)qword_267D352D8, a1);
}

uint64_t sub_21E4C71C8(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D352F0);
}

uint64_t sub_21E4C71EC()
{
  return sub_21E4CED4C(&qword_267D32160, (uint64_t)qword_267D352F0);
}

uint64_t sub_21E4C7210@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32160, (uint64_t)qword_267D352F0, a1);
}

uint64_t sub_21E4C7234(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35308);
}

uint64_t sub_21E4C7258()
{
  return sub_21E4CED4C(&qword_267D32168, (uint64_t)qword_267D35308);
}

uint64_t sub_21E4C727C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32168, (uint64_t)qword_267D35308, a1);
}

uint64_t sub_21E4C72A0(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35320);
}

uint64_t sub_21E4C72CC()
{
  return sub_21E4CED4C(&qword_267D32170, (uint64_t)qword_267D35320);
}

uint64_t sub_21E4C72F0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32170, (uint64_t)qword_267D35320, a1);
}

uint64_t sub_21E4C7314(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35338);
}

uint64_t sub_21E4C7340()
{
  return sub_21E4CED4C(&qword_267D32178, (uint64_t)qword_267D35338);
}

uint64_t sub_21E4C7364@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32178, (uint64_t)qword_267D35338, a1);
}

uint64_t sub_21E4C7388(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35350);
}

uint64_t sub_21E4C73B4()
{
  return sub_21E4CED4C(&qword_267D32180, (uint64_t)qword_267D35350);
}

uint64_t sub_21E4C73D8@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32180, (uint64_t)qword_267D35350, a1);
}

uint64_t sub_21E4C73FC(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35368);
}

uint64_t sub_21E4C7420()
{
  return sub_21E4CED4C(&qword_267D32188, (uint64_t)qword_267D35368);
}

uint64_t sub_21E4C7444@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32188, (uint64_t)qword_267D35368, a1);
}

uint64_t sub_21E4C7468(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35380);
}

uint64_t sub_21E4C7494()
{
  return sub_21E4CED4C(&qword_267D32190, (uint64_t)qword_267D35380);
}

uint64_t sub_21E4C74B8@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32190, (uint64_t)qword_267D35380, a1);
}

uint64_t sub_21E4C74DC(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35398);
}

uint64_t sub_21E4C7508()
{
  return sub_21E4CED4C(&qword_267D32198, (uint64_t)qword_267D35398);
}

uint64_t sub_21E4C752C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32198, (uint64_t)qword_267D35398, a1);
}

uint64_t sub_21E4C7550(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D353B0);
}

uint64_t sub_21E4C7574()
{
  return sub_21E4CED4C(&qword_267D321A0, (uint64_t)qword_267D353B0);
}

uint64_t sub_21E4C7598@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D321A0, (uint64_t)qword_267D353B0, a1);
}

uint64_t sub_21E4C75BC(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D353C8);
}

uint64_t sub_21E4C75E8()
{
  return sub_21E4CED4C(&qword_267D321A8, (uint64_t)qword_267D353C8);
}

uint64_t sub_21E4C760C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D321A8, (uint64_t)qword_267D353C8, a1);
}

uint64_t sub_21E4C7630(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D353E0);
}

uint64_t sub_21E4C7654()
{
  return sub_21E4CED4C(&qword_267D321B0, (uint64_t)qword_267D353E0);
}

uint64_t sub_21E4C7678@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D321B0, (uint64_t)qword_267D353E0, a1);
}

uint64_t sub_21E4C769C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D353F8);
}

uint64_t sub_21E4C76C8()
{
  return sub_21E4CED4C(&qword_267D321B8, (uint64_t)qword_267D353F8);
}

uint64_t sub_21E4C76EC@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D321B8, (uint64_t)qword_267D353F8, a1);
}

uint64_t sub_21E4C7710(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35410);
}

uint64_t sub_21E4C7734()
{
  return sub_21E4CED4C(&qword_267D321C0, (uint64_t)qword_267D35410);
}

uint64_t sub_21E4C7758@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D321C0, (uint64_t)qword_267D35410, a1);
}

uint64_t sub_21E4C777C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35428);
}

uint64_t sub_21E4C77A0()
{
  return sub_21E4CED4C(&qword_267D321C8, (uint64_t)qword_267D35428);
}

uint64_t sub_21E4C77C4@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D321C8, (uint64_t)qword_267D35428, a1);
}

uint64_t sub_21E4C77E8(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35440);
}

uint64_t sub_21E4C780C()
{
  return sub_21E4CED4C(&qword_267D321D0, (uint64_t)qword_267D35440);
}

uint64_t sub_21E4C7830@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D321D0, (uint64_t)qword_267D35440, a1);
}

uint64_t sub_21E4C7854(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35458);
}

uint64_t sub_21E4C7878()
{
  return sub_21E4CED4C(&qword_267D321D8, (uint64_t)qword_267D35458);
}

uint64_t sub_21E4C789C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D321D8, (uint64_t)qword_267D35458, a1);
}

uint64_t sub_21E4C78C0(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35470);
}

uint64_t sub_21E4C78E4()
{
  return sub_21E4CED4C(&qword_267D321E0, (uint64_t)qword_267D35470);
}

uint64_t sub_21E4C7908@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D321E0, (uint64_t)qword_267D35470, a1);
}

uint64_t sub_21E4C792C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35488);
}

uint64_t sub_21E4C7950()
{
  return sub_21E4CED4C(&qword_267D321E8, (uint64_t)qword_267D35488);
}

uint64_t sub_21E4C7974@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D321E8, (uint64_t)qword_267D35488, a1);
}

uint64_t sub_21E4C7998(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D354A0);
}

uint64_t sub_21E4C79BC()
{
  return sub_21E4CED4C(&qword_267D321F0, (uint64_t)qword_267D354A0);
}

uint64_t sub_21E4C79E0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D321F0, (uint64_t)qword_267D354A0, a1);
}

uint64_t sub_21E4C7A04(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D354B8);
}

uint64_t sub_21E4C7A28()
{
  return sub_21E4CED4C(&qword_267D321F8, (uint64_t)qword_267D354B8);
}

uint64_t sub_21E4C7A4C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D321F8, (uint64_t)qword_267D354B8, a1);
}

uint64_t sub_21E4C7A70(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D354D0);
}

uint64_t sub_21E4C7A9C()
{
  return sub_21E4CED4C(&qword_267D32200, (uint64_t)qword_267D354D0);
}

uint64_t sub_21E4C7AC0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32200, (uint64_t)qword_267D354D0, a1);
}

uint64_t sub_21E4C7AE4(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D354E8);
}

uint64_t sub_21E4C7B10()
{
  return sub_21E4CED4C(&qword_267D32208, (uint64_t)qword_267D354E8);
}

uint64_t sub_21E4C7B34@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32208, (uint64_t)qword_267D354E8, a1);
}

uint64_t sub_21E4C7B58(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35500);
}

uint64_t sub_21E4C7B84()
{
  return sub_21E4CED4C(&qword_267D32210, (uint64_t)qword_267D35500);
}

uint64_t sub_21E4C7BA8@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32210, (uint64_t)qword_267D35500, a1);
}

uint64_t sub_21E4C7BCC(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35518);
}

uint64_t sub_21E4C7BEC()
{
  return sub_21E4CED4C(&qword_267D32218, (uint64_t)qword_267D35518);
}

uint64_t sub_21E4C7C10@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32218, (uint64_t)qword_267D35518, a1);
}

uint64_t sub_21E4C7C34(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35530);
}

uint64_t sub_21E4C7C5C()
{
  return sub_21E4CED4C(&qword_267D32220, (uint64_t)qword_267D35530);
}

uint64_t sub_21E4C7C80@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32220, (uint64_t)qword_267D35530, a1);
}

uint64_t sub_21E4C7CA4(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35548);
}

uint64_t sub_21E4C7CD0()
{
  return sub_21E4CED4C(&qword_267D32228, (uint64_t)qword_267D35548);
}

uint64_t sub_21E4C7CF4@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32228, (uint64_t)qword_267D35548, a1);
}

uint64_t sub_21E4C7D18(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35560);
}

uint64_t sub_21E4C7D3C()
{
  return sub_21E4CED4C(&qword_267D32230, (uint64_t)qword_267D35560);
}

uint64_t sub_21E4C7D60@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32230, (uint64_t)qword_267D35560, a1);
}

uint64_t sub_21E4C7D84(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35578);
}

uint64_t sub_21E4C7DAC()
{
  return sub_21E4CED4C(&qword_267D32238, (uint64_t)qword_267D35578);
}

uint64_t sub_21E4C7DD0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32238, (uint64_t)qword_267D35578, a1);
}

uint64_t sub_21E4C7DF4(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35590);
}

uint64_t sub_21E4C7E1C()
{
  return sub_21E4CED4C(&qword_267D32240, (uint64_t)qword_267D35590);
}

uint64_t sub_21E4C7E40@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32240, (uint64_t)qword_267D35590, a1);
}

uint64_t sub_21E4C7E64(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D355A8);
}

uint64_t sub_21E4C7E8C()
{
  return sub_21E4CED4C(&qword_267D32248, (uint64_t)qword_267D355A8);
}

uint64_t sub_21E4C7EB0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32248, (uint64_t)qword_267D355A8, a1);
}

uint64_t sub_21E4C7ED4(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D355C0);
}

uint64_t sub_21E4C7EFC()
{
  return sub_21E4CED4C(&qword_267D32250, (uint64_t)qword_267D355C0);
}

uint64_t sub_21E4C7F20@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32250, (uint64_t)qword_267D355C0, a1);
}

uint64_t sub_21E4C7F44(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D355D8);
}

uint64_t sub_21E4C7F6C()
{
  return sub_21E4CED4C(&qword_267D32258, (uint64_t)qword_267D355D8);
}

uint64_t sub_21E4C7F90@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32258, (uint64_t)qword_267D355D8, a1);
}

uint64_t sub_21E4C7FB4(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D355F0);
}

uint64_t sub_21E4C7FDC()
{
  return sub_21E4CED4C(&qword_267D32260, (uint64_t)qword_267D355F0);
}

uint64_t sub_21E4C8000@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32260, (uint64_t)qword_267D355F0, a1);
}

uint64_t sub_21E4C8024(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35608);
}

uint64_t sub_21E4C804C()
{
  return sub_21E4CED4C(&qword_267D32268, (uint64_t)qword_267D35608);
}

uint64_t sub_21E4C8070@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32268, (uint64_t)qword_267D35608, a1);
}

uint64_t sub_21E4C8094(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35620);
}

uint64_t sub_21E4C80BC()
{
  return sub_21E4CED4C(&qword_267D32270, (uint64_t)qword_267D35620);
}

uint64_t sub_21E4C80E0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32270, (uint64_t)qword_267D35620, a1);
}

uint64_t sub_21E4C8104(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35638);
}

uint64_t sub_21E4C812C()
{
  return sub_21E4CED4C(&qword_267D32278, (uint64_t)qword_267D35638);
}

uint64_t sub_21E4C8150@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32278, (uint64_t)qword_267D35638, a1);
}

uint64_t sub_21E4C8174(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35650);
}

uint64_t sub_21E4C818C()
{
  return sub_21E4CED4C(&qword_267D32280, (uint64_t)qword_267D35650);
}

uint64_t sub_21E4C81B0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32280, (uint64_t)qword_267D35650, a1);
}

uint64_t sub_21E4C81D4(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35668);
}

uint64_t sub_21E4C81F8()
{
  return sub_21E4CED4C(&qword_267D32288, (uint64_t)qword_267D35668);
}

uint64_t sub_21E4C821C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32288, (uint64_t)qword_267D35668, a1);
}

uint64_t sub_21E4C8240(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35680);
}

uint64_t sub_21E4C8264()
{
  return sub_21E4CED4C(&qword_267D32290, (uint64_t)qword_267D35680);
}

uint64_t sub_21E4C8288@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32290, (uint64_t)qword_267D35680, a1);
}

uint64_t sub_21E4C82AC(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35698);
}

uint64_t sub_21E4C82D0()
{
  return sub_21E4CED4C(&qword_267D32298, (uint64_t)qword_267D35698);
}

uint64_t sub_21E4C82F4@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32298, (uint64_t)qword_267D35698, a1);
}

uint64_t sub_21E4C8318(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D356B0);
}

uint64_t sub_21E4C833C()
{
  return sub_21E4CED4C(&qword_267D322A0, (uint64_t)qword_267D356B0);
}

uint64_t sub_21E4C8360@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D322A0, (uint64_t)qword_267D356B0, a1);
}

uint64_t sub_21E4C8384(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D356C8);
}

uint64_t sub_21E4C83A8()
{
  return sub_21E4CED4C(&qword_267D322A8, (uint64_t)qword_267D356C8);
}

uint64_t sub_21E4C83CC@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D322A8, (uint64_t)qword_267D356C8, a1);
}

uint64_t sub_21E4C83F0(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D356E0);
}

uint64_t sub_21E4C8414()
{
  return sub_21E4CED4C(&qword_267D322B0, (uint64_t)qword_267D356E0);
}

uint64_t sub_21E4C8438@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D322B0, (uint64_t)qword_267D356E0, a1);
}

uint64_t sub_21E4C845C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D356F8);
}

uint64_t sub_21E4C8480()
{
  return sub_21E4CED4C(&qword_267D322B8, (uint64_t)qword_267D356F8);
}

uint64_t sub_21E4C84A4@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D322B8, (uint64_t)qword_267D356F8, a1);
}

uint64_t sub_21E4C84C8(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35710);
}

uint64_t sub_21E4C84EC()
{
  return sub_21E4CED4C(&qword_267D322C0, (uint64_t)qword_267D35710);
}

uint64_t sub_21E4C8510@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D322C0, (uint64_t)qword_267D35710, a1);
}

uint64_t sub_21E4C8534(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35728);
}

uint64_t sub_21E4C8558()
{
  return sub_21E4CED4C(&qword_267D322C8, (uint64_t)qword_267D35728);
}

uint64_t sub_21E4C857C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D322C8, (uint64_t)qword_267D35728, a1);
}

uint64_t sub_21E4C85A0(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35740);
}

uint64_t sub_21E4C85C4()
{
  return sub_21E4CED4C(&qword_267D322D0, (uint64_t)qword_267D35740);
}

uint64_t sub_21E4C85E8@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D322D0, (uint64_t)qword_267D35740, a1);
}

uint64_t sub_21E4C860C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35758);
}

uint64_t sub_21E4C8630()
{
  return sub_21E4CED4C(&qword_267D322D8, (uint64_t)qword_267D35758);
}

uint64_t sub_21E4C8654@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D322D8, (uint64_t)qword_267D35758, a1);
}

uint64_t sub_21E4C8678(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35770);
}

uint64_t sub_21E4C86A0()
{
  return sub_21E4CED4C(&qword_267D322E0, (uint64_t)qword_267D35770);
}

uint64_t sub_21E4C86C4@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D322E0, (uint64_t)qword_267D35770, a1);
}

uint64_t sub_21E4C86E8(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35788);
}

uint64_t sub_21E4C870C()
{
  return sub_21E4CED4C(&qword_267D322E8, (uint64_t)qword_267D35788);
}

uint64_t sub_21E4C8730@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D322E8, (uint64_t)qword_267D35788, a1);
}

uint64_t sub_21E4C8754(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D357A0);
}

uint64_t sub_21E4C8778()
{
  return sub_21E4CED4C(&qword_267D322F0, (uint64_t)qword_267D357A0);
}

uint64_t sub_21E4C879C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D322F0, (uint64_t)qword_267D357A0, a1);
}

uint64_t sub_21E4C87C0(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D357B8);
}

uint64_t sub_21E4C87E4()
{
  return sub_21E4CED4C(&qword_267D322F8, (uint64_t)qword_267D357B8);
}

uint64_t sub_21E4C8808@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D322F8, (uint64_t)qword_267D357B8, a1);
}

uint64_t sub_21E4C882C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D357D0);
}

uint64_t sub_21E4C8850()
{
  return sub_21E4CED4C(&qword_267D32300, (uint64_t)qword_267D357D0);
}

uint64_t sub_21E4C8874@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32300, (uint64_t)qword_267D357D0, a1);
}

uint64_t sub_21E4C8898(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D357E8);
}

uint64_t sub_21E4C88BC()
{
  return sub_21E4CED4C(&qword_267D32308, (uint64_t)qword_267D357E8);
}

uint64_t sub_21E4C88E0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32308, (uint64_t)qword_267D357E8, a1);
}

uint64_t sub_21E4C8904(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35800);
}

uint64_t sub_21E4C8920()
{
  return sub_21E4CED4C(&qword_267D32310, (uint64_t)qword_267D35800);
}

uint64_t sub_21E4C8944@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32310, (uint64_t)qword_267D35800, a1);
}

uint64_t sub_21E4C8968(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35818);
}

uint64_t sub_21E4C8990()
{
  return sub_21E4CED4C(&qword_267D32318, (uint64_t)qword_267D35818);
}

uint64_t sub_21E4C89B4@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32318, (uint64_t)qword_267D35818, a1);
}

uint64_t sub_21E4C89D8(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35830);
}

uint64_t sub_21E4C89FC()
{
  return sub_21E4CED4C(&qword_267D32320, (uint64_t)qword_267D35830);
}

uint64_t sub_21E4C8A20@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32320, (uint64_t)qword_267D35830, a1);
}

uint64_t sub_21E4C8A44(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35848);
}

uint64_t sub_21E4C8A68()
{
  return sub_21E4CED4C(&qword_267D32328, (uint64_t)qword_267D35848);
}

uint64_t sub_21E4C8A8C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32328, (uint64_t)qword_267D35848, a1);
}

uint64_t sub_21E4C8AB0(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35860);
}

uint64_t sub_21E4C8AD4()
{
  return sub_21E4CED4C(&qword_267D32330, (uint64_t)qword_267D35860);
}

uint64_t sub_21E4C8AF8@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32330, (uint64_t)qword_267D35860, a1);
}

uint64_t sub_21E4C8B1C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35878);
}

uint64_t sub_21E4C8B40()
{
  return sub_21E4CED4C(&qword_267D32338, (uint64_t)qword_267D35878);
}

uint64_t sub_21E4C8B64@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32338, (uint64_t)qword_267D35878, a1);
}

uint64_t sub_21E4C8B88(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35890);
}

uint64_t sub_21E4C8BA8()
{
  return sub_21E4CED4C(&qword_267D32340, (uint64_t)qword_267D35890);
}

uint64_t sub_21E4C8BCC@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32340, (uint64_t)qword_267D35890, a1);
}

uint64_t sub_21E4C8BF0(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D358A8);
}

uint64_t sub_21E4C8C1C()
{
  return sub_21E4CED4C(&qword_267D32348, (uint64_t)qword_267D358A8);
}

uint64_t sub_21E4C8C40@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32348, (uint64_t)qword_267D358A8, a1);
}

uint64_t sub_21E4C8C64(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D358C0);
}

uint64_t sub_21E4C8C88()
{
  return sub_21E4CED4C(&qword_267D32350, (uint64_t)qword_267D358C0);
}

uint64_t sub_21E4C8CAC@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32350, (uint64_t)qword_267D358C0, a1);
}

uint64_t sub_21E4C8CD0(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D358D8);
}

uint64_t sub_21E4C8CF8()
{
  return sub_21E4CED4C(&qword_267D32358, (uint64_t)qword_267D358D8);
}

uint64_t sub_21E4C8D1C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32358, (uint64_t)qword_267D358D8, a1);
}

uint64_t sub_21E4C8D40(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D358F0);
}

uint64_t sub_21E4C8D68()
{
  return sub_21E4CED4C(&qword_267D32360, (uint64_t)qword_267D358F0);
}

uint64_t sub_21E4C8D8C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32360, (uint64_t)qword_267D358F0, a1);
}

uint64_t sub_21E4C8DB0(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35908);
}

uint64_t sub_21E4C8DD8()
{
  return sub_21E4CED4C(&qword_267D32368, (uint64_t)qword_267D35908);
}

uint64_t sub_21E4C8DFC@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32368, (uint64_t)qword_267D35908, a1);
}

uint64_t sub_21E4C8E20(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35920);
}

uint64_t sub_21E4C8E4C()
{
  return sub_21E4CED4C(&qword_267D32370, (uint64_t)qword_267D35920);
}

uint64_t sub_21E4C8E70@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32370, (uint64_t)qword_267D35920, a1);
}

uint64_t sub_21E4C8E94(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35938);
}

uint64_t sub_21E4C8EB8()
{
  return sub_21E4CED4C(&qword_267D32378, (uint64_t)qword_267D35938);
}

uint64_t sub_21E4C8EDC@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32378, (uint64_t)qword_267D35938, a1);
}

uint64_t sub_21E4C8F00(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35950);
}

uint64_t sub_21E4C8F24()
{
  return sub_21E4CED4C(&qword_267D32380, (uint64_t)qword_267D35950);
}

uint64_t sub_21E4C8F48@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32380, (uint64_t)qword_267D35950, a1);
}

uint64_t sub_21E4C8F6C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35968);
}

uint64_t sub_21E4C8F90()
{
  return sub_21E4CED4C(&qword_267D32388, (uint64_t)qword_267D35968);
}

uint64_t sub_21E4C8FB4@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32388, (uint64_t)qword_267D35968, a1);
}

uint64_t sub_21E4C8FD8(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35980);
}

uint64_t sub_21E4C8FFC()
{
  return sub_21E4CED4C(&qword_267D32390, (uint64_t)qword_267D35980);
}

uint64_t sub_21E4C9020@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32390, (uint64_t)qword_267D35980, a1);
}

uint64_t sub_21E4C9044(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35998);
}

uint64_t sub_21E4C9068()
{
  return sub_21E4CED4C(&qword_267D32398, (uint64_t)qword_267D35998);
}

uint64_t sub_21E4C908C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32398, (uint64_t)qword_267D35998, a1);
}

uint64_t sub_21E4C90B0(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D359B0);
}

uint64_t sub_21E4C90D8()
{
  return sub_21E4CED4C(&qword_267D323A0, (uint64_t)qword_267D359B0);
}

uint64_t sub_21E4C90FC@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D323A0, (uint64_t)qword_267D359B0, a1);
}

uint64_t sub_21E4C9120(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D359C8);
}

uint64_t sub_21E4C9144()
{
  return sub_21E4CED4C(&qword_267D323A8, (uint64_t)qword_267D359C8);
}

uint64_t sub_21E4C9168@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D323A8, (uint64_t)qword_267D359C8, a1);
}

uint64_t sub_21E4C918C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D359E0);
}

uint64_t sub_21E4C91B0()
{
  return sub_21E4CED4C(&qword_267D323B0, (uint64_t)qword_267D359E0);
}

uint64_t sub_21E4C91D4@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D323B0, (uint64_t)qword_267D359E0, a1);
}

uint64_t sub_21E4C91F8(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D359F8);
}

uint64_t sub_21E4C921C()
{
  return sub_21E4CED4C(&qword_267D323B8, (uint64_t)qword_267D359F8);
}

uint64_t sub_21E4C9240@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D323B8, (uint64_t)qword_267D359F8, a1);
}

uint64_t sub_21E4C9264(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35A10);
}

uint64_t sub_21E4C9288()
{
  return sub_21E4CED4C(&qword_267D323C0, (uint64_t)qword_267D35A10);
}

uint64_t sub_21E4C92AC@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D323C0, (uint64_t)qword_267D35A10, a1);
}

uint64_t sub_21E4C92D0(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35A28);
}

uint64_t sub_21E4C92F4()
{
  return sub_21E4CED4C(&qword_267D323C8, (uint64_t)qword_267D35A28);
}

uint64_t sub_21E4C9318@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D323C8, (uint64_t)qword_267D35A28, a1);
}

uint64_t sub_21E4C933C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35A40);
}

uint64_t sub_21E4C9364()
{
  return sub_21E4CED4C(&qword_267D323D0, (uint64_t)qword_267D35A40);
}

uint64_t sub_21E4C9388@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D323D0, (uint64_t)qword_267D35A40, a1);
}

uint64_t sub_21E4C93AC(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35A58);
}

uint64_t sub_21E4C93D0()
{
  return sub_21E4CED4C(&qword_267D323D8, (uint64_t)qword_267D35A58);
}

uint64_t sub_21E4C93F4@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D323D8, (uint64_t)qword_267D35A58, a1);
}

uint64_t sub_21E4C9418(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35A70);
}

uint64_t sub_21E4C943C()
{
  return sub_21E4CED4C(&qword_267D323E0, (uint64_t)qword_267D35A70);
}

uint64_t sub_21E4C9460@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D323E0, (uint64_t)qword_267D35A70, a1);
}

uint64_t sub_21E4C9484(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35A88);
}

uint64_t sub_21E4C94A8()
{
  return sub_21E4CED4C(&qword_267D323E8, (uint64_t)qword_267D35A88);
}

uint64_t sub_21E4C94CC@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D323E8, (uint64_t)qword_267D35A88, a1);
}

uint64_t sub_21E4C94F0(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35AA0);
}

uint64_t sub_21E4C9514()
{
  return sub_21E4CED4C(&qword_267D323F0, (uint64_t)qword_267D35AA0);
}

uint64_t sub_21E4C9538@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D323F0, (uint64_t)qword_267D35AA0, a1);
}

uint64_t sub_21E4C955C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35AB8);
}

uint64_t sub_21E4C9580()
{
  return sub_21E4CED4C(&qword_267D323F8, (uint64_t)qword_267D35AB8);
}

uint64_t sub_21E4C95A4@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D323F8, (uint64_t)qword_267D35AB8, a1);
}

uint64_t sub_21E4C95C8(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35AD0);
}

uint64_t sub_21E4C95E4()
{
  return sub_21E4CED4C(&qword_267D32400, (uint64_t)qword_267D35AD0);
}

uint64_t sub_21E4C9608@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32400, (uint64_t)qword_267D35AD0, a1);
}

uint64_t sub_21E4C962C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35AE8);
}

uint64_t sub_21E4C9654()
{
  return sub_21E4CED4C(&qword_267D32408, (uint64_t)qword_267D35AE8);
}

uint64_t sub_21E4C9678@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32408, (uint64_t)qword_267D35AE8, a1);
}

uint64_t sub_21E4C969C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35B00);
}

uint64_t sub_21E4C96C0()
{
  return sub_21E4CED4C(&qword_267D32410, (uint64_t)qword_267D35B00);
}

uint64_t sub_21E4C96E4@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32410, (uint64_t)qword_267D35B00, a1);
}

uint64_t sub_21E4C9708(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35B18);
}

uint64_t sub_21E4C9730()
{
  return sub_21E4CED4C(&qword_267D32418, (uint64_t)qword_267D35B18);
}

uint64_t sub_21E4C9754@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32418, (uint64_t)qword_267D35B18, a1);
}

uint64_t sub_21E4C9778(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35B30);
}

uint64_t sub_21E4C97A0()
{
  return sub_21E4CED4C(&qword_267D32420, (uint64_t)qword_267D35B30);
}

uint64_t sub_21E4C97C4@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32420, (uint64_t)qword_267D35B30, a1);
}

uint64_t sub_21E4C97E8(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35B48);
}

uint64_t sub_21E4C9810()
{
  return sub_21E4CED4C(&qword_267D32428, (uint64_t)qword_267D35B48);
}

uint64_t sub_21E4C9834@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32428, (uint64_t)qword_267D35B48, a1);
}

uint64_t sub_21E4C9858(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35B60);
}

uint64_t sub_21E4C9880()
{
  return sub_21E4CED4C(&qword_267D32430, (uint64_t)qword_267D35B60);
}

uint64_t sub_21E4C98A4@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32430, (uint64_t)qword_267D35B60, a1);
}

uint64_t sub_21E4C98C8(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35B78);
}

uint64_t sub_21E4C98EC()
{
  return sub_21E4CED4C(&qword_267D32438, (uint64_t)qword_267D35B78);
}

uint64_t sub_21E4C9910@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32438, (uint64_t)qword_267D35B78, a1);
}

uint64_t sub_21E4C9934(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35B90);
}

uint64_t sub_21E4C9958()
{
  return sub_21E4CED4C(&qword_267D32440, (uint64_t)qword_267D35B90);
}

uint64_t sub_21E4C997C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32440, (uint64_t)qword_267D35B90, a1);
}

uint64_t sub_21E4C99A0(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35BA8);
}

uint64_t sub_21E4C99C4()
{
  return sub_21E4CED4C(&qword_267D32448, (uint64_t)qword_267D35BA8);
}

uint64_t sub_21E4C99E8@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32448, (uint64_t)qword_267D35BA8, a1);
}

uint64_t sub_21E4C9A0C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35BC0);
}

uint64_t sub_21E4C9A30()
{
  return sub_21E4CED4C(&qword_267D32450, (uint64_t)qword_267D35BC0);
}

uint64_t sub_21E4C9A54@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32450, (uint64_t)qword_267D35BC0, a1);
}

uint64_t sub_21E4C9A78(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35BD8);
}

uint64_t sub_21E4C9A9C()
{
  return sub_21E4CED4C(&qword_267D32458, (uint64_t)qword_267D35BD8);
}

uint64_t sub_21E4C9AC0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32458, (uint64_t)qword_267D35BD8, a1);
}

uint64_t sub_21E4C9AE4(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35BF0);
}

uint64_t sub_21E4C9B04()
{
  return sub_21E4CED4C(&qword_267D32460, (uint64_t)qword_267D35BF0);
}

uint64_t sub_21E4C9B28@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32460, (uint64_t)qword_267D35BF0, a1);
}

uint64_t sub_21E4C9B4C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35C08);
}

uint64_t sub_21E4C9B78()
{
  return sub_21E4CED4C(&qword_267D32468, (uint64_t)qword_267D35C08);
}

uint64_t sub_21E4C9B9C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32468, (uint64_t)qword_267D35C08, a1);
}

uint64_t sub_21E4C9BC0(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35C20);
}

uint64_t sub_21E4C9BE4()
{
  return sub_21E4CED4C(&qword_267D32470, (uint64_t)qword_267D35C20);
}

uint64_t sub_21E4C9C08@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32470, (uint64_t)qword_267D35C20, a1);
}

uint64_t sub_21E4C9C2C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35C38);
}

uint64_t sub_21E4C9C58()
{
  return sub_21E4CED4C(&qword_267D32478, (uint64_t)qword_267D35C38);
}

uint64_t sub_21E4C9C7C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32478, (uint64_t)qword_267D35C38, a1);
}

uint64_t sub_21E4C9CA0(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35C50);
}

uint64_t sub_21E4C9CCC()
{
  return sub_21E4CED4C(&qword_267D32480, (uint64_t)qword_267D35C50);
}

uint64_t sub_21E4C9CF0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32480, (uint64_t)qword_267D35C50, a1);
}

uint64_t sub_21E4C9D14(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35C68);
}

uint64_t sub_21E4C9D40()
{
  return sub_21E4CED4C(&qword_267D32488, (uint64_t)qword_267D35C68);
}

uint64_t sub_21E4C9D64@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32488, (uint64_t)qword_267D35C68, a1);
}

uint64_t sub_21E4C9D88(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35C80);
}

uint64_t sub_21E4C9DAC()
{
  return sub_21E4CED4C(&qword_267D32490, (uint64_t)qword_267D35C80);
}

uint64_t sub_21E4C9DD0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32490, (uint64_t)qword_267D35C80, a1);
}

uint64_t sub_21E4C9DF4(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35C98);
}

uint64_t sub_21E4C9E20()
{
  return sub_21E4CED4C(&qword_267D32498, (uint64_t)qword_267D35C98);
}

uint64_t sub_21E4C9E44@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32498, (uint64_t)qword_267D35C98, a1);
}

uint64_t sub_21E4C9E68(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35CB0);
}

uint64_t sub_21E4C9E8C()
{
  return sub_21E4CED4C(&qword_267D324A0, (uint64_t)qword_267D35CB0);
}

uint64_t sub_21E4C9EB0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D324A0, (uint64_t)qword_267D35CB0, a1);
}

uint64_t sub_21E4C9ED4(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35CC8);
}

uint64_t sub_21E4C9EF0()
{
  return sub_21E4CED4C(&qword_267D324A8, (uint64_t)qword_267D35CC8);
}

uint64_t sub_21E4C9F14@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D324A8, (uint64_t)qword_267D35CC8, a1);
}

uint64_t sub_21E4C9F38(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35CE0);
}

uint64_t sub_21E4C9F60()
{
  return sub_21E4CED4C(&qword_267D324B0, (uint64_t)qword_267D35CE0);
}

uint64_t sub_21E4C9F84@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D324B0, (uint64_t)qword_267D35CE0, a1);
}

uint64_t sub_21E4C9FA8(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35CF8);
}

uint64_t sub_21E4C9FCC()
{
  return sub_21E4CED4C(&qword_267D324B8, (uint64_t)qword_267D35CF8);
}

uint64_t sub_21E4C9FF0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D324B8, (uint64_t)qword_267D35CF8, a1);
}

uint64_t sub_21E4CA014(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35D10);
}

uint64_t sub_21E4CA03C()
{
  return sub_21E4CED4C(&qword_267D324C0, (uint64_t)qword_267D35D10);
}

uint64_t sub_21E4CA060@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D324C0, (uint64_t)qword_267D35D10, a1);
}

uint64_t sub_21E4CA084(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35D28);
}

uint64_t sub_21E4CA0AC()
{
  return sub_21E4CED4C(&qword_267D324C8, (uint64_t)qword_267D35D28);
}

uint64_t sub_21E4CA0D0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D324C8, (uint64_t)qword_267D35D28, a1);
}

uint64_t sub_21E4CA0F4(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35D40);
}

uint64_t sub_21E4CA11C()
{
  return sub_21E4CED4C(&qword_267D324D0, (uint64_t)qword_267D35D40);
}

uint64_t sub_21E4CA140@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D324D0, (uint64_t)qword_267D35D40, a1);
}

uint64_t sub_21E4CA164(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35D58);
}

uint64_t sub_21E4CA180()
{
  return sub_21E4CED4C(&qword_267D324D8, (uint64_t)qword_267D35D58);
}

uint64_t sub_21E4CA1A4@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D324D8, (uint64_t)qword_267D35D58, a1);
}

uint64_t sub_21E4CA1C8(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35D70);
}

uint64_t sub_21E4CA1F0()
{
  return sub_21E4CED4C(&qword_267D324E0, (uint64_t)qword_267D35D70);
}

uint64_t sub_21E4CA214@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D324E0, (uint64_t)qword_267D35D70, a1);
}

uint64_t sub_21E4CA238(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35D88);
}

uint64_t sub_21E4CA25C()
{
  return sub_21E4CED4C(&qword_267D324E8, (uint64_t)qword_267D35D88);
}

uint64_t sub_21E4CA280@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D324E8, (uint64_t)qword_267D35D88, a1);
}

uint64_t sub_21E4CA2A4(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35DA0);
}

uint64_t sub_21E4CA2CC()
{
  return sub_21E4CED4C(&qword_267D324F0, (uint64_t)qword_267D35DA0);
}

uint64_t sub_21E4CA2F0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D324F0, (uint64_t)qword_267D35DA0, a1);
}

uint64_t sub_21E4CA314(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35DB8);
}

uint64_t sub_21E4CA33C()
{
  return sub_21E4CED4C(&qword_267D324F8, (uint64_t)qword_267D35DB8);
}

uint64_t sub_21E4CA360@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D324F8, (uint64_t)qword_267D35DB8, a1);
}

uint64_t sub_21E4CA384(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35DD0);
}

uint64_t sub_21E4CA3AC()
{
  return sub_21E4CED4C(&qword_267D32500, (uint64_t)qword_267D35DD0);
}

uint64_t sub_21E4CA3D0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32500, (uint64_t)qword_267D35DD0, a1);
}

uint64_t sub_21E4CA3F4(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35DE8);
}

uint64_t sub_21E4CA41C()
{
  return sub_21E4CED4C(&qword_267D32508, (uint64_t)qword_267D35DE8);
}

uint64_t sub_21E4CA440@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32508, (uint64_t)qword_267D35DE8, a1);
}

uint64_t sub_21E4CA464(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35E00);
}

uint64_t sub_21E4CA488()
{
  return sub_21E4CED4C(&qword_267D32510, (uint64_t)qword_267D35E00);
}

uint64_t sub_21E4CA4AC@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32510, (uint64_t)qword_267D35E00, a1);
}

uint64_t sub_21E4CA4D0(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35E18);
}

uint64_t sub_21E4CA4F4()
{
  return sub_21E4CED4C(&qword_267D32518, (uint64_t)qword_267D35E18);
}

uint64_t sub_21E4CA518@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32518, (uint64_t)qword_267D35E18, a1);
}

uint64_t sub_21E4CA53C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35E30);
}

uint64_t sub_21E4CA560()
{
  return sub_21E4CED4C(&qword_267D32520, (uint64_t)qword_267D35E30);
}

uint64_t sub_21E4CA584@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32520, (uint64_t)qword_267D35E30, a1);
}

uint64_t sub_21E4CA5A8(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35E48);
}

uint64_t sub_21E4CA5CC()
{
  return sub_21E4CED4C(&qword_267D32528, (uint64_t)qword_267D35E48);
}

uint64_t sub_21E4CA5F0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32528, (uint64_t)qword_267D35E48, a1);
}

uint64_t sub_21E4CA614(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35E60);
}

uint64_t sub_21E4CA638()
{
  return sub_21E4CED4C(&qword_267D32530, (uint64_t)qword_267D35E60);
}

uint64_t sub_21E4CA65C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32530, (uint64_t)qword_267D35E60, a1);
}

uint64_t sub_21E4CA680(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35E78);
}

uint64_t sub_21E4CA6A4()
{
  return sub_21E4CED4C(&qword_267D32538, (uint64_t)qword_267D35E78);
}

uint64_t sub_21E4CA6C8@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32538, (uint64_t)qword_267D35E78, a1);
}

uint64_t sub_21E4CA6EC(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35E90);
}

uint64_t sub_21E4CA710()
{
  return sub_21E4CED4C(&qword_267D32540, (uint64_t)qword_267D35E90);
}

uint64_t sub_21E4CA734@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32540, (uint64_t)qword_267D35E90, a1);
}

uint64_t sub_21E4CA758(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35EA8);
}

uint64_t sub_21E4CA77C()
{
  return sub_21E4CED4C(&qword_267D32548, (uint64_t)qword_267D35EA8);
}

uint64_t sub_21E4CA7A0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32548, (uint64_t)qword_267D35EA8, a1);
}

uint64_t sub_21E4CA7C4(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35EC0);
}

uint64_t sub_21E4CA7E8()
{
  return sub_21E4CED4C(&qword_267D32550, (uint64_t)qword_267D35EC0);
}

uint64_t sub_21E4CA80C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32550, (uint64_t)qword_267D35EC0, a1);
}

uint64_t sub_21E4CA830(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35ED8);
}

uint64_t sub_21E4CA854()
{
  return sub_21E4CED4C(&qword_267D32558, (uint64_t)qword_267D35ED8);
}

uint64_t sub_21E4CA878@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32558, (uint64_t)qword_267D35ED8, a1);
}

uint64_t sub_21E4CA89C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35EF0);
}

uint64_t sub_21E4CA8C0()
{
  return sub_21E4CED4C(&qword_267D32560, (uint64_t)qword_267D35EF0);
}

uint64_t sub_21E4CA8E4@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32560, (uint64_t)qword_267D35EF0, a1);
}

uint64_t sub_21E4CA908(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35F08);
}

uint64_t sub_21E4CA92C()
{
  return sub_21E4CED4C(&qword_267D32568, (uint64_t)qword_267D35F08);
}

uint64_t sub_21E4CA950@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32568, (uint64_t)qword_267D35F08, a1);
}

uint64_t sub_21E4CA974(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35F20);
}

uint64_t sub_21E4CA9A0()
{
  return sub_21E4CED4C(&qword_267D32570, (uint64_t)qword_267D35F20);
}

uint64_t sub_21E4CA9C4@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32570, (uint64_t)qword_267D35F20, a1);
}

uint64_t sub_21E4CA9E8(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35F38);
}

uint64_t sub_21E4CAA0C()
{
  return sub_21E4CED4C(&qword_267D32578, (uint64_t)qword_267D35F38);
}

uint64_t sub_21E4CAA30@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32578, (uint64_t)qword_267D35F38, a1);
}

uint64_t sub_21E4CAA54(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35F50);
}

uint64_t sub_21E4CAA78()
{
  return sub_21E4CED4C(&qword_267D32580, (uint64_t)qword_267D35F50);
}

uint64_t sub_21E4CAA9C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32580, (uint64_t)qword_267D35F50, a1);
}

uint64_t sub_21E4CAAC0(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35F68);
}

uint64_t sub_21E4CAAE4()
{
  return sub_21E4CED4C(&qword_267D32588, (uint64_t)qword_267D35F68);
}

uint64_t sub_21E4CAB08@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32588, (uint64_t)qword_267D35F68, a1);
}

uint64_t sub_21E4CAB2C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35F80);
}

uint64_t sub_21E4CAB50()
{
  return sub_21E4CED4C(&qword_267D32590, (uint64_t)qword_267D35F80);
}

uint64_t sub_21E4CAB74@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32590, (uint64_t)qword_267D35F80, a1);
}

uint64_t sub_21E4CAB98(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35F98);
}

uint64_t sub_21E4CABBC()
{
  return sub_21E4CED4C(&qword_267D32598, (uint64_t)qword_267D35F98);
}

uint64_t sub_21E4CABE0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32598, (uint64_t)qword_267D35F98, a1);
}

uint64_t sub_21E4CAC04(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35FB0);
}

uint64_t sub_21E4CAC24()
{
  return sub_21E4CED4C(&qword_267D325A0, (uint64_t)qword_267D35FB0);
}

uint64_t sub_21E4CAC48@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D325A0, (uint64_t)qword_267D35FB0, a1);
}

uint64_t sub_21E4CAC6C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35FC8);
}

uint64_t sub_21E4CAC98()
{
  return sub_21E4CED4C(&qword_267D325A8, (uint64_t)qword_267D35FC8);
}

uint64_t sub_21E4CACBC@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D325A8, (uint64_t)qword_267D35FC8, a1);
}

uint64_t sub_21E4CACE0(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35FE0);
}

uint64_t sub_21E4CAD04()
{
  return sub_21E4CED4C(&qword_267D325B0, (uint64_t)qword_267D35FE0);
}

uint64_t sub_21E4CAD28@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D325B0, (uint64_t)qword_267D35FE0, a1);
}

uint64_t sub_21E4CAD4C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D35FF8);
}

uint64_t sub_21E4CAD74()
{
  return sub_21E4CED4C(&qword_267D325B8, (uint64_t)qword_267D35FF8);
}

uint64_t sub_21E4CAD98@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D325B8, (uint64_t)qword_267D35FF8, a1);
}

uint64_t sub_21E4CADBC(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36010);
}

uint64_t sub_21E4CADE4()
{
  return sub_21E4CED4C(&qword_267D325C0, (uint64_t)qword_267D36010);
}

uint64_t sub_21E4CAE08@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D325C0, (uint64_t)qword_267D36010, a1);
}

uint64_t sub_21E4CAE2C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36028);
}

uint64_t sub_21E4CAE54()
{
  return sub_21E4CED4C(&qword_267D325C8, (uint64_t)qword_267D36028);
}

uint64_t sub_21E4CAE78@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D325C8, (uint64_t)qword_267D36028, a1);
}

uint64_t sub_21E4CAE9C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36040);
}

uint64_t sub_21E4CAEC4()
{
  return sub_21E4CED4C(&qword_267D325D0, (uint64_t)qword_267D36040);
}

uint64_t sub_21E4CAEE8@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D325D0, (uint64_t)qword_267D36040, a1);
}

uint64_t sub_21E4CAF0C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36058);
}

uint64_t sub_21E4CAF30()
{
  return sub_21E4CED4C(&qword_267D325D8, (uint64_t)qword_267D36058);
}

uint64_t sub_21E4CAF54@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D325D8, (uint64_t)qword_267D36058, a1);
}

uint64_t sub_21E4CAF78(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36070);
}

uint64_t sub_21E4CAF9C()
{
  return sub_21E4CED4C(&qword_267D325E0, (uint64_t)qword_267D36070);
}

uint64_t sub_21E4CAFC0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D325E0, (uint64_t)qword_267D36070, a1);
}

uint64_t sub_21E4CAFE4(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36088);
}

uint64_t sub_21E4CB008()
{
  return sub_21E4CED4C(&qword_267D325E8, (uint64_t)qword_267D36088);
}

uint64_t sub_21E4CB02C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D325E8, (uint64_t)qword_267D36088, a1);
}

uint64_t sub_21E4CB050(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D360A0);
}

uint64_t sub_21E4CB074()
{
  return sub_21E4CED4C(&qword_267D325F0, (uint64_t)qword_267D360A0);
}

uint64_t sub_21E4CB098@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D325F0, (uint64_t)qword_267D360A0, a1);
}

uint64_t sub_21E4CB0BC(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D360B8);
}

uint64_t sub_21E4CB0E0()
{
  return sub_21E4CED4C(&qword_267D325F8, (uint64_t)qword_267D360B8);
}

uint64_t sub_21E4CB104@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D325F8, (uint64_t)qword_267D360B8, a1);
}

uint64_t sub_21E4CB128(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D360D0);
}

uint64_t sub_21E4CB148()
{
  return sub_21E4CED4C(&qword_267D32600, (uint64_t)qword_267D360D0);
}

uint64_t sub_21E4CB16C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32600, (uint64_t)qword_267D360D0, a1);
}

uint64_t sub_21E4CB190(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D360E8);
}

uint64_t sub_21E4CB1BC()
{
  return sub_21E4CED4C(&qword_267D32608, (uint64_t)qword_267D360E8);
}

uint64_t sub_21E4CB1E0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32608, (uint64_t)qword_267D360E8, a1);
}

uint64_t sub_21E4CB204(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36100);
}

uint64_t sub_21E4CB230()
{
  return sub_21E4CED4C(&qword_267D32610, (uint64_t)qword_267D36100);
}

uint64_t sub_21E4CB254@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32610, (uint64_t)qword_267D36100, a1);
}

uint64_t sub_21E4CB278(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36118);
}

uint64_t sub_21E4CB29C()
{
  return sub_21E4CED4C(&qword_267D32618, (uint64_t)qword_267D36118);
}

uint64_t sub_21E4CB2C0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32618, (uint64_t)qword_267D36118, a1);
}

uint64_t sub_21E4CB2E4(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36130);
}

uint64_t sub_21E4CB30C()
{
  return sub_21E4CED4C(&qword_267D32620, (uint64_t)qword_267D36130);
}

uint64_t sub_21E4CB330@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32620, (uint64_t)qword_267D36130, a1);
}

uint64_t sub_21E4CB354(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36148);
}

uint64_t sub_21E4CB37C()
{
  return sub_21E4CED4C(&qword_267D32628, (uint64_t)qword_267D36148);
}

uint64_t sub_21E4CB3A0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32628, (uint64_t)qword_267D36148, a1);
}

uint64_t sub_21E4CB3C4(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36160);
}

uint64_t sub_21E4CB3EC()
{
  return sub_21E4CED4C(&qword_267D32630, (uint64_t)qword_267D36160);
}

uint64_t sub_21E4CB410@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32630, (uint64_t)qword_267D36160, a1);
}

uint64_t sub_21E4CB434(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36178);
}

uint64_t sub_21E4CB460()
{
  return sub_21E4CED4C(&qword_267D32638, (uint64_t)qword_267D36178);
}

uint64_t sub_21E4CB484@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32638, (uint64_t)qword_267D36178, a1);
}

uint64_t sub_21E4CB4A8(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36190);
}

uint64_t sub_21E4CB4D0()
{
  return sub_21E4CED4C(&qword_267D32640, (uint64_t)qword_267D36190);
}

uint64_t sub_21E4CB4F4@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32640, (uint64_t)qword_267D36190, a1);
}

uint64_t sub_21E4CB518(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D361A8);
}

uint64_t sub_21E4CB540()
{
  return sub_21E4CED4C(&qword_267D32648, (uint64_t)qword_267D361A8);
}

uint64_t sub_21E4CB564@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32648, (uint64_t)qword_267D361A8, a1);
}

uint64_t sub_21E4CB588(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D361C0);
}

uint64_t sub_21E4CB5B4()
{
  return sub_21E4CED4C(&qword_267D32650, (uint64_t)qword_267D361C0);
}

uint64_t sub_21E4CB5D8@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32650, (uint64_t)qword_267D361C0, a1);
}

uint64_t sub_21E4CB5FC(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D361D8);
}

uint64_t sub_21E4CB624()
{
  return sub_21E4CED4C(&qword_267D32658, (uint64_t)qword_267D361D8);
}

uint64_t sub_21E4CB648@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32658, (uint64_t)qword_267D361D8, a1);
}

uint64_t sub_21E4CB66C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D361F0);
}

uint64_t sub_21E4CB698()
{
  return sub_21E4CED4C(&qword_267D32660, (uint64_t)qword_267D361F0);
}

uint64_t sub_21E4CB6BC@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32660, (uint64_t)qword_267D361F0, a1);
}

uint64_t sub_21E4CB6E0(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36208);
}

uint64_t sub_21E4CB700()
{
  return sub_21E4CED4C(&qword_267D32668, (uint64_t)qword_267D36208);
}

uint64_t sub_21E4CB724@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32668, (uint64_t)qword_267D36208, a1);
}

uint64_t sub_21E4CB748(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36220);
}

uint64_t sub_21E4CB774()
{
  return sub_21E4CED4C(&qword_267D32670, (uint64_t)qword_267D36220);
}

uint64_t sub_21E4CB798@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32670, (uint64_t)qword_267D36220, a1);
}

uint64_t sub_21E4CB7BC(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36238);
}

uint64_t sub_21E4CB7E8()
{
  return sub_21E4CED4C(&qword_267D32678, (uint64_t)qword_267D36238);
}

uint64_t sub_21E4CB80C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32678, (uint64_t)qword_267D36238, a1);
}

uint64_t sub_21E4CB830(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36250);
}

uint64_t sub_21E4CB854()
{
  return sub_21E4CED4C(&qword_267D32680, (uint64_t)qword_267D36250);
}

uint64_t sub_21E4CB878@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32680, (uint64_t)qword_267D36250, a1);
}

uint64_t sub_21E4CB89C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36268);
}

uint64_t sub_21E4CB8C4()
{
  return sub_21E4CED4C(&qword_267D32688, (uint64_t)qword_267D36268);
}

uint64_t sub_21E4CB8E8@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32688, (uint64_t)qword_267D36268, a1);
}

uint64_t sub_21E4CB90C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36280);
}

uint64_t sub_21E4CB934()
{
  return sub_21E4CED4C(&qword_267D32690, (uint64_t)qword_267D36280);
}

uint64_t sub_21E4CB958@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32690, (uint64_t)qword_267D36280, a1);
}

uint64_t sub_21E4CB97C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36298);
}

uint64_t sub_21E4CB9A4()
{
  return sub_21E4CED4C(&qword_267D32698, (uint64_t)qword_267D36298);
}

uint64_t sub_21E4CB9C8@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32698, (uint64_t)qword_267D36298, a1);
}

uint64_t sub_21E4CB9EC(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D362B0);
}

uint64_t sub_21E4CBA18()
{
  return sub_21E4CED4C(&qword_267D326A0, (uint64_t)qword_267D362B0);
}

uint64_t sub_21E4CBA3C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D326A0, (uint64_t)qword_267D362B0, a1);
}

uint64_t sub_21E4CBA60(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D362C8);
}

uint64_t sub_21E4CBA88()
{
  return sub_21E4CED4C(&qword_267D326A8, (uint64_t)qword_267D362C8);
}

uint64_t sub_21E4CBAAC@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D326A8, (uint64_t)qword_267D362C8, a1);
}

uint64_t sub_21E4CBAD0(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D362E0);
}

uint64_t sub_21E4CBAF8()
{
  return sub_21E4CED4C(&qword_267D326B0, (uint64_t)qword_267D362E0);
}

uint64_t sub_21E4CBB1C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D326B0, (uint64_t)qword_267D362E0, a1);
}

uint64_t sub_21E4CBB40(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D362F8);
}

uint64_t sub_21E4CBB6C()
{
  return sub_21E4CED4C(&qword_267D326B8, (uint64_t)qword_267D362F8);
}

uint64_t sub_21E4CBB90@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D326B8, (uint64_t)qword_267D362F8, a1);
}

uint64_t sub_21E4CBBB4(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36310);
}

uint64_t sub_21E4CBBDC()
{
  return sub_21E4CED4C(&qword_267D326C0, (uint64_t)qword_267D36310);
}

uint64_t sub_21E4CBC00@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D326C0, (uint64_t)qword_267D36310, a1);
}

uint64_t sub_21E4CBC24(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36328);
}

uint64_t sub_21E4CBC50()
{
  return sub_21E4CED4C(&qword_267D326C8, (uint64_t)qword_267D36328);
}

uint64_t sub_21E4CBC74@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D326C8, (uint64_t)qword_267D36328, a1);
}

uint64_t sub_21E4CBC98(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36340);
}

uint64_t sub_21E4CBCC0()
{
  return sub_21E4CED4C(&qword_267D326D0, (uint64_t)qword_267D36340);
}

uint64_t sub_21E4CBCE4@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D326D0, (uint64_t)qword_267D36340, a1);
}

uint64_t sub_21E4CBD08(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36358);
}

uint64_t sub_21E4CBD2C()
{
  return sub_21E4CED4C(&qword_267D326D8, (uint64_t)qword_267D36358);
}

uint64_t sub_21E4CBD50@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D326D8, (uint64_t)qword_267D36358, a1);
}

uint64_t sub_21E4CBD74(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36370);
}

uint64_t sub_21E4CBD98()
{
  return sub_21E4CED4C(&qword_267D326E0, (uint64_t)qword_267D36370);
}

uint64_t sub_21E4CBDBC@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D326E0, (uint64_t)qword_267D36370, a1);
}

uint64_t sub_21E4CBDE0(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36388);
}

uint64_t sub_21E4CBE04()
{
  return sub_21E4CED4C(&qword_267D326E8, (uint64_t)qword_267D36388);
}

uint64_t sub_21E4CBE28@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D326E8, (uint64_t)qword_267D36388, a1);
}

uint64_t sub_21E4CBE4C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D363A0);
}

uint64_t sub_21E4CBE70()
{
  return sub_21E4CED4C(&qword_267D326F0, (uint64_t)qword_267D363A0);
}

uint64_t sub_21E4CBE94@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D326F0, (uint64_t)qword_267D363A0, a1);
}

uint64_t sub_21E4CBEB8(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D363B8);
}

uint64_t sub_21E4CBEDC()
{
  return sub_21E4CED4C(&qword_267D326F8, (uint64_t)qword_267D363B8);
}

uint64_t sub_21E4CBF00@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D326F8, (uint64_t)qword_267D363B8, a1);
}

uint64_t sub_21E4CBF24(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D363D0);
}

uint64_t sub_21E4CBF44()
{
  return sub_21E4CED4C(&qword_267D32700, (uint64_t)qword_267D363D0);
}

uint64_t sub_21E4CBF68@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32700, (uint64_t)qword_267D363D0, a1);
}

uint64_t sub_21E4CBF8C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D363E8);
}

uint64_t sub_21E4CBFB4()
{
  return sub_21E4CED4C(&qword_267D32708, (uint64_t)qword_267D363E8);
}

uint64_t sub_21E4CBFD8@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32708, (uint64_t)qword_267D363E8, a1);
}

uint64_t sub_21E4CBFFC(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36400);
}

uint64_t sub_21E4CC028()
{
  return sub_21E4CED4C(&qword_267D32710, (uint64_t)qword_267D36400);
}

uint64_t sub_21E4CC04C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32710, (uint64_t)qword_267D36400, a1);
}

uint64_t sub_21E4CC070(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36418);
}

uint64_t sub_21E4CC094()
{
  return sub_21E4CED4C(&qword_267D32718, (uint64_t)qword_267D36418);
}

uint64_t sub_21E4CC0B8@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32718, (uint64_t)qword_267D36418, a1);
}

uint64_t sub_21E4CC0DC(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36430);
}

uint64_t sub_21E4CC104()
{
  return sub_21E4CED4C(&qword_267D32720, (uint64_t)qword_267D36430);
}

uint64_t sub_21E4CC128@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32720, (uint64_t)qword_267D36430, a1);
}

uint64_t sub_21E4CC14C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36448);
}

uint64_t sub_21E4CC174()
{
  return sub_21E4CED4C(&qword_267D32728, (uint64_t)qword_267D36448);
}

uint64_t sub_21E4CC198@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32728, (uint64_t)qword_267D36448, a1);
}

uint64_t sub_21E4CC1BC(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36460);
}

uint64_t sub_21E4CC1E4()
{
  return sub_21E4CED4C(&qword_267D32730, (uint64_t)qword_267D36460);
}

uint64_t sub_21E4CC208@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32730, (uint64_t)qword_267D36460, a1);
}

uint64_t sub_21E4CC22C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36478);
}

uint64_t sub_21E4CC254()
{
  return sub_21E4CED4C(&qword_267D32738, (uint64_t)qword_267D36478);
}

uint64_t sub_21E4CC278@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32738, (uint64_t)qword_267D36478, a1);
}

uint64_t sub_21E4CC29C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36490);
}

uint64_t sub_21E4CC2C4()
{
  return sub_21E4CED4C(&qword_267D32740, (uint64_t)qword_267D36490);
}

uint64_t sub_21E4CC2E8@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32740, (uint64_t)qword_267D36490, a1);
}

uint64_t sub_21E4CC30C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D364A8);
}

uint64_t sub_21E4CC334()
{
  return sub_21E4CED4C(&qword_267D32748, (uint64_t)qword_267D364A8);
}

uint64_t sub_21E4CC358@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32748, (uint64_t)qword_267D364A8, a1);
}

uint64_t sub_21E4CC37C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D364C0);
}

uint64_t sub_21E4CC3A4()
{
  return sub_21E4CED4C(&qword_267D32750, (uint64_t)qword_267D364C0);
}

uint64_t sub_21E4CC3C8@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32750, (uint64_t)qword_267D364C0, a1);
}

uint64_t sub_21E4CC3EC(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D364D8);
}

uint64_t sub_21E4CC414()
{
  return sub_21E4CED4C(&qword_267D32758, (uint64_t)qword_267D364D8);
}

uint64_t sub_21E4CC438@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32758, (uint64_t)qword_267D364D8, a1);
}

uint64_t sub_21E4CC45C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D364F0);
}

uint64_t sub_21E4CC484()
{
  return sub_21E4CED4C(&qword_267D32760, (uint64_t)qword_267D364F0);
}

uint64_t sub_21E4CC4A8@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32760, (uint64_t)qword_267D364F0, a1);
}

uint64_t sub_21E4CC4CC(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36508);
}

uint64_t sub_21E4CC4E8()
{
  return sub_21E4CED4C(&qword_267D32768, (uint64_t)qword_267D36508);
}

uint64_t sub_21E4CC50C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32768, (uint64_t)qword_267D36508, a1);
}

uint64_t sub_21E4CC530(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36520);
}

uint64_t sub_21E4CC558()
{
  return sub_21E4CED4C(&qword_267D32770, (uint64_t)qword_267D36520);
}

uint64_t sub_21E4CC57C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32770, (uint64_t)qword_267D36520, a1);
}

uint64_t sub_21E4CC5A0(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36538);
}

uint64_t sub_21E4CC5C4()
{
  return sub_21E4CED4C(&qword_267D32778, (uint64_t)qword_267D36538);
}

uint64_t sub_21E4CC5E8@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32778, (uint64_t)qword_267D36538, a1);
}

uint64_t sub_21E4CC60C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36550);
}

uint64_t sub_21E4CC634()
{
  return sub_21E4CED4C(&qword_267D32780, (uint64_t)qword_267D36550);
}

uint64_t sub_21E4CC658@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32780, (uint64_t)qword_267D36550, a1);
}

uint64_t sub_21E4CC67C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36568);
}

uint64_t sub_21E4CC6A4()
{
  return sub_21E4CED4C(&qword_267D32788, (uint64_t)qword_267D36568);
}

uint64_t sub_21E4CC6C8@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32788, (uint64_t)qword_267D36568, a1);
}

uint64_t sub_21E4CC6EC(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36580);
}

uint64_t sub_21E4CC714()
{
  return sub_21E4CED4C(&qword_267D32790, (uint64_t)qword_267D36580);
}

uint64_t sub_21E4CC738@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32790, (uint64_t)qword_267D36580, a1);
}

uint64_t sub_21E4CC75C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36598);
}

uint64_t sub_21E4CC788()
{
  return sub_21E4CED4C(&qword_267D32798, (uint64_t)qword_267D36598);
}

uint64_t sub_21E4CC7AC@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32798, (uint64_t)qword_267D36598, a1);
}

uint64_t sub_21E4CC7D0(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D365B0);
}

uint64_t sub_21E4CC7F4()
{
  return sub_21E4CED4C(&qword_267D327A0, (uint64_t)qword_267D365B0);
}

uint64_t sub_21E4CC818@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D327A0, (uint64_t)qword_267D365B0, a1);
}

uint64_t sub_21E4CC83C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D365C8);
}

uint64_t sub_21E4CC860()
{
  return sub_21E4CED4C(&qword_267D327A8, (uint64_t)qword_267D365C8);
}

uint64_t sub_21E4CC884@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D327A8, (uint64_t)qword_267D365C8, a1);
}

uint64_t sub_21E4CC8A8(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D365E0);
}

uint64_t sub_21E4CC8CC()
{
  return sub_21E4CED4C(&qword_267D327B0, (uint64_t)qword_267D365E0);
}

uint64_t sub_21E4CC8F0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D327B0, (uint64_t)qword_267D365E0, a1);
}

uint64_t sub_21E4CC914(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D365F8);
}

uint64_t sub_21E4CC938()
{
  return sub_21E4CED4C(&qword_267D327B8, (uint64_t)qword_267D365F8);
}

uint64_t sub_21E4CC95C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D327B8, (uint64_t)qword_267D365F8, a1);
}

uint64_t sub_21E4CC980(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36610);
}

uint64_t sub_21E4CC9A4()
{
  return sub_21E4CED4C(&qword_267D327C0, (uint64_t)qword_267D36610);
}

uint64_t sub_21E4CC9C8@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D327C0, (uint64_t)qword_267D36610, a1);
}

uint64_t sub_21E4CC9EC(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36628);
}

uint64_t sub_21E4CCA10()
{
  return sub_21E4CED4C(&qword_267D327C8, (uint64_t)qword_267D36628);
}

uint64_t sub_21E4CCA34@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D327C8, (uint64_t)qword_267D36628, a1);
}

uint64_t sub_21E4CCA58(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36640);
}

uint64_t sub_21E4CCA7C()
{
  return sub_21E4CED4C(&qword_267D327D0, (uint64_t)qword_267D36640);
}

uint64_t sub_21E4CCAA0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D327D0, (uint64_t)qword_267D36640, a1);
}

uint64_t sub_21E4CCAC4(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36658);
}

uint64_t sub_21E4CCAE8()
{
  return sub_21E4CED4C(&qword_267D327D8, (uint64_t)qword_267D36658);
}

uint64_t sub_21E4CCB0C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D327D8, (uint64_t)qword_267D36658, a1);
}

uint64_t sub_21E4CCB30(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36670);
}

uint64_t sub_21E4CCB54()
{
  return sub_21E4CED4C(&qword_267D327E0, (uint64_t)qword_267D36670);
}

uint64_t sub_21E4CCB78@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D327E0, (uint64_t)qword_267D36670, a1);
}

uint64_t sub_21E4CCB9C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36688);
}

uint64_t sub_21E4CCBC0()
{
  return sub_21E4CED4C(&qword_267D327E8, (uint64_t)qword_267D36688);
}

uint64_t sub_21E4CCBE4@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D327E8, (uint64_t)qword_267D36688, a1);
}

uint64_t sub_21E4CCC08(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D366A0);
}

uint64_t sub_21E4CCC2C()
{
  return sub_21E4CED4C(&qword_267D327F0, (uint64_t)qword_267D366A0);
}

uint64_t sub_21E4CCC50@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D327F0, (uint64_t)qword_267D366A0, a1);
}

uint64_t sub_21E4CCC74(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D366B8);
}

uint64_t sub_21E4CCC98()
{
  return sub_21E4CED4C(&qword_267D327F8, (uint64_t)qword_267D366B8);
}

uint64_t sub_21E4CCCBC@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D327F8, (uint64_t)qword_267D366B8, a1);
}

uint64_t sub_21E4CCCE0(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D366D0);
}

uint64_t sub_21E4CCD04()
{
  return sub_21E4CED4C(&qword_267D32800, (uint64_t)qword_267D366D0);
}

uint64_t sub_21E4CCD28@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32800, (uint64_t)qword_267D366D0, a1);
}

uint64_t sub_21E4CCD4C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D366E8);
}

uint64_t sub_21E4CCD70()
{
  return sub_21E4CED4C(&qword_267D32808, (uint64_t)qword_267D366E8);
}

uint64_t sub_21E4CCD94@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32808, (uint64_t)qword_267D366E8, a1);
}

uint64_t sub_21E4CCDB8(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36700);
}

uint64_t sub_21E4CCDDC()
{
  return sub_21E4CED4C(&qword_267D32810, (uint64_t)qword_267D36700);
}

uint64_t sub_21E4CCE00@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32810, (uint64_t)qword_267D36700, a1);
}

uint64_t sub_21E4CCE24(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36718);
}

uint64_t sub_21E4CCE48()
{
  return sub_21E4CED4C(&qword_267D32818, (uint64_t)qword_267D36718);
}

uint64_t sub_21E4CCE6C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32818, (uint64_t)qword_267D36718, a1);
}

uint64_t sub_21E4CCE90(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36730);
}

uint64_t sub_21E4CCEB4()
{
  return sub_21E4CED4C(&qword_267D32820, (uint64_t)qword_267D36730);
}

uint64_t sub_21E4CCED8@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32820, (uint64_t)qword_267D36730, a1);
}

uint64_t sub_21E4CCEFC(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36748);
}

uint64_t sub_21E4CCF20()
{
  return sub_21E4CED4C(&qword_267D32828, (uint64_t)qword_267D36748);
}

uint64_t sub_21E4CCF44@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32828, (uint64_t)qword_267D36748, a1);
}

uint64_t sub_21E4CCF68(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36760);
}

uint64_t sub_21E4CCF8C()
{
  return sub_21E4CED4C(&qword_267D32830, (uint64_t)qword_267D36760);
}

uint64_t sub_21E4CCFB0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32830, (uint64_t)qword_267D36760, a1);
}

uint64_t sub_21E4CCFD4(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36778);
}

uint64_t sub_21E4CCFF8()
{
  return sub_21E4CED4C(&qword_267D32838, (uint64_t)qword_267D36778);
}

uint64_t sub_21E4CD01C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32838, (uint64_t)qword_267D36778, a1);
}

uint64_t sub_21E4CD040(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36790);
}

uint64_t sub_21E4CD06C()
{
  return sub_21E4CED4C(&qword_267D32840, (uint64_t)qword_267D36790);
}

uint64_t sub_21E4CD090@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32840, (uint64_t)qword_267D36790, a1);
}

uint64_t sub_21E4CD0B4(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D367A8);
}

uint64_t sub_21E4CD0E0()
{
  return sub_21E4CED4C(&qword_267D32848, (uint64_t)qword_267D367A8);
}

uint64_t sub_21E4CD104@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32848, (uint64_t)qword_267D367A8, a1);
}

uint64_t sub_21E4CD128(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D367C0);
}

uint64_t sub_21E4CD154()
{
  return sub_21E4CED4C(&qword_267D32850, (uint64_t)qword_267D367C0);
}

uint64_t sub_21E4CD178@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32850, (uint64_t)qword_267D367C0, a1);
}

uint64_t sub_21E4CD19C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D367D8);
}

uint64_t sub_21E4CD1C8()
{
  return sub_21E4CED4C(&qword_267D32858, (uint64_t)qword_267D367D8);
}

uint64_t sub_21E4CD1EC@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32858, (uint64_t)qword_267D367D8, a1);
}

uint64_t sub_21E4CD210(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D367F0);
}

uint64_t sub_21E4CD234()
{
  return sub_21E4CED4C(&qword_267D32860, (uint64_t)qword_267D367F0);
}

uint64_t sub_21E4CD258@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32860, (uint64_t)qword_267D367F0, a1);
}

uint64_t sub_21E4CD27C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36808);
}

uint64_t sub_21E4CD2A0()
{
  return sub_21E4CED4C(&qword_267D32868, (uint64_t)qword_267D36808);
}

uint64_t sub_21E4CD2C4@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32868, (uint64_t)qword_267D36808, a1);
}

uint64_t sub_21E4CD2E8(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36820);
}

uint64_t sub_21E4CD30C()
{
  return sub_21E4CED4C(&qword_267D32870, (uint64_t)qword_267D36820);
}

uint64_t sub_21E4CD330@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32870, (uint64_t)qword_267D36820, a1);
}

uint64_t sub_21E4CD354(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36838);
}

uint64_t sub_21E4CD378()
{
  return sub_21E4CED4C(&qword_267D32878, (uint64_t)qword_267D36838);
}

uint64_t sub_21E4CD39C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32878, (uint64_t)qword_267D36838, a1);
}

uint64_t sub_21E4CD3C0(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36850);
}

uint64_t sub_21E4CD3E4()
{
  return sub_21E4CED4C(&qword_267D32880, (uint64_t)qword_267D36850);
}

uint64_t sub_21E4CD408@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32880, (uint64_t)qword_267D36850, a1);
}

uint64_t sub_21E4CD42C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36868);
}

uint64_t sub_21E4CD450()
{
  return sub_21E4CED4C(&qword_267D32888, (uint64_t)qword_267D36868);
}

uint64_t sub_21E4CD474@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32888, (uint64_t)qword_267D36868, a1);
}

uint64_t sub_21E4CD498(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36880);
}

uint64_t sub_21E4CD4BC()
{
  return sub_21E4CED4C(&qword_267D32890, (uint64_t)qword_267D36880);
}

uint64_t sub_21E4CD4E0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32890, (uint64_t)qword_267D36880, a1);
}

uint64_t sub_21E4CD504(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36898);
}

uint64_t sub_21E4CD528()
{
  return sub_21E4CED4C(&qword_267D32898, (uint64_t)qword_267D36898);
}

uint64_t sub_21E4CD54C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32898, (uint64_t)qword_267D36898, a1);
}

uint64_t sub_21E4CD570(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D368B0);
}

uint64_t sub_21E4CD59C()
{
  return sub_21E4CED4C(&qword_267D328A0, (uint64_t)qword_267D368B0);
}

uint64_t sub_21E4CD5C0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D328A0, (uint64_t)qword_267D368B0, a1);
}

uint64_t sub_21E4CD5E4(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D368C8);
}

uint64_t sub_21E4CD610()
{
  return sub_21E4CED4C(&qword_267D328A8, (uint64_t)qword_267D368C8);
}

uint64_t sub_21E4CD634@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D328A8, (uint64_t)qword_267D368C8, a1);
}

uint64_t sub_21E4CD658(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D368E0);
}

uint64_t sub_21E4CD684()
{
  return sub_21E4CED4C(&qword_267D328B0, (uint64_t)qword_267D368E0);
}

uint64_t sub_21E4CD6A8@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D328B0, (uint64_t)qword_267D368E0, a1);
}

uint64_t sub_21E4CD6CC(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D368F8);
}

uint64_t sub_21E4CD6F4()
{
  return sub_21E4CED4C(&qword_267D328B8, (uint64_t)qword_267D368F8);
}

uint64_t sub_21E4CD718@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D328B8, (uint64_t)qword_267D368F8, a1);
}

uint64_t sub_21E4CD73C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36910);
}

uint64_t sub_21E4CD760()
{
  return sub_21E4CED4C(&qword_267D328C0, (uint64_t)qword_267D36910);
}

uint64_t sub_21E4CD784@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D328C0, (uint64_t)qword_267D36910, a1);
}

uint64_t sub_21E4CD7A8(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36928);
}

uint64_t sub_21E4CD7CC()
{
  return sub_21E4CED4C(&qword_267D328C8, (uint64_t)qword_267D36928);
}

uint64_t sub_21E4CD7F0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D328C8, (uint64_t)qword_267D36928, a1);
}

uint64_t sub_21E4CD814(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36940);
}

uint64_t sub_21E4CD838()
{
  return sub_21E4CED4C(&qword_267D328D0, (uint64_t)qword_267D36940);
}

uint64_t sub_21E4CD85C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D328D0, (uint64_t)qword_267D36940, a1);
}

uint64_t sub_21E4CD880(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36958);
}

uint64_t sub_21E4CD8A4()
{
  return sub_21E4CED4C(&qword_267D328D8, (uint64_t)qword_267D36958);
}

uint64_t sub_21E4CD8C8@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D328D8, (uint64_t)qword_267D36958, a1);
}

uint64_t sub_21E4CD8EC(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36970);
}

uint64_t sub_21E4CD910()
{
  return sub_21E4CED4C(&qword_267D328E0, (uint64_t)qword_267D36970);
}

uint64_t sub_21E4CD934@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D328E0, (uint64_t)qword_267D36970, a1);
}

uint64_t sub_21E4CD958(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36988);
}

uint64_t sub_21E4CD97C()
{
  return sub_21E4CED4C(&qword_267D328E8, (uint64_t)qword_267D36988);
}

uint64_t sub_21E4CD9A0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D328E8, (uint64_t)qword_267D36988, a1);
}

uint64_t sub_21E4CD9C4(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D369A0);
}

uint64_t sub_21E4CD9F0()
{
  return sub_21E4CED4C(&qword_267D328F0, (uint64_t)qword_267D369A0);
}

uint64_t sub_21E4CDA14@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D328F0, (uint64_t)qword_267D369A0, a1);
}

uint64_t sub_21E4CDA38(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D369B8);
}

uint64_t sub_21E4CDA5C()
{
  return sub_21E4CED4C(&qword_267D328F8, (uint64_t)qword_267D369B8);
}

uint64_t sub_21E4CDA80@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D328F8, (uint64_t)qword_267D369B8, a1);
}

uint64_t sub_21E4CDAA4(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D369D0);
}

uint64_t sub_21E4CDAC8()
{
  return sub_21E4CED4C(&qword_267D32900, (uint64_t)qword_267D369D0);
}

uint64_t sub_21E4CDAEC@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32900, (uint64_t)qword_267D369D0, a1);
}

uint64_t sub_21E4CDB10(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D369E8);
}

uint64_t sub_21E4CDB34()
{
  return sub_21E4CED4C(&qword_267D32908, (uint64_t)qword_267D369E8);
}

uint64_t sub_21E4CDB58@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32908, (uint64_t)qword_267D369E8, a1);
}

uint64_t sub_21E4CDB7C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36A00);
}

uint64_t sub_21E4CDBA0()
{
  return sub_21E4CED4C(&qword_267D32910, (uint64_t)qword_267D36A00);
}

uint64_t sub_21E4CDBC4@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32910, (uint64_t)qword_267D36A00, a1);
}

uint64_t sub_21E4CDBE8(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36A18);
}

uint64_t sub_21E4CDC0C()
{
  return sub_21E4CED4C(&qword_267D32918, (uint64_t)qword_267D36A18);
}

uint64_t sub_21E4CDC30@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32918, (uint64_t)qword_267D36A18, a1);
}

uint64_t sub_21E4CDC54(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36A30);
}

uint64_t sub_21E4CDC78()
{
  return sub_21E4CED4C(&qword_267D32920, (uint64_t)qword_267D36A30);
}

uint64_t sub_21E4CDC9C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32920, (uint64_t)qword_267D36A30, a1);
}

uint64_t sub_21E4CDCC0(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36A48);
}

uint64_t sub_21E4CDCE4()
{
  return sub_21E4CED4C(&qword_267D32928, (uint64_t)qword_267D36A48);
}

uint64_t sub_21E4CDD08@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32928, (uint64_t)qword_267D36A48, a1);
}

uint64_t sub_21E4CDD2C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36A60);
}

uint64_t sub_21E4CDD50()
{
  return sub_21E4CED4C(&qword_267D32930, (uint64_t)qword_267D36A60);
}

uint64_t sub_21E4CDD74@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32930, (uint64_t)qword_267D36A60, a1);
}

uint64_t sub_21E4CDD98(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36A78);
}

uint64_t sub_21E4CDDBC()
{
  return sub_21E4CED4C(&qword_267D32938, (uint64_t)qword_267D36A78);
}

uint64_t sub_21E4CDDE0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32938, (uint64_t)qword_267D36A78, a1);
}

uint64_t sub_21E4CDE04(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36A90);
}

uint64_t sub_21E4CDE28()
{
  return sub_21E4CED4C(&qword_267D32940, (uint64_t)qword_267D36A90);
}

uint64_t sub_21E4CDE4C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32940, (uint64_t)qword_267D36A90, a1);
}

uint64_t sub_21E4CDE70(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36AA8);
}

uint64_t sub_21E4CDE94()
{
  return sub_21E4CED4C(&qword_267D32948, (uint64_t)qword_267D36AA8);
}

uint64_t sub_21E4CDEB8@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32948, (uint64_t)qword_267D36AA8, a1);
}

uint64_t sub_21E4CDEDC(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36AC0);
}

uint64_t sub_21E4CDF00()
{
  return sub_21E4CED4C(&qword_267D32950, (uint64_t)qword_267D36AC0);
}

uint64_t sub_21E4CDF24@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32950, (uint64_t)qword_267D36AC0, a1);
}

uint64_t sub_21E4CDF48(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36AD8);
}

uint64_t sub_21E4CDF74()
{
  return sub_21E4CED4C(&qword_267D32958, (uint64_t)qword_267D36AD8);
}

uint64_t sub_21E4CDF98@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32958, (uint64_t)qword_267D36AD8, a1);
}

uint64_t sub_21E4CDFBC(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36AF0);
}

uint64_t sub_21E4CDFE0()
{
  return sub_21E4CED4C(&qword_267D32960, (uint64_t)qword_267D36AF0);
}

uint64_t sub_21E4CE004@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32960, (uint64_t)qword_267D36AF0, a1);
}

uint64_t sub_21E4CE028(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36B08);
}

uint64_t sub_21E4CE04C()
{
  return sub_21E4CED4C(&qword_267D32968, (uint64_t)qword_267D36B08);
}

uint64_t sub_21E4CE070@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32968, (uint64_t)qword_267D36B08, a1);
}

uint64_t sub_21E4CE094(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36B20);
}

uint64_t sub_21E4CE0B8()
{
  return sub_21E4CED4C(&qword_267D32970, (uint64_t)qword_267D36B20);
}

uint64_t sub_21E4CE0DC@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32970, (uint64_t)qword_267D36B20, a1);
}

uint64_t sub_21E4CE100(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36B38);
}

uint64_t sub_21E4CE124()
{
  return sub_21E4CED4C(&qword_267D32978, (uint64_t)qword_267D36B38);
}

uint64_t sub_21E4CE148@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32978, (uint64_t)qword_267D36B38, a1);
}

uint64_t sub_21E4CE16C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36B50);
}

uint64_t sub_21E4CE190()
{
  return sub_21E4CED4C(&qword_267D32980, (uint64_t)qword_267D36B50);
}

uint64_t sub_21E4CE1B4@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32980, (uint64_t)qword_267D36B50, a1);
}

uint64_t sub_21E4CE1D8(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36B68);
}

uint64_t sub_21E4CE1FC()
{
  return sub_21E4CED4C(&qword_267D32988, (uint64_t)qword_267D36B68);
}

uint64_t sub_21E4CE220@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32988, (uint64_t)qword_267D36B68, a1);
}

uint64_t sub_21E4CE244(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36B80);
}

uint64_t sub_21E4CE268()
{
  return sub_21E4CED4C(&qword_267D32990, (uint64_t)qword_267D36B80);
}

uint64_t sub_21E4CE28C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32990, (uint64_t)qword_267D36B80, a1);
}

uint64_t sub_21E4CE2B0(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36B98);
}

uint64_t sub_21E4CE2D4()
{
  return sub_21E4CED4C(&qword_267D32998, (uint64_t)qword_267D36B98);
}

uint64_t sub_21E4CE2F8@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32998, (uint64_t)qword_267D36B98, a1);
}

uint64_t sub_21E4CE31C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36BB0);
}

uint64_t sub_21E4CE340()
{
  return sub_21E4CED4C(&qword_267D329A0, (uint64_t)qword_267D36BB0);
}

uint64_t sub_21E4CE364@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D329A0, (uint64_t)qword_267D36BB0, a1);
}

uint64_t sub_21E4CE388(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36BC8);
}

uint64_t sub_21E4CE3AC()
{
  return sub_21E4CED4C(&qword_267D329A8, (uint64_t)qword_267D36BC8);
}

uint64_t sub_21E4CE3D0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D329A8, (uint64_t)qword_267D36BC8, a1);
}

uint64_t sub_21E4CE3F4(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36BE0);
}

uint64_t sub_21E4CE418()
{
  return sub_21E4CED4C(&qword_267D329B0, (uint64_t)qword_267D36BE0);
}

uint64_t sub_21E4CE43C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D329B0, (uint64_t)qword_267D36BE0, a1);
}

uint64_t sub_21E4CE460(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36BF8);
}

uint64_t sub_21E4CE484()
{
  return sub_21E4CED4C(&qword_267D329B8, (uint64_t)qword_267D36BF8);
}

uint64_t sub_21E4CE4A8@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D329B8, (uint64_t)qword_267D36BF8, a1);
}

uint64_t sub_21E4CE4CC(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36C10);
}

uint64_t sub_21E4CE4F0()
{
  return sub_21E4CED4C(&qword_267D329C0, (uint64_t)qword_267D36C10);
}

uint64_t sub_21E4CE514@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D329C0, (uint64_t)qword_267D36C10, a1);
}

uint64_t sub_21E4CE538(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36C28);
}

uint64_t sub_21E4CE564()
{
  return sub_21E4CED4C(&qword_267D329C8, (uint64_t)qword_267D36C28);
}

uint64_t sub_21E4CE588@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D329C8, (uint64_t)qword_267D36C28, a1);
}

uint64_t sub_21E4CE5AC(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36C40);
}

uint64_t sub_21E4CE5D0()
{
  return sub_21E4CED4C(&qword_267D329D0, (uint64_t)qword_267D36C40);
}

uint64_t sub_21E4CE5F4@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D329D0, (uint64_t)qword_267D36C40, a1);
}

uint64_t sub_21E4CE618(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36C58);
}

uint64_t sub_21E4CE644()
{
  return sub_21E4CED4C(&qword_267D329D8, (uint64_t)qword_267D36C58);
}

uint64_t sub_21E4CE668@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D329D8, (uint64_t)qword_267D36C58, a1);
}

uint64_t sub_21E4CE68C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36C70);
}

uint64_t sub_21E4CE6B8()
{
  return sub_21E4CED4C(&qword_267D329E0, (uint64_t)qword_267D36C70);
}

uint64_t sub_21E4CE6DC@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D329E0, (uint64_t)qword_267D36C70, a1);
}

uint64_t sub_21E4CE700(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36C88);
}

uint64_t sub_21E4CE72C()
{
  return sub_21E4CED4C(&qword_267D329E8, (uint64_t)qword_267D36C88);
}

uint64_t sub_21E4CE750@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D329E8, (uint64_t)qword_267D36C88, a1);
}

uint64_t sub_21E4CE774(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36CA0);
}

uint64_t sub_21E4CE78C()
{
  return sub_21E4CED4C(&qword_267D329F0, (uint64_t)qword_267D36CA0);
}

uint64_t sub_21E4CE7B0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D329F0, (uint64_t)qword_267D36CA0, a1);
}

uint64_t sub_21E4CE7D4(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36CB8);
}

uint64_t sub_21E4CE7F8()
{
  return sub_21E4CED4C(&qword_267D329F8, (uint64_t)qword_267D36CB8);
}

uint64_t sub_21E4CE81C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D329F8, (uint64_t)qword_267D36CB8, a1);
}

uint64_t sub_21E4CE840(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36CD0);
}

uint64_t sub_21E4CE864()
{
  return sub_21E4CED4C(&qword_267D32A00, (uint64_t)qword_267D36CD0);
}

uint64_t sub_21E4CE888@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32A00, (uint64_t)qword_267D36CD0, a1);
}

uint64_t sub_21E4CE8AC(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36CE8);
}

uint64_t sub_21E4CE8D0()
{
  return sub_21E4CED4C(&qword_267D32A08, (uint64_t)qword_267D36CE8);
}

uint64_t sub_21E4CE8F4@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32A08, (uint64_t)qword_267D36CE8, a1);
}

uint64_t sub_21E4CE918(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36D00);
}

uint64_t sub_21E4CE938()
{
  return sub_21E4CED4C(&qword_267D32A10, (uint64_t)qword_267D36D00);
}

uint64_t sub_21E4CE95C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32A10, (uint64_t)qword_267D36D00, a1);
}

uint64_t sub_21E4CE980(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36D18);
}

uint64_t sub_21E4CE9A0()
{
  return sub_21E4CED4C(&qword_267D32A18, (uint64_t)qword_267D36D18);
}

uint64_t sub_21E4CE9C4@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32A18, (uint64_t)qword_267D36D18, a1);
}

uint64_t sub_21E4CE9E8(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36D30);
}

uint64_t sub_21E4CEA08()
{
  return sub_21E4CED4C(&qword_267D32A20, (uint64_t)qword_267D36D30);
}

uint64_t sub_21E4CEA2C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32A20, (uint64_t)qword_267D36D30, a1);
}

uint64_t sub_21E4CEA50(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36D48);
}

uint64_t sub_21E4CEA74()
{
  return sub_21E4CED4C(&qword_267D32A28, (uint64_t)qword_267D36D48);
}

uint64_t sub_21E4CEA98@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32A28, (uint64_t)qword_267D36D48, a1);
}

uint64_t sub_21E4CEABC(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36D60);
}

uint64_t sub_21E4CEADC()
{
  return sub_21E4CED4C(&qword_267D32A30, (uint64_t)qword_267D36D60);
}

uint64_t sub_21E4CEB00@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32A30, (uint64_t)qword_267D36D60, a1);
}

uint64_t sub_21E4CEB24(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36D78);
}

uint64_t sub_21E4CEB44()
{
  return sub_21E4CED4C(&qword_267D32A38, (uint64_t)qword_267D36D78);
}

uint64_t sub_21E4CEB68@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32A38, (uint64_t)qword_267D36D78, a1);
}

uint64_t sub_21E4CEB8C(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36D90);
}

uint64_t sub_21E4CEBB0()
{
  return sub_21E4CED4C(&qword_267D32A40, (uint64_t)qword_267D36D90);
}

uint64_t sub_21E4CEBD4@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32A40, (uint64_t)qword_267D36D90, a1);
}

uint64_t sub_21E4CEBF8(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36DA8);
}

uint64_t sub_21E4CEC18()
{
  return sub_21E4CED4C(&qword_267D32A48, (uint64_t)qword_267D36DA8);
}

uint64_t sub_21E4CEC3C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32A48, (uint64_t)qword_267D36DA8, a1);
}

uint64_t sub_21E4CEC60(uint64_t a1)
{
  return sub_21E4CEC84(a1, qword_267D36DC0);
}

uint64_t sub_21E4CEC84(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_21E4D0010();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  if (qword_267D313F0 != -1) {
    swift_once();
  }
  id v4 = (id)qword_267D313F8;
  return sub_21E4D0000();
}

uint64_t sub_21E4CED28()
{
  return sub_21E4CED4C(&qword_267D32A50, (uint64_t)qword_267D36DC0);
}

uint64_t sub_21E4CED4C(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_21E4D0010();
  return __swift_project_value_buffer(v3, a2);
}

uint64_t sub_21E4CEDA0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E4CEDC4(&qword_267D32A50, (uint64_t)qword_267D36DC0, a1);
}

uint64_t sub_21E4CEDC4@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_21E4D0010();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v7(a3, v6, v5);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void _FIUIUserContactFromAddressBook_cold_1()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  FIUIUserHasExistingSampleOfTypesPassingFilter_cold_1(v0);
}

void FIUIUserHasExistingSampleOfTypesPassingFilter_cold_1()
{
  __assert_rtn("FIUIUserHasExistingSampleOfTypesPassingFilter", "FUUtilities.m", 664, "resultHandler != nil");
}

void FIUIHealthStoreForDevice_cold_1(os_log_t log)
{
  *(_WORD *)unint64_t v1 = 0;
  _os_log_error_impl(&dword_21E433000, log, OS_LOG_TYPE_ERROR, "Profile identifier for satellite paired watch is nil. Returning nil HealthStore.", v1, 2u);
}

void FIUIHealthStoreForDevice_cold_2(os_log_t log)
{
  *(_WORD *)unint64_t v1 = 0;
  _os_log_error_impl(&dword_21E433000, log, OS_LOG_TYPE_ERROR, "Semaphore timed out reading profile identifier for satellite paired watch.", v1, 2u);
}

void __FIUIHealthStoreForDevice_block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21E433000, a2, OS_LOG_TYPE_ERROR, "Error reading profile identifier for satellite paired watch. error=%@", (uint8_t *)&v2, 0xCu);
}

uint64_t __getCMCalorieUserInfoClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getCMNatalimeterClass_block_invoke_cold_1(v0);
}

uint64_t __getCMNatalimeterClass_block_invoke_cold_1()
{
  return __getCNContactStoreClass_block_invoke_cold_1();
}

uint64_t __getCNContactStoreClass_block_invoke_cold_1()
{
  return __getCNContactFormatterClass_block_invoke_cold_1();
}

uint64_t __getCNContactFormatterClass_block_invoke_cold_1()
{
  return __getIntlUtilityClass_block_invoke_cold_1();
}

uint64_t __getIntlUtilityClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __54__FIUIBluetoothSensorLookup__queueCheckForPeripherals__block_invoke_cold_1(v0);
}

void _activityTypePrefix_cold_1(void *a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  int v4 = 134217984;
  uint64_t v5 = [a2 effectiveTypeIdentifier];
  _os_log_fault_impl(&dword_21E433000, v3, OS_LOG_TYPE_FAULT, "Unsupported activity_type=%lu in _activityTypePrefix() in FIUIWorkoutIconProvider", (uint8_t *)&v4, 0xCu);
}

uint64_t sub_21E4CFBF0()
{
  return MEMORY[0x270EEE098]();
}

uint64_t sub_21E4CFC00()
{
  return MEMORY[0x270EEE200]();
}

uint64_t sub_21E4CFC10()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_21E4CFC20()
{
  return MEMORY[0x270EEE2F0]();
}

uint64_t sub_21E4CFC30()
{
  return MEMORY[0x270EEE300]();
}

uint64_t sub_21E4CFC40()
{
  return MEMORY[0x270EEE308]();
}

uint64_t sub_21E4CFC50()
{
  return MEMORY[0x270EEE338]();
}

uint64_t sub_21E4CFC60()
{
  return MEMORY[0x270EEE738]();
}

uint64_t sub_21E4CFC70()
{
  return MEMORY[0x270EEE768]();
}

uint64_t sub_21E4CFC80()
{
  return MEMORY[0x270EEE7B8]();
}

uint64_t sub_21E4CFC90()
{
  return MEMORY[0x270EEE828]();
}

uint64_t sub_21E4CFCA0()
{
  return MEMORY[0x270EEE890]();
}

uint64_t sub_21E4CFCB0()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t sub_21E4CFCC0()
{
  return MEMORY[0x270F816B0]();
}

uint64_t sub_21E4CFCD0()
{
  return MEMORY[0x270EFEAE8]();
}

uint64_t sub_21E4CFCE0()
{
  return MEMORY[0x270EFEB18]();
}

uint64_t sub_21E4CFCF0()
{
  return MEMORY[0x270EEEB18]();
}

uint64_t sub_21E4CFD00()
{
  return MEMORY[0x270EEEB78]();
}

uint64_t sub_21E4CFD10()
{
  return MEMORY[0x270EEEDD8]();
}

uint64_t sub_21E4CFD20()
{
  return MEMORY[0x270EEEDF0]();
}

uint64_t sub_21E4CFD30()
{
  return MEMORY[0x270EEEE18]();
}

uint64_t sub_21E4CFD40()
{
  return MEMORY[0x270EEF060]();
}

uint64_t sub_21E4CFD50()
{
  return MEMORY[0x270EEF070]();
}

uint64_t sub_21E4CFD60()
{
  return MEMORY[0x270EEF180]();
}

uint64_t sub_21E4CFD70()
{
  return MEMORY[0x270F816D8]();
}

uint64_t sub_21E4CFD80()
{
  return MEMORY[0x270EFEB28]();
}

uint64_t sub_21E4CFD90()
{
  return MEMORY[0x270EEF930]();
}

uint64_t sub_21E4CFDA0()
{
  return MEMORY[0x270EF02C8]();
}

uint64_t sub_21E4CFDB0()
{
  return MEMORY[0x270EF06E8]();
}

uint64_t sub_21E4CFDC0()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t sub_21E4CFDD0()
{
  return MEMORY[0x270EF0898]();
}

uint64_t sub_21E4CFDE0()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_21E4CFDF0()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_21E4CFE00()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_21E4CFE10()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_21E4CFE20()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_21E4CFE30()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_21E4CFE40()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_21E4CFE50()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_21E4CFE60()
{
  return MEMORY[0x270EF0DB8]();
}

uint64_t sub_21E4CFE70()
{
  return MEMORY[0x270EF0DD8]();
}

uint64_t sub_21E4CFE80()
{
  return MEMORY[0x270EF0EE0]();
}

uint64_t sub_21E4CFE90()
{
  return MEMORY[0x270EF0EF8]();
}

uint64_t sub_21E4CFEA0()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_21E4CFEB0()
{
  return MEMORY[0x270EF1008]();
}

uint64_t sub_21E4CFEC0()
{
  return MEMORY[0x270EF1060]();
}

uint64_t sub_21E4CFED0()
{
  return MEMORY[0x270EF1080]();
}

uint64_t sub_21E4CFEE0()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_21E4CFEF0()
{
  return MEMORY[0x270EF1100]();
}

uint64_t sub_21E4CFF00()
{
  return MEMORY[0x270EF1248]();
}

uint64_t sub_21E4CFF10()
{
  return MEMORY[0x270EF12E0]();
}

uint64_t sub_21E4CFF20()
{
  return MEMORY[0x270EF1368]();
}

uint64_t sub_21E4CFF30()
{
  return MEMORY[0x270EF1378]();
}

uint64_t sub_21E4CFF40()
{
  return MEMORY[0x270EF1388]();
}

uint64_t sub_21E4CFF50()
{
  return MEMORY[0x270EF13B0]();
}

uint64_t sub_21E4CFF60()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t sub_21E4CFF70()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_21E4CFF80()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_21E4CFF90()
{
  return MEMORY[0x270EF1608]();
}

uint64_t sub_21E4CFFA0()
{
  return MEMORY[0x270FA11F8]();
}

uint64_t sub_21E4CFFB0()
{
  return MEMORY[0x270FA1208]();
}

uint64_t sub_21E4CFFC0()
{
  return MEMORY[0x270FA1220]();
}

uint64_t sub_21E4CFFD0()
{
  return MEMORY[0x270FA1228]();
}

uint64_t sub_21E4CFFE0()
{
  return MEMORY[0x270FA1238]();
}

uint64_t sub_21E4CFFF0()
{
  return MEMORY[0x270FA1250]();
}

uint64_t sub_21E4D0000()
{
  return MEMORY[0x270EEB1D0]();
}

uint64_t sub_21E4D0010()
{
  return MEMORY[0x270EEB1E0]();
}

uint64_t sub_21E4D0020()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_21E4D0030()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_21E4D0040()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_21E4D0050()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_21E4D0060()
{
  return MEMORY[0x270EE2B40]();
}

uint64_t sub_21E4D0070()
{
  return MEMORY[0x270EE2B48]();
}

uint64_t sub_21E4D0080()
{
  return MEMORY[0x270EE2BB8]();
}

uint64_t sub_21E4D0090()
{
  return MEMORY[0x270EE2C18]();
}

uint64_t sub_21E4D00A0()
{
  return MEMORY[0x270EE2C58]();
}

uint64_t sub_21E4D00B0()
{
  return MEMORY[0x270EE2C98]();
}

uint64_t sub_21E4D00C0()
{
  return MEMORY[0x270EE2CA0]();
}

uint64_t sub_21E4D00D0()
{
  return MEMORY[0x270EE2CF0]();
}

uint64_t sub_21E4D00E0()
{
  return MEMORY[0x270EE2D20]();
}

uint64_t sub_21E4D00F0()
{
  return MEMORY[0x270EE2D78]();
}

uint64_t sub_21E4D0100()
{
  return MEMORY[0x270EE2D88]();
}

uint64_t sub_21E4D0110()
{
  return MEMORY[0x270EE2D90]();
}

uint64_t sub_21E4D0120()
{
  return MEMORY[0x270EE2D98]();
}

uint64_t sub_21E4D0130()
{
  return MEMORY[0x270EE2E50]();
}

uint64_t sub_21E4D0140()
{
  return MEMORY[0x270EE2E58]();
}

uint64_t sub_21E4D0150()
{
  return MEMORY[0x270EE2EB0]();
}

uint64_t sub_21E4D0160()
{
  return MEMORY[0x270EE2ED0]();
}

uint64_t sub_21E4D0170()
{
  return MEMORY[0x270EE2EE8]();
}

uint64_t sub_21E4D0180()
{
  return MEMORY[0x270EE2F48]();
}

uint64_t sub_21E4D0190()
{
  return MEMORY[0x270EE2F50]();
}

uint64_t sub_21E4D01A0()
{
  return MEMORY[0x270EE2F68]();
}

uint64_t sub_21E4D01B0()
{
  return MEMORY[0x270EE2F78]();
}

uint64_t sub_21E4D01C0()
{
  return MEMORY[0x270EE2F88]();
}

uint64_t sub_21E4D01D0()
{
  return MEMORY[0x270EE2F90]();
}

uint64_t sub_21E4D01E0()
{
  return MEMORY[0x270EE2FC0]();
}

uint64_t sub_21E4D01F0()
{
  return MEMORY[0x270EE2FD8]();
}

uint64_t sub_21E4D0200()
{
  return MEMORY[0x270EE3008]();
}

uint64_t sub_21E4D0210()
{
  return MEMORY[0x270EE3030]();
}

uint64_t sub_21E4D0220()
{
  return MEMORY[0x270EE3058]();
}

uint64_t sub_21E4D0230()
{
  return MEMORY[0x270EE3BA8]();
}

uint64_t sub_21E4D0240()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_21E4D0250()
{
  return MEMORY[0x270EE3CE0]();
}

uint64_t sub_21E4D0260()
{
  return MEMORY[0x270EE4008]();
}

uint64_t sub_21E4D0270()
{
  return MEMORY[0x270EFECF8]();
}

uint64_t sub_21E4D0280()
{
  return MEMORY[0x270EFEFD0]();
}

uint64_t sub_21E4D0290()
{
  return MEMORY[0x270EFF128]();
}

uint64_t sub_21E4D02A0()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_21E4D02B0()
{
  return MEMORY[0x270EFFA68]();
}

uint64_t sub_21E4D02C0()
{
  return MEMORY[0x270F00180]();
}

uint64_t sub_21E4D02F0()
{
  return MEMORY[0x270F00320]();
}

uint64_t sub_21E4D0300()
{
  return MEMORY[0x270F00328]();
}

uint64_t sub_21E4D0310()
{
  return MEMORY[0x270F00330]();
}

uint64_t sub_21E4D0320()
{
  return MEMORY[0x270F00578]();
}

uint64_t sub_21E4D0330()
{
  return MEMORY[0x270F00688]();
}

uint64_t sub_21E4D0340()
{
  return MEMORY[0x270F00860]();
}

uint64_t sub_21E4D0350()
{
  return MEMORY[0x270F00A20]();
}

uint64_t sub_21E4D0360()
{
  return MEMORY[0x270F00A30]();
}

uint64_t sub_21E4D0370()
{
  return MEMORY[0x270F00AC8]();
}

uint64_t sub_21E4D0380()
{
  return MEMORY[0x270F00AD0]();
}

uint64_t sub_21E4D0390()
{
  return MEMORY[0x270F00B78]();
}

uint64_t sub_21E4D03A0()
{
  return MEMORY[0x270F00B80]();
}

uint64_t sub_21E4D03B0()
{
  return MEMORY[0x270F00BA8]();
}

uint64_t sub_21E4D03C0()
{
  return MEMORY[0x270F00D80]();
}

uint64_t sub_21E4D03D0()
{
  return MEMORY[0x270F00D90]();
}

uint64_t sub_21E4D03E0()
{
  return MEMORY[0x270F07348]();
}

uint64_t sub_21E4D03F0()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_21E4D0400()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_21E4D0410()
{
  return MEMORY[0x270F00F10]();
}

uint64_t sub_21E4D0420()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_21E4D0430()
{
  return MEMORY[0x270F011E8]();
}

uint64_t sub_21E4D0440()
{
  return MEMORY[0x270F01238]();
}

uint64_t sub_21E4D0450()
{
  return MEMORY[0x270F01248]();
}

uint64_t sub_21E4D0460()
{
  return MEMORY[0x270F01258]();
}

uint64_t sub_21E4D0470()
{
  return MEMORY[0x270F01270]();
}

uint64_t sub_21E4D0480()
{
  return MEMORY[0x270F01280]();
}

uint64_t sub_21E4D0490()
{
  return MEMORY[0x270F01478]();
}

uint64_t sub_21E4D04A0()
{
  return MEMORY[0x270F01490]();
}

uint64_t sub_21E4D04B0()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_21E4D04C0()
{
  return MEMORY[0x270F017F8]();
}

uint64_t sub_21E4D04D0()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_21E4D04E0()
{
  return MEMORY[0x270F01818]();
}

uint64_t sub_21E4D04F0()
{
  return MEMORY[0x270F02370]();
}

uint64_t sub_21E4D0500()
{
  return MEMORY[0x270F02380]();
}

uint64_t sub_21E4D0510()
{
  return MEMORY[0x270F023A0]();
}

uint64_t sub_21E4D0520()
{
  return MEMORY[0x270F027A8]();
}

uint64_t sub_21E4D0530()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_21E4D0540()
{
  return MEMORY[0x270F02A78]();
}

uint64_t sub_21E4D0550()
{
  return MEMORY[0x270F02AD0]();
}

uint64_t sub_21E4D0560()
{
  return MEMORY[0x270F02C10]();
}

uint64_t sub_21E4D0570()
{
  return MEMORY[0x270F02CB0]();
}

uint64_t sub_21E4D0580()
{
  return MEMORY[0x270F02CC0]();
}

uint64_t sub_21E4D0590()
{
  return MEMORY[0x270F02CD0]();
}

uint64_t sub_21E4D05A0()
{
  return MEMORY[0x270F02CE8]();
}

uint64_t sub_21E4D05B0()
{
  return MEMORY[0x270F03008]();
}

uint64_t sub_21E4D05C0()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_21E4D05D0()
{
  return MEMORY[0x270F030C0]();
}

uint64_t sub_21E4D05E0()
{
  return MEMORY[0x270F030C8]();
}

uint64_t sub_21E4D05F0()
{
  return MEMORY[0x270F03228]();
}

uint64_t sub_21E4D0600()
{
  return MEMORY[0x270F03238]();
}

uint64_t sub_21E4D0610()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_21E4D0620()
{
  return MEMORY[0x270EE3070]();
}

uint64_t sub_21E4D0630()
{
  return MEMORY[0x270EE3080]();
}

uint64_t sub_21E4D0640()
{
  return MEMORY[0x270EE3098]();
}

uint64_t sub_21E4D0650()
{
  return MEMORY[0x270EE30B0]();
}

uint64_t sub_21E4D0660()
{
  return MEMORY[0x270EE30D0]();
}

uint64_t sub_21E4D0670()
{
  return MEMORY[0x270F07438]();
}

uint64_t sub_21E4D0680()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_21E4D0690()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_21E4D06A0()
{
  return MEMORY[0x270F03360]();
}

uint64_t sub_21E4D06B0()
{
  return MEMORY[0x270F03408]();
}

uint64_t sub_21E4D06C0()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_21E4D06D0()
{
  return MEMORY[0x270F038B8]();
}

uint64_t sub_21E4D06E0()
{
  return MEMORY[0x270F039B0]();
}

uint64_t sub_21E4D06F0()
{
  return MEMORY[0x270F03BC0]();
}

uint64_t sub_21E4D0700()
{
  return MEMORY[0x270F04410]();
}

uint64_t sub_21E4D0710()
{
  return MEMORY[0x270F04478]();
}

uint64_t sub_21E4D0720()
{
  return MEMORY[0x270F04498]();
}

uint64_t sub_21E4D0730()
{
  return MEMORY[0x270F044E8]();
}

uint64_t sub_21E4D0740()
{
  return MEMORY[0x270F045A8]();
}

uint64_t sub_21E4D0750()
{
  return MEMORY[0x270F04608]();
}

uint64_t sub_21E4D0760()
{
  return MEMORY[0x270F04620]();
}

uint64_t sub_21E4D0770()
{
  return MEMORY[0x270F046C8]();
}

uint64_t sub_21E4D0780()
{
  return MEMORY[0x270F04708]();
}

uint64_t sub_21E4D0790()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_21E4D07A0()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_21E4D07B0()
{
  return MEMORY[0x270F04830]();
}

uint64_t sub_21E4D07C0()
{
  return MEMORY[0x270F04848]();
}

uint64_t sub_21E4D07D0()
{
  return MEMORY[0x270F04950]();
}

uint64_t sub_21E4D07E0()
{
  return MEMORY[0x270F04960]();
}

uint64_t sub_21E4D07F0()
{
  return MEMORY[0x270F04AF0]();
}

uint64_t sub_21E4D0800()
{
  return MEMORY[0x270F04AF8]();
}

uint64_t sub_21E4D0810()
{
  return MEMORY[0x270EE3100]();
}

uint64_t sub_21E4D0820()
{
  return MEMORY[0x270F04EE8]();
}

uint64_t sub_21E4D0830()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_21E4D0840()
{
  return MEMORY[0x270F05398]();
}

uint64_t sub_21E4D0850()
{
  return MEMORY[0x270F053B8]();
}

uint64_t sub_21E4D0860()
{
  return MEMORY[0x270F053C8]();
}

uint64_t sub_21E4D0870()
{
  return MEMORY[0x270F259F0]();
}

uint64_t sub_21E4D0880()
{
  return MEMORY[0x270F259F8]();
}

uint64_t sub_21E4D0890()
{
  return MEMORY[0x270F25A00]();
}

uint64_t sub_21E4D08A0()
{
  return MEMORY[0x270F25A08]();
}

uint64_t sub_21E4D08B0()
{
  return MEMORY[0x270F25A10]();
}

uint64_t sub_21E4D08C0()
{
  return MEMORY[0x270F25A18]();
}

uint64_t sub_21E4D08D0()
{
  return MEMORY[0x270F25A20]();
}

uint64_t sub_21E4D08E0()
{
  return MEMORY[0x270F25A38]();
}

uint64_t sub_21E4D08F0()
{
  return MEMORY[0x270F25A40]();
}

uint64_t sub_21E4D0900()
{
  return MEMORY[0x270F25A48]();
}

uint64_t sub_21E4D0910()
{
  return MEMORY[0x270F25A50]();
}

uint64_t sub_21E4D0920()
{
  return MEMORY[0x270F25A58]();
}

uint64_t sub_21E4D0930()
{
  return MEMORY[0x270F25A60]();
}

uint64_t sub_21E4D0940()
{
  return MEMORY[0x270F25A68]();
}

uint64_t sub_21E4D0950()
{
  return MEMORY[0x270F25A70]();
}

uint64_t sub_21E4D0960()
{
  return MEMORY[0x270F25A78]();
}

uint64_t sub_21E4D0970()
{
  return MEMORY[0x270F25A80]();
}

uint64_t sub_21E4D0980()
{
  return MEMORY[0x270F25A88]();
}

uint64_t sub_21E4D0990()
{
  return MEMORY[0x270F25A90]();
}

uint64_t sub_21E4D09A0()
{
  return MEMORY[0x270F25A98]();
}

uint64_t sub_21E4D09B0()
{
  return MEMORY[0x270F25AA0]();
}

uint64_t sub_21E4D09C0()
{
  return MEMORY[0x270F25AA8]();
}

uint64_t sub_21E4D09D0()
{
  return MEMORY[0x270F25AB0]();
}

uint64_t sub_21E4D09E0()
{
  return MEMORY[0x270F25AB8]();
}

uint64_t sub_21E4D09F0()
{
  return MEMORY[0x270F25AE0]();
}

uint64_t sub_21E4D0A00()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_21E4D0A10()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_21E4D0A20()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_21E4D0A30()
{
  return MEMORY[0x270F9D230]();
}

uint64_t sub_21E4D0A40()
{
  return MEMORY[0x270F9D260]();
}

uint64_t sub_21E4D0A50()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_21E4D0A60()
{
  return MEMORY[0x270F9D328]();
}

uint64_t sub_21E4D0A70()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_21E4D0A80()
{
  return MEMORY[0x270F9D480]();
}

uint64_t sub_21E4D0A90()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_21E4D0AA0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_21E4D0AB0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_21E4D0AC0()
{
  return MEMORY[0x270EF19B8]();
}

uint64_t sub_21E4D0AD0()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_21E4D0AE0()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_21E4D0AF0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_21E4D0B00()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_21E4D0B10()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_21E4D0B20()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_21E4D0B30()
{
  return MEMORY[0x270F9D698]();
}

uint64_t sub_21E4D0B40()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_21E4D0B50()
{
  return MEMORY[0x270F9D748]();
}

uint64_t sub_21E4D0B60()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_21E4D0B70()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_21E4D0B80()
{
  return MEMORY[0x270F9D8B0]();
}

uint64_t sub_21E4D0B90()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_21E4D0BA0()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_21E4D0BB0()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_21E4D0BC0()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_21E4D0BD0()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_21E4D0BE0()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_21E4D0BF0()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_21E4D0C00()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_21E4D0C10()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_21E4D0C20()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_21E4D0C30()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_21E4D0C40()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_21E4D0C50()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_21E4D0C70()
{
  return MEMORY[0x270EF1C18]();
}

uint64_t sub_21E4D0C80()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_21E4D0C90()
{
  return MEMORY[0x270F9E018]();
}

uint64_t sub_21E4D0CA0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_21E4D0CB0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_21E4D0CC0()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_21E4D0CD0()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_21E4D0CE0()
{
  return MEMORY[0x270EF2010]();
}

uint64_t sub_21E4D0CF0()
{
  return MEMORY[0x270EF2020]();
}

uint64_t sub_21E4D0D00()
{
  return MEMORY[0x270EF2170]();
}

uint64_t sub_21E4D0D10()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_21E4D0D20()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_21E4D0D30()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_21E4D0D40()
{
  return MEMORY[0x270EF23E8]();
}

uint64_t sub_21E4D0D50()
{
  return MEMORY[0x270EF2470]();
}

uint64_t sub_21E4D0D60()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_21E4D0D70()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t sub_21E4D0D80()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_21E4D0D90()
{
  return MEMORY[0x270F9E7E0]();
}

uint64_t sub_21E4D0DA0()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_21E4D0DB0()
{
  return MEMORY[0x270F9E9A0]();
}

uint64_t sub_21E4D0DC0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_21E4D0DD0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_21E4D0DE0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_21E4D0DF0()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_21E4D0E00()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_21E4D0E10()
{
  return MEMORY[0x270F9EB30]();
}

uint64_t sub_21E4D0E20()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_21E4D0E30()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_21E4D0E40()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_21E4D0E50()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_21E4D0E60()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_21E4D0E70()
{
  return MEMORY[0x270FA2168]();
}

uint64_t sub_21E4D0E80()
{
  return MEMORY[0x270FA2190]();
}

uint64_t sub_21E4D0E90()
{
  return MEMORY[0x270FA21A0]();
}

uint64_t sub_21E4D0EA0()
{
  return MEMORY[0x270FA21B0]();
}

uint64_t sub_21E4D0EB0()
{
  return MEMORY[0x270F9EF50]();
}

uint64_t sub_21E4D0EC0()
{
  return MEMORY[0x270F9EF88]();
}

uint64_t sub_21E4D0ED0()
{
  return MEMORY[0x270F9EFC0]();
}

uint64_t sub_21E4D0EE0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_21E4D0EF0()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_21E4D0F00()
{
  return MEMORY[0x270F9F010]();
}

uint64_t sub_21E4D0F10()
{
  return MEMORY[0x270F9F018]();
}

uint64_t sub_21E4D0F20()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_21E4D0F30()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_21E4D0F40()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_21E4D0F50()
{
  return MEMORY[0x270F9F0A8]();
}

uint64_t sub_21E4D0F60()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_21E4D0F70()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_21E4D0F90()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_21E4D0FA0()
{
  return MEMORY[0x270F9F740]();
}

uint64_t sub_21E4D0FB0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_21E4D0FC0()
{
  return MEMORY[0x270F9FA70]();
}

uint64_t sub_21E4D0FD0()
{
  return MEMORY[0x270F9FA90]();
}

uint64_t sub_21E4D0FE0()
{
  return MEMORY[0x270F9FA98]();
}

uint64_t sub_21E4D0FF0()
{
  return MEMORY[0x270F9FAA8]();
}

uint64_t sub_21E4D1000()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_21E4D1010()
{
  return MEMORY[0x270FA2398]();
}

uint64_t sub_21E4D1020()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_21E4D1030()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_21E4D1040()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_21E4D1050()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_21E4D1060()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_21E4D1070()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_21E4D1080()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_21E4D1090()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_21E4D10A0()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_21E4D10B0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_21E4D10C0()
{
  return MEMORY[0x270FA0128]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x270EFB790]();
  return result;
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  MEMORY[0x270EE48C8](theDate);
  return result;
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CE0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x270EE5998](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C68]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextAddEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextAddLineToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextBeginPath(CGContextRef c)
{
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
}

void CGContextClip(CGContextRef c)
{
}

void CGContextClipToRect(CGContextRef c, CGRect rect)
{
}

void CGContextClosePath(CGContextRef c)
{
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
}

void CGContextDrawPath(CGContextRef c, CGPathDrawingMode mode)
{
}

void CGContextFillEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextFillPath(CGContextRef c)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextMoveToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextSetAlpha(CGContextRef c, CGFloat alpha)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetLineCap(CGContextRef c, CGLineCap cap)
{
}

void CGContextSetLineDash(CGContextRef c, CGFloat phase, const CGFloat *lengths, size_t count)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextStrokePath(CGContextRef c)
{
}

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return (CGGradientRef)MEMORY[0x270EE6690](space, colors, locations);
}

void CGGradientRelease(CGGradientRef gradient)
{
}

CGGradientRef CGGradientRetain(CGGradientRef gradient)
{
  return (CGGradientRef)MEMORY[0x270EE66B0](gradient);
}

void CGImageRelease(CGImageRef image)
{
}

void CGPathAddArc(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, BOOL clockwise)
{
}

void CGPathAddRoundedRect(CGMutablePathRef path, const CGAffineTransform *transform, CGRect rect, CGFloat cornerWidth, CGFloat cornerHeight)
{
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x270EE7030]();
}

CGPathRef CGPathCreateWithRoundedRect(CGRect rect, CGFloat cornerWidth, CGFloat cornerHeight, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x270EE7060](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, cornerWidth, cornerHeight);
}

BOOL CGPathIsEmpty(CGPathRef path)
{
  return MEMORY[0x270EE70C8](path);
}

void CGPathRelease(CGPathRef path)
{
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x270EE7168](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.double x = v2;
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x270EE7170]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7180]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.double x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  MEMORY[0x270EE7230]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.double x = v1;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7250]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x270EE7260]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.double x = v3;
  return result;
}

CTFontRef CTFontCreateCopyWithAttributes(CTFontRef font, CGFloat size, const CGAffineTransform *matrix, CTFontDescriptorRef attributes)
{
  return (CTFontRef)MEMORY[0x270EE9AB8](font, matrix, attributes, size);
}

CTFontDescriptorRef CTFontDescriptorCreateWithAttributes(CFDictionaryRef attributes)
{
  return (CTFontDescriptorRef)MEMORY[0x270EE9B60](attributes);
}

CGRect CTFontGetBoundingRectsForGlyphs(CTFontRef font, CTFontOrientation orientation, const CGGlyph *glyphs, CGRect *boundingRects, CFIndex count)
{
  MEMORY[0x270EE9BF8](font, *(void *)&orientation, glyphs, boundingRects, count);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.double x = v5;
  return result;
}

BOOL CTFontGetGlyphsForCharacters(CTFontRef font, const UniChar *characters, CGGlyph *glyphs, CFIndex count)
{
  return MEMORY[0x270EE9C28](font, characters, glyphs, count);
}

uint64_t FIAgeInYearsForDateOfBirth()
{
  return MEMORY[0x270F29930]();
}

uint64_t FICMotionConditionForWheelchairUse()
{
  return MEMORY[0x270F29950]();
}

uint64_t FICustomSplits()
{
  return MEMORY[0x270F29960]();
}

uint64_t FIDeviceMeetsMinimumOSVersionGlory()
{
  return MEMORY[0x270F29970]();
}

uint64_t FIDistanceTypeForActivityType()
{
  return MEMORY[0x270F29980]();
}

uint64_t FIEffectiveOperatingSystemVersion()
{
  return MEMORY[0x270F299A8]();
}

uint64_t FIFitnessJuniorDefaultActivityTypes()
{
  return MEMORY[0x270F299C8]();
}

uint64_t FIGetActivePairedDevice()
{
  return MEMORY[0x270F299E0]();
}

uint64_t FIIsActivePairedDeviceSatellitePaired()
{
  return MEMORY[0x270F29A00]();
}

uint64_t FIIsDeviceSatellitePaired()
{
  return MEMORY[0x270F29A10]();
}

uint64_t FIMindfulnessWeekdayDaySelectionForCalendar()
{
  return MEMORY[0x270F29AC0]();
}

uint64_t FIMindfulnessWeekendDaySelectionForCalendar()
{
  return MEMORY[0x270F29AC8]();
}

uint64_t FINumberOfUnitsInPaceForPaceFormat()
{
  return MEMORY[0x270F29AD0]();
}

uint64_t FIPaceFormatForWorkoutActivityType()
{
  return MEMORY[0x270F29AE8]();
}

uint64_t FISplitsForMeasuringSystemIdentifier()
{
  return MEMORY[0x270F29B58]();
}

uint64_t FIStandardFitnessDefaultActivityTypes()
{
  return MEMORY[0x270F29B60]();
}

uint64_t HKCreateSerialDispatchQueue()
{
  return MEMORY[0x270EF3660]();
}

uint64_t HKLogSafeDescription()
{
  return MEMORY[0x270EF3778]();
}

uint64_t HKNSOperatingSystemVersionCompare()
{
  return MEMORY[0x270EF37A8]();
}

uint64_t HKNSOperatingSystemVersionFromString()
{
  return MEMORY[0x270EF37B0]();
}

uint64_t HKSensitiveLogItem()
{
  return MEMORY[0x270EF3808]();
}

uint64_t LICreateIconFromCachedBitmap()
{
  return MEMORY[0x270F4ADE8]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x270EF5E20]();
}

void NSLog(NSString *format, ...)
{
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x270EF2BD8](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x270F82BC0]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x270F82BD0]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

uint64_t UIAnimationDragCoefficient()
{
  return MEMORY[0x270F82CA0]();
}

uint64_t UICeilToViewScale()
{
  return MEMORY[0x270F82CC0]();
}

uint64_t UIEdgeInsetsSubtract()
{
  return MEMORY[0x270F82D18]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x270F82D70]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x270F82D80]();
}

void UIGraphicsPopContext(void)
{
}

void UIGraphicsPushContext(CGContextRef context)
{
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x270F82DD8](image);
}

void UIRectFill(CGRect rect)
{
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x270F82EB8]();
}

uint64_t UIRectInset()
{
  return MEMORY[0x270F82EC0]();
}

uint64_t UIRoundToScale()
{
  return MEMORY[0x270F82EF0]();
}

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x270F82F00]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _FIBoolForPerGizmoDomainAndKey()
{
  return MEMORY[0x270F29B78]();
}

uint64_t _FINumberForPerGizmoDomainAndKey()
{
  return MEMORY[0x270F29B98]();
}

uint64_t _FIWriteBoolsToPerGizmoDomain()
{
  return MEMORY[0x270F29BB8]();
}

uint64_t _HKCacheIndexFromDateComponents()
{
  return MEMORY[0x270EF3928]();
}

uint64_t _HKInitializeLogging()
{
  return MEMORY[0x270EF3970]();
}

uint64_t _HKWorkoutActivityNameForActivityType()
{
  return MEMORY[0x270EF39E0]();
}

uint64_t _HKWorkoutDistanceTypeForActivityType()
{
  return MEMORY[0x270EF3A08]();
}

uint64_t _HKWorkoutFlooredValueForQuantity()
{
  return MEMORY[0x270EF3A10]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

double __exp10(double a1)
{
  MEMORY[0x270ED7DC8](a1);
  return result;
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x270ED7E88](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  MEMORY[0x270ED7E90](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x270ED85E0]();
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x270ED86A8](__y, __x);
  return result;
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x270ED9470](queue);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
}

void free(void *a1)
{
}

long double log(long double __x)
{
  MEMORY[0x270EDA0A8](__x);
  return result;
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
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

void objc_exception_throw(id exception)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
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

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

mach_port_t pthread_mach_thread_np(pthread_t a1)
{
  return MEMORY[0x270EDAF38](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x270EDB010]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x270FA01D0]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x270FA01D8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x270FA2420]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x270FA2428]();
}

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x270FA0250]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x270FA0298]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x270FA03F0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x270FA0550]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x270FA2458]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x270FA05F8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x270FA0648]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x270FA0650]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x270FA0658]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}