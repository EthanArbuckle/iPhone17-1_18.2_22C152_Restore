@interface CAMCinematicFocusCommand
- (BOOL)_useFixedOpticalFocus;
- (BOOL)_useHardFocus;
- (CAMCinematicFocusCommand)initWithMetadataObjectID:(int64_t)a3 atPointOfInterest:(CGPoint)a4 useFixedOpticalFocus:(BOOL)a5 useHardFocus:(BOOL)a6;
- (CGPoint)_pointOfInterest;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_metadataObjectID;
- (void)executeWithContext:(id)a3;
@end

@implementation CAMCinematicFocusCommand

- (CAMCinematicFocusCommand)initWithMetadataObjectID:(int64_t)a3 atPointOfInterest:(CGPoint)a4 useFixedOpticalFocus:(BOOL)a5 useHardFocus:(BOOL)a6
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  v15.receiver = self;
  v15.super_class = (Class)CAMCinematicFocusCommand;
  v11 = [(CAMCaptureCommand *)&v15 initWithSubcommands:0];
  v12 = v11;
  if (v11)
  {
    v11->__metadataObjectID = a3;
    v11->__pointOfInterest.CGFloat x = x;
    v11->__pointOfInterest.CGFloat y = y;
    v11->__useFixedOpticalFocus = a5;
    v11->__useHardFocus = a6;
    v13 = v11;
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CAMCinematicFocusCommand;
  v4 = [(CAMCaptureCommand *)&v8 copyWithZone:a3];
  v4[4] = [(CAMCinematicFocusCommand *)self _metadataObjectID];
  [(CAMCinematicFocusCommand *)self _pointOfInterest];
  v4[5] = v5;
  v4[6] = v6;
  *((unsigned char *)v4 + 24) = [(CAMCinematicFocusCommand *)self _useFixedOpticalFocus];
  *((unsigned char *)v4 + 25) = [(CAMCinematicFocusCommand *)self _useHardFocus];
  return v4;
}

- (void)executeWithContext:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v4 = [a3 currentVideoDevice];
  if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    int v5 = [v4 isCinematicVideoFocusAtPointSupported];
    uint64_t v6 = os_log_create("com.apple.camera", "Camera");
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        [(CAMCinematicFocusCommand *)self _pointOfInterest];
        objc_super v8 = NSStringFromCGPoint(v25);
        int64_t v9 = [(CAMCinematicFocusCommand *)self _metadataObjectID];
        if ([(CAMCinematicFocusCommand *)self _useHardFocus]) {
          v10 = @"YES";
        }
        else {
          v10 = @"NO";
        }
        v11 = v10;
        if ([(CAMCinematicFocusCommand *)self _useFixedOpticalFocus]) {
          v12 = @"YES";
        }
        else {
          v12 = @"NO";
        }
        v13 = v12;
        int v16 = 138544130;
        v17 = v8;
        __int16 v18 = 2048;
        int64_t v19 = v9;
        __int16 v20 = 2114;
        v21 = v11;
        __int16 v22 = 2114;
        v23 = v13;
        _os_log_impl(&dword_2099F8000, v6, OS_LOG_TYPE_DEFAULT, "Requested to set CinematicVideoFocus at point:%{public}@ objectID:%ld isHardFocus:%{public}@ isFixedPlaneFocus:%{public}@", (uint8_t *)&v16, 0x2Au);
      }
      [(CAMCinematicFocusCommand *)self _pointOfInterest];
      objc_msgSend(v4, "setCinematicVideoFocusAtPoint:objectID:isHardFocus:isFixedPlaneFocus:", -[CAMCinematicFocusCommand _metadataObjectID](self, "_metadataObjectID"), -[CAMCinematicFocusCommand _useHardFocus](self, "_useHardFocus"), -[CAMCinematicFocusCommand _useFixedOpticalFocus](self, "_useFixedOpticalFocus"), v14, v15);
    }
    else
    {
      if (v7)
      {
        LOWORD(v16) = 0;
        _os_log_impl(&dword_2099F8000, v6, OS_LOG_TYPE_DEFAULT, "Attempting to set cinematic focus on a video device that does not support it", (uint8_t *)&v16, 2u);
      }
    }
  }
}

- (int64_t)_metadataObjectID
{
  return self->__metadataObjectID;
}

- (CGPoint)_pointOfInterest
{
  double x = self->__pointOfInterest.x;
  double y = self->__pointOfInterest.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)_useFixedOpticalFocus
{
  return self->__useFixedOpticalFocus;
}

- (BOOL)_useHardFocus
{
  return self->__useHardFocus;
}

@end