@interface NEAppProxyUDPFlow
- (NEAppProxyUDPFlow)initWithNEFlow:(_NEFlow *)a3 queue:(id)a4;
- (NWEndpoint)localEndpoint;
- (OS_nw_endpoint)localFlowEndpoint;
- (id)description;
- (void)openWithLocalEndpoint:(id)a3 completionHandler:(id)a4;
- (void)openWithLocalFlowEndpoint:(id)a3 completionHandler:(id)a4;
- (void)readDatagramsAndFlowEndpointsWithCompletionHandler:(id)a3;
- (void)readDatagramsWithCompletionHandler:(void *)completionHandler;
- (void)resetLocalEndpoint;
- (void)writeDatagrams:(NSArray *)datagrams sentByEndpoints:(NSArray *)remoteEndpoints completionHandler:(void *)completionHandler;
- (void)writeDatagrams:(id)a3 sentByFlowEndpoints:(id)a4 completionHandler:(id)a5;
@end

@implementation NEAppProxyUDPFlow

- (void).cxx_destruct
{
}

- (OS_nw_endpoint)localFlowEndpoint
{
  return (OS_nw_endpoint *)objc_getProperty(self, a2, 56, 1);
}

- (id)description
{
  v4 = NSString;
  v5 = [(NEAppProxyFlow *)self metaData];
  v6 = [(NEAppProxyUDPFlow *)self localFlowEndpoint];
  if (v6)
  {
    v2 = [(NEAppProxyUDPFlow *)self localFlowEndpoint];
    uint64_t port = nw_endpoint_get_port(v2);
  }
  else
  {
    uint64_t port = 0;
  }
  v8 = [(NEAppProxyFlow *)self networkInterface];
  BOOL v9 = [(NEAppProxyFlow *)self isBound];
  v10 = &stru_1EF054CB8;
  if (v9) {
    v10 = @"(bound)";
  }
  v11 = [v4 stringWithFormat:@"UDP %@ local port %u interface %@%@", v5, port, v8, v10];

  if (v6) {

  }
  return v11;
}

- (NWEndpoint)localEndpoint
{
  v3 = [(NEAppProxyUDPFlow *)self localFlowEndpoint];
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E4F38BE8];
    v5 = [(NEAppProxyUDPFlow *)self localFlowEndpoint];
    v6 = [v4 endpointWithCEndpoint:v5];
  }
  else
  {
    v6 = 0;
  }

  return (NWEndpoint *)v6;
}

