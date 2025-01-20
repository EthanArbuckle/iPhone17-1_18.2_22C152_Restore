@interface HMDHPSAPIConformanceProviding
+ (BOOL)objectRespondsToHPSBooleanSettingProtocolMethods:(id)a3;
+ (BOOL)objectRespondsToHPSConstrainedNumberSettingProtocolMethods:(id)a3;
+ (BOOL)objectRespondsToHPSLanguageValueProtocolMethods:(id)a3;
+ (BOOL)objectRespondsToHPSNumberSettingProtocolMethods:(id)a3;
+ (BOOL)objectRespondsToHPSSettingProtocolMethods:(id)a3;
+ (BOOL)objectRespondsToHPSSiriAvailableLanguagesProtocolMethods:(id)a3;
+ (BOOL)objectRespondsToHPSSiriLanguageSettingProtocolMethods:(id)a3;
+ (BOOL)objectRespondsToHPSStringSettingProtocolMethods:(id)a3;
@end

@implementation HMDHPSAPIConformanceProviding

+ (BOOL)objectRespondsToHPSConstrainedNumberSettingProtocolMethods:(id)a3
{
  id v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    char v5 = [a1 objectRespondsToHPSNumberSettingProtocolMethods:v4];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

+ (BOOL)objectRespondsToHPSNumberSettingProtocolMethods:(id)a3
{
  id v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    char v5 = [a1 objectRespondsToHPSSettingProtocolMethods:v4];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

+ (BOOL)objectRespondsToHPSBooleanSettingProtocolMethods:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    char v5 = [a1 objectRespondsToHPSSettingProtocolMethods:v4];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

+ (BOOL)objectRespondsToHPSStringSettingProtocolMethods:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    char v5 = [a1 objectRespondsToHPSSettingProtocolMethods:v4];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

+ (BOOL)objectRespondsToHPSSiriLanguageSettingProtocolMethods:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    char v5 = [a1 objectRespondsToHPSSettingProtocolMethods:v4];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

+ (BOOL)objectRespondsToHPSSettingProtocolMethods:(id)a3
{
  return objc_opt_respondsToSelector() & 1;
}

+ (BOOL)objectRespondsToHPSLanguageValueProtocolMethods:(id)a3
{
  id v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    char v4 = objc_opt_respondsToSelector();
  }
  else
  {
    char v4 = 0;
  }

  return v4 & 1;
}

+ (BOOL)objectRespondsToHPSSiriAvailableLanguagesProtocolMethods:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    char v5 = [a1 objectRespondsToHPSSettingProtocolMethods:v4];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

@end