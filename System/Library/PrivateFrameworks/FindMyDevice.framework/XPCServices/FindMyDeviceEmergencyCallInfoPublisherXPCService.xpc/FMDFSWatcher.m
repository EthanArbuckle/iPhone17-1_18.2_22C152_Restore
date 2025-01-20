@interface FMDFSWatcher
+ (id)monitorURL:(id)a3 action:(id)a4;
- (BOOL)start;
- (BOOL)triggered;
- (FMDFSWatcher)init;
- (FMDFSWatcher)initWithURL:(id)a3 action:(id)a4;
- (NSString)targetFilename;
- (NSURL)directoryURL;
- (OS_dispatch_source)dispatchSourceAbort;
- (OS_dispatch_source)dispatchSourceChange;
- (id)block;
- (int)fd;
- (void)cancel;
- (void)directoryChanged;
- (void)fileDiscovered;
- (void)setBlock:(id)a3;
- (void)setDirectoryURL:(id)a3;
- (void)setDispatchSourceAbort:(id)a3;
- (void)setDispatchSourceChange:(id)a3;
- (void)setFd:(int)a3;
- (void)setTargetFilename:(id)a3;
- (void)setTriggered:(BOOL)a3;
@end

@implementation FMDFSWatcher

- (FMDFSWatcher)init
{
  return 0;
}

- (FMDFSWatcher)initWithURL:(id)a3 action:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)FMDFSWatcher;
  v8 = [(FMDFSWatcher *)&v19 init];
  if (v8)
  {
    v9 = v8;
    CFURLRef v10 = [v6 standardizedURL];
    v11 = (__CFString *)CFURLCopyPath(v10);
    unsigned int v12 = [(__CFString *)v11 hasSuffix:@"/"];
    CFRelease(v11);
    v18.receiver = v9;
    v18.super_class = (Class)FMDFSWatcher;
    v13 = [(FMDFSWatcher *)&v18 init];
    v14 = v13;
    if (v12)
    {
      [(FMDFSWatcher *)v13 setDirectoryURL:v10];
      [(FMDFSWatcher *)v14 setTargetFilename:0];
    }
    else
    {
      v15 = [(__CFURL *)v10 URLByDeletingLastPathComponent];
      [(FMDFSWatcher *)v14 setDirectoryURL:v15];

      v16 = [(__CFURL *)v10 lastPathComponent];
      [(FMDFSWatcher *)v14 setTargetFilename:v16];
    }
    [(FMDFSWatcher *)v14 setBlock:v7];
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)start
{
  objc_initWeak(&location, self);
  v3 = sub_100004738();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(FMDFSWatcher *)self directoryURL];
    v5 = [(FMDFSWatcher *)self targetFilename];
    *(_DWORD *)buf = 138412546;
    v36 = v4;
    __int16 v37 = 2112;
    v38 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting to watch for existence of %@/%@", buf, 0x16u);
  }
  id v6 = [(FMDFSWatcher *)self directoryURL];
  id v7 = [v6 path];
  -[FMDFSWatcher setFd:](self, "setFd:", open((const char *)[v7 fileSystemRepresentation], 0x8000));

  int v8 = [(FMDFSWatcher *)self fd];
  if (v8 < 1)
  {
    v23 = sub_100004738();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = [(FMDFSWatcher *)self directoryURL];
      sub_100006C90(v24, buf, v23);
    }

    v25 = sub_100004738();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = [(FMDFSWatcher *)self directoryURL];
      *(_DWORD *)v33 = 138412290;
      v34 = v26;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Failed to open %@", v33, 0xCu);
    }
  }
  else
  {
    uintptr_t v9 = [(FMDFSWatcher *)self fd];
    CFURLRef v10 = dispatch_get_global_queue(0, 0);
    dispatch_source_t v11 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_vnode, v9, 2uLL, v10);
    [(FMDFSWatcher *)self setDispatchSourceChange:v11];

    unsigned int v12 = [(FMDFSWatcher *)self dispatchSourceChange];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100003DD0;
    handler[3] = &unk_10000C3E8;
    handler[4] = self;
    objc_copyWeak(&v31, &location);
    dispatch_source_set_event_handler(v12, handler);

    v13 = [(FMDFSWatcher *)self dispatchSourceChange];
    dispatch_resume(v13);

    v14 = sub_100004738();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = [(FMDFSWatcher *)self directoryURL];
      v16 = [v15 path];
      *(_DWORD *)buf = 138412290;
      v36 = v16;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Started monitoring changes to directory: %@", buf, 0xCu);
    }
    dispatch_source_t v17 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_vnode, [(FMDFSWatcher *)self fd], 0x61uLL, v10);
    [(FMDFSWatcher *)self setDispatchSourceAbort:v17];

    objc_super v18 = [(FMDFSWatcher *)self dispatchSourceAbort];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100003EB4;
    v28[3] = &unk_10000C3E8;
    v28[4] = self;
    objc_copyWeak(&v29, &location);
    dispatch_source_set_event_handler(v18, v28);

    objc_super v19 = [(FMDFSWatcher *)self dispatchSourceAbort];
    dispatch_resume(v19);

    v20 = sub_100004738();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = [(FMDFSWatcher *)self directoryURL];
      v22 = [v21 path];
      *(_DWORD *)buf = 138412290;
      v36 = v22;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Started monitoring for removal of directory: %@", buf, 0xCu);
    }
    objc_destroyWeak(&v29);
    objc_destroyWeak(&v31);
  }
  objc_destroyWeak(&location);
  return v8 > 0;
}

