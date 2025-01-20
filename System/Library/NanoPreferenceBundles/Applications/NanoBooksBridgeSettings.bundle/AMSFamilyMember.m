@interface AMSFamilyMember
- (NSSet)nb_dsids;
- (UIImage)nb_profileImage;
- (void)setNb_profileImage:(id)a3;
@end

@implementation AMSFamilyMember

- (void)setNb_profileImage:(id)a3
{
}

- (UIImage)nb_profileImage
{
  return (UIImage *)objc_getAssociatedObject(self, &unk_280C8);
}

- (NSSet)nb_dsids
{
  v3 = objc_opt_new();
  v4 = [(AMSFamilyMember *)self iTunesDSID];

  if (v4)
  {
    v5 = [(AMSFamilyMember *)self iTunesDSID];
    [v3 addObject:v5];
  }
  v6 = [(AMSFamilyMember *)self iCloudDSID];

  if (v6)
  {
    v7 = [(AMSFamilyMember *)self iCloudDSID];
    [v3 addObject:v7];
  }
  id v8 = [v3 copy];

  return (NSSet *)v8;
}

@end