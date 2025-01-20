@interface SHMediaLibraryQueryParameters
+ (BOOL)supportsSecureCoding;
+ (id)defaultParameters;
- (BOOL)ascending;
- (BOOL)shouldUpdate;
- (BOOL)validateLimit:(int64_t)a3;
- (NSString)providerIdentifier;
- (SHMediaLibraryQueryParameters)initWithCoder:(id)a3;
- (SHMediaLibraryQueryParameters)initWithResultsLimit:(int64_t)a3;
- (SHMediaLibraryQueryParameters)initWithResultsLimit:(int64_t)a3 filterOptions:(unint64_t)a4;
- (SHMediaLibraryQueryParameters)initWithResultsLimit:(int64_t)a3 filterOptions:(unint64_t)a4 ascending:(BOOL)a5;
- (SHMediaLibraryQueryParameters)initWithResultsLimit:(int64_t)a3 filterOptions:(unint64_t)a4 ascending:(BOOL)a5 providerIdentifier:(id)a6;
- (SHMediaLibraryQueryParameters)initWithResultsLimit:(int64_t)a3 filterOptions:(unint64_t)a4 ascending:(BOOL)a5 shouldUpdate:(BOOL)a6;
- (SHMediaLibraryQueryParameters)initWithResultsLimit:(int64_t)a3 filterOptions:(unint64_t)a4 ascending:(BOOL)a5 shouldUpdate:(BOOL)a6 providerIdentifier:(id)a7;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)resultsLimit;
- (unint64_t)filterOptions;
- (void)commonInitWithResultsLimit:(int64_t)a3 filterOptions:(unint64_t)a4 ascending:(BOOL)a5 shouldUpdate:(BOOL)a6 providerIdentifier:(id)a7;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SHMediaLibraryQueryParameters

+ (id)defaultParameters
{
  v2 = [[SHMediaLibraryQueryParameters alloc] initWithResultsLimit:0x7FFFFFFFFFFFFFFFLL];

  return v2;
}

- (SHMediaLibraryQueryParameters)initWithResultsLimit:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SHMediaLibraryQueryParameters;
  v4 = [(SHMediaLibraryQueryParameters *)&v7 init];
  v5 = v4;
  if (v4) {
    [(SHMediaLibraryQueryParameters *)v4 commonInitWithResultsLimit:a3 filterOptions:3 ascending:0 shouldUpdate:0 providerIdentifier:0];
  }
  return v5;
}

- (SHMediaLibraryQueryParameters)initWithResultsLimit:(int64_t)a3 filterOptions:(unint64_t)a4
{
  v9.receiver = self;
  v9.super_class = (Class)SHMediaLibraryQueryParameters;
  v6 = [(SHMediaLibraryQueryParameters *)&v9 init];
  objc_super v7 = v6;
  if (v6) {
    [(SHMediaLibraryQueryParameters *)v6 commonInitWithResultsLimit:a3 filterOptions:a4 ascending:0 shouldUpdate:0 providerIdentifier:0];
  }
  return v7;
}

- (SHMediaLibraryQueryParameters)initWithResultsLimit:(int64_t)a3 filterOptions:(unint64_t)a4 ascending:(BOOL)a5
{
  BOOL v5 = a5;
  v11.receiver = self;
  v11.super_class = (Class)SHMediaLibraryQueryParameters;
  v8 = [(SHMediaLibraryQueryParameters *)&v11 init];
  objc_super v9 = v8;
  if (v8) {
    [(SHMediaLibraryQueryParameters *)v8 commonInitWithResultsLimit:a3 filterOptions:a4 ascending:v5 shouldUpdate:0 providerIdentifier:0];
  }
  return v9;
}

- (SHMediaLibraryQueryParameters)initWithResultsLimit:(int64_t)a3 filterOptions:(unint64_t)a4 ascending:(BOOL)a5 shouldUpdate:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  v13.receiver = self;
  v13.super_class = (Class)SHMediaLibraryQueryParameters;
  v10 = [(SHMediaLibraryQueryParameters *)&v13 init];
  objc_super v11 = v10;
  if (v10) {
    [(SHMediaLibraryQueryParameters *)v10 commonInitWithResultsLimit:a3 filterOptions:a4 ascending:v7 shouldUpdate:v6 providerIdentifier:0];
  }
  return v11;
}

- (SHMediaLibraryQueryParameters)initWithResultsLimit:(int64_t)a3 filterOptions:(unint64_t)a4 ascending:(BOOL)a5 shouldUpdate:(BOOL)a6 providerIdentifier:(id)a7
{
  BOOL v7 = a6;
  BOOL v8 = a5;
  id v12 = a7;
  v16.receiver = self;
  v16.super_class = (Class)SHMediaLibraryQueryParameters;
  objc_super v13 = [(SHMediaLibraryQueryParameters *)&v16 init];
  v14 = v13;
  if (v13) {
    [(SHMediaLibraryQueryParameters *)v13 commonInitWithResultsLimit:a3 filterOptions:a4 ascending:v8 shouldUpdate:v7 providerIdentifier:v12];
  }

  return v14;
}

