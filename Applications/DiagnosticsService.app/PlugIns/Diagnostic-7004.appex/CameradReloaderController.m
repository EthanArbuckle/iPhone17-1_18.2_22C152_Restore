@interface CameradReloaderController
- (CameradReloaderInputs)inputs;
- (void)setInputs:(id)a3;
- (void)setupWithInputs:(id)a3 responder:(id)a4;
- (void)start;
@end

@implementation CameradReloaderController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = handleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315650;
    v12 = "-[CameradReloaderController setupWithInputs:responder:]";
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: %@, %@", (uint8_t *)&v11, 0x20u);
  }

  [(CameradReloaderController *)self setInputs:v6];
  v9 = [(CameradReloaderController *)self inputs];

  if (!v9)
  {
    v10 = [(CameradReloaderController *)self result];
    [v10 setStatusCode:&off_100004170];

    [(CameradReloaderController *)self setFinished:1];
  }
}

- (void)start
{
  uint64_t v3 = [(CameradReloaderController *)self result];
  [(id)v3 setStatusCode:&off_100004188];

  LOBYTE(v3) = MGGetBoolAnswer();
  char v4 = MGGetBoolAnswer();
  if (v3 & 1) != 0 || (v4)
  {
    id v17 = 0;
    unsigned int v7 = +[CRUtils powerCycleSensor:&v17];
    id v6 = v17;
    v8 = [(CameradReloaderController *)self result];
    v9 = v8;
    if (!v7 || v6) {
      v10 = &off_1000041B8;
    }
    else {
      v10 = &off_1000041D0;
    }
    [v8 setStatusCode:v10];
  }
  else
  {
    v5 = [(CameradReloaderController *)self result];
    [v5 setStatusCode:&off_1000041A0];

    id v6 = 0;
  }
  v18[0] = @"error";
  int v11 = [v6 description];
  v12 = v11;
  if (!v11)
  {
    v12 = +[NSNull null];
  }
  v18[1] = @"errorCode";
  v19[0] = v12;
  __int16 v13 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v6 code]);
  id v14 = v13;
  if (!v13)
  {
    id v14 = +[NSNull null];
  }
  v19[1] = v14;
  __int16 v15 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
  id v16 = [(CameradReloaderController *)self result];
  [v16 setData:v15];

  if (!v13) {
  if (!v11)
  }

  [(CameradReloaderController *)self setFinished:1];
}

- (CameradReloaderInputs)inputs
{
  return self->inputs;
}

- (void)setInputs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end