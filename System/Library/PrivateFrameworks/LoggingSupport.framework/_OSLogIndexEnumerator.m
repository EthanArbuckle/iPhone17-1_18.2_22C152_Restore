@interface _OSLogIndexEnumerator
- (NSMutableArray)oversizeChunks;
- (_OSLogIndexEnumerator)initWithIndex:(id)a3 metadata:(id *)a4 fileBootList:(id)a5 catalogFilter:(id)a6;
- (_OSLogTracepointBuffer)tracepoints;
- (void)_initTimesyncBounds:(id *)a3;
- (void)dealloc;
- (void)enumerateTracepointsInRange:(os_timesync_range_s *)a3 timesync:(_os_timesync_db_s *)a4 options:(unsigned int)a5 usingBlock:(id)a6;
@end

@implementation _OSLogIndexEnumerator

- (_OSLogTracepointBuffer)tracepoints
{
  return self->_tracepoints;
}

- (void)enumerateTracepointsInRange:(os_timesync_range_s *)a3 timesync:(_os_timesync_db_s *)a4 options:(unsigned int)a5 usingBlock:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  uint64_t v151 = *MEMORY[0x1E4F143B8];
  id v114 = a6;
  v120 = a3;
  if (a3->var0) {
    uint64_t v9 = *((void *)a3->var0 + 3);
  }
  else {
    uint64_t v9 = 0;
  }
  v135[0] = 0;
  v135[1] = v135;
  v135[2] = 0x2020000000;
  char v136 = 0;
  uint64_t v10 = *((void *)a4 + 10);
  v137[0] = 0;
  v137[1] = v10;
  if (!v9) {
    goto LABEL_185;
  }
  if ((v6 & 8) != 0) {
    uint64_t v11 = v9 - 1;
  }
  else {
    uint64_t v11 = 0;
  }
  uint64_t v116 = 0;
  if ((v6 & 8) != 0) {
    uint64_t v12 = -1;
  }
  else {
    uint64_t v12 = 0;
  }
  uint64_t v112 = v12;
  p_var1 = &a3->var1;
  v109 = &a3->var1;
  p_var2 = &a3->var2;
  if ((v6 & 8) != 0) {
    p_var1 = &a3->var2;
  }
  v108 = p_var1;
  uint64_t v14 = 1;
  if ((v6 & 8) != 0) {
    uint64_t v14 = -1;
  }
  uint64_t v111 = v14;
  do
  {
    uint64_t v118 = v9;
    v15 = (char *)v120 + 16 * v11;
    long long v150 = *(_OWORD *)(v15 + 24);
    uint64_t v115 = v11;
    v137[0] = v11;
    v16 = self;
    unint64_t v17 = _os_trace_uuid_map_lookup(v120->var0, &v150);
    v18 = [(NSMutableArray *)self->_fileBootQ firstObject];
    if (v18)
    {
      do
      {
        unint64_t v19 = _os_trace_uuid_map_lookup(v120->var0, (void *)[v18 bootUUID]);
        if (v19 == v17) {
          break;
        }
        if ((v6 & 8) != 0)
        {
          if (v19 <= v17) {
            break;
          }
        }
        else if (v19 >= v17)
        {
          break;
        }
        [(NSMutableArray *)self->_fileBootQ removeObjectAtIndex:0];
        uint64_t v20 = [(NSMutableArray *)self->_fileBootQ firstObject];

        v18 = (void *)v20;
      }
      while (v20);
    }
    v119 = v16;
    v21 = [(NSMutableArray *)self->_fileBootQ firstObject];
    if (v21)
    {
      do
      {
        v22 = (_OWORD *)[v21 bootUUID];
        if (*v22 != v150) {
          break;
        }
        [(NSMutableArray *)self->_fileBootQ removeObjectAtIndex:0];
        if ([v21 _determineTimespan])
        {
          [(NSMutableArray *)self->_fileStartQ addObject:v21];
          [(NSMutableArray *)self->_fileEndQ addObject:v21];
        }
        uint64_t v23 = [(NSMutableArray *)self->_fileBootQ firstObject];

        v21 = (void *)v23;
      }
      while (v23);
    }
    [(NSMutableArray *)self->_fileStartQ sortUsingFunction:_OSLogIndexOrderForOpening context:v6];
    [(NSMutableArray *)self->_fileEndQ sortUsingFunction:_OSLogIndexOrderForClosing context:v6];

    uint64_t v131 = 0;
    v132 = &v131;
    unint64_t v24 = v112;
    uint64_t v133 = 0x2020000000;
    if (!v116) {
      unint64_t v24 = *v108;
    }
    unint64_t v134 = v24;
    v25 = [(NSMutableArray *)self->_fileStartQ firstObject];
    v26 = v25;
    if (!v25 || (v27 = (void *)[v25 bootUUID], *v27 != *((void *)v15 + 3)))
    {

      goto LABEL_177;
    }
    BOOL v28 = v27[1] == *((void *)v15 + 4);

    if (!v28) {
      goto LABEL_177;
    }
    [(_OSLogTracepointBuffer *)self->_tracepoints beginInsertingTracepointsClippingFromTime:0];
    for (uint64_t i = 0; i != 6; ++i)
    {
      v30 = self->_bounds[i];
      if (v30 && *(_OWORD *)&v30->var3[0][0] == v150) {
        [(_OSLogTracepointBuffer *)self->_tracepoints insertNonsparsePoint:v30->var1 uuid:v30->var3 ttl:(0x1E0E07030100uLL >> (8 * i)) & 0x1F inMemory:0];
      }
    }
    live_bound = self->_live_bound;
    if (live_bound && *(_OWORD *)&live_bound->var3[0][0] == v150) {
      [(_OSLogTracepointBuffer *)self->_tracepoints insertNonsparsePoint:live_bound->var1 uuid:live_bound->var3 ttl:0 inMemory:1];
    }
    [(_OSLogTracepointBuffer *)self->_tracepoints insertTimesyncPoints:a4 forBoot:&v150 oldestContinuousTime:v132[3]];
    uint64_t v32 = [(_OSLogTracepointBuffer *)self->_tracepoints finishedInsertingTracepointsWithNextMajorTime:0 options:v6];
    uint64_t v127 = 0;
    v128 = &v127;
    uint64_t v129 = 0x2020000000;
    char v130 = 1;
    while (2)
    {
      context = (void *)MEMORY[0x1A622D720](v32);
      unint64_t v33 = v132[3];
      v34 = v119;
      [(_OSLogTracepointBuffer *)self->_tracepoints beginInsertingTracepointsClippingFromTime:v33];
      v35 = [(NSMutableArray *)self->_fileStartQ firstObject];
      if (!v35) {
        goto LABEL_68;
      }
      v36 = [(NSMutableArray *)self->_fileStartQ firstObject];
      v37 = v36;
      BOOL v38 = (v6 & 8) != 0 ? [v36 endTime] < v33 : objc_msgSend(v36, "oldestTime") > v33;

      if (v38) {
        goto LABEL_68;
      }
      v113 = v34;
      v39 = [(NSMutableArray *)self->_fileStartQ firstObject];
      if (!v39) {
        goto LABEL_67;
      }
      while (1)
      {
        v40 = (_OWORD *)[v39 bootUUID];
        if (*v40 == v150) {
          break;
        }
        [(NSMutableArray *)self->_fileStartQ removeObjectAtIndex:0];
        uint64_t v41 = [(NSMutableArray *)self->_fileStartQ firstObject];

        v39 = (void *)v41;
        if (!v41) {
          goto LABEL_67;
        }
      }
      while (1)
      {
        v42 = (_OWORD *)[v39 bootUUID];
        if (*v42 != v150)
        {
          v44 = v39;
          goto LABEL_66;
        }
        id v43 = v39;
        v44 = v43;
        if ((v6 & 8) != 0) {
          break;
        }
        if ([v43 oldestTime] > v33) {
          goto LABEL_65;
        }

        if ([v44 endTime] >= v33)
        {
LABEL_59:
          uint64_t v138 = 0;
          v45 = v113;
          id v46 = v44;
          v47 = (void *)[v46 copyMappedChunkStore:&v138];
          if (v47)
          {
            v48 = v45;
            id v49 = v47;
            v149[0] = 0;
            v149[1] = v149;
            v149[2] = 0x2020000000;
            v149[3] = 0;
            v147[0] = 0;
            v147[1] = v147;
            v147[2] = 0x3032000000;
            v147[3] = __Block_byref_object_copy_;
            v147[4] = __Block_byref_object_dispose_;
            id v148 = 0;
            uint64_t v139 = MEMORY[0x1E4F143A8];
            uint64_t v140 = 3221225472;
            v141 = ___oie_advance_cursor_open_store_block_invoke;
            v142 = &unk_1E5A42488;
            v145 = v149;
            v146 = v147;
            v50 = (_OSLogIndexEnumerator *)v49;
            v143 = v50;
            v51 = v48;
            v144 = v51;
            [(_OSLogIndexEnumerator *)v50 enumerateChunksUsingBlock:&v139];
            [(NSMutableArray *)self->_catalogStartQ sortUsingFunction:_OSLogIndexOrderForOpening context:v6];

            _Block_object_dispose(v147, 8);
            _Block_object_dispose(v149, 8);
          }
        }
LABEL_62:
        [(NSMutableArray *)self->_fileStartQ removeObjectAtIndex:0];
        v39 = [(NSMutableArray *)self->_fileStartQ firstObject];

        if (!v39)
        {
          v44 = 0;
          goto LABEL_66;
        }
      }
      if ([v43 endTime] >= v33)
      {

        if ([v44 oldestTime] <= v33) {
          goto LABEL_59;
        }
        goto LABEL_62;
      }
LABEL_65:

LABEL_66:
LABEL_67:

LABEL_68:
      v52 = [(NSMutableArray *)self->_catalogStartQ firstObject];
      if (!v52) {
        goto LABEL_93;
      }
      v53 = [(NSMutableArray *)self->_catalogStartQ firstObject];
      v54 = v53;
      BOOL v55 = (v6 & 8) != 0 ? [v53 endTime] < v33 : objc_msgSend(v53, "oldestTime") > v33;

      if (v55) {
        goto LABEL_93;
      }
      v56 = v34;
      v57 = [(NSMutableArray *)self->_catalogStartQ firstObject];
      v58 = v57;
      if (!v57) {
        goto LABEL_92;
      }
      if ((v6 & 8) == 0)
      {
        if ([v57 oldestTime] <= v33) {
          goto LABEL_78;
        }
LABEL_186:
        qword_1E953C2E8 = (uint64_t)"BUG IN LIBTRACE: _oie_advance_cursor_open_catalogs called with nothing to open yet";
        __break(1u);
LABEL_187:
        qword_1E953C2E8 = (uint64_t)"BUG IN LIBTRACE: _oie_advance_cursor_open_subchunks called with nothing to open yet";
        __break(1u);
        goto LABEL_188;
      }
      if ([v57 endTime] < v33) {
        goto LABEL_186;
      }
LABEL_78:
      while (2)
      {
        id v59 = v58;
        v60 = v59;
        if ((v6 & 8) == 0)
        {
          if ([v59 oldestTime] > v33) {
            goto LABEL_90;
          }

          if ([v60 endTime] < v33) {
            goto LABEL_88;
          }
LABEL_84:
          if (!self->_catalogFilter
            || (id v61 = v60, [v61 catalog])
            && -[_OSLogCatalogFilter isKeptCatalog:](self->_catalogFilter, "isKeptCatalog:", [v61 catalog]))
          {
            v62 = v56;
            uint64_t v139 = MEMORY[0x1E4F143A8];
            uint64_t v140 = 3221225472;
            v141 = ___oie_advance_cursor_open_catalog_block_invoke;
            v142 = &unk_1E5A424B0;
            v143 = v62;
            [v60 enumerateSubchunksUsingBlock:&v139];
          }
LABEL_88:
          [(NSMutableArray *)self->_catalogStartQ removeObjectAtIndex:0];
          v58 = [(NSMutableArray *)self->_catalogStartQ firstObject];

          if (!v58)
          {
            v60 = 0;
            goto LABEL_91;
          }
          continue;
        }
        break;
      }
      if ([v59 endTime] >= v33)
      {

        if ([v60 oldestTime] <= v33) {
          goto LABEL_84;
        }
        goto LABEL_88;
      }
LABEL_90:

LABEL_91:
      [(NSMutableArray *)self->_subchunkStartQ sortUsingFunction:_OSLogIndexOrderForOpening context:v6];
      [(NSMutableArray *)self->_subchunkEndQ sortUsingFunction:_OSLogIndexOrderForClosing context:v6];

LABEL_92:
LABEL_93:
      v63 = [(NSMutableArray *)self->_subchunkStartQ firstObject];
      if (!v63) {
        goto LABEL_114;
      }
      v64 = [(NSMutableArray *)self->_subchunkStartQ firstObject];
      v65 = v64;
      BOOL v66 = (v6 & 8) != 0 ? [v64 endTime] < v33 : objc_msgSend(v64, "oldestTime") > v33;

      if (v66) {
        goto LABEL_114;
      }
      v67 = v34;
      v68 = [(NSMutableArray *)self->_subchunkStartQ firstObject];
      v69 = v68;
      if (!v68) {
        goto LABEL_113;
      }
      if ((v6 & 8) == 0)
      {
        if ([v68 oldestTime] <= v33) {
          goto LABEL_103;
        }
        goto LABEL_187;
      }
      if ([v68 endTime] < v33) {
        goto LABEL_187;
      }
LABEL_103:
      while (2)
      {
        id v70 = v69;
        v71 = v70;
        if ((v6 & 8) == 0)
        {
          if ([v70 oldestTime] > v33) {
            goto LABEL_112;
          }

          if ([v71 endTime] < v33) {
            goto LABEL_110;
          }
LABEL_109:
          v72 = v67;
          v73 = v71;
          uint64_t v139 = MEMORY[0x1E4F143A8];
          uint64_t v140 = 3221225472;
          v141 = ___oie_advance_cursor_open_subchunk_block_invoke;
          v142 = &unk_1E5A424D8;
          v143 = v72;
          v144 = v73;
          LODWORD(v145) = v6;
          [(_OSLogIndexEnumerator *)v73 enumerateChunksUsingBlock:&v139];

LABEL_110:
          [(NSMutableArray *)self->_subchunkStartQ removeObjectAtIndex:0];
          v69 = [(NSMutableArray *)self->_subchunkStartQ firstObject];

          if (!v69) {
            goto LABEL_113;
          }
          continue;
        }
        break;
      }
      if ([v70 endTime] >= v33)
      {

        if ([v71 oldestTime] <= v33) {
          goto LABEL_109;
        }
        goto LABEL_110;
      }
LABEL_112:

LABEL_113:
LABEL_114:
      v74 = [(NSMutableArray *)self->_subchunkEndQ firstObject];
      if (!v74) {
        goto LABEL_132;
      }
      v75 = [(NSMutableArray *)self->_subchunkEndQ firstObject];
      v76 = v75;
      if ((v6 & 8) != 0)
      {
        BOOL v78 = [v75 oldestTime] > v33;

        if (!v78) {
          goto LABEL_132;
        }
      }
      else
      {
        BOOL v77 = [v75 endTime] < v33;

        if (!v77) {
          goto LABEL_132;
        }
      }
      v79 = v34;
      v80 = [(NSMutableArray *)self->_subchunkEndQ firstObject];
      v81 = v80;
      if (!v80) {
        goto LABEL_131;
      }
      if ((v6 & 8) == 0)
      {
        if ([v80 endTime] < v33) {
          goto LABEL_124;
        }
LABEL_188:
        qword_1E953C2E8 = (uint64_t)"BUG IN LIBTRACE: _oie_advance_cursor_close_subchunks called with nothing to close";
        __break(1u);
LABEL_189:
        qword_1E953C2E8 = (uint64_t)"BUG IN LIBTRACE: _oie_advance_cursor_close_files called with nothing to close";
        __break(1u);
        goto LABEL_190;
      }
      if ([v80 oldestTime] <= v33) {
        goto LABEL_188;
      }
LABEL_124:
      while (2)
      {
        id v82 = v81;
        v83 = v82;
        if ((v6 & 8) == 0)
        {
          if ([v82 endTime] >= v33) {
            break;
          }
          goto LABEL_128;
        }
        if ([v82 oldestTime] > v33)
        {
LABEL_128:

          [(NSMutableArray *)self->_subchunkEndQ removeObjectAtIndex:0];
          v81 = [(NSMutableArray *)self->_subchunkEndQ firstObject];

          if (!v81) {
            goto LABEL_131;
          }
          continue;
        }
        break;
      }

LABEL_131:
LABEL_132:
      v84 = [(NSMutableArray *)self->_fileEndQ firstObject];
      if (!v84) {
        goto LABEL_150;
      }
      v85 = [(NSMutableArray *)self->_fileEndQ firstObject];
      v86 = v85;
      if ((v6 & 8) != 0)
      {
        BOOL v88 = [v85 oldestTime] > v33;

        if (!v88) {
          goto LABEL_150;
        }
      }
      else
      {
        BOOL v87 = [v85 endTime] < v33;

        if (!v87) {
          goto LABEL_150;
        }
      }
      v89 = v34;
      v90 = [(NSMutableArray *)self->_fileEndQ firstObject];
      v91 = v90;
      if (!v90) {
        goto LABEL_149;
      }
      if ((v6 & 8) == 0)
      {
        if ([v90 endTime] < v33) {
          goto LABEL_142;
        }
        goto LABEL_189;
      }
      if ([v90 oldestTime] <= v33) {
        goto LABEL_189;
      }
LABEL_142:
      while (2)
      {
        id v92 = v91;
        v93 = v92;
        if ((v6 & 8) == 0)
        {
          if ([v92 endTime] >= v33) {
            break;
          }
          goto LABEL_146;
        }
        if ([v92 oldestTime] > v33)
        {
LABEL_146:

          [(NSMutableArray *)self->_fileEndQ removeObjectAtIndex:0];
          v91 = [(NSMutableArray *)self->_fileEndQ firstObject];

          if (!v91) {
            goto LABEL_149;
          }
          continue;
        }
        break;
      }

LABEL_149:
LABEL_150:
      unint64_t next_major_time = _oie_get_next_major_time(v34, v6, &v150);
      [(_OSLogTracepointBuffer *)self->_tracepoints finishedInsertingTracepointsWithNextMajorTime:next_major_time options:v6];
      [(NSMutableArray *)self->_oversizeChunks sortUsingSelector:sel_compare_];
      v95 = v34;
      v96 = [(NSMutableArray *)self->_oversizeChunks firstObject];
      if (v96)
      {
        do
        {
          unint64_t v97 = [v96 timestamp];
          if (v97 == v33) {
            break;
          }
          if ((v6 & 8) != 0)
          {
            if (v97 <= v33) {
              break;
            }
          }
          else if (v97 >= v33)
          {
            break;
          }
          [(NSMutableArray *)self->_oversizeChunks removeObjectAtIndex:0];
          uint64_t v98 = [(NSMutableArray *)self->_oversizeChunks firstObject];

          v96 = (void *)v98;
        }
        while (v98);
      }
      if (v118 == 1)
      {
        if ((v6 & 8) != 0)
        {
          if (next_major_time <= *v109) {
            unint64_t next_major_time = *v109;
          }
        }
        else if (next_major_time >= *p_var2)
        {
          unint64_t next_major_time = *p_var2;
        }
      }
      tracepoints = self->_tracepoints;
      uint64_t v100 = v132[3];
      v121[0] = MEMORY[0x1E4F143A8];
      v121[1] = 3221225472;
      v121[2] = __81___OSLogIndexEnumerator_enumerateTracepointsInRange_timesync_options_usingBlock___block_invoke;
      v121[3] = &unk_1E5A42338;
      v123 = &v131;
      v124 = v135;
      id v101 = v114;
      v126 = v137;
      id v122 = v101;
      v125 = &v127;
      [(_OSLogTracepointBuffer *)tracepoints enumerateEventsFromTime:v100 to:next_major_time options:v6 usingBlock:v121];
      unint64_t v102 = v132[3];
      if (v102 >= next_major_time) {
        unint64_t v103 = next_major_time;
      }
      else {
        unint64_t v103 = v132[3];
      }
      if (v102 <= next_major_time) {
        unint64_t v102 = next_major_time;
      }
      if ((v6 & 8) != 0) {
        unint64_t v102 = v103;
      }
      v132[3] = v102;

      if (*((unsigned char *)v128 + 24))
      {
        unint64_t v104 = v132[3];
        v105 = v95;
        unint64_t v106 = _oie_get_next_major_time(v105, v6, &v150);
        if (v106 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          if (v106 == v104)
          {

            continue;
          }
          if ((v6 & 8) != 0)
          {
            if (v106 > v104) {
              goto LABEL_190;
            }
          }
          else if (v106 < v104)
          {
LABEL_190:
            qword_1E953C2E8 = (uint64_t)"BUG IN LIBTRACE: iteration skipped a major time";
            __break(1u);
          }
        }
      }
      break;
    }
    _Block_object_dispose(&v127, 8);
LABEL_177:
    _Block_object_dispose(&v131, 8);
    uint64_t v11 = v115 + v111;
    ++v116;
    uint64_t v9 = v118 - 1;
  }
  while (v118 != 1);
