@interface _LSJournalledNotification
+ (BOOL)supportsSecureCoding;
- (BOOL)includePlugins;
- (NSArray)bundleIDs;
- (NSDictionary)options;
- (_LSJournalledNotification)initWithCoder:(id)a3;
- (_LSJournalledNotification)initWithNotification:(int)a3 bundleIDs:(id)a4 plugins:(BOOL)a5 options:(id)a6;
- (int)notification;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _LSJournalledNotification

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_LSJournalledNotification)initWithNotification:(int)a3 bundleIDs:(id)a4 plugins:(BOOL)a5 options:(id)a6
{
  id v11 = a4;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)_LSJournalledNotification;
  v13 = [(_LSJournalledNotification *)&v16 init];
  v14 = v13;
  if (v13)
  {
    v13->_notification = a3;
    objc_storeStrong((id *)&v13->_bundleIDs, a4);
    v14->_includePlugins = a5;
    objc_storeStrong((id *)&v14->_options, a6);
  }

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t notification = self->_notification;
  id v5 = a3;
  [v5 encodeInt:notification forKey:@"_notification"];
  [v5 encodeObject:self->_bundleIDs forKey:@"_bundleIDs"];
  [v5 encodeBool:self->_includePlugins forKey:@"_includePlugins"];
  [v5 encodeObject:self->_options forKey:@"_options"];
}

- (_LSJournalledNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_LSJournalledNotification;
  id v5 = [(_LSJournalledNotification *)&v15 init];
  if (v5)
  {
    v5->_uint64_t notification = [v4 decodeIntForKey:@"_notification"];
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = objc_msgSend(v4, "ls_decodeObjectOfClasses:forKey:", v8, @"_bundleIDs");
    bundleIDs = v5->_bundleIDs;
    v5->_bundleIDs = (NSArray *)v9;

    v5->_includePlugins = [v4 decodeBoolForKey:@"_includePlugins"];
    id v11 = XNSGetPropertyListClasses();
    uint64_t v12 = objc_msgSend(v4, "ls_decodeObjectOfClasses:forKey:", v11, @"_options");
    options = v5->_options;
    v5->_options = (NSDictionary *)v12;
  }
  return v5;
}

- (int)notification
{
  return self->_notification;
}

- (NSArray)bundleIDs
{
  return self->_bundleIDs;
}

- (BOOL)includePlugins
{
  return self->_includePlugins;
}

- (NSDictionary)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);

  objc_storeStrong((id *)&self->_bundleIDs, 0);
}

@end