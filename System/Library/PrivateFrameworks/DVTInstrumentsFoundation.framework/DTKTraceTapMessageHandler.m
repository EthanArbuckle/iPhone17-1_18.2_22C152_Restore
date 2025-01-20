@interface DTKTraceTapMessageHandler
- (DTKTraceTapMessageHandler)initWithConfig:(id)a3;
- (id)messageReceived:(id)a3;
@end

@implementation DTKTraceTapMessageHandler

- (DTKTraceTapMessageHandler)initWithConfig:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DTKTraceTapMessageHandler;
  v5 = [(DTTapMessageHandler *)&v13 initWithConfig:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    datastream = v5->_datastream;
    v5->_datastream = (DVTInputStream *)v6;

    if (!v5->_datastream) {
      sub_23093D84C();
    }
    uint64_t v8 = objc_opt_new();
    rawMessages = v5->_rawMessages;
    v5->_rawMessages = (NSMutableArray *)v8;

    openFile = v5->_openFile;
    v5->_openFile = 0;

    openFileURL = v5->_openFileURL;
    v5->_openFileURL = 0;

    v5->_canUseRawKtrace = [v4 canUseRawKtraceFile];
  }

  return v5;
}

- (id)messageReceived:(id)a3
{
  uint64_t v95 = *MEMORY[0x263EF8340];
  id v72 = a3;
  v93.receiver = self;
  v93.super_class = (Class)DTKTraceTapMessageHandler;
  id v4 = -[DTTapMessageHandler messageReceived:](&v93, sel_messageReceived_);
  v5 = v72;
  if (v72 && !v4)
  {
    if (self->_canUseRawKtrace)
    {
      uint64_t v86 = 0;
      uint64_t v6 = [v72 getBufferWithReturnedLength:&v86];
      if (v6)
      {
        v7 = self;
        if (!self->_openFile)
        {
          LODWORD(size) = -1;
          uint64_t v8 = +[DTKTraceSessionCreator getDefaultedRemotePath:&size];
          openFileURL = self->_openFileURL;
          self->_openFileURL = v8;

          id v10 = objc_alloc(MEMORY[0x263F08840]);
          v11 = (NSFileHandle *)[v10 initWithFileDescriptor:size closeOnDealloc:1];
          openFile = self->_openFile;
          self->_openFile = v11;

          v7 = self;
        }
        if (v86)
        {
          objc_super v13 = v7->_openFile;
          id v14 = objc_alloc(MEMORY[0x263EFF8F8]);
          v15 = (void *)[v14 initWithBytesNoCopy:v6 length:v86 deallocator:&unk_26E515668];
          id v92 = 0;
          [(NSFileHandle *)v13 writeData:v15 error:&v92];
          id v16 = v92;

          if (v16) {
            sub_23093D940();
          }
        }
        goto LABEL_12;
      }
    }
    else
    {
      id v17 = v72;
      if ([v17 getBufferWithReturnedLength:0])
      {
        [(NSMutableArray *)self->_rawMessages addObject:v17];
LABEL_12:
        id v4 = 0;
LABEL_61:
        v5 = v72;
        goto LABEL_62;
      }
    }
    v18 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
    v71 = [v72 objectWithAllowedClasses:v18];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v70 = [(DTTapMessageHandler *)self config];
      int v19 = [v71 kind];
      switch(v19)
      {
        case 0:
          self->_int64_t triggerCount = [v71 triggerCount];
          self->_coreCount = [v71 coreCount];
          unsigned int v20 = [v71 tapVersion];
          id v4 = 0;
          if (v20) {
            unsigned int v21 = v20;
          }
          else {
            unsigned int v21 = 0x10000;
          }
          self->_tapVersion = v21;
          goto LABEL_59;
        case 1:
        case 2:
        case 3:
        case 4:
          sub_23093D8FC(v71);
        case 5:
          id v4 = objc_opt_new();
          [v4 setTapVersion:self->_tapVersion];
          [v4 setIsSession:1];
          [v4 setFinalMemo:1];
          [v4 setSupportsPeek:1];
          int64_t triggerCount = self->_triggerCount;
          [v4 setTriggerCount:triggerCount];
          v28 = self;
          triggerIDs = self->_triggerIDs;
          if (triggerIDs)
          {
            v30 = [MEMORY[0x263EFF8F8] dataWithBytes:triggerIDs length:4 * triggerCount];
            [v4 setTriggerIDs:v30];

            v28 = self;
          }
          p_datastream = (void **)&v28->_datastream;
          [v4 setDatastream:v28->_datastream];
          v32 = *p_datastream;
          *p_datastream = 0;

          goto LABEL_59;
        case 6:
          long long v82 = 0u;
          long long v83 = 0u;
          long long v84 = 0u;
          long long v85 = 0u;
          v33 = self->_rawMessages;
          uint64_t v34 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v82 objects:v94 count:16];
          if (v34)
          {
            uint64_t v35 = *(void *)v83;
            do
            {
              for (uint64_t i = 0; i != v34; ++i)
              {
                if (*(void *)v83 != v35) {
                  objc_enumerationMutation(v33);
                }
                uint64_t v86 = 0;
                v87 = &v86;
                uint64_t v88 = 0x3032000000;
                v89 = sub_2308C5C4C;
                v90 = sub_2308C5C5C;
                id v91 = *(id *)(*((void *)&v82 + 1) + 8 * i);
                size_t size = 0;
                uint64_t v37 = [ (id) v87[5] getBufferWithReturnedLength:&size];
                if (size)
                {
                  uint64_t v38 = v37;
                  datastream = self->_datastream;
                  id v40 = objc_alloc(MEMORY[0x263EFF8F8]);
                  v80[0] = MEMORY[0x263EF8330];
                  v80[1] = 3221225472;
                  v80[2] = sub_2308C5C64;
                  v80[3] = &unk_264B8F080;
                  v80[4] = &v86;
                  v41 = (void *)[v40 initWithBytesNoCopy:v38 length:size deallocator:v80];
                  id v79 = 0;
                  [(DVTInputStream *)datastream write:v41 error:&v79];
                  id v42 = v79;

                  if (v42) {
                    __assert_rtn("-[DTKTraceTapMessageHandler messageReceived:]", "DTKTraceTapMessageHandler.m", 106, "error == nil");
                  }
                }
                _Block_object_dispose(&v86, 8);
              }
              uint64_t v34 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v82 objects:v94 count:16];
            }
            while (v34);
          }

          [(NSMutableArray *)self->_rawMessages removeAllObjects];
          id v4 = objc_opt_new();
          [v4 setTapVersion:self->_tapVersion];
          [v4 setIsSession:1];
          [v4 setSupportsPeek:1];
          int64_t v43 = self->_triggerCount;
          [v4 setTriggerCount:v43];
          v44 = self;
          v45 = self->_triggerIDs;
          if (v45)
          {
            v46 = [MEMORY[0x263EFF8F8] dataWithBytes:v45 length:4 * v43];
            [v4 setTriggerIDs:v46];

            v44 = self;
          }
          if (!v44->_datastream) {
            sub_23093D878();
          }
          [v4 setDatastream:];
          v47 = self->_datastream;
          id v78 = 0;
          v48 = [(DVTInputStream *)v47 createNextStream:&v78];
          id v49 = v78;
          v50 = self->_datastream;
          self->_datastream = v48;

          if (!self->_datastream) {
            sub_23093D8A4();
          }

          goto LABEL_59;
        case 7:
          v51 = self->_triggerIDs;
          if (v51)
          {
            free(v51);
            self->_triggerIDs = 0;
          }
          v52 = [v71 sessionMetadata];
          v53 = [v52 objectForKeyedSubscript:@"triggerIDs"];
          v54 = [v52 objectForKeyedSubscript:@"triggerUUIDs"];
          if ([v53 count])
          {
            uint64_t v55 = [v53 count];
            if (v55 == [v54 count])
            {
              v56 = [NSDictionary dictionaryWithObjects:v53 forKeys:v54];
              v57 = (unsigned int *)malloc_type_malloc(4 * self->_triggerCount, 0x100004052888210uLL);
              self->_triggerIDs = v57;
              int64_t v58 = self->_triggerCount;
              if (v58 >= 1) {
                memset(v57, 255, 4 * v58);
              }
              uint64_t v86 = 0;
              v87 = &v86;
              uint64_t v88 = 0x2020000000;
              LODWORD(v89) = 0;
              v73[0] = MEMORY[0x263EF8330];
              v73[1] = 3221225472;
              v73[2] = sub_2308C5C8C;
              v73[3] = &unk_264B8F0A8;
              id v59 = v56;
              id v74 = v59;
              v75 = self;
              v76 = &v86;
              [v70 enumerateTriggerConfigs:v73];
              [v70 _runningMetadataChanged:v52];

              _Block_object_dispose(&v86, 8);
            }
          }

          goto LABEL_56;
        default:
          if (v19 == 1024)
          {
            uint64_t v86 = 0;
            v87 = &v86;
            uint64_t v88 = 0x3032000000;
            v89 = sub_2308C5C4C;
            v90 = sub_2308C5C5C;
            id v91 = [(NSMutableArray *)self->_rawMessages firstObject];
            size_t size = 0;
            v60 = (const void *)[ (id) v87[5] getBufferWithReturnedLength:&size];
            if (size)
            {
              destructor[0] = MEMORY[0x263EF8330];
              destructor[1] = 3221225472;
              destructor[2] = sub_2308C5C78;
              destructor[3] = &unk_264B8E278;
              destructor[4] = &v86;
              v61 = dispatch_data_create(v60, size, 0, destructor);
              xpc_object_t v62 = xpc_data_create_with_dispatch_data(v61);
              id v4 = objc_opt_new();
              [v4 setIsSession:0];
              [v4 setSupportsPeek:0];
              [v4 setStackshot:v62];
            }
            else
            {
              id v4 = 0;
            }
            [(NSMutableArray *)self->_rawMessages removeAllObjects];
            _Block_object_dispose(&v86, 8);
          }
          else
          {
            if (v19 != 1025) {
              goto LABEL_56;
            }
            v22 = [v71 localFilePath];

            if (v22)
            {
              id v23 = objc_alloc(NSURL);
              v24 = [v71 localFilePath];
              v25 = (NSURL *)[v23 initWithString:v24];
              v26 = self->_openFileURL;
              self->_openFileURL = v25;
            }
            if (self->_openFileURL)
            {
              v63 = [[DVTFileStream alloc] initWithURL:self->_openFileURL];
              [(NSMutableArray *)self->_rawMessages removeAllObjects];
              id v4 = objc_opt_new();
              [v4 setTapVersion:self->_tapVersion];
              [v4 setIsSession:1];
              [v4 setIsRawKtraceFile:1];
              [v4 setSupportsPeek:0];
              int64_t v64 = self->_triggerCount;
              [v4 setTriggerCount:v64];
              v65 = self->_triggerIDs;
              if (v65)
              {
                v66 = [MEMORY[0x263EFF8F8] dataWithBytes:v65 length:4 * v64];
                [v4 setTriggerIDs:v66];
              }
              if (!self->_datastream) {
                sub_23093D8D0();
              }
              [v4 setDatastream:v63];
              v67 = self->_openFile;
              self->_openFile = 0;

              v68 = self->_openFileURL;
              self->_openFileURL = 0;
            }
            else
            {
LABEL_56:
              id v4 = 0;
            }
          }
LABEL_59:

          break;
      }
    }
    else
    {
      id v4 = 0;
    }

    goto LABEL_61;
  }
LABEL_62:

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_openFileURL, 0);
  objc_storeStrong((id *)&self->_openFile, 0);
  objc_storeStrong((id *)&self->_rawMessages, 0);
  objc_storeStrong((id *)&self->_datastream, 0);
}

@end