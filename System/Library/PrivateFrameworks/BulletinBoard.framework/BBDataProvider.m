@interface BBDataProvider
- (BBDataProviderIdentity)identity;
- (BOOL)canClearAllBulletins;
- (BOOL)canClearBulletinsByDate;
- (BOOL)canPerformMigration;
- (BOOL)initialized;
- (BOOL)migrateSectionInfo:(id)a3 oldSectionInfo:(id)a4;
- (BOOL)syncsBulletinDismissal;
- (NSString)debugDescription;
- (NSString)description;
- (id)debugDescriptionWithChildren:(unint64_t)a3;
- (id)defaultSectionInfo;
- (id)defaultSubsectionInfos;
- (id)displayNameForSubsectionID:(id)a3;
- (id)parentSectionIdentifier;
- (id)sectionBundlePath;
- (id)sectionDisplayName;
- (id)sectionIcon;
- (id)sectionIdentifier;
- (id)sectionParameters;
- (id)sortDescriptors;
- (id)sortKey;
- (id)universalSectionIdentifier;
- (void)bulletinsWithRequestParameters:(id)a3 lastCleared:(id)a4 completion:(id)a5;
- (void)clearedInfoForBulletins:(id)a3 lastClearedInfo:(id)a4 completion:(id)a5;
- (void)clearedInfoForClearingAllBulletinsWithLastClearedInfo:(id)a3 completion:(id)a4;
- (void)clearedInfoForClearingBulletinsFromDate:(id)a3 toDate:(id)a4 lastClearedInfo:(id)a5 completion:(id)a6;
- (void)dataProviderDidLoad;
- (void)deliverMessageWithName:(id)a3 userInfo:(id)a4;
- (void)deliverResponse:(id)a3 forBulletinRequest:(id)a4 withCompletion:(id)a5;
- (void)invalidate;
- (void)noteSectionInfoDidChange:(id)a3;
- (void)reloadIdentityWithCompletion:(id)a3;
- (void)setIdentity:(id)a3;
- (void)startWatchdog;
- (void)updateClearedInfoWithClearedInfo:(id)a3 handler:(id)a4 completion:(id)a5;
- (void)updateSectionInfoWithSectionInfo:(id)a3 handler:(id)a4 completion:(id)a5;
@end

@implementation BBDataProvider

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(BBDataProvider *)self sectionIdentifier];
  v6 = [v3 stringWithFormat:@"<%@ %p; %@>", v4, self, v5];

  return (NSString *)v6;
}

- (BBDataProviderIdentity)identity
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_identity;
  objc_sync_exit(v2);

  return v3;
}

- (void)setIdentity:(id)a3
{
  uint64_t v4 = (BBDataProviderIdentity *)a3;
  obj = self;
  objc_sync_enter(obj);
  identity = obj->_identity;
  obj->_identity = v4;

  objc_sync_exit(obj);
}

- (void)invalidate
{
}

- (BOOL)initialized
{
  v2 = [(BBDataProvider *)self identity];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)startWatchdog
{
}

- (void)dataProviderDidLoad
{
}

- (id)sectionIdentifier
{
  v2 = [(BBDataProvider *)self identity];
  BOOL v3 = [v2 sectionIdentifier];

  return v3;
}

- (id)universalSectionIdentifier
{
  v2 = [(BBDataProvider *)self identity];
  BOOL v3 = [v2 universalSectionIdentifier];

  return v3;
}

- (id)defaultSectionInfo
{
  v2 = [(BBDataProvider *)self identity];
  BOOL v3 = [v2 defaultSectionInfo];

  return v3;
}

- (id)defaultSubsectionInfos
{
  v2 = [(BBDataProvider *)self identity];
  BOOL v3 = [v2 defaultSubsectionInfos];

  return v3;
}

- (id)sectionDisplayName
{
  v2 = [(BBDataProvider *)self identity];
  BOOL v3 = [v2 sectionDisplayName];

  return v3;
}

- (id)sectionIcon
{
  v2 = [(BBDataProvider *)self identity];
  BOOL v3 = [v2 sectionIcon];

  return v3;
}

- (id)displayNameForSubsectionID:(id)a3
{
  id v4 = a3;
  v5 = [(BBDataProvider *)self identity];
  v6 = [v5 subsectionDisplayNames];
  v7 = [v6 objectForKey:v4];

  return v7;
}

- (id)sectionParameters
{
  v2 = [(BBDataProvider *)self identity];
  BOOL v3 = [v2 sectionParameters];

  return v3;
}

- (id)sortDescriptors
{
  v2 = [(BBDataProvider *)self identity];
  BOOL v3 = [v2 sortDescriptors];

  return v3;
}

- (id)sortKey
{
  v2 = [(BBDataProvider *)self identity];
  BOOL v3 = [v2 sortKey];

  return v3;
}

