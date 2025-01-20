@interface CLEEDMitigation
+ (BOOL)supportsSecureCoding;
+ (const)sourceAsString:(int64_t)a3;
+ (id)newMitigationFromDict:(id)a3;
- (BOOL)anyChangeToNewRequestsComparedTo:(id)a3;
- (BOOL)dropStreaming;
- (BOOL)needsRequestStateUpdateComparedTo:(id)a3;
- (BOOL)newStreamingAllowed;
- (BOOL)newUploadAllowed;
- (BOOL)updateIfDifferentFrom:(id)a3;
- (BOOL)updateWorseMitigationsFrom:(id)a3;
- (CLEEDMitigation)init;
- (CLEEDMitigation)initWithCoder:(id)a3;
- (CLEEDMitigation)initWithStreamingAllowed:(BOOL)a3 framerateFps:(int64_t)a4 bitrateKbps:(int64_t)a5 dropStreaming:(BOOL)a6 uploadAllowed:(BOOL)a7 uploadMitigation:(int64_t)a8 source:(int64_t)a9;
- (const)toCLEEDUploadMitigationString:(int64_t)a3;
- (id)description;
- (id)newMitigationDict;
- (int64_t)source;
- (int64_t)streamingBitrate;
- (int64_t)streamingFPS;
- (int64_t)uploadMigitation;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setDropStreaming:(BOOL)a3;
- (void)setNewStreamingAllowed:(BOOL)a3;
- (void)setNewUploadAllowed:(BOOL)a3;
- (void)setSource:(int64_t)a3;
- (void)setStreamingBitrate:(int64_t)a3;
- (void)setStreamingFPS:(int64_t)a3;
- (void)setUploadMigitation:(int64_t)a3;
@end

@implementation CLEEDMitigation

- (CLEEDMitigation)initWithStreamingAllowed:(BOOL)a3 framerateFps:(int64_t)a4 bitrateKbps:(int64_t)a5 dropStreaming:(BOOL)a6 uploadAllowed:(BOOL)a7 uploadMitigation:(int64_t)a8 source:(int64_t)a9
{
  BOOL v10 = a7;
  BOOL v11 = a6;
  BOOL v13 = a3;
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  if (qword_1E929F608 != -1) {
    dispatch_once(&qword_1E929F608, &unk_1EE005660);
  }
  v15 = qword_1E929F600;
  if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v16 = !v13;
    BOOL v17 = v13;
    int64_t v18 = a4;
    if (v16) {
      v19 = "NO";
    }
    else {
      v19 = "YES";
    }
    v20 = self;
    if (v11) {
      v21 = "YES";
    }
    else {
      v21 = "NO";
    }
    BOOL v16 = !v10;
    BOOL v33 = v10;
    BOOL v22 = v11;
    int64_t v23 = a8;
    if (v16) {
      v24 = "NO";
    }
    else {
      v24 = "YES";
    }
    *(_DWORD *)buf = 136447746;
    v51 = "-[CLEEDMitigation initWithStreamingAllowed:framerateFps:bitrateKbps:dropStreaming:uploadAllowed:uploadMitigation:source:]";
    __int16 v52 = 2082;
    v53 = v19;
    a4 = v18;
    BOOL v13 = v17;
    __int16 v54 = 2050;
    int64_t v55 = a4;
    __int16 v56 = 2082;
    v57 = v21;
    self = v20;
    __int16 v58 = 2082;
    v59 = v24;
    a8 = v23;
    BOOL v11 = v22;
    BOOL v10 = v33;
    __int16 v60 = 2050;
    int64_t v61 = a8;
    __int16 v62 = 2082;
    v63 = +[CLEEDMitigation sourceAsString:a9];
    _os_log_impl(&dword_1906B8000, v15, OS_LOG_TYPE_DEFAULT, "#EED2CXFW,%{public}s[streamingAllowed:%{public}s,fps:%{public}ld,dropStreaming:%{public}s,uploadAllowed:%{public}s,uploadMitigation:%{public}ld,source:%{public}s]", buf, 0x48u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    v31 = self;
    int64_t v32 = a4;
    int64_t v26 = a8;
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    if (v13) {
      v27 = "YES";
    }
    else {
      v27 = "NO";
    }
    if (v11) {
      v28 = "YES";
    }
    else {
      v28 = "NO";
    }
    if (v10) {
      v29 = "YES";
    }
    else {
      v29 = "NO";
    }
    int v36 = 136447746;
    v37 = "-[CLEEDMitigation initWithStreamingAllowed:framerateFps:bitrateKbps:dropStreaming:uploadAllowed:uploadMitigation:source:]";
    __int16 v38 = 2082;
    v39 = v27;
    __int16 v40 = 2050;
    int64_t v41 = v32;
    __int16 v42 = 2082;
    v43 = v28;
    __int16 v44 = 2082;
    v45 = v29;
    __int16 v46 = 2050;
    a8 = v26;
    int64_t v47 = v26;
    __int16 v48 = 2082;
    v49 = +[CLEEDMitigation sourceAsString:a9];
    v30 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLEEDMitigation initWithStreamingAllowed:framerateFps:bitrateKbps:dropStreaming:uploadAllowed:uploadMitigation:source:]", "CoreLocation: %s\n", v30);
    if (v30 != (char *)buf) {
      free(v30);
    }
    self = v31;
    a4 = v32;
  }
  v35.receiver = self;
  v35.super_class = (Class)CLEEDMitigation;
  result = [(CLEEDMitigation *)&v35 init];
  if (result)
  {
    result->_newStreamingAllowed = v13;
    result->_newUploadAllowed = v10;
    result->_streamingFPS = a4;
    result->_streamingBitrate = a5;
    result->_dropStreaming = v11;
    result->_uploadMigitation = a8;
    result->_source = a9;
  }
  return result;
}

