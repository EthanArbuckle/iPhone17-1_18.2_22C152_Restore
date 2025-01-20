@interface AKExtensionlessFollowUpHelperContext
+ (BOOL)supportsSecureCoding;
- (AKExtensionlessFollowUpHelperContext)initWithCoder:(id)a3;
- (NSDictionary)additionalInfo;
- (NSString)akAction;
- (NSString)altDSID;
- (NSString)uniqueItemIdentifier;
- (NSString)urlKey;
- (UIViewController)presentingViewController;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAdditionalInfo:(id)a3;
- (void)setAkAction:(id)a3;
- (void)setAltDSID:(id)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setUniqueItemIdentifier:(id)a3;
- (void)setUrlKey:(id)a3;
@end

@implementation AKExtensionlessFollowUpHelperContext

- (AKExtensionlessFollowUpHelperContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)AKExtensionlessFollowUpHelperContext;
  v5 = [(AKExtensionlessFollowUpHelperContext *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_urlKey"];
    urlKey = v5->_urlKey;
    v5->_urlKey = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_altDSID"];
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_akAction"];
    akAction = v5->_akAction;
    v5->_akAction = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_uniqueItemIdentifier"];
    uniqueItemIdentifier = v5->_uniqueItemIdentifier;
    v5->_uniqueItemIdentifier = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_additionalInfo"];
    additionalInfo = v5->_additionalInfo;
    v5->_additionalInfo = (NSDictionary *)v14;

    v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_presentingViewController"];
    objc_storeWeak((id *)&v5->_presentingViewController, v16);
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  urlKey = self->_urlKey;
  id v5 = a3;
  [v5 encodeObject:urlKey forKey:@"_urlKey"];
  [v5 encodeObject:self->_altDSID forKey:@"_altDSID"];
  [v5 encodeObject:self->_akAction forKey:@"_akAction"];
  [v5 encodeObject:self->_uniqueItemIdentifier forKey:@"_uniqueItemIdentifier"];
  [v5 encodeObject:self->_additionalInfo forKey:@"_additionalInfo"];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  [v5 encodeObject:WeakRetained forKey:@"_presentingViewController"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p> urlKey: %@, action: %@, uniqueItemIdentifier: %@", objc_opt_class(), self, self->_urlKey, self->_akAction, self->_uniqueItemIdentifier];
}

- (NSString)uniqueItemIdentifier
{
  return self->_uniqueItemIdentifier;
}

- (void)setUniqueItemIdentifier:(id)a3
{
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
}

- (NSString)urlKey
{
  return self->_urlKey;
}

- (void)setUrlKey:(id)a3
{
}

- (NSString)akAction
{
  return self->_akAction;
}

- (void)setAkAction:(id)a3
{
}

- (NSDictionary)additionalInfo
{
  return self->_additionalInfo;
}

- (void)setAdditionalInfo:(id)a3
{
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setPresentingViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_additionalInfo, 0);
  objc_storeStrong((id *)&self->_akAction, 0);
  objc_storeStrong((id *)&self->_urlKey, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);

  objc_storeStrong((id *)&self->_uniqueItemIdentifier, 0);
}

@end