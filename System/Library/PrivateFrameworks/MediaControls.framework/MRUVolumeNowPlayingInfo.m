@interface MRUVolumeNowPlayingInfo
- (BOOL)isEqual:(id)a3;
- (MRUVolumeNowPlayingInfo)initWithBundleID:(id)a3 name:(id)a4 formatDescription:(id)a5;
- (NSString)bundleID;
- (NSString)formatDescription;
- (NSString)name;
@end

@implementation MRUVolumeNowPlayingInfo

- (MRUVolumeNowPlayingInfo)initWithBundleID:(id)a3 name:(id)a4 formatDescription:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MRUVolumeNowPlayingInfo;
  v12 = [(MRUVolumeNowPlayingInfo *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_bundleID, a3);
    objc_storeStrong((id *)&v13->_name, a4);
    objc_storeStrong((id *)&v13->_formatDescription, a5);
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MRUVolumeNowPlayingInfo *)a3;
  if (self == v4)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(MRUVolumeNowPlayingInfo *)v5 bundleID];
      int v7 = [v6 isEqualToString:self->_bundleID];

      v8 = [(MRUVolumeNowPlayingInfo *)v5 name];
      int v9 = v7 & [v8 isEqual:self->_name];

      id v10 = [(MRUVolumeNowPlayingInfo *)v5 formatDescription];

      int v11 = v9 & [v10 isEqualToString:self->_formatDescription];
    }
    else
    {
      LOBYTE(v11) = 0;
    }
  }

  return v11;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)formatDescription
{
  return self->_formatDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formatDescription, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end