- (CLEEDMitigation)init
{
  return [(CLEEDMitigation *)self initWithStreamingAllowed:1 framerateFps:24 bitrateKbps:800 dropStreaming:0 uploadAllowed:1 uploadMitigation:0 source:1];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)CLEEDMitigation;
  [(CLEEDMitigation *)&v2 dealloc];
}

- (BOOL)anyChangeToNewRequestsComparedTo:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (qword_1E929F608 != -1) {
    dispatch_once(&qword_1E929F608, &unk_1EE005660);
  }
  v5 = qword_1E929F600;
  if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446466;
    BOOL v11 = "-[CLEEDMitigation anyChangeToNewRequestsComparedTo:]";
    __int16 v12 = 2114;
    id v13 = a3;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEBUG, "#EED2CXFW,%{public}s,other:%{public}@", buf, 0x16u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    v9 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLEEDMitigation anyChangeToNewRequestsComparedTo:]", "CoreLocation: %s\n", v9);
    if (v9 != (char *)buf) {
      free(v9);
    }
  }
  if (!a3) {
    return 0;
  }
  int v6 = [(CLEEDMitigation *)self newUploadAllowed];
  if (v6 != [a3 newUploadAllowed]) {
    return 1;
  }
  BOOL v8 = [(CLEEDMitigation *)self newStreamingAllowed];
  return v8 ^ [a3 newStreamingAllowed];
}

