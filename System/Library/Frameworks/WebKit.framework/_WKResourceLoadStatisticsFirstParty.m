@interface _WKResourceLoadStatisticsFirstParty
- (BOOL)storageAccess;
- (BOOL)thirdPartyStorageAccessGranted;
- (NSString)firstPartyDomain;
- (Object)_apiObject;
- (double)timeLastUpdated;
- (void)dealloc;
@end

@implementation _WKResourceLoadStatisticsFirstParty

- (void)dealloc
{
  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    API::ResourceLoadStatisticsFirstParty::~ResourceLoadStatisticsFirstParty((WTF::StringImpl **)&self->_firstParty);
    v4.receiver = self;
    v4.super_class = (Class)_WKResourceLoadStatisticsFirstParty;
    [(_WKResourceLoadStatisticsFirstParty *)&v4 dealloc];
  }
}

- (NSString)firstPartyDomain
{
  if (*(void *)&self->_firstParty.data.__lx[16]) {
    return (NSString *)WTF::StringImpl::operator NSString *();
  }
  else {
    return (NSString *)&stru_1EEA10550;
  }
}

- (BOOL)storageAccess
{
  return self->_firstParty.data.__lx[24];
}

- (double)timeLastUpdated
{
  return *(double *)&self->_firstParty.data.__lx[32];
}

- (Object)_apiObject
{
  return (Object *)&self->_firstParty;
}

- (BOOL)thirdPartyStorageAccessGranted
{
  return self->_firstParty.data.__lx[40];
}

@end