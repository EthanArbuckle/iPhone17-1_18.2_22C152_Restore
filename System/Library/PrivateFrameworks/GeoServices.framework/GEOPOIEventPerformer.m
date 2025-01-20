@interface GEOPOIEventPerformer
+ (BOOL)supportsSecureCoding;
+ (id)poiEventPerformersForPerformers:(id)a3;
- (GEOPOIEventPerformer)initWithCoder:(id)a3;
- (GEOPOIEventPerformer)initWithPerformer:(id)a3;
- (NSString)iTunesIdentifier;
- (NSString)localizedName;
- (NSURL)iTunesURL;
- (void)encodeWithCoder:(id)a3;
- (void)setITunesIdentifier:(id)a3;
- (void)setITunesURL:(id)a3;
- (void)setLocalizedName:(id)a3;
@end

@implementation GEOPOIEventPerformer

+ (id)poiEventPerformersForPerformers:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          v11 = [GEOPOIEventPerformer alloc];
          v12 = -[GEOPOIEventPerformer initWithPerformer:](v11, "initWithPerformer:", v10, (void)v14);
          if (v12) {
            [v4 addObject:v12];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOPOIEventPerformer)initWithPerformer:(id)a3
{
  v4 = (id *)a3;
  v16.receiver = self;
  v16.super_class = (Class)GEOPOIEventPerformer;
  id v5 = [(GEOPOIEventPerformer *)&v16 init];
  if (v5)
  {
    uint64_t v6 = -[GEOPDPerformer name](v4);
    uint64_t v7 = [v6 stringValue];
    localizedName = v5->_localizedName;
    v5->_localizedName = (NSString *)v7;

    uint64_t v9 = -[GEOPDPerformer itunesId](v4);
    iTunesIdentifier = v5->_iTunesIdentifier;
    v5->_iTunesIdentifier = (NSString *)v9;

    v11 = (void *)MEMORY[0x1E4F1CB10];
    v12 = -[GEOPDPerformer itunesUrl](v4);
    uint64_t v13 = [v11 URLWithString:v12];
    iTunesURL = v5->_iTunesURL;
    v5->_iTunesURL = (NSURL *)v13;
  }
  return v5;
}

- (GEOPOIEventPerformer)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GEOPOIEventPerformer;
  id v5 = [(GEOPOIEventPerformer *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"GEOPOIEventPerformerLocalizedNameKey"];
    localizedName = v5->_localizedName;
    v5->_localizedName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"GEOPOIEventPerformeriTunesIdentifierKey"];
    iTunesIdentifier = v5->_iTunesIdentifier;
    v5->_iTunesIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"GEOPOIEventPerformeriTunesURLKey"];
    iTunesURL = v5->_iTunesURL;
    v5->_iTunesURL = (NSURL *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  localizedName = self->_localizedName;
  id v5 = a3;
  [v5 encodeObject:localizedName forKey:@"GEOPOIEventPerformerLocalizedNameKey"];
  [v5 encodeObject:self->_iTunesIdentifier forKey:@"GEOPOIEventPerformeriTunesIdentifierKey"];
  [v5 encodeObject:self->_iTunesURL forKey:@"GEOPOIEventPerformeriTunesURLKey"];
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)setLocalizedName:(id)a3
{
}

- (NSString)iTunesIdentifier
{
  return self->_iTunesIdentifier;
}

- (void)setITunesIdentifier:(id)a3
{
}

- (NSURL)iTunesURL
{
  return self->_iTunesURL;
}

- (void)setITunesURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iTunesURL, 0);
  objc_storeStrong((id *)&self->_iTunesIdentifier, 0);

  objc_storeStrong((id *)&self->_localizedName, 0);
}

@end