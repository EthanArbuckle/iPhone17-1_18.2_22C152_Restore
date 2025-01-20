@interface HDAppSubscription
- (HDAppSubscription)init;
- (HDAppSubscription)initWithBundleIdentifier:(id)a3 dataCode:(int64_t)a4;
- (HKObjectType)objectType;
- (NSString)bundleIdentifier;
- (int64_t)dataCode;
- (int64_t)lastAckTime;
- (int64_t)launchTimeHysteresis;
- (unint64_t)lastAnchor;
- (unint64_t)lastAssociationAnchor;
- (unint64_t)updateFrequency;
- (void)setLastAckTime:(int64_t)a3;
- (void)setLastAnchor:(unint64_t)a3;
- (void)setLastAssociationAnchor:(unint64_t)a3;
- (void)setLaunchTimeHysteresis:(int64_t)a3;
- (void)setUpdateFrequency:(unint64_t)a3;
@end

@implementation HDAppSubscription

- (HDAppSubscription)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDAppSubscription)initWithBundleIdentifier:(id)a3 dataCode:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDAppSubscription;
  v8 = [(HDAppSubscription *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_bundleIdentifier, a3);
    v9->_dataCode = a4;
  }

  return v9;
}

- (HKObjectType)objectType
{
  if (_HKValidDataTypeCode())
  {
    v3 = [MEMORY[0x1E4F2B2C0] dataTypeWithCode:self->_dataCode];
  }
  else
  {
    v3 = 0;
  }

  return (HKObjectType *)v3;
}

- (void)setUpdateFrequency:(unint64_t)a3
{
  self->_updateFrequency = a3;
}

- (void)setLastAckTime:(int64_t)a3
{
  self->_lastAckTime = a3;
}

- (void)setLastAnchor:(unint64_t)a3
{
  self->_lastAnchor = a3;
}

- (void)setLaunchTimeHysteresis:(int64_t)a3
{
  self->_launchTimeHysteresis = a3;
}

- (void)setLastAssociationAnchor:(unint64_t)a3
{
  self->_lastAssociationAnchor = a3;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (int64_t)dataCode
{
  return self->_dataCode;
}

- (unint64_t)updateFrequency
{
  return self->_updateFrequency;
}

- (unint64_t)lastAnchor
{
  return self->_lastAnchor;
}

- (int64_t)lastAckTime
{
  return self->_lastAckTime;
}

- (int64_t)launchTimeHysteresis
{
  return self->_launchTimeHysteresis;
}

- (unint64_t)lastAssociationAnchor
{
  return self->_lastAssociationAnchor;
}

- (void).cxx_destruct
{
}

@end