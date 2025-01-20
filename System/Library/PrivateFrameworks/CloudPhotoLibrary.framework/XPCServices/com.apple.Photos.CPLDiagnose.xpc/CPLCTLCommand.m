@interface CPLCTLCommand
+ (Class)commandClassWithName:(id)a3;
+ (NSString)commandName;
+ (NSString)help;
+ (NSString)parameters;
+ (NSString)shortDescription;
+ (NSString)toolName;
+ (NSString)toolPath;
+ (id)allCommandNames;
+ (id)commandWithArgc:(int)a3 argv:(char *)a4;
+ (id)commandWithName:(id)a3;
+ (int)executeMainToolWithName:(id)a3 version:(id)a4 argc:(int)a5 argv:(char *)a6;
+ (void)_printUsage;
+ (void)register;
+ (void)registerCommandClass:(Class)a3;
+ (void)setToolName:(id)a3;
+ (void)setToolPath:(id)a3;
- (BOOL)_shouldUseTimeoutForLibraryOpening;
- (BOOL)isATTY;
- (BOOL)parseCommandOptionsWithArgc:(int)a3 argv:(char *)a4;
- (BOOL)quiet;
- (BOOL)supportsEscapeSequences;
- (BOOL)usesColor;
- (CPLCTLCommand)init;
- (CPLCTLCommand)parentCommand;
- (CPLDaemonConnection)daemonConnection;
- (CPLOutput)logOutput;
- (CPLOutput)output;
- (CPLPhotosDaemonConnection)photosDaemonConnection;
- (CPLPrivateEngine)privateEngine;
- (CPLStoreCommand)storeCommand;
- (NSString)additionalVersionInfo;
- (NSString)commandVersion;
- (NSString)defaultLibraryIdentifier;
- (NSURL)defaultLibraryURL;
- (char)printHeader;
- (id)_tempFolderURL;
- (id)displayableNameForLibraryManager:(id)a3;
- (id)getEngineWrapperStatusesWithError:(id *)a3;
- (id)getLibraryIdentifiersWithDomain:(int64_t)a3 error:(id *)a4;
- (id)openedLibraryManagerWithError:(id *)a3;
- (id)openedLibraryManagerWithLibraryIdentifier:(id)a3 error:(id *)a4;
- (id)openedLibraryManagerWithLibraryIdentifier:(id)a3 targetUserIdentifier:(unsigned int)a4 error:(id *)a5;
- (id)openedLibraryManagerWithLibraryIdentifier:(id)a3 timeout:(BOOL)a4 error:(id *)a5;
- (id)openedLibraryManagerWithLibraryIdentifier:(id)a3 timeout:(BOOL)a4 withTargetUserIdentifier:(unsigned int)a5 error:(id *)a6;
- (id)openedLibraryManagerWithTargetUserIdentifier:(unsigned int)a3 error:(id *)a4;
- (id)openedLibraryManagerWithTimeout:(BOOL)a3 error:(id *)a4;
- (id)openedLibraryManagerWithTimeout:(BOOL)a3 withTargetUserIdentifier:(unsigned int)a4 error:(id *)a5;
- (id)photosLibraryURLFromBaseURL:(id)a3;
- (id)tempFolderURLWithError:(id *)a3;
- (id)urlWithinHomeWithPath:(id)a3 isDirectory:(BOOL)a4;
- (int)execute;
- (int)outputFd;
- (int)remainingSpace;
- (void)_setInterruptionHandler:(id)a3;
- (void)beginOutputTo:(id)a3;
- (void)clearScreen;
- (void)closeLibraryManager:(id)a3;
- (void)closeOutput;
- (void)cplInterrupt;
- (void)cursorDown:(unsigned int)a3;
- (void)cursorGotoLineStart;
- (void)cursorLeft:(unsigned int)a3;
- (void)cursorRestore;
- (void)cursorRight:(unsigned int)a3;
- (void)cursorSave;
- (void)cursorToStartOfLine;
- (void)cursorToTopLeft;
- (void)cursorUp:(unsigned int)a3;
- (void)disableOutput;
- (void)endLine;
- (void)endLineIfNecessary;
- (void)endOutputTo:(id)a3;
- (void)eraseEndOfLine;
- (void)eraseLine;
- (void)eraseScreenDown;
- (void)eraseScreenUp;
- (void)eraseStartOfLine;
- (void)flush;
- (void)forceResetColorsAndAttributes;
- (void)forgetRemainingSpace;
- (void)prepareToRunWithinCommand:(id)a3;
- (void)printError:(id)a3;
- (void)printError:(id)a3 arguments:(char *)a4;
- (void)printFormat:(id)a3;
- (void)printFormat:(id)a3 arguments:(char *)a4;
- (void)printHeaderIfNecessary:(char)a3;
- (void)printJSONData:(id)a3;
- (void)printJSONObject:(id)a3;
- (void)put:(id)a3;
- (void)putBright:(id)a3;
- (void)putBrightF:(id)a3;
- (void)putF:(id)a3;
- (void)putF:(id)a3 arguments:(char *)a4;
- (void)putHighlight:(id)a3;
- (void)putUnderline:(id)a3;
- (void)puts:(const char *)a3;
- (void)resetColorsAndAttributes;
- (void)setLogOutputFd:(int)a3;
- (void)setParentCommand:(id)a3;
- (void)setPrintHeader:(char)a3;
- (void)startFgColor:(int)a3 bgColor:(int)a4 attr:(int)a5;
- (void)startInterruptibleOperationWithInterruptionBlock:(id)a3;
- (void)startNewLine;
- (void)stopInterruptibleOperation;
@end

