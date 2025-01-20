@interface MDRemoteExtensionContext
@end

@implementation MDRemoteExtensionContext

void __40___MDRemoteExtensionContext_hostContext__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __40___MDRemoteExtensionContext_hostContext__block_invoke_cold_1();
  }
}

void __87___MDRemoteExtensionContext_handleSingleFileURLRequest_providerIdentifier_index_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __63___MDRemoteExtensionContext_performJob_acknowledgementHandler___block_invoke()
{
  id v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.corespotlight.requests", v2);
  v1 = (void *)performJob_acknowledgementHandler__queue;
  performJob_acknowledgementHandler__queue = (uint64_t)v0;
}

void __63___MDRemoteExtensionContext_performJob_acknowledgementHandler___block_invoke_2(id *a1)
{
  v231[1] = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x192F99810]();
  v160 = a1;
  id v3 = a1[4];
  id v2 = a1 + 4;
  uint64_t v4 = [v3 jobType];
  switch(v4)
  {
    case 1:
      id v12 = [*v2 extensionBundleID];
      uint64_t v13 = [v12 length];

      if (v13)
      {
        v14 = [*v2 extensionBundleID];
        v15 = (void *)MEMORY[0x1E4F1CA48];
        v16 = [*v2 identifiersToReindex];
        v17 = objc_msgSend(v15, "arrayWithCapacity:", objc_msgSend(v16, "count"));

        long long v217 = 0u;
        long long v218 = 0u;
        long long v215 = 0u;
        long long v216 = 0u;
        v18 = [*v2 identifiersToReindex];
        uint64_t v19 = [v18 countByEnumeratingWithState:&v215 objects:v230 count:16];
        if (v19)
        {
          uint64_t v20 = *(void *)v216;
          do
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v216 != v20) {
                objc_enumerationMutation(v18);
              }
              v22 = [v14 stringByAppendingFormat:@":%@", *(void *)(*((void *)&v215 + 1) + 8 * i)];
              [v17 addObject:v22];
            }
            uint64_t v19 = [v18 countByEnumeratingWithState:&v215 objects:v230 count:16];
          }
          while (v19);
        }

        [*v2 setIdentifiersToReindex:v17];
      }
      goto LABEL_26;
    case 2:
      v23 = [*v2 extensionBundleID];
      uint64_t v24 = [v23 length];

      if (v24)
      {
        v25 = [*v2 extensionBundleID];
        v231[0] = v25;
        v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v231 count:1];
        [*v2 setIdentifiersToReindex:v26];

LABEL_26:
        uint64_t v4 = 1;
      }
      else
      {
        uint64_t v4 = 2;
      }
      goto LABEL_37;
    case 6:
    case 7:
    case 8:
    case 14:
    case 15:
      id v5 = [*v2 extensionBundleID];
      if (![v5 length]) {
        goto LABEL_5;
      }
      id v6 = [*v2 providerIdentifier];
      uint64_t v7 = [v6 length];

      if (v7)
      {
        id v5 = [*v2 extensionBundleID];
        v8 = [*v2 providerIdentifier];
        uint64_t v9 = [v5 stringByAppendingFormat:@":%@", v8];
        [*v2 setProviderIdentifier:v9];

LABEL_5:
      }
LABEL_37:
      v163 = [v160[5] requestHandler];
      if (!v163) {
        goto LABEL_43;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v162 = -[CSSearchableIndex initWithName:options:]([CSSearchableIndex alloc], "initWithName:options:", @"CSSearchableIndexExtension", [*v2 jobOptions]);
      }
      else
      {
        v44 = logForCSLogCategoryIndex();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
          __63___MDRemoteExtensionContext_performJob_acknowledgementHandler___block_invoke_2_cold_1();
        }

LABEL_43:
        v162 = 0;
        v163 = 0;
      }
      id v11 = logForCSLogCategoryIndex();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        id v45 = *v2;
        *(_DWORD *)buf = 138412802;
        *(void *)&buf[4] = v45;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v162;
        *(_WORD *)&buf[22] = 2112;
        v227 = (uint64_t (*)(uint64_t, uint64_t))v163;
        _os_log_impl(&dword_18D0E3000, v11, OS_LOG_TYPE_INFO, "[CSJob] Extension will perform job: %@, index: %@, handler: %@", buf, 0x20u);
      }
      v161 = 0;
      char v158 = 0;
