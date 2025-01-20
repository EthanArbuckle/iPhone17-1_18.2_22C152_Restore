@interface BRCErrorGrouping
- (BOOL)isEnhancedDrivePrivacyEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToErrorGrouping:(id)a3;
- (BOOL)isPCSChained;
- (BRCErrorGrouping)initWithError:(id)a3 pcsChained:(BOOL)a4 enhancedDrivePrivacyEnabled:(BOOL)a5;
- (NSError)error;
- (id)description;
- (unint64_t)hash;
@end

@implementation BRCErrorGrouping

- (BRCErrorGrouping)initWithError:(id)a3 pcsChained:(BOOL)a4 enhancedDrivePrivacyEnabled:(BOOL)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BRCErrorGrouping;
  v10 = [(BRCErrorGrouping *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_error, a3);
    v11->_isPCSChained = a4;
    v11->_isEnhancedDrivePrivacyEnabled = a5;
  }

  return v11;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = "y";
  if (self->_isPCSChained) {
    v6 = "y";
  }
  else {
    v6 = "n";
  }
  if (!self->_isEnhancedDrivePrivacyEnabled) {
    v5 = "n";
  }
  return (id)[v3 stringWithFormat:@"<%@ error:%@ pcs:%s enhancedDrivePrivacyEnabled:%s>", v4, self->_error, v6, v5];
}

- (unint64_t)hash
{
  v3 = [(NSError *)self->_error domain];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(NSError *)self->_error code] + v4;

  if (self->_isPCSChained) {
    return -(uint64_t)v5;
  }
  else {
    return v5;
  }
}

- (BOOL)isEqualToErrorGrouping:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(NSError *)self->_error domain];
  v6 = [v4 error];
  v7 = [v6 domain];
  if ([v5 isEqualToString:v7])
  {
    NSInteger v8 = [(NSError *)self->_error code];
    id v9 = [v4 error];
    if (v8 == [v9 code]
      && (int isPCSChained = self->_isPCSChained, isPCSChained == [v4 isPCSChained]))
    {
      int isEnhancedDrivePrivacyEnabled = self->_isEnhancedDrivePrivacyEnabled;
      BOOL v12 = isEnhancedDrivePrivacyEnabled == [v4 isEnhancedDrivePrivacyEnabled];
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(BRCErrorGrouping *)self isEqualToErrorGrouping:v4];

  return v5;
}

- (NSError)error
{
  return self->_error;
}

- (BOOL)isPCSChained
{
  return self->_isPCSChained;
}

- (BOOL)isEnhancedDrivePrivacyEnabled
{
  return self->_isEnhancedDrivePrivacyEnabled;
}

- (void).cxx_destruct
{
}

@end