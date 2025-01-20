@interface DMDiagnostics
+ (id)sharedInstance;
- (void)captureDiagnosticsForIncident:(id)a3 async:(BOOL)a4;
@end

@implementation DMDiagnostics

+ (id)sharedInstance
{
  if (qword_100030BF0 != -1) {
    dispatch_once(&qword_100030BF0, &stru_100024A58);
  }
  v2 = (void *)qword_100030BE8;

  return v2;
}

- (void)captureDiagnosticsForIncident:(id)a3 async:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v14 = v5;
  if (qword_100030C08 != -1)
  {
    dispatch_once(&qword_100030C08, &stru_100024A78);
    id v5 = v14;
    if (v4) {
      goto LABEL_3;
    }
LABEL_8:
    v10 = (uint64_t (*)(void *, uint64_t, uint64_t))off_100030C00;
    if (!off_100030C00) {
      goto LABEL_10;
    }
    v11 = [v5 diagnosticMessage];
    uint64_t v12 = getpid();
    char v13 = v10(v11, 3135167405, v12);

    if ((v13 & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (!v4) {
    goto LABEL_8;
  }
LABEL_3:
  v6 = (uint64_t (*)(void *, uint64_t, uint64_t))off_100030BF8;
  if (!off_100030BF8
    || ([v5 diagnosticMessage],
        v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = getpid(),
        char v9 = v6(v7, 3135167405, v8),
        v7,
        (v9 & 1) == 0))
  {
LABEL_10:
    _DMLogFunc();
  }
LABEL_11:
}

@end