@implementation CPLCTLCommand

+ (NSString)toolPath
{
  return (NSString *)(id)qword_1000413B0;
}

+ (void)setToolPath:(id)a3
{
  qword_1000413B0 = (uint64_t)[a3 copy];
  _objc_release_x1();
}

+ (void)setToolName:(id)a3
{
  id v5 = a3;
  if (qword_1000413B8) {
    sub_10002032C((uint64_t)a1, a2);
  }
  id v8 = v5;
  id v6 = [v5 copy];
  v7 = (void *)qword_1000413B8;
  qword_1000413B8 = (uint64_t)v6;
}

+ (NSString)toolName
{
  v2 = (void *)qword_1000413B8;
  if (!qword_1000413B8) {
    sub_100020468((uint64_t)a1, a2);
  }
  return (NSString *)v2;
}

+ (id)commandWithArgc:(int)a3 argv:(char *)a4
{
  uint64_t v5 = (a3 - 1);
  if (a3 == 1)
  {
    objc_msgSend(a1, "commandWithName:", @"help", a4);
    id v6 = (CPLHelpCommand *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  v7 = a4 + 1;
  id v8 = +[NSString stringWithUTF8String:a4[1]];
  if (!v8)
  {
    v10 = [a1 commandWithName:@"help"];
    [(CPLCTLCommand *)v10 printFormat:@"Invalid command name"];
    id v6 = 0;
    goto LABEL_10;
  }
  v9 = [a1 commandWithName:v8];
  if (!v9)
  {
    v10 = [a1 commandWithName:@"help"];
    [(CPLCTLCommand *)v10 printFormat:@"Invalid command '%@'", v8];
    goto LABEL_9;
  }
  v10 = v9;
  if ([(CPLHelpCommand *)v9 parseCommandOptionsWithArgc:v5 argv:v7])
  {
LABEL_9:
    v10 = v10;
    id v6 = v10;
    goto LABEL_10;
  }
  id v6 = objc_alloc_init(CPLHelpCommand);
  [(CPLHelpCommand *)v6 setHelpCommandName:v8];
LABEL_10:

LABEL_11:
  return v6;
}

+ (void)register
{
}

+ (id)commandWithName:(id)a3
{
  id v3 = objc_alloc_init((Class)[a1 commandClassWithName:a3]);
  return v3;
}

+ (Class)commandClassWithName:(id)a3
{
  return (Class)[(id)qword_1000413C0 objectForKey:a3];
}

+ (id)allCommandNames
{
  return (id)qword_1000413C8;
}

+ (void)registerCommandClass:(Class)a3
{
  if (!qword_1000413C0)
  {
    id v6 = objc_alloc_init((Class)NSMutableArray);
    v7 = (void *)qword_1000413C8;
    qword_1000413C8 = (uint64_t)v6;

    id v8 = objc_alloc_init((Class)NSMutableDictionary);
    v9 = (void *)qword_1000413C0;
    qword_1000413C0 = (uint64_t)v8;
  }
  id v11 = [(objc_class *)a3 commandName];
  v10 = objc_msgSend((id)qword_1000413C0, "objectForKey:");

  if (v10) {
    sub_1000205A4((uint64_t)v11, (uint64_t)a2, (uint64_t)a1);
  }
  [(id)qword_1000413C0 setObject:a3 forKey:v11];
  [(id)qword_1000413C8 addObject:v11];
}

- (NSString)commandVersion
{
  return 0;
}

- (CPLCTLCommand)init
{
  v8.receiver = self;
  v8.super_class = (Class)CPLCTLCommand;
  v2 = [(CPLCTLCommand *)&v8 init];
  if (v2)
  {
    id v3 = [[CPLOutput alloc] initWithFileDescriptor:2];
    output = v2->_output;
    v2->_output = v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.cplctl.interruptionqueue", 0);
    interruptionQueue = v2->_interruptionQueue;
    v2->_interruptionQueue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

- (BOOL)quiet
{
  return 0;
}

+ (NSString)commandName
{
  v4 = +[NSAssertionHandler currentHandler];
  dispatch_queue_t v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Tools/cplctl/CPLCTLCommand.m"];
  uint64_t v6 = objc_opt_class();
  v7 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, a1, v5, 190, @"+[%@ %@] should be overriden", v6, v7 object file lineNumber description];

  abort();
}

+ (NSString)shortDescription
{
  v4 = +[NSAssertionHandler currentHandler];
  dispatch_queue_t v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Tools/cplctl/CPLCTLCommand.m"];
  uint64_t v6 = objc_opt_class();
  v7 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, a1, v5, 195, @"+[%@ %@] should be overriden", v6, v7 object file lineNumber description];

  abort();
}

+ (NSString)parameters
{
  return 0;
}

+ (NSString)help
{
  return 0;
}

- (BOOL)parseCommandOptionsWithArgc:(int)a3 argv:(char *)a4
{
  if (a3 != 1)
  {
    uint64_t v6 = [(id)objc_opt_class() commandName];
    [(CPLCTLCommand *)self printFormat:@"Invalid parameters for %@", v6];
  }
  return a3 == 1;
}

- (void)setLogOutputFd:(int)a3
{
  if (a3 < 0)
  {
    [(CPLCTLCommand *)self printFormat:@"invalid log output fd=%d.", *(void *)&a3];
  }
  else
  {
    self->_logOutput = [[CPLOutput alloc] initWithFileDescriptor:*(void *)&a3];
    _objc_release_x1();
  }
}

- (int)execute
{
  id v3 = [(id)objc_opt_class() commandName];
  [(CPLCTLCommand *)self printFormat:@"%@ is not implemented yet.", v3];

  return 1;
}

- (BOOL)_shouldUseTimeoutForLibraryOpening
{
  v2 = +[NSProcessInfo processInfo];
  id v3 = [v2 environment];
  v4 = [v3 objectForKeyedSubscript:@"CPLCTL_TIMEOUT"];

  if (v4) {
    unsigned __int8 v5 = [v4 BOOLValue];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (id)openedLibraryManagerWithLibraryIdentifier:(id)a3 error:(id *)a4
{
  return [(CPLCTLCommand *)self openedLibraryManagerWithLibraryIdentifier:a3 targetUserIdentifier:0 error:a4];
}

- (id)openedLibraryManagerWithLibraryIdentifier:(id)a3 targetUserIdentifier:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  v9 = [(CPLCTLCommand *)self openedLibraryManagerWithLibraryIdentifier:v8 timeout:[(CPLCTLCommand *)self _shouldUseTimeoutForLibraryOpening] withTargetUserIdentifier:v6 error:a5];

  return v9;
}

- (id)openedLibraryManagerWithLibraryIdentifier:(id)a3 timeout:(BOOL)a4 error:(id *)a5
{
  return [(CPLCTLCommand *)self openedLibraryManagerWithLibraryIdentifier:a3 timeout:a4 withTargetUserIdentifier:0 error:a5];
}

- (id)openedLibraryManagerWithLibraryIdentifier:(id)a3 timeout:(BOOL)a4 withTargetUserIdentifier:(unsigned int)a5 error:(id *)a6
{
  id v9 = a3;
  v10 = [(CPLCTLCommand *)self privateEngine];
  id v11 = v10;
  if (v10)
  {
    id v12 = [v10 libraryManager];
    goto LABEL_20;
  }
  id v12 = [objc_alloc((Class)CPLLibraryManager) initForManagementWithLibraryIdentifier:v9];
  [v12 setDelegate:self];
  v13 = +[NSDate date];
  v14 = dispatch_group_create();
  dispatch_group_enter(v14);
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v44 = 0x3032000000;
  v45 = sub_10000D014;
  v46 = sub_10000D024;
  id v47 = 0;
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_10000D02C;
  v36[3] = &unk_100034D50;
  p_long long buf = &buf;
  v15 = v14;
  v37 = v15;
  [v12 openWithCompletionHandler:v36];
  if (a4)
  {
    dispatch_time_t v16 = dispatch_time(0, 30000000000);
    if (dispatch_group_wait(v15, v16))
    {
      NSErrorUserInfoKey v41 = NSLocalizedDescriptionKey;
      CFStringRef v42 = @"Timed out opening library manager";
      v17 = +[NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
      id v18 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:60 userInfo:v17];

      v19 = dispatch_get_global_queue(0, 0);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000D094;
      block[3] = &unk_100034DA0;
      v35 = &buf;
      block[4] = self;
      id v33 = v13;
      id v34 = v12;
      dispatch_group_notify(v15, v19, block);

      goto LABEL_9;
    }
  }
  else
  {
    while (1)
    {
      dispatch_time_t v20 = dispatch_time(0, 10000000000);
      if (!dispatch_group_wait(v15, v20)) {
        break;
      }
      [(CPLCTLCommand *)self printFormat:@"Waiting to get a library manager"];
    }
  }
  id v18 = *(id *)(*((void *)&buf + 1) + 40);
LABEL_9:

  _Block_object_dispose(&buf, 8);
  if (v18)
  {
    if (!_CPLSilentLogging)
    {
      v21 = sub_10000D278();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v18;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "Error trying to open daemon's library manager: %@", (uint8_t *)&buf, 0xCu);
      }
    }
    if (a6)
    {
      if (([v9 isEqualToString:CPLLibraryIdentifierSystemLibrary] & 1) == 0)
      {
        id v22 = objc_alloc((Class)NSError);
        v31 = [v18 domain];
        id v23 = [v18 code];
        v39[0] = NSLocalizedDescriptionKey;
        id v24 = objc_alloc((Class)NSString);
        v25 = [v18 localizedDescription];
        id v26 = [v24 initWithFormat:@"%@ (%@)", v25, v9];
        v39[1] = NSUnderlyingErrorKey;
        v40[0] = v26;
        v40[1] = v18;
        v27 = +[NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:2];
        id v28 = [v22 initWithDomain:v31 code:v23 userInfo:v27];

        id v18 = v28;
      }

      id v18 = v18;
      *a6 = v18;
    }
    else
    {
      v29 = [v18 localizedDescription];
      [(CPLCTLCommand *)self printFormat:@"Can't get access to daemon's library manager for %@: %@", v9, v29];
    }
    id v12 = 0;
  }
LABEL_20:

  return v12;
}

- (NSString)defaultLibraryIdentifier
{
  defaultLibraryIdentifier = self->_defaultLibraryIdentifier;
  if (defaultLibraryIdentifier)
  {
    id v3 = defaultLibraryIdentifier;
  }
  else
  {
    unsigned __int8 v5 = +[NSProcessInfo processInfo];
    uint64_t v6 = [v5 environment];
    v7 = [v6 objectForKeyedSubscript:@"CPLDefaultLibraryIdentifier"];

    if (!v7)
    {
      storeCommand = self->_storeCommand;
      if (storeCommand)
      {
        v7 = [(CPLStoreCommand *)storeCommand defaultLibraryIdentifier];
      }
      else
      {
        v7 = 0;
      }
    }
    id v9 = (void *)CPLLibraryIdentifierSystemLibrary;
    if (v7) {
      id v9 = v7;
    }
    id v3 = v9;
  }
  return v3;
}

- (id)photosLibraryURLFromBaseURL:(id)a3
{
  id v3 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v4 = [v3 pathComponents];
  id v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v15 = v3;
    id v6 = 0;
    uint64_t v7 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (v6)
        {
          uint64_t v11 = [v6 URLByAppendingPathComponent:v9 isDirectory:1];

          id v6 = (id)v11;
        }
        else
        {
          id v6 = [objc_alloc((Class)NSURL) initFileURLWithPath:v9 isDirectory:1];
        }
        id v12 = [v9 pathExtension];
        unsigned int v13 = [v12 isEqualToString:@"photoslibrary"];

        if (v13)
        {
          id v5 = v6;
          id v6 = v5;
          goto LABEL_14;
        }
      }
      id v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v5) {
        continue;
      }
      break;
    }
