@interface SKGActivityJournalDecoder
+ (void)SKGActivityJournalPlayback:(const char *)a3 block:(id)a4;
+ (void)_SKGActivityDump:(id)a3 dst:(__sFILE *)a4;
+ (void)_SKGEmbeddingTimeline:(id)a3 includePerf:(BOOL)a4 block:(id)a5;
+ (void)_SKGEmbeddingTimelineDump:(id)a3 includePerf:(BOOL)a4 dst:(__sFILE *)a5;
+ (void)_SKGEmbeddingXPCTimeline:(id)a3 updater:(id)a4 block:(id)a5;
@end

@implementation SKGActivityJournalDecoder

+ (void)SKGActivityJournalPlayback:(const char *)a3 block:(id)a4
{
  v5 = (void (**)(id, _OWORD *))a4;
  unint64_t v37 = 0;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  int v6 = open(a3, 0);
  if (v6 == -1)
  {
    v29 = __stderrp;
    v30 = "### file open failed";
    size_t v31 = 20;
LABEL_61:
    fwrite(v30, v31, 1uLL, v29);
    goto LABEL_62;
  }
  int v7 = v6;
  int64_t v8 = lseek(v6, 0, 2);
  v9 = (char *)mmap(0, v8, 1, 1, v7, 0);
  close(v7);
  if (v9 == (char *)-1)
  {
    v29 = __stderrp;
    v30 = "### mmap failed";
    size_t v31 = 15;
    goto LABEL_61;
  }
  if (v8 >= 1)
  {
    uint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = v10 + 1;
      unsigned int v12 = v9[v10];
      if (v9[v10] < 0)
      {
        if (v12 > 0xBF)
        {
          if (v12 > 0xDF)
          {
            if (v12 > 0xEF)
            {
              unsigned int v12 = *(_DWORD *)&v9[v11];
              uint64_t v11 = v10 + 5;
            }
            else
            {
              unsigned int v12 = ((v12 & 0xF) << 24) | (v9[v11] << 16) | (v9[v10 + 2] << 8) | v9[v10 + 3];
              uint64_t v11 = v10 + 4;
            }
          }
          else
          {
            unsigned int v12 = ((v12 & 0x1F) << 16) | (v9[v11] << 8) | v9[v10 + 2];
            uint64_t v11 = v10 + 3;
          }
        }
        else
        {
          int v13 = v9[v11] | ((v12 & 0x3F) << 8);
          uint64_t v11 = v10 + 2;
          unsigned int v12 = v13;
        }
      }
      uint64_t v32 = v11;
      int v14 = v12 & 1;
      BYTE4(v34) = v12 & 1;
      uint64_t v15 = (v12 >> 1) & 0x3FFFFFFF;
      LODWORD(v33) = (v12 >> 1) & 0x3FFFFFFF;
      if ((v12 & 0x80000000) == 0) {
        break;
      }
      int v19 = DWORD2(v34);
      if (v19 == sub_100015F10((v12 >> 1) & 0x3FFFFFFF)) {
        goto LABEL_54;
      }
      fprintf(__stderrp, "### mismatch repeat event %d at offset %ld\n", v15, v11);
LABEL_57:
      uint64_t v10 = v32;
      if (v32 >= v8) {
        goto LABEL_58;
      }
    }
    if ((v12 & 1) != 0 && sub_100016060((v12 >> 1) & 0x3FFFFFFF)) {
      *((double *)&v33 + 1) = (double)sub_1000117F4((uint64_t)v9, &v32);
    }
    switch(sub_100015F10(v15))
    {
      case 1u:
        uint64_t v20 = v32 + 1;
        unsigned int v21 = v9[v32];
        if (v9[v32] < 0)
        {
          if (v21 > 0xBF)
          {
            if (v21 > 0xDF)
            {
              if (v21 > 0xEF)
              {
                unsigned int v21 = *(_DWORD *)&v9[v20];
                uint64_t v20 = v32 + 5;
              }
              else
              {
                unsigned int v21 = ((v21 & 0xF) << 24) | (v9[v20] << 16) | (v9[v32 + 2] << 8) | v9[v32 + 3];
                uint64_t v20 = v32 + 4;
              }
            }
            else
            {
              unsigned int v21 = ((v21 & 0x1F) << 16) | (v9[v20] << 8) | v9[v32 + 2];
              uint64_t v20 = v32 + 3;
            }
          }
          else
          {
            int v22 = v9[v20] | ((v21 & 0x3F) << 8);
            uint64_t v20 = v32 + 2;
            unsigned int v21 = v22;
          }
        }
        uint64_t v32 = v20;
        LODWORD(v35) = v21;
        *((double *)&v35 + 1) = (double)sub_1000117F4((uint64_t)v9, &v32);
        goto LABEL_51;
      case 2u:
        *(double *)&long long v35 = (double)sub_1000117F4((uint64_t)v9, &v32);
        *((void *)&v35 + 1) = sub_1000117F4((uint64_t)v9, &v32);
        goto LABEL_31;
      case 3u:
        size_t v23 = v32;
        v24 = &v9[v32];
        *(void *)&long long v35 = &v9[v32];
        goto LABEL_53;
      case 4u:
        if (v14)
        {
          *(void *)&long long v35 = &v9[v32];
          size_t v25 = v32 + strlen(&v9[v32]) + 1;
          *((void *)&v35 + 1) = &v9[v25];
          uint64_t v32 = v25 + strlen(&v9[v25]) + 1;
        }
LABEL_31:
        *(void *)&long long v36 = sub_1000117F4((uint64_t)v9, &v32);
        break;
      case 5u:
        *(double *)&long long v35 = (double)sub_1000117F4((uint64_t)v9, &v32);
        break;
      case 6u:
      case 0xAu:
        uint64_t v16 = v32 + 1;
        unsigned int v17 = v9[v32];
        if (v9[v32] < 0)
        {
          if (v17 > 0xBF)
          {
            if (v17 > 0xDF)
            {
              if (v17 > 0xEF)
              {
                unsigned int v17 = *(_DWORD *)&v9[v16];
                uint64_t v16 = v32 + 5;
              }
              else
              {
                unsigned int v17 = ((v17 & 0xF) << 24) | (v9[v16] << 16) | (v9[v32 + 2] << 8) | v9[v32 + 3];
                uint64_t v16 = v32 + 4;
              }
            }
            else
            {
              unsigned int v17 = ((v17 & 0x1F) << 16) | (v9[v16] << 8) | v9[v32 + 2];
              uint64_t v16 = v32 + 3;
            }
          }
          else
          {
            int v18 = v9[v16] | ((v17 & 0x3F) << 8);
            uint64_t v16 = v32 + 2;
            unsigned int v17 = v18;
          }
        }
        uint64_t v32 = v16;
        LODWORD(v34) = v17;
        break;
      case 7u:
        *(void *)&long long v35 = &v9[v32];
        size_t v26 = v32 + strlen(&v9[v32]) + 1;
        *((void *)&v35 + 1) = &v9[v26];
        uint64_t v32 = v26 + strlen(&v9[v26]) + 1;
        unint64_t v27 = sub_1000117F4((uint64_t)v9, &v32);
        size_t v23 = v32;
        *(void *)&long long v36 = v27;
        *((void *)&v36 + 1) = &v9[v32];
        v24 = &v9[v32];
        goto LABEL_53;
      case 8u:
        *(double *)&long long v35 = (double)sub_1000117F4((uint64_t)v9, &v32);
        *((void *)&v35 + 1) = sub_1000117F4((uint64_t)v9, &v32);
        *(void *)&long long v36 = "";
        if (v15 == 20 || v15 == 47)
        {
          size_t v23 = v32;
          if (v9[v32] != 47) {
            break;
          }
        }
        else
        {
LABEL_51:
          size_t v23 = v32;
        }
LABEL_52:
        v24 = &v9[v23];
        *(void *)&long long v36 = &v9[v23];
LABEL_53:
        uint64_t v32 = v23 + strlen(v24) + 1;
        break;
      case 9u:
        break;
      case 0xBu:
        *(double *)&long long v35 = (double)sub_1000117F4((uint64_t)v9, &v32);
        *((void *)&v36 + 1) = sub_1000117F4((uint64_t)v9, &v32);
        unint64_t v37 = sub_1000117F4((uint64_t)v9, &v32);
        *((void *)&v35 + 1) = &v9[v32];
        size_t v23 = v32 + strlen(&v9[v32]) + 1;
        goto LABEL_52;
      default:
        fprintf(__stderrp, "### unknown type %d at offset %ld\n", v15, v32);
        uint64_t v32 = v8;
        goto LABEL_57;
    }
LABEL_54:
    v5[2](v5, &v33);
    int v28 = v33;
    if (v33 > 0x33 || ((1 << v33) & 0xC000000020000) == 0)
    {
      DWORD2(v34) = sub_100015F10(v33);
      HIDWORD(v34) = v28;
    }
    goto LABEL_57;
  }