- (BOOL)syncsBulletinDismissal
{
  v2 = [(BBDataProvider *)self identity];
  char v3 = [v2 syncsBulletinDismissal];

  return v3;
}

- (BOOL)canClearAllBulletins
{
  v2 = [(BBDataProvider *)self identity];
  unsigned int v3 = ([v2 traits] >> 6) & 1;

  return v3;
}

- (BOOL)canClearBulletinsByDate
{
  v2 = [(BBDataProvider *)self identity];
  unsigned int v3 = ([v2 traits] >> 7) & 1;

  return v3;
}

- (id)parentSectionIdentifier
{
  v2 = [(BBDataProvider *)self identity];
  unsigned int v3 = [v2 parentSectionIdentifier];

  return v3;
}

- (id)sectionBundlePath
{
  v2 = [(BBDataProvider *)self identity];
  unsigned int v3 = [v2 sectionBundlePath];

  return v3;
}

- (void)bulletinsWithRequestParameters:(id)a3 lastCleared:(id)a4 completion:(id)a5
{
  id v6 = a5;
  NSLog(&cfstr_SNotImplemente.isa, "-[BBDataProvider bulletinsWithRequestParameters:lastCleared:completion:]");
  v5 = v6;
  if (v6)
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
    v5 = v6;
  }
}

- (void)clearedInfoForBulletins:(id)a3 lastClearedInfo:(id)a4 completion:(id)a5
{
  id v6 = a5;
  NSLog(&cfstr_SNotImplemente.isa, "-[BBDataProvider clearedInfoForBulletins:lastClearedInfo:completion:]");
  v5 = v6;
  if (v6)
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
    v5 = v6;
  }
}

- (void)clearedInfoForClearingAllBulletinsWithLastClearedInfo:(id)a3 completion:(id)a4
{
  id v5 = a4;
  NSLog(&cfstr_SNotImplemente.isa, "-[BBDataProvider clearedInfoForClearingAllBulletinsWithLastClearedInfo:completion:]");
  id v4 = v5;
  if (v5)
  {
    (*((void (**)(id, void))v5 + 2))(v5, 0);
    id v4 = v5;
  }
}

- (void)clearedInfoForClearingBulletinsFromDate:(id)a3 toDate:(id)a4 lastClearedInfo:(id)a5 completion:(id)a6
{
  id v7 = a6;
  NSLog(&cfstr_SNotImplemente.isa, "-[BBDataProvider clearedInfoForClearingBulletinsFromDate:toDate:lastClearedInfo:completion:]");
  id v6 = v7;
  if (v7)
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
    id v6 = v7;
  }
}

- (void)deliverResponse:(id)a3 forBulletinRequest:(id)a4 withCompletion:(id)a5
{
}

- (void)reloadIdentityWithCompletion:(id)a3
{
  id v4 = a3;
  NSLog(&cfstr_SNotImplemente.isa, "-[BBDataProvider reloadIdentityWithCompletion:]");
  unsigned int v3 = v4;
  if (v4)
  {
    (*((void (**)(id))v4 + 2))(v4);
    unsigned int v3 = v4;
  }
}

- (void)noteSectionInfoDidChange:(id)a3
{
}

- (void)updateClearedInfoWithClearedInfo:(id)a3 handler:(id)a4 completion:(id)a5
{
  id v6 = a5;
  NSLog(&cfstr_SNotImplemente.isa, "-[BBDataProvider updateClearedInfoWithClearedInfo:handler:completion:]");
  id v5 = v6;
  if (v6)
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
    id v5 = v6;
  }
}

- (void)updateSectionInfoWithSectionInfo:(id)a3 handler:(id)a4 completion:(id)a5
{
  id v6 = a5;
  NSLog(&cfstr_SNotImplemente.isa, "-[BBDataProvider updateSectionInfoWithSectionInfo:handler:completion:]");
  id v5 = v6;
  if (v6)
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
    id v5 = v6;
  }
}

- (BOOL)canPerformMigration
{
  return 0;
}

- (BOOL)migrateSectionInfo:(id)a3 oldSectionInfo:(id)a4
{
  return 0;
}

- (void)deliverMessageWithName:(id)a3 userInfo:(id)a4
{
}

- (id)debugDescriptionWithChildren:(unint64_t)a3
{
  for (i = [MEMORY[0x263F089D8] stringWithString:&stru_26C7952A0];
    [i appendString:@"    "];
  id v6 = NSString;
  id v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  v9 = [(BBDataProvider *)self sectionIdentifier];
  v10 = [v6 stringWithFormat:@"%@<%@: %p>: %@", i, v8, self, v9];

  return v10;
}

- (NSString)debugDescription
{
  return (NSString *)[(BBDataProvider *)self debugDescriptionWithChildren:0];
}

- (void).cxx_destruct
{
}

@end