LABEL_47:

      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v227 = __Block_byref_object_copy__5;
      v228 = __Block_byref_object_dispose__5;
      id v229 = 0;
      if (!v163) {
        goto LABEL_60;
      }
      if (v4 == 1)
      {
        v46 = dispatch_group_create();
        dispatch_group_enter(v46);
        v47 = logForCSLogCategoryIndex();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          id v48 = *v2;
          *(_DWORD *)v223 = 138412546;
          *(void *)&v223[4] = v48;
          __int16 v224 = 2112;
          v225 = v162;
          _os_log_impl(&dword_18D0E3000, v47, OS_LOG_TYPE_DEFAULT, "[CSJob] reindexSearchableItemsWithIdentifiers for job: %@, index: %@", v223, 0x16u);
        }

        v49 = [*v2 identifiersToReindex];
        v211[0] = MEMORY[0x1E4F143A8];
        v211[1] = 3221225472;
        v211[2] = __63___MDRemoteExtensionContext_performJob_acknowledgementHandler___block_invoke_106;
        v211[3] = &unk_1E5549900;
        v212 = *v2;
        v50 = v162;
        v213 = v50;
        v51 = v46;
        v214 = v51;
        [v163 searchableIndex:v50 reindexSearchableItemsWithIdentifiers:v49 acknowledgementHandler:v211];

        id v156 = 0;
        v52 = v212;
        goto LABEL_115;
      }
      if ((v4 & 0xFFFFFFFFFFFFFFFELL) == 2)
      {
        v53 = dispatch_group_create();
        dispatch_group_enter(v53);
        v54 = logForCSLogCategoryIndex();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          id v55 = *v2;
          *(_DWORD *)v223 = 138412546;
          *(void *)&v223[4] = v55;
          __int16 v224 = 2112;
          v225 = v162;
          _os_log_impl(&dword_18D0E3000, v54, OS_LOG_TYPE_DEFAULT, "[CSJob] reindexSearchableItems for job: %@, index: %@", v223, 0x16u);
        }

        v207[0] = MEMORY[0x1E4F143A8];
        v207[1] = 3221225472;
        v207[2] = __63___MDRemoteExtensionContext_performJob_acknowledgementHandler___block_invoke_107;
        v207[3] = &unk_1E5549900;
        v208 = *v2;
        v56 = v162;
        v209 = v56;
        v51 = v53;
        v210 = v51;
        [v163 searchableIndex:v56 reindexAllSearchableItemsWithAcknowledgementHandler:v207];

        id v156 = 0;
        v52 = v208;
        goto LABEL_115;
      }
      if (v4 == 5)
      {
        [v163 searchableIndexDidFinishThrottle:v162];
        goto LABEL_60;
      }
      if (v4 == 4)
      {
        [v163 searchableIndexDidThrottle:v162];
LABEL_60:
        id v156 = 0;
        v51 = 0;
        goto LABEL_116;
      }
      if ((v4 & 0xFFFFFFFFFFFFFFF7) == 6)
      {
        v52 = v163;
        if (objc_opt_respondsToSelector())
        {
          unint64_t v57 = [*v2 jobOptions];
          v58 = [*v2 providerIdentifier];
          v59 = [*v2 providerType];
          v206 = 0;
          uint64_t v60 = [v52 dataForSearchableIndex:v162 itemIdentifier:v58 typeIdentifier:v59 options:(v57 >> 11) & 0xD error:&v206];
          v61 = v206;
LABEL_68:
          id v156 = v61;
          v67 = *(void **)(*(void *)&buf[8] + 40);
          *(void *)(*(void *)&buf[8] + 40) = v60;

          goto LABEL_114;
        }
        if (objc_opt_respondsToSelector())
        {
          v58 = [*v2 providerIdentifier];
          v59 = [*v2 providerType];
          v205 = 0;
          uint64_t v60 = [v52 dataForSearchableIndex:v162 itemIdentifier:v58 typeIdentifier:v59 allowDownload:v4 != 14 error:&v205];
          v61 = v205;
          goto LABEL_68;
        }
        if (v4 != 14)
        {
          if (objc_opt_respondsToSelector())
          {
            v58 = [*v2 providerIdentifier];
            v59 = [*v2 providerType];
            v204 = 0;
            uint64_t v60 = [v52 dataForSearchableIndex:v162 itemIdentifier:v58 typeIdentifier:v59 error:&v204];
            v61 = v204;
            goto LABEL_68;
          }
          if (objc_opt_respondsToSelector())
          {
            v58 = [*v2 providerIdentifier];
            v59 = [*v2 providerType];
            v203 = 0;
            uint64_t v60 = [v52 searchableIndexProvideDataForIndex:v162 identifier:v58 type:v59 error:&v203];
            v61 = v203;
            goto LABEL_68;
          }
        }
      }
      else
      {
        switch(v4)
        {
          case 7:
          case 8:
          case 15:
            id v63 = v160[4];
            id v62 = v160[5];
            v64 = [v63 providerIdentifier];
            id v202 = 0;
            v52 = [v62 handleSingleFileURLRequest:v63 providerIdentifier:v64 index:v162 error:&v202];
            id v156 = v202;

            uint64_t v65 = +[CSCoder encodeURLPreservingSecurityScope:v52];
            v66 = *(void **)(*(void *)&buf[8] + 40);
            *(void *)(*(void *)&buf[8] + 40) = v65;

            goto LABEL_114;
          case 9:
            v52 = v163;
            if ((objc_opt_respondsToSelector() & 1) == 0) {
              break;
            }
            v68 = dispatch_group_create();
            dispatch_group_enter(v68);
            v69 = [*v2 searchContext];
            v197[0] = MEMORY[0x1E4F143A8];
            v197[1] = 3221225472;
            v197[2] = __63___MDRemoteExtensionContext_performJob_acknowledgementHandler___block_invoke_124;
            v197[3] = &unk_1E5549928;
            v199 = buf;
            v51 = v68;
            v198 = v51;
            [v52 fetchSearchableItemsForSearchContext:v69 completionHandler:v197];

            id v156 = 0;
            goto LABEL_115;
          case 10:
            v52 = v163;
            if (objc_opt_respondsToSelector())
            {
              v70 = [*v2 searchContext];
              -[NSObject cancelQueryWithIdentifier:](v52, "cancelQueryWithIdentifier:", [v70 queryID]);
            }
            break;
          case 11:
            v52 = v163;
            *(_WORD *)v223 = (objc_opt_respondsToSelector() & 1) != 0;
            uint64_t v71 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v223 length:2];
            v72 = *(void **)(*(void *)&buf[8] + 40);
            *(void *)(*(void *)&buf[8] + 40) = v71;

            break;
          case 12:
            v52 = v163;
            if ((objc_opt_respondsToSelector() & 1) == 0) {
              break;
            }
            uint64_t v73 = [*v2 importData];
            v74 = [[CSDecoder alloc] initWithData:v73];
            v75 = [(CSDecoder *)v74 decode];
            objc_opt_class();
            v154 = (void *)v73;
            v155 = v74;
            if (objc_opt_isKindOfClass())
            {
              v76 = [MEMORY[0x1E4F1CA48] array];
              v77 = [v75 objectForKeyedSubscript:@"FileExtensionArray"];
              v78 = v77;
              v153 = v75;
              if (v77)
              {
                long long v195 = 0u;
                long long v196 = 0u;
                long long v193 = 0u;
                long long v194 = 0u;
                v79 = v77;
                id v80 = v77;
                uint64_t v81 = [v80 countByEnumeratingWithState:&v193 objects:v222 count:16];
                if (v81)
                {
                  uint64_t v82 = *(void *)v194;
                  do
                  {
                    for (uint64_t j = 0; j != v81; ++j)
                    {
                      if (*(void *)v194 != v82) {
                        objc_enumerationMutation(v80);
                      }
                      [*(id *)(*((void *)&v193 + 1) + 8 * j) UTF8String];
                      v84 = [NSNumber numberWithUnsignedLongLong:sandbox_extension_consume()];
                      [v76 addObject:v84];
                    }
                    uint64_t v81 = [v80 countByEnumeratingWithState:&v193 objects:v222 count:16];
                  }
                  while (v81);
                }

                v75 = v153;
                v78 = v79;
              }
              v85 = [v75 objectForKeyedSubscript:@"PathArray"];
              v151 = v78;
              v152 = v85;
              if (v85)
              {
                v86 = [MEMORY[0x1E4F1CA48] array];
                long long v191 = 0u;
                long long v192 = 0u;
                long long v189 = 0u;
                long long v190 = 0u;
                id v87 = v85;
                uint64_t v88 = [v87 countByEnumeratingWithState:&v189 objects:v221 count:16];
                if (v88)
                {
                  uint64_t v89 = *(void *)v190;
                  do
                  {
                    for (uint64_t k = 0; k != v88; ++k)
                    {
                      if (*(void *)v190 != v89) {
                        objc_enumerationMutation(v87);
                      }
                      v91 = [MEMORY[0x1E4F1CB10] fileURLWithPath:*(void *)(*((void *)&v189 + 1) + 8 * k)];
                      [v86 addObject:v91];
                    }
                    uint64_t v88 = [v87 countByEnumeratingWithState:&v189 objects:v221 count:16];
                  }
                  while (v88);
                }

                id v188 = 0;
                v92 = [v52 importFilesForURLs:v86 error:&v188];
                id v156 = v188;
                if ([v92 count])
                {
                  v93 = objc_alloc_init(CSCoder);
                  [(CSCoder *)v93 encodeObject:v92];
                  v94 = [(CSCoder *)v93 data];
                  uint64_t v95 = [v94 copy];
                  v96 = *(void **)(*(void *)&buf[8] + 40);
                  *(void *)(*(void *)&buf[8] + 40) = v95;
                }
              }
              else
              {
                id v156 = 0;
              }
              long long v186 = 0u;
              long long v187 = 0u;
              long long v184 = 0u;
              long long v185 = 0u;
              id v147 = v76;
              uint64_t v148 = [v147 countByEnumeratingWithState:&v184 objects:v220 count:16];
              if (v148)
              {
                uint64_t v149 = *(void *)v185;
                do
                {
                  for (uint64_t m = 0; m != v148; ++m)
                  {
                    if (*(void *)v185 != v149) {
                      objc_enumerationMutation(v147);
                    }
                    if ([*(id *)(*((void *)&v184 + 1) + 8 * m) longLongValue] != -1) {
                      sandbox_extension_release();
                    }
                  }
                  uint64_t v148 = [v147 countByEnumeratingWithState:&v184 objects:v220 count:16];
                }
                while (v148);
              }

              v75 = v153;
            }
            else
            {
              id v156 = 0;
            }

            goto LABEL_114;
          case 16:
            id v97 = v163;
            char v98 = objc_opt_respondsToSelector();
            id v99 = *v2;
            if (v98)
            {
              unint64_t v100 = [v99 jobOptions];
              v101 = [*v2 providerIdentifiers];
              v102 = [*v2 providerType];
              id v201 = 0;
              v52 = [v97 fileURLsForSearchableIndex:v162 itemIdentifiers:v101 typeIdentifier:v102 options:(v100 >> 11) & 0xF error:&v201];
              id v156 = v201;
            }
            else
            {
              v101 = [v99 providerIdentifiers];
              v102 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v101, "count"));
              for (unint64_t n = 0; [v101 count] > n; ++n)
              {
                v106 = objc_opt_new();
                id v108 = v160[4];
                id v107 = v160[5];
                v109 = [v101 objectAtIndexedSubscript:n];
                id v200 = 0;
                v110 = [v107 handleSingleFileURLRequest:v108 providerIdentifier:v109 index:v162 error:&v200];
                id v111 = v200;

                v112 = [[CSFileURLBatchResult alloc] initWithFileURL:v110 andError:v111];
                [v102 setObject:v112 atIndexedSubscript:n];
              }
              v52 = [v102 copy];
              id v156 = 0;
            }

            uint64_t v145 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v52 requiringSecureCoding:1 error:0];
            v146 = *(void **)(*(void *)&buf[8] + 40);
            *(void *)(*(void *)&buf[8] + 40) = v145;

            goto LABEL_114;
          case 17:
            v52 = v163;
            if (objc_opt_respondsToSelector())
            {
              v103 = [*v2 updatedItems];
              -[NSObject searchableItemsDidUpdate:mask:](v52, "searchableItemsDidUpdate:mask:", v103, [*v2 updatedItemsMask]);
            }
            else
            {
              if ((objc_opt_respondsToSelector() & 1) == 0) {
                break;
              }
              v103 = [*v2 updatedItems];
              [v52 searchableItemsDidUpdate:v103];
            }

            break;
          default:
            v52 = logForCSLogCategoryIndex();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
            {
              id v104 = *v2;
              *(_DWORD *)v223 = 138412546;
              *(void *)&v223[4] = v104;
              __int16 v224 = 2112;
              v225 = v162;
              _os_log_impl(&dword_18D0E3000, v52, OS_LOG_TYPE_DEFAULT, "[CSJob] Ignoring job: %@, index: %@", v223, 0x16u);
            }
            break;
        }
      }
      id v156 = 0;