- (BOOL)updateWorseMitigationsFrom:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  if (qword_1E929F608 != -1) {
    dispatch_once(&qword_1E929F608, &unk_1EE005660);
  }
  v5 = qword_1E929F600;
  if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446466;
    int64_t v47 = "-[CLEEDMitigation updateWorseMitigationsFrom:]";
    __int16 v48 = 2114;
    int64_t v49 = (int64_t)a3;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEBUG, "#EED2CXFW,%{public}s, incomingMitigation:%{public}@", buf, 0x16u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    v39 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLEEDMitigation updateWorseMitigationsFrom:]", "CoreLocation: %s\n", v39);
    if (v39 != (char *)buf) {
      free(v39);
    }
  }
  if (a3)
  {
    if (![(CLEEDMitigation *)self newStreamingAllowed]
      || (int v6 = [(CLEEDMitigation *)self newStreamingAllowed],
          v6 == [a3 newStreamingAllowed]))
    {
      char v11 = 0;
    }
    else
    {
      if (qword_1E929F608 != -1) {
        dispatch_once(&qword_1E929F608, &unk_1EE005660);
      }
      v7 = qword_1E929F600;
      if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
      {
        if ([(CLEEDMitigation *)self newStreamingAllowed]) {
          BOOL v8 = "YES";
        }
        else {
          BOOL v8 = "NO";
        }
        int v9 = [a3 newStreamingAllowed];
        *(_DWORD *)buf = 136446722;
        int64_t v47 = "-[CLEEDMitigation updateWorseMitigationsFrom:]";
        if (v9) {
          BOOL v10 = "YES";
        }
        else {
          BOOL v10 = "NO";
        }
        __int16 v48 = 2082;
        int64_t v49 = (int64_t)v8;
        __int16 v50 = 2082;
        uint64_t v51 = (uint64_t)v10;
        _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "#EED2CXFW,%{public}s, newStreamingAllowed[%{public}s->%{public}s]", buf, 0x20u);
      }
      if (sub_1906CB57C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1E929F608 != -1) {
          dispatch_once(&qword_1E929F608, &unk_1EE005660);
        }
        [(CLEEDMitigation *)self newStreamingAllowed];
        [a3 newStreamingAllowed];
        __int16 v42 = (char *)_os_log_send_and_compose_impl();
        sub_1906D4A28("Generic", 1, 0, 2, "-[CLEEDMitigation updateWorseMitigationsFrom:]", "CoreLocation: %s\n", v42);
        if (v42 != (char *)buf) {
          free(v42);
        }
      }
      -[CLEEDMitigation setNewStreamingAllowed:](self, "setNewStreamingAllowed:", [a3 newStreamingAllowed]);
      char v11 = 1;
    }
    if (![(CLEEDMitigation *)self dropStreaming])
    {
      int v12 = [(CLEEDMitigation *)self dropStreaming];
      if (v12 != [a3 dropStreaming])
      {
        if (qword_1E929F608 != -1) {
          dispatch_once(&qword_1E929F608, &unk_1EE005660);
        }
        id v13 = qword_1E929F600;
        if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
        {
          if ([(CLEEDMitigation *)self dropStreaming]) {
            uint64_t v14 = "YES";
          }
          else {
            uint64_t v14 = "NO";
          }
          int v15 = [a3 dropStreaming];
          *(_DWORD *)buf = 136446722;
          int64_t v47 = "-[CLEEDMitigation updateWorseMitigationsFrom:]";
          if (v15) {
            BOOL v16 = "YES";
          }
          else {
            BOOL v16 = "NO";
          }
          __int16 v48 = 2082;
          int64_t v49 = (int64_t)v14;
          __int16 v50 = 2082;
          uint64_t v51 = (uint64_t)v16;
          _os_log_impl(&dword_1906B8000, v13, OS_LOG_TYPE_DEFAULT, "#EED2CXFW,%{public}s, dropStreaming[%{public}s->%{public}s]", buf, 0x20u);
        }
        if (sub_1906CB57C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1E929F608 != -1) {
            dispatch_once(&qword_1E929F608, &unk_1EE005660);
          }
          [(CLEEDMitigation *)self dropStreaming];
          [a3 dropStreaming];
          v43 = (char *)_os_log_send_and_compose_impl();
          sub_1906D4A28("Generic", 1, 0, 2, "-[CLEEDMitigation updateWorseMitigationsFrom:]", "CoreLocation: %s\n", v43);
          if (v43 != (char *)buf) {
            free(v43);
          }
        }
        -[CLEEDMitigation setDropStreaming:](self, "setDropStreaming:", [a3 dropStreaming]);
        char v11 = 1;
      }
    }
    uint64_t v17 = [a3 streamingFPS];
    if (v17 < [(CLEEDMitigation *)self streamingFPS])
    {
      if (qword_1E929F608 != -1) {
        dispatch_once(&qword_1E929F608, &unk_1EE005660);
      }
      int64_t v18 = qword_1E929F600;
      if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
      {
        int64_t v19 = [(CLEEDMitigation *)self streamingFPS];
        uint64_t v20 = [a3 streamingFPS];
        *(_DWORD *)buf = 136446722;
        int64_t v47 = "-[CLEEDMitigation updateWorseMitigationsFrom:]";
        __int16 v48 = 2050;
        int64_t v49 = v19;
        __int16 v50 = 2050;
        uint64_t v51 = v20;
        _os_log_impl(&dword_1906B8000, v18, OS_LOG_TYPE_DEFAULT, "#EED2CXFW,%{public}s, streamingFPS[%{public}ld->%{public}ld]", buf, 0x20u);
      }
      if (sub_1906CB57C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1E929F608 != -1) {
          dispatch_once(&qword_1E929F608, &unk_1EE005660);
        }
        [(CLEEDMitigation *)self streamingFPS];
        [a3 streamingFPS];
        __int16 v40 = (char *)_os_log_send_and_compose_impl();
        sub_1906D4A28("Generic", 1, 0, 2, "-[CLEEDMitigation updateWorseMitigationsFrom:]", "CoreLocation: %s\n", v40);
        if (v40 != (char *)buf) {
          free(v40);
        }
      }
      -[CLEEDMitigation setStreamingFPS:](self, "setStreamingFPS:", [a3 streamingFPS]);
      char v11 = 1;
    }
    uint64_t v21 = [a3 streamingBitrate];
    if (v21 < [(CLEEDMitigation *)self streamingBitrate])
    {
      if (qword_1E929F608 != -1) {
        dispatch_once(&qword_1E929F608, &unk_1EE005660);
      }
      BOOL v22 = qword_1E929F600;
      if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
      {
        int64_t v23 = [(CLEEDMitigation *)self streamingBitrate];
        uint64_t v24 = [a3 streamingBitrate];
        *(_DWORD *)buf = 136446722;
        int64_t v47 = "-[CLEEDMitigation updateWorseMitigationsFrom:]";
        __int16 v48 = 2050;
        int64_t v49 = v23;
        __int16 v50 = 2050;
        uint64_t v51 = v24;
        _os_log_impl(&dword_1906B8000, v22, OS_LOG_TYPE_DEFAULT, "#EED2CXFW,%{public}s, streamingBitrate[%{public}ld->%{public}ld]", buf, 0x20u);
      }
      if (sub_1906CB57C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1E929F608 != -1) {
          dispatch_once(&qword_1E929F608, &unk_1EE005660);
        }
        [(CLEEDMitigation *)self streamingBitrate];
        [a3 streamingBitrate];
        int64_t v41 = (char *)_os_log_send_and_compose_impl();
        sub_1906D4A28("Generic", 1, 0, 2, "-[CLEEDMitigation updateWorseMitigationsFrom:]", "CoreLocation: %s\n", v41);
        if (v41 != (char *)buf) {
          free(v41);
        }
      }
      -[CLEEDMitigation setStreamingBitrate:](self, "setStreamingBitrate:", [a3 streamingBitrate]);
      char v11 = 1;
    }
    if ([(CLEEDMitigation *)self newUploadAllowed])
    {
      int v25 = [(CLEEDMitigation *)self newUploadAllowed];
      if (v25 != [a3 newUploadAllowed])
      {
        if (qword_1E929F608 != -1) {
          dispatch_once(&qword_1E929F608, &unk_1EE005660);
        }
        int64_t v26 = qword_1E929F600;
        if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
        {
          if ([(CLEEDMitigation *)self newUploadAllowed]) {
            v27 = "YES";
          }
          else {
            v27 = "NO";
          }
          int v28 = [a3 newUploadAllowed];
          *(_DWORD *)buf = 136446722;
          int64_t v47 = "-[CLEEDMitigation updateWorseMitigationsFrom:]";
          if (v28) {
            v29 = "YES";
          }
          else {
            v29 = "NO";
          }
          __int16 v48 = 2082;
          int64_t v49 = (int64_t)v27;
          __int16 v50 = 2082;
          uint64_t v51 = (uint64_t)v29;
          _os_log_impl(&dword_1906B8000, v26, OS_LOG_TYPE_DEFAULT, "#EED2CXFW,%{public}s, newUploadAllowed[%{public}s->%{public}s]", buf, 0x20u);
        }
        if (sub_1906CB57C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1E929F608 != -1) {
            dispatch_once(&qword_1E929F608, &unk_1EE005660);
          }
          [(CLEEDMitigation *)self newUploadAllowed];
          [a3 newUploadAllowed];
          __int16 v44 = (char *)_os_log_send_and_compose_impl();
          sub_1906D4A28("Generic", 1, 0, 2, "-[CLEEDMitigation updateWorseMitigationsFrom:]", "CoreLocation: %s\n", v44);
          if (v44 != (char *)buf) {
            free(v44);
          }
        }
        -[CLEEDMitigation setNewUploadAllowed:](self, "setNewUploadAllowed:", [a3 newUploadAllowed]);
        char v11 = 1;
      }
    }
    if ([(CLEEDMitigation *)self uploadMigitation] != 2)
    {
      int64_t v30 = [(CLEEDMitigation *)self uploadMigitation];
      if (v30 != [a3 uploadMigitation])
      {
        int64_t v31 = [(CLEEDMitigation *)self uploadMigitation];
        if (v31 == 1)
        {
          if ([a3 uploadMigitation] == 2)
          {
            if (qword_1E929F608 != -1) {
              dispatch_once(&qword_1E929F608, &unk_1EE005660);
            }
            objc_super v35 = qword_1E929F600;
            if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
            {
              int v36 = [(CLEEDMitigation *)self toCLEEDUploadMitigationString:[(CLEEDMitigation *)self uploadMigitation]];
              uint64_t v37 = objc_msgSend(a3, "toCLEEDUploadMitigationString:", objc_msgSend(a3, "uploadMigitation"));
              *(_DWORD *)buf = 136446722;
              int64_t v47 = "-[CLEEDMitigation updateWorseMitigationsFrom:]";
              __int16 v48 = 2082;
              int64_t v49 = (int64_t)v36;
              __int16 v50 = 2082;
              uint64_t v51 = v37;
              _os_log_impl(&dword_1906B8000, v35, OS_LOG_TYPE_DEFAULT, "#EED2CXFW,%{public}s, uploadMitigation[%{public}s->%{public}s]", buf, 0x20u);
            }
            if (!sub_1906CB57C(115, 2)) {
              goto LABEL_82;
            }
            bzero(buf, 0x65CuLL);
            if (qword_1E929F608 == -1) {
              goto LABEL_111;
            }
            goto LABEL_113;
          }
        }
        else if (!v31 && (unint64_t)([a3 uploadMigitation] - 1) <= 1)
        {
          if (qword_1E929F608 != -1) {
            dispatch_once(&qword_1E929F608, &unk_1EE005660);
          }
          int64_t v32 = qword_1E929F600;
          if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
          {
            BOOL v33 = [(CLEEDMitigation *)self toCLEEDUploadMitigationString:[(CLEEDMitigation *)self uploadMigitation]];
            uint64_t v34 = objc_msgSend(a3, "toCLEEDUploadMitigationString:", objc_msgSend(a3, "uploadMigitation"));
            *(_DWORD *)buf = 136446722;
            int64_t v47 = "-[CLEEDMitigation updateWorseMitigationsFrom:]";
            __int16 v48 = 2082;
            int64_t v49 = (int64_t)v33;
            __int16 v50 = 2082;
            uint64_t v51 = v34;
            _os_log_impl(&dword_1906B8000, v32, OS_LOG_TYPE_DEFAULT, "#EED2CXFW,%{public}s, uploadMitigation[%{public}s->%{public}s]", buf, 0x20u);
          }
          if (!sub_1906CB57C(115, 2)) {
            goto LABEL_82;
          }
          bzero(buf, 0x65CuLL);
          if (qword_1E929F608 == -1)
          {
LABEL_111:
            [(CLEEDMitigation *)self toCLEEDUploadMitigationString:[(CLEEDMitigation *)self uploadMigitation]];
            objc_msgSend(a3, "toCLEEDUploadMitigationString:", objc_msgSend(a3, "uploadMigitation"));
            v45 = (char *)_os_log_send_and_compose_impl();
            sub_1906D4A28("Generic", 1, 0, 2, "-[CLEEDMitigation updateWorseMitigationsFrom:]", "CoreLocation: %s\n", v45);
            if (v45 != (char *)buf) {
              free(v45);
            }
LABEL_82:
            -[CLEEDMitigation setUploadMigitation:](self, "setUploadMigitation:", [a3 uploadMigitation]);
LABEL_84:
            -[CLEEDMitigation setSource:](self, "setSource:", [a3 source]);
            return 1;
          }
LABEL_113:
          dispatch_once(&qword_1E929F608, &unk_1EE005660);
          goto LABEL_111;
        }
      }
    }
    if (v11) {
      goto LABEL_84;
    }
  }
  return 0;
}