- (void)writeDatagrams:(NSArray *)datagrams sentByEndpoints:(NSArray *)remoteEndpoints completionHandler:(void *)completionHandler
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  v8 = datagrams;
  BOOL v9 = remoteEndpoints;
  v47 = completionHandler;
  uint64_t v10 = [(NSArray *)v8 count];
  v45 = v9;
  v46 = v8;
  if (v10 == [(NSArray *)v9 count])
  {
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    v11 = v8;
    uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v64 objects:v71 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v65;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v65 != v14) {
            objc_enumerationMutation(v11);
          }
          if ((isa_nsdata(*(void **)(*((void *)&v64 + 1) + 8 * i)) & 1) == 0)
          {
            v36 = ne_log_obj();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315138;
              v73 = "-[NEAppProxyUDPFlow writeDatagrams:sentByEndpoints:completionHandler:]";
              _os_log_error_impl(&dword_19DDAF000, v36, OS_LOG_TYPE_ERROR, "%s: Datagrams array contains a non-NSData object", buf, 0xCu);
            }

            if (self) {
              id Property = objc_getProperty(self, v37, 40, 1);
            }
            else {
              id Property = 0;
            }
            v39 = Property;
            v62[0] = MEMORY[0x1E4F143A8];
            v62[1] = 3221225472;
            v62[2] = __70__NEAppProxyUDPFlow_writeDatagrams_sentByEndpoints_completionHandler___block_invoke_14;
            v62[3] = &unk_1E5993770;
            id v63 = v47;
            dispatch_async(v39, v62);

            goto LABEL_48;
          }
        }
        uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v64 objects:v71 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }

    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    v16 = v9;
    uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v58 objects:v70 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v59;
      while (2)
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v59 != v19) {
            objc_enumerationMutation(v16);
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v40 = ne_log_obj();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315138;
              v73 = "-[NEAppProxyUDPFlow writeDatagrams:sentByEndpoints:completionHandler:]";
              _os_log_error_impl(&dword_19DDAF000, v40, OS_LOG_TYPE_ERROR, "%s: Remote endpoints array contains a non-NWEndpoint object", buf, 0xCu);
            }

            if (self) {
              id v42 = objc_getProperty(self, v41, 40, 1);
            }
            else {
              id v42 = 0;
            }
            v43 = v42;
            v56[0] = MEMORY[0x1E4F143A8];
            v56[1] = 3221225472;
            v56[2] = __70__NEAppProxyUDPFlow_writeDatagrams_sentByEndpoints_completionHandler___block_invoke_15;
            v56[3] = &unk_1E5993770;
            id v57 = v47;
            dispatch_async(v43, v56);

            v11 = v16;
            goto LABEL_48;
          }
        }
        uint64_t v18 = [(NSArray *)v16 countByEnumeratingWithState:&v58 objects:v70 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }

    if ([(NSArray *)v11 count])
    {
      unint64_t v22 = 0;
      *(void *)&long long v21 = 136315138;
      long long v44 = v21;
      do
      {
        v23 = -[NSArray objectAtIndexedSubscript:](v11, "objectAtIndexedSubscript:", v22, v44);
        v24 = [(NSArray *)v16 objectAtIndexedSubscript:v22];
        [v24 address];
        unint64_t v25 = [(NSArray *)v11 count] - 1;
        if (v22 >= v25)
        {
          uint64_t v51 = MEMORY[0x1E4F143A8];
          uint64_t v52 = 3221225472;
          v53 = __70__NEAppProxyUDPFlow_writeDatagrams_sentByEndpoints_completionHandler___block_invoke_2;
          v54 = &unk_1E598EFC0;
          id v55 = v47;
        }
        uint64_t v26 = NEFlowWrite();
        if (v26)
        {
          uint64_t v27 = v26;
          v28 = ne_log_obj();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v44;
            v73 = "-[NEAppProxyUDPFlow writeDatagrams:sentByEndpoints:completionHandler:]";
            _os_log_error_impl(&dword_19DDAF000, v28, OS_LOG_TYPE_ERROR, "%s: Failed to write flow Data", buf, 0xCu);
          }

          if (self) {
            id v30 = objc_getProperty(self, v29, 40, 1);
          }
          else {
            id v30 = 0;
          }
          v31 = v30;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __70__NEAppProxyUDPFlow_writeDatagrams_sentByEndpoints_completionHandler___block_invoke_16;
          block[3] = &unk_1E5992D18;
          id v49 = v47;
          uint64_t v50 = v27;
          dispatch_async(v31, block);
        }
        if (v22 >= v25) {

        }
        ++v22;
      }
      while (v22 < [(NSArray *)v11 count]);
    }
  }
  else
  {
    v32 = ne_log_obj();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v73 = "-[NEAppProxyUDPFlow writeDatagrams:sentByEndpoints:completionHandler:]";
      __int16 v74 = 2048;
      uint64_t v75 = [(NSArray *)v8 count];
      __int16 v76 = 2048;
      uint64_t v77 = [(NSArray *)v9 count];
      _os_log_error_impl(&dword_19DDAF000, v32, OS_LOG_TYPE_ERROR, "%s: Size of datagrams array (%lu) does not match size of remoteEndpoints array (%lu)", buf, 0x20u);
    }

    if (self) {
      id v34 = objc_getProperty(self, v33, 40, 1);
    }
    else {
      id v34 = 0;
    }
    v35 = v34;
    v68[0] = MEMORY[0x1E4F143A8];
    v68[1] = 3221225472;
    v68[2] = __70__NEAppProxyUDPFlow_writeDatagrams_sentByEndpoints_completionHandler___block_invoke;
    v68[3] = &unk_1E5993770;
    v69 = v47;
    dispatch_async(v35, v68);

    v11 = v69;
LABEL_48:
  }
}

