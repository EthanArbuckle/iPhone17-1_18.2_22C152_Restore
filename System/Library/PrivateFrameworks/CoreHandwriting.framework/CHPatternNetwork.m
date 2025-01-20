@interface CHPatternNetwork
+ (BOOL)isString:(id)a3 fullPattern:(int64_t)a4 inNetwork:(id)a5;
+ (id)newCursorByAdvancingWithString:(id)a3 fromCursor:(id)a4 inNetwork:(id)a5;
+ (id)newCursorByAdvancingWithSymbol:(unint64_t)a3 fromCursor:(id)a4 inNetwork:(id)a5;
+ (id)rootCursorForContentType:(int)a3 inNetwork:(id)a4 forFirstSegmentGroup:(BOOL)a5;
+ (id)rootCursorForPatternType:(int64_t)a3 inNetwork:(id)a4 forFirstSegmentGroup:(BOOL)a5;
- (CHPatternNetwork)initWithFile:(id)a3;
- (void)dealloc;
@end

@implementation CHPatternNetwork

+ (id)rootCursorForContentType:(int)a3 inNetwork:(id)a4 forFirstSegmentGroup:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a3;
  v7 = (void **)a4;
  v12 = v7;
  if (v7
    && (v13 = v7[4],
        objc_msgSend_numberWithInt_(NSNumber, v8, v6, v9, v10, v11),
        v14 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_objectForKey_(v13, v15, (uint64_t)v14, v16, v17, v18),
        v19 = (NetworkCursor *)objc_claimAutoreleasedReturnValue(),
        v14,
        v19))
  {
    if (v6 || !v5)
    {
      v32 = v19;
    }
    else
    {
      v24 = objc_msgSend_objectForKey_(v12[3], v20, (uint64_t)&unk_1F203F330, v21, v22, v23);
      uint64_t v30 = objc_msgSend_unsignedLongValue(v24, v25, v26, v27, v28, v29);

      v31 = v19;
      self;
      v32 = objc_alloc_init(NetworkCursor);
      begin = v31->_nodeIndexes.__begin_;
      if (v31->_nodeIndexes.__end_ != begin)
      {
        unint64_t v34 = 0;
        do
        {
          sub_1C4BF7E08(v32, begin[v34++], v31->_stateType);
          begin = v31->_nodeIndexes.__begin_;
        }
        while (v34 < v31->_nodeIndexes.__end_ - begin);
      }
      sub_1C4BF7E08(v32, v30, 0);
    }
  }
  else
  {
    v32 = 0;
  }

  return v32;
}

+ (id)rootCursorForPatternType:(int64_t)a3 inNetwork:(id)a4 forFirstSegmentGroup:(BOOL)a5
{
  uint64_t v6 = a4;
  if (v6)
  {
    v7 = objc_alloc_init(NetworkCursor);
    v8 = (void *)v6[3];
    v13 = objc_msgSend_numberWithInteger_(NSNumber, v9, a3, v10, v11, v12);
    uint64_t v18 = objc_msgSend_objectForKey_(v8, v14, (uint64_t)v13, v15, v16, v17);
    uint64_t v24 = objc_msgSend_unsignedLongValue(v18, v19, v20, v21, v22, v23);

    sub_1C4BF7E08(v7, v24, 0);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)newCursorByAdvancingWithString:(id)a3 fromCursor:(id)a4 inNetwork:(id)a5
{
  id v7 = a3;
  v8 = a4;
  id v9 = a5;
  uint64_t v15 = v9;
  uint64_t v16 = 0;
  if (v8 && v9)
  {
    if (v8[2] != v8[1])
    {
      if (!objc_msgSend_length(v7, v10, v11, v12, v13, v14))
      {
        uint64_t v16 = v8;
        goto LABEL_9;
      }
      uint64_t v21 = objc_msgSend_rangeOfComposedCharacterSequenceAtIndex_(v7, v17, 0, v18, v19, v20);
      v25 = v22;
      if ((unint64_t)v22 <= 1)
      {
        uint64_t v26 = v21;
        uint64_t v27 = objc_msgSend_substringWithRange_(v7, v22, v21, (uint64_t)v22, v23, v24);
        v32 = objc_msgSend_substringFromIndex_(v7, v28, (uint64_t)&v25[v26], v29, v30, v31);
        unsigned int v37 = objc_msgSend_characterAtIndex_(v27, v33, 0, v34, v35, v36);
        v38 = sub_1C4BF846C((uint64_t)v15, v8, v37);
        uint64_t v16 = objc_msgSend_newCursorByAdvancingWithString_fromCursor_inNetwork_(CHPatternNetwork, v39, (uint64_t)v32, (uint64_t)v38, (uint64_t)v15, v40);

        goto LABEL_9;
      }
    }
    uint64_t v16 = 0;
  }
LABEL_9:

  return v16;
}

+ (id)newCursorByAdvancingWithSymbol:(unint64_t)a3 fromCursor:(id)a4 inNetwork:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = v8;
  uint64_t v10 = 0;
  if (v7 && v8)
  {
    if (v7[2] == v7[1])
    {
LABEL_7:
      uint64_t v10 = 0;
      goto LABEL_8;
    }
    uint64_t v11 = sub_1C4BF846C((uint64_t)v8, v7, a3);
    uint64_t v10 = v11;
    if (!v11 || v11->_nodeIndexes.__end_ == v11->_nodeIndexes.__begin_)
    {

      goto LABEL_7;
    }
  }
LABEL_8:

  return v10;
}

