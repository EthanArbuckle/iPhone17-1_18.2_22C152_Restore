@interface DRPasteAnnouncementEndpoint
+ (BOOL)supportsSecureCoding;
- (DRPasteAnnouncementEndpoint)initWithCoder:(id)a3;
- (id)_initWithLocalizedName:(id)a3;
- (id)localizedName;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DRPasteAnnouncementEndpoint

- (id)_initWithLocalizedName:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DRPasteAnnouncementEndpoint;
  v5 = [(DRPasteAnnouncementEndpoint *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    localizedName = v5->_localizedName;
    v5->_localizedName = (NSString *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DRPasteAnnouncementEndpoint)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedName"];

  uint64_t v6 = [(DRPasteAnnouncementEndpoint *)self _initWithLocalizedName:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  localizedName = self->_localizedName;
  if (localizedName) {
    [a3 encodeObject:localizedName forKey:@"localizedName"];
  }
}

- (id)localizedName
{
  return self->_localizedName;
}

- (void).cxx_destruct
{
}

@end