LABEL_114:
      v51 = 0;
LABEL_115:

LABEL_116:
      v113 = v161;
      char v114 = v158 ^ 1;
      if (!v161) {
        char v114 = 1;
      }
      if ((v114 & 1) == 0)
      {
        v159 = [*v2 importData];
        v115 = [[CSDecoder alloc] initWithData:v159];
        v116 = [(CSDecoder *)v115 decode];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          v116 = 0;
        }
        v117 = [*v2 fileAttributeSets];
        unint64_t v118 = [v117 count];

        v119 = [*v2 fileAttributeSets];
        v120 = (void *)[v119 mutableCopy];

        if (v118)
        {
          for (iuint64_t i = 0; ii != v118; ++ii)
          {
            v122 = [*v2 fileAttributeSets];
            v123 = [v122 objectAtIndexedSubscript:ii];
            BOOL v124 = v123 == 0;

            if (v124)
            {
              v125 = objc_alloc_init(CSSearchableItemAttributeSet);
              [v120 setObject:v125 atIndexedSubscript:ii];
            }
          }
        }
        [*v2 setFileAttributeSets:v120];
        *(void *)v223 = 0;
        if (v118 >= 4) {
          size_t v126 = 4;
        }
        else {
          size_t v126 = v118;
        }
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __63___MDRemoteExtensionContext_performJob_acknowledgementHandler___block_invoke_145;
        block[3] = &unk_1E5549950;
        v182 = v223;
        unint64_t v183 = v118;
        id v127 = v116;
        id v179 = v127;
        id v180 = *v2;
        id v181 = v161;
        dispatch_apply(v126, 0, block);
        v128 = objc_alloc_init(CSCoder);
        [(CSCoder *)v128 beginArray];
        long long v176 = 0u;
        long long v177 = 0u;
        long long v174 = 0u;
        long long v175 = 0u;
        v129 = [*v2 fileAttributeSets];
        uint64_t v130 = [v129 countByEnumeratingWithState:&v174 objects:v219 count:16];
        if (v130)
        {
          uint64_t v131 = *(void *)v175;
          do
          {
            for (juint64_t j = 0; jj != v130; ++jj)
            {
              if (*(void *)v175 != v131) {
                objc_enumerationMutation(v129);
              }
              v133 = [*(id *)(*((void *)&v174 + 1) + 8 * jj) attributeDictionary];
              [(CSCoder *)v128 encodeObject:v133];
            }
            uint64_t v130 = [v129 countByEnumeratingWithState:&v174 objects:v219 count:16];
          }
          while (v130);
        }

        [(CSCoder *)v128 endArray];
        v134 = [(CSCoder *)v128 data];
        uint64_t v135 = [v134 copy];
        v136 = *(void **)(*(void *)&buf[8] + 40);
        *(void *)(*(void *)&buf[8] + 40) = v135;

        v113 = v161;
      }
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __63___MDRemoteExtensionContext_performJob_acknowledgementHandler___block_invoke_147;
      aBlock[3] = &unk_1E5549978;
      id v165 = v160[4];
      v137 = v162;
      v166 = v137;
      id v138 = v163;
      id v167 = v138;
      id v139 = v113;
      id v140 = v160[5];
      id v168 = v139;
      id v169 = v140;
      BOOL v173 = v51 != 0;
      id v141 = v156;
      id v170 = v141;
      id v171 = v160[6];
      v172 = buf;
      v142 = _Block_copy(aBlock);
      v143 = v142;
      if (v51)
      {
        dispatch_suspend((dispatch_object_t)performJob_acknowledgementHandler__queue);
        v144 = dispatch_get_global_queue(9, 0);
        dispatch_group_notify(v51, v144, v143);
      }
      else
      {
        (*((void (**)(void *))v142 + 2))(v142);
      }

      _Block_object_dispose(buf, 8);
      return;
    case 13:
      v161 = [v160[5] importExtension];
      if (!v161) {
        goto LABEL_11;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v10 = logForCSLogCategoryIndex();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          __63___MDRemoteExtensionContext_performJob_acknowledgementHandler___block_invoke_2_cold_3();
        }