- (CHPatternNetwork)initWithFile:(id)a3
{
  uint64_t v202 = *MEMORY[0x1E4F143B8];
  v197.receiver = self;
  v197.super_class = (Class)CHPatternNetwork;
  id v166 = a3;
  v169 = [(CHPatternNetwork *)&v197 init];
  id v167 = v166;
  id v8 = (const char *)objc_msgSend_UTF8String(v167, v3, v4, v5, v6, v7);
  if (pathForResource(v8, 0, __s)) {
    operator new();
  }
  objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v9, v10, v11, v12, v13);
  id v176 = (id)objc_claimAutoreleasedReturnValue();
  long long v195 = 0u;
  long long v196 = 0u;
  long long v193 = 0u;
  long long v194 = 0u;
  self;
  objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x1E4F1C9E8], v14, (uint64_t)&unk_1F203F2D0, v15, v16, v17, @"0x61a649a", &unk_1F203F1C8, @"0x34f55ec", &unk_1F203F228, @"0x7f7446f", &unk_1F203F300, @"0xe6b391a", &unk_1F203F1E0, @"0x08d4b39", &unk_1F203F1F8, @"0xbdde29e", &unk_1F203F198, @"0x633a6c7",
    &unk_1F203F1B0,
    @"0x346ff32",
    &unk_1F203F258,
    @"0xf9be5b7",
    &unk_1F203F210,
    @"0xf9dd946",
    &unk_1F203F2A0,
    @"0x27087b3",
    &unk_1F203F330,
    @"0x5fb9dc5",
    &unk_1F203F348,
    @"0xcf06682",
    &unk_1F203F360,
    @"0xcff9621",
  uint64_t v18 = 0);
  obuint64_t j = v18;
  uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v193, (uint64_t)v200, 16, v20);
  if (v25)
  {
    uint64_t v26 = *(void *)v194;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v194 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v28 = *(void *)(*((void *)&v193 + 1) + 8 * i);
        uint64_t v29 = objc_msgSend_scannerWithString_(MEMORY[0x1E4F28FE8], v21, v28, v22, v23, v24);
        unsigned int v192 = 0;
        objc_msgSend_scanHexInt_(v29, v30, (uint64_t)&v192, v31, v32, v33);
        v38 = objc_msgSend_numberWithInt_(NSNumber, v34, v192, v35, v36, v37);
        self;
        objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x1E4F1C9E8], v39, (uint64_t)&unk_1F203F2D0, v40, v41, v42, @"0x61a649a", &unk_1F203F1C8, @"0x34f55ec", &unk_1F203F228, @"0x7f7446f", &unk_1F203F300, @"0xe6b391a", &unk_1F203F1E0, @"0x08d4b39", &unk_1F203F1F8, @"0xbdde29e", &unk_1F203F198, @"0x633a6c7",
          &unk_1F203F1B0,
          @"0x346ff32",
          &unk_1F203F258,
          @"0xf9be5b7",
          &unk_1F203F210,
          @"0xf9dd946",
          &unk_1F203F2A0,
          @"0x27087b3",
          &unk_1F203F330,
          @"0x5fb9dc5",
          &unk_1F203F348,
          @"0xcf06682",
          &unk_1F203F360,
          @"0xcff9621",
        v43 = 0);
        v48 = objc_msgSend_objectForKeyedSubscript_(v43, v44, v28, v45, v46, v47);
        objc_msgSend_setObject_forKeyedSubscript_(v176, v49, (uint64_t)v48, (uint64_t)v38, v50, v51);
      }
      uint64_t v18 = obj;
      uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v21, (uint64_t)&v193, (uint64_t)v200, 16, v24);
    }
    while (v25);
  }

  objc_storeStrong((id *)&v169->_symbols, v176);
  v168 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v52, v53, v54, v55, v56);
  networuint64_t k = v169->_network;
  uint64_t v62 = network[10];
  if (network[11] != v62)
  {
    uint64_t v63 = 0;
    unint64_t v64 = 0;
    do
    {
      v65 = (void *)(v62 + v63);
      uint64_t v66 = v65[2];
      if (v66 == v65[3])
      {
        uint64_t v67 = v65[1];
        symbols = v169->_symbols;
        v69 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v57, v66, v58, v59, v60);
        v74 = objc_msgSend_objectForKey_(symbols, v70, (uint64_t)v69, v71, v72, v73);

        if (v74)
        {
          v79 = objc_msgSend_numberWithLong_(NSNumber, v75, v67, v76, v77, v78);
          objc_msgSend_setObject_forKey_(v168, v80, (uint64_t)v79, (uint64_t)v74, v81, v82);
        }
        networuint64_t k = v169->_network;
      }
      ++v64;
      uint64_t v62 = network[10];
      v63 += 72;
    }
    while (v64 < 0x8E38E38E38E38E39 * ((network[11] - v62) >> 3));
  }
  obja = (void **)&v169->_startNodes;
  objc_storeStrong((id *)&v169->_startNodes, v168);
  objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v83, v84, v85, v86, v87);
  v171 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  self;
  v92 = objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x1E4F1C9E8], v88, (uint64_t)&unk_1F203DDD0, v89, v90, v91, &unk_1F203F240, &unk_1F203DDE8, &unk_1F203F270, &unk_1F203DE00, &unk_1F203F288, &unk_1F203DE18, &unk_1F203F2B8, &unk_1F203DE30, &unk_1F203F2E8, &unk_1F203DE48, &unk_1F203F318, 0);
  long long v190 = 0u;
  long long v191 = 0u;
  long long v188 = 0u;
  long long v189 = 0u;
  v98 = objc_msgSend_allKeys(v92, v93, v94, v95, v96, v97);
  uint64_t v105 = objc_msgSend_countByEnumeratingWithState_objects_count_(v98, v99, (uint64_t)&v188, (uint64_t)v199, 16, v100);
  if (v105)
  {
    uint64_t v170 = *(void *)v189;
    v179 = v92;
    do
    {
      uint64_t v175 = 0;
      uint64_t v172 = v105;
      do
      {
        if (*(void *)v189 != v170) {
          objc_enumerationMutation(v98);
        }
        uint64_t v106 = *(void *)(*((void *)&v188 + 1) + 8 * v175);
        v174 = objc_msgSend_objectForKey_(v92, v101, v106, v102, v103, v104);
        uint64_t v173 = v106;
        v181 = objc_alloc_init(NetworkCursor);
        long long v186 = 0u;
        long long v187 = 0u;
        long long v184 = 0u;
        long long v185 = 0u;
        id v178 = v174;
        uint64_t v113 = objc_msgSend_countByEnumeratingWithState_objects_count_(v178, v107, (uint64_t)&v184, (uint64_t)v198, 16, v108);
        if (v113)
        {
          uint64_t v180 = *(void *)v185;
          p_begin = (void **)&v181->_nodeIndexes.__begin_;
          if (v181)
          {
            while (1)
            {
              for (uint64_t j = 0; j != v113; ++j)
              {
                if (*(void *)v185 != v180) {
                  objc_enumerationMutation(v178);
                }
                uint64_t v117 = *(void *)(*((void *)&v184 + 1) + 8 * j);
                v118 = objc_msgSend_objectForKey_(*obja, v109, v117, v110, v111, v112);
                BOOL v119 = v118 == 0;

                if (!v119)
                {
                  uint64_t v120 = v113;
                  v121 = v98;
                  v122 = objc_msgSend_objectForKey_(*obja, v109, v117, v110, v111, v112);
                  uint64_t v128 = objc_msgSend_unsignedLongValue(v122, v123, v124, v125, v126, v127);

                  end = (char *)v181->_nodeIndexes.__end_;
                  value = v181->_nodeIndexes.__end_cap_.__value_;
                  if (end >= (char *)value)
                  {
                    v131 = (char *)*p_begin;
                    uint64_t v132 = end - (unsigned char *)*p_begin;
                    uint64_t v133 = v132 >> 3;
                    unint64_t v134 = (v132 >> 3) + 1;
                    if (v134 >> 61) {
                      sub_1C494A220();
                    }
                    uint64_t v135 = (char *)value - v131;
                    if (v135 >> 2 > v134) {
                      unint64_t v134 = v135 >> 2;
                    }
                    if ((unint64_t)v135 >= 0x7FFFFFFFFFFFFFF8) {
                      unint64_t v136 = 0x1FFFFFFFFFFFFFFFLL;
                    }
                    else {
                      unint64_t v136 = v134;
                    }
                    if (v136)
                    {
                      if (v136 >> 61) {
                        sub_1C4949AA8();
                      }
                      v137 = operator new(8 * v136);
                      v138 = (uint64_t *)&v137[8 * v133];
                      uint64_t *v138 = v128;
                      uint64_t v115 = (uint64_t)(v138 + 1);
                      int64_t v139 = end - v131;
                      if (end != v131)
                      {
LABEL_41:
                        unint64_t v140 = v139 - 8;
                        v116 = v181;
                        if (v140 < 0x58)
                        {
                          uint64_t v113 = v120;
                          goto LABEL_49;
                        }
                        unint64_t v141 = end - v137 - v132;
                        uint64_t v113 = v120;
                        if (v141 < 0x20) {
                          goto LABEL_70;
                        }
                        uint64_t v142 = (v140 >> 3) + 1;
                        uint64_t v143 = 8 * (v142 & 0x3FFFFFFFFFFFFFFCLL);
                        v144 = &end[-v143];
                        v138 = (uint64_t *)((char *)v138 - v143);
                        v145 = &v137[8 * v133 - 16];
                        v146 = end - 16;
                        uint64_t v147 = v142 & 0x3FFFFFFFFFFFFFFCLL;
                        do
                        {
                          long long v148 = *(_OWORD *)v146;
                          *(v145 - 1) = *((_OWORD *)v146 - 1);
                          _OWORD *v145 = v148;
                          v145 -= 2;
                          v146 -= 32;
                          v147 -= 4;
                        }
                        while (v147);
                        end = v144;
                        if (v142 != (v142 & 0x3FFFFFFFFFFFFFFCLL))
                        {
LABEL_70:
                          do
                          {
LABEL_49:
                            uint64_t v149 = *((void *)end - 1);
                            end -= 8;
                            *--v138 = v149;
                          }
                          while (end != v131);
                        }
LABEL_50:
                        v116->_nodeIndexes.__begin_ = (unint64_t *)v138;
                        v116->_nodeIndexes.__end_ = (unint64_t *)v115;
                        v116->_nodeIndexes.__end_cap_.__value_ = (unint64_t *)&v137[8 * v136];
                        if (v131) {
                          operator delete(v131);
                        }
                        v98 = v121;
LABEL_26:
                        v116->_nodeIndexes.__end_ = (unint64_t *)v115;
                        v92 = v179;
                        continue;
                      }
                    }
                    else
                    {
                      v137 = 0;
                      v138 = (uint64_t *)(8 * v133);
                      *(void *)(8 * v133) = v128;
                      uint64_t v115 = 8 * v133 + 8;
                      int64_t v139 = end - v131;
                      if (end != v131) {
                        goto LABEL_41;
                      }
                    }
                    uint64_t v113 = v120;
                    v116 = v181;
                    goto LABEL_50;
                  }
                  *(void *)end = v128;
                  uint64_t v115 = (uint64_t)(end + 8);
                  v116 = v181;
                  goto LABEL_26;
                }
              }
              uint64_t v113 = objc_msgSend_countByEnumeratingWithState_objects_count_(v178, v109, (uint64_t)&v184, (uint64_t)v198, 16, v112);
              if (!v113) {
                goto LABEL_54;
              }
            }
          }
          do
          {
            for (uint64_t k = 0; k != v113; ++k)
            {
              if (*(void *)v185 != v180) {
                objc_enumerationMutation(v178);
              }
              uint64_t v154 = *(void *)(*((void *)&v184 + 1) + 8 * k);
              v155 = objc_msgSend_objectForKey_(*obja, v109, v154, v110, v111, v112);
              BOOL v156 = v155 == 0;

              if (!v156)
              {
                v157 = objc_msgSend_objectForKey_(*obja, v109, v154, v110, v111, v112);
                objc_msgSend_unsignedLongValue(v157, v158, v159, v160, v161, v162);
              }
            }
            uint64_t v113 = objc_msgSend_countByEnumeratingWithState_objects_count_(v178, v109, (uint64_t)&v184, (uint64_t)v198, 16, v112);
          }
          while (v113);
        }
LABEL_54:

        objc_msgSend_setObject_forKey_(v171, v150, (uint64_t)v181, v173, v151, v152);
        ++v175;
      }
      while (v175 != v172);
      uint64_t v163 = objc_msgSend_countByEnumeratingWithState_objects_count_(v98, v101, (uint64_t)&v188, (uint64_t)v199, 16, v104);
      uint64_t v105 = v163;
    }
    while (v163);
  }

  startCursorForContentTypes = v169->_startCursorForContentTypes;
  v169->_startCursorForContentTypes = v171;

  return v169;
}