- (BOOL)updateIfDifferentFrom:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if (qword_1E929F608 != -1) {
    dispatch_once(&qword_1E929F608, &unk_1EE005660);
  }
  v5 = qword_1E929F600;
  if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446466;
    v43 = "-[CLEEDMitigation updateIfDifferentFrom:]";
    __int16 v44 = 2114;
    int64_t v45 = (int64_t)a3;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEBUG, "#EED2CXFW,%{public}s, incomingMitigation:%{public}@", buf, 0x16u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    objc_super v35 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLEEDMitigation updateIfDifferentFrom:]", "CoreLocation: %s\n", v35);
    if (v35 != (char *)buf) {
      free(v35);
    }
  }
  if (a3)
  {
    BOOL v6 = [(CLEEDMitigation *)self newStreamingAllowed];
    int v7 = v6 ^ [a3 newStreamingAllowed];
    if (v7 == 1)
    {
      if (qword_1E929F608 != -1) {
        dispatch_once(&qword_1E929F608, &unk_1EE005660);
      }
      BOOL v8 = qword_1E929F600;
      if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
      {
        if ([(CLEEDMitigation *)self newStreamingAllowed]) {
          int v9 = "YES";
        }
        else {
          int v9 = "NO";
        }
        int v10 = [a3 newStreamingAllowed];
        *(_DWORD *)buf = 136446722;
        v43 = "-[CLEEDMitigation updateIfDifferentFrom:]";
        if (v10) {
          char v11 = "YES";
        }
        else {
          char v11 = "NO";
        }
        __int16 v44 = 2082;
        int64_t v45 = (int64_t)v9;
        __int16 v46 = 2082;
        uint64_t v47 = (uint64_t)v11;
        _os_log_impl(&dword_1906B8000, v8, OS_LOG_TYPE_DEFAULT, "#EED2CXFW,%{public}s, newStreamingAllowed[%{public}s->%{public}s]", buf, 0x20u);
      }
      if (sub_1906CB57C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1E929F608 != -1) {
          dispatch_once(&qword_1E929F608, &unk_1EE005660);
        }
        [(CLEEDMitigation *)self newStreamingAllowed];
        [a3 newStreamingAllowed];
        int v36 = (char *)_os_log_send_and_compose_impl();
        sub_1906D4A28("Generic", 1, 0, 2, "-[CLEEDMitigation updateIfDifferentFrom:]", "CoreLocation: %s\n", v36);
        if (v36 != (char *)buf) {
          free(v36);
        }
      }
      -[CLEEDMitigation setNewStreamingAllowed:](self, "setNewStreamingAllowed:", [a3 newStreamingAllowed]);
    }
    int v12 = [(CLEEDMitigation *)self dropStreaming];
    if (v12 != [a3 dropStreaming])
    {
      if (qword_1E929F608 != -1) {
        dispatch_once(&qword_1E929F608, &unk_1EE005660);
      }
      id v13 = qword_1E929F600;
      if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
      {
        if ([(CLEEDMitigation *)self dropStreaming]) {
          uint64_t v14 = "YES";
        }
        else {
          uint64_t v14 = "NO";
        }
        int v15 = [a3 dropStreaming];
        *(_DWORD *)buf = 136446722;
        v43 = "-[CLEEDMitigation updateIfDifferentFrom:]";
        if (v15) {
          BOOL v16 = "YES";
        }
        else {
          BOOL v16 = "NO";
        }
        __int16 v44 = 2082;
        int64_t v45 = (int64_t)v14;
        __int16 v46 = 2082;
        uint64_t v47 = (uint64_t)v16;
        _os_log_impl(&dword_1906B8000, v13, OS_LOG_TYPE_DEFAULT, "#EED2CXFW,%{public}s, dropStreaming[%{public}s->%{public}s]", buf, 0x20u);
      }
      if (sub_1906CB57C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1E929F608 != -1) {
          dispatch_once(&qword_1E929F608, &unk_1EE005660);
        }
        [(CLEEDMitigation *)self dropStreaming];
        [a3 dropStreaming];
        uint64_t v37 = (char *)_os_log_send_and_compose_impl();
        sub_1906D4A28("Generic", 1, 0, 2, "-[CLEEDMitigation updateIfDifferentFrom:]", "CoreLocation: %s\n", v37);
        if (v37 != (char *)buf) {
          free(v37);
        }
      }
      -[CLEEDMitigation setDropStreaming:](self, "setDropStreaming:", [a3 dropStreaming]);
      LOBYTE(v7) = 1;
    }
    uint64_t v17 = [a3 streamingFPS];
    if (v17 != [(CLEEDMitigation *)self streamingFPS])
    {
      if (qword_1E929F608 != -1) {
        dispatch_once(&qword_1E929F608, &unk_1EE005660);
      }
      int64_t v18 = qword_1E929F600;
      if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
      {
        int64_t v19 = [(CLEEDMitigation *)self streamingFPS];
        uint64_t v20 = [a3 streamingFPS];
        *(_DWORD *)buf = 136446722;
        v43 = "-[CLEEDMitigation updateIfDifferentFrom:]";
        __int16 v44 = 2050;
        int64_t v45 = v19;
        __int16 v46 = 2050;
        uint64_t v47 = v20;
        _os_log_impl(&dword_1906B8000, v18, OS_LOG_TYPE_DEFAULT, "#EED2CXFW,%{public}s, streamingFPS[%{public}ld->%{public}ld]", buf, 0x20u);
      }
      if (sub_1906CB57C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1E929F608 != -1) {
          dispatch_once(&qword_1E929F608, &unk_1EE005660);
        }
        [(CLEEDMitigation *)self streamingFPS];
        [a3 streamingFPS];
        __int16 v38 = (char *)_os_log_send_and_compose_impl();
        sub_1906D4A28("Generic", 1, 0, 2, "-[CLEEDMitigation updateIfDifferentFrom:]", "CoreLocation: %s\n", v38);
        if (v38 != (char *)buf) {
          free(v38);
        }
      }
      -[CLEEDMitigation setStreamingFPS:](self, "setStreamingFPS:", [a3 streamingFPS]);
      LOBYTE(v7) = 1;
    }
    uint64_t v21 = [a3 streamingBitrate];
    if (v21 != [(CLEEDMitigation *)self streamingBitrate])
    {
      if (qword_1E929F608 != -1) {
        dispatch_once(&qword_1E929F608, &unk_1EE005660);
      }
      BOOL v22 = qword_1E929F600;
      if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
      {
        int64_t v23 = [(CLEEDMitigation *)self streamingBitrate];
        uint64_t v24 = [a3 streamingBitrate];
        *(_DWORD *)buf = 136446722;
        v43 = "-[CLEEDMitigation updateIfDifferentFrom:]";
        __int16 v44 = 2050;
        int64_t v45 = v23;
        __int16 v46 = 2050;
        uint64_t v47 = v24;
        _os_log_impl(&dword_1906B8000, v22, OS_LOG_TYPE_DEFAULT, "#EED2CXFW,%{public}s, streamingBitrate[%{public}ld->%{public}ld]", buf, 0x20u);
      }
      if (sub_1906CB57C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1E929F608 != -1) {
          dispatch_once(&qword_1E929F608, &unk_1EE005660);
        }
        [(CLEEDMitigation *)self streamingBitrate];
        [a3 streamingBitrate];
        v39 = (char *)_os_log_send_and_compose_impl();
        sub_1906D4A28("Generic", 1, 0, 2, "-[CLEEDMitigation updateIfDifferentFrom:]", "CoreLocation: %s\n", v39);
        if (v39 != (char *)buf) {
          free(v39);
        }
      }
      -[CLEEDMitigation setStreamingBitrate:](self, "setStreamingBitrate:", [a3 streamingBitrate]);
      LOBYTE(v7) = 1;
    }
    int v25 = [(CLEEDMitigation *)self newUploadAllowed];
    if (v25 != [a3 newUploadAllowed])
    {
      if (qword_1E929F608 != -1) {
        dispatch_once(&qword_1E929F608, &unk_1EE005660);
      }
      int64_t v26 = qword_1E929F600;
      if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
      {
        if ([(CLEEDMitigation *)self newUploadAllowed]) {
          v27 = "YES";
        }
        else {
          v27 = "NO";
        }
        int v28 = [a3 newUploadAllowed];
        *(_DWORD *)buf = 136446722;
        v43 = "-[CLEEDMitigation updateIfDifferentFrom:]";
        if (v28) {
          v29 = "YES";
        }
        else {
          v29 = "NO";
        }
        __int16 v44 = 2082;
        int64_t v45 = (int64_t)v27;
        __int16 v46 = 2082;
        uint64_t v47 = (uint64_t)v29;
        _os_log_impl(&dword_1906B8000, v26, OS_LOG_TYPE_DEFAULT, "#EED2CXFW,%{public}s, newUploadAllowed[%{public}s->%{public}s]", buf, 0x20u);
      }
      if (sub_1906CB57C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1E929F608 != -1) {
          dispatch_once(&qword_1E929F608, &unk_1EE005660);
        }
        [(CLEEDMitigation *)self newUploadAllowed];
        [a3 newUploadAllowed];
        __int16 v40 = (char *)_os_log_send_and_compose_impl();
        sub_1906D4A28("Generic", 1, 0, 2, "-[CLEEDMitigation updateIfDifferentFrom:]", "CoreLocation: %s\n", v40);
        if (v40 != (char *)buf) {
          free(v40);
        }
      }
      -[CLEEDMitigation setNewUploadAllowed:](self, "setNewUploadAllowed:", [a3 newUploadAllowed]);
      LOBYTE(v7) = 1;
    }
    int64_t v30 = [(CLEEDMitigation *)self uploadMigitation];
    if (v30 != [a3 uploadMigitation])
    {
      if (qword_1E929F608 != -1) {
        dispatch_once(&qword_1E929F608, &unk_1EE005660);
      }
      int64_t v31 = qword_1E929F600;
      if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
      {
        int64_t v32 = [(CLEEDMitigation *)self toCLEEDUploadMitigationString:[(CLEEDMitigation *)self uploadMigitation]];
        uint64_t v33 = objc_msgSend(a3, "toCLEEDUploadMitigationString:", objc_msgSend(a3, "uploadMigitation"));
        *(_DWORD *)buf = 136446722;
        v43 = "-[CLEEDMitigation updateIfDifferentFrom:]";
        __int16 v44 = 2082;
        int64_t v45 = (int64_t)v32;
        __int16 v46 = 2082;
        uint64_t v47 = v33;
        _os_log_impl(&dword_1906B8000, v31, OS_LOG_TYPE_DEFAULT, "#EED2CXFW,%{public}s, uploadMitigation[%{public}s->%{public}s]", buf, 0x20u);
      }
      if (sub_1906CB57C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1E929F608 != -1) {
          dispatch_once(&qword_1E929F608, &unk_1EE005660);
        }
        [(CLEEDMitigation *)self toCLEEDUploadMitigationString:[(CLEEDMitigation *)self uploadMigitation]];
        objc_msgSend(a3, "toCLEEDUploadMitigationString:", objc_msgSend(a3, "uploadMigitation"));
        int64_t v41 = (char *)_os_log_send_and_compose_impl();
        sub_1906D4A28("Generic", 1, 0, 2, "-[CLEEDMitigation updateIfDifferentFrom:]", "CoreLocation: %s\n", v41);
        if (v41 != (char *)buf) {
          free(v41);
        }
      }
      -[CLEEDMitigation setUploadMigitation:](self, "setUploadMigitation:", [a3 uploadMigitation]);
      LOBYTE(v7) = 1;
    }
    -[CLEEDMitigation setSource:](self, "setSource:", [a3 source]);
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (BOOL)needsRequestStateUpdateComparedTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (qword_1E929F608 != -1) {
    dispatch_once(&qword_1E929F608, &unk_1EE005660);
  }
  v5 = qword_1E929F600;
  if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446466;
    uint64_t v21 = "-[CLEEDMitigation needsRequestStateUpdateComparedTo:]";
    __int16 v22 = 2114;
    id v23 = a3;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEBUG, "#EED2CXFW,%{public}s, incomingMitigation:%{public}@", buf, 0x16u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    uint64_t v17 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLEEDMitigation needsRequestStateUpdateComparedTo:]", "CoreLocation: %s\n", v17);
    if (v17 != (char *)buf) {
      free(v17);
    }
  }
  if (!a3) {
    return 0;
  }
  int v6 = [(CLEEDMitigation *)self dropStreaming];
  if (v6 == [a3 dropStreaming] || !objc_msgSend(a3, "dropStreaming"))
  {
    BOOL v11 = 0;
  }
  else
  {
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    int v7 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
    {
      if ([(CLEEDMitigation *)self dropStreaming]) {
        BOOL v8 = "YES";
      }
      else {
        BOOL v8 = "NO";
      }
      int v9 = [a3 dropStreaming];
      *(_DWORD *)buf = 136446722;
      uint64_t v21 = "-[CLEEDMitigation needsRequestStateUpdateComparedTo:]";
      if (v9) {
        int v10 = "YES";
      }
      else {
        int v10 = "NO";
      }
      __int16 v22 = 2082;
      id v23 = (id)v8;
      __int16 v24 = 2082;
      uint64_t v25 = (uint64_t)v10;
      _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "#EED2CXFW,%{public}s, dropStreaming[%{public}s->%{public}s]", buf, 0x20u);
    }
    if (sub_1906CB57C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929F608 != -1) {
        dispatch_once(&qword_1E929F608, &unk_1EE005660);
      }
      [(CLEEDMitigation *)self dropStreaming];
      [a3 dropStreaming];
      int64_t v18 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 2, "-[CLEEDMitigation needsRequestStateUpdateComparedTo:]", "CoreLocation: %s\n", v18);
      if (v18 != (char *)buf) {
        free(v18);
      }
    }
    BOOL v11 = 1;
  }
  int64_t v12 = [(CLEEDMitigation *)self uploadMigitation];
  if (v12 != [a3 uploadMigitation] && objc_msgSend(a3, "uploadMigitation") == 1)
  {
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    id v13 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = [(CLEEDMitigation *)self toCLEEDUploadMitigationString:[(CLEEDMitigation *)self uploadMigitation]];
      uint64_t v15 = objc_msgSend(a3, "toCLEEDUploadMitigationString:", objc_msgSend(a3, "uploadMigitation"));
      *(_DWORD *)buf = 136446722;
      uint64_t v21 = "-[CLEEDMitigation needsRequestStateUpdateComparedTo:]";
      __int16 v22 = 2082;
      id v23 = (id)v14;
      __int16 v24 = 2082;
      uint64_t v25 = v15;
      _os_log_impl(&dword_1906B8000, v13, OS_LOG_TYPE_DEFAULT, "#EED2CXFW,%{public}s, uploadMitigation[%{public}s->%{public}s]", buf, 0x20u);
    }
    if (sub_1906CB57C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929F608 != -1) {
        dispatch_once(&qword_1E929F608, &unk_1EE005660);
      }
      [(CLEEDMitigation *)self toCLEEDUploadMitigationString:[(CLEEDMitigation *)self uploadMigitation]];
      objc_msgSend(a3, "toCLEEDUploadMitigationString:", objc_msgSend(a3, "uploadMigitation"));
      int64_t v19 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 2, "-[CLEEDMitigation needsRequestStateUpdateComparedTo:]", "CoreLocation: %s\n", v19);
      if (v19 != (char *)buf) {
        free(v19);
      }
    }
    return 1;
  }
  return v11;
}

