@interface PersistentState
+ (id)loadFromStorage;
- (BOOL)absentCircleWithNoReason;
- (NSDate)applicationDate;
- (NSDate)lastWritten;
- (NSDate)pendingApplicationReminder;
- (NSNumber)debugShowLeftReason;
- (id)urlForStorage;
- (int)lastCircleStatus;
- (unsigned)defaultPendingApplicationReminderAlertInterval;
- (unsigned)pendingApplicationReminderAlertInterval;
- (void)setAbsentCircleWithNoReason:(BOOL)a3;
- (void)setApplicationDate:(id)a3;
- (void)setDebugShowLeftReason:(id)a3;
- (void)setLastCircleStatus:(int)a3;
- (void)setLastWritten:(id)a3;
- (void)setPendingApplicationReminder:(id)a3;
- (void)setPendingApplicationReminderAlertInterval:(unsigned int)a3;
- (void)writeToStorage;
@end

@implementation PersistentState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugShowLeftReason, 0);
  objc_storeStrong((id *)&self->_applicationDate, 0);
  objc_storeStrong((id *)&self->_pendingApplicationReminder, 0);

  objc_storeStrong((id *)&self->_lastWritten, 0);
}

- (void)setAbsentCircleWithNoReason:(BOOL)a3
{
  self->_absentCircleWithNoReason = a3;
}

- (BOOL)absentCircleWithNoReason
{
  return self->_absentCircleWithNoReason;
}

- (void)setDebugShowLeftReason:(id)a3
{
}

- (NSNumber)debugShowLeftReason
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (void)setApplicationDate:(id)a3
{
}

- (NSDate)applicationDate
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPendingApplicationReminderAlertInterval:(unsigned int)a3
{
  self->_pendingApplicationReminderAlertInterval = a3;
}

- (unsigned)pendingApplicationReminderAlertInterval
{
  return self->_pendingApplicationReminderAlertInterval;
}

- (void)setPendingApplicationReminder:(id)a3
{
}

- (NSDate)pendingApplicationReminder
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLastWritten:(id)a3
{
}

- (NSDate)lastWritten
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLastCircleStatus:(int)a3
{
  self->_lastCircleStatus = a3;
}

- (int)lastCircleStatus
{
  return self->_lastCircleStatus;
}

- (void)writeToStorage
{
  v25[0] = @"lastCircleStatus";
  v3 = +[NSNumber numberWithInt:[(PersistentState *)self lastCircleStatus]];
  v26[0] = v3;
  v25[1] = @"lastWritten";
  v4 = +[NSDate date];
  v26[1] = v4;
  v25[2] = @"pendingApplicationReminder";
  v5 = [(PersistentState *)self pendingApplicationReminder];
  v6 = v5;
  if (!v5)
  {
    v6 = +[NSDate distantFuture];
  }
  v26[2] = v6;
  v25[3] = @"applicationDate";
  v7 = [(PersistentState *)self applicationDate];
  v8 = v7;
  if (!v7)
  {
    v8 = +[NSDate distantPast];
  }
  v26[3] = v8;
  v25[4] = @"pendingApplicationReminderAlertInterval";
  v9 = +[NSNumber numberWithUnsignedInt:[(PersistentState *)self pendingApplicationReminderAlertInterval]];
  v26[4] = v9;
  v25[5] = @"absentCircleWithNoReason";
  v10 = +[NSNumber numberWithBool:[(PersistentState *)self absentCircleWithNoReason]];
  v26[5] = v10;
  v11 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:6];

  if (!v7) {
  if (!v5)
  }

  v12 = [(PersistentState *)self debugShowLeftReason];

  if (v12)
  {
    id v13 = [v11 mutableCopy];
    v14 = [(PersistentState *)self debugShowLeftReason];
    [v13 setObject:v14 forKeyedSubscript:@"debugShowLeftReason"];

    id v15 = [v13 copy];
    v11 = v15;
  }
  NSLog(@"writeToStorage plist=%@", v11);
  id v24 = 0;
  v16 = +[NSPropertyListSerialization dataWithPropertyList:v11 format:100 options:0 error:&v24];
  id v17 = v24;
  v18 = v17;
  if (v16)
  {
    v19 = [(PersistentState *)self urlForStorage];
    id v23 = v18;
    unsigned __int8 v20 = [v16 writeToURL:v19 options:1 error:&v23];
    id v21 = v23;

    if ((v20 & 1) == 0)
    {
      v22 = [(PersistentState *)self urlForStorage];
      NSLog(@"Can't write to %@, error=%@", v22, v21);
    }
    v18 = v21;
  }
  else
  {
    NSLog(@"Can't serialize %@: %@", v11, v17);
  }
}