+ (BOOL)isString:(id)a3 fullPattern:(int64_t)a4 inNetwork:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v11 = objc_msgSend_rootCursorForPatternType_inNetwork_forFirstSegmentGroup_(CHPatternNetwork, v9, a4, (uint64_t)v8, 0, v10);
  uint64_t v14 = objc_msgSend_newCursorByAdvancingWithString_fromCursor_inNetwork_(CHPatternNetwork, v12, (uint64_t)v7, (uint64_t)v11, (uint64_t)v8, v13);

  LOBYTE(v11) = objc_msgSend_isCompletePattern(v14, v15, v16, v17, v18, v19);
  return (char)v11;
}

- (void)dealloc
{
  networuint64_t k = self->_network;
  if (network)
  {
    uint64_t v4 = sub_1C4999ABC((uint64_t)network);
    MEMORY[0x1C8786460](v4, 0x10B2C40ACD43ABBLL);
    self->_networuint64_t k = 0;
  }
  symbols = self->_symbols;
  if (symbols)
  {
    self->_symbols = 0;
  }
  startNodes = self->_startNodes;
  if (startNodes)
  {
    self->_startNodes = 0;
  }
  startCursorForContentTypes = self->_startCursorForContentTypes;
  if (startCursorForContentTypes)
  {
    self->_startCursorForContentTypes = 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)CHPatternNetwork;
  [(CHPatternNetwork *)&v8 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startCursorForContentTypes, 0);
  objc_storeStrong((id *)&self->_startNodes, 0);
  objc_storeStrong((id *)&self->_symbols, 0);
}

@end