LABEL_14:
    id v3 = v15;
  }
  else
  {
    id v6 = 0;
  }

  return v5;
}

- (id)openedLibraryManagerWithTimeout:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  uint64_t v7 = [(CPLCTLCommand *)self defaultLibraryIdentifier];
  id v8 = [(CPLCTLCommand *)self openedLibraryManagerWithLibraryIdentifier:v7 timeout:v5 error:a4];

  return v8;
}

- (id)openedLibraryManagerWithTimeout:(BOOL)a3 withTargetUserIdentifier:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  BOOL v7 = a3;
  id v9 = [(CPLCTLCommand *)self defaultLibraryIdentifier];
  v10 = [(CPLCTLCommand *)self openedLibraryManagerWithLibraryIdentifier:v9 timeout:v7 withTargetUserIdentifier:v6 error:a5];

  return v10;
}

- (id)openedLibraryManagerWithError:(id *)a3
{
  BOOL v5 = [(CPLCTLCommand *)self defaultLibraryIdentifier];
  uint64_t v6 = [(CPLCTLCommand *)self openedLibraryManagerWithLibraryIdentifier:v5 error:a3];

  return v6;
}

- (id)openedLibraryManagerWithTargetUserIdentifier:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  BOOL v7 = [(CPLCTLCommand *)self defaultLibraryIdentifier];
  id v8 = [(CPLCTLCommand *)self openedLibraryManagerWithLibraryIdentifier:v7 targetUserIdentifier:v5 error:a4];

  return v8;
}