- (unsigned)defaultPendingApplicationReminderAlertInterval
{
  return 86400;
}

- (id)urlForStorage
{
  return +[NSURL fileURLWithPath:@"/var/mobile/Library/Preferences/com.apple.security.CircleJoinRequested.plist" isDirectory:0];
}

+ (id)loadFromStorage
{
  v2 = objc_alloc_init(PersistentState);
  if (v2)
  {
    CFStringRef v29 = @"lastWritten";
    v3 = +[NSDate distantPast];
    v30 = v3;
    v4 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];

    v5 = [(PersistentState *)v2 urlForStorage];
    id v28 = 0;
    v6 = +[NSData dataWithContentsOfURL:v5 options:0 error:&v28];
    id v7 = v28;

    if (v6)
    {
      id v26 = 0;
      unint64_t v27 = 0xAAAAAAAAAAAAAAAALL;
      v8 = +[NSPropertyListSerialization propertyListWithData:v6 options:2 format:&v27 error:&v26];
      id v9 = v26;

      if (v8)
      {
        id v10 = v8;

        v4 = v10;
      }
      else
      {
        NSLog(@"Can't deserialize %@, e=%@", v6, v9);
      }
    }
    else
    {
      v11 = [(PersistentState *)v2 urlForStorage];
      NSLog(@"Can't read state data (p=%@, err=%@)", v11, v7);

      id v9 = v7;
    }
    v12 = [v4 objectForKeyedSubscript:@"lastCircleStatus"];
    if (v12)
    {
      id v13 = [v4 objectForKeyedSubscript:@"lastCircleStatus"];
      -[PersistentState setLastCircleStatus:](v2, "setLastCircleStatus:", [v13 intValue]);
    }
    else
    {
      [(PersistentState *)v2 setLastCircleStatus:3];
    }

    v14 = [v4 objectForKeyedSubscript:@"lastWritten"];
    [(PersistentState *)v2 setLastWritten:v14];

    id v15 = [v4 objectForKeyedSubscript:@"pendingApplicationReminder"];
    if (v15)
    {
      [(PersistentState *)v2 setPendingApplicationReminder:v15];
    }
    else
    {
      v16 = +[NSDate distantFuture];
      [(PersistentState *)v2 setPendingApplicationReminder:v16];
    }
    id v17 = [v4 objectForKeyedSubscript:@"applicationDate"];
    if (v17)
    {
      [(PersistentState *)v2 setApplicationDate:v17];
    }
    else
    {
      v18 = +[NSDate distantPast];
      [(PersistentState *)v2 setApplicationDate:v18];
    }
    v19 = [v4 objectForKeyedSubscript:@"debugShowLeftReason"];
    [(PersistentState *)v2 setDebugShowLeftReason:v19];

    unsigned __int8 v20 = [v4 objectForKeyedSubscript:@"pendingApplicationReminderAlertInterval"];
    if (v20)
    {
      id v21 = [v4 objectForKeyedSubscript:@"pendingApplicationReminderAlertInterval"];
      -[PersistentState setPendingApplicationReminderAlertInterval:](v2, "setPendingApplicationReminderAlertInterval:", [v21 unsignedIntValue]);
    }
    else
    {
      [(PersistentState *)v2 setPendingApplicationReminderAlertInterval:[(PersistentState *)v2 defaultPendingApplicationReminderAlertInterval]];
    }

    v22 = [v4 objectForKeyedSubscript:@"absentCircleWithNoReason"];
    if (v22)
    {
      id v23 = [v4 objectForKeyedSubscript:@"absentCircleWithNoReason"];
      -[PersistentState setAbsentCircleWithNoReason:](v2, "setAbsentCircleWithNoReason:", [v23 intValue] != 0);
    }
    else
    {
      [(PersistentState *)v2 setAbsentCircleWithNoReason:0];
    }

    id v24 = v2;
  }

  return v2;
}

@end