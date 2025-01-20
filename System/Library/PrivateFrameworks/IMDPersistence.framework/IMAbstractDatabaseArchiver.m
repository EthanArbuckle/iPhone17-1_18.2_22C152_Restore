@interface IMAbstractDatabaseArchiver
- (BOOL)copyDatabase:(id)a3;
- (BOOL)deleteFailedArchiveAtPath:(id)a3 error:(id *)a4;
- (IMAbstractDatabaseArchiver)initWithSourceDatabasePath:(id)a3 destinationDatabasePath:(id)a4;
- (NSString)destinationPath;
- (NSString)sourcePath;
- (void)dealloc;
@end

@implementation IMAbstractDatabaseArchiver

- (IMAbstractDatabaseArchiver)initWithSourceDatabasePath:(id)a3 destinationDatabasePath:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    long long v16 = xmmword_1E5F95030;
    long long v17 = *(_OWORD *)off_1E5F95040;
    uint64_t v18 = 23;
    uint64_t v7 = [NSString stringWithFormat:@"Unexpected nil '%@' in %s at %s:%d. %@", @"sourcePath", "-[IMAbstractDatabaseArchiver initWithSourceDatabasePath:destinationDatabasePath:]", IMFileLocationTrimFileName(), 23, objc_msgSend(NSString, "stringWithFormat:", &stru_1F084E970)];
    v8 = (void (*)(uint64_t))IMGetAssertionFailureHandler();
    if (v8)
    {
      v8(v7);
    }
    else if (IMOSLoggingEnabled())
    {
      v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v20 = v7;
        _os_log_impl(&dword_1AFB53000, v9, OS_LOG_TYPE_INFO, "ASSERTION FAILED: %@", buf, 0xCu);
      }
    }
  }
  if (!a4)
  {
    long long v16 = xmmword_1E5F95058;
    long long v17 = *(_OWORD *)off_1E5F95068;
    uint64_t v18 = 24;
    uint64_t v10 = [NSString stringWithFormat:@"Unexpected nil '%@' in %s at %s:%d. %@", @"destinationPath", "-[IMAbstractDatabaseArchiver initWithSourceDatabasePath:destinationDatabasePath:]", IMFileLocationTrimFileName(), 24, objc_msgSend(NSString, "stringWithFormat:", &stru_1F084E970)];
    v11 = (void (*)(uint64_t))IMGetAssertionFailureHandler();
    if (v11)
    {
      v11(v10);
    }
    else if (IMOSLoggingEnabled())
    {
      v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v20 = v10;
        _os_log_impl(&dword_1AFB53000, v12, OS_LOG_TYPE_INFO, "ASSERTION FAILED: %@", buf, 0xCu);
      }
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)IMAbstractDatabaseArchiver;
  v13 = [(IMAbstractDatabaseArchiver *)&v15 init];
  if (v13)
  {
    v13->_sourcePath = (NSString *)objc_msgSend((id)objc_msgSend(a3, "stringByExpandingTildeInPath"), "copy");
    v13->_destinationPath = (NSString *)objc_msgSend((id)objc_msgSend(a4, "stringByExpandingTildeInPath"), "copy");
  }
  return v13;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)IMAbstractDatabaseArchiver;
  [(IMAbstractDatabaseArchiver *)&v3 dealloc];
}

- (BOOL)copyDatabase:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [NSString stringWithFormat:@"Failure in %s at %s:%d. %@", "-[IMAbstractDatabaseArchiver copyDatabase:]", IMFileLocationTrimFileName(), 41, objc_msgSend(NSString, "stringWithFormat:", @"required override", 0x1AFC8466ALL, 0, "-[IMAbstractDatabaseArchiver copyDatabase:]", "-[IMAbstractDatabaseArchiver copyDatabase:]"];
  v5 = (void (*)(uint64_t))IMGetAssertionFailureHandler();
  if (v5)
  {
    v5(v4);
  }
  else if (IMOSLoggingEnabled())
  {
    v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v9 = v4;
      _os_log_impl(&dword_1AFB53000, v6, OS_LOG_TYPE_INFO, "ASSERTION FAILED: %@", buf, 0xCu);
    }
  }
  if (a3) {
    (*((void (**)(id, void, void))a3 + 2))(a3, 0, 0);
  }
  return 0;
}

- (BOOL)deleteFailedArchiveAtPath:(id)a3 error:(id *)a4
{
  NSLog(&cfstr_AttemptingToDe.isa, a2, a3, a4);
  id v7 = 0;
  IMDDatabaseDelete((uint64_t)a3, (uint64_t *)&v7);
  id v5 = v7;
  if (v7)
  {
    NSLog(&cfstr_UnableToDelete.isa, [v7 localizedDescription], a3);
  }
  return v5 == 0;
}

- (NSString)destinationPath
{
  return self->_destinationPath;
}

- (NSString)sourcePath
{
  return self->_sourcePath;
}

@end