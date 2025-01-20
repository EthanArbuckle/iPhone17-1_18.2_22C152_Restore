@interface TermIndex
- (BOOL)compact;
- (BOOL)coreSpotlight;
- (TermIndex)init;
- (TermIndex)initWithIndex:(__SI *)a3 cindex:(int64_t)a4 atPath:(const char *)a5 coreSpotlight:(BOOL)a6;
- (__SI)index;
- (const)name;
- (int)flags;
- (int)postings_fd;
- (unint64_t)base;
- (unint64_t)cindex;
- (unint64_t)doc_ids;
- (unint64_t)doc_ids_limit;
- (unint64_t)doc_ids_map_size;
- (unint64_t)groups_limit;
- (unint64_t)groups_map_size;
- (unint64_t)oidForDocID:(unsigned int)a3;
- (unint64_t)postingCount:(unint64_t)a3;
- (unint64_t)postings_size;
- (unint64_t)term_ids;
- (unint64_t)term_ids_limit;
- (unint64_t)term_ids_map_size;
- (unsigned)groupForDocID:(unsigned int)a3;
- (void)dealloc;
- (void)directoryStoreIterate:(id)a3;
- (void)docIDsIterate:(id)a3;
- (void)getPostings:(unint64_t)a3 block:(id)a4;
- (void)getTerms:(id)a3;
- (void)groups;
@end

@implementation TermIndex

- (TermIndex)init
{
  v3.receiver = self;
  v3.super_class = (Class)TermIndex;
  result = [(TermIndex *)&v3 init];
  if (result)
  {
    result->_postings_fd = -1;
    result->_doc_ids = (unint64_t *)-1;
    result->_term_ids = (unint64_t *)-1;
    result->_groups = (void *)-1;
  }
  return result;
}

- (TermIndex)initWithIndex:(__SI *)a3 cindex:(int64_t)a4 atPath:(const char *)a5 coreSpotlight:(BOOL)a6
{
  v10 = [(TermIndex *)self init];
  v11 = v10;
  if (v10)
  {
    v10->_index = a3;
    v10->_cindex = a4;
    uint64_t v12 = sub_10001E228((uint64_t)a3, a4);
    v13 = "";
    if (v12) {
      v13 = (const char *)v12;
    }
    v11->_name = v13;
    v11->_flags = sub_10001E2D0((uint64_t)a3, a4);
    v11->_base = sub_10001E2B0((uint64_t)a3, a4);
    v11->_coreSpotlight = a6;
    bzero(__str, 0x400uLL);
    memset(&v28, 0, sizeof(v28));
    snprintf(__str, 0x400uLL, "%s/%sindexPostings", a5, v11->_name);
    int v14 = open(__str, 0);
    v11->_postings_fd = v14;
    if (sub_10001D898(v14, &v28) != -1) {
      v11->_postings_size = v28.st_size;
    }
    snprintf(__str, 0x400uLL, "%s/%sindexTermIds", a5, v11->_name);
    int v15 = open(__str, 0);
    if (v15 != -1)
    {
      int v16 = v15;
      if (sub_10001D1D8(__str, &v28) != -1)
      {
        v17 = (unint64_t *)mmap(0, v28.st_size, 1, 1, v16, 0);
        v11->_term_ids = v17;
        if (v17 != (unint64_t *)-1)
        {
          off_t st_size = v28.st_size;
          v11->_term_ids_limit = (unint64_t)v28.st_size >> 3;
          v11->_term_ids_map_size = st_size;
        }
      }
      close(v16);
    }
    snprintf(__str, 0x400uLL, "%s/%sindexIds", a5, v11->_name);
    int v19 = open(__str, 0);
    if (v19 != -1)
    {
      int v20 = v19;
      if (sub_10001D1D8(__str, &v28) != -1)
      {
        v21 = (unint64_t *)mmap(0, v28.st_size, 1, 1, v20, 0);
        v11->_doc_ids = v21;
        if (v21 != (unint64_t *)-1)
        {
          off_t v22 = v28.st_size;
          v11->_doc_ids_limit = (unint64_t)v28.st_size >> 3;
          v11->_doc_ids_map_size = v22;
        }
      }
      close(v20);
    }
    snprintf(__str, 0x400uLL, "%s/%sindexGroups", a5, v11->_name);
    int v23 = open(__str, 0);
    if (v23 != -1)
    {
      int v24 = v23;
      if (sub_10001D1D8(__str, &v28) != -1)
      {
        v25 = mmap(0, v28.st_size, 1, 1, v24, 0);
        v11->_groups = v25;
        if (v25 != (void *)-1)
        {
          off_t v26 = v28.st_size;
          v11->_groups_limit = (unint64_t)v28.st_size >> 3;
          v11->_groups_map_size = v26;
        }
      }
      close(v24);
    }
  }
  return v11;
}