void __70__NEAppProxyUDPFlow_writeDatagrams_sentByEndpoints_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  +[NEAppProxyFlow errorForFlowError:]((uint64_t)NEAppProxyFlow, 4);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __70__NEAppProxyUDPFlow_writeDatagrams_sentByEndpoints_completionHandler___block_invoke_14(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  +[NEAppProxyFlow errorForFlowError:]((uint64_t)NEAppProxyFlow, 4);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __70__NEAppProxyUDPFlow_writeDatagrams_sentByEndpoints_completionHandler___block_invoke_15(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  +[NEAppProxyFlow errorForFlowError:]((uint64_t)NEAppProxyFlow, 4);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __70__NEAppProxyUDPFlow_writeDatagrams_sentByEndpoints_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  +[NEAppProxyFlow errorForFlowError:]((uint64_t)NEAppProxyFlow, a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

void __70__NEAppProxyUDPFlow_writeDatagrams_sentByEndpoints_completionHandler___block_invoke_16(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  +[NEAppProxyFlow errorForFlowError:]((uint64_t)NEAppProxyFlow, *(void *)(a1 + 40));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)writeDatagrams:(id)a3 sentByFlowEndpoints:(id)a4 completionHandler:(id)a5
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v47 = a5;
  uint64_t v10 = [v8 count];
  v45 = v9;
  v46 = v8;
  if (v10 == [v9 count])
  {
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id v11 = v8;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v64 objects:v71 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v65;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v65 != v14) {
            objc_enumerationMutation(v11);
          }
          if ((isa_nsdata(*(void **)(*((void *)&v64 + 1) + 8 * i)) & 1) == 0)
          {
            v36 = ne_log_obj();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315138;
              v73 = "-[NEAppProxyUDPFlow writeDatagrams:sentByFlowEndpoints:completionHandler:]";
              _os_log_error_impl(&dword_19DDAF000, v36, OS_LOG_TYPE_ERROR, "%s: Datagrams array contains a non-NSData object", buf, 0xCu);
            }

            if (self) {
              id Property = objc_getProperty(self, v37, 40, 1);
            }
            else {
              id Property = 0;
            }
            v39 = Property;
            v62[0] = MEMORY[0x1E4F143A8];
            v62[1] = 3221225472;
            v62[2] = __74__NEAppProxyUDPFlow_writeDatagrams_sentByFlowEndpoints_completionHandler___block_invoke_10;
            v62[3] = &unk_1E5993770;
            id v63 = v47;
            dispatch_async(v39, v62);

            goto LABEL_48;
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v64 objects:v71 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }

    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v16 = v9;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v58 objects:v70 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v59;
      while (2)
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v59 != v19) {
            objc_enumerationMutation(v16);
          }
          if (nw_endpoint_get_type(*(nw_endpoint_t *)(*((void *)&v58 + 1) + 8 * j)) != nw_endpoint_type_address)
          {
            v40 = ne_log_obj();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315138;
              v73 = "-[NEAppProxyUDPFlow writeDatagrams:sentByFlowEndpoints:completionHandler:]";
              _os_log_error_impl(&dword_19DDAF000, v40, OS_LOG_TYPE_ERROR, "%s: Remote endpoints array contains a non-NWEndpoint object", buf, 0xCu);
            }

            if (self) {
              id v42 = objc_getProperty(self, v41, 40, 1);
            }
            else {
              id v42 = 0;
            }
            v43 = v42;
            v56[0] = MEMORY[0x1E4F143A8];
            v56[1] = 3221225472;
            v56[2] = __74__NEAppProxyUDPFlow_writeDatagrams_sentByFlowEndpoints_completionHandler___block_invoke_11;
            v56[3] = &unk_1E5993770;
            id v57 = v47;
            dispatch_async(v43, v56);

            id v11 = v16;
            goto LABEL_48;
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v58 objects:v70 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }

    if ([v11 count])
    {
      unint64_t v22 = 0;
      *(void *)&long long v21 = 136315138;
      long long v44 = v21;
      do
      {
        v23 = objc_msgSend(v11, "objectAtIndexedSubscript:", v22, v44);
        v24 = [v16 objectAtIndexedSubscript:v22];
        nw_endpoint_get_address(v24);
        unint64_t v25 = [v11 count] - 1;
        if (v22 >= v25)
        {
          uint64_t v51 = MEMORY[0x1E4F143A8];
          uint64_t v52 = 3221225472;
          v53 = __74__NEAppProxyUDPFlow_writeDatagrams_sentByFlowEndpoints_completionHandler___block_invoke_2;
          v54 = &unk_1E598EFC0;
          id v55 = v47;
        }
        uint64_t v26 = NEFlowWrite();
        if (v26)
        {
          uint64_t v27 = v26;
          v28 = ne_log_obj();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v44;
            v73 = "-[NEAppProxyUDPFlow writeDatagrams:sentByFlowEndpoints:completionHandler:]";
            _os_log_error_impl(&dword_19DDAF000, v28, OS_LOG_TYPE_ERROR, "%s: Failed to write flow Data", buf, 0xCu);
          }

          if (self) {
            id v30 = objc_getProperty(self, v29, 40, 1);
          }
          else {
            id v30 = 0;
          }
          v31 = v30;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __74__NEAppProxyUDPFlow_writeDatagrams_sentByFlowEndpoints_completionHandler___block_invoke_13;
          block[3] = &unk_1E5992D18;
          id v49 = v47;
          uint64_t v50 = v27;
          dispatch_async(v31, block);
        }
        if (v22 >= v25) {

        }
        ++v22;
      }
      while (v22 < [v11 count]);
    }
  }
  else
  {
    v32 = ne_log_obj();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v73 = "-[NEAppProxyUDPFlow writeDatagrams:sentByFlowEndpoints:completionHandler:]";
      __int16 v74 = 2048;
      uint64_t v75 = [v8 count];
      __int16 v76 = 2048;
      uint64_t v77 = [v9 count];
      _os_log_error_impl(&dword_19DDAF000, v32, OS_LOG_TYPE_ERROR, "%s: Size of datagrams array (%lu) does not match size of remoteEndpoints array (%lu)", buf, 0x20u);
    }

    if (self) {
      id v34 = objc_getProperty(self, v33, 40, 1);
    }
    else {
      id v34 = 0;
    }
    v35 = v34;
    v68[0] = MEMORY[0x1E4F143A8];
    v68[1] = 3221225472;
    v68[2] = __74__NEAppProxyUDPFlow_writeDatagrams_sentByFlowEndpoints_completionHandler___block_invoke;
    v68[3] = &unk_1E5993770;
    id v69 = v47;
    dispatch_async(v35, v68);

    id v11 = v69;
