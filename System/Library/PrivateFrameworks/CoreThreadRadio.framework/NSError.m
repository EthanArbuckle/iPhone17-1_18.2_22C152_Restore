@interface NSError
+ (id)storeError:(int64_t)a3;
+ (id)storeError:(int64_t)a3 description:(id)a4;
+ (id)storeError:(int64_t)a3 underlyingError:(id)a4;
+ (id)storeError:(int64_t)a3 underlyingError:(id)a4 description:(id)a5;
@end

@implementation NSError

+ (id)storeError:(int64_t)a3
{
  return +[NSError storeError:a3 underlyingError:0 description:0];
}

+ (id)storeError:(int64_t)a3 underlyingError:(id)a4
{
  return +[NSError storeError:a3 underlyingError:a4 description:0];
}

+ (id)storeError:(int64_t)a3 description:(id)a4
{
  return +[NSError storeError:a3 underlyingError:0 description:a4];
}

+ (id)storeError:(int64_t)a3 underlyingError:(id)a4 description:(id)a5
{
  unint64_t v7 = (unint64_t)a4;
  unint64_t v8 = (unint64_t)a5;
  v9 = (void *)v8;
  if (!(v7 | v8))
  {
    v13 = 0;
    goto LABEL_10;
  }
  if (!v8)
  {
    NSErrorUserInfoKey v20 = NSUnderlyingErrorKey;
    unint64_t v21 = v7;
    v10 = &v21;
    v11 = &v20;
LABEL_8:
    uint64_t v12 = 1;
    goto LABEL_9;
  }
  if (!v7)
  {
    NSErrorUserInfoKey v18 = NSLocalizedDescriptionKey;
    unint64_t v19 = v8;
    v10 = &v19;
    v11 = &v18;
    goto LABEL_8;
  }
  v16[0] = NSUnderlyingErrorKey;
  v16[1] = NSLocalizedDescriptionKey;
  v17[0] = v7;
  v17[1] = v8;
  v10 = v17;
  v11 = (NSErrorUserInfoKey *)v16;
  uint64_t v12 = 2;
LABEL_9:
  v13 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v11 count:v12];
LABEL_10:
  v14 = +[NSError errorWithDomain:@"ThreadCredentialsStore" code:a3 userInfo:v13];

  return v14;
}

@end