LABEL_11:
        v161 = 0;
      }
      id v11 = logForCSLogCategoryIndex();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        __63___MDRemoteExtensionContext_performJob_acknowledgementHandler___block_invoke_2_cold_2((uint64_t)v161, v2, v11);
      }
      v162 = 0;
      v163 = 0;
      char v158 = 1;
      uint64_t v4 = 13;
      goto LABEL_47;
    case 16:
      v27 = [*v2 extensionBundleID];
      uint64_t v28 = [v27 length];

      if (v28)
      {
        id v29 = objc_alloc(MEMORY[0x1E4F1CA48]);
        v30 = [*v2 providerIdentifiers];
        v31 = objc_msgSend(v29, "initWithCapacity:", objc_msgSend(v30, "count"));

        v32 = [*v2 providerIdentifiers];
        uint64_t v33 = [v32 count];

        if (v33)
        {
          unint64_t v34 = 0;
          do
          {
            v35 = [*v2 providerIdentifiers];
            v36 = [v35 objectAtIndexedSubscript:v34];
            uint64_t v37 = [v36 length];

            if (v37)
            {
              v38 = [*v2 extensionBundleID];
              v39 = [*v2 providerIdentifiers];
              v40 = [v39 objectAtIndexedSubscript:v34];
              v41 = [v38 stringByAppendingFormat:@":%@", v40];
              [v31 setObject:v41 atIndexedSubscript:v34];
            }
            else
            {
              [v31 setObject:&stru_1EDBB3A50 atIndexedSubscript:v34];
            }
            v42 = [*v2 providerIdentifiers];
            ++v34;
            unint64_t v43 = [v42 count];
          }
          while (v43 > v34);
        }
        [*v2 setProviderIdentifiers:v31];
      }
      uint64_t v4 = 16;
      goto LABEL_37;
    default:
      goto LABEL_37;
  }
}

