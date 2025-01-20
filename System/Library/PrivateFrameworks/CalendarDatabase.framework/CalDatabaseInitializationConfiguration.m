@interface CalDatabaseInitializationConfiguration
- (CDBPreferences)preferences;
- (CalCalendarDataContainerProvider)dataContainerProvider;
- (CalDatabaseInitializationConfiguration)initWithDirectoryURL:(id)a3;
- (NSURL)directoryURL;
- (id)description;
- (id)redactedDescription;
- (int)options;
- (void)setDataContainerProvider:(id)a3;
- (void)setDirectoryURL:(id)a3;
- (void)setOptions:(int)a3;
- (void)setPreferences:(id)a3;
@end

@implementation CalDatabaseInitializationConfiguration

- (CalCalendarDataContainerProvider)dataContainerProvider
{
  return self->_dataContainerProvider;
}

- (CDBPreferences)preferences
{
  return self->_preferences;
}

- (int)options
{
  return self->_options;
}

- (NSURL)directoryURL
{
  return self->_directoryURL;
}

- (CalDatabaseInitializationConfiguration)initWithDirectoryURL:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CalDatabaseInitializationConfiguration;
  v6 = [(CalDatabaseInitializationConfiguration *)&v16 init];
  v7 = v6;
  if (v5 && v6)
  {
    objc_storeStrong((id *)&v6->_directoryURL, a3);
    v8 = [v5 URLByAppendingPathComponent:*MEMORY[0x1E4F57898] isDirectory:1];
    v9 = (CalCalendarDataContainerProvider *)[objc_alloc(MEMORY[0x1E4F57760]) initWithCalendarDataContainerURL:v8];
    dataContainerProvider = v7->_dataContainerProvider;
    v7->_dataContainerProvider = v9;
    v11 = v9;

    v12 = [v5 path];
    uint64_t v13 = +[CDBPreferences preferencesForDirectory:v12];
    preferences = v7->_preferences;
    v7->_preferences = (CDBPreferences *)v13;
  }
  return v7;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"[<CalDatabaseInitializationConfiguration:%p> options=%i, directoryURL=%@, dataContainerProvider=%@ preferences=%@]", self, self->_options, self->_directoryURL, self->_dataContainerProvider, self->_preferences];
}

- (id)redactedDescription
{
  v2 = @"(not null)";
  if (self->_directoryURL) {
    v3 = @"(not null)";
  }
  else {
    v3 = @"(null)";
  }
  if (self->_dataContainerProvider) {
    v4 = @"(not null)";
  }
  else {
    v4 = @"(null)";
  }
  if (!self->_preferences) {
    v2 = @"(null)";
  }
  return (id)[NSString stringWithFormat:@"[<CalDatabaseInitializationConfiguration:%p> options=%i, directoryURL=%@, dataContainerProvider=%@ preferences=%@]", self, self->_options, v3, v4, v2];
}

- (void)setOptions:(int)a3
{
  self->_options = a3;
}

- (void)setDirectoryURL:(id)a3
{
}

- (void)setDataContainerProvider:(id)a3
{
}

- (void)setPreferences:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_dataContainerProvider, 0);
  objc_storeStrong((id *)&self->_directoryURL, 0);
}

@end