- (void)closeLibraryManager:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CPLCTLCommand *)self privateEngine];
  if (!v5)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10000D7F4;
    v7[3] = &unk_100034DC8;
    dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
    uint64_t v6 = v8;
    [v4 closeWithCompletionHandler:v7];
    dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  }
}

- (id)displayableNameForLibraryManager:(id)a3
{
  return @"cplctl";
}

+ (void)_printUsage
{
  id v4 = objc_alloc_init(CPLHelpCommand);
  [(CPLHelpCommand *)v4 setStandaloneTool:1];
  id v3 = [a1 commandName];
  [(CPLHelpCommand *)v4 setHelpCommandName:v3];

  [(CPLHelpCommand *)v4 execute];
}

+ (int)executeMainToolWithName:(id)a3 version:(id)a4 argc:(int)a5 argv:(char *)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  id v11 = a4;
  [a1 register];
  if (!_CPLSilentLogging)
  {
    unsigned int v13 = sub_10000D278();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412290;
      id v32 = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Hello from %@", buf, 0xCu);
    }
  }
  +[CPLCTLCommand setToolName:v10];
  if (v7 != 2) {
    goto LABEL_10;
  }
  v14 = a6[1];
  if (!strcmp(v14, "-v") || !strcmp(v14, "--version"))
  {
    id v20 = [a1 newMainCommandWithToolname:v10];
    v21 = v20;
    if (v20)
    {
      id v22 = [v20 commandVersion];
      id v23 = v22;
      if (v22)
      {
        if (v11)
        {
          id v24 = [objc_alloc((Class)NSString) initWithFormat:@"%@ (%@)", v11, v22];

          id v11 = v24;
        }
        else
        {
          id v11 = v22;
        }
      }
      uint64_t v25 = [v21 additionalVersionInfo];
      id v26 = (void *)v25;
      if (v25)
      {
        uint64_t v27 = [v11 stringByAppendingFormat:@" [%@]", v25];

        id v11 = (id)v27;
      }
    }
    if (!v11)
    {
      __CPLVersion();
      id v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v28 = __stdoutp;
    v29 = basename(*a6);
    id v11 = v11;
    fprintf(v28, "%s %s\n", v29, (const char *)[v11 UTF8String]);

    goto LABEL_28;
  }
  if (!strcmp(v14, "-h") || !strcmp(v14, "--help"))
  {
    [a1 _printUsage];
LABEL_28:
    int v19 = 0;
    goto LABEL_29;
  }
LABEL_10:
  id v16 = [a1 newMainCommandWithToolname:v10];
  long long v17 = v16;
  if (v16)
  {
    unsigned int v18 = [v16 parseCommandOptionsWithArgc:v7 argv:a6];
    if (v18)
    {
      int v19 = [v17 execute];
    }
    else
    {
      [a1 _printUsage];
      int v19 = 22;
    }
  }
  else
  {
    int v19 = -1;
  }

LABEL_29:

  return v19;
}

