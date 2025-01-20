@interface CMContinuityCaptureAVCaptureVideoSession
- (AVCaptureVideoPreviewLayer)videoPreviewLayer;
- (BOOL)hasConnectionsForEntity:(int64_t)a3;
- (BOOL)isMulticamSession;
- (CMContinuityCaptureAVCaptureVideoSession)initWithQueue:(id)a3 requiresMulticamSession:(BOOL)a4;
- (void)addConnections:(id)a3;
- (void)dealloc;
- (void)removeConnections:(id)a3;
- (void)setVideoPreviewLayer:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation CMContinuityCaptureAVCaptureVideoSession

- (CMContinuityCaptureAVCaptureVideoSession)initWithQueue:(id)a3 requiresMulticamSession:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (Class *)0x263EFA600;
  if (!v4) {
    v7 = (Class *)0x263EFA638;
  }
  id v8 = objc_alloc_init(*v7);
  if (v8
    && (v16.receiver = self,
        v16.super_class = (Class)CMContinuityCaptureAVCaptureVideoSession,
        (self = [(CMContinuityCaptureAVCaptureBaseSession *)&v16 initWithCaptureSession:v8 queue:v6]) != 0))
  {
    v9 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v18 = self;
      __int16 v19 = 2112;
      id v20 = v8;
      _os_log_impl(&dword_235FC2000, v9, OS_LOG_TYPE_DEFAULT, "%@ created capture session %@", buf, 0x16u);
    }

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    connections = self->_connections;
    self->_connections = v10;

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    connectionEntities = self->_connectionEntities;
    self->_connectionEntities = v12;

    self = self;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)dealloc
{
  if ([(NSMutableArray *)self->_connections count]) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498], @"%@ ContinuityCapture error : capture session has unremoved video connections %@", self, self->_connections format];
  }
  v3.receiver = self;
  v3.super_class = (Class)CMContinuityCaptureAVCaptureVideoSession;
  [(CMContinuityCaptureAVCaptureBaseSession *)&v3 dealloc];
}

- (void)setVideoPreviewLayer:(id)a3
{
}

- (AVCaptureVideoPreviewLayer)videoPreviewLayer
{
  return self->_videoPreviewLayer;
}

