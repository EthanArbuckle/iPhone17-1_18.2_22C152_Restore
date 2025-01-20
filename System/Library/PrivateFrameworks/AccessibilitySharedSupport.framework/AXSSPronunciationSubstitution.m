@interface AXSSPronunciationSubstitution
- (BOOL)active;
- (BOOL)appliesToAllApps;
- (BOOL)ignoreCase;
- (BOOL)isEqualToSubstitution:(id)a3;
- (BOOL)isUserSubstitution;
- (NSSet)bundleIdentifiers;
- (NSSet)languages;
- (NSSet)voiceIds;
- (NSString)originalString;
- (NSString)phonemes;
- (NSString)replacementString;
- (_NSRange)replacementRange;
- (void)setActive:(BOOL)a3;
- (void)setAppliesToAllApps:(BOOL)a3;
- (void)setBundleIdentifiers:(id)a3;
- (void)setIgnoreCase:(BOOL)a3;
- (void)setIsUserSubstitution:(BOOL)a3;
- (void)setLanguages:(id)a3;
- (void)setOriginalString:(id)a3;
- (void)setPhonemes:(id)a3;
- (void)setReplacementRange:(_NSRange)a3;
- (void)setReplacementString:(id)a3;
- (void)setVoiceIds:(id)a3;
@end

@implementation AXSSPronunciationSubstitution

- (BOOL)isEqualToSubstitution:(id)a3
{
  id v4 = a3;
  v5 = [(AXSSPronunciationSubstitution *)self originalString];
  v6 = [v4 originalString];

  LOBYTE(v4) = [v5 isEqualToString:v6];
  return (char)v4;
}

- (NSString)originalString
{
  return self->_originalString;
}

- (void)setOriginalString:(id)a3
{
}

- (NSString)replacementString
{
  return self->_replacementString;
}

- (void)setReplacementString:(id)a3
{
}

- (NSString)phonemes
{
  return self->_phonemes;
}

- (void)setPhonemes:(id)a3
{
}

- (NSSet)languages
{
  return self->_languages;
}

- (void)setLanguages:(id)a3
{
}

- (NSSet)voiceIds
{
  return self->_voiceIds;
}

- (void)setVoiceIds:(id)a3
{
}

- (BOOL)active
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BOOL)ignoreCase
{
  return self->_ignoreCase;
}

- (void)setIgnoreCase:(BOOL)a3
{
  self->_ignoreCase = a3;
}

- (_NSRange)replacementRange
{
  NSUInteger length = self->_replacementRange.length;
  NSUInteger location = self->_replacementRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setReplacementRange:(_NSRange)a3
{
  self->_replacementRange = a3;
}

- (BOOL)appliesToAllApps
{
  return self->_appliesToAllApps;
}

- (void)setAppliesToAllApps:(BOOL)a3
{
  self->_appliesToAllApps = a3;
}

- (NSSet)bundleIdentifiers
{
  return self->_bundleIdentifiers;
}

- (void)setBundleIdentifiers:(id)a3
{
}

- (BOOL)isUserSubstitution
{
  return self->_isUserSubstitution;
}

- (void)setIsUserSubstitution:(BOOL)a3
{
  self->_isUserSubstitution = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_voiceIds, 0);
  objc_storeStrong((id *)&self->_languages, 0);
  objc_storeStrong((id *)&self->_phonemes, 0);
  objc_storeStrong((id *)&self->_replacementString, 0);

  objc_storeStrong((id *)&self->_originalString, 0);
}

@end