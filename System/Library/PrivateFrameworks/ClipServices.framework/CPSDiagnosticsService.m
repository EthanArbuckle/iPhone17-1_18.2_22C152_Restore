@interface CPSDiagnosticsService
+ (void)fetchABRMetadataWithURL:(id)a3 completion:(id)a4;
+ (void)fetchAMPMetadataWithBundleID:(id)a3 completion:(id)a4;
@end

@implementation CPSDiagnosticsService

+ (void)fetchABRMetadataWithURL:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[CPSDaemonConnection sharedConnection];
  [v7 fetchABRMetadataForDiagnosticsWithURL:v6 completion:v5];
}

+ (void)fetchAMPMetadataWithBundleID:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[CPSDaemonConnection sharedConnection];
  [v7 fetchAMPMetadataForDiagnosticsWithBundleID:v6 completion:v5];
}

@end