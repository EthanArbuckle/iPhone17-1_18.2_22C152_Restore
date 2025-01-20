@interface DDRTaskDisableAirplaneMode
- (RadiosPreferences)radioPreference;
- (double)estimatedTimeOfCompletion;
- (id)identifier;
- (void)run;
- (void)setRadioPreference:(id)a3;
@end

@implementation DDRTaskDisableAirplaneMode

- (RadiosPreferences)radioPreference
{
  radioPreference = self->_radioPreference;
  if (!radioPreference)
  {
    v4 = (RadiosPreferences *)objc_alloc_init((Class)RadiosPreferences);
    v5 = self->_radioPreference;
    self->_radioPreference = v4;

    [(RadiosPreferences *)self->_radioPreference refresh];
    radioPreference = self->_radioPreference;
  }
  return radioPreference;
}

- (void)run
{
  id v2 = [(DDRTaskDisableAirplaneMode *)self radioPreference];
  [v2 setAirplaneMode:0];
}

- (id)identifier
{
  return @"com.apple.devicedatareset.disableAirplaneMode";
}

- (double)estimatedTimeOfCompletion
{
  return 0.1;
}

- (void)setRadioPreference:(id)a3
{
}

- (void).cxx_destruct
{
}

@end