- (const)toCLEEDUploadMitigationString:(int64_t)a3
{
  v3 = "None";
  if (a3 == 1) {
    v3 = "Delay";
  }
  if (a3 == 2) {
    return "Drop";
  }
  else {
    return v3;
  }
}

- (id)description
{
  v3 = NSString;
  if ([(CLEEDMitigation *)self newStreamingAllowed]) {
    v4 = "YES";
  }
  else {
    v4 = "NO";
  }
  int64_t v5 = [(CLEEDMitigation *)self streamingFPS];
  int64_t v6 = [(CLEEDMitigation *)self streamingBitrate];
  if ([(CLEEDMitigation *)self dropStreaming]) {
    int v7 = "YES";
  }
  else {
    int v7 = "NO";
  }
  if ([(CLEEDMitigation *)self newUploadAllowed]) {
    BOOL v8 = "YES";
  }
  else {
    BOOL v8 = "NO";
  }
  return (id)objc_msgSend(v3, "stringWithFormat:", @"[streamingAllowed:%s,fps:%ld,Kbps:%ld,dropStreaming:%s,uploadAllowed:%s,uploadMitigation:%s,source:%s]", v4, v5, v6, v7, v8, -[CLEEDMitigation toCLEEDUploadMitigationString:](self, "toCLEEDUploadMitigationString:", -[CLEEDMitigation uploadMigitation](self, "uploadMigitation")), +[CLEEDMitigation sourceAsString:](CLEEDMitigation, "sourceAsString:", -[CLEEDMitigation source](self, "source")));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeBool:self->_newStreamingAllowed forKey:@"newStreamingAllowed"];
  [a3 encodeInteger:self->_streamingFPS forKey:@"streamingFPS"];
  [a3 encodeInteger:self->_streamingBitrate forKey:@"bitrateBPS"];
  [a3 encodeBool:self->_dropStreaming forKey:@"dropStreaming"];
  [a3 encodeBool:self->_newUploadAllowed forKey:@"newUploadAllowed"];
  [a3 encodeInteger:self->_uploadMigitation forKey:@"uploadMigitation"];
  int64_t source = self->_source;

  [a3 encodeInteger:source forKey:@"MitigationSource"];
}

