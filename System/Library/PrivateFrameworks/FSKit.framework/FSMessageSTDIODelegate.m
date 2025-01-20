@interface FSMessageSTDIODelegate
+ (id)delegateWithCompletionHandler:(id)a3;
- (id)delegate;
- (void)completed:(id)a3 replyHandler:(id)a4;
- (void)logMessage:(id)a3;
- (void)prompt:(id)a3 replyHandler:(id)a4;
- (void)promptTrueFalse:(id)a3 replyHandler:(id)a4;
@end

@implementation FSMessageSTDIODelegate

+ (id)delegateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  if (v5)
  {
    v6 = _Block_copy(v4);
    v7 = (void *)v5[1];
    v5[1] = v6;
  }
  return v5;
}

- (void)completed:(id)a3 replyHandler:(id)a4
{
  id v7 = a4;
  delegate = (void (**)(id, id))self->_delegate;
  if (delegate) {
    delegate[2](delegate, a3);
  }
  (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
}

- (void)logMessage:(id)a3
{
  v3 = (const char *)[a3 UTF8String];
  puts(v3);
}

- (void)prompt:(id)a3 replyHandler:(id)a4
{
  id v14 = a3;
  v5 = (void (**)(id, void *, void))a4;
  v6 = malloc_type_malloc(0x400uLL, 0x27FF5AE1uLL);
  if (v6)
  {
    id v7 = v6;
    fprintf((FILE *)*MEMORY[0x263EF8348], "%s\n", (const char *)[v14 UTF8String]);
    v8 = (FILE **)MEMORY[0x263EF8350];
    if (fgets((char *)v7, 1024, (FILE *)*MEMORY[0x263EF8350]))
    {
      v9 = [NSString stringWithUTF8String:v7];
      free(v7);
      v5[2](v5, v9, 0);

      goto LABEL_9;
    }
    int v12 = *__error();
    free(v7);
    int v13 = feof(*v8);
    clearerr(*v8);
    if (v13)
    {
      v5[2](v5, &stru_26FFF08C0, 0);
      goto LABEL_9;
    }
    v11 = fs_errorForPOSIXError(v12);
    ((void (**)(id, void *, void *))v5)[2](v5, 0, v11);
  }
  else
  {
    v10 = __error();
    v11 = fs_errorForPOSIXError(*v10);
    ((void (**)(id, void *, void *))v5)[2](v5, 0, v11);
  }

LABEL_9:
}

- (void)promptTrueFalse:(id)a3 replyHandler:(id)a4
{
  id v19 = a3;
  v5 = (void (**)(id, void, void *))a4;
  v6 = (char *)malloc_type_malloc(0x400uLL, 0xE11253E5uLL);
  if (!v6)
  {
    v16 = __error();
    v17 = fs_errorForPOSIXError(*v16);
    v5[2](v5, 0, v17);
LABEL_14:

    goto LABEL_15;
  }
  id v7 = v6;
  v8 = (FILE **)MEMORY[0x263EF8348];
  fprintf((FILE *)*MEMORY[0x263EF8348], "%s\nY/N\n", (const char *)[v19 UTF8String]);
  v9 = (FILE **)MEMORY[0x263EF8350];
  v10 = fgets(v7, 1024, (FILE *)*MEMORY[0x263EF8350]);
  if (!v10)
  {
LABEL_9:
    int v13 = *__error();
    free(v7);
    int v14 = feof(*v9);
    clearerr(*v9);
    if (v14) {
      int v15 = 96;
    }
    else {
      int v15 = v13;
    }
    v17 = fs_errorForPOSIXError(v15);
    v5[2](v5, 0, v17);
    goto LABEL_14;
  }
  while (1)
  {
    int v11 = *v10;
    if ((v11 - 78) <= 0x2B && ((1 << (v11 - 78)) & 0x80100000801) != 0) {
      break;
    }
    fwrite("Y/N\n", 4uLL, 1uLL, *v8);
    v10 = fgets(v7, 1024, *v9);
    if (!v10) {
      goto LABEL_9;
    }
  }
  BOOL v18 = (v11 & 0xFFFFFFDF) == 89;
  free(v7);
  v5[2](v5, v18, 0);
LABEL_15:
}

- (id)delegate
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end