@interface DRPasteAnnouncementContinuityEndpoint
- (BOOL)isSimilarToContinuityEndpoint:(id)a3;
- (DRPasteAnnouncementContinuityEndpoint)initWithDeviceName:(id)a3;
- (NSString)deviceName;
@end

@implementation DRPasteAnnouncementContinuityEndpoint

- (DRPasteAnnouncementContinuityEndpoint)initWithDeviceName:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DRPasteAnnouncementContinuityEndpoint;
  return (DRPasteAnnouncementContinuityEndpoint *)[(DRPasteAnnouncementEndpoint *)&v4 _initWithLocalizedName:a3];
}

- (NSString)deviceName
{
  return self->super._localizedName;
}

- (BOOL)isSimilarToContinuityEndpoint:(id)a3
{
  id v4 = a3;
  v5 = [(DRPasteAnnouncementContinuityEndpoint *)self deviceName];
  v6 = [v4 deviceName];
  if (v5 == v6)
  {
    char v9 = 1;
  }
  else
  {
    v7 = [(DRPasteAnnouncementContinuityEndpoint *)self deviceName];
    v8 = [v4 deviceName];
    char v9 = [v7 isEqual:v8];
  }
  return v9;
}

@end