void __63___MDRemoteExtensionContext_performJob_acknowledgementHandler___block_invoke_106(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 138412546;
    uint64_t v6 = v3;
    __int16 v7 = 2112;
    uint64_t v8 = v4;
    _os_log_impl(&dword_18D0E3000, v2, OS_LOG_TYPE_DEFAULT, "[CSJob] Received ack for job: %@, index: %@", (uint8_t *)&v5, 0x16u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __63___MDRemoteExtensionContext_performJob_acknowledgementHandler___block_invoke_107(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 138412546;
    uint64_t v6 = v3;
    __int16 v7 = 2112;
    uint64_t v8 = v4;
    _os_log_impl(&dword_18D0E3000, v2, OS_LOG_TYPE_DEFAULT, "[CSJob] Received ack for job: %@, index: %@", (uint8_t *)&v5, 0x16u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __63___MDRemoteExtensionContext_performJob_acknowledgementHandler___block_invoke_124(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    logForCSLogCategoryDefault();
    __int16 v7 = (CSCoder *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_ERROR)) {
      __63___MDRemoteExtensionContext_performJob_acknowledgementHandler___block_invoke_124_cold_1(v6, &v7->super);
    }
LABEL_13:

    goto LABEL_14;
  }
  if ([v5 count])
  {
    __int16 v7 = objc_alloc_init(CSCoder);
    [(CSCoder *)v7 beginArray];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "attributeSet", (void)v18);
          [(CSCoder *)v7 encodeObject:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }

    [(CSCoder *)v7 endArray];
    v14 = [(CSCoder *)v7 data];
    uint64_t v15 = [v14 copy];
    uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
    v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;

    goto LABEL_13;
  }
LABEL_14:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __63___MDRemoteExtensionContext_performJob_acknowledgementHandler___block_invoke_145(uint64_t a1, __n128 a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  unint64_t add_explicit = atomic_fetch_add_explicit(*(atomic_ullong *volatile *)(a1 + 56), 1uLL, memory_order_relaxed);
  if (add_explicit < *(void *)(a1 + 64))
  {
    a2.n128_u64[0] = 134218242;
    __n128 v15 = a2;
    do
    {
      uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", add_explicit, *(_OWORD *)&v15);
      id v5 = v4;
      if (v4)
      {
        [v4 UTF8String];
        uint64_t v6 = sandbox_extension_consume();
      }
      else
      {
        uint64_t v6 = -1;
      }
      __int16 v7 = [*(id *)(a1 + 40) fileAttributeSets];
      id v8 = [v7 objectAtIndexedSubscript:add_explicit];

      uint64_t v9 = [v8 contentURL];
      uint64_t v10 = (void *)MEMORY[0x192F99810]();
      uint64_t v11 = *(void **)(a1 + 48);
      id v16 = 0;
      [v11 updateAttributes:v8 forFileAtURL:v9 error:&v16];
      id v12 = v16;
      uint64_t v13 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v14 = [v5 UTF8String];
        *(_DWORD *)buf = v15.n128_u32[0];
        uint64_t v18 = v6;
        __int16 v19 = 2080;
        uint64_t v20 = v14;
        _os_log_debug_impl(&dword_18D0E3000, v13, OS_LOG_TYPE_DEBUG, "===== sandbox_extension_consume %lld, %s", buf, 0x16u);
      }

      sandbox_extension_release();
      unint64_t add_explicit = atomic_fetch_add_explicit(*(atomic_ullong *volatile *)(a1 + 56), 1uLL, memory_order_relaxed);
    }
    while (add_explicit < *(void *)(a1 + 64));
  }
}

void __63___MDRemoteExtensionContext_performJob_acknowledgementHandler___block_invoke_147(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x192F99810]();
  uint64_t v3 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    if (!v6) {
      uint64_t v6 = *(void *)(a1 + 56);
    }
    int v22 = 138412802;
    uint64_t v23 = v5;
    __int16 v24 = 2112;
    uint64_t v25 = v4;
    __int16 v26 = 2112;
    uint64_t v27 = v6;
    _os_log_impl(&dword_18D0E3000, v3, OS_LOG_TYPE_DEFAULT, "[CSJob] completed job: %@, index: %@, handler: %@", (uint8_t *)&v22, 0x20u);
  }

  [*(id *)(a1 + 64) setRequestHandler:0];
  if (*(unsigned char *)(a1 + 96)) {
    dispatch_resume((dispatch_object_t)performJob_acknowledgementHandler__queue);
  }
  if (*(void *)(a1 + 72))
  {
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = *(void **)(a1 + 72);
    if (v7 != v8)
    {
      uint64_t v10 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v11 = [v9 domain];
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, objc_msgSend(*(id *)(a1 + 72), "code"), 0);
      id v12 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v12 = v9;
LABEL_12:
  uint64_t v13 = *(void *)(a1 + 80);
  if (v13) {
    (*(void (**)(uint64_t, void, id))(v13 + 16))(v13, *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40), v12);
  }
  uint64_t v14 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    __63___MDRemoteExtensionContext_performJob_acknowledgementHandler___block_invoke_147_cold_1(v14, v15, v16, v17, v18, v19, v20, v21);
  }

  [*(id *)(a1 + 64) completeRequestReturningItems:MEMORY[0x1E4F1CBF0] completionHandler:0];
}

