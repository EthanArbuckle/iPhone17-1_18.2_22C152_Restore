@interface INAppIntentDescriptor
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (INAppIntentDescriptor)initWithCoder:(id)a3;
- (INAppIntentDescriptor)initWithIntentIdentifier:(id)a3 applicationRecord:(id)a4;
- (INAppIntentDescriptor)initWithIntentIdentifier:(id)a3 applicationRecord:(id)a4 supportedAppIntents:(id)a5 supportedEntities:(id)a6;
- (INAppIntentDescriptor)initWithIntentIdentifier:(id)a3 localizedName:(id)a4 bundleIdentifier:(id)a5 extensionBundleIdentifier:(id)a6 counterpartIdentifiers:(id)a7 teamIdentifier:(id)a8 supportedIntents:(id)a9 supportedEntities:(id)a10 bundleURL:(id)a11 documentTypes:(id)a12;
- (NSSet)supportedEntities;
- (NSString)intentIdentifier;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INAppIntentDescriptor

- (INAppIntentDescriptor)initWithIntentIdentifier:(id)a3 applicationRecord:(id)a4 supportedAppIntents:(id)a5 supportedEntities:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [v11 localizedName];
  v14 = [v11 bundleIdentifier];
  v15 = objc_msgSend(v11, "in_counterpartIdentifiers");
  v16 = [v11 teamIdentifier];
  v17 = [v11 URL];
  v18 = objc_msgSend(v11, "in_documentTypes");

  v19 = [(INAppIntentDescriptor *)self initWithIntentIdentifier:v12 localizedName:v13 bundleIdentifier:v14 extensionBundleIdentifier:0 counterpartIdentifiers:v15 teamIdentifier:v16 supportedIntents:v10 supportedEntities:v9 bundleURL:v17 documentTypes:v18];
  return v19;
}

- (INAppIntentDescriptor)initWithIntentIdentifier:(id)a3 localizedName:(id)a4 bundleIdentifier:(id)a5 extensionBundleIdentifier:(id)a6 counterpartIdentifiers:(id)a7 teamIdentifier:(id)a8 supportedIntents:(id)a9 supportedEntities:(id)a10 bundleURL:(id)a11 documentTypes:(id)a12
{
  id v17 = a3;
  id v18 = a10;
  v27.receiver = self;
  v27.super_class = (Class)INAppIntentDescriptor;
  v19 = [(INAppDescriptor *)&v27 initWithLocalizedName:a4 bundleIdentifier:a5 extensionBundleIdentifier:a6 counterpartIdentifiers:a7 teamIdentifier:a8 supportedIntents:a9 bundleURL:a11 documentTypes:a12];
  if (v19)
  {
    uint64_t v20 = [v17 copy];
    intentIdentifier = v19->_intentIdentifier;
    v19->_intentIdentifier = (NSString *)v20;

    uint64_t v22 = [v18 copy];
    supportedEntities = v19->_supportedEntities;
    v19->_supportedEntities = (NSSet *)v22;

    v24 = v19;
  }

  return v19;
}

- (INAppIntentDescriptor)initWithIntentIdentifier:(id)a3 applicationRecord:(id)a4
{
  return [(INAppIntentDescriptor *)self initWithIntentIdentifier:a3 applicationRecord:a4 supportedAppIntents:0 supportedEntities:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedEntities, 0);

  objc_storeStrong((id *)&self->_intentIdentifier, 0);
}

- (unint64_t)hash
{
  v9.receiver = self;
  v9.super_class = (Class)INAppIntentDescriptor;
  unint64_t v3 = [(INAppDescriptor *)&v9 hash];
  v4 = [(INAppIntentDescriptor *)self intentIdentifier];
  uint64_t v5 = [v4 hash];
  v6 = [(INAppIntentDescriptor *)self supportedEntities];
  unint64_t v7 = v5 ^ [v6 hash] ^ v3;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (INAppIntentDescriptor *)a3;
  if (self == v4)
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    if ([(INAppIntentDescriptor *)v4 isMemberOfClass:objc_opt_class()])
    {
      v21.receiver = self;
      v21.super_class = (Class)INAppIntentDescriptor;
      unsigned int v5 = [(INAppDescriptor *)&v21 isEqual:v4];
      v6 = v4;
      if (v6)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          unint64_t v7 = v6;
        }
        else {
          unint64_t v7 = 0;
        }
      }
      else
      {
        unint64_t v7 = 0;
      }
      objc_super v9 = v7;

      if (!v5)
      {
        LOBYTE(v8) = 0;
LABEL_26:

        goto LABEL_27;
      }
      id v10 = [(INAppIntentDescriptor *)self intentIdentifier];
      id v11 = [(INAppIntentDescriptor *)v9 intentIdentifier];
      id v12 = v10;
      id v13 = v11;
      v14 = v13;
      if (v12 == v13)
      {
      }
      else
      {
        LOBYTE(v8) = 0;
        v15 = v13;
        id v16 = v12;
        if (!v12 || !v13)
        {
LABEL_24:

LABEL_25:
          goto LABEL_26;
        }
        int v8 = [v12 isEqualToString:v13];

        if (!v8) {
          goto LABEL_25;
        }
      }
      id v17 = [(INAppIntentDescriptor *)self supportedEntities];
      id v18 = [(INAppIntentDescriptor *)v9 supportedEntities];
      id v16 = v17;
      id v19 = v18;
      v15 = v19;
      if (v16 == v19)
      {
        LOBYTE(v8) = 1;
      }
      else
      {
        LOBYTE(v8) = 0;
        if (v16 && v19) {
          LOBYTE(v8) = [v16 isEqualToSet:v19];
        }
      }

      goto LABEL_24;
    }
    LOBYTE(v8) = 0;
  }
LABEL_27:

  return v8;
}

- (NSString)intentIdentifier
{
  return self->_intentIdentifier;
}

- (NSSet)supportedEntities
{
  return self->_supportedEntities;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)INAppIntentDescriptor;
  id v4 = a3;
  [(INAppDescriptor *)&v7 encodeWithCoder:v4];
  unsigned int v5 = [(INAppIntentDescriptor *)self intentIdentifier];
  [v4 encodeObject:v5 forKey:@"intentIdentifier"];

  v6 = [(INAppIntentDescriptor *)self supportedEntities];
  [v4 encodeObject:v6 forKey:@"supportedEntities"];
}

- (INAppIntentDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)INAppIntentDescriptor;
  unsigned int v5 = [(INAppDescriptor *)&v15 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"intentIdentifier"];
    intentIdentifier = v5->_intentIdentifier;
    v5->_intentIdentifier = (NSString *)v6;

    int v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    id v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"supportedEntities"];
    supportedEntities = v5->_supportedEntities;
    v5->_supportedEntities = (NSSet *)v11;

    id v13 = v5;
  }

  return v5;
}

- (id)description
{
  unint64_t v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)INAppIntentDescriptor;
  id v4 = [(INAppDescriptor *)&v9 description];
  unsigned int v5 = [(INAppIntentDescriptor *)self intentIdentifier];
  uint64_t v6 = [(INAppIntentDescriptor *)self supportedEntities];
  objc_super v7 = [v3 stringWithFormat:@"%@, intentIdentifier: %@, supportedEntities: %@", v4, v5, v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end