- (BOOL)isMulticamSession
{
  v2 = [(CMContinuityCaptureAVCaptureBaseSession *)self captureSession];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)addConnections:(id)a3
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(CMContinuityCaptureAVCaptureBaseSession *)self queue];
  dispatch_assert_queue_V2(v5);

  if ([(CMContinuityCaptureAVCaptureBaseSession *)self state] == 1)
  {
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v44 = v4;
    obuint64_t j = v4;
    uint64_t v47 = [obj countByEnumeratingWithState:&v55 objects:v66 count:16];
    if (!v47) {
      goto LABEL_38;
    }
    uint64_t v46 = *(void *)v56;
    uint64_t v50 = *MEMORY[0x263EF9680];
    while (1)
    {
      for (uint64_t i = 0; i != v47; uint64_t i = v34 + 1)
      {
        if (*(void *)v56 != v46) {
          objc_enumerationMutation(obj);
        }
        v48 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        uint64_t v49 = i;
        v7 = [v48 inputPorts];
        long long v51 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v51 objects:v65 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v52;
          do
          {
            for (uint64_t j = 0; j != v9; ++j)
            {
              if (*(void *)v52 != v10) {
                objc_enumerationMutation(v7);
              }
              v12 = *(void **)(*((void *)&v51 + 1) + 8 * j);
              v13 = [(CMContinuityCaptureAVCaptureBaseSession *)self captureSession];
              v14 = [v12 input];
              int v15 = [v13 canAddInput:v14];

              if (v15)
              {
                objc_super v16 = [v12 input];
                v17 = [(CMContinuityCaptureAVCaptureBaseSession *)self captureSession];
                [v17 addInputWithNoConnections:v16];

                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v18 = [v16 device];
                  __int16 v19 = [v18 deviceType];
                  char v20 = [v19 isEqualToString:v50];

                  if ((v20 & 1) == 0)
                  {
                    objc_storeStrong((id *)&self->_videoCameraInput, v16);
                    v24 = &unk_26E96A6D8;
LABEL_21:
                    [(NSMutableArray *)self->_connectionEntities addObject:v24];
                    goto LABEL_22;
                  }
                }
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  uint64_t v21 = [v16 device];
                  v22 = [v21 deviceType];
                  int v23 = [v22 isEqualToString:v50];

                  v24 = &unk_26E96A6F0;
                  if (v23) {
                    goto LABEL_21;
                  }
                }
              }
              else
              {
                objc_super v16 = CMContinuityCaptureLog(2);
                if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
                {
                  v25 = [v12 input];
                  *(_DWORD *)buf = 138412802;
                  v60 = self;
                  __int16 v61 = 2112;
                  *(void *)v62 = v25;
                  *(_WORD *)&v62[8] = 2080;
                  *(void *)&v62[10] = "-[CMContinuityCaptureAVCaptureVideoSession addConnections:]";
                  _os_log_impl(&dword_235FC2000, v16, OS_LOG_TYPE_DEFAULT, "%@ can't add input %@ %s", buf, 0x20u);
                }
              }
LABEL_22:
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v51 objects:v65 count:16];
          }
          while (v9);
        }
        v26 = [(CMContinuityCaptureAVCaptureBaseSession *)self captureSession];
        v27 = [v48 output];
        int v28 = [v26 canAddOutput:v27];

        if (v28)
        {
          v29 = [(CMContinuityCaptureAVCaptureBaseSession *)self captureSession];
          v30 = [v48 output];
          [v29 addOutputWithNoConnections:v30];
        }
        else
        {
          v29 = CMContinuityCaptureLog(2);
          if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_29;
          }
          v30 = [v48 output];
          v31 = [v48 inputPorts];
          *(_DWORD *)buf = 138413058;
          v60 = self;
          __int16 v61 = 2112;
          *(void *)v62 = v30;
          *(_WORD *)&v62[8] = 2112;
          *(void *)&v62[10] = v31;
          __int16 v63 = 2080;
          v64 = "-[CMContinuityCaptureAVCaptureVideoSession addConnections:]";
          _os_log_impl(&dword_235FC2000, v29, OS_LOG_TYPE_DEFAULT, "%@ can't add output %@ for input %@ %s", buf, 0x2Au);
        }
LABEL_29:

        v32 = [(CMContinuityCaptureAVCaptureBaseSession *)self captureSession];
        v33 = [v32 connections];
        if ([v33 containsObject:v48])
        {

          uint64_t v34 = v49;
        }
        else
        {
          v35 = [(CMContinuityCaptureAVCaptureBaseSession *)self captureSession];
          int v36 = [v35 canAddConnection:v48];

          uint64_t v34 = v49;
          if (v36)
          {
            v37 = [(CMContinuityCaptureAVCaptureBaseSession *)self captureSession];
            [v37 addConnection:v48];

            [(NSMutableArray *)self->_connections addObject:v48];
            goto LABEL_36;
          }
        }
        v38 = CMContinuityCaptureLog(2);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          v39 = [(CMContinuityCaptureAVCaptureBaseSession *)self captureSession];
          v40 = [v39 connections];
          int v41 = [v40 containsObject:v48];
          *(_DWORD *)buf = 138412802;
          v60 = self;
          __int16 v61 = 2112;
          *(void *)v62 = v48;
          *(_WORD *)&v62[8] = 1024;
          *(_DWORD *)&v62[10] = v41;
          _os_log_impl(&dword_235FC2000, v38, OS_LOG_TYPE_DEFAULT, "%@ can't add connection New %@ %d", buf, 0x1Cu);
        }