void __40___MDRemoteExtensionContext_hostContext__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18D0E3000, v0, v1, "Error getting host context %@", v2, v3, v4, v5, v6);
}

void __63___MDRemoteExtensionContext_performJob_acknowledgementHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18D0E3000, v0, v1, "[CSJob] Invalid index request handler: %@", v2, v3, v4, v5, v6);
}

void __63___MDRemoteExtensionContext_performJob_acknowledgementHandler___block_invoke_2_cold_2(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint8_t v6 = [*a2 fileType];
  uint64_t v7 = [*a2 fileAttributeSets];
  int v8 = 138412802;
  uint64_t v9 = a1;
  __int16 v10 = 2112;
  uint64_t v11 = v6;
  __int16 v12 = 2112;
  uint64_t v13 = v7;
  _os_log_debug_impl(&dword_18D0E3000, a3, OS_LOG_TYPE_DEBUG, "[CSJob] importExtension: %@, job.fileType: %@, job.fileAttributeSets: %@", (uint8_t *)&v8, 0x20u);
}

void __63___MDRemoteExtensionContext_performJob_acknowledgementHandler___block_invoke_2_cold_3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18D0E3000, v0, v1, "[CSJob] Invalid import extension request handler: %@", v2, v3, v4, v5, v6);
}

void __63___MDRemoteExtensionContext_performJob_acknowledgementHandler___block_invoke_124_cold_1(void *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [a1 code];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_18D0E3000, a2, OS_LOG_TYPE_ERROR, "[CSJob] Error occured in remote search: %ld", v3, 0xCu);
}

void __63___MDRemoteExtensionContext_performJob_acknowledgementHandler___block_invoke_147_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end