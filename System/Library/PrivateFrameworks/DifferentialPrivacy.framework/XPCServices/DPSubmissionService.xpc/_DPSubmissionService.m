@interface _DPSubmissionService
+ (id)sharedInstance;
- (_DPDediscoSubmissionManager)dediscoManagerV1;
- (_DPDediscoSubmissionManager)dediscoManagerV2;
- (_DPSubmissionService)init;
- (void)fetchTokenWithReply:(id)a3;
- (void)setDediscoManagerV1:(id)a3;
- (void)setDediscoManagerV2:(id)a3;
- (void)submitDonation:(id)a3 toDediscoWithReply:(id)a4;
@end

@implementation _DPSubmissionService

+ (id)sharedInstance
{
  if (qword_100082B90[0] != -1) {
    dispatch_once(qword_100082B90, &stru_1000751E0);
  }
  v2 = (void *)qword_100082B88;
  return v2;
}

- (_DPSubmissionService)init
{
  v8.receiver = self;
  v8.super_class = (Class)_DPSubmissionService;
  v2 = [(_DPSubmissionService *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    dediscoManagerV1 = v2->_dediscoManagerV1;
    v2->_dediscoManagerV1 = (_DPDediscoSubmissionManager *)v3;

    uint64_t v5 = objc_opt_new();
    dediscoManagerV2 = v2->_dediscoManagerV2;
    v2->_dediscoManagerV2 = (_DPDediscoSubmissionManager *)v5;
  }
  return v2;
}

- (void)submitDonation:(id)a3 toDediscoWithReply:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, uint64_t, id))a4;
  unint64_t v8 = +[_DPDediscoUtils dediscoVersionForDonation:v6];
  if (v8 - 2 >= 3)
  {
    if (v8 != 1)
    {
      v14 = +[_DPLog service];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1000586A0(v14, v15, v16, v17, v18, v19, v20, v21);
      }

      id v12 = +[_DPDediscoError errorWithCode:400 description:@"Malformed Dedisco server configuration in recipe."];
      goto LABEL_10;
    }
    v9 = [(_DPSubmissionService *)self dediscoManagerV1];
    v30 = 0;
    unsigned __int8 v10 = [v9 handleDediscoDonation:v6 error:&v30];
    v11 = v30;
  }
  else
  {
    v9 = [(_DPSubmissionService *)self dediscoManagerV2];
    v29 = 0;
    unsigned __int8 v10 = [v9 handleDediscoDonation:v6 error:&v29];
    v11 = v29;
  }
  id v12 = v11;

  if (v10)
  {
    uint64_t v13 = 1;
    goto LABEL_13;
  }
LABEL_10:
  v22 = +[_DPLog service];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    sub_100058634((uint64_t)v12, v22, v23, v24, v25, v26, v27, v28);
  }

  uint64_t v13 = 0;
LABEL_13:
  v7[2](v7, v13, v12);
}

- (void)fetchTokenWithReply:(id)a3
{
  uint64_t v3 = (void (**)(id, uint64_t, void))a3;
  uint64_t v5 = objc_opt_new();
  if (v5)
  {
    v3[2](v3, 1, 0);
    [v5 fetchTokens];
  }
  else
  {
    id v6 = +[_DPDediscoError errorWithCode:105 description:@"Failed to create token fetcher service"];
    v7 = +[_DPLog service];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100058718((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
    }

    ((void (**)(id, uint64_t, void *))v3)[2](v3, 0, v6);
  }
}

- (_DPDediscoSubmissionManager)dediscoManagerV1
{
  return self->_dediscoManagerV1;
}

- (void)setDediscoManagerV1:(id)a3
{
}

- (_DPDediscoSubmissionManager)dediscoManagerV2
{
  return self->_dediscoManagerV2;
}

- (void)setDediscoManagerV2:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dediscoManagerV2, 0);
  objc_storeStrong((id *)&self->_dediscoManagerV1, 0);
}

@end