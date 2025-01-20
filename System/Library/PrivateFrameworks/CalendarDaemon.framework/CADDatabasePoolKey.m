@interface CADDatabasePoolKey
- (BOOL)isEqual:(id)a3;
- (CADDatabaseInitializationOptions)options;
- (CADDatabasePoolKey)initWithInitializationOptions:(id)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation CADDatabasePoolKey

- (CADDatabasePoolKey)initWithInitializationOptions:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CADDatabasePoolKey;
  v5 = [(CADDatabasePoolKey *)&v11 init];
  if (v5)
  {
    v5->_initOptions = [v4 databaseInitOptions] & 0xFFFFFFF9;
    uint64_t v6 = [v4 databaseDirectory];
    databaseDirectory = v5->_databaseDirectory;
    v5->_databaseDirectory = (NSURL *)v6;

    uint64_t v8 = [v4 calendarDataContainerProvider];
    calendarDataContainerProvider = v5->_calendarDataContainerProvider;
    v5->_calendarDataContainerProvider = (CalCalendarDataContainerProvider *)v8;

    v5->_unitTesting = [v4 unitTesting];
  }

  return v5;
}

- (unint64_t)hash
{
  uint64_t v2 = (37 * self->_initOptions);
  return [(NSURL *)self->_databaseDirectory hash] + v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarDataContainerProvider, 0);
  objc_storeStrong((id *)&self->_databaseDirectory, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = v4;
    BOOL v8 = self->_initOptions == v5[2]
      && ((databaseDirectory = self->_databaseDirectory, !((unint64_t)databaseDirectory | *((void *)v5 + 2)))
       || -[NSURL isEqual:](databaseDirectory, "isEqual:"))
      && ((calendarDataContainerProvider = self->_calendarDataContainerProvider,
           !((unint64_t)calendarDataContainerProvider | *((void *)v5 + 3)))
       || -[CalCalendarDataContainerProvider isEqual:](calendarDataContainerProvider, "isEqual:"))
      && self->_unitTesting == *((unsigned __int8 *)v5 + 32);
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (CADDatabaseInitializationOptions)options
{
  v3 = objc_alloc_init(CADDatabaseInitializationOptions);
  [(CADDatabaseInitializationOptions *)v3 setDatabaseInitOptions:self->_initOptions];
  [(CADDatabaseInitializationOptions *)v3 setDatabaseDirectory:self->_databaseDirectory];
  [(CADDatabaseInitializationOptions *)v3 setCalendarDataContainerProvider:self->_calendarDataContainerProvider];
  [(CADDatabaseInitializationOptions *)v3 setUnitTesting:self->_unitTesting];
  return v3;
}

- (id)description
{
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @"[CADDatabasePoolKey <%p>:", self);
  id v4 = v3;
  int initOptions = self->_initOptions;
  if (initOptions) {
    objc_msgSend(v3, "appendFormat:", @" options = %x", self->_initOptions);
  }
  databaseDirectory = self->_databaseDirectory;
  if (databaseDirectory)
  {
    v7 = [(NSURL *)databaseDirectory path];
    BOOL v8 = (void *)CalDatabaseCopyDirectoryPath();
    char v9 = [v7 isEqualToString:v8];

    if ((v9 & 1) == 0)
    {
      if (initOptions) {
        [v4 appendString:@"; "];
      }
      v10 = [(NSURL *)self->_databaseDirectory path];
      [v4 appendFormat:@" path = %@", v10];
    }
  }
  calendarDataContainerProvider = self->_calendarDataContainerProvider;
  if (calendarDataContainerProvider)
  {
    if (initOptions)
    {
      [v4 appendString:@"; "];
      calendarDataContainerProvider = self->_calendarDataContainerProvider;
    }
    [v4 appendFormat:@" containerProvider = %@", calendarDataContainerProvider];
  }
  if (self->_unitTesting)
  {
    if (initOptions) {
      [v4 appendString:@"; "];
    }
    [v4 appendString:@" unitTesting = YES"];
  }
  if (initOptions) {
    [v4 appendFormat:@"]"];
  }
  else {
    [v4 appendString:@"default]"];
  }
  return v4;
}

@end