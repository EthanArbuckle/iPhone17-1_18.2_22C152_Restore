@interface _ADDomainObjectCacheEntry
- (NSDictionary)aceDictionary;
- (NSString)oldId;
- (void)setAceDictionary:(id)a3;
- (void)setOldId:(id)a3;
@end

@implementation _ADDomainObjectCacheEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oldId, 0);
  objc_storeStrong((id *)&self->_aceDictionary, 0);
}

- (void)setOldId:(id)a3
{
}

- (NSString)oldId
{
  return self->_oldId;
}

- (void)setAceDictionary:(id)a3
{
}

- (NSDictionary)aceDictionary
{
  return self->_aceDictionary;
}

@end