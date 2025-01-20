@interface IDSCTAdapterCache
- (NSArray)sims;
- (id)debugDescription;
- (unint64_t)doesAnySIMSupportsSimultaneousVoiceAndDataRightNow;
- (unint64_t)dualSIMEnabled;
- (unint64_t)isAnySIMInserted;
- (unint64_t)isAnySIMUsable;
- (unint64_t)supportsIdentification;
- (void)setDoesAnySIMSupportsSimultaneousVoiceAndDataRightNow:(unint64_t)a3;
- (void)setDualSIMEnabled:(unint64_t)a3;
- (void)setIsAnySIMInserted:(unint64_t)a3;
- (void)setIsAnySIMUsable:(unint64_t)a3;
- (void)setSims:(id)a3;
- (void)setSupportsIdentification:(unint64_t)a3;
@end

@implementation IDSCTAdapterCache

- (id)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = @"YES";
  unint64_t dualSIMEnabled = self->_dualSIMEnabled;
  unint64_t isAnySIMUsable = self->_isAnySIMUsable;
  if (dualSIMEnabled == 2) {
    v8 = @"NO";
  }
  else {
    v8 = @"YES";
  }
  if (dualSIMEnabled) {
    v9 = v8;
  }
  else {
    v9 = @"NotSet";
  }
  if (isAnySIMUsable == 2) {
    v10 = @"NO";
  }
  else {
    v10 = @"YES";
  }
  if (isAnySIMUsable) {
    v11 = v10;
  }
  else {
    v11 = @"NotSet";
  }
  unint64_t isAnySIMInserted = self->_isAnySIMInserted;
  unint64_t supportsIdentification = self->_supportsIdentification;
  if (isAnySIMInserted == 2) {
    v14 = @"NO";
  }
  else {
    v14 = @"YES";
  }
  if (isAnySIMInserted) {
    v15 = v14;
  }
  else {
    v15 = @"NotSet";
  }
  if (supportsIdentification == 2) {
    v16 = @"NO";
  }
  else {
    v16 = @"YES";
  }
  if (!supportsIdentification) {
    v16 = @"NotSet";
  }
  unint64_t doesAnySIMSupportsSimultaneousVoiceAndDataRightNow = self->_doesAnySIMSupportsSimultaneousVoiceAndDataRightNow;
  sims = self->_sims;
  if (doesAnySIMSupportsSimultaneousVoiceAndDataRightNow == 2) {
    v5 = @"NO";
  }
  if (doesAnySIMSupportsSimultaneousVoiceAndDataRightNow) {
    v19 = v5;
  }
  else {
    v19 = @"NotSet";
  }
  v20 = v16;
  v21 = v15;
  v22 = v11;
  v23 = v9;
  v26 = objc_msgSend_stringWithFormat_(v3, v24, @"<%@: %p, dualSIM: %@, anyUsable: %@, anyInserted: %@, supportsID: %@, anySimul: %@, sims: %@>", v25, v4, self, v23, v22, v21, v20, v19, sims);

  return v26;
}

- (unint64_t)dualSIMEnabled
{
  return self->_dualSIMEnabled;
}

- (void)setDualSIMEnabled:(unint64_t)a3
{
  self->_unint64_t dualSIMEnabled = a3;
}

- (unint64_t)isAnySIMUsable
{
  return self->_isAnySIMUsable;
}

- (void)setIsAnySIMUsable:(unint64_t)a3
{
  self->_unint64_t isAnySIMUsable = a3;
}

- (unint64_t)isAnySIMInserted
{
  return self->_isAnySIMInserted;
}

- (void)setIsAnySIMInserted:(unint64_t)a3
{
  self->_unint64_t isAnySIMInserted = a3;
}

- (unint64_t)supportsIdentification
{
  return self->_supportsIdentification;
}

- (void)setSupportsIdentification:(unint64_t)a3
{
  self->_unint64_t supportsIdentification = a3;
}

- (unint64_t)doesAnySIMSupportsSimultaneousVoiceAndDataRightNow
{
  return self->_doesAnySIMSupportsSimultaneousVoiceAndDataRightNow;
}

- (void)setDoesAnySIMSupportsSimultaneousVoiceAndDataRightNow:(unint64_t)a3
{
  self->_unint64_t doesAnySIMSupportsSimultaneousVoiceAndDataRightNow = a3;
}

- (NSArray)sims
{
  return self->_sims;
}

- (void)setSims:(id)a3
{
}

- (void).cxx_destruct
{
}

@end