- (NSString)additionalVersionInfo
{
  return 0;
}

- (CPLDaemonConnection)daemonConnection
{
  p_daemonConnection = &self->_daemonConnection;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemonConnection);

  if (WeakRetained)
  {
    id v4 = (CPLDaemonConnection *)objc_loadWeakRetained((id *)p_daemonConnection);
  }
  else
  {
    id v4 = objc_alloc_init(CPLDaemonConnection);
    objc_storeWeak((id *)p_daemonConnection, v4);
  }
  return v4;
}

- (id)getEngineWrapperStatusesWithError:(id *)a3
{
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x3032000000;
  v53 = sub_10000D014;
  v54 = sub_10000D024;
  id v55 = 0;
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x3032000000;
  id v47 = sub_10000D014;
  v48 = sub_10000D024;
  id v49 = 0;
  id v4 = [(CPLCTLCommand *)self daemonConnection];
  [v4 queue];
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x2020000000;
  char v43 = 1;
  v40[0] = 0;
  v40[1] = v40;
  void v40[2] = 0x2020000000;
  char v41 = 0;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3032000000;
  v38[3] = sub_10000D014;
  v38[4] = sub_10000D024;
  id v39 = 0;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_10000E0E0;
  v34[3] = &unk_100034DF0;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v35 = v5;
  v36 = v40;
  v37 = v38;
  uint64_t v6 = objc_retainBlock(v34);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10000E160;
  v28[3] = &unk_100034E40;
  v31 = v38;
  id v32 = v40;
  id v7 = v4;
  id v29 = v7;
  dispatch_semaphore_t v8 = v6;
  id v30 = v8;
  id v33 = &v44;
  id v9 = objc_retainBlock(v28);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10000E398;
  v22[3] = &unk_100034E90;
  uint64_t v25 = v38;
  id v10 = v5;
  id v23 = v10;
  id v11 = v8;
  id v24 = v11;
  id v26 = &v44;
  uint64_t v27 = v42;
  id v12 = objc_retainBlock(v22);
  unsigned int v13 = ((void (*)(void *))v9[2])(v9);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000E558;
  v18[3] = &unk_100034EE0;
  v14 = v11;
  id v19 = v14;
  id v20 = &v50;
  v21 = &v44;
  [v13 getEngineWrapperStatusesWithCompletionHandler:v18];

  ((void (*)(void *))v12[2])(v12);
  id v15 = (void *)v51[5];
  if (a3 && !v15)
  {
    *a3 = (id) v45[5];
    id v15 = (void *)v51[5];
  }
  id v16 = v15;

  _Block_object_dispose(v38, 8);
  _Block_object_dispose(v40, 8);
  _Block_object_dispose(v42, 8);

  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v50, 8);

  return v16;
}

- (CPLPhotosDaemonConnection)photosDaemonConnection
{
  p_photosDaemonConnection = &self->_photosDaemonConnection;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_photosDaemonConnection);

  if (WeakRetained)
  {
    id v4 = (CPLPhotosDaemonConnection *)objc_loadWeakRetained((id *)p_photosDaemonConnection);
  }
  else
  {
    id v4 = objc_alloc_init(CPLPhotosDaemonConnection);
    objc_storeWeak((id *)p_photosDaemonConnection, v4);
  }
  return v4;
}