LABEL_58:
  munmap(v9, v8);
LABEL_62:
}

+ (void)_SKGEmbeddingTimeline:(id)a3 includePerf:(BOOL)a4 block:(id)a5
{
  id v8 = a3;
  v9 = (char *)a5;
  uint64_t v76 = 0;
  v77 = &v76;
  uint64_t v78 = 0x7810000000;
  v79 = &unk_1000C6D0D;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  uint64_t v85 = 0;
  LOBYTE(v84) = 1;
  uint64_t v66 = 0;
  v67 = &v66;
  uint64_t v68 = 0x7810000000;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  v69 = &unk_1000C6D0D;
  uint64_t v75 = 0;
  id v10 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v62 = 0;
  v63 = &v62;
  uint64_t v64 = 0x2020000000;
  uint64_t v65 = 0;
  uint64_t v58 = 0;
  v59 = (double *)&v58;
  uint64_t v60 = 0x2020000000;
  uint64_t v61 = 0;
  id v11 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v54 = 0;
  v55 = &v54;
  uint64_t v56 = 0x2020000000;
  uint64_t v57 = 0;
  uint64_t v50 = 0;
  v51 = (double *)&v50;
  uint64_t v52 = 0x2020000000;
  uint64_t v53 = 0;
  unsigned int v12 = objc_alloc_init(EventCollector);
  int v13 = objc_alloc_init(EventCollector);
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x2020000000;
  char v49 = 1;
  int v14 = (void (**)(char *, char *))(v9 + 16);
  (*((void (**)(char *, const char *))v9 + 2))(v9, "Type, from_date_time, to_date_time, elapsed_time_secs, handled, skipped, processed, indexed, index_error, index_timeout, efficiency(max 36k/h), cancelFlag");
  id v15 = v8;
  id v16 = [v15 UTF8String];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10001680C;
  v32[3] = &unk_1000D96F8;
  v38 = &v76;
  v39 = &v66;
  id v17 = v10;
  id v33 = v17;
  v40 = &v58;
  v41 = &v62;
  int v18 = v9;
  unint64_t v37 = v18;
  BOOL v45 = a4;
  int v19 = v12;
  long long v34 = v19;
  v42 = &v46;
  id v20 = v11;
  id v35 = v20;
  v43 = &v50;
  v44 = &v54;
  unsigned int v21 = v13;
  long long v36 = v21;
  [a1 SKGActivityJournalPlayback:v16 block:v32];
  if (!*((unsigned char *)v47 + 24))
  {
    bzero(v86, 0x400uLL);
    sub_100016E48((uint64_t)(v77 + 4), v86);
    (*v14)(v18, v86);
    sub_100016E48((uint64_t)(v67 + 4), v86);
    (*v14)(v18, v86);
  }
  int v22 = [(EventCollector *)v19 collectedData];
  BOOL v23 = [v22 count] == 0;

  if (!v23)
  {
    (*v14)(v18, "---------------Profiling---------------");
    [(EventCollector *)v19 printResultsWithBlock:v18];
    (*v14)(v18, "------------------end------------------");
  }
  (*v14)(v18, "");
  v24 = [(EventCollector *)v21 collectedData];
  BOOL v25 = [v24 count] == 0;

  if (!v25)
  {
    (*v14)(v18, "---------------Profiling---------------");
    [(EventCollector *)v21 printResultsWithBlock:v18];
    (*v14)(v18, "------------------end------------------");
  }
  (*v14)(v18, "");
  bzero(v86, 0x400uLL);
  uint64_t v31 = 0;
  memset(v30, 0, sizeof(v30));
  sub_100016FEC(v17, (uint64_t)v30);
  (*v14)(v18, "---------------BG Task Emb Efficiency---------------");
  __sprintf_chk(v86, 0, 0x400uLL, "Total BG embeddings generated: %llu", v63[3]);
  (*v14)(v18, v86);
  __sprintf_chk(v86, 0, 0x400uLL, "Total BG runtime granted: %fs", v59[3]);
  (*v14)(v18, v86);
  double v26 = (double)(unint64_t)v63[3] / v59[3] * 60.0 * 60.0;
  __sprintf_chk(v86, 0, 0x400uLL, "Overall BG emb throughput(items/hr): %.2f", v26);
  (*v14)(v18, v86);
  __sprintf_chk(v86, 0, 0x400uLL, "Overall BG emb efficiency(max 36k): %.2f", v26 / 36000.0);
  (*v14)(v18, v86);
  (*v14)(v18, "");
  sub_100017124((double *)v30, v18);
  (*v14)(v18, "---------------BG Task Emb Efficiency End---------------\n");
  uint64_t v29 = 0;
  memset(v28, 0, sizeof(v28));
  sub_100016FEC(v20, (uint64_t)v28);
  (*v14)(v18, "---------------PRI Task Emb Efficiency---------------");
  __sprintf_chk(v86, 0, 0x400uLL, "Total PRI embeddings generated: %llu", v55[3]);
  (*v14)(v18, v86);
  __sprintf_chk(v86, 0, 0x400uLL, "Total PRI runtime granted: %fs", v51[3]);
  (*v14)(v18, v86);
  double v27 = (double)(unint64_t)v55[3] / v51[3] * 60.0 * 60.0;
  __sprintf_chk(v86, 0, 0x400uLL, "Overall PRI emb throughput(items/hr): %.2f", v27);
  (*v14)(v18, v86);
  __sprintf_chk(v86, 0, 0x400uLL, "Overall PRI emb efficiency(max 36k): %.2f", v27 / 36000.0);
  (*v14)(v18, v86);
  (*v14)(v18, "");
  sub_100017124((double *)v28, v18);
  (*v14)(v18, "---------------PRI Task Emb Efficiency End---------------\n");

  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v54, 8);

  _Block_object_dispose(&v58, 8);
  _Block_object_dispose(&v62, 8);

  _Block_object_dispose(&v66, 8);
  _Block_object_dispose(&v76, 8);
}

