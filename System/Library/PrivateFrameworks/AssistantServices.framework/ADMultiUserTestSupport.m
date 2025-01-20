@interface ADMultiUserTestSupport
+ (id)sharedService;
- (BOOL)hasTestUserSelectionScores;
- (id)_init;
- (id)getClassifiedUser;
- (id)getDebugVoiceIdScores;
- (id)getUserIdentityClassification;
- (void)updateVoiceIdScoreToUser:(id)a3 score:(id)a4 reset:(BOOL)a5 completion:(id)a6;
@end

@implementation ADMultiUserTestSupport

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scoresBySharedID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (BOOL)hasTestUserSelectionScores
{
  int v3 = AFIsInternalInstall();
  if (v3) {
    LOBYTE(v3) = self->_scoresBySharedID != 0;
  }
  return v3;
}

- (id)getUserIdentityClassification
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = sub_1002ACB78;
  v13 = sub_1002ACB88;
  id v14 = SAUserIdentityClassificationUnknownValue;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1002ACB90;
  v8[3] = &unk_10050D5F0;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(queue, v8);
  v4 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = v10[5];
    *(_DWORD *)buf = 136315394;
    v16 = "-[ADMultiUserTestSupport getUserIdentityClassification]";
    __int16 v17 = 2112;
    uint64_t v18 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s userIdentityClassification = %@", buf, 0x16u);
  }
  id v5 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v5;
}

- (id)getClassifiedUser
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = sub_1002ACB78;
  v12 = sub_1002ACB88;
  id v13 = 0;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002AD0E8;
  v7[3] = &unk_10050D5F0;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(queue, v7);
  int v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = v9[5];
    *(_DWORD *)buf = 136315394;
    v15 = "-[ADMultiUserTestSupport getClassifiedUser]";
    __int16 v16 = 2112;
    uint64_t v17 = v6;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s classifiedUser = %@", buf, 0x16u);
  }
  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

- (id)getDebugVoiceIdScores
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_1002ACB78;
  uint64_t v10 = sub_1002ACB88;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1002AD2DC;
  v5[3] = &unk_10050D5F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)updateVoiceIdScoreToUser:(id)a3 score:(id)a4 reset:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (AFIsInternalInstall())
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002AD440;
    block[3] = &unk_100509CF0;
    BOOL v18 = a5;
    block[4] = self;
    id v15 = v11;
    id v16 = v10;
    id v17 = v12;
    dispatch_async(queue, block);
  }
  else if (v12)
  {
    (*((void (**)(id, void))v12 + 2))(v12, 0);
  }
}

- (id)_init
{
  v7.receiver = self;
  v7.super_class = (Class)ADMultiUserTestSupport;
  v2 = [(ADMultiUserTestSupport *)&v7 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("ADMultiUserTestSupport", v3);

    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

+ (id)sharedService
{
  if (AFSupportsMultiUser())
  {
    if (qword_1005860E8 != -1) {
      dispatch_once(&qword_1005860E8, &stru_100509CC8);
    }
    id v2 = (id)qword_1005860E0;
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

@end