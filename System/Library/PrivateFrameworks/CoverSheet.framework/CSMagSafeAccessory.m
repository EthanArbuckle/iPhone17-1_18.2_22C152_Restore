@interface CSMagSafeAccessory
+ (CSMagSafeAccessory)accessoryWithType:(int64_t)a3 primaryColor:(id)a4 secondoryColor:(id)a5;
- (BOOL)_isSupportedFromDictionary:(id)a3;
- (BOOL)blocksAttachAnimationForAccessoryType:(int64_t)a3;
- (BOOL)blocksWallet;
- (BOOL)chimeOnDetach;
- (BOOL)hasStaticView;
- (BOOL)isSupported;
- (BOOL)isWindowed;
- (BOOL)shouldDelayAnimation;
- (BOOL)shouldLockScreenWhenAttached;
- (BOOL)shouldShowAnimation;
- (CGRect)visibleScreenCoordinates;
- (CSMagSafeAccessory)initWithDictionary:(id)a3 endpointUUID:(id)a4;
- (NSString)endpointUUID;
- (UIColor)primaryColor;
- (UIColor)secondaryColor;
- (double)_delayFromDictionary:(id)a3;
- (double)attachAnimationDelay;
- (id)accessoryTypeString;
- (id)colorForP3ColorData:(id)a3;
- (id)description;
- (int64_t)_accessoryTypeForNFCtype:(unsigned __int8)a3;
- (int64_t)type;
- (unsigned)_accessoryTypeFromDictionary:(id)a3;
- (void)setBlocksWallet:(BOOL)a3;
- (void)setEndpointUUID:(id)a3;
- (void)setIsSupported:(BOOL)a3;
- (void)setPrimaryColor:(id)a3;
- (void)setSecondaryColor:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation CSMagSafeAccessory

+ (CSMagSafeAccessory)accessoryWithType:(int64_t)a3 primaryColor:(id)a4 secondoryColor:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  v9 = objc_opt_new();
  [v9 setType:a3];
  [v9 setPrimaryColor:v8];

  [v9 setSecondaryColor:v7];

  return (CSMagSafeAccessory *)v9;
}

- (CSMagSafeAccessory)initWithDictionary:(id)a3 endpointUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)CSMagSafeAccessory;
  id v8 = [(CSMagSafeAccessory *)&v19 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_endpointUUID, a4);
    uint64_t v10 = [(CSMagSafeAccessory *)v9 _accessoryTypeFromDictionary:v6];
    v9->_type = [(CSMagSafeAccessory *)v9 _accessoryTypeForNFCtype:v10];
    v9->_isSupported = [(CSMagSafeAccessory *)v9 _isSupportedFromDictionary:v6];
    v9->_blocksWallet = [(CSMagSafeAccessory *)v9 _blocksWalletAnimationForNFCtype:v10];
    v11 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F5B188]];
    uint64_t v12 = [(CSMagSafeAccessory *)v9 colorForP3ColorData:v11];
    primaryColor = v9->_primaryColor;
    v9->_primaryColor = (UIColor *)v12;

    v14 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F5B190]];
    uint64_t v15 = [(CSMagSafeAccessory *)v9 colorForP3ColorData:v14];
    secondaryColor = v9->_secondaryColor;
    v9->_secondaryColor = (UIColor *)v15;

    [(CSMagSafeAccessory *)v9 _delayFromDictionary:v6];
    v9->_attachAnimationDelay = v17;
  }

  return v9;
}

- (BOOL)blocksAttachAnimationForAccessoryType:(int64_t)a3
{
  return a3 == 8 && self->_blocksWallet;
}