- (void)commonInitWithResultsLimit:(int64_t)a3 filterOptions:(unint64_t)a4 ascending:(BOOL)a5 shouldUpdate:(BOOL)a6 providerIdentifier:(id)a7
{
  id v12 = (NSString *)a7;
  if (![(SHMediaLibraryQueryParameters *)self validateLimit:a3])
  {
    id v14 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"Limit must be a non-negative number" userInfo:0];
    objc_exception_throw(v14);
  }
  self->_resultsLimit = a3;
  self->_filterOptions = a4;
  self->_ascending = a5;
  self->_shouldUpdate = a6;
  providerIdentifier = self->_providerIdentifier;
  self->_providerIdentifier = v12;
}

- (BOOL)validateLimit:(int64_t)a3
{
  return a3 >= 0;
}

- (SHMediaLibraryQueryParameters)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"SHMediaLibraryQueryDescriptorLimit"];
  BOOL v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SHMediaLibraryQueryDescriptorFilterOptions"];
  uint64_t v7 = [v4 decodeBoolForKey:@"SHMediaLibraryQueryDescriptorAscending"];
  uint64_t v8 = [v4 decodeBoolForKey:@"SHMediaLibraryQueryDescriptorShouldUpdate"];
  objc_super v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SHMediaLibraryQueryDescriptorProviderIdentifier"];

  v10 = -[SHMediaLibraryQueryParameters initWithResultsLimit:filterOptions:ascending:shouldUpdate:providerIdentifier:](self, "initWithResultsLimit:filterOptions:ascending:shouldUpdate:providerIdentifier:", v5, [v6 unsignedIntegerValue], v7, v8, v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t resultsLimit = self->_resultsLimit;
  id v6 = a3;
  [v6 encodeInteger:resultsLimit forKey:@"SHMediaLibraryQueryDescriptorLimit"];
  uint64_t v5 = [NSNumber numberWithUnsignedInteger:self->_filterOptions];
  [v6 encodeObject:v5 forKey:@"SHMediaLibraryQueryDescriptorFilterOptions"];

  [v6 encodeBool:self->_ascending forKey:@"SHMediaLibraryQueryDescriptorAscending"];
  [v6 encodeBool:self->_shouldUpdate forKey:@"SHMediaLibraryQueryDescriptorShouldUpdate"];
  [v6 encodeObject:self->_providerIdentifier forKey:@"SHMediaLibraryQueryDescriptorProviderIdentifier"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = +[SHMediaLibraryQueryParameters allocWithZone:](SHMediaLibraryQueryParameters, "allocWithZone:");
  int64_t v6 = [(SHMediaLibraryQueryParameters *)self resultsLimit];
  unint64_t v7 = [(SHMediaLibraryQueryParameters *)self filterOptions];
  BOOL v8 = [(SHMediaLibraryQueryParameters *)self ascending];
  BOOL v9 = [(SHMediaLibraryQueryParameters *)self shouldUpdate];
  v10 = [(SHMediaLibraryQueryParameters *)self providerIdentifier];
  objc_super v11 = (void *)[v10 copyWithZone:a3];
  id v12 = [(SHMediaLibraryQueryParameters *)v5 initWithResultsLimit:v6 filterOptions:v7 ascending:v8 shouldUpdate:v9 providerIdentifier:v11];

  return v12;
}

- (SHMediaLibraryQueryParameters)initWithResultsLimit:(int64_t)a3 filterOptions:(unint64_t)a4 ascending:(BOOL)a5 providerIdentifier:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  v14.receiver = self;
  v14.super_class = (Class)SHMediaLibraryQueryParameters;
  objc_super v11 = [(SHMediaLibraryQueryParameters *)&v14 init];
  id v12 = v11;
  if (v11) {
    [(SHMediaLibraryQueryParameters *)v11 commonInitWithResultsLimit:a3 filterOptions:a4 ascending:v6 shouldUpdate:0 providerIdentifier:v10];
  }

  return v12;
}

- (int64_t)resultsLimit
{
  return self->_resultsLimit;
}

- (unint64_t)filterOptions
{
  return self->_filterOptions;
}

- (BOOL)ascending
{
  return self->_ascending;
}

- (BOOL)shouldUpdate
{
  return self->_shouldUpdate;
}

- (NSString)providerIdentifier
{
  return self->_providerIdentifier;
}

- (void).cxx_destruct
{
}

@end