- (void)dealloc
{
  close([(TermIndex *)self postings_fd]);
  if ([(TermIndex *)self term_ids_map_size]) {
    munmap([(TermIndex *)self term_ids], [(TermIndex *)self term_ids_map_size]);
  }
  if ([(TermIndex *)self groups_map_size]) {
    munmap([(TermIndex *)self groups], [(TermIndex *)self groups_map_size]);
  }
  if ([(TermIndex *)self doc_ids_map_size]) {
    munmap([(TermIndex *)self doc_ids], [(TermIndex *)self doc_ids_map_size]);
  }
  v3.receiver = self;
  v3.super_class = (Class)TermIndex;
  [(TermIndex *)&v3 dealloc];
}

- (BOOL)compact
{
  return (LOBYTE(self->_flags) >> 2) & 1;
}

- (unint64_t)oidForDocID:(unsigned int)a3
{
  if (a3 && self->_doc_ids_limit > a3) {
    return self->_doc_ids[a3];
  }
  else {
    return 0;
  }
}

- (unsigned)groupForDocID:(unsigned int)a3
{
  groups = self->_groups;
  if (!groups) {
    goto LABEL_7;
  }
  if (!self->_coreSpotlight)
  {
    if (self->_groups_map_size > (4 * a3 + 4) / 5uLL) {
      return (groups[a3 / 5uLL] >> (6 * (a3 % 5))) & 0x3F;
    }
LABEL_7:
    LOBYTE(v4) = 0;
    return v4;
  }
  if (self->_groups_map_size <= a3) {
    goto LABEL_7;
  }
  LOBYTE(v4) = *((unsigned char *)groups + a3);
  return v4;
}

- (void)directoryStoreIterate:(id)a3
{
  id v4 = a3;
  [(TermIndex *)self term_ids];
  [(TermIndex *)self term_ids_limit];
  [(TermIndex *)self term_ids_map_size];
  [(TermIndex *)self compact];
  v6 = v4;
  id v5 = v4;
  _SIDirectoryStoreIterate();
}

- (unint64_t)postingCount:(unint64_t)a3
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000C164;
  v5[3] = &unk_100034F98;
  v5[4] = &v6;
  [(TermIndex *)self getPostings:a3 block:v5];
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)getPostings:(unint64_t)a3 block:(id)a4
{
  id v5 = a4;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  int v15 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000C308;
  v12[3] = &unk_100034FC0;
  v12[4] = v14;
  unsigned __int8 v13 = [(TermIndex *)self compact];
  uint64_t v6 = objc_retainBlock(v12);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000C378;
  v10[3] = &unk_100034FE8;
  id v7 = v5;
  id v11 = v7;
  uint64_t v8 = objc_retainBlock(v10);
  uint64_t v9 = sub_10001CA8C([(TermIndex *)self postings_fd], [(TermIndex *)self base], (uint64_t)v6, (uint64_t)v8);
  sub_10001CAEC();
  j__free(v9);

  _Block_object_dispose(v14, 8);
}

- (void)getTerms:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  _SITermIndexIterate();
}

- (void)docIDsIterate:(id)a3
{
  id v4 = (void (**)(id, unint64_t, unint64_t, void, char *))a3;
  char v8 = 0;
  unint64_t doc_ids_limit = self->_doc_ids_limit;
  if (doc_ids_limit >= 2)
  {
    for (unint64_t i = 1; i < doc_ids_limit; ++i)
    {
      unint64_t v7 = self->_doc_ids[i];
      if (v7)
      {
        v4[2](v4, i, v7, [(TermIndex *)self groupForDocID:i], &v8);
        unint64_t doc_ids_limit = self->_doc_ids_limit;
      }
    }
  }
}

- (__SI)index
{
  return self->_index;
}

- (unint64_t)cindex
{
  return self->_cindex;
}

- (unint64_t)base
{
  return self->_base;
}

- (int)flags
{
  return self->_flags;
}

- (const)name
{
  return self->_name;
}

- (int)postings_fd
{
  return self->_postings_fd;
}

- (unint64_t)postings_size
{
  return self->_postings_size;
}

- (unint64_t)term_ids
{
  return self->_term_ids;
}

- (unint64_t)term_ids_limit
{
  return self->_term_ids_limit;
}

- (unint64_t)term_ids_map_size
{
  return self->_term_ids_map_size;
}

- (unint64_t)doc_ids
{
  return self->_doc_ids;
}

- (unint64_t)doc_ids_limit
{
  return self->_doc_ids_limit;
}

- (unint64_t)doc_ids_map_size
{
  return self->_doc_ids_map_size;
}

- (void)groups
{
  return self->_groups;
}

- (unint64_t)groups_limit
{
  return self->_groups_limit;
}

- (unint64_t)groups_map_size
{
  return self->_groups_map_size;
}

- (BOOL)coreSpotlight
{
  return self->_coreSpotlight;
}

@end