- (CLEEDMitigation)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CLEEDMitigation;
  v4 = [(CLEEDMitigation *)&v6 init];
  if (v4)
  {
    v4->_newStreamingAllowed = [a3 decodeBoolForKey:@"newStreamingAllowed"];
    v4->_dropStreaming = [a3 decodeBoolForKey:@"dropStreaming"];
    v4->_streamingFPS = [a3 decodeIntegerForKey:@"streamingFPS"];
    v4->_streamingBitrate = [a3 decodeIntegerForKey:@"bitrateBPS"];
    v4->_newUploadAllowed = [a3 decodeBoolForKey:@"newUploadAllowed"];
    v4->_uploadMigitation = [a3 decodeIntegerForKey:@"uploadMigitation"];
    v4->_int64_t source = [a3 decodeIntegerForKey:@"MitigationSource"];
  }
  return v4;
}

- (id)newMitigationDict
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (v3)
  {
    objc_msgSend(v3, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithBool:", -[CLEEDMitigation newStreamingAllowed](self, "newStreamingAllowed")), @"newStreamingAllowed");
    objc_msgSend(v3, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithBool:", -[CLEEDMitigation dropStreaming](self, "dropStreaming")), @"dropStreaming");
    objc_msgSend(v3, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithInteger:", -[CLEEDMitigation streamingFPS](self, "streamingFPS")), @"streamingFPS");
    objc_msgSend(v3, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithInteger:", -[CLEEDMitigation streamingBitrate](self, "streamingBitrate")), @"bitrateBPS");
    objc_msgSend(v3, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithBool:", -[CLEEDMitigation newUploadAllowed](self, "newUploadAllowed")), @"newUploadAllowed");
    objc_msgSend(v3, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithInteger:", -[CLEEDMitigation uploadMigitation](self, "uploadMigitation")), @"uploadMigitation");
    objc_msgSend(v3, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithInteger:", -[CLEEDMitigation source](self, "source")), @"MitigationSource");
  }
  else
  {
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    v4 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      BOOL v8 = "-[CLEEDMitigation newMitigationDict]";
      _os_log_impl(&dword_1906B8000, v4, OS_LOG_TYPE_ERROR, "#EED2CXFW,%{public}s,nil mediaItemDict, early return", buf, 0xCu);
    }
    if (sub_1906CB57C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929F608 != -1) {
        dispatch_once(&qword_1E929F608, &unk_1EE005660);
      }
      objc_super v6 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 0, "-[CLEEDMitigation newMitigationDict]", "CoreLocation: %s\n", v6);
      if (v6 != (char *)buf) {
        free(v6);
      }
    }
  }
  return v3;
}

+ (id)newMitigationFromDict:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v4 = objc_alloc_init(CLEEDMitigation);
  if (v4)
  {
    -[CLEEDMitigation setSource:](v4, "setSource:", (int)objc_msgSend((id)objc_msgSend(a3, "valueForKey:", @"MitigationSource"), "intValue"));
    -[CLEEDMitigation setUploadMigitation:](v4, "setUploadMigitation:", (int)objc_msgSend((id)objc_msgSend(a3, "valueForKey:", @"uploadMigitation"), "intValue"));
    -[CLEEDMitigation setStreamingFPS:](v4, "setStreamingFPS:", objc_msgSend((id)objc_msgSend(a3, "valueForKey:", @"streamingFPS"), "integerValue"));
    -[CLEEDMitigation setStreamingBitrate:](v4, "setStreamingBitrate:", objc_msgSend((id)objc_msgSend(a3, "valueForKey:", @"bitrateBPS"), "integerValue"));
    -[CLEEDMitigation setNewUploadAllowed:](v4, "setNewUploadAllowed:", objc_msgSend((id)objc_msgSend(a3, "valueForKey:", @"newUploadAllowed"), "BOOLValue"));
    -[CLEEDMitigation setNewStreamingAllowed:](v4, "setNewStreamingAllowed:", objc_msgSend((id)objc_msgSend(a3, "valueForKey:", @"newStreamingAllowed"), "BOOLValue"));
    -[CLEEDMitigation setDropStreaming:](v4, "setDropStreaming:", objc_msgSend((id)objc_msgSend(a3, "valueForKey:", @"dropStreaming"), "BOOLValue"));
  }
  else
  {
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    int64_t v5 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v9 = "+[CLEEDMitigation newMitigationFromDict:]";
      _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_ERROR, "#EED2CXFW,%{public}s,nil mitigation, early return", buf, 0xCu);
    }
    if (sub_1906CB57C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929F608 != -1) {
        dispatch_once(&qword_1E929F608, &unk_1EE005660);
      }
      int v7 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 0, "+[CLEEDMitigation newMitigationFromDict:]", "CoreLocation: %s\n", v7);
      if (v7 != (char *)buf) {
        free(v7);
      }
    }
  }
  return v4;
}