- (id)getLibraryIdentifiersWithDomain:(int64_t)a3 error:(id *)a4
{
  uint64_t v6 = [(CPLCTLCommand *)self photosDaemonConnection];
  id v7 = [v6 managementServiceWithError:a4];
  if (v7)
  {
    dispatch_semaphore_t v8 = [v6 queue];
    uint64_t v40 = 0;
    char v41 = &v40;
    uint64_t v42 = 0x3032000000;
    char v43 = sub_10000D014;
    uint64_t v44 = sub_10000D024;
    id v45 = 0;
    uint64_t v34 = 0;
    id v35 = &v34;
    uint64_t v36 = 0x3032000000;
    v37 = sub_10000D014;
    v38 = sub_10000D024;
    id v39 = 0;
    id v9 = objc_alloc_init(PLPhotoLibrarySearchCriteria);
    [(PLPhotoLibrarySearchCriteria *)v9 setDomain:a3];
    dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x2020000000;
    char v33 = 0;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10000EAC0;
    v26[3] = &unk_100034F08;
    id v11 = v8;
    uint64_t v27 = v11;
    id v29 = v32;
    id v30 = &v34;
    v31 = &v40;
    id v12 = v10;
    id v28 = v12;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10000EB78;
    v24[3] = &unk_100034F30;
    unsigned int v13 = objc_retainBlock(v26);
    id v25 = v13;
    v14 = [v7 remoteObjectProxyWithErrorHandler:v24];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10000EB90;
    v22[3] = &unk_100034F58;
    id v15 = v13;
    id v23 = v15;
    [v14 findPhotoLibraryIdentifiersMatchingSearchCriteria:v9 reply:v22];

    dispatch_time_t v16 = dispatch_time(0, 30000000000);
    if (dispatch_semaphore_wait(v12, v16))
    {
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10000EBA0;
      v20[3] = &unk_100034F80;
      v21 = v15;
      dispatch_sync(v11, v20);
    }
    long long v17 = (void *)v35[5];
    if (a4 && !v17)
    {
      *a4 = (id) v41[5];
      long long v17 = (void *)v35[5];
    }
    id v18 = v17;

    _Block_object_dispose(v32, 8);
    _Block_object_dispose(&v34, 8);

    _Block_object_dispose(&v40, 8);
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

- (void)printFormat:(id)a3 arguments:(char *)a4
{
  output = self->_output;
  id v7 = a3;
  [(CPLOutput *)output printFormat:v7 arguments:a4];
  [(CPLOutput *)self->_logOutput printFormat:v7 arguments:a4];
}

- (void)printFormat:(id)a3
{
  output = self->_output;
  id v5 = a3;
  [(CPLOutput *)output printFormat:v5 arguments:&v6];
  [(CPLOutput *)self->_logOutput printFormat:v5 arguments:&v6];
}

- (void)printError:(id)a3
{
  [(CPLCTLCommand *)self printError:a3 arguments:&v3];
}

- (void)printError:(id)a3 arguments:(char *)a4
{
  output = self->_output;
  id v7 = a3;
  [(CPLOutput *)output printError:v7 arguments:a4];
  [(CPLOutput *)self->_logOutput printError:v7 arguments:a4];
}

- (int)outputFd
{
  output = self->_output;
  if (output) {
    return [(CPLOutput *)output outputFd];
  }
  else {
    return -1;
  }
}

- (void)putBright:(id)a3
{
}

- (void)putHighlight:(id)a3
{
}

- (void)putUnderline:(id)a3
{
}

- (void)startFgColor:(int)a3 bgColor:(int)a4 attr:(int)a5
{
}

- (void)resetColorsAndAttributes
{
}

- (void)forceResetColorsAndAttributes
{
}

- (void)clearScreen
{
}

- (void)eraseEndOfLine
{
}

- (void)eraseStartOfLine
{
}

- (void)eraseLine
{
}

- (void)eraseScreenDown
{
}

- (void)eraseScreenUp
{
}

- (void)cursorSave
{
}

- (void)cursorRestore
{
}

- (void)cursorToStartOfLine
{
}

- (void)cursorGotoLineStart
{
}

- (void)cursorToTopLeft
{
}

- (void)cursorUp:(unsigned int)a3
{
}

- (void)cursorDown:(unsigned int)a3
{
}

- (void)cursorRight:(unsigned int)a3
{
}

- (void)cursorLeft:(unsigned int)a3
{
}

- (void)startNewLine
{
}

- (void)endLine
{
}

- (void)endLineIfNecessary
{
}

- (void)flush
{
}

- (int)remainingSpace
{
  return [(CPLOutput *)self->_output remainingSpace];
}

- (void)forgetRemainingSpace
{
  [(CPLOutput *)self->_output forgetRemainingSpace];
  logOutput = self->_logOutput;
  [(CPLOutput *)logOutput forgetRemainingSpace];
}

- (void)puts:(const char *)a3
{
  -[CPLOutput puts:](self->_output, "puts:");
  logOutput = self->_logOutput;
  [(CPLOutput *)logOutput puts:a3];
}

- (void)put:(id)a3
{
  output = self->_output;
  id v5 = a3;
  [(CPLOutput *)output put:v5];
  [(CPLOutput *)self->_logOutput put:v5];
}

- (void)putBrightF:(id)a3
{
  output = self->_output;
  id v5 = a3;
  [(CPLOutput *)output startFgColor:0xFFFFFFFFLL bgColor:0xFFFFFFFFLL attr:2];
  [(CPLOutput *)self->_output putF:v5 arguments:&v6];
  [(CPLOutput *)self->_logOutput putF:v5 arguments:&v6];

  [(CPLOutput *)self->_output resetColorsAndAttributes];
}

- (void)putF:(id)a3
{
  output = self->_output;
  id v5 = a3;
  [(CPLOutput *)output putF:v5 arguments:&v6];
  [(CPLOutput *)self->_logOutput putF:v5 arguments:&v6];
}

- (void)putF:(id)a3 arguments:(char *)a4
{
  output = self->_output;
  id v7 = a3;
  [(CPLOutput *)output putF:v7 arguments:a4];
  [(CPLOutput *)self->_logOutput putF:v7 arguments:a4];
}

- (void)disableOutput
{
  uint64_t v3 = objc_alloc_init(CPLOutputToVoid);
  [(CPLCTLCommand *)self beginOutputTo:v3];
}

- (void)beginOutputTo:(id)a3
{
  id v4 = (CPLOutput *)a3;
  outputStack = self->_outputStack;
  if (!outputStack)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    id v7 = self->_outputStack;
    self->_outputStack = v6;

    outputStack = self->_outputStack;
  }
  [(NSMutableArray *)outputStack addObject:self->_output];
  [(CPLOutput *)v4 setPrintHeader:[(CPLOutput *)self->_output printHeader]];
  output = self->_output;
  self->_output = v4;
}

- (void)endOutputTo:(id)a3
{
  id v7 = (CPLOutput *)a3;
  if (![(NSMutableArray *)self->_outputStack count]) {
    sub_100020760();
  }
  if (self->_output != v7) {
    sub_10002078C();
  }
  id v4 = [(NSMutableArray *)self->_outputStack lastObject];
  output = self->_output;
  self->_output = v4;

  [(CPLOutput *)self->_output setPrintHeader:[(CPLOutput *)v7 printHeader]];
  [(NSMutableArray *)self->_outputStack removeLastObject];
  if (![(NSMutableArray *)self->_outputStack count])
  {
    outputStack = self->_outputStack;
    self->_outputStack = 0;
  }
}

- (void)prepareToRunWithinCommand:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_output, a3);
  uint64_t v6 = [v5 logOutput];
  logOutput = self->_logOutput;
  self->_logOutput = v6;

  storeCommand = self->_storeCommand;
  self->_storeCommand = (CPLStoreCommand *)v5;
}