+ (void)_SKGEmbeddingXPCTimeline:(id)a3 updater:(id)a4 block:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  id v11 = sub_100017688();
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = sub_1000125D0;
  v34[4] = sub_100012500;
  id v35 = 0;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = sub_1000125D0;
  void v32[4] = sub_100012500;
  id v33 = 0;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  char v31 = 1;
  unsigned int v12 = +[NSMutableDictionary dictionary];
  int v13 = +[NSString stringWithFormat:@"%20s %10s %10s %10s %10s %10s", "timestamp", "cp_a", "cp_b", "cp_c", "cp_cx", "Priority"];
  v10[2](v10, v13);
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = sub_1000125D0;
  _OWORD v28[4] = sub_100012500;
  id v29 = 0;
  id v14 = v8;
  id v15 = [v14 UTF8String];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000176E4;
  v19[3] = &unk_1000D9720;
  double v27 = v11;
  id v16 = v12;
  id v20 = v16;
  BOOL v23 = v28;
  id v17 = v10;
  int v22 = v17;
  v24 = v30;
  BOOL v25 = v34;
  double v26 = v32;
  id v18 = v9;
  id v21 = v18;
  [a1 SKGActivityJournalPlayback:v15 block:v19];

  _Block_object_dispose(v28, 8);
  _Block_object_dispose(v30, 8);
  _Block_object_dispose(v32, 8);

  _Block_object_dispose(v34, 8);
}

+ (void)_SKGEmbeddingTimelineDump:(id)a3 includePerf:(BOOL)a4 dst:(__sFILE *)a5
{
  BOOL v6 = a4;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100017C00;
  v11[3] = &unk_1000D9740;
  v11[4] = a5;
  id v8 = a3;
  [a1 _SKGEmbeddingTimeline:v8 includePerf:v6 block:v11];
  fwrite("------------------------- Embedding Journal Queue Timeline -------------------------------\n", 0x5BuLL, 1uLL, a5);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100017C48;
  v10[3] = &unk_1000D9760;
  v10[4] = a5;
  [a1 _SKGEmbeddingXPCTimeline:v8 updater:@"embedding" block:v10];
  fwrite("------------------------- Priority Journal Queue Timeline -------------------------------\n", 0x5AuLL, 1uLL, a5);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100017C98;
  v9[3] = &unk_1000D9760;
  v9[4] = a5;
  [a1 _SKGEmbeddingXPCTimeline:v8 updater:@"priority" block:v9];
}

+ (void)_SKGActivityDump:(id)a3 dst:(__sFILE *)a4
{
  id v6 = a3;
  int v7 = sub_100017688();
  uint64_t v18 = 0;
  int v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  id v8 = v6;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100017E6C;
  v9[3] = &unk_1000D9788;
  v9[7] = a4;
  v9[8] = v7;
  v9[4] = &v10;
  void v9[5] = &v18;
  v9[6] = &v14;
  objc_msgSend(a1, "SKGActivityJournalPlayback:block:", objc_msgSend(v8, "UTF8String"), v9);
  fprintf(a4, "\nTotal: embCountFromPriorityUpdater:%llu priorityCountFromPriorityUpdater:%llu skipCountFromPriorityUpdater:%llu \n", v19[3], v15[3], v11[3]);
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
}

@end