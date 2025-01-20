@interface MapsSettingsIntentsApplication
+ (id)applicationsFromExtensions:(id)a3;
- (BOOL)isEnabled;
- (MapsSettingsIntentsApplication)initWithExtension:(id)a3;
- (NSMutableArray)extensions;
- (NSString)displayName;
- (NSString)identifier;
- (UIImage)displayImage;
- (void)addExtension:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setExtensions:(id)a3;
@end

@implementation MapsSettingsIntentsApplication

- (MapsSettingsIntentsApplication)initWithExtension:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MapsSettingsIntentsApplication;
  v5 = [(MapsSettingsIntentsApplication *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 _containingAppIdentifer];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    id v8 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v5->_identifier allowPlaceholder:0 error:0];
    v9 = [v8 localizedName];
    v10 = (NSString *)[v9 copy];
    displayName = v5->_displayName;
    v5->_displayName = v10;

    if (!v5->_displayName)
    {
      uint64_t v12 = [v4 displayName];
      v13 = v5->_displayName;
      v5->_displayName = (NSString *)v12;
    }
    uint64_t v14 = [v4 _iconWithFormat:0];
    displayImage = v5->_displayImage;
    v5->_displayImage = (UIImage *)v14;

    uint64_t v16 = objc_opt_new();
    extensions = v5->_extensions;
    v5->_extensions = (NSMutableArray *)v16;

    [(NSMutableArray *)v5->_extensions addObject:v4];
    v5->_enabled = [v4 isEnabled];
  }
  return v5;
}

+ (id)applicationsFromExtensions:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "_containingAppIdentifer", (void)v17);
        if (v11)
        {
          uint64_t v12 = [v4 valueForKey:v11];
          v13 = v12;
          if (v12)
          {
            [v12 addExtension:v10];
          }
          else
          {
            uint64_t v14 = [[MapsSettingsIntentsApplication alloc] initWithExtension:v10];
            [(MapsSettingsIntentsApplication *)v14 addExtension:v10];
            [v4 setValue:v14 forKey:v11];
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  v15 = [v4 allValues];

  return v15;
}

- (void)addExtension:(id)a3
{
  id v6 = a3;
  id v4 = [v6 _containingAppIdentifer];
  unsigned int v5 = [v4 isEqualToString:self->_identifier];

  if (v5)
  {
    if (self->_enabled != [v6 isEnabled])
    {
      NSLog(@"Discrepency in enabling of extensions for application: %@", self->_identifier);
      [v6 _setEnabled:self->_enabled error:0];
    }
    [(NSMutableArray *)self->_extensions addObject:v6];
  }
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    BOOL v3 = a3;
    self->_enabled = a3;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v4 = self->_extensions;
    id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v14;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = *(void **)(*((void *)&v13 + 1) + 8 * (void)v8);
          id v12 = 0;
          [v9 _setEnabled:v3 error:&v12];
          id v10 = v12;
          if (v10)
          {
            v11 = [v9 identifier];
            NSLog(@"Error Enabling Extension: %@", v11);
          }
          uint64_t v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
    }
  }
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (UIImage)displayImage
{
  return self->_displayImage;
}

- (NSMutableArray)extensions
{
  return self->_extensions;
}

- (void)setExtensions:(id)a3
{
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensions, 0);
  objc_storeStrong((id *)&self->_displayImage, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_displayName, 0);
}

@end