- (CPLPrivateEngine)privateEngine
{
  v2 = [(CPLCTLCommand *)self storeCommand];
  uint64_t v3 = [v2 store];
  id v4 = [v3 currentPrivateEngine];

  return (CPLPrivateEngine *)v4;
}

- (void)setPrintHeader:(char)a3
{
  uint64_t v3 = a3;
  -[CPLOutput setPrintHeader:](self->_output, "setPrintHeader:");
  outputStack = self->_outputStack;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000F3B4;
  v6[3] = &unk_100034FA0;
  char v7 = v3;
  [(NSMutableArray *)outputStack enumerateObjectsUsingBlock:v6];
  [(CPLOutput *)self->_logOutput setPrintHeader:v3];
}

- (void)printHeaderIfNecessary:(char)a3
{
  uint64_t v3 = a3;
  -[CPLOutput printHeaderIfNecessary:](self->_output, "printHeaderIfNecessary:");
  logOutput = self->_logOutput;
  [(CPLOutput *)logOutput printHeaderIfNecessary:v3];
}

- (void)printJSONObject:(id)a3
{
  output = self->_output;
  id v5 = a3;
  [(CPLOutput *)output printJSONObject:v5];
  [(CPLOutput *)self->_logOutput printJSONObject:v5];
}

- (void)printJSONData:(id)a3
{
  output = self->_output;
  id v5 = a3;
  [(CPLOutput *)output printJSONData:v5];
  [(CPLOutput *)self->_logOutput printJSONData:v5];
}

- (BOOL)isATTY
{
  return [(CPLOutput *)self->_output isATTY];
}

- (char)printHeader
{
  return [(CPLOutput *)self->_output printHeader];
}

- (BOOL)supportsEscapeSequences
{
  return [(CPLOutput *)self->_output supportsEscapeSequences];
}

- (BOOL)usesColor
{
  return [(CPLOutput *)self->_output usesColor];
}

- (void)closeOutput
{
  [(CPLOutput *)self->_output closeOutput];
  uint64_t v3 = objc_alloc_init(CPLOutputToVoid);
  output = self->_output;
  self->_output = (CPLOutput *)v3;

  logOutput = self->_logOutput;
  self->_logOutput = 0;
}

- (void)_setInterruptionHandler:(id)a3
{
  id v4 = a3;
  interruptionQueue = self->_interruptionQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000F5D4;
  v7[3] = &unk_100034FF0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)interruptionQueue, v7);
}

- (void)startInterruptibleOperationWithInterruptionBlock:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_storeCommand)
  {
    interruptionQueue = self->_interruptionQueue;
    char v7 = _NSConcreteStackBlock;
    uint64_t v8 = 3221225472;
    id v9 = sub_10000F81C;
    dispatch_semaphore_t v10 = &unk_100035018;
    id v11 = self;
    id v12 = v4;
    dispatch_sync((dispatch_queue_t)interruptionQueue, &v7);
    -[CPLStoreCommand startInterruptibleOperation:](self->_storeCommand, "startInterruptibleOperation:", self, v7, v8, v9, v10, v11);
  }
  else
  {
    [(CPLCTLCommand *)self _setInterruptionHandler:v4];
  }
}