LABEL_48:
  }
}

void __74__NEAppProxyUDPFlow_writeDatagrams_sentByFlowEndpoints_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  +[NEAppProxyFlow errorForFlowError:]((uint64_t)NEAppProxyFlow, 4);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __74__NEAppProxyUDPFlow_writeDatagrams_sentByFlowEndpoints_completionHandler___block_invoke_10(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  +[NEAppProxyFlow errorForFlowError:]((uint64_t)NEAppProxyFlow, 4);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __74__NEAppProxyUDPFlow_writeDatagrams_sentByFlowEndpoints_completionHandler___block_invoke_11(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  +[NEAppProxyFlow errorForFlowError:]((uint64_t)NEAppProxyFlow, 4);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __74__NEAppProxyUDPFlow_writeDatagrams_sentByFlowEndpoints_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  +[NEAppProxyFlow errorForFlowError:]((uint64_t)NEAppProxyFlow, a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

void __74__NEAppProxyUDPFlow_writeDatagrams_sentByFlowEndpoints_completionHandler___block_invoke_13(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  +[NEAppProxyFlow errorForFlowError:]((uint64_t)NEAppProxyFlow, *(void *)(a1 + 40));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)readDatagramsWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  id v16 = __56__NEAppProxyUDPFlow_readDatagramsWithCompletionHandler___block_invoke;
  uint64_t v17 = &unk_1E598EF98;
  id v5 = v4;
  id v18 = v5;
  uint64_t v6 = NEFlowAsyncDatagramsCopyNext();
  if (v6)
  {
    uint64_t v8 = v6;
    if (self) {
      id Property = objc_getProperty(self, v7, 40, 1);
    }
    else {
      id Property = 0;
    }
    uint64_t v10 = Property;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__NEAppProxyUDPFlow_readDatagramsWithCompletionHandler___block_invoke_2;
    block[3] = &unk_1E5992D18;
    id v12 = v5;
    uint64_t v13 = v8;
    dispatch_async(v10, block);
  }
}

void __56__NEAppProxyUDPFlow_readDatagramsWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v10 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:32];
  for (uint64_t i = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:32]; a2; a2 = *(void *)(a2 + 144))
  {
    [v10 addObject:*(void *)(a2 + 128)];
    uint64_t v8 = [MEMORY[0x1E4F38BC8] endpointWithAddress:a2];
    [i addObject:v8];
  }
  id v9 = +[NEAppProxyFlow errorForFlowError:]((uint64_t)NEAppProxyFlow, a4);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __56__NEAppProxyUDPFlow_readDatagramsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  +[NEAppProxyFlow errorForFlowError:]((uint64_t)NEAppProxyFlow, *(void *)(a1 + 40));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, void, id))(v1 + 16))(v1, 0, 0, v2);
}

- (void)readDatagramsAndFlowEndpointsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  id v16 = __72__NEAppProxyUDPFlow_readDatagramsAndFlowEndpointsWithCompletionHandler___block_invoke;
  uint64_t v17 = &unk_1E598EF98;
  id v5 = v4;
  id v18 = v5;
  uint64_t v6 = NEFlowAsyncDatagramsCopyNext();
  if (v6)
  {
    uint64_t v8 = v6;
    if (self) {
      id Property = objc_getProperty(self, v7, 40, 1);
    }
    else {
      id Property = 0;
    }
    id v10 = Property;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__NEAppProxyUDPFlow_readDatagramsAndFlowEndpointsWithCompletionHandler___block_invoke_2;
    block[3] = &unk_1E5992D18;
    id v12 = v5;
    uint64_t v13 = v8;
    dispatch_async(v10, block);
  }
}

void __72__NEAppProxyUDPFlow_readDatagramsAndFlowEndpointsWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v13 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:32];
  for (uint64_t i = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:32]; a2; a2 = *(void *)(a2 + 144))
  {
    [v13 addObject:*(void *)(a2 + 128)];
    nw_endpoint_t address = nw_endpoint_create_address((const sockaddr *)a2);
    [i addObject:address];
  }
  id v9 = +[NEAppProxyFlow errorForFlowError:]((uint64_t)NEAppProxyFlow, a4);
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = (void *)[v13 copy];
  id v12 = (void *)[i copy];
  (*(void (**)(uint64_t, void *, void *, void *))(v10 + 16))(v10, v11, v12, v9);
}

void __72__NEAppProxyUDPFlow_readDatagramsAndFlowEndpointsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  +[NEAppProxyFlow errorForFlowError:]((uint64_t)NEAppProxyFlow, *(void *)(a1 + 40));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, void, id))(v1 + 16))(v1, 0, 0, v2);
}

- (void)openWithLocalEndpoint:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__NEAppProxyUDPFlow_openWithLocalEndpoint_completionHandler___block_invoke;
  v9[3] = &unk_1E5993798;
  v9[4] = self;
  id v10 = v6;
  v8.receiver = self;
  v8.super_class = (Class)NEAppProxyUDPFlow;
  id v7 = v6;
  [(NEAppProxyFlow *)&v8 openWithLocalEndpoint:a3 completionHandler:v9];
}

void __61__NEAppProxyUDPFlow_openWithLocalEndpoint_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  -[NEAppProxyUDPFlow resetLocalEndpoint](v3);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)resetLocalEndpoint
{
  if (a1)
  {
    id v4 = (id)NEFlowCopyProperty();
    if (isa_nsdata(v4))
    {
      nw_endpoint_t address = nw_endpoint_create_address((const sockaddr *)[v4 bytes]);
      uint64_t v3 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = address;
    }
  }
}

- (void)openWithLocalFlowEndpoint:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__NEAppProxyUDPFlow_openWithLocalFlowEndpoint_completionHandler___block_invoke;
  v9[3] = &unk_1E5993798;
  v9[4] = self;
  id v10 = v6;
  v8.receiver = self;
  v8.super_class = (Class)NEAppProxyUDPFlow;
  id v7 = v6;
  [(NEAppProxyFlow *)&v8 openWithLocalFlowEndpoint:a3 completionHandler:v9];
}

void __65__NEAppProxyUDPFlow_openWithLocalFlowEndpoint_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  -[NEAppProxyUDPFlow resetLocalEndpoint](v3);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (NEAppProxyUDPFlow)initWithNEFlow:(_NEFlow *)a3 queue:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)NEAppProxyUDPFlow;
  id v4 = [(NEAppProxyFlow *)&v7 initWithNEFlow:a3 queue:a4];
  id v5 = v4;
  if (v4) {
    -[NEAppProxyUDPFlow resetLocalEndpoint]((uint64_t)v4);
  }
  return v5;
}

@end