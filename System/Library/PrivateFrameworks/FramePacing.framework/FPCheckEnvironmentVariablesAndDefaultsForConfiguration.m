@interface FPCheckEnvironmentVariablesAndDefaultsForConfiguration
@end

@implementation FPCheckEnvironmentVariablesAndDefaultsForConfiguration

void ___FPCheckEnvironmentVariablesAndDefaultsForConfiguration_block_invoke()
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  v0 = _fpConfigurationHandle();
  if (os_signpost_enabled(v0))
  {
    LOWORD(v39) = 0;
    _os_signpost_emit_with_name_impl(&dword_24F441000, v0, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CheckingFramePacingConfiguration", "Checking environment variables and/or defaults for non-default FramePacing configuration. Environment variables take precedence.", (uint8_t *)&v39, 2u);
  }

  v1 = getenv("FRAMEPACING_AGGREGATION_WINDOW_IN_SECONDS");
  if (!v1)
  {
LABEL_11:
    v6 = [MEMORY[0x263EFFA40] standardUserDefaults];
    double v7 = [v6 objectForKey:kFPAggregationIntervalSecondsDefaultsVariableName];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [*(id *)&v7 doubleValue];
      double v9 = v8;
      v10 = _fpConfigurationHandle();
      BOOL v11 = os_signpost_enabled(v10);
      if (v9 > 0.0)
      {
        if (v11)
        {
          [*(id *)&v7 doubleValue];
          int v39 = 134349056;
          double v40 = v12;
          _os_signpost_emit_with_name_impl(&dword_24F441000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "AggregationWindowConfiguration", "Aggregation window from environment variable: %{public, name=aggregation_window_seconds}f", (uint8_t *)&v39, 0xCu);
        }

        id v13 = *(id *)&v7;
LABEL_26:

        if (!v13) {
          goto LABEL_30;
        }
        goto LABEL_27;
      }
      if (v11)
      {
        [*(id *)&v7 doubleValue];
        int v39 = 134349056;
        double v40 = v15;
        v14 = "Invalid defaults-based aggregation window value: %{public, name=invalid_aggregation_window_seconds}f";
        goto LABEL_24;
      }
    }
    else
    {
      v10 = _fpConfigurationHandle();
      if (os_signpost_enabled(v10))
      {
        int v39 = 138543362;
        double v40 = v7;
        v14 = "Invalid defaults-based aggregation window value: %{public, name=invalid_aggregation_window_seconds}@";
LABEL_24:
        _os_signpost_emit_with_name_impl(&dword_24F441000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "AggregationWindowConfigurationError", v14, (uint8_t *)&v39, 0xCu);
      }
    }

    id v13 = 0;
    goto LABEL_26;
  }
  double v2 = strtod(v1, 0);
  v3 = _fpConfigurationHandle();
  BOOL v4 = os_signpost_enabled(v3);
  if (v2 < 0.1 || v2 > 20.0)
  {
    if (v4)
    {
      int v39 = 134349056;
      double v40 = v2;
      _os_signpost_emit_with_name_impl(&dword_24F441000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "AggregationWindowConfigurationError", "Invalid aggregation window from environment variable: %{public, name=invalid_aggregation_window_seconds}f. Checking defaults...", (uint8_t *)&v39, 0xCu);
    }

    goto LABEL_11;
  }
  if (v4)
  {
    int v39 = 134349056;
    double v40 = v2;
    _os_signpost_emit_with_name_impl(&dword_24F441000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "AggregationWindowConfiguration", "Aggregation window from environment variable: %{public, name=aggregation_window_seconds}f", (uint8_t *)&v39, 0xCu);
  }

  id v13 = [NSNumber numberWithDouble:v2];
  if (v13)
  {
LABEL_27:
    double v16 = _FPGetCurrentAggregationIntervalSeconds();
    [v13 doubleValue];
    double v18 = _FPConfigurationSetAggregationInterval(v17);
    v19 = _fpConfigurationHandle();
    if (os_signpost_enabled(v19))
    {
      int v39 = 134349312;
      double v40 = v16;
      __int16 v41 = 2050;
      double v42 = v18;
      _os_signpost_emit_with_name_impl(&dword_24F441000, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "UpdatedAggregationInterval", "Updated aggregation window %{public, name=previous_window_sec}.3fsec -> %{public, name=new_window_sec}.3fsec", (uint8_t *)&v39, 0x16u);
    }
  }
