@interface DUFoundInEvent
- (id)requestEventExtractionWithSerializedDocument:(id)a3 documentType:(int64_t)a4 options:(id)a5 error:(id *)a6;
- (void)foundInEventResultWithSerializedDocument:(id)a3 documentType:(int64_t)a4 completion:(id)a5;
@end

@implementation DUFoundInEvent

- (id)requestEventExtractionWithSerializedDocument:(id)a3 documentType:(int64_t)a4 options:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a5;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = sub_24CF7AF44;
  v27 = sub_24CF7AF54;
  id v28 = 0;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = sub_24CF7AF44;
  v21 = sub_24CF7AF54;
  id v22 = 0;
  v11 = +[DUXPCClient sharedInstance];
  uint64_t v12 = getpid();
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = sub_24CF7AF5C;
  v16[3] = &unk_2652FA690;
  v16[4] = &v17;
  v16[5] = &v23;
  [v11 synchronousEventExtractionWithSerializedDocument:v9 documentType:a4 pid:v12 completion:v16];

  if (a6)
  {
    v13 = (void *)v18[5];
    if (v13) {
      *a6 = v13;
    }
  }
  id v14 = (id)v24[5];
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v14;
}

- (void)foundInEventResultWithSerializedDocument:(id)a3 documentType:(int64_t)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = +[DUXPCClient sharedInstance];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_24CF7B13C;
  v11[3] = &unk_2652FA668;
  id v12 = v7;
  id v10 = v7;
  [v9 foundInEventResultWithSerializedDocument:v8 documentType:a4 completion:v11];
}

@end