- (id)colorForP3ColorData:(id)a3
{
  id v3 = a3;
  if (([v3 length] & 0xFFFFFFFFFFFFFFF8) == 0x20)
  {
    v4 = (double *)[v3 bytes];
    v5 = [MEMORY[0x1E4F428B8] colorWithDisplayP3Red:*v4 green:v4[1] blue:v4[2] alpha:v4[3]];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)shouldLockScreenWhenAttached
{
  return self->_type == 6;
}

- (BOOL)isWindowed
{
  return self->_type == 6;
}

- (BOOL)shouldDelayAnimation
{
  [(CSMagSafeAccessory *)self attachAnimationDelay];
  return v2 > 0.0;
}

- (BOOL)shouldShowAnimation
{
  return (unint64_t)(self->_type - 2) < 7;
}

- (BOOL)hasStaticView
{
  return self->_type == 6;
}

- (BOOL)chimeOnDetach
{
  return self->_type == 8;
}

- (int64_t)_accessoryTypeForNFCtype:(unsigned __int8)a3
{
  if ((int)a3 <= 113)
  {
    int64_t result = 1;
    switch(a3)
    {
      case '9':
        goto LABEL_5;
      case ':':
      case ';':
      case '<':
      case '=':
      case '>':
      case '?':
      case '@':
      case 'F':
      case 'G':
      case 'H':
      case 'I':
      case 'J':
      case 'K':
      case 'O':
      case 'P':
      case 'Q':
      case 'R':
        goto LABEL_16;
      case 'A':
      case 'V':
        return 6;
      case 'B':
        return result;
      case 'C':
      case 'D':
      case 'E':
        goto LABEL_8;
      case 'L':
      case 'M':
      case 'N':
        return 3;
      case 'S':
      case 'T':
      case 'U':
        goto LABEL_7;
      case 'W':
      case 'X':
        return 8;
      default:
        if (a3) {
          goto LABEL_16;
        }
        v4 = SBLogCommon();
        BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

        if (v5) {
          NSLog(&cfstr_NotAValidAcces.isa);
        }
        goto LABEL_18;
    }
  }
  switch(a3)
  {
    case 0x90u:
      int64_t result = 7;
      break;
    case 0x91u:
LABEL_7:
      int64_t result = 5;
      break;
    case 0x92u:
    case 0x94u:
      goto LABEL_16;
    case 0x93u:
LABEL_5:
      int64_t result = 10;
      break;
    case 0x95u:
LABEL_8:
      int64_t result = 2;
      break;
    default:
      if (a3 == 114)
      {
        int64_t result = 4;
      }
      else
      {
LABEL_16:
        id v6 = SBLogCommon();
        BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);

        if (v7) {
          NSLog(&cfstr_NotImplemented.isa);
        }
LABEL_18:
        int64_t result = 0;
      }
      break;
  }
  return result;
}

- (unsigned)_accessoryTypeFromDictionary:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F5B1A0]];
  unsigned __int8 v4 = [v3 charValue];

  return v4;
}

- (BOOL)_isSupportedFromDictionary:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F5B198]];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (double)_delayFromDictionary:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F5B1A8]];
  double v4 = (double)(int)[v3 intValue] / 1000.0;

  return v4;
}

- (id)accessoryTypeString
{
  unint64_t type = self->_type;
  if (type > 0xA) {
    return @"Battery Pack";
  }
  else {
    return off_1E6AD9990[type];
  }
}

- (id)description
{
  id v3 = NSString;
  endpointUUID = self->_endpointUUID;
  uint64_t v5 = [(CSMagSafeAccessory *)self accessoryTypeString];
  id v6 = (void *)v5;
  secondaryColor = (UIColor *)@"N/A";
  primaryColor = self->_primaryColor;
  if (!primaryColor) {
    primaryColor = (UIColor *)@"N/A";
  }
  if (self->_secondaryColor) {
    secondaryColor = self->_secondaryColor;
  }
  v9 = [v3 stringWithFormat:@"Accessory endpointUUID: %@, type: %@, allows: %d, primary color: %@, secondary color: %@", endpointUUID, v5, self->_isSupported, primaryColor, secondaryColor];

  return v9;
}

- (CGRect)visibleScreenCoordinates
{
  if ([(CSMagSafeAccessory *)self isWindowed])
  {
    double v2 = +[CSMagSafeAccessoryConfiguration defaultConfiguration];
    [v2 visibleScreenCoordinatesForSleeve];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
  }
  else
  {
    double v4 = *MEMORY[0x1E4F1DB28];
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (NSString)endpointUUID
{
  return self->_endpointUUID;
}

- (void)setEndpointUUID:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_unint64_t type = a3;
}

- (UIColor)primaryColor
{
  return self->_primaryColor;
}

- (void)setPrimaryColor:(id)a3
{
}

- (UIColor)secondaryColor
{
  return self->_secondaryColor;
}

- (void)setSecondaryColor:(id)a3
{
}

- (BOOL)isSupported
{
  return self->_isSupported;
}

- (void)setIsSupported:(BOOL)a3
{
  self->_isSupported = a3;
}

- (double)attachAnimationDelay
{
  return self->_attachAnimationDelay;
}

- (BOOL)blocksWallet
{
  return self->_blocksWallet;
}

- (void)setBlocksWallet:(BOOL)a3
{
  self->_blocksWallet = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryColor, 0);
  objc_storeStrong((id *)&self->_primaryColor, 0);

  objc_storeStrong((id *)&self->_endpointUUID, 0);
}

@end