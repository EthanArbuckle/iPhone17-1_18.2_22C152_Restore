@interface MBOpenURLWrapper
- (BOOL)_isHTTPURL;
- (BOOL)_isInternalPrefsURL;
- (BOOL)_isPrepareBuddyURL;
- (BOOL)isHTTPURL;
- (BOOL)isPrepareBuddyURL;
- (MBOpenURLWrapper)init;
- (MBOpenURLWrapper)initWithURL:(id)a3;
- (MBOpenURLWrapperDelegate)delegate;
- (NSURL)url;
- (void)_openInternalPrefsURL;
- (void)_openPrebuddyURL;
- (void)open;
- (void)setDelegate:(id)a3;
@end

@implementation MBOpenURLWrapper

- (MBOpenURLWrapper)init
{
  [(MBOpenURLWrapper *)self doesNotRecognizeSelector:a2];
  v3 = +[NSURL URLWithString:&stru_100004130];
  v4 = [(MBOpenURLWrapper *)self initWithURL:v3];

  return v4;
}

- (MBOpenURLWrapper)initWithURL:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MBOpenURLWrapper;
  v5 = [(MBOpenURLWrapper *)&v9 init];
  if (v5)
  {
    v6 = (NSURL *)[v4 copy];
    url = v5->_url;
    v5->_url = v6;
  }
  return v5;
}

- (BOOL)_isHTTPURL
{
  v2 = [(MBOpenURLWrapper *)self url];
  v3 = [v2 scheme];
  id v4 = [v3 lowercaseString];

  if ([v4 isEqualToString:@"http"]) {
    unsigned __int8 v5 = 1;
  }
  else {
    unsigned __int8 v5 = [v4 isEqualToString:@"https"];
  }

  return v5;
}

- (BOOL)_isPrepareBuddyURL
{
  v2 = [(MBOpenURLWrapper *)self url];
  v3 = [v2 host];
  id v4 = [v3 lowercaseString];

  LOBYTE(v2) = [v4 isEqualToString:@"prepare.icloud.com"];
  return (char)v2;
}

- (BOOL)_isInternalPrefsURL
{
  v2 = [(MBOpenURLWrapper *)self url];
  v3 = [v2 path];
  id v4 = [v3 lowercaseString];

  LOBYTE(v2) = [v4 isEqualToString:@"/backup-internal"];
  return (char)v2;
}

- (void)_openPrebuddyURL
{
  v2 = +[NSURL URLWithString:@"prefs-prebuddy://"];
  v3 = MBGetDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v6 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Open %@", buf, 0xCu);
    _MBLog();
  }

  id v4 = +[LSApplicationWorkspace defaultWorkspace];
  [v4 openURL:v2 withOptions:0];
}

- (void)_openInternalPrefsURL
{
  if (MBIsInternalInstall())
  {
    v2 = +[NSURL URLWithString:@"prefs:root=INTERNAL_SETTINGS&path=Backup"];
    v3 = MBGetDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v6 = v2;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Open %@", buf, 0xCu);
      _MBLog();
    }

    id v4 = +[LSApplicationWorkspace defaultWorkspace];
    [v4 openSensitiveURL:v2 withOptions:0];
  }
}

- (void)open
{
  if ([(MBOpenURLWrapper *)self _isHTTPURL])
  {
    v3 = MBGetDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [(MBOpenURLWrapper *)self url];
      *(_DWORD *)buf = 138543362;
      objc_super v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Received associated domain link: %{public}@", buf, 0xCu);

      v7 = [(MBOpenURLWrapper *)self url];
      _MBLog();
    }
    if ([(MBOpenURLWrapper *)self _isPrepareBuddyURL])
    {
      if ([(MBOpenURLWrapper *)self _isInternalPrefsURL])
      {
        [(MBOpenURLWrapper *)self _openInternalPrefsURL];
      }
      else
      {
        unsigned __int8 v5 = [(MBOpenURLWrapper *)self delegate];
        if (objc_opt_respondsToSelector()) {
          [v5 openURLWrapper:self willOpenURL:self->_url];
        }
        v6 = MBGetDefaultLog();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received Prebuddy link. Opening Settings.", buf, 2u);
          _MBLog();
        }

        [(MBOpenURLWrapper *)self _openPrebuddyURL];
        if (objc_opt_respondsToSelector()) {
          [v5 openURLWrapper:self didOpenURL:self->_url];
        }
      }
    }
  }
}

- (MBOpenURLWrapperDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MBOpenURLWrapperDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isHTTPURL
{
  return self->_httpURL;
}

- (BOOL)isPrepareBuddyURL
{
  return self->_prepareBuddyURL;
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end