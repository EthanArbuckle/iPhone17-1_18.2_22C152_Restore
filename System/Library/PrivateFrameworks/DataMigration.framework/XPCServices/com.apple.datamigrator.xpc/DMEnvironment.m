@interface DMEnvironment
- (BOOL)inAppleStore;
- (BOOL)isFromFactory;
- (BOOL)isProgressHostReady;
- (id)_cwfInterface;
- (id)lockdownModeManager;
- (id)userManager;
- (int)sem_createOwnerReadableWithName:(const char *)a3 value:(int)a4 errorString:(id *)a5;
- (int)sem_openWithName:(const char *)a3 errorString:(id *)a4;
- (void)sem_close:(int *)a3;
- (void)setProgressHostIsReady;
@end

@implementation DMEnvironment

- (id)userManager
{
  return +[UMUserManager sharedManager];
}

- (id)lockdownModeManager
{
  v2 = (void *)sub_10000FF18();
  if (v2)
  {
    uint64_t v7 = 0;
    v8 = &v7;
    uint64_t v9 = 0x2050000000;
    v3 = (void *)qword_100030C58;
    uint64_t v10 = qword_100030C58;
    if (!qword_100030C58)
    {
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_10001005C;
      v6[3] = &unk_100024790;
      v6[4] = &v7;
      sub_10001005C((uint64_t)v6);
      v3 = (void *)v8[3];
    }
    id v4 = v3;
    _Block_object_dispose(&v7, 8);
    v2 = [v4 shared];
  }

  return v2;
}

- (id)_cwfInterface
{
  id v2 = objc_alloc_init((Class)CWFInterface);

  return v2;
}

- (BOOL)inAppleStore
{
  if ([(DMEnvironment *)self deviceModeIsSharediPad]) {
    return 0;
  }
  id v4 = [(DMEnvironment *)self _cwfInterface];
  [v4 activate];
  v5 = [v4 networkName];
  unsigned __int8 v6 = [v5 isEqualToString:@"Apple Store"];

  [v4 invalidate];
  return v6;
}

- (BOOL)isFromFactory
{
  id v2 = +[NSFileManager defaultManager];
  unsigned __int8 v3 = [v2 fileExistsAtPath:@"/var/mobile/Media/iTunes_Control/iTunes/ShowWarranty"];

  return v3;
}

- (int)sem_openWithName:(const char *)a3 errorString:(id *)a4
{
  v5 = sem_open(a3, 0);
  unsigned __int8 v6 = v5;
  if (a4 && v5 == (sem_t *)-1)
  {
    uint64_t v7 = __error();
    *a4 = +[NSString stringWithFormat:@"%s", strerror(*v7)];
  }
  return v6;
}

- (int)sem_createOwnerReadableWithName:(const char *)a3 value:(int)a4 errorString:(id *)a5
{
  unsigned __int8 v6 = sem_open(a3, 512, 256, a4);
  uint64_t v7 = v6;
  if (a5 && v6 == (sem_t *)-1)
  {
    v8 = __error();
    *a5 = +[NSString stringWithFormat:@"%s", strerror(*v8)];
  }
  return v7;
}

- (void)sem_close:(int *)a3
{
}

- (BOOL)isProgressHostReady
{
  id v6 = 0;
  unsigned __int8 v3 = [(DMEnvironment *)self sem_openWithName:"datamigrator.progressHost" errorString:&v6];
  id v4 = v6;
  if (v3 == (int *)-1) {
    _DMLogFunc();
  }
  else {
    [(DMEnvironment *)self sem_close:v3];
  }

  return v3 != (int *)-1;
}

- (void)setProgressHostIsReady
{
  id v5 = 0;
  unsigned __int8 v3 = [(DMEnvironment *)self sem_createOwnerReadableWithName:"datamigrator.progressHost" value:0 errorString:&v5];
  id v4 = v5;
  if (v3 == (int *)-1) {
    _DMLogFunc();
  }
  else {
    [(DMEnvironment *)self sem_close:v3];
  }
}

@end