+ (id)monitorURL:(id)a3 action:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[FMDFSWatcher alloc] initWithURL:v6 action:v5];

  int v8 = [(FMDFSWatcher *)v7 targetFilename];

  if (v8)
  {
    uintptr_t v9 = sub_100004738();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)dispatch_source_t v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Calling directory changed on startup", v11, 2u);
    }

    [(FMDFSWatcher *)v7 directoryChanged];
  }
  if (![(FMDFSWatcher *)v7 triggered] && ![(FMDFSWatcher *)v7 start])
  {
    [(FMDFSWatcher *)v7 cancel];

    id v7 = 0;
  }

  return v7;
}

- (void)directoryChanged
{
  v3 = [(FMDFSWatcher *)self targetFilename];

  if (v3)
  {
    v4 = +[NSFileManager defaultManager];
    id v5 = [(FMDFSWatcher *)self directoryURL];
    id v26 = 0;
    id v6 = [v4 contentsOfDirectoryAtURL:v5 includingPropertiesForKeys:0 options:0 error:&v26];
    id v7 = v26;

    if (v7)
    {
      int v8 = sub_100004738();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100006CE8(self, (uint64_t)v7, v8);
      }

      uintptr_t v9 = sub_100004738();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        CFURLRef v10 = [(FMDFSWatcher *)self directoryURL];
        *(_DWORD *)buf = 138412546;
        v28 = v10;
        __int16 v29 = 2112;
        id v30 = v7;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Error while trying to read the contents of directory %@: %@", buf, 0x16u);
      }
      [(FMDFSWatcher *)self cancel];
    }
    else
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v21 = v6;
      dispatch_source_t v11 = v6;
      id v12 = [v11 countByEnumeratingWithState:&v22 objects:v31 count:16];
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v23;
        while (2)
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v23 != v14) {
              objc_enumerationMutation(v11);
            }
            v16 = [*(id *)(*((void *)&v22 + 1) + 8 * i) lastPathComponent];
            dispatch_source_t v17 = [(FMDFSWatcher *)self targetFilename];
            unsigned int v18 = [v16 isEqualToString:v17];

            if (v18)
            {
              [(FMDFSWatcher *)self fileDiscovered];
              goto LABEL_22;
            }
          }
          id v13 = [v11 countByEnumeratingWithState:&v22 objects:v31 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }

      dispatch_source_t v11 = sub_100004738();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        objc_super v19 = [(FMDFSWatcher *)self targetFilename];
        *(_DWORD *)buf = 138412290;
        v28 = v19;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "File was not found in the directory yet: %@", buf, 0xCu);
      }
LABEL_22:

      id v6 = v21;
    }
  }
  else
  {
    v20 = [(FMDFSWatcher *)self block];
    v20[2]();
  }
}

- (void)fileDiscovered
{
  v3 = sub_100004738();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(FMDFSWatcher *)self targetFilename];
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Found file being watched: %@", (uint8_t *)&v6, 0xCu);
  }
  [(FMDFSWatcher *)self setTriggered:1];
  [(FMDFSWatcher *)self cancel];
  id v5 = [(FMDFSWatcher *)self block];
  v5[2]();
}

- (void)cancel
{
  v3 = sub_100004738();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Deinitializing watcher", v8, 2u);
  }

  v4 = [(FMDFSWatcher *)self dispatchSourceChange];

  if (v4)
  {
    id v5 = [(FMDFSWatcher *)self dispatchSourceChange];
    dispatch_source_cancel(v5);

    [(FMDFSWatcher *)self setDispatchSourceChange:0];
  }
  int v6 = [(FMDFSWatcher *)self dispatchSourceAbort];

  if (v6)
  {
    id v7 = [(FMDFSWatcher *)self dispatchSourceAbort];
    dispatch_source_cancel(v7);

    [(FMDFSWatcher *)self setDispatchSourceAbort:0];
  }
  if ([(FMDFSWatcher *)self fd] >= 1)
  {
    close([(FMDFSWatcher *)self fd]);
    [(FMDFSWatcher *)self setFd:0];
  }
}

- (NSURL)directoryURL
{
  return self->_directoryURL;
}

- (void)setDirectoryURL:(id)a3
{
}

- (NSString)targetFilename
{
  return self->_targetFilename;
}

- (void)setTargetFilename:(id)a3
{
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
}

- (int)fd
{
  return self->_fd;
}

- (void)setFd:(int)a3
{
  self->_fd = a3;
}

- (OS_dispatch_source)dispatchSourceChange
{
  return self->_dispatchSourceChange;
}

- (void)setDispatchSourceChange:(id)a3
{
}

- (OS_dispatch_source)dispatchSourceAbort
{
  return self->_dispatchSourceAbort;
}

- (void)setDispatchSourceAbort:(id)a3
{
}

- (BOOL)triggered
{
  return self->_triggered;
}

- (void)setTriggered:(BOOL)a3
{
  self->_triggered = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchSourceAbort, 0);
  objc_storeStrong((id *)&self->_dispatchSourceChange, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_targetFilename, 0);

  objc_storeStrong((id *)&self->_directoryURL, 0);
}

@end