LABEL_36:
      }
      uint64_t v47 = [obj countByEnumeratingWithState:&v55 objects:v66 count:16];
      if (!v47)
      {
LABEL_38:

        v42 = CMContinuityCaptureLog(2);
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          connections = self->_connections;
          *(_DWORD *)buf = 138412290;
          v60 = (CMContinuityCaptureAVCaptureVideoSession *)connections;
          _os_log_impl(&dword_235FC2000, v42, OS_LOG_TYPE_DEFAULT, "addConnections done. Current connections: %@", buf, 0xCu);
        }
        id v4 = v44;
        goto LABEL_43;
      }
    }
  }
  v42 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v60 = self;
    __int16 v61 = 1024;
    *(_DWORD *)v62 = [(CMContinuityCaptureAVCaptureBaseSession *)self state];
    *(_WORD *)&v62[4] = 2080;
    *(void *)&v62[6] = "-[CMContinuityCaptureAVCaptureVideoSession addConnections:]";
    _os_log_impl(&dword_235FC2000, v42, OS_LOG_TYPE_DEFAULT, "%@ Invalid state %d for %s", buf, 0x1Cu);
  }
LABEL_43:
}

- (void)removeConnections:(id)a3
{
  uint64_t v175 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(CMContinuityCaptureAVCaptureBaseSession *)self queue];
  dispatch_assert_queue_V2(v5);

  if ([(CMContinuityCaptureAVCaptureBaseSession *)self state] == 1)
  {
    long long v160 = 0u;
    long long v161 = 0u;
    long long v158 = 0u;
    long long v159 = 0u;
    id v105 = v4;
    obuint64_t j = v4;
    v114 = self;
    uint64_t v113 = [obj countByEnumeratingWithState:&v158 objects:v172 count:16];
    if (v113)
    {
      uint64_t v111 = *(void *)v159;
      uint64_t v6 = *MEMORY[0x263EF9680];
      do
      {
        v7 = 0;
        do
        {
          if (*(void *)v159 != v111) {
            objc_enumerationMutation(obj);
          }
          v115 = v7;
          uint64_t v8 = *(void **)(*((void *)&v158 + 1) + 8 * (void)v7);
          uint64_t v9 = [(CMContinuityCaptureAVCaptureBaseSession *)self captureSession];
          uint64_t v10 = [v9 connections];
          int v11 = [v10 containsObject:v8];

          if (v11)
          {
            v12 = CMContinuityCaptureLog(2);
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)v174 = v8;
              _os_log_impl(&dword_235FC2000, v12, OS_LOG_TYPE_DEFAULT, "Removing connection: %@", buf, 0xCu);
            }

            v13 = [(CMContinuityCaptureAVCaptureBaseSession *)v114 captureSession];
            [v13 removeConnection:v8];

            [(NSMutableArray *)v114->_connections removeObject:v8];
          }
          v14 = [v8 inputPorts];
          long long v154 = 0u;
          long long v155 = 0u;
          long long v156 = 0u;
          long long v157 = 0u;
          uint64_t v15 = [v14 countByEnumeratingWithState:&v154 objects:v171 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v155;
            do
            {
              for (uint64_t i = 0; i != v16; ++i)
              {
                if (*(void *)v155 != v17) {
                  objc_enumerationMutation(v14);
                }
                __int16 v19 = [*(id *)(*((void *)&v154 + 1) + 8 * i) input];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  char v20 = [v19 device];
                  uint64_t v21 = [v20 deviceType];
                  int v22 = [v21 isEqualToString:v6];

                  int v23 = &unk_26E96A6D8;
                  if (!v22) {
                    goto LABEL_20;
                  }
                }
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v24 = [v19 device];
                  v25 = [v24 deviceType];
                  int v26 = [v25 isEqualToString:v6];

                  int v23 = &unk_26E96A6F0;
                  if (v26) {
LABEL_20:
                  }
                    [(NSMutableArray *)v114->_connectionEntities removeObject:v23];
                }
              }
              uint64_t v16 = [v14 countByEnumeratingWithState:&v154 objects:v171 count:16];
            }
            while (v16);
          }

          self = v114;
          v7 = v115 + 1;
        }
        while (v115 + 1 != (char *)v113);
        uint64_t v113 = [obj countByEnumeratingWithState:&v158 objects:v172 count:16];
      }
      while (v113);
    }

    long long v152 = 0u;
    long long v153 = 0u;
    long long v150 = 0u;
    long long v151 = 0u;
    id v107 = obj;
    id obja = (id)[v107 countByEnumeratingWithState:&v150 objects:v170 count:16];
    if (obja)
    {
      uint64_t v108 = *(void *)v151;
      do
      {
        uint64_t v27 = 0;
        do
        {
          if (*(void *)v151 != v108) {
            objc_enumerationMutation(v107);
          }
          uint64_t v112 = v27;
          int v28 = *(void **)(*((void *)&v150 + 1) + 8 * v27);
          long long v146 = 0u;
          long long v147 = 0u;
          long long v148 = 0u;
          long long v149 = 0u;
          v29 = [(CMContinuityCaptureAVCaptureBaseSession *)self captureSession];
          v30 = [v29 connections];

          uint64_t v31 = [v30 countByEnumeratingWithState:&v146 objects:v169 count:16];
          if (v31)
          {
            uint64_t v32 = v31;
            uint64_t v33 = *(void *)v147;
            while (2)
            {
              for (uint64_t j = 0; j != v32; ++j)
              {
                if (*(void *)v147 != v33) {
                  objc_enumerationMutation(v30);
                }
                v35 = [*(id *)(*((void *)&v146 + 1) + 8 * j) output];
                int v36 = [v28 output];
                char v37 = [v35 isEqual:v36];

                if (v37)
                {
                  p_isa = (id *)&v114->super.super.isa;
                  goto LABEL_42;
                }
              }
              uint64_t v32 = [v30 countByEnumeratingWithState:&v146 objects:v169 count:16];
              if (v32) {
                continue;
              }
              break;
            }
          }

          v38 = CMContinuityCaptureLog(2);
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            v39 = [v28 output];
            *(_DWORD *)buf = 138412290;
            *(void *)v174 = v39;
            _os_log_impl(&dword_235FC2000, v38, OS_LOG_TYPE_DEFAULT, "Removing output: %@", buf, 0xCu);
          }
          p_isa = (id *)&v114->super.super.isa;
          v30 = [(CMContinuityCaptureAVCaptureBaseSession *)v114 captureSession];
          int v41 = [v28 output];
          [v30 removeOutput:v41];

LABEL_42:
          v42 = [p_isa captureSession];
          v43 = [v42 connections];
          id v44 = [p_isa[6] connection];
          int v45 = [v43 containsObject:v44];

          if (v45)
          {
            uint64_t v46 = [MEMORY[0x263EFF980] array];
            long long v142 = 0u;
            long long v143 = 0u;
            long long v144 = 0u;
            long long v145 = 0u;
            uint64_t v47 = [(AVCaptureVideoPreviewLayer *)v114->_videoPreviewLayer connection];
            v48 = [v47 inputPorts];

            uint64_t v49 = [v48 countByEnumeratingWithState:&v142 objects:v168 count:16];
            if (v49)
            {
              uint64_t v50 = v49;
              uint64_t v51 = *(void *)v143;
              do
              {
                for (uint64_t k = 0; k != v50; ++k)
                {
                  if (*(void *)v143 != v51) {
                    objc_enumerationMutation(v48);
                  }
                  long long v53 = [*(id *)(*((void *)&v142 + 1) + 8 * k) input];
                  [v46 addObject:v53];
                }
                uint64_t v50 = [v48 countByEnumeratingWithState:&v142 objects:v168 count:16];
              }
              while (v50);
            }

            long long v140 = 0u;
            long long v141 = 0u;
            long long v138 = 0u;
            long long v139 = 0u;
            long long v54 = [(CMContinuityCaptureAVCaptureBaseSession *)v114 captureSession];
            videoCameraInput = [v54 connections];

            uint64_t v56 = [videoCameraInput countByEnumeratingWithState:&v138 objects:v167 count:16];
            if (v56)
            {
              uint64_t v57 = v56;
              uint64_t v58 = *(void *)v139;
              uint64_t v106 = *(void *)v139;
              do
              {
                uint64_t v59 = 0;
                id v116 = (id)v57;
                do
                {
                  if (*(void *)v139 != v58) {
                    objc_enumerationMutation(videoCameraInput);
                  }
                  v60 = *(void **)(*((void *)&v138 + 1) + 8 * v59);
                  __int16 v61 = [(AVCaptureVideoPreviewLayer *)v114->_videoPreviewLayer connection];
                  char v62 = [v60 isEqual:v61];

                  if ((v62 & 1) == 0)
                  {
                    long long v136 = 0u;
                    long long v137 = 0u;
                    long long v134 = 0u;
                    long long v135 = 0u;
                    __int16 v63 = [v60 inputPorts];
                    uint64_t v64 = [v63 countByEnumeratingWithState:&v134 objects:v166 count:16];
                    if (v64)
                    {
                      uint64_t v65 = v64;
                      uint64_t v66 = *(void *)v135;
                      while (2)
                      {
                        for (uint64_t m = 0; m != v65; ++m)
                        {
                          if (*(void *)v135 != v66) {
                            objc_enumerationMutation(v63);
                          }
                          v68 = [*(id *)(*((void *)&v134 + 1) + 8 * m) input];
                          int v69 = [v46 containsObject:v68];

                          if (v69)
                          {

                            goto LABEL_71;
                          }
                        }
                        uint64_t v65 = [v63 countByEnumeratingWithState:&v134 objects:v166 count:16];
                        if (v65) {
                          continue;
                        }
                        break;
                      }
                    }

                    uint64_t v58 = v106;
                    uint64_t v57 = (uint64_t)v116;
                  }
                  ++v59;
                }
                while (v59 != v57);
                uint64_t v57 = [videoCameraInput countByEnumeratingWithState:&v138 objects:v167 count:16];
              }
              while (v57);
            }

            v70 = CMContinuityCaptureLog(2);
            if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
            {
              v71 = [(AVCaptureVideoPreviewLayer *)v114->_videoPreviewLayer connection];
              *(_DWORD *)buf = 138412290;
              *(void *)v174 = v71;
              _os_log_impl(&dword_235FC2000, v70, OS_LOG_TYPE_DEFAULT, "Removing preivew layer connection: %@", buf, 0xCu);
            }
            v72 = [(CMContinuityCaptureAVCaptureBaseSession *)v114 captureSession];
            v73 = [(AVCaptureVideoPreviewLayer *)v114->_videoPreviewLayer connection];
            [v72 removeConnection:v73];

            videoCameraInput = v114->_videoCameraInput;
            v114->_videoCameraInput = 0;
LABEL_71:
          }
          v74 = [MEMORY[0x263EFF980] array];
          long long v130 = 0u;
          long long v131 = 0u;
          long long v132 = 0u;
          long long v133 = 0u;
          v75 = [v28 inputPorts];
          uint64_t v76 = [v75 countByEnumeratingWithState:&v130 objects:v165 count:16];
          if (v76)
          {
            uint64_t v77 = v76;
            uint64_t v78 = *(void *)v131;
            do
            {
              for (uint64_t n = 0; n != v77; ++n)
              {
                if (*(void *)v131 != v78) {
                  objc_enumerationMutation(v75);
                }
                v80 = [*(id *)(*((void *)&v130 + 1) + 8 * n) input];
                [v74 addObject:v80];
              }
              uint64_t v77 = [v75 countByEnumeratingWithState:&v130 objects:v165 count:16];
            }
            while (v77);
          }

          v81 = [MEMORY[0x263EFF980] array];
          long long v126 = 0u;
          long long v127 = 0u;
          long long v128 = 0u;
          long long v129 = 0u;
          v82 = [(CMContinuityCaptureAVCaptureBaseSession *)v114 captureSession];
          v83 = [v82 connections];

          id v117 = v83;
          uint64_t v84 = [v83 countByEnumeratingWithState:&v126 objects:v164 count:16];
          if (v84)
          {
            uint64_t v85 = v84;
            uint64_t v86 = *(void *)v127;
            do
            {
              for (iuint64_t i = 0; ii != v85; ++ii)
              {
                if (*(void *)v127 != v86) {
                  objc_enumerationMutation(v117);
                }
                v88 = *(void **)(*((void *)&v126 + 1) + 8 * ii);
                long long v122 = 0u;
                long long v123 = 0u;
                long long v124 = 0u;
                long long v125 = 0u;
                v89 = [v88 inputPorts];
                uint64_t v90 = [v89 countByEnumeratingWithState:&v122 objects:v163 count:16];
                if (v90)
                {
                  uint64_t v91 = v90;
                  uint64_t v92 = *(void *)v123;
                  do
                  {
                    for (juint64_t j = 0; jj != v91; ++jj)
                    {
                      if (*(void *)v123 != v92) {
                        objc_enumerationMutation(v89);
                      }
                      v94 = [*(id *)(*((void *)&v122 + 1) + 8 * jj) input];
                      [v81 addObject:v94];
                    }
                    uint64_t v91 = [v89 countByEnumeratingWithState:&v122 objects:v163 count:16];
                  }
                  while (v91);
                }
              }
              uint64_t v85 = [v117 countByEnumeratingWithState:&v126 objects:v164 count:16];
            }
            while (v85);
          }

          long long v120 = 0u;
          long long v121 = 0u;
          long long v118 = 0u;
          long long v119 = 0u;
          id v95 = v74;
          uint64_t v96 = [v95 countByEnumeratingWithState:&v118 objects:v162 count:16];
          self = v114;
          if (v96)
          {
            uint64_t v97 = v96;
            uint64_t v98 = *(void *)v119;
            do
            {
              for (kuint64_t k = 0; kk != v97; ++kk)
              {
                if (*(void *)v119 != v98) {
                  objc_enumerationMutation(v95);
                }
                uint64_t v100 = *(void *)(*((void *)&v118 + 1) + 8 * kk);
                if (([v81 containsObject:v100] & 1) == 0)
                {
                  v101 = CMContinuityCaptureLog(2);
                  if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    *(void *)v174 = v100;
                    _os_log_impl(&dword_235FC2000, v101, OS_LOG_TYPE_DEFAULT, "Removing input: %@", buf, 0xCu);
                  }

                  v102 = [(CMContinuityCaptureAVCaptureBaseSession *)v114 captureSession];
                  [v102 removeInput:v100];
                }
              }
              uint64_t v97 = [v95 countByEnumeratingWithState:&v118 objects:v162 count:16];
            }
            while (v97);
          }

          uint64_t v27 = v112 + 1;
        }
        while ((id)(v112 + 1) != obja);
        id obja = (id)[v107 countByEnumeratingWithState:&v150 objects:v170 count:16];
      }
      while (obja);
    }

    v103 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
    {
      connections = self->_connections;
      *(_DWORD *)buf = 138412290;
      *(void *)v174 = connections;
      _os_log_impl(&dword_235FC2000, v103, OS_LOG_TYPE_DEFAULT, "State After removal %@", buf, 0xCu);
    }
    id v4 = v105;
  }
  else
  {
    v103 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v174 = [(CMContinuityCaptureAVCaptureBaseSession *)self state];
      *(_WORD *)&v174[4] = 2080;
      *(void *)&v174[6] = "-[CMContinuityCaptureAVCaptureVideoSession removeConnections:]";
      _os_log_impl(&dword_235FC2000, v103, OS_LOG_TYPE_DEFAULT, "Invalid state %d for %s", buf, 0x12u);
    }
  }
}

