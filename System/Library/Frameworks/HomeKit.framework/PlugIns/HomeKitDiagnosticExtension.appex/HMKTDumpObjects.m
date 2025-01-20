@interface HMKTDumpObjects
- (int)main:(id)a3;
@end

@implementation HMKTDumpObjects

- (int)main:(id)a3
{
  id v4 = a3;
  v5 = [v4 firstObject];
  unsigned int v6 = [v5 isEqualToString:@"-r"];

  if (v6)
  {
    self->_useRawValues = 1;
    [v4 removeObjectAtIndex:0];
  }
  v7 = __stdoutp;
  if ([v4 count] == (id)2)
  {
    id v8 = [v4 lastObject];
    v9 = fopen((const char *)[v8 cString], "w");

    if (v9) {
      v7 = v9;
    }
    [v4 removeLastObject];
  }
  if ([v4 count] == (id)1)
  {
    v10 = [v4 firstObject];
    v11 = sub_10000E6FC((uint64_t)self, (uint64_t)v10);

    if (v11)
    {
      uint64_t v32 = 0;
      v33 = &v32;
      uint64_t v34 = 0x2020000000;
      int v35 = 0;
      v12 = [v11 managedObjectModel];
      id v13 = [v11 newBackgroundContext];
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_10000DDB4;
      v26[3] = &unk_10002C8A8;
      id v14 = v12;
      id v27 = v14;
      id v15 = v13;
      v30 = &v32;
      v31 = v7;
      id v28 = v15;
      v29 = self;
      [v15 performBlockAndWait:v26];
      if (v7 && v7 != __stdoutp && v7 != __stderrp && v7 != __stdinp)
      {
        fflush(v7);
        fclose(v7);
      }
      int v16 = *((_DWORD *)v33 + 6);

      _Block_object_dispose(&v32, 8);
    }
    else
    {
      int v16 = 2;
      if (v7 && v7 != __stdoutp && v7 != __stderrp && v7 != __stdinp)
      {
        fflush(v7);
        fclose(v7);
      }
    }
  }
  else
  {
    v17 = __stderrp;
    v25 = [(id)objc_opt_class() name];
    sub_100008134(v17, @"Usage: %@ %@ [-r] <sqlite store file>\n", v18, v19, v20, v21, v22, v23, @"hmktool");

    int v16 = 1;
    if (v7 && v7 != __stdoutp && v7 != __stderrp && v7 != __stdinp)
    {
      fflush(v7);
      fclose(v7);
    }
  }

  return v16;
}

@end