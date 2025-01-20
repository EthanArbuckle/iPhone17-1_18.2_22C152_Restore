@interface MFDAutosaveSession
+ (id)log;
- (MFDAutosaveSession)initWithAutosaveIdentifier:(id)a3;
- (NSString)autosaveIdentifier;
- (NSString)description;
- (void)dealloc;
- (void)setAutosaveIdentifier:(id)a3;
@end

@implementation MFDAutosaveSession

+ (id)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005927C;
  block[3] = &unk_100139B30;
  block[4] = a1;
  if (qword_10016BA58 != -1) {
    dispatch_once(&qword_10016BA58, block);
  }
  v2 = (void *)qword_10016BA50;

  return v2;
}

- (MFDAutosaveSession)initWithAutosaveIdentifier:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MFDAutosaveSession;
  v5 = [(MFDAutosaveSession *)&v11 init];
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    autosaveIdentifier = v5->_autosaveIdentifier;
    v5->_autosaveIdentifier = v6;

    v8 = +[MFDAutosaveSession log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = [(MFDAutosaveSession *)v5 autosaveIdentifier];
      *(_DWORD *)buf = 138412290;
      v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Autosave session started. (autosaveID=%@)", buf, 0xCu);
    }
  }

  return v5;
}

- (void)dealloc
{
  v3 = +[MFDAutosaveSession log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [(MFDAutosaveSession *)self autosaveIdentifier];
    *(_DWORD *)buf = 138412290;
    v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Autosave session ended. (autosaveID=%@)", buf, 0xCu);
  }
  v5.receiver = self;
  v5.super_class = (Class)MFDAutosaveSession;
  [(MFDAutosaveSession *)&v5 dealloc];
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  objc_super v5 = [(MFDAutosaveSession *)self autosaveIdentifier];
  v6 = +[NSString stringWithFormat:@"<%@: %p, autosaveID=%@>", v4, self, v5];

  return (NSString *)v6;
}

- (NSString)autosaveIdentifier
{
  return self->_autosaveIdentifier;
}

- (void)setAutosaveIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end