- (void)stopInterruptibleOperation
{
  if (self->_storeCommand)
  {
    interruptionQueue = self->_interruptionQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000F928;
    block[3] = &unk_100034BA0;
    block[4] = self;
    dispatch_sync((dispatch_queue_t)interruptionQueue, block);
    [(CPLStoreCommand *)self->_storeCommand stopInterruptibleOperation:self];
  }
  else
  {
    [(CPLCTLCommand *)self _setInterruptionHandler:0];
  }
}

- (void)cplInterrupt
{
  interruptionQueue = self->_interruptionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000F9D4;
  block[3] = &unk_100034BA0;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)interruptionQueue, block);
}

- (id)urlWithinHomeWithPath:(id)a3 isDirectory:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = [@"/var/mobile" stringByAppendingPathComponent:a3];
  id v6 = [objc_alloc((Class)NSURL) initFileURLWithPath:v5 isDirectory:v4];

  return v6;
}

- (id)_tempFolderURL
{
  uint64_t v3 = [(CPLCTLCommand *)self storeCommand];
  BOOL v4 = v3;
  if (v3)
  {
    id v5 = [v3 store];
    id v6 = v5;
LABEL_4:
    id v7 = [v5 tempFolderURL];
    goto LABEL_5;
  }
  id v5 = [(CPLCTLCommand *)self privateEngine];
  id v6 = v5;
  if (v5) {
    goto LABEL_4;
  }
  id v9 = NSTemporaryDirectory();
  id v7 = [objc_alloc((Class)NSURL) initFileURLWithPath:v9 isDirectory:1];

LABEL_5:
  return v7;
}

- (id)tempFolderURLWithError:(id *)a3
{
  uint64_t v5 = [(CPLCTLCommand *)self _tempFolderURL];
  if (!v5) {
    sub_100020894();
  }
  id v6 = (void *)v5;
  id v7 = +[NSFileManager defaultManager];
  uint64_t v8 = (objc_class *)objc_opt_class();
  id v9 = NSStringFromClass(v8);
  if ([v9 hasPrefix:@"CPL"])
  {
    uint64_t v10 = [v9 substringFromIndex:3];

    id v9 = (void *)v10;
  }
  if ([v9 hasSuffix:@"Command"])
  {
    uint64_t v11 = [v9 substringToIndex:(unsigned char *)objc_msgSend(v9, "length") - (unsigned char *)objc_msgSend(@"Command", "length")];

    id v9 = (void *)v11;
  }
  id v12 = [(CPLCTLCommand *)self storeCommand];
  unsigned int v13 = v12;
  if (v12)
  {
    id v14 = [v12 currentStepIndex];
    id v15 = objc_alloc((Class)NSString);
    dispatch_time_t v16 = +[NSUUID UUID];
    id v17 = [v15 initWithFormat:@"%lu-%@-%@", v14, v9, v16];
  }
  else
  {
    id v18 = objc_alloc((Class)NSString);
    dispatch_time_t v16 = +[NSUUID UUID];
    id v17 = [v18 initWithFormat:@"%@-%@", v9, v16, v28];
  }
  id v19 = v17;

  char v30 = 0;
  id v20 = [v6 URLByAppendingPathComponent:v19 isDirectory:1];
  v21 = [v20 path];
  unsigned int v22 = [v7 fileExistsAtPath:v21 isDirectory:&v30];

  if (v22 && v30)
  {
    id v23 = v20;
  }
  else if (v22)
  {
    if (a3)
    {
      +[CPLErrors unknownError];
      id v23 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v23 = 0;
    }
  }
  else
  {
    id v29 = 0;
    unsigned int v24 = [v7 createDirectoryAtURL:v20 withIntermediateDirectories:0 attributes:0 error:&v29];
    id v25 = v29;
    id v26 = v25;
    if (v24)
    {
      id v23 = v20;
    }
    else
    {
      id v23 = 0;
      if (a3) {
        *a3 = v25;
      }
    }
  }
  return v23;
}

- (CPLCTLCommand)parentCommand
{
  return self->_parentCommand;
}

- (void)setParentCommand:(id)a3
{
}

- (NSURL)defaultLibraryURL
{
  return self->_defaultLibraryURL;
}

- (CPLOutput)output
{
  return self->_output;
}

- (CPLOutput)logOutput
{
  return self->_logOutput;
}

- (CPLStoreCommand)storeCommand
{
  return self->_storeCommand;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeCommand, 0);
  objc_storeStrong((id *)&self->_logOutput, 0);
  objc_storeStrong((id *)&self->_output, 0);
  objc_storeStrong((id *)&self->_defaultLibraryURL, 0);
  objc_storeStrong((id *)&self->_parentCommand, 0);
  objc_destroyWeak((id *)&self->_photosDaemonConnection);
  objc_destroyWeak((id *)&self->_daemonConnection);
  objc_storeStrong((id *)&self->_defaultLibraryIdentifier, 0);
  objc_storeStrong((id *)&self->_outputStack, 0);
  objc_storeStrong(&self->_interruptionBlock, 0);
  objc_storeStrong((id *)&self->_interruptionQueue, 0);
  objc_storeStrong((id *)&self->_interruptionSource, 0);
}

@end