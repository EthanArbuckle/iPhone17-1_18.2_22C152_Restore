@interface _ANECompilerService
+ (void)initialize;
- (void)compileModelAt:(id)a3 csIdentity:(id)a4 sandboxExtension:(id)a5 options:(id)a6 tempDirectory:(id)a7 cloneDirectory:(id)a8 outputURL:(id)a9 aotModelBinaryPath:(id)a10 withReply:(id)a11;
@end

@implementation _ANECompilerService

+ (void)initialize
{
  v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.compilerService.csQueue", v4);
  v3 = (void *)qword_100057FC8;
  qword_100057FC8 = (uint64_t)v2;
}

- (void)compileModelAt:(id)a3 csIdentity:(id)a4 sandboxExtension:(id)a5 options:(id)a6 tempDirectory:(id)a7 cloneDirectory:(id)a8 outputURL:(id)a9 aotModelBinaryPath:(id)a10 withReply:(id)a11
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v35 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x3032000000;
  v49[3] = sub_10002D790;
  v49[4] = sub_10002D7A0;
  id v50 = 0;
  objc_msgSend(v16, "string_id");
  kdebug_trace();
  v24 = qword_100057FC8;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002D7A8;
  block[3] = &unk_10004D1F8;
  id v25 = v19;
  id v38 = v25;
  SEL v48 = a2;
  id v26 = v23;
  id v46 = v26;
  id v27 = v18;
  id v39 = v27;
  id v28 = v16;
  id v40 = v28;
  id v29 = v20;
  id v41 = v29;
  id v30 = v17;
  id v42 = v30;
  id v31 = v21;
  id v43 = v31;
  id v32 = v22;
  id v44 = v32;
  v47 = v49;
  id v33 = v35;
  id v45 = v33;
  dispatch_sync(v24, block);

  objc_msgSend(v28, "string_id");
  kdebug_trace();
  _Block_object_dispose(v49, 8);
}

@end