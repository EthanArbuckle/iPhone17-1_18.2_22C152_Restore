@interface ENRegionTravelerServerDownloadConfiguration
+ (BOOL)supportsSecureCoding;
- (ENRegionTravelerServerDownloadConfiguration)initWithCoder:(id)a3;
- (ENRegionTravelerServerDownloadConfiguration)initWithServerResponseDictionary:(id)a3;
- (NSURL)tekTravelerDownloadBaseURL;
- (NSURL)tekTravelerDownloadIndexURL;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ENRegionTravelerServerDownloadConfiguration

- (void)encodeWithCoder:(id)a3
{
  tekTravelerDownloadBaseURL = self->_tekTravelerDownloadBaseURL;
  id v5 = a3;
  [v5 encodeObject:tekTravelerDownloadBaseURL forKey:@"tekTravelerDownloadBasePath"];
  [v5 encodeObject:self->_tekTravelerDownloadIndexURL forKey:@"tekTravelerDownloadIndexFile"];
}

- (ENRegionTravelerServerDownloadConfiguration)initWithServerResponseDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ENRegionTravelerServerDownloadConfiguration;
  id v5 = [(ENRegionTravelerServerDownloadConfiguration *)&v12 init];
  if (v5)
  {
    CFStringGetTypeID();
    v6 = CFDictionaryGetTypedValue();
    v7 = [NSURL URLWithString:v6];
    if (v7)
    {
      objc_storeStrong((id *)&v5->_tekTravelerDownloadBaseURL, v7);
      CFStringGetTypeID();
      v8 = CFDictionaryGetTypedValue();
      v9 = [NSURL URLWithString:v8];
      if (v9)
      {
        objc_storeStrong((id *)&v5->_tekTravelerDownloadIndexURL, v9);
        v10 = v5;
      }
      else
      {
        v10 = 0;
      }
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (ENRegionTravelerServerDownloadConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tekTravelerDownloadBasePath"];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tekTravelerDownloadIndexFile"];
    if (v6)
    {
      v11.receiver = self;
      v11.super_class = (Class)ENRegionTravelerServerDownloadConfiguration;
      v7 = [(ENRegionTravelerServerDownloadConfiguration *)&v11 init];
      p_isa = (id *)&v7->super.isa;
      if (v7)
      {
        objc_storeStrong((id *)&v7->_tekTravelerDownloadBaseURL, v5);
        objc_storeStrong(p_isa + 2, v6);
      }
      self = p_isa;
      v9 = self;
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSURL)tekTravelerDownloadBaseURL
{
  return self->_tekTravelerDownloadBaseURL;
}

- (NSURL)tekTravelerDownloadIndexURL
{
  return self->_tekTravelerDownloadIndexURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tekTravelerDownloadIndexURL, 0);

  objc_storeStrong((id *)&self->_tekTravelerDownloadBaseURL, 0);
}

@end