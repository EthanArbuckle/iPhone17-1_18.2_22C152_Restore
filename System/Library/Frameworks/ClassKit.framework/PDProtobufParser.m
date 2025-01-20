@interface PDProtobufParser
- (BOOL)supportsStreamedParsing;
- (PDProtobufParser)init;
- (id)parseData:(id)a3 expectedClass:(Class)a4 error:(id *)a5;
@end

@implementation PDProtobufParser

- (PDProtobufParser)init
{
  v5.receiver = self;
  v5.super_class = (Class)PDProtobufParser;
  v2 = [(PDProtobufParser *)&v5 init];
  v3 = v2;
  if (v2) {
    objc_storeWeak((id *)&v2->_provider, 0);
  }
  return v3;
}

- (BOOL)supportsStreamedParsing
{
  v2 = self;
  v3 = v2;
  if (v2) {
    id WeakRetained = objc_loadWeakRetained((id *)&v2->_provider);
  }
  else {
    id WeakRetained = 0;
  }
  objc_super v5 = +[PDUserDefaults sharedDefaults];
  if ([v5 enableResponseStreaming]) {
    BOOL v6 = WeakRetained == 0;
  }
  else {
    BOOL v6 = 1;
  }
  BOOL v7 = !v6 && [WeakRetained canParseStreams] && v3->_payloadProcessBlock != 0;

  return v7;
}

- (id)parseData:(id)a3 expectedClass:(Class)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = objc_alloc_init(a4);
  if ([(PDProtobufParser *)self supportsStreamedParsing])
  {
    id v10 = v8;
    if (self)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
      if (WeakRetained)
      {
        v12 = WeakRetained;
        id v50 = v8;
        v51 = self;
        v48 = a5;
        id v49 = v9;
        v47 = v10;
        v13 = [objc_alloc((Class)PBDataReader) initWithData:v10];
        v14 = 0;
        char v56 = 0;
        v15 = (int *)&OBJC_IVAR___PBDataReader__length;
        v16 = (int *)&OBJC_IVAR___PBDataReader__error;
        v17 = (int *)&OBJC_IVAR___PBDataReader__bytes;
        while (1)
        {
          if (*(void *)&v13[OBJC_IVAR___PBDataReader__pos] >= *(void *)&v13[*v15] || v13[*v16]) {
            goto LABEL_42;
          }
          char v19 = 0;
          unsigned int v20 = 0;
          unint64_t v21 = 0;
          while (1)
          {
            unint64_t v22 = *(void *)&v13[OBJC_IVAR___PBDataReader__pos];
            if (v22 == -1 || v22 >= *(void *)&v13[*v15]) {
              break;
            }
            char v23 = *(unsigned char *)(*(void *)&v13[*v17] + v22);
            *(void *)&v13[OBJC_IVAR___PBDataReader__pos] = v22 + 1;
            v21 |= (unint64_t)(v23 & 0x7F) << v19;
            if ((v23 & 0x80) == 0) {
              goto LABEL_15;
            }
            v19 += 7;
            if (v20++ >= 9)
            {
              unint64_t v21 = 0;
              int v25 = v13[*v16];
              goto LABEL_17;
            }
          }
          v13[*v16] = 1;
LABEL_15:
          int v25 = v13[*v16];
          if (v13[*v16]) {
            unint64_t v21 = 0;
          }
LABEL_17:
          if (v25)
          {
            v55 = v14;
            CFStringRef v39 = @"Parser encountered PBReader error.";
            v40 = &v55;
            v41 = &v55;
            goto LABEL_36;
          }
          if ((v21 & 7) == 4) {
            goto LABEL_41;
          }
          if ([v12 streamablePayloadClassTagValue] != (id)(v21 >> 3)) {
            break;
          }
          [v12 streamablePayloadClass];
          v26 = objc_opt_new();
          *(_OWORD *)buf = 0uLL;
          if ((PBReaderPlaceMark() & 1) == 0)
          {
            id v54 = v14;
            +[NSError cls_assignError:&v54 code:300 format:@"Parser encountered PBReader mark error."];
            id v31 = v54;

LABEL_39:
            v14 = v26;
            goto LABEL_40;
          }
          v27 = v15;
          v28 = v17;
          v29 = v16;
          id v53 = v14;
          unsigned int v30 = [v12 readStreamablePayload:v26 reader:v13 error:&v53];
          id v31 = v53;

          if (!v30)
          {
            v16 = v29;
            goto LABEL_39;
          }
          if (v26)
          {
            payloadProcessBlock = (void (**)(void))v51->_payloadProcessBlock;
            v52[1] = v31;
            payloadProcessBlock[2]();
            id v33 = v31;

            id v31 = v33;
          }
          PBReaderRecallMark();

          v14 = v31;
          v16 = v29;
          v17 = v28;
          v15 = v27;
          if (v56)
          {
            if (v31) {
              goto LABEL_26;
            }
LABEL_43:
            BOOL v35 = v13[*v16] == 0;
            id v9 = v49;
            id v8 = v50;
            a5 = v48;
            goto LABEL_44;
          }
        }
        if (PBReaderSkipValueWithTag()) {
          goto LABEL_41;
        }
        v52[0] = v14;
        CFStringRef v39 = @"Parser encountered error in PBReaderSkipValueWithTag.";
        v40 = (id *)v52;
        v41 = (void **)v52;
LABEL_36:
        +[NSError cls_assignError:v41 code:300 format:v39];
        id v31 = *v40;
LABEL_40:

        v14 = v31;
LABEL_41:
LABEL_42:
        id v31 = v14;
        if (!v14) {
          goto LABEL_43;
        }
LABEL_26:
        id v9 = v49;
        id v8 = v50;
        a5 = v48;
        if (v48)
        {
          id v34 = v31;
          BOOL v35 = 0;
          id *v48 = v34;
        }
        else
        {
          BOOL v35 = 0;
        }
LABEL_44:
        BOOL v57 = v35;

        BOOL v42 = v57;
        if (v42) {
          goto LABEL_45;
        }
        goto LABEL_46;
      }
      +[NSError cls_assignError:a5 code:300 format:@"PDProtobuf Parser provider is missing."];
    }

    goto LABEL_46;
  }
  id v37 = [objc_alloc((Class)PBDataReader) initWithData:v8];
  unsigned __int8 v38 = [v9 readFrom:v37];

  if (v38)
  {
LABEL_45:
    id v43 = v9;
    goto LABEL_49;
  }
LABEL_46:
  +[NSError cls_assignError:a5, 300, @"Error parsing message of class %@ from data %@.", objc_opt_class(), v8 code format];
  CLSInitLog();
  v44 = CLSLogOperations;
  if (os_log_type_enabled(CLSLogOperations, OS_LOG_TYPE_INFO))
  {
    id v45 = *a5;
    *(_DWORD *)buf = 138543362;
    *(void *)&buf[4] = v45;
    _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "Parser failed: %{public}@", buf, 0xCu);
  }
  id v43 = 0;
LABEL_49:

  return v43;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_payloadProcessBlock, 0);

  objc_destroyWeak((id *)&self->_provider);
}

@end