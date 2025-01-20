@interface UIView
- (BOOL)_accessibilityAncestorMatchesBlock:(id)a3;
- (BOOL)_accessibilityAppliesInvertColors;
- (BOOL)_accessibilityAppliesInvertColorsInDarkUI;
- (BOOL)_accessibilityInvertEnabled;
- (BOOL)_accessibilityShouldApplyInvertColorsInDarkUI;
- (BOOL)accessibilityAppliesInvertColorsInDarkUI;
- (id)accessibilityInvertEnabledOverride;
- (void)_accessibilityApplyInvertFilter;
- (void)_setAccessibilityInvertState:(int)a3;
- (void)setAccessibilityInvertEnabledOverride:(id)a3;
@end

@implementation UIView

- (id)accessibilityInvertEnabledOverride
{
  return (id)___UIAccessibilityGetAssociatedObject(self, &unk_83628);
}

- (void)setAccessibilityInvertEnabledOverride:(id)a3
{
}

- (BOOL)_accessibilityInvertEnabled
{
  uint64_t v3 = [(UIView *)self accessibilityInvertEnabledOverride];
  if (!v3) {
    return _AXSInvertColorsEnabled() != 0;
  }
  v4 = (void *)v3;
  v5 = [(UIView *)self accessibilityInvertEnabledOverride];
  id v6 = [v5 integerValue];

  if (v6 == (id)-1) {
    return _AXSInvertColorsEnabled() != 0;
  }
  v7 = [(UIView *)self accessibilityInvertEnabledOverride];
  BOOL v8 = [v7 integerValue] == (char *)&dword_0 + 1;

  return v8;
}

- (void)_setAccessibilityInvertState:(int)a3
{
  v4 = +[NSNumber numberWithInt:*(void *)&a3];
  [(UIView *)self setAccessibilityInvertEnabledOverride:v4];

  +[AXInvertColorsAppHelper toggleInvertColors:self];
}

- (BOOL)_accessibilityAppliesInvertColors
{
  BOOL v3 = [(UIView *)self accessibilityIgnoresInvertColors];
  if (v3)
  {
    LOBYTE(v3) = [(UIView *)self _accessibilityInvertEnabled];
  }
  return v3;
}

- (BOOL)_accessibilityShouldApplyInvertColorsInDarkUI
{
  return 0;
}

- (BOOL)_accessibilityAppliesInvertColorsInDarkUI
{
  if (![(UIView *)self accessibilityAppliesInvertColorsInDarkUI]
    || ![(UIView *)self _accessibilityInvertEnabled])
  {
    return 0;
  }

  return [(UIView *)self _accessibilityShouldApplyInvertColorsInDarkUI];
}

- (BOOL)accessibilityAppliesInvertColorsInDarkUI
{
  return 0;
}

- (void)_accessibilityApplyInvertFilter
{
  BOOL v3 = [(UIView *)self window];
  v4 = v3;
  if (v3)
  {
    v5 = [v3 screen];
    unsigned __int8 v6 = [v5 _isCarScreen];

    if ((v6 & 1) == 0)
    {
      v7 = [v4 traitCollection];
      if ([v7 userInterfaceStyle] == (char *)&dword_0 + 2) {
        unsigned int v8 = [(UIView *)self _accessibilityInvertColorsSupportsDarkWindowInvert];
      }
      else {
        unsigned int v8 = 0;
      }

      unsigned int v9 = [v4 _accessibilityInvertColorsIsInHostedDarkWindow];
      if ([(UIView *)self _accessibilityAppliesInvertColors]
        && ([(UIView *)self safeBoolForKey:@"_ancestorHasInvertFilterApplied"] & 1) == 0)
      {
        unsigned int v10 = (v8 | v9) ^ 1;
      }
      else
      {
        unsigned int v10 = 0;
      }
      if ([(UIView *)self _accessibilityAppliesInvertColorsInDarkUI]) {
        v10 |= v8 | v9;
      }
      uint64_t v11 = [(UIView *)self accessibilityInvertEnabledOverride];
      if (v11)
      {
        v12 = (void *)v11;
        v13 = [(UIView *)self accessibilityInvertEnabledOverride];
        id v14 = [v13 integerValue];

        if (v14 != (id)-1)
        {
          v15 = +[AXSubsystemInvertColors sharedInstance];
          unsigned __int8 v16 = [v15 ignoreLogging];

          if ((v16 & 1) == 0)
          {
            v17 = +[AXSubsystemInvertColors identifier];
            v18 = AXLoggerForFacility();

            os_log_type_t v19 = AXOSLogLevelFromAXLogLevel();
            if (os_log_type_enabled(v18, v19))
            {
              v20 = AXColorizeFormatLog();
              [(UIView *)self accessibilityInvertEnabledOverride];
              uint64_t v27 = v10;
              v26 = v28 = self;
              v21 = _AXStringForArgs();

              if (os_log_type_enabled(v18, v19))
              {
                *(_DWORD *)buf = 138543362;
                v30 = v21;
                _os_log_impl(&dword_0, v18, v19, "%{public}@", buf, 0xCu);
              }
            }
          }
        }
      }
      if (v10)
      {
        v22 = [(UIView *)self accessibilityInvertEnabledOverride];
        if ([v22 integerValue] == (char *)&dword_0 + 1) {
          uint64_t v23 = 2;
        }
        else {
          uint64_t v23 = 1;
        }
      }
      else
      {
        uint64_t v23 = 0;
      }
      v24 = [(UIView *)self layer];
      id v25 = +[AXInvertColorsAppHelper _accessibilityUpdateInvertColorsFilters:v24 traverseAncestors:0 updateType:v23];
    }
  }
}

- (BOOL)_accessibilityAncestorMatchesBlock:(id)a3
{
  v4 = (uint64_t (**)(id, void *))a3;
  uint64_t v5 = [(UIView *)self superview];
  if (v5)
  {
    unsigned __int8 v6 = (void *)v5;
    do
    {
      char v7 = v4[2](v4, v6);
      if (v7) {
        break;
      }
      uint64_t v8 = [v6 superview];

      unsigned __int8 v6 = (void *)v8;
    }
    while (v8);
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

@end