LABEL_185:
  _Block_object_dispose(v135, 8);
}

- (void)_initTimesyncBounds:(id *)a3
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  [(_OSLogIndex *)self->_index timesync];
  _timesync_range_create_impl();
}

- (_OSLogIndexEnumerator)initWithIndex:(id)a3 metadata:(id *)a4 fileBootList:(id)a5 catalogFilter:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v33.receiver = self;
  v33.super_class = (Class)_OSLogIndexEnumerator;
  uint64_t v14 = [(_OSLogIndexEnumerator *)&v33 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_index, a3);
    v16 = objc_alloc_init(_OSLogTracepointBuffer);
    tracepoints = v15->_tracepoints;
    v15->_tracepoints = v16;

    uint64_t v18 = [v12 mutableCopy];
    fileBootQ = v15->_fileBootQ;
    v15->_fileBootQ = (NSMutableArray *)v18;

    uint64_t v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    fileStartQ = v15->_fileStartQ;
    v15->_fileStartQ = v20;

    v22 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    fileEndQ = v15->_fileEndQ;
    v15->_fileEndQ = v22;

    unint64_t v24 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    catalogStartQ = v15->_catalogStartQ;
    v15->_catalogStartQ = v24;

    v26 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    subchunkStartQ = v15->_subchunkStartQ;
    v15->_subchunkStartQ = v26;

    BOOL v28 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    subchunkEndQ = v15->_subchunkEndQ;
    v15->_subchunkEndQ = v28;

    v30 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    oversizeChunks = v15->_oversizeChunks;
    v15->_oversizeChunks = v30;

    objc_storeStrong((id *)&v15->_catalogFilter, a6);
    if (a4) {
      [(_OSLogIndexEnumerator *)v15 _initTimesyncBounds:a4];
    }
  }

  return v15;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  for (uint64_t i = 64; i != 112; i += 8)
  {
    v4 = *(void ****)((char *)&self->super.isa + i);
    if (v4)
    {
      _os_trace_uuid_map_destroy(*v4);
      free(v4);
    }
  }
  live_bound = (void ***)self->_live_bound;
  if (live_bound)
  {
    _os_trace_uuid_map_destroy(*live_bound);
    free(live_bound);
  }
  v6.receiver = self;
  v6.super_class = (Class)_OSLogIndexEnumerator;
  [(_OSLogIndexEnumerator *)&v6 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tracepoints, 0);
  objc_storeStrong((id *)&self->_catalogFilter, 0);
  objc_storeStrong((id *)&self->_index, 0);
  objc_storeStrong((id *)&self->_oversizeChunks, 0);
  objc_storeStrong((id *)&self->_fileBootQ, 0);
  objc_storeStrong((id *)&self->_fileEndQ, 0);
  objc_storeStrong((id *)&self->_fileStartQ, 0);
  objc_storeStrong((id *)&self->_catalogStartQ, 0);
  objc_storeStrong((id *)&self->_subchunkEndQ, 0);
  objc_storeStrong((id *)&self->_subchunkStartQ, 0);
}

- (NSMutableArray)oversizeChunks
{
  return self->_oversizeChunks;
}

@end