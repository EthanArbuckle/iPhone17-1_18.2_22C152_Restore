@interface SNDSPGraphUtilities
+ (id)actCatchingExceptions:(id)a3 error:(id *)a4;
+ (void)populateClientError:(id *)a3 withDSPGraphException:(void *)a4;
@end

@implementation SNDSPGraphUtilities

+ (id)actCatchingExceptions:(id)a3 error:(id *)a4
{
  v5 = (void (**)(id, id *))a3;
  v6 = v5[2](v5, a4);

  return v6;
}

+ (void)populateClientError:(id *)a3 withDSPGraphException:(void *)a4
{
  BOOL v6 = +[SNUtils isInternalBuild];
  v7 = NSString;
  if (*((char *)a4 + 95) >= 0) {
    v8 = (char *)a4 + 72;
  }
  else {
    v8 = (char *)*((void *)a4 + 9);
  }
  if (v6)
  {
    v9 = [NSString stringWithUTF8String:v8];
    v10 = [NSString stringWithUTF8String:(*(uint64_t (**)(void *))(*(void *)a4 + 16))(a4)];
    if (*((char *)a4 + 39) >= 0) {
      v11 = (char *)a4 + 16;
    }
    else {
      v11 = (char *)*((void *)a4 + 2);
    }
    v12 = [NSString stringWithUTF8String:v11];
    if (*((char *)a4 + 71) >= 0) {
      v13 = (char *)a4 + 48;
    }
    else {
      v13 = (char *)*((void *)a4 + 6);
    }
    v14 = [NSString stringWithUTF8String:v13];
    v15 = [NSNumber numberWithInt:*((unsigned int *)a4 + 10)];
    objc_msgSend(v7, "stringWithFormat:", @"%@ (what: %@; file %@; function %@; line: %@)",
      v9,
      v10,
      v12,
      v14,
      v15);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = [NSString stringWithUTF8String:v8];
    v10 = [NSString stringWithUTF8String:(*(uint64_t (**)(void *))(*(void *)a4 + 16))(a4)];
    id v16 = [v7 stringWithFormat:@"%@ (what: %@)", v9, v10];
  }

  +[SNError populateClientError:a3 withCode:2 underlyingError:0 message:v16];
}

@end