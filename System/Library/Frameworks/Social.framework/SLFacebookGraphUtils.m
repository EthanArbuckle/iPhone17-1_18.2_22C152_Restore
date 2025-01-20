@interface SLFacebookGraphUtils
+ (id)_likeQueryStringForURL:(id)a3 flags:(unint64_t)a4;
+ (id)_parseServerResponse:(id)a3 error:(id *)a4;
+ (void)_likeURL:(id)a3 requestMethod:(int64_t)a4 account:(id)a5 completion:(id)a6;
+ (void)fetchLikeStatusForURL:(id)a3 flags:(id)a4 account:(id)a5 completion:(id)a6;
+ (void)likeURL:(id)a3 account:(id)a4 completion:(id)a5;
+ (void)unlikeURL:(id)a3 account:(id)a4 completion:(id)a5;
@end

@implementation SLFacebookGraphUtils

+ (void)likeURL:(id)a3 account:(id)a4 completion:(id)a5
{
}

+ (void)unlikeURL:(id)a3 account:(id)a4 completion:(id)a5
{
}

+ (void)_likeURL:(id)a3 requestMethod:(int64_t)a4 account:(id)a5 completion:(id)a6
{
  v7 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v8 = *MEMORY[0x1E4F178F0];
  id v9 = a6;
  id v10 = [v7 errorWithDomain:v8 code:3 userInfo:0];
  (*((void (**)(id, id))a6 + 2))(v9, v10);
}

+ (void)fetchLikeStatusForURL:(id)a3 flags:(id)a4 account:(id)a5 completion:(id)a6
{
  v7 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v8 = *MEMORY[0x1E4F178F0];
  id v9 = a6;
  id v10 = [v7 errorWithDomain:v8 code:3 userInfo:0];
  (*((void (**)(id, void, id))a6 + 2))(v9, 0, v10);
}

+ (id)_parseServerResponse:(id)a3 error:(id *)a4
{
  v4 = a4;
  v21[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:4 error:a4];
  v6 = (void *)v5;
  if (!v4)
  {
    if (v5) {
      goto LABEL_9;
    }
LABEL_7:
    v4 = 0;
    goto LABEL_22;
  }
  if (*v4) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v5 == 0;
  }
  if (v7) {
    goto LABEL_7;
  }
LABEL_9:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [v6 objectForKey:@"error"];
    if (v8)
    {
      if (v4)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v9 = [v8 objectForKey:@"code"];
          uint64_t v10 = [v8 objectForKey:@"message"];
          v11 = (void *)v10;
          v12 = (void *)MEMORY[0x1E4F28C58];
          if (v9 && v10)
          {
            uint64_t v13 = [v9 integerValue];
            uint64_t v20 = *MEMORY[0x1E4F28568];
            v21[0] = v11;
            v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
            v15 = v12;
            uint64_t v16 = v13;
          }
          else
          {
            v18 = @"json";
            v19 = v8;
            v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
            v15 = v12;
            uint64_t v16 = 1;
          }
          id *v4 = [v15 errorWithDomain:@"com.apple.sociald.facebook" code:v16 userInfo:v14];
        }
        v4 = 0;
      }
    }
    else
    {
      v4 = v6;
    }
  }
  else
  {
    v4 = v6;
  }
LABEL_22:

  return v4;
}

+ (id)_likeQueryStringForURL:(id)a3 flags:(unint64_t)a4
{
  char v4 = a4;
  id v5 = a3;
  v6 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:4];
  if ((v4 & 1) == 0)
  {
    if ((v4 & 2) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    uint64_t v10 = [NSString stringWithFormat:@"SELECT like_count FROM link_stat where url=\"%@\"", v5];
    [v6 setObject:v10 forKeyedSubscript:@"globalCount"];

    if ((v4 & 8) == 0) {
      goto LABEL_4;
    }
LABEL_8:
    BOOL v7 = [NSString stringWithFormat:@"SELECT name, uid FROM user WHERE uid IN (SELECT user_id FROM url_like WHERE user_id IN (SELECT uid2 FROM friend WHERE uid1=me()) AND url=\"%@\")", v5];
    uint64_t v8 = @"friends";
    goto LABEL_9;
  }
  id v9 = [NSString stringWithFormat:@"SELECT user_id FROM url_like WHERE user_id = me() and url=\"%@\"", v5];
  [v6 setObject:v9 forKeyedSubscript:@"me"];

  if ((v4 & 2) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((v4 & 8) != 0) {
    goto LABEL_8;
  }
LABEL_4:
  if ((v4 & 4) == 0) {
    goto LABEL_10;
  }
  BOOL v7 = [NSString stringWithFormat:@"SELECT user_id FROM url_like WHERE user_id IN (Select uid2 from friend where uid1 = me()) and url=\"%@\"", v5];
  uint64_t v8 = @"friendCount";
LABEL_9:
  [v6 setObject:v7 forKeyedSubscript:v8];

LABEL_10:
  v11 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v6 options:0 error:0];
  v12 = (void *)[[NSString alloc] initWithData:v11 encoding:4];

  return v12;
}

@end