LABEL_30:

  v20 = getenv("FRAMEPACING_PER_DRAWABLE_SIGNPOSTS");
  if (v20)
  {
    uint64_t v21 = strtol(v20, 0, 0);
    v22 = (void *)MEMORY[0x263EFFA88];
    if (!v21) {
      v22 = (void *)MEMORY[0x263EFFA80];
    }
    double v23 = COERCE_DOUBLE(v22);
    v24 = _fpConfigurationHandle();
    if (os_signpost_enabled(v24))
    {
      int v25 = [*(id *)&v23 BOOLValue];
      int v39 = 67240192;
      LODWORD(v40) = v25;
      _os_signpost_emit_with_name_impl(&dword_24F441000, v24, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PerDrawableSignpostConfiguration", "Per-drawable signpost configured via environment variable: %{public, name=per_drawable_signpost_enabled}u", (uint8_t *)&v39, 8u);
    }

    goto LABEL_36;
  }
  v35 = [MEMORY[0x263EFFA40] standardUserDefaults];
  double v23 = [v35 objectForKey:kFPEnableDrawableSignpostingDefaultsVariableName];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v28 = _fpConfigurationHandle();
    if (os_signpost_enabled(v28))
    {
      int v39 = 138543362;
      double v40 = v23;
      v31 = "PerDrawableSignpostConfigurationError";
      v32 = "Invalid default value type: %{public, name=per_drawable_signpost_enabled}@";
      v33 = v28;
      uint32_t v34 = 12;
LABEL_50:
      _os_signpost_emit_with_name_impl(&dword_24F441000, v33, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v31, v32, (uint8_t *)&v39, v34);
    }
LABEL_51:

    return;
  }
  uint64_t v36 = [*(id *)&v23 BOOLValue];
  v37 = _fpConfigurationHandle();
  if (os_signpost_enabled(v37))
  {
    int v39 = 67240192;
    LODWORD(v40) = v36;
    _os_signpost_emit_with_name_impl(&dword_24F441000, v37, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PerDrawableSignpostConfiguration", "Per-drawable signpost configured via 'FramePacingPerDrawableSignposts' default: %{public, name=per_drawable_signpost_enabled}u", (uint8_t *)&v39, 8u);
  }

  uint64_t v38 = [NSNumber numberWithBool:v36];

  double v23 = *(double *)&v38;
  if (v38)
  {
LABEL_36:
    int v26 = _FPGetCurrentPerDrawableSignpostingEnabled();
    int v27 = _FPConfigurationSetPerDrawableSignpostingEnabled([*(id *)&v23 BOOLValue]);
    v28 = _fpConfigurationHandle();
    if (os_signpost_enabled(v28))
    {
      *(double *)&v29 = COERCE_DOUBLE("NO");
      if (v26) {
        *(double *)&v30 = COERCE_DOUBLE("YES");
      }
      else {
        *(double *)&v30 = COERCE_DOUBLE("NO");
      }
      if (v27) {
        *(double *)&v29 = COERCE_DOUBLE("YES");
      }
      int v39 = 136446466;
      double v40 = *(double *)&v30;
      __int16 v41 = 2082;
      double v42 = *(double *)&v29;
      v31 = "UpdatedPerDrawableSignpostingEnabled";
      v32 = "Updated per-drawable signposting: %{public, name=previous_per_drawable_signposts_enabled}s -> %{public, name"
            "=updated_per_drawable_signposts_enabled}s";
      v33 = v28;
      uint32_t v34 = 22;
      goto LABEL_50;
    }
    goto LABEL_51;
  }
}

@end