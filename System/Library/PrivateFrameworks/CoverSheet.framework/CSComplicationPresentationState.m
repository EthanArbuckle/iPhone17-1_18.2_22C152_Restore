@interface CSComplicationPresentationState
- (BOOL)isEqual:(id)a3;
- (BOOL)isPresenterVisible;
- (BOOL)isScreenOff;
- (BOOL)shouldPresentLandscapeComplications;
- (_BYTE)initWithVisibility:(char)a3 isScreenOff:(uint64_t)a4 backlightLuminance:(uint64_t)a5 interfaceOrientation:;
- (id)description;
- (uint64_t)backlightLuminance;
- (uint64_t)interfaceOrientation;
- (uint64_t)isEqualToComplicationPresentationState:(uint64_t)a1;
- (uint64_t)suggestedComplicationPresentationMode;
- (void)_hydrateSuggestedPresentationMode;
@end

@implementation CSComplicationPresentationState

- (_BYTE)initWithVisibility:(char)a3 isScreenOff:(uint64_t)a4 backlightLuminance:(uint64_t)a5 interfaceOrientation:
{
  if (!a1) {
    return 0;
  }
  v12.receiver = a1;
  v12.super_class = (Class)CSComplicationPresentationState;
  v9 = objc_msgSendSuper2(&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    v9[8] = a2;
    v9[9] = a3;
    *((void *)v9 + 2) = a4;
    *((void *)v9 + 3) = a5;
    [v9 _hydrateSuggestedPresentationMode];
  }
  return v10;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendBool:self->_presenterVisible withName:@"isPresenterVisible"];
  id v5 = (id)[v3 appendBool:self->_screenOff withName:@"isScreenOff"];
  unint64_t v6 = self->_backlightLuminance + 1;
  if (v6 > 3) {
    v7 = @"Invalid Backlight Luminance specified";
  }
  else {
    v7 = off_1E6ADA8F8[v6];
  }
  [v3 appendString:v7 withName:@"_backlightLuminance"];
  v8 = SBFStringForBSInterfaceOrientation();
  [v3 appendString:v8 withName:@"_interfaceOrientation"];

  unint64_t suggestedComplicationPresentationMode = self->_suggestedComplicationPresentationMode;
  if (suggestedComplicationPresentationMode > 3) {
    v10 = @"Invalid Mode Defined";
  }
  else {
    v10 = off_1E6ADA918[suggestedComplicationPresentationMode];
  }
  [v3 appendString:v10 withName:@"suggestedPortraitPresentationMode"];
  id v11 = (id)[v3 appendBool:self->_shouldPresentLandscapeComplications withName:@"shouldPresentLandscapeComplications"];
  objc_super v12 = [v3 build];

  return v12;
}

- (uint64_t)suggestedComplicationPresentationMode
{
  if (result) {
    return *(void *)(result + 32);
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CSComplicationPresentationState *)a3;
  id v5 = v4;
  if (self == v4)
  {
    char v6 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char v6 = -[CSComplicationPresentationState isEqualToComplicationPresentationState:]((uint64_t)self, v5);
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (uint64_t)isEqualToComplicationPresentationState:(uint64_t)a1
{
  v3 = a2;
  if (a1)
  {
    if (v3)
    {
      if ((v3[8] != 0) != (*(unsigned char *)(a1 + 8) != 0)
        || *((void *)v3 + 2) != *(void *)(a1 + 16)
        || (v3[9] != 0) != (*(unsigned char *)(a1 + 9) != 0))
      {
LABEL_6:
        a1 = 0;
        goto LABEL_7;
      }
      uint64_t v5 = *((void *)v3 + 3);
    }
    else
    {
      if (*(unsigned char *)(a1 + 8) || *(void *)(a1 + 16) || *(unsigned char *)(a1 + 9)) {
        goto LABEL_6;
      }
      uint64_t v5 = 0;
    }
    a1 = v5 == *(void *)(a1 + 24);
  }
LABEL_7:

  return a1;
}

- (BOOL)isPresenterVisible
{
  if (result) {
    return *(unsigned char *)(result + 8) != 0;
  }
  return result;
}

- (uint64_t)backlightLuminance
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

- (BOOL)isScreenOff
{
  if (result) {
    return *(unsigned char *)(result + 9) != 0;
  }
  return result;
}

- (uint64_t)interfaceOrientation
{
  if (result) {
    return *(void *)(result + 24);
  }
  return result;
}

- (void)_hydrateSuggestedPresentationMode
{
  if (self)
  {
    int64_t backlightLuminance = self->_backlightLuminance;
    BOOL screenOff = self->_screenOff;
    BOOL presenterVisible = self->_presenterVisible;
  }
  else
  {
    BOOL screenOff = 0;
    int64_t backlightLuminance = 0;
    BOOL presenterVisible = 0;
  }
  char v6 = [MEMORY[0x1E4F4F7D0] sharedInstance];
  int v7 = [v6 deviceClass];

  if (presenterVisible && backlightLuminance >= 1) {
    unint64_t v8 = 2;
  }
  else {
    unint64_t v8 = 1;
  }
  self->_unint64_t suggestedComplicationPresentationMode = v8;
  self->_shouldPresentLandscapeComplications = BSInterfaceOrientationIsLandscape()
                                            && v7 == 2
                                            && !screenOff
                                            && self->_suggestedComplicationPresentationMode == 2;
}

- (BOOL)shouldPresentLandscapeComplications
{
  if (result) {
    return *(unsigned char *)(result + 10) != 0;
  }
  return result;
}

@end