+ (const)sourceAsString:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3) {
    return "NotSet";
  }
  else {
    return off_1E5697358[a3 - 1];
  }
}

- (BOOL)newStreamingAllowed
{
  return self->_newStreamingAllowed;
}

- (void)setNewStreamingAllowed:(BOOL)a3
{
  self->_newStreamingAllowed = a3;
}

- (BOOL)dropStreaming
{
  return self->_dropStreaming;
}

- (void)setDropStreaming:(BOOL)a3
{
  self->_dropStreaming = a3;
}

- (int64_t)streamingFPS
{
  return self->_streamingFPS;
}

- (void)setStreamingFPS:(int64_t)a3
{
  self->_streamingFPS = a3;
}

- (int64_t)streamingBitrate
{
  return self->_streamingBitrate;
}

- (void)setStreamingBitrate:(int64_t)a3
{
  self->_streamingBitrate = a3;
}

- (BOOL)newUploadAllowed
{
  return self->_newUploadAllowed;
}

- (void)setNewUploadAllowed:(BOOL)a3
{
  self->_newUploadAllowed = a3;
}

- (int64_t)uploadMigitation
{
  return self->_uploadMigitation;
}

- (void)setUploadMigitation:(int64_t)a3
{
  self->_uploadMigitation = a3;
}

- (int64_t)source
{
  return self->_source;
}

- (void)setSource:(int64_t)a3
{
  self->_int64_t source = a3;
}

@end