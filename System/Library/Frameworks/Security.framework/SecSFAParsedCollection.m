@interface SecSFAParsedCollection
- (BOOL)excludedVersion;
- (NSMutableDictionary)allowedEvents;
- (NSMutableDictionary)matchingRules;
- (void)setAllowedEvents:(id)a3;
- (void)setExcludedVersion:(BOOL)a3;
- (void)setMatchingRules:(id)a3;
@end

@implementation SecSFAParsedCollection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedEvents, 0);

  objc_storeStrong((id *)&self->_matchingRules, 0);
}

- (void)setExcludedVersion:(BOOL)a3
{
  self->_excludedVersion = a3;
}

- (BOOL)excludedVersion
{
  return self->_excludedVersion;
}

- (void)setAllowedEvents:(id)a3
{
}

- (NSMutableDictionary)allowedEvents
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMatchingRules:(id)a3
{
}

- (NSMutableDictionary)matchingRules
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

@end