- (BOOL)hasConnectionsForEntity:(int64_t)a3
{
  connectionEntities = self->_connectionEntities;
  id v4 = [NSNumber numberWithInteger:a3];
  LOBYTE(connectionEntities) = [(NSMutableArray *)connectionEntities containsObject:v4];

  return (char)connectionEntities;
}

- (void)start
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  locatiouint64_t n = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  objc_super v3 = [(CMContinuityCaptureAVCaptureBaseSession *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = [(CMContinuityCaptureAVCaptureBaseSession *)self state];
    *(_DWORD *)buf = 138412546;
    __int16 v19 = self;
    __int16 v20 = 1024;
    int v21 = v5;
    _os_log_impl(&dword_235FC2000, v4, OS_LOG_TYPE_DEFAULT, "%@  start in state %d", buf, 0x12u);
  }

  if ([(CMContinuityCaptureAVCaptureBaseSession *)self state])
  {
    uint64_t v6 = CMContinuityCaptureLog(2);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
LABEL_7:

      goto LABEL_12;
    }
    int v7 = [(CMContinuityCaptureAVCaptureBaseSession *)self state];
    *(_DWORD *)buf = 138412802;
    __int16 v19 = self;
    __int16 v20 = 1024;
    int v21 = v7;
    __int16 v22 = 2080;
    int v23 = "-[CMContinuityCaptureAVCaptureVideoSession start]";
    uint64_t v8 = "%@ Invalid state %d for %s";
    uint64_t v9 = v6;
    uint32_t v10 = 28;
LABEL_6:
    _os_log_impl(&dword_235FC2000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
    goto LABEL_7;
  }
  int v11 = [(CMContinuityCaptureAVCaptureBaseSession *)self captureSession];
  v12 = [v11 connections];
  BOOL v13 = [v12 count] == 0;

  if (v13)
  {
    uint64_t v6 = CMContinuityCaptureLog(2);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    uint64_t v8 = "There are no active connections for start session";
    uint64_t v9 = v6;
    uint32_t v10 = 2;
    goto LABEL_6;
  }
  if (self->_videoPreviewLayer)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __49__CMContinuityCaptureAVCaptureVideoSession_start__block_invoke;
    block[3] = &unk_264C990F8;
    objc_copyWeak(&v16, &location);
    dispatch_async(MEMORY[0x263EF83A0], block);
    objc_destroyWeak(&v16);
  }
  v14.receiver = self;
  v14.super_class = (Class)CMContinuityCaptureAVCaptureVideoSession;
  [(CMContinuityCaptureAVCaptureBaseSession *)&v14 start];
LABEL_12:
  objc_destroyWeak(&location);
}

void __49__CMContinuityCaptureAVCaptureVideoSession_start__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_super v3 = WeakRetained;
    v2 = [WeakRetained[6] connection];
    [v2 setVideoOrientation:3];

    WeakRetained = v3;
  }
}

- (void)stop
{
  *(void *)&v12[5] = *MEMORY[0x263EF8340];
  objc_super v3 = [(CMContinuityCaptureAVCaptureBaseSession *)self queue];
  dispatch_assert_queue_V2(v3);

  if ([(CMContinuityCaptureAVCaptureBaseSession *)self state] == 2)
  {
    id v4 = [(CMContinuityCaptureAVCaptureBaseSession *)self captureSession];
    int v5 = [v4 connections];
    uint64_t v6 = [v5 count];

    if (!v6)
    {
      v10.receiver = self;
      v10.super_class = (Class)CMContinuityCaptureAVCaptureVideoSession;
      [(CMContinuityCaptureAVCaptureBaseSession *)&v10 stop];
      [(AVCaptureVideoPreviewLayer *)self->_videoPreviewLayer setSession:0];
      return;
    }
    int v7 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [(CMContinuityCaptureAVCaptureBaseSession *)self captureSession];
      uint64_t v9 = [v8 connections];
      *(_DWORD *)buf = 134217984;
      *(void *)v12 = [v9 count];
      _os_log_impl(&dword_235FC2000, v7, OS_LOG_TYPE_DEFAULT, "There are still %lu connections remaining. Not stopping the session.", buf, 0xCu);
    }
  }
  else
  {
    int v7 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      v12[0] = [(CMContinuityCaptureAVCaptureBaseSession *)self state];
      LOWORD(v12[1]) = 2080;
      *(void *)((char *)&v12[1] + 2) = "-[CMContinuityCaptureAVCaptureVideoSession stop]";
      _os_log_impl(&dword_235FC2000, v7, OS_LOG_TYPE_DEFAULT, "Invalid state %d for %s", buf, 0x12u);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionEntities, 0);
  objc_storeStrong((id *)&self->_videoCameraInput, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_videoPreviewLayer, 0);
}

@end