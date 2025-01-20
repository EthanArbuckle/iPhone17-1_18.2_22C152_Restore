@interface HMKTDumpHistory
- (int)main:(id)a3;
@end

@implementation HMKTDumpHistory

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tombstones, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

- (int)main:(id)a3
{
  id v4 = a3;
  v5 = [v4 firstObject];
  unsigned int v6 = [v5 isEqualToString:@"-h"];

  if (v6)
  {
    self->_useHomeModelIDs = 1;
    [v4 removeObjectAtIndex:0];
  }
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  v35 = __stdoutp;
  if ([v4 count] == (id)2)
  {
    id v7 = [v4 lastObject];
    v8 = fopen((const char *)[v7 cString], "w");

    if (v8) {
      v33[3] = (uint64_t)v8;
    }
    [v4 removeLastObject];
  }
  if ([v4 count] == (id)1)
  {
    v9 = [v4 firstObject];
    v10 = sub_10000E6FC((uint64_t)self, (uint64_t)v9);

    if (v10)
    {
      uint64_t v28 = 0;
      v29 = &v28;
      uint64_t v30 = 0x2020000000;
      int v31 = 0;
      v11 = (NSManagedObjectContext *)[v10 newBackgroundContext];
      context = self->_context;
      self->_context = v11;

      v13 = self->_context;
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_10000CFB0;
      v27[3] = &unk_10002C868;
      v27[4] = self;
      v27[5] = &v28;
      v27[6] = &v32;
      [(NSManagedObjectContext *)v13 performBlockAndWait:v27];
      v14 = (FILE *)v33[3];
      if (v14 && v14 != __stdoutp && v14 != __stderrp && v14 != __stdinp)
      {
        fflush(v14);
        fclose((FILE *)v33[3]);
        v33[3] = 0;
      }
      int v15 = *((_DWORD *)v29 + 6);
      _Block_object_dispose(&v28, 8);
    }
    else
    {
      v24 = (FILE *)v33[3];
      int v15 = 2;
      if (v24 && v24 != __stdoutp && v24 != __stderrp && v24 != __stdinp)
      {
        fflush(v24);
        fclose((FILE *)v33[3]);
        v33[3] = 0;
      }
    }
  }
  else
  {
    v16 = __stderrp;
    v26 = [(id)objc_opt_class() name];
    sub_100008134(v16, @"Usage: %@ %@ [-h] <sqlite store file>\n", v17, v18, v19, v20, v21, v22, @"hmktool");

    v23 = (FILE *)v33[3];
    int v15 = 1;
    if (v23 && v23 != __stdoutp && v23 != __stderrp && v23 != __stdinp)
    {
      fflush(v23);
      fclose((FILE *)v33[3]);
      v33[3] = 0;
    }
  }
  _Block_object_dispose(&v32, 8);

  return v15;
}

@end