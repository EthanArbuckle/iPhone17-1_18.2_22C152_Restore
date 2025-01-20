@interface AUCrashHandlerDelegate
- (id)init:(id)a3;
- (void)notifyCrash:(id *)a3 withCrashInfo:(id)a4;
@end

@implementation AUCrashHandlerDelegate

- (void).cxx_destruct
{
}

- (void)notifyCrash:(id *)a3 withCrashInfo:(id)a4
{
  id v6 = a4;
  objc_copyWeak(&to, (id *)&self->weakCrashHandler);
  id v7 = objc_loadWeakRetained(&to);

  if (v7)
  {
    id v8 = objc_loadWeakRetained(&to);
    long long v9 = *(_OWORD *)&a3->var0[4];
    v10[0] = *(_OWORD *)a3->var0;
    v10[1] = v9;
    [v8 notifyCrash:v10 withCrashInfo:v6];
  }
  objc_destroyWeak(&to);
}

- (id)init:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AUCrashHandlerDelegate;
  v5 = [(AUCrashHandlerDelegate *)&v8 init];
  id v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->weakCrashHandler, v4);
  }

  return v6;
}

@end