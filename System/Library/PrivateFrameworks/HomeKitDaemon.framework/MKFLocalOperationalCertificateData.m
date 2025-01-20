@interface MKFLocalOperationalCertificateData
+ (id)fetchRequest;
@end

@implementation MKFLocalOperationalCertificateData

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"LocalOperationalCertificateData"];
}

@end