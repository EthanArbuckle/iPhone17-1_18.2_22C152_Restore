@interface NWURLSessionMultipartParser
- (void)task:(void *)a3 handleMultipartData:(int)a4 complete:(void *)a5 error:(void *)a6 completionHandler:;
@end

@implementation NWURLSessionMultipartParser

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_headers, 0);
  objc_storeStrong((id *)&self->_boundarySuffixRecognizer, 0);
  objc_storeStrong((id *)&self->_headerRecognizer, 0);
  objc_storeStrong((id *)&self->_boundaryRecognizer, 0);
  objc_storeStrong((id *)&self->_parts, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_responseConsumer, 0);

  objc_storeStrong((id *)&self->_boundary, 0);
}

- (void)task:(void *)a3 handleMultipartData:(int)a4 complete:(void *)a5 error:(void *)a6 completionHandler:
{
  id v11 = a2;
  v12 = a3;
  id v13 = a5;
  id v14 = a6;
  if (!a1) {
    goto LABEL_34;
  }
  v15 = *(NSObject **)(a1 + 40);
  if (v15)
  {
    size_t size = dispatch_data_get_size(*(dispatch_data_t *)(a1 + 40));
    BOOL v16 = v12 != 0;
    if (!v12) {
      goto LABEL_10;
    }
    v17 = v15;
    dispatch_data_t concat = dispatch_data_create_concat(v17, v12);
    v19 = *(void **)(a1 + 40);
    *(void *)(a1 + 40) = concat;
  }
  else
  {
    size_t size = 0;
    size_t v47 = 0;
    BOOL v16 = v12 != 0;
    if (!v12) {
      goto LABEL_12;
    }
    v20 = v12;
    v17 = *(NSObject **)(a1 + 40);
    *(void *)(a1 + 40) = v20;
  }

  v15 = *(NSObject **)(a1 + 40);
  if (v15)
  {
LABEL_10:
    size_t v47 = dispatch_data_get_size(v15);
    goto LABEL_12;
  }
  size_t v47 = 0;
LABEL_12:
  id v48 = v14;
  uint64_t v81 = 0;
  v82 = &v81;
  uint64_t v83 = 0x2020000000;
  uint64_t v84 = 0;
  dispatch_group_t v21 = dispatch_group_create();
  v79[0] = 0;
  v79[1] = v79;
  v79[2] = 0x3032000000;
  v79[3] = __Block_byref_object_copy__48519;
  v79[4] = __Block_byref_object_dispose__48520;
  id v45 = v13;
  id v80 = v13;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__NWURLSessionMultipartParser_task_handleMultipartData_complete_error_completionHandler___block_invoke;
  aBlock[3] = &unk_1E5242A20;
  v22 = v21;
  v75 = v22;
  uint64_t v76 = a1;
  id v46 = v11;
  id v23 = v11;
  id v77 = v23;
  v78 = v79;
  v24 = _Block_copy(aBlock);
  uint64_t v68 = 0;
  v69 = (id *)&v68;
  uint64_t v70 = 0x3042000000;
  v71 = __Block_byref_object_copy__66;
  v72 = __Block_byref_object_dispose__67;
  id v73 = 0;
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __89__NWURLSessionMultipartParser_task_handleMultipartData_complete_error_completionHandler___block_invoke_68;
  v61[3] = &unk_1E5242A98;
  v65 = &v68;
  v66 = v79;
  v61[4] = a1;
  char v67 = a4;
  v25 = v22;
  v62 = v25;
  id v63 = v23;
  id v26 = v24;
  id v64 = v26;
  v27 = (void (**)(void))_Block_copy(v61);
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __89__NWURLSessionMultipartParser_task_handleMultipartData_complete_error_completionHandler___block_invoke_76;
  v57[3] = &unk_1E5242AE8;
  v57[4] = a1;
  v60 = v79;
  id v28 = v26;
  id v59 = v28;
  v29 = v12;
  v58 = v29;
  v30 = _Block_copy(v57);
  v31 = (void (**)(void, void, void))v30;
  if (v16)
  {
    applier[0] = MEMORY[0x1E4F143A8];
    applier[1] = 3221225472;
    applier[2] = __89__NWURLSessionMultipartParser_task_handleMultipartData_complete_error_completionHandler___block_invoke_80;
    applier[3] = &unk_1E5242B10;
    size_t v56 = size;
    applier[4] = a1;
    v54 = &v81;
    id v53 = v30;
    v55 = v79;
    dispatch_data_apply(v29, applier);
  }
  if (!a4) {
    goto LABEL_31;
  }
  int v32 = *(_DWORD *)(a1 + 12);
  if ((v32 - 2) < 3) {
    goto LABEL_30;
  }
  if (!v32)
  {
    dispatch_data_t subrange = dispatch_data_create_subrange(*(dispatch_data_t *)(a1 + 40), v82[3], v47 - v82[3]);
    if (!*(unsigned char *)(a1 + 8)) {
      ((void (**)(void, dispatch_data_t, void))v31)[2](v31, subrange, 0);
    }
    v82[3] = v47;
    *(_DWORD *)(a1 + 12) = 3;

    goto LABEL_31;
  }
  if (v32 == 1)
  {
    uint64_t v33 = *(void *)(a1 + 72);
    if (v33) {
      uint64_t v33 = *(void *)(v33 + 32);
    }
    dispatch_data_t v34 = dispatch_data_create_subrange(*(dispatch_data_t *)(a1 + 40), v82[3], v47 - (*(void *)(a1 + 96) + v33) - v82[3]);
    if (*(unsigned char *)(a1 + 8))
    {
      v82[3] = v47;
    }
    else
    {
      ((void (**)(void, dispatch_data_t, void))v31)[2](v31, v34, 0);
      int v36 = *(unsigned __int8 *)(a1 + 8);
      v82[3] = v47;
      if (!v36)
      {
LABEL_27:
        uint64_t v37 = *(void *)(a1 + 56);
        if (v37)
        {
          *(void *)(v37 + 40) = 0;
          *(void *)(v37 + 48) = 0;
        }
        *(_DWORD *)(a1 + 12) = 3;

LABEL_30:
        v31[2](v31, MEMORY[0x1E4F14410], 0);
        *(_DWORD *)(a1 + 12) = 3;
        goto LABEL_31;
      }
    }
    *(unsigned char *)(a1 + 8) = 0;
    goto LABEL_27;
  }
LABEL_31:
  v38 = *(void **)(a1 + 40);
  if (v38)
  {
    size_t v39 = v82[3];
    v40 = v38;
    dispatch_data_t v41 = dispatch_data_create_subrange(v40, v39, v47 - v39);
    v42 = *(void **)(a1 + 40);
    *(void *)(a1 + 40) = v41;

    id v14 = v48;
  }
  objc_storeWeak(v69 + 5, v27);
  v27[2](v27);
  v43 = *(NSObject **)(a1 + 88);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__NWURLSessionMultipartParser_task_handleMultipartData_complete_error_completionHandler___block_invoke_2_88;
  block[3] = &unk_1E5242B38;
  v51 = v79;
  id v50 = v14;
  dispatch_group_notify(v25, v43, block);

  _Block_object_dispose(&v68, 8);
  objc_destroyWeak(&v73);

  _Block_object_dispose(v79, 8);
  _Block_object_dispose(&v81, 8);
  id v13 = v45;
  id v11 = v46;
LABEL_34:
}

void __89__NWURLSessionMultipartParser_task_handleMultipartData_complete_error_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v7 = a2;
  id v8 = a4;
  if (!gLogDatapath)
  {
    if (v7) {
      goto LABEL_3;
    }
LABEL_5:
    v7 = 0;
    if (!v8 && !a3) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  v12 = __nwlog_obj();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446978;
    v17 = "-[NWURLSessionMultipartParser task:handleMultipartData:complete:error:completionHandler:]_block_invoke";
    __int16 v18 = 2112;
    v19 = v7;
    __int16 v20 = 1024;
    int v21 = a3;
    __int16 v22 = 2112;
    id v23 = v8;
    _os_log_impl(&dword_1830D4000, v12, OS_LOG_TYPE_DEBUG, "%{public}s Delivering data %@, complete %{BOOL}d, error %@", buf, 0x26u);
  }

  if (!v7) {
    goto LABEL_5;
  }
LABEL_3:
  if (!dispatch_data_get_size(v7))
  {

    goto LABEL_5;
  }
LABEL_7:
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    v10 = *(void **)(v9 + 32);
  }
  else {
    v10 = 0;
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __89__NWURLSessionMultipartParser_task_handleMultipartData_complete_error_completionHandler___block_invoke_63;
  v13[3] = &unk_1E52429F8;
  uint64_t v11 = *(void *)(a1 + 48);
  uint64_t v15 = *(void *)(a1 + 56);
  id v14 = *(id *)(a1 + 32);
  [v10 task:v11 deliverData:v7 complete:a3 error:v8 completionHandler:v13];

LABEL_10:
}

void __89__NWURLSessionMultipartParser_task_handleMultipartData_complete_error_completionHandler___block_invoke_68(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40));
  if (!WeakRetained)
  {
    _os_crash();
    __break(1u);
  }
  v3 = WeakRetained;
  v4 = *(void **)(a1 + 32);
  if (v4) {
    v4 = (void *)v4[6];
  }
  v5 = v4;
  v6 = [v5 firstObject];

  if (v6)
  {
    if (gLogDatapath)
    {
      uint64_t v15 = __nwlog_obj();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf.receiver) = 136446210;
        *(id *)((char *)&buf.receiver + 4) = "-[NWURLSessionMultipartParser task:handleMultipartData:complete:error:compl"
                                             "etionHandler:]_block_invoke_2";
        _os_log_impl(&dword_1830D4000, v15, OS_LOG_TYPE_DEBUG, "%{public}s Delivering multipart response, waiting for disposition", (uint8_t *)&buf, 0xCu);
      }
    }
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7) {
      id v8 = *(void **)(v7 + 32);
    }
    else {
      id v8 = 0;
    }
    uint64_t v9 = *(void *)(a1 + 48);
    uint64_t v10 = v6[1];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __89__NWURLSessionMultipartParser_task_handleMultipartData_complete_error_completionHandler___block_invoke_72;
    v26[3] = &unk_1E5242A70;
    v26[4] = v7;
    uint64_t v11 = v6;
    uint64_t v12 = *(void *)(a1 + 72);
    id v27 = v11;
    uint64_t v31 = v12;
    id v29 = *(id *)(a1 + 56);
    id v28 = *(id *)(a1 + 40);
    id v30 = v3;
    id v13 = v8;
    [v13 task:v9 deliverResponse:v10 completionHandler:v26];

    id v14 = v27;
LABEL_9:

    goto LABEL_12;
  }
  if (!gLogDatapath)
  {
    if (!*(unsigned char *)(a1 + 80)) {
      goto LABEL_12;
    }
    goto LABEL_19;
  }
  BOOL v16 = __nwlog_obj();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf.receiver) = 136446210;
    *(id *)((char *)&buf.receiver + 4) = "-[NWURLSessionMultipartParser task:handleMultipartData:complete:error:completio"
                                         "nHandler:]_block_invoke";
    _os_log_impl(&dword_1830D4000, v16, OS_LOG_TYPE_DEBUG, "%{public}s Delivered all parts, returning", (uint8_t *)&buf, 0xCu);
  }

  if (*(unsigned char *)(a1 + 80))
  {
LABEL_19:
    uint64_t v17 = *(void *)(a1 + 32);
    if ((!v17 || *(_DWORD *)(v17 + 12) != 3) && !*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
    {
      __int16 v22 = [NWURLError alloc];
      if (v22)
      {
        uint64_t v23 = *MEMORY[0x1E4F289A0];
        buf.receiver = v22;
        buf.super_class = (Class)NWURLError;
        __int16 v22 = (NWURLError *)objc_msgSendSuper2(&buf, sel_initWithDomain_code_userInfo_, v23, -1017, 0);
      }
      uint64_t v24 = *(void *)(*(void *)(a1 + 72) + 8);
      v25 = *(void **)(v24 + 40);
      *(void *)(v24 + 40) = v22;
    }
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
    uint64_t v18 = *(void *)(a1 + 32);
    if (v18) {
      v19 = *(void **)(v18 + 32);
    }
    else {
      v19 = 0;
    }
    uint64_t v20 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __89__NWURLSessionMultipartParser_task_handleMultipartData_complete_error_completionHandler___block_invoke_71;
    v32[3] = &unk_1E5242A48;
    uint64_t v21 = *(void *)(a1 + 48);
    id v33 = *(id *)(a1 + 40);
    [v19 task:v21 deliverData:0 complete:1 error:v20 completionHandler:v32];
    id v14 = v33;
    goto LABEL_9;
  }
LABEL_12:
}

void __89__NWURLSessionMultipartParser_task_handleMultipartData_complete_error_completionHandler___block_invoke_76(void *a1, void *a2, BOOL a3)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  v5 = a2;
  v6 = v5;
  if (!a3) {
    goto LABEL_5;
  }
  uint64_t v7 = a1[4];
  if (!v7) {
    goto LABEL_5;
  }
  if (!*(unsigned char *)(v7 + 9))
  {
    *(unsigned char *)(v7 + 9) = 1;
LABEL_5:
    size_t size = dispatch_data_get_size(v5);
    uint64_t v35 = 0;
    int v36 = &v35;
    uint64_t v37 = 0x2020000000;
    char v38 = 0;
    uint64_t v31 = 0;
    int v32 = &v31;
    uint64_t v33 = 0x2020000000;
    char v34 = 0;
    applier[0] = MEMORY[0x1E4F143A8];
    applier[1] = 3221225472;
    applier[2] = __89__NWURLSessionMultipartParser_task_handleMultipartData_complete_error_completionHandler___block_invoke_2;
    applier[3] = &unk_1E5242AC0;
    void applier[5] = &v31;
    applier[6] = size;
    applier[4] = &v35;
    dispatch_data_apply(v6, applier);
    int v9 = *((unsigned __int8 *)v36 + 24);
    if (v9 == 13) {
      goto LABEL_9;
    }
    if (v9 != 10) {
      goto LABEL_11;
    }
    if (*((unsigned char *)v32 + 24) != 13) {
LABEL_9:
    }
      uint64_t v10 = -1;
    else {
      uint64_t v10 = -2;
    }
    dispatch_data_t subrange = dispatch_data_create_subrange(v6, 0, v10 + size);

    v6 = subrange;
LABEL_11:
    uint64_t v12 = a1[4];
    if (!v12) {
      goto LABEL_15;
    }
    int v13 = *(_DWORD *)(v12 + 16);
    if (v13 == 1)
    {
      (*(void (**)(void))(a1[6] + 16))();
    }
    else
    {
      if (!v13)
      {
        uint64_t v12 = *(void *)(v12 + 48);
LABEL_15:
        id v14 = (id)v12;
        uint64_t v15 = [v14 lastObject];

        if (v15)
        {
          BOOL v16 = [NWURLSessionMultipartContent alloc];
          uint64_t v17 = v6;
          if (v16)
          {
            *(void *)size_t v39 = v16;
            *(void *)&v39[8] = NWURLSessionMultipartContent;
            uint64_t v18 = (NWURLSessionMultipartContent *)objc_msgSendSuper2((objc_super *)v39, sel_init);
            BOOL v16 = v18;
            if (v18)
            {
              objc_storeStrong((id *)&v18->_data, v6);
              v16->_BOOL complete = a3;
              objc_storeStrong((id *)&v16->_error, 0);
            }
          }

          v19 = v15[2].isa;
          [(objc_class *)v19 addObject:v16];

          if (gLogDatapath)
          {
            id v26 = __nwlog_obj();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            {
              if (v16)
              {
                id v27 = v16->_data;
                BOOL complete = v16->_complete;
                error = v16->_error;
              }
              else
              {
                BOOL complete = 0;
                id v27 = 0;
                error = 0;
              }
              *(_DWORD *)size_t v39 = 136446978;
              *(void *)&v39[4] = "-[NWURLSessionMultipartParser task:handleMultipartData:complete:error:completionHandl"
                                   "er:]_block_invoke";
              *(_WORD *)&v39[12] = 2112;
              *(void *)&v39[14] = v27;
              __int16 v40 = 1024;
              BOOL v41 = complete;
              __int16 v42 = 2112;
              v43 = error;
              _os_log_impl(&dword_1830D4000, v26, OS_LOG_TYPE_DEBUG, "%{public}s Created NWURLSessionMultipartContent, body %@, complete %{BOOL}d, error %@", v39, 0x26u);
            }
          }
        }
        else
        {
          if (!*(void *)(*(void *)(a1[7] + 8) + 40))
          {
            uint64_t v21 = [NWURLError alloc];
            if (v21)
            {
              uint64_t v22 = *MEMORY[0x1E4F289A0];
              *(void *)size_t v39 = v21;
              *(void *)&v39[8] = NWURLError;
              uint64_t v21 = (NWURLError *)objc_msgSendSuper2((objc_super *)v39, sel_initWithDomain_code_userInfo_, v22, -1017, 0);
            }
            uint64_t v23 = *(void *)(a1[7] + 8);
            uint64_t v24 = *(void **)(v23 + 40);
            *(void *)(v23 + 40) = v21;
          }
          uint64_t v25 = a1[4];
          uint64_t v15 = 0;
          if (v25) {
            *(_DWORD *)(v25 + 12) = 3;
          }
        }
LABEL_31:

        goto LABEL_32;
      }
      if (gLogDatapath)
      {
        uint64_t v15 = __nwlog_obj();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v20 = a1[5];
          *(_DWORD *)size_t v39 = 136446722;
          *(void *)&v39[4] = "-[NWURLSessionMultipartParser task:handleMultipartData:complete:error:completionHandler:]_block_invoke";
          *(_WORD *)&v39[12] = 2112;
          *(void *)&v39[14] = v20;
          __int16 v40 = 1024;
          BOOL v41 = a3;
          _os_log_impl(&dword_1830D4000, v15, OS_LOG_TYPE_DEBUG, "%{public}s Discarding content, body %@, complete %{BOOL}d", v39, 0x1Cu);
        }
        goto LABEL_31;
      }
    }
LABEL_32:
    _Block_object_dispose(&v31, 8);
    _Block_object_dispose(&v35, 8);
  }
}

uint64_t __89__NWURLSessionMultipartParser_task_handleMultipartData_complete_error_completionHandler___block_invoke_80(void *a1, void *a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t v159 = *MEMORY[0x1E4F143B8];
  id v146 = a2;
  if (a5)
  {
    uint64_t v9 = 0;
    uint64_t v10 = a3 + 1;
    uint64_t v144 = *MEMORY[0x1E4F289A0];
    unint64_t v145 = a5;
    uint64_t v147 = a4;
    uint64_t v148 = a3 + 1;
    while (1)
    {
      uint64_t v12 = a1[4];
      if (!v12) {
        goto LABEL_3;
      }
      int v13 = *(_DWORD *)(v12 + 12);
      if (v13 == 2)
      {
        uint64_t v43 = *(void *)(v12 + 64);
        if (!v43
          || (char v44 = *(unsigned char *)(a4 + v9),
              *(unsigned char *)(v43 + 8) = *(unsigned char *)(v43 + 9),
              *(unsigned char *)(v43 + 9) = v44,
              (uint64_t v12 = a1[4]) != 0))
        {
          id v45 = (unsigned __int8 *)*(id *)(v12 + 64);
          if (v45)
          {
            int v46 = v45[9];

            if (v46 == 10)
            {
              uint64_t v47 = a1[4];
              if (v47 && (id v48 = *(id *)(v47 + 64)) != 0)
              {
                if (v48[8] == 13) {
                  uint64_t v49 = 2;
                }
                else {
                  uint64_t v49 = 1;
                }
              }
              else
              {
                uint64_t v49 = 0;
              }
              size_t v50 = *(void *)(*(void *)(a1[6] + 8) + 24);
              uint64_t v51 = a1[4];
              unint64_t v52 = a5;
              if (v51) {
                id v53 = *(NSObject **)(v51 + 40);
              }
              else {
                id v53 = 0;
              }
              uint64_t v149 = v10 + v9;
              uint64_t v54 = v10 + v9 + a1[8];
              size_t v55 = v50 + v49;
              dispatch_data_t subrange = dispatch_data_create_subrange(v53, v50, v54 - v55);
              v57 = (void *)[[NSString alloc] initWithData:subrange encoding:5];
              v58 = v57;
              if (v54 == v55)
              {
                uint64_t v59 = a1[4];
                if (v59) {
                  v60 = *(void **)(v59 + 32);
                }
                else {
                  v60 = 0;
                }
                v61 = objc_msgSend(v60, "response", v142, v143);
                v62 = [v61 allHeaderFields];
                id v63 = (void *)[v62 mutableCopy];

                uint64_t v64 = a1[4];
                if (v64) {
                  uint64_t v65 = *(void *)(v64 + 80);
                }
                else {
                  uint64_t v65 = 0;
                }
                [v63 addEntriesFromDictionary:v65];
                id v66 = objc_alloc(MEMORY[0x1E4F18D40]);
                char v67 = [v61 URL];
                uint64_t v68 = objc_msgSend(v66, "initWithURL:statusCode:HTTPVersion:headerFields:", v67, objc_msgSend(v61, "statusCode"), 0, v63);

                uint64_t v69 = a1[4];
                if (v69) {
                  uint64_t v70 = *(void **)(v69 + 80);
                }
                else {
                  uint64_t v70 = 0;
                }
                [v70 removeAllObjects];
                v71 = [NWURLSessionMultipartPart alloc];
                id v72 = v68;
                if (v71)
                {
                  *(void *)v152 = v71;
                  *(void *)&v152[8] = NWURLSessionMultipartPart;
                  id v73 = (NWURLSessionMultipartPart *)objc_msgSendSuper2((objc_super *)v152, sel_init);
                  v71 = v73;
                  if (v73)
                  {
                    objc_storeStrong((id *)&v73->_response, v68);
                    v74 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
                    data = v71->_data;
                    v71->_data = v74;
                  }
                }

                uint64_t v76 = a1[4];
                a4 = v147;
                if (v76) {
                  id v77 = *(void **)(v76 + 48);
                }
                else {
                  id v77 = 0;
                }
                [v77 addObject:v71];
                uint64_t v78 = a1[4];
                if (v78)
                {
                  *(_DWORD *)(v78 + 12) = 0;
                  uint64_t v79 = a1[4];
                  if (v79) {
                    *(_DWORD *)(v79 + 16) = 0;
                  }
                }

                a5 = v145;
              }
              else
              {
                uint64_t v90 = [v57 rangeOfString:@":"];
                if (v90 == 0x7FFFFFFFFFFFFFFFLL)
                {
                  a5 = v52;
                  if (!*(void *)(*(void *)(a1[7] + 8) + 40))
                  {
                    v91 = [NWURLError alloc];
                    if (v91)
                    {
                      *(void *)v152 = v91;
                      *(void *)&v152[8] = NWURLError;
                      v91 = (NWURLError *)objc_msgSendSuper2((objc_super *)v152, sel_initWithDomain_code_userInfo_, v144, -1017, 0);
                    }
                    uint64_t v92 = *(void *)(a1[7] + 8);
                    v93 = *(void **)(v92 + 40);
                    *(void *)(v92 + 40) = v91;
                  }
                  uint64_t v94 = a1[4];
                  if (v94) {
                    *(_DWORD *)(v94 + 12) = 3;
                  }
                }
                else
                {
                  uint64_t v99 = v90;
                  v100 = [v58 substringToIndex:v90];
                  v101 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
                  v102 = [v100 stringByTrimmingCharactersInSet:v101];

                  v103 = [v58 substringFromIndex:v99 + 1];
                  v104 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
                  v105 = [v103 stringByTrimmingCharactersInSet:v104];

                  uint64_t v106 = a1[4];
                  if (v106) {
                    v107 = *(void **)(v106 + 80);
                  }
                  else {
                    v107 = 0;
                  }
                  a4 = v147;
                  objc_msgSend(v107, "setObject:forKeyedSubscript:", v105, v102, v142, v143);

                  a5 = v52;
                }
              }
              *(void *)(*(void *)(a1[6] + 8) + 24) = v149 + a1[8];

              uint64_t v10 = v148;
            }
          }
        }
        goto LABEL_5;
      }
      if (v13 != 1)
      {
        if (v13) {
          goto LABEL_5;
        }
        id v14 = *(id *)(v12 + 56);
        if (v14)
        {
          char v15 = *(unsigned char *)(a4 + v9);
          uint64_t v16 = v14[6];
          unint64_t v17 = v14[4];
          unint64_t v18 = (v16 + 1) % v17;
          if (v18 == v14[5])
          {
            if (v18 + 1 == v17) {
              unint64_t v19 = 0;
            }
            else {
              unint64_t v19 = v18 + 1;
            }
            v14[5] = v19;
          }
          *(unsigned char *)(v14[3] + v16) = v15;
          v14[6] = (unint64_t)(v14[6] + 1) % v14[4];
        }
        uint64_t v20 = a1[4];
        if (v20)
        {
          uint64_t v11 = *(id *)(v20 + 56);
          if (v11)
          {
            unint64_t v21 = v11[4];
            unint64_t v22 = (v11[6] + 1) % v21;
            if (v22 == v11[5])
            {
              uint64_t v23 = v11[2];
              if (!v23)
              {
LABEL_24:

                uint64_t v27 = a1[4];
                if (v27)
                {
                  id v28 = *(id *)(v27 + 56);
                  if (v28)
                  {
                    v28[5] = 0;
                    v28[6] = 0;
                  }
                  uint64_t v29 = a1[4];
                  if (v29)
                  {
                    id v30 = *(id *)(v29 + 72);
                    if (v30)
                    {
                      v30[4] = 0;
                      v30[2] = 0;
                      *((unsigned char *)v30 + 8) = 0;
                      *((_DWORD *)v30 + 3) = 4;
                    }
                  }
                }
                uint64_t v31 = a1[4];
                if (v31) {
                  *(_DWORD *)(v31 + 12) = 1;
                }
                goto LABEL_5;
              }
              uint64_t v24 = 0;
              uint64_t v25 = (char *)v11[1];
              while (1)
              {
                int v26 = *v25++;
                if (*(unsigned __int8 *)(v11[3] + (v24 + v22) % v21) != v26) {
                  break;
                }
                ++v24;
                if (!--v23) {
                  goto LABEL_24;
                }
              }
            }
          }
        }
        else
        {
LABEL_3:
          uint64_t v11 = 0;
        }

        goto LABEL_5;
      }
      uint64_t v32 = *(void *)(v12 + 72);
      if (!v32) {
        goto LABEL_116;
      }
      if (*(_DWORD *)(v32 + 12) != 4 || (unint64_t v33 = *(void *)(v32 + 32), v33 >= 2))
      {
        _os_crash();
        __break(1u);
      }
      *(unsigned char *)(*(void *)(v32 + 24) + v33) = *(unsigned char *)(a4 + v9);
      uint64_t v34 = *(void *)(v32 + 32);
      BOOL v35 = __CFADD__(v34, 1);
      uint64_t v36 = v34 + 1;
      uint64_t v37 = v35;
      uint64_t v38 = v37 << 63 >> 63;
      *(void *)(v32 + 32) = v36;
      if (v38 != v37 || v38 < 0) {
        break;
      }
      if (v36 == 1)
      {
        unsigned int v39 = **(unsigned __int8 **)(v32 + 24);
        BOOL v40 = v39 > 0x2D;
        uint64_t v41 = (1 << v39) & 0x200000002400;
        if (!v40 && v41 != 0) {
          goto LABEL_116;
        }
LABEL_118:
        *(_DWORD *)(v32 + 12) = 2;
        *(void *)(v32 + 16) = 0;
        goto LABEL_119;
      }
LABEL_103:
      v110 = *(unsigned __int8 **)(v32 + 24);
      int v111 = *v110;
      if (v111 != 13 && v111 != 10)
      {
        if (v110[1] == 45)
        {
          *(_DWORD *)(v32 + 12) = 3;
LABEL_115:
          *(void *)(v32 + 16) = 2;
          *(unsigned char *)(v32 + 8) = 0;
LABEL_116:
          uint64_t v115 = a1[4];
          if (!v115) {
            goto LABEL_152;
          }
          goto LABEL_120;
        }
        goto LABEL_118;
      }
      *(_DWORD *)(v32 + 12) = 2;
      int v113 = v110[1];
      if (v113 == 13 || v113 == 10) {
        goto LABEL_115;
      }
      *(void *)(v32 + 16) = 1;
LABEL_119:
      *(unsigned char *)(v32 + 8) = 1;
      uint64_t v115 = a1[4];
      if (!v115) {
        goto LABEL_152;
      }
LABEL_120:
      v116 = *(id *)(v115 + 72);
      if (!v116 || (int v117 = v116[3], v116, v117 != 4))
      {
        uint64_t v118 = a1[4];
        if (v118)
        {
          unint64_t v119 = a5;
          uint64_t v120 = *(void *)(v118 + 96);
          v121 = *(id *)(v118 + 72);
          if (v121)
          {
            uint64_t v122 = v121[4];
          }
          else
          {
            uint64_t v122 = 0;
          }
        }
        else
        {
LABEL_152:
          unint64_t v119 = a5;
          uint64_t v120 = 0;
          uint64_t v122 = 0;
        }
        uint64_t v124 = a1[4];
        if (v124) {
          v125 = *(NSObject **)(v124 + 40);
        }
        else {
          v125 = 0;
        }
        size_t v123 = *(void *)(*(void *)(a1[6] + 8) + 24);
        dispatch_data_t v126 = dispatch_data_create_subrange(v125, v123, v10 + v9 + a1[8] - (v120 + v122) - v123);
        uint64_t v127 = a1[4];
        if (v127 && *(unsigned char *)(v127 + 8))
        {
          uint64_t v128 = a1[8];
          goto LABEL_131;
        }
        (*(void (**)(void))(a1[5] + 16))();
        uint64_t v127 = a1[4];
        uint64_t v128 = a1[8];
        if (v127)
        {
LABEL_131:
          id v129 = *(id *)(v127 + 72);
          v130 = v129;
          if (v129)
          {
            uint64_t v131 = *((void *)v129 + 4);
            uint64_t v127 = a1[4];
            if (v127)
            {
LABEL_133:
              v132 = *(id *)(v127 + 72);
              if (v132) {
                uint64_t v127 = v132[2];
              }
              else {
                uint64_t v127 = 0;
              }
LABEL_135:
              *(void *)(*(void *)(a1[6] + 8) + 24) = v10 + v9 + v128 - v131 + v127;

              uint64_t v133 = a1[4];
              a5 = v119;
              if (v133)
              {
                if (!*(unsigned char *)(v133 + 8) || (*(unsigned char *)(v133 + 8) = 0, (uint64_t v133 = a1[4]) != 0))
                {
                  v134 = *(id *)(v133 + 56);
                  if (v134)
                  {
                    v134[5] = 0;
                    v134[6] = 0;
                  }
                }
              }
              uint64_t v135 = a1[4];
              if (!v135) {
                goto LABEL_154;
              }
              v136 = (char *)*(id *)(v135 + 72);
              if (v136)
              {
                uint64_t v137 = v136[8];

                v9 -= v137;
              }
              uint64_t v135 = a1[4];
              if (v135)
              {
                v138 = *(id *)(v135 + 72);
                if (v138) {
                  LODWORD(v135) = v138[3];
                }
                else {
                  LODWORD(v135) = 0;
                }
              }
              else
              {
LABEL_154:
                v138 = 0;
              }
              uint64_t v139 = a1[4];
              if (v139) {
                *(_DWORD *)(v139 + 12) = v135;
              }

              goto LABEL_5;
            }
          }
          else
          {
            uint64_t v131 = 0;
            uint64_t v127 = a1[4];
            if (v127) {
              goto LABEL_133;
            }
          }
          v132 = 0;
          goto LABEL_135;
        }
        uint64_t v131 = 0;
        v130 = 0;
        v132 = 0;
        goto LABEL_135;
      }
LABEL_5:
      if (++v9 >= a5) {
        goto LABEL_168;
      }
    }
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v80 = (id)gLogObj;
    uint64_t v81 = *(void *)(v32 + 32);
    *(_DWORD *)v152 = 136446978;
    *(void *)&v152[4] = "-[NWURLSessionMultipartPartBoundarySuffixRecognizer consumeCharacter:]";
    *(_WORD *)&v152[12] = 2082;
    *(void *)&v152[14] = "_count";
    __int16 v153 = 2048;
    uint64_t v154 = 1;
    __int16 v155 = 2048;
    uint64_t v156 = v81;
    LODWORD(v143) = 42;
    v142 = v152;
    v82 = (void *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v150 = 0;
    if (!__nwlog_fault((const char *)v82, &type, &v150))
    {
LABEL_100:
      if (v82) {
        free(v82);
      }
      *(void *)(v32 + 32) = -1;
      goto LABEL_103;
    }
    unint64_t v83 = a5;
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      uint64_t v84 = (id)gLogObj;
      os_log_type_t v85 = type;
      if (os_log_type_enabled(v84, type))
      {
        uint64_t v86 = *(void *)(v32 + 32);
        *(_DWORD *)v152 = 136446978;
        *(void *)&v152[4] = "-[NWURLSessionMultipartPartBoundarySuffixRecognizer consumeCharacter:]";
        *(_WORD *)&v152[12] = 2082;
        *(void *)&v152[14] = "_count";
        __int16 v153 = 2048;
        uint64_t v154 = 1;
        __int16 v155 = 2048;
        uint64_t v156 = v86;
        v87 = v84;
        os_log_type_t v88 = v85;
        v89 = "%{public}s Overflow: %{public}s, increment %llu, result %llu";
LABEL_97:
        _os_log_impl(&dword_1830D4000, v87, v88, v89, v152, 0x2Au);
      }
    }
    else if (v150)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      uint64_t v84 = (id)gLogObj;
      os_log_type_t v96 = type;
      BOOL v97 = os_log_type_enabled(v84, type);
      if (backtrace_string)
      {
        if (v97)
        {
          uint64_t v98 = *(void *)(v32 + 32);
          *(_DWORD *)v152 = 136447234;
          *(void *)&v152[4] = "-[NWURLSessionMultipartPartBoundarySuffixRecognizer consumeCharacter:]";
          *(_WORD *)&v152[12] = 2082;
          *(void *)&v152[14] = "_count";
          __int16 v153 = 2048;
          uint64_t v154 = 1;
          __int16 v155 = 2048;
          uint64_t v156 = v98;
          __int16 v157 = 2082;
          v158 = backtrace_string;
          _os_log_impl(&dword_1830D4000, v84, v96, "%{public}s Overflow: %{public}s, increment %llu, result %llu, dumping backtrace:%{public}s", v152, 0x34u);
        }

        free(backtrace_string);
        goto LABEL_99;
      }
      if (v97)
      {
        uint64_t v140 = *(void *)(v32 + 32);
        *(_DWORD *)v152 = 136446978;
        *(void *)&v152[4] = "-[NWURLSessionMultipartPartBoundarySuffixRecognizer consumeCharacter:]";
        *(_WORD *)&v152[12] = 2082;
        *(void *)&v152[14] = "_count";
        __int16 v153 = 2048;
        uint64_t v154 = 1;
        __int16 v155 = 2048;
        uint64_t v156 = v140;
        _os_log_impl(&dword_1830D4000, v84, v96, "%{public}s Overflow: %{public}s, increment %llu, result %llu, no backtrace", v152, 0x2Au);
      }
    }
    else
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      uint64_t v84 = (id)gLogObj;
      os_log_type_t v108 = type;
      if (os_log_type_enabled(v84, type))
      {
        uint64_t v109 = *(void *)(v32 + 32);
        *(_DWORD *)v152 = 136446978;
        *(void *)&v152[4] = "-[NWURLSessionMultipartPartBoundarySuffixRecognizer consumeCharacter:]";
        *(_WORD *)&v152[12] = 2082;
        *(void *)&v152[14] = "_count";
        __int16 v153 = 2048;
        uint64_t v154 = 1;
        __int16 v155 = 2048;
        uint64_t v156 = v109;
        v87 = v84;
        os_log_type_t v88 = v108;
        v89 = "%{public}s Overflow: %{public}s, increment %llu, result %llu, backtrace limit exceeded";
        goto LABEL_97;
      }
    }

LABEL_99:
    a5 = v83;
    goto LABEL_100;
  }
LABEL_168:

  return 1;
}

uint64_t __89__NWURLSessionMultipartParser_task_handleMultipartData_complete_error_completionHandler___block_invoke_2_88(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v2 = (id)gLogObj;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    int v5 = 136446466;
    v6 = "-[NWURLSessionMultipartParser task:handleMultipartData:complete:error:completionHandler:]_block_invoke_2";
    __int16 v7 = 2112;
    uint64_t v8 = v3;
    _os_log_impl(&dword_1830D4000, v2, OS_LOG_TYPE_INFO, "%{public}s Completing with error %@", (uint8_t *)&v5, 0x16u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __89__NWURLSessionMultipartParser_task_handleMultipartData_complete_error_completionHandler___block_invoke_2(void *a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v5 = a1[6];
  if (v5)
  {
    unint64_t v6 = a5 + a3;
    BOOL v7 = v5 - 1 < a3 || v5 - 1 >= v6;
    if (!v7)
    {
      *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = *(unsigned char *)(a4 + v5 - 1 - a3);
      unint64_t v5 = a1[6];
    }
    BOOL v7 = v5 >= 2;
    unint64_t v8 = v5 - 2;
    if (v7 && v8 >= a3 && v8 < v6) {
      *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = *(unsigned char *)(a4 + v8 - a3);
    }
  }
  return 1;
}

void __89__NWURLSessionMultipartParser_task_handleMultipartData_complete_error_completionHandler___block_invoke_71(uint64_t a1)
{
}

void __89__NWURLSessionMultipartParser_task_handleMultipartData_complete_error_completionHandler___block_invoke_72(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (gLogDatapath)
  {
    uint64_t v31 = __nwlog_obj();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)uint64_t v37 = 136446466;
      *(void *)&v37[4] = "-[NWURLSessionMultipartParser task:handleMultipartData:complete:error:completionHandler:]_block_invoke";
      *(_WORD *)&v37[12] = 2048;
      *(void *)&v37[14] = a2;
      _os_log_impl(&dword_1830D4000, v31, OS_LOG_TYPE_DEBUG, "%{public}s Received disposition %ld", v37, 0x16u);
    }

    uint64_t v7 = *(void *)(a1 + 32);
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7)
    {
LABEL_3:
      unint64_t v8 = *(void **)(v7 + 48);
      goto LABEL_4;
    }
  }
  unint64_t v8 = 0;
LABEL_4:
  [v8 removeObject:*(void *)(a1 + 40)];
  if (!a2)
  {
    uint64_t v10 = [NWURLError alloc];
    if (v10)
    {
      uint64_t v11 = *MEMORY[0x1E4F289A0];
      *(void *)uint64_t v37 = v10;
      *(void *)&v37[8] = NWURLError;
      uint64_t v10 = (NWURLError *)objc_msgSendSuper2((objc_super *)v37, sel_initWithDomain_code_userInfo_, v11, -999, 0);
    }
    uint64_t v12 = *(void *)(*(void *)(a1 + 72) + 8);
    int v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v10;
    int v9 = 2;
    goto LABEL_27;
  }
  if (a2 == 1)
  {
    uint64_t v14 = *(void *)(*(void *)(a1 + 72) + 8);
    uint64_t v16 = *(void *)(v14 + 40);
    char v15 = (id *)(v14 + 40);
    if (!v16) {
      objc_storeStrong(v15, a3);
    }
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    unint64_t v17 = *(void **)(a1 + 40);
    if (v17) {
      unint64_t v17 = (void *)v17[2];
    }
    int v13 = v17;
    uint64_t v18 = [v13 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v33;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v33 != v20) {
            objc_enumerationMutation(v13);
          }
          uint64_t v22 = *(void *)(*((void *)&v32 + 1) + 8 * v21);
          uint64_t v23 = *(void *)(a1 + 56);
          if (v22)
          {
            id v24 = *(id *)(v22 + 16);
            BOOL v25 = *(unsigned char *)(v22 + 8) != 0;
            uint64_t v26 = *(void *)(v22 + 24);
          }
          else
          {
            BOOL v25 = 0;
            id v24 = 0;
            uint64_t v26 = 0;
          }
          (*(void (**)(uint64_t, id, BOOL, uint64_t))(v23 + 16))(v23, v24, v25, v26);

          ++v21;
        }
        while (v19 != v21);
        uint64_t v19 = [v13 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v19);
    }
    int v9 = 1;
LABEL_27:

    goto LABEL_28;
  }
  if ((unint64_t)(a2 - 2) < 2)
  {
    _os_crash();
    __break(1u);
    return;
  }
  int v9 = 2;
LABEL_28:
  uint64_t v27 = *(void *)(a1 + 32);
  if (v27)
  {
    if (![*(id *)(v27 + 48) count]) {
      goto LABEL_30;
    }
  }
  else if (![0 count])
  {
LABEL_30:
    uint64_t v28 = *(void *)(a1 + 32);
    if (v28) {
      *(_DWORD *)(v28 + 16) = v9;
    }
  }
  id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v30 = *(void *)(a1 + 40);
  if (v30) {
    objc_storeStrong((id *)(v30 + 16), v29);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64));
}

void __89__NWURLSessionMultipartParser_task_handleMultipartData_complete_error_completionHandler___block_invoke_63(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (gLogDatapath)
  {
    unint64_t v8 = __nwlog_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 136446466;
      uint64_t v10 = "-[NWURLSessionMultipartParser task:handleMultipartData:complete:error:completionHandler:]_block_invoke";
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl(&dword_1830D4000, v8, OS_LOG_TYPE_DEBUG, "%{public}s Delivered data, error %@", (uint8_t *)&v9, 0x16u);
    }
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void *)(v5 + 40);
  id v6 = (id *)(v5 + 40);
  if (!v7) {
    objc_storeStrong(v6, a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

@end