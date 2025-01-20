@interface CRKASMRosterProviderDecoratorBase
+ (id)keyPathsForValuesAffectingLocationsWithManagePermissions;
+ (id)keyPathsForValuesAffectingPopulated;
+ (id)keyPathsForValuesAffectingRoster;
- (BOOL)ingestCertificates:(id)a3 forTrustedUserIdentifier:(id)a4 error:(id *)a5;
- (BOOL)isPopulated;
- (CRKASMRoster)roster;
- (CRKASMRosterProviderDecoratorBase)initWithRosterProvider:(id)a3;
- (CRKASMRosterProviding)underlyingRosterProvider;
- (CRKASMUserFetching)userFetcher;
- (NSArray)locationsWithManagePermissions;
- (id)instructorDirectoryForLocationIDs:(id)a3;
- (id)studentDirectoryForLocationIDs:(id)a3;
- (void)createCourseWithProperties:(id)a3 completion:(id)a4;
- (void)refresh;
- (void)removeCourseWithIdentifier:(id)a3 completion:(id)a4;
- (void)updateCourseWithIdentifier:(id)a3 properties:(id)a4 completion:(id)a5;
@end

@implementation CRKASMRosterProviderDecoratorBase

- (CRKASMRosterProviderDecoratorBase)initWithRosterProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKASMRosterProviderDecoratorBase;
  v6 = [(CRKASMRosterProviderDecoratorBase *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_underlyingRosterProvider, a3);
  }

  return v7;
}

- (CRKASMRoster)roster
{
  v2 = [(CRKASMRosterProviderDecoratorBase *)self underlyingRosterProvider];
  v3 = [v2 roster];

  return (CRKASMRoster *)v3;
}

+ (id)keyPathsForValuesAffectingRoster
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:@"underlyingRosterProvider.roster"];
}

- (BOOL)isPopulated
{
  v2 = [(CRKASMRosterProviderDecoratorBase *)self underlyingRosterProvider];
  char v3 = [v2 isPopulated];

  return v3;
}

+ (id)keyPathsForValuesAffectingPopulated
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:@"underlyingRosterProvider.populated"];
}

- (CRKASMUserFetching)userFetcher
{
  v2 = [(CRKASMRosterProviderDecoratorBase *)self underlyingRosterProvider];
  char v3 = [v2 userFetcher];

  return (CRKASMUserFetching *)v3;
}

- (id)studentDirectoryForLocationIDs:(id)a3
{
  id v4 = a3;
  id v5 = [(CRKASMRosterProviderDecoratorBase *)self underlyingRosterProvider];
  v6 = [v5 studentDirectoryForLocationIDs:v4];

  return v6;
}

- (id)instructorDirectoryForLocationIDs:(id)a3
{
  id v4 = a3;
  id v5 = [(CRKASMRosterProviderDecoratorBase *)self underlyingRosterProvider];
  v6 = [v5 instructorDirectoryForLocationIDs:v4];

  return v6;
}

- (NSArray)locationsWithManagePermissions
{
  v2 = [(CRKASMRosterProviderDecoratorBase *)self underlyingRosterProvider];
  char v3 = [v2 locationsWithManagePermissions];

  return (NSArray *)v3;
}

+ (id)keyPathsForValuesAffectingLocationsWithManagePermissions
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:@"underlyingRosterProvider.locationsWithManagePermissions"];
}

- (void)refresh
{
  id v2 = [(CRKASMRosterProviderDecoratorBase *)self underlyingRosterProvider];
  [v2 refresh];
}

- (BOOL)ingestCertificates:(id)a3 forTrustedUserIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = [(CRKASMRosterProviderDecoratorBase *)self underlyingRosterProvider];
  LOBYTE(a5) = [v10 ingestCertificates:v9 forTrustedUserIdentifier:v8 error:a5];

  return (char)a5;
}

- (void)removeCourseWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CRKASMRosterProviderDecoratorBase *)self underlyingRosterProvider];
  [v8 removeCourseWithIdentifier:v7 completion:v6];
}

- (void)createCourseWithProperties:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CRKASMRosterProviderDecoratorBase *)self underlyingRosterProvider];
  [v8 createCourseWithProperties:v7 completion:v6];
}

- (void)updateCourseWithIdentifier:(id)a3 properties:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(CRKASMRosterProviderDecoratorBase *)self underlyingRosterProvider];
  [v11 updateCourseWithIdentifier:v10 properties:v9 completion:v8];
}

- (CRKASMRosterProviding)underlyingRosterProvider
{
  return self->_underlyingRosterProvider